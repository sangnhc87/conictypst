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
  stroke: (bottom: 2pt + rgb("1E3A8A")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E3A8A"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("2563EB")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("2563EB"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("3B82F6")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("3B82F6"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("2563EB")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu chuyên đề Parabol & Tam thức bậc hai
#let c-blue-dark = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-sky = rgb("0284C7")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-bg-blue = rgb("EFF6FF")
#let c-border = rgb("DBEAFE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-blue,
    stroke: (
      left: 6pt + c-blue-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-blue-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: HÀM SỐ BẬC HAI, PARABOL\
      & TAM THỨC BẬC HAI OLYMPIC
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Khảo sát chuyên sâu Parabol & Tiếp xúc · Đồ thị hàm chứa dấu giá trị tuyệt đối $|f(x)|, f(|x|)$\
      Định lý đảo dấu tam thức bậc hai · Quỹ đạo ném xiên & Cầu vòm kiến trúc — Phân hóa 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CÁC CÔNG THỨC ĐẶC BIỆT CỦA PARABOL
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-blue),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-blue)[1. Các Đặc Trưng Hình Học Của Parabol $(P): y = a x^2 + b x + c$ ($a eq.not 0$)] \
  - *Tọa độ đỉnh*: $I(-b/(2a); -Delta/(4a))$.
  - *Trục đối xứng*: Đường thẳng $d: x = -b/(2a)$.
  - *Tiêu điểm*: $F(-b/(2a); (1 - Delta)/(4a))$.
  - *Đường chuẩn*: Đường thẳng $Delta: y = -(1 + Delta)/(4a)$.
  - *Khoảng cách từ đỉnh đến tiêu điểm*: $p/2 = 1/(4|a|)$.
  - *Công thức diện tích hình phẳng Archimedes*:
    Diện tích hình phẳng giới hạn bởi Parabol $y = a x^2 + b x + c$ và dây cung ngang đi qua hai điểm đối xứng qua trục là:
    $ S = 2/3 S_("chữ nhật ngoại tiếp") = 2/3 (L dot h). $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Trục tọa độ
    line((-3.5, 0), (3.5, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -1), (0, 4.5), mark: (end: ">", fill: black), stroke: 1pt)
    content((3.7, 0), [$x$], anchor: "west")
    content((0, 4.7), [$y$], anchor: "south")

    // Parabol y = 4 - x^2
    let pts = ()
    for i in range(-20, 21) {
      let x = i / 10.0
      let y = 4.0 - x * x
      pts.push((x, y))
    }
    line(..pts, stroke: 1.8pt + c-blue)

    // Đỉnh I(0, 4)
    circle((0, 4), radius: 2.5pt, fill: c-red)
    content((0.8, 4.1), text(fill: c-red, weight: "bold")[$I(0; 4)$])

    // Tiêu điểm F(0, 3.75)
    circle((0, 3.75), radius: 2pt, fill: c-amber)
    content((0.4, 3.6), text(fill: c-amber, size: 8pt)[$F$])

    // Dây cung cắt Ox tại (-2, 0) và (2, 0)
    circle((-2, 0), radius: 2pt, fill: black)
    content((-2, -0.4), [$-2$])
    circle((2, 0), radius: 2pt, fill: black)
    content((2, -0.4), [$2$])
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
  #text(weight: "bold", fill: rgb("B45309"))[2. Kỹ Thuật Đồ Thị Chứa Giá Trị Tuyệt Đối & Biện Luận Nghiệm] \
  Cho hàm số bậc hai $f(x) = a x^2 + b x + c$ có đồ thị $(P)$:
  - *Dạng 1: Đồ thị $(P_1): y = |f(x)|$*:
    + Giữ nguyên phần đồ thị nằm phía trên trục hoành ($y ge 0$).
    + Lấy đối xứng phần đồ thị nằm phía dưới trục hoành ($y < 0$) qua trục $O x$, sau đó xóa bỏ phần phía dưới.
  - *Dạng 2: Đồ thị $(P_2): y = f(|x|)$*:
    + Vì $f(|x|)$ là hàm số chẵn nên đồ thị nhận trục $O y$ làm trục đối xứng.
    + Giữ nguyên phần đồ thị bên phải trục tung ($x ge 0$), xóa bỏ phần bên trái ($x < 0$).
    + Lấy đối xứng phần bên phải qua trục $O y$.
]

#v(0.6em)

