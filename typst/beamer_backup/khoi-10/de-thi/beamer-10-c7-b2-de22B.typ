// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 20: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG. GÓC VÀ KHOẢNG CÁCH (ĐỀ SỐ 22B - VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 159  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 20: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG. GÓC VÀ KHOẢNG CÁCH (ĐỀ SỐ 22B - VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG — MÃ ĐỀ: 159",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 159]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Cho hai đường thẳng $d_1: 2x + y - 1 = 0$ và $d_2: x - 2y + 3 = 0$. Khẳng định nào sau đây là đúng?],
    (
        True([$d_1$ vuông góc với $d_2$]),
        [$d_1$ song song với $d_2$],
        [$d_1$ trùng với $d_2$],
        [$d_1$ cắt $d_2$ một góc $45^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (2; 1)$ và $vec(n_2) = (1; -2)$.
        Tích vô hướng:
        $ vec(n_1) cdot vec(n_2) = 2(1) + 1(-2) = 0 $
        Do đó $d_1 perp d_2$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Khoảng cách từ điểm $M(3; -1)$ đến đường thẳng $Delta: 4x - 3y + 5 = 0$ bằng],
    (
        True([$4$]),
        [$20$],
        [$5$],
        [$2$]
    ),
    loigiai: [
        Áp dụng công thức khoảng cách từ điểm đến đường thẳng:
        $ d(M, Delta) = (|4(3) - 3(-1) + 5|) / sqrt(4^2 + (-3)^2) = (|12 + 3 + 5|) / 5 = 20 / 5 = 4 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Khoảng cách giữa hai đường thẳng song song $d_1: 3x - 4y + 2 = 0$ và $d_2: 3x - 4y + 12 = 0$ bằng],
    (
        True([$2$]),
        [$10$],
        [$2.5$],
        [$14 / 5$]
    ),
    loigiai: [
        $ d(d_1, d_2) = (|2 - 12|) / sqrt(3^2 + (-4)^2) = 10 / 5 = 2 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Cosin của góc giữa hai đường thẳng $d_1: 3x + y - 2 = 0$ và $d_2: 2x - y + 5 = 0$ bằng],
    (
        True([$sqrt(2) / 2$]),
        [$1 / 2$],
        [$sqrt(3) / 2$],
        [$0$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (3; 1)$, $vec(n_2) = (2; -1)$.
        $ cos phi = (|3(2) + 1(-1)|) / (sqrt(3^2 + 1^2) sqrt(2^2 + (-1)^2)) = 5 / (sqrt(10) sqrt(5)) = 5 / sqrt(50) = 5 / (5 sqrt(2)) = sqrt(2) / 2 $
        (Góc giữa hai đường thẳng bằng $45^circ$).
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Góc tạo bởi đường thẳng $d: x + y - 5 = 0$ và trục hoành $O x$ bằng],
    (
        True([$45^circ$]),
        [$30^circ$],
        [$60^circ$],
        [$90^circ$]
    ),
    loigiai: [
        Đường thẳng $d$ có VTPT $vec(n) = (1; 1)$.
        Trục hoành $O x$ có phương trình $y = 0$ với VTPT $vec(j) = (0; 1)$.
        $ cos phi = (|1(0) + 1(1)|) / (sqrt(1^2 + 1^2) sqrt(0^2 + 1^2)) = 1 / (sqrt(2) cdot 1) = sqrt(2) / 2 => phi = 45^circ $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để hai đường thẳng $d_1: m x + 2y - 1 = 0$ và $d_2: 2x - 4y + 3 = 0$ vuông góc với nhau.],
    (
        True([$m = 4$]),
        [$m = -4$],
        [$m = 2$],
        [$m = -2$]
    ),
    loigiai: [
        Hai đường thẳng vuông góc khi và chỉ khi tích vô hướng hai VTPT bằng $0$:
        $ m(2) + 2(-4) = 0 <=> 2m - 8 = 0 <=> m = 4 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Điểm $A(1; 2)$ cách đường thẳng $Delta: 3x + 4y + c = 0$ một khoảng bằng $3$. Giá trị dương của tham số $c$ bằng],
    (
        True([$c = 4$]),
        [$c = 26$],
        [$c = 15$],
        [$c = 5$]
    ),
    loigiai: [
        Khoảng cách:
        $ d(A, Delta) = (|3(1) + 4(2) + c|) / sqrt(3^2 + 4^2) = (|11 + c|) / 5 = 3 $
        $ <=> |11 + c| = 15 <=> cases(11 + c = 15 <=> c = 4, 11 + c = -15 <=> c = -26) $
        Vì $c > 0$ nên chọn $c = 4$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Một đường thẳng $d'$ song song với đường thẳng $d: 3x - 4y + 1 = 0$ và cách điểm $M(1; 2)$ một khoảng bằng $2$ có phương trình là],
    (
        True([$3x - 4y + 15 = 0$]),
        [$3x - 4y - 15 = 0$],
        [$4x + 3y + 5 = 0$],
        [$3x - 4y + 10 = 0$]
    ),
    loigiai: [
        Đường thẳng $d'$ song song với $d$ có dạng: $3x - 4y + c = 0$ ($c != 1$).
        $ d(M, d') = (|3(1) - 4(2) + c|) / 5 = 2 <=> |c - 5| = 10 <=> cases(c - 5 = 10 => c = 15, c - 5 = -10 => c = -5) $
        Phương trình là $3x - 4y + 15 = 0$ hoặc $3x - 4y - 5 = 0$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Trong tam giác $A B C$, hai đường cao kẻ từ $B$ và $C$ lần lượt nằm trên các đường thẳng $d_1: x - y + 1 = 0$ và $d_2: 2x + y - 4 = 0$. Tọa độ trực tâm $H$ của tam giác $A B C$ là],
    (
        True([$H(1; 2)$]),
        [$H(2; 3)$],
        [$H(0; 1)$],
        [$H(3; -2)$]
    ),
    loigiai: [
        Trực tâm $H$ là giao điểm của hai đường cao $d_1$ và $d_2$:
        $ cases(x - y = -1, 2x + y = 4) <=> cases(3x = 3 => x = 1, y = 1 + 1 = 2) => H(1; 2) $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Góc tạo bởi hai đường thẳng $d_1: x - y = 0$ và $d_2: x + y - 2 = 0$ bằng],
    (
        True([$90^circ$]),
        [$45^circ$],
        [$60^circ$],
        [$30^circ$]
    ),
    loigiai: [
        Vectơ pháp tuyến: $vec(n_1) = (1; -1)$, $vec(n_2) = (1; 1)$.
        $vec(n_1) cdot vec(n_2) = 1(1) + (-1)(1) = 0$.
        Hai đường thẳng vuông góc nên góc bằng $90^circ$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Một đường ray xe lửa chạy thẳng được mô phỏng bởi đường thẳng $Delta: 3x + 4y - 12 = 0$ (đơn vị: kilômét).
Một trạm biến áp năng lượng mặt trời đặt tại điểm $S(6; 6)$.
Khoảng cách ngắn nhất để thi công đường cáp điện ngầm từ trạm $S$ nối tới đường ray xe lửa là],
    (
        True([$6 text(" km")$]),
        [$30 text(" km")$],
        [$5 text(" km")$],
        [$4.8 text(" km")$]
    ),
    loigiai: [
        Khoảng cách ngắn nhất là khoảng cách vuông góc từ $S$ đến $Delta$:
        $ d(S, Delta) = (|3(6) + 4(6) - 12|) / sqrt(3^2 + 4^2) = (|18 + 24 - 12|) / 5 = 30 / 5 = 6 text(" km") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Trên hải đồ vùng biển ven bờ, luồng hàng hải cho tàu tải trọng lớn ra vào cảng được quy hoạch theo đường thẳng $d: 12x - 5y + 39 = 0$.
Một phao quan trắc hải văn đặt tại gốc tọa độ $O(0; 0)$ (đơn vị tọa độ là hải lý).
Khoảng cách từ phao quan trắc đến tim luồng hàng hải bằng],
    (
        True([$3 text(" hải lý")$]),
        [$13 text(" hải lý")$],
        [$39 text(" hải lý")$],
        [$2.5 text(" hải lý")$]
    ),
    loigiai: [
        $ d(O, d) = (|12(0) - 5(0) + 39|) / sqrt(12^2 + (-5)^2) = 39 / sqrt(144 + 25) = 39 / 13 = 3 text(" hải lý") $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Hai đường song song có CeTZ)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Cho hai đường thẳng song song $Delta_1: 3x + 4y - 7 = 0$ và $Delta_2: 3x + 4y + 13 = 0$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (4, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -4), (0, 4), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.8, -0.3), [$x$])
  content((-0.3, 3.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Delta 1: 3x + 4y - 7 = 0 -> y = -3/4 x + 7/4
  line((-3, 4), (4, -1.25), stroke: 1.2pt + rgb("0d9488"))
  content((3.5, -0.5), [$Delta_1$])
  
  // Delta 2: 3x + 4y + 13 = 0 -> y = -3/4 x - 13/4
  line((-3, -1), (2, -4.75), stroke: 1.2pt + rgb("0d9488"))
  content((2.2, -4.2), [$Delta_2$])
  
  // Điểm M(1; 1) trên Delta 1
  circle((1, 1), radius: 2pt, fill: red)
  content((1.6, 1.2), [$M(1; 1)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai đường thẳng $Delta_1$ và $Delta_2$ có cùng vectơ pháp tuyến là $vec(n) = (3; 4)$.]),
    True([Hai đường thẳng $Delta_1$ và $Delta_2$ song song với nhau.]),
    True([Khoảng cách giữa hai đường thẳng song song $Delta_1$ và $Delta_2$ bằng $4$.]),
    [Điểm $M(1; 1)$ nằm cách đều hai đường thẳng $Delta_1$ và $Delta_2$.]
  ),
  loigiai: [
    #step([Vectơ pháp tuyến])
    Cả hai đường thẳng đều có hệ số $x, y$ là $3$ và $4$, do đó nhận $vec(n) = (3; 4)$ làm VTPT chung. Mệnh đề a ĐÚNG.

    #step([Vị trí tương đối])
    $3/3 = 4/4 != (-7)/13$, suy ra hai đường thẳng song song. Mệnh đề b ĐÚNG.

    #step([Khoảng cách giữa hai đường song song])
    $d(Delta_1, Delta_2) = (|(-7) - 13|) / sqrt(3^2 + 4^2) = |-20| / 5 = 4$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra điểm M(1; 1)])
    Thay $M(1; 1)$ vào phương trình $Delta_1$:
    $ 3(1) + 4(1) - 7 = 0 $
    Điểm $M(1; 1)$ nằm trực tiếp trên đường thẳng $Delta_1$ (khoảng cách bằng $0$), chứ không phải nằm cách đều hai đường thẳng.
    Khẳng định $M$ cách đều hai đường thẳng là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình đường phân giác)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Cho hai đường thẳng cắt nhau $d_1: 3x - 4y + 1 = 0$ và $d_2: 4x + 3y - 2 = 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai đường thẳng $d_1$ và $d_2$ vuông góc với nhau.]),
    True([Điểm $M(x; y)$ cách đều hai đường thẳng $d_1$ và $d_2$ khi và chỉ khi $d(M, d_1) = d(M, d_2)$.]),
    True([Một trong hai đường phân giác của các góc tạo bởi $d_1$ và $d_2$ có phương trình là $7x - y - 1 = 0$.]),
    [Hai đường phân giác của các góc tạo bởi $d_1$ và $d_2$ song song với nhau.]
  ),
  loigiai: [
    #step([Tính vuông góc])
    $vec(n_1) = (3; -4)$, $vec(n_2) = (4; 3)$.
    $vec(n_1) cdot vec(n_2) = 3(4) + (-4)(3) = 12 - 12 = 0$. Mệnh đề a ĐÚNG.

    #step([Tính chất đường phân giác])
    Tập hợp các điểm cách đều hai đường thẳng cắt nhau chính là hai đường phân giác của các góc tạo bởi hai đường thẳng đó: $d(M, d_1) = d(M, d_2)$. Mệnh đề b ĐÚNG.

    #step([Lập phương trình đường phân giác])
    $ (|3x - 4y + 1|) / sqrt(3^2 + (-4)^2) = (|4x + 3y - 2|) / sqrt(4^2 + 3^2) <=> |3x - 4y + 1| = |4x + 3y - 2| $
    - Trường hợp 1: $3x - 4y + 1 = 4x + 3y - 2 <=> -x - 7y + 3 = 0 <=> x + 7y - 3 = 0$.
    - Trường hợp 2: $3x - 4y + 1 = -(4x + 3y - 2) <=> 7x - y - 1 = 0$.
    Phương trình $7x - y - 1 = 0$ là một đường phân giác. Mệnh đề c ĐÚNG.

    #step([Mối quan hệ giữa hai đường phân giác])
    Hai đường phân giác của hai góc kề bù luôn vuông góc với nhau (chứ không bao giờ song song).
    Khẳng định hai đường phân giác song song là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Hệ thống điều hướng tránh đá ngầm)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Một dải đá ngầm ven biển trải dài trên đường thẳng $d: 5x - 12y + 26 = 0$ (đơn vị: hải lý).
