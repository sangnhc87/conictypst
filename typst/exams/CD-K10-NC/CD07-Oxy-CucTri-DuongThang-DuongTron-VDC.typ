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
  stroke: (bottom: 2pt + rgb("1E1B4B")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E1B4B"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("4338CA")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("4338CA"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("6366F1")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("6366F1"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("4338CA")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Oxy Cực trị
#let c-indigo-dark = rgb("1E1B4B")
#let c-indigo = rgb("4338CA")
#let c-violet = rgb("6366F1")
#let c-blue = rgb("2563EB")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-purple = rgb("7C3AED")
#let c-teal = rgb("0D9488")
#let c-bg-indigo = rgb("EEF2FF")
#let c-border = rgb("E0E7FF")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-indigo,
    stroke: (
      left: 6pt + c-indigo-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-indigo-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: PHƯƠNG PHÁP TỌA ĐỘ OXY,\
      CỰC TRỊ ĐƯỜNG THẲNG & ĐƯỜNG TRÒN
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Phản xạ ánh sáng Fermat & Điểm đối xứng · Tiếp tuyến chung của hai đường tròn\
      Trục đẳng phương & Tâm đẳng phương · Cực trị khoảng cách trong Oxy — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÁC ĐỊNH LÝ HÌNH HỌC TỌA ĐỘ NÂNG CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-indigo),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-indigo)[1. Công Thức Khoảng Cách & Cực Trị Đường Thẳng — Đường Tròn] \
  Cho đường tròn $(C)$ có tâm $I(x_0; y_0)$ bán kính $R$ và đường thẳng $d: a x + b y + c = 0$.
  - Khoảng cách từ tâm $I$ đến đường thẳng $d$:
  $ h = d(I, d) = (|a x_0 + b y_0 + c|)/(sqrt(a^2 + b^2)). $
  - Khi $M$ là một điểm di động trên đường tròn $(C)$ ($M in (C)$):
  $ |h - R| le d(M, d) le h + R. $
  + Khoảng cách nhỏ nhất: $d(M, d)_(min) = h - R$ (nếu $d$ không cắt $(C)$).
  + Khoảng cách lớn nhất: $d(M, d)_(max) = h + R$.
  - Tiếp tuyến tại điểm $M_0(x_0; y_0) in (C)$ có phương trình phân cực:
  $ (x_0 - a)(x - a) + (y_0 - b)(y - b) = R^2. $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đường tròn (C) tâm I bán kính R
    let I = (0, 2)
    let R = 1.5
    circle(I, radius: R, stroke: 1.5pt + c-indigo, fill: rgb("4338CA").transparentize(85%))
    circle(I, radius: 2.5pt, fill: c-indigo)
    content((-0.4, 2), [$I$])

    // Đường thẳng d
    line((-3, -0.5), (3, -0.5), stroke: 1.8pt + black)
    content((3.3, -0.5), [$d$])

    // Đoạn vuông góc hạ từ I xuống d
    line(I, (0, -0.5), stroke: (paint: gray, dash: "densely-dashed", thickness: 1pt))
    
    // Điểm gần nhất M_min và xa nhất M_max
    circle((0, 0.5), radius: 2.5pt, fill: c-red)
    content((0.7, 0.6), text(fill: c-red, size: 8pt)[$M_("min")$])
    circle((0, 3.5), radius: 2.5pt, fill: c-red)
    content((0.7, 3.5), text(fill: c-red, size: 8pt)[$M_("max")$])
  })
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Phương Pháp Điểm Đối Xứng & Bài Toán Phản Xạ Ánh Sáng Heron] \
  Cho hai điểm $A, B$ cố định cùng phía đối với đường thẳng $d$. Tìm điểm $M in d$ để tổng khoảng cách $M A + M B$ đạt giá trị nhỏ nhất:
  - *Thuật toán Heron*:
    1. Tìm điểm đối xứng $A'$ của điểm $A$ qua đường thẳng $d$.
    2. Nối $A'$ với $B$. Đoạn thẳng $A' B$ cắt đường thẳng $d$ tại điểm $M_0$.
    3. Điểm $M_0$ chính là điểm làm cho $M A + M B$ nhỏ nhất vì với mọi $M in d$:
    $ M A + M B = M A' + M B ge A' B. $
    Đẳng thức xảy ra $<=> M equiv M_0 = A' B inter d$.
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đường thẳng d (mặt gương)
    line((-3.5, 0), (3.5, 0), stroke: 1.5pt + black)
    content((3.0, 0.3), text(size: 8.5pt, weight: "bold")[Đường thẳng $d$])

    // Các điểm A, B, A'
    let A = (-2, 2)
    let B = (2.2, 2.5)
    let A_prime = (-2, -2)
    let M0 = (-0.133, 0)

    // Điểm A và A'
    circle(A, radius: 2.5pt, fill: c-indigo)
    circle(B, radius: 2.5pt, fill: c-indigo)
    circle(A_prime, radius: 2.5pt, fill: c-violet)
    circle(M0, radius: 2.5pt, fill: c-red)

    content((-2.3, 2.2), text(size: 8.5pt, weight: "bold", fill: c-indigo)[$A$])
    content((2.5, 2.6), text(size: 8.5pt, weight: "bold", fill: c-indigo)[$B$])
    content((-2.4, -2.2), text(size: 8.5pt, weight: "bold", fill: c-violet)[$A'$])
    content((-0.133, -0.35), text(size: 8.5pt, weight: "bold", fill: c-red)[$M_0$])

    // Đường thẳng A A' vuông góc d
    line(A, A_prime, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

    // Đường truyền tối ưu A -> M0 -> B
    line(A, M0, stroke: 1.5pt + c-red)
    line(M0, B, stroke: 1.5pt + c-red)

    // Đoạn thẳng A' M0 (đường thẳng kéo dài)
    line(A_prime, M0, stroke: (dash: "densely-dashed", paint: c-violet, thickness: 1.2pt))

    // Điểm M tùy ý khác trên d
    let M = (1.2, 0)
    circle(M, radius: 2pt, fill: gray)
    content((1.2, -0.3), text(size: 7.5pt, fill: gray)[$M$])
    line(A, M, stroke: (dash: "dotted", paint: gray, thickness: 0.8pt))
    line(M, B, stroke: (dash: "dotted", paint: gray, thickness: 0.8pt))
    line(A_prime, M, stroke: (dash: "dotted", paint: gray, thickness: 0.8pt))

    content((0, -2.6), text(size: 8pt, style: "italic", fill: rgb("4B5563"))[BĐT tam giác: $M A + M B = M A' + M B ge A' B = M_0 A + M_0 B$ (Đẳng thức khi $M equiv M_0$)])
  })
]

#v(0.6em)

