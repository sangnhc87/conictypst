#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Mệnh đề kéo theo, mệnh đề đảo, mệnh đề tương đương", mau: C1)

#phuong-phap(mau: C1)[
  - *Mệnh đề kéo theo*: "Nếu $P$ thì $Q$", kí hiệu $P => Q$. Mệnh đề $P => Q$ chỉ sai khi $P$ đúng và $Q$ sai.
  - *Mệnh đề đảo*: Mệnh đề đảo của $P => Q$ là $Q => P$.
  - *Mệnh đề tương đương*: "$P$ khi và chỉ khi $Q$" (hoặc "$P$ nếu và chỉ nếu $Q$"), kí hiệu $P <=> Q$. Đúng khi cả hai cùng đúng hoặc cùng sai.
  - *Điều kiện cần, điều kiện đủ*:
    - Trong $P => Q$: $P$ là điều kiện đủ để có $Q$; $Q$ là điều kiện cần để có $P$.
    - Trong $P <=> Q$: $P$ là điều kiện cần và đủ để có $Q$.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(
    1,
    [Lập mệnh đề $P => Q$ và xét tính đúng sai của nó, với $P$: "$pi > 4$" và $Q$: "$pi^2 > 10$".  ],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      - Mệnh đề $P => Q$: "Nếu $pi > 4$ thì $pi^2 > 10$".
      - Do $P$ sai (vì $pi approx 3,14 < 4$) nên mệnh đề kéo theo $P => Q$ luôn là mệnh đề đúng.
    ],
  )

  #bt-item(
    2,
    [Phát biểu mệnh đề đảo của mệnh đề: "Nếu $hat(A) = 90^@$ thì $Delta A B C$ là tam giác vuông" và xét tính đúng sai của mệnh đề đó.  ],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      - Mệnh đề đảo: "Nếu $Delta A B C$ là tam giác vuông thì $hat(A) = 90^@$".
      - Mệnh đề đảo này sai, vì tam giác $A B C$ có thể vuông tại $B$ hoặc vuông tại $C$.
    ],
  )

  #bt-item(
    3,
    [Cho hai mệnh đề:
      - $P$: "$A B C D$ là tứ giác nội tiếp".
      - $Q$: "Tổng số đo hai góc đối diện bằng $180^@$".
      Hãy phát biểu mệnh đề $P => Q$ dưới dạng điều kiện cần và đủ.
    ],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      Phát biểu: "$A B C D$ là tứ giác nội tiếp là điều kiện cần và đủ để tổng số đo hai góc đối diện bằng $180^@$".
    ],
  )

  #bt-item(
    4,
    [Phát biểu mệnh đề $P <=> Q$ và xét tính đúng sai của nó, giải thích:
      - $P$: "Bất phương trình $x^2 - 3x + 1 > 0$ có nghiệm".
      - $Q$: "Bất phương trình $x^2 - 3x + 1 <= 0$ vô nghiệm".
    ],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      - Phát biểu: "Bất phương trình $x^2 - 3x + 1 > 0$ có nghiệm khi và chỉ khi bất phương trình $x^2 - 3x + 1 <= 0$ vô nghiệm".
      - Tam thức bậc hai $x^2 - 3x + 1$ có $Delta = 9 - 4 = 5 > 0$, do đó $x^2 - 3x + 1 > 0$ có nghiệm ($P$ đúng), nhưng $x^2 - 3x + 1 <= 0$ có nghiệm trên đoạn $[(3 - sqrt(5))/2; (3 + sqrt(5))/2]$ (tức là $Q$ sai).
      - Vì $P$ đúng và $Q$ sai nên mệnh đề tương đương $P <=> Q$ là mệnh đề sai.
    ],
  )

  #bt-item(
    5,
    [Phát biểu mệnh đề $P => Q$ và mệnh đề đảo, xét tính đúng sai:
      + $P$: "Tứ giác $A B C D$ là hình thoi" và $Q$: "Tứ giác $A B C D$ có $A C$ và $B D$ cắt nhau tại trung điểm mỗi đường".
      + $P$: "$2 > 9$" và $Q$: "$4 < 3$".
      + $P$: "Tam giác $A B C$ vuông cân tại $A$" và $Q$: "Tam giác $A B C$ có $hat(A) = 2hat(B)$".
      + $P$: "Ngày 2 tháng 9 là ngày Quốc khánh Việt Nam" và $Q$: "Ngày 27 tháng 7 là ngày Thương binh liệt sĩ".
    ],
    loigiai: [
      ✍️ *Lời giải chi tiết:* \
      - a) $P => Q$: "Nếu tứ giác $A B C D$ là hình thoi thì $A C$ và $B D$ cắt nhau tại trung điểm mỗi đường" (Đúng). Đảo: "Nếu $A C$ và $B D$ cắt nhau tại trung điểm mỗi đường thì $A B C D$ là hình thoi" (Sai, vì đó chỉ là hình bình hành).
      - b) $P => Q$: "Nếu $2 > 9$ thì $4 < 3$" (Đúng, tiền đề sai). Đảo: "Nếu $4 < 3$ thì $2 > 9$" (Đúng, tiền đề sai).
      - c) $P => Q$: Đúng (vì $hat(A) = 90^@, hat(B) = 45^@ => hat(A) = 2hat(B)$). Đảo: Sai (chẳng hạn tam giác vuông tại $A$ có $hat(B) = 45^@$ thì vuông cân, nhưng tam giác có $hat(B) = 30^@, hat(A) = 60^@, hat(C) = 90^@$ thì $hat(A) = 2hat(B)$ nhưng không vuông cân tại $A$).
      - d) Cả hai mệnh đề đều đúng thực tế nên $P => Q$ và $Q => P$ đều đúng.
    ],
  )
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)],
  count: 4,
  reset-counter: true,
)

