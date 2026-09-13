#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Biểu diễn miền nghiệm của hệ bất phương trình bậc nhất hai ẩn", mau: C2)

#phuong-phap(mau: C2)[
  Cách xác định miền nghiệm của một hệ bất phương trình bậc nhất hai ẩn:
  - Trên cùng một mặt phẳng toạ độ $O x y$, xác định miền nghiệm của mỗi bất phương trình bậc nhất hai ẩn trong hệ bằng cách vẽ đường thẳng bờ và gạch bỏ nửa mặt phẳng không chứa nghiệm.
  - Miền không bị gạch (phần giao của các miền nghiệm) chính là miền nghiệm của hệ bất phương trình đã cho.
  - Lưu ý: Nếu bất phương trình chứa dấu "$>=$" hoặc "$<=$" thì miền nghiệm kể cả bờ (vẽ nét liền); nếu chứa dấu "$>$" hoặc "$<$" thì miền nghiệm không kể bờ (vẽ nét đứt).
]

#bai-tap-tu-luan(mau: C2)[
  #bt-item(1, [Biểu diễn miền nghiệm của mỗi hệ bất phương trình sau trên mặt phẳng toạ độ:
    + $cases(y - x < -1, x > 0, y < 0)$.
    + $cases(x >= 0, y >= 0, 2x + y <= 4)$.
    + $cases(x >= 0, x + y > 5, x - y > 0)$.
    + $cases(7x + 4y <= 2400, x + y <= 100, x >= 0, y >= 0)$.
    + $cases(x + y - 2 >= 0, x - 3y + 3 <= 0)$.
    + $cases(x + y > 0, -2x - 3y + 6 > 0, x - 2y + 1 >= 0)$.
  ], loigiai: [
    - *a)* Xét hệ $cases(y - x < -1, x > 0, y < 0)$:
      Vẽ các đường thẳng: trục tung $x = 0$, trục hoành $y = 0$ và đường thẳng $d: y - x = -1$ (hay $x - y = 1$).
      Điểm lấy nghiệm thỏa mãn $x > 0, y < 0$ nằm ở góc phần tư thứ IV.
      Thay thử điểm $M(2; -1)$ vào: $-1 - 2 = -3 < -1$ (thỏa mãn).
      Miền nghiệm là phần mặt phẳng thuộc góc phần tư thứ IV nằm phía dưới đường thẳng $x - y = 1$ (không kể các bờ).
    - *b)* Xét hệ $cases(x >= 0, y >= 0, 2x + y <= 4)$:
      Vẽ đường thẳng $d: 2x + y = 4$ đi qua $A(2; 0)$ và $B(0; 4)$.
      Gốc tọa độ $O(0; 0)$ thỏa mãn $2(0) + 0 = 0 <= 4$.
      Kết hợp với điều kiện $x >= 0, y >= 0$, miền nghiệm là miền tam giác vuông $O A B$ (kể cả ba cạnh), với diện tích $S = 1/2 dot 2 dot 4 = 4$.
    - *c)* Xét hệ $cases(x >= 0, x + y > 5, x - y > 0)$:
      Vẽ $d_1: x + y = 5$ và $d_2: x - y = 0$. Hai đường thẳng cắt nhau tại điểm $I(5/2; 5/2)$.
      Miền nghiệm là miền góc phẳng không chứa gốc tọa độ $O$, giới hạn bởi hai tia xuất phát từ $I$ (không kể bờ $d_1, d_2$ và nằm ở nửa bên phải trục tung $x >= 0$).
    - *d)* Xét hệ $cases(7x + 4y <= 2400, x + y <= 100, x >= 0, y >= 0)$:
      Đường thẳng $x + y = 100$ cắt $O x$ tại $(100; 0)$, cắt $O y$ tại $(0; 100)$.
      Đường thẳng $7x + 4y = 2400$ cắt $O x$ tại $(2400/7; 0) approx (342{,}8; 0)$, cắt $O y$ tại $(0; 600)$.
      Vì với mọi điểm thuộc góc phần tư thứ nhất có $x + y <= 100$ thì $7x + 4y <= 7(x + y) <= 700 < 2400$, bất phương trình $7x + 4y <= 2400$ luôn thỏa mãn.
      Do đó miền nghiệm chính là miền tam giác vuông giới hạn bởi hai trục tọa độ và đường thẳng $x + y = 100$ với ba đỉnh $(0; 0), (100; 0), (0; 100)$ (kể cả bờ).
    - *e)* Xét hệ $cases(x + y - 2 >= 0, x - 3y + 3 <= 0)$:
      Vẽ $d_1: x + y = 2$ và $d_2: x - 3y = -3$.
      Hai đường thẳng cắt nhau tại $I(3/4; 5/4)$.
      Miền nghiệm là miền góc đối đỉnh giới hạn bởi hai đường thẳng $d_1$ và $d_2$ (kể cả hai bờ $d_1, d_2$).
    - *f)* Xét hệ $cases(x + y > 0, -2x - 3y + 6 > 0, x - 2y + 1 >= 0)$:
      Ba đường thẳng bờ cắt nhau tạo thành ba đỉnh của một tam giác trên mặt phẳng tọa độ:
      $d_1: x + y = 0$, $d_2: 2x + 3y = 6$, $d_3: x - 2y = -1$.
      Miền nghiệm là miền trong tam giác đó (kể cả bờ $d_3$, không kể bờ $d_1, d_2$).
  ])

  #bt-item(2, [Biểu diễn hình học tập nghiệm của mỗi hệ bất phương trình sau trên mặt phẳng toạ độ:
    + $cases(x - 2y > 0, x + 3y < 3)$.
    + $cases(-x + 2y <= 6, x + y <= 4, x >= 0, y >= 0)$.
    + $cases(3x - y >= -1, 2x + y <= 6, x + 3y >= 3)$.
    + $cases(x + y > 0, 2x - 3y + 6 > 0, x - 2y + 1 >= 0)$.
    + $cases(3x + y <= 6, x + y <= 4, x >= 0, y >= 0)$.
  ], loigiai: [
    - *a)* Vẽ $d_1: x - 2y = 0$ và $d_2: x + 3y = 3$.
      Hai đường thẳng cắt nhau tại $I(6/5; 3/5)$.
      Miền nghiệm là miền góc phẳng giới hạn bởi hai đường thẳng cắt nhau (không kể bờ).
    - *b)* Vẽ $d_1: -x + 2y = 6$, $d_2: x + y = 4$ cùng hai trục $O x, O y$.
      Giao điểm của $d_1$ và $d_2$: giải hệ được $x = 2/3, y = 10/3$.
      Miền nghiệm là miền tứ giác có bốn đỉnh: $O(0; 0), A(4; 0), B(2/3; 10/3), C(0; 3)$ (kể cả các cạnh biên).
    - *c)* Ba đường thẳng biên cắt nhau tạo thành 3 đỉnh tam giác:
      - Giao điểm của $3x - y = -1$ và $2x + y = 6$ là $A(1; 4)$.
      - Giao điểm của $3x - y = -1$ và $x + 3y = 3$ là $B(0; 1)$.
      - Giao điểm của $2x + y = 6$ và $x + 3y = 3$ là $C(3; 0)$.
      Miền nghiệm là miền trong tam giác $A B C$ (kể cả ba cạnh $A B, B C, C A$).
    - *d)* Tương tự câu 1f, miền nghiệm là miền tam giác giới hạn bởi ba đường thẳng cắt nhau.
    - *e)* Vẽ $d_1: 3x + y = 6$, $d_2: x + y = 4$ cùng hai trục $O x, O y$.
      Giao điểm của $d_1$ và $d_2$ là $I(1; 3)$.
      Miền nghiệm là miền tứ giác $O A I C$ với $O(0; 0), A(2; 0), I(1; 3), C(0; 4)$ (kể cả các cạnh).
  ])
]

