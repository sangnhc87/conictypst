// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 17: DẤU CỦA TAM THỨC BẬC HAI (ĐỀ SỐ 18C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 145  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 17: DẤU CỦA TAM THỨC BẬC HAI (ĐỀ SỐ 18C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 145",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 145]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = sqrt((x^2 - x - 6) / (2 - x))$ là],
    (
        True([$(-infinity; -2] union (2; 3]$]),
        [$[-2; 2) union [3; +infinity)$],
        [$[-2; 3]$],
        [$(-infinity; -2) union (2; 3)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi biểu thức dưới dấu căn không âm và mẫu thức khác $0$:
        $ (x^2 - x - 6) / (2 - x) >= 0 <=> ((x + 2)(x - 3)) / (2 - x) >= 0 $
        Lập bảng xét dấu:
        - $x + 2 = 0 <=> x = -2$.
        - $2 - x = 0 <=> x = 2$.
        - $x - 3 = 0 <=> x = 3$.
        Biểu thức mang dấu dương trên các khoảng $(-infinity; -2)$ và $(2; 3)$; bằng $0$ tại $x = -2$ và $x = 3$.
        Vậy tập xác định là $D = (-infinity; -2] union (2; 3]$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tập nghiệm của hệ bất phương trình bậc hai:
$ cases(
  x^2 - 4x + 3 <= 0,
  x^2 - 6x + 8 > 0
) $ là],
    (
        True([$[1; 2)$]),
        [$(2; 3]$],
        [$[1; 3]$],
        [$[1; 2) union (4; +infinity)$]
    ),
    loigiai: [
        - Bất phương trình thứ nhất: $x^2 - 4x + 3 <= 0 <=> (x - 1)(x - 3) <= 0 <=> 1 <= x <= 3$.
        - Bất phương trình thứ hai: $x^2 - 6x + 8 > 0 <=> (x - 2)(x - 4) > 0 <=> cases(x < 2, x > 4)$.
        Giao hai tập nghiệm: $[1; 3] cap ((-infinity; 2) union (4; +infinity)) = [1; 2)$.
        Vậy tập nghiệm là $[1; 2)$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để bất phương trình $m x^2 - 2(m - 1)x + 4m <= 0$ VÔ NGHIỆM.],
    (
        True([$m > 1/3$]),
        [$m < -1$],
        [$-1 < m < 1/3$],
        [$m >= 1/3$]
    ),
    loigiai: [
        Bất phương trình $f(x) <= 0$ vô nghiệm khi và chỉ khi $f(x) > 0$ với mọi $x in RR$:
        - Với $m = 0$: $f(x) = 2x > 0 <=> x > 0$ (không đúng với mọi $x in RR$). Do đó $m = 0$ loại.
        - Với $m != 0$: $f(x) > 0$ với mọi $x in RR$ khi và chỉ khi:
        $ cases(a = m > 0, Delta' = (-(m - 1))^2 - m(4m) < 0) <=> cases(m > 0, m^2 - 2m + 1 - 4m^2 < 0) $
        $ <=> cases(m > 0, -3m^2 - 2m + 1 < 0) <=> cases(m > 0, 3m^2 + 2m - 1 > 0) $
        Tam thức $3m^2 + 2m - 1$ có hai nghiệm là $m = -1$ và $m = 1/3$.
        Vì $m > 0$ nên ta được $m > 1/3$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Cho hàm số bậc hai $f(x) = a x^2 + b x + c$ có đồ thị nằm hoàn toàn phía dưới trục hoành $O x$. Dấu của hệ số $a$ và biệt thức $Delta = b^2 - 4a c$ là],
    (
        True([$a < 0$ và $Delta < 0$]),
        [$a < 0$ và $Delta > 0$],
        [$a > 0$ và $Delta < 0$],
        [$a < 0$ và $Delta = 0$]
    ),
    loigiai: [
        Đồ thị nằm hoàn toàn phía dưới trục hoành nghĩa là $f(x) < 0$ với mọi $x in RR$.
        Theo định lý về dấu của tam thức bậc hai, điều kiện là $a < 0$ và $Delta < 0$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Số nghiệm nguyên của bất phương trình $(x^2 - 16) / (x^2 - 2x - 3) <= 0$ là],
    (
        True([$4$]),
        [$5$],
        [$6$],
        [$7$]
    ),
    loigiai: [
        - Nghiệm của tử số: $x^2 - 16 = 0 <=> x = plus.minus 4$.
        - Nghiệm của mẫu số: $x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$.
        Lập bảng xét dấu:
        - Biểu thức không dương ($<= 0$) khi $x in [-4; -1) union (3; 4]$.
        - Các nghiệm nguyên thỏa mãn là: $-4, -3, -2, 4$ (tổng cộng có đúng $4$ nghiệm).
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Bất phương trình $x^2 - 2|x| - 3 <= 0$ có bao nhiêu nghiệm nguyên?],
    (
        True([$7$]),
        [$6$],
        [$5$],
        [$8$]
    ),
    loigiai: [
        Đặt $t = |x| >= 0$. Bất phương trình trở thành:
        $ t^2 - 2t - 3 <= 0 <=> (t + 1)(t - 3) <= 0 <=> -1 <= t <= 3 $
        Vì $t >= 0$ nên $0 <= t <= 3 <=> |x| <= 3 <=> -3 <= x <= 3$.
        Các nghiệm nguyên là: $-3, -2, -1, 0, 1, 2, 3$ (tổng cộng có đúng $7$ nghiệm).
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình bậc hai $x^2 - 2(m + 1)x + m^2 + 3m - 2 = 0$ có hai nghiệm trái dấu.],
    (
        True([$- (3 + sqrt(17)) / 2 < m < (-3 + sqrt(17)) / 2$]),
        [$m > 2$ hoặc $m < -3$],
        [$m > 0$],
        [$m < -2$]
    ),
    loigiai: [
        Phương trình bậc hai $a x^2 + b x + c = 0$ có hai nghiệm trái dấu khi và chỉ khi tích $a c < 0$:
        $ 1 cdot (m^2 + 3m - 2) < 0 <=> m^2 + 3m - 2 < 0 $
        Tam thức có hai nghiệm $m = (-3 plus.minus sqrt(17)) / 2$.
        Hệ số của $m^2$ là $1 > 0$, do đó nghiệm là:
        $ - (3 + sqrt(17)) / 2 < m < (-3 + sqrt(17)) / 2 $
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tập nghiệm của bất phương trình bậc bốn trùng phương $x^4 - 5x^2 + 4 <= 0$ là],
    (
        True([$[-2; -1] union [1; 2]$]),
        [$[1; 4]$],
        [$[-2; 2]$],
        [$[-4; -1] union [1; 4]$]
    ),
    loigiai: [
        Đặt $t = x^2 >= 0$. Bất phương trình trở thành:
        $ t^2 - 5t + 4 <= 0 <=> 1 <= t <= 4 $
        Thay $t = x^2$ vào:
        $ 1 <= x^2 <= 4 <=> cases(x^2 >= 1, x^2 <= 4) <=> cases(x <= -1 text(" hoặc ") x >= 1, -2 <= x <= 2) $
        Giao lại ta được tập nghiệm: $S = [-2; -1] union [1; 2]$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Độ bền chịu tải của một thanh dầm bê tông cốt thép phụ thuộc vào khoảng cách đặt lực $x text(" (m)")$ ($2 <= x <= 12$) theo công thức:
$ B(x) = -0.5 x^2 + 8x + 100 text(" (kN)") $
Thanh dầm chịu được tải trọng an toàn từ $130 text(" kN")$ trở lên khi khoảng cách $x$ thỏa mãn],
    (
        True([$6 text(" m") <= x <= 10 text(" m")$]),
        [$4 text(" m") <= x <= 8 text(" m")$],
        [$5 text(" m") <= x <= 11 text(" m")$],
        [$x >= 6 text(" m")$]
    ),
    loigiai: [
        Thanh dầm chịu tải an toàn khi:
        $ B(x) >= 130 <=> -0.5 x^2 + 8x + 100 >= 130 <=> -0.5 x^2 + 8x - 30 >= 0 $
        $ <=> 0.5 x^2 - 8x + 30 <= 0 <=> x^2 - 16x + 60 <= 0 <=> (x - 6)(x - 10) <= 0 <=> 6 <= x <= 10 $
        Vậy khoảng cách an toàn là từ $6 text(" m")$ đến $10 text(" m")$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Cho hai tam thức bậc hai $f(x) = x^2 - 4x + 3$ và $g(x) = -x^2 + 6x - 5$. Khoảng nghiệm chung của hai bất phương trình $f(x) < 0$ và $g(x) > 0$ là],
    (
        True([$(1; 3)$]),
        [$(1; 5)$],
        [$(3; 5)$],
        [$emptyset$]
    ),
    loigiai: [
        - $f(x) < 0 <=> x^2 - 4x + 3 < 0 <=> (x - 1)(x - 3) < 0 <=> 1 < x < 3$.
        - $g(x) > 0 <=> -x^2 + 6x - 5 > 0 <=> x^2 - 6x + 5 < 0 <=> 1 < x < 5$.
        Giao hai tập nghiệm: $(1; 3) cap (1; 5) = (1; 3)$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình bậc hai $x^2 - 2m x + 2m - 1 = 0$ có hai nghiệm phân biệt đều lớn hơn $1$.],
    (
        True([$m > 1$]),
        [$m < 1$],
        [$m > 2$],
        [$m != 1$]
    ),
    loigiai: [
        Phương trình có $a + b + c = 1 - 2m + 2m - 1 = 0$, nên luôn có hai nghiệm:
        $ x_1 = 1 text(" và ") x_2 = 2m - 1 $
        Để hai nghiệm phân biệt và đều lớn hơn $1$:
        $ cases(x_1 != x_2, x_2 > 1) <=> cases(2m - 1 != 1, 2m - 1 > 1) <=> 2m - 1 > 1 <=> 2m > 2 <=> m > 1 $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm tập xác định của hàm số $y = 1 / sqrt(x^2 - 2|x| + 1)$ là],
    (
        True([$RR setminus {-1; 1}$]),
        [$RR$],
        [$(-infinity; -1) union (1; +infinity)$],
        [$(-1; 1)$]
    ),
    loigiai: [
        Ta có $x^2 - 2|x| + 1 = (|x| - 1)^2$.
        Vì căn nằm ở mẫu nên biểu thức dưới căn phải thực sự dương:
        $ (|x| - 1)^2 > 0 <=> |x| - 1 != 0 <=> |x| != 1 <=> x != plus.minus 1 $
        Vậy tập xác định là $D = RR setminus {-1; 1}$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị tam thức bậc hai)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Cho tam thức bậc hai $f(x) = x^2 - 2x - 8$ có đồ thị parabol $(P)$ cắt trục hoành tại hai điểm $A$ và $B$ như sau:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (6, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -10), (0, 4), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.8, -0.3), [$x$])
  content((-0.3, 3.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = x^2 - 2x - 8
  line(..range(-25, 46).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 2) - 2 * x - 8)
  }), stroke: 1.5pt + rgb("d97706"))
  
  // Hai nghiệm (-2; 0) và (4; 0)
  circle((-2, 0), radius: 2pt, fill: rgb("d97706"))
  circle((4, 0), radius: 2pt, fill: rgb("d97706"))
  content((-2, 0.3), [$-2$])
  content((4, 0.3), [$4$])
  
  // Đỉnh (1; -9)
  circle((1, -9), radius: 2pt, fill: rgb("d97706"))
  content((1.6, -9.2), [$I(1; -9)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam thức $f(x)$ có hai nghiệm thực phân biệt là $x_1 = -2$ và $x_2 = 4$.]),
    True([Tập nghiệm của bất phương trình $f(x) < 0$ là khoảng $(-2; 4)$.]),
    True([Tập nghiệm của bất phương trình $sqrt(f(x)) <= 0$ chỉ gồm đúng hai phần tử là $\{-2; 4\}$.]),
    [Tập nghiệm của bất phương trình $1 / f(x) >= 0$ là $(-infinity; -2] union [4; +infinity)$.]
  ),
  loigiai: [
    #step([Tìm nghiệm tam thức])
    $x^2 - 2x - 8 = 0 <=> (x + 2)(x - 4) = 0 <=> cases(x = -2, x = 4)$. Mệnh đề a ĐÚNG.

    #step([Giải f(x) < 0])
    Vì $a = 1 > 0$, theo quy tắc "trong trái, ngoài cùng", $f(x) < 0 <=> -2 < x < 4$. Mệnh đề b ĐÚNG.

    #step([Giải căn f(x) <= 0])
    Điều kiện xác định là $f(x) >= 0$.
    Khi đó $sqrt(f(x)) >= 0$, do đó $sqrt(f(x)) <= 0 <=> sqrt(f(x)) = 0 <=> f(x) = 0 <=> x in \{-2; 4\}$. Mệnh đề c ĐÚNG.

    #step([Giải 1/f(x) >= 0])
    Phân thức $1 / f(x) >= 0 <=> cases(f(x) >= 0, f(x) != 0) <=> f(x) > 0 <=> x < -2 text(" hoặc ") x > 4$.
    Tập nghiệm phải là khoảng mở $(-infinity; -2) union (4; +infinity)$.
    Việc lấy cả hai mút vuông là SAI vì tại đó mẫu số bằng $0$. Mệnh đề d SAI.
  ]
)

