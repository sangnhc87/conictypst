#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Tập hợp con và hai tập hợp bằng nhau", mau: C1)

#phuong-phap(mau: C1)[
  - *Tập hợp con*: Tập hợp $A$ là tập con của tập hợp $B$ nếu mọi phần tử của $A$ đều thuộc $B$:
    $ A subset B <=> (forall x, x in A => x in B) $
  - *Tính chất*:
    - $emptyset subset A$ với mọi tập hợp $A$.
    - $A subset A$ với mọi tập hợp $A$.
    - Nếu $A subset B$ và $B subset C$ thì $A subset C$.
  - *Số tập con*: Tập hợp $A$ có $n$ phần tử ($n in NN$) thì có đúng $2^n$ tập con.
  - *Hai tập hợp bằng nhau*: $A = B <=> (A subset B " và " B subset A)$.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Tìm tất cả các tập con, và các tập con gồm hai phần tử của các tập hợp sau:
    + $A = {1; 2}$.
    + $B = {1; 2; 3}$.
    + $C = {a; b; c}$.
    + $D = {x in RR mid 2x^2 - 5x + 2 = 0}$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Tập $A = {1; 2}$ có $2$ phần tử nên có $2^2 = 4$ tập con:
      - Tất cả các tập con của $A$: $emptyset, {1}, {2}, {1; 2}$.
      - Tập con gồm đúng hai phần tử của $A$ là chính nó: ${1; 2}$.
    - *b)* Tập $B = {1; 2; 3}$ có $3$ phần tử nên có $2^3 = 8$ tập con:
      - Tập con $0$ phần tử: $emptyset$.
      - Các tập con $1$ phần tử: ${1}, {2}, {3}$.
      - Các tập con $2$ phần tử: ${1; 2}, {1; 3}, {2; 3}$.
      - Tập con $3$ phần tử: ${1; 2; 3}$.
      Vậy các tập con gồm hai phần tử của $B$ là: ${1; 2}, {1; 3}, {2; 3}$.
    - *c)* Tập $C = {a; b; c}$ tương tự tập $B$:
      - Tất cả các tập con: $emptyset, {a}, {b}, {c}, {a; b}, {a; c}, {b; c}, {a; b; c}$.
      - Các tập con gồm hai phần tử là: ${a; b}, {a; c}, {b; c}$.
    - *d)* Giải phương trình $2x^2 - 5x + 2 = 0 <=> (2x - 1)(x - 2) = 0 <=> x = 1/2$ hoặc $x = 2$.
      Vì $x in RR$ nên tập $D = {1/2; 2}$.
      - Tất cả các tập con của $D$: $emptyset, {1/2}, {2}, {1/2; 2}$.
      - Tập con gồm hai phần tử là chính nó: ${1/2; 2}$.
  ])

  #bt-item(2, [Cho $A = {-4; -2; -1; 2; 3; 4}$ và $B = {x in ZZ mid |x| <= 4}$. Tìm tập hợp $X$ sao cho:
    + $A subset X subset B$.
    + $A union X = B$ với $X$ có đúng bốn phần tử.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $B = {x in ZZ mid -4 <= x <= 4} = {-4; -3; -2; -1; 0; 1; 2; 3; 4}$.
    Xét hiệu hai tập hợp:
    $ B \\ A = {-3; 0; 1} $
    - *a)* Điều kiện $A subset X subset B$ nghĩa là tập $X$ bắt buộc phải chứa toàn bộ các phần tử của $A$ và có thể chứa thêm một số phần tử thuộc $B \\ A$.
      Do đó $X$ có dạng $X = A union Y$ với $Y subset B \\ A = {-3; 0; 1}$.
      Vì tập $B \\ A$ có $3$ phần tử nên có $2^3 = 8$ tập con $Y$, tương ứng có $8$ tập hợp $X$ thỏa mãn.
    - *b)* Để $A union X = B$, tập $X$ bắt buộc phải chứa toàn bộ các phần tử thuộc $B \\ A = {-3; 0; 1}$ (tức là $X$ đã có sẵn $3$ phần tử: $-3, 0, 1$).
      Đề bài yêu cầu $X$ có đúng $4$ phần tử, do đó phần tử thứ tư của $X$ phải được chọn từ tập $A$.
      Tập $A$ có $6$ phần tử, vậy có $6$ cách chọn phần tử thứ tư, tương ứng có $6$ tập hợp $X$ thỏa mãn:
      $ {-3; 0; 1; -4}, quad {-3; 0; 1; -2}, quad {-3; 0; 1; -1}, quad {-3; 0; 1; 2}, quad {-3; 0; 1; 3}, quad {-3; 0; 1; 4} $
  ])

  #bt-item(3, [Cho tập hợp $A = (2; +oo)$ và tập hợp $B = (m; +oo)$. Tìm điều kiện cần và đủ của $m$ để $B$ là tập con của $A$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo định nghĩa tập hợp con:
    $ B subset A <=> (forall x in B => x in A) $
    Tập $B = (m; +oo)$ gồm tất cả các số thực $x > m$.
    Tập $A = (2; +oo)$ gồm tất cả các số thực $x > 2$.
    Để mọi số thực lớn hơn $m$ đều lớn hơn $2$ thì mốc bắt đầu của khoảng $B$ phải nằm bên phải hoặc trùng với mốc bắt đầu của khoảng $A$ trên trục số:
    $ m >= 2 $
    - Thử lại với $m = 2$: $B = (2; +oo) subset A = (2; +oo)$ (thỏa mãn tính chất $A subset A$).
    - Với $m > 2$: Rõ ràng $(m; +oo) subset (2; +oo)$.
    Vậy điều kiện cần và đủ là $m >= 2$.
  ])

  #bt-item(4, [Cho hai tập hợp $A = [1; 3]$ và $B = [m; m + 1]$. Tìm tất cả giá trị của tham số $m$ để $B subset A$.], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Để đoạn $B = [m; m + 1]$ là tập con của đoạn $A = [1; 3]$ thì mút trái của $B$ phải lớn hơn hoặc bằng mút trái của $A$, và mút phải của $B$ phải nhỏ hơn hoặc bằng mút phải của $A$:
    $ B subset A <=> heva(m >= 1, m + 1 <= 3) <=> heva(m >= 1, m <= 2) <=> 1 <= m <= 2 $
    Vậy tập hợp tất cả các giá trị của tham số $m$ thỏa mãn là $m in [1; 2]$.
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 14, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho ba tập hợp $E, F, G$ thỏa mãn: $E subset F, F subset G$ và $G subset K$. Khẳng định nào sau đây đúng?],
  (
    [$G subset F$.],
    [$K subset G$.],
    [$E = F = G$.],
    True([$E subset K$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Áp dụng tính chất bắc cầu của quan hệ bao hàm giữa các tập hợp:
    $ E subset F subset G subset K => E subset K $
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {0; 3; 4; 6}$. Số tập hợp con gồm hai phần tử của $A$ là:],
  (
    [$12$.],
    [$8$.],
    [$10$.],
    True([$6$.]),
  ),
  loigiai: [
    Tập hợp $A$ có $n = 4$ phần tử. Số tập con gồm đúng $2$ phần tử của tập $A$ là số tổ hợp chập $2$ của $4$ phần tử:
    $ C_4^2 = (4 dot 3)/2 = 6 $
    Các tập con đó cụ thể là: ${0; 3}, {0; 4}, {0; 6}, {3; 4}, {3; 6}, {4; 6}$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $X = {a; b; c}$. Số tập con của $X$ là:],
  (
    [$4$.],
    [$6$.],
    True([$8$.]),
    [$12$.],
  ),
  loigiai: [
    Tập hợp $X$ có $3$ phần tử. Số tập con của một tập hợp có $n$ phần tử được tính theo công thức:
    $ 2^n = 2^3 = 8 $
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Trong các tập hợp sau đây, tập hợp nào có đúng một tập hợp con?],
  (
    True([$emptyset$.]),
    [${x}$.],
    [${emptyset}$.],
    [${emptyset; x}$.],
  ),
  loigiai: [
    Số tập con của tập hợp có $n$ phần tử là $2^n$.
    Để có đúng $1$ tập con thì $2^n = 1 <=> n = 0$, nghĩa là tập hợp không có phần tử nào (tập rỗng $emptyset$).
    Tập rỗng $emptyset$ chỉ có duy nhất một tập con là chính nó: $emptyset subset emptyset$.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $P$. Tìm mệnh đề sai trong các mệnh đề sau:],
  (
    [$P subset P$.],
    [$emptyset subset P$.],
    [$P in {P}$.],
    True([$P in P$.]),
  ),
  loigiai: [
    Theo tiên đề của lý thuyết tập hợp Zermelo-Fraenkel (tiên đề chính quy), một tập hợp không thể chứa chính nó như một phần tử ($P in.not P$). Do đó mệnh đề $P in P$ là mệnh đề sai.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Tập hợp nào sau đây có đúng hai tập hợp con?],
  (
    [${x; emptyset}$.],
    True([${x}$.]),
    [${x; y; emptyset}$.],
    [${x; y}$.],
  ),
  loigiai: [
    Để tập hợp có đúng $2$ tập con thì $2^n = 2 <=> n = 1$ (tập hợp phải có đúng $1$ phần tử).
    Trong các phương án:
    - ${x}$ có đúng $1$ phần tử là $x$, nên có $2^1 = 2$ tập con là $emptyset$ và ${x}$.
    - ${x; emptyset}$ có $2$ phần tử nên có $2^2 = 4$ tập con.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A$. Trong các mệnh đề sau, mệnh đề nào sai?],
  (
    [$emptyset subset A$.],
    [$A != {A}$.],
    True([$A in A$.]),
    [$A subset A$.],
  ),
  loigiai: [
    Khẳng định $A in A$ là sai vì một tập hợp không thể là phần tử của chính nó.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Số tập con của tập hợp có $n$ ($n >= 1, n in NN$) phần tử là:],
  (
    [$2^(n+2)$.],
    [$2^(n-1)$.],
    [$2^(n+1)$.],
    True([$2^n$.]),
  ),
  loigiai: [
    Mỗi phần tử của tập hợp có $2$ khả năng: thuộc hoặc không thuộc vào tập con. Do đó theo quy tắc nhân, số tập con của tập hợp gồm $n$ phần tử là $2^n$.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Cách viết nào sau đây là đúng?],
  (
    [$a subset [a; b]$.],
    True([${a} subset [a; b]$.]),
    [${a} in [a; b]$.],
    [$a in (a; b]$.],
  ),
  loigiai: [
    - Phương án A sai vì $a$ là phần tử, không dùng ký hiệu $subset$.
    - Phương án B đúng vì ${a}$ là tập hợp chứa phần tử $a$, và $a in [a; b]$ nên ${a} subset [a; b]$.
    - Phương án C sai vì ${a}$ là tập hợp, không dùng ký hiệu $in$.
    - Phương án D sai vì khoảng $(a; b]$ không chứa điểm mút $a$.
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {x^2 + 1 mid x in NN^*, x^2 <= 5}$. Khi đó tập $A$ bằng tập hợp nào sau đây?],
  (
    [$A = {1; 2; 3; 4}$.],
    [$A = {0; 2; 5}$.],
    True([$A = {2; 5}$.]),
    [$A = {0; 1; 2; 3; 4; 5}$.],
  ),
  loigiai: [
    Vì $x in NN^*$ ($x >= 1$) và $x^2 <= 5$ nên $x in {1; 2}$.
    Tính giá trị tương ứng của biểu thức $x^2 + 1$:
    - Với $x = 1 => x^2 + 1 = 1^2 + 1 = 2$.
    - Với $x = 2 => x^2 + 1 = 2^2 + 1 = 5$.
    Vậy $A = {2; 5}$.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Trong các mệnh đề sau đây, mệnh đề nào sai?],
  (
    [$A subset A$.],
    [$emptyset subset A$.],
    True([$A in emptyset$.]),
    [$emptyset subset emptyset$.],
  ),
  loigiai: [
    Tập rỗng $emptyset$ không chứa bất kỳ phần tử nào, do đó khẳng định $A in emptyset$ là hoàn toàn sai.
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp: $X = {n in NN mid n " là bội của 4 và 6"}$ và $Y = {n in NN mid n " là bội của 12"}$. Trong các mệnh đề sau, tìm mệnh đề sai?],
  (
    [$X subset Y$.],
    [$Y subset X$.],
    [$X = Y$.],
    True([$exists n: n in X " và " n in.not Y$.]),
  ),
  loigiai: [
    Một số tự nhiên là bội của cả $4$ và $6$ khi và chỉ khi nó là bội của $"BCNN"(4, 6) = 12$.
    Do đó tập hợp các bội của $4$ và $6$ hoàn toàn trùng với tập hợp các bội của $12$, tức là $X = Y$.
    Vì $X = Y$ nên mệnh đề "Tồn tại $n$ thuộc $X$ mà không thuộc $Y$" là mệnh đề sai.
    Chọn đáp án *D*.
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {1; 2; a}$, $B = {1; 2; a; b; x; y}$. Hỏi có bao nhiêu tập hợp $X$ thỏa $A subset X subset B$?],
  (
    True([$8$.]),
    [$7$.],
    [$6$.],
    [$2^n$.],
  ),
  loigiai: [
    Để $A subset X subset B$ thì tập $X$ phải chứa toàn bộ $3$ phần tử của $A$ (${1; 2; a}$) và có thể chọn thêm các phần tử từ tập hiệu $B \\ A = {b; x; y}$.
    Tập $B \\ A$ có $3$ phần tử, do đó số tập con của $B \\ A$ là $2^3 = 8$.
    Vậy có đúng $8$ tập hợp $X$ thỏa mãn yêu cầu.
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Cách viết nào sau đây thể hiện đúng $a$ là một phần tử thuộc tập $A$?],
  (
    [$a subset A$.],
    True([$a in A$.]),
    [${a} in A$.],
    [$A in a$.],
  ),
  loigiai: [
    Quan hệ giữa phần tử và tập hợp sử dụng ký hiệu thuộc ($in$). Cách viết chuẩn xác là $a in A$.
    Chọn đáp án *B*.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 7, reset-counter: true)

#ds(
  [Kí hiệu $T$ là tập hợp các học sinh của trường, $10A$ là tập hợp các học sinh lớp 10A của trường. Biết rằng An là một học sinh của lớp 10A. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$"An" in T$.]),
    [$"An" subset 10A$.],
    True([$"An" in 10A$.]),
    [$10A in T$.],
  ),
  loigiai: [
    - *a) Đúng:* An là một học sinh của trường nên là một phần tử thuộc tập $T$, ký hiệu $"An" in T$.
    - *b) Sai:* An là một cá nhân (phần tử), không phải một tập hợp con, nên không dùng ký hiệu bao hàm $subset$.
    - *c) Đúng:* An là học sinh của lớp 10A nên $"An" in 10A$.
    - *d) Sai:* $10A$ là một tập thể (tập con) gồm các học sinh thuộc trường $T$, do đó quan hệ đúng phải là tập con $10A subset T$, không dùng ký hiệu phần tử $in$.
  ]
)

