#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 04 — Toạ độ của các phép toán vectơ])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (30 câu)], count: 30)

#tn(
  [Trong không gian $O x y z$, cho hai vectơ $arrow(a) = (1; -2; 1)$ và $arrow(b) = (2; -4; -2)$. Khi đó $arrow(a) dot arrow(b)$ bằng],
  (
    True([$8$]),
    [$-8$],
    [$12$],
    [$-12$]
  ),
  loigiai: [
    #step[Công thức tính tích vô hướng của hai vectơ trong không gian:
    $arrow(a) dot arrow(b) = a_1 b_1 + a_2 b_2 + a_3 b_3$.]
    #step[Thay toạ độ $arrow(a) = (1; -2; 1)$ và $arrow(b) = (2; -4; -2)$ vào công thức:
    $arrow(a) dot arrow(b) = 1 dot 2 + (-2) dot (-4) + 1 dot (-2) = 2 + 8 - 2 = 8$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho $arrow(a) = (x_0, y_0, z_0)$, $arrow(b) = (x_1, y_1, z_1)$. Toạ độ $[arrow(a), arrow(b)]$ là],
  (
    [$(y_0 z_1 - y_1 z_0; x_0 z_1 - x_1 z_0; x_0 y_1 - x_1 y_0)$],
    True([$(y_0 z_1 - y_1 z_0; -x_0 z_1 + x_1 z_0; x_0 y_1 - x_1 y_0)$]),
    [$(y_0 z_1 + y_1 z_0; x_0 z_1 + x_1 z_0; x_0 y_1 + x_1 y_0)$],
    [$(y_0 z_1 - y_1 z_0; -x_0 z_1 - x_1 z_0; x_0 y_1 - x_1 y_0)$]
  ),
  loigiai: [
    #step[Tích có hướng của hai vectơ $arrow(a)$ và $arrow(b)$ có công thức là:
    $[arrow(a), arrow(b)] = (y_0 z_1 - z_0 y_1; z_0 x_1 - x_0 z_1; x_0 y_1 - y_0 x_1)$.]
    #step[Ta có:
    - Hoành độ: $y_0 z_1 - z_0 y_1 = y_0 z_1 - y_1 z_0$.
    - Tung độ: $z_0 x_1 - x_0 z_1 = -x_0 z_1 + x_1 z_0$.
    - Cao độ: $x_0 y_1 - y_0 x_1 = x_0 y_1 - x_1 y_0$.]
    #step[Đối chiếu các phương án, ta thấy phương án B khớp hoàn toàn với công thức trên. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho $arrow(u) = (1; 2; 3)$, $arrow(v) = (0; -1; 1)$. Tìm toạ độ của vectơ tích có hướng của hai vectơ $arrow(u)$ và $arrow(v)$],
  (
    [$(5; 1; -1)$],
    True([$(5; -1; -1)$]),
    [$(-1; -1; -1)$],
    [$(-1; -1; 5)$]
  ),
  loigiai: [
    #step[Tính toạ độ các thành phần của tích có hướng $[arrow(u), arrow(v)]$:
    - Hoành độ: $y_u z_v - z_u y_v = 2 dot 1 - 3 dot (-1) = 5$.
    - Tung độ: $z_u x_v - x_u z_v = 3 dot 0 - 1 dot 1 = -1$.
    - Cao độ: $x_u y_v - y_u x_v = 1 dot (-1) - 2 dot 0 = -1$.]
    #step[Vậy toạ độ tích có hướng $[arrow(u), arrow(v)] = (5; -1; -1)$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cosin của góc tạo bởi hai vecto $arrow(a) = (-1; 2; 0)$ và $arrow(b) = (0; -2; 1)$ là],
  (
    [$4/5$],
    True([$-4/5$]),
    [$4/25$],
    [$-4/25$]
  ),
  loigiai: [
    #step[Cosin góc giữa hai vectơ được tính theo công thức:
    $cos (arrow(a), arrow(b)) = (arrow(a) dot arrow(b)) / (|arrow(a)| dot |arrow(b)|)$.]
    #step[Tính tích vô hướng và độ dài của từng vectơ:
    - $arrow(a) dot arrow(b) = (-1) dot 0 + 2 dot (-2) + 0 dot 1 = -4$.
    - $|arrow(a)| = sqrt((-1)^2 + 2^2 + 0^2) = sqrt(5)$.
    - $|arrow(b)| = sqrt(0^2 + (-2)^2 + 1^2) = sqrt(5)$.]
    #step[Thay các giá trị vào công thức:
    $cos (arrow(a), arrow(b)) = (-4) / (sqrt(5) dot sqrt(5)) = -4/5$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho hai véc-tơ $arrow(m) = (4; 3; 1)$ và $arrow(n) = (0; 0; 1)$. Gọi $arrow(p)$ là véc-tơ cùng hướng với $[arrow(m), arrow(n)]$ và $|arrow(p)| = 15$. Tọa độ của véc-tơ $arrow(p)$ là],
  (
    [$(0; 9; -12)$],
    [$(-9; 12; 0)$],
    [$(0; -9; 12)$],
    True([$(9; -12; 0)$])
  ),
  loigiai: [
    #step[Tính tích có hướng $[arrow(m), arrow(n)]$:
    $[arrow(m), arrow(n)] = (3 dot 1 - 1 dot 0; 1 dot 0 - 4 dot 1; 4 dot 0 - 3 dot 0) = (3; -4; 0)$.]
    #step[Độ dài của vectơ tích có hướng:
    $|[arrow(m), arrow(n)]| = sqrt(3^2 + (-4)^2 + 0^2) = 5$.]
    #step[Vì $arrow(p)$ cùng hướng với $[arrow(m), arrow(n)]$ nên $arrow(p) = k [arrow(m), arrow(n)]$ với $k > 0$.
    Ta có $|arrow(p)| = k |[arrow(m), arrow(n)]| <=> 15 = 5k => k = 3$.]
    #step[Tìm toạ độ $arrow(p)$:
    $arrow(p) = 3 (3; -4; 0) = (9; -12; 0)$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho $arrow(a) = (-3; -1; 1)$, $arrow(b) = (4; 1; 2)$, $arrow(c) = (1; 0; m+2)$. Tìm $m$ để ba véc tơ $arrow(a), arrow(b), arrow(c)$ đồng phẳng],
  (
    [$m = -5$],
    [$m = 5$],
    [$m = -1$],
    True([$m = 1$])
  ),
  loigiai: [
    #step[Ba vectơ đồng phẳng khi và chỉ khi tích hỗn tạp của chúng bằng 0: $[arrow(a), arrow(b)] dot arrow(c) = 0$.]
    #step[Tính tích có hướng $[arrow(a), arrow(b)]$:
    $[arrow(a), arrow(b)] = ((-1) dot 2 - 1 dot 1; 1 dot 4 - (-3) dot 2; (-3) dot 1 - (-1) dot 4) = (-3; 10; 1)$.]
    #step[Tính tích vô hướng của $[arrow(a), arrow(b)]$ với $arrow(c) = (1; 0; m+2)$:
    $[arrow(a), arrow(b)] dot arrow(c) = -3 dot 1 + 10 dot 0 + 1 dot (m+2) = m - 1$.]
    #step[Để ba vectơ đồng phẳng:
    $m - 1 = 0 <=> m = 1$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ toạ độ $O x y z$ cho $A(1; -2; 0); B(1; 0; -1); C(0; -1; 2)$ và $D(0; 3; m)$. Giá trị của $m$ thuộc khoảng nào sau đây để bốn điểm trên đồng phẳng?],
  (
    [$(-2; -1)$],
    True([$(-1; 1)$]),
    [$(1; 2)$],
    [$(5; 7)$]
  ),
  loigiai: [
    #step[Bốn điểm $A, B, C, D$ đồng phẳng khi và chỉ khi hai vectơ $[arrow(A B), arrow(A C)]$ và $arrow(A D)$ vuông góc với nhau, tức là $[arrow(A B), arrow(A C)] dot arrow(A D) = 0$.]
    #step[Tính toạ độ các vectơ:
    - $arrow(A B) = (0; 2; -1)$.
    - $arrow(A C) = (-1; 1; 2)$.
    - $arrow(A D) = (-1; 5; m)$.]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
    $[arrow(A B), arrow(A C)] = (2 dot 2 - (-1) dot 1; (-1) dot (-1) - 0 dot 2; 0 dot 1 - 2 dot (-1)) = (5; 1; 2)$.]
    #step[Tính tích hỗn tạp và tìm $m$:
    $[arrow(A B), arrow(A C)] dot arrow(A D) = 5 dot (-1) + 1 dot 5 + 2 dot m = 2m$.
    Đồng phẳng khi $2m = 0 <=> m = 0$.
    Vì $m = 0 in (-1; 1)$, chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho hai véc-tơ $arrow(a) = (-1; 3; 2)$, $arrow(b) = (-3; -1; 2)$. Tính $arrow(a) dot arrow(b)$.],
  (
    [$10$],
    [$2$],
    True([$4$]),
    [$3$]
  ),
  loigiai: [
    #step[Tính tích vô hướng $arrow(a) dot arrow(b)$:
    $arrow(a) dot arrow(b) = a_1 b_1 + a_2 b_2 + a_3 b_3$.]
    #step[Thay toạ độ $arrow(a) = (-1; 3; 2)$ và $arrow(b) = (-3; -1; 2)$ vào công thức:
    $arrow(a) dot arrow(b) = (-1) dot (-3) + 3 dot (-1) + 2 dot 2 = 3 - 3 + 4 = 4$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho hai vecto $arrow(u) = (-3; 1; -1)$ và $arrow(v) = (1; 0; 5)$. Tích vô hướng của hai vecto này bằng],
  (
    True([$-8$]),
    [$8$],
    [$3$],
    [$-3$]
  ),
  loigiai: [
    #step[Tính tích vô hướng $arrow(u) dot arrow(v)$:
    $arrow(u) dot arrow(v) = u_1 v_1 + u_2 v_2 + u_3 v_3$.]
    #step[Thay toạ độ $arrow(u) = (-3; 1; -1)$ và $arrow(v) = (1; 0; 5)$ vào:
    $arrow(u) dot arrow(v) = (-3) dot 1 + 1 dot 0 + (-1) dot 5 = -3 + 0 - 5 = -8$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho hai vecto $arrow(u)(-1; 3; 2)$ và $arrow(v)(-3; -1; 2)$. Tích vô hướng của $arrow(u) dot arrow(v)$ bằng],
  (
    [$3$],
    [$2$],
    [$10$],
    True([$4$])
  ),
  loigiai: [
    #step[Tính tích vô hướng $arrow(u) dot arrow(v)$:
    $arrow(u) dot arrow(v) = (-1) dot (-3) + 3 dot (-1) + 2 dot 2 = 3 - 3 + 4 = 4$.]
    #step[Kết luận: Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho $arrow(u) = (1; 2; 3)$, $arrow(v) = (0; -1; 1)$. Tìm tọa độ của véc tơ tích có hướng của hai vecto $arrow(u)$ và $arrow(v)$],
  (
    [$(5; 1; -1)$],
    True([$(5; -1; -1)$]),
    [$(-1; -1; -1)$],
    [$(-1; -1; 5)$]
  ),
  loigiai: [
    #step[Tính tích có hướng $[arrow(u), arrow(v)]$:
    - Hoành độ: $2 dot 1 - 3 dot (-1) = 5$.
    - Tung độ: $3 dot 0 - 1 dot 1 = -1$.
    - Cao độ: $1 dot (-1) - 2 dot 0 = -1$.]
    #step[Vậy $[arrow(u), arrow(v)] = (5; -1; -1)$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, Cho tam giác $A B C$ với $A(1; 2; 3)$, $B(0; 1; 4)$ và $C(2; 3; -2)$. Tính diện tích $S$ của tam giác $A B C$.],
  (
    True([$S = 2 sqrt(2)$]),
    [$S = 6 sqrt(2)$],
    [$S = 4 sqrt(2)$],
    [$S = 3 sqrt(2)$]
  ),
  loigiai: [
    #step[Tính tọa độ hai vectơ xuất phát từ một đỉnh, ví dụ $arrow(A B)$ và $arrow(A C)$:
    - $arrow(A B) = (-1; -1; 1)$.
    - $arrow(A C) = (1; 1; -5)$.]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
    $[arrow(A B), arrow(A C)] = ((-1) dot (-5) - 1 dot 1; 1 dot 1 - (-1) dot (-5); (-1) dot 1 - (-1) dot 1) = (4; -4; 0)$.]
    #step[Tính diện tích tam giác $A B C$:
    $S = 1/2 |[arrow(A B), arrow(A C)]| = 1/2 sqrt(4^2 + (-4)^2 + 0^2) = 1/2 sqrt(32) = 2 sqrt(2)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(1; 2; 3); B(3; 4; 5)$. Diện tích tam giác $O A B$ bằng],
  (
    [$sqrt(87)$],
    [$sqrt(21)/2$],
    True([$sqrt(6)$]),
    [$2 sqrt(6)$]
  ),
  loigiai: [
    #step[Tính tọa độ hai vectơ $arrow(O A)$ và $arrow(O B)$:
    - $arrow(O A) = (1; 2; 3)$.
    - $arrow(O B) = (3; 4; 5)$.]
    #step[Tính tích có hướng $[arrow(O A), arrow(O B)]$:
    $[arrow(O A), arrow(O B)] = (2 dot 5 - 3 dot 4; 3 dot 3 - 1 dot 5; 1 dot 4 - 2 dot 3) = (-2; 4; -2)$.]
    #step[Tính diện tích tam giác $O A B$:
    $S = 1/2 |[arrow(O A), arrow(O B)]| = 1/2 sqrt((-2)^2 + 4^2 + (-2)^2) = 1/2 sqrt(24) = sqrt(6)$.]
    #step[Kết luận: Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ trục tọa độ $O x y z$, cho hai vecto $arrow(a) = (3; -2; m)$, $arrow(b) = (2; m; -1)$ với $m$ là tham số nhận giá trị thực. Tìm giá trị của $m$ để hai vecto $arrow(a)$ và $arrow(b)$ vuông góc với nhau.],
  (
    [$m = 1$],
    True([$m = 2$]),
    [$m = -1$],
    [$m = -2$]
  ),
  loigiai: [
    #step[Hai vectơ vuông góc với nhau khi và chỉ khi tích vô hướng của chúng bằng 0: $arrow(a) dot arrow(b) = 0$.]
    #step[Tính tích vô hướng:
    $arrow(a) dot arrow(b) = 3 dot 2 + (-2) dot m + m dot (-1) = 6 - 3m$.]
    #step[Giải phương trình tìm $m$:
    $6 - 3m = 0 <=> m = 2$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho điểm $A(-4; 6; 2)$. Gọi $M, N, P$ lần lượt là hình chiếu của $A$ trên các trục $O x$, $O y$ và $O z$. Tính diện tích $S$ của tam giác $M N P$.],
  (
    [$S = 28$],
    [$S = 49/2$],
    [$S = 7$],
    True([$S = 14$])
  ),
  loigiai: [
    #step[Xác định tọa độ hình chiếu của điểm $A(-4; 6; 2)$ lên các trục tọa độ:
    - Chiếu lên $O x$: $M(-4; 0; 0)$.
    - Chiếu lên $O y$: $N(0; 6; 0)$.
    - Chiếu lên $O z$: $P(0; 0; 2)$.]
    #step[Tính tọa độ hai vectơ $arrow(M N)$ và $arrow(M P)$:
    $arrow(M N) = (4; 6; 0)$ và $arrow(M P) = (4; 0; 2)$.]
    #step[Tính tích có hướng $[arrow(M N), arrow(M P)]$:
    $[arrow(M N), arrow(M P)] = (6 dot 2 - 0 dot 0; 0 dot 4 - 4 dot 2; 4 dot 0 - 6 dot 4) = (12; -8; -24)$.]
    #step[Tính diện tích tam giác $M N P$:
    $S = 1/2 |[arrow(M N), arrow(M P)]| = 1/2 sqrt(12^2 + (-8)^2 + (-24)^2) = 1/2 sqrt(784) = 1/2 dot 28 = 14$.
    Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho $arrow(a) = (3; -1; 2)$, $arrow(b) = (4; 2; -6)$. Giá trị của $|arrow(a) + arrow(b)|$ bằng],
  (
    [$66$],
    True([$sqrt(66)$]),
    [$3 sqrt(14)$],
    [$2$]
  ),
  loigiai: [
    #step[Tính tọa độ vectơ tổng $arrow(u) = arrow(a) + arrow(b)$:
    $arrow(u) = (3 + 4; -1 + 2; 2 + (-6)) = (7; 1; -4)$.]
    #step[Tính độ dài của vectơ tổng:
    $|arrow(u)| = sqrt(7^2 + 1^2 + (-4)^2) = sqrt(49 + 1 + 16) = sqrt(66)$.]
    #step[Kết luận: Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ trục tọa độ $O x y z$, điểm thuộc $O x$ và cách đều hai điểm $A(4; 2; -1)$ và $B(2; 1; 0)$ là],
  (
    [$M(-4; 0; 0)$],
    [$M(5; 0; 0)$],
    True([$M(4; 0; 0)$]),
    [$M(-5; 0; 0)$]
  ),
  loigiai: [
    #step[Gọi điểm $M$ thuộc trục $O x$ nên $M(x; 0; 0)$.]
    #step[Tính bình phương khoảng cách $M A^2$ và $M B^2$:
    - $M A^2 = (4-x)^2 + 2^2 + (-1)^2 = x^2 - 8x + 21$.
    - $M B^2 = (2-x)^2 + 1^2 + 0^2 = x^2 - 4x + 5$.]
    #step[Vì $M$ cách đều $A$ và $B$ nên $M A^2 = M B^2$:
    $x^2 - 8x + 21 = x^2 - 4x + 5 <=> -4x = -16 <=> x = 4$.]
    #step[Vậy $M(4; 0; 0)$. Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(1; 1; 0); B(2; -1; 3)$. Tìm tọa độ điểm $C$ trên trục $O y$ để tam giác $A B C$ vuông tại $A$.],
  (
    [$(0; 0; 1/2)$],
    [$(0; 2; 0)$],
    [$(1/2; 0; 0)$],
    True([$(0; 1/2; 0)$])
  ),
  loigiai: [
    #step[Điểm $C$ thuộc trục $O y$ nên có tọa độ dạng $C(0; y; 0)$.]
    #step[Tính tọa độ hai vectơ $arrow(A B)$ và $arrow(A C)$:
    - $arrow(A B) = (2-1; -1-1; 3-0) = (1; -2; 3)$.
    - $arrow(A C) = (0-1; y-1; 0-0) = (-1; y-1; 0)$.]
    #step[Tam giác $A B C$ vuông tại $A$ khi và chỉ khi $arrow(A B) dot arrow(A C) = 0$:
    $1 dot (-1) + (-2) dot (y-1) + 3 dot 0 = 0 <=> -1 - 2y + 2 = 0 <=> 2y = 1 <=> y = 1/2$.]
    #step[Vậy điểm $C$ là $(0; 1/2; 0)$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ trục tọa độ $O x y z$, biết $|arrow(u)| = 2, |arrow(v)| = 1$ và góc giữa hai véc tơ bằng $2pi/3$. Tìm $k$ để vecto $arrow(p) = k arrow(u) + arrow(v)$ vuông góc với vecto $arrow(q) = arrow(u) - arrow(v)$.],
  (
    [$k = -2/5$],
    [$k = 5/2$],
    [$k = 2$],
    True([$k = 2/5$])
  ),
  loigiai: [
    #step[Tính tích vô hướng $arrow(u) dot arrow(v)$:
    $arrow(u) dot arrow(v) = |arrow(u)| dot |arrow(v)| dot cos(arrow(u), arrow(v)) = 2 dot 1 dot cos(2pi/3) = 2 dot (-1/2) = -1$.]
    #step[Vectơ $arrow(p)$ vuông góc với $arrow(q)$ khi và chỉ khi $arrow(p) dot arrow(q) = 0$:
    $(k arrow(u) + arrow(v)) dot (arrow(u) - arrow(v)) = 0 <=> k |arrow(u)|^2 + (1-k) arrow(u) dot arrow(v) - |arrow(v)|^2 = 0$.]
    #step[Thay các giá trị vào phương trình:
    $k dot 2^2 + (1-k) dot (-1) - 1^2 = 0 <=> 4k - 1 + k - 1 = 0 <=> 5k = 2 <=> k = 2/5$.]
    #step[Vậy $k = 2/5$. Chọn đáp án D.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho ba điểm $A(1; 0; 2), B(1; 1; 1), C(2; -1; 3)$. Hỏi cosin của góc tạo bởi hai đường thẳng $A B$ và $B C$ bằng bao nhiêu?],
  (
    [$1/3$],
    True([$(2 sqrt(2))/3$]),
    [$sqrt(3)/2$],
    [$1/2$]
  ),
  loigiai: [
    #step[Tính tọa độ các vectơ chỉ phương $arrow(A B)$ và $arrow(B C)$:
    - $arrow(A B) = (0; 1; -1)$.
    - $arrow(B C) = (1; -2; 2)$.]
    #step[Tính tích vô hướng và độ dài của hai vectơ:
    - $|arrow(A B) dot arrow(B C)| = |0 dot 1 + 1 dot (-2) + (-1) dot 2| = |-4| = 4$.
    - $|arrow(A B)| = sqrt(0^2 + 1^2 + (-1)^2) = sqrt(2)$.
    - $|arrow(B C)| = sqrt(1^2 + (-2)^2 + 2^2) = sqrt(9) = 3$.]
    #step[Cosin góc tạo bởi hai đường thẳng $A B$ và $B C$ là:
    $cos(A B, B C) = (|arrow(A B) dot arrow(B C)|) / (|arrow(A B)| dot |arrow(B C)|) = 4 / (3 sqrt(2)) = (2 sqrt(2))/3$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Cho hai vecto $arrow(a)$ và $arrow(b)$ tạo với nhau một góc $60^degree$ và $|arrow(a)| = 2; |arrow(b)| = 4$. Khi đó $|arrow(a) + arrow(b)|$ bằng],
  (
    [$2 sqrt(5)$],
    True([$2 sqrt(7)$]),
    [$2$],
    [$sqrt(8 sqrt(3)+20)$]
  ),
  loigiai: [
    #step[Sử dụng hệ thức bình phương độ dài:
    $|arrow(a) + arrow(b)|^2 = |arrow(a)|^2 + |arrow(b)|^2 + 2 arrow(a) dot arrow(b)$.]
    #step[Tính tích vô hướng của hai vectơ:
    $arrow(a) dot arrow(b) = |arrow(a)| dot |arrow(b)| dot cos 60^degree = 2 dot 4 dot 1/2 = 4$.]
    #step[Thay vào công thức:
    $|arrow(a) + arrow(b)|^2 = 2^2 + 4^2 + 2 dot 4 = 4 + 16 + 8 = 28$.
    Suy ra $|arrow(a) + arrow(b)| = sqrt(28) = 2 sqrt(7)$. Chọn đáp án B.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho tam giác $A B C$ có $arrow(A B) = (-3; 0; 4), arrow(A C) = (5; -2; 4)$. Độ dài đường trung tuyến $A M$ là],
  (
    True([$3  sqrt(2)$]),
    [$5 sqrt(2)$],
    [$4  sqrt(2)$],
    [$2  sqrt(3)$]
  ),
  loigiai: [
    #step[Vì $M$ là trung điểm của $B C$ nên ta có công thức vectơ trung tuyến:
    $arrow(A M) = 1/2 (arrow(A B) + arrow(A C))$.]
    #step[Tính tọa độ vectơ $arrow(A M)$:
    $arrow(A M) = 1/2 (-3 + 5; 0 - 2; 4 + 4) = 1/2 (2; -2; 8) = (1; -1; 4)$.]
    #step[Tính độ dài đường trung tuyến $A M$:
    $A M = |arrow(A M)| = sqrt(1^2 + (-1)^2 + 4^2) = sqrt(1 + 1 + 16) = sqrt(18) = 3  sqrt(2)$.]
    #step[Kết luận: Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $A(1; 2; -1)$, $B(2; 1; 2)$. Điểm $M$ trên trục $O x$ có hoành độ dương và thỏa mãn $M A^2 + M B^2 = 23$. Khi đó tọa độ điểm $M$ là],
  (
    True([$M(4; 0; 0)$]),
    [$M(3; 0; 0)$],
    [$M(2; 0; 0)$],
    [$M(1; 0; 0)$]
  ),
  loigiai: [
    #step[Điểm $M$ nằm trên trục $O x$ và có hoành độ dương nên $M(x; 0; 0)$ với $x > 0$.]
    #step[Tính bình phương khoảng cách từ $M$ tới $A$ và $B$:
    - $M A^2 = (1-x)^2 + 2^2 + (-1)^2 = x^2 - 2x + 6$.
    - $M B^2 = (2-x)^2 + 1^2 + 2^2 = x^2 - 4x + 9$.]
    #step[Thiết lập phương trình:
    $M A^2 + M B^2 = 23 <=> (x^2 - 2x + 6) + (x^2 - 4x + 9) = 23 <=> 2x^2 - 6x - 8 = 0$.]
    #step[Giải phương trình bậc hai:
    $x^2 - 3x - 4 = 0 <=> (x - 4)(x + 1) = 0 => cases(x = 4 " (thỏa mãn)", x = -1 " (loại)")$.
    Vậy $M(4; 0; 0)$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho hai vec $arrow(u) = (-2; 1; 5)$ và $arrow(v) = (m-2; 3; m+1)$, $m$ là tham số. Tìm $m$ để $arrow(u)$ vuông góc với $arrow(v)$.],
  (
    True([$m = -4$]),
    [$m = 4$],
    [$m = -3$],
    [$m = 3$]
  ),
  loigiai: [
    #step[Hai vectơ $arrow(u)$ và $arrow(v)$ vuông góc khi và chỉ khi tích vô hướng của chúng bằng 0: $arrow(u) dot arrow(v) = 0$.]
    #step[Tính tích vô hướng:
    $arrow(u) dot arrow(v) = (-2) dot (m-2) + 1 dot 3 + 5 dot (m+1) = -2m + 4 + 3 + 5m + 5 = 3m + 12$.]
    #step[Giải phương trình tìm $m$:
    $3m + 12 = 0 <=> 3m = -12 <=> m = -4$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$ cho hai vecto $arrow(u), arrow(v)$ thoả mãn $|arrow(u)| = 3; |arrow(v)| = 4; (arrow(u); arrow(v)) = 60^degree$. Tính độ dài vecto $arrow(u) + 2 arrow(v)$.],
  (
    True([$sqrt(97)$]),
    [$8$],
    [$7$],
    [$4 sqrt(6)$]
  ),
  loigiai: [
    #step[Tính bình phương độ dài của vectơ $arrow(u) + 2 arrow(v)$:
    $|arrow(u) + 2 arrow(v)|^2 = |arrow(u)|^2 + 4 |arrow(v)|^2 + 4 arrow(u) dot arrow(v)$.]
    #step[Thay các giá trị $|arrow(u)| = 3, |arrow(v)| = 4$ và tích vô hướng $arrow(u) dot arrow(v) = 3 dot 4 dot cos 60^degree = 6$ vào:
    $|arrow(u) + 2 arrow(v)|^2 = 3^2 + 4 dot 4^2 + 4 dot 6 = 9 + 64 + 24 = 97$.]
    #step[Suy ra $|arrow(u) + 2 arrow(v)| = sqrt(97)$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 4; -5), B(2; 3; -6)$ và $C(4; 4; -5)$. Tìm tọa độ trực tâm $H$ của tam giác $A B C$.],
  (
    [$H(5/7; 4; -5)$],
    [$H(1; 4; -5)$],
    True([$H(2; 3; -6)$]),
    [$H(7/3; 11/3; -16/3)$]
  ),
  loigiai: [
    #step[Tính các vectơ cạnh của tam giác $A B C$:
    - $arrow(A B) = (1; -1; -1)$.
    - $arrow(B C) = (2; 1; 1)$.
    - $arrow(A C) = (3; 0; 0)$.]
    #step[Tính tích vô hướng $arrow(A B) dot arrow(B C)$:
    $arrow(A B) dot arrow(B C) = 1 dot 2 + (-1) dot 1 + (-1) dot 1 = 2 - 1 - 1 = 0$.
    Do đó tam giác $A B C$ vuông tại $B$.]
    #step[Đối với tam giác vuông tại $B$, trực tâm $H$ chính là đỉnh góc vuông $B$.
    Vậy $H(2; 3; -6)$. Chọn đáp án C.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho bốn điểm $A(1; 1; 4)$, $B(5; -1; 3)$, $C(3; 1; 5)$ và $D(2; 2; m)$ (với $m$ là tham số). Xác định $m$ để bốn điểm $A, B, C, D$ tạo thành bốn đỉnh của một tứ diện.],
  (
    True([$m != 6$]),
    [$m != 4$],
    [$m in RR$],
    [$m < 0$]
  ),
  loigiai: [
    #step[Bốn điểm $A, B, C, D$ tạo thành bốn đỉnh của một tứ diện khi và chỉ khi chúng không đồng phẳng, tức là tích hỗn tạp $[arrow(A B), arrow(A C)] dot arrow(A D) != 0$.]
    #step[Tính tọa độ các vectơ:
    - $arrow(A B) = (4; -2; -1)$.
    - $arrow(A C) = (2; 0; 1)$.
    - $arrow(A D) = (1; 1; m-4)$.]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
    $[arrow(A B), arrow(A C)] = ((-2) dot 1 - (-1) dot 0; (-1) dot 2 - 4 dot 1; 4 dot 0 - (-2) dot 2) = (-2; -6; 4)$.]
    #step[Tính tích hỗn tạp:
    $[arrow(A B), arrow(A C)] dot arrow(A D) = -2 dot 1 + (-6) dot 1 + 4 dot (m-4) = 4m - 24$.
    Để tạo thành tứ diện thì $4m - 24 != 0 <=> m != 6$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ trục tọa độ $O x y z$, cho hai điểm $A(1; -2; 3)$, $B(-2; 2; 2)$. Gọi $I(a, b, c)$ là tâm đường tròn ngoại tiếp tam giác $O A B$. Tính $T = a^2 + b^2 + c^2$.],
  (
    True([$T = 13/2$]),
    [$T = 6$],
    [$T = 2$],
    [$T = 29/4$]
  ),
  loigiai: [
    #step[Tâm đường tròn ngoại tiếp $I(a; b; c)$ nằm trong mặt phẳng $(O A B)$ và cách đều ba đỉnh $O, A, B$:
    $cases(I in (O A B), I O^2 = I A^2, I O^2 = I B^2)$.]
    #step[Vectơ pháp tuyến của mặt phẳng $(O A B)$ là tích có hướng $[arrow(O A), arrow(O B)]$:
    - $arrow(O A) = (1; -2; 3)$ và $arrow(O B) = (-2; 2; 2)$.
    - $[arrow(O A), arrow(O B)] = (-10; -8; -2) = -2(5; 4; 1)$.
    Do $I(a;b;c) in (O A B)$ đi qua $O(0;0;0)$ nên phương trình mặt phẳng là $5a + 4b + c = 0$ (1).]
    #step[Thiết lập các đẳng thức khoảng cách:
    - $I O^2 = I A^2 <=> a^2 + b^2 + c^2 = (a-1)^2 + (b+2)^2 + (c-3)^2 <=> 2a - 4b + 6c = 14$ (2).
    - $I O^2 = I B^2 <=> a^2 + b^2 + c^2 = (a+2)^2 + (b-2)^2 + (c-2)^2 <=> -4a + 4b + 4c = 12 <=> -a + b + c = 3$ (3).]
    #step[Giải hệ phương trình (1), (2), (3):
    Ta tìm được nghiệm duy nhất $a = -1/2$, $b = 0$, $c = 5/2$.
    Do đó $T = a^2 + b^2 + c^2 = (-1/2)^2 + 0^2 + (5/2)^2 = 1/4 + 25/4 = 13/2$. Chọn đáp án A.]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ tọa độ $O x y z$, cho hình thang $A B C D$ có hai đáy $A B, C D$; có tọa độ ba đỉnh $A(1; 2; 1)$, $B(2; 0; -1)$, $C(6; 1; 0)$. Biết hình thang có diện tích bằng $6 sqrt(2)$. Giả sử đỉnh $D(a; b; c)$, tìm mệnh đề đúng?],
  (
    [$a + b + c = 6$.],
    [$a + b + c = 5$.],
    True([$a + b + c = 8$.]),
    [$a + b + c = 7$.]
  ),
  loigiai: [
    #step[Tính độ dài đáy $A B$:
    $arrow(A B) = (1; -2; -2) => A B = sqrt(1^2 + (-2)^2 + (-2)^2) = 3$.]
    #step[Tính chiều cao $h$ của hình thang chính là khoảng cách từ $C$ đến đường thẳng $A B$:
    $arrow(A C) = (5; -1; -1) => [arrow(A B), arrow(A C)] = (0; -9; 9)$.
    $h = d(C, A B) = (|[arrow(A B), arrow(A C)]|) / (A B) = sqrt(0^2 + (-9)^2 + 9^2) / 3 = (9 sqrt(2)) / 3 = 3  sqrt(2)$.]
    #step[Sử dụng công thức diện tích hình thang $S = ((A B + C D) dot h)/2$:
    $6 sqrt(2) = ((3 + C D) dot 3 sqrt(2))/2 <=> 3 + C D = 4 => C D = 1$.]
    #step[Vì hai đáy hình thang là $A B$ và $C D$ nên vectơ $arrow(C D)$ cùng phương với $arrow(A B)$.
    Vì $A B C D$ là hình thang lồi nên hai vectơ đáy $arrow(A B)$ và $arrow(D C)$ cùng hướng, tức là $arrow(C D)$ ngược hướng với $arrow(A B)$.
    Do $C D = 1/3 A B$ nên ta có $arrow(C D) = -1/3 arrow(A B) = (-1/3; 2/3; 2/3)$.
    Toạ độ điểm $D$: $D = C + arrow(C D) = (6 - 1/3; 1 + 2/3; 0 + 2/3) = (17/3; 5/3; 2/3)$.
    Khi đó $a+b+c = 17/3 + 5/3 + 2/3 = 24/3 = 8$. Chọn đáp án C.
    *(Lưu ý: Nếu xét trường hợp tự do không phân biệt lồi lõm ta có $arrow(C D) = 1/3 arrow(A B) => D(19/3; 1/3; -2/3) => a+b+c=6$, tương ứng với đáp án A).*]
    #resetstep()
  ]
)

