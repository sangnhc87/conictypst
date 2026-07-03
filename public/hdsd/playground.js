/* ═══════════════════════════════════════════════════════════════
   playground.js — HDSD Typst Live Playground
   Load WASM compiler từ CDN, compile Typst inline, render SVG
   ═══════════════════════════════════════════════════════════════ */

const TYPST_VERSION = '0.7.0-rc2';
const CDN = 'https://cdn.jsdelivr.net/npm/@myriaddreamin';
const COMPILER_WASM = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler_bg.wasm`;
const RENDERER_WASM = `${CDN}/typst-ts-renderer@${TYPST_VERSION}/pkg/typst_ts_renderer_bg.wasm`;
const TYPST_TS_ESM = `${CDN}/typst.ts@0.7.0-rc2/dist/esm/main.mjs`;
const TYPST_INIT_ESM = `${CDN}/typst.ts@0.7.0-rc2/dist/esm/options.init.mjs`;
const TYPST_MEMORY_ESM = `${CDN}/typst.ts@0.7.0-rc2/dist/esm/fs/memory.mjs`;

// ── Typst system files (các file bbt.typ, sang-exam.typ, ...) ──
// Lấy nội dung từ CDN hoặc fetch từ server local
let _compiler = null, _renderer = null;
let _compilerReady = false, _rendererReady = false;
let _initPromise = null;

// Lấy source từ downloads folder nếu có, hoặc từ remote
async function fetchSource(url) {
  try {
    const r = await fetch(url);
    if (!r.ok) throw new Error('404');
    return await r.text();
  } catch {
    return null;
  }
}

// Source inline — embed tối giản của bbt.typ, sang-exam.typ
// (Phiên bản rút gọn chỉ dành cho playground — không cần full features)
const BBT_TYP_SRC_URL = '../../typst/bbt.typ'; // relative to hdsd/
const SANG_EXAM_SRC_URL = '../../typst/sang-exam.typ';
const MATH_SYM_SRC_URL = '../../typst/math-sym.typ';
const GEOMETRY_SRC_URL = '../../typst/geometry.typ';

// Các URL CDN từ Cloudflare R2 / jsDelivr đã được host
const SYSTEM_FILES = {
  '/bbt.typ': null,
  '/sang-exam.typ': null,
  '/math-sym.typ': null,
  '/geometry.typ': null,
};

async function loadSystemFiles() {
  // File .typ hệ thống nằm tại ./typst/ cùng thư mục với index.html
  const base = window.location.href.replace(/\/[^\/]*$/, ''); // thư mục hiện tại

  const urls = [
    { key: '/bbt.typ',       url: `${base}/typst/bbt.typ` },
    { key: '/sang-exam.typ', url: `${base}/typst/sang-exam.typ` },
    { key: '/math-sym.typ',  url: `${base}/typst/math-sym.typ` },
    { key: '/geometry.typ',  url: `${base}/typst/geometry.typ` },
  ];

  await Promise.all(urls.map(async ({ key, url }) => {
    if (SYSTEM_FILES[key] !== null) return;
    const src = await fetchSource(url);
    if (src) SYSTEM_FILES[key] = src;
    else console.warn('[Playground] Không tải được:', url);
  }));
}

async function initTypst() {
  if (_initPromise) return _initPromise;
  _initPromise = (async () => {
    // Load system files
    await loadSystemFiles();

    // ── Quan trọng: Import wrapper WASM glue từ CDN dùng URL đầy đủ ──
    // Tránh lỗi "Failed to resolve bare specifier '@myriaddreamin/typst-ts-web-compiler'"
    const COMPILER_MJS = `${CDN}/typst-ts-web-compiler@${TYPST_VERSION}/pkg/typst_ts_web_compiler.mjs`;
    const RENDERER_MJS = `${CDN}/typst-ts-renderer@${TYPST_VERSION}/pkg/typst_ts_renderer.mjs`;

    const [compilerWrapper, rendererWrapper] = await Promise.all([
      import(/* @vite-ignore */ COMPILER_MJS),
      import(/* @vite-ignore */ RENDERER_MJS),
    ]);

    // Dynamic ESM import từ CDN
    const { createTypstCompiler, createTypstRenderer, FetchPackageRegistry, loadFonts } = 
      await import(/* @vite-ignore */ TYPST_TS_ESM);
    const { withAccessModel, withPackageRegistry } = await import(/* @vite-ignore */ TYPST_INIT_ESM);
    const { MemoryAccessModel } = await import(/* @vite-ignore */ TYPST_MEMORY_ESM);

    const accessModel = new MemoryAccessModel();
    const packageRegistry = new FetchPackageRegistry(accessModel);

    // Init compiler — cung cấp getWrapper để tránh bare specifier import nội bộ
    _compiler = createTypstCompiler();
    await _compiler.init({
      getModule: () => COMPILER_WASM,
      getWrapper: () => compilerWrapper,
      beforeBuild: [
        withAccessModel(accessModel),
        withPackageRegistry(packageRegistry),
        loadFonts([], { assets: ['text'] }),
      ],
    });

    // Init renderer — cung cấp getWrapper tương tự
    _renderer = createTypstRenderer();
    await _renderer.init({
      getModule: () => RENDERER_WASM,
      getWrapper: () => rendererWrapper,
    });

    _compilerReady = _rendererReady = true;
  })();
  return _initPromise;
}

async function compileTySvg(code) {
  if (!_compilerReady) await initTypst();

  // Add virtual files
  for (const [path, src] of Object.entries(SYSTEM_FILES)) {
    if (src) _compiler.addSource(path, src);
  }

  // Detect context để import đúng
  const hasBbt = /#bbtv2\(|#bbbt\(|#bxd\(|#bbt-opt\(/.test(code);
  const hasCetzDirect = /cetz\.canvas|#canvas\(/.test(code);
  const hasSang = /#tn\(|#ds\(|#tln\(|#tl\(|#q-wrap\(/.test(code);

  let imports = '';
  // Import cetz chỉ khi code dùng trực tiếp VÀ không qua bbt.typ (bbt.typ tự import cetz rồi)
  if (hasCetzDirect && !hasBbt) {
    imports += `#import "@preview/cetz:0.5.2": *\n`;
    imports += `#import "@preview/cetz-plot:0.1.1": *\n`;
  }
  if (SYSTEM_FILES['/math-sym.typ']) imports += `#import "/math-sym.typ": *\n`;
  if (hasBbt && SYSTEM_FILES['/bbt.typ']) imports += `#import "/bbt.typ": *\n`;
  if (hasSang && SYSTEM_FILES['/sang-exam.typ']) imports += `#import "/sang-exam.typ": *\n`;
  if (SYSTEM_FILES['/geometry.typ']) imports += `#import "/geometry.typ": *\n`;

  const wrapper = `${imports}
#set page(width: auto, height: auto, margin: 16pt, fill: white)
#set text(font: "New Computer Modern", size: 10.5pt)
#set par(leading: 0.35em)
${code}`;

  _compiler.addSource('/pg_main.typ', wrapper);

  const result = await _compiler.compile({
    mainFilePath: '/pg_main.typ',
    format: 0,
  });
  if (!result || !result.result) throw new Error('Compile failed');

  const session = await _renderer.createModule(result.result);
  const svg = await _renderer.renderSvg({ renderSession: session });
  return svg;
}

