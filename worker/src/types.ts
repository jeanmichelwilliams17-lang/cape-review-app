// =============================================================================
// types.ts — Cloudflare Worker environment bindings and shared types
// =============================================================================

export interface Env {
  /** D1 database binding — set in wrangler.toml */
  DB: D1Database;

  /** Bearer token required on every request from the iOS app / admin UI */
  API_TOKEN: string;

  /** ImageKit URL endpoint, e.g. https://ik.imagekit.io/YOUR_ID (set via wrangler.toml vars) */
  IMAGEKIT_BASE_URL: string;

  /** ImageKit public key (set via wrangler.toml vars) */
  IMAGEKIT_PUBLIC_KEY: string;

  /** ImageKit private key for signed URL generation (set via wrangler secret) */
  IMAGEKIT_PRIVATE_KEY: string;

  /** Folder inside ImageKit where diagram images are stored (default: "diagrams") */
  IMAGEKIT_FOLDER: string;

  /** Set via [vars] in wrangler.toml */
  ENVIRONMENT: string;
}

// ---------------------------------------------------------------------------
// DB row shapes (matching schema.sql column names exactly)
// ---------------------------------------------------------------------------

export interface SubjectRow {
  id: number;
  name: string;
}

export interface QuestionRow {
  id: number;
  source_workbook: string;
  source_sheet: string;
  exam: string;
  subject_id: number;
  subject_name?: string; // joined from subjects
  month: string | null;
  year: number | null;
  paper: number;
  number: number;
  part: string | null;
  subpart: string | null;
  section: string | null;
  topic: string | null;
  difficulty: string | null;
  marks: number | null;
  correct_choice: string | null;
  question_raw: string;
  question_code: string;
  question_diagram_key: string | null;
  diagram_present: number;
  review_count: number;
  latest_review_status: string;
  has_conflicting_reviews: number;
  created_at: string;
}

export interface ChoiceRow {
  id: number;
  question_id: number;
  label: string;
  answer_raw: string;
  answer_code: string;
  diagram_key: string | null;
}

export interface ReviewerRow {
  id: number;
  name: string;
}

export interface ReviewRow {
  id: number;
  question_id: number;
  reviewer_id: number;
  reviewer?: string; // joined from reviewers
  status: string;
  note: string | null;
  created_at: string;
}

export interface DiagramRow {
  id: number;
  diagram_key: string;
  drive_path: string;
  drive_file_id: string | null;
  status: string;
  last_synced_at: string | null;
}

// ---------------------------------------------------------------------------
// Request / Response shapes
// ---------------------------------------------------------------------------

export interface ReviewSubmission {
  reviewer: string;
  status: 'correct' | 'needs_fix';
  note?: string;
}

export interface ImportRow {
  [key: string]: unknown;
  Question?: string;
  Subject?: string;
  Exam?: string;
  Month?: string;
  Year?: number;
  Paper?: number;
  Number?: number;
  Part?: string;
  Subpart?: string;
  Section?: string;
  Topic?: string;
  Difficulty?: string;
  Marks?: number;
  Correct?: string;
  'Answer A'?: string;
  'Answer B'?: string;
  'Answer C'?: string;
  'Answer D'?: string;
  'Question Diagram Path Prefix'?: string;
  'A Diagram Path Prefix'?: string;
  'B Diagram Path Prefix'?: string;
  'C Diagram Path Prefix'?: string;
  'D Diagram Path Prefix'?: string;
  'Validated Question Code'?: string;
}