#tn(
  [Trong không gian với hệ trục $O x y z$, cho hình hộp $A B C D . A' B' C' D'$. Biết rằng $arrow(A B) = (1; 3; 4)$, $arrow(A D) = (-2; 3; 5)$ và $arrow(A C') = (1; 1; 1)$. Tính thể tích hình hộp $A B C D . A' B' C' D'$.],
  (
    [$V_(A B C D . A' B' C' D') = 6$],
    [$V_(A B C D . A' B' C' D') = 12$],
    True([$V_(A B C D . A' B' C' D') = 1$]),
    [$V_(A B C D . A' B' C' D') = 3$]
  ),
  loigiai: [
    #step[Áp dụng quy tắc hình hộp cho đường chéo $arrow(A C')$:
    $arrow(A C') = arrow(A B) + arrow(A D) + arrow(A A')$.]
    #step[Suy ra vectơ cạnh bên $arrow(A A')$:
    $arrow(A A') = arrow(A C') - arrow(A B) - arrow(A D) = (1; 1; 1) - (1; 3; 4) - (-2; 3; 5) = (2; -5; -8)$.]
    #step[Tính tích có hướng của hai cạnh đáy $[arrow(A B), arrow(A D)]$:
    $[arrow(A B), arrow(A D)] = (3 dot 5 - 4 dot 3; 4 dot (-2) - 1 dot 5; 1 dot 3 - 3 dot (-2)) = (3; -13; 9)$.]
    #step[Thể tích của hình hộp bằng trị tuyệt đối tích hỗn tạp:
    $V = |[arrow(A B), arrow(A D)] dot arrow(A A')| = |3 dot 2 + (-13) dot (-5) + 9 dot (-8)| = |6 + 65 - 72| = |-1| = 1$. Chọn đáp án C.]
    #resetstep()
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (6 câu)], count: 6)

