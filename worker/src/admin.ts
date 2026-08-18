// =============================================================================
// admin.ts — /admin/* route handlers for the Web Admin UI
// =============================================================================
// All routes here are behind Cloudflare Access at the edge — by the time a
// request reaches this code it has already been authenticated. No auth checks
// needed inside these handlers.
// =============================================================================

import { Env, ImportRow } from './types';

// ---------------------------------------------------------------------------
// Internal: process one page of ImageKit files and update both questions
// and choice diagram keys in D1. Returns { filesInPage, questionsUpdated,
// choicesUpdated, hasMore, nextSkip }.
//
// Paper 1 can have up to 5 images per question:
//   • cape_{u}_{subj}_{mon}_{yr}_{paper}_{num}          → question diagram
//   • cape_{u}_{subj}_{mon}_{yr}_{paper}_{num}_{a|b|c|d} → choice diagrams
// ---------------------------------------------------------------------------
async function auditPage(
  env: Env,
  authHeader: string,
  pageSkip: number,
  pageLimit: number
): Promise<{
  filesInPage: number;
  questionsUpdated: number;
  choicesUpdated: number;
  hasMore: boolean;
  nextSkip: number;
}> {
  let files: Array<{ name: string }> = [];
  try {
    const res = await fetch(
      `https://api.imagekit.io/v1/files?limit=${pageLimit}&skip=${pageSkip}`,
      { headers: { Authorization: authHeader } }
    );
    if (res.ok) {
      files = (await res.json()) as Array<{ name: string }>;
    }
  } catch { /* swallow network errors */ }

  const CHOICE_LABELS = new Set(['a', 'b', 'c', 'd']);
  const qStmts: ReturnType<typeof env.DB.prepare>[] = [];
  const cStmts: ReturnType<typeof env.DB.prepare>[] = [];

  for (const f of files) {
    const filename = f.name;
    if (!filename.endsWith('.png') && !filename.endsWith('.jpg') && !filename.endsWith('.jpeg')) continue;
    const diagramKey = filename.replace(/\.(png|jpg|jpeg)$/i, '').toLowerCase();

    // Detect whether this is a choice diagram (ends in _a / _b / _c / _d)
    // Pattern: cape_{u}_{subj}_{mon}_{yr}_{paper}_{num}_{label}
    const choiceMatch = diagramKey.match(
      /^(cape_[12]_[^_]+_[^_]+_\d+_[12]_\d+)_([a-z])$/i
    );

    if (choiceMatch && CHOICE_LABELS.has(choiceMatch[2].toLowerCase())) {
      // ── Choice diagram ──
      const baseKey   = choiceMatch[1];          // e.g. cape_1_accounting_may_2018_1_26
      const label     = choiceMatch[2].toUpperCase(); // e.g. "A"
      // Update the choice row whose diagram_key matches (exact or base)
      cStmts.push(
        env.DB.prepare(`
          UPDATE choices
          SET diagram_key = ?1
          WHERE (diagram_key = ?1 OR diagram_key = ?2)
            AND label = ?3
        `).bind(diagramKey, baseKey + '_' + label.toLowerCase(), label)
      );
    } else {
      // ── Question diagram ──
      const m = diagramKey.match(/^(cape_[12]_[^_]+_[^_]+_\d+_[12]_\d+)/i);
      const baseKey = m ? m[1] : diagramKey;
      qStmts.push(
        env.DB.prepare(`
          UPDATE questions
          SET diagram_present = 1,
              question_diagram_key = ?1
          WHERE question_diagram_key = ?1 OR question_diagram_key = ?2
        `).bind(diagramKey, baseKey)
      );
    }
  }

  const BATCH_LIMIT = 75;
  let questionsUpdated = 0;
  let choicesUpdated   = 0;

  // Flush question statements
  for (let i = 0; i < qStmts.length; i += BATCH_LIMIT) {
    const res = await env.DB.batch(qStmts.slice(i, i + BATCH_LIMIT));
    questionsUpdated += res.reduce((s, r) => s + r.meta.changes, 0);
  }
  // Flush choice statements
  for (let i = 0; i < cStmts.length; i += BATCH_LIMIT) {
    const res = await env.DB.batch(cStmts.slice(i, i + BATCH_LIMIT));
    choicesUpdated += res.reduce((s, r) => s + r.meta.changes, 0);
  }

  const hasMore = files.length === pageLimit;
  return {
    filesInPage: files.length,
    questionsUpdated,
    choicesUpdated,
    hasMore,
    nextSkip: pageSkip + pageLimit,
  };
}

// ---------------------------------------------------------------------------
// Exported: run the full audit across ALL ImageKit pages (used by waitUntil
// after import so it runs in the background without blocking the response).
// ---------------------------------------------------------------------------
export async function runFullDiagramAudit(env: Env): Promise<void> {
  const privateKey = env.IMAGEKIT_PRIVATE_KEY ?? '';
  if (!privateKey) return;
  const authHeader = 'Basic ' + btoa(privateKey + ':');
  const pageLimit = 500;
  let skip = 0;
  for (;;) {
    const page = await auditPage(env, authHeader, skip, pageLimit);
    if (!page.hasMore) break;
    skip = page.nextSkip;
  }
}

// ---------------------------------------------------------------------------
// HTTP handler: audit one page of ImageKit files (paginated via ?skip=N)
// Call repeatedly until hasMore=false.
// ---------------------------------------------------------------------------
export async function handleAuditAndFixDiagrams(
  env: Env,
  url: URL
): Promise<Response> {
  const privateKey = env.IMAGEKIT_PRIVATE_KEY ?? '';
  if (!privateKey) {
    return Response.json({ error: 'IMAGEKIT_PRIVATE_KEY missing' }, { status: 500 });
  }

  const pageSkip  = Number(url.searchParams.get('skip') ?? 0);
  const pageLimit = 500;
  const authHeader = 'Basic ' + btoa(privateKey + ':');

  const page = await auditPage(env, authHeader, pageSkip, pageLimit);
  return Response.json({
    skip: pageSkip,
    ...page,
  });
}

