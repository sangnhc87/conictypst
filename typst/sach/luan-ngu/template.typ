// ╔══════════════════════════════════════════════════════════════════╗
// ║          TEMPLATE: LUẬN NGỮ — BOOK DESIGN                      ║
// ║          Cổ thư học làm người, thầy trò, xử thế                ║
// ╚══════════════════════════════════════════════════════════════════╝

#import "supham.typ": ln-supham-note-for
#import "goihoi.typ": ln-goihoi-note-for
#import "loi.typ": ln-loi-note-for

// ══════════════════════════════════════════════════════
// §1. BẢN MÀU
// ══════════════════════════════════════════════════════
#let ln-ink = rgb("#2c2621")
#let ln-cinnabar = rgb("#a8462d")
#let ln-bamboo = rgb("#4f6757")
#let ln-bronze = rgb("#8a6a3e")
#let ln-sand = rgb("#f5eee3")
#let ln-silk = rgb("#ece2d2")
#let ln-cloud = rgb("#eef2ee")
#let ln-smoke = rgb("#6f675e")
#let ln-stone = rgb("#8d8276")

// ══════════════════════════════════════════════════════
// §2. HÀM NỘI BỘ
// ══════════════════════════════════════════════════════
#let _hairline(color: ln-stone.lighten(35%)) = line(length: 100%, stroke: 0.4pt + color)

#let _ornament(color: ln-bronze) = align(center)[
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
  )
  if n >= 1 and n <= r.len() { r.at(n - 1) } else { str(n) }
}

// ══════════════════════════════════════════════════════
// §3. SETUP TOÀN CỤC
// ══════════════════════════════════════════════════════
#let ln-book(
  title: "LUẬN NGỮ",
  subtitle: "Ngữ lục ngắn, giải nghĩa và gợi đọc",
  author: "Khổng Tử",
  editor: "Biên soạn mới",
  year: "Thế kỷ V TCN · Biên soạn 2026",
  body,
) = {
  set document(title: title, author: author)

  set page(
    paper: "a5",
    margin: (top: 2.3cm, bottom: 2.2cm, inside: 2.1cm, outside: 1.7cm),
    fill: ln-sand,

    header: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      set text(size: 7.5pt, fill: ln-smoke, font: "Baskerville")
      if calc.odd(pg) {
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(style: "italic")[#title], text(fill: ln-bronze, weight: "bold", size: 9pt)[✦],
        )
      } else {
        grid(
          columns: (auto, 1fr),
          align: (left + horizon, right + horizon),
          text(fill: ln-bronze, weight: "bold", size: 9pt)[✦], text(style: "italic")[Khổng Tử · Luận Ngữ],
        )
      }
      v(-3pt)
      line(length: 100%, stroke: 0.35pt + ln-stone.lighten(35%))
    },

    footer: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      line(length: 100%, stroke: 0.35pt + ln-stone.lighten(35%))
      v(2pt)
      align(center)[#text(size: 8pt, fill: ln-smoke)[#pg]]
    },
  )

  set text(font: ("Baskerville", "Songti SC"), size: 11pt, lang: "vi", fill: ln-ink)
  set par(justify: true, leading: 0.88em, spacing: 1.4em)
  set list(marker: [—])

  page(fill: ln-silk, margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 2pt + ln-cinnabar,
      fill: none,
    ))
    #place(top + left, dx: 18pt, dy: 18pt, rect(
      width: 100% - 36pt,
      height: 100% - 36pt,
      stroke: 0.5pt + ln-bronze,
      fill: none,
    ))
    #place(top + left, dx: 22pt, dy: 22pt, rect(
      width: 100% - 44pt,
      height: 100% - 44pt,
      stroke: 0.25pt + ln-bamboo.lighten(25%),
      fill: none,
    ))

    #place(top + left, dx: 26pt, dy: 26pt)[#text(fill: ln-bronze, size: 10pt)[✦]]
    #place(top + right, dx: -26pt, dy: 26pt)[#text(fill: ln-bronze, size: 10pt)[✦]]
    #place(bottom + left, dx: 26pt, dy: -26pt)[#text(fill: ln-bronze, size: 10pt)[✦]]
    #place(bottom + right, dx: -26pt, dy: -26pt)[#text(fill: ln-bronze, size: 10pt)[✦]]

    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #v(-1.3em)
        #text(fill: ln-bamboo, size: 9.5pt, tracking: 0.3em, weight: "bold")[
          CỔ THƯ HỌC ĐỂ LÀM NGƯỜI
        ]

        #v(0.5em)
        #_ornament(color: ln-bronze)
        #v(1.5em)

        #text(font: "Baskerville", size: 35pt, fill: ln-cinnabar, weight: "bold", tracking: 0.1em)[#upper(title)]

        #v(0.8em)
        #line(length: 3.5cm, stroke: 1.2pt + ln-bronze)
        #v(0.8em)

        #box(fill: ln-bamboo, inset: (x: 15pt, y: 8pt), radius: 3pt, stroke: 0.8pt + ln-bronze)[
          #text(font: "Baskerville", size: 14pt, fill: ln-sand, weight: "bold", tracking: 0.25em)[#upper(author)]
        ]

        #v(2em)

        #block(width: 100%)[
          #align(center)[
            #text(
              font: "Baskerville",
              size: 13pt,
              fill: ln-stone.darken(10%),
              style: "italic",
              tracking: 0.05em,
            )[#subtitle]
          ]
        ]

        #v(3em)
        #text(font: "Baskerville", size: 9.5pt, fill: ln-smoke, tracking: 0.05em)[#year]

        #v(2.5em)
        #if editor != none {
          text(size: 9.5pt, fill: ln-ink, style: "italic")[
            Biên soạn & Gợi đọc:\
            #text(weight: "bold")[#editor]
          ]
          v(0.4em)
        }

        #v(1.7em)
        #text(fill: ln-bamboo, size: 10.5pt, weight: "medium", style: "italic")[
          "Học mà thường ôn tập, chẳng phải là điều vui sao?"
        ]
        #v(0.3em)
        #text(fill: ln-ink.lighten(18%), size: 9pt)[
          "Người không ai biết tới mà không giận, chẳng phải là quân tử sao?"
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