// DS 2 (Bất phương trình nghiệm đúng trên đoạn)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Cho bất phương trình: $x^2 - 2(m + 1)x + m^2 + 2m >= 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biểu thức ở vế trái luôn phân tích được thành nhân tử là $(x - m)[x - (m + 2)]$.]),
    True([Hai nghiệm của tam thức ở vế trái là $x_1 = m$ và $x_2 = m + 2$.]),
    True([Bất phương trình nghiệm đúng với mọi $x in [2; 4]$ khi và chỉ khi $m >= 4$ hoặc $m <= 0$.]),
    [Có đúng $3$ giá trị nguyên của tham số $m in [-5; 5]$ để bất phương trình nghiệm đúng với mọi $x in [2; 4]$.]
  ),
  loigiai: [
    #step([Phân tích thành nhân tử])
    Ta có $m^2 + 2m = m(m + 2)$ và $-2(m + 1) = -(m + m + 2)$.
    Do đó:
    $ x^2 - 2(m + 1)x + m^2 + 2m = (x - m)[x - (m + 2)] $
    Mệnh đề a ĐÚNG.

    #step([Tìm nghiệm])
    Hai nghiệm là $x_1 = m$ và $x_2 = m + 2$. Vì $m < m + 2$ nên $x_1 < x_2$. Mệnh đề b ĐÚNG.

    #step([Nghiệm đúng với mọi x trong đoạn [2; 4]])
    Vế trái không âm ngoài khoảng hai nghiệm: $x <= m$ hoặc $x >= m + 2$.
    Để $[2; 4]$ là tập con của tập nghiệm thì:
    - Hoặc $[2; 4] subset (-infinity; m] <=> m >= 4$.
    - Hoặc $[2; 4] subset [m + 2; +infinity) <=> m + 2 <= 2 <=> m <= 0$.
    Vậy $m <= 0$ hoặc $m >= 4$. Mệnh đề c ĐÚNG.

    #step([Đếm số giá trị nguyên])
    Kết hợp $m in [-5; 5]$:
    - $m in [-5; 0] => m in \{-5; -4; -3; -2; -1; 0\}$ ($6$ giá trị).
    - $m in [4; 5] => m in \{4; 5\}$ ($2$ giá trị).
    Tổng cộng có $6 + 2 = 8$ giá trị nguyên (chứ không phải $3$).
    Khẳng định có đúng $3$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh chuỗi trà sữa)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Một chuỗi cửa hàng trà sữa đang bán với giá $40$ nghìn đồng/ly, mỗi ngày bán được trung bình $500$ ly.
