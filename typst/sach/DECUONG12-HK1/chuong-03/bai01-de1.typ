#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 01 — Khoảng Biến Thiên & Khoảng Tứ Phân Vị])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (12 câu)], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "doc",lines: 2,
  [Cô Hà thống kê lại đường kính thân gỗ của một số cây xoan đào 6 năm tuổi được trồng ở một lâm trường ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Đường kính (cm)*], [$[40; 45)$], [$[45; 50)$], [$[50; 55)$], [$[55; 60)$], [$[60; 65)$],
        [*Tần số*], [5], [20], [18], [7], [3]
      )
    ]
    Hãy tìm khoảng biến thiên của mẫu số liệu ghép nhóm trên.],
  (
    True([$25$]),
    [$30$],
    [$6$],
    [$69.8$]
  ),
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu ghép nhóm là hiệu số giữa đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên: 
      $ R = 65 - 40 = 25 " (cm)" $]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

// ─── CÂU 2 ───
#tn(
  dir: "doc",lines: 2,
  [Bảng dưới biểu diễn mẫu số liệu ghép nhóm về số tiền (đơn vị: nghìn đồng) mà 60 khách hàng mua sách ở một cửa hàng trong một ngày.
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*],
        [$[40; 50)$], [3],
        [$[50; 60)$], [6],
        [$[60; 70)$], [19],
        [$[70; 80)$], [23],
        [$[80; 90)$], [9],
        [*Tổng*], [$n = 60$]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm trên là:],
  (
    [$30$],
    True([$50$]),
    [$6$],
    [$69.8$]
  ),
  loigiai: [
    #step[Đầu mút trái của nhóm đầu tiên là $40$, đầu mút phải của nhóm cuối cùng là $90$. Khoảng biến thiên: 
      $ R = 90 - 40 = 50 " (nghìn đồng)" $]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

// ─── CÂU 3 ───
#tn(
  dir: "doc",lines: 2,
  [Mỗi ngày bác Hương đều đi bộ để rèn luyện sức khoẻ. Quãng đường đi bộ mỗi ngày (đơn vị: km) của bác Hương trong 20 ngày được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Quãng đường (km)*], [$[2.7; 3.0)$], [$[3.0; 3.3)$], [$[3.3; 3.6)$], [$[3.6; 3.9)$], [$[3.9; 4.2)$],
        [*Số ngày*], [3], [6], [5], [4], [2]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm là:],
  (
    True([$1.5$]),
    [$0.9$],
    [$0.6$],
    [$0.3$]
  ),
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu: 
      $ R = 4.2 - 2.7 = 1.5 " (km)" $]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

// ─── CÂU 4 ───
#tn(
  dir: "doc",lines: 2,
  [Bạn Chi rất thích nhảy hiện đại. Thời gian tập nhảy mỗi ngày trong thời gian gần đây của bạn Chi được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$], [$[40; 45)$],
        [*Số ngày*], [6], [6], [4], [1], [1]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm là:],
  (
    True([$25$]),
    [$20$],
    [$15$],
    [$30$]
  ),
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu: 
      $ R = 45 - 20 = 25 " (phút)" $]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

// ─── CÂU 5 ───
#tn(
  dir: "doc",lines: 2,
  [Cho mẫu số liệu ghép nhóm về tuổi thọ (năm) của một số bóng đèn LED như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ (năm)*], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$], [$[10; 12)$],
        [*Số lượng*], [10], [25], [40], [15], [10]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm trên bằng bao nhiêu?],
  (
    [$8$ năm],
    True([$10$ năm]),
    [$6$ năm],
    [$12$ năm]
  ),
  loigiai: [
    #step[Khoảng biến thiên: 
      $ R = 12 - 2 = 10 " (năm)" $]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

