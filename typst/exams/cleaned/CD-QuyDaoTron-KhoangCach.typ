#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *


#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.5em),
  above: 1.5em,
  below: 1.2em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  text(fill: rgb("900C3F"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ
// ═══════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      Chuyên Đề Vận Dụng Cao:\
      Quỹ Đạo Tròn Trong Không Gian $O x y z$ — Khoảng Cách Đến Mặt Phẳng
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Xác định đường tròn qua ba điểm trong không gian · Tìm điểm gần/xa mặt phẳng nhất trên quỹ đạo
    ]
  ]
]

// ═══════════════════════════════════════════════════════════
// LÝ THUYẾT NỀN
// ═══════════════════════════════════════════════════════════
= Lý Thuyết Nền

#lythuyet[
  *Đường tròn qua ba điểm $A$, $B$, $C$ trong không gian:*

  Đường tròn ngoại tiếp tam giác $A B C$ (không gian) là giao của mặt phẳng $(alpha) = "mp"(A B C)$ và mặt cầu ngoại tiếp. Tâm $H$ là điểm trong $(alpha)$ cách đều ba đỉnh: $|H A| = |H B| = |H C| = r$.

  *Các bước xác định đường tròn:*

  #grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    row-gutter: 5pt,
    strong[Bước 1.], [Tìm VTPT: $vect(n) = vect(A B) times vect(A C)$, lập phương trình $(alpha)$.],
    strong[Bước 2.], [Giải hệ từ $|H A|^2 = |H B|^2$ và $|H A|^2 = |H C|^2$ kết hợp $H in (alpha)$.],
    strong[Bước 3.], [Tính $r = |H A|$.],
    strong[Bước 4.], [Tìm điểm thấp/cao nhất: chiếu bán kính lên hướng pháp tuyến mặt phẳng cần tính khoảng cách.],
  )

  *Điểm thấp nhất trên đường tròn so với mặt phẳng nằm ngang $z = z_0$:*

  Khi quỹ đạo nằm trong mặt phẳng có VTPT $vect(n) = (n_x; n_y; n_z)$, tọa độ $z$ của điểm trên quỹ đạo dao động quanh $z_H$ với biên độ:
  $
    Delta z = r dot (|n_z|)/(|vect(n)|).
  $
  Do đó $z_(min) = z_H - r dot (|n_z|)/(|vect(n)|)$ và khoảng cách ngắn nhất đến $z = z_0$:
  $
    d_(min) = z_(min) - z_0 = (z_H - z_0) - r dot (|n_z|)/(|vect(n)|).
  $

  *Trường hợp riêng — $(alpha): a y + b z = c$ (chứa trục $x$):*

  $vect(n) = (0; a; b)$, $|vect(n)| = sqrt(a^2 + b^2)$:
  $
    d_(min) = (z_H - z_0) - r dot (|b|)/(sqrt(a^2 + b^2)).
  $

  Đặc biệt với $a = b = 1$: $(alpha): y + z = c$, $vect(n) = (0;1;1)$:
  $
    d_(min) = (z_H - z_0) - r/sqrt(2).
  $
]

// ═══════════════════════════════════════════════════════════
// BÀI TOÁN NGUỒN — PHÂN TÍCH CHI TIẾT
// ═══════════════════════════════════════════════════════════
= Bài Toán Nguồn — Phân Tích Từng Bước

== Đề bài

#rect(
  stroke: 1.5pt + rgb("1A5276"),
  fill: rgb("EBF5FB"),
  inset: 12pt,
  radius: 4pt,
)[
  Trong không gian $O x y z$ có đơn vị dài trên mỗi trục là mét, mặt đất là mặt phẳng $(mp): z + 12 = 0$. Một vật $M$ được coi như một hạt chuyển động trên quỹ đạo tròn, ở ba thời điểm khác nhau có vị trí $A(2; 1; 10)$, $B(6; 3; 8)$, $C(8; 5; 6)$.

  Tính khoảng cách ngắn nhất (đơn vị mét) từ vật đến mặt đất. Không làm tròn các phép tính trung gian, kết quả cuối cùng làm tròn đến hàng phần trăm.
]

== Lời giải đầy đủ

=== Bước 1. Mặt phẳng $(alpha)$ chứa quỹ đạo

$vect(A B) = (4; 2; -2)$ và $vect(A C) = (6; 4; -4)$.

Vectơ pháp tuyến:
$
  vect(n) = vect(A B) times vect(A C)
  = mat(delim: "|", vect(i), vect(j), vect(k); 4, 2, -2; 6, 4, -4)
  = (2 dot(-4) - (-2) dot 4;\ (-2) dot 6 - 4 dot(-4);\ 4 dot 4 - 2 dot 6)
  = (0; 4; 4).
