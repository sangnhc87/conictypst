#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Nhận diện, xét tính đúng sai của mệnh đề, mệnh đề chứa biến", mau: C1)

#phuong-phap(mau: C1)[
  - *Mệnh đề* là một câu khẳng định đúng hoặc một câu khẳng định sai.
  - Một câu khẳng định đúng gọi là một *mệnh đề đúng*, một câu khẳng định sai gọi là một *mệnh đề sai*.
  - Một mệnh đề không thể vừa đúng vừa sai.
  - Câu hỏi, câu cảm thán, câu mệnh lệnh hoặc câu chưa xác định được tính đúng sai thì *không phải là mệnh đề*.
  - *Mệnh đề chứa biến* là câu khẳng định chứa một hay nhiều biến, tính đúng sai phụ thuộc vào giá trị của biến.
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Các câu sau đây, câu nào là mệnh đề, câu nào không phải là mệnh đề? Nếu là mệnh đề hãy cho biết mệnh đề đó đúng hay sai.
    + Bức tranh đẹp quá!
    + Phương trình $x^2 - 3x + 1 = 0$ vô nghiệm.
    + $16$ không là số nguyên tố.
    + Hai phương trình $x^2 - 4x + 3 = 0$ và $x^2 - sqrt(x + 3) + 1 = 0$ có nghiệm chung.
    + e) Số $pi$ có lớn hơn $3$ hay không?
    + f) Pháp vô địch WorldCup 2018.
    + g) Hai tam giác bằng nhau khi và chỉ khi chúng có diện tích bằng nhau.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Đây là câu cảm thán bộc lộ cảm xúc, không khẳng định một sự việc có tính chân thực khách quan nên *không phải là mệnh đề*.
    - *b)* Xét phương trình bậc hai $x^2 - 3x + 1 = 0$ có biệt thức:
      $Delta = (-3)^2 - 4 dot 1 dot 1 = 9 - 4 = 5 > 0$
      Phương trình có hai nghiệm phân biệt $x_(1,2) = (3 plus.minus sqrt(5))/2$. Do đó khẳng định phương trình vô nghiệm là *mệnh đề sai*.
    - *c)* Số $16$ có các ước số dương là $1, 2, 4, 8, 16$ (nhiều hơn 2 ước) nên $16$ là hợp số. Do đó khẳng định "$16$ không là số nguyên tố" là *mệnh đề đúng*.
    - *d)* Xét phương trình thứ nhất: $x^2 - 4x + 3 = 0 <=> (x - 1)(x - 3) = 0 <=> x = 1$ hoặc $x = 3$.
      Thay $x = 1$ vào phương trình thứ hai: $1^2 - sqrt(1 + 3) + 1 = 1 - 2 + 1 = 0$ (thỏa mãn).
      Như vậy $x = 1$ là nghiệm chung của hai phương trình. Do đó khẳng định này là *mệnh đề đúng*.
    - *e)* Đây là câu hỏi nghi vấn, không khẳng định tính đúng hay sai nên *không phải là mệnh đề*.
    - *f)* Đây là câu khẳng định một sự kiện thể thao lịch sử xác thực (đội tuyển Pháp đã thắng Croatia với tỉ số $4 - 2$ trong trận chung kết World Cup 2018) nên đây là *mệnh đề đúng*.
    - *g)* Mệnh đề có dạng $P <=> Q$. Chiều thuận: "Hai tam giác bằng nhau thì có diện tích bằng nhau" là đúng. Tuy nhiên chiều đảo: "Hai tam giác có diện tích bằng nhau thì bằng nhau" là sai (ví dụ: tam giác có đáy $4$, chiều cao $3$ và tam giác có đáy $6$, chiều cao $2$ đều có diện tích bằng $6$ nhưng kích thước các cạnh hoàn toàn khác nhau). Vì mệnh đề đảo sai nên mệnh đề tương đương là *mệnh đề sai*.
  ])

  #bt-item(2, [Cho các phát biểu sau, phát biểu nào là mệnh đề?
    + Hà Nội là thủ đô của Việt Nam.
    + $forall x in RR, 2x + 1 > 3$.
    + $x + 3 <= 2$.
    + Phương trình $x^2 - 3x + 4 = 0$ có nghiệm.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Khẳng định một sự thật địa lý - hành chính xác định: là *mệnh đề* (mệnh đề đúng).
    - *b)* Khẳng định toán học chứa lượng từ: là *mệnh đề* (với $x = 0$ thì $2(0) + 1 = 1 < 3$ nên đây là mệnh đề sai).
    - *c)* Là mệnh đề chứa biến $x$, tính đúng sai chưa xác định được khi chưa biết giá trị cụ thể của $x$ (ví dụ: với $x = -2$ thì đúng, nhưng với $x = 1$ thì sai). Do đó bản thân phát biểu này *không phải là mệnh đề*.
    - *d)* Phương trình $x^2 - 3x + 4 = 0$ có $Delta = (-3)^2 - 4 dot 1 dot 4 = -7 < 0$ nên vô nghiệm. Do đó câu khẳng định "Phương trình có nghiệm" là *mệnh đề* (mệnh đề sai).
    Vậy các phát biểu là mệnh đề gồm: *a), b), d)*.
  ])

  #bt-item(3, [Trong các phát biểu sau, phát biểu nào là mệnh đề toán học?
    + Tích hai số thực trái dấu là một số thực âm.
    + Mọi số tự nhiên đều là dương.
    + Có sự sống ngoài Trái Đất.
    + Ngày 1 tháng 5 là ngày Quốc tế Lao động.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Là khẳng định về tính chất dấu của phép nhân trong tập số thực: là *mệnh đề toán học* (mệnh đề đúng).
    - *b)* Là khẳng định về tập số tự nhiên $NN$: là *mệnh đề toán học* (mệnh đề sai, vì số $0 in NN$ nhưng không phải là số dương).
    - *c)* Là khẳng định thuộc lĩnh vực thiên văn học và sinh học vũ trụ: không phải mệnh đề toán học.
    - *d)* Là khẳng định thuộc lĩnh vực lịch sử - xã hội: không phải mệnh đề toán học.
    Vậy các mệnh đề toán học là *a)* và *b)*.
  ])

  #bt-item(4, [Cho mệnh đề chứa biến $P(x): "3x + 5 <= x^2"$ với $x$ là số thực. Mệnh đề nào đúng trong các mệnh đề sau: $P(3), P(1), P(4), P(5)$?], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Ta kiểm tra từng giá trị bằng cách thay vào bất đẳng thức:
    - Với $x = 3$: $P(3): 3(3) + 5 <= 3^2 <=> 14 <= 9$ (khẳng định sai).
    - Với $x = 1$: $P(1): 3(1) + 5 <= 1^2 <=> 8 <= 1$ (khẳng định sai).
    - Với $x = 4$: $P(4): 3(4) + 5 <= 4^2 <=> 17 <= 16$ (khẳng định sai).
    - Với $x = 5$: $P(5): 3(5) + 5 <= 5^2 <=> 20 <= 25$ (khẳng định đúng).
    Vậy mệnh đề đúng duy nhất là *$P(5)$*.
  ])

  #bt-item(5, [Cho các mệnh đề chứa biến:
    + $P(x): "2x = 1"$;
    + $R(x, y): "2x + y = 3"$ (mệnh đề này chứa hai biến $x$ và $y$);
    + $T(n): "2n + 1$ là số chẵn$"$ ($n$ là số tự nhiên).
    Với mỗi mệnh đề chứa biến trên, tìm những giá trị của biến để nhận được một mệnh đề đúng và một mệnh đề sai.
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Với mệnh đề $P(x): "2x = 1"$:
      - Chọn $x = 1/2$: Ta có $2(1/2) = 1$ (đúng) $=>$ $P(1/2)$ là mệnh đề đúng.
      - Chọn $x = 0$: Ta có $2(0) = 0 != 1$ (sai) $=>$ $P(0)$ là mệnh đề sai.
    - *b)* Với mệnh đề $R(x, y): "2x + y = 3"$:
      - Chọn $x = 1, y = 1$: Ta có $2(1) + 1 = 3$ (đúng) $=>$ $R(1, 1)$ là mệnh đề đúng.
      - Chọn $x = 0, y = 0$: Ta có $2(0) + 0 = 0 != 3$ (sai) $=>$ $R(0, 0)$ là mệnh đề sai.
    - *c)* Với mệnh đề $T(n): "2n + 1$ là số chẵn$"$ ($n in NN$):
      - Vì $2n$ luôn chia hết cho $2$ với mọi số tự nhiên $n$, nên $2n + 1$ luôn là số lẻ với mọi $n in NN$. Do đó *không tồn tại* giá trị $n in NN$ nào để nhận được một mệnh đề đúng.
      - Với bất kỳ $n in NN$ (ví dụ chọn $n = 1$), ta có $2(1) + 1 = 3$ là số lẻ $=>$ $T(1)$ là mệnh đề sai.
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 5, reset-counter: true)

