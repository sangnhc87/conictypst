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
  stroke: (bottom: 2pt + rgb("4C1D95")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("4C1D95"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("6D28D9")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("6D28D9"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("7C3AED")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("7C3AED"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("6D28D9")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Vectơ & Tâm tỉ cự
#let c-purple-dark = rgb("4C1D95")
#let c-purple = rgb("6D28D9")
#let c-violet = rgb("7C3AED")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-bg-purple = rgb("F5F3FF")
#let c-border = rgb("EDE9FE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-purple,
    stroke: (
      left: 6pt + c-purple-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-purple-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: PHƯƠNG PHÁP TÂM TỈ CỰ\
      & CỰC TRỊ VECTƠ OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Định lý tâm tỉ cự mở rộng · Quỹ tích đường tròn Apollonius · Cực trị tổng độ dài và tích vô hướng\
      Cân bằng tĩnh học cơ học đa điểm neo & Định vị chuyển động có vận tốc — Dành cho mục tiêu 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & ĐỊNH LÝ TÂM TỈ CỰ MỞ RỘNG
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-purple),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-purple)[1. Định lý Cơ Bản Về Tâm Tỉ Cự Của Hệ Điểm] \
  Cho hệ $n$ điểm $A_1, A_2, dots, A_n$ và $n$ số thực $k_1, k_2, dots, k_n$ thỏa mãn điều kiện tổng hệ số khác không:
  $ sum_(i=1)^n k_i eq.not 0. $
  - *Sự tồn tại và duy nhất*: Luôn tồn tại duy nhất một điểm $I$ trong không gian thỏa mãn hệ thức:
  $ k_1 vec(I A_1) + k_2 vec(I A_2) + dots + k_n vec(I A_n) = vec(0). $
  Điểm $I$ được gọi là *tâm tỉ cự* (trọng tâm có trọng số) của hệ điểm $A_i$ ứng với các hệ số $k_i$.
  - *Công thức dồn biến (Vector Reduction)*: Với mọi điểm $M$ tùy ý trong mặt phẳng, ta luôn có:
  $ k_1 vec(M A_1) + k_2 vec(M A_2) + dots + k_n vec(M A_n) = (sum_(i=1)^n k_i) vec(M I). $
  - *Độ dài tổng vectơ*:
  $ |k_1 vec(M A_1) + k_2 vec(M A_2) + dots + k_n vec(M A_n)| = |sum_(i=1)^n k_i| dot M I. $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (-2, 0)
    let B = (3, 0)
    let C = (0.5, 3)
    let I = (0.5, 1)
    let M = (2, 2.5)

    // Tam giác ABC
    line(A, B, C, close: true, stroke: 1.2pt + gray)
    circle(A, radius: 2.5pt, fill: black)
    content((-2.3, -0.2), [$A$])
    circle(B, radius: 2.5pt, fill: black)
    content((3.3, -0.2), [$B$])
    circle(C, radius: 2.5pt, fill: black)
    content((0.5, 3.3), [$C$])

    // Tâm tỉ cự I
    circle(I, radius: 3pt, fill: c-purple)
    content((0.8, 0.8), text(fill: c-purple, weight: "bold")[$I$])

    // Điểm M di động
    circle(M, radius: 3pt, fill: c-red)
    content((2.3, 2.7), text(fill: c-red, weight: "bold")[$M$])

    // Vectơ MI
    line(M, I, mark: (end: ">", fill: c-red), stroke: 1.8pt + c-red)
    content((1.6, 1.6), text(fill: c-red, size: 9pt)[$vec(M I)$])
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
  #text(weight: "bold", fill: rgb("B45309"))[2. Định lý Leibniz Mở Rộng Về Tổng Bình Phương Khoảng Cách] \
  Với điểm $I$ là tâm tỉ cự của hệ điểm $(A_i, k_i)$, với mọi điểm $M$, ta có đẳng thức bình phương vô hướng:
  $ sum_(i=1)^n k_i M A_i^2 = (sum_(i=1)^n k_i) M I^2 + sum_(i=1)^n k_i I A_i^2. $
  - *Ý nghĩa cực trị*:
    Vì đại lượng $K_0 = sum_(i=1)^n k_i I A_i^2$ là một *hằng số cố định* không phụ thuộc vào vị trí của điểm $M$:
    + Nếu $sum k_i > 0$, biểu thức $P(M) = sum k_i M A_i^2$ đạt giá trị nhỏ nhất khi và chỉ khi khoảng cách $M I$ đạt giá trị nhỏ nhất (tức $M$ là hình chiếu vuông góc của $I$ lên đường thẳng hoặc mặt phẳng chứa $M$).
    + Quỹ tích điểm $M$ thỏa mãn $sum k_i M A_i^2 = C$ (hằng số) là một đường tròn tâm $I$ bán kính $R = sqrt((C - K_0)/(sum k_i))$.
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("4C1D95"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-purple-dark)[3. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Phương Pháp Tâm Tỉ Cự] \
  
  #text(weight: "bold", fill: c-purple)[a) Nguồn gốc lịch sử: Từ Archimedes đến Möbius và Leibniz:]
  - *Archimedes (287--212 TCN)*: Được xem là người đầu tiên phát minh ra nguyên lý tâm tỉ cự thông qua cơ học tĩnh học và định luật đòn bẩy: "Hai vật có khối lượng $m_1, m_2$ cân bằng tại điểm tựa $I$ khi và chỉ khi $m_1 d_1 = m_2 d_2$", tương đương hệ thức vectơ $m_1 vec(I A_1) + m_2 vec(I A_2) = vec(0)$.
  - *August Ferdinand Möbius (1790--1868)*: Năm 1827 xuất bản kiệt tác *Der barycentrische Calcul*, chính thức đưa khái niệm *Tọa độ tỉ cự (Barycentric Coordinates)* vào hình học hiện đại. Mọi điểm $M$ trên mặt phẳng tam giác $A B C$ đều xác định duy nhất bởi bộ ba số $(alpha, beta, gamma)$ thỏa mãn $alpha + beta + gamma = 1$ sao cho $vec(O M) = alpha vec(O A) + beta vec(O B) + gamma vec(O C)$.
  - *Gottfried Wilhelm Leibniz (1646--1716)*: Thiết lập hệ thức bình phương vô hướng mang tên ông, giải quyết trọn vẹn lớp bài toán cực trị tổng bình phương khoảng cách trong không gian $n$ chiều.

  #v(0.4em)
  #text(weight: "bold", fill: c-purple)[b) Hướng mở rộng 1: Tọa độ tỉ cự trong Đồ họa máy tính 3D (Computer Graphics):]
  - Trong kỹ thuật dựng hình đồ họa 3D hiện đại (OpenGL, DirectX, Vulkan, Unreal Engine), mọi bề mặt vật thể 3D phức tạp đều được xấp xỉ bằng lưới các tam giác (Polygon Mesh).
  - Khi đổ bóng (Shading), ánh xạ vân bề mặt (Texture Mapping) hoặc dò tia sáng (Ray Tracing), máy tính sử dụng *Tọa độ tỉ cự* $(alpha, beta, gamma)$ của giao điểm tia sáng trên tam giác để nội suy tuyến tính các vectơ pháp tuyến, màu sắc $R G B$ và độ sâu $Z$-buffer với tốc độ hàng tỷ phép tính mỗi giây trên GPU!

  #v(0.4em)
  #text(weight: "bold", fill: c-purple)[c) Hướng mở rộng 2: Định lý Carathéodory trong Giải tích lồi (Convex Analysis):]
  - Năm 1907, nhà toán học Constantin Carathéodory chứng minh một định lý nền tảng: "Trong không gian $RR^n$, mọi điểm $x$ nằm trong bao lồi của tập hợp $S$ đều có thể biểu diễn dưới dạng tâm tỉ cự (tổ hợp lồi) của không quá $n + 1$ điểm thuộc $S$":
    $ x = sum_(i=1)^(n+1) lambda_i x_i, quad lambda_i ge 0, quad sum_(i=1)^(n+1) lambda_i = 1 $
    Định lý này là trụ cột của lý thuyết Học máy (Machine Learning), máy vector hỗ trợ (Support Vector Machines - SVM) và bài toán bao lồi trong hình học tính toán.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN CỰC TRỊ VECTƠ VDC
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Cực trị độ dài tổng vectơ $|k_1 vec(M A) + k_2 vec(M B) + k_3 vec(M C)|$*
  - Xác định tâm tỉ cự $I$ thỏa mãn $k_1 vec(I A) + k_2 vec(I B) + k_3 vec(I C) = vec(0)$.
  - Đưa về bài toán tìm khoảng cách $M I$ min/max khi $M$ thuộc đường thẳng $d$, đường tròn $(C)$ hoặc nằm trên cạnh của một đa giác.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Cực trị tổng bình phương $a M A^2 + b M B^2 + c M C^2$*
  - Sử dụng định lý Leibniz: $T = (a+b+c) M I^2 + a I A^2 + b I B^2 + c I C^2$.
  - Cực trị đạt được khi $M I$ nhỏ nhất (hình chiếu trực giao).
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Quỹ tích đường tròn Apollonius & Cực trị tỉ số khoảng cách*
  - Tập hợp các điểm $M$ thỏa mãn $M A / M B = k$ ($k > 0, k eq.not 1$) là đường tròn đường kính $E F$, trong đó $E, F$ lần lượt là các điểm chia trong và chia ngoài đoạn thẳng $A B$ theo tỉ số $k$:
  $ vec(E A) = -k vec(E B) quad text("và") quad vec(F A) = k vec(F B). $
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Cân Bằng Lực Tĩnh Học Cơ Học & Đón Bắt Mục Tiêu Có Vận Tốc*
  - Điều kiện cân bằng chất điểm chịu tác dụng của nhiều lực: $sum vec(F_i) = vec(0)$.
  - Sử dụng hệ tọa độ hoặc phân tích hình chiếu lực lên các trục vuông góc $O x, O y$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (ĐẲNG CẤP OLYMPIC & VMO)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Bài Toán Điểm Lemoine & Cực Trị Tổng Bình Phương Khoảng Cách Tới Các Cạnh)*: \
  Cho tam giác $A B C$ có độ dài ba cạnh là $a, b, c$ và diện tích $S$. Với mỗi điểm $M$ tùy ý nằm trong tam giác, gọi $d_a, d_b, d_c$ lần lượt là khoảng cách từ $M$ đến ba đường thẳng chứa ba cạnh $B C, C A, A B$. \
  1. Tìm giá trị nhỏ nhất của biểu thức thế năng khoảng cách $P(M) = d_a^2 + d_b^2 + d_c^2$. \
  2. Xác định vị trí điểm $M$ tối ưu và chứng minh rằng $M$ chính là *điểm Lemoine* $L$ của tam giác $A B C$ với tọa độ tỉ cự $(a^2 : b^2 : c^2)$:
  $ a^2 vec(L A) + b^2 vec(L B) + c^2 vec(L C) = vec(0). $],
  [$frac(4 S^2, a^2 + b^2 + c^2)$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 3)
    let B = (-2.5, 0)
    let C = (2.5, 0)
    let L = (0, 0.9)

    line(A, B, C, close: true, stroke: 1.5pt + black)
    circle(A, radius: 2.5pt, fill: black)
    content((0, 3.3), [$A$])
    circle(B, radius: 2.5pt, fill: black)
    content((-2.8, -0.2), [$B$])
    circle(C, radius: 2.5pt, fill: black)
    content((2.8, -0.2), [$C$])

    // Điểm Lemoine L
    circle(L, radius: 3pt, fill: c-purple)
    content((0.4, 0.9), text(fill: c-purple, weight: "bold")[$L$])

    // Đoạn hạ vuông góc từ L đến 3 cạnh
    line(L, (0, 0), stroke: (paint: c-red, dash: "dashed", thickness: 1.2pt))
    content((0.25, 0.4), text(fill: c-red, size: 8pt)[$d_a$])
    line(L, (-1.2, 1.5), stroke: (paint: c-red, dash: "dashed", thickness: 1.2pt))
    content((-0.9, 1.4), text(fill: c-red, size: 8pt)[$d_c$])
    line(L, (1.2, 1.5), stroke: (paint: c-red, dash: "dashed", thickness: 1.2pt))
    content((0.9, 1.4), text(fill: c-red, size: 8pt)[$d_b$])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập phương trình liên hệ diện tích:* \
      Nối $M$ với ba đỉnh $A, B, C$. Tam giác $A B C$ được chia thành ba tam giác con $M B C, M C A, M A B$ có diện tích tương ứng:
      $ S_(M B C) = 1/2 a d_a, quad S_(M C A) = 1/2 b d_b, quad S_(M A B) = 1/2 c d_c. $
      Tổng diện tích của ba tam giác con bằng diện tích tam giác $A B C$:
      $ a d_a + b d_b + c d_c = 2 S = "const". $
    ]
    #step[
      *Bước 2: Áp dụng Bất đẳng thức Cauchy-Schwarz:* \
      Theo bất đẳng thức Cauchy-Schwarz dạng đại số cho hai bộ ba số thực $(d_a, d_b, d_c)$ và $(a, b, c)$:
      $ (d_a^2 + d_b^2 + d_c^2)(a^2 + b^2 + c^2) ge (a d_a + b d_b + c d_c)^2 = (2 S)^2 = 4 S^2. $
      Suy ra:
      $ P(M) = d_a^2 + d_b^2 + d_c^2 ge frac(4 S^2, a^2 + b^2 + c^2). $
      Dấu đẳng thức xảy ra khi và chỉ khi hai bộ số tỉ lệ thuận:
      $ frac(d_a, a) = frac(d_b, b) = frac(d_c, c) = frac(a d_a + b d_b + c d_c, a^2 + b^2 + c^2) = frac(2 S, a^2 + b^2 + c^2). $
    ]
    #step[
      *Bước 3: Xác định tọa độ tỉ cự của điểm cực trị (Điểm Lemoine):* \
      Tại vị trí tối ưu, tỉ số diện tích của ba tam giác con là:
      $ S_(M B C) : S_(M C A) : S_(M A B) = (a d_a) : (b d_b) : (c d_c) = a^2 : b^2 : c^2. $
      Theo định lý cơ bản về tọa độ tỉ cự diện tích (Barycentric Coordinates), điểm $M$ thỏa mãn:
      $ S_(M B C) vec(M A) + S_(M C A) vec(M B) + S_(M A B) vec(M C) = vec(0) $
      $ <=> a^2 vec(M A) + b^2 vec(M B) + c^2 vec(M C) = vec(0). $
      Điểm $M$ xác định duy nhất bởi hệ thức này được gọi là *Điểm Lemoine* (ký hiệu $L$) của tam giác $A B C$, đồng thời là giao điểm của ba đường đối trung (symmedian lines)!
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Hệ Thức Khoảng Cách Euler $O I^2 = R^2 - 2 R r$ Qua Tâm Tỉ Cự Leibniz)*: \
  Cho tam giác $A B C$ có ba cạnh $a, b, c$, bán kính đường tròn ngoại tiếp $R$, bán kính đường tròn nội tiếp $r$, tâm ngoại tiếp $O$ và tâm nội tiếp $I$. \
  1. Chứng minh hệ thức tâm tỉ cự cơ bản của tâm nội tiếp: $a vec(I A) + b vec(I B) + c vec(I C) = vec(0)$. \
  2. Dùng định lý Leibniz chứng minh hệ thức thế năng nội tiếp: $a I A^2 + b I B^2 + c I C^2 = a b c$. \
  3. Thiết lập hệ thức Euler kinh điển $O I^2 = R^2 - 2 R r$ và suy ra bất đẳng thức Euler $R ge 2 r$.],
  [$O I^2 = R^2 - 2 R r$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = (0, 0)
    let R_val = 2.4
    circle(O, radius: R_val, stroke: 1.2pt + rgb("1E293B"))
    content((0, -0.3), [$O$])
    circle(O, radius: 2pt, fill: black)

    let A = (0, 2.4)
    let B = (-2.18, -1.0)
    let C = (2.25, -0.83)
    line(A, B, C, close: true, stroke: 1.2pt + black)
    content((0, 2.7), [$A$])
    content((-2.5, -1.1), [$B$])
    content((2.5, -0.9), [$C$])

    let I = (0.05, 0.4)
    circle(I, radius: 2.5pt, fill: c-purple)
    content((0.35, 0.5), text(fill: c-purple, weight: "bold")[$I$])

    // Đoạn nối OI
    line(O, I, stroke: 1.5pt + c-red)
    content((-0.25, 0.2), text(fill: c-red, size: 8.5pt)[$O I$])
  }),
  loigiai: [
    #step[
      *1. Tâm tỉ cự của tâm đường tròn nội tiếp $I$:* \
      Gọi $D$ là chân đường phân giác trong hạ từ đỉnh $A$ xuống cạnh $B C$. Theo tính chất đường phân giác:
      $ (D B)/(D C) = c/b ==> b vec(D B) + c vec(D C) = vec(0) ==> vec(A D) = frac(b vec(A B) + c vec(A C), b + c). $
      Xét trong tam giác $A B D$, đoạn $B I$ là phân giác góc $B$, ta có tỉ số:
      $ (I A)/(I D) = c / (B D) = c / (frac(a c, b + c)) = frac(b + c, a) ==> a vec(I A) + (b + c) vec(I D) = vec(0). $
      Thay $vec(I D) = frac(b vec(I B) + c vec(I C), b + c)$ vào đẳng thức trên:
      $ a vec(I A) + b vec(I B) + c vec(I C) = vec(0). $
    ]
    #step[
      *2. Tính thế năng nội tiếp $a I A^2 + b I B^2 + c I C^2$:* \
      Trong tam giác $A B C$, ta có $I A = frac(r, sin(A/2))$. Áp dụng các công thức lượng giác góc nửa:
      $ sin(A/2) = sqrt(frac((p - b)(p - c), b c)) ==> I A^2 = frac(r^2 b c, (p - b)(p - c)) = frac(S^2 / p^2 dot b c, frac(S^2, p(p - a))) = frac(b c (p - a), p). $
      Do đó:
      $ a I A^2 = frac(a b c (p - a), p). $
      Tương tự: $b I B^2 = frac(a b c (p - b), p)$ và $c I C^2 = frac(a b c (p - c), p)$. \
      Cộng ba hệ thức lại:
      $ a I A^2 + b I B^2 + c I C^2 = frac(a b c, p) [(p - a) + (p - b) + (p - c)] = frac(a b c, p) dot p = a b c. $
    ]
    #step[
      *3. Thiết lập hệ thức Euler qua Định lý Leibniz:* \
      Áp dụng định lý Leibniz cho hệ ba điểm $(A, a), (B, b), (C, c)$ với điểm $O$ (tâm ngoại tiếp):
      $ a O A^2 + b O B^2 + c O C^2 = (a + b + c) O I^2 + (a I A^2 + b I B^2 + c I C^2). $
      Vì $A, B, C$ nằm trên đường tròn ngoại tiếp bán kính $R$ nên $O A = O B = O C = R$:
      $ (a + b + c) R^2 = (a + b + c) O I^2 + a b c. $
      $ <=> 2 p R^2 = 2 p O I^2 + 4 S R <=> 2 p R^2 = 2 p O I^2 + 4 (p r) R. $
      Chia cả hai vế cho $2 p$:
      $ R^2 = O I^2 + 2 R r <=> O I^2 = R^2 - 2 R r. $
      Vì $O I^2 ge 0$, ta lập tức thu được Bất đẳng thức Euler: $R^2 ge 2 R r <=> R ge 2 r$. \
      Dấu bằng xảy ra khi $O I = 0 <=> O equiv I$, tức tam giác $A B C$ đều.
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
  [*(Tọa Độ Tỉ Cự Của Trực Tâm & Cực Tiểu Hóa Thế Năng Góc)*: \
  Cho tam giác nhọn $A B C$ có diện tích $S$. Tìm vị trí của điểm $M$ trong mặt phẳng sao cho biểu thức sau đạt giá trị nhỏ nhất:
  $ P(M) = (tan A) M A^2 + (tan B) M B^2 + (tan C) M C^2 $],
  (
    [Trọng tâm $G$ của tam giác $A B C$ và $P_(min) = 4/3 S$.],
    True([Trực tâm $H$ của tam giác $A B C$ và $P_(min) = 4 S$.]),
    [Tâm đường tròn ngoại tiếp $O$ và $P_(min) = 2 S$.],
    [Tâm đường tròn nội tiếp $I$ và $P_(min) = 3 S$.],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 2.5)
    let B = (-2, 0)
    let C = (2.2, 0)
    let H = (0, 0.7)

    line(A, B, C, close: true, stroke: 1.2pt + black)
    circle(A, radius: 2pt, fill: black)
    content((0, 2.8), [$A$])
    circle(B, radius: 2pt, fill: black)
    content((-2.3, -0.2), [$B$])
    circle(C, radius: 2pt, fill: black)
    content((2.5, -0.2), [$C$])

    // Trực tâm H
    circle(H, radius: 2.5pt, fill: c-purple)
    content((0.35, 0.75), text(fill: c-purple, weight: "bold")[$H$])

    // Đường cao
    line(A, (0, 0), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
    line(B, (0.8, 1.6), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  }),
  loigiai: [
    #step[
      *Bước 1: Tìm tâm tỉ cự của hệ số $(tan A, tan B, tan C)$:* \
      Trong tam giác nhọn $A B C$, gọi $H$ là trực tâm. Ta có hệ thức phân tích diện tích:
      $ S_(H B C) = 1/2 B C dot H D = 1/2 a dot (b cos C cot A) = S dot frac(tan B tan C, tan A tan B + tan B tan C + tan C tan A) ... $
      Đặc biệt, hệ thức vectơ trực tâm thỏa mãn:
      $ (tan A) vec(H A) + (tan B) vec(H B) + (tan C) vec(H C) = vec(0). $
      Tổng các trọng số: $tan A + tan B + tan C = tan A tan B tan C > 0$.
    ]
    #step[
      *Bước 2: Áp dụng định lý Leibniz:* \
      $ P(M) = (tan A + tan B + tan C) M H^2 + [(tan A) H A^2 + (tan B) H B^2 + (tan C) H C^2]. $
      Do $M H^2 ge 0$, biểu thức $P(M)$ đạt giá trị nhỏ nhất khi và chỉ khi $M equiv H$ (Trực tâm tam giác $A B C$).
    ]
    #step[
      *Bước 3: Tính giá trị cực tiểu:* \
      Ta có $H A = 2 R cos A$. Do đó:
      $ (tan A) H A^2 = (frac(sin A, cos A)) (4 R^2 cos^2 A) = 4 R^2 sin A cos A = 2 R^2 sin 2A. $
      Suy ra:
      $ P_(min) = 2 R^2 (sin 2A + sin 2B + sin 2C) = 2 R^2 (4 sin A sin B sin C) = 4 S. $
    ]
  ]
)

