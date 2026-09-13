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
  stroke: (bottom: 2pt + rgb("0F766E")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("0F766E"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("0D9488")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0D9488"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("14B8A6")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("14B8A6"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0D9488")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Thống kê
#let c-teal-dark = rgb("0F766E")
#let c-teal = rgb("0D9488")
#let c-cyan = rgb("06B6D4")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-bg-teal = rgb("F0FDFA")
#let c-border = rgb("CCFBF1")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-teal,
    stroke: (
      left: 6pt + c-teal-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-teal-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: THỐNG KÊ MẪU SỐ LIỆU,\
      TỨ PHÂN VỊ, OUTLIERS & ĐỘ PHÂN TÁN
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Bản chất trung vị $Q_2$ & tứ phân vị $Q_1, Q_3$ · Hàng rào Tukey phát hiện giá trị bất thường $1.5 times I Q R$\
      Biểu đồ hộp Box Plot trực quan · Tối ưu hóa phương sai $s^2$ & Chuẩn hóa dữ liệu — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & TIÊU CHUẨN THỐNG KÊ QUỐC TẾ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-teal),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-teal)[1. Các Số Đặc Trưng Đo Xu Thế Trung Tâm & Độ Phân Tán] \
  Cho mẫu số liệu kích thước $n$ đã sắp xếp theo thứ tự không giảm: $x_1 le x_2 le dots le x_n$.
  - *Số trung bình cộng*: $macron(x) = 1/n sum_(i=1)^n x_i$.
  - *Trung vị ($Q_2$ / $M_e$)*:
    + Nếu $n$ lẻ ($n = 2k + 1$): $Q_2 = x_(k+1)$.
    + Nếu $n$ chẵn ($n = 2k$): $Q_2 = (x_k + x_(k+1))/2$.
  - *Tứ phân vị ($Q_1, Q_3$)*:
    + Tứ phân vị thứ nhất $Q_1$ là trung vị của nửa số liệu bên trái $Q_2$ (không tính $Q_2$ nếu $n$ lẻ).
    + Tứ phân vị thứ ba $Q_3$ là trung vị của nửa số liệu bên phải $Q_2$ (không tính $Q_2$ nếu $n$ lẻ).
  - *Khoảng biến thiên*: $R = x_n - x_1$.
  - *Khoảng tứ phân vị (Interquartile Range - $I Q R$)*: $Delta_Q = Q_3 - Q_1$. $Delta_Q$ đại diện cho độ trải rộng của $50%$ dữ liệu trung tâm và không bị ảnh hưởng bởi các giá trị ngoại lệ.
  - *Phương sai ($s^2$) và Độ lệch chuẩn ($s$)*:
  $ s^2 = 1/n sum_(i=1)^n (x_i - macron(x))^2 = (1/n sum_(i=1)^n x_i^2) - (macron(x))^2; quad s = sqrt(s^2). $
]

#v(0.6em)