#ds(
  [Cho tập hợp $X = {-3; -1; 0; 1; 3}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$-1$ là một phần tử của tập hợp $X$.]),
    True([Số tập hợp con của $X$ có 2 phần tử là 10.]),
    [Tính chất đặc trưng của tập hợp $X$ là $X = {x in NN mid 2x + 1 <= 5}$.],
    True([Số tập con của tập hợp $X$ là 32 tập hợp.]),
  ),
  loigiai: [
    - *a) Đúng:* Rõ ràng $-1 in X$.
    - *b) Đúng:* Tập $X$ có $5$ phần tử, số tập con có $2$ phần tử là $C_5^2 = (5 dot 4)/2 = 10$.
    - *c) Sai:* Bất phương trình $2x + 1 <= 5 <=> x <= 2$. Với $x in NN$ thì tập này chỉ gồm ${0; 1; 2}$, hoàn toàn khác tập $X$ (tập $X$ có chứa các số nguyên âm $-3, -1$).
    - *d) Đúng:* Số tập con của $X$ là $2^5 = 32$.
  ]
)

#ds(
  [Giả sử $A = {2; 4; 6}$, $B = {2; 6}$, $C = {4; 6}$, $D = {4; 6; 8}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$B subset A$.]),
    [$A subset B$.],
    True([$C subset A$.]),
    True([$C subset D$.]),
  ),
  loigiai: [
    - *a) Đúng:* Các phần tử của $B$ là $2, 6$ đều thuộc $A$, nên $B subset A$.
    - *b) Sai:* Phần tử $4 in A$ nhưng $4 in.not B$, do đó $A subset.not B$.
    - *c) Đúng:* Các phần tử của $C$ là $4, 6$ đều thuộc $A$, nên $C subset A$.
    - *d) Đúng:* Các phần tử của $C$ là $4, 6$ đều thuộc $D$, nên $C subset D$.
  ]
)

