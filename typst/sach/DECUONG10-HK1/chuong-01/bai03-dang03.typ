#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display

#dang("Dùng biểu đồ Ven và công thức tính số phần tử của tập hợp", mau: C1)

#phuong-phap(mau: C1)[
  - Sử dụng biểu đồ Ven để mô tả trực quan các đại lượng và mối quan hệ giữa các tập hợp.
  - *Công thức cộng số phần tử của 2 tập hợp*:
    $ n(A union B) = n(A) + n(B) - n(A sect B) $
  - *Công thức cộng số phần tử của 3 tập hợp*:
    $ n(A union B union C) = n(A) + n(B) + n(C) - [n(A sect B) + n(B sect C) + n(C sect A)] + n(A sect B sect C) $
]

#bai-tap-tu-luan(mau: C1)[
  #bt-item(1, [Giải Bóng đá vô địch thế giới World Cup 2018 tổ chức ở Nga gồm 32 đội. Sau vòng bảng chọn ra 16 đội đấu loại trực tiếp. Sau vòng loại trực tiếp chọn ra 8 đội vào tứ kết. Gọi $A$ là tập 32 đội, $B$ là tập 16 đội sau vòng bảng, $C$ là tập 8 đội vào tứ kết.
    + Sắp xếp các tập hợp $A, B, C$ theo quan hệ "$subset$".
    + So sánh hai tập hợp $A sect C$ và $B sect C$.
    + Tập hợp $A \\ B$ gồm những đội bóng bị loại sau vòng đấu nào?
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    - *a)* Các đội vào tứ kết ($C$) đều nằm trong số 16 đội vượt qua vòng bảng ($B$), và 16 đội này đều nằm trong tổng số 32 đội tham dự giải ($A$).
      Do đó ta có quan hệ bao hàm: $C subset B subset A$.
    - *b)* Vì $C subset A$ nên $A sect C = C$.
      Vì $C subset B$ nên $B sect C = C$.
      Từ đó suy ra $A sect C = B sect C = C$.
    - *c)* Tập hợp $A \\ B$ gồm các đội tham dự giải nhưng không lọt vào vòng loại trực tiếp 16 đội, tức là $32 - 16 = 16$ đội bóng bị loại sau vòng đấu bảng.
  ])

  #bt-item(2, [Để phục vụ cho một hội nghị quốc tế, ban tổ chức huy động 35 người phiên dịch tiếng Anh, 30 người phiên dịch tiếng Pháp, trong đó có 16 người phiên dịch được cả hai thứ tiếng Anh và Pháp. Hãy trả lời các câu hỏi sau:
    + Ban tổ chức đã huy động bao nhiêu người phiên dịch cho hội nghị đó?
    + Có bao nhiêu người chỉ phiên dịch được tiếng Anh?
    + Có bao nhiêu người chỉ phiên dịch được tiếng Pháp?
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $A$ là tập hợp người phiên dịch tiếng Anh, $B$ là tập hợp người phiên dịch tiếng Pháp.
    Theo giả thiết: $n(A) = 35$, $n(B) = 30$, $n(A sect B) = 16$.
    - *a)* Tổng số người phiên dịch được huy động là số phần tử của $A union B$:
      $ n(A union B) = n(A) + n(B) - n(A sect B) = 35 + 30 - 16 = 49 text(" người"). $
    - *b)* Số người chỉ phiên dịch được tiếng Anh là:
      $ n(A \\ B) = n(A) - n(A sect B) = 35 - 16 = 19 text(" người"). $
    - *c)* Số người chỉ phiên dịch được tiếng Pháp là:
      $ n(B \\ A) = n(B) - n(A sect B) = 30 - 16 = 14 text(" người"). $
  ])

  #bt-item(3, [Một cuộc khảo sát về khách du lịch thăm vịnh Hạ Long cho thấy trong 1410 khách du lịch được phỏng vấn có 789 khách đến thăm động Thiên Cung, 690 khách đến đảo Titop. Toàn bộ khách được phỏng vấn đã đến ít nhất một trong hai địa điểm trên. Hỏi có bao nhiêu khách du lịch vừa đến thăm động Thiên Cung vừa đến thăm đảo Titop?  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $A$ là tập hợp khách thăm động Thiên Cung, $B$ là tập hợp khách thăm đảo Titop.
    Theo đề: $n(A) = 789$, $n(B) = 690$, và vì toàn bộ khách đều đến ít nhất một trong hai địa điểm nên $n(A union B) = 1410$.
    Áp dụng công thức số phần tử:
    $ n(A union B) = n(A) + n(B) - n(A sect B) $
    $ <=> n(A sect B) = n(A) + n(B) - n(A union B) = 789 + 690 - 1410 = 69 text(" khách"). $
    Vậy có đúng $69$ khách vừa đến thăm động Thiên Cung vừa đến thăm đảo Titop.
  ])

  #bt-item(4, [Trong một cuộc khảo sát 100 người uống cà phê, có 55 người thêm đường, 65 người thêm sữa và 30 người thêm cả đường và sữa. Trong số 100 người đó:
    + Có bao nhiêu người thêm ít nhất đường hoặc sữa?
    + Có bao nhiêu người không thêm đường hoặc sữa?
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $D$ là tập hợp người thêm đường, $S$ là tập hợp người thêm sữa.
    Ta có $n(D) = 55$, $n(S) = 65$, $n(D sect S) = 30$.
    - *a)* Số người thêm ít nhất một trong hai thứ (đường hoặc sữa) là:
      $ n(D union S) = n(D) + n(S) - n(D sect S) = 55 + 65 - 30 = 90 text(" người"). $
    - *b)* Số người không thêm đường cũng không thêm sữa (uống cà phê đen nguyên chất) là:
      $ 100 - n(D union S) = 100 - 90 = 10 text(" người"). $
  ])

  #bt-item(5, [Trong số 35 học sinh của lớp 10H có 20 học sinh thích môn Toán; 16 học sinh thích môn Tiếng Anh và 12 học sinh thích cả hai môn này. Hỏi lớp 10H:
    + Có bao nhiêu học sinh thích ít nhất một trong hai môn Toán và Tiếng Anh?
    + Có bao nhiêu học sinh không thích cả hai môn này?
  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $T$ là tập học sinh thích Toán, $A$ là tập học sinh thích Tiếng Anh.
    Ta có $n(T) = 20$, $n(A) = 16$, $n(T sect A) = 12$.
    - *a)* Số học sinh thích ít nhất một trong hai môn:
      $ n(T union A) = n(T) + n(A) - n(T sect A) = 20 + 16 - 12 = 24 text(" học sinh"). $
    - *b)* Số học sinh không thích cả hai môn:
      $ 35 - n(T union A) = 35 - 24 = 11 text(" học sinh"). $
  ])

  #bt-item(6, [Lớp 10C có 45 học sinh, trong đó có 18 học sinh tham gia cuộc thi vẽ đồ họa trên máy tính, 24 học sinh tham gia cuộc thi tin học văn phòng cấp trường và 9 học sinh không tham gia cả hai cuộc thi này. Hỏi có bao nhiêu học sinh của lớp 10C tham gia đồng thời hai cuộc thi?  ], loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $A$ là tập học sinh tham gia thi đồ họa, $B$ là tập học sinh tham gia thi tin học văn phòng.
    - Số học sinh tham gia ít nhất một cuộc thi:
      $ n(A union B) = 45 - 9 = 36 text(" học sinh"). $
    - Số học sinh tham gia đồng thời cả hai cuộc thi là số phần tử của $A sect B$:
      $ n(A sect B) = n(A) + n(B) - n(A union B) = 18 + 24 - 36 = 6 text(" học sinh"). $
  ])
]

