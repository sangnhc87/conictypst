#import "_config.typ": *

#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-book)[ĐỀ LUYỆN TẬP SỐ 04 - PHƯƠNG TRÌNH MẶT PHẲNG]
]

#resetexamstate()
#exam-part([PHẦN I. Câu hỏi trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: 12)

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt phẳng $(alpha)$ đi qua điểm $A(1; 2; -3)$ và nhận vectơ $vec(n) = (2; -1; 4)$ làm vectơ pháp tuyến.],
  (
    [$2x - y + 4z - 12 = 0$],
    [$2x - y + 4z - 10 = 0$],
    True([$2x - y + 4z + 12 = 0$]),
    [$2x + y + 4z + 12 = 0$],
  ),
  
  loigiai: [
    #step[
      - Phương trình mặt phẳng đi qua điểm $A(1; 2; -3)$ có vectơ pháp tuyến $vec(n) = (2; -1; 4)$ là:
        $2(x - 1) - 1(y - 2) + 4(z + 3) = 0$.
    ]
    #step[
      - Khai triển biểu thức:
        $2x - 2 - y + 2 + 4z + 12 = 0$.
    ]
    #step[
      - Rút gọn ta được phương trình tổng quát:
        $2x - y + 4z + 12 = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt phẳng đi qua ba điểm $A(2; 0; 0)$, $B(0; -3; 0)$ và $C(0; 0; 4)$.],
  (
    [$6x - 4y + 3z + 12 = 0$],
    True([$6x - 4y + 3z - 12 = 0$]),
    [$6x + 4y + 3z - 12 = 0$],
    [$frac(x, 2) - frac(y, 3) + frac(z, 4) = 0$],
  ),
  
  loigiai: [
    #step[
      - Mặt phẳng đi qua ba điểm thuộc ba trục tọa độ có dạng phương trình đoạn chắn là:
        $frac(x, 2) + frac(y, -3) + frac(z, 4) = 1$
    ]
    #step[
      - Quy đồng mẫu số chung là $12$:
        $6x - 4y + 3z = 12$.
    ]
    #step[
      - Chuyển vế để đưa về dạng tổng quát:
        $6x - 4y + 3z - 12 = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính khoảng cách từ điểm $M(1; -2; 3)$ đến mặt phẳng $(alpha): 2x - 2y + z - 3 = 0$.],
  (
    [$d = 1$],
    True([$d = 2$]),
    [$d = 3$],
    [$d = frac(8, 3)$],
  ),
  
  loigiai: [
    #step[
      - Áp dụng công thức tính khoảng cách từ một điểm $M(x_0; y_0; z_0)$ đến mặt phẳng $(alpha)$:
        $d(M, (alpha)) = frac(|2(1) - 2(-2) + 1(3) - 3|, sqrt(2^2 + (-2)^2 + 1^2))$
    ]
    #step[
      - Tính toán giá trị tử số và mẫu số:
        $d(M, (alpha)) = frac(|2 + 4 + 3 - 3|, sqrt(4 + 4 + 1)) = frac(6, sqrt(9)) = frac(6, 3) = 2$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt phẳng $(alpha)$ đi qua điểm $A(1; 1; 1)$ và song song với mặt phẳng $(beta): x + 2y - z + 5 = 0$.],
  (
    [$x + 2y - z - 5 = 0$],
    [$x + 2y - z + 2 = 0$],
    [$x + 2y - z = 0$],
    True([$x + 2y - z - 2 = 0$]),
  ),
  
  loigiai: [
    #step[
      - Vì mặt phẳng $(alpha)$ song song với mặt phẳng $(beta): x + 2y - z + 5 = 0$ nên phương trình mặt phẳng $(alpha)$ có dạng:
        $x + 2y - z + D = 0$ (với $D != 5$).
    ]
    #step[
      - Điểm $A(1; 1; 1)$ thuộc mặt phẳng $(alpha)$, thế tọa độ điểm $A$ vào phương trình ta được:
        $1 + 2(1) - 1 + D = 0 <=> 2 + D = 0 <=> D = -2$.
    ]
    #step[
      - Vậy phương trình mặt phẳng $(alpha)$ cần tìm là:
        $x + 2y - z - 2 = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai điểm $A(2; 1; -1)$ và $B(0; 3; 1)$. Viết phương trình mặt phẳng trung trực của đoạn thẳng $A B$.],
  (
    [$x - y - z + 2 = 0$],
    True([$x - y - z + 1 = 0$]),
    [$x - y - z - 1 = 0$],
    [$x + y + z - 1 = 0$],
  ),
  
  loigiai: [
    #step[
      - Gọi $I$ là trung điểm của đoạn thẳng $A B$. Tọa độ của $I$ là:
        $x_I = frac(2 + 0, 2) = 1$, $y_I = frac(1 + 3, 2) = 2$, $z_I = frac(-1 + 1, 2) = 0 => I(1; 2; 0)$.
    ]
    #step[
      - Mặt phẳng trung trực của $A B$ đi qua trung điểm $I(1; 2; 0)$ và nhận vectơ $vec(A B) = (-2; 2; 2) = -2(1; -1; -1)$ làm vectơ pháp tuyến.
    ]
    #step[
      - Phương trình mặt phẳng trung trực là:
        $1(x - 1) - 1(y - 2) - 1(z - 0) = 0 <=> x - y - z + 1 = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, hai lá chắn năng lượng song song bảo vệ một tàu vũ trụ nằm trên hai mặt phẳng $(P): x - 2y + 2z - 1 = 0$ và $(Q): x - 2y + 2z + 5 = 0$ (đơn vị tọa độ là mét). Một robot bảo trì cần di chuyển thẳng từ lá chắn này sang lá chắn kia dọc theo phương vuông góc. Tính quãng đường ngắn nhất robot phải di chuyển.],
  (
    [$1$ mét],
    True([$2$ mét]),
    [$3$ mét],
    [$4$ mét],
  ),
  
  loigiai: [
    #step[
      - Khoảng cách ngắn nhất giữa hai lá chắn chính là khoảng cách giữa hai mặt phẳng song song $(P)$ và $(Q)$.
    ]
    #step[
      - Công thức khoảng cách giữa hai mặt phẳng song song có dạng $A x + B y + C z + D_1 = 0$ và $A x + B y + C z + D_2 = 0$ là:
        $d((P), (Q)) = frac(|D_1 - D_2|, sqrt(A^2 + B^2 + C^2))$
    ]
    #step[
      - Thay số vào công thức:
        $d((P), (Q)) = frac(|-1 - 5|, sqrt(1^2 + (-2)^2 + 2^2)) = frac(|-6|, 3) = 2$ mét.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, phương trình mặt phẳng đi qua điểm $M(1; -2; 4)$ và song song với mặt phẳng tọa độ $(O x y)$ là:],
  (
    [$x - 1 = 0$],
    [$y + 2 = 0$],
    True([$z - 4 = 0$]),
    [$x - 2y + 4z = 0$],
  ),
  
  loigiai: [
    #step[
      - Mặt phẳng tọa độ $(O x y)$ có phương trình là $z = 0$.
    ]
    #step[
      - Mặt phẳng song song với $(O x y)$ có phương trình dạng: $z + D = 0$ (với $D != 0$).
      - Do mặt phẳng đi qua $M(1; -2; 4)$ nên thế tọa độ $M$ vào phương trình ta được:
        $4 + D = 0 <=> D = -4$.
    ]
    #step[
      - Vậy phương trình mặt phẳng là $z - 4 = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, viết phương trình mặt phẳng $(P)$ đi qua trục $O z$ và đi qua điểm $A(1; 2; 3)$.],
  (
    [$3x - z = 0$],
    [$x + 2y - 3z = 0$],
    True([$2x - y = 0$]),
    [$x - 2y = 0$],
  ),
  
  loigiai: [
    #step[
      - Mặt phẳng $(P)$ đi qua trục $O z$ nên chứa điểm $O(0; 0; 0)$ và nhận vectơ đơn vị $vec(k) = (0; 0; 1)$ làm vectơ chỉ phương.
      - Mặt phẳng $(P)$ đi qua $A(1; 2; 3)$ nên nhận vectơ $vec(O A) = (1; 2; 3)$ làm vectơ chỉ phương thứ hai.
    ]
    #step[
      - Vectơ pháp tuyến của mặt phẳng $(P)$ là tích có hướng của hai vectơ chỉ phương:
        $vec(n) = [vec(k), vec(O A)] = (0 - 2; 1 - 0; 0 - 0) = (-2; 1; 0) = -(2; -1; 0)$.
    ]
    #step[
      - Phương trình mặt phẳng $(P)$ đi qua $O(0; 0; 0)$ có vectơ pháp tuyến $vec(n) = (2; -1; 0)$ là:
        $2(x - 0) - 1(y - 0) + 0(z - 0) = 0 <=> 2x - y = 0$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, tính góc giữa hai mặt phẳng $(P): x - y + sqrt(2)z - 1 = 0$ và $(Q): x - y - sqrt(2)z + 3 = 0$.],
  (
    [$30^degree$],
    [$45^degree$],
    [$60^degree$],
    True([$90^degree$]),
  ),
  
  loigiai: [
    #step[
      - Vectơ pháp tuyến của hai mặt phẳng lần lượt là:
        $vec(n_1) = (1; -1; sqrt(2))$ và $vec(n_2) = (1; -1; -sqrt(2))$.
    ]
    #step[
      - Tính cosin góc giữa hai mặt phẳng:
        $cos((P), (Q)) = frac(|vec(n_1) dot.c vec(n_2)|, |vec(n_1)| dot.c |vec(n_2)|)$
    ]
    #step[
      - Tính toán cụ thể:
        $cos((P), (Q)) = frac(|1(1) + (-1)(-1) + sqrt(2)(-sqrt(2))|, sqrt(1 + 1 + 2) dot.c sqrt(1 + 1 + 2)) = frac(0, 4) = 0$.
    ]
    #step[
      - Vì cosin góc bằng 0 nên góc giữa hai mặt phẳng bằng $90^degree$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, một trạm radar cảnh giới đặt tại điểm $A(1; m; 2)$ (với $m$ là tham số). Vùng nhận diện bay an toàn của sân bay được giới hạn bởi mặt phẳng $(P): 2x - 2y + z - 3 = 0$. Bộ phận kỹ thuật yêu cầu khoảng cách từ trạm radar $A$ đến mặt giới hạn $(P)$ phải bằng đúng $3$ km để tránh gây nhiễu sóng hàng không. Tìm tất cả các giá trị của tham số $m$ để thỏa mãn yêu cầu trên.],
  (
    [$m = -5$ hoặc $m = 4$],
    [$m = 5$ hoặc $m = -4$],
    True([$m = -4$ hoặc $m = 5$]),
    [$m = -5$ hoặc $m = -4$],
  ),
  
  loigiai: [
    #step[
      - Áp dụng công thức khoảng cách từ điểm $A(1; m; 2)$ đến mặt giới hạn $(P): 2x - 2y + z - 3 = 0$:
        $d(A, (P)) = frac(|2(1) - 2(m) + 2 - 3|, sqrt(2^2 + (-2)^2 + 1^2)) = frac(|1 - 2m|, 3)$
    ]
    #step[
      - Yêu cầu kỹ thuật đặt khoảng cách này bằng $3$ km:
        $frac(|1 - 2m|, 3) = 3 <=> |1 - 2m| = 9$
    ]
    #step[
      - Giải phương trình chứa dấu giá trị tuyệt đối ta có hai trường hợp:
        - Trường hợp 1: $1 - 2m = 9 <=> 2m = -8 <=> m = -4$.
        - Trường hợp 2: $1 - 2m = -9 <=> 2m = 10 <=> m = 5$.
      - Vậy các giá trị $m$ cần tìm là $m = -4$ hoặc $m = 5$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong không gian $O x y z$, cho hai mặt phẳng song song $(P): 2x + (m-1)y + 3z - 1 = 0$ và $(Q): n x + 2y + 6z + 5 = 0$. Tìm giá trị của các tham số $m, n$.],
  (
    [$m = 2, n = 4$],
    True([$m = 2, n = 4$]),
    [$m = -2, n = 4$],
    [$m = 2, n = -4$],
  ),
  
  loigiai: [
    #step[
      - Hai mặt phẳng $(P)$ và $(Q)$ song song khi và chỉ khi các hệ số trước $x, y, z$ tỉ lệ nhưng khác hệ số tự do:
        $frac(2, n) = frac(m - 1, 2) = frac(3, 6) != frac(-1, 5)$
    ]
    #step[
      - Từ tỉ số $frac(3, 6) = frac(1, 2)$, ta lập hệ phương trình:
        - $frac(2, n) = frac(1, 2) => n = 4$.
        - $frac(m - 1, 2) = frac(1, 2) => m - 1 = 1 => m = 2$.
    ]
    #step[
      - Kiểm tra điều kiện: $frac(1, 2) != frac(-1, 5)$ (luôn đúng).
      - Vậy cặp giá trị là $m = 2, n = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một mặt phẳng $(P)$ cắt ba trục tọa độ tại các điểm $A, B, C$ có đồ thị hiển thị trong không gian dưới đây:
    #align(center)[
      #canvas(length: 1.1cm, {
        import draw: *
        // Hệ trục tọa độ Oxyz
        line((0, 0), (-1.5, -1.0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt) // Ox
        line((0, 0), (4.0, 0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt) // Oy
        line((0, 0), (0, 3.0), mark: (end: "stealth", scale: 0.6), stroke: 0.8pt) // Oz
        
        content((-1.7, -1.1), $x$)
        content((4.2, 0), $y$)
        content((0.25, 3.0), $z$)
        content((0.25, 0.25), $O$)
        
        // Các điểm cắt
        let A_pt = (-0.9, -0.6) // 3 đơn vị trên Ox
        let B_pt = (2.8, 0) // 4 đơn vị trên Oy
        let C_pt = (0, 1.8) // 2 đơn vị trên Oz
        
        // Vẽ tam giác giao mặt phẳng với các trục
        line(A_pt, B_pt, C_pt, close: true, fill: rgb("#eff6ff").transparentize(30%), stroke: 1.2pt + rgb("#b91c1c"))
        
        // Điểm nút
        circle(A_pt, radius: 0.04, fill: black)
        circle(B_pt, radius: 0.04, fill: black)
        circle(C_pt, radius: 0.04, fill: black)
        
        // Nhãn tọa độ điểm cắt
        content((-1.4, -0.4), [3])
        content((2.8, -0.35), [4])
        content((-0.25, 1.8), [2])
      })
    ]
    Phương trình tổng quát của mặt phẳng $(P)$ biểu diễn trên hình vẽ đoạn chắn là gì?],
  (
    [$4x + 3y + 6z + 12 = 0$],
    [$4x + 3y + 6z = 0$],
    True([$4x + 3y + 6z - 12 = 0$]),
    [$4x - 3y + 6z - 12 = 0$],
  ),
  
  loigiai: [
    #step[
      - Đọc đồ thị tọa độ các điểm cắt:
        - Điểm cắt trên trục $O x$ là $A(3; 0; 0) => a = 3$.
        - Điểm cắt trên trục $O y$ là $B(0; 4; 0) => b = 4$.
        - Điểm cắt trên trục $O z$ là $C(0; 0; 2) => c = 2$.
    ]
    #step[
      - Áp dụng phương trình mặt phẳng theo đoạn chắn:
        $frac(x, 3) + frac(y, 4) + frac(z, 2) = 1$
    ]
    #step[
      - Quy đồng mẫu số chung là $12$:
        $4x + 3y + 6z = 12 <=> 4x + 3y + 6z - 12 = 0$.
    ]
  ],
))