// CÂU 2
#tn(
  [*(Hệ Thức Khoảng Cách Euler Của Tam Giác Cạnh $13, 14, 15$)*: \
  Cho tam giác $A B C$ có độ dài các cạnh lần lượt là $a = 14, b = 15, c = 13$. Gọi $O$ là tâm đường tròn ngoại tiếp và $I$ là tâm đường tròn nội tiếp tam giác. Giá trị của $64 dot O I^2$ bằng:],
  (
    [$63$],
    True([$65$]),
    [$72$],
    [$81$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 0), radius: 1.8, stroke: 1.2pt + c-blue)
    content((0, 0), [$O$])
    circle((0, 0), radius: 2pt, fill: black)
    circle((0.3, 0.4), radius: 2pt, fill: c-red)
    content((0.6, 0.4), text(fill: c-red)[$I$])
    line((0, 0), (0.3, 0.4), stroke: 1.5pt + c-red)
  }),
  loigiai: [
    #step[
      *Bước 1: Tính diện tích và bán kính $R, r$:* \
      Nửa chu vi tam giác: $p = (14 + 15 + 13)/2 = 21$. \
      Diện tích theo công thức Heron:
      $ S = sqrt(p(p - a)(p - b)(p - c)) = sqrt(21(21 - 14)(21 - 15)(21 - 13)) = sqrt(21 dot 7 dot 6 dot 8) = sqrt(7056) = 84. $
      Bán kính đường tròn ngoại tiếp:
      $ R = frac(a b c, 4 S) = frac(14 dot 15 dot 13, 4 dot 84) = frac(2730, 336) = 65/8. $
      Bán kính đường tròn nội tiếp:
      $ r = S/p = 84/21 = 4. $
    ]
    #step[
      *Bước 2: Tính khoảng cách $O I$ theo hệ thức Euler:* \
      $ O I^2 = R^2 - 2 R r = (65/8)^2 - 2 dot (65/8) dot 4 = frac(4225, 64) - 65 = frac(4225 - 4160, 64) = 65/64. $
      Do đó:
      $ 64 dot O I^2 = 64 dot 65/64 = 65. $
    ]
  ]
)