$

Rút gọn $vect(n) = (0; 1; 1)$. Phương trình mặt phẳng qua $A(2;1;10)$:
$
  (alpha): y + z = 1 + 10 = 11.
$

Kiểm tra: $A$: $1+10=11$ ✓; $B$: $3+8=11$ ✓; $C$: $5+6=11$ ✓.

=== Bước 2. Tâm $H$ và bán kính $r$

Đặt $H(x; y; z)$ với $z = 11 - y$ (vì $H in (alpha)$). Khi đó:
$
  z_A - z = 10 - (11-y) = y - 1 = -(1-y),
$
tổng quát: $z_P - z = y_P + z_P - 11 + y - z_P = y - y_P + (y + z - 11) = y - y_P$ nếu $H, P in (alpha)$.

Chính xác hơn: với $P(x_P; y_P; z_P)$ và $z = 11-y$:
$
  z - z_P = (11-y) - z_P = 11 - y - z_P.
$

Nên:
$
  |H P|^2 = (x-x_P)^2 + (y-y_P)^2 + (11-y-z_P)^2.
$

*Từ $|H A|^2 = |H B|^2$:*

$(x-2)^2 + (y-1)^2 + (11-y-10)^2 = (x-6)^2 + (y-3)^2 + (11-y-8)^2$

$(x-2)^2 + (y-1)^2 + (1-y)^2 = (x-6)^2 + (y-3)^2 + (3-y)^2$

$(x-2)^2 + 2(y-1)^2 = (x-6)^2 + 2(y-3)^2$

Khai triển:
$x^2 - 4x + 4 + 2y^2 - 4y + 2 = x^2 - 12x + 36 + 2y^2 - 12y + 18$

$-4x - 4y + 6 = -12x - 12y + 54$

$
  8x + 8y = 48 => x + y = 6. quad (I)
$

*Từ $|H A|^2 = |H C|^2$:*

$(x-2)^2 + 2(y-1)^2 = (x-8)^2 + 2(y-5)^2$

$x^2 - 4x + 4 + 2y^2 - 4y + 2 = x^2 - 16x + 64 + 2y^2 - 20y + 50$

$-4x - 4y + 6 = -16x - 20y + 114$

$
  12x + 16y = 108 => 3x + 4y = 27. quad (II)
$

Giải hệ (I), (II): từ (I) $x = 6 - y$, thay vào (II):
$
  3(6-y) + 4y = 27 => 18 + y = 27 => y = 9.
$

Suy ra $x = 6 - 9 = -3$ và $z = 11 - 9 = 2$.

$
  H(-3; 9; 2).
$

Bán kính:
$
  r = |H A| = sqrt((-3-2)^2 + (9-1)^2 + (2-10)^2) = sqrt(25 + 64 + 64) = sqrt(153) = 3sqrt(17).
$

Kiểm tra: $|H B| = sqrt(81+36+36) = sqrt(153)$ ✓; $|H C| = sqrt(121+16+16) = sqrt(153)$ ✓.

=== Bước 3. Điểm thấp nhất trên quỹ đạo

Quỹ đạo nằm trong $(alpha): y + z = 11$, $vect(n) = (0; 1; 1)$, $|vect(n)| = sqrt(2)$.

Hai vectơ đơn vị trong $(alpha)$:
$
  vect(e_1) = (1; 0; 0), quad vect(e_2) = (0; 1; -1)/sqrt(2)
$
(dễ kiểm tra $vect(e_1) dot vect(n) = 0$, $vect(e_2) dot vect(n) = 0$, $|vect(e_1)| = |vect(e_2)| = 1$).

Tham số hóa điểm trên quỹ đạo:
$
  P(theta) = H + r cos theta dot vect(e_1) + r sin theta dot vect(e_2).
$

Tọa độ $z$:
$
  z_P = 2 + r cos theta dot 0 + r sin theta dot (-1/sqrt(2))
  = 2 - (3sqrt(17) sin theta)/sqrt(2).
$

$z_P$ nhỏ nhất khi $sin theta = 1$:
$
  z_(min) = 2 - (3sqrt(17))/sqrt(2) = 2 - (3sqrt(34))/2.
$

=== Bước 4. Khoảng cách ngắn nhất đến mặt đất

Mặt đất: $z = -12$.
$
  d_(min) = z_(min) - (-12) = 14 - (3sqrt(34))/2.
$