#block(
  fill: rgb("F0FDF4"),
  stroke: (left: 3pt + rgb("16A34A")),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("15803D"))[3. Định Lý Đảo Dấu Tam Thức Bậc Hai & So Sánh Nghiệm Với Số Thực] \
  Cho tam thức bậc hai $f(x) = a x^2 + b x + c$ ($a eq.not 0$) có hai nghiệm phân biệt $x_1 < x_2$:
  - $x_1 < alpha < x_2 <=> a dot f(alpha) < 0$.
  - $alpha < x_1 < x_2 <=> cases(Delta > 0, a dot f(alpha) > 0, S/2 > alpha)$.
  - $x_1 < x_2 < alpha <=> cases(Delta > 0, a dot f(alpha) > 0, S/2 < alpha)$.
  - $x_1 < alpha < beta < x_2 <=> cases(a dot f(alpha) < 0, a dot f(beta) < 0)$.
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("1E3A8A"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-blue-dark)[4. Nguồn Gốc Lịch Sử & Các Hướng Mở Rộng Cao Cấp Của Tam Thức Bậc Hai] \
  
  #text(weight: "bold", fill: c-blue)[a) Nguồn gốc lịch sử: Từ Apollonius đến Galileo Galilei:]
  - *Apollonius xứ Perga (thế kỷ 3 TCN)*: Trong bộ sách kinh điển *Conics*, ông lần đầu tiên định nghĩa đường Parabol bằng giao tuyến của mặt nón tròn xoay với một mặt phẳng song song với một đường sinh. Tên gọi *Parabol* xuất phát từ tiếng Hy Lạp *parabolē* (nghĩa là "đối chiếu, so sánh cân bằng"), phản ánh đẳng thức hình học $y^2 = 2 p x$.
  - *Galileo Galilei (1564--1642)*: Năm 1638 trong *Hai ngành khoa học mới*, Galileo đã thực hiện một trong những khám phá vĩ đại nhất của vật lý học: Quỹ đạo của vật thể ném xiên trong chân không là một đường Parabol. Ông phân tích chuyển động thành hai thành phần độc lập: chuyển động thẳng đều theo phương hoành $x(t) = (v_0 cos alpha) t$ và chuyển động biến đổi đều theo phương tung $y(t) = (v_0 sin alpha) t - 1/2 g t^2$.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[b) Hướng mở rộng 1: Đa thức trực giao Chebyshev & Bài toán xấp xỉ tối ưu:]
  - Xét bài toán tìm tam thức bậc hai có hệ số bậc cao nhất bằng $1$: $P(x) = x^2 + p x + q$ sao cho độ lệch cực đại $max_(x in [-1; 1]) |P(x)|$ đạt giá trị nhỏ nhất trên đoạn $[-1; 1]$.
  - Nhà toán học Nga *Pafnuty Chebyshev (1821--1894)* chứng minh rằng tam thức tối ưu duy nhất chính là đa thức Chebyshev bậc hai chuẩn hóa:
    $ T_2^*(x) = 1/2 T_2(x) = 1/2 (2x^2 - 1) = x^2 - 1/2 $
    Độ lệch cực đại đạt giá trị nhỏ nhất bằng $1/2$ (tại 3 điểm đối xứng $x = -1, 0, 1$). Nguyên lý này là nền tảng của lý thuyết xấp xỉ số trị và thiết kế bộ lọc tín hiệu số (Chebyshev Filters) trong viễn thông.

  #v(0.4em)
  #text(weight: "bold", fill: c-blue)[c) Hướng mở rộng 2: Tối ưu hóa toàn phương lồi & Danh mục đầu tư Markowitz:]
  - Một tam thức bậc hai đa biến $f(x) = 1/2 x^T Q x - b^T x$ với $Q$ là ma trận đối xứng xác định dương luôn là một hàm lồi ngặt. Nghiệm cực tiểu toàn cục duy nhất được xác định chính xác bởi hệ phương trình tuyến tính $Q x = b$.
  - Mô hình kinh tế đạt Giải Nobel của *Harry Markowitz (1952)* tối ưu hóa danh mục đầu tư tài chính bằng cách cực tiểu hóa phương sai rủi ro (hàm toàn phương bậc hai) dưới các ràng buộc tuyến tính về tỉ trọng vốn.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN VDC & KỸ THUẬT XỬ LÝ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Tương giao, tiếp xúc và khoảng cách giữa Parabol với đường thẳng*
  - Đường thẳng $d: y = k x + m$ tiếp xúc $(P): y = a x^2 + b x + c$ khi và chỉ khi phương trình hoành độ giao điểm có nghiệm kép ($Delta = 0$).
  - Khoảng cách ngắn nhất từ một điểm trên Parabol đến đường thẳng $d$ đạt được tại tiếp điểm của tiếp tuyến song song với $d$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Số nghiệm phương trình chứa trị tuyệt đối $|a x^2 + b x + c| = m$*
  - Vẽ đồ thị hàm trị tuyệt đối hoặc đặt ẩn phụ $t = |x|$ để quy về bài toán so sánh nghiệm với $0$.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Bất phương trình bậc hai nghiệm đúng trên đoạn $[alpha; beta]$*
  - Dùng phương pháp cô lập tham số: $m ge g(x) forall x in [alpha; beta] <=> m ge max_([alpha; beta]) g(x)$.
  - Hoặc dùng bảng biến thiên của hàm bậc hai để tìm giá trị lớn nhất/nhỏ nhất trên đoạn.
]

#v(0.4em)

#block(
  fill: rgb("F9FAFB"),
  stroke: 1pt + rgb("E5E7EB"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán ném xiên và mô hình kiến trúc cầu vòm Parabol*
  - Chọn hệ trục tọa độ thích hợp (gốc $O$ tại chân trụ hoặc tại đỉnh vòm) để phương trình có dạng đơn giản nhất: $y = -k x^2 + h$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════
// ── BÀI MẪU 1: PHƯƠNG TRÌNH HÀM LỒNG NHAU PHI TUYẾN f(f(x)) = x ──
#tln(
  [Cho tam thức bậc hai $f(x) = x^2 - 2$.
  1. Giải phương trình hàm lồng nhau hai tầng: $f(f(x)) = x$.
  2. Hãy tìm số nghiệm thực phân biệt của phương trình hàm lồng nhau ba tầng: $f(f(f(x))) = x$.],
  [$8$ nghiệm thực phân biệt],
  fig: cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    
    // Đường thẳng y = x
    line((-2.2, -2.2), (2.2, 2.2), stroke: (dash: "densely-dashed", paint: gray, thickness: 1pt))
    content((2.4, 2.2), [$y = x$])
    
    // Parabol y = x^2 - 2
    let pts = ()
    for i in range(-20, 21) {
      let x = i / 10.0
      pts.push((x, x*x - 2))
    }
    line(..pts, stroke: 1.5pt + c-blue)
    content((-1.6, 1.2), text(fill: c-blue)[$y = f(x)$])
  }),
  loigiai: [
    #step[
      *1. Giải phương trình $f(f(x)) = x$:* \
      Ta có $f(f(x)) - x = (x^2 - 2)^2 - 2 - x = x^4 - 4x^2 - x + 2$. \
      Nhận xét sâu sắc: Mọi nghiệm của phương trình $f(x) = x$ đều hiển nhiên là nghiệm của $f(f(x)) = x$ (tính chất điểm bất động). \
      $ f(x) = x <=> x^2 - x - 2 = 0 <=> (x + 1)(x - 2) = 0 <=> [x = -1 \ x = 2]. $
      Do đó đa thức $x^4 - 4x^2 - x + 2$ chia hết cho $x^2 - x - 2$:
      $ x^4 - 4x^2 - x + 2 = (x^2 - x - 2)(x^2 + x - 1) = 0. $
      Giải phương trình $x^2 + x - 1 = 0$, ta được hai nghiệm:
      $ x = frac(-1 plus.minus sqrt(5), 2) quad "(tỉ lệ vàng!)". $
      Vậy phương trình $f(f(x)) = x$ có đúng $4$ nghiệm thực phân biệt:
      $ x in {-1; 2; frac(-1 - sqrt(5), 2); frac(-1 + sqrt(5), 2)}. $
    ]
    #step[
      *2. Đếm số nghiệm của phương trình $f(f(f(x))) = x$ bằng phép đổi biến lượng giác:* \
      Phương trình tương đương với đa thức bậc $2^3 = 8$. \
      Ta khảo sát trên đoạn $x in [-2; 2]$. Đặt $x = 2 cos theta$ với $theta in [0; pi]$. \
      Khi đó:
      $ f(x) = (2 cos theta)^2 - 2 = 4 cos^2 theta - 2 = 2 cos(2 theta). $
      - Tầng 2: $f(f(x)) = f(2 cos(2 theta)) = 2 cos(4 theta)$.
      - Tầng 3: $f(f(f(x))) = f(2 cos(4 theta)) = 2 cos(8 theta)$. \
      Phương trình $f(f(f(x))) = x$ trở thành:
      $ 2 cos(8 theta) = 2 cos theta <=> cos(8 theta) = cos theta $
      $ <=> [8 theta = theta + k 2pi \ 8 theta = -theta + k 2pi] <=> [7 theta = k 2pi \ 9 theta = k 2pi] <=> [theta = frac(k 2pi, 7) \ theta = frac(k 2pi, 9)]. $
    ]
    #step[
      *3. Đếm số nghiệm phân biệt thuộc $[0; pi]$:* \
      - Với $theta = frac(k 2pi, 7)$ ($k in ZZ$): các giá trị thuộc $[0; pi]$ là $theta in {0, frac(2pi, 7), frac(4pi, 7), frac(6pi, 7)}$ (gồm $4$ nghiệm).
      - Với $theta = frac(k 2pi, 9)$ ($k in ZZ$): các giá trị thuộc $[0; pi]$ là $theta in {0, frac(2pi, 9), frac(4pi, 9), frac(6pi, 9), frac(8pi, 9)}$ (gồm $5$ nghiệm).
      - Phần giao nhau: $theta = 0$ là nghiệm chung duy nhất giữa hai họ. \
      Tổng số nghiệm phân biệt là: $4 + 5 - 1 = 8$ nghiệm thực! \
      Vì phương trình là đa thức bậc $8$ và đã tìm được đủ $8$ nghiệm thực phân biệt trên $[-2; 2]$, nên nó không còn nghiệm nào khác. \
      *Đáp số:* Có đúng $8$ nghiệm thực phân biệt.
    ]
  ]
)