#tn(
  dir: "ngang",
  [Mệnh đề nào sau đây sai?],
  (
    [Tứ giác $A B C D$ là hình chữ nhật thì tứ giác $A B C D$ có $3$ góc vuông.],
    True([Tam giác $A B C$ là tam giác đều $<=> hat(A) = 60^@$.]),
    [Tam giác $A B C$ cân tại $A => A B = A C$.],
    [Tứ giác $A B C D$ nội tiếp đường tròn tâm $O => O A = O B = O C = O D$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Tam giác chỉ có $hat(A) = 60^@$ chưa đủ để kết luận tam giác đều (phải là tam giác cân có một góc $60^@$). Do đó mệnh đề B sai.

    ✅ *Chọn đáp án B.*
  ],
)

#tn(
  dir: "ngang",
  [Trong các mệnh đề sau, mệnh đề nào là mệnh đề sai?],
  (
    [$sqrt(23) < 5 => -2sqrt(23) > -2 dot 5$.],
    [$pi < 4 <=> pi^2 < 16$.],
    True([$-pi < -2 <=> pi^2 < 4$.]),
    [$sqrt(23) < 5 => 2sqrt(23) < 2 dot 5$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta có $-pi < -2$ là đúng (vì $pi > 2$), nhưng $pi^2 approx 9,87 > 4$ nên $pi^2 < 4$ là sai. Mệnh đề tương đương giữa khẳng định đúng và khẳng định sai là sai.

    ✅ *Chọn đáp án C.*
  ],
)

#tn(
  dir: "ngang",
  [Cho "$P <=> Q$" là mệnh đề đúng. Khẳng định nào sau đây là sai?],
  (
    [$overline(P) <=> overline(Q)$ đúng.],
    [$overline(Q) <=> P$ sai.],
    [$overline(P) <=> Q$ sai.],
    True([$overline(P) <=> overline(Q)$ sai.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Khi $P <=> Q$ đúng thì $P, Q$ cùng tính đúng sai. Khi đó $overline(P), overline(Q)$ cũng cùng tính đúng sai nên $overline(P) <=> overline(Q)$ phải là mệnh đề đúng. Do đó khẳng định "$overline(P) <=> overline(Q)$ sai" là khẳng định sai.

    ✅ *Chọn đáp án D.*
  ],
)

#tn(
  dir: "ngang",
  [Cho mệnh đề $P$: "Hình bình hành $A B C D$ có một góc vuông", $Q$: "$A B C D$ là hình chữ nhật". Mệnh đề "$P => Q$" được phát biểu là:],
  (
    [Nếu tứ giác $A B C D$ là hình chữ nhật thì $A B C D$ là hình bình hành và có một góc vuông.],
    True([Nếu hình bình hành $A B C D$ có một góc vuông thì $A B C D$ là hình chữ nhật.]),
    [Hình bình hành $A B C D$ có một góc vuông khi và chỉ khi $A B C D$ là hình chữ nhật.],
    [Hình bình hành $A B C D$ có một góc vuông là điều kiện cần và đủ để $A B C D$ là hình chữ nhật.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Mệnh đề "$P => Q$" phát biểu dạng "Nếu $P$ thì $Q$".

    ✅ *Chọn đáp án B.*
  ],
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)],
  count: 4,
  reset-counter: true,
)

