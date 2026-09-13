#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Phủ định của một mệnh đề", mau: C1)

#phuong-phap(mau: C1)[
  - Kí hiệu mệnh đề phủ định của mệnh đề $P$ là $overline(P)$.
  - Để phủ định một mệnh đề, ta thêm (hoặc bớt) từ "không" hoặc "không phải" vào trước vị ngữ của mệnh đề đó.
  - Chuyển đổi các liên hệ:
    - Tính chất $X$ $arrow.r.l$ không $X$.
    - Quan hệ "$=$" $arrow.r.l$ "$!=$".
    - Quan hệ "$<$" $arrow.r.l$ "$>=$".
    - Quan hệ "$>$" $arrow.r.l$ "$<=$".
  - Định lý về tính đúng sai: Nếu $P$ đúng thì $overline(P)$ sai; nếu $P$ sai thì $overline(P)$ đúng.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Lập mệnh đề phủ định của mỗi mệnh đề sau:
    + $P$: "Trong tam giác tổng ba góc bằng $180^@$".
    + $Q$: "6 không phải là số nguyên tố".
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Với mệnh đề $P$: Thêm từ "không" vào trước vị ngữ ta được mệnh đề phủ định:
      $overline(P)$: "Trong tam giác tổng ba góc *không* bằng $180^@$".
    - Với mệnh đề $Q$: Bớt từ "không phải" ở vị ngữ ta được mệnh đề phủ định:
      $overline(Q)$: "6 *là* số nguyên tố".
  ])

  #bt-item(2, [Lập mệnh đề phủ định của mỗi mệnh đề sau:
    + Mọi hình vuông đều là hình thoi.
    + Có một tam giác cân không phải là tam giác đều.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Mệnh đề đã cho mang ý nghĩa toàn thể ("với mọi hình vuông"). Phủ định của nó là khẳng định sự tồn tại của trường hợp ngoại lệ:
      "Có ít nhất một hình vuông không phải là hình thoi" (hoặc "Tồn tại hình vuông không là hình thoi").
    - *b)* Mệnh đề đã cho mang ý nghĩa tồn tại ("có một"). Phủ định của nó là khẳng định tính chất đúng cho toàn thể:
      "Mọi tam giác cân đều là tam giác đều".
  ])

  #bt-item(3, [Lập mệnh đề phủ định của mỗi mệnh đề sau và nhận xét tính đúng sai của mệnh đề phủ định đó:
    + $A$: "$5/1.2$ là một phân số".
    + $B$: "Phương trình $x^2 + 3x + 2 = 0$ có nghiệm".
    + $C$: "$2^2 + 2^3 = 2^(2+3)$".
    + $D$: "Số $2025$ chia hết cho $15$".
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Mệnh đề phủ định là $overline(A)$: "$5/1.2$ không phải là một phân số".
      - *Nhận xét:* Theo định nghĩa toán học, phân số có dạng $a/b$ với $a, b in ZZ$ và $b != 0$. Ở đây mẫu số là $1.2 in.not ZZ$, do đó $5/1.2$ không phải là phân số.
      - Vậy mệnh đề phủ định $overline(A)$ là *mệnh đề đúng*.
    - *b)* Mệnh đề phủ định là $overline(B)$: "Phương trình $x^2 + 3x + 2 = 0$ vô nghiệm".
      - *Nhận xét:* Giải phương trình: $x^2 + 3x + 2 = 0 <=> (x + 1)(x + 2) = 0 <=> x = -1$ hoặc $x = -2$. Phương trình có hai nghiệm thực nên mệnh đề $B$ đúng.
      - Do đó mệnh đề phủ định $overline(B)$ là *mệnh đề sai*.
    - *c)* Mệnh đề phủ định là $overline(C)$: "$2^2 + 2^3 != 2^(2+3)$".
      - *Nhận xét:* Ta có vế trái: $2^2 + 2^3 = 4 + 8 = 12$; vế phải: $2^(2+3) = 2^5 = 32$. Vì $12 != 32$ nên khẳng định khác nhau là đúng.
      - Vậy mệnh đề phủ định $overline(C)$ là *mệnh đề đúng*.
    - *d)* Mệnh đề phủ định là $overline(D)$: "Số $2025$ không chia hết cho $15$".
      - *Nhận xét:* Ta có phép chia $2025 : 15 = 135$ (chia hết). Do đó số $2025$ chia hết cho $15$ là khẳng định đúng ($D$ đúng).
      - Do đó mệnh đề phủ định $overline(D)$ là *mệnh đề sai*.
  ])

  #bt-item(4, [Lập mệnh đề phủ định của mỗi mệnh đề sau và nhận xét tính đúng sai của mệnh đề phủ định đó:
    + $A$: "Hình thoi có hai đường chéo vuông góc với nhau".
    + $B$: "6 là số nguyên tố".
    + $C$: "Tổng hai cạnh của một tam giác lớn hơn cạnh còn lại".
    + $D$: "$5 > -3$".
    + $E$: "Phương trình $x^4 - 2x^2 + 2 = 0$ có nghiệm".
    + $F$: "$(sqrt(3) - sqrt(12))^2 = 3$".
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Với $A$: Phủ định $overline(A)$: "Hình thoi có hai đường chéo không vuông góc với nhau".
      Theo tính chất hình thoi, hai đường chéo luôn vuông góc với nhau nên $A$ đúng, suy ra $overline(A)$ là *mệnh đề sai*.
    - Với $B$: Phủ định $overline(B)$: "6 không phải là số nguyên tố".
      Số $6$ có các ước số dương là $1, 2, 3, 6$ nên là hợp số. Do đó $overline(B)$ là *mệnh đề đúng*.
    - Với $C$: Phủ định $overline(C)$: "Có một tam giác mà tổng hai cạnh không lớn hơn cạnh còn lại" (hoặc "... nhỏ hơn hoặc bằng cạnh còn lại").
      Theo bất đẳng thức tam giác, tổng độ dài hai cạnh bất kỳ luôn lớn hơn cạnh thứ ba nên $C$ đúng, suy ra $overline(C)$ là *mệnh đề sai*.
    - Với $D$: Phủ định $overline(D)$: "$5 <= -3$".
      Vì $5 > 0 > -3$ nên $5 > -3$ là khẳng định đúng, do đó $overline(D)$ là *mệnh đề sai*.
    - Với $E$: Phủ định $overline(E)$: "Phương trình $x^4 - 2x^2 + 2 = 0$ vô nghiệm".
      Biến đổi vế trái: $x^4 - 2x^2 + 2 = (x^2 - 1)^2 + 1 >= 1 > 0$ với mọi $x in RR$. Do đó phương trình vô nghiệm trên $RR$. Vậy $overline(E)$ là *mệnh đề đúng*.
    - Với $F$: Phủ định $overline(F)$: "$(sqrt(3) - sqrt(12))^2 != 3$".
      Ta có $sqrt(12) = 2sqrt(3)$, do đó $(sqrt(3) - 2sqrt(3))^2 = (-sqrt(3))^2 = 3$. Đẳng thức đúng nên mệnh đề phủ định $overline(F)$ là *mệnh đề sai*.
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 5, reset-counter: true)

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
    Mệnh đề gốc có dạng tồn tại ít nhất một học sinh vi phạm: "Có một học sinh... không chấp hành...".
    Phủ định lại khẳng định này là mọi học sinh đều chấp hành: "Mọi học sinh trong lớp C4 đều chấp hành luật giao thông".
    Chọn đáp án *B*.
  ]
)

