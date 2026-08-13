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

  // Candidate paths to try on ImageKit
  const candidatePaths: string[] = [];

  // Priority 1: Check `diagrams` table for explicit imagekit_path / drive_path
  try {
    const diagRow = await env.DB.prepare(`
      SELECT imagekit_path, drive_path FROM diagrams WHERE diagram_key = ?1 LIMIT 1
    `).bind(diagramKey).first<{ imagekit_path: string | null; drive_path: string | null }>();

    if (diagRow?.imagekit_path) candidatePaths.push(diagRow.imagekit_path);
    if (diagRow?.drive_path) candidatePaths.push(diagRow.drive_path);
  } catch {}

  // Priority 2: Reconstruct nested paths from question/choice metadata
  try {
    const choiceMatch = diagramKey.match(/_([abcd])$/i);
    const baseDiagramKey = choiceMatch ? diagramKey.replace(/_([abcd])$/i, '') : diagramKey;

    const row = await env.DB.prepare(`
      SELECT s.name AS subject_name, q.paper, q.year
      FROM questions q
      JOIN subjects s ON s.id = q.subject_id
      LEFT JOIN choices c ON c.question_id = q.id
      WHERE q.question_diagram_key = ?1 OR c.diagram_key = ?1 OR q.question_diagram_key = ?2
      LIMIT 1
    `).bind(diagramKey, baseDiagramKey).first<{ subject_name: string; paper: number; year: number }>();

    if (row && row.paper && row.year) {
      candidatePaths.push(`${row.subject_name}/P${row.paper}/${row.year}/output/${diagramKey}.png`);
      candidatePaths.push(`${row.subject_name}/P${row.paper}/${row.year}/${diagramKey}.png`);
    }
  } catch {}

  // Priority 3: Flat filename fallback
  candidatePaths.push(`${diagramKey}.png`);

  // Try each candidate path on ImageKit
  for (const rawPath of candidatePaths) {
    let cleanPath = rawPath.replace(/^\/+/, '');
    if (folder && !cleanPath.toLowerCase().startsWith(folder.toLowerCase() + '/')) {
      cleanPath = `${folder}/${cleanPath}`;
    }
    const pathForSignature = cleanPath.startsWith('/') ? cleanPath : '/' + cleanPath;

    let imgResp: Response | null = null;

    // 1. Try signed URL if secret key is present
    if (env.IMAGEKIT_PRIVATE_KEY && env.IMAGEKIT_PRIVATE_KEY.trim() !== '') {
      const expiry = Math.floor(Date.now() / 1000) + EXPIRY_SECONDS;
      const signature = await hmacSha1Hex(env.IMAGEKIT_PRIVATE_KEY, `${pathForSignature}${expiry}`);
      const signedUrl = `${base}${pathForSignature}?ik-s=${signature}&ik-t=${expiry}`;
      try {
        const res = await fetch(signedUrl, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
        if (res.ok) imgResp = res;
      } catch {}
    }

    // 2. If signed request was not used or failed, try unsigned URL
    if (!imgResp || !imgResp.ok) {
      const unsignedUrl = `${base}${pathForSignature}`;
      try {
        const res = await fetch(unsignedUrl, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
        if (res.ok) imgResp = res;
      } catch {}
    }

    // If image stream was retrieved, return directly with edge cache headers
    if (imgResp && imgResp.ok) {
      const headers = new Headers(imgResp.headers);
      headers.set('Cache-Control', 'public, max-age=86400, s-maxage=86400');
      headers.set('Access-Control-Allow-Origin', '*');
      return new Response(imgResp.body, {
        status: 200,
        headers,
      });
    }
  }

  // If no path succeeded
  return new Response('Image not found', { status: 404 });
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
