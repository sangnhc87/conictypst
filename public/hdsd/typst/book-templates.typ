// ================================================================
// SANG-MATH BOOK TEMPLATES v1.0.0
// Bộ giao diện sách / SGK / chuyên đề / workbook dùng chung.
// ================================================================

#let _book-palettes = (
  sgk-modern: (
    accent: rgb("#2563eb"),
    accent-2: rgb("#0f766e"),
    cover: rgb("#eff6ff"),
    ink: rgb("#172033"),
    soft: rgb("#dbeafe"),
    name: "SGK Modern",
    look: "clean",
  ),
  vdc-elite: (
    accent: rgb("#7e22ce"),
    accent-2: rgb("#be185d"),
    cover: rgb("#faf5ff"),
    ink: rgb("#1f1b2e"),
    soft: rgb("#ede9fe"),
    name: "VDC Elite",
    look: "elite",
  ),
  workbook-jade: (
    accent: rgb("#059669"),
    accent-2: rgb("#0e7490"),
    cover: rgb("#ecfdf5"),
    ink: rgb("#12332b"),
    soft: rgb("#d1fae5"),
    name: "Workbook Jade",
    look: "workbook",
  ),
  solution-crimson: (
    accent: rgb("#be123c"),
    accent-2: rgb("#ea580c"),
    cover: rgb("#fff1f2"),
    ink: rgb("#34151d"),
    soft: rgb("#ffe4e6"),
    name: "Solution Crimson",
    look: "solution",
  ),
  lesson-amber: (
    accent: rgb("#b45309"),
    accent-2: rgb("#2563eb"),
    cover: rgb("#fffbeb"),
    ink: rgb("#302113"),
    soft: rgb("#fef3c7"),
    name: "Lesson Amber",
    look: "lesson",
  ),
  olympiad-indigo: (
    accent: rgb("#4338ca"),
    accent-2: rgb("#0f766e"),
    cover: rgb("#eef2ff"),
    ink: rgb("#15172f"),
    soft: rgb("#e0e7ff"),
    name: "Olympiad Indigo",
    look: "notes",
  ),
  magazine-coral: (
    accent: rgb("#ea580c"),
    accent-2: rgb("#0e7490"),
    cover: rgb("#fff7ed"),
    ink: rgb("#2d1b12"),
    soft: rgb("#fed7aa"),
    name: "Magazine Coral",
    look: "magazine",
  ),
  blackboard-green: (
    accent: rgb("#16a34a"),
    accent-2: rgb("#f59e0b"),
    cover: rgb("#052e24"),
    ink: rgb("#10251c"),
    soft: rgb("#dcfce7"),
    name: "Blackboard Green",
    look: "blackboard",
  ),
  minimal-graphite: (
    accent: rgb("#334155"),
    accent-2: rgb("#64748b"),
    cover: rgb("#f8fafc"),
    ink: rgb("#111827"),
    soft: rgb("#e2e8f0"),
    name: "Minimal Graphite",
    look: "minimal",
  ),
  handout-sky: (
    accent: rgb("#0284c7"),
    accent-2: rgb("#0f766e"),
    cover: rgb("#f0f9ff"),
    ink: rgb("#123044"),
    soft: rgb("#e0f2fe"),
    name: "Handout Sky",
    look: "handout",
  ),
  research-slate: (
    accent: rgb("#475569"),
    accent-2: rgb("#7c3aed"),
    cover: rgb("#f1f5f9"),
    ink: rgb("#0f172a"),
    soft: rgb("#e2e8f0"),
    name: "Research Slate",
    look: "research",
  ),
  lotus-study: (
    accent: rgb("#be185d"),
    accent-2: rgb("#059669"),
    cover: rgb("#fdf2f8"),
    ink: rgb("#311827"),
    soft: rgb("#fce7f3"),
    name: "Lotus Study",
    look: "lotus",
  ),
)

#let book-palette(theme) = {
  _book-palettes.at(theme, default: _book-palettes.sgk-modern)
}

#let _smallcaps(body, fill: luma(80)) = text(size: 8.5pt, weight: "bold", fill: fill)[#upper(body)]

