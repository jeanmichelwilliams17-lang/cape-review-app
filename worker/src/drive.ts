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
const CACHE_TTL      = 604800; // 7 days (edge + browser)

const SUBJECT_MAP: Record<string, string> = {
  accounting: 'Accounting',
  appliedmathematics: 'AppliedMathematics',
  biology: 'Biology',
  chemistry: 'Chemistry',
  computerscience: 'ComputerScience',
  economics: 'Economics',
  entrepreneurship: 'Entrepreneurship',
  informationtechnology: 'InformationTechnology',
  literature: 'Literature',
  managementofbusiness: 'ManagementOfBusiness',
  physics: 'Physics',
  puremathematics: 'PureMathematics',
  sociology: 'Sociology',
  tourism: 'Tourism',
};

/**
 * Handles GET /images/:diagram_key
 * Looks up subject/paper/year from D1, signs the ImageKit URL, and redirects.
 *
 * Caching strategy (fastest → slowest):
 *   1. Cloudflare Cache API — edge cache hit → return immediately, zero DB queries.
 *   2. diagrams.imagekit_path in D1 — previously-resolved winner path.
 *   3. Sequential candidate-path search against ImageKit.
 *   4. ImageKit Search API fallback for unusual naming.
 * On a successful path resolution the winner is written back to D1 and the
 * response is stored in the Cloudflare Cache API for subsequent requests.
 */
