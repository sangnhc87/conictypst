#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Xác định hiệu và phần bù của hai tập hợp", mau: C1)

#phuong-phap(mau: C1)[
  - *Hiệu của hai tập hợp*: Tập hợp gồm các phần tử thuộc $A$ nhưng không thuộc $B$ gọi là hiệu của $A$ và $B$.
    $ A \\ B = {x mid x in A " và " x in.not B} $
  - *Phần bù*: Khi $A subset B$, hiệu $B \\ A$ được gọi là phần bù của $A$ trong $B$, kí hiệu là $C_B A$.
    $ C_B A = {x in B mid x in.not A} $
  - *Phần bù trong tập số thực*: $C_RR A = RR \\ A$.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Cho hai tập hợp $A = {1; 2; 3; 7}$ và $B = {2; 4; 6; 7; 8}$. Xác định các tập hợp $A sect B$, $A union B$, $A \\ B$, $B \\ A$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Xác định các phép toán tập hợp theo định nghĩa:
    - *Giao $A sect B$*: Gồm các phần tử chung của cả hai tập:
      $ A sect B = {2; 7}. $
    - *Hợp $A union B$*: Gồm các phần tử thuộc $A$ hoặc thuộc $B$:
      $ A union B = {1; 2; 3; 4; 6; 7; 8}. $
    - *Hiệu $A \\ B$*: Gồm các phần tử thuộc $A$ nhưng không thuộc $B$:
      $ A \\ B = {1; 3}. $
    - *Hiệu $B \\ A$*: Gồm các phần tử thuộc $B$ nhưng không thuộc $A$:
      $ B \\ A = {4; 6; 8}. $
  ])

  #bt-item(2, [Cho $A$ là tập hợp tất cả các nghiệm của phương trình $x^2 - 4x + 3 = 0$; $B$ là tập hợp các số có giá trị tuyệt đối nhỏ hơn $4$. Xác định tập hợp $A \\ B$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Giải phương trình tìm các phần tử của tập hợp $A$:
      $ x^2 - 4x + 3 = 0 <=> (x - 1)(x - 3) = 0 <=> #hoac("x = 1", "x = 3") => A = {1; 3}. $
    - Xác định tập hợp $B$:
      $ B = {x in RR mid |x| < 4} = (-4; 4). $
    - Vì cả hai số $1$ và $3$ đều thỏa mãn $-4 < 1 < 4$ và $-4 < 3 < 4$ nên $1 in B$ và $3 in B$, suy ra $A subset B$.
    Do đó tập hợp các phần tử thuộc $A$ mà không thuộc $B$ là tập rỗng:
    $ A \\ B = emptyset. $
  ])

  #bt-item(3, [Cho các tập hợp: $A = {x in RR mid x < 3}$, $B = {x in RR mid 1 < x <= 5}$, $C = {x in RR mid -2 <= x <= 4}$.
    + Hãy viết lại các tập hợp $A, B, C$ dưới kí hiệu khoảng, nửa khoảng, đoạn.
    + Tìm $A union B, A sect B, A \\ B$.
    + Tìm $C_RR A, C_RR B, C_RR C$.
    + Tìm $(B union C) \\ (A sect C)$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Viết lại các tập hợp dưới dạng kí hiệu tập con của $RR$:
      $ A = (-oo; 3), quad B = (1; 5], quad C = [-2; 4]. $
    - *b)* Thực hiện các phép toán giữa $A$ và $B$:
      - $A union B = (-oo; 3) union (1; 5] = (-oo; 5]$.
      - $A sect B = (-oo; 3) sect (1; 5] = (1; 3)$.
      - $A \\ B = (-oo; 3) \\ (1; 5] = (-oo; 1]$.
    - *c)* Phần bù trong tập số thực $RR$:
      - $C_RR A = RR \\ (-oo; 3) = [3; +oo)$.
      - $C_RR B = RR \\ (1; 5] = (-oo; 1] union (5; +oo)$.
      - $C_RR C = RR \\ [-2; 4] = (-oo; -2) union (4; +oo)$.
    - *d)* Ta có:
      - $B union C = (1; 5] union [-2; 4] = [-2; 5]$.
      - $A sect C = (-oo; 3) sect [-2; 4] = [-2; 3)$.
      Do đó: $(B union C) \\ (A sect C) = [-2; 5] \\ [-2; 3) = [3; 5]$.
  ])

  #bt-item(4, [Cho các tập hợp $A = (2; +oo)$ và $B = [m^2 - 7; +oo)$ với $m > 0$. Tìm tất cả các số thực $m$ để $A \\ B$ là một khoảng có độ dài bằng $16$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Để hiệu $A \\ B = (2; +oo) \\ [m^2 - 7; +oo)$ là một khoảng thì điểm bắt đầu của $B$ phải lớn hơn điểm bắt đầu của $A$:
    $ m^2 - 7 > 2 <=> m^2 > 9 <=> m > 3 text(" (do ") m > 0 text(")"). $
    Khi đó hiệu $A \\ B$ chính là khoảng $(2; m^2 - 7)$.
    Độ dài của khoảng $(2; m^2 - 7)$ bằng $16$ khi và chỉ khi:
    $ (m^2 - 7) - 2 = 16 <=> m^2 - 9 = 16 <=> m^2 = 25 <=> m = 5 text(" (thỏa mãn ") m > 3 text(")"). $
    Vậy $m = 5$ là giá trị cần tìm.
  ])

  #bt-item(5, [Cho khoảng $A = (-oo; 6/(2 - m))$ và khoảng $B = (1 - m; +oo)$. Tìm tất cả các giá trị thực của tham số $m$ để $A \\ B = A$.], loigiai: [
    Ta có tính chất cơ bản: $A \\ B = A <=> A sect B = emptyset$.
    Vì $A = (-oo; 6/(2 - m))$ và $B = (1 - m; +oo)$, hai khoảng này rời nhau khi và chỉ khi mút phải của $A$ không vượt quá mút trái của $B$:
    $ 6/(2 - m) <= 1 - m <=> 6/(2 - m) - (1 - m) <= 0 <=> (6 - (1 - m)(2 - m))/(2 - m) <= 0. $
    Khai triển và rút gọn tử thức:
    $ 6 - (2 - 3m + m^2) = -m^2 + 3m + 4 = -(m + 1)(m - 4). $
    Bất phương trình trở thành:
    $ (-(m + 1)(m - 4))/(2 - m) <= 0 <=> ((m + 1)(m - 4))/(m - 2) <= 0. $
    Lập bảng xét dấu vế trái với các nghiệm $-1, 2, 4$:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        stroke: 0.5pt + gray,
        align: center,
        [$m$], [$-oo$], [$-1$], [$2$], [$4$], [$+oo$],
        [Dấu biểu thức], [$-$], [$0$], [$+$], [$||$], [$-$], [$0$], [$+$]
      )
    ]
    Từ bảng xét dấu, nghiệm của bất phương trình là:
    $ #hoac("m <= -1", "2 < m <= 4"). $
    Vậy các giá trị thỏa mãn là $m in (-oo; -1] union (2; 4]$.
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 11, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho tập $X = {2; 4; 6; 9}, Y = {1; 2; 3; 4}$. Tập nào sau đây bằng tập $X \\ Y$?],
  (
    [${1; 2; 3; 5}$.],
    [${1; 3; 6; 9}$.],
    True([${6; 9}$.]),
    [${1}$.],
  ),
  loigiai: [Tập hợp $X \\ Y$ gồm các phần tử thuộc $X$ nhưng không thuộc $Y$. Lấy các phần tử ${2; 4; 6; 9}$ loại đi các phần tử thuộc $Y$ là ${2; 4}$, ta được ${6; 9}$. Chọn đáp án C.]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $A$ và $B$ khác rỗng thỏa mãn $A subset B$. Mệnh đề nào sau đây sai?],
  (
    [$A \\ B = emptyset$.],
    [$A sect B = A$.],
    True([$B \\ A = B$.]),
    [$A union B = B$.],
  ),
  loigiai: [
    Khi $A subset B$ và $A != emptyset$:
    - Vì mọi phần tử của $A$ đều nằm trong $B$ nên $A \\ B = emptyset$ (A đúng).
    - Giao của tập con và tập mẹ bằng tập con: $A sect B = A$ (B đúng).
    - Hợp của tập con và tập mẹ bằng tập mẹ: $A union B = B$ (D đúng).
    - Do $A != emptyset$ nên $B \\ A$ chứa ít phần tử hơn $B$, không thể bằng $B$ (C sai).
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $X = {1; 2; 3; 4}, Y = {1; 2}$. $C_X Y$ là tập hợp sau đây?],
  (
    [${1; 2}$.],
    [${1; 2; 3; 4}$.],
    True([${3; 4}$.]),
    [$emptyset$.],
  ),
  loigiai: [Phần bù của $Y$ trong $X$ chính là hiệu $X \\ Y = {1; 2; 3; 4} \\ {1; 2} = {3; 4}$. Chọn đáp án C.]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $A = {0; 1}$ và $B = {0; 1; 2; 3; 4}$. Số tập hợp $X$ thỏa mãn $X subset C_B A$ là:],
  (
    [$3$.],
    [$5$.],
    [$6$.],
    True([$8$.]),
  ),
  loigiai: [Ta có $C_B A = B \\ A = {2; 3; 4}$. Tập hợp này có 3 phần tử nên số tập con của nó là $2^3 = 8$. Chọn đáp án D.]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {1; 2; 3; 4; 5}$. Tìm số tập hợp $X$ sao cho $A \\ X = {1; 3; 5}$ và $X \\ A = {6; 7}$.],
  (
    True([$1$.]),
    [$2$.],
    [$3$.],
    [$4$.],
  ),
  loigiai: [
    - Do $A \\ X = {1; 3; 5}$ nên $X$ không chứa các phần tử $1, 3, 5$ và phải chứa các phần tử còn lại của $A$ là ${2; 4}$, tức là ${2; 4} subset X$.
    - Do $X \\ A = {6; 7}$ nên các phần tử của $X$ không thuộc $A$ chính là ${6; 7}$.
    Kết hợp lại: $X = (X sect A) union (X \\ A) = {2; 4} union {6; 7} = {2; 4; 6; 7}$.
    Vậy chỉ có duy nhất $1$ tập hợp $X$ thỏa mãn. Chọn đáp án A.
  ]
)

