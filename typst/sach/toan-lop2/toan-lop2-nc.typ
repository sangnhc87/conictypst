// ══════════════════════════════════════════════════════════════════════════
// toan-lop2-nc.typ — TOÁN NÂNG CAO LỚP 2 / Advanced Math Grade 2
//   Quyển II — Volume II
//   Compile: typst compile --root /Users/admin/conictypst typst/sach/toan-lop2/toan-lop2-nc.typ toan-lop2-nc.pdf
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

// ─── Page setup ────────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  fill: rgb("#FFFDF5"),
  margin: (left: 2.5cm, right: 1.8cm, top: 2.2cm, bottom: 2.6cm),
)

#set text(
  font: "New Computer Modern",
  size: 12.5pt,
  lang: "vi",
  fill: C-DARK,
)

#set par(leading: 0.75em, first-line-indent: 1em)

// ─── Running header ─────────────────────────────────────────────────────────
#let chapter-info = state("ch", (name: "Mục Lục", icon: "📋"))

#let ch-data = (
  (name: "Tư Duy Số Học", icon: "🧠", from: 7, to: 24),
  (name: "Tính Nhẩm Thần Tốc", icon: "⚡", from: 25, to: 42),
  (name: "Chiến Lược Giải Toán", icon: "🎯", from: 43, to: 62),
  (name: "Hình Học Nâng Cao", icon: "📐", from: 63, to: 80),
  (name: "Thử Thách Tư Duy", icon: "🏆", from: 81, to: 100),
)

#let get-ch(pg) = {
  let result = (name: "Phụ Lục", icon: "📖")
  for d in ch-data {
    if pg >= d.from and pg <= d.to {
      result = (name: d.name, icon: d.icon)
    }
  }
  result
}

#set page(
  header: context {
    let pg = counter(page).get().at(0)
    if pg > 4 {
      let info = get-ch(pg)
      grid(
        columns: (1fr, auto, 1fr),
        align(left + horizon)[
          #text(fill: C-MID, size: 9pt, style: "italic")[Toán Nâng Cao Lớp 2]
        ],
        align(center + horizon)[
          #text(fill: C-CH-NC.at(0), size: 9.5pt, weight: "bold")[#info.icon #h(4pt)#info.name]
        ],
        align(right + horizon)[
          #text(fill: C-MID, size: 9pt, style: "italic")[Advanced Math — Vol. II]
        ],
      )
      v(-0.4em)
      line(length: 100%, stroke: 0.7pt + C-LIGHT)
    }
  },
  footer: context {
    let pg = counter(page).get().at(0)
    if pg > 4 {
      line(length: 100%, stroke: 0.7pt + C-LIGHT)
      v(-0.2em)
      grid(
        columns: (1fr, auto, 1fr),
        align(left + horizon)[
          #text(fill: C-MID, size: 8.5pt)[Quyển II — Volume II]
        ],
        align(center + horizon)[
          #block(
            fill: C-CH-NC.at(0),
            inset: (x: 10pt, y: 3pt),
            radius: 10pt,
          )[
            #text(fill: white, weight: "bold", size: 9pt)[#str(pg)]
          ]
        ],
        align(right + horizon)[
          #text(fill: C-MID, size: 8.5pt)[Toán Nâng Cao ⭐⭐⭐⭐]
        ],
      )
    }
  },
)

// ─── Heading show rules ─────────────────────────────────────────────────────
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(C-CH-NC.at(0), rgb("#1E3A8A"), angle: 90deg),
  inset: (x: 18pt, y: 12pt),
  radius: 10pt,
  below: 1em,
)[
  #set text(fill: white, size: 16pt, weight: "black")
  #it.body
]

#show heading.where(level: 2): it => block(
  width: 100%,
  fill: C-CH-NC.at(0).lighten(90%),
  stroke: (left: 4pt + C-CH-NC.at(0)),
  inset: (left: 14pt, right: 10pt, y: 10pt),
  radius: (right: 8pt),
  above: 1.2em,
  below: 0.8em,
)[
  #set text(fill: C-CH-NC.at(0), size: 13pt, weight: "bold")
  #it.body
]

#show heading.where(level: 3): it => block(
  fill: C-LAVENDER,
  inset: (x: 12pt, y: 8pt),
  radius: 6pt,
  above: 1em,
  below: 0.6em,
)[
  #set text(fill: C-PURPLE, size: 11pt, weight: "bold")
  #it.body
]

// ══════════════════════════════════════════════════════════════════════════
// CONTENT
// ══════════════════════════════════════════════════════════════════════════

#include "front-nc.typ"

#counter(page).update(1)

#include "nc1-tu-duy.typ"

#include "nc2-phep-tinh.typ"

#include "nc3-toan-do.typ"

#include "nc4-hinh-hoc.typ"

#include "nc5-thu-thach.typ"

#include "nc-luyen-tap.typ"

#include "nc-luyen-tap2.typ"

#include "nc-luyen-tap3.typ"

#include "nc-extras.typ"

#include "back-nc.typ"