Một tàu chở dầu đang ở vị trí $A(4; 5)$ và một tàu tuần tra biên phòng đang ở vị trí $B(2; -3)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tàu tuần tra $B(2; -3)$ ở xa dải đá ngầm hơn tàu chở dầu $A(4; 5)$.]),
    True([Khoảng cách từ tàu chở dầu $A(4; 5)$ đến dải đá ngầm bằng $14 / 13$ hải lý (khoảng $1.08$ hải lý).]),
    True([Khoảng cách từ tàu tuần tra $B(2; -3)$ đến dải đá ngầm bằng $72 / 13$ hải lý (khoảng $5.54$ hải lý).]),
    [Hai con tàu $A$ và $B$ nằm cùng một phía so với dải đá ngầm.]
  ),
  loigiai: [
    #step([Khoảng cách từ tàu A])
    $d(A, d) = (|5(4) - 12(5) + 26|) / sqrt(5^2 + (-12)^2) = (|20 - 60 + 26|) / 13 = |-14| / 13 = 14 / 13$ hải lý. Mệnh đề b ĐÚNG.

    #step([Khoảng cách từ tàu B])
    $d(B, d) = (|5(2) - 12(-3) + 26|) / 13 = (|10 + 36 + 26|) / 13 = 72 / 13$ hải lý. Mệnh đề c ĐÚNG.

    #step([So sánh khoảng cách])
    $72 / 13 > 14 / 13$, do đó tàu tuần tra $B$ ở xa dải đá ngầm hơn tàu chở dầu $A$. Mệnh đề a ĐÚNG.

    #step([Xét vị trí cùng phía hay khác phía])
    Xét giá trị biểu thức $f(x, y) = 5x - 12y + 26$:
    - $f(A) = 5(4) - 12(5) + 26 = -14 < 0$.
    - $f(B) = 5(2) - 12(-3) + 26 = 72 > 0$.
    Vì $f(A)$ và $f(B)$ trái dấu nên hai con tàu nằm về HAI PHÍA KHÁC NHAU đối với dải đá ngầm.
    Khẳng định nằm cùng một phía là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m và điều kiện khoảng cách)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Trong mặt phẳng $O x y$, cho điểm $A(1; 2)$ và đường thẳng $d_m: 3x - 4y + m = 0$ (với $m$ là tham số).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ pháp tuyến của đường thẳng $d_m$ là $vec(n) = (3; -4)$.]),
    True([Khoảng cách từ điểm $A$ đến đường thẳng $d_m$ được tính bởi công thức $d(A, d_m) = |m - 5| / 5$.]),
    True([Có đúng hai giá trị của tham số $m$ để khoảng cách từ điểm $A$ đến đường thẳng $d_m$ bằng $2$.]),
    [Tổng của hai giá trị tham số $m$ để khoảng cách $d(A, d_m) = 2$ bằng $0$.]
  ),
  loigiai: [
    #step([Vectơ pháp tuyến])
    $vec(n) = (3; -4)$. Mệnh đề a ĐÚNG.

    #step([Công thức khoảng cách])
    $d(A, d_m) = (|3(1) - 4(2) + m|) / sqrt(3^2 + (-4)^2) = (|3 - 8 + m|) / 5 = |m - 5| / 5$. Mệnh đề b ĐÚNG.

    #step([Tìm m để khoảng cách bằng 2])
    $ |m - 5| / 5 = 2 <=> |m - 5| = 10 <=> cases(m - 5 = 10 => m_1 = 15, m - 5 = -10 => m_2 = -5) $
    Có đúng hai giá trị phân biệt $m_1 = 15$ và $m_2 = -5$. Mệnh đề c ĐÚNG.

    #step([Tính tổng hai giá trị])
    $m_1 + m_2 = 15 + (-5) = 10$ (chứ không phải bằng $0$).
    Khẳng định tổng bằng $0$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Khoảng cách từ điểm đến đường thẳng)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Tính khoảng cách từ điểm $M(3; -1)$ đến đường thẳng $4x - 3y + 5 = 0$.],
    [4],
    loigiai: [
        #step([Áp dụng công thức tính khoảng cách])
        $ d = (|4(3) - 3(-1) + 5|) / sqrt(4^2 + (-3)^2) = (|12 + 3 + 5|) / 5 = 20 / 5 = 4 $
    ]
)

