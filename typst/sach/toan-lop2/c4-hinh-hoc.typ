// ══════════════════════════════════════════════════════════════════════════
// c4-hinh-hoc.typ — CHƯƠNG 4: HÌNH HỌC  /  Geometry
// ══════════════════════════════════════════════════════════════════════════
#import "@preview/cetz:0.5.2": canvas, draw
#import "_theme.typ": *

#chuong-header(so: 4, ten: "Hình Học  /  Geometry", icon: "📐", so-bai: "4", so-trang: "18")

#muc-tieu((
  [Nhận biết điểm, đường thẳng, đoạn thẳng — Identify points, lines, segments],
  [Phân biệt các loại góc — Identify right, acute, obtuse angles],
  [Nhận biết hình tam giác và hình tứ giác — Triangles & quadrilaterals],
  [Tính chu vi hình chữ nhật và hình vuông — Perimeter of rectangle & square],
  [Giải bài toán hình học thực tế — Solve practical geometry problems],
))

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "15",
  ten-vi: "Điểm, Đường Thẳng, Đoạn Thẳng",
  ten-en: "Points, Lines & Line Segments",
  icon: "📌",
  c: C-CH.at(3),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("điểm", "point"),
  ("đường thẳng", "line"),
  ("đoạn thẳng", "line segment"),
  ("tia", "ray"),
  ("góc vuông", "right angle"),
  ("góc nhọn", "acute angle"),
))

#ly-thuyet(title: "ĐIỂM, ĐƯỜNG THẲNG, ĐOẠN THẲNG")[
  #set par(first-line-indent: 0em)
  #canvas(length: 1cm, {
    import draw: *
    // Points
    circle((0, 3), radius: 0.1, fill: C-CH.at(3), stroke: none)
    content((0.35, 3), text(size: 9pt)[Điểm A])

    // Line segment AB
    circle((2.5, 3), radius: 0.07, fill: C-CH.at(3), stroke: none)
    content((2.5, 3.4), text(size: 9pt)[A])
    circle((6.5, 3), radius: 0.07, fill: C-CH.at(3), stroke: none)
    content((6.5, 3.4), text(size: 9pt)[B])
    line((2.5, 3), (6.5, 3), stroke: 2pt + C-CH.at(3))
    content((4.5, 2.5), text(size: 9pt, fill: C-MID)[Đoạn thẳng AB = 4 cm (line segment)])

    // Line (extends)
    line((8, 3), (12, 3), stroke: 1.5pt + C-DARK)
    content((8, 3.4), text(size: 9pt)[←])
    content((12, 3.4), text(size: 9pt)[→])
    content((10, 2.5), text(size: 9pt, fill: C-MID)[Đường thẳng (line, infinite)])

    // Right angle
    let ox = 0.5
    let oy = 0
    line((ox, oy), (ox + 2.5, oy), stroke: 2pt + C-GREEN)
    line((ox, oy), (ox, oy + 2.0), stroke: 2pt + C-GREEN)
    rect((ox, oy), (ox + 0.4, oy + 0.4), stroke: 1.5pt + C-GREEN, fill: none)
    content((ox + 1.25, -0.5), text(size: 9pt, fill: C-GREEN)[Góc vuông 90°\ (right angle)])

    // Acute angle
    line((5, 0), (7, 0), stroke: 2pt + C-ORANGE)
    line((5, 0), (6.5, 1.5), stroke: 2pt + C-ORANGE)
    content((6, -0.5), text(size: 9pt, fill: C-ORANGE)[Góc nhọn < 90°\ (acute angle)])

    // Obtuse angle
    line((9.5, 0), (12, 0), stroke: 2pt + C-PINK)
    line((9.5, 0), (8.5, 1.5), stroke: 2pt + C-PINK)
    content((10, -0.5), text(size: 9pt, fill: C-PINK)[Góc tù > 90°\ (obtuse angle)])
  })
]

