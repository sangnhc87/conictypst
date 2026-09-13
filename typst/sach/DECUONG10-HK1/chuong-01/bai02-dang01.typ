#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Tập hợp và các phần tử của tập hợp", mau: C1)

#phuong-phap(mau: C1)[
  - *Cách liệt kê*: Liệt kê tất cả các phần tử của tập hợp trong dấu ngoặc nhọn `{ }`, các phần tử cách nhau bởi dấu chấm phẩy `;`. Mỗi phần tử chỉ viết một lần.
  - *Cách nêu tính chất đặc trưng*: Chỉ ra các tính chất mà mọi phần tử của tập hợp đều thỏa mãn và chỉ có chúng thỏa mãn: $A = {x in X mid P(x)}$.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Viết lại các tập hợp sau bằng cách liệt kê các phần tử của nó:
    + $A = {x in RR mid (2x^2 - 5x + 3)(x^2 - 4x + 3) = 0}$.
    + $B = {x in NN mid (2x^2 - 5x + 3)(x^2 - 4x + 3) = 0}$.
    + $C = {x in NN mid x < 5}$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Giải phương trình tích $(2x^2 - 5x + 3)(x^2 - 4x + 3) = 0$:
      $ hoac(2x^2 - 5x + 3 = 0, x^2 - 4x + 3 = 0) <=> hoac(x = 1 " hoặc " x = 3/2, x = 1 " hoặc " x = 3) <=> x in {1; 3/2; 3} $
      Vì $x in RR$ nên tất cả các nghiệm đều thỏa mãn. Vậy $A = {1; 3/2; 3}$.
    - *b)* Ta lấy các nghiệm ở câu a) thỏa mãn điều kiện $x in NN$:
      Trong ba nghiệm $1, 3/2, 3$, chỉ có $1 in NN$ và $3 in NN$ (loại $3/2 in.not NN$).
      Vậy $B = {1; 3}$.
    - *c)* Các số tự nhiên nhỏ hơn $5$ là $0, 1, 2, 3, 4$.
      Vậy $C = {0; 1; 2; 3; 4}$.
  ])

  #bt-item(2, [Viết lại các tập hợp sau bằng cách chỉ rõ tính chất đặc trưng cho các phần tử của nó:
    + $A = {0; 1; 2; 3; 4}$.
    + $B = {9; 36; 81; 144}$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Nhận xét: Tập $A$ gồm các số tự nhiên liên tiếp từ $0$ đến $4$.
      Do đó ta có thể biểu diễn theo tính chất đặc trưng là:
      $A = {x in NN mid x <= 4}$ (hoặc $A = {x in NN mid x < 5}$).
    - *b)* Nhận xét:
      - $9 = 3^2 = (3 dot 1)^2$
      - $36 = 6^2 = (3 dot 2)^2$
      - $81 = 9^2 = (3 dot 3)^2$
      - $144 = 12^2 = (3 dot 4)^2$
      Các phần tử đều có dạng $(3n)^2$ với $n$ là các số tự nhiên từ $1$ đến $4$.
      Vậy ta có thể viết: $B = {(3n)^2 mid n in NN^*, n <= 4}$ (hoặc $B = {x in NN^* mid x " là bội của 9 và " x <= 144, sqrt(x) " chia hết cho " 3}$).
  ])

  #bt-item(3, [Viết lại các tập hợp sau bằng cách liệt kê các phần tử:
    + $A = {x in RR mid 2x^2 - 5x + 3 = 0}$.
    + $B = {x in NN mid (9 - x^2)(x^2 - 3x + 2) = 0}$.
    + $C = {x in QQ mid (5 - x^2)(x^2 - 5x + 6) = 0}$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Phương trình bậc hai $2x^2 - 5x + 3 = 0$ có $a + b + c = 2 - 5 + 3 = 0$.
      Do đó phương trình có hai nghiệm thực: $x = 1$ và $x = 3/2$.
      Vậy $A = {1; 3/2}$.
    - *b)* Giải phương trình tích:
      $ (9 - x^2)(x^2 - 3x + 2) = 0 <=> hoac(9 - x^2 = 0, x^2 - 3x + 2 = 0) <=> hoac(x = plus.minus 3, x = 1 " hoặc " x = 2) $
      Vì $x in NN$ nên ta chỉ nhận các giá trị $x in {1; 2; 3}$ (loại $x = -3$).
      Vậy $B = {1; 2; 3}$.
    - *c)* Giải phương trình tích:
      $ (5 - x^2)(x^2 - 5x + 6) = 0 <=> hoac(5 - x^2 = 0, x^2 - 5x + 6 = 0) <=> hoac(x = plus.minus sqrt(5), x = 2 " hoặc " x = 3) $
      Vì $x in QQ$ (số hữu tỉ) nên loại hai nghiệm vô tỉ $plus.minus sqrt(5) in.not QQ$.
      Vậy $C = {2; 3}$.
  ])

  #bt-item(4, [Cho tập hợp $A = {x in ZZ mid (x^2 + 2)/x in ZZ}$:
    + Hãy xác định tập $A$ bằng cách liệt kê các phần tử.
    + Tìm tất cả các tập con của tập hợp $A$ mà số phần tử của nó nhỏ hơn $3$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Với $x in ZZ$ và $x != 0$, ta phân tích biểu thức:
      $ (x^2 + 2)/x = x + 2/x $
      Vì $x in ZZ$ nên để $(x^2 + 2)/x in ZZ$ thì $2/x in ZZ$, tức là $x$ phải là ước của $2$.
      Các ước nguyên của $2$ là: $x in {-2; -1; 1; 2}$.
      Thử lại, tất cả các giá trị trên đều thỏa mãn. Vậy $A = {-2; -1; 1; 2}$.
    - *b)* Tập $A$ có $4$ phần tử. Các tập con của $A$ có số phần tử nhỏ hơn $3$ gồm:
      - *Tập con có $0$ phần tử:* Tập rỗng $emptyset$.
      - *Tập con có $1$ phần tử:* Có $4$ tập là ${-2}$, ${-1}$, ${1}$, ${2}$.
      - *Tập con có $2$ phần tử:* Có $C_4^2 = 6$ tập gồm:
        ${-2; -1}, {-2; 1}, {-2; 2}, {-1; 1}, {-1; 2}, {1; 2}$.
      Tổng cộng có $1 + 4 + 6 = 11$ tập con thỏa mãn yêu cầu.
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 14, reset-counter: true)

