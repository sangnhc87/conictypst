#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-BÀI 8: TỌA ĐỘ VECTƠ
// Toán 12 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)


#show: lecture-theme.with(
  title:       "Bài 2: Toạ độ của vectơ trong không gian",
  subtitle:    "TOÁN 12 — Chương II: Vectơ và Hệ trục tọa độ trong không gian",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd


// ==================== Đề 1 ====================




#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho $arrow(a) = 2 arrow(j) - 3 arrow(k)$, $arrow(b) = 4 arrow(i) + arrow(j) + arrow(k)$. Tính độ dài của $arrow(v) = 2 arrow(a) - arrow(b)$],
  (
    True([$sqrt(74)$]),
    [$3 sqrt(6)$],
    [$5 sqrt(2)$],
    [$sqrt(42)$]
  ),
  loigiai: [
    #step[Xác định tọa độ của hai vectơ $arrow(a)$ và $arrow(b)$:
    - Từ $arrow(a) = 2 arrow(j) - 3 arrow(k) => arrow(a) = (0; 2; -3)$.
    - Từ $arrow(b) = 4 arrow(i) + arrow(j) + arrow(k) => arrow(b) = (4; 1; 1)$.]
    #step[Tính tọa độ của vectơ $arrow(v) = 2 arrow(a) - arrow(b)$:
    $arrow(v) = 2(0; 2; -3) - (4; 1; 1) = (0; 4; -6) - (4; 1; 1) = (-4; 3; -7)$.]
    #step[Tính độ dài của vectơ $arrow(v)$:
    $|arrow(v)| = sqrt((-4)^2 + 3^2 + (-7)^2) = sqrt(16 + 9 + 49) = sqrt(74)$.]
    #step[Kết luận: Chọn đáp án A.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(2; -1; 5)$, $B(5; -5; 7)$; $M(x; y; 1)$. Khi $A, B, M$ thẳng hàng thì giá trị của $x; y$ là],
  (
    [$x = 4; y = -7$.],
    True([$x = -4; y = 7$.]),
    [$x = 4; y = 7$.],
    [$x = -4; y = -7$.]
  ),
  loigiai: [
    #step[Tính tọa độ các vectơ $arrow(A B)$ và $arrow(A M)$:
    - $arrow(A B) = (5-2; -5-(-1); 7-5) = (3; -4; 2)$.
    - $arrow(A M) = (x-2; y+1; 1-5) = (x-2; y+1; -4)$.]
    #step[Để ba điểm $A, B, M$ thẳng hàng thì hai vectơ $arrow(A B)$ và $arrow(A M)$ cùng phương, tức là tồn tại số thực $k$ sao cho:
    $arrow(A M) = k arrow(A B) <=> cases(x-2 = 3k, y+1 = -4k, -4 = 2k)$.]
    #step[Giải hệ phương trình trên:
    - Từ phương trình thứ ba: $2k = -4 => k = -2$.
    - Thế $k = -2$ vào hai phương trình còn lại ta được:
      $cases(x-2 = 3(-2) = -6 => x = -4, y+1 = -4(-2) = 8 => y = 7)$.]
    #step[Kết luận: Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$ cho 3 điểm $A(1, 2, -1)$, $B(2, -1, 3)$, $C(-3, 5, 1)$. Tọa độ điểm $D$ sao cho tứ giác $A B C D$ là hình bình hành là],
  (
    [$(-2, 2, 5)$.],
    [$(-4, 8, -5)$.],
    True([$(-4, 8, -3)$.]),
    [$(-2, 8, -3)$.]
  ),
  loigiai: [
    #step[Để tứ giác $A B C D$ là hình bình hành thì ta có đẳng thức vectơ:
    $arrow(A D) = arrow(B C) <=> D - A = C - B => D = A + C - B$.]
    #step[Tính toán tọa độ điểm $D$:
    - $x_D = x_A + x_C - x_B = 1 + (-3) - 2 = -4$.
    - $y_D = y_A + y_C - y_B = 2 + 5 - (-1) = 8$.
    - $z_D = z_A + z_C - z_B = -1 + 1 - 3 = -3$.]
    #step[Vậy điểm $D$ có tọa độ là $(-4; 8; -3)$. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho tứ diện $A B C D$ với $A(1; -4; 2), B(2; 1; -3), C(3; 0; -2)$ và $D(2; -5; -1)$. Điểm $G$ thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ có tọa độ là:],
  (
    [$G(2; -1; -1)$.],
    True([$G(2; -2; -1)$.]),
    [$G(0; -1; -1)$.],
    [$G(6; -3; -3)$.]
  ),
  loigiai: [
    #step[Điểm $G$ thỏa mãn đẳng thức $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ chính là trọng tâm của tứ diện $A B C D$.]
    #step[Công thức xác định tọa độ trọng tâm $G$ của tứ diện $A B C D$:
    $G = ((A+B+C+D)/4) => cases(
      x_G = (x_A + x_B + x_C + x_D)/4,
      y_G = (y_A + y_B + y_C + y_D)/4,
      z_G = (z_A + z_B + z_C + z_D)/4
    )$.]
    #step[Thay số liệu tọa độ các đỉnh vào công thức:
    - $x_G = (1 + 2 + 3 + 2)/4 = 8/4 = 2$.
    - $y_G = (-4 + 1 + 0 - 5)/4 = -8/4 = -2$.
    - $z_G = (2 - 3 - 2 - 1)/4 = -4/4 = -1$.
    Vậy $G(2; -2; -1)$. Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho tam giác $A B C$ có $A(1; -1; -2)$ và trọng tâm $G(2; 1; -3)$. Tọa độ của vectơ $arrow(u) = arrow(A B) + arrow(A C)$ là],
  (
    [$(3; 6; 3)$.],
    True([(3; 6; -3).]),
    [$(3; -3; 6)$.],
    [$(3; 2; 1)$.]
  ),
  loigiai: [
    #step[Do $G$ là trọng tâm của tam giác $A B C$, với điểm $A$ tùy ý, ta luôn có hệ thức trọng tâm:
    $arrow(A B) + arrow(A C) + arrow(A A) = 3 arrow(A G) <=> arrow(A B) + arrow(A C) = 3 arrow(A G)$.]
    #step[Tính tọa độ của vectơ $arrow(A G)$:
    $arrow(A G) = G - A = (2 - 1; 1 - (-1); -3 - (-2)) = (1; 2; -1)$.]
    #step[Tọa độ của vectơ $arrow(u) = 3 arrow(A G)$ là:
    $arrow(u) = 3(1; 2; -1) = (3; 6; -3)$.]
    #step[Kết luận: Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ trục tọa độ $O x y z$, cho hai điểm $A(1; 2; -1), B(2; -1; 3)$. Tìm tọa độ điểm $I$ thỏa mãn $arrow(I A) + 2 arrow(I B) = arrow(0)$.],
  (
    [$I(-5/3; 0; 5/3)$.],
    [$I(5/3; 5/3; 0)$.],
    True([$I(5/3; 0; 5/3)$.]),
    [$I(0; 5/3; 5/3)$.]
  ),
  loigiai: [
    #step[Biến đổi hệ thức vectơ đã cho để tìm mối liên hệ giữa tọa độ điểm $I$ và các điểm $A, B$:
    $arrow(I A) + 2 arrow(I B) = arrow(0) <=> (arrow(A) - arrow(I)) + 2(arrow(B) - arrow(I)) = arrow(0) <=> 3 arrow(I) = arrow(A) + 2 arrow(B) => I = (A + 2B)/3$.]
    #step[Tính tọa độ điểm $I$:
    - $x_I = (x_A + 2 x_B)/3 = (1 + 2 times 2)/3 = 5/3$.
    - $y_I = (y_A + 2 y_B)/3 = (2 + 2 times (-1))/3 = 0/3 = 0$.
    - $z_I = (z_A + 2 z_B)/3 = (-1 + 2 times 3)/3 = 5/3$.]
    #step[Vậy điểm $I$ có tọa độ là $(5/3; 0; 5/3)$. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $E(1; 3; 2), F(0; -1; 5), K(2; 4; -1)$ và tam giác $A B C$ thỏa mãn $arrow(A E) + arrow(B F) + arrow(C K) = arrow(0)$. Tọa độ trọng tâm $G$ của tam giác $Delta A B C$ là],
  (
    True([$G(1; 2; 2)$.]),
    [$G(-1; -4; 3)$.],
    [$G(2; 2; 1)$.],
    [$G(1; 1; -3)$.]
  ),
  loigiai: [
    #step[Gọi $G$ là trọng tâm của tam giác $A B C$, theo tính chất của trọng tâm ta có:
    $arrow(G A) + arrow(G B) + arrow(G C) = arrow(0)$.]
    #step[Chèn điểm $G$ vào hệ thức vectơ giả thiết cho:
    $arrow(A E) + arrow(B F) + arrow(C K) = arrow(0)$
    $<=> (arrow(G E) - arrow(G A)) + (arrow(G F) - arrow(G B)) + (arrow(G K) - arrow(G C)) = arrow(0)$
    $<=> arrow(G E) + arrow(G F) + arrow(G K) - (arrow(G A) + arrow(G B) + arrow(G C)) = arrow(0)$
    $<=> arrow(G E) + arrow(G F) + arrow(G K) = arrow(0)$.]
    #step[Điều này chứng tỏ $G$ cũng chính là trọng tâm của tam giác $E F K$.]
    #step[Tọa độ trọng tâm $G$ là trung bình cộng tọa độ ba điểm $E, F, K$:
    - $x_G = (x_E + x_F + x_K)/3 = (1 + 0 + 2)/3 = 3/3 = 1$.
    - $y_G = (y_E + y_F + y_K)/3 = (3 - 1 + 4)/3 = 6/3 = 2$.
    - $z_G = (z_E + z_F + z_K)/3 = (2 + 5 - 1)/3 = 6/3 = 2$.
    Vậy $G(1; 2; 2)$. Chọn đáp án A.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai vectơ $arrow(P Q) = (0; 1; -2)$, $arrow(P R) = (-2; -1; 0)$ và điểm $M(1; -2; 2)$ là trung điểm của đoạn $Q R$. Tọa độ điểm $Q$ là],
  (
    [$(-1; 1; -2)$.],
    [$(-2; 2; -3)$.],
    [$(0; 1; 3)$.],
    True([$(2; -1; 1)$.])
  ),
  loigiai: [
    #step[Theo công thức liên hệ giữa các điểm, ta có:
    - $arrow(P Q) = Q - P => Q = P + arrow(P Q)$.
    - $arrow(P R) = R - P => R = P + arrow(P R)$.]
    #step[Vì $M(1; -2; 2)$ là trung điểm của đoạn $Q R$, ta có hệ thức trung điểm:
    $M = (Q + R)/2 = (P + arrow(P Q) + P + arrow(P R))/2 = P + (arrow(P Q) + arrow(P R))/2$.]
    #step[Tính tổng hai vectơ:
    $arrow(P Q) + arrow(P R) = (0 + (-2); 1 + (-1); -2 + 0) = (-2; 0; -2)$.
    Suy ra: $M = P + (-1; 0; -1) => P = M - (-1; 0; -1) = (1 - (-1); -2 - 0; 2 - (-1)) = (2; -2; 3)$.]
    #step[Tọa độ điểm $Q$ là:
    $Q = P + arrow(P Q) = (2; -2; 3) + (0; 1; -2) = (2; -1; 1)$. Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho bốn điểm $A(2; 0; 0), B(0; 2; 0), C(0; 0; 2)$ và $D(2; 2; 2)$. Gọi $M$ và $N$ lần lượt là trung điểm của $A B$ và $C D$. Tọa độ trung điểm $I$ của đoạn thẳng $M N$ là:],
  (
    [$I(1; 1; 0)$.],
    [$I(1/2; 1/2; 1)$.],
    True([$I(1; 1; 1)$.]),
    [$I(1; -1; 2)$.]
  ),
  loigiai: [
    #step[Tính tọa độ trung điểm $M$ của $A B$:
    $M = ( (x_A+x_B)/2; (y_A+y_B)/2; (z_A+z_B)/2 ) = (1; 1; 0)$.]
    #step[Tính tọa độ trung điểm $N$ của $C D$:
    $N = ( (x_C+x_D)/2; (y_C+y_D)/2; (z_C+z_D)/2 ) = (1; 1; 2)$.]
    #step[Tọa độ trung điểm $I$ của đoạn $M N$ là:
    $I = ( (x_M+x_N)/2; (y_M+y_N)/2; (z_M+z_N)/2 ) = (1; 1; 1)$.]
    #step[Kết luận: Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(1; 2; -1), B(2; -1; 3), C(-2; 3; 3)$. Điểm $M(a; b; c)$ là đỉnh thứ tư của hình bình hành $A B C M$, khi đó $P = a^2 + b^2 - c^2$ có giá trị bằng],
  (
    [$42$.],
    [$-50$.],
    [$-48$.],
    True([$44$.])
  ),
  loigiai: [
    #step[Để tứ giác $A B C M$ là hình bình hành thì ta có hệ thức vectơ:
    $arrow(A M) = arrow(B C) <=> M - A = C - B => M = A + C - B$.]
    #step[Tính tọa độ của điểm $M$:
    - $a = x_A + x_C - x_B = 1 + (-2) - 2 = -3$.
    - $b = y_A + y_C - y_B = 2 + 3 - (-1) = 6$.
    - $c = z_A + z_C - z_B = -1 + 3 - 3 = -1$.
    Vậy điểm $M$ có tọa độ là $(-3; 6; -1)$.]
    #step[Tính giá trị biểu thức $P$:
    $P = a^2 + b^2 - c^2 = (-3)^2 + 6^2 - (-1)^2 = 9 + 36 - 1 = 44$.]
    #step[Kết luận: Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho điểm $A(2; 1; 3)$ và điểm $B(4; -3; 1)$. Tọa độ trung điểm $I$ của đoạn thẳng $A B$ là],
  (
    [$(6; -2; 4)$.],
    True([$(3; -1; 2)$.]),
    [$(1; -2; -1)$.],
    [$(2; -4; -2)$.]
  ),
  loigiai: [
    #step[Tọa độ trung điểm $I(x_I; y_I; z_I)$ của đoạn thẳng $A B$ được tính theo công thức:
    $x_I = (x_A + x_B)/2 = (2 + 4)/2 = 3$.]
    #step[Tương tự cho các tung độ và cao độ:
    - $y_I = (y_A + y_B)/2 = (1 - 3)/2 = -1$.
    - $z_I = (z_A + z_B)/2 = (3 + 1)/2 = 2$.]
    #step[Vậy $I(3; -1; 2)$. Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian hệ tọa độ $O x y z$, cho ba vectơ $arrow(a) = (3; 4; 2); arrow(b) = (-5; 0; 3); arrow(c) = (1; 2; -4)$. Tìm tọa độ của vectơ $arrow(u) = 3 arrow(a) + 2 arrow(b) - arrow(c)$:],
  (
    True([$arrow(u) = (-2; 10; 16)$.]),
    [$arrow(u) = (2; 10; -16)$.],
    [$arrow(u) = (-1; 5; 8)$.],
    [$arrow(u) = (-2; -10; 16)$.]
  ),
  loigiai: [
    #step[Ta tính tọa độ của vectơ $arrow(u)$ theo từng thành phần:
    $x_u = 3 x_a + 2 x_b - x_c = 3(3) + 2(-5) - 1 = 9 - 10 - 1 = -2$.]
    #step[Tương tự cho thành phần $y$ và $z$:
    - $y_u = 3 y_a + 2 y_b - y_c = 3(4) + 2(0) - 2 = 12 - 2 = 10$.
    - $z_u = 3 z_a + 2 z_b - z_c = 3(2) + 2(3) - (-4) = 6 + 6 + 4 = 16$.]
    #step[Vậy $arrow(u) = (-2; 10; 16)$. Chọn đáp án A.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho $arrow(a) = (-3; 5; 2), arrow(b) = (0; -1; 3), arrow(c) = (1; -1; 1)$ thì tọa độ $arrow(v) = 2 arrow(a) - 3 arrow(b) + 15 arrow(c)$ là],
  (
    [$arrow(v) = (-9; 2; 10)$.],
    [$arrow(v) = (9; -1; 10)$.],
    [$arrow(v) = (9; 2; 10)$.],
    True([$arrow(v) = (9; -2; 10)$.])
  ),
  loigiai: [
    #step[Tính tọa độ từng thành phần của vectơ $arrow(v) = 2 arrow(a) - 3 arrow(b) + 15 arrow(c)$:
    $x_v = 2 x_a - 3 x_b + 15 x_c = 2(-3) - 3(0) + 15(1) = -6 + 15 = 9$.]
    #step[Tương tự cho thành phần tung độ và cao độ:
    - $y_v = 2 y_a - 3 y_b + 15 y_c = 2(5) - 3(-1) + 15(-1) = 10 + 3 - 15 = -2$.
    - $z_v = 2 z_a - 3 z_b + 15 z_c = 2(2) - 3(3) + 15(1) = 4 - 9 + 15 = 10$.]
    #step[Vậy $arrow(v) = (9; -2; 10)$. Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ trục tọa độ $O x y z$ cho điểm $A(0; -2; -1)$ và $B(1; -1; 2)$. Tìm tọa độ điểm $M$ sao cho $arrow(M A) = 2 arrow(M B)$?],
  (
    [$M(2/3; -4/3; 1)$.],
    [$M(1/2; -3/2; 1/2)$.],
    True([$M(2; 0; 5)$.]),
    [$M(-1; -3; -4)$.]
  ),
  loigiai: [
    #step[Biến đổi hệ thức vectơ để tìm điểm $M$:
    $arrow(M A) = 2 arrow(M B) <=> A - M = 2(B - M) <=> A - M = 2B - 2M <=> M = 2B - A$.]
    #step[Tính tọa độ cụ thể của điểm $M$:
    - $x_M = 2 x_B - x_A = 2(1) - 0 = 2$.
    - $y_M = 2 y_B - y_A = 2(-1) - (-2) = 0$.
    - $z_M = 2 z_B - z_A = 2(2) - (-1) = 5$.]
    #step[Vậy điểm $M$ có tọa độ là $(2; 0; 5)$. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(1; 3; 4)$ và $B(1; 0; 1)$. Điểm $M$ nằm trên trục $O z$ và cách đều hai điểm $A, B$ có tọa độ là.],
  (
    True([$(0; 0; 4)$.]),
    [$(2; 0; 0)$.],
    [$(0; 0; 2)$.],
    [$(0; 4; 0)$.]
  ),
  loigiai: [
    #step[Vì điểm $M$ nằm trên trục $O z$ nên tọa độ của $M$ có dạng $M(0; 0; z)$.]
    #step[Điểm $M$ cách đều hai điểm $A, B$ khi và chỉ khi:
    $M A = M B <=> M A^2 = M B^2$.]
    #step[Sử dụng công thức tính khoảng cách trong không gian:
    $(0 - 1)^2 + (0 - 3)^2 + (z - 4)^2 = (0 - 1)^2 + (0 - 0)^2 + (z - 1)^2$
    $<=> 1 + 9 + (z-4)^2 = 1 + 0 + (z-1)^2$
    $<=> 10 + z^2 - 8z + 16 = 1 + z^2 - 2z + 1$
    $<=> 26 - 8z = 2 - 2z <=> 6z = 24 <=> z = 4$.]
    #step[Vậy $M(0; 0; 4)$. Chọn đáp án A.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(2; 1; 1), B(-1; 2; 1)$. Tọa độ trung điểm của đoạn thẳng $A B$ là?],
  (
    [$I(1/3; 1; 2/3)$.],
    [$I(-3; 1; 0)$.],
    [$I(-3/2; -1/2; 0)$.],
    True([$I(1/2; 3/2; 1)$.])
  ),
  loigiai: [
    #step[Tọa độ trung điểm $I$ của đoạn thẳng $A B$ được xác định theo công thức:
    $I = ( (x_A+x_B)/2; (y_A+y_B)/2; (z_A+z_B)/2 )$.]
    #step[Thay các số liệu tọa độ của hai điểm $A, B$ vào:
    - $x_I = (2 + (-1))/2 = 1/2$.
    - $y_I = (1 + 2)/2 = 3/2$.
    - $z_I = (1 + 1)/2 = 1$.]
    #step[Vậy $I(1/2; 3/2; 1)$. Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(1; 2; 3), B(-2; -4; 9)$. Điểm $M$ thuộc đoạn $A B$ sao cho $M A = 2 M B$. Độ dài đoạn thẳng $O M$ là],
  (
    [$5$.],
    [$3$.],
    True([$sqrt(54)$.]),
    [$sqrt(17)$.]
  ),
  loigiai: [
    #step[Vì điểm $M$ thuộc đoạn $A B$ nên vectơ $arrow(M A)$ và $arrow(M B)$ ngược hướng.
    Kết hợp với $M A = 2 M B$, ta có hệ thức vectơ:
    $arrow(M A) = -2 arrow(M B) <=> A - M = -2(B - M) <=> A + 2B = 3M => M = (A + 2B)/3$.]
    #step[Tính tọa độ điểm $M$:
    - $x_M = (x_A + 2 x_B)/3 = (1 + 2(-2))/3 = -1$.
    - $y_M = (y_A + 2 y_B)/3 = (2 + 2(-4))/3 = -2$.
    - $z_M = (z_A + 2 z_B)/3 = (3 + 2(9))/3 = 7$.
    Vậy $M(-1; -2; 7)$.]
    #step[Độ dài đoạn thẳng $O M$ là:
    $O M = sqrt((-1)^2 + (-2)^2 + 7^2) = sqrt(1 + 4 + 49) = sqrt(54)$.]
    #step[Kết luận: Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$ cho điểm $G(1; -2; 3)$ và ba điểm $A(a; 0; 0); B(0; b; 0); C(0; 0; c)$. Biết $G$ là trọng tâm của tam giác $A B C$ thì $a + b + c$ bằng],
  (
    [$3$.],
    [$9$.],
    True([$6$.]),
    [$0$.]
  ),
  loigiai: [
    #step[Do $G$ là trọng tâm tam giác $A B C$ nên ta có:
    $x_G = (x_A + x_B + x_C)/3 => 1 = (a + 0 + 0)/3 => a = 3$.]
    #step[Tương tự cho các tọa độ còn lại:
    - $y_G = (y_A + y_B + y_C)/3 => -2 = (0 + b + 0)/3 => b = -6$.
    - $z_G = (z_A + z_B + z_C)/3 => 3 = (0 + 0 + c)/3 => c = 9$.]
    #step[Tính tổng $a + b + c$:
    $a + b + c = 3 + (-6) + 9 = 6$.]
    #step[Kết luận: Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(1; 1; 1), B(2; 3; 2), C(3; -1; 3)$. Tìm tọa độ điểm $D$ sao cho bốn điểm $A, B, C, D$ lập thành một hình chữ nhật.],
  (
    [$D(4; 3; 4)$.],
    [$D(4; -1; 4)$.],
    [$D(2; -3; 2)$.],
    True([$D(4; 1; 4)$.])
  ),
  loigiai: [
    #step[Tính tọa độ hai vectơ $arrow(A B)$ và $arrow(A C)$:
    - $arrow(A B) = (2-1; 3-1; 2-1) = (1; 2; 1)$.
    - $arrow(A C) = (3-1; -1-1; 3-1) = (2; -2; 2)$.]
    #step[Kiểm tra tính vuông góc giữa $arrow(A B)$ và $arrow(A C)$:
    $arrow(A B) dot arrow(A C) = 1 times 2 + 2 times (-2) + 1 times 2 = 2 - 4 + 2 = 0 => A B perp A C$.
    Do đó, để bốn điểm lập thành hình chữ nhật thì ta phải có hình chữ nhật $A B D C$ (tức là $D$ đối diện với $A$).]
    #step[Điều kiện để $A B D C$ là hình bình hành (đồng thời là hình chữ nhật vì góc $A$ vuông):
    $arrow(B D) = arrow(A C) <=> D - B = C - A => D = B + C - A$.
    - $x_D = x_B + x_C - x_A = 2 + 3 - 1 = 4$.
    - $y_D = y_B + y_C - y_A = 3 - 1 - 1 = 1$.
    - $z_D = z_B + z_C - z_A = 2 + 3 - 1 = 4$.]
    #step[Vậy điểm $D$ cần tìm có tọa độ là $(4; 1; 4)$. Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(-2; 3; 1)$ và $B(5; 6; 2)$. Đường thẳng $A B$ cắt mặt phẳng $(O x z)$ tại điểm $M$. Tính tỉ số $(A M) / (B M)$.],
  (
    True([$(A M) / (B M) = 1/2$.]),
    [$(A M) / (B M) = 2$.],
    [$(A M) / (B M) = 1/3$.],
    [$(A M) / (B M) = 3$.]
  ),
  loigiai: [
    #step[Do điểm $M$ nằm trên mặt phẳng tọa độ $(O x z)$ nên tung độ của $M$ phải bằng 0: $y_M = 0$.]
    #step[Vì ba điểm $A, B, M$ thẳng hàng (đường thẳng $A B$ cắt mặt phẳng tại $M$), theo tỉ số khoảng cách và tỉ số tọa độ, ta có:
    $A M / B M = |y_A - y_M| / |y_B - y_M|$.]
    #step[Thay các tung độ vào:
    $A M / B M = |3 - 0| / |6 - 0| = 3/6 = 1/2$.]
    #step[Kết luận: Chọn đáp án A.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(-4; 1; 5); B(1; 5; -3)$. Gọi $C$ là giao điểm của đường thẳng $A B$ và mặt phẳng $(O y z)$. Trong các khẳng định sau, khẳng định nào đúng?],
  (
    [$arrow(A C) = - 1/4 arrow(A B)$.],
    [$arrow(A B) = 5 arrow(B C)$.],
    [$arrow(A C) = 4 arrow(B C)$.],
    True([$arrow(A C) = -4 arrow(B C)$.])
  ),
  loigiai: [
    #step[Do $C$ là giao điểm của đường thẳng $A B$ và mặt phẳng $(O y z)$ nên hoành độ của $C$ bằng 0: $x_C = 0$.]
    #step[Vì ba điểm $A, B, C$ thẳng hàng, ta có hệ thức vectơ:
    $arrow(A C) = k arrow(A B) => x_C - x_A = k(x_B - x_A)$.]
    #step[Thay các hoành độ của $A$ và $B$ vào để tìm $k$:
    $0 - (-4) = k(1 - (-4)) <=> 4 = 5k => k = 4/5$.
    Do đó ta có: $arrow(A C) = 4/5 arrow(A B)$.]
    #step[Biểu diễn vectơ $arrow(B C)$ theo $arrow(A B)$:
    $arrow(B C) = arrow(A C) - arrow(A B) = 4/5 arrow(A B) - arrow(A B) = -1/5 arrow(A B) => arrow(A B) = -5 arrow(B C)$.]
    #step[So sánh hai vectơ $arrow(A C)$ và $arrow(B C)$:
    Từ $arrow(A C) = 4/5 arrow(A B)$ và $arrow(B C) = -1/5 arrow(A B) => arrow(A C) = -4 arrow(B C)$.]
    #step[Kết luận: Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho vectơ $arrow(a) = (1;1;-3)$; $arrow(b) = (2;2;-2)$; $arrow(c) = 2 arrow(i) + 2 arrow(j) - 6 arrow(k)$ và $arrow(d) = (1;1;-1)$. Cặp vectơ nào sau đây cùng phương?],
  (
    [$arrow(a)$ và $arrow(b)$.],
    [$arrow(a)$ và $arrow(d)$.],
    True([$arrow(a)$ và $arrow(c)$.]),
    [$arrow(b)$ và $arrow(c)$.]
  ),
  loigiai: [
    #step[Biểu diễn tọa độ của các vectơ:
    - $arrow(a) = (1; 1; -3)$.
    - $arrow(b) = (2; 2; -2)$.
    - $arrow(c) = 2 arrow(i) + 2 arrow(j) - 6 arrow(k) = (2; 2; -6)$.
    - $arrow(d) = (1; 1; -1)$.]
    #step[Xét tỉ số giữa các thành phần tọa độ của $arrow(a)$ và $arrow(c)$:
    $2/1 = 2/1 = (-6)/(-3) = 2 => arrow(c) = 2 arrow(a)$.]
    #step[Vì vectơ này gấp 2 lần vectơ kia nên $arrow(a)$ và $arrow(c)$ cùng phương. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(0; 1; -1), B(1; 2; 0); C(m; n; 0)$. Tìm $m, n$ sao cho ba điểm $A, B, C$ thẳng hàng.],
  (
    [$m = 1; n = 1$.],
    True([$m = 1; n = 2$.]),
    [$m = 2; n = 1$.],
    [$m = 2; n = 2$.]
  ),
  loigiai: [
    #step[Tính tọa độ các vectơ $arrow(A B)$ và $arrow(A C)$:
    - $arrow(A B) = (1 - 0; 2 - 1; 0 - (-1)) = (1; 1; 1)$.
    - $arrow(A C) = (m - 0; n - 1; 0 - (-1)) = (m; n - 1; 1)$.]
    #step[Để ba điểm $A, B, C$ thẳng hàng thì hai vectơ $arrow(A B)$ và $arrow(A C)$ cùng phương:
    $arrow(A C) = k arrow(A B) <=> (m; n - 1; 1) = k(1; 1; 1)$.]
    #step[So sánh từng tọa độ:
    $cases(m = k, n-1 = k, 1 = k) => k = 1 => cases(m = 1, n - 1 = 1 => n = 2)$.]
    #step[Vậy $m = 1, n = 2$. Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho 2 véc tơ $arrow(a) = (-1; 2x-1; 1-3z)$ và $arrow(b) = (2+3y; -1; -2)$. Khi $arrow(a) = arrow(b)$ thì tổng $T = x + 2y^2 + 3z^3$ bằng],
  (
    [$2$.],
    True([$5$.]),
    [$1$.],
    [$4$.]
  ),
  loigiai: [
    #step[Hai vectơ bằng nhau khi và chỉ khi các tọa độ tương ứng của chúng bằng nhau:
    $arrow(a) = arrow(b) <=> cases(-1 = 2+3y, 2x - 1 = -1, 1 - 3z = -2)$.]
    #step[Giải từng phương trình để tìm $x, y, z$:
    - Từ $-1 = 2 + 3y => 3y = -3 => y = -1$.
    - Từ $2x - 1 = -1 => 2x = 0 => x = 0$.
    - Từ $1 - 3z = -2 => 3z = 3 => z = 1$.]
    #step[Tính giá trị của biểu thức $T$:
    $T = x + 2y^2 + 3z^3 = 0 + 2(-1)^2 + 3(1)^3 = 2 + 3 = 5$.]
    #step[Kết luận: Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(1; 2; -1), B(2; -1; 3), C(-4; 7; 5)$. Tọa độ chân đường phân giác trong góc $B$ của tam giác $A B C$ là],
  (
    [$(-2; 11; 1)$.],
    True([$(-2/3; 11/3; 1)$.]),
    [$(2/3; 11/3; 1/3)$.],
    [$(11/3; -2; 1)$.]
  ),
  loigiai: [
    #step[Gọi $D(x_D; y_D; z_D)$ là chân đường phân giác trong góc $B$ của tam giác $A B C$.
    Theo tính chất đường phân giác trong, ta có tỉ số độ dài:
    $D A / D C = B A / B C$.]
    #step[Tính độ dài các cạnh $B A$ và $B C$:
    - $arrow(B A) = (1-2; 2-(-1); -1-3) = (-1; 3; -4) => B A = sqrt((-1)^2 + 3^2 + (-4)^2) = sqrt(26)$.
    - $arrow(B C) = (-4-2; 7-(-1); 5-3) = (-6; 8; 2) => B C = sqrt((-6)^2 + 8^2 + 2^2) = sqrt(104) = 2 sqrt(26)$.]
    #step[Do đó: $D A / D C = sqrt(26) / (2 sqrt(26)) = 1/2 => D C = 2 D A$.
    Vì $D$ nằm giữa hai điểm $A$ và $C$ nên hai vectơ $arrow(D A)$ và $arrow(D C)$ ngược chiều:
    $arrow(D C) = -2 arrow(D A) <=> C - D = -2(A - D) <=> 3D = 2A + C => D = (2A + C)/3$.]
    #step[Thay tọa độ của $A$ và $C$ vào để tính tọa độ điểm $D$:
    - $x_D = (2(1) + (-4))/3 = -2/3$.
    - $y_D = (2(2) + 7)/3 = 11/3$.
    - $z_D = (2(-1) + 5)/3 = 1$.
    Vậy $D(-2/3; 11/3; 1)$. Chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(6; -3; 4), B(a; b; c)$. Gọi $M, N, P$ lần lượt là giao điểm của đường thẳng $A B$ với các mặt phẳng tọa độ $(O x y), (O x z)$ và $(O y z)$. Biết rằng $M, N, P$ nằm trên đoạn $A B$ sao cho $A M = M N = N P = P B$. Giá trị của tổng $a + b + c$ là],
  (
    [$17$.],
    [$-17$.],
    True([$-11$.]),
    [$11$.]
  ),
  loigiai: [
    #step[Đường thẳng $A B$ cắt các mặt phẳng tọa độ $(O x y), (O x z), (O y z)$ lần lượt tại $M, N, P$ nên:
    - $M in (O x y) => z_M = 0$.
    - $N in (O x z) => y_N = 0$.
    - $P in (O y z) => x_P = 0$.]
    #step[Vì $M, N, P$ nằm trên đoạn $A B$ chia đoạn $A B$ làm 4 phần bằng nhau nên ta biểu diễn tọa độ các điểm theo tham số.
    Giả sử $A$ tương ứng với giá trị tham số $t = 0$, còn $B$ ứng với $t = 4$. Khi đó:
    - $M$ ứng với $t = 1$.
    - $N$ ứng với $t = 2$.
    - $P$ ứng với $t = 3$.]
    #step[Biểu diễn các tọa độ của điểm trên đường thẳng $A B$ theo $t$:
    $x(t) = 6 + t Delta_x$, $y(t) = -3 + t Delta_y$, $z(t) = 4 + t Delta_z$.
    Vì các điểm có tọa độ bằng 0 tại $t = 1, 2, 3$ theo thứ tự phù hợp:
    Để $x_P = 0$ tại $t = 3 => 6 + 3 Delta_x = 0 => Delta_x = -2$.
    Để $y_N = 0$ tại $t = 2 => -3 + 2 Delta_y = 0 => Delta_y = 1.5$.
    Để $z_M = 0$ tại $t = 1 => 4 + 1 Delta_z = 0 => Delta_z = -4$.]
    #step[Tìm tọa độ điểm $B$ (ứng với $t = 4$):
    - $a = x(4) = 6 + 4(-2) = -2$.
    - $b = y(4) = -3 + 4(1.5) = 3$.
    - $c = z(4) = 4 + 4(-4) = -12$.
    Suy ra $a + b + c = -2 + 3 - 12 = -11$. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho $A(-1; 4; 2), B(3; 2; 1), C(-2; 0; 2)$. Tìm tất cả các điểm $D$ sao cho $A B C D$ là hình thang có đáy $A D$ và diện tích hình thang $A B C D$ gấp ba lần diện tích tam giác $A B C$.],
  (
    [$D(9; 8; 0)$.],
    True([$D(-11; 0; 4)$ và $D(9; 8; 0)$.]),
    [$D(-11; 0; 4)$.],
    [$D(11; 0; -4)$ và $D(-9; -8; 0)$.]
  ),
  loigiai: [
    #step[Để $A B C D$ là hình thang có đáy $A D$ thì hai đáy là $A D$ và $B C$. Do đó đường thẳng $A D$ song song hoặc trùng với $B C$.
    Ta tính vectơ đáy $arrow(B C) = C - B = (-2-3; 0-2; 2-1) = (-5; -2; 1)$.]
    #step[Diện tích hình thang đáy $A D$ là $S_("hình thang") = 1/2 (A D + B C) h$.
    Diện tích tam giác $A B C$ là $S_("tam giác") = 1/2 B C dot h$.
    Theo đề bài: $S_("hình thang") = 3 S_("tam giác") => 1/2 (A D + B C) h = 3 times 1/2 B C dot h => A D + B C = 3 B C => A D = 2 B C$.]
    #step[Do $A D = 2 B C$ và $A D parallel B C$ nên ta có hai trường hợp của vectơ $arrow(A D)$:
    - Trường hợp 1: $arrow(A D) = 2 arrow(B C) = (-10; -4; 2) => D = A + (-10; -4; 2) = (-11; 0; 4)$.
    - Trường hợp 2: $arrow(A D) = -2 arrow(B C) = (10; 4; -2) => D = A + (10; 4; -2) = (9; 8; 0)$.]
    #step[Cả hai điểm này đều không làm cho các đỉnh thẳng hàng hay trùng lặp. Vậy chọn đáp án B.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(4; 5; 6); B(1; 3; 2)$. Gọi $H$ là hình chiếu vuông góc của $A$ lên mặt phẳng $(O y z)$. Gọi $C$ là điểm nằm trên trục $O z$ sao cho $B C$ và $A H$ là hai đường thẳng cắt nhau. Xác định tọa độ điểm $C$.],
  (
    [$C(0; 0; 2)$.],
    [$C(0; 0; -2/3)$.],
    [$C(0; 0; 4)$.],
    True([$C(0; 0; -4)$.])
  ),
  loigiai: [
    #step[Tìm tọa độ hình chiếu vuông góc $H$ của $A(4; 5; 6)$ lên mặt phẳng $(O y z)$:
    Do chiếu lên $(O y z)$ nên hoành độ bằng 0, các thành phần khác giữ nguyên: $H(0; 5; 6)$.]
    #step[Vì điểm $C$ nằm trên trục $O z$ nên tọa độ có dạng $C(0; 0; z)$.
    Do hai đường thẳng $B C$ và $A H$ cắt nhau nên bốn điểm $A, B, C, H$ đồng phẳng. Gọi điểm giao nhau là $M$.
    Đường thẳng $A H$ nằm trong mặt phẳng $y = 5, z = 6$ (vì $A_y=H_y=5$ và $A_z=H_z=6$). Do đó $M$ phải có tọa độ dạng $M(x_M; 5; 6)$.]
    #step[Vì $M$ cũng nằm trên đường thẳng $B C$ nên ba điểm $B(1; 3; 2), C(0; 0; z), M(x_M; 5; 6)$ thẳng hàng:
    $arrow(B M) = k arrow(B C) <=> (x_M - 1; 5-3; 6-2) = k(0-1; 0-3; z-2)$
    $<=> (x_M - 1; 2; 4) = k(-1; -3; z-2)$.]
    #step[Giải hệ phương trình tìm $k$ và $z$:
    - Từ thành phần thứ hai: $2 = -3k => k = -2/3$.
    - Từ thành phần thứ ba: $4 = k(z-2) => 4 = -2/3 (z-2) => z-2 = -6 => z = -4$.
    Vậy $C(0; 0; -4)$. Chọn đáp án D.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(-2; 3; 1), B(2; 1; 0), C(-3; -1; 1)$. Tìm tất cả các điểm $D$ sao cho $A B C D$ là hình thang có đáy $A D$ và $S_("ABCD") = 3 S_("ABC").$],
  (
    [$D(8; 7; -1)$.],
    [$[D(-8; -7; 1) , D(12; 1; -3)]$.],
    True([$[D(8; 7; -1) , D(-12; -1; 3)]$.]),
    [$D(-12; -1; 3)$.]
  ),
  loigiai: [
    #step[Tính vectơ đáy $arrow(B C) = C - B = (-3-2; -1-1; 1-0) = (-5; -2; 1)$.]
    #step[Để $A B C D$ là hình thang đáy $A D$ và có diện tích bằng $3$ lần diện tích tam giác $A B C$:
    $S_("ABCD") = 3 S_("ABC") => 1/2 (A D + B C) h = 3 times 1/2 B C dot h => A D = 2 B C$.]
    #step[Do $A D = 2 B C$ và $A D parallel B C$, ta có:
    - Trường hợp 1: $arrow(A D) = 2 arrow(B C) = (-10; -4; 2) => D = A + (-10; -4; 2) = (-12; -1; 3)$.
    - Trường hợp 2: $arrow(A D) = -2 arrow(B C) = (10; 4; -2) => D = A + (10; 4; -2) = (8; 7; -1)$.]
    #step[Vậy tập hợp các điểm $D$ là $\{D(8; 7; -1); D(-12; -1; 3)\}$. Chọn đáp án C.]
      ]
)