#vi-du(title: "Mẫu tự học: gọi tên đúng")[
  - Chỉ có *2 đầu mút A và B* thì đó là *đoạn thẳng AB*.
  - Kéo dài mãi về *hai phía* thì đó là *đường thẳng*.
  - Nếu một cạnh ngang gặp một cạnh dọc tạo góc *90°* thì đó là *góc vuông*.

  *Ví dụ thêm:* góc mở nhỏ hơn góc vuông là *góc nhọn*.
]

#chu-y[
  Học sinh hay nhìn hình bị nghiêng rồi gọi sai loại góc.
  Góc vuông, nhọn hay tù phụ thuộc vào *độ mở của góc*, không phụ thuộc vào hình quay hướng nào.
]

#bt-label(so: "26", title: "Đo và ghi độ dài — Measure and write")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    *a)* Vẽ đoạn thẳng AB = 5 cm:
    #canvas(length: 1cm, {
      import draw: *
      line((0, 0), (5, 0), stroke: 0.7pt + C-LIGHT)
      for i in range(6) {
        line((i * 1.0, -0.15), (i * 1.0, 0.15), stroke: 0.8pt + C-MID)
        content((i * 1.0, 0.4), text(size: 7pt)[#str(i)])
      }
    })
    *AB* = #o-so() cm
  ],
  [
    *b)* Vẽ đoạn thẳng CD = 7 cm:
    #canvas(length: 1cm, {
      import draw: *
      line((0, 0), (7, 0), stroke: 0.7pt + C-LIGHT)
      for i in range(8) {
        line((i * 1.0, -0.15), (i * 1.0, 0.15), stroke: 0.8pt + C-MID)
        content((i * 1.0, 0.4), text(size: 7pt)[#str(i)])
      }
    })
    *CD* = #o-so() cm
  ],

  [
    *c)* Vẽ đoạn thẳng MN = 4 cm:
    #canvas(length: 1cm, {
      import draw: *
      line((0, 0), (4, 0), stroke: 0.7pt + C-LIGHT)
      for i in range(5) {
        line((i * 1.0, -0.15), (i * 1.0, 0.15), stroke: 0.8pt + C-MID)
        content((i * 1.0, 0.4), text(size: 7pt)[#str(i)])
      }
    })
    *MN* = #o-so() cm
  ],
  [
    *d)* Vẽ đoạn thẳng PQ = 6 cm:
    #canvas(length: 1cm, {
      import draw: *
      line((0, 0), (6, 0), stroke: 0.7pt + C-LIGHT)
      for i in range(7) {
        line((i * 1.0, -0.15), (i * 1.0, 0.15), stroke: 0.8pt + C-MID)
        content((i * 1.0, 0.4), text(size: 7pt)[#str(i)])
      }
    })
    *PQ* = #o-so() cm
  ],
)

#bt-label(so: "27", title: "Gọi tên góc — Name the angles")

Với mỗi hình, khoanh vào đúng loại góc: (góc vuông / góc nhọn / góc tù)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm)[
    #canvas(length: 1cm, {
      import draw: *
      line((0.5, 0.5), (3.5, 0.5), stroke: 2pt + C-DARK)
      line((0.5, 0.5), (0.5, 3.5), stroke: 2pt + C-DARK)
      rect((0.5, 0.5), (1.0, 1.0), stroke: 1.5pt + C-GREEN, fill: none)
    })
    #align(center)[Góc: *\_\_\_\_\_\_*]
  ],
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm)[
    #canvas(length: 1cm, {
      import draw: *
      line((0.5, 0.5), (3.5, 0.5), stroke: 2pt + C-DARK)
      line((0.5, 0.5), (2.5, 3.2), stroke: 2pt + C-DARK)
    })
    #align(center)[Góc: *\_\_\_\_\_\_*]
  ],
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm)[
    #canvas(length: 1cm, {
      import draw: *
      line((0.5, 1.2), (3.5, 1.2), stroke: 2pt + C-DARK)
      line((3.5, 1.2), (1.5, 3.0), stroke: 2pt + C-DARK)
    })
    #align(center)[Góc: *\_\_\_\_\_\_*]
  ],
)

