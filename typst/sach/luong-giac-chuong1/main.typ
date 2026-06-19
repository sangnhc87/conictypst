#import "_config.typ": *

#show: stexgv-book.with(
  title: "HÀM SỐ LƯỢNG GIÁC — CHƯƠNG 1",
  subtitle: "Ngôn ngữ của tuần hoàn: Góc, Đường tròn, Hàm số và Phương trình",
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

#include "c1-flowchart.typ"
#pagebreak()

#include "c1-b1.typ"
#include "c1-b2.typ"
#include "c1-b4.typ"
#include "c1-b-hamso.typ"
#include "c1-b3.typ"
#include "c1-b5.typ"
#include "c1-b6.typ"
