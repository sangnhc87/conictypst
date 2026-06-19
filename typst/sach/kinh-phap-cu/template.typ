// ╔══════════════════════════════════════════════════════════════════╗
// ║          TEMPLATE: KINH PHÁP CÚ — BOOK DESIGN                  ║
// ║          Tĩnh, sáng, ấm; nghiêng về phẩm hạnh và chánh niệm    ║
// ╚══════════════════════════════════════════════════════════════════╝

#import "supham.typ": pc-supham-note-for
#import "goihoi.typ": pc-goihoi-note-for
#import "trich.typ": pc-trich-note-for

// ══════════════════════════════════════════════════════
// §1. BẢN MÀU
// ══════════════════════════════════════════════════════
#let pc-ink = rgb("#2a221c")
#let pc-saffron = rgb("#c97a2b")
#let pc-amber = rgb("#b48a45")
#let pc-bodhi = rgb("#53704b")
#let pc-lake = rgb("#496070")
#let pc-sand = rgb("#f6efe3")
#let pc-silk = rgb("#efe4d0")
#let pc-cloud = rgb("#eef4ec")
#let pc-smoke = rgb("#6f665c")
#let pc-stone = rgb("#8b8073")

// ══════════════════════════════════════════════════════
// §2. HÀM NỘI BỘ
// ══════════════════════════════════════════════════════
#let _hairline(color: pc-stone.lighten(35%)) = line(length: 100%, stroke: 0.4pt + color)

#let _ornament(color: pc-amber) = align(center)[
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
  )
  if n >= 1 and n <= r.len() { r.at(n - 1) } else { str(n) }
}

// ══════════════════════════════════════════════════════
// §3. SETUP TOÀN CỤC
// ══════════════════════════════════════════════════════
#let pc-book(
  title: "KINH PHÁP CÚ",
  subtitle: "Tuyển kệ ngắn, giải nghĩa và gợi đọc",
  author: "Đức Phật",
  editor: "Biên soạn mới",
  year: "Thế kỷ V TCN · Biên soạn 2026",
  body,
) = {
  set document(title: title, author: author)

  set page(
    paper: "a5",
    margin: (top: 2.3cm, bottom: 2.2cm, inside: 2.1cm, outside: 1.7cm),
    fill: pc-sand,

    header: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      set text(size: 7.5pt, fill: pc-smoke, font: "Baskerville")
      if calc.odd(pg) {
        grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(style: "italic")[#title], text(fill: pc-amber, weight: "bold", size: 9pt)[✦],
        )
      } else {
        grid(
          columns: (auto, 1fr),
          align: (left + horizon, right + horizon),
          text(fill: pc-amber, weight: "bold", size: 9pt)[✦], text(style: "italic")[Đức Phật · Kinh Pháp Cú],
        )
      }
      v(-3pt)
      line(length: 100%, stroke: 0.35pt + pc-stone.lighten(35%))
    },

    footer: context {
      let pg = counter(page).get().first()
      if pg <= 2 { return none }
      line(length: 100%, stroke: 0.35pt + pc-stone.lighten(35%))
      v(2pt)
      align(center)[#text(size: 8pt, fill: pc-smoke)[#pg]]
    },
  )

  set text(font: ("Baskerville", "Songti SC"), size: 11pt, lang: "vi", fill: pc-ink)
  set par(justify: true, leading: 0.88em, spacing: 1.4em)
  set list(marker: [—])

  page(fill: pc-silk, margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 2pt + pc-saffron,
      fill: none,
    ))
    #place(top + left, dx: 18pt, dy: 18pt, rect(
      width: 100% - 36pt,
      height: 100% - 36pt,
      stroke: 0.5pt + pc-amber,
      fill: none,
    ))
    #place(top + left, dx: 22pt, dy: 22pt, rect(
      width: 100% - 44pt,
      height: 100% - 44pt,
      stroke: 0.25pt + pc-bodhi.lighten(28%),
      fill: none,
    ))

    #place(top + left, dx: 26pt, dy: 26pt)[#text(fill: pc-amber, size: 10pt)[✦]]
    #place(top + right, dx: -26pt, dy: 26pt)[#text(fill: pc-amber, size: 10pt)[✦]]
    #place(bottom + left, dx: 26pt, dy: -26pt)[#text(fill: pc-amber, size: 10pt)[✦]]
    #place(bottom + right, dx: -26pt, dy: -26pt)[#text(fill: pc-amber, size: 10pt)[✦]]

    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #v(-1.3em)
        #text(fill: pc-bodhi, size: 9.5pt, tracking: 0.3em, weight: "bold")[
          CỔ THƯ TỈNH THỨC VÀ TỪ BI
        ]

        #v(0.5em)
        #_ornament(color: pc-amber)
        #v(1.5em)

        #text(font: "Baskerville", size: 35pt, fill: pc-saffron, weight: "bold", tracking: 0.1em)[#upper(title)]

        #v(0.8em)
        #line(length: 3.5cm, stroke: 1.2pt + pc-amber)
        #v(0.8em)

        #box(fill: pc-bodhi, inset: (x: 15pt, y: 8pt), radius: 3pt, stroke: 0.8pt + pc-amber)[
          #text(font: "Baskerville", size: 14pt, fill: pc-sand, weight: "bold", tracking: 0.25em)[#upper(author)]
        ]

        #v(2em)

        #block(width: 100%)[
          #align(center)[
            #text(
              font: "Baskerville",
              size: 13pt,
              fill: pc-stone.darken(10%),
              style: "italic",
              tracking: 0.05em,
            )[#subtitle]
          ]
        ]

        #v(3em)
        #text(font: "Baskerville", size: 9.5pt, fill: pc-smoke, tracking: 0.05em)[#year]

        #v(2.5em)
        #if editor != none {
          text(size: 9.5pt, fill: pc-ink, style: "italic")[
            Biên soạn & Gợi đọc:\
            #text(weight: "bold")[#editor]
          ]
          v(0.4em)
        }

        #v(1.7em)
        #text(fill: pc-lake, size: 10.5pt, weight: "medium", style: "italic")[
          "Tâm dẫn đầu các pháp, tâm làm chủ, tâm tạo tác."
        ]
        #v(0.3em)
        #text(fill: pc-ink.lighten(18%), size: 9pt)[
          "Nếu nói hay làm với tâm thanh tịnh, an lạc sẽ theo như bóng không rời hình."
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

