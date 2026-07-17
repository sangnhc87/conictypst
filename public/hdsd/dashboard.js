const greetingText = document.getElementById('greetingText')
const searchInput = document.getElementById('dashboardSearch')
const resultCount = document.getElementById('resultCount')
const quickActionsGrid = document.getElementById('quickActionsGrid')
const exploreGrid = document.getElementById('exploreGrid')
const allToolsGrid = document.getElementById('allToolsGrid')
const adminGrid = document.getElementById('adminGrid')

const quickActions = [
  { title: 'AI sang-math có kiểm định', desc: 'Chọn model, nhập API key, sinh file .typ đúng hợp đồng 1.0.1', icon: 'sparkles', color: 'green', href: 'ai-sang-math.html', keywords: 'ai sang math tạo đề api key model validator tự sửa typst' },
  { title: 'TypstConicHub Studio', desc: 'Soạn Typst, preview trực tiếp, tự lưu và xuất PDF ngay trên trình duyệt', icon: 'sparkles', color: 'green', href: 'https://typstconichub.pages.dev/#studio', keywords: 'studio soạn thảo typst live preview wasm sang math' },
  { title: 'AI tạo đề theo API key của bạn', desc: 'Tự chọn model, tự nhập key, mở cho mọi người dùng', icon: 'zap', color: 'cyan', href: 'ai-tao-de.html?tab=gen', keywords: 'ai tạo đề api key typst model' },
  { title: 'AI tạo đề thi tốt nghiệp hay-lạ-khó', desc: 'Quản lý tạo đề bằng AI Pro', icon: 'cpu', color: 'violet', href: 'ai-tao-de.html?tab=pro', keywords: 'ai tạo đề thi tốt nghiệp hay lạ khó thpt' },
  { title: 'Ngân hàng câu hỏi', desc: 'Quản lý, soạn đề, lọc ID/tags/source', icon: 'layout-grid', color: 'blue', href: 'ngan-hang.html', keywords: 'ngân hàng câu hỏi bank id quản lý typst' },
  { title: 'Siêu tạo đề', desc: 'AI tự động sinh đề theo ma trận', icon: 'zap', color: 'magenta', href: 'ai-tao-de.html?tab=gen', keywords: 'siêu tạo đề sinh đề tự động matrix' },
  { title: 'Typst → Word/PDF', desc: 'Xuất PDF, chuẩn hóa nội dung, lộ trình DOCX', icon: 'file-text', color: 'teal', href: 'index.html#downloads', keywords: 'typst word pdf docx export' },
  { title: 'Trộn đề từ nhiều file', desc: 'Xáo trộn nguyên bản, nhiều mã đề .typ', icon: 'shuffle', color: 'orange', href: 'tron-de.html', keywords: 'trộn đề từ nhiều file randomizer seed typst' },
  { title: 'Kiểm lỗi Typst', desc: 'Tìm lỗi #tn/#ds/#tln, LaTeX sót, cetz', icon: 'circle-check', color: 'red', href: 'typst-linter.html', keywords: 'kiểm lỗi typst linter compile macro' },
  { title: 'OCR → Typst', desc: 'Ảnh/PDF → #tn/#ds/#tln (Groq/Gemini)', icon: 'camera', color: 'amber', href: 'ocr-typst.html', keywords: 'ocr nhanh ảnh pdf typst groq gemini' },
  { title: 'Trộn đề Pro', desc: 'Trộn đề chi tiết, cấu trúc + phương án', icon: 'pen-line', color: 'purple', href: 'tron-de.html', keywords: 'trộn đề pro chi tiết 22 slot typst' },
]

const exploreSections = [
  { title: 'Bài toán nâng cao', desc: 'Tổ hợp, xác suất, hình học nâng cao', icon: 'book-open', color: 'green', href: 'index.html#book-overview', keywords: 'bài toán nâng cao tổ hợp xác suất hình học' },
  { title: 'Toán thực tế', desc: 'Bài toán thực tiễn đời sống & ứng dụng', icon: 'globe-2', color: 'sky', href: 'index.html#geo-3d', keywords: 'toán thực tế ứng dụng đời sống' },
  { title: 'Toán thực tế V2', desc: '12+ chủ đề ứng dụng thực tiễn', icon: 'box', color: 'rose', href: 'index.html#book-overview', keywords: 'toán thực tế v2 chủ đề ứng dụng' },
  { title: 'PDF từ ảnh', desc: 'Trích xuất nội dung từ PDF & hình ảnh', icon: 'image', color: 'purple', href: 'ai-tao-de.html?tab=grade', keywords: 'pdf từ ảnh trích xuất ocr typst' },
  { title: 'Giải toán phổ thông', desc: 'Công cụ tính toán K10-K12', icon: 'calculator', color: 'green', href: 'ai-tao-de.html?tab=gen', keywords: 'giải toán phổ thông k10 k11 k12' },
  { title: 'Sân chơi trí tuệ', desc: '30+ game luyện tư duy toán học', icon: 'play', color: 'orange', href: '#all-tools', keywords: 'sân chơi trí tuệ game luyện tư duy' },
]