#bai-tap-trac-nghiem(mau: C2)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 8, reset-counter: true)

#tn(
  dir: "ngang",
  [Miền không bị gạch chéo (kể cả bờ) giới hạn bởi hai nửa mặt phẳng bờ $x + y - 1 = 0$ và $2x - y + 4 = 0$ là miền nghiệm của hệ bất phương trình nào?],
  (
    True([$cases(x + y - 1 >= 0, 2x - y + 4 <= 0)$.]),
    [$cases(x + y - 1 >= 0, 2x - y + 4 >= 0)$.],
    [$cases(x + y - 1 <= 0, 2x - y + 4 >= 0)$.],
    [$cases(x + y - 1 <= 0, 2x - y + 4 <= 0)$.],
  ),
  loigiai: [
    Xét điểm thử $M(0; 4)$:
    Thay vào biểu thức thứ nhất: $0 + 4 - 1 = 3 >= 0$ (thỏa mãn $x + y - 1 >= 0$).
    Thay vào biểu thức thứ hai: $2(0) - 4 + 4 = 0 <= 0$ (thỏa mãn $2x - y + 4 <= 0$).
    Vậy hệ bất phương trình tương ứng là $cases(x + y - 1 >= 0, 2x - y + 4 <= 0)$.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của hệ bất phương trình: $cases(3x - 4y + 12 >= 0, x + y - 5 >= 0, x + 1 > 0)$ là miền chứa điểm nào sau đây?],
  (
    [$M(1; -3)$.],
    True([$N(4; 3)$.]),
    [$P(-1; 5)$.],
    [$Q(-2; -3)$.],
  ),
  loigiai: [
    Lần lượt thay tọa độ các điểm vào hệ bất phương trình:
    - Với $M(1; -3)$: $1 + (-3) - 5 = -7 < 0$ (loại).
    - Với $N(4; 3)$:
      $3(4) - 4(3) + 12 = 12 >= 0$ (thỏa mãn),
      $4 + 3 - 5 = 2 >= 0$ (thỏa mãn),
      $4 + 1 = 5 > 0$ (thỏa mãn).
      Vậy điểm $N(4; 3)$ thuộc miền nghiệm của hệ.
    - Với $P(-1; 5)$: $x + 1 = -1 + 1 = 0$ không thỏa $x + 1 > 0$ (loại).
    - Với $Q(-2; -3)$: $x + 1 = -2 + 1 = -1 < 0$ (loại).
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Điểm $O(0; 0)$ không thuộc miền nghiệm của hệ bất phương trình nào dưới đây?],
  (
    [$cases(x + 3y - 6 < 0, 2x + y + 4 > 0)$.],
    [$cases(x + 3y >= 0, 2x + y - 4 < 0)$.],
    True([$cases(x + 3y < 0, 2x + y + 4 > 0)$.]),
    [$cases(x + 3y - 6 < 0, 2x + y + 4 >= 0)$.],
  ),
  loigiai: [
    Thay tọa độ gốc $O(0; 0)$ vào hệ ở phương án C:
    Bất phương trình thứ nhất trở thành: $0 + 3(0) < 0 <=> 0 < 0$ (vô lý, sai).
    Do đó điểm $O(0; 0)$ không thuộc miền nghiệm của hệ ở phương án C.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Miền biểu diễn nghiệm của hệ bất phương trình $cases(y >= -2, x >= 2, 2x + y <= 8)$ là một miền đa giác. Tính diện tích $S$ của đa giác đó.],
  (
    [$S = 25$.],
    [$S = 4$.],
    True([$S = 9$.]),
    [$S = 18$.],
  ),
  loigiai: [
    Ba đường thẳng biên $d_1: y = -2$, $d_2: x = 2$ và $d_3: 2x + y = 8$ cắt nhau đôi một tạo thành một tam giác:
    - Giao điểm của $d_1$ và $d_2$: $A(2; -2)$.
    - Giao điểm của $d_2$ và $d_3$: Thay $x = 2$ vào $2(2) + y = 8 <=> y = 4$, ta được $B(2; 4)$.
    - Giao điểm của $d_1$ và $d_3$: Thay $y = -2$ vào $2x + (-2) = 8 <=> 2x = 10 <=> x = 5$, ta được $C(5; -2)$.
    Tam giác $A B C$ vuông tại $A$ (vì $A B$ song song $O y$ và $A C$ song song $O x$).
    Độ dài hai cạnh góc vuông:
    $A B = |y_B - y_A| = |4 - (-2)| = 6$,
    $A C = |x_C - x_A| = |5 - 2| = 3$.
    Diện tích tam giác là:
    $S = 1/2 dot A B dot A C = 1/2 dot 6 dot 3 = 9$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Trong mặt phẳng $O x y$, miền nghiệm của hệ $cases(x >= 0, y > 0, x + y <= 100, 2x + y < 120)$ là hình gì?],
  (
    True([Tứ giác.]),
    [Tam giác.],
    [Hình vuông.],
    [Hình bình hành.],
  ),
  loigiai: [
    Xét các đường biên:
    - Trục tung $x = 0$ (cho $x >= 0$).
    - Trục hoành $y = 0$ (cho $y > 0$).
    - $d_1: x + y = 100$.
    - $d_2: 2x + y = 120$.
    Hai đường thẳng $d_1$ và $d_2$ cắt nhau tại điểm $I$:
    Trừ vế theo vế được $x = 20 => y = 80 => I(20; 80)$.
    Tập nghiệm bị giới hạn bởi 4 đoạn thẳng:
    Nối $O(0; 0) -> A(60; 0)$ (giao của $d_2$ với $O x$) $-> I(20; 80) -> B(0; 100)$ (giao của $d_1$ với $O y$) $-> O(0; 0)$.
    Miền nghiệm tạo thành một đa giác có 4 đỉnh, tức là một tứ giác.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Hai đường thẳng song song $d: x + 2y + 3 = 0$ và $d': x + 2y - 3 = 0$ chia mặt phẳng thành 3 miền I, II, III. Miền II nằm giữa hai đường thẳng là miền nghiệm của bất phương trình nào?],
  (
    [Miền I và III.],
    True([$|x + 2y| < 3$.]),
    [Miền I.],
    [Miền III.],
  ),
  loigiai: [
    Đường thẳng $d$ có phương trình $x + 2y = -3$ và đường thẳng $d'$ có phương trình $x + 2y = 3$.
    Miền II nằm giữa hai đường thẳng song song này tương ứng với tập hợp các điểm $(x; y)$ có giá trị của $x + 2y$ bị kẹp giữa hai giá trị $-3$ và $3$:
    $-3 < x + 2y < 3 <=> |x + 2y| < 3$.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Gọi $(S)$ là tập hợp các điểm trong mặt phẳng $O x y$ thỏa mãn hệ: $cases(x - y - 1 <= 0, x + 4y + 9 >= 0, x - 2y + 3 >= 0)$. Tìm điểm $M(x; y)$ trong miền $(S)$ sao cho $T = 3x - 2y - 4$ đạt giá trị nhỏ nhất.],
  (
    [$(5; 4)$.],
    [$(-1; -2)$.],
    True([$(-5; -1)$.]),
    [$(-2; 5)$.],
  ),
  loigiai: [
    Miền nghiệm $(S)$ là tam giác tạo bởi giao điểm của ba đường thẳng biên:
    - $d_1: x - y - 1 = 0$,
    - $d_2: x + 4y + 9 = 0$,
    - $d_3: x - 2y + 3 = 0$.
    Tìm tọa độ ba đỉnh của tam giác $(S)$:
    - Giao điểm của $d_1$ và $d_2$: $cases(x - y = 1, x + 4y = -9) <=> cases(x = -1, y = -2) => A(-1; -2)$.
    - Giao điểm của $d_1$ và $d_3$: $cases(x - y = 1, x - 2y = -3) <=> cases(x = 5, y = 4) => B(5; 4)$.
    - Giao điểm của $d_2$ và $d_3$: $cases(x + 4y = -9, x - 2y = -3) <=> cases(6y = -6 => y = -1, x = -5) => C(-5; -1)$.
    Giá trị của biểu thức $T = 3x - 2y - 4$ tại các đỉnh:
    - Tại $A(-1; -2)$: $T(A) = 3(-1) - 2(-2) - 4 = -3 + 4 - 4 = -3$.
    - Tại $B(5; 4)$: $T(B) = 3(5) - 2(4) - 4 = 15 - 8 - 4 = 3$.
    - Tại $C(-5; -1)$: $T(C) = 3(-5) - 2(-1) - 4 = -15 + 2 - 4 = -17$.
    Do đó $T$ đạt giá trị nhỏ nhất bằng $-17$ tại điểm $C(-5; -1)$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Miền nghiệm của hệ bất phương trình $cases(x + 2y - 100 <= 0, 2x + y - 80 <= 0, x >= 0, y >= 0)$ là một đa giác có diện tích bằng:],
  (
    [$1200$.],
    [$1100$.],
    True([$1300$.]),
    [$1400$.],
  ),
  loigiai: [
    Xác định các đỉnh của miền đa giác nghiệm:
    - Gốc toạ độ $O(0; 0)$.
    - Giao điểm của đường thẳng $2x + y = 80$ với trục $O x$ ($y = 0$): $A(40; 0)$.
    - Giao điểm của hai đường thẳng $x + 2y = 100$ và $2x + y = 80$:
      Giải hệ $cases(x + 2y = 100, 2x + y = 80) <=> cases(2x + 4y = 200, 2x + y = 80) <=> cases(3y = 120 => y = 40, x = 20) => B(20; 40)$.
    - Giao điểm của đường thẳng $x + 2y = 100$ với trục $O y$ ($x = 0$): $C(0; 50)$.
    Miền nghiệm là tứ giác $O A B C$.
    Để tính diện tích tứ giác $O A B C$, ta hạ hình chiếu vuông góc của $B(20; 40)$ lên trục hoành $O x$ được điểm $H(20; 0)$.
    Khi đó tứ giác được chia thành hình thang vuông $O H B C$ và tam giác vuông $H A B$:
    $S_(O H B C) = ((O C + H B) dot O H) / 2 = ((50 + 40) dot 20) / 2 = 900$.
    $S_(H A B) = 1/2 dot H A dot H B = 1/2 dot (40 - 20) dot 40 = 400$.
    Vậy tổng diện tích đa giác là:
    $S = S_(O H B C) + S_(H A B) = 900 + 400 = 1300$.
    Chọn đáp án *C*.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Cho hệ bất phương trình: $cases(0 <= x <= 10, 0 <= y <= 9, 2x + y >= 14, 2x + 5y >= 30)$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Điểm $K(7; 7)$ thuộc miền nghiệm của hệ bất phương trình.]),
    [Miền nghiệm của hệ bất phương trình chứa gốc toạ độ $O$.],
    True([Miền nghiệm của hệ bất phương trình là miền tứ giác.]),
    [Diện tích miền nghiệm của hệ bất phương trình là một số nguyên.],
  ),
  loigiai: [
    - *a) Đúng:* Thay $x = 7, y = 7$ vào hệ bất phương trình:
      $0 <= 7 <= 10$ (thỏa mãn),
      $0 <= 7 <= 9$ (thỏa mãn),
      $2(7) + 7 = 21 >= 14$ (thỏa mãn),
      $2(7) + 5(7) = 49 >= 30$ (thỏa mãn).
      Vậy $K(7; 7)$ thuộc miền nghiệm của hệ.
    - *b) Sai:* Thay $O(0; 0)$ vào bất phương trình thứ ba: $2(0) + 0 = 0 >= 14$ (vô lý). Do đó gốc tọa độ $O$ không thuộc miền nghiệm.
    - *c) Đúng:* Xác định các đỉnh của miền nghiệm trên hình chữ nhật $[0; 10] times [0; 9]$:
      + Giao điểm của $2x + y = 14$ và $2x + 5y = 30$ là $A(5; 4)$.
      + Giao điểm của $2x + y = 14$ với cạnh trên $y = 9$ là $B(2{,}5; 9)$.
      + Giao điểm của $2x + 5y = 30$ với cạnh phải $x = 10$ là $C(10; 2)$.
      + Đỉnh góc trên bên phải là $D(10; 9)$.
      Bốn đỉnh này tạo thành tứ giác $A B D C$, do đó miền nghiệm là một miền tứ giác.
    - *d) Sai:* Tính diện tích tứ giác $A B D C$:
      Bằng diện tích hình chữ nhật $[2{,}5; 10] times [2; 9]$ trừ đi hai tam giác vuông ở góc:
      $S = (10 - 2{,}5) dot (9 - 2) - 1/2(5 - 2{,}5)(9 - 4) - 1/2(10 - 5)(4 - 2)$
      $S = 7{,}5 dot 7 - 1/2 dot 2{,}5 dot 5 - 1/2 dot 5 dot 2 = 52{,}5 - 6{,}25 - 5 = 41{,}25$.
      Vì $41{,}25 in.not ZZ$ nên diện tích không phải là một số nguyên.
  ]
)

