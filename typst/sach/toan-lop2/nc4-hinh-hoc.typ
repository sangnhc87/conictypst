// ══════════════════════════════════════════════════════════════════════════
// nc4-hinh-hoc.typ — Chương 4: Hình Học Nâng Cao / Advanced Geometry
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme-nc.typ": *

#chuong-header-nc(
  so: 4,
  ten-vi: "Hình Học Nâng Cao",
  ten-en: "Advanced Geometry",
  icon: "📐",
  so-bai: "4",
  so-trang: "16",
)

#muc-tieu((
  [Đếm hình tam giác và hình vuông ẩn trong hình phức hợp — Count hidden shapes in figures],
  [Vẽ và xác định trục đối xứng — Draw and identify lines of symmetry],
  [Tính diện tích bằng cách đếm ô vuông — Calculate area by counting unit squares],
  [Cắt và ghép hình để tạo hình mới — Dissect and rearrange shapes to form new ones],
))

// ══════════════════════════════════════════════════════════════════════════
// BÀI 16: ĐẾM HÌNH PHỨC HỢP / COUNTING SHAPES IN FIGURES
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "16",
  ten-vi: "Đếm Hình Phức Hợp",
  ten-en: "Counting Shapes in Figures",
  icon: "🔢",
  kho: 3,
  c: C-CH-NC.at(3),
)

#ly-thuyet(title: "CÁCH ĐẾM HÌNH — HOW TO COUNT SHAPES")[
  Khi hình lớn có chứa nhiều hình nhỏ hơn, hãy đếm *có hệ thống*: \
  _When a large figure contains smaller shapes, count systematically:_
  #v(0.3em)
  ① Đếm hình *đơn lẻ* (gồm 1 đơn vị) \
  ② Đếm hình *ghép 2* đơn vị liên tiếp \
  ③ Đếm hình *ghép 3, 4,…* đơn vị \
  ④ Cộng tất cả lại
]

#bt-label(so: "29", title: "⭐⭐ Đếm tam giác — Count triangles")

#grid(
  columns: (auto, 1fr),
  gutter: 20pt,
  canvas(length: 1cm, {
    import draw: *
    // Big triangle divided into 4 smaller ones
    let A = (0, 0)
    let B = (6, 0)
    let C = (3, 5.2)
    let M = (1.5, 2.6) // midpoint AC
    let N = (4.5, 2.6) // midpoint BC
    let P = (3, 0) // midpoint AB
    // Fill colors
    line(A, B, C, close: true, stroke: 2pt + C-CH-NC.at(3))
    line(M, N, P, close: true, stroke: 2pt + C-CH-NC.at(3))
    line(M, N, stroke: 2pt + C-CH-NC.at(3))
    line(M, P, stroke: 2pt + C-CH-NC.at(3))
    line(N, P, stroke: 2pt + C-CH-NC.at(3))
    // Labels
    content((3, -0.4), text(size: 9pt, fill: C-MID)[Hình có bao nhiêu tam giác?])
  }),
  block[
    #set text(size: 10pt)
    Đếm *có hệ thống*:
    #v(0.4em)
    • Tam giác *nhỏ* (đơn lẻ): \_\_\_\_ hình \
    • Tam giác *ghép 2* nhỏ: \_\_\_\_ hình \
    • Tam giác *lớn nhất*: \_\_\_\_ hình \
    #v(0.4em)
    *Tổng cộng:* \_\_\_\_ tam giác
  ],
)

#bt-label(so: "30", title: "⭐⭐⭐ Đếm hình chữ nhật — Count rectangles")