#my-tn(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho hình vuông $A B C D$ trong đó $A(1; 2; 0), B(3; 0; 8)$ và $C(-3; -6; 8)$. Hai điểm $M, N$ lần lượt nằm trên hai cạnh $A B, B C$ thỏa mãn $A M = B N = 1/3 B C$. Gọi $I(a; b; c)$ là giao điểm của $A N, D M$. Tính $P = a + b + c$.],
  (
    [$17/5$.],
    True([$21/5$.]),
    [$20/5$.],
    [$5$.]
  ),
  loigiai: [
    #step[Do $A B C D$ là hình vuông nên $A B = B C$.
    Ta có $A M = B N = 1/3 B C = 1/3 A B$.
    Vì $M$ và $N$ lần lượt nằm trên các cạnh $A B, B C$, ta biểu diễn hệ thức vectơ:
    - $arrow(A M) = 1/3 arrow(A B) => M = A + 1/3(B - A) = 2/3 A + 1/3 B$.
    - $arrow(B N) = 1/3 arrow(B C) => N = B + 1/3(C - B) = 2/3 B + 1/3 C$.]
    #step[Gọi $I$ là giao điểm của $A N$ và $D M$. Vì $I$ nằm trên đường thẳng $A N$ nên:
    $I = (1-u) A + u N = (1-u) A + u (2/3 B + 1/3 C) = (1-u) A + 2/3 u B + 1/3 u C$.
    Mặt khác, $I$ cũng nằm trên đường thẳng $D M$, với đỉnh hình vuông $D = A + C - B$:
    $I = (1-v) M + v D = (1-v) (2/3 A + 1/3 B) + v (A - B + C) = (2/3 + 1/3 v) A + (1/3 - 4/3 v) B + v C$.]
    #step[Cân bằng hệ số của $A, B, C$ ở hai biểu thức biểu diễn $I$:
    $1/3 u = v => u = 3v$.
    Thay $u = 3v$ vào hệ số của $B$ và $A$:
    - Đối với $B$: $2/3 (3v) = 1/3 - 4/3 v <=> 2v = 1/3 - 4/3 v <=> 10/3 v = 1/3 => v = 1/10$.
    Suy ra $u = 3/10$.]
    #step[Tính tọa độ điểm $I$ theo $u = 3/10$:
    $I = 7/10 A + 2/10 B + 1/10 C = 0.7 A + 0.2 B + 0.1 C$.
    - $x_I = 0.7(1) + 0.2(3) + 0.1(-3) = 1$.
    - $y_I = 0.7(2) + 0.2(0) + 0.1(-6) = 0.8$.
    - $z_I = 0.7(0) + 0.2(8) + 0.1(8) = 2.4$.
    Suy ra $P = a + b + c = 1 + 0.8 + 2.4 = 4.2 = 21/5$. Chọn đáp án B.]
      ]
)


