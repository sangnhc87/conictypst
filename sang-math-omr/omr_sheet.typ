// QR code placeholder (cades not compatible with typst 0.10)

#set page(
  paper: "a5",
  flipped: true,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 12pt, height: 12pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
  circle(
    radius: 5pt,
    stroke: 0.5pt + rgb("#333333"),
    fill: white,
    align(center + horizon)[#text(size: 7pt, weight: "bold", fill: rgb("#444444"))[#label]],
  )
}

#align(center + horizon)[
  #scale(x: 95%, y: 95%, origin: center)[
    #place(top + left, dx: -5mm, dy: -5mm, marker)
    #place(top + right, dx: 5mm, dy: -5mm, marker)
    #place(bottom + left, dx: -5mm, dy: 5mm, marker)
    #place(bottom + right, dx: 5mm, dy: 5mm, marker)
    
    #v(2pt)
    
    #let sbd-box = block(
      inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
      [
        #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
        #v(2pt)
        #grid(
          columns: (12pt,) * 6, gutter: 1.5pt,
          ..range(6).map(i => align(center, box(stroke: 0.8pt + black, width: 11pt, height: 11pt)))
        )
        #v(2pt)
        #grid(
          columns: (12pt,) * 6, row-gutter: 1.5pt, column-gutter: 1.5pt,
          ..range(10).map(r => range(6).map(c => align(center, bubble(str(r))))).flatten()
        )
      ],
    )
    
    #let made-box = block(
      inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
      [
        #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
        #v(2pt)
        #grid(
          columns: (12pt,) * 3,
          gutter: 1.5pt,
          align(center, box(stroke: 0.8pt + black, width: 11pt, height: 11pt)),
          align(center, box(stroke: 0.8pt + black, width: 11pt, height: 11pt)),
          align(center, box(stroke: 0.8pt + black, width: 11pt, height: 11pt)),
        )
        #v(2pt)
        #grid(
          columns: (12pt,) * 3, row-gutter: 1.5pt, column-gutter: 1.5pt,
          ..range(10).map(r => range(3).map(c => align(center, bubble(str(r))))).flatten()
        )
      ],
    )
    
    #let mcq-row(num) = {
      grid(
        columns: (13pt, 12pt, 12pt, 12pt, 12pt),
        align(center + horizon)[*#num*],
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
        align(center + horizon, bubble("")),
      )
    }
    
    #let info-phan1-box = block(
      [
        #block(
          inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
          [
            #place(top + right, dx: 0pt, dy: -2pt)[#box(width: 1cm, height: 1cm, stroke: 0.5pt, fill: white)]
            #align(left)[#text(size: 10pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]
            #v(2pt)
            Họ và tên: ..............................................................         #v(2pt)
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
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: 1.5pt, ..range(1, 5).map(i => mcq-row(i)))
            ]
          ),
          // Col 2
          block(
            stroke: (right: 0.5pt),
            inset: 2pt,
            [
              #grid(
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: 1.5pt, ..range(5, 9).map(i => mcq-row(i)))
            ]
          ),
          // Col 3
          block(
            inset: 2pt,
            [
              #grid(
                columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
              )
              #v(2pt)
              #grid(columns: 1, row-gutter: 1.5pt, ..range(9, 13).map(i => mcq-row(i)))
            ]
          )
        )
      ]
    )
    
    #let tf-q(num) = {
      grid(
        columns: (12pt, 14pt, 14pt),
        row-gutter: 1.5pt,
        grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
        grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu #num]],
        align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
        [a)], bubble(""), bubble(""),
        [b)], bubble(""), bubble(""),
        [c)], bubble(""), bubble(""),
        [d)], bubble(""), bubble(""),
      )
    }
    
    #let phan2-box = block(
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
        columns: (auto, auto, 2.2fr, 1.2fr),
        sbd-box,
        block(stroke: (left: 0.8pt, right: 0.8pt), made-box),
        info-phan1-box,
        block(stroke: (left: 0.8pt), phan2-box)
      )
    )
    
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
            inset: 2pt,
            grid(
              columns: (12pt, 12pt, 12pt, 12pt, 12pt),
              align(center, tracking-marker),
              align(center, box(stroke: 0.5pt, width: 11pt, height: 11pt)),
              align(center, box(stroke: 0.5pt, width: 11pt, height: 11pt)),
              align(center, box(stroke: 0.5pt, width: 11pt, height: 11pt)),
              align(center, box(stroke: 0.5pt, width: 11pt, height: 11pt)),
            ),
          )
          #block(
            inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
            grid(
              columns: (12pt, 12pt, 12pt, 12pt, 12pt),
              row-gutter: 1pt,
              align(center)[-], align(center, bubble("")), [], [], [],
              align(center)[,], [], align(center, bubble("")), align(center, bubble("")), [],
              align(center)[*0*], [], align(center, bubble("")), align(center, bubble("")), align(center, bubble("")),
              ..range(1, 10).map(r => (
                align(center)[*#r*],
                align(center, bubble("")),
                align(center, bubble("")),
                align(center, bubble("")),
                align(center, bubble(""))
              )).flatten(),
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
        #block(
          inset: (left: 10pt, right: 10pt),
          grid(
            columns: (1fr,) * 6,
            ..range(1, 7).map(i => tln-col(i))
          )
        )
      ],
    )
  ]
]