#tn(
  dir: "ngang",
  [Ký hiệu nào sau đây dùng để viết đúng mệnh đề: "3 là một số tự nhiên"?],
  (
    [$3 subset NN$.],
    True([$3 in NN$.]),
    [$3 < NN$.],
    [$3 <= NN$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ký hiệu $in$ ("thuộc") biểu thị quan hệ giữa một phần tử và một tập hợp. Vì $3$ là một phần tử thuộc tập số tự nhiên $NN$ nên mệnh đề viết đúng là $3 in NN$.
    (Ký hiệu $subset$ chỉ dùng cho quan hệ giữa hai tập hợp).
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Ký hiệu nào sau đây để chỉ $sqrt(5)$ không phải là một số hữu tỉ?],
  (
    [$sqrt(5) != QQ$.],
    [$sqrt(5) subset.not QQ$.],
    True([$sqrt(5) in.not QQ$.]),
    [$sqrt(5) subset QQ$.],
  ),
  loigiai: [
    Để chỉ một phần tử không thuộc về một tập hợp, ta dùng ký hiệu $in.not$. Do đó khẳng định "$sqrt(5)$ không thuộc $QQ$" được viết là $sqrt(5) in.not QQ$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Cho $A = {x in NN^* mid x < 10, x " chia hết cho " 3}$. Khẳng định nào đúng?],
  (
    [$A$ có 4 phần tử.],
    True([$A$ có 3 phần tử.]),
    [$A$ có 5 phần tử.],
    [$A$ có 2 phần tử.],
  ),
  loigiai: [
    Các số tự nhiên khác $0$ ($x in NN^*$) nhỏ hơn $10$ và chia hết cho $3$ gồm: $3, 6, 9$.
    Do đó $A = {3; 6; 9}$. Tập hợp $A$ có đúng $3$ phần tử.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {x + 1 mid x in NN, x <= 5}$. Tập hợp $A$ là:],
  (
    [$A = {1; 2; 3; 4; 5}$.],
    [$A = {0; 1; 2; 3; 4; 5; 6}$.],
    [$A = {0; 1; 2; 3; 4; 5}$.],
    True([$A = {1; 2; 3; 4; 5; 6}$.]),
  ),
  loigiai: [
    Vì $x in NN$ và $x <= 5$ nên $x in {0; 1; 2; 3; 4; 5}$.
    Khi đó các phần tử của tập hợp $A$ có dạng $x + 1$:
    - $x = 0 => x + 1 = 1$
    - $x = 1 => x + 1 = 2$
    - $x = 2 => x + 1 = 3$
    - $x = 3 => x + 1 = 4$
    - $x = 4 => x + 1 = 5$
    - $x = 5 => x + 1 = 6$
    Vậy $A = {1; 2; 3; 4; 5; 6}$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Hãy liệt kê các phần tử của tập hợp $X = {x in ZZ mid 2x^2 - 3x + 1 = 0}$.],
  (
    [$X = {0}$.],
    True([$X = {1}$.]),
    [$X = {1; 1/2}$.],
    [$X = {1; 3/2}$.],
  ),
  loigiai: [
    Giải phương trình bậc hai: $2x^2 - 3x + 1 = 0 <=> (x - 1)(2x - 1) = 0 <=> x = 1$ hoặc $x = 1/2$.
    Vì điều kiện của phần tử là $x in ZZ$ (số nguyên) nên ta chỉ nhận $x = 1$ (loại $x = 1/2 in.not ZZ$).
    Vậy $X = {1}$.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Liệt kê các phần tử của tập hợp $X = {x in RR mid 2x^2 - 5x + 3 = 0}$.],
  (
    [$X = {0}$.],
    [$X = {1}$.],
    [$X = {3/2}$.],
    True([$X = {1; 3/2}$.]),
  ),
  loigiai: [
    Phương trình $2x^2 - 5x + 3 = 0$ có $a + b + c = 2 - 5 + 3 = 0$ nên có hai nghiệm là $x = 1$ và $x = 3/2$.
    Vì điều kiện $x in RR$ nên cả hai nghiệm đều được nhận.
    Vậy $X = {1; 3/2}$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Trong các tập sau, tập nào là tập rỗng?],
  (
    [${x in ZZ mid |x| < 1}$.],
    [${x in ZZ mid 6x^2 - 7x + 1 = 0}$.],
    True([${x in QQ mid x^2 - 4x + 2 = 0}$.]),
    [${x in RR mid x^2 - 4x + 3 = 0}$.],
  ),
  loigiai: [
    Xét từng phương án:
    - Phương án A: $|x| < 1$ với $x in ZZ <=> x = 0 => {0} != emptyset$.
    - Phương án B: $6x^2 - 7x + 1 = 0 <=> x = 1$ hoặc $x = 1/6$. Với $x in ZZ$ thì có phần tử $1 => {1} != emptyset$.
    - Phương án C: Phương trình $x^2 - 4x + 2 = 0$ có $Delta' = 4 - 2 = 2 > 0$, nghiệm là $x = 2 plus.minus sqrt(2)$. Do $sqrt(2)$ là số vô tỉ nên cả hai nghiệm đều không thuộc tập số hữu tỉ $QQ$. Vậy tập hợp này không chứa phần tử nào, tức là tập rỗng $emptyset$.
    - Phương án D: $x^2 - 4x + 3 = 0 <=> x = 1, x = 3 => {1; 3} != emptyset$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $M = {(x; y) mid x, y in NN, x + y = 1}$. Hỏi tập $M$ có bao nhiêu phần tử?],
  (
    [$0$.],
    [$1$.],
    True([$2$.]),
    [$3$.],
  ),
  loigiai: [
    Vì $x, y in NN$ (số tự nhiên không âm) và $x + y = 1$ nên ta có các trường hợp:
    - $x = 0 => y = 1$ (cặp $(0; 1)$).
    - $x = 1 => y = 0$ (cặp $(1; 0)$).
    Tập hợp $M = {(0; 1); (1; 0)}$ có đúng $2$ phần tử (mỗi phần tử là một cặp số).
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {x^2 + 1 mid x in NN, x <= 5}$. Hãy liệt kê các phần tử của tập hợp $A$.],
  (
    [$A = {0; 1; 2; 3; 4; 5}$.],
    True([$A = {1; 2; 5; 10; 17; 26}$.]),
    [$A = {2; 5; 10; 17; 26}$.],
    [$A = {0; 1; 4; 9; 16; 25}$.],
  ),
  loigiai: [
    Vì $x in NN$ và $x <= 5$ nên $x in {0; 1; 2; 3; 4; 5}$.
    Tính giá trị $x^2 + 1$ tương ứng:
    - $x = 0 => 0^2 + 1 = 1$
    - $x = 1 => 1^2 + 1 = 2$
    - $x = 2 => 2^2 + 1 = 5$
    - $x = 3 => 3^2 + 1 = 10$
    - $x = 4 => 4^2 + 1 = 17$
    - $x = 5 => 5^2 + 1 = 26$
    Vậy $A = {1; 2; 5; 10; 17; 26}$.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Hãy liệt kê các phần tử của tập hợp $X = {x in RR mid x^4 - 6x^2 + 8 = 0}$.],
  (
    [$X = {2; 4}$.],
    [$X = {-sqrt(2); sqrt(2)}$.],
    [$X = {sqrt(2); 2}$.],
    True([$X = {-2; -sqrt(2); sqrt(2); 2}$.]),
  ),
  loigiai: [
    Đặt $t = x^2 (t >= 0)$. Phương trình trở thành:
    $ t^2 - 6t + 8 = 0 <=> hoac(t = 2, t = 4) $
    - Với $t = 2 <=> x^2 = 2 <=> x = plus.minus sqrt(2)$.
    - Với $t = 4 <=> x^2 = 4 <=> x = plus.minus 2$.
    Vì $x in RR$ nên tập $X$ có $4$ phần tử thực: $X = {-2; -sqrt(2); sqrt(2); 2}$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $M = {(x; y) mid x, y in RR, x^2 + y^2 <= 0}$. Khi đó tập hợp $M$ có bao nhiêu phần tử?],
  (
    [$0$.],
    True([$1$.]),
    [$2$.],
    [Vô số.],
  ),
  loigiai: [
    Với mọi số thực $x, y in RR$, ta luôn có $x^2 >= 0$ và $y^2 >= 0$, do đó $x^2 + y^2 >= 0$.
    Dấu bằng xảy ra khi và chỉ khi đồng thời $x = 0$ và $y = 0$.
    Do đó bất phương trình $x^2 + y^2 <= 0$ chỉ có một nghiệm duy nhất là cặp $(0; 0)$.
    Vậy tập hợp $M = {(0; 0)}$ có đúng $1$ phần tử.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Số phần tử của tập hợp $A = {x in RR mid (x^2 + x)^2 = x^2 - 2x + 1}$ là:],
  (
    [$0$.],
    [$3$.],
    [$1$.],
    True([$2$.]),
  ),
  loigiai: [
    Biến đổi vế phải thành hằng đẳng thức: $x^2 - 2x + 1 = (x - 1)^2$.
    Phương trình đã cho trở thành:
    $ (x^2 + x)^2 = (x - 1)^2 <=> hoac(x^2 + x = x - 1, x^2 + x = -(x - 1)) <=> hoac(x^2 + 1 = 0 "(vô nghiệm)", x^2 + 2x - 1 = 0) $
    Phương trình $x^2 + 2x - 1 = 0$ có biệt thức thu gọn $Delta' = 1^2 - 1 dot (-1) = 2 > 0$, do đó có hai nghiệm thực phân biệt $x = -1 plus.minus sqrt(2)$.
    Vậy tập hợp $A$ có đúng $2$ phần tử.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Số tập con của tập hợp $A = {x in RR mid 3(x^2 + x)^2 - 2x^2 - 2x = 0}$ là:],
  (
    True([$16$.]),
    [$8$.],
    [$12$.],
    [$10$.],
  ),
  loigiai: [
    Phương trình được viết lại thành: $3(x^2 + x)^2 - 2(x^2 + x) = 0$.
    Đặt $t = x^2 + x$, ta có:
    $ 3t^2 - 2t = 0 <=> t(3t - 2) = 0 <=> hoac(t = 0, t = 2/3) $
    - Với $t = 0 <=> x^2 + x = 0 <=> x(x + 1) = 0 <=> x = 0$ hoặc $x = -1$.
    - Với $t = 2/3 <=> x^2 + x - 2/3 = 0 <=> 3x^2 + 3x - 2 = 0$. Phương trình có $Delta = 9 - 4(3)(-2) = 33 > 0$, có hai nghiệm thực phân biệt $x = (-3 plus.minus sqrt(33))/6$ (khác $0$ và $-1$).
    Như vậy tập hợp $A$ có $n = 4$ phần tử thực phân biệt.
    Số tập hợp con của một tập hợp có $n$ phần tử là $2^n = 2^4 = 16$.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Số phần tử của tập hợp $A = {x in RR mid (2x^2 + x - 4)^2 = 4x^2 - 4x + 1}$ là:],
  (
    [$0$.],
    [$2$.],
    True([$4$.]),
    [$3$.],
  ),
  loigiai: [
    Nhận xét vế phải là hằng đẳng thức: $4x^2 - 4x + 1 = (2x - 1)^2$.
    Phương trình tương đương với:
    $ (2x^2 + x - 4)^2 = (2x - 1)^2 <=> hoac(2x^2 + x - 4 = 2x - 1, 2x^2 + x - 4 = -(2x - 1)) <=> hoac(2x^2 - x - 3 = 0, 2x^2 + 3x - 5 = 0) $
    - Phương trình (1): $2x^2 - x - 3 = 0$ có $a - b + c = 2 - (-1) + (-3) = 0 => x = -1$ hoặc $x = 3/2$.
    - Phương trình (2): $2x^2 + 3x - 5 = 0$ có $a + b + c = 2 + 3 - 5 = 0 => x = 1$ hoặc $x = -5/2$.
    Bốn nghiệm này hoàn toàn đôi một khác nhau.
    Do đó tập hợp $A = {-5/2; -1; 1; 3/2}$ có đúng $4$ phần tử.
    Chọn đáp án *C*.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 5, reset-counter: true)

#ds(
  [Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tập hợp $A = {x in ZZ mid 1 < x < 10}$ có 8 phần tử.]),
    True([Tập hợp $B = {x in RR mid x^2 + x = 0}$ có 2 phần tử.]),
    True([Tập hợp $C = {x in QQ mid (x^2 - 1)(x - sqrt(2))(2x + 3) = 0}$ có 3 phần tử.]),
    True([Tập hợp $D = {n in NN mid -4 < 2n - 1 < 5}$ có 3 phần tử.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, vì $x in ZZ$ và $1 < x < 10$ nên $x in {2; 3; 4; 5; 6; 7; 8; 9}$. Tập $A$ có đúng $8$ phần tử.
    - b) *Đúng*, giải phương trình $x^2 + x = 0 <=> x(x + 1) = 0 <=> x = 0$ hoặc $x = -1$. Cả hai nghiệm đều là số thực nên $B = {-1; 0}$ có $2$ phần tử.
    - c) *Đúng*, phương trình tích:
      $ (x^2 - 1)(x - sqrt(2))(2x + 3) = 0 <=> hoac(x = plus.minus 1, x = sqrt(2), x = -3/2) $
      Vì điều kiện $x in QQ$ (số hữu tỉ) nên ta nhận $x = 1, x = -1, x = -3/2$ và loại nghiệm vô tỉ $sqrt(2) in.not QQ$. Vậy $C = {-3/2; -1; 1}$ có đúng $3$ phần tử.
    - d) *Đúng*, bất phương trình kép:
      $ -4 < 2n - 1 < 5 <=> -3 < 2n < 6 <=> -1.5 < n < 3 $
      Vì $n in NN$ (số tự nhiên) nên $n in {0; 1; 2}$. Vậy $D = {0; 1; 2}$ có đúng $3$ phần tử.
  ]
)