#my-ds(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(4;2;1)$, $B(2;1;3)$, $C(-1;3;-2)$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Tọa độ trọng tâm tam giác $A B C$ bằng $(5/3; 2; 2/3)$.]),
    True([Tọa độ trung điểm đoạn thẳng $A B$ bằng $(3; 3/2; 2)$.]),
    True([Tứ giác $A B C D$ là hình bình hành thì tọa độ điểm $D = (1; 4; -4)$.]),
    [Ba điểm $A, B, C$ thẳng hàng.]
  ),
  loigiai: [
    #step[a) Công thức tính tọa độ trọng tâm $G$ của tam giác $A B C$:
    $G = ( (x_A+x_B+x_C)/3; (y_A+y_B+y_C)/3; (z_A+z_B+z_C)/3 )$.
    Thay số: $G = ( (4+2-1)/3; (2+1+3)/3; (1+3-2)/3 ) = (5/3; 2; 2/3)$. (Đúng)]
    #step[b) Tọa độ trung điểm $M$ của đoạn thẳng $A B$:
    $M = ( (4+2)/2; (2+1)/2; (1+3)/2 ) = (3; 3/2; 2)$. (Đúng)]
    #step[c) Tứ giác $A B C D$ là hình bình hành khi và chỉ khi:
    $arrow(A D) = arrow(B C) <=> D - A = C - B => D = A + C - B$.
    Tọa độ điểm $D$:
    - $x_D = 4 + (-1) - 2 = 1$.
    - $y_D = 2 + 3 - 1 = 4$.
    - $z_D = 1 + (-2) - 3 = -4$.
    Vậy $D(1; 4; -4)$. (Đúng)]
    #step[d) Ta tính tọa độ hai vectơ:
    - $arrow(A B) = (2-4; 1-2; 3-1) = (-2; -1; 2)$.
    - $arrow(A C) = (-1-4; 3-2; -2-1) = (-5; 1; -3)$.
    Nhận thấy hai vectơ $arrow(A B)$ và $arrow(A C)$ không cùng phương (do tỉ số $(-2)/(-5) != (-1)/1$). Do đó ba điểm $A, B, C$ không thẳng hàng. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(3;5;-1)$, $B(7;x;1)$, $C(9;2;y)$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Ba điểm $A, B, C$ thẳng hàng thì $x + y = 5$.]),
    [Điểm $G(19/3; 8/3; 3)$ là trọng tâm tam giác $A B C$ thì $x = 1; y = 3$.],
    True([Tam giác $A B C$ vuông tại $A$ thì $x = 13, y = -1$.]),
    True([Tích vô hướng của $arrow(A B) dot arrow(A C) = -3x + 2y + 41$.])
  ),
  loigiai: [
    #step[Tính tọa độ hai vectơ:
    - $arrow(A B) = (7-3; x-5; 1-(-1)) = (4; x-5; 2)$.
    - $arrow(A C) = (9-3; 2-5; y-(-1)) = (6; -3; y+1)$.]
    #step[a) Ba điểm $A, B, C$ thẳng hàng khi hai vectơ $arrow(A B)$ và $arrow(A C)$ cùng phương:
    $4/6 = (x-5)/(-3) = 2/(y+1) <=> 2/3 = (x-5)/(-3) = 2/(y+1)$.
    - Từ $2/3 = (x-5)/(-3) => x-5 = -2 => x = 3$.
    - Từ $2/3 = 2/(y+1) => y+1 = 3 => y = 2$.
    Khi đó $x + y = 3 + 2 = 5$. (Đúng)]
    #step[b) Nếu $G(19/3; 8/3; 3)$ là trọng tâm của tam giác $A B C$:
    - $y_G = (5 + x + 2)/3 = 8/3 => x + 7 = 8 => x = 1$.
    - $z_G = (-1 + 1 + y)/3 = 3 => y/3 = 3 => y = 9$.
    Khẳng định cho $y = 3$ là sai. (Sai)]
    #step[c) Tam giác $A B C$ vuông tại $A$ khi và chỉ khi $arrow(A B) dot arrow(A C) = 0$.
    Sử dụng kết quả tính tích vô hướng ở câu d:
    $-3x + 2y + 41 = 0$.
    Thử lại với $x = 13, y = -1$ ta có: $-3(13) + 2(-1) + 41 = -39 - 2 + 41 = 0$. (Đúng)]
    #step[d) Tích vô hướng của hai vectơ:
    $arrow(A B) dot arrow(A C) = 4 times 6 + (x-5)(-3) + 2(y+1) = 24 - 3x + 15 + 2y + 2 = -3x + 2y + 41$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  
  [Cho các điểm $A(1;-2;3), B(-2;1;2), C(3;-1;2)$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([$arrow(A B) = (-3; 3; -1)$.]),
    [$arrow(A C) = (-2; -1; 1)$.],
    [$arrow(A B) = 3 arrow(A C)$.],
    True([Ba điểm $A, B, C$ không thẳng hàng.])
  ),
  loigiai: [
    #step[a) Tọa độ vectơ $arrow(A B)$:
    $arrow(A B) = (-2-1; 1-(-2); 2-3) = (-3; 3; -1)$. (Đúng)]
    #step[b) Tọa độ vectơ $arrow(A C)$:
    $arrow(A C) = (3-1; -1-(-2); 2-3) = (2; 1; -1)$.
    Khẳng định cho tọa độ ngược dấu nên sai. (Sai)]
    #step[c) Xét tỉ lệ các thành phần của $arrow(A B)$ và $arrow(A C)$:
    $(-3)/2 != 3/1$. Do đó hai vectơ không cùng phương, tức là $arrow(A B) != k arrow(A C)$. (Sai)]
    #step[d) Vì hai vectơ $arrow(A B)$ và $arrow(A C)$ không cùng phương nên ba điểm $A, B, C$ không thẳng hàng. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (1.5, 2.5)
    let B = (0.0, 0.0)
    let C = (3.5, 0.0)
    let M = (0.75, 1.25)
    let N = (1.75, 0.0)
    let K = (2.5, 1.25)
    
    // Draw triangle edges
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: 1.2pt)
    line(C, A, stroke: 1.2pt)
    
    // Draw midpoint triangle
    line(M, N, stroke: 1pt + blue)
    line(N, K, stroke: 1pt + blue)
    line(K, M, stroke: 1pt + blue)
    
    // Points
    circle(A, radius: 0.05, fill: black)
    circle(B, radius: 0.05, fill: black)
    circle(C, radius: 0.05, fill: black)
    circle(M, radius: 0.05, fill: black)
    circle(N, radius: 0.05, fill: black)
    circle(K, radius: 0.05, fill: black)
    
    // Labels
    content((1.5, 2.75), $A$)
    content((-0.25, 0.0), $B$)
    content((3.75, 0.0), $C$)
    content((0.5, 1.35), $M$)
    content((1.75, -0.3), $N$)
    content((2.75, 1.35), $K$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho ba điểm $A(3;3;-6), B(1;3;2)$ và $C(-1;-3;1)$. Gọi $M, N, K$ lần lượt là trung điểm của $A B, B C$ và $C A$. Xét tính đúng/sai của các khẳng định sau:],
  (
    [Tọa độ $M(2; 3; 2)$.],
    [Với $G$ là trọng tâm tam giác $A B C$ thì $G C = 2 sqrt(5)$.],
    True([Trọng tâm tam giác $M N K$ là $E(1; 1; -1)$.]),
    True([Với $D(-3; -3; 9)$ thì tứ giác $A B D C$ là hình bình hành.])
  ),
  loigiai: [
    #step[a) Tọa độ trung điểm $M$ của đoạn thẳng $A B$:
    $M = ( (3+1)/2; (3+3)/2; (-6+2)/2 ) = (2; 3; -2)$.
    Khẳng định cho cao độ bằng $2$ là sai. (Sai)]
    #step[b) Tìm tọa độ trọng tâm $G$ của tam giác $A B C$:
    $G = ( (3+1-1)/3; (3+3-3)/3; (-6+2+1)/3 ) = (1; 1; -1)$.
    Tính độ dài đoạn $G C$:
    $G C = sqrt((-1-1)^2 + (-3-1)^2 + (1-(-1))^2) = sqrt((-2)^2 + (-4)^2 + 2^2) = sqrt(24) = 2 sqrt(6)$.
    Khẳng định cho $2 sqrt(5)$ là sai. (Sai)]
    #step[c) Trọng tâm của tam giác tạo bởi ba trung điểm của các cạnh của một tam giác trùng với trọng tâm của tam giác ban đầu.
    Do đó trọng tâm của tam giác $M N K$ trùng với $G(1; 1; -1)$. (Đúng)]
    #step[d) Tứ giác $A B D C$ là hình bình hành khi và chỉ khi:
    $arrow(B D) = arrow(A C) <=> D - B = C - A => D = B + C - A$.
    Tọa độ điểm $D$:
    - $x_D = 1 + (-1) - 3 = -3$.
    - $y_D = 3 + (-3) - 3 = -3$.
    - $z_D = 2 + 1 - (-6) = 9$.
    Vậy $D(-3; -3; 9)$. (Đúng)]
  ]
)

