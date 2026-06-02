#let C-DARK = rgb("#0F172A") // Slate tối
#let C-NAVY = rgb("#1E293B") // Slate sáng hơn chút
#let C-FOREST = rgb("#0284C7") // Sky blue xanh biển
#let C-EMERALD = rgb("#0EA5E9") // Sky sáng
#let C-GOLD = rgb("#F59E0B") // Amber
#let C-AMBER = rgb("#D97706") // Amber đậm
#let C-WINE = rgb("#BE123C") // Rose đỏ rượu
#let C-TEAL = rgb("#0D9488") // Teal đậm
#let C-PURPLE = rgb("#7C3AED") // Purple đậm

#let cover-box(title, subtitle) = block(
  width: 100%,
  fill: gradient.linear(C-DARK, rgb("#1E293B"), angle: 140deg),
  inset: (x: 26pt, y: 34pt),
  radius: 14pt,
  clip: true,
)[
  #align(center)[
    #text(fill: C-GOLD, size: 11pt, weight: "bold", tracking: 4pt)[TƯ DUY ĐẠI BÁC DIỆT RUỒI]
    #v(0.8em)
    #text(fill: white, size: 22pt, weight: "black")[#title]
    #v(0.5em)
    #text(fill: rgb("#E2E8F0"), size: 13pt, style: "italic")[#subtitle]
    #v(1em)
    #line(length: 42%, stroke: 1.1pt + C-GOLD)
    #v(0.8em)
    #text(fill: rgb("#CCFBF1"), size: 10pt)[
      Giải phóng tư duy với quỹ đạo chuyển động, dải Möbius, các mặt kẻ Conicoids và giải tích số 3D
    ]
  ]
]

#let why-box(body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 5pt + rgb("#0284C7")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#0284C7"), weight: "bold", size: 10.5pt)[⚖ TRIẾT HỌC & ĐỘNG CƠ — Vì Sao Phải Học Ý Tưởng Này?]
  #v(0.5em)
  #body
]

#let eye-box(body) = block(
  fill: rgb("#F0FDFA"),
  stroke: (left: 5pt + C-TEAL),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[👁 TRỰC GIÁC — Không Gian Đang Được Nhìn Theo Cách Nào?]
  #v(0.5em)
  #body
]

#let core-box(body) = block(
  fill: rgb("#FEF3C7"),
  stroke: (left: 5pt + C-AMBER),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 10.5pt)[🔑 CẤU TRÚC CỐT LÕI — Từ Trực Giác Sang Mô Hình]
  #v(0.5em)
  #body
]

#let tech-box(body) = block(
  fill: rgb("#F5F3FF"),
  stroke: (left: 5pt + C-PURPLE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[⚙ KỸ THUẬT — Toán Học & Công Thức Cấu Trúc]
  #v(0.5em)
  #body
]

#let meta-box(body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 5pt + rgb("#64748B")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#475569"), weight: "bold", size: 10.5pt)[🧠 SIÊU TƯ DUY — Chủ Đề Này Dạy Cách Nghĩ Gì?]
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
  #text(fill: C-AMBER, weight: "bold", size: 10pt)[🔗 Ý TƯỞNG NÀY CÒN ĐI ĐÂU NỮA?]
  #v(0.3em)
  #text(size: 9.5pt, style: "italic")[#body]
]

#let quote-block(body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 3pt + C-GOLD),
  inset: (x: 16pt, y: 12pt),
  radius: (right: 6pt),
  width: 90%,
)[
  #set par(first-line-indent: 0em)
  #text(size: 10pt, style: "italic", fill: rgb("#475569"))[#body]
]

#let vd-box(n, title, body) = block(
  fill: white,
  stroke: 0.6pt + rgb("#CBD5E1"),
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
  stroke: (left: 5pt + rgb("#EA580C")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#C2410C"), weight: "bold", size: 10.5pt)[🕰 LỊCH SỬ & TÁC GIẢ — #title]
  #v(0.5em)
  #body
]

#let workshop-box(title, body) = block(
  fill: rgb("#F0FDF4"),
  stroke: 0.8pt + rgb("#22C55E"),
  inset: (x: 20pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#15803D"), weight: "bold", size: 11pt)[🛠 XƯỞNG THỰC HÀNH — #title]
  #v(0.6em)
  #body
]

#let bridge-box(title, body) = block(
  fill: rgb("#ECFDF5"),
  stroke: (left: 5pt + rgb("#10B981")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#047857"), weight: "bold", size: 10.5pt)[🌉 CẦU NỐI CÔNG NGHỆ — #title]
  #v(0.5em)
  #body
]

#let essay-box(title, body) = block(
  fill: rgb("#F8FAFC"),
  stroke: (left: 4pt + rgb("#64748B")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#334155"), weight: "bold", size: 10.5pt)[✍ BÀI LUẬN TƯ DUY — #title]
  #v(0.5em)
  #body
]

#let open-q(body) = block(
  fill: rgb("#FFFDF5"),
  stroke: (paint: C-GOLD, thickness: 1pt, dash: "dashed"),
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#78350F"), size: 10pt, style: "italic")[❓ CÂU HỎI KHAI PHÓNG: #body]
]
