#import "_config.typ": *

#show: stexgv-book.with(
  title: "HÀM SỐ MŨ VÀ LOGARIT — CHƯƠNG 2",
  subtitle: "Sức mạnh của tăng trưởng và mô hình thực tế",
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

#let c-title = rgb("#2c3e50")
#let c-box = rgb("#ecf0f1")
#let c-main = rgb("#e74c3c")

#align(center)[
  #text(size: 24pt, weight: "bold", fill: c-book)[CHƯƠNG II: HÀM SỐ MŨ VÀ HÀM SỐ LOGARIT]
]
#v(1em)

#include "c2-flowchart.typ"
#include "c2-b1.typ"
#include "c2-b2.typ"
#include "c2-b3.typ"
#include "c2-b4.typ"
#include "c2-b5.typ"
#include "c2-b7-casestudy.typ"
#include "c2-b8-bachkhoa-thucte.typ"
// #include "c2-b6.typ"