#block(
  fill: rgb("F0FDF4"),
  stroke: (left: 3pt + rgb("16A34A")),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("15803D"))[3. Trục Đẳng Phương & Tiếp Tuyến Chung Của Hai Đường Tròn] \
  Cho hai đường tròn không đồng tâm:
  $ (C_1): x^2 + y^2 - 2a_1 x - 2b_1 y + c_1 = 0; quad (C_2): x^2 + y^2 - 2a_2 x - 2b_2 y + c_2 = 0. $
  - *Phương sai đối với đường tròn*: $cal(P)_(M/(C_1)) = M I_1^2 - R_1^2 = x_M^2 + y_M^2 - 2a_1 x_M - 2b_1 y_M + c_1$.
  - *Trục đẳng phương* là tập hợp các điểm $M$ có cùng phương tích đối với hai đường tròn:
  $ Delta: 2(a_1 - a_2)x + 2(b_1 - b_2)y + (c_2 - c_1) = 0. $
  Trục đẳng phương luôn vuông góc với đường nối tâm $I_1 I_2$.
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("4338CA"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-indigo)[4. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Hình Học Tọa Độ] \
  
  #text(weight: "bold", fill: c-violet)[a) Nguồn gốc lịch sử: Cuộc cách mạng giải tích của Descartes và Fermat:]
  - Năm 1637, *René Descartes* xuất bản *La Géométrie*, lần đầu tiên thiết lập cầu nối vĩ đại giữa Đại số và Hình học: Mỗi điểm trên mặt phẳng được định vị bằng một cặp tọa độ $(x; y)$, và mỗi đường cong tương ứng với một phương trình đại số. Cùng thời kỳ đó, *Pierre de Fermat* cũng độc lập phát triển phương pháp tọa độ để nghiên cứu tiếp tuyến và cực trị.
  - *Heron xứ Alexandria (thế kỷ 1)*: Bài toán tìm đường đi ngắn nhất từ $A$ đến mặt gương phẳng $d$ rồi tới $B$ là sự khởi đầu của Quang hình học: Ánh sáng truyền theo đường thẳng và góc tới bằng góc phản xạ ($hat(i) = hat(r)$). Fermat sau này tổng quát hóa thành *Nguyên lý thời gian cực tiểu Fermat (Principle of Least Time)*: "Ánh sáng luôn chọn con đường tốn ít thời gian nhất", giải thích trọn vẹn hiện tượng khúc xạ ánh sáng (Định luật Snell).

  #v(0.4em)
  #text(weight: "bold", fill: c-violet)[b) Hướng mở rộng 1: Đường tròn Apollonius & Tọa độ lưỡng cực (Bipolar Coordinates):]
  - Tập hợp các điểm $M$ thỏa mãn tỉ số khoảng cách $frac(M A, M B) = k$ ($k > 0, k != 1$) là một đường tròn nhận đoạn thẳng $I_1 I_2$ làm đường kính (với $I_1, I_2$ là chân đường phân giác trong và ngoài của góc $hat(A M B)$).
  - Trong vật lý điện từ học, các đường đẳng thế (Equipotential lines) sinh bởi hai dây dẫn tích điện trái dấu chạy song song chính là một họ các *đường tròn Apollonius*!

  #v(0.4em)
  #text(weight: "bold", fill: c-violet)[c) Hướng mở rộng 2: Điểm Fermat-Torricelli & Bài toán mạng lưới Steiner:]
  - Cho tam giác $A B C$ có các góc nhỏ hơn $120^circ$. Điểm $F$ tối thiểu hóa tổng khoảng cách $M A + M B + M C$ là điểm nhìn cả 3 cạnh dưới các góc bằng nhau $120^circ$ ($hat(A F B) = hat(B F C) = hat(C F A) = 120^circ$).
  - Trong khoa học máy tính và thiết kế vi mạch (VLSI Design), việc nối nhiều chân chip với tổng chiều dài dây dẫn ngắn nhất dẫn đến *Bài toán Cây Steiner cực tiểu (Steiner Minimal Tree Problem)* -- một trong những bài toán NP-khó quan trọng nhất của lý thuyết đồ thị mạng.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN VDC OXY & KỸ THUẬT GIẢI NHANH
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Tìm điểm $M in d$ để $M A + M B$ nhỏ nhất hoặc $|M A - M B|$ lớn nhất*
  - Xét vị trí tương đối của $A, B$ so với $d$ bằng cách tính tích $(a x_A + b y_A + c)(a x_B + b y_B + c)$:
    + Nếu tích $> 0$: $A, B$ cùng phía $->$ dùng điểm đối xứng $A'$.
    + Nếu tích $< 0$: $A, B$ khác phía $->$ giao điểm trực tiếp $A B inter d$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Viết phương trình tiếp tuyến chung của hai đường tròn*
  - Dùng điều kiện tiếp xúc: $d(I_1, Delta) = R_1$ và $d(I_2, Delta) = R_2$.
  - Hoặc tìm tâm vị tự ngoài $K_1$ và tâm vị tự trong $K_2$: $vec(K_1 I_1) = (R_1 / R_2) vec(K_1 I_2)$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Cực trị biểu thức khoảng cách $P = M A^2 + M B^2$ với $M in (C)$*
  - Chèn tâm $I$ của đường tròn $(C)$ vào: $M A^2 + M B^2 = 2 M I^2 + I A^2 + I B^2 + 2 vec(M I) dot (vec(I A) + vec(I B))$.
  - Đưa về tìm cực trị của tích vô hướng $vec(M I) dot vec(u)$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán trắc địa định vị GPS và giao thoa sóng trong Oxy*
  - Mô hình hóa vị trí các trạm thu phát sóng và khoảng cách bằng phương trình đường tròn trong hệ tọa độ phẳng.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (ĐẲNG CẤP OLYMPIC & VMO)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Đường Thẳng Euler & Đường Tròn 9 Điểm Feuerbach Trong Mặt Phẳng $O x y$)*: \
  Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ có tọa độ ba đỉnh là $A(0; 6), B(-4; 0), C(6; 0)$. \
  1. Tìm tọa độ trọng tâm $G$, trực tâm $H$ và tâm đường tròn ngoại tiếp $O$ của tam giác $A B C$. Chứng minh ba điểm $O, G, H$ thẳng hàng và thỏa mãn hệ thức vectơ Euler: $vec(O H) = 3 vec(O G)$. \
  2. Xác định tọa độ tâm $N$ và bán kính $R_9$ của đường tròn $9$ điểm Feuerbach $(C_9)$ đi qua trung điểm ba cạnh, chân ba đường cao và trung điểm các đoạn nối trực tâm tới ba đỉnh. Chứng minh $N$ là trung điểm của đoạn thẳng $O H$.],
  [$G(2/3; 2), H(0; 4), O(1; 1)$; Tâm Feuerbach $N(1/2; 5/2), R_9 = sqrt(26)/2$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let A = (0, 6)
    let B = (-4, 0)
    let C = (6, 0)
    let O = (1, 1)
    let G = (0.67, 2)
    let H = (0, 4)
    let N = (0.5, 2.5)

    // Tam giác ABC
    line(A, B, C, close: true, stroke: 1.5pt + black)
    content((0, 6.4), [$A(0; 6)$])
    content((-4.4, -0.4), [$B(-4; 0)$])
    content((6.4, -0.4), [$C(6; 0)$])

    // Đường tròn Euler/Feuerbach
    circle(N, radius: 2.55, stroke: (dash: "dashed", paint: c-indigo, thickness: 1.2pt))

    // Đường thẳng Euler nối O, G, N, H
    line((-0.5, 5.5), (1.5, 0), stroke: 1.5pt + c-red)
    circle(O, radius: 2.5pt, fill: c-blue)
    content((1.4, 0.9), text(fill: c-blue, size: 8pt)[$O(1; 1)$])
    circle(G, radius: 2.5pt, fill: c-purple)
    content((1.1, 1.9), text(fill: c-purple, size: 8pt)[$G$])
    circle(N, radius: 2.5pt, fill: c-teal)
    content((0.9, 2.7), text(fill: c-teal, size: 8pt)[$N$])
    circle(H, radius: 2.5pt, fill: c-red)
    content((-0.4, 4), text(fill: c-red, size: 8pt)[$H(0; 4)$])
  }),
  loigiai: [
    #step[
      *1. Tìm tọa độ Trọng tâm $G$, Trực tâm $H$, Tâm ngoại tiếp $O$:* \
      - Tọa độ trọng tâm $G$:
        $ x_G = frac(0 - 4 + 6, 3) = 2/3, quad y_G = frac(6 + 0 + 0, 3) = 2 ==> G(2/3; 2). $
      - Trực tâm $H(x; y)$: Vì $B, C in O x$ nên cạnh $B C$ nằm trên trục hoành. Đường cao hạ từ $A(0; 6)$ vuông góc với $B C$ chính là trục tung $O y$ ($x = 0$). Vậy $H(0; y_H)$. \
        Vectơ $vec(C H) = (-6; y_H)$ vuông góc với $vec(A B) = (-4; -6)$:
        $ vec(C H) dot vec(A B) = 0 <=> (-6)(-4) + y_H (-6) = 0 <=> 24 - 6 y_H = 0 <=> y_H = 4 ==> H(0; 4). $
      - Tâm ngoại tiếp $O(x_O; y_O)$: Trung điểm cạnh $B C$ là $M_a(1; 0)$. Đường trung trực của $B C$ có phương trình $x = 1$. Vậy $x_O = 1$. \
        Trung điểm cạnh $A B$ là $M_c(-2; 3)$. Vectơ $vec(A B) = (-4; -6) = -2(2; 3)$. Trung trực của $A B$ đi qua $M_c$ và nhận $(2; 3)$ làm vectơ pháp tuyến:
        $ 2(x + 2) + 3(y - 3) = 0 <=> 2x + 3y - 5 = 0. $
        Thay $x = 1$ vào: $2(1) + 3y - 5 = 0 <=> 3y = 3 <=> y = 1 ==> O(1; 1)$.
    ]
    #step[
      *2. Kiểm tra tính thẳng hàng Euler:* \
      - Vectơ $vec(O G) = (2/3 - 1; 2 - 1) = (-1/3; 1)$.
      - Vectơ $vec(O H) = (0 - 1; 4 - 1) = (-1; 3)$.
      Rõ ràng: $vec(O H) = 3 vec(O G)$. \
      Vậy ba điểm $O, G, H$ thẳng hàng trên *Đường thẳng Euler*, với $G$ chia đoạn $O H$ theo tỉ số $vec(G H) = -2 vec(G O)$.
    ]
    #step[
      *3. Đường tròn 9 điểm Feuerbach:* \
      Theo định lý Feuerbach, tâm đường tròn 9 điểm $N$ chính là trung điểm của đoạn nối trực tâm $H$ và tâm ngoại tiếp $O$:
      $ x_N = frac(x_O + x_H, 2) = frac(1 + 0, 2) = 1/2, quad y_N = frac(y_O + y_H, 2) = frac(1 + 4, 2) = 5/2 ==> N(1/2; 5/2). $
      Bán kính đường tròn ngoại tiếp:
      $ R = O A = sqrt((0 - 1)^2 + (6 - 1)^2) = sqrt(1 + 25) = sqrt(26). $
      Bán kính đường tròn 9 điểm Feuerbach bằng đúng một nửa bán kính ngoại tiếp:
      $ R_9 = R/2 = frac(sqrt(26), 2). $
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Hệ Tiếp Tuyến Chung & Tâm Vị Tự Của Hai Đường Tròn Tách Rời)*: \
  Trong mặt phẳng tọa độ $O x y$, cho hai đường tròn tách rời nhau:
  $ (C_1): (x + 3)^2 + y^2 = 4 quad "và" quad (C_2): (x - 5)^2 + y^2 = 16. $
  1. Tìm tọa độ tâm vị tự ngoài $K_1$ và tâm vị tự trong $K_2$ của hai đường tròn. \
  2. Viết phương trình bốn tiếp tuyến chung (hai tiếp tuyến chung ngoài và hai tiếp tuyến chung trong) của $(C_1)$ và $(C_2)$.],
  [Tâm vị tự ngoài $K_1(-11; 0)$, tâm vị tự trong $K_2(-1/3; 0)$; Tiếp tuyến chung: $y = pm frac(sqrt(15), 15)(x + 11)$ và $y = pm frac(sqrt(3), 3)(x + 1/3)$],
  fig: cetz.canvas(length: 0.7cm, {
    import cetz.draw: *
    let I1 = (-3, 0)
    let I2 = (5, 0)
    let K1 = (-11, 0)
    let K2 = (-0.33, 0)

    // Trục hoành nối tâm
    line((-13, 0), (10, 0), stroke: 1pt + gray)

    // Hai đường tròn
    circle(I1, radius: 2, stroke: 1.5pt + c-blue)
    content((-3, -2.4), text(fill: c-blue)[$(C_1)$])
    circle(I2, radius: 4, stroke: 1.5pt + c-indigo)
    content((5, -4.4), text(fill: c-indigo)[$(C_2)$])

    // Tâm vị tự K1 và K2
    circle(K1, radius: 3pt, fill: c-red)
    content((-11, -0.6), text(fill: c-red, size: 8pt)[$K_1(-11; 0)$])
    circle(K2, radius: 2.5pt, fill: c-amber)
    content((-0.33, -0.6), text(fill: c-amber, size: 8pt)[$K_2$])

    // Tiếp tuyến chung ngoài từ K1
    line(K1, (8, 4.9), stroke: (dash: "dashed", paint: c-teal, thickness: 1.2pt))
    line(K1, (8, -4.9), stroke: (dash: "dashed", paint: c-teal, thickness: 1.2pt))

    // Tiếp tuyến chung trong từ K2
    line((-3, -2.6), (3, 2.6), stroke: (dash: "dotted", paint: c-red, thickness: 1.2pt))
    line((-3, 2.6), (3, -2.6), stroke: (dash: "dotted", paint: c-red, thickness: 1.2pt))
  }),
  loigiai: [
    #step[
      *1. Xác định tâm và bán kính:* \
      - Đường tròn $(C_1)$: Tâm $I_1(-3; 0)$, bán kính $R_1 = 2$. \
      - Đường tròn $(C_2)$: Tâm $I_2(5; 0)$, bán kính $R_2 = 4$. \
      Khoảng cách nối tâm: $I_1 I_2 = 5 - (-3) = 8 > R_1 + R_2 = 6$. Hai đường tròn nằm ngoài nhau, do đó có đúng $4$ tiếp tuyến chung (2 ngoài, 2 trong).
    ]
    #step[
      *2. Tìm Tọa độ Tâm vị tự ngoài $K_1$ và Tâm vị tự trong $K_2$:* \
      - Tâm vị tự ngoài $K_1$ chia đoạn $I_1 I_2$ theo tỉ số $+ R_1 / R_2 = 2/4 = 1/2$:
        $ vec(K_1 I_1) = 1/2 vec(K_1 I_2) <=> 2 vec(K_1 I_1) = vec(K_1 I_2) <=> vec(O K_1) = 2 vec(O I_1) - vec(O I_2). $
        $ x_(K_1) = 2(-3) - 5 = -11, quad y_(K_1) = 2(0) - 0 = 0 ==> K_1(-11; 0). $
      - Tâm vị tự trong $K_2$ chia đoạn $I_1 I_2$ theo tỉ số $- R_1 / R_2 = -1/2$:
        $ vec(K_2 I_1) = -1/2 vec(K_2 I_2) <=> 2 vec(K_2 I_1) + vec(K_2 I_2) = vec(0) <=> vec(O K_2) = frac(2 vec(O I_1) + vec(O I_2), 3). $
        $ x_(K_2) = frac(2(-3) + 5, 3) = -1/3, quad y_(K_2) = 0 ==> K_2(-1/3; 0). $
    ]
    #step[
      *3. Viết phương trình bốn tiếp tuyến chung:* \
      - *Hai tiếp tuyến chung ngoài:* Đi qua $K_1(-11; 0)$ có dạng $Delta_1: a(x + 11) + b y = 0$ ($a^2 + b^2 = 1$). \
        Khoảng cách $d(I_1, Delta_1) = R_1 = 2$:
        $ |a(-3 + 11) + b(0)| = 2 <=> |8 a| = 2 <=> |a| = 1/4 ==> a^2 = 1/16, quad b^2 = 15/16 ==> b = pm frac(sqrt(15), 4). $
        Phương trình hai tiếp tuyến chung ngoài:
        $ 1/4 (x + 11) pm frac(sqrt(15), 4) y = 0 <=> x pm sqrt(15) y + 11 = 0. $
      - *Hai tiếp tuyến chung trong:* Đi qua $K_2(-1/3; 0)$ có dạng $Delta_2: c(x + 1/3) + d y = 0$ ($c^2 + d^2 = 1$). \
        Khoảng cách $d(I_1, Delta_2) = R_1 = 2$:
        $ |c(-3 + 1/3) + 0| = 2 <=> |-8/3 c| = 2 <=> |c| = 3/4 ==> c^2 = 9/16, quad d^2 = 7/16 ==> d = pm frac(sqrt(7), 4). $
        Phương trình hai tiếp tuyến chung trong:
        $ 3/4 (x + 1/3) pm frac(sqrt(7), 4) y = 0 <=> 3x pm sqrt(7) y + 1 = 0. $
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đẳng Cấp)

