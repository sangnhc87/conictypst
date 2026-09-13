// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20B - VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 150  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20B - VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 150",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 150]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = sqrt(x^2 - 4x + 3) + 1 / sqrt(5 - x)$ là],
    (
        True([$(-infinity; 1] union [3; 5)$]),
        [$[1; 3] union [3; 5)$],
        [$(-infinity; 1) union (3; 5)$],
        [$[1; 5)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi:
        $ cases(x^2 - 4x + 3 >= 0, 5 - x > 0) <=> cases((x - 1)(x - 3) >= 0, x < 5) <=> cases(x <= 1 text(" hoặc ") x >= 3, x < 5) $
        Giao hai tập nghiệm: $D = (-infinity; 1] union [3; 5)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Cho parabol $(P): y = a x^2 + b x + 2$ có tọa độ đỉnh là $I(2; -2)$. Tổng $a + b$ bằng],
    (
        True([$-3$]),
        [$3$],
        [$-1$],
        [$5$]
    ),
    loigiai: [
        - Hoành độ đỉnh $x_I = - b / (2a) = 2 <=> b = -4a$.
        - Đỉnh $I(2; -2)$ thuộc parabol nên:
        $ a(2)^2 + b(2) + 2 = -2 <=> 4a + 2b = -4 $
        Thay $b = -4a$ vào:
        $ 4a + 2(-4a) = -4 <=> -4a = -4 <=> a = 1 $
        Suy ra $b = -4(1) = -4$.
        Vậy $a + b = 1 + (-4) = -3$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Giá trị lớn nhất của hàm số bậc hai $y = -2x^2 + 4x + 1$ trên đoạn $[0; 3]$ bằng],
    (
        True([$3$]),
        [$1$],
        [$-5$],
        [$4$]
    ),
    loigiai: [
        Hoành độ đỉnh: $x_I = - 4 / (2(-2)) = 1 in [0; 3]$.
        Vì $a = -2 < 0$ nên hàm số đạt giá trị lớn nhất tại đỉnh $x = 1$:
        $ y(1) = -2(1)^2 + 4(1) + 1 = 3 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tập nghiệm của bất phương trình $(x^2 - 1)(x^2 - 4) <= 0$ là],
    (
        True([$[-2; -1] union [1; 2]$]),
        [$[-2; 2]$],
        [$[-1; 1]$],
        [$(-infinity; -2] union [2; +infinity)$]
    ),
    loigiai: [
        Đặt $t = x^2 >= 0$. Bất phương trình trở thành:
        $ (t - 1)(t - 4) <= 0 <=> 1 <= t <= 4 $
        Do đó:
        $ 1 <= x^2 <= 4 <=> cases(x^2 >= 1, x^2 <= 4) <=> cases(x <= -1 text(" hoặc ") x >= 1, -2 <= x <= 2) <=> x in [-2; -1] union [1; 2] $
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để tam thức bậc hai $f(x) = x^2 - 2(m + 1)x + 3m + 1$ luôn nhận giá trị DƯƠNG với mọi số thực $x in RR$.],
    (
        True([$0 < m < 1$]),
        [$m > 1$],
        [$m < 0$],
        [$0 <= m <= 1$]
    ),
    loigiai: [
        Hệ số $a = 1 > 0$. Tam thức $f(x) > 0$ với mọi $x in RR$ khi và chỉ khi:
        $ Delta' < 0 <=> (-(m + 1))^2 - 1 cdot (3m + 1) < 0 $
        $ <=> (m^2 + 2m + 1) - 3m - 1 < 0 <=> m^2 - m < 0 <=> m(m - 1) < 0 <=> 0 < m < 1 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sqrt(3x^2 - 7x + 2) = x - 2$ là],
    (
        True([$x = 2$]),
        [$x = -1/2$],
        [$x = 3$],
        [$x = 1$]
    ),
    loigiai: [
        Điều kiện: $x - 2 >= 0 <=> x >= 2$.
        Bình phương hai vế:
        $ 3x^2 - 7x + 2 = (x - 2)^2 <=> 3x^2 - 7x + 2 = x^2 - 4x + 4 <=> 2x^2 - 3x - 2 = 0 $
        $ <=> (2x + 1)(x - 2) = 0 <=> cases(x = 2, x = -1/2) $
        Đối chiếu điều kiện $x >= 2$, ta loại $x = -1/2$ và nhận $x = 2$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $sqrt(2x^2 - 3x - 2) = sqrt(x^2 - x + 1)$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ 2x^2 - 3x - 2 = x^2 - x + 1 <=> x^2 - 2x - 3 = 0 <=> cases(x = -1, x = 3) $
        Thử lại vào phương trình ban đầu:
        - Với $x = -1$: $x^2 - x + 1 = 1 + 1 + 1 = 3 > 0$ và $2(-1)^2 - 3(-1) - 2 = 3 > 0$ (thỏa mãn).
        - Với $x = 3$: $x^2 - x + 1 = 9 - 3 + 1 = 7 > 0$ và $2(3)^2 - 3(3) - 2 = 7 > 0$ (thỏa mãn).
        Vậy phương trình có đúng $2$ nghiệm.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Cho parabol $(P): y = a x^2 + b x + c$ đi qua ba điểm $A(0; 1)$, $B(1; 2)$ và $C(2; 5)$. Giá trị $y(3)$ bằng],
    (
        True([$10$]),
        [$8$],
        [$9$],
        [$11$]
    ),
    loigiai: [
        - Đi qua $A(0; 1) => c = 1$.
        - Đi qua $B(1; 2) => a + b + 1 = 2 <=> a + b = 1$.
        - Đi qua $C(2; 5) => 4a + 2b + 1 = 5 <=> 4a + 2b = 4 <=> 2a + b = 2$.
        Giải hệ phương trình:
        $ cases(a + b = 1, 2a + b = 2) <=> cases(a = 1, b = 0) $
        Hàm số là $y = x^2 + 1$.
        Khi đó $y(3) = 3^2 + 1 = 10$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Số nghiệm nguyên của bất phương trình $-x^2 + 8x - 12 >= 0$ là],
    (
        True([$5$]),
        [$4$],
        [$6$],
        [$3$]
    ),
    loigiai: [
        Nhân hai vế với $-1$:
        $ x^2 - 8x + 12 <= 0 <=> (x - 2)(x - 6) <= 0 <=> 2 <= x <= 6 $
        Các nghiệm nguyên là: $x in \{2; 3; 4; 5; 6\}$.
        Tổng cộng có đúng $5$ nghiệm nguyên.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tọa độ các giao điểm của parabol $(P): y = x^2 - 2x - 3$ và đường thẳng $d: y = x + 1$ là],
    (
        True([$(-1; 0)$ và $(4; 5)$]),
        [$(1; 2)$ và $(4; 5)$],
        [$(-1; 0)$ và $(-4; -3)$],
        [$(0; -3)$ và $(1; 2)$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm:
        $ x^2 - 2x - 3 = x + 1 <=> x^2 - 3x - 4 = 0 <=> cases(x = -1, x = 4) $
        - Với $x = -1 => y = -1 + 1 = 0 => (-1; 0)$.
        - Với $x = 4 => y = 4 + 1 = 5 => (4; 5)$.
        Vậy hai giao điểm là $(-1; 0)$ và $(4; 5)$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Quỹ đạo bay của một quả bóng rổ được ném đi từ độ cao $2 text(" m")$ được mô tả bởi phương trình:
$ h(x) = -0.1 x^2 + x + 2 text(" (m)") $
trong đó $x text(" (m)")$ là khoảng cách theo phương ngang tính từ vị trí ném.
Độ cao lớn nhất mà quả bóng đạt được trong quỹ đạo bay là],
    (
        True([$4.5 text(" m")$]),
        [$4 text(" m")$],
        [$5 text(" m")$],
        [$3.5 text(" m")$]
    ),
    loigiai: [
        Hàm số bậc hai $h(x) = -0.1 x^2 + x + 2$ có $a = -0.1 < 0$.
        Đạt cực đại tại hoành độ đỉnh:
        $ x_I = - 1 / (2(-0.1)) = 5 text(" m") $
        Độ cao lớn nhất đạt được là:
        $ h(5) = -0.1(5)^2 + 5 + 2 = -2.5 + 7 = 4.5 text(" m") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình $sqrt(x^2 - 2m x + m^2 + 1) = 2$ có đúng hai nghiệm phân biệt.],
    (
        True([Với mọi $m in RR$]),
        [$m > 0$],
        [$m != 0$],
        [$m > 1$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ x^2 - 2m x + m^2 + 1 = 4 <=> (x - m)^2 + 1 = 4 <=> (x - m)^2 = 3 $
        $ <=> x - m = plus.minus sqrt(3) <=> cases(x_1 = m - sqrt(3), x_2 = m + sqrt(3)) $
        Vì $sqrt(3) > 0$ nên $x_1 != x_2$ với mọi giá trị của tham số $m$.
        Vậy phương trình luôn có đúng $2$ nghiệm phân biệt với mọi $m in RR$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Quỹ đạo bóng bay và dấu tam thức)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Một quả bóng được đá lên từ mặt đất, quỹ đạo bay của quả bóng được mô hình hóa bởi hàm số:
$ y = f(x) = -x^2 + 4x $
trong đó $x text(" (m)")$ là khoảng cách ngang tính từ vị trí đá và $y text(" (m)")$ là độ cao của bóng so với mặt đất.
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-0.5, 0), (5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -0.5), (0, 5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.8, -0.3), [$x text(" (m)")$])
  content((-0.4, 4.8), [$y text(" (m)")$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = -x^2 + 4x
  line(..range(0, 41).map(t => {
    let x = t / 10;
    (x, -calc.pow(x, 2) + 4 * x)
  }), stroke: 1.5pt + rgb("0d9488"))
  
  // Đỉnh I(2; 4)
  circle((2, 4), radius: 2.5pt, fill: rgb("0d9488"))
  line((2, 0), (2, 4), stroke: (dash: "dashed", paint: gray))
  line((0, 4), (2, 4), stroke: (dash: "dashed", paint: gray))
  content((2, -0.3), [$2$])
  content((-0.3, 4), [$4$])
  content((2.5, 4.3), [$I(2; 4)$])
  
  // Điểm chạm đất (4; 0)
  circle((4, 0), radius: 2pt, fill: rgb("0d9488"))
  content((4, -0.3), [$4$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Quả bóng chạm đất tại vị trí cách vị trí đá một khoảng ngang bằng $4 text(" m")$.]),
    True([Độ cao cực đại mà quả bóng đạt được trong suốt quỹ đạo là $4 text(" m")$ tại vị trí cách điểm đá $2 text(" m")$.]),
    True([Bóng đạt độ cao từ $3 text(" m")$ trở lên khi khoảng cách ngang $x$ thỏa mãn $1 text(" m") <= x <= 3 text(" m")$.]),
    [Khoảng cách ngang mà quả bóng duy trì độ cao từ $3 text(" m")$ trở lên là $3 text(" m")$.]
  ),
  loigiai: [
    #step([Vị trí chạm đất])
    $f(x) = 0 <=> -x^2 + 4x = 0 <=> x(-x + 4) = 0 <=> cases(x = 0 text(" (điểm đá)"), x = 4 text(" (chạm đất)"))$. Mệnh đề a ĐÚNG.

    #step([Độ cao cực đại])
    Đỉnh parabol $x_I = - 4 / (2(-1)) = 2$, tung độ đỉnh $y_I = 4$. Bóng đạt độ cao cực đại $4 text(" m")$ tại $x = 2 text(" m")$. Mệnh đề b ĐÚNG.

    #step([Độ cao từ 3m trở lên])
    $f(x) >= 3 <=> -x^2 + 4x >= 3 <=> x^2 - 4x + 3 <= 0 <=> (x - 1)(x - 3) <= 0 <=> 1 <= x <= 3$. Mệnh đề c ĐÚNG.

    #step([Chiều dài khoảng duy trì độ cao])
    Khoảng cách ngang bóng duy trì độ cao từ $3 text(" m")$ trở lên là:
    $ Delta x = 3 - 1 = 2 text(" m") $ (chứ không phải bằng $3 text(" m")$).
    Khẳng định khoảng cách là $3 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình quy về bậc hai)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(3x^2 - 4x + 2) = 2x - 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= 1/2$.]),
    True([Bình phương hai vế đưa về phương trình bậc hai $x^2 - 1 = 0$.]),
    True([Phương trình bậc hai $x^2 - 1 = 0$ có hai nghiệm là $x = -1$ và $x = 1$.]),
    [Cả hai giá trị $x = -1$ và $x = 1$ đều là nghiệm của phương trình ban đầu.]
  ),
  loigiai: [
    #step([Điều kiện có nghiệm])
    Vế phải không âm: $2x - 1 >= 0 <=> x >= 1/2$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $3x^2 - 4x + 2 = (2x - 1)^2 <=> 3x^2 - 4x + 2 = 4x^2 - 4x + 1 <=> x^2 - 1 = 0$. Mệnh đề b ĐÚNG.

    #step([Giải phương trình bậc hai])
    $x^2 - 1 = 0 <=> x = plus.minus 1$. Mệnh đề c ĐÚNG.

    #step([Đối chiếu điều kiện])
    - Với $x = -1$: Không thỏa mãn điều kiện $x >= 1/2$ (loại).
    - Với $x = 1$: Thỏa mãn $x >= 1/2$ (nhận).
    Phương trình chỉ có duy nhất nghiệm $x = 1$.
    Khẳng định cả hai giá trị đều là nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh tour du lịch)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Một công ty du lịch tổ chức tour tham quan với chính sách giá ưu đãi theo nhóm:
Nếu đoàn có đúng $40$ khách thì giá vé trọn gói là $500$ nghìn đồng/khách.
Cứ thêm $1$ khách tham gia thì giá vé của mỗi khách trong toàn đoàn sẽ được giảm $5$ nghìn đồng.
Gọi $x$ là số khách tăng thêm so với $40$ khách ban đầu ($x in NN, 0 <= x <= 30$).
Số khách trong đoàn là $40 + x$ (người) và giá vé mỗi khách là $500 - 5x$ (nghìn đồng).
Biết chi phí cố định tổ chức tour là $5.000$ nghìn đồng và chi phí biến đổi cho mỗi khách là $100$ nghìn đồng:
$ C(x) = 5000 + 100(40 + x) = 100x + 9000 text(" (nghìn đồng)") $
Lợi nhuận của công ty được tính bởi công thức:
$ L(x) = (40 + x)(500 - 5x) - (100x + 9000) = -5x^2 + 200x + 11000 text(" (nghìn đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu có thêm $10$ khách ($x = 10$) thì giá vé mỗi khách là $450$ nghìn đồng và đoàn có $50$ người.]),
    True([Công thức của hàm lợi nhuận theo $x$ là $L(x) = -5x^2 + 200x + 11000 text(" (nghìn đồng)")$.]),
    True([Công ty đạt mức lợi nhuận tối đa khi có thêm đúng $20$ khách tham gia đoàn (tức cả đoàn có $60$ người).]),
    [Mức lợi nhuận tối đa của công ty trong chuyến đi có thể đạt tới $15.000.000$ đồng.]
  ),
  loigiai: [
    #step([Kiểm tra khi x = 10])
    Giá vé: $500 - 5(10) = 450$ nghìn đồng.
    Tổng số khách: $40 + 10 = 50$ người. Mệnh đề a ĐÚNG.

    #step([Hàm lợi nhuận])
    Doanh thu: $R(x) = (40 + x)(500 - 5x) = 20000 - 200x + 500x - 5x^2 = -5x^2 + 300x + 20000$.
    Chi phí: $C(x) = 100x + 9000$.
    Lợi nhuận: $L(x) = R(x) - C(x) = -5x^2 + 200x + 11000$ (nghìn đồng). Mệnh đề b ĐÚNG.

    #step([Tìm số khách tăng thêm để lợi nhuận tối đa])
    Hàm số bậc hai có $a = -5 < 0$ đạt cực đại tại:
    $ x_I = - 200 / (2(-5)) = 20 text(" khách") $
    Tổng số khách của đoàn khi đó là: $40 + 20 = 60$ người. Mệnh đề c ĐÚNG.

    #step([Tính lợi nhuận tối đa])
    Lợi nhuận cực đại:
    $ L(20) = -5(20)^2 + 200(20) + 11000 = -2000 + 4000 + 11000 = 13000 text(" nghìn đồng") = 13.000.000 text(" đồng") $
    Mức lợi nhuận tối đa là $13$ triệu đồng $< 15$ triệu đồng.
    Khẳng định có thể đạt $15.000.000$ đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số trong tam thức bậc hai)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Cho hàm số bậc hai chứa tham số: $f(x) = (m - 2)x^2 - 2(m - 2)x + 2m - 5$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 2$, hàm số trở thành $f(x) = -1 < 0$ với mọi số thực $x in RR$.]),
    True([Khi $m != 2$, biệt thức thu gọn của tam thức là $Delta' = -(m - 2)(m - 3)$.]),
    True([Điều kiện để $f(x) <= 0$ với mọi $x in RR$ là $m <= 2$.]),
    [Có đúng $5$ giá trị nguyên của tham số $m in [0; 5]$ để $f(x) <= 0$ với mọi $x in RR$.]
  ),
  loigiai: [
    #step([Khi m = 2])
    Thay $m = 2$: $f(x) = 0 cdot x^2 - 0 cdot x + 2(2) - 5 = -1 < 0$ với mọi $x in RR$. Mệnh đề a ĐÚNG.

    #step([Khi m != 2])
    $Delta' = (-(m - 2))^2 - (m - 2)(2m - 5) = (m - 2)[(m - 2) - (2m - 5)] = (m - 2)(3 - m) = -(m - 2)(m - 3)$. Mệnh đề b ĐÚNG.

    #step([Điều kiện f(x) <= 0 với mọi x])
    - Trường hợp 1: $m = 2$ thỏa mãn.
    - Trường hợp 2: $m != 2$, cần:
    $ cases(a = m - 2 < 0, Delta' <= 0) <=> cases(m < 2, -(m - 2)(m - 3) <= 0) <=> cases(m < 2, (m - 2)(m - 3) >= 0) $
    Vì $m < 2$ nên $m - 2 < 0$ và $m - 3 < 0$, tích $(m - 2)(m - 3) > 0$ luôn thỏa mãn với mọi $m < 2$.
    Kết hợp cả hai trường hợp ta được điều kiện là: $m <= 2$. Mệnh đề c ĐÚNG.

    #step([Đếm số giá trị nguyên])
    Với $m <= 2$ và $m in [0; 5]$, các số nguyên thỏa mãn là $m in \{0; 1; 2\}$ (chỉ có đúng $3$ giá trị).
    Khẳng định có đúng $5$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (GTLN trên đoạn)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm giá trị lớn nhất của hàm số $y = -x^2 + 4x + 5$ trên đoạn $[0; 4]$.],
    [9],
    loigiai: [
        #step([Xác định hoành độ đỉnh])
        $x_I = - 4 / (2(-1)) = 2 in [0; 4]$.
        
        #step([Tính giá trị lớn nhất])
        Vì $a = -1 < 0$ nên giá trị lớn nhất đạt tại đỉnh $x = 2$:
        $ y(2) = -(2)^2 + 4(2) + 5 = -4 + 8 + 5 = 9 $
    ]
)

// TLN 2 (Số nghiệm nguyên)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của bất phương trình:
$ (x^2 - 5x + 4)(x^2 - 9) <= 0 $],
    [7],
    loigiai: [
        #step([Tìm nghiệm các nhân tử])
        - $x^2 - 5x + 4 = 0 <=> x = 1$ hoặc $x = 4$.
        - $x^2 - 9 = 0 <=> x = plus.minus 3$.
        
        #step([Lập bảng xét dấu])
        Sắp xếp các nghiệm: $-3, 1, 3, 4$.
        Biểu thức mang dấu âm ($<= 0$) khi:
        $ x in [-3; 1] union [3; 4] $
        
        #step([Đếm số nghiệm nguyên])
        - Trên $[-3; 1]$: $-3, -2, -1, 0, 1$ ($5$ số).
        - Trên $[3; 4]$: $3, 4$ ($2$ số).
        Tổng cộng có: $5 + 2 = 7$ nghiệm nguyên.
    ]
)

