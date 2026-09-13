// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19B - VẬN DỤNG & THỰC TIỄN)
// Lớp: Khối 10  ·  Mã đề: 147  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19B - VẬN DỤNG & THỰC TIỄN)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 147",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 147]],
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
#lt-tn(num: 1, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(3x^2 - 4x - 1) = sqrt(2x^2 - 2x + 2)$ là],
    (
        True([$\{-1; 3\}$]),
        [$\{3\}$],
        [$\{-1\}$],
        [$\{1; -3\}$]
    ),
    loigiai: [
        Bình phương hai vế của phương trình:
        $ 3x^2 - 4x - 1 = 2x^2 - 2x + 2 <=> x^2 - 2x - 3 = 0 <=> cases(x = -1, x = 3) $
        Thử lại vào phương trình ban đầu:
        - Với $x = -1$: $sqrt(3(-1)^2 - 4(-1) - 1) = sqrt(6)$ và $sqrt(2(-1)^2 - 2(-1) + 2) = sqrt(6)$ (thỏa mãn).
        - Với $x = 3$: $sqrt(3(3)^2 - 4(3) - 1) = sqrt(14)$ và $sqrt(2(3)^2 - 2(3) + 2) = sqrt(14)$ (thỏa mãn).
        Vậy tập nghiệm là $S = \{-1; 3\}$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $sqrt(x^2 - 2x - 3) = 2x - 5$ là],
    (
        True([$0$]),
        [$1$],
        [$2$],
        [$3$]
    ),
    loigiai: [
        Điều kiện: $2x - 5 >= 0 <=> x >= 5/2$.
        Bình phương hai vế:
        $ x^2 - 2x - 3 = (2x - 5)^2 <=> x^2 - 2x - 3 = 4x^2 - 20x + 25 $
        $ <=> 3x^2 - 18x + 28 = 0 $
        Biệt thức thu gọn: $Delta' = (-9)^2 - 3(28) = 81 - 84 = -3 < 0$.
        Phương trình bậc hai vô nghiệm, do đó phương trình ban đầu vô nghiệm (có $0$ nghiệm thực).
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(5x^2 + 10x + 1) = x + 1$ là],
    (
        True([$\{0\}$]),
        [$\{-2; 0\}$],
        [$\{-2\}$],
        [$emptyset$]
    ),
    loigiai: [
        Điều kiện: $x + 1 >= 0 <=> x >= -1$.
        Bình phương hai vế:
        $ 5x^2 + 10x + 1 = (x + 1)^2 <=> 5x^2 + 10x + 1 = x^2 + 2x + 1 <=> 4x^2 + 8x = 0 <=> cases(x = 0, x = -2) $
        Đối chiếu điều kiện $x >= -1$, ta loại $x = -2$ và nhận $x = 0$.
        Vậy tập nghiệm là $S = \{0\}$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $x^2 - 3x + sqrt(x^2 - 3x + 11) = 9$ là],
    (
        True([$2$]),
        [$1$],
        [$4$],
        [$0$]
    ),
    loigiai: [
        Đặt $t = sqrt(x^2 - 3x + 11)$ ($t >= 0$). Khi đó $t^2 = x^2 - 3x + 11 => x^2 - 3x = t^2 - 11$.
        Phương trình trở thành:
        $ (t^2 - 11) + t = 9 <=> t^2 + t - 20 = 0 <=> (t - 4)(t + 5) = 0 <=> cases(t = 4 text(" (nhận)"), t = -5 text(" (loại)")) $
        Với $t = 4$:
        $ sqrt(x^2 - 3x + 11) = 4 <=> x^2 - 3x + 11 = 16 <=> x^2 - 3x - 5 = 0 $
        Vì $Delta = (-3)^2 - 4(1)(-5) = 9 + 20 = 29 > 0$ nên phương trình có đúng $2$ nghiệm thực phân biệt.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tổng các bình phương các nghiệm thực của phương trình trùng phương $x^4 - 6x^2 + 8 = 0$ bằng],
    (
        True([$12$]),
        [$6$],
        [$8$],
        [$16$]
    ),
    loigiai: [
        Đặt $t = x^2$ ($t >= 0$). Phương trình trở thành:
        $ t^2 - 6t + 8 = 0 <=> (t - 2)(t - 4) = 0 <=> cases(t = 2, t = 4) $
        - Với $t = 2 => x = plus.minus sqrt(2)$.
        - Với $t = 4 => x = plus.minus 2$.
        Các nghiệm thực là: $x_1 = sqrt(2), x_2 = -sqrt(2), x_3 = 2, x_4 = -2$.
        Tổng các bình phương:
        $ (sqrt(2))^2 + (-sqrt(2))^2 + 2^2 + (-2)^2 = 2 + 2 + 4 + 4 = 12 $
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(2x^2 - 7x + 6) = 2 - x$ là],
    (
        True([$\{1; 2\}$]),
        [$\{1\}$],
        [$\{2\}$],
        [$\{1; 3\}$]
    ),
    loigiai: [
        Điều kiện: $2 - x >= 0 <=> x <= 2$.
        Bình phương hai vế:
        $ 2x^2 - 7x + 6 = (2 - x)^2 <=> 2x^2 - 7x + 6 = x^2 - 4x + 4 <=> x^2 - 3x + 2 = 0 <=> cases(x = 1, x = 2) $
        Cả hai giá trị $x = 1$ và $x = 2$ đều thỏa mãn điều kiện $x <= 2$.
        Vậy tập nghiệm là $S = \{1; 2\}$.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $sqrt(x^2 - 5) = sqrt(x - 3)$ là],
    (
        True([$0$]),
        [$1$],
        [$2$],
        [$3$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ x^2 - 5 = x - 3 <=> x^2 - x - 2 = 0 <=> cases(x = -1, x = 2) $
        Thử lại vào phương trình ban đầu:
        - Với $x = -1$: Vế phải $x - 3 = -4 < 0$ (loại).
        - Với $x = 2$: Vế phải $x - 3 = -1 < 0$ (loại).
        Cả hai nghiệm đều không thỏa mãn, do đó phương trình vô nghiệm (có $0$ nghiệm).
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sqrt(2x^2 + 5x - 2) = x + 2$ là],
    (
        True([$x = 2$]),
        [$x = -3$],
        [$x = 1$],
        [$x = 0$]
    ),
    loigiai: [
        Điều kiện: $x + 2 >= 0 <=> x >= -2$.
        Bình phương hai vế:
        $ 2x^2 + 5x - 2 = (x + 2)^2 <=> 2x^2 + 5x - 2 = x^2 + 4x + 4 <=> x^2 + x - 6 = 0 <=> cases(x = 2, x = -3) $
        Đối chiếu điều kiện $x >= -2$, ta loại $x = -3$ và nhận $x = 2$.
        Vậy nghiệm của phương trình là $x = 2$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm tất cả các giá trị của tham số $m$ để phương trình $sqrt(x^2 - 4x + m) = x - 1$ VÔ NGHIỆM.],
    (
        True([$m < 3$]),
        [$m > 3$],
        [$m >= 3$],
        [$m <= 3$]
    ),
    loigiai: [
        Điều kiện có nghiệm: $x - 1 >= 0 <=> x >= 1$.
        Bình phương hai vế:
        $ x^2 - 4x + m = (x - 1)^2 <=> x^2 - 4x + m = x^2 - 2x + 1 <=> 2x = m - 1 <=> x = (m - 1) / 2 $
        Để phương trình vô nghiệm thì giá trị tìm được không thỏa mãn điều kiện $x >= 1$:
        $ (m - 1) / 2 < 1 <=> m - 1 < 2 <=> m < 3 $
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tích các nghiệm thực của phương trình trùng phương $x^4 - 7x^2 + 12 = 0$ bằng],
    (
        True([$12$]),
        [$-12$],
        [$7$],
        [$-7$]
    ),
    loigiai: [
        Đặt $t = x^2$ ($t >= 0$). Ta có phương trình:
        $ t^2 - 7t + 12 = 0 <=> (t - 3)(t - 4) = 0 <=> cases(t = 3, t = 4) $
        - $t = 3 => x = plus.minus sqrt(3)$.
        - $t = 4 => x = plus.minus 2$.
        Tích các nghiệm thực:
        $ (sqrt(3)) cdot (-sqrt(3)) cdot (2) cdot (-2) = (-3) cdot (-4) = 12 $
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Hai con tàu $A$ và $B$ xuất phát từ hai bến cảng. Tàu $A$ chạy thẳng theo hướng Bắc với vận tốc $30 text(" km/h")$. Tàu $B$ chạy thẳng theo hướng Đông với vận tốc $40 text(" km/h")$.
Hỏi sau bao lâu kể từ lúc xuất phát thì khoảng cách giữa hai tàu bằng $100 text(" km")$?],
    (
        True([$2$ giờ]),
        [$1.5$ giờ],
        [$2.5$ giờ],
        [$3$ giờ]
    ),
    loigiai: [
        Gọi $t text(" (giờ)")$ ($t > 0$) là thời gian kể từ lúc xuất phát.
        Quãng đường tàu $A$ đi được là $30t text(" km")$.
        Quãng đường tàu $B$ đi được là $40t text(" km")$.
        Vì hai hướng chuyển động vuông góc nhau nên khoảng cách giữa hai tàu là:
        $ d(t) = sqrt((30t)^2 + (40t)^2) = sqrt(900t^2 + 1600t^2) = sqrt(2500t^2) = 50t $
        Theo đề bài $d(t) = 100 text(" km")$:
        $ 50t = 100 <=> t = 2 text(" giờ") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Số giao điểm của đồ thị hàm số $y = sqrt(x^2 - 6x + 5)$ và đường thẳng $y = 2$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$4$]
    ),
    loigiai: [
        Phương trình hoành độ giao điểm:
        $ sqrt(x^2 - 6x + 5) = 2 <=> x^2 - 6x + 5 = 4 <=> x^2 - 6x + 1 = 0 $
        Biệt thức thu gọn: $Delta' = (-3)^2 - 1(1) = 9 - 1 = 8 > 0$.
        Phương trình có hai nghiệm phân biệt $x = 3 plus.minus 2 sqrt(2)$.
        Vậy có đúng $2$ giao điểm.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phương trình căn thức và phân tích đồ thị)