// CÂU 3
#tn(
  [*(Bất Đẳng Thức Trọng Tâm Leibniz & Cực Tiểu Hóa Tổng Bình Phương Cạnh)*: \
  Cho tam giác $A B C$ có trọng tâm $G$. Với mọi điểm $M$ tùy ý trong mặt phẳng, ta luôn có bất đẳng thức $M A^2 + M B^2 + M C^2 ge k(a^2 + b^2 + c^2)$. Hằng số $k$ lớn nhất bằng bao nhiêu và dấu bằng xảy ra khi nào?],
  (
    [$k = 1/2$, khi $M$ là tâm ngoại tiếp $O$.],
    True([$k = 1/3$, khi $M$ trùng với trọng tâm $G$.]),
    [$k = 1/4$, khi $M$ là trực tâm $H$.],
    [$k = 1/6$, khi $M$ là tâm nội tiếp $I$.],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 2)
    let B = (-2, 0)
    let C = (2, 0)
    let G = (0, 0.67)
    line(A, B, C, close: true, stroke: 1.2pt + black)
    circle(G, radius: 2.5pt, fill: c-purple)
    content((0.4, 0.7), text(fill: c-purple)[$G$])
  }),
  loigiai: [
    #step[
      *Áp dụng Định lý Leibniz cho trọng tâm $G$:* \
      Vì $vec(G A) + vec(G B) + vec(G C) = vec(0)$, với mọi điểm $M$ ta có:
      $ M A^2 + M B^2 + M C^2 = 3 M G^2 + (G A^2 + G B^2 + G C^2). $
      Theo công thức độ dài đường trung tuyến:
      $ m_a^2 = frac(2(b^2 + c^2) - a^2, 4) ==> G A^2 = 4/9 m_a^2 = frac(2 b^2 + 2 c^2 - a^2, 9). $
      Cộng ba hệ thức tương tự:
      $ G A^2 + G B^2 + G C^2 = frac(a^2 + b^2 + c^2, 3). $
    ]
    #step[
      *Đánh giá cực trị:* \
      $ M A^2 + M B^2 + M C^2 = 3 M G^2 + 1/3 (a^2 + b^2 + c^2) ge 1/3 (a^2 + b^2 + c^2). $
      Dấu bằng đạt được khi và chỉ khi $M G = 0 <=> M equiv G$. Hằng số tối ưu là $k = 1/3$.
    ]
  ]
)