// TLN 2 (Khoảng cách giữa hai đường thẳng song song)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Tính khoảng cách giữa hai đường thẳng song song $3x + 4y - 7 = 0$ và $3x + 4y + 13 = 0$.],
    [4],
    loigiai: [
        #step([Áp dụng công thức khoảng cách hai đường song song])
        $ d = (|(-7) - 13|) / sqrt(3^2 + 4^2) = |-20| / 5 = 4 $
    ]
)

// TLN 3 (Tham số m dương để khoảng cách bằng 3)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Tìm giá trị dương của tham số $m$ để khoảng cách từ gốc tọa độ $O(0; 0)$ đến đường thẳng $d: 5x - 12y + m = 0$ bằng $3$.],
    [39],
    loigiai: [
        #step([Thiết lập phương trình khoảng cách])
        $ d(O, d) = (|m|) / sqrt(5^2 + (-12)^2) = (|m|) / 13 = 3 <=> |m| = 39 $
        Vì $m > 0$ nên $m = 39$.
    ]
)

// TLN 4 (Khoảng cách xây đường cáp điện)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Trong bài toán xây dựng đường dây cáp điện ngầm từ trạm $S(6; 6)$ đến đường ray xe lửa $3x + 4y - 12 = 0$, khoảng cách ngắn nhất cần thi công bằng bao nhiêu kilômét?],
    [6],
    loigiai: [
        #step([Tính khoảng cách vuông góc ngắn nhất])
        $ d = (|3(6) + 4(6) - 12|) / sqrt(3^2 + 4^2) = (|18 + 24 - 12|) / 5 = 30 / 5 = 6 text(" km") $
    ]
)

