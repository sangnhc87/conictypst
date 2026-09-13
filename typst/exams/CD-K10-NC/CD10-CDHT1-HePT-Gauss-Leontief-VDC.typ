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
  stroke: (left: 3pt + rgb("0E7490")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("0E7490"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0284C7")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Hệ phương trình - Gauss - Leontief
#let c-slate-dark = rgb("0F172A")
#let c-cyan-dark = rgb("0369A1")
#let c-cyan = rgb("0284C7")
#let c-teal = rgb("0D9488")
#let c-blue = rgb("2563EB")
#let c-red = rgb("DC2626")
#let c-bg-cyan = rgb("F0F9FF")
#let c-border = rgb("BAE6FD")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-cyan,
    stroke: (
      left: 6pt + c-cyan-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-cyan-dark)[
      CHUYÊN ĐỀ VẬN DỤNG CAO: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN,\
      THUẬT TOÁN GAUSS & MÔ HÌNH INPUT-OUTPUT LEONTIEF
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("4B5563"))[
      Chuyên đề học tập 1 Toán 10 (GDPT 2018) -- Phân loại ma trận bậc thang, biện luận tham số,\
      cân bằng mạng dòng điện Kirchhoff, cân bằng phản ứng hóa học & kinh tế Leontief
    ]
  ]
]

#v(1em)

= PHẦN I: CƠ SỞ ĐẠI SỐ TUYẾN TÍNH & CÁC ĐỊNH LÝ CỐT LÕI

== 1. Biểu diễn ma trận mở rộng và phép biến đổi sơ cấp dòng (Gauss-Jordan)

Xét hệ phương trình bậc nhất ba ẩn tổng quát:
$
cases(
  a_11 x + a_12 y + a_13 z = b_1,
  a_21 x + a_22 y + a_23 z = b_2,
  a_31 x + a_32 y + a_33 z = b_3
) <==> A X = B
$
trong đó $A$ là ma trận hệ số, $X = mat(delim: "[", x; y; z)$, $B = mat(delim: "[", b_1; b_2; b_3)$. Ma trận mở rộng ký hiệu là:
$
(A | B) = mat(delim: "(",
  a_11, a_12, a_13, b_1;
  a_21, a_22, a_23, b_2;
  a_31, a_32, a_33, b_3
)
$
- *Ba phép biến đổi sơ cấp dòng trên ma trận mở rộng* (bảo toàn tập nghiệm của hệ):
  + Đổi chỗ hai dòng: $d_i <-> d_j$.
  + Nhân một dòng với một hằng số $k != 0$: $d_i -> k d_i$.
  + Cộng vào một dòng một bội số của dòng khác: $d_i -> d_i + k d_j$.

== 2. Dạng ma trận bậc thang và điều kiện số nghiệm

Ma trận được gọi là *bậc thang* nếu số phần tử $0$ liên tiếp tính từ bên trái ở mỗi dòng tăng nghiêm ngặt theo từng dòng (trừ các dòng toàn $0$ nếu có ở dưới cùng).
Sau khi khử Gauss đưa $(A|B)$ về dạng bậc thang:
$
mat(delim: "(",
  p_1, *, *, q_1;
  0, p_2, *, q_2;
  0, 0, p_3, q_3
) quad (p_1, p_2 != 0)
$
- *Hệ có nghiệm duy nhất*: Khi $p_3 != 0$. Lúc này giải ngược từ dưới lên: $z = q_3 / p_3$, thế lên tìm $y$ và $x$.
- *Hệ vô nghiệm*: Khi xuất hiện dòng có dạng $(0, 0, 0 | q)$ với $q != 0$ (phương trình $0x + 0y + 0z = q != 0$).
- *Hệ vô số nghiệm*: Khi dòng cuối có dạng $(0, 0, 0 | 0)$ và $p_1, p_2 != 0$ (hệ bậc thang rút gọn thành 2 phương trình độc lập với 3 ẩn). Nghiệm phụ thuộc vào 1 ẩn tự do (ví dụ đặt $z = t in RR$).

== 3. Định luật Kirchhoff trong mạng lưới điện phức tạp

- *Định luật Kirchhoff về dòng điện (KCL - Node Law)*: Tại mỗi nút mạng (giao điểm các dây dẫn), tổng cường độ dòng điện đi vào bằng tổng cường độ dòng điện đi ra:
  $ sum I_("vào") = sum I_("ra") $
- *Định luật Kirchhoff về điện áp (KVL - Loop Law)*: Dọc theo một vòng kín bất kỳ (mắt lưới), tổng đại số các suất điện động bằng tổng đại số các độ sụt thế $I R$:
  $ sum cal(E) = sum I R $

== 4. Mô hình kinh tế cân bằng Input-Output Leontief (Mô hình mở)

Giả sử nền kinh tế có 3 ngành sản xuất tương hỗ. Gọi:
- $X = mat(delim: "[", x_1; x_2; x_3)$ là vectơ tổng sản lượng đầu ra của 3 ngành.
- $D = mat(delim: "[", d_1; d_2; d_3)$ là vectơ cầu cuối cùng từ thị trường bên ngoài (tiêu dùng cá nhân, đầu tư, xuất khẩu).
- $A = [a_(i j)]_(3 times 3)$ là ma trận hệ số kỹ thuật đầu vào (Input-Output Matrix), trong đó $a_(i j)$ là giá trị sản phẩm ngành $i$ cần thiết để sản xuất ra một đơn vị giá trị sản phẩm của ngành $j$.
- Khi đó, phương trình cân bằng kinh tế Leontief là:
  $ X = A X + D <==> (I - A) X = D $
  trong đó $I = mat(delim: "[", 1, 0, 0; 0, 1, 0; 0, 0, 1)$ là ma trận đơn vị cấp 3.

