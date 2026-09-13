// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP TỔNG HỢP CHƯƠNG VII (ĐỀ SỐ 25A - MÃ ĐỀ 167)
// Lớp: Khối 10  ·  Mã đề: 167  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "@preview/sang-math:1.0.4": *
#import "../../../giao-an/modules/lecture-beamer.typ": *
#import "@preview/cetz:0.3.4"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let notin = sym.in.not
#let cap = math.inter
#let cup = math.union
#let setminus = math.without
#let subset = math.subset
#let emptyset = math.emptyset
#let True(body) = ("true": true, body: body)
#let accent = rgb("#0057b8")



#show: lecture-theme.with(
  title: "ÔN TẬP TỔNG HỢP CHƯƠNG VII (ĐỀ SỐ 25A - MÃ ĐỀ 167)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 167",
  author: "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  base-size: 18pt,
  math-color: rgb("#d81b60"),
  math-size: 1.05em,
  body-font: ("Arial", "Times New Roman"),
)

#lt-toc(title: [🗺️ CẤU TRÚC ĐỀ THI & ĐIỀU HƯỚNG])

// ── BẢNG ĐIỀU HƯỚNG 22 CÂU HỎI ────────────────────────────
#slide(title: none)[
  #[#metadata(none) #label("sec-exercise-hub")]
  #context {
    let s = _lec-style.get()
    v(-0.4em)
    grid(
      columns: (auto, 1fr, auto),
      align: (left + horizon, left + horizon, right + horizon),
      box(fill: s.accent, inset: (x: 10pt, y: 5pt), radius: 4pt)[
        #text(weight: "bold", fill: white, size: 11pt)[📋 MA TRẬN ĐIỀU HƯỚNG 22 CÂU HỎI]
      ],
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 167]],
      lt-nav-btn("lec-toc-main", icon: "◀", txt: "Mục lục chính")
    )
    v(0.4em)

    // Phần I: 12 câu TN (Lưới 6x2)
    block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#bfdbfe"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#1d4ed8"))[🎯 PHẦN I: TRẮC NGHIỆM 4 LỰA CHỌN (Câu 1 -> 12)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#3b82f6"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#1d4ed8"))[Câu #i]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần II: 4 câu Đúng/Sai (Lưới 4x1)
    block(fill: rgb("#faf5ff"), stroke: 1pt + rgb("#e9d5ff"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#7e22ce"))[📝 PHẦN II: TRẮC NGHIỆM ĐÚNG / SAI (Câu 13 -> 16 — Mỗi câu 4 ý a, b, c, d)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: 6pt,
        ..(13, 14, 15, 16).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#a855f7"),
              inset: (y: 4.5pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#7e22ce"))[Câu #i (Đ/S)]]
            )
          ]
        })
      )
    ]

    v(0.3em)

    // Phần III: 6 câu Trả lời ngắn (Lưới 6x1)
    block(fill: rgb("#ecfeff"), stroke: 1pt + rgb("#a5f3fc"), inset: 7pt, radius: 6pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold", fill: rgb("#0e7490"))[🔢 PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (Câu 17 -> 22)]
      #v(0.3em)
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        gutter: 5pt,
        ..(17, 18, 19, 20, 21, 22).map(i => {
          link(label("cau-" + str(i)))[
            #block(
              fill: white,
              stroke: 0.8pt + rgb("#06b6d4"),
              inset: (y: 4pt),
              radius: 4pt,
              width: 100%,
              align(center)[#text(size: 8pt, weight: "bold", fill: rgb("#0e7490"))[Câu #i]]
            )
          ]
        })
      )
    ]
  }
]

#let exam-part(title, count: none) = {
  slide(title: none)[
    #align(center + horizon)[
      #block(fill: rgb("#eff6ff"), stroke: 2pt + rgb("#2563eb"), inset: 18pt, radius: 10pt, width: 85%)[
        #text(size: 16pt, weight: "bold", fill: rgb("#1d4ed8"))[#title]
      ]
    ]
  ]
}

