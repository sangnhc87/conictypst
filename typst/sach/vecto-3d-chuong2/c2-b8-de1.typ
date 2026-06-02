#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 08 - TOÁN THỰC TẾ VÀ TỐI ƯU HÌNH HỌC]
]

#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Một thiết bị bay (drone) chuyển động trong không gian với vectơ vận tốc đối với không khí là $vec(v)_1 = (3; 4; 2)$ (m/s). Biết gió thổi với vectơ vận tốc đối với mặt đất là $vec(v)_2 = (1; -2; 1)$ (m/s). Tính tốc độ (độ lớn vận tốc) của drone đối với mặt đất.],
  (
    [$5$ m/s],
    [$3sqrt(2)$ m/s],
    True([$sqrt(29)$ m/s]),
    [$sqrt(33)$ m/s],
  ),
  
  loigiai: [
    #step[Vận tốc thực tế của drone đối với mặt đất là tổng vectơ vận tốc của nó đối với không khí và vận tốc gió:
      $vec(v) = vec(v)_1 + vec(v)_2$.]
    #step[Tính tọa độ của $vec(v)$:
      $vec(v) = (3 + 1; 4 - 2; 2 + 1) = (4; 2; 3)$.]
    #step[Tốc độ của drone đối với mặt đất là độ dài của vectơ vận tốc thực tế:
      $v = |vec(v)| = sqrt(4^2 + 2^2 + 3^2) = sqrt(16 + 4 + 9) = sqrt(29)$ (m/s).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một kiến trúc sư đang thiết kế một tòa nhà dạng hình chóp có các đỉnh góc đáy nằm trên mặt đất lần lượt là $A(0; 0; 0)$, $B(4; 0; 0)$, $C(4; 4; 0)$, $D(0; 4; 0)$ và đỉnh chóp là $S(2; 2; 6)$. Viết phương trình mặt phẳng chứa mặt bên $(S A B)$.],
  (
    [$3x - z = 0$],
    True([$3y - z = 0$]),
    [$3y + z = 0$],
    [$x + y - z = 0$],
  ),
  
  loigiai: [
    #step[Mặt bên $(S A B)$ đi qua ba điểm $A(0; 0; 0)$, $B(4; 0; 0)$ và $S(2; 2; 6)$.]
    #step[Ta có $vec(A B) = (4; 0; 0)$ và $vec(A S) = (2; 2; 6)$.]
    #step[Vectơ pháp tuyến của mặt phẳng $(S A B)$ được chọn là tích có hướng của hai vectơ chỉ phương:
      $vec(n) = [vec(A B), vec(A S)] = (0 dot 6 - 0 dot 2; 0 dot 2 - 4 dot 6; 4 dot 2 - 0 dot 2) = (0; -24; 8)$.]
    #step[Rút gọn vectơ pháp tuyến ta được $vec(n') = (0; 3; -1)$. Phương trình mặt phẳng đi qua $A(0;0;0)$ là:
      $3(y - 0) - 1(z - 0) = 0 <=> 3y - z = 0$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong một cuộc tập trận phòng không bảo vệ biên giới, một tên lửa mục tiêu hành trình chuyển động thẳng đều với vận tốc không đổi $vec(v)_1 = (2; 3; 2)$ (km/phút), tại thời điểm $t = 0$ phút tên lửa này đang ở vị trí $A(8; 10; 11)$. Trạm phòng thủ mặt đất đặt tại gốc tọa độ $O(0; 0; 0)$ phóng một tên lửa đánh chặn chuyển động thẳng đều với vận tốc $vec(v)_c$ để bắn hạ mục tiêu tại thời điểm $t = 2$ phút. Tính tốc độ bay (km/phút) của tên lửa đánh chặn.],
  (
    [$12$ km/phút],
    True([$12.5$ km/phút]),
    [$15$ km/phút],
    [$10$ km/phút],
  ),
  
  loigiai: [
    #step[Tọa độ vị trí mục tiêu tại thời điểm $t$ là $M(t) = (8 + 2t; 10 + 3t; 11 + 2t)$.]
    #step[Tại thời điểm bị bắn hạ $t = 2$ phút, tọa độ của mục tiêu là:
      $M(2) = (8 + 2 dot.c 2; 10 + 3 dot.c 2; 11 + 2 dot.c 2) = (12; 16; 15)$.]
    #step[Tên lửa đánh chặn xuất phát từ gốc tọa độ $O(0; 0; 0)$ tại thời điểm $t = 0$ và gặp mục tiêu tại $M(2)$ sau $2$ phút. Khoảng cách bay của tên lửa đánh chặn là:
      $O M(2) = sqrt(12^2 + 16^2 + 15^2) = sqrt(144 + 256 + 225) = sqrt(625) = 25$ km.]
    #step[Tốc độ của tên lửa đánh chặn là quãng đường chia cho thời gian bay:
      $v_c = frac(O M(2), 2) = frac(25, 2) = 12.5$ (km/phút).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai điểm $A(1; 1; 2)$ và $B(3; 3; 2)$. Tìm tọa độ điểm $M$ thuộc mặt phẳng $(P): x + y + z - 9 = 0$ sao cho biểu thức $S = M A^2 + M B^2$ đạt giá trị nhỏ nhất.],
  (
    [$M(2; 2; 2)$],
    True([$M(3; 3; 3)$]),
    [$M(1; 4; 4)$],
    [$M(4; 4; 1)$],
  ),
  
  loigiai: [
    #step[Gọi $I$ là trung điểm của đoạn thẳng $A B$. Tọa độ của $I$ là $I(2; 2; 2)$.]
    #step[Áp dụng hệ thức vectơ đối với trung điểm, ta có:
      $M A^2 + M B^2 = 2M I^2 + frac(A B^2, 2)$.]
    #step[Do độ dài $A B$ không đổi, biểu thức $S$ đạt giá trị nhỏ nhất khi và chỉ khi khoảng cách $M I$ đạt giá trị nhỏ nhất. Điều này xảy ra khi $M$ chính là hình chiếu vuông góc của trung điểm $I$ trên mặt phẳng $(P)$.]
    #step[Đường thẳng qua $I(2;2;2)$ vuông góc với $(P)$ có phương trình tham số: $x = 2 + t, y = 2 + t, z = 2 + t$.
      Thay vào $(P): (2 + t) + (2 + t) + (2 + t) - 9 = 0 <=> 3t - 3 = 0 <=> t = 1$.
      Vậy $M(3; 3; 3)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một tấm pin năng lượng mặt trời được đặt cố định trên mặt phẳng $(P): 2x - y + 2z - 6 = 0$. Các tia sáng mặt trời chiếu xuống song song với vectơ chỉ phương $vec(u) = (1; 2; -2)$. Tính sin của góc $theta$ tạo bởi tia sáng mặt trời và bề mặt tấm pin.],
  (
    [$2/9$],
    True([$4/9$]),
    [$5/9$],
    [$1/3$],
  ),
  
  loigiai: [
    #step[Mặt phẳng $(P)$ của tấm pin có vectơ pháp tuyến là $vec(n) = (2; -1; 2)$ với độ dài $|vec(n)| = sqrt(2^2 + (-1)^2 + 2^2) = 3$.]
    #step[Tia sáng mặt trời song song với vectơ chỉ phương $vec(u) = (1; 2; -2)$ với độ dài $|vec(u)| = 3$.]
    #step[Tính sin của góc $theta$ giữa tia sáng (đường thẳng) và mặt phẳng tấm pin:
      $sin theta = frac(|vec(n) dot.c vec(u)|, |vec(n)| dot.c |vec(u)|) = frac(|2(1) - 1(2) + 2(-2)|, 3 dot.c 3) = frac(|2 - 2 - 4|, 9) = frac(4, 9)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong một mỏ khai khoáng sâu dưới lòng đất, người ta thiết lập hai đường hầm thẳng được mô tả lần lượt bởi hai đường thẳng chéo nhau $d_1: x = 1 + t, y = 2, z = 3 - t$ và $d_2: x = 2, y = 1 - s, z = s$ (đơn vị của tọa độ là trăm mét). Tính khoảng cách ngắn nhất giữa hai đường hầm này.],
  (
    [$100$ m],
    True([$100sqrt(3)$ m]),
    [$300$ m],
    [$50sqrt(6)$ m],
  ),
  
  loigiai: [
    #step[Đường thẳng $d_1$ đi qua $M_1(1; 2; 3)$ và có vectơ chỉ phương $vec(u)_1 = (1; 0; -1)$.]
    #step[Đường thẳng $d_2$ đi qua $M_2(2; 1; 0)$ và có vectơ chỉ phương $vec(u)_2 = (0; -1; 1)$.]
    #step[Tích có hướng của hai vectơ chỉ phương:
      $vec(n) = [vec(u)_1, vec(u)_2] = (-1; -1; -1)$, có độ lớn $|vec(n)| = sqrt((-1)^2 + (-1)^2 + (-1)^2) = sqrt(3)$.]
    #step[Vectơ liên kết giữa hai đường thẳng: $vec(M_1 M_2) = (1; -1; -3)$.]
    #step[Khoảng cách ngắn nhất giữa hai đường thẳng chéo nhau:
      $d(d_1, d_2) = frac(|vec(n) dot.c vec(M_1 M_2)|, |vec(n)|) = frac(|-1(1) - 1(-1) - 1(-3)|, sqrt(3)) = frac(3, sqrt(3)) = sqrt(3)$ (trăm mét).]
    #step[Quy đổi ra mét: $d = 100sqrt(3)$ mét.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một máy bay tiêm kích tuần tra dọc theo đường thẳng $d: frac(x-1, 2) = frac(y-2, 1) = frac(z-3, 2)$ với tốc độ không đổi. Tại thời điểm $t = 0$ phút, phi cơ ở vị trí $A(1; 2; 3)$. Tại thời điểm $t = 10$ phút, phi cơ ở vị trí $B(5; 4; 7)$ (đơn vị tọa độ là km). Tìm vectơ vận tốc $vec(v)$ (km/phút) của máy bay tiêm kích.],
  (
    [$vec(v) = (0.2; 0.1; 0.2)$],
    [$vec(v) = (0.8; 0.4; 0.8)$],
    True([$vec(v) = (0.4; 0.2; 0.4)$]),
    [$vec(v) = (2; 1; 2)$],
  ),
  
  loigiai: [
    #step[Đường bay đi qua điểm xuất phát $A(1; 2; 3)$ và điểm $B(5; 4; 7)$ sau $10$ phút.]
    #step[Vectơ dịch chuyển của máy bay từ $t = 0$ đến $t = 10$ phút là:
      $vec(A B) = (5 - 1; 4 - 2; 7 - 3) = (4; 2; 4)$.]
    #step[Do máy bay chuyển động thẳng đều, vectơ vận tốc $vec(v)$ của máy bay bằng vectơ dịch chuyển chia cho khoảng thời gian di chuyển:
      $vec(v) = frac(vec(A B), 10) = frac((4; 2; 4), 10) = (0.4; 0.2; 0.4)$ (km/phút).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một trạm thu phát sóng di động đặt tại đỉnh đồi có tọa độ $A(1; 1; 1)$. Một máy bay chuyển động thẳng đều dọc theo đường thẳng $d: y = 2, z = 2$ (đơn vị: km). Hãy tính khoảng cách ngắn nhất từ máy bay đến trạm thu phát sóng $A$.],
  (
    [$2$ km],
    True([$sqrt(2)$ km]),
    [$sqrt(3)$ km],
    [$1$ km],
  ),
  
  loigiai: [
    #step[Máy bay ở vị trí $M(x; y; z)$ nằm trên đường thẳng $d$, nên tọa độ của máy bay có dạng $M(x; 2; 2)$.]
    #step[Khoảng cách từ trạm $A(1; 1; 1)$ đến máy bay là:
      $A M = sqrt((x - 1)^2 + (2 - 1)^2 + (2 - 1)^2) = sqrt((x - 1)^2 + 2)$.]
    #step[Khoảng cách $A M$ đạt giá trị nhỏ nhất khi và chỉ khi $(x - 1)^2 = 0 <=> x = 1$.]
    #step[Khi đó, khoảng cách ngắn nhất là $A M_"min" = sqrt(2)$ km.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Để xây dựng hệ thống ống dẫn nước thải công nghiệp từ nhà máy $A(1; 2; 0)$ và nhà máy $B(5; 6; 0)$ ra một đường ống trung chuyển chính đặt dọc theo trục hoành $O x$ (các nhà máy và đường ống đều nằm trên mặt phẳng mặt đất $O x y$). Tìm tọa độ điểm đấu nối $M(x; 0; 0)$ trên trục $O x$ để tổng chiều dài đường ống dẫn $A M + M B$ ngắn nhất.],
  (
    [$M(1; 0; 0)$],
    True([$M(2; 0; 0)$]),
    [$M(3; 0; 0)$],
    [$M(4; 0; 0)$],
  ),
  
  loigiai: [
    #step[Do cao độ của $A, B$ và $M$ đều bằng $0$, bài toán được đưa về mặt phẳng tọa độ $O x y$. Các điểm $A(1; 2)$ và $B(5; 6)$ đều nằm ở nửa mặt phẳng dương $y > 0$ phía trên trục $O x$.]
    #step[Gọi $A'$ là điểm đối xứng của $A$ qua trục $O x$. Tọa độ điểm $A'$ là $A'(1; -2)$.]
    #step[Với mọi điểm $M in O x$, ta có $A M = A' M$, do đó:
      $A M + M B = A' M + M B >= A' B$.]
    #step[Tổng khoảng cách ngắn nhất khi $M$ là giao điểm của đoạn thẳng $A' B$ với trục $O x$.]
    #step[Đường thẳng $A' B$ đi qua $A'(1; -2)$ và có vectơ chỉ phương $vec(A' B) = (4; 8) = 4(1; 2)$.
      Phương trình tham số của $A' B$: $x = 1 + t, y = -2 + 2t$.]
    #step[Giao điểm $M$ với trục $O x$ ứng với $y = 0 <=> -2 + 2t = 0 <=> t = 1$.
      Thế $t=1$ vào hoành độ: $x_M = 1 + 1 = 2$. Vậy $M(2; 0; 0)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong một tình huống giả định tác chiến hải quân, hai chiếc tiêm kích hạm $S_1$ và $S_2$ di chuyển thẳng đều trong không gian. Tại thời điểm $t$ (giờ), vị trí của $S_1$ là $M_1(1+t; 4; 3+t)$ và vị trí của $S_2$ là $M_2(2+2t; 1+2t; 1+3t)$ (đơn vị tọa độ là km). Tìm khoảng cách ngắn nhất (km) giữa hai tiêm kích hạm trong suốt quá trình bay.],
  (
    [$3$ km],
    [$sqrt(3)$ km],
    True([$sqrt(5)$ km]),
    [$5$ km],
  ),
  
  loigiai: [
    #step[Vectơ khoảng cách giữa hai tiêm kích hạm tại thời điểm $t$ là:
      $vec(M_1 M_2)(t) = ( (2 + 2t) - (1 + t); (1 + 2t) - 4; (1 + 3t) - (3 + t) ) = (t + 1; 2t - 3; 2t - 2)$.]
    #step[Bình phương khoảng cách giữa hai tiêm kích hạm là:
      $d^2(t) = (t + 1)^2 + (2t - 3)^2 + (2t - 2)^2$
      $d^2(t) = (t^2 + 2t + 1) + (4t^2 - 12t + 9) + (4t^2 - 8t + 4) = 9t^2 - 18t + 14$.]
    #step[Biến đổi biểu thức bậc hai theo $t$:
      $d^2(t) = 9(t^2 - 2t + 1) + 5 = 9(t - 1)^2 + 5$.]
    #step[Giá trị nhỏ nhất của $d^2(t)$ là $5$ đạt được khi $t = 1$ giờ.
      Do đó, khoảng cách ngắn nhất giữa hai chiếc tiêm kích hạm là $sqrt(5)$ km.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một chất điểm đặt tại gốc tọa độ $O(0; 0; 0)$ chịu tác dụng đồng thời của ba lực trong không gian: $vec(F)_1 = (1; 2; 3)$ (N), $vec(F)_2 = (3; 4; 5)$ (N) và $vec(F)_3$ (N). Biết chất điểm vẫn tiếp tục đứng yên ở trạng thái cân bằng lực. Xác định tọa độ của lực $vec(F)_3$.],
  (
    [$(4; 6; 8)$],
    True([$(-4; -6; -8)$]),
    [$(-2; -2; -2)$],
    [$(1; 1; 1)$],
  ),
  
  loigiai: [
    #step[Chất điểm đứng yên cân bằng lực khi và chỉ khi hợp lực của các lực tác dụng lên nó bằng vectơ không.]
    #step[Ta có phương trình cân bằng:
      $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0) <=> vec(F)_3 = -(vec(F)_1 + vec(F)_2)$.]
    #step[Tính tổng tọa độ của hai lực đầu tiên:
      $vec(F)_1 + vec(F)_2 = (1 + 3; 2 + 4; 3 + 5) = (4; 6; 8)$.]
    #step[Suy ra tọa độ của lực $vec(F)_3$ là $(-4; -6; -8)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Hình vẽ dưới đây biểu diễn một thiết bị bay cứu hộ $A$ trong không gian $O x y z$ cùng với hình chiếu $H$ của nó trên mặt phẳng mặt đất $(O x y)$.

  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      // Trục Oz (thẳng đứng)
      line((0,0), (0, 3.5), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt + rgb("#5b21b6"))
      content((0.3, 3.5), $z$)
      
      // Trục Oy (nằm ngang sang phải)
      line((0,0), (4.5, 0), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt + rgb("#5b21b6"))
      content((4.5, -0.3), $y$)
      
      // Trục Ox (hướng chéo xuống góc trái)
      line((0,0), (-2.2, -1.8), mark: (end: "stealth", scale: 0.5), stroke: 0.8pt + rgb("#5b21b6"))
      content((-2.4, -1.8), $x$)
      
      content((-0.3, 0.3), $O$)
      
      let H = (1.5, -1.2)
      let A = (1.5, 1.8)
      
      // Vẽ nét đứt dóng tọa độ từ H lên các trục
      line(H, (3, 0), stroke: (paint: gray, dash: "dashed"))
      line(H, (-1.5, -1.2), stroke: (paint: gray, dash: "dashed"))
      
      // Vẽ nét dóng từ A xuống H
      line(A, H, stroke: (paint: rgb("#b91c1c"), dash: "dashed"))
      
      // Điểm A và H
      circle(A, radius: 0.07, fill: rgb("#b91c1c"))
      circle(H, radius: 0.05, fill: gray)
      
      // Nhãn các điểm
      content((2.0, 2.1), $A(x_A; y_A; z_A)$)
      content((2.1, -1.4), $H(x_A; y_A; 0)$)
      
      // Đường nối từ O đến A
      line((0,0), A, stroke: 1pt + rgb("#0284c7"))
    })
  ]

  Giả sử thiết bị bay được treo cân bằng dưới tác dụng của 3 lực căng dây $vec(F)_1, vec(F)_2, vec(F)_3$ cùng với trọng lực $vec(P)$. Khẳng định nào sau đây diễn tả đúng điều kiện cân bằng cơ học của vật?],
  (
    [$vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(P)$],
    True([$vec(F)_1 + vec(F)_2 + vec(F)_3 + vec(P) = vec(0)$]),
    [$vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$],
    [$vec(F)_1 + vec(F)_2 + vec(F)_3 - vec(P) = vec(0)$],
  ),
  
  loigiai: [
    #step[Theo định luật II Newton, điều kiện cân bằng lực của một chất điểm chịu tác dụng của nhiều lực là tổng vectơ của tất cả các lực đó phải bằng vectơ không.]
    #step[Các lực tác dụng lên thiết bị bay bao gồm: ba lực căng dây $vec(F)_1, vec(F)_2, vec(F)_3$ và trọng lực $vec(P)$.]
    #step[Do đó phương trình cân bằng cơ học là: $vec(F)_1 + vec(F)_2 + vec(F)_3 + vec(P) = vec(0)$.]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong một kịch bản tác chiến phòng không, một trạm radar cảnh giới mặt đất được đặt tại gốc tọa độ $O(0; 0; 0)$ có bán kính quét tối đa là $R = 4$ km. Một máy bay ném bom đối phương bay thẳng đều dọc theo đường thẳng $d: frac(x-7, 2) = frac(y-4, 2) = frac(z-5, 1)$ (đơn vị tọa độ là km). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ chỉ phương của đường bay máy bay là $vec(u) = (2; 2; 1)$.]),
    True([Tại thời điểm máy bay gần trạm radar nhất, tọa độ của nó là $(1; -2; 2)$.]),
    True([Khoảng cách ngắn nhất từ máy bay đến trạm radar bằng $3$ km.]),
    [Máy bay ném bom của đối phương hoàn toàn nằm ngoài tầm quét của hệ thống radar cảnh giới này.],
  ),
  
  loigiai: [
    #step[a) Đúng, nhìn vào các mẫu số của phương trình đường thẳng $d$, ta rút ra vectơ chỉ phương là $vec(u) = (2; 2; 1)$.]
    #step[b) Đúng, gọi vị trí máy bay tại thời điểm bất kỳ là $M(7 + 2t; 4 + 2t; 5 + t)$. Vectơ liên kết $vec(O M) = (7 + 2t; 4 + 2t; 5 + t)$. Máy bay ở gần $O$ nhất khi $vec(O M) perp vec(u) <=> vec(O M) dot.c vec(u) = 0 <=> 2(7 + 2t) + 2(4 + 2t) + 1(5 + t) = 0 <=> 9t + 27 = 0 <=> t = -3$. Thế $t = -3$ vào tọa độ $M$ ta được vị trí gần nhất là $(1; -2; 2)$.]
    #step[c) Đúng, khoảng cách ngắn nhất là $O M_"min" = sqrt(1^2 + (-2)^2 + 2^2) = sqrt(9) = 3$ km.]
    #step[d) Sai, vì khoảng cách ngắn nhất giữa máy bay và trạm radar là $3$ km, nhỏ hơn bán kính quét tối đa $R = 4$ km, nên máy bay sẽ đi vào tầm quét của radar (tại khu vực gần nhất).]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một tháp truyền hình được dựng thẳng đứng trên mặt đất có đỉnh tháp tại $S(0; 0; 30)$ (đơn vị mét). Một dây cáp được căng thẳng từ đỉnh tháp $S$ đến điểm neo cố định $A(10; 20; 0)$ trên mặt đất. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Độ dài của sợi dây cáp $S A$ bằng $10sqrt(14)$ mét.]),
    [Cosin của góc tạo bởi dây cáp $S A$ và mặt đất bằng $frac(3, sqrt(14))$.],
    True([Phương trình chính tắc của đường thẳng chứa sợi dây cáp $S A$ là $frac(x, 1) = frac(y, 2) = frac(z - 30, -3)$.]),
    [Khoảng cách từ gốc tọa độ $O(0; 0; 0)$ (chân tháp) đến sợi dây cáp $S A$ lớn hơn $20$ mét.],
  ),
  
  loigiai: [
    #step[a) Đúng, độ dài $S A = sqrt((10 - 0)^2 + (20 - 0)^2 + (0 - 30)^2) = sqrt(100 + 400 + 900) = sqrt(1400) = 10sqrt(14)$ mét.]
    #step[b) Sai, góc giữa $S A$ và mặt đất chính là góc $S A H$ với $H$ là chân tháp $O(0;0;0)$. Ta có $O A = sqrt(10^2 + 20^2) = 10sqrt(5)$. Cosin góc giữa dây cáp và mặt đất là: $cos(S A, (O x y)) = frac(O A, S A) = frac(10sqrt(5), 10sqrt(14)) = sqrt(frac(5, 14))$.]
    #step[c) Đúng, đường thẳng $S A$ đi qua $S(0; 0; 30)$ và có VCP $vec(S A) = (10; 20; -30) = 10(1; 2; -3)$. Phương trình chính tắc là $frac(x, 1) = frac(y, 2) = frac(z - 30, -3)$.]
    #step[d) Sai, tính khoảng cách từ $O$ đến $S A$: $d(O, S A) = frac(|[vec(O S), vec(S A)]|, |vec(S A)|)$.
      Ta có $vec(O S) = (0; 0; 30)$, $vec(S A) = (10; 20; -30) => [vec(O S), vec(S A)] = (-600; 300; 0)$.
      Khoảng cách $d(O, S A) = frac(sqrt((-600)^2 + 300^2), 10sqrt(14)) = frac(300sqrt(5), 10sqrt(14)) = frac(30sqrt(5), sqrt(14)) approx 17.9$ mét $< 20$ mét.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một nhóm kỹ sư đang xây dựng hai đường hầm thẳng qua núi. Trong hệ tọa độ Oxyz (đơn vị đo là mét), đường hầm thứ nhất đi dọc theo đường thẳng $d_1: frac(x-1, 2) = frac(y-1, 1) = frac(z-2, 2)$, đường hầm thứ hai đi dọc theo đường thẳng $d_2: frac(x-3, 1) = frac(y-2, 2) = frac(z-4, 2)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Vectơ chỉ phương của hai đường hầm lần lượt là $vec(u)_1 = (2; 1; 2)$ và $vec(u)_2 = (1; 2; 2)$.]),
    [Hai đường hầm song song với nhau trong không gian núi.],
    True([Góc $alpha$ tạo bởi hai đường hầm thỏa mãn $cos alpha = frac(8, 9)$.]),
    True([Hai đường hầm trên thực tế giao nhau (cắt nhau) tại một điểm.]),
  ),
  
  loigiai: [
    #step[a) Đúng, nhìn từ mẫu số các phương trình chính tắc ta rút ra $vec(u)_1 = (2; 1; 2)$ và $vec(u)_2 = (1; 2; 2)$.]
    #step[b) Sai, do $vec(u)_1$ và $vec(u)_2$ không cùng tỉ lệ tọa độ ($2/1 != 1/2$) nên chúng không song song.]
    #step[c) Đúng, góc giữa hai đường thẳng thỏa mãn:
      $cos alpha = frac(|vec(u)_1 dot.c vec(u)_2|, |vec(u)_1| dot.c |vec(u)_2|) = frac(|2(1) + 1(2) + 2(2)|, sqrt(4+1+4) dot.c sqrt(1+4+4)) = frac(8, 3 dot.c 3) = frac(8, 9)$.]
    #step[d) Đúng, xét vị trí tương đối:
      $d_1$ qua $M_1(1; 1; 2)$, $d_2$ qua $M_2(3; 2; 4) => vec(M_1 M_2) = (2; 1; 2)$.
      Ta có tích có hướng $[vec(u)_1, vec(u)_2] = (-2; -2; 3)$.
      Tích hỗn tạp: $[vec(u)_1, vec(u)_2] dot.c vec(M_1 M_2) = -2(2) - 2(1) + 3(2) = -4 - 2 + 6 = 0$.
      Vì tích hỗn tạp bằng $0$ và hai vectơ chỉ phương không cùng phương nên hai đường thẳng cắt nhau.]
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, một mô hình thiết bị vật lý gồm phòng thí nghiệm dạng hình lập phương $O A B C . O' A' B' C'$ có cạnh bằng $6$ dm với các đỉnh $O(0;0;0)$, $A(6;0;0)$, $C(0;6;0)$, $O'(0;0;6)$. Một robot cảm biến $M$ bắt đầu từ $O(0;0;0)$ di chuyển dọc theo cạnh $O A$ đến $A$ với tốc độ không đổi $v_1 = 2$ dm/s. Đồng thời, một thiết bị phát bức xạ $N$ bắt đầu từ đỉnh $C'(0;6;6)$ di chuyển dọc theo cạnh $C' O'$ đến $O'$ với tốc độ không đổi $v_2 = 1$ dm/s. Xét tính Đúng/Sai của các phát biểu sau:],
  (
    True([Tọa độ của cảm biến $M$ tại thời điểm $t$ giây ($0 <= t <= 3$) là $M(2t; 0; 0)$.]),
    True([Tọa độ của thiết bị $N$ tại thời điểm $t$ giây ($0 <= t <= 6$) là $N(0; 6 - t; 6)$.]),
    True([Khoảng cách giữa cảm biến $M$ và thiết bị $N$ tại thời điểm $t = 2$ giây bằng $2sqrt(17)$ dm.]),
    [Khoảng cách ngắn nhất giữa $M$ và $N$ trong suốt quá trình chuyển động của chúng đạt giá trị bằng $2sqrt(5)$ dm.],
  ),
  
  loigiai: [
    #step[a) Đúng, robot $M$ di chuyển trên tia $O x$ xuất phát từ gốc tọa độ $O$ với tốc độ $2$ dm/s nên có tọa độ $M(2t; 0; 0)$ tại thời điểm $t$.]
    #step[b) Đúng, thiết bị $N$ xuất phát từ $C'(0;6;6)$ đi về $O'(0;0;6)$ tức là đi song song với trục $O y$ theo hướng ngược chiều dương, tọa độ $y$ giảm dần với tốc độ $1$ dm/s, do đó tọa độ của nó là $N(0; 6-t; 6)$.]
    #step[c) Đúng, tại $t = 2$ giây ta có $M(4; 0; 0)$ và $N(0; 4; 6)$. Khoảng cách giữa chúng là: $M N = sqrt((0 - 4)^2 + (4 - 0)^2 + (6 - 0)^2) = sqrt(16 + 16 + 36) = sqrt(68) = 2sqrt(17)$ dm.]
    #step[d) Sai, bình phương khoảng cách giữa $M$ và $N$ tại thời điểm $t$ ($0 <= t <= 3$) là: $f(t) = M N^2 = (2t - 0)^2 + (0 - (6 - t))^2 + (0 - 6)^2 = 4t^2 + (t - 6)^2 + 36 = 5t^2 - 12t + 72$.
      Xét hàm số $f(t) = 5t^2 - 12t + 72$ trên $[0; 3]$, hoành độ đỉnh parabol là $t = 1.2 in [0; 3]$.
      Giá trị nhỏ nhất của $f(t)$ bằng $f(1.2) = 5(1.2)^2 - 12(1.2) + 72 = 64.8$.
      Do đó, khoảng cách ngắn nhất là $sqrt(64.8) = frac(18sqrt(5), 5) approx 8.05$ dm (khác $2sqrt(5) approx 4.47$ dm).]
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Một tấm pin năng lượng mặt trời nằm trên mặt phẳng $(P): x + 2y + 2z - 12 = 0$. Các tia sáng mặt trời chiếu xuống song song với vectơ $vec(u) = (2; 2; 1)$. Gọi $theta$ là góc giữa tia sáng mặt trời và tấm pin. Tính giá trị của biểu thức $K = 9 sin theta$.],
  [$8$],
  
  loigiai: [
    #step[Mặt phẳng $(P)$ chứa tấm pin có vectơ pháp tuyến là $vec(n) = (1; 2; 2)$.]
    #step[Tia sáng mặt trời song song với vectơ chỉ phương $vec(u) = (2; 2; 1)$.]
    #step[Tính sin của góc $theta$ tạo bởi đường thẳng chiếu sáng và mặt phẳng tấm pin:
      $sin theta = frac(|vec(u) dot.c vec(n)|, |vec(u)| dot.c |vec(n)|) = frac(|1(2) + 2(2) + 2(1)|, sqrt(1^2 + 2^2 + 2^2) dot.c sqrt(2^2 + 2^2 + 1^2))$.]
    #step[Tính cụ thể các tích:
      $sin theta = frac(|2 + 4 + 2|, sqrt(9) dot.c sqrt(9)) = frac(8, 3 dot.c 3) = frac(8, 9)$.]
    #step[Suy ra $K = 9 sin theta = 8$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một người đi bộ muốn di chuyển từ vị trí $A(1; 1; 2)$ đến một con kênh được mô phỏng bởi đường thẳng $d: x = t, y = 2, z = 0$ để lấy nước, sau đó đi tiếp đến điểm $B(3; 1; 2)$. Tìm bình phương khoảng cách ngắn nhất của toàn bộ quãng đường mà người đó phải đi (tức là giá trị nhỏ nhất của $(A M + M B)^2$ với $M in d$).],
  [$24$],
  
  loigiai: [
    #step[Nhận xét: Hai điểm $A(1; 1; 2)$ và $B(3; 1; 2)$ có tính chất đối xứng qua mặt phẳng trung trực của đoạn thẳng $A B$ là mặt phẳng $(Q): x = 2$.]
    #step[Con kênh là đường thẳng $d$ nằm trên mặt phẳng $y = 2, z = 0$. Mọi điểm $M in d$ có tọa độ $M(t; 2; 0)$.]
    #step[Bằng cách lập luận hình học đối xứng hoặc khảo sát hàm khoảng cách theo tham số $t$, ta thấy tổng khoảng cách $A M + M B$ đạt giá trị nhỏ nhất khi $M$ nằm chính giữa (theo tọa độ hoành độ $x$) của $A$ và $B$, tức là $t = 2$.
      Vậy điểm tối ưu là $M(2; 2; 0)$.]
    #step[Tính khoảng cách nhỏ nhất đó:
      $A M = sqrt((2 - 1)^2 + (2 - 1)^2 + (0 - 2)^2) = sqrt(1 + 1 + 4) = sqrt(6)$.
      Do đối xứng nên $B M = A M = sqrt(6)$.]
    #step[Tổng quãng đường đi cực tiểu là:
      $d_"min" = A M + M B = 2sqrt(6)$.
      Bình phương quãng đường đi cực tiểu là: $(2sqrt(6))^2 = 24$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong một buổi diễn tập phòng thủ chống tên lửa tầm thấp, tên lửa mục tiêu của đối phương di chuyển thẳng đều theo đường bay $d_1: frac(x-10, 1) = frac(y-20, 2) = frac(z-15, 2)$ với tốc độ không đổi $v_1 = 3$ km/s. Tại thời điểm $t = 0$, tên lửa mục tiêu đi qua vị trí $A(10; 20; 15)$. Tên lửa đánh chặn của ta được phóng đi từ bệ phóng $B(5; 10; 5)$ với vận tốc không đổi $vec(v)_2 = (a; b; c)$ để bắn hạ mục tiêu tại thời điểm $t = 5$ giây. Tính tốc độ của tên lửa đánh chặn theo đơn vị km/s (biết các đơn vị tọa độ tính bằng km).],
  [$6$],
  
  loigiai: [
    #step[Vectơ chỉ phương của đường bay mục tiêu $d_1$ là $vec(u) = (1; 2; 2)$ có độ dài $|vec(u)| = sqrt(1^2 + 2^2 + 2^2) = 3$.]
    #step[Do tốc độ của mục tiêu là $v_1 = 3$ km/s và độ dài vectơ chỉ phương $|vec(u)| = 3$ nên vectơ vận tốc của tên lửa mục tiêu chính bằng $vec(v)_1 = vec(u) = (1; 2; 2)$ (km/s).]
    #step[Tại thời điểm $t = 5$ giây, tọa độ của mục tiêu là:
      $M(5) = A + 5 vec(v)_1 = (10 + 5(1); 20 + 5(2); 15 + 5(2)) = (15; 30; 25)$.]
    #step[Tên lửa đánh chặn phóng từ $B(5; 10; 5)$ tại $t=0$ và bắn trúng mục tiêu tại $M(5)$ lúc $t=5$ giây, tức là di chuyển đoạn đường từ $B$ đến $M(5)$ trong vòng $5$ giây. Độ dài quãng đường di chuyển là:
      $B M(5) = sqrt((15 - 5)^2 + (30 - 10)^2 + (25 - 5)^2) = sqrt(10^2 + 20^2 + 20^2) = 30$ km.]
    #step[Tốc độ của tên lửa đánh chặn là:
      $v_c = frac(B M(5), 5) = frac(30, 5) = 6$ (km/s).]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một cột ăng-ten viễn thông thẳng đứng có đỉnh tại tọa độ $S(0; 0; 3)$ (đơn vị: mét). Một đường dây điện chạy dọc theo đường thẳng $d: x = 1, z = 0$ song song với mặt đất. Tính bình phương khoảng cách ngắn nhất từ đỉnh cột ăng-ten $S$ đến đường dây điện $d$.],
  [$10$],
  
  loigiai: [
    #step[Đường thẳng $d$ chứa đường dây điện song song với trục $O y$ và đi qua điểm $H(1; 0; 0)$ trên mặt đất.]
    #step[Nhận xét: Hình chiếu vuông góc của đỉnh cột $S(0; 0; 3)$ lên đường thẳng $d$ chính là điểm $H(1; 0; 0)$.
      Điều này là do $vec(S H) = (1; 0; -3)$ vuông góc với vectơ chỉ phương của đường thẳng $d$ là $vec(j) = (0; 1; 0)$ (tích vô hướng bằng $0$).]
    #step[Khoảng cách ngắn nhất từ $S$ đến đường thẳng $d$ là độ dài đoạn $S H$:
      $d(S, d) = S H = sqrt((1 - 0)^2 + (0 - 0)^2 + (0 - 3)^2) = sqrt(1 + 9) = sqrt(10)$.]
    #step[Bình phương khoảng cách ngắn nhất này bằng $10$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Để bảo vệ vùng không phận của căn cứ quân sự, một trạm radar quét lập mô hình vùng cấm bay là mặt cầu $(S): x^2 + y^2 + z^2 - 2x - 4y - 4z = 0$. Một UAV trinh sát tuần tra bay dọc theo đường thẳng $d: frac(x-8, 2) = frac(y-9, 2) = frac(z-10, 1)$ (đơn vị tọa độ tính bằng km). Tính khoảng cách ngắn nhất từ UAV đến ranh giới vùng cấm bay $(S)$ (làm tròn kết quả đến hàng phần mười).],
  [$1.2$],
  
  loigiai: [
    #step[Mặt cầu $(S)$ của vùng cấm bay có tâm $I(1; 2; 2)$ và bán kính $R = sqrt(1^2 + 2^2 + 2^2 - 0) = 3$ km.]
    #step[Đường bay $d$ đi qua điểm $M_0(8; 9; 10)$ và có vectơ chỉ phương $vec(u) = (2; 2; 1)$. Khoảng cách từ tâm mặt cầu $I$ đến đường bay $d$ là:
      $d(I, d) = frac(|[vec(M_0 I), vec(u)]|, |vec(u)|)$.]
    #step[Ta có $vec(M_0 I) = (1 - 8; 2 - 9; 2 - 10) = (-7; -7; -8)$.
      Tích có hướng: $[vec(M_0 I), vec(u)] = ( (-7)(1) - (-8)(2); (-8)(2) - (-7)(1); (-7)(2) - (-7)(2) ) = (9; -9; 0)$.
      Độ dài tích có hướng: $|[vec(M_0 I), vec(u)]| = sqrt(9^2 + (-9)^2 + 0^2) = 9sqrt(2)$ km.]
    #step[Khoảng cách từ tâm $I$ đến đường thẳng $d$: $d(I, d) = frac(9sqrt(2), sqrt(2^2 + 2^2 + 1^2)) = frac(9sqrt(2), 3) = 3sqrt(2) approx 4.24$ km.]
    #step[Vì khoảng cách $d(I, d) = 3sqrt(2) > R = 3$ nên UAV luôn nằm ngoài vùng cấm bay. Khoảng cách ngắn nhất từ UAV đến ranh giới mặt cầu $(S)$ là:
      $h = d(I, d) - R = 3sqrt(2) - 3 = 3(sqrt(2) - 1) approx 1.24$ km. Làm tròn đến hàng phần mười ta được kết quả là $1.2$.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Một đường ống dẫn dầu nối thẳng từ giàn khoan biển $A(1; 2; 3)$ đến vị trí trung chuyển $M(x; y; 0)$ trên mặt nước biển (mặt phẳng $O x y$) và sau đó dẫn tiếp đến nhà máy lọc dầu ven biển $B(5; 5; 9)$ (độ cao tính bằng km). Tìm chiều dài ngắn nhất (km) của hệ thống đường ống dẫn dầu $A M + M B$.],
  [$13$],
  
  loigiai: [
    #step[Nhận xét: Giàn khoan $A$ và nhà máy $B$ đều nằm ở phía trên mặt phẳng nước biển $O x y$ do cao độ $z_A = 3 > 0, z_B = 9 > 0$.]
    #step[Để tổng quãng đường $A M + M B$ ngắn nhất, ta lấy điểm đối xứng $A'$ của $A$ qua mặt phẳng $O x y$. Tọa độ điểm đối xứng là $A'(1; 2; -3)$.]
    #step[Khi đó, với mọi $M in (O x y)$, ta luôn có $A M = A' M$, suy ra:
      $A M + M B = A' M + M B >= A' B$.]
    #step[Dấu đẳng thức xảy ra khi và chỉ khi ba điểm $A', M, B$ thẳng hàng trong không gian, nghĩa là điểm đấu nối trung chuyển $M$ là giao điểm của đoạn thẳng $A' B$ với mặt phẳng $O x y$.]
    #step[Chiều dài ngắn nhất của hệ thống đường ống bằng khoảng cách $A' B$:
      $A' B = sqrt((5 - 1)^2 + (5 - 2)^2 + (9 - (-3))^2) = sqrt(4^2 + 3^2 + 12^2) = sqrt(16 + 9 + 144) = sqrt(169) = 13$ (km).]
  ],
))