#bai-tap-trac-nghiem(mau: C1)

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (Mỗi câu hỏi chỉ chọn một phương án)], count: 10, reset-counter: true)

#tn(
  dir: "ngang",
  [Lớp 10A có 40 học sinh trong đó có 10 bạn học sinh giỏi Toán, 15 bạn học sinh giỏi Lý, và 22 bạn không giỏi môn học nào trong hai môn Toán, Lý. Hỏi lớp 10A có bao nhiêu bạn học sinh vừa giỏi Toán vừa giỏi Lý?],
  (
    True([$7$.]),
    [$25$.],
    [$10$.],
    [$18$.],
  ),
  loigiai: [Số học sinh giỏi ít nhất một môn Toán hoặc Lý là $40 - 22 = 18$. Số bạn vừa giỏi Toán vừa giỏi Lý là: $10 + 15 - 18 = 7$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Một lớp có 45 học sinh. Mỗi em đều đăng ký chơi ít nhất một trong hai môn: bóng đá và bóng chuyền. Có 35 em đăng ký môn bóng đá, 15 em đăng ký môn bóng chuyền. Hỏi có bao nhiêu em đăng ký chơi cả 2 môn?],
  (
    True([$5$.]),
    [$10$.],
    [$30$.],
    [$25$.],
  ),
  loigiai: [Vì học sinh nào cũng chơi ít nhất một môn nên số em chơi cả hai môn là: $35 + 15 - 45 = 5$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Mỗi học sinh lớp 10B đều chơi bóng đá hoặc bóng chuyền. Biết rằng có 25 bạn chơi bóng đá, 20 bạn chơi bóng chuyền và 10 bạn chơi cả hai môn. Hỏi lớp 10B có bao nhiêu học sinh?],
  (
    True([$35$.]),
    [$30$.],
    [$25$.],
    [$20$.],
  ),
  loigiai: [Sĩ số lớp 10B là số phần tử của hợp hai tập hợp: $25 + 20 - 10 = 35$. Chọn đáp án A.]
)