// ── NỘI DUNG 22 CÂU HỎI THỰC CHIẾN ─────────────────────────
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, một vectơ pháp tuyến của đường thẳng $d: 2x - 3y + 5 = 0$ là],
    (
        True([$vec(n) = (2; -3)$]),
        [$vec(n) = (3; 2)$],
        [$vec(n) = (2; 3)$],
        [$vec(n) = (-3; 2)$]
    ),
    loigiai: [
        Từ phương trình tổng quát $a x + b y + c = 0$, vectơ pháp tuyến là $vec(n) = (a; b) = (2; -3)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Góc tạo bởi hai đường thẳng $d_1: x + 2y - 1 = 0$ và $d_2: 2x - y + 3 = 0$ bằng],
    (
        True([$90^circ$]),
        [$45^circ$],
        [$60^circ$],
        [$30^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (1; 2)$ và $vec(n_2) = (2; -1)$.
        Tích vô hướng: $vec(n_1) cdot vec(n_2) = 1(2) + 2(-1) = 0$.
        Suy ra $d_1 perp d_2$, do đó góc giữa hai đường thẳng bằng $90^circ$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Khoảng cách từ điểm $M(1; -2)$ đến đường thẳng $d: 3x - 4y + 4 = 0$ bằng],
    (
        True([$3$]),
        [$5$],
        [$15$],
        [$2$]
    ),
    loigiai: [
        Áp dụng công thức tính khoảng cách:
        $ d(M, d) = (|3(1) - 4(-2) + 4|) / sqrt(3^2 + (-4)^2) = (|3 + 8 + 4|) / 5 = 15 / 5 = 3 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Tọa độ tâm $I$ và bán kính $R$ của đường tròn $(C): x^2 + y^2 - 4x + 6y - 3 = 0$ là],
    (
        True([$I(2; -3)$ và $R = 4$]),
        [$I(-2; 3)$ và $R = 4$],
        [$I(2; -3)$ và $R = 16$],
        [$I(-4; 6)$ và $R = sqrt(3)$]
    ),
    loigiai: [
        Hệ số: $a = 2, b = -3, c = -3$.
        Tâm $I(2; -3)$.
        Bán kính: $R = sqrt(2^2 + (-3)^2 - (-3)) = sqrt(4 + 9 + 3) = sqrt(16) = 4$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Phương trình tiếp tuyến của đường tròn $(C): x^2 + y^2 = 25$ tại điểm $M(3; -4) in (C)$ là],
    (
        True([$3x - 4y - 25 = 0$]),
        [$3x - 4y + 25 = 0$],
        [$4x + 3y = 0$],
        [$3x + 4y - 25 = 0$]
    ),
    loigiai: [
        Đường tròn có tâm $O(0; 0)$.
        Vectơ pháp tuyến của tiếp tuyến: $vec(O M) = (3; -4)$.
        Phương trình tiếp tuyến qua $M(3; -4)$:
        $ 3(x - 3) - 4(y - (-4)) = 0 <=> 3x - 9 - 4y - 16 = 0 <=> 3x - 4y - 25 = 0 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Tiêu cự của Elip $(E): x^2 / 16 + y^2 / 7 = 1$ bằng],
    (
        True([$6$]),
        [$3$],
        [$8$],
        [$4$]
    ),
    loigiai: [
        Ta có $a^2 = 16, b^2 = 7$.
        $ c = sqrt(a^2 - b^2) = sqrt(16 - 7) = sqrt(9) = 3 $
        Tiêu cự: $2c = 2(3) = 6$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Phương trình các đường tiệm cận của Hypebol $(H): x^2 / 25 - y^2 / 16 = 1$ là],
    (
        True([$y = plus.minus 4 / 5 x$]),
        [$y = plus.minus 5 / 4 x$],
        [$y = plus.minus 16 / 25 x$],
        [$y = plus.minus 25 / 16 x$]
    ),
    loigiai: [
        Ta có $a = 5$ và $b = 4$.
        Phương trình hai đường tiệm cận là:
        $ y = plus.minus b / a x = plus.minus 4 / 5 x $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Tọa độ tiêu điểm $F$ của Parabol $(P): y^2 = 12x$ là],
    (
        True([$F(3; 0)$]),
        [$F(6; 0)$],
        [$F(-3; 0)$],
        [$F(0; 3)$]
    ),
    loigiai: [
        $2p = 12 => p = 6$.
        Tiêu điểm của Parabol là $F(p / 2; 0) = F(3; 0)$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Tìm điều kiện của tham số $m$ để đường thẳng $d_1: 2x - y + 1 = 0$ song song với đường thẳng $d_2: 4x - 2y + m = 0$.],
    (
        True([$m != 2$]),
        [$m = 2$],
        [$m != -2$],
        [$m = -2$]
    ),
    loigiai: [
        Hai đường thẳng song song khi:
        $ 2 / 4 = (-1) / (-2) != 1 / m <=> 1 / 2 != 1 / m <=> m != 2 $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Vị trí tương đối của hai đường tròn $(C_1): (x - 1)^2 + y^2 = 4$ và $(C_2): (x - 4)^2 + y^2 = 9$ là],
    (
        True([Cắt nhau tại hai điểm]),
        [Tiếp xúc trong],
        [Tiếp xúc ngoài],
        [Không có điểm chung]
    ),
    loigiai: [
        $(C_1)$ có tâm $I_1(1; 0)$, bán kính $R_1 = 2$.
        $(C_2)$ có tâm $I_2(4; 0)$, bán kính $R_2 = 3$.
        Khoảng cách nối tâm: $I_1 I_2 = |4 - 1| = 3$.
        Hiệu hai bán kính: $R_2 - R_1 = 3 - 2 = 1 != 3$.
        Tổng hai bán kính: $R_1 + R_2 = 2 + 3 = 5$.
        Vì $R_2 - R_1 < I_1 I_2 < R_1 + R_2$ ($1 < 3 < 5$) nên hai đường tròn cắt nhau tại hai điểm!
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Một đường cáp treo nối đỉnh núi được mô hình bởi cung Parabol có đỉnh tại $M(0; 10)$ và đi qua hai điểm tháp cáp treo $A(-400; 50)$ và $B(400; 50)$ (đơn vị: mét). Phương trình của đường cáp treo là],
    (
        True([$y = 1 / 4000 x^2 + 10$]),
        [$y = 1 / 400 x^2 + 10$],
        [$y = - 1 / 4000 x^2 + 50$],
        [$y = 1 / 2000 x^2 + 10$]
    ),
    loigiai: [
        Dạng parabol đỉnh $M(0; 10)$: $y = a x^2 + 10$.
        Đi qua điểm $B(400; 50)$:
        $ 50 = a (400)^2 + 10 <=> 160000 a = 40 <=> a = 40 / 160000 = 1 / 4000 $
        Phương trình: $y = 1 / 4000 x^2 + 10$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Một vệ tinh địa tĩnh bay quanh Trái Đất theo quỹ đạo tròn có bán kính $R = 42164 text(" km")$.
Chọn gốc tọa độ tại tâm Trái Đất. Phương trình quỹ đạo của vệ tinh là],
    (
        True([$x^2 + y^2 = 42164^2$]),
        [$x^2 + y^2 = 42164$],
        [$(x - 42164)^2 + y^2 = 0$],
        [$x^2 - y^2 = 42164^2$]
    ),
    loigiai: [
        Quỹ đạo tròn tâm $O(0; 0)$ bán kính $R = 42164 text(" km")$ có phương trình:
        $ x^2 + y^2 = R^2 <=> x^2 + y^2 = 42164^2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Tam giác và các đường đặc biệt có CeTZ)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, cho ba điểm $A(1; 3)$, $B(-2; -1)$ và $C(4; -1)$ tạo thành tam giác $A B C$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Vẽ tam giác ABC
  line((1, 3), (-2, -1), stroke: 1.2pt + rgb("1e40af"))
  line((-2, -1), (4, -1), stroke: 1.2pt + rgb("1e40af"))
  line((4, -1), (1, 3), stroke: 1.2pt + rgb("1e40af"))
  
  // Đỉnh A, B, C
  circle((1, 3), radius: 2pt, fill: rgb("1e40af"))
  content((1, 3.4), [$A(1; 3)$])
  circle((-2, -1), radius: 2pt, fill: rgb("1e40af"))
  content((-2.4, -1.3), [$B(-2; -1)$])
  circle((4, -1), radius: 2pt, fill: rgb("1e40af"))
  content((4.4, -1.3), [$C(4; -1)$])
  
  // Trung điểm M(1; -1)
  circle((1, -1), radius: 2pt, fill: red)
  content((1, -1.4), [$M(1; -1)$])
  line((1, 3), (1, -1), stroke: (dash: "dashed", paint: red))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài cạnh $B C = 6$.]),
    True([Tọa độ trung điểm $M$ của cạnh $B C$ là $M(1; -1)$.]),
    True([Phương trình của đường trung tuyến $A M$ là $x = 1$.]),
    [Tam giác $A B C$ là một tam giác đều.]
  ),
  loigiai: [
    #step([Độ dài các cạnh])
    $B C = |4 - (-2)| = 6$. Mệnh đề a ĐÚNG.
    $A B = sqrt((-2 - 1)^2 + (-1 - 3)^2) = sqrt(9 + 16) = 5$.
    $A C = sqrt((4 - 1)^2 + (-1 - 3)^2) = sqrt(9 + 16) = 5$.

    #step([Trung điểm M])
    $x_M = (-2 + 4) / 2 = 1, y_M = (-1 + (-1)) / 2 = -1 => M(1; -1)$. Mệnh đề b ĐÚNG.

    #step([Đường trung tuyến AM])
    $A(1; 3)$ và $M(1; -1)$ có cùng hoành độ $x = 1$, nên phương trình là $x = 1$. Mệnh đề c ĐÚNG.

    #step([Tính chất tam giác])
    Vì $A B = A C = 5 != B C = 6$ nên tam giác $A B C$ là tam giác cân tại $A$ chứ không phải tam giác đều.
    Khẳng định tam giác đều là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Vị trí tương đối đường thẳng và đường tròn)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho đường tròn $(C): (x - 2)^2 + (y - 1)^2 = 25$ và đường thẳng $d: 3x - 4y + m = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đường tròn $(C)$ có tâm là $I(2; 1)$ và bán kính $R = 5$.]),
    True([Khoảng cách từ tâm $I$ đến đường thẳng $d$ là $d(I, d) = (|m + 2|) / 5$.]),
    True([Đường thẳng $d$ tiếp xúc với đường tròn $(C)$ khi và chỉ khi $m = 23$ hoặc $m = -27$.]),
    [Khi $m = 3$, đường thẳng $d$ tiếp xúc với đường tròn $(C)$.]
  ),
  loigiai: [
    #step([Tâm và bán kính])
    Tâm $I(2; 1)$, bán kính $R = 5$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách từ I đến d])
    $d(I, d) = (|3(2) - 4(1) + m|) / sqrt(3^2 + (-4)^2) = (|6 - 4 + m|) / 5 = (|m + 2|) / 5$. Mệnh đề b ĐÚNG.

    #step([Điều kiện tiếp xúc])
    $d(I, d) = R <=> (|m + 2|) / 5 = 5 <=> |m + 2| = 25 <=> cases(m + 2 = 25 => m = 23, m + 2 = -25 => m = -27)$. Mệnh đề c ĐÚNG.

    #step([Khi m = 3])
    Với $m = 3$: $d(I, d) = |3 + 2| / 5 = 1 < 5 = R$. Khi đó đường thẳng cắt đường tròn tại hai điểm phân biệt chứ không tiếp xúc.
    Khẳng định tiếp xúc khi $m = 3$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Cổng vòm parabol trung tâm triển lãm)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cổng chào của một trung tâm triển lãm có dạng một đường Parabol với chiều rộng chân cổng là $12 text(" m")$ và chiều cao tại đỉnh cổng là $9 text(" m")$.