#ds(
  [Cho các tập hợp $A = {x in RR mid -5 < x < 2}$, $B = {x in RR mid x < 1}$, $C = {x in RR mid x > 7}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$A = (-5; 2)$.]),
    True([$B = (-oo; 1)$.]),
    [$C = (9; +oo)$.],
    [$B subset C$.],
  ),
  loigiai: [
    - *a) Đúng:* Theo định nghĩa khoảng: $-5 < x < 2 <=> x in (-5; 2)$.
    - *b) Đúng:* Tập hợp các số thực nhỏ hơn $1$ là khoảng $(-oo; 1)$.
    - *c) Sai:* Tập hợp các số thực lớn hơn $7$ là khoảng $(7; +oo)$, không phải $(9; +oo)$.
    - *d) Sai:* Vì $(-oo; 1)$ và $(7; +oo)$ là hai khoảng hoàn toàn rời nhau nên $B$ không thể là tập con của $C$.
  ]
)

#ds(
  [Cho các tập hợp $G = {x in RR mid -12 <= x <= 21}$, $H = {x in RR mid 0 <= x <= 17}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([$G = [-12; 21]$.]),
    True([$H = [0; 17]$.]),
    [$G subset H$.],
    True([$H subset G$.]),
  ),
  loigiai: [
    - *a) Đúng:* Theo định nghĩa đoạn: $-12 <= x <= 21 <=> x in [-12; 21]$.
    - *b) Đúng:* $0 <= x <= 17 <=> x in [0; 17]$.
    - *c) Sai:* Đoạn $[-12; 21]$ có phạm vi rộng hơn đoạn $[0; 17]$ nên không thể là tập con của $H$.
    - *d) Đúng:* Vì $-12 <= 0 < 17 <= 21$ nên đoạn $[0; 17]$ nằm trọn vẹn trong đoạn $[-12; 21]$, tức $H subset G$.
  ]
)

