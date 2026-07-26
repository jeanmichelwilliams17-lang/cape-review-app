// =============================================================================
// imagekit.ts — ImageKit image delivery, convention-based (no DB lookup)
// =============================================================================
//
// Images are served by constructing the URL directly from the diagram_key.
// No D1 lookup needed — the diagram_key IS the filename in ImageKit.
//
// Convention: upload images to ImageKit as:
//   {IMAGEKIT_FOLDER}/{diagram_key}.png
//   e.g. diagrams/cape_accountingu1_may_2017_1_1.png
//
// The ETL generates diagram_key values deterministically, so as long as images
// are uploaded with matching filenames, everything resolves automatically.
//
// Signed URL format (ImageKit docs):
//   signature = HMAC-SHA1( privateKey, urlPath + expiry )
//   final URL = baseURL/path?ik-s={signature}&ik-t={expiry}
// =============================================================================

import { Env } from './types';

const EXPIRY_SECONDS = 3600; // 1 hour

/**
 * Handles GET /images/:diagram_key
 * Constructs and signs the ImageKit URL directly — no DB query required.
 */
export async function handleImageProxy(
  _request: Request,
  env: Env,
  diagramKey: string
): Promise<Response> {
  const base   = env.IMAGEKIT_BASE_URL.replace(/\/$/, '');
  const folder = (env.IMAGEKIT_FOLDER ?? 'diagrams').replace(/^\/|\/$/g, '');
  const imgPath = `${folder}/${diagramKey}.png`;
  const expiry  = Math.floor(Date.now() / 1000) + EXPIRY_SECONDS;

  // ImageKit signs: imagePath + expiry (concatenated)
  const signature  = await hmacSha1Hex(env.IMAGEKIT_PRIVATE_KEY, `${imgPath}${expiry}`);
  const signedUrl  = `${base}/${imgPath}?ik-s=${signature}&ik-t=${expiry}`;

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
  const sig   = await crypto.subtle.sign('HMAC', key, enc.encode(message));
  const bytes = new Uint8Array(sig);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('');
}