Chọn hệ tọa độ $O x y$ sao cho gốc $O$ là trung điểm chân cổng trên mặt đất, đỉnh cổng nằm trên trục tung.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đỉnh cổng Parabol có tọa độ là $I(0; 9)$.]),
    True([Hai chân cổng trên mặt đất có tọa độ là $A(-6; 0)$ và $B(6; 0)$.]),
    True([Phương trình của đường viền Parabol là $y = - 1 / 4 x^2 + 9$.]),
    [Tại vị trí cách tâm chân cổng $4 text(" m")$, chiều cao của cổng vòm đạt $6 text(" m")$.]
  ),
  loigiai: [
    #step([Tọa độ các điểm đặc biệt])
    - Đỉnh $I(0; 9)$. Mệnh đề a ĐÚNG.
    - Hai chân cổng đối xứng: $x = plus.minus 12 / 2 = plus.minus 6 => A(-6; 0), B(6; 0)$. Mệnh đề b ĐÚNG.

    #step([Phương trình Parabol])
    Dạng $y = a x^2 + 9$. Đi qua $B(6; 0)$:
    $ 0 = a(6^2) + 9 <=> 36a = -9 <=> a = - 1 / 4 $
    Phương trình: $y = - 1 / 4 x^2 + 9$. Mệnh đề c ĐÚNG.

    #step([Chiều cao tại x = 4m])
    $y = - 1 / 4 (4^2) + 9 = - 4 + 9 = 5 text(" m")$ (chứ không phải $6 text(" m")$).
    Khẳng định chiều cao bằng $6 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Bộ ba đường conic)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho ba đường cong conic: $(E): x^2 / 25 + y^2 / 9 = 1$, $(H): x^2 / 16 - y^2 / 9 = 1$ và $(P): y^2 = 8x$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Parabol $(P)$ có tiêu điểm $F(2; 0)$ và đường chuẩn $x + 2 = 0$.]),
    True([Tâm sai của Elip $(E)$ là $e_E = 4 / 5 < 1$.]),
    True([Tâm sai của Hypebol $(H)$ là $e_H = 5 / 4 > 1$.]),
    [Elip $(E)$ và Hypebol $(H)$ có cùng tiêu cự.]
  ),
  loigiai: [
    #step([Parabol])
    $2p = 8 => p = 4$. Tiêu điểm $F(2; 0)$, đường chuẩn $x = -2 <=> x + 2 = 0$. Mệnh đề a ĐÚNG.

    #step([Tâm sai Elip])
    $c_E = sqrt(25 - 9) = 4, a_E = 5 => e_E = 4 / 5 < 1$. Mệnh đề b ĐÚNG.

    #step([Tâm sai Hypebol])
    $c_H = sqrt(16 + 9) = 5, a_H = 4 => e_H = 5 / 4 > 1$. Mệnh đề c ĐÚNG.

    #step([So sánh tiêu cự])
    Tiêu cự của Elip là $2c_E = 8$, trong khi tiêu cự của Hypebol là $2c_H = 10 != 8$.
    Khẳng định có cùng tiêu cự là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Diện tích tam giác)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có các đỉnh $A(1; 3)$, $B(-2; -1)$ và $C(4; -1)$. Diện tích của tam giác $A B C$ bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Tính cạnh đáy và chiều cao])
        Đáy $B C = |4 - (-2)| = 6$.
        Trung điểm đáy là $M(1; -1)$. Chiều cao $A M = |3 - (-1)| = 4$.
        
        #step([Tính diện tích])
        $ S = 1 / 2 B C cdot A M = 1 / 2 (6)(4) = 12 $
    ]
)

