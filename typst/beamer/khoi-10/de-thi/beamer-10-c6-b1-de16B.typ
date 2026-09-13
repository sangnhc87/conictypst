// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 15: HÀM SỐ VÀ ĐỒ THỊ (ĐỀ SỐ 16B - VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 138  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 15: HÀM SỐ VÀ ĐỒ THỊ (ĐỀ SỐ 16B - VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 138",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 138]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = (2x - 1) / sqrt(5 - x)$ là],
    (
        True([$(-infinity; 5)$]),
        [$( -infinity; 5]$],
        [$(5; +infinity)$],
        [$[5; +infinity)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi biểu thức dưới dấu căn ở mẫu thực sự dương:
        $ 5 - x > 0 <=> x < 5 $
        Vậy tập xác định của hàm số là $D = (-infinity; 5)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = sqrt(x + 2) + sqrt(7 - x)$ là],
    (
        True([$[-2; 7]$]),
        [$(-2; 7)$],
        [$[-2; 7)$],
        [$(-infinity; 7]$]
    ),
    loigiai: [
        Điều kiện xác định của hàm số:
        $ cases(x + 2 >= 0, 7 - x >= 0) <=> cases(x >= -2, x <= 7) <=> -2 <= x <= 7 $
        Vậy tập xác định của hàm số là $D = [-2; 7]$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Điểm nào sau đây THUỘC đồ thị của hàm số $y = |2x - 3| + 1$?],
    (
        True([$A(1; 2)$]),
        [$B(2; 3)$],
        [$C(0; 1)$],
        [$D(-1; 5)$]
    ),
    loigiai: [
        Thay tọa độ các điểm vào công thức hàm số:
        - Với $A(1; 2)$: $y = |2(1) - 3| + 1 = |-1| + 1 = 1 + 1 = 2$ (Thỏa mãn).
        - Với $B(2; 3)$: $y = |2(2) - 3| + 1 = 1 + 1 = 2 != 3$ (Loại).
        - Với $C(0; 1)$: $y = |-3| + 1 = 4 != 1$ (Loại).
        - Với $D(-1; 5)$: $y = |-5| + 1 = 6 != 5$ (Loại).
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số phân nhánh ba công thức:
$ f(x) = cases(
  x + 2 &text("khi") x > 1,
  3 &text("khi") -1 <= x <= 1,
  -2x &text("khi") x < -1
) $
Giá trị của biểu thức $T = f(3) + f(0) + f(-2)$ bằng],
    (
        True([$12$]),
        [$10$],
        [$8$],
        [$14$]
    ),
    loigiai: [
        - Với $x = 3 > 1$: $f(3) = 3 + 2 = 5$.
        - Với $x = 0 in [-1; 1]$: $f(0) = 3$.
        - Với $x = -2 < -1$: $f(-2) = -2(-2) = 4$.
        Suy ra: $T = f(3) + f(0) + f(-2) = 5 + 3 + 4 = 12$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Giao điểm của đồ thị hàm số $y = 3x^2 - 5x + 6$ với trục tung $O y$ là điểm có tọa độ],
    (
        True([$M(0; 6)$]),
        [$N(6; 0)$],
        [$P(0; -5)$],
        [$Q(0; 3)$]
    ),
    loigiai: [
        Giao điểm với trục tung $O y$ có hoành độ $x = 0$:
        $ y = 3(0)^2 - 5(0) + 6 = 6 $
        Vậy tọa độ giao điểm là $M(0; 6)$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x)$ có bảng biến thiên trên khoảng $(-infinity; +infinity)$ như sau:
#align(center)[
#table(
  columns: (auto, auto, auto, auto),
  inset: 7pt,
  align: center,
  [$x$], [$-infinity$], [$2$], [$+infinity$],
  [$f(x)$], [$-infinity$], [$5$], [$-infinity$]
)
]
Hàm số $y = f(x)$ ĐỒNG BIẾN trên khoảng nào sau đây?],
    (
        True([$(-infinity; 2)$]),
        [$(2; +infinity)$],
        [$(-infinity; 5)$],
        [$(5; +infinity)$]
    ),
    loigiai: [
        Theo bảng biến thiên, khi $x$ tăng từ $-infinity$ đến $2$ thì mũi tên đi lên từ $-infinity$ đến $5$, nghĩa là giá trị $f(x)$ tăng.
        Do đó hàm số đồng biến trên khoảng $(-infinity; 2)$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Hàm số nào sau đây NGHỊCH BIẾN trên toàn trục số thực $RR$?],
    (
        True([$y = -4x + 7$]),
        [$y = 2x - 3$],
        [$y = 5$],
        [$y = x^2 - 1$]
    ),
    loigiai: [
        Hàm số bậc nhất $y = a x + b$ nghịch biến trên $RR$ khi hệ số góc $a < 0$.
        Hàm số $y = -4x + 7$ có $a = -4 < 0$ nên luôn nghịch biến trên $RR$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tập giá trị $T$ của hàm số $y = -x^2 + 4$ với $x in [-1; 2]$ là],
    (
        True([$[0; 4]$]),
        [$[3; 4]$],
        [$[0; 3]$],
        [$[-4; 4]$]
    ),
    loigiai: [
        Với $x in [-1; 2]$, ta có $0 <= x^2 <= 4$.
        Suy ra $-4 <= -x^2 <= 0 <=> 0 <= -x^2 + 4 <= 4$.
        Giá trị nhỏ nhất là $0$ (khi $x = 2$) và lớn nhất là $4$ (khi $x = 0$).
        Vậy tập giá trị là $T = [0; 4]$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Một người đi xe đạp chuyển động thẳng đều với vận tốc $15 text(" km/h")$. Gọi $S(t) text(" (km)")$ là quãng đường người đó đi được sau thời gian $t text(" (giờ)")$ với $t >= 0$. Công thức của hàm số $S(t)$ là],
    (
        True([$S(t) = 15t$]),
        [$S(t) = 15 / t$],
        [$S(t) = t / 15$],
        [$S(t) = 15 + t$]
    ),
    loigiai: [
        Trong chuyển động thẳng đều, quãng đường bằng vận tốc nhân thời gian: $S = v t = 15t$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = 1 / (x^2 - 9)$ là],
    (
        True([$RR setminus {-3; 3}$]),
        [$RR setminus {3}$],
        [$RR setminus {-3}$],
        [$(-3; 3)$]
    ),
    loigiai: [
        Hàm số xác định khi mẫu thức khác $0$:
        $ x^2 - 9 != 0 <=> x^2 != 9 <=> x != plus.minus 3 $
        Vậy tập xác định là $D = RR setminus {-3; 3}$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x)$ xác định trên $RR$ và có đồ thị như hình vẽ dưới đây:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (3.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.3, -0.3), [$x$])
  content((-0.3, 3.3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đồ thị hàm số y = 3 - x^2
  line(..range(-22, 23).map(t => (t / 10, 3 - calc.pow(t / 10, 2))), stroke: 1.5pt + rgb("0d9488"))
  
  // Đường thẳng nằm ngang y = 2
  line((-2.5, 2), (2.5, 2), stroke: (dash: "dashed", paint: rgb("e11d48")))
  content((2.8, 2.2), [$y = 2$])
  circle((1, 2), radius: 2pt, fill: rgb("e11d48"))
  circle((-1, 2), radius: 2pt, fill: rgb("e11d48"))
})
]
Số nghiệm thực của phương trình $f(x) = 2$ bằng],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Số nghiệm thực của phương trình $f(x) = 2$ bằng số giao điểm của đồ thị hàm số $y = f(x)$ với đường thẳng nằm ngang $y = 2$.
        Quan sát hình vẽ, đường thẳng $y = 2$ cắt đồ thị tại đúng $2$ điểm phân biệt nên phương trình có $2$ nghiệm.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Khẳng định nào sau đây là ĐÚNG khi nói về đồ thị hàm số lẻ trên mặt phẳng tọa độ $O x y$?],
    (
        True([Đồ thị của hàm số lẻ nhận gốc tọa độ $O$ làm tâm đối xứng]),
        [Đồ thị của hàm số lẻ nhận trục tung $O y$ làm trục đối xứng],
        [Đồ thị của hàm số lẻ nhận trục hoành $O x$ làm trục đối xứng],
        [Đồ thị của hàm số lẻ luôn đi qua điểm $(1; 1)$]
    ),
    loigiai: [
        Theo tính chất đồ thị: Hàm số chẵn nhận trục tung $O y$ làm trục đối xứng; còn hàm số lẻ nhận gốc tọa độ $O(0; 0)$ làm tâm đối xứng.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị hàm số có cực trị)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho đồ thị hàm số $y = f(x)$ xác định liên tục trên đoạn $[-4; 4]$ như hình vẽ dưới đây:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-5, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -3.5), (0, 4), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x$])
  content((-0.3, 3.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đồ thị hàm bậc ba dạng sóng
  line(..range(-40, 41).map(t => { let x = t / 10; (x, 0.1 * calc.pow(x, 3) - 0.2 * calc.pow(x, 2) - 1.2 * x + 1) }), stroke: 1.5pt + rgb("0d9488"))
  
  // Các điểm mốc
  circle((-2, 2.6), radius: 2.5pt, fill: rgb("0d9488"))
  circle((2, -1.4), radius: 2.5pt, fill: rgb("0d9488"))
  content((-2, 3), [$(-2; 2.6)$])
  content((2, -1.8), [$(2; -1.4)$])
})
]
Biết hàm số đạt cực đại tại $x = -2$ với giá trị tương ứng $y = 2.6$ và đạt cực tiểu tại $x = 2$ với giá trị tương ứng $y = -1.4$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập xác định của hàm số đã cho là đoạn $[-4; 4]$.]),
    True([Hàm số đồng biến trên khoảng $(-4; -2)$ và trên khoảng $(2; 4)$.]),
    True([Hàm số nghịch biến trên khoảng $(-2; 2)$.]),
    [Đường thẳng $y = 3$ cắt đồ thị hàm số tại đúng ba điểm phân biệt.]
  ),
  loigiai: [
    #step([Xác định tập xác định])
    Hàm số được xác định trên toàn bộ đoạn $[-4; 4]$ nên $D = [-4; 4]$. Mệnh đề a ĐÚNG.

    #step([Khoảng đồng biến])
    Trên các khoảng $(-4; -2)$ và $(2; 4)$, đồ thị đi lên từ trái sang phải nên hàm số đồng biến. Mệnh đề b ĐÚNG.

    #step([Khoảng nghịch biến])
    Trên khoảng $(-2; 2)$, đồ thị đi xuống từ trái sang phải nên hàm số nghịch biến. Mệnh đề c ĐÚNG.

    #step([Số giao điểm với đường thẳng y = 3])
    Vì giá trị cực đại của hàm số là $2.6 < 3$, nên nhánh đồ thị ở giữa không chạm tới $3$.
    Đường thẳng $y = 3$ chỉ có thể cắt nhánh ngoài cùng bên phải (khi đồ thị đi lên tới biên $x = 4$).
    Do đó đường thẳng $y = 3$ chỉ cắt đồ thị tại tối đa một điểm, không thể có $3$ điểm.
    Khẳng định ba điểm phân biệt là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tập xác định chứa tham số m)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x) = sqrt(2x - m + 1) + (x - 1) / (x - 3)$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 3$, tập xác định của hàm số là nửa khoảng $[1; +infinity) setminus {3}$.]),
    True([Hàm số xác định tại điểm $x = 5$ khi và chỉ khi $m <= 11$.]),
    True([Để hàm số xác định trên toàn bộ khoảng $(3; +infinity)$ thì điều kiện của tham số là $m <= 7$.]),
    [Có đúng $3$ giá trị nguyên dương của tham số $m$ để hàm số xác định trên toàn bộ đoạn $[4; 8]$.]
  ),
  loigiai: [
    #step([Điều kiện xác định tổng quát])
    Hàm số xác định khi và chỉ khi:
    $ cases(2x - m + 1 >= 0, x - 3 != 0) <=> cases(x >= (m - 1) / 2, x != 3) $
    Tập xác định là $D = [(m - 1) / 2; +infinity) setminus {3}$.

    #step([Khi m = 3])
    $(m - 1) / 2 = (3 - 1) / 2 = 1$. Tập xác định là $D = [1; +infinity) setminus {3}$. Mệnh đề a ĐÚNG.

    #step([Xác định tại x = 5])
    Tại $x = 5 != 3$, điều kiện là $5 >= (m - 1) / 2 <=> 10 >= m - 1 <=> m <= 11$. Mệnh đề b ĐÚNG.

    #step([Xác định trên khoảng (3; +infinity)])
    Điểm $3$ không thuộc khoảng $(3; +infinity)$.
    Để hàm số xác định trên $(3; +infinity)$ thì $(3; +infinity) subset [(m - 1) / 2; +infinity)$, tức là:
    $ (m - 1) / 2 <= 3 <=> m - 1 <= 6 <=> m <= 7 $
    Mệnh đề c ĐÚNG.

    #step([Xác định trên đoạn [4; 8]])
    Vì $3 cancel(in) [4; 8]$, nên hàm số xác định trên $[4; 8]$ khi và chỉ khi:
    $ (m - 1) / 2 <= 4 <=> m - 1 <= 8 <=> m <= 9 $
    Các giá trị nguyên dương của $m$ thỏa mãn là: $m in {1; 2; 3; 4; 5; 6; 7; 8; 9}$ (gồm đúng $9$ giá trị).
    Khẳng định có đúng $3$ giá trị là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế biểu giá điện sinh hoạt bậc thang EVN)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Một công ty điện lực áp dụng biểu giá bán lẻ điện sinh hoạt bậc thang hàng tháng cho khách hàng như sau:
