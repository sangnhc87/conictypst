#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Mệnh đề với kí hiệu $forall$ và $exists$", mau: C1)

#phuong-phap(mau: C1)[
  - Kí hiệu $forall$ đọc là *"với mọi"*; kí hiệu $exists$ đọc là *"tồn tại"* (hoặc *"có ít nhất một"*).
  - Phủ định của mệnh đề "$forall x in X, P(x)$" là mệnh đề "$exists x in X, overline(P)(x)$".
  - Phủ định của mệnh đề "$exists x in X, P(x)$" là mệnh đề "$forall x in X, overline(P)(x)$".
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Dùng kí hiệu $forall$ hoặc $exists$ để mô tả các mệnh đề sau:
    + Với mọi số tự nhiên $x$, $sqrt(x)$ là số vô tỉ.
    + Tồn tại số nguyên cộng với chính nó bằng $0$.
    + Bình phương của mọi số thực đều không âm.
    + Có số hữu tỉ $n$ sao cho $3n - 1 = 0$.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* "Với mọi số tự nhiên $x$, $sqrt(x)$ là số vô tỉ":
      Khẳng định này được viết dưới dạng kí hiệu là: "$forall x in NN, sqrt(x) in.not QQ$" (hoặc "$forall x in NN, sqrt(x) in II$").
    - *b)* "Tồn tại số nguyên cộng với chính nó bằng $0$":
      Khẳng định này được viết dưới dạng kí hiệu là: "$exists x in ZZ, x + x = 0$".
    - *c)* "Bình phương của mọi số thực đều không âm":
      Khẳng định này được viết dưới dạng kí hiệu là: "$forall x in RR, x^2 >= 0$".
    - *d)* "Có số hữu tỉ $n$ sao cho $3n - 1 = 0$":
      Khẳng định này được viết dưới dạng kí hiệu là: "$exists n in QQ, 3n - 1 = 0$".
  ])

  #bt-item(2, [Phát biểu bằng lời mệnh đề: "$forall x in RR, x^2 + 1 <= 0$" và cho biết mệnh đề đó đúng hay sai.  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *Phát biểu bằng lời:* "Với mọi số thực $x$, bình phương của số đó cộng với $1$ luôn nhỏ hơn hoặc bằng $0$" (hoặc "Tổng bình phương của bất kỳ số thực nào với $1$ đều không dương").
    - *Xét tính đúng sai:*
      Mệnh đề đã cho là một *mệnh đề sai*.
      Thật vậy, với mọi số thực $x in RR$, ta luôn có $x^2 >= 0$, suy ra $x^2 + 1 >= 1 > 0$.
      Do đó bất đẳng thức $x^2 + 1 <= 0$ không thể xảy ra với bất kỳ số thực $x$ nào.
  ])

  #bt-item(3, [Xét tính đúng sai và viết mệnh đề phủ định của các mệnh đề sau:
    + "$forall x in RR, x^2 + 2x + 2 > 0$".
    + "$exists x in RR, x^2 + 3x + 4 = 0$".
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Xét mệnh đề $P$: "$forall x in RR, x^2 + 2x + 2 > 0$":
      - Biến đổi tam thức bậc hai: $x^2 + 2x + 2 = (x + 1)^2 + 1$.
        Vì $(x + 1)^2 >= 0$ với mọi $x in RR$ nên $(x + 1)^2 + 1 >= 1 > 0, forall x in RR$.
        Do đó mệnh đề $P$ là *mệnh đề đúng*.
      - Mệnh đề phủ định của $P$ là: $overline(P)$: "$exists x in RR, x^2 + 2x + 2 <= 0$".
    - *b)* Xét mệnh đề $Q$: "$exists x in RR, x^2 + 3x + 4 = 0$":
      - Phương trình bậc hai $x^2 + 3x + 4 = 0$ có biệt thức $Delta = 3^2 - 4 dot 1 dot 4 = 9 - 16 = -7 < 0$.
        Do đó phương trình vô nghiệm trên tập số thực $RR$.
        Suy ra không tồn tại số thực $x$ nào thỏa mãn phương trình, nên mệnh đề $Q$ là *mệnh đề sai*.
      - Mệnh đề phủ định của $Q$ là: $overline(Q)$: "$forall x in RR, x^2 + 3x + 4 != 0$".
  ])

  #bt-item(4, [Viết mệnh đề phủ định của mệnh đề $A$: "$forall x in RR, -4x^2 + 4x - 1 <= 0$" và xét tính đúng sai của mệnh đề đó.  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *Mệnh đề phủ định:* Áp dụng quy tắc phủ định của mệnh đề chứa lượng từ $forall$:
      $overline(A)$: "$exists x in RR, -4x^2 + 4x - 1 > 0$".
    - *Xét tính đúng sai của $overline(A)$:*
      Biến đổi biểu thức:
      $-4x^2 + 4x - 1 = -(4x^2 - 4x + 1) = -(2x - 1)^2$
      Vì $(2x - 1)^2 >= 0$ với mọi $x in RR$ nên $-(2x - 1)^2 <= 0$ với mọi $x in RR$.
      Do đó không tồn tại giá trị $x in RR$ nào để biểu thức nhận giá trị dương.
      Vậy mệnh đề phủ định $overline(A)$ là một *mệnh đề sai* (và mệnh đề gốc $A$ là mệnh đề đúng).
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 12, reset-counter: true)