#ds(
  [Cho hệ bất phương trình $cases(2x - 3/2 y >= 1, 4x - 3y <= 2)$ có tập nghiệm $S$. Xét tính đúng sai của các khẳng định sau:],
  (
    [$(-1/4; -1) in.not S$.],
    True([$S = {(x; y) in RR^2 mid 4x - 3y = 2}$.]),
    True([Miền nghiệm là đường thẳng $4x - 3y = 2$.]),
    [Biểu diễn hình học của tập nghiệm là một nửa mặt phẳng.],
  ),
  loigiai: [
    Biến đổi hệ bất phương trình:
    Nhân cả hai vế của bất phương trình thứ nhất với $2$:
    $2(2x - 3/2 y) >= 2 dot 1 <=> 4x - 3y >= 2$.
    Kết hợp với bất phương trình thứ hai: $4x - 3y <= 2$.
    Hệ tương đương với: $cases(4x - 3y >= 2, 4x - 3y <= 2) <=> 4x - 3y = 2$.
    Do đó tập nghiệm là tập hợp các điểm nằm trên đường thẳng $d: 4x - 3y = 2$.
    - *a) Sai:* Thay $x = -1/4, y = -1$ vào: $4(-1/4) - 3(-1) = -1 + 3 = 2$, thỏa mãn phương trình. Vậy $(-1/4; -1) in S$.
    - *b) Đúng:* Tập nghiệm chính là tập hợp tất cả các cặp $(x; y)$ thỏa mãn $4x - 3y = 2$.
    - *c) Đúng:* Biểu diễn hình học của tập nghiệm chính là đường thẳng $4x - 3y = 2$.
    - *d) Sai:* Miền nghiệm là một đường thẳng (tập hợp có số chiều bằng 1), không phải là một nửa mặt phẳng (tập hợp có số chiều bằng 2).
  ]
)