- Bậc 1 (từ $0$ đến $50 text(" kWh")$ đầu tiên): Giá $1.800$ đồng/kWh.
- Bậc 2 (từ trên $50$ đến $100 text(" kWh")$ tiếp theo): Giá $1.900$ đồng/kWh.
- Bậc 3 (từ trên $100 text(" kWh")$ trở lên): Giá $2.200$ đồng/kWh.
Gọi $E(x)$ (đồng) là số tiền điện một hộ gia đình phải trả khi tiêu thụ $x text(" (kWh)")$ điện trong tháng ($x > 0$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu hộ gia đình tiêu thụ $40 text(" kWh")$ điện trong tháng thì số tiền phải trả là $72.000$ đồng.]),
    True([Nếu hộ gia đình tiêu thụ $80 text(" kWh")$ điện trong tháng thì số tiền phải trả là $147.000$ đồng.]),
    True([Khi hộ gia đình tiêu thụ $x > 100 text(" kWh")$, hàm số tính tiền điện là $E(x) = 2.200x - 35.000 text(" (đồng)")$.]),
    [Nếu hộ gia đình nhận hóa đơn tiền điện là $350.000$ đồng thì lượng điện đã tiêu thụ là $160 text(" kWh")$.]
  ),
  loigiai: [
    #step([Tính tiền điện khi x = 40 kWh])
    Vì $40 <= 50$ (thuộc Bậc 1): $E(40) = 40 times 1.800 = 72.000$ đồng. Mệnh đề a ĐÚNG.

    #step([Tính tiền điện khi x = 80 kWh])
    Vì $50 < 80 <= 100$ (thuộc Bậc 2):
    $E(80) = 50 times 1.800 + (80 - 50) times 1.900 = 90.000 + 30 times 1.900 = 90.000 + 57.000 = 147.000$ đồng. Mệnh đề b ĐÚNG.

    #step([Lập công thức khi x > 100 kWh])
    Tiền điện khi dùng hết $100 text(" kWh")$ đầu: $50(1.800) + 50(1.900) = 90.000 + 95.000 = 185.000$ đồng.
    Với $x > 100$:
    $E(x) = 185.000 + (x - 100) times 2.200 = 2.200x + 185.000 - 220.000 = 2.200x - 35.000$ đồng. Mệnh đề c ĐÚNG.

    #step([Tìm lượng điện khi tiền điện là 350.000 đồng])
    Vì $350.000 > 185.000$ nên $x > 100$:
    $ 2.200x - 35.000 = 350.000 <=> 2.200x = 385.000 <=> x = 385.000 / 2.200 = 175 text(" kWh") != 160 text(" kWh") $
    Khẳng định $160 text(" kWh")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Khảo sát tính đơn điệu hàm phân thức bậc nhất trên bậc nhất)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = (2x - 1) / (x + 1)$ xác định trên $D = RR setminus {-1}$.