#ds(
  [Cho các tập hợp $C = {1; 2; 3}$, $D = {x in NN^* mid x <= 2}$, $E = {x = 3n mid n in NN, n < 4}$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tập hợp $D$ có 2 phần tử.]),
    [Tập hợp $E$ có 3 phần tử.],
    True([Tập hợp $D$ là tập con của tập hợp $C$.]),
    [Tập hợp $E$ là tập con của tập hợp $C$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, vì $x in NN^*$ và $x <= 2$ nên $D = {1; 2}$, có đúng $2$ phần tử.
    - b) *Sai*, với $n in NN$ và $n < 4$ thì $n in {0; 1; 2; 3}$. Khi đó $x = 3n in {0; 3; 6; 9}$. Tập $E$ có đúng $4$ phần tử.
    - c) *Đúng*, các phần tử $1, 2$ của $D$ đều thuộc $C = {1; 2; 3}$ nên $D subset C$.
    - d) *Sai*, tập $E$ có các phần tử $0, 6, 9$ không thuộc tập $C$, do đó $E subset.not C$.
  ]
)

#ds(
  [Cho ba tập hợp $A = {2; 5}$, $B = {5; x}$, $C = {x; y; 5}$, biết $A = B = C$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Nếu $x = 2, y = 2$ thì $A = B = C$.]),
    [Nếu $x = 3, y = 3$ thì $A = B = C$.],
    True([Nếu $x = 2, y = 5$ thì $A = B = C$.]),
    [Nếu $x = 1, y = 3$ thì $A = B = C$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Để hai tập hợp bằng nhau thì chúng phải có cùng các phần tử.
    - Để $B = A = {2; 5}$ thì phần tử chưa biết của $B$ bắt buộc phải là $2$, tức $x = 2$.
    - Khi $x = 2$, tập $C$ trở thành $C = {2; y; 5}$. Để $C = A = {2; 5}$, phần tử $y$ phải bằng $2$ hoặc bằng $5$ (khi đó trong cách liệt kê, các phần tử trùng lặp chỉ tính một lần, ta luôn có $C = {2; 5}$).
    - a) *Đúng*, với $x = 2, y = 2$ thì $B = {5; 2} = {2; 5}$ và $C = {2; 2; 5} = {2; 5}$, do đó $A = B = C$.
    - b) *Sai*, với $x = 3$ thì $B = {5; 3} != A$.
    - c) *Đúng*, với $x = 2, y = 5$ thì $B = {5; 2}$ và $C = {2; 5; 5} = {2; 5}$, do đó $A = B = C$.
    - d) *Sai*, với $x = 1$ thì $B = {5; 1} != A$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tập hợp $A = {a, b, c, d}$. Tập $A$ có mấy tập con?],
  [16],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức số tập con $2^n$.

    ✍️ *Lời giải chi tiết:* \
    Tập hợp $A$ có $n = 4$ phần tử.
    Áp dụng công thức số tập con của một tập hợp có $n$ phần tử:
    $ "Số tập con" = 2^n = 2^4 = 16 $
    
    ✅ *Đáp số:* $16$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập hợp $B = {x in NN^* mid -3 < x <= 4}$. Tập hợp $B$ có tất cả bao nhiêu tập hợp con?],
  [16],
  loigiai: [
    📌 *Phương pháp:* Liệt kê phần tử và tính số tập con.

    ✍️ *Lời giải chi tiết:* \
    Vì $x in NN^*$ ($x in {1, 2, 3, ...}$) và $-3 < x <= 4$ nên các phần tử của $B$ là:
    $ B = {1; 2; 3; 4} $
    Tập $B$ có $4$ phần tử.
    Số tập hợp con của tập $B$ là: $2^4 = 16$.
    
    ✅ *Đáp số:* $16$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập hợp $A = {x; y; z}$ và $B = {x; y; z; t; u}$. Có bao nhiêu tập $X$ thỏa mãn $A subset X subset B$?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Sử dụng số tập con của tập hiệu.

    ✍️ *Lời giải chi tiết:* \
    Tập $X$ bắt buộc phải chứa tất cả $3$ phần tử của $A$ là $x, y, z$.
    Ngoài ra, $X$ có thể nhận thêm các phần tử từ tập hiệu:
    $ B \\ A = {t; u} $
    Số tập hợp $X$ thỏa mãn chính bằng số tập con của tập ${t; u}$:
    $ 2^2 = 4 $
    (Các tập $X$ cụ thể là: ${x; y; z}$, ${x; y; z; t}$, ${x; y; z; u}$, ${x; y; z; t; u}$).
    
    ✅ *Đáp số:* $4$.
  ]
)