Quản lý ước tính: Cứ mỗi lần giảm giá bán $2$ nghìn đồng/ly thì số lượng ly bán ra mỗi ngày sẽ tăng thêm $50$ ly.
Gọi $x$ là số lần giảm giá ($x in NN^*, x <= 15$).
Giá bán mỗi ly sau khi giảm là $40 - 2x$ (nghìn đồng) và số ly bán được mỗi ngày là $500 + 50x$ (ly).
Biết chi phí nguyên liệu và vận hành để sản xuất mỗi ly trà sữa là $15$ nghìn đồng.
Lợi nhuận mỗi ngày của chuỗi cửa hàng là $L(x)$ (nghìn đồng).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu chuỗi cửa hàng giảm giá $5$ lần thì giá bán mỗi ly là $30$ nghìn đồng và bán được $750$ ly mỗi ngày.]),
    True([Công thức của hàm lợi nhuận mỗi ngày theo $x$ là $L(x) = -100 x^2 + 250 x + 12500 text(" (nghìn đồng)")$.]),
    True([Chuỗi cửa hàng đạt lợi nhuận tối đa trong ngày khi thực hiện giảm giá $x = 1$ lần.]),
    [Lợi nhuận mỗi ngày của chuỗi cửa hàng có thể đạt vượt mức $15.000.000$ đồng.]
  ),
  loigiai: [
    #step([Kiểm tra khi x = 5])
    Giá bán: $40 - 2(5) = 30$ nghìn đồng.
    Số ly bán: $500 + 50(5) = 750$ ly. Mệnh đề a ĐÚNG.

    #step([Lập hàm lợi nhuận])
    Lợi nhuận trên mỗi ly: $(40 - 2x) - 15 = 25 - 2x$ (nghìn đồng).
    Tổng lợi nhuận mỗi ngày:
    $ L(x) = (25 - 2x)(500 + 50x) = 12500 + 1250x - 1000x - 100x^2 = -100x^2 + 250x + 12500 $ (nghìn đồng).
    Mệnh đề b ĐÚNG.

    #step([Tìm số lần giảm giá để đạt lợi nhuận tối đa])
    Đỉnh của parabol: $x_I = - 250 / (2(-100)) = 1.25$.
    Vì $x in NN^*$ nên ta so sánh giá trị tại hai số nguyên lân cận $x = 1$ và $x = 2$:
    - Với $x = 1$: $L(1) = -100(1)^2 + 250(1) + 12500 = 12650$ nghìn đồng.
    - Với $x = 2$: $L(2) = -100(4) + 250(2) + 12500 = 12600$ nghìn đồng.
    Vậy lợi nhuận lớn nhất đạt được khi $x = 1$. Mệnh đề c ĐÚNG.

    #step([Lợi nhuận tối đa có vượt 15 triệu đồng])
    Lợi nhuận lớn nhất đạt được là $12.650.000$ đồng $< 15.000.000$ đồng.
    Do đó khẳng định có thể vượt $15$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Hệ bất phương trình bậc hai)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Cho hệ bất phương trình:
$ cases(
  x^2 - 6x + 5 <= 0,
  x^2 - 2(m + 1)x + m^2 + 2m <= 0
) $ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập nghiệm của bất phương trình thứ nhất là đoạn $[1; 5]$.]),
    True([Tập nghiệm của bất phương trình thứ hai là đoạn $[m; m + 2]$.]),
    True([Hệ bất phương trình có nghiệm khi và chỉ khi $-1 <= m <= 5$.]),
    [Có đúng $5$ giá trị nguyên của tham số $m$ để hệ bất phương trình có nghiệm duy nhất.]
  ),
  loigiai: [
    #step([Giải bất phương trình thứ nhất])
    $x^2 - 6x + 5 <= 0 <=> (x - 1)(x - 5) <= 0 <=> 1 <= x <= 5$. Tập nghiệm $S_1 = [1; 5]$. Mệnh đề a ĐÚNG.

    #step([Giải bất phương trình thứ hai])
    $x^2 - 2(m + 1)x + m^2 + 2m <= 0 <=> (x - m)[x - (m + 2)] <= 0 <=> m <= x <= m + 2$. Tập nghiệm $S_2 = [m; m + 2]$. Mệnh đề b ĐÚNG.

    #step([Điều kiện hệ có nghiệm])
    Hệ có nghiệm khi $S_1 cap S_2 != emptyset$:
    $ cases(m + 2 >= 1, m <= 5) <=> cases(m >= -1, m <= 5) <=> -1 <= m <= 5 $
    Mệnh đề c ĐÚNG.

    #step([Điều kiện hệ có nghiệm duy nhất])
    Hệ có nghiệm duy nhất khi hai đoạn chỉ giao nhau tại đúng một điểm mút:
    - Trường hợp 1: $m + 2 = 1 <=> m = -1$ (giao điểm duy nhất là $x = 1$).
    - Trường hợp 2: $m = 5$ (giao điểm duy nhất là $x = 5$).
    Vậy chỉ có đúng $2$ giá trị của $m$ là $m = -1$ và $m = 5$.
    Khẳng định có đúng $5$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số nghiệm nguyên của BPT bậc 4)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của bất phương trình $x^4 - 10x^2 + 9 <= 0$.],
    [6],
    loigiai: [
        #step([Giải bất phương trình theo t = x^2])
        Đặt $t = x^2 >= 0$:
        $ t^2 - 10t + 9 <= 0 <=> (t - 1)(t - 9) <= 0 <=> 1 <= t <= 9 $
        
        #step([Tìm nghiệm x])
        $ 1 <= x^2 <= 9 <=> cases(x^2 >= 1, x^2 <= 9) <=> x in [-3; -1] union [1; 3] $
        
        #step([Đếm số nghiệm nguyên])
        Các số nguyên là: $-3, -2, -1, 1, 2, 3$ (tổng cộng $6$ nghiệm).
    ]
)

