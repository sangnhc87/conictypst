// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19C - NÂNG CAO & VDC)
// Lớp: Khối 10  ·  Mã đề: 148  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19C - NÂNG CAO & VDC)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THI VÀ ỨNG DỤNG — MÃ ĐỀ: 148",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 148]],
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
#lt-tn(num: 1, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình $sqrt(2x^2 - 2x - m) = x - 1$ có nghiệm thực.],
    (
        True([$m >= 0$]),
        [$m > 0$],
        [$m >= -1$],
        [$m <= 0$]
    ),
    loigiai: [
        Điều kiện: $x - 1 >= 0 <=> x >= 1$.
        Bình phương hai vế:
        $ 2x^2 - 2x - m = (x - 1)^2 <=> 2x^2 - 2x - m = x^2 - 2x + 1 <=> x^2 = m + 1 $
        Phương trình có nghiệm $x >= 1$ khi và chỉ khi:
        $ x = sqrt(m + 1) >= 1 <=> m + 1 >= 1 <=> m >= 0 $
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(x + 1) + sqrt(4 - x) = 3$ là],
    (
        True([$\{0; 3\}$]),
        [$\{0\}$],
        [$\{3\}$],
        [$\{1; 2\}$]
    ),
    loigiai: [
        Điều kiện xác định: $-1 <= x <= 4$.
        Bình phương hai vế (vì hai vế đều dương):
        $ (x + 1) + (4 - x) + 2 sqrt((x + 1)(4 - x)) = 9 $
        $ <=> 5 + 2 sqrt(-x^2 + 3x + 4) = 9 <=> 2 sqrt(-x^2 + 3x + 4) = 4 <=> sqrt(-x^2 + 3x + 4) = 2 $
        Bình phương tiếp:
        $ -x^2 + 3x + 4 = 4 <=> -x^2 + 3x = 0 <=> x(3 - x) = 0 <=> cases(x = 0, x = 3) $
        Cả hai giá trị $x = 0$ và $x = 3$ đều thuộc đoạn $[-1; 4]$.
        Tập nghiệm là $S = \{0; 3\}$.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $(x^2 - 3x + 2) sqrt(x - 3) = 0$ là],
    (
        True([$1$]),
        [$2$],
        [$3$],
        [$0$]
    ),
    loigiai: [
        Điều kiện xác định: $x - 3 >= 0 <=> x >= 3$.
        Phương trình tương đương:
        $ cases(x^2 - 3x + 2 = 0, x - 3 = 0) <=> cases(x = 1 text(" hoặc ") x = 2, x = 3) $
        Đối chiếu điều kiện $x >= 3$:
        - $x = 1$ và $x = 2$ không thỏa mãn (loại).
        - $x = 3$ thỏa mãn (nhận).
        Vậy phương trình có duy nhất $1$ nghiệm thực.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $|x^2 - 4x + 3| = x - 1$ là],
    (
        True([$\{1; 2; 4\}$]),
        [$\{1; 4\}$],
        [$\{2; 4\}$],
        [$\{1; 2\}$]
    ),
    loigiai: [
        Điều kiện: $x - 1 >= 0 <=> x >= 1$.
        Phương trình tương đương:
        - Trường hợp 1: $x^2 - 4x + 3 = x - 1 <=> x^2 - 5x + 4 = 0 <=> cases(x = 1, x = 4)$ (đều thỏa mãn $x >= 1$).
        - Trường hợp 2: $x^2 - 4x + 3 = -(x - 1) <=> x^2 - 3x + 2 = 0 <=> cases(x = 1, x = 2)$ (đều thỏa mãn $x >= 1$).
        Hợp hai trường hợp ta được tập nghiệm $S = \{1; 2; 4\}$.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $sqrt(x^2 - 2x + 5) + sqrt(x^2 - 2x + 10) = 5$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$4$]
    ),
    loigiai: [
        Ta có $x^2 - 2x + 5 = (x - 1)^2 + 4 >= 4$ và $x^2 - 2x + 10 = (x - 1)^2 + 9 >= 9$.
        Do đó:
        $ sqrt(x^2 - 2x + 5) + sqrt(x^2 - 2x + 10) >= sqrt(4) + sqrt(9) = 2 + 3 = 5 $
        Dấu bằng xảy ra khi và chỉ khi $(x - 1)^2 = 0 <=> x = 1$.
        Vậy phương trình có duy nhất $1$ nghiệm thực là $x = 1$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Nghiệm thực của phương trình $x^2 + 1 / x^2 - 3(x + 1 / x) + 4 = 0$ là],
    (
        True([$x = 1$]),
        [$x = -1$],
        [$x = 2$],
        [$x = 1/2$]
    ),
    loigiai: [
        Đặt $t = x + 1 / x$ ($|t| >= 2$). Khi đó $t^2 = x^2 + 1 / x^2 + 2 => x^2 + 1 / x^2 = t^2 - 2$.
        Phương trình trở thành:
        $ (t^2 - 2) - 3t + 4 = 0 <=> t^2 - 3t + 2 = 0 <=> (t - 1)(t - 2) = 0 <=> cases(t = 1 text(" (loại vì ") |t| >= 2 text(")"), t = 2 text(" (nhận)")) $
        Với $t = 2$:
        $ x + 1 / x = 2 <=> x^2 - 2x + 1 = 0 <=> (x - 1)^2 = 0 <=> x = 1 $
        Vậy nghiệm là $x = 1$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $sqrt(2x^2 + 3x + 5) + sqrt(2x^2 - 3x + 5) = 3x$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Vì vế trái luôn dương nên vế phải $3x > 0 <=> x > 0$.
        Nhân liên hợp:
        $ (2x^2 + 3x + 5) - (2x^2 - 3x + 5) = 6x $
        Do đó:
        $ sqrt(2x^2 + 3x + 5) - sqrt(2x^2 - 3x + 5) = (6x) / (3x) = 2 $
        Cộng hai phương trình lại:
        $ 2 sqrt(2x^2 + 3x + 5) = 3x + 2 <=> 4(2x^2 + 3x + 5) = (3x + 2)^2 $
        $ <=> 8x^2 + 12x + 20 = 9x^2 + 12x + 4 <=> x^2 = 16 <=> cases(x = 4 text(" (nhận vì ") x > 0 text(")"), x = -4 text(" (loại)")) $
        Vậy phương trình có đúng $1$ nghiệm là $x = 4$.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tổng các nghiệm thực của phương trình $2x^2 + 3x - 5 sqrt(2x^2 + 3x + 9) + 3 = 0$ bằng],
    (
        True([$-3/2$]),
        [$3/2$],
        [$-3$],
        [$3$]
    ),
    loigiai: [
        Đặt $t = sqrt(2x^2 + 3x + 9)$ ($t >= 0$). Khi đó $2x^2 + 3x = t^2 - 9$.
        Phương trình trở thành:
        $ (t^2 - 9) - 5t + 3 = 0 <=> t^2 - 5t - 6 = 0 <=> (t + 1)(t - 6) = 0 <=> cases(t = -1 text(" (loại)"), t = 6 text(" (nhận)")) $
        Với $t = 6$:
        $ sqrt(2x^2 + 3x + 9) = 6 <=> 2x^2 + 3x + 9 = 36 <=> 2x^2 + 3x - 27 = 0 $
        Vì $Delta = 9 - 4(2)(-27) = 225 > 0$ nên phương trình có hai nghiệm phân biệt.
        Theo định lý Viète, tổng hai nghiệm là $x_1 + x_2 = - 3 / 2$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Nghiệm âm của phương trình $sqrt(2x^2 + 5x + 3) = x + 1$ là],
    (
        True([$x = -1$]),
        [$x = -2$],
        [$x = -3$],
        [$x = -1/2$]
    ),
    loigiai: [
        Điều kiện: $x + 1 >= 0 <=> x >= -1$.
        Bình phương hai vế:
        $ 2x^2 + 5x + 3 = (x + 1)^2 <=> 2x^2 + 5x + 3 = x^2 + 2x + 1 <=> x^2 + 3x + 2 = 0 <=> cases(x = -1, x = -2) $
        Đối chiếu điều kiện $x >= -1$, ta loại $x = -2$ và nhận $x = -1$.
        Vậy nghiệm âm là $x = -1$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(x^2 - x - 6) = sqrt(2x^2 - 3x - 2)$ là],
    (
        True([$emptyset$]),
        [$\{-2\}$],
        [$\{2\}$],
        [$\{-2; 2\}$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ x^2 - x - 6 = 2x^2 - 3x - 2 <=> x^2 - 2x + 4 = 0 $
        Phương trình có biệt thức thu gọn $Delta' = (-1)^2 - 1(4) = -3 < 0$, do đó phương trình vô nghiệm.
        Vậy tập nghiệm là $S = emptyset$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình trùng phương $x^4 - 2(m + 1)x^2 + m^2 + 3m = 0$ có đúng $4$ nghiệm thực phân biệt.],
    (
        True([$0 < m < 1$]),
        [$m > 0$],
        [$m > -1$],
        [$-1 < m < 0$]
    ),
    loigiai: [
        Đặt $t = x^2$ ($t > 0$). Phương trình trở thành:
        $ t^2 - 2(m + 1)t + m^2 + 3m = 0 $
        Phương trình ban đầu có $4$ nghiệm thực phân biệt khi và chỉ khi phương trình bậc hai theo $t$ có hai nghiệm phân biệt dương:
        $ cases(Delta' > 0, S > 0, P > 0) $
        - $Delta' = (m + 1)^2 - (m^2 + 3m) = m^2 + 2m + 1 - m^2 - 3m = 1 - m > 0 <=> m < 1$.
        - $S = 2(m + 1) > 0 <=> m > -1$.
        - $P = m^2 + 3m > 0 <=> cases(m < -3, m > 0)$.
        Giao các điều kiện lại:
        $ cases(-1 < m < 1, m < -3 text(" hoặc ") m > 0) <=> 0 < m < 1 $
        Vậy điều kiện là $0 < m < 1$.
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $sqrt(x^2 + 1) + sqrt(x^2 + 9) = 4$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$4$]
    ),
    loigiai: [
        Ta có $x^2 >= 0$ với mọi $x in RR$.
        Do đó $sqrt(x^2 + 1) >= 1$ và $sqrt(x^2 + 9) >= 3$.
        Suy ra $sqrt(x^2 + 1) + sqrt(x^2 + 9) >= 1 + 3 = 4$.
        Dấu bằng xảy ra khi và chỉ khi $x^2 = 0 <=> x = 0$.
        Vậy phương trình có đúng $1$ nghiệm duy nhất là $x = 0$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phương trình tích có chứa căn)
#lt-ds(num: 13, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Cho phương trình: $(x^2 - 4) sqrt(3 - x) = 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện xác định của phương trình là $x <= 3$.]),
    True([Phương trình đã cho tương đương với $x^2 - 4 = 0$ hoặc $3 - x = 0$ (trên tập xác định).]),
    True([Tập nghiệm của phương trình là $S = \{-2; 2; 3\}$.]),
    [Tổng các nghiệm của phương trình đã cho bằng $5$.]
  ),
  loigiai: [
    #step([Điều kiện xác định])
    $3 - x >= 0 <=> x <= 3$. Mệnh đề a ĐÚNG.

    #step([Phương trình tích])
    Phương trình tương đương:
    $ cases(x^2 - 4 = 0, 3 - x = 0) <=> cases(x = plus.minus 2, x = 3) $
    Mệnh đề b ĐÚNG.

    #step([Đối chiếu điều kiện])
    Cả ba giá trị $x = -2, 2, 3$ đều thỏa mãn $x <= 3$.
    Tập nghiệm là $S = \{-2; 2; 3\}$. Mệnh đề c ĐÚNG.

    #step([Tính tổng các nghiệm])
    Tổng các nghiệm là: $(-2) + 2 + 3 = 3$ (chứ không phải bằng $5$).
    Khẳng định tổng bằng $5$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình đặt ẩn phụ chứa căn)
