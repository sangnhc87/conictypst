import os

typst_code = """
#set page(
  paper: "a3",
  flipped: true,
  margin: (x: 10mm, y: 15mm)
)
#show: columns.with(2, gutter: 20mm)

#set text(font: "Times New Roman", size: 11pt)

#let lined-paper() = {
  for i in range(45) {
    v(24pt, weak: true)
    line(length: 100%, stroke: (paint: gray, thickness: 0.5pt, dash: "dotted"))
  }
}

// ==========================================
// MẶT 4 (BÌA SAU) - DÀNH CHO LÀM TỰ LUẬN
// ==========================================
#align(center)[*PHẦN BÀI LÀM TỰ LUẬN*]
#v(10pt)
#lined-paper()

#colbreak()

// ==========================================
// MẶT 1 (BÌA TRƯỚC) - PHÁCH & TRẮC NGHIỆM
// ==========================================

#let phach-header = [
  #grid(
    columns: (1fr, 1.2fr, 1fr),
    align: center,
    [
      *SỞ GIÁO DỤC VÀ ĐÀO TẠO* \
      *TRƯỜNG ...............................* \
      #v(2pt)
      (Đề thi có ...... trang)
    ],
    [
      *KỲ THI KIỂM TRA ĐÁNH GIÁ* \
      *Môn: TOÁN* \
      #text(size: 10pt)[Thời gian làm bài: 90 phút]
    ],
    [
      *SỐ PHÁCH* \
      #box(width: 70%, height: 20pt, stroke: 1pt) \
      #text(size: 8pt)[(Do HĐ chấm thi ghi)]
    ]
  )
  #v(10pt)
  #grid(
    columns: (2.5fr, 1fr),
    [
      *Họ và tên thí sinh:* ................................................................ \
      #v(5pt)
      *Lớp:* .......................... *Số báo danh:* ...................................... \
      #v(5pt)
      *Phòng thi:* ............................................................................
    ],
    [
      #align(left)[
        *Chữ ký giám thị 1:* \
        #v(10pt)
        *Chữ ký giám thị 2:*
      ]
    ]
  )
  #v(10pt)
  #grid(
    columns: (1fr, 1fr, 1fr),
    align(center)[
      *Điểm bài thi* \
      #box(width: 80%, height: 35pt, stroke: 1pt)
    ],
    align(center)[
      *Chữ ký giám khảo 1* \
      #v(30pt)
    ],
    align(center)[
      *Chữ ký giám khảo 2* \
      #v(30pt)
    ]
  )
]

#let cut-line = [
  #v(20pt)
  #align(center)[
    #line(length: 100%, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
    #place(center, dy: -5pt)[#box(fill: white, inset: 2pt)[#text(size: 10pt)[✂ KẾT THÚC PHẦN PHÁCH ✂]]]
  ]
  #v(10pt)
]

#phach-header
#cut-line

// ==========================================
// KHỐI OMR (TRẮC NGHIỆM)
// ==========================================
#let marker = box(fill: black, width: 12pt, height: 12pt)
#let tracking-marker = box(fill: black, width: 10pt, height: 10pt)

#let bubble(label) = {
  circle(
    radius: 4.3pt,
    stroke: 0.5pt + rgb("#333333"),
    fill: white,
    align(center + horizon)[#text(size: 7pt, weight: "regular", fill: rgb("#888888"))[#label]],
  )
}

#let sbd-box = block(
  inset: (left: 6pt, right: 3pt, top: 1pt, bottom: 1pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[Số báo danh]]
    #v(1pt)
    #grid(
      columns: (12pt,) * 6, gutter: 1.2pt,
      ..range(6).map(i => align(center, box(stroke: 0.8pt + black, width: 10pt, height: 10pt)))
    )
    #v(1pt)
    #grid(
      columns: (12pt,) * 6, row-gutter: 0.8pt, column-gutter: 1.5pt,
      ..range(10).map(r => range(6).map(c => align(center, bubble(str(r))))).flatten()
    )
  ],
)

#let made-box = block(
  inset: (left: 3pt, right: 3pt, top: 1pt, bottom: 1pt),
  [
    #align(center)[#text(weight: "bold", size: 8pt)[Mã đề]]
    #v(1pt)
    #grid(
      columns: (12pt,) * 4,
      gutter: 1.2pt,
      align(center, box(stroke: 0.8pt + black, width: 10pt, height: 10pt)),
      align(center, box(stroke: 0.8pt + black, width: 10pt, height: 10pt)),
      align(center, box(stroke: 0.8pt + black, width: 10pt, height: 10pt)),
      align(center, box(stroke: 0.8pt + black, width: 10pt, height: 10pt)),
    )
    #v(1pt)
    #grid(
      columns: (12pt,) * 4, row-gutter: 0.8pt, column-gutter: 1.5pt,
      ..range(10).map(r => range(4).map(c => align(center, bubble(str(r))))).flatten()
    )
  ],
)

#let mcq-row(num) = {
  grid(
    columns: (13pt, 12pt, 12pt, 12pt, 12pt),
    align(center + horizon)[*#num*],
    align(center + horizon, bubble("A")),
    align(center + horizon, bubble("B")),
    align(center + horizon, bubble("C")),
    align(center + horizon, bubble("D")),
  )
}

#let tf-q(num) = {
  grid(
    columns: (12pt, 14pt, 14pt),
    row-gutter: 0.8pt,
    grid.cell(rowspan: 2, align: center + horizon)[#tracking-marker],
    grid.cell(colspan: 2, align: center + bottom)[#text(size: 7pt, weight: "bold")[Câu #num]],
    align(center)[#text(size: 7pt, weight: "bold")[Đ]], align(center)[#text(size: 7pt, weight: "bold")[S]],
    [a)], bubble("Đ"), bubble("S"),
    [b)], bubble("Đ"), bubble("S"),
    [c)], bubble("Đ"), bubble("S"),
    [d)], bubble("Đ"), bubble("S"),
  )
}

#let tln-col(num) = {
  block(
    width: 100%,
    inset: (bottom: 2pt),
    [
      #align(left)[#text(size:8pt)[*Câu #num*]]
      #v(1pt)
      #grid(
        columns: (12pt, 12pt, 12pt, 12pt, 12pt),
        align: center + horizon,
        tracking-marker,
        box(stroke: 0.5pt, width: 11pt, height: 11pt),
        box(stroke: 0.5pt, width: 11pt, height: 11pt),
        box(stroke: 0.5pt, width: 11pt, height: 11pt),
        box(stroke: 0.5pt, width: 11pt, height: 11pt),
      )
      #v(1pt)
      #grid(
        columns: (12pt, 12pt, 12pt, 12pt, 12pt),
        rows: (9.8pt,) * 13,
        align: center + horizon,
        [#text(size: 6.5pt, fill: rgb("#666666"))[-]], bubble("-"), [], [], [],
        [#text(size: 6.5pt, fill: rgb("#666666"))[,]], [], bubble(","), bubble(","), [],
        [#text(size: 6.5pt, fill: rgb("#666666"))[0]], bubble("0"), bubble("0"), bubble("0"), bubble("0"),
        ..range(1, 10).map(r => (
          [#text(size: 6.5pt, fill: rgb("#666666"))[#r]],
          bubble(str(r)),
          bubble(str(r)),
          bubble(str(r)),
          bubble(str(r))
        )).flatten(),
      )
    ],
  )
}

#let the-omr = block(height: 140mm, width: 100%, [
  #set text(size: 8pt, font: "Times New Roman")
  
  #align(center + horizon)[
    #scale(x: 95%, y: 95%, origin: center)[
      #place(top + left, dx: -5mm, dy: -5mm, marker)
      #place(top + right, dx: 5mm, dy: -5mm, marker)
      #place(bottom + left, dx: -5mm, dy: 5mm, marker)
      #place(bottom + right, dx: 5mm, dy: 5mm, marker)
      
      #v(2pt)
      
      // TOP BLOCK
      #block(
        width: 100%,
        stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"),
        radius: 4pt,
        clip: true,
        grid(
          columns: (auto, auto, 1fr),
          sbd-box,
          block(stroke: (left: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"), right: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed")), made-box),
          block(
            inset: 8pt,
            [
              #align(center)[#text(size: 10pt, weight: "bold")[PHIẾU TRẢ LỜI TRẮC NGHIỆM]]
              #v(6pt)
              #text(size: 9pt)[
                - Tô kín bong bóng đáp án.\n
                - Phần tự luận ngắn, tô dấu trừ $(-)$ nếu số âm.\n
                - Tô dấu phẩy $(,)$ nếu có phần thập phân.\n
                - Bắt buộc ghi số vào ô vuông trên cùng.
              ]
            ]
          )
        )
      )
      #v(2pt)
      // BOTTOM BLOCK (Body)
      #block(
        stroke: (paint: rgb("#666666"), thickness: 0.8pt, dash: "dashed"),
        radius: 4pt,
        clip: true,
        width: 100%,
        [
          #grid(
            columns: (1fr, 1fr, 1.2fr, 1.2fr),
            
            // Column 1: TN (12)
            block(
              stroke: (right: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed")),
              inset: 4pt,
              [
                #align(center)[*PHẦN I* (TN nhiều lựa chọn)]
                #v(4pt)
                #grid(
                  columns: (13pt, 12pt, 12pt, 12pt, 12pt),
                  align(center)[#tracking-marker], align(center)[*A*], align(center)[*B*], align(center)[*C*], align(center)[*D*],
                )
                #v(2pt)
                #grid(columns: 1, row-gutter: 1.5pt, ..range(1, 13).map(i => mcq-row(i)))
              ]
            ),
            
            // Column 2: ĐS (2)
            block(
              stroke: (right: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed")),
              inset: 4pt,
              [
                #align(center)[*PHẦN II* (TN Đúng/Sai)]
                #v(4pt)
                #grid(
                  columns: 1,
                  row-gutter: 8pt,
                  tf-q(1), tf-q(2)
                )
              ]
            ),
            
            // Column 3: TLN 1-2
            block(
              stroke: (right: (paint: rgb("#666666"), thickness: 0.5pt, dash: "dashed")),
              inset: 4pt,
              [
                #align(center)[*PHẦN III* (Tự luận ngắn)]
                #v(4pt)
                #tln-col(1)
                #tln-col(2)
              ]
            ),
            
            // Column 4: TLN 3-4
            block(
              inset: 4pt,
              [
                #v(17pt)
                #tln-col(3)
                #tln-col(4)
              ]
            )
          )
        ]
      )
    ]
  ]
])

#the-omr
#v(10pt)
#align(center)[*PHẦN LÀM BÀI (Tiếp theo)*]
#v(10pt)
#lined-paper()

// ==========================================
// MẶT 2 VÀ MẶT 3 (BÊN TRONG) - HOÀN TOÀN TỰ LUẬN
// ==========================================
#pagebreak()

#align(center)[*PHẦN LÀM BÀI (Tiếp theo)*]
#v(10pt)
#lined-paper()

#colbreak()

#align(center)[*PHẦN LÀM BÀI (Tiếp theo)*]
#v(10pt)
#lined-paper()
"""

with open("sang-math-omr/templates/a3-cat-phach-full.typ", "w") as f:
    f.write(typst_code)

print("Generated A3 typst file.")
