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
function copyCode(btn) {
  const pre = btn.closest('.code-block-wrap').querySelector('pre');
  const text = pre.innerText || pre.textContent;
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
  { title: '#ds — Đúng Sai', section: 'ds', keywords: ['ds', 'tf', 'đúng sai', 'true false', 'phát biểu'] },
  { title: '#tln — Trả lời ngắn', section: 'tln', keywords: ['tln', 'short answer', 'trả lời ngắn', 'ô trống', 'box-count'] },
  { title: '#tl — Tự luận', section: 'tl', keywords: ['tl', 'essay', 'tự luận', 'step', 'bước', 'lời giải'] },
  { title: 'Tiêu đề đề thi', section: 'exam-header', keywords: ['thpt-school-exam', 'tiêu đề', 'department', 'school', 'duration', 'code', 'header'] },
  { title: 'Chế độ hiển thị', section: 'exam-mode', keywords: ['mode', 'dethi', 'loigiai', 'solcolor', 'exam-mode', 'accent', 'setcau', 'resetcau'] },
  { title: 'ID & ngân hàng câu hỏi', section: 'ids-bank', keywords: ['id', 'tags', 'bank', 'bank.json', 'question-bank', 'questions.typ', 'render-selection', 'question-select'] },
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
  { title: '#bbtv2 — BBT tiêu chuẩn', section: 'bbtv2', keywords: ['bbtv2', 'bảng biến thiên', 'bbv', 'x-vals', 'd-signs', 'v-vals', 'shade', 'tiệm cận'] },
  { title: '#bbbt — BBT đầy đủ', section: 'bbbt', keywords: ['bbbt', 'ranks', 'bảng biến thiên đầy đủ'] },
  { title: '#bxd — Bảng xét dấu', section: 'bxd', keywords: ['bxd', 'xét dấu', 'f-signs', 'bất phương trình'] },
  { title: 'Hình phẳng', section: 'geo-2d', keywords: ['tri-xyz', 'tri-abc', 'tri-right', 'rect-abc', 'square', 'circle-desc', 'tam giác', 'hình chữ nhật', 'đường tròn'] },
  { title: 'Hình không gian', section: 'geo-3d', keywords: ['chop-sabc', 'chop-sabcd', 'lang-tru-abc', 'hình chóp', 'lăng trụ', 'hidden'] },
  { title: 'Đồ thị hàm số', section: 'graphs', keywords: ['axis-xy', 'parabola', 'plot', 'đồ thị', 'parabol', 'trục Oxy'] },
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
document.querySelectorAll('pre code').forEach(block => {
  const lang = block.className;
  if (!lang.includes('typst')) return;

  let html = block.innerHTML;

  // Escape already done by browser, work with text
  // Comments
  html = html.replace(/(\/\/[^\n]*)/g, '<span class="cm">$1</span>');
  // Strings
  html = html.replace(/"([^"]*)"/g, '<span class="str">"$1"</span>');
  // # macros
  html = html.replace(/(#[a-zA-Z][\w-]*)/g, '<span class="hash">$1</span>');

  block.innerHTML = html;
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
