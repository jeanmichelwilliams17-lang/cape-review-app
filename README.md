# CAPE Question Bank Review App

A full-stack review pipeline for CAPE exam questions — multi-reviewer, multi-paper, with LaTeX rendering on iOS and a browser-based admin interface.

---

## Architecture Overview

| Layer | Technology |
|-------|------------|
| Database | Cloudflare D1 (SQLite) |
| API | Cloudflare Worker (TypeScript) |
| Image Store | Google Drive (live-proxied, never mirrored) |
| Admin UI | Static SPA on Cloudflare Pages (SheetJS + KaTeX) |
| iOS App | SwiftUI + LaTeXSwiftUI |
| Auth (admin) | Cloudflare Access (Zero Trust) — no login code to write |
| Auth (app) | Shared Bearer Token stored in iOS Keychain |

---

## Repo Structure

```
/
├── db/                     # SQL schema and migrations
│   └── schema.sql
├── worker/                 # Cloudflare Worker (TypeScript API)
│   ├── src/
│   │   ├── index.ts        # Main fetch handler + routing
│   │   ├── admin.ts        # /admin/* route handlers
│   │   ├── drive.ts        # Google Drive service-account token + proxy
│   │   └── types.ts        # Env bindings + shared types
│   ├── package.json
│   ├── tsconfig.json
│   └── wrangler.toml
├── etl/                    # Python ETL: Excel → D1
│   ├── etl.py
│   ├── resolve_drive_ids.py
│   ├── requirements.txt
│   └── README.md
├── admin-ui/               # Web Admin SPA (Cloudflare Pages)
│   ├── index.html
│   ├── style.css
│   └── app.js
├── ios/                    # Xcode project (SwiftUI)
│   └── FailBetter/
├── tasklist.md             # Detailed project task tracker
└── plan.md                 # Full implementation plan
```

---

## Quick Start

### Prerequisites
- [Node.js 20+](https://nodejs.org)
- [Wrangler CLI](https://developers.cloudflare.com/workers/wrangler/install-and-update/) (`npm install -g wrangler`)
- [Python 3.10+](https://python.org) + `openpyxl` (`pip install openpyxl`)
- A Cloudflare account (free tier is sufficient)
- A Google Cloud project with Drive API enabled + a service account

### 1. Database Setup

```bash
# Create the D1 database (one time)
wrangler d1 create cape-questions

# Copy the database_id output into worker/wrangler.toml

# Apply schema locally
wrangler d1 execute cape-questions --local --file=db/schema.sql

# Apply schema to production
wrangler d1 execute cape-questions --file=db/schema.sql
```

### 2. ETL — Load Questions from Excel

```bash
cd etl
pip install -r requirements.txt
python etl.py --p1 ../Cape_P1_s.xlsx --p2 ../Cape_P2_s.xlsx

# Load into D1 (local)
wrangler d1 execute cape-questions --local --file=load_questions.sql

# Load into D1 (production)
wrangler d1 execute cape-questions --file=load_questions.sql
```

### 3. Google Drive Setup

1. Enable the Drive API in Google Cloud Console
2. Create a service account → download the JSON key
3. Share your Diagrams Drive folder with the service account email (Viewer role)
4. Run the resolver to fill in `drive_file_id` values:

```bash
cd etl
python resolve_drive_ids.py --key ../service-account.json
```

5. Add the key as a Worker secret:

```bash
cat service-account.json | wrangler secret put DRIVE_SERVICE_ACCOUNT_JSON
```

### 4. Worker — Deploy API

```bash
cd worker
npm install

# Set the API bearer token
wrangler secret put API_TOKEN

# Test locally against local D1
wrangler dev --local

# Deploy to Cloudflare
wrangler deploy
```

### 5. Admin UI — Deploy

```bash
# Deploy to Cloudflare Pages
wrangler pages deploy admin-ui/ --project-name cape-admin

# Then configure Cloudflare Access in the Zero Trust dashboard:
# Zero Trust → Access → Applications → Add Pages site → add email allow-list policy
```

### 6. iOS App

1. Open `ios/FailBetter.xcodeproj` in Xcode
2. Add your Worker URL and API token in `Settings` on first launch
3. Build to device (Personal Team signing, no App Store needed)
4. Share via TestFlight internal testing for other reviewers

---

## Secrets Reference

| Secret | Where set | Description |
|--------|-----------|-------------|
| `API_TOKEN` | `wrangler secret put` | Bearer token required by the iOS app and admin UI |
| `DRIVE_SERVICE_ACCOUNT_JSON` | `wrangler secret put` | Google service account JSON key (read-only Drive access) |

---

## Diagram Key Convention

Images are looked up by a `diagram_key` built deterministically from the question metadata:

```
cape_{subject_slug}_{month_slug}_{year}_{paper}_{number}
cape_{subject_slug}_{month_slug}_{year}_{paper}_{number}_{choice_label}   ← for choice diagrams
```

Example: `cape_accountingu1_may_2017_1_1`, `cape_accountingu1_may_2017_1_1_a`

Subject slug: lowercase, no spaces (`AccountingU1` → `accountingu1`).  
Month slug: lowercase (`May` → `may`).

---

## Review Workflow

1. Reviewer opens the iOS app → types their name once → it's stored in `@AppStorage`
2. App fetches questions **not yet reviewed by this reviewer** (personal queue, not global)
3. Reviewer flips through with Prev/Next, taps ✅ Correct or ⚠️ Needs Fix (+ optional note)
4. Submitting auto-advances to the next question
5. If two reviewers disagree, the question is flagged `has_conflicting_reviews = 1`
6. Stats screen shows review progress per subject/paper and open conflict count

---

## Re-uploading a Corrected Paper

**Minor fixes (typos in a few rows):** Just re-upload the corrected file through the Admin UI upload screen.  
The import is idempotent — rows matching the natural key (subject/paper/year/month/number/part/subpart) are updated in place.

**Structural fixes (renumbered questions, added/removed rows):** Use "Delete Paper" in Admin UI first, then upload the corrected file clean.

---

## See Also

- [`plan.md`](./plan.md) — full architecture and design decisions
- [`tasklist.md`](./tasklist.md) — build progress tracker
