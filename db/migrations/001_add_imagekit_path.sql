-- Migration 001: Switch from Google Drive file ID to ImageKit path
-- Run with:
--   wrangler d1 execute cape-questions --remote --file=db/migrations/001_add_imagekit_path.sql

ALTER TABLE diagrams ADD COLUMN imagekit_path TEXT;

-- imagekit_path stores the path segment after your ImageKit base URL.
-- Full image URL = {IMAGEKIT_BASE_URL}/{imagekit_path}
-- Example: if base = https://ik.imagekit.io/abc123
--          and imagekit_path = diagrams/cape_accountingu1_may_2017_1_1.png
--          then URL = https://ik.imagekit.io/abc123/diagrams/cape_accountingu1_may_2017_1_1.png