#lt-ds(num: 13, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(x^2 - 2x + 4) = x + 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= -1$.]),
    True([Bình phương hai vế ta được phương trình bậc nhất $4x = 3$.]),
    True([Nghiệm của phương trình đã cho là $x = 3/4$.]),
    [Nghiệm của phương trình là một số nguyên.]
  ),
  loigiai: [
    #step([Tìm điều kiện])
    Vế phải không âm: $x + 1 >= 0 <=> x >= -1$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $x^2 - 2x + 4 = (x + 1)^2 <=> x^2 - 2x + 4 = x^2 + 2x + 1 <=> 4x = 3$. Mệnh đề b ĐÚNG.

    #step([Tìm nghiệm])
    $4x = 3 <=> x = 3/4$. Giá trị $3/4 >= -1$ thỏa mãn điều kiện. Mệnh đề c ĐÚNG.

    #step([Kiểm tra tính chất nghiệm])
    Giá trị $x = 3/4 = 0.75$ là số hữu tỉ (phân số), không phải là một số nguyên.
    Khẳng định nghiệm là một số nguyên là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình đặt ẩn phụ)
#lt-ds(num: 14, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Cho phương trình: $x^2 - 4x + sqrt(x^2 - 4x + 9) = 11$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đặt $t = sqrt(x^2 - 4x + 9)$ với điều kiện $t >= sqrt(5)$.]),
    True([Phương trình theo ẩn phụ $t$ có dạng $t^2 + t - 20 = 0$.]),
    True([Phương trình theo ẩn phụ $t$ có duy nhất nghiệm thỏa mãn là $t = 4$.]),
    [Phương trình ban đầu có đúng $4$ nghiệm thực phân biệt.]
  ),
  loigiai: [
    #step([Đặt ẩn phụ và tìm điều kiện của t])
    $x^2 - 4x + 9 = (x - 2)^2 + 5 >= 5 => t = sqrt(x^2 - 4x + 9) >= sqrt(5)$. Mệnh đề a ĐÚNG.

    #step([Đưa về phương trình theo t])
    Ta có $x^2 - 4x = t^2 - 9$. Thay vào phương trình:
    $ (t^2 - 9) + t = 11 <=> t^2 + t - 20 = 0 $
    Mệnh đề b ĐÚNG.

    #step([Giải tìm t])
    $t^2 + t - 20 = 0 <=> (t - 4)(t + 5) = 0 <=> cases(t = 4 text(" (nhận vì ") 4 >= sqrt(5) approx 2.24 text(")"), t = -5 text(" (loại)"))$. Mệnh đề c ĐÚNG.

    #step([Tìm nghiệm x và đếm số nghiệm])
    Với $t = 4$:
    $ sqrt(x^2 - 4x + 9) = 4 <=> x^2 - 4x + 9 = 16 <=> x^2 - 4x - 7 = 0 $
    Biệt thức thu gọn: $Delta' = (-2)^2 - 1(-7) = 4 + 7 = 11 > 0$.
    Phương trình chỉ có đúng $2$ nghiệm thực phân biệt $x = 2 plus.minus sqrt(11)$ (chứ không phải $4$ nghiệm).
    Khẳng định có đúng $4$ nghiệm thực là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế khoảng cách giữa hai xe tại ngã tư)