#ds(
  dir: "doc",
  [Cho ba vec-tơ $arrow(a) = (-1; 1; 0)$, $arrow(b) = (1; 1; 0)$ và $arrow(c) = (1; 1; 1)$.],
  (
    [ $|arrow(a)| = 2$. ],
    True([ $|arrow(c)| = sqrt(3)$. ]),
    [ $cos (arrow(a), arrow(c)) = 2/sqrt(5)$. ],
    [ $arrow(b) perp arrow(c)$. ]
  ),
  loigiai: [
    #step[a) Độ dài của vectơ $arrow(a)$:
    $|arrow(a)| = sqrt((-1)^2 + 1^2 + 0^2) = sqrt(2) != 2$. (Sai)]
    #step[b) Độ dài của vectơ $arrow(c)$:
    $|arrow(c)| = sqrt(1^2 + 1^2 + 1^2) = sqrt(3)$. (Đúng)]
    #step[c) Cosin góc tạo bởi $arrow(a)$ và $arrow(c)$:
    $arrow(a) dot arrow(c) = (-1) dot 1 + 1 dot 1 + 0 dot 1 = 0 => cos (arrow(a), arrow(c)) = 0$. (Sai)]
    #step[d) Xét điều kiện vuông góc giữa $arrow(b)$ và $arrow(c)$:
    $arrow(b) dot arrow(c) = 1 dot 1 + 1 dot 1 + 0 dot 1 = 2 != 0$ nên hai vectơ không vuông góc. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Cho hai véc-tơ $arrow(u) = (0; 2; 3)$ và $arrow(v) = (m-1; 2m; 3)$ với $m$ là tham số.],
  (
    True([ $|arrow(u)| = sqrt(13)$. ]),
    [ $|arrow(u)| = |arrow(v)| <=> m = -3/5$. ],
    True([ $arrow(u) = arrow(v) <=> m = 1$. ]),
    [ $arrow(u) perp arrow(v) <=> m = 9/4$. ]
  ),
  loigiai: [
    #step[a) Độ dài của vectơ $arrow(u)$:
    $|arrow(u)| = sqrt(0^2 + 2^2 + 3^2) = sqrt(13)$. (Đúng)]
    #step[b) Bình phương độ dài của hai vectơ:
    $|arrow(u)|^2 = 13$ và $|arrow(v)|^2 = (m-1)^2 + (2m)^2 + 3^2 = 5m^2 - 2m + 10$.
    Để $|arrow(u)| = |arrow(v)| <=> 5m^2 - 2m + 10 = 13 <=> 5m^2 - 2m - 3 = 0 <=> m = 1$ hoặc $m = -3/5$.
    Do đó mệnh đề ghi tương đương chỉ có $m = -3/5$ là chưa đầy đủ nên sai. (Sai)]
    #step[c) Hai vectơ bằng nhau khi và chỉ khi các tọa độ tương ứng bằng nhau:
    $arrow(u) = arrow(v) <=> cases(0 = m-1, 2 = 2m, 3 = 3) <=> m = 1$. (Đúng)]
    #step[d) Hai vectơ vuông góc khi tích vô hướng bằng 0:
    $arrow(u) dot arrow(v) = 0 <=> 0 dot (m-1) + 2 dot 2m + 3 dot 3 = 0 <=> 4m + 9 = 0 <=> m = -9/4$.
    Mệnh đề ghi $m = 9/4$ thiếu dấu âm nên sai. (Sai)]
  ]
)

