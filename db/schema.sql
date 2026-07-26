-- =============================================================================
-- schema.sql — CAPE Question Bank Review App
-- Cloudflare D1 / SQLite
-- =============================================================================
-- Run with:
--   wrangler d1 execute cape-questions --local --file=db/schema.sql   (local)
--   wrangler d1 execute cape-questions --file=db/schema.sql           (prod)
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Subjects
-- One row per subject unit, e.g. "AccountingU1", "PureMathematicsU2"
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS subjects (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE   -- e.g. "AccountingU1"
);

-- ---------------------------------------------------------------------------
-- Questions
-- Spine table shared by Paper 1 (MCQ) and Paper 2 (structured).
-- P1-only columns: correct_choice
-- P2-only columns: part, subpart, marks
-- Nullable diagram fields are filled by the ETL / Drive sync job.
-- The four denormalised review columns are kept in sync by POST /questions/:id/review.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS questions (
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    source_workbook         TEXT    NOT NULL,   -- 'P1' or 'P2'
    source_sheet            TEXT    NOT NULL,   -- original Excel sheet name (traceability)
    exam                    TEXT    NOT NULL,   -- 'CAPE'
    subject_id              INTEGER NOT NULL REFERENCES subjects(id),
    month                   TEXT,              -- 'May', 'June', etc.
    year                    INTEGER,
    paper                   INTEGER NOT NULL,  -- 1 or 2
    number                  INTEGER NOT NULL,  -- question number within the paper
    part                    TEXT,              -- P2 only: 'a', 'b', ...
    subpart                 TEXT,              -- P2 only: 'i', 'ii', ...
    section                 TEXT,
    topic                   TEXT,
    difficulty              TEXT,
    marks                   REAL,             -- P2 only
    correct_choice          TEXT,             -- P1 only: 'A'|'B'|'C'|'D'
    question_raw            TEXT    NOT NULL,  -- plain text / LaTeX from the spreadsheet
    question_code           TEXT    NOT NULL,  -- Swift-ready LaTeX string (validated)
    question_diagram_key    TEXT,             -- matches diagrams.diagram_key
    diagram_present         INTEGER DEFAULT 0,

    -- Denormalised review summary — source of truth is the `reviews` table.
    -- These are updated atomically by the review endpoint after each submission.
    review_count            INTEGER DEFAULT 0,
    latest_review_status    TEXT    DEFAULT 'unreviewed',  -- 'unreviewed'|'correct'|'needs_fix'
    has_conflicting_reviews INTEGER DEFAULT 0,             -- 1 when reviewers disagree

    created_at              TEXT    DEFAULT (datetime('now')),

    -- Natural key: one row per unique exam question sitting
    UNIQUE(source_workbook, subject_id, month, year, paper, number, part, subpart)
);

-- ---------------------------------------------------------------------------
-- Choices (Paper 1 only)
-- Four rows per P1 question (labels A–D).
-- Cascades on question delete so no orphan cleanup needed.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS choices (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id  INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    label        TEXT    NOT NULL,  -- 'A', 'B', 'C', 'D'
    answer_raw   TEXT    NOT NULL,  -- plain text / LaTeX from spreadsheet
    answer_code  TEXT    NOT NULL,  -- Swift-ready LaTeX string
    diagram_key  TEXT,              -- e.g. cape_accountingu1_may_2017_1_1_a

    UNIQUE(question_id, label)
);

-- ---------------------------------------------------------------------------
-- Reviewers
-- One row per reviewer name; upserted on first review submission.
-- Names are the only identity mechanism — no passwords, no OAuth.
-- The bearer token on the Worker authenticates the *app*, not the person.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reviewers (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE  -- e.g. "Aria", "Marcus"
);

-- ---------------------------------------------------------------------------
-- Reviews
-- Append-only history — never overwrite a review row.
-- Multiple reviewers can independently review the same question.
-- Conflicting verdicts are surfaced via questions.has_conflicting_reviews.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS reviews (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    reviewer_id INTEGER NOT NULL REFERENCES reviewers(id),
    status      TEXT    NOT NULL,   -- 'correct' | 'needs_fix'
    note        TEXT,               -- required when status = 'needs_fix' (enforced in app, not DB)
    created_at  TEXT    DEFAULT (datetime('now'))
);

-- ---------------------------------------------------------------------------
-- Diagrams
-- One row per unique diagram image.
-- diagram_key is the join between questions/choices and this table.
-- drive_file_id is filled in by the resolve_drive_ids.py script.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS diagrams (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    diagram_key    TEXT NOT NULL UNIQUE,  -- e.g. cape_accountingu1_may_2017_1_1
    drive_path     TEXT NOT NULL,         -- relative Drive path from the Diagrams sheet "Corrected Path"
    drive_file_id  TEXT,                  -- Google Drive fileId; NULL until resolve job runs
    status         TEXT DEFAULT 'unknown', -- from the sheet's Status/Needs Fix/Review Needed column
    last_synced_at TEXT
);

-- =============================================================================
-- Indexes
-- =============================================================================

-- Fast filtering of questions by subject/paper/year for the API list endpoint
CREATE INDEX IF NOT EXISTS idx_questions_lookup
    ON questions(subject_id, paper, year, number);

-- Fast filtering by review status (unreviewed queue)
CREATE INDEX IF NOT EXISTS idx_questions_review
    ON questions(latest_review_status);

-- Fast lookup of reviews for a question, ordered by time
CREATE INDEX IF NOT EXISTS idx_reviews_question
    ON reviews(question_id, created_at);

-- Fast diagram lookup by key
CREATE INDEX IF NOT EXISTS idx_diagrams_key
    ON diagrams(diagram_key);

-- Fast reviewer name lookup (used by the "unreviewed by me" filter subquery)
CREATE INDEX IF NOT EXISTS idx_reviewers_name
    ON reviewers(name);

-- Fast join from reviews to reviewers
CREATE INDEX IF NOT EXISTS idx_reviews_reviewer
    ON reviews(reviewer_id);