// ---------------------------------------------------------------------------
// Helper: debug ImageKit media library API
// ---------------------------------------------------------------------------
export async function handleDebugImageKit(env: Env): Promise<Response> {
  const privateKey = env.IMAGEKIT_PRIVATE_KEY ?? '';
  const authHeader = 'Basic ' + btoa(privateKey + ':');

  try {
    const searchUrl = 'https://api.imagekit.io/v1/files?searchQuery=' + encodeURIComponent('name : cape_1_appliedmathematics_may_2022_2_1*');
    const res = await fetch(searchUrl, {
      headers: {
        'Authorization': authHeader,
      },
    });
    const data = await res.json();
    return Response.json({
      status: res.status,
      hasPrivateKey: Boolean(privateKey),
      keyPrefix: privateKey.substring(0, 8),
      baseUrl: env.IMAGEKIT_BASE_URL,
      folder: env.IMAGEKIT_FOLDER,
      data,
    });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : String(err);
    return Response.json({ error: message, hasPrivateKey: Boolean(privateKey) }, { status: 500 });
  }
}

// ---------------------------------------------------------------------------
// Helper: upsert a subject name and return its ID
// ---------------------------------------------------------------------------
async function upsertSubject(env: Env, name: string): Promise<number> {
  const trimmed = name.trim();
  await env.DB.prepare(
    `INSERT INTO subjects (name) VALUES (?) ON CONFLICT(name) DO NOTHING`
  ).bind(trimmed).run();

  const row = await env.DB.prepare(`SELECT id FROM subjects WHERE name = ?`)
    .bind(trimmed).first<{ id: number }>();
  if (!row) throw new Error(`Subject upsert failed for: ${trimmed}`);
  return row.id;
}

// ---------------------------------------------------------------------------
// ---------------------------------------------------------------------------
// Helper: normalise the Unit value → "1" or "2"
// Checks the explicit Unit column first, then falls back to Subject string.
// ---------------------------------------------------------------------------
function normaliseUnit(unit: string | undefined, subject?: string): string {
  if (unit != null && String(unit).trim() !== '') {
    const cleaned = String(unit).trim()
      .replace(/^[Uu]nit\s*/i, '')
      .replace(/^[Uu]/i, '')
      .trim();
    if (cleaned === '1' || cleaned === '2') return cleaned;
  }

  if (subject) {
    const m = subject.match(/(?:[Uu]nit\s*|[Uu]|\s+)([12])$/i);
    if (m) return m[1];
  }

  return '1';
}

// ---------------------------------------------------------------------------
// Helper: clean subject name by removing trailing unit indicators
// e.g. "Applied Mathematics U2" → "AppliedMathematics"
// ---------------------------------------------------------------------------
function cleanSubjectName(subject: string): string {
  const s = subject.trim()
    .replace(/\s*(?:[Uu]nit\s*|[Uu]|\s+)[12]$/i, '')
    .replace(/\s+/g, '')
    .trim();

  const lower = s.toLowerCase();
  if (lower === 'i.t' || lower === 'it' || lower === 'informationtechnology') {
    return 'InformationTechnology';
  }
  if (lower === 'mob' || lower === 'managementofbusiness') {
    return 'ManagementOfBusiness';
  }
  return s;
}

// ---------------------------------------------------------------------------
// Helper: build a diagram_key from a row's metadata
// Format: cape_{unit}_{subject_slug}_{month_slug}_{year}_{paper}_{number}
//         + optional _{choice_label} for choice diagrams
// ---------------------------------------------------------------------------
function buildDiagramKey(
  subject: string,
  month: string | undefined,
  year: number | undefined,
  paper: number,
  number: number,
  unit?: string,
  choiceLabel?: string
): string {
  const unitSlug    = normaliseUnit(unit, subject);
  const subjectSlug = cleanSubjectName(subject).toLowerCase();
  const monthSlug   = (month ?? 'unknown').toLowerCase();
  const base = `cape_${unitSlug}_${subjectSlug}_${monthSlug}_${year ?? 0}_${paper}_${number}`;
  return choiceLabel ? `${base}_${choiceLabel.toLowerCase()}` : base;
}

// ---------------------------------------------------------------------------
// GET /admin/papers
// Returns distinct (subject, paper, year, month) groups with question counts
// and review-completion percentage.
// ---------------------------------------------------------------------------
export async function handleGetPapers(env: Env): Promise<Response> {
  const { results } = await env.DB.prepare(`
    SELECT
      s.name                                              AS subject,
      q.paper,
      q.year,
      q.month,
      COUNT(*)                                            AS question_count,
      SUM(CASE WHEN q.review_count > 0 THEN 1 ELSE 0 END) AS reviewed_count,
      ROUND(
        100.0 * SUM(CASE WHEN q.review_count > 0 THEN 1 ELSE 0 END) / COUNT(*), 1
      )                                                   AS review_pct
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    GROUP BY s.name, q.paper, q.year, q.month
    ORDER BY s.name, q.paper, q.year, q.month
  `).all();

  return Response.json(results);
}

// ---------------------------------------------------------------------------
// POST /admin/import
// Body: { paper: 1|2, rows: ImportRow[] }
// Bulk-upserts subjects, questions, and choices (P1).
// Idempotent — safe to re-run after spreadsheet corrections.
//
// D1 hard-limits batch() to 100 statements. We flush every BATCH_SIZE rows
// worth of statements to stay comfortably under that limit.
// Subject IDs are cached in a Map to avoid N sequential DB round-trips.
// ---------------------------------------------------------------------------
const BATCH_SIZE = 75; // safely under D1's 100-statement limit