#ds(
  dir: "doc",
  [Cho tam giác $A B C$ có $A(1; 2; 0)$, $B(0; 1; 1)$, $C(2; 1; 0)$.],
  (
    True([ Tam giác $A B C$ vuông tại $A$. ]),
    [ Chu vi tam giác là $sqrt(7) + $sqrt(3) + $sqrt(2)$. ],
    [ Diện tích tam giác $A B C$ là $sqrt(6)$. ],
    True([ Tâm đường tròn ngoại tiếp tam giác $A B C$ là $I(1; 1; 1/2)$. ])
  ),
  loigiai: [
    #step[a) Xét hai vectơ chỉ phương của hai cạnh góc đỉnh $A$:
    - $arrow(A B) = (-1; -1; 1)$.
    - $arrow(A C) = (1; -1; 0)$.
    Tích vô hướng: $arrow(A B) dot arrow(A C) = -1 dot 1 + (-1) dot (-1) + 1 dot 0 = 0$.
    Vì thế $A B perp A C$, tam giác $A B C$ vuông tại $A$. (Đúng)]
    #step[b) Độ dài các cạnh:
    - $A B = sqrt((-1)^2 + (-1)^2 + 1^2) = sqrt(3)$.
    - $A C = sqrt(1^2 + (-1)^2 + 0^2) = sqrt(2)$.
    - $B C = sqrt(A B^2 + A C^2) = sqrt(5)$.
    Chu vi tam giác là $sqrt(3) + sqrt(2) + sqrt(5)$. (Sai)]
    #step[c) Diện tích tam giác vuông:
    $S = 1/2 A B dot A C = 1/2 sqrt(3) dot sqrt(2) = sqrt(6)/2$. (Sai)]
    #step[d) Vì tam giác vuông tại $A$, tâm đường tròn ngoại tiếp $I$ là trung điểm của cạnh huyền $B C$:
    $I = ( (0+2)/2; (1+1)/2; (1+0)/2 ) = (1; 1; 1/2)$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Cho tứ diện $A B C D$ với $A(2; 1; 0)$, $B(1; 1; 3)$, $C(2; -1; 3)$, $D(1; -1; 0)$.],
  (
    True([ Tứ diện $A B C D$ có các cạnh đối đôi một bằng nhau. ]),
    [ Góc giữa 2 đường thẳng $A B$ và $C D$ là $phi = arccos 0,3$. ],
    [ Khoảng cách giữa 2 đường thẳng $A B$ và $C D$ bằng $3$. ],
    True([ Bán kính của mặt cầu ngoại tiếp tứ diện $A B C D$ bằng $sqrt(14)/2$. ])
  ),
  loigiai: [
    #step[a) Tính độ dài bình phương các cạnh của tứ diện:
    - $A B^2 = (-1)^2 + 0^2 + 3^2 = 10$, $C D^2 = (-1)^2 + 0^2 + (-3)^2 = 10 => A B = C D = sqrt(10)$.
    - $A C^2 = 0^2 + (-2)^2 + 3^2 = 13$, $B D^2 = 0^2 + (-2)^2 + (-3)^2 = 13 => A C = B D = sqrt(13)$.
    - $A D^2 = (-1)^2 + (-2)^2 + 0^2 = 5$, $B C^2 = 1^2 + (-2)^2 + 0^2 = 5 => A D = B C = sqrt(5)$.
    Các cạnh đối đôi một bằng nhau nên $A B C D$ là tứ diện gần đều. (Đúng)]
    #step[b) Góc giữa $A B$ và $C D$:
    $arrow(A B) = (-1; 0; 3)$, $arrow(C D) = (-1; 0; -3)$.
    $cos(A B, C D) = (|arrow(A B) dot arrow(C D)|) / (A B dot C D) = (|1 + 0 - 9|) / 10 = 8/10 = 0,8$.
    Vậy $phi = arccos 0,8$. (Sai)]
    #step[c) Tính khoảng cách giữa hai đường thẳng $A B$ và $C D$:
    $[arrow(A B), arrow(C D)] = (0; -6; 0)$ và $arrow(A C) = (0; -2; 3)$.
    $d(A B, C D) = (|[arrow(A B), arrow(C D)] dot arrow(A C)|) / (|[arrow(A B), arrow(C D)]|) = (12) / 6 = 2$. (Sai)]
    #step[d) Công thức bán kính mặt cầu ngoại tiếp tứ diện gần đều:
    $R = sqrt( (A B^2 + A C^2 + A D^2)/8 ) = sqrt( (10 + 13 + 5)/8 ) = sqrt(28/8) = sqrt(14)/2$. (Đúng)]
  ]
)