// ══════════════════════════════════════════════
// UI: Modal Playground
// ══════════════════════════════════════════════
function createPlaygroundModal() {
  if (document.getElementById('pg-modal')) return;

  const modal = document.createElement('div');
  modal.id = 'pg-modal';
  modal.innerHTML = `
    <div id="pg-backdrop"></div>
    <div id="pg-panel">
      <div id="pg-header">
        <span id="pg-title">⚡ Typst Playground</span>
        <div id="pg-header-actions">
          <button id="pg-run-btn">▶ Chạy</button>
          <button id="pg-close-btn">✕</button>
        </div>
      </div>
      <div id="pg-body">
        <div id="pg-editor-pane">
          <div id="pg-editor-label">Mã nguồn Typst</div>
          <textarea id="pg-editor" spellcheck="false" autocomplete="off" autocorrect="off" autocapitalize="off"></textarea>
        </div>
        <div id="pg-divider"></div>
        <div id="pg-preview-pane">
          <div id="pg-preview-label">Kết quả</div>
          <div id="pg-preview">
            <div id="pg-placeholder">Nhấn <strong>▶ Chạy</strong> hoặc <kbd>Ctrl+Enter</kbd> để compile</div>
          </div>
          <div id="pg-status"></div>
        </div>
      </div>
    </div>
  `;
  document.body.appendChild(modal);

  // Close
  document.getElementById('pg-backdrop').addEventListener('click', closePg);
  document.getElementById('pg-close-btn').addEventListener('click', closePg);

  // Run
  document.getElementById('pg-run-btn').addEventListener('click', runPlayground);

  // Ctrl+Enter to run
  document.getElementById('pg-editor').addEventListener('keydown', e => {
    if ((e.ctrlKey || e.metaKey) && e.key === 'Enter') {
      e.preventDefault();
      runPlayground();
    }
  });

  // Escape to close
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape' && modal.classList.contains('open')) closePg();
  });
}