#my-ds(de: "Đề 1", 
  
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let A = (0.0, 0.0)
    let B = (-0.8, -1.2)
    let C = (1.2, -1.2)
    let D = (2.0, 0.0)
    let A_prime = (0.5, 2.5)
    let B_prime = (-0.3, 1.3)
    let C_prime = (1.7, 1.3)
    let D_prime = (2.5, 2.5)
    
    // Draw solid lines
    line(A_prime, B_prime, stroke: 1.2pt)
    line(B_prime, C_prime, stroke: 1.2pt)
    line(C_prime, D_prime, stroke: 1.2pt)
    line(D_prime, A_prime, stroke: 1.2pt)
    
    line(B, B_prime, stroke: 1.2pt)
    line(C, C_prime, stroke: 1.2pt)
    line(D, D_prime, stroke: 1.2pt)
    
    line(B, C, stroke: 1.2pt)
    line(C, D, stroke: 1.2pt)
    
    // Draw dashed lines
    line(A, A_prime, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(A, B, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(A, D, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Labels
    content((-0.25, 0.15), $A$)
    content((-1.0, -1.4), $B$)
    content((1.4, -1.4), $C$)
    content((2.2, -0.15), $D$)
    content((0.3, 2.7), $A'$)
    content((-0.5, 1.5), $B'$)
    content((1.9, 1.1), $C'$)
    content((2.7, 2.7), $D'$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Cho hình hộp $A B C D . A' B' C' D'$, biết điểm $A(0;0;0)$, $B(1;0;0)$, $C(1;2;0)$, $D'(-1;3;5)$. Gọi $M, N$ là tâm của các hình bình hành $A B B' A', A D D' A'$. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Tọa độ $D(0; 2; 0)$.]),
    True([Tọa độ $A'(-1; 1; 5)$.]),
    [Tọa độ $arrow(M N) = (-1; 1; 0)$.],
    [$|arrow(A B) + arrow(A D) + arrow(C C')| = sqrt(29)$.]
  ),
  loigiai: [
    #step[a) Vì $A B C D$ là hình bình hành nên:
    $arrow(A D) = arrow(B C) <=> D - A = C - B => D = A + C - B = (0; 2; 0)$. (Đúng)]
    #step[b) Ta có $arrow(A A') = arrow(D D') = D' - D = (-1; 3; 5) - (0; 2; 0) = (-1; 1; 5)$.
    Vì $A(0; 0; 0)$ nên tọa độ $A'$ bằng tọa độ vectơ $arrow(A A')$, suy ra $A'(-1; 1; 5)$. (Đúng)]
    #step[c) Tìm tọa độ tâm $M$ của $A B B' A'$ và $N$ của $A D D' A'$:
    - $M$ là trung điểm của $B A'$ nên $M = (B + A')/2 = ( (1-1)/2; (0+1)/2; (0+5)/2 ) = (0; 0.5; 2.5)$.
    - $N$ là trung điểm của $D A'$ nên $N = (D + A')/2 = ( (0-1)/2; (2+1)/2; (0+5)/2 ) = (-0.5; 1.5; 2.5)$.
    Tọa độ vectơ $arrow(M N) = N - M = (-0.5; 1; 0)$. (Sai)]
    #step[d) Ta có: $arrow(A B) + arrow(A D) + arrow(C C') = arrow(A C) + arrow(A A') = arrow(A C')$.
    Tọa độ $C' = C + arrow(A A') = (1; 2; 0) + (-1; 1; 5) = (0; 3; 5)$.
    Độ dài: $|arrow(A C')| = sqrt(0^2 + 3^2 + 5^2) = sqrt(34) != sqrt(29)$. (Sai)]
  ]
)

#my-ds(de: "Đề 1", 
  
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    let O = (0, 0)
    let Ox = (2.5, 0)
    let Oy = (-1.2, -0.9)
    let Oz = (0, 2.5)
    
    // Draw axes
    line(O, Ox, stroke: 1pt + black, mark: (end: "stealth", fill: black))
    line(O, Oy, stroke: 1pt + black, mark: (end: "stealth", fill: black))
    line(O, Oz, stroke: 1pt + black, mark: (end: "stealth", fill: black))
    
    // Draw back directions (dashed)
    line(O, (-2.5, 0), stroke: (thickness: 0.6pt, dash: "dashed", paint: gray))
    line(O, (1.2, 0.9), stroke: (thickness: 0.6pt, dash: "dashed", paint: gray))
    
    // Balloon 1
    let M1 = (1.0, -0.3)
    let P1 = (1.0, -0.8)
    line(P1, M1, stroke: (thickness: 0.8pt, dash: "dashed", paint: blue))
    line(P1, (2.0, 0.0), stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(P1, (-1.0, -0.8), stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    circle(M1, radius: 0.12, fill: blue.lighten(60%), stroke: 0.8pt + blue)
    line(M1, (1.0, -0.45), stroke: 0.5pt + blue)
    rect((0.95, -0.5), (1.05, -0.45), fill: rgb("#8b5a2b").lighten(30%), stroke: 0.5pt)
    
    // Balloon 2
    let M2 = (0.5, 2.0)
    let P2 = (0.5, 1.2)
    line(P2, M2, stroke: (thickness: 0.8pt, dash: "dashed", paint: red))
    line(P2, (-1.0, 0.0), stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    line(P2, (1.5, 1.2), stroke: (thickness: 0.8pt, dash: "dashed", paint: gray))
    
    circle(M2, radius: 0.12, fill: red.lighten(60%), stroke: 0.8pt + red)
    line(M2, (0.5, 1.85), stroke: 0.5pt + red)
    rect((0.45, 1.8), (0.55, 1.85), fill: rgb("#8b5a2b").lighten(30%), stroke: 0.5pt)
    
    // Labels
    content((2.5, 0.25), $x$, text: (size: 9pt))
    content((-1.4, -0.9), $y$, text: (size: 9pt))
    content((0.25, 2.5), $z$, text: (size: 9pt))
    content((-0.2, -0.2), $O$, text: (size: 9pt))
    content((2.8, -0.1), [Nam], text: (size: 9pt, fill: gray))
    content((-1.6, -0.6), [Đông], text: (size: 9pt, fill: gray))
    content((-2.8, 0.2), [Bắc], text: (size: 9pt, fill: gray))
    content((1.5, 1.4), [Tây], text: (size: 9pt, fill: gray))
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Hai chiếc khinh khí cầu bay lên từ cùng một địa điểm. Chiếc thứ nhất cách điểm xuất phát $2$ km về phía nam và $1$ km về phía đông, đồng thời cách mặt đất $0.5$ km. Chiếc thứ hai nằm cách điểm xuất phát $1$ km về phía bắc và $1.5$ km về phía tây, đồng thời cách mặt đất $0.8$ km. Chọn hệ trục $O x y z$ với gốc $O$ đặt tại điểm xuất phát của hai khinh khí cầu, mặt phẳng $(O x y)$ trùng với mặt đất với trục $O x$ hướng về phía nam, trục $O y$ hướng về phía đông và trục $O z$ hướng thẳng đứng lên trời, đơn vị đo lấy theo kilomet. Xét tính đúng/sai của các khẳng định sau:],
  (
    True([Với hệ tọa độ đã chọn, tọa độ khinh khí cầu thứ nhất là $(2; 1; 0.5)$.]),
    [Với hệ tọa độ đã chọn, tọa độ khinh khí cầu thứ hai là $(-1.5; -1; 0.8)$.],
    [Khoảng cách từ điểm xuất phát đến khinh khí cầu thứ nhất bằng $sqrt(21)$ km.],
    True([Khoảng cách hai chiếc khinh khí cầu là $3.92$ km (Kết quả làm tròn đến hàng phần trăm).])
  ),
  loigiai: [
    #step[a) Khinh khí cầu thứ nhất:
    - Cách điểm xuất phát $2$ km về phía nam ($O x$ dương) $=> x_1 = 2$.
    - $1$ km về phía đông ($O y$ dương) $=> y_1 = 1$.
    - Cách mặt đất $0.5$ km ($O z$ dương) $=> z_1 = 0.5$.
    Vậy tọa độ khinh khí cầu thứ nhất là $(2; 1; 0.5)$. (Đúng)]
    #step[b) Khinh khí cầu thứ hai:
    - Cách điểm xuất phát $1$ km về phía bắc ($O x$ âm) $=> x_2 = -1$.
    - $1.5$ km về phía tây ($O y$ âm) $=> y_2 = -1.5$.
    - Cách mặt đất $0.8$ km $=> z_2 = 0.8$.
    Vậy tọa độ khinh khí cầu thứ hai là $(-1; -1.5; 0.8)$. Khẳng định bị đảo vị trí $x$ và $y$ nên sai. (Sai)]
    #step[c) Khoảng cách từ điểm xuất phát $O(0;0;0)$ đến khinh khí cầu thứ nhất:
$D = sqrt((-1-2)^2 + (-1.5-1)^2 + (0.8-0.5)^2) = sqrt((-3)^2 + (-2.5)^2 + 0.3^2) = sqrt(9 + 6.25 + 0.09) = sqrt(15.34) approx 3.92$ km. (Đúng)]
  ]
)