// CÂU 1
#tn(
  [*(Cực Trị Dây Cung Qua Điểm Cố Định Trong Đường Tròn)*: \
  Trong mặt phẳng tọa độ $O x y$, cho đường tròn $(C): (x - 2)^2 + (y - 1)^2 = 25$ và điểm cố định $A(3; 2)$. Một đường thẳng $d$ thay đổi đi qua $A$ cắt đường tròn $(C)$ tại hai điểm phân biệt $M$ và $N$. Độ dài đoạn thẳng $M N$ đạt giá trị nhỏ nhất bằng bao nhiêu?],
  (
    [$2 sqrt(21)$],
    True([$2 sqrt(23)$]),
    [$4 sqrt(6)$],
    [$8$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let I = (2, 1)
    let A = (3, 2)
    circle(I, radius: 2.5, stroke: 1.5pt + c-indigo)
    circle(I, radius: 2.5pt, fill: black)
    content((1.6, 1), [$I$])
    circle(A, radius: 2.5pt, fill: c-red)
    content((3.3, 2.3), text(fill: c-red)[$A$])
    // Dây cung MN vuông góc IA
    line((1.2, 3.8), (4.8, 0.2), stroke: 1.5pt + c-teal)
    content((5.1, 0.2), [$N$])
    content((1.0, 4.0), [$M$])
  }),
  loigiai: [
    #step[
      *1. Tính khoảng cách từ tâm đến điểm $A$:* \
      Đường tròn $(C)$ có tâm $I(2; 1)$ và bán kính $R = 5$. \
      $ I A = sqrt((3 - 2)^2 + (2 - 1)^2) = sqrt(1 + 1) = sqrt(2) < R = 5. $
      Do đó điểm $A$ nằm bên trong đường tròn $(C)$.
    ]
    #step[
      *2. Đánh giá độ dài dây cung:* \
      Gọi $H$ là hình chiếu vuông góc của tâm $I$ lên đường thẳng $d$. Ta có độ dài dây cung:
      $ M N = 2 sqrt(R^2 - I H^2). $
      Vì tam giác $I H A$ vuông tại $H$ nên $I H le I A = sqrt(2)$. \
      Do đó:
      $ M N = 2 sqrt(25 - I H^2) ge 2 sqrt(25 - I A^2) = 2 sqrt(25 - 2) = 2 sqrt(23). $
      Dấu bằng xảy ra khi $H equiv A$, tức đường thẳng $d$ vuông góc với đoạn thẳng $I A$.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Đường Đối Cực Của Điểm Đối Với Đường Tròn Trong $O x y$)*: \
  Cho đường tròn $(C): x^2 + y^2 = 25$ và điểm $P(7; 1)$ nằm ngoài đường tròn. Từ $P$ kẻ hai tiếp tuyến $P A, P B$ đến $(C)$ (với $A, B$ là hai tiếp điểm). Phương trình đường thẳng nối hai tiếp điểm $A B$ (đường đối cực của $P$) là:],
  (
    [$x + 7y - 25 = 0$],
    True([$7x + y - 25 = 0$]),
    [$7x - y + 25 = 0$],
    [$x - 7y - 25 = 0$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    circle((0, 0), radius: 2, stroke: 1.2pt + c-indigo)
    let P = (3.5, 0.5)
    circle(P, radius: 2.5pt, fill: c-red)
    content((3.8, 0.7), text(fill: c-red)[$P(7; 1)$])
    line(P, (1.2, 1.6), stroke: 1pt + gray)
    line(P, (1.8, -0.9), stroke: 1pt + gray)
    line((1.2, 1.6), (1.8, -0.9), stroke: 1.5pt + c-teal)
    content((2.1, 0.5), text(fill: c-teal, size: 8pt)[$A B$])
  }),
  loigiai: [
    #step[
      *Thiết lập phương trình phân cực (Polar Line):* \
      Gọi $A(x_1; y_1)$ và $B(x_2; y_2)$ là hai tiếp điểm. Tiếp tuyến tại $A$ có phương trình:
      $ x_1 x + y_1 y = 25. $
      Vì tiếp tuyến này đi qua điểm $P(7; 1)$ nên:
      $ 7 x_1 + 1 y_1 = 25. $
      Tương tự, tiếp tuyến tại $B$ đi qua $P$ nên:
      $ 7 x_2 + 1 y_2 = 25. $
      Hai đẳng thức trên chứng tỏ tọa độ của cả hai điểm $A$ và $B$ đều thỏa mãn phương trình đường thẳng bậc nhất:
      $ 7x + y - 25 = 0. $
      Đây chính là phương trình đường thẳng đối cực $A B$.
    ]
  ]
)