#tn(
  dir: "ngang",
  [Cho mệnh đề: "$forall x in RR, x^2 + 3x + 5 > 0$". Mệnh đề phủ định của mệnh đề trên là:],
  (
    [$forall x in RR, x^2 + 3x + 5 <= 0$.],
    True([$exists x in RR, x^2 + 3x + 5 <= 0$.]),
    [$forall x in RR, x^2 + 3x + 5 < 0$.],
    [$exists x in RR, x^2 + 3x + 5 > 0$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Theo quy tắc phủ định mệnh đề có chứa lượng từ:
    - Phủ định của lượng từ $forall$ là lượng từ $exists$.
    - Phủ định của bất đẳng thức "$>$" là bất đẳng thức "$<=$".
    Vậy mệnh đề phủ định là: "$exists x in RR, x^2 + 3x + 5 <= 0$".
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Phủ định của mệnh đề: "$forall n in NN: n^2 + 1$ không chia hết cho 3" là:],
  (
    ["$forall n in NN: n^2 + 1$ chia hết cho 3".],
    ["$exists n in NN: n^2 + 1$ không chia hết cho 3".],
    True(["$exists n in NN: n^2 + 1$ chia hết cho 3".]),
    ["$exists.not n in NN: n^2 + 1$ không chia hết cho 3".],
  ),
  loigiai: [
    - Phủ định của lượng từ "với mọi" ($forall$) là lượng từ "tồn tại" ($exists$).
    - Phủ định của vị ngữ "không chia hết cho 3" là "chia hết cho 3".
    Vậy mệnh đề phủ định là: "$exists n in NN: n^2 + 1$ chia hết cho 3".
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Phủ định của mệnh đề: "$exists x in RR: x^2 + x + 1$ là số dương" là:],
  (
    True(["$forall x in RR: x^2 + x + 1$ là số không dương".]),
    ["$forall x in RR: x^2 + x + 1$ là số âm".],
    ["$forall x in RR: x^2 + x + 1$ là số dương".],
    ["$exists x in RR: x^2 + x + 1$ là số dương".],
  ),
  loigiai: [
    - Phủ định của lượng từ $exists$ là lượng từ $forall$.
    - "Số dương" có nghĩa là số $> 0$. Phủ định của "$> 0$" là "$<= 0$", tức là "số không dương" (bao gồm số âm và số $0$).
    Vậy phủ định là: "$forall x in RR: x^2 + x + 1$ là số không dương".
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Cho mệnh đề: "Có một học sinh trong lớp C4 không chấp hành luật giao thông". Mệnh đề phủ định của mệnh đề này là:],
  (
    [Không có học sinh nào trong lớp C4 chấp hành luật giao thông.],
    True([Mọi học sinh trong lớp C4 đều chấp hành luật giao thông.]),
    [Có một học sinh trong lớp C4 chấp hành luật giao thông.],
    [Mọi học sinh trong lớp C4 không chấp hành luật giao thông.],
  ),
  loigiai: [
    Mệnh đề đã cho mang ý nghĩa: "Tồn tại ít nhất một học sinh trong lớp C4 không chấp hành luật giao thông".
    Phủ định lại khẳng định này là: "Mọi học sinh trong lớp C4 đều chấp hành luật giao thông".
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Cho mệnh đề: "Có một học sinh trong lớp 10A không thích học môn Toán". Mệnh đề phủ định của mệnh đề này là:],
  (
    True(["Mọi học sinh trong lớp 10A đều thích học môn Toán".]),
    ["Mọi học sinh trong lớp 10A đều không thích học môn Toán".],
    ["Mọi học sinh trong lớp 10A đều thích học môn Văn".],
    ["Có một học sinh trong lớp 10A thích học môn Toán".],
  ),
  loigiai: [
    Mệnh đề "Có một học sinh ... không thích..." là mệnh đề dạng $exists$.
    Phủ định của nó chuyển sang dạng $forall$: "Mọi học sinh trong lớp 10A đều thích học môn Toán".
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Mệnh đề: "Mọi động vật đều di chuyển" có mệnh đề phủ định là:],
  (
    [Có ít nhất một động vật di chuyển.],
    [Mọi động vật đều đứng yên.],
    True([Có ít nhất một động vật không di chuyển.]),
    [Mọi động vật đều không di chuyển.],
  ),
  loigiai: [
    Mệnh đề đã cho có dạng: "$forall x, P(x)$".
    Mệnh đề phủ định có dạng: "$exists x, overline(P)(x)$", tức là "Có ít nhất một động vật không di chuyển".
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Cho mệnh đề "$forall x in RR, x^2 - x + 7 < 0$". Mệnh đề nào là mệnh đề phủ định của mệnh đề trên?],
  (
    True([$exists x in RR, x^2 - x + 7 >= 0$.]),
    [$forall x in RR, x^2 - x + 7 > 0$.],
    [$forall x in RR, x^2 - x + 7 < 0$.],
    [$exists x in RR, x^2 - x + 7 < 0$.],
  ),
  loigiai: [
    Phủ định của lượng từ $forall$ là $exists$, và phủ định của dấu "$<$" là dấu "$>=$".
    Do đó mệnh đề phủ định là: "$exists x in RR, x^2 - x + 7 >= 0$".
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Cho mệnh đề: "$exists x in RR, 2x^2 - 3x - 5 < 0$". Mệnh đề phủ định sẽ là:],
  (
    True(["$forall x in RR, 2x^2 - 3x - 5 >= 0$".]),
    ["$forall x in RR, 2x^2 - 3x - 5 > 0$".],
    ["$exists x in RR, 2x^2 - 3x - 5 > 0$".],
    ["$exists x in RR, 2x^2 - 3x - 5 >= 0$".],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phủ định của lượng từ $exists$ là $forall$, phủ định của quan hệ "$<$" là "$>=$".
    Vậy mệnh đề phủ định là: "$forall x in RR, 2x^2 - 3x - 5 >= 0$".
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Mệnh đề phủ định của mệnh đề "$forall x in RR, x^2 + x + 5 <= 0$" là:],
  (
    [$exists x in RR, x^2 + x + 5 <= 0$.],
    [$forall x in RR, x^2 + x + 5 <= 0$.],
    True([$exists x in RR, x^2 + x + 5 > 0$.]),
    [$forall x in RR, x^2 + x + 5 < 0$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phủ định của lượng từ $forall$ là $exists$, phủ định của quan hệ "$<=$" là "$>$".
    Vậy mệnh đề phủ định là: "$exists x in RR, x^2 + x + 5 > 0$".
    
    ✅ *Chọn đáp án C.*
  ]
)

#tn(
  dir: "ngang",
  [Mệnh đề phủ định của mệnh đề "Phương trình $a x^2 + b x + c = 0 (a != 0)$ vô nghiệm" là mệnh đề nào sau đây?],
  (
    True([Phương trình $a x^2 + b x + c = 0 (a != 0)$ có nghiệm.]),
    [Phương trình $a x^2 + b x + c = 0 (a != 0)$ có 2 nghiệm phân biệt.],
    [Phương trình $a x^2 + b x + c = 0 (a != 0)$ có nghiệm kép.],
    [Phương trình $a x^2 + b x + c = 0 (a != 0)$ không có nghiệm.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    "Phương trình vô nghiệm" nghĩa là số nghiệm bằng $0$ (tập nghiệm $S = emptyset$).
    Phủ định của "vô nghiệm" là "có nghiệm" (tập nghiệm $S != emptyset$, tức là phương trình có ít nhất một nghiệm: có thể là nghiệm kép hoặc hai nghiệm phân biệt).
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Tìm mệnh đề phủ định của mệnh đề: "$forall x in RR, x^2 + x + 5 > 0$".],
  (
    [$exists x in RR, x^2 + x + 5 < 0$.],
    [$forall x in RR, x^2 + x + 5 < 0$.],
    [$forall x in RR, x^2 + x + 5 <= 0$.],
    True([$exists x in RR, x^2 + x + 5 <= 0$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phủ định của $forall$ là $exists$, phủ định của quan hệ "$>$" là "$<=$".
    Vậy mệnh đề phủ định là: "$exists x in RR, x^2 + x + 5 <= 0$".
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Tìm mệnh đề phủ định của mệnh đề "$forall x in RR: x^2 > x$".],
  (
    [$forall x in RR: x^2 <= x$.],
    [$exists x in RR: x^2 > x$.],
    True([$exists x in RR: x^2 <= x$.]),
    [$exists x in RR: x^2 < x$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phủ định của lượng từ $forall$ là $exists$, phủ định của quan hệ "$>$" là "$<=$".
    Vậy mệnh đề phủ định là: "$exists x in RR: x^2 <= x$".
    
    ✅ *Chọn đáp án C.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 5, reset-counter: true)

#ds(
  [Xét tính đúng, sai của mỗi mệnh đề sau:],
  (
    [$forall x in RR, x^2 > 0$.],
    True([$exists a in QQ, a > a^2$.]),
    True([$forall n in ZZ, n^2 + n + 2$ chia hết cho 2.]),
    [$forall n in NN, n(n + 1)(n + 2)$ không chia hết cho 3.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, xét tại $x = 0 in RR$, ta có $0^2 = 0 > 0$ là sai. Do đó khẳng định bình phương của mọi số thực đều lớn hơn $0$ là sai.
    - b) *Đúng*, chọn số hữu tỉ $a = 1/2 in QQ$. Ta có $a^2 = (1/2)^2 = 1/4$. Rõ ràng $1/2 > 1/4$ thỏa mãn $a > a^2$.
    - c) *Đúng*, ta có $n^2 + n + 2 = n(n + 1) + 2$. Với mọi số nguyên $n$, tích $n(n + 1)$ của hai số nguyên liên tiếp luôn là một số chẵn (chia hết cho $2$). Do đó $n(n + 1) + 2$ luôn chia hết cho $2$ với mọi $n in ZZ$.
    - d) *Sai*, với mọi số tự nhiên $n in NN$, ba số $n, n + 1, n + 2$ là ba số tự nhiên liên tiếp nên trong đó luôn có đúng một số chia hết cho $3$. Vì vậy tích $n(n + 1)(n + 2)$ luôn luôn chia hết cho $3$, khẳng định "không chia hết cho 3" là sai.
  ]
)

#ds(
  [Xét tính đúng, sai của mỗi mệnh đề sau:],
  (
    True([$exists x in QQ, 4x^2 - 1 = 0$.]),
    [$forall n in NN, n$ và $n + 2$ là các số nguyên tố.],
    [$forall x in RR, (x - 1)^2 != x - 1$.],
    [$forall n in NN, n^2 > n$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, giải phương trình: $4x^2 - 1 = 0 <=> x^2 = 1/4 <=> x = plus.minus 1/2$. Cả hai nghiệm này đều thuộc tập số hữu tỉ $QQ$.
    - b) *Sai*, lấy phản ví dụ với $n = 4 in NN$. Số $4$ có các ước $1, 2, 4$ nên không phải là số nguyên tố.
    - c) *Sai*, giải phương trình $(x - 1)^2 = x - 1 <=> (x - 1)(x - 2) = 0 <=> x = 1$ hoặc $x = 2$. Với $x = 1 in RR$, ta có $(1 - 1)^2 = 1 - 1 = 0$, do đó khẳng định dấu "$!=$" với mọi số thực là sai.
    - d) *Sai*, lấy phản ví dụ với $n = 0 in NN$ ta có $0^2 = 0 > 0$ (sai); với $n = 1 in NN$ ta có $1^2 = 1 > 1$ (sai).
  ]
)