#tn(
  dir: "ngang",
  [Cho các tập hợp $A = {x in RR mid x < 3}, B = {x in RR mid 1 < x <= 5}, C = {x in RR mid -2 <= x <= 4}$. Khi đó $(B union C) \\ (A sect C)$ bằng:],
  (
    [${-2; 3}$.],
    True([$[3; 5]$.]),
    [$(-oo; 1]$.],
    [$[-2; 5]$.],
  ),
  loigiai: [
    Viết các tập hợp: $A = (-oo; 3), B = (1; 5], C = [-2; 4]$.
    - $B union C = (1; 5] union [-2; 4] = [-2; 5]$.
    - $A sect C = (-oo; 3) sect [-2; 4] = [-2; 3)$.
    - $(B union C) \\ (A sect C) = [-2; 5] \\ [-2; 3) = [3; 5]$.
    Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Cho $A = (-oo; 1], B = [1; +oo), C = (0; 1]$. Khẳng định nào sau đây sai?],
  (
    [$(A union B) \\ C = (-oo; 0] union (1; +oo)$.],
    True([$A sect B sect C = {-1}$.]),
    [$A union B union C = (-oo; +oo)$.],
    [$(A sect B) \\ C = emptyset$.],
  ),
  loigiai: [
    Ta có $A sect B = (-oo; 1] sect [1; +oo) = {1}$.
    Khi đó $A sect B sect C = {1} sect (0; 1] = {1} != {-1}$. Do đó phương án B sai. Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Cho các tập $A = {x in RR mid x >= -1}, B = {x in RR mid x < 3}$. Tập $RR \\ (A sect B)$ là:],
  (
    [$(-oo; -1) union [3; +oo)$.],
    [$(-1; 3]$.],
    [$[-1; 3)$.],
    True([$(-oo; -1) union [3; +oo)$.]),
  ),
  loigiai: [
    Ta có $A = [-1; +oo)$ và $B = (-oo; 3)$.
    Giao $A sect B = [-1; 3)$.
    Phần bù trong $RR$ là: $RR \\ (A sect B) = (-oo; -1) union [3; +oo)$.
    Chọn đáp án D.
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $A = (sqrt(2); +oo)$ và $B = (-oo; sqrt(5)/2]$. Khi đó $(A sect B) union (B \\ A)$ là:],
  (
    [$[sqrt(5)/2; sqrt(2)]$.],
    [$(sqrt(2); +oo)$.],
    True([$(-oo; sqrt(5)/2]$.]),
    [$(-oo; sqrt(5)/2)$.],
  ),
  loigiai: [
    Với hai tập hợp bất kì, ta luôn có đồng nhất thức tập hợp:
    $ (A sect B) union (B \\ A) = B. $
    Do đó biểu thức bằng chính tập $B = (-oo; sqrt(5)/2]$. Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {1; 2; 3; 4}, B = {0; 2; 4; 6}$. Mệnh đề nào sau đây đúng?],
  (
    True([$A sect B = {2; 4}$.]),
    [$A union B = {0; 1; 2; 3; 4; 5; 6}$.],
    [$A subset B$.],
    [$A \\ B = {0; 6}$.],
  ),
  loigiai: [
    Kiểm tra từng phương án:
    - Phương án A đúng vì phần tử chung của $A$ và $B$ là $2$ và $4$.
    - Phương án B sai vì hợp $A union B = {0; 1; 2; 3; 4; 6}$ không có số $5$.
    - Phương án C sai vì $1 in A$ nhưng $1 in.not B$.
    - Phương án D sai vì $A \\ B = {1; 3}$ chứ không phải ${0; 6}$ (tập ${0; 6}$ là $B \\ A$).
    Chọn đáp án A.
  ]
)

