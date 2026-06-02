#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 07 - TỔNG HỢP CHƯƠNG 2]
]

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tìm tọa độ giao điểm $M$ của đường thẳng $d: cases(x = 1 + t, y = -2 + t, z = 1 - t)$ và mặt phẳng $(P): x - y + z - 4 = 0$.],
  (
    [$M(2; -1; 0)$],
    True([$M(1; -2; 1)$]),
    [$M(0; -3; 2)$],
    [$M(3; 0; -1)$],
  ),
  
  loigiai: [
    #step[
      - Thay các biểu thức tọa độ của $d$ vào phương trình mặt phẳng $(P)$:
        $(1 + t) - (-2 + t) + (1 - t) - 4 = 0$.
    ]
    #step[
      - Rút gọn phương trình theo $t$:
        $1 + t + 2 - t + 1 - t - 4 = 0 <=> -t = 0 <=> t = 0$.
    ]
    #step[
      - Thế $t = 0$ ngược lại vào phương trình đường thẳng $d$, ta được giao điểm là $M(1; -2; 1)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính khoảng cách $d$ giữa hai mặt phẳng song song $(P): 2x - y + 2z - 3 = 0$ và $(Q): 2x - y + 2z + 6 = 0$.],
  (
    [$d = 1$],
    [$d = 2$],
    True([$d = 3$]),
    [$d = 9$],
  ),
  
  loigiai: [
    #step[
      - Hai mặt phẳng song song có dạng tổng quát: $(P): A x + B y + C z + D_1 = 0$ và $(Q): A x + B y + C z + D_2 = 0$.
    ]
    #step[
      - Khoảng cách giữa hai mặt phẳng song song được tính theo công thức:
        $d = frac(|D_1 - D_2|, sqrt(A^2 + B^2 + C^2))$.
    ]
    #step[
      - Thay các hệ số vào công thức:
        $d = frac(|-3 - 6|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(9, 3) = 3$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt cầu $(S)$ có tâm $I(1; 1; 0)$ và cắt đường thẳng $d: x = t, y = 2 - t, z = 1$ thành một dây cung có độ dài bằng $2sqrt(3)$.],
  (
    [$(x - 1)^2 + (y - 1)^2 + z^2 = 3$],
    True([$(x - 1)^2 + (y - 1)^2 + z^2 = 4$]),
    [$(x - 1)^2 + (y - 1)^2 + z^2 = 16$],
    [$(x + 1)^2 + (y + 1)^2 + z^2 = 4$],
  ),
  
  loigiai: [
    #step[
      - Đường thẳng $d$ đi qua $M_0(0; 2; 1)$ và có vectơ chỉ phương $vec(u) = (1; -1; 0)$. Ta có $vec(M_0 I) = (1; -1; -1)$.
    ]
    #step[
      - Tính khoảng cách từ tâm $I$ đến đường thẳng $d$:
        $[vec(M_0 I), vec(u)] = (-1; -1; 0) => d(I, d) = frac(|[vec(M_0 I), vec(u)]|, |vec(u)|) = frac(sqrt(2), sqrt(2)) = 1$.
    ]
    #step[
      - Gọi $H$ là hình chiếu của $I$ trên $d$. Dây cung có độ dài $2r = 2sqrt(3) => r = sqrt(3)$. Bán kính mặt cầu là:
        $R = sqrt(d^2(I, d) + r^2) = sqrt(1^2 + 3) = 2$.
    ]
    #step[
      - Phương trình mặt cầu là:
        $(x - 1)^2 + (y - 1)^2 + z^2 = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tìm tọa độ hình chiếu vuông góc $H$ của điểm $A(1; 2; 3)$ trên mặt phẳng $(P): x - y + z - 5 = 0$.],
  (
    [$H(1; 2; 3)$],
    [$H(0; 3; 2)$],
    True([$H(2; 1; 4)$]),
    [$H(2; 2; 5)$],
  ),
  
  loigiai: [
    #step[
      - Đường thẳng $Delta$ đi qua $A$ và vuông góc với $(P)$ nhận vectơ pháp tuyến của $(P)$ là $vec(n) = (1; -1; 1)$ làm vectơ chỉ phương.
        Phương trình tham số của $Delta$: $x = 1 + t$, $y = 2 - t$, $z = 3 + t$.
    ]
    #step[
      - Hình chiếu $H$ là giao điểm của $Delta$ và $(P)$. Thay vào phương trình $(P)$ ta được:
        $(1 + t) - (2 - t) + (3 + t) - 5 = 0 <=> 3t - 3 = 0 <=> t = 1$.
    ]
    #step[
      - Thế $t = 1$ ngược lại ta được tọa độ hình chiếu $H(2; 1; 4)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc $phi$ giữa hai mặt phẳng $(P): x + y - z + 1 = 0$ và $(Q): x - y + z - 5 = 0$.],
  (
    True([$cos phi = 1/3$]),
    [$cos phi = 2/3$],
    [$cos phi = sqrt(3)/3$],
    [$cos phi = 0$],
  ),
  
  loigiai: [
    #step[
      - Vectơ pháp tuyến của hai mặt phẳng lần lượt là:
        $vec(n_1) = (1; 1; -1)$, $vec(n_2) = (1; -1; 1)$.
    ]
    #step[
      - Áp dụng công thức tính góc giữa hai mặt phẳng:
        $cos phi = frac(|vec(n_1) dot.c vec(n_2)|, |vec(n_1)| dot.c |vec(n_2)|)$.
    ]
    #step[
      - Thay tọa độ vào công thức:
        $cos phi = frac(|1(1) + 1(-1) + (-1)(1)|, sqrt(1^2 + 1^2 + (-1)^2) dot.c sqrt(1^2 + (-1)^2 + 1^2)) = frac(|-1|, sqrt(3) dot.c sqrt(3)) = 1/3$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc giữa hai đường thẳng $d_1: frac(x-1, 1) = frac(y-2, 2) = frac(z, -1)$ và $d_2: frac(x, 2) = frac(y-1, 1) = frac(z+1, 1)$.],
  (
    [$30^degree$],
    [$45^degree$],
    True([$60^degree$]),
    [$90^degree$],
  ),
  
  loigiai: [
    #step[
      - Vectơ chỉ phương của hai đường thẳng là $vec(u_1) = (1; 2; -1)$ và $vec(u_2) = (2; 1; 1)$.
    ]
    #step[
      - Gọi $phi$ là góc giữa hai đường thẳng, ta có:
        $cos phi = frac(|vec(u_1) dot.c vec(u_2)|, |vec(u_1)| dot.c |vec(u_2)|) = frac(|1(2) + 2(1) + (-1)(1)|, sqrt(1^2 + 2^2 + (-1)^2) dot.c sqrt(2^2 + 1^2 + 1^2)) = frac(3, sqrt(6) dot.c sqrt(6)) = frac(3, 6) = 1/2$.
    ]
    #step[
      - Vì $cos phi = 1/2$ và góc giữa hai đường thẳng thuộc đoạn $[0^degree; 90^degree]$ nên $phi = 60^degree$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc $theta$ giữa đường thẳng $d: frac(x-1, 2) = frac(y+2, 1) = frac(z-1, 2)$ và mặt phẳng $(P): 2x - y + 2z - 5 = 0$.],
  (
    [$sin theta = 5/9$],
    True([$sin theta = 7/9$]),
    [$sin theta = 2/3$],
    [$sin theta = 1/9$],
  ),
  
  loigiai: [
    #step[
      - Vectơ chỉ phương của $d$ là $vec(u) = (2; 1; 2)$, vectơ pháp tuyến của $(P)$ là $vec(n) = (2; -1; 2)$.
    ]
    #step[
      - Áp dụng công thức tính góc giữa đường thẳng và mặt phẳng:
        $sin theta = frac(|vec(u) dot.c vec(n)|, |vec(u)| dot.c |vec(n)|)$.
    ]
    #step[
      - Thay số vào công thức:
        $sin theta = frac(|2(2) + 1(-1) + 2(2)|, sqrt(2^2 + 1^2 + 2^2) dot.c sqrt(2^2 + (-1)^2 + 2^2)) = frac(|4 - 1 + 4|, 3 dot.c 3) = 7/9$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, xác định vị trí tương đối của hai đường thẳng $d_1: frac(x-1, 1) = frac(y-2, 2) = frac(z-3, 3)$ và $d_2: frac(x-1, 2) = frac(y-2, 2) = frac(z-3, 1)$.],
  (
    [Chéo nhau],
    [Song song],
    [Trùng nhau],
    True([Cắt nhau]),
  ),
  
  loigiai: [
    #step[
      - Nhận xét điểm chung: Cả hai đường thẳng đều chứa điểm $M(1; 2; 3)$.
    ]
    #step[
      - Hai vectơ chỉ phương của hai đường thẳng lần lượt là $vec(u_1) = (1; 2; 3)$ và $vec(vec(u_2)) = (2; 2; 1)$.
    ]
    #step[
      - Vì hai vectơ chỉ phương không cùng phương (tỉ số $1/2 != 2/2$) nên hai đường thẳng không song song hoặc trùng nhau. Do đó, chúng cắt nhau tại điểm $M(1; 2; 3)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho điểm $A(1; 2; 1)$ và đường thẳng $d: cases(x = t, y = 1, z = 2)$. Tính khoảng cách từ điểm $A$ đến đường thẳng $d$.],
  (
    [$1$],
    True([$sqrt(2)$]),
    [$2$],
    [$sqrt(3)$],
  ),
  
  loigiai: [
    #step[
      - Đường thẳng $d$ đi qua điểm $M_0(0; 1; 2)$ và có vectơ chỉ phương $vec(u) = (1; 0; 0)$.
    ]
    #step[
      - Tính vectơ $vec(M_0 A) = (1 - 0; 2 - 1; 1 - 2) = (1; 1; -1)$.
    ]
    #step[
      - Tính tích có hướng:
        $[vec(M_0 A), vec(u)] = (0; -1; -1)$.
    ]
    #step[
      - Tính khoảng cách từ $A$ đến đường thẳng $d$:
        $d(A, d) = frac(|[vec(M_0 A), vec(u)]|, |vec(u)|) = frac(sqrt(0^2 + (-1)^2 + (-1)^2), sqrt(1^2 + 0^2 + 0^2)) = sqrt(2)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho mặt phẳng $(P): x + y + z - 3 = 0$ và điểm $A(2; 2; 2)$. Tìm tọa độ điểm $A'$ đối xứng với điểm $A$ qua mặt phẳng $(P)$.],
  (
    [$A'(1; 1; 1)$],
    True([$A'(0; 0; 0)$]),
    [$A'(2; 2; 0)$],
    [$A'(-1; -1; -1)$],
  ),
  
  loigiai: [
    #step[
      - Gọi $H$ là hình chiếu vuông góc của điểm $A$ trên mặt phẳng $(P)$.
      - Đường thẳng qua $A$ vuông góc với $(P)$ nhận vectơ pháp tuyến $vec(n) = (1; 1; 1)$ làm vectơ chỉ phương: $x = 2 + t, y = 2 + t, z = 2 + t$.
    ]
    #step[
      - Thay vào phương trình mặt phẳng $(P)$ để tìm $H$:
        $(2 + t) + (2 + t) + (2 + t) - 3 = 0 <=> 3t + 3 = 0 <=> t = -1$.
        Suy ra tọa độ điểm $H$ là $H(1; 1; 1)$.
    ]
    #step[
      - Vì $A'$ đối xứng với $A$ qua $(P)$ nên $H$ là trung điểm của đoạn thẳng $A A'$:
        $x_{A'} = 2x_H - x_A = 2(1) - 2 = 0$.
        $y_{A'} = 2y_H - y_A = 2(1) - 2 = 0$.
        $z_{A'} = 2z_H - z_A = 2(1) - 2 = 0$.
        Vậy $A'(0; 0; 0)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, xác định vị trí tương đối của hai mặt phẳng $(P): x - 2y + 2z - 1 = 0$ và $(Q): 2x - 4y + 4z + 3 = 0$.],
  (
    [Cắt nhau nhưng không vuông góc],
    [Trùng nhau],
    [Vuông góc],
    True([Song song]),
  ),
  
  loigiai: [
    #step[
      - Xét tỷ số các hệ số của hai phương trình mặt phẳng:
        $frac(1, 2) = frac(-2, -4) = frac(2, 4) = 1/2$.
    ]
    #step[
      - Xét tỷ số hệ số tự do:
        $frac(-1, 3) = -1/3$.
    ]
    #step[
      - Vì tỷ số các hệ số của các biến bằng nhau và khác tỷ số hệ số tự do nên hai mặt phẳng song song với nhau.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hình vẽ dưới đây mô tả hai mặt phẳng song song $(P)$ và $(Q)$ có khoảng cách là $d$:
    #align(center)[
      #canvas(length: 1.0cm, {
        import draw: *
        // Mặt phẳng (Q) ở dưới
        let Q_A = (-2.5, -1.0)
        let Q_B = (1.5, -1.0)
        let Q_C = (2.5, 0.2)
        let Q_D = (-1.5, 0.2)
        line(Q_A, Q_B, Q_C, Q_D, close: true, fill: rgb("#fafafa"), stroke: 0.6pt + gray)
        content((2.1, -0.1), $(Q)$)
        
        // Mặt phẳng (P) ở trên
        let P_A = (-2.5, 0.8)
        let P_B = (1.5, 0.8)
        let P_C = (2.5, 2.0)
        let P_D = (-1.5, 2.0)
        line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#f8fafc"), stroke: 0.6pt + gray)
        content((2.1, 1.7), $(P)$)
        
        // Điểm A thuộc (P) và H thuộc (Q) biểu diễn khoảng cách
        let A_pt = (0.0, 1.4)
        let H_pt = (0.0, -0.4)
        circle(A_pt, radius: 0.04, fill: black)
        circle(H_pt, radius: 0.04, fill: black)
        content((0.35, 1.4), $A$)
        content((0.35, -0.45), $H$)
        
        line(A_pt, H_pt, stroke: (paint: rgb("#b91c1c"), thickness: 1.0pt, dash: "dashed"))
        content((-0.3, 0.5), $d$)
        
        // Góc vuông tại H trên mặt phẳng Q
        line((-0.2, -0.4), (-0.2, -0.2), (0.0, -0.2), stroke: 0.5pt)
      })
    ]
    Công thức nào sau đây dùng để tính khoảng cách giữa hai mặt phẳng song song $(P): A x + B y + C z + D_1 = 0$ và $(Q): A x + B y + C z + D_2 = 0$?],
  (
    [$d = frac(|D_1 + D_2|, sqrt(A^2 + B^2 + C^2))$],
    True([$d = frac(|D_1 - D_2|, sqrt(A^2 + B^2 + C^2))$]),
    [$d = frac(|D_1 - D_2|, A^2 + B^2 + C^2)$],
    [$d = |D_1 - D_2|$],
  ),
  
  loigiai: [
    #step[
      - Lấy một điểm $M(x_0; y_0; z_0)$ thuộc mặt phẳng $(P)$, ta có $A x_0 + B y_0 + C z_0 + D_1 = 0 <=> A x_0 + B y_0 + C z_0 = -D_1$.
    ]
    #step[
      - Khoảng cách giữa hai mặt phẳng chính bằng khoảng cách từ điểm $M$ đến mặt phẳng $(Q)$:
        $d = d(M, (Q)) = frac(|A x_0 + B y_0 + C z_0 + D_2|, sqrt(A^2 + B^2 + C^2))$.
    ]
    #step[
      - Thay thế hệ thức vào tử số:
        $d = frac(|-D_1 + D_2|, sqrt(A^2 + B^2 + C^2)) = frac(|D_1 - D_2|, sqrt(A^2 + B^2 + C^2))$.
    ]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho ba điểm $A(1; 0; 0)$, $B(0; 2; 0)$, $C(0; 0; 3)$ và mặt cầu $(S): (x - 1)^2 + (y - 1)^2 + (z - 1)^2 = 9$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Phương trình mặt phẳng $(A B C)$ viết dưới dạng tổng quát là $6x + 3y + 2z - 6 = 0$.]),
    True([Khoảng cách từ tâm $I$ của mặt cầu $(S)$ đến mặt phẳng $(A B C)$ bằng $frac(5, 7)$.]),
    [Mặt phẳng $(A B C)$ và mặt cầu $(S)$ không có điểm chung.],
    True([Mặt cầu $(S)$ có tâm $I(1; 1; 1)$ và bán kính $R = 3$.]),
  ),
  
  loigiai: [
    - a) *Đúng*: Phương trình mặt phẳng theo đoạn chắn là $frac(x, 1) + frac(y, 2) + frac(z, 3) = 1 <=> 6x + 3y + 2z - 6 = 0$.
    - b) *Đúng*: Tâm mặt cầu là $I(1; 1; 1)$. Khoảng cách $d(I, (A B C)) = frac(|6(1) + 3(1) + 2(1) - 6|, sqrt(36 + 9 + 4)) = frac(5, 7)$.
    - c) *Sai*: Vì khoảng cách từ tâm đến mặt phẳng $d = 5/7 < R = 3$ nên mặt phẳng $(A B C)$ cắt mặt cầu $(S)$ theo một giao tuyến là đường tròn, tức là có vô số điểm chung.
    - d) *Đúng*: Nhìn trực tiếp từ phương trình mặt cầu $(S)$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hai đường thẳng $d_1: frac(x - 1, 2) = frac(y, -1) = frac(z - 1, 1)$ và $d_2: frac(x, 1) = frac(y - 1, 2) = frac(z + 1, -1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Đường thẳng $d_1$ đi qua điểm $M(1; 0; 1)$ và có vectơ chỉ phương $vec(u_1) = (2; -1; 1)$.]),
    True([Hai đường thẳng $d_1$ và $d_2$ chéo nhau.]),
    [Hai đường thẳng $d_1$ và $d_2$ vuông góc với nhau.],
    True([Mặt phẳng song song với cả $d_1$ và $d_2$ có một vectơ pháp tuyến là $vec(n) = (1; -3; -5)$.]),
  ),
  
  loigiai: [
    - a) *Đúng*: Đọc trực tiếp từ phương trình chính tắc của $d_1$.
    - b) *Đúng*: Ta có $vec(u_1) = (2; -1; 1)$, $vec(u_2) = (1; 2; -1)$. Lấy $M_1(1; 0; 1) in d_1$ và $M_2(0; 1; -1) in d_2$, ta có $vec(M_1 M_2) = (-1; 1; -2)$. Tích hỗn tạp $[vec(u_1), vec(u_2)] dot.c vec(M_1 M_2) = (-1; 3; 5) dot.c (-1; 1; -2) = 1 + 3 - 10 = -6 != 0$ nên hai đường thẳng chéo nhau.
    - c) *Sai*: Tích vô hướng $vec(u_1) dot.c vec(u_2) = 2(1) + (-1)(2) + 1(-1) = -1 != 0$ nên chúng không vuông góc.
    - d) *Đúng*: Vectơ pháp tuyến của mặt phẳng song song với cả hai đường thẳng chính là tích có hướng của hai vectơ chỉ phương: $[vec(u_1), vec(u_2)] = (-1; 3; 5) = -1(1; -3; -5)$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho điểm $A(1; 2; -1)$ và đường thẳng $d: frac(x-2, 1) = frac(y, 2) = frac(z-1, -1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Đường thẳng $d$ đi qua điểm $M(2; 0; 1)$ và có vectơ chỉ phương $vec(u) = (1; 2; -1)$.]),
    True([Vectơ $vec(A M) = (1; -2; 2)$.]),
    True([Tích có hướng của $vec(A M)$ và $vec(u)$ là $[vec(A M), vec(u)] = (-2; 3; 4)$.]),
    [Khoảng cách từ điểm $A$ đến đường thẳng $d$ bằng $sqrt(29)$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Dựa trực tiếp vào dạng chính tắc của đường thẳng $d$.
    - b) *Đúng*: Tính tọa độ vectơ: $vec(A M) = (2 - 1; 0 - 2; 1 - (-1)) = (1; -2; 2)$.
    - c) *Đúng*: Tính tích có hướng: $[vec(A M), vec(u)] = ((-2)(-1) - 2(2); 2(1) - 1(-1); 1(2) - (-2)(1)) = (-2; 3; 4)$.
    - d) *Sai*: Áp dụng công thức khoảng cách:
      $d(A, d) = frac(|[vec(A M), vec(u)]|, |vec(u)|) = frac(sqrt((-2)^2 + 3^2 + 4^2), sqrt(1^2 + 2^2 + (-1)^2)) = frac(sqrt(29), sqrt(6)) = sqrt(frac(29, 6)) != sqrt(29)$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hai mặt phẳng $(P): x + 2y - 2z + 1 = 0$ và $(Q): 2x + y + 2z - 3 = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ pháp tuyến của mặt phẳng $(P)$ là $vec(n_1) = (1; 2; -2)$ và của mặt phẳng $(Q)$ là $vec(n_2) = (2; 1; 2)$.]),
    True([Hai mặt phẳng $(P)$ và $(Q)$ vuông góc với nhau.]),
    True([Góc giữa hai mặt phẳng $(P)$ và $(Q)$ bằng $90^degree$.]),
    [Đường giao tuyến của hai mặt phẳng $(P)$ và $(Q)$ có một vectơ chỉ phương là $vec(u) = (1; 1; 1)$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Các hệ số trước $x, y, z$ trong các phương trình lần lượt là tọa độ vectơ pháp tuyến.
    - b) *Đúng*: Tích vô hướng của hai vectơ pháp tuyến là $vec(n_1) dot.c vec(n_2) = 1(2) + 2(1) + (-2)(2) = 0$.
    - c) *Đúng*: Vì hai mặt phẳng vuông góc với nhau nên góc giữa chúng bằng $90^degree$.
    - d) *Sai*: Vectơ chỉ phương của đường giao tuyến song song hoặc trùng với giá của tích có hướng $[vec(n_1), vec(n_2)]$:
      $[vec(n_1), vec(n_2)] = (4 - (-2); -4 - 2; 1 - 4) = (6; -6; -3) = 3(2; -2; -1)$, không cùng phương với $vec(u) = (1; 1; 1)$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, hai chiếc máy bay không người lái (UAV) tuần tra bay dọc theo hai đường thẳng chéo nhau lần lượt là $d_1: x = 1 + t, y = 2, z = 3 - t$ và $d_2: x = 2, y = 1 - s, z = s$ (đơn vị tọa độ là km). Để đảm bảo an toàn bay, hệ thống kiểm soát yêu cầu tính toán bình phương khoảng cách ngắn nhất giữa hai đường thẳng quỹ đạo bay này. Tính giá trị đó.],
  [$3$],
  
  loigiai: [
    #step[
      - Quỹ đạo bay $d_1$ đi qua $M_1(1; 2; 3)$ và có vectơ chỉ phương $vec(u_1) = (1; 0; -1)$.
      - Quỹ đạo bay $d_2$ đi qua $M_2(2; 1; 0)$ và có vectơ chỉ phương $vec(u_2) = (0; -1; 1)$.
    ]
    #step[
      - Tính tích có hướng của hai vectơ chỉ phương để xác định phương pháp tuyến chung:
        $vec(n) = [vec(u_1), vec(u_2)] = (0 - 1; 0 - 1; -1 - 0) = (-1; -1; -1)$.
    ]
    #step[
      - Tính vectơ nối hai điểm bất kỳ trên hai đường thẳng: $vec(M_1 M_2) = (1; -1; -3)$.
    ]
    #step[
      - Khoảng cách ngắn nhất giữa hai quỹ đạo bay là khoảng cách giữa hai đường thẳng chéo nhau:
        $d = frac(|[vec(u_1), vec(u_2)] dot.c vec(M_1 M_2)|, |[vec(u_1), vec(u_2)]|) = frac(|-1(1) - 1(-1) - 1(-3)|, sqrt(1 + 1 + 1)) = frac(3, sqrt(3)) = sqrt(3)$ km.
    ]
    #step[
      - Bình phương khoảng cách ngắn nhất là $d^2 = 3$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, sườn đồi phẳng của một thung lũng có phương trình mặt phẳng $(P): x - y + z - 3 = 0$. Hai trạm trung chuyển hàng hóa bằng drone được đặt tại các vị trí $A(2; 3; 1)$ và $B(4; 1; 3)$ (đơn vị tọa độ là km). Một kỹ sư thiết lập một trạm sạc tự động $M$ đặt trên sườn đồi $(P)$ sao cho tổng quãng đường bay thẳng $T = M A + M B$ từ trạm $A$ đến trạm sạc $M$ rồi bay tiếp đến trạm $B$ là ngắn nhất. Tìm tổng tọa độ $S = x_M + y_M + z_M$ của điểm đặt trạm sạc $M$ đó.],
  [$7$],
  
  loigiai: [
    #step[
      - Xét biểu thức vị trí tương đối của hai vị trí đặt trạm $A, B$ đối với mặt sườn đồi $(P)$:
        - $f(A) = 2 - 3 + 1 - 3 = -3 < 0$.
        - $f(B) = 4 - 1 + 3 - 3 = 3 > 0$.
    ]
    #step[
      - Vì $f(A) dot.c f(B) < 0$ nên hai trạm $A$ và $B$ nằm về hai phía khác nhau đối với mặt phẳng sườn đồi $(P)$. Do đó, tổng đường bay $M A + M B$ đạt giá trị nhỏ nhất khi và chỉ khi ba điểm $A, M, B$ thẳng hàng, tức là trạm sạc $M$ chính là giao điểm của đường bay thẳng $A B$ với mặt phẳng sườn đồi $(P)$.
    ]
    #step[
      - Viết phương trình tham số của đường thẳng đường bay thẳng $A B$ đi qua $A(2; 3; 1)$ có vectơ chỉ phương $vec(A B) = (2; -2; 2) = 2(1; -1; 1)$:
        $x = 2 + t, y = 3 - t, z = 1 + t$.
    ]
    #step[
      - Thay vào phương trình mặt phẳng sườn đồi $(P)$ để tìm tọa độ giao điểm $M$:
        $(2 + t) - (3 - t) + (1 + t) - 3 = 0 <=> 3t - 3 = 0 <=> t = 1$.
    ]
    #step[
      - Thế $t = 1$ ngược lại ta được tọa độ trạm sạc $M$ là $M(3; 2; 2)$.
      - Vậy tổng tọa độ là $S = 3 + 2 + 2 = 7$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai mặt phẳng song song $(P): 2x - y + 2z + 1 = 0$ và $(Q): 2x - y + 2z + 7 = 0$. Tính khoảng cách $d$ giữa hai mặt phẳng đó.],
  [$2$],
  
  loigiai: [
    #step[
      - Khoảng cách giữa hai mặt phẳng song song có dạng hệ số trước $x, y, z$ giống nhau:
        $d = frac(|D_1 - D_2|, sqrt(A^2 + B^2 + C^2))$.
    ]
    #step[
      - Thay số vào công thức:
        $d = frac(|7 - 1|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(6, sqrt(9)) = frac(6, 3) = 2$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho đường thẳng $d: frac(x-1, 2) = frac(y-2, 1) = frac(z-3, 2)$ và mặt phẳng $(P): x + 2y + 2z - 3 = 0$. Gọi $theta$ là góc giữa đường thẳng $d$ và mặt phẳng $(P)$. Tính giá trị của biểu thức $9 sin theta$.],
  [$8$],
  
  loigiai: [
    #step[
      - Tìm vectơ chỉ phương của $d$ là $vec(u) = (2; 1; 2)$ và vectơ pháp tuyến của $(P)$ là $vec(n) = (1; 2; 2)$.
    ]
    #step[
      - Tính góc giữa đường thẳng và mặt phẳng theo công thức:
        $sin theta = frac(|vec(u) dot.c vec(n)|, |vec(u)| dot.c |vec(n)|) = frac(|2(1) + 1(2) + 2(2)|, sqrt(4+1+4) dot.c sqrt(1+4+4)) = frac(|2 + 2 + 8|, 3 dot.c 3) = frac(8, 9)$.
    ]
    #step[
      - Nhân hai vế với 9:
        $9 sin theta = 8$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai đường thẳng $d_1$ và $d_2$ có các vectơ chỉ phương lần lượt là $vec(u_1) = (1; 1; 0)$ và $vec(u_2) = (1; 0; 1)$. Gọi $phi$ là góc giữa hai đường thẳng $d_1$ và $d_2$. Tính giá trị của biểu thức $10 cos phi$.],
  [$5$],
  
  loigiai: [
    #step[
      - Áp dụng công thức tính góc giữa hai đường thẳng dựa vào tích vô hướng và độ dài các vectơ chỉ phương:
        $cos phi = frac(|vec(u_1) dot.c vec(u_2)|, |vec(u_1)| dot.c |vec(u_2)|)$.
    ]
    #step[
      - Tính toán cụ thể các thành phần:
        - Tích vô hướng: $vec(u_1) dot.c vec(u_2) = 1(1) + 1(0) + 0(1) = 1$.
        - Độ dài: $|vec(u_1)| = sqrt(1^2 + 1^2 + 0^2) = sqrt(2)$, $|vec(u_2)| = sqrt(1^2 + 0^2 + 1^2) = sqrt(2)$.
    ]
    #step[
      - Suy ra $cos phi = frac(1, sqrt(2) dot.c sqrt(2)) = 1/2$.
    ]
    #step[
      - Vậy biểu thức $10 cos phi = 10 dot.c 1/2 = 5$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 9$ và mặt phẳng $(P): 2x + 2y - z + m = 0$. Tìm tổng tất cả các giá trị thực của tham số $m$ để mặt phẳng $(P)$ tiếp xúc với mặt cầu $(S)$.],
  [$-6$],
  
  loigiai: [
    #step[
      - Mặt cầu $(S)$ có tâm $I(1; 2; 3)$ và bán kính $R = 3$.
    ]
    #step[
      - Điều kiện tiếp xúc là khoảng cách từ tâm $I$ đến mặt phẳng $(P)$ bằng bán kính $R$:
        $d(I, (P)) = R <=> frac(|2(1) + 2(2) - 3 + m|, sqrt(2^2 + 2^2 + (-1)^2)) = 3 <=> frac(|m + 3|, 3) = 3$.
    ]
    #step[
      - Giải phương trình chứa dấu giá trị tuyệt đối:
        $|m + 3| = 9$.
        - Trường hợp 1: $m + 3 = 9 => m = 6$.
        - Trường hợp 2: $m + 3 = -9 => m = -12$.
    ]
    #step[
      - Tổng tất cả các giá trị thực của $m$ thỏa mãn là:
        $6 + (-12) = -6$.
    ]
  ],
))