#block(
  fill: rgb("FFFDF5"),
  stroke: 1pt + c-amber,
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[2. Quy Tắc Hàng Rào Tukey Phát Hiện Giá Trị Bất Thường (Outliers)] \
  Một giá trị $x$ trong mẫu số liệu được coi là một *giá trị bất thường* (giá trị ngoại lệ / Outlier) nếu nó nằm ngoài hai "hàng rào" sau:
  - *Hàng rào dưới (Lower Fence)*:
  $ L F = Q_1 - "1,5" dot I Q R = Q_1 - "1,5" (Q_3 - Q_1). $
  - *Hàng rào trên (Upper Fence)*:
  $ U F = Q_3 + "1,5" dot I Q R = Q_3 + "1,5" (Q_3 - Q_1). $
  Tức là $x$ là bất thường $<=>$ $x < L F$ hoặc $x > U F$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Trục số hoành
    line((-5, 0), (6, 0), mark: (end: ">", fill: black), stroke: 1pt)
    content((6.2, 0), [$x$], anchor: "west")

    // Hộp Box Plot (Q1 đến Q3)
    rect((-2, -0.6), (2.5, 0.6), fill: rgb("0D9488").transparentize(85%), stroke: 1.5pt + c-teal)
    
    // Đường trung vị Q2
    line((0.2, -0.6), (0.2, 0.6), stroke: 2pt + c-red)
    content((0.2, 0.9), text(fill: c-red, weight: "bold", size: 8.5pt)[$Q_2$])

    // Râu bên trái (Whisker to Min hợp lệ)
    line((-3.8, 0), (-2, 0), stroke: 1.2pt + c-teal)
    line((-3.8, -0.3), (-3.8, 0.3), stroke: 1.5pt + c-teal)
    content((-3.8, -0.5), text(size: 8pt)[Min hợp lệ])
    content((-2, -0.9), text(fill: c-teal, weight: "bold", size: 8.5pt)[$Q_1$])

    // Râu bên phải (Whisker to Max hợp lệ)
    line((2.5, 0), (4.5, 0), stroke: 1.2pt + c-teal)
    line((4.5, -0.3), (4.5, 0.3), stroke: 1.5pt + c-teal)
    content((4.5, -0.5), text(size: 8pt)[Max hợp lệ])
    content((2.5, -0.9), text(fill: c-teal, weight: "bold", size: 8.5pt)[$Q_3$])

    // Giá trị ngoại lệ Outliers
    circle((-4.5, 0), radius: 2.5pt, fill: c-red)
    content((-4.5, 0.4), text(fill: c-red, size: 8pt)[Outlier])
    circle((5.3, 0), radius: 2.5pt, fill: c-red)
    content((5.3, 0.4), text(fill: c-red, size: 8pt)[Outlier])
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
  #text(weight: "bold", fill: rgb("15803D"))[3. Tính Chất Biến Đổi Tuyến Tính Của Các Số Đặc Trưng] \
  Cho mẫu số liệu $X = {x_1, x_2, dots, x_n}$. Thực hiện phép biến đổi tuyến tính: $y_i = a x_i + b$ ($a eq.not 0$). Khi đó:
  - Số trung bình: $macron(y) = a macron(x) + b$.
  - Trung vị và tứ phân vị: $Q_k (Y) = a Q_k (X) + b$ (với $a > 0$).
  - Khoảng biến thiên và khoảng tứ phân vị: $R_Y = |a| R_X; quad Delta_Q (Y) = |a| Delta_Q (X)$.
  - Phương sai: $s_Y^2 = a^2 s_X^2$.
  - Độ lệch chuẩn: $s_Y = |a| s_X$.
  *(Nhận xét then chốt)*: Phép cộng hằng số $b$ (tịnh tiến dữ liệu) làm dịch chuyển tâm dữ liệu nhưng *không làm thay đổi độ phân tán* ($s_Y^2 = s_X^2$).
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0F766E"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-teal-dark)[4. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Thống Kê Học] \
  
  #text(weight: "bold", fill: c-teal)[a) Nguồn gốc lịch sử: Từ Francis Galton đến John Tukey và EDA:]
  - *Francis Galton (1822--1911)* & *Karl Pearson (1857--1936)*: Những người đặt nền móng cho thống kê toán học hiện đại, phát minh ra các khái niệm phương sai, độ lệch chuẩn, độ chuẩn hóa ($z$-score) và hệ số tương quan tuyến tính Pearson.
  - *John Tukey (1915--2000)*: Một trong những nhà toán học thống kê có tầm ảnh hưởng lớn nhất thế kỷ 20. Năm 1977, trong cuốn sách mang tính cách mạng *Exploratory Data Analysis (EDA)*, Tukey phê phán việc áp dụng mù quáng phân bố chuẩn và các số trung bình dễ bị bóp méo bởi dữ liệu rác. Ông phát minh ra *Biểu đồ hộp (Box Plot)* và *Quy tắc hàng rào $1,"5" times I Q R$* nhằm tạo ra một công cụ trực quan hóa dữ liệu bền bỉ (Robust Statistics), không bị ảnh hưởng bởi các giá trị ngoại lai dị biệt.

  #v(0.4em)
  #text(weight: "bold", fill: c-teal)[b) Hướng mở rộng 1: Khoa học dữ liệu hiện đại (Data Science) & Biểu đồ Violin (Violin Plot):]
  - Trong thời đại Big Data và trí tuệ nhân tạo (Python `pandas`, `seaborn`, `matplotlib`), Biểu đồ hộp của Tukey được nâng cấp thành *Biểu đồ Violin (Violin Plot)*: Kết hợp biểu đồ hộp thu nhỏ ở lõi bên trong và đường bao cong ước lượng mật độ hạt nhân (*Kernel Density Estimation - KDE*) ở hai bên. Điều này cho phép các nhà khoa học dữ liệu vừa đọc được tứ phân vị $Q_1, Q_2, Q_3$, vừa nhìn thấy cấu trúc dữ liệu đa đỉnh (Multimodal distribution) mà biểu đồ hộp cổ điển có thể che giấu.

  #v(0.4em)
  #text(weight: "bold", fill: c-teal)[c) Hướng mở rộng 2: Khoảng cách Mahalanobis trong phát hiện dị biệt đa chiều:]
  - Khi dữ liệu có nhiều biến số phụ thuộc lẫn nhau $(X_1, X_2, dots, X_p)$, kiểm tra hàng rào từng chiều độc lập sẽ bị đánh lừa bởi mối tương quan. Nhà thống kê Ấn Độ *Prasanta Chandra Mahalanobis (1936)* phát minh khoảng cách:
    $ D_M(x) = sqrt((x - mu)^T Sigma^(-1) (x - mu)) $
    (với $Sigma$ là ma trận hiệp phương sai). Khoảng cách Mahalanobis loại bỏ tương quan và đo lường khoảng cách theo hình elip phân bố chuẩn đa biến, là thuật toán chuẩn quốc tế để phát hiện gian lận thẻ tín dụng (Credit Card Fraud Detection) và phát hiện bất thường mạng Internet.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN THỐNG KÊ VDC
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Xác định tứ phân vị và lọc giá trị bất thường theo hàng rào Tukey*
  - Sắp xếp thứ tự $n$ phần tử, chia đôi tìm $Q_2$, sau đó tìm $Q_1, Q_3$.
  - Tính $I Q R = Q_3 - Q_1$, thiết lập khoảng $[Q_1 - "1,5" I Q R; Q_3 + "1,5" I Q R]$ và đối chiếu từng phần tử.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Bài toán tham số trong phương sai và tìm mẫu số liệu tối ưu*
  - Cho mẫu số liệu có chứa tham số $m$: $X = {a_1, a_2, dots, m}$.
  - Tìm $m$ để phương sai $s^2$ đạt giá trị nhỏ nhất (mức độ ổn định đồng đều cao nhất).
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: So sánh độ phân tán bằng hệ số biến thiên $C V = s / macron(x)$*
  - Khi hai mẫu số liệu có đơn vị đo khác nhau hoặc có số trung bình chênh lệch lớn, độ lệch chuẩn $s$ không thể phản ánh chính xác mẫu nào biến động mạnh hơn.
  - Ta dùng hệ số biến thiên $C V = s / macron(x)$. Mẫu có $C V$ nhỏ hơn là mẫu đồng đều hơn, có độ rủi ro thấp hơn.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Ghép nối hai mẫu số liệu và công thức phương sai gộp (Pooled Variance)*
  - Khi gộp hai mẫu $X$ ($n_1$ phần tử, $macron(x)_1, s_1^2$) và $Y$ ($n_2$ phần tử, $macron(x)_2, s_2^2$), tính số trung bình gộp và phương sai gộp của mẫu tổng thể $n_1 + n_2$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (ĐẲNG CẤP OLYMPIC & DATA SCIENCE)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tln(
  [*(Định Lý Samuelson-Brayshaw Về Biên Độ Chặn Chặt Của Dữ Liệu)*: \
  Cho một mẫu số liệu gồm $n$ số thực $X = {x_1, x_2, dots, x_n}$ có số trung bình là $macron(x)$ và độ lệch chuẩn là $s$. \
  1. Chứng minh rằng với mọi phần tử $x_k$ bất kỳ trong mẫu số liệu, khoảng cách từ $x_k$ đến số trung bình $macron(x)$ luôn bị chặn chặt bởi bất đẳng thức Samuelson (1968):
  $ |x_k - macron(x)| le s sqrt(n - 1). $
  2. *Ứng dụng kiểm thử:* Một lô gồm $n = 10$ vi mạch xử lý cao cấp có thời gian phản hồi trung bình $macron(x) = 20 "ms"$ và phương sai $s^2 = 9 "ms"^2$. Xác định thời gian phản hồi tối đa có thể đạt được của một vi mạch trong lô đó. Khi giá trị cực đại này xảy ra, các vi mạch còn lại có thời gian phản hồi bằng bao nhiêu?],
  [$x_(max) = 29 "ms"$; $9$ vi mạch còn lại đều có thời gian phản hồi bằng $19 "ms"$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((15, 0), (31, 0), mark: (end: ">"), stroke: 1.2pt)
    content((31.2, 0), [$x$ ("ms")], anchor: "west")

    // Điểm trung bình x_bar = 20
    line((20, -0.4), (20, 0.4), stroke: 2pt + c-teal)
    content((20, -0.7), text(fill: c-teal, weight: "bold")[$macron(x) = 20$])

    // Biên dưới 11, biên trên 29
    line((11, -0.2), (11, 0.2), stroke: 1.5pt + c-amber)
    content((11, -0.6), text(fill: c-amber, size: 8pt)[$11$])
    line((29, -0.2), (29, 0.2), stroke: 1.5pt + c-red)
    content((29, -0.6), text(fill: c-red, weight: "bold", size: 8.5pt)[$x_max = 29$])

    // Cụm 9 điểm tại 19
    circle((19, 0), radius: 3.5pt, fill: c-teal)
    content((19, 0.6), text(fill: c-teal, size: 8pt)[$9$ điểm tại $19$])

    // Điểm cực đại tại 29
    circle((29, 0), radius: 3.5pt, fill: c-red)
    content((29, 0.6), text(fill: c-red, size: 8pt)[$1$ điểm tại $29$])
  }),
  loigiai: [
    #step[
      *1. Chứng minh Định lý Samuelson-Brayshaw:* \
      Không mất tính tổng quát, giả sử ta xét phần tử $x_n$. Ta đặt $d_i = x_i - macron(x)$ với $i = 1, 2, dots, n$. \
      Theo định nghĩa số trung bình, ta có:
      $ sum_(i=1)^n d_i = 0 <=> sum_(i=1)^(n-1) d_i = - d_n. $
      Theo định nghĩa phương sai:
      $ n s^2 = sum_(i=1)^n d_i^2 = sum_(i=1)^(n-1) d_i^2 + d_n^2. $
      Áp dụng Bất đẳng thức Cauchy-Schwarz cho $n - 1$ số $d_1, d_2, dots, d_(n-1)$:
      $ (sum_(i=1)^(n-1) d_i)^2 le (n - 1) sum_(i=1)^(n-1) d_i^2. $
      Thay $sum_(i=1)^(n-1) d_i = - d_n$ và $sum_(i=1)^(n-1) d_i^2 = n s^2 - d_n^2$ vào:
      $ (- d_n)^2 le (n - 1) (n s^2 - d_n^2) <=> d_n^2 le n(n - 1) s^2 - (n - 1) d_n^2 $
      $ <=> n d_n^2 le n(n - 1) s^2 <=> d_n^2 le (n - 1) s^2. $
      Lấy căn bậc hai hai vế, ta thu được:
      $ |d_n| le s sqrt(n - 1) <=> |x_n - macron(x)| le s sqrt(n - 1). $
    ]
    #step[
      *2. Điều kiện xảy ra đẳng thức:* \
      Dấu bằng trong Bất đẳng thức Cauchy-Schwarz xảy ra khi và chỉ khi:
      $ d_1 = d_2 = dots = d_(n-1) = - frac(d_n, n - 1). $
      Nghĩa là khi một phần tử đạt cực đại thì toàn bộ $n - 1$ phần tử còn lại bắt buộc phải bằng nhau!
    ]
    #step[
      *3. Ứng dụng tính toán thời gian phản hồi:* \
      Với $n = 10, macron(x) = 20 "ms", s = sqrt(9) = 3 "ms"$:
      $ x_(max) = macron(x) + s sqrt(n - 1) = 20 + 3 sqrt(10 - 1) = 20 + 3(3) = 29 "ms". $
      Khi đó $d_n = 29 - 20 = 9$. Độ lệch của $9$ vi mạch còn lại là:
      $ d_1 = d_2 = dots = d_9 = - frac(9, 10 - 1) = -1. $
      Vậy thời gian phản hồi của $9$ vi mạch còn lại là: $x_i = macron(x) + d_i = 20 - 1 = 19 "ms"$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tln(
  [*(Định Lý Phân Rã Phương Sai ANOVA & Phương Sai Gộp Của Hai Nhóm)*: \
  Hai dây chuyền sản xuất linh kiện điện tử độc lập $A$ và $B$ có các chỉ số kiểm định chất lượng:
  - Dây chuyền $A$: Kích thước mẫu $n_1 = 30$, độ dài trung bình $macron(x)_1 = 70 "mm"$, phương sai $s_1^2 = 16 "mm"^2$.
  - Dây chuyền $B$: Kích thước mẫu $n_2 = 20$, độ dài trung bình $macron(x)_2 = 80 "mm"$, phương sai $s_2^2 = 25 "mm"^2$.
  1. Thiết lập công thức tính phương sai gộp $s_(g o p)^2$ của mẫu tổng thể gồm $n = n_1 + n_2 = 50$ linh kiện thông qua Định lý phân rã phương sai toàn phần (Law of Total Variance).
  2. Tính chính xác phương sai gộp $s_(g o p)^2$ và độ lệch chuẩn gộp $s_(g o p)$. Phân tích vì sao phương sai gộp lại lớn hơn phương sai của từng dây chuyền thành phần?],
  [$s_(g o p)^2 = "43,6" "mm"^2; quad s_(g o p) approx "6,60" "mm"$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Trục biểu diễn hai nhóm
    line((60, 0), (90, 0), mark: (end: ">"), stroke: 1.2pt)
    content((90.2, 0), [$x$ ("mm")], anchor: "west")

    // Nhóm A: mean 70, s=4
    rect((66, -0.4), (74, 0.4), fill: rgb("0D9488").transparentize(80%), stroke: 1.2pt + c-teal)
    line((70, -0.4), (70, 0.4), stroke: 2pt + c-teal)
    content((70, -0.7), text(fill: c-teal)[$macron(x)_1 = 70$])

    // Nhóm B: mean 80, s=5
    rect((75, -0.4), (85, 0.4), fill: rgb("2563EB").transparentize(80%), stroke: 1.2pt + rgb("2563EB"))
    line((80, -0.4), (80, 0.4), stroke: 2pt + rgb("2563EB"))
    content((80, -0.7), text(fill: rgb("2563EB"))[$macron(x)_2 = 80$])

    // Tâm gộp 74
    circle((74, 0), radius: 3pt, fill: c-red)
    content((74, 0.8), text(fill: c-red, weight: "bold")[$macron(x)_(g o p) = 74$])
  }),
  loigiai: [
    #step[
      *1. Tính số trung bình cộng gộp:* \
      $ macron(x)_(g o p) = frac(n_1 macron(x)_1 + n_2 macron(x)_2, n_1 + n_2) = frac(30(70) + 20(80), 50) = frac(2100 + 1600, 50) = 3700/50 = 74 "mm". $
    ]
    #step[
      *2. Thiết lập công thức phân rã phương sai toàn phần (ANOVA Decomposition):* \
      Tổng bình phương sai số toàn phần $S S_(t o t a l) = sum_(k=1)^n (x_k - macron(x)_(g o p))^2$. Ta có đồng nhất thức:
      $ S S_(t o t a l) = underbrace(n_1 s_1^2 + n_2 s_2^2, S S_("Within") - "Biến thiên nội nhóm") + underbrace(n_1 (macron(x)_1 - macron(x)_(g o p))^2 + n_2 (macron(x)_2 - macron(x)_(g o p))^2, S S_("Between") - "Biến thiên liên nhóm"). $
      Mặt khác, $macron(x)_1 - macron(x)_(g o p) = - frac(n_2, n_1 + n_2) (macron(x)_2 - macron(x)_1)$ và $macron(x)_2 - macron(x)_(g o p) = frac(n_1, n_1 + n_2) (macron(x)_2 - macron(x)_1)$. Do đó:
      $ S S_("Between") = frac(n_1 n_2, n_1 + n_2) (macron(x)_1 - macron(x)_2)^2. $
      Chia toàn bộ cho tổng kích thước mẫu $n = n_1 + n_2$:
      $ s_(g o p)^2 = frac(n_1 s_1^2 + n_2 s_2^2, n_1 + n_2) + frac(n_1 n_2, (n_1 + n_2)^2) (macron(x)_1 - macron(x)_2)^2. $
    ]
    #step[
      *3. Tính giá trị phương sai gộp:* \
      - Biến thiên nội nhóm trung bình:
        $ s_("Within")^2 = frac(30(16) + 20(25), 50) = frac(480 + 500, 50) = 980/50 = "19,6" "mm"^2. $
      - Biến thiên liên nhóm trung bình:
        $ s_("Between")^2 = frac(30 dot 20, 50^2) (80 - 70)^2 = frac(600, 2500) dot 100 = "0,24" dot 100 = 24 "mm"^2. $
      - Phương sai gộp toàn phần:
        $ s_(g o p)^2 = "19,6" + 24 = "43,6" "mm"^2. $
      - Độ lệch chuẩn gộp: $s_(g o p) = sqrt("43,6") approx "6,60" "mm"$. \
      *Ý nghĩa cốt lõi:* Phương sai gộp ($"43,6"$) lớn hơn hẳn phương sai của từng dây chuyền ($16$ và $25$) vì có sự chênh lệch lớn giữa hai tâm trung bình ($70$ và $80$). Khi gộp hai mẫu có tâm khác nhau, dữ liệu bị kéo dãn ra hai cực, làm tăng vọt độ phân tán toàn cục!
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
  [*(Bất Đẳng Thức Bhatia-Davis Về Giới Hạn Trên Của Phương Sai)*: \
  Định lý Bhatia-Davis (2000) khẳng định rằng với mọi mẫu số liệu hữu hạn $X$ có các giá trị thuộc đoạn $[m; M]$ ($m = x_(m i n), M = x_(m a x)$) và số trung bình là $macron(x)$, phương sai $s^2$ luôn thỏa mãn bất đẳng thức:
  $ s^2 le (M - macron(x))(macron(x) - m) le frac((M - m)^2, 4) $
  Một kỳ thi đánh giá năng lực có thang điểm từ $0$ đến $10$. Điểm trung bình của một phòng thi là $macron(x) = 7$. Phương sai tối đa của điểm số phòng thi này có thể đạt được là bao nhiêu?],
  (
    [$16$],
    True([$21$]),
    [$25$],
    [$"12,5"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (10, 0), stroke: 1.2pt)
    circle((0, 0), radius: 2.5pt, fill: black)
    content((0, -0.4), [$0$])
    circle((10, 0), radius: 2.5pt, fill: black)
    content((10, -0.4), [$10$])
    circle((7, 0), radius: 2.5pt, fill: c-red)
    content((7, -0.4), text(fill: c-red)[$macron(x) = 7$])
    content((5, 0.7), text(fill: c-teal)[$s^2 le (10 - 7)(7 - 0) = 21$])
  }),
  loigiai: [
    #step[
      *1. Chứng minh Bất đẳng thức Bhatia-Davis:* \
      Vì $m le x_i le M$ với mọi $i = 1, dots, n$, ta luôn có:
      $ (M - x_i)(x_i - m) ge 0 <=> M x_i - M m - x_i^2 + m x_i ge 0 <=> x_i^2 le (M + m) x_i - M m. $
      Lấy trung bình cộng hai vế cho $n$ phần tử:
      $ frac(1, n) sum x_i^2 le (M + m) macron(x) - M m. $
      Theo công thức phương sai:
      $ s^2 = frac(1, n) sum x_i^2 - macron(x)^2 le (M + m) macron(x) - M m - macron(x)^2 $
      $ = M macron(x) + m macron(x) - M m - macron(x)^2 = (M - macron(x))(macron(x) - m). $
    ]
    #step[
      *2. Tính giá trị lớn nhất:* \
      Với $m = 0, M = 10, macron(x) = 7$:
      $ s^2 le (10 - 7)(7 - 0) = 3 dot 7 = 21. $
      Dấu bằng xảy ra khi toàn bộ thí sinh trong phòng chỉ nhận một trong hai điểm số cực trị: $0$ điểm hoặc $10$ điểm!
    ]
  ]
)

