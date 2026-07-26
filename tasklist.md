# CAPE Question Bank Review App — Task List

> Legend: `[ ]` = todo · `[x]` = done · `[~]` = in progress · `[!]` = blocked

---

## Phase 1 — Project Scaffold & Schema

### 1.1 Repo / Folder Structure
- [x] Create `worker/` directory for Cloudflare Worker source
- [x] Create `worker/src/` for TypeScript source files
- [x] Create `etl/` directory for Python ETL script
- [x] Create `admin-ui/` directory for Web Admin UI
- [x] Create `ios/` directory placeholder (Xcode project lives here)
- [x] Create `db/` directory for SQL schema and migration files
- [x] Create root `README.md` with project overview and setup instructions
- [x] Create root `.gitignore` covering: `.wrangler/`, `node_modules/`, `__pycache__/`, `.env`, `*.pyc`, `dist/`

### 1.2 D1 Database Schema
- [x] Create `db/schema.sql` with all 6 tables:
  - [x] `subjects` table
  - [x] `questions` table (with all P1 + P2 nullable columns)
  - [x] `choices` table (P1 MCQ answer options)
  - [x] `reviewers` table
  - [x] `reviews` table (append-only history, never overwritten)
  - [x] `diagrams` table (Drive path + file ID lookup)
- [x] Create all indexes defined in plan (idx_questions_lookup, idx_questions_review, idx_reviews_question, idx_diagrams_key + two extras: idx_reviewers_name, idx_reviews_reviewer)
- [x] Validate schema — loaded remotely to production D1 (24986f49-f9a6-44da-a638-2ac6efc6f649)

---

## Phase 2 — ETL Script (Python)

### 2.1 Setup
- [x] Create `etl/requirements.txt` listing `openpyxl`, `requests`, `google-auth`
- [x] Create `etl/README.md` with usage instructions

### 2.2 Core ETL Logic (`etl/etl.py`)
- [x] Implement `norm(v)` utility to strip/normalize cell values
- [x] Implement `rows_from_p1(ws)` — iterates a P1 worksheet, yields dicts per question row
  - [x] Parse headers dynamically (no hard-coded column indices)
  - [x] Skip blank rows (where `Question` cell is empty)
  - [x] Extract: Exam, Subject, Month, Year, Paper, Number, Section, Topic, Difficulty, Correct answer, Question text, Question Diagram Path Prefix
  - [x] Build 4 choices dicts (A/B/C/D) with Answer text + Diagram Path Prefix per label
- [x] Implement `rows_from_p2(ws)` — same pattern for P2 sheets
  - [x] Parse headers dynamically
  - [x] Skip blank rows
  - [x] Extract: Exam, Subject, Month, Year, Paper, Number, Part, Subpart, Section, Topic, Difficulty, Marks, Question text, Question Diagram Path Prefix
- [x] Implement `build_diagram_key(row)` — deterministic naming convention matching plan
- [x] Implement `sql_str(v)` for safe SQL literal generation
- [x] Implement `main()`:
  - [x] Accept workbook paths as CLI args (`--p1 Cape_P1_s.xlsx --p2 Cape_P2_s.xlsx`)
  - [x] Open both workbooks with `openpyxl` (`data_only=True`, `read_only=True`)
  - [x] Iterate all sheets whose names start with `"Converted -"`
  - [x] Dispatch P1 sheets → `rows_from_p1`, P2 sheets → `rows_from_p2`
  - [x] Emit `INSERT INTO subjects ... ON CONFLICT DO NOTHING` for each unique subject
  - [x] Emit `INSERT INTO questions ... ON CONFLICT DO UPDATE` (upsert on natural key) per question row
  - [x] Emit `INSERT INTO choices ... ON CONFLICT DO UPDATE` per choice row (P1 only)
  - [x] Emit `INSERT INTO diagrams (diagram_key, drive_path) ... ON CONFLICT DO UPDATE` from Diagrams sheet
  - [x] Write output to `etl/load_questions.sql`
  - [x] Print summary: total rows processed, inserted, skipped

### 2.3 Diagrams Sheet Parsing
- [x] Parse the `Diagrams` sheet from the P2 workbook
  - [x] Map `diagram_key` → `drive_path` (the "Corrected Path" column)
  - [x] Map `status` column
  - [x] Upsert into `diagrams` table

### 2.4 ETL Validation
- [ ] Run ETL against real workbooks (when provided)
- [ ] Verify row counts per subject match expected counts from spreadsheets
- [ ] Confirm no duplicate natural-key violations
- [ ] Confirm `choices` rows are exactly 4 per P1 question

---

## Phase 3 — Cloudflare Worker API

### 3.1 Project Setup
- [x] Create `worker/package.json` with Cloudflare Workers + TypeScript deps
- [x] Create `worker/tsconfig.json`
- [x] Create `worker/wrangler.toml` with D1 database binding (`DB`)
- [x] Add `API_TOKEN` secret placeholder in `wrangler.toml` comments
- [x] Add `DRIVE_SERVICE_ACCOUNT_JSON` secret placeholder