#tn(
  dir: "ngang",
  [Ký hiệu $H$ là tập hợp học sinh lớp 10A, $T$ là tập nam sinh, $G$ là tập nữ sinh của lớp 10A. Khẳng định nào sau đây sai?],
  (
    [$T union G = H$.],
    [$T sect G = emptyset$.],
    [$H \\ T = G$.],
    True([$G \\ T = emptyset$.]),
  ),
  loigiai: [
    Vì mỗi học sinh chỉ có thể là nam hoặc nữ nên $T sect G = emptyset$.
    Do đó $G \\ T = G != emptyset$ (vì lớp có nữ sinh). Khẳng định D sai. Chọn đáp án D.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Cho các tập hợp $A = {0; 1; 2; 3; 4; 5; 6}$, $B = {-3; -1; 1; 2; 3}$ và $C = {x in NN mid 6 " chia hết cho " x}$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$B \\ C = {-3; -1}$.]),
    True([$C \\ B = {6}$.]),
    True([$A \\ B = {0; 4; 5; 6}$.]),
    True([$B \\ A = {-3; -1}$.]),
  ),
  loigiai: [
    Tập hợp $C$ gồm các ước tự nhiên của 6: $C = {1; 2; 3; 6}$.
    - *a) Đúng:* Các phần tử thuộc $B$ nhưng không thuộc $C$ là $-3$ và $-1$. Vậy $B \\ C = {-3; -1}$.
    - *b) Đúng:* Các phần tử thuộc $C$ nhưng không thuộc $B$ chỉ có số $6$. Vậy $C \\ B = {6}$.
    - *c) Đúng:* Hiệu $A \\ B$ gồm các phần tử thuộc $A$ mà không thuộc $B$: ${0; 4; 5; 6}$.
    - *d) Đúng:* Hiệu $B \\ A$ gồm các phần tử thuộc $B$ mà không thuộc $A$: ${-3; -1}$.
  ]
)

