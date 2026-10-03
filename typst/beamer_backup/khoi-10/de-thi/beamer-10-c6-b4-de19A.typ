// ═══════════════════════════════════════════════════════════════════════════
// BEAMER ĐỀ THI: BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19A - CƠ BẢN ĐẾN VẬN DỤNG)
// Lớp: Khối 10  ·  Mã đề: 146  ·  GV: Nguyễn Văn Sang
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
  title: "BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subtitle: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG — MÃ ĐỀ: 146",
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
      pad(left: 8pt)[#text(size: 9pt, fill: s.muted, weight: "bold")[MÃ ĐỀ: 146]],
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
#lt-tn(num: 1, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(x^2 - 3x + 2) = sqrt(x - 1)$ là],
    (
        True([$\{1; 3\}$]),
        [$\{1\}$],
        [$\{3\}$],
        [$\{2; 3\}$]
    ),
    loigiai: [
        Bình phương hai vế của phương trình:
        $ x^2 - 3x + 2 = x - 1 <=> x^2 - 4x + 3 = 0 <=> cases(x = 1, x = 3) $
        Thử lại vào phương trình ban đầu:
        - Với $x = 1$: $sqrt(1 - 3 + 2) = sqrt(1 - 1) <=> 0 = 0$ (thỏa mãn).
        - Với $x = 3$: $sqrt(9 - 9 + 2) = sqrt(3 - 1) <=> sqrt(2) = sqrt(2)$ (thỏa mãn).
        Vậy tập nghiệm là $S = \{1; 3\}$.
    ]
)

// TN 2
#lt-tn(num: 2, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $sqrt(2x^2 - 5x + 3) = x - 1$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Điều kiện có nghiệm: $x - 1 >= 0 <=> x >= 1$.
        Bình phương hai vế:
        $ 2x^2 - 5x + 3 = (x - 1)^2 <=> 2x^2 - 5x + 3 = x^2 - 2x + 1 <=> x^2 - 3x + 2 = 0 <=> cases(x = 1, x = 2) $
        Cả hai giá trị $x = 1$ và $x = 2$ đều thỏa mãn $x >= 1$.
        Vậy phương trình có đúng $2$ nghiệm.
    ]
)

// TN 3
#lt-tn(num: 3, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(3x^2 - 9x + 1) = x - 2$ là],
    (
        True([$\{3\}$]),
        [$\{-1/2; 3\}$],
        [$\{-1/2\}$],
        [$emptyset$]
    ),
    loigiai: [
        Điều kiện: $x - 2 >= 0 <=> x >= 2$.
        Bình phương hai vế:
        $ 3x^2 - 9x + 1 = (x - 2)^2 <=> 3x^2 - 9x + 1 = x^2 - 4x + 4 $
        $ <=> 2x^2 - 5x - 3 = 0 <=> (2x + 1)(x - 3) = 0 <=> cases(x = -1/2, x = 3) $
        Đối chiếu điều kiện $x >= 2$, ta loại $x = -1/2$ và nhận $x = 3$.
        Vậy tập nghiệm là $S = \{3\}$.
    ]
)

// TN 4
#lt-tn(num: 4, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình $sqrt(x^2 - 4x + 3) = x - 3$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Điều kiện: $x - 3 >= 0 <=> x >= 3$.
        Bình phương hai vế:
        $ x^2 - 4x + 3 = (x - 3)^2 <=> x^2 - 4x + 3 = x^2 - 6x + 9 <=> 2x = 6 <=> x = 3 $
        Giá trị $x = 3$ thỏa mãn điều kiện $x >= 3$.
        Vậy phương trình có duy nhất $1$ nghiệm thực.
    ]
)

// TN 5
#lt-tn(num: 5, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tổng các nghiệm của phương trình $sqrt(2x^2 - 3x - 5) = sqrt(x^2 - 2x + 1)$ bằng],
    (
        True([$1$]),
        [$-1$],
        [$5$],
        [$6$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ 2x^2 - 3x - 5 = x^2 - 2x + 1 <=> x^2 - x - 6 = 0 <=> cases(x = -2, x = 3) $
        Thử lại vào phương trình:
        - Với $x = -2$: $sqrt(2(4) + 6 - 5) = sqrt(9) = 3$ và $sqrt(4 + 4 + 1) = sqrt(9) = 3$ (thỏa mãn).
        - Với $x = 3$: $sqrt(2(9) - 9 - 5) = sqrt(4) = 2$ và $sqrt(9 - 6 + 1) = sqrt(4) = 2$ (thỏa mãn).
        Tổng các nghiệm là: $(-2) + 3 = 1$.
    ]
)

