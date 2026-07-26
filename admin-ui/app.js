/* ============================================================
   app.js — CAPE Admin UI main logic
   ============================================================ */

// ── Config (persisted in localStorage) ──────────────────────
const cfg = {
  get workerUrl() { return localStorage.getItem('workerUrl') || ''; },
  get apiToken()  { return localStorage.getItem('apiToken')  || ''; },
  set workerUrl(v) { localStorage.setItem('workerUrl', v); },
  set apiToken(v)  { localStorage.setItem('apiToken',  v); },
};

// ── Toast notifications ──────────────────────────────────────
function toast(message, type = 'info', durationMs = 3500) {
  const container = document.getElementById('toast-container');
  const el = document.createElement('div');
  el.className = `toast ${type}`;
  el.textContent = message;
  container.appendChild(el);
  setTimeout(() => el.remove(), durationMs);
}

// ── API helper ───────────────────────────────────────────────
async function api(path, opts = {}) {
  const url = cfg.workerUrl.replace(/\/$/, '') + path;
  const res = await fetch(url, {
    ...opts,
    headers: {
      Authorization: `Bearer ${cfg.apiToken}`,
      'Content-Type': 'application/json',
      ...(opts.headers || {}),
    },
  });
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${res.status}: ${text}`);
  }
  return res.json();
}

// ── Router / view switcher ───────────────────────────────────
const VIEWS = ['papers', 'upload', 'editor', 'stats'];

function showView(viewId) {
  VIEWS.forEach(v => {
    document.getElementById(`view-${v}`).classList.toggle('hidden', v !== viewId);
    document.getElementById(`nav-${v}`).classList.toggle('active', v !== viewId ? false : true);
  });
  if (viewId === 'papers') loadPapers();
  if (viewId === 'stats')  loadStats();
}

VIEWS.forEach(v =>
  document.getElementById(`nav-${v}`).addEventListener('click', () => showView(v))
);
document.getElementById('btn-go-upload').addEventListener('click', () => showView('upload'));

// ── Settings ─────────────────────────────────────────────────
const settingsPanel = document.getElementById('settings-panel');
document.getElementById('btn-open-settings').addEventListener('click', () =>
  settingsPanel.classList.toggle('open')
);
document.getElementById('btn-save-settings').addEventListener('click', () => {
  cfg.workerUrl = document.getElementById('cfg-worker-url').value.trim();
  cfg.apiToken  = document.getElementById('cfg-api-token').value.trim();
  settingsPanel.classList.remove('open');
  toast('Settings saved', 'success');
  loadPapers();
});
// Pre-fill from storage
document.getElementById('cfg-worker-url').value = cfg.workerUrl;
document.getElementById('cfg-api-token').value  = cfg.apiToken;

// ── Papers view ───────────────────────────────────────────────
let deletePaperData = null;

async function loadPapers() {
  const loadingEl = document.getElementById('papers-loading');
  const emptyEl   = document.getElementById('papers-empty');
  const tableWrap = document.getElementById('papers-table-wrap');
  const tbody     = document.getElementById('papers-tbody');

  loadingEl.classList.remove('hidden');
  emptyEl.classList.add('hidden');
  tableWrap.classList.add('hidden');

  try {
    const papers = await api('/admin/papers');
    loadingEl.classList.add('hidden');

    if (!papers.length) {
      emptyEl.classList.remove('hidden');
      return;
    }

    tbody.innerHTML = '';
    papers.forEach(p => {
      const pct = p.review_pct ?? 0;
      const tr  = document.createElement('tr');
      tr.innerHTML = `
        <td>${escHtml(p.subject)}</td>
        <td><span class="badge badge-accent">Paper ${p.paper}</span></td>
        <td>${p.year ?? '—'}</td>
        <td>${escHtml(p.month ?? '—')}</td>
        <td>${p.question_count}</td>
        <td>
          <div style="display:flex;align-items:center;gap:8px;">
            <div class="progress-bar" style="flex:1;">
              <div class="progress-fill" style="width:${pct}%;"></div>
            </div>
            <span class="text-muted text-sm">${pct}%</span>
          </div>
        </td>
        <td>
          <div class="flex gap-2">
            <button class="btn btn-ghost btn-sm btn-edit-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month)}">
              Edit
            </button>
            <button class="btn btn-danger btn-sm btn-delete-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month)}">
              Delete
            </button>
          </div>
        </td>`;
      tbody.appendChild(tr);
    });

    tableWrap.classList.remove('hidden');

    // Edit → jump to editor with filters pre-filled
    tbody.querySelectorAll('.btn-edit-paper').forEach(btn => {
      btn.addEventListener('click', () => {
        document.getElementById('filter-subject').value = btn.dataset.subject;
        document.getElementById('filter-paper').value   = btn.dataset.paper;
        document.getElementById('filter-year').value    = btn.dataset.year;
        document.getElementById('filter-month').value   = btn.dataset.month;
        showView('editor');
        loadEditorQuestions();
      });
    });

    // Delete → open confirmation modal
    tbody.querySelectorAll('.btn-delete-paper').forEach(btn => {
      btn.addEventListener('click', () => openDeleteModal({
        subject: btn.dataset.subject,
        paper:   Number(btn.dataset.paper),
        year:    Number(btn.dataset.year),
        month:   btn.dataset.month,
      }));
    });

  } catch (err) {
    loadingEl.classList.add('hidden');
    toast(`Failed to load papers: ${err.message}`, 'error');
  }
}

// ── Delete Paper modal ────────────────────────────────────────
function openDeleteModal(data) {
  deletePaperData = data;
  const label = `${data.subject} Paper ${data.paper} ${data.month} ${data.year}`;
  document.getElementById('delete-paper-label').textContent = label;
  document.getElementById('delete-confirm-input').value = '';
  document.getElementById('btn-delete-confirm').disabled = true;
  document.getElementById('delete-modal').classList.remove('hidden');
}

document.getElementById('delete-confirm-input').addEventListener('input', function () {
  const expected = document.getElementById('delete-paper-label').textContent;
  document.getElementById('btn-delete-confirm').disabled = this.value !== expected;
});

document.getElementById('btn-delete-cancel').addEventListener('click', () => {
  document.getElementById('delete-modal').classList.add('hidden');
  deletePaperData = null;
});

document.getElementById('btn-delete-confirm').addEventListener('click', async () => {
  if (!deletePaperData) return;
  document.getElementById('btn-delete-confirm').disabled = true;
  try {
    const result = await api('/admin/papers', {
      method: 'DELETE',
      body: JSON.stringify(deletePaperData),
    });
    document.getElementById('delete-modal').classList.add('hidden');
    deletePaperData = null;
    toast(`Deleted ${result.deleted} questions`, 'success');
    loadPapers();
  } catch (err) {
    toast(`Delete failed: ${err.message}`, 'error');
    document.getElementById('btn-delete-confirm').disabled = false;
  }
});

// ── Upload view ───────────────────────────────────────────────
let parsedRows = [];

const dropzone   = document.getElementById('dropzone');
const fileInput  = document.getElementById('file-input');

dropzone.addEventListener('click',   () => fileInput.click());
dropzone.addEventListener('keydown', e => { if (e.key === 'Enter' || e.key === ' ') fileInput.click(); });

dropzone.addEventListener('dragover', e => { e.preventDefault(); dropzone.classList.add('drag-over'); });
dropzone.addEventListener('dragleave', ()  => dropzone.classList.remove('drag-over'));
dropzone.addEventListener('drop', e => {
  e.preventDefault();
  dropzone.classList.remove('drag-over');
  const file = e.dataTransfer.files[0];
  if (file) processFile(file);
});

fileInput.addEventListener('change', () => {
  if (fileInput.files[0]) processFile(fileInput.files[0]);
  fileInput.value = '';
});

function processFile(file) {
  const reader = new FileReader();
  reader.onload = e => {
    const wb = XLSX.read(e.target.result, { type: 'array' });
    const ws = wb.Sheets[wb.SheetNames[0]];
    parsedRows = XLSX.utils.sheet_to_json(ws, { defval: null });
    validateAndPreview(parsedRows);
  };
  reader.readAsArrayBuffer(file);
}

function validateAndPreview(rows) {
  if (!rows.length) { toast('File is empty', 'error'); return; }

  const headers = Object.keys(rows[0]);
  let validCount = 0, warnCount = 0, errorCount = 0;

  // Track natural keys for dup detection within the file
  const seenKeys = new Set();

  const theadHtml = `<tr>${headers.map(h => `<th>${escHtml(h)}</th>`).join('')}<th>Status</th></tr>`;
  document.getElementById('preview-thead').innerHTML = theadHtml;

  const tbody = document.getElementById('preview-tbody');
  tbody.innerHTML = '';

  rows.forEach((row, i) => {
    const q = row['Question'];
    const subj = row['Subject'];
    const year = row['Year'];
    const num  = row['Number'];
    const part    = row['Part']    ?? null;
    const subpart = row['Subpart'] ?? null;

    let rowClass = '';
    let statusBadge = '<span class="badge badge-green">✓ Valid</span>';

    if (!q) {
      rowClass = 'row-error';
      statusBadge = '<span class="badge badge-red">Missing Question</span>';
      errorCount++;
    } else {
      const natKey = `${subj}|${year}|${num}|${part}|${subpart}`;
      if (seenKeys.has(natKey)) {
        rowClass = 'row-warn';
        statusBadge = '<span class="badge badge-yellow">Duplicate key</span>';
        warnCount++;
      } else {
        seenKeys.add(natKey);
        validCount++;
      }
    }

    const tr = document.createElement('tr');
    tr.className = rowClass;
    const cells = headers.map(h => `<td class="mono">${escHtml(String(row[h] ?? ''))}</td>`).join('');
    tr.innerHTML = `${cells}<td>${statusBadge}</td>`;
    tbody.appendChild(tr);
  });

  document.getElementById('summary-valid').textContent = `${validCount} valid`;
  document.getElementById('summary-warn').textContent  = `${warnCount} warnings`;
  document.getElementById('summary-error').textContent = `${errorCount} errors`;
  document.getElementById('upload-summary').classList.remove('hidden');
}

document.getElementById('btn-cancel-upload').addEventListener('click', () => {
  parsedRows = [];
  document.getElementById('upload-summary').classList.add('hidden');
});

document.getElementById('btn-confirm-import').addEventListener('click', async () => {
  if (!parsedRows.length) return;
  const paper = Number(document.getElementById('upload-paper-type').value);
  const btn = document.getElementById('btn-confirm-import');
  btn.disabled = true;
  btn.textContent = 'Importing…';

  try {
    const result = await api('/admin/import', {
      method: 'POST',
      body: JSON.stringify({ paper, rows: parsedRows }),
    });
    toast(`Imported ${result.imported} rows (${result.skipped} skipped)`, 'success');
    parsedRows = [];
    document.getElementById('upload-summary').classList.add('hidden');
    showView('papers');
  } catch (err) {
    toast(`Import failed: ${err.message}`, 'error');
  } finally {
    btn.disabled = false;
    btn.textContent = '✓ Confirm Import';
  }
});

// ── Question Editor ───────────────────────────────────────────
let editorCursor = 0;
const EDITOR_LIMIT = 50;

document.getElementById('btn-filter-apply').addEventListener('click', () => {
  editorCursor = 0;
  loadEditorQuestions();
});
document.getElementById('btn-prev-page').addEventListener('click', () => {
  if (editorCursor >= EDITOR_LIMIT) { editorCursor -= EDITOR_LIMIT; loadEditorQuestions(); }
});
document.getElementById('btn-next-page').addEventListener('click', () => {
  editorCursor += EDITOR_LIMIT;
  loadEditorQuestions();
});

async function loadEditorQuestions() {
  const loadEl  = document.getElementById('editor-loading');
  const emptyEl = document.getElementById('editor-empty');
  const wrap    = document.getElementById('editor-table-wrap');
  const tbody   = document.getElementById('editor-tbody');

  loadEl.classList.remove('hidden');
  emptyEl.classList.add('hidden');
  wrap.classList.add('hidden');

  const subject = document.getElementById('filter-subject').value.trim() || null;
  const paper   = document.getElementById('filter-paper').value || null;
  const year    = document.getElementById('filter-year').value  || null;
  const month   = document.getElementById('filter-month').value.trim() || null;

  const params = new URLSearchParams({ limit: EDITOR_LIMIT, cursor: editorCursor });
  if (subject) params.set('subject', subject);
  if (paper)   params.set('paper',   paper);
  if (year)    params.set('year',    year);
  if (month)   params.set('month',   month);

  try {
    const questions = await api(`/admin/questions?${params}`);
    loadEl.classList.add('hidden');

    if (!questions.length) {
      emptyEl.classList.remove('hidden');
      return;
    }

    tbody.innerHTML = '';
    questions.forEach(q => {
      const statusBadge = {
        unreviewed: '<span class="badge badge-muted">Unreviewed</span>',
        correct:    '<span class="badge badge-green">Correct</span>',
        needs_fix:  '<span class="badge badge-red">Needs Fix</span>',
      }[q.latest_review_status] || '';

      const tr = document.createElement('tr');
      tr.dataset.id = q.id;
      tr.innerHTML = `
        <td class="text-muted text-sm">${q.id}</td>
        <td>${escHtml(q.subject_name)}</td>
        <td>${q.paper}</td>
        <td>${q.year ?? '—'}</td>
        <td>${q.number}${q.part ? `(${q.part})` : ''}</td>
        <td>
          <div class="text-muted text-sm mono" style="max-width:180px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${escAttr(q.question_raw)}">${escHtml(q.question_raw ?? '')}</div>
        </td>
        <td>
          <textarea class="input mono q-code-input" style="min-height:60px;resize:vertical;"
                    data-id="${q.id}">${escHtml(q.question_code)}</textarea>
        </td>
        <td>
          <div class="latex-preview" id="preview-${q.id}"></div>
        </td>
        <td>${statusBadge}</td>
        <td>
          <div class="flex gap-2">
            <button class="btn btn-primary btn-sm btn-save-q" data-id="${q.id}">Save</button>
            <button class="btn btn-danger  btn-sm btn-del-q"  data-id="${q.id}">Delete</button>
          </div>
        </td>`;
      tbody.appendChild(tr);

      // Initial LaTeX render from question_code
      renderLatex(q.question_code, `preview-${q.id}`);
    });

    // Live LaTeX preview on input
    tbody.querySelectorAll('.q-code-input').forEach(ta => {
      ta.addEventListener('input', () => renderLatex(ta.value, `preview-${ta.dataset.id}`));
    });

    // Save button — saves question_code (the validated LaTeX string)
    tbody.querySelectorAll('.btn-save-q').forEach(btn => {
      btn.addEventListener('click', async () => {
        const id   = btn.dataset.id;
        const code = tbody.querySelector(`.q-code-input[data-id="${id}"]`).value;
        btn.disabled = true;
        try {
          await api(`/admin/questions/${id}`, {
            method: 'PUT',
            body: JSON.stringify({ question_code: code }),
          });
          toast('Saved', 'success');
        } catch (err) {
          toast(`Save failed: ${err.message}`, 'error');
        } finally {
          btn.disabled = false;
        }
      });
    });

    // Delete button
    tbody.querySelectorAll('.btn-del-q').forEach(btn => {
      btn.addEventListener('click', async () => {
        if (!confirm(`Delete question #${btn.dataset.id}?`)) return;
        btn.disabled = true;
        try {
          await api(`/admin/questions/${btn.dataset.id}`, { method: 'DELETE' });
          btn.closest('tr').remove();
          toast('Deleted', 'success');
        } catch (err) {
          toast(`Delete failed: ${err.message}`, 'error');
          btn.disabled = false;
        }
      });
    });

    wrap.classList.remove('hidden');

    // Pagination
    const pager = document.getElementById('editor-pagination');
    pager.style.display = 'flex';
    document.getElementById('page-info').textContent =
      `Showing ${editorCursor + 1}–${editorCursor + questions.length}`;
    document.getElementById('btn-prev-page').disabled = editorCursor === 0;
    document.getElementById('btn-next-page').disabled = questions.length < EDITOR_LIMIT;

  } catch (err) {
    loadEl.classList.add('hidden');
    toast(`Failed to load questions: ${err.message}`, 'error');
  }
}