export async function handleImageProxy(
  request: Request,
  env: Env,
  diagramKey: string
): Promise<Response> {
  // ── 1. Cloudflare Cache API check ────────────────────────────────────────
  const cache     = caches.default;
  const cacheKey  = new Request(request.url, { method: 'GET' });
  const cached    = await cache.match(cacheKey);
  if (cached) {
    return cached; // instant return — no DB, no ImageKit
  }

  // ── Helper: build the final response, store it in both Cache API and
  //           return it to the caller ────────────────────────────────────────
  async function cacheAndReturn(imgResp: Response, resolvedPath: string, env: Env): Promise<Response> {
    const headers = new Headers(imgResp.headers);
    headers.set('Cache-Control', `public, max-age=${CACHE_TTL}, s-maxage=${CACHE_TTL}`);
    headers.set('Access-Control-Allow-Origin', '*');
    // We must clone before caching because the body can only be consumed once
    const body = await imgResp.arrayBuffer();
    const finalResponse = new Response(body, { status: 200, headers });
    const cachedResponse = new Response(body, { status: 200, headers });
    // Store in edge cache (non-blocking — don't await)
    cache.put(cacheKey, cachedResponse).catch(() => {/* best-effort */});
    return finalResponse;
  }

  const base   = env.IMAGEKIT_BASE_URL.replace(/\/$/, '');
  const folder = (env.IMAGEKIT_FOLDER ?? 'Diagrams').replace(/^\/|\/$/g, '');

  // ── 2. Fast path: check diagrams table for a previously-resolved imagekit_path ──
  try {
    const fastRow = await env.DB.prepare(`
      SELECT imagekit_path FROM diagrams WHERE diagram_key = ?1 LIMIT 1
    `).bind(diagramKey).first<{ imagekit_path: string | null }>();

    if (fastRow?.imagekit_path) {
      const imgResp = await fetchFromImageKit(fastRow.imagekit_path, base, env);
      if (imgResp?.ok) {
        return cacheAndReturn(imgResp, fastRow.imagekit_path, env);
      }
      // Path stored in DB is stale — fall through to full search
    }
  } catch { /* ignore, fall through */ }

  // ── 3. Full candidate-path search ────────────────────────────────────────
  // Candidate paths to try on ImageKit
  const candidatePaths: string[] = [];

  // Priority 1: Deterministic key parsing (cape_{unit}_{subject}_{month}_{year}_{paper}_{number}...)
  const parts = diagramKey.split('_');
  if (parts.length >= 6 && parts[0].toLowerCase() === 'cape') {
    const unitStr  = parts[1];
    const subjStr  = parts[2].toLowerCase();
    const yearStr  = parts[4];
    const paperStr = parts[5];

    const subjName    = SUBJECT_MAP[subjStr] || (subjStr.charAt(0).toUpperCase() + subjStr.slice(1));
    const unitFolders = [`U${unitStr}`, unitStr === '1' ? 'U2' : 'U1'];
    const paperFolders = [`P${paperStr}`, paperStr === '1' ? 'P2' : 'P1'];
    const unitPrefixes = ['cape_1_', 'cape_2_'];
    const subpartSuffixes = ['', '_e_i', '_a', '_b', '_c', '_d', '_e', '_f', '_a_i', '_b_i', '_c_i', '_d_i', '_1', '_2', '_3', '_1_a'];

    // Base key without prefix (e.g. "appliedmathematics_may_2022_2_1")
    const rawKeyWithoutPrefix = parts.slice(2).join('_');

    // First try exact key as requested
    for (const uFolder of unitFolders) {
      for (const pFolder of paperFolders) {
        candidatePaths.push(`${subjName}/${uFolder}/${pFolder}/${yearStr}/output/${diagramKey}.png`);
        candidatePaths.push(`${subjName}/${uFolder}/${pFolder}/${yearStr}/${diagramKey}.png`);
      }
    }

    // Next try subpart suffixes and unit prefix swaps
    for (const uFolder of unitFolders) {
      for (const pFolder of paperFolders) {
        for (const prefix of unitPrefixes) {
          for (const suffix of subpartSuffixes) {
            const candidateKey = `${prefix}${rawKeyWithoutPrefix}${suffix}`;
            if (candidateKey !== diagramKey) {
              candidatePaths.push(`${subjName}/${uFolder}/${pFolder}/${yearStr}/output/${candidateKey}.png`);
            }
          }
        }
      }
    }
  }

  // Priority 2: Check `diagrams` table for drive_path (the original non-resolved path)
  try {
    const diagRow = await env.DB.prepare(`
      SELECT drive_path FROM diagrams WHERE diagram_key = ?1 LIMIT 1
    `).bind(diagramKey).first<{ drive_path: string | null }>();

    if (diagRow?.drive_path) candidatePaths.push(diagRow.drive_path);
  } catch {}

  // Priority 2b: Reconstruct nested paths from question/choice metadata
  try {
    const baseMatch      = diagramKey.match(/^(cape_[12]_[^_]+_[^_]+_\d+_[12]_\d+)/i);
    const baseQuestionKey = baseMatch ? baseMatch[1] : diagramKey;

    const row = await env.DB.prepare(`
      SELECT s.name AS subject_name, q.paper, q.year
      FROM questions q
      JOIN subjects s ON s.id = q.subject_id
      LEFT JOIN choices c ON c.question_id = q.id
      WHERE q.question_diagram_key = ?1 OR c.diagram_key = ?1 OR q.question_diagram_key = ?2
      LIMIT 1
    `).bind(diagramKey, baseQuestionKey).first<{ subject_name: string; paper: number; year: number }>();

    if (row && row.paper && row.year) {
      const uMatch       = diagramKey.match(/^cape_([12])_/i);
      const unitNum      = uMatch ? uMatch[1] : (row.subject_name.match(/U([12])$/i)?.[1] ?? '1');
      const unitFolder   = `U${unitNum}`;
      const altUnitFolder = unitNum === '1' ? 'U2' : 'U1';
      const cleanSubject = row.subject_name.replace(/U[12]$/i, '').trim();

      const paperFolders = [`P${row.paper}`, row.paper === 1 ? 'P2' : 'P1'];
      for (const pFolder of paperFolders) {
        candidatePaths.push(`${cleanSubject}/${unitFolder}/${pFolder}/${row.year}/output/${diagramKey}.png`);
        candidatePaths.push(`${cleanSubject}/${altUnitFolder}/${pFolder}/${row.year}/output/${diagramKey}.png`);
        candidatePaths.push(`${row.subject_name}/${pFolder}/${row.year}/output/${diagramKey}.png`);
        candidatePaths.push(`${cleanSubject}/${unitFolder}/${pFolder}/${row.year}/${diagramKey}.png`);
      }
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

    const imgResp = await fetchFromImageKit(cleanPath, base, env);
    if (imgResp?.ok) {
      // Persist the winning path so future requests skip this search loop
      const resolvedPath = cleanPath;
      persistImageKitPath(diagramKey, resolvedPath, env).catch(() => {/* best-effort */});
      return cacheAndReturn(imgResp, resolvedPath, env);
    }
  }

  // ── 4. ImageKit Search API fallback for subpart/naming variations ─────────
  if (env.IMAGEKIT_PRIVATE_KEY && env.IMAGEKIT_PRIVATE_KEY.trim() !== '') {
    try {
      if (parts.length >= 6 && parts[0].toLowerCase() === 'cape') {
        const subjStr  = parts[2].toLowerCase();
        const yearStr  = parts[4];
        const paperStr = parts[5];
        const numStr   = parts[6] ? parts[6].replace(/\D/g, '') : '';

        const searchQuery = numStr
          ? `name:"*${subjStr}*${yearStr}*_${paperStr}_${numStr}*"`
          : `name:"*${subjStr}*${yearStr}*_${paperStr}*"`;

        const authHeader = 'Basic ' + btoa(env.IMAGEKIT_PRIVATE_KEY + ':');
        const searchUrl  = `https://api.imagekit.io/v1/files?searchQuery=${encodeURIComponent(searchQuery)}&limit=1`;

        const searchRes = await fetch(searchUrl, { headers: { Authorization: authHeader } });
        if (searchRes.ok) {
          const files = (await searchRes.json()) as Array<{ filePath?: string; url?: string }>;
          if (files && files.length > 0 && files[0].url) {
            const foundUrl  = files[0].url;
            const imgResp   = await fetch(foundUrl, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
            if (imgResp.ok) {
              // Persist the file path if available
              if (files[0].filePath) {
                persistImageKitPath(diagramKey, files[0].filePath, env).catch(() => {/* best-effort */});
              }
              return cacheAndReturn(imgResp, files[0].filePath ?? foundUrl, env);
            }
          }
        }
      }
    } catch {}
  }

  // If no path succeeded, cache 404 in Edge Cache for 24h so repeat misses return in 1ms
  const missResponse = new Response('Image not found', {
    status: 404,
    headers: {
      'Cache-Control': 'public, max-age=86400, s-maxage=86400',
      'Access-Control-Allow-Origin': '*',
    },
  });
  cache.put(cacheKey, missResponse.clone()).catch(() => {/* best-effort */});
  return missResponse;
}

// ── Fetch helper — tries signed URL then unsigned URL ────────────────────────
async function fetchFromImageKit(
  cleanPath: string,
  base: string,
  env: Env
): Promise<Response | null> {
  const pathForSignature = cleanPath.startsWith('/') ? cleanPath : '/' + cleanPath;

  // 1. Try signed URL if secret key is present
  if (env.IMAGEKIT_PRIVATE_KEY && env.IMAGEKIT_PRIVATE_KEY.trim() !== '') {
    const expiry    = Math.floor(Date.now() / 1000) + EXPIRY_SECONDS;
    const signature = await hmacSha1Hex(env.IMAGEKIT_PRIVATE_KEY, `${pathForSignature}${expiry}`);
    const signedUrl = `${base}${pathForSignature}?ik-s=${signature}&ik-t=${expiry}`;
    try {
      const res = await fetch(signedUrl, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
      if (res.ok) return res;
    } catch {}
  }

  // 2. Unsigned URL fallback
  try {
    const res = await fetch(`${base}${pathForSignature}`, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
    if (res.ok) return res;
  } catch {}

  return null;
}

// ── Persist winning imagekit_path back to the diagrams table ─────────────────
async function persistImageKitPath(
  diagramKey: string,
  imagekitPath: string,
  env: Env
): Promise<void> {
  // Upsert: if the row exists update imagekit_path, otherwise insert a minimal row.
  await env.DB.prepare(`
    INSERT INTO diagrams (diagram_key, drive_path, imagekit_path)
    VALUES (?1, '', ?2)
    ON CONFLICT(diagram_key) DO UPDATE SET imagekit_path = excluded.imagekit_path
  `).bind(diagramKey, imagekitPath).run();
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