#lt-ds(num: 14, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Cho phương trình: $2x^2 + 3x - 5 sqrt(2x^2 + 3x + 9) + 3 = 0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đặt $t = sqrt(2x^2 + 3x + 9)$ với điều kiện $t >= 0$.]),
    True([Phương trình theo ẩn phụ $t$ là $t^2 - 5t - 6 = 0$.]),
    True([Nghiệm thỏa mãn của phương trình theo ẩn $t$ là $t = 6$.]),
    [Phương trình ban đầu có hai nghiệm đều mang dấu dương.]
  ),
  loigiai: [
    #step([Đặt ẩn phụ])
    Đặt $t = sqrt(2x^2 + 3x + 9)$ ($t >= 0$). Mệnh đề a ĐÚNG.

    #step([Đưa về phương trình theo t])
    $2x^2 + 3x = t^2 - 9$. Thay vào phương trình:
    $ (t^2 - 9) - 5t + 3 = 0 <=> t^2 - 5t - 6 = 0 $
    Mệnh đề b ĐÚNG.

    #step([Giải tìm t])
    $t^2 - 5t - 6 = 0 <=> (t + 1)(t - 6) = 0 <=> cases(t = -1 text(" (loại)"), t = 6 text(" (nhận)"))$. Mệnh đề c ĐÚNG.

    #step([Tìm nghiệm x])
    Với $t = 6$:
    $ 2x^2 + 3x + 9 = 36 <=> 2x^2 + 3x - 27 = 0 $
    Tích hai nghiệm: $P = x_1 x_2 = -27 / 2 < 0$.
    Vì tích âm nên phương trình có hai nghiệm trái dấu (một nghiệm dương và một nghiệm âm, chứ không thể đều mang dấu dương).
    Khẳng định hai nghiệm đều mang dấu dương là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế kéo cáp quang ra đảo)
