# CAPE Question Bank Review App — Implementation Plan

## 0. What you're building

A pipeline + app that lets any number of reviewers flip through every extracted CAPE question (Paper 1 and Paper 2, across all subjects/years), see it rendered exactly as it will appear to a student (LaTeX equations, answer choices, diagrams), and each independently mark a question as "correct" or "needs fix" with an optional note — feeding a data-quality loop back into your source of truth, plus a web tool for loading and fixing the underlying data.

**Components:**
1. **Cloudflare D1** — canonical database for questions, choices, diagrams, and a full multi-reviewer review history.
2. **ETL script** (Python, one-time + repeatable) — reads your `Cape_P1_s.xlsx` / `Cape_P2_s.xlsx` workbooks and loads D1.
3. **Cloudflare Worker (API)** — REST layer both front ends talk to; proxies images live from Google Drive (no copy stored anywhere else) with edge caching.
4. **Google Drive** — the one and only image store (matches your existing `Diagrams` sheet paths); nothing is mirrored into R2, KV, or any other bucket.
5. **Web admin UI** (Cloudflare Pages) — upload a CSV/XLSX to load or fix a paper, browse/edit questions in a table, delete an entire paper and re-upload a corrected version.
6. **iOS app (SwiftUI + LaTeXSwiftUI)** — renders question/answers using your exact `LaTeX(...).parsingMode(.onlyEquations)` pattern, with Paper 1 and Paper 2 layouts, Prev/Next navigation, and review controls that support multiple reviewers working the same question bank in parallel.

---

## 1. Data model (Cloudflare D1 / SQLite)

Both papers share a spine (exam metadata + question text + diagram) but diverge on answers (P1 has 4 MCQ options with their own diagrams; P2 has parts/subparts and marks, no options). One `questions` table with nullable paper-2-only and paper-1-only columns, plus a child `choices` table, keeps this clean and query-friendly.

```sql
-- schema.sql

CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE          -- e.g. "AccountingU1", "PureMathematicsU2"
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_workbook TEXT NOT NULL,     -- 'P1' or 'P2'
    source_sheet TEXT NOT NULL,        -- original sheet name, for traceability
    exam TEXT NOT NULL,                -- 'CAPE'
    subject_id INTEGER NOT NULL REFERENCES subjects(id),
    month TEXT,
    year INTEGER,
    paper INTEGER NOT NULL,            -- 1 or 2
    number INTEGER NOT NULL,           -- question number
    part TEXT,                         -- P2 only: 'a','b'...
    subpart TEXT,                      -- P2 only: 'i','ii'...
    section TEXT,
    topic TEXT,
    difficulty TEXT,
    marks REAL,                        -- P2 only
    correct_choice TEXT,               -- P1 only: 'A'|'B'|'C'|'D'
    question_raw TEXT NOT NULL,        -- plain LaTeX-ish string (the "Question" column)
    question_code TEXT NOT NULL,       -- the "Validated Question Code" swift-ready string
    question_diagram_key TEXT,         -- e.g. cape_accountingu1_may_2017_1_1 (Drive lookup key)
    diagram_present INTEGER DEFAULT 0,
    -- Denormalized review summary, kept in sync by the review endpoint (source of truth is `reviews` below)
    review_count INTEGER DEFAULT 0,
    latest_review_status TEXT DEFAULT 'unreviewed',  -- 'unreviewed' | 'correct' | 'needs_fix'
    has_conflicting_reviews INTEGER DEFAULT 0,        -- 1 if reviewers disagree on the latest verdict
    created_at TEXT DEFAULT (datetime('now')),
    UNIQUE(source_workbook, subject_id, month, year, paper, number, part, subpart)
);

CREATE TABLE choices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    label TEXT NOT NULL,               -- 'A'..'D'
    answer_raw TEXT NOT NULL,
    answer_code TEXT NOT NULL,         -- swift-ready LaTeX(...) string
    diagram_key TEXT,                  -- e.g. cape_accountingu1_may_2017_1_1_a
    UNIQUE(question_id, label)
);

-- One row per reviewer per pass, so any number of people can independently review the same question.
CREATE TABLE reviewers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE           -- entered once in the app/admin UI, e.g. "Aria", "Marcus"
);

CREATE TABLE reviews (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    reviewer_id INTEGER NOT NULL REFERENCES reviewers(id),
    status TEXT NOT NULL,               -- 'correct' | 'needs_fix'
    note TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);
CREATE INDEX idx_reviews_question ON reviews(question_id, created_at);

CREATE TABLE diagrams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    diagram_key TEXT NOT NULL UNIQUE,  -- matches question_diagram_key / choices.diagram_key
    drive_path TEXT NOT NULL,          -- 'Diagrams/ChemistryU2/P2/2024/output/....png' (Corrected Path)
    drive_file_id TEXT,                -- Google Drive fileId, filled in by sync job
    status TEXT DEFAULT 'unknown',     -- from your "Status"/"Needs Fix" column
    last_synced_at TEXT
);

CREATE INDEX idx_questions_lookup ON questions(subject_id, paper, year, number);
CREATE INDEX idx_questions_review ON questions(latest_review_status);
CREATE INDEX idx_diagrams_key ON diagrams(diagram_key);
```