#ds(
  dir: "doc",
  [Trong hệ trục $O x y z$, cho 3 điểm $A(1; 0; 0), B(0; 0; 1), C(2; 1; 1)$.],
  (
    True([ Diện tích của tam giác $A B C$ bằng $sqrt(6)/2$ (đvdt). ]),
    [ Gọi $D(x; y; z)$ sao cho tứ giác $A B C D$ là một hình bình hành khi đó $x+y+z = 3$. ],
    True([ Độ dài đường cao của tam giác $A B C$ hạ từ $A$ bằng $A H = sqrt(30)/5$ (đơn vị dài). ]),
    [ Thể tích của khối chóp $S.A B C D$ với đỉnh $S(0; 3; 4)$ bằng $2$ (đvtt). ]
  ),
  loigiai: [
    #step[a) Tính tọa độ hai vectơ $arrow(A B) = (-1; 0; 1)$ và $arrow(A C) = (1; 1; 1)$.
    Tích có hướng: $[arrow(A B), arrow(A C)] = (-1; 2; -1)$.
    Diện tích tam giác $A B C$: $S = 1/2 |[arrow(A B), arrow(A C)]| = 1/2 sqrt((-1)^2 + 2^2 + (-1)^2) = sqrt(6)/2$. (Đúng)]
    #step[b) Tứ giác $A B C D$ là hình bình hành khi $arrow(A D) = arrow(B C) <=> D - A = C - B => D = A + C - B = (3; 1; 0)$.
    Khi đó tổng tọa độ: $x+y+z = 3 + 1 + 0 = 4 != 3$. (Sai)]
    #step[c) Chiều dài cạnh $B C$: $B C = sqrt(2^2 + 1^2 + 0^2) = sqrt(5)$.
    Độ dài đường cao hạ từ $A$: $A H = (2 S) / (B C) = sqrt(6) / sqrt(5) = sqrt(30)/5$. (Đúng)]
    #step[d) Phương trình mặt phẳng $(A B C D)$ đi qua $A(1;0;0)$ và nhận $[arrow(A B), arrow(A C)] = (-1; 2; -1)$ làm vectơ pháp tuyến:
    $-(x-1) + 2(y-0) - z = 0 <=> x - 2y + z - 1 = 0$.
    Khoảng cách từ $S(0; 3; 4)$ đến $(A B C D)$:
    $d(S, (A B C D)) = (|0 - 2 dot 3 + 4 - 1|) / sqrt(1^2 + (-2)^2 + 1^2) = 3 / sqrt(6)$.
    Thể tích chóp: $V = 1/3 S_(A B C D) dot d(S, (A B C D)) = 1/3 (2 dot sqrt(6)/2) dot 3 / sqrt(6) = 1$. (Sai)]
  ]
)