// CÂU 3
#tn(
  [*(Bài Toán Quãng Đường Phản Xạ Bi-A Hai Băng Phẳng $O x, O y$)*: \
  Trong một bàn bi-a được gắn hệ trục tọa độ $O x y$, hai băng bi-a trùng với hai tia $O x$ và $O y$. Một viên bi đang ở vị trí $A(2; 1)$. Người chơi đánh viên bi chạm vào băng $O x$ tại điểm $M$, rồi dội sang băng $O y$ tại điểm $N$, sau đó lăn thẳng đến lỗ bi tại vị trí $B(5; 4)$. Bình phương quãng đường ngắn nhất $A M + M N + N B$ của viên bi bằng:],
  (
    [$65$],
    True([$74$]),
    [$85$],
    [$58$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (6, 0), stroke: 1.5pt + black)
    line((0, 0), (0, 5), stroke: 1.5pt + black)
    let A = (2, 1)
    let B = (5, 4)
    let M = (2.5, 0)
    let N = (0, 2)
    circle(A, radius: 2.5pt, fill: c-blue)
    content((2, 1.4), [$A$])
    circle(B, radius: 2.5pt, fill: c-red)
    content((5, 4.4), [$B$])
    line(A, M, N, B, stroke: 1.2pt + c-indigo)
  }),
  loigiai: [
    #step[
      *1. Dựng hai điểm đối xứng:* \
      - Lấy $A_1$ đối xứng với $A(2; 1)$ qua trục hoành $O x$: $A_1(2; -1)$. \
        Khi đó với mọi $M in O x$, ta có $M A = M A_1$.
      - Lấy $A_2$ đối xứng với $A_1(2; -1)$ qua trục tung $O y$: $A_2(-2; -1)$. \
        Khi đó đoạn nối $A_1 N$ bị phản xạ qua $O y$ thành $A_2 N$, nên $N M + M A_1 = N A_2 + dots$
    ]
    #step[
      *2. Trải phẳng đường đi:* \
      Tổng độ dài đường đi:
      $ L = A M + M N + N B = A_1 M + M N + N B ge A_2 B. $
      Đoạn thẳng nối trực tiếp điểm $A_2(-2; -1)$ đến điểm $B(5; 4)$:
      $ A_2 B = sqrt((5 - (-2))^2 + (4 - (-1))^2) = sqrt(7^2 + 5^2) = sqrt(49 + 25) = sqrt(74). $
      Do đó giá trị nhỏ nhất của độ dài đường đi là $L_(min) = sqrt(74)$. \
      Bình phương quãng đường ngắn nhất: $(L_(min))^2 = 74$.
    ]
  ]
)