// ─── CÂU 6 ───
#tn(
  dir: "doc",lines: 2,
  [Cho mẫu số liệu ghép nhóm về số phút tự học mỗi ngày của 100 học sinh THPT năm học 2026-2027:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[30; 45)$], [$[45; 60)$], [$[60; 75)$], [$[75; 90)$], [$[90; 105)$],
        [*Số học sinh*], [15], [35], [30], [15], [5]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm nào dưới đây?],
  (
    [$[30; 45)$],
    True([$[45; 60)$]),
    [$[60; 75)$],
    [$[75; 90)$]
  ),
  loigiai: [
    #step[Cỡ mẫu $n = 100$. Tứ phân vị thứ nhất $Q_1$ tương ứng với giá trị tích lũy đạt $n/4 = 25$. Tần số tích lũy của nhóm 1 $[30; 45)$ là $15 < 25$. Tần số tích lũy của nhóm 2 $[45; 60)$ là $15 + 35 = 50 >= 25$. Do đó, nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[45; 60)$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

// ─── CÂU 7 ───
#tn(
  dir: "doc",lines: 2,
  [Khảo sát thời gian xem tivi mỗi ngày của một số học sinh, ta thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[0; 20)$], [$[20; 40)$], [$[40; 60)$], [$[60; 80)$], [$[80; 100)$],
        [*Số học sinh*], [8], [$m$], [15], [10], [7]
      )
    ]
    Biết rằng nhóm chứa tứ phân vị thứ nhất $Q_1$ là $[20; 40)$ và $Q_1 = 30$ (phút). Giá trị của $m$ bằng bao nhiêu?],
  (
    [$m = 6$],
    True([$m = 8$]),
    [$m = 10$],
    [$m = 12$]
  ),
  loigiai: [
    #step[Tổng số học sinh (cỡ mẫu) là $n = 8 + m + 15 + 10 + 7 = 40 + m$. Vì $Q_1 = 30 \in [20; 40)$, nhóm chứa $Q_1$ là nhóm $[20; 40)$. Tần số tích lũy trước nhóm chứa $Q_1$ là $c f_1 = 8$. Tần số của nhóm chứa $Q_1$ là $f_2 = m$. Độ dài nhóm là $20$. Áp dụng công thức tính tứ phân vị thứ nhất: 
      $ Q_1 = 20 + ( (40 + m)/4 - 8 ) / m dot 20 = 30 $
     
      $ <=> ( (40 + m - 32)/4 ) / m dot 20 = 10 $
     
      $ <=> (m + 8) / (4m) dot 20 = 10 $
     
      $ <=> (m + 8) / m = 2 $
     
      $ <=> m + 8 = 2m <=> m = 8 $]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

