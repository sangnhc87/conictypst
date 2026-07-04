document.addEventListener('DOMContentLoaded', () => {
  // 1. Inject Styles dynamically to avoid breaking existing CSS files
  const style = document.createElement('style');
  style.textContent = `
    .unified-topbar {
      position: sticky;
      top: 0;
      z-index: 9999;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid rgba(226, 232, 240, 0.9);
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      box-shadow: 0 1px 3px rgba(15, 23, 42, 0.05);
      width: 100% !important;
      left: 0 !important;
      right: 0 !important;
      margin: 0 !important;
      padding: 0 !important;
      height: 60px !important;
      box-sizing: border-box;
    }
    .unified-topbar-inner {
      max-width: 1400px;
      height: 100%;
      margin: 0 auto;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 24px;
      box-sizing: border-box;
    }
    .unified-brand {
      display: flex;
      align-items: center;
      gap: 10px;
      text-decoration: none;
      color: #0f172a;
    }
    .unified-brand-mark {
      width: 36px;
      height: 36px;
      border-radius: 8px;
      background: linear-gradient(135deg, #0ea5e9, #7c3aed);
      color: #fff;
      display: grid;
      place-items: center;
      font-weight: 800;
      font-size: 1.1rem;
      box-shadow: 0 4px 10px rgba(14, 165, 233, 0.2);
    }
    .unified-brand-text strong {
      display: block;
      font-size: 0.95rem;
      line-height: 1.2;
      font-weight: 700;
    }
    .unified-brand-text small {
      display: block;
      font-size: 0.72rem;
      color: #64748b;
      font-weight: 600;
    }
    .unified-nav-left {
      display: flex;
      align-items: center;
      gap: 16px;
      position: relative;
    }
    .unified-menu-toggle {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 6px 14px;
      background: #f1f5f9;
      color: #334155;
      border: 1px solid #e2e8f0;
      border-radius: 999px;
      font-size: 0.82rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.15s;
    }
    .unified-menu-toggle:hover {
      background: #e2e8f0;
      color: #0f172a;
    }
    .unified-nav-right {
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .unified-nav-link {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 6px 16px;
      border-radius: 999px;
      text-decoration: none;
      font-size: 0.85rem;
      font-weight: 600;
      color: #475569;
      transition: all 0.15s;
    }
    .unified-nav-link:hover {
      background: #f1f5f9;
      color: #0f172a;
    }
    .unified-nav-link.active {
      background: #e0f2fe;
      color: #0369a1;
    }
    .unified-menu-dropdown {
      position: absolute;
      top: 48px;
      left: 100px;
      width: 520px;
      background: #ffffff;
      border: 1px solid #e2e8f0;
      border-radius: 12px;
      box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.15), 0 10px 10px -5px rgba(0, 0, 0, 0.05);
      padding: 20px;
      display: none;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      z-index: 10000;
      box-sizing: border-box;
      animation: slideDownMenu 0.18s cubic-bezier(0.16, 1, 0.3, 1);
    }
    @keyframes slideDownMenu {
      from { transform: translateY(-10px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }
    .unified-dropdown-group {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }
    .unified-dropdown-group-title {
      font-size: 0.72rem;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      color: #64748b;
      margin-bottom: 8px;
      padding-bottom: 4px;
      border-bottom: 1px dashed #e2e8f0;
    }
    .unified-dropdown-item {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 8px 12px;
      color: #334155;
      text-decoration: none;
      font-size: 0.85rem;
      font-weight: 500;
      border-radius: 6px;
      transition: all 0.15s;
      box-sizing: border-box;
    }
    .unified-dropdown-item:hover {
      background: #f1f5f9;
      color: #0f172a;
    }
    .unified-dropdown-item i, .unified-dropdown-item svg {
      width: 15px;
      height: 15px;
      color: #0ea5e9;
      flex-shrink: 0;
    }
    @media (max-width: 768px) {
      .unified-menu-dropdown {
        position: fixed;
        top: 60px;
        left: 12px;
        right: 12px;
        width: auto;
        grid-template-columns: 1fr;
        max-height: calc(100vh - 80px);
        overflow-y: auto;
      }
      .unified-brand-text small {
        display: none;
      }
    }
  `;
  document.head.appendChild(style);

  // 2. Find and Replace the page's existing header
  const findHeader = () => {
    return document.querySelector('header.dash-topbar, header.topbar, header.sticky, header.bg-white, header.header, #topbar');
  };

  const oldHeader = findHeader();
  if (!oldHeader) return;

  const currentPath = window.location.pathname.split('/').pop() || 'index.html';
  const isDashboard = currentPath.startsWith('dashboard');
  const isHDSD = currentPath.startsWith('index');

  const newHeader = document.createElement('header');
  newHeader.className = 'unified-topbar';
  newHeader.innerHTML = `
    <div class="unified-topbar-inner">
      <div class="unified-nav-left">
        <a class="unified-brand" href="dashboard.html">
          <span class="unified-brand-mark">C</span>
          <span class="unified-brand-text">
            <strong>ConicTypst</strong>
            <small>Typst tool hub</small>
          </span>
        </a>
        <button class="unified-menu-toggle" id="globalMenuBtn">
          <i data-lucide="layout-grid"></i> Menu công cụ <i data-lucide="chevron-down"></i>
        </button>
        <div class="unified-menu-dropdown" id="globalMenuDropdown">
          <div class="unified-dropdown-group">
            <div class="unified-dropdown-group-title">Soạn & Trộn đề</div>
            <a class="unified-dropdown-item" href="ngan-hang.html"><i data-lucide="database"></i> Ngân hàng câu hỏi</a>
            <a class="unified-dropdown-item" href="tron-de.html"><i data-lucide="shuffle"></i> Trộn đề thi</a>
            <a class="unified-dropdown-item" href="ai-tao-de.html?tab=gen"><i data-lucide="sparkles"></i> AI Sinh đề tự chọn</a>
            <a class="unified-dropdown-item" href="ai-tao-de.html?tab=pro"><i data-lucide="award"></i> VDC tốt nghiệp THPT</a>
          </div>
          <div class="unified-dropdown-group">
            <div class="unified-dropdown-group-title">CeTZ & Vẽ hình</div>
            <a class="unified-dropdown-item" href="cetz-ve.html"><i data-lucide="wrench"></i> Bảng vẽ CeTZ</a>
            <a class="unified-dropdown-item" href="bbt-live.html"><i data-lucide="grid-3x3"></i> Bảng biến thiên Live</a>
            <a class="unified-dropdown-item" href="index.html#graphs"><i data-lucide="line-chart"></i> Đồ thị & BPT</a>
          </div>
          <div class="unified-dropdown-group">
            <div class="unified-dropdown-group-title">AI Trợ lý</div>
            <a class="unified-dropdown-item" href="ocr-typst.html"><i data-lucide="camera"></i> OCR -> Typst</a>
            <a class="unified-dropdown-item" href="typst-linter.html"><i data-lucide="badge-check"></i> Kiểm lỗi Typst</a>
            <a class="unified-dropdown-item" href="beamer-converter.html"><i data-lucide="presentation"></i> Beamer slide</a>
          </div>
          <div class="unified-dropdown-group">
            <div class="unified-dropdown-group-title">Khác & Tài liệu</div>
            <a class="unified-dropdown-item" href="ai-tro-ly.html"><i data-lucide="bot"></i> Trợ lý Typst AI</a>
            <a class="unified-dropdown-item" href="ai-tuong-tu.html"><i data-lucide="cpu"></i> Sinh bài tương tự</a>
            <a class="unified-dropdown-item" href="index.html"><i data-lucide="book-open"></i> Hướng dẫn (Intro)</a>
          </div>
        </div>
      </div>

      <div class="unified-nav-right">
        <a href="dashboard.html" class="unified-nav-link ${isDashboard ? 'active' : ''}"><i data-lucide="zap"></i> Dashboard</a>
        <a href="index.html" class="unified-nav-link ${isHDSD ? 'active' : ''}"><i data-lucide="book-open"></i> Hướng dẫn</a>
      </div>
    </div>
  `;

  oldHeader.parentNode.replaceChild(newHeader, oldHeader);

  // 3. Dropdown Toggle Logic
  const menuBtn = document.getElementById('globalMenuBtn');
  const dropdown = document.getElementById('globalMenuDropdown');
  
  if (menuBtn && dropdown) {
    menuBtn.addEventListener('click', (e) => {
      e.stopPropagation();
      const isVisible = dropdown.style.display === 'grid';
      dropdown.style.display = isVisible ? 'none' : 'grid';
      const toggleIcon = menuBtn.querySelector('i:last-child');
      if (toggleIcon) {
        toggleIcon.setAttribute('data-lucide', isVisible ? 'chevron-down' : 'chevron-up');
      }
      window.lucide?.createIcons();
    });

    document.addEventListener('click', () => {
      dropdown.style.display = 'none';
      const toggleIcon = menuBtn.querySelector('i:last-child');
      if (toggleIcon) {
        toggleIcon.setAttribute('data-lucide', 'chevron-down');
      }
      window.lucide?.createIcons();
    });

    dropdown.addEventListener('click', (e) => {
      e.stopPropagation();
    });
  }

  // Re-run lucide icons for the newly injected header
  window.lucide?.createIcons();
});