#ds(
  [Cho hai mệnh đề $P$: "Tam giác $A B C$ là tam giác đều" và $Q$: "Tam giác $A B C$ là tam giác cân". Xét tính đúng sai của các khẳng định sau:],
  (
    True([$P$ là điều kiện đủ để có $Q$.]),
    True([$Q$ là điều kiện cần để có $P$.]),
    True([Mệnh đề "Nếu $P$ thì $Q$" là mệnh đề đúng.]),
    [Mệnh đề "Nếu $Q$ thì $P$" là mệnh đề đúng.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, b) *Đúng*, c) *Đúng*, vì tam giác đều chắc chắn là tam giác cân, nên $P => Q$ đúng.
    - d) *Sai*, vì tam giác cân chưa chắc là tam giác đều.
  ],
)

#ds(
  [Cho hai mệnh đề $P$: "Tứ giác $A B C D$ là hình vuông" và $Q$: "Tứ giác $A B C D$ là hình chữ nhật có hai đường chéo vuông góc với nhau". Xét tính đúng sai của các khẳng định sau:],
  (
    True(
      [Mệnh đề đảo của mệnh đề $P => Q$ là "Nếu $A B C D$ là hình chữ nhật có hai đường chéo vuông góc với nhau thì $A B C D$ là hình vuông".],
    ),
    [Hai mệnh đề $P$ và $Q$ không tương đương với nhau.],
    [Mệnh đề $P <=> Q$ là mệnh đề sai.],
    True([$P$ là điều kiện cần và đủ để có $Q$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, theo cấu trúc mệnh đề đảo.
    - b) *Sai*, c) *Sai*, vì hình chữ nhật có 2 đường chéo vuông góc chính là hình vuông (dấu hiệu nhận biết), nên $P <=> Q$ là đúng.
    - d) *Đúng*, vì hai mệnh đề tương đương.
  ],
)

#ds(
  [Cho hai mệnh đề sau: $P$: "Hình bình hành có một góc vuông là hình chữ nhật" và $Q$: "Số 7 là hợp số". Xét tính đúng sai của các khẳng định sau:],
  (
    True([Mệnh đề $P$ là mệnh đề đúng.]),
    [Mệnh đề $Q$ là mệnh đề đúng.],
    [Mệnh đề $P => Q$ là mệnh đề đúng.],
    True([Mệnh đề $Q => P$ là mệnh đề đúng.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng* (dấu hiệu nhận biết hình chữ nhật).
    - b) *Sai* (7 là số nguyên tố).
    - c) *Sai* ($P$ đúng, $Q$ sai thì $P => Q$ sai).
    - d) *Đúng* (tiền đề $Q$ sai thì mệnh đề kéo theo luôn đúng).
  ],
)

#ds(
  [Xét tính đúng, sai của các mệnh đề sau:],
  (
    True([$forall n in NN, n^2 " chia hết cho " 7 => n " chia hết cho " 7$.]),
    True([$forall n in NN, n^2 " chia hết cho " 5 => n " chia hết cho " 5$.]),
    True([Nếu tam giác $A B C$ không phải là tam giác đều thì tam giác đó có ít nhất một góc nhỏ hơn $60^@$.]),
    True([Tứ giác $A B C D$ nội tiếp được đường tròn $=>$ Tổng số đo của hai góc đối diện bằng $180^@$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, b) *Đúng*, vì 7 và 5 là các số nguyên tố.
    - c) *Đúng*: Nếu cả 3 góc đều $>= 60^@$ và không đều thì tổng ba góc sẽ $> 180^@$ (mâu thuẫn).
    - d) *Đúng*: Định lý tứ giác nội tiếp.
  ],
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 4, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho $n$ là số tự nhiên. Xét các mệnh đề:
    - $P$: "$n$ là một số tự nhiên chia hết cho 16".
    - $Q$: "$n$ là một số tự nhiên chia hết cho 8".
    Cho biết có bao nhiêu mệnh đề đúng trong các mệnh đề: "$P => Q$", "$Q => P$" và "$P <=> Q$"?],
  [1],
  loigiai: [
    📌 *Phương pháp:* Đếm các mệnh đề đúng.

    ✍️ *Lời giải chi tiết:* \
    Số chia hết cho 16 thì luôn chia hết cho 8 nên $P => Q$ đúng. Ngược lại số chia hết cho 8 chưa chắc chia hết cho 16 (ví dụ $n=8$), nên $Q => P$ sai và $P <=> Q$ sai. Vậy chỉ có 1 mệnh đề đúng.

    ✅ *Đáp số:* $1$.
  ],
)