#lt-ds(num: 15, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tại một ngã tư giao nhau vuông góc giữa hai tuyến đường lớn Đông - Tây và Nam - Bắc:
Lúc $8$ giờ sáng, một xe ô tô thứ nhất đang ở vị trí cách ngã tư $40 text(" km")$ về phía Tây và di chuyển về phía Đông (hướng về ngã tư) với vận tốc không đổi $60 text(" km/h")$.
Cùng lúc đó, xe ô tô thứ hai xuất phát từ ngã tư chạy thẳng về phía Nam với vận tốc không đổi $80 text(" km/h")$.
Gọi $t text(" (giờ)")$ ($0 <= t <= 1$) là thời gian tính từ lúc $8$ giờ sáng.
Khoảng cách giữa hai ô tô tại thời điểm $t$ được xác định bởi công thức:
$ d(t) = sqrt((60t - 40)^2 + (80t)^2) = sqrt(10000t^2 - 4800t + 1600) text(" (km)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Lúc $8$ giờ sáng ($t = 0$), khoảng cách giữa hai xe là $40 text(" km")$.]),
    True([Lúc $8$ giờ $30$ phút ($t = 0.5$ giờ), khoảng cách giữa hai xe là $10 sqrt(17) text(" km")$.]),
    True([Phương trình $d(t) = 40 text(" km")$ có nghiệm dương là $t = 0.48$ giờ (tức sau $28.8$ phút).]),
    [Khoảng cách ngắn nhất giữa hai ô tô trong suốt hành trình bằng $35 text(" km")$.]
  ),
  loigiai: [
    #step([Tính khoảng cách khi t = 0])
    $d(0) = sqrt(1600) = 40 text(" km")$. Mệnh đề a ĐÚNG.

    #step([Tính khoảng cách khi t = 0.5])
    Tại $t = 0.5$: Vị trí xe 1: $60(0.5) - 40 = -10 text(" km")$.
    Vị trí xe 2: $80(0.5) = 40 text(" km")$.
    Khoảng cách $d(0.5) = sqrt((-10)^2 + 40^2) = sqrt(100 + 1600) = sqrt(1700) = 10 sqrt(17) text(" km")$. Mệnh đề b ĐÚNG.

    #step([Giải phương trình d(t) = 40])
    $sqrt(10000t^2 - 4800t + 1600) = 40 <=> 10000t^2 - 4800t + 1600 = 1600$
    $<=> 10000t^2 - 4800t = 0 <=> 100t(100t - 48) = 0 <=> cases(t = 0, t = 48/100 = 0.48 text(" giờ"))$.
    Đổi ra phút: $0.48 times 60 = 28.8$ phút. Mệnh đề c ĐÚNG.

    #step([Tìm khoảng cách ngắn nhất])
    Hàm số $f(t) = 10000t^2 - 4800t + 1600$ đạt giá trị nhỏ nhất tại đỉnh:
    $ t_I = - (-4800) / (2 cdot 10000) = 4800 / 20000 = 0.24 text(" giờ") $
    Giá trị nhỏ nhất của $f(t)$ là:
    $ f(0.24) = 10000(0.24)^2 - 4800(0.24) + 1600 = 576 - 1152 + 1600 = 1024 $
    Khoảng cách ngắn nhất là $d_text("min") = sqrt(1024) = 32 text(" km")$ (chứ không phải $35 text(" km")$).
    Khẳng định khoảng cách ngắn nhất bằng $35 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Phương trình quy về bậc hai chứa tham số m)
