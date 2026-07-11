// Preview-safe Typst – no external packages
#set page(
paper: "a4",
flipped: false,
margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
)
#set text(size: 8pt, font: "Times New Roman")

#let marker = box(fill: black, width: 12pt, height: 12pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
align(center + horizon)[
#circle(
  radius: 4.5pt,
  stroke: 0.5pt + rgb("#333333"),
  fill: white,
  align(center + horizon)[#text(size: 6.5pt, weight: "bold", fill: rgb("#444444"))[#label]],
)
]
}
#let empty-box = box(stroke: 0.8pt + black, width: 10pt, height: 10pt)

// Corner markers
#place(top+left,   dx:-1mm, dy:-1mm, square(size:10pt, fill:black))
#place(top+right,  dx:1mm,  dy:-1mm, square(size:10pt, fill:black))
#place(bottom+left,  dx:-1mm, dy:1mm, square(size:10pt, fill:black))
#place(bottom+right, dx:1mm,  dy:1mm, square(size:10pt, fill:black))

#align(if false { center + horizon } else { top + center })[
#scale(x: 95%, y: 95%, origin: if false { center } else { top })[

// ── HEADER ──────────────────────────────────────────────────
#let sbd-box = block(
inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
[
#align(center)[#text(weight: "bold", size: 8pt)[SỐ BÁO DANH]]
#v(2pt)
#grid(
  columns: (12pt,) * 6, gutter: 1.5pt,
  ..range(6).map(i => align(center, empty-box))
)
#v(2pt)
#grid(
  columns: (12pt,) * 6, row-gutter: 1.5pt, column-gutter: 1.5pt,
  ..range(10).map(r => range(6).map(c => bubble(str(r)))).flatten()
)
],
)

#let made-box = block(
inset: (left: 2pt, right: 2pt, top: 2pt, bottom: 2pt),
[
#align(center)[#text(weight: "bold", size: 8pt)[MÃ ĐỀ THI]]
#v(2pt)
#grid(
  columns: (12pt,) * 3,
  gutter: 1.5pt,
  align(center, empty-box), align(center, empty-box), align(center, empty-box),
)
#v(2pt)
#grid(
  columns: (12pt,) * 3, row-gutter: 1.5pt, column-gutter: 1.5pt,
  ..range(10).map(r => range(3).map(c => bubble(str(r)))).flatten()
)
],
)

#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#grid(columns:(82pt, 48pt, 1fr, 28pt), gutter:0pt, stroke:0.5pt,
grid.cell(stroke:0.5pt, sbd-box),
grid.cell(stroke:0.5pt, made-box),
grid.cell(stroke:0.5pt, [
  #pad(x:4pt)[
    #text(10pt, weight:"bold", fill:rgb("#c0392b"))[PHIẾU TRẢ LỜI TRẮC NGHIỆM]
    #v(2pt)
    #text(7pt)[TEST]\
    #text(7pt)[Họ và tên: \.....................................................] \
    #text(7pt)[Lớp: ............ Môn: ............... Điểm: ...............]
  ]
]),
grid.cell(stroke:0.5pt, [
  #align(center+horizon)[
    #rect(width:24pt, height:24pt, stroke:.5pt, fill:luma(230))[
      #align(center+horizon)[#text(6pt, fill:gray)[QR]]
    ]
  ]
]),
)
])


#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN I – TRẮC NGHIỆM (12 câu, chọn 1 đáp án)]]])
#grid(columns: (1fr,) * 2, stroke: (x,y) => if x==0 { none } else { 0.5pt }, 
block(
stroke: (right: 0.5pt),
inset: 2pt,
[
  #grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
  )
  #v(2pt)
  #grid(columns: 1, row-gutter: 1.5pt, ..range(1, 7).map(i => grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center + horizon)[*#i*],
    bubble(""), bubble(""), bubble(""), bubble(""),
  )))
]
),

block(
stroke: (right: 0.5pt),
inset: 2pt,
[
  #grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
  )
  #v(2pt)
  #grid(columns: 1, row-gutter: 1.5pt, ..range(7, 13).map(i => grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center + horizon)[*#i*],
    bubble(""), bubble(""), bubble(""), bubble(""),
  )))
]
) )
])

#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (4 câu, 4 ý a/b/c/d)]]])
#block(
inset: (top: 4pt, bottom: 4pt, left: 2pt, right: 2pt),
grid(columns: (1fr, 1fr), gutter: 4pt, grid(
columns: (12pt, 14pt, 14pt),
row-gutter: 1.5pt,
grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu 1]],
align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
align(center + horizon)[a)], bubble(""), bubble(""),
align(center + horizon)[b)], bubble(""), bubble(""),
align(center + horizon)[c)], bubble(""), bubble(""),
align(center + horizon)[d)], bubble(""), bubble(""),
), grid(
columns: (12pt, 14pt, 14pt),
row-gutter: 1.5pt,
grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu 2]],
align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
align(center + horizon)[a)], bubble(""), bubble(""),
align(center + horizon)[b)], bubble(""), bubble(""),
align(center + horizon)[c)], bubble(""), bubble(""),
align(center + horizon)[d)], bubble(""), bubble(""),
), grid(
columns: (12pt, 14pt, 14pt),
row-gutter: 1.5pt,
grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu 3]],
align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
align(center + horizon)[a)], bubble(""), bubble(""),
align(center + horizon)[b)], bubble(""), bubble(""),
align(center + horizon)[c)], bubble(""), bubble(""),
align(center + horizon)[d)], bubble(""), bubble(""),
), grid(
columns: (12pt, 14pt, 14pt),
row-gutter: 1.5pt,
grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu 4]],
align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
align(center + horizon)[a)], bubble(""), bubble(""),
align(center + horizon)[b)], bubble(""), bubble(""),
align(center + horizon)[c)], bubble(""), bubble(""),
align(center + horizon)[d)], bubble(""), bubble(""),
))
)
])

#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN III – TỰ LUẬN NGẮN (Câu 1-6)]]])
#block(
inset: (left: 10pt, right: 10pt),
grid(
  columns: (1fr,) * 6,
  block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 1*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
), block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 2*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
), block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 3*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
), block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 4*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
), block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 5*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
), block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu 6*]]
)
#block(
inset: 2pt,
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  align(center, tracking-marker),
  align(center, empty-box), align(center, empty-box), align(center, empty-box), align(center, empty-box),
),
)
#block(
inset: (top: 2pt, bottom: 2pt, left: 1pt, right: 1pt),
grid(
  columns: (12pt, 12pt, 12pt, 12pt, 12pt),
  row-gutter: 1pt,
  align(center)[-], bubble(""), [], [], [],
  align(center)[,], [], bubble(""), bubble(""), [],
  align(center)[*0*], [], bubble(""), bubble(""), bubble(""),
  ..range(1, 10).map(r => (
    align(center)[*#r*], bubble(""), bubble(""), bubble(""), bubble("")
  )).flatten(),
),
)
]
)
)
)
])

// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────

#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, fill:luma(252), [
#rect(fill:luma(238), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, fill:gray)[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
#v(4pt)
#set par(leading: 14pt)
#for _ in range(8) [
#line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200))) \\
]
#v(4pt)
])

]
]