#tn(
  dir: "ngang",
  [Lớp 10B1 có 7 học sinh giỏi Toán; 5 học sinh giỏi Lý; 6 học sinh giỏi Hóa; 3 học sinh giỏi cả Toán và Lý; 4 học sinh giỏi cả Toán và Hóa; 2 học sinh giỏi cả Lý và Hóa; 1 học sinh giỏi cả 3 môn Toán, Lý, Hóa. Số học sinh giỏi ít nhất một môn (Toán, Lý, Hóa) của lớp 10B1 là:],
  (
    [$9$.],
    True([$10$.]),
    [$18$.],
    [$28$.],
  ),
  loigiai: [
    Áp dụng công thức cộng số phần tử của 3 tập hợp:
    $ n(T union L union H) = 7 + 5 + 6 - (3 + 4 + 2) + 1 = 18 - 9 + 1 = 10 text(" học sinh"). $
    Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Trong một khoảng thời gian nhất định, Đài khí tượng thống kê được: số ngày mưa là 10 ngày; số ngày có gió là 8 ngày; số ngày lạnh là 6 ngày; số ngày mưa và gió là 5 ngày; số ngày mưa và lạnh là 4 ngày; số ngày lạnh và có gió là 3 ngày; số ngày mưa, lạnh và có gió là 1 ngày. Vậy có bao nhiêu ngày thời tiết xấu (có gió, mưa hay lạnh)?],
  (
    [$14$.],
    True([$13$.]),
    [$15$.],
    [$16$.],
  ),
  loigiai: [
    Số ngày thời tiết xấu là số phần tử của hợp 3 tập hợp:
    $ 10 + 8 + 6 - (5 + 4 + 3) + 1 = 24 - 12 + 1 = 13 text(" ngày"). $
    Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Một nhóm học sinh giỏi các môn: Anh, Toán, Văn. Có 18 em giỏi Văn, 10 em giỏi Anh, 12 em giỏi Toán, 3 em giỏi Văn và Toán, 4 em giỏi Toán và Anh, 5 em giỏi Văn và Anh, 2 em giỏi cả ba môn. Hỏi nhóm đó có bao nhiêu em học sinh?],
  (
    [$25$.],
    True([$30$.]),
    [$20$.],
    [Đáp án khác.],
  ),
  loigiai: [
    Tổng số học sinh là:
    $ 18 + 10 + 12 - (3 + 4 + 5) + 2 = 40 - 12 + 2 = 30 text(" em"). $
    Chọn đáp án B.
  ]
)