#ds(
  [Xét tính đúng (sai) của các mệnh đề sau:],
  (
    [$forall x in RR, x^3 - x^2 + 1 > 0$.],
    True([$exists n in NN, n^2 + 3$ chia hết cho 4.]),
    [$P: forall x in RR, forall y in RR: x + y = 1$.],
    True([$Q: exists x in RR, exists y in RR: x + y = 2$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, chọn phản ví dụ $x = -2 in RR$. Ta có $(-2)^3 - (-2)^2 + 1 = -8 - 4 + 1 = -11 < 0$. Do đó bất đẳng thức không đúng với mọi $x in RR$.
    - b) *Đúng*, chọn $n = 1 in NN$. Khi đó $1^2 + 3 = 4$ chia hết cho $4$. Vậy tồn tại số tự nhiên $n$ thỏa mãn.
    - c) *Sai*, mệnh đề $P$ khẳng định mọi cặp số thực $x, y$ đều có tổng bằng $1$. Phản ví dụ: chọn $x = 0, y = 0$ ta có $0 + 0 = 0 != 1$.
    - d) *Đúng*, mệnh đề $Q$ khẳng định tồn tại ít nhất một cặp số thực $x, y$ có tổng bằng $2$. Ta chỉ ra cặp số $x = 1 in RR, y = 1 in RR$ thỏa mãn $1 + 1 = 2$.
  ]
)