#suy-nghi()[
  #set par(first-line-indent: 0em)
  Tam giác có thể có *2 góc vuông* không? Tại sao? / Can a triangle have 2 right angles? Why or why not?
  #dong-viet(n: 2)
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "16",
  ten-vi: "Hình Tam Giác và Tứ Giác",
  ten-en: "Triangles & Quadrilaterals",
  icon: "🔺",
  c: C-CH.at(3),
)
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("tam giác", "triangle"),
  ("tứ giác", "quadrilateral"),
  ("cạnh", "side"),
  ("đỉnh", "vertex"),
  ("góc", "angle"),
))

#ly-thuyet(title: "NHẬN BIẾT HÌNH — IDENTIFYING SHAPES")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-CH.at(3).lighten(88%), stroke: 2pt + C-CH.at(3), inset: 12pt, radius: 8pt)[
      #align(center)[#canvas(length: 1cm, {
        import draw: *
        line((1, 0), (3, 0), stroke: 2pt + C-CH.at(3))
        line((3, 0), (2, 2.5), stroke: 2pt + C-CH.at(3))
        line((2, 2.5), (1, 0), stroke: 2pt + C-CH.at(3))
        for p in ((1, 0), (3, 0), (2, 2.5)) {
          circle(p, radius: 0.12, fill: C-CH.at(3), stroke: none)
        }
        content((0.5, -0.4), text(size: 9pt, fill: C-CH.at(3))[A])
        content((3.3, -0.4), text(size: 9pt, fill: C-CH.at(3))[B])
        content((2.0, 2.9), text(size: 9pt, fill: C-CH.at(3))[C])
      })]
      #set par(first-line-indent: 0em)
      *Tam giác / Triangle*
      - 3 cạnh (*sides*)
      - 3 đỉnh (*vertices*)
      - 3 góc (*angles*)
    ],
    block(fill: C-BLUE.lighten(88%), stroke: 2pt + C-BLUE, inset: 12pt, radius: 8pt)[
      #align(center)[#canvas(length: 1cm, {
        import draw: *
        line((0.5, 0), (3.5, 0), stroke: 2pt + C-BLUE)
        line((3.5, 0), (3.5, 2.5), stroke: 2pt + C-BLUE)
        line((3.5, 2.5), (0.5, 2.5), stroke: 2pt + C-BLUE)
        line((0.5, 2.5), (0.5, 0), stroke: 2pt + C-BLUE)
        for p in ((0.5, 0), (3.5, 0), (3.5, 2.5), (0.5, 2.5)) {
          circle(p, radius: 0.12, fill: C-BLUE, stroke: none)
        }
      })]
      #set par(first-line-indent: 0em)
      *Tứ giác / Quadrilateral*
      - 4 cạnh (*sides*)
      - 4 đỉnh (*vertices*)
      - 4 góc (*angles*)
    ],
  )
]

#vi-du(title: "Mẫu tự học: đếm cạnh và đỉnh")[
  *Tam giác ABC* có *3 cạnh, 3 đỉnh, 3 góc*.

  *Tứ giác* dù đứng thẳng hay nghiêng vẫn chỉ cần kiểm tra:
  - có *4 cạnh*;
  - có *4 đỉnh*.
]

#chu-y[
  Học sinh hay nghĩ tứ giác chỉ là hình chữ nhật hay hình vuông.
  Thật ra cứ có *4 cạnh* là đã là *tứ giác*.
]

#bt-label(so: "28", title: "Đếm hình — Count shapes")

#block(fill: C-CREAM, stroke: 1.5pt + C-GOLD, inset: 14pt, radius: 8pt, width: 100%)[
  #canvas(length: 1cm, {
    import draw: *
    // A compound figure with triangles and quadrilaterals
    // Big rectangle
    rect((0, 0), (4, 3), stroke: 2pt + C-DARK, fill: none)
    // Diagonal to make triangles
    line((0, 0), (4, 3), stroke: 1.5pt + C-CH.at(3))
    // Small triangle
    line((5, 0), (7, 0), stroke: 2pt + C-DARK)
    line((7, 0), (6, 2.5), stroke: 2pt + C-DARK)
    line((6, 2.5), (5, 0), stroke: 2pt + C-DARK)
    // Parallelogram-like quad
    line((8.5, 0), (11.5, 0), stroke: 2pt + C-DARK)
    line((11.5, 0), (12.5, 2.5), stroke: 2pt + C-DARK)
    line((12.5, 2.5), (9.5, 2.5), stroke: 2pt + C-DARK)
    line((9.5, 2.5), (8.5, 0), stroke: 2pt + C-DARK)
    // Triangle inside
    line((8.5, 0), (12.5, 2.5), stroke: 1.5pt + C-CH.at(3))
  })
  #set par(first-line-indent: 0em)
  Số tam giác: #o-so() #h(3em) Số tứ giác: #o-so() #h(3em) Tổng số hình: #o-so()
]