#tn(
  dir: "ngang",
  [Cho mệnh đề $A$: "2 là số nguyên tố". Mệnh đề phủ định của mệnh đề $A$ là:],
  (
    [2 không phải là số hữu tỷ.],
    [2 là số nguyên.],
    True([2 không phải là số nguyên tố.]),
    [2 là hợp số.],
  ),
  loigiai: [
    Phủ định của khẳng định "$A$ là..." được lập bằng cách thêm từ "không phải" vào vị ngữ: "$A$ không phải là...".
    Do đó mệnh đề phủ định của $A$ là "2 không phải là số nguyên tố".
    Chọn đáp án *C*.
  ]
)

#tn(
  dir: "ngang",
  [Phủ định của mệnh đề "$n > 9$" là:],
  (
    ["$-n > 9$".],
    ["$-n > -9$".],
    ["$n < 9$".],
    True(["$n <= 9$".]),
  ),
  loigiai: [
    Phủ định của quan hệ lớn hơn ("$>$") là quan hệ nhỏ hơn hoặc bằng ("$<=$").
    Do đó phủ định của "$n > 9$" là "$n <= 9$".
    Chọn đáp án *D*.
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
    Phủ định của mệnh đề tồn tại trường hợp phủ định ("Có một... không thích...") là mệnh đề khẳng định toàn thể: "Mọi học sinh trong lớp 10A đều thích học môn Toán".
    Chọn đáp án *A*.
  ]
)

