#import "@preview/cades:0.3.1": qr-code

#set page(
  paper: "a4",
  flipped: false,
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

    // ──────────────────────── SBD BOX ────────────────────────
    #let sbd-box = block(
      inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
      [
        #align(center)[#text(weight: "bold", size: 8pt)[SBD]]
        #v(2pt)
        #grid(
          columns: (12pt,) * 6, gutter: 1.5pt, align: center,
          ..range(6).map(i => box(stroke: 0.8pt + black, width: 11pt, height: 11pt))
        )
        #v(2pt)
        #grid(
          columns: (12pt,) * 6, row-gutter: 1.5pt, column-gutter: 1.5pt, align: center,
          ..range(10).map(r => range(6).map(c => bubble(str(r)))).flatten()
        )
      ],
    )

    // ──────────────────────── MÃ ĐỀ BOX ─────────────────────
    #let made-box = block(
      inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
      [
        #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
        #v(2pt)
        #grid(
          columns: (12pt,) * 3,
          gutter: 1.5pt,
          align: center,
          box(stroke: 0.8pt + black, width: 11pt, height: 11pt),
          box(stroke: 0.8pt + black, width: 11pt, height: 11pt),
          box(stroke: 0.8pt + black, width: 11pt, height: 11pt),
        )
        #v(2pt)
        #grid(
          columns: (12pt,) * 3, row-gutter: 1.5pt, column-gutter: 1.5pt, align: center,
          ..range(10).map(r => range(3).map(c => bubble(str(r)))).flatten()
        )
      ],
    )

    // ──────────────────────── INFO BOX ───────────────────────
    #let info-box = block(
      [
        #block(
          inset: (left: 4pt, right: 4pt, top: 2pt, bottom: 2pt),
          [
            #place(top + right, dx: 0pt, dy: -2pt)[#qr-code("TEMPLATE:TLN-10", width: 1cm)]
            #align(left)[#text(size: 10pt, weight: "bold")[PHIẾU TRẢ LỜI TỰ LUẬN NGẮN]]
            #v(2pt)
            Họ và tên: ..............................................................#v(2pt)
            Lớp: .................... Môn: .................... Điểm: .......
          ],
        )
      ]
    )

    // ──────────────────────── HEADER ROW ─────────────────────
    #block(
      width: 100%,
      stroke: 0.8pt + black,
      grid(
        columns: (auto, auto, 1fr),
        sbd-box,
        block(stroke: (left: 0.8pt, right: 0.8pt), made-box),
        info-box,
      )
    )

    #v(5pt)

    // ─────────────────── TLN COLUMN (10 câu) ─────────────────
    #let tln-col(num, last-in-row: false) = {
      block(
        stroke: (right: if last-in-row { 0pt } else { 0.5pt }),
        width: 100%,
        [
          #block(
            inset: (top: 2pt, bottom: 2pt, left: 4pt),
            align(left)[#text(size: 8pt)[*Câu #num*]]
          )
          #block(
            inset: 2pt,
            grid(
              columns: (12pt, 12pt, 12pt, 12pt, 12pt),
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
              columns: (12pt, 12pt, 12pt, 12pt, 12pt),
              align: center,
              row-gutter: 1pt,
              [-], bubble(""), [], [], [],
              [,], [], bubble(""), bubble(""), [],
              [*0*], [], bubble(""), bubble(""), bubble(""),
              ..range(1, 10).map(r => ([*#r*], bubble(""), bubble(""), bubble(""), bubble(""))).flatten(),
            ),
          )
        ],
      )
    }

    // Hàng 1: Câu 1 → 5
    #block(
      stroke: 0.8pt + black,
      width: 100%,
      [
        #block(inset: (left: 2pt, top: 2pt, bottom: 2pt), [*PHẦN I – TỰ LUẬN NGẮN (Câu 1–5)*])
        #line(length: 100%, stroke: 0.8pt)
        #block(
          inset: (left: 10pt, right: 10pt),
          grid(
            columns: (1fr,) * 5,
            ..range(1, 6).map(i => tln-col(i, last-in-row: i == 5))
          )
        )
      ],
    )

    #v(5pt)

    // Hàng 2: Câu 6 → 10
    #block(
      stroke: 0.8pt + black,
      width: 100%,
      [
        #block(inset: (left: 2pt, top: 2pt, bottom: 2pt), [*PHẦN II – TỰ LUẬN NGẮN (Câu 6–10)*])
        #line(length: 100%, stroke: 0.8pt)
        #block(
          inset: (left: 10pt, right: 10pt),
          grid(
            columns: (1fr,) * 5,
            ..range(6, 11).map(i => tln-col(i, last-in-row: i == 10))
          )
        )
      ],
    )

    #v(5pt)

    // ─────────────────── TỰ LUẬN SECTION ─────────────────────
    #block(
      stroke: 0.8pt + black,
      width: 100%,
      height: 150mm,
      [
        #block(inset: 4pt, [*PHẦN TỰ LUẬN*])
        #line(length: 100%, stroke: 0.8pt)
        #block(
          inset: (left: 10pt, right: 10pt, top: 12pt, bottom: 0pt),
          [
            #for i in range(18) {
              line(length: 100%, stroke: (paint: luma(150), dash: "dashed", thickness: 0.5pt))
              v(7.5mm)
            }
          ]
        )
      ]
    )
  ]
]