#bt-label(so: "29", title: "Ghép hình — Compose shapes")

Dùng *2 tam giác* bằng nhau, em có thể ghép thành những hình nào?
Vẽ hoặc mô tả: (Gợi ý: hình thoi, hình chữ nhật, tam giác lớn hơn)
#o-tra-loi(h: 4cm)

#v(0.3em)
*Điền nhanh:*
#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  [Tam giác có #o-so(w: 1.5cm) cạnh], [Tứ giác có #o-so(w: 1.5cm) cạnh],
  [Tam giác có #o-so(w: 1.5cm) đỉnh], [Tứ giác có #o-so(w: 1.5cm) đỉnh],
)

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(so: "17", ten-vi: "Hình Chữ Nhật và Hình Vuông", ten-en: "Rectangles & Squares", icon: "🔲", c: C-CH.at(3))
// ══════════════════════════════════════════════════════════════════════════

#tu-khoa((
  ("hình chữ nhật", "rectangle"),
  ("hình vuông", "square"),
  ("chiều dài", "length"),
  ("chiều rộng", "width"),
  ("cạnh bằng nhau", "equal sides"),
))

#ly-thuyet(title: "NHẬN BIẾT HÌNH — RECTANGLES & SQUARES")[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 14pt,
    block(fill: C-GREEN.lighten(88%), stroke: 2pt + C-GREEN, inset: 12pt, radius: 8pt)[
      #hinh-chu-nhat(w: 5, h: 3, c: C-GREEN)
      #set par(first-line-indent: 0em)
      *Hình chữ nhật / Rectangle:*
      - 4 góc vuông (*right angles*)
      - 2 cặp cạnh bằng nhau:
        dài = dài, rộng = rộng
      - *Chu vi* = (dài + rộng) × 2
    ],
    block(fill: C-PURPLE.lighten(88%), stroke: 2pt + C-PURPLE, inset: 12pt, radius: 8pt)[
      #hinh-vuong(s: 3.5, c: C-PURPLE)
      #set par(first-line-indent: 0em)
      *Hình vuông / Square:*
      - 4 góc vuông (*right angles*)
      - 4 cạnh *bằng nhau*
      - *Chu vi* = cạnh × 4
      - Hình vuông là hình chữ nhật đặc biệt!
    ],
  )
]

#vi-du()[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 12pt,
    [
      Tính chu vi hình chữ nhật có dài *8 cm*, rộng *5 cm*:
      #v(0.3em)
      Chu vi = (8 + 5) × 2 = 13 × 2 = *26 cm*
    ],
    [
      Tính chu vi hình vuông có cạnh *6 cm*:
      #v(0.3em)
      Chu vi = 6 × 4 = *24 cm*
    ],

    [
      Tính chu vi hình chữ nhật có dài *9 cm*, rộng *4 cm*:
      #v(0.3em)
      Chu vi = (9 + 4) × 2 = 13 × 2 = *26 cm*
    ],
    [
      Tính chu vi hình vuông có cạnh *8 cm*:
      #v(0.3em)
      Chu vi = 8 × 4 = *32 cm*
    ],
  )
]