Lấy hai số thực phân biệt $x_1, x_2 in D$ ($x_1 != x_2$).
Tỉ số biến thiên được xác định bởi:
$ H = (f(x_2) - f(x_1)) / (x_2 - x_1) $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tỉ số biến thiên $H$ rút gọn được dưới dạng $H = 3 / ((x_1 + 1)(x_2 + 1))$.]),
    True([Hàm số $f(x)$ đồng biến trên khoảng $(-infinity; -1)$.]),
    True([Hàm số $f(x)$ đồng biến trên khoảng $(-1; +infinity)$.]),
    [Hàm số $f(x)$ đồng biến trên toàn bộ tập xác định $D = RR setminus {-1}$.]
  ),
  loigiai: [
    #step([Rút gọn tỉ số biến thiên H])
    $f(x_2) - f(x_1) = (2x_2 - 1) / (x_2 + 1) - (2x_1 - 1) / (x_1 + 1)$
    $= ((2x_2 - 1)(x_1 + 1) - (2x_1 - 1)(x_2 + 1)) / ((x_1 + 1)(x_2 + 1))$
    $= (2x_1 x_2 + 2x_2 - x_1 - 1 - (2x_1 x_2 + 2x_1 - x_2 - 1)) / ((x_1 + 1)(x_2 + 1))$
    $= (3(x_2 - x_1)) / ((x_1 + 1)(x_2 + 1))$.
    Suy ra $H = (f(x_2) - f(x_1)) / (x_2 - x_1) = 3 / ((x_1 + 1)(x_2 + 1))$. Mệnh đề a ĐÚNG.

    #step([Xét trên khoảng (-infinity; -1)])
    Với mọi $x_1, x_2 in (-infinity; -1)$, ta có $x_1 + 1 < 0$ và $x_2 + 1 < 0$.
    Tích $(x_1 + 1)(x_2 + 1) > 0$, suy ra $H > 0$.
    Do đó hàm số đồng biến trên khoảng $(-infinity; -1)$. Mệnh đề b ĐÚNG.

    #step([Xét trên khoảng (-1; +infinity)])
    Với mọi $x_1, x_2 in (-1; +infinity)$, ta có $x_1 + 1 > 0$ và $x_2 + 1 > 0$.
    Tích $(x_1 + 1)(x_2 + 1) > 0$, suy ra $H > 0$.
    Do đó hàm số đồng biến trên khoảng $(-1; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Kết luận về sự đồng biến trên toàn tập xác định D])
    Theo quy tắc giải tích, tính đồng biến/nghịch biến chỉ được khẳng định trên từng khoảng rời nhau, không được kết luận trên tập hợp rời rạc $RR setminus {-1}$ hay trên hợp hai khoảng.
    Thật vậy, lấy $x_1 = -2 < -1$ ($f(-2) = 5$) và $x_2 = 0 > -1$ ($f(0) = -1$).
    Ta thấy $x_1 < x_2$ nhưng $f(x_1) = 5 > f(x_2) = -1$, vi phạm định nghĩa đồng biến.
    Do đó khẳng định hàm số đồng biến trên $D = RR setminus {-1}$ là hoàn toàn SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số giá trị nguyên thuộc tập xác định)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số $y = sqrt(x + 3) + sqrt(8 - x)$.