#tn(
  dir: "ngang",
  [Trong kì thi học sinh giỏi cấp trường lớp 11B1 có 15 học sinh giỏi Văn, 22 học sinh giỏi Toán. Tìm số học sinh giỏi cả Văn và Toán biết lớp 11B1 có 40 học sinh, và có 14 học sinh không đạt học sinh giỏi.],
  (
    [$4$.],
    [$7$.],
    True([$11$.]),
    [$20$.],
  ),
  loigiai: [
    Số học sinh giỏi ít nhất một môn (Văn hoặc Toán) là: $40 - 14 = 26$ học sinh.
    Số học sinh giỏi cả hai môn là:
    $ n(V sect T) = n(V) + n(T) - n(V union T) = 15 + 22 - 26 = 11 text(" học sinh"). $
    Chọn đáp án C.
  ]
)

#tn(
  dir: "ngang",
  [Lớp 10A có 15 bạn được xếp loại học lực Giỏi, 20 bạn được xếp loại hạnh kiểm Tốt, trong đó có 10 bạn vừa học lực Giỏi vừa hạnh kiểm Tốt. Khi đó lớp 10A có bao nhiêu bạn được xếp loại học lực Giỏi hoặc hạnh kiểm Tốt?],
  (
    True([$25$.]),
    [$20$.],
    [$35$.],
    [$40$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Số bạn đạt học lực Giỏi hoặc hạnh kiểm Tốt là: $15 + 20 - 10 = 25$ bạn. 
    
    ✅ *Chọn đáp án A.*
  ]
)

#tn(
  dir: "ngang",
  [Trong số 45 học sinh của lớp 10A có 15 bạn xếp loại học lực Giỏi, 20 bạn xếp loại hạnh kiểm Tốt, trong đó có 10 bạn vừa học lực Giỏi vừa hạnh kiểm Tốt. Khi đó lớp 10A có bao nhiêu bạn chưa được xếp loại học lực Giỏi và chưa có hạnh kiểm Tốt?],
  (
    [$25$.],
    True([$20$.]),
    [$35$.],
    [$40$.],
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Số học sinh đạt ít nhất một tiêu chí là $15 + 20 - 10 = 25$.
    Số bạn chưa đạt tiêu chí nào là: $45 - 25 = 20$ bạn.
    
    ✅ *Chọn đáp án B.*
  ]
)

#tn(
  dir: "ngang",
  [Một lớp có 30 học sinh, trong đó mỗi học sinh giỏi ít nhất một trong hai môn Văn hoặc Hóa, biết rằng có 15 bạn học giỏi môn Hóa, 20 bạn học giỏi môn Văn. Hỏi lớp đó có bao nhiêu học sinh giỏi cả hai môn?],
  (
    [$25$.],
    [$20$.],
    [$10$.],
    True([$5$.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Số học sinh giỏi cả hai môn là: $15 + 20 - 30 = 5$ bạn. 
    
    ✅ *Chọn đáp án D.*
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (Trong mỗi ý a, b, c, d ở mỗi câu, thí sinh chọn đúng hoặc sai)], count: 4, reset-counter: true)

#ds(
  [Một lớp có 40 học sinh, biết rằng ai cũng đăng kí thi ít nhất một trong hai môn là cờ vua và cờ tướng. Có 17 em đăng kí môn cờ vua, 28 em đăng kí môn cờ tướng. Xét tính đúng sai của các khẳng định sau:],
  (
    [Có 28 học sinh chỉ đăng kí môn cờ tướng.],
    True([Số học sinh đăng kí môn cờ vua là 17 học sinh.]),
    True([Số học sinh đăng kí môn cờ tướng là 28 học sinh.]),
    True([Có tất cả 5 học sinh đăng kí cả hai môn cờ.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $V$ là tập học sinh đăng kí cờ vua, $T$ là tập học sinh đăng kí cờ tướng.
    - a) *Sai*, số học sinh chỉ đăng kí cờ tướng là: $28 - 5 = 23$ em.
    - b) *Đúng* trực tiếp từ dữ kiện đề bài.
    - c) *Đúng* trực tiếp từ dữ kiện đề bài.
    - d) *Đúng*, số học sinh đăng kí cả hai môn là: $n(V sect T) = 17 + 28 - 40 = 5$ em.
  ]
)