== 5. Nguồn gốc lịch sử & Các hướng mở rộng cao cấp

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0369A1"), right: 0.5pt + rgb("CBD5E1"), top: 0.5pt + rgb("CBD5E1"), bottom: 0.5pt + rgb("CBD5E1")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: c-cyan-dark)[a) Nguồn gốc lịch sử: Từ Cửu chương toán thuật đến Gauss và Leontief:]
  - *Cửu chương toán thuật (Nine Chapters on the Mathematical Art - thế kỷ 2 TCN)*: Chương 8 mang tên *Phương trình* (Fangcheng) là tài liệu cổ nhất trong lịch sử nhân loại mô tả chính xác ma trận số và quy tắc khử dòng tương đương để giải hệ phương trình bậc nhất 3 ẩn (xuất hiện trước phương Tây hơn 1500 năm).
  - *Carl Friedrich Gauss (1777--1855)*: Năm 1801, nhà thiên văn học Giuseppe Piazzi phát hiện tiểu hành tinh Ceres nhưng sớm mất dấu khi nó đi vào vùng chói sáng của Mặt Trời. Dựa trên một số ít tọa độ quan sát, Gauss đã sáng tạo ra phương pháp bình phương tối thiểu và thuật toán khử ma trận Gauss để tái lập chính xác quỹ đạo elip của Ceres, đưa Ceres trở lại tầm quan sát của các kính viễn vọng thế giới!
  - *Wassily Leontief (1905--1999)*: Phát triển Mô hình Cân bằng Liên ngành Input-Output năm 1936 để phân tích sự phụ thuộc qua lại giữa các khu vực của nền kinh tế Mỹ. Công trình này đã đem lại cho ông Giải Nobel Kinh tế năm 1973.

  #v(0.4em)
  #text(weight: "bold", fill: c-cyan-dark)[b) Hướng mở rộng 1: Định lý Frobenius-Perron & Tính khả sinh của nền kinh tế:]
  - Làm sao biết một nền kinh tế có thể sản xuất đủ hàng hóa hay sẽ bị suy thoái phá sản?
  - *Định lý Frobenius-Perron*: Ma trận hệ số kỹ thuật $A ge 0$ được gọi là *khả sinh (Productive)* nếu tồn tại sản lượng $X > 0$ sao cho $(I - A)X > 0$. Điều kiện cần và đủ là bán kính phổ của $A$ thỏa mãn $rho(A) < 1$.
  - Khi đó, nghịch đảo $(I - A)^(-1)$ luôn tồn tại và khai triển được dưới dạng *Chuỗi Neumann*:
    $ (I - A)^(-1) = I + A + A^2 + A^3 + dots ge 0 $
    Mỗi số hạng $A^k$ phản ánh chu kỳ cung ứng trung gian thứ $k$ của nền kinh tế!

  #v(0.4em)
  #text(weight: "bold", fill: c-cyan-dark)[c) Hướng mở rộng 2: Thuật toán PageRank của Google & Ma trận Markov khổng lồ:]
  - Năm 1998, hai nhà sáng lập Google *Larry Page* và *Sergey Brin* đã mô hình hóa toàn bộ mạng Internet toàn cầu thành một hệ phương trình tuyến tính khổng lồ với hàng tỷ ẩn số:
    $ p = (d P + frac(1 - d, N) E) p $
    Vector $p$ (độ uy tín PageRank của mỗi website) chính là nghiệm của hệ phương trình bậc nhất phân bố dừng, được giải bằng phương pháp lặp lùi Gauss-Seidel trên các cụm máy chủ phân tán.
]

#v(1em)

= PHẦN II: 4 DẠNG TOÁN VẬN DỤNG CAO VÀ PHƯƠNG PHÁP GIẢI

== Dạng 1: Biện luận hệ phương trình bậc nhất ba ẩn theo tham số $m$
- *Bản chất*: Lập ma trận mở rộng $(A|B)$, thực hiện các phép biến đổi dòng khéo léo để đưa về dạng bậc thang mà phần tử trục xoay không phụ thuộc hoặc phụ thuộc đơn giản vào $m$.
- *Bẫy kinh điển*: Chia cho biểu thức chứa $m$ khi chưa xét điều kiện bằng $0$. Cần cô lập tham số vào dòng cuối cùng.

== Dạng 2: Cân bằng mạng lưới dòng điện đa mắt lưới và đa nguồn
- *Bản chất*: Thiết lập hệ phương trình gồm $n-1$ phương trình nút và $m$ phương trình mắt lưới độc lập.
- *Kỹ năng đỉnh cao*: Quy ước chiều dòng điện giả định. Nếu nghiệm ra $I_k < 0$, chiều dòng điện thực tế ngược với chiều giả định.

== Dạng 3: Cân bằng phương trình phản ứng Oxi hóa - Khử phức tạp
- *Bản chất*: Đặt các hệ số phản ứng là $x, y, z, ...$ Lập hệ phương trình bảo toàn nguyên tố (Conservation of Mass).
- *Phương pháp*: Dùng khử Gauss giải hệ vô số nghiệm phụ thuộc vào $t$, chọn nghiệm nguyên dương nhỏ nhất.

== Dạng 4: Phân tích cân bằng mô hình Leontief & Biến động cầu ngoại sinh
- *Bản chất*: Lập ma trận phụ thuộc $(I - A)$, dùng phương pháp Gauss tìm vectơ sản lượng tổng $X$ theo vectơ cầu $D$.
- *Đánh giá*: Tính tỷ lệ giá trị gia tăng (Value Added) của từng ngành: $v_j = 1 - sum_(i=1)^3 a_(i j)$.

#v(1em)

= PHẦN III: BÀI TẬP MẪU CÓ LỜI GIẢI SƯ PHẠM CHI TIẾT

// ── BÀI MẪU 1 ─────────────────────────────────────────────────
#tl(
  [*(Khử Gauss ma trận Vandermonde 3 ẩn & Nội suy Lagrange)*\
  Cho ba số thực đôi một khác nhau $a, b, c$ ($a != b, b != c, c != a$) và số thực $d$. Xét hệ phương trình bậc nhất ba ẩn:
  $
  cases(
    x + y + z = 1,
    a x + b y + c z = d,
    a^2 x + b^2 y + c^2 z = d^2
  )
  $
  1. Sử dụng thuật toán Khử Gauss đưa ma trận mở rộng $(A|B)$ về dạng bậc thang, chứng minh rằng hệ luôn có nghiệm duy nhất với mọi $d in RR$.
  2. Biểu diễn tường minh nghiệm $x, y, z$ dưới dạng tích các phân thức chứa $a, b, c, d$ và giải thích mối liên hệ với Đa thức nội suy Lagrange.],
  loigiai: [
    #step[
      *Bước 1: Lập ma trận mở rộng và khử bậc thang dòng 1:* \
      Ma trận mở rộng của hệ là ma trận khối Vandermonde:
      $
      (A|B) = mat(delim: "(",
        1, 1, 1, 1;
        a, b, c, d;
        a^2, b^2, c^2, d^2
      )
      $
      Thực hiện hai phép biến đổi dòng: $d_2 -> d_2 - a d_1$ và $d_3 -> d_3 - a^2 d_1$:
      $
      mat(delim: "(",
        1, 1, 1, 1;
        0, b - a, c - a, d - a;
        0, b^2 - a^2, c^2 - a^2, d^2 - a^2
      )
      $
    ]

    #step[
      *Bước 2: Khử bậc thang dòng 2 để cô lập phần tử trục xoay dòng 3:* \
      Nhận xét: $b^2 - a^2 = (b - a)(b + a)$. Do $b != a$, ta nhân dòng 2 với $(b + a)$ rồi trừ khỏi dòng 3:
      $ d_3 -> d_3 - (b + a) d_2 $
      - Phần tử tại cột 2 trở thành: $(b^2 - a^2) - (b + a)(b - a) = 0$.
      - Phần tử tại cột 3:
        $ (c^2 - a^2) - (b + a)(c - a) = (c - a)[(c + a) - (b + a)] = (c - a)(c - b). $
      - Phần tử vế phải:
        $ (d^2 - a^2) - (b + a)(d - a) = (d - a)[(d + a) - (b + a)] = (d - a)(d - b). $
      Ta thu được ma trận bậc thang chuẩn tắc:
      $
      mat(delim: "(",
        1, 1, 1, 1;
        0, b - a, c - a, d - a;
        0, 0, (c - a)(c - b), (d - a)(d - b)
      )
      $
    ]

    #step[
      *Bước 3: Giải ngược và tìm nghiệm tường minh:* \
      Vì $a, b, c$ đôi một khác nhau nên $(c - a)(c - b) != 0$. Từ dòng 3:
      $ z = frac((d - a)(d - b), (c - a)(c - b)). $
      Thế $z$ vào dòng 2: $(b - a) y + (c - a) z = d - a$:
      $
      (b - a) y = (d - a) - (c - a) frac((d - a)(d - b), (c - a)(c - b)) = (d - a) [1 - frac(d - b, c - b)] = (d - a) frac(c - d, c - b) = - frac((d - a)(d - c), c - b)
      $
      Chia hai vế cho $(b - a)$:
      $ y = frac((d - a)(d - c), (b - a)(b - c)). $
      Tương tự, thế vào dòng 1 ta tìm được:
      $ x = frac((d - b)(d - c), (a - b)(a - c)). $
      *Bản chất toán học:* Nghiệm $(x, y, z)$ chính là các hệ số nội suy Lagrange của đa thức bậc hai $P(t)$ thỏa mãn $P(a) = P(b) = P(c) = 1$ khi khảo sát sự phân rã $t^k$ trên cơ sở Lagrange $\{L_a(t), L_b(t), L_c(t)\}$.
    ]
  ]
)

