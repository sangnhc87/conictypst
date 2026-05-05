// ═══════════════════════════════════════════════════════════
// STEXGV RESEARCH MODULE
// Phân hệ biên soạn Báo cáo Nghiên cứu Khoa học (NCKH)
// ═══════════════════════════════════════════════════════════

#import "exam.typ": palette, classic

// ─────────────────────────────────────────────────────────
// TEMPLATE CHÍNH CHO BÁO CÁO NCKH
// ─────────────────────────────────────────────────────────
#let stexgv-research(
  title: "TIÊU ĐỀ BÁO CÁO KHOA HỌC",
  authors: ("Tác giả 1", "Tác giả 2"),
  abstract: none,
  keywords: (),
  two-columns: true,
  theme-color: classic.blue,
  doc-type: "research",
  body
) = {
  set document(title: title, author: authors)
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2.5cm),
    header: context {
      let page-num = counter(page).get().first()
      if page-num == 1 { return none }
      set text(size: 9pt, fill: palette.muted)
      grid(
        columns: (1fr, auto),
        [#title],
        [#authors.join(", ")]
      )
      v(-4pt)
      line(length: 100%, stroke: 0.5pt + palette.border)
    },
    footer: context {
      set text(size: 10pt, fill: palette.muted)
      align(center)[Trang #counter(page).display()]
    }
  )

  set text(font: "Libertinus Serif", size: 11pt, lang: "vi")
  set par(justify: true, leading: 0.65em)
  
  // Đánh số phương trình
  set math.equation(numbering: "(1)")
  show math.equation.where(block: false): math.display

  // Đánh số mục lục
  set heading(numbering: "1.1.")
  show heading: it => {
    v(1.5em)
    text(weight: "bold", fill: theme-color)[
      #if it.numbering != none {
        counter(heading).display()
        h(0.5em)
      }
      #it.body
    ]
    v(0.5em)
  }

  // Tiêu đề bài báo
  align(center)[
    #text(size: 18pt, weight: "bold", fill: theme-color)[#title]
    #v(1em)
    #text(size: 12pt)[
      *#authors.join(", ")*
    ]
    #v(2em)
  ]

  // Abstract & Keywords
  if abstract != none {
    align(center)[
      #block(width: 85%, align(left)[
        #text(weight: "bold")[Tóm tắt: ] #abstract
        #if keywords.len() > 0 {
          v(0.5em)
          text(weight: "bold")[Từ khóa: ] + keywords.join("; ")
        }
      ])
    ]
    v(2em)
  }

  // Chia cột nội dung nếu cần
  if two-columns {
    columns(2, gutter: 15pt)[
      #body
    ]
  } else {
    body
  }
}
