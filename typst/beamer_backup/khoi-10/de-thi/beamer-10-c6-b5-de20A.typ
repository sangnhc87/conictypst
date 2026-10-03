// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20A - CƠ BẢN ĐẾN VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 149  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 149",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 149]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = sqrt(2x - 4) + 1 / (x - 3)$ là],
    (
        True([$[2; +infinity) setminus \{3\}$]),
        [$[2; +infinity)$],
        [$(2; +infinity) setminus \{3\}$],
        [$[2; 3)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi:
        $ cases(2x - 4 >= 0, x - 3 != 0) <=> cases(x >= 2, x != 3) $
        Vậy tập xác định là $D = [2; +infinity) setminus \{3\}$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tọa độ đỉnh $I$ của parabol $(P): y = x^2 - 4x + 1$ là],
    (
        True([$I(2; -3)$]),
        [$I(-2; 13)$],
        [$I(2; 3)$],
        [$I(-4; 1)$]
    ),
    loigiai: [
        Hoành độ đỉnh: $x_I = - (-4) / (2 cdot 1) = 2$.
        Tung độ đỉnh: $y_I = 2^2 - 4(2) + 1 = 4 - 8 + 1 = -3$.
        Vậy tọa độ đỉnh là $I(2; -3)$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Trục đối xứng của parabol $(P): y = -2x^2 + 8x - 5$ là đường thẳng],
    (
        True([$x = 2$]),
        [$x = -2$],
        [$x = 4$],
        [$y = 2$]
    ),
    loigiai: [
        Trục đối xứng của parabol $y = a x^2 + b x + c$ là đường thẳng $x = - b / (2a)$.
        Áp dụng: $x = - 8 / (2(-2)) = 2$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Hàm số bậc hai $y = -x^2 + 6x - 2$ đồng biến trên khoảng nào dưới đây?],
    (
        True([$(-infinity; 3)$]),
        [$(3; +infinity)$],
        [$(-infinity; 6)$],
        [$(0; 6)$]
    ),
    loigiai: [
        Hàm số có $a = -1 < 0$ và hoành độ đỉnh $x_I = - 6 / (2(-1)) = 3$.
        Bề lõm quay xuống dưới nên hàm số đồng biến trên khoảng $(-infinity; 3)$ và nghịch biến trên khoảng $(3; +infinity)$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tập nghiệm của bất phương trình bậc hai $x^2 - 7x + 10 <= 0$ là],
    (
        True([$[2; 5]$]),
        [$(2; 5)$],
        [$(-infinity; 2] union [5; +infinity)$],
        [$[-5; -2]$]
    ),
    loigiai: [
        Phương trình $x^2 - 7x + 10 = 0 <=> (x - 2)(x - 5) = 0 <=> cases(x = 2, x = 5)$.
        Hệ số $a = 1 > 0$. Bất phương trình $x^2 - 7x + 10 <= 0$ có tập nghiệm là $S = [2; 5]$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tam thức bậc hai nào sau đây luôn nhận giá trị DƯƠNG với mọi số thực $x in RR$?],
    (
        True([$f(x) = x^2 - 2x + 5$]),
        [$g(x) = x^2 - 4x + 4$],
        [$h(x) = -x^2 + 2x - 3$],
        [$k(x) = x^2 - 3x + 2$]
    ),
    loigiai: [
        Tam thức $f(x) = x^2 - 2x + 5$ có:
        $a = 1 > 0$ và $Delta' = (-1)^2 - 1(5) = 1 - 5 = -4 < 0$.
        Do $a > 0$ và $Delta' < 0$ nên $f(x) > 0$ với mọi $x in RR$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sqrt(2x^2 - 3x + 1) = x - 1$ là],
    (
        True([$x = 1$]),
        [$x = 0$],
        [$x = 2$],
        [$x = -1$]
    ),
    loigiai: [
        Điều kiện: $x - 1 >= 0 <=> x >= 1$.
        Bình phương hai vế:
        $ 2x^2 - 3x + 1 = (x - 1)^2 <=> 2x^2 - 3x + 1 = x^2 - 2x + 1 <=> x^2 - x = 0 <=> cases(x = 0, x = 1) $
        Đối chiếu điều kiện $x >= 1$, ta loại $x = 0$ và nhận $x = 1$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Số giao điểm của parabol $(P): y = x^2 - 3x + 2$ với trục hoành $O x$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm với $O x$:
        $ x^2 - 3x + 2 = 0 <=> (x - 1)(x - 2) = 0 <=> cases(x = 1, x = 2) $
        Phương trình có $2$ nghiệm phân biệt nên parabol cắt trục hoành tại $2$ điểm phân biệt $(1; 0)$ và $(2; 0)$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Biết đồ thị hàm số bậc hai $y = x^2 - 2x + m$ đi qua điểm $A(1; 3)$. Giá trị của tham số $m$ là],
    (
        True([$m = 4$]),
        [$m = 2$],
        [$m = -2$],
        [$m = 5$]
    ),
    loigiai: [
        Thay tọa độ điểm $A(1; 3)$ vào hàm số:
        $ 3 = 1^2 - 2(1) + m <=> 3 = -1 + m <=> m = 4 $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tập nghiệm của bất phương trình $(x - 3) / (x^2 - 4) <= 0$ là],
    (
        True([$(-infinity; -2) union (2; 3]$]),
        [$[-2; 2) union [3; +infinity)$],
        [$(-2; 2) union [3; +infinity)$],
        [$(-infinity; 3]$]
    ),
    loigiai: [
        Nghiệm tử: $x = 3$. Nghiệm mẫu: $x = plus.minus 2$.
        Lập bảng xét dấu:
        Biểu thức mang dấu âm trên $(-infinity; -2)$ và $(2; 3)$; bằng $0$ tại $x = 3$.
        Vậy tập nghiệm là $S = (-infinity; -2) union (2; 3]$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Một cây cầu treo có nhịp cầu dạng parabol với khoảng cách giữa hai chân cầu là $120 text(" m")$ và chiều cao vòm cầu tại điểm cao nhất là $20 text(" m")$.
Chọn hệ trục tọa độ $O x y$ có gốc $O$ tại chân cầu bên trái, trục $O x$ nằm ngang trùng với mặt sàn cầu.
Phương trình của vòm cầu là $y = - 1 / 180 x^2 + 2 / 3 x$.
Độ cao của vòm cầu tại điểm cách chân cầu bên trái một khoảng $30 text(" m")$ là],
    (
        True([$15 text(" m")$]),
        [$10 text(" m")$],
        [$12 text(" m")$],
        [$18 text(" m")$]
    ),
    loigiai: [
        Thay $x = 30 text(" m")$ vào phương trình vòm cầu:
        $ y(30) = - 1 / 180 (30)^2 + 2 / 3 (30) = - 900 / 180 + 20 = -5 + 20 = 15 text(" m") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tổng các nghiệm thực của phương trình $sqrt(3x^2 - 5x + 1) = sqrt(x^2 - 2x + 4)$ bằng],
    (
        True([$3/2$]),
        [$-3/2$],
        [$1$],
        [$2$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ 3x^2 - 5x + 1 = x^2 - 2x + 4 <=> 2x^2 - 3x - 3 = 0 $
        Biệt thức: $Delta = (-3)^2 - 4(2)(-3) = 9 + 24 = 33 > 0$.
        Mặt khác, vế phải $x^2 - 2x + 4 = (x - 1)^2 + 3 >= 3 > 0$ với mọi $x in RR$.
        Do đó cả hai nghiệm của phương trình bậc hai đều thỏa mãn.
        Theo định lý Viète, tổng các nghiệm là:
        $ x_1 + x_2 = - (-3) / 2 = 3/2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị parabol và dấu tam thức có CeTZ)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x) = x^2 - 2x - 3$ có đồ thị parabol $(P)$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-2.5, 0), (4.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -5), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.3, -0.3), [$x$])
  content((-0.3, 2.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = x^2 - 2x - 3
  line(..range(-15, 36).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 2) - 2 * x - 3)
  }), stroke: 1.5pt + rgb("1e40af"))
  
  // Nghiệm (-1; 0) và (3; 0)
  circle((-1, 0), radius: 2pt, fill: rgb("1e40af"))
  circle((3, 0), radius: 2pt, fill: rgb("1e40af"))
  content((-1, 0.3), [$-1$])
  content((3, 0.3), [$3$])
  
  // Đỉnh I(1; -4)
  circle((1, -4), radius: 2pt, fill: rgb("1e40af"))
  line((1, 0), (1, -4), stroke: (dash: "dashed", paint: gray))
  line((0, -4), (1, -4), stroke: (dash: "dashed", paint: gray))
  content((1, 0.3), [$1$])
  content((-0.3, -4), [$-4$])
  content((1.6, -4.2), [$I(1; -4)$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol $(P)$ là $I(1; -4)$.]),
    True([Hàm số đồng biến trên khoảng $(1; +infinity)$ và nghịch biến trên khoảng $(-infinity; 1)$.]),
    True([Tập nghiệm của bất phương trình $f(x) <= 0$ là đoạn $[-1; 3]$.]),
    [Đường thẳng $d: y = -5$ cắt parabol $(P)$ tại hai điểm phân biệt.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    $x_I = - (-2) / (2 cdot 1) = 1$; $y_I = 1 - 2 - 3 = -4$. Đỉnh $I(1; -4)$. Mệnh đề a ĐÚNG.

    #step([Sự biến thiên])
    Hệ số $a = 1 > 0$, parabol quay bề lõm lên trên nên hàm số nghịch biến trên $(-infinity; 1)$ và đồng biến trên $(1; +infinity)$. Mệnh đề b ĐÚNG.

    #step([Giải bất phương trình f(x) <= 0])
    Parabol cắt trục hoành tại $x = -1$ và $x = 3$.
    Phần đồ thị nằm phía dưới hoặc trên trục hoành tương ứng với $-1 <= x <= 3$. Mệnh đề c ĐÚNG.

    #step([Giao điểm với đường thẳng y = -5])
    Tung độ đỉnh $y_I = -4$ là giá trị nhỏ nhất của hàm số trên $RR$.
    Vì $-4 > -5$ nên parabol nằm hoàn toàn phía trên đường thẳng $y = -5$, hai đồ thị không có điểm chung nào.
    Khẳng định cắt tại hai điểm phân biệt là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình quy về bậc hai)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(2x^2 - 5x + 2) = x - 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= 1$.]),
    True([Bình phương hai vế đưa về phương trình bậc hai $x^2 - 3x + 1 = 0$.]),
    True([Phương trình bậc hai $x^2 - 3x + 1 = 0$ có hai nghiệm phân biệt là $x = (3 plus.minus sqrt(5)) / 2$.]),
    [Cả hai giá trị $x = (3 - sqrt(5)) / 2$ và $x = (3 + sqrt(5)) / 2$ đều là nghiệm của phương trình ban đầu.]
  ),
  loigiai: [
    #step([Điều kiện có nghiệm])
    Vế phải không âm: $x - 1 >= 0 <=> x >= 1$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $2x^2 - 5x + 2 = (x - 1)^2 <=> 2x^2 - 5x + 2 = x^2 - 2x + 1 <=> x^2 - 3x + 1 = 0$. Mệnh đề b ĐÚNG.

    #step([Giải phương trình bậc hai])
    $Delta = (-3)^2 - 4(1)(1) = 5 > 0$. Nghiệm là $x_1 = (3 - sqrt(5)) / 2$ và $x_2 = (3 + sqrt(5)) / 2$. Mệnh đề c ĐÚNG.

    #step([Đối chiếu điều kiện])
    - Với $x_1 = (3 - sqrt(5)) / 2 approx 0.38 < 1$ (loại).
    - Với $x_2 = (3 + sqrt(5)) / 2 approx 2.62 >= 1$ (nhận).
    Phương trình ban đầu chỉ có duy nhất nghiệm $x_2$.
    Khẳng định cả hai đều là nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kinh doanh sản phẩm công nghệ)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Một công ty điện tử sản xuất chuột không dây công thái học.