### 3.2 Auth Middleware
- [x] Implement bearer token check: reject with `401` if `Authorization` header ≠ `Bearer ${env.API_TOKEN}`
- [x] Apply to all routes (wrap the entire fetch handler)

### 3.3 Public Endpoints
- [x] `GET /subjects` — list subjects with P1 and P2 question counts
- [x] `GET /reviewers` — list all reviewer names
- [x] `GET /questions` — paginated question list with filters:
  - [x] Filter by `paper` (1 or 2)
  - [x] Filter by `subject` name
  - [x] Filter by `review_status`
  - [x] "Unreviewed by me" scoped filter
  - [x] Cursor-based pagination
- [x] `GET /questions/:id` — full question detail including choices + review history
- [x] `POST /questions/:id/review` — submit review, upsert reviewer, recompute denormalized fields
- [x] `GET /stats` — per-subject/paper counts

### 3.4 Image Proxy Endpoint
- [x] `GET /images/:diagram_key` — live-proxy from Google Drive
- [x] Drive file ID lookup from `diagrams` table
- [x] `getDriveAccessToken(env)` — JWT → OAuth via service account, in-memory cached
- [x] Edge-cache response in `caches.default` with `Cache-Control: public, max-age=86400`

### 3.5 Admin Endpoints (`/admin/*`)
- [x] `GET /admin/papers`
- [x] `POST /admin/import` — bulk upsert with `env.DB.batch(stmts)`
- [x] `GET /admin/questions`
- [x] `PUT /admin/questions/:id`
- [x] `DELETE /admin/questions/:id`
- [x] `DELETE /admin/papers`

### 3.6 Worker Testing
- [x] Worker deployed to production: https://cape-review-worker.konraddorn347.workers.dev
- [ ] Test all public endpoints with `curl`/Postman
- [ ] Test multi-reviewer conflict scenario
- [ ] Test image proxy with a real `drive_file_id`
- [x] Deployed to Cloudflare: `wrangler deploy` ✅

---

## Phase 4 — Google Drive Service Account & Diagram Sync

### 4.1 Service Account Setup
- [ ] Create a Google Cloud project (or use existing)
- [ ] Enable Google Drive API
- [ ] Create a service account with read-only Drive access
- [ ] Download the service account JSON key
- [ ] Share the Diagrams folder in Drive with the service account email
- [ ] Add the JSON key as a `DRIVE_SERVICE_ACCOUNT_JSON` Worker secret

### 4.2 Drive File ID Resolver
- [x] Create `etl/resolve_drive_ids.py`
  - [x] Reads diagram rows from a JSON export
  - [x] Queries Drive API by path to find file IDs
  - [x] Emits UPDATE SQL for `diagrams.drive_file_id`
  - [x] Outputs resolved vs. not-found summary
- [ ] Run resolver after ETL import (requires workbooks + service account key)
- [ ] (Optional) Schedule as a Cloudflare Worker Cron Trigger

---

## Phase 5 — Web Admin UI

### 5.1 Project Setup
- [x] Create `admin-ui/index.html` — SPA shell with all 4 view sections
- [x] Create `admin-ui/style.css` — dark mode premium styles
- [x] Create `admin-ui/app.js` — full application logic
- [x] Add SheetJS via CDN
- [x] Add KaTeX via CDN

### 5.2 Cloudflare Access Setup (Zero Auth Code)
- [ ] Create a Cloudflare Access Application covering the Pages domain
- [ ] Create an Access policy: email allow-list
- [ ] Configure One-Time PIN identity provider

### 5.7 Deploy Admin UI ✅
- [x] Deployed to Cloudflare Pages: https://fe7a4374.cape-admin.pages.dev
- [x] Production URL: https://cape-admin.pages.dev

### 5.3 Papers List Screen ✅
- [x] Fetch from `GET /admin/papers` on load
- [x] Display table with subject, paper, year, month, question count, review %, actions
- [x] "Edit" action → navigate to Question Editor with pre-filled filters
- [x] "Delete & Reupload" → opens delete confirmation modal

### 5.4 Upload Screen ✅
- [x] Drag-and-drop + click-to-browse file picker
- [x] Parse file client-side with SheetJS
- [x] Show preview table before committing
- [x] Validation: missing Question, duplicate natural keys, row counts
- [x] "Confirm Import" → POST to `/admin/import`

### 5.5 Question Editor Screen ✅
- [x] Fetch from `GET /admin/questions` with filters
- [x] Paginated table of questions with inline editable textarea
- [x] Live KaTeX LaTeX preview next to each raw text field
- [x] Save via `PUT /admin/questions/:id`
- [x] Delete via `DELETE /admin/questions/:id` with confirm dialog

### 5.6 Delete Paper Confirmation Modal ✅
- [x] Require user to type paper label to enable confirm button
- [x] Call `DELETE /admin/papers` on confirm

### 5.7 Deploy Admin UI
- [ ] Deploy to Cloudflare Pages: `wrangler pages deploy admin-ui/`
- [ ] Confirm Cloudflare Access gate is in place

---

## Phase 6 — iOS App (SwiftUI)