#tn(
  dir: "ngang",
  [Câu nào sau đây không là mệnh đề?],
  (
    [Tam giác đều là tam giác có ba cạnh bằng nhau.],
    [$3 < 1$.],
    [$4 - 5 = 1$.],
    True([Bạn học giỏi quá!]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Phương án A, B, C là các khẳng định toán học xác định được tính đúng sai (A đúng, B sai, C sai vì $4 - 5 = -1 != 1$). Do đó chúng đều là mệnh đề.
    - Phương án D: "Bạn học giỏi quá!" là câu cảm thán bộc lộ cảm xúc, không có tính đúng sai khách quan nên không phải là mệnh đề.
    
    ✅ *Chọn đáp án D.*
  ]
)

#tn(
  dir: "ngang",
  [Câu nào trong các câu sau không phải là mệnh đề?],
  (
    True([$pi$ có phải là một số vô tỷ không?]),
    [$2 + 2 = 5$.],
    [$sqrt(2)$ là một số hữu tỷ.],
    [$4/2 = 2$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - "$pi$ có phải là một số vô tỷ không?" là câu hỏi nghi vấn, chưa khẳng định một sự việc nào nên không thể có giá trị chân lý (không đúng cũng không sai), vì thế không phải là mệnh đề.
    - Các phương án còn lại là các câu khẳng định toán học: B sai, C sai, D đúng nên đều là mệnh đề.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Trong các câu sau, câu nào là mệnh đề?],
  (
    True([$12$ là số tự nhiên lẻ.]),
    [An học lớp mấy?],
    [Các bạn có chăm học không?],
    [Các bạn hãy làm bài đi!],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - Câu "$12$ là số tự nhiên lẻ" là một câu khẳng định có tính đúng sai xác định (đây là một khẳng định sai vì $12$ chia hết cho $2$ nên là số chẵn), do đó đây là một mệnh đề.
    - Hai câu "An học lớp mấy?" và "Các bạn có chăm học không?" là câu hỏi.
    - Câu "Các bạn hãy làm bài đi!" là câu mệnh lệnh cầu khiến.
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Trong các câu sau, có bao nhiêu câu là mệnh đề?
  - a) Cố lên, sắp đói rồi!
  - b) Số $15$ là số nguyên tố.
  - c) Tổng các góc của một tam giác là $180^@$.
  - d) $x$ là số nguyên dương.],
  (
    [$3$.],
    True([$2$.]),
    [$4$.],
    [$1$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Phân tích từng câu:
    - *a)* "Cố lên, sắp đói rồi!" là câu cảm thán $=>$ Không phải mệnh đề.
    - *b)* "Số $15$ là số nguyên tố" là một câu khẳng định toán học xác định tính đúng sai (mệnh đề sai vì $15 = 3 dot 5$) $=>$ Là mệnh đề.
    - *c)* "Tổng các góc của một tam giác là $180^@$" là một khẳng định toán học xác định (định lý hình học, mệnh đề đúng) $=>$ Là mệnh đề.
    - *d)* "$x$ là số nguyên dương" là mệnh đề chứa biến, tính đúng sai phụ thuộc vào giá trị của $x$ $=>$ Chưa phải là mệnh đề.
    Vậy có đúng $2$ câu là mệnh đề (câu b và câu c).
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Câu nào sau đây không là mệnh đề?],
  (
    [Tam giác đều là tam giác có ba cạnh bằng nhau.],
    [$3 < 1$.],
    [$4 - 5 = 1$.],
    True([Bạn học giỏi quá!]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Câu "Bạn học giỏi quá!" là câu cảm thán biểu đạt cảm xúc khen ngợi, không có tính đúng hay sai, do đó không phải là mệnh đề. Các câu còn lại đều là các câu khẳng định toán học có tính chân lý rõ ràng.
    
    ✅ *Chọn đáp án D.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 5, reset-counter: true)

#ds(
  [Xét tính đúng, sai của mỗi mệnh đề sau:],
  (
    True([$15$ không là số nguyên tố.]),
    [Một tứ giác là hình thoi khi và chỉ khi nó có hai đường chéo vuông góc với nhau.],
    True([$5 + 19 = 24$.]),
    [$6 + 81 = 25$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, vì số $15$ ngoài $1$ và chính nó còn có các ước số dương khác là $3$ và $5$. Do đó $15$ là hợp số, khẳng định "$15$ không là số nguyên tố" là mệnh đề đúng.
    - b) *Sai*, vì tứ giác có hai đường chéo vuông góc chưa chắc là hình thoi (chẳng hạn tứ giác có đỉnh $(0, 1), (2, 0), (0, -3), (-1, 0)$ có hai đường chéo vuông góc nhưng không phải hình thoi). Điều kiện cần và đủ để một tứ giác là hình thoi là nó phải là *hình bình hành* có hai đường chéo vuông góc.
    - c) *Đúng*, vì ta có $5 + 19 = 24$ là phép cộng số học chính xác.
    - d) *Sai*, vì ta có $6 + 81 = 87 != 25$.
  ]
)