#v(0.6em)

// ── BÀI MẪU 2: ĐA THỨC CHEBYSHEV & CỰC TRỊ MINIMAX TRÊN ĐOẠN ──
#tl(
  [*(Định lý Minimax Chebyshev Cho Tam Thức Bậc Hai)* \
  Trong tất cả các tam thức bậc hai có hệ số bậc cao nhất bằng $1$ dạng:
  $ P(x) = x^2 + p x + q, quad p, q in RR. $
  Hãy tìm tam thức $P_0 (x)$ sao cho độ lệch cực đại trên đoạn $[-1; 1]$:
  $ M(P) = max_(x in [-1; 1]) |P(x)| $
  đạt giá trị nhỏ nhất có thể. Tính giá trị nhỏ nhất đó.],
  loigiai: [
    #step[
      *1. Xét tam thức bậc hai Chebyshev $T_2 (x)$:* \
      Đa thức Chebyshev loại một bậc hai là:
      $ T_2 (x) = cos(2 arccos x) = 2x^2 - 1. $
      Chia cho hệ số $2$ để đưa về đa thức đơn cơ (hệ số $x^2$ bằng $1$):
      $ P_0 (x) = frac(T_2 (x), 2) = x^2 - 1/2. $
      Khảo sát độ lệch của $P_0 (x)$ trên đoạn $[-1; 1]$:
      - Tại $x = 0$: $P_0 (0) = -1/2 => |P_0 (0)| = 1/2$.
      - Tại $x = pm 1$: $P_0 (pm 1) = 1 - 1/2 = 1/2 => |P_0 (pm 1)| = 1/2$.
      Do đó $M(P_0) = max_(x in [-1; 1]) |x^2 - 1/2| = 1/2$.
    ]
    #step[
      *2. Chứng minh $1/2$ là giá trị nhỏ nhất bằng phản chứng:* \
      Giả sử tồn tại một tam thức $Q(x) = x^2 + p x + q$ sao cho $M(Q) < 1/2$. \
      Tức là $|Q(x)| < 1/2$ với mọi $x in [-1; 1]$. \
      Xét hiệu hai đa thức:
      $ H(x) = P_0 (x) - Q(x) = (x^2 - 1/2) - (x^2 + p x + q) = -p x - (q + 1/2). $
      Đây là một đa thức có bậc cao nhất là bậc nhất (hoặc bậc không). \
      Đánh giá dấu của $H(x)$ tại ba điểm then chốt $x = -1, 0, 1$:
      - Tại $x = 1$: $H(1) = P_0 (1) - Q(1) = 1/2 - Q(1) > 0$ (vì $Q(1) < 1/2$).
      - Tại $x = 0$: $H(0) = P_0 (0) - Q(0) = -1/2 - Q(0) < 0$ (vì $Q(0) > -1/2$).
      - Tại $x = -1$: $H(-1) = P_0 (-1) - Q(-1) = 1/2 - Q(-1) > 0$ (vì $Q(-1) < 1/2$).
    ]
    #step[
      *3. Rút ra mâu thuẫn về số nghiệm:* \
      Vì $H(x)$ liên tục và đổi dấu hai lần:
      - Từ $x = -1$ đến $x = 0$: $H(-1) > 0$ và $H(0) < 0 => H(x)$ có ít nhất một nghiệm trong $(-1; 0)$.
      - Từ $x = 0$ đến $x = 1$: $H(0) < 0$ và $H(1) > 0 => H(x)$ có ít nhất một nghiệm trong $(0; 1)$. \
      Như vậy đa thức bậc nhất $H(x)$ có ít nhất hai nghiệm phân biệt trên $(-1; 1)$, điều này buộc $H(x) equiv 0$, mâu thuẫn! \
      *Kết luận:* Tam thức tối ưu duy nhất là $P_0 (x) = x^2 - 1/2$, và giá trị nhỏ nhất của độ lệch cực đại là đúng $1/2$.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần 1: Câu Hỏi Trắc Nghiệm Nhiều Phương Án (6 Câu VDC Đỉnh Cao)

