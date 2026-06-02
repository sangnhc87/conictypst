#import "_theme.typ": *

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.6cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(
          size: 8pt,
          fill: rgb("#607D8B"),
          style: "italic",
        )[Tư Duy Đại Bác Diệt Ruồi — Tập 5: Hình Học Phẳng]],
        align(right)[#text(size: 8pt, fill: rgb("#1F4E79"), weight: "bold")[Từ Euclide Tới Descartes]],
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

#cover-box([TẬP 5: HÌNH HỌC PHẲNG], [Một Con Đường Từ Euclide Tới Descartes Trong Mặt Phẳng])

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
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 5]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic")[
      Nếu giải tích dạy ta nhìn sự thay đổi, còn xác suất dạy ta nhìn khả năng, thì hình học phẳng dạy ta một kỹ năng nền hơn nữa: nhìn quan hệ không gian mà không bị ký hiệu che mờ.
      #linebreak()
      Quyển này đi từ Euclide, nơi hình vẽ và lập luận chiếm trung tâm, tới Descartes, nơi hình được nén thành phương trình và tọa độ.
      #linebreak()
      Mục tiêu không phải là biến hình học thành một kho mẹo chứng minh hay công thức tọa độ, mà là thấy hai ngôn ngữ ấy thực ra đang nói cùng một thế giới bằng hai giọng khác nhau.
    ]
  ]
]

#v(0.9em)
#quote-block[Hình học phẳng không chỉ hỏi “vẽ gì” hay “tính gì”. Nó hỏi: quan hệ nào là bất biến khi hình đổi dạng, và khi nào một hình nên được nhìn bằng mắt Euclide, khi nào nên được nén bằng tọa độ Descartes?]

#v(1em)
#outline(title: [Mục Lục Tập 5], depth: 2)
#pagebreak()

#include "parts/01-khai-mo.typ"
#include "parts/02-xuong-chieu-sau.typ"