const tools = [
  { title: 'AI sang-math 1.0.1', desc: 'Sinh đề bằng Gemini/GPT/Claude qua API key riêng, kiểm định và tự sửa', icon: 'sparkles', color: 'green', href: 'ai-sang-math.html', status: 'Mới ✓', keywords: 'ai sang math contract validator model api key đề thi typst' },
  { title: 'Sang Math Studio', desc: 'IDE Typst tích hợp preview, dự án và xuất bản', icon: 'sparkles', color: 'green', href: 'https://typstconichub.pages.dev/#studio', status: 'Live ✓', keywords: 'studio typst editor preview wasm project' },
  { title: 'Hỗ trợ vẽ CeTZ', desc: 'Từ TikZ sang hình Typst-native', icon: 'wrench', color: 'mint', href: 'cetz-ve.html', status: 'Live ✓', keywords: 'hỗ trợ vẽ tikz cetz geometry typst drawing' },
  { title: 'Sơ đồ cây', desc: 'Mẫu xác suất, Bayes, nhánh sự kiện', icon: 'git-branch', color: 'blue', href: 'index.html#figure-gallery', status: 'Mẫu', keywords: 'sơ đồ cây tree diagram xác suất bayes cetz' },
  { title: 'Bảng biến thiên', desc: 'Live BBT nhập là sinh #bbtv2() ngay', icon: 'layout-grid', color: 'violet', href: 'bbt-live.html', status: 'Live ✓', keywords: 'bbt bbtv2 bảng biến thiên live typst cetz' },
  { title: 'Thư viện CeTZ', desc: 'Kho hình thay thế thư viện TikZ', icon: 'archive', color: 'purple', href: 'index.html#figure-gallery', status: 'Đã có', keywords: 'thư viện tikz cetz kho hình mẫu gallery' },
  { title: 'Cộng đồng Typst', desc: 'Quy ước đóng góp ID và mẫu', icon: 'users', color: 'pink', href: 'index.html#ids-bank', status: 'Mở', keywords: 'cộng đồng typst đóng góp bank id' },
  { title: 'Soạn bảng', desc: 'Bảng dữ liệu, bảng đáp án, matrix', icon: 'table-2', color: 'amber', href: 'index.html#typst-params', status: 'Đã có', keywords: 'soạn bảng table typst matrix đáp án' },
  { title: 'Miền nghiệm BPT', desc: 'Quy hoạch tuyến tính bằng CeTZ', icon: 'bar-chart-3', color: 'orange', href: 'index.html#graphs', status: 'Mẫu', keywords: 'miền nghiệm bpt bất phương trình quy hoạch tuyến tính' },
  { title: 'Tô miền', desc: 'Shade vùng, giao miền, hình phẳng', icon: 'pen-line', color: 'sky', href: 'index.html#geo-2d', status: 'Mẫu', keywords: 'tô miền shade miền nghiệm cetz' },
  { title: 'Vẽ & sinh code CeTZ', desc: 'Mẫu lệnh cho đồ thị và hình học', icon: 'image', color: 'cyan', href: 'cetz-ve.html', status: 'Live ✓', keywords: 'sinh code cetz vẽ hình typst' },
  { title: 'Tròn xoay', desc: 'Thể tích, mặt cắt, hình minh họa', icon: 'box', color: 'rose', href: 'index.html#geo-3d', status: 'Mẫu', keywords: 'tròn xoay thể tích hình không gian tích phân' },
  { title: 'AI tạo bài tương tự', desc: 'Sinh bài tập mới từ bài toán mẫu', icon: 'cpu', color: 'violet', href: 'ai-tuong-tu.html', status: 'Live ✓', keywords: 'ai tạo bài tương tự sinh câu hỏi gemini' },
  { title: 'Sinh hàng loạt', desc: 'Import bank, mix nhiều mã đề', icon: 'layers', color: 'blue', href: 'index.html#exam-mix-typst', status: 'Đã có', keywords: 'sinh hàng loạt batch bank import mix đề' },
  { title: 'Kiểm lỗi Typst', desc: 'Rà lỗi #tn/#ds/#tln, LaTeX sót, cetz', icon: 'badge-check', color: 'red', href: 'typst-linter.html', status: 'Live ✓', keywords: 'linter typst lỗi compile tham số macro kiểm tra' },
  { title: 'Beamer Converter', desc: 'Chuyển đề thi sang Slide Beamer', icon: 'presentation', color: 'indigo', href: 'beamer-converter.html', status: 'Live ✓', keywords: 'beamer converter slide typst touying trình chiếu' },
  { title: 'OCR → Typst', desc: 'Ảnh/PDF → #tn/#ds/#tln an toàn', icon: 'camera', color: 'orange', href: 'ocr-typst.html', status: 'Live ✓', keywords: 'ocr ảnh pdf typst latex nhận dạng groq gemini' },
  { title: 'AI Typst Assistant', desc: 'Trợ lý lập trình CeTZ, sửa lỗi, định dạng trắc nghiệm', icon: 'bot', color: 'green', href: 'ai-tro-ly.html', status: 'Live ✓', keywords: 'ai typst assistant macro cetz solve' },
  { title: 'QR đáp án', desc: 'Gắn mã tra đáp án theo mã đề', icon: 'share-2', color: 'pink', href: 'index.html#exam-mix-typst', status: 'Ý tưởng', keywords: 'qr đáp án mã đề answer key' },
  { title: 'Biểu đồ cột CeTZ', desc: 'Chart nhẹ cho đề và sách', icon: 'bar-chart', color: 'cyan', href: 'index.html#graphs', status: 'Mẫu', keywords: 'biểu đồ cột chart cetz' },
  { title: 'Kế hoạch bài giảng', desc: 'Template giáo án và chuyên đề', icon: 'calendar-days', color: 'amber', href: 'index.html#book-overview', status: 'Đã có', keywords: 'kế hoạch bài giảng giáo án book' },
  { title: 'Bài giảng THPT', desc: 'Kho bài học K10-K12', icon: 'book-open', color: 'purple', href: 'index.html#book-structure', status: 'Đã có', keywords: 'bài giảng thpt sách chuyên đề' },
  { title: 'Lớp học trực tuyến', desc: 'Xuất bản PDF/slide cho lớp học', icon: 'video', color: 'red', href: 'index.html#exam-set', status: 'Ý tưởng', keywords: 'lớp học trực tuyến slide pdf' },
  { title: 'Kho siêu tốc', desc: 'Tra cứu nhanh ID, tags, source', icon: 'zap', color: 'sky', href: 'index.html#ids-bank', status: 'Đã có', keywords: 'kho siêu tốc bank search id' },
  { title: 'Kho Main Text', desc: 'Văn bản gốc, lý thuyết, template', icon: 'database', color: 'slate', href: 'index.html#book-overview', status: 'Đã có', keywords: 'main text lý thuyết template' },
]