#grid(
  columns: (auto, 1fr),
  gutter: 20pt,
  canvas(length: 1cm, {
    import draw: *
    // 3x2 grid of rectangles
    for r in range(2) {
      for c in range(3) {
        rect(
          (c * 2.0, r * 1.5),
          ((c + 1) * 2.0, (r + 1) * 1.5),
          stroke: 2pt + C-CH-NC.at(3),
          fill: C-CH-NC.at(3).lighten(92%),
        )
      }
    }
  }),
  block[
    #set text(size: 10pt)
    Lưới 3×2 này có bao nhiêu hình chữ nhật (kể cả hình vuông)?
    #v(0.4em)
    Gợi ý: Đếm *theo kích thước*: \
    • 1×1: \_\_\_\_ hình \
    • 2×1: \_\_\_\_ hình \
    • 3×1: \_\_\_\_ hình \
    • 1×2: \_\_\_\_ hình \
    • 2×2: \_\_\_\_ hình \
    • 3×2: \_\_\_\_ hình \
    *Tổng:* \_\_\_\_ hình chữ nhật
  ],
)

#nang-cao[
  *Thách thức:* Trong lưới 4×3, có bao nhiêu hình chữ nhật? Hãy lập bảng và tìm quy luật! \
  _In a 4×3 grid, how many rectangles? Build a table and find the pattern!_
  #dong-viet(n: 3)
]

#phong-thi-nghiem[
  *Thí nghiệm đếm hình có hệ thống:* Em hãy tự lập bảng cho các lưới sau:
  - lưới 1 × 1
  - lưới 2 × 1
  - lưới 2 × 2
  - lưới 3 × 2

  Từ bảng đó, em thử đoán lưới 4 × 3 có bao nhiêu hình chữ nhật trước khi đếm thật kỹ.
  #o-tra-loi(h: 2.8cm, label: "Bảng và dự đoán:")
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 17: ĐỐI XỨNG / LINES OF SYMMETRY
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "17",
  ten-vi: "Trục Đối Xứng",
  ten-en: "Lines of Symmetry",
  icon: "🪞",
  kho: 2,
  c: C-CH-NC.at(3),
)

#ly-thuyet(title: "TRỤC ĐỐI XỨNG — LINE OF SYMMETRY")[
  Một hình có *trục đối xứng* nếu khi gấp hình lại theo đường đó, hai nửa *khớp hoàn toàn* với nhau. \
  _A shape has a line of symmetry if folding along that line makes both halves match perfectly._

  #v(0.5em)
  #grid(
    columns: (4 * (1fr,)),
    gutter: 10pt,
    canvas(length: 1cm, {
      import draw: *
      rect((0, 0), (3, 3), fill: C-TEAL.lighten(85%), stroke: 2pt + C-TEAL)
      line((1.5, 0), (1.5, 3), stroke: (paint: C-RED, dash: "dashed", thickness: 1.5pt))
      content((1.5, -0.4), text(size: 9pt)[vuông: 4 trục])
    }),
    canvas(length: 1cm, {
      import draw: *
      circle((1.5, 1.5), radius: 1.5, fill: C-BLUE.lighten(85%), stroke: 2pt + C-BLUE)
      line((1.5, 0), (1.5, 3), stroke: (paint: C-RED, dash: "dashed", thickness: 1.5pt))
      content((1.5, -0.4), text(size: 9pt)[tròn: vô số])
    }),
    canvas(length: 1cm, {
      import draw: *
      line((1.5, 3), (0, 0), (3, 0), close: true, fill: C-GREEN.lighten(85%), stroke: 2pt + C-GREEN)
      line((1.5, 0), (1.5, 3), stroke: (paint: C-RED, dash: "dashed", thickness: 1.5pt))
      content((1.5, -0.4), text(size: 9pt)[tam giác đều: 3])
    }),
    canvas(length: 1cm, {
      import draw: *
      line((0.5, 3), (2.5, 3), (3, 0), (0, 0), close: true, fill: C-PURPLE.lighten(85%), stroke: 2pt + C-PURPLE)
      content((1.5, -0.4), text(size: 9pt)[thang: 1 trục])
    }),
  )
]

#bt-label(so: "31", title: "⭐ Vẽ trục đối xứng — Draw the line of symmetry")

