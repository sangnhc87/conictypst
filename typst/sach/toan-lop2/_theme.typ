// ══════════════════════════════════════════════════════════════════════════
// _theme.typ — TOÁN TƯ DUY LỚP 2: BÉ THÔNG MINH
// Theme, màu sắc và các macro dùng chung
// ══════════════════════════════════════════════════════════════════════════

#import "@preview/cetz:0.5.2": canvas, draw

// ─── Bảng màu ─────────────────────────────────────────────────────────────
#let C-ORANGE = rgb("#E85D26")   // cam — bài tập
#let C-TEAL = rgb("#0D9B8E")   // xanh ngọc — lý thuyết
#let C-PURPLE = rgb("#6D28D9")   // tím — thử thách
#let C-GOLD = rgb("#B45309")   // vàng đậm — mẹo hay
#let C-PINK = rgb("#C2185B")   // hồng — vui học
#let C-GREEN = rgb("#15803D")   // xanh lá — ví dụ
#let C-BLUE = rgb("#1D4ED8")   // xanh đậm — tiêu đề
#let C-RED = rgb("#B91C1C")   // đỏ — chú ý
#let C-SKY = rgb("#0369A1")   // xanh trời — heading
#let C-DARK = rgb("#1E293B")   // màu chữ chính
#let C-MID = rgb("#64748B")   // chữ phụ
#let C-LIGHT = rgb("#E2E8F0")   // đường kẻ nhạt
#let C-CREAM = rgb("#FFFCF0")   // nền trang
#let C-MINT = rgb("#DCFCE7")   // nền ví dụ
#let C-LAVENDER = rgb("#EDE9FE")  // nền thử thách
#let C-PEACH = rgb("#FFF7ED")   // nền bài tập

// ─── Màu theo chương ──────────────────────────────────────────────────────
#let C-CH = (
  rgb("#C2410C"), // Chương 1 — đỏ cam
  rgb("#0369A1"), // Chương 2 — xanh biển
  rgb("#15803D"), // Chương 3 — xanh lá
  rgb("#6D28D9"), // Chương 4 — tím
  rgb("#B45309"), // Chương 5 — vàng nâu
)

// ══════════════════════════════════════════════════════════════════════════
// COMPONENT FUNCTIONS
// ══════════════════════════════════════════════════════════════════════════

// ─── Bìa chương ───────────────────────────────────────────────────────────
#let chuong-header(so: 1, ten: "", icon: "⭐", so-bai: "", so-trang: "") = {
  let c = C-CH.at(so - 1)
  pagebreak(weak: true)
  v(1em)
  block(
    width: 100%,
    fill: gradient.linear(c, c.lighten(35%), angle: 130deg),
    inset: (x: 28pt, y: 30pt),
    radius: 18pt,
    clip: true,
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      #text(size: 48pt)[#icon]
      #v(0.2em)
      #text(fill: white.transparentize(30%), size: 11pt, weight: "bold", tracking: 4pt)[CHƯƠNG #str(so)]
      #v(0.15em)
      #text(fill: white, size: 20pt, weight: "black")[#ten]
      #v(0.6em)
      #line(length: 50%, stroke: 1.5pt + white.transparentize(50%))
      #v(0.5em)
      #if so-bai != "" {
        text(fill: white.transparentize(25%), size: 10pt)[#so-bai bài học  •  #so-trang trang]
      }
    ]
  ]
  v(1.5em)
}

// ─── Tiêu đề bài học ──────────────────────────────────────────────────────
#let bai-hoc(so: "", ten: "", icon: "📖", c: C-SKY) = {
  v(0.8em)
  block(
    width: 100%,
    fill: gradient.linear(c, c.lighten(30%), angle: 8deg),
    inset: (x: 18pt, y: 12pt),
    radius: 10pt,
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align(horizon)[
        #block(
          fill: white,
          inset: (x: 9pt, y: 5pt),
          radius: 7pt,
        )[
          #text(fill: c, weight: "black", size: 11.5pt)[BÀI #so]
        ]
      ],
      align(horizon)[
        #text(fill: white, weight: "black", size: 13pt)[#icon #h(4pt)#ten]
      ],
    )
  ]
  v(0.6em)
}