// TLN 3 (Nghiệm của phương trình căn)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm nghiệm của phương trình:
$ sqrt(3x^2 - 5x + 2) = x - 1 $],
    [1],
    loigiai: [
        #step([Điều kiện có nghiệm])
        $x - 1 >= 0 <=> x >= 1$.
        
        #step([Bình phương hai vế])
        $ 3x^2 - 5x + 2 = (x - 1)^2 <=> 3x^2 - 5x + 2 = x^2 - 2x + 1 $
        $ <=> 2x^2 - 3x + 1 = 0 <=> (2x - 1)(x - 1) = 0 <=> cases(x = 1/2, x = 1) $
        
        #step([Đối chiếu điều kiện])
        Vì $x >= 1$ nên ta loại $x = 1/2$ và nhận $x = 1$.
        Vậy nghiệm là $x = 1$.
    ]
)

// TLN 4 (Toán thực tế lợi nhuận tối đa)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Trong bài toán kinh doanh tour du lịch, lợi nhuận lớn nhất mà công ty có thể thu về trong chuyến đi là bao nhiêu triệu đồng?],
    [13],
    loigiai: [
        #step([Tìm cực đại của hàm lợi nhuận])
        Hàm lợi nhuận: $L(x) = -5x^2 + 200x + 11000$ (nghìn đồng).
        Đạt giá trị lớn nhất tại $x = 20$.
        
        #step([Tính giá trị cực đại])
        $ L(20) = -5(20)^2 + 200(20) + 11000 = 13000 text(" nghìn đồng") = 13 text(" triệu đồng") $
    ]
)

