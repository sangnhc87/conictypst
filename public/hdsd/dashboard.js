const greetingText = document.getElementById('greetingText')
const searchInput = document.getElementById('dashboardSearch')
const resultCount = document.getElementById('resultCount')
const quickActionsGrid = document.getElementById('quickActionsGrid')
const exploreGrid = document.getElementById('exploreGrid')
const allToolsGrid = document.getElementById('allToolsGrid')
const adminGrid = document.getElementById('adminGrid')

const quickActions = [
  { title: 'AI sang-math có kiểm định', desc: 'Chọn model, nhập API key, sinh file .typ đúng chuẩn sang-math:1.0.5', icon: 'sparkles', color: 'green', href: 'ai-sang-math.html', keywords: 'ai sang math tạo đề api key model validator tự sửa typst 1.0.5' },
  { title: 'TypstConicHub Studio', desc: 'Soạn Typst, preview trực tiếp, tự lưu và xuất PDF ngay trên trình duyệt', icon: 'sparkles', color: 'green', href: 'https://typstconichub.pages.dev/#studio', keywords: 'studio soạn thảo typst live preview wasm sang math' },
  { title: 'Kho Mẫu Đề & Chuyên Đề', desc: '18 theme đề thi, 12 theme sách và 30 theme beamer', icon: 'layers', color: 'purple', href: 'exam-templates.html', keywords: 'kho mẫu template đề thi sách chuyên đề beamer' },
  { title: 'Live BBT & BXD', desc: 'Nhập bảng biến thiên trực quan sinh #bbtv2() ngay', icon: 'layout-grid', color: 'teal', href: 'bbt-live.html', keywords: 'live bbt bbtv2 bảng biến thiên typst' },
  { title: 'Live Geometry 2D/3D', desc: 'Vẽ hình học phẳng & không gian CeTZ tương tác', icon: 'shapes', color: 'sky', href: 'hh-live.html', keywords: 'live geometry 2d 3d cetz hình học' },
  { title: 'OCR → Typst', desc: 'Ảnh/PDF → #tn/#ds/#tln (Groq/Gemini)', icon: 'camera', color: 'amber', href: 'ocr-typst.html', keywords: 'ocr nhanh ảnh pdf typst groq gemini' },
  { title: 'Trộn Đề Thi Typst', desc: 'Xáo trộn nguyên bản, hoán vị phương án, nhiều mã đề .typ', icon: 'shuffle', color: 'orange', href: 'tron-de.html', keywords: 'trộn đề từ nhiều file randomizer seed typst' },
  { title: 'Kiểm lỗi Typst (Linter)', desc: 'Tìm lỗi #tn/#ds/#tln, LaTeX sót, CeTZ syntax', icon: 'circle-check', color: 'red', href: 'typst-linter.html', keywords: 'kiểm lỗi typst linter compile macro' },
  { title: 'Bảng vẽ CeTZ & TikZ', desc: 'Chuyển mã TikZ sang CeTZ hình học Typst', icon: 'wrench', color: 'mint', href: 'cetz-ve.html', keywords: 'bảng vẽ tikz cetz geometry vẽ hình' },
  { title: 'Ngân hàng câu hỏi', desc: 'Quản lý, soạn đề, lọc ID/tags/source', icon: 'landmark', color: 'blue', href: 'ngan-hang.html', keywords: 'ngân hàng câu hỏi bank id quản lý typst' },
  { title: 'AI tạo đề theo API key', desc: 'Tự chọn model, tự nhập key, mở cho mọi người dùng', icon: 'zap', color: 'cyan', href: 'ai-tao-de.html?tab=gen', keywords: 'ai tạo đề api key typst model' },
  { title: 'AI tạo đề thi Pro', desc: 'Quản lý tạo đề tốt nghiệp hay-lạ-khó bằng AI Pro', icon: 'cpu', color: 'violet', href: 'ai-tao-de.html?tab=pro', keywords: 'ai tạo đề thi tốt nghiệp hay lạ khó thpt' },
]