#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (4 câu)], count: 4)

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, sườn của một thung lũng được mô tả bởi mặt phẳng sườn đồi $(P): x - 2y + 2z - 3 = 0$. Một máy bay không người lái (UAV) trinh sát đang bay lơ lửng cố định tại điểm $M(1; 2; 1)$ (đơn vị đo là km). Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Một vectơ pháp tuyến của mặt phẳng sườn đồi $(P)$ là $vec(n) = (1; -2; 2)$.]),
    [UAV trinh sát $M$ đang đậu trực tiếp trên mặt phẳng sườn đồi $(P)$.],
    True([Khoảng cách ngắn nhất từ UAV $M$ đến mặt phẳng sườn đồi $(P)$ bằng $4/3$ km.]),
    True([Nếu thiết lập một mặt phẳng bay an toàn $(Q)$ đi qua vị trí UAV $M$ và song song với sườn đồi $(P)$ thì phương trình của $(Q)$ là $x - 2y + 2z + 1 = 0$.]),
  ),
  
  loigiai: [
    - a) *Đúng*: Hệ số của $x, y, z$ trong phương trình mặt phẳng $(P)$ chính là tọa độ một vectơ pháp tuyến: $vec(n) = (1; -2; 2)$.
    - b) *Sai*: Thế tọa độ điểm $M(1; 2; 1)$ vào phương trình $(P)$ ta được: $1 - 2(2) + 2(1) - 3 = -4 != 0$. Do đó $M$ không nằm trên sườn đồi $(P)$.
    - c) *Đúng*: Khoảng cách ngắn nhất từ UAV $M$ đến mặt phẳng sườn đồi $(P)$ chính là khoảng cách từ điểm $M$ đến $(P)$:
      $d(M, (P)) = frac(|1 - 2(2) + 2(1) - 3|, sqrt(1^2 + (-2)^2 + 2^2)) = frac(|-4|, 3) = 4/3$ km.
    - d) *Đúng*: Mặt phẳng song song với $(P)$ có dạng $x - 2y + 2z + C = 0$ (với $C != -3$). Đi qua $M(1; 2; 1)$ nên thế tọa độ $M$: $1 - 4 + 2 + C = 0 <=> C = 1$ (thỏa mãn). Vậy phương trình là $x - 2y + 2z + 1 = 0$.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Một tấm pin năng lượng mặt trời hình tam giác $A B C$ được lắp đặt trên một ngọn đồi. Trong hệ tọa độ $O x y z$ (đơn vị đo là mét), ba đỉnh của tấm pin lần lượt đặt tại $A(1; 0; 0)$, $B(0; 1; 0)$ và $C(0; 0; 1)$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Phương trình tổng quát của mặt phẳng tấm pin $(A B C)$ là $x + y + z - 1 = 0$.]),
    True([Vectơ pháp tuyến của mặt phẳng tấm pin $(A B C)$ là $vec(n) = (1; 1; 1)$.]),
    [Diện tích của tấm pin năng lượng mặt trời $A B C$ bằng $1/2$ $m^2$.],
    True([Khoảng cách từ gốc tọa độ $O$ (nơi đặt thiết bị đo đạc) đến mặt phẳng tấm pin $(A B C)$ bằng $frac(sqrt(3), 3)$ mét.]),
  ),
  
  loigiai: [
    - a) *Đúng*: Phương trình mặt phẳng $(A B C)$ theo đoạn chắn: $frac(x, 1) + frac(y, 1) + frac(z, 1) = 1 <=> x + y + z - 1 = 0$.
    - b) *Đúng*: Vectơ pháp tuyến của mặt phẳng $x + y + z - 1 = 0$ là $vec(n) = (1; 1; 1)$.
    - c) *Sai*: Ta có $vec(A B) = (-1; 1; 0)$ và $vec(A C) = (-1; 0; 1)$.
      - Tích có hướng: $[vec(A B), vec(A C)] = (1; 1; 1)$.
      - Diện tích tấm pin: $S_(A B C) = frac(1, 2) |[vec(A B), vec(A C)]| = frac(sqrt(3), 2)$ $m^2$.
    - d) *Đúng*: Khoảng cách: $d(O, (A B C)) = frac(|-1|, sqrt(1^2 + 1^2 + 1^2)) = frac(1, sqrt(3)) = frac(sqrt(3), 3)$ mét.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho hai mặt phẳng $(P): x + 2y - 2z + 1 = 0$ và $(Q): 2x + (m+1)y - 4z + n = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Với $m = 3$, hai mặt phẳng $(P)$ và $(Q)$ song song khi $n != 2$.]),
    True([Với $m = 1$, hai mặt phẳng $(P)$ và $(Q)$ luôn cắt nhau với mọi giá trị $n$.]),
    True([Khi $m = 3$ và $n = 2$, hai mặt phẳng trùng nhau.]),
    [Với mọi $m$, hai mặt phẳng $(P)$ và $(Q)$ không bao giờ vuông góc với nhau.],
  ),
  
  loigiai: [
    - a) *Đúng*: Điều kiện song song: $frac(2, 1) = frac(m+1, 2) = frac(-4, -2) != frac(n, 1) <=> 2 = frac(m+1, 2) = 2 != n <=> m = 3$ và $n != 2$.
    - b) *Đúng*: Với $m = 1$, ta có tỉ số trước $y$ là $frac(1+1, 2) = 1 != frac(2, 1) = 2$. Do đó các hệ số không tỉ lệ, hai mặt phẳng luôn cắt nhau.
    - c) *Đúng*: Khi $m=3$ và $n=2$, hệ số tỉ lệ đồng nhất: $frac(2, 1) = frac(4, 2) = frac(-4, -2) = frac(2, 1)$, hai mặt phẳng trùng nhau.
    - d) *Sai*: Hai mặt phẳng vuông góc khi tích vô hướng hai vectơ pháp tuyến bằng $0$:
      $1(2) + 2(m+1) + (-2)(-4) = 0 <=> 2m + 12 = 0 <=> m = -6$. Do đó tồn tại giá trị $m = -6$ để hai mặt phẳng vuông góc với nhau.
  ],
))