// TLN 2 (Chiều cao vòm tại x = 4m)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Trong bài toán cổng vòm Parabol rộng $12 text(" m")$ cao $9 text(" m")$, chiều cao của cổng tại vị trí cách tâm chân cổng $4 text(" m")$ bằng bao nhiêu mét?],
    [5],
    loigiai: [
        #step([Thay x = 4 vào phương trình])
        $ y = - 1 / 4 (4^2) + 9 = -4 + 9 = 5 text(" m") $
    ]
)

// TLN 3 (Tham số m tiếp xúc dương)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Tìm giá trị dương của tham số $m$ để đường thẳng $3x - 4y + m = 0$ tiếp xúc với đường tròn $(x - 2)^2 + (y - 1)^2 = 25$.],
    [23],
    loigiai: [
        #step([Thiết lập phương trình khoảng cách])
        $ (|m + 2|) / 5 = 5 <=> |m + 2| = 25 $
        Vì $m > 0$ nên $m + 2 = 25 <=> m = 23$.
    ]
)

// TLN 4 (Tiêu cự Hypebol)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho Hypebol $(H): x^2 / 16 - y^2 / 9 = 1$. Tiêu cự của Hypebol bằng bao nhiêu?],
    [10],
    loigiai: [
        #step([Tính c và 2c])
        $ c = sqrt(16 + 9) = 5 => 2c = 10 $
    ]
)