#v(0.8em)

// ── BÀI MẪU 2 ─────────────────────────────────────────────────
#tl(
  [*(Mô hình Input-Output Leontief: Ma trận nghịch đảo & Số nhân kinh tế)*\
  Xét nền kinh tế 3 ngành: Nông nghiệp ($S_1$), Công nghiệp ($S_2$) và Dịch vụ ($S_3$). Ma trận hệ số kỹ thuật đầu vào là:
  $
  A = mat(delim: "[",
    "0,2", "0,2", "0,1";
    "0,1", "0,3", "0,2";
    "0,2", "0,1", "0,2"
  )
  $
  1. Tìm ma trận nghịch đảo Leontief $B = (I - A)^(-1)$ bằng thuật toán khử Gauss-Jordan trên ma trận khối $(I - A | I)$.
  2. Giả sử nhu cầu cuối cùng ban đầu là $D_0 = mat(delim: "[", 100; 150; 80)$ (triệu USD). Nếu ngành Công nghiệp đẩy mạnh xuất khẩu khiến cầu ngoại sinh tăng thêm $Delta D = mat(delim: "[", 0; 50; 0)$ thì tổng sản lượng của mỗi ngành thay đổi như thế nào?],
  loigiai: [
    #step[
      *Bước 1: Thiết lập ma trận $(I - A)$:* \
      $
      I - A = mat(delim: "[",
        1 - "0,2", - "0,2", - "0,1";
        - "0,1", 1 - "0,3", - "0,2";
        - "0,2", - "0,1", 1 - "0,2"
      ) = mat(delim: "[",
        "0,8", - "0,2", - "0,1";
        - "0,1", "0,7", - "0,2";
        - "0,2", - "0,1", "0,8"
      ) = frac(1, 10) mat(delim: "[",
        8, -2, -1;
        -1, 7, -2;
        -2, -1, 8
      )
      $
      Để tìm nghịch đảo, ta khử Gauss-Jordan trên ma trận số nguyên $M = mat(delim: "[", 8, -2, -1; -1, 7, -2; -2, -1, 8)$.
    ]

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        let S1 = (0, 1.8)
        let S2 = (-2.5, -1.2)
        let S3 = (2.5, -1.2)

        line((0.3, 1.3), (-1.9, -0.8), mark: (end: ">"), stroke: 1.2pt + c-cyan)
        line((-2.1, -0.6), (-0.1, 1.5), mark: (end: ">"), stroke: 1.2pt + c-cyan)
        line((-1.5, -1.4), (1.5, -1.4), mark: (end: ">"), stroke: 1.2pt + c-cyan)
        line((1.5, -1.0), (-1.5, -1.0), mark: (end: ">"), stroke: 1.2pt + c-cyan)
        line((-0.1, 1.5), (2.1, -0.6), mark: (end: ">"), stroke: 1.2pt + c-cyan)
        line((1.9, -0.8), (-0.3, 1.3), mark: (end: ">"), stroke: 1.2pt + c-cyan)

        circle(S1, radius: 0.8, fill: rgb("E0F2FE"), stroke: 2pt + c-cyan-dark)
        circle(S2, radius: 0.8, fill: rgb("E0F2FE"), stroke: 2pt + c-cyan-dark)
        circle(S3, radius: 0.8, fill: rgb("E0F2FE"), stroke: 2pt + c-cyan-dark)

        content(S1, text(size: 8pt, weight: "bold", fill: c-cyan-dark)[Ngành 1\ Nông nghiệp])
        content(S2, text(size: 8pt, weight: "bold", fill: c-cyan-dark)[Ngành 2\ Công nghiệp])
        content(S3, text(size: 8pt, weight: "bold", fill: c-cyan-dark)[Ngành 3\ Dịch vụ])

        line((0, 2.6), (0, 3.4), mark: (end: ">"), stroke: 1.5pt + c-red)
        content((0, 3.65), text(size: 8pt, fill: c-red, weight: "bold")[$d_1 = 100$])

        line((-3.3, -1.2), (-4.1, -1.2), mark: (end: ">"), stroke: 1.5pt + c-red)
        content((-4.8, -1.2), text(size: 8pt, fill: c-red, weight: "bold")[$d_2 + Delta d_2$])

        line((3.3, -1.2), (4.1, -1.2), mark: (end: ">"), stroke: 1.5pt + c-red)
        content((4.6, -1.2), text(size: 8pt, fill: c-red, weight: "bold")[$d_3 = 80$])

        content((0, -2.2), text(size: 8pt, style: "italic", fill: c-cyan-dark)[Sơ đồ mạng luồng Leontief: Phản ứng dây chuyền lan tỏa qua ma trận số nhân $(I - A)^(-1)$])
      })
    ]

    #step[
      *Bước 2: Tìm nghịch đảo $(I - A)^(-1)$:* \
      Tính định thức:
      $
      det(10(I - A)) = 8(56 - 2) - (-2)(-8 - 4) + (-1)(1 - (-14)) = 432 - 24 - 15 = 393.
      $
      Ma trận phần phụ đại số chuyển vị (adjugate matrix) của $10(I - A)$:
      $
      "adj"(10(I - A)) = mat(delim: "[",
        54, 17, 11;
        12, 62, 17;
        15, 12, 54
      )
      $
      Do $(I - A) = frac(1, 10) [10(I - A)]$, ta có ma trận số nhân Leontief:
      $
      (I - A)^(-1) = frac(10, 393) mat(delim: "[",
        54, 17, 11;
        12, 62, 17;
        15, 12, 54
      ) approx mat(delim: "[",
        "1,374", "0,433", "0,280";
        "0,305", "1,578", "0,433";
        "0,382", "0,305", "1,374"
      )
      $
    ]

    #step[
      *Bước 3: Phân tích số nhân kinh tế khi cầu thay đổi:* \
      Sự gia tăng tổng sản lượng $Delta X$ của các ngành được xác định bởi:
      $
      Delta X = (I - A)^(-1) Delta D = (I - A)^(-1) mat(delim: "[", 0; 50; 0) = 50 times "cột 2 của " (I - A)^(-1)
      $
      $
      Delta X = frac(500, 393) mat(delim: "[", 17; 62; 12) = mat(delim: "[",
        frac(8500, 393);
        frac(31000, 393);
        frac(6000, 393)
      ) approx mat(delim: "[",
        "21,63";
        "78,88";
        "15,27"
      ) quad text("(triệu USD)")
      $
      *Kết luận:* Nhu cầu xuất khẩu của công nghiệp tăng $50$ triệu USD không chỉ làm tăng sản lượng công nghiệp thêm $"78,88"$ triệu USD (số nhân $"1,578"$), mà còn kích thích sản lượng nông nghiệp tăng $"21,63"$ triệu USD và dịch vụ tăng $"15,27"$ triệu USD thông qua chuỗi cung ứng liên ngành!
    ]
  ]
)