#tn(
  dir: "ngang",
  [Mệnh đề phủ định của mệnh đề "2018 là số tự nhiên chẵn" là:],
  (
    [2018 là số chẵn.],
    [2018 là số nguyên tố.],
    True([2018 không là số tự nhiên chẵn.]),
    [2018 là số chính phương.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Để phủ định mệnh đề, ta thêm từ "không" vào vị ngữ: "2018 không là số tự nhiên chẵn".
    
    ✅ *Chọn đáp án C.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Cho mệnh đề $P$: "23 là số nguyên tố". Xét tính đúng sai của các khẳng định sau:],
  (
    [Mệnh đề phủ định của mệnh đề $P$ là $overline(P)$: "23 là hợp số".],
    True([Mệnh đề phủ định của mệnh đề $P$ là $overline(P)$: "23 không là số nguyên tố".]),
    [Mệnh đề phủ định của mệnh đề $P$ là mệnh đề đúng.],
    True([Mệnh đề phủ định của mệnh đề $P$ là mệnh đề sai.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, vì tập hợp các số tự nhiên lớn hơn $1$ gồm số nguyên tố và hợp số, nhưng tập số tự nhiên còn chứa cả số $0$ và số $1$ (hai số này không là số nguyên tố cũng không là hợp số). Do đó phủ định logic chuẩn mực của "là số nguyên tố" phải là "không là số nguyên tố", chứ không thể quy kết thành "là hợp số".
    - b) *Đúng*, theo quy tắc phủ định, thêm từ "không" vào vị ngữ ta được $overline(P)$: "23 không là số nguyên tố".
    - c) *Sai*, vì $23$ chỉ có hai ước số dương là $1$ và $23$ nên $23$ là số nguyên tố (mệnh đề $P$ đúng). Suy ra mệnh đề phủ định $overline(P)$ phải là mệnh đề sai.
    - d) *Đúng*, do $P$ đúng nên $overline(P)$ là mệnh đề sai.
  ]
)

#ds(
  [Xét tính đúng, sai của các câu sau:],
  (
    True([$P$: "$3^3$ là số chính phương", có mệnh đề phủ định là $overline(P)$: "$3^3$ không là số chính phương".]),
    [$Q$: "Tam giác $A B C$ là tam giác cân", có mệnh đề phủ định là $overline(Q)$: "Tam giác $A B C$ không là tam giác vuông".],
    True([$R$: "$2^(2003) - 1$ là số nguyên tố", có mệnh đề phủ định là $overline(R)$: "$2^(2003) - 1$ không là số nguyên tố".]),
    True([$H$: "$sqrt(2)$ là số vô tỉ", có mệnh đề phủ định là $overline(H)$: "$sqrt(2)$ là số hữu tỉ".]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, mệnh đề phủ định của "$3^3$ là số chính phương" là "$3^3$ không là số chính phương".
    - b) *Sai*, mệnh đề phủ định của "tam giác cân" phải là "tam giác không cân", không thể tự ý thay đổi đối tượng thành "tam giác vuông".
    - c) *Đúng*, thêm từ "không" vào vị ngữ: $overline(R)$: "$2^(2003) - 1$ không là số nguyên tố".
    - d) *Đúng*, vì trong tập số thực $RR$, một số không phải là số vô tỉ thì bắt buộc phải là số hữu tỉ ($RR = QQ union II$ và $QQ sect II = emptyset$). Do đó "không là số vô tỉ" đồng nghĩa với "là số hữu tỉ".
  ]
)

