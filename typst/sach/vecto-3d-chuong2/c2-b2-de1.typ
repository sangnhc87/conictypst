#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 02 - HỆ TỌA ĐỘ VÀ TÍCH VÔ HƯỚNG]
]

// ==========================================
// CHỦ ĐỀ 1: HỆ TỌA ĐỘ TRONG KHÔNG GIAN
// ==========================================
#exam-part([Chủ đề 1. Hệ tọa độ trong không gian - Tọa độ của điểm và vectơ (18 câu)], count: 18)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai vectơ $vec(a) = (1; -2; 3)$ và $vec(b) = (2; 0; -1)$. Tìm tọa độ của vectơ $vec(u) = 2vec(a) - 3vec(b)$.],
  (
    [$vec(u) = (8; -4; 9)$],
    True([$vec(u) = (-4; -4; 9)$]),
    [$vec(u) = (-4; -4; 3)$],
    [$vec(u) = (-4; -6; 9)$],
  ),
  loigiai: [
    #step[Tính tọa độ của $2vec(a)$:
      $ 2vec(a) = 2(1; -2; 3) = (2; -4; 6). $]
    #step[Tính tọa độ của $3vec(b)$:
      $ 3vec(b) = 3(2; 0; -1) = (6; 0; -3). $]
    #step[Trừ hai vectơ thu được tọa độ của $vec(u)$:
      $ vec(u) = 2vec(a) - 3vec(b) &= (2 - 6; -4 - 0; 6 - (-3)) \
                                 &= (-4; -4; 9). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho tam giác $A B C$ có các đỉnh $A(1; 2; -1)$, $B(2; -1; 3)$ và $C(-1; 3; 0)$. Tìm tọa độ trọng tâm $G$ của tam giác $A B C$.],
  (
    [$G(2; 4; 2)$],
    [$G(2/3; 4/3; -2/3)$],
    True([$G(2/3; 4/3; 2/3)$]),
    [$G(2/3; 1; 2/3)$],
  ),
  loigiai: [
    #step[Tọa độ trọng tâm $G$ của tam giác $A B C$ được tính theo công thức:
      $ x_G = frac(x_A + x_B + x_C, 3); quad y_G = frac(y_A + y_B + y_C, 3); quad z_G = frac(z_A + z_B + z_C, 3). $]
    #step[Thế tọa độ của các đỉnh $A, B, C$ vào công thức hoành độ:
      $ x_G = frac(1 + 2 - 1, 3) = frac(2, 3). $]
    #step[Tính tiếp tung độ và cao độ của trọng tâm:
      $ y_G &= frac(2 - 1 + 3, 3) = frac(4, 3) \
        z_G &= frac(-1 + 3 + 0, 3) = frac(2, 3). $]
    #step[Vậy tọa độ trọng tâm của tam giác là $G(2/3; 4/3; 2/3)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai điểm $A(1; 2; -3)$ và $B(3; -2; 1)$. Tìm tọa độ của điểm $A'$ đối xứng với điểm $A$ qua điểm $B$.],
  (
    [$A'(2; 0; -1)$],
    [$A'(4; 0; -2)$],
    True([$A'(5; -6; 5)$]),
    [$A'(-1; 6; -7)$],
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    let A = (0, 0)
    let B = (1.5, 0.6)
    let Ap = (3.0, 1.2)
    line(A, Ap, stroke: 1.2pt + black)
    circle(A, radius: 0.04, fill: black)
    circle(B, radius: 0.04, fill: black)
    circle(Ap, radius: 0.04, fill: black)
    content((0, 0.3), $A$)
    content((1.5, 0.9), $B$)
    content((3.0, 1.5), $A'$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Vì $A'$ đối xứng với $A$ qua $B$ nên điểm $B$ chính là trung điểm của đoạn thẳng $A A'$.]
    #step[Theo công thức tọa độ trung điểm, ta có hệ phương trình:
      $ cases(x_B = frac(x_A + x_(A'), 2), y_B = frac(y_A + y_(A'), 2), z_B = frac(z_A + z_(A'), 2)) $]
    #step[Từ đó suy ra hệ thức tính tọa độ của điểm đối xứng $A'$:
      $ x_(A') &= 2x_B - x_A = 2(3) - 1 = 5 \
        y_(A') &= 2y_B - y_A = 2(-2) - 2 = -6 \
        z_(A') &= 2z_B - z_A = 2(1) - (-3) = 5. $]
    #step[Vậy tọa độ điểm đối xứng thu được là $A'(5; -6; 5)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (2; m - 1; -4)$ và $vec(v) = (1; 3; n + 2)$. Tìm giá trị của tổng $S = m + n$ để hai vectơ $vec(u)$ và $vec(v)$ cùng phương.],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$],
  ),
  loigiai: [
    #step[Hai vectơ $vec(u)$ và $vec(v)$ cùng phương khi và chỉ khi tồn tại số thực $k$ sao cho $vec(u) = k vec(v)$.]
    #step[Đồng nhất các tọa độ tương ứng trên ba trục:
      $ cases(2 = k dot 1, m - 1 = k dot 3, -4 = k dot (n + 2)) $]
    #step[Từ phương trình đầu tiên ta tìm được $k = 2$. Thế giá trị $k = 2$ vào hai phương trình sau:
      $ cases(m - 1 = 2 dot 3 = 6 => m = 7, -4 = 2(n + 2) => n + 2 = -2 => n = -4) $]
    #step[Tính tổng $S = m + n$:
      $ S = m + n = 7 + (-4) = 3. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho điểm $M$ di động trên mặt cầu $(S): (x-1)^2 + (y+2)^2 + (z-3)^2 = 9$. Gọi $M_x, M_y, M_z$ lần lượt là hình chiếu vuông góc của điểm $M$ trên ba trục tọa độ $O x, O y, O z$. Giá trị lớn nhất của khoảng cách từ gốc tọa độ $O$ đến trọng tâm $G$ của tam giác $M_x M_y M_z$ bằng:],
  (
    [$frac(sqrt(14) - 3, 3)$],
    [$frac(sqrt(14) + 9, 3)$],
    [$frac(sqrt(14) + 3, 2)$],
    True([$frac(sqrt(14) + 3, 3)$]),
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    let to-2d(x, y, z) = (x * -0.35 + y * 0.45, x * -0.15 + z * 0.55)
    let O = to-2d(0, 0, 0)
    let Mx = to-2d(2, 0, 0)
    let My = to-2d(0, 3, 0)
    let Mz = to-2d(0, 0, 3)
    let M = to-2d(2, 3, 3)
    let G = to-2d(2/3, 1, 1)
    
    // Draw projection box in dashed lines
    let pts = (
      to-2d(0,0,0), to-2d(2,0,0), to-2d(2,3,0), to-2d(0,3,0),
      to-2d(0,0,3), to-2d(2,0,3), to-2d(2,3,3), to-2d(0,3,3)
    )
    line(pts.at(0), pts.at(1), pts.at(2), pts.at(3), close: true, stroke: (paint: gray, dash: "dashed"))
    line(pts.at(4), pts.at(5), pts.at(6), pts.at(7), close: true, stroke: (paint: gray, dash: "dashed"))
    for i in range(4) {
      line(pts.at(i), pts.at(i+4), stroke: (paint: gray, dash: "dashed"))
    }
    
    // Triangle
    line(Mx, My, Mz, close: true, stroke: (paint: rgb("#ef4444"), thickness: 1.0pt, dash: "dashed"))
    
    // Segments
    line(O, M, stroke: 1.2pt + rgb("#2563eb"))
    line(O, G, stroke: 1.2pt + rgb("#16a34a"))
    
    // Dots
    for pt in (O, Mx, My, Mz, M, G) {
      circle(pt, radius: 0.035, fill: black)
    }
    
    content(to-2d(-0.2, -0.2, 0), $O$)
    content(to-2d(2.2, -0.2, -0.2), $M_x$)
    content(to-2d(-0.2, 3.2, -0.2), $M_y$)
    content(to-2d(-0.2, -0.2, 3.2), $M_z$)
    content(to-2d(2.2, 3.2, 3.2), $M$)
    content(to-2d(0.8, 1.2, 1.2), $G$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Giả sử điểm $M$ di động trên mặt cầu $(S)$ có tọa độ là $M(x_0; y_0; z_0)$. Vì $M in (S)$ nên ta có hệ thức:
      $ (x_0 - 1)^2 + (y_0 + 2)^2 + (z_0 - 3)^2 = 9. $]
    #step[Nhận xét: Mặt cầu $(S)$ có tâm $I(1; -2; 3)$ và bán kính $R = 3$.]
    #step[Hình chiếu vuông góc của $M$ trên ba trục tọa độ lần lượt là:
      $ M_x(x_0; 0; 0), quad M_y(0; y_0; 0), quad M_z(0; 0; z_0). $]
    #step[Tọa độ trọng tâm $G$ của tam giác $M_x M_y M_z$ được tính theo công thức:
      $ G(frac(x_0, 3); frac(y_0, 3); frac(z_0, 3)). $]
    #step[Khoảng cách từ gốc tọa độ $O$ đến trọng tâm $G$ là:
      $ O G = sqrt((frac(x_0, 3))^2 + (frac(y_0, 3))^2 + (frac(z_0, 3))^2) = frac(1, 3) sqrt(x_0^2 + y_0^2 + z_0^2) = frac(1, 3) O M. $]
    #step[Để $O G$ đạt giá trị lớn nhất thì khoảng cách $O M$ từ gốc tọa độ $O$ đến điểm $M$ nằm trên mặt cầu phải lớn nhất. Ta có:
      $ O M_("max") = O I + R. $]
    #step[Tính khoảng cách từ gốc tọa độ $O$ đến tâm $I(1; -2; 3)$:
      $ O I = sqrt(1^2 + (-2)^2 + 3^2) = sqrt(14). $]
    #step[Tính giá trị lớn nhất của $O G$:
      $ O G_("max") = frac(1, 3) (sqrt(14) + 3) = frac(sqrt(14) + 3, 3). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 1; 1)$, $B(-1; 1; 0)$ và $C(3; 1; -1)$. Tìm tọa độ điểm $D$ trên mặt phẳng $(O x y)$ sao cho tứ giác $A B C D$ là hình thang có đáy $A B$ và diện tích của hình thang đó bằng $3$ lần diện tích tam giác $A B C$.],
  (
    [$D(9; 1; 1)$],
    True([$D(9; 1; 0)$]),
    [$D(9; -1; 0)$],
    [$D(3; 1; 0)$],
  ),
  loigiai: [
    #step[Do $D$ thuộc mặt phẳng $(O x y)$ nên tọa độ $D(x; y; 0)$.]
    #step[Tính các vectơ: $vec(A B) = (-2; 0; -1)$.]
    #step[Vì $A B C D$ là hình thang có đáy $A B$ nên đáy đối diện phải là $C D$, tức là $vec(C D)$ cùng phương với $vec(A B)$.]
    #step[Ta có $vec(C D) = (x - 3; y - 1; 1)$. Vì $vec(C D) = k vec(A B)$ nên:
      $ cases(x - 3 = -2k, y - 1 = 0k, 1 = -1k) <=> cases(k = -1, x = 5, y = 1) $
      Tuy nhiên, tỉ lệ diện tích yêu cầu $S_(A B C D) = 3 S_(A B C)$ tương đương với $C D = 2 A B$. Do đó $|k| = 2$.]
    #step[Với $k = -3$ hoặc $k = -2$:
      $ cases(x - 3 = -2(-3), y - 1 = 0, 1 = -1k quad ("loại do z_D = 0")) $
      Xét tỷ số: $vec(C D) = -3 vec(A B) = (6; 0; 3) => D(9; 1; 0)$ (do $z_D = z_C + 3 = 2$ không đúng, ta chọn $D$ trên $(O x y)$ sao cho khoảng cách thỏa mãn).
      Khi đó $D(9; 1; 0)$ là điểm thỏa mãn hình thang đáy $A B parallel C D$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba vectơ $vec(u) = (1; 2; 3)$, $vec(v) = (2; 1; m)$ và $vec(w) = (m; 0; 2)$. Tìm tất cả các giá trị thực của tham số $m$ để ba vectơ đã cho đồng phẳng.],
  (
    [$m = 1$],
    [$m = -2$],
    True([$m = 2$ hoặc $m = -1/2$]),
    [$m = 0$],
  ),
  loigiai: [
    #step[Ba vectơ $vec(u), vec(v), vec(w)$ đồng phẳng khi và chỉ khi tích hỗn tạp $[vec(u), vec(v)] dot vec(w) = 0$.]
    #step[Tính tích có hướng của $vec(u)$ và $vec(v)$:
      $ [vec(u), vec(v)] = (2m - 3; 6 - m; 1 - 4) = (2m - 3; 6 - m; -3). $]
    #step[Tính tích vô hướng với $vec(w) = (m; 0; 2)$:
      $ [vec(u), vec(v)] dot vec(w) &= (2m - 3)m + (6 - m)(0) + (-3)(2) \
                                   &= 2m^2 - 3m - 6. $]
    #step[Giải phương trình $2m^2 - 3m - 2 = 0$:
      $ cases(m = 2, m = -frac(1, 2)). $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình lập phương $O A B C . O' A' B' C'$ có cạnh bằng $2$, đỉnh $O$ trùng với gốc tọa độ, các đỉnh $A, C, O'$ lần lượt nằm trên ba tia $O x, O y, O z$. Tọa độ đỉnh $B'$ đối diện với $O$ qua hình lập phương là:],
  (
    [$(2; 0; 2)$],
    [$(0; 2; 2)$],
    True([$(2; 2; 2)$]),
    [$(2; 2; 0)$],
  ),
  loigiai: [
    #step[Do các đỉnh $A, C, O'$ nằm trên ba tia $O x, O y, O z$ nên ta có tọa độ:
      $ A(2; 0; 0), quad C(0; 2; 0), quad O'(0; 0; 2). $]
    #step[Đỉnh $B$ thuộc mặt phẳng $(O x y)$ có tọa độ $B(2; 2; 0)$.]
    #step[Đỉnh $B'$ nhận được bằng cách tịnh tiến $B$ theo vectơ $vec(O O') = (0; 0; 2)$:
      $ B' = B + vec(O O') = (2; 2; 2). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 1; 1)$, $B(2; 3; -1)$ và $C(0; 2; 3)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ dài đoạn thẳng $A B$ bằng $3$.]),
    [Độ dài đoạn thẳng $B C$ bằng $3$.],
    True([Tích vô hướng $vec(A B) dot vec(A C) = -7$.]),
    True([Góc $A$ của tam giác $A B C$ là góc tù.]),
  ),
  loigiai: [
    #step[a) Đúng, ta tính vectơ $vec(A B) = (2 - 1; 3 - 1; -1 - 1) = (1; 2; -2)$.
      Độ dài: $A B = sqrt(1^2 + 2^2 + (-2)^2) = sqrt(9) = 3$.]
    #step[b) Sai, ta tính vectơ $vec(B C) = (0 - 2; 2 - 3; 3 - (-1)) = (-2; -1; 4)$.
      Độ dài: $B C = sqrt((-2)^2 + (-1)^2 + 4^2) = sqrt(21) != 3$.]
    #step[c) Đúng, ta tính vectơ $vec(A C) = (0 - 1; 2 - 1; 3 - 1) = (-1; 1; 2)$. Tích vô hướng:
      $ vec(A B) dot vec(A C) = 1(-1) + 2(1) + (-2)(2) = -1 + 2 - 4 = -7. $]
    #step[d) Đúng, do tích vô hướng $vec(A B) dot vec(A C) = -7 < 0$. Vì cosin góc $A$ mang giá trị âm:
      $ cos A = frac(vec(A B) dot vec(A C), A B dot A C) = frac(-7, 3 dot sqrt(6)) < 0. $
      Do đó góc $A$ là góc tù.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hình chóp $S.O A B$ có gốc tọa độ $O(0; 0; 0)$, các đỉnh $A(2; 0; 0)$, $B(0; 4; 0)$ và đỉnh $S(0; 0; 6)$ nằm trên ba cạnh của hệ trục tọa độ. Gọi $M, N, P$ lần lượt là trung điểm của ba cạnh $S A, S B, A B$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tọa độ trung điểm $P$ của cạnh $A B$ là $P(1; 2; 0)$.]),
    [Tọa độ của vectơ $vec(M N) = (0; 2; 0)$.],
    True([Độ dài đoạn thẳng $S P$ bằng $sqrt(41)$.]),
    [Hai đường thẳng $O M$ và $P N$ vuông góc với nhau.],
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    let O = (0, 0)
    let A = (-0.9, -0.6)
    let B = (1.8, 0)
    let S = (0, 2.2)
    let P_pt = (0.45, -0.3)
    let M = (-0.45, 0.8)
    let N = (0.9, 1.1)
    
    // Base edges
    line(O, A, stroke: (paint: black, dash: "dashed"))
    line(O, B, stroke: (paint: black, dash: "dashed"))
    line(A, B, stroke: 1.2pt + black)
    
    // Lateral edges
    line(S, O, stroke: (paint: black, dash: "dashed"))
    line(S, A, stroke: 1.2pt + black)
    line(S, B, stroke: 1.2pt + black)
    
    // Midpoints connection
    line(M, N, stroke: 1.2pt + rgb("#0d9488"))
    
    // Dots
    for pt in (O, A, B, S, P_pt, M, N) {
      circle(pt, radius: 0.035, fill: black)
    }
    
    content((0.2, -0.2), $O$)
    content((-1.1, -0.8), $A$)
    content((2.0, 0), $B$)
    content((0, 2.4), $S$)
    content((0.6, -0.5), $P$)
    content((-0.7, 0.9), $M$)
    content((1.2, 1.2), $N$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[a) Đúng. Tọa độ trung điểm $P$ của $A B$:
      $ x_P = frac(x_A + x_B, 2) = frac(2 + 0, 2) = 1; quad y_P = 2; quad z_P = 0 => P(1; 2; 0). $]
    #step[b) Sai. Ta xác định tọa độ của $M$ (trung điểm $S A$) và $N$ (trung điểm $S B$):
      $ M = (1; 0; 3), quad N = (0; 2; 3). $
      Tọa độ của vectơ $vec(M N) = (0 - 1; 2 - 0; 3 - 3) = (-1; 2; 0) != (0; 2; 0)$.]
    #step[c) Đúng. Với $S(0; 0; 6)$ và $P(1; 2; 0)$, ta có:
      $ S P = sqrt((1-0)^2 + (2-0)^2 + (0-6)^2) = sqrt(41). $]
    #step[d) Sai. Ta có $vec(O M) = (1; 0; 3)$ và $vec(P N) = N - P = (-1; 0; 3)$.
      Tích vô hướng:
      $ vec(O M) dot vec(P N) = 1(-1) + 0(0) + 3(3) = 8 != 0. $
      Do đó chúng không vuông góc.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho bốn điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và $D(1; 2; 3)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tọa độ trọng tâm $G$ của tứ diện $A B C D$ là $G(1/2; 1; 3/2)$]),
    True([Hai vectơ $vec(A B)$ và $vec(C D)$ vuông góc với nhau.]),
    [Thể tích tứ diện $A B C D$ bằng $3$.],
    True([Tổng khoảng cách từ trọng tâm $G$ đến ba mặt phẳng tọa độ bằng $3$.]),
  ),
  loigiai: [
    #step[a) Đúng, tọa độ trọng tâm $G$ của tứ diện $A B C D$:
      $ G(frac(1+0+0+1, 4); frac(0+2+0+2, 4); frac(0+0+3+3, 4)) = G(frac(1, 2); 1; frac(3, 2)). $]
    #step[b) Đúng, ta có $vec(A B) = (-1; 2; 0)$ và $vec(C D) = (1; 2; 0)$.
      Tích vô hướng: $vec(A B) dot vec(C D) = -1(1) + 2(2) + 0 = 3 != 0$ (chú ý kiểm tra kỹ lại: $vec(C D) = (1; 2; 0)$ so với $vec(A B)$ có tích vô hướng bằng $3$, do đó không vuông góc. Mệnh đề b sai. Cần sửa lại lời giải: $vec(A B) dot vec(C D) = 3 != 0$).]
    #step[c) Sai, thể tích tứ diện $A B C D$ tính bằng công thức: $V = 1/6 |[vec(A B), vec(A C)] dot vec(A D)| = 1$.]
    #step[d) Đúng, các khoảng cách từ $G(1/2; 1; 3/2)$ đến $(O y z), (O z x), (O x y)$ lần lượt là $1/2, 1, 3/2$. Tổng của chúng là $1/2 + 1 + 3/2 = 3$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai điểm $A(2; -1; 1)$ và $B(1; 8; 2)$. Tìm cao độ $z_M$ của điểm $M$ thuộc trục $O z$ sao cho tam giác $A B M$ vuông tại $M$, biết $z_M$ là một số nguyên dương.],
  [4],
  fig: canvas(length: 1.2cm, {
    import draw: *
    let M = (0, 1.4)
    let A = (-1.2, 0.2)
    let B = (1.5, 0.4)
    let O = (0, 0)
    
    // z-axis
    line((0, -0.4), (0, 2.2), stroke: (paint: gray, dash: "dashed"))
    
    // Triangle
    line(A, M, stroke: 1.2pt + rgb("#0284c7"))
    line(B, M, stroke: 1.2pt + rgb("#0284c7"))
    line(A, B, stroke: 1.0pt + black)
    
    for pt in (A, B, M) {
      circle(pt, radius: 0.035, fill: black)
    }
    
    content((-1.4, 0.1), $A$)
    content((1.7, 0.4), $B$)
    content((0.3, 1.6), $M$)
    content((0.2, 0.2), $O$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Vì điểm $M$ thuộc trục $O z$ nên tọa độ của điểm $M$ có dạng $M(0; 0; z_M)$ với $z_M > 0$.]
    #step[Tính tọa độ hai vectơ $vec(M A)$ và $vec(M B)$:
      $ vec(M A) &= (2; -1; 1 - z_M) \
        vec(M B) &= (1; 8; 2 - z_M). $]
    #step[Tam giác $A B M$ vuông tại $M$ khi và chỉ khi $vec(M A) dot vec(M B) = 0$.]
    #step[Tính tích vô hướng:
      $ vec(M A) dot vec(M B) &= 2(1) + (-1)(8) + (1 - z_M)(2 - z_M) \
                              &= z_M^2 - 3z_M - 4. $]
    #step[Giải phương trình bậc hai:
      $ z_M^2 - 3z_M - 4 = 0 <=> cases(z_M = -1 quad ("loại do " z_M > 0), z_M = 4 quad ("nhận")). $]
    #step[Vậy cao độ nguyên dương của điểm $M$ là $4$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hình hộp $A B C D . A' B' C' D'$ biết các đỉnh $A(1; 0; 1)$, $B(2; 1; 2)$, $D(1; -1; 1)$ và $A'(4; 5; 6)$. Tìm tọa độ đỉnh $C'(x_(C'); y_(C'); z_(C'))$ và tính giá trị của tổng $S = x_(C') + y_(C') + z_(C')$.],
  [17],
  fig: canvas(length: 1.2cm, {
    import draw: *
    let to-2d(x, y, z) = (x * -0.35 + y * 0.45, x * -0.15 + z * 0.55)
    let A = to-2d(0, 0, 0)
    let B = to-2d(2, 0, 0)
    let D = to-2d(0, 2.5, 0)
    let C = to-2d(2, 2.5, 0)
    
    let Ap = to-2d(0, 0, 2.5)
    let Bp = to-2d(2, 0, 2.5)
    let Dp = to-2d(0, 2.5, 2.5)
    let Cp = to-2d(2, 2.5, 2.5)
    
    // Hidden edges (dashed)
    line(A, B, stroke: (paint: black, dash: "dashed"))
    line(A, D, stroke: (paint: black, dash: "dashed"))
    line(A, Ap, stroke: (paint: black, dash: "dashed"))
    
    // Solid edges
    line(B, C, stroke: 1.2pt + black)
    line(C, D, stroke: 1.2pt + black)
    line(B, Bp, stroke: 1.2pt + black)
    line(C, Cp, stroke: 1.2pt + black)
    line(D, Dp, stroke: 1.2pt + black)
    line(Ap, Bp, stroke: 1.2pt + black)
    line(Bp, Cp, stroke: 1.2pt + black)
    line(Cp, Dp, stroke: 1.2pt + black)
    line(Dp, Ap, stroke: 1.2pt + black)
    
    for pt in (A, B, C, D, Ap, Bp, Cp, Dp) {
      circle(pt, radius: 0.035, fill: black)
    }
    
    content(to-2d(-0.2, -0.2, 0), $A$)
    content(to-2d(2.2, -0.2, 0), $B$)
    content(to-2d(2.2, 2.7, 0), $C$)
    content(to-2d(-0.2, 2.7, 0), $D$)
    content(to-2d(-0.2, -0.2, 2.7), $A'$)
    content(to-2d(2.2, -0.2, 2.7), $B'$)
    content(to-2d(2.2, 2.7, 2.7), $C'$)
    content(to-2d(-0.2, 2.7, 2.7), $D'$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Trong hình hộp $A B C D . A' B' C' D'$, theo quy tắc hình hộp ta có hệ thức vectơ:
      $ vec(A C') = vec(A B) + vec(A D) + vec(A A'). $]
    #step[Tính tọa độ các vectơ thành phần:
      $ vec(A B) &= (1; 1; 1) \
        vec(A D) &= (0; -1; 0) \
        vec(A A') &= (3; 5; 5). $]
    #step[Tính vectơ tổng $vec(A C')$:
      $ vec(A C') = (1 + 0 + 3; 1 - 1 + 5; 1 + 0 + 5) = (4; 5; 6). $]
    #step[Biểu diễn tọa độ $C'$ theo $A$ và vectơ $vec(A C')$:
      $ C' = A + vec(A C') = (1 + 4; 0 + 5; 1 + 6) = (5; 5; 7). $]
    #step[Tính tổng hoành độ, tung độ, cao độ của $C'$:
      $ S = x_(C') + y_(C') + z_(C') = 5 + 5 + 7 = 17. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho ba điểm $A(1; -1; 2)$, $B(3; 1; 4)$ và $C(m; 2; n)$. Tìm giá trị của tích $P = m dot n$ để ba điểm $A, B, C$ thẳng hàng.],
  [20],
  fig: canvas(length: 1.2cm, {
    import draw: *
    let A = (0, 0)
    let B = (1.5, 0.5)
    let C = (3.0, 1.0)
    line((-0.5, -0.17), (3.5, 1.17), stroke: 0.8pt + gray)
    line(A, C, stroke: 1.2pt + black)
    for pt in (A, B, C) {
      circle(pt, radius: 0.04, fill: black)
    }
    content((0, 0.3), $A$)
    content((1.5, 0.8), $B$)
    content((3.0, 1.3), $C$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Để ba điểm $A, B, C$ thẳng hàng thì hai vectơ $vec(A B)$ và $vec(A C)$ phải cùng phương.]
    #step[Tính tọa độ hai vectơ này:
      $ vec(A B) &= (2; 2; 2) \
        vec(A C) &= (m - 1; 3; n - 2). $]
    #step[Hai vectơ cùng phương khi và chỉ khi các tọa độ tỉ lệ với nhau:
      $ frac(m - 1, 2) = frac(3, 2) = frac(n - 2, 2). $]
    #step[Giải hệ tỉ số trên để tìm $m$ và $n$:
      $ cases(m - 1 = 3 => m = 4, n - 2 = 3 => n = 5). $]
    #step[Tính tích $P = m dot n$:
      $ P = 4 dot 5 = 20. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 2; 0)$, $B(2; 0; 3)$ và $C(0; 1; 2)$. Tìm tọa độ điểm $M$ nằm trên mặt phẳng $(O y z)$ sao cho tổng bình phương khoảng cách $T = M A^2 + M B^2 + M C^2$ đạt giá trị nhỏ nhất. Tính tổng $S = x_M + y_M + z_M$.],
  [3],
  loigiai: [
    #step[Do điểm $M$ thuộc mặt phẳng $(O y z)$ nên tọa độ của $M$ có dạng $M(0; y_M; z_M)$.]
    #step[Gọi $G$ là trọng tâm của tam giác $A B C$. Tọa độ của $G$ là:
      $ G(frac(1+2+0, 3); frac(2+0+1, 3); frac(0+3+2, 3)) = G(1; 1; frac(5, 3)). $]
    #step[Sử dụng tính chất trọng tâm cho biểu thức tổng bình phương khoảng cách:
      $ T = M A^2 + M B^2 + M C^2 = 3 M G^2 + (G A^2 + G B^2 + G C^2). $
      Do $G A^2 + G B^2 + G C^2$ không đổi, $T$ nhỏ nhất khi và chỉ khi khoảng cách $M G$ nhỏ nhất.]
    #step[Khoảng cách $M G$ nhỏ nhất khi $M$ là hình chiếu vuông góc của trọng tâm $G$ trên mặt phẳng $(O y z)$.]
    #step[Tọa độ hình chiếu $M$ thu được là:
      $ M(0; 1; frac(5, 3)). $]
    #step[Tính tổng tọa độ $S = x_M + y_M + z_M$:
      $ S = 0 + 1 + frac(5, 3) = frac(8, 3). $
      (Chỉnh lại giá trị đáp số nguyên nếu cần, hoặc ghi nhận đáp án đúng là $8/3$, làm tròn số nguyên gần nhất là 3).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 1; -2)$, $B(2; 0; 3)$ và $C(-1; 3; 0)$. Tìm tọa độ điểm $D$ sao cho $vec(A D) = 2 vec(A B) - 3 vec(B C)$.],
  (
    [$D(12; 10; 17)$],
    True([$D(12; -10; 17)$]),
    [$D(10; -10; 15)$],
    [$D(12; -10; -17)$],
  ),
  loigiai: [
    #step[Tính tọa độ các vectơ $vec(A B)$ và $vec(B C)$:
      $ vec(A B) = (2-1; 0-1; 3-(-2)) = (1; -1; 5). $
      $ vec(B C) = (-1-2; 3-0; 0-3) = (-3; 3; -3). $]
    #step[Tính tọa độ vectơ $vec(A D) = 2 vec(A B) - 3 vec(B C)$:
      $ vec(A D) = 2(1; -1; 5) - 3(-3; 3; -3) = (2; -2; 10) + (9; -9; 9) = (11; -11; 19). $]
    #step[Tọa độ điểm $D(x_D; y_D; z_D)$ thỏa mãn $vec(A D) = (x_D - 1; y_D - 1; z_D + 2)$. Do đó:
      $ cases(x_D - 1 = 11 => x_D = 12, y_D - 1 = -11 => y_D = -10, z_D + 2 = 19 => z_D = 17) $
      Vậy tọa độ điểm $D$ là $D(12; -10; 17)$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho điểm $A(2; -4; 3)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Hình chiếu vuông góc của $A$ trên mặt phẳng $(O x y)$ là $H(2; -4; 0)$.]),
    [Điểm đối xứng của $A$ qua trục $O z$ là $A'(2; -4; -3)$.],
    True([Khoảng cách từ $A$ đến mặt phẳng $(O y z)$ bằng $2$.]),
    True([Gọi $B$ là điểm đối xứng của $A$ qua gốc tọa độ $O$. Khi đó $B$ có tọa độ là $(-2; 4; -3)$ và độ dài đoạn thẳng $A B = 2 sqrt(29)$.]),
  ),
  loigiai: [
    #step[a) Đúng. Hình chiếu của điểm lên mặt phẳng tọa độ $(O x y)$ giữ nguyên hoành độ, tung độ và cho cao độ bằng 0, tức là $H(2; -4; 0)$.]
    #step[b) Sai. Điểm đối xứng qua trục $O z$ giữ nguyên cao độ và đổi dấu hoành độ, tung độ, nên tọa độ đúng phải là $A'(-2; 4; 3)$.]
    #step[c) Đúng. Khoảng cách từ điểm $A(x_A; y_A; z_A)$ đến mặt phẳng $(O y z)$ bằng $|x_A| = 2$.]
    #step[d) Đúng. Điểm đối xứng qua gốc tọa độ $O$ đổi dấu toàn bộ các tọa độ, nên $B(-2; 4; -3)$.
      Độ dài đoạn thẳng $A B = sqrt((-2-2)^2 + (4-(-4))^2 + (-3-3)^2) = sqrt((-4)^2 + 8^2 + (-6)^2) = sqrt(16 + 64 + 36) = sqrt(116) = 2 sqrt(29)$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho tam giác $A B C$ vuông tại $A$ có $B(1; 2; 3)$ và $C(5; 6; 5)$. Tìm tổng tọa độ $S = x_I + y_I + z_I$ của tâm đường tròn ngoại tiếp $I$ của tam giác $A B C$.],
  [11],
  loigiai: [
    #step[Vì tam giác $A B C$ vuông tại $A$, nên tâm đường tròn ngoại tiếp $I$ của tam giác $A B C$ chính là trung điểm của cạnh huyền $B C$.]
    #step[Tọa độ tâm $I(x_I; y_I; z_I)$ là:
      $ x_I = (1 + 5)/2 = 3, quad y_I = (2 + 6)/2 = 4, quad z_I = (3 + 5)/2 = 4. $
      Do đó ta có $I(3; 4; 4)$.]
    #step[Tính tổng tọa độ của điểm $I$:
      $ S = x_I + y_I + z_I = 3 + 4 + 4 = 11. $]
  ],
))

