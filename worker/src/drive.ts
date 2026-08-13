// =============================================================================
// imagekit.ts — ImageKit image delivery with DB path lookup
// =============================================================================
//
// Images are stored in nested ImageKit folders:
//   {IMAGEKIT_FOLDER}/{Subject}/P{paper}/{year}/output/{filename}.png
//
// We query:
//   1. `diagrams` table for direct `drive_path` lookup.
//   2. `questions` + `choices` + `subjects` table to reconstruct ImageKit path.
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

  let imgPath: string | null = null;

  try {
    // 1. First priority: Check `diagrams` table for explicit drive_path
    const diagRow = await env.DB.prepare(`
      SELECT drive_path FROM diagrams WHERE diagram_key = ?1 LIMIT 1
    `).bind(diagramKey).first<{ drive_path: string }>();

    if (diagRow?.drive_path) {
      imgPath = diagRow.drive_path;
    } else {
      // 2. Second priority: Query questions/choices/subjects to find subject, paper, year
      const choiceMatch = diagramKey.match(/_([abcd])$/i);
      const baseDiagramKey = choiceMatch ? diagramKey.replace(/_([abcd])$/i, '') : diagramKey;

      const row = await env.DB.prepare(`
        SELECT s.name AS subject_name, q.paper, q.year, q.number, q.month
        FROM questions q
        JOIN subjects s ON s.id = q.subject_id
        LEFT JOIN choices c ON c.question_id = q.id
        WHERE q.question_diagram_key = ?1 OR c.diagram_key = ?1 OR q.question_diagram_key = ?2
        LIMIT 1
      `).bind(diagramKey, baseDiagramKey).first<{
        subject_name: string;
        paper: number;
        year: number;
        number: number;
        month: string | null;
      }>();

      if (row && row.paper && row.year) {
        imgPath = `${row.subject_name}/P${row.paper}/${row.year}/output/${diagramKey}.png`;
      }
    }
  } catch (err) {
    console.error('Image proxy lookup error:', err);
  }

  // Fallback if no metadata found in DB
  if (!imgPath) {
    imgPath = `${diagramKey}.png`;
  }

  // Clean path format with folder prefix
  let cleanPath = imgPath.replace(/^\/+/, '');
  if (folder && !cleanPath.toLowerCase().startsWith(folder.toLowerCase() + '/')) {
    cleanPath = `${folder}/${cleanPath}`;
  }

  const pathForSignature = cleanPath.startsWith('/') ? cleanPath : '/' + cleanPath;
  const expiry = Math.floor(Date.now() / 1000) + EXPIRY_SECONDS;
  const signature = await hmacSha1Hex(env.IMAGEKIT_PRIVATE_KEY, `${pathForSignature}${expiry}`);
  const signedUrl = `${base}${pathForSignature}?ik-s=${signature}&ik-t=${expiry}`;

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
