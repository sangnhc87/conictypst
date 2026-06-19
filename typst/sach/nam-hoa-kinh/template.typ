// ╔══════════════════════════════════════════════════════════════════╗
// ║          TEMPLATE: NAM HOA KINH — BOOK DESIGN                  ║
// ║          Giữ tinh thần cổ thư nhưng thiên về núi, gió, nước    ║
// ╚══════════════════════════════════════════════════════════════════╝

#import "supham.typ": nhk-supham-note-for
#import "goihoi.typ": nhk-goihoi-note-for
#import "truyen.typ": nhk-truyenhay-note-for

// ══════════════════════════════════════════════════════
// §1. BẢN MÀU
// ══════════════════════════════════════════════════════
#let nam-ink = rgb("#1b1d1e")
#let nam-indigo = rgb("#264653")
#let nam-jade = rgb("#3f6b55")
#let nam-amber = rgb("#b08948")
#let nam-sand = rgb("#f3eee2")
#let nam-silk = rgb("#e8e0d0")
#let nam-smoke = rgb("#6d6a66")
#let nam-stone = rgb("#8b867b")
#let nam-cloud = rgb("#edf3f1")

// ══════════════════════════════════════════════════════
// §2. HÀM NỘI BỘ
// ══════════════════════════════════════════════════════
#let _hairline(color: nam-stone.lighten(35%)) = line(length: 100%, stroke: 0.4pt + color)

#let _ornament(color: nam-amber) = align(center)[
  #text(fill: color, size: 11pt)[✦]
]

#let _roman(n) = {
  let r = (
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX",
    "X",
    "XI",
    "XII",
    "XIII",
    "XIV",
    "XV",
    "XVI",
    "XVII",
    "XVIII",
    "XIX",
    "XX",
    "XXI",
    "XXII",
    "XXIII",
    "XXIV",
    "XXV",
    "XXVI",
    "XXVII",
    "XXVIII",
    "XXIX",
    "XXX",
    "XXXI",
    "XXXII",
    "XXXIII",
  )
  if n >= 1 and n <= r.len() { r.at(n - 1) } else { str(n) }
}

