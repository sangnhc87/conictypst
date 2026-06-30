#import "_config.typ": *

#show: stexgv-book.with(
  title: "ĐẠO HÀM VÀ ỨNG DỤNG",
  subtitle: "Mô hình hóa Toán học & Chuyển động",
  author: "GV Nguyễn Văn Sang",
  theme-color: c-book,
  doc-type: "chuyende",
  institution: "Tổ Toán – Tài liệu Lớp 11",
  subject: "Toán",
  grade: "Lớp 11",
  series: "Phiên bản Dành riêng Lớp 11",
  academic-year: "2025 – 2026",
  outline-depth: 4,
  show-cover: false,
  show-outline: false,
)

// ─── Trang & font ────────────────────────────────────────────────────────
#set page(margin: (top: 1.8cm, bottom: 1.8cm, inside: 2cm, outside: 1.5cm))
#set text(size: 12pt)
#set par(leading: 0.72em, spacing: 1.25em)

// Tuỳ chỉnh mục lục (như các file khác)
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

#{
  v(2em)
  align(center)[
    #text(size: 22pt, weight: "bold", fill: c-book)[MỤC LỤC ĐẠO HÀM LỚP 11]
  ]
  v(1.5em)
  outline(title: none, depth: 4, indent: auto)
  pagebreak()
}

// ─── PHẦN CHÍNH ─────────────────────────────────────────────────────────

#include "TDMX301_Co-ban-ve-dao-ham.typ"
#include "TDMX302_Ham-hop-va-dao-ham.typ"
#include "TDMX303_Dao-ham-cap-hai-va-ung-dung.typ"