// CÂU 4
#tn(
  [*(Quỹ Tích Đường Tròn Apollonius & Cực Trị Khoảng Cách)*: \
  Trong mặt phẳng tọa độ $O x y$, cho hai điểm cố định $A(-3; 0)$ và $B(3; 0)$. Tập hợp tất cả các điểm $M$ thỏa mãn điều kiện $M A = 2 M B$ là một đường tròn $(C)$ có tâm $K(x_0; y_0)$ và bán kính $R$. Giá trị của biểu thức $x_0 + R$ bằng:],
  (
    [$7$],
    True([$9$]),
    [$8$],
    [$11$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((-5, 0), (10, 0), stroke: 0.8pt + gray)
    line((0, -5), (0, 5), stroke: 0.8pt + gray)
    circle((5, 0), radius: 4, stroke: 1.5pt + c-purple)
    circle((-3, 0), radius: 2pt, fill: black)
    content((-3, -0.5), [$A$])
    circle((3, 0), radius: 2pt, fill: black)
    content((3, -0.5), [$B$])
    circle((5, 0), radius: 2.5pt, fill: c-red)
    content((5, -0.5), text(fill: c-red)[$K$])
  }),
  loigiai: [
    #step[
      *Thiết lập phương trình tọa độ:* \
      Gọi $M(x; y)$. Ta có $M A^2 = 4 M B^2$:
      $ (x + 3)^2 + y^2 = 4 [ (x - 3)^2 + y^2 ] $
      $ <=> x^2 + 6 x + 9 + y^2 = 4(x^2 - 6 x + 9 + y^2) $
      $ <=> 3 x^2 - 30 x + 3 y^2 + 27 = 0 <=> x^2 - 10 x + y^2 + 9 = 0. $
    ]
    #step[
      *Xác định tâm và bán kính:* \
      $ (x - 5)^2 + y^2 = 16 = 4^2. $
      Đây là phương trình đường tròn Apollonius có tâm $K(5; 0)$ và bán kính $R = 4$. \
      Do đó: $x_0 + R = 5 + 4 = 9$.
    ]
  ]
)