// CÂU 2
#tn(
  [*(Biên Chặt Samuelson-Brayshaw Cho Mẫu $n = 5$)*: \
  Cho một mẫu dữ liệu gồm $n = 5$ số thực có số trung bình cộng $macron(x) = 10$ và độ lệch chuẩn $s = 2$. Giá trị lớn nhất mà phần tử lớn nhất $x_(m a x)$ trong mẫu có thể đạt được bằng:],
  (
    [$12$],
    True([$14$]),
    [$16$],
    [$"13,5"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((6, 0), (16, 0), stroke: 1pt)
    circle((10, 0), radius: 2.5pt, fill: c-teal)
    content((10, -0.4), text(fill: c-teal)[$macron(x) = 10$])
    circle((14, 0), radius: 2.5pt, fill: c-red)
    content((14, -0.4), text(fill: c-red)[$x_max = 14$])
  }),
  loigiai: [
    #step[
      Áp dụng trực tiếp Định lý Samuelson-Brayshaw:
      $ x_(m a x) le macron(x) + s sqrt(n - 1) = 10 + 2 sqrt(5 - 1) = 10 + 2(2) = 14. $
      Dấu bằng xảy ra khi mẫu số liệu là ${9, 9, 9, 9, 14}$!
    ]
  ]
)

