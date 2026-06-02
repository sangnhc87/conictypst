#let C-DARK = rgb("#102A43")
#let C-NAVY = rgb("#1F4E5F")
#let C-FOREST = rgb("#1B5E20")
#let C-EMERALD = rgb("#2E7D32")
#let C-GOLD = rgb("#C9A227")
#let C-AMBER = rgb("#B45309")
#let C-WINE = rgb("#7F1D1D")
#let C-TEAL = rgb("#00695C")
#let C-PURPLE = rgb("#5B21B6")

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
    #text(fill: rgb("#C8E6C9"), size: 13pt, style: "italic")[#subtitle]
    #v(1em)
    #line(length: 42%, stroke: 1.1pt + C-GOLD)
    #v(0.8em)
    #text(fill: rgb("#D0F0E0"), size: 10pt)[
      Từ đếm, đối xứng, song ánh, truy hồi, hàm sinh đến xác suất và kỳ vọng
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
  #text(fill: C-NAVY, weight: "bold", size: 10.5pt)[⚖ TRIẾT HỌC & ĐỘNG CƠ — Vì Sao Chủ Đề Này Xứng Đáng?]
  #v(0.5em)
  #body
]

#let eye-box(body) = block(
  fill: rgb("#EAF7F4"),
  stroke: (left: 5pt + C-TEAL),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[👁 TRỰC GIÁC — Bức Tranh Ẩn Sau Các Công Thức Đếm]
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
  #text(fill: C-AMBER, weight: "bold", size: 10.5pt)[🔑 CẤU TRÚC CỐT LÕI — Điều Gì Thực Sự Đang Được Học?]
  #v(0.5em)
  #body
]

#let tech-box(body) = block(
  fill: rgb("#F4F0FB"),
  stroke: (left: 5pt + C-PURPLE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[⚙ KỸ THUẬT — Cỗ Máy Tính Toán Được Rút Từ Trực Giác]
  #v(0.5em)
  #body
]

#let meta-box(body) = block(
  fill: rgb("#EBF5FB"),
  stroke: (left: 5pt + rgb("#1D4ED8")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#1D4ED8"), weight: "bold", size: 10.5pt)[🧠 SIÊU TƯ DUY — Chủ Đề Này Dạy Ta Cách Nghĩ Gì?]
  #v(0.5em)
  #body
]

#let link-box(body) = block(
  fill: rgb("#FDF6D8"),
  stroke: 0.8pt + C-GOLD,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 10pt)[🔗 Ý Tưởng Này Còn Sống Ở Đâu?]
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
  #text(fill: C-WINE, weight: "bold", size: 11pt)[🔥 Cửa Sổ #n — #title]
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
  fill: rgb("#F0F9FF"),
  stroke: 0.8pt + rgb("#0284C7"),
  inset: (x: 20pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#0369A1"), weight: "bold", size: 11pt)[🛠 XƯỞNG — #title]
  #v(0.6em)
  #body
]

#let pivot-box(title, body) = block(
  fill: rgb("#FEFCE8"),
  stroke: 0.8pt + rgb("#CA8A04"),
  inset: (x: 18pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#A16207"), weight: "bold", size: 10.8pt)[🎯 BÀI TOÁN BẢN LỀ — #title]
  #v(0.5em)
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