// TN 6
#lt-tn(num: 6, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Nghiệm của phương trình $sqrt(x^2 + 2x + 4) = 2 - x$ là],
    (
        True([$x = 0$]),
        [$x = 1$],
        [$x = 2$],
        [$x = -1$]
    ),
    loigiai: [
        Điều kiện: $2 - x >= 0 <=> x <= 2$.
        Bình phương hai vế:
        $ x^2 + 2x + 4 = (2 - x)^2 <=> x^2 + 2x + 4 = x^2 - 4x + 4 <=> 6x = 0 <=> x = 0 $
        Đối chiếu điều kiện $x <= 2$, giá trị $x = 0$ thỏa mãn.
    ]
)

// TN 7
#lt-tn(num: 7, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Số nghiệm thực của phương trình trùng phương $x^4 - 5x^2 + 4 = 0$ là],
    (
        True([$4$]),
        [$2$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Đặt $t = x^2$ ($t >= 0$). Phương trình trở thành:
        $ t^2 - 5t + 4 = 0 <=> cases(t = 1, t = 4) $
        Cả hai giá trị $t$ đều dương:
        - $t = 1 => x^2 = 1 <=> x = plus.minus 1$.
        - $t = 4 => x^2 = 4 <=> x = plus.minus 2$.
        Vậy phương trình có đúng $4$ nghiệm thực.
    ]
)

// TN 8
#lt-tn(num: 8, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tập nghiệm của phương trình $sqrt(x - 2) = 2 - x$ là],
    (
        True([$\{2\}$]),
        [$[2; +infinity)$],
        [$(-infinity; 2]$],
        [$emptyset$]
    ),
    loigiai: [
        Điều kiện xác định:
        $ cases(x - 2 >= 0, 2 - x >= 0) <=> cases(x >= 2, x <= 2) <=> x = 2 $
        Thử lại với $x = 2$: $sqrt(2 - 2) = 2 - 2 <=> 0 = 0$ (thỏa mãn).
        Vậy tập nghiệm chỉ gồm một phần tử duy nhất: $S = \{2\}$.
    ]
)

// TN 9
#lt-tn(num: 9, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Số nghiệm của phương trình $sqrt(x^2 - x - 2) = sqrt(2x^2 + x - 5)$ là],
    (
        True([$1$]),
        [$2$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Bình phương hai vế:
        $ x^2 - x - 2 = 2x^2 + x - 5 <=> x^2 + 2x - 3 = 0 <=> cases(x = 1, x = -3) $
        Thử lại vào phương trình:
        - Với $x = 1$: $x^2 - x - 2 = 1 - 1 - 2 = -1 < 0$ (loại).
        - Với $x = -3$: $(-3)^2 - (-3) - 2 = 9 + 3 - 2 = 10 > 0$ và $2(-3)^2 + (-3) - 5 = 18 - 8 = 10 > 0$ (thỏa mãn).
        Vậy phương trình có duy nhất $1$ nghiệm là $x = -3$.
    ]
)

// TN 10
#lt-tn(num: 10, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tích các nghiệm thực của phương trình $x^4 - 3x^2 - 4 = 0$ bằng],
    (
        True([$-4$]),
        [$4$],
        [$-2$],
        [$2$]
    ),
    loigiai: [
        Đặt $t = x^2$ ($t >= 0$). Ta có phương trình:
        $ t^2 - 3t - 4 = 0 <=> (t + 1)(t - 4) = 0 <=> cases(t = -1 text(" (loại)"), t = 4 text(" (nhận)")) $
        Với $t = 4 => x^2 = 4 <=> x = plus.minus 2$.
        Tích các nghiệm thực là: $(2) cdot (-2) = -4$.
    ]
)