#ds(
  [Lớp 10A có 35 học sinh thi học sinh giỏi. Mỗi học sinh thi ít nhất một môn trong ba môn Toán, Lý và Hóa. Biết có 12 học sinh chỉ thi môn Toán, có 14 học sinh thi môn Lý, có 15 học sinh thi môn Hóa và có 3 thí sinh chỉ thi môn Lý và môn Hóa. Xét tính đúng sai của các khẳng định sau:],
  (
    [Có 9 học sinh chỉ thi môn Lý mà không thi môn Hóa.],
    [Có 23 học sinh chỉ thi môn Hóa mà không thi môn Lý.],
    [Số học sinh chỉ thi môn Lý hoặc thi môn Hóa là 8 học sinh.],
    True([Có 3 học sinh đi thi cả ba môn Toán, Lý và Hóa.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Gọi $T, L, H$ lần lượt là tập hợp học sinh thi môn Toán, Lý, Hóa.
    Theo giả thiết:
    - Mỗi học sinh thi ít nhất một môn nên $n(T union L union H) = 35$.
    - Có 12 học sinh chỉ thi Toán nên số học sinh thi Lý hoặc Hóa là:
      $ n(L union H) = 35 - 12 = 23 text(" học sinh"). $
    - Theo công thức hợp hai tập hợp:
      $ n(L union H) = n(L) + n(H) - n(L sect H) $
      $ <=> 23 = 14 + 15 - n(L sect H) <=> n(L sect H) = 29 - 23 = 6 text(" học sinh"). $
    Vậy có 6 học sinh thi cả hai môn Lý và Hóa.
    Trong đó có 3 học sinh chỉ thi Lý và Hóa (không thi Toán), suy ra số học sinh thi cả ba môn là:
      $ n(T sect L sect H) = 6 - 3 = 3 text(" học sinh"). $
    Xét từng khẳng định:
    - a) *Sai*, số học sinh thi môn Lý mà không thi môn Hóa là $n(L) - n(L sect H) = 14 - 6 = 8$ học sinh (không phải 9).
    - b) *Sai*, số học sinh thi môn Hóa mà không thi môn Lý là $n(H) - n(L sect H) = 15 - 6 = 9$ học sinh (không phải 23).
    - c) *Sai*, số học sinh thi Lý hoặc Hóa nhưng không thi cả hai môn là $8 + 9 = 17$ học sinh.
    - d) *Đúng*, có đúng 3 học sinh thi cả ba môn Toán, Lý và Hóa.
  ]
)