#let pc-outline() = {
  v(1em)
  align(center)[
    #text(size: 9pt, fill: pc-smoke, tracking: 0.18em)[✦ MỤC LỤC ✦]
  ]
  v(0.8em)
  set outline.entry(fill: repeat[#text(fill: pc-stone.lighten(30%), size: 7pt)[· ]])
  outline(title: none, depth: 2, indent: 1.5em)
  pagebreak(weak: true)
}

#let pc-preface(body, title: "Lời Tựa") = {
  pagebreak(weak: true)
  v(1.4em)
  align(center)[
    #_hairline()
    #v(0.7em)
    #text(font: "Baskerville", size: 14pt, fill: pc-bodhi, weight: "bold")[#title]
    #v(0.4em)
    #_hairline()
  ]
  v(1em)
  body
  v(1.4em)
  _ornament()
  pagebreak(weak: true)
}

#let _part-cnt = counter("pc-part")
#let pc-part(title, subtitle: []) = {
  _part-cnt.step()
  pagebreak(weak: true)
  v(2em)
  page(fill: pc-bodhi.darken(8%), margin: 0cm)[
    #place(top + left, dx: 14pt, dy: 14pt, rect(
      width: 100% - 28pt,
      height: 100% - 28pt,
      stroke: 0.5pt + pc-amber.lighten(20%),
      fill: none,
    ))
    #place(top + left, dx: 30pt, dy: 30pt, block(width: 100% - 60pt, height: 100% - 60pt)[
      #align(center + horizon)[
        #context {
          let n = _part-cnt.get().first()
          text(fill: pc-amber.lighten(25%), size: 9pt, tracking: 0.2em)[PHẦN #n]
        }
        #v(0.8em)
        #text(font: "Baskerville", size: 30pt, fill: pc-sand, weight: "bold", tracking: 0.04em)[#upper(str(title))]
        #v(0.6em)
        #if subtitle != [] {
          text(font: "Baskerville", size: 12pt, fill: pc-amber.lighten(10%), style: "italic")[#subtitle]
        }
        #v(1em)
        #line(length: 5cm, stroke: 0.7pt + pc-amber)
      ]
    ])
    #hide(heading(level: 1, outlined: true)[#title])
  ]
  pagebreak(weak: true)
}