#ds(
  [Hãy xác định tính đúng sai của mỗi mệnh đề sau:],
  (
    [$A$: "Năm 2010 là năm nhuận".],
    True([$B$: "31 là số nguyên tố".]),
    [$P$: "Mùa xuân bắt đầu từ tháng 6 và kết thúc vào tháng 9".],
    True([$Q$: "Hình thoi là hình có bốn cạnh bằng nhau".]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Sai*, quy tắc năm nhuận dương lịch: Năm không tròn thế kỷ phải chia hết cho $4$. Vì $2010 = 4 dot 502 + 2$ không chia hết cho $4$ nên năm $2010$ không phải là năm nhuận.
    - b) *Đúng*, vì số $31$ lớn hơn $1$ và chỉ có đúng hai ước số nguyên dương là $1$ và $31$, do đó $31$ là số nguyên tố.
    - c) *Sai*, theo khí hậu và thiên văn học ở Bắc bán cầu (trong đó có Việt Nam), mùa xuân thường diễn ra từ tháng 1 đến tháng 3 (hoặc từ tháng 2 đến tháng 4); khoảng thời gian từ tháng 6 đến tháng 9 là mùa hè và đầu thu.
    - d) *Đúng*, theo định nghĩa hình học Euclid, hình thoi là tứ giác có bốn cạnh bằng nhau.
  ]
)