Chi phí sản xuất $x$ nghìn con chuột mỗi tháng được cho bởi hàm số:
$ C(x) = x^2 + 30x + 400 text(" (triệu đồng)") $
Doanh thu từ việc bán hết $x$ nghìn con chuột với đơn giá $80$ nghìn đồng/con là $R(x) = 80x text(" (triệu đồng)")$.
Lợi nhuận mỗi tháng của công ty là:
$ L(x) = R(x) - C(x) = -x^2 + 50x - 400 text(" (triệu đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu sản xuất $10$ nghìn con chuột mỗi tháng thì công ty đạt trạng thái hòa vốn ($L(x) = 0$).]),
    True([Công ty sinh lời ($L(x) > 0$) khi sản lượng chuột sản xuất mỗi tháng nằm trong khoảng từ trên $10$ nghìn con đến dưới $40$ nghìn con.]),
    True([Lợi nhuận hàng tháng lớn nhất công ty có thể đạt được là $225$ triệu đồng khi sản xuất $25$ nghìn con chuột.]),
    [Khi sản xuất $50$ nghìn con chuột mỗi tháng thì công ty vẫn có lãi trên $100$ triệu đồng.]
  ),
  loigiai: [
    #step([Điểm hòa vốn])
    $L(x) = 0 <=> -x^2 + 50x - 400 = 0 <=> x^2 - 50x + 400 = 0 <=> (x - 10)(x - 40) = 0 <=> cases(x = 10, x = 40)$. Mệnh đề a ĐÚNG.

    #step([Khoảng sinh lời])
    $L(x) > 0 <=> -x^2 + 50x - 400 > 0 <=> 10 < x < 40$. Mệnh đề b ĐÚNG.

    #step([Lợi nhuận tối đa])
    Hàm số bậc hai có $a = -1 < 0$ đạt cực đại tại $x_I = - 50 / (2(-1)) = 25$ nghìn con chuột.
    Lợi nhuận tối đa: $L(25) = -(25)^2 + 50(25) - 400 = -625 + 1250 - 400 = 225$ triệu đồng. Mệnh đề c ĐÚNG.

    #step([Kiểm tra khi x = 50])
    Khi $x = 50$: $L(50) = -(50)^2 + 50(50) - 400 = -2500 + 2500 - 400 = -400$ triệu đồng.
    Công ty bị lỗ nặng $400$ triệu đồng chứ không hề có lãi.
    Khẳng định có lãi trên $100$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m để tam thức luôn cùng dấu)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Cho tam thức bậc hai: $f(x) = x^2 - 2(m + 1)x + 4m$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Biệt thức thu gọn của tam thức là $Delta' = (m - 1)^2$.]),
    True([Với mọi $m != 1$, phương trình $f(x) = 0$ luôn có hai nghiệm phân biệt là $x = 2$ và $x = 2m$.]),
    True([Bất phương trình $f(x) <= 0$ có nghiệm duy nhất khi và chỉ khi $m = 1$.]),
    [Tồn tại giá trị của tham số $m$ để tam thức $f(x) < 0$ với mọi số thực $x in RR$.]
  ),
  loigiai: [
    #step([Tính biệt thức thu gọn])
    $Delta' = (-(m + 1))^2 - 1(4m) = m^2 + 2m + 1 - 4m = m^2 - 2m + 1 = (m - 1)^2$. Mệnh đề a ĐÚNG.

    #step([Tìm nghiệm của phương trình f(x) = 0])
    Với $m != 1$, $Delta' > 0$. Hai nghiệm là:
    $x_1 = (m + 1) - (m - 1) = 2$ và $x_2 = (m + 1) + (m - 1) = 2m$. Mệnh đề b ĐÚNG.

    #step([Bất phương trình f(x) <= 0 có nghiệm duy nhất])
    Vì $a = 1 > 0$ nên $f(x) <= 0$ có nghiệm duy nhất khi và chỉ khi parabol tiếp xúc với $O x$:
    $Delta' = 0 <=> (m - 1)^2 = 0 <=> m = 1$. Mệnh đề c ĐÚNG.

    #step([Khả năng f(x) < 0 với mọi x])
    Để $f(x) < 0$ với mọi $x in RR$ thì bắt buộc hệ số $a < 0$.
    Tuy nhiên ở đây $a = 1 > 0$, nên tam thức không bao giờ có thể luôn âm trên $RR$.
    Khẳng định tồn tại giá trị của $m$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Giá trị nhỏ nhất trên đoạn)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tìm giá trị nhỏ nhất của hàm số $y = x^2 - 6x + 13$ trên đoạn $[0; 5]$.],
    [4],
    loigiai: [
        #step([Xác định hoành độ đỉnh])
        $x_I = - (-6) / (2 cdot 1) = 3$.
        Vì $3 in [0; 5]$ nên hàm số đạt giá trị nhỏ nhất tại đỉnh $x = 3$.
        
        #step([Tính giá trị nhỏ nhất])
        $ y(3) = 3^2 - 6(3) + 13 = 9 - 18 + 13 = 4 $
    ]
)

