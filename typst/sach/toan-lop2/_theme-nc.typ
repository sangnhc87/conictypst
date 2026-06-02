// ══════════════════════════════════════════════════════════════════════════
// _theme-nc.typ — Quyển II Advanced Theme (imports base + adds new macros)
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

// ─── Advanced chapter palette (Quyển II) ─────────────────────────────────
#let C-CH-NC = (
  rgb("#3730A3"), // Ch1 Deep Indigo  — Tư Duy Số Học
  rgb("#1E3A8A"), // Ch2 Navy         — Tính Nhẩm Thần Tốc
  rgb("#065F46"), // Ch3 Forest       — Chiến Lược Giải Toán
  rgb("#6B21A8"), // Ch4 Plum         — Hình Học Nâng Cao
  rgb("#991B1B"), // Ch5 Crimson      — Thử Thách Tư Duy
)

// ─── Advanced chapter header (song ngữ + badge nâng cao) ─────────────────
#let chuong-header-nc(so: 1, ten-vi: "", ten-en: "", icon: "🧠", so-bai: "", so-trang: "") = {
  pagebreak(weak: true)
  let c = C-CH-NC.at(calc.min(so - 1, 4))
  block(
    width: 100%,
    fill: gradient.linear(c, c.darken(30%), angle: 135deg),
    inset: (x: 24pt, y: 22pt),
    radius: 14pt,
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr),
      gutter: 16pt,
      align(horizon)[
        #block(
          fill: white.transparentize(80%),
          inset: (x: 12pt, y: 10pt),
          radius: 10pt,
        )[
          #text(size: 32pt)[#icon]
        ]
      ],
      align(horizon)[
        #text(
          fill: white.transparentize(30%),
          size: 10pt,
          weight: "bold",
          tracking: 4pt,
        )[CHƯƠNG #str(so) — CHAPTER #str(so)]
        #v(0.2em)
        #text(fill: white, size: 19pt, weight: "black")[#ten-vi]
        #v(0.1em)
        #text(fill: rgb("#FCD34D"), size: 12pt, style: "italic")[#ten-en]
        #v(0.5em)
        #line(length: 70%, stroke: 0.8pt + white.transparentize(60%))
        #v(0.3em)
        #if so-bai != "" {
          text(fill: white.transparentize(25%), size: 9.5pt)[#so-bai bài học  •  #so-trang trang  •  ⭐⭐⭐ Nâng Cao]
        }
      ],
    )
  ]
  v(1.2em)
}

// ─── Advanced bilingual lesson header with difficulty ─────────────────────
#let bai-hoc-nc(so: "", ten-vi: "", ten-en: "", icon: "📖", kho: 2, c: C-SKY) = {
  v(0.8em)
  block(
    width: 100%,
    fill: gradient.linear(c, c.lighten(35%), angle: 8deg),
    inset: (x: 18pt, y: 11pt),
    radius: 10pt,
  )[
    #set par(first-line-indent: 0em)
    #grid(
      columns: (auto, 1fr, auto),
      gutter: 10pt,
      align(horizon)[
        #block(
          fill: white,
          inset: (x: 8pt, y: 5pt),
          radius: 7pt,
        )[
          #text(fill: c, weight: "black", size: 11pt)[BÀI #so]
        ]
      ],
      align(horizon)[
        #text(fill: white, weight: "black", size: 13pt)[#icon #h(4pt)#ten-vi]
        #v(0.1em)
        #text(fill: white.transparentize(20%), size: 10pt, style: "italic")[#ten-en]
      ],
      align(horizon)[
        #block(
          fill: white.transparentize(70%),
          inset: (x: 7pt, y: 4pt),
          radius: 5pt,
        )[
          #text(fill: white, size: 9pt)[
            #for i in range(5) {
              if i < kho { "★" } else { "☆" }
            }
          ]
        ]
      ],
    )
  ]
  v(0.5em)
}

// ─── Strategy hint box ────────────────────────────────────────────────────
#let chien-luoc(ten: "Chiến Lược", body) = block(
  fill: rgb("#FFFBEB"),
  stroke: (left: 4pt + C-GOLD),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 10.5pt)[💡 #ten / Strategy]
  #v(0.4em)
  #body
]

