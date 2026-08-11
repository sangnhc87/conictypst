/* ═══════════════════════════════════════════
   script.js — HDSD Typst
   ═══════════════════════════════════════════ */

// ── Navigation ──────────────────────────────────
const sections  = document.querySelectorAll('.doc-section');
const navLinks  = document.querySelectorAll('.nav-link');
const sidebar   = document.getElementById('sidebar');
const overlay   = document.getElementById('overlay');
const menuBtn   = document.getElementById('menuBtn');
const backToTop = document.getElementById('backToTop');

function showSection(id) {
  sections.forEach(s => s.classList.add('hidden'));
  navLinks.forEach(l => l.classList.remove('active'));

  const target = document.getElementById(id);
  if (target) {
    target.classList.remove('hidden');
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  const link = document.querySelector(`[data-section="${id}"]`);
  if (link) {
    link.classList.add('active');
    link.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
  }

  // Update URL hash without jumping
  history.replaceState(null, '', '#' + id);
  document.dispatchEvent(new CustomEvent('hdsd-section-shown', { detail: { id } }));
}

function navigateTo(id) {
  showSection(id);
  // Close sidebar on mobile
  if (window.innerWidth <= 900) {
    sidebar.classList.remove('open');
    overlay.classList.remove('show');
  }
}

// Nav link clicks
navLinks.forEach(link => {
  // Liên kết sang trang khác (Dashboard, Hệ sinh thái...) không có
  // data-section và phải giữ hành vi điều hướng mặc định.
  if (!link.dataset.section) return;
  link.addEventListener('click', e => {
    e.preventDefault();
    const id = link.dataset.section;
    navigateTo(id);
  });
});

// Menu toggle
menuBtn.addEventListener('click', () => {
  sidebar.classList.toggle('open');
  overlay.classList.toggle('show');
});
overlay.addEventListener('click', () => {
  sidebar.classList.remove('open');
  overlay.classList.remove('show');
});

// Back to top
window.addEventListener('scroll', () => {
  backToTop.classList.toggle('show', window.scrollY > 300);
});

// Initial section from hash
const initSection = (location.hash.slice(1)) || 'intro';
showSection(initSection);
// Expose globally for playground.js to hook in
window.showSection = showSection;

// ── Tabs ────────────────────────────────────────
function switchTab(btn, targetId) {
  const container = btn.closest('section') || document;
  container.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
  container.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
  btn.classList.add('active');
  const target = document.getElementById(targetId);
  if (target) target.classList.add('active');
}

// ── Copy code ────────────────────────────────────
function getCodeSource(codeEl) {
  if (!codeEl) return '';
  if (codeEl.id === 'bbtGeneratedCode') return codeEl.textContent || '';
  return codeEl.dataset.rawCode || codeEl.textContent || '';
}
window.getCodeSource = getCodeSource;

function copyCode(btn) {
  const codeEl = btn.closest('.code-block-wrap').querySelector('code');
  const text = getCodeSource(codeEl);
  navigator.clipboard.writeText(text).then(() => {
    btn.textContent = '✓ Đã chép';
    btn.classList.add('copied');
    setTimeout(() => {
      btn.textContent = 'Copy';
      btn.classList.remove('copied');
    }, 1800);
  }).catch(() => {
    // Fallback
    const ta = document.createElement('textarea');
    ta.value = text;
    document.body.appendChild(ta);
    ta.select();
    document.execCommand('copy');
    document.body.removeChild(ta);
    btn.textContent = '✓ Đã chép';
    btn.classList.add('copied');
    setTimeout(() => { btn.textContent = 'Copy'; btn.classList.remove('copied'); }, 1800);
  });
}

// ── Search ───────────────────────────────────────
const searchIndex = [
  // Format: { title, section, keywords }
  { title: 'Giới thiệu hệ thống', section: 'intro', keywords: ['giới thiệu', 'overview', 'stexgv', 'typst'] },
  { title: 'Cài đặt & Biên dịch', section: 'install', keywords: ['install', 'cài đặt', 'compile', 'biên dịch', 'typst compile', 'root'] },
  { title: 'Khởi động nhanh', section: 'quickstart', keywords: ['quickstart', 'khởi động', 'nhanh', 'bắt đầu'] },
  { title: 'Tổng quan đề thi', section: 'exam-overview', keywords: ['đề thi', 'exam', 'overview', 'sang-exam'] },
  { title: '#tn — Trắc nghiệm', section: 'tn', keywords: ['tn', 'mcq', 'trắc nghiệm', 'multiple choice', 'phương án', 'True'] },
  { title: '#ds — Đúng Sai', section: 'ds', keywords: ['ds', 'tf', 'đúng sai', 'true false', 'phát biểu', 'use-table', 'ds-style', 'pill', 'modern', 'minimal', 'bookmark', 'folder', 'diamond', 'gradient', 'checklist'] },
  { title: '#tln — Trả lời ngắn', section: 'tln', keywords: ['tln', 'short answer', 'trả lời ngắn', 'ô trống', 'box-count', 'show-boxes', 'ẩn ô', 'hiện ô'] },
  { title: '#tl — Tự luận', section: 'tl', keywords: ['tl', 'essay', 'tự luận', 'step', 'bước', 'lời giải'] },
  { title: 'Tiêu đề đề thi', section: 'exam-header', keywords: ['thpt-school-exam', 'tiêu đề', 'department', 'school', 'duration', 'code', 'header'] },
  { title: 'Chế độ hiển thị', section: 'exam-mode', keywords: ['mode', 'dethi', 'loigiai', 'solcolor', 'exam-mode', 'accent', 'setcau', 'resetcau'] },
  { title: 'ID & ngân hàng câu hỏi', section: 'ids-bank', keywords: ['id', 'tags', 'bank', 'bank.json', 'question-bank', 'questions.typ', 'render-selection', 'question-select'] },
  { title: 'Trộn đề Typst', section: 'exam-mix-typst', keywords: ['trộn đề', 'tron de', 'mix exam', 'seed', 'ma trận', 'matrix', 'exam-slot', 'build-exam-plan', 'render-exam-plan', 'render-answer-key', 'mã đề', 'thpt-2025-matrix', 'stexgv', 'stexgv import', 'stexgv typst bridge', 'ngân hàng câu hỏi', 'quan ly ngan hang', 'stexgv-bank'] },
  { title: 'Tham số Typst thường dùng', section: 'typst-params', keywords: ['typst', 'tham số', 'grid', 'block', 'box', 'table', 'content', 'tuple', 'dictionary', 'metadata'] },
  { title: 'Hộp sư phạm', section: 'pedagogy-boxes', keywords: ['ppgiai', 'luuy', 'meo', 'nhanxet', 'lythuyet', 'note', 'dn', 'dl', 'tc', 'bode', 'hộp'] },
  { title: 'File mẫu đề thi', section: 'exam-boiler', keywords: ['mẫu', 'template', 'boilerplate', 'đề thi mẫu', 'de-thi'] },
  { title: 'Tổng quan sách', section: 'book-overview', keywords: ['sách', 'sgk', 'chuyên đề', 'book', 'stexgv-doc', 'doc-type'] },
  { title: 'Cấu trúc phân cấp', section: 'book-structure', keywords: ['part', 'chapter', 'bai', 'dang', 'muc', 'appendix', 'phuluc', 'unit', 'lesson'] },
  { title: 'Hộp nội dung SGK', section: 'book-boxes', keywords: ['muctieu', 'khoidong', 'khampha', 'luyentap', 'vandung', 'tomtat', 'ghinho', 'phuongphap', 'vd', 'bt'] },
  { title: 'Bộ đếm trong sách', section: 'book-counters', keywords: ['setbai', 'setchuong', 'setvd', 'setbt', 'resetbai', 'bộ đếm', 'counter'] },
  { title: 'Bộ đề nhiều đề', section: 'exam-set', keywords: ['de', 'dethi', 'bo-de', 'exam-set', 'stexgv-exam-set', 'matran', 'dacta'] },
  { title: 'File mẫu sách', section: 'book-boiler', keywords: ['sách mẫu', 'chuyên đề mẫu', 'book boilerplate'] },
  { title: 'Tổng quan vẽ hình', section: 'bbt-overview', keywords: ['vẽ hình', 'drawing', 'bbt', 'geometry', 'cetz'] },
  { title: '#bbtv2 — BBT Live Lab', section: 'bbtv2', keywords: ['bbtv2', 'bảng biến thiên', 'bbv', 'live', 'thao tác', 'kết quả', 'x-vals', 'd-signs', 'v-vals', 'shade', 'tiệm cận'] },
  { title: '#bbbt — BBT đầy đủ', section: 'bbbt', keywords: ['bbbt', 'ranks', 'bảng biến thiên đầy đủ'] },
  { title: '#bxd — Bảng xét dấu', section: 'bxd', keywords: ['bxd', 'xét dấu', 'f-signs', 'bất phương trình'] },
  { title: 'Cetz cơ bản', section: 'cetz-basics', keywords: ['cetz', 'tikz', 'tikzpicture', 'canvas', 'begin', 'draw', 'line', 'circle', 'content', 'vẽ hình cơ bản'] },
  { title: 'Hình phẳng', section: 'geo-2d', keywords: ['tri-xyz', 'tri-abc', 'tri-right', 'rect-abc', 'square', 'circle-desc', 'tam giác', 'hình chữ nhật', 'đường tròn'] },
  { title: 'Hình không gian', section: 'geo-3d', keywords: ['chop-sabc', 'chop-sabcd', 'lang-tru-abc', 'hình chóp', 'lăng trụ', 'hidden'] },
  { title: 'Đồ thị hàm số', section: 'graphs', keywords: ['axis-xy', 'parabola', 'plot', 'đồ thị', 'parabol', 'trục Oxy'] },
  { title: 'Kho hình mẫu', section: 'figure-gallery', keywords: ['kho hình', 'mẫu hình', 'gallery', 'hình mẫu', 'hình nón', 'hình trụ', 'hình hộp', 'tam giác', 'parabol', 'câu hỏi có hình'] },
  { title: 'Tải về gói template', section: 'downloads', keywords: ['tải', 'download', 'zip', 'gói', 'template'] },
];

const searchInput   = document.getElementById('searchInput');
const searchResults = document.getElementById('searchResults');

searchInput.addEventListener('input', () => {
  const q = searchInput.value.trim().toLowerCase();
  if (!q) { searchResults.classList.remove('show'); return; }

  const matches = searchIndex.filter(item =>
    item.title.toLowerCase().includes(q) ||
    item.keywords.some(k => k.toLowerCase().includes(q))
  ).slice(0, 8);

  if (!matches.length) { searchResults.classList.remove('show'); return; }

  searchResults.innerHTML = matches.map(m => {
    const kw = m.keywords.find(k => k.toLowerCase().includes(q));
    return `
      <div class="search-result-item" onclick="navigateTo('${m.section}'); searchInput.value=''; searchResults.classList.remove('show');">
        <div class="sri-title">${m.title}</div>
        ${kw ? `<div><span class="sri-keyword">${kw}</span></div>` : ''}
      </div>`;
  }).join('');
  searchResults.classList.add('show');
});

document.addEventListener('click', e => {
  if (!e.target.closest('.topbar-search')) searchResults.classList.remove('show');
});

// Keyboard: Escape closes search
searchInput.addEventListener('keydown', e => {
  if (e.key === 'Escape') { searchResults.classList.remove('show'); searchInput.blur(); }
});

// ── Syntax highlighting (minimal, CSS-based) ─────
// Mark up typst code blocks
function escapeForCode(value) {
  return String(value ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

function highlightTypstSource(source) {
  let out = '';
  let i = 0;
  while (i < source.length) {
    const rest = source.slice(i);

    if (rest.startsWith('//')) {
      const end = source.indexOf('\n', i);
      const raw = end === -1 ? source.slice(i) : source.slice(i, end);
      out += `<span class="cm">${escapeForCode(raw)}</span>`;
      i += raw.length;
      continue;
    }

    if (source[i] === '"') {
      let j = i + 1;
      while (j < source.length) {
        if (source[j] === '"' && source[j - 1] !== '\\') {
          j += 1;
          break;
        }
        j += 1;
      }
      out += `<span class="str">${escapeForCode(source.slice(i, j))}</span>`;
      i = j;
      continue;
    }

    const macro = rest.match(/^#[a-zA-Z][\w-]*/);
    if (macro) {
      out += `<span class="hash">${escapeForCode(macro[0])}</span>`;
      i += macro[0].length;
      continue;
    }

    out += escapeForCode(source[i]);
    i += 1;
  }
  return out;
}

document.querySelectorAll('pre code').forEach(block => {
  const lang = block.className;
  if (!lang.includes('typst')) return;
  if (block.id === 'bbtGeneratedCode') return;

  const raw = block.textContent || '';
  block.dataset.rawCode = raw;
  block.innerHTML = highlightTypstSource(raw);
});

// ── Smooth nav highlight on scroll ──────────────
// (no-op for single-page, but available)

// ── Keyboard shortcut: / to focus search ────────
document.addEventListener('keydown', e => {
  if (e.key === '/' && document.activeElement.tagName !== 'INPUT') {
    e.preventDefault();
    searchInput.focus();
    searchInput.select();
  }
});

// ── Progress indicator ───────────────────────────
const progressBar = document.createElement('div');
progressBar.style.cssText = 'position:fixed;top:60px;left:0;height:2px;background:linear-gradient(90deg,#0057b8,#4d9fff);z-index:200;transition:width .1s;';
document.body.appendChild(progressBar);

window.addEventListener('scroll', () => {
  const h = document.documentElement;
  const pct = (window.scrollY / (h.scrollHeight - h.clientHeight)) * 100;
  progressBar.style.width = Math.min(pct, 100) + '%';
});

// ── BBT Live Lab ─────────────────────────────────
const bbtPresets = {
  cubic: {
    var: '$x$',
    der: "$y'$",
    func: '$y$',
    x: '$-oo$, $-1$, $1$, $+oo$',
    d: '$+$, $0$, $-$, $0$, $+$',
    v: '$-oo$, $2$, $-2$, $+oo$',
    shade: '',
    w1: '1.5',
    w2: '10',
    h3: 'auto',
  },
  asymptote: {
    var: '$x$',
    der: "$y'$",
    func: '$y$',
    x: '$-oo$, $1$, $+oo$',
    d: '$-$, "||", $-$',
    v: '$0$, ($+oo$, $-oo$), $0$',
    shade: '1-2',
    w1: '1.5',
    w2: '9',
    h3: 'auto',
  },
  quartic: {
    var: '$x$',
    der: "$y'$",
    func: '$y$',
    x: '$-oo$, $-1$, $0$, $1$, $+oo$',
    d: '$-$, $0$, $+$, $0$, $-$, $0$, $+$',
    v: '$+oo$, $-2$, $1$, $-2$, $+oo$',
    shade: '',
    w1: '1.5',
    w2: '12',
    h3: 'auto',
  },
  monotone: {
    var: '$x$',
    der: "$f'(x)$",
    func: '$f(x)$',
    x: '$0$, $2$, $5$',
    d: '$+$, "", $+$',
    v: '$1$, $3$, $8$',
    shade: '',
    w1: '1.6',
    w2: '8',
    h3: 'auto',
  },
};

function splitBbtList(raw) {
  let text = String(raw || '').trim();
  if (text.startsWith('(') && text.endsWith(')')) text = text.slice(1, -1).trim();
  const items = [];
  let buf = '';
  let depth = 0;
  for (const ch of text) {
    if ('([{'.includes(ch)) depth += 1;
    if (')]}'.includes(ch)) depth = Math.max(0, depth - 1);
    if (ch === ',' && depth === 0) {
      if (buf.trim()) items.push(buf.trim());
      buf = '';
    } else {
      buf += ch;
    }
  }
  if (buf.trim()) items.push(buf.trim());
  return items;
}

function escapeHtml(value) {
  return String(value ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

function cleanMath(value) {
  let text = String(value ?? '').trim();
  text = text.replace(/^"(.*)"$/, '$1');
  text = text.replace(/^\$(.*)\$$/, '$1');
  text = text
    .replace(/\\infty/g, '∞')
    .replace(/\+oo/g, '+∞')
    .replace(/-oo/g, '−∞')
    .replace(/\boo\b/g, '∞')
    .replace(/\\pi\b|\bpi\b/g, 'π')
    .replace(/\\cdot/g, '·')
    .replace(/\\,/g, ' ');
  return text || '';
}

function renderMathLike(value) {
  const text = String(value ?? '').trim();
  if (text.startsWith('(') && text.endsWith(')')) {
    const parts = splitBbtList(text.slice(1, -1));
    if (parts.length > 1) {
      return `<span class="bbt-vsplit">${parts.map(p => `<span>${escapeHtml(cleanMath(p))}</span>`).join('')}</span>`;
    }
  }
  if (text.includes('|') && !text.includes('||')) {
    const parts = text.split('|').map(p => p.trim()).filter(Boolean);
    if (parts.length > 1) {
      return `<span class="bbt-vsplit">${parts.map(p => `<span>${escapeHtml(cleanMath(p))}</span>`).join('')}</span>`;
    }
  }
  return escapeHtml(cleanMath(text));
}

function normalizeSign(value) {
  const text = cleanMath(value).replace(/\s/g, '');
  if (!text || text === 'none' || text === '[]') return '';
  if (text.includes('||') || text.includes('∥')) return '||';
  if (text.includes('0')) return '0';
  if (text.includes('+')) return '+';
  if (text.includes('-') || text.includes('−')) return '-';
  return text;
}

function xIndexToCol(index, xCount, colCount) {
  if (index <= 0) return 0;
  if (index >= xCount - 1) return colCount - 1;
  return Math.min(colCount - 1, index * 2 - 1);
}

function parseShadeRanges(raw, xCount, colCount) {
  const text = String(raw || '').trim();
  if (!text) return [];
  const ranges = [];
  const re = /(\d+)\s*(?:-|:|,)\s*(\d+)/g;
  let match;
  while ((match = re.exec(text)) !== null) {
    const a = Number(match[1]);
    const b = Number(match[2]);
    if (Number.isFinite(a) && Number.isFinite(b)) {
      const start = xIndexToCol(Math.min(a, b), xCount, colCount);
      const end = xIndexToCol(Math.max(a, b), xCount, colCount);
      ranges.push([Math.min(start, end), Math.max(start, end)]);
    }
  }
  return ranges;
}

function isShaded(col, ranges) {
  return ranges.some(([start, end]) => col >= start && col <= end);
}

function formatTuple(items) {
  const list = items.map(item => String(item).trim()).filter(Boolean);
  return `(${list.join(', ')}${list.length === 1 ? ',' : ''})`;
}

function formatShadeForTypst(raw) {
  const text = String(raw || '').trim();
  if (!text) return '()';
  const pairs = [];
  const re = /(\d+)\s*(?:-|:|,)\s*(\d+)/g;
  let match;
  while ((match = re.exec(text)) !== null) pairs.push(`(${match[1]}, ${match[2]})`);
  if (!pairs.length) return text.startsWith('(') ? text : `(${text})`;
  return `(${pairs.join(', ')}${pairs.length === 1 ? ',' : ''})`;
}

function getBbtState() {
  const el = id => document.getElementById(id);
  return {
    var: el('bbtVar')?.value.trim() || '$x$',
    der: el('bbtDer')?.value.trim() || "$y'$",
    func: el('bbtFunc')?.value.trim() || '$y$',
    xVals: splitBbtList(el('bbtXVals')?.value || ''),
    dSigns: splitBbtList(el('bbtDSigns')?.value || ''),
    vVals: splitBbtList(el('bbtVVals')?.value || ''),
    shade: el('bbtShade')?.value.trim() || '',
    w1: el('bbtW1')?.value.trim() || '1.5',
    w2: el('bbtW2')?.value.trim() || '10',
    h3: el('bbtH3')?.value.trim() || 'auto',
  };
}

function buildBbtCode(state) {
  const shadeLine = state.shade ? `\n  shade: ${formatShadeForTypst(state.shade)},` : '';
  return `#bbtv2(
  var: ${state.var},
  der: ${state.der},
  func: ${state.func},
  x-vals: ${formatTuple(state.xVals)},
  d-signs: ${formatTuple(state.dSigns)},
  v-vals: ${formatTuple(state.vVals)},${shadeLine}
  w1: ${state.w1},
  w2: ${state.w2},
  h3: ${state.h3},
)`;
}

let bbtOfficialTimer = 0;
let bbtOfficialSeq = 0;
let bbtLastRenderedCode = '';

function setBbtBadge(kind, text) {
  const badge = document.getElementById('bbtCheckBadge');
  if (!badge) return;
  badge.textContent = text;
  badge.classList.remove('warn', 'loading', 'error');
  if (kind) badge.classList.add(kind);
}

function setBbtRenderMessage({ title, body = '', spinner = false, error = false }) {
  const preview = document.getElementById('bbtPreview');
  if (!preview) return;
  preview.innerHTML = `
    <div class="bbt-render-message">
      ${spinner ? '<div class="bbt-render-spinner"></div>' : ''}
      <strong>${escapeHtml(title)}</strong>
      ${body ? (error ? `<pre>${escapeHtml(body)}</pre>` : `<div>${escapeHtml(body)}</div>`) : ''}
    </div>`;
}

function updateBbtStructureStatus(state) {
  const note = document.getElementById('bbtLiveNote');
  if (!note) return;

  const xCount = Math.max(state.xVals.length, 2);
  const expectedSigns = Math.max(1, 2 * xCount - 3);
  const problems = [];
  if (state.xVals.length < 2) problems.push('Cần ít nhất 2 mốc x.');
  if (state.dSigns.length !== expectedSigns) problems.push(`d-signs hiện có ${state.dSigns.length}; với ${xCount} mốc x nên là ${expectedSigns}.`);
  if (state.vVals.length !== state.xVals.length) problems.push(`v-vals hiện có ${state.vVals.length}; thường nên bằng số mốc x (${state.xVals.length}).`);

  if (problems.length) {
    note.textContent = problems.join(' ');
    note.classList.remove('ok');
    setBbtBadge('warn', 'Cần kiểm tra');
  } else {
    note.textContent = `Đúng cấu trúc: ${state.xVals.length} mốc x, ${state.dSigns.length} phần tử d-signs, ${state.vVals.length} giá trị hàm.`;
    note.classList.add('ok');
  }
}

function renderBbtPreview(state) {
  const preview = document.getElementById('bbtPreview');
  const note = document.getElementById('bbtLiveNote');
  const badge = document.getElementById('bbtCheckBadge');
  const code = document.getElementById('bbtGeneratedCode');
  if (!preview || !note || !badge || !code) return;

  code.textContent = buildBbtCode(state);
  updateBbtStructureStatus(state);
  scheduleBbtOfficialRender();
}

function scheduleBbtOfficialRender(delay = 650) {
  const section = document.getElementById('bbtv2');
  if (section?.classList.contains('hidden')) return;
  clearTimeout(bbtOfficialTimer);
  bbtOfficialTimer = setTimeout(renderBbtOfficial, delay);
}

async function renderBbtOfficial() {
  const codeEl = document.getElementById('bbtGeneratedCode');
  const code = codeEl?.textContent || '';
  if (!code.trim()) return;

  const seq = ++bbtOfficialSeq;
  if (!window.compileTypstToSvg) {
    setBbtBadge('loading', 'Đang tải compiler');
    setBbtRenderMessage({
      title: 'Đang tải Typst compiler',
      body: 'Lần đầu mở trang cần tải WASM compiler. Khi sẵn sàng, bảng sẽ tự render lại.',
      spinner: true,
    });
    return;
  }

  if (code === bbtLastRenderedCode && document.querySelector('#bbtPreview .bbt-official-svg')) {
    setBbtBadge('', 'Render chính thức');
    return;
  }

  setBbtBadge('loading', 'Đang render Typst');
  setBbtRenderMessage({
    title: 'Đang compile bằng Typst thật',
    body: 'Kết quả dưới đây dùng cùng compiler với nút Chạy trong playground.',
    spinner: true,
  });

  try {
    const svg = await window.compileTypstToSvg(code);
    if (seq !== bbtOfficialSeq) return;
    bbtLastRenderedCode = code;
    const preview = document.getElementById('bbtPreview');
    if (preview) preview.innerHTML = `<div class="bbt-official-svg">${svg}</div>`;
    setBbtBadge('', 'Render chính thức');
  } catch (err) {
    if (seq !== bbtOfficialSeq) return;
    bbtLastRenderedCode = '';
    setBbtBadge('error', 'Lỗi compile');
    setBbtRenderMessage({
      title: 'Typst báo lỗi compile',
      body: String(err),
      error: true,
    });
  }
}

function copyBbtGenerated(btn) {
  const code = document.getElementById('bbtGeneratedCode')?.textContent || '';
  if (!code) return;
  navigator.clipboard.writeText(code).then(() => {
    const old = btn.textContent;
    btn.textContent = 'Đã copy';
    setTimeout(() => { btn.textContent = old; }, 1400);
  });
}

function applyBbtPreset(name) {
  const preset = bbtPresets[name] || bbtPresets.cubic;
  const set = (id, value) => {
    const el = document.getElementById(id);
    if (el) el.value = value;
  };
  set('bbtVar', preset.var);
  set('bbtDer', preset.der);
  set('bbtFunc', preset.func);
  set('bbtXVals', preset.x);
  set('bbtDSigns', preset.d);
  set('bbtVVals', preset.v);
  set('bbtShade', preset.shade);
  set('bbtW1', preset.w1);
  set('bbtW2', preset.w2);
  set('bbtH3', preset.h3);
  renderBbtPreview(getBbtState());
}

function initBbtLiveLab() {
  if (!document.getElementById('bbtLive')) return;
  const ids = ['bbtVar', 'bbtDer', 'bbtFunc', 'bbtXVals', 'bbtDSigns', 'bbtVVals', 'bbtShade', 'bbtW1', 'bbtW2', 'bbtH3'];
  ids.forEach(id => {
    const el = document.getElementById(id);
    if (el) el.addEventListener('input', () => renderBbtPreview(getBbtState()));
  });
  document.getElementById('bbtPreset')?.addEventListener('change', e => applyBbtPreset(e.target.value));
  document.getElementById('bbtCopyBtn')?.addEventListener('click', e => copyBbtGenerated(e.currentTarget));
  document.getElementById('bbtGeneratedCopy')?.addEventListener('click', e => copyBbtGenerated(e.currentTarget));
  document.getElementById('bbtOpenPgBtn')?.addEventListener('click', () => {
    const code = document.getElementById('bbtGeneratedCode')?.textContent || '';
    if (window.openTypstPlayground) window.openTypstPlayground(code);
    else copyBbtGenerated(document.getElementById('bbtOpenPgBtn'));
  });
  renderBbtPreview(getBbtState());
}

initBbtLiveLab();

document.addEventListener('typst-playground-ready', () => {
  if (document.getElementById('bbtLive')) scheduleBbtOfficialRender(0);
});

document.addEventListener('hdsd-section-shown', e => {
  if (e.detail?.id === 'bbtv2') scheduleBbtOfficialRender(0);
});