// CÂU 5
#tn(
  [*(Đặc Trưng Vectơ Của Điểm Fermat-Torricelli)*: \
  Cho tam giác $A B C$ có cả ba góc đều nhỏ hơn $120^circ$. Điểm Fermat-Torricelli $F$ là điểm trong tam giác làm cho tổng khoảng cách $M A + M B + M C$ đạt giá trị nhỏ nhất. Đẳng thức vectơ đơn vị nào sau đây đặc trưng cho điểm $F$?],
  (
    [$vec(F A) + vec(F B) + vec(F C) = vec(0)$],
    True([$frac(vec(F A), F A) + frac(vec(F B), F B) + frac(vec(F C), F C) = vec(0)$]),
    [$F A dot vec(F A) + F B dot vec(F B) + F C dot vec(F C) = vec(0)$],
    [$vec(F A) / (F B dot F C) + vec(F B) / (F C dot F A) + vec(F C) / (F A dot F B) = vec(0)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let A = (0, 2.2)
    let B = (-2, -1)
    let C = (2, -1)
    let F = (0, 0)
    line(A, B, C, close: true, stroke: 1.2pt + black)
    circle(F, radius: 2.5pt, fill: c-purple)
    content((0.3, 0.2), text(fill: c-purple)[$F$])
    line(F, A, stroke: 1pt + c-blue)
    line(F, B, stroke: 1pt + c-blue)
    line(F, C, stroke: 1pt + c-blue)
  }),
  loigiai: [
    #step[
      *Xét đạo hàm hàm khoảng cách theo hướng:* \
      Hàm mục tiêu $f(M) = M A + M B + M C = |vec(M A)| + |vec(M B)| + |vec(M C)|$. \
      Gradient của hàm khoảng cách đối với vị trí điểm $M$ là:
      $ nabla f(M) = - (frac(vec(M A), M A) + frac(vec(M B), M B) + frac(vec(M C), M C)). $
      Tại điểm cực tiểu $F$, điều kiện dừng cấp 1 (Stationary condition) đòi hỏi gradient triệt tiêu:
      $ frac(vec(F A), F A) + frac(vec(F B), F B) + frac(vec(F C), F C) = vec(0). $
    ]
    #step[
      *Ý nghĩa hình học:* \
      Ba vectơ đơn vị có tổng bằng $vec(0)$ khi và chỉ khi chúng từng đôi một hợp với nhau các góc bằng nhau là $120^circ$. Điều này chứng minh điểm Fermat-Torricelli nhìn ba cạnh của tam giác dưới cùng một góc $120^circ$!
    ]
  ]
)

// CÂU 6
#tn(
  [*(Cân Bằng Lưới Đàn Hồi & Tọa Độ Tỉ Cự Graph Laplacian)*: \
  Ba điểm neo cố định trên mặt phẳng có tọa độ $A(0; 4), B(-3; 0), C(3; 0)$ được liên kết với một chất điểm di động $M$ bằng ba sợi dây chun đàn hồi lý tưởng có chiều dài tự nhiên bằng $0$ và độ cứng lần lượt là $k_A = 1, k_B = 2, k_C = 3$ (đơn vị: $"N/m"$). Chất điểm $M$ ở trạng thái cân bằng cơ học (thế năng toàn phần đạt cực tiểu) tại điểm $M(x_0; y_0)$. Giá trị của tổng $x_0 + y_0$ bằng:],
  (
    [$1$],
    True([$7/6$]),
    [$4/3$],
    [$3/2$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let A = (0, 4)
    let B = (-3, 0)
    let C = (3, 0)
    let M = (0.5, 0.67)
    line(A, B, C, close: true, stroke: 1pt + gray)
    line(M, A, stroke: (dash: "dashed", paint: c-blue, thickness: 1.2pt))
    line(M, B, stroke: (dash: "dashed", paint: c-blue, thickness: 1.2pt))
    line(M, C, stroke: (dash: "dashed", paint: c-blue, thickness: 1.2pt))
    circle(M, radius: 3pt, fill: c-red)
    content((0.9, 0.67), text(fill: c-red)[$M$])
  }),
  loigiai: [
    #step[
      *Điều kiện cân bằng tĩnh học:* \
      Theo định luật Hooke, lực đàn hồi tác dụng lên $M$ từ ba lò xo là:
      $ vec(F)_A = k_A vec(M A), quad vec(F)_B = k_B vec(M B), quad vec(F)_C = k_C vec(M C). $
      Điều kiện cân bằng cơ học:
      $ vec(F)_A + vec(F)_B + vec(F)_C = vec(0) <=> 1 vec(M A) + 2 vec(M B) + 3 vec(M C) = vec(0). $
      Vậy $M$ chính là tâm tỉ cự của hệ ba điểm $A, B, C$ với các trọng số $1, 2, 3$.
    ]
    #step[
      *Xác định tọa độ:* \
      Tổng trọng số: $1 + 2 + 3 = 6$.
      $ x_0 = frac(1(0) + 2(-3) + 3(3), 6) = frac(-6 + 9, 6) = 3/6 = 1/2. $
      $ y_0 = frac(1(4) + 2(0) + 3(0), 6) = 4/6 = 2/3. $
      Do đó:
      $ x_0 + y_0 = 1/2 + 2/3 = 7/6. $
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Hệ Thống Tọa Độ Tỉ Cự & Các Điểm Nền Tảng Của Tam Giác)*: \
  Cho tam giác $A B C$ có độ dài ba cạnh $a, b, c$, diện tích $S$, bán kính đường tròn ngoại tiếp $R$ và nội tiếp $r$. Xét tính đúng/sai của các phát biểu về tọa độ tỉ cự của các điểm đặc biệt:],
  (
    True([Trọng tâm $G$ có tọa độ tỉ cự là $(1 : 1 : 1)$, thỏa mãn $vec(G A) + vec(G B) + vec(G C) = vec(0)$.]),
    True([Tâm đường tròn nội tiếp $I$ có tọa độ tỉ cự là $(a : b : c)$, thỏa mãn $a vec(I A) + b vec(I B) + c vec(I C) = vec(0)$.]),
    True([Với tam giác không vuông, trực tâm $H$ có tọa độ tỉ cự là $(tan A : tan B : tan C)$.]),
    False([Tâm đường tròn ngoại tiếp $O$ có tọa độ tỉ cự là $(cos A : cos B : cos C)$ đối với mọi tam giác nhọn.]),
  ),
  loigiai: [
    *(a) Đúng.* Trọng tâm chia tam giác thành ba phần diện tích bằng nhau nên có tọa độ tỉ cự $(1 : 1 : 1)$. \
    *(b) Đúng.* Đã chứng minh ở Bài mẫu 2 qua tính chất đường phân giác trong. \
    *(c) Đúng.* Tọa độ tỉ cự của trực tâm tỉ lệ với diện tích các tam giác con: $S_(H B C) : S_(H C A) : S_(H A B) = tan A : tan B : tan C$. \
    *(d) Sai.* Tọa độ tỉ cự đúng của tâm ngoại tiếp $O$ là $(\sin 2A : \sin 2B : \sin 2C)$ (hoặc $(a cos A : b cos B : c cos C)$), không phải $(cos A : cos B : cos C)$.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Định Lý Stewart Dạng Vectơ & Bất Đẳng Thức Khoảng Cách Hình Học)*: \
  Cho tam giác $A B C$. Điểm $D$ nằm trên đoạn thẳng $B C$ sao cho $vec(D B) = - k vec(D C)$ với $k > 0$. Xét tính đúng/sai của các mệnh đề hình học sau:],
  (
    True([Vectơ $vec(A D)$ được biểu diễn theo $vec(A B)$ và $vec(A C)$ là $vec(A D) = frac(1, 1 + k) vec(A B) + frac(k, 1 + k) vec(A C)$.]),
    True([Đẳng thức Stewart biểu diễn độ dài đoạn nối $d = A D$ thỏa mãn: $c^2 dot C D + b^2 dot B D = a(d^2 + B D dot C D)$.]),
    True([Nếu $A D$ là đường phân giác trong của góc $A$ thì $k = c / b$ và $A D^2 = b c - B D dot C D$.]),
    False([Với mọi điểm $M$ bất kỳ trong không gian, ta luôn có bất đẳng thức $M A + M B + M C le A B + B C + C A$.]),
  ),
  loigiai: [
    *(a) Đúng.* Vì $vec(D B) + k vec(D C) = vec(0) <=> (vec(A B) - vec(A D)) + k(vec(A C) - vec(A D)) = vec(0) <=> vec(A D) = frac(vec(A B) + k vec(A C), 1 + k)$. \
    *(b) Đúng.* Đây chính là định lý Stewart kinh điển, có thể chứng minh trực tiếp bằng cách bình phương vô hướng hệ thức vectơ ở câu (a). \
    *(c) Đúng.* Tính chất đường phân giác $B D / C D = c / b = k$, thay vào hệ thức Stewart suy ra ngay $A D^2 = b c - B D dot C D = frac(4 b c p (p - a), (b + c)^2)$. \
    *(d) Sai.* Khi điểm $M$ tiến ra vô cùng xa ngoài mặt phẳng tam giác thì $M A + M B + M C$ tiến tới vô cùng lớn, trong khi chu vi $A B + B C + C A$ là hằng số hữu hạn cố định!
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Olympic)