#lt-ds(num: 15, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Một hòn đảo có trạm viễn thông ở vị trí $A$, cách điểm $H$ gần nhất trên bờ biển một khoảng $A H = 3 text(" km")$.
Một trung tâm dữ liệu đặt tại vị trí $B$ trên bờ biển cách $H$ một khoảng $H B = 8 text(" km")$ (bờ biển thẳng).
Người ta dự định kéo tuyến cáp quang từ đảo $A$ đến một điểm $M$ trên bờ biển nằm giữa $H$ và $B$ ($H M = x text(" km")$, $0 <= x <= 8$), sau đó kéo tiếp cáp dọc theo bờ biển từ $M$ đến $B$.
Biết chi phí đặt cáp ngầm dưới biển là $50$ triệu đồng/km và chi phí chôn cáp trên đất liền là $30$ triệu đồng/km.
Tổng chi phí lắp đặt cáp theo $x$ là:
$ C(x) = 50 sqrt(x^2 + 9) + 30(8 - x) text(" (triệu đồng)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu kéo cáp thẳng từ đảo $A$ về điểm $H$ rồi kéo dọc theo bờ đến $B$ ($x = 0$) thì chi phí là $390$ triệu đồng.]),
    True([Nếu kéo cáp ngầm trực tiếp dưới biển từ đảo $A$ đến trung tâm dữ liệu $B$ ($x = 8$) thì chi phí là $50 sqrt(73) text(" triệu đồng")$.]),
    True([Phương trình chi phí $C(x) = 360$ triệu đồng có nghiệm là $x = 2.25 text(" km")$ (tức $x = 9/4 text(" km")$).]),
    [Vị trí $M$ để chi phí lắp đặt nhỏ nhất là tại điểm $H$ ($x = 0$).]
  ),
  loigiai: [
    #step([Tính chi phí khi x = 0])
    $C(0) = 50 sqrt(9) + 30(8) = 150 + 240 = 390$ triệu đồng. Mệnh đề a ĐÚNG.

    #step([Tính chi phí khi x = 8])
    $C(8) = 50 sqrt(8^2 + 9) + 30(0) = 50 sqrt(73)$ triệu đồng. Mệnh đề b ĐÚNG.

    #step([Kiểm tra khi x = 9/4 = 2.25])
    Tại $x = 9/4$:
    $sqrt((9/4)^2 + 9) = sqrt(81/16 + 144/16) = sqrt(225/16) = 15/4$.
    $C(9/4) = 50(15/4) + 30(8 - 9/4) = 750/4 + 30(23/4) = (750 + 690)/4 = 1440/4 = 360$ triệu đồng. Mệnh đề c ĐÚNG.

    #step([Chi phí nhỏ nhất])
    Theo bài toán tối ưu chi phí (hoặc khảo sát hàm số):
    Điểm cực tiểu đạt được tại $x = 2.25 text(" km")$ với chi phí nhỏ nhất là $360$ triệu đồng $< 390$ triệu đồng.
    Điểm $H$ ($x = 0$) cho chi phí $390$ triệu đồng, không phải là chi phí nhỏ nhất.
    Khẳng định chi phí nhỏ nhất tại $x = 0$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Phương trình quy về bậc hai chứa tham số m)