#tln(
  dir: "ngang",
  [Cho các mệnh đề:
    - $A$: "Nếu $Delta A B C$ đều có cạnh bằng $a$, đường cao là $h$ thì $h = (a sqrt(3))/2$";
    - $B$: "Tứ giác có bốn cạnh bằng nhau là hình vuông";
    - $C$: "15 là số nguyên tố";
    - $D$: "$sqrt(125)$ là một số nguyên".
    Hãy cho biết trong các mệnh đề sau có bao nhiêu mệnh đề sai: $A => B$, $B => C$, $A => D$?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Xét tính đúng sai của từng mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    Ta thấy $A$ đúng; $B$ sai (là hình thoi); $C$ sai; $D$ sai.
    - $A => B$: Đúng $=>$ Sai là mệnh đề SAI.
    - $B => C$: Sai $=>$ Sai là mệnh đề ĐÚNG.
    - $A => D$: Đúng $=>$ Sai là mệnh đề SAI.
    Vậy có 2 mệnh đề sai.

    ✅ *Đáp số:* $2$.
  ],
)

#tln(
  dir: "ngang",
  [Trên một hòn đảo có 3 người $A, B, C$: một người là hiệp sĩ (luôn nói thật), một người là kẻ bất lương (luôn nói dối), một người là gián điệp (có thể nói thật hoặc nói dối).
    - $A$ nói: "Tôi là hiệp sĩ."
    - $B$ nói: "Tôi là kẻ bất lương."
    - $C$ nói: "Tôi là gián điệp."
    Hỏi ai là gián điệp? (Trả lời tên người $A, B$ hoặc $C$)],
  [B],
  loigiai: [
    📌 *Phương pháp:* Lập luận logic theo các giả thiết.

    ✍️ *Lời giải chi tiết:* \
    Ta phân tích vai trò có thể có của người $B$ dựa vào câu nói *"Tôi là kẻ bất lương"*:
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 2.3fr),
        align: (center + horizon, left + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Giả thiết vai trò của $B$*], [*Tính chân thực của câu nói của $B$*], [*Đánh giá logic*],
        [Hiệp sĩ (luôn nói thật)],
        [Câu nói phải là thật $=>$ $B$ là kẻ bất lương.],
        [Mâu thuẫn (Hiệp sĩ không thể là kẻ bất lương)],

        [Kẻ bất lương (luôn nói dối)],
        [Câu nói phải là dối $=>$ $B$ không là kẻ bất lương.],
        [Mâu thuẫn (vì giả thiết $B$ là kẻ bất lương)],

        [*Gián điệp* (có thể nói dối)], [Câu nói là một lời nói dối của gián điệp.], [*Hoàn toàn thỏa mãn và hợp lý*],
      )
    ]
    - Do đó, *$B$ bắt buộc phải là gián điệp*.
    - Khi $B$ là gián điệp, câu nói của $C$ ("Tôi là gián điệp") là một lời nói dối. Vì $C$ nói dối nên $C$ không thể là hiệp sĩ $=>$ $C$ là kẻ bất lương.
    - Người còn lại là $A$ là hiệp sĩ, câu nói "Tôi là hiệp sĩ" của $A$ là sự thật.
    Vậy người là gián điệp là *$B$*.

    ✅ *Đáp số:* $B$.
  ],
)