#ds(
  [Trong một cuộc thi pha chế, hai đội được dùng tối đa 24g hương liệu, 9 lít nước và 210g đường để pha chế nước cam và nước táo. Để pha chế 1 lít nước cam cần 30g đường, 1 lít nước và 1g hương liệu; pha chế 1 lít nước táo cần 10g đường, 1 lít nước và 4g hương liệu. Gọi $x, y$ lần lượt là số lít nước cam và nước táo mà mỗi đội cần pha chế. Khi đó:],
  (
    [Hệ bất phương trình thỏa mãn là $cases(30x + 10y > 210, x + y <= 9, x + 4y <= 24, x >= 0, y >= 0)$.],
    True([Miền nghiệm của hệ bất phương trình chứa gốc toạ độ $O(0; 0)$.]),
    [Điểm $M(4; 3)$ không thuộc miền nghiệm của hệ bất phương trình.],
    True([Điểm $N(5; 6)$ không thuộc miền nghiệm của hệ bất phương trình.]),
  ),
  loigiai: [
    - *a) Sai:* Vì lượng đường sử dụng không vượt quá 210g nên bất phương trình về đường phải là $30x + 10y <= 210$, dấu "$>$" là sai.
    - *b) Đúng:* Thay $O(0; 0)$ vào hệ: $30(0) + 10(0) = 0 <= 210$, $0 + 0 <= 9$, $0 + 4(0) <= 24$, $0 >= 0, 0 >= 0$. Tất cả đều đúng nên gốc tọa độ $O$ thuộc miền nghiệm.
    - *c) Sai:* Thay $M(4; 3)$ vào hệ:
      $30(4) + 10(3) = 150 <= 210$ (đúng),
      $4 + 3 = 7 <= 9$ (đúng),
      $4 + 4(3) = 16 <= 24$ (đúng),
      $4 >= 0, 3 >= 0$ (đúng).
      Do đó $M(4; 3)$ thuộc miền nghiệm của hệ, khẳng định "không thuộc" là sai.
    - *d) Đúng:* Thay $N(5; 6)$ vào bất phương trình về nước: $5 + 6 = 11 > 9$ (vượt quá 9 lít nước). Do đó $N(5; 6)$ không thuộc miền nghiệm.
  ]
)

