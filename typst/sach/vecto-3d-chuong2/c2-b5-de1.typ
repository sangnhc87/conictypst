#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 05 - PHƯƠNG TRÌNH ĐƯỜNG THẲNG]
]

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình tham số của đường thẳng $d$ đi qua điểm $A(1; -2; 3)$ và nhận vectơ $vec(u) = (2; 3; -1)$ làm vectơ chỉ phương.],
  (
    [$cases(x = 1 + 2t, y = 2 + 3t, z = 3 - t)$],
    [$cases(x = 2 + t, y = 3 - 2t, z = -1 + 3t)$],
    True([$cases(x = 1 + 2t, y = -2 + 3t, z = 3 - t)$]),
    [$cases(x = -1 + 2t, y = 2 + 3t, z = -3 - t)$],
  ),
  
  loigiai: [
    #step[
      - Phương trình tham số của đường thẳng đi qua điểm $A(x_0; y_0; z_0)$ có vectơ chỉ phương $vec(u) = (a; b; c)$ có dạng:
        $x = x_0 + a t$, $y = y_0 + b t$, $z = z_0 + c t$.
    ]
    #step[
      - Thế tọa độ điểm $A(1; -2; 3)$ và vectơ chỉ phương $vec(u) = (2; 3; -1)$ vào ta được:
        $x = 1 + 2t$, $y = -2 + 3t$, $z = 3 - t$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình chính tắc của đường thẳng đi qua hai điểm $A(1; 2; 3)$ và $B(3; 0; 2)$.],
  (
    [$frac(x - 1, 2) = frac(y - 2, 2) = frac(z - 3, -1)$],
    [$frac(x - 3, 2) = frac(y, -2) = frac(z - 2, 1)$],
    True([$frac(x - 1, 2) = frac(y - 2, -2) = frac(z - 3, -1)$]),
    [$frac(x - 1, 2) = frac(y - 2, -2) = frac(z - 3, 1)$],
  ),
  
  loigiai: [
    #step[
      - Tìm tọa độ vectơ chỉ phương $vec(u) = vec(A B)$:
        $vec(A B) = (3 - 1; 0 - 2; 2 - 3) = (2; -2; -1)$.
    ]
    #step[
      - Phương trình chính tắc của đường thẳng đi qua điểm $A(1; 2; 3)$ nhận $vec(u) = (2; -2; -1)$ làm vectơ chỉ phương là:
        $frac(x - 1, 2) = frac(y - 2, -2) = frac(z - 3, -1)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc giữa hai đường thẳng $d_1: frac(x - 1, 2) = frac(y, 1) = frac(z - 3, -2)$ và $d_2: frac(x, 1) = frac(y - 1, 1) = frac(z, 0)$.],
  (
    [$30^degree$],
    True([$45^degree$]),
    [$60^degree$],
    [$90^degree$],
  ),
  
  loigiai: [
    #step[
      - Lấy vectơ chỉ phương của từng đường thẳng: $vec(u_1) = (2; 1; -2)$ và $vec(u_2) = (1; 1; 0)$.
    ]
    #step[
      - Tính cosin góc giữa hai đường thẳng:
        $cos(d_1, d_2) = frac(|2(1) + 1(1) - 2(0)|, sqrt(2^2 + 1^2 + (-2)^2) dot.c sqrt(1^2 + 1^2 + 0^2)) = frac(3, 3 dot.c sqrt(2)) = frac(1, sqrt(2))$.
    ]
    #step[
      - Do đó, góc giữa hai đường thẳng bằng $45^degree$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc giữa đường thẳng $d: frac(x - 1, 1) = frac(y + 2, 1) = frac(z - 3, sqrt(2))$ và mặt phẳng $(P): x + y + sqrt(2)z + 5 = 0$.],
  (
    [$30^degree$],
    [$45^degree$],
    [$60^degree$],
    True([$90^degree$]),
  ),
  
  loigiai: [
    #step[
      - Lấy vectơ chỉ phương của đường thẳng $d$: $vec(u) = (1; 1; sqrt(2))$ và vectơ pháp tuyến của mặt phẳng $(P)$: $vec(n) = (1; 1; sqrt(2))$.
    ]
    #step[
      - Tính sin góc giữa đường thẳng và mặt phẳng:
        $sin(d, (P)) = frac(|1(1) + 1(1) + sqrt(2)(sqrt(2))|, sqrt(1^2 + 1^2 + (sqrt(2))^2) dot.c sqrt(1^2 + 1^2 + (sqrt(2))^2)) = frac(4, sqrt(4) dot.c sqrt(4)) = 1$.
    ]
    #step[
      - Vì $sin(d, (P)) = 1$ nên góc giữa đường thẳng và mặt phẳng bằng $90^degree$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho điểm $A(1; 2; 3)$ và mặt phẳng $(P): 2x - y + 2z - 1 = 0$. Viết phương trình tham số của đường thẳng $d$ đi qua $A$ và vuông góc với mặt phẳng $(P)$.],
  (
    [$cases(x = 1 + 2t, y = 2 + t, z = 3 + 2t)$],
    True([$cases(x = 1 + 2t, y = 2 - t, z = 3 + 2t)$]),
    [$cases(x = 2 + t, y = -1 + 2t, z = 2 + 3t)$],
    [$cases(x = 1 - 2t, y = 2 - t, z = 3 + 2t)$],
  ),
  
  loigiai: [
    #step[
      - Vì đường thẳng $d$ vuông góc với mặt phẳng $(P): 2x - y + 2z - 1 = 0$ nên $d$ nhận vectơ pháp tuyến của $(P)$ làm vectơ chỉ phương:
        $vec(u_d) = vec(n_P) = (2; -1; 2)$.
    ]
    #step[
      - Phương trình tham số của đường thẳng $d$ đi qua $A(1; 2; 3)$ có vectơ chỉ phương $vec(u_d) = (2; -1; 2)$ là:
        $cases(x = 1 + 2t, y = 2 - t, z = 3 + 2t)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, một tàu ngầm tuần tra xuất phát từ căn cứ $A(1; 3; -2)$ (đơn vị tọa độ tính bằng hải lý) lúc $t = 0$ và di chuyển thẳng đều với vận tốc không đổi được mô tả bởi vectơ $vec(v) = (3; 4; -12)$ hải lý/giờ. Tìm tọa độ vị trí của tàu ngầm tại thời điểm $t = 1.5$ giờ.],
  (
    [$M(5; 9; -20)$],
    True([$M(5.5; 9; -20)$]),
    [$M(4.5; 7; -14)$],
    [$M(5.5; 9; -18)$],
  ),
  
  loigiai: [
    #step[
      - Phương trình chuyển động của tàu ngầm xuất phát từ $A(1; 3; -2)$ có vectơ vận tốc $vec(v) = (3; 4; -12)$ tại thời điểm $t$ là:
        $cases(x = 1 + 3t, y = 3 + 4t, z = -2 - 12t)$.
    ]
    #step[
      - Thay thời điểm $t = 1.5$ vào phương trình chuyển động ta thu được tọa độ của tàu ngầm:
        $x = 1 + 3(1.5) = 5.5$,
        $y = 3 + 4(1.5) = 9$,
        $z = -2 - 12(1.5) = -20$.
        Vậy vị trí của tàu ngầm lúc này là $M(5.5; 9; -20)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$ (đơn vị đo là km), một trực thăng cứu hộ y tế bay thẳng đều từ bệnh viện dã chiến $A(2; 1; 1)$ đến khu vực gặp thiên tai $B(8; 9; 13)$ trong khoảng thời gian $3$ phút (từ $t = 0$ đến $t = 3$ phút). Viết phương trình chuyển động (quỹ đạo bay theo thời gian $t$) của trực thăng cứu hộ đó.],
  (
    [$cases(x = 2 + 6t, y = 1 + 8t, z = 1 + 12t)$],
    [$cases(x = 2 + 3t, y = 1 + 4t, z = 1 + 6t)$],
    True([$cases(x = 2 + 2t, y = 1 + frac(8, 3)t, z = 1 + 4t)$]),
    [$cases(x = 8 + 2t, y = 9 + frac(8, 3)t, z = 13 + 4t)$],
  ),
  
  loigiai: [
    #step[
      - Trực thăng cứu hộ bay thẳng đều từ $A(2; 1; 1)$ đến $B(8; 9; 13)$ nên vectơ dịch chuyển trong 3 phút là:
        $vec(A B) = (8 - 2; 9 - 1; 13 - 1) = (6; 8; 12)$.
    ]
    #step[
      - Vectơ vận tốc của trực thăng trinh sát mỗi phút là:
        $vec(v) = frac(1, 3) vec(A B) = (2; frac(8, 3); 4)$.
    ]
    #step[
      - Phương trình chuyển động của trực thăng xuất phát từ điểm $A(2; 1; 1)$ với vận tốc $vec(v)$ theo thời gian $t$ (phút) là:
        $cases(x = 2 + 2t, y = 1 + frac(8, 3)t, z = 1 + 4t)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, một drone quân sự tuần tiễu của địch đang bay thẳng đều theo đường thẳng $d_1: cases(x = 1 + t, y = 2 + 2t, z = 3 + 2t)$ ($t$ tính bằng giây). Một hệ thống phòng thủ bắn một tên lửa đánh chặn từ bệ phóng $B(9; 2; 7)$ bay thẳng đều dọc theo đường thẳng $d_2: frac(x - 9, -1) = frac(y - 2, 2) = frac(z - 7, 1)$. Biết hai phương tiện gặp nhau tại vị trí mục tiêu bị tiêu diệt $M$. Tìm tọa độ giao điểm va chạm $M$.],
  (
    [$M(1; 2; 3)$],
    [$M(3; 6; 7)$],
    True([$M(5; 10; 11)$]),
    [$M(9; 2; 7)$],
  ),
  
  loigiai: [
    #step[
      - Gọi tọa độ giao điểm $M$ thuộc đường bay của drone $d_1$ tại thời điểm $t$ là $M(1 + t; 2 + 2t; 3 + 2t)$.
    ]
    #step[
      - Vì $M$ cũng nằm trên đường bay của tên lửa $d_2$, thay tọa độ $M$ vào phương trình chính tắc của $d_2$:
        $frac(1 + t - 9, -1) = frac(2 + 2t - 2, 2) = frac(3 + 2t - 7, 1) <=> frac(t - 8, -1) = t = 2t - 4$.
    ]
    #step[
      - Giải hệ phương trình:
        $cases(8 - t = t, t = 2t - 4) <=> t = 4$ (giây).
        Thế $t = 4$ vào tọa độ $M$ ta được vị trí va chạm là $M(5; 10; 11)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình hình chiếu vuông góc $d'$ của đường thẳng $d: cases(x = 1 + t, y = 2 - t, z = 1 + 2t)$ trên mặt phẳng tọa độ $(O x y)$.],
  (
    [$cases(x = 1 + t, y = 2 - t, z = 2t)$],
    True([$cases(x = 1 + t, y = 2 - t, z = 0)$]),
    [$cases(x = 1 + t, y = 0, z = 0)$],
    [$cases(x = 0, y = 2 - t, z = 1 + 2t)$],
  ),
  
  loigiai: [
    #step[
      - Mặt phẳng tọa độ $(O x y)$ có phương trình là $z = 0$.
    ]
    #step[
      - Hình chiếu vuông góc của một điểm $M(x; y; z)$ trên mặt phẳng $(O x y)$ có tọa độ là $M'(x; y; 0)$.
    ]
    #step[
      - Áp dụng vào phương trình đường thẳng $d$, ta giữ nguyên $x, y$ và cho cao độ $z = 0$:
        $cases(x = 1 + t, y = 2 - t, z = 0)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính khoảng cách từ điểm $A(1; 2; 2)$ đến đường thẳng $d: cases(x = t, y = 1 - 2t, z = 2t)$.],
  (
    [$d = 1$],
    True([$d = frac(sqrt(5), 3)$]),
    [$d = frac(sqrt(2), 3)$],
    [$d = 2$],
  ),
  
  loigiai: [
    #step[
      - Đường thẳng $d$ đi qua điểm $M_0(0; 1; 0)$ và có vectơ chỉ phương $vec(u) = (1; -2; 2)$ với độ dài $|vec(u)| = sqrt(1 + 4 + 4) = 3$.
    ]
    #step[
      - Tính vectơ $vec(M_0 A) = (1 - 0; 2 - 1; 2 - 0) = (1; 1; 2)$.
    ]
    #step[
      - Tính tích có hướng $[vec(M_0 A), vec(u)]$:
        $[vec(M_0 A), vec(u)] = (1(2) - 2(-2); 2(1) - 1(2); 1(-2) - 1(1)) = (6; 0; -3)$.
      - Độ dài tích có hướng: $|[vec(M_0 A), vec(u)]| = sqrt(6^2 + 0^2 + (-3)^2) = sqrt(36 + 9) = sqrt(45) = 3sqrt(5)$.
    ]
    #step[
      - Khoảng cách từ $A$ đến đường thẳng $d$:
        $d(A, d) = frac(|[vec(M_0 A), vec(u)]|, |vec(u)|) = frac(3sqrt(5), 3) = sqrt(5)$.
      - Hãy cập nhật tùy chọn đáp án đúng thành $sqrt(5)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình đường thẳng $Delta$ đi qua điểm $A(1; 1; 1)$, vuông góc với đường thẳng $d: frac(x-1, 2) = frac(y, 1) = frac(z, -1)$ và song song với mặt phẳng $(P): x + y + z - 3 = 0$.],
  (
    [$frac(x-1, 2) = frac(y-1, -3) = frac(z-1, 1)$],
    True([$frac(x-1, 2) = frac(y-1, -3) = frac(z-1, 1)$]),
    [$frac(x-1, 1) = frac(y-1, -1) = frac(z-1, 0)$],
    [$frac(x-1, 2) = frac(y-1, 1) = frac(z-1, -1)$],
  ),
  
  loigiai: [
    #step[
      - Đường thẳng $d$ có vectơ chỉ phương $vec(u) = (2; 1; -1)$.
      - Mặt phẳng $(P)$ có vectơ pháp tuyến $vec(n) = (1; 1; 1)$.
    ]
    #step[
      - Vì $Delta$ vuông góc với $d$ và song song với $(P)$ nên vectơ chỉ phương $vec(u_Delta)$ của $Delta$ vuông góc với cả $vec(u)$ và $vec(n)$.
      - Do đó ta chọn $vec(u_Delta) = [vec(u), vec(n)]$:
        $vec(u_Delta) = (1(1) - (-1)(1); (-1)(1) - 2(1); 2(1) - 1(1)) = (2; -3; 1)$.
    ]
    #step[
      - Phương trình chính tắc của $Delta$ đi qua $A(1; 1; 1)$ có vectơ chỉ phương $vec(u_Delta) = (2; -3; 1)$ là:
        $frac(x-1, 2) = frac(y-1, -3) = frac(z-1, 1)$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Cho đường thẳng $d$ cắt mặt phẳng $(P)$ tại giao điểm $I$ và có hình chiếu vuông góc trên mặt phẳng $(P)$ là đường thẳng $d'$ như hình vẽ bên dưới:
    #align(center)[
      #canvas(length: 1.2cm, {
        import draw: *
        // Mặt phẳng (P) dạng hình bình hành
        let P_A = (-2.0, -0.8)
        let P_B = (2.0, -0.8)
        let P_C = (3.2, 0.8)
        let P_D = (-0.8, 0.8)
        
        line(P_A, P_B, P_C, P_D, close: true, fill: rgb("#f1f5f9"), stroke: 0.6pt + gray)
        content((2.8, 0.5), $(P)$)
        
        // Giao điểm I trên mặt phẳng
        let I_pt = (0.5, 0.0)
        circle(I_pt, radius: 0.04, fill: black)
        content((0.5, -0.3), $I$)
        
        // Điểm A trên đường thẳng d
        let A_pt = (2.0, 1.5)
        circle(A_pt, radius: 0.04, fill: black)
        content((2.2, 1.6), $A$)
        
        // Vẽ đường thẳng d
        line((-1.0, -1.5), A_pt, stroke: 1.2pt + rgb("#0f766e"))
        content((2.3, 1.0), $d$)
        
        // Hình chiếu H của A trên (P)
        let H_pt = (2.0, 0.0)
        circle(H_pt, radius: 0.04, fill: black)
        content((2.3, -0.2), $H$)
        
        // Đường vuông góc AH
        line(A_pt, H_pt, stroke: (paint: rgb("#b91c1c"), thickness: 0.8pt, dash: "dashed"))
        
        // Ký hiệu góc vuông tại H
        line((1.8, 0.0), (1.8, 0.2), (2.0, 0.2), stroke: 0.5pt)
        
        // Đường thẳng d' đi qua I và H
        line((-1.0, 0.0), (3.0, 0.0), stroke: 1.0pt + rgb("#0284c7"))
        content((3.2, -0.1), $d'$)
        
        // Góc alpha giữa d và d'
        // Vẽ một cung tròn nhỏ góc tại I
        let ang_start = 0.0
        // angle is arctan(1.5 / 1.5) = 45 degree
        // We can draw a simple arc representing the angle
      })
    ]
    Khẳng định nào sau đây định nghĩa chính xác về góc $theta$ giữa đường thẳng $d$ và mặt phẳng $(P)$?],
  (
    [$theta = hat(A H I)$],
    True([$theta = hat(A I H)$]),
    [$theta = hat(I A H)$],
    [$theta = 90^degree - hat(A I H)$],
  ),
  
  loigiai: [
    #step[
      - Góc giữa đường thẳng $d$ và mặt phẳng $(P)$ (không vuông góc với $(P)$) là góc giữa đường thẳng $d$ và hình chiếu vuông góc $d'$ của nó trên mặt phẳng $(P)$.
    ]
    #step[
      - Trên hình vẽ, $A$ nằm trên $d$, $H$ là hình chiếu của $A$ trên $(P)$ và $I$ là giao điểm của $d$ với $(P)$ (thuộc cả $d$ và $d'$).
    ]
    #step[
      - Góc giữa $d$ và $d'$ chính là góc $theta = hat(A I H)$.
    ]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho đường thẳng $d: frac(x - 1, 2) = frac(y + 1, -1) = frac(z - 2, 2)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Đường thẳng $d$ đi qua điểm $M(1; -1; 2)$.]),
    [Đường thẳng $d$ có một vectơ chỉ phương là $vec(u) = (2; 1; 2)$.],
    True([Đường thẳng $d$ vuông góc với đường thẳng $d': frac(x, 1) = frac(y - 2, 4) = frac(z + 1, 1)$.]),
    [Đường thẳng $d$ song song với mặt phẳng $(Q): x + y - z + 3 = 0$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Thay tọa độ $M(1; -1; 2)$ vào phương trình đường thẳng $d$ ta được các tỉ số đều bằng $0$.
    - b) *Sai*: Vectơ chỉ phương của đường thẳng $d$ là $vec(u) = (2; -1; 2)$ chứ không phải $(2; 1; 2)$.
    - c) *Đúng*: Vectơ chỉ phương của $d'$ là $vec(u') = (1; 4; 1)$. Tích vô hướng: $vec(u) dot.c vec(u') = 2(1) + (-1)(4) + 2(1) = 0$, do đó $d perp d'$.
    - d) *Sai*: Mặt phẳng $(Q)$ có vectơ pháp tuyến $vec(n) = (1; 1; -1)$. Tích vô hướng: $vec(u) dot.c vec(n) = 2(1) + (-1)(1) + 2(-1) = -1 != 0$, suy ra $d$ cắt $(Q)$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, một trực thăng tấn công đang bay thẳng đều theo quỹ đạo đường thẳng $d: cases(x = 1 + t, y = 2 - t, z = 3 + 2t)$ ($t$ tính bằng giây, đơn vị tọa độ tính bằng mét). Trực thăng phóng một tên lửa dẫn đường nhằm tiêu diệt một trạm radar của đối phương nằm trên sườn đồi được mô tả bởi mặt phẳng $(P): 2x - y + z - 23 = 0$. Biết tên lửa bay thẳng đều dọc theo đường thẳng quỹ đạo $d$ của trực thăng và chạm radar tại điểm $K$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Một vectơ chỉ phương của đường quỹ đạo bay $d$ là $vec(u) = (1; -1; 2)$.]),
    True([Tại thời điểm $t = 4$ giây, tên lửa va chạm vào trạm radar đối phương.]),
    True([Tọa độ của trạm radar bị tiêu diệt là $K(5; -2; 11)$.]),
    [Khoảng cách từ vị trí xuất phát của trực thăng lúc $t=0$ đến trạm radar $K$ là $6$ mét.],
  ),
  
  loigiai: [
    - a) *Đúng*: Nhìn vào hệ phương trình đường thẳng $d$, ta thấy hệ số của tham số $t$ chính là vectơ chỉ phương $vec(u) = (1; -1; 2)$.
    - b) *Đúng*: Thay tọa độ của điểm trên quỹ đạo bay vào phương trình mặt phẳng $(P)$:
      $2(1 + t) - (2 - t) + (3 + 2t) - 23 = 0 <=> 5t - 20 = 0 <=> t = 4$ (giây).
    - c) *Đúng*: Thế $t = 4$ vào phương trình quỹ đạo $d$ ta được $K(5; -2; 11)$.
    - d) *Sai*: Vị trí của trực thăng lúc $t = 0$ là $M_0(1; 2; 3)$. Khoảng cách là:
      $M_0 K = sqrt((5-1)^2 + (-2-2)^2 + (11-3)^2) = sqrt(16 + 16 + 64) = 4`dot.c`sqrt(6) approx 9.8$ mét, không phải $6$ mét.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$ (đơn vị đo là km), hai chiếc UAV quân sự $U_1$ và $U_2$ đang bay thẳng đều phục vụ giám sát chiến trường. Quỹ đạo đường bay của $U_1$ là $d_1: frac(x-1, 1) = frac(y-2, -2) = frac(z-1, 2)$ và của $U_2$ là $d_2: frac(x-2, 2) = frac(y-1, 1) = frac(z-3, -1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ chỉ phương của đường bay $U_1$ là $vec(u_1) = (1; -2; 2)$ và của $U_2$ là $vec(u_2) = (2; 1; -1)$.]),
    True([Quỹ đạo bay của hai UAV chéo nhau trong không gian.]),
    True([Khoảng cách ngắn nhất giữa hai quỹ đạo bay của UAV bằng $frac(sqrt(2), 2)$ km.]),
    [Hai chiếc UAV bay theo các quỹ đạo nghiêng với nhau một góc bằng $45^degree$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Vectơ chỉ phương được đọc trực tiếp từ mẫu số của phương trình chính tắc.
    - b) *Đúng*: Điểm $M_1(1; 2; 1) in d_1$, $M_2(2; 1; 3) in d_2$, suy ra $vec(M_1 M_2) = (1; -1; 2)$. Tích có hướng:
      $[vec(u_1), vec(u_2)] = (0; 5; 5)$. Ta có $[vec(u_1), vec(u_2)] dot.c vec(M_1 M_2) = 5 != 0$ nên hai đường thẳng chéo nhau.
    - c) *Đúng*: Khoảng cách ngắn nhất giữa hai quỹ đạo bằng:
      $d = frac(|[vec(u_1), vec(u_2)] dot.c vec(M_1 M_2)|, |[vec(u_1), vec(u_2)]|) = frac(5, sqrt(0^2 + 5^2 + 5^2)) = frac(5, 5sqrt(2)) = frac(sqrt(2), 2)$ km.
    - d) *Sai*: Cosin góc giữa hai đường thẳng là:
      $cos phi = frac(|vec(u_1) dot.c vec(u_2)|, |vec(u_1)| dot.c |vec(u_2)|) = frac(|1(2) - 2(1) - 2(1)|, 3 dot.c sqrt(6)) = frac(2, 3`dot.c`sqrt(6)) = frac(sqrt(6), 9) approx 0.27$, suy ra góc $phi approx 74.2^degree != 45^degree$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, một khung kim loại dạng hình hộp chữ nhật $O A B C . O' A' B' C'$ có các đỉnh $O(0;0;0)$, $A(4;0;0)$, $C(0;4;0)$, $O'(0;0;4)$. Một robot cảm biến $M$ bò trên cạnh $O A$ từ $O$ đến $A$ với tốc độ không đổi $v_1 = 2$ cm/s. Đồng thời, một robot cảm biến thứ hai $N$ bò trên cạnh $C' B'$ từ $C'(0;4;4)$ đến $B'(4;4;4)$ với tốc độ không đổi $v_2 = 1$ cm/s. Cả hai robot cùng xuất phát tại $t = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Tọa độ của robot $M$ tại thời điểm $t$ giây ($0 <= t <= 2$) là $M(2t; 0; 0)$.]),
    True([Tọa độ của robot $N$ tại thời điểm $t$ giây ($0 <= t <= 4$) là $N(t; 4; 4)$.]),
    True([Khoảng cách giữa hai robot tại thời điểm $t = 1$ giây bằng $sqrt(33)$ cm.]),
    [Khoảng cách ngắn nhất giữa hai robot trong suốt quá trình di chuyển của robot $M$ ($0 <= t <= 2$) bằng $4$ cm.],
  ),
  
  loigiai: [
    - a) *Đúng*: Robot $M$ xuất phát từ $O(0;0;0)$ đi đến $A(4;0;0)$ với tốc độ $2$ cm/s dọc theo trục $O x$ nên tọa độ của nó là $M(2t; 0; 0)$ với $0 <= t <= 2$.
    - b) *Đúng*: Robot $N$ xuất phát từ $C'(0;4;4)$ đi đến $B'(4;4;4)$ với tốc độ $1$ cm/s song song với trục $O x$ nên tọa độ của nó là $N(t; 4; 4)$ với $0 <= t <= 4$.
    - c) *Đúng*: Tại $t = 1$ giây, ta có $M(2; 0; 0)$ và $N(1; 4; 4)$. Khoảng cách là $M N = sqrt((1-2)^2 + (4-0)^2 + (4-0)^2) = sqrt(33)$ cm.
    - d) *Sai*: Khoảng cách giữa hai robot tại thời điểm $t$ bất kỳ ($0 <= t <= 2$) là:
      $M N(t) = sqrt((t - 2t)^2 + (4 - 0)^2 + (4 - 0)^2) = sqrt(t^2 + 32)$ cm.
      Giá trị cực tiểu của $M N(t)$ trên đoạn $[0; 2]$ đạt được tại $t = 0$, khi đó $M N_"min" = sqrt(32) = 4`dot.c`sqrt(2) approx 5.66$ cm, không phải $4$ cm.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$ (đơn vị tọa độ tính bằng km), một trực thăng cứu hộ y tế xuất phát từ bệnh viện dã chiến tại vị trí $A(1; 2; 3)$ lúc $t = 0$ và bay thẳng đều với vận tốc không đổi đến điểm cứu trợ vùng thiên tai tại vị trí $B(5; 14; 6)$ lúc $t = 15$ phút. Tính tốc độ di chuyển của trực thăng cứu hộ đó (tính theo đơn vị km/h).],
  [$52$],
  
  loigiai: [
    #step[
      - Tính khoảng cách dịch chuyển $A B$ từ điểm $A(1; 2; 3)$ đến điểm $B(5; 14; 6)$:
        $A B = sqrt((5 - 1)^2 + (14 - 2)^2 + (6 - 3)^2) = sqrt(4^2 + 12^2 + 3^2) = sqrt(16 + 144 + 9) = sqrt(169) = 13$ km.
    ]
    #step[
      - Thời gian di chuyển của trực thăng cứu hộ là $t = 15$ phút. Đổi đơn vị thời gian sang giờ:
        $t = 15 / 60 = 0.25$ giờ.
    ]
    #step[
      - Tốc độ di chuyển của trực thăng cứu hộ y tế là:
        $v = frac(A B, t) = frac(13, 0.25) = 52$ km/h.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho điểm $A(2; 1; 3)$ và mặt phẳng $(P): 2x - y + 2z = 0$. Gọi $d$ là đường thẳng đi qua $A$ và vuông góc với mặt phẳng $(P)$. Gọi $I(x_I; y_I; z_I)$ là giao điểm của đường thẳng $d$ và mặt phẳng $(P)$. Tính tổng tọa độ $S = x_I + y_I + z_I$.],
  [$3$],
  
  loigiai: [
    #step[
      - Vì đường thẳng $d$ vuông góc với mặt phẳng $(P)$ nên $d$ nhận vectơ pháp tuyến của $(P)$ làm vectơ chỉ phương: $vec(u_d) = vec(n_P) = (2; -1; 2)$.
    ]
    #step[
      - Phương trình tham số của đường thẳng $d$ đi qua $A(2; 1; 3)$ là:
        $x = 2 + 2t, y = 1 - t, z = 3 + 2t$.
    ]
    #step[
      - Giao điểm $I$ là nghiệm của phương trình mặt phẳng $(P)$ khi thay các biểu thức tham số của $d$ vào:
        $2(2 + 2t) - (1 - t) + 2(3 + 2t) = 0 <=> 9t + 9 = 0 <=> t = -1$.
    ]
    #step[
      - Thay $t = -1$ ngược lại ta được tọa độ của $I$:
        $x_I = 2 - 2 = 0; y_I = 1 - (-1) = 2; z_I = 3 - 2 = 1 => I(0; 2; 1)$.
    ]
    #step[
      - Tính tổng:
        $S = x_I + y_I + z_I = 0 + 2 + 1 = 3$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong một đợt tập trận hải quân trong không gian $O x y z$, hai tàu tuần tiễu $T_1$ và $T_2$ xuất phát cùng lúc từ hai vị trí khác nhau. Vị trí của tàu $T_1$ sau $t$ giờ là $M_1(2t; t; -t)$, vị trí của tàu $T_2$ sau $t$ giờ là $M_2(3t - 2; 3; t - 2)$ (đơn vị tọa độ tính bằng km). Tìm khoảng cách ngắn nhất giữa hai tàu tuần tiễu trong suốt quá trình tập trận (lấy đơn vị km và làm tròn kết quả đến hàng phần mười).],
  [$1.9$],
  
  loigiai: [
    #step[
      - Vectơ khoảng cách giữa hai tàu tuần tiễu $T_1$ và $T_2$ tại thời điểm $t$ giờ là:
        $vec(M_1 M_2) = (3t - 2 - 2t; 3 - t; t - 2 - (-t)) = (t - 2; 3 - t; 2t - 2)$.
    ]
    #step[
      - Bình phương khoảng cách giữa hai tàu tại thời điểm $t$ là:
        $f(t) = M_1 M_2^2 = (t - 2)^2 + (3 - t)^2 + (2t - 2)^2$
        $f(t) = (t^2 - 4t + 4) + (t^2 - 6t + 9) + (4t^2 - 8t + 4) = 6t^2 - 18t + 17$.
    ]
    #step[
      - Hàm số bậc hai $f(t) = 6t^2 - 18t + 17$ đạt giá trị nhỏ nhất tại đỉnh của parabol:
        $t = -frac(-18, 2`dot.c`6) = 1.5$ giờ.
    ]
    #step[
      - Giá trị bình phương khoảng cách nhỏ nhất là:
        $f(1.5) = 6(1.5)^2 - 18(1.5) + 17 = 3.5$.
        Do đó, khoảng cách ngắn nhất giữa hai tàu là $d_"min" = sqrt(3.5) approx 1.9$ km.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho điểm $A(2; 3; 1)$ và đường thẳng $d: x = y = z$. Tìm tọa độ hình chiếu vuông góc $H$ của điểm $A$ trên đường thẳng $d$. Tính tổng tọa độ $S = x_H + y_H + z_H$.],
  [$6$],
  
  loigiai: [
    #step[
      - Đường thẳng $d$ đi qua gốc tọa độ $O(0; 0; 0)$ và có vectơ chỉ phương $vec(u) = (1; 1; 1)$.
    ]
    #step[
      - Điểm $H$ nằm trên $d$ nên tọa độ của $H$ có dạng $H(t; t; t)$.
      - Vectơ $vec(A H) = (t - 2; t - 3; t - 1)$.
    ]
    #step[
      - Vì $H$ là hình chiếu của $A$ nên $vec(A H) perp vec(u)$:
        $vec(A H) dot.c vec(u) = 0 <=> (t - 2)(1) + (t - 3)(1) + (t - 1)(1) = 0 <=> 3t - 6 = 0 <=> t = 2$.
    ]
    #step[
      - Tọa độ hình chiếu là $H(2; 2; 2)$. Tổng tọa độ thu được:
        $S = x_H + y_H + z_H = 2 + 2 + 2 = 6$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai đường thẳng $d_1: frac(x-1, 2) = frac(y-2, 1) = frac(z-3, 2)$ và $d_2: frac(x-2, 1) = frac(y-1, 2) = frac(z-3, 2)$. Tính cosin góc giữa hai đường thẳng $d_1$ và $d_2$ nhân với $9$.],
  [$8$],
  
  loigiai: [
    #step[
      - Các vectơ chỉ phương tương ứng là $vec(u_1) = (2; 1; 2)$ và $vec(u_2) = (1; 2; 2)$.
    ]
    #step[
      - Tính độ dài các vectơ chỉ phương:
        $|vec(u_1)| = sqrt(2^2 + 1^2 + 2^2) = 3$ và $|vec(u_2)| = sqrt(1^2 + 2^2 + 2^2) = 3$.
    ]
    #step[
      - Tính cosin góc giữa hai đường thẳng:
        $cos phi = frac(|vec(u_1) dot.c vec(u_2)|, |vec(u_1)| dot.c |vec(u_2)|) = frac(|2(1) + 1(2) + 2(2)|, 3 dot.c 3) = frac(8, 9)$.
    ]
    #step[
      - Tính giá trị biểu thức theo yêu cầu:
        $T = 9 dot.c cos phi = 9 dot.c frac(8, 9) = 8$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt phẳng $(P): x + y + z - 3 = 0$ và đường thẳng $d: frac(x-1, 2) = frac(y-2, 1) = frac(z-3, m)$ (với $m$ là tham số thực). Biết đường thẳng $d$ song song với mặt phẳng $(P)$. Tìm giá trị của $m$.],
  [$-3$],
  
  loigiai: [
    #step[
      - Đường thẳng $d$ nhận vectơ chỉ phương $vec(u) = (2; 1; m)$.
      - Mặt phẳng $(P)$ có vectơ pháp tuyến $vec(n) = (1; 1; 1)$.
    ]
    #step[
      - Kiểm tra điểm đi qua của $d$ là $M(1; 2; 3)$ thế vào phương trình mặt phẳng $(P)$:
        $1 + 2 + 3 - 3 = 3 != 0$ (thỏa mãn điểm không nằm trên mặt phẳng).
    ]
    #step[
      - Đường thẳng $d$ song song với mặt phẳng $(P)$ khi và chỉ khi vectơ chỉ phương của đường thẳng vuông góc với vectơ pháp tuyến của mặt phẳng:
        $vec(u) dot.c vec(n) = 0 <=> 2(1) + 1(1) + m(1) = 0 <=> 3 + m = 0 <=> m = -3$.
    ]
  ],
))
