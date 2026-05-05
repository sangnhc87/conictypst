// ═══════════════════════════════════════════════════════════
// STEXGV EXAM SET MODULE
// Phân hệ biên soạn Bộ đề thi, ma trận và hướng dẫn chấm
// ═══════════════════════════════════════════════════════════

#import "exam.typ": palette, classic, thpt-school-exam, print-answer-key, het, resetexamstate, note, lythuyet, luuy

#let _outline-heading(level, body) = hide(heading(level: level, outlined: true, bookmarked: auto)[#body])

#let _exam-set-cover(
  title,
  subtitle: none,
  author: "Nguyễn Văn Sang",
  institution: none,
  subject: none,
  grade: none,
  series: none,
  academic-year: none,
  publisher: none,
  cover-note: none,
  theme-color: classic.blue,
) = align(center + horizon)[
  #if institution != none {
    text(size: 12pt, weight: "bold", fill: theme-color)[#institution]
    v(1em)
  }
  #text(size: 11pt, weight: "bold", tracking: 0.08em, fill: theme-color)[BỘ ĐỀ THI]
  #v(1.3em)
  #text(size: 30pt, weight: "bold", fill: theme-color)[#title]
  #if subtitle != none {
    v(0.8em)
    text(size: 18pt, style: "italic")[#subtitle]
  }
  #v(1.2em)
  #if subject != none {
    text(size: 14pt)[Môn: #subject]
    v(0.3em)
  }
  #if grade != none {
    text(size: 13pt)[Khối/Lớp: #grade]
    v(0.3em)
  }
  #if series != none {
    text(size: 13pt)[Tuyển tập: #series]
    v(0.3em)
  }
  #if academic-year != none {
    text(size: 12pt, fill: palette.muted)[Năm học: #academic-year]
  }
  #v(2.2em)
  #box(fill: theme-color.lighten(94%), stroke: 0.8pt + theme-color, inset: (x: 18pt, y: 12pt), radius: 10pt)[
    #text(size: 18pt, style: "italic")[Biên soạn: #author]
    #if publisher != none {
      v(0.4em)
      text(size: 11pt, fill: palette.muted)[#publisher]
    }
  ]
  #if cover-note != none {
    v(2em)
    note(cover-note, title: [Ghi chú bộ đề])
  }
  #v(3em)
]

#let stexgv-exam-set(
  title: "BỘ ĐỀ ÔN LUYỆN",
  subtitle: none,
  author: "Nguyễn Văn Sang",
  institution: none,
  subject: none,
  grade: none,
  series: none,
  academic-year: none,
  publisher: none,
  cover-note: none,
  theme-color: classic.blue,
  show-cover: true,
  show-outline: true,
  outline-depth: 2,
  body,
) = {
  set document(title: title, author: author)
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, inside: 2.5cm, outside: 2cm),
    header: context {
      let page-num = counter(page).get().first()
      if show-cover and page-num == 1 { return none }

      set text(size: 10pt, fill: theme-color)
      grid(columns: (1fr, auto), align: (left, right),
        text(weight: "bold")[#title],
        text(weight: "bold")[Bộ đề thi],
      )
      v(-4pt)
      line(length: 100%, stroke: 0.8pt + theme-color)
    },
    footer: context {
      let page-num = counter(page).get().first()
      if show-cover and page-num == 1 { return none }

      set text(size: 10pt, fill: palette.muted)
      line(length: 100%, stroke: 0.4pt + palette.border)
      v(2pt)
      align(center)[Trang #page-num]
    },
  )

  set text(font: "Libertinus Serif", size: 12pt, lang: "vi")
  set par(justify: true, leading: 0.75em)
  show math.equation.where(block: false): math.display

  if show-cover {
    _exam-set-cover(
      title,
      subtitle: subtitle,
      author: author,
      institution: institution,
      subject: subject,
      grade: grade,
      series: series,
      academic-year: academic-year,
      publisher: publisher,
      cover-note: cover-note,
      theme-color: theme-color,
    )
    pagebreak()
  }

  if show-outline {
    outline(title: heading(level: 1, outlined: false)[MỤC LỤC BỘ ĐỀ], depth: outline-depth, indent: auto)
    pagebreak()
  }

  body
}

#let de(
  body,
  title: [Đề số 1],
  exam-title: auto,
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "SỞ GIÁO DỤC VÀ ĐÀO TẠO",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "",
  footer-left: none,
  accent: palette.accent,
  pagebreak-before: true,
  outline-level: 1,
  reset-state: true,
  question-start: 1,
  part-start: 1,
  show-answer-key: false,
  show-end: true,
) = [
  #if pagebreak-before { pagebreak(weak: true) }
  #_outline-heading(outline-level, title)
  #if reset-state {
    resetexamstate(question-start: question-start, part-start: part-start)
  }
  #show: thpt-school-exam.with(
    department: department,
    school: school,
    exam-title: if exam-title == auto { title } else { exam-title },
    subject: subject,
    duration: duration,
    structure: structure,
    code: code,
    footer-left: footer-left,
    accent: accent,
  )
  #body
  #if show-answer-key {
    print-answer-key()
  }
  #if show-end {
    het
  }
]

#let dethi = de

#let matran(body, title: [Ma trận đề thi], ..args) = note(
  body,
  title: title,
  accent: classic.blue,
  fill: rgb("#eef4ff"),
  title-fill: classic.blue,
  ..args,
)

#let dacta(body, title: [Bản đặc tả], ..args) = lythuyet(
  body,
  title: title,
  accent: rgb("#7c3aed"),
  fill: rgb("#f5f3ff"),
  title-fill: rgb("#6d28d9"),
  ..args,
)

#let huongdancham(body, title: [Hướng dẫn chấm], ..args) = note(
  body,
  title: title,
  accent: classic.emerald,
  fill: rgb("#ecfdf5"),
  title-fill: classic.emerald,
  ..args,
)

#let luuybode(body, title: [Lưu ý khi dùng bộ đề], ..args) = luuy(body, title: title, ..args)