import fullExamRaw from '../../../public/hdsd/downloads/examples/05_full_de_thi_mau.typ?raw'
import fullExamDataRaw from '../../../public/hdsd/downloads/examples/05_data_de_thi_mau.typ?raw'
import { SANG_MATH_IMPORT } from './packagePolicy.js'

const FULL_EXAM_SOURCE = fullExamRaw
  .replace('#import "../lib.typ": *', SANG_MATH_IMPORT)
  .replace('exam-mode(..preset.question, show-hyperlink: true)', 'exam-mode(..preset.question)')
  .replace(/^#let theme = "violet".*$/m, '// #let theme = "violet"         // Tím mộng mơ')
  .replace(/^\/\/ #let theme = "teal-pro".*$/m, '#let theme = "teal-pro"       // Xanh hiện đại, đồng bộ nhận diện ConicTypst')

const FULL_EXAM_DATA_SOURCE = fullExamDataRaw
  .replace('#import "../lib.typ": *', SANG_MATH_IMPORT)

const QUICKSTART_SOURCE = `#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 1.8cm),
  header: align(right)[#text(size: 8.5pt, fill: rgb("#64748b"))[TYPST CONIC HUB]],
)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.72em)
#show heading.where(level: 1): it => block(
  fill: rgb("#eef7f1"),
  stroke: (left: 3pt + rgb("#16a36f")),
  inset: (x: 12pt, y: 9pt),
  radius: (right: 7pt),
)[#text(fill: rgb("#12362c"), weight: "bold")[#it.body]]

#align(center)[
  #text(size: 24pt, weight: "bold", fill: rgb("#245ec7"))[TypstConicHub]
  #v(4pt)
  #text(size: 11pt, fill: rgb("#64748b"))[Không gian soạn thảo Typst dành cho giáo viên Toán]
]

#v(18pt)
= Bắt đầu thật nhanh

Bạn đang biên dịch hoàn toàn trên trình duyệt bằng WebAssembly. Mọi thay đổi trong dự án được tự động lưu trên thiết bị này.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  block(fill: rgb("#fff7ed"), inset: 12pt, radius: 8pt)[
    *Công thức đẹp* \\
    $integral_0^1 x^2 dif x = 1/3$
  ],
  block(fill: rgb("#eff6ff"), inset: 12pt, radius: 8pt)[
    *Biên dịch tức thời* \\
    Sửa nội dung bên trái và xem kết quả bên phải.
  ],
)

== Ba bước làm việc

+ Chọn một mẫu Sang Math trên trang dự án.
+ Soạn nội dung và kiểm tra bảng *Vấn đề* nếu có lỗi.
+ Xuất PDF, SVG, PNG hoặc toàn bộ dự án ZIP.

#v(12pt)
#align(center)[#text(fill: rgb("#16a36f"), weight: "bold")[Sang Math · ConicTypst · 2026]]
`

const EXAM_SOURCE = `// Package chính thức trên Typst Universe.
${SANG_MATH_IMPORT}

#let preset = exam-preset(theme: "teal-pro", profile: "loigiai")
#let (tn, ds, tln, tl) = exam-mode(..preset.question)

#show: sang-setup.with(math-color: preset.accent)
#show: exam-theme.with(
  theme: preset.theme,
  school: "TRƯỜNG THPT SANG-MATH",
  exam-title: "ĐỀ KIỂM TRA CUỐI HỌC KỲ",
  subject: "TOÁN 12",
  duration: "90 phút",
  code: "101",
  ..preset.template,
)

#exam-part([PHẦN I. Trắc nghiệm nhiều phương án], count: 2)

#tn(
  [Đạo hàm của hàm số $f(x)=x^3-3x+1$ tại $x=2$ bằng],
  ([$3$], True([$9$]), [$6$], [$-3$]),
  id: "TN01",
  loigiai: [$f'(2)=3 dot 2^2-3=9$.],
)

#tn(
  [Tập nghiệm của phương trình $2^x=8$ là],
  ([$x=2$], True([$x=3$]), [$x=4$], [$x=8$]),
  id: "TN02",
  loigiai: [Vì $8=2^3$ nên $x=3$.],
)

#exam-part([PHẦN II. Câu đúng / sai], count: 1)

#ds(
  [Cho hàm số $f(x)=x^2$. Xét các khẳng định sau:],
  (
    True([$f(2)=4$]),
    [$f'(x)=x$],
    True([Hàm số đồng biến trên $(0;+oo)$]),
    [$f$ là hàm số lẻ],
  ),
  id: "DS01",
  loigiai: [$f'(x)=2x$ và $f$ là hàm chẵn.],
)
`

const BOOK_SOURCE = `${SANG_MATH_IMPORT}

#let theme = "sgk-modern"

#show: book-theme.with(
  theme: theme,
  title: "CHUYÊN ĐỀ HÀM SỐ",
  subtitle: "Khảo sát và ứng dụng đạo hàm",
  author: "Tổ Toán",
  institution: "Sang Math · ConicTypst",
  subject: "Toán",
  grade: "Lớp 12",
  year: "2026–2027",
)

#book-chapter([Ứng dụng đạo hàm], number: "01", theme: theme)
#book-lesson([Tính đơn điệu của hàm số], number: "1", theme: theme)

#goal-box(theme: theme)[
  - Nhận biết dấu của đạo hàm trên từng khoảng.
  - Kết luận khoảng đồng biến, nghịch biến.
]

#theory-box(theme: theme)[
  Nếu $f'(x)>0$ với mọi $x in I$ thì hàm số $f$ đồng biến trên $I$.
]

#example-box(title: [Ví dụ mẫu], theme: theme)[
  Xét tính đơn điệu của hàm số $y=x^3-3x+1$.
]

#practice-box(theme: theme)[
  Xét tính đơn điệu của hàm số $y=x^3-6x^2+9x$.
]
`

const SPECIALTY_SOURCE = `${SANG_MATH_IMPORT}

#let theme = "olympiad-indigo"

#show: book-theme.with(
  theme: theme,
  title: "CHUYÊN ĐỀ TOÁN 12",
  subtitle: "Ứng dụng đạo hàm để khảo sát hàm số",
  author: "Tổ Toán",
  institution: "ConicTypst · Sang Math",
  grade: "Lớp 12",
  subject: "Toán",
  year: "2026–2027",
)

#book-chapter([ỨNG DỤNG ĐẠO HÀM], number: "01", theme: theme)
#book-lesson([Tính đơn điệu và cực trị], number: "1", theme: theme)

#goal-box(theme: theme)[
  - Nhận biết khoảng đồng biến, nghịch biến từ dấu đạo hàm.
  - Vận dụng bảng biến thiên để giải bài toán cực trị.
]

#theory-box(theme: theme)[
  Nếu $f'(x) > 0$ trên khoảng $I$ thì hàm số $f$ đồng biến trên $I$.
  Nếu $f'(x) < 0$ trên khoảng $I$ thì hàm số $f$ nghịch biến trên $I$.
]

#example-box(title: [Ví dụ 1 · Khảo sát dấu đạo hàm], theme: theme)[
  Cho $f(x)=x^3-3x+1$. Ta có $f'(x)=3(x-1)(x+1)$.

  #align(center)[
    #bbtv2(
      x-vals: ($-oo$, $-1$, $1$, $+oo$),
      d-signs: ("+", 0, "-", 0, "+"),
      v-vals: ($-oo$, $3$, $-1$, $+oo$),
    )
  ]
]

#practice-box(theme: theme)[
  Xét tính đơn điệu và tìm cực trị của hàm số $y=x^3-6x^2+9x$.
]
`

const BEAMER_SOURCE = `// sang-math dùng bản chính thức; Beamer là extension riêng của Studio.
${SANG_MATH_IMPORT}
#import "/extensions/sang-beamer/sang-beamer.typ": *
#import "/extensions/sang-beamer/themes.typ": get-beamer-theme

// Đổi số từ 1 đến 30 để chọn theme slide (1–15 tối, 16–30 sáng).
#let theme-id = 16
#let slide-theme = get-beamer-theme(theme-id)
#let theme-name = slide-theme.name
#let _ = slide-theme.remove("name")

#show: sang-beamer-theme.with(
  title: "CHỮA ĐỀ THI MẪU TOÁN 12",
  subtitle: "Tái sử dụng trọn bộ câu hỏi 05_full_de_thi_mau",
  author: "Tổ Toán",
  institution: "ConicTypst · Sang Math",
  total-q: 26,
  ..slide-theme,
)

#let mode = exam-mode(mode: "loigiai", accent: slide-theme.accent)

// Cùng một file dữ liệu có thể xuất thành đề A4 hoặc slide 16:9.
#import "05_data_de_thi_mau.typ": make-questions
#make-questions(
  tn: mode.tn,
  ds: mode.ds,
  tln: mode.tln,
  tl: mode.tl,
  exam-part: exam-part,
)

#pagebreak()
#print-answer-key()
#het
`

const BBT_SOURCE = `#import "@preview/sang-math:1.0.0": bbtv2

#set page(paper: "a4", margin: 2cm)
#set text(font: "New Computer Modern", size: 11pt)

= Bảng biến thiên

Xét hàm số $f(x)=x^3-3x+1$ có $f'(x)=3(x-1)(x+1)$.

#align(center)[
  #bbtv2(
    x-vals: ($-oo$, $-1$, $1$, $+oo$),
    d-signs: ("+", 0, "-", 0, "+"),
    v-vals: ($-oo$, $3$, $-1$, $+oo$),
  )
]
`

export const PROJECT_TEMPLATES = [
  {
    id: 'full-exam',
    name: 'Đề thi đầy đủ 05',
    label: 'MẪU CHÍNH · 4 PHẦN',
    description: 'Bộ 05_full_de_thi_mau hoàn chỉnh, tách dữ liệu câu hỏi và dùng giao diện teal-pro.',
    color: 'green',
    icon: '05',
    kind: 'Đề thi đầy đủ',
    featured: true,
    entryPath: '/project/05_full_de_thi_mau.typ',
    files: {
      '/project/05_full_de_thi_mau.typ': { kind: 'text', content: FULL_EXAM_SOURCE },
      '/project/05_data_de_thi_mau.typ': { kind: 'text', content: FULL_EXAM_DATA_SOURCE },
    },
  },
  {
    id: 'quickstart',
    name: 'Tài liệu tự do',
    label: 'GIÁO ÁN · HANDOUT · BÁO CÁO',
    description: 'Tài liệu Typst A4 nhẹ để soạn giáo án, phiếu học tập, báo cáo hoặc nội dung tự do.',
    color: 'blue',
    icon: 'TL',
    kind: 'Tài liệu',
    files: { '/project/main.typ': { kind: 'text', content: QUICKSTART_SOURCE } },
  },
  {
    id: 'exam',
    name: 'Đề thi Sang Math',
    label: 'TN · Đ/S · TLN · TL',
    description: 'Mẫu đề thi dùng sang-math 1.0.0 chính thức trên Typst Universe và giao diện teal-pro.',
    color: 'green',
    icon: 'ĐT',
    kind: 'Đề kiểm tra',
    files: { '/project/main.typ': { kind: 'text', content: EXAM_SOURCE } },
  },
  {
    id: 'book',
    name: 'Sách và giáo trình',
    label: 'SGK Modern',
    description: 'Khung sách nhiều chương, mục lục, bài học và các hộp sư phạm thống nhất.',
    color: 'orange',
    icon: 'S',
    kind: 'Sách',
    files: { '/project/main.typ': { kind: 'text', content: BOOK_SOURCE } },
  },
  {
    id: 'specialty',
    name: 'Chuyên đề Toán',
    label: 'LÝ THUYẾT · VÍ DỤ · LUYỆN TẬP',
    description: 'Chuyên đề hoàn chỉnh có mục tiêu, lý thuyết, ví dụ, BBT và bài tập luyện tập.',
    color: 'violet',
    icon: 'CĐ',
    kind: 'Chuyên đề',
    files: { '/project/main.typ': { kind: 'text', content: SPECIALTY_SOURCE } },
  },
  {
    id: 'beamer',
    name: 'Slide Beamer 16:9',
    label: '30 THEME · CHỮA ĐỀ · TRÌNH CHIẾU',
    description: 'Slide bài giảng dùng lại dữ liệu bộ đề 05, có màn câu hỏi, lời giải và bảng đáp án.',
    color: 'orange',
    icon: '▶',
    kind: 'Trình chiếu',
    files: {
      '/project/main.typ': { kind: 'text', content: BEAMER_SOURCE },
      '/project/05_data_de_thi_mau.typ': { kind: 'text', content: FULL_EXAM_DATA_SOURCE },
    },
  },
  {
    id: 'bbt',
    name: 'Bảng biến thiên',
    label: 'BBT thông minh',
    description: 'Mẫu bảng biến thiên sẵn sàng chỉnh sửa bằng sang-math.',
    color: 'violet',
    icon: 'BBT',
    kind: 'Công cụ Toán',
    files: { '/project/main.typ': { kind: 'text', content: BBT_SOURCE } },
  },
]

export const AUTHORING_SNIPPETS = [
  { id: 'heading', label: 'Tiêu đề', text: '= Tiêu đề mới\n\n' },
  { id: 'math', label: 'Công thức', text: '$ integral_a^b f(x) dif x $' },
  { id: 'tn', label: 'TN', text: '#tn(\n  [Nội dung câu hỏi],\n  ([$A$], True([$B$]), [$C$], [$D$]),\n  loigiai: [Lời giải.],\n)\n' },
  { id: 'ds', label: 'Đ/S', text: '#ds(\n  [Nội dung câu hỏi],\n  (True([Ý a]), [Ý b], True([Ý c]), [Ý d]),\n  loigiai: [Lời giải.],\n)\n' },
  { id: 'tln', label: 'TLN', text: '#tln(\n  [Nội dung câu hỏi],\n  [$42$],\n  loigiai: [Lời giải.],\n)\n' },
  { id: 'box', label: 'Hộp', text: '#block(fill: rgb("#eef7f1"), inset: 12pt, radius: 7pt)[\n  Nội dung nổi bật\n]\n' },
]

export function createProjectFromTemplate(templateId = 'full-exam', customName = '') {
  const template = PROJECT_TEMPLATES.find(item => item.id === templateId) || PROJECT_TEMPLATES[0]
  const now = Date.now()
  const suffix = typeof crypto !== 'undefined' && crypto.randomUUID
    ? crypto.randomUUID()
    : `${now}-${Math.random().toString(16).slice(2)}`

  return {
    id: `project-${suffix}`,
    name: customName.trim() || template.name,
    entryPath: template.entryPath || '/project/main.typ',
    files: structuredClone(template.files),
    createdAt: now,
    updatedAt: now,
    snapshots: [],
    templateId: template.id,
  }
}