// ─── Box lý thuyết ────────────────────────────────────────────────────────
#let ly-thuyet(title: "KIẾN THỨC CẦN NHỚ", body) = block(
  width: 100%,
  fill: rgb("#EFF6FF"),
  stroke: (left: 5pt + C-TEAL),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 8pt),
  above: 0.8em,
  below: 0.8em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[📘 #title]
  #v(0.5em)
  #body
]

// ─── Box ví dụ ────────────────────────────────────────────────────────────
#let vi-du(title: "VÍ DỤ", body) = block(
  width: 100%,
  fill: C-MINT,
  stroke: (left: 5pt + C-GREEN),
  inset: (x: 16pt, y: 12pt),
  radius: (right: 8pt),
  above: 0.7em,
  below: 0.7em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GREEN, weight: "bold", size: 10.5pt)[✨ #title]
  #v(0.4em)
  #body
]

// ─── Nhãn bài tập ─────────────────────────────────────────────────────────
#let bt-label(so: "", title: "") = {
  set par(first-line-indent: 0em)
  v(0.8em)
  grid(
    columns: (auto, 1fr),
    gutter: 8pt,
    block(
      fill: C-ORANGE,
      inset: (x: 10pt, y: 5pt),
      radius: 7pt,
    )[
      #text(fill: white, weight: "black", size: 11pt)[Bài #so]
    ],
    align(horizon)[
      #text(fill: C-DARK, weight: "bold", size: 10.5pt)[#title]
    ],
  )
  v(0.3em)
}

// ─── Box thử thách ────────────────────────────────────────────────────────
#let thu-thach(body) = block(
  width: 100%,
  fill: C-LAVENDER,
  stroke: (left: 5pt + C-PURPLE),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 8pt),
  above: 0.9em,
  below: 0.8em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 11pt)[🌟 THỬ THÁCH — Suy nghĩ thêm nào!]
  #v(0.5em)
  #body
]

// ─── Box mẹo hay ──────────────────────────────────────────────────────────
#let meo(body) = block(
  width: 100%,
  fill: rgb("#FEFCE8"),
  stroke: (top: 2pt + C-GOLD, bottom: 2pt + C-GOLD),
  inset: (x: 16pt, y: 11pt),
  above: 0.7em,
  below: 0.7em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 10.5pt)[💡 MẸO HAY]
  #h(0.6em)
  #body
]

// ─── Box chú ý ────────────────────────────────────────────────────────────
#let chu-y(body) = block(
  width: 100%,
  fill: rgb("#FEF2F2"),
  stroke: (left: 5pt + C-RED),
  inset: (x: 16pt, y: 11pt),
  radius: (right: 8pt),
  above: 0.7em,
  below: 0.7em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-RED, weight: "bold", size: 10pt)[⚠️ CHÚ Ý] #h(0.5em)#body
]

// ─── Box mục tiêu học ─────────────────────────────────────────────────────
#let muc-tieu(items) = block(
  width: 100%,
  fill: rgb("#F0FDF4"),
  stroke: 1.5pt + C-GREEN,
  inset: (x: 16pt, y: 14pt),
  radius: 10pt,
  above: 0.6em,
  below: 1em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GREEN, weight: "bold", size: 11pt)[🎯 SAU CHƯƠNG NÀY, EM SẼ BIẾT]
  #v(0.6em)
  #for item in items {
    [#text(fill: C-GREEN)[✓] #h(4pt)#item \ ]
  }
]

// ─── Dòng viết tay (đường chấm cho học sinh viết) ─────────────────────────
#let dong-viet(n: 3) = {
  for _ in range(n) {
    v(0.25em)
    line(
      length: 100%,
      stroke: (paint: rgb("#BBBBBB"), dash: "dotted", thickness: 0.9pt),
    )
    v(1.0em)
  }
}