#ds(
  [Cho các tập hợp: $A$ là các số nguyên tố nhỏ hơn 11; $B = {x in RR mid 3x^2 - 4x + 1 = 0}$; $C = {x in NN mid (x^2 - 5x + 6)(2x + 1) = 0}$; $D = {x in ZZ mid |x + 1| < 3}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tập hợp $A$ có 4 phần tử.]),
    [Tập hợp $B$ có 3 phần tử.],
    [Tập hợp $C$ có 3 phần tử.],
    [Tập hợp $D$ có 3 phần tử.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, các số nguyên tố nhỏ hơn $11$ là $2, 3, 5, 7$. Vậy $A = {2; 3; 5; 7}$ có đúng $4$ phần tử.
    - b) *Sai*, phương trình bậc hai $3x^2 - 4x + 1 = 0$ có $a + b + c = 3 - 4 + 1 = 0$ nên chỉ có $2$ nghiệm là $x = 1$ và $x = 1/3$. Vậy $B = {1/3; 1}$ có $2$ phần tử.
    - c) *Sai*, giải phương trình: $(x^2 - 5x + 6)(2x + 1) = 0 <=> x = 2, x = 3$ hoặc $x = -1/2$. Vì $x in NN$ nên loại $x = -1/2 in.not NN$. Vậy $C = {2; 3}$ chỉ có $2$ phần tử.
    - d) *Sai*, bất phương trình: $|x + 1| < 3 <=> -3 < x + 1 < 3 <=> -4 < x < 2$. Vì $x in ZZ$ nên $x in {-3; -2; -1; 0; 1}$. Tập $D$ có $5$ phần tử.
  ]
)