#let _pham-cnt = counter("pc-pham")
#let pc-pham(number, title) = {
  _pham-cnt.update(number)
  v(2.4em)
  align(center)[
    #text(font: "Baskerville", size: 10pt, fill: pc-amber.darken(15%), tracking: 0.1em)[
      PHẨM #_roman(number)
    ]
    #v(0.4em)
    #text(font: "Baskerville", size: 18pt, fill: pc-saffron, weight: "bold", tracking: 0.05em)[
      #title
    ]
    #v(0.8em)
    #_hairline(color: pc-amber.lighten(15%))
  ]
  v(1em)

  hide(heading(level: 2, outlined: true, bookmarked: true)[#number. #title])
}

#let pc-truyen(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#fbf6ee"),
    stroke: (left: 3pt + pc-amber),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: pc-amber.darken(20%), tracking: 0.06em)[
      ✦ MẪU TRUYỆN TIÊU BIỂU
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.7pt, fill: pc-ink)
    #set par(leading: 0.9em, spacing: 1.15em, justify: true)
    #body
  ]
  v(0.35em)
}

#let pc-trich(body, source: []) = {
  v(0.35em)
  align(center)[
    #block(
      width: 90%,
      inset: (left: 18pt, right: 18pt, top: 10pt, bottom: 10pt),
      stroke: (top: 0.8pt + pc-bodhi, bottom: 0.8pt + pc-bodhi),
      fill: pc-bodhi.lighten(96%),
      radius: 4pt,
    )[
      #text(size: 8.5pt, weight: "bold", fill: pc-bodhi.darken(8%), tracking: 0.08em)[
        CHÙM KỆ MỞ PHẨM
      ]
      #v(0.45em)
      #align(center)[
        #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, style: "italic", fill: pc-bodhi.darken(20%))
        #set par(justify: false, leading: 0.92em, spacing: 0.95em)
        #body
      ]
      #if source != [] {
        v(0.35em)
        align(right)[
          #text(size: 8.8pt, style: "normal", weight: "bold", fill: pc-bodhi)[— #source]
        ]
      }
    ]
  ]
  v(0.4em)
}

#let pc-phapcu(body) = {
  v(0.35em)
  block(
    width: 100%,
    fill: rgb("#f4efe8"),
    stroke: (left: 3pt + pc-saffron),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9.5pt, weight: "bold", fill: pc-saffron.darken(20%), tracking: 0.05em)[
      📜 NGUYÊN TÁC KINH ĐIỂN
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.8pt, fill: pc-ink, style: "italic")
    #set par(leading: 0.9em, spacing: 1.2em, justify: false)
    #body
  ]
  v(0.35em)
}

#let pc-tomluoc(body) = {
  import "truyen.typ": pc-truyen-note-for
  import "phapcu.typ": pc-phapcu-note-for
  context {
    let verse = pc-trich-note-for(_pham-cnt.get().first())
    if verse != none { pc-trich(verse.at(0), source: verse.at(1)) }
    let phapcu = pc-phapcu-note-for(_pham-cnt.get().first())
    if phapcu != none { pc-phapcu(phapcu) }
    let story = pc-truyen-note-for(_pham-cnt.get().first())
    if story != none { pc-truyen(story) }
  }
  v(0.4em)
  align(center)[
    #block(
      width: 86%,
      fill: rgb("#fcf7ef"),
      stroke: 0.6pt + pc-amber.lighten(15%),
      inset: (x: 12pt, y: 12pt),
      radius: 4pt,
    )[
      #text(size: 8.3pt, weight: "bold", fill: pc-smoke, tracking: 0.12em)[GỢI ĐỌC NGẮN]
      #v(0.5em)
      #set text(font: ("Baskerville", "Georgia"), size: 10.9pt, fill: pc-lake.darken(8%))
      #set par(leading: 0.9em, spacing: 1.05em, justify: true)
      #body
    ]
  ]
  v(0.4em)
}

#let pc-supham(body) = {
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

#let pc-goihoi(body) = {
  v(0.1em)
  block(
    width: 100%,
    fill: rgb("#fff5dd"),
    stroke: (left: 3pt + pc-amber),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8.8pt, weight: "bold", fill: pc-amber.darken(22%), tracking: 0.05em)[
      🗣 CÂU HỎI GỢI ĐÀM THOẠI
    ]
    #v(0.35em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.3pt, fill: pc-ink)
    #set par(leading: 0.82em, spacing: 0.95em, justify: true)
    #set list(marker: [•])
    #body
  ]
  v(0.4em)
}

