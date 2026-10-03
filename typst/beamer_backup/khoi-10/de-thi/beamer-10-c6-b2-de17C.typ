// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 16: HÀM SỐ BẬC HAI (ĐỀ SỐ 17C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 142  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 16: HÀM SỐ BẬC HAI (ĐỀ SỐ 17C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 142",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 142]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Khi tham số $m$ thay đổi, đỉnh của parabol $(P_m): y = x^2 - 2(m + 1)x + m^2 + 2m - 3$ luôn nằm trên đường thẳng cố định nào?],
    (
        True([$y = -4$]),
        [$y = 4$],
        [$y = 2x - 1$],
        [$y = -x + 3$]
    ),
    loigiai: [
        Tọa độ đỉnh $I(x_I; y_I)$ của parabol:
        $ x_I = - (-2(m + 1)) / 2 = m + 1 => m = x_I - 1 $
        Thay $m = x_I - 1$ vào tung độ đỉnh:
        $ y_I = x_I^2 - 2(m + 1)x_I + m^2 + 2m - 3 = -(m + 1)^2 + m^2 + 2m - 3 $
        $ = -(m^2 + 2m + 1) + m^2 + 2m - 3 = -4 $
        Vậy đỉnh $I$ luôn chạy trên đường thẳng nằm ngang cố định $y = -4$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Đồ thị của hàm số bậc hai $y = a x^2 + b x + c$ đi qua hai điểm phân biệt có cùng tung độ là $A(1; 5)$ và $B(5; 5)$. Trục đối xứng của parabol là đường thẳng],
    (
        True([$x = 3$]),
        [$x = 2$],
        [$x = 4$],
        [$y = 5$]
    ),
    loigiai: [
        Vì parabol nhận trục đối xứng làm trung trực của mọi đoạn thẳng nối hai điểm có cùng tung độ, nên hoành độ trục đối xứng là trung điểm hai hoành độ của $A$ và $B$:
        $ x = (1 + 5) / 2 = 3 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để parabol $y = x^2 - 4x + m$ cắt trục hoành tại hai điểm phân biệt $x_1, x_2$ thỏa mãn $x_1^2 + x_2^2 = 10$.],
    (
        True([$m = 3$]),
        [$m = -3$],
        [$m = 6$],
        [$m = 4$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm: $x^2 - 4x + m = 0$.
        Để có hai nghiệm phân biệt: $Delta' = (-2)^2 - m = 4 - m > 0 <=> m < 4$.
        Theo định lý Vi-ét: $x_1 + x_2 = 4$ và $x_1 x_2 = m$.
        Điều kiện:
        $ x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2 x_1 x_2 = 4^2 - 2m = 16 - 2m = 10 <=> 2m = 6 <=> m = 3 $
        Giá trị $m = 3 < 4$ thỏa mãn.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Xác định parabol $y = a x^2 + b x + c$ biết đồ thị có đỉnh $I(-1; -4)$ và cắt trục tung tại điểm $C(0; -3)$.],
    (
        True([$y = x^2 + 2x - 3$]),
        [$y = x^2 - 2x - 3$],
        [$y = 2x^2 + 4x - 3$],
        [$y = -x^2 - 2x - 3$]
    ),
    loigiai: [
        Vì cắt trục tung tại $C(0; -3)$ nên $c = -3$.
        Đỉnh $I(-1; -4)$ có hoành độ $x_I = -b / (2a) = -1 <=> b = 2a$.
        Tung độ đỉnh: $a(-1)^2 + b(-1) + c = -4 <=> a - b - 3 = -4 <=> a - b = -1$.
        Thay $b = 2a$ vào: $a - 2a = -1 <=> -a = -1 <=> a = 1 => b = 2$.
        Vậy phương trình parabol là $y = x^2 + 2x - 3$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x^2 - 2x + 3$. Số nghiệm thực của phương trình $f(f(x)) = 3$ là],
    (
        True([$1$]),
        [$2$],
        [$3$],
        [$0$]
    ),
    loigiai: [
        Đặt $t = f(x) = x^2 - 2x + 3 = (x - 1)^2 + 2 >= 2$.
        Phương trình $f(t) = 3 <=> t^2 - 2t + 3 = 3 <=> t(t - 2) = 0 <=> cases(t = 0 text(" (loại vì )") t >= 2, t = 2 text(" (nhận)"))$.
        Với $t = 2$:
        $ x^2 - 2x + 3 = 2 <=> x^2 - 2x + 1 = 0 <=> (x - 1)^2 = 0 <=> x = 1 $
        Vậy phương trình có đúng $1$ nghiệm thực duy nhất.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Giá trị nhỏ nhất của hàm số $y = x^4 - 2x^2 + 5$ trên toàn trục số thực $RR$ bằng],
    (
        True([$4$]),
        [$5$],
        [$3$],
        [$1$]
    ),
    loigiai: [
        Đặt $t = x^2 >= 0$. Hàm số trở thành $g(t) = t^2 - 2t + 5$ với $t in [0; +infinity)$.
        Hoành độ đỉnh $t_I = 1 >= 0$.
        Giá trị nhỏ nhất là $g(1) = 1^2 - 2(1) + 5 = 4$ (đạt được khi $x^2 = 1 <=> x = plus.minus 1$).
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Giá trị lớn nhất của hàm số $y = (x - 1)(5 - x)$ trên đoạn $[1; 5]$ bằng],
    (
        True([$4$]),
        [$5$],
        [$3$],
        [$2$]
    ),
    loigiai: [
        Khai triển: $y = -x^2 + 6x - 5$.
        Hàm số bậc hai có hệ số $a = -1 < 0$ và hoành độ đỉnh $x_I = - 6 / (2(-1)) = 3 in [1; 5]$.
        Giá trị lớn nhất là: $y_text("max") = -(3)^2 + 6(3) - 5 = -9 + 18 - 5 = 4$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Biết parabol $y = a x^2 + b x + c$ nhận trục tung $O y$ làm trục đối xứng và đi qua hai điểm $A(1; 2)$, $B(2; 5)$. Khi đó giá trị của biểu thức $T = a + b + c$ bằng],
    (
        True([$2$]),
        [$3$],
        [$5$],
        [$1$]
    ),
    loigiai: [
        - Trục đối xứng là $O y$ ($x = 0$) nên $b = 0$. Parabol có dạng $y = a x^2 + c$.
        - Đi qua $A(1; 2)$ nên: $a(1)^2 + c = 2 <=> a + c = 2$.
        Vì $b = 0$ nên $T = a + b + c = a + 0 + c = 2$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để giá trị nhỏ nhất của hàm số $y = x^2 - 2x + m$ trên đoạn $[2; 4]$ bằng $5$.],
    (
        True([$m = 5$]),
        [$m = 4$],
        [$m = 6$],
        [$m = 3$]
    ),
    loigiai: [
        Hoành độ đỉnh $x_I = 1$.
        Trên đoạn $[2; 4]$, vì $x_I = 1 < 2$ và $a = 1 > 0$ nên hàm số luôn đồng biến trên đoạn $[2; 4]$.
        Do đó giá trị nhỏ nhất đạt tại đầu mút $x = 2$:
        $ min_([2; 4]) y = 2^2 - 2(2) + m = m $
        Theo đề bài $min = 5 <=> m = 5$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Số giao điểm của hai parabol $(P_1): y = x^2 - 3x + 1$ và $(P_2): y = -x^2 + x + 7$ trên mặt phẳng tọa độ $O x y$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm:
        $ x^2 - 3x + 1 = -x^2 + x + 7 <=> 2x^2 - 4x - 6 = 0 <=> x^2 - 2x - 3 = 0 <=> cases(x = -1, x = 3) $
        Phương trình có hai nghiệm phân biệt nên hai parabol cắt nhau tại đúng $2$ điểm phân biệt.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Dây cáp chính của một cây cầu treo có dạng một parabol $y = a x^2$. Khoảng cách giữa hai tháp cầu là $120 text(" m")$, đỉnh của mỗi tháp cao $30 text(" m")$ so với điểm thấp nhất của dây cáp (gốc tọa độ $O$). Chiều cao của dây cáp tại điểm cách tháp cầu một khoảng $30 text(" m")$ bằng],
    (
        True([$7.5 text(" m")$]),
        [$15 text(" m")$],
        [$10 text(" m")$],
        [$5 text(" m")$]
    ),
    loigiai: [
        Gốc tọa độ $O(0; 0)$ tại điểm thấp nhất của dây cáp.
        Hai tháp cầu ở hai bên cách đều gốc tọa độ $60 text(" m")$, đỉnh tháp có tọa độ $(60; 30)$ và $(-60; 30)$.
        Thay $(60; 30)$ vào phương trình $y = a x^2$:
        $ 30 = a(60)^2 <=> 3600a = 30 <=> a = 30 / 3600 = 1 / 120 $
        Điểm cách tháp $30 text(" m")$ có khoảng cách tới gốc tọa độ là $x = 60 - 30 = 30 text(" m")$.
        Chiều cao của dây cáp tại đó là:
        $ y = 1 / 120 (30)^2 = 900 / 120 = 7.5 text(" m") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hàm số $y = a x^2 + b x + c$ có đồ thị với bề lõm quay lên trên, đỉnh nằm ở góc phần tư thứ nhất và cắt trục tung tại điểm có tung độ dương. Dấu của các hệ số $a, b, c$ là],
    (
        True([$a > 0, b < 0, c > 0$]),
        [$a > 0, b > 0, c > 0$],
        [$a < 0, b > 0, c > 0$],
        [$a > 0, b < 0, c < 0$]
    ),
    loigiai: [
        - Bề lõm quay lên trên nên $a > 0$.
        - Cắt trục tung tại điểm có tung độ dương nên $c > 0$.
        - Đỉnh nằm ở góc phần tư thứ nhất nên hoành độ đỉnh $x_I = -b / (2a) > 0 <=> b / (2a) < 0$. Vì $a > 0$ nên $b < 0$.
        Vậy $a > 0, b < 0, c > 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị trị tuyệt đối y = |x^2 - 4x + 3|)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x) = |x^2 - 4x + 3|$ có đồ thị trên mặt phẳng tọa độ $O x y$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-1.5, 0), (5.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -1), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((5.3, -0.3), [$x$])
  content((-0.3, 4.3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Vẽ đồ thị y = |x^2 - 4x + 3|
  line(..range(-5, 46).map(t => {
    let x = t / 10;
    (x, calc.abs(calc.pow(x, 2) - 4 * x + 3))
  }), stroke: 1.5pt + rgb("d97706"))
  
  // Đỉnh uốn tại (2; 1)
  circle((2, 1), radius: 2pt, fill: rgb("d97706"))
  content((2, 1.4), [$(2; 1)$])
  
  // Hai giao điểm với Ox (1; 0) và (3; 0)
  circle((1, 0), radius: 2pt, fill: rgb("d97706"))
  circle((3, 0), radius: 2pt, fill: rgb("d97706"))
  content((1, -0.3), [$1$])
  content((3, -0.3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hàm số có tập xác định là toàn bộ trục số thực $RR$.]),
    True([Giá trị nhỏ nhất của hàm số trên $RR$ bằng $0$.]),
    True([Hàm số đồng biến trên các khoảng $(1; 2)$ và $(3; +infinity)$.]),
    [Đường thẳng nằm ngang $y = 1$ cắt đồ thị hàm số tại đúng bốn điểm phân biệt.]
  ),
  loigiai: [
    #step([Tập xác định])
    Biểu thức trong dấu trị tuyệt đối xác định với mọi $x in RR$, do đó $D = RR$. Mệnh đề a ĐÚNG.

    #step([Giá trị nhỏ nhất])
    Vì $|A| >= 0$ với mọi $A$, và $x^2 - 4x + 3 = 0$ tại $x = 1$ và $x = 3$.
    Do đó giá trị nhỏ nhất của hàm số là $0$. Mệnh đề b ĐÚNG.

    #step([Khoảng đồng biến])
    Quan sát đồ thị: Trên $(1; 2)$, đồ thị uốn lên từ $(1; 0)$ đến $(2; 1)$; trên $(3; +infinity)$, đồ thị đi lên từ $(3; 0)$.
    Hàm số đồng biến trên $(1; 2)$ và $(3; +infinity)$. Mệnh đề c ĐÚNG.

    #step([Số giao điểm với đường thẳng y = 1])
    Đỉnh uốn lượn ở giữa đạt tung độ cực đại là $y = 1$ tại $x = 2$.
    Đường thẳng nằm ngang $y = 1$ tiếp xúc với đỉnh này tại điểm $(2; 1)$ và cắt hai nhánh ngoài tại hai điểm nữa (ứng với $x^2 - 4x + 3 = 1 <=> x^2 - 4x + 2 = 0 <=> x = 2 plus.minus sqrt(2)$).
    Như vậy đường thẳng $y = 1$ cắt đồ thị tại đúng $3$ điểm phân biệt (gồm $x = 2$ và $x = 2 plus.minus sqrt(2)$).
    Khẳng định cắt tại đúng bốn điểm phân biệt là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Tham số m trong bài toán GTLN/GTNN trên đoạn)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hàm số $y = f(x) = x^2 - 2m x + m^2 - 2m + 3$ (với $m$ là tham số thực) xác định trên đoạn $[0; 2]$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol là $I(m; -2m + 3)$.]),
    True([Khi $m = 1$, giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ bằng $1$.]),
    True([Khi $m in [0; 2]$, giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ luôn bằng $-2m + 3$.]),
    [Có đúng $3$ giá trị của tham số $m$ để giá trị nhỏ nhất của hàm số trên đoạn $[0; 2]$ bằng $3$.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    Hoành độ đỉnh $x_I = - (-2m) / 2 = m$.
    Tung độ đỉnh $y_I = m^2 - 2m(m) + m^2 - 2m + 3 = -2m + 3$.
    Tọa độ đỉnh là $I(m; -2m + 3)$. Mệnh đề a ĐÚNG.

    #step([Khi m = 1])
    Hoành độ đỉnh $x_I = 1 in [0; 2]$.
    Vì parabol có $a = 1 > 0$ nên giá trị nhỏ nhất đạt tại đỉnh:
    $ min_([0; 2]) f(x) = y_I = -2(1) + 3 = 1 $. Mệnh đề b ĐÚNG.

    #step([Khi m thuộc đoạn [0; 2]])
    Khi $m in [0; 2]$, đỉnh $x_I = m$ luôn thuộc đoạn $[0; 2]$.
    Do đó giá trị nhỏ nhất luôn đạt tại đỉnh và bằng $-2m + 3$. Mệnh đề c ĐÚNG.

    #step([Tìm m để GTNN bằng 3])
    - Trường hợp 1: $m in [0; 2] => min = -2m + 3 = 3 <=> -2m = 0 <=> m = 0$ (thỏa mãn).
    - Trường hợp 2: $m < 0 =>$ hàm số đồng biến trên $[0; 2] => min = f(0) = m^2 - 2m + 3 = 3 <=> m(m - 2) = 0 <=> m = 0$ (loại vì $m < 0$) hoặc $m = 2$ (loại).
    - Trường hợp 3: $m > 2 =>$ hàm số nghịch biến trên $[0; 2] => min = f(2) = 4 - 4m + m^2 - 2m + 3 = m^2 - 6m + 7 = 3 <=> m^2 - 6m + 4 = 0 <=> m = 3 plus.minus sqrt(5)$.
    Vì $m > 2$ nên nhận $m = 3 + sqrt(5) approx 5.24$.
    Như vậy chỉ có $2$ giá trị của $m$ là $m = 0$ và $m = 3 + sqrt(5)$.
    Khẳng định có đúng $3$ giá trị là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế anten chảo vệ tinh parabol)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Một chảo thu sóng truyền hình vệ tinh dạng gương cầu parabol có đường kính miệng chảo là $D = 120 text(" cm")$ và chiều sâu của chảo là $h = 30 text(" cm")$.