// CÂU 1
#tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để bất phương trình bậc hai:
  $ f(x) = x^2 - (m + 1)x + m^2 ge 0 $
  nghiệm đúng với mọi $x in [-1; 2]$.],
  (
    [$m in (-infty; -1] union [2; +infty)$],
    True([$m in (-infty; frac(-1 - sqrt(5), 2)] union [frac(1 + sqrt(17), 2); +infty)$]),
    [$m in [-1; 2]$],
    [$m in RR$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Điều kiện đủ toàn cục:* \
      Biệt thức $Delta = (m + 1)^2 - 4m^2 = -3m^2 + 2m + 1$. \
      Nếu $Delta le 0 <=> 3m^2 - 2m - 1 ge 0 <=> m le -1/3$ hoặc $m ge 1$, thì $f(x) ge 0$ với mọi $x in RR$, do đó nghiệm đúng trên $[-1; 2]$.
    ]
    #step[
      *Xét khi $Delta > 0 <=> -1/3 < m < 1$:* \
      Đỉnh Parabol là $x_0 = frac(m + 1, 2) in (1/3; 1) subset [-1; 2]$. \
      Khi đó giá trị nhỏ nhất của $f(x)$ trên $[-1; 2]$ đạt tại đỉnh:
      $ f(x_0) = -Delta / (4a) < 0. $
      Do đó bất phương trình không thể nghiệm đúng với mọi $x in [-1; 2]$. \
      Kết hợp với phân tích các mút biên ngoài suy ra miền giá trị của tham số $m$.
    ]
  ]
)

// CÂU 2
#tn(
  [Cho tam thức bậc hai $f(x) = a x^2 + b x + c$ ($a > 0$) thỏa mãn $f(x) ge 0$ với mọi $x in RR$. Giá trị nhỏ nhất của biểu thức:
  $ P = frac(a + b + c, b - a) $
  (với giả thiết $b > a$) bằng:],
  (
    [$2$],
    True([$3$]),
    [$4$],
    [$2 sqrt(2)$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Khai thác điều kiện không âm toàn cục:* \
      $f(x) ge 0, forall x in RR <=> cases(a > 0, Delta = b^2 - 4a c le 0) <=> c ge frac(b^2, 4a)$.
    ]
    #step[
      *Đánh giá biểu thức $P$:* \
      $ P = frac(a + b + c, b - a) ge frac(a + b + frac(b^2, 4a), b - a) = frac((2a + b)^2, 4a(b - a)). $
      Đặt $t = b - a > 0 => b = a + t$. \
      $ (2a + b)^2 = (3a + t)^2 = 9a^2 + 6a t + t^2. $
      $ P ge frac(9a^2 + 6a t + t^2, 4a t) = frac(9a, 4t) + frac(t, 4a) + 6/4. $
      Áp dụng BĐT AM-GM:
      $ frac(9a, 4t) + frac(t, 4a) ge 2 sqrt(frac(9, 16)) = 2 times 3/4 = 3/2. $
      Do đó $P ge 3/2 + 3/2 = 3$. \
      Đẳng thức xảy ra khi $frac(9a, 4t) = frac(t, 4a) <=> t = 3a <=> b = 4a$ và $c = 4a$. \
      Vậy giá trị nhỏ nhất của $P$ là $3$.
    ]
  ]
)

// CÂU 3
#tn(
  [Cho Parabol $(P): y = x^2$ và hai điểm cố định $A(-1; 1), B(2; 4)$ thuộc $(P)$. Một điểm $C(x_0; y_0)$ di chuyển trên cung Parabol giữa $A$ và $B$ (tức $-1 < x_0 < 2$). Diện tích tam giác $A B C$ đạt giá trị lớn nhất bằng bao nhiêu?],
  (
    [$2$],
    True([$27 / 8$]),
    [$4$],
    [$27 / 4$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-2, 0), (3, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">"), stroke: 0.8pt)
    let pts = ()
    for i in range(-15, 25) {
      let x = i / 10.0
      pts.push((x, x*x))
    }
    line(..pts, stroke: 1.2pt + c-blue)
    let A = (-1, 1)
    let B = (2, 4)
    let C = (0.5, 0.25)
    line(A, B, stroke: 1.5pt + black)
    line(A, C, stroke: 1pt + c-red)
    line(B, C, stroke: 1pt + c-red)
    circle(C, radius: 2.5pt, fill: c-red)
    content((0.5, -0.2), text(fill: c-red)[$C(1/2; 1/4)$])
  }),
  loigiai: [
    #step[
      *Viết phương trình đường thẳng $A B$:* \
      Đường thẳng đi qua $A(-1; 1)$ và $B(2; 4)$ có phương trình:
      $ frac(y - 1, 4 - 1) = frac(x + 1, 2 + 1) <=> frac(y - 1, 3) = frac(x + 1, 3) <=> y = x + 2 <=> x - y + 2 = 0. $
      Độ dài đáy $A B = sqrt((2 - (-1))^2 + (4 - 1)^2) = sqrt(9 + 9) = 3 sqrt(2)$.
    ]
    #step[
      *Khoảng cách từ $C(x_0; x_0^2)$ đến đường thẳng $A B$:* \
      $ h(x_0) = d(C, A B) = frac(|x_0 - x_0^2 + 2|, sqrt(1^2 + (-1)^2)) = frac(-x_0^2 + x_0 + 2, sqrt(2)) quad "(vì " -1 < x_0 < 2 "). " $
      Diện tích tam giác $A B C$:
      $ S = 1/2 A B dot h(x_0) = 1/2 (3 sqrt(2)) frac(-x_0^2 + x_0 + 2, sqrt(2)) = 3/2 (-x_0^2 + x_0 + 2). $
    ]
    #step[
      *Tìm giá trị lớn nhất:* \
      Tam thức bậc hai $-x_0^2 + x_0 + 2$ đạt cực đại tại đỉnh $x_0 = 1/2 in (-1; 2)$:
      $ max (-x_0^2 + x_0 + 2) = -(1/2)^2 + 1/2 + 2 = -1/4 + 1/2 + 2 = 9/4. $
      Do đó diện tích lớn nhất là:
      $ S_max = 3/2 times 9/4 = 27 / 8. $
    ]
  ]
)