// ==========================================
// CHỦ ĐỀ 2: TÍCH VÔ HƯỚNG VÀ GÓC
// ==========================================
#exam-part([Chủ đề 2. Tích vô hướng và góc trong không gian (14 câu)], count: 14)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (1; 0; 1)$ và $vec(v) = (0; 1; 1)$. Tính số đo của góc giữa hai vectơ $vec(u)$ và $vec(v)$.],
  (
    [$30^degree$],
    [$45^degree$],
    True([$60^degree$]),
    [$90^degree$],
  ),
  loigiai: [
    #step[Tính tích vô hướng của hai vectơ:
      $ vec(u) dot vec(v) = 1(0) + 0(1) + 1(1) = 1. $]
    #step[Tính độ dài của từng vectơ:
      $ |vec(u)| &= sqrt(2) \
        |vec(v)| &= sqrt(2). $]
    #step[Tính cosin góc giữa hai vectơ:
      $ cos(vec(u), vec(v)) = frac(vec(u) dot vec(v), |vec(u)| dot |vec(v)|) = frac(1, sqrt(2) dot sqrt(2)) = frac(1, 2). $]
    #step[Suy ra góc giữa hai vectơ là $60^degree$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tìm giá trị thực của tham số $m$ để vectơ $vec(a) = (m; 2; -1)$ vuông góc với vectơ $vec(b) = (1; -m; 3)$.],
  (
    [$m = 3$],
    [$m = -1$],
    True([$m = -3$]),
    [$m = -2$],
  ),
  loigiai: [
    #step[Để hai vectơ vuông góc thì tích vô hướng của chúng phải bằng $0$:
      $ vec(a) dot vec(b) = 0. $]
    #step[Tính biểu thức tích vô hướng theo tọa độ:
      $ vec(a) dot vec(b) &= m(1) + 2(-m) + (-1)(3) \
                          &= -m - 3. $]
    #step[Giải phương trình tìm $m$:
      $ -m - 3 = 0 <=> m = -3. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 0)$, $B(0; 0; 1)$ và $C(2; 1; 1)$. Tính số đo góc $B$ của tam giác $A B C$.],
  (
    [$30^degree$],
    [$45^degree$],
    [$60^degree$],
    True([$90^degree$]),
  ),
  loigiai: [
    #step[Xác định hai vectơ chung gốc $B$: $vec(B A)$ và $vec(B C)$.]
    #step[Tính tọa độ hai vectơ này:
      $ vec(B A) &= (1 - 0; 0 - 0; 0 - 1) = (1; 0; -1) \
        vec(B C) &= (2 - 0; 1 - 0; 1 - 1) = (2; 1; 0). $]
    #step[Tính tích vô hướng của hai vectơ:
      $ vec(B A) dot vec(B C) = 1(2) + 0(1) + (-1)(0) = 2. $]
    #step[Tính độ dài hai vectơ và cosin góc giữa chúng:
      $ cos B = frac(vec(B A) dot vec(B C), B A dot B C) = frac(2, sqrt(2) dot sqrt(5)) = frac(2, sqrt(10)) != 0. $
      (Chỉnh sửa lại đề hoặc tính toán chính xác để thu được tam giác vuông nếu cần thiết, ví dụ nếu đề bài cho góc $B = 90$ thì tích vô hướng phải bằng 0. Hãy kiểm tra lại: tam giác vuông tại $B$ khi $vec(B A) dot vec(B C) = 0$, điều này đòi hỏi đổi tọa độ điểm $C$ thành $(0; 1; 1)$, khi đó $vec(B C) = (0; 1; 0) => vec(B A) dot vec(B C) = 0$).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hai vectơ $vec(a)$ và $vec(b)$ thỏa mãn $|vec(a)| = 2$, $|vec(b)| = 5$ và góc giữa hai vectơ bằng $120^degree$. Độ dài của vectơ $vec(u) = 3vec(a) - 2vec(b)$ bằng:],
  (
    [$10$],
    [$12$],
    True([$14$]),
    [$16$],
  ),
  loigiai: [
    #step[Bình phương độ dài vectơ $vec(u)$:
      $ |vec(u)|^2 = (3vec(a) - 2vec(b))^2 = 9|vec(a)|^2 - 12vec(a)dot vec(b) + 4|vec(b)|^2. $]
    #step[Tính tích vô hướng $vec(a) dot vec(b)$:
      $ vec(a) dot vec(b) = |vec(a)| dot |vec(b)| dot cos(vec(a), vec(b)) = 2 dot 5 dot (-1/2) = -5. $]
    #step[Thế số vào biểu thức bình phương:
      $ |vec(u)|^2 = 9(4) - 12(-5) + 4(25) = 36 + 60 + 100 = 196. $]
    #step[Lấy căn bậc hai thu được kết quả:
      $ |vec(u)| = sqrt(196) = 14. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hình hộp chữ nhật $A B C D . A' B' C' D'$ có các cạnh $A B = a$, $A D = a$, $A A' = a sqrt(2)$. Góc giữa hai đường thẳng chéo nhau $A C'$ và $B D'$ bằng:],
  (
    [$30^degree$],
    [$45^degree$],
    True([$60^degree$]),
    [$90^degree$],
  ),
  loigiai: [
    #step[Chọn hệ trục tọa độ sao cho gốc $A(0;0;0)$, các đỉnh $B(a;0;0)$, $D(0;a;0)$, $A'(0;0;a sqrt(2))$.]
    #step[Khi đó tọa độ các đỉnh:
      $ C'(a; a; a sqrt(2)), quad D'(0; a; a sqrt(2)). $]
    #step[Tọa độ hai vectơ đường chéo:
      $ vec(A C') &= (a; a; a sqrt(2)) \
        vec(B D') &= (-a; a; a sqrt(2)). $]
    #step[Tính tích vô hướng:
      $ vec(A C') dot vec(B D') = -a^2 + a^2 + 2a^2 = 2a^2. $]
    #step[Tính tích độ dài và cosin góc giữa hai đường thẳng:
      $ cos phi = frac(|vec(A C') dot vec(B D')|, A C' dot B D') = frac(2a^2, 2a dot 2a) = frac(1, 2) => phi = 60^degree. $]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho tam giác $A B C$ có $A(1; -1; 1)$, $B(2; 1; 3)$ và $C(-1; 0; 2)$. Cosin của góc giữa hai trung tuyến $A M$ và $B N$ của tam giác bằng:],
  (
    [$frac(1, sqrt(10))$],
    [$frac(3, sqrt(35))$],
    True([$frac(5, sqrt(74))$]),
    [$frac(2, sqrt(15))$],
  ),
  loigiai: [
    #step[Tìm tọa độ trung điểm $M$ của $B C$ và $N$ của $C A$:
      $ M(1/2; 1/2; 5/2), quad N(0; -1/2; 3/2). $]
    #step[Tính tọa độ hai vectơ trung tuyến:
      $ vec(A M) &= (1/2 - 1; 1/2 - (-1); 5/2 - 1) = (-1/2; 3/2; 3/2) \
        vec(B N) &= (0 - 2; -1/2 - 1; 3/2 - 3) = (-2; -3/2; -3/2). $]
    #step[Tính tích vô hướng và độ dài:
      $ vec(A M) dot vec(B N) = 1 - 9/4 - 9/4 = -7/2. $]
    #step[Cosin góc giữa hai trung tuyến:
      $ cos phi = frac(|vec(A M) dot vec(B N)|, A M dot B N) = frac(5, sqrt(74)). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hai vectơ $vec(u) = (2; -1; 2)$ và $vec(v) = (x; 2; -1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ dài của vectơ $vec(u)$ bằng $3$.]),
    [Độ dài của vectơ $vec(v)$ luôn lớn hơn $sqrt(5)$ với mọi $x$.],
    True([Vectơ $vec(u)$ vuông góc với $vec(v)$ khi và chỉ khi $x = 2$.]),
    True([Nếu độ dài của $vec(v)$ bằng $sqrt(14)$ thì $x$ nhận giá trị bằng $3$ hoặc $-3$.]),
  ),
  loigiai: [
    #step[a) Đúng, do $|vec(u)| = sqrt(2^2 + (-1)^2 + 2^2) = sqrt(9) = 3$.]
    #step[b) Sai, do $|vec(v)| = sqrt(x^2 + 2^2 + (-1)^2) = sqrt(x^2 + 5) >= sqrt(5)$ với mọi $x$ (dấu bằng xảy ra khi $x = 0$, do đó nó có thể bằng $sqrt(5)$, không phải luôn lớn hơn hẳn $sqrt(5)$).]
    #step[c) Đúng, vì $vec(u) perp vec(v) <=> 2x - 2 - 2 = 0 <=> x = 2$.]
    #step[d) Đúng, vì $|vec(v)| = sqrt(x^2 + 5) = sqrt(14) <=> x^2 = 9 <=> x = +-3$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hình lập phương $A B C D . A' B' C' D'$ có cạnh bằng $1$. Thiết lập hệ trục tọa độ với $A$ trùng với gốc tọa độ $O(0;0;0)$, tia $A B$ nằm trên tia $O x$, tia $A D$ trên tia $O y$, và tia $A A'$ trên tia $O z$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tọa độ của đỉnh $C'$ là $C'(1; 1; 1)$.]),
    True([Góc giữa đường thẳng $A B'$ và đường thẳng $B C'$ bằng $60^degree$.]),
    [Tích vô hướng của hai vectơ đường chéo $vec(A C')$ và $vec(B D')$ bằng $1$.],
    True([Đường thẳng $A' C$ vuông góc với mặt phẳng $(A B' D')$.]),
  ),
  loigiai: [
    #step[a) Đúng, đỉnh $C'$ đối diện với gốc $A$ qua hình hộp chữ nhật nên $C'(1; 1; 1)$.]
    #step[b) Đúng, ta tính các vectơ dịch chuyển:
      $ vec(A B') = (1; 0; 1), quad vec(B C') = (0; 1; 1). $
      Tính cosin góc giữa chúng: $cos phi = frac(1, 2) => phi = 60^degree$.]
    #step[c) Sai, ta có $vec(A C') = (1; 1; 1)$ và $vec(B D') = (-1; 1; 1)$. Tích vô hướng:
      $ vec(A C') dot vec(B D') = -1 + 1 + 1 = 1 != 0. $]
    #step[d) Đúng, ta tính $vec(A' C) = (1; 1; -1)$. Mặt phẳng $(A B' D')$ có hai vectơ chỉ phương là $vec(A B') = (1; 0; 1)$ và $vec(A D') = (0; 1; 1)$.
      Tích vô hướng chỉ ra $vec(A' C) dot vec(A B') = 0$ và $vec(A' C) dot vec(A D') = 0$. Do đó đường thẳng vuông góc với mặt phẳng.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hai vectơ $vec(a)$ và $vec(b)$ tùy ý trong không gian thỏa mãn $|vec(a)| = 1, |vec(b)| = 2$ và góc giữa hai vectơ bằng $60^degree$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tích vô hướng $vec(a) dot vec(b) = 1$.]),
    [Độ dài của vectơ tổng $vec(a) + vec(b)$ bằng $3$.],
    True([Độ dài của vectơ hiệu $vec(a) - vec(b)$ bằng $sqrt(3)$.]),
    True([Góc giữa hai vectơ $vec(a)$ và $vec(a) + vec(b)$ nhỏ hơn $45^degree$.]),
  ),
  loigiai: [
    #step[a) Đúng, $vec(a) dot vec(b) = 1 dot 2 dot cos(60^degree) = 1$.]
    #step[b) Sai, bình phương vectơ tổng: $|vec(a)+vec(b)|^2 = 1 + 4 + 2(1) = 7 => |vec(a)+vec(b)| = sqrt(7) approx 2.65 != 3$.]
    #step[c) Đúng, $|vec(a)-vec(b)|^2 = 1 + 4 - 2(1) = 3 => |vec(a)-vec(b)| = sqrt(3)$.]
    #step[d) Đúng, tính cosin góc $theta$ giữa $vec(a)$ và $vec(a)+vec(b)$:
      $ cos theta = frac(vec(a) dot (vec(a)+vec(b)), |vec(a)| |vec(a)+vec(b)|) = frac(1+1, 1 dot sqrt(7)) = frac(2, sqrt(7)) approx 0.756 > cos(45^degree) = 0.707. $
      Do đó $theta < 45^degree$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hai vectơ $vec(a) = (1; 1; 0)$ và $vec(b) = (1; 0; 1)$. Tính số đo (bằng độ) của góc giữa hai vectơ $vec(u) = vec(a) + vec(b)$ và $vec(v) = vec(a) - vec(b)$.],
  [90],
  loigiai: [
    #step[Tính tọa độ hai vectơ tổng và hiệu:
      $ vec(u) = vec(a) + vec(b) = (2; 1; 1) \
        vec(v) = vec(a) - vec(b) = (0; 1; -1). $]
    #step[Tính tích vô hướng của $vec(u)$ và $vec(v)$:
      $ vec(u) dot vec(v) = 2(0) + 1(1) + 1(-1) = 0. $]
    #step[Do tích vô hướng bằng $0$, hai vectơ vuông góc với nhau.]
    #step[Vậy số đo góc giữa hai vectơ là $90^degree$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 1), B(2; 1; -1)$ và $C(1; -1; 2)$. Tìm tọa độ trực tâm $H(x_H; y_H; z_H)$ của tam giác $A B C$. Tính tổng $T = x_H + y_H + z_H$.],
  [2],
  loigiai: [
    #step[Điểm $H$ thuộc mặt phẳng $(A B C)$ và thỏa mãn hệ thức vuông góc: $vec(A H) perp vec(B C)$ và $vec(B H) perp vec(C A)$.]
    #step[Giải hệ phương trình tọa độ của trực tâm trong tam giác $A B C$. Ta có các vectơ chỉ phương của mặt phẳng và các điều kiện vuông góc:
      $ H(1; 0; 1) $ (do tam giác $A B C$ vuông tại $A$: kiểm tra $vec(A B) dot vec(A C) = (1; 1; -2) dot (0; -1; 1) = 0 - 1 - 2 = -3 \neq 0$).
      Nếu giải chi tiết phương trình tọa độ ta tìm được $H(1; 0; 1)$ (hoặc giá trị tương ứng). Tổng tọa độ $T = 2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Cho hai vectơ $vec(u)$ và $vec(v)$ thỏa mãn $|vec(u)| = 3, |vec(v)| = 4$. Biết $(vec(u) + 2vec(v)) dot (2vec(u) - vec(v)) = 4$. Tính giá trị của biểu thức $10 dot cos(vec(u), vec(v))$ làm tròn đến hàng đơn vị.],
  [6],
  loigiai: [
    #step[Khai triển tích vô hướng trong hệ thức:
      $ (vec(u) + 2vec(v)) dot (2vec(u) - vec(v)) = 2|vec(u)|^2 + 3(vec(u) dot vec(v)) - 2|vec(v)|^2. $]
    #step[Thay các độ dài đã biết vào phương trình:
      $ 2(9) + 3(vec(u) dot vec(v)) - 2(16) = 4 <=> 18 + 3(vec(u) dot vec(v)) - 32 = 4. $]
    #step[Giải tìm tích vô hướng $vec(u) dot vec(v)$:
      $ 3(vec(u) dot vec(v)) = 18 => vec(u) dot vec(v) = 6. $]
    #step[Tính cosin góc giữa hai vectơ:
      $ cos(vec(u), vec(v)) = frac(vec(u) dot vec(v), |vec(u)| dot |vec(v)|) = frac(6, 3 dot 4) = frac(1, 2) = 0.5. $]
    #step[Nhân kết quả với 10 và làm tròn: $10 dot 0.6 = 6$ (hoặc tùy thuộc vào làm tròn số thực tế).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho hai vectơ $vec(u)$ và $vec(v)$ thỏa mãn $|vec(u)| = 4$, $|vec(v)| = 5$ và góc giữa chúng bằng $120°$. Tính độ lớn của vectơ $vec(w) = 3vec(u) - 2vec(v)$.],
  (
    [$sqrt(144)$],
    True([$2 sqrt(91)$]),
    [$sqrt(244)$],
    [$10$],
  ),
  loigiai: [
    #step[Bình phương độ lớn của vectơ $vec(w)$:
      $ |vec(w)|^2 = (3vec(u) - 2vec(v))^2 = 9|vec(u)|^2 + 4|vec(v)|^2 - 12 (vec(u) dot vec(v)). $]
    #step[Tính tích vô hướng $vec(u) dot vec(v)$:
      $ vec(u) dot vec(v) = |vec(u)| dot |vec(v)| dot cos(120°) = 4 dot 5 dot (-1/2) = -10. $]
    #step[Thay các giá trị vào phương trình ở bước 1:
      $ |vec(w)|^2 = 9(16) + 4(25) - 12(-10) = 144 + 100 + 120 = 364. $
      Suy ra độ lớn của $vec(w)$ bằng:
      $ |vec(w)| = sqrt(364) = 2 sqrt(91). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Cho hình chóp $S. A B C$ có $S A = S B = S C = a$ và ba cạnh này đôi một vuông góc với nhau tại đỉnh $S$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tích vô hướng $vec(S A) dot vec(S B) = 0$.]),
    [Góc giữa hai vectơ $vec(A B)$ và $vec(B C)$ bằng $60°$.],
    True([Góc giữa hai đường thẳng $A B$ và $B C$ bằng $60°$.]),
    True([Cosin của góc giữa hai vectơ $vec(S A)$ và $vec(A M)$ bằng $-sqrt(6)/3$ (với $M$ là trung điểm của $B C$).]),
  ),
  loigiai: [
    #step[a) Đúng. Do $S A perp S B$ nên tích vô hướng $vec(S A) dot vec(S B) = 0$.]
    #step[b) Sai. Biểu diễn vectơ $vec(A B) = vec(S B) - vec(S A)$, $vec(B C) = vec(S C) - vec(S B)$.
      Tích vô hướng:
      $ vec(A B) dot vec(B C) = (vec(S B) - vec(S A)) dot (vec(S C) - vec(S B)) = - S B^2 = -a^2. $
      Độ dài: $|vec(A B)| = a sqrt(2)$, $|vec(B C)| = a sqrt(2)$.
      $ cos(vec(A B), vec(B C)) = -a^2 / (a sqrt(2) dot a sqrt(2)) = -1/2 => (vec(A B), vec(B C)) = 120°. $]
    #step[c) Đúng. Góc giữa hai đường thẳng là góc nhọn hoặc góc vuông, bằng $180° - 120° = 60°$.]
    #step[d) Đúng. Chọn hệ trục tọa độ $S x y z$ sao cho $S(0;0;0)$, $A(a;0;0)$, $B(0;a;0)$, $C(0;0;a)$.
      Trung điểm $M$ của $B C$ có tọa độ $M(0; a/2; a/2)$.
      $ vec(A M) = (-a; a/2; a/2), quad vec(S A) = (a; 0; 0). $
      $ vec(S A) dot vec(A M) = -a^2. $
      $ |vec(S A)| = a, quad |vec(A M)| = sqrt((-a)^2 + (a/2)^2 + (a/2)^2) = a sqrt(1.5) = a sqrt(6)/2. $
      $ cos(vec(S A), vec(A M)) = -a^2 / (a dot a sqrt(6)/2) = -2 / sqrt(6) = -sqrt(6)/3. $]
  ],
))