const exploreSections = [
  { title: 'Kho Mẫu Chuyên Đề', desc: 'Mẫu chuyên đề VIP, thực tế & hình học', icon: 'book-open', color: 'green', href: 'exam-templates.html', keywords: 'kho mẫu chuyên đề vip thực tế hình học' },
  { title: 'Bảng Biến Thiên Live', desc: 'Nhập thông số sinh ngay mã #bbtv2()', icon: 'layout-grid', color: 'sky', href: 'bbt-live.html', keywords: 'bảng biến thiên live bbt' },
  { title: 'Hình học Live 2D/3D', desc: 'Trực quan hóa khối chóp, lăng trụ & CeTZ 3D', icon: 'box', color: 'rose', href: 'hh-live.html', keywords: 'hình học không gian cetz 3d khối chóp live' },
  { title: 'OCR từ Ảnh / PDF', desc: 'Trích xuất đề từ ảnh & PDF sang mã Typst', icon: 'image', color: 'purple', href: 'ocr-typst.html', keywords: 'pdf từ ảnh trích xuất ocr typst' },
  { title: 'Trợ lý AI Typst', desc: 'Hỏi đáp kỹ thuật, sửa lỗi & hỗ trợ CeTZ', icon: 'bot', color: 'green', href: 'ai-tro-ly.html', keywords: 'trợ lý ai typst assistant hỏi đáp sửa lỗi' },
  { title: 'Atlas Chuyên Đề', desc: 'Tra cứu và tải tài liệu Atlas chuyên đề Toán', icon: 'database', color: 'orange', href: 'atlas.html', keywords: 'atlas chuyên đề tra cứu toán học' },
]