// ─── Ô trả lời rộng ───────────────────────────────────────────────────────
#let o-tra-loi(h: 2.2cm, label: none) = {
  if label != none {
    text(size: 10pt, fill: C-MID, style: "italic")[#label]
    v(0.2em)
  }
  rect(
    width: 100%,
    height: h,
    stroke: (paint: rgb("#BBBBBB"), dash: "dashed", thickness: 1pt),
    fill: white,
    radius: 6pt,
  )[]
  v(0.3em)
}

// ─── Ô điền số nhỏ ────────────────────────────────────────────────────────
#let o-so(w: 2cm, h: 1.3cm) = rect(
  width: w,
  height: h,
  stroke: 1.5pt + C-ORANGE,
  fill: white,
  radius: 5pt,
)[]

// ─── Hàng điền số ngang ───────────────────────────────────────────────────
#let hang-dien(items) = {
  // items là list content như ([24 + 13 =], o-so(), ...)
  set par(first-line-indent: 0em)
  grid(
    columns: items.map(_ => auto),
    gutter: 8pt,
    align: horizon,
    ..items,
  )
}

// ─── Bảng đặt tính (3 hàng × 3 cột số) ───────────────────────────────────
#let dat-tinh = {
  let cell = rect(width: 1.1cm, height: 1.1cm, stroke: 0.8pt + C-LIGHT, fill: white)[]
  set par(first-line-indent: 0em)
  grid(
    columns: (1.1cm, 1.1cm, 1.1cm),
    rows: (1.1cm, 1.1cm, auto, 1.1cm),
    gutter: 0pt,
    cell, cell, cell,
    cell, cell, cell,
    line(length: 330%, stroke: 1.5pt + C-DARK), cell, cell,
    cell,
  )
}

// ─── Box đặt tính gọn (thay o-tra-loi trong luyện cột dọc) ──────────────
// Hiển thị sẵn hai số đã căn cột, học sinh chỉ cần điền đáp số.
#let dat-tinh-bai(label: "a)", so1: "324", so2: "153", op: "+") = block(
  width: 100%,
  fill: white,
  stroke: 0.8pt + C-LIGHT,
  inset: (x: 9pt, top: 6pt, bottom: 9pt),
  radius: 6pt,
)[
  #set par(first-line-indent: 0em)
  #text(size: 9pt, weight: "bold", fill: C-ORANGE)[#label]
  #v(0.1em)
  #pad(left: 0.6em)[
    #align(right)[#text(size: 13pt)[#so1]]
    #v(0.04em)
    #grid(
      columns: (1.8em, 1fr),
      gutter: 0pt,
      align(horizon)[#text(size: 10.5pt, fill: C-MID)[#op]], align(right)[#text(size: 13pt)[#so2]],
    )
  ]
  #v(0.06em)
  #line(length: 100%, stroke: 2pt + C-DARK)
  #v(0.3em)
  #line(
    length: 72%,
    stroke: (paint: rgb("#BCBCBC"), dash: "dotted", thickness: 1pt),
  )
  #v(0.22em)
]

// ─── Lưới đặt tính 3-cột (6 bài = 2 hàng × 3 cột) ───────────────────────
// problems: mảng dạng (("a)", "so1", "so2"), ("b)", "so1", "so2"), ...)
#let dat-tinh-grid(problems, op: "+") = grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  ..problems.map(p => dat-tinh-bai(
    label: p.at(0),
    so1: p.at(1),
    so2: p.at(2),
    op: op,
  ))
)