#ds(
  [Cho mệnh đề chứa biến $P(x): x > 1/x$, xét tính đúng sai của các mệnh đề sau:],
  (
    [$P(1)$.],
    True([$P(-1/3)$.]),
    [$forall x in NN, P(x)$.],
    True([$exists x in NN, P(x)$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, thay $x = 1$ vào mệnh đề ta được: $P(1): 1 > 1/1 <=> 1 > 1$, đây là một khẳng định sai.
    - b) *Đúng*, thay $x = -1/3$ vào ta được: $P(-1/3): -1/3 > 1/(-1/3) <=> -1/3 > -3$, đây là một khẳng định đúng.
    - c) *Sai*, với $x = 0 in NN$, phân thức $1/x$ không xác định. Ngoài ra với $x = 1 in NN$, mệnh đề $P(1)$ sai. Do đó khẳng định đúng với mọi $x in NN$ là sai.
    - d) *Đúng*, chọn số tự nhiên $x = 2 in NN$, ta có $2 > 1/2$ là khẳng định đúng. Do đó tồn tại số tự nhiên thỏa mãn $P(x)$.
  ]
)

#ds(
  [Xét tính đúng sai của các mệnh đề sau:],
  (
    [$A: forall x in RR, forall y in RR: x + y = 1$.],
    True([$B: exists x in RR, exists y in RR: x + y = 2$.]),
    True([$C: exists x in RR, forall y in RR: y = x y$.]),
    True([$D: forall a in RR, exists b in RR: a = 3b$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, chọn $x = 1, y = 2$ ta có $1 + 2 = 3 != 1$, do đó không phải mọi cặp số thực đều có tổng bằng $1$.
    - b) *Đúng*, tồn tại cặp số thực $x = 0, y = 2$ có tổng $0 + 2 = 2$.
    - c) *Đúng*, chọn số thực $x = 1 in RR$. Khi đó với mọi số thực $y in RR$, ta luôn có $x y = 1 dot y = y$.
    - d) *Đúng*, với mỗi số thực $a in RR$ cho trước, ta luôn tìm được số thực $b = a/3 in RR$ sao cho $3b = 3 dot (a/3) = a$.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho các mệnh đề sau:
  - a) $sqrt((-5)^2) = -5$.
  - b) $5^2 + 12^2 = 13^2$.
  - c) $forall x in RR, x^2 + 1 > 0$.
  - d) $exists x in ZZ, x^2 + 3 = 0$.
  Trong các mệnh đề trên, có bao nhiêu mệnh đề đúng?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Xét tính đúng sai của từng mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, theo định nghĩa căn bậc hai số học: $sqrt((-5)^2) = |-5| = 5 != -5$.
    - b) *Đúng*, ta có $5^2 + 12^2 = 25 + 144 = 169 = 13^2$.
    - c) *Đúng*, vì $x^2 >= 0$ với mọi $x in RR$ nên $x^2 + 1 >= 1 > 0, forall x in RR$.
    - d) *Sai*, với mọi số nguyên $x in ZZ$, $x^2 >= 0 => x^2 + 3 >= 3 > 0$, do đó phương trình $x^2 + 3 = 0$ không thể có nghiệm thực (và nghiệm nguyên).
    Vậy có đúng $2$ mệnh đề đúng (gồm mệnh đề b và c).
    
    ✅ *Đáp số:* $2$.
  ]
)