async function flushStmts(env: Env, stmts: D1PreparedStatement[]): Promise<void> {
  for (let i = 0; i < stmts.length; i += BATCH_SIZE) {
    await env.DB.batch(stmts.slice(i, i + BATCH_SIZE));
  }
}

export async function handleImport(req: Request, env: Env): Promise<{ response: Response; triggerAudit: boolean }> {
  let body: { paper: 1 | 2; rows: ImportRow[]; triggerAudit?: boolean };
  try {
    body = await req.json();
  } catch {
    return { response: new Response('Invalid JSON body', { status: 400 }), triggerAudit: false };
  }

  const { paper, rows, triggerAudit = false } = body;
  if (paper !== 1 && paper !== 2) {
    return { response: new Response('paper must be 1 or 2', { status: 400 }), triggerAudit: false };
  }

  // Cache subject name → id to avoid one DB call per row
  const subjectCache = new Map<string, number>();
  async function getSubjectId(name: string): Promise<number> {
    if (subjectCache.has(name)) return subjectCache.get(name)!;
    const id = await upsertSubject(env, name);
    subjectCache.set(name, id);
    return id;
  }

  const stmts: D1PreparedStatement[] = [];
  let skipped = 0;
  let processed = 0;

  for (const row of rows) {
    // Skip blank rows — Question is required
    if (!row.Question) { skipped++; continue; }

    const rawSubject = String(row.Subject ?? '').trim();
    if (!rawSubject) { skipped++; continue; }

    const baseSubj   = cleanSubjectName(rawSubject);
    const rawUnit    = row.Unit ?? row.unit ?? row.UNIT ?? (row as Record<string, unknown>)['Unit '] ?? (row as Record<string, unknown>)['unit '];
    const unit       = rawUnit != null ? String(rawUnit).trim() : undefined;
    const unitNum    = normaliseUnit(unit, rawSubject);
    const subject    = `${baseSubj} U${unitNum}`;
    const subjectId  = await getSubjectId(subject);
    const month     = row.Month   ? String(row.Month)   : null;
    const year      = row.Year    ? Number(row.Year)    : null;
    const num       = Number(row.Number ?? 0);
    const part      = row.Part    ? String(row.Part)    : null;
    const subpart   = row.Subpart ? String(row.Subpart) : null;

    const explicitQuestionDiagKey = row['Question Diagram Path Prefix'] ? String(row['Question Diagram Path Prefix']).trim() : null;
    const diagKey = explicitQuestionDiagKey || buildDiagramKey(
      baseSubj, month ?? undefined, year ?? undefined, paper, num, unitNum
    );

    // Validated question code: prefer 'Validated Question Code', fall back to 'Q', then raw 'Question'
    const questionCode  = String(row['Validated Question Code'] ?? row['Q'] ?? row.Question);
    const correctChoice = paper === 1 ? (row.Correct ? String(row.Correct) : null) : null;
    const marks         = paper === 2 ? (row.Marks != null ? Number(row.Marks) : null) : null;
    const sourceSheet   = String((row as Record<string, unknown>)._sheet ?? 'imported');

    const rawDiagPres = String(row['Diagram Present'] ?? row['Diagram_Present'] ?? (row as Record<string, unknown>).diagram_present ?? '');
    const diagPresent = (rawDiagPres && ['yes', '1', 'true'].includes(rawDiagPres.trim().toLowerCase())) || row['Question Diagram Path Prefix'] ? 1 : 0;

    stmts.push(
      env.DB.prepare(`
        INSERT INTO questions (
          source_workbook, source_sheet, exam, subject_id, month, year, paper,
          number, part, subpart, section, topic, difficulty, marks, correct_choice,
          question_raw, question_code, question_diagram_key, diagram_present
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
        ON CONFLICT(source_workbook, subject_id, month, year, paper, number, part, subpart)
        DO UPDATE SET
          question_raw          = excluded.question_raw,
          question_code         = excluded.question_code,
          section               = excluded.section,
          topic                 = excluded.topic,
          difficulty            = excluded.difficulty,
          marks                 = excluded.marks,
          correct_choice        = excluded.correct_choice,
          question_diagram_key  = excluded.question_diagram_key,
          diagram_present       = excluded.diagram_present
      `).bind(
        paper === 1 ? 'P1' : 'P2',
        sourceSheet,
        String(row.Exam ?? 'CAPE'),
        subjectId,
        month, year, paper, num, part, subpart,
        row.Section    ? String(row.Section)    : null,
        row.Topic      ? String(row.Topic)      : null,
        row.Difficulty ? String(row.Difficulty) : null,
        marks,
        correctChoice,
        String(row.Question),
        questionCode,
        diagKey,
        diagPresent
      )
    );

    // Paper 1: upsert up to 4 choice rows
    if (paper === 1) {
      for (const label of ['A', 'B', 'C', 'D'] as const) {
        const answerRawKey  = `Answer ${label}` as keyof ImportRow;
        const answerCodeKey = `Validated Answer ${label} Code` as keyof ImportRow;
        const diagPrefixKey = `${label} Diagram Path Prefix` as keyof ImportRow;
        const shorthandKey  = label as keyof ImportRow; // single-letter A/B/C/D column

        const rawAns = row[answerRawKey];
        const answerText = (rawAns !== undefined && rawAns !== null && rawAns !== '') ? String(rawAns) : '';
        if (answerText === '') continue;

        // Prefer 'Validated Answer X Code', then single-letter shorthand, then raw
        const answerCode = String(row[answerCodeKey] ?? row[shorthandKey] ?? answerText);

        const explicitChoiceDiagKey = row[diagPrefixKey] ? String(row[diagPrefixKey]).trim() : null;
        const choiceDiagKey = explicitChoiceDiagKey || buildDiagramKey(
          baseSubj, month ?? undefined, year ?? undefined, paper, num, unitNum, label
        );

        stmts.push(
          env.DB.prepare(`
            INSERT INTO choices (question_id, label, answer_raw, answer_code, diagram_key)
            SELECT id, ?, ?, ?, ?
            FROM questions
            WHERE source_workbook = 'P1' AND subject_id = ? AND month IS ? AND year IS ?
              AND paper = ? AND number = ? AND part IS ? AND subpart IS ?
            ON CONFLICT(question_id, label) DO UPDATE SET
              answer_raw  = excluded.answer_raw,
              answer_code = excluded.answer_code,
              diagram_key = excluded.diagram_key
          `).bind(
            label,
            answerText,
            answerCode,
            choiceDiagKey,
            subjectId,
            month, year,
            paper, num, part, subpart
          )
        );
      }
    }

    processed++;

    // Flush statements to D1 every BATCH_SIZE to stay under D1's 100-stmt limit
    if (stmts.length >= BATCH_SIZE) {
      await flushStmts(env, stmts.splice(0));
    }
  }

  // Flush any remaining statements
  if (stmts.length > 0) {
    await flushStmts(env, stmts);
  }

  return { response: Response.json({ imported: processed, skipped }), triggerAudit };
}