const tools = [
  { title: 'AI sang-math 1.0.4', desc: 'Sinh đề chuẩn API 1.0.4 bằng Gemini/GPT/Claude qua API key riêng, kiểm định tự động', icon: 'sparkles', color: 'green', href: 'ai-sang-math.html', status: 'Live ✓', keywords: 'ai sang math 1.0.4 contract validator model api key đề thi typst' },
  { title: 'Sang Math Studio', desc: 'IDE Typst tích hợp preview, dự án và xuất bản', icon: 'sparkles', color: 'green', href: 'https://typstconichub.pages.dev/#studio', status: 'Live ✓', keywords: 'studio typst editor preview wasm project' },
  { title: 'Kho Mẫu Đề & Sách', desc: '18 Theme đề, 12 Theme sách, 30 Beamer theme', icon: 'layers', color: 'purple', href: 'exam-templates.html', status: 'Live ✓', keywords: 'kho mẫu exam templates theme sách beamer' },
  { title: 'Bảng biến thiên Live', desc: 'Nhập trực quan sinh ngay mã #bbtv2()', icon: 'layout-grid', color: 'violet', href: 'bbt-live.html', status: 'Live ✓', keywords: 'bbt bbtv2 bảng biến thiên live typst cetz' },
  { title: 'Hình học Live 2D/3D', desc: 'Live Geometry, Conic, Trụ/Nón/Cầu, Xoắn 3D', icon: 'shapes', color: 'sky', href: 'hh-live.html', status: 'Live ✓', keywords: 'hh hh-live hình học geometry cetz 2d 3d conic tròn xoay live typst' },
  { title: 'Bảng vẽ CeTZ & TikZ', desc: 'Vẽ hình và chuyển đổi TikZ sang CeTZ Typst', icon: 'wrench', color: 'mint', href: 'cetz-ve.html', status: 'Live ✓', keywords: 'hỗ trợ vẽ tikz cetz geometry typst drawing' },
  { title: 'CeTZ Generator', desc: 'Trình sinh mã CeTZ đồ thị và hình học nhanh', icon: 'image', color: 'cyan', href: 'cetz-generator.html', status: 'Live ✓', keywords: 'cetz generator sinh mã đồ thị hình học' },
  { title: 'GeoGebra 2D → CeTZ', desc: 'Chuyển hình vẽ GeoGebra phẳng sang mã CeTZ', icon: 'pen-line', color: 'amber', href: 'cetz-geogebra.html', status: 'Live ✓', keywords: 'geogebra cetz 2d hình phẳng' },
  { title: 'GeoGebra 3D → CeTZ', desc: 'Chuyển mô hình không gian GeoGebra sang CeTZ 3D', icon: 'box', color: 'rose', href: 'cetz-geogebra-3d.html', status: 'Live ✓', keywords: 'geogebra 3d cetz không gian' },
  { title: 'CeTZ Plot Đồ Thị', desc: 'Vẽ đồ thị hàm số và miền phẳng sắc nét', icon: 'line-chart', color: 'teal', href: 'cetz-plot.html', status: 'Live ✓', keywords: 'cetz plot đồ thị hàm số' },
  { title: 'OCR → Typst', desc: 'Ảnh/PDF → #tn/#ds/#tln an toàn chuẩn 1.0.4', icon: 'camera', color: 'orange', href: 'ocr-typst.html', status: 'Live ✓', keywords: 'ocr ảnh pdf typst latex nhận dạng groq gemini' },
  { title: 'Kiểm lỗi Typst (Linter)', desc: 'Rà lỗi #tn/#ds/#tln, LaTeX sót, CeTZ syntax', icon: 'badge-check', color: 'red', href: 'typst-linter.html', status: 'Live ✓', keywords: 'linter typst lỗi compile tham số macro kiểm tra' },
  { title: 'Trộn Đề Thi Typst', desc: 'Xáo trộn câu hỏi, hoán vị phương án sang-math', icon: 'shuffle', color: 'amber', href: 'tron-de.html', status: 'Live ✓', keywords: 'trộn đề thi randomizer seed typst' },
  { title: 'Ngân Hàng Câu Hỏi', desc: 'Quản lý kho câu hỏi, duyệt và phân loại theo ID', icon: 'landmark', color: 'blue', href: 'ngan-hang.html', status: 'Live ✓', keywords: 'ngân hàng câu hỏi bank id' },
  { title: 'AI tạo bài tương tự', desc: 'Sinh bài tập mới từ bài toán mẫu', icon: 'cpu', color: 'violet', href: 'ai-tuong-tu.html', status: 'Live ✓', keywords: 'ai tạo bài tương tự sinh câu hỏi gemini' },
  { title: 'AI Tạo Đề Thi THPT', desc: 'Sinh đề theo ma trận, tự giải và kiểm định', icon: 'zap', color: 'cyan', href: 'ai-tao-de.html', status: 'Live ✓', keywords: 'ai tạo đề thi thpt ma trận' },
  { title: 'AI Typst Assistant', desc: 'Trợ lý lập trình CeTZ, sửa lỗi, định dạng trắc nghiệm', icon: 'bot', color: 'green', href: 'ai-tro-ly.html', status: 'Live ✓', keywords: 'ai typst assistant macro cetz solve' },
  { title: 'Beamer Converter', desc: 'Chuyển đề thi sang Slide Beamer trình chiếu', icon: 'presentation', color: 'indigo', href: 'beamer-converter.html', status: 'Live ✓', keywords: 'beamer converter slide typst touying trình chiếu' },
  { title: 'Atlas Chuyên Đề', desc: 'Kho PDF Atlas chuyên đề và bài giảng THPT', icon: 'database', color: 'slate', href: 'atlas.html', status: 'Live ✓', keywords: 'atlas chuyên đề pdf bài giảng' },
  { title: 'TikZ 3D Exporter', desc: 'Xuất mô hình 3D sang TikZ / Typst', icon: 'ruler', color: 'pink', href: 'tikz-geogebra-3d.html', status: 'Live ✓', keywords: 'tikz 3d exporter geogebra' },
  { title: 'Miền nghiệm BPT', desc: 'Quy hoạch tuyến tính, vẽ miền nghiệm hệ BPT bậc nhất hai ẩn CeTZ', icon: 'layers', color: 'orange', href: 'cetz-plot.html', status: 'Live ✓', keywords: 'miền nghiệm bpt bất phương trình quy hoạch tuyến tính' },
  { title: 'Tô miền & Tích phân', desc: 'Shade diện tích hình phẳng, giao miền tích phân và hình học trực quan', icon: 'pen-tool', color: 'sky', href: 'cetz-plot.html', status: 'Live ✓', keywords: 'tô miền shade miền nghiệm tích phân cetz' },
  { title: 'Khối tròn xoay 3D', desc: 'Mô phỏng mặt cắt, thể tích khối tròn xoay quanh trục Ox/Oy', icon: 'box', color: 'rose', href: 'hh-live.html', status: 'Live ✓', keywords: 'tròn xoay thể tích hình không gian tích phân 3d' },
  { title: 'Sơ đồ cây & Xác suất', desc: 'Bộ công cụ sinh sơ đồ cây Bayes, phân phối xác suất và tổ hợp', icon: 'git-branch', color: 'blue', href: 'cetz-plot.html', status: 'Live ✓', keywords: 'sơ đồ cây tree diagram xác suất bayes cetz' },
  { title: 'QR Tra Cứu Đáp Án', desc: 'Tự động gắn mã QR tra lời giải và bảng đáp án theo từng mã đề', icon: 'share-2', color: 'pink', href: 'tron-de.html', status: 'Live ✓', keywords: 'qr tra cứu đáp án mã đề answer key' },
  { title: 'Soạn Bảng & Matrix', desc: 'Trình dựng bảng dữ liệu, bảng biến thiên thu gọn và ma trận Typst', icon: 'grid', color: 'amber', href: 'bbt-live.html', status: 'Live ✓', keywords: 'soạn bảng table matrix typst ma trận' },
  { title: 'Lớp học trực tuyến', desc: 'Trình chiếu bài giảng tương tác và xuất bản đề thi cho học sinh', icon: 'video', color: 'red', href: 'beamer-converter.html', status: 'Live ✓', keywords: 'lớp học trực tuyến slide pdf bài giảng' },
  { title: 'Kế hoạch bài giảng', desc: 'Khung mẫu giáo án chuẩn GDPT 2018 theo công văn 5512', icon: 'calendar-days', color: 'purple', href: 'atlas.html', status: 'Live ✓', keywords: 'kế hoạch bài giảng giáo án 5512 book' },
  { title: 'Bài giảng THPT K10-K12', desc: 'Kho học liệu slide và bài tập theo chương trình mới', icon: 'book-open', color: 'green', href: 'atlas.html', status: 'Live ✓', keywords: 'bài giảng thpt sách chuyên đề k10 k11 k12' },
  { title: 'Biểu đồ thống kê CeTZ', desc: 'Vẽ biểu đồ cột, đoạn thẳng, hình quạt cho Thống kê 10-12', icon: 'bar-chart-2', color: 'cyan', href: 'cetz-plot.html', status: 'Live ✓', keywords: 'biểu đồ thống kê cột hình quạt cetz' },
]