#ds(
  [Bà Lan được tư vấn bổ sung chế độ ăn kiêng đặc biệt bằng cách dùng hai loại thực phẩm $X$ và $Y$. Mỗi gói $X$ chứa 20 đơn vị canxi, 20 đơn vị sắt, 10 đơn vị vitamin B. Mỗi gói $Y$ chứa 20 đơn vị canxi, 10 đơn vị sắt, 20 đơn vị vitamin B. Nhu cầu tối thiểu mỗi ngày là 240 đơn vị canxi, 160 đơn vị sắt, 140 đơn vị vitamin B. Mỗi ngày không dùng quá 12 gói mỗi loại. Gọi $x, y$ là số gói thực phẩm $X, Y$ dùng mỗi ngày. Khi đó:],
  (
    True([Hệ BPT mô tả là $cases(x + y >= 12, 2x + y >= 16, x + 2y >= 14, 0 <= x <= 12, 0 <= y <= 12)$.]),
    True([Miền nghiệm của hệ bất phương trình là một hình ngũ giác.]),
    True([Nếu 1 gói $X$ giá 20.000 đồng, 1 gói $Y$ giá 25.000 đồng thì cần dùng 10 gói $X$ và 2 gói $Y$ để chi phí mua ít nhất.]),
    [Điểm $(10; 8)$ không thuộc miền nghiệm của hệ bất phương trình.],
  ),
  loigiai: [
    - *a) Đúng:* Lập các bất phương trình nhu cầu:
      + Canxi: $20x + 20y >= 240 <=> x + y >= 12$.
      + Sắt: $20x + 10y >= 160 <=> 2x + y >= 16$.
      + Vitamin B: $10x + 20y >= 140 <=> x + 2y >= 14$.
      + Giới hạn số gói: $0 <= x <= 12$ và $0 <= y <= 12$.
    - *b) Đúng:* Tìm các đỉnh của miền nghiệm trong hình vuông $[0; 12] times [0; 12]$:
      + $M_0(2; 12)$ (giao của $2x + y = 16$ với $y = 12$).
      + $M_1(4; 8)$ (giao của $2x + y = 16$ và $x + y = 12$).
      + $M_2(10; 2)$ (giao của $x + y = 12$ và $x + 2y = 14$).
      + $M_3(12; 1)$ (giao của $x + 2y = 14$ với $x = 12$).
      + $M_4(12; 12)$ (đỉnh góc trên bên phải).
      Miền nghiệm là đa giác có đúng 5 đỉnh $M_0, M_1, M_2, M_3, M_4$, tức là một ngũ giác.
    - *c) Đúng:* Hàm mục tiêu chi phí: $T(x, y) = 20x + 25y$ (nghìn đồng).
      Tính giá trị $T$ tại 5 đỉnh:
      + $T(M_0) = 20(2) + 25(12) = 340$.
      + $T(M_1) = 20(4) + 25(8) = 280$.
      + $T(M_2) = 20(10) + 25(2) = 250$.
      + $T(M_3) = 20(12) + 25(1) = 265$.
      + $T(M_4) = 20(12) + 25(12) = 540$.
      Chi phí nhỏ nhất là $250.000$ đồng, đạt tại $M_2(10; 2)$, nghĩa là bà Lan cần dùng 10 gói $X$ và 2 gói $Y$.
    - *d) Sai:* Thay tọa độ $(10; 8)$ vào hệ:
      $10 + 8 = 18 >= 12$, $2(10) + 8 = 28 >= 16$, $10 + 2(8) = 26 >= 14$, $0 <= 10 <= 12$, $0 <= 8 <= 12$.
      Tất cả đều thỏa mãn nên điểm $(10; 8)$ thuộc miền nghiệm. Khẳng định "không thuộc" là sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 5, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho các cặp số sau: $(0; 0), (1; 1), (-1; 1), (-1; -1)$. Hỏi có bao nhiêu cặp không là nghiệm của hệ bất phương trình $cases(x + y - 2 <= 0, 2x - 3y + 2 > 0)$?],
  [1],
  loigiai: [
    Thay lần lượt từng cặp số vào hệ bất phương trình:
    - Với $(0; 0)$: $0 + 0 - 2 = -2 <= 0$ (đúng) và $2(0) - 3(0) + 2 = 2 > 0$ (đúng) $=>$ Là nghiệm.
    - Với $(1; 1)$: $1 + 1 - 2 = 0 <= 0$ (đúng) và $2(1) - 3(1) + 2 = 1 > 0$ (đúng) $=>$ Là nghiệm.
    - Với $(-1; 1)$: $-1 + 1 - 2 = -2 <= 0$ (đúng), nhưng $2(-1) - 3(1) + 2 = -3 > 0$ (sai) $=>$ *Không là nghiệm*.
    - Với $(-1; -1)$: $-1 + (-1) - 2 = -4 <= 0$ (đúng) và $2(-1) - 3(-1) + 2 = 3 > 0$ (đúng) $=>$ Là nghiệm.
    Vậy trong 4 cặp số đã cho, chỉ có đúng $1$ cặp $(-1; 1)$ không phải là nghiệm của hệ.
  ]
)