#ds(
  [Các em học sinh lớp 10A làm bài thi khảo sát học sinh giỏi môn Toán gồm 3 câu. Tổng kết có 6 học sinh làm được câu 1, 5 học sinh làm được câu 2, 4 học sinh làm được câu 3. Có 2 học sinh làm được câu 1 và 2; 2 học sinh làm được câu 1 và 3; 1 học sinh làm được câu 2 và 3; 1 học sinh làm được cả 3 câu. Xét tính đúng sai của các khẳng định sau:],
  (
    [Có duy nhất một học sinh chỉ làm được câu 1.],
    True([Không có học sinh nào chỉ làm được câu 2 và câu 3.]),
    True([Có 2 học sinh chỉ làm được câu 3.]),
    True([Có tất cả 8 học sinh chỉ làm được đúng một câu.]),
  ),
  loigiai: [
    ✍️ *Lời giải chi tiết:* \
    Sử dụng biểu đồ Ven phân loại từng vùng:
    - Số em làm được cả 3 câu: $1$ em.
    - Số em chỉ làm được câu 1 và câu 2: $2 - 1 = 1$ em.
    - Số em chỉ làm được câu 1 và câu 3: $2 - 1 = 1$ em.
    - Số em chỉ làm được câu 2 và câu 3: $1 - 1 = 0$ em.
    - Số em chỉ làm được duy nhất câu 1: $6 - (1 + 1 + 1) = 3$ em.
    - Số em chỉ làm được duy nhất câu 2: $5 - (1 + 0 + 1) = 3$ em.
    - Số em chỉ làm được duy nhất câu 3: $4 - (1 + 0 + 1) = 2$ em.
    - Tổng số học sinh chỉ làm được đúng một câu là: $3 + 3 + 2 = 8$ em.
    - a) *Sai*, có $3$ học sinh chỉ làm được câu 1.
    - b) *Đúng*, không có học sinh nào chỉ làm được câu 2 và câu 3.
    - c) *Đúng*, có 2 học sinh chỉ làm được câu 3.
    - d) *Đúng*, có tất cả 8 học sinh chỉ làm được đúng một câu.
  ]
)

#ds(
  [Trong đợt quyên góp ủng hộ đồng bào bị lũ lụt năm 2020, có 25 học sinh lớp 12A đã tham gia ủng hộ, mỗi học sinh ủng hộ nhiều nhất 2 tờ tiền khác nhau trong ba loại tờ tiền mệnh giá 5.000 đồng, 10.000 đồng và 20.000 đồng. Biết rằng:
  - Số học sinh chỉ ủng hộ một tờ 5.000 đồng bằng tổng số học sinh chỉ ủng hộ một tờ 10.000 đồng và số học sinh chỉ ủng hộ một tờ 20.000 đồng.
  - Trong số học sinh không ủng hộ tờ 5.000 đồng thì số học sinh có ủng hộ tờ 10.000 đồng nhiều gấp hai lần số học sinh có ủng hộ tờ 20.000 đồng.
  - Số học sinh chỉ ủng hộ một tờ 5.000 đồng nhiều hơn số học sinh ủng hộ tờ 5.000 đồng và một tờ khác là 1 học sinh.
  Xét tính đúng sai của các khẳng định sau:],
  (
    True([Có 2 học sinh ủng hộ một tờ 10.000 đồng và một tờ 20.000 đồng.]),
    True([Có 8 học sinh chỉ ủng hộ một tờ 5.000 đồng.]),
    [Nếu gọi số học sinh ủng hộ một tờ 5.000 đồng và một tờ 10.000 đồng là $a$ và số học sinh ủng hộ một tờ 20.000 đồng và một tờ 5.000 đồng là $c$ thì $a + c = 9$.],
    True([Có 6 học sinh lớp 12A chỉ ủng hộ một tờ 10.000 đồng.]),
  ),
  loigiai: [
    Vì mỗi học sinh ủng hộ nhiều nhất 2 tờ tiền khác nhau nên không có ai ủng hộ cả 3 tờ.
    Gọi số học sinh ở từng nhóm như sau:
    - $x$: chỉ ủng hộ tờ 5.000đ; $y$: chỉ ủng hộ tờ 10.000đ; $z$: chỉ ủng hộ tờ 20.000đ.
    - $a$: ủng hộ tờ 5.000đ và 10.000đ; $b$: ủng hộ tờ 10.000đ và 20.000đ; $c$: ủng hộ tờ 5.000đ và 20.000đ.
    Tổng số học sinh:
    $ (1) quad x + y + z + a + b + c = 25. $
    Theo giả thiết:
    - Kết quả 1: $x = y + z$.
    - Kết quả 2: Trong các bạn không ủng hộ tờ 5.000đ (gồm $y, z, b$), số bạn có tờ 10.000đ là $y + b$, số bạn có tờ 20.000đ là $z + b$.
      Do đó: $y + b = 2(z + b) <=> y - 2z - b = 0 <=> b = y - 2z$.
    - Kết quả 3: $x - (a + c) = 1 <=> a + c = x - 1$.
    Thay $y + z = x$ và $a + c = x - 1$ vào phương trình (1):
    $ x + x + (x - 1) + b = 25 <=> 3x + b = 26. $
    Mặt khác, $b = y - 2z = (x - z) - 2z = x - 3z$.
    Từ $3x + b = 26$ và $b = x - 3z$ suy ra:
    $ 3x + (x - 3z) = 26 <=> 4x - 3z = 26 <=> 3z = 4x - 26. $
    Vì $z >= 0$ và $b >= 0$ nên:
    - $b = 26 - 3x >= 0 => x <= 8$.
    - $3z = 4x - 26 >= 0 => x >= 7$.
    Với $x = 7 => 3z = 2$ (loại vì $z$ nguyên).
    Với $x = 8 => 3z = 6 => z = 2$.
    Khi đó:
    $ b = 26 - 3(8) = 2, quad y = x - z = 8 - 2 = 6, quad a + c = 8 - 1 = 7. $
    Xét tính đúng sai:
    - a) *Đúng*, có $b = 2$ học sinh ủng hộ một tờ 10.000đ và một tờ 20.000đ.
    - b) *Đúng*, có $x = 8$ học sinh chỉ ủng hộ một tờ 5.000đ.
    - c) *Sai*, $a + c = 7 != 9$.
    - d) *Đúng*, có $y = 6$ học sinh chỉ ủng hộ một tờ 10.000đ.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6, reset-counter: true)