#bt-label(so: "30", title: "Tính chu vi — Calculate perimeter")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: C-MINT, stroke: 1.5pt + C-GREEN, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #hinh-chu-nhat(w: 5.5, h: 3, c: C-GREEN)
    *Dài = 12 cm, Rộng = 7 cm*
    Chu vi = #o-so(w: 4cm)
  ],
  block(fill: C-LAVENDER, stroke: 1.5pt + C-PURPLE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #hinh-vuong(s: 3.5, c: C-PURPLE)
    *Cạnh = 9 cm*
    Chu vi = #o-so(w: 4cm)
  ],

  block(fill: C-PEACH, stroke: 1.5pt + C-ORANGE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #hinh-chu-nhat(w: 5.0, h: 2.6, c: C-ORANGE)
    *Dài = 15 cm, Rộng = 6 cm*
    Chu vi = #o-so(w: 4cm)
  ],
  block(fill: C-BLUE.lighten(88%), stroke: 1.5pt + C-BLUE, inset: 12pt, radius: 8pt)[
    #set par(first-line-indent: 0em)
    #hinh-vuong(s: 3.5, c: C-BLUE)
    *Cạnh = 11 cm*
    Chu vi = #o-so(w: 4cm)
  ],
)

#bt-label(so: "31", title: "Tìm chiều chưa biết — Find the missing dimension")

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [*a)* Hình chữ nhật: chu vi = 36 cm, dài = 11 cm → rộng = #o-so()],
  [*b)* Hình vuông: chu vi = 28 cm → cạnh = #o-so()],

  [*c)* Hình chữ nhật: chu vi = 50 cm, rộng = 9 cm → dài = #o-so()], [*d)* Hình vuông: chu vi = 40 cm → cạnh = #o-so()],
)

#suy-nghi()[
  #set par(first-line-indent: 0em)
  Hình vuông và hình chữ nhật: cái nào là trường hợp đặc biệt của cái nào? Tại sao?
  #text(fill: C-MID, size: 9.5pt)[Is a square a special rectangle, or is a rectangle a special square? Explain.]
  #dong-viet(n: 2)
]

#so-do-thanh-goi-y[
  *Mẹo dùng sơ đồ thanh cho bài chu vi hình chữ nhật:*

  Vì *chu vi = (dài + rộng) × 2* nên *nửa chu vi = dài + rộng*.
  Ví dụ: chu vi *36 cm*, rộng *8 cm*.

  #align(center)[
    #bar-model(
      label-total: "18 cm",
      parts: (
        (label: "8 cm", w: 3.2),
        (label: "? cm", w: 4.0),
      ),
      bw: 7.2,
    )
  ]

  Từ sơ đồ, em tìm được chiều dài là *10 cm*.
]

#hai-cach[
  *Hai cách tìm chiều dài khi chu vi 36 cm, rộng 8 cm:*
  - Cách 1: nửa chu vi = 18 cm, nên dài = 18 - 8 = 10 cm.
  - Cách 2: bỏ 2 cạnh rộng khỏi chu vi: 36 - 16 = 20, rồi chia 2 được 10 cm.

  Cách 1 ngắn hơn. Cách 2 giúp em hiểu vì sao phải lấy nửa chu vi.
]

#sai-o-dau[
  Bạn Mai nói: *"Hình vuông không phải hình chữ nhật vì hình chữ nhật phải có 2 cạnh dài và 2 cạnh ngắn."*

  Em hãy chỉ ra bạn Mai sai ở đâu. Hãy nhớ xem lại định nghĩa của hình chữ nhật.
]

#sao-danh-gia

// ══════════════════════════════════════════════════════════════════════════
#bai-hoc-en(
  so: "18",
  ten-vi: "Chu Vi Hình Phức Tạp",
  ten-en: "Perimeter of Composite Shapes",
  icon: "📏",
  c: C-CH.at(3),
)
// ══════════════════════════════════════════════════════════════════════════

