import re

typst_code = """#set page(
  paper: "a5",
  flipped: true,
  margin: (top: 6mm, bottom: 6mm, left: 8mm, right: 8mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 16pt, height: 16pt)
#let tracking-marker = box(fill: black, width: 12pt, height: 12pt)

#let bubble(label) = {
  circle(
    radius: 6pt,
    stroke: 0.5pt + rgb("#333333"),
    fill: white,
    align(center + horizon)[#text(size: 7pt, weight: "bold", fill: rgb("#444444"))[#label]],
  )
}

#place(top + left, dx: -4mm, dy: -4mm, marker)
#place(top + right, dx: 4mm, dy: -4mm, marker)
#place(bottom + left, dx: -4mm, dy: 4mm, marker)
#place(bottom + right, dx: 4mm, dy: 4mm, marker)

#v(2pt)

#let sbd-box = block(
  inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
    #v(3pt)
    #grid(
      columns: (13pt,) * 6, gutter: 2pt, align: center,
      ..range(6).map(i => box(stroke: 0.8pt + black, width: 12pt, height: 12pt))
    )
    #v(3pt)
    #grid(
      columns: (13pt,) * 6, row-gutter: 2.5pt, column-gutter: 2pt, align: center,
      ..range(10).map(r => range(6).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#let made-box = block(
  inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
    #v(3pt)
    #grid(
      columns: (13pt,) * 3,
      gutter: 2pt,
      align: center,
      tracking-marker,
      box(stroke: 0.8pt + black, width: 12pt, height: 12pt),
      box(stroke: 0.8pt + black, width: 12pt, height: 12pt),
    )
    #v(3pt)
    #grid(
      columns: (13pt,) * 3, row-gutter: 2.5pt, column-gutter: 2pt, align: center,
      ..range(10).map(r => range(3).map(c => bubble(str(r)))).flatten()
    )
  ],
)

#let mcq-row(num) = {
  grid(
    columns: (14pt, 13pt, 13pt, 13pt, 13pt),
    align: center + horizon,
    [*#num*], bubble(""), bubble(""), bubble(""), bubble(""),
  )
}

#let info-phan1-box = block(
  width: 100%,
  [
    #block(
      inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
      width: 100%,
      [
        #align(center)[#text(size: 11pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]
        #v(4pt)
        Họ và tên: .............................................................. \
        #v(4pt)
        Lớp: .................... Môn: .................... Điểm: .......
      ],
    )
    #line(length: 100%, stroke: 0.8pt)
    #block(
      inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
      [ *PHẦN I* ],
    )
    #line(length: 100%, stroke: 0.8pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      // Col 1
      block(
        stroke: (right: 0.5pt),
        inset: 2pt,
        [
          #grid(
            columns: (14pt, 13pt, 13pt, 13pt, 13pt),
            align: center,
            tracking-marker, [*A*], [*B*], [*C*], [*D*],
          )
          #v(3pt)
          #grid(columns: 1, row-gutter: 2.5pt, ..range(1, 5).map(i => mcq-row(i)))
        ]
      ),
      // Col 2
      block(
        stroke: (right: 0.5pt),
        inset: 2pt,
        [
          #grid(
            columns: (14pt, 13pt, 13pt, 13pt, 13pt),
            align: center,
            tracking-marker, [*A*], [*B*], [*C*], [*D*],
          )
          #v(3pt)
          #grid(columns: 1, row-gutter: 2.5pt, ..range(5, 9).map(i => mcq-row(i)))
        ]
      ),
      // Col 3
      block(
        inset: 2pt,
        [
          #grid(
            columns: (14pt, 13pt, 13pt, 13pt, 13pt),
            align: center,
            tracking-marker, [*A*], [*B*], [*C*], [*D*],
          )
          #v(3pt)
          #grid(columns: 1, row-gutter: 2.5pt, ..range(9, 13).map(i => mcq-row(i)))
        ]
      )
    )
  ]
)

#let tf-q(num) = {
  grid(
    columns: (12pt, 16pt, 16pt),
    align: center + horizon,
    tracking-marker, align(center)[#text(size: 7pt)[*Câu #num*\nĐ]], align(center)[#text(size: 7pt)[\nS]],
    grid.cell(colspan: 3)[#v(1pt)],
    [a)], bubble(""), bubble(""),
    [b)], bubble(""), bubble(""),
    [c)], bubble(""), bubble(""),
    [d)], bubble(""), bubble(""),
  )
}

#let phan2-box = block(
  width: 100%,
  [
    #block(inset: 2pt, [ *PHẦN II* ])
    #line(length: 100%, stroke: 0.8pt)
    #block(
      inset: (top: 2pt, bottom: 2pt, left: 2pt, right: 2pt),
      grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        tf-q(1), tf-q(2),
      ),
    )
    #line(length: 100%, stroke: 0.5pt)
    #block(
      inset: (top: 2pt, bottom: 2pt, left: 2pt, right: 2pt),
      grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        tf-q(3), tf-q(4),
      ),
    )
  ]
)

// TOP BLOCK (SBD, Mã đề, Phần I, Phần II)
#block(
  width: 100%,
  stroke: 0.8pt + black,
  grid(
    columns: (auto, auto, 1fr, auto),
    sbd-box,
    block(stroke: (left: 0.8pt, right: 0.8pt), made-box),
    info-phan1-box,
    block(stroke: (left: 0.8pt), phan2-box)
  )
)

#v(4pt)

// BOTTOM BLOCK (Phần III)
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
          columns: (10pt, 13pt, 13pt, 13pt, 13pt),
          align: center,
          tracking-marker,
          box(stroke: 0.5pt, width: 12pt, height: 12pt),
          box(stroke: 0.5pt, width: 12pt, height: 12pt),
          box(stroke: 0.5pt, width: 12pt, height: 12pt),
          box(stroke: 0.5pt, width: 12pt, height: 12pt),
        ),
      )
      #block(
        inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
        grid(
          columns: (10pt, 13pt, 13pt, 13pt, 13pt),
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

#block(
  stroke: 0.8pt + black,
  width: 100%,
  [
    #block(inset: 2pt, [*PHẦN III*])
    #line(length: 100%, stroke: 0.8pt)
    #grid(
      columns: (1fr,) * 6,
      ..range(1, 7).map(i => tln-col(i))
    )
  ],
)
"""

with open("omr_sheet.typ", "w") as f:
    f.write(typst_code)