#ds(
  dir: "doc",
  fig: canvas(length: 1cm, {
    import draw: *
    
    // We map 3D point (x, y, z) to 2D canvas coordinates (px, py)
    let proj(x, y, z) = (x * 0.6 + y * 0.45, -x * 0.2 + y * 0.15 + z * 0.8)
    
    let O = proj(0, 0, 0)
    let A = proj(4, 0, 0)
    let B = proj(4, 5, 0)
    let C = proj(0, 5, 0)
    
    let E = proj(0, 0, 3)
    let F = proj(4, 0, 3)
    let G = proj(4, 5, 3)
    let H = proj(0, 5, 3)
    
    let P = proj(2, 0, 4)
    let Q = proj(2, 5, 4)
    
    // Axis endpoints
    let Ox_end = proj(5.5, 0, 0)
    let Oy_end = proj(0, 6.5, 0)
    let Oz_end = proj(0, 0, 4.8)
    
    // Draw axes
    line(O, Oz_end, stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    line(O, Ox_end, stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    // Oy axis (dashed inside house, solid outside)
    line(O, C, stroke: (thickness: 0.6pt, dash: "dashed", paint: black))
    line(C, Oy_end, stroke: 0.8pt + black, mark: (end: "stealth", fill: black))
    
    // Base edges
    line(O, A, stroke: 1.2pt)
    line(A, B, stroke: 1.2pt)
    line(B, C, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Vertical columns
    line(A, F, stroke: 1.2pt)
    line(B, G, stroke: 1.2pt)
    line(C, H, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(O, E, stroke: 1.2pt)
    
    // Ceiling edges
    line(E, F, stroke: 1.2pt)
    line(F, G, stroke: 1.2pt)
    line(G, H, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(H, E, stroke: (thickness: 0.8pt, dash: "dashed"))
    
    // Roof edges
    line(E, P, stroke: 1.2pt)
    line(F, P, stroke: 1.2pt)
    line(H, Q, stroke: (thickness: 0.8pt, dash: "dashed"))
    line(G, Q, stroke: 1.2pt)
    line(P, Q, stroke: 1.2pt)
    
    // Points circles
    circle(O, radius: 0.03, fill: black)
    circle(A, radius: 0.03, fill: black)
    circle(B, radius: 0.03, fill: black)
    circle(C, radius: 0.03, fill: black)
    circle(E, radius: 0.03, fill: black)
    circle(F, radius: 0.03, fill: black)
    circle(G, radius: 0.03, fill: black)
    circle(H, radius: 0.03, fill: black)
    circle(P, radius: 0.03, fill: black)
    circle(Q, radius: 0.03, fill: black)
    
    // Text labels
    content((O.at(0) - 0.5, O.at(1) - 0.2), $O(0;0;0)$)
    content((A.at(0) + 0.1, A.at(1) - 0.25), $A$)
    content((B.at(0) + 0.4, B.at(1) - 0.1), $B(4;5;0)$)
    content((C.at(0) - 0.2, C.at(1) - 0.25), $C$)
    content((E.at(0) - 0.5, E.at(1) - 0.1), $E(0;0;3)$)
    content((F.at(0) + 0.15, F.at(1) - 0.15), $F$)
    content((G.at(0) + 0.4, G.at(1) + 0.1), $G(4;5;3)$)
    content((H.at(0) - 0.2, H.at(1) + 0.25), $H$)
    content((P.at(0) - 0.4, P.at(1) + 0.1), $P(2;0;4)$)
    content((Q.at(0), Q.at(1) + 0.25), $Q(2;5;4)$)
    
    // Axis labels
    content((Ox_end.at(0) + 0.1, Ox_end.at(1) - 0.1), $x$)
    content((Oy_end.at(0) + 0.15, Oy_end.at(1) + 0.15), $y$)
    content((Oz_end.at(0) - 0.15, Oz_end.at(1) + 0.15), $z$)
  }),
  fig-pos: "right",
  fig-width: 40%,
  [Hình minh họa sơ đồ một ngôi nhà trong hệ trục tọa độ $O x y z$, trong đó nền nhà, bốn bức tường và hai mái nhà đều là hình chữ nhật. Xét tính đúng/sai của các khẳng định sau:],
  (
    [ Tọa độ của các điểm $A(5; 0; 0)$. ],
    True([ Tọa độ của các điểm $H(0; 5; 3)$. ]),
    True([ Góc nhị diện có cạnh là đường thẳng $F G$, hai mặt lần lượt là $(F G Q P)$ và $(F G H E)$ gọi là góc dốc của mái nhà. Số đo của góc dốc của mái nhà bằng $26,6^degree$ (làm tròn kết quả đến hàng phần mười của độ). ]),
    True([ Chiều cao của ngôi nhà là $4$. ])
  ),
  loigiai: [
    #step[a) Dựa vào tọa độ điểm $B(4; 5; 0)$ thuộc mặt phẳng $(O x y)$ và do nền nhà là hình chữ nhật, suy ra cạnh dọc theo trục $O x$ có chiều dài là $4$. Do đó $A$ thuộc trục $O x$ có tọa độ là $A(4; 0; 0)$ chứ không phải $A(5; 0; 0)$. (Sai)]
    #step[b) Bức tường là hình chữ nhật dựng đứng, chiều cao tường bằng cao độ điểm $E(0; 0; 3)$ là $3$.
    Do $H$ nằm trực tiếp trên $C(0; 5; 0)$ nên tọa độ $H$ là $(0; 5; 3)$. (Đúng)]
    #step[c) Góc dốc của mái nhà là góc giữa mái nhà $(F G Q P)$ và mặt phẳng trần nhà nằm ngang $(E F G H)$.
    Xét thiết diện thẳng đứng phía trước $y = 0$, góc dốc là góc $hat(P F I)$ với $I(2; 0; 3)$ là trung điểm của $E F$.
    Ta có $P I = 4 - 3 = 1$ và $I F = 2$.
    $tan hat(P F I) = (P I) / (I F) = 1/2 = 0,5 => hat(P F I) = arctan(0,5) approx 26,56^degree approx 26,6^degree$. (Đúng)]
    #step[d) Chiều cao của ngôi nhà chính là khoảng cách lớn nhất từ đỉnh mái $P(2; 0; 4)$ hoặc $Q(2; 5; 4)$ đến nền nhà $(O x y)$, tương ứng với cao độ của $P$ và $Q$, bằng $4$. (Đúng)]
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (8 câu)], count: 8)

#tln(
  [Trong không gian $O x y z$, cho $arrow(a) = (3; 1; -2)$ và $arrow(b) = (-2; 0; -3)$. Tính tích vô hướng $arrow(a) dot (2 arrow(a) + arrow(b))$.],
  [28],
  loigiai: [
    #step[Biến đổi biểu thức tích vô hướng cần tính:
    $A = arrow(a) dot (2 arrow(a) + arrow(b)) = 2 |arrow(a)|^2 + arrow(a) dot arrow(b)$.]
    #step[Tính bình phương độ dài của vectơ $arrow(a)$:
    $|arrow(a)|^2 = 3^2 + 1^2 + (-2)^2 = 9 + 1 + 4 = 14$.]
    #step[Tính tích vô hướng của $arrow(a)$ và $arrow(b)$:
    $arrow(a) dot arrow(b) = 3 dot (-2) + 1 dot 0 + (-2) dot (-3) = -6 + 0 + 6 = 0$.]
    #step[Thay các kết quả trên vào biểu thức:
    $A = 2 dot 14 + 0 = 28$.]
    #step[Kết luận: Giá trị tích vô hướng bằng $28$.]
  ]
)