#ds(
  [Cho hai tập hợp $A = (-1; +oo), B = (-oo; -1]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$A \\ B = (-1; +oo)$.]),
    True([$B \\ A = (-oo; -1]$.]),
    True([$C_RR A = (-oo; -1]$.]),
    True([$C_RR B = (-1; +oo)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Nhận xét: $A$ và $B$ là hai tập hợp rời nhau ($A sect B = emptyset$) và có hợp bằng toàn bộ trục số thực $A union B = RR$.
    - a) *Đúng*, vì $A sect B = emptyset$ nên $A \\ B = A = (-1; +oo)$.
    - b) *Đúng*, tương tự, $B \\ A = B = (-oo; -1]$.
    - c) *Đúng*, phần bù của $A$ trong $RR$ là $RR \\ (-1; +oo) = (-oo; -1]$.
    - d) *Đúng*, phần bù của $B$ trong $RR$ là $RR \\ (-oo; -1] = (-1; +oo)$.
  ]
)

#ds(
  [Cho hai tập hợp $A = {x in RR mid |x| < 3}$, $B = [-2; 2]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [$A \\ B = emptyset$.],
    True([$B \\ A = emptyset$.]),
    True([$C_RR A = (-oo; -3] union [3; +oo)$.]),
    True([$(C_RR B) sect A = (-3; -2) union (2; 3)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Biểu diễn các tập hợp dưới dạng khoảng, đoạn:
    $ A = (-3; 3) quad "và" quad B = [-2; 2]. $
    - a) *Sai*, do $[-2; 2] subset (-3; 3)$ nên $A \\ B = (-3; -2) union (2; 3) != emptyset$.
    - b) *Đúng*, vì $B subset A$ nên mọi phần tử của $B$ đều thuộc $A$, do đó $B \\ A = emptyset$.
    - c) *Đúng*, phần bù của $A$ trong $RR$ là $RR \\ (-3; 3) = (-oo; -3] union [3; +oo)$.
    - d) *Đúng*, ta có $C_RR B = (-oo; -2) union (2; +oo)$.
      Khi đó $(C_RR B) sect A = ((-oo; -2) union (2; +oo)) sect (-3; 3) = (-3; -2) union (2; 3)$.
  ]
)

