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
const VIEWS = ['papers', 'upload', 'editor', 'reviews', 'stats'];

function showView(viewId) {
  VIEWS.forEach(v => {
    document.getElementById(`view-${v}`).classList.toggle('hidden', v !== viewId);
    document.getElementById(`nav-${v}`).classList.toggle('active', v !== viewId ? false : true);
  });
  if (viewId === 'papers')  loadPapers();
  if (viewId === 'reviews') loadReviews();
  if (viewId === 'stats')   loadStats();
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
  loadSubjectList();
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
            <button class="btn btn-ghost btn-sm btn-reviews-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month || '')}">
              👁 Reviews
            </button>
            <button class="btn btn-ghost btn-sm btn-unreview-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month || '')}">
              ↺ Unreview
            </button>
            <button class="btn btn-ghost btn-sm btn-edit-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month || '')}">
              Edit
            </button>
            <button class="btn btn-danger btn-sm btn-delete-paper"
              data-subject="${escAttr(p.subject)}"
              data-paper="${p.paper}" data-year="${p.year}" data-month="${escAttr(p.month || '')}">
              Delete
            </button>
          </div>
        </td>`;
      tbody.appendChild(tr);
    });

    tableWrap.classList.remove('hidden');

    // Review Log → jump to reviews view with filters pre-filled
    tbody.querySelectorAll('.btn-reviews-paper').forEach(btn => {
      btn.addEventListener('click', () => {
        document.getElementById('rev-filter-subject').value = btn.dataset.subject;
        document.getElementById('rev-filter-paper').value   = btn.dataset.paper;
        document.getElementById('rev-filter-year').value    = btn.dataset.year;
        document.getElementById('rev-filter-month').value   = btn.dataset.month;
        showView('reviews');
      });
    });

    // Unreview Paper → open unreview modal
    tbody.querySelectorAll('.btn-unreview-paper').forEach(btn => {
      btn.addEventListener('click', () => openUnreviewModal({
        subject: btn.dataset.subject,
        paper:   Number(btn.dataset.paper),
        year:    btn.dataset.year ? Number(btn.dataset.year) : undefined,
        month:   btn.dataset.month,
      }));
    });

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

    // Collect rows from ALL sheets (supports multi-subject master sheets).
    // Each row gets a hidden _sheet property for traceability.
    parsedRows = [];
    for (const sheetName of wb.SheetNames) {
      const ws = wb.Sheets[sheetName];
      const sheetRows = XLSX.utils.sheet_to_json(ws, { defval: null });
      for (const row of sheetRows) {
        row._sheet = sheetName;
        parsedRows.push(row);
      }
    }

    validateAndPreview(parsedRows);
  };
  reader.readAsArrayBuffer(file);
}

function validateAndPreview(rows) {
  if (!rows.length) { toast('File is empty', 'error'); return; }

  // Derive visible headers (exclude internal _sheet key)
  const headers = Object.keys(rows[0]).filter(h => h !== '_sheet');

  // Auto-detect paper type from column headers
  const hasAnswerA = headers.includes('Answer A');
  const hasPartOrMarks = headers.includes('Part') || headers.includes('Marks');
  if (hasAnswerA) {
    document.getElementById('upload-paper-type').value = '1';
  } else if (hasPartOrMarks) {
    document.getElementById('upload-paper-type').value = '2';
  }

  let validCount = 0, warnCount = 0, errorCount = 0;

  // Track natural keys for dup detection within the file.
  // Include Unit so different units on a master sheet don't collide.
  const seenKeys = new Set();

  const theadHtml = `<tr>${headers.map(h => `<th>${escHtml(h)}</th>`).join('')}<th>Status</th></tr>`;
  document.getElementById('preview-thead').innerHTML = theadHtml;

  const tbody = document.getElementById('preview-tbody');
  tbody.innerHTML = '';

  rows.forEach((row, i) => {
    const q     = row['Question'];
    const subj  = row['Subject'];
    const unit  = row['Unit'] ?? row['unit'] ?? row['UNIT'] ?? '';
    const year  = row['Year'];
    const num   = row['Number'];
    const part    = row['Part']    ?? null;
    const subpart = row['Subpart'] ?? null;

    let rowClass = '';
    let statusBadge = '<span class="badge badge-green">✓ Valid</span>';

    if (!q) {
      rowClass = 'row-error';
      statusBadge = '<span class="badge badge-red">Missing Question</span>';
      errorCount++;
    } else {
      // Include unit in the natural key so multi-subject master sheets work correctly
      const natKey = `${subj}|${unit}|${year}|${num}|${part}|${subpart}`;
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
  const paper   = Number(document.getElementById('upload-paper-type').value);
  const btn     = document.getElementById('btn-confirm-import');
  const cancelBtn = document.getElementById('btn-cancel-upload');
  const progressWrap = document.getElementById('import-progress-wrap');
  const progressFill = document.getElementById('import-progress-fill');
  const progressLabel = document.getElementById('import-progress-label');

  const CHUNK_SIZE = 200; // rows per request — keeps each Worker invocation well under timeout
  const chunks = [];
  for (let i = 0; i < parsedRows.length; i += CHUNK_SIZE) {
    chunks.push(parsedRows.slice(i, i + CHUNK_SIZE));
  }

  btn.disabled = true;
  cancelBtn.disabled = true;
  btn.textContent = 'Importing…';
  progressWrap.classList.remove('hidden');

  let totalImported = 0;
  let totalSkipped  = 0;
  let failed = false;

  for (let ci = 0; ci < chunks.length; ci++) {
    const pct = Math.round((ci / chunks.length) * 100);
    progressFill.style.width  = `${pct}%`;
    progressLabel.textContent = `Chunk ${ci + 1} / ${chunks.length} (${pct}%)`;

    const isLastChunk = ci === chunks.length - 1;

    try {
      const result = await api('/admin/import', {
        method: 'POST',
        // Only trigger the background diagram audit on the final chunk so
        // it runs once after all rows are inserted (not 25× in parallel).
        body: JSON.stringify({ paper, rows: chunks[ci], triggerAudit: isLastChunk }),
      });
      totalImported += result.imported ?? 0;
      totalSkipped  += result.skipped  ?? 0;
    } catch (err) {
      toast(`Import failed at chunk ${ci + 1}: ${err.message}`, 'error');
      failed = true;
      break;
    }
  }

  progressFill.style.width  = '100%';
  progressLabel.textContent = failed ? 'Import stopped due to error' : 'Complete!';

  if (!failed) {
    toast(`Imported ${totalImported} rows (${totalSkipped} skipped)`, 'success');
    parsedRows = [];
    document.getElementById('upload-summary').classList.add('hidden');
    showView('papers');
  }

  setTimeout(() => progressWrap.classList.add('hidden'), 2000);
  btn.disabled = false;
  cancelBtn.disabled = false;
  btn.textContent = '✓ Confirm Import';
});


// ── Question Editor ───────────────────────────────────────────
let editorCursor = 0;
const EDITOR_LIMIT = 50;
let allSubjects = [];

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
document.getElementById('btn-filter-clear').addEventListener('click', () => {
  document.getElementById('filter-subject').value = '';
  document.getElementById('filter-paper').value = '';
  document.getElementById('filter-status').value = '';
  document.getElementById('filter-year').value = '';
  document.getElementById('filter-month').value = '';
  editorCursor = 0;
  loadEditorQuestions();
});

// ── Searchable subject dropdown ───────────────────────────────
async function loadSubjectList() {
  try {
    const subjects = await api('/subjects');
    allSubjects = subjects.map(s => s.name);
    renderSubjectDropdown('');
    renderRevSubjectDropdown('');
  } catch {}
}

function renderSubjectDropdown(query) {
  const list = document.getElementById('subject-dropdown-list');
  const current = document.getElementById('filter-subject').value;
  const filtered = allSubjects.filter(s =>
    s.toLowerCase().includes(query.toLowerCase())
  );
  list.innerHTML = filtered.map(s =>
    `<div class="dropdown-item${s === current ? ' active' : ''}">${escHtml(s)}</div>`
  ).join('');

  list.querySelectorAll('.dropdown-item').forEach(el => {
    el.addEventListener('click', () => {
      document.getElementById('filter-subject').value = el.textContent;
      list.classList.add('hidden');
      editorCursor = 0;
      loadEditorQuestions();
    });
  });
}

function renderRevSubjectDropdown(query) {
  const list = document.getElementById('rev-subject-dropdown-list');
  const current = document.getElementById('rev-filter-subject').value;
  const filtered = allSubjects.filter(s =>
    s.toLowerCase().includes(query.toLowerCase())
  );
  list.innerHTML = filtered.map(s =>
    `<div class="dropdown-item${s === current ? ' active' : ''}">${escHtml(s)}</div>`
  ).join('');

  list.querySelectorAll('.dropdown-item').forEach(el => {
    el.addEventListener('click', () => {
      document.getElementById('rev-filter-subject').value = el.textContent;
      list.classList.add('hidden');
      loadReviews();
    });
  });
}

const subjectInput = document.getElementById('filter-subject');
const subjectList  = document.getElementById('subject-dropdown-list');

subjectInput.addEventListener('input', () => {
  renderSubjectDropdown(subjectInput.value);
  subjectList.classList.remove('hidden');
});

subjectInput.addEventListener('focus', () => {
  renderSubjectDropdown(subjectInput.value);
  subjectList.classList.remove('hidden');
});

const revSubjectInput = document.getElementById('rev-filter-subject');
const revSubjectList  = document.getElementById('rev-subject-dropdown-list');

revSubjectInput.addEventListener('input', () => {
  renderRevSubjectDropdown(revSubjectInput.value);
  revSubjectList.classList.remove('hidden');
});

revSubjectInput.addEventListener('focus', () => {
  renderRevSubjectDropdown(revSubjectInput.value);
  revSubjectList.classList.remove('hidden');
});

document.addEventListener('click', (e) => {
  if (!e.target.closest('#subject-dropdown')) {
    subjectList.classList.add('hidden');
  }
  if (!e.target.closest('#rev-subject-dropdown')) {
    revSubjectList.classList.add('hidden');
  }
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
  const status  = document.getElementById('filter-status').value || null;

  const params = new URLSearchParams({ limit: EDITOR_LIMIT, cursor: editorCursor });
  if (subject) params.set('subject', subject);
  if (paper)   params.set('paper',   paper);
  if (year)    params.set('year',    year);
  if (month)   params.set('month',   month);
  if (status)  params.set('status',  status);

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

      const choicesHtml = renderChoicesBlock(q.choices, q.correct_choice);

      const tr = document.createElement('tr');
      tr.dataset.id = q.id;
      tr.innerHTML = `
        <td class="text-muted text-sm">${q.id}</td>
        <td>${escHtml(q.subject_name)}</td>
        <td>${q.paper}</td>
        <td>${q.year ?? '—'}</td>
        <td>${q.number}${q.part ? `(${q.part})` : ''}</td>
        <td style="max-width:280px;">
          <div class="text-muted text-sm mono" style="max-width:260px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${escAttr(q.question_raw)}">${escHtml(q.question_raw ?? '')}</div>
          ${choicesHtml}
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
            ${q.review_count > 0 ? `<button class="btn btn-ghost btn-sm btn-unreview-q" data-id="${q.id}">Unreview</button>` : ''}
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

    // Unreview button — removes all reviews for this question
    tbody.querySelectorAll('.btn-unreview-q').forEach(btn => {
      btn.addEventListener('click', async () => {
        if (!confirm(`Remove all reviews for question #${btn.dataset.id}?`)) return;
        btn.disabled = true;
        try {
          const q = await api(`/questions/${btn.dataset.id}`);
          const reviewers = (q.reviews || []).map(r => r.reviewer);
          for (const reviewer of reviewers) {
            await api(`/questions/${btn.dataset.id}/review`, {
              method: 'DELETE',
              body: JSON.stringify({ reviewer }),
            });
          }
          toast('Reviews removed', 'success');
          loadEditorQuestions();
        } catch (err) {
          toast(`Unreview failed: ${err.message}`, 'error');
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

// ── KaTeX formatting helper ───────────────────────────────────
function formatLatex(text) {
  if (text === null || text === undefined || text === '') return '';
  const str = String(text);
  if (typeof katex === 'undefined') return escHtml(str);
  try {
    return str
      .replace(/\$\$(.+?)\$\$/gs, (_, tex) =>
        katex.renderToString(tex, { displayMode: true, throwOnError: false })
      )
      .replace(/\$(.+?)\$/g, (_, tex) =>
        katex.renderToString(tex, { displayMode: false, throwOnError: false })
      );
  } catch {
    return escHtml(str);
  }
}

function renderChoicesBlock(choices, correctChoice) {
  if (!choices || !choices.length) return '';
  let html = `<div class="choices-box">
    <div style="font-weight:600;font-size:11px;text-transform:uppercase;color:var(--text-muted);margin-bottom:6px;display:flex;align-items:center;justify-content:space-between;">
      <span>Answer Choices</span>
      ${correctChoice ? `<span class="badge badge-green" style="font-size:10px;">Key: Option ${escHtml(correctChoice)}</span>` : ''}
    </div>
    <div class="choices-grid">`;

  choices.forEach(c => {
    const isCorrect = (c.label && correctChoice && c.label.toUpperCase() === correctChoice.toUpperCase());
    const val = c.answer_code || c.answer_raw || '';
    const latexVal = formatLatex(val);
    html += `
      <div class="choice-item ${isCorrect ? 'correct' : ''}">
        <strong style="color:var(--accent);margin-right:4px;">${escHtml(c.label)}:</strong>
        ${latexVal}
        ${isCorrect ? ' <span style="font-size:11px;font-weight:bold;margin-left:4px;color:var(--green);">✓</span>' : ''}
      </div>`;
  });

  html += `</div></div>`;
  return html;
}

function renderLatex(text, elementId) {
  const el = document.getElementById(elementId);
  if (!el) return;
  if (typeof katex === 'undefined') { el.textContent = text; return; }

  try {
    const html = formatLatex(text);
    el.innerHTML = html;
  } catch {
    el.textContent = text;
  }
}

// ── Review Log view ───────────────────────────────────────────────
async function loadReviews() {
  const loadingEl = document.getElementById('reviews-loading');
  const emptyEl   = document.getElementById('reviews-empty');
  const tableWrap = document.getElementById('reviews-table-wrap');
  const tbody     = document.getElementById('reviews-tbody');

  const subject  = document.getElementById('rev-filter-subject').value.trim();
  const paper    = document.getElementById('rev-filter-paper').value.trim();
  const year     = document.getElementById('rev-filter-year').value.trim();
  const month    = document.getElementById('rev-filter-month').value.trim();
  const reviewer = document.getElementById('rev-filter-reviewer').value.trim();
  const status   = document.getElementById('rev-filter-status').value.trim();

  const params = new URLSearchParams();
  if (subject)  params.set('subject', subject);
  if (paper)    params.set('paper', paper);
  if (year)     params.set('year', year);
  if (month)    params.set('month', month);
  if (reviewer) params.set('reviewer', reviewer);
  if (status)   params.set('status', status);
  params.set('limit', '500');

  loadingEl.classList.remove('hidden');
  emptyEl.classList.add('hidden');
  tableWrap.classList.add('hidden');

  try {
    const items = await api(`/admin/reviews?${params.toString()}`);
    loadingEl.classList.add('hidden');

    if (!items || !items.length) {
      emptyEl.classList.remove('hidden');
      document.getElementById('stat-rev-total').textContent = '0';
      document.getElementById('stat-rev-reviewed').textContent = '0';
      document.getElementById('stat-rev-count').textContent = '0';
      document.getElementById('stat-rev-users').textContent = '0';
      return;
    }

    let totalReviewedCount = 0;
    let totalReviewActions = 0;
    const reviewersSet = new Set();

    tbody.innerHTML = '';
    items.forEach(q => {
      if (q.review_count > 0) totalReviewedCount++;
      totalReviewActions += (q.review_count || 0);

      const qLabel = `Q${q.number}${q.part ? ' (' + q.part + (q.subpart ? ' ' + q.subpart : '') + ')' : ''}`;
      const sitLabel = `${q.subject} P${q.paper} ${q.year || ''}`;

      let statusBadge = '<span class="badge">Unreviewed</span>';
      if (q.latest_review_status === 'correct') {
        statusBadge = '<span class="badge badge-green">✓ Correct</span>';
      } else if (q.latest_review_status === 'needs_fix') {
        statusBadge = '<span class="badge badge-red">⚠ Needs Fix</span>';
      }
      if (q.has_conflicting_reviews) {
        statusBadge += ' <span class="badge badge-yellow" style="margin-left:4px;">⚡ Conflict</span>';
      }

      let logHtml = '';
      if (q.reviews && q.reviews.length > 0) {
        logHtml = '<div style="display:flex;flex-direction:column;gap:4px;max-height:140px;overflow-y:auto;">';
        q.reviews.forEach(r => {
          if (r.reviewer_id) reviewersSet.add(r.reviewer_id);
          const stBadge = r.status === 'correct'
            ? '<span class="badge badge-green" style="font-size:10px;padding:1px 5px;">Correct</span>'
            : '<span class="badge badge-red" style="font-size:10px;padding:1px 5px;">Needs Fix</span>';
          const dtStr = r.reviewed_at ? new Date(r.reviewed_at).toLocaleDateString() : '';
          const noteText = r.note ? `<span class="text-muted text-xs"> — "${escHtml(r.note)}"</span>` : '';
          logHtml += `<div style="font-size:12px;line-height:1.4;">
            <strong>${escHtml(r.reviewer_id || 'Anonymous')}</strong> ${stBadge} <span class="text-muted text-xs">${dtStr}</span>${noteText}
          </div>`;
        });
        logHtml += '</div>';
      } else {
        logHtml = '<span class="text-muted text-xs">No reviews recorded yet</span>';
      }

      const qTextHtml = formatLatex(q.question_raw);
      const choicesHtml = renderChoicesBlock(q.choices, q.correct_choice);

      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td><strong>${escHtml(sitLabel)}</strong></td>
        <td><span class="badge badge-accent">${escHtml(qLabel)}</span></td>
        <td style="max-width:320px;">
          <div class="text-sm font-medium" style="margin-bottom:4px;">${qTextHtml}</div>
          ${choicesHtml}
        </td>
        <td><strong>${q.review_count || 0}</strong> review${q.review_count === 1 ? '' : 's'}</td>
        <td>${statusBadge}</td>
        <td>${logHtml}</td>
        <td>
          <div class="flex gap-2">
            <button class="btn btn-ghost btn-sm btn-jump-editor"
              data-subject="${escAttr(q.subject)}"
              data-paper="${q.paper}" data-year="${q.year}" data-month="${escAttr(q.month || '')}">
              Edit
            </button>
            <button class="btn btn-ghost btn-sm btn-unreview-paper"
              data-subject="${escAttr(q.subject)}"
              data-paper="${q.paper}" data-year="${q.year}" data-month="${escAttr(q.month || '')}">
              ↺ Unreview
            </button>
          </div>
        </td>
      `;
      tbody.appendChild(tr);
    });

    document.getElementById('stat-rev-total').textContent = items.length;
    document.getElementById('stat-rev-reviewed').textContent = totalReviewedCount;
    document.getElementById('stat-rev-count').textContent = totalReviewActions;
    document.getElementById('stat-rev-users').textContent = reviewersSet.size;

    tableWrap.classList.remove('hidden');

    tbody.querySelectorAll('.btn-jump-editor').forEach(btn => {
      btn.addEventListener('click', () => {
        document.getElementById('filter-subject').value = btn.dataset.subject;
        document.getElementById('filter-paper').value   = btn.dataset.paper;
        document.getElementById('filter-year').value    = btn.dataset.year;
        document.getElementById('filter-month').value   = btn.dataset.month;
        showView('editor');
        loadEditorQuestions();
      });
    });

    tbody.querySelectorAll('.btn-unreview-paper').forEach(btn => {
      btn.addEventListener('click', () => openUnreviewModal({
        subject: btn.dataset.subject,
        paper:   Number(btn.dataset.paper),
        year:    btn.dataset.year ? Number(btn.dataset.year) : undefined,
        month:   btn.dataset.month,
      }));
    });

  } catch (err) {
    loadingEl.classList.add('hidden');
    toast(`Failed to load review history: ${err.message}`, 'error');
  }
}

document.getElementById('btn-reviews-apply').addEventListener('click', loadReviews);
document.getElementById('btn-refresh-reviews').addEventListener('click', loadReviews);
document.getElementById('btn-reviews-clear').addEventListener('click', () => {
  document.getElementById('rev-filter-subject').value = '';
  document.getElementById('rev-filter-paper').value   = '';
  document.getElementById('rev-filter-year').value    = '';
  document.getElementById('rev-filter-month').value   = '';
  document.getElementById('rev-filter-reviewer').value = '';
  document.getElementById('rev-filter-status').value   = '';
  loadReviews();
});

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
        </td>
        <td>
          <div class="flex gap-2">
            <button class="btn btn-ghost btn-sm btn-stat-reviews"
              data-subject="${escAttr(s.subject)}"
              data-paper="${s.paper}">
              👁 Reviews
            </button>
            <button class="btn btn-ghost btn-sm btn-unreview-stat"
              data-subject="${escAttr(s.subject)}"
              data-paper="${s.paper}">
              ↺ Unreview
            </button>
          </div>
        </td>`;
      tbody.appendChild(tr);
    });

    tbody.querySelectorAll('.btn-stat-reviews').forEach(btn => {
      btn.addEventListener('click', () => {
        document.getElementById('rev-filter-subject').value = btn.dataset.subject;
        document.getElementById('rev-filter-paper').value   = btn.dataset.paper;
        document.getElementById('rev-filter-year').value    = '';
        document.getElementById('rev-filter-month').value   = '';
        document.getElementById('rev-filter-reviewer').value = '';
        document.getElementById('rev-filter-status').value   = '';
        showView('reviews');
      });
    });

    tbody.querySelectorAll('.btn-unreview-stat').forEach(btn => {
      btn.addEventListener('click', () => openUnreviewModal({
        subject: btn.dataset.subject,
        paper:   Number(btn.dataset.paper),
      }));
    });

    wrap.classList.remove('hidden');
  } catch (err) {
    loadEl.classList.add('hidden');
    toast(`Failed to load stats: ${err.message}`, 'error');
  }
}

document.getElementById('btn-refresh-stats').addEventListener('click', loadStats);

// ── Unreview Paper Modal ──────────────────────────────────────
let unreviewData = null;

async function openUnreviewModal(data) {
  unreviewData = data;
  const label = `${data.subject} Paper ${data.paper} ${data.month || ''} ${data.year || ''}`.trim();
  document.getElementById('unreview-paper-label').textContent = label;

  const selectEl = document.getElementById('unreview-reviewer-select');
  selectEl.innerHTML = '<option value="__ALL__">⚠️ ALL Reviewers (Reset paper to 0 reviews)</option>';

  try {
    const params = new URLSearchParams({
      subject: data.subject,
      paper: String(data.paper),
      limit: '500'
    });
    if (data.year) params.set('year', String(data.year));
    if (data.month) params.set('month', data.month);

    const questions = await api(`/admin/reviews?${params.toString()}`);
    const reviewerCounts = new Map();

    (questions || []).forEach(q => {
      (q.reviews || []).forEach(r => {
        if (r.reviewer_id) {
          const cnt = reviewerCounts.get(r.reviewer_id) || 0;
          reviewerCounts.set(r.reviewer_id, cnt + 1);
        }
      });
    });

    reviewerCounts.forEach((cnt, reviewerId) => {
      const opt = document.createElement('option');
      opt.value = reviewerId;
      opt.textContent = `👤 Reviewer "${reviewerId}" (${cnt} review${cnt === 1 ? '' : 's'})`;
      selectEl.appendChild(opt);
    });
  } catch {}

  document.getElementById('unreview-modal').classList.remove('hidden');
}

document.getElementById('btn-unreview-cancel').addEventListener('click', () => {
  document.getElementById('unreview-modal').classList.add('hidden');
  unreviewData = null;
});

document.getElementById('btn-unreview-confirm').addEventListener('click', async () => {
  if (!unreviewData) return;
  const btn = document.getElementById('btn-unreview-confirm');
  btn.disabled = true;

  const selectedTarget = document.getElementById('unreview-reviewer-select').value;
  const reviewerId = selectedTarget === '__ALL__' ? null : selectedTarget;

  try {
    const res = await api('/admin/unreview-paper', {
      method: 'POST',
      body: JSON.stringify({
        subject: unreviewData.subject,
        paper: unreviewData.paper,
        year: unreviewData.year,
        month: unreviewData.month,
        reviewer_id: reviewerId,
      }),
    });

    document.getElementById('unreview-modal').classList.add('hidden');
    unreviewData = null;
    toast(`Successfully unreviewed paper (${res.deleted || 0} review records removed)`, 'success');
    
    // Refresh current view
    if (!document.getElementById('view-papers').classList.contains('hidden')) loadPapers();
    if (!document.getElementById('view-reviews').classList.contains('hidden')) loadReviews();
    if (!document.getElementById('view-stats').classList.contains('hidden')) loadStats();
  } catch (err) {
    toast(`Unreview failed: ${err.message}`, 'error');
  } finally {
    btn.disabled = false;
  }
});

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
loadSubjectList();
if (!cfg.workerUrl || !cfg.apiToken) {
  setTimeout(() => {
    settingsPanel.classList.add('open');
    toast('Enter your Worker URL and API token in Settings to get started.', 'info', 6000);
  }, 400);
}