#ly-thuyet(title: "HÌNH PHỨC HỢP — COMPOSITE SHAPES")[
  #set par(first-line-indent: 0em)
  Hình phức hợp = ghép nhiều hình đơn giản lại. Tính chu vi = đo *tất cả cạnh bên ngoài*.
  #text(fill: C-MID, size: 9.5pt)[Composite shape = multiple simple shapes joined. Perimeter = all outer edges.]

  #canvas(length: 1cm, {
    import draw: *
    // L-shaped figure
    // Bottom rectangle 8x3
    rect((0, 0), (8, 3), stroke: 2.5pt + C-CH.at(3), fill: C-CH.at(3).lighten(90%))
    // Top rectangle 4x3 on left
    rect((0, 3), (4, 6), stroke: 2.5pt + C-CH.at(3), fill: C-CH.at(3).lighten(80%))

    // Labels
    content((4, -0.5), text(size: 9.5pt, fill: C-CH.at(3), weight: "bold")[8 cm])
    content((-0.7, 1.5), text(size: 9.5pt, fill: C-CH.at(3), weight: "bold")[3 cm])
    content((2, 6.4), text(size: 9.5pt, fill: C-CH.at(3), weight: "bold")[4 cm])
    content((-0.7, 4.5), text(size: 9.5pt, fill: C-CH.at(3), weight: "bold")[3 cm])
    content((6, 3.4), text(size: 9.5pt, fill: C-ORANGE, weight: "bold")[4 cm →])
    content((8.5, 1.5), text(size: 9.5pt, fill: C-CH.at(3), weight: "bold")[3 cm])

    content((11, 3), text(size: 11pt)[Các cạnh:\8+3+4+3+4+6 = *28 cm*])
  })
]

#vi-du(title: "Mẫu tự học: chỉ cộng cạnh bên ngoài")[
  Với hình chữ L ở trên, em chỉ đi theo *mép ngoài* của hình.

  Nếu một cạnh nằm *bên trong chỗ ghép*, em *không cộng* cạnh đó vào chu vi.
]

#chu-y[
  Lỗi hay gặp nhất là cộng cả cạnh bên trong của hình ghép.
  Chu vi chỉ gồm *các cạnh ở viền ngoài*.
]

#bt-label(so: "32", title: "Tính chu vi hình phức hợp — Perimeter of composite shapes")

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(stroke: 1pt + C-LIGHT, inset: 12pt, radius: 6pt)[
    #set par(first-line-indent: 0em)
    #canvas(length: 1cm, {
      import draw: *
      // T-shape
      rect((0, 0), (6, 2), stroke: 2pt + C-DARK, fill: C-MINT)
      rect((2, 2), (4, 4), stroke: 2pt + C-DARK, fill: C-MINT)
      content((3, -0.5), text(size: 9pt)[6 cm])
      content((-0.6, 1), text(size: 9pt)[2 cm])
      content((3, 4.4), text(size: 9pt)[2 cm])
      content((4.4, 3), text(size: 9pt)[2 cm])
    })
    Chu vi = #o-so(w: 3.5cm)
    #dong-viet(n: 2)
  ],
  block(stroke: 1pt + C-LIGHT, inset: 12pt, radius: 6pt)[
    #set par(first-line-indent: 0em)
    #canvas(length: 1cm, {
      import draw: *
      // Plus/cross shape
      rect((0, 2), (6, 4), stroke: 2pt + C-DARK, fill: C-LAVENDER)
      rect((2, 0), (4, 6), stroke: 2pt + C-DARK, fill: C-LAVENDER)
      // Re-draw overlapping area
      rect((2, 2), (4, 4), stroke: 2pt + C-DARK, fill: C-LAVENDER)
      content((3, -0.5), text(size: 9pt)[2 cm])
      content((-0.5, 3), text(size: 9pt)[2 cm])
      content((3, 6.4), text(size: 9pt)[2 cm])
      content((6.5, 3), text(size: 9pt)[2 cm])
    })
    Chu vi = #o-so(w: 3.5cm)
    #dong-viet(n: 2)
  ],
)

#nang-cao()[
  #set par(first-line-indent: 0em)
  🧠 *Tư duy sáng tạo / Creative Thinking:*

  Dùng *sợi dây dài 24 cm* để làm khung hình chữ nhật. Hãy tìm *tất cả* các kích thước (dài, rộng) nguyên cm có thể, biết dài > rộng.

  #text(
    fill: C-MID,
    size: 10pt,
  )[Use 24 cm of wire to make a rectangular frame. Find ALL possible integer dimensions (length > width).]

  #table(
    columns: (3.5cm, 3.5cm, 3.5cm, 3.5cm),
    inset: 8pt,
    align: center,
    stroke: 0.8pt + C-LIGHT,
    fill: (x, y) => if y == 0 { C-CH.at(3).lighten(80%) } else { white },
    [Dài (cm)], [Rộng (cm)], [Chu vi?], [Đúng?],
    [], [], [24 cm], [☐],
    [], [], [24 cm], [☐],
    [], [], [24 cm], [☐],
    [], [], [24 cm], [☐],
  )

  Cái nào gần hình vuông nhất? → *\_\_\_\_\_*
]

