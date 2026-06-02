// ══════════════════════════════════════════════════════════════════════════
// toan-lop2-nc-GIAIVI.typ — BẢN DÀNH CHO PHỤ HUYNH & GIÁO VIÊN
//   Full Solutions & Parent Guide — Toán Nâng Cao Lớp 2 Quyển II
//   Compile: typst compile --root /Users/admin/conictypst typst/sach/toan-lop2/toan-lop2-nc-GIAIVI.typ toan-lop2-nc-GIAIVI.pdf
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ─── Page setup ─────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  fill: rgb("#FAFAF8"),
  margin: (left: 2.5cm, right: 1.8cm, top: 2.2cm, bottom: 2.6cm),
)

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "vi",
  fill: C-DARK,
)

#set par(leading: 0.75em, first-line-indent: 1em)

// ─── Running header (GV edition indicator) ──────────────────────────────
#set page(
  header: context {
    let pg = counter(page).get().at(0)
    if pg > 1 {
      grid(
        columns: (1fr, auto, 1fr),
        align(left + horizon)[
          #text(fill: C-ORANGE, size: 9pt, weight: "bold")[👨‍🏫 BẢN GIÁO VIÊN / PARENT EDITION]
        ],
        align(center + horizon)[
          #text(fill: C-MID, size: 9.5pt)[Toán Nâng Cao Lớp 2 — Hướng Dẫn Giải]
        ],
        align(right + horizon)[
          #text(fill: C-MID, size: 9pt, style: "italic")[Not For Student Use]
        ],
      )
      v(-0.4em)
      line(length: 100%, stroke: 1pt + C-ORANGE.lighten(60%))
    }
  },
  footer: context {
    let pg = counter(page).get().at(0)
    if pg > 1 {
      line(length: 100%, stroke: 0.7pt + C-LIGHT)
      v(-0.2em)
      grid(
        columns: (1fr, auto, 1fr),
        align(left + horizon)[
          #text(fill: C-MID, size: 8.5pt)[Hướng Dẫn Giải — Full Solutions]
        ],
        align(center + horizon)[
          #block(
            fill: C-ORANGE,
            inset: (x: 10pt, y: 3pt),
            radius: 10pt,
          )[
            #text(fill: white, weight: "bold", size: 9pt)[#str(pg)]
          ]
        ],
        align(right + horizon)[
          #text(fill: C-MID, size: 8.5pt)[© Toán Nâng Cao Lớp 2]
        ],
      )
    }
  },
)

// ─── Heading styles (orange theme for teacher edition) ───────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("#C2410C"), rgb("#EA580C"), angle: 90deg),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
  below: 1em,
)[
  #set text(fill: white, size: 16pt, weight: "black")
  #it.body
]

#show heading.where(level: 2): it => block(
  width: 100%,
  fill: C-ORANGE.lighten(88%),
  stroke: (left: 4pt + C-ORANGE),
  inset: (left: 14pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  above: 1.2em,
  below: 0.8em,
)[
  #set text(fill: C-ORANGE.darken(20%), size: 13pt, weight: "bold")
  #it.body
]

// ══════════════════════════════════════════════════════════════════════════
// CONTENT — Lời giải toàn diện
// ══════════════════════════════════════════════════════════════════════════

#include "back-nc-full.typ"
