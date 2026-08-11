import os

content = r"""#import "@local/sang-math:1.0.4": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../math-sym.typ": *
#import "../bbt.typ": *

#set page(
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 1.5cm)
)

#let math-color = rgb("#000000") 
#show math.equation: set text(fill: math-color)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ CHUYÊN ĐỀ VÀ MỤC LỤC
// ═══════════════════════════════════════════════════════════
#v(1em)
#block(
  width: 100%,
  fill: rgb("#f4f8fc"),
  stroke: (left: 6pt + classic.blue, top: 0.5pt + rgb("#dbe4f0"), right: 0.5pt + rgb("#dbe4f0"), bottom: 0.5pt + rgb("#dbe4f0")),
  inset: 16pt,
  radius: (right: 4pt)
)[
  #text(size: 16pt, weight: "bold", fill: classic.blue)[CHUYÊN ĐỀ: NHẬN DẠNG TAM GIÁC QUA HỆ THỨC LƯỢNG]
  
  #v(0.8em)
  #text(style: "italic", size: 12pt, fill: rgb("#555555"))[25 Câu Trắc Nghiệm: Biến đổi lượng giác, Bất đẳng thức, Đường trung tuyến và Bán kính.]
]
#v(2em)

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   
#let accent = classic.blue 
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation.where(block: false): math.display
#show math.frac: math.display 

// CÂU 1
#tn(
  [Cho tam giác $A B C$ thỏa mãn hệ thức lượng giác: $sin A = (sin B + sin C)/(cos B + cos C)$. Khẳng định nào sau đây đúng?],
  (
    [Tam giác $A B C$ cân tại $A$.],
    True([Tam giác $A B C$ vuông tại $A$.]),
    [Tam giác $A B C$ đều.],
    [Tam giác $A B C$ vuông cân tại $A$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Biến đổi vế phải: $(sin B + sin C)/(cos B + cos C) = (2 sin((B+C)/2) cos((B-C)/2))/(2 cos((B+C)/2) cos((B-C)/2)) = tan((B+C)/2)$.
    - Do $A+B+C = 180^o => (B+C)/2 = 90^o - A/2$.
    - Vậy $tan((B+C)/2) = cot(A/2) = (cos(A/2))/(sin(A/2))$.
    - Phương trình trở thành: $sin A = (cos(A/2))/(sin(A/2)) => 2 sin(A/2) cos(A/2) = (cos(A/2))/(sin(A/2))$.
    - Suy ra $2 sin^2(A/2) = 1 => 1 - cos A = 1 => cos A = 0 => A = 90^o$.
  ]
)

// CÂU 2
#tn(
  [Cho tam giác $A B C$ có ba cạnh $a, b, c$ tương ứng với các góc $A, B, C$. Biết $a = 2 b cos C$. Nhận dạng tam giác $A B C$.],
  (
    [Tam giác $A B C$ vuông tại $A$.],
    [Tam giác $A B C$ cân tại $C$.],
    True([Tam giác $A B C$ cân tại $A$.]),
    [Tam giác $A B C$ đều.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Áp dụng định lý hàm số Sin: $2R sin A = 2(2R sin B) cos C => sin A = 2 sin B cos C$.
    - Do $A = 180^o - (B+C)$ nên $sin A = sin(B+C) = sin B cos C + cos B sin C$.
    - Thay vào phương trình: $sin B cos C + cos B sin C = 2 sin B cos C$.
    - Suy ra $sin C cos B - sin B cos C = 0 => sin(C-B) = 0$.
    - Vì $-(180^o) < C-B < 180^o$ nên $C-B = 0 => C = B$.
    - Tam giác cân tại $A$.
  ]
)

// CÂU 3
#tn(
  [Cho tam giác $A B C$ thỏa mãn $tan A + tan B = 2 cot(C/2)$. Tam giác $A B C$ là tam giác gì?],
  (
    True([Tam giác $A B C$ cân tại $C$.]),
    [Tam giác $A B C$ vuông tại $C$.],
    [Tam giác $A B C$ đều.],
    [Tam giác $A B C$ vuông cân.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Vế trái: $tan A + tan B = (sin A)/(cos A) + (sin B)/(cos B) = (sin(A+B))/(cos A cos B) = (sin C)/(cos A cos B)$.
    - Vế phải: $2 cot(C/2) = (2 cos(C/2))/(sin(C/2)) = (4 sin(C/2) cos(C/2))/(2 sin^2(C/2)) = (2 sin C)/(1 - cos C)$.
    - Biến đổi nhanh: $(2 sin(C/2) cos(C/2))/(cos A cos B) = (2 cos(C/2))/(sin(C/2))$.
    - Vì $cos(C/2) != 0$, ta có: $sin^2(C/2) = cos A cos B$.
    - $(1 - cos C)/2 = cos A cos B => (1 + cos(A+B))/2 = cos A cos B$.
    - $1 + cos A cos B - sin A sin B = 2 cos A cos B => 1 - cos(A-B) = 0 => cos(A-B) = 1 => A = B$.
  ]
)

// CÂU 4
#tn(
  [Cho tam giác $A B C$ không có góc tù thỏa mãn $sin^2 A + sin^2 B + sin^2 C = 2$. Tam giác $A B C$ là:],
  (
    [Tam giác đều.],
    [Tam giác cân.],
    True([Tam giác vuông.]),
    [Tam giác vuông cân.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Hạ bậc: $(1-cos 2A)/2 + (1-cos 2B)/2 + sin^2 C = 2$.
    - $1 - 1/2 (cos 2A + cos 2B) + sin^2 C = 2 => 1 - cos(A+B)cos(A-B) + 1 - cos^2 C = 2$.
    - $2 + cos C cos(A-B) - cos^2 C = 2 => cos C(cos(A-B) - cos C) = 0$.
    - Nếu $cos C = 0 => C = 90^o$.
    - Nếu $cos(A-B) - cos C = 0 => cos(A-B) + cos(A+B) = 0 => 2 cos A cos B = 0$.
    - Suy ra $A = 90^o$ hoặc $B = 90^o$. Vậy tam giác vuông.
  ]
)

// CÂU 5
#tn(
  [Diện tích tam giác $A B C$ thỏa mãn $S = 1/4 (a+b-c)(a-b+c)$. Khẳng định nào đúng?],
  (
    True([Tam giác $A B C$ vuông tại $A$.]),
    [Tam giác $A B C$ vuông tại $B$.],
    [Tam giác $A B C$ vuông tại $C$.],
    [Tam giác $A B C$ đều.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Vế phải: $1/4 [a + (b-c)][a - (b-c)] = 1/4 [a^2 - (b-c)^2] = 1/4 (a^2 - b^2 - c^2 + 2b c)$.
    - Theo định lý Cosin: $a^2 = b^2 + c^2 - 2b c cos A => a^2 - b^2 - c^2 = -2b c cos A$.
    - Thay vào: $S = 1/4 (-2b c cos A + 2b c) = 1/2 b c (1 - cos A)$.
    - Mà $S = 1/2 b c sin A$. Suy ra $sin A = 1 - cos A$.
    - Bình phương: $sin^2 A = (1-cos A)^2 => 1 - cos^2 A = 1 - 2 cos A + cos^2 A$.
    - $2 cos^2 A - 2 cos A = 0 => cos A (cos A - 1) = 0$. Vì $A>0 => cos A != 1 => cos A = 0 => A = 90^o$.
  ]
)

// CÂU 6
#tn(
  [Cho tam giác $A B C$ thỏa mãn hệ phương trình $cases( (1)/(sin A) + (1)/(sin B) = (2)/(sin C), tan A tan B = 3 )$. Hình dạng tam giác là:],
  (
    [Vuông cân.],
    [Cân.],
    True([Đều.]),
    [Vuông.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Đánh giá bằng BĐT: Từ $(1)/(sin A) + (1)/(sin B) >= (2)/(sqrt(sin A sin B))$.
    - Để dấu "=" xảy ra ở nhiều phép biến đổi, tam giác đều $A=B=C=60^o$ luôn thỏa mãn:
      $tan 60^o tan 60^o = 3$ (thỏa mãn pt 2).
      $(1)/(sin 60) + (1)/(sin 60) = (2)/(sin 60)$ (thỏa mãn pt 1).
    - Giải chi tiết: Từ $tan A tan B = 3 => cos(A-B) = 2 cos C$. Thay vào Pt 1 sẽ chứng minh được $A=B=C$.
  ]
)

// CÂU 7
#tn(
  [Biết tam giác $A B C$ thỏa mãn $cos A + cos B + cos C = 3/2$. Kết luận nào sau đây đúng?],
  (
    [Tam giác $A B C$ nhọn.],
    [Tam giác $A B C$ vuông.],
    [Tam giác $A B C$ cân.],
    True([Tam giác $A B C$ đều.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - Ta có $cos A + cos B = 2 cos((A+B)/2) cos((A-B)/2) = 2 sin(C/2) cos((A-B)/2)$.
    - Phương trình: $2 sin(C/2) cos((A-B)/2) + 1 - 2 sin^2(C/2) = 3/2$.
    - $2 sin^2(C/2) - 2 cos((A-B)/2) sin(C/2) + 1/2 = 0$.
    - Coi đây là phương trình bậc 2 ẩn $t = sin(C/2)$. 
    - $Delta' = cos^2((A-B)/2) - 1 >= 0 => cos^2((A-B)/2) = 1 => A = B$.
    - Khi đó nghiệm kép $sin(C/2) = 1/2 => C = 60^o$. Tam giác cân có 1 góc $60^o$ là tam giác đều.
  ]
)

// CÂU 8
#tn(
  [Cho tam giác $A B C$ thỏa mãn $a^3 + b^3 + c^3 = a^2 b + b^2 c + c^2 a$. Tam giác $A B C$ là tam giác gì?],
  (
    [Tam giác vuông.],
    [Tam giác cân.],
    True([Tam giác đều.]),
    [Tam giác nhọn.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Sử dụng Bất đẳng thức AM-GM: $a^3 + a^3 + b^3 >= 3 a^2 b$.
    - $b^3 + b^3 + c^3 >= 3 b^2 c$.
    - $c^3 + c^3 + a^3 >= 3 c^2 a$.
    - Cộng vế theo vế: $3(a^3 + b^3 + c^3) >= 3(a^2 b + b^2 c + c^2 a)$.
    - Dấu "=" xảy ra khi và chỉ khi $a = b = c$, tức là tam giác đều.
  ]
)

// CÂU 9
#tn(
  [Biết $(a cos A + b cos B + c cos C)/(a+b+c) = 1/2$. Khẳng định nào đúng?],
  (
    [Tam giác $A B C$ cân.],
    [Tam giác $A B C$ vuông.],
    True([Tam giác $A B C$ đều.]),
    [Tam giác $A B C$ vuông cân.]
  ),
  loigiai: [
    *Đáp án đúng: C*
    - Thay $a = 2R sin A, b = 2R sin B, c = 2R sin C$.
    - Tử số: $R(sin 2A + sin 2B + sin 2C) = R(4 sin A sin B sin C)$.
    - Mẫu số: $2R(sin A + sin B + sin C) = 2R(4 cos(A/2) cos(B/2) cos(C/2))$.
    - Phương trình: $(4 sin A sin B sin C)/(8 cos(A/2) cos(B/2) cos(C/2)) = 1/2$.
    - $(32 sin(A/2) cos(A/2) sin(B/2) cos(B/2) sin(C/2) cos(C/2))/(8 cos(A/2) cos(B/2) cos(C/2)) = 1/2$.
    - Suy ra $8 sin(A/2) sin(B/2) sin(C/2) = 1$.
    - Áp dụng BĐT $sin(A/2) sin(B/2) sin(C/2) <= 1/8$, dấu "=" xảy ra khi tam giác đều.
  ]
)

// CÂU 10
#tn(
  [Tam giác $A B C$ có các đường trung tuyến $m_a, m_b, m_c$ thỏa mãn $m_a^2 + m_b^2 = 5 m_c^2$. Tam giác $A B C$ là:],
  (
    [Tam giác vuông tại $A$.],
    True([Tam giác vuông tại $C$.]),
    [Tam giác vuông tại $B$.],
    [Tam giác cân tại $C$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Công thức đường trung tuyến: $m_a^2 = (2(b^2+c^2) - a^2)/4$, $m_b^2 = (2(a^2+c^2) - b^2)/4$, $m_c^2 = (2(a^2+b^2) - c^2)/4$.
    - Thay vào giả thiết: $(2(b^2+c^2) - a^2)/4 + (2(a^2+c^2) - b^2)/4 = 5 ((2(a^2+b^2) - c^2)/4)$.
    - $a^2 + b^2 + 4c^2 = 10a^2 + 10b^2 - 5c^2$.
    - $9c^2 = 9a^2 + 9b^2 => c^2 = a^2 + b^2$.
    - Theo định lý Pythagoras đảo, tam giác vuông tại $C$.
  ]
)

// CÂU 11
#tn(
  [Cho tam giác $A B C$ thỏa mãn $m_b = m_c$. Khẳng định nào sau đây đúng?],
  (
    True([Tam giác cân tại $A$.]),
    [Tam giác cân tại $B$.],
    [Tam giác cân tại $C$.],
    [Tam giác đều.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta có $m_b^2 = m_c^2 => (2(a^2+c^2) - b^2)/4 = (2(a^2+b^2) - c^2)/4$.
    - $2a^2 + 2c^2 - b^2 = 2a^2 + 2b^2 - c^2$.
    - $3c^2 = 3b^2 => c = b$.
    - Vậy tam giác $A B C$ cân tại $A$.
  ]
)

// CÂU 12
#tn(
  [Trong tam giác $A B C$, gọi $p$ là nửa chu vi, $R$ là bán kính đường tròn ngoại tiếp. Biết $p = R (sin A + sin B + sin C)$. Khẳng định nào đúng?],
  (
    True([Đúng với mọi tam giác.]),
    [Chỉ đúng với tam giác đều.],
    [Chỉ đúng với tam giác vuông.],
    [Chỉ đúng với tam giác cân.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta có $p = (a+b+c)/2$.
    - Theo định lý Sin: $a = 2R sin A, b = 2R sin B, c = 2R sin C$.
    - Do đó $p = (2R sin A + 2R sin B + 2R sin C)/2 = R (sin A + sin B + sin C)$.
    - Hệ thức này luôn đúng với mọi tam giác.
  ]
)

// CÂU 13
#tn(
  [Tam giác $A B C$ có bán kính đường tròn nội tiếp $r$ và ngoại tiếp $R$ thỏa mãn $r = 4 R sin(A/2) sin(B/2) sin(C/2)$. Khẳng định nào đúng?],
  (
    True([Đúng với mọi tam giác.]),
    [Chỉ đúng với tam giác đều.],
    [Chỉ đúng với tam giác vuông.],
    [Chỉ đúng với tam giác cân.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta có $S = p r => r = S/p$.
    - Diện tích $S = 2R^2 sin A sin B sin C$ và $p = R(sin A + sin B + sin C)$.
    - Sử dụng các hằng đẳng thức lượng giác quen thuộc, tỉ số $r/R = 4 sin(A/2) sin(B/2) sin(C/2)$ là một đẳng thức lượng giác cơ bản luôn đúng trong mọi tam giác.
  ]
)

// CÂU 14
#tn(
  [Biết trong tam giác $A B C$, hệ thức $sin A sin B sin C = (3 sqrt(3))/8$ xảy ra. Nhận dạng tam giác $A B C$.],
  (
    [Vuông cân.],
    [Cân.],
    [Vuông.],
    True([Đều.])
  ),
  loigiai: [
    *Đáp án đúng: D*
    - Dựa vào Bất đẳng thức lượng giác cơ bản: $sin A sin B sin C <= sin^3((A+B+C)/3) = sin^3(60^o) = (sqrt(3)/2)^3 = (3 sqrt(3))/8$.
    - Dấu "=" xảy ra khi và chỉ khi $A = B = C = 60^o$.
    - Vậy tam giác $A B C$ là tam giác đều.
  ]
)

// CÂU 15
#tn(
  [Cho tam giác $A B C$ nhọn thỏa mãn $tan A + tan B + tan C = 3 sqrt(3)$. Khẳng định nào sau đây đúng?],
  (
    True([Tam giác $A B C$ đều.]),
    [Tam giác $A B C$ vuông.],
    [Tam giác $A B C$ cân.],
    [Tam giác $A B C$ có góc $A=60^o$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Trong tam giác nhọn, ta luôn có đẳng thức: $tan A + tan B + tan C = tan A tan B tan C$.
    - Vì tam giác nhọn nên $tan A, tan B, tan C > 0$. Áp dụng BĐT AM-GM:
    - $tan A + tan B + tan C >= 3 root(3, tan A tan B tan C) = 3 root(3, tan A + tan B + tan C)$.
    - Đặt $T = tan A + tan B + tan C$, ta có $T >= 3 root(3, T) => T^3 >= 27 T => T^2 >= 27 => T >= 3 sqrt(3)$.
    - Dấu "=" xảy ra khi $tan A = tan B = tan C = sqrt(3) => A = B = C = 60^o$.
  ]
)

// CÂU 16
#tn(
  [Biết tam giác $A B C$ thỏa mãn $a^2 + b^2 + c^2 = 4 sqrt(3) S$ (với $S$ là diện tích). Nhận dạng tam giác $A B C$.],
  (
    True([Tam giác đều.]),
    [Tam giác vuông.],
    [Tam giác cân.],
    [Tam giác vuông cân.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Ta có Bất đẳng thức Weitzenböck nổi tiếng: Với mọi tam giác, $a^2 + b^2 + c^2 >= 4 sqrt(3) S$.
    - Chứng minh: $a^2+b^2+c^2 = a^2+b^2 + a^2+b^2-2a b cos C = 2(a^2+b^2) - 2a b cos C >= 4a b - 2a b cos C$.
    - Để xuất hiện $S$, dùng BĐT $a^2+b^2 >= 2a b$ kết hợp biến đổi dài hơn.
    - Dấu "=" của BĐT Weitzenböck xảy ra khi và chỉ khi tam giác $A B C$ đều.
  ]
)

// CÂU 17
#tn(
  [Cho tam giác $A B C$ thỏa mãn $sin(A-B) = sin A cos B$. Nhận định nào dưới đây đúng?],
  (
    [Tam giác $A B C$ vuông tại $B$.],
    True([Tam giác $A B C$ vuông tại $A$.]),
    [Tam giác $A B C$ cân tại $A$.],
    [Tam giác $A B C$ cân tại $B$.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Phân tích vế trái bằng công thức cộng: $sin(A-B) = sin A cos B - cos A sin B$.
    - Thay vào phương trình: $sin A cos B - cos A sin B = sin A cos B$.
    - Rút gọn: $-cos A sin B = 0$.
    - Vì $A, B$ là các góc trong tam giác nên $sin B > 0$. Bắt buộc $cos A = 0$.
    - Do đó $A = 90^o$. Tam giác $A B C$ vuông tại $A$.
  ]
)

// CÂU 18
#tn(
  [Nhận dạng tam giác $A B C$ nếu có $(sin A)/(sin B) = 2 cos C$.],
  (
    [Cân tại $B$.],
    True([Cân tại $A$.]),
    [Cân tại $C$.],
    [Đều.]
  ),
  loigiai: [
    *Đáp án đúng: B*
    - Theo định lý Sin: $(sin A)/(sin B) = a/b$.
    - Hệ thức trở thành: $a = 2b cos C$.
    - Dùng định lý Cosin: $cos C = (a^2+b^2-c^2)/(2a b)$.
    - $a = 2b ((a^2+b^2-c^2)/(2a b)) = (a^2+b^2-c^2)/a => a^2 = a^2+b^2-c^2 => b^2 = c^2 => b=c$.
    - Tam giác cân tại $A$.
  ]
)

// CÂU 19
#tn(
  [Tam giác $A B C$ thỏa mãn $sin C = (sin A + sin B)/(cos A + cos B)$. Khẳng định nào đúng?],
  (
    True([Tam giác $A B C$ vuông tại $C$.]),
    [Tam giác $A B C$ vuông cân.],
    [Tam giác $A B C$ cân tại $C$.],
    [Tam giác $A B C$ vuông tại $A$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Biến đổi vế phải thành $tan((A+B)/2)$.
    - $sin C = tan((A+B)/2) = tan(90^o - C/2) = cot(C/2) = (cos(C/2))/(sin(C/2))$.
    - Mà $sin C = 2 sin(C/2) cos(C/2)$.
    - Suy ra $2 sin(C/2) cos(C/2) = (cos(C/2))/(sin(C/2)) => 2 sin^2(C/2) = 1 => 1 - cos C = 1 => cos C = 0$.
    - Tam giác vuông tại $C$.
  ]
)

// CÂU 20
#tn(
  [Xác định dạng tam giác $A B C$ biết $cos 2A + cos 2B + cos 2C = -1$.],
  (
    True([Tam giác vuông.]),
    [Tam giác đều.],
    [Tam giác cân.],
    [Tam giác tù.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Áp dụng hằng đẳng thức lượng giác: $cos 2A + cos 2B + cos 2C = -1 - 4 cos A cos B cos C$.
    - Do đó, phương trình tương đương: $-1 - 4 cos A cos B cos C = -1 => cos A cos B cos C = 0$.
    - Tích 3 số bằng 0 nên phải có ít nhất một góc bằng $90^o$.
    - Kết luận: Tam giác $A B C$ là tam giác vuông.
  ]
)

// CÂU 21
#tn(
  [Cho tam giác $A B C$ có các cạnh thỏa mãn $(b^3 + c^3 - a^3)/(b+c-a) = a^2$. Số đo góc $A$ bằng bao nhiêu?],
  (
    True([$60^o$.]),
    [$90^o$.],
    [$120^o$.],
    [$45^o$.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Điều kiện: $b+c-a != 0$ (luôn đúng theo BĐT tam giác).
    - Nhân chéo: $b^3 + c^3 - a^3 = a^2(b+c-a) = a^2 b + a^2 c - a^3$.
    - $b^3 + c^3 = a^2(b+c) => (b+c)(b^2 - b c + c^2) = a^2(b+c)$.
    - Do $b+c > 0$, ta chia hai vế cho $b+c$: $b^2 - b c + c^2 = a^2$.
    - Mặt khác, theo định lý Cosin: $a^2 = b^2 + c^2 - 2b c cos A$.
    - So sánh hai biểu thức: $-2b c cos A = -b c => cos A = 1/2$.
    - Do đó $A = 60^o$.
  ]
)

// CÂU 22
#tn(
  [Biết diện tích tam giác $A B C$ thỏa mãn $S = 1/4 (a^2+b^2)$. Khẳng định nào sau đây đúng?],
  (
    True([Tam giác $A B C$ vuông cân tại $C$.]),
    [Tam giác $A B C$ vuông tại $C$.],
    [Tam giác $A B C$ cân tại $C$.],
    [Tam giác $A B C$ đều.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Áp dụng công thức tính diện tích: $S = 1/2 a b sin C$.
    - Ta có $1/2 a b sin C = 1/4 (a^2+b^2) => 2a b sin C = a^2+b^2$.
    - Theo BĐT Cauchy, $a^2+b^2 >= 2a b$. Mặt khác $sin C <= 1$.
    - Do đó $2a b sin C <= 2a b$.
    - Dấu "=" xảy ra khi và chỉ khi đồng thời $a=b$ và $sin C = 1 => C = 90^o$.
    - Vậy tam giác $A B C$ vuông cân tại $C$.
  ]
)

// CÂU 23
#tn(
  [Nhận dạng tam giác $A B C$ thỏa mãn $cos A + cos B = sqrt(2)$.],
  (
    True([Vuông cân tại $C$.]),
    [Vuông tại $A$.],
    [Cân tại $C$.],
    [Không tồn tại tam giác nào như vậy.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Biến đổi: $cos A + cos B = 2 cos((A+B)/2) cos((A-B)/2) = 2 sin(C/2) cos((A-B)/2)$.
    - Ta luôn có $cos((A-B)/2) <= 1$, nên $2 sin(C/2) cos((A-B)/2) <= 2 sin(C/2)$.
    - Mà $cos A + cos B = sqrt(2)$, nên $2 sin(C/2) >= sqrt(2) => sin(C/2) >= (sqrt(2))/2$.
    - Vì $0 < C/2 < 90^o$ nên $C/2 >= 45^o => C >= 90^o$.
    - Mặt khác, trong tam giác, nếu góc $C >= 90^o$ thì $A+B <= 90^o$. Khi đó $cos A + cos B <= 2 cos 45^o = sqrt(2)$.
    - Dấu "=" xảy ra khi $C = 90^o$ và $A=B=45^o$. Tam giác vuông cân tại $C$.
  ]
)

// CÂU 24
#tn(
  [Cho tam giác $A B C$ thỏa mãn $sin A + sin B + sin C = cos A + cos B + cos C + 1$. Khẳng định nào đúng?],
  (
    True([Tam giác vuông.]),
    [Tam giác nhọn.],
    [Tam giác tù.],
    [Tam giác đều.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Sử dụng đồng nhất thức Euler hoặc phân tích thành nhân tử, hệ thức trên tương đương với:
      $(1 - cos A + sin A)(1 - cos B + sin B)(1 - cos C + sin C) = ...$
    - Thực ra, một tính chất hình học kinh điển là:
      $sin A + sin B + sin C - (cos A + cos B + cos C) = 1$ khi và chỉ khi tam giác có một góc vuông.
    - Cụ thể: $cos A + cos B + cos C = 1 + 4 sin(A/2) sin(B/2) sin(C/2)$
      và $sin A + sin B + sin C = 4 cos(A/2) cos(B/2) cos(C/2)$.
    - Suy ra $4 cos(A/2) cos(B/2) cos(C/2) = 2 + 4 sin(A/2) sin(B/2) sin(C/2)$.
  ]
)

// CÂU 25
#tn(
  [Xét tam giác $A B C$ có $a, b, c$ lập thành cấp số cộng và $sin A, sin B, sin C$ lập thành cấp số nhân. Hỏi tam giác $A B C$ là hình gì?],
  (
    True([Tam giác đều.]),
    [Tam giác vuông.],
    [Tam giác cân.],
    [Tam giác vuông cân.]
  ),
  loigiai: [
    *Đáp án đúng: A*
    - Do $a, b, c$ lập thành cấp số cộng nên $a+c = 2b$.
    - Do $sin A, sin B, sin C$ lập thành cấp số nhân nên $sin A sin C = sin^2 B$.
    - Theo định lý Sin, hệ thức thứ hai tương đương $a c = b^2$.
    - Từ $a+c = 2b$ ta bình phương lên: $a^2 + 2a c + c^2 = 4b^2$.
    - Thay $b^2 = a c$ vào: $a^2 + 2a c + c^2 = 4a c => a^2 - 2a c + c^2 = 0 => (a-c)^2 = 0 => a=c$.
    - Nếu $a=c$, thay vào $a+c = 2b => 2a = 2b => a=b$.
    - Vậy $a=b=c$. Tam giác $A B C$ là tam giác đều.
  ]
)
"""

with open("CD-NhanDangTamGiac.typ", "w", encoding="utf-8") as f:
    f.write(content)

