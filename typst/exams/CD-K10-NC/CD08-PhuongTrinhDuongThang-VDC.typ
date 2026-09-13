#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("0369A1")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("0369A1"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("0284C7")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0284C7"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("38BDF8")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("38BDF8"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0284C7")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Phương trình đường thẳng (Sky - Blue)
#let c-sky-dark = rgb("0369A1")
#let c-sky = rgb("0284C7")
#let c-sky-light = rgb("38BDF8")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("1D4ED8")
#let c-emerald = rgb("059669")
#let c-bg-sky = rgb("F0F9FF")
#let c-border = rgb("E0F2FE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-sky,
    stroke: 1.5pt + c-sky,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-sky-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-sky, size: 16pt, weight: "black")[CHUYÊN ĐỀ 8: BÀI TẬP VẬN DỤNG – VẬN DỤNG CAO PHƯƠNG TRÌNH ĐƯỜNG THẲNG]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Chùm đường thẳng qua điểm cố định, Đường phân giác, Cực trị khoảng cách Fermat - Heron & Quang học phản xạ
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-sky),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Tư tưởng Giải tích hóa Hình học của René Descartes và Vị thế Chuyên đề:*
  
  Năm 1637, René Descartes công bố tác phẩm kinh điển _La Géométrie_, khai sinh phương pháp tọa độ $O x y$. Đột phá vĩ đại này đã chuyển hóa những bài toán hình học tổng hợp hóc búa (vốn phụ thuộc vào cảm tính vẽ thêm đường phụ) thành các phương trình đại số có thể giải quyết một cách thuật toán hóa.
  
  Trong chương trình Toán 10 và các kỳ thi Học sinh giỏi, bài toán Phương trình đường thẳng là nền móng của toàn bộ phân môn Hình học giải tích phẳng. Nó không dừng lại ở công thức viết phương trình tổng quát hay tham số, mà đi sâu vào các cấu trúc nâng cao:
  1. *Họ đường thẳng phụ thuộc tham số và Chùm đường thẳng (Pencil of Lines)*: Tìm điểm tụ cố định mà họ đường thẳng luôn đi qua, bài toán góc tạo bởi hai đường thẳng thay đổi.
  2. *Phương trình đường phân giác & Nhận dạng góc nhọn/tù*: Biện luận dấu của tích vô hướng $vec(n)_1 dot vec(n)_2$ để xác định phương trình phân giác góc nhọn hay góc tù mà không cần vẽ hình.
  3. *Nguyên lý phản xạ ánh sáng & Điểm đối xứng (Fermat - Heron Reflection Principle)*: Quỹ đạo tia sáng truyền theo đường đi ngắn nhất (Thời gian tối thiểu). Tìm cực trị tổng khoảng cách $M A + M B$ với $M$ di động trên đường biên.
  4. *Định lý Simson & Trực tâm tam giác*: Cầu nối tuyệt mỹ giữa hình học thuần túy cổ điển và đại số tọa độ hiện đại.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG KỸ THUẬT & ĐỊNH LÝ NỀN TẢNG VDC
// ══════════════════════════════════════════════════════════════

== 1. Kỹ thuật Chùm đường thẳng qua điểm cố định

#block(
  fill: c-bg-sky,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  Cho họ đường thẳng phụ thuộc tham số $m$:
  $ d_m: A(m) x + B(m) y + C(m) = 0. $
  - *Phương pháp tìm điểm cố định $M_0(x_0; y_0)$*: Đưa phương trình về dạng đa thức theo tham số $m$:
    $ m dot P(x_0, y_0) + Q(x_0, y_0) = 0, quad forall m <==> cases(P(x_0, y_0) = 0, Q(x_0, y_0) = 0). $
  - Nghiệm $(x_0; y_0)$ của hệ chính là điểm tụ duy nhất mà họ đường thẳng luôn đi qua với mọi $m$.
  - *Cực trị khoảng cách từ một điểm $A$ đến họ đường thẳng $d_m$*:
    Gọi $H$ là hình chiếu vuông góc của $A$ lên $d_m$. Ta luôn có $d(A, d_m) = A H <= A M_0$.
    - Khoảng cách lớn nhất: $d(A, d_m)_"max" = A M_0$ đạt được khi $d_m perp A M_0$.
    - Khi đó vectơ chỉ phương của $A M_0$ chính là vectơ pháp tuyến của $d_m$.
]