// TLN 5 (Tiêu cự Elip)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 16 + y^2 / 7 = 1$. Tiêu cự của Elip bằng bao nhiêu?],
    [6],
    loigiai: [
        #step([Tính c và 2c])
        $ c = sqrt(16 - 7) = 3 => 2c = 6 $
    ]
)

// TLN 6 (Khoảng cách từ tiêu điểm đến đường chuẩn Parabol)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 167], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 12x$. Khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta$ của Parabol bằng bao nhiêu?],
    [6],
    loigiai: [
        #step([Xác định tham số tiêu p])
        $ 2p = 12 => p = 6 $
        Khoảng cách giữa tiêu điểm và đường chuẩn chính bằng $p = 6$.
    ]
)

// ── CỘT MỐC HOÀN THÀNH ─────────────────────────────────────
#slide(title: none)[
  #align(center + horizon)[
    #block(
      fill: rgb("#1e1b4b"),
      inset: (x: 36pt, y: 24pt),
      radius: 16pt,
      stroke: 2pt + rgb("#6366f1")
    )[
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP TỔNG HỢP CHƯƠNG VII (ĐỀ SỐ 25A - MÃ ĐỀ 167)!]      #v(0.6em)
      #text(fill: white, size: 14pt)[
        Bạn đã hoàn thành xuất sắc toàn bộ 22 câu hỏi của đề thi!        Chúc các em tự tin đạt điểm số tối đa trong kỳ thi chính thức!
      ]
      #v(1em)
      #box(fill: rgb("#4f46e5"), inset: (x: 18pt, y: 8pt), radius: 20pt)[
        #text(weight: "bold", fill: white, size: 12pt)[GV Nguyễn Văn Sang — THPT Nguyễn Hữu Cảnh]
      ]
      #v(0.8em)
      #link("lec-toc-main")[
        #block(
          fill: rgb("#16a34a"),
          inset: (x: 16pt, y: 8pt),
          radius: 6pt
        )[
          #text(fill: white, weight: "bold", size: 11pt)[🗺️ QUAY LẠI MỤC LỤC CHÍNH]
        ]
      ]
    ]
  ]
]