Hỏi có bao nhiêu số nguyên $x$ thuộc tập xác định của hàm số đã cho?],
    [12],
    loigiai: [
        #step([Tìm tập xác định])
        Hàm số xác định khi:
        $ cases(x + 3 >= 0, 8 - x >= 0) <=> cases(x >= -3, x <= 8) <=> -3 <= x <= 8 $
        Tập xác định là đoạn $D = [-3; 8]$.
        
        #step([Đếm số nguyên])
        Số phần tử nguyên thuộc đoạn $[-3; 8]$ là:
        $ 8 - (-3) + 1 = 12 $
    ]
)

// TLN 2 (Tính giá trị biểu thức phân nhánh)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Cho hàm số xác định theo công thức:
$ f(x) = cases(
  x^2 - 3x &text("khi") x >= 3,
  2x + 1 &text("khi") x < 3
) $
Tính giá trị của biểu thức $A = 2 f(4) - 3 f(-1)$.],
    [11],
    loigiai: [
        #step([Tính f(4)])
        Vì $4 >= 3$ nên: $f(4) = 4^2 - 3(4) = 16 - 12 = 4$.
        
        #step([Tính f(-1)])
        Vì $-1 < 3$ nên: $f(-1) = 2(-1) + 1 = -2 + 1 = -1$.
        
        #step([Tính giá trị biểu thức A])
        $ A = 2(4) - 3(-1) = 8 + 3 = 11 $
    ]
)