// CÂU 3
#tn(
  [*(Hệ Số Bất Đối Xứng Skewness & Thứ Tự Số Đặc Trưng Khi Dữ Liệu Lệch Phải)*: \
  Trong thống kê kinh tế lượng, khi khảo sát mức thu nhập của người lao động tại một đô thị lớn, phân bố dữ liệu thường bị lệch phải nghiêm trọng (Positive Skewness, đuôi phân bố kéo dài về phía thu nhập cao của một số ít triệu phú). Thứ tự thông thường giữa Mốt ($M_o$), Trung vị ($Q_2$) và Số trung bình ($macron(x)$) là:],
  (
    [$macron(x) < Q_2 < M_o$],
    True([$M_o < Q_2 < macron(x)$]),
    [$Q_2 < M_o < macron(x)$],
    [$M_o = Q_2 = macron(x)$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đường cong phân bố lệch phải
    line((0, 0), (5, 0), stroke: 1pt)
    content((1.2, -0.3), text(size: 8pt)[$M_o$])
    content((2.0, -0.3), text(size: 8pt)[$Q_2$])
    content((3.0, -0.3), text(size: 8pt)[$macron(x)$])
    content((2.5, 1.2), text(fill: c-teal, size: 8.5pt)[Phân bố lệch phải (Right-Skewed)])
  }),
  loigiai: [
    #step[
      Trong phân bố lệch phải (Positive Skewness):
      - Mốt $M_o$ nằm tại đỉnh nhọn nhất của mật độ tần số.
      - Trung vị $Q_2$ chia đôi $50%$ diện tích xác suất.
      - Số trung bình $macron(x)$ bị các giá trị cực lớn ở đuôi kéo mạnh về bên phải.
      Do đó: $M_o < Q_2 < macron(x)$. Đây là lý do báo cáo kinh tế luôn dùng trung vị $Q_2$ để phản ánh thu nhập điển hình thay vì dùng số trung bình!
    ]
  ]
)