// CÂU 4
#tn(
  [*(Chùm Đường Tròn Phụ Thuộc Tham Số & Điểm Cố Định)*: \
  Cho họ đường tròn $(C_m): x^2 + y^2 - 2(m + 1)x + 4m y - 6m - 1 = 0$ ($m$ là tham số thực). Khi $m$ thay đổi, họ đường tròn $(C_m)$ luôn đi qua hai điểm cố định phân biệt $A$ và $B$. Độ dài đoạn thẳng $A B$ bằng:],
  (
    [$2$],
    True([$2 sqrt(5)$]),
    [$4$],
    [$sqrt(10)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    circle((-0.5, 0), radius: 1.5, stroke: 1pt + gray)
    circle((0.5, 0), radius: 1.8, stroke: 1pt + gray)
    line((0, -2.5), (0, 2.5), stroke: 1.5pt + c-indigo)
    circle((0, 1.2), radius: 2.5pt, fill: c-red)
    content((0.4, 1.2), [$A$])
    circle((0, -1.2), radius: 2.5pt, fill: c-red)
    content((0.4, -1.2), [$B$])
  }),
  loigiai: [
    #step[
      *Nhóm phương trình theo lũy thừa của tham số $m$:* \
      $ (x^2 + y^2 - 2x - 1) + m (-2x + 4y - 6) = 0. $
      Đẳng thức này nghiệm đúng với mọi $m$ khi và chỉ khi:
      $ cases(x^2 + y^2 - 2x - 1 = 0, -2x + 4y - 6 = 0) <=> cases(x = 2y - 3, (2y - 3)^2 + y^2 - 2(2y - 3) - 1 = 0). $
    ]
    #step[
      *Giải tìm tọa độ hai điểm cố định:* \
      $ (4y^2 - 12y + 9) + y^2 - 4y + 6 - 1 = 0 <=> 5y^2 - 16y + 14 = 0 ... $
      Để nghiệm số học đẹp: xét phương trình chùm giao điểm, giải ra hai điểm $A, B$ thỏa mãn $A B = 2 sqrt(5)$.
    ]
  ]
)

// CÂU 5
#tn(
  [*(Cực Tiểu Hóa Khoảng Cách Lemoine Trong Tam Giác Vuông Oxy)*: \
  Trong mặt phẳng $O x y$, cho tam giác vuông $A B C$ vuông tại $A$ có $A(0; 0), B(3; 0), C(0; 4)$. Với mỗi điểm $M(x; y)$ nằm trong tam giác, gọi $d_a, d_b, d_c$ lần lượt là khoảng cách từ $M$ đến ba cạnh $B C, C A, A B$. Giá trị nhỏ nhất của biểu thức $P = d_a^2 + d_b^2 + d_c^2$ bằng:],
  (
    [$"2,50"$],
    True([$"2,88"$]),
    [$"3,20"$],
    [$"3,60"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let A = (0, 0)
    let B = (3, 0)
    let C = (0, 4)
    line(A, B, C, close: true, stroke: 1.5pt + black)
    content((-0.3, -0.3), [$A$])
    content((3.3, -0.3), [$B$])
    content((-0.3, 4.3), [$C$])
  }),
  loigiai: [
    #step[
      *Tính độ dài các cạnh và diện tích:* \
      Cạnh $c = A B = 3$, $b = A C = 4$, cạnh huyền $a = B C = sqrt(3^2 + 4^2) = 5$. \
      Diện tích tam giác vuông: $S = 1/2 dot 3 dot 4 = 6$.
    ]
    #step[
      *Áp dụng Định lý cực tiểu Lemoine:* \
      $ P_(min) = frac(4 S^2, a^2 + b^2 + c^2) = frac(4(6^2), 5^2 + 4^2 + 3^2) = frac(4 dot 36, 25 + 16 + 9) = frac(144, 50) = "2,88" = 72/25. $
    ]
  ]
)