// TLN 2 (Số nghiệm nguyên của BPT)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của bất phương trình bậc hai $x^2 - 9x + 14 <= 0$.],
    [6],
    loigiai: [
        #step([Giải bất phương trình])
        $x^2 - 9x + 14 = 0 <=> (x - 2)(x - 7) = 0 <=> cases(x = 2, x = 7)$.
        Vì $a = 1 > 0$ nên tập nghiệm là $2 <= x <= 7$.
        
        #step([Đếm số nghiệm nguyên])
        Các số nguyên thỏa mãn là $x in \{2; 3; 4; 5; 6; 7\}$.
        Số nghiệm nguyên là: $7 - 2 + 1 = 6$ nghiệm.
    ]
)

// TLN 3 (Nghiệm của phương trình căn)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tìm nghiệm của phương trình:
$ sqrt(2x^2 + 5x - 3) = x + 1 $],
    [1],
    loigiai: [
        #step([Điều kiện có nghiệm])
        $x + 1 >= 0 <=> x >= -1$.
        
        #step([Bình phương hai vế])
        $ 2x^2 + 5x - 3 = (x + 1)^2 <=> 2x^2 + 5x - 3 = x^2 + 2x + 1 $
        $ <=> x^2 + 3x - 4 = 0 <=> (x - 1)(x + 4) = 0 <=> cases(x = 1, x = -4) $
        
        #step([Đối chiếu điều kiện])
        Vì $x >= -1$ nên ta loại $x = -4$ và nhận $x = 1$.
        Vậy nghiệm là $x = 1$.
    ]
)