#tln(
  [Trong không gian $O x y z$, cho hai vec tơ $arrow(u) = (1; 1; 0)$ và $arrow(v) = (2; 0; -1)$. Tính độ dài $|arrow(u) + 2 arrow(v)|$. (Làm tròn kết quả đến hàng phần trăm).],
  [5,48],
  loigiai: [
    #step[Tính toạ độ vectơ tổng $arrow(x) = arrow(u) + 2 arrow(v)$:
    $arrow(x) = (1; 1; 0) + 2(2; 0; -1) = (1 + 4; 1 + 0; 0 - 2) = (5; 1; -2)$.]
    #step[Tính độ dài của vectơ $arrow(x)$:
    $|arrow(x)| = sqrt(5^2 + 1^2 + (-2)^2) = sqrt(25 + 1 + 4) = sqrt(30) approx 5,48$.]
    #step[Kết luận: Độ dài cần tìm bằng $sqrt(30) approx 5,48$.]
  ]
)

#tln(
  [Trong không gian với hệ tọa độ $O x y z$, cho hai điểm $C(4; 0; 0)$ và $B(2; 0; 0)$. Tìm tung độ dương của điểm $M$ thuộc trục tung sao cho diện tích tam giác $M B C$ bằng $3$.],
  [3],
  loigiai: [
    #step[Điểm $M$ thuộc trục tung $O y$ và có tung độ dương nên $M(0; y; 0)$ với $y > 0$.]
    #step[Tính độ dài cạnh $B C$:
    $arrow(B C) = (2; 0; 0) => B C = 2$.
    Nhận thấy cả $B$ và $C$ đều thuộc trục $O x$.]
    #step[Độ dài đường cao hạ từ $M$ xuống $B C$ chính là khoảng cách từ $M$ đến trục $O x$:
    $h = d(M, O x) = sqrt(y^2 + z_M^2) = y$ (do $y > 0$).]
    #step[Tính diện tích tam giác và tìm $y$:
    $S = 1/2 B C dot h = 1/2 dot 2 dot y = y$.
    Theo đề bài $S = 3 => y = 3$.]
    #step[Kết luận: Tung độ dương của điểm $M$ là $3$.]
  ]
)

#tln(
  [Trong không gian với hệ trục tọa độ $O x y z$, cho tứ diện $A B C D$ có $A(2; -1; 1)$, $B(3; 0; -1)$, $C(2; -1; 3)$, $D in O y$ và thể tích tứ diện $A B C D$ bằng $5$. Tổng các tung độ của các điểm $D$ thỏa mãn yêu cầu bài toán bằng bao nhiêu?],
  [-6],
  loigiai: [
    #step[Điểm $D$ thuộc trục $O y$ nên có tọa độ dạng $D(0; y_D; 0)$.]
    #step[Tính toạ độ các vectơ:
    - $arrow(A B) = (1; 1; -2)$.
    - $arrow(A C) = (0; 0; 2)$.
    - $arrow(A D) = (-2; y_D + 1; -1)$.]
    #step[Tính tích có hướng $[arrow(A B), arrow(A C)]$:
    $[arrow(A B), arrow(A C)] = (1 dot 2 - (-2) dot 0; (-2) dot 0 - 1 dot 2; 1 dot 0 - 1 dot 0) = (2; -2; 0)$.]
    #step[Tính tích hỗn tạp $[arrow(A B), arrow(A C)] dot arrow(A D)$:
    $[arrow(A B), arrow(A C)] dot arrow(A D) = 2 dot (-2) + (-2) dot (y_D + 1) + 0 dot (-1) = -2y_D - 6$.]
    #step[Sử dụng công thức thể tích tứ diện:
    $V = 1/6 |[arrow(A B), arrow(A C)] dot arrow(A D)| = 1/6 |-2y_D - 6| = 1/3 |y_D + 3|$.
    Theo đề bài: $1/3 |y_D + 3| = 5 <=> |y_D + 3| = 15 <=> cases(y_D + 3 = 15 => y_D = 12, y_D + 3 = -15 => y_D = -18)$.]
    #step[Tính tổng tung độ của các điểm $D$ thoả mãn:
    $12 + (-18) = -6$.]
  ]
)