Chọn hệ trục tọa độ $O x y$ sao cho gốc $O$ trùng với đỉnh chảo, trục đối xứng của chảo trùng với trục $O y$ (hướng lên trên).
Mặt cắt qua trục của chảo là một đường parabol có phương trình $y = a x^2$ ($a > 0$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hệ số trong phương trình parabol mặt cắt của chảo là $a = 1 / 120 text(" cm")^(-1)$.]),
    True([Tại điểm trên chảo cách trục đối xứng $30 text(" cm")$, độ sâu của chảo tính từ đáy chảo là $7.5 text(" cm")$.]),
    True([Theo tính chất tiêu cự gương cầu parabol ($x^2 = 4f y$), vị trí đặt đầu thu sóng (tiêu điểm $F$) cách đỉnh chảo một khoảng $30 text(" cm")$.]),
    [Nếu giữ nguyên chiều sâu $h = 30 text(" cm")$ mà tăng đường kính miệng chảo lên gấp đôi ($240 text(" cm")$) thì đầu thu sóng cách đỉnh chảo $60 text(" cm")$.]
  ),
  loigiai: [
    #step([Xác định phương trình mặt cắt])
    Miệng chảo có đường kính $120 text(" cm")$ nên bán kính là $R = 60 text(" cm")$.
    Mép chảo có tọa độ $(60; 30)$ và $(-60; 30)$.
    Thay vào phương trình $y = a x^2$:
    $ 30 = a(60)^2 <=> 3600a = 30 <=> a = 30 / 3600 = 1 / 120 $
    Phương trình là $y = 1 / 120 x^2$. Mệnh đề a ĐÚNG.

    #step([Độ sâu tại vị trí cách trục 30 cm])
    Thay $x = 30 text(" cm")$:
    $ y = 1 / 120 (30)^2 = 900 / 120 = 7.5 text(" cm") $. Mệnh đề b ĐÚNG.

    #step([Vị trí đặt đầu thu sóng])
    Phương trình chính tắc parabol: $x^2 = 4f y$.
    Ta có: $x^2 = 120 y <=> 4f = 120 <=> f = 30 text(" cm")$.
    Vậy đầu thu tín hiệu đặt cách đỉnh chảo đúng $30 text(" cm")$ (nằm ngang bằng miệng chảo). Mệnh đề c ĐÚNG.

    #step([Khi tăng đường kính lên 240 cm])
    Bán kính mới là $R' = 120 text(" cm")$.
    Điểm mép chảo là $(120; 30)$. Thay vào $x^2 = 4f' y$:
    $ 120^2 = 4f'(30) <=> 14400 = 120 f' <=> f' = 14400 / 120 = 120 text(" cm") != 60 text(" cm") $
    Khẳng định cách đỉnh chảo $60 text(" cm")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tương giao và định lý Vi-et)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho parabol $(P): y = x^2 - (m + 1)x + m$ và đường thẳng $d: y = x - 1$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Phương trình hoành độ giao điểm của $(P)$ và $d$ là $x^2 - (m + 2)x + m + 1 = 0$.]),
    True([Với mọi $m != 0$, đường thẳng $d$ luôn cắt $(P)$ tại hai điểm phân biệt có hoành độ là $x = 1$ và $x = m + 1$.]),
    True([Khi $m = 2$, khoảng cách giữa hai giao điểm bằng $2 sqrt(2)$.]),
    [Có đúng $1$ giá trị nguyên của tham số $m$ để hai giao điểm nằm về hai phía của trục tung $O y$.]
  ),
  loigiai: [
    #step([Phương trình hoành độ giao điểm])
    $x^2 - (m + 1)x + m = x - 1 <=> x^2 - (m + 2)x + m + 1 = 0$ (1). Mệnh đề a ĐÚNG.

    #step([Tìm nghiệm phương trình])
    Phương trình có dạng $a + b + c = 1 - (m + 2) + m + 1 = 0$.
    Do đó phương trình luôn có hai nghiệm:
    $ x_1 = 1 text(" và ") x_2 = (m + 1) / 1 = m + 1 $
    Hai nghiệm phân biệt khi $m + 1 != 1 <=> m != 0$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách giữa hai giao điểm khi m = 2])
    Khi $m = 2$: $x_1 = 1 => y_1 = 1 - 1 = 0 => A(1; 0)$.
    $x_2 = 3 => y_2 = 3 - 1 = 2 => B(3; 2)$.
    Khoảng cách: $A B = sqrt((3 - 1)^2 + (2 - 0)^2) = sqrt(4 + 4) = sqrt(8) = 2 sqrt(2)$. Mệnh đề c ĐÚNG.

    #step([Hai giao điểm nằm về hai phía trục tung])
    Hai giao điểm nằm về hai phía của trục tung khi và chỉ khi hai hoành độ trái dấu:
    $ x_1 x_2 < 0 <=> 1 cdot (m + 1) < 0 <=> m + 1 < 0 <=> m < -1 $
    Tập hợp các giá trị nguyên thỏa mãn $m < -1$ là vô số ($m in {-2; -3; -4; dots}$).
    Khẳng định có đúng $1$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm m để trục đối xứng cho trước)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để parabol $y = x^2 - 2(m - 1)x + m^2 - 3$ có trục đối xứng là đường thẳng $x = 3$.],
    [4],
    loigiai: [
        #step([Công thức trục đối xứng])
        Trục đối xứng của parabol là đường thẳng:
        $ x = - b / (2a) = - (-2(m - 1)) / (2 cdot 1) = m - 1 $
        
        #step([Tìm giá trị m])
        Theo đề bài trục đối xứng là $x = 3$:
        $ m - 1 = 3 <=> m = 4 $
    ]
)