// TN 11
#lt-tn(num: 11, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Hai người đi xe đạp xuất phát cùng một lúc từ ngã tư đường $O$. Người thứ nhất đi về hướng Bắc với vận tốc $12 text(" km/h")$, người thứ hai đi về hướng Đông với vận tốc $16 text(" km/h")$.
Hỏi sau bao lâu kể từ lúc xuất phát thì khoảng cách giữa hai người bằng $30 text(" km")$?],
    (
        True([$1.5$ giờ]),
        [$1$ giờ],
        [$2$ giờ],
        [$2.5$ giờ]
    ),
    loigiai: [
        Gọi $t text(" (giờ)")$ ($t > 0$) là thời gian kể từ lúc xuất phát.
        Quãng đường người thứ nhất đi được: $s_1 = 12t text(" (km)")$.
        Quãng đường người thứ hai đi được: $s_2 = 16t text(" (km)")$.
        Vì hướng Bắc và hướng Đông vuông góc nhau nên theo định lý Pytago, khoảng cách $d$ giữa hai người là:
        $ d = sqrt(s_1^2 + s_2^2) = sqrt((12t)^2 + (16t)^2) = sqrt(144t^2 + 256t^2) = sqrt(400t^2) = 20t $
        Theo đề bài $d = 30 text(" km")$:
        $ 20t = 30 <=> t = 30 / 20 = 1.5 text(" giờ") $
    ]
)

// TN 12
#lt-tn(num: 12, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Cho phương trình $sqrt(2x^2 - 3x + m) = x + 1$ (với $m$ là tham số thực).
Biết rằng phương trình nhận $x = 2$ làm một nghiệm. Giá trị của $m$ là],
    (
        True([$m = 7$]),
        [$m = 5$],
        [$m = 9$],
        [$m = 3$]
    ),
    loigiai: [
        Thay $x = 2$ vào phương trình đã cho:
        $ sqrt(2(2)^2 - 3(2) + m) = 2 + 1 <=> sqrt(8 - 6 + m) = 3 <=> sqrt(2 + m) = 3 $
        Bình phương hai vế:
        $ 2 + m = 9 <=> m = 7 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phương trình căn thức dạng cơ bản)
#lt-ds(num: 13, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(2x^2 - 4x + 1) = x - 1$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Điều kiện để phương trình có nghiệm là $x >= 1$.]),
    True([Bình phương hai vế phương trình ta thu được phương trình bậc hai $x^2 - 2x = 0$.]),
    True([Phương trình bậc hai $x^2 - 2x = 0$ có hai nghiệm là $x = 0$ và $x = 2$.]),
    [Cả hai giá trị $x = 0$ và $x = 2$ đều là nghiệm của phương trình ban đầu.]
  ),
  loigiai: [
    #step([Tìm điều kiện])
    Vì vế trái là căn bậc hai nên vế phải phải không âm: $x - 1 >= 0 <=> x >= 1$. Mệnh đề a ĐÚNG.

    #step([Bình phương hai vế])
    $2x^2 - 4x + 1 = (x - 1)^2 <=> 2x^2 - 4x + 1 = x^2 - 2x + 1 <=> x^2 - 2x = 0$. Mệnh đề b ĐÚNG.

    #step([Giải phương trình bậc hai])
    $x^2 - 2x = 0 <=> x(x - 2) = 0 <=> cases(x = 0, x = 2)$. Mệnh đề c ĐÚNG.

    #step([Đối chiếu điều kiện và kết luận])
    - Với $x = 0$: Không thỏa mãn điều kiện $x >= 1$ (loại).
    - Với $x = 2$: Thỏa mãn $x >= 1$.
    Vậy phương trình ban đầu chỉ có duy nhất nghiệm $x = 2$.
    Khẳng định cả hai giá trị đều là nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương trình căn hai vế)