// TLN 2 (Giá trị nguyên nhỏ nhất của m)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm giá trị nguyên nhỏ nhất của tham số $m$ để tam thức bậc hai $f(x) = (m + 1)x^2 - 2(m - 1)x + 3m - 3 > 0$ nghiệm đúng với mọi số thực $x$.],
    [2],
    loigiai: [
        #step([Điều kiện cần và đủ])
        Để $f(x) > 0$ với mọi $x in RR$ thì:
        $ cases(a = m + 1 > 0, Delta' < 0) $
        $ Delta' = (-(m - 1))^2 - (m + 1)(3m - 3) = (m - 1)^2 - 3(m - 1)(m + 1) $
        $ = (m - 1)[m - 1 - 3(m + 1)] = (m - 1)(-2m - 4) = -2(m - 1)(m + 2) $
        
        #step([Giải hệ điều kiện])
        $ cases(m > -1, -2(m - 1)(m + 2) < 0) <=> cases(m > -1, (m - 1)(m + 2) > 0) <=> cases(m > -1, m < -2 text(" hoặc ") m > 1) <=> m > 1 $
        
        #step([Tìm m nguyên nhỏ nhất])
        Vì $m in ZZ$ và $m > 1$ nên giá trị nguyên nhỏ nhất là $m = 2$.
    ]
)

