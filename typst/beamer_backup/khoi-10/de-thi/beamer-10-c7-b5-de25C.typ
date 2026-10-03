// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VII (ĐỀ SỐ 25C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 169  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CHƯƠNG VII (ĐỀ SỐ 25C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 169",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 169]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, cho hai điểm $A(1; 2)$ và $B(3; 4)$. Điểm $M$ thuộc trục hoành $O x$ sao cho tổng khoảng cách $M A + M B$ đạt giá trị nhỏ nhất có hoành độ bằng],
    (
        True([$5 / 3$]),
        [$2$],
        [$3 / 2$],
        [$7 / 4$]
    ),
    loigiai: [
        Vì $y_A = 2 > 0$ và $y_B = 4 > 0$ nên $A, B$ cùng phía so với trục $O x$.
        Lấy điểm đối xứng của $A$ qua $O x$ là $A'(1; -2)$.
        Khi đó $M A + M B = M A' + M B >= A' B$.
        Dấu bằng xảy ra khi $M = A' B cap O x$.
        $vec(A' B) = (2; 6) = 2(1; 3) =>$ VTPT $vec(n) = (3; -1)$.
        Phương trình $A' B: 3(x - 3) - (y - 4) = 0 <=> 3x - y - 5 = 0$.
        Giao điểm với trục hoành ($y = 0$): $3x - 5 = 0 <=> x = 5 / 3$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 9$ và điểm $A(4; 6)$. Từ $A$ kẻ hai tiếp tuyến $A M, A N$ đến $(C)$ (với $M, N$ là các tiếp điểm). Độ dài đoạn thẳng $M N$ bằng],
    (
        True([$4.8$]),
        [$2.4$],
        [$5$],
        [$3.6$]
    ),
    loigiai: [
        Tâm $I(1; 2)$, bán kính $R = 3$.
        Khoảng cách $d = I A = sqrt((4 - 1)^2 + (6 - 2)^2) = 5$.
        Độ dài đoạn tiếp tuyến: $L = sqrt(d^2 - R^2) = sqrt(5^2 - 3^2) = 4$.
        Độ dài dây cung tiếp xúc $M N$:
        $ M N = (2 R L) / d = (2 times 3 times 4) / 5 = 24 / 5 = 4.8 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$ có hai tiêu điểm $F_1, F_2$. Giá trị lớn nhất của tích khoảng cách $M F_1 cdot M F_2$ khi $M$ di động trên $(E)$ bằng],
    (
        True([$25$]),
        [$16$],
        [$9$],
        [$34$]
    ),
    loigiai: [
        Ta có $a = 5, b = 3 => c = 4$, tâm sai $e = c / a = 4 / 5$.
        Theo công thức bán kính qua tiêu:
        $ M F_1 = a + e x_M; quad M F_2 = a - e x_M $
        $ M F_1 cdot M F_2 = a^2 - e^2 x_M^2 $
        Vì $x_M^2 >= 0$ nên tích đạt giá trị lớn nhất khi $x_M = 0$:
        $ (M F_1 cdot M F_2)_text("max") = a^2 = 25 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Giá trị nhỏ nhất của tích khoảng cách $M F_1 cdot M F_2$ khi điểm $M$ di động trên Elip $(E): x^2 / 25 + y^2 / 9 = 1$ bằng],
    (
        True([$9$]),
        [$16$],
        [$25$],
        [$4$]
    ),
    loigiai: [
        Biểu thức $M F_1 cdot M F_2 = a^2 - e^2 x_M^2$.
        Vì $|x_M| <= a$ nên tích đạt giá trị nhỏ nhất khi $x_M = plus.minus a$:
        $ (M F_1 cdot M F_2)_text("min") = a^2 - e^2 a^2 = a^2 - c^2 = b^2 = 9 $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 4x$. Khoảng cách ngắn nhất từ một điểm trên $(P)$ đến đường thẳng $d: 2x - y + 3 = 0$ bằng],
    (
        True([$sqrt(5) / 2$]),
        [$sqrt(5)$],
        [$(3 sqrt(5)) / 5$],
        [$2 sqrt(5)$]
    ),
    loigiai: [
        Tiếp tuyến của $(P)$ song song với $d$ có dạng $Delta: 2x - y + c = 0 <=> y = 2x + c$.
        Phương trình hoành độ tiếp xúc:
        $ (2x + c)^2 = 4x <=> 4x^2 + 4(c - 1)x + c^2 = 0 $
        Tiếp xúc khi $Delta' = 4(1 - 2c) = 0 <=> c = 1 / 2$.
        Khoảng cách ngắn nhất bằng khoảng cách giữa hai đường song song:
        $ d(Delta, d) = (|3 - 1 / 2|) / sqrt(2^2 + (-1)^2) = (5 / 2) / sqrt(5) = sqrt(5) / 2 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho tam giác $A B C$ có ba đỉnh $A(1; 4)$, $B(3; 0)$ và $C(5; 4)$. Bán kính đường tròn ngoại tiếp tam giác $A B C$ bằng],
    (
        True([$2.5$]),
        [$2$],
        [$3$],
        [$sqrt(5)$]
    ),
    loigiai: [
        Nhận xét: $A$ và $C$ có cùng tung độ $y = 4$, trung điểm của $A C$ là $H(3; 4)$.
        Vì $B(3; 0)$ có cùng hoành độ với $H$ nên đường thẳng $x = 3$ chính là đường trung trực của $A C$ và là trục đối xứng của tam giác cân $A B C$.
        Tâm $I$ của đường tròn ngoại tiếp nằm trên $x = 3$, tọa độ $I(3; y_0)$.
        $ I A^2 = I B^2 <=> (3 - 1)^2 + (y_0 - 4)^2 = (3 - 3)^2 + y_0^2 $
        $ <=> 4 + y_0^2 - 8y_0 + 16 = y_0^2 <=> 8y_0 = 20 <=> y_0 = 2.5 $
        Bán kính: $R = I B = |y_0 - 0| = 2.5$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Có bao nhiêu điểm có tọa độ nguyên $(x; y)$ nằm trên đường tròn $x^2 + y^2 = 25$?],
    (
        True([$12$]),
        [$8$],
        [$4$],
        [$16$]
    ),
    loigiai: [
        Phương trình $x^2 + y^2 = 25$ với $x, y in ZZ$.
        Các phân tích $25 = 0^2 + 5^2 = 3^2 + 4^2$.
        - Các cặp $(0; plus.minus 5)$ và $(plus.minus 5; 0)$: gồm 4 điểm.
        - Các cặp $(plus.minus 3; plus.minus 4)$: gồm $2 times 2 = 4$ điểm.
        - Các cặp $(plus.minus 4; plus.minus 3)$: gồm $2 times 2 = 4$ điểm.
        Tổng cộng có $4 + 4 + 4 = 12$ điểm nguyên.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Góc tạo bởi đường thẳng $d: x - sqrt(3)y + 2 = 0$ và trục hoành $O x$ bằng],
    (
        True([$30^circ$]),
        [$60^circ$],
        [$45^circ$],
        [$120^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến của $d$ là $vec(n_1) = (1; -sqrt(3))$.
        Vectơ pháp tuyến của trục hoành $O x$ ($y = 0$) là $vec(n_2) = (0; 1)$.
        $ cos(d, O x) = (|vec(n_1) cdot vec(n_2)|) / (|vec(n_1)| |vec(n_2)|) = (|-sqrt(3)|) / (sqrt(1 + 3) cdot 1) = sqrt(3) / 2 $
        Suy ra góc giữa đường thẳng và trục hoành bằng $30^circ$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Parabol $(P): y^2 = 8x$. Tập hợp trung điểm của các dây cung vuông góc với trục đối xứng $O x$ là],
    (
        True([Tia gốc $O$ của trục hoành $O x$ (loại gốc $O$)]),
        [Toàn bộ trục hoành $O x$],
        [Trục tung $O y$],
        [Đường thẳng $x = 2$]
    ),
    loigiai: [
        Dây cung vuông góc với $O x$ có phương trình $x = x_0$ ($x_0 > 0$).
        Giao điểm với Parabol là $A(x_0; sqrt(8x_0))$ và $B(x_0; -sqrt(8x_0))$.
        Trung điểm là $M(x_0; 0)$ với $x_0 > 0$.
        Vậy tập hợp là tia dương của trục hoành $O x$ loại gốc $O$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Hai thị trấn nằm tại $A(1; 2)$ và $B(7; 10)$ (đơn vị: kilômét). Cần đặt một trạm tiếp nhiên liệu $M(x_0; 0)$ trên đường cao tốc $O x$ sao cho tổng quãng đường $M A + M B$ ngắn nhất. Hoành độ $x_0$ bằng],
    (
        True([$2$]),
        [$3$],
        [$4$],
        [$2.5$]
    ),
    loigiai: [
        Điểm đối xứng của $A$ qua $O x$ là $A'(1; -2)$.
        Đường thẳng $A' B$ đi qua $A'(1; -2)$ và $B(7; 10)$:
        $vec(A' B) = (6; 12) = 6(1; 2) =>$ VTPT $vec(n) = (2; -1)$.
        Phương trình: $2(x - 1) - (y + 2) = 0 <=> 2x - y - 4 = 0$.
        Giao điểm với $O x$ ($y = 0$): $2x_0 - 4 = 0 <=> x_0 = 2$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Trần nhà của một căn phòng thì thầm (Whispering Gallery) có dạng nửa hình Elip với trục lớn dài $50 text(" m")$ ($2a = 50$) và tiêu cự dài $40 text(" m")$ ($2c = 40$).
Chiều cao lớn nhất của trần nhà tại vị trí tâm phòng bằng],
    (
        True([$15 text(" m")$]),
        [$20 text(" m")$],
        [$25 text(" m")$],
        [$10 text(" m")$]
    ),
    loigiai: [
        Bán trục lớn: $a = 50 / 2 = 25 text(" m")$.
        Nửa tiêu cự: $c = 40 / 2 = 20 text(" m")$.
        Chiều cao lớn nhất tại tâm chính là bán trục nhỏ $b$:
        $ b = sqrt(a^2 - c^2) = sqrt(25^2 - 20^2) = sqrt(625 - 400) = sqrt(225) = 15 text(" m") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: y = x + m$ cắt Hypebol $(H): x^2 / 9 - y^2 / 16 = 1$ tại hai điểm phân biệt thuộc hai nhánh khác nhau.],
    (
        True([Với mọi $m in RR$]),
        [$m > 0$],
        [Không tồn tại $m$],
        [$-4 < m < 4$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm:
        $ 16x^2 - 9(x + m)^2 = 144 <=> 7x^2 - 18m x - (9m^2 + 144) = 0 $
        Tích hai nghiệm:
        $ x_1 x_2 = - (9m^2 + 144) / 7 < 0 quad forall m in RR $
        Vì tích hai hoành độ luôn âm nên hai giao điểm luôn nằm về hai phía trục tung (thuộc hai nhánh khác nhau) với mọi giá trị của $m$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Tiếp tuyến và dây cung tiếp xúc từ điểm ngoài đường tròn có CeTZ)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho đường tròn $(C): (x - 1)^2 + (y - 2)^2 = 9$ và điểm $A(4; 6)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-2, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 7), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 6.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đường tròn tâm I(1; 2), R = 3
  circle((1, 2), radius: 2, stroke: 1.2pt + rgb("d97706"))
  circle((1, 2), radius: 2pt, fill: rgb("d97706"))
  content((1, 1.6), [$I(1; 2)$])
  
  // Điểm A(4; 6)
  circle((4, 5.5), radius: 2pt, fill: blue)
  content((4.4, 5.5), [$A$])
  
  // Tiếp tuyến AM, AN
  line((4, 5.5), (2.8, 2.7), stroke: 1pt + red)
  line((4, 5.5), (1.3, 3.9), stroke: 1pt + red)
  line((1, 2), (4, 5.5), stroke: (dash: "dashed", paint: gray))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách từ tâm $I(1; 2)$ đến điểm $A(4; 6)$ bằng $I A = 5$.]),
    True([Độ dài các đoạn tiếp tuyến kẻ từ $A$ đến $(C)$ bằng $4$.]),
    True([Độ dài đoạn thẳng $M N$ nối hai tiếp điểm bằng $4.8$.]),
    [Diện tích tứ giác $A M I N$ bằng $24$.]
  ),
  loigiai: [
    #step([Khoảng cách IA])
    $I A = sqrt((4 - 1)^2 + (6 - 2)^2) = 5$. Mệnh đề a ĐÚNG.

    #step([Độ dài tiếp tuyến])
    $A M = sqrt(I A^2 - R^2) = sqrt(5^2 - 3^2) = 4$. Mệnh đề b ĐÚNG.

    #step([Độ dài dây cung tiếp xúc MN])
    $M N = (2 R cdot A M) / (I A) = (2 times 3 times 4) / 5 = 4.8$. Mệnh đề c ĐÚNG.

    #step([Diện tích tứ giác AMIN])
    $S_A M I N = 2 S_Delta A M I = 2 (1 / 2 times 3 times 4) = 12$ (chứ không phải $24$).
    Khẳng định diện tích bằng $24$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Vị trí đặt trạm cao tốc tối ưu)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Hai đô thị vệ tinh nằm tại tọa độ $A(1; 2)$ và $B(7; 10)$ (đơn vị: kilômét). Tuyến cao tốc chạy dọc trục hoành $O x$.