#ds(
  [Cho các tập hợp sau: $A = {x in RR mid 6x^2 - 7x + 1 = 0}$; $B = {x in ZZ mid |x| < 1}$; $C = {x in QQ mid x^2 - 4x + 2 = 0}$; $D = {x in RR mid x^2 - 4x + 3 = 0}$. Xét tính đúng sai của các khẳng định sau:],
  (
    [Tập hợp $A$ là tập hợp rỗng.],
    [Tập hợp $B$ là tập hợp rỗng.],
    True([Tập hợp $C$ là tập hợp rỗng.]),
    [Tập hợp $D$ là tập hợp rỗng.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, phương trình $6x^2 - 7x + 1 = 0$ có nghiệm $x = 1, x = 1/6 in RR$, do đó $A = {1/6; 1} != emptyset$.
    - b) *Sai*, với $x in ZZ$, $|x| < 1 <=> x = 0$, do đó $B = {0} != emptyset$.
    - c) *Đúng*, phương trình $x^2 - 4x + 2 = 0$ có nghiệm $x = 2 plus.minus sqrt(2)$. Do $sqrt(2) in.not QQ$ nên phương trình không có nghiệm hữu tỉ. Vậy $C = emptyset$.
    - d) *Sai*, phương trình $x^2 - 4x + 3 = 0$ có nghiệm $x = 1, x = 3 in RR$, do đó $D = {1; 3} != emptyset$.
  ]
)