#lt-ds(num: 16, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(2x^2 - 2x - m) = x - 1$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= 1$.]),
    True([Bình phương hai vế ta được phương trình bậc hai $x^2 = m + 1$.]),
    True([Phương trình ban đầu có nghiệm khi và chỉ khi $m >= 0$.]),
    [Khi $m = 3$, phương trình có hai nghiệm phân biệt là $x = -2$ và $x = 2$.]
  ),
  loigiai: [
    #step([Điều kiện có nghiệm])
    Vế phải không âm: $x - 1 >= 0 <=> x >= 1$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $2x^2 - 2x - m = (x - 1)^2 <=> 2x^2 - 2x - m = x^2 - 2x + 1 <=> x^2 = m + 1$. Mệnh đề b ĐÚNG.

    #step([Điều kiện có nghiệm])
    Để có nghiệm thỏa mãn $x >= 1$:
    $x = sqrt(m + 1) >= 1 <=> m + 1 >= 1 <=> m >= 0$. Mệnh đề c ĐÚNG.

    #step([Khi m = 3])
    $x^2 = 3 + 1 = 4 <=> x = plus.minus 2$.
    Vì điều kiện $x >= 1$ nên giá trị $x = -2$ bị loại, phương trình chỉ có duy nhất nghiệm $x = 2$.
    Khẳng định có hai nghiệm $x = -2$ và $x = 2$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Nghiệm lớn nhất)