// ─── CÂU 8 ───
#tn(
  dir: "doc",lines: 2,
  [Bảng dưới đây là bảng tần số ghép nhóm số liệu về thời gian tự học trong tuần (đơn vị: giờ) của 40 học sinh:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (giờ)*], [$[0; 4)$], [$[4; 8)$], [$[8; 12)$], [$[12; 16)$], [$[16; 20)$],
        [*Số học sinh*], [8], [8], [8], [8], [8]
      )
    ]
    Do ghi nhận nhầm, có 2 học sinh có thời gian tự học thực tế lần lượt là $2.5$ giờ và $3$ giờ (thuộc nhóm $[0; 4)$) nhưng đã bị ghi nhầm vào nhóm $[8; 12)$. Sau khi sửa lại cho đúng, khoảng tứ phân vị $"IQR"$ của mẫu số liệu sẽ thay đổi như thế nào?],
  (
    True([Tăng $1.0$ giờ]),
    [Giảm $1.0$ giờ],
    [Tăng $0.5$ giờ],
    [Không thay đổi]
  ),
  loigiai: [
    #step[*1. Trước khi sửa nhầm lẫn:* Cỡ mẫu $n = 40$. Vị trí tứ phân vị thứ nhất là $n/4 = 10$. Nhóm chứa $Q_1$ là nhóm $[4; 8)$ (tần số tích lũy là $8 + 8 = 16 >= 10$). 
      $ Q_(1, "cũ") = 4 + (10 - 8)/8 dot 4 = 5.0 $
     Vị trí tứ phân vị thứ ba là $3n/4 = 30$. Nhóm chứa $Q_3$ là nhóm $[12; 16)$ (tần số tích lũy trước đó là $8 dot 3 = 24 < 30$, tích lũy đến nhóm này là $32 >= 30$). 
      $ Q_(3, "cũ") = 12 + (30 - 24)/8 dot 4 = 15.0 $
     Khoảng tứ phân vị ban đầu: 
      $ "IQR"_"cũ" = Q_(3, "cũ") - Q_(1, "cũ") = 15.0 - 5.0 = 10.0 " (giờ)" $]
    #step[*2. Sau khi sửa lại cho đúng:* Chuyển 2 học sinh từ nhóm $[8; 12)$ về nhóm $[0; 4)$. Tần số mới của các nhóm lần lượt là: $10, 8, 6, 8, 8$. Vị trí tứ phân vị thứ nhất là $n/4 = 10$. Nhóm chứa $Q_1$ vẫn là nhóm $[4; 8)$ (tần số tích lũy là $10 + 8 = 18 >= 10$). 
      $ Q_(1, "mới") = 4 + (10 - 10)/8 dot 4 = 4.0 $
     Vị trí tứ phân vị thứ ba là $3n/4 = 30$. Nhóm chứa $Q_3$ vẫn là nhóm $[12; 16)$ (tần số tích lũy trước đó là $10 + 8 + 6 = 24 < 30$, tích lũy đến nhóm này là $32 >= 30$). 
      $ Q_{3, "mới"} = 12 + (30 - 24)/8 dot 4 = 15.0 $
     Khoảng tứ phân vị sau khi sửa: 
      $ "IQR"_"mới" = Q_(3, "mới") - Q_(1, "mới") = 15.0 - 4.0 = 11.0 " (giờ)" $
     Độ thay đổi của khoảng tứ phân vị: 
      $ Delta "IQR" = "IQR"_"mới" - "IQR"_"cũ" = 11.0 - 10.0 = 1.0 " (giờ)" $
     Vậy khoảng tứ phân vị tăng $1.0$ giờ. Đáp án là A.]
    #resetstep()
  ]
)

// ─── CÂU 9 ───
#tn(
  dir: "doc",lines: 2,
  [Cho mẫu số liệu ghép nhóm về điểm kiểm tra định kỳ của 40 học sinh lớp 12:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm số*], [$[4; 5)$], [$[5; 6)$], [$[6; 7)$], [$[7; 8)$], [$[8; 9)$],
        [*Số học sinh*], [4], [8], [14], [10], [4]
      )
    ]
    Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm trên bằng bao nhiêu?],
  (
    [$5.50$],
    True([$5.75$]),
    [$5.25$],
    [$6.00$]
  ),
  loigiai: [
    #step[Cỡ mẫu $n = 40$. Ta tìm nhóm chứa $Q_1$ qua giá trị tích lũy $n/4 = 10$. Tần số tích lũy trước nhóm 2 là $4$. Tần số tích lũy đến nhóm 2 $[5; 6)$ là $4 + 8 = 12 >= 10$. Nhóm chứa $Q_1$ là $[5; 6)$. Áp dụng công thức nội suy: 
      $ Q_1 = 5 + (10 - 4)/8 dot (6 - 5) = 5 + 6/8 = 5.75 $]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)

// ─── CÂU 10 ───
#tn(
  dir: "doc",lines: 2,
  [Với bảng số liệu ghép nhóm ở Câu 9, tứ phân vị thứ ba $Q_3$ của mẫu số liệu bằng bao nhiêu?],
  (
    [$7.20$],
    [$7.50$],
    True([$7.40$]),
    [$7.60$]
  ),
  loigiai: [
    #step[Cỡ mẫu $n = 40$. Ta tìm nhóm chứa $Q_3$ qua giá trị tích lũy $3n/4 = 30$. Tần số tích lũy trước nhóm 4 $[7; 8)$ là $4 + 8 + 14 = 26 < 30$. Tần số tích lũy đến nhóm 4 là $26 + 10 = 36 >= 30$. Nhóm chứa $Q_3$ là $[7; 8)$. Áp dụng công thức nội suy: 
      $ Q_3 = 7 + (30 - 26)/10 dot (8 - 7) = 7 + 4/10 = 7.4 $]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)