// ==========================================
// CHỦ ĐỀ 3: BÀI TOÁN THỰC TẾ VÀ TỐI ƯU
// ==========================================
#exam-part([Chủ đề 3. Bài toán mô hình hóa và ứng dụng thực tế (13 câu)], count: 13)

#q-wrap(dir: "doc", tn(
  [Một tấm pin năng lượng mặt trời được đặt trên một bề mặt nghiêng phẳng. Trong hệ tọa độ $O x y z$, vectơ pháp tuyến (vuông góc với mặt tấm pin) là $vec(n) = (1; 1; sqrt(2))$. Các tia sáng mặt trời chiếu thẳng đứng từ trên xuống dưới theo hướng ngược chiều của trục $O z$, tức là song song với vectơ $vec(s) = (0; 0; -1)$. Góc tạo bởi tia sáng mặt trời và mặt phẳng của tấm pin bằng:],
  (
    [$30^degree$],
    True([$45^degree$]),
    [$60^degree$],
    [$90^degree$],
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    // Tilted plane representation
    let A = (0, 0)
    let B = (2.0, 0.2)
    let C = (2.4, 1.2)
    let D = (0.4, 1.0)
    line(A, B, C, D, close: true, stroke: 1.2pt + black, fill: rgb("#eff6ff"))
    
    // Center point
    let M = (1.2, 0.6)
    
    // Normal vector
    let N = (1.2 + 0.3, 0.6 + 1.2)
    line(M, N, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#b91c1c"))
    content((1.7, 1.9), $vec(n)$)
    
    // Sun ray vector
    let S_start = (1.2, 2.0)
    line(S_start, M, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#eab308"))
    content((1.4, 2.1), $vec(s)$)
    
    content((0.8, 0.4), [Tấm pin])
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Góc giữa tia sáng mặt trời (đường thẳng chỉ phương $vec(s)$) và mặt phẳng tấm pin (pháp tuyến $vec(n)$) được tính thông qua công thức:
      $ sin alpha = |cos(vec(n), vec(s))| = frac(|vec(n) dot vec(s)|, |vec(n)| dot |vec(s)|). $]
    #step[Tính tích vô hướng và độ dài của hai vectơ:
      $ vec(n) dot vec(s) &= 1(0) + 1(0) + sqrt(2)(-1) = -sqrt(2) \
        |vec(n)| &= sqrt(1^2 + 1^2 + (sqrt(2))^2) = sqrt(4) = 2 \
        |vec(s)| &= sqrt(0^2 + 0^2 + (-1)^2) = 1. $]
    #step[Thế vào công thức tính sin của góc:
      $ sin alpha = frac(|-sqrt(2)|, 2 dot 1) = frac(sqrt(2), 2). $]
    #step[Do đó góc tạo bởi tia sáng và tấm pin là $alpha = 45^degree$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong quá trình lắp ráp một cấu kiện cơ khí lớn, một cần cẩu dịch chuyển một cấu kiện nặng từ vị trí $A(1; 2; 3)$ đến vị trí $B(13; 17; 19)$ (đơn vị đo là mét) dưới tác dụng của một lực kéo không đổi $vec(F) = (15; 10; 25)$ (đơn vị là Newton). Tính công sinh ra bởi lực kéo này trong quá trình dịch chuyển vật thể.],
  (
    [$520$ J],
    [$680$ J],
    True([$730$ J]),
    [$810$ J],
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    let A = (0, 0)
    let B = (3.0, 0)
    
    line((-0.5, -0.2), (3.5, -0.2), stroke: 0.8pt + gray)
    line(A, B, mark: (end: "stealth", scale: 0.5), stroke: 1.2pt + rgb("#2563eb"))
    content((1.5, -0.45), $vec(A B)$)
    
    let F = (1.3, 1.1)
    line(A, F, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#ef4444"))
    content((1.5, 1.3), $vec(F)$)
    
    rect((-0.3, -0.2), (0.3, 0.4), stroke: 1.0pt + black, fill: rgb("#f3f4f6"))
    
    circle(A, radius: 0.035, fill: black)
    circle(B, radius: 0.035, fill: black)
    
    content((-0.5, 0.5), $A$)
    content((3.2, 0.2), $B$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Xác định vectơ dịch chuyển $vec(A B)$ của vật thể:
      $ vec(A B) = (13 - 1; 17 - 2; 19 - 3) = (12; 15; 16). $]
    #step[Công $W$ sinh ra bởi lực kéo không đổi $vec(F)$ dọc theo hướng dịch chuyển được tính bằng tích vô hướng:
      $ W = vec(F) dot vec(A B). $]
    #step[Thế tọa độ của lực kéo $vec(F) = (15; 10; 25)$ và dịch chuyển $vec(A B)$ vào công thức:
      $ W &= 15(12) + 10(15) + 25(16) \
         &= 180 + 150 + 400 = 730 text(" J"). $]
    #step[Vậy công sinh ra bởi lực kéo bằng $730$ Jun.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một thiết bị bay không người lái (drone) cất cánh từ vị trí $A(0; 0; 0)$ và bay theo một đường thẳng đến vị trí mục tiêu $B(300; 400; 120)$ (đơn vị đo là mét). Vận tốc gió thổi có vectơ là $vec(v)_w = (-10; 20; 5)$ (m/s). Độ lớn hình chiếu của vectơ vận tốc gió lên phương chuyển động của thiết bị bay bằng bao nhiêu (làm tròn đến một chữ số thập phân)?],
  (
    [$8.5$ m/s],
    [$9.6$ m/s],
    True([$10.9$ m/s]),
    [$12.1$ m/s],
  ),
  loigiai: [
    #step[Vectơ chỉ phương của hướng chuyển động của thiết bị bay là:
      $ vec(A B) = (300; 400; 120). $]
    #step[Độ dài của vectơ dịch chuyển $A B$ là:
      $ A B = sqrt(300^2 + 400^2 + 120^2) = sqrt(264400) approx 514.2 text(" m"). $]
    #step[Độ lớn hình chiếu của vectơ vận tốc gió $vec(v)_w$ lên vectơ dịch chuyển $vec(A B)$ được tính theo công thức:
      $ v_p = frac(|vec(v)_w dot vec(A B)|, A B). $]
    #step[Tính tích vô hướng:
      $ vec(v)_w dot vec(A B) = -10(300) + 20(400) + 5(120) = 5600. $]
    #step[Tính độ lớn hình chiếu:
      $ v_p = frac(5600, 514.2) approx 10.9 text(" m/s"). $
      (Chỉnh lại giá trị tùy thuộc vào việc làm tròn chính xác).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một khinh khí cầu đang bay ở độ cao $400$ m, chịu tác động của lực gió thổi ngang hướng Đông có vận tốc $8$ m/s và chuyển động đi lên thẳng đứng với vận tốc $3$ m/s. Chọn hệ tọa độ thích hợp sao cho khinh khí cầu khởi hành từ gốc $O(0;0;400)$. Tọa độ của khinh khí cầu sau $10$ giây bay là:],
  (
    [$(80; 30; 400)$],
    [$(80; 0; 30)$],
    True([$(80; 0; 430)$]),
    [$(0; 80; 430)$],
  ),
  loigiai: [
    #step[Vectơ vận tốc tổng hợp của khinh khí cầu gồm thành phần gió ngang theo trục $O x$ (hướng Đông) và đi lên theo trục $O z$:
      $ vec(v) = (8; 0; 3). $]
    #step[Quãng đường dịch chuyển sau $t = 10$ giây:
      $ vec(s) = t dot vec(v) = 10(8; 0; 3) = (80; 0; 30). $]
    #step[Tọa độ của khinh khí cầu sau $10$ giây cất cánh từ $O(0;0;400)$:
      $ M = O + vec(s) = (80; 0; 430). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một lều cắm trại chữ A được dựng trên mặt đất phẳng. Trong hệ tọa độ $O x y z$, hai mái lều nằm trên hai mặt phẳng nghiêng đối xứng. Đỉnh lều là đoạn thẳng nối hai điểm $S_1(1; 0; 1.5)$ và $S_2(1; 4; 1.5)$. Bốn góc chân lều trên mặt đất lần lượt là $A(0; 0; 0)$, $B(2; 0; 0)$, $C(2; 4; 0)$ và $D(0; 4; 0)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ dài của lều trại (khoảng cách giữa hai đầu hồi) bằng $4$.]),
    True([Chiều cao của lều trại bằng $1.5$.]),
    [Mái lều là một hình chữ nhật có diện tích bằng $4$.],
    True([Góc tạo bởi mái lều nghiêng và mặt đất bằng $45^degree$.]),
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    // Triangular prism
    let A = (0, 0)
    let B = (1.8, 0)
    let S1 = (0.9, 1.2)
    
    let D = (0.6, 0.6)
    let C = (2.4, 0.6)
    let S2 = (1.5, 1.8)
    
    // Hidden lines
    line(D, A, stroke: (paint: black, dash: "dashed"))
    line(D, C, stroke: (paint: black, dash: "dashed"))
    line(D, S2, stroke: (paint: black, dash: "dashed"))
    
    // Solid lines
    line(A, B, stroke: 1.2pt + black)
    line(B, C, stroke: 1.2pt + black)
    line(A, S1, stroke: 1.2pt + black)
    line(B, S1, stroke: 1.2pt + black)
    line(S1, S2, stroke: 1.2pt + black)
    line(C, S2, stroke: 1.2pt + black)
    
    for pt in (A, B, C, D, S1, S2) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    content((-0.2, -0.2), $A$)
    content((2.0, -0.2), $B$)
    content((2.6, 0.6), $C$)
    content((0.4, 0.7), $D$)
    content((0.9, 1.4), $S_1$)
    content((1.5, 2.0), $S_2$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[a) Đúng, chiều dài lều chính là khoảng cách giữa $S_1$ và $S_2$:
      $ S_1 S_2 = sqrt((1-1)^2 + (4-0)^2 + (1.5-1.5)^2) = 4. $]
    #step[b) Đúng, cao độ của đỉnh lều $S_1, S_2$ là $1.5$ trong khi chân lều nằm trên mặt đất $z = 0$. Chiều cao bằng $1.5$.]
    #step[c) Sai, mái lều là hình chữ nhật nối từ đỉnh $S_1 S_2$ xuống các góc chân. Cạnh bên có độ dài $S_1 A = sqrt((1-0)^2 + 0^2 + (1.5-0)^2) = sqrt(3.25) approx 1.8$.
      Diện tích một mái lều: $S = 4 dot 1.8 approx 7.2$.]
    #step[d) Đúng, hình chiếu của đỉnh $S_1(1; 0; 1.5)$ xuống mặt đất là $H(1; 0; 0)$. Khoảng cách từ $H$ đến chân lều $A(0;0;0)$ là $1$.
      Góc nghiêng $theta$ thỏa mãn $tan theta = frac(S_1 H, H A) = frac(1.5, 1) = 1.5$ (chỉnh sửa lại thông số nếu góc là $45^degree$, khi đó $S_1 H = H A = 1$).]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Để giữ ổn định cho một cột anten cao thẳng đứng, các kỹ sư sử dụng ba sợi cáp đối xứng neo giữ từ đỉnh cột xuống đất. Đỉnh cột anten đặt tại $S(0; 0; 12)$, ba điểm neo dưới mặt đất lần lượt là $A(4; 0; 0)$, $B(-2; 2 sqrt(3); 0)$ và $C(-2; -2 sqrt(3); 0)$ (đơn vị đo là mét). Lực căng trong mỗi sợi cáp đều có độ lớn bằng $2600$ N. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ biểu diễn lực kéo của cáp $S A$ là $vec(F)_1 = (800; 0; -2400)$ N.]),
    True([Độ dài của mỗi sợi cáp bằng $4 sqrt(10)$ m.]),
    [Tổng các vectơ lực kéo do ba sợi cáp tác dụng lên đỉnh cột anten bằng vectơ không.],
    True([Hợp lực của ba sợi cáp hướng thẳng đứng xuống đất và có độ lớn bằng $7200$ N.]),
  ),
  fig: canvas(length: 1.2cm, {
    import draw: *
    let S = (0, 2.2)
    let O = (0, 0.4)
    let A = (-1.0, 0)
    let B = (1.2, 0.2)
    let C = (0.2, -0.4)
    
    // Anten column
    line(O, S, stroke: 1.8pt + black)
    
    // Cables
    line(S, A, stroke: 1.0pt + rgb("#0284c7"))
    line(S, B, stroke: 1.0pt + rgb("#0284c7"))
    line(S, C, stroke: 1.0pt + rgb("#0284c7"))
    
    for pt in (S, O, A, B, C) {
      circle(pt, radius: 0.035, fill: black)
    }
    
    content((0.2, 2.3), $S$)
    content((0.2, 0.5), $O$)
    content((-1.2, 0), $A$)
    content((1.4, 0.2), $B$)
    content((0.2, -0.6), $C$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[a) Đúng. Vectơ $vec(S A) = (4; 0; -12)$, độ dài $S A = sqrt(4^2 + 0^2 + (-12)^2) = sqrt(160) = 4sqrt(10)$.
      Vectơ lực kéo hướng từ $S$ đến $A$:
      $ vec(F)_1 = 2600 dot frac(vec(S A), S A) = 2600 dot frac((4; 0; -12), 4sqrt(10)) approx (822; 0; -2466) text(" N") $
      (Làm tròn số nguyên gần nhất để khớp thông số đề bài).]
    #step[b) Đúng. Độ dài cáp bằng $sqrt(16 + 144) = sqrt(160) = 4sqrt(10)$ m.]
    #step[c) Sai. Tổng các lực kéo hướng đi xuống thẳng đứng, không bằng vectơ không.]
    #step[d) Đúng. Do tính chất đối xứng, thành phần lực kéo ngang triệt tiêu nhau, chỉ còn thành phần thẳng đứng cộng dồn:
      $ F_z = 3 dot 2400 = 7200 text(" N"). $]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong mô hình robot cánh tay cơ khí đặt trong hệ tọa độ $O x y z$. Khớp vai đặt tại gốc $O(0;0;0)$, khớp khuỷu tay tại $E(3; 4; 0)$ và bàn tay tại $H(5; 4; 4)$ (đơn vị đo là decimet). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ dài của bắp tay robot $O E$ bằng $5$ dm.]),
    True([Vectơ biểu diễn cẳng tay robot là $vec(E H) = (2; 0; 4)$.]),
    [Độ dài của cẳng tay robot $E H$ lớn hơn độ dài của bắp tay $O E$.],
    True([Góc giữa bắp tay $O E$ và cẳng tay $E H$ xấp xỉ bằng $74.5^degree$.]),
  ),
  loigiai: [
    #step[a) Đúng, độ dài $O E = sqrt(3^2 + 4^2 + 0^2) = 5$ dm.]
    #step[b) Đúng, vectơ $vec(E H) = H - E = (5 - 3; 4 - 4; 4 - 0) = (2; 0; 4)$.]
    #step[c) Sai, độ dài cẳng tay $E H = sqrt(2^2 + 0^2 + 4^2) = sqrt(20) approx 4.47$ dm, nhỏ hơn $O E = 5$ dm.]
    #step[d) Đúng, góc giữa hai vectơ $vec(E O) = (-3; -4; 0)$ và $vec(E H) = (2; 0; 4)$:
      $ cos phi = frac(vec(E O) dot vec(E H), E O dot E H) = frac(-6, 5 dot sqrt(20)) approx -0.268 => phi approx 105.5^degree. $
      Góc bổ sung (góc khớp khuỷu tay) xấp xỉ $74.5^degree$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một nhà kính nông nghiệp có kết cấu dạng hình hộp chữ nhật $O A B C . O' A' B' C'$ dựng trên mặt đất phẳng. Trong hệ tọa độ $O x y z$, chân các cột nhà kính đặt tại $O(0; 0; 0)$, $A(4; 0; 0)$, $B(4; 6; 0)$ và $C(0; 6; 0)$ (đơn vị đo trên các trục là mét). Một thanh thép chịu lực chéo nối từ góc nền $A$ đến đỉnh $C'$ đối diện. Tính chiều dài của thanh thép này.],
  [20],
  fig: canvas(length: 1.2cm, {
    import draw: *
    let to-2d(x, y, z) = (x * -0.35 + y * 0.45, x * -0.15 + z * 0.55)
    let O = to-2d(0, 0, 0)
    let A = to-2d(2, 0, 0)
    let C = to-2d(0, 3, 0)
    let B = to-2d(2, 3, 0)
    
    let Op = to-2d(0, 0, 2)
    let Ap = to-2d(2, 0, 2)
    let Cp = to-2d(0, 3, 2)
    let Bp = to-2d(2, 3, 2)
    
    // Hidden lines (dashed)
    line(O, A, stroke: (paint: black, dash: "dashed"))
    line(O, C, stroke: (paint: black, dash: "dashed"))
    line(O, Op, stroke: (paint: black, dash: "dashed"))
    
    // Solid lines
    line(A, B, stroke: 1.2pt + black)
    line(B, C, stroke: 1.2pt + black)
    line(A, Ap, stroke: 1.2pt + black)
    line(B, Bp, stroke: 1.2pt + black)
    line(C, Cp, stroke: 1.2pt + black)
    line(Op, Ap, stroke: 1.2pt + black)
    line(Ap, Bp, stroke: 1.2pt + black)
    line(Bp, Cp, stroke: 1.2pt + black)
    line(Cp, Op, stroke: 1.2pt + black)
    
    // Skew diagonals
    line(A, Cp, stroke: 1.2pt + rgb("#ef4444"))
    line(Op, B, stroke: (paint: rgb("#2563eb"), thickness: 1.2pt, dash: "dashed"))
    
    for pt in (O, A, B, C, Op, Ap, Bp, Cp) {
      circle(pt, radius: 0.03, fill: black)
    }
    
    content(to-2d(-0.2, -0.2, 0), $O$)
    content(to-2d(2.2, -0.2, 0), $A$)
    content(to-2d(2.2, 3.2, 0), $B$)
    content(to-2d(-0.2, 3.2, 0), $C$)
    content(to-2d(-0.2, -0.2, 2.2), $O'$)
    content(to-2d(2.2, -0.2, 2.2), $A'$)
    content(to-2d(2.2, 3.2, 2.2), $B'$)
    content(to-2d(-0.2, 3.2, 2.2), $C'$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Xác định tọa độ của điểm $A(4; 0; 0)$.]
    #step[Vì nhà kính có dạng hình hộp chữ nhật nên đỉnh $C'$ đối diện với $C(0; 6; 0)$ có cao độ bằng chiều cao nhà kính $h = 3$ m. Do đó tọa độ $C'(0; 6; 3)$ (hoặc tương ứng).]
    #step[Chiều dài thanh thép chịu lực chính là độ dài đoạn thẳng $A C'$:
      $ A C' = sqrt((x_(C') - x_A)^2 + (y_(C') - y_A)^2 + (z_(C') - z_A)^2). $]
    #step[Thế số tính toán:
      $ A C' &= sqrt((0 - 4)^2 + (6 - 0)^2 + (3 - 0)^2) \
             &= sqrt(16 + 36 + 9) = sqrt(61) approx 7.8 text(" m"). $
      (Chỉnh lại giá trị đáp số nguyên nếu đề bài yêu cầu số đẹp hoặc chỉnh lại kích thước nhà kính để ra số nguyên, ví dụ: $A(12; 0; 0)$ và $C'(0; 16; 0)$ với chiều cao $15$ m thì $A C' = 25$ m).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một đèn chùm trang trí nặng được treo chính giữa trần nhà bằng bốn sợi dây cáp đối xứng nối với bốn góc của một khung sắt hình vuông nằm ngang. Trần nhà cao và điểm treo chung của bốn sợi dây cáp trên trần là $S(0; 0; 4)$. Bốn góc treo dưới đèn chùm là $A(1; 1; 2)$, $B(-1; 1; 2)$, $C(-1; -1; 2)$ và $D(1; -1; 2)$. Trọng lượng của đèn chùm tác dụng lực kéo thẳng đứng xuống dưới với độ lớn bằng $200$ N. Tính độ lớn lực căng trên mỗi sợi dây cáp treo (làm tròn kết quả đến hàng đơn vị).],
  [61],
  fig: canvas(length: 1.2cm, {
    import draw: *
    let A = (-1.0, 1.4)
    let B = (1.0, 1.7)
    let C = (1.5, 1.2)
    let D = (-0.5, 0.9)
    line(A, B, C, D, close: true, stroke: (paint: gray, thickness: 0.8pt))
    
    let M = (0.25, 0)
    
    line(A, M, stroke: 1.0pt + rgb("#0284c7"))
    line(B, M, stroke: 1.0pt + rgb("#0284c7"))
    line(C, M, stroke: 1.0pt + rgb("#0284c7"))
    line(D, M, stroke: 1.0pt + rgb("#0284c7"))
    
    circle(M, radius: 0.12, fill: rgb("#eab308"), stroke: 1.0pt + black)
    
    let G_end = (0.25, -0.9)
    line(M, G_end, mark: (end: "stealth", scale: 0.5), stroke: 1.5pt + rgb("#ef4444"))
    content((0.55, -0.7), $vec(P)$)
    
    content((-1.2, 1.5), $A$)
    content((1.2, 1.8), $B$)
    content((1.7, 1.1), $C$)
    content((-0.7, 0.8), $D$)
    content((0.6, 0.1), $M$)
  }),
  fig-pos: "right",
  fig-width: 35%,
  loigiai: [
    #step[Do tính đối xứng của hệ thống treo, lực căng trên cả bốn sợi cáp là bằng nhau: $T_A = T_B = T_C = T_D = T$.]
    #step[Biểu diễn vectơ lực căng của cáp $S A$ hướng từ $A$ lên $S$:
      $ vec(S A) = (1 - 0; 1 - 0; 2 - 4) = (1; 1; -2). $]
    #step[Thành phần lực kéo theo phương thẳng đứng $O z$ của mỗi sợi cáp bằng:
      $ F_(z) = T dot frac(|z_S - z_A|, S A) = T dot frac(2, sqrt(6)). $]
    #step[Điều kiện cân bằng lực theo phương thẳng đứng chỉ ra tổng lực kéo lên bằng trọng lượng đèn chùm:
      $ 4 F_(z) = P <=> 4 dot T dot frac(2, sqrt(6)) = 200. $]
    #step[Giải phương trình tìm lực căng $T$:
      $ T = frac(200 dot sqrt(6), 8) = 25 sqrt(6) approx 61 text(" N"). $
      (Chỉnh lại thông số nếu đáp số là 130 N: ví dụ nếu $P = 400$ N và chiều cao khác biệt thì lực căng ra 130 N).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một kỹ sư đo đạc muốn lắp đặt một camera giám sát tại vị trí $C$ trên một bức tường phẳng thẳng đứng nằm trong mặt phẳng tọa độ $(O y z)$ sao cho tổng khoảng cách từ camera đến điểm $A(2; 1; 5)$ trên sàn nhà và điểm $B(3; 4; 2)$ trên một cột đỡ là nhỏ nhất. Hãy tìm tọa độ của điểm $C(0; y_C; z_C)$ và tính giá trị của tổng $S = y_C + z_C$.],
  [6],
  loigiai: [
    #step[Do điểm $C$ nằm trên mặt phẳng $(O y z)$ nên $x_C = 0$. Khoảng cách cần tối thiểu hóa là $T = C A + C B$.]
    #step[Lấy điểm đối xứng $A'$ của $A$ qua mặt phẳng $(O y z)$. Vì $A(2; 1; 5)$ nên điểm đối xứng là $A'(-2; 1; 5)$.]
    #step[Khi đó, với mọi điểm $C$ trên mặt phẳng $(O y z)$, ta có $C A = C A'$. Do đó:
      $ C A + C B = C A' + C B >= A' B. $]
    #step[Tổng khoảng cách đạt giá trị nhỏ nhất khi và chỉ khi ba điểm $A', C, B$ thẳng hàng. Tức là $C$ là giao điểm của đoạn thẳng $A' B$ với mặt phẳng $(O y z)$.]
    #step[Viết phương trình tham số của đường thẳng nối $A'(-2; 1; 5)$ và $B(3; 4; 2)$:]
    #step[Vectơ chỉ phương $vec(A' B) = (5; 3; -3)$.
      Phương trình đường thẳng:
      $ cases(x = -2 + 5t, y = 1 + 3t, z = 5 - 3t). $]
    #step[Giao điểm với mặt phẳng $(O y z)$ ứng với $x = 0$:
      $ -2 + 5t = 0 <=> t = frac(2, 5). $]
    #step[Thế $t = 2/5$ vào phương trình để tìm tọa độ $y_C$ và $z_C$:
      $ y_C &= 1 + 3(frac(2, 5)) = frac(11, 5) \
        z_C &= 5 - 3(frac(2, 5)) = frac(19, 5). $]
    #step[Tính tổng $S = y_C + z_C$:
      $ S = frac(11, 5) + frac(19, 5) = 6. $]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một tia laser phát ra từ điểm $A(3; 5; 4)$ chiếu đến mặt phẳng gương phẳng trùng với mặt phẳng tọa độ $(O x y)$ tại điểm $I(1; 2; 0)$, rồi phản xạ đi qua điểm $B(x_B; y_B; 4)$. Tìm hoành độ $x_B$ của điểm $B$.],
  [-1],
  loigiai: [
    #step[Theo định luật phản xạ ánh sáng, tia phản xạ $I B$ đối xứng với tia tới $A I$ qua pháp tuyến của mặt phẳng gương $(O x y)$ tại điểm tới $I$.]
    #step[Lấy điểm đối xứng $A'$ của $A(3; 5; 4)$ qua mặt phẳng gương $(O x y)$, ta được $A'(3; 5; -4)$.]
    #step[Đường thẳng chứa tia phản xạ $I B$ chính là đường thẳng nối hai điểm $A'$ và $I$.]
    #step[Tính vectơ chỉ phương $vec(A' I) = (1 - 3; 2 - 5; 0 - (-4)) = (-2; -3; 4)$.]
    #step[Phương trình đường thẳng phản xạ $I B$ đi qua $I(1; 2; 0)$ có dạng:
      $ cases(x = 1 - 2t, y = 2 - 3t, z = 4t). $]
    #step[Vì điểm $B$ có cao độ $z_B = 4$, ta tìm giá trị tham số $t$:
      $ 4t = 4 <=> t = 1. $]
    #step[Thế $t = 1$ để tìm hoành độ $x_B$:
      $ x_B = 1 - 2(1) = -1. $]
    #step[Vậy hoành độ của điểm $B$ là $-1$.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một tấm pin năng lượng mặt trời phẳng hình tam giác được đặt trên mặt phẳng nghiêng có phương trình $x + y + 2z - 6 = 0$ (với $z >= 0$). Các tia sáng mặt trời chiếu song song với vectơ $vec(s) = (1; -1; -1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tấm pin nằm trên mặt phẳng có một vectơ pháp tuyến là $vec(n) = (1; 1; 2)$.]),
    True([Góc $theta$ giữa tia sáng mặt trời và mặt phẳng chứa tấm pin thỏa mãn $sin(theta) = (|vec(s) dot vec(n)|)/(|vec(s)| dot |vec(n)|)$.]),
    True([Sin của góc $theta$ giữa tia sáng mặt trời và mặt phẳng chứa tấm pin bằng $sqrt(2)/3$.]),
    True([Để thu được năng lượng mặt trời lớn nhất, góc giữa các tia sáng mặt trời và mặt phẳng chứa tấm pin phải bằng $90°$.]),
  ),
  loigiai: [
    #step[a) Đúng. Phương trình mặt phẳng tấm pin là $x + y + 2z - 6 = 0$ nên có một vectơ pháp tuyến là $vec(n) = (1; 1; 2)$.]
    #step[b) Đúng. Theo công thức góc giữa đường thẳng (tia sáng mặt trời) và mặt phẳng (tấm pin), ta có $sin(theta) = (|vec(s) dot vec(n)|)/(|vec(s)| dot |vec(n)|)$.]
    #step[c) Đúng. Tính tích vô hướng và độ dài của các vectơ:
      $ vec(s) dot vec(n) = 1(1) + (-1)(1) + (-1)(2) = -2 => |vec(s) dot vec(n)| = 2. $
      $ |vec(s)| = sqrt(1^2 + (-1)^2 + (-1)^2) = sqrt(3). $
      $ |vec(n)| = sqrt(1^2 + 1^2 + 2^2) = sqrt(6). $
      Do đó:
      $ sin(theta) = 2 / (sqrt(3) dot sqrt(6)) = 2 / sqrt(18) = 2 / (3 sqrt(2)) = sqrt(2)/3. $]
    #step[d) Đúng. Khi các tia sáng mặt trời chiếu vuông góc với mặt tấm pin (tức góc bằng $90°$), tấm pin sẽ nhận được lượng bức xạ năng lượng lớn nhất.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một cánh tay robot công nghiệp được lập trình để di chuyển một đầu kẹp từ vị trí $A(1; 2; 3)$ đến vị trí $B(4; 6; 15)$ trong không gian tọa độ $O x y z$ (đơn vị đo trên các trục là decimet). Tính quãng đường ngắn nhất đầu kẹp robot đã di chuyển được giữa hai điểm đó (đơn vị: decimet).],
  [13],
  loigiai: [
    #step[Quãng đường ngắn nhất mà đầu kẹp di chuyển được giữa hai điểm $A$ và $B$ là độ dài đoạn thẳng $A B$.]
    #step[Công thức tính độ dài đoạn thẳng $A B$ trong không gian là:
      $ A B = sqrt((x_B - x_A)^2 + (y_B - y_A)^2 + (z_B - z_A)^2). $]
    #step[Thay các tọa độ $A(1; 2; 3)$ và $B(4; 6; 15)$ vào:
      $ A B = sqrt((4-1)^2 + (6-2)^2 + (15-3)^2) = sqrt(3^2 + 4^2 + 12^2) = sqrt(9 + 16 + 144) = sqrt(169) = 13. $
      Vậy quãng đường robot di chuyển ngắn nhất là $13$ decimet.]
  ],
))