#lt-ds(num: 14, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Cho phương trình: $sqrt(2x^2 - 3x - 1) = sqrt(x^2 - 2x + 5)$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Bình phương hai vế ta được phương trình bậc hai $x^2 - x - 6 = 0$.]),
    True([Phương trình $x^2 - x - 6 = 0$ có hai nghiệm phân biệt là $x = -2$ và $x = 3$.]),
    True([Tại $x = -2$, biểu thức dưới dấu căn của hai vế đều nhận giá trị bằng $13 > 0$.]),
    [Phương trình ban đầu chỉ có đúng một nghiệm thực duy nhất.]
  ),
  loigiai: [
    #step([Bình phương hai vế])
    $2x^2 - 3x - 1 = x^2 - 2x + 5 <=> x^2 - x - 6 = 0$. Mệnh đề a ĐÚNG.

    #step([Giải phương trình bậc hai])
    $x^2 - x - 6 = 0 <=> (x + 2)(x - 3) = 0 <=> cases(x = -2, x = 3)$. Mệnh đề b ĐÚNG.

    #step([Thử lại nghiệm x = -2])
    Tại $x = -2$:
    $2(-2)^2 - 3(-2) - 1 = 8 + 6 - 1 = 13 > 0$ và $(-2)^2 - 2(-2) + 5 = 4 + 4 + 5 = 13 > 0$.
    Do đó $x = -2$ là nghiệm. Mệnh đề c ĐÚNG.

    #step([Thử lại nghiệm x = 3 và kết luận])
    Tại $x = 3$:
    $2(3)^2 - 3(3) - 1 = 18 - 9 - 1 = 8 > 0$ và $3^2 - 2(3) + 5 = 9 - 6 + 5 = 8 > 0$.
    Cả $x = -2$ và $x = 3$ đều là nghiệm của phương trình ban đầu (có $2$ nghiệm phân biệt).
    Khẳng định chỉ có đúng một nghiệm là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế vị trí tàu tuần tra và ngọn hải đăng)
#lt-ds(num: 15, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Một trạm kiểm soát bờ biển đặt tại gốc tọa độ $O(0; 0)$ trên bờ biển thẳng (trùng với trục hoành $O x$). Một ngọn hải đăng ở vị trí $B(8; 6)$ trên một đảo ngoài biển (đơn vị tọa độ tính theo km).
Một tàu tuần tra xuất phát từ vị trí $M(x; 0)$ trên bờ biển ($0 <= x <= 8$) di chuyển thẳng đến ngọn hải đăng $B$.
Khoảng cách từ điểm xuất phát $M$ đến ngọn hải đăng $B$ được cho bởi:
$ d(x) = sqrt((8 - x)^2 + 6^2) = sqrt(x^2 - 16x + 100) text(" (km)") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu tàu xuất phát từ gốc tọa độ $O(0; 0)$ thì khoảng cách đến ngọn hải đăng là $10 text(" km")$.]),
    True([Khoảng cách từ tàu đến ngọn hải đăng ngắn nhất khi tàu xuất phát tại vị trí có hoành độ $x = 8$.]),
    True([Phương trình $sqrt(x^2 - 16x + 100) = 3 sqrt(5)$ có hai nghiệm thực là $x = 5$ và $x = 11$.]),
    [Trên đoạn bờ biển giữa trạm kiểm soát và chân đường vuông góc ($0 <= x <= 8$), có đúng $2$ vị trí xuất phát để khoảng cách đến hải đăng bằng $3 sqrt(5) text(" km")$.]
  ),
  loigiai: [
    #step([Tính khoảng cách khi x = 0])
    $d(0) = sqrt(0^2 - 16(0) + 100) = sqrt(100) = 10 text(" km")$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách ngắn nhất])
    Biến đổi: $(8 - x)^2 + 36 >= 36 => d(x) >= sqrt(36) = 6 text(" km")$.
    Dấu bằng xảy ra khi $8 - x = 0 <=> x = 8$. Mệnh đề b ĐÚNG.

    #step([Giải phương trình khoảng cách bằng 3 căn 5])
    $sqrt(x^2 - 16x + 100) = 3 sqrt(5) <=> x^2 - 16x + 100 = (3 sqrt(5))^2 = 45$
    $<=> x^2 - 16x + 55 = 0 <=> (x - 5)(x - 11) = 0 <=> cases(x = 5, x = 11)$. Mệnh đề c ĐÚNG.

    #step([Xét điều kiện vị trí trên đoạn [0; 8]])
    Vì tàu xuất phát trên đoạn $0 <= x <= 8$ nên chỉ có duy nhất vị trí $x = 5$ thỏa mãn ($x = 11 > 8$ nằm ngoài đoạn bờ biển xét).
    Khẳng định có đúng $2$ vị trí xuất phát là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Phương trình trùng phương chứa tham số)