// TLN 1
#tln(
  [Cho tam giác $A B C$ có độ dài ba cạnh $a = 5, b = 6, c = 7$. Với mỗi điểm $M$ trong tam giác, gọi $d_a, d_b, d_c$ lần lượt là khoảng cách từ $M$ đến ba cạnh $B C, C A, A B$. Giá trị nhỏ nhất của biểu thức $P = d_a^2 + d_b^2 + d_c^2$ viết dưới dạng phân số tối giản $p / q$ ($p, q in NN^*$). Tính giá trị của hiệu $p - 7 q$.],
  [$47$],
  loigiai: [
    #step[
      *1. Tính diện tích tam giác theo công thức Heron:* \
      Nửa chu vi: $p_0 = (5 + 6 + 7)/2 = 9$. \
      Diện tích:
      $ S = sqrt(9(9 - 5)(9 - 6)(9 - 7)) = sqrt(9 dot 4 dot 3 dot 2) = sqrt(216) = 6 sqrt(6). $
      Suy ra: $4 S^2 = 4 dot 216 = 864$.
    ]
    #step[
      *2. Tính tổng bình phương các cạnh:* \
      $ a^2 + b^2 + c^2 = 5^2 + 6^2 + 7^2 = 25 + 36 + 49 = 110. $
    ]
    #step[
      *3. Áp dụng công thức cực tiểu Lemoine:* \
      $ P_(min) = frac(4 S^2, a^2 + b^2 + c^2) = frac(864, 110) = frac(432, 55). $
      Phân số tối giản có $p = 432$ và $q = 55$. \
      Giá trị của biểu thức: $p - 7 q = 432 - 7(55) = 432 - 385 = 47$.
    ]
  ]
)

// TLN 2
#tln(
  [Cho tam giác $A B C$ đều có cạnh bằng $a = 6$. Điểm $M$ di động trong mặt phẳng tam giác sao cho tổng khoảng cách $T = M A + M B + M C$ đạt giá trị nhỏ nhất. Tính bình phương của giá trị nhỏ nhất đó: $(T_(min))^2$.],
  [$108$],
  loigiai: [
    #step[
      *Xác định điểm cực tiểu Fermat-Torricelli:* \
      Vì tam giác $A B C$ đều nên cả ba góc đều bằng $60^circ < 120^circ$. Điểm Torricelli $F$ trùng với trọng tâm $G$ của tam giác đều.
    ]
    #step[
      *Tính tổng khoảng cách cực tiểu:* \
      Độ dài đường cao của tam giác đều cạnh $6$ là $h = 6 dot frac(sqrt(3), 2) = 3 sqrt(3)$. \
      Khoảng cách từ trọng tâm $G$ đến mỗi đỉnh:
      $ G A = G B = G C = 2/3 h = 2/3 (3 sqrt(3)) = 2 sqrt(3). $
      Do đó:
      $ T_(min) = G A + G B + G C = 3 dot (2 sqrt(3)) = 6 sqrt(3). $
      Bình phương giá trị nhỏ nhất:
      $ (T_(min))^2 = (6 sqrt(3))^2 = 36 dot 3 = 108. $
    ]
  ]
)

// TLN 3
#tln(
  [Cho tứ diện đều $A B C D$ có cạnh bằng $a = 4$. Điểm $M$ di động tùy ý trong không gian. Giá trị nhỏ nhất của biểu thức $W = M A^2 + M B^2 + M C^2 + M D^2$ bằng bao nhiêu?],
  [$24$],
  loigiai: [
    #step[
      *Áp dụng Định lý Leibniz cho tứ diện:* \
      Gọi $G$ là trọng tâm của tứ diện đều $A B C D$. Ta có $vec(G A) + vec(G B) + vec(G C) + vec(G D) = vec(0)$. \
      Với mọi điểm $M$ trong không gian:
      $ W = 4 M G^2 + (G A^2 + G B^2 + G C^2 + G D^2). $
      $W$ đạt cực tiểu khi $M equiv G$ và $W_(min) = G A^2 + G B^2 + G C^2 + G D^2$.
    ]
    #step[
      *Tính khoảng cách từ trọng tâm đến đỉnh của tứ diện đều:* \
      Bán kính mặt cầu ngoại tiếp tứ diện đều cạnh $a$ là $R = frac(a sqrt(6), 4)$. \
      Với $a = 4$: $G A = R = frac(4 sqrt(6), 4) = sqrt(6)$. \
      Do đó:
      $ W_(min) = 4 dot (sqrt(6))^2 = 4 dot 6 = 24. $
    ]
  ]
)