// ─── Discovery/exploration box ────────────────────────────────────────────
#let kham-pha(body) = block(
  fill: rgb("#F0FDFA"),
  stroke: (left: 4pt + C-TEAL, top: 1.5pt + C-TEAL.lighten(60%)),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[🔭 Khám Phá / Explore]
  #v(0.4em)
  #body
]

// ─── Logical reasoning box ────────────────────────────────────────────────
#let suy-luan(body) = block(
  fill: rgb("#EDE9FE"),
  stroke: (left: 4pt + C-PURPLE, right: 1pt + C-PURPLE.lighten(70%)),
  inset: (left: 12pt, right: 10pt, y: 10pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[🎯 Suy Luận / Reason Step-by-Step]
  #v(0.4em)
  #body
]

// ─── Competition/Olympiad problem box ─────────────────────────────────────
#let olympiad(the-loai: "Toán Tư Duy", body) = block(
  fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 160deg),
  stroke: 2pt + rgb("#FCD34D"),
  inset: (x: 16pt, y: 14pt),
  radius: 12pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align(horizon)[#text(size: 22pt)[🏆]],
    align(horizon)[
      #text(fill: rgb("#FCD34D"), weight: "black", size: 11pt)[THI TƯ DUY — OLYMPIAD]
      #v(0.1em)
      #text(fill: rgb("#C7D2FE"), size: 9.5pt)[#the-loai]
    ],
  )
  #v(0.6em)
  #set text(fill: white)
  #body
]

// ─── Mystery number puzzle box ────────────────────────────────────────────
#let so-bi-an(body) = block(
  fill: rgb("#FFF7ED"),
  stroke: 1.5pt + C-ORANGE,
  inset: (x: 14pt, y: 12pt),
  radius: 10pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-ORANGE, weight: "bold", size: 10.5pt)[🔮 Số Bí Ẩn / Mystery Number]
  #v(0.4em)
  #body
]

// ─── Difficulty meter (1-5 stars) ─────────────────────────────────────────
#let do-kho(n: 3) = {
  for i in range(5) {
    if i < n {
      text(fill: C-GOLD, size: 11pt)[★]
    } else {
      text(fill: C-LIGHT, size: 11pt)[★]
    }
  }
}

// ─── Square grid for area/logic (n cols × m rows) ─────────────────────────
#let luoi-ke(cols: 5, rows: 5, cell-size: 0.7cm, fills: ()) = canvas(length: 1cm, {
  import draw: *
  let cs = 0.7
  for r in range(rows) {
    for c in range(cols) {
      let idx = r * cols + c
      let f = if idx < fills.len() { fills.at(idx) } else { white }
      rect(
        (c * cs, r * cs),
        ((c + 1) * cs, (r + 1) * cs),
        fill: f,
        stroke: 0.8pt + C-MID,
      )
    }
  }
})

