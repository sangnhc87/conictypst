#import "_config.typ": *

#show: stexgv-book.with(
  title: "DÃY SỐ, CẤP SỐ CỘNG VÀ CẤP SỐ NHÂN — CHƯƠNG 3",
  subtitle: "Đại Bác Diệt Ruồi: Tăng trưởng Tuyến tính & Tăng trưởng Bùng nổ",
  author: "GV Nguyễn Văn Sang",
  theme-color: c-book,
  doc-type: "chuyende",
  institution: "Tổ Toán – Tài liệu Chuyên sâu",
  subject: "Toán",
  grade: "Lớp 11",
  series: "Bộ tài liệu Tư Duy Đại Bác Diệt Ruồi",
  academic-year: "2025 – 2026", 
  outline-depth: 4,
  show-cover: false,
  show-outline: false,
)

#set page(margin: (top: 1.8cm, bottom: 1.8cm, inside: 1.75cm, outside: 1.75cm))
#set text(size: 12pt)
#set par(leading: 0.72em, spacing: 1.25em)

#{
  v(2em)
  align(center)[
    #text(size: 22pt, weight: "bold", fill: c-book)[MỤC LỤC]
  ]
  v(1em)
  outline(title: none, depth: 4, indent: auto)
  pagebreak()
}

#include "c3-flowchart.typ"
#pagebreak()

#include "c3-b1.typ"
#include "c3-b1-de1.typ"
#include "c3-b2.typ"
#include "c3-b2-de1.typ"
#include "c3-b3.typ"
#include "c3-b3-de1.typ"