#let _rule(accent) = line(length: 100%, stroke: 0.8pt + accent.lighten(45%))

#let _cover(
  title,
  palette,
  subtitle: none,
  author: none,
  institution: none,
  grade: none,
  subject: none,
  year: none,
  note: none,
) = {
  pagebreak(weak: true)
  let look = palette.look
  if look == "elite" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: palette.ink, inset: 34pt, radius: 0pt)[
        #v(12pt)
        #grid(columns: (1fr, auto), align: (left, right),
          _smallcaps([SANG-MATH ELITE SERIES], fill: palette.accent.lighten(35%)),
          box(fill: palette.accent, inset: (x: 10pt, y: 5pt), radius: 999pt)[#text(fill: white, size: 8pt, weight: "bold")[VDC]]
        )
        #v(56pt)
        #block(width: 82%, stroke: (left: 5pt + palette.accent), inset: (left: 18pt, y: 4pt))[
          #text(size: 38pt, weight: "bold", fill: white)[#title]
          #if subtitle != none [#v(8pt)#text(size: 14pt, fill: palette.accent.lighten(45%))[#subtitle]]
        ]
        #v(26pt)
        #grid(columns: (1fr, 1fr), gutter: 10pt,
          box(fill: palette.accent.transparentize(76%), inset: 12pt, radius: 6pt)[#text(fill: white)[#subject · #grade]],
          box(fill: palette.accent-2.transparentize(74%), inset: 12pt, radius: 6pt)[#text(fill: white)[#author · #year]],
        )
        #v(1fr)
        #if note != none [#block(width: 100%, fill: palette.accent, inset: 14pt, radius: 8pt)[#text(fill: white, size: 10pt)[#note]]]
        #v(16pt)
        #text(size: 9pt, fill: white.transparentize(32%))[#institution]
      ]
    ]
  } else if look == "workbook" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: white, inset: 28pt, stroke: 1pt + palette.accent.lighten(50%))[
        #block(width: 100%, fill: palette.cover, inset: 18pt, radius: 10pt)[
          #_smallcaps([WORKBOOK · HỌC SINH], fill: palette.accent)
          #v(22pt)
          #text(size: 34pt, weight: "bold", fill: palette.accent)[#title]
          #if subtitle != none [#v(6pt)#text(size: 13pt, fill: palette.ink)[#subtitle]]
        ]
        #v(28pt)
        #for i in range(8) {
          line(length: 100%, stroke: 0.55pt + palette.accent.lighten(62%))
          v(18pt)
        }
        #v(1fr)
        #grid(columns: (1fr, 1fr), gutter: 12pt,
          box(stroke: 0.7pt + palette.accent.lighten(45%), inset: 12pt, radius: 6pt)[Tên học sinh:#v(18pt)],
          box(stroke: 0.7pt + palette.accent.lighten(45%), inset: 12pt, radius: 6pt)[Lớp:#v(18pt)],
        )
        #v(14pt)
        #text(size: 9pt, fill: palette.ink.lighten(38%))[#institution · #year]
      ]
    ]
  } else if look == "lesson" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: palette.cover, inset: 30pt)[
        #grid(columns: (36%, 1fr), gutter: 22pt,
          block(fill: palette.accent, height: 100%, inset: 18pt, radius: 8pt)[
            #text(fill: white, size: 11pt, weight: "bold")[GIÁO ÁN]
            #v(1fr)
            #text(fill: white, size: 20pt, weight: "bold")[#subject]
            #text(fill: white.transparentize(20%), size: 11pt)[#grade · #year]
          ],
          [
            #v(34pt)
            #text(size: 34pt, weight: "bold", fill: palette.ink)[#title]
            #if subtitle != none [#v(8pt)#text(size: 14pt, fill: palette.accent)[#subtitle]]
            #v(28pt)
            #block(fill: white, stroke: 0.8pt + palette.accent.lighten(48%), inset: 14pt, radius: 8pt)[
              #text(weight: "bold", fill: palette.accent)[#author]
              #linebreak()
              #text(size: 9.5pt)[#institution]
            ]
          ],
        )
      ]
    ]
  } else if look == "magazine" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: white, inset: 0pt)[
        #block(width: 100%, height: 34%, fill: palette.accent, inset: 28pt)[
          #text(fill: white, size: 11pt, weight: "bold")[SANG-MATH MAGAZINE]
          #v(1fr)
          #text(fill: white, size: 30pt, weight: "bold")[#title]
        ]
        #block(width: 100%, inset: 28pt)[
          #if subtitle != none [#text(size: 16pt, fill: palette.accent)[#subtitle]]
          #v(24pt)
          #grid(columns: (2fr, 1fr), gutter: 18pt,
            block(fill: palette.cover, inset: 18pt, radius: 10pt)[#text(size: 11pt)[#if note != none [#note] else [Tài liệu học tập theo phong cách tạp chí: nhiều điểm nhấn, dễ đọc, hợp chuyên đề ngắn.]]],
            block(fill: palette.ink, inset: 16pt, radius: 10pt)[#text(fill: white, weight: "bold")[#subject #linebreak()#grade #linebreak()#year]],
          )
          #v(1fr)
          #text(size: 9pt, fill: palette.ink.lighten(40%))[#author · #institution]
        ]
      ]
    ]
  } else if look == "blackboard" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: palette.cover, inset: 32pt)[
        #block(width: 100%, height: 100%, stroke: 1.2pt + white.transparentize(35%), inset: 24pt, radius: 6pt)[
          #text(fill: palette.accent-2, size: 10pt, weight: "bold")[BLACKBOARD NOTES]
          #v(55pt)
          #text(fill: white, size: 34pt, weight: "bold")[#title]
          #if subtitle != none [#v(10pt)#text(fill: white.transparentize(20%), size: 15pt)[#subtitle]]
          #v(1fr)
          #text(fill: white.transparentize(18%))[#author · #subject · #grade]
        ]
      ]
    ]
  } else if look == "minimal" or look == "research" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: white, inset: 36pt)[
        #v(24pt)
        #line(length: 100%, stroke: 1.4pt + palette.accent)
        #v(34pt)
        #text(size: 33pt, weight: "bold", fill: palette.ink)[#title]
        #if subtitle != none [#v(10pt)#text(size: 13pt, fill: palette.accent)[#subtitle]]
        #v(36pt)
        #block(width: 54%, inset: (x: 0pt, y: 10pt), stroke: (top: 0.7pt + palette.accent.lighten(45%), bottom: 0.7pt + palette.accent.lighten(45%)))[
          #text(size: 10pt)[#author #linebreak()#institution #linebreak()#subject · #grade · #year]
        ]
        #v(1fr)
        #if note != none [#text(size: 9pt, fill: palette.ink.lighten(45%))[#note]]
      ]
    ]
  } else if look == "handout" or look == "lotus" {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: palette.cover, inset: 30pt)[
        #grid(columns: (1fr, 120pt), gutter: 20pt,
          [
            #_smallcaps([HANDOUT · SANG-MATH], fill: palette.accent)
            #v(34pt)
            #text(size: 35pt, weight: "bold", fill: palette.ink)[#title]
            #if subtitle != none [#v(8pt)#text(size: 14pt, fill: palette.accent)[#subtitle]]
          ],
          block(fill: palette.accent, height: 100%, radius: 12pt, inset: 14pt)[
            #text(fill: white, size: 20pt, weight: "bold")[#subject]
            #v(1fr)
            #text(fill: white.transparentize(18%), size: 10pt)[#grade #linebreak()#year]
          ],
        )
        #v(1fr)
        #block(fill: white, stroke: 0.7pt + palette.accent.lighten(50%), inset: 12pt, radius: 8pt)[
          #text(weight: "bold", fill: palette.accent)[#author]
          #linebreak()
          #text(size: 9pt)[#institution]
        ]
      ]
    ]
  } else {
    align(center + horizon)[
      #block(width: 100%, height: 100%, fill: palette.cover, inset: 34pt, radius: 0pt)[
        #v(20pt)
        #align(left)[#_smallcaps([SANG-MATH BOOK TEMPLATE], fill: palette.accent)]
        #v(42pt)
        #align(left)[
          #text(size: if look == "notes" { 32pt } else { 36pt }, weight: "bold", fill: palette.ink)[#title]
          #if subtitle != none [
            #v(8pt)
            #text(size: 15pt, fill: palette.accent)[#subtitle]
          ]
        ]
        #v(28pt)
        #block(width: if look == "notes" { 100% } else { 72% }, fill: white, stroke: 0.8pt + palette.accent.lighten(55%), inset: 16pt, radius: if look == "notes" { 2pt } else { 8pt })[
          #grid(columns: (1fr, 1fr), gutter: 10pt,
            [#_smallcaps([Môn học], fill: palette.accent)#linebreak()#text(weight: "bold")[#subject]],
            [#_smallcaps([Khối lớp], fill: palette.accent)#linebreak()#text(weight: "bold")[#grade]],
            [#_smallcaps([Tác giả], fill: palette.accent)#linebreak()#text(weight: "bold")[#author]],
            [#_smallcaps([Năm học], fill: palette.accent)#linebreak()#text(weight: "bold")[#year]],
          )
        ]
        #v(1fr)
        #if note != none [
          #block(width: 100%, fill: palette.accent, inset: 14pt, radius: 8pt)[
            #text(fill: white, size: 10pt)[#note]
          ]
        ]
        #v(18pt)
        #align(left)[#text(size: 9pt, fill: palette.ink.lighten(35%))[#institution]]
      ]
    ]
  }
  pagebreak()
}