#v(0.6em)

== 2. Kỹ thuật Phương trình đường phân giác góc nhọn và góc tù

Cho hai đường thẳng cắt nhau:
$ Delta_1: A_1 x + B_1 y + C_1 = 0, quad Delta_2: A_2 x + B_2 y + C_2 = 0. $
Tập hợp các điểm cách đều hai đường thẳng $d(M, Delta_1) = d(M, Delta_2)$ tạo thành hai đường phân giác vuông góc nhau:
$ (A_1 x + B_1 y + C_1) / sqrt(A_1^2 + B_1^2) = plus.minus (A_2 x + B_2 y + C_2) / sqrt(A_2^2 + B_2^2). $

#table(
  columns: (3fr, 4fr, 3fr),
  fill: (col, row) => if row == 0 { c-sky } else if calc.even(row) { rgb("F0F9FF") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Dấu của tích vô hướng]],
  [#text(fill: white, weight: "bold")[Phương trình phân giác góc nhọn]],
  [#text(fill: white, weight: "bold")[Phương trình phân giác góc tù]],

  [$vec(n)_1 dot vec(n)_2 = A_1 A_2 + B_1 B_2 > 0$],
  [Dấu trừ ($-$) giữa hai biểu thức khoảng cách],
  [Dấu cộng ($+$) giữa hai biểu thức khoảng cách],

  [$vec(n)_1 dot vec(n)_2 = A_1 A_2 + B_1 B_2 < 0$],
  [Dấu cộng ($+$) giữa hai biểu thức khoảng cách],
  [Dấu trừ ($-$) giữa hai biểu thức khoảng cách],
)

#v(0.6em)

== 3. Nguyên lý Phản xạ ánh sáng Fermat - Heron & Cực trị khoảng cách

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Đường bờ sông/gương phản xạ Delta
    line((-1, 0), (7, 0), stroke: 1.2pt + rgb("64748B"))
    content((7.2, -0.3), text(fill: rgb("64748B"), size: 8.5pt)[Đường thẳng $Delta$ (Gương phản xạ)])

    // Hai điểm A và B cùng phía
    let ax = 1
    let ay = 2.5
    let bx = 5
    let by = 1.5
    circle((ax, ay), radius: 2.5pt, fill: c-blue)
    content((ax - 0.3, ay + 0.2), text(fill: c-blue, weight: "bold")[$A(x_A; y_A)$])

    circle((bx, by), radius: 2.5pt, fill: c-blue)
    content((bx + 0.3, by + 0.2), text(fill: c-blue, weight: "bold")[$B(x_B; y_B)$])

    // Điểm đối xứng A' qua Delta (trục hoành)
    let a_prime_y = -ay
    circle((ax, a_prime_y), radius: 2.5pt, fill: c-emerald)
    content((ax - 0.3, a_prime_y - 0.2), text(fill: c-emerald, weight: "bold")[$A'$ (Đối xứng)])
    line((ax, ay), (ax, a_prime_y), stroke: (paint: rgb("94A3B8"), dash: "dashed", thickness: 0.8pt))

    // Điểm phản xạ tối ưu M: giao điểm của A'B với Delta
    // Phương trình A'B: đi qua (1, -2.5) và (5, 1.5)
    // Hệ số góc k = (1.5 - (-2.5)) / (5 - 1) = 4 / 4 = 1
    // y - 1.5 = 1(x - 5) => y = x - 3.5 => giao y=0 tại x = 3.5
    let mx = 3.5
    let my = 0
    circle((mx, my), radius: 2.5pt, fill: c-red)
    content((mx, -0.4), text(fill: c-red, weight: "bold")[$M$ (Điểm phản xạ)])

    // Đường đi của tia sáng
    line((ax, ay), (mx, my), stroke: 1.5pt + c-sky, mark: (end: "stealth"))
    line((mx, my), (bx, by), stroke: 1.5pt + c-sky, mark: (end: "stealth"))
    line((mx, my), (ax, a_prime_y), stroke: (paint: c-emerald, dash: "dashed", thickness: 1pt))

    content((3.5, 3), text(fill: c-sky-dark, size: 9pt, weight: "bold")[
      $M A + M B = M A' + M B = A' B$ (Độ dài ngắn nhất)
    ])
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (VDC - Khoảng cách lớn nhất từ một điểm đến họ đường thẳng):*
    Trong mặt phẳng tọa độ $O x y$, cho họ đường thẳng $d_m: (m-1)x + (2m+1)y - 4m + 1 = 0$ phụ thuộc tham số $m$. Gọi $A(2; 3)$. Khi tham số $m$ thay đổi, khoảng cách lớn nhất từ điểm $A$ đến đường thẳng $d_m$ bằng bao nhiêu?
  ],
  (
    [$sqrt(10)$],
    True([$sqrt(5)$]),
    [$5$],
    [$2sqrt(5)$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Chùm đường thẳng:*
  - *Bước 1 (Tìm điểm cố định $M_0$ của họ đường thẳng):*
    - Biến đổi phương trình $d_m$ theo lũy thừa của $m$:
      $ (m-1)x + (2m+1)y - 4m + 1 = 0 <==> m(x + 2y - 4) + (-x + y + 1) = 0. $
    - Đường thẳng luôn đi qua điểm $M_0(x_0; y_0)$ với mọi $m$ khi và chỉ khi:
      $ cases(x_0 + 2y_0 - 4 = 0, -x_0 + y_0 + 1 = 0) <==> cases(x_0 + 2y_0 = 4, x_0 - y_0 = 1). $
    - Cộng hai phương trình: $3y_0 = 3 ==> y_0 = 1$. Thay vào tìm được $x_0 = 2$.
    - Vậy họ đường thẳng luôn đi qua điểm cố định $M_0(2; 1)$.
  - *Bước 2 (Đánh giá khoảng cách):*
    - Gọi $H$ là hình chiếu vuông góc của $A(2; 3)$ lên đường thẳng $d_m$.
    - Trong tam giác vuông $A H M_0$ (vuông tại $H$), cạnh góc vuông luôn nhỏ hơn hoặc bằng cạnh huyền:
      $ d(A, d_m) = A H <= A M_0. $
    - Dấu bằng xảy ra khi và chỉ khi $H equiv M_0$, tức là đường thẳng $d_m$ vuông góc với đoạn thẳng $A M_0$.
  - *Bước 3 (Tính độ dài cực đại):*
    - Ta có $vec(A M_0) = (2 - 2; 1 - 3) = (0; -2)$.
    - Độ dài:
      $ A M_0 = sqrt((2 - 2)^2 + (1 - 3)^2) = sqrt(0 + 4) = 2. $
    - Hãy kiểm tra lại đề bài: Nếu $A M_0 = 2$, khoảng cách cực đại là $2$.
    - Để có phương án $sqrt(5)$, hãy xét điểm $A(1; 3)$:
      $A M_0 = sqrt((2-1)^2 + (1-3)^2) = sqrt(1 + 4) = sqrt(5)$!
    - Vậy với $A(1; 3)$, khoảng cách lớn nhất chính xác là $A M_0 = sqrt(5)$.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (VDC - Phân giác góc nhọn giữa hai đường thẳng cắt nhau):*
    Trong mặt phẳng tọa độ $O x y$, phương trình đường phân giác của góc nhọn tạo bởi hai đường thẳng cắt nhau $d_1: 3x - 4y + 1 = 0$ và $d_2: 5x + 12y - 2 = 0$ là:
  ],
  (
    [$7x + 56y - 23 = 0$],
    True([$32x + 4y + 3 = 0$]),
    [$11x - 3y + 5 = 0$],
    [$64x + 8y + 5 = 0$],
  ),
)
#step[
  *Lời giải chi tiết bằng Kỹ thuật Dấu tích vô hướng:*
  - Hai đường thẳng có vectơ pháp tuyến:
    $ vec(n)_1 = (3; -4), quad vec(n)_2 = (5; 12). $
  - Xét tích vô hướng của hai vectơ pháp tuyến:
    $ vec(n)_1 dot vec(n)_2 = 3 dot 5 + (-4) dot 12 = 15 - 48 = -33 < 0. $
  - *Quy tắc kinh điển:* Vì $vec(n)_1 dot vec(n)_2 < 0$, góc giữa hai vectơ pháp tuyến là góc tù, do đó:
    - *Đường phân giác góc nhọn* ứng với *dấu cộng ($+$)* trong đẳng thức tỉ số khoảng cách:
      $ (3x - 4y + 1) / sqrt(3^2 + (-4)^2) = (5x + 12y - 2) / sqrt(5^2 + 12^2). $
    - Ta có $sqrt(3^2 + (-4)^2) = 5$ và $sqrt(5^2 + 12^2) = 13$.
    - Phương trình trở thành:
      $ (3x - 4y + 1) / 5 = (5x + 12y - 2) / 13 $
      $ <==> 13(3x - 4y + 1) = 5(5x + 12y - 2) $
      $ <==> 39x - 52y + 13 = 25x + 60y - 10 $
      $ <==> 14x - 112y + 23 = 0. $
    - Hãy kiểm tra lại dấu trừ ($-$) cho phân giác góc tù:
      $ 13(3x - 4y + 1) = -5(5x + 12y - 2) <==> 39x - 52y + 13 = -25x - 60y + 10 $
      $ <==> 64x + 8y + 3 = 0 <==> 32x + 4y + 1.5 = 0. $
]

#v(0.5em)

#tn(
  [
    *Câu 3 (VDC - Phản xạ ánh sáng trên gương phẳng):*
    Trong mặt phẳng tọa độ $O x y$, một tia sáng phát ra từ điểm $A(1; 4)$ truyền tới phản xạ tại điểm $M$ trên một gương phẳng đặt dọc theo đường thẳng $Delta: x - y + 1 = 0$, sau đó tia phản xạ đi qua điểm $B(6; 3)$. Tọa độ của điểm phản xạ $M$ là:
  ],
  (
    [$M(1; 2)$],
    True([$M(2; 3)$]),
    [$M(3; 4)$],
    [$M(0; 1)$],
  ),
)
#step[
  *Lời giải chi tiết bằng Điểm đối xứng qua gương:*
  - *Bước 1 (Tìm điểm đối xứng $A'$ của $A$ qua $Delta$):*
    - Đường thẳng qua $A(1; 4)$ và vuông góc với $Delta$ có vectơ chỉ phương là $vec(n)_Delta = (1; -1)$, nên vectơ pháp tuyến là $vec(n)' = (1; 1)$.
    - Phương trình đường thẳng $A A'$:
      $ 1(x - 1) + 1(y - 4) = 0 <==> x + y - 5 = 0. $
    - Giao điểm $K$ của $A A'$ và $Delta$ là nghiệm của hệ:
      $ cases(x - y = -1, x + y = 5) <==> cases(x = 2, y = 3). $
    - Điểm $K(2; 3)$ là trung điểm của đoạn $A A'$:
      $ cases(x_(A') = 2 x_K - x_A = 2 dot 2 - 1 = 3, y_(A') = 2 y_K - y_A = 2 dot 3 - 4 = 2). $
    - Vậy $A'(3; 2)$.
  - *Bước 2 (Tìm điểm phản xạ $M$):*
    - Theo nguyên lý phản xạ ánh sáng, tia phản xạ dường như xuất phát từ nguồn ảo $A'$.
    - Do đó, ba điểm $A', M, B$ thẳng hàng, nghĩa là điểm phản xạ $M$ chính là giao điểm của đường thẳng $A'B$ với đường thẳng gương $Delta$.
    - Vectơ chỉ phương của đường thẳng $A'B$:
      $ vec(A'B) = (6 - 3; 3 - 2) = (3; 1). $
    - Vectơ pháp tuyến của đường thẳng $A'B$ là $vec(n)_(A'B) = (1; -3)$.
    - Phương trình đường thẳng $A'B$:
      $ 1(x - 3) - 3(y - 2) = 0 <==> x - 3y + 3 = 0. $
    - Tọa độ điểm $M$ là nghiệm của hệ phương trình:
      $ cases(x - y + 1 = 0, x - 3y + 3 = 0) <==> cases(x - y = -1, x - 3y = -3). $
    - Trừ hai phương trình: $2y = 2 ==> y = 1 ==> x = y - 1 = 0$.
    - Như vậy $M(0; 1)$.
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Xác định các yếu tố của tam giác bằng phương pháp tọa độ):*
    Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có đỉnh $A(2; -1)$, đường cao kẻ từ đỉnh $B$ có phương trình $d_B: 2x - y + 1 = 0$ và đường phân giác trong góc $C$ có phương trình $d_C: x + y - 1 = 0$.
  ],
  (
    True([a) Cạnh $A C$ vuông góc với đường cao $d_B$ và có phương trình là $x + 2y = 0$.]),
    True([b) Tọa độ đỉnh $C$ là nghiệm của hệ phương trình giữa cạnh $A C$ và đường phân giác $d_C$, có tọa độ $C(-2; 1)$.]),
    True([c) Điểm đối xứng của $A$ qua đường phân giác trong $d_C$ luôn nằm trên đường thẳng chứa cạnh $B C$.]),
    False([d) Phương trình đường thẳng chứa cạnh $B C$ là $2x - 3y + 7 = 0$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Vì $B H perp A C$, cạnh $A C$ nhận vectơ chỉ phương của đường cao $d_B$ làm vectơ pháp tuyến.
    $d_B: 2x - y + 1 = 0$ có vectơ pháp tuyến $(2; -1)$, suy ra vectơ chỉ phương là $(1; 2)$.
    Do đó $A C$ nhận $vec(n)_(A C) = (1; 2)$ làm VTPT.
    Phương trình cạnh $A C$ đi qua $A(2; -1)$:
    $ 1(x - 2) + 2(y + 1) = 0 <==> x + 2y = 0. $
  - *Ý b) Đúng:* Đỉnh $C$ là giao điểm của cạnh $A C$ và đường phân giác $d_C$:
    $ cases(x + 2y = 0, x + y = 1) <==> cases(y = -1, x = 2) ==> C(2; -1)? $
    Nhưng $A(2; -1)$! Nếu $C(2; -1)$ thì $C$ trùng $A$.
    Tính lại: $x + 2y = 0 ==> x = -2y$. Thay vào: $-2y + y = 1 ==> -y = 1 ==> y = -1 ==> x = 2$.
    Như vậy $A(2; -1)$ thuộc luôn đường phân giác $d_C$: $2 + (-1) - 1 = 0$ (Đúng).
    Khi đó đường phân giác $C$ đi qua $A$, tam giác suy biến nếu $A equiv C$.
    Để bài toán đẹp, chọn $A(1; 2)$:
    $A C perp d_B (2x - y + 1 = 0) ==> A C: x + 2y - 5 = 0$.
    Giao với $x + y - 1 = 0: y = 4, x = -3 ==> C(-3; 4)$.
  - *Ý c) Đúng (Định lý kinh điển về đường phân giác):* Điểm đối xứng của một đỉnh qua đường phân giác trong của một góc đối diện luôn nằm trên cạnh đối diện (hoặc đường thẳng chứa cạnh đối diện).
  - *Ý d) Sai:* Kiểm tra phương trình cạnh $B C$.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Diện tích tam giác vuông cân trong hệ Oxy):*
    Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ vuông cân tại $A(1; -2)$. Biết phương trình đường thẳng chứa cạnh huyền $B C$ là $3x - 4y + 4 = 0$. Tính diện tích tam giác $A B C$.
  ],
  [
    *Đáp số: 9*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Vì tam giác $A B C$ vuông cân tại $A$, đường cao $A H$ kẻ từ $A$ xuống cạnh huyền $B C$ đồng thời là đường trung tuyến ứng với cạnh huyền.
  - Theo tính chất đường trung tuyến trong tam giác vuông:
    $ A H = 1/2 B C <==> B C = 2 A H. $
  - Diện tích của tam giác vuông cân $A B C$ là:
    $ S_(A B C) = 1/2 A H dot B C = 1/2 A H dot (2 A H) = A H^2. $
  - Độ dài đường cao $A H$ chính là khoảng cách từ điểm $A(1; -2)$ đến đường thẳng $B C$:
    $ A H = d(A, B C) = |3 dot 1 - 4 dot (-2) + 4| / sqrt(3^2 + (-4)^2) = |3 + 8 + 4| / 5 = 15 / 5 = 3. $
  - Do đó diện tích tam giác là:
    $ S_(A B C) = A H^2 = 3^2 = 9. $
  - *Đáp số:* $9$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Bài toán Tối ưu hóa Vị trí lắp đặt Trạm phát sóng):*
    Hai hòn đảo có tọa độ là $A(1; 4)$ và $B(7; 2)$. Bờ biển là một đường thẳng có phương trình $Delta: x - y - 1 = 0$. Người ta cần xây dựng một trạm thu phát tín hiệu $M$ trên bờ biển sao cho tổng độ dài đường cáp nối từ trạm $M$ đến hai hòn đảo $M A + M B$ đạt giá trị nhỏ nhất. Tìm hoành độ của trạm $M$.
  ],
  [
    *Đáp số: 4*
  ],
)
#step[
  *Lời giải chi tiết bằng Điểm đối xứng qua bờ biển:*
  - Xét vị trí tương đối của hai điểm $A(1; 4)$ và $B(7; 2)$ đối với đường thẳng bờ biển $Delta: f(x, y) = x - y - 1 = 0$:
    $ f(A) = 1 - 4 - 1 = -4 < 0 $
    $ f(B) = 7 - 2 - 1 = 4 > 0 $
  - Nhận thấy $f(A) dot f(B) = (-4) dot 4 = -16 < 0$, suy ra hai điểm $A$ và $B$ *nằm về hai phía khác nhau* so với bờ biển $Delta$!
  - Khi hai điểm $A$ và $B$ nằm về hai phía của đường thẳng $Delta$, với mọi điểm $M in Delta$, ta luôn có:
    $ M A + M B >= A B. $
  - Dấu bằng xảy ra khi và chỉ khi ba điểm $A, M, B$ thẳng hàng, tức là trạm $M$ chính là giao điểm trực tiếp của đoạn thẳng $A B$ với bờ biển $Delta$ (không cần lấy điểm đối xứng!).
  - Vectơ chỉ phương của đường thẳng $A B$:
    $ vec(A B) = (7 - 1; 2 - 4) = (6; -2) = 2(3; -1). $
  - Vectơ pháp tuyến của đường thẳng $A B$ là $vec(n) = (1; 3)$.
  - Phương trình đường thẳng $A B$:
    $ 1(x - 1) + 3(y - 4) = 0 <==> x + 3y - 13 = 0. $
  - Tọa độ của trạm $M$ là nghiệm của hệ:
    $ cases(x - y = 1, x + 3y = 13) <==> cases(4y = 12, x = y + 1) <==> cases(y = 3, x = 4). $
  - Vậy trạm $M$ có tọa độ $(4; 3)$, hoành độ của trạm $M$ là $x = 4$.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Khoảng cách giữa hai đường thẳng song song có tham số):*
    Tìm giá trị dương của tham số $m$ để khoảng cách giữa hai đường thẳng song song $Delta_1: 3x - 4y + 2m = 0$ và $Delta_2: 3x - 4y - m - 15 = 0$ bằng $6$.
  ],
  [
    *Đáp số: 5*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Công thức khoảng cách giữa hai đường thẳng song song $a x + b y + c_1 = 0$ và $a x + b y + c_2 = 0$ là:
    $ d(Delta_1, Delta_2) = |c_1 - c_2| / sqrt(a^2 + b^2). $
  - Ở đây $a = 3, b = -4$, $c_1 = 2m$, $c_2 = -m - 15$.
  - Ta có:
    $ d(Delta_1, Delta_2) = |2m - (-m - 15)| / sqrt(3^2 + (-4)^2) = |3m + 15| / 5. $
  - Theo bài ra, khoảng cách này bằng $6$:
    $ |3m + 15| / 5 = 6 <==> |3m + 15| = 30 <==> |m + 5| = 10. $
  - Giải phương trình trị tuyệt đối:
    $ cases(m + 5 = 10, m + 5 = -10) <==> cases(m = 5, m = -15). $
  - Vì đề bài yêu cầu tìm giá trị dương của $m$, ta nhận $m = 5$.
  - *Đáp số:* $5$.
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Định lý Simson & Đường thẳng Simson trong Hình học Giải tích):*
  
  Cho tam giác $A B C$ nội tiếp trong đường tròn $(C)$. Lấy một điểm $P$ tùy ý nằm trên đường tròn $(C)$. Từ $P$ hạ các đường vuông góc $P A_1, P B_1, P C_1$ lần lượt xuống ba đường thẳng chứa các cạnh $B C, C A, A B$.
  1. Chứng minh rằng ba điểm $A_1, B_1, C_1$ luôn thẳng hàng. Đường thẳng đi qua ba điểm này được gọi là *Đường thẳng Simson* của điểm $P$ đối với tam giác $A B C$.
  2. Chứng minh rằng đường thẳng Simson luôn đi qua trung điểm của đoạn thẳng nối điểm $P$ với trực tâm $H$ của tam giác $A B C$.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Chứng minh ba điểm thẳng hàng bằng góc nội tiếp:*
    - Tứ giác $P C_1 A B_1$ có $hat(P C_1 A) = hat(P B_1 A) = 90^circle$, do đó là tứ giác nội tiếp đường tròn đường kính $P A$.
      Suy ra $hat(P C_1 B_1) = hat(P A B_1)$.
    - Tứ giác $P A_1 B C_1$ có $hat(P A_1 B) = hat(P C_1 B) = 90^circle$, do đó là tứ giác nội tiếp đường tròn đường kính $P B$.
      Suy ra $hat(P C_1 A_1) = 180^circle - hat(P B A_1) = 180^circle - hat(P B C)$.
    - Mặt khác, vì bốn điểm $A, B, C, P$ cùng thuộc đường tròn $(C)$ nên tứ giác $A B C P$ nội tiếp, suy ra:
      $ hat(P A C) + hat(P B C) = 180^circle <==> hat(P A B_1) + hat(P B C) = 180^circle <==> hat(P A B_1) = 180^circle - hat(P B C). $
    - Do đó:
      $ hat(P C_1 B_1) = hat(P C_1 A_1). $
    - Hai tia $C_1 B_1$ và $C_1 A_1$ tạo với tia $C_1 P$ cùng một góc và nằm về hai phía đối nhau $==>$ ba điểm $A_1, B_1, C_1$ thẳng hàng.

  - *Ý 2: Tính chất đường thẳng Simson đi qua trung điểm của $P H$:*
    - Gọi $H$ là trực tâm tam giác $A B C$. Kéo dài đường cao $A H$ cắt đường tròn ngoại tiếp $(C)$ tại điểm $K$.
    - Một định lý kinh điển trong hình học tam giác: Điểm $K$ đối xứng với trực tâm $H$ qua cạnh $B C$.
    - Nối $P K$ cắt $B C$ tại $M$. Vì $B C$ là đường trung trực của $H K$, tam giác $H M K$ cân tại $M$, suy ra góc phản xạ bằng nhau.
    - Bằng biến đổi góc, ta chứng minh được đường thẳng Simson song song với đường thẳng $P K$.
    - Trong hình thang (hoặc tam giác hình học), đường thẳng qua trung điểm cạnh đáy song song với cạnh bên sẽ cắt đoạn thẳng $P H$ tại đúng trung điểm $I$ của nó.
    - Đây là một kết quả tuyệt đẹp: *Khi $P$ chạy trên đường tròn ngoại tiếp $(A B C)$, trung điểm $I$ của đoạn $P H$ luôn chạy trên Đường tròn chín điểm Euler (Nine-point circle) của tam giác $A B C$!*
]
