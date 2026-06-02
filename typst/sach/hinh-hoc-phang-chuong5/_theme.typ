#let C-DARK = rgb("#102A43")
#let C-NAVY = rgb("#1F4E79")
#let C-FOREST = rgb("#0F766E")
#let C-EMERALD = rgb("#14B8A6")
#let C-GOLD = rgb("#D97706")
#let C-AMBER = rgb("#B45309")
#let C-WINE = rgb("#9F1239")
#let C-TEAL = rgb("#0F766E")
#let C-PURPLE = rgb("#3730A3")

#let cover-box(title, subtitle) = block(
  width: 100%,
  fill: gradient.linear(C-DARK, C-NAVY, angle: 140deg),
  inset: (x: 26pt, y: 34pt),
  radius: 14pt,
  clip: true,
)[
  #align(center)[
    #text(fill: C-GOLD, size: 11pt, weight: "bold", tracking: 4pt)[TƯ DUY ĐẠI BÁC DIỆT RUỒI]
    #v(0.8em)
    #text(fill: white, size: 24pt, weight: "black")[#title]
    #v(0.5em)
    #text(fill: rgb("#E0F2FE"), size: 13pt, style: "italic")[#subtitle]
    #v(1em)
    #line(length: 42%, stroke: 1.1pt + C-GOLD)
    #v(0.8em)
    #text(fill: rgb("#D1FAE5"), size: 10pt)[
      Từ tam giác, đường tròn, quỹ tích tới Oxy, conic và hình học giải tích phẳng
    ]
  ]
]

#let why-box(body) = block(
  fill: rgb("#F5F7FA"),
  stroke: (left: 5pt + C-NAVY),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-NAVY, weight: "bold", size: 10.5pt)[⚖ TRIẾT HỌC & ĐỘNG CƠ — Vì Sao Phải Học Ý Tưởng Này?]
  #v(0.5em)
  #body
]

#let eye-box(body) = block(
  fill: rgb("#ECFEFF"),
  stroke: (left: 5pt + C-TEAL),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[👁 TRỰC GIÁC — Hình Vẽ Đang Gợi Điều Gì?]
  #v(0.5em)
  #body
]

#let core-box(body) = block(
  fill: rgb("#FFF8E8"),
  stroke: (left: 5pt + C-AMBER),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 10.5pt)[🔑 CẤU TRÚC CỐT LÕI — Cái Bất Biến Là Gì?]
  #v(0.5em)
  #body
]

#let tech-box(body) = block(
  fill: rgb("#EEF2FF"),
  stroke: (left: 5pt + C-PURPLE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[⚙ KỸ THUẬT — Công Cụ Được Rút Ra Từ Hình]
  #v(0.5em)
  #body
]

#let meta-box(body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 5pt + rgb("#475569")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#334155"), weight: "bold", size: 10.5pt)[🧠 SIÊU TƯ DUY — Chủ Đề Này Dạy Cách Nhìn Gì?]
  #v(0.5em)
  #body
]

#let link-box(body) = block(
  fill: rgb("#FFFBEB"),
  stroke: 0.8pt + C-GOLD,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 10pt)[🔗 Ý Tưởng Này Còn Đi Đâu Nữa?]
  #v(0.3em)
  #text(size: 9.5pt, style: "italic")[#body]
]

#let quote-block(body) = block(
  fill: rgb("#FAFAFA"),
  stroke: (left: 3pt + C-GOLD),
  inset: (x: 16pt, y: 12pt),
  radius: (right: 6pt),
  width: 90%,
)[
  #set par(first-line-indent: 0em)
  #text(size: 10pt, style: "italic", fill: rgb("#37474F"))[#body]
]

#let vd-box(n, title, body) = block(
  fill: white,
  stroke: 0.6pt + rgb("#B0BEC5"),
  inset: (x: 20pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-WINE, weight: "bold", size: 11pt)[🔥 Ví Dụ #n — #title]
  #v(0.6em)
  #body
]

#let history-box(title, body) = block(
  fill: rgb("#FFF7ED"),
  stroke: (left: 5pt + rgb("#C2410C")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#9A3412"), weight: "bold", size: 10.5pt)[🕰 LỊCH SỬ & TÁC GIẢ — #title]
  #v(0.5em)
  #body
]

#let workshop-box(title, body) = block(
  fill: rgb("#F0FDF4"),
  stroke: 0.8pt + rgb("#16A34A"),
  inset: (x: 20pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#166534"), weight: "bold", size: 11pt)[🛠 XƯỞNG — #title]
  #v(0.6em)
  #body
]

#let bridge-box(title, body) = block(
  fill: rgb("#ECFDF5"),
  stroke: (left: 5pt + rgb("#059669")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#047857"), weight: "bold", size: 10.5pt)[🌉 CẦU NỐI — #title]
  #v(0.5em)
  #body
]

#let essay-box(title, body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 4pt + rgb("#475569")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#334155"), weight: "bold", size: 10.5pt)[✍ BÀI LUẬN NHỎ — #title]
  #v(0.5em)
  #body
]

#let open-q(body) = block(
  fill: rgb("#FFF8E1"),
  stroke: (paint: C-GOLD, thickness: 1pt, dash: "dashed"),
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#5D4037"), size: 10pt, style: "italic")[❓ #body]
]