// TLN 5 (Tham số m để vuông góc)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để hai đường thẳng $d_1: m x + 2y - 1 = 0$ và $d_2: 2x - 4y + 3 = 0$ vuông góc với nhau.],
    [4],
    loigiai: [
        #step([Điều kiện hai đường thẳng vuông góc])
        $d_1 perp d_2 <=> a_1 a_2 + b_1 b_2 = 0$:
        $ m(2) + 2(-4) = 0 <=> 2m - 8 = 0 <=> m = 4 $
    ]
)

// TLN 6 (Góc giữa hai đường thẳng)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 159], back-to: "sec-exercise-hub",[Hai đường thẳng $d_1: 3x - y + 1 = 0$ và $d_2: x + 3y - 5 = 0$ cắt nhau tạo thành một góc bằng bao nhiêu độ?],
    [90],
    loigiai: [
        #step([Xét tích vô hướng hai VTPT])
        $vec(n_1) = (3; -1)$, $vec(n_2) = (1; 3)$.
        $vec(n_1) cdot vec(n_2) = 3(1) + (-1)(3) = 0$.
        Do đó hai đường thẳng vuông góc với nhau, số đo góc là $90^circ$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 20: VỊ TRÍ TƯƠNG ĐỐI GIỮA HAI ĐƯỜNG THẲNG. GÓC VÀ KHOẢNG CÁCH (ĐỀ SỐ 22B - VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