#tln(
  dir: "ngang",
  [Có 7 vận động viên TDTT đều được đăng kí ít nhất một môn bóng bàn, cầu lông. Kết quả có 4 vận động viên đăng kí bóng bàn, 5 vận động viên đăng kí cầu lông. Hỏi có bao nhiêu vận động viên chỉ đăng kí môn cầu lông?],
  [3],
  loigiai: [
    📌 *Phương pháp:* Sử dụng biểu đồ Ven hoặc công thức hợp hai tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Số vận động viên đăng kí cả hai môn là: $4 + 5 - 7 = 2$ người.
    Số vận động viên chỉ đăng kí môn cầu lông là: $5 - 2 = 3$ người.
    
    ✅ *Đáp số:* $3$.
  ]
)

#tln(
  dir: "ngang",
  [Thống kê số ngày có mưa, có sương mù trong tháng 3 (31 ngày): 14 ngày mưa, 15 ngày có sương mù, trong đó 10 ngày có cả mưa và sương mù. Hỏi trong tháng 3 có bao nhiêu ngày không có mưa và không có sương mù?],
  [12],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức hợp và phần bù.

    ✍️ *Lời giải chi tiết:* \
    Số ngày có mưa hoặc có sương mù là: $14 + 15 - 10 = 19$ ngày.
    Số ngày không có mưa và không có sương mù trong tháng 3 là: $31 - 19 = 12$ ngày.
    
    ✅ *Đáp số:* $12$.
  ]
)