#let book-theme(
  body,
  theme: "sgk-modern",
  title: "TÀI LIỆU TOÁN",
  subtitle: none,
  author: "GV Nguyễn Văn Sang",
  institution: "ConicTypst",
  grade: "THPT",
  subject: "Toán",
  year: "2025-2026",
  cover-note: none,
  toc: true,
  paper: "a4",
  margin: (x: 20mm, y: 18mm),
  body-font: "New Computer Modern",
  heading-font: "New Computer Modern",
) = {
  let p = book-palette(theme)
  set page(paper: paper, margin: margin, numbering: "1", fill: white)
  set text(font: body-font, size: 11pt, fill: p.ink)
  set par(leading: 0.65em, first-line-indent: 0pt, justify: true)
  show strong: it => text(fill: p.accent, weight: "bold")[#it.body]
  show heading: it => {
    if it.level == 1 {
      text(font: heading-font, size: 22pt, weight: "bold", fill: p.accent)[#it.body]
    } else if it.level == 2 {
      text(font: heading-font, size: 16pt, weight: "bold", fill: p.accent.darken(5%))[#it.body]
    } else {
      text(font: heading-font, size: 12.5pt, weight: "bold", fill: p.accent-2)[#it.body]
    }
  }

  _cover(
    title,
    p,
    subtitle: subtitle,
    author: author,
    institution: institution,
    grade: grade,
    subject: subject,
    year: year,
    note: cover-note,
  )

  if toc {
    align(center)[#text(size: 22pt, weight: "bold", fill: p.accent)[Mục lục]]
    v(8pt)
    outline(title: none)
    pagebreak()
  }

  body
}

#let _hidden-heading(level, title) = hide(heading(level: level, outlined: true)[#title])

#let book-chapter(title, number: none, kicker: [Chương], theme: "sgk-modern") = {
  let p = book-palette(theme)
  _hidden-heading(1, title)
  if p.look == "elite" {
    block(width: 100%, fill: p.ink, inset: 18pt, radius: 0pt, stroke: (bottom: 3pt + p.accent))[
      #text(size: 9pt, weight: "bold", fill: p.accent.lighten(35%))[#upper(kicker) #if number != none [#number]]
      #v(5pt)
      #text(size: 25pt, weight: "bold", fill: white)[#title]
    ]
  } else if p.look == "workbook" {
    grid(columns: (auto, 1fr), gutter: 12pt, align: (left + horizon, left + horizon),
      box(width: 42pt, height: 42pt, fill: p.accent, radius: 999pt)[#align(center + horizon)[#text(fill: white, weight: "bold")[#if number == none [#kicker] else [#number]]]],
      block(width: 100%, fill: p.cover, stroke: (bottom: 1pt + p.accent.lighten(45%)), inset: 12pt)[
        #text(size: 22pt, weight: "bold", fill: p.accent)[#title]
      ],
    )
  } else if p.look == "lesson" {
    block(width: 100%, fill: p.cover, stroke: 0.9pt + p.accent.lighten(45%), inset: 14pt, radius: 8pt)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        text(size: 21pt, weight: "bold", fill: p.ink)[#title],
        box(fill: p.accent, inset: (x: 12pt, y: 7pt), radius: 6pt)[#text(fill: white, weight: "bold")[#kicker #if number != none [#number]]],
      )
    ]
  } else if p.look == "notes" {
    block(width: 100%, inset: (x: 0pt, y: 10pt), stroke: (top: 1.2pt + p.accent, bottom: 1.2pt + p.accent))[
      #text(size: 10pt, fill: p.accent, weight: "bold")[#kicker #if number != none [#number]]
      #h(1em)
      #text(size: 23pt, weight: "bold", fill: p.ink)[#title]
    ]
  } else if p.look == "magazine" {
    grid(columns: (1fr, 72pt), gutter: 14pt,
      block(fill: p.cover, inset: 16pt, radius: 10pt)[#text(size: 24pt, weight: "bold", fill: p.accent)[#title]],
      block(fill: p.accent, inset: 12pt, radius: 10pt)[#align(center + horizon)[#text(fill: white, size: 18pt, weight: "bold")[#if number == none [#kicker] else [#number]]]],
    )
  } else if p.look == "blackboard" {
    block(width: 100%, fill: p.cover, inset: 16pt, radius: 6pt)[
      #text(size: 10pt, fill: p.accent-2, weight: "bold")[#kicker #if number != none [#number]]
      #v(5pt)
      #text(size: 24pt, weight: "bold", fill: white)[#title]
    ]
  } else if p.look == "minimal" or p.look == "research" {
    block(width: 100%, inset: (x: 0pt, y: 8pt), stroke: (left: 5pt + p.accent))[
      #h(10pt)#text(size: 24pt, weight: "bold", fill: p.ink)[#if number != none [#number. ]#title]
    ]
  } else {
    block(width: 100%, fill: p.accent, inset: 18pt, radius: 9pt)[
      #grid(columns: (auto, 1fr), gutter: 16pt, align: (left + horizon, left + horizon),
        box(fill: white, inset: (x: 14pt, y: 10pt), radius: 7pt)[
          #text(weight: "bold", fill: p.accent)[#kicker #if number != none [ #number]]
        ],
        [
          #text(size: 24pt, weight: "bold", fill: white)[#title]
          #v(4pt)
          #line(length: 100%, stroke: 0.8pt + white.transparentize(35%))
        ],
      )
    ]
  }
  v(14pt)
}

#let book-lesson(title, number: none, theme: "sgk-modern") = {
  let p = book-palette(theme)
  _hidden-heading(2, title)
  if p.look == "workbook" {
    block(width: 100%, fill: white, stroke: 0.7pt + p.accent.lighten(45%), inset: 12pt, radius: 4pt)[
      #text(size: 15pt, weight: "bold", fill: p.accent)[Phiếu #if number != none [#number · ]#title]
      #v(5pt)
      #for i in range(2) { line(length: 100%, stroke: 0.45pt + p.accent.lighten(65%)); v(10pt) }
    ]
  } else if p.look == "solution" {
    block(width: 100%, fill: p.accent, inset: 12pt, radius: 999pt)[
      #text(size: 15pt, weight: "bold", fill: white)[Lời giải #if number != none [#number · ]#title]
    ]
  } else if p.look == "lesson" {
    grid(columns: (auto, 1fr), gutter: 10pt,
      box(fill: p.accent, inset: 10pt, radius: 6pt)[#text(fill: white, weight: "bold")[Tiết #if number != none [#number] else [--]]],
      block(fill: p.soft, inset: 12pt, radius: 6pt)[#text(size: 15pt, weight: "bold", fill: p.ink)[#title]],
    )
  } else if p.look == "magazine" or p.look == "handout" or p.look == "lotus" {
    block(width: 100%, fill: p.accent.lighten(92%), inset: 12pt, radius: 12pt)[
      #text(size: 15pt, weight: "bold", fill: p.accent.darken(8%))[#if number != none [Bài #number · ]#title]
    ]
  } else if p.look == "blackboard" {
    block(width: 100%, fill: p.cover, stroke: 0.7pt + p.accent.lighten(20%), inset: 12pt, radius: 5pt)[
      #text(size: 15pt, weight: "bold", fill: white)[#if number != none [Bài #number · ]#title]
    ]
  } else {
    block(width: 100%, fill: p.soft, stroke: (left: 5pt + p.accent), inset: 13pt, radius: 7pt)[
      #text(size: 16pt, weight: "bold", fill: p.accent)[Bài #if number != none [#number. ]#title]
    ]
  }
  v(10pt)
}

#let book-section(title, number: none, theme: "sgk-modern") = {
  let p = book-palette(theme)
  _hidden-heading(3, title)
  if p.look == "notes" {
    block(width: 100%, inset: (x: 0pt, y: 5pt), stroke: (bottom: 0.7pt + p.accent.lighten(42%)))[
      #text(size: 12.5pt, weight: "bold", fill: p.ink)[#if number != none [#number. ]#title]
    ]
  } else if p.look == "blackboard" {
    block(width: 100%, inset: (x: 0pt, y: 6pt), stroke: (bottom: 0.8pt + p.accent))[
      #text(size: 12.5pt, weight: "bold", fill: p.accent.darken(5%))[#if number != none [#number. ]#title]
    ]
  } else {
    grid(columns: (auto, 1fr), gutter: 9pt, align: (left + horizon, left + horizon),
      box(fill: p.accent, inset: (x: 9pt, y: 4pt), radius: if p.look == "lesson" { 4pt } else { 999pt })[
        #text(fill: white, weight: "bold", size: 9pt)[#if number == none [Mục] else [#number]]
      ],
      [
        #text(size: 13pt, weight: "bold", fill: p.accent.darken(8%))[#title]
        #v(2pt)
        #_rule(p.accent)
      ],
    )
  }
  v(8pt)
}

#let _ped-box(
  body,
  title: [Ghi chú],
  icon: [!],
  accent: rgb("#2563eb"),
  fill: auto,
  stroke: auto,
  radius: 8pt,
  inset: 12pt,
  boxed-title: true,
  style: "card",
) = {
  let real-fill = if fill == auto { accent.lighten(94%) } else { fill }
  let real-stroke = if stroke == auto { 0.75pt + accent.lighten(45%) } else { stroke }
  if style == "dark" {
    block(width: 100%, fill: accent.darken(45%), stroke: 0.8pt + accent, inset: inset, radius: 3pt, breakable: true)[
      #text(weight: "bold", fill: accent.lighten(50%))[#icon · #title]
      #v(5pt)
      #text(fill: white)[#body]
    ]
  } else if style == "worksheet" {
    block(width: 100%, fill: white, stroke: (left: 4pt + accent, rest: 0.55pt + accent.lighten(55%)), inset: inset, radius: 4pt, breakable: true)[
      #text(weight: "bold", fill: accent)[#icon · #title]
      #v(4pt)
      #body
      #v(5pt)
      #for i in range(2) { line(length: 100%, stroke: 0.4pt + accent.lighten(68%)); v(8pt) }
    ]
  } else if style == "solution" {
    block(width: 100%, fill: real-fill, stroke: (top: 2pt + accent, rest: 0.55pt + accent.lighten(50%)), inset: inset, radius: 6pt, breakable: true)[
      #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        text(weight: "bold", fill: accent.darken(8%))[#title],
        box(fill: accent, inset: (x: 8pt, y: 3pt), radius: 999pt)[#text(fill: white, size: 8pt, weight: "bold")[#icon]],
      )
      #v(5pt)
      #body
    ]
  } else if style == "rule" {
    block(width: 100%, inset: (x: 0pt, y: 7pt), stroke: (bottom: 0.65pt + accent.lighten(45%)), breakable: true)[
      #text(weight: "bold", fill: accent)[#icon · #title]
      #v(4pt)
      #body
    ]
  } else {
    block(width: 100%, fill: real-fill, stroke: real-stroke, inset: inset, radius: radius, breakable: true)[
      #grid(columns: (auto, 1fr), gutter: 10pt, align: (left + top, left + top),
        box(width: 24pt, height: 24pt, fill: accent, radius: if boxed-title { 6pt } else { 999pt })[
          #align(center + horizon)[#text(fill: white, weight: "bold", size: 9pt)[#icon]]
        ],
        [
          #text(weight: "bold", fill: accent.darken(8%))[#title]
          #v(4pt)
          #body
        ],
      )
    ]
  }
  v(8pt)
}

#let _box-style(theme) = {
  let p = book-palette(theme)
  if p.look == "elite" { "dark" }
  else if p.look == "workbook" { "worksheet" }
  else if p.look == "solution" { "solution" }
  else if p.look == "notes" or p.look == "minimal" or p.look == "research" { "rule" }
  else if p.look == "blackboard" { "dark" }
  else if p.look == "handout" { "worksheet" }
  else { "card" }
}

#let goal-box(body, title: [Mục tiêu], theme: "sgk-modern") = _ped-box(body, title: title, icon: [MT], accent: book-palette(theme).accent, style: _box-style(theme))
#let warmup-box(body, title: [Khởi động], theme: "sgk-modern") = _ped-box(body, title: title, icon: [KD], accent: rgb("#ea580c"), style: _box-style(theme))
#let explore-box(body, title: [Khám phá], theme: "sgk-modern") = _ped-box(body, title: title, icon: [KP], accent: rgb("#0e7490"), style: _box-style(theme))
#let theory-box(body, title: [Lý thuyết], theme: "sgk-modern") = _ped-box(body, title: title, icon: [LT], accent: book-palette(theme).accent, style: _box-style(theme))
#let definition-box(body, title: [Định nghĩa], theme: "sgk-modern") = _ped-box(body, title: title, icon: [DN], accent: rgb("#7c3aed"), style: _box-style(theme))
#let theorem-box(body, title: [Định lý], theme: "sgk-modern") = _ped-box(body, title: title, icon: [DL], accent: rgb("#be123c"), style: _box-style(theme))
#let method-box(body, title: [Phương pháp], theme: "sgk-modern") = _ped-box(body, title: title, icon: [PP], accent: rgb("#0f766e"), style: _box-style(theme))
#let example-box(body, title: [Ví dụ], theme: "sgk-modern") = _ped-box(body, title: title, icon: [VD], accent: rgb("#2563eb"), fill: rgb("#eff6ff"), style: _box-style(theme))
#let activity-box(body, title: [Hoạt động], theme: "sgk-modern") = _ped-box(body, title: title, icon: [HD], accent: rgb("#b45309"), fill: rgb("#fffbeb"), style: _box-style(theme))
#let practice-box(body, title: [Luyện tập], theme: "sgk-modern") = _ped-box(body, title: title, icon: [LT], accent: rgb("#059669"), fill: rgb("#ecfdf5"), style: _box-style(theme))
#let warning-box(body, title: [Lưu ý], theme: "sgk-modern") = _ped-box(body, title: title, icon: [!], accent: rgb("#dc2626"), fill: rgb("#fef2f2"), style: _box-style(theme))
#let summary-box(body, title: [Tóm tắt], theme: "sgk-modern") = _ped-box(body, title: title, icon: [TK], accent: rgb("#334155"), fill: rgb("#f8fafc"), style: _box-style(theme))
#let exercise-box(body, title: [Bài tập], theme: "sgk-modern", lines: 0) = {
  _ped-box(
    [
      #body
      #if lines > 0 [
        #v(6pt)
        #for i in range(lines) {
          line(length: 100%, stroke: 0.45pt + luma(185))
          v(9pt)
        }
      ]
    ],
    title: title,
    icon: [BT],
    accent: rgb("#4338ca"),
    fill: rgb("#eef2ff"),
    style: _box-style(theme),
  )
}

#let book-template-names = (
  "sgk-modern",
  "vdc-elite",
  "workbook-jade",
  "solution-crimson",
  "lesson-amber",
  "olympiad-indigo",
  "magazine-coral",
  "blackboard-green",
  "minimal-graphite",
  "handout-sky",
  "research-slate",
  "lotus-study",
)