#let ln-outline() = {
  v(1em)
  align(center)[
    #text(size: 9pt, fill: ln-smoke, tracking: 0.18em)[✦ MỤC LỤC ✦]
  ]
  v(0.8em)
  set outline.entry(fill: repeat[#text(fill: ln-stone.lighten(30%), size: 7pt)[· ]])
  outline(title: none, depth: 2, indent: 1.5em)
  pagebreak(weak: true)
}

#let ln-preface(body, title: "Lời Tựa") = {
  pagebreak(weak: true)
  v(1.4em)
  align(center)[
    #_hairline()
    #v(0.7em)
    #text(font: "Baskerville", size: 14pt, fill: ln-bamboo, weight: "bold")[#title]
    #v(0.4em)
    #_hairline()
  ]
  v(1em)
  body
  v(1.4em)
  _ornament()
  pagebreak(weak: true)
}

#let _part-cnt = counter("ln-part")
#let ln-part(title, subtitle: []) = {
  _part-cnt.step()
  pagebreak(weak: true)
  v(2em)
  page(fill: ln-bamboo.darken(8%), margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 0.5pt + ln-bronze.lighten(20%),
      fill: none,
    ))
    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #context {
          let n = _part-cnt.get().first()
          text(fill: ln-bronze.lighten(25%), size: 9pt, tracking: 0.2em)[PHẦN #n]
        }
        #v(0.8em)
        #text(font: "Baskerville", size: 30pt, fill: ln-sand, weight: "bold", tracking: 0.04em)[#upper(str(title))]
        #v(0.6em)
        #if subtitle != [] {
          text(font: "Baskerville", size: 12pt, fill: ln-bronze.lighten(10%), style: "italic")[#subtitle]
        }
        #v(1em)
        #line(length: 5cm, stroke: 0.7pt + ln-bronze)
      ]
    ])
    #hide(heading(level: 1, outlined: true)[#title])
  ]
  pagebreak(weak: true)
}