Tính số:
$
  sqrt(34) = 5{,}830951... => (3 times 5{,}830951)/2 = 8{,}746427...
$
$
  d_(min) = 14 - 8{,}746427... = 5{,}253573... approx boxed(5{,}25 "m").
$

// ═══════════════════════════════════════════════════════════
// CÁC BÀI LUYỆN CÙNG DẠNG
// ═══════════════════════════════════════════════════════════
= Các Bài Luyện Cùng Dạng

== Bài 1 — Cùng cấu trúc, dữ liệu mới

#tln(
  [Trong không gian $O x y z$ (đơn vị: mét), mặt đất là $z + 8 = 0$. Vật $M$ chuyển động trên quỹ đạo tròn, qua ba điểm $A(1; 0; 6)$, $B(3; 2; 4)$, $C(5; 0; 4)$. Tính khoảng cách ngắn nhất từ vật đến mặt đất (làm tròn đến hàng phần trăm).],
  [$d_(min) = 14 - (3sqrt(2))/2 - 8 approx ...$],
  loigiai: [
    #ppgiai[Thực hiện y hệt bài toán nguồn: tìm $(alpha)$, tâm $H$, bán kính $r$, rồi $z_(min) = z_H - r/sqrt(2)$ (nếu $(alpha): y + z = c$).]

    *Bước 1.* $vect(A B) = (2; 2; -2)$, $vect(A C) = (4; 0; -2)$.

    $vect(n) = vect(A B) times vect(A C) = (2(-2) - (-2)(0);\ (-2)(4) - 2(-2);\ 2(0) - 2(4)) = (-4; -4; -8)$.

    Rút gọn: $vect(n) = (1; 1; 2)$. Phương trình $(alpha)$: $x + y + 2z = 1 + 0 + 12 = 13$.

    Kiểm: $B$: $3+2+8=13$ ✓; $C$: $5+0+8=13$ ✓.

    *Bước 2.* $H(x;y;z)$ với $x = 13 - y - 2z$ trong $(alpha)$.

    Từ $|H A|^2 = |H B|^2$ và $|H A|^2 = |H C|^2$, giải hệ:

    $|H A|^2 = |H B|^2$: $(x-1)^2+(y)^2+(z-6)^2 = (x-3)^2+(y-2)^2+(z-4)^2$
    $=> 4x + 4y + 4z = 4 + 4 + 4 + 2 cdot 4 = ?$

    Khai triển: $x^2-2x+1+y^2+z^2-12z+36 = x^2-6x+9+y^2-4y+4+z^2-8z+16$
    $-2x-12z+37 = -6x-4y-8z+29$
    $4x+4y-4z = -8 => x+y-z = -2. quad (I)$

    $|H A|^2 = |H C|^2$: $(x-1)^2+y^2+(z-6)^2 = (x-5)^2+y^2+(z-4)^2$
    $x^2-2x+1+z^2-12z+36 = x^2-10x+25+z^2-8z+16$
    $-2x-12z+37 = -10x-8z+41$
    $8x-4z = 4 => 2x-z=1. quad (II)$

    Hệ ba ẩn với ràng buộc $x+y+2z=13$, (I): $x+y-z=-2$, (II): $2x-z=1$.

    Từ (I) và $(alpha)$: $(x+y+2z) - (x+y-z) = 13-(-2) => 3z=15 => z=5$.
    Từ (II): $2x = 1+5=6 => x=3$. Từ $(alpha)$: $y = 13-3-10=0$.

    $H(3; 0; 5)$.

    $r = |H A| = sqrt(4+0+1) = sqrt(5)$.

    *Bước 3.* $(alpha): x+y+2z=13$, $vect(n)=(1;1;2)$, $|vect(n)|=sqrt(6)$.

    $Delta z = r dot (|n_z|)/(|vect(n)|) = sqrt(5) dot 2/sqrt(6) = 2sqrt(5/6) = 2sqrt(30)/6 = sqrt(30)/3$.

    $z_(min) = 5 - sqrt(30)/3$.

    *Bước 4.* $d_(min) = z_(min) + 8 = 13 - sqrt(30)/3 approx 13 - 1{,}826 approx 11{,}17 "m"$.
  ],
)

== Bài 2 — Mặt phẳng quỹ đạo nằm ngang ($z = "const"$)