#ds(
  [Cho các tập hợp sau: $A = {x in QQ mid x^2 - x - 6 = 0}$; $B = {x in ZZ mid x^4 - 11x^2 + 18 = 0}$; $C = {x in NN mid (x^2 - 3x - 10)(5x^3 - 6x^2 + x) = 0}$; $D = {x in ZZ mid -2 < 3x + 7 <= 10}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tập hợp $A$ có 2 phần tử.]),
    [Tập hợp $B$ có 3 phần tử.],
    [Tập hợp $C$ có 2 phần tử.],
    True([Tập hợp $D$ có 4 phần tử.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, giải phương trình: $x^2 - x - 6 = 0 <=> (x - 3)(x + 2) = 0 <=> x = 3$ hoặc $x = -2$. Cả hai nghiệm đều thuộc $QQ$ nên $A = {-2; 3}$ có $2$ phần tử.
    - b) *Sai*, đặt $t = x^2 (t >= 0)$, ta có $t^2 - 11t + 18 = 0 <=> t = 2$ hoặc $t = 9$.
      - Với $t = 2 <=> x^2 = 2 <=> x = plus.minus sqrt(2) in.not ZZ$ (loại).
      - Với $t = 9 <=> x^2 = 9 <=> x = plus.minus 3 in ZZ$ (nhận).
      Vậy $B = {-3; 3}$ chỉ có $2$ phần tử. Khẳng định nói $B$ có $3$ phần tử là sai.
    - c) *Sai*, giải phương trình tích:
      - $x^2 - 3x - 10 = 0 <=> x = 5$ (nhận vì $5 in NN$) hoặc $x = -2$ (loại vì $-2 in.not NN$).
      - $5x^3 - 6x^2 + x = 0 <=> x(5x^2 - 6x + 1) = 0 <=> x(x - 1)(5x - 1) = 0 <=> x = 0$ (nhận), $x = 1$ (nhận), $x = 1/5$ (loại vì không là số tự nhiên).
      Vậy các phần tử tự nhiên của $C$ là $x in {0; 1; 5}$, tức tập $C$ có đúng $3$ phần tử. Do đó khẳng định "$C$ có 2 phần tử" là sai.
    - d) *Đúng*, bất phương trình: $-2 < 3x + 7 <= 10 <=> -9 < 3x <= 3 <=> -3 < x <= 1$.
      Vì $x in ZZ$ nên $x in {-2; -1; 0; 1}$. Tập hợp $D$ có đúng $4$ phần tử.
  ]
)