#tln(
  dir: "ngang",
  [Lớp 10A có 45 học sinh trong đó có 25 em học giỏi môn Toán, 23 em học giỏi môn Lý, 20 em học giỏi môn Hóa, 11 em giỏi cả Toán và Lý, 8 em giỏi cả Lý và Hóa, 9 em giỏi cả Toán và Hóa. Biết mỗi học sinh trong lớp giỏi ít nhất một môn. Hỏi lớp 10A có bao nhiêu bạn học giỏi cả ba môn?],
  [5],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức cộng số phần tử 3 tập hợp.

    ✍️ *Lời giải chi tiết:* \
    Áp dụng công thức cộng số phần tử 3 tập hợp:
    $ n(T union L union H) = n(T) + n(L) + n(H) - [n(T sect L) + n(L sect H) + n(T sect H)] + n(T sect L sect H) $
    $ <=> 45 = 25 + 23 + 20 - (11 + 8 + 9) + x <=> 45 = 68 - 28 + x <=> 45 = 40 + x <=> x = 5. $
    Vậy có đúng $5$ bạn học giỏi cả ba môn.
    
    ✅ *Đáp số:* $5$.
  ]
)

#tln(
  dir: "ngang",
  [Một lớp học có 25 học sinh chơi bóng đá, 23 học sinh chơi bóng bàn, 14 học sinh chơi cả bóng đá và bóng bàn, 6 học sinh không chơi môn nào. Tìm số học sinh chỉ chơi một môn thể thao?],
  [20],
  loigiai: [
    📌 *Phương pháp:* Sử dụng biểu đồ Ven hoặc công thức số phần tử.

    ✍️ *Lời giải chi tiết:* \
    - Số học sinh chỉ chơi bóng đá: $25 - 14 = 11$ học sinh.
    - Số học sinh chỉ chơi bóng bàn: $23 - 14 = 9$ học sinh.
    - Số học sinh chỉ chơi đúng một môn thể thao là: $11 + 9 = 20$ học sinh.
    
    ✅ *Đáp số:* $20$.
  ]
)

#tln(
  dir: "ngang",
  [Lớp 10C1 có 45 học sinh chuẩn bị văn nghệ: 35 học sinh tham gia nhảy Flashmob, 10 học sinh tham gia cả hai tiết mục. Có 4 bạn khuyết tật hòa nhập không tham gia tiết mục nào. Hỏi có bao nhiêu học sinh trong lớp tham gia tiết mục hát?],
  [16],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức số phần tử hợp hai tập hợp.

    ✍️ *Lời giải chi tiết:* \
    - Số học sinh tham gia ít nhất một tiết mục: $45 - 4 = 41$ học sinh.
    - Áp dụng công thức số phần tử:
      $ n(F union H) = n(F) + n(H) - n(F sect H) $
      $ <=> 41 = 35 + n(H) - 10 <=> 41 = 25 + n(H) <=> n(H) = 16 text(" học sinh"). $
    Vậy có $16$ học sinh tham gia tiết mục hát.
    
    ✅ *Đáp số:* $16$.
  ]
)

#tln(
  dir: "ngang",
  [Khảo sát 40 học sinh lớp 10D về 3 nhóm ngành: Giáo dục, Y tế, Công nghệ thông tin: 6 chọn Giáo dục, 9 chọn Y tế, 10 chọn CNTT, 22 không chọn nhóm nào; 3 chọn Giáo dục và Y tế, 2 chọn Y tế và CNTT, 3 chọn Giáo dục và CNTT. Hỏi có bao nhiêu học sinh chọn cả 3 nhóm ngành?],
  [1],
  loigiai: [
    📌 *Phương pháp:* Sử dụng công thức cộng số phần tử 3 tập hợp.

    ✍️ *Lời giải chi tiết:* \
    - Số học sinh chọn ít nhất một trong ba nhóm ngành là: $40 - 22 = 18$ học sinh.
    - Áp dụng công thức số phần tử của hợp ba tập hợp:
      $ 18 = 6 + 9 + 10 - (3 + 2 + 3) + x <=> 18 = 25 - 8 + x <=> 18 = 17 + x <=> x = 1. $
    Vậy có đúng $1$ học sinh chọn cả ba nhóm ngành.
    
    ✅ *Đáp số:* $1$.
  ]
)