// ─── Đánh giá bài (ngôi sao) ──────────────────────────────────────────────
#let sao-danh-gia = {
  v(0.5em)
  block(
    width: 100%,
    fill: rgb("#FFFDE7"),
    stroke: 1pt + C-GOLD,
    inset: (x: 14pt, y: 9pt),
    radius: 8pt,
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 8pt,
      align(horizon)[#text(size: 10pt, fill: rgb("#92400E"))[*Kết quả bài này:*]],
      align(horizon + center)[#text(size: 22pt)[☆ ☆ ☆ ☆ ☆]],
      align(horizon)[#text(size: 9pt, fill: C-MID, style: "italic")[(tô màu)]],
    )
  ]
  v(0.6em)
}

// ─── Kiểm tra header ──────────────────────────────────────────────────────
#let kiem-tra-header(chuong: "", so-cau: "10", tg: "20 phút") = {
  pagebreak(weak: true)
  block(
    width: 100%,
    fill: gradient.linear(C-BLUE, rgb("#0F172A"), angle: 90deg),
    inset: (x: 22pt, y: 18pt),
    radius: 12pt,
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      #text(fill: rgb("#93C5FD"), size: 11pt, weight: "bold", tracking: 2pt)[KIỂM TRA CUỐI CHƯƠNG]
      #v(0.3em)
      #text(fill: white, size: 16pt, weight: "black")[🏆 Chương #chuong]
      #v(0.5em)
      #line(length: 60%, stroke: 0.8pt + rgb("#3B82F6"))
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr, 1fr),
        text(fill: rgb("#BAE6FD"), size: 9.5pt)[📝 #so-cau câu],
        text(fill: rgb("#BAE6FD"), size: 9.5pt)[⏱ #tg],
        text(fill: rgb("#BAE6FD"), size: 9.5pt)[⭐ 10 điểm],
      )
    ]
  ]
  v(0.4em)
  // Họ tên, ngày tháng
  grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    block(
      stroke: (bottom: 1pt + C-LIGHT),
      inset: (bottom: 4pt),
      width: 100%,
    )[#text(size: 10pt)[Họ và tên: ]],
    block(
      stroke: (bottom: 1pt + C-LIGHT),
      inset: (bottom: 4pt),
      width: 100%,
    )[#text(size: 10pt)[Ngày: ]],
  )
  v(0.8em)
}

// ─── Tia số (number line) bằng CeTZ ───────────────────────────────────────
#let tia-so(from: 0, to: 10, buoc: 1, scl: 1.0) = {
  let n = calc.ceil((to - from) / buoc) + 1
  canvas(length: 1cm, {
    import draw: *
    let s = scl * 1.2
    let len = (n - 1) * s
    line((0, 0), (len + 0.6, 0), mark: (end: ">"))
    for i in range(n) {
      let x = i * s
      let v = from + i * buoc
      line((x, -0.25), (x, 0.25))
      content((x, -0.5), text(size: 9pt)[#v], anchor: "north")
    }
  })
}

// ─── Đồng hồ CeTZ ─────────────────────────────────────────────────────────
#let dong-ho(gio: 3, phut: 0, r: 2.0) = canvas({
  import draw: *
  // Mặt đồng hồ
  circle((0, 0), radius: r, stroke: 2pt + C-DARK, fill: white)
  circle((0, 0), radius: 0.08, fill: C-DARK)
  // Các vạch giờ
  for i in range(12) {
    let a = 90deg - i * 30deg
    let x1 = (r - 0.25) * calc.cos(a)
    let y1 = (r - 0.25) * calc.sin(a)
    let x2 = r * calc.cos(a)
    let y2 = r * calc.sin(a)
    line((x1, y1), (x2, y2), stroke: 2pt + C-DARK)
    // Số giờ
    let xn = (r - 0.55) * calc.cos(a)
    let yn = (r - 0.55) * calc.sin(a)
    let num = if i == 0 { 12 } else { i }
    content((xn, yn), text(size: 9pt, weight: "bold")[#num])
  }
  // Kim giờ
  let ha = 90deg - gio * 30deg - phut * 0.5deg
  let hlen = r * 0.5
  line((0, 0), (hlen * calc.cos(ha), hlen * calc.sin(ha)), stroke: (paint: C-DARK, thickness: 4pt, cap: "round"))
  // Kim phút
  let ma = 90deg - phut * 6deg
  let mlen = r * 0.78
  line((0, 0), (mlen * calc.cos(ma), mlen * calc.sin(ma)), stroke: (paint: C-RED, thickness: 2.5pt, cap: "round"))
})

// ─── Hình chữ nhật có nhãn CeTZ ───────────────────────────────────────────
#let hinh-chu-nhat(w: 5.0, h: 3.0, label-w: none, label-h: none, c: C-SKY) = canvas({
  import draw: *
  rect((0, 0), (w, h), stroke: 2pt + c, fill: c.lighten(85%))
  if label-w != none {
    content((w / 2, -0.4), text(size: 9pt)[#label-w])
  }
  if label-h != none {
    content((-0.5, h / 2), text(size: 9pt)[#label-h])
  }
})

// ─── Hình vuông có nhãn ───────────────────────────────────────────────────
#let hinh-vuong(s: 3.5, label: none, c: C-GREEN) = canvas({
  import draw: *
  rect((0, 0), (s, s), stroke: 2pt + c, fill: c.lighten(85%))
  // Góc vuông
  let m = 0.3
  line((0, m), (m, m), (m, 0), stroke: 1.5pt + c)
  if label != none {
    content((s / 2, -0.4), text(size: 9pt)[cạnh = #label])
  }
})

// ─── Dãy chấm (cho bài nhân) ──────────────────────────────────────────────
#let day-cham(hang: 3, cot: 4, c: C-BLUE) = canvas({
  import draw: *
  for r in range(hang) {
    for col in range(cot) {
      circle((col * 0.65, r * 0.65), radius: 0.2, fill: c, stroke: none)
    }
  }
})

// ══════════════════════════════════════════════════════════════════════════
// V2 MACROS — Bilingual / Singapore Math Upgrades
// ══════════════════════════════════════════════════════════════════════════

// ─── Inline comparison blank (dùng thay o-so cho so sánh ngang) ────────────
#let _blank = box(
  baseline: 0.18em,
  width: 1.3cm,
  height: 1.35em,
  stroke: (bottom: 1.3pt + C-DARK),
)[]