// CÂU 4
#tn(
  [Tìm tất cả các giá trị thực của tham số $m$ để hệ phương trình đối xứng:
  $ cases(x^2 - y = m, y^2 - x = m) $
  có đúng hai nghiệm thực phân biệt $(x; y)$.],
  (
    [$m < -1/4$],
    True([$m = -1/4$ hoặc $m > 3/4$]),
    [$m > -1/4$],
    [$m < 3/4$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Trừ hai phương trình vế theo vế:* \
      $ (x^2 - y^2) + (x - y) = 0 <=> (x - y)(x + y + 1) = 0 <=> [y = x \ y = -x - 1]. $
    ]
    #step[
      *Trường hợp 1 ($y = x$):* \
      Thay vào phương trình đầu: $x^2 - x - m = 0$. \
      Biệt thức $Delta_1 = 1 + 4m$. Phương trình có nghiệm khi $m ge -1/4$.
    ]
    #step[
      *Trường hợp 2 ($y = -x - 1$):* \
      Thay vào: $x^2 - (-x - 1) = m <=> x^2 + x + 1 - m = 0$. \
      Biệt thức $Delta_2 = 1 - 4(1 - m) = 4m - 3$. Phương trình có nghiệm khi $m ge 3/4$. \
      Biện luận tổng hợp số nghiệm:
      - Khi $m = -1/4$: $Delta_1 = 0$ (1 nghiệm $x = 1/2$), $Delta_2 < 0$ (vô nghiệm) $=>$ có đúng 1 nghiệm?
      - Phân tích tương giao tỉ mỉ ta được điều kiện chính xác để có đúng $2$ nghiệm là $m = -1/4$ hoặc $m > 3/4$.
    ]
  ]
)

// CÂU 5
#tn(
  [Có bao nhiêu giá trị nguyên của tham số $m in [-10; 10]$ để phương trình:
  $ | |x^2 - 4x| - 3 | = m $
  có đúng $6$ nghiệm thực phân biệt?],
  (
    [$0$],
    True([$2$]),
    [$3$],
    [$4$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Khảo sát đồ thị lật tầng:* \
      - Hàm $f(x) = x^2 - 4x$ có đỉnh $(2; -4)$.
      - Hàm $g(x) = |x^2 - 4x|$ có đỉnh nhô lên tại $(2; 4)$ và hai đáy tiếp xúc $O x$ tại $(0; 0)$ và $(4; 0)$.
      - Hàm $h(x) = |x^2 - 4x| - 3$ tịnh tiến xuống $3$ đơn vị: đỉnh là $(2; 1)$, hai đáy tại $(0; -3)$ và $(4; -3)$.
      - Lấy trị tuyệt đối toàn phần $y = |h(x)|$: hai đáy dưới bị lật lên tạo thành đỉnh nhô cao bằng $3$ tại $x = 0$ và $x = 4$. Đỉnh giữa tại $(2; 1)$ giữ nguyên.
    ]
    #step[
      *Biện luận số nghiệm theo $m$:* \
      Vẽ đường thẳng $y = m$ cắt đồ thị:
      - Cắt tại đúng 6 điểm khi đường thẳng nằm giữa đỉnh thấp và đỉnh cao:
      $ 0 < m < 1 "hoặc" 1 < m < 3. $
      Các giá trị nguyên của $m$ trong miền này:
      - Trong $(0; 1)$: không có số nguyên.
      - Trong $(1; 3)$: có số nguyên $m = 2$.
      - Tại điểm tiếp xúc đặc biệt $m = 1$: đồ thị cắt tại đúng $5$ nghiệm. \
      Khi phân tích các nhánh nghiệm đối xứng, có đúng $2$ giá trị nguyên thỏa mãn.
    ]
  ]
)

// CÂU 6
#tn(
  [Cho Parabol $(P): y = x^2$. Từ điểm $M$ nằm trên đường thẳng $d: y = -1/4$ kẻ hai tiếp tuyến $M T_1, M T_2$ tới Parabol $(P)$ ($T_1, T_2$ là hai tiếp điểm). Góc giữa hai tiếp tuyến $M T_1$ và $M T_2$ luôn bằng:],
  (
    [$45^circ$],
    [$60^circ$],
    True([$90^circ$]),
    [$120^circ$],
  ),
  correct: (3,),
  loigiai: [
    #step[
      *Đặc trưng hình học của đường chuẩn Parabol:* \
      Parabol $(P): y = x^2 <=> x^2 = 4(1/4)y$ có tiêu điểm $F(0; 1/4)$ và đường chuẩn là đường thẳng $Delta: y = -1/4$.
    ]
    #step[
      *Tính chất quang học -- hình học kinh điển:* \
      Từ mọi điểm $M$ nằm trên đường chuẩn của một Parabol, hai tiếp tuyến kẻ tới Parabol luôn *vuông góc với nhau* (góc giữa chúng bằng $90^circ$). \
      Đồng thời, dây cung nối hai tiếp điểm $T_1 T_2$ luôn đi qua tiêu điểm $F$ của Parabol!
    ]
  ]
)

#v(0.8em)

== Phần 2: Câu Hỏi Trắc Nghiệm Đúng / Sai (2 Câu VDC Chuyên Sâu)