function renderLatex(text, elementId) {
  const el = document.getElementById(elementId);
  if (!el) return;
  if (typeof katex === 'undefined') { el.textContent = text; return; }

  // Extract LaTeX between $ ... $ and $$ ... $$ and render inline
  try {
    const html = text.replace(/\$\$(.+?)\$\$/gs, (_, tex) =>
      katex.renderToString(tex, { displayMode: true,  throwOnError: false })
    ).replace(/\$(.+?)\$/g, (_, tex) =>
      katex.renderToString(tex, { displayMode: false, throwOnError: false })
    );
    el.innerHTML = html;
  } catch {
    el.textContent = text;
  }
}

// ── Stats view ────────────────────────────────────────────────
async function loadStats() {
  const loadEl = document.getElementById('stats-loading');
  const wrap   = document.getElementById('stats-table-wrap');
  const tbody  = document.getElementById('stats-tbody');

  loadEl.classList.remove('hidden');
  wrap.classList.add('hidden');

  try {
    const stats = await api('/stats');
    loadEl.classList.add('hidden');

    tbody.innerHTML = '';
    stats.forEach(s => {
      const pct = s.total ? Math.round((s.reviewed / s.total) * 100) : 0;
      const tr  = document.createElement('tr');
      tr.innerHTML = `
        <td>${escHtml(s.subject)}</td>
        <td><span class="badge badge-accent">Paper ${s.paper}</span></td>
        <td>${s.total}</td>
        <td>${s.reviewed}</td>
        <td>${s.unreviewed}</td>
        <td>${s.conflicts > 0
          ? `<span class="badge badge-red">⚠ ${s.conflicts}</span>`
          : '<span class="badge badge-green">None</span>'}</td>
        <td>
          <div style="display:flex;align-items:center;gap:8px;min-width:160px;">
            <div class="progress-bar" style="flex:1;">
              <div class="progress-fill" style="width:${pct}%;"></div>
            </div>
            <span class="text-muted text-sm">${pct}%</span>
          </div>
        </td>`;
      tbody.appendChild(tr);
    });

    wrap.classList.remove('hidden');
  } catch (err) {
    loadEl.classList.add('hidden');
    toast(`Failed to load stats: ${err.message}`, 'error');
  }
}

document.getElementById('btn-refresh-stats').addEventListener('click', loadStats);

// ── Utility ───────────────────────────────────────────────────
function escHtml(str) {
  return String(str ?? '')
    .replace(/&/g,  '&amp;')
    .replace(/</g,  '&lt;')
    .replace(/>/g,  '&gt;')
    .replace(/"/g,  '&quot;')
    .replace(/'/g,  '&#039;');
}
function escAttr(str) { return escHtml(str); }

// ── Init ──────────────────────────────────────────────────────
showView('papers');
if (!cfg.workerUrl || !cfg.apiToken) {
  setTimeout(() => {
    settingsPanel.classList.add('open');
    toast('Enter your Worker URL and API token in Settings to get started.', 'info', 6000);
  }, 400);
}