// ══════════════════════════════════════════════════════
// §3. SETUP TOÀN CỤC
// ══════════════════════════════════════════════════════
#let nhk-book(
  title: "NAM HOA KINH",
  subtitle: "Kể lại, bình giải và gợi đọc",
  author: "Trang Tử",
  editor: "Biên soạn mới",
  year: "Thế kỷ IV TCN · Biên soạn 2026",
  body,
) = {
  set document(title: title, author: author)

  set page(
    paper: "a5",
    margin: (top: 2.3cm, bottom: 2.2cm, inside: 2.1cm, outside: 1.7cm),
    fill: nam-sand,

    header: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      set text(size: 7.5pt, fill: nam-smoke, font: "Baskerville")
      if calc.odd(pg) {
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(style: "italic")[#title], text(fill: nam-amber, weight: "bold", size: 9pt)[✦],
        )
      } else {
        grid(
          columns: (auto, 1fr),
          align: (left + horizon, right + horizon),
          text(fill: nam-amber, weight: "bold", size: 9pt)[✦], text(style: "italic")[Trang Tử · Nam Hoa Kinh],
        )
      }
      v(-3pt)
      line(length: 100%, stroke: 0.35pt + nam-stone.lighten(35%))
    },

    footer: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      line(length: 100%, stroke: 0.35pt + nam-stone.lighten(35%))
      v(2pt)
      align(center)[#text(size: 8pt, fill: nam-smoke)[#pg]]
    },
  )

  set text(font: ("Baskerville", "Songti SC"), size: 11pt, lang: "vi", fill: nam-ink)
  set par(justify: true, leading: 0.88em, spacing: 1.4em)
  set list(marker: [—])

  page(fill: nam-silk, margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 2pt + nam-indigo,
      fill: none,
    ))
    #place(top + left, dx: 18pt, dy: 18pt, rect(
      width: 100% - 36pt,
      height: 100% - 36pt,
      stroke: 0.5pt + nam-amber,
      fill: none,
    ))
    #place(top + left, dx: 22pt, dy: 22pt, rect(
      width: 100% - 44pt,
      height: 100% - 44pt,
      stroke: 0.25pt + nam-jade.lighten(28%),
      fill: none,
    ))

    #place(top + left, dx: 26pt, dy: 26pt)[#text(fill: nam-amber, size: 10pt)[✦]]
    #place(top + right, dx: -26pt, dy: 26pt)[#text(fill: nam-amber, size: 10pt)[✦]]
    #place(bottom + left, dx: 26pt, dy: -26pt)[#text(fill: nam-amber, size: 10pt)[✦]]
    #place(bottom + right, dx: -26pt, dy: -26pt)[#text(fill: nam-amber, size: 10pt)[✦]]

    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #v(-1.3em)
        #text(fill: nam-jade, size: 9.5pt, tracking: 0.3em, weight: "bold")[
          CỔ THƯ TỰ DO TINH THẦN
        ]

        #v(0.5em)
        #_ornament(color: nam-amber)
        #v(1.5em)

        #text(
          font: "Baskerville",
          size: 35pt,
          fill: nam-indigo,
          weight: "bold",
          tracking: 0.1em,
        )[#upper(title)]

        #v(0.8em)
        #line(length: 3.5cm, stroke: 1.2pt + nam-amber)
        #v(0.8em)

        #box(
          fill: nam-jade,
          inset: (x: 15pt, y: 8pt),
          radius: 3pt,
          stroke: 0.8pt + nam-amber,
        )[
          #text(font: "Baskerville", size: 14pt, fill: nam-sand, weight: "bold", tracking: 0.25em)[#upper(author)]
        ]

        #v(2em)

        #block(width: 100%)[
          #align(center)[
            #text(
              font: "Baskerville",
              size: 13pt,
              fill: nam-stone.darken(10%),
              style: "italic",
              tracking: 0.05em,
            )[#subtitle]
          ]
        ]

        #v(3em)
        #text(font: "Baskerville", size: 9.5pt, fill: nam-smoke, tracking: 0.05em)[#year]

        #v(2.5em)
        #if editor != none {
          text(size: 9.5pt, fill: nam-ink, style: "italic")[
            Biên soạn & Gợi đọc:\
            #text(weight: "bold")[#editor]
          ]
          v(0.4em)
        }

        #v(1.7em)
        #text(fill: nam-indigo.lighten(10%), size: 10.5pt, weight: "medium", style: "italic")[
          "Chí nhân vô kỷ, thần nhân vô công, thánh nhân vô danh."
        ]
        #v(0.3em)
        #text(fill: nam-ink.lighten(18%), size: 9pt)[
          "Người đạt tới cùng cực thì không chấp cái tôi, không kể công và không tự giam mình trong danh xưng."
        ]
      ]
    ])
  ]

  pagebreak()
  body
}

// ══════════════════════════════════════════════════════
// §4. CÁC BLOCK NỘI DUNG
// ══════════════════════════════════════════════════════

#let nhk-outline() = {
  v(1em)
  align(center)[
    #text(size: 9pt, fill: nam-smoke, tracking: 0.18em)[✦ MỤC LỤC ✦]
  ]
  v(0.8em)
  set outline.entry(fill: repeat[#text(fill: nam-stone.lighten(30%), size: 7pt)[· ]])
  outline(title: none, depth: 2, indent: 1.5em)
  pagebreak(weak: true)
}

#let nhk-preface(body, title: "Lời Tựa") = {
  pagebreak(weak: true)
  v(1.4em)
  align(center)[
    #_hairline()
    #v(0.7em)
    #text(font: "Baskerville", size: 14pt, fill: nam-jade, weight: "bold")[#title]
    #v(0.4em)
    #_hairline()
  ]
  v(1em)
  body
  v(1.4em)
  _ornament()
  pagebreak(weak: true)
}