// CÂU 4
#tn(
  [*(Cực Trị Phương Sai Mẫu Nhị Phân Bernoulli)*: \
  Một mẫu thử nghiệm gồm $n = 20$ bóng đèn led, mỗi bóng được đánh giá là đạt chuẩn (ghi giá trị $1$) hoặc lỗi (ghi giá trị $0$). Gọi $k$ là số lượng bóng đèn đạt chuẩn ($k in {0, 1, dots, 20}$). Phương sai $s^2$ của mẫu thử nghiệm này đạt giá trị lớn nhất khi $k$ bằng bao nhiêu và giá trị lớn nhất đó là:],
  (
    [$k = 20, s^2_(m a x) = 1$],
    True([$k = 10, s^2_(m a x) = "0,25"$]),
    [$k = 5, s^2_(m a x) = "0,20"$],
    [$k = 15, s^2_(m a x) = "0,50"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-teal)[$s^2 = p(1 - p) le 1/4 = "0,25" <=> k = 10$])
  }),
  loigiai: [
    #step[
      Tỉ lệ đạt chuẩn của mẫu là $p = k/20$. \
      Số trung bình là $macron(x) = p$. \
      Vì $x_i in {0, 1}$ nên $x_i^2 = x_i$, suy ra $sum x_i^2 = sum x_i = k$. \
      Do đó:
      $ s^2 = frac(1, n) sum x_i^2 - macron(x)^2 = p - p^2 = p(1 - p). $
      Theo bất đẳng thức AM-GM: $p(1 - p) le (frac(p + 1 - p, 2))^2 = 1/4 = "0,25"$. \
      Đẳng thức xảy ra khi $p = 1/2 <=> k/20 = 1/2 <=> k = 10$.
    ]
  ]
)

// CÂU 5
#tn(
  [*(Khoảng Cách Mahalanobis & Hình Học Của Dị Biệt Tương Quan)*: \
  Cho mẫu dữ liệu 2 chiều $(X, Y)$ có ma trận hiệp phương sai là $Sigma = mat(4, 0; 0, 9)$ và tâm dữ liệu tại gốc tọa độ $(0; 0)$. Quỹ tích các điểm có cùng khoảng cách Mahalanobis $D_M = 1$ là hình học nào trong mặt phẳng tọa độ?],
  (
    [Đường tròn tâm $(0; 0)$ bán kính $R = 1$.],
    True([Đường elip có phương trình $x^2 / 4 + y^2 / 9 = 1$.]),
    [Đường hyperbol $x^2 / 4 - y^2 / 9 = 1$.],
    [Hình vuông có đỉnh tại $(pm 2; pm 3)$.],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((-3, 0), (3, 0), stroke: 0.8pt + gray)
    line((0, -4), (0, 4), stroke: 0.8pt + gray)
    // Elip trục lớn dọc y=3, trục bé x=2
    circle((0, 0), radius: (2, 3), stroke: 1.5pt + c-teal)
    content((2.4, 2), text(fill: c-teal)[$D_M = 1$])
  }),
  loigiai: [
    #step[
      *1. Tính ma trận nghịch đảo:* \
      $ Sigma = mat(4, 0; 0, 9) ==> Sigma^(-1) = mat(1/4, 0; 0, 1/9). $
    ]
    #step[
      *2. Thiết lập biểu thức khoảng cách:* \
      $ D_M^2 = mat(x, y) mat(1/4, 0; 0, 1/9) mat(x; y) = frac(x^2, 4) + frac(y^2, 9). $
      Với $D_M = 1$, ta có phương trình:
      $ frac(x^2, 4) + frac(y^2, 9) = 1. $
      Đây là phương trình chính tắc của đường elip nhận hai trục tọa độ làm trục đối xứng, bán trục lớn $b = 3$ dọc theo trục $O y$ và bán trục bé $a = 2$ dọc theo trục $O x$!
    ]
  ]
)