// ---------------------------------------------------------------------------
// GET /admin/questions?subject=&paper=&year=&month=&cursor=&limit=
// Paginated raw question rows for the Admin UI question editor table.
// ---------------------------------------------------------------------------
export async function handleAdminGetQuestions(
  url: URL,
  env: Env
): Promise<Response> {
  const subject = url.searchParams.get('subject');
  const paper   = url.searchParams.get('paper')  ? Number(url.searchParams.get('paper'))  : null;
  const year    = url.searchParams.get('year')   ? Number(url.searchParams.get('year'))   : null;
  const month   = url.searchParams.get('month');
  const status  = url.searchParams.get('status');
  const limit   = Math.min(Math.max(Number(url.searchParams.get('limit') ?? 50), 1), 500);
  const cursor  = Math.max(Number(url.searchParams.get('cursor') ?? 0), 0);

  const whereClauses: string[] = [];
  const params: unknown[] = [];

  if (subject) {
    whereClauses.push('s.name = ?');
    params.push(subject);
  }
  if (paper !== null && !isNaN(paper)) {
    whereClauses.push('q.paper = ?');
    params.push(paper);
  }
  if (year !== null && !isNaN(year)) {
    whereClauses.push('q.year = ?');
    params.push(year);
  }
  if (month) {
    whereClauses.push('q.month = ?');
    params.push(month);
  }
  if (status === 'unreviewed') {
    whereClauses.push('q.review_count = 0');
  } else if (status === 'reviewed') {
    whereClauses.push('q.review_count > 0');
  } else if (status === 'correct' || status === 'needs_fix') {
    whereClauses.push('q.latest_review_status = ?');
    params.push(status);
  }

  const whereSql = whereClauses.length > 0 ? `WHERE ${whereClauses.join(' AND ')}` : '';
  const sql = `
    SELECT q.*, s.name AS subject_name
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    ${whereSql}
    ORDER BY q.id
    LIMIT ? OFFSET ?
  `;

  params.push(limit, cursor);

  const { results } = await env.DB.prepare(sql).bind(...params).all();

  const questionsList = (results ?? []) as Array<Record<string, unknown>>;
  const p1QuestionIds = questionsList
    .filter(q => Number(q.paper) === 1)
    .map(q => Number(q.id));

  if (p1QuestionIds.length > 0) {
    const choicesMap = await fetchChoicesForQuestionIds(env, p1QuestionIds);
    for (const q of questionsList) {
      if (Number(q.paper) === 1) {
        q.choices = choicesMap.get(Number(q.id)) ?? [];
      }
    }
  }

  return Response.json(questionsList);
}

async function fetchChoicesForQuestionIds(env: Env, questionIds: number[]) {
  const choicesMap = new Map<number, any[]>();
  const BATCH_SIZE = 50;

  for (let i = 0; i < questionIds.length; i += BATCH_SIZE) {
    const batch = questionIds.slice(i, i + BATCH_SIZE);
    const placeholders = batch.map(() => '?').join(',');
    const { results: choicesRows } = await env.DB.prepare(`
      SELECT id, question_id, label, answer_raw, answer_code, diagram_key
      FROM choices
      WHERE question_id IN (${placeholders})
      ORDER BY question_id, label
    `).bind(...batch).all<{
      id: number;
      question_id: number;
      label: string;
      answer_raw: string;
      answer_code: string;
      diagram_key: string | null;
    }>();

    for (const c of (choicesRows ?? [])) {
      if (!choicesMap.has(c.question_id)) {
        choicesMap.set(c.question_id, []);
      }
      choicesMap.get(c.question_id)!.push(c);
    }
  }
  return choicesMap;
}