#tln(
  dir: "ngang",
  [Cho hệ bất phương trình: $cases(2x - 1 >= 0, -y + 1 <= 0)$. Gọi $(x_0; y_0)$ là một nghiệm của hệ. Tìm giá trị nhỏ nhất của biểu thức $P = 3x_0 + y_0$.],
  [2.5],
  loigiai: [
    Từ hệ bất phương trình ta có:
    $2x - 1 >= 0 <=> x >= 1/2$,
    $-y + 1 <= 0 <=> y >= 1$.
    Vì các hệ số trong $P = 3x_0 + y_0$ đều dương nên:
    $P = 3x_0 + y_0 >= 3 dot (1/2) + 1 = 3/2 + 1 = 5/2 = 2{,}5$.
    Dấu bằng xảy ra khi $x_0 = 1/2$ và $y_0 = 1$.
    Vậy giá trị nhỏ nhất của biểu thức là $2{,}5$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hệ bất phương trình: $cases(2x + y <= 3, x >= 0, y >= 0)$. Gọi $(x_0; y_0)$ là một nghiệm của hệ. Tìm giá trị lớn nhất của tích $x_0 y_0$.],
  [1.125],
  loigiai: [
    Với $x_0 >= 0, y_0 >= 0$, áp dụng bất đẳng thức Cauchy cho hai số không âm $2x_0$ và $y_0$:
    $2x_0 dot y_0 <= ((2x_0 + y_0)/2)^2 <= (3/2)^2 = 9/4$.
    Suy ra:
    $x_0 y_0 <= 1/2 dot 9/4 = 9/8 = 1{,}125$.
    Dấu bằng xảy ra khi:
    $cases(2x_0 = y_0, 2x_0 + y_0 = 3) <=> cases(2x_0 = 3/2 => x_0 = 3/4, y_0 = 3/2)$.
    Cặp số $(3/4; 3/2)$ thỏa mãn các điều kiện $x >= 0, y >= 0$.
    Vậy giá trị lớn nhất của tích $x_0 y_0$ bằng $1{,}125$ (hay $9/8$).
  ]
)