#tln(
  dir: "ngang",
  [Mệnh đề "$forall x in RR, x^2 - 2 + a > 0$" với $a$ là số nguyên cho trước. Tìm giá trị nguyên nhỏ nhất của $a$ để mệnh đề đúng.],
  [3],
  loigiai: [
    📌 *Phương pháp:* Dùng tính chất của tam thức bậc hai hoặc đánh giá GTNN.

    ✍️ *Lời giải chi tiết:* \
    Xét tam thức bậc hai $f(x) = x^2 + a - 2$ có hệ số $a_0 = 1 > 0$.
    Để bất đẳng thức $f(x) > 0$ đúng với mọi $x in RR$, ta có hai cách lập luận:
    - *Cách 1 (Dùng giá trị nhỏ nhất):*
      Với mọi $x in RR$, ta luôn có $x^2 >= 0$, dấu bằng xảy ra khi $x = 0$.
      Do đó $min_(x in RR) f(x) = f(0) = a - 2$.
      Điều kiện để $f(x) > 0, forall x in RR$ là: $min_(x in RR) f(x) > 0 <=> a - 2 > 0 <=> a > 2$.
    - *Cách 2 (Dùng dấu tam thức bậc hai):*
      Tam thức có $a_0 = 1 > 0$. Để $f(x) > 0, forall x in RR$ thì biệt thức thu gọn $Delta' < 0$:
      $Delta' = 0^2 - 1 dot (a - 2) = -(a - 2) < 0 <=> a - 2 > 0 <=> a > 2$.
    Vì $a$ là số nguyên nên $a in {3, 4, 5, ...}$.
    Vậy giá trị nguyên nhỏ nhất của $a$ là *$3$*.
    
    ✅ *Đáp số:* $3$.
  ]
)