#ds(
  [Cho các tập hợp: $A = {x in ZZ mid |x| < 1}$; $B = {x in ZZ mid 6x^2 - 7x + 1 = 0}$; $C = {x in QQ mid x^2 - 4x + 2 = 0}$; $D = {x in NN mid x^2 - 4x + 3 = 0}$. Xét tính đúng sai của các khẳng định sau:],
  (
    [Tập hợp $A$ có 2 phần tử.],
    True([Tập hợp $B$ có 1 phần tử.]),
    [Tập hợp $C$ có 3 phần tử.],
    True([Tập hợp $D$ có 2 phần tử.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, vì $x in ZZ$, $|x| < 1 <=> -1 < x < 1 <=> x = 0$. Vậy $A = {0}$ chỉ có đúng $1$ phần tử.
    - b) *Đúng*, phương trình $6x^2 - 7x + 1 = 0$ có hai nghiệm là $x = 1$ và $x = 1/6$. Do $x in ZZ$ nên ta chỉ nhận $x = 1$ (loại $x = 1/6$). Vậy $B = {1}$ có đúng $1$ phần tử.
    - c) *Sai*, phương trình $x^2 - 4x + 2 = 0$ có hai nghiệm vô tỉ là $x = 2 plus.minus sqrt(2) in.not QQ$. Do đó $C = emptyset$, số phần tử của $C$ là $0$.
    - d) *Đúng*, phương trình $x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3$. Cả hai nghiệm đều là số tự nhiên nên $D = {1; 3}$ có đúng $2$ phần tử.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 5, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tập $X = {x in RR mid (x^2 - 4)(x - 1) = 0}$. Tính tổng $S$ các phần tử của tập $X$.],
  [1],
  loigiai: [
    📌 *Phương pháp:* Giải phương trình tích tìm nghiệm thực.

    ✍️ *Lời giải chi tiết:* \
    Giải phương trình:
    $ (x^2 - 4)(x - 1) = 0 <=> hoac(x^2 - 4 = 0, x - 1 = 0) <=> hoac(x = plus.minus 2, x = 1) $
    Vì $x in RR$ nên tất cả các nghiệm đều thỏa mãn. Tập $X = {-2; 1; 2}$.
    Tổng các phần tử của tập $X$ là:
    $ S = (-2) + 1 + 2 = 1 $
    
    ✅ *Đáp số:* $1$.
  ]
)