// ─── CÂU 11 ───
#tn(
  dir: "doc",lines: 2,
  [Với bảng số liệu ghép nhóm ở Câu 9, khoảng tứ phân vị $"IQR"$ của mẫu số liệu bằng bao nhiêu?],
  (
    True([$1.65$]),
    [$1.50$],
    [$2.00$],
    [$1.25$]
  ),
  loigiai: [
    #step[Ta đã tính được ở các câu trước: $Q_1 = 5.75$ và $Q_3 = 7.4$. Khoảng tứ phân vị: 
      $ "IQR" = Q_3 - Q_1 = 7.4 - 5.75 = 1.65 $]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)

// ─── CÂU 12 ───
#tn(
  dir: "doc",lines: 2,
  [Một cửa hàng thống kê doanh thu bán hàng (đơn vị: triệu đồng) trong 30 ngày qua như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
        [*Số ngày*], [3], [8], [12], [5], [2]
      )
    ]
    Khoảng tứ phân vị $"IQR"$ của mẫu số liệu doanh thu này xấp xỉ bằng bao nhiêu?],
  (
    [$5.84$ triệu đồng],
    [$7.25$ triệu đồng],
    True([$6.98$ triệu đồng]),
    [$8.12$ triệu đồng]
  ),
  loigiai: [
    #step[Cỡ mẫu $n = 30$. Tìm $Q_1$: $n/4 = 7.5$. Nhóm chứa $Q_1$ là $[10; 15)$. 
      $ Q_1 = 10 + (7.5 - 3)/8 dot 5 = 12.8125 $
     Tìm $Q_3$: $3n/4 = 22.5$. Nhóm chứa $Q_3$ là $[15; 20)$ (vì tích lũy trước đó là $11 < 22.5$, đến nhóm này là $23 >= 22.5$). 
      $ Q_3 = 15 + (22.5 - 11)/12 dot 5 = 19.7917 $
     Khoảng tứ phân vị: 
      $ "IQR" = Q_3 - Q_1 = 19.7917 - 12.8125 = 6.9792 approx 6.98 " (triệu đồng)" $]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 2,
  [Cho bảng số liệu ghép nhóm về điểm thi đánh giá năng lực của 100 học sinh THPT:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm số*], [$[500; 600)$], [$[600; 700)$], [$[700; 800)$], [$[800; 900)$], [$[900; 1000)$],
        [*Số học sinh*], [10], [20], [40], [20], [10]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm trên là $500$ điểm]),
    True([Số học sinh có điểm dưới 700 điểm là 30 học sinh]),
    True([Tứ phân vị thứ nhất $Q_1$ nằm ở nhóm $[600; 700)$]),
    True([Tứ phân vị thứ ba $Q_3$ nằm ở nhóm $[800; 900)$])
  ),
  loigiai: [
    #step[a) Đúng. Khoảng biến thiên $R = 1000 - 500 = 500$ điểm.]
    #step[b) Đúng. Số học sinh dưới 700 điểm gồm nhóm 1 và nhóm 2: $10 + 20 = 30$ học sinh.]
    #step[c) Đúng. $n/4 = 25$. Tích lũy nhóm 2 là $10 + 20 = 30 >= 25$. Nhóm chứa $Q_1$ là $[600; 700)$.]
    #step[d) Đúng. $3n/4 = 75$. Tích lũy nhóm 3 là $10 + 20 + 40 = 70 < 75$. Tích lũy nhóm 4 là $70 + 20 = 90 >= 75$. Nhóm chứa $Q_3$ là $[800; 900)$.]
    #resetstep()
  ]
)