#lt-ds(num: 16, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Cho phương trình: $x^4 - (m + 2)x^2 + 2m = 0$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Đặt $t = x^2$ ($t >= 0$), phương trình trở thành phương trình bậc hai $t^2 - (m + 2)t + 2m = 0$.]),
    True([Biệt thức của phương trình theo ẩn $t$ luôn có dạng $Delta = (m - 2)^2$.]),
    True([Hai nghiệm của phương trình theo ẩn $t$ là $t_1 = 2$ và $t_2 = m$.]),
    [Với mọi $m > 0$, phương trình ban đầu luôn có đúng $2$ nghiệm thực phân biệt.]
  ),
  loigiai: [
    #step([Đặt ẩn phụ])
    Đặt $t = x^2$ ($t >= 0$). Phương trình trở thành $t^2 - (m + 2)t + 2m = 0$. Mệnh đề a ĐÚNG.

    #step([Tính biệt thức])
    $Delta = [-(m + 2)]^2 - 4(1)(2m) = m^2 + 4m + 4 - 8m = m^2 - 4m + 4 = (m - 2)^2$. Mệnh đề b ĐÚNG.

    #step([Tìm nghiệm theo ẩn t])
    $t_1 = ((m + 2) - (m - 2)) / 2 = 2$ và $t_2 = ((m + 2) + (m - 2)) / 2 = m$. Mệnh đề c ĐÚNG.

    #step([Số nghiệm thực của phương trình ban đầu])
    - Nghiệm $t_1 = 2 > 0$ luôn sinh ra $2$ nghiệm thực $x = plus.minus sqrt(2)$.
    - Nghiệm $t_2 = m$: Nếu $m > 0$ và $m != 2$ thì $t_2$ sinh thêm $2$ nghiệm thực $x = plus.minus sqrt(m)$.
    Khi đó phương trình có tất cả $4$ nghiệm thực phân biệt (chứ không phải chỉ có $2$ nghiệm).
    Khẳng định với mọi $m > 0$ luôn có đúng $2$ nghiệm thực là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Nghiệm dương lớn nhất)
#lt-tln(num: 17, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tìm nghiệm dương lớn nhất của phương trình:
$ sqrt(3x^2 - 4x + 1) = x + 1 $],
    [3],
    loigiai: [
        #step([Điều kiện có nghiệm])
        $x + 1 >= 0 <=> x >= -1$.
        
        #step([Bình phương hai vế])
        $ 3x^2 - 4x + 1 = (x + 1)^2 <=> 3x^2 - 4x + 1 = x^2 + 2x + 1 $
        $ <=> 2x^2 - 6x = 0 <=> 2x(x - 3) = 0 <=> cases(x = 0, x = 3) $
        
        #step([Kết luận])
        Cả $x = 0$ và $x = 3$ đều thỏa mãn điều kiện $x >= -1$.
        Nghiệm dương lớn nhất là $x = 3$.
    ]
)

// TLN 2 (Số nghiệm thực)
#lt-tln(num: 18, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tìm số nghiệm thực của phương trình $sqrt(x^2 - 6x + 9) = 2x - 5$.],
    [1],
    loigiai: [
        #step([Biến đổi vế trái])
        $sqrt(x^2 - 6x + 9) = sqrt((x - 3)^2) = |x - 3|$.
        Phương trình trở thành: $|x - 3| = 2x - 5$.
        
        #step([Điều kiện vế phải])
        $2x - 5 >= 0 <=> x >= 5/2 = 2.5$.
        
        #step([Giải phương trình chứa trị tuyệt đối])
        - Trường hợp 1: $x >= 3$.
        $x - 3 = 2x - 5 <=> x = 2$ (loại vì không thỏa mãn $x >= 3$).
        - Trường hợp 2: $2.5 <= x < 3$.
        $-(x - 3) = 2x - 5 <=> 3 - x = 2x - 5 <=> 3x = 8 <=> x = 8/3 approx 2.67$ (thỏa mãn).
        
        Vậy phương trình có đúng $1$ nghiệm thực.
    ]
)

