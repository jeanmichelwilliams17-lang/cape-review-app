-- ===========================================================================
-- High-Performance Database Indexes for Cloudflare D1
-- ===========================================================================

-- 1. `questions` table indexes
CREATE INDEX IF NOT EXISTS idx_questions_subject_paper_status 
    ON questions(subject_id, paper, latest_review_status);

CREATE INDEX IF NOT EXISTS idx_questions_year_paper_num 
    ON questions(year, paper, number);

CREATE INDEX IF NOT EXISTS idx_questions_paper_num_part 
    ON questions(paper, number, part, subpart);

CREATE INDEX IF NOT EXISTS idx_questions_diagram_key 
    ON questions(question_diagram_key);

CREATE INDEX IF NOT EXISTS idx_questions_conflicts 
    ON questions(has_conflicting_reviews);

-- 2. `choices` table indexes
CREATE INDEX IF NOT EXISTS idx_choices_question_id 
    ON choices(question_id);

CREATE INDEX IF NOT EXISTS idx_choices_diagram_key 
    ON choices(diagram_key);

CREATE INDEX IF NOT EXISTS idx_choices_question_label 
    ON choices(question_id, label);

-- 3. `fixed_questions` table indexes
CREATE INDEX IF NOT EXISTS idx_fixed_questions_status 
    ON fixed_questions(status, created_at);

CREATE INDEX IF NOT EXISTS idx_fixed_questions_orig_id 
    ON fixed_questions(original_question_id);

CREATE INDEX IF NOT EXISTS idx_fixed_questions_subject_paper 
    ON fixed_questions(subject_name, paper, year, number);

CREATE INDEX IF NOT EXISTS idx_fixed_questions_fix_type 
    ON fixed_questions(fix_type);

-- 4. `fixed_question_reviews` table indexes
CREATE INDEX IF NOT EXISTS idx_fqr_fixed_question_id 
    ON fixed_question_reviews(fixed_question_id, reviewed_at);

CREATE INDEX IF NOT EXISTS idx_fqr_reviewer 
    ON fixed_question_reviews(reviewer_id);

-- 5. `question_history` table indexes
CREATE INDEX IF NOT EXISTS idx_qh_question_id 
    ON question_history(question_id, archived_at);

CREATE INDEX IF NOT EXISTS idx_qh_fix_id 
    ON question_history(replaced_by_fix_id);

-- 6. `reviews` table indexes
CREATE INDEX IF NOT EXISTS idx_reviews_status 
    ON reviews(status);

CREATE INDEX IF NOT EXISTS idx_reviews_created_at 
    ON reviews(created_at);

-- 7. `diagrams` table indexes
CREATE INDEX IF NOT EXISTS idx_diagrams_status 
    ON diagrams(status);

CREATE INDEX IF NOT EXISTS idx_diagrams_drive_path 
    ON diagrams(drive_path);