#let _thien-cnt = counter("ln-thien")
#let ln-thien(number, title) = {
  _thien-cnt.update(number)
  v(2.4em)
  align(center)[
    #text(font: "Baskerville", size: 10pt, fill: ln-bronze.darken(15%), tracking: 0.1em)[
      THIÊN #_roman(number)
    ]
    #v(0.4em)
    #text(font: "Baskerville", size: 18pt, fill: ln-cinnabar, weight: "bold", tracking: 0.05em)[
      #title
    ]
    #v(0.8em)
    #_hairline(color: ln-bronze.lighten(15%))
  ]
  v(1em)

  hide(heading(level: 2, outlined: true, bookmarked: true)[#number. #title])
}

#let ln-loi(body, source: []) = {
  v(0.35em)
  align(center)[
    #block(
      width: 90%,
      inset: (left: 18pt, right: 18pt, top: 10pt, bottom: 10pt),
      stroke: (top: 0.8pt + ln-bamboo, bottom: 0.8pt + ln-bamboo),
      fill: ln-bamboo.lighten(96%),
      radius: 4pt,
    )[
      #text(size: 8.5pt, weight: "bold", fill: ln-bamboo.darken(8%), tracking: 0.08em)[
        CHÙM NGỮ LỤC MỞ THIÊN
      ]
      #v(0.45em)
      #align(center)[
        #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, style: "italic", fill: ln-bamboo.darken(20%))
        #set par(justify: false, leading: 0.92em, spacing: 0.95em)
        #body
      ]
      #if source != [] {
        v(0.35em)
        align(right)[
          #text(size: 8.8pt, style: "normal", weight: "bold", fill: ln-bamboo)[— #source]
        ]
      }
    ]
  ]
  v(0.4em)
}

#let ln-truyen(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#fbf7ef"),
    stroke: (left: 3pt + ln-bronze),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: ln-bronze.darken(20%), tracking: 0.05em)[
      ✦ MẪU TRUYỆN TIÊU BIỂU
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, fill: ln-ink)
    #set par(leading: 0.9em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.35em)
}

#let ln-nguluc(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#f4efe8"),
    stroke: (left: 3pt + ln-cinnabar),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9.5pt, weight: "bold", fill: ln-cinnabar.darken(20%), tracking: 0.05em)[
      📜 NGUYÊN TÁC KINH ĐIỂN
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, fill: ln-ink)
    #set par(leading: 0.9em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.35em)
}

#let ln-goidoc(body) = {
  import "truyen.typ": ln-truyen-note-for
  import "nguluc.typ": ln-nguluc-note-for
  context {
    let nguluc = ln-nguluc-note-for(_thien-cnt.get().first())
    if nguluc != none { ln-nguluc(nguluc) }
    let story = ln-truyen-note-for(_thien-cnt.get().first())
    if story != none { ln-truyen(story) }
    let words = ln-loi-note-for(_thien-cnt.get().first())
    if words != none { ln-loi(words.at(0), source: words.at(1)) }
  }
  v(0.4em)
  align(center)[
    #block(
      width: 86%,
      fill: rgb("#fbf7ef"),
      stroke: 0.6pt + ln-bronze.lighten(15%),
      inset: (x: 12pt, y: 12pt),
      radius: 4pt,
    )[
      #text(size: 8.3pt, weight: "bold", fill: ln-smoke, tracking: 0.12em)[GỢI ĐỌC NGẮN]
      #v(0.5em)
      #set text(font: ("Baskerville", "Georgia"), size: 10.9pt, fill: ln-ink)
      #set par(leading: 0.9em, spacing: 1.05em, justify: true)
      #body
    ]
  ]
  v(0.4em)
}

#let ln-supham(body) = {
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

#let ln-goihoi(body) = {
  v(0.1em)
  block(
    width: 100%,
    fill: rgb("#fff4df"),
    stroke: (left: 3pt + ln-bronze),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8.8pt, weight: "bold", fill: ln-bronze.darken(22%), tracking: 0.05em)[
      🗣 CÂU HỎI GỢI ĐÀM THOẠI
    ]
    #v(0.35em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.3pt, fill: ln-ink)
    #set par(leading: 0.82em, spacing: 0.95em, justify: true)
    #set list(marker: [•])
    #body
  ]
  v(0.4em)
}