### 6.1 Xcode Project Setup
- [ ] Create Xcode project at `ios/FailBetter.xcodeproj`
- [ ] Add `LaTeXSwiftUI` via Swift Package Manager
- [x] `APIClient.swift` created with configurable URL + Keychain-ready token

### 6.2 Models ✅
- [x] `Models.swift`: `Choice`, `Question` (custom decoder for 0/1 Bool), `ReviewEntry`, `Subject`, `SubjectStats`

### 6.3 API Client ✅
- [x] `APIClient.swift`: all endpoints — `fetchSubjects`, `fetchQuestions`, `fetchQuestion`, `submitReview`, `fetchStats`, `fetchReviewers`

### 6.4 Reviewer Name Prompt ✅
- [x] `ReviewerNamePrompt.swift` — first-launch name screen

### 6.5 Subject Picker Screen ✅
- [x] `SubjectPickerView.swift` — `NavigationStack` with typed `Route` destinations, all-subjects quick-start, per-subject P1/P2 drill-down

### 6.6 Review View ✅
- [x] `ReviewView.swift` — full flip-through with LaTeX rendering pattern, batch pagination, P1 choices with correct-answer highlight, P2 marks display, conflict badge

### 6.7 Review Controls ✅
- [x] `ReviewControls.swift` — Correct/Needs Fix buttons, note field with missing-note warning, submission disabled state

### 6.8 Diagram View ✅
- [x] `DiagramView.swift` — `AsyncImage` from Worker proxy, silent on failure

### 6.9 Stats Screen ✅
- [x] `StatsView.swift` — progress bars, reviewed/unreviewed/conflict pills, pull-to-refresh

### 6.10 Settings Screen ✅
- [x] `SettingsView.swift` — reviewer name, Worker URL + token, connection test, reset queue

### 6.11 App Entry Point ✅
- [x] `FailBetterApp.swift` — `@main` entry point

### 6.12 Build & Distribution
- [ ] Open `ios/FailBetter/` files in Xcode and create `.xcodeproj`
- [ ] Add `LaTeXSwiftUI` SPM package
- [ ] Set signing to Personal Team
- [ ] Build and test on physical device
- [ ] Add to TestFlight internal testing

---

## Phase 7 — Polish & Ongoing Ops

### 7.1 Drive Path Stability
- [ ] Automate a periodic diff between `diagrams.drive_path` rows and actual Drive folder tree
- [ ] Alert or log when a path no longer exists in Drive

### 7.2 Conflict Resolution Process
- [ ] Document agreed-upon process for who has final say on conflicting reviews
- [ ] (Optional) Add a "resolve conflict" action in the iOS app or Admin UI

### 7.3 Monitoring & Observability
- [ ] Enable Cloudflare Worker analytics
- [ ] Monitor D1 storage usage
- [ ] (Optional) Logpush or Trace Events for review errors

### 7.4 Documentation
- [ ] Update `README.md` with Worker URL once deployed
- [ ] Document conflict resolution process in `README.md`

---

## Completion Tracker

| Phase | Tasks | Done | % |
|-------|-------|------|---|
| 1 — Scaffold & Schema | 14 | 14 | 100% |
| 2 — ETL Script | 22 | 18 | 82% |
| 3 — Worker API | 28 | 25 | 89% |
| 4 — Drive Sync | 8 | 4 | 50% |
| 5 — Web Admin UI | 22 | 20 | 91% |
| 6 — iOS App | 32 | 26 | 81% |
| 7 — Polish & Ops | 10 | 0 | 0% |
| **Total** | **136** | **107** | **79%** |

---

## What Requires User Action (Blocked on External Setup)

These tasks cannot be completed in code — they require accounts, credentials, or real workbooks:

1. ~~**D1 creation**~~ ✅ — `cape-questions` created, ID `24986f49-f9a6-44da-a638-2ac6efc6f649`, wrangler.toml updated
2. ~~**Schema load**~~ ✅ — 6 tables + 6 indexes loaded to production D1
3. ~~**Worker deployed**~~ ✅ — https://cape-review-worker.konraddorn347.workers.dev
4. ~~**`API_TOKEN` secret**~~ ✅ — set via `wrangler secret put`
5. ~~**Admin UI deployed**~~ ✅ — https://cape-admin.pages.dev
6. **ETL run**: requires `Cape_P1_s.xlsx` + `Cape_P2_s.xlsx` → `cd etl && python etl.py --p1 ../Cape_P1_s.xlsx --p2 ../Cape_P2_s.xlsx`
7. **`DRIVE_SERVICE_ACCOUNT_JSON` secret**: `wrangler secret put DRIVE_SERVICE_ACCOUNT_JSON` (needs Google Cloud setup first)
8. **Google Cloud**: Enable Drive API + create service account + download JSON key + share Drive folder
9. **Drive resolver**: Run after ETL with the service account key
10. **Cloudflare Access**: Configure email allow-list policy for cape-admin.pages.dev
11. **Xcode project**: Create `.xcodeproj` in `ios/`, add LaTeXSwiftUI SPM package, sign with Personal Team
12. **TestFlight**: Add internal testers for the iOS app