#ds(
  [Cho biết mệnh đề phủ định của mỗi mệnh đề sau đúng hay sai?],
  (
    [Mệnh đề phủ định của $P$: "Hình thoi có hai đường chéo vuông góc với nhau" là mệnh đề đúng.],
    [Mệnh đề phủ định của $S$: "$1 > -3$" là mệnh đề đúng.],
    True([Mệnh đề phủ định của $K$: "Phương trình $x^4 - 2x^2 + 2 = 0$ có nghiệm" là mệnh đề đúng.]),
    [Mệnh đề phủ định của $H$: "$(sqrt(3) - sqrt(12))^2 = 3$" là mệnh đề đúng.],
  ),
  loigiai: [
    - *a) Sai:* Mọi hình thoi luôn có hai đường chéo vuông góc với nhau nên mệnh đề $P$ là mệnh đề đúng. Do đó mệnh đề phủ định $overline(P)$ là mệnh đề sai.
    - *b) Sai:* Vì $1 > -3$ là khẳng định đúng nên $S$ đúng, suy ra mệnh đề phủ định $overline(S)$: "$1 <= -3$" là mệnh đề sai.
    - *c) Đúng:* Biến đổi $x^4 - 2x^2 + 2 = (x^2 - 1)^2 + 1 >= 1 > 0, forall x in RR$. Phương trình đã cho vô nghiệm, nên mệnh đề $K$ ("có nghiệm") là sai. Do đó mệnh đề phủ định $overline(K)$ ("vô nghiệm") là mệnh đề đúng.
    - *d) Sai:* Ta có $(sqrt(3) - sqrt(12))^2 = (sqrt(3) - 2sqrt(3))^2 = (-sqrt(3))^2 = 3$. Đẳng thức này đúng nên mệnh đề $H$ đúng, suy ra mệnh đề phủ định $overline(H)$ là mệnh đề sai.
  ]
)