// ─── CÂU 2 ───
#ds(
  dir: "doc",lines: 2,
  [Khảo sát điện năng tiêu thụ (kWh) trong một tháng của 50 hộ gia đình ta thu được bảng số liệu sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Lượng điện (kWh)*], [$[100; 150)$], [$[150; 200)$], [$[200; 250)$], [$[250; 300)$], [$[300; 350)$],
        [*Số hộ gia đình*], [5], [15], [18], [10], [2]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm này là $250$ kWh]),
    True([Nhóm chứa trung vị $Q_2$ của mẫu số liệu là $[200; 250)$]),
    True([Tứ phân vị thứ nhất của mẫu số liệu là $Q_1 = 175$ kWh]),
    [Tứ phân vị thứ ba của mẫu số liệu là $Q_3 = 262.5$ kWh]
  ),
  loigiai: [
    #step[a) Đúng. Khoảng biến thiên $R = 350 - 100 = 250$ kWh.]
    #step[b) Đúng. $n/2 = 25$. Tích lũy nhóm 2 là $20 < 25$. Tích lũy nhóm 3 là $38 >= 25$. Nhóm chứa trung vị là $[200; 250)$.]
    #step[c) Đúng. Nhóm chứa $Q_1$ là $[150; 200)$ do $n/4 = 12.5 <= 20$. 
      $ Q_1 = 150 + (12.5 - 5)/15 dot 50 = 175 " (kWh)" $]
    #step[d) Sai. Nhóm chứa $Q_3$ là $[200; 250)$ vì $3n/4 = 37.5$ và tích lũy trước đó là $5+15=20 < 37.5$, tích lũy đến nhóm này là $20+18=38 >= 37.5$. Nhóm chứa $Q_3$ thực tế là $[200; 250)$ và: 
      $ Q_3 = 200 + (37.5 - 20)/18 dot 50 approx 248.61 " (kWh)" $]
    #resetstep()
  ]
)

// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 2,
  [Hai tổ công nhân A và B cùng lắp ráp một loại linh kiện điện tử trong năm 2026-2027. Thời gian hoàn thành (phút) được ghi lại ở bảng ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[10; 12)$], [$[12; 14)$], [$[14; 16)$], [$[16; 18)$], [$[18; 20)$],
        [*Tổ A*], [3], [12], [15], [8], [2],
        [*Tổ B*], [5], [8], [18], [7], [2]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên thời gian lắp ráp của cả hai tổ đều bằng nhau]),
    True([Cỡ mẫu khảo sát của mỗi tổ là $40$ công nhân]),
    True([Tứ phân vị thứ ba $Q_3$ của tổ A thuộc vào nhóm $[16; 18)$]),
    [Thời gian lắp ráp của tổ B phân tán nhiều hơn tổ A (tính theo khoảng tứ phân vị)]
  ),
  loigiai: [
    #step[a) Đúng. Khoảng biến thiên $R_A = R_B = 20 - 10 = 10$ phút.]
    #step[b) Đúng. Cỡ mẫu tổ A: $3+12+15+8+2 = 40$. Tổ B: $5+8+18+7+2 = 40$.]
    #step[c) Đúng. Với tổ A: $3n/4 = 30$. Tích lũy nhóm 3 là $3+12+15=30$. Tứ phân vị thứ ba $Q_3$ nằm ở ranh giới giữa nhóm 3 và nhóm 4, theo quy ước nội suy nó nằm trong nhóm $[16; 18)$.]
    #step[d) Sai. Tính khoảng tứ phân vị: Tổ A: $Q_1 = 12 + (10 - 3)/12 dot 2 = 13.17$. $Q_3 = 16$. Do đó $"IQR"_A = 16 - 13.17 = 2.83$ phút. Tổ B: $Q_1 = 12 + (10 - 5)/8 dot 2 = 13.25$. Nhóm chứa $Q_3$ là $[14; 16)$ vì tích lũy đến đây là $31 >= 30$. 
      $ Q_3 = 14 + (30 - 13)/18 dot 2 approx 15.89 " (phút)" $
     Do đó $"IQR"_B = 15.89 - 13.25 = 2.64$ phút. Vì $"IQR"_B < "IQR"_A$, nên thời gian lắp ráp của tổ B tập trung hơn (phân tán ít hơn) tổ A.]
    #resetstep()
  ]
)

// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 2,
  [Khảo sát số giờ sử dụng điện thoại mỗi ngày của một nhóm gồm $35 + m$ học sinh, ta thu được bảng số liệu ghép nhóm dưới đây:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (giờ)*], [$[0; 1)$], [$[1; 2)$], [$[2; 3)$], [$[3; 4)$], [$[4; 5)$],
        [*Số học sinh*], [5], [10], [$m$], [12], [8]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm trên luôn bằng $5$ giờ với mọi giá trị $m > 0$]),
    True([Nếu $m = 15$, nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[1; 2)$]),
    [Giá trị của $m$ để tứ phân vị thứ ba $Q_3$ trùng với trung điểm của nhóm $[3; 4)$ là $m = 13$],
    [Nếu ghi nhận nhầm $2$ học sinh từ nhóm $[4; 5)$ sang nhóm $[0; 1)$ thì khoảng biến thiên của mẫu số liệu ghép nhóm sẽ giảm đi $1$ giờ]
  ),
  loigiai: [
    #step[a) Đúng. Khoảng biến thiên $R = 5 - 0 = 5$ giờ, chỉ phụ thuộc vào đầu mút của nhóm đầu tiên có tần số $> 0$ và nhóm cuối cùng có tần số $> 0$. Vì tần số các nhóm $[0; 1)$ và $[4; 5)$ đều đã có sẵn dương nên $R$ luôn bằng 5.]
    #step[b) Đúng. Nếu $m = 15$, cỡ mẫu $n = 35 + 15 = 50$. Vị trí của $Q_1$ là $n/4 = 12.5$. Tần số tích lũy của nhóm 1 $[0; 1)$ là 5. Tần số tích lũy của nhóm 2 $[1; 2)$ là $5 + 10 = 15 >= 12.5$. Vậy nhóm chứa $Q_1$ là $[1; 2)$.]
    #step[c) Sai. Trung điểm nhóm $[3; 4)$ là $3.5$. Nếu $m = 21$, cỡ mẫu $n = 35 + 21 = 56$. Vị trí $Q_3$ là $3n/4 = 42$. Tích lũy trước nhóm $[3; 4)$ là $5 + 10 + 21 = 36 < 42$, tích lũy đến nhóm này là $48 >= 42$, nên nhóm chứa $Q_3$ là $[3; 4)$. Tính $Q_3$: $ Q_3 = 3 + (42 - 36)/12 dot 1 = 3.5$. Do đó để $Q_3 = 3.5$ thì $m$ phải bằng 21.]
    #step[d) Sai. Khi dịch chuyển 2 học sinh, tần số nhóm $[0; 1)$ tăng lên 7, nhóm $[4; 5)$ giảm còn 6 (cả hai vẫn $> 0$). Nhóm đầu và nhóm cuối vẫn chứa học sinh nên khoảng biến thiên vẫn là $5 - 0 = 5$ giờ (không đổi).]
    #resetstep()
  ]
)


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "doc",lines: 2,
  [Khảo sát thời gian truy cập internet (giờ/ngày) của 50 học sinh, ta thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (giờ)*], [$[0; 1)$], [$[1; 2)$], [$[2; 3)$], [$[3; 4)$], [$[4; 5)$],
        [*Số học sinh*], [5], [15], [20], [8], [2]
      )
    ]
    Tính khoảng biến thiên của mẫu số liệu ghép nhóm trên.],
  [$5$],
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu ghép nhóm bằng hiệu số giữa đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên: 
      $ R = 5 - 0 = 5 " (giờ)" $]
    #step[Đáp số: $5$.]
    #resetstep()
  ]
)