const adminTools = [
  { title: 'AI tạo đề thi THPT Pro', icon: 'graduation-cap', href: 'ai-tao-de.html?tab=pro', status: 'Live ✓', active: true, keywords: 'ai tạo đề thi tốt nghiệp thpt' },
  { title: 'Bank Manager Studio', icon: 'landmark', href: 'ngan-hang.html', status: 'Live ✓', active: true, keywords: 'bank manager quản lý ngân hàng' },
  { title: 'CeTZ Generator Studio', icon: 'image', href: 'cetz-generator.html', status: 'Live ✓', active: true, keywords: 'cetz generator studio' },
  { title: 'GeoGebra 2D Bridge', icon: 'drafting-compass', href: 'cetz-geogebra.html', status: 'Live ✓', active: true, keywords: 'geogebra 2d bridge cetz' },
  { title: 'GeoGebra 3D Bridge', icon: 'box', href: 'cetz-geogebra-3d.html', status: 'Live ✓', active: true, keywords: 'geogebra 3d bridge cetz' },
  { title: 'TikZ → CeTZ Euclide', icon: 'ruler', href: 'cetz-ve.html', status: 'Live ✓', active: true, keywords: 'tikz euclide cetz chuyển đổi' },
  { title: 'Typst Syntax Linter', icon: 'badge-check', href: 'typst-linter.html', status: 'Live ✓', active: true, keywords: 'typst syntax linter kiểm lỗi' },
  { title: 'Atlas Data Explorer', icon: 'database', href: 'atlas.html', status: 'Live ✓', active: true, keywords: 'atlas data explorer chuyên đề' },
  { title: 'Magic Chương Giáo Án', icon: 'sprout', href: 'exam-templates.html', status: 'Đang phát triển ⏳', active: false, keywords: 'magic chương lesson chapter giáo án' },
  { title: 'Tách câu tự động từ .tex', icon: 'inbox', href: 'ngan-hang.html', status: 'Đang phát triển ⏳', active: false, keywords: 'tách câu tex import latex' },
  { title: 'Duyệt Exam Plus Bank', icon: 'check-square', href: 'ngan-hang.html', status: 'Đang phát triển ⏳', active: false, keywords: 'duyệt exam plus review ready' },
  { title: 'Kho đề gốc K10-K12', icon: 'folder', href: 'atlas.html', status: 'Đang phát triển ⏳', active: false, keywords: 'kho đề gốc typ k10 k11 k12' },
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
    const isDev = tool.status && (tool.status.includes('phát triển') || tool.status.includes('⏳'))
    const badgeStyle = isLive 
      ? 'background:#d1fae5;color:#065f46;border:1px solid #a7f3d0;' 
      : isDev 
        ? 'background:#fef3c7;color:#92400e;border:1px solid #fde68a;' 
        : 'background:#f1f5f9;color:#475569;'
    return `
    <a class="tool-card ${tool.color}${isDev ? ' is-dev' : ''}" href="${tool.href}" data-search="${tool.keywords} ${tool.title} ${tool.desc}">
      <span class="tool-icon">${createIcon(tool.icon)}</span>
      <span class="tool-body">
        <strong>${tool.title}</strong>
        <small>${tool.desc}</small>
      </span>
      <em style="${badgeStyle}">${tool.status}</em>
    </a>
  `}).join('')

  adminGrid.innerHTML = adminTools.map(tool => {
    const isLive = tool.status && (tool.status.includes('Live') || tool.status.includes('✓'))
    const isDev = tool.status && (tool.status.includes('phát triển') || tool.status.includes('⏳'))
    const badgeStyle = isLive 
      ? 'background:#d1fae5;color:#065f46;border:1px solid #a7f3d0;font-size:0.65rem;padding:2px 6px;border-radius:999px;' 
      : isDev 
        ? 'background:#fef3c7;color:#92400e;border:1px solid #fde68a;font-size:0.65rem;padding:2px 6px;border-radius:999px;' 
        : ''
    return `
    <a class="admin-card${tool.active ? ' active' : ''}" href="${tool.href}" data-search="${tool.keywords} ${tool.title}">
      ${createIcon(tool.icon)}
      <span>
        <strong>${tool.title}</strong>
        ${tool.status ? `<br><em style="${badgeStyle}">${tool.status}</em>` : ''}
      </span>
    </a>
  `}).join('')
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