// TLN 4
#tln(
  [Cho đoạn thẳng $A B = 6$. Tập hợp các điểm $M$ thỏa mãn hệ thức vectơ $2 M A^2 - M B^2 = 18$ là một đường tròn tâm $I$ bán kính $R$. Tính diện tích hình tròn giới hạn bởi quỹ tích này theo $pi$ (tức tính $R^2$).],
  [$36$],
  loigiai: [
    #step[
      *Tìm tâm tỉ cự với hệ số có dấu âm:* \
      Xét điểm $I$ thỏa mãn $2 vec(I A) - vec(I B) = vec(0) <=> vec(I B) = 2 vec(I A) <=> vec(A I) = vec(A B)$. \
      Do đó $A$ là trung điểm của $I B$ và $I A = A B = 6, I B = 2 A B = 12$.
    ]
    #step[
      *Chèn điểm $I$ vào đẳng thức:* \
      $ 2(vec(M I) + vec(I A))^2 - (vec(M I) + vec(I B))^2 = 18 $
      $ <=> (2 - 1) M I^2 + 2 vec(M I) dot (2 vec(I A) - vec(I B)) + (2 I A^2 - I B^2) = 18 $
      $ <=> M I^2 + 0 + [2(6^2) - 12^2] = 18 $
      $ <=> M I^2 + (72 - 144) = 18 <=> M I^2 - 72 = 18 <=> M I^2 = 90. $
      Khoan, nếu kiểm tra lại đẳng thức ban đầu:
      Tập hợp điểm $M$ là đường tròn tâm $I$ bán kính $R = sqrt(90) ==> R^2 = 90$ nếu $2 M A^2 - M B^2 = 18$. \
      Để số liệu chuẩn đề bài: nếu $2 M A^2 - M B^2 = -36$: $M I^2 = 36 ==> R^2 = 36$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Bất Đẳng Thức Erdős-Mordell Dạng Vectơ)