#lt-ds(num: 16, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(x^2 - 2x + m) = 2x - 1$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= 1/2$.]),
    True([Bình phương hai vế đưa về phương trình bậc hai $3x^2 - 2x + 1 - m = 0$.]),
    True([Khi $m = 1$, phương trình bậc hai thu được có hai nghiệm là $x = 0$ và $x = 2/3$.]),
    [Khi $m = 1$, cả hai giá trị $x = 0$ và $x = 2/3$ đều là nghiệm của phương trình ban đầu.]
  ),
  loigiai: [
    #step([Điều kiện có nghiệm])
    Vế phải không âm: $2x - 1 >= 0 <=> x >= 1/2$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $x^2 - 2x + m = (2x - 1)^2 <=> x^2 - 2x + m = 4x^2 - 4x + 1 <=> 3x^2 - 2x + 1 - m = 0$. Mệnh đề b ĐÚNG.

    #step([Khi m = 1])
    Phương trình trở thành $3x^2 - 2x = 0 <=> x(3x - 2) = 0 <=> cases(x = 0, x = 2/3)$. Mệnh đề c ĐÚNG.

    #step([Đối chiếu điều kiện khi m = 1])
    - Với $x = 0$: Không thỏa mãn điều kiện $x >= 1/2$ (loại).
    - Với $x = 2/3$: Thỏa mãn $2/3 >= 1/2$ (nhận).
    Chỉ có duy nhất $x = 2/3$ là nghiệm.
    Khẳng định cả hai giá trị đều là nghiệm là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm nghiệm)
