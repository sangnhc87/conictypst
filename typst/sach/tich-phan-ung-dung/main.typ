// ╔═════════════════════════════════════════════════════════════════════
// TÍCH PHÂN — ỨNG DỤNG THỰC TẾ TRONG ĐỜI SỐNG
// Chuyên đề Toán 12 — Chương trình GDPT 2018
// Tác giả: GV Nguyễn Văn Sang
// ╚═════════════════════════════════════════════════════════════════════

#import "_config.typ": *

#show: stexgv-book.with(
  title: "TÍCH PHÂN ỨNG DỤNG",
  subtitle: "Từ Tích lũy đến Hình khối — Thực chiến ĐGNL",
  author: "GV Nguyễn Văn Sang",
  theme-color: c-book,
  doc-type: "chuyende",
  institution: "Tổ Toán – Tài liệu Chuyên sâu",
  subject: "Toán",
  grade: "Lớp 12",
  series: "Bộ tài liệu Thực chiến ĐGNL",
  academic-year: "2025 – 2026",
  outline-depth: 4,
  show-cover: false,
  show-outline: false,
)

// ─── Trang & font ────────────────────────────────────────────────────────
#set page(margin: (top: 1.8cm, bottom: 1.8cm, inside: 2cm, outside: 1.5cm))
#set text(size: 12pt)
#set par(leading: 0.72em, spacing: 1.25em)

// ─── Tuỳ chỉnh Mục lục ──────────────────────────────────────────────────
#show outline.entry.where(level: 1): it => {
  v(0.8em)
  link(it.element.location())[
    #block(
      width: 100%,
      fill: c-book,
      inset: (x: 14pt, y: 10pt),
      radius: 6pt,
    )[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(fill: white, weight: "bold", size: 12pt)[#it.body()],
        box(fill: white.transparentize(72%), inset: (x: 8pt, y: 3pt), radius: 3pt)[
          #text(fill: white, size: 11pt, weight: "bold")[#it.page()]
        ],
      )
    ]
  ]
}

#show outline.entry.where(level: 2): it => {
  v(0.18em)
  h(14pt)
  link(it.element.location())[
    #box(
      width: 100% - 14pt,
      fill: c-book.lighten(91%),
      stroke: (left: 3pt + c-book.lighten(15%)),
      inset: (x: 12pt, y: 7pt),
    )[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(fill: c-book.darken(10%), size: 10.5pt)[#it.body()],
        text(fill: c-book.lighten(20%), size: 10pt, weight: "bold")[#it.page()],
      )
    ]
  ]
}

#show outline.entry.where(level: 3): it => {
  v(0.1em)
  h(22pt)
  link(it.element.location())[
    #box(
      width: 100% - 22pt,
      fill: c-book.lighten(95%),
      stroke: (left: 2.5pt + c-book.lighten(20%)),
      inset: (x: 10pt, y: 5pt),
    )[
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(fill: c-book.darken(5%), size: 10pt)[#it.body()],
        text(fill: c-book.lighten(20%), size: 9.5pt, weight: "bold")[#it.page()],
      )
    ]
  ]
}

#show outline.entry.where(level: 4): it => {
  v(0.04em)
  h(38pt)
  link(it.element.location())[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      column-gutter: 6pt,
      text(fill: rgb("#64748b"), size: 9.5pt)[◦ #it.body()], text(fill: rgb("#94a3b8"), size: 9pt)[#it.page()],
    )
  ]
}

// ████████████████████████████████████████████████████████████████████
// BÌA SÁCH  (chỉnh sửa trong bia.typ)
// ████████████████████████████████████████████████████████████████████
#include "bia.typ"

// ████████████████████████████████████████████████████████████████████
// MỤC LỤC
// ████████████████████████████████████████████████████████████████████
#{
  v(2em)
  align(center, {
    text(size: 22pt, weight: "bold", fill: c-book)[MỤC LỤC]
    v(0.55em)
    block(width: 70%)[
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        rect(height: 4pt, fill: c-p0, stroke: none),
        rect(height: 4pt, fill: c-p1, stroke: none),
        rect(height: 4pt, fill: c-p2, stroke: none),
        rect(height: 4pt, fill: c-p3, stroke: none),
        rect(height: 4pt, fill: c-p4, stroke: none),
        rect(height: 4pt, fill: c-p5, stroke: none),
      )
    ]
  })
  v(1.5em)
  outline(title: none, depth: 4, indent: auto)
  pagebreak()
}

// ████████████████████████████████████████████████████████████████████
// PHẦN MỞ ĐẦU
// ████████████████████████████████████████████████████████████████████

#include "front/loinoidau.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 1 — CƠ SỞ LÝ THUYẾT VÀ BÀI TẬP THUẦN TÚY
// ████████████████████████████████████████████████████████████████████

#include "phan0/_part.typ"
#include "phan0/c1.typ"
#include "phan0/c2.typ"
#include "phan0/c3.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 2 — SỰ THAY ĐỔI VÀ TÍCH LŨY
// ████████████████████████████████████████████████████████████████████

#include "phan1/_part.typ"
#include "phan1/c1.typ"
#include "phan1/c2.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 3 — ĐỘNG HỌC VÀ VẬT LÝ KỸ THUẬT
// ████████████████████████████████████████████████████████████████████

#include "phan2/_part.typ"
#include "phan2/c1.typ"
#include "phan2/c2.typ"
#include "phan2/c3.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 4 — ỨNG DỤNG HÌNH HỌC PHẲNG: DIỆN TÍCH 2D
// ████████████████████████████████████████████████████████████████████

#include "phan3/_part.typ"
#include "phan3/c1.typ"
#include "phan3/c2.typ"
#include "phan3/c3.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 5 — THỂ TÍCH KHÔNG GIAN BẰNG THIẾT DIỆN
// ████████████████████████████████████████████████████████████████████

#include "phan4/_part.typ"
#include "phan4/c1.typ"
#include "phan4/c2.typ"

// ████████████████████████████████████████████████████████████████████
// PHẦN 6 — THỂ TÍCH KHỐI TRÒN XOAY
// ████████████████████████████████████████████████████████████████████

#include "phan5/_part.typ"
#include "phan5/c1.typ"
#include "phan5/c2.typ"

// ████████████████████████████████████████████████████████████████████
// PHỤ LỤC
// ████████████████████████████████████████████████████████████████████

#include "back/thuatngu.typ"