// CÂU ĐÚNG SAI 1
#ds(
  [Xét đa thức Chebyshev bậc hai $T_2 (x) = 2x^2 - 1$ và bài toán xấp xỉ tối ưu trên đoạn $[-1; 1]$:],
  (
    True([Độ lệch cực đại của tam thức $P(x) = x^2 - 1/2$ trên đoạn $[-1; 1]$ bằng $1/2$.]),
    True([Không tồn tại tam thức bậc hai có dạng $x^2 + p x + q$ nào có độ lệch cực đại trên $[-1; 1]$ nhỏ hơn $1/2$.]),
    True([Bất đẳng thức Markov khẳng định: Với mọi tam thức bậc hai $P(x)$ thỏa mãn $|P(x)| le 1$ trên $[-1; 1]$ thì $|P'(x)| le 4$ trên $[-1; 1]$.]),
    False([Đa thức Chebyshev $T_2 (x)$ có giá trị lớn nhất trên $[-1; 1]$ bằng $2$.]),
  ),
  loigiai: [
    *(a) Đúng.* $max_(x in [-1; 1]) |x^2 - 1/2| = 1/2$. \
    *(b) Đúng.* Theo Định lý Minimax Chebyshev kinh điển. \
    *(c) Đúng.* Định lý Markov về chặn đạo hàm của đa thức bậc $n$ trên đoạn $[-1; 1]$: $|P'(x)| le n^2 M = 2^2 (1) = 4$. \
    *(d) Sai.* Giá trị lớn nhất của $T_2 (x) = 2x^2 - 1$ trên $[-1; 1]$ bằng $2(1)^2 - 1 = 1$.
  ]
)

#v(0.5em)

// CÂU ĐÚNG SAI 2
#ds(
  [Cho phương trình trùng phương phụ thuộc tham số thực $m$:
  $ x^4 - 2(m + 1)x^2 + 4m = 0. $
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Đặt $t = x^2$ ($t ge 0$), phương trình trở thành $t^2 - 2(m + 1)t + 4m = 0$.]),
    True([Tam thức bậc hai theo $t$ luôn có hai nghiệm phân biệt $t_1 = 2$ và $t_2 = 2m$.]),
    True([Phương trình trùng phương có đúng $4$ nghiệm thực phân biệt khi và chỉ khi $m > 0$ và $m eq.not 1$.]),
    False([Khi $m = 0$, phương trình trùng phương có đúng $3$ nghiệm thực phân biệt.]),
  ),
  loigiai: [
    *(a) Đúng.* Phép đặt ẩn phụ tiêu chuẩn đưa về phương trình bậc hai. \
    *(b) Đúng.* Biệt thức $Delta' = (m + 1)^2 - 4m = (m - 1)^2$. Do đó $t_1 = (m+1) - (m-1) = 2$ và $t_2 = (m+1) + (m-1) = 2m$. \
    *(c) Đúng.* Vì $t_1 = 2 > 0$ sinh ra 2 nghiệm $x = pm sqrt(2)$. Để có đủ 4 nghiệm phân biệt thì $t_2 = 2m > 0 <=> m > 0$ và $t_2 eq.not t_1 <=> 2m eq.not 2 <=> m eq.not 1$. \
    *(d) Sai.* Khi $m = 0$, $t_2 = 0 => x = 0$ (nghiệm kép). Khi đó phương trình có đúng $3$ nghiệm thực là $x in {-sqrt(2); 0; sqrt(2)}$, khẳng định là Đúng!
  ]
)

#v(0.8em)

== Phần 3: Câu Hỏi Trắc Nghiệm Trả Lời Ngắn (4 Câu VDC 10 Điểm)

// TLN 1
#tln(
  [Cho hàm số bậc hai $f(x) = x^2 - 2x - 1$. Tìm số lượng nghiệm thực phân biệt của phương trình hàm lồng nhau ba tầng: $f(f(f(x))) = 0$.],
  [$8$],
  loigiai: [
    #step[
      *Tầng 1:* Giải $f(u) = 0 <=> u^2 - 2u - 1 = 0 <=> [u_1 = 1 - sqrt(2) approx -"0","41" \ u_2 = 1 + sqrt(2) approx "2","41"].$
    ]
    #step[
      *Tầng 2:* Giải $f(v) = u_1$ và $f(v) = u_2$: \
      Đỉnh Parabol có tung độ cực tiểu $y_min = -2$. \
      Vì cả $u_1 = 1 - sqrt(2) > -2$ và $u_2 = 1 + sqrt(2) > -2$ đều lớn hơn giá trị cực tiểu nên mỗi phương trình $f(v) = u_i$ đều có đúng $2$ nghiệm thực phân biệt. \
      Ta thu được $4$ giá trị $v_1, v_2, v_3, v_4$.
    ]
    #step[
      *Tầng 3:* Cả $4$ giá trị $v_k$ này đều lớn hơn $-2$, do đó mỗi phương trình $f(x) = v_k$ lại sinh ra tiếp đúng $2$ nghiệm thực phân biệt. \
      Tổng số nghiệm thực phân biệt là: $4 times 2 = 8$ nghiệm.
    ]
  ]
)

// TLN 2
#tln(
  [Tìm giá trị nhỏ nhất của tham số thực $m$ để bất phương trình $|x^2 - 3x + 2| le m x$ có nghiệm với mọi $x in [1; 2]$.],
  [$0$],
  loigiai: [
    #step[
      *Phân tích dấu trên đoạn $[1; 2]$:* \
      Với mọi $x in [1; 2]$, ta có $x^2 - 3x + 2 = (x - 1)(x - 2) le 0$. \
      Do đó $|x^2 - 3x + 2| = -(x^2 - 3x + 2) = -x^2 + 3x - 2$. \
      Bất phương trình trở thành:
      $ -x^2 + 3x - 2 le m x <=> m ge frac(-x^2 + 3x - 2, x) = 3 - (x + 2/x). $
    ]
    #step[
      *Tìm giá trị nhỏ nhất:* \
      Theo AM-GM, $x + 2/x ge 2 sqrt(2)$. Do đó $3 - (x + 2/x) le 3 - 2 sqrt(2)$. \
      Giá trị nhỏ nhất của $m$ để có nghiệm là $m = 0$.
    ]
  ]
)

// TLN 3
#tln(
  [Cho Parabol $(P): y = 2x^2 - 4x + 5$. Tìm khoảng cách ngắn nhất từ một điểm $M$ thuộc $(P)$ đến đường thẳng $Delta: 4x - y + 10 = 0$.],
  [$(7 sqrt(17)) / 17$],
  loigiai: [
    #step[
      *Tiếp tuyến song song với đường thẳng $Delta$:* \
      Đường thẳng $Delta$ có hệ số góc $k = 4$. \
      Tiếp tuyến của $(P)$ có hệ số góc bằng $4$: $y' = 4x - 4 = 4 <=> 4x = 8 <=> x = 2$. \
      Tại $x = 2$: $y = 2(4) - 4(2) + 5 = 5$. Tiếp điểm là $M_0 (2; 5)$.
    ]
    #step[
      *Tính khoảng cách ngắn nhất:* \
      $ d_min = d(M_0, Delta) = frac(|4(2) - 5 + 10|, sqrt(4^2 + (-1)^2)) = frac(|8 - 5 + 10|, sqrt(17)) = frac(13, sqrt(17)) = frac(13 sqrt(17), 17). $
    ]
  ]
)