#ds(
  [Cho biết các cặp mệnh đề và mệnh đề phủ định sau:],
  (
    [$A$: "$-1.3/5$ là một phân số" và $overline(A)$: "$-1.3/5$ là số tự nhiên".],
    True([$B$: "Phương trình $x^2 + 3x - 2023 = 0$ có nghiệm" và $overline(B)$: "Phương trình $x^2 + 3x - 2023 = 0$ không có nghiệm" là mệnh đề sai.]),
    True([$D$: "Số 2023 chia hết cho 17" và $overline(D)$: "Số 2023 không chia hết cho 17".]),
    [$F$: "Hai đường thẳng $y = 2023x + 1$ và $y = -2023x + 1$ không song song" và $overline(F)$: "Hai đường thẳng vuông góc với nhau".],
  ),
  loigiai: [
    - *a) Sai:* Phủ định của "là một phân số" phải là "không phải là một phân số", không thể thay thế thành "là số tự nhiên".
    - *b) Đúng:* Phương trình $x^2 + 3x - 2023 = 0$ có $a dot c = 1 dot (-2023) < 0$ nên luôn có hai nghiệm phân biệt trái dấu. Mệnh đề $B$ ("có nghiệm") là đúng, suy ra mệnh đề phủ định $overline(B)$ ("không có nghiệm") là mệnh đề sai. Khẳng định b nói $overline(B)$ là mệnh đề sai là một khẳng định đúng.
    - *c) Đúng:* Mệnh đề phủ định được thiết lập chuẩn xác bằng cách thêm từ "không" vào trước vị ngữ.
    - *d) Sai:* Phủ định của "không song song" là "song song hoặc trùng nhau", không phải là "vuông góc với nhau".
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho mệnh đề $P$: "4 là số chẵn" và các mệnh đề sau:
  - "4 không là số chẵn".
  - "4 là số lẻ".
  - "4 không là số tự nhiên lẻ".
  - "4 không là số chia hết cho 2".
  Có bao nhiêu phát biểu là phủ định của mệnh đề $P$?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Đếm các phát biểu là phủ định của mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    Theo định nghĩa và cấu trúc logic:
    - Mệnh đề phủ định trực tiếp được lập bằng cách thêm từ "không" vào vị ngữ: *"4 không là số chẵn"*.
    - Khái niệm "số chẵn" đồng nghĩa với "số chia hết cho 2", do đó phát biểu *"4 không là số chia hết cho 2"* là phát biểu phủ định tương đương về mặt toán học.
    - Hai phát biểu còn lại không phải là mệnh đề phủ định chuẩn mực của $P$.
    Vậy có đúng $2$ phát biểu là phủ định của mệnh đề $P$.
    
    ✅ *Đáp số:* $2$.
  ]
)

#tln(
  dir: "ngang",
  [Cho mệnh đề $P$: "$x^2 + x + 1$ là số dương với $x$ là số thực" và các mệnh đề sau:
  - "$x^2 + x + 1$ là số không dương với $x$ là số thực".
  - "$x^2 + x + 1$ là khác 0 với $x$ là số thực".
  - "$x^2 + x + 1$ là số âm với $x$ là số thực".
  - "$x^2 + x + 1$ là số không âm với $x$ là số thực".
  Có bao nhiêu phát biểu là phủ định của mệnh đề $P$?],
  [1],
  loigiai: [
    📌 *Phương pháp:* Đếm các phát biểu là phủ định của mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    "Số dương" có nghĩa là số $> 0$. Phủ định của "$> 0$" là "$<= 0$", nghĩa là "số không dương" (bao gồm số âm và số $0$).
    - Do đó phủ định chuẩn xác của $P$ là phát biểu: *"$x^2 + x + 1$ là số không dương với $x$ là số thực"*.
    - Phát biểu "là số âm" chưa đủ (thiếu trường hợp bằng $0$).
    - Phát biểu "khác 0" và "không âm" đều sai về mặt logic.
    Vậy có duy nhất $1$ phát biểu là phủ định của mệnh đề $P$.
    
    ✅ *Đáp số:* $1$.
  ]
)

#tln(
  dir: "ngang",
  [Cho mệnh đề $P$: "$x^2 - 3x + 4 = 0$ vô nghiệm" và các mệnh đề sau:
  - "$x^2 - 3x + 4 = 0$ có nghiệm".
  - "$x^2 - 3x + 4 = 0$ có hai nghiệm phân biệt".
  - "$x^2 - 3x + 4 = 0$ không vô nghiệm".
  Có bao nhiêu phát biểu là phủ định của mệnh đề $P$?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Đếm các phát biểu là phủ định của mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    "Phương trình vô nghiệm" nghĩa là số nghiệm của phương trình bằng $0$.
    Phủ định của mệnh đề này là:
    - *"Phương trình có nghiệm"* (tức số nghiệm $>= 1$).
    - Thêm từ "không" vào vị ngữ: *"Phương trình không vô nghiệm"*.
    - Phát biểu "có hai nghiệm phân biệt" không phải là phủ định hoàn chỉnh vì chưa bao quát trường hợp phương trình có nghiệm kép.
    Vậy có đúng $2$ phát biểu là phủ định của mệnh đề $P$.
    
    ✅ *Đáp số:* $2$.
  ]
)