#q-wrap(dir: "ngang", ds(
  [Trong không gian $O x y z$, cho điểm $A(2; 1; -3)$ và mặt phẳng $(P): x - 2y + 2z - 3 = 0$. Xét tính Đúng/Sai của các mệnh đề sau:],
  (
    True([Khoảng cách từ điểm $A$ đến mặt phẳng $(P)$ bằng $3$.]),
    True([Tọa độ hình chiếu vuông góc $H$ của điểm $A$ trên mặt phẳng $(P)$ là $H(3; -1; -1)$.]),
    True([Tọa độ điểm đối xứng $A'$ của điểm $A$ qua mặt phẳng $(P)$ là $A'(4; -3; 1)$.]),
    [Mặt cầu tâm $A$ tiếp xúc với mặt phẳng $(P)$ có phương trình là $(x - 2)^2 + (y - 1)^2 + (z + 3)^2 = 3$.],
  ),
  
  loigiai: [
    - a) *Đúng*: Khoảng cách $d(A, (P)) = frac(|2 - 2(1) + 2(-3) - 3|, sqrt(1^2 + (-2)^2 + 2^2)) = frac(|-9|, 3) = 3$.
    - b) *Đúng*: Đường thẳng đi qua $A$ vuông góc với $(P)$ có phương trình tham số: $x = 2 + t, y = 1 - 2t, z = -3 + 2t$.
      - Thay vào phương trình $(P)$: $(2 + t) - 2(1 - 2t) + 2(-3 + 2t) - 3 = 0 <=> 9t - 9 = 0 <=> t = 1$.
      - Suy ra tọa độ hình chiếu $H(3; -1; -1)$.
    - c) *Đúng*: Điểm đối xứng $A'$ thỏa mãn $H$ là trung điểm $A A'$:
      $x_(A') = 2x_H - x_A = 6 - 2 = 4$, $y_(A') = 2y_H - y_A = -2 - 1 = -3$, $z_(A') = 2z_H - z_A = -2 - (-3) = 1 => A'(4; -3; 1)$.
    - d) *Sai*: Vì mặt cầu tâm $A$ tiếp xúc với $(P)$ có bán kính $R = d(A, (P)) = 3$.
      - Phương trình mặt cầu phải là: $(x - 2)^2 + (y - 1)^2 + (z + 3)^2 = 9$.
  ],
))

