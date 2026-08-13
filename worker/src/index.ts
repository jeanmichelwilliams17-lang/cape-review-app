// =============================================================================
// index.ts — Cloudflare Worker main fetch handler + public API routing
// =============================================================================

import { Env } from './types';
import { handleImageProxy } from './drive';
import {
  handleGetPapers,
  handleImport,
  handleAdminGetQuestions,
  handleUpdateQuestion,
  handleDeleteQuestion,
  handleDeletePaper,
  handleDebugImageKit,
} from './admin';

export default {
  async fetch(request: Request, env: Env, _ctx: ExecutionContext): Promise<Response> {
    const url = new URL(request.url);
    const { pathname, method } = { pathname: url.pathname, method: request.method };

    // ─────────────────────────────────────────────────────────────────────────
    // CORS preflight — must come BEFORE auth so browsers can complete the
    // preflight handshake (OPTIONS has no Authorization header by spec).
    // ─────────────────────────────────────────────────────────────────────────
    if (method === 'OPTIONS') {
      return new Response(null, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Authorization, Content-Type',
          'Access-Control-Max-Age': '86400',
        },
      });
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Auth — every non-preflight request must carry the bearer token.
    // Images are public (ImageKit signed URLs handle their own auth).
    // ─────────────────────────────────────────────────────────────────────────
    const imageMatch = pathname.match(/^\/images\/([^/]+)$/);
    const isImageRequest = ((imageMatch && method === 'GET') || pathname === '/images/debug-imagekit');

    if (pathname === '/images/debug-imagekit' && method === 'GET') {
      return withCors(await handleDebugImageKit(env));
    }

    if (!isImageRequest) {
      const authHeader = request.headers.get('Authorization');
      if (authHeader !== `Bearer ${env.API_TOKEN}`) {
        return new Response('Unauthorized', {
          status: 401,
          headers: { 'Access-Control-Allow-Origin': '*' },
        });
      }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Helper — wrap every handler in CORS headers
    // ─────────────────────────────────────────────────────────────────────────
    function withCors(response: Response): Response {
      const r = new Response(response.body, response);
      r.headers.set('Access-Control-Allow-Origin', '*');
      return r;
    }

    try {
      if (pathname === '/admin/debug-imagekit' && method === 'GET') {
        return withCors(await handleDebugImageKit(env));
      }

      // -----------------------------------------------------------------------
      // GET /subjects — lists subjects with Unit 1 / Unit 2 separation
      // -----------------------------------------------------------------------
      if (pathname === '/subjects' && method === 'GET') {
        const { results } = await env.DB.prepare(`
          SELECT
            s.id,
            CASE
              WHEN s.name LIKE '%U1' OR s.name LIKE '%U2' THEN s.name
              WHEN q.question_diagram_key LIKE 'cape_1_%' THEN s.name || ' U1'
              WHEN q.question_diagram_key LIKE 'cape_2_%' THEN s.name || ' U2'
              ELSE s.name || ' U1'
            END AS name,
            q.year,
            SUM(CASE WHEN q.paper = 1 THEN 1 ELSE 0 END) AS p1_count,
            SUM(CASE WHEN q.paper = 2 THEN 1 ELSE 0 END) AS p2_count
          FROM subjects s
          JOIN questions q ON q.subject_id = s.id
          GROUP BY s.id, name, q.year
          ORDER BY name, q.year
        `).all();
        return withCors(Response.json(results));
      }

      // -----------------------------------------------------------------------
      // GET /reviewers
      // -----------------------------------------------------------------------
      if (pathname === '/reviewers' && method === 'GET') {
        const { results } = await env.DB.prepare(
          `SELECT id, name FROM reviewers ORDER BY name`
        ).all();
        return withCors(Response.json(results));
      }

      // -----------------------------------------------------------------------
      // GET /questions
      // Supports: paper, subject, review_status, reviewer, cursor, limit
      // -----------------------------------------------------------------------
      if (pathname === '/questions' && method === 'GET') {
        const paper    = url.searchParams.get('paper');
        const rawSubj  = url.searchParams.get('subject');
        const status   = url.searchParams.get('review_status');
        const reviewer = url.searchParams.get('reviewer');
        const limit    = Number(url.searchParams.get('limit')  ?? 50);
        const cursor   = Number(url.searchParams.get('cursor') ?? 0);

        let baseSubject = rawSubj;
        let unitPattern: string | null = null;
        if (rawSubj) {
          const match = rawSubj.match(/^(.*?)\s*(?:Unit\s*([12])|U([12]))$/i);
          if (match) {
            baseSubject = match[1].trim();
            const uNum = match[2] || match[3];
            unitPattern = `cape_${uNum}_%`;
          }
        }

        const { results } = await env.DB.prepare(`
          SELECT q.*, s.name AS subject_name
          FROM questions q
          JOIN subjects s ON s.id = q.subject_id
          WHERE (?1 IS NULL OR q.paper = CAST(?1 AS INTEGER))
            AND (?2 IS NULL OR s.name = ?2 OR s.name = ?7)
            AND (?8 IS NULL OR q.question_diagram_key LIKE ?8)
            AND (
              ?3 IS NULL
              OR (
                ?3 = 'unreviewed'
                AND ?4 IS NULL
                AND q.review_count = 0
              )
              OR (
                ?3 = 'unreviewed'
                AND ?4 IS NOT NULL
                AND NOT EXISTS (
                  SELECT 1 FROM reviews r
                  JOIN reviewers rv ON rv.id = r.reviewer_id
                  WHERE r.question_id = q.id AND rv.name = ?4
                )
              )
              OR (?3 != 'unreviewed' AND q.latest_review_status = ?3)
            )
          ORDER BY q.id
          LIMIT ?5 OFFSET ?6
        `).bind(paper, rawSubj, status, reviewer, limit, cursor, baseSubject, unitPattern).all();

        return withCors(Response.json(results));
      }

      // -----------------------------------------------------------------------
      // GET /questions/:id  — full detail including choices + review history
      // -----------------------------------------------------------------------
      const questionDetailMatch = pathname.match(/^\/questions\/(\d+)$/);
      if (questionDetailMatch && method === 'GET') {
        const id = questionDetailMatch[1];

        const question = await env.DB.prepare(`
          SELECT q.*, s.name AS subject_name
          FROM questions q JOIN subjects s ON s.id = q.subject_id
          WHERE q.id = ?
        `).bind(Number(id)).first();

        if (!question) {
          return withCors(new Response('Not found', { status: 404 }));
        }

        const { results: choices } = await env.DB.prepare(
          `SELECT * FROM choices WHERE question_id = ? ORDER BY label`
        ).bind(Number(id)).all();

        const { results: reviews } = await env.DB.prepare(`
          SELECT rv.name AS reviewer, r.status, r.note, r.created_at
          FROM reviews r
          JOIN reviewers rv ON rv.id = r.reviewer_id
          WHERE r.question_id = ?
          ORDER BY r.created_at DESC
        `).bind(Number(id)).all();

        return withCors(Response.json({ ...question, choices, reviews }));
      }

      // -----------------------------------------------------------------------
      // POST /questions/:id/review
      // Appends a review row. Never overwrites existing reviews.
      // Recomputes the denormalized summary on the question row.
      // -----------------------------------------------------------------------
      const reviewMatch = pathname.match(/^\/questions\/(\d+)\/review$/);
      if (reviewMatch && method === 'POST') {
        const id = reviewMatch[1];
        let body: { reviewer: string; status: string; note?: string };
        try {
          body = await request.json();
        } catch {
          return withCors(new Response('Invalid JSON body', { status: 400 }));
        }

        const { reviewer, status, note } = body;
        if (!reviewer || !['correct', 'needs_fix'].includes(status)) {
          return withCors(new Response('reviewer and valid status required', { status: 400 }));
        }

        // Upsert reviewer
        await env.DB.prepare(
          `INSERT INTO reviewers (name) VALUES (?) ON CONFLICT(name) DO NOTHING`
        ).bind(reviewer).run();
        const reviewerRow = await env.DB.prepare(
          `SELECT id FROM reviewers WHERE name = ?`
        ).bind(reviewer).first<{ id: number }>();

        // Append review
        await env.DB.prepare(
          `INSERT INTO reviews (question_id, reviewer_id, status, note) VALUES (?, ?, ?, ?)`
        ).bind(Number(id), reviewerRow!.id, status, note ?? null).run();

        // Recompute denormalized summary from the two most recent reviews
        const { results: recent } = await env.DB.prepare(
          `SELECT status FROM reviews WHERE question_id = ? ORDER BY created_at DESC LIMIT 2`
        ).bind(Number(id)).all<{ status: string }>();

        const latest   = recent[0]?.status ?? 'unreviewed';
        const conflict = (recent.length > 1 && recent[1].status !== latest) ? 1 : 0;

        await env.DB.prepare(`
          UPDATE questions
          SET review_count = review_count + 1,
              latest_review_status = ?,
              has_conflicting_reviews = ?
          WHERE id = ?
        `).bind(latest, conflict, Number(id)).run();

        return withCors(Response.json({ ok: true }));
      }

      // -----------------------------------------------------------------------
      // DELETE /questions/:id/review — remove a reviewer's review
      // -----------------------------------------------------------------------
      const deleteReviewMatch = pathname.match(/^\/questions\/(\d+)\/review$/);
      if (deleteReviewMatch && method === 'DELETE') {
        const id = deleteReviewMatch[1];
        let body: { reviewer: string };
        try {
          body = await request.json();
        } catch {
          return withCors(new Response('Invalid JSON body', { status: 400 }));
        }
        const { reviewer } = body;
        if (!reviewer) {
          return withCors(new Response('reviewer required', { status: 400 }));
        }

        const reviewerRow = await env.DB.prepare(
          `SELECT id FROM reviewers WHERE name = ?`
        ).bind(reviewer).first<{ id: number }>();

        if (!reviewerRow) {
          return withCors(new Response('Reviewer not found', { status: 404 }));
        }

        await env.DB.prepare(
          `DELETE FROM reviews WHERE question_id = ? AND reviewer_id = ?`
        ).bind(Number(id), reviewerRow.id).run();

        // Recompute denormalized summary
        const { results: recent } = await env.DB.prepare(
          `SELECT status FROM reviews WHERE question_id = ? ORDER BY created_at DESC LIMIT 2`
        ).bind(Number(id)).all<{ status: string }>();

        const latest   = recent[0]?.status ?? 'unreviewed';
        const conflict = (recent.length > 1 && recent[1].status !== latest) ? 1 : 0;
        const count    = recent.length;

        await env.DB.prepare(`
          UPDATE questions
          SET review_count = ?,
              latest_review_status = ?,
              has_conflicting_reviews = ?
          WHERE id = ?
        `).bind(count, latest, conflict, Number(id)).run();

        return withCors(Response.json({ ok: true }));
      }

      // -----------------------------------------------------------------------
      // GET /stats
      // Per-subject/paper totals: total, reviewed, unreviewed, conflicting
      // -----------------------------------------------------------------------
      if (pathname === '/stats' && method === 'GET') {
        const { results } = await env.DB.prepare(`
          SELECT
            s.name                                                  AS subject,
            q.paper,
            q.year,
            COUNT(*)                                                AS total,
            SUM(CASE WHEN q.review_count > 0 THEN 1 ELSE 0 END)   AS reviewed,
            SUM(CASE WHEN q.review_count = 0 THEN 1 ELSE 0 END)   AS unreviewed,
            SUM(q.has_conflicting_reviews)                          AS conflicts
          FROM questions q
          JOIN subjects s ON s.id = q.subject_id
          GROUP BY s.name, q.paper, q.year
          ORDER BY s.name, q.paper, q.year
        `).all();
        return withCors(Response.json(results));
      }

      // -----------------------------------------------------------------------
      // GET /images/:diagram_key  — live Drive proxy with edge caching (public)
      // -----------------------------------------------------------------------
      if (isImageRequest && imageMatch) {
        return withCors(await handleImageProxy(request, env, imageMatch[1]));
      }

      // -----------------------------------------------------------------------
      // /admin/* routes — handled by admin.ts
      // Cloudflare Access enforces identity at the edge before reaching here.
      // -----------------------------------------------------------------------
      if (pathname.startsWith('/admin/')) {
        if (pathname === '/admin/papers' && method === 'GET') {
          return withCors(await handleGetPapers(env));
        }
        if (pathname === '/admin/import' && method === 'POST') {
          return withCors(await handleImport(request, env));
        }
        if (pathname === '/admin/questions' && method === 'GET') {
          return withCors(await handleAdminGetQuestions(url, env));
        }
        if (pathname === '/admin/papers' && method === 'DELETE') {
          return withCors(await handleDeletePaper(request, env));
        }

        const adminQMatch = pathname.match(/^\/admin\/questions\/(\d+)$/);
        if (adminQMatch && method === 'PUT') {
          return withCors(await handleUpdateQuestion(request, env, adminQMatch[1]));
        }
        if (adminQMatch && method === 'DELETE') {
          return withCors(await handleDeleteQuestion(env, adminQMatch[1]));
        }
      }

      return withCors(new Response('Not found', { status: 404 }));
    } catch (err) {
      console.error('Worker error:', err);
      return withCors(new Response('Internal Server Error', { status: 500 }));
    }
  },
};