Cần chọn vị trí đặt trạm tiếp nhiên liệu $M(x_0; 0)$ trên cao tốc để tổng quãng đường $M A + M B$ ngắn nhất.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điểm đối xứng của $A$ qua trục cao tốc $O x$ là $A'(1; -2)$.]),
    True([Phương trình đường thẳng $A' B$ là $2x - y - 4 = 0$.]),
    True([Vị trí đặt trạm tiếp nhiên liệu tối ưu có tọa độ là $M(2; 0)$.]),
    [Tổng khoảng cách ngắn nhất $M A + M B$ bằng $12 text(" km")$.]
  ),
  loigiai: [
    #step([Điểm đối xứng])
    Đối xứng qua $O x$: $A'(1; -2)$. Mệnh đề a ĐÚNG.

    #step([Phương trình A'B])
    $vec(A' B) = (6; 12) = 6(1; 2) => 2(x - 1) - (y + 2) = 0 <=> 2x - y - 4 = 0$. Mệnh đề b ĐÚNG.

    #step([Tọa độ trạm M])
    Thay $y = 0 => 2x_0 - 4 = 0 <=> x_0 = 2 => M(2; 0)$. Mệnh đề c ĐÚNG.

    #step([Tổng khoảng cách nhỏ nhất])
    $(M A + M B)_text("min") = A' B = sqrt((7 - 1)^2 + (10 - (-2))^2) = sqrt(6^2 + 12^2) = sqrt(180) = 6 sqrt(5) approx 13.42 text(" km")$ (chứ không phải $12 text(" km")$).
    Khẳng định khoảng cách ngắn nhất bằng $12 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Trần phòng thì thầm Whispering Gallery)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Một phòng trưng bày nghệ thuật có trần nhà là nửa mặt tròn xoay của Elip $(E): x^2 / 625 + y^2 / 225 = 1$ với $y >= 0$ (đơn vị: mét).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chiều rộng của phòng trưng bày bằng $2a = 50 text(" m")$.]),
    True([Chiều cao trần nhà tại vị trí trung tâm phòng bằng $15 text(" m")$.]),
    True([Khoảng cách giữa hai vị trí đứng thì thầm (hai tiêu điểm $F_1, F_2$) bằng $40 text(" m")$.]),
    [Một sóng âm phát ra từ vị trí $F_1$ truyền lên trần nhà tại điểm $M$ bất kỳ rồi dội xuống vị trí $F_2$ có tổng quãng đường di chuyển bằng $40 text(" m")$.]
  ),
  loigiai: [
    #step([Chiều rộng và chiều cao phòng])
    $a^2 = 625 => a = 25$, chiều rộng sàn phòng $2a = 50 text(" m")$. Mệnh đề a ĐÚNG.
    $b^2 = 225 => b = 15$, chiều cao tại đỉnh $b = 15 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách hai tiêu điểm])
    $c = sqrt(25^2 - 15^2) = 20 => F_1 F_2 = 2c = 40 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Tổng quãng đường sóng âm])
    Theo định nghĩa Elip, tổng quãng đường truyền âm là:
    $ M F_1 + M F_2 = 2a = 50 text(" m") $ (chứ không phải $40 text(" m")$).
    Khẳng định tổng quãng đường bằng $40 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và tiếp xúc Conic)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 16 + y^2 / 9 = 1$ và đường thẳng $d_m: 3x + 4y + m = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình chính tắc của $(E)$ có các bán trục $a = 4$ và $b = 3$.]),
    True([Đường thẳng $d_m$ tiếp xúc với $(E)$ khi và chỉ khi $m^2 = 288$.]),
    True([Có đúng hai giá trị của tham số $m$ để đường thẳng tiếp xúc với Elip.]),
    [Khi $m = 12$, đường thẳng $d_m$ tiếp xúc với Elip $(E)$.]
  ),
  loigiai: [
    #step([Bán trục])
    $a = 4, b = 3$. Mệnh đề a ĐÚNG.

    #step([Điều kiện tiếp xúc])
    $A^2 a^2 + B^2 b^2 = C^2 <=> 3^2(16) + 4^2(9) = m^2 <=> 144 + 144 = m^2 <=> m^2 = 288$. Mệnh đề b ĐÚNG.

    #step([Số giá trị m])
    $m = plus.minus 12 sqrt(2)$, có đúng hai giá trị của $m$. Mệnh đề c ĐÚNG.

    #step([Khi m = 12])
    Khi $m = 12 => m^2 = 144 != 288$. Đường thẳng không tiếp xúc với Elip.
    Khẳng định tiếp xúc khi $m = 12$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Diện tích tứ giác AMIN)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho đường tròn $(x - 1)^2 + (y - 2)^2 = 9$ và điểm $A(4; 6)$. Diện tích tứ giác tạo bởi tâm $I$, điểm $A$ và hai tiếp điểm kẻ từ $A$ bằng bao nhiêu?],
    [12],
    loigiai: [
        #step([Tính diện tích tứ giác])
        $ S = 2 S_Delta A M I = 2 (1 / 2 times 3 times 4) = 12 $
    ]
)