#v(1em)

= PHẦN IV: BÀI TẬP TỰ LUYỆN VDC ĐẲNG CẤP OLYMPIC & TST

== 1. Trắc nghiệm nhiều lựa chọn (4 phương án)

// CÂU 1
#tn(
  [*(Hệ phương trình tuần hoàn Circulant)*\
  Cho hệ phương trình bậc nhất ba ẩn có tính đối xứng vòng tròn sau với tham số thực $a$:
  $
  cases(
    a x + y + z = 1,
    x + a y + z = a,
    x + y + a z = a^2
  )
  $
  Tìm tất cả các giá trị của tham số $a$ để hệ phương trình đã cho có *vô số nghiệm*.],
  (
    [$a = -2$],
    True([$a = 1$]),
    [$a = 1$ hoặc $a = -2$],
    [Không tồn tại $a$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Cộng ba phương trình và biến đổi dòng:* \
      Cộng từng vế cả ba phương trình của hệ:
      $ (a + 2)(x + y + z) = a^2 + a + 1 $
      Lập ma trận mở rộng và khử Gauss:
      $
      (A|B) = mat(delim: "(",
        a, 1, 1, 1;
        1, a, 1, a;
        1, 1, a, a^2
      ) -> mat(delim: "(",
        1, 1, a, a^2;
        1, a, 1, a;
        a, 1, 1, 1
      )
      $
      Thực hiện $d_2 -> d_2 - d_1$ và $d_3 -> d_3 - a d_1$:
      $
      mat(delim: "(",
        1, 1, a, a^2;
        0, a - 1, 1 - a, a - a^2;
        0, 1 - a, 1 - a^2, 1 - a^3
      )
      $
      - Nếu $a = 1$: ma trận trở thành dòng 1 là $(1, 1, 1, 1)$, hai dòng dưới toàn $0$. Hệ rút gọn thành $x + y + z = 1$, có *vô số nghiệm* phụ thuộc hai ẩn tự do.
      - Nếu $a = -2$: $(a + 2)(x + y + z) = 0$, nhưng vế phải $(-2)^2 + (-2) + 1 = 3 != 0 =>$ Hệ *vô nghiệm*.
      - Nếu $a cancel(in) {1, -2}$: Hệ có *nghiệm duy nhất*.
      Do đó chỉ có duy nhất $a = 1$ làm hệ có vô số nghiệm.
    ]
  ]
)

// CÂU 2
#tn(
  [*(Mạng mạch cầu Wheatstone không cân bằng)*\
  Cho mạch điện cầu Wheatstone nối vào nguồn điện một chiều không đổi $U = 22 "V"$. Các điện trở nhánh lần lượt là $R_1 = 1 Omega, R_2 = 2 Omega, R_3 = 3 Omega, R_4 = 4 Omega$ và điện trở cầu $R_5 = 5 Omega$ nối giữa nút $C$ và nút $D$. Dùng định luật Kirchhoff, người ta thiết lập được hệ phương trình bảo toàn dòng tại các nút và mắt lưới. Cường độ dòng điện $I_5$ chạy qua điện trở cầu $R_5$ có độ lớn bằng:],
  (
    [$frac(1, 13) "A"$],
    True([$frac(2, 13) "A"$]),
    [$frac(4, 13) "A"$],
    [$0 "A"$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    rect((-2.5, -1.5), (2.5, 1.5), stroke: 1.2pt + c-cyan-dark)
    line((-2.5, 0), (0, 1.5), stroke: 1.2pt + c-cyan-dark)
    line((-2.5, 0), (0, -1.5), stroke: 1.2pt + c-cyan-dark)
    line((0, 1.5), (2.5, 0), stroke: 1.2pt + c-cyan-dark)
    line((0, -1.5), (2.5, 0), stroke: 1.2pt + c-cyan-dark)
    line((0, 1.5), (0, -1.5), stroke: 1.5pt + c-red)
    circle((0, 1.5), radius: 0.12, fill: c-red)
    circle((0, -1.5), radius: 0.12, fill: c-red)
    content((0, 1.85), text(size: 8pt, fill: c-red, weight: "bold")[Nút C])
    content((0, -1.85), text(size: 8pt, fill: c-red, weight: "bold")[Nút D])
    content((-1.5, 1.0), text(size: 8pt)[$R_1$])
    content((-1.5, -1.0), text(size: 8pt)[$R_2$])
    content((1.5, 1.0), text(size: 8pt)[$R_3$])
    content((1.5, -1.0), text(size: 8pt)[$R_4$])
    content((0.4, 0), text(size: 8pt, fill: c-red)[$R_5$])
  }),
  loigiai: [
    #step[
      *Thiết lập hệ Kirchhoff và khử ma trận:* \
      Cầu Wheatstone không cân bằng vì $R_1 R_4 = 1 times 4 = 4 != R_2 R_3 = 2 times 3 = 6$. \
      Gọi thế điện thế tại hai cực nguồn là $V_A = 22 "V"$, $V_B = 0 "V"$. \
      Viết phương trình điện thế nút (KCL) cho hai nút $C$ và $D$:
      - Tại nút $C$: $frac(V_A - V_C, R_1) = frac(V_C - V_B, R_3) + frac(V_C - V_D, R_5)$
        $ <=> frac(22 - V_C, 1) = frac(V_C, 3) + frac(V_C - V_D, 5) <=> (1 + 1/3 + 1/5) V_C - 1/5 V_D = 22 <=> 23 V_C - 3 V_D = 330. $
      - Tại nút $D$: $frac(V_A - V_D, R_2) + frac(V_C - V_D, R_5) = frac(V_D - V_B, R_4)$
        $ <=> frac(22 - V_D, 2) + frac(V_C - V_D, 5) = frac(V_D, 4) <=> 1/5 V_C - (1/2 + 1/5 + 1/4) V_D = -11 <=> 4 V_C - 19 V_D = -220. $
      Giải hệ hai ẩn bậc nhất:
      $
      cases(
        23 V_C - 3 V_D = 330,
        4 V_C - 19 V_D = -220
      ) => V_C = 16 "V", quad V_D = 15 "V" - "0,2" = frac(190, 13) "V".
      $
      Dòng qua điện trở cầu $R_5$:
      $ I_5 = frac(|V_C - V_D|, R_5) = frac(2, 13) "A". $
    ]
  ]
)