// TLN 5 (Số giá trị nguyên của m để tập xác định là R)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = sqrt(x^2 - 2(m + 1)x + 4m + 5)$ có tập xác định là toàn bộ trục số thực $RR$.],
    [5],
    loigiai: [
        #step([Điều kiện để tập xác định là R])
        Biểu thức dưới căn không âm với mọi $x in RR$:
        $ x^2 - 2(m + 1)x + 4m + 5 >= 0 forall x in RR $
        Vì $a = 1 > 0$, điều kiện tương đương:
        $ Delta' <= 0 <=> (m + 1)^2 - (4m + 5) <= 0 <=> m^2 - 2m - 4 <= 0 $
        
        #step([Giải bất phương trình])
        $ 1 - sqrt(5) <= m <= 1 + sqrt(5) $
        Vì $sqrt(5) approx 2.24$ nên $-1.24 <= m <= 3.24$.
        
        #step([Đếm số giá trị nguyên])
        Các số nguyên thỏa mãn là $m in \{-1; 0; 1; 2; 3\}$.
        Tổng cộng có đúng $5$ giá trị nguyên.
    ]
)

// TLN 6 (Độ cao đỉnh đồi)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 150], back-to: "sec-exercise-hub",[Độ cao mặt cắt của một ngọn đồi so với mực nước biển tại vị trí cách chân đồi khoảng cách ngang $x text(" (m)")$ ($0 <= x <= 120$) được mô hình hóa bởi:
$ h(x) = -0.005 x^2 + 0.6 x + 20 text(" (m)") $
Hỏi đỉnh ngọn đồi cao bao nhiêu mét so với mực nước biển?],
    [38],
    loigiai: [
        #step([Xác định vị trí đỉnh đồi])
        Hàm số bậc hai $h(x) = -0.005 x^2 + 0.6 x + 20$ có $a = -0.005 < 0$.
        Đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x_I = - 0.6 / (2(-0.005)) = 0.6 / 0.01 = 60 text(" m") $
        
        #step([Tính độ cao lớn nhất])
        $ h(60) = -0.005(60)^2 + 0.6(60) + 20 = -0.005(3600) + 36 + 20 = -18 + 56 = 38 text(" m") $
        Vậy đỉnh đồi cao $38 text(" m")$ so với mực nước biển.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20B - VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