Vẽ *tất cả* trục đối xứng của mỗi hình:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 16pt,
  block[
    *a) Chữ T*
    #canvas(length: 1cm, {
      import draw: *
      // Letter T shape
      rect((0.5, 0), (2.5, 1.5), fill: C-CH-NC.at(3).lighten(85%), stroke: 2pt + C-CH-NC.at(3))
      rect((0, 1.5), (3, 3), fill: C-CH-NC.at(3).lighten(85%), stroke: 2pt + C-CH-NC.at(3))
    })
    Số trục: \_\_\_\_
  ],
  block[
    *b) Chữ nhật đứng*
    #canvas(length: 1cm, {
      import draw: *
      rect((0.5, 0), (2.5, 4), fill: C-CH-NC.at(3).lighten(85%), stroke: 2pt + C-CH-NC.at(3))
    })
    Số trục: \_\_\_\_
  ],
  block[
    *c) Ngôi sao 5 cánh*
    #canvas(length: 1cm, {
      import draw: *
      // Simple star approximation with lines
      let pts = ()
      for i in range(10) {
        let angle = 90deg - i * 36deg
        let r = if calc.even(i) { 1.5 } else { 0.7 }
        pts = pts + ((1.5 + r * calc.cos(angle), 2.0 + r * calc.sin(angle)),)
      }
      line(..pts, close: true, fill: C-GOLD.lighten(70%), stroke: 2pt + C-GOLD)
    })
    Số trục: \_\_\_\_
  ],
)

#bt-label(so: "32", title: "⭐⭐ Vẽ nửa còn lại — Draw the mirror half")

Vẽ nửa còn lại để tạo hình đối xứng qua đường chấm:

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  block[
    *a)*
    #canvas(length: 1cm, {
      import draw: *
      // Grid
      for r in range(7) {
        for c in range(8) {
          rect((c * 0.6, r * 0.6), ((c + 1) * 0.6, (r + 1) * 0.6), stroke: 0.5pt + C-LIGHT, fill: white)
        }
      }
      // Axis of symmetry
      line((2.4, 0), (2.4, 4.2), stroke: (paint: C-RED, dash: "dashed", thickness: 1.5pt))
      // Left half of a house shape
      line((0, 0.6), (2.4, 0.6), stroke: 2pt + C-CH-NC.at(3))
      line((0, 0.6), (0, 3.0), stroke: 2pt + C-CH-NC.at(3))
      line((0, 3.0), (1.2, 4.2), stroke: 2pt + C-CH-NC.at(3))
      line((1.2, 4.2), (2.4, 3.0), stroke: 2pt + C-CH-NC.at(3))
      line((2.4, 3.0), (2.4, 0.6), stroke: 2pt + C-CH-NC.at(3))
    })
  ],
  block[
    *b)*
    #canvas(length: 1cm, {
      import draw: *
      // Grid
      for r in range(7) {
        for c in range(8) {
          rect((c * 0.6, r * 0.6), ((c + 1) * 0.6, (r + 1) * 0.6), stroke: 0.5pt + C-LIGHT, fill: white)
        }
      }
      // Axis of symmetry
      line((2.4, 0), (2.4, 4.2), stroke: (paint: C-RED, dash: "dashed", thickness: 1.5pt))
      // Left half: letter C shape
      line((2.4, 0.6), (0.6, 0.6), stroke: 2pt + C-CH-NC.at(3))
      line((0.6, 0.6), (0.6, 3.6), stroke: 2pt + C-CH-NC.at(3))
      line((0.6, 3.6), (2.4, 3.6), stroke: 2pt + C-CH-NC.at(3))
      line((0.6, 1.8), (1.8, 1.8), stroke: 2pt + C-CH-NC.at(3))
      line((0.6, 2.4), (1.8, 2.4), stroke: 2pt + C-CH-NC.at(3))
    })
  ],
)

// ══════════════════════════════════════════════════════════════════════════
// BÀI 18: DIỆN TÍCH BẰNG ĐẾM Ô VUÔNG / AREA BY COUNTING
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "18",
  ten-vi: "Diện Tích Bằng Đếm Ô Vuông",
  ten-en: "Area by Counting Unit Squares",
  icon: "📏",
  kho: 2,
  c: C-CH-NC.at(3),
)