// CÂU 3
#tn(
  [*(Không gian nghiệm Kernel: Cân bằng Oxi hóa - Khử đa tâm phản ứng)*\
  Xét phản ứng oxi hóa - khử phức tạp sau giữa khoáng vật chalcopyrite ($"CuFeS"_2$) với dung dịch axit nitric đặc nóng:
  $ x "CuFeS"_2 + y "HNO"_3 -> z "Cu"("NO"_3)_2 + u "Fe"("NO"_3)_3 + v "H"_2"SO"_4 + w "NO" + t "H"_2"O" $
  Sử dụng đại số tuyến tính tìm không gian nghiệm nguyên dương tối giản $(x, y, z, u, v, w, t)$. Tổng tất cả các hệ số phản ứng sau khi cân bằng tối giản $S = x + y + z + u + v + w + t$ bằng:],
  (
    [$72$],
    True([$86$]),
    [$94$],
    [$108$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Bản chất đại số tuyến tính & Bảo toàn e:* \
      Trong phân tử $"CuFeS"_2$, số oxi hóa trung bình là $"Cu"^(+2), "Fe"^(+2), "S"^(-2)$. \
      Quá trình nhường electron:
      $ "CuFeS"_2 -> "Cu"^(+2) + "Fe"^(+3) + 2"S"^(+6) + 17e times 3 $
      Quá trình nhận electron của $"HNO"_3$:
      $ "N"^(+5) + 3e -> "N"^(+2) ("NO") times 17 $
      Do đó tỉ lệ phản ứng là $x = 3 => w = 17$. \
      Bảo toàn nguyên tố:
      - $"Cu": z = x = 3$.
      - $"Fe": u = x = 3$.
      - $"S": v = 2x = 6$.
      - $"N": y = 2z + 3u + w = 2(3) + 3(3) + 17 = 6 + 9 + 17 = 32$ (axit tạo muối) $+ 8 = 40$.
      - $"H": 2t + 2v = y <=> 2t + 2(6) = 40 => 2t = 28 => t = 14$.
      Bộ hệ số tối giản là: $(x, y, z, u, v, w, t) = (3, 40, 3, 3, 6, 17, 14)$. \
      Tổng các hệ số: $S = 3 + 40 + 3 + 3 + 6 + 17 + 14 = 86$.
    ]
  ]
)

// CÂU 4
#tn(
  [*(Điều kiện khả sinh Hawkins-Simon trong mô hình Leontief)*\
  Cho ma trận hệ số kỹ thuật của nền kinh tế 2 ngành phụ thuộc tham số $k ge 0$:
  $ A = mat(delim: "[", "0,4", "0,2"; k, "0,3") $
  Theo Định lý Hawkins-Simon, nền kinh tế có khả năng tự duy trì sản xuất và đáp ứng nhu cầu ngoại sinh dương bất kỳ ($exists X > 0: (I - A)X > 0$) khi và chỉ khi tham số $k$ thỏa mãn điều kiện nào sau đây?],
  (
    [$k < "1,5"$],
    True([$0 <= k < "2,1"$]),
    [$k > "2,1"$],
    [$0 <= k < "0,7"$],
  ),
  correct: (2,),
  loigiai: [
    #step[
      *Định lý Hawkins-Simon & Bán kính phổ:* \
      Ma trận công nghệ Leontief:
      $
      I - A = mat(delim: "[",
        1 - "0,4", - "0,2";
        - k, 1 - "0,3"
      ) = mat(delim: "[",
        "0,6", - "0,2";
        - k, "0,7"
      )
      $
      Để ma trận nghịch đảo $(I - A)^(-1) >= 0$ (nền kinh tế khả sinh), điều kiện cần và đủ là các định thức con chính đầu tiên phải dương nghiêm ngặt:
      1. $Delta_1 = "0,6" > 0$ (luôn thỏa mãn).
      2. $Delta_2 = det(I - A) = ("0,6")("0,7") - (- "0,2")(- k) = "0,42" - "0,2" k > 0$.
      Suy ra:
      $ "0,2" k < "0,42" <=> k < frac("0,42", "0,2") = "2,1". $
      Kết hợp điều kiện thực tế $k ge 0$, ta có $0 <= k < "2,1"$.
    ]
  ]
)

== 2. Trắc nghiệm Đúng/Sai (Đa ý)

// CÂU ĐÚNG SAI 1
#ds(
  [*(Hệ phương trình ma trận Hilbert $H_3$ & Hiện tượng Điều kiện xấu Ill-conditioned)*\
  Ma trận Hilbert cấp 3 được định nghĩa bởi $H_3 = [frac(1, i + j - 1)]_(3 times 3)$ là một trong những ma trận kinh điển nổi tiếng nhất trong giải tích số:
  $
  H_3 = mat(delim: "[",
    1, 1/2, 1/3;
    1/2, 1/3, 1/4;
    1/3, 1/4, 1/5
  )
  $
  Xét hệ phương trình bậc nhất $H_3 X = B$ với hai vectơ vế phải: $B_1 = mat(delim: "[", 11/6; 13/12; 47/60)$ và $B_2 = mat(delim: "[", "1,84"; "1,08"; "0,78")$.],
  (
    True([Định thức của ma trận $H_3$ bằng $det(H_3) = frac(1, 2160) approx "0,000463"$, rất gần với $0$.]),
    True([Với vectơ vế phải $B_1$, hệ phương trình $H_3 X = B_1$ có nghiệm duy nhất chính xác là $X_1 = mat(delim: "[", 1; 1; 1)$.]),
    True([Khi vế phải thay đổi cực nhỏ từ $B_1$ sang $B_2$ (sai lệch tuyệt đối mỗi thành phần nhỏ hơn $"0,01"$), nghiệm của hệ bị khuếch đại sai lệch nghiêm trọng, chứng minh hệ có điều kiện xấu (ill-conditioned).]),
    False([Để khắc phục hiện tượng mất độ chính xác do điều kiện xấu khi giải bằng máy tính số, thuật toán khử Gauss với phần tử trục xoay bộ phận (Partial Pivoting) có thể loại bỏ hoàn toàn sai số làm tròn mà không cần tăng độ chính xác số học.]),
  ),
  loigiai: [
    #step[
      *Phân tích giải tích số của ma trận Hilbert:* \
      - *Ý a:* Theo công thức định thức ma trận Cauchy: $det(H_n) = frac(c_n^2, prod_(i,j)(i+j-1))$. Với $n = 3$:
        $ det(H_3) = frac{(1! 2!)^2}{1 times 2 times 3 times 4 times 5 times 6 times 7} = frac{4}{8640} = frac{1}{2160} approx "0,000463". $ (Đúng).
      - *Ý b:* Nhân trực tiếp $H_3 X_1$: dòng 1: $1 + 1/2 + 1/3 = 11/6$; dòng 2: $1/2 + 1/3 + 1/4 = 13/12$; dòng 3: $1/3 + 1/4 + 1/5 = 47/60$. Nghiệm chính xác $X_1 = (1, 1, 1)^T$. (Đúng).
      - *Ý c:* Nghịch đảo của ma trận Hilbert chứa các số nguyên cực lớn:
        $ H_3^(-1) = mat(delim: "[", 9, -36, 30; -36, 192, -180; 30, -180, 180). $
        Số điều kiện ma trận là $kappa(H_3) = norm(H_3) norm(H_3^(-1)) approx 524$. Độ nhạy sai số tỉ lệ thuận với $kappa(H_3)$, một nhiễu nhỏ $10^(-2)$ ở $B$ bị nhân lên hàng trăm lần ở $X$. (Đúng).
      - *Ý d:* Partial Pivoting chỉ hạn chế tích lũy sai số làm tròn trong quá trình biến đổi sơ cấp, không thể loại bỏ bản chất mất ổn định của bản thân bài toán ill-conditioned nếu không dùng số học độ chính xác tùy ý (Arbitrary-precision arithmetic) hoặc phương pháp hiệu chỉnh Tikhonov. (Sai).
    ]
  ]
)