#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(1;-2;5)$ và $B(-2;-2;1)$. Tính độ dài đoạn thẳng $A B$.],
  [5],
  loigiai: [
    #step[Độ dài đoạn thẳng $A B$ được tính theo công thức khoảng cách giữa hai điểm trong không gian:
    $A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2 + (z_B - z_A)^2)$.]
    #step[Thay tọa độ của $A$ và $B$ vào công thức:
    $A B = sqrt((-2 - 1)^2 + (-2 - (-2))^2 + (1 - 5)^2) = sqrt((-3)^2 + 0^2 + (-4)^2) = sqrt(9 + 0 + 16) = sqrt(25) = 5$.]
    #step[Kết luận: Độ dài đoạn thẳng $A B$ bằng $5$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian hệ tọa độ $O x y z$ cho tứ diện $A B C D$ với $A(1;-4;2), B(2;1;-3), C(3;0;-2)$ và $D(2;-5;-1)$. Hoành độ điểm $G$ thỏa mãn $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ là bao nhiêu?],
  [2],
  loigiai: [
    #step[Điểm $G$ thỏa mãn đẳng thức $arrow(G A) + arrow(G B) + arrow(G C) + arrow(G D) = arrow(0)$ chính là trọng tâm của tứ diện $A B C D$.]
    #step[Hoành độ của trọng tâm $G$ là trung bình cộng hoành độ của bốn đỉnh tứ diện:
    $x_G = (x_A + x_B + x_C + x_D)/4$.]
    #step[Thay các hoành độ vào công thức:
    $x_G = (1 + 2 + 3 + 2)/4 = 8/4 = 2$.]
    #step[Kết luận: Hoành độ của điểm $G$ bằng $2$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(3;2;-1)$, $B(-1;-x;1)$, $C(7;-1;y)$. Khi $A, B, C$ thẳng hàng thì giá trị biểu thức $x + y$ bằng bao nhiêu?],
  [-8],
  loigiai: [
    #step[Tính tọa độ hai vectơ $arrow(A B)$ và $arrow(A C)$:
    - $arrow(A B) = (-1 - 3; -x - 2; 1 - (-1)) = (-4; -x - 2; 2)$.
    - $arrow(A C) = (7 - 3; -1 - 2; y - (-1)) = (4; -3; y + 1)$.]
    #step[Để ba điểm $A, B, C$ thẳng hàng thì hai vectơ $arrow(A B)$ và $arrow(A C)$ phải cùng phương, nghĩa là tồn tại số thực $k$ sao cho:
    $arrow(A C) = k arrow(A B) <=> cases(4 = -4k, -3 = k(-x - 2), y + 1 = 2k)$.]
    #step[Giải hệ phương trình tìm $k, x, y$:
    - Từ phương trình thứ nhất: $4 = -4k => k = -1$.
    - Thay $k = -1$ vào phương trình thứ hai: $-3 = -1(-x - 2) <=> -3 = x + 2 => x = -5$.
    - Thay $k = -1$ vào phương trình thứ ba: $y + 1 = 2(-1) => y + 1 = -2 => y = -3$.]
    #step[Tính giá trị biểu thức $x + y$:
    $x + y = -5 + (-3) = -8$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho hai điểm $A(1;-2;3), B(4;1;-1)$. Điểm $M(a;b;c)$ thỏa mãn $M A dot arrow(M A) = 4 M B dot arrow(M B)$. Giá trị biểu thức $a + b + c$ bằng bao nhiêu?],
  [6],
  loigiai: [
    #step[Lấy độ dài hai vế của đẳng thức $M A dot arrow(M A) = 4 M B dot arrow(M B)$:
    $|M A dot arrow(M A)| = |4 M B dot arrow(M B)| <=> M A^2 = 4 M B^2 => M A = 2 M B$.]
    #step[Mặt khác, do $M A > 0$ và $M B > 0$ nên từ giả thiết ban đầu, hai vectơ $arrow(M A)$ và $arrow(M B)$ cùng hướng.
    Do đó ta có đẳng thức vectơ:
    $arrow(M A) = 2 arrow(M B) <=> A - M = 2(B - M) <=> M = 2B - A$.]
    #step[Tính tọa độ điểm $M$:
    - $a = 2(4) - 1 = 7$.
    - $b = 2(1) - (-2) = 4$.
    - $c = 2(-1) - 3 = -5$.
    Vậy $M(7; 4; -5)$.]
    #step[Tính giá trị biểu thức $a + b + c$:
    $a + b + c = 7 + 4 - 5 = 6$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(1;2;3), B(-2;-4;9)$. Điểm $M$ thuộc đoạn $A B$ sao cho $M A = 2 M B$. Bình phương độ dài đoạn thẳng $O M$ bằng bao nhiêu?],
  [54],
  loigiai: [
    #step[Vì điểm $M$ thuộc đoạn thẳng $A B$ nên $M$ nằm giữa $A, B$, khi đó hai vectơ $arrow(M A)$ và $arrow(M B)$ ngược hướng.
    Từ $M A = 2 M B$, ta suy ra:
    $arrow(M A) = -2 arrow(M B) <=> A - M = -2(B - M) <=> 3M = A + 2B => M = (A + 2B)/3$.]
    #step[Tính tọa độ điểm $M$:
    - $x_M = (1 + 2(-2))/3 = -1$.
    - $y_M = (2 + 2(-4))/3 = -2$.
    - $z_M = (3 + 2(9))/3 = 7$.
    Vậy $M(-1; -2; 7)$.]
    #step[Tính bình phương độ dài đoạn thẳng $O M$:
    $O M^2 = (-1)^2 + (-2)^2 + 7^2 = 1 + 4 + 49 = 54$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(1;-1;1), B(3;1;2)$ và $C(-1;0;3)$. Có bao nhiêu điểm $D$ sao cho tứ giác $A B C D$ là hình thang có 2 cạnh đáy $A B, C D$ và có góc tại $D$ bằng $45^degree$.],
  [2],
  loigiai: [
    #step[Tính tọa độ vectơ đáy $arrow(A B) = B - A = (2; 2; 1)$.
    Để tứ giác $A B C D$ là hình thang có hai cạnh đáy là $A B$ và $C D$ thì đường thẳng $C D$ song song với $A B$.
    Do đó, vectơ $arrow(C D)$ cùng phương với $arrow(A B)$, suy ra tồn tại $k != 0$ sao cho:
    $arrow(C D) = k arrow(A B) = (2k; 2k; k)$.]
    #step[Từ $arrow(C D) = D - C => D = C + arrow(C D) = (-1 + 2k; 2k; 3 + k)$.
    Tính tọa độ vectơ $arrow(D A)$:
    $arrow(D A) = A - D = (1 - (-1+2k); -1 - 2k; 1 - (3+k)) = (2 - 2k; -1 - 2k; -2 - k)$.]
    #step[Góc tại đỉnh $D$ của hình thang bằng $45^degree$, tức là góc giữa hai đường thẳng $D A$ và $D C$ bằng $45^degree$ (ở đây $D C parallel A B$):
    $cos 45^degree = (|arrow(D A) dot arrow(A B)|) / (D A dot A B)$.]
    #step[Tính toán cụ thể các biểu thức:
    - $|arrow(D A) dot arrow(A B)| = |2(2-2k) + 2(-1-2k) + 1(-2-k)| = |4 - 4k - 2 - 4k - 2 - k| = |-9k| = 9|k|$.
    - $A B = sqrt(2^2 + 2^2 + 1^2) = 3$.
    - $D A = sqrt((2-2k)^2 + (-1-2k)^2 + (-2-k)^2) = sqrt(9k^2 + 9) = 3 sqrt(k^2 + 1)$.
    Thay vào phương trình:
    $sqrt(2)/2 = (9|k|) / (3 times 3 sqrt(k^2 + 1)) <=> sqrt(2)/2 = |k| / sqrt(k^2 + 1)$.]
    #step[Bình phương hai vế phương trình:
    $1/2 = k^2 / (k^2 + 1) <=> k^2 + 1 = 2k^2 <=> k^2 = 1 => k = 1$ hoặc $k = -1$.
    Cả hai giá trị $k = 1$ và $k = -1$ đều thỏa mãn điều kiện $k != 0$ và tạo ra hai điểm $D$ phân biệt không thẳng hàng với $A, B, C$.
    Vậy có $2$ điểm $D$ thỏa mãn yêu cầu đề bài.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$ cho hình thang $A B C D$ vuông tại $A$ và $B$. Ba đỉnh $A(1;2;1), B(2;0;-1), C(6;1;0)$ và hình thang có diện tích bằng $6 sqrt(2)$. Giả sử đỉnh $D(a;b;c)$. Tính $a + b + c$.],
  [6],
  loigiai: [
    #step[Do hình thang $A B C D$ vuông tại $A$ và $B$ nên hai đáy của hình thang là $A D$ và $B C$ (hai đáy cùng vuông góc với cạnh bên $A B$). Chiều cao của hình thang chính là độ dài đoạn $A B$.]
    #step[Tính độ dài chiều cao $A B$ và đáy $B C$:
    - $arrow(A B) = (1; -2; -2) => A B = sqrt(1^2 + (-2)^2 + (-2)^2) = 3$.
    - $arrow(B C) = (4; 1; 1) => B C = sqrt(4^2 + 1^2 + 1^2) = sqrt(18) = 3 sqrt(2)$.]
    #step[Công thức tính diện tích hình thang:
    $S = 1/2 (A D + B C) A B = 6 sqrt(2) <=> 1/2 (A D + 3 sqrt(2)) times 3 = 6 sqrt(2)$
    $<=> A D + 3 sqrt(2) = 4 sqrt(2) => A D = sqrt(2)$.]
    #step[Vì $A D parallel B C$ và $A B C D$ là hình thang lồi không tự cắt nên hai vectơ $arrow(A D)$ và $arrow(B C)$ phải cùng hướng:
    $arrow(A D) = A D/B C arrow(B C) = sqrt(2)/(3 sqrt(2)) arrow(B C) = 1/3 arrow(B C)$.
    Tọa độ vectơ $arrow(A D) = 1/3 (4; 1; 1) = (4/3; 1/3; 1/3)$.]
    #step[Tìm tọa độ đỉnh $D$:
    $D = A + arrow(A D) = (1 + 4/3; 2 + 1/3; 1 + 1/3) = (7/3; 7/3; 4/3)$.
    Suy ra $a + b + c = 7/3 + 7/3 + 4/3 = 18/3 = 6$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong hệ trục tọa độ $O x y z$ cho 3 điểm $A(5;-2;0), B(4;5;-2)$ và $C(0;3;2)$. Điểm $M$ di chuyển trên trục $O x$. Đặt $Q = 2 |arrow(M A) + arrow(M B) + arrow(M C)| + 3 |arrow(M B) + arrow(M C)|$. Biết giá trị nhỏ nhất của $Q$ có dạng $a sqrt(b)$ trong đó $a, b in NN$ và $b$ là số nguyên tố. Tính $a + b$.],
  [43],
  loigiai: [
    #step[Gọi $G$ là trọng tâm của tam giác $A B C$ và $K$ là trung điểm của $B C$:
    - $G = ( (5+4+0)/3; (-2+5+3)/3; (0-2+2)/3 ) = (3; 2; 0)$.
    - $K = ( (4+0)/2; (5+3)/2; (-2+2)/2 ) = (2; 4; 0)$.]
    #step[Biến đổi biểu thức $Q$ bằng cách chèn điểm trọng tâm và trung điểm:
    - $arrow(M A) + arrow(M B) + arrow(M C) = 3 arrow(M G) => |arrow(M A) + arrow(M B) + arrow(M C)| = 3 M G$.
    - $arrow(M B) + arrow(M C) = 2 arrow(M K) => |arrow(M B) + arrow(M C)| = 2 M K$.
    Khi đó: $Q = 2(3 M G) + 3(2 M K) = 6(M G + M K)$.]
    #step[Do $M$ di chuyển trên trục $O x$ nên $M(x; 0; 0)$.
    Nhận thấy cả ba điểm $M, G, K$ đều nằm trên mặt phẳng tọa độ $O x y$ (do cao độ bằng 0).
    Xét tọa độ của chúng trên mặt phẳng $O x y$: $M(x; 0), G(3; 2), K(2; 4)$.
    Vì tung độ của $G$ và $K$ đều dương ($2 > 0, 4 > 0$) nên hai điểm $G$ và $K$ nằm cùng một phía đối với trục $O x$.]
    #step[Để tìm giá trị nhỏ nhất của $M G + M K$ với $M in O x$, ta lấy đối xứng điểm $G$ qua trục $O x$ thu được $G'(3; -2; 0)$.
    Khi đó $M G = M G'$, suy ra $M G + M K = M G' + M K >= G' K$.
    Độ dài đoạn thẳng $G' K$:
    $G' K = sqrt((2 - 3)^2 + (4 - (-2))^2 + (0 - 0)^2) = sqrt((-1)^2 + 6^2 + 0^2) = sqrt(37)$.]
    #step[Do đó, giá trị nhỏ nhất của $Q$ là $Q_("min") = 6 G' K = 6 sqrt(37)$.
    Ở đây $a = 6, b = 37$ (với $37$ là số nguyên tố).
    Tính tổng $a + b = 6 + 37 = 43$.]
  ]
)

