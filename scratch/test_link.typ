#set page(
  paper: "a4",
  margin: (x: 1.4cm, y: 1.8cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 2 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8.5pt, fill: rgb("#7f8c8d"))[Tài liệu Toán HSG]
        ],
        align(right)[
          #link(<muc-luc>)[#text(size: 8.5pt, fill: rgb("#1A237E"), weight: "bold")[Quay lại Mục lục 📑]]
        ]
      )
    }
  }
)

#align(center)[Cover Page]
#pagebreak()

#outline(title: "Mục Lục") <muc-luc>
#pagebreak()

= Chapter 1
Content on page 3.

#pagebreak()
= Chapter 2
Content on page 4.