// TLN 2 (Tổng GTLN và GTNN trên đoạn)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hàm số $y = -x^2 + 2x + 3$ xác định trên đoạn $[-1; 4]$.
Tính tổng của giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn đã cho.],
    [-1],
    loigiai: [
        #step([Hoành độ đỉnh])
        $x_I = - 2 / (2(-1)) = 1 in [-1; 4]$.
        
        #step([Tính giá trị tại các điểm])
        - Tại đỉnh $x = 1$: $y(1) = -(1)^2 + 2(1) + 3 = 4$.
        - Tại $x = -1$: $y(-1) = -(-1)^2 + 2(-1) + 3 = 0$.
        - Tại $x = 4$: $y(4) = -(4)^2 + 2(4) + 3 = -16 + 8 + 3 = -5$.
        
        #step([Tìm GTLN, GTNN và tính tổng])
        Giá trị lớn nhất: $M = 4$ (tại $x = 1$).
        Giá trị nhỏ nhất: $m = -5$ (tại $x = 4$).
        Tổng: $M + m = 4 + (-5) = -1$.
    ]
)

// TLN 3 (Số giá trị nguyên của m để parabol không cắt đường thẳng)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Tìm số giá trị nguyên của tham số $m in [-5; 5]$ để parabol $y = x^2 - 2x + m$ không có điểm chung với đường thẳng $y = 2x - 3$.],
    [4],
    loigiai: [
        #step([Phương trình hoành độ giao điểm])
        $ x^2 - 2x + m = 2x - 3 <=> x^2 - 4x + m + 3 = 0 $
        
        #step([Điều kiện không có điểm chung])
        Parabol và đường thẳng không có điểm chung khi phương trình vô nghiệm:
        $ Delta' = (-2)^2 - 1(m + 3) = 4 - m - 3 = 1 - m < 0 <=> m > 1 $
        
        #step([Đếm số giá trị nguyên])
        Kết hợp với $m in [-5; 5]$ và $m in ZZ$, ta có $m in {2; 3; 4; 5}$.
        Vậy có đúng $4$ giá trị nguyên thỏa mãn.
    ]
)