#let _part-cnt = counter("nhk-part")
#let nhk-part(title, subtitle: []) = {
  _part-cnt.step()
  pagebreak(weak: true)
  v(2em)
  page(fill: nam-indigo.darken(8%), margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 0.5pt + nam-amber.lighten(20%),
      fill: none,
    ))
    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #context {
          let n = _part-cnt.get().first()
          text(fill: nam-amber.lighten(25%), size: 9pt, tracking: 0.2em)[
            PHẦN #n
          ]
        }
        #v(0.8em)
        #text(font: "Baskerville", size: 30pt, fill: nam-sand, weight: "bold", tracking: 0.04em)[#upper(str(title))]
        #v(0.6em)
        #if subtitle != [] {
          text(font: "Baskerville", size: 12pt, fill: nam-amber.lighten(10%), style: "italic")[#subtitle]
        }
        #v(1em)
        #line(length: 5cm, stroke: 0.7pt + nam-amber)
      ]
    ])
    #hide(heading(level: 1, outlined: true)[#title])
  ]
  pagebreak(weak: true)
}

#let _thien-cnt = counter("nhk-thien")
#let nhk-thien(number, title) = {
  _thien-cnt.update(number)
  v(2.4em)
  align(center)[
    #text(font: "Baskerville", size: 10pt, fill: nam-amber.darken(15%), tracking: 0.1em)[
      THIÊN #_roman(number)
    ]
    #v(0.4em)
    #text(font: "Baskerville", size: 18pt, fill: nam-indigo, weight: "bold", tracking: 0.05em)[
      #title
    ]
    #v(0.8em)
    #_hairline(color: nam-amber.lighten(15%))
  ]
  v(1em)

  hide(heading(level: 2, outlined: true, bookmarked: true)[#number. #title])
}

#let nhk-truyenhay(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#fbf7ef"),
    stroke: (left: 3pt + nam-amber),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: nam-amber.darken(20%), tracking: 0.05em)[
      ✦ MẪU TRUYỆN TIÊU BIỂU
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, fill: nam-ink)
    #set par(leading: 0.9em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.35em)
}

#let nhk-tomluoc(body) = {
  context {
    let story = nhk-truyenhay-note-for(_thien-cnt.get().first())
    if story != none { nhk-truyenhay(story) }
  }
  v(0.4em)
  align(center)[
    #block(
      width: 88%,
      stroke: (top: 1pt + nam-amber, bottom: 1pt + nam-amber),
      inset: (x: 10pt, y: 16pt),
    )[
      #text(size: 8.5pt, weight: "bold", fill: nam-smoke, tracking: 0.12em)[TÓM LƯỢC THIÊN]
      #v(0.5em)
      #set text(font: ("Baskerville", "Georgia"), size: 12pt, fill: nam-indigo.darken(8%), weight: "medium")
      #set par(leading: 1.05em, spacing: 1.45em, justify: true)
      #body
    ]
  ]
  v(0.4em)
}

#let nhk-supham(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#e8f4f8"),
    stroke: (left: 3pt + rgb("#1d6fa5")),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: rgb("#0f4f79"), tracking: 0.05em)[
      📐 GÓC NHÌN SƯ PHẠM
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: rgb("#133e5d"))
    #set par(leading: 0.85em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.4em)
}

#let nhk-goihoi(body) = {
  v(0.1em)
  block(
    width: 100%,
    fill: rgb("#fff4df"),
    stroke: (left: 3pt + nam-amber),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8.8pt, weight: "bold", fill: nam-amber.darken(22%), tracking: 0.05em)[
      🗣 CÂU HỎI GỢI ĐÀM THOẠI
    ]
    #v(0.35em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.3pt, fill: nam-ink)
    #set par(leading: 0.82em, spacing: 0.95em, justify: true)
    #set list(marker: [•])
    #body
  ]
  v(0.4em)
}

