(function () {
  'use strict';

  const SCRIPT_URLS = [
    'https://www.geogebra.org/apps/deployggb.js',
    'https://cdn.geogebra.org/apps/deployggb.js',
  ];
  const SETTINGS_KEY = 'conictypst-tikz-export-settings-v2';
  const state = {
    api: null,
    scriptPromise: null,
    debounce: 0,
    previewTimer: 0,
    toastTimer: 0,
    resizeTimer: 0,
    lastXml: '',
    lastResult: null,
  };

  const byId = id => document.getElementById(id);

  function toast(message, isError = false) {
    const element = byId('toast');
    if (!element) return;
    window.clearTimeout(state.toastTimer);
    element.textContent = message;
    element.classList.toggle('is-error', isError);
    element.classList.add('is-visible');
    state.toastTimer = window.setTimeout(() => element.classList.remove('is-visible'), 2800);
  }

  function setLiveStatus(message, isError = false) {
    const status = byId('liveStatus');
    if (!status) return;
    status.lastChild.textContent = message;
    status.classList.toggle('is-error', isError);
  }

  function setGgbStatus(title, detail = '', isError = false) {
    const status = byId('ggbStatus');
    if (!status) return;
    status.hidden = false;
    status.innerHTML = isError
      ? `<i data-lucide="wifi-off" aria-hidden="true"></i><strong>${title}</strong><small>${detail}</small><button class="button button-primary compact" id="btnRetryGgb" type="button">Thử kết nối lại</button>`
      : `<span class="loader-ring" aria-hidden="true"></span><strong>${title}</strong><small>${detail}</small>`;
    if (isError) byId('btnRetryGgb')?.addEventListener('click', retryGeoGebra);
    window.lucide?.createIcons();
  }

  function hideGgbStatus() {
    const status = byId('ggbStatus');
    if (status) status.hidden = true;
  }

  function loadGeoGebraScript() {
    if (typeof window.GGBApplet === 'function') return Promise.resolve();
    if (state.scriptPromise) return state.scriptPromise;
    state.scriptPromise = new Promise((resolve, reject) => {
      let index = 0;
      const next = () => {
        if (typeof window.GGBApplet === 'function') {
          resolve();
          return;
        }
        if (index >= SCRIPT_URLS.length) {
          reject(new Error('Không tải được thư viện GeoGebra từ hai máy chủ dự phòng.'));
          return;
        }
        const script = document.createElement('script');
        script.src = SCRIPT_URLS[index++];
        script.async = true;
        script.onload = () => typeof window.GGBApplet === 'function' ? resolve() : next();
        script.onerror = next;
        document.head.append(script);
      };
      next();
    });
    return state.scriptPromise;
  }

  function hostSize() {
    const host = byId('ggb-element');
    const rect = host?.getBoundingClientRect();
    return {
      width: Math.max(320, Math.floor(rect?.width || 900)),
      height: Math.max(520, Math.floor(rect?.height || 720)),
    };
  }

  function registerApiListeners(api) {
    [
      'registerUpdateListener',
      'registerAddListener',
      'registerRemoveListener',
      'registerRenameListener',
      'registerClearListener',
      'registerUpdateStyleListener',
    ].forEach(method => {
      if (typeof api[method] === 'function') {
        try {
          api[method]('ggbTikzChanged');
        } catch (_) {
          // Older GeoGebra builds may expose a method but reject the listener.
        }
      }
    });
  }

  async function initGeoGebra() {
    setLiveStatus('Đang kết nối');
    setGgbStatus('Đang tải GeoGebra…', 'Lần tải đầu có thể mất vài giây.');
    try {
      await loadGeoGebraScript();
      const size = hostSize();
      const applet = new window.GGBApplet({
        appName: 'geometry',
        width: size.width,
        height: size.height,
        showToolBar: true,
        showAlgebraInput: true,
        showMenuBar: true,
        showResetIcon: false,
        enableRightClick: true,
        enableLabelDrags: true,
        language: 'vi',
        useBrowserForJS: true,
        appletOnLoad(api) {
          state.api = api;
          window.ggbApplet = api;
          registerApiListeners(api);
          hideGgbStatus();
          setLiveStatus('Đang đồng bộ');
          window.setTimeout(() => generateTikz(true), 350);
        },
      }, true);
      applet.inject('ggb-element');
    } catch (error) {
      setLiveStatus('Mất kết nối', true);
      setGgbStatus(
        'GeoGebra chưa sẵn sàng',
        `${error.message} Hãy kiểm tra mạng hoặc tiện ích chặn nội dung.`,
        true,
      );
    }
  }

  function retryGeoGebra() {
    state.scriptPromise = null;
    const host = byId('ggb-element');
    if (host) host.innerHTML = '<div class="ggb-status" id="ggbStatus"></div>';
    initGeoGebra();
  }

  function readSettings() {
    return {
      simple: byId('chkSimpleStyles')?.checked ?? true,
      labels: byId('chkLabels')?.checked ?? true,
      clip: byId('chkClip')?.checked ?? true,
      axes: byId('chkAxes')?.checked ?? false,
      grid: byId('chkGrid')?.checked ?? false,
      precision: Number(byId('precision')?.value || 3),
    };
  }

  function saveSettings() {
    try {
      localStorage.setItem(SETTINGS_KEY, JSON.stringify(readSettings()));
    } catch (_) {
      // Preferences are optional.
    }
  }

  function restoreSettings() {
    try {
      const saved = JSON.parse(localStorage.getItem(SETTINGS_KEY) || 'null');
      if (!saved) return;
      const mapping = {
        chkSimpleStyles: saved.simple,
        chkLabels: saved.labels,
        chkClip: saved.clip,
        chkAxes: saved.axes,
        chkGrid: saved.grid,
      };
      Object.entries(mapping).forEach(([id, checked]) => {
        if (typeof checked === 'boolean' && byId(id)) byId(id).checked = checked;
      });
      if ([2, 3, 4].includes(Number(saved.precision))) byId('precision').value = String(saved.precision);
    } catch (_) {
      // Ignore outdated or blocked storage.
    }
  }

  function setExportMessage(result) {
    const message = byId('exportMessage');
    if (!message) return;
    if (result.warnings.length) {
      message.innerHTML = '<i data-lucide="triangle-alert"></i>' + result.warnings[0];
      message.style.color = '#9a5a22';
    } else {
      message.innerHTML = '<i data-lucide="circle-check"></i>Mã TikZ sạch và sẵn sàng sao chép.';
      message.style.color = '';
    }
    window.lucide?.createIcons();
  }

  function generateTikz(force = false) {
    if (!state.api || !window.TikzGeoGebraExporter) return;
    try {
      const xml = state.api.getXML();
      const settings = readSettings();
      const settingsSignature = JSON.stringify(settings);
      if (!force && xml === state.lastXml && settingsSignature === state.lastSettings) return;
      state.lastXml = xml;
      state.lastSettings = settingsSignature;
      state.lastResult = window.TikzGeoGebraExporter.exportTikz(xml, { api: state.api, ...settings });
      byId('codeOutput').value = state.lastResult.code;
      byId('objectCount').textContent = `${state.lastResult.count} đối tượng`;
      setExportMessage(state.lastResult);
      setLiveStatus('Đang đồng bộ');
      if (byId('previewPane') && !byId('previewPane').hidden) {
        if (force) {
          window.clearTimeout(state.previewTimer);
          renderPreview(state.lastResult.code, false);
        } else {
          schedulePreviewRender(state.lastResult.code, false);
        }
      }
    } catch (error) {
      setLiveStatus('Lỗi chuyển đổi', true);
      byId('exportMessage').textContent = `Không thể tạo TikZ: ${error.message}`;
      toast(`Không thể tạo TikZ: ${error.message}`, true);
    }
  }

  function scheduleGenerate() {
    window.clearTimeout(state.debounce);
    state.debounce = window.setTimeout(() => generateTikz(false), 180);
  }

  function schedulePreviewRender(code, notify = false) {
    window.clearTimeout(state.previewTimer);
    state.previewTimer = window.setTimeout(() => {
      renderPreview(code, notify);
    }, 700);
  }

  window.ggbTikzChanged = scheduleGenerate;
  window.generateTikz = () => generateTikz(true);

  async function copyCode() {
    const code = byId('codeOutput')?.value || '';
    if (!code) {
      toast('Chưa có mã TikZ để sao chép.', true);
      return;
    }
    try {
      await navigator.clipboard.writeText(code);
    } catch (_) {
      const output = byId('codeOutput');
      output.removeAttribute('readonly');
      output.select();
      document.execCommand('copy');
      output.setAttribute('readonly', '');
      window.getSelection()?.removeAllRanges();
    }
    const button = byId('btnCopy');
    const original = button.innerHTML;
    button.innerHTML = '<i data-lucide="check"></i>Đã sao chép';
    window.lucide?.createIcons();
    window.setTimeout(() => {
      button.innerHTML = original;
      window.lucide?.createIcons();
    }, 1800);
    toast('Đã sao chép mã TikZ vào bộ nhớ tạm.');
  }

  function switchTab(name) {
    const preview = name === 'preview';
    byId('tabCode').classList.toggle('is-active', !preview);
    byId('tabCode').setAttribute('aria-selected', String(!preview));
    byId('tabPreview').classList.toggle('is-active', preview);
    byId('tabPreview').setAttribute('aria-selected', String(preview));
    byId('codePane').classList.toggle('is-active', !preview);
    byId('codePane').hidden = preview;
    byId('previewPane').classList.toggle('is-active', preview);
    byId('previewPane').hidden = !preview;
  }

  function renderPreview(code, notify = true) {
    if (!code) {
      const empty = byId('previewEmpty');
      const frame = byId('previewFrame');
      if (empty) empty.hidden = false;
      if (frame) frame.hidden = true;
      if (notify) toast('Hãy dựng ít nhất một đối tượng trước.', true);
      return;
    }
    const frame = byId('previewFrame');
    const empty = byId('previewEmpty');
    empty.hidden = true;
    frame.hidden = false;
    const safeCode = code.replace(/<\/script/gi, '<\\/script');
    frame.srcdoc = `<!doctype html>
<html lang="vi"><head><meta charset="utf-8">
<link rel="stylesheet" href="https://tikzjax.com/v1/fonts.css">
<script>
const nativeBtoa = window.btoa;
window.btoa = value => {
  try { return nativeBtoa(value); }
  catch (_) { return nativeBtoa(unescape(encodeURIComponent(value))); }
};
</script>
<script src="https://tikzjax.com/v1/tikzjax.js"></script>
<style>
html,body{min-height:100%;margin:0}
body{display:grid;place-items:center;padding:22px;box-sizing:border-box;background:#fff;color:#10231d}
svg{max-width:100%;height:auto}
</style></head><body>
<script type="text/tikz">
${safeCode}
</script>
</body></html>`;
    if (notify) toast('Đang biên dịch bản xem trước…');
  }

  function previewCode() {
    window.clearTimeout(state.previewTimer);
    generateTikz(true);
    switchTab('preview');
    renderPreview(byId('codeOutput')?.value || '');
  }

  function resetDrawing() {
    if (!state.api) return;
    if (!window.confirm('Xóa toàn bộ hình đang dựng và bắt đầu lại?')) return;
    state.api.newConstruction();
    state.lastXml = '';
    generateTikz(true);
    toast('Đã tạo một bảng vẽ mới.');
  }

  function resizeApplet() {
    window.clearTimeout(state.resizeTimer);
    state.resizeTimer = window.setTimeout(() => {
      if (!state.api?.setSize) return;
      const size = hostSize();
      try {
        state.api.setSize(size.width, size.height);
      } catch (_) {
        // Ignore transient resize errors while the applet is mounting.
      }
    }, 100);
  }

  function bindEvents() {
    ['chkSimpleStyles', 'chkLabels', 'chkClip', 'chkAxes', 'chkGrid', 'precision'].forEach(id => {
      byId(id)?.addEventListener('change', () => {
        saveSettings();
        generateTikz(true);
      });
    });
    byId('btnCopy')?.addEventListener('click', copyCode);
    byId('btnPreview')?.addEventListener('click', previewCode);
    byId('tabCode')?.addEventListener('click', () => switchTab('code'));
    byId('tabPreview')?.addEventListener('click', previewCode);
    byId('btnReset')?.addEventListener('click', resetDrawing);
    window.addEventListener('resize', resizeApplet, { passive: true });
    if ('ResizeObserver' in window) {
      const observer = new ResizeObserver(resizeApplet);
      observer.observe(byId('ggb-element'));
    }
  }

  document.addEventListener('DOMContentLoaded', () => {
    restoreSettings();
    bindEvents();
    window.lucide?.createIcons();
    initGeoGebra();
  });
})();
