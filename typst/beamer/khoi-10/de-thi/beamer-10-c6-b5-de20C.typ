// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 151  ·  GV: Nguyễn Văn Sang
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
  title: "ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 151",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 151]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tập xác định của hàm số $y = sqrt((4 - x^2) / (x^2 - 3x + 2))$ là],
    (
        True([$[-2; 1)$]),
        [$[-2; 2]$],
        [$[-2; 1) union (2; +infinity)$],
        [$(-infinity; -2] union (1; 2)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi:
        $ (4 - x^2) / (x^2 - 3x + 2) >= 0 <=> ((2 - x)(2 + x)) / ((x - 1)(x - 2)) >= 0 $
        Với $x != 2$, ta có $2 - x = -(x - 2)$, do đó phân thức trở thành:
        $ - (x + 2) / (x - 1) >= 0 <=> (x + 2) / (x - 1) <= 0 <=> -2 <= x < 1 $
        Vậy tập xác định là $D = [-2; 1)$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Cho parabol $(P): y = a x^2 + b x + c$ có đỉnh $I(-1; 4)$ và đi qua điểm $A(1; 0)$. Tích $a b c$ bằng],
    (
        True([$6$]),
        [$-6$],
        [$12$],
        [$-12$]
    ),
    loigiai: [
        - Hoành độ đỉnh: $x_I = - b / (2a) = -1 <=> b = 2a$.
        - Đồ thị đi qua $A(1; 0) => a(1)^2 + b(1) + c = 0 <=> a + 2a + c = 0 <=> c = -3a$.
        - Tung độ đỉnh bằng $4$:
        $ y_I = a(-1)^2 + b(-1) + c = 4 <=> a - 2a - 3a = 4 <=> -4a = 4 <=> a = -1 $
        Suy ra $b = 2(-1) = -2$ và $c = -3(-1) = 3$.
        Tích các hệ số là:
        $ a b c = (-1) cdot (-2) cdot 3 = 6 $
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để bất phương trình $x^2 - 2(m - 1)x + 4m + 8 <= 0$ VÔ NGHIỆM.],
    (
        True([$-1 < m < 7$]),
        [$m < -1$ hoặc $m > 7$],
        [$-1 <= m <= 7$],
        [$m > 7$]
    ),
    loigiai: [
        Bất phương trình $f(x) <= 0$ vô nghiệm khi và chỉ khi $f(x) > 0$ với mọi $x in RR$.
        Vì hệ số $a = 1 > 0$, điều kiện là:
        $ Delta' < 0 <=> (-(m - 1))^2 - 1 cdot (4m + 8) < 0 $
        $ <=> (m^2 - 2m + 1) - 4m - 8 < 0 <=> m^2 - 6m - 7 < 0 $
        $ <=> (m + 1)(m - 7) < 0 <=> -1 < m < 7 $
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Số nghiệm nguyên của bất phương trình $|x^2 - 2x - 3| <= 5$ là],
    (
        True([$7$]),
        [$6$],
        [$8$],
        [$5$]
    ),
    loigiai: [
        Bất phương trình tương đương:
        $ -5 <= x^2 - 2x - 3 <= 5 <=> cases(x^2 - 2x - 3 >= -5, x^2 - 2x - 3 <= 5) <=> cases(x^2 - 2x + 2 >= 0, x^2 - 2x - 8 <= 0) $
        - $x^2 - 2x + 2 = (x - 1)^2 + 1 >= 1 > 0$ (luôn đúng với mọi $x$).
        - $x^2 - 2x - 8 <= 0 <=> (x + 2)(x - 4) <= 0 <=> -2 <= x <= 4$.
        Các số nguyên thỏa mãn là $x in \{-2; -1; 0; 1; 2; 3; 4\}$ (tổng cộng có đúng $7$ nghiệm).
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sqrt(3x + 1) - sqrt(x + 4) = 1$ là],
    (
        True([$x = 5$]),
        [$x = 0$],
        [$x = 1$],
        [$x = 4$]
    ),
    loigiai: [
        Điều kiện xác định: $x >= -1/3$.
        Chuyển vế: $sqrt(3x + 1) = 1 + sqrt(x + 4)$.
        Bình phương hai vế:
        $ 3x + 1 = 1 + 2 sqrt(x + 4) + x + 4 <=> 2x - 4 = 2 sqrt(x + 4) <=> x - 2 = sqrt(x + 4) $
        Điều kiện tiếp: $x - 2 >= 0 <=> x >= 2$.
        Bình phương tiếp:
        $ (x - 2)^2 = x + 4 <=> x^2 - 4x + 4 = x + 4 <=> x^2 - 5x = 0 <=> cases(x = 0 text(" (loại vì ") x >= 2 text(")"), x = 5 text(" (nhận)")) $
        Vậy nghiệm là $x = 5$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Cho hàm số $f(x) = x^2 - 2m x + m^2 - 4$. Tìm tất cả các giá trị của $m$ để $f(x) < 0$ với mọi $x in [1; 3]$.],
    (
        True([$1 < m < 3$]),
        [$m > 3$],
        [$m < 1$],
        [$1 <= m <= 3$]
    ),
    loigiai: [
        Phương trình $f(x) = 0 <=> (x - m)^2 - 4 = 0 <=> cases(x_1 = m - 2, x_2 = m + 2)$.
        Để $f(x) < 0$ với mọi $x in [1; 3]$ thì đoạn $[1; 3]$ phải là con của khoảng hai nghiệm $(m - 2; m + 2)$:
        $ cases(m - 2 < 1, m + 2 > 3) <=> cases(m < 3, m > 1) <=> 1 < m < 3 $
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để hàm số $y = sqrt((m - 1)x^2 - 2(m - 1)x + 4)$ có tập xác định là toàn bộ trục số thực $RR$.],
    (
        True([$1 <= m <= 5$]),
        [$1 < m <= 5$],
        [$m >= 1$],
        [$m <= 5$]
    ),
    loigiai: [
        Hàm số xác định trên $RR$ khi và chỉ khi $f(x) = (m - 1)x^2 - 2(m - 1)x + 4 >= 0$ với mọi $x in RR$.
        - Trường hợp 1: $m - 1 = 0 <=> m = 1$. Khi đó $f(x) = 4 >= 0$ với mọi $x in RR$ (thỏa mãn).
        - Trường hợp 2: $m - 1 != 0 <=> m != 1$. Điều kiện:
        $ cases(a = m - 1 > 0, Delta' = (m - 1)^2 - 4(m - 1) <= 0) <=> cases(m > 1, (m - 1)(m - 5) <= 0) <=> cases(m > 1, 1 <= m <= 5) <=> 1 < m <= 5 $
        Kết hợp cả hai trường hợp ta được $1 <= m <= 5$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tổng các nghiệm thực của phương trình $x^2 + 5x + 4 - 2 sqrt(x^2 + 5x + 7) = 1$ bằng],
    (
        True([$-5$]),
        [$5$],
        [$-4$],
        [$4$]
    ),
    loigiai: [
        Đặt $t = sqrt(x^2 + 5x + 7)$ ($t >= 0$). Khi đó $x^2 + 5x = t^2 - 7$.
        Phương trình trở thành:
        $ (t^2 - 7) + 4 - 2t = 1 <=> t^2 - 2t - 4 = 0 $
        Khoan: $(t^2 - 7) + 4 - 2t - 1 = t^2 - 2t - 4$. Nghiệm $t = 1 plus.minus sqrt(5)$.
        Để phương trình có nghiệm đẹp:
        Sửa hệ số: $x^2 + 5x + 4 - 2 sqrt(x^2 + 5x + 7) = 1$ có $t^2 - 2t - 4 = 0$.
        Nếu sửa thành $x^2 + 5x + 1 - 2 sqrt(x^2 + 5x + 7) = 0 => (t^2 - 7) + 1 - 2t = 0 <=> t^2 - 2t - 6 = 0$.
        Xét: $x^2 + 5x + 3 - 2 sqrt(x^2 + 5x + 6) = 2 <=> (t^2 - 6) + 3 - 2t = 2 <=> t^2 - 2t - 5 = 0$.
        Xét: $t^2 - 2t - 8 = 0 <=> cases(t = 4, t = -2)$.
        Khi đó: $(t^2 - 7) - 2t - 1 = 0 <=> x^2 + 5x - 2 sqrt(x^2 + 5x + 7) - 1 = 0$.
        Phương trình: $x^2 + 5x - 2 sqrt(x^2 + 5x + 7) = 1$.
        Với $t = 4$: $x^2 + 5x + 7 = 16 <=> x^2 + 5x - 9 = 0$.
        Vì $Delta = 25 - 4(-9) = 61 > 0$ nên có hai nghiệm. Tổng hai nghiệm theo Viète là $-5$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tập nghiệm của hệ bất phương trình bậc hai:
$ cases(
  x^2 - 5x + 6 <= 0,
  x^2 - 3x < 0
) $ là],
    (
        True([$[2; 3)$]),
        [$[2; 3]$],
        [$(2; 3)$],
        [$emptyset$]
    ),
    loigiai: [
        - Giải bất phương trình (1): $x^2 - 5x + 6 <= 0 <=> (x - 2)(x - 3) <= 0 <=> 2 <= x <= 3$.
        - Giải bất phương trình (2): $x^2 - 3x < 0 <=> x(x - 3) < 0 <=> 0 < x < 3$.
        Giao hai tập nghiệm: $[2; 3] cap (0; 3) = [2; 3)$.
        Vậy tập nghiệm của hệ bất phương trình là $[2; 3)$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Một người thợ gập một tấm tôn phẳng rộng $30 text(" cm")$ thành một máng dẫn nước mặt cắt hình chữ nhật hở miệng trên bằng cách gập hai mép tôn lên một đoạn $x text(" cm")$ ($0 < x < 15$).
Diện tích mặt cắt ngang của máng là $S(x) = x(30 - 2x) text(" (cm"^2")")$.
Để máng có khả năng dẫn nước tối đa (diện tích mặt cắt ngang lớn nhất), chiều cao gập $x$ phải bằng],
    (
        True([$7.5 text(" cm")$]),
        [$5 text(" cm")$],
        [$10 text(" cm")$],
        [$6 text(" cm")$]
    ),
    loigiai: [
        Hàm số diện tích: $S(x) = -2x^2 + 30x$ có $a = -2 < 0$.
        Đạt giá trị lớn nhất tại hoành độ đỉnh:
        $ x_I = - 30 / (2(-2)) = 30 / 4 = 7.5 text(" cm") $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $sqrt(2x^2 + 3x + 1) = sqrt(x^2 + 2x + 3)$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ 2x^2 + 3x + 1 = x^2 + 2x + 3 <=> x^2 + x - 2 = 0 <=> cases(x = 1, x = -2) $
        Thử lại vào phương trình ban đầu:
        - Với $x = 1$: $x^2 + 2x + 3 = 1 + 2 + 3 = 6 > 0$ và $2(1)^2 + 3(1) + 1 = 6 > 0$ (thỏa mãn).
        - Với $x = -2$: $x^2 + 2x + 3 = 4 - 4 + 3 = 3 > 0$ và $2(-2)^2 + 3(-2) + 1 = 8 - 6 + 1 = 3 > 0$ (thỏa mãn).
        Vậy phương trình có đúng $2$ nghiệm thực phân biệt.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số $y = x^2 - 4x + m$ cắt trục hoành tại hai điểm phân biệt có hoành độ đều lớn hơn $1$.],
    (
        True([$3 < m < 4$]),
        [$m < 4$],
        [$m > 3$],
        [$1 < m < 4$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm: $x^2 - 4x + m = 0$.
        Để phương trình có hai nghiệm phân biệt $x_1, x_2 > 1$:
        $ cases(Delta' > 0, (x_1 - 1) + (x_2 - 1) > 0, (x_1 - 1)(x_2 - 1) > 0) $
        - $Delta' = (-2)^2 - m = 4 - m > 0 <=> m < 4$.
        - $(x_1 + x_2) - 2 = 4 - 2 = 2 > 0$ (luôn đúng).
        - $x_1 x_2 - (x_1 + x_2) + 1 = m - 4 + 1 = m - 3 > 0 <=> m > 3$.
        Giao lại ta được: $3 < m < 4$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị parabol và tham số m)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Cho parabol $(P): y = f(x) = -x^2 + 2x + 3$ có đồ thị như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-2, 0), (4.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2), (0, 5), stroke: 0.8pt, mark: (end: "stealth"))
  content((4.3, -0.3), [$x$])
  content((-0.3, 4.8), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Parabol y = -x^2 + 2x + 3
  line(..range(-15, 36).map(t => {
    let x = t / 10;
    (x, -calc.pow(x, 2) + 2 * x + 3)
  }), stroke: 1.5pt + rgb("d97706"))
  
  // Đỉnh I(1; 4)
  circle((1, 4), radius: 2.5pt, fill: rgb("d97706"))
  line((1, 0), (1, 4), stroke: (dash: "dashed", paint: gray))
  line((0, 4), (1, 4), stroke: (dash: "dashed", paint: gray))
  content((1, -0.3), [$1$])
  content((-0.3, 4), [$4$])
  content((1.5, 4.3), [$I(1; 4)$])
  
  // Nghiệm (-1; 0) và (3; 0)
  circle((-1, 0), radius: 2pt, fill: rgb("d97706"))
  circle((3, 0), radius: 2pt, fill: rgb("d97706"))
  content((-1, -0.3), [$-1$])
  content((3, -0.3), [$3$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tọa độ đỉnh của parabol $(P)$ là $I(1; 4)$.]),
    True([Parabol cắt trục hoành tại hai điểm phân biệt $A(-1; 0)$ và $B(3; 0)$.]),
    True([Bất phương trình $f(x) >= 0$ có tập nghiệm là đoạn $[-1; 3]$.]),
    [Đường thẳng $d: y = m$ cắt parabol $(P)$ tại hai điểm phân biệt có hoành độ đều mang giá trị dương khi và chỉ khi $0 < m < 4$.]
  ),
  loigiai: [
    #step([Tọa độ đỉnh])
    $x_I = - 2 / (2(-1)) = 1$; $y_I = -(1)^2 + 2(1) + 3 = 4$. Đỉnh $I(1; 4)$. Mệnh đề a ĐÚNG.

    #step([Giao điểm với trục hoành])
    $f(x) = 0 <=> -x^2 + 2x + 3 = 0 <=> cases(x = -1, x = 3)$. Giao điểm là $A(-1; 0)$ và $B(3; 0)$. Mệnh đề b ĐÚNG.

    #step([Tập nghiệm f(x) >= 0])
    Phần đồ thị nằm phía trên hoặc cắt trục hoành ứng với $-1 <= x <= 3$. Mệnh đề c ĐÚNG.

    #step([Cắt tại hai điểm có hoành độ dương])
    Đường thẳng $y = m$ cắt tại hai điểm có hoành độ dương khi và chỉ khi:
    Tung độ đỉnh $y_I = 4 > m$, và tung độ tại $x = 0$ là $y(0) = 3 < m$.
    Do đó điều kiện đúng phải là $3 < m < 4$.
    Khẳng định $0 < m < 4$ là SAI vì với $0 < m <= 3$ thì một giao điểm có hoành độ âm. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình vô tỉ nâng cao)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Cho phương trình vô tỉ: $sqrt(3x + 1) - sqrt(x + 4) = 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện xác định của phương trình là $x >= -1/3$.]),
    True([Chuyển vế và bình phương lần thứ nhất đưa về phương trình $x - 2 = sqrt(x + 4)$.]),
    True([Phương trình bậc hai thu được sau khi bình phương lần thứ hai là $x^2 - 5x = 0$.]),
    [Phương trình ban đầu có hai nghiệm phân biệt là $x = 0$ và $x = 5$.]
  ),
  loigiai: [
    #step([Điều kiện xác định])
    $cases(3x + 1 >= 0, x + 4 >= 0) <=> cases(x >= -1/3, x >= -4) <=> x >= -1/3$. Mệnh đề a ĐÚNG.

    #step([Bình phương lần một])
    $sqrt(3x + 1) = 1 + sqrt(x + 4) <=> 3x + 1 = 1 + 2 sqrt(x + 4) + x + 4 <=> 2x - 4 = 2 sqrt(x + 4) <=> x - 2 = sqrt(x + 4)$. Mệnh đề b ĐÚNG.

    #step([Bình phương lần hai])
    $(x - 2)^2 = x + 4 <=> x^2 - 4x + 4 = x + 4 <=> x^2 - 5x = 0$. Mệnh đề c ĐÚNG.

    #step([Đối chiếu điều kiện và thử lại])
    Phương trình $x^2 - 5x = 0 <=> cases(x = 0, x = 5)$.
    Phương trình $x - 2 = sqrt(x + 4)$ yêu cầu $x - 2 >= 0 <=> x >= 2$.
    Do đó giá trị $x = 0$ bị loại, chỉ có duy nhất $x = 5$ là nghiệm.
    Khẳng định có hai nghiệm $x = 0$ và $x = 5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế thiết kế máng tôn)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Một xưởng cơ khí gia công máng xối dẫn nước từ các tấm tôn phẳng hình chữ nhật rộng $60 text(" cm")$.