// TLN 4 (Toán thực tế chiều cao cổng chào parabol)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Một cổng chào hình parabol có chiều rộng ở chân cổng là $8 text(" m")$ và chiều cao tính từ mặt đất đến đỉnh cổng là $6 text(" m")$.
Một xe tải chở hàng dạng khối hộp chữ nhật có chiều rộng $4 text(" m")$ đi qua chính giữa cổng chào.
Hỏi chiều cao tối đa của thùng xe tải theo đơn vị mét là bao nhiêu để xe có thể đi lọt qua cổng mà không chạm vào vòm cổng? (Nhập kết quả dưới dạng số thập phân)],
    [4.5],
    loigiai: [
        #step([Thiết lập hệ tọa độ và phương trình parabol])
        Chọn hệ trục $O x y$ có trục tung $O y$ trùng với trục đối xứng của cổng, gốc $O$ tại trung điểm chân cổng trên mặt đất.
        - Đỉnh cổng có tọa độ $I(0; 6)$.
        - Hai chân cổng có tọa độ $A(-4; 0)$ và $B(4; 0)$.
        Phương trình parabol có dạng $y = 6 - a x^2$.
        Thay điểm $B(4; 0)$ vào:
        $ 0 = 6 - a(4)^2 <=> 16a = 6 <=> a = 6 / 16 = 3 / 8 $
        Vậy phương trình vòm cổng là: $y = 6 - 3 / 8 x^2$.
        
        #step([Tính chiều cao tối đa của xe])
        Xe tải có chiều rộng $4 text(" m")$ và đi chính giữa cổng nên khoảng cách từ mép thùng xe đến trục đối xứng là $x = 4 / 2 = 2 text(" m")$.
        Độ cao của vòm cổng tại vị trí mép thùng xe ($x = 2$) là:
        $ y(2) = 6 - 3 / 8 (2)^2 = 6 - 3 / 8 cdot 4 = 6 - 1.5 = 4.5 text(" m") $
        Vậy chiều cao tối đa của xe là $4.5 text(" m")$.
    ]
)