// TLN 2 (Hoành độ trạm dịch vụ tối ưu)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Trong bài toán trạm dịch vụ cao tốc, hoành độ $x_0$ của vị trí đặt trạm tối ưu $M(x_0; 0)$ bằng bao nhiêu?],
    [2],
    loigiai: [
        #step([Giải phương trình giao điểm])
        Giao điểm của $A' B$ với $O x$ có $y = 0$:
        $ 2x_0 - 4 = 0 <=> x_0 = 2 $
    ]
)

// TLN 3 (Chiều cao trần nhà thì thầm)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Trong bài toán trần nhà thì thầm bán elip $2a = 50 text(" m")$ và $2c = 40 text(" m")$, chiều cao lớn nhất của trần phòng tại tâm bằng bao nhiêu mét?],
    [15],
    loigiai: [
        #step([Tính bán trục nhỏ b])
        $ b = sqrt(25^2 - 20^2) = 15 text(" m") $
    ]
)

// TLN 4 (Giá trị lớn nhất tích bán kính qua tiêu)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Giá trị lớn nhất của tích khoảng cách từ điểm $M in (E)$ đến hai tiêu điểm $M F_1 cdot M F_2$ bằng bao nhiêu?],
    [25],
    loigiai: [
        #step([Tìm cực đại])
        $ (M F_1 cdot M F_2)_text("max") = a^2 = 25 $
    ]
)

// TLN 5 (Giá trị nhỏ nhất tích bán kính qua tiêu)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Cho Elip $(E): x^2 / 25 + y^2 / 9 = 1$. Giá trị nhỏ nhất của tích khoảng cách từ điểm $M in (E)$ đến hai tiêu điểm $M F_1 cdot M F_2$ bằng bao nhiêu?],
    [9],
    loigiai: [
        #step([Tìm cực tiểu])
        $ (M F_1 cdot M F_2)_text("min") = b^2 = 9 $
    ]
)

// TLN 6 (Số điểm nguyên trên đường tròn)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 169], back-to: "sec-exercise-hub",[Có bao nhiêu điểm có tọa độ nguyên $(x; y)$ nằm trên đường tròn $x^2 + y^2 = 25$?],
    [12],
    loigiai: [
        #step([Liệt kê số nghiệm nguyên])
        Gồm 4 điểm trục $(plus.minus 5; 0), (0; plus.minus 5)$ và 8 điểm $(plus.minus 3; plus.minus 4), (plus.minus 4; plus.minus 3)$.
        Tổng cộng là 12 điểm.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VII (ĐỀ SỐ 25C - NÂNG CAO & VDC)!]      #v(0.6em)
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
