import re

typst_code = """#set page(
  paper: "a5",
  flipped: true,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 16pt, height: 16pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
  circle(
    radius: 5pt,
    stroke: 0.5pt + rgb("#333333"),
    fill: white,
    align(center + horizon)[#text(size: 7pt, weight: "bold", fill: rgb("#444444"))[#label]],
  )
}

#place(top + left, dx: -3mm, dy: -3mm, marker)
#place(top + right, dx: 3mm, dy: -3mm, marker)
#place(bottom + left, dx: -3mm, dy: 3mm, marker)
#place(bottom + right, dx: 3mm, dy: 3mm, marker)

#v(3pt)

// HEADER BLOCK
#block(
  width: 100%,
  [
    #grid(
      columns: (1fr, auto),
      [
        #text(size: 11pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]
        #v(4pt)
        Họ và tên: .............................................................. \
        #v(4pt)
        Lớp: .................... Môn: .................... Điểm: .......
      ],
      [
        // Optional right-side header content
      ]
    )
  ]
)
#v(4pt)
#line(length: 100%, stroke: 0.8pt)

// MAIN BLOCK
#let sbd-box = block(
  stroke: (right: 0.8pt),
  inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
    #v(3pt)
    #grid(
      columns: (12pt,) * 6, gutter: 1.5pt, align: center,
      ..range(6).map(i => box(stroke: 0.8pt + black, width: 11pt, height: 11pt))
    )
    #v(3pt)
    #grid(
      columns: (12pt,) * 6, row-gutter: 2.5pt, column-gutter: 1.5pt, align: center,
      ..range(10).map(r => range(6).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#let made-box = block(
  inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
    #v(3pt)
    #grid(
      columns: (12pt,) * 3,
      gutter: 1.5pt,
      align: center,
      tracking-marker,
      box(stroke: 0.8pt + black, width: 11pt, height: 11pt),
      box(stroke: 0.8pt + black, width: 11pt, height: 11pt),
    )
    #v(3pt)
    #grid(
      columns: (12pt,) * 3, row-gutter: 2.5pt, column-gutter: 1.5pt, align: center,
      ..range(10).map(r => range(3).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#let mcq-row(num) = {
  grid(
    columns: (14pt, 12pt, 12pt, 12pt, 12pt),
    align: center + horizon,
    [*#num*], bubble(""), bubble(""), bubble(""), bubble(""),
  )
}

#let tf-q(num) = {
  grid(
    columns: (12pt, 12pt, 12pt),
    align: center + horizon,
    tracking-marker, align(center)[#text(size: 7pt)[*Câu #num*\nĐ]], align(center)[#text(size: 7pt)[\nS]],
    grid.cell(colspan: 3)[#v(1pt)],
    [a)], bubble(""), bubble(""),
    [b)], bubble(""), bubble(""),
    [c)], bubble(""), bubble(""),
    [d)], bubble(""), bubble(""),
  )
}

#let p1-p2-box = block(
  inset: 0pt,
  [
    #block(inset: 2pt, [ *PHẦN I* ])
    #line(length: 100%, stroke: 0.8pt)
    #grid(
      columns: (1fr, 1fr),
      block(
        stroke: (right: 0.5pt),
        inset: (left: 2pt, right: 2pt, top: 4pt, bottom: 4pt),
        [
          #grid(
            columns: (14pt, 12pt, 12pt, 12pt, 12pt),
            align: center,
            tracking-marker, [*A*], [*B*], [*C*], [*D*],
          )
          #v(3pt)
          #grid(columns: 1, row-gutter: 2.5pt, ..range(1, 7).map(i => mcq-row(i)))
        ]
      ),
      block(
        inset: (left: 2pt, right: 2pt, top: 4pt, bottom: 4pt),
        [
          #grid(
            columns: (14pt, 12pt, 12pt, 12pt, 12pt),
            align: center,
            tracking-marker, [*A*], [*B*], [*C*], [*D*],
          )
          #v(3pt)
          #grid(columns: 1, row-gutter: 2.5pt, ..range(7, 13).map(i => mcq-row(i)))
        ]
      )
    )
    #line(length: 100%, stroke: 0.8pt)
    #block(inset: 2pt, [ *PHẦN II* ])
    #line(length: 100%, stroke: 0.8pt)
    #grid(
      columns: (1fr, 1fr),
      block(
        stroke: (right: 0.5pt),
        inset: (left: 2pt, right: 2pt, top: 4pt, bottom: 4pt),
        grid(columns: 1, row-gutter: 4pt, tf-q(1), tf-q(2))
      ),
      block(
        inset: (left: 2pt, right: 2pt, top: 4pt, bottom: 4pt),
        grid(columns: 1, row-gutter: 4pt, tf-q(3), tf-q(4))
      )
    )
  ]
)

#let tln-col(num) = {
  block(
    stroke: (right: if num < 6 { 0.5pt } else { 0pt }),
    width: 100%,
    [
      #block(
        inset: (top: 2pt, bottom: 2pt, left: 4pt),
        align(left)[#text(size:8pt)[*Câu #num*]]
      )
      #block(
        stroke: (bottom: 0.5pt),
        inset: 2pt,
        grid(
          columns: (10pt, 12pt, 12pt, 12pt, 12pt),
          align: center,
          tracking-marker,
          box(stroke: 0.5pt, width: 11pt, height: 11pt),
          box(stroke: 0.5pt, width: 11pt, height: 11pt),
          box(stroke: 0.5pt, width: 11pt, height: 11pt),
          box(stroke: 0.5pt, width: 11pt, height: 11pt),
        ),
      )
      #block(
        inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
        grid(
          columns: (10pt, 12pt, 12pt, 12pt, 12pt),
          align: center,
          row-gutter: 2.5pt,
          [-], bubble(""), [], [], [],
          [,], [], bubble(""), bubble(""), [],
          ..range(10).map(r => ([*#r*], bubble(""), bubble(""), bubble(""), bubble(""))).flatten(),
        ),
      )
    ],
  )
}

#let p3-box = block(
  inset: 0pt,
  [
    #block(inset: 2pt, [ *PHẦN III* ])
    #line(length: 100%, stroke: 0.8pt)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      ..range(1, 7).map(i => tln-col(i))
    )
  ]
)

#block(
  stroke: 0.8pt + black,
  grid(
    columns: (auto, auto, 1.8fr, 3fr),
    sbd-box,
    block(stroke: (right: 0.8pt), made-box),
    block(stroke: (right: 0.8pt), p1-p2-box),
    p3-box
  ),
)
"""

with open("omr_sheet.typ", "w") as f:
    f.write(typst_code)
