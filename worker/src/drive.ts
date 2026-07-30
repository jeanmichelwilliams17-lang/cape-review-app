// =============================================================================
// imagekit.ts — ImageKit image delivery with DB path lookup
// =============================================================================
//
// Images are stored in nested ImageKit folders:
//   {IMAGEKIT_FOLDER}/{Subject}/P{paper}/{year}/output/{filename}.png
//
// We query the questions table to get the subject name, paper, and year,
// then construct the full ImageKit path and sign it.
//
// The diagram_key in the DB is all-lowercase but the actual filenames may
// preserve subject casing. We try the DB key first, then a reconstructed
// key using the subject name casing from the DB.
//
// Signed URL format (ImageKit docs):
//   signature = HMAC-SHA1( privateKey, urlPath + expiry )
//   final URL = baseURL/path?ik-s={signature}&ik-t={expiry}
// =============================================================================

import { Env } from './types';

const EXPIRY_SECONDS = 3600; // 1 hour

/**
 * Handles GET /images/:diagram_key
 * Looks up subject/paper/year from D1, signs the ImageKit URL, and redirects.
 */
export async function handleImageProxy(
  _request: Request,
  env: Env,
  diagramKey: string
): Promise<Response> {
  const base = env.IMAGEKIT_BASE_URL.replace(/\/$/, '');
  const folder = (env.IMAGEKIT_FOLDER ?? 'Diagrams').replace(/^\/|\/$/g, '');

  let imgPath: string;
  try {
    const row = await env.DB.prepare(`
      SELECT s.name AS subject_name, q.paper, q.year
      FROM questions q
      JOIN subjects s ON s.id = q.subject_id
      WHERE q.question_diagram_key = ?1
      LIMIT 1
    `).bind(diagramKey).first<{ subject_name: string; paper: number; year: number }>();

    if (row) {
      const parts = diagramKey.split('_');
      const month = parts.length >= 4 ? parts[2] : 'unknown';
      const num = parts.length >= 6 ? parts[parts.length - 1] : '0';
      // Subject name is e.g. "AppliedMathematicsU1"
      // ImageKit filename uses: lowercase alphabetic part + preserve unit suffix (U1)
      const subjectSlug = row.subject_name.replace(/\s+/g, '');
      // "AppliedMathematicsU1" → "appliedmathematicsU1"
      // Split: PascalCase letters + unit suffix (e.g. U1, U2)
      const unitMatch = subjectSlug.match(/^(.*?)(U\d+)$/);
      const fileSubjectSlug = unitMatch
        ? unitMatch[1].toLowerCase() + unitMatch[2]
        : subjectSlug.toLowerCase();
      const reconstructedKey = `cape_${fileSubjectSlug}_${month}_${row.year}_${row.paper}_${num}`;
      imgPath = `${folder}/${row.subject_name}/P${row.paper}/${row.year}/output/${reconstructedKey}.png`;
    } else {
      imgPath = `${folder}/${diagramKey}.png`;
    }
  } catch {
    imgPath = `${folder}/${diagramKey}.png`;
  }

  const expiry = Math.floor(Date.now() / 1000) + EXPIRY_SECONDS;
  const signature = await hmacSha1Hex(env.IMAGEKIT_PRIVATE_KEY, `${imgPath}${expiry}`);
  const signedUrl = `${base}/${imgPath}?ik-s=${signature}&ik-t=${expiry}`;

  return Response.redirect(signedUrl, 302);
}

// ── HMAC-SHA1 via Web Crypto API (built into Cloudflare Workers) ─────────────
async function hmacSha1Hex(secret: string, message: string): Promise<string> {
  const enc = new TextEncoder();
  const key = await crypto.subtle.importKey(
    'raw', enc.encode(secret),
    { name: 'HMAC', hash: 'SHA-1' },
    false, ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', key, enc.encode(message));
  const bytes = new Uint8Array(sig);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('');
}