// TLN 4 (Chiều dài thanh xà ngang cổng parabol)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Một chiếc cổng vòm hình parabol có chiều cao $12 text(" m")$ và khoảng cách giữa hai chân cổng trên mặt đất là $12 text(" m")$.
Người ta gắn một thanh xà ngang song song với mặt đất ở độ cao cách mặt đất $9 text(" m")$.
Tính độ dài của thanh xà ngang đó theo đơn vị mét.],
    [6],
    loigiai: [
        #step([Lập phương trình vòm cổng])
        Chọn hệ tọa độ $O x y$ có gốc $O$ là trung điểm chân cổng, đỉnh cổng nằm trên trục $O y$ tại $(0; 12)$.
        Hai chân cổng tại $(-6; 0)$ và $(6; 0)$.
        Phương trình parabol có dạng: $y = a x^2 + 12$.
        Thay điểm $(6; 0)$: $0 = a(6)^2 + 12 <=> 36a = -12 <=> a = - 1 / 3$.
        Phương trình là: $y = - 1 / 3 x^2 + 12$.
        
        #step([Tính độ dài xà ngang ở độ cao 9 m])
        Tại độ cao $y = 9 text(" m")$:
        $ - 1 / 3 x^2 + 12 = 9 <=> 1 / 3 x^2 = 3 <=> x^2 = 9 <=> x = plus.minus 3 $
        Khoảng cách giữa hai đầu thanh xà ngang là:
        $ L = 3 - (-3) = 6 text(" m") $
    ]
)