Notes:
- `question_code` / `answer_code` store your already-generated `LaTeX("...").parsingMode(.onlyEquations)` strings verbatim — the app can literally hand these to your `strings` array pattern, or (cleaner) you store just the raw LaTeX text and let SwiftUI apply `.parsingMode(.onlyEquations)` in code (recommended — see §6).
- `diagram_key` is the naming convention already in your sheets (`cape_accountingu1_may_2017_1_1`, `..._a` etc.) — reuse it as the join key to `diagrams`, and reuse the same convention for Paper 2's `Question Diagram Path Prefix`.
- `Diagrams` sheet's "Corrected Path" becomes `diagrams.drive_path`; "Status"/"Needs Fix"/"Review Needed" columns map to `diagrams.status`, giving you a second review queue (image-level, distinct from question-level).

---

## 2. ETL: Excel → D1

A Python script using `openpyxl` (read-only, `data_only=True`) walks every `Converted - *` sheet in both workbooks, normalizes rows, and emits SQL you load with `wrangler d1 execute`.

**Key transform decisions:**
- Sheet name → `subject` + implicit paper, e.g. `Converted - Accounting U1 2017` → subject `AccountingU1`, workbook P1. The `Subject`/`Paper` columns inside the sheet are the authoritative fields to actually use per-row (sheet name is just for traceability).
- Skip rows where the question column is blank (blank template rows exist at the sheet's max dimension, e.g. `A1:Z46` with only ~15 populated rows).
- P1: pull `Question`, `Answer A-D`, `Correct`, and build 4 `choices` rows; diagram keys come from `Question/A/B/C/D Diagram Path Prefix`.
- P2: pull `Question`, `Part`, `Subpart`, `Marks`; no choices rows; diagram key from `Question Diagram Path Prefix`.
- De-duplicate using the natural key (subject, month, year, paper, number, part, subpart) so re-running the ETL after you fix a spreadsheet row is an upsert, not a duplicate insert.

```python
# etl.py (skeleton)
import openpyxl, re, json, sys

PAPER1_SHEET_PREFIX = "Converted -"
OUT_SQL = "load_questions.sql"

def norm(v):
    if v is None: return None
    if isinstance(v, str): return v.strip()
    return v

def rows_from_p1(ws):
    headers = [c.value for c in next(ws.iter_rows(min_row=1, max_row=1))]
    idx = {h: i for i, h in enumerate(headers) if h}
    for row in ws.iter_rows(min_row=2, values_only=True):
        if not row[idx["Question"]]:
            continue
        yield {
            "exam": row[idx["Exam"]], "subject": row[idx["Subject"]],
            "month": row[idx["Month"]], "year": row[idx["Year"]],
            "paper": row[idx["Paper"]], "number": row[idx["Number"]],
            "section": row[idx.get("Section")] if "Section" in idx else None,
            "topic": row[idx.get("Topic")] if "Topic" in idx else None,
            "difficulty": row[idx.get("Difficulty")] if "Difficulty" in idx else None,
            "correct": row[idx.get("Correct")] if "Correct" in idx else None,
            "question": row[idx["Question"]],
            "q_diagram_key": row[idx.get("Question Diagram Path Prefix")],
            "diagram_present": row[idx.get("Diagram Present")],
            "choices": [
                {"label": L, "text": row[idx[f"Answer {L}"]],
                 "diagram_key": row[idx.get(f"{L} Diagram Path Prefix")]}
                for L in "ABCD" if idx.get(f"Answer {L}") is not None
            ],
        }

def rows_from_p2(ws):
    headers = [c.value for c in next(ws.iter_rows(min_row=1, max_row=1))]
    idx = {h: i for i, h in enumerate(headers) if h}
    for row in ws.iter_rows(min_row=2, values_only=True):
        if not row[idx["Question"]]:
            continue
        yield {
            "exam": row[idx["Exam"]], "subject": row[idx["Subject"]],
            "month": row[idx["Month"]], "year": row[idx["Year"]],
            "paper": row[idx["Paper"]], "number": row[idx["Number"]],
            "part": row[idx.get("Part")], "subpart": row[idx.get("Subpart")],
            "section": row[idx.get("Section")], "topic": row[idx.get("Topic")],
            "difficulty": row[idx.get("Difficulty")], "marks": row[idx.get("Marks")],
            "question": row[idx["Question"]],
            "q_diagram_key": row[idx.get("Question Diagram Path Prefix")],
        }

# main(): open both workbooks, iterate sheets starting with "Converted -",
# dispatch to rows_from_p1 / rows_from_p2 based on which workbook,
# escape + write parameterized INSERT ... ON CONFLICT DO UPDATE statements
# for `questions`, `choices`, and (from the P2 "Diagrams" sheet) `diagrams`.
```

Load into D1:
```bash
wrangler d1 execute cape-questions --file=schema.sql
wrangler d1 execute cape-questions --file=load_questions.sql
```

Because the ETL is idempotent (upsert on the natural key), you re-run it any time the spreadsheets change — this becomes your ongoing sync path, not a one-off migration.

---

## 3. Google Drive image integration

Your `Diagrams` sheet paths (`Diagrams/ChemistryU2/P2/2024/output/....png`) are Drive-relative paths. The iPhone app should **never** call the Google Drive API directly (OAuth on-device for a reviewer-only tool is unnecessary friction and a security liability). No mirroring/copying step, either — Drive stays the only place images live:

1. **Service account** with read-only access to the shared Drive folder.
2. A small **resolve job** (Cloudflare Worker Cron Trigger, or a script you run after each spreadsheet/paper update) that walks the Drive folder tree once and fills in `diagrams.drive_file_id` for each `drive_path` — this is just an ID lookup, nothing is downloaded or stored outside Drive.
3. At request time, the **Worker proxies live** to the Drive API (`GET https://www.googleapis.com/drive/v3/files/{drive_file_id}?alt=media`) using the service account token, and serves that straight through to the app at `GET /images/:diagram_key`.
4. To keep this fast without storing a copy anywhere, use the **Cache API** (`caches.default`) inside the Worker — an edge-local cache keyed by URL, with a `Cache-Control` header (e.g. `max-age=86400`). This is ephemeral edge caching, not a persistent store: if it's evicted, the Worker just re-fetches from Drive. No R2, no KV bucket of image bytes to keep in sync — Drive is the only durable copy, full stop.

This keeps Google Drive as your one and only source of truth for images (matches how your team already works) while the app only ever talks to your own Worker.

---

## 4. Cloudflare Worker API

```
GET  /subjects                              → list of subjects with paper1/paper2 counts
GET  /reviewers                              → list of known reviewer names (for a picker in the app)
GET  /questions?paper=1&subject=..&year=..&review_status=unreviewed&reviewer=..&cursor=..&limit=50
GET  /questions/:id                         → full question incl. choices, diagram keys, and review history
GET  /images/:diagram_key                   → binary image, live-proxied from Drive, edge-cached
POST /questions/:id/review                  → { reviewer, status: "correct"|"needs_fix", note }  (adds a new review row, doesn't overwrite)
GET  /stats                                 → reviewed vs unreviewed counts per subject/paper, plus conflict counts
```

`review_status=unreviewed` in the `/questions` filter means "no reviews yet **by this reviewer**" when a `reviewer` is also passed — so two people working the same subject don't just duplicate each other's work; each sees their own personal queue while still being free to re-review something a colleague already covered.

Auth: this is an internal review tool, not public-facing — a static bearer token (Worker secret, entered once in the app's settings/keychain) is sufficient; no need for full OAuth. It authenticates the *app*, not the individual — the `reviewer` field is how you distinguish people once several are using the same build.

```ts
// worker/src/index.ts (skeleton)
export default {
  async fetch(req: Request, env: Env): Promise<Response> {
    const url = new URL(req.url);
    if (req.headers.get("Authorization") !== `Bearer ${env.API_TOKEN}`)
      return new Response("Unauthorized", { status: 401 });

    if (url.pathname === "/questions" && req.method === "GET") {
      const paper = url.searchParams.get("paper");
      const subject = url.searchParams.get("subject");
      const status = url.searchParams.get("review_status");
      const reviewer = url.searchParams.get("reviewer");
      const limit = Number(url.searchParams.get("limit") ?? 50);
      const cursor = Number(url.searchParams.get("cursor") ?? 0);

      // "unreviewed by me": no row in `reviews` from this reviewer for this question yet
      const { results } = await env.DB.prepare(
        `SELECT q.*, s.name as subject_name FROM questions q
         JOIN subjects s ON s.id = q.subject_id
         WHERE (?1 IS NULL OR q.paper = ?1)
           AND (?2 IS NULL OR s.name = ?2)
           AND (
             ?3 IS NULL
             OR (?3 = 'unreviewed' AND ?4 IS NULL AND q.review_count = 0)
             OR (?3 = 'unreviewed' AND ?4 IS NOT NULL AND NOT EXISTS (
                   SELECT 1 FROM reviews r JOIN reviewers rv ON rv.id = r.reviewer_id
                   WHERE r.question_id = q.id AND rv.name = ?4))
             OR (?3 != 'unreviewed' AND q.latest_review_status = ?3)
           )
         ORDER BY q.id LIMIT ?5 OFFSET ?6`
      ).bind(paper, subject, status, reviewer, limit, cursor).all();

      return Response.json(results);
    }

    if (url.pathname.match(/^\/questions\/\d+$/) && req.method === "GET") {
      const id = url.pathname.split("/")[2];
      const question = await env.DB.prepare("SELECT * FROM questions WHERE id = ?").bind(id).first();
      const choices = await env.DB.prepare("SELECT * FROM choices WHERE question_id = ? ORDER BY label")
        .bind(id).all();
      const reviews = await env.DB.prepare(
        `SELECT rv.name as reviewer, r.status, r.note, r.created_at FROM reviews r
         JOIN reviewers rv ON rv.id = r.reviewer_id WHERE r.question_id = ? ORDER BY r.created_at DESC`
      ).bind(id).all();
      return Response.json({ ...question, choices: choices.results, reviews: reviews.results });
    }

    if (url.pathname.match(/^\/questions\/\d+\/review$/) && req.method === "POST") {
      const id = url.pathname.split("/")[2];
      const { reviewer, status, note } = await req.json();

      const reviewerRow = await env.DB.prepare(
        `INSERT INTO reviewers (name) VALUES (?) ON CONFLICT(name) DO UPDATE SET name=name RETURNING id`
      ).bind(reviewer).first();

      await env.DB.prepare(
        `INSERT INTO reviews (question_id, reviewer_id, status, note) VALUES (?, ?, ?, ?)`
      ).bind(id, reviewerRow.id, status, note ?? null).run();

      // Recompute the denormalized summary from full review history — cheap at this scale,
      // and guarantees `latest_review_status`/`has_conflicting_reviews` can never drift.
      const { results: recent } = await env.DB.prepare(
        `SELECT status FROM reviews WHERE question_id = ? ORDER BY created_at DESC LIMIT 2`
      ).bind(id).all();
      const latest = recent[0]?.status ?? "unreviewed";
      const conflict = recent.length > 1 && recent[1].status !== latest ? 1 : 0;

      await env.DB.prepare(
        `UPDATE questions SET review_count = review_count + 1, latest_review_status = ?, has_conflicting_reviews = ? WHERE id = ?`
      ).bind(latest, conflict, id).run();

      return Response.json({ ok: true });
    }

    if (url.pathname.startsWith("/images/")) {
      const key = url.pathname.split("/")[2];
      const cache = caches.default;
      const cacheKey = new Request(url.toString());
      let resp = await cache.match(cacheKey);
      if (!resp) {
        const diagram = await env.DB.prepare("SELECT drive_file_id FROM diagrams WHERE diagram_key = ?")
          .bind(key).first();
        if (!diagram?.drive_file_id) return new Response("Not found", { status: 404 });

        const driveResp = await fetch(
          `https://www.googleapis.com/drive/v3/files/${diagram.drive_file_id}?alt=media`,
          { headers: { Authorization: `Bearer ${await getDriveAccessToken(env)}` } }
        );
        resp = new Response(driveResp.body, {
          headers: { "Cache-Control": "public, max-age=86400", "Content-Type": driveResp.headers.get("Content-Type") ?? "image/png" },
        });
        await cache.put(cacheKey, resp.clone());
      }
      return resp;
    }

    return new Response("Not found", { status: 404 });
  },
};
```

`wrangler.toml` only needs a `d1_databases` binding for `DB` — no bucket bindings at all, since images are never stored outside Drive. `getDriveAccessToken` exchanges the service account's JSON key for a short-lived OAuth token (standard Google service-account flow), cached in-memory for the life of the Worker isolate.

---

## 5. Web Admin UI (spreadsheet import + paper management)

A second, separate front end from the iPhone review app: a browser-based admin tool for whoever maintains the question bank. It talks to the **same Worker API**, extended with an `/admin/*` route group. Its jobs:

1. **Upload a CSV or XLSX** of a paper (same column layout as your existing sheets) and load/replace it in D1.
2. **Browse and edit** individual question rows in a table.
3. **Delete an entire paper** (one subject/paper/year/month combo) and re-upload a fixed version.

### 5.1 Architecture

- **Static SPA** (plain HTML/JS, or React if you want richer table editing) hosted on **Cloudflare Pages**, in the same account/project as the Worker — no separate server to run.
- **Parsing happens client-side** using [SheetJS](https://sheetjs.com) (`xlsx` npm package), which reads both `.csv` and `.xlsx` in the browser — so the person uploading never needs to convert formats first, and the Worker only ever receives clean JSON, not binary spreadsheet files.
- **Auth**: put **Cloudflare Access** in front of the Pages site (and the Worker's `/admin/*` routes, via the same Access application) — you allow-list emails or a Google Workspace/GitHub login in the Cloudflare dashboard, and Access handles the login screen, session, and enforcement entirely at the edge. Zero auth code to write or maintain: no password hashing, no session tokens, no login endpoint. Anyone not on the allow-list is blocked before the request ever reaches Pages or the Worker.

### 5.2 New Worker endpoints

```
GET    /admin/papers                        → distinct (subject, paper, year, month) groups + question counts + review-progress
POST   /admin/import                        → { paper: 1|2, rows: [...] }  bulk upsert (same natural-key upsert logic as the ETL)
GET    /admin/questions?subject=&paper=&year=&month=&cursor=&limit=   → paginated raw rows for the edit table
PUT    /admin/questions/:id                 → edit one row's fields
DELETE /admin/questions/:id                 → delete one row (rare — usually you fix in place instead)
DELETE /admin/papers                        → { subject, paper, year, month }  deletes every question (and cascades to choices) for that exam sitting
```

No login endpoint and no auth code in the Worker at all — Cloudflare Access sits in front of the whole `/admin/*` path (and the Pages site) and blocks anyone not on the allow-list before the request reaches your code. The Worker route handlers can just assume every request that arrives has already been authenticated.

```ts
// worker/src/admin.ts (skeleton)

async function handleImport(req: Request, env: Env) {
  const { paper, rows } = await req.json<{ paper: 1 | 2; rows: Record<string, any>[] }>();
  const stmts = [];

  for (const row of rows) {
    if (!row.Question) continue; // skip blank template rows, same as the ETL

    const subjectId = await upsertSubject(env, row.Subject);
    const diagramKey = buildDiagramKey(row); // same convention as the Python ETL

    stmts.push(
      env.DB.prepare(`
        INSERT INTO questions (source_workbook, exam, subject_id, month, year, paper, number,
                                part, subpart, section, topic, difficulty, marks, correct_choice,
                                question_raw, question_code, question_diagram_key)
        VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
        ON CONFLICT(source_workbook, subject_id, month, year, paper, number, part, subpart)
        DO UPDATE SET question_raw=excluded.question_raw, question_code=excluded.question_code,
                      topic=excluded.topic, difficulty=excluded.difficulty, marks=excluded.marks,
                      correct_choice=excluded.correct_choice, question_diagram_key=excluded.question_diagram_key
      `).bind(paper === 1 ? "P1" : "P2", row.Exam, subjectId, row.Month, row.Year, paper,
               row.Number, row.Part ?? null, row.Subpart ?? null, row.Section ?? null,
               row.Topic ?? null, row.Difficulty ?? null, row.Marks ?? null,
               row.Correct ?? null, row.Question, row["Validated Question Code"], diagramKey)
    );
    // ...then upsert into `choices` for paper===1 the same way, one statement per label A–D
  }

  await env.DB.batch(stmts);
  return Response.json({ imported: rows.length });
}

async function handleDeletePaper(req: Request, env: Env) {
  const { subject, paper, year, month } = await req.json();
  const subjectId = await upsertSubject(env, subject);
  await env.DB.prepare(
    `DELETE FROM questions WHERE subject_id=? AND paper=? AND year=? AND month=?`
  ).bind(subjectId, paper, year, month).run(); // choices cascade via ON DELETE CASCADE
  return Response.json({ ok: true });
}
```

Setup is entirely in the Cloudflare dashboard, not code:
1. Create an **Access application** covering your Pages domain (and the Worker's route, if it's on a separate subdomain) under Zero Trust → Access → Applications.
2. Add a policy: allow-list the specific email addresses of whoever should have admin access (or a Google Workspace/GitHub group if you use one).
3. Choose a login method — email **One-Time PIN** requires nothing further to set up and is the simplest option; if you'd rather use existing Google/GitHub accounts, add that as an identity provider first.
4. That's it — visiting the Pages site now prompts for login before anything loads, and Access attaches a verified identity header (`Cf-Access-Authenticated-User-Email`) to every request reaching your Worker, which you can read for an audit trail (e.g. "who deleted this paper") without having built any of the verification yourself.

### 5.3 UI screens

- **Papers list** — one row per (subject, paper, year, month), with question count, review-completion %, and "Edit", "Delete & Reupload" actions. This is the natural home page: it mirrors how the source workbooks are organized (one exam sitting at a time). Cloudflare Access's login screen appears automatically before this ever loads — no login screen to build in the app itself.
- **Upload screen** — drag-and-drop a `.csv`/`.xlsx`, parsed client-side, shown as a **preview table** before committing: highlight rows missing a `Question`, duplicate natural keys within the file, or unrecognized subject names, so mistakes get caught before they hit D1. A "Confirm Import" button then posts to `/admin/import`.
- **Question editor** — a table (or one-row-at-a-time form, similar to the iPhone review layout but editable) bound to `GET /admin/questions`, with inline edits saving via `PUT /admin/questions/:id`. Worth rendering the LaTeX preview next to the raw text field here too, so editors can confirm a fix actually renders correctly before saving — you already have the LaTeX rendering logic from the iOS app; a lightweight JS LaTeX renderer (e.g. KaTeX) gives you the same preview in the browser.
- **Delete-paper confirmation** — a modal requiring the person to type the paper's label (e.g. `Accounting U1 May 2017`) to confirm, since this is destructive and cascades.

### 5.4 Reupload workflow

Because `questions` upserts on its natural key, the common case — "found a typo in 3 rows of a paper, fixed the master spreadsheet, need this reflected" — **doesn't require deleting anything**: just re-upload the corrected file through the same import screen and the matching rows update in place. "Delete entire paper" is for the less common case where the fix changes structure (renumbered questions, added/removed items) and you want a guaranteed clean slate rather than risking orphaned rows from the old numbering sitting alongside the new ones.

---

## 6. iOS app (SwiftUI + LaTeXSwiftUI)

Keeping your exact rendering pattern, extended to (a) pull from the API instead of a hard-coded array, (b) branch on paper type, (c) add review controls.

```swift
// Models.swift
struct Choice: Codable, Identifiable {
    let id: Int
    let label: String
    let answerRaw: String
    enum CodingKeys: String, CodingKey {
        case id, label
        case answerRaw = "answer_raw"
    }
}

struct Question: Codable, Identifiable {
    let id: Int
    let paper: Int
    let subjectName: String
    let number: Int
    let part: String?
    let subpart: String?
    let questionRaw: String
    let correctChoice: String?
    let latestReviewStatus: String
    let reviewCount: Int
    let hasConflictingReviews: Bool
    let choices: [Choice]?

    enum CodingKeys: String, CodingKey {
        case id, paper, number, part, subpart
        case subjectName = "subject_name"
        case questionRaw = "question_raw"
        case correctChoice = "correct_choice"
        case latestReviewStatus = "latest_review_status"
        case reviewCount = "review_count"
        case hasConflictingReviews = "has_conflicting_reviews"
        case choices
    }
}
```

```swift
// APIClient.swift
final class APIClient {
    static let base = URL(string: "https://cape-review.YOUR_SUBDOMAIN.workers.dev")!
    static let token = "YOUR_TOKEN" // store in Keychain, not hardcoded, before shipping

    /// `reviewer` scopes the "unreviewed" filter to this person's own queue, so multiple
    /// reviewers working the same subject don't just re-cover each other's already-seen questions.
    static func fetchQuestions(paper: Int, subject: String?, reviewer: String, reviewStatus: String = "unreviewed", cursor: Int, limit: Int = 50) async throws -> [Question] {
        var comps = URLComponents(url: base.appendingPathComponent("questions"), resolvingAgainstBaseURL: false)!
        comps.queryItems = [
            .init(name: "paper", value: String(paper)),
            .init(name: "reviewer", value: reviewer),
            .init(name: "review_status", value: reviewStatus),
            .init(name: "cursor", value: String(cursor)),
            .init(name: "limit", value: String(limit)),
        ]
        if let subject { comps.queryItems?.append(.init(name: "subject", value: subject)) }
        var req = URLRequest(url: comps.url!)
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: req)
        return try JSONDecoder().decode([Question].self, from: data)
    }

    static func submitReview(id: Int, reviewer: String, status: String, note: String?) async throws {
        var req = URLRequest(url: base.appendingPathComponent("questions/\(id)/review"))
        req.httpMethod = "POST"
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONEncoder().encode(["reviewer": reviewer, "status": status, "note": note ?? ""])
        _ = try await URLSession.shared.data(for: req)
    }
}
```

```swift
// ReviewView.swift — replaces your ContentView, keeping the same LaTeX pattern
import SwiftUI
import LaTeXSwiftUI

struct ReviewView: View {
    // Persisted once per device/person — this is how multiple reviewers are told apart.
    // A first-launch prompt (not shown here) should ask "What's your name?" and set this.
    @AppStorage("reviewerName") private var reviewerName = ""
    @State private var questions: [Question] = []
    @State private var currentIndex = 0
    @State private var reviewNote = ""

    var body: some View {
        VStack(spacing: 16) {
            if reviewerName.isEmpty {
                ReviewerNamePrompt(reviewerName: $reviewerName)
            } else if questions.isEmpty {
                ProgressView("Loading questions…")
            } else {
                let q = questions[currentIndex]

                Text("\(q.subjectName) · Paper \(q.paper) · Q\(q.number)\(q.part.map { "(\($0))" } ?? "")")
                    .font(.caption)
                    .foregroundColor(.gray)

                if q.reviewCount > 0 {
                    Text(q.hasConflictingReviews
                         ? "⚠️ \(q.reviewCount) reviews — reviewers disagree"
                         : "Reviewed \(q.reviewCount)×")
                        .font(.caption2)
                        .foregroundColor(q.hasConflictingReviews ? .orange : .secondary)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        LaTeX(q.questionRaw)
                            .parsingMode(.onlyEquations)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        DiagramView(questionID: q.id)

                        // Paper 1 only: render the 4 answer choices
                        if q.paper == 1, let choices = q.choices {
                            ForEach(choices) { choice in
                                HStack(alignment: .top) {
                                    Text("\(choice.label).").bold()
                                    LaTeX(choice.answerRaw)
                                        .parsingMode(.onlyEquations)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(8)
                                .background(
                                    choice.label == q.correctChoice
                                        ? Color.green.opacity(0.15)
                                        : Color.clear
                                )
                                .cornerRadius(6)
                            }
                        }
                    }
                    .padding()
                }

                ReviewControls(question: q, reviewer: reviewerName, note: $reviewNote) {
                    advance()
                }

                HStack {
                    Button("Previous") { if currentIndex > 0 { currentIndex -= 1 } }
                        .disabled(currentIndex == 0)
                    Spacer()
                    Text("\(currentIndex + 1) of \(questions.count)")
                        .font(.caption).foregroundColor(.gray)
                    Spacer()
                    Button("Next") { advance() }
                        .disabled(currentIndex == questions.count - 1)
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .task(id: reviewerName) {
            guard !reviewerName.isEmpty else { return }
            questions = (try? await APIClient.fetchQuestions(paper: 1, subject: nil, reviewer: reviewerName, cursor: 0)) ?? []
        }
    }

    private func advance() {
        reviewNote = ""
        if currentIndex < questions.count - 1 { currentIndex += 1 }
    }
}

// One-time prompt so the app knows who's reviewing — this is the whole "multi-reviewer" mechanism on the client side.
struct ReviewerNamePrompt: View {
    @Binding var reviewerName: String
    @State private var input = ""
    var body: some View {
        VStack(spacing: 12) {
            Text("Who's reviewing?").font(.headline)
            TextField("Your name", text: $input).textFieldStyle(.roundedBorder)
            Button("Continue") { reviewerName = input.trimmingCharacters(in: .whitespaces) }
                .disabled(input.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
    }
}

// Renders a diagram if one exists for this question, from the Worker's /images/:key endpoint
struct DiagramView: View {
    let questionID: Int
    var body: some View {
        AsyncImage(url: APIClient.base.appendingPathComponent("images/q_\(questionID)")) { phase in
            switch phase {
            case .success(let image): image.resizable().scaledToFit()
            case .failure: EmptyView()   // no diagram for this question — fail silently
            default: ProgressView()
            }
        }
    }
}

// Correct / Needs Fix buttons + optional note, posts to the review endpoint as this reviewer
struct ReviewControls: View {
    let question: Question
    let reviewer: String
    @Binding var note: String
    let onSubmitted: () -> Void

    var body: some View {
        VStack(spacing: 8) {
            TextField("Note (optional)", text: $note)
                .textFieldStyle(.roundedBorder)
            HStack {
                Button("✅ Correct") { submit(status: "correct") }
                    .buttonStyle(.borderedProminent).tint(.green)
                Button("⚠️ Needs Fix") { submit(status: "needs_fix") }
                    .buttonStyle(.borderedProminent).tint(.red)
            }
        }
    }

    private func submit(status: String) {
        Task {
            try? await APIClient.submitReview(id: question.id, reviewer: reviewer, status: status, note: note)
            onSubmitted()
        }
    }
}
```

**Paper 2** questions naturally fall out of the same view: `q.choices` is `nil`/empty, so the answer-choice `ForEach` block simply doesn't render, leaving just question text + diagram — matching your requirement exactly without a separate screen. You'll likely still want a subject/paper picker screen before `ReviewView` (a simple `List` calling `GET /subjects`), and a filter for `review_status=unreviewed` so reviewers aren't stuck re-reading questions they personally already covered — while still being free to browse and re-review anything, including questions a colleague has already weighed in on.

---

## 7. Review workflow

- Each reviewer identifies themselves once (a plain username typed into the app, stored via `@AppStorage`, **no password**) — every subsequent review they submit is tagged with that identity in the `reviews` table. This is deliberately lightweight: the app itself is already gated by the shared bearer token baked into the build (§4), so the username is for attribution between reviewers, not for keeping anyone out. Anyone with the username-only prompt can claim to be anyone else, which is an acceptable tradeoff for an internal review tool — don't rely on it for anything security-sensitive.
- Default queue = questions **not yet reviewed by the current person**, ordered by subject/year/number — reviewers work through it linearly with Prev/Next, and different reviewers can work the same subject in parallel without duplicating effort, since each has their own "unreviewed" view.
- Because `reviews` is a history table rather than a single overwritten field, the same question can be reviewed by several people. If their verdicts disagree, `has_conflicting_reviews` flags it — surface a small "reviewers disagree" indicator (shown in the SwiftUI snippet above) so someone can go look at the full review history (`GET /questions/:id`) and settle it.
- "Correct" and "Needs Fix" both advance to the next question automatically; "Needs Fix" should require (or strongly prompt for) a note, since that note is what tells you *what* to go fix back in the spreadsheet/pipeline.
- Add a `GET /stats` dashboard screen (or just query D1 directly) to track review progress per subject **and** per reviewer, plus a count of open conflicts — useful once you have hundreds of questions per subject across years and more than one person reviewing.
- Treat the P2 `Diagrams` sheet's own `Status`/`Review Needed` flags as a **second, independent review queue** at the diagram level — a diagram can be "fine" while its question text needs fixing, or vice versa. Don't conflate the two in one status field.

---

## 8. Suggested build order

1. **Schema + ETL first** — get both workbooks loading cleanly into a local D1 (`wrangler d1 execute --local`) before touching Drive or iOS. Validate row counts per subject match what you'd expect from the sheets.
2. **Worker API** against local D1 — test with `curl`/Postman until `/questions`, `/questions/:id`, `/review` behave correctly, including submitting reviews from two different reviewer names against the same question and confirming the conflict flag works.
3. **Drive live-proxy** (§3) — service account + resolve job to fill in `drive_file_id`, then the `/images/:key` proxy with edge caching. No mirroring step to build at all.
4. **Web admin UI** (§5) — this is arguably the highest-leverage piece to build early: once it's up, non-technical people can load and fix papers directly, and you can stop hand-running the Python ETL for every change. Start with just the upload + papers-list + delete-paper screens; add the inline question editor once the basics are solid.
5. **iOS app** — build the subject picker + `ReviewView` (with the reviewer-name prompt) against the deployed Worker; ship first as a personal/ad-hoc build (no App Store submission needed for an internal review tool — use Xcode's "Personal Team" signing or TestFlight internal testing) so it's easy to hand to several reviewers at once.
6. **Keep the Python ETL around as a bulk/CLI path** — useful for the initial migration of everything already in `Cape_P1_s.xlsx`/`Cape_P2_s.xlsx`, and as a scriptable alternative to the web UI for very large batch loads.

---

## 9. Open questions worth deciding before you build

- **Drive folder stability:** the ETL/sync's `diagram_key` → Drive path mapping depends on your `Diagrams` sheet's "Corrected Path" staying accurate; worth automating a periodic diff/reconciliation between the sheet and the actual Drive folder tree.
- **Conflict resolution ownership:** with multiple reviewers, decide who has final say when two people disagree on a question (e.g. a designated lead reviewer, or simply "most recent review wins" as already implemented) — this is a process decision more than a technical one.

---

## 10. Context (implementation log)

> This section records key decisions and deviations made during code generation. Updated as work progresses.

### 2026-07-25 — Initial code generation session

**Files created:**

| File | Purpose |
|------|---------|
| `tasklist.md` | Detailed 136-task build tracker across 7 phases |
| `.gitignore` | Covers Node, Python, Wrangler, Xcode, secrets |
| `README.md` | Full setup instructions, secrets reference, workflow docs |
| `db/schema.sql` | All 6 tables + 6 indexes (added `idx_reviewers_name` and `idx_reviews_reviewer` beyond plan for JOIN performance) |
| `etl/etl.py` | Full ETL script — P1/P2 parsers, Diagrams sheet parser, SQL emitters, CLI entry point |
| `etl/resolve_drive_ids.py` | Drive path → file ID resolver using service account JWT auth |
| `etl/requirements.txt` | `openpyxl`, `requests`, `google-auth` |
| `etl/README.md` | Usage docs for etl.py and resolve_drive_ids.py |
| `worker/package.json` | Cloudflare Workers + TypeScript deps |
| `worker/tsconfig.json` | Strict ES2022 TypeScript config |
| `worker/wrangler.toml` | D1 binding + secrets documentation |
| `worker/src/types.ts` | Env bindings, DB row shapes, request/response types |
| `worker/src/drive.ts` | Google service-account JWT→OAuth token + image proxy with edge caching |
| `worker/src/admin.ts` | All `/admin/*` handlers — papers, import, questions CRUD, paper delete |
| `worker/src/index.ts` | Main fetch handler — auth, CORS, all 7 public endpoints + admin routing |
| `admin-ui/style.css` | Premium dark-mode CSS with design tokens, glassmorphism, all component styles |
| `admin-ui/index.html` | SPA shell — all 4 views, modals, settings panel, toast container |
| `admin-ui/app.js` | Full UI logic — routing, API client, papers/upload/editor/stats views |
| `ios/FailBetter/Models.swift` | All Swift data models with custom decoder for D1's 0/1 Bool fields |
| `ios/FailBetter/APIClient.swift` | Full network layer — configurable URL+token, all endpoints, typed errors |
| `ios/FailBetter/ReviewView.swift` | Main flip-through UI with LaTeX rendering, pagination, P1/P2 branching |
| `ios/FailBetter/ReviewControls.swift` | Correct/Needs Fix buttons + note field with missing-note warning |
| `ios/FailBetter/DiagramView.swift` | AsyncImage from Worker proxy, silent on failure |
| `ios/FailBetter/ReviewerNamePrompt.swift` | First-launch identity screen |
| `ios/FailBetter/SubjectPickerView.swift` | Subject/paper picker with NavigationStack typed destinations |
| `ios/FailBetter/StatsView.swift` | Stats screen with per-subject progress bars and conflict counts |
| `ios/FailBetter/SettingsView.swift` | API config, reviewer name, connection test |
| `ios/FailBetter/FailBetterApp.swift` | `@main` entry point |

**Key design decisions made during implementation:**

1. **Two extra indexes added** (`idx_reviewers_name`, `idx_reviews_reviewer`) beyond the plan — the "unreviewed by me" subquery JOINs on `reviewers.name` and `reviews.reviewer_id` on every `/questions` request; without these indexes this becomes a full-table scan at scale.

2. **`answer_code` = `answer_raw` in the ETL** — the plan mentioned storing Swift-ready validated codes, but since validation happens in the iOS app via `.parsingMode(.onlyEquations)`, the ETL simply copies the raw text. The `answer_code` column is preserved for future use if pre-validation is added.

3. **`resolve_drive_ids.py` uses a JSON export workflow** rather than connecting directly to D1 — this avoids requiring `wrangler` in the Python environment and works cleanly with `wrangler d1 execute --json` output.

4. **Admin UI stores Worker URL + token in `localStorage`** — acceptable for an internal tool behind Cloudflare Access. The iOS app uses `@AppStorage` (which wraps `UserDefaults`); the README notes this should be moved to Keychain before wider distribution.

5. **iOS batch pagination** — `ReviewView` fetches 30 questions at a time and pre-fetches the next batch when the reviewer is within 5 questions of the end. This avoids a blank screen stall mid-session and keeps the initial load fast.

6. **Conflict detection uses the 2 most recent reviews** (not all-time majority vote). "Most recent review wins" as `latest_review_status`; `has_conflicting_reviews` is set if the two most recent reviews disagree. This matches the plan and is deliberate — it's a lightweight heuristic, not a formal voting system.

**What still requires user action (cannot be completed in code):**

- D1 database creation: `wrangler d1 create cape-questions` (paste returned ID into `worker/wrangler.toml`)
- Schema load + ETL run (requires the actual Excel workbooks)
- Worker secrets: `wrangler secret put API_TOKEN` and `wrangler secret put DRIVE_SERVICE_ACCOUNT_JSON`
- Google Cloud service account setup (Drive API, JSON key download, folder share)
- Xcode project creation + LaTeXSwiftUI SPM package add
- Cloudflare Pages deployment + Access email policy
- TestFlight internal testing setup