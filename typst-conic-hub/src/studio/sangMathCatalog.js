import { SANG_MATH_IMPORT } from './packagePolicy.js'

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
    description: 'Nạp API chính thức sang-math 1.0.0 từ Typst Universe.',
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
    description: 'Câu điền số/tự luận ngắn có đáp án máy đọc được.',
    snippet: '#tln(\n  [Nội dung câu hỏi],\n  [$42$],\n  id: "TLN01",\n  loigiai: [Trình bày lời giải.],\n)\n',
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
