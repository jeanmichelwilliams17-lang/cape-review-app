# ETL — Excel → Cloudflare D1

## Files

| File | Purpose |
|------|---------|
| `etl.py` | Main ETL script — reads P1/P2 Excel workbooks, emits SQL |
| `resolve_drive_ids.py` | Resolves Google Drive file IDs for diagram rows |
| `requirements.txt` | Python dependencies |

---

## Setup

```bash
cd etl
pip install -r requirements.txt
```

---

## Usage: etl.py

```bash
python etl.py --p1 ../Cape_P1_s.xlsx --p2 ../Cape_P2_s.xlsx

# Optional: specify custom output file
python etl.py --p1 ../Cape_P1_s.xlsx --p2 ../Cape_P2_s.xlsx --out load_questions.sql
```

Then load into D1:

```bash
# Local (for testing)
wrangler d1 execute cape-questions --local --file=load_questions.sql

# Production
wrangler d1 execute cape-questions --file=load_questions.sql
```

### What etl.py does

1. Opens both workbooks with `openpyxl` (`data_only=True`, `read_only=True`)
2. Iterates all sheets named `Converted - *`
3. For P1 sheets: extracts question + 4 answer choices per row
4. For P2 sheets: extracts question with Part/Subpart/Marks
5. Parses the `Diagrams` sheet (P2 workbook) for image path metadata
6. Emits idempotent `INSERT ... ON CONFLICT DO UPDATE` SQL for all tables
7. Writes output to `load_questions.sql`

The script is **idempotent**: re-running after spreadsheet corrections will
update rows in place rather than creating duplicates. This is your ongoing
sync path — not a one-time migration.

---

## Usage: resolve_drive_ids.py

After loading the ETL output, fill in `diagrams.drive_file_id` so the Worker
can proxy images from Drive.

**Step 1:** Export the diagram rows from D1 to JSON:

```bash
# Local
wrangler d1 execute cape-questions --local \
  --command "SELECT diagram_key, drive_path FROM diagrams WHERE drive_file_id IS NULL" \
  --json > diagrams_unresolved.json

# Prod
wrangler d1 execute cape-questions \
  --command "SELECT diagram_key, drive_path FROM diagrams WHERE drive_file_id IS NULL" \
  --json > diagrams_unresolved.json
```

**Step 2:** Run the resolver:

```bash
python resolve_drive_ids.py \
  --key ../service-account.json \
  --diagrams-json diagrams_unresolved.json \
  --out drive_id_updates.sql
```

**Step 3:** Load the updates:

```bash
wrangler d1 execute cape-questions --local --file=drive_id_updates.sql
wrangler d1 execute cape-questions --file=drive_id_updates.sql
```

### Re-running

Run `resolve_drive_ids.py` again whenever:
- New diagram rows were added by a fresh ETL import
- A Drive file was moved and its file ID changed
- You want to reconcile the D1 diagram table against the actual Drive folder tree

---

## Diagram Key Convention

```
cape_{subject_slug}_{month_slug}_{year}_{paper}_{number}
cape_{subject_slug}_{month_slug}_{year}_{paper}_{number}_{choice_label}
```

- `subject_slug`: lowercase, spaces removed (`AccountingU1` → `accountingu1`)
- `month_slug`: lowercase (`May` → `may`)
- `choice_label`: lowercase single letter (`A` → `a`)

Examples:
- `cape_accountingu1_may_2017_1_1`
- `cape_accountingu1_may_2017_1_1_a`
- `cape_chemistryu2_june_2024_2_3`