#tln(
  dir: "ngang",
  [Trong các mệnh đề sau, có bao nhiêu mệnh đề đúng?
  - a) $A: forall x in RR, x^2 >= 0$.
  - b) $B$: "Tồn tại số tự nhiên đều là số nguyên tố".
  - c) $C$: "$exists x in NN, x$ chia hết cho $x + 1$".
  - d) $D$: "$forall n in NN, n^4 - n^2 + 1$ là hợp số".
  + e) $E$: "Tồn tại hình thang là hình vuông".
  + f) $F$: "Tồn tại số thực $a$ sao cho $a + 1 + 1/(a + 1) <= 2$".],
  [4],
  loigiai: [
    📌 *Phương pháp:* Xét tính đúng sai của từng mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    Xét từng mệnh đề:
    - a) *Đúng*, bình phương của mọi số thực luôn không âm ($x^2 >= 0, forall x in RR$).
    - b) *Sai*, phát biểu lủng củng, không xác định tính đúng sai chuẩn logic toán học (sai).
    - c) *Đúng*, chọn $x = 0 in NN$, ta có số $0$ chia hết cho $0 + 1 = 1$ (vì $0 = 0 dot 1$).
    - d) *Sai*, với $n = 1 in NN$ ta có $1^4 - 1^2 + 1 = 1$ không phải là hợp số (số 1 không là số nguyên tố cũng không là hợp số); với $n = 2$ ta có $2^4 - 2^2 + 1 = 13$ là số nguyên tố chứ không phải hợp số.
    - e) *Đúng*, hình vuông có hai cạnh đáy đối diện song song, do đó hình vuông là một trường hợp riêng của hình thang.
    - f) *Đúng*, chọn số thực $a = -2$. Khi đó $a + 1 = -1$, ta có:
      $(a + 1) + 1/(a + 1) = -1 + 1/(-1) = -2 <= 2$ (thỏa mãn).
    Vậy có đúng $4$ mệnh đề đúng (gồm $A, C, E, F$).
    
    ✅ *Đáp số:* $4$.
  ]
)