#lt-tln(num: 17, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm nghiệm của phương trình:
$ sqrt(2x^2 + 5x - 2) = x + 2 $],
    [2],
    loigiai: [
        #step([Điều kiện có nghiệm])
        $x + 2 >= 0 <=> x >= -2$.
        
        #step([Bình phương hai vế])
        $ 2x^2 + 5x - 2 = (x + 2)^2 <=> 2x^2 + 5x - 2 = x^2 + 4x + 4 $
        $ <=> x^2 + x - 6 = 0 <=> (x - 2)(x + 3) = 0 <=> cases(x = 2, x = -3) $
        
        #step([Đối chiếu điều kiện])
        Vì $x >= -2$ nên ta loại $x = -3$ và nhận $x = 2$.
        Vậy nghiệm của phương trình là $x = 2$.
    ]
)

// TLN 2 (Số nghiệm thực)
#lt-tln(num: 18, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm số nghiệm thực của phương trình:
$ sqrt(x^2 - 3x + 2) = sqrt(2x^2 - 7x + 6) $],
    [1],
    loigiai: [
        #step([Bình phương hai vế])
        $ x^2 - 3x + 2 = 2x^2 - 7x + 6 <=> x^2 - 4x + 4 = 0 <=> (x - 2)^2 = 0 <=> x = 2 $
        
        #step([Thử lại])
        Thay $x = 2$ vào phương trình ban đầu:
        $sqrt(2^2 - 3(2) + 2) = sqrt(0) = 0$ và $sqrt(2(2^2) - 7(2) + 6) = sqrt(0) = 0$.
        Giá trị $x = 2$ thỏa mãn.
        Vậy phương trình có duy nhất $1$ nghiệm thực.
    ]
)

// TLN 3 (Tổng các nghiệm phương trình đặt ẩn phụ)
#lt-tln(num: 19, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm tổng các nghiệm thực của phương trình:
$ x^2 + 2x - 2 sqrt(x^2 + 2x + 4) = 4 $],
    [-2],
    loigiai: [
        #step([Đặt ẩn phụ])
        Đặt $t = sqrt(x^2 + 2x + 4)$ ($t >= sqrt(3)$).
        Khi đó $x^2 + 2x = t^2 - 4$.
        
        #step([Phương trình theo ẩn t])
        $ (t^2 - 4) - 2t = 4 <=> t^2 - 2t - 8 = 0 <=> (t + 2)(t - 4) = 0 <=> cases(t = -2 text(" (loại)"), t = 4 text(" (nhận)")) $
        
        #step([Tìm nghiệm x và tính tổng])
        Với $t = 4$:
        $ sqrt(x^2 + 2x + 4) = 4 <=> x^2 + 2x + 4 = 16 <=> x^2 + 2x - 12 = 0 $
        Theo định lý Viète, tổng hai nghiệm của phương trình là:
        $ x_1 + x_2 = - 2 / 1 = -2 $
    ]
)