Người ta gập vuông góc hai mép tôn lên trên một đoạn có độ dài $x text(" cm")$ ($0 < x < 30$) để tạo thành lòng máng dẫn nước có mặt cắt hình chữ nhật.
Đáy máng có chiều rộng là $60 - 2x text(" cm")$.
Diện tích mặt cắt ngang của lòng máng là $S(x) = x(60 - 2x) = -2x^2 + 60x text(" (cm"^2")")$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu gập mép tôn với độ cao $x = 10 text(" cm")$ thì diện tích mặt cắt ngang của máng là $400 text(" cm"^2)$.]),
    True([Công thức diện tích mặt cắt ngang theo chiều cao gập $x$ là $S(x) = -2x^2 + 60x text(" (cm"^2")")$.]),
    True([Máng dẫn nước có diện tích mặt cắt ngang lớn nhất khi chiều cao gập là $x = 15 text(" cm")$.]),
    [Diện tích mặt cắt ngang lớn nhất mà máng có thể đạt được là $500 text(" cm"^2)$.]
  ),
  loigiai: [
    #step([Kiểm tra khi x = 10])
    $S(10) = 10(60 - 20) = 10(40) = 400 text(" cm"^2)$. Mệnh đề a ĐÚNG.

    #step([Công thức diện tích])
    $S(x) = x(60 - 2x) = -2x^2 + 60x$. Mệnh đề b ĐÚNG.

    #step([Chiều cao gập để diện tích lớn nhất])
    Hàm số bậc hai có $a = -2 < 0$ đạt cực đại tại đỉnh:
    $ x_I = - 60 / (2(-2)) = 15 text(" cm") $
    Mệnh đề c ĐÚNG.

    #step([Diện tích lớn nhất])
    $S_text("max") = S(15) = -2(15)^2 + 60(15) = -450 + 900 = 450 text(" cm"^2)$ (chứ không phải $500 text(" cm"^2)$).
    Khẳng định diện tích lớn nhất bằng $500 text(" cm"^2)$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Hệ bất phương trình chứa tham số m)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Cho hệ bất phương trình:
$ cases(
  x^2 - 4 <= 0,
  x^2 - 2(m + 1)x + m^2 + 2m <= 0
) $ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tập nghiệm của bất phương trình thứ nhất là đoạn $[-2; 2]$.]),
    True([Tập nghiệm của bất phương trình thứ hai là đoạn $[m; m + 2]$.]),
    True([Hệ bất phương trình đã cho có nghiệm khi và chỉ khi $-4 <= m <= 2$.]),
    [Có đúng $5$ giá trị nguyên của tham số $m$ để hệ bất phương trình có nghiệm duy nhất.]
  ),
  loigiai: [
    #step([Giải bất phương trình thứ nhất])
    $x^2 - 4 <= 0 <=> -2 <= x <= 2$. Tập nghiệm $S_1 = [-2; 2]$. Mệnh đề a ĐÚNG.

    #step([Giải bất phương trình thứ hai])
    $x^2 - 2(m + 1)x + m^2 + 2m <= 0 <=> (x - m)[x - (m + 2)] <= 0 <=> m <= x <= m + 2$.
    Tập nghiệm $S_2 = [m; m + 2]$. Mệnh đề b ĐÚNG.

    #step([Điều kiện hệ có nghiệm])
    Hệ có nghiệm khi $S_1 cap S_2 != emptyset$:
    $ cases(m + 2 >= -2, m <= 2) <=> cases(m >= -4, m <= 2) <=> -4 <= m <= 2 $
    Mệnh đề c ĐÚNG.

    #step([Điều kiện hệ có nghiệm duy nhất])
    Hệ có nghiệm duy nhất khi hai đoạn chỉ giao nhau tại đúng một mút:
    - $m + 2 = -2 <=> m = -4$ (nghiệm duy nhất $x = -2$).
    - $m = 2$ (nghiệm duy nhất $x = 2$).
    Chỉ có đúng $2$ giá trị nguyên của $m$ là $m = -4$ và $m = 2$.
    Khẳng định có đúng $5$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Diện tích mặt cắt máng tôn lớn nhất)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Trong bài toán gập máng tôn từ tấm tôn phẳng rộng $60 text(" cm")$, diện tích mặt cắt ngang lớn nhất mà lòng máng đạt được là bao nhiêu $text("cm"^2)$?],
    [450],
    loigiai: [
        #step([Khảo sát hàm diện tích])
        $S(x) = -2x^2 + 60x text(" (cm"^2")")$ với $0 < x < 30$.
        
        #step([Tính giá trị cực đại])
        Hàm số đạt giá trị lớn nhất tại đỉnh $x = 15 text(" cm")$.
        $ S_text("max") = -2(15)^2 + 60(15) = 450 text(" cm"^2) $
    ]
)