#ds(
  [Xét tính đúng, sai của mỗi mệnh đề sau:],
  (
    True([Hai góc đối đỉnh thì bằng nhau.]),
    True([Hai tam giác có hai cặp cạnh bằng nhau kèm giữa một cặp góc bằng nhau thì bằng nhau.]),
    [Hai tam giác có hai cặp góc bằng nhau thì bằng nhau.],
    True([Một số chia hết cho 3 khi và chỉ khi tổng các chữ số chia hết cho 3.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, theo định lý cơ bản của hình học phẳng: Hai góc đối đỉnh luôn có số đo bằng nhau.
    - b) *Đúng*, đây là trường hợp bằng nhau thứ hai của hai tam giác: Cạnh - Góc - Cạnh (c-g-c).
    - c) *Sai*, hai tam giác có hai cặp góc bằng nhau thì chỉ *đồng dạng* với nhau (trường hợp g-g), tỉ số đồng dạng có thể khác $1$ nên các cạnh chưa chắc bằng nhau.
    - d) *Đúng*, theo dấu hiệu chia hết trong số học: Một số tự nhiên chia hết cho $3$ khi và chỉ khi tổng các chữ số của số đó chia hết cho $3$.
  ]
)

#ds(
  [Cho mệnh đề $P(x): "x^2 - x - 2 = 0"$ với $x$ là các số thực. Với mỗi giá trị thực của $x$ sau đây, ta nhận được mệnh đề đúng hay sai?],
  (
    [$x = 0$.],
    True([$x = -1$.]),
    [$x = 1$.],
    True([$x = 2$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Giải phương trình bậc hai: $x^2 - x - 2 = 0 <=> (x + 1)(x - 2) = 0 <=> x = -1$ hoặc $x = 2$.
    - a) *Sai*, thay $x = 0$ vào ta được: $0^2 - 0 - 2 = -2 != 0$, do đó $P(0)$ là mệnh đề sai.
    - b) *Đúng*, thay $x = -1$ vào ta được: $(-1)^2 - (-1) - 2 = 1 + 1 - 2 = 0$, do đó $P(-1)$ là mệnh đề đúng.
    - c) *Sai*, thay $x = 1$ vào ta được: $1^2 - 1 - 2 = -2 != 0$, do đó $P(1)$ là mệnh đề sai.
    - d) *Đúng*, thay $x = 2$ vào ta được: $2^2 - 2 - 2 = 4 - 4 = 0$, do đó $P(2)$ là mệnh đề đúng.
  ]
)

