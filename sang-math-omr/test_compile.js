import fs from 'fs';

const isA5 = false;
const mcq = 12;
const tf = 4;
const tln = 6;
const paper = 'a4';
const school = 'TEST';
const subtitle = 'TEST';
const hasEssay = true;

const cols = mcq <= 20 ? 2 : mcq <= 40 ? 3 : 4;
const perCol = mcq > 0 ? Math.ceil(mcq / cols) : 0;

let mcqSection = '';
if (mcq > 0) {
    let colBlocks = [];
    for (let c = 0; c < cols; c++) {
        const start = c * perCol + 1;
        const end = Math.min((c + 1) * perCol, mcq);
        if (start > end) continue;
        colBlocks.push(`
block(
stroke: (right: 0.5pt),
inset: 2pt,
[
  #grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
  )
  #v(2pt)
  #grid(columns: 1, row-gutter: 1.5pt, ..range(${start}, ${end + 1}).map(i => grid(
    columns: (16pt, 12pt, 12pt, 12pt, 12pt),
    align(center + horizon)[*#i*],
    bubble(""), bubble(""), bubble(""), bubble(""),
  )))
]
)`);
    }
    mcqSection = `
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN I – TRẮC NGHIỆM (${mcq} câu, chọn 1 đáp án)]]])
#grid(columns: (1fr,) * ${colBlocks.length}, stroke: (x,y) => if x==0 { none } else { 0.5pt }, ${colBlocks.join(',\n')} )
])`;
}

let tfSection = '';
if (tf > 0) {
    let tfQs = [];
    for (let i = 1; i <= tf; i++) {
        tfQs.push(`grid(
columns: (12pt, 14pt, 14pt),
row-gutter: 1.5pt,
grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu ${i}]],
align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
align(center + horizon)[a)], bubble(""), bubble(""),
align(center + horizon)[b)], bubble(""), bubble(""),
align(center + horizon)[c)], bubble(""), bubble(""),
align(center + horizon)[d)], bubble(""), bubble(""),
)`);
    }
    tfSection = `
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN II – ĐÚNG / SAI (${tf} câu, 4 ý a/b/c/d)]]])
#block(
inset: (top: 4pt, bottom: 4pt, left: 2pt, right: 2pt),
grid(columns: (1fr, 1fr), gutter: 4pt, ${tfQs.join(', ')})
)
])`;
}

let tlnSection = '';
if (tln > 0) {
    const tlnCols = Math.min(tln, tln <= 6 ? tln : Math.ceil(tln / 2));
    const rows = Math.ceil(tln / tlnCols);
    let parts = [];
    for (let r = 0; r < rows; r++) {
        const start = r * tlnCols + 1;
        const end = Math.min(start + tlnCols - 1, tln);
        const cnt = end - start + 1;
        let tlnQs = [];
        for(let num = start; num <= end; num++) {
            tlnQs.push(`block(
stroke: (right: 0.5pt),
width: 100%,
[
#block(
inset: (top: 2pt, bottom: 2pt, left: 4pt),
align(left)[#text(size:8pt)[*Câu ${num}*]]
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
)`);
        }
        parts.push(`
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, [
#rect(fill:luma(240), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, weight:"bold")[PHẦN ${r === 0 ? 'III' : 'IV'} – TỰ LUẬN NGẮN (Câu ${start}-${end})]]])
#block(
inset: (left: 10pt, right: 10pt),
grid(
  columns: (1fr,) * ${cnt},
  ${tlnQs.join(', ')}
)
)
])`);
    }
    tlnSection = parts.join('\n');
}

const typstCode = `// Preview-safe Typst – no external packages
#set page(
paper: "${isA5 ? 'a5' : 'a4'}",
flipped: ${isA5},
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

#align(if ${isA5} { center + horizon } else { top + center })[
#scale(x: 95%, y: 95%, origin: if ${isA5} { center } else { top })[

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
    #text(7pt)[${school}]\\
    #text(7pt)[Họ và tên: \\.....................................................] \\
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

${mcqSection}
${tfSection}
${tlnSection}

// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────
${hasEssay ? `
#v(4pt)
#block(width:100%, stroke:0.8pt, radius:4pt, clip:true, fill:luma(252), [
#rect(fill:luma(238), width:100%, height:16pt, [#align(center+horizon)[#text(8pt, fill:gray)[✍ PHẦN TỰ LUẬN – Viết bên dưới]]])
#v(4pt)
#set par(leading: 14pt)
#for _ in range(${Math.floor(isA5 ? 4 : 8)}) [
#line(length:100%, stroke:(thickness:.3pt, dash:"dashed", paint:luma(200))) \\\\
]
#v(4pt)
])` : ''}

]
]
`;

fs.writeFileSync('test.typ', typstCode);