// CÂU ĐÚNG SAI 2
#ds(
  [*(Định lý Rouché-Capelli & Biện luận nghiệm hệ 3 ẩn theo tham số)*\
  Cho hệ phương trình đại số tuyến tính phụ thuộc tham số $m in RR$:
  $
  cases(
    x + m y + z = 1,
    m x + y + z = m,
    x + y + m z = m^2
  )
  $],
  (
    True([Khi $m = 1$, hạng của ma trận hệ số và ma trận mở rộng bằng nhau $text("rank")(A) = text("rank")(A|B) = 1$, hệ có vô số nghiệm phụ thuộc 2 tham số tự do.]),
    True([Khi $m = -2$, $text("rank")(A) = 2$ nhưng $text("rank")(A|B) = 3$, hệ phương trình vô nghiệm theo Định lý Rouché-Capelli.]),
    True([Khi $m cancel(in) {1, -2}$, hệ có nghiệm duy nhất với $z = frac((m + 1)^2, m + 2)$.]),
    False([Tồn tại giá trị của tham số $m$ để hệ phương trình có vô số nghiệm phụ thuộc đúng một ẩn số tự do.]),
  ),
  loigiai: [
    #step[
      *Định lý Rouché-Capelli và Định thức ma trận hệ số:* \
      Định thức ma trận hệ số:
      $
      det(A) = det mat(delim: "|",
        1, m, 1;
        m, 1, 1;
        1, 1, m
      ) = (m + 2)(1 - m)^2.
      $
      - $det(A) = 0 <=> m = 1$ hoặc $m = -2$.
      - Khi $m = 1$: cả ba phương trình đồng nhất thành $x + y + z = 1 => text("rank")(A) = text("rank")(A|B) = 1$. Nghiệm phụ thuộc $3 - 1 = 2$ ẩn tự do. (Ý a Đúng).
      - Khi $m = -2$: cộng 3 phương trình được $0(x + y + z) = 3$ (vô lý) $=> text("rank")(A) = 2 < text("rank")(A|B) = 3$. Hệ vô nghiệm. (Ý b Đúng).
      - Khi $m cancel(in) {1, -2}$: Giải theo quy tắc Cramer:
        $ Delta_z = det mat(delim: "|", 1, m, 1; m, 1, m; 1, 1, m^2) = -(m - 1)^2 (m + 1)^2. $
        $ z = frac(Delta_z, det(A)) = frac(-(m - 1)^2 (m + 1)^2, -(m - 1)^2 (m + 2)) = frac((m + 1)^2, m + 2). $ (Ý c Đúng).
      - Do phương trình bậc thang chỉ có thể có hạng 1 (khi $m = 1$) hoặc vô nghiệm (khi $m = -2$) hoặc hạng 3, không bao giờ có trường hợp hạng 2 tương thích. Do đó không tồn tại $m$ để hệ có vô số nghiệm phụ thuộc đúng 1 ẩn tự do. (Ý d Sai).
    ]
  ]
)

== 3. Trả lời ngắn

// TLN 1
#tln(
  [*(Cực trị đại số: Khoảng cách từ gốc tọa độ đến giao tuyến hai mặt phẳng)*\
  Xét hệ hai phương trình bậc nhất ba ẩn:
  $
  cases(
    x + 2y + 3z = 14,
    2x + y - z = 4
  )
  $
  Hệ phương trình trên có vô số nghiệm thực $(x, y, z)$. Tìm giá trị nhỏ nhất của biểu thức $S = x^2 + y^2 + z^2$ (kết quả làm tròn đến chữ số thập phân thứ hai).],
  [$"15,52"$],
  loigiai: [
    #step[
      *Phương pháp hình học giải tích & Nhân tử Lagrange:* \
      Tập nghiệm của hệ biểu diễn đường thẳng giao tuyến $Delta$ của hai mặt phẳng $(P_1): x + 2y + 3z - 14 = 0$ và $(P_2): 2x + y - z - 4 = 0$. \
      Biểu thức $S = x^2 + y^2 + z^2 = O M^2$ đạt giá trị nhỏ nhất khi điểm $M$ là hình chiếu vuông góc của gốc tọa độ $O$ lên $Delta$. \
      Vectơ $arrow(O M)$ phải là tổ hợp tuyến tính của hai vectơ pháp tuyến $arrow(n)_1 = (1, 2, 3)$ và $arrow(n)_2 = (2, 1, -1)$:
      $
      arrow(O M) = alpha arrow(n)_1 + beta arrow(n)_2 <=> cases(x = alpha + 2beta, y = 2alpha + beta, z = 3alpha - beta)
      $
      Thay vào hai phương trình của hệ:
      $
      cases(
        (alpha + 2beta) + 2(2alpha + beta) + 3(3alpha - beta) = 14,
        2(alpha + 2beta) + (2alpha + beta) - (3alpha - beta) = 4
      ) <=> cases(
        14alpha + beta = 14,
        alpha + 6beta = 4
      )
      $
      Giải hệ hai ẩn:
      $ alpha = frac{80}{83}, quad beta = frac{42}{83}. $
      Khi đó giá trị nhỏ nhất của $S$ là:
      $
      S_("min") = 14alpha + 4beta = 14(frac{80}{83}) + 4(frac{42}{83}) = frac{1120 + 168}{83} = frac{1288}{83} approx "15,518" approx "15,52".
      $
    ]
  ]
)