// ---------------------------------------------------------------------------
// GET /admin/reviews?subject=&paper=&year=&month=&reviewer=&status=&limit=&cursor=
// Detailed review history per question showing who reviewed, how many times, and status notes.
// ---------------------------------------------------------------------------
export async function handleAdminGetReviews(
  url: URL,
  env: Env
): Promise<Response> {
  const subject  = url.searchParams.get('subject');
  const paper    = url.searchParams.get('paper') ? Number(url.searchParams.get('paper')) : null;
  const year     = url.searchParams.get('year')  ? Number(url.searchParams.get('year'))  : null;
  const month    = url.searchParams.get('month');
  const reviewer = url.searchParams.get('reviewer');
  const status   = url.searchParams.get('status');
  const limit    = Math.min(Math.max(Number(url.searchParams.get('limit') ?? 100), 1), 1000);
  const cursor   = Math.max(Number(url.searchParams.get('cursor') ?? 0), 0);

  const whereClauses: string[] = [];
  const params: unknown[] = [];

  if (subject) {
    whereClauses.push('s.name = ?');
    params.push(subject);
  }
  if (paper !== null && !isNaN(paper)) {
    whereClauses.push('q.paper = ?');
    params.push(paper);
  }
  if (year !== null && !isNaN(year)) {
    whereClauses.push('q.year = ?');
    params.push(year);
  }
  if (month) {
    whereClauses.push('q.month = ?');
    params.push(month);
  }
  if (reviewer) {
    whereClauses.push('r.reviewer_id LIKE ?');
    params.push(`%${reviewer}%`);
  }
  if (status === 'unreviewed') {
    whereClauses.push('q.review_count = 0');
  } else if (status === 'reviewed') {
    whereClauses.push('q.review_count > 0');
  } else if (status === 'correct' || status === 'needs_fix') {
    whereClauses.push('r.status = ?');
    params.push(status);
  } else if (status === 'conflicts') {
    whereClauses.push('q.has_conflicting_reviews = 1');
  }

  const whereSql = whereClauses.length > 0 ? `WHERE ${whereClauses.join(' AND ')}` : '';

  const sql = `
    SELECT 
      q.id AS question_id,
      s.name AS subject,
      q.paper,
      q.year,
      q.month,
      q.number,
      q.part,
      q.subpart,
      q.question_raw,
      q.question_code,
      q.correct_choice,
      q.review_count,
      q.latest_review_status,
      q.has_conflicting_reviews,
      r.id AS review_id,
      r.reviewer_id,
      r.status AS review_status,
      r.note AS review_note,
      r.created_at AS reviewed_at
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    LEFT JOIN reviews r ON r.question_id = q.id
    ${whereSql}
    ORDER BY s.name, q.paper, q.year, q.number, q.part, q.subpart, r.created_at DESC
    LIMIT ? OFFSET ?
  `;

  params.push(limit, cursor);

  const { results } = await env.DB.prepare(sql).bind(...params).all();

  const questionsMap = new Map<number, any>();
  for (const row of (results ?? []) as any[]) {
    const qid = row.question_id;
    if (!questionsMap.has(qid)) {
      questionsMap.set(qid, {
        question_id: qid,
        subject: row.subject,
        paper: row.paper,
        year: row.year,
        month: row.month,
        number: row.number,
        part: row.part,
        subpart: row.subpart,
        question_raw: row.question_raw,
        question_code: row.question_code,
        correct_choice: row.correct_choice,
        review_count: row.review_count,
        latest_review_status: row.latest_review_status,
        has_conflicting_reviews: row.has_conflicting_reviews,
        reviews: []
      });
    }

    if (row.review_id) {
      questionsMap.get(qid).reviews.push({
        review_id: row.review_id,
        reviewer_id: row.reviewer_id,
        status: row.review_status,
        note: row.review_note,
        reviewed_at: row.reviewed_at
      });
    }
  }

  const items = Array.from(questionsMap.values());
  const p1QuestionIds = items.filter(q => Number(q.paper) === 1).map(q => Number(q.question_id));

  if (p1QuestionIds.length > 0) {
    const choicesMap = await fetchChoicesForQuestionIds(env, p1QuestionIds);
    for (const q of items) {
      if (Number(q.paper) === 1) {
        q.choices = choicesMap.get(Number(q.question_id)) ?? [];
      }
    }
  }

  return Response.json(items);
}

// ---------------------------------------------------------------------------
// PUT /admin/questions/:id
// Edit one question's editable fields. Review summary fields are read-only
// (they're managed by the review endpoint). source_workbook, subject_id,
// paper, year, number, part, subpart are part of the natural key and are
// not editable here to avoid breaking the uniqueness constraint.
// ---------------------------------------------------------------------------
export async function handleUpdateQuestion(
  req: Request,
  env: Env,
  id: string
): Promise<Response> {
  let body: Record<string, unknown>;
  try {
    body = await req.json();
  } catch {
    return new Response('Invalid JSON body', { status: 400 });
  }

  const allowed = [
    'question_raw', 'question_code', 'question_diagram_key',
    'section', 'topic', 'difficulty', 'marks',
    'correct_choice', 'diagram_present',
    'month', 'year', 'part', 'subpart',
  ] as const;

  const setClauses: string[] = [];
  const bindings: unknown[] = [];

  for (const field of allowed) {
    if (Object.prototype.hasOwnProperty.call(body, field)) {
      setClauses.push(`${field} = ?`);
      bindings.push(body[field] ?? null);
    }
  }

  if (setClauses.length === 0) {
    return new Response('No updatable fields provided', { status: 400 });
  }

  bindings.push(Number(id));
  await env.DB.prepare(
    `UPDATE questions SET ${setClauses.join(', ')} WHERE id = ?`
  ).bind(...bindings).run();

  return Response.json({ ok: true });
}

// ---------------------------------------------------------------------------
// DELETE /admin/questions/:id
// Delete a single question row (choices cascade via ON DELETE CASCADE).
// ---------------------------------------------------------------------------
export async function handleDeleteQuestion(
  env: Env,
  id: string
): Promise<Response> {
  await env.DB.prepare('DELETE FROM questions WHERE id = ?')
    .bind(Number(id)).run();
  return Response.json({ ok: true });
}

// ---------------------------------------------------------------------------
// DELETE /admin/papers
// Body: { subject, paper, year, month }
// Deletes every question for a given exam sitting (cascades to choices).
// ---------------------------------------------------------------------------
export async function handleDeletePaper(
  req: Request,
  env: Env
): Promise<Response> {
  let body: { subject: string; paper: number; year: number; month: string };
  try {
    body = await req.json();
  } catch {
    return new Response('Invalid JSON body', { status: 400 });
  }

  const { subject, paper, year, month } = body;
  const subjectId = await upsertSubject(env, subject);

  const { meta } = await env.DB.prepare(`
    DELETE FROM questions
    WHERE subject_id = ? AND paper = ? AND year = ? AND month = ?
  `).bind(subjectId, paper, year, month).run();

  return Response.json({ ok: true, deleted: meta.changes });
}