// TLN 3 (Số nghiệm nguyên của phân thức)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của bất phương trình:
$ (x^2 - 4) / (x^2 - 7x + 12) <= 0 $],
    [5],
    loigiai: [
        #step([Tìm nghiệm tử và mẫu])
        - Tử số: $x^2 - 4 = 0 <=> x = plus.minus 2$.
        - Mẫu số: $x^2 - 7x + 12 = 0 <=> x = 3$ hoặc $x = 4$.
        
        #step([Lập bảng xét dấu])
        Biểu thức không dương ($<= 0$) khi:
        $ x in [-2; 2] union (3; 4) $
        
        #step([Đếm số nghiệm nguyên])
        Các số nguyên thỏa mãn là:
        - Trên $[-2; 2]$: $-2, -1, 0, 1, 2$ ($5$ số).
        - Trên $(3; 4)$: không có số nguyên nào.
        Vậy có đúng $5$ nghiệm nguyên.
    ]
)

// TLN 4 (Độ dài khoảng an toàn tải trọng dầm)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Độ bền chịu tải an toàn của một thanh dầm cầu bê tông cốt thép tại vị trí $x text(" (m)")$ ($2 <= x <= 12$) được cho bởi:
$ B(x) = -0.5 x^2 + 8x + 100 text(" (kN)") $
Biết thanh dầm chịu được tải trọng an toàn từ $130 text(" kN")$ trở lên khi vị trí $x$ nằm trong đoạn $[x_1; x_2]$.
Tính độ dài của khoảng vị trí an toàn $L = x_2 - x_1$ theo đơn vị mét.],
    [4],
    loigiai: [
        #step([Lập bất phương trình])
        $ -0.5 x^2 + 8x + 100 >= 130 <=> 0.5 x^2 - 8x + 30 <= 0 <=> x^2 - 16x + 60 <= 0 $
        
        #step([Giải tìm x1 và x2])
        Phương trình $x^2 - 16x + 60 = 0 <=> (x - 6)(x - 10) = 0 <=> cases(x_1 = 6, x_2 = 10)$.
        Đoạn vị trí an toàn là $[6; 10]$.
        
        #step([Tính độ dài])
        $ L = x_2 - x_1 = 10 - 6 = 4 text(" m") $
    ]
)

