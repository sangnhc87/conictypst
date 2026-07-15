/*
 * ConicTypst global navigation
 *
 * Important: this script enhances each page's native header. It must never
 * replace that header because local search, mobile menus and page actions are
 * wired to elements inside it.
 */
(function () {
  'use strict';

  if (!window.__CONICTYPST_LICENSE__ && !document.querySelector('script[data-conic-copyright]')) {
    const copyrightGuard = document.createElement('script');
    copyrightGuard.src = 'copyright-guard.js';
    copyrightGuard.dataset.conicCopyright = 'true';
    document.head.append(copyrightGuard);
  }

  const LINKS = [
    {
      title: 'Soạn & trộn đề',
      items: [
        ['✦', 'TypstConicHub Studio', 'https://typstconichub.pages.dev/#studio'],
        ['🗃️', 'Ngân hàng câu hỏi', 'ngan-hang.html'],
        ['🔀', 'Trộn đề thi', 'tron-de.html'],
        ['✨', 'AI sinh đề', 'ai-tao-de.html?tab=gen'],
        ['🎓', 'Đề THPT nâng cao', 'ai-tao-de.html?tab=pro'],
      ],
    },
    {
      title: 'CeTZ & hình học',
      items: [
        ['✏️', 'Bảng vẽ CeTZ', 'cetz-ve.html'],
        ['📈', 'Bảng biến thiên Live', 'bbt-live.html'],
        ['📐', 'Geogebra → CeTZ', 'cetz-geogebra.html'],
        ['🧊', 'Hình học 3D', 'cetz-3d.html'],
      ],
    },
    {
      title: 'AI & kiểm tra',
      items: [
        ['📷', 'OCR ảnh → Typst', 'ocr-typst.html'],
        ['✅', 'Kiểm lỗi Typst', 'typst-linter.html'],
        ['🖥️', 'Chuyển sang Beamer', 'beamer-converter.html'],
        ['🤖', 'Trợ lý Typst AI', 'ai-tro-ly.html'],
      ],
    },
    {
      title: 'Tài liệu & hệ sinh thái',
      items: [
        ['⚡', 'Dashboard', 'dashboard.html'],
        ['📚', 'Hướng dẫn đầy đủ', 'index.html'],
        ['🌿', 'Hệ sinh thái', 'ecosystem.html'],
        ['🎯', 'Sang Math OMR', 'https://chamthi-conictypst.pages.dev/'],
        ['✦', 'Studio soạn thảo', 'https://typstconichub.pages.dev/#studio'],
        ['👤', 'Tài khoản của tôi', 'https://admin-conictypst.pages.dev/account.html'],
      ],
    },
  ];

  const css = `
    :root {
      --hub-green: #047857;
      --hub-green-dark: #065f46;
      --hub-orange: #f97316;
      --hub-ink: #0f172a;
      --hub-muted: #64748b;
      --hub-line: #dbe5e1;
    }
    .global-hub-menu,
    .global-quick-link {
      box-sizing: border-box !important;
      min-height: 38px !important;
      display: inline-flex !important;
      align-items: center !important;
      justify-content: center !important;
      gap: 7px !important;
      border-radius: 999px !important;
      padding: 0 13px !important;
      border: 1px solid #d9e4df !important;
      background: #f5faf8 !important;
      color: #334155 !important;
      font: 700 13px/1.1 Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif !important;
      text-decoration: none !important;
      white-space: nowrap !important;
      cursor: pointer !important;
      box-shadow: none !important;
      transition: transform .16s ease, border-color .16s ease, color .16s ease, background .16s ease !important;
    }
    .global-hub-menu:hover,
    .global-quick-link:hover {
      transform: translateY(-1px) !important;
      border-color: rgba(4, 120, 87, .35) !important;
      background: #ecfdf5 !important;
      color: var(--hub-green-dark) !important;
    }
    .global-quick-link.is-active {
      color: #fff !important;
      border-color: transparent !important;
      background: linear-gradient(135deg, var(--hub-green), #0d9488 72%, var(--hub-orange)) !important;
      box-shadow: 0 7px 18px -12px rgba(4, 120, 87, .9) !important;
    }
    .global-hub-menu-icon { font-size: 15px; line-height: 1; }
    .global-hub-chevron { font-size: 11px; transition: transform .18s ease; }
    .global-hub-menu[aria-expanded="true"] .global-hub-chevron { transform: rotate(180deg); }
    .global-hub-dropdown {
      position: fixed;
      z-index: 100000;
      width: min(650px, calc(100vw - 24px));
      display: none;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 18px;
      padding: 18px;
      border: 1px solid rgba(148, 163, 184, .34);
      border-radius: 18px;
      background: rgba(255, 255, 255, .98);
      color: var(--hub-ink);
      box-shadow: 0 28px 70px -30px rgba(15, 23, 42, .5), 0 12px 28px -22px rgba(4, 120, 87, .55);
      backdrop-filter: blur(18px);
      font-family: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      box-sizing: border-box;
    }
    .global-hub-dropdown.is-open { display: grid; animation: globalHubIn .16s ease-out; }
    @keyframes globalHubIn {
      from { opacity: 0; transform: translateY(-7px) scale(.985); }
      to { opacity: 1; transform: translateY(0) scale(1); }
    }
    .global-hub-group { min-width: 0; }
    .global-hub-group-title {
      margin: 0 0 7px;
      padding: 0 9px 7px;
      border-bottom: 1px dashed #dbe5e1;
      color: var(--hub-green-dark);
      font-size: 11px;
      font-weight: 850;
      letter-spacing: .075em;
      text-transform: uppercase;
    }
    .global-hub-item {
      display: grid;
      grid-template-columns: 25px minmax(0, 1fr) auto;
      align-items: center;
      gap: 8px;
      min-height: 39px;
      padding: 6px 9px;
      border-radius: 10px;
      color: #334155 !important;
      font-size: 13px;
      font-weight: 650;
      text-decoration: none !important;
      box-sizing: border-box;
    }
    .global-hub-item:hover { background: linear-gradient(90deg, #ecfdf5, #fff7ed); color: var(--hub-green-dark) !important; }
    .global-hub-item-icon { display: grid; place-items: center; width: 25px; height: 25px; border-radius: 8px; background: #f1f5f9; }
    .global-hub-item-arrow { color: #94a3b8; font-size: 14px; }
    .global-hub-item[aria-current="page"] { background: #ecfdf5; color: var(--hub-green-dark) !important; }
    .global-hub-item[aria-current="page"] .global-hub-item-arrow { color: var(--hub-orange); }
    .global-standalone {
      position: sticky;
      top: 0;
      z-index: 9999;
      min-height: 64px;
      display: flex;
      align-items: center;
      border-bottom: 1px solid rgba(148, 163, 184, .26);
      background: rgba(255, 255, 255, .94);
      backdrop-filter: blur(16px);
      box-shadow: 0 3px 18px -16px rgba(15, 23, 42, .7);
      font-family: Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    }
    .global-standalone-inner {
      width: min(1400px, calc(100% - 40px));
      margin: 0 auto;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 18px;
    }
    .global-standalone-brand { display: flex; align-items: center; gap: 10px; color: var(--hub-ink) !important; text-decoration: none !important; }
    .global-standalone-mark { width: 38px; height: 38px; display: grid; place-items: center; border-radius: 11px; color: #fff; font-weight: 850; background: linear-gradient(135deg, var(--hub-green), #0d9488 64%, var(--hub-orange)); box-shadow: 0 9px 18px -12px var(--hub-green); }
    .global-standalone-brand strong, .global-standalone-brand small { display: block; }
    .global-standalone-brand strong { font-size: 14px; }
    .global-standalone-brand small { margin-top: 2px; color: var(--hub-muted); font-size: 11px; font-weight: 650; }
    .global-standalone-actions { display: flex; align-items: center; gap: 8px; }
    .topbar-actions .global-hub-menu { order: -2; }
    .dash-nav .global-hub-menu { margin-right: 2px; }
    @media (max-width: 900px) {
      .topbar-actions .global-quick-link { display: none !important; }
      .global-hub-dropdown { grid-template-columns: 1fr; max-height: calc(100vh - 78px); overflow-y: auto; gap: 13px; padding: 14px; }
      .global-standalone-inner { width: min(100% - 24px, 1400px); }
    }
    @media (max-width: 600px) {
      .topbar-actions .btn-dashboard,
      .topbar-actions .btn-download { display: none !important; }
      .topbar-actions { margin-left: auto; }
      .global-hub-menu { width: 40px !important; min-width: 40px !important; padding: 0 !important; }
      .global-hub-menu-label, .global-hub-chevron { display: none; }
      .global-standalone-actions .global-quick-link { display: none !important; }
      .global-standalone-brand small { display: none; }
    }
    @media (max-width: 720px) {
      /* Shared safety net for the older tool pages. The technical table/canvas
         may scroll inside its own panel, but it must not widen the whole page. */
      .tool-page {
        width: 100% !important;
        max-width: 100% !important;
        padding: 20px 14px !important;
        box-sizing: border-box !important;
      }
      .tool-layout,
      .tool-layout > *,
      .panel,
      .panel-body,
      .panel-head {
        min-width: 0 !important;
        max-width: 100% !important;
        box-sizing: border-box !important;
      }
      .panel-head,
      .panel-title,
      .config-group {
        flex-wrap: wrap !important;
      }
      .config-group {
        width: 100% !important;
        min-width: 0 !important;
      }
      .form-input-key {
        width: 100% !important;
        max-width: 100% !important;
        min-width: 0 !important;
        flex: 1 1 210px !important;
      }
      .generator-layout {
        width: 100% !important;
        max-width: 100% !important;
        height: auto !important;
        min-height: calc(100vh - 64px) !important;
        padding: 12px !important;
        flex-direction: column !important;
        overflow-x: hidden !important;
        overflow-y: auto !important;
        box-sizing: border-box !important;
      }
      .generator-layout > .panel-left,
      .generator-layout > .panel-right {
        width: 100% !important;
        max-width: 100% !important;
        min-width: 0 !important;
        flex: 0 0 auto !important;
        box-sizing: border-box !important;
      }
      .generator-layout > .panel-left { min-height: 500px !important; }
      .generator-layout > .panel-right { min-height: 410px !important; }
      .grid-2,
      .grid-3 {
        grid-template-columns: minmax(0, 1fr) !important;
      }
    }
  `;

  function fileName(url) {
    const path = new URL(url, window.location.href).pathname;
    return path.split('/').filter(Boolean).pop() || 'index.html';
  }

  function isCurrent(href) {
    if (/^https?:/i.test(href)) return false;
    const current = fileName(window.location.href).replace(/\.html$/, '');
    const target = fileName(href).replace(/\.html$/, '');
    return current === target;
  }

  function quickLink(label, href, icon) {
    const link = document.createElement('a');
    link.className = `global-quick-link${isCurrent(href) ? ' is-active' : ''}`;
    link.href = href;
    link.innerHTML = `<span aria-hidden="true">${icon}</span><span>${label}</span>`;
    if (isCurrent(href)) link.setAttribute('aria-current', 'page');
    if (/^https?:/i.test(href)) {
      link.target = '_blank';
      link.rel = 'noopener';
    }
    return link;
  }

  function menuButton() {
    const button = document.createElement('button');
    button.type = 'button';
    button.className = 'global-hub-menu';
    button.setAttribute('aria-label', 'Mở menu công cụ ConicTypst');
    button.setAttribute('aria-haspopup', 'true');
    button.setAttribute('aria-expanded', 'false');
    button.innerHTML = '<span class="global-hub-menu-icon" aria-hidden="true">▦</span><span class="global-hub-menu-label">Công cụ</span><span class="global-hub-chevron" aria-hidden="true">⌄</span>';
    return button;
  }

  function buildDropdown() {
    const dropdown = document.createElement('nav');
    dropdown.className = 'global-hub-dropdown';
    dropdown.setAttribute('aria-label', 'Menu toàn bộ công cụ ConicTypst');
    dropdown.innerHTML = LINKS.map(group => `
      <section class="global-hub-group">
        <h2 class="global-hub-group-title">${group.title}</h2>
        ${group.items.map(([icon, label, href]) => `
          <a class="global-hub-item" href="${href}"${isCurrent(href) ? ' aria-current="page"' : ''}${/^https?:/i.test(href) ? ' target="_blank" rel="noopener"' : ''}>
            <span class="global-hub-item-icon" aria-hidden="true">${icon}</span>
            <span>${label}</span>
            <span class="global-hub-item-arrow" aria-hidden="true">›</span>
          </a>
        `).join('')}
      </section>
    `).join('');
    return dropdown;
  }

  function positionDropdown(button, dropdown) {
    const rect = button.getBoundingClientRect();
    const width = Math.min(650, window.innerWidth - 24);
    const left = Math.max(12, Math.min(rect.left, window.innerWidth - width - 12));
    dropdown.style.left = `${left}px`;
    dropdown.style.top = `${Math.min(rect.bottom + 9, window.innerHeight - 80)}px`;
  }

  function makeStandalone(button) {
    const header = document.createElement('header');
    header.className = 'global-standalone';
    header.innerHTML = `
      <div class="global-standalone-inner">
        <a class="global-standalone-brand" href="dashboard.html">
          <span class="global-standalone-mark">C</span>
          <span><strong>ConicTypst</strong><small>Hệ sinh thái công cụ Toán</small></span>
        </a>
        <div class="global-standalone-actions"></div>
      </div>`;
    const actions = header.querySelector('.global-standalone-actions');
    actions.append(
      button,
      quickLink('Studio', 'https://typstconichub.pages.dev/#studio', '✦'),
      quickLink('Dashboard', 'dashboard.html', '⚡'),
      quickLink('Hướng dẫn', 'index.html', '📚'),
      quickLink('Hệ sinh thái', 'ecosystem.html', '🌿'),
      quickLink('Tài khoản', 'https://admin-conictypst.pages.dev/account.html', '👤'),
    );
    document.body.prepend(header);
  }

  document.addEventListener('DOMContentLoaded', function () {
    if (document.documentElement.dataset.globalNavReady === 'true') return;
    document.documentElement.dataset.globalNavReady = 'true';

    const style = document.createElement('style');
    style.dataset.globalHubStyle = 'true';
    style.textContent = css;
    document.head.append(style);

    const button = menuButton();
    const dropdown = buildDropdown();
    document.body.append(dropdown);

    const header = document.querySelector('header.dash-topbar, header.topbar, header.sticky, header.bg-white, header.header, #topbar');
    if (!header) {
      makeStandalone(button);
    } else {
      header.classList.add('has-global-hub');
      const actions = header.querySelector('.topbar-actions, .dash-nav, nav');
      if (actions) {
        actions.prepend(button);
        if (!actions.querySelector('a[href="ecosystem.html"], a[href="ecosystem"]')) {
          actions.append(quickLink('Hệ sinh thái', 'ecosystem.html', '🌿'));
        }
        if (!actions.querySelector('a[href="https://typstconichub.pages.dev/#studio"]')) {
          actions.append(quickLink('Studio', 'https://typstconichub.pages.dev/#studio', '✦'));
        }
        if (!actions.querySelector('a[href="https://admin-conictypst.pages.dev/account.html"]')) {
          actions.append(quickLink('Tài khoản', 'https://admin-conictypst.pages.dev/account.html', '👤'));
        }
      } else {
        const controls = document.createElement('div');
        controls.className = 'global-standalone-actions';
        controls.append(
          button,
          quickLink('Studio', 'https://typstconichub.pages.dev/#studio', '✦'),
          quickLink('Hệ sinh thái', 'ecosystem.html', '🌿'),
          quickLink('Tài khoản', 'https://admin-conictypst.pages.dev/account.html', '👤'),
        );
        (header.firstElementChild || header).append(controls);
      }
    }

    function closeMenu() {
      dropdown.classList.remove('is-open');
      button.setAttribute('aria-expanded', 'false');
    }

    button.addEventListener('click', function (event) {
      event.stopPropagation();
      const open = !dropdown.classList.contains('is-open');
      if (!open) return closeMenu();
      positionDropdown(button, dropdown);
      dropdown.classList.add('is-open');
      button.setAttribute('aria-expanded', 'true');
    });
    dropdown.addEventListener('click', event => event.stopPropagation());
    document.addEventListener('click', closeMenu);
    document.addEventListener('keydown', event => {
      if (event.key === 'Escape') {
        closeMenu();
        button.focus();
      }
    });
    window.addEventListener('resize', () => {
      if (dropdown.classList.contains('is-open')) positionDropdown(button, dropdown);
    });
    window.addEventListener('scroll', () => {
      if (dropdown.classList.contains('is-open')) positionDropdown(button, dropdown);
    }, { passive: true });
  });
})();