#ly-thuyet(title: "DIỆN TÍCH — AREA")[
  *Diện tích* là lượng *mặt phẳng* mà một hình bao phủ. Ta đo bằng *ô vuông đơn vị*. \
  _Area is the amount of flat space a shape covers. We measure it in unit squares._

  Hình chữ nhật: *Diện tích = Chiều dài × Chiều rộng* / _Area = Length × Width_
]

#bt-label(so: "33", title: "⭐ Đếm ô vuông — Count unit squares")

Mỗi ô vuông nhỏ = 1 cm². Tính diện tích mỗi hình:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 16pt,
  block[
    *a)*
    #luoi-ke(cols: 5, rows: 4, fills: (
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      white,
      white,
      white,
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      white,
      white,
      white,
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
      C-TEAL.lighten(70%),
    ))
    Diện tích: \_\_\_\_ cm²
  ],
  block[
    *b)*
    #luoi-ke(cols: 5, rows: 4, fills: (
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      white,
      white,
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      white,
      white,
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      white,
      white,
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
      C-PURPLE.lighten(70%),
    ))
    Diện tích: \_\_\_\_ cm²
  ],
  block[
    *c) Hình L*
    #luoi-ke(cols: 4, rows: 5, fills: (
      C-ORANGE.lighten(70%),
      white,
      white,
      white,
      C-ORANGE.lighten(70%),
      white,
      white,
      white,
      C-ORANGE.lighten(70%),
      white,
      white,
      white,
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
      C-ORANGE.lighten(70%),
    ))
    Diện tích: \_\_\_\_ cm²
  ],
)

#bt-label(so: "34", title: "⭐⭐⭐ Chu vi và diện tích — Perimeter & area challenge")

Hai hình A và B có cùng *diện tích* = 12 cm². Hình nào có *chu vi nhỏ hơn*?

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  block[
    *Hình A:* Hình chữ nhật 6×2
    #canvas(length: 1cm, {
      import draw: *
      rect((0, 0), (6, 2), fill: C-TEAL.lighten(80%), stroke: 2pt + C-TEAL)
      content((3, -0.4), text(size: 9pt)[6 cm])
      content((-0.4, 1), text(size: 9pt)[2 cm])
    })
    Chu vi = \_\_\_\_ cm
  ],
  block[
    *Hình B:* Hình vuông 4×3
    #canvas(length: 1cm, {
      import draw: *
      rect((0, 0), (4, 3), fill: C-PURPLE.lighten(80%), stroke: 2pt + C-PURPLE)
      content((2, -0.4), text(size: 9pt)[4 cm])
      content((-0.4, 1.5), text(size: 9pt)[3 cm])
    })
    Chu vi = \_\_\_\_ cm
  ],
)

#suy-luan[
  Cả hai hình có cùng diện tích nhưng chu vi *khác nhau*. Hình nào "tròn hơn" thì có chu vi \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_. \
  Hình nào "dẹt hơn" thì có chu vi \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_. \
  _Which shape is "squarer"? What do you notice about its perimeter?_
]

#hai-cach[
  *Hai cách tìm diện tích hình chữ nhật 6 × 4:*
  - Cách 1: đếm đủ 24 ô vuông đơn vị.
  - Cách 2: nhân 6 × 4 = 24.

  Khi hình là chữ nhật đẹp, cách 2 nhanh hơn. Khi hình bị khuyết hoặc lạ, cách 1 an toàn hơn.
]

// ══════════════════════════════════════════════════════════════════════════
// BÀI 19: CẮT GHÉP HÌNH / DISSECT & REARRANGE
// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-nc(
  so: "19",
  ten-vi: "Cắt và Ghép Hình",
  ten-en: "Dissect and Rearrange Shapes",
  icon: "✂️",
  kho: 3,
  c: C-CH-NC.at(3),
)