// CÂU 6
#tn(
  [*(Độ Lệch Chuẩn Gộp Khi Trộn Hai Lô Hàng Khác Biệt)*: \
  Một nhà máy đóng gói gạo có hai máy đóng gói độc lập. Máy 1 đóng $100$ bao gạo có khối lượng trung bình $macron(x)_1 = 10 "kg"$, độ lệch chuẩn $s_1 = "0,2" "kg"$. Máy 2 đóng $100$ bao gạo có khối lượng trung bình $macron(x)_2 = "10,6" "kg"$, độ lệch chuẩn $s_2 = "0,2" "kg"$. Khi trộn lẫn $200$ bao gạo của cả hai máy, độ lệch chuẩn gộp $s_(g o p)$ của cả lô hàng bằng bao nhiêu?],
  (
    [$"0,20" "kg"$],
    True([$sqrt("0,13") approx "0,361" "kg"$]),
    [$"0,40" "kg"$],
    [$"0,30" "kg"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    content((0, 0), text(fill: c-teal)[$s_(g o p)^2 = "0,04" + "0,09" = "0,13" ==> s approx "0,361" "kg"$])
  }),
  loigiai: [
    #step[
      $n_1 = n_2 = 100$. Khối lượng trung bình gộp:
      $ macron(x)_(g o p) = frac(10 + "10,6", 2) = "10,3" "kg". $
    ]
    #step[
      Phương sai gộp:
      $ s_(g o p)^2 = frac(s_1^2 + s_2^2, 2) + frac(1, 4) (macron(x)_1 - macron(x)_2)^2 $
      $ = frac("0,04" + "0,04", 2) + frac(1, 4) ("10,6" - 10)^2 = "0,04" + frac(1, 4) ("0,36") = "0,04" + "0,09" = "0,13" "kg"^2. $
      Độ lệch chuẩn gộp: $s_(g o p) = sqrt("0,13") approx "0,361" "kg"$.
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu Toàn Diện & Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Hệ Thống Bất Đẳng Thức Thống Kê Nền Tảng: Chebyshev - Samuelson - Bhatia-Davis)*: \
  Cho mẫu số liệu $X = {x_1, x_2, dots, x_n}$ có số trung bình $macron(x)$, độ lệch chuẩn $s$ và các giá trị nằm trong đoạn $[m; M]$. Xét tính đúng/sai của các định lý toán học sau:],
  (
    True([Bất đẳng thức Chebyshev $frac(1, n) |{i: |x_i - macron(x)| ge k s}| le frac(1, k^2)$ đúng với mọi mẫu số liệu rời rạc bất kỳ (với $k > 1$) mà không đòi hỏi giả thiết về quy luật phân phối chuẩn.]),
    True([Theo Định lý Samuelson, mọi phần tử $x_i$ trong mẫu luôn thỏa mãn $|x_i - macron(x)| le s sqrt(n - 1)$.]),
    True([Theo Định lý Bhatia-Davis, phương sai luôn bị chặn trên bởi $s^2 le (M - macron(x))(macron(x) - m)$.]),
    False([Nếu mẫu số liệu có phân phối chuẩn thì khoảng biến thiên $R = M - m$ luôn bằng đúng $2 s$.]),
  ),
  loigiai: [
    *(a) Đúng.* Bất đẳng thức Chebyshev là định lý nền tảng của lý thuyết xác suất và thống kê, đúng với mọi phân bố có phương sai hữu hạn. \
    *(b) Đúng.* Định lý Samuelson-Brayshaw (1968) được chứng minh chặt chẽ qua bất đẳng thức Cauchy-Schwarz. \
    *(c) Đúng.* Định lý Bhatia-Davis (2000) thiết lập giới hạn trên tối ưu của phương sai theo khoảng giá trị và trung bình. \
    *(d) Sai.* Trong phân phối chuẩn, khoảng biến thiên $R$ phụ thuộc vào kích thước mẫu $n$ và thường xấp xỉ từ $4 s$ đến $6 s$ (theo quy tắc thực nghiệm $3 sigma$).
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Thống Kê Bền Vững - Robust Statistics & Biểu Đồ Hộp Box Plot)*: \
  Xét các phương pháp xử lý dữ liệu và phát hiện giá trị bất thường (outliers) trong Khoa học dữ liệu:],
  (
    True([Trung vị $Q_2$ và khoảng tứ phân vị $I Q R$ có "điểm gãy" (Breakdown Point) đạt $50%$, bền bỉ hơn rất nhiều so với số trung bình $macron(x)$ có điểm gãy bằng $0%$.]),
    True([Quy tắc hàng rào Tukey $1,"5" times I Q R$ đối với dữ liệu phân phối chuẩn tương ứng với khoảng xấp xỉ $pm "2,7" sigma$, nghĩa là tỉ lệ quan sát bình thường bị coi nhầm là outlier chỉ khoảng $"0,7"%$.]),
    True([Nếu một giá trị ngoại lệ cực lớn $x_("outlier") >> Q_3$ bị gỡ bỏ khỏi mẫu thì khoảng tứ phân vị $I Q R$ hầu như không thay đổi, trong khi phương sai $s^2$ sẽ giảm đi đáng kể.]),
    False([Mọi mẫu số liệu có số lượng phần tử $n ge 10$ đều bắt buộc phải chứa ít nhất một giá trị bất thường theo tiêu chuẩn Tukey.]),
  ),
  loigiai: [
    *(a) Đúng.* Phải làm hỏng ít nhất $50%$ dữ liệu thì trung vị mới bị kéo ra vô cùng, trong khi chỉ cần 1 điểm cực lớn là số trung bình bị sai lệch hoàn toàn. \
    *(b) Đúng.* Trong phân phối chuẩn $N(mu, sigma^2)$, $I Q R approx "1,349" sigma$. Hàng rào $Q_3 + "1,5" I Q R = "0,6745" sigma + "1,5"("1,349" sigma) approx "2,698" sigma approx "2,7" sigma$. Xác suất ngoài ngưỡng này là $"0,7"%$. \
    *(c) Đúng.* $I Q R$ chỉ phụ thuộc vị trí phân vị $Q_1, Q_3$ nên không bị ảnh hưởng bởi giá trị của điểm ngoại lệ ở xa, nhưng phương sai tính theo bình phương độ lệch $(x_i - macron(x))^2$ sẽ giảm mạnh khi loại bỏ điểm này. \
    *(d) Sai.* Một mẫu số liệu phân bố đều hoặc phân bố chuẩn hoàn toàn có thể không có bất kỳ giá trị bất thường nào.
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC Olympic)

// TLN 1
#tln(
  [Hai phân xưởng sản xuất bulông độc lập: Phân xưởng 1 có $100$ sản phẩm với độ dài trung bình $macron(x)_1 = 10 "cm"$, độ lệch chuẩn $s_1 = "0,2" "cm"$. Phân xưởng 2 có $100$ sản phẩm với $macron(x)_2 = "10,6" "cm"$, độ lệch chuẩn $s_2 = "0,2" "cm"$. Khi gộp chung sản phẩm hai phân xưởng, tính giá trị của $100 dot s_(g o p)^2$.],
  [$13$],
  loigiai: [
    #step[
      Phương sai gộp:
      $ s_(g o p)^2 = frac(s_1^2 + s_2^2, 2) + frac(1, 4)(macron(x)_1 - macron(x)_2)^2 = "0,04" + frac(1, 4)("0,36") = "0,04" + "0,09" = "0,13". $
      Do đó: $100 dot s_(g o p)^2 = 100 dot "0,13" = 13$.
    ]
  ]
)

// TLN 2
#tln(
  [Cho một mẫu số liệu gồm $n = 10$ số thực có số trung bình $macron(x) = 15$ và độ lệch chuẩn $s = 2$. Theo Định lý Samuelson, giá trị lớn nhất có thể có của một phần tử trong mẫu số liệu này bằng bao nhiêu?],
  [$21$],
  loigiai: [
    #step[
      $x_(m a x) = macron(x) + s sqrt(n - 1) = 15 + 2 sqrt(10 - 1) = 15 + 2(3) = 21$.
    ]
  ]
)

// TLN 3
#tln(
  [Một mẫu số liệu gồm các giá trị thuộc đoạn $[0; 12]$ có số trung bình cộng bằng $8$. Theo Định lý Bhatia-Davis, giá trị lớn nhất mà phương sai $s^2$ của mẫu số liệu này có thể đạt được bằng bao nhiêu?],
  [$32$],
  loigiai: [
    #step[
      $s^2 le (M - macron(x))(macron(x) - m) = (12 - 8)(8 - 0) = 4 dot 8 = 32$.
    ]
  ]
)

