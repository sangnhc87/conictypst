#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Xác định giao – hợp của hai tập hợp", mau: C1)

#phuong-phap(mau: C1)[
  - *Giao của hai tập hợp*: Tập hợp $C$ gồm các phần tử vừa thuộc $A$, vừa thuộc $B$ được gọi là giao của $A$ và $B$.
    $ C = A sect B = {x mid x in A " và " x in B} $
  - *Hợp của hai tập hợp*: Tập hợp $C$ gồm các phần tử thuộc $A$ hoặc thuộc $B$ được gọi là hợp của $A$ và $B$.
    $ C = A union B = {x mid x in A " hoặc " x in B} $
  - *Phương pháp xác định*:
    - Đếm thủ công (đối với tập hợp rời rạc).
    - Biểu diễn các khoảng, đoạn trên trục số (gạch bỏ phần không thuộc tập hợp).
  - *Chú ý*: Nếu $A subset B$ thì $A sect B = A$ và $A union B = B$.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Cho tập hợp $A = {x in RR mid -1 < x <= 5}$ và $B = {x in RR mid 0 <= x < 7}$. Hãy tìm tập hợp $C$ thỏa mãn:
    + $C = A union B$.
    + $C = A sect B$.
    + $C = (A union B) \\ (A sect B)$.
    + $C = (A \\ B) union (B \\ A)$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Biểu diễn các tập hợp dưới dạng khoảng, nửa khoảng trên $RR$:
    $ A = (-1; 5] quad "và" quad B = [0; 7). $
    - *a)* Tập hợp $C = A union B$ gồm các phần tử thuộc $A$ hoặc thuộc $B$:
      $ C = (-1; 5] union [0; 7) = (-1; 7). $
    - *b)* Tập hợp $C = A sect B$ gồm các phần tử đồng thời thuộc cả $A$ và $B$:
      $ C = (-1; 5] sect [0; 7) = [0; 5]. $
    - *c)* Tập hợp $C = (A union B) \\ (A sect B)$:
      Lấy hợp bỏ đi phần giao:
      $ C = (-1; 7) \\ [0; 5] = (-1; 0) union (5; 7). $
    - *d)* Ta lần lượt tìm các hiệu:
      - $A \\ B = (-1; 5] \\ [0; 7) = (-1; 0)$.
      - $B \\ A = [0; 7) \\ (-1; 5] = (5; 7)$.
      Do đó $C = (A \\ B) union (B \\ A) = (-1; 0) union (5; 7)$.
      _(Lưu ý: $(A union B) \\ (A sect B) = (A \\ B) union (B \\ A)$, đây chính là hiệu đối xứng của hai tập hợp)._
  ])

  #bt-item(2, [Xác định các tập hợp sau và biểu diễn chúng trên trục số:
    + $(-4; 1] sect [0; 3)$.
    + $(0; 2] union (-3; 1]$.
    + $(-2; 1) sect (-oo; 1]$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Thực hiện phép toán trên trục số thực:
    - *a)* Giao $(-4; 1] sect [0; 3)$:
      Lấy phần chung của hai nửa khoảng ta được đoạn $[0; 1]$.
    - *b)* Hợp $(0; 2] union (-3; 1]$:
      Vì hai nửa khoảng dẫm lên nhau trên đoạn $(0; 1]$ nên hợp lại thành nửa khoảng $(-3; 2]$.
    - *c)* Giao $(-2; 1) sect (-oo; 1]$:
      Vì $(-2; 1) subset (-oo; 1]$ nên giao của chúng chính bằng khoảng $(-2; 1)$.
  ])

  #bt-item(3, [Cho tập hợp $A = {x in RR mid -3 < x < 3}$, $B = {x in RR mid -2 < x <= 3}$ và $C = {x in RR mid 0 <= x <= 4}$. Hãy tìm tập hợp $D$ thỏa mãn:
    + $D = (A union B) union C$.
    + $D = (A union B) sect C$.
    + $D = (A sect B) sect C$.
    + $D = (A sect B) union C$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Viết lại các tập hợp: $A = (-3; 3)$, $B = (-2; 3]$, $C = [0; 4]$.
    - *a)* Ta có $A union B = (-3; 3) union (-2; 3] = (-3; 3]$.
      Do đó $D = (A union B) union C = (-3; 3] union [0; 4] = (-3; 4]$.
    - *b)* Ta có $D = (A union B) sect C = (-3; 3] sect [0; 4] = [0; 3]$.
    - *c)* Ta có $A sect B = (-3; 3) sect (-2; 3] = (-2; 3)$.
      Do đó $D = (A sect B) sect C = (-2; 3) sect [0; 4] = [0; 3)$.
    - *d)* Ta có $D = (A sect B) union C = (-2; 3) union [0; 4] = (-2; 4]$.
  ])

  #bt-item(4, [Chứng minh rằng:
    + Nếu $A subset B$ thì $A sect B = A$.
    + Nếu $A subset C$ và $B subset C$ thì $A union B subset C$.
    + Nếu $A union B = A sect B$ thì $A = B$.
    + Nếu $A subset B$ và $A subset C$ thì $A subset B sect C$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Sử dụng định nghĩa bao hàm thức và các phép toán tập hợp:
    - *a)* Ta luôn có $A sect B subset A$ theo định nghĩa phép giao.
      Ngược lại, lấy phần tử bất kì $x in A$. Vì $A subset B$ nên $x in B$.
      Do $x in A$ và $x in B$ nên $x in A sect B$, suy ra $A subset A sect B$.
      Từ hai bao hàm thức trên, suy ra $A sect B = A$.
    - *b)* Lấy phần tử bất kì $x in A union B$. Theo định nghĩa phép hợp: $x in A$ hoặc $x in B$.
      - Nếu $x in A$, do $A subset C$ nên $x in C$.
      - Nếu $x in B$, do $B subset C$ nên $x in C$.
      Trong cả hai trường hợp đều có $x in C$. Suy ra $A union B subset C$.
    - *c)* Ta luôn có chuỗi bao hàm thức: $A sect B subset A subset A union B$.
      Theo giả thiết $A union B = A sect B$, do đó các tập hợp ở giữa buộc phải trùng nhau:
      $ A = A sect B = A union B. $
      Chứng minh hoàn toàn tương tự ta cũng có $B = A sect B$. Từ đó suy ra $A = B$.
    - *d)* Lấy phần tử tùy ý $x in A$.
      Vì $A subset B$ nên $x in B$.
      Vì $A subset C$ nên $x in C$.
      Do đó $x$ vừa thuộc $B$ vừa thuộc $C$, tức là $x in B sect C$.
      Vậy $A subset B sect C$.
  ])

  #bt-item(5, [Lớp 10B có 28 học sinh tham gia câu lạc bộ thể thao và 19 học sinh tham gia câu lạc bộ âm nhạc. Biết rằng có 10 học sinh tham gia cả hai câu lạc bộ trên.
    + Có bao nhiêu học sinh tham gia câu lạc bộ thể thao mà không tham gia câu lạc bộ âm nhạc?
    + Có bao nhiêu học sinh tham gia ít nhất một trong hai câu lạc bộ trên?
    + Biết lớp 10B có 40 học sinh. Có bao nhiêu học sinh không tham gia cả hai câu lạc bộ?
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $A$ là tập hợp học sinh tham gia CLB thể thao, $B$ là tập hợp học sinh tham gia CLB âm nhạc.
    Theo đề bài: $n(A) = 28$, $n(B) = 19$, $n(A sect B) = 10$.
    - *a)* Số học sinh tham gia CLB thể thao mà không tham gia CLB âm nhạc (chỉ tham gia thể thao) là số phần tử của $A \\ B$:
      $ n(A \\ B) = n(A) - n(A sect B) = 28 - 10 = 18 text(" học sinh"). $
    - *b)* Số học sinh tham gia ít nhất một trong hai CLB là số phần tử của $A union B$:
      $ n(A union B) = n(A) + n(B) - n(A sect B) = 28 + 19 - 10 = 37 text(" học sinh"). $
    - *c)* Tổng số học sinh cả lớp là $40$. Số học sinh không tham gia bất kì CLB nào trong hai CLB trên là:
      $ 40 - n(A union B) = 40 - 37 = 3 text(" học sinh"). $
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 9, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho tập hợp $X = {1; 5}, Y = {1; 3; 5}$. Tập $X sect Y$ là tập hợp nào sau đây?],
  (
    [${1}$.],
    [${1; 3}$.],
    [${1; 3; 5}$.],
    True([${1; 5}$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phần tử chung của $X$ và $Y$ là các phần tử vừa thuộc $X$ vừa thuộc $Y$, đó là $1$ và $5$. Do đó $X sect Y = {1; 5}$. 
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập $X = {2; 4; 6; 9}, Y = {1; 2; 3; 4}$. Tập nào sau đây bằng tập $X \\ Y$?],
  (
    [${1; 2; 3; 5}$.],
    [${1; 3; 6; 9}$.],
    True([${6; 9}$.]),
    [${1}$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Tập hợp $X \\ Y$ gồm các phần tử thuộc $X$ nhưng không thuộc $Y$. Các phần tử của $X$ là $2, 4, 6, 9$, loại bỏ các phần tử thuộc $Y$ là $2, 4$, ta còn lại ${6; 9}$. 
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $X = {a; b}, Y = {a; b; c}$. $X union Y$ là tập hợp nào sau đây?],
  (
    [${a; b; c; d}$.],
    [${a; b}$.],
    [${c}$.],
    True([${a; b; c}$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì $X subset Y$ nên hợp của hai tập hợp chính bằng tập hợp mẹ: $X union Y = Y = {a; b; c}$. 
    
    ✅ *Chọn đáp án D.*
  ]
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
    ✍️ *Lời giải chi tiết:* \
    Xét tính đúng sai của từng mệnh đề khi $A subset B$ và $A, B != emptyset$:
    - Phương án A đúng vì mọi phần tử của $A$ đều thuộc $B$ nên không có phần tử nào thuộc $A$ mà không thuộc $B$, do đó $A \\ B = emptyset$.
    - Phương án B đúng vì giao của tập con và tập mẹ bằng tập con: $A sect B = A$.
    - Phương án D đúng vì hợp của tập con và tập mẹ bằng tập mẹ: $A union B = B$.
    - Phương án C sai vì $A != emptyset$ nên $B \\ A$ là tập con thực sự của $B$, không thể bằng $B$.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho ba tập hợp: $F = {x in RR mid f(x) = 0}, G = {x in RR mid g(x) = 0}, H = {x in RR mid f(x)^2 + g(x)^2 = 0}$. Mệnh đề nào sau đây đúng?],
  (
    True([$H = F sect G$.]),
    [$H = F union G$.],
    [$H = F \\ G$.],
    [$H = G \\ F$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Vì với mọi $x in RR$ ta luôn có $f(x)^2 >= 0$ và $g(x)^2 >= 0$, nên:
    $ f(x)^2 + g(x)^2 = 0 <=> #heva("f(x) = 0", "g(x) = 0") <=> #heva("x in F", "x in G") <=> x in F sect G. $
    Do đó $H = F sect G$. 
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {x in RR mid (2x)/(x^2 + 1) >= 1}$; $B$ là tập hợp tất cả các giá trị nguyên của $b$ để phương trình $x^2 - 2b x + 4 = 0$ vô nghiệm. Số phần tử chung của hai tập hợp trên là:],
  (
    True([$1$.]),
    [$2$.],
    [$3$.],
    [Vô số.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Tìm tập hợp $A$: Vì $x^2 + 1 > 0, forall x in RR$ nên:
      $ (2x)/(x^2 + 1) >= 1 <=> 2x >= x^2 + 1 <=> x^2 - 2x + 1 <= 0 <=> (x - 1)^2 <= 0 <=> x = 1. $
      Suy ra $A = {1}$.
    - Tìm tập hợp $B$: Phương trình bậc hai $x^2 - 2b x + 4 = 0$ vô nghiệm khi biệt thức thu gọn âm:
      $ Delta' = (-b)^2 - 1 dot 4 < 0 <=> b^2 - 4 < 0 <=> -2 < b < 2. $
      Vì $b in ZZ$ nên $b in {-1; 0; 1}$, suy ra $B = {-1; 0; 1}$.
    - Phần tử chung của hai tập hợp là $A sect B = {1} sect {-1; 0; 1} = {1}$, gồm đúng $1$ phần tử.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $X = {1; 2; 3; 4}, Y = {1; 2}$. $C_X Y$ là tập hợp nào sau đây?],
  (
    [${1; 2}$.],
    [${1; 2; 3; 4}$.],
    True([${3; 4}$.]),
    [$emptyset$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phần bù của $Y$ trong $X$ là hiệu $X \\ Y$: $C_X Y = X \\ Y = {1; 2; 3; 4} \\ {1; 2} = {3; 4}$. 
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho hai tập hợp $A = {0; 2}$ và $B = {0; 1; 2; 3; 4}$. Số tập hợp $X$ thỏa mãn $A union X = B$ là:],
  (
    [$2$.],
    [$3$.],
    True([$4$.]),
    [$5$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Để $A union X = B$ với $A = {0; 2}$ và $B = {0; 1; 2; 3; 4}$:
    - Các phần tử thuộc $B \\ A = {1; 3; 4}$ bắt buộc phải thuộc vào $X$.
    - Các phần tử thuộc $A = {0; 2}$ có thể thuộc hoặc không thuộc vào $X$.
    Do đó mỗi tập hợp $X$ có dạng $X = {1; 3; 4} union Y$, trong đó $Y$ là một tập con tùy ý của $A = {0; 2}$.
    Số tập hợp $X$ thỏa mãn chính bằng số tập con của tập ${0; 2}$, tức là $2^2 = 4$ tập hợp.
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Cho tập hợp $A = {0; 1}$ và $B = {0; 1; 2; 3; 4}$. Số tập hợp $X$ thỏa mãn $X subset C_B A$ là:],
  (
    [$3$.],
    [$5$.],
    [$6$.],
    True([$8$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $C_B A = B \\ A = {0; 1; 2; 3; 4} \\ {0; 1} = {2; 3; 4}$.
    Tập hợp $C_B A$ có 3 phần tử, do đó số tập con $X$ của nó là $2^3 = 8$.
    
    ✅ *Chọn đáp án D.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Cho các tập hợp $A = {0; 2; 3; 5}$, $B = {-1; 2; 4; 5; 6}$, $C = {-2; 0; 1; 3; 4}$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$A sect B = {2; 5}$.]),
    [$A union B = {-1; 0; 2; 3; 5; 6}$.],
    [$B sect C = {2; 3; 4}$.],
    True([$B union C = {-2; -1; 0; 1; 2; 3; 4; 5; 6}$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, các phần tử chung của $A$ và $B$ là $2$ và $5$. Do đó $A sect B = {2; 5}$.
    - b) *Sai*, hợp $A union B$ chứa tất cả các phần tử của cả hai tập: $A union B = {-1; 0; 2; 3; 4; 5; 6}$. Mệnh đề trong đề bài thiếu phần tử $4 in B$.
    - c) *Sai*, phần tử chung của $B$ và $C$ chỉ có duy nhất số $4$. Do đó $B sect C = {4} != {2; 3; 4}$.
    - d) *Đúng*, liệt kê tất cả phần tử thuộc $B$ hoặc $C$ gồm 9 phần tử: $\{-2; -1; 0; 1; 2; 3; 4; 5; 6\}$.
  ]
)

#ds(
  [Cho các tập hợp $A = {x in NN mid x < 5}$, $B = {x in ZZ mid x^2 + x - 2 = 0}$ và $C = {-2; -1; 1; 4}$. Xét tính đúng sai của các khẳng định sau:],
  (
    [$A sect B = {-2; 1}$.],
    True([$A union B = {-2; 0; 1; 2; 3; 4}$.]),
    True([$A union C = {-2; -1; 0; 1; 2; 3; 4}$.]),
    True([$B sect C = {-2; 1}$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Viết các tập hợp dưới dạng liệt kê:
    - $A = {0; 1; 2; 3; 4}$ (vì $x in NN$).
    - Phương trình $x^2 + x - 2 = 0 <=> (x - 1)(x + 2) = 0 <=> x = 1$ hoặc $x = -2$. Cả hai nghiệm đều thuộc $ZZ$ nên $B = {-2; 1}$.
    - $C = {-2; -1; 1; 4}$.
    Xét từng khẳng định:
    - a) *Sai*, vì $-2 in.not NN$ nên $-2 in.not A$, do đó $A sect B = {1} != {-2; 1}$.
    - b) *Đúng*, $A union B = {0; 1; 2; 3; 4} union {-2; 1} = {-2; 0; 1; 2; 3; 4}$.
    - c) *Đúng*, $A union C = {0; 1; 2; 3; 4} union {-2; -1; 1; 4} = {-2; -1; 0; 1; 2; 3; 4}$.
    - d) *Đúng*, phần tử chung của $B$ và $C$ là $-2$ và $1$, do đó $B sect C = {-2; 1}$.
  ]
)

#ds(
  [Cho các tập hợp $A = (-2; 5)$, $B = (0; +oo)$ và $C = [5; 7]$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [$A union B = (0; 5)$.],
    True([$B sect C = [5; 7]$.]),
    [$A sect C = {5}$.],
    True([$A sect B = (0; 5)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Biểu diễn các tập hợp trên trục số:
    - a) *Sai*, hợp $A union B = (-2; 5) union (0; +oo) = (-2; +oo) != (0; 5)$.
    - b) *Đúng*, vì $C = [5; 7] subset (0; +oo) = B$ nên giao của chúng chính bằng $C = [5; 7]$.
    - c) *Sai*, vì $5 in.not A$ (do $A$ là khoảng $(-2; 5)$ mở tại 5) nên $5 in.not A sect C$. Do đó $A sect C = emptyset != {5}$.
    - d) *Đúng*, giao của $A$ và $B$ là $(-2; 5) sect (0; +oo) = (0; 5)$.
  ]
)