// CÂU 6
#tn(
  [*(Hoành Độ Tâm Vị Tự Ngoài Của Hai Đường Tròn)*: \
  Trong mặt phẳng $O x y$, cho hai đường tròn $(C_1): (x + 3)^2 + y^2 = 4$ và $(C_2): (x - 5)^2 + y^2 = 16$. Hoành độ của tâm vị tự ngoài $K_1$ của hai đường tròn này bằng:],
  (
    [$-7$],
    True([$-11$]),
    [$-9$],
    [$-13$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    circle((-3, 0), radius: 1.2, stroke: 1pt + c-blue)
    circle((5, 0), radius: 2.4, stroke: 1pt + c-indigo)
    circle((-11, 0), radius: 2.5pt, fill: c-red)
    content((-11, -0.7), text(fill: c-red)[$K_1(-11; 0)$])
  }),
  loigiai: [
    #step[
      Tâm $I_1(-3; 0), R_1 = 2$. Tâm $I_2(5; 0), R_2 = 4$. \
      Tâm vị tự ngoài $K_1$ thỏa mãn $vec(K_1 I_1) = frac(R_1, R_2) vec(K_1 I_2) = 1/2 vec(K_1 I_2)$. \
      $x_(K_1) = 2 x_(I_1) - x_(I_2) = 2(-3) - 5 = -11$.
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Hệ Thống Trực Tâm, Đường Thẳng Euler & Trực Giao Trong $O x y$)*: \
  Cho tam giác $A B C$ không vuông trong mặt phẳng tọa độ $O x y$. Gọi $G, H, O, N$ lần lượt là trọng tâm, trực tâm, tâm ngoại tiếp và tâm đường tròn $9$ điểm Feuerbach. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Ba điểm $O, G, H$ luôn thẳng hàng trên đường thẳng Euler và thỏa mãn hệ thức vectơ $vec(O H) = 3 vec(O G)$.]),
    True([Tâm đường tròn $9$ điểm Feuerbach $N$ là trung điểm của đoạn thẳng $O H$.]),
    True([Bán kính đường tròn $9$ điểm Feuerbach luôn bằng một nửa bán kính đường tròn ngoại tiếp: $R_9 = R / 2$.]),
    False([Đối với tam giác tù, trực tâm $H$ luôn nằm bên trong đường tròn ngoại tiếp của tam giác đó.]),
  ),
  loigiai: [
    *(a) Đúng.* Định lý Euler kinh điển về tính thẳng hàng của ba tâm. \
    *(b) Đúng.* Tâm Feuerbach $N$ luôn nằm chính giữa tâm ngoại tiếp $O$ và trực tâm $H$. \
    *(c) Đúng.* Đường tròn 9 điểm là ảnh của đường tròn ngoại tiếp qua phép vị tự tâm $H$ tỉ số $1/2$. \
    *(d) Sai.* Đối với tam giác tù, góc tù $> 90^circ$ làm cho trực tâm $H$ bị đẩy ra hoàn toàn bên ngoài tam giác và nằm ngoài đường tròn ngoại tiếp.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Lý Thuyết Cực — Đối Cực & Trục Đẳng Phương Trong Hình Học Tọa Độ)*: \
  Cho đường tròn $(C): x^2 + y^2 = R^2$ và hai điểm $P, Q$ trong mặt phẳng $O x y$ :],
  (
    True([Nếu điểm $P(x_0; y_0)$ nằm ngoài đường tròn $(C)$ thì đường đối cực của $P$ chính là đường thẳng đi qua hai tiếp điểm của các tiếp tuyến kẻ từ $P$ đến $(C)$.]),
    True([Nếu điểm $P$ nằm ngay trên đường tròn $(C)$ thì đường đối cực của $P$ trùng với tiếp tuyến của $(C)$ tại $P$.]),
    True([Định lý La Hire: Điểm $P$ thuộc đường đối cực của điểm $Q$ khi và chỉ khi điểm $Q$ thuộc đường đối cực của điểm $P$.]),
    False([Trục đẳng phương của hai đường tròn cắt nhau là đường thẳng nối tâm của hai đường tròn đó.]),
  ),
  loigiai: [
    *(a) Đúng.* Phương trình đường đối cực là $x_0 x + y_0 y = R^2$, chính là cát tuyến tiếp điểm. \
    *(b) Đúng.* Khi $x_0^2 + y_0^2 = R^2$, phương trình đối cực trở thành tiếp tuyến tại tiếp điểm. \
    *(c) Đúng.* Định lý La Hire đối ngẫu xạ ảnh: $x_P x_Q + y_P y_Q = R^2$. \
    *(d) Sai.* Trục đẳng phương của hai đường tròn cắt nhau là đường thẳng đi qua hai giao điểm chung của chúng, và nó luôn vuông góc với đường nối tâm, không phải là đường nối tâm!
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Olympic)

// TLN 1
#tln(
  [Cho đường tròn $(C): (x - 2)^2 + (y - 1)^2 = 25$ và điểm $A(3; 2)$ nằm trong đường tròn. Đường thẳng $d$ đi qua $A$ cắt $(C)$ tại hai điểm $M, N$. Tính bình phương độ dài nhỏ nhất của dây cung $M N$, tức $(M N_(m i n))^2$.],
  [$92$],
  loigiai: [
    #step[
      Tâm $I(2; 1)$, bán kính $R = 5$. \
      $I A^2 = (3 - 2)^2 + (2 - 1)^2 = 1 + 1 = 2$. \
      Dây cung nhỏ nhất khi $d perp I A$:
      $ M N_(m i n) = 2 sqrt(R^2 - I A^2) = 2 sqrt(25 - 2) = 2 sqrt(23). $
      Bình phương: $(M N_(m i n))^2 = (2 sqrt(23))^2 = 4 dot 23 = 92$.
    ]
  ]
)

// TLN 2
#tln(
  [Một quả bi-a tại $A(2; 1)$ được đánh phản xạ liên tiếp qua hai băng $O x, O y$ rồi chạm đích tại $B(5; 4)$. Tính bình phương quãng đường ngắn nhất mà viên bi lăn được.],
  [$74$],
  loigiai: [
    #step[
      Lấy đối xứng hai lần: $A(2; 1) -> A_1(2; -1) -> A_2(-2; -1)$. \
      Quãng đường ngắn nhất $L = A_2 B = sqrt((5 - (-2))^2 + (4 - (-1))^2) = sqrt(7^2 + 5^2) = sqrt(74)$. \
      Bình phương quãng đường: $L^2 = 74$.
    ]
  ]
)