// ─── CÂU 2 ───
#tln(
  dir: "doc",lines: 2,
  [Cân nặng (kg) của 40 quả dưa hấu thu hoạch tại một nông trại được thống kê ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Cân nặng (kg)*], [$[1.0; 1.5)$], [$[1.5; 2.0)$], [$[2.0; 2.5)$], [$[2.5; 3.0)$], [$[3.0; 3.5)$],
        [*Số lượng*], [4], [10], [16], [8], [2]
      )
    ]
    Hãy tính tứ phân vị thứ nhất $Q_1$ của mẫu số liệu trên.],
  [$1.8$],
  loigiai: [
    #step[Cỡ mẫu $n = 40$. Ta có $n/4 = 10$. Tần số tích lũy của nhóm 1 $[1.0; 1.5)$ là $4$. Tích lũy đến nhóm 2 $[1.5; 2.0)$ là $4 + 10 = 14 >= 10$. Vậy nhóm chứa $Q_1$ là $[1.5; 2.0)$. Áp dụng công thức nội suy: 
      $ Q_1 = 1.5 + (10 - 4)/10 dot (2.0 - 1.5) = 1.5 + 6/10 dot 0.5 = 1.5 + 0.3 = 1.8 $]
    #step[Đáp số: $1.8$.]
    #resetstep()
  ]
)

// ─── CÂU 3 ───
#tln(
  dir: "doc",lines: 2,
  [Tuổi thọ (nghìn giờ) của 80 bóng đèn huỳnh quang được kiểm tra và ghi lại trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ*], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$], [$[10; 12)$], [$[12; 14)$],
        [*Số bóng đèn*], [5], [25], [20], [20], [10]
      )
    ]
    Hãy tính tứ phân vị thứ ba $Q_3$ của mẫu số liệu trên.],
  [$11$],
  loigiai: [
    #step[Cỡ mẫu $n = 80$. Ta có $3n/4 = 60$. Tần số tích lũy trước nhóm 4 $[10; 12)$ là $5 + 25 + 20 = 50 < 60$. Tích lũy đến nhóm 4 là $50 + 20 = 70 >= 60$. Nhóm chứa $Q_3$ là $[10; 12)$. Áp dụng công thức nội suy: 
      $ Q_3 = 10 + (60 - 50)/20 dot (12 - 10) = 10 + 10/20 dot 2 = 10 + 1 = 11 $]
    #step[Đáp số: $11$.]
    #resetstep()
  ]
)

// ─── CÂU 4 ───
#tln(
  dir: "doc",lines: 2,
  [Thống kê doanh thu bán hàng mỗi ngày (triệu đồng) trong 50 ngày của một cửa hàng, ta có bảng tần số ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$],
        [*Số ngày*], [5], [10], [20], [10], [5]
      )
    ]
    Hãy tính khoảng tứ phân vị $"IQR"$ của mẫu số liệu trên.],
  [$7.5$],
  loigiai: [
    #step[Cỡ mẫu $n = 50$. 
      - Tính $Q_1$: $n/4 = 12.5$. Nhóm chứa $Q_1$ là $[15; 20)$. 
        $ Q_1 = 15 + (12.5 - 5)/10 dot 5 = 15 + 3.75 = 18.75 $
      - Tính $Q_3$: $3n/4 = 37.5$. Nhóm chứa $Q_3$ là $[25; 30)$. 
        $ Q_3 = 25 + (37.5 - 35)/10 dot 5 = 25 + 1.25 = 26.25 $
      Khoảng tứ phân vị là: 
      $ "IQR" = Q_3 - Q_1 = 26.25 - 18.75 = 7.5 $]
    #step[Đáp số: $7.5$.]
    #resetstep()
  ]
)