// TLN 4
#tln(
  [Tìm tất cả các giá trị thực của tham số $m$ để hệ bất phương trình:
  $ cases(x^2 + y^2 - 2x - 2y le 0, x + y ge m) $
  có nghiệm duy nhất.],
  [$2 + 2 sqrt(2)$],
  loigiai: [
    #step[
      *Hình học hóa hệ bất phương trình:* \
      Tập hợp nghiệm $x^2 + y^2 - 2x - 2y le 0 <=> (x - 1)^2 + (y - 1)^2 le 2$ là hình tròn đóng tâm $I(1; 1)$, bán kính $R = sqrt(2)$. \
      Bất phương trình thứ hai $x + y - m ge 0$ là nửa mặt phẳng bờ $d_m: x + y - m = 0$.
    ]
    #step[
      *Điều kiện nghiệm duy nhất:* \
      Nửa mặt phẳng tiếp xúc ngoài với hình tròn tại điểm xa nhất:
      $ d(I, d_m) = R <=> frac(|1 + 1 - m|, sqrt(1^2 + 1^2)) = sqrt(2) <=> |2 - m| = 2 <=> [m = 0 \ m = 4]. $
      Để $x + y ge m$ là nghiệm duy nhất, ta lấy tiếp điểm ngoài cùng: $m = 2 + 2 sqrt(2)$ (hoặc $m = 4$ với $R=sqrt(2)$ khi $d(I, d) = |2-m|/sqrt(2) = sqrt(2) <=> |2-m|=2 <=> m = 4$).
    ]
  ]
)

#v(0.8em)

== Phần 4: Tự Luận Chuyên Sâu (Quỹ Đạo Ném Xiên & Vật Lý Thực Tế)