#tln(
  dir: "ngang",
  [Tìm số phần tử của tập hợp $A = {x in RR mid (x - 1)(x + 2)(x^3 - 4x) = 0}$.],
  [4],
  loigiai: [
    📌 *Phương pháp:* Giải phương trình phân tích thành nhân tử.

    ✍️ *Lời giải chi tiết:* \
    Phân tích phương trình tích thành nhân tử:
    $ (x - 1)(x + 2) x (x^2 - 4) = 0 <=> x(x - 1)(x + 2)^2 (x - 2) = 0 $
    Phương trình có các nghiệm thực là:
    $ x = 0, quad x = 1, quad x = -2, quad x = 2 $
    Vì mỗi phần tử trong tập hợp chỉ được tính một lần nên tập $A = {-2; 0; 1; 2}$.
    Vậy tập hợp $A$ có đúng $4$ phần tử.
    
    ✅ *Đáp số:* $4$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập $X = {x in NN mid (x^2 - 4)(x - 1)(2x^2 - 7x + 3) = 0}$. Tính tổng $S$ các phần tử của $X$.],
  [6],
  loigiai: [
    📌 *Phương pháp:* Giải phương trình tìm tập nghiệm và tính tổng.

    ✍️ *Lời giải chi tiết:* \
    Giải phương trình tích:
    $ (x^2 - 4)(x - 1)(2x^2 - 7x + 3) = 0 <=> hoac(x^2 - 4 = 0, x - 1 = 0, 2x^2 - 7x + 3 = 0) $
    - $x^2 - 4 = 0 <=> x = plus.minus 2$.
    - $x - 1 = 0 <=> x = 1$.
    - $2x^2 - 7x + 3 = 0 <=> (2x - 1)(x - 3) = 0 <=> x = 1/2$ hoặc $x = 3$.
    Vì điều kiện $x in NN$ (số tự nhiên) nên ta chỉ chọn các nghiệm nguyên không âm: $x in {1; 2; 3}$ (loại $x = -2$ và $x = 1/2$).
    Do đó $X = {1; 2; 3}$.
    Tổng các phần tử là: $S = 1 + 2 + 3 = 6$.
    
    ✅ *Đáp số:* $6$.
  ]
)