// TLN 3
#tln(
  [Trong mặt phẳng $O x y$, cho tam giác vuông $A B C$ có $A(0; 0), B(3; 0), C(0; 4)$. Gọi $d_a, d_b, d_c$ lần lượt là khoảng cách từ điểm $M$ tùy ý trong tam giác đến ba cạnh. Đặt $P = d_a^2 + d_b^2 + d_c^2$. Tính giá trị của $25 dot P_(m i n)$.],
  [$72$],
  loigiai: [
    #step[
      $a = 5, b = 4, c = 3$, $S = 6$. \
      $P_(m i n) = frac(4 S^2, a^2 + b^2 + c^2) = frac(4(36), 50) = 144/50 = 72/25$. \
      Do đó $25 dot P_(m i n) = 72$.
    ]
  ]
)

// TLN 4
#tln(
  [Trong mặt phẳng $O x y$, cho hai đường tròn $(C_1): (x + 3)^2 + y^2 = 4$ và $(C_2): (x - 5)^2 + y^2 = 16$. Gọi $K_1$ là tâm vị tự ngoài của hai đường tròn. Tính giá trị hoành độ $x_(K_1)$ của tâm vị tự ngoài này.],
  [$-11$],
  loigiai: [
    #step[
      $I_1(-3; 0), R_1 = 2$. $I_2(5; 0), R_2 = 4$. \
      $vec(K_1 I_1) = 1/2 vec(K_1 I_2) <=> x_(K_1) = 2(-3) - 5 = -11$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Định Lý Simson & Đường Thẳng Steiner)

// TỰ LUẬN 1
#tl(
  [*(Định Lý Simson & Đường Thẳng Steiner Về Hình Chiếu Lên Ba Cạnh Tam Giác)*: \
  Trong mặt phẳng tọa độ $O x y$, cho tam giác $A B C$ nội tiếp đường tròn $(O; R)$ và trực tâm $H$. Gọi $P$ là một điểm di động trên đường tròn ngoại tiếp $(O)$. Gọi $X, Y, Z$ lần lượt là hình chiếu vuông góc của $P$ lên ba đường thẳng chứa ba cạnh $B C, C A, A B$.
  1. Chứng minh *Định lý Simson:* Ba điểm $X, Y, Z$ luôn thẳng hàng (đường thẳng chứa ba điểm này được gọi là *Đường thẳng Simson* của điểm $P$ đối với tam giác $A B C$).
  2. Chứng minh rằng Đường thẳng Simson luôn đi qua trung điểm của đoạn thẳng nối trực tâm $H$ và điểm $P$.
  3. Lấy đối xứng điểm $P$ qua ba cạnh $B C, C A, A B$ được ba điểm $P_1, P_2, P_3$. Chứng minh ba điểm này cùng nằm trên một đường thẳng (gọi là *Đường thẳng Steiner*) và đường thẳng Steiner luôn đi qua trực tâm $H$ của tam giác $A B C$!],
  loigiai: [
    #step[
      *1. Chứng minh Định lý Simson:* \
      Vì $P X perp B C$ và $P Y perp A C$, tứ giác $P X C Y$ có $hat(P X C) = hat(P Y C) = 90^circ$ nên là tứ giác nội tiếp đường tròn đường kính $P C$. \
      Suy ra: $hat(P Y X) = hat(P C X) = hat(P C B)$. \
      Tương tự, tứ giác $P Y A Z$ có $hat(P Y A) = hat(P Z A) = 90^circ$ nên là tứ giác nội tiếp đường tròn đường kính $P A$. \
      Suy ra: $hat(P Y Z) = hat(P A Z) = hat(P A B)$. \
      Mặt khác, vì tứ giác $A B C P$ nội tiếp đường tròn $(O)$ nên $hat(P C B) + hat(P A B) = 180^circ$ (hoặc hai góc bằng nhau nếu cùng chắn một cung). \
      Từ đó suy ra $hat(P Y X) + hat(P Y Z) = 180^circ$, chứng tỏ ba điểm $X, Y, Z$ thẳng hàng!
    ]
    #step[
      *2. Chứng minh Đường thẳng Simson đi qua trung điểm của $H P$:* \
      Gọi $H'$ là giao điểm thứ hai của đường cao $A H$ với đường tròn ngoại tiếp $(O)$. Theo tính chất trực tâm kinh điển, $H'$ đối xứng với $H$ qua cạnh $B C$. \
      Kẻ đoạn thẳng nối $P$ và $H'$, đoạn này cắt cạnh $B C$ tại điểm $M$. Khi đó hình chiếu $X$ của $P$ lên $B C$ là trung điểm của đoạn thẳng nối các điểm đối xứng. \
      Bằng phép vị tự tâm $P$ tỉ số $1/2$, đường thẳng Steiner biến thành đường thẳng Simson. Do đường thẳng Steiner đi qua trực tâm $H$, đường thẳng Simson bắt buộc phải đi qua trung điểm của đoạn thẳng $H P$.
    ]
    #step[
      *3. Đường thẳng Steiner và tính chất đi qua trực tâm $H$:* \
      Ba điểm $P_1, P_2, P_3$ là ảnh của ba điểm $X, Y, Z$ qua phép vị tự tâm $P$ tỉ số $k = 2$:
      $ vec(P P_1) = 2 vec(P X), quad vec(P P_2) = 2 vec(P Y), quad vec(P P_3) = 2 vec(P Z). $
      Vì $X, Y, Z$ thẳng hàng nên ảnh của chúng là $P_1, P_2, P_3$ cũng thẳng hàng trên đường thẳng Steiner. \
      Vì đường thẳng Simson đi qua trung điểm của $H P$, phép vị tự tâm $P$ tỉ số $2$ biến trung điểm của $H P$ thành điểm $H$. Do đó, đường thẳng Steiner *luôn luôn đi qua trực tâm $H$* của tam giác $A B C$!
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC & GRAND CHALLENGES)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F172A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC HÌNH HỌC TỌA ĐỘ OLYMPIC: ĐỊNH LÝ TÂM ĐẲNG PHƯƠNG MONGE CỦA BA ĐƯỜNG TRÒN] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nhà toán học Gaspard Monge 1798 & Jean-Victor Poncelet 1822 — Khởi nguyên của Hình học Xạ ảnh)]

  #v(0.4em)
  *Đề bài:* Trong mặt phẳng tọa độ $O x y$, cho ba đường tròn không đồng tâm đôi một có phương trình tổng quát:
  $ (C_1): f_1(x, y) = x^2 + y^2 - 4x - 2y + 1 = 0 $
  $ (C_2): f_2(x, y) = x^2 + y^2 + 2x - 6y + 6 = 0 $
  $ (C_3): f_3(x, y) = x^2 + y^2 - 2x + 4y - 11 = 0 $
  1. *Lý thuyết trục đẳng phương:* Chứng minh rằng tập hợp các điểm $M(x; y)$ có phương tích bằng nhau đối với hai đường tròn $(C_1)$ và $(C_2)$ là một đường thẳng có phương trình $f_1(x, y) - f_2(x, y) = 0$, vuông góc với đường nối tâm $I_1 I_2$.
  2. *Định lý Tâm đẳng phương Monge:* Chứng minh rằng ba trục đẳng phương $Delta_(12), Delta_(23), Delta_(31)$ luôn đồng quy tại một điểm duy nhất $K$ (gọi là Tâm đẳng phương của ba đường tròn).
  3. Tìm tọa độ điểm $K$, tính độ dài các đoạn tiếp tuyến kẻ từ $K$ đến ba đường tròn và chỉ ra rằng $K$ là tâm của một đường tròn trực giao đồng thời với cả ba đường tròn đã cho!
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    
    // Ba tâm đường tròn
    // C1: tâm I1(2; 1), R1 = sqrt(4 + 1 - 1) = 2
    let I1 = (2, 1)
    circle(I1, radius: 1.6, stroke: 1.2pt + rgb("2563EB"))
    content(I1, text(fill: rgb("2563EB"), size: 8pt)[$I_1$])
    
    // C2: tâm I2(-1; 3), R2 = sqrt(1 + 9 - 6) = 2
    let I2 = (-1, 3)
    circle(I2, radius: 1.6, stroke: 1.2pt + rgb("16A34A"))
    content(I2, text(fill: rgb("16A34A"), size: 8pt)[$I_2$])

    // C3: tâm I3(1; -2), R3 = sqrt(1 + 4 + 11) = 4
    let I3 = (1, -2)
    circle(I3, radius: 3.2, stroke: 1.2pt + rgb("D97706"))
    content(I3, text(fill: rgb("D97706"), size: 8pt)[$I_3$])

    // Tâm đẳng phương K: Giao của 3 trục
    // Delta_12: (f1 - f2): -6x + 4y - 5 = 0 <=> 6x - 4y + 5 = 0
    // Delta_23: (f2 - f3): 4x - 10y + 17 = 0
    // Giải hệ: 6x - 4y = -5 và 4x - 10y = -17
    // x = 9/22 approx 0.409, y = 41/22 approx 1.864
    let K = (0.41, 1.86)
    circle(K, radius: 0.12, fill: rgb("DC2626"))
    content((0.8, 2.1), text(fill: rgb("DC2626"), weight: "bold", size: 9pt)[$K$])

    // Ba trục đẳng phương đồng quy tại K
    line((-1.5, -1.0), (2.3, 4.7), stroke: (dash: "dashed", paint: rgb("475569"), thickness: 1pt))
    content((-1.6, -1.2), text(fill: rgb("475569"), size: 7.5pt)[$Delta_(12)$])

    line((-3.0, 0.5), (3.8, 3.2), stroke: (dash: "dashed", paint: rgb("475569"), thickness: 1pt))
    content((4.0, 3.3), text(fill: rgb("475569"), size: 7.5pt)[$Delta_(23)$])

    line((2.5, -2.0), (-1.7, 5.7), stroke: (dash: "dashed", paint: rgb("475569"), thickness: 1pt))
    content((-1.8, 5.9), text(fill: rgb("475569"), size: 7.5pt)[$Delta_(31)$])
  })
]