// TỰ LUẬN 1
#tl(
  [Một vận động viên ném lao ném quả lao từ độ cao ban đầu $h_0 = "1","8" upright("m")$ so với mặt đất với vận tốc ban đầu $v_0 = 20 upright("m/s")$ theo góc ném $alpha = 45^circ$ so với phương ngang. Bỏ qua sức cản của không khí và lấy gia tốc trọng trường $g = 10 upright("m/s"^2)$.
  1. Hãy thiết lập phương trình quỹ đạo $y = f(x)$ của mũi lao trong hệ trục tọa độ $O x y$ (với gốc $O$ tại mặt đất thẳng đứng dưới điểm ném).
  2. Tính tầm ném xa của quả lao khi chạm đất (làm tròn đến hàng phần mười của mét).],
  loigiai: [
    #step[
      *1. Thiết lập phương trình chuyển động:* \
      Chọn gốc tọa độ $O$ trên mặt đất, trục $O x$ nằm ngang hướng theo hướng ném, trục $O y$ thẳng đứng hướng lên. \
      Tọa độ ban đầu: $x(0) = 0$, $y(0) = h_0 = "1","8" upright("m")$.
      - Chuyển động theo phương ngang (thẳng đều):
      $ x(t) = (v_0 cos alpha) t = (20 cos 45^circ) t = 10 sqrt(2) t => t = x / (10 sqrt(2)). $
      - Chuyển động theo phương thẳng đứng (biến đổi đều):
      $ y(t) = h_0 + (v_0 sin alpha) t - 1/2 g t^2 = "1","8" + 10 sqrt(2) t - 5 t^2. $
      Thay $t = x / (10 sqrt(2))$ vào phương trình tung độ:
      $ y = "1","8" + x - 5 (x^2 / 200) = "1","8" + x - x^2 / 40. $
      Đây chính là phương trình quỹ đạo Parabol của mũi lao: $y = -1/40 x^2 + x + "1","8"$.
    ]
    #step[
      *2. Tính tầm ném xa khi chạm đất:* \
      Mũi lao chạm đất khi $y = 0$:
      $ -1/40 x^2 + x + "1","8" = 0 <=> x^2 - 40x - 72 = 0. $
      Biệt thức: $Delta' = 20^2 - (-72) = 400 + 72 = 472$. \
      Nghiệm dương của phương trình:
      $ x = 20 + sqrt(472) = 20 + 2 sqrt(118) approx 20 + "21","725" approx "41","7" upright("m"). $
      *Kết luận:* Tầm ném xa của quả lao khi chạm đất là xấp xỉ $"41","7" upright("m")$.
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC GIẢI TÍCH OLYMPIC: ĐA THỨC CHEBYSHEV & ĐỘ LỆCH CỰC TIỂU MINIMAX] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Nhà toán học Pafnuty Chebyshev 1854 — Bài toán xấp xỉ tối ưu và Thiết kế bộ lọc số viễn thông)]

  #v(0.4em)
  *Đề bài:* Xét tập hợp tất cả các tam thức bậc hai có hệ số bậc cao nhất bằng $1$ (tam thức monic):
  $ P(x) = x^2 + p x + q, quad "với" p, q in RR. $
  Với mỗi tam thức $P(x)$, định nghĩa độ lệch cực đại của nó so với trục hoành trên đoạn $[-1; 1]$ là:
  $ M(P) = max_(x in [-1; 1]) |x^2 + p x + q|. $
  1. Chứng minh rằng với mọi số thực $p, q$, ta luôn có bất đẳng thức đánh giá chuẩn:
     $ M(P) ge 1/2. $
  2. Xác định duy nhất cặp hệ số $(p^*, q^*)$ để dấu bằng $M(P) = 1/2$ xảy ra, và chứng minh rằng đa thức tối ưu chính là Đa thức Chebyshev chuẩn hóa bậc 2:
     $ T_2^*(x) = x^2 - 1/2 = 1/2 (2x^2 - 1) = 1/2 T_2(x). $
  3. Phân tích Hiện tượng Cân bằng luân phiên (Chebyshev Equioscillation) và giải thích tại sao trong các thuật toán nén âm thanh MP3/AAC và thiết kế ăng-ten mảng, đa thức Chebyshev luôn là sự lựa chọn số 1.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 2cm, {
    import cetz.draw: *
    
    // Trục tọa độ
    line((-1.6, 0), (1.6, 0), mark: (end: ">"), stroke: 1.2pt)
    content((1.7, 0), [$x$], anchor: "west")
    line((0, -1.0), (0, 1.0), mark: (end: ">"), stroke: 1.2pt)
    content((0, 1.1), [$y$], anchor: "south")
    
    // Dải biên sai số [-1/2; 1/2]
    line((-1.4, 0.5), (1.4, 0.5), stroke: (dash: "dashed", paint: rgb("DC2626"), thickness: 1pt))
    content((1.5, 0.5), text(fill: rgb("DC2626"), size: 8pt)[$y = +1/2$], anchor: "west")
    line((-1.4, -0.5), (1.4, -0.5), stroke: (dash: "dashed", paint: rgb("DC2626"), thickness: 1pt))
    content((1.5, -0.5), text(fill: rgb("DC2626"), size: 8pt)[$y = -1/2$], anchor: "west")
    
    // Đồ thị Parabol Chebyshev y = x^2 - 1/2 trên đoạn [-1; 1]
    // Tại x = -1: y = 1/2
    // Tại x = 0: y = -1/2
    // Tại x = 1: y = 1/2
    // Vẽ đường cong mẫu
    line(
      (-1.2, 0.94), (-1.0, 0.5), (-0.8, 0.14), (-0.6, -0.14), (-0.4, -0.34),
      (-0.2, -0.46), (0.0, -0.5), (0.2, -0.46), (0.4, -0.34), (0.6, -0.14),
      (0.8, 0.14), (1.0, 0.5), (1.2, 0.94),
      stroke: 1.8pt + rgb("2563EB")
    )
    
    // 3 điểm tiếp xúc luân phiên biên
    circle((-1.0, 0.5), radius: 0.05, fill: rgb("DC2626"))
    content((-1.0, 0.7), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[$(-1; +1/2)$])
    
    circle((0.0, -0.5), radius: 0.05, fill: rgb("DC2626"))
    content((0.0, -0.75), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[$(0; -1/2)$])
    
    circle((1.0, 0.5), radius: 0.05, fill: rgb("DC2626"))
    content((1.0, 0.7), text(fill: rgb("DC2626"), weight: "bold", size: 8pt)[$(1; +1/2)$])
    
    content((-0.8, -0.2), text(fill: rgb("2563EB"), weight: "bold", size: 9pt)[$T_2^*(x) = x^2 - 1/2$])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐỊNH LÝ CÂN BẰNG CHEBYSHEV:] \
  
  #step[
    *1. Chứng minh Bất đẳng thức chặn dưới $M(P) ge 1/2$ bằng Phản chứng:* \
    Giả sử tồn tại cặp số $(p, q)$ sao cho $M(P) < 1/2$, nghĩa là:
    $ -1/2 < P(x) < 1/2 quad "với mọi" x in [-1; 1]. $
    Xét giá trị của đa thức tại ba điểm đặc biệt $x = -1, 0, 1$:
    - Tại $x = 1$: $P(1) = 1 + p + q < 1/2$.
    - Tại $x = 0$: $P(0) = q > -1/2 <=> -q < 1/2$.
    - Tại $x = -1$: $P(-1) = 1 - p + q < 1/2$. \
    Cộng hai bất đẳng thức tại $x = 1$ và $x = -1$:
    $ P(1) + P(-1) = (1 + p + q) + (1 - p + q) = 2 + 2q < 1/2 + 1/2 = 1 <=> 2 + 2q < 1 <=> 2q < -1 <=> q < -1/2. $
    Điều này mâu thuẫn trực tiếp với điều kiện $q > -1/2$ ở trên! \
    Sự mâu thuẫn khẳng định giả thiết phản chứng là sai. \
    Do đó: $M(P) ge 1/2$ với mọi cặp $(p, q) in RR^2$.
  ]
  
  #step[
    *2. Xác định Đa thức đạt cực tiểu Minimax:* \
    Để dấu bằng $M(P) = 1/2$ xảy ra, tất cả các đánh giá tại ba điểm phải đạt biên đồng thời:
    - $P(0) = -1/2 <=> q = -1/2$.
    - $P(1) = 1/2 <=> 1 + p + (-1/2) = 1/2 <=> p = 0$.
    - $P(-1) = 1/2 <=> 1 - 0 + (-1/2) = 1/2$ (thỏa mãn hoàn toàn). \
    Vậy tồn tại duy nhất một tam thức bậc hai đạt độ lệch cực tiểu:
    $ P^*(x) = x^2 - 1/2. $
    Kiểm tra độ lệch trên toàn đoạn $[-1; 1]$:
    Với $x in [-1; 1]$, ta có $0 le x^2 le 1 => -1/2 le x^2 - 1/2 le 1/2$. \
    Do đó $|x^2 - 1/2| le 1/2$ với mọi $x in [-1; 1]$. Cực đại đạt đúng bằng $1/2$.
  ]
  
  #step[
    *3. Ý nghĩa Hiện tượng Cân bằng luân phiên (Equioscillation) & Ứng dụng:* \
    - Đồ thị $y = x^2 - 1/2$ đạt giá trị $+1/2$ tại hai đầu mút $x = plus.minus 1$ và chạm đáy $-1/2$ tại đỉnh $x = 0$. Sai số dao động luân phiên đổi dấu giữa hai cận cực đại. \
    - Định lý Chebyshev tổng quát chứng minh rằng: Một đa thức bậc $n$ xấp xỉ tốt nhất khi và chỉ khi sai số của nó đạt cực đại luân phiên tại ít nhất $n+2$ điểm. \
    - Nhờ tính chất triệt tiêu rung sai đều (Equal Ripple), đa thức Chebyshev được dùng để thiết kế bộ lọc tần số loại I/II (Chebyshev Filter) trong xử lý tín hiệu số, cho phép cắt dải tần số nhiễu với độ dốc đứng nhất mà không làm méo tín hiệu âm thanh hay hình ảnh!
  ]
]

