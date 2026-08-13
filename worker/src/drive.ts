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

  // Priority 1: Deterministic key parsing (cape_{unit}_{subject}_{month}_{year}_{paper}_{number}...)
  const parts = diagramKey.split('_');
  if (parts.length >= 6 && parts[0].toLowerCase() === 'cape') {
    const unitStr = parts[1];
    const subjStr = parts[2].toLowerCase();
    const yearStr = parts[4];
    const paperStr = parts[5];

    const subjName = SUBJECT_MAP[subjStr] || (subjStr.charAt(0).toUpperCase() + subjStr.slice(1));
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

  // Priority 2: Check `diagrams` table for explicit imagekit_path / drive_path
  try {
    const diagRow = await env.DB.prepare(`
      SELECT imagekit_path, drive_path FROM diagrams WHERE diagram_key = ?1 LIMIT 1
    `).bind(diagramKey).first<{ imagekit_path: string | null; drive_path: string | null }>();

    if (diagRow?.imagekit_path) candidatePaths.push(diagRow.imagekit_path);
    if (diagRow?.drive_path) candidatePaths.push(diagRow.drive_path);
  } catch {}

  // Priority 2: Reconstruct nested paths from question/choice metadata
  try {
    const baseMatch = diagramKey.match(/^(cape_[12]_[^_]+_[^_]+_\d+_[12]_\d+)/i);
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
      const uMatch = diagramKey.match(/^cape_([12])_/i);
      const unitNum = uMatch ? uMatch[1] : (row.subject_name.match(/U([12])$/i)?.[1] ?? '1');
      const unitFolder = `U${unitNum}`;
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

  // Priority 4: ImageKit Search API fallback for subpart/naming variations
  if (env.IMAGEKIT_PRIVATE_KEY && env.IMAGEKIT_PRIVATE_KEY.trim() !== '') {
    try {
      const parts = diagramKey.split('_');
      if (parts.length >= 6 && parts[0].toLowerCase() === 'cape') {
        const subjStr = parts[2].toLowerCase();
        const yearStr = parts[4];
        const paperStr = parts[5];
        const numStr = parts[6] ? parts[6].replace(/\D/g, '') : '';

        const searchQuery = numStr
          ? `name:"*${subjStr}*${yearStr}*_${paperStr}_${numStr}*"`
          : `name:"*${subjStr}*${yearStr}*_${paperStr}*"`;

        const authHeader = 'Basic ' + btoa(env.IMAGEKIT_PRIVATE_KEY + ':');
        const searchUrl = `https://api.imagekit.io/v1/files?searchQuery=${encodeURIComponent(searchQuery)}&limit=1`;

        const searchRes = await fetch(searchUrl, { headers: { Authorization: authHeader } });
        if (searchRes.ok) {
          const files = (await searchRes.json()) as Array<{ filePath?: string; url?: string }>;
          if (files && files.length > 0 && files[0].url) {
            const foundUrl = files[0].url;
            const imgResp = await fetch(foundUrl, { headers: { 'User-Agent': 'Cloudflare-Worker' } });
            if (imgResp.ok) {
              const headers = new Headers(imgResp.headers);
              headers.set('Cache-Control', 'public, max-age=86400, s-maxage=86400');
              headers.set('Access-Control-Allow-Origin', '*');
              return new Response(imgResp.body, { status: 200, headers });
            }
          }
        }
      }
    } catch {}
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