// ─── Bilingual lesson header (tiêu đề song ngữ) ───────────────────────────
#let bai-hoc-en(so: "", ten-vi: "", ten-en: "", icon: "📖", c: C-SKY) = {
  v(0.8em)
  block(
    width: 100%,
    fill: gradient.linear(c, c.lighten(30%), angle: 8deg),
    inset: (x: 18pt, y: 12pt),
    radius: 10pt,
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr),
      gutter: 10pt,
      align(horizon)[
        #block(
          fill: white,
          inset: (x: 9pt, y: 5pt),
          radius: 7pt,
        )[
          #text(fill: c, weight: "black", size: 11pt)[BÀI #so]
        ]
      ],
      align(horizon)[
        #text(fill: white, weight: "black", size: 13pt)[#icon #h(4pt)#ten-vi]
        #v(0.15em)
        #text(fill: white.transparentize(20%), size: 10pt, style: "italic")[#ten-en]
      ],
    )
  ]
  v(0.6em)
}

// ─── Bilingual key words box ───────────────────────────────────────────────
#let tu-khoa(items) = block(
  fill: C-LAVENDER,
  stroke: (left: 4pt + C-PURPLE),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[🔑 Từ Khóa — Key Words]
  #v(0.5em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 5pt,
    ..items.map(i => block(
      fill: white,
      inset: (x: 8pt, y: 5pt),
      radius: 5pt,
      stroke: 0.5pt + C-PURPLE.lighten(60%),
    )[
      #set par(first-line-indent: 0em)
      #text(fill: C-DARK, size: 10pt, weight: "bold")[#i.at(0)]
      #linebreak()
      #text(fill: C-PURPLE, size: 9pt, style: "italic")[#i.at(1)]
    ])
  )
]