#exam-part([PHẦN III. Câu hỏi trắc nghiệm trả lời ngắn (6 câu)], count: 6)

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt phẳng $(alpha): 3x - 4z + 1 = 0$. Tính khoảng cách từ điểm $A(1; 2; 6)$ đến mặt phẳng $(alpha)$.],
  [$4$],
  
  loigiai: [
    #step[
      - Áp dụng công thức khoảng cách từ điểm $A$ đến mặt phẳng $(alpha)$ (lưu ý hệ số của $y$ bằng $0$):
        $d(A, (alpha)) = frac(|3x_A - 4z_A + 1|, sqrt(3^2 + 0^2 + (-4)^2))$
    ]
    #step[
      - Thay tọa độ điểm $A(1; 2; 6)$ vào công thức:
        $d(A, (alpha)) = frac(|3(1) - 4(6) + 1|, sqrt(9 + 16)) = frac(|3 - 24 + 1|, 5) = frac(|-20|, 5) = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt phẳng $(alpha): 2x - y + 2z - m = 0$ (với $m$ là tham số thực dương). Tìm giá trị của $m$ để khoảng cách từ gốc tọa độ $O(0; 0; 0)$ đến mặt phẳng $(alpha)$ bằng $3$.],
  [$9$],
  
  loigiai: [
    #step[
      - Tính khoảng cách từ gốc tọa độ $O$ đến mặt phẳng $(alpha)$ theo công thức:
        $d(O, (alpha)) = frac(|2(0) - 0 + 2(0) - m|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(|-m|, sqrt(9)) = frac(m, 3)$ (do $m > 0$).
    ]
    #step[
      - Theo đề bài, khoảng cách này bằng $3$:
        $frac(m, 3) = 3 <=> m = 9$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho hai mặt phẳng song song $(P): 2x - y + 2z - 1 = 0$ và $(Q): 2x - y + 2z + d = 0$ (với $d > 0$). Biết khoảng cách giữa hai mặt phẳng bằng $2$. Tìm giá trị của $d$.],
  [$5$],
  
  loigiai: [
    #step[
      - Áp dụng công thức khoảng cách giữa hai mặt phẳng song song:
        $d((P), (Q)) = frac(|d - (-1)|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(|d + 1|, 3)$
    ]
    #step[
      - Đặt khoảng cách bằng $2$:
        $frac(|d + 1|, 3) = 2 <=> |d + 1| = 6$
    ]
    #step[
      - Giải phương trình với điều kiện $d > 0$:
        - $d + 1 = 6 <=> d = 5$ (thỏa mãn).
        - $d + 1 = -6 <=> d = -7$ (loại).
      - Vậy $d = 5$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, cho mặt phẳng $(P): x + 2y - z + 3 = 0$ và điểm $A(1; 1; 2)$. Tính khoảng cách từ điểm $A$ đến mặt phẳng $(P)$ nhân với $sqrt(6)$.],
  [$4$],
  
  loigiai: [
    #step[
      - Tính khoảng cách từ điểm $A(1; 1; 2)$ đến mặt phẳng $(P)$:
        $d(A, (P)) = frac(|1 + 2(1) - 2 + 3|, sqrt(1^2 + 2^2 + (-1)^2)) = frac(4, sqrt(6))$
    ]
    #step[
      - Tính giá trị yêu cầu:
        $T = d(A, (P)) dot.c sqrt(6) = frac(4, sqrt(6)) dot.c sqrt(6) = 4$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$, một sườn đồi đá phẳng được mô tả bởi mặt phẳng $(P): x + y + z - 3 = 0$. Hai trạm phát sóng định vị vô tuyến $A$ và $B$ đặt tại các vị trí $A(1; 2; 0)$ và $B(3; 2; 4)$ (đơn vị tọa độ là km). Một kỹ sư muốn tìm vị trí đặt trạm thu tín hiệu $M$ trên sườn đồi $(P)$ sao cho tổng bình phương khoảng cách $T = M A^2 + M B^2$ từ trạm thu đến hai trạm phát là nhỏ nhất để tối ưu hóa công suất đường truyền. Tìm tổng tọa độ $S = x_M + y_M + z_M$ của điểm $M$ đó.],
  [$3$],
  
  loigiai: [
    #step[
      - Gọi $G$ là trung điểm của đoạn thẳng nối hai trạm phát $A B$. Tọa độ của $G$ là:
        $x_G = frac(1 + 3, 2) = 2$, $y_G = frac(2 + 2, 2) = 2$, $z_G = frac(0 + 4, 2) = 2 => G(2; 2; 2)$.
    ]
    #step[
      - Ta phân tích biểu thức tổng bình phương khoảng cách $T$ theo điểm $G$:
        $T = M A^2 + M B^2 = (vec(M G) + vec(G A))^2 + (vec(M G) + vec(G B))^2$
        $T = 2 M G^2 + G A^2 + G B^2 + 2 vec(M G) dot.c (vec(G A) + vec(G B)) = 2 M G^2 + G A^2 + G B^2$ (do $vec(G A) + vec(G B) = vec(0)$).
    ]
    #step[
      - Vì lượng $G A^2 + G B^2$ không đổi, nên $T$ đạt giá trị nhỏ nhất khi và chỉ khi khoảng cách $M G$ nhỏ nhất. Điều này tương đương với việc trạm thu $M$ phải là hình chiếu vuông góc của trung điểm $G(2; 2; 2)$ trên mặt phẳng sườn đồi $(P)$.
    ]
    #step[
      - Tìm hình chiếu $M$: Đường thẳng đi qua $G$ và vuông góc với $(P)$ có phương trình tham số $x = 2 + t$, $y = 2 + t$, $z = 2 + t$.
      - Thay vào phương trình mặt phẳng $(P)$ ta được: $(2 + t) + (2 + t) + (2 + t) - 3 = 0 <=> 3t + 3 = 0 <=> t = -1$.
      - Với $t = -1$, ta có tọa độ trạm thu tối ưu là $M(1; 1; 1)$.
      - Vậy tổng tọa độ cần tìm là $S = 1 + 1 + 1 = 3$.
    ]
  ],
))