// ---------------------------------------------------------------------------
// POST /admin/unreview-paper or DELETE /admin/reviews
// Body: { subject, paper, year?, month?, reviewer_id? }
// Deletes reviews for a paper (from all reviewers or a specific reviewer),
// then recomputes review counters on all affected questions.
// ---------------------------------------------------------------------------
export async function handleUnreviewPaper(
  req: Request,
  env: Env
): Promise<Response> {
  let body: { subject: string; paper: number; year?: number; month?: string; reviewer_id?: string | null };
  try {
    body = await req.json();
  } catch {
    return new Response('Invalid JSON body', { status: 400 });
  }

  const { subject, paper, year, month, reviewer_id } = body;
  if (!subject || !paper) {
    return Response.json({ error: 'Missing required subject or paper' }, { status: 400 });
  }

  const whereClauses: string[] = ['s.name = ?', 'q.paper = ?'];
  const params: unknown[] = [subject, paper];

  if (year !== undefined && year !== null && !isNaN(year)) {
    whereClauses.push('q.year = ?');
    params.push(year);
  }
  if (month) {
    whereClauses.push('q.month = ?');
    params.push(month);
  }

  const { results: qRows } = await env.DB.prepare(`
    SELECT q.id FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE ${whereClauses.join(' AND ')}
  `).bind(...params).all<{ id: number }>();

  const qIds = (qRows ?? []).map(r => r.id);
  if (qIds.length === 0) {
    return Response.json({ ok: true, deleted: 0, affectedQuestions: 0 });
  }

  // Delete from reviews
  const qPlaceholders = qIds.map(() => '?').join(',');
  let deleteRes;

  if (reviewer_id && reviewer_id.trim() !== '') {
    deleteRes = await env.DB.prepare(`
      DELETE FROM reviews
      WHERE question_id IN (${qPlaceholders})
        AND reviewer_id = ?
    `).bind(...qIds, reviewer_id.trim()).run();
  } else {
    deleteRes = await env.DB.prepare(`
      DELETE FROM reviews
      WHERE question_id IN (${qPlaceholders})
    `).bind(...qIds).run();
  }

  // Recompute review_count, latest_review_status, has_conflicting_reviews for all affected questions
  for (const qid of qIds) {
    const { results: rRows } = await env.DB.prepare(`
      SELECT status FROM reviews WHERE question_id = ? ORDER BY created_at DESC LIMIT 2
    `).bind(qid).all<{ status: string }>();

    const revCountRow = await env.DB.prepare(`
      SELECT COUNT(*) as cnt FROM reviews WHERE question_id = ?
    `).bind(qid).first<{ cnt: number }>();

    const reviewCount = revCountRow?.cnt ?? 0;
    let latestStatus: string | null = null;
    let hasConflicts = 0;

    if (rRows && rRows.length > 0) {
      latestStatus = rRows[0].status;
      if (rRows.length >= 2 && rRows[0].status !== rRows[1].status) {
        hasConflicts = 1;
      }
    }

    await env.DB.prepare(`
      UPDATE questions
      SET review_count = ?,
          latest_review_status = ?,
          has_conflicting_reviews = ?
      WHERE id = ?
    `).bind(reviewCount, latestStatus, hasConflicts, qid).run();
  }

  return Response.json({ ok: true, deleted: deleteRes.meta.changes, affectedQuestions: qIds.length });
}

// ---------------------------------------------------------------------------
// GET /admin/fixed-questions?subject=&paper=&year=&status=&limit=&cursor=
// List fixed questions with original vs fixed text comparisons.
// ---------------------------------------------------------------------------
export async function handleAdminGetFixedQuestions(
  url: URL,
  env: Env
): Promise<Response> {
  const subject = url.searchParams.get('subject');
  const paper   = url.searchParams.get('paper') ? Number(url.searchParams.get('paper')) : null;
  const year    = url.searchParams.get('year')  ? Number(url.searchParams.get('year'))  : null;
  const status  = url.searchParams.get('status');
  const limit   = Math.min(Math.max(Number(url.searchParams.get('limit') ?? 50), 1), 500);
  const cursor  = Math.max(Number(url.searchParams.get('cursor') ?? 0), 0);

  const whereClauses: string[] = [];
  const params: unknown[] = [];

  if (subject) {
    whereClauses.push('fq.subject_name = ?');
    params.push(subject);
  }
  if (paper !== null && !isNaN(paper)) {
    whereClauses.push('fq.paper = ?');
    params.push(paper);
  }
  if (year !== null && !isNaN(year)) {
    whereClauses.push('fq.year = ?');
    params.push(year);
  }
  if (status) {
    whereClauses.push('fq.status = ?');
    params.push(status);
  }

  const whereSql = whereClauses.length > 0 ? `WHERE ${whereClauses.join(' AND ')}` : '';
  const sql = `
    SELECT fq.*, q.question_code as active_question_code, q.question_raw as active_question_raw, q.correct_choice
    FROM fixed_questions fq
    LEFT JOIN questions q ON q.id = fq.original_question_id
    ${whereSql}
    ORDER BY fq.id ASC
    LIMIT ? OFFSET ?
  `;

  params.push(limit, cursor);

  const { results } = await env.DB.prepare(sql).bind(...params).all();
  const list = (results ?? []) as Array<Record<string, unknown>>;

  const fqIds = list.map(fq => Number(fq.id));
  if (fqIds.length > 0) {
    const revMap = new Map<number, any[]>();
    const BATCH_SIZE = 50;

    for (let i = 0; i < fqIds.length; i += BATCH_SIZE) {
      const batch = fqIds.slice(i, i + BATCH_SIZE);
      const placeholders = batch.map(() => '?').join(',');
      const { results: revRows } = await env.DB.prepare(`
        SELECT fixed_question_id, reviewer_id, status, note, reviewed_at
        FROM fixed_question_reviews
        WHERE fixed_question_id IN (${placeholders})
        ORDER BY reviewed_at DESC
      `).bind(...batch).all<{
        fixed_question_id: number;
        reviewer_id: string;
        status: string;
        note: string | null;
        reviewed_at: string;
      }>();

      for (const r of (revRows ?? [])) {
        if (!revMap.has(r.fixed_question_id)) revMap.set(r.fixed_question_id, []);
        revMap.get(r.fixed_question_id)!.push(r);
      }
    }

    // Fetch choices for P1 questions
    const origQIds = Array.from(new Set(list.map(fq => Number(fq.original_question_id)).filter(id => id > 0)));
    const choiceMap = new Map<number, any[]>();
    if (origQIds.length > 0) {
      for (let i = 0; i < origQIds.length; i += BATCH_SIZE) {
        const batch = origQIds.slice(i, i + BATCH_SIZE);
        const placeholders = batch.map(() => '?').join(',');
        const { results: choiceRows } = await env.DB.prepare(`
          SELECT id, question_id, label, answer_raw, answer_code, diagram_key
          FROM choices
          WHERE question_id IN (${placeholders})
          ORDER BY label ASC
        `).bind(...batch).all<any>();

        for (const c of (choiceRows ?? [])) {
          if (!choiceMap.has(c.question_id)) choiceMap.set(c.question_id, []);
          choiceMap.get(c.question_id)!.push(c);
        }
      }
    }

    for (const fq of list) {
      fq.reviews = revMap.get(Number(fq.id)) ?? [];
      if (fq.original_question_id) {
        fq.choices = choiceMap.get(Number(fq.original_question_id)) ?? [];
      } else {
        fq.choices = [];
      }
    }
  }

  return Response.json(list);
}