// ─── Number Bond diagram ───────────────────────────────────────────────────
#let number-bond(total: 10, a: none, b: none, c: C-BLUE) = {
  let r = 0.6
  canvas(length: 1cm, {
    import draw: *
    // Top circle (total / whole)
    circle((3, 2.8), radius: r, fill: c.lighten(80%), stroke: 1.8pt + c)
    if total != none {
      content((3, 2.8), text(fill: c, weight: "black", size: 11pt)[#total])
    }
    // Lines
    line((2.55, 2.25), (1.6, 1.55), stroke: 1.2pt + C-MID)
    line((3.45, 2.25), (4.4, 1.55), stroke: 1.2pt + C-MID)
    // Left circle (part a)
    circle(
      (1.2, 1.2),
      radius: r,
      fill: if a == none { white } else { c.lighten(88%) },
      stroke: (paint: c, dash: if a == none { "dashed" } else { "solid" }, thickness: 1.8pt),
    )
    if a != none {
      content((1.2, 1.2), text(fill: c, weight: "bold", size: 11pt)[#a])
    }
    // Right circle (part b)
    circle(
      (4.8, 1.2),
      radius: r,
      fill: if b == none { white } else { c.lighten(88%) },
      stroke: (paint: c, dash: if b == none { "dashed" } else { "solid" }, thickness: 1.8pt),
    )
    if b != none {
      content((4.8, 1.2), text(fill: c, weight: "bold", size: 11pt)[#b])
    }
  })
}

// ─── Trắc nghiệm căn đều theo cột ───────────────────────────────────────
#let phuong-an-trac-nghiem(options, cols: 4, gutter: 10pt) = {
  let labels = ("A", "B", "C", "D", "E", "F")
  grid(
    columns: (cols * (1fr,)),
    column-gutter: gutter,
    row-gutter: 0.5em,
    align: left + top,
    ..options
      .enumerate()
      .map(((i, opt)) => block(
        width: 100%,
        fill: white,
        stroke: 0.8pt + C-LIGHT,
        inset: (x: 8pt, y: 7pt),
        radius: 8pt,
      )[
        #set par(first-line-indent: 0em, justify: false)
        #grid(
          columns: (auto, 1fr),
          column-gutter: 7pt,
          align: (left + horizon, left + horizon),
          block(
            fill: C-CH.at(calc.rem(i, C-CH.len())).lighten(78%),
            inset: (x: 7pt, y: 3pt),
            radius: 999pt,
          )[
            #text(fill: C-DARK, weight: "black", size: 9.5pt)[#labels.at(i)]
          ],
          [#opt],
        )
      ]),
  )
}

#let trac-nghiem-4(a, b, c, d, gutter: 10pt) = phuong-an-trac-nghiem(
  (a, b, c, d),
  cols: 4,
  gutter: gutter,
)

// ─── Singapore Bar Model ───────────────────────────────────────────────────
#let bar-model(
  label-total: none,
  parts: (),
  bw: 11.0,
  show-total: true,
) = {
  let n = parts.len()
  let colors = (C-TEAL, C-BLUE, C-ORANGE, C-GREEN, C-PURPLE)
  // Parts can be dictionaries {label, w} or just strings
  let pws = parts.map(p => {
    if type(p) == dictionary and "w" in p { p.w } else { bw / n }
  })
  let total-w = pws.fold(0.0, (s, v) => s + v)
  let fig = canvas(length: 1cm, {
    import draw: *
    // Total bar on top
    if show-total and label-total != none {
      rect((0, 3.2), (total-w, 4.0), fill: C-TEAL.lighten(82%), stroke: 1.8pt + C-TEAL)
      content((total-w / 2, 3.6), text(weight: "bold", size: 10pt, fill: C-TEAL)[#label-total])
      // Brace above
      line((0, 4.0), (0, 4.3), stroke: 1pt + C-MID)
      line((total-w, 4.0), (total-w, 4.3), stroke: 1pt + C-MID)
      line((0, 4.3), (total-w, 4.3), stroke: 1pt + C-MID)
    }
    // Part bars
    let x = 0.0
    for (i, p) in parts.enumerate() {
      let pw = pws.at(i)
      let ci = colors.at(calc.rem(i, colors.len()))
      let lab = if type(p) == dictionary { p.at("label", default: "?") } else { str(p) }
      let is-q = lab == "?"
      rect(
        (x, 1.0),
        (x + pw, 2.0),
        fill: if is-q { rgb("#FEF9C3") } else { ci.lighten(84%) },
        stroke: 1.5pt + (if is-q { C-GOLD } else { ci }),
      )
      content((x + pw / 2, 1.5), text(weight: "bold", size: 10pt, fill: if is-q { C-GOLD } else { ci })[#lab])
      x = x + pw
    }
  })
  layout(size => {
    let natural = measure(fig)
    if natural.width > 0pt and natural.width > size.width {
      let ratio = (size.width * 0.98) / natural.width
      align(center, scale(fig, x: ratio * 100%, y: ratio * 100%, origin: top + center, reflow: true))
    } else {
      align(center, fig)
    }
  })
}

// ─── Think deeper prompt (bilingual) ──────────────────────────────────────
#let suy-nghi(body) = block(
  fill: rgb("#F0F9FF"),
  stroke: (left: 4pt + C-SKY),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-SKY, weight: "bold", size: 10.5pt)[💭 Suy nghĩ / Think]
  #v(0.4em)
  #body
]

// ─── "What's wrong?" diagnostic box ─────────────────────────────────────
#let sai-o-dau(body) = block(
  fill: rgb("#FFF1F2"),
  stroke: (left: 4pt + C-RED),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-RED, weight: "bold", size: 10.5pt)[🔍 Tìm lỗi sai / Find the Mistake]
  #v(0.4em)
  #body
]

// ─── Brain challenge (nâng cao, kiểu Nhật/Singapore) ─────────────────────
#let nang-cao(body) = block(
  fill: gradient.linear(C-PURPLE.lighten(90%), C-BLUE.lighten(90%), angle: 30deg),
  stroke: 1.5pt + C-PURPLE,
  inset: (x: 14pt, y: 12pt),
  radius: 10pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "black", size: 11pt)[🧠 Toán Thông Minh / Smart Math Challenge]
  #v(0.4em)
  #body
]