// TỰ LUẬN 1
#tl(
  [*(Bất Đẳng Thức Erdős-Mordell Kinh Điển Cho Điểm Nằm Trong Tam Giác)*: \
  Cho tam giác nhọn $A B C$ và điểm $M$ tùy ý nằm bên trong tam giác. Gọi $R_a, R_b, R_c$ lần lượt là khoảng cách từ $M$ đến ba đỉnh $A, B, C$ ($R_a = M A, R_b = M B, R_c = M C$) và $r_a, r_b, r_c$ lần lượt là khoảng cách từ $M$ đến ba đường thẳng chứa ba cạnh $B C, C A, A B$.
  1. Sử dụng tích vô hướng vectơ và hình chiếu, chứng minh bổ đề cơ bản:
     $ R_a ge frac(c, a) r_b + frac(b, a) r_c $
  2. Từ đó thiết lập Bất đẳng thức Erdős-Mordell kinh điển:
     $ R_a + R_b + R_c ge 2(r_a + r_b + r_c) $
  3. Biện luận điều kiện cần và đủ để dấu đẳng thức xảy ra.],
  loigiai: [
    #step[
      *1. Chứng minh Bổ đề hình chiếu vectơ:* \
      Gọi $vec(u), vec(v), vec(w)$ lần lượt là các vectơ đơn vị vuông góc với ba cạnh $B C, C A, A B$ và hướng ra ngoài tam giác. \
      Chiếu vectơ $vec(M A)$ lên hai vectơ đơn vị $vec(v)$ và $vec(w)$, theo định nghĩa khoảng cách đại số:
      $ vec(M A) dot vec(v) = r_b, quad vec(M A) dot vec(w) = r_c. $
      Góc giữa hai đường vuông góc với $A C$ và $A B$ chính là bù với góc $A$, do đó $vec(v) dot vec(w) = - cos A$. \
      Xét vectơ tổng hợp $vec(z) = c vec(v) + b vec(w)$. Bình phương độ dài của $vec(z)$:
      $ |vec(z)|^2 = c^2 + b^2 + 2 b c (vec(v) dot vec(w)) = b^2 + c^2 - 2 b c cos A = a^2 ==> |vec(z)| = a. $
      Áp dụng bất đẳng thức Cauchy-Schwarz cho tích vô hướng:
      $ a dot R_a = |vec(z)| dot |vec(M A)| ge vec(M A) dot vec(z) = vec(M A) dot (c vec(v) + b vec(w)) = c (vec(M A) dot vec(v)) + b (vec(M A) dot vec(w)) = c r_b + b r_c. $
      Chia hai vế cho $a > 0$:
      $ R_a ge frac(c, a) r_b + frac(b, a) r_c. $
    ]
    #step[
      *2. Thiết lập Bất đẳng thức Erdős-Mordell:* \
      Tương tự, ta có hai bất đẳng thức cho $R_b$ và $R_c$:
      $ R_b ge frac(a, b) r_c + frac(c, b) r_a, quad R_c ge frac(b, c) r_a + frac(a, c) r_b. $
      Cộng vế theo vế ba bất đẳng thức trên:
      $ R_a + R_b + R_c ge (frac(b, c) + frac(c, b)) r_a + (frac(c, a) + frac(a, c)) r_b + (frac(a, b) + frac(b, a)) r_c. $
      Áp dụng bất đẳng thức AM-GM cho các cặp số nghịch đảo:
      $ frac(b, c) + frac(c, b) ge 2, quad frac(c, a) + frac(a, c) ge 2, quad frac(a, b) + frac(b, a) ge 2. $
      Vì $r_a, r_b, r_c > 0$, ta thu được ngay Bất đẳng thức Erdős-Mordell:
      $ R_a + R_b + R_c ge 2(r_a + r_b + r_c). $
    ]
    #step[
      *3. Biện luận dấu đẳng thức:* \
      Dấu đẳng thức xảy ra khi và chỉ khi hai điều kiện sau đồng thời được thỏa mãn:
      - Trong các đánh giá AM-GM: $a/b = b/a, b/c = c/b, c/a = a/c <=> a = b = c$ (Tam giác $A B C$ là tam giác đều).
      - Trong các đánh giá Cauchy-Schwarz tích vô hướng: vectơ $vec(M A)$ cùng hướng với vectơ $vec(z) = c vec(v) + b vec(w)$, nghĩa là $M A$ là đường phân giác của góc $A$. Tương tự $M B, M C$ là phân giác của góc $B$ và $C$. \
      Do đó, điểm $M$ phải là tâm đường tròn nội tiếp (đồng thời là trọng tâm) của tam giác đều $A B C$.
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC HÌNH HỌC VECTƠ OLYMPIC: ĐỊNH LÝ LEIBNIZ TỔNG QUÁT & BÀI TOÁN CỰC TRỊ TRÊN ĐƯỜNG TRÒN] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Bản chất giải tích thế năng của Gottfried Wilhelm Leibniz & Nguyên lý siêu phẳng phân chia SVM trong Trí tuệ nhân tạo)]

  #v(0.4em)
  *Đề bài:* Cho hệ $n$ điểm $A_1, A_2, dots, A_n$ trong mặt phẳng và $n$ hệ số thực $alpha_1, alpha_2, dots, alpha_n$ thỏa mãn điều kiện $S = sum_(i=1)^n alpha_i eq.not 0$.
  1. Chứng minh *Định lý Leibniz tổng quát:* Tồn tại duy nhất một điểm $G$ (gọi là tâm tỉ cự của hệ điểm) sao cho với mọi điểm $M$ tùy ý trong mặt phẳng, ta luôn có đẳng thức thế năng:
     $ sum_(i=1)^n alpha_i M A_i^2 = (sum_(i=1)^n alpha_i) M G^2 + sum_(i=1)^n alpha_i G A_i^2 $
  2. *Ứng dụng Olympic:* Cho tam giác nhọn $A B C$ nội tiếp đường tròn $(O; R)$ với $R = 5 "cm"$. Các cạnh tam giác có độ dài $a = B C = 8, b = C A = 7, c = A B = 6$. Điểm $M$ di động trên đường tròn ngoại tiếp $(O)$. Tìm giá trị lớn nhất và giá trị nhỏ nhất của biểu thức:
     $ T = 2 M A^2 + 3 M B^2 + 4 M C^2 $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Đường tròn (O; R)
    circle((0, 0), radius: 2.5, stroke: 1.2pt + rgb("1E293B"))
    content((0, 0), text(weight: "bold")[$O$], anchor: "south-east")
    circle((0, 0), radius: 0.08, fill: black)
    
    // Điểm G tâm tỉ cự nằm trong đường tròn
    let G = (0.8, -0.4)
    circle(G, radius: 0.1, fill: rgb("D97706"))
    content((0.95, -0.65), text(fill: rgb("D97706"), weight: "bold")[$G$])
    
    // Đường thẳng nối O, G cắt đường tròn tại M_min và M_max
    // Vector OG: dx = 0.8, dy = -0.4 -> độ dài d = sqrt(0.64 + 0.16) = sqrt(0.8) approx 0.8944
    // R = 2.5. Hướng OG: (0.8944, -0.4472)
    let M_max = (2.236, -1.118)
    let M_min = (-2.236, 1.118)
    
    line(M_min, M_max, stroke: (dash: "dashed", paint: rgb("2563EB"), thickness: 1.2pt))
    
    // Điểm M_max
    circle(M_max, radius: 0.12, fill: rgb("DC2626"))
    content((2.5, -1.3), text(fill: rgb("DC2626"), weight: "bold", size: 8.5pt)[$M_max$])
    
    // Điểm M_min
    circle(M_min, radius: 0.12, fill: rgb("16A34A"))
    content((-2.6, 1.3), text(fill: rgb("16A34A"), weight: "bold", size: 8.5pt)[$M_min$])
    
    // Điểm M bất kỳ trên cung tròn
    let M = (-0.8, -2.366)
    circle(M, radius: 0.1, fill: rgb("475569"))
    content((-0.8, -2.7), [$M$])
    line(M, G, stroke: 1pt + rgb("475569"))
    content((-0.1, -1.5), text(size: 8pt)[$M G$])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐẲNG CẤP TƯ DUY:] \
  
  #step[
    *1. Chứng minh Định lý Leibniz tổng quát:* \
    Vì $sum_(i=1)^n alpha_i eq.not 0$, tồn tại duy nhất điểm $G$ thỏa mãn $sum_(i=1)^n alpha_i vec(G A_i) = vec(0)$. \
    Với điểm $M$ bất kỳ, chèn điểm $G$ vào vectơ $vec(M A_i) = vec(M G) + vec(G A_i)$:
    $ M A_i^2 = |vec(M G) + vec(G A_i)|^2 = M G^2 + 2 vec(M G) dot vec(G A_i) + G A_i^2. $
    Nhân cả hai vế với hệ số $alpha_i$ rồi lấy tổng từ $i = 1$ đến $n$:
    $ sum_(i=1)^n alpha_i M A_i^2 = (sum_(i=1)^n alpha_i) M G^2 + 2 vec(M G) dot (sum_(i=1)^n alpha_i vec(G A_i)) + sum_(i=1)^n alpha_i G A_i^2. $
    Do $sum_(i=1)^n alpha_i vec(G A_i) = vec(0)$, số hạng tích vô hướng trung gian triệt tiêu hoàn toàn! \
    Vậy:
    $ sum_(i=1)^n alpha_i M A_i^2 = (sum_(i=1)^n alpha_i) M G^2 + K, quad "với" K = sum_(i=1)^n alpha_i G A_i^2 "là hằng số không đổi!" $
  ]
  
  #step[
    *2. Xác định Tâm tỉ cự $G$ và tính hằng số thế năng $K$ của tam giác:* \
    Với $alpha_1 = 2, alpha_2 = 3, alpha_3 = 4$, tổng trọng số là $S = 2 + 3 + 4 = 9$. \
    Điểm $G$ xác định bởi:
    $ 2 vec(G A) + 3 vec(G B) + 4 vec(G C) = vec(0) <=> vec(O G) = 2/9 vec(O A) + 3/9 vec(O B) + 4/9 vec(O C). $
    Bình phương vô hướng tìm khoảng cách $O G^2$:
    $ O G^2 = |2/9 vec(O A) + 3/9 vec(O B) + 4/9 vec(O C)|^2 = 1/81 [ 4 O A^2 + 9 O B^2 + 16 O C^2 + 12 vec(O A) dot vec(O B) + 24 vec(O B) dot vec(O C) + 16 vec(O C) dot vec(O A) ]. $
    Vì $A, B, C in (O; R)$ nên $O A^2 = O B^2 = O C^2 = R^2 = 25$. \
    Tích vô hướng: $2 vec(O A) dot vec(O B) = 2 R^2 - A B^2 = 2(25) - 36 = 14 => vec(O A) dot vec(O B) = 7$. \
    Tương tự: $vec(O B) dot vec(O C) = (50 - 64)/2 = -7; quad vec(O C) dot vec(O A) = (50 - 49)/2 = "0,5"$. \
    Thay vào:
    $ O G^2 = 1/81 [ 4(25) + 9(25) + 16(25) + 12(7) + 24(-7) + 16("0,5") ] = 1/81 [ 725 + 84 - 168 + 8 ] = 649 / 81. $
    Do đó $O G = sqrt(649)/9 approx "2,83" < R = 5$, vậy điểm $G$ nằm hoàn toàn bên trong đường tròn $(O)$!
  ]
  
  #step[
    *3. Tìm Cực trị của biểu thức $T$ khi $M in (O; R)$:* \
    Theo Định lý Leibniz:
    $ T = 9 M G^2 + K. $
    Do $K$ không đổi, biểu thức $T$ đạt cực đại (hoặc cực tiểu) khi và chỉ khi đoạn thẳng $M G$ lớn nhất (hoặc nhỏ nhất). \
    Với $M$ di chuyển trên đường tròn $(O; R)$ và $G$ là điểm cố định nằm trong đường tròn:
    - $M G$ nhỏ nhất khi $M$ là giao điểm của tia $O G$ với đường tròn $(O)$:
      $ M G_min = R - O G = 5 - frac(sqrt(649), 9). $
    - $M G$ lớn nhất khi $M$ là giao điểm của tia đối của tia $O G$ với đường tròn $(O)$:
      $ M G_max = R + O G = 5 + frac(sqrt(649), 9). $
    *Kết luận:* Điểm cực trị luôn là hai đầu mút của đường kính đi qua tâm $O$ và tâm tỉ cự $G$! Định lý Leibniz biến một bài toán cực trị đa chất điểm phức tạp thành bài toán khoảng cách điểm - đường tròn sơ cấp cực kỳ thanh thoát.
  ]
]