// ─── Magic square grid (3×3, values = list of 9 items) ───────────────────
#let o-ma-thuat(vals: ("", "", "", "", "", "", "", "", ""), c: C-BLUE) = {
  table(
    columns: (3 * (1.2cm,)),
    rows: (3 * (1.2cm,)),
    align: center + horizon,
    inset: 0pt,
    stroke: 1.5pt + c,
    fill: (x, y) => if calc.even(x + y) { c.lighten(90%) } else { white },
    ..vals.map(v => text(weight: "bold", size: 13pt)[#v]),
  )
}

// ─── Advanced chapter review test header ──────────────────────────────────
#let kiem-tra-nc(chuong: "", ten: "", so-cau: "8", tg: "25 phút", diem: "10") = {
  pagebreak(weak: true)
  block(
    width: 100%,
    fill: gradient.linear(rgb("#1E1B4B"), rgb("#312E81"), angle: 90deg),
    inset: (x: 22pt, y: 18pt),
    radius: 12pt,
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      #text(fill: rgb("#A5B4FC"), size: 10pt, weight: "bold", tracking: 3pt)[KIỂM TRA NÂNG CAO — ADVANCED TEST]
      #v(0.3em)
      #text(fill: white, size: 15pt, weight: "black")[🏆 Chương #chuong: #ten]
      #v(0.5em)
      #line(length: 60%, stroke: 0.8pt + rgb("#6366F1"))
      #v(0.4em)
      #grid(
        columns: (1fr, 1fr, 1fr),
        text(fill: rgb("#C7D2FE"), size: 9.5pt)[📝 #so-cau câu],
        text(fill: rgb("#C7D2FE"), size: 9.5pt)[⏱ #tg],
        text(fill: rgb("#C7D2FE"), size: 9.5pt)[⭐⭐⭐ #diem điểm],
      )
    ]
  ]
  v(0.4em)
  grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    block(stroke: (bottom: 1pt + C-LIGHT), inset: (bottom: 4pt), width: 100%)[#text(size: 10pt)[Họ và tên: ]],
    block(stroke: (bottom: 1pt + C-LIGHT), inset: (bottom: 4pt), width: 100%)[#text(size: 10pt)[Ngày: ]],
  )
  v(0.8em)
}

// ─── Bilingual worked example box ─────────────────────────────────────────
#let vi-du-nc(ten: "Ví Dụ", ten-en: "Worked Example", c: C-GREEN, body) = block(
  fill: c.lighten(90%),
  stroke: (left: 4pt + c, top: 1pt + c.lighten(70%)),
  inset: (left: 14pt, right: 12pt, y: 12pt),
  radius: (right: 10pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, auto),
    gutter: 8pt,
    text(fill: c, weight: "bold", size: 10.5pt)[📘 #ten],
    text(fill: c.lighten(20%), size: 9pt, style: "italic")[#ten-en],
  )
  #v(0.4em)
  #body
]

// ─── Parent / Teacher teaching corner ─────────────────────────────────────
#let goc-phu-huynh(body) = block(
  fill: gradient.linear(rgb("#FFF9E6"), rgb("#FFFDE8"), angle: 90deg),
  stroke: (left: 4pt + C-GOLD, bottom: 1pt + C-GOLD.lighten(60%)),
  inset: (left: 14pt, right: 12pt, y: 12pt),
  radius: (right: 10pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-GOLD, weight: "bold", size: 10.5pt)[👨‍👩‍👧 Góc Phụ Huynh & Giáo Viên / Parent & Teacher Corner]
  #v(0.4em)
  #set text(size: 9.5pt, fill: C-DARK)
  #body
]

// ─── Chapter summary / key points box ─────────────────────────────────────
#let ket-chuong(so: 1, diem: (), body) = {
  pagebreak(weak: true)
  let c = C-CH-NC.at(calc.min(so - 1, 4))
  block(
    width: 100%,
    fill: gradient.linear(c.lighten(88%), white, angle: 90deg),
    stroke: (top: 3pt + c, bottom: 1pt + c.lighten(70%)),
    inset: (x: 20pt, y: 18pt),
    radius: 12pt,
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      #text(fill: c, size: 14pt, weight: "black")[📌 Tóm Tắt Chương #str(so) — Chapter #str(so) Summary]
    ]
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 16pt,
      [
        #text(fill: c, weight: "bold")[🧠 Những điều đã học:]
        #v(0.3em)
        #body
      ],
      if diem.len() > 0 [
        #text(fill: c, weight: "bold")[⭐ Điểm nổi bật / Highlights:]
        #v(0.3em)
        #set text(size: 9.5pt)
        #for d in diem {
          [• #d \ ]
        }
      ],
    )
  ]
  v(0.8em)
}

// ─── Thinking lab box ───────────────────────────────────────────────────
#let phong-thi-nghiem(body) = block(
  fill: gradient.linear(rgb("#ECFEFF"), rgb("#EEF2FF"), angle: 90deg),
  stroke: (left: 4pt + C-TEAL, top: 1pt + C-CH-NC.at(1).lighten(65%)),
  inset: (left: 14pt, right: 12pt, y: 12pt),
  radius: (right: 10pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[🧪 Phòng Thí Nghiệm Tư Duy / Thinking Lab]
  #v(0.4em)
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
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[♻️ Hai Cách Giải / Compare Methods]
  #v(0.4em)
  #body
]