#q-wrap(dir: "doc", tln(
  [Trong không gian $O x y z$ (đơn vị đo là mét), một chùm tia laser bảo vệ được quét trong mặt phẳng $(P): 2x - y + 2z - 4 = 0$. Do yêu cầu kỹ thuật, hệ thống quét thiết lập một mặt phẳng bảo vệ thứ hai $(Q)$ song song với $(P)$ và cách nguồn phát đặt tại điểm $A(1; 2; 3)$ một khoảng bằng $4$ mét. Biết rằng mặt phẳng $(Q)$ cắt một trục đỡ thẳng đứng (trục $O z$) tại khớp xoay $C(0; 0; z_C)$ với $z_C > 0$. Xác định giá trị cao độ $z_C$ của khớp xoay này.],
  [$9$],
  
  loigiai: [
    #step[
      - Vì mặt phẳng thiết lập $(Q)$ song song với $(P): 2x - y + 2z - 4 = 0$ nên $(Q)$ có phương trình dạng:
        $2x - y + 2z + D = 0$ (với $D != -4$).
    ]
    #step[
      - Tính khoảng cách từ nguồn phát $A(1; 2; 3)$ đến mặt phẳng $(Q)$ và đặt bằng $4$ mét:
        $d(A, (Q)) = frac(|2(1) - 2 + 2(3) + D|, sqrt(2^2 + (-1)^2 + 2^2)) = frac(|6 + D|, 3) = 4 <=> |6 + D| = 12$
      - Giải phương trình ta thu được hai trường hợp:
        - Trường hợp 1: $6 + D = 12 <=> D = 6 => (Q_1): 2x - y + 2z + 6 = 0$.
        - Trường hợp 2: $6 + D = -12 <=> D = -18 => (Q_2): 2x - y + 2z - 18 = 0$.
    ]
    #step[
      - Khớp xoay $C$ nằm trên trục đỡ đứng $O z$ nên có $x_C = 0, y_C = 0$:
        - Với $(Q_1)$: $2z_C + 6 = 0 <=> z_C = -3$ (loại vì $z_C > 0$).
        - Với $(Q_2)$: $2z_C - 18 = 0 <=> z_C = 9$ (thỏa mãn).
      - Vậy cao độ $z_C$ của khớp xoay bằng 9.
    ]
  ],
))