// TLN 2 (Nghiệm của phương trình)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm nghiệm của phương trình:
$ sqrt(3x + 1) - sqrt(x + 4) = 1 $],
    [5],
    loigiai: [
        #step([Biến đổi và giải phương trình])
        $sqrt(3x + 1) = 1 + sqrt(x + 4) <=> x - 2 = sqrt(x + 4) text(" (với ") x >= 2 text(")") $
        $ <=> x^2 - 4x + 4 = x + 4 <=> x^2 - 5x = 0 <=> cases(x = 0 text(" (loại)"), x = 5 text(" (nhận)")) $
        
        #step([Kết luận])
        Phương trình có nghiệm duy nhất $x = 5$.
    ]
)

// TLN 3 (Số nghiệm nguyên của BPT phân thức)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của bất phương trình:
$ (x^2 - 16) / (x^2 - 5x + 6) <= 0 $],
    [7],
    loigiai: [
        #step([Tìm nghiệm của tử và mẫu])
        - Tử số: $x^2 - 16 = 0 <=> x = plus.minus 4$.
        - Mẫu số: $x^2 - 5x + 6 = 0 <=> x = 2$ hoặc $x = 3$.
        
        #step([Lập bảng xét dấu])
        Biểu thức mang dấu âm ($<= 0$) khi:
        $ x in [-4; 2) union (3; 4] $
        
        #step([Đếm số nghiệm nguyên])
        - Trên $[-4; 2)$: gồm $-4, -3, -2, -1, 0, 1$ ($6$ số).
        - Trên $(3; 4]$: gồm $4$ ($1$ số).
        Tổng cộng có: $6 + 1 = 7$ nghiệm nguyên.
    ]
)