// TLN 5 (Số giá trị nguyên của m để tam thức luôn dương)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để tam thức bậc hai $f(x) = x^2 - 2m x + 3m + 4$ luôn nhận giá trị dương với mọi số thực $x$.],
    [4],
    loigiai: [
        #step([Điều kiện để f(x) > 0 với mọi x])
        Hệ số $a = 1 > 0$. Điều kiện cần và đủ là:
        $ Delta' < 0 <=> (-m)^2 - 1(3m + 4) < 0 <=> m^2 - 3m - 4 < 0 $
        $ <=> (m + 1)(m - 4) < 0 <=> -1 < m < 4 $
        
        #step([Đếm số giá trị nguyên])
        Các giá trị nguyên của $m$ trong khoảng $(-1; 4)$ là $m in \{0; 1; 2; 3\}$.
        Tổng cộng có đúng $4$ giá trị nguyên.
    ]
)

// TLN 6 (Tổng các nghiệm phương trình trùng phương)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 149], back-to: "sec-exercise-hub",[Tìm tổng các nghiệm thực của phương trình trùng phương $x^4 - 8x^2 + 15 = 0$.],
    [0],
    loigiai: [
        #step([Giải phương trình theo t = x^2])
        Đặt $t = x^2$ ($t >= 0$). Phương trình trở thành:
        $ t^2 - 8t + 15 = 0 <=> (t - 3)(t - 5) = 0 <=> cases(t = 3, t = 5) $
        
        #step([Tìm nghiệm x])
        - $t = 3 => x = plus.minus sqrt(3)$.
        - $t = 5 => x = plus.minus sqrt(5)$.
        
        #step([Tính tổng các nghiệm])
        Tổng các nghiệm thực là:
        $ S = sqrt(3) + (-sqrt(3)) + sqrt(5) + (-sqrt(5)) = 0 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20A - CƠ BẢN ĐẾN VẬN DỤNG)!]      #v(0.6em)
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