function openPg(code) {
  createPlaygroundModal();
  const modal = document.getElementById('pg-modal');
  document.getElementById('pg-editor').value = code;
  document.getElementById('pg-preview').innerHTML = `<div id="pg-placeholder">Nhấn <strong>▶ Chạy</strong> hoặc <kbd>Ctrl+Enter</kbd> để compile</div>`;
  document.getElementById('pg-status').textContent = '';
  document.getElementById('pg-status').className = '';
  modal.classList.add('open');
  document.body.style.overflow = 'hidden';
  document.getElementById('pg-editor').focus();

  // Warm up compiler in background
  initTypst().catch(() => {});
}

function closePg() {
  const modal = document.getElementById('pg-modal');
  if (modal) modal.classList.remove('open');
  document.body.style.overflow = '';
}

async function runPlayground() {
  const code = document.getElementById('pg-editor').value.trim();
  const statusEl = document.getElementById('pg-status');
  const previewEl = document.getElementById('pg-preview');
  const runBtn = document.getElementById('pg-run-btn');

  if (!code) return;

  runBtn.disabled = true;
  runBtn.textContent = '⏳ Đang compile…';
  statusEl.textContent = 'Đang khởi tạo WASM compiler…';
  statusEl.className = 'pg-loading';
  previewEl.innerHTML = `<div class="pg-spinner"><div class="pg-spin"></div><p>Đang biên dịch Typst…</p></div>`;

  const t0 = Date.now();
  try {
    const svg = await compileTySvg(code);
    const elapsed = ((Date.now() - t0) / 1000).toFixed(2);
    previewEl.innerHTML = `<div id="pg-svg-wrap">${svg}</div>`;
    statusEl.textContent = `✓ Compile thành công trong ${elapsed}s`;
    statusEl.className = 'pg-ok';
  } catch (err) {
    previewEl.innerHTML = `<div class="pg-error-msg"><strong>Lỗi compile:</strong><pre>${String(err).replace(/</g,'&lt;')}</pre></div>`;
    statusEl.textContent = '✗ Compile thất bại';
    statusEl.className = 'pg-err';
  } finally {
    runBtn.disabled = false;
    runBtn.textContent = '▶ Chạy';
  }
}

// ══════════════════════════════════════════════
// Inject "▶ Chạy" buttons vào mọi code block có typst
// ══════════════════════════════════════════════
function injectRunButtons() {
  document.querySelectorAll('.code-block-wrap').forEach(wrap => {
    const codeEl = wrap.querySelector('code');
    if (!codeEl) return;
    // Chỉ inject nếu là typst code và có macro đặc biệt
    const text = codeEl.textContent || '';
    const isRunnable = /#bbtv2\(|#bbbt\(|#bxd\(|#bbt-opt\(|#tn\(|#ds\(|#tln\(|#tl\(|cetz\.canvas|#canvas\(/.test(text);
    if (!isRunnable) return;

    // Tránh add 2 lần
    if (wrap.querySelector('.pg-run-btn')) return;

    const header = wrap.querySelector('.code-header');
    if (!header) return;

    const btn = document.createElement('button');
    btn.className = 'pg-run-btn';
    btn.textContent = '▶ Chạy';
    btn.title = 'Mở playground để chạy code này (Ctrl+Enter)';
    btn.addEventListener('click', () => {
      openPg(codeEl.textContent.trim());
    });
    header.appendChild(btn);
  });
}


// ── Init ─────────────────────────────────────────────
function initPlayground() {
  injectRunButtons();

  // Dùng MutationObserver để inject buttons khi section được hiện ra
  // (vì script.js dùng local showSection, không qua window)
  const observer = new MutationObserver(() => {
    requestAnimationFrame(injectRunButtons);
  });

  // Observe mọi doc-section để biết khi nào class "hidden" bị xóa
  document.querySelectorAll('.doc-section').forEach(section => {
    observer.observe(section, { attributes: true, attributeFilter: ['class'] });
  });
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initPlayground);
} else {
  initPlayground();
}