#tln(
  dir: "ngang",
  [Tập hợp $A = {x in NN mid (x - 1)(x + 2)(x^3 + 4x) = 0}$ có bao nhiêu phần tử?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Giải phương trình và chọn các phần tử thỏa mãn.

    ✍️ *Lời giải chi tiết:* \
    Phương trình được phân tích thành:
    $ (x - 1)(x + 2) x (x^2 + 4) = 0 $
    Vì $x^2 + 4 >= 4 > 0$ với mọi $x in RR$ nên phương trình chỉ có các nghiệm thực:
    $ x = 0, quad x = 1, quad x = -2 $
    Vì điều kiện $x in NN$ nên ta chỉ nhận $x = 0$ và $x = 1$ (loại $x = -2 in.not NN$).
    Vậy tập hợp $A = {0; 1}$ có đúng $2$ phần tử.
    
    ✅ *Đáp số:* $2$.
  ]
)

#tln(
  dir: "ngang",
  [Xác định số phần tử của tập hợp $X = {n in NN mid n " chia hết cho " 4, n < 2017}$.],
  [505],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức số số hạng của cấp số cộng.

    ✍️ *Lời giải chi tiết:* \
    Các phần tử của tập hợp $X$ là các số tự nhiên chia hết cho $4$ và nhỏ hơn $2017$.
    Dãy các số thỏa mãn là dãy số cách đều có khoảng cách $d = 4$:
    $ 0, 4, 8, 12, dots, 2016 $
    (Số lớn nhất chia hết cho $4$ và nhỏ hơn $2017$ là $2016$, vì $2016 = 4 dot 504$).
    Áp dụng công thức tính số số hạng của cấp số cộng:
    $ "Số phần tử" = ("Số cuối" - "Số đầu")/("Khoảng cách") + 1 = (2016 - 0)/4 + 1 = 504 + 1 = 505 $
    Vậy tập hợp $X$ có $505$ phần tử.
    
    ✅ *Đáp số:* $505$.
  ]
)