// ─── CÂU 5 ───
#tln(
  dir: "doc",lines: 2,
  [Khảo sát mức thu nhập trong một tháng (đơn vị: triệu đồng) của một nhóm gồm $60 + m$ nhân viên, ta thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thu nhập (triệu đồng)*], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
        [*Số nhân viên*], [12], [18], [$m$], [24], [6]
      )
    ]
    Biết rằng nhóm chứa tứ phân vị thứ nhất $Q_1$ là $[10; 15)$ và $Q_1 = 12.5$. Tính giá trị của tham số $m$.],
  [$24$],
  loigiai: [
    #step[Tổng số nhân viên (cỡ mẫu) là $n = 60 + m$. Vì $Q_1 = 12.5 \in [10; 15)$, nhóm chứa $Q_1$ là nhóm $[10; 15)$. Tần số tích lũy trước nhóm chứa $Q_1$ là $c f_1 = 12$. Tần số của nhóm chứa $Q_1$ là $f_2 = 18$. Độ dài nhóm là $5$. Áp dụng công thức tính tứ phân vị thứ nhất: 
      $ Q_1 = 10 + ( (60 + m)/4 - 12 ) / 18 dot 5 = 12.5 $
     
      $ <=> ( (60 + m)/4 - 12 ) / 18 = 0.5 $
     
      $ <=> (60 + m)/4 - 12 = 9 $
     
      $ <=> (60 + m)/4 = 21 $
     
      $ <=> 60 + m = 84 <=> m = 24 $]
    #step[Đáp số: $24$.]
    #resetstep()
  ]
)

// ─── CÂU 6 ───
#tln(
  dir: "doc",lines: 2,
  [Bảng dưới đây là bảng tần số ghép nhóm số liệu về số giờ làm thêm trong một tháng của 40 nhân viên:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Số giờ làm thêm*], [$[0; 10)$], [$[10; 20)$], [$[20; 30)$], [$[30; 40)$], [$[40; 50)$],
        [*Số nhân viên*], [4], [8], [14], [10], [4]
      )
    ]
    Do ghi nhận nhầm, có 4 nhân viên có số giờ làm thêm thực tế thuộc nhóm $[10; 20)$ nhưng đã bị ghi nhầm vào nhóm $[30; 40)$. Sau khi sửa lại cho đúng, hãy tính độ lệch (hiệu số tuyệt đối) giữa khoảng tứ phân vị mới và khoảng tứ phân vị cũ của mẫu số liệu.],
  [$1.5$],
  loigiai: [
    #step[Khoảng tứ phân vị ban đầu (khi chưa sửa sai): Cỡ mẫu $n = 40$. Vị trí $Q_1$ là $n/4 = 10$. Nhóm chứa $Q_1$ là $[10; 20)$. 
      $ Q_(1, "cũ") = 10 + (10 - 4)/8 dot 10 = 17.5 $
     Vị trí $Q_3$ là $3n/4 = 30$. Nhóm chứa $Q_3$ là $[30; 40)$. 
      $ Q_(3, "cũ") = 30 + (30 - 26)/10 dot 10 = 34.0 $
     Khoảng tứ phân vị cũ: 
      $ "IQR"_"cũ" = Q_(3, "cũ") - Q_(1, "cũ") = 34.0 - 17.5 = 16.5 $]
    #step[Khoảng tứ phân vị sau khi sửa sai: Di chuyển 4 nhân viên từ nhóm $[30; 40)$ về nhóm $[10; 20)$. Tần số mới của các nhóm là: $4, 12, 14, 6, 4$. Vị trí $Q_1$ là $10$. Nhóm chứa $Q_1$ là $[10; 20)$. 
      $ Q_(1, "mới") = 10 + (10 - 4)/12 dot 10 = 15.0 $
     Vị trí $Q_3$ là $30$. Tích lũy đến nhóm $[20; 30)$ là $4 + 12 + 14 = 30$. Do $3n/4 = 30$ trùng với tần số tích lũy của nhóm $[20; 30)$ nên:
      $ Q_(3, "mới") = 30.0 $
     Khoảng tứ phân vị mới: 
      $ "IQR"_"mới" = Q_(3, "mới") - Q_(1, "mới") = 30.0 - 15.0 = 15.0 $]
    #step[Độ lệch giữa hai khoảng tứ phân vị: 
      $ |"IQR"_"mới" - "IQR"_"cũ"| = |15.0 - 16.5| = 1.5 $]
    #step[Đáp số: $1.5$.]
    #resetstep()
  ]
)
