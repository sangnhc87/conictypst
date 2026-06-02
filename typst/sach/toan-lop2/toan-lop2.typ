// ══════════════════════════════════════════════════════════════════════════
// toan-lop2.typ — Main driver
// Compile: typst compile --root typst typst/sach/toan-lop2/toan-lop2.typ toan-lop2.pdf
// ══════════════════════════════════════════════════════════════════════════

#import "_theme.typ": *

// ── Trang ────────────────────────────────────────────────────────────────
#set page(
  paper: "a4",
  fill: C-CREAM,
  margin: (left: 2.5cm, right: 1.8cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let pg = counter(page).get().first()
    if pg > 3 {
      let chs = ("Số đến 1 000", "Cộng và Trừ", "Nhân và Chia", "Hình Học", "Đo Lường")
      let ch-icons = ("🔢", "➕", "✖️", "📐", "📏")
      // Chọn chương theo số trang (ước lượng)
      let chi = if pg <= 25 { 0 } else if pg <= 50 { 1 } else if pg <= 72 { 2 } else if pg <= 88 { 3 } else { 4 }
      let c = C-CH.at(chi)
      grid(
        columns: (1fr, auto, 1fr),
        align(left, text(fill: c, size: 9pt)[#ch-icons.at(chi) #chs.at(chi)]),
        align(center, text(fill: C-MID, size: 8.5pt)[Toán Tư Duy Lớp 2]),
        align(right, text(fill: C-MID, size: 9pt)[]),
      )
      line(length: 100%, stroke: 0.5pt + C-LIGHT)
    }
  },
  footer: context {
    let pg = counter(page).get().first()
    if pg > 3 {
      line(length: 100%, stroke: 0.5pt + C-LIGHT)
      v(0.15em)
      grid(
        columns: (1fr, auto),
        align(left, text(fill: C-MID, size: 8.5pt, style: "italic")[Sách dành cho Conic - Cục Vàng yêu quý của Ba Mẹ]),
        align(right, text(fill: C-MID, size: 9pt)[Trang #counter(page).display()]),
      )
    }
  },
)

// ── Văn bản ──────────────────────────────────────────────────────────────
#set text(
  font: "New Computer Modern",
  size: 12.5pt,
  lang: "vi",
  fill: C-DARK,
)
#set par(
  justify: true,
  leading: 1.05em,
  first-line-indent: 1.4em,
)
#set list(indent: 1.2em, body-indent: 0.6em, marker: [•])
#set enum(indent: 1.2em, body-indent: 0.6em)

// ── Heading styles ────────────────────────────────────────────────────────
#show heading: set par(first-line-indent: 0em)

#show heading.where(level: 1): it => {
  v(0.8em)
  block(
    width: 100%,
    fill: gradient.linear(C-SKY, C-TEAL, angle: 5deg),
    inset: (x: 18pt, y: 12pt),
    radius: 10pt,
  )[
    #set text(fill: white, weight: "black", size: 15pt)
    #set par(first-line-indent: 0em)
    #it.body
  ]
  v(0.6em)
}

#show heading.where(level: 2): it => {
  v(0.5em)
  block(
    width: 100%,
    fill: rgb("#EBF8FF"),
    stroke: (left: 4pt + C-SKY),
    inset: (left: 12pt, right: 10pt, y: 8pt),
    radius: (right: 6pt),
  )[
    #set text(fill: C-SKY, weight: "bold", size: 12.5pt)
    #set par(first-line-indent: 0em)
    #it.body
  ]
  v(0.3em)
}

#show heading.where(level: 3): it => {
  v(0.3em)
  block(
    fill: C-LAVENDER,
    inset: (x: 10pt, y: 6pt),
    radius: 6pt,
  )[
    #set text(fill: C-PURPLE, weight: "bold", size: 11.5pt)
    #set par(first-line-indent: 0em)
    #it.body
  ]
  v(0.2em)
}

// ── Nội dung ──────────────────────────────────────────────────────────────
#include "front.typ"

#counter(page).update(1)

#include "c1-so-hoc.typ"
#include "c2-cong-tru.typ"
#include "c3-nhan-chia.typ"
#include "c4-hinh-hoc.typ"
#include "c5-do-luong.typ"
#include "back.typ"