#let ln-binh(body) = {
  v(0.3em)
  block(
    width: 100%,
    fill: ln-cloud,
    stroke: (left: 2.5pt + ln-bamboo),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8pt, weight: "bold", fill: ln-bamboo, tracking: 0.1em)[
      BÌNH GIẢI
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: ln-bamboo.darken(20%))
    #set par(leading: 0.82em, spacing: 1.2em, justify: true)
    #body
  ]
  context {
    let note = ln-supham-note-for(_thien-cnt.get().first())
    if note != none { ln-supham(note) }
    let prompts = ln-goihoi-note-for(_thien-cnt.get().first())
    if prompts != none { ln-goihoi(prompts) } else if note == none { v(0.3em) }
  }
}

#let ln-concept(ten, body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: ln-silk,
    stroke: 0.6pt + ln-bronze.lighten(15%),
    inset: (x: 14pt, y: 12pt),
    radius: 5pt,
  )[
    #text(font: "Baskerville", size: 12.5pt, weight: "bold", fill: ln-cinnabar.darken(8%))[#ten]
    #v(0.3em)
    #line(length: 100%, stroke: 0.4pt + ln-bronze.lighten(25%))
    #v(0.4em)
    #set text(size: 10.5pt, fill: ln-ink)
    #set par(leading: 0.8em)
    #body
  ]
  v(0.4em)
}

#let ln-goimo(body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: ln-bamboo.lighten(92%),
    stroke: (left: 3pt + ln-bamboo),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: ln-bamboo.darken(20%), tracking: 0.05em)[
      GỢI MỞ HÔM NAY
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: ln-bamboo.darken(28%))
    #set par(leading: 0.85em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.4em)
}

#let ln-dongtay(truoc: [], sau: []) = {
  v(0.4em)
  block(
    width: 100%,
    fill: rgb("#f8f6f1"),
    stroke: 0.8pt + ln-bamboo,
    inset: (x: 14pt, y: 12pt),
    radius: 4pt,
  )[
    #text(size: 9.5pt, weight: "bold", fill: ln-bamboo.darken(20%), tracking: 0.05em)[
      ✧ ĐỐI CHIẾU CỔ KIM
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      [
        #text(size: 8.5pt, weight: "bold", fill: ln-smoke)[BÊN CẠNH LUẬN NGỮ:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: ln-ink)
        #set par(leading: 0.8em, justify: true)
        #truoc
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: ln-smoke)[NHÌN SANG HÔM NAY:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: ln-ink)
        #set par(leading: 0.8em, justify: true)
        #sau
      ],
    )
  ]
  v(0.4em)
}

#let ln-trich(body, source: []) = {
  v(0.35em)
  block(
    width: 100%,
    inset: (left: 20pt, right: 12pt, top: 8pt, bottom: 8pt),
    stroke: (left: 2.5pt + ln-bamboo),
    fill: ln-bamboo.lighten(95%),
    radius: (right: 4pt),
  )[
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, style: "italic", fill: ln-bamboo.darken(20%))
    #body
    #if source != [] {
      v(0.3em)
      align(right)[
        #text(size: 9pt, style: "normal", weight: "bold", fill: ln-bamboo)[— #source]
      ]
    }
  ]
  v(0.4em)
}

#let ln-suyngam(body) = {
  v(0.4em)
  align(center)[
    #block(
      width: 88%,
      stroke: (top: 0.6pt + ln-cinnabar.lighten(45%), bottom: 0.6pt + ln-cinnabar.lighten(45%)),
      inset: (x: 0pt, y: 13pt),
    )[
      #set text(font: ("Baskerville", "Georgia"), size: 11pt, style: "italic", fill: ln-cinnabar.darken(8%))
      #body
    ]
  ]
  v(0.4em)
}

#let ln-section(title) = {
  v(0.8em)
  text(font: "Baskerville", size: 10.5pt, weight: "bold", fill: ln-bamboo, tracking: 0.06em)[#upper(title)]
  v(0.15em)
  line(length: 2.5cm, stroke: 1pt + ln-bronze)
  v(0.5em)
}