#tln(
  [Trong không gian $O x y z$ (đơn vị: mét), mặt đất là $z + 5 = 0$. Vật $M$ chuyển động trên quỹ đạo tròn qua $A(0; 0; 7)$, $B(4; 0; 7)$, $C(2; 3; 7)$. Khoảng cách ngắn nhất từ vật đến mặt đất là bao nhiêu mét?],
  [$12 "m"$],
  loigiai: [
    Ba điểm có $z = 7$, quỹ đạo nằm trong mặt phẳng $z = 7$ (nằm ngang). VTPT $vect(n) = (0;0;1)$.

    $Delta z = r dot (|n_z|)/(|vect(n)|) = r dot 1/1 = r$ — nhưng $z$ không thay đổi trên quỹ đạo vì quỹ đạo nằm trong mặt phẳng $z = 7$.

    Mọi điểm $M$ trên quỹ đạo đều có $z_M = 7$.

    $d(M, "mặt đất") = z_M - (-5) = 7 + 5 = 12 "m" = "const"$.

    #meo[Khi mặt phẳng quỹ đạo song song với mặt đất, khoảng cách từ mọi điểm trên quỹ đạo đến mặt đất là như nhau — bằng khoảng cách giữa hai mặt phẳng đó. Không cần tìm tâm hay bán kính.]
  ],
)

== Bài 3 — Khoảng cách xa nhất (điểm cao nhất)

#tln(
  [Với bài toán nguồn ($A(2;1;10)$, $B(6;3;8)$, $C(8;5;6)$, mặt đất $z+12=0$), tìm khoảng cách *lớn nhất* từ vật đến mặt đất.],
  [$d_(max) = 14 + (3sqrt(34))/2 approx 22{,}75 "m"$],
  loigiai: [
    Từ bài toán nguồn: $H(-3; 9; 2)$, $r = 3sqrt(17)$, quỹ đạo trong $(alpha): y+z=11$.

    $z_P = 2 - (3sqrt(17) sin theta)/sqrt(2)$.

    $z_P$ lớn nhất khi $sin theta = -1$:
    $z_(max) = 2 + (3sqrt(17))/sqrt(2) = 2 + (3sqrt(34))/2$.

    $d_(max) = z_(max) + 12 = 14 + (3sqrt(34))/2 approx 14 + 8{,}746 approx 22{,}75 "m"$.
  ],
)

== Bài 4 — Khoảng cách đến mặt phẳng khác (không phải mặt đất)

#tln(
  [Với bài toán nguồn, tìm khoảng cách ngắn nhất từ vật đến mặt phẳng $(P): 2x - y + 2z - 3 = 0$.],
  [$d_(min) = |2(-3) - 9 + 2(2) - 3|/3 - r dot (|2 dot 0 - 1 dot 1 + 2 dot 1|)/(3 sqrt(2)) = ...$],
  loigiai: [
    #ppgiai[
      Khoảng cách ngắn nhất từ đường tròn (tâm $H$, bán kính $r$) đến mặt phẳng $(P)$:
      $d_(min) = d(H, (P)) - r dot (|vect(n)_alpha dot vect(n)_P|)/(|vect(n)_alpha| dot |vect(n)_P|)$

      trong đó thừa số sau là $sin$ góc giữa mặt phẳng quỹ đạo $(alpha)$ và mặt phẳng $(P)$.
    ]

    $H(-3; 9; 2)$, $(P): 2x-y+2z-3=0$, $vect(n)_P = (2;-1;2)$, $|vect(n)_P| = 3$.

    $d(H,(P)) = (|2(-3)-9+2(2)-3|)/3 = (|-6-9+4-3|)/3 = 14/3$.

    $vect(n)_alpha = (0;1;1)$, $|vect(n)_alpha| = sqrt(2)$.

    Góc giữa $(alpha)$ và $(P)$:
    $sin phi = (|vect(n)_alpha dot vect(n)_P|)/(|vect(n)_alpha| dot |vect(n)_P|) = (|0(2)+1(-1)+1(2)|)/(sqrt(2) dot 3) = 1/(3sqrt(2)) = sqrt(2)/6$.

    Đây là $sin$ của góc giữa hai mặt phẳng, tức $cos$ của góc giữa hai pháp tuyến... thực ra hướng chiếu đúng là:

    Hình chiếu bán kính lên $vect(n)_P$: biên dao động $= r dot sin phi'$ với $phi'$ là góc giữa $(alpha)$ và $(P)$, $sin phi' = (|vect(n)_alpha dot vect(n)_P|)/(|vect(n)_alpha||vect(n)_P|) = 1/(3sqrt(2))$.

    Biên dao động: $r dot 1/(3sqrt(2)) = 3sqrt(17)/(3sqrt(2)) = sqrt(17/2) = sqrt(34)/2$.

    $d_(min) = 14/3 - sqrt(34)/2 approx 4{,}667 - 2{,}915 approx 1{,}75$.
  ],
)