#ds(
  [Cho các tập hợp $A = {x in RR mid x <= 3}$, $B = {x in RR mid -3 < x < 5}$, $C = [3; +oo)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([$A sect B = (-3; 3]$.]),
    True([$A union B = (-oo; 5)$.]),
    [$A sect C = emptyset$.],
    True([$B union C = (-3; +oo)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $A = (-oo; 3]$, $B = (-3; 5)$, $C = [3; +oo)$.
    - a) *Đúng*, $A sect B = (-oo; 3] sect (-3; 5) = (-3; 3]$.
    - b) *Đúng*, $A union B = (-oo; 3] union (-3; 5) = (-oo; 5)$.
    - c) *Sai*, vì số $3 in A$ và $3 in C$ nên $A sect C = {3} != emptyset$.
    - d) *Đúng*, $B union C = (-3; 5) union [3; +oo) = (-3; +oo)$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 5, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho tập hợp $A = [-3; 1) union (0; 4]$. Tập hợp $A$ có bao nhiêu giá trị nguyên?],
  [8],
  loigiai: [
    📌 *Phương pháp:* Sử dụng phép hợp trên trục số.

    ✍️ *Lời giải chi tiết:* \
    Ta có $[-3; 1) union (0; 4] = [-3; 4]$ vì khoảng $(0; 1)$ được chứa trong cả hai tập và nối liền tại điểm $1$ (thuộc tập thứ hai) và điểm $0$ (thuộc tập thứ nhất).
    Các số nguyên thuộc đoạn $[-3; 4]$ là: $-3; -2; -1; 0; 1; 2; 3; 4$.
    Số lượng các giá trị nguyên là $4 - (-3) + 1 = 8$.
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai tập hợp $A = {x in NN mid x < 20, x " chia hết cho " 3}$ và $B = {x in RR mid x^2 - 5x = 0}$. Tập hợp $A union B$ có bao nhiêu phần tử?],
  [8],
  loigiai: [
    📌 *Phương pháp:* Áp dụng nguyên lý cộng.

    ✍️ *Lời giải chi tiết:* \
    - Tập hợp $A$ gồm các số tự nhiên nhỏ hơn 20 và chia hết cho 3:
      $ A = {0; 3; 6; 9; 12; 15; 18} text(" (có 7 phần tử)"). $
    - Tập hợp $B$ gồm các nghiệm thực của phương trình $x(x - 5) = 0$:
      $ B = {0; 5} text(" (có 2 phần tử)"). $
    - Tập hợp $A union B = {0; 3; 5; 6; 9; 12; 15; 18}$.
    Vì phần tử $0$ thuộc cả hai tập nên số phần tử của $A union B$ là $7 + 2 - 1 = 8$ phần tử.
    
    ✅ *Đáp số:* $8$.
  ]
)