#ds(
  [Xét tính đúng, sai của các mệnh đề sau:],
  (
    True([$x^2 - x + 1 > 0$ với mọi $x in RR$.]),
    True([24 chia hết cho 2 và cho 12.]),
    [$x^2 + 1 < 0$ với mọi $x in RR$.],
    True([$sqrt(5)$ là số vô tỉ.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - a) *Đúng*, biến đổi hằng đẳng thức:
      $ x^2 - x + 1 = (x^2 - 2 dot x dot 1/2 + 1/4) + 3/4 = (x - 1/2)^2 + 3/4 $
      Vì $(x - 1/2)^2 >= 0$ với mọi $x in RR$ nên $(x - 1/2)^2 + 3/4 >= 3/4 > 0, forall x in RR$.
    - b) *Đúng*, ta có $24 = 2 dot 12$, do đó $24$ đồng thời chia hết cho cả $2$ và $12$.
    - c) *Sai*, với mọi $x in RR$ ta luôn có $x^2 >= 0 => x^2 + 1 >= 1 > 0$. Bất đẳng thức $x^2 + 1 < 0$ là vô nghiệm trên $RR$.
    - d) *Đúng*, vì $5$ là số nguyên tố (không phải số chính phương) nên $sqrt(5)$ là số thập phân vô hạn không tuần hoàn, tức là số vô tỉ.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 3, reset-counter: true)

#tln(
  dir: "ngang",
  [Cho các phát biểu sau đây:
  - a) "17 là số nguyên tố".
  - b) "Tam giác vuông có một đường trung tuyến bằng nửa cạnh huyền".
  - c) "Các em C14 hãy cố gắng học tập thật tốt nhé!".
  - d) "Mọi hình chữ nhật đều nội tiếp được đường tròn".
  Hỏi có bao nhiêu phát biểu là mệnh đề?],
  [3],
  loigiai: [
    📌 *Phương pháp:* Kiểm tra từng phát biểu xem có phải là mệnh đề không.

    ✍️ *Lời giải chi tiết:* \
    Xét từng phát biểu:
    - *a)* "17 là số nguyên tố": Là một khẳng định toán học có tính đúng đắn xác định (mệnh đề đúng) $=>$ Là mệnh đề.
    - *b)* "Tam giác vuông có một đường trung tuyến bằng nửa cạnh huyền": Là định lý hình học (đường trung tuyến ứng với cạnh huyền bằng nửa cạnh huyền) $=>$ Là mệnh đề.
    - *c)* "Các em C14 hãy cố gắng học tập thật tốt nhé!": Là câu cảm thán, lời động viên, khuyên nhủ nên không có tính đúng sai $=>$ Không phải là mệnh đề.
    - *d)* "Mọi hình chữ nhật đều nội tiếp được đường tròn": Là khẳng định hình học đúng (tổng hai góc đối diện bằng $90^@ + 90^@ = 180^@$) $=>$ Là mệnh đề.
    Như vậy có $3$ phát biểu là mệnh đề (gồm a, b, d).
    
    ✅ *Đáp số:* $3$.
  ]
)