// TLN 5 (Cực trị điều kiện)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Cho hai số thực $x, y$ thỏa mãn điều kiện $x + y = 6$.
Tìm giá trị nhỏ nhất của biểu thức $P = x^2 + y^2$.],
    [18],
    loigiai: [
        #step([Biểu diễn P theo biến x])
        Từ $x + y = 6 => y = 6 - x$. Thay vào biểu thức $P$:
        $ P = x^2 + (6 - x)^2 = x^2 + x^2 - 12x + 36 = 2x^2 - 12x + 36 $
        
        #step([Tìm giá trị nhỏ nhất])
        Hàm số bậc hai có hệ số $a = 2 > 0$, đạt giá trị nhỏ nhất tại đỉnh:
        $ x = - (-12) / (2 cdot 2) = 3 $
        Khi đó $y = 6 - 3 = 3$ và:
        $ P_text("min") = 2(3)^2 - 12(3) + 36 = 18 - 36 + 36 = 18 $
    ]
)

// TLN 6 (Tối đa hóa lợi nhuận kinh doanh đèn led)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 142], back-to: "sec-exercise-hub",[Một doanh nghiệp sản xuất bóng đèn LED. Nếu sản xuất $x$ nghìn bóng đèn thì tổng chi phí sản xuất là $C(x) = x^2 - 20x + 400$ (triệu đồng).
Biết rằng toàn bộ sản phẩm làm ra đều bán hết với giá $60$ nghìn đồng một bóng đèn (tương đương $60$ triệu đồng một nghìn bóng đèn).
Hỏi doanh nghiệp cần sản xuất bao nhiêu nghìn bóng đèn để lợi nhuận thu được là lớn nhất?],
    [40],
    loigiai: [
        #step([Lập hàm lợi nhuận])
        Doanh thu khi bán $x$ nghìn bóng đèn: $R(x) = 60x$ (triệu đồng).
        Hàm lợi nhuận là:
        $ L(x) = R(x) - C(x) = 60x - (x^2 - 20x + 400) = -x^2 + 80x - 400 $
        
        #step([Tìm số lượng sản xuất để lợi nhuận tối đa])
        Hàm số $L(x)$ là hàm số bậc hai với $a = -1 < 0$.
        Lợi nhuận đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x = - 80 / (2 cdot (-1)) = 40 text(" (nghìn bóng đèn)") $
        Vậy cần sản xuất $40$ nghìn bóng đèn.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 16: HÀM SỐ BẬC HAI (ĐỀ SỐ 17C - NÂNG CAO & VDC)!]      #v(0.6em)
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
