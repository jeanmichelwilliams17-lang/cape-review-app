// =============================================================================
// admin.ts — /admin/* route handlers for the Web Admin UI
// =============================================================================
// All routes here are behind Cloudflare Access at the edge — by the time a
// request reaches this code it has already been authenticated. No auth checks
// needed inside these handlers.
// =============================================================================

import { Env, ImportRow } from './types';

// ---------------------------------------------------------------------------
// Helper: debug ImageKit media library API
// ---------------------------------------------------------------------------
export async function handleDebugImageKit(env: Env): Promise<Response> {
  const privateKey = env.IMAGEKIT_PRIVATE_KEY ?? '';
  const authHeader = 'Basic ' + btoa(privateKey + ':');

  try {
    const res = await fetch('https://api.imagekit.io/v1/files?limit=25', {
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
// Helper: normalise the Unit column value → just the number string
// "U2" → "2", "Unit 2" → "2", "2" → "2"
// ---------------------------------------------------------------------------
function normaliseUnit(unit: string | undefined): string {
  if (!unit) return 'u';
  return String(unit).trim()
    .replace(/^[Uu]nit\s*/i, '')  // strip "Unit " prefix
    .replace(/^[Uu]/i, '')         // strip leading "U"
    .trim() || 'u';
}

// ---------------------------------------------------------------------------
// Helper: build a diagram_key from a row's metadata
// Format: cape_{unit}_{subject_slug}_{month_slug}_{year}_{paper}_{number}
//         + optional _{choice_label} for choice diagrams
//
// Subject is stored combined (e.g. "PhysicsU2") — we strip the trailing
// unit suffix to get the slug (e.g. "physics"), then put the unit first.
// Example: PhysicsU2 + Unit "2" → cape_2_physics_may_2024_1_45
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
  const unitSlug    = normaliseUnit(unit);
  // Strip trailing unit suffix from combined subject name (e.g. "PhysicsU2" → "physics")
  const subjectSlug = subject.toLowerCase().replace(/\s+/g, '').replace(/u\d+$/i, '');
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

export async function handleImport(req: Request, env: Env): Promise<Response> {
  let body: { paper: 1 | 2; rows: ImportRow[] };
  try {
    body = await req.json();
  } catch {
    return new Response('Invalid JSON body', { status: 400 });
  }

  const { paper, rows } = body;
  if (paper !== 1 && paper !== 2) {
    return new Response('paper must be 1 or 2', { status: 400 });
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

    const subject = String(row.Subject ?? '').trim();
    if (!subject) { skipped++; continue; }

    const unit      = row.Unit ? String(row.Unit) : undefined;
    const subjectId = await getSubjectId(subject);
    const month     = row.Month   ? String(row.Month)   : null;
    const year      = row.Year    ? Number(row.Year)    : null;
    const num       = Number(row.Number ?? 0);
    const part      = row.Part    ? String(row.Part)    : null;
    const subpart   = row.Subpart ? String(row.Subpart) : null;

    const diagKey = buildDiagramKey(
      subject, month ?? undefined, year ?? undefined, paper, num, unit
    );

    // Validated question code: prefer 'Validated Question Code', fall back to raw
    const questionCode  = String(row['Validated Question Code'] ?? row.Question);
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

        const answerText = row[answerRawKey] ? String(row[answerRawKey]) : '';
        if (!answerText) continue;

        // Prefer 'Validated Answer X Code', then single-letter shorthand, then raw
        const answerCode = String(row[answerCodeKey] ?? row[shorthandKey] ?? answerText);

        const choiceDiagKey = buildDiagramKey(
          subject, month ?? undefined, year ?? undefined, paper, num, unit, label
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
            row[diagPrefixKey] ? String(row[diagPrefixKey]) : choiceDiagKey,
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

  return Response.json({ imported: processed, skipped });
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
  const limit   = Number(url.searchParams.get('limit')  ?? 50);
  const cursor  = Number(url.searchParams.get('cursor') ?? 0);

  let statusClause = '';
  let statusParam: string | null = null;
  if (status === 'unreviewed') {
    statusClause = 'AND q.review_count = 0';
  } else if (status === 'reviewed') {
    statusClause = 'AND q.review_count > 0';
  } else if (status === 'correct' || status === 'needs_fix') {
    statusClause = 'AND q.latest_review_status = ?5';
    statusParam = status;
  }

  const { results } = await env.DB.prepare(`
    SELECT q.*, s.name AS subject_name
    FROM questions q
    JOIN subjects s ON s.id = q.subject_id
    WHERE (?1 IS NULL OR s.name = ?1)
      AND (?2 IS NULL OR q.paper = ?2)
      AND (?3 IS NULL OR q.year  = ?3)
      AND (?4 IS NULL OR q.month = ?4)
      ${statusClause}
    ORDER BY q.id
    LIMIT ?6 OFFSET ?7
  `).bind(subject, paper, year, month, statusParam, limit, cursor).all();

  return Response.json(results);
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