#let nhk-binh(body) = {
  v(0.3em)
  block(
    width: 100%,
    fill: nam-cloud,
    stroke: (left: 2.5pt + nam-indigo),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8pt, weight: "bold", fill: nam-indigo, tracking: 0.1em)[
      BÌNH GIẢI
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: nam-indigo.darken(20%))
    #set par(leading: 0.82em, spacing: 1.2em, justify: true)
    #body
  ]
  context {
    let note = nhk-supham-note-for(_thien-cnt.get().first())
    if note != none { nhk-supham(note) }
    let prompts = nhk-goihoi-note-for(_thien-cnt.get().first())
    if prompts != none { nhk-goihoi(prompts) } else if note == none { v(0.3em) }
  }
}

#let nhk-concept(ten, body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: nam-silk,
    stroke: 0.6pt + nam-amber.lighten(15%),
    inset: (x: 14pt, y: 12pt),
    radius: 5pt,
  )[
    #text(font: "Baskerville", size: 12.5pt, weight: "bold", fill: nam-jade.darken(10%))[#ten]
    #v(0.3em)
    #line(length: 100%, stroke: 0.4pt + nam-amber.lighten(25%))
    #v(0.4em)
    #set text(size: 10.5pt, fill: nam-ink)
    #set par(leading: 0.8em)
    #body
  ]
  v(0.4em)
}

#let nhk-goimo(body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: nam-jade.lighten(92%),
    stroke: (left: 3pt + nam-jade),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: nam-jade.darken(20%), tracking: 0.05em)[
      GỢI MỞ HÔM NAY
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: nam-jade.darken(28%))
    #set par(leading: 0.85em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.4em)
}

#let nhk-dongtay(truoc: [], sau: []) = {
  v(0.4em)
  block(
    width: 100%,
    fill: rgb("#f8f6f1"),
    stroke: 0.8pt + nam-jade,
    inset: (x: 14pt, y: 12pt),
    radius: 4pt,
  )[
    #text(size: 9.5pt, weight: "bold", fill: nam-jade.darken(20%), tracking: 0.05em)[
      ✧ ĐỐI CHIẾU CỔ KIM
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      [
        #text(size: 8.5pt, weight: "bold", fill: nam-smoke)[BÊN CẠNH TRANG TỬ:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: nam-ink)
        #set par(leading: 0.8em, justify: true)
        #truoc
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: nam-smoke)[NHÌN SANG HÔM NAY:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: nam-ink)
        #set par(leading: 0.8em, justify: true)
        #sau
      ],
    )
  ]
  v(0.4em)
}

#let nhk-trich(body, source: []) = {
  block(
    width: 100%,
    inset: (left: 20pt, right: 12pt, top: 8pt, bottom: 8pt),
    stroke: (left: 2.5pt + nam-jade),
    fill: nam-jade.lighten(95%),
    radius: (right: 4pt),
  )[
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, style: "italic", fill: nam-jade.darken(20%))
    #body
    #if source != [] {
      v(0.3em)
      align(right)[
        #text(size: 9pt, style: "normal", weight: "bold", fill: nam-jade)[— #source]
      ]
    }
  ]
}

#let nhk-suyngam(body) = {
  v(0.4em)
  align(center)[
    #block(
      width: 88%,
      stroke: (top: 0.6pt + nam-indigo.lighten(40%), bottom: 0.6pt + nam-indigo.lighten(40%)),
      inset: (x: 0pt, y: 13pt),
    )[
      #set text(font: ("Baskerville", "Georgia"), size: 11pt, style: "italic", fill: nam-indigo)
      #body
    ]
  ]
  v(0.4em)
}

#let nhk-section(title) = {
  v(0.8em)
  text(font: "Baskerville", size: 10.5pt, weight: "bold", fill: nam-jade, tracking: 0.06em)[#upper(title)]
  v(0.15em)
  line(length: 2.5cm, stroke: 1pt + nam-amber)
  v(0.5em)
}
