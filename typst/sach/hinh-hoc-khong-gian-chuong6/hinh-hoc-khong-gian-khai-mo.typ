#import "_theme.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(columns: (1fr, 1fr),
        align(left)[#text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[Tư Duy Đại Bác Diệt Ruồi — Tập 6: Hình Học Không Gian]],
        align(right)[#text(size: 8pt, fill: rgb("#1E3A8A"), weight: "bold")[Từ Hình Khối Tới Oxyz]],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 { text(size: 9pt, fill: rgb("#607D8B"))[— #counter(page).display() —] }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0A0A0A"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display
#show heading: it => [
  #set par(first-line-indent: 0em)
  #it
]
#show heading.where(level: 1): it => [
  #pagebreak(weak: true)
  #block(
    fill: gradient.linear(C-FOREST, C-EMERALD, angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: white, weight: "black", size: 14pt)[#it.body]
  ]
  #v(0.9em)
]
#show heading.where(level: 2): it => block(
  fill: rgb("#F0FDFA"),
  stroke: (left: 4pt + C-EMERALD),
  inset: (x: 14pt, y: 10pt),
  radius: (right: 5pt),
  width: 100%,
  above: 1.2em,
  below: 0.6em,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-FOREST, weight: "bold", size: 12pt)[#it.body]
]

#cover-box([TẬP 6: HÌNH HỌC KHÔNG GIAN],[Một Con Đường Từ Hình Khối Euclide Tới Vectơ Và Oxyz])

#v(1em)
#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 6]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      Nếu quyển hình học phẳng dạy ta nhìn quan hệ trong một mặt phẳng, thì quyển này dạy ta thêm một kỹ năng khó hơn nhiều: giữ được cấu trúc khi mắt người không còn thấy hết không gian.
      #linebreak()
      Hình học không gian đi từ song song, vuông góc, khoảng cách, thiết diện và hình chiếu trong tinh thần Euclide, rồi được nén mạnh bởi vectơ và hệ tọa độ Oxyz trong tinh thần Descartes.
      #linebreak()
      Mục tiêu là biến không gian từ một nơi dễ mơ hồ thành một cấu trúc có thể suy nghĩ, tính toán và mô hình hóa.
    ]
  ]
]

#v(0.9em)
#quote-block[Không gian khó không phải vì nó có thêm một chiều. Nó khó vì trực giác mắt người yếu đi rất nhanh khi nhiều quan hệ cùng xuất hiện. Đó là lý do hình chiếu, vectơ và tọa độ không phải đồ trang trí; chúng là các thiết bị giúp trí óc giữ cấu trúc trong 3D.]

#v(1em)
#outline(title: [Mục Lục Tập 6], depth: 2)
#pagebreak()

#include "parts/01-khai-mo.typ"
#include "parts/02-xuong-chieu-sau.typ"