// TLN 3 (Bình phương nghiệm duy nhất)
#lt-tln(num: 19, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Cho phương trình $sqrt(2x^2 - 5x + 2) = sqrt(x^2 - 2x)$.
Tính bình phương của nghiệm thỏa mãn phương trình đã cho.],
    [4],
    loigiai: [
        #step([Bình phương hai vế])
        $ 2x^2 - 5x + 2 = x^2 - 2x <=> x^2 - 3x + 2 = 0 <=> cases(x = 1, x = 2) $
        
        #step([Thử lại vào phương trình ban đầu])
        - Với $x = 1$: Biểu thức ở vế phải $x^2 - 2x = 1 - 2 = -1 < 0$ (không xác định, loại).
        - Với $x = 2$: $sqrt(2(4) - 10 + 2) = sqrt(0) = 0$ và $sqrt(4 - 4) = 0$ (thỏa mãn).
        Phương trình có nghiệm duy nhất là $x = 2$.
        
        #step([Tính bình phương nghiệm])
        $x^2 = 2^2 = 4$.
    ]
)

// TLN 4 (Độ dài cạnh huyền tam giác vuông)
#lt-tln(num: 20, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Một khung giàn giáo xây dựng hình tam giác vuông có cạnh huyền dài hơn cạnh góc vuông thứ nhất $2 text(" m")$ và dài hơn cạnh góc vuông thứ hai $9 text(" m")$.
Tính độ dài cạnh huyền của khung giàn giáo theo đơn vị mét.],
    [17],
    loigiai: [
        #step([Gọi ẩn số và thiết lập mối quan hệ])
        Gọi độ dài cạnh huyền là $c text(" (m)")$ với $c > 9$.
        Độ dài hai cạnh góc vuông lần lượt là $c - 2 text(" (m)")$ và $c - 9 text(" (m)")$.
        
        #step([Áp dụng định lý Pytago])
        $ (c - 2)^2 + (c - 9)^2 = c^2 $
        $ <=> (c^2 - 4c + 4) + (c^2 - 18c + 81) = c^2 $
        $ <=> 2c^2 - 22c + 85 = c^2 <=> c^2 - 22c + 85 = 0 $
        
        #step([Giải phương trình])
        $ (c - 5)(c - 17) = 0 <=> cases(c = 5, c = 17) $
        Vì $c > 9$ nên ta loại $c = 5$ và nhận $c = 17$.
        Vậy độ dài cạnh huyền là $17 text(" m")$.
    ]
)

// TLN 5 (Số nghiệm nguyên)
#lt-tln(num: 21, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tìm số nghiệm nguyên của phương trình $sqrt(x^2 - 5x + 4) = sqrt(2x - 6)$.],
    [1],
    loigiai: [
        #step([Bình phương hai vế])
        $ x^2 - 5x + 4 = 2x - 6 <=> x^2 - 7x + 10 = 0 <=> (x - 2)(x - 5) = 0 <=> cases(x = 2, x = 5) $
        
        #step([Thử lại nghiệm])
        - Với $x = 2$: Vế phải $2(2) - 6 = -2 < 0$ (loại).
        - Với $x = 5$: Vế phải $2(5) - 6 = 4 > 0$, vế trái $5^2 - 5(5) + 4 = 4 > 0$ (thỏa mãn $sqrt(4) = sqrt(4)$).
        
        #step([Kết luận])
        Phương trình có đúng $1$ nghiệm nguyên duy nhất là $x = 5$.
    ]
)

// TLN 6 (Tìm m để phương trình nhận x = 3 làm nghiệm)
#lt-tln(num: 22, de: [Đề 1 (A) — Mã 146], back-to: "sec-exercise-hub",[Tìm giá trị của tham số $m$ để phương trình $sqrt(3x^2 - 5x + m) = x + 2$ nhận $x = 3$ làm một nghiệm.],
    [13],
    loigiai: [
        #step([Thay nghiệm vào phương trình])
        Thay $x = 3$ vào phương trình đã cho:
        $ sqrt(3(3)^2 - 5(3) + m) = 3 + 2 <=> sqrt(27 - 15 + m) = 5 $
        $ <=> sqrt(12 + m) = 5 $
        
        #step([Bình phương tìm m])
        $ 12 + m = 25 <=> m = 13 $
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
      #text(weight: "bold", fill: rgb("#a5b4fc"), size: 22pt)[🎉 CHÚC MỪNG HOÀN THÀNH BÀI 18: PHƯƠNG TRÌNH QUY VỀ PHƯƠNG TRÌNH BẬC HAI (ĐỀ SỐ 19A - CƠ BẢN ĐẾN VẬN DỤNG)!]      #v(0.6em)
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