#lt-tln(num: 17, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm nghiệm lớn nhất của phương trình:
$ sqrt(x + 1) + sqrt(4 - x) = 3 $],
    [3],
    loigiai: [
        #step([Giải phương trình])
        Điều kiện: $-1 <= x <= 4$.
        Bình phương hai vế:
        $ 5 + 2 sqrt(-x^2 + 3x + 4) = 9 <=> sqrt(-x^2 + 3x + 4) = 2 $
        $ <=> -x^2 + 3x + 4 = 4 <=> x(3 - x) = 0 <=> cases(x = 0, x = 3) $
        
        #step([Tìm nghiệm lớn nhất])
        Hai nghiệm đều thỏa mãn điều kiện.
        Nghiệm lớn nhất là $x = 3$.
    ]
)

// TLN 2 (Số nghiệm thực)
#lt-tln(num: 18, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm số nghiệm thực của phương trình $|x^2 - 4x + 3| = x - 1$.],
    [3],
    loigiai: [
        #step([Điều kiện])
        $x - 1 >= 0 <=> x >= 1$.
        
        #step([Giải hai trường hợp])
        - TH1: $x^2 - 4x + 3 = x - 1 <=> x^2 - 5x + 4 = 0 <=> cases(x = 1, x = 4)$ (nhận).
        - TH2: $x^2 - 4x + 3 = -(x - 1) <=> x^2 - 3x + 2 = 0 <=> cases(x = 1, x = 2)$ (nhận).
        
        #step([Đếm số nghiệm])
        Các nghiệm phân biệt là $x in {1; 2; 4}$ (tổng cộng có đúng $3$ nghiệm thực).
    ]
)

// TLN 3 (Số nghiệm thực phương trình đánh giá)
#lt-tln(num: 19, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm số nghiệm thực của phương trình:
$ sqrt(x^2 - 2x + 5) + sqrt(x^2 - 2x + 10) = 5 $],
    [1],
    loigiai: [
        #step([Đánh giá vế trái])
        $sqrt((x - 1)^2 + 4) >= 2$ và $sqrt((x - 1)^2 + 9) >= 3$.
        Cộng lại:
        $ sqrt((x - 1)^2 + 4) + sqrt((x - 1)^2 + 9) >= 2 + 3 = 5 $
        
        #step([Dấu bằng xảy ra])
        Dấu bằng xảy ra khi và chỉ khi $(x - 1)^2 = 0 <=> x = 1$.
        Vậy phương trình có đúng $1$ nghiệm thực.
    ]
)