#bt-label(so: "35", title: "⭐⭐ Tangram cơ bản — Basic Tangram")

Bộ Tangram gồm *7 mảnh*. Hãy dùng tất cả 7 mảnh (hoặc vẽ vào ô dưới) để tạo các hình sau:

#block(fill: C-CH-NC.at(3).lighten(90%), inset: 14pt, radius: 8pt)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    block[
      *a) Hình chữ nhật:*
      #rect(width: 100%, height: 5cm, stroke: (paint: C-MID, dash: "dashed"), fill: white, radius: 6pt)[]
    ],
    block[
      *b) Hình tam giác lớn:*
      #rect(width: 100%, height: 5cm, stroke: (paint: C-MID, dash: "dashed"), fill: white, radius: 6pt)[]
    ],
  )
]

#kham-pha[
  Các mảnh Tangram: 2 tam giác lớn + 1 tam giác trung + 2 tam giác nhỏ + 1 hình vuông + 1 hình bình hành. \
  Tổng diện tích 7 mảnh bằng diện tích hình vuông 4×4 = *16 ô vuông*. \
  _Tangram pieces: 2 large + 1 medium + 2 small triangles + 1 square + 1 parallelogram = total area 16 sq units._
]

#bt-label(so: "36", title: "⭐⭐⭐⭐ Thách thức hình học — Geometry challenge")

#olympiad(the-loai: "Hình Học Sáng Tạo — Creative Geometry")[
  Một hình chữ nhật 4×6 được cắt thành *3 mảnh* bằng cách vẽ 2 đường thẳng. Sau đó ghép lại thành *hình chữ nhật 3×8*. \
  Hỏi cần cắt như thế nào? (Gợi ý: tổng diện tích trước = sau = \_\_\_\_ cm²)

  *Cắt hình 4×6:*
  #canvas(length: 1cm, {
    import draw: *
    rect((0, 0), (6, 4), fill: C-PURPLE.lighten(85%), stroke: 2pt + C-PURPLE)
    content((3, 2), text(size: 11pt)[4 × 6 = 24 cm²])
  })

  #v(0.5em)
  _Hướng dẫn: Tổng diện tích = 4×6 = \_\_\_\_ cm². Hình chữ nhật mới 3×8 có diện tích = \_\_\_\_ cm². Có bằng không?_
  #dong-viet(n: 3)
]

#kiem-tra-nc(
  chuong: "4",
  ten: "Hình Học Nâng Cao",
  so-cau: "6",
  tg: "25 phút",
)

*Câu 1.* Hình tam giác lớn được chia thành 4 tam giác nhỏ bằng nhau. Đếm tất cả các tam giác trong hình: \_\_\_\_ tam giác

*Câu 2.* Hình vuông có bao nhiêu trục đối xứng? \_\_\_\_. Hình chữ nhật có bao nhiêu? \_\_\_\_.

*Câu 3.* Tính diện tích hình L (xem hình): hình chữ nhật lớn 5×4, cắt bỏ góc 2×2.
_Diện tích = \_\_\_\_ cm²_

*Câu 4.* Trong lưới ô vuông, vẽ 3 hình khác nhau có cùng diện tích = 6 ô vuông:

#canvas(length: 1cm, {
  import draw: *
  for r in range(6) {
    for c in range(16) {
      rect((c * 0.65, r * 0.65), ((c + 1) * 0.65, (r + 1) * 0.65), stroke: 0.4pt + C-LIGHT, fill: white)
    }
  }
})

*Câu 5.* Chu vi hình chữ nhật = 28 cm. Chiều dài = chiều rộng + 4 cm. Tính diện tích:
#o-tra-loi(h: 2cm)

*Câu 6* ⭐⭐⭐⭐ Một hình chữ nhật 10×6 được cắt thành hai phần, mỗi phần là hình chữ nhật. Tổng chu vi hai phần = 72 cm. Tìm kích thước từng phần.
#dong-viet(n: 3)