// TLN 4
#tln(
  [Cho một mẫu số liệu có tứ phân vị thứ nhất $Q_1 = 45$ và tứ phân vị thứ ba $Q_3 = 65$. Tìm giá trị nguyên dương nhỏ nhất của $k$ sao cho mọi giá trị $x ge k$ trong mẫu số liệu đều bị coi là giá trị bất thường (outlier) theo quy tắc hàng rào Tukey.],
  [$96$],
  loigiai: [
    #step[
      Khoảng tứ phân vị: $I Q R = Q_3 - Q_1 = 65 - 45 = 20$. \
      Hàng rào trên Tukey:
      $ U F = Q_3 + "1,5" dot I Q R = 65 + "1,5"(20) = 65 + 30 = 95. $
      Một giá trị $x$ là outlier phía trên khi $x > U F <=> x > 95$. \
      Vì $x$ là số nguyên nên giá trị nhỏ nhất để mọi $x ge k$ đều là outlier là $k = 96$.
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Chứng Minh Định Lý Bhatia-Davis & Bất Đẳng Thức Jensen)

// TỰ LUẬN 1
#tl(
  [*(Chứng Minh Định Lý Bhatia-Davis & Ứng Dụng Đánh Giá Giới Hạn Biến Động Rủi Ro)*: \
  Cho mẫu số liệu $X = {x_1, x_2, dots, x_n}$ có các phần tử bị chặn trong đoạn $[m; M]$ với $m < M$ và số trung bình là $macron(x)$.
  1. Chứng minh Bất đẳng thức Bhatia-Davis:
     $ s^2 le (M - macron(x))(macron(x) - m) $
  2. Từ đó suy ra bất đẳng thức tổng quát của Popoviciu:
     $ s^2 le frac((M - m)^2, 4) <=> s le frac(M - m, 2) $
  3. Ứng dụng trong quản trị rủi ro tài chính: Một danh mục đầu tư cam kết tỷ suất sinh lời nằm trong biên độ từ $-10%$ đến $+30%$ mỗi năm ($m = -"0,10"$, $M = "0,30"$). Biết tỷ suất sinh lời kỳ vọng (trung bình) là $macron(x) = +"10"% = "0,10"$. Hãy đánh giá độ lệch chuẩn rủi ro tối đa của danh mục đầu tư này.],
  loigiai: [
    #step[
      *1. Chứng minh Bất đẳng thức Bhatia-Davis:* \
      Với mọi $i in {1, 2, dots, n}$, vì $m le x_i le M$ nên ta có tích hai thừa số trái dấu:
      $ (M - x_i)(x_i - m) ge 0 <=> M x_i - M m - x_i^2 + m x_i ge 0. $
      Chuyển vế:
      $ x_i^2 le (M + m) x_i - M m. $
      Lấy trung bình cộng hai vế cho $n$ phần tử:
      $ frac(1, n) sum_(i=1)^n x_i^2 le (M + m) (frac(1, n) sum_(i=1)^n x_i) - M m = (M + m) macron(x) - M m. $
      Phương sai của mẫu số liệu là:
      $ s^2 = frac(1, n) sum_(i=1)^n x_i^2 - macron(x)^2 le (M + m) macron(x) - M m - macron(x)^2. $
      Biến đổi vế phải:
      $ (M + m) macron(x) - M m - macron(x)^2 = M macron(x) - M m + m macron(x) - macron(x)^2 = M(macron(x) - m) - macron(x)(macron(x) - m) $
      $ = (M - macron(x))(macron(x) - m). $
      Ta có điều phải chứng minh!
    ]
    #step[
      *2. Suy ra Bất đẳng thức Popoviciu:* \
      Áp dụng Bất đẳng thức AM-GM cho hai số không âm $(M - macron(x))$ và $(macron(x) - m)$:
      $ (M - macron(x))(macron(x) - m) le [ frac((M - macron(x)) + (macron(x) - m), 2) ]^2 = [ frac(M - m, 2) ]^2 = frac((M - m)^2, 4). $
      Do đó:
      $ s^2 le frac((M - m)^2, 4) <=> s le frac(M - m, 2). $
      Đẳng thức xảy ra khi và chỉ khi một nửa số liệu bằng $m$ và nửa còn lại bằng $M$ (phân bố hai cực đối xứng).
    ]
    #step[
      *3. Đánh giá rủi ro danh mục đầu tư:* \
      Với $m = -"0,10", M = "0,30"$ và tỷ suất sinh lời trung bình $macron(x) = "0,10"$:
      $ s^2 le (M - macron(x))(macron(x) - m) = ("0,30" - "0,10")("0,10" - (-"0,10")) = ("0,20") dot ("0,20") = "0,04". $
      Do đó độ lệch chuẩn rủi ro tối đa là:
      $ s le sqrt("0,04") = "0,20" = 20%. $
      *Ý nghĩa quản trị rủi ro:* Dù các tài sản trong danh mục biến động phức tạp đến đâu, độ rủi ro (độ lệch chuẩn $s$) không bao giờ có thể vượt quá $20%$/năm khi tỷ suất sinh lời trung bình là $10%$.
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC KHOA HỌC DỮ LIỆU: BẤT ĐẲNG THỨC CHEBYSHEV & DỊ BIỆT MAHALANOBIS] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nhà toán học Pafnuty Chebyshev 1867 & Nhà thống kê học Prasanta Chandra Mahalanobis 1936)]

  #v(0.4em)
  *Đề bài:* 
  1. Cho một tập dữ liệu số thực $X = {x_1, x_2, dots, x_n}$ có số trung bình là $macron(x)$ và phương sai mẫu là $s^2$. Hãy chứng minh *Bất đẳng thức Chebyshev dạng mẫu số liệu rời rạc:* Tỉ lệ số phần tử nằm ngoài khoảng $[macron(x) - k s; macron(x) + k s]$ (với $k > 1$) không bao giờ vượt quá $1 / k^2$:
     $ frac(1, n) |{ i mid(|) |x_i - macron(x)| ge k s }| le frac(1, k^2) $
     Từ đó, chứng minh với mọi tập dữ liệu bất kỳ (không cần phân phối chuẩn), luôn có ít nhất $75%$ số liệu nằm trong khoảng $[macron(x) - 2s; macron(x) + 2s]$ và ít nhất $88,"8"% $ nằm trong khoảng $[macron(x) - 3s; macron(x) + 3s]$.
  2. *Thách thức Đa biến (Multivariate Outlier):* Trong dữ liệu y sinh 2 chiều $(X, Y)$ (ví dụ: $X$ là chiều cao tính bằng cm, $Y$ là cân nặng tính bằng kg), hai biến số này có tương quan thuận mạnh ($r > 0$). Phân tích vì sao tiêu chuẩn Tukey $1,"5" I Q R$ đơn biến hoặc khoảng cách Euclid đơn thuần thất bại trong việc phát hiện dị biệt tương quan, và giải thích vai trò của *Khoảng cách Mahalanobis*:
     $ D_M (vec(x), vec(macron(x))) = sqrt((vec(x) - vec(macron(x)))^T Sigma^(-1) (vec(x) - vec(macron(x)))) $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trục tọa độ X, Y
    line((-1, 0), (6, 0), mark: (end: ">"), stroke: 1.2pt)
    content((6.2, 0), [$X$ (Chiều cao)], anchor: "west")
    line((0, -1), (0, 5), mark: (end: ">"), stroke: 1.2pt)
    content((0, 5.2), [$Y$ (Cân nặng)], anchor: "south")
    
    // Tâm đám mây dữ liệu (mu_X, mu_Y)
    let C = (2.5, 2.0)
    circle(C, radius: 0.08, fill: black)
    content((2.5, 1.7), [$(macron(x); macron(y))$])
    
    // Đám mây điểm tương quan dương (định hướng elip nghiêng 45 độ)
    circle((1.2, 1.0), radius: 0.05, fill: rgb("3B82F6"))
    circle((1.6, 1.3), radius: 0.05, fill: rgb("3B82F6"))
    circle((2.0, 1.8), radius: 0.05, fill: rgb("3B82F6"))
    circle((2.3, 1.9), radius: 0.05, fill: rgb("3B82F6"))
    circle((2.7, 2.2), radius: 0.05, fill: rgb("3B82F6"))
    circle((3.0, 2.5), radius: 0.05, fill: rgb("3B82F6"))
    circle((3.5, 3.0), radius: 0.05, fill: rgb("3B82F6"))
    circle((3.8, 3.2), radius: 0.05, fill: rgb("3B82F6"))

    // Elip phân tán Mahalanobis (xoay quanh tâm C)
    // Trục lớn a = 2.2, trục bé b = 0.8, góc nghiêng approx 40 độ
    // Vẽ bằng CetZ line cong hoặc transform
    line((0.8, 0.5), (4.2, 3.5), stroke: (dash: "dashed", paint: rgb("2563EB"), thickness: 1.2pt))
    content((4.4, 3.8), text(fill: rgb("2563EB"), size: 8pt)[Trục tương quan chính])
    
    // Điểm Outlier đa chiều P (cao nhưng cực kỳ gầy - vi phạm tương quan!)
    // Ví dụ: X = 4.5 (cao), Y = 1.0 (nhẹ cân)
    let P = (4.0, 0.8)
    circle(P, radius: 0.12, fill: rgb("DC2626"))
    content((4.2, 0.5), text(fill: rgb("DC2626"), weight: "bold", size: 8.5pt)[Dị biệt Mahalanobis $P$])
    content((4.2, 0.1), text(fill: rgb("991B1B"), size: 7.5pt)[(Đơn biến bình thường, nhưng sai lệch tương quan!)])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & Ý NGHĨA PHÂN TÍCH DỮ LIỆU HIỆN ĐẠI:] \
  
  #step[
    *1. Chứng minh Bất đẳng thức Chebyshev:* \
    Định nghĩa phương sai mẫu:
    $ s^2 = frac(1, n) sum_(i=1)^n (x_i - macron(x))^2. $
    Tách tổng các bình phương thành hai nhóm: nhóm các điểm nằm gần tâm ($|x_i - macron(x)| < k s$) và nhóm các điểm nằm xa tâm ($|x_i - macron(x)| ge k s$):
    $ s^2 = frac(1, n) sum_(|x_i - macron(x)| < k s) (x_i - macron(x))^2 + frac(1, n) sum_(|x_i - macron(x)| ge k s) (x_i - macron(x))^2. $
    Vì các số hạng đều không âm, ta bỏ đi nhóm thứ nhất:
    $ s^2 ge frac(1, n) sum_(|x_i - macron(x)| ge k s) (x_i - macron(x))^2. $
    Với mỗi điểm trong nhóm thứ hai, ta có $(x_i - macron(x))^2 ge (k s)^2 = k^2 s^2$. Do đó:
    $ s^2 ge frac(1, n) sum_(|x_i - macron(x)| ge k s) k^2 s^2 = frac(1, n) |{ i mid(|) |x_i - macron(x)| ge k s }| dot k^2 s^2. $
    Chia cả hai vế cho $k^2 s^2 > 0$:
    $ frac(1, n) |{ i mid(|) |x_i - macron(x)| ge k s }| le frac(1, k^2). $
    Ta có điều phải chứng minh! \
    - Khi $k = 2$: Tỉ lệ phần tử vượt quá $2s$ tối đa là $1/2^2 = 25%$, tức có ít nhất $1 - 25% = 75%$ số liệu rơi vào $[macron(x) - 2s; macron(x) + 2s]$.
    - Khi $k = 3$: Tỉ lệ vượt quá $3s$ tối đa là $1/3^2 = 1/9 approx "11,1"%$, tức có ít nhất $88,"9"%$ số liệu rơi vào $[macron(x) - 3s; macron(x) + 3s]$.
  ]
  
  #step[
    *2. Bản chất hình học của Khoảng cách Mahalanobis trong AI & Học máy:* \
    - *Hạn chế của phương pháp đơn biến:* Nếu xét riêng từng biến, giá trị $X_P = 4$ (chiều cao) và $Y_P = "0,8"$ (cân nặng) đều nằm trong phạm vi bình thường $[Q_1 - "1,5" I Q R; Q_3 + "1,5" I Q R]$ của từng trục. Do đó phương pháp Tukey đơn biến hoàn toàn không phát hiện được điểm bất thường này!
    - *Giải pháp Mahalanobis:* Ma trận hiệp phương sai $Sigma$ đo lường mối quan hệ đồng biến giữa $X$ và $Y$. Phép nghịch đảo ma trận $Sigma^(-1)$ thực hiện hai biến đổi liên tiếp:
      1. *Xoay hệ trục tọa độ* theo các hướng vector riêng của $Sigma$ để triệt tiêu tương quan (Decorrelation).
      2. *Co giãn các trục* theo căn bậc hai của các giá trị riêng để chuẩn hóa phương sai về 1.
    - Nhờ đó, elip phân tán biến thành hình cầu chuẩn, và điểm $P$ lộ rõ là một điểm dị biệt (Outlier) cách rất xa tâm dữ liệu. Đây là nền tảng của thuật toán phát hiện gian lận thẻ tín dụng và chẩn đoán bệnh lý tự động trong Trí tuệ nhân tạo!
  ]
]