// ─── Pattern box (nhận dạng quy luật) ────────────────────────────────────
#let quy-luat(body) = block(
  fill: rgb("#F0FDF4"),
  stroke: (left: 4pt + C-GREEN),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GREEN, weight: "bold", size: 10.5pt)[🔢 Quy Luật / Find the Pattern]
  #v(0.4em)
  #body
]

// ─── Bar-model coaching box ──────────────────────────────────────────────
#let so-do-thanh-goi-y(body) = block(
  fill: rgb("#EEF6FF"),
  stroke: (left: 4pt + C-BLUE, top: 1pt + C-BLUE.lighten(70%)),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-BLUE, weight: "bold", size: 10.5pt)[📏 Sơ Đồ Thanh / Bar Model Thinking]
  #v(0.4em)
  #body
]

// ─── Open-ended Japanese-style prompt ───────────────────────────────────
#let cau-hoi-mo(body) = block(
  fill: rgb("#FEFCE8"),
  stroke: (left: 4pt + C-GOLD),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 10.5pt)[🧩 Câu Hỏi Mở Kiểu Nhật / Open-ended Task]
  #v(0.4em)
  #body
]

// ─── Parent coaching box ────────────────────────────────────────────────
#let goc-dong-hanh(body) = block(
  fill: gradient.linear(rgb("#FFF9E6"), rgb("#FFFDE8"), angle: 90deg),
  stroke: (left: 4pt + C-GOLD, bottom: 1pt + C-GOLD.lighten(60%)),
  inset: (left: 14pt, right: 12pt, y: 12pt),
  radius: (right: 10pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 10.5pt)[👨‍👩‍👧 Đồng Hành Cùng Con / Parent Coaching]
  #v(0.4em)
  #set text(size: 9.6pt, fill: C-DARK)
  #body
]

// ─── Compare two methods box ────────────────────────────────────────────
#let hai-cach(body) = block(
  fill: rgb("#F5F3FF"),
  stroke: (left: 4pt + C-PURPLE, bottom: 1pt + C-PURPLE.lighten(70%)),
  inset: (left: 14pt, right: 12pt, y: 12pt),
  radius: (right: 10pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[♻️ Hai Cách Giải / Compare Two Methods]
  #v(0.4em)
  #body
]