// ═══════════════════════════════════════════════════════════
// BÀI THI TỔNG HỢP
// ═══════════════════════════════════════════════════════════
= Bài Thi Tổng Hợp

== Câu hỏi thi (Dạng tự luận ngắn — TLN)

#tln(
  [Trong không gian $O x y z$ (đơn vị dài trên mỗi trục là mét), mặt đất là mặt phẳng $z + 12 = 0$. Một vật $M$ được coi như một hạt chuyển động trên một quỹ đạo tròn, ở ba thời điểm có ba vị trí là $A(2; 1; 10)$, $B(6; 3; 8)$, $C(8; 5; 6)$. Hãy tính theo đơn vị mét khoảng cách ngắn nhất tính từ vật đến mặt đất (không làm tròn các phép tính trung gian và kết quả cuối cùng được làm tròn đến hàng phần trăm).],
  [$5{,}25 "m"$],
  loigiai: [
    *Bước 1 — Mặt phẳng quỹ đạo:*

    $vect(n) = vect(A B) times vect(A C) = (4;2;-2) times (6;4;-4) = (0;4;4)$,
    rút gọn $(0;1;1)$.

    $(alpha): y + z = 11$.

    *Bước 2 — Tâm và bán kính:*

    Giải hệ: $|H A|^2 = |H B|^2 => x+y = 6$ (I); $|H A|^2 = |H C|^2 => 3x+4y = 27$ (II).

    Từ (I) và (II): $y = 9$, $x = -3$, $z = 2$. Tâm $H(-3;9;2)$, bán kính $r = 3sqrt(17)$.

    *Bước 3 — Tọa độ $z$ nhỏ nhất:*

    Vectơ đơn vị trong $(alpha)$ có thành phần $z$ âm: $vect(e_2) = (0;1;-1)/sqrt(2)$.

    $z_(min) = z_H - r dot 1/sqrt(2) = 2 - (3sqrt(17))/sqrt(2) = 2 - (3sqrt(34))/2$.

    *Bước 4 — Khoảng cách:*

    $
      d_(min) = z_(min) + 12 = 14 - (3sqrt(34))/2 approx 14 - 8{,}75 approx 5{,}25 "m".
    $
  ],
)

// ═══════════════════════════════════════════════════════════
// BẢNG TỔNG KẾT & MẸO
// ═══════════════════════════════════════════════════════════
= Bảng Tổng Kết

#align(center)[
  #table(
    columns: (2fr, 3fr, 2fr),
    fill: (col, row) => if row == 0 { rgb("1A5276") } else if calc.odd(row) { rgb("EBF5FB") } else { white },
    stroke: 0.5pt + rgb("aaaaaa"),
    inset: (x: 8pt, y: 7pt),
    align: (left, left, center),
    table.header(
      text(fill: white, weight: "bold")[Tình huống],
      text(fill: white, weight: "bold")[Công thức $d_(min)$],
      text(fill: white, weight: "bold")[Ghi chú],
    ),
    [$(alpha): y+z = c$\ (nghiêng 45°)], [$d_(min) = (z_H - z_0) - r/sqrt(2)$], [Bài toán nguồn],
    [$(alpha): z = c$\ (nằm ngang)], [$d_(min) = z_H - z_0$ (hằng số)], [Không phụ thuộc $r$],
    [$(alpha): n_x x + n_y y + n_z z = c$\ (tổng quát)],
    [$d_(min) = (z_H - z_0) - r dot (|n_z|)/(|vect(n)|)$],
    [Luôn đúng],

    [Điểm *cao* nhất], [$d_(max) = (z_H - z_0) + r dot (|n_z|)/(|vect(n)|)$], [Dấu $+$],
  )
]

#v(1em)
#meo[
  *Quy trình 4 bước cho mọi bài quỹ đạo tròn:*
  #list(
    [$vect(n) = vect(A B) times vect(A C)$ → phương trình $(alpha)$.],
    [Giải hai phương trình từ $|H A|^2 = |H B|^2$, $|H A|^2 = |H C|^2$ (kết hợp ràng buộc $H in (alpha)$) → $H$, $r$.],
    [$Delta z = r dot |n_z|/|vect(n)|$ — đây là biên độ dao động của tọa độ $z$ trên quỹ đạo.],
    [$d_(min) = (z_H - z_0) - Delta z$, $d_(max) = (z_H - z_0) + Delta z$.],
  )
  Với $(alpha): y+z=11$ (bài toán nguồn): $|n_z|/|vect(n)| = 1/sqrt(2)$, nên $Delta z = r/sqrt(2)$.
]