#tln(
  dir: "ngang",
  [Một hộ nông dân dự định trồng dứa và củ đậu trên diện tích 8 ha. Trên mỗi ha, nếu trồng dứa cần 20 công và thu 3 triệu đồng; nếu trồng củ đậu cần 30 công và thu 4 triệu đồng. Tổng số công không quá 180. Cần trồng bao nhiêu ha củ đậu để thu được nhiều tiền nhất?],
  [2],
  loigiai: [
    Gọi $x, y$ lần lượt là số ha đất dùng để trồng dứa và củ đậu ($x >= 0, y >= 0$).
    Theo giả thiết đề bài ta có hệ bất phương trình:
    $cases(x + y <= 8, 20x + 30y <= 180, x >= 0, y >= 0) <=> cases(x + y <= 8, 2x + 3y <= 18, x >= 0, y >= 0)$.
    Miền nghiệm là tứ giác $O A B C$ với:
    - $O(0; 0)$,
    - $A(8; 0)$ (giao điểm của $x + y = 8$ với $O x$),
    - $B(6; 2)$ (giao điểm của $x + y = 8$ và $2x + 3y = 18$),
    - $C(0; 6)$ (giao điểm của $2x + 3y = 18$ với $O y$).
    Tổng số tiền thu được là hàm số: $F(x, y) = 3x + 4y$ (triệu đồng).
    Tính giá trị của $F$ tại các đỉnh:
    - $F(0; 0) = 0$.
    - $F(8; 0) = 3(8) + 4(0) = 24$ triệu đồng.
    - $F(6; 2) = 3(6) + 4(2) = 18 + 8 = 26$ triệu đồng.
    - $F(0; 6) = 3(0) + 4(6) = 24$ triệu đồng.
    Giá trị lớn nhất đạt được là $26$ triệu đồng khi $x = 6$ và $y = 2$.
    Vậy hộ nông dân cần trồng $2$ ha củ đậu (và $6$ ha dứa) để thu được nhiều tiền nhất.
  ]
)