#tln(
  dir: "ngang",
  [Cho tập hợp $A = (-oo; -2]$ và $B = (-5; 3]$. Tính tổng các giá trị nguyên của tập hợp $A sect B$.],
  [-9],
  loigiai: [
    📌 *Phương pháp:* Sử dụng phép giao trên trục số.

    ✍️ *Lời giải chi tiết:* \
    Giao của hai nửa khoảng là:
    $ A sect B = (-oo; -2] sect (-5; 3] = (-5; -2]. $
    Các giá trị nguyên thuộc nửa khoảng $(-5; -2]$ là: $-4; -3; -2$.
    Tổng các giá trị nguyên đó là: $(-4) + (-3) + (-2) = -9$.
    
    ✅ *Đáp số:* $-9$.
  ]
)

#tln(
  dir: "ngang",
  [Cho hai tập hợp khác rỗng $A = (m - 1; 4]$ và $B = (-2; 2m + 2)$, với $m in RR$. Có bao nhiêu giá trị nguyên dương của tham số $m$ để $A sect B != emptyset$?],
  [4],
  loigiai: [
    📌 *Phương pháp:* Giải điều kiện hai tập không giao nhau và lấy phần bù.

    ✍️ *Lời giải chi tiết:* \
    - Điều kiện để hai tập hợp khác rỗng:
      $ #heva("m - 1 < 4", "2m + 2 > -2") <=> #heva("m < 5", "2m > -4") <=> -2 < m < 5. $
    - Hai tập hợp $A$ và $B$ rời nhau ($A sect B = emptyset$) khi và chỉ khi:
      $ #hoac("2m + 2 <= m - 1", "4 <= -2") <=> #hoac("m <= -3", "vô nghiệm") <=> m <= -3. $
    - Do đó, $A sect B != emptyset <=> m > -3$.
    Kết hợp với điều kiện $-2 < m < 5$, ta được $-2 < m < 5$.
    Vì $m$ là số nguyên dương nên $m in {1; 2; 3; 4}$.
    Vậy có đúng $4$ giá trị nguyên dương của $m$ thỏa mãn yêu cầu bài toán.
    
    ✅ *Đáp số:* $4$.
  ]
)

#tln(
  dir: "ngang",
  [Một nhóm có 12 học sinh chuẩn bị văn nghệ: 5 em múa, 3 em tham gia cả múa và hát, 4 em không tham gia tiết mục nào. Hỏi có bao nhiêu em tham gia tiết mục hát?],
  [6],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức số phần tử của hợp hai tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Gọi $M$ là tập hợp học sinh tham gia múa, $H$ là tập hợp học sinh tham gia hát.
    - Số học sinh tham gia ít nhất một tiết mục là:
      $ n(M union H) = 12 - 4 = 8 text(" học sinh"). $
    - Áp dụng công thức số phần tử của hợp hai tập hợp:
      $ n(M union H) = n(M) + n(H) - n(M sect H). $
    Thay số: $8 = 5 + n(H) - 3 <=> 8 = 2 + n(H) <=> n(H) = 6 text(" học sinh")$.
    Vậy có đúng $6$ em tham gia tiết mục hát.
    
    ✅ *Đáp số:* $6$.
  ]
)