#tln(
  dir: "ngang",
  [Cho các câu sau đây:
  - a) "Phan-xi-păng là ngọn núi cao nhất Việt Nam".
  - b) "$pi^2 < 9,86$".
  - c) "Học Toán thật vui!".
  - d) "Cậu cho tớ hỏi kết quả câu 2 ra bao nhiêu vậy?".
  Hỏi có bao nhiêu câu là mệnh đề?],
  [2],
  loigiai: [
    📌 *Phương pháp:* Kiểm tra từng câu xem có phải là mệnh đề không.

    ✍️ *Lời giải chi tiết:* \
    Xét từng câu:
    - *a)* Khẳng định sự thật địa lý xác định (đỉnh Fansipan cao $3.143 "m"$, là nóc nhà Đông Dương) $=>$ Là mệnh đề (mệnh đề đúng).
    - *b)* Khẳng định toán học: Ta có $pi approx 3,14159265... => pi^2 approx 9,8696 > 9,86$. Mặc dù khẳng định "$pi^2 < 9,86$" là sai, nhưng nó có giá trị chân lý xác định $=>$ Là mệnh đề (mệnh đề sai).
    - *c)* "Học Toán thật vui!": Câu cảm thán biểu lộ cảm xúc cá nhân $=>$ Không phải là mệnh đề.
    - *d)* "Cậu cho tớ hỏi kết quả câu 2 ra bao nhiêu vậy?": Câu hỏi nghi vấn $=>$ Không phải là mệnh đề.
    Vậy có đúng $2$ câu là mệnh đề (câu a và câu b).
    
    ✅ *Đáp số:* $2$.
  ]
)

#tln(
  dir: "ngang",
  [Trong các câu sau, có bao nhiêu câu không phải là mệnh đề?
  - a) Huế là một thành phố của Việt Nam.
  - b) Sông Hương chảy ngang qua thành phố Huế.
  - c) Hãy trả lời câu hỏi này!
  - d) $5 + 19 = 24$.
  + e) $6 + 81 = 25$.
  + f) Bạn có rỗi tối nay không?
  + g) $x + 2 = 11$.],
  [3],
  loigiai: [
    📌 *Phương pháp:* Phân loại các câu thành mệnh đề và không phải mệnh đề.

    ✍️ *Lời giải chi tiết:* \
    Phân loại từng câu:
    - *Các câu là mệnh đề:*
      - *a)* "Huế là một thành phố của Việt Nam" (Mệnh đề đúng).
      - *b)* "Sông Hương chảy ngang qua thành phố Huế" (Mệnh đề đúng).
      - *d)* "$5 + 19 = 24$" (Mệnh đề đúng).
      - *e)* "$6 + 81 = 25$" (Mệnh đề sai).
    - *Các câu không phải là mệnh đề:*
      - *c)* "Hãy trả lời câu hỏi này!" là câu mệnh lệnh cầu khiến.
      - *f)* "Bạn có rỗi tối nay không?" là câu hỏi nghi vấn.
      - *g)* "$x + 2 = 11$" là mệnh đề chứa biến (chưa biết giá trị của biến $x$).
    Vậy có đúng $3$ câu không phải là mệnh đề (gồm c, f, g).
    
    ✅ *Đáp số:* $3$.
  ]
)