#tln(
  dir: "ngang",
  [Người ta dự định dùng hai loại nguyên liệu là mía và củ cải đường để chiết xuất ít nhất 140 kg đường kính và 9 kg đường cát. Từ mỗi tấn mía giá 4 triệu đồng, chiết xuất được 20 kg đường kính và 0,6 kg đường cát. Từ mỗi tấn củ cải đường giá 3 triệu đồng, chiết xuất được 10 kg đường kính và 1,5 kg đường cát. Biết cơ sở chỉ cung cấp không quá 10 tấn mía và không quá 9 tấn củ cải đường. Tìm số tấn mía tối ưu để chi phí mua nguyên liệu là ít nhất.],
  [5],
  loigiai: [
    Gọi $x, y$ lần lượt là số tấn mía và củ cải đường cần mua ($0 <= x <= 10, 0 <= y <= 9$).
    Lượng đường kính thu được: $20x + 10y >= 140 <=> 2x + y >= 14$.
    Lượng đường cát thu được: $0{,}6x + 1{,}5y >= 9 <=> 2x + 5y >= 30$.
    Hệ bất phương trình mô tả miền phương án:
    $cases(2x + y >= 14, 2x + 5y >= 30, 0 <= x <= 10, 0 <= y <= 9)$.
    Miền nghiệm là tứ giác có 4 đỉnh:
    - $A(5; 4)$ (giao điểm của $2x + y = 14$ và $2x + 5y = 30$).
    - $B(2{,}5; 9)$ (giao điểm của $2x + y = 14$ với $y = 9$).
    - $C(10; 2)$ (giao điểm của $2x + 5y = 30$ với $x = 10$).
    - $D(10; 9)$ (giao điểm của $x = 10$ và $y = 9$).
    Tổng chi phí mua nguyên liệu là hàm: $F(x, y) = 4x + 3y$ (triệu đồng).
    Tính $F(x, y)$ tại các đỉnh:
    - Tại $A(5; 4)$: $F(5; 4) = 4(5) + 3(4) = 32$ triệu đồng.
    - Tại $B(2{,}5; 9)$: $F(2{,}5; 9) = 4(2{,}5) + 3(9) = 10 + 27 = 37$ triệu đồng.
    - Tại $C(10; 2)$: $F(10; 2) = 4(10) + 3(2) = 40 + 6 = 46$ triệu đồng.
    - Tại $D(10; 9)$: $F(10; 9) = 4(10) + 3(9) = 40 + 27 = 67$ triệu đồng.
    Chi phí nhỏ nhất là $32$ triệu đồng, đạt được khi $x = 5$ và $y = 4$.
    Vậy số tấn mía tối ưu cần mua là $5$ tấn.
  ]
)