// TLN 3 (Hệ số góc của đường thẳng đi qua 2 điểm)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Trong mặt phẳng tọa độ $O x y$, đồ thị của hàm số bậc nhất $y = a x + b$ đi qua hai điểm $A(1; 3)$ và $B(3; 7)$.
Tìm giá trị của hệ số góc $a$.],
    [2],
    loigiai: [
        #step([Lập hệ phương trình tìm a và b])
        Vì đồ thị đi qua $A(1; 3)$ và $B(3; 7)$ nên:
        $ cases(a(1) + b = 3, a(3) + b = 7) <=> cases(a + b = 3, 3a + b = 7) $
        
        #step([Giải hệ phương trình])
        Lấy phương trình dưới trừ phương trình trên:
        $ 2a = 4 <=> a = 2 $
        (Suy ra $b = 1$). Vậy hệ số góc là $a = 2$.
    ]
)

// TLN 4 (Tham số m nguyên lớn nhất)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tìm giá trị nguyên lớn nhất của tham số $m$ để hàm số $y = sqrt(x - 2m + 6)$ xác định với mọi $x in [4; +infinity)$.],
    [5],
    loigiai: [
        #step([Điều kiện xác định của hàm số])
        Hàm số xác định khi $x - 2m + 6 >= 0 <=> x >= 2m - 6$.
        Tập xác định là $D = [2m - 6; +infinity)$.
        
        #step([Điều kiện xác định trên $[4; +infinity)$])
        Để hàm số xác định với mọi $x in [4; +infinity)$ thì:
        $ [4; +infinity) subset [2m - 6; +infinity) <=> 2m - 6 <= 4 <=> 2m <= 10 <=> m <= 5 $
        
        #step([Tìm m nguyên lớn nhất])
        Vì $m in ZZ$ và $m <= 5$ nên giá trị nguyên lớn nhất của $m$ là $m = 5$.
    ]
)