#tln(
  dir: "ngang",
  [Có tất cả bao nhiêu tập $X$ thỏa mãn ${1; 2} subset X subset {1; 2; 3; 4; 5}$?],
  [8],
  loigiai: [
    📌 *Phương pháp:* Tính số tập con từ tập các phần tử còn lại.

    ✍️ *Lời giải chi tiết:* \
    Để ${1; 2} subset X subset {1; 2; 3; 4; 5}$, tập $X$ bắt buộc phải chứa hai phần tử $1, 2$.
    Các phần tử còn lại của $X$ được chọn từ tập hợp ${3; 4; 5}$.
    Tập ${3; 4; 5}$ có $3$ phần tử, do đó số cách chọn là số tập con của nó:
    $ 2^3 = 8 $
    Vậy có đúng $8$ tập hợp $X$ thỏa mãn.
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập hợp $M = {1; 2; 3; 4; 5}$. Hỏi tập hợp $M$ có bao nhiêu tập con chứa phần tử 1 mà không chứa phần tử 2?],
  [8],
  loigiai: [
    📌 *Phương pháp:* Áp dụng nguyên lý đếm cơ bản.

    ✍️ *Lời giải chi tiết:* \
    Gọi $Y$ là tập con thỏa mãn yêu cầu của bài toán.
    - Phần tử $1$ bắt buộc phải có mặt trong $Y$ ($1$ cách chọn).
    - Phần tử $2$ bắt buộc không được có mặt trong $Y$ ($1$ cách chọn).
    - Các phần tử còn lại trong $Y$ được lấy tùy ý từ tập hợp ${3; 4; 5}$.
    Tập ${3; 4; 5}$ có $3$ phần tử nên có $2^3 = 8$ cách chọn tập con.
    Vậy có đúng $8$ tập con thỏa mãn yêu cầu bài toán.
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Lớp 10A có 10 học sinh giỏi Toán, 10 học sinh giỏi Lý, 11 học sinh giỏi Hóa, 6 học sinh giỏi cả Toán và Lý, 5 học sinh giỏi cả Hóa và Lý, 4 học sinh giỏi cả Toán và Hóa, 3 học sinh giỏi cả ba môn Toán, Lý, Hóa. Tính số học sinh giỏi ít nhất một trong ba môn (Toán, Lý, Hóa) của lớp 10A.],
  [19],
  loigiai: [
    📌 *Phương pháp:* Áp dụng công thức bao hàm và loại trừ cho ba tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Kí hiệu $T, L, H$ lần lượt là tập hợp các học sinh giỏi môn Toán, Lý, Hóa của lớp 10A.
    Theo giả thiết của đề bài:
    $ |T| = 10, quad |L| = 10, quad |H| = 11 $
    $ |T sect L| = 6, quad |L sect H| = 5, quad |T sect H| = 4, quad |T sect L sect H| = 3 $
    Số học sinh giỏi ít nhất một trong ba môn chính là số phần tử của tập hợp hợp $T union L union H$.
    Áp dụng công thức bao hàm và loại trừ (nguyên lý bù trừ) cho ba tập hợp:
    $ |T union L union H| = |T| + |L| + |H| - (|T sect L| + |L sect H| + |T sect H|) + |T sect L sect H| $
    Thay các số liệu đã cho vào công thức:
    $ |T union L union H| = 10 + 10 + 11 - (6 + 5 + 4) + 3 = 31 - 15 + 3 = 19 $
    Vậy có $19$ học sinh giỏi ít nhất một trong ba môn.
    
    ✅ *Đáp số:* $19$.
  ]
)