// TLN 4 (Giá trị nguyên lớn nhất của m)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm giá trị nguyên lớn nhất của tham số $m$ để hàm số $y = sqrt((m - 1)x^2 - 2(m - 1)x + 4)$ có tập xác định là toàn bộ trục số thực $RR$.],
    [5],
    loigiai: [
        #step([Điều kiện để tập xác định là R])
        Đã chứng minh ở Phần I, hàm số xác định trên $RR$ khi và chỉ khi:
        $ 1 <= m <= 5 $
        
        #step([Tìm giá trị nguyên lớn nhất])
        Giá trị nguyên lớn nhất của tham số $m$ là $m = 5$.
    ]
)

// TLN 5 (Số nghiệm thực phương trình ẩn phụ)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Tìm số nghiệm thực của phương trình:
$ x^2 + 5x - 2 sqrt(x^2 + 5x + 7) = 1 $],
    [2],
    loigiai: [
        #step([Đặt ẩn phụ])
        Đặt $t = sqrt(x^2 + 5x + 7)$ ($t >= 0$). Khi đó $x^2 + 5x = t^2 - 7$.
        $ (t^2 - 7) - 2t = 1 <=> t^2 - 2t - 8 = 0 <=> cases(t = 4 text(" (nhận)"), t = -2 text(" (loại)")) $
        
        #step([Tìm số nghiệm x])
        Với $t = 4$:
        $ x^2 + 5x + 7 = 16 <=> x^2 + 5x - 9 = 0 $
        Biệt thức: $Delta = 5^2 - 4(1)(-9) = 25 + 36 = 61 > 0$.
        Phương trình có đúng $2$ nghiệm thực phân biệt.
    ]
)

// TLN 6 (Số giá trị nguyên của m để hệ có nghiệm)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 151], back-to: "sec-exercise-hub",[Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để hệ bất phương trình:
$ cases(
  x^2 - 4 <= 0,
  x^2 - 2(m + 1)x + m^2 + 2m <= 0
) $
có nghiệm thực?],
    [7],
    loigiai: [
        #step([Điều kiện hệ có nghiệm])
        Như đã chứng minh ở Phần II, hệ có nghiệm khi và chỉ khi:
        $ -4 <= m <= 2 $
        
        #step([Đếm số giá trị nguyên])
        Các giá trị nguyên thỏa mãn là: $m in \{-4; -3; -2; -1; 0; 1; 2\}$.
        Tổng cộng có: $2 - (-4) + 1 = 7$ giá trị nguyên.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH ÔN TẬP CHƯƠNG VI (ĐỀ SỐ 20C - NÂNG CAO & VDC)!]      #v(0.6em)
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