// TLN 5 (Tìm m để nghiệm nguyên lớn nhất bằng 8)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để bất phương trình bậc hai:
$ x^2 - (2m + 1)x + m^2 + m - 6 <= 0 $
có nghiệm nguyên lớn nhất bằng $8$.],
    [5],
    loigiai: [
        #step([Phân tích tam thức thành nhân tử])
        $m^2 + m - 6 = (m - 2)(m + 3)$.
        Tổng hai nhân tử: $(m - 2) + (m + 3) = 2m + 1$.
        Do đó:
        $ x^2 - (2m + 1)x + m^2 + m - 6 = (x - (m - 2))(x - (m + 3)) <= 0 $
        
        #step([Tìm tập nghiệm])
        Vì $m - 2 < m + 3$ nên tập nghiệm của bất phương trình là:
        $ m - 2 <= x <= m + 3 $
        
        #step([Tìm m])
        Nghiệm nguyên lớn nhất là $x_text("max") = m + 3$.
        Theo đề bài $m + 3 = 8 <=> m = 5$.
    ]
)

// TLN 6 (Hai nghiệm phân biệt dương)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 145], back-to: "sec-exercise-hub",[Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để phương trình bậc hai:
$ x^2 - 2(m - 1)x + m^2 - 2m = 0 $
có hai nghiệm phân biệt đều mang giá trị dương.],
    [8],
    loigiai: [
        #step([Điều kiện hai nghiệm phân biệt dương])
        Phương trình có hai nghiệm phân biệt dương khi và chỉ khi:
        $ cases(Delta' > 0, S > 0, P > 0) $
        - $Delta' = (-(m - 1))^2 - (m^2 - 2m) = m^2 - 2m + 1 - m^2 + 2m = 1 > 0$ (luôn đúng).
        - $S = 2(m - 1) > 0 <=> m > 1$.
        - $P = m^2 - 2m > 0 <=> m(m - 2) > 0 <=> cases(m < 0, m > 2)$.
        
        #step([Kết hợp điều kiện])
        Giao các điều kiện: $m > 1$ và $(m < 0 text(" hoặc ") m > 2) <=> m > 2$.
        
        #step([Đếm số giá trị nguyên])
        Với $m in [-10; 10]$ và $m in ZZ$, ta có $m in {3; 4; 5; 6; 7; 8; 9; 10}$.
        Tổng cộng có đúng $8$ giá trị nguyên.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 17: DẤU CỦA TAM THỨC BẬC HAI (ĐỀ SỐ 18C - NÂNG CAO & VDC)!]      #v(0.6em)
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
