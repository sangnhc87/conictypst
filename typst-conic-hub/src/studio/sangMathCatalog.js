import { SANG_MATH_IMPORT, SANG_MATH_VERSION } from './packagePolicy.js'

export const SANG_MATH_CATEGORIES = [
  { id: 'all', label: 'Tất cả' },
  { id: 'exam', label: 'Đề thi' },
  { id: 'pedagogy', label: 'Sư phạm' },
  { id: 'book', label: 'Sách' },
  { id: 'slide', label: 'Trình chiếu' },
  { id: 'math', label: 'Toán học' },
]

export const SANG_MATH_CATALOG = [
  {
    id: 'import-all', category: 'exam', name: 'Import Sang Math', signature: SANG_MATH_IMPORT,
    description: `Nạp API chính thức sang-math ${SANG_MATH_VERSION} từ Typst Universe.`,
    snippet: `${SANG_MATH_IMPORT}\n`,
  },
  {
    id: 'exam-preset', category: 'exam', name: 'Cấu hình đề thi', signature: '#let preset = exam-preset(…)',
    description: 'Chọn theme, bản đề/lời giải và kiểu nhãn câu hỏi.',
    snippet: '#let preset = exam-preset(\n  theme: "teal-pro",\n  profile: "dethi",\n  opt-style: "vietnam-star",\n  answer-key: false,\n)\n#let (tn, ds, tln, tl) = exam-mode(..preset.question)\n',
  },
  {
    id: 'exam-part', category: 'exam', name: 'Tiêu đề phần thi', signature: '#exam-part([…], count: 12)',
    description: 'Tạo đầu phần, số lượng câu và đồng bộ bộ đếm.',
    snippet: '#exam-part([PHẦN I. Trắc nghiệm nhiều phương án], count: 12)\n\n',
  },
  {
    id: 'tn', category: 'exam', name: 'Câu trắc nghiệm', signature: '#tn([câu hỏi], (A, B, C, D))',
    description: 'Câu 4 phương án, đánh dấu đáp án đúng bằng True.',
    snippet: '#tn(\n  [Nội dung câu hỏi],\n  ([$A$], True([$B$]), [$C$], [$D$]),\n  id: "TN01",\n  loigiai: [Trình bày lời giải.],\n)\n',
  },
  {
    id: 'ds', category: 'exam', name: 'Câu đúng / sai', signature: '#ds([câu hỏi], (a, b, c, d))',
    description: 'Bốn mệnh đề đúng/sai, dùng True cho mệnh đề đúng.',
    snippet: '#ds(\n  [Nội dung câu hỏi],\n  (True([Mệnh đề a]), [Mệnh đề b], True([Mệnh đề c]), [Mệnh đề d]),\n  id: "DS01",\n  loigiai: [Trình bày lời giải.],\n)\n',
  },
  {
    id: 'tln', category: 'exam', name: 'Câu trả lời ngắn', signature: '#tln([câu hỏi], [đáp án])',
    description: 'Câu điền số có ID bền và đáp án máy đọc được để chấm online.',
    snippet: '#tln(\n  [Nội dung câu hỏi],\n  [$42$],\n  id: "TLN01",\n  answer-value: "42",\n  accepted-answers: ("42", "42,0"),\n  tolerance: 0,\n  loigiai: [Trình bày lời giải.],\n)\n',
  },
  {
    id: 'tl', category: 'exam', name: 'Câu tự luận', signature: '#tl([câu hỏi], lines: 6)',
    description: 'Câu tự luận với vùng làm bài và lời giải riêng.',
    snippet: '#tl(\n  [Nội dung câu tự luận],\n  lines: 6,\n  id: "TL01",\n  loigiai: [Trình bày lời giải chi tiết.],\n)\n',
  },
  {
    id: 'answer-key', category: 'exam', name: 'Bảng đáp án cuối đề', signature: '#print-answer-key()',
    description: 'Tổng hợp đáp án của các phần đã khai báo.',
    snippet: '#print-answer-key()\n',
  },
  {
    id: 'method-box', category: 'pedagogy', name: 'Phương pháp giải', signature: '#ppgiai[…]',
    description: 'Hộp phương pháp nổi bật dùng trong lời giải và chuyên đề.',
    snippet: '#ppgiai[\n  Nêu chiến lược và các bước giải cốt lõi.\n]\n',
  },
  {
    id: 'theory', category: 'pedagogy', name: 'Lý thuyết', signature: '#lythuyet[…]',
    description: 'Khối kiến thức nền dễ nhận biết trong tài liệu.',
    snippet: '#lythuyet[\n  Nội dung lý thuyết cần ghi nhớ.\n]\n',
  },
  {
    id: 'definition', category: 'pedagogy', name: 'Định nghĩa', signature: '#dn[…]',
    description: 'Hộp định nghĩa thống nhất nhận diện sư phạm.',
    snippet: '#dn[\n  Phát biểu định nghĩa.\n]\n',
  },
  {
    id: 'theorem', category: 'pedagogy', name: 'Định lý', signature: '#dl[…]',
    description: 'Hộp định lý có tiêu đề và nhấn màu tự động.',
    snippet: '#dl[\n  Phát biểu định lý.\n]\n',
  },
  {
    id: 'tip', category: 'pedagogy', name: 'Mẹo nhanh', signature: '#meo[…]',
    description: 'Gợi ý ngắn giúp học sinh tránh thao tác dài.',
    snippet: '#meo[\n  Mẹo nhận biết hoặc cách bấm nhanh.\n]\n',
  },
  {
    id: 'warning', category: 'pedagogy', name: 'Lưu ý', signature: '#luuy[…]',
    description: 'Cảnh báo lỗi sai thường gặp.',
    snippet: '#luuy[\n  Lỗi sai thường gặp và cách phòng tránh.\n]\n',
  },
  {
    id: 'grid-paper', category: 'pedagogy', name: 'Ô ly làm bài', signature: '#o-ly(rows: 5)',
    description: 'Sinh vùng giấy ô ly cho bài tự luận.',
    snippet: '#o-ly(rows: 5)\n',
  },
  {
    id: 'book-chapter', category: 'book', name: 'Chương sách', signature: '#book-chapter([…])',
    description: 'Đầu chương sách/chuyên đề theo theme đang chọn.',
    snippet: '#book-chapter([TÊN CHƯƠNG], number: "01", theme: theme)\n',
  },
  {
    id: 'book-lesson', category: 'book', name: 'Bài học', signature: '#book-lesson([…])',
    description: 'Tiêu đề bài học có đánh số và phân cấp rõ.',
    snippet: '#book-lesson([Tên bài học], number: "1", theme: theme)\n',
  },
  {
    id: 'goal-box', category: 'book', name: 'Mục tiêu bài học', signature: '#goal-box[…]',
    description: 'Hộp mục tiêu kiến thức, kỹ năng và phẩm chất.',
    snippet: '#goal-box(theme: theme)[\n  - Mục tiêu kiến thức.\n  - Mục tiêu kỹ năng.\n]\n',
  },
  {
    id: 'example-box', category: 'book', name: 'Ví dụ mẫu', signature: '#example-box[…]',
    description: 'Khối ví dụ có tiêu đề và màu nhấn nhất quán.',
    snippet: '#example-box(title: [Ví dụ mẫu], theme: theme)[\n  Nội dung ví dụ.\n]\n',
  },
  {
    id: 'practice-box', category: 'book', name: 'Luyện tập', signature: '#practice-box[…]',
    description: 'Khối bài luyện tập cho sách và chuyên đề.',
    snippet: '#practice-box(theme: theme)[\n  Nội dung bài luyện tập.\n]\n',
  },
  {
    id: 'beamer-import', category: 'slide', name: 'Khởi tạo Beamer', signature: '#import "/extensions/sang-beamer/sang-beamer.typ": *',
    description: 'Nạp extension trình chiếu 16:9 của Studio; sang-math vẫn dùng package Universe chính thức.',
    snippet: `${SANG_MATH_IMPORT}\n#import "/extensions/sang-beamer/sang-beamer.typ": *\n#import "/extensions/sang-beamer/themes.typ": get-beamer-theme\n`,
  },
  {
    id: 'beamer-theme', category: 'slide', name: 'Giao diện Beamer', signature: '#show: sang-beamer-theme.with(…)',
    description: 'Chọn một trong 30 theme sáng/tối cho bài giảng hoặc chữa đề.',
    snippet: '#let slide-theme = get-beamer-theme(16)\n#let _ = slide-theme.remove("name")\n#show: sang-beamer-theme.with(\n  title: "TÊN BÀI GIẢNG",\n  subtitle: "MÔN TOÁN",\n  author: "Tổ Toán",\n  institution: "Tên trường",\n  ..slide-theme,\n)\n',
  },
  {
    id: 'beamer-mode', category: 'slide', name: 'Câu hỏi trên slide', signature: '#let mode = exam-mode(mode: "loigiai")',
    description: 'Tạo TN, đúng/sai, trả lời ngắn và tự luận với màn lời giải riêng.',
    snippet: '#let mode = exam-mode(mode: "loigiai", accent: slide-theme.accent)\n\n#mode.tn(\n  [Nội dung câu hỏi],\n  ([$A$], True([$B$]), [$C$], [$D$]),\n  loigiai: [Trình bày lời giải.],\n)\n',
  },
  {
    id: 'cases-or', category: 'math', name: 'Hệ hoặc', signature: 'hoac(x &= 1, x &= 2)',
    description: 'Cụm nhiều trường hợp với dấu ngoặc vuông.',
    snippet: '$ hoac(\n  x &= 1,\n  x &= 2,\n) $',
  },
  {
    id: 'cases-system', category: 'math', name: 'Hệ phương trình', signature: 'heva(x + y &= 2, x - y &= 0)',
    description: 'Hệ phương trình căn thẳng dấu bằng.',
    snippet: '$ heva(\n  x + y &= 2,\n  x - y &= 0,\n) $',
  },
  {
    id: 'bbt', category: 'math', name: 'Bảng biến thiên', signature: '#bbtv2(…)',
    description: 'Bảng biến thiên khai báo bằng các mốc, dấu và giá trị.',
    snippet: '#bbtv2(\n  x-vals: ($-oo$, $-1$, $1$, $+oo$),\n  d-signs: ("+", 0, "-", 0, "+"),\n  v-vals: ($-oo$, $3$, $-1$, $+oo$),\n)\n',
  },
  {
    id: 'fraction', category: 'math', name: 'Phân số (dfrac)', signature: 'dfrac(a, b)',
    description: 'Phân số hiển thị kích thước lớn (tránh bị thu nhỏ).',
    snippet: 'dfrac(a, b)',
  },
  {
    id: 'vector', category: 'math', name: 'Vector', signature: 'vec(v) hoặc overrightarrow(A B)',
    description: 'Ký hiệu vector có dấu mũi tên trên đầu.',
    snippet: 'overrightarrow(A B)',
  },
  {
    id: 'angle-math', category: 'math', name: 'Góc', signature: 'angle A B C',
    description: 'Ký hiệu góc (dùng trong math mode).',
    snippet: 'angle A B C',
  },
  {
    id: 'geometry-triangle', category: 'math', name: 'Vẽ tam giác (CeTZ)', signature: '#tri-xyz(…)',
    description: 'Hàm vẽ nhanh tam giác với tọa độ 3 đỉnh.',
    snippet: '#tri-xyz((0,0), (2,3), (4,0), labels: ("A", "B", "C"))\n',
  },
  {
    id: 'geometry-axis', category: 'math', name: 'Trục tọa độ Oxy', signature: '#axis-xy(…)',
    description: 'Vẽ hệ trục tọa độ vuông góc Oxy.',
    snippet: '#axis-xy(-2, 5, -2, 4)\n',
  },
  {
    id: 'core-image', category: 'all', name: 'Chèn hình ảnh', signature: '#image("...", width: 100%)',
    description: 'Chèn hình ảnh vào tài liệu.',
    snippet: '#image(${1:"path/to/image.png"}, width: ${2:80%})\n',
  },
  {
    id: 'core-table', category: 'all', name: 'Bảng (Table)', signature: '#table(columns: 2, ...)',
    description: 'Tạo bảng với số cột chỉ định.',
    snippet: '#table(\n  columns: ${1:2},\n  [Cột 1], [Cột 2],\n  [Dữ liệu 1], [Dữ liệu 2],\n)\n',
  },
  {
    id: 'core-grid', category: 'all', name: 'Lưới (Grid)', signature: '#grid(columns: 2, ...)',
    description: 'Tạo lưới để sắp xếp nội dung song song.',
    snippet: '#grid(\n  columns: ${1:(1fr, 1fr)},\n  gutter: ${2:1em},\n  [Nội dung bên trái],\n  [Nội dung bên phải],\n)\n',
  },
  {
    id: 'core-align', category: 'all', name: 'Căn lề', signature: '#align(center)[...]',
    description: 'Căn chỉnh nội dung (left, center, right).',
    snippet: '#align(${1:center})[\n  ${2:Nội dung}\n]\n',
  },
  {
    id: 'core-text', category: 'all', name: 'Định dạng chữ', signature: '#text(red)[...]',
    description: 'Đổi màu chữ, cỡ chữ, phông chữ.',
    snippet: '#text(fill: ${1:red}, size: ${2:12pt})[${3:Nội dung}]\n',
  },
  {
    id: 'core-enum', category: 'all', name: 'Danh sách số', signature: '+ Mục 1',
    description: 'Tạo danh sách đánh số tự động.',
    snippet: '+ ${1:Mục 1}\n+ ${2:Mục 2}\n',
  },
  {
    id: 'core-list', category: 'all', name: 'Danh sách chấm', signature: '- Mục 1',
    description: 'Tạo danh sách chấm đầu dòng.',
    snippet: '- ${1:Mục 1}\n- ${2:Mục 2}\n',
  },
  {
    id: 'core-icon-size', category: 'all', name: 'Chèn và chỉnh cỡ Icon/Emoji', signature: '#text(size: ...)[icon]',
    description: 'Tăng giảm kích thước riêng cho một icon hoặc emoji bất kỳ (ví dụ: dùng cỡ 20pt).',
    snippet: '#text(size: ${1:20pt})[${2:🍎}]\n',
  },
]

function normalizeSearch(value) {
  return String(value || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLocaleLowerCase('vi')
    .replace(/[^a-z0-9#]+/g, ' ')
    .trim()
}

export function searchSangMathCatalog(query = '', category = 'all') {
  const needle = normalizeSearch(query)
  return SANG_MATH_CATALOG.filter(item => {
    if (category !== 'all' && item.category !== category) return false
    if (!needle) return true
    return normalizeSearch(`${item.name} ${item.signature} ${item.description}`).includes(needle)
  })
}