// TLN 5 (Nồng độ cồn giảm theo thời gian)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Nồng độ cồn trong hơi thở của một người sau $t text(" (giờ)")$ kể từ thời điểm ngừng uống rượu được mô hình hóa bởi hàm số bậc nhất:
$ C(t) = 0.45 - 0.05t text(" (mg/l khí thở)") $
Hỏi sau bao nhiêu giờ thì nồng độ cồn trong hơi thở của người đó giảm về mức $0 text(" mg/l")$?],
    [9],
    loigiai: [
        #step([Điều kiện nồng độ cồn bằng 0])
        Cho $C(t) = 0$:
        $ 0.45 - 0.05t = 0 <=> 0.05t = 0.45 <=> t = 0.45 / 0.05 = 9 text(" giờ") $
        Vậy sau $9$ giờ thì nồng độ cồn trong hơi thở giảm hoàn toàn về $0$.
    ]
)

// TLN 6 (Tung độ giao điểm với trục tung)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 138], back-to: "sec-exercise-hub",[Tìm tung độ giao điểm của parabol $y = 2x^2 - 5x + 3$ với trục tung $O y$.],
    [3],
    loigiai: [
        #step([Xác định tung độ giao điểm])
        Giao điểm của đồ thị với trục tung $O y$ ứng với hoành độ $x = 0$:
        $ y = 2(0)^2 - 5(0) + 3 = 3 $
        Vậy tung độ giao điểm là $y = 3$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 15: HÀM SỐ VÀ ĐỒ THỊ (ĐỀ SỐ 16B - VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