// ---------------------------------------------------------------------------
// POST /admin/fixed-questions/apply
// Body: { ids: number[] }
// Soft-overwrites active questions with approved fixed LaTeX without deleting
// original records (archives previous version in question_history).
// ---------------------------------------------------------------------------
export async function handleApplyFixedQuestions(
  req: Request,
  env: Env
): Promise<Response> {
  let body: { ids: number[] };
  try {
    body = await req.json();
  } catch {
    return new Response('Invalid JSON body', { status: 400 });
  }

  const ids = (body.ids || []).map(Number).filter(n => !isNaN(n));
  if (!ids.length) {
    return new Response('No fixed question IDs provided', { status: 400 });
  }

  const fqRows: any[] = [];
  const BATCH_SIZE = 50;
  for (let i = 0; i < ids.length; i += BATCH_SIZE) {
    const batch = ids.slice(i, i + BATCH_SIZE);
    const placeholders = batch.map(() => '?').join(',');
    const { results } = await env.DB.prepare(`
      SELECT * FROM fixed_questions WHERE id IN (${placeholders})
    `).bind(...batch).all<any>();
    if (results) fqRows.push(...results);
  }

  let appliedCount = 0;

  for (const fq of fqRows) {
    if (!fq.original_question_id) continue;

    const activeQ = await env.DB.prepare(`
      SELECT question_raw, question_code FROM questions WHERE id = ?
    `).bind(fq.original_question_id).first<{ question_raw: string; question_code: string }>();

    if (activeQ) {
      // Soft preserve: archive active question version to question_history
      await env.DB.prepare(`
        INSERT INTO question_history (question_id, question_raw, question_code, replaced_by_fix_id)
        VALUES (?, ?, ?, ?)
      `).bind(fq.original_question_id, activeQ.question_raw, activeQ.question_code, fq.id).run();

      // Soft-overwrite active question with fixed LaTeX
      await env.DB.prepare(`
        UPDATE questions
        SET question_raw = ?,
            question_code = ?
        WHERE id = ?
      `).bind(fq.fixed_question_raw, fq.fixed_question_code, fq.original_question_id).run();

      // Also update choice codes if choice contains latex collision
      if (fq.paper === 1) {
        const { results: choices } = await env.DB.prepare(`
          SELECT id, answer_raw, answer_code FROM choices WHERE question_id = ?
        `).bind(fq.original_question_id).all<{ id: number; answer_raw: string; answer_code: string }>();

        const pattern = /(\d)(\\+(?:log|ln|alpha|beta|theta|pi|gamma|sigma|mu|lambda|delta|omega|phi|psi|Phi|Theta|Pi|Sigma|Omega|Lambda|Delta|sin|cos|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|sqrt|frac|lim|int|sum|prod|cdot|times|div|pm|mp|partial|infty))(?![a-zA-Z])/g;

        for (const c of (choices ?? [])) {
          if ((c.answer_raw && pattern.test(c.answer_raw)) || (c.answer_code && pattern.test(c.answer_code))) {
            const newRaw = c.answer_raw ? c.answer_raw.replace(pattern, '$1 $2') : c.answer_raw;
            const newCode = c.answer_code ? c.answer_code.replace(pattern, '$1 $2') : c.answer_code;
            await env.DB.prepare(`
              UPDATE choices SET answer_raw = ?, answer_code = ? WHERE id = ?
            `).bind(newRaw, newCode, c.id).run();
          }
        }
      }

      // Mark fixed_question status as applied
      await env.DB.prepare(`
        UPDATE fixed_questions
        SET status = 'applied', applied_at = CURRENT_TIMESTAMP
        WHERE id = ?
      `).bind(fq.id).run();

      appliedCount++;
    }
  }

  return Response.json({ ok: true, appliedCount });
}