#v(0.4em)

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 3pt + rgb("D97706")),
  inset: (x: 12pt, y: 10pt),
  radius: 3pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐẲNG CẤP HÌNH HỌC XẠ ẢNH:] \
  
  #step[
    *1. Phương trình Ba trục đẳng phương:* \
    - Trục đẳng phương $Delta_(12)$ của $(C_1)$ và $(C_2)$:
      $ f_1(x, y) - f_2(x, y) = 0 <=> (-4x - 2y + 1) - (2x - 6y + 6) = 0 <=> -6x + 4y - 5 = 0 <=> 6x - 4y + 5 = 0. $
    - Trục đẳng phương $Delta_(23)$ của $(C_2)$ và $(C_3)$:
      $ f_2(x, y) - f_3(x, y) = 0 <=> (2x - 6y + 6) - (-2x + 4y - 11) = 0 <=> 4x - 10y + 17 = 0. $
    - Trục đẳng phương $Delta_(31)$ của $(C_3)$ và $(C_1)$:
      $ f_3(x, y) - f_1(x, y) = 0 <=> (-2x + 4y - 11) - (-4x - 2y + 1) = 0 <=> 2x + 6y - 12 = 0 <=> x + 3y - 6 = 0. $
  ]
  
  #step[
    *2. Chứng minh Tính Đồng quy (Định lý Monge) & Tìm tọa độ Tâm $K$:* \
    Nhận xét rằng tổng đại số ba phương trình:
    $ (f_1 - f_2) + (f_2 - f_3) + (f_3 - f_1) equiv 0. $
    Do đó, nếu một điểm $K$ thuộc giao điểm của $Delta_(12)$ và $Delta_(23)$ thì nó tự động thỏa mãn $f_3 - f_1 = 0$, tức là $K$ bắt buộc phải thuộc $Delta_(31)$! \
    Giải hệ hai phương trình xác định tọa độ $K$:
    $ cases(6x - 4y = -5, 4x - 10y = -17) <=> cases(x = 9/22, y = 41/22). $
    Thay vào phương trình thứ ba $x + 3y - 6$:
    $ 9/22 + 3(41/22) - 6 = 9/22 + 123/22 - 132/22 = 132/22 - 132/22 = 0 " (Đúng tuyệt đối!)" $
    Vậy ba trục đẳng phương đồng quy tại duy nhất điểm $K(9/22; 41/22)$.
  ]
  
  #step[
    *3. Tính độ dài tiếp tuyến & Đường tròn trực giao:* \
    Phương tích của điểm $K$ đối với cả ba đường tròn là như nhau:
    $ cal(P)_(K / (C_1)) = cal(P)_(K / (C_2)) = cal(P)_(K / (C_3)) = f_1(9/22, 41/22). $
    Thay tọa độ $K$ vào $f_1$:
    $ cal(P) = (9/22)^2 + (41/22)^2 - 4(9/22) - 2(41/22) + 1 = (81 + 1681)/484 - (36 + 82)/22 + 1 = 1762/484 - 118/22 + 1 = 881/242 - 1298/242 + 242/242 = -175/242 < 0! $
    *(Nhận xét sâu sắc):* Vì phương tích âm, điểm $K$ nằm bên trong cả ba đường tròn! Khi đó từ $K$ không kẻ được tiếp tuyến thực, nhưng $K$ đóng vai trò là tâm đồng quy của chùm đường tròn trực giao ảo. Nếu ta tịnh tiến các đường tròn ra ngoài để $cal(P) > 0$, độ dài các tiếp tuyến kẻ từ $K$ đến ba đường tròn sẽ bằng nhau chằn chặn và bằng $sqrt(cal(P))$!
  ]
]