// ═══ ÔN TẬP CHƯƠNG 4 ════════════════════════════════════════════

= Ôn Tập Chương 4 — Review: Geometry

#set par(first-line-indent: 0em)

*1.* Nhận dạng hình (Identify shapes) — Điền tên đúng:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 10pt,
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm, width: 100%)[
    #canvas(length: 1cm, {
      import draw: *
      line((0.5, 0.5), (4.0, 0.5), stroke: 2pt + C-DARK)
      line((4.0, 0.5), (2.25, 3.8), stroke: 2pt + C-DARK)
      line((2.25, 3.8), (0.5, 0.5), stroke: 2pt + C-DARK)
    })
    Tên: *\_\_\_\_\_\_\_\_*\ Số cạnh: *\_\_\_*
  ],
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm, width: 100%)[
    #canvas(length: 1cm, {
      import draw: *
      rect((0.5, 0.5), (4.0, 3.5), stroke: 2pt + C-DARK, fill: none)
    })
    Tên: *\_\_\_\_\_\_\_\_*\ Số cạnh: *\_\_\_*
  ],
  block(stroke: 1pt + C-LIGHT, inset: 10pt, radius: 6pt, height: 5cm, width: 100%)[
    #canvas(length: 1cm, {
      import draw: *
      rect((0.75, 0.5), (3.75, 3.5), stroke: 2pt + C-DARK, fill: none)
    })
    Tên: *\_\_\_\_\_\_\_\_*\ Số cạnh: *\_\_\_*
  ],
)

*2.* Tính chu vi:
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  [HCN: dài 15 cm, rộng 8 cm \ Chu vi = #o-so()],
  [HV: cạnh 13 cm \ Chu vi = #o-so()],
  [HCN: chu vi 54 cm, dài 16 cm \ Rộng = #o-so()],
)

*3.* Toán đố: Mảnh vườn hình chữ nhật dài *25 m*, rộng bằng một nửa chiều dài. Tính chu vi?
#o-tra-loi(h: 3.5cm, label: "Bài giải:")

#cau-hoi-mo[
  Em hãy vẽ *ít nhất 2 hình chữ nhật khác nhau* có cùng chu vi *20 cm*.

  Hình nào dài hơn? Hình nào rộng hơn? Em nhận ra điều gì khi các hình có *cùng chu vi* nhưng *khác kích thước cạnh*?

  #o-tra-loi(h: 3.0cm, label: "Hình và nhận xét của em:")
]

#kiem-tra-header(chuong: "4", so-cau: "7", tg: "20 phút")

*Câu 1.* Hình có 4 cạnh bằng nhau và 4 góc vuông là hình gì?
#trac-nghiem-4(
  [Tam giác],
  [Hình chữ nhật],
  [Hình vuông],
  [Thoi],
)

*Câu 2.* Hình chữ nhật dài 14 cm, rộng 6 cm. Chu vi là?
#trac-nghiem-4(
  [84 cm],
  [40 cm],
  [20 cm],
  [48 cm],
)

*Câu 3.* Hình vuông chu vi 32 cm → cạnh là?
#trac-nghiem-4(
  [8 cm],
  [6 cm],
  [7 cm],
  [9 cm],
)

*Câu 4.* (2 điểm) Vẽ hình chữ nhật có dài 6 cm, rộng 3 cm và tính chu vi:
#o-tra-loi(h: 4cm)

*Câu 5.* (3 điểm) Mảnh sân hình chữ nhật: chu vi *60 m*, rộng *12 m*. Tính chiều dài, rồi tính diện tích sân (dài × rộng).
#o-tra-loi(h: 4cm, label: "Bài giải:")

#sao-danh-gia