#my-tln(de: "Đề 1", 
  
  [Trong không gian $O x y z$, cho ba điểm $A(-2;3;1), B(2;1;0), C(-3;-1;1)$. Gọi $D(a;b;c)$ là điểm sao cho $A B C D$ là hình thang có cạnh đáy $A D$ và diện tích hình thang $A B C D$ bằng $4$ lần diện tích tam giác $A B C$. Tính $a + b + c$.],
  [-16],
  loigiai: [
    #step[Để tứ giác $A B C D$ là hình thang có đáy $A D$ thì hai đáy là $A D$ và $B C$.
    Tính tọa độ vectơ đáy $arrow(B C) = C - B = (-3-2; -1-1; 1-0) = (-5; -2; 1)$.]
    #step[Diện tích hình thang đáy $A D$ và diện tích tam giác $A B C$ có cùng chiều cao $h$ hạ từ $A$ xuống $B C$:
    - $S_("hình thang") = 1/2 (A D + B C) h$.
    - $S_("tam giác") = 1/2 B C dot h$.
    Theo giả thiết diện tích hình thang bằng $4$ lần diện tích tam giác:
    $1/2 (A D + B C) h = 4 times 1/2 B C dot h <=> A D + B C = 4 B C => A D = 3 B C$.]
    #step[Để tứ giác $A B C D$ không bị tự cắt (hình thang lồi), hai vectơ đáy $arrow(A D)$ và $arrow(B C)$ phải cùng hướng:
    $arrow(A D) = 3 arrow(B C) = 3(-5; -2; 1) = (-15; -6; 3)$.]
    #step[Tìm tọa độ đỉnh $D$:
    $D = A + arrow(A D) = (-2 - 15; 3 - 6; 1 + 3) = (-17; -3; 4)$.
    Tọa độ đỉnh $D(a;b;c) = (-17; -3; 4)$.
    Tính tổng: $a + b + c = -17 - 3 + 4 = -16$.]
  ]
)