// TLN 2
#tln(
  [*(Hệ số phản hồi lan tỏa của ma trận nghịch đảo Leontief)*\
  Cho ma trận hệ số kỹ thuật của nền kinh tế 2 ngành:
  $ A = mat(delim: "[", "0,2", "0,3"; "0,4", "0,1") $
  Tính phần tử $b_21$ của ma trận nghịch đảo Leontief $B = (I - A)^(-1)$ biểu thị lượng sản lượng ngành 2 phải tăng thêm để đáp ứng khi nhu cầu cuối cùng của ngành 1 tăng đúng 1 đơn vị giá trị (kết quả viết dưới dạng phân số tối giản $p/q$).],
  [$2/3$],
  loigiai: [
    #step[
      *Nghịch đảo ma trận Leontief 2x2:* \
      $
      I - A = mat(delim: "[",
        1 - "0,2", - "0,3";
        - "0,4", 1 - "0,1"
      ) = mat(delim: "[",
        "0,8", - "0,3";
        - "0,4", "0,9"
      )
      $
      Định thức:
      $ det(I - A) = ("0,8")("0,9") - (- "0,3")(- "0,4") = "0,72" - "0,12" = "0,60" = 3/5. $
      Ma trận nghịch đảo Leontief:
      $
      (I - A)^(-1) = frac(1, "0,6") mat(delim: "[",
        "0,9", "0,3";
        "0,4", "0,8"
      ) = mat(delim: "[",
        "1,5", "0,5";
        frac{"0,4"}{"0,6"}, frac{"0,8"}{"0,6"}
      ) = mat(delim: "[",
        3/2, 1/2;
        2/3, 4/3
      )
      $
      Phần tử ở dòng 2 cột 1 là $b_21 = frac{"0,4"}{"0,6"} = 2/3$.
    ]
  ]
)

== 4. Tự luận Vận dụng cao (Phân hóa sâu)