#ds(
  [Cho đoạn $A = [-5; 1]$ và $B = (-3; 2)$. Xét tính đúng sai của các khẳng định sau:],
  (
    [$A union B = [-3; 2)$.],
    True([$A sect B = (-3; 1]$.]),
    True([$A \\ B = [-5; -3]$.]),
    True([$C_RR (A union B) = (-oo; -5) union [2; +oo)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, $A union B = [-5; 1] union (-3; 2) = [-5; 2) != [-3; 2)$.
    - b) *Đúng*, $A sect B = [-5; 1] sect (-3; 2) = (-3; 1]$.
    - c) *Đúng*, $A \\ B = [-5; 1] \\ (-3; 2) = [-5; -3]$.
    - d) *Đúng*, $C_RR (A union B) = RR \\ [-5; 2) = (-oo; -5) union [2; +oo)$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho $A$ là tập hợp tất cả các nghiệm của phương trình $x^2 - 4x + 3 = 0$; $B$ là tập hợp các số nguyên có giá trị tuyệt đối nhỏ hơn 4. Xác định số phần tử của tập hợp $A \\ B$.],
  [0],
  loigiai: [
    📌 *Phương pháp:* Giải phương trình và tìm tập hợp.

    ✍️ *Lời giải chi tiết:* \
    - Phương trình $x^2 - 4x + 3 = 0 <=> x = 1$ hoặc $x = 3 => A = {1; 3}$.
    - Tập hợp $B = {x in ZZ mid |x| < 4} = {-3; -2; -1; 0; 1; 2; 3}$.
    - Ta thấy $1 in B$ và $3 in B$ nên $A subset B$.
    Do đó $A \\ B = emptyset$, số phần tử của $A \\ B$ bằng $0$.
    
    ✅ *Đáp số:* $0$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai tập hợp $A = (m - 1; 5)$ và $B = (3; +oo)$, với $m in RR$. Tìm giá trị nguyên nhỏ nhất của tham số $m$ để $A \\ B = emptyset$.],
  [4],
  loigiai: [
    📌 *Phương pháp:* Áp dụng điều kiện tập con.

    ✍️ *Lời giải chi tiết:* \
    Để $A \\ B = emptyset$ thì tập hợp $A$ phải là tập con của $B$, tức là $A subset B$.
    - Trường hợp 1: $A = emptyset <=> m - 1 >= 5 <=> m >= 6$.
      Khi đó $emptyset \\ B = emptyset$ (thỏa mãn).
    - Trường hợp 2: $A != emptyset <=> m - 1 < 5 <=> m < 6$.
      Để $A subset B$ thì khoảng $(m - 1; 5)$ phải nằm hoàn toàn trong khoảng $(3; +oo)$:
      $ m - 1 >= 3 <=> m >= 4. $
      Kết hợp trường hợp này: $4 <= m < 6$.
    Hợp cả hai trường hợp ta được điều kiện: $m >= 4$.
    Vậy giá trị nguyên nhỏ nhất của tham số $m$ là $4$.
    
    ✅ *Đáp số:* $4$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập hợp $X = {3; 4; 5}$ có hai tập con khác rỗng $A$ và $B$ (số phần tử của $B$ ít hơn số phần tử của $A$). Có bao nhiêu cặp $(A; B)$ mà $A union B = X$ và $A sect B = emptyset$?],
  [3],
  loigiai: [
    📌 *Phương pháp:* Giải hệ điều kiện số phần tử.

    ✍️ *Lời giải chi tiết:* \
    Do $A, B$ khác rỗng, $A union B = X$ và $A sect B = emptyset$ nên $|A| + |B| = |X| = 3$.
    Theo giả thiết số phần tử của $B$ ít hơn số phần tử của $A$ và $B != emptyset$, nên:
    $ |B| = 1 quad "và" quad |A| = 2. $
    - Chọn tập $B$ có 1 phần tử từ tập $X = {3; 4; 5}$: có $C_3^1 = 3$ cách chọn:
      $B = {3}$, $B = {4}$, hoặc $B = {5}$.
    - Khi chọn xong $B$, tập hợp $A$ được xác định duy nhất bởi $A = X \\ B$.
    Cụ thể có 3 cặp $(A; B)$ thỏa mãn:
    $ ({4; 5}; {3}), quad ({3; 5}; {4}), quad ({3; 4}; {5}). $
    Vậy có đúng $3$ cặp thỏa mãn.
    
    ✅ *Đáp số:* $3$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai tập $A = (-oo; m)$ và $B = [2m - 2; 2m + 2]$. Có bao nhiêu giá trị nguyên của $m$ thuộc đoạn $[-5; 5]$ để $(C_RR A) sect B != emptyset$?],
  [8],
  loigiai: [
    📌 *Phương pháp:* Lấy phần bù và giải bất phương trình tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Ta có phần bù của $A$ trong $RR$ là:
    $ C_RR A = RR \\ (-oo; m) = [m; +oo). $
    Để $[m; +oo) sect [2m - 2; 2m + 2] != emptyset$ thì mút phải của đoạn $B$ phải lớn hơn hoặc bằng mút trái của nửa khoảng $C_RR A$:
    $ 2m + 2 >= m <=> m >= -2. $
    Kết hợp điều kiện $m$ thuộc đoạn $[-5; 5]$ và $m in ZZ$:
    $ m in {-2; -1; 0; 1; 2; 3; 4; 5}. $
    Số giá trị nguyên thỏa mãn là $5 - (-2) + 1 = 8$.
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Cho $m$ là tham số thực và hai tập hợp $A = [1 - 2m; m + 3], B = {x in RR mid x >= 8 - 5m}$. Tìm giá trị nguyên lớn nhất của $m$ để đoạn $A$ tồn tại và $B \\ A = B$.],
  [0],
  loigiai: [
    📌 *Phương pháp:* Giải điều kiện tập hợp khác rỗng và hiệu hai tập hợp.

    ✍️ *Lời giải chi tiết:* \
    - Điều kiện để đoạn $A = [1 - 2m; m + 3]$ tồn tại:
      $ 1 - 2m <= m + 3 <=> 3m >= -2 <=> m >= -2/3. $
    - Ta có $B = [8 - 5m; +oo)$.
      Để $B \\ A = B <=> A sect B = emptyset$.
      Vì $A$ là đoạn $[1 - 2m; m + 3]$ và $B$ là nửa khoảng $[8 - 5m; +oo)$, hai tập này rời nhau khi và chỉ khi:
      $ m + 3 < 8 - 5m <=> 6m < 5 <=> m < 5/6. $
    - Kết hợp hai điều kiện: $-2/3 <= m < 5/6$.
    Vì $m in ZZ$ nên giá trị nguyên duy nhất (và cũng là lớn nhất) của $m$ là $m = 0$.
    
    ✅ *Đáp số:* $0$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai tập hợp $X, Y$ thỏa mãn $X \\ Y = {7; 15}$ và $X sect Y = (-1; 2)$. Xác định số phần tử là số nguyên của $X$.],
  [4],
  loigiai: [
    📌 *Phương pháp:* Áp dụng tính chất hiệu và giao hai tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Với hai tập hợp bất kì ta luôn có:
    $ X = (X \\ Y) union (X sect Y). $
    Do đó $X = {7; 15} union (-1; 2)$.
    - Các số nguyên thuộc khoảng $(-1; 2)$ là $0$ và $1$.
    - Hai phần tử $7$ và $15$ đều là các số nguyên.
    Vậy các phần tử nguyên của tập hợp $X$ là: ${0; 1; 7; 15}$, tổng cộng có đúng $4$ phần tử.
    
    ✅ *Đáp số:* $4$.
  ]
)