const adminTools = [
  { title: 'AI tạo đề thi THPT', icon: 'graduation-cap', href: 'ai-tao-de.html?tab=pro', active: true, keywords: 'ai tạo đề thi tốt nghiệp thpt' },
  { title: 'Typst Bank Bridge', icon: 'brain', href: 'ngan-hang.html', active: true, keywords: 'deepseek bridge typst bank import' },
  { title: 'Magic Chương', icon: 'sprout', href: 'index.html#book-structure', active: false, keywords: 'magic chương lesson chapter' },
  { title: 'Kho đề gốc .typ', icon: 'folder', href: 'index.html#exam-set', active: false, keywords: 'kho đề gốc typ' },
  { title: 'Tách câu từ .tex', icon: 'inbox', href: 'index.html#exam-mix-typst', active: false, keywords: 'tách câu tex import latex' },
  { title: 'Typst Bank Studio', icon: 'puzzle', href: 'ngan-hang.html', active: true, keywords: 'tex bank studio typst bank manager' },
  { title: 'Duyệt Exam Plus', icon: 'check-square', href: 'index.html#exam-mix-typst', active: false, keywords: 'duyệt exam plus review ready' },
  { title: 'Duyệt Plus Demo', icon: 'megaphone', href: 'index.html#exam-mix-typst', active: false, keywords: 'duyệt plus demo' },
  { title: 'Grade 10/11', icon: 'triangle', href: 'index.html#book-structure', active: false, keywords: 'grade 10 11 ngân hàng' },
  { title: 'Bank Manager', icon: 'landmark', href: 'ngan-hang.html', active: true, keywords: 'bank manager quản lý ngân hàng' },
  { title: 'SuperAdmin', icon: 'settings-2', href: '#admin-panel', active: false, keywords: 'superadmin admin panel' },
  { title: 'Trang quản trị', icon: 'shield', href: '#admin-panel', active: false, keywords: 'trang quản trị admin' },
  { title: 'QL người dùng', icon: 'users', href: '#admin-panel', active: false, keywords: 'quản lý người dùng' },
  { title: 'Lý thuyết', icon: 'book-open', href: 'index.html#book-overview', active: false, keywords: 'lý thuyết main text' },
  { title: 'Kho phần mềm', icon: 'save', href: 'index.html#downloads', active: false, keywords: 'kho phần mềm download' },
  { title: 'BST HSG', icon: 'trophy', href: 'index.html#exam-set', active: false, keywords: 'hsg học sinh giỏi' },
  { title: 'CeTZ Plot', icon: 'line-chart', href: 'index.html#graphs', active: true, keywords: 'cetz plot đồ thị' },
  { title: 'CeTZ Euclide', icon: 'drafting-compass', href: 'cetz-ve.html', active: true, keywords: 'cetz euclide hình phẳng' },
  { title: 'TikZ -> CeTZ Euclide', icon: 'ruler', href: 'cetz-ve.html', active: true, keywords: 'tikz euclide cetz chuyển đổi' },
]