#tln(
  [Trong không gian $O x y z$, cho các điểm $A(2; 0; 2), B(0; 2; 0), C(1; 0; 3)$. Gọi $M$ là điểm trong không gian thỏa mãn $M A^2 + M C^2 = M B^2$. Tính độ dài đoạn thẳng $M P$ khi $M P$ đạt giá trị nhỏ nhất, với $P(3; -2; 5)$ là một điểm cho trước. (Làm tròn kết quả đến hàng phần trăm).],
  [4,90],
  loigiai: [
    #step[Gọi $M(x; y; z)$ là điểm trong không gian. Thiết lập các phương trình bình phương khoảng cách:
    - $M A^2 = (x-2)^2 + y^2 + (z-2)^2 = x^2 + y^2 + z^2 - 4x - 4z + 8$.
    - $M C^2 = (x-1)^2 + y^2 + (z-3)^2 = x^2 + y^2 + z^2 - 2x - 6z + 10$.
    - $M B^2 = x^2 + (y-2)^2 + z^2 = x^2 + y^2 + z^2 - 4y + 4$.]
    #step[Thay các biểu thức trên vào đẳng thức $M A^2 + M C^2 = M B^2$:
    $(x^2 + y^2 + z^2 - 4x - 4z + 8) + (x^2 + y^2 + z^2 - 2x - 6z + 10) = x^2 + y^2 + z^2 - 4y + 4$
    $<=> x^2 + y^2 + z^2 - 6x + 4y - 10z + 14 = 0$.]
    #step[Đây là phương trình mặt cầu có dạng $(S): x^2 + y^2 + z^2 - 2a x - 2b y - 2c z + d = 0$.
    Tâm của mặt cầu $(S)$ là $I(3; -2; 5)$ và bán kính là:
    $R = sqrt(a^2 + b^2 + c^2 - d) = sqrt(3^2 + (-2)^2 + 5^2 - 14) = sqrt(38 - 14) = sqrt(24) = 2 sqrt(6)$.]
    #step[Nhận thấy điểm $P(3; -2; 5)$ trùng đúng với tâm $I$ của mặt cầu $(S)$.
    Vì điểm $M$ luôn di động trên mặt cầu $(S)$ nên khoảng cách từ $M$ đến tâm $P$ luôn không đổi và bằng bán kính mặt cầu:
    Vậy khoảng cách nhỏ nhất (và cũng là lớn nhất, không đổi) của $M P$ là $sqrt(24) approx 4,90$.]
  ]
)

#tln(
  [Hai chiếc máy bay không người lái cùng bay lên tại một địa điểm. Sau một thời gian bay, chiếc máy bay thứ nhất cách điểm xuất phát về phía Bắc $20$ (km) và về phía Tây $10$ (km), đồng thời cách mặt đất $0,7$ (km). Chiếc máy bay thứ hai cách điểm xuất phát về phía Đông $30$ (km) và về phía Nam $25$ (km), đồng thời cách mặt đất $1$ (km). Xác định khoảng cách giữa hai chiếc máy bay. (Làm tròn kết quả đến hàng phần trăm).],
  [60,21],
  loigiai: [
    #step[Chọn hệ trục tọa độ $O x y z$ với gốc $O(0;0;0)$ là điểm xuất phát.
    - Trục $O x$ hướng về phía Đông (phía Tây tương ứng với phần âm).
    - Trục $O y$ hướng về phía Bắc (phía Nam tương ứng với phần âm).
    - Trục $O z$ hướng thẳng đứng lên trời (cao độ là khoảng cách cách mặt đất).]
    #step[Xác định tọa độ của chiếc máy bay thứ nhất $M_1$:
    - Cách về phía Bắc $20$ (km) và về phía Tây $10$ (km) nên $x_1 = -10, y_1 = 20$.
    - Cách mặt đất $0,7$ (km) nên $z_1 = 0,7$.
    Vậy $M_1(-10; 20; 0,7)$.]
    #step[Xác định tọa độ của chiếc máy bay thứ hai $M_2$:
    - Cách về phía Đông $30$ (km) và về phía Nam $25$ (km) nên $x_2 = 30, y_2 = -25$.
    - Cách mặt đất $1$ (km) nên $z_2 = 1$.
    Vậy $M_2(30; -25; 1)$.]
    #step[Khoảng cách giữa hai chiếc máy bay là độ dài đoạn thẳng $M_1 M_2$:
    $M_1 M_2 = sqrt((x_2 - x_1)^2 + (y_2 - y_1)^2 + (z_2 - z_1)^2)$
    $= sqrt((30 - (-10))^2 + (-25 - 20)^2 + (1 - 0.7)^2)$
    $= sqrt(40^2 + (-45)^2 + 0.3^2)$
    $= sqrt(1600 + 2025 + 0.09) = sqrt(3625.09) approx 60.21$ (km).]
    #step[Kết luận: Khoảng cách giữa hai máy bay là $approx 60.21$ (km).]
  ]
)

#tln(
  [Hai chiếc khinh khí cầu cùng bay lên tại một địa điểm. Sau một thời gian bay, chiếc khinh khí cầu thứ nhất cách điểm xuất phát về phía Đông $100$ (km) và về phía Nam $80$ (km), đồng thời cách mặt đất $1$ (km). Chiếc khinh khí cầu thứ hai cách điểm xuất phát về phía Bắc $70$ (km) và về phía Tây $60$ (km), đồng thời cách mặt đất $0,8$ (km). Xác định khoảng cách giữa chiếc khinh khí cầu thứ nhất và chiếc khinh khí cầu thứ hai. (Làm tròn kết quả đến hàng phần trăm).],
  [219,32],
  loigiai: [
    #step[Chọn hệ trục tọa độ $O x y z$ với gốc $O$ là điểm xuất phát (Đông là chiều dương $O x$, Bắc là chiều dương $O y$, chiều cao là trục $O z$).]
    #step[Xác định tọa độ của chiếc khinh khí cầu thứ nhất $K_1$:
    - Đông $100$ (km), Nam $80$ (km), cao $1$ (km) $=> K_1(100; -80; 1)$.]
    #step[Xác định tọa độ của chiếc khinh khí cầu thứ hai $K_2$:
    - Bắc $70$ (km), Tây $60$ (km), cao $0,8$ (km) $=> K_2(-60; 70; 0,8)$.]
    #step[Khoảng cách giữa hai khinh khí cầu:
    $K_1 K_2 = sqrt((-60 - 100)^2 + (70 - (-80))^2 + (0.8 - 1)^2)$
    $= sqrt((-160)^2 + 150^2 + (-0.2)^2)$
    $= sqrt(25600 + 22500 + 0.04) = sqrt(48100.04) approx 219.32$ (km).]
    #step[Kết luận: Khoảng cách giữa hai khinh khí cầu là $approx 219.32$ (km).]
  ]
)

#tln(
  [Ba chiếc máy bay không người lái cùng bay lên tại một địa điểm. Sau một thời gian bay, chiếc máy bay thứ nhất cách điểm xuất phát về phía Đông $60$ (km) và về phía Nam $40$ (km), đồng thời cách mặt đất $2$ (km). Chiếc máy bay thứ hai cách điểm xuất phát về phía Bắc $80$ (km) và về phía Tây $50$ (km), đồng thời cách mặt đất $4$ (km). Chiếc máy bay thứ ba nằm chính giữa của chiếc máy bay thứ nhất và thứ hai, đồng thời ba chiếc máy bay này thẳng hàng. Xác định khoảng cách của chiếc máy bay thứ ba với vị trí tại điểm xuất phát của nó. (Làm tròn kết quả đến hàng phần trăm).],
  [20,83],
  loigiai: [
    #step[Chọn hệ trục tọa độ $O x y z$ với gốc $O(0;0;0)$ là điểm xuất phát (Đông là chiều dương $O x$, Bắc là chiều dương $O y$, chiều cao là trục $O z$).]
    #step[Xác định tọa độ của chiếc máy bay thứ nhất $M_1$ và thứ hai $M_2$:
    - $M_1(60; -40; 2)$.
    - $M_2(-50; 80; 4)$.]
    #step[Vì chiếc máy bay thứ ba $M_3$ nằm chính giữa hai chiếc thứ nhất và thứ hai nên $M_3$ là trung điểm của đoạn thẳng $M_1 M_2$.
    Tọa độ của $M_3$ là:
    - $x_3 = (60 - 50)/2 = 5$.
    - $y_3 = (-40 + 80)/2 = 20$.
    - $z_3 = (2 + 4)/2 = 3$.
    Vậy $M_3(5; 20; 3)$.]
    #step[Khoảng cách từ chiếc máy bay thứ ba $M_3$ đến vị trí xuất phát $O$:
    $O M_3 = sqrt(x_3^2 + y_3^2 + z_3^2) = sqrt(5^2 + 20^2 + 3^2) = sqrt(25 + 400 + 9) = sqrt(434) approx 20.83$ (km).]
    #step[Kết luận: Khoảng cách cần tìm bằng $approx 20.83$ (km).]
  ]
)