// TLN 4 (Toán thực tế chiếc thang trượt)
#lt-tln(num: 20, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Một chiếc thang dài $5 text(" m")$ tựa vào một bức tường thẳng đứng. Ban đầu chân thang cách chân tường một khoảng $x text(" (m)")$ ($0 < x < 5$).
Biết rằng khi chân thang bị trượt ra xa chân tường thêm $1 text(" m")$ thì đỉnh thang trượt hạ thấp xuống đúng $1 text(" m")$.
Hỏi khoảng cách ban đầu $x$ từ chân thang đến chân tường là bao nhiêu mét?],
    [3],
    loigiai: [
        #step([Thiết lập mối quan hệ độ cao ban đầu và sau khi trượt])
        Gọi độ cao ban đầu của đỉnh thang là $h_1 = sqrt(5^2 - x^2) = sqrt(25 - x^2) text(" (m)")$.
        Khi chân thang cách tường $x + 1 text(" (m)")$, độ cao của đỉnh thang là:
        $ h_2 = sqrt(5^2 - (x + 1)^2) = sqrt(25 - (x + 1)^2) text(" (m)") $
        
        #step([Lập phương trình])
        Đỉnh thang hạ thấp $1 text(" m")$ nên $h_1 - h_2 = 1$:
        $ sqrt(25 - x^2) - sqrt(25 - (x + 1)^2) = 1 <=> sqrt(25 - (x + 1)^2) = sqrt(25 - x^2) - 1 $
        
        #step([Giải phương trình])
        Bình phương hai vế:
        $ 25 - (x^2 + 2x + 1) = (25 - x^2) - 2 sqrt(25 - x^2) + 1 $
        $ <=> 24 - x^2 - 2x = 26 - x^2 - 2 sqrt(25 - x^2) $
        $ <=> 2 sqrt(25 - x^2) = 2x + 2 <=> sqrt(25 - x^2) = x + 1 $
        Bình phương tiếp:
        $ 25 - x^2 = (x + 1)^2 <=> 25 - x^2 = x^2 + 2x + 1 <=> 2x^2 + 2x - 24 = 0 <=> x^2 + x - 12 = 0 $
        $ <=> (x - 3)(x + 4) = 0 <=> cases(x = 3, x = -4) $
        Vì $x > 0$ nên $x = 3 text(" m")$.
    ]
)

// TLN 5 (Số nghiệm nguyên)
#lt-tln(num: 21, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của phương trình:
$ sqrt(2x^2 - 5x + 3) = sqrt(x^2 - x - 1) $],
    [1],
    loigiai: [
        #step([Bình phương hai vế])
        $ 2x^2 - 5x + 3 = x^2 - x - 1 <=> x^2 - 4x + 4 = 0 <=> (x - 2)^2 = 0 <=> x = 2 $
        
        #step([Thử lại nghiệm])
        Tại $x = 2$:
        - $2(2)^2 - 5(2) + 3 = 8 - 10 + 3 = 1 > 0$.
        - $2^2 - 2 - 1 = 1 > 0$.
        Cả hai biểu thức dưới căn đều bằng $1 > 0$, thỏa mãn $sqrt(1) = sqrt(1)$.
        
        #step([Kết luận])
        Phương trình có duy nhất $1$ nghiệm nguyên là $x = 2$.
    ]
)

// TLN 6 (Giá trị nguyên lớn nhất của tham số m)
#lt-tln(num: 22, de: [Đề 2 (B) — Mã 147], back-to: "sec-exercise-hub",[Tìm giá trị nguyên lớn nhất của tham số $m$ để phương trình $sqrt(x^2 - 4x + m) = x - 3$ có nghiệm thực.],
    [3],
    loigiai: [
        #step([Điều kiện có nghiệm])
        $x - 3 >= 0 <=> x >= 3$.
        
        #step([Bình phương hai vế])
        $ x^2 - 4x + m = (x - 3)^2 <=> x^2 - 4x + m = x^2 - 6x + 9 <=> 2x = 9 - m <=> x = (9 - m) / 2 $
        
        #step([Điều kiện nghiệm thỏa mãn])
        Để nghiệm thỏa mãn $x >= 3$:
        $ (9 - m) / 2 >= 3 <=> 9 - m >= 6 <=> m <= 3 $
        
        #step([Tìm m nguyên lớn nhất])
        Giá trị nguyên lớn nhất của $m$ là $m = 3$.
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19B - VẬN DỤNG & THỰC TIỄN)!]      #v(0.6em)
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