#let pc-binh(body) = {
  v(0.3em)
  block(
    width: 100%,
    fill: pc-cloud,
    stroke: (left: 2.5pt + pc-lake),
    inset: (left: 14pt, right: 12pt, top: 11pt, bottom: 11pt),
    radius: (right: 4pt),
  )[
    #text(size: 8pt, weight: "bold", fill: pc-lake, tracking: 0.1em)[
      BÌNH GIẢI
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: pc-lake.darken(20%))
    #set par(leading: 0.82em, spacing: 1.2em, justify: true)
    #body
  ]
  context {
    let note = pc-supham-note-for(_pham-cnt.get().first())
    if note != none { pc-supham(note) }
    let prompts = pc-goihoi-note-for(_pham-cnt.get().first())
    if prompts != none { pc-goihoi(prompts) } else if note == none { v(0.3em) }
  }
}

#let pc-concept(ten, body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: pc-silk,
    stroke: 0.6pt + pc-amber.lighten(15%),
    inset: (x: 14pt, y: 12pt),
    radius: 5pt,
  )[
    #text(font: "Baskerville", size: 12.5pt, weight: "bold", fill: pc-bodhi.darken(10%))[#ten]
    #v(0.3em)
    #line(length: 100%, stroke: 0.4pt + pc-amber.lighten(25%))
    #v(0.4em)
    #set text(size: 10.5pt, fill: pc-ink)
    #set par(leading: 0.8em)
    #body
  ]
  v(0.4em)
}

#let pc-goimo(body) = {
  v(0.4em)
  block(
    width: 100%,
    fill: pc-bodhi.lighten(92%),
    stroke: (left: 3pt + pc-bodhi),
    inset: (left: 14pt, right: 12pt, top: 12pt, bottom: 12pt),
    radius: (right: 4pt),
  )[
    #text(size: 9pt, weight: "bold", fill: pc-bodhi.darken(20%), tracking: 0.05em)[
      GỢI MỞ HÔM NAY
    ]
    #v(0.4em)
    #set text(font: ("Baskerville", "Georgia"), size: 10.5pt, fill: pc-bodhi.darken(28%))
    #set par(leading: 0.85em, spacing: 1.2em, justify: true)
    #body
  ]
  v(0.4em)
}

#let pc-dongtay(truoc: [], sau: []) = {
  v(0.4em)
  block(
    width: 100%,
    fill: rgb("#f8f6f1"),
    stroke: 0.8pt + pc-bodhi,
    inset: (x: 14pt, y: 12pt),
    radius: 4pt,
  )[
    #text(size: 9.5pt, weight: "bold", fill: pc-bodhi.darken(20%), tracking: 0.05em)[
      ✧ ĐỐI CHIẾU CỔ KIM
    ]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      [
        #text(size: 8.5pt, weight: "bold", fill: pc-smoke)[BÊN CẠNH PHÁP CÚ:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: pc-ink)
        #set par(leading: 0.8em, justify: true)
        #truoc
      ],
      [
        #text(size: 8.5pt, weight: "bold", fill: pc-smoke)[NHÌN SANG HÔM NAY:]
        #v(0.3em)
        #set text(font: ("Baskerville", "Georgia"), size: 10pt, fill: pc-ink)
        #set par(leading: 0.8em, justify: true)
        #sau
      ],
    )
  ]
  v(0.4em)
}

#let pc-suyngam(body) = {
  v(0.4em)
  align(center)[
    #block(
      width: 88%,
      stroke: (top: 0.6pt + pc-lake.lighten(40%), bottom: 0.6pt + pc-lake.lighten(40%)),
      inset: (x: 0pt, y: 13pt),
    )[
      #set text(font: ("Baskerville", "Georgia"), size: 11pt, style: "italic", fill: pc-lake)
      #body
    ]
  ]
  v(0.4em)
}

#let pc-section(title) = {
  v(0.8em)
  text(font: "Baskerville", size: 10.5pt, weight: "bold", fill: pc-bodhi, tracking: 0.06em)[#upper(title)]
  v(0.15em)
  line(length: 2.5cm, stroke: 1pt + pc-amber)
  v(0.5em)
}