function createIcon(name) {
  return `<i data-lucide="${name}"></i>`
}

function renderTools() {
  if (!quickActionsGrid || !exploreGrid || !allToolsGrid || !adminGrid) return

  quickActionsGrid.innerHTML = quickActions.map(action => `
    <a class="quick-card ${action.color}" href="${action.href}" data-search="${action.keywords} ${action.title} ${action.desc}">
      ${createIcon(action.icon)}
      <span>
        <strong>${action.title}</strong>
        <small>${action.desc}</small>
      </span>
    </a>
  `).join('')

  exploreGrid.innerHTML = exploreSections.map(section => `
    <a class="explore-card ${section.color}" href="${section.href}" data-search="${section.keywords} ${section.title} ${section.desc}">
      ${createIcon(section.icon)}
      <strong>${section.title}</strong>
      <small>${section.desc}</small>
    </a>
  `).join('')

  allToolsGrid.innerHTML = tools.map(tool => {
    const isLive = tool.status && (tool.status.includes('Live') || tool.status.includes('✓'))
    const badgeStyle = isLive ? 'background:#d1fae5;color:#065f46;' : ''
    return `
    <a class="tool-card ${tool.color}" href="${tool.href}" data-search="${tool.keywords} ${tool.title} ${tool.desc}">
      <span class="tool-icon">${createIcon(tool.icon)}</span>
      <span class="tool-body">
        <strong>${tool.title}</strong>
        <small>${tool.desc}</small>
      </span>
      <em style="${badgeStyle}">${tool.status}</em>
    </a>
  `}).join('')

  adminGrid.innerHTML = adminTools.map(tool => `
    <a class="admin-card${tool.active ? ' active' : ''}" href="${tool.href}" data-search="${tool.keywords} ${tool.title}">
      ${createIcon(tool.icon)}
      <strong>${tool.title}</strong>
    </a>
  `).join('')
}

function allSearchableCards() {
  return Array.from(document.querySelectorAll('[data-search]'))
}

function setGreeting() {
  if (!greetingText) return
  const hour = new Date().getHours()
  const label = hour < 11 ? 'Chào buổi sáng' : hour < 18 ? 'Chào buổi chiều' : 'Chào buổi tối'
  greetingText.textContent = label
}

function normalize(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
}

function filterCards() {
  const cards = allSearchableCards()
  const query = normalize(searchInput?.value)
  let visible = 0

  for (const card of cards) {
    const haystack = normalize(`${card.textContent} ${card.dataset.search}`)
    const keep = !query || haystack.includes(query)
    card.classList.toggle('is-hidden', !keep)
    if (keep) visible += 1
  }

  if (resultCount) {
    const total = quickActions.length + exploreSections.length + tools.length + adminTools.length
    resultCount.textContent = query ? `${visible} kết quả` : `${total} mục: ${quickActions.length} nhanh + ${exploreSections.length} khám phá + ${tools.length} công cụ + ${adminTools.length} admin`
  }
}

async function copyCommand(button) {
  const command = button.dataset.copy
  if (!command) return

  try {
    await navigator.clipboard.writeText(command)
    const old = button.innerHTML
    button.innerHTML = '<i data-lucide="check"></i><code>Đã copy lệnh</code>'
    window.lucide?.createIcons()
    window.setTimeout(() => {
      button.innerHTML = old
      window.lucide?.createIcons()
    }, 1300)
  } catch {
    button.querySelector('code').textContent = command
  }
}

document.addEventListener('DOMContentLoaded', () => {
  renderTools()
  setGreeting()
  filterCards()
  window.lucide?.createIcons()

  searchInput?.addEventListener('input', filterCards)

  document.addEventListener('keydown', event => {
    if (event.key === '/' && document.activeElement !== searchInput) {
      event.preventDefault()
      searchInput?.focus()
    }
  })

  for (const button of document.querySelectorAll('[data-copy]')) {
    button.addEventListener('click', () => copyCommand(button))
  }
})