// ---------------------------------------------------------------------------
// GET /admin/fixed-questions/export?ids=1,2,3
// Generates and streams downloadable CSV of fixed questions in CAPEP1/CAPEP2 format.
// ---------------------------------------------------------------------------
export async function handleExportFixedQuestionsCSV(
  url: URL,
  env: Env
): Promise<Response> {
  const idsParam = url.searchParams.get('ids');
  const subject  = url.searchParams.get('subject');

  let fqList: any[] = [];
  const BATCH_SIZE = 50;

  if (idsParam) {
    const ids = idsParam.split(',').map(Number).filter(n => !isNaN(n));
    for (let i = 0; i < ids.length; i += BATCH_SIZE) {
      const batch = ids.slice(i, i + BATCH_SIZE);
      const placeholders = batch.map(() => '?').join(',');
      const { results } = await env.DB.prepare(`
        SELECT fq.*, q.number as q_num, q.part as q_part, q.subpart as q_subpart,
               q.unit_title, q.module_title, q.marks, q.correct_choice
        FROM fixed_questions fq
        LEFT JOIN questions q ON q.id = fq.original_question_id
        WHERE fq.id IN (${placeholders})
        ORDER BY fq.paper, fq.subject_name, fq.year, fq.number
      `).bind(...batch).all<any>();
      if (results) fqList.push(...results);
    }
  } else {
    let whereSql = subject ? 'WHERE fq.subject_name = ?' : '';
    const params = subject ? [subject] : [];
    const { results } = await env.DB.prepare(`
      SELECT fq.*, q.number as q_num, q.part as q_part, q.subpart as q_subpart,
             q.unit_title, q.module_title, q.marks, q.correct_choice
      FROM fixed_questions fq
      LEFT JOIN questions q ON q.id = fq.original_question_id
      ${whereSql}
      ORDER BY fq.paper, fq.subject_name, fq.year, fq.number
    `).bind(...params).all<any>();
    if (results) fqList = results;
  }

  const escCsv = (val: any) => {
    if (val === null || val === undefined) return '""';
    const str = String(val);
    return `"${str.replace(/"/g, '""')}"`;
  };

  const header = [
    'cape', 'paper', 'subject', 'month', 'year', 'number', 'part', 'unit_title',
    'module_title', 'marks', 'answer_key', 'question_raw', 'answer_a_raw', 'answer_b_raw',
    'answer_c_raw', 'answer_d_raw', 'validated_question_code', 'validated_answer_a_code',
    'validated_answer_b_code', 'validated_answer_c_code', 'validated_answer_d_code',
    'q', 'a', 'b', 'c', 'd', 'q_key', 'a_key', 'b_key', 'c_key', 'd_key'
  ];

  let csvContent = header.join(',') + '\n';

  const pattern1 = /(\d)(\\+(?:log|ln|alpha|beta|theta|pi|gamma|sigma|mu|lambda|delta|omega|phi|psi|Phi|Theta|Pi|Sigma|Omega|Lambda|Delta|sin|cos|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|sqrt|frac|lim|int|sum|prod|cdot|times|div|pm|mp|partial|infty))(?![a-zA-Z])/g;
  const pattern2 = /\\(sum|lim|prod|int|min|max|sup|inf)_\{(?!\()([^()}]*(?:=|\\to|\\rightarrow)[^()}]*)\}/g;
  const pattern3 = /\\(cos|sin|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|ln|log)\^\{-(?!\()([^}]+)\}/g;
  const pattern4 = /(\d)\s*\^(?:\{([^}]+)\}|([a-zA-Z0-9]))/g;

  const fixStr = (s: string | null | undefined) => {
    if (!s) return '';
    return s.replace(pattern1, '$1 $2')
            .replace(pattern2, '\\$1_{($2)}')
            .replace(pattern3, '\\$1^{(-$2)}')
            .replace(pattern4, '$1 {^$2$3}');
  };

  for (const fq of (fqList ?? [])) {
    let choices: any[] = [];
    if (fq.paper === 1 && fq.original_question_id) {
      const { results } = await env.DB.prepare(`
        SELECT label, answer_raw, answer_code, diagram_key FROM choices WHERE question_id = ? ORDER BY label
      `).bind(fq.original_question_id).all<any>();
      choices = results ?? [];
    }

    const findChoice = (lbl: string) => choices.find(c => String(c.label).toUpperCase() === lbl);
    const cA = findChoice('A');
    const cB = findChoice('B');
    const cC = findChoice('C');
    const cD = findChoice('D');

    const row = [
      escCsv('cape'),
      escCsv(fq.paper),
      escCsv(fq.subject_name ? fq.subject_name.replace(/ U[12]$/i, '') : ''),
      escCsv(fq.month || 'May'),
      escCsv(fq.year || ''),
      escCsv(fq.number),
      escCsv(fq.part || ''),
      escCsv(fq.unit_title || ''),
      escCsv(fq.module_title || ''),
      escCsv(fq.marks || ''),
      escCsv(fq.correct_choice || ''),
      escCsv(fq.fixed_question_raw),
      escCsv(fixStr(cA?.answer_raw)),
      escCsv(fixStr(cB?.answer_raw)),
      escCsv(fixStr(cC?.answer_raw)),
      escCsv(fixStr(cD?.answer_raw)),
      escCsv(fq.fixed_question_code),
      escCsv(fixStr(cA?.answer_code)),
      escCsv(fixStr(cB?.answer_code)),
      escCsv(fixStr(cC?.answer_code)),
      escCsv(fixStr(cD?.answer_code)),
      escCsv(fq.fixed_question_raw),
      escCsv(fixStr(cA?.answer_raw)),
      escCsv(fixStr(cB?.answer_raw)),
      escCsv(fixStr(cC?.answer_raw)),
      escCsv(fixStr(cD?.answer_raw)),
      escCsv(''), escCsv(''), escCsv(''), escCsv(''), escCsv('')
    ];

    csvContent += row.join(',') + '\n';
  }

  return new Response(csvContent, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="Fixed_Questions_Export_${Date.now()}.csv"`
    }
  });
}