// TLN 4 (Chi phí lắp đặt cáp quang nhỏ nhất)
#lt-tln(num: 20, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Trong bài toán kéo đường dây cáp quang từ đảo $A$ về đất liền, chi phí lắp đặt cáp (triệu đồng) phụ thuộc vào vị trí cập bờ $x text(" (km)")$ theo hàm số:
$ C(x) = 50 sqrt(x^2 + 9) + 30(8 - x) $
Hỏi chi phí lắp đặt thấp nhất mà chủ đầu tư có thể đạt được là bao nhiêu triệu đồng?],
    [360],
    loigiai: [
        #step([Khảo sát hàm chi phí])
        Đổi biến hoặc sử dụng bất đẳng thức / đạo hàm:
        $ C'(x) = (50x) / sqrt(x^2 + 9) - 30 $
        $ C'(x) = 0 <=> 5x = 3 sqrt(x^2 + 9) <=> 25x^2 = 9(x^2 + 9) <=> 16x^2 = 81 <=> x = 9/4 = 2.25 text(" km") $
        
        #step([Tính chi phí nhỏ nhất])
        Tại $x = 9/4$:
        $ C(9/4) = 50 sqrt(81/16 + 9) + 30(8 - 9/4) = 50 cdot 15/4 + 30 cdot 23/4 = 750/4 + 690/4 = 1440/4 = 360 $
        Vậy chi phí nhỏ nhất là $360$ triệu đồng.
    ]
)

// TLN 5 (Nghiệm của phương trình liên hợp)
#lt-tln(num: 21, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Tìm nghiệm của phương trình:
$ sqrt(2x^2 + 3x + 5) + sqrt(2x^2 - 3x + 5) = 3x $],
    [4],
    loigiai: [
        #step([Điều kiện])
        Vế trái dương nên $3x > 0 <=> x > 0$.
        
        #step([Nhân liên hợp])
        $ sqrt(2x^2 + 3x + 5) - sqrt(2x^2 - 3x + 5) = (6x) / (3x) = 2 $
        
        #step([Giải tìm x])
        Cộng hai vế:
        $ 2 sqrt(2x^2 + 3x + 5) = 3x + 2 <=> 4(2x^2 + 3x + 5) = (3x + 2)^2 $
        $ <=> 8x^2 + 12x + 20 = 9x^2 + 12x + 4 <=> x^2 = 16 <=> x = 4 text(" (vì ") x > 0 text(")") $
        Vậy nghiệm là $x = 4$.
    ]
)

// TLN 6 (Giá trị của tham số m để có 4 nghiệm phân biệt)
#lt-tln(num: 22, de: [Đề 3 (C) — Mã 148], back-to: "sec-exercise-hub",[Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để phương trình trùng phương $x^4 - 2(m + 1)x^2 + m^2 + 3m = 0$ có đúng $4$ nghiệm thực phân biệt?],
    [0],
    loigiai: [
        #step([Điều kiện có 4 nghiệm thực phân biệt])
        Đặt $t = x^2 > 0$. Phương trình trở thành $t^2 - 2(m + 1)t + m^2 + 3m = 0$.
        Điều kiện để có hai nghiệm phân biệt $t > 0$ là:
        $ cases(Delta' > 0, S > 0, P > 0) <=> cases(1 - m > 0, 2(m + 1) > 0, m(m + 3) > 0) $
        $ <=> cases(m < 1, m > -1, m < -3 text(" hoặc ") m > 0) <=> 0 < m < 1 $
        
        #step([Đếm số giá trị nguyên])
        Trong khoảng $(0; 1)$ không có số nguyên nào.
        Vậy có đúng $0$ giá trị nguyên của $m$ thỏa mãn.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19C - NÂNG CAO & VDC)!]      #v(0.6em)
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