// TỰ LUẬN 1
#tl(
  [*(Phân rã $A = L U$ bằng thuật toán Gauss & Ứng dụng giải chuỗi hệ phương trình)*\
  Trong tính toán khoa học và kỹ thuật, khi cần giải nhiều hệ phương trình $A X = B$ có cùng ma trận hệ số $A$ nhưng khác nhau về vectơ tải trọng vế phải $B$, người ta sử dụng phương pháp Phân rã $L U$. Cho ma trận hệ số:
  $
  A = mat(delim: "[",
    2, 1, 1;
    4, 3, 3;
    8, 7, 9
  )
  $
  1. Sử dụng thuật toán Khử Gauss để phân rã ma trận $A$ thành tích $A = L dot U$, trong đó $L$ là ma trận tam giác dưới có các phần tử trên đường chéo chính bằng $1$, và $U$ là ma trận tam giác trên.
  2. Áp dụng phân rã $L U$ giải hệ phương trình $A X = B$ với vectơ vế phải $B = mat(delim: "[", 4; 10; 24)$ bằng cách giải liên tiếp hai hệ tam giác: $L Y = B$ (thế xuôi) và $U X = Y$ (thế ngược).],
  loigiai: [
    #step[
      *1. Thuật toán Khử Gauss và xây dựng các ma trận $L, U$:* \
      - *Bước khử 1:* Chọn trục xoay $a_11 = 2$.
        + Nhân tử khử dòng 2: $l_21 = frac{a_21, a_11} = 4/2 = 2$. Thực hiện $d_2 -> d_2 - 2 d_1$: dòng 2 trở thành $(0, 1, 1)$.
        + Nhân tử khử dòng 3: $l_31 = frac{a_31, a_11} = 8/2 = 4$. Thực hiện $d_3 -> d_3 - 4 d_1$: dòng 3 trở thành $(0, 3, 5)$.
      - *Bước khử 2:* Trục xoay mới là $u_22 = 1$.
        + Nhân tử khử dòng 3: $l_32 = frac{a'_32, u_22} = 3/1 = 3$. Thực hiện $d_3 -> d_3 - 3 d_2$: dòng 3 trở thành $(0, 0, 5 - 3(1)) = (0, 0, 2)$.
      Kết quả ta nhận được ma trận tam giác trên $U$:
      $
      U = mat(delim: "[",
        2, 1, 1;
        0, 1, 1;
        0, 0, 2
      )
      $
      Ma trận tam giác dưới $L$ được tạo bởi các nhân tử khử $l_i j$:
      $
      L = mat(delim: "[",
        1, 0, 0;
        2, 1, 0;
        4, 3, 1
      )
      $
      Kiểm tra tích: $L U = mat(delim: "[", 2, 1, 1; 4, 3, 3; 8, 7, 9) = A$ (khớp hoàn hảo!).
    ]

    #step[
      *2. Giải hệ phương trình $A X = B$ qua hai bước thế:* \
      Hệ $A X = B <=> L (U X) = B$. Đặt $Y = mat(delim: "[", y_1; y_2; y_3) = U X$:
      - *Hệ 1 (Thế xuôi giải $L Y = B$):*
        $
        mat(delim: "[",
          1, 0, 0;
          2, 1, 0;
          4, 3, 1
        ) mat(delim: "[", y_1; y_2; y_3) = mat(delim: "[", 4; 10; 24)
        <=> cases(
          y_1 = 4,
          2 y_1 + y_2 = 10 => y_2 = 10 - 2(4) = 2,
          4 y_1 + 3 y_2 + y_3 = 24 => y_3 = 24 - 4(4) - 3(2) = 2
        )
        $
        Vậy $Y = mat(delim: "[", 4; 2; 2)$.
      - *Hệ 2 (Thế ngược giải $U X = Y$):*
        $
        mat(delim: "[",
          2, 1, 1;
          0, 1, 1;
          0, 0, 2
        ) mat(delim: "[", x_1; x_2; x_3) = mat(delim: "[", 4; 2; 2)
        <=> cases(
          2 x_3 = 2 => x_3 = 1,
          x_2 + x_3 = 2 => x_2 = 2 - 1 = 1,
          2 x_1 + x_2 + x_3 = 4 => 2 x_1 = 4 - 1 - 1 = 2 => x_1 = 1
        )
        $
      Vậy nghiệm duy nhất của hệ phương trình là $X = mat(delim: "[", 1; 1; 1)$.
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
  #text(weight: "black", size: 11.5pt, fill: rgb("0F172A"))[THÁCH THỨC ĐẠI SỐ TUYẾN TÍNH & AI: THUẬT TOÁN PAGERANK CỦA GOOGLE] \
  #text(size: 9.5pt, style: "italic", fill: rgb("475569"))[(Larry Page & Sergey Brin 1998 — Ứng dụng hệ phương trình ma trận và Định lý Perron--Frobenius xây dựng đế chế tìm kiếm ngàn tỉ USD)]

  #v(0.4em)
  *Đề bài:* Một mạng Internet thu nhỏ gồm bốn trang web $A, B, C, D$ với cấu trúc liên kết siêu văn bản (hyperlinks) như sau:
  - Trang $A$ chứa liên kết dẫn đến trang $B$ và trang $C$ (chia đều xác suất $1/2$ cho mỗi liên kết).
  - Trang $B$ chỉ chứa một liên kết duy nhất dẫn đến trang $D$ (xác suất $1$).
  - Trang $C$ chứa ba liên kết dẫn đến $A, B$ và $D$ (chia đều xác suất $1/3$).
  - Trang $D$ chứa một liên kết duy nhất dẫn về trang $C$ (xác suất $1$).
  
  Mỗi trang web có một độ quan trọng (PageRank score) tương ứng là $r_A, r_B, r_C, r_D ge 0$. Điểm số của một trang bằng tổng các đóng góp điểm từ những trang có liên kết trỏ đến nó, thỏa mãn điều kiện chuẩn hóa tổng xác suất:
  $ r_A + r_B + r_C + r_D = 1. $
  1. Hãy thiết lập ma trận liên kết $M$ và viết hệ phương trình bậc nhất xác định vector trạng thái dừng $arrow(r) = mat(delim: "[", r_A; r_B; r_C; r_D)$ thỏa mãn phương trình giá trị riêng:
     $ M arrow(r) = arrow(r) <=> (I - M) arrow(r) = arrow(0). $
  2. Bằng thuật toán Khử Gauss, giải hệ phương trình tìm nghiệm chính xác của vector PageRank và sắp xếp thứ tự quyền lực của 4 website trên công cụ tìm kiếm.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Tọa độ 4 nút A, B, C, D
    let A = (-2, 1.2)
    let B = (2, 1.2)
    let C = (-2, -1.2)
    let D = (2, -1.2)
    
    // Vòng tròn các nút
    circle(A, radius: 0.38, fill: rgb("EFF6FF"), stroke: 1.5pt + rgb("2563EB"))
    content(A, text(fill: rgb("1E40AF"), weight: "bold")[$A$])

    circle(B, radius: 0.38, fill: rgb("EFF6FF"), stroke: 1.5pt + rgb("2563EB"))
    content(B, text(fill: rgb("1E40AF"), weight: "bold")[$B$])

    circle(C, radius: 0.38, fill: rgb("FEF2F2"), stroke: 1.5pt + rgb("DC2626"))
    content(C, text(fill: rgb("991B1B"), weight: "bold")[$C$])

    circle(D, radius: 0.38, fill: rgb("FEF2F2"), stroke: 1.5pt + rgb("DC2626"))
    content(D, text(fill: rgb("991B1B"), weight: "bold")[$D$])
    
    // Các cung liên kết có hướng
    // A -> B
    line((-1.6, 1.2), (1.6, 1.2), mark: (end: ">"), stroke: 1.2pt + rgb("2563EB"))
    content((0, 1.45), text(fill: rgb("2563EB"), size: 8pt)[$1/2$])
    
    // A -> C
    line((-2, 0.8), (-2, -0.8), mark: (end: ">"), stroke: 1.2pt + rgb("2563EB"))
    content((-2.3, 0), text(fill: rgb("2563EB"), size: 8pt)[$1/2$])

    // B -> D
    line((2, 0.8), (2, -0.8), mark: (end: ">"), stroke: 1.2pt + rgb("16A34A"))
    content((2.3, 0), text(fill: rgb("16A34A"), size: 8pt)[$1$])

    // C -> A
    line((-1.75, -0.8), (-1.75, 0.8), mark: (end: ">"), stroke: (dash: "dashed", paint: rgb("DC2626"), thickness: 1pt))
    content((-1.5, 0), text(fill: rgb("DC2626"), size: 8pt)[$1/3$])

    // C -> B
    line((-1.7, -0.9), (1.7, 0.9), mark: (end: ">"), stroke: 1pt + rgb("DC2626"))
    content((0.2, 0.2), text(fill: rgb("DC2626"), size: 8pt)[$1/3$])

    // C -> D
    line((-1.6, -1.35), (1.6, -1.35), mark: (end: ">"), stroke: 1.2pt + rgb("DC2626"))
    content((0, -1.6), text(fill: rgb("DC2626"), size: 8pt)[$1/3$])

    // D -> C
    line((1.6, -1.05), (-1.6, -1.05), mark: (end: ">"), stroke: 1.2pt + rgb("D97706"))
    content((0, -0.85), text(fill: rgb("D97706"), size: 8pt)[$1$])
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
  #text(weight: "bold", fill: rgb("B45309"), size: 10.5pt)[LỜI GIẢI MẪU MỰC & ĐẲNG CẤP KHỬ GAUSS MA TRẬN:] \
  
  #step[
    *1. Lập Ma trận chuyển dịch liên kết $M$:* \
    Cột thứ nhất biểu diễn các liên kết xuất phát từ $A$: phân bố $1/2$ sang $B$ và $1/2$ sang $C$. \
    Cột thứ hai xuất phát từ $B$: dồn $1$ sang $D$. \
    Cột thứ ba xuất phát từ $C$: chia đều $1/3$ cho $A, B, D$. \
    Cột thứ tư xuất phát từ $D$: dồn $1$ về $C$. \
    Ma trận xác suất Markov liên kết là:
    $ M = mat(delim: "(",
      0, 0, 1/3, 0;
      1/2, 0, 1/3, 0;
      1/2, 0, 0, 1;
      0, 1, 1/3, 0
    ) $
  ]
  
  #step[
    *2. Thiết lập Hệ phương trình đại số tuyến tính:* \
    Hệ $M arrow(r) = arrow(r)$ tương đương với:
    $ cases(
      r_A = 1/3 r_C,
      r_B = 1/2 r_A + 1/3 r_C,
      r_C = 1/2 r_A + r_D,
      r_D = r_B + 1/3 r_C
    ) $
    Kết hợp điều kiện chuẩn hóa tổng xác suất: $r_A + r_B + r_C + r_D = 1$.
  ]
  
  #step[
    *3. Khử Gauss và Giải chính xác:* \
    Biểu diễn tất cả các biến theo $r_C$:
    - Từ phương trình thứ nhất: $r_A = 1/3 r_C$.
    - Thay $r_A$ vào phương trình thứ hai:
      $ r_B = 1/2 (1/3 r_C) + 1/3 r_C = 1/6 r_C + 1/3 r_C = 1/2 r_C. $
    - Từ phương trình thứ tư:
      $ r_D = r_B + 1/3 r_C = 1/2 r_C + 1/3 r_C = 5/6 r_C. $
    - Kiểm tra lại phương trình thứ ba:
      $ 1/2 r_A + r_D = 1/2 (1/3 r_C) + 5/6 r_C = 1/6 r_C + 5/6 r_C = r_C $ (khớp hoàn hảo!).
    Thay tất cả vào phương trình tổng xác suất:
    $ 1/3 r_C + 1/2 r_C + r_C + 5/6 r_C = 1 <=> (2/6 + 3/6 + 6/6 + 5/6) r_C = 1 <=> 16/6 r_C = 1 <=> 8/3 r_C = 1. $
    Suy ra:
    $ r_C = 3/8 = "0,375". $
    Từ đó tính được toàn bộ vector PageRank:
    $ r_A = 1/3 (3/8) = 1/8 = "0,125" = "12,5"\%. $
    $ r_B = 1/2 (3/8) = 3/16 = "0,1875" = "18,75"\%. $
    $ r_C = 3/8 = 6/16 = "0,375" = "37,5"\%. $
    $ r_D = 5/6 (3/8) = 5/16 = "0,3125" = "31,25"\%. $
    *Kết luận xếp hạng:* \
    Thứ tự ưu tiên hiển thị kết quả tìm kiếm của Google là:
    $ C ("37,5"\%) > D ("31,25"\%) > B ("18,75"\%) > A ("12,5"\%): $
    Trang web $C$ có trọng số cao nhất vì nó vừa nhận liên kết từ $A$, vừa nhận toàn bộ liên kết quyền lực trực tiếp từ trang $D$!
  ]
]