#tln(
  dir: "ngang",
  [Ba anh em An, Bình, Vinh ngồi làm bài xung quanh một cái bàn được trải khăn mới. Khi phát hiện có vết mực, bà hỏi thì các cháu lần lượt trả lời:
    - An: "Em Vinh không làm đổ mực, đấy là do em Bình."
    - Bình: "Em Vinh làm đổ mực, anh An không làm đổ mực."
    - Vinh: "Theo cháu, Bình không làm đổ mực, còn cháu hôm nay không chuẩn bị bài."
    Biết rằng trong 3 em có 2 em nói đúng, 1 em nói sai. Hỏi ai làm đổ mực?],
  [Vinh],
  loigiai: [
    📌 *Phương pháp:* Lập luận logic dựa trên phát biểu và giả thiết.

    ✍️ *Lời giải chi tiết:* \
    Xét các trường hợp người làm đổ mực và tính chân thực trong lời nói của 3 bạn:
    #align(center)[
      #table(
        columns: (1.5fr, 1.4fr, 1.4fr, 1.4fr, 1.8fr),
        align: (center + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người làm đổ mực*], [*Lời An*], [*Lời Bình*], [*Lời Vinh*], [*Số người đúng & Kết luận*],
        [Giả sử An đổ], [Sai], [Sai], [Đúng], [1 đúng, 2 sai (Loại)],
        [Giả sử Bình đổ], [Đúng], [Sai], [Sai], [1 đúng, 2 sai (Loại)],
        [*Giả sử Vinh đổ*], [*Sai*], [*Đúng*], [*Đúng*], [*2 đúng, 1 sai (Thỏa mãn)*],
      )
    ]
    - *Lập luận logic*:
      - Lời của An (*"Bình làm đổ"*) và lời của Vinh (*"Bình không làm đổ"*) là hai mệnh đề phủ định của nhau, nên trong hai người An và Vinh chắc chắn có đúng một người nói đúng và một người nói sai.
      - Vì đề bài cho biết có đúng 2 người nói đúng và 1 người nói sai, nên người nói đúng thứ hai bắt buộc phải là *Bình*.
      - Bình nói đúng nghĩa là khẳng định *"Em Vinh làm đổ mực, anh An không làm đổ mực"* là sự thật.
    - Vậy người làm đổ mực chính là *Vinh*.

    ✅ *Đáp số:* Vinh.
  ],
)

#tln(
  dir: "ngang",
  [Trong giờ ra chơi, một quyển sổ bị mất. Có ba bạn An, Bình, Cường; biết chỉ một bạn lấy quyển sổ. Các bạn lần lượt nói:
    - An: "Bình lấy quyển sổ."
    - Bình: "Cường không lấy quyển sổ."
    - Cường: "An không lấy quyển sổ."
    Biết có đúng $2$ phát biểu đúng. Hỏi ai đã lấy quyển sổ? (Trả lời tên bạn An, Bình hoặc Cường)],
  [An],
  loigiai: [
    📌 *Phương pháp:* Giả sử lần lượt từng bạn lấy quyển sổ, sau đó kiểm tra số phát biểu đúng.

    ✍️ *Lời giải chi tiết:* \
    Ta lập bảng xét ba khả năng:
    #align(center)[
      #table(
        columns: (1.6fr, 1.4fr, 1.4fr, 1.4fr, 2fr),
        align: (center + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
        stroke: 0.5pt + rgb("#b0bec5"),
        fill: (col, row) => if row == 0 { rgb("#e3f2fd") } else { none },
        [*Người lấy sổ*], [*Lời An*], [*Lời Bình*], [*Lời Cường*], [*Số phát biểu đúng*],
        [*Giả sử An lấy*], [Sai], [Đúng], [Đúng], [*2 đúng (Thỏa mãn)*],
        [Giả sử Bình lấy], [Đúng], [Đúng], [Đúng], [3 đúng (Loại)],
        [Giả sử Cường lấy], [Sai], [Sai], [Đúng], [1 đúng (Loại)],
      )
    ]
    - Chỉ trường hợp *An lấy quyển sổ* có đúng $2$ phát biểu đúng.
    - Hai phát biểu đúng là: Bình nói "Cường không lấy quyển sổ" và Cường nói "An không lấy quyển sổ".
    Vậy người đã lấy quyển sổ là *An*.

    ✅ *Đáp số:* An.
  ],
)
