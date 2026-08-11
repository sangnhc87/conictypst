#import "../preamble.typ": *
#import "../../../math-sym.typ": *
#show math.frac: math.display


#muc([Đề Luyện Tập Số 02 — Khoảng Biến Thiên & Khoảng Tứ Phân Vị])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (20 câu)], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "doc",lines: 2,
  [Một vườn thú ghi lại tuổi thọ (đơn vị: năm) của 20 con hổ và thu được kết quả như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ*], [$[14; 15)$], [$[15; 16)$], [$[16; 17)$], [$[17; 18)$], [$[18; 19)$],
        [*Số con hổ*], [1], [3], [8], [6], [2]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này là:],
  (
    [$[14; 15)$],
    [$[15; 16)$],
    True([$[16; 17)$]),
    [$[17; 18)$]
  ),
  loigiai: [
    Cỡ mẫu $n = 20$. Tứ phân vị thứ nhất $Q_1$ ứng với giá trị tích lũy đạt $n/4 = 5$.\
    Tần số tích lũy đến nhóm 2 $[15; 16)$ là $1 + 3 = 4 < 5$.\
    Tần số tích lũy đến nhóm 3 $[16; 17)$ là $4 + 8 = 12 >= 5$.\
    Vậy nhóm chứa $Q_1$ là $[16; 17)$.
  ]
)

// ─── CÂU 2 ───
#tn(
  dir: "doc",lines: 2,
  [Một nhóm nghiên cứu ghi nhận tuổi thọ (đơn vị: năm) của 20 con cá heo và thu được bảng số liệu sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ*], [$[14; 15)$], [$[15; 16)$], [$[16; 17)$], [$[17; 18)$], [$[18; 19)$],
        [*Số cá heo*], [1], [3], [8], [6], [2]
      )
    ]
    Nhóm chứa tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm trên là:],
  (
    [$[15; 16)$],
    [$[16; 17)$],
    True([$[17; 18)$]),
    [$[18; 19)$]
  ),
  loigiai: [
    Cỡ mẫu $n = 20$. Tứ phân vị thứ ba $Q_3$ ứng với giá trị tích lũy đạt $3n/4 = 15$.\
    Tần số tích lũy trước nhóm 4 $[17; 18)$ là $1 + 3 + 8 = 12 < 15$.\
    Tần số tích lũy đến nhóm 4 $[17; 18)$ là $12 + 6 = 18 >= 15$.\
    Vậy nhóm chứa $Q_3$ là $[17; 18)$.
  ]
)

// ─── CÂU 3 ───
#tn(
  dir: "doc",lines: 2,
  [Khảo sát thời gian tập thể dục trong ngày của một số học sinh khối 11 thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[0; 20)$], [$[20; 40)$], [$[40; 60)$], [$[60; 80)$], [$[80; 100)$],
        [*Số học sinh*], [5], [9], [12], [10], [6]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này là:],
  (
    [$[0; 20)$],
    True([$[20; 40)$]),
    [$[40; 60)$],
    [$[60; 80)$]
  ),
  loigiai: [
    Tổng số học sinh khảo sát là $n = 5 + 9 + 12 + 10 + 6 = 42$.\
    Tứ phân vị thứ nhất $Q_1$ ứng với vị trí tích lũy $n/4 = 10.5$.\
    Tần số tích lũy của nhóm 1 $[0; 20)$ là $5 < 10.5$.\
    Tần số tích lũy của nhóm 2 $[20; 40)$ là $5 + 9 = 14 >= 10.5$.\
    Do đó, nhóm chứa $Q_1$ là $[20; 40)$.
  ]
)

// ─── CÂU 4 ───
#tn(
  dir: "doc",lines: 2,
  [Doanh thu bán hàng trong 20 ngày được lựa chọn ngẫu nhiên của một cửa hàng được ghi lại ở bảng sau (đơn vị: triệu đồng):
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[5; 7)$], [$[7; 9)$], [$[9; 11)$], [$[11; 13)$], [$[13; 15)$],
        [*Số ngày*], [2], [7], [7], [3], [1]
      )
    ]
    Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu trên gần nhất với giá trị nào trong các giá trị sau?],
  (
    [$7.0$],
    [$7.6$],
    True([$8.0$]),
    [$8.6$]
  ),
  loigiai: [
    Cỡ mẫu $n = 20$. Tứ phân vị thứ nhất $Q_1$ ứng với vị trí tích lũy $n/4 = 5$.\
    Tích lũy đến nhóm 2 $[7; 9)$ là $2 + 7 = 9 >= 5$. Nhóm chứa $Q_1$ là $[7; 9)$.\
    Áp dụng công thức nội suy:
    $ Q_1 = 7 + (5 - 2)/7 dot (9 - 7) = 7 + 6/7 approx 7.86 " (triệu đồng)" $\
    Giá trị này gần nhất với $8.0$.
  ]
)

// ─── CÂU 5 ───
#tn(
  dir: "doc",lines: 2,
  [Khảo sát chi phí điện tiêu thụ trong một tháng (đơn vị: trăm nghìn đồng) của 20 hộ gia đình, ta thu được bảng số liệu sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Chi phí*], [$[5; 7)$], [$[7; 9)$], [$[9; 11)$], [$[11; 13)$], [$[13; 15)$],
        [*Số hộ*], [2], [7], [7], [3], [1]
      )
    ]
    Tứ phân vị thứ ba $Q_3$ của mẫu số liệu gần nhất với giá trị nào trong các giá trị sau?],
  (
    [$10.0$],
    True([$11.0$]),
    [$12.0$],
    [$13.0$]
  ),
  loigiai: [
    Cỡ mẫu $n = 20$. Tứ phân vị thứ ba $Q_3$ ứng với vị trí tích lũy $3n/4 = 15$.\
    Tích lũy trước nhóm 3 $[9; 11)$ là $2 + 7 = 9 < 15$.\
    Tích lũy đến nhóm 3 $[9; 11)$ là $9 + 7 = 16 >= 15$. Nhóm chứa $Q_3$ là $[9; 11)$.\
    Áp dụng công thức nội suy:
    $ Q_3 = 9 + (15 - 9)/7 dot (11 - 9) = 9 + 12/7 approx 10.71 " (triệu đồng)" $\
    Giá trị này gần nhất với $11.0$.
  ]
)

// ─── CÂU 6 ───
#tn(
  dir: "doc",lines: 2,
  [Cho mẫu số liệu ghép nhóm về tuổi thọ (đơn vị tính là năm) của một loại bóng đèn mới như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ*], [$[2; 3.5)$], [$[3.5; 5)$], [$[5; 6.5)$], [$[6; 8)$],
        [*Số bóng đèn*], [8], [22], [35], [15]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất của mẫu số liệu là:],
  (
    [$[2; 3.5)$],
    True([$[3.5; 5)$]),
    [$[5; 6.5)$],
    [$[6; 8)$]
  ),
  loigiai: [
    Tổng số bóng đèn khảo sát là $n = 8 + 22 + 35 + 15 = 80$.\
    Tứ phân vị thứ nhất $Q_1$ ứng với vị trí tích lũy $n/4 = 20$.\
    Tần số tích lũy của nhóm 1 $[2; 3.5)$ là $8 < 20$.\
    Tần số tích lũy của nhóm 2 $[3.5; 5)$ là $8 + 22 = 30 >= 20$.\
    Vậy nhóm chứa $Q_1$ là $[3.5; 5)$.
  ]
)

// ─── CÂU 7 ───
#tn(
  dir: "doc",lines: 2,
  [Thời gian hoàn thành một vòng đua (đơn vị: phút) của 80 tay đua được ghi lại trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian*], [$[2; 3.5)$], [$[3.5; 5)$], [$[5; 6.5)$], [$[6; 8)$],
        [*Số tay đua*], [8], [22], [35], [15]
      )
    ]
    Nhóm chứa tứ phân vị thứ ba của mẫu số liệu là:],
  (
    [$[3.5; 5)$],
    [$[6; 8)$],
    True([$[5; 6.5)$]),
    [$[2; 3.5)$]
  ),
  loigiai: [
    Tổng số bóng đèn là $n = 80$. Tứ phân vị thứ ba $Q_3$ ứng với vị trí tích lũy $3n/4 = 60$.\
    Tần số tích lũy trước nhóm 3 $[5; 6.5)$ là $8 + 22 = 30 < 60$.\
    Tần số tích lũy đến nhóm 3 $[5; 6.5)$ là $30 + 35 = 65 >= 60$.\
    Vậy nhóm chứa $Q_3$ là $[5; 6.5)$.
  ]
)

// ─── CÂU 8 ───
#tn(
  dir: "doc",lines: 2,
  [Cho bảng số liệu về chiều cao của 100 học sinh một trường trung học phổ thông dưới đây:
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Chiều cao (cm)*], [*Số học sinh*],
        [1], [$[150; 153)$], [7],
        [2], [$[153; 156)$], [13],
        [3], [$[156; 159)$], [40],
        [4], [$[159; 162)$], [21],
        [5], [$[162; 165)$], [13],
        [6], [$[165; 168)$], [6]
      )
    ]
    Tứ phân vị thứ nhất của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm) là:],
  (
    [$156.25$],
    [$157.50$],
    True([$156.38$]),
    [$157.54$]
  ),
  loigiai: [
    Cỡ mẫu $n = 100$. Tứ phân vị thứ nhất $Q_1$ ứng với vị trí tích lũy $n/4 = 25$.\
    Tích lũy trước nhóm 3 $[156; 159)$ là $7 + 13 = 20 < 25$.\
    Tích lũy đến nhóm 3 là $20 + 40 = 60 >= 25$. Nhóm chứa $Q_1$ là $[156; 159)$.\
    Áp dụng công thức nội suy:
    $ Q_1 = 156 + (25 - 20)/40 dot (159 - 156) = 156 + 15/40 = 156.375 approx 156.38 " (cm)" $
  ]
)

// ─── CÂU 9 ───
#tn(
  dir: "doc",lines: 2,
  [Đo chiều dài (cm) của 100 thanh thép, ta thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Chiều dài (cm)*], [*Số thanh thép*],
        [1], [$[150; 153)$], [7],
        [2], [$[153; 156)$], [13],
        [3], [$[156; 159)$], [40],
        [4], [$[159; 162)$], [21],
        [5], [$[162; 165)$], [13],
        [6], [$[165; 168)$], [6]
      )
    ]
    Tứ phân vị thứ ba của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm) là:],
  (
    [$160.52$],
    [$161.52$],
    True([$161.14$]),
    [$162.25$]
  ),
  loigiai: [
    Cỡ mẫu $n = 100$. Tứ phân vị thứ ba $Q_3$ ứng với vị trí tích lũy $3n/4 = 75$.\
    Tích lũy trước nhóm 4 $[159; 162)$ là $7 + 13 + 40 = 60 < 75$.\
    Tích lũy đến nhóm 4 là $60 + 21 = 81 >= 75$. Nhóm chứa $Q_3$ là $[159; 162)$.\
    Áp dụng công thức nội suy:
    $ Q_3 = 159 + (75 - 60)/21 dot (162 - 159) = 159 + 45/21 approx 161.1428 approx 161.14 " (cm)" $
  ]
)

// ─── CÂU 10 ───
#tn(
  dir: "doc",lines: 2,
  [Bảng dưới biểu diễn mẫu số liệu ghép nhóm về số tiền (đơn vị: nghìn đồng) mà 60 khách hàng mua sách ở một cửa hàng trong một ngày:
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*],
        [$[40; 50)$], [3],
        [$[50; 60)$], [6],
        [$[60; 70)$], [19],
        [$[70; 80)$], [23],
        [$[80; 90)$], [9]
      )
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm trên là:],
  (
    [$50$],
    [$40$],
    True([$14.23$]),
    [$70.87$]
  ),
  loigiai: [
    Cỡ mẫu $n = 60$.\
    - Tìm $Q_1$: $n/4 = 15$. Tích lũy nhóm trước là 9. Nhóm chứa $Q_1$ là $[60; 70)$.
      $ Q_1 = 60 + (15 - 9)/19 dot 10 approx 63.158 $
    - Tìm $Q_3$: $3n/4 = 45$. Tích lũy nhóm trước là $3 + 6 + 19 = 28$. Nhóm chứa $Q_3$ là $[70; 80)$.
      $ Q_3 = 70 + (45 - 28)/23 dot 10 approx 77.391 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 77.391 - 63.158 = 14.233 approx 14.23 " (nghìn đồng)" $
  ]
)

// ─── CÂU 11 ───
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
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm là:],
  (
    [$0.9$],
    [$0.975$],
    [$0.5$],
    True([$0.575$])
  ),
  loigiai: [
    Cỡ mẫu $n = 20$.\
    - Tìm $Q_1$: $n/4 = 5$. Nhóm chứa $Q_1$ là $[3.0; 3.3)$ (tích lũy nhóm 1 là 3).
      $ Q_1 = 3.0 + (5 - 3)/6 dot 0.3 = 3.1 $
    - Tìm $Q_3$: $3n/4 = 15$. Tích lũy trước nhóm 4 $[3.6; 3.9)$ là $3 + 6 + 5 = 14 < 15$. Nhóm chứa $Q_3$ là $[3.6; 3.9)$.
      $ Q_3 = 3.6 + (15 - 14)/4 dot 0.3 = 3.675 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 3.675 - 3.1 = 0.575 " (km)" $
  ]
)

// ─── CÂU 12 ───
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
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm là:],
  (
    [$23.75$],
    [$27.5$],
    [$31.88$],
    True([$8.125$])
  ),
  loigiai: [
    Tổng số ngày khảo sát là $n = 6 + 6 + 4 + 1 + 1 = 18$.\
    - Tìm $Q_1$: $n/4 = 4.5$. Nhóm chứa $Q_1$ là $[20; 25)$ (tích lũy nhóm này là 6).
      $ Q_1 = 20 + (4.5 - 0)/6 dot 5 = 23.75 $
    - Tìm $Q_3$: $3n/4 = 13.5$. Tích lũy trước nhóm 3 $[30; 35)$ là $6 + 6 = 12 < 13.5$. Nhóm chứa $Q_3$ là $[30; 35)$.
      $ Q_3 = 30 + (13.5 - 12)/4 dot 5 = 31.875 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 31.875 - 23.75 = 8.125 " (phút)" $
  ]
)

// ─── CÂU 13 ───
#tn(
  dir: "doc",lines: 2,
  [Dũng là học sinh rất giỏi chơi rubik, bạn có thể giải nhiều loại khối rubik khác nhau. Trong một lần tập luyện giải khối rubik $3 times 3$, bạn Dũng đã tự thống kê lại thời gian giải rubik trong 25 lần giải liên tiếp ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian giải rubik (giây)*], [$[8; 10)$], [$[10; 12)$], [$[12; 14)$], [$[14; 16)$], [$[16; 18)$],
        [*Số lần*], [4], [6], [8], [4], [3]
      )
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm là:],
  (
    [$10.75$],
    [$1.75$],
    True([$3.63$]),
    [$14.38$]
  ),
  loigiai: [
    Cỡ mẫu $n = 25$.\
    - Tìm $Q_1$: $n/4 = 6.25$. Nhóm chứa $Q_1$ là $[10; 12)$ (tích lũy là 10).
      $ Q_1 = 10 + (6.25 - 4)/6 dot 2 = 10.75 $
    - Tìm $Q_3$: $3n/4 = 18.75$. Tích lũy trước nhóm 4 $[14; 16)$ là $4 + 6 + 8 = 18 < 18.75$. Nhóm chứa $Q_3$ là $[14; 16)$.
      $ Q_3 = 14 + (18.75 - 18)/4 dot 2 = 14.375 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 14.375 - 10.75 = 3.625 approx 3.63 " (giây)" $
  ]
)

// ─── CÂU 14 ───
#tn(
  dir: "doc",lines: 2,
  [Thời gian (phút) truy cập Internet mỗi buổi tối của một số học sinh được cho trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[9.5; 12.5)$], [$[12.5; 15.5)$], [$[15.5; 18.5)$], [$[18.5; 21.5)$], [$[21.5; 24.5)$],
        [*Số học sinh*], [3], [12], [15], [24], [2]
      )
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm là:],
  (
    [$10.75$],
    True([$4.75$]),
    [$4.63$],
    [$4.38$]
  ),
  loigiai: [
    Tổng số học sinh khảo sát là $n = 3 + 12 + 15 + 24 + 2 = 56$.\
    - Tìm $Q_1$: $n/4 = 14$. Nhóm chứa $Q_1$ là $[12.5; 15.5)$ (tích lũy là 15).
      $ Q_1 = 12.5 + (14 - 3)/12 dot 3 = 15.25 $
    - Tìm $Q_3$: $3n/4 = 42$. Tích lũy trước nhóm 4 $[18.5; 21.5)$ là $3 + 12 + 15 = 30 < 42$. Nhóm chứa $Q_3$ là $[18.5; 21.5)$.
      $ Q_3 = 18.5 + (42 - 30)/24 dot 3 = 20.0 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 20.0 - 15.25 = 4.75 " (phút)" $
  ]
)

// ─── CÂU 15 ───
#tn(
  dir: "doc",lines: 2,
  [Ghi lại tốc độ bóng trong 200 lần giao bóng của một vận động viên môn quần vợt cho kết quả như bảng bên:
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Tốc độ $v$ (km/h)*], [*Số lần*],
        [$150 <= v < 155$], [18],
        [$155 <= v < 160$], [28],
        [$160 <= v < 165$], [35],
        [$165 <= v < 170$], [43],
        [$170 <= v < 175$], [41],
        [$175 <= v < 180$], [35]
      )
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm là:],
  (
    True([$12.6$]),
    [$11.5$],
    [$14.3$],
    [$16.8$]
  ),
  loigiai: [
    Cỡ mẫu $n = 200$.\
    - Tìm $Q_1$: $n/4 = 50$. Tích lũy trước nhóm 3 $[160; 165)$ là $18 + 28 = 46 < 50$. Nhóm chứa $Q_1$ là $[160; 165)$.
      $ Q_1 = 160 + (50 - 46)/35 dot 5 approx 160.57 $
    - Tìm $Q_3$: $3n/4 = 150$. Tích lũy trước nhóm 5 $[170; 175)$ là $18 + 28 + 35 + 43 = 124 < 150$. Nhóm chứa $Q_3$ là $[170; 175)$.
      $ Q_3 = 170 + (150 - 124)/41 dot 5 approx 173.17 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 173.17 - 160.57 = 12.6 " (km/h)" $
  ]
)

// ─── CÂU 16 ───
#tn(
  dir: "doc",lines: 2,
  [Biểu đồ dưới đây biểu diễn số lượng khách hàng đặt bàn qua hình thức trực tuyến mỗi ngày trong quý III năm 2026 của một nhà hàng. Cột thứ nhất biểu diễn số ngày có từ 1 đến 6 lượt đặt bàn, cột thứ hai biểu diễn số ngày có từ 6 đến 11 lượt đặt bàn,...
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (7, 0), mark: (end: ">"))
        line((0, 0), (0, 4), mark: (end: ">"))
        
        // Nhãn trục
        content((7, -0.4), [Số lượt đặt bàn])
        content((-0.8, 4), [Số ngày])
        
        // Vạch tọa độ đứng
        for y in (5, 10, 15, 20, 25, 30, 35) {
          let y_val = y / 10
          line((-0.1, y_val), (0.1, y_val))
          content((-0.4, y_val), str(y))
        }
        
        // Vẽ các cột histogram
        // Cột 1: [1; 6) -> 14 ngày (y_val = 1.4)
        rect((0.5, 0), (1.5, 1.4), stroke: 1pt + black, fill: gray.lighten(50%))
        content((1.0, 1.6), [14])
        content((0.5, -0.3), [1])
        
        // Cột 2: [6; 11) -> 30 ngày (y_val = 3.0)
        rect((1.5, 0), (2.5, 3.0), stroke: 1pt + black, fill: gray.lighten(50%))
        content((2.0, 3.2), [30])
        content((1.5, -0.3), [6])
        
        // Cột 3: [11; 16) -> 25 ngày (y_val = 2.5)
        rect((2.5, 0), (3.5, 2.5), stroke: 1pt + black, fill: gray.lighten(50%))
        content((3.0, 2.7), [25])
        content((2.5, -0.3), [11])
        
        // Cột 4: [16; 21) -> 18 ngày (y_val = 1.8)
        rect((3.5, 0), (4.5, 1.8), stroke: 1pt + black, fill: gray.lighten(50%))
        content((4.0, 2.0), [18])
        content((3.5, -0.3), [16])
        
        // Cột 5: [21; 26) -> 5 ngày (y_val = 0.5)
        rect((4.5, 0), (5.5, 0.5), stroke: 1pt + black, fill: gray.lighten(50%))
        content((5.0, 0.7), [5])
        content((4.5, -0.3), [21])
        content((5.5, -0.3), [26])
      })
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm cho bởi biểu đồ trên là:],
  (
    [$9.5$],
    True([$8.5$]),
    [$10.5$],
    [$7.5$]
  ),
  loigiai: [
    Số liệu ghép nhóm từ biểu đồ:
    - Nhóm 1 $[1; 6)$: tần số $14$.
    - Nhóm 2 $[6; 11)$: tần số $30$.
    - Nhóm 3 $[11; 16)$: tần số $25$.
    - Nhóm 4 $[16; 21)$: tần số $18$.
    - Nhóm 5 $[21; 26)$: tần số $5$.
    
    Tổng số ngày $n = 14 + 30 + 25 + 18 + 5 = 92$.\
    - Tìm $Q_1$: $n/4 = 23$. Tích lũy nhóm 1 là $14 < 23$. Tích lũy nhóm 2 là $14 + 30 = 44 >= 23$. Nhóm chứa $Q_1$ là $[6; 11)$.
      $ Q_1 = 6 + (23 - 14)/30 dot 5 = 6 + 1.5 = 7.5 $
    - Tìm $Q_3$: $3n/4 = 69$. Tích lũy trước nhóm 4 $[16; 21)$ là $14 + 30 + 25 = 69$. Do đó $Q_3 = 16.0$ (điểm ranh giới giữa nhóm 3 và nhóm 4).
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 16.0 - 7.5 = 8.5 $
  ]
)

// ─── CÂU 17 ───
#tn(
  dir: "doc",lines: 0,
  [Một vườn thú ghi lại tuổi thọ (đơn vị: năm) của 20 con hổ và thu được kết quả như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi thọ*], [$[14; 15)$], [$[15; 16)$], [$[16; 17)$], [$[17; 18)$], [$[18; 19)$],
        [*Số con hổ*], [1], [3], [8], [6], [2]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm này là:],
  (
    [$3$],
    [$4$],
    True([$5$]),
    [$6$]
  ),
  loigiai: [
    Đầu mút trái nhóm đầu tiên là $14$, đầu mút phải nhóm cuối cùng là $19$.
    Khoảng biến thiên:
    $ R = 19 - 14 = 5 " (năm)" $
  ]
)

// ─── CÂU 18 ───
#tn(
  dir: "doc",lines: 0,
  [Khảo sát thời gian tập thể dục của một số học sinh khối 11 thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian (phút)*], [$[0; 20)$], [$[20; 40)$], [$[40; 60)$], [$[60; 80)$], [$[80; 100)$],
        [*Số học sinh*], [5], [9], [12], [10], [6]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm này là:],
  (
    [$80$],
    [$60$],
    True([$100$]),
    [$12$]
  ),
  loigiai: [
    Khoảng biến thiên:
    $ R = 100 - 0 = 100 " (phút)" $
  ]
)

// ─── CÂU 19 ───
#tn(
  dir: "doc",lines: 0,
  [Mức thưởng tết (triệu đồng) cho các nhân viên của một công ty được thống kê trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Mức thưởng tết*], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
        [*Số nhân viên*], [13], [35], [47], [25], [10]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm này là:],
  (
    [$20$],
    True([$25$]),
    [$47$],
    [$23$]
  ),
  loigiai: [
    Khoảng biến thiên:
    $ R = 30 - 5 = 25 " (triệu đồng)" $
  ]
)

// ─── CÂU 20 ───
#tn(
  dir: "doc",lines: 2,
  [Cho bảng phân bố tần số ghép lớp sau. Chiều cao của 40 học sinh nam ở một trường THPT:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Lớp chiều cao (cm)*], [$[160; 163.5)$], [$[164; 167.5)$], [$[168; 171.5)$], [$[172; 175.5)$], [*Cộng*],
        [*Tần số*], [9], [20], [7], [4], [40]
      )
    ]
    Khoảng biến thiên của mẫu số liệu ghép nhóm này là:],
  (
    [$31$],
    True([$15.5$]),
    [$74$],
    [$32$]
  ),
  loigiai: [
    Đầu mút trái của nhóm đầu tiên là $160$, đầu mút phải của nhóm cuối cùng là $175.5$.\
    Khoảng biến thiên:
    $ R = 175.5 - 160 = 15.5 " (cm)" $
  ]
)

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 2,
  [Bạn Trang thống kê lại chiều cao (đơn vị: $c m$) của các bạn học sinh nữ lớp 12C và lớp 12D năm học 2026 - 2027 ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Chiều cao* ($c m$)], [$[155; 160)$], [$[160; 165)$], [$[165; 170)$], [$[170; 175)$], [$[175; 180)$], [$[180; 185)$],
        [*Lớp 12C*], [2], [7], [12], [3], [0], [1],
        [*Lớp 12D*], [5], [9], [8], [2], [1], [0]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    [Chiều cao cao nhất của các bạn học sinh trong lớp 12D là $185$ $c m$],
    True([Khoảng biến thiên của chiều cao của các bạn học sinh nữ lớp 12C là $30$ $c m$]),
    True([Khoảng biến thiên của chiều cao của các bạn học sinh nữ lớp 12D là $25$ $c m$]),
    [Chiều cao của học sinh lớp 12C có độ phân tán bé hơn]
  ),
  loigiai: [
    a) Sai. Nhóm cuối cùng có tần số lớn hơn 0 của lớp 12D là nhóm $[175; 180)$, do đó chiều cao của học sinh lớp 12D chắc chắn nhỏ hơn $180$ $c m$.\
    b) Đúng. Đối với lớp 12C, nhóm đầu tiên có học sinh là $[155; 160)$ (đầu mút trái là $155$) và nhóm cuối cùng có học sinh là $[180; 185)$ (đầu mút phải là $185$). Khoảng biến thiên là $R_C = 185 - 155 = 30$ $c m$.\
    c) Đúng. Đối với lớp 12D, nhóm đầu tiên có học sinh là $[155; 160)$ (đầu mút trái là $155$) và nhóm cuối cùng có học sinh là $[175; 180)$ (đầu mút phải là $180$). Khoảng biến thiên là $R_D = 180 - 155 = 25$ $c m$.\
    d) Sai. Vì $R_C = 30 > R_D = 25$, nên độ phân tán của lớp 12C lớn hơn lớp 12D (không phải bé hơn).
  ]
)

// ─── CÂU 2 ───
#ds(
  dir: "doc",lines: 2,
  [Bảng sau biểu diễn mẫu số liệu ghép nhóm thống kê mức lương của một công ty (đơn vị: triệu đồng).
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*],
        [$[10; 15)$], [15],
        [$[15; 20)$], [18],
        [$[20; 25)$], [10],
        [$[25; 30)$], [10],
        [$[30; 35)$], [5],
        [$[35; 40)$], [2],
        [*Cộng*], [$n = 60$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm trên là $R = 30$]),
    True([Số phần tử của mẫu là $n = 60$]),
    True([Tứ phân vị thứ nhất là $Q_1 = 15$]),
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm trên là $Delta_Q = 3$]
  ),
  loigiai: [
    a) Đúng. Khoảng biến thiên là $R = 40 - 10 = 30$ triệu đồng.\
    b) Đúng. Cỡ mẫu là $n = 15 + 18 + 10 + 10 + 5 + 2 = 60$.\
    c) Đúng. Tìm nhóm chứa $Q_1$: vị trí tích lũy $n/4 = 15$. Tần số tích lũy của nhóm 1 $[10; 15)$ là 15. Vì tần số tích lũy bằng đúng 15 nên $Q_1 = 15$.\
    d) Sai. Tìm nhóm chứa $Q_3$: vị trí tích lũy $3n/4 = 45$. Tần số tích lũy đến nhóm 3 $[20; 25)$ là $15 + 18 + 10 = 43$. Tần số tích lũy đến nhóm 4 $[25; 30)$ là $43 + 10 = 53 >= 45$. Nhóm chứa $Q_3$ là nhóm $[25; 30)$.\
    Áp dụng công thức nội suy:
    $ Q_3 = 25 + (45 - 43)/10 dot 5 = 26 $
    Khoảng tứ phân vị: $ "IQR" = Q_3 - Q_1 = 26 - 15 = 11 $. Do đó $Delta_Q = 11$ (không phải là 3).
  ]
)

// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 2,
  [Bảng sau biểu diễn mẫu số liệu ghép nhóm về độ tuổi của cư dân trong một khu phố.
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*],
        [$[20; 30)$], [25],
        [$[30; 40)$], [20],
        [$[40; 50)$], [20],
        [$[50; 60)$], [15],
        [$[60; 70)$], [14],
        [$[70; 80)$], [6],
        [*Cộng*], [$n = 100$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm trên là $R = 60$]),
    [Tứ phân vị thứ nhất là $Q_1 = 35$],
    [Tứ phân vị thứ ba là $Q_3 = 160/3$],
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm trên là $Delta_Q = 65/3$]
  ),
  loigiai: [
    a) Đúng. Khoảng biến thiên là $R = 80 - 20 = 60$ tuổi.\
    b) Sai. Cỡ mẫu $n = 100$, vị trí tích lũy $n/4 = 25$. Tần số tích lũy của nhóm 1 $[20; 30)$ bằng đúng 25 nên $Q_1 = 30$ tuổi.\
    c) Sai. Vị trí tích lũy $3n/4 = 75$. Tần số tích lũy đến nhóm 3 $[40; 50)$ là $25 + 20 + 20 = 65$. Tần số tích lũy đến nhóm 4 $[50; 60)$ là $65 + 15 = 80 >= 75$. Nhóm chứa $Q_3$ là nhóm $[50; 60)$.\
    Áp dụng công thức nội suy:
    $ Q_3 = 50 + (75 - 65)/15 dot 10 = 50 + 20/3 = 170/3 $
    Do đó $Q_3 = 170/3$ (không phải $160/3$).\
    d) Sai. Khoảng tứ phân vị:
    $ "IQR" = Q_3 - Q_1 = 170/3 - 30 = 80/3 $
    Do đó $Delta_Q = 80/3$ (không phải $65/3$).
  ]
)

// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 2,
  [Biểu đồ dưới đây thống kê thời gian tập thể dục buổi sáng mỗi ngày trong tháng 9/2026 của bác Bình và bác An.
    #align(center)[
      #canvas(length: 0.8cm, {
        import draw: *
        // Trục tọa độ
        line((0, 0), (11, 0), mark: (end: ">"))
        line((0, 0), (0, 7), mark: (end: ">"))
        
        // Nhãn trục
        content((11, -0.4), [Thời gian (phút)])
        content((-0.8, 7), [Số ngày])
        
        // Vạch đứng trục tung
        for y in (5, 10, 15, 20, 25, 30) {
          let y_val = y / 5
          line((-0.1, y_val), (0.1, y_val))
          content((-0.4, y_val), str(y))
        }
        
        // Nhãn trục hoành
        let classes = (($[15; 20)$, 1), ($[20; 25)$, 3), ($[25; 30)$, 5), ($[30; 35)$, 7), ($[35; 40)$, 9))
        for (name, x) in classes {
          content((x + 0.5, -0.4), name)
        }
        
        // Vẽ cột của bác Bình (màu xanh nước biển đậm nhạt) và bác An (màu cam nhạt)
        // [15; 20) -> Bình: 5 (y = 1.0), An: 0
        rect((0.7, 0), (1.3, 1.0), stroke: 0.5pt + blue, fill: blue.lighten(60%))
        content((1.0, 1.2), [5])
        
        // [20; 25) -> Bình: 12 (y = 2.4), An: 25 (y = 5.0)
        rect((2.7, 0), (3.3, 2.4), stroke: 0.5pt + blue, fill: blue.lighten(60%))
        content((3.0, 2.6), [12])
        rect((3.3, 0), (3.9, 5.0), stroke: 0.5pt + orange, fill: orange.lighten(60%))
        content((3.6, 5.2), [25])
        
        // [25; 30) -> Bình: 8 (y = 1.6), An: 5 (y = 1.0)
        rect((4.7, 0), (5.3, 1.6), stroke: 0.5pt + blue, fill: blue.lighten(60%))
        content((5.0, 1.8), [8])
        rect((5.3, 0), (5.9, 1.0), stroke: 0.5pt + orange, fill: orange.lighten(60%))
        content((5.6, 1.2), [5])
        
        // [30; 35) -> Bình: 3 (y = 0.6), An: 0
        rect((6.7, 0), (7.3, 0.6), stroke: 0.5pt + blue, fill: blue.lighten(60%))
        content((7.0, 0.8), [3])
        
        // [35; 40) -> Bình: 2 (y = 0.4), An: 0
        rect((8.7, 0), (9.3, 0.4), stroke: 0.5pt + blue, fill: blue.lighten(60%))
        content((9.0, 0.6), [2])
      })
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm về thời gian tập thể dục buổi sáng của bác Bình là $25$ phút]),
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm về thời gian tập thể dục buổi sáng của bác An là $Delta_Q = 2$],
    True([Tứ phân vị thứ ba của mẫu số liệu ghép nhóm về thời gian tập thể dục buổi sáng của bác Bình là $Q_3 = 455/16$]),
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm về thời gian tập thể dục buổi sáng mỗi ngày của bác An lớn hơn bác Bình]
  ),
  loigiai: [
    a) Đúng. Khoảng biến thiên của bác Bình là $R = 40 - 15 = 25$ phút.\
    b) Sai. Đối với bác An, cỡ mẫu $n = 30$.
    - $Q_1$ ở vị trí tích lũy $7.5$. Nhóm chứa $Q_1$ là $[20; 25)$.
      $ Q_1 = 20 + (7.5 - 0)/25 dot 5 = 21.5 $
    - $Q_3$ ở vị trí tích lũy $22.5$. Nhóm chứa $Q_3$ là $[20; 25)$.
      $ Q_3 = 20 + (22.5 - 0)/25 dot 5 = 24.5 $
    Khoảng tứ phân vị: $ "IQR" = Q_3 - Q_1 = 24.5 - 21.5 = 3 $. Do đó $Delta_Q = 3$ (không phải là 2).\
    c) Đúng. Đối với bác Bình, cỡ mẫu $n = 30$.
    - Tần số tích lũy: nhóm 1 là 5; nhóm 2 là 17; nhóm 3 là 25.
    - $Q_3$ ở vị trí tích lũy $22.5$. Nhóm chứa $Q_3$ là $[25; 30)$.
      $ Q_3 = 25 + (22.5 - 17)/8 dot 5 = 25 + 27.5/8 = 455/16 $
    d) Sai. Tính khoảng tứ phân vị của bác Bình:
    - $Q_1$ ở vị trí tích lũy $7.5$. Nhóm chứa $Q_1$ là $[20; 25)$.
      $ Q_1 = 20 + (7.5 - 5)/12 dot 5 = 505/24 approx 21.04 $
    - Khoảng tứ phân vị của bác Bình là $ "IQR"_"Bình" = 455/16 - 505/24 = 355/48 approx 7.4 $.
    Vì $ "IQR"_"An" = 3 < "IQR"_"Bình" approx 7.4 $ nên khoảng tứ phân vị của bác An nhỏ hơn của bác Bình.
  ]
)

// ─── CÂU 5 ───
#ds(
  dir: "doc",lines: 2,
  [Hằng ngày ông Thắng đều đi xe buýt từ nhà đến cơ quan. Dưới đây là bảng thống kê thời gian của 100 lần ông Thắng đi xe buýt từ nhà đến cơ quan:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (phút)], [$[15; 18)$], [$[18; 21)$], [$[21; 24)$], [$[24; 27)$], [$[27; 30)$], [$[30; 33)$],
        [*Số lượt*], [22], [38], [27], [8], [4], [1]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Cỡ mẫu $n = 100$]),
    [Tứ phân vị thứ nhất của mẫu số liệu ghép nhóm là $Q_1 = 683/38$],
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm là $Delta_Q = 515/114$],
    True([Biết rằng trong 100 lần đi trên, chỉ có đúng một lần ông Thắng đi hết hơn 29 phút. Thời gian của lần đi đó là giá trị ngoại lệ của mẫu số liệu ghép nhóm])
  ),
  loigiai: [
    a) Đúng. Tổng số lượt đi là $n = 22 + 38 + 27 + 8 + 4 + 1 = 100$.\
    b) Sai. Nhóm chứa $Q_1$ (vị trí $n/4 = 25$) là nhóm $[18; 21)$.
    $ Q_1 = 18 + (25 - 22)/38 dot 3 = 18 + 9/38 = 693/38 $ (không phải $683/38$).\
    c) Sai. Nhóm chứa $Q_3$ (vị trí $3n/4 = 75$) là nhóm $[21; 24)$.
    $ Q_3 = 21 + (75 - 60)/27 dot 3 = 21 + 15/9 = 68/3 $
    Khoảng tứ phân vị: $ "IQR" = Q_3 - Q_1 = 68/3 - 693/38 = 505/114 $ (không phải $515/114$).\
    d) Đúng. Khoảng tứ phân vị là $ "IQR" = 505/114 approx 4.43 $.
    Ta xác định ranh giới trên của giá trị ngoại lệ:
    $ Q_3 + 1.5 dot "IQR" = 68/3 + 1.5 dot 505/114 = 6683/228 approx 29.31 " (phút)" $
    Vì chỉ có duy nhất 1 lần đi hơn 29 phút và nhóm cuối cùng $[30; 33)$ có tần số là 1, nên thời gian của lần đi này phải lớn hơn $30$ phút (lớn hơn ranh giới $29.31$ phút). Do đó, lần đi này là giá trị ngoại lệ.
  ]
)

// ─── CÂU 6 ───
#ds(
  dir: "doc",lines: 2,
  [Giả sử kết quả khảo sát hai khu vực A và B về độ tuổi kết hôn của một số phụ nữ vừa lập gia đình được cho ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tuổi kết hôn*], [$[19; 22)$], [$[22; 25)$], [$[25; 28)$], [$[28; 31)$], [$[31; 34)$],
        [*Khu vực A*], [10], [27], [31], [25], [7],
        [*Khu vực B*], [47], [40], [11], [2], [0]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm ứng với khu vực A là $15$ tuổi]),
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm ứng với khu vực B là $12$ tuổi]),
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm ứng với khu vực A là $61/3$],
    True([Nếu so sánh theo khoảng tứ phân vị thì phụ nữ ở khu vực B có độ tuổi kết hôn đồng đều hơn])
  ),
  loigiai: [
    a) Đúng. Nhóm đầu tiên $[19; 22)$ có đầu mút trái 19, nhóm cuối cùng có học sinh $[31; 34)$ có đầu mút phải 34. Khoảng biến thiên là $R_A = 34 - 19 = 15$ tuổi.\
    b) Đúng. Nhóm đầu tiên của B $[19; 22)$ -> 19, nhóm cuối cùng $[28; 31)$ -> 31. Khoảng biến thiên là $R_B = 31 - 19 = 12$ tuổi.\
    c) Sai. Đối với khu vực A, cỡ mẫu $n = 100$.
    - Nhóm chứa $Q_1$ (vị trí 25) là $[22; 25)$: $Q_1 = 22 + (25 - 10)/27 dot 3 = 71/3$.
    - Nhóm chứa $Q_3$ (vị trí 75) là $[28; 31)$: $Q_3 = 28 + (75 - 68)/25 dot 3 = 721/25 = 28.84$.
    Khoảng tứ phân vị: $ "IQR" = 28.84 - 71/3 = 388/75 approx 5.17 $ (không phải $61/3$).\
    d) Đúng. Đối với khu vực B:
    - Nhóm chứa $Q_1$ (vị trí 25) là $[19; 22)$: $Q_1 = 19 + (25 - 0)/47 dot 3 = 19 + 75/47 approx 20.60$.
    - Nhóm chứa $Q_3$ (vị trí 75) là $[22; 25)$: $Q_3 = 22 + (75 - 47)/40 dot 3 = 24.1$.
    Khoảng tứ phân vị: $ "IQR"_"B" = 24.1 - (19 + 75/47) approx 3.50 $.
    Vì $ "IQR"_"B" < "IQR"_"A" $ nên độ tuổi kết hôn ở khu vực B đồng đều hơn khu vực A.
  ]
)

// ─── CÂU 7 ───
#ds(
  dir: "doc",lines: 2,
  [Bảng sau thống kê tổng lượng mưa (đơn vị: $m m$) đo được vào tháng 7 từ năm 2008 đến 2027 tại một trạm quan trắc đặt ở Cà Mau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [341.4], [187.1], [242.2], [522.9], [251.4], [432.2], [200.7], [388.6], [258.4], [288.5],
        [298.1], [413.5], [413.5], [332.0], [421.0], [475.0], [400.0], [305.0], [520.0], [147.0]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu là $375.9$ $m m$]),
    [Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 1827/100$],
    True([Chia mẫu số liệu trên thành 4 nhóm: $[140; 240)$, $[240; 340)$, $[340; 440)$, $[440; 540)$ thì số tháng tương ứng là $3$, $7$, $7$, $3$ và khoảng biến thiên của mẫu số liệu ghép nhóm là $400$ $m m$]),
    True([Với việc chia nhóm ở ý c), khoảng tứ phân vị của mẫu số liệu ghép nhóm là $Delta'_Q = 1000/7$])
  ),
  loigiai: [
    a) Đúng. Với số liệu thô: Giá trị lớn nhất là $522.9$, nhỏ nhất là $147.0$. Khoảng biến thiên là $522.9 - 147.0 = 375.9$ $m m$.\
    b) Sai. Sắp xếp 20 giá trị thô theo thứ tự không giảm:
    $147.0; 187.1; 200.7; 242.2; 251.4; 258.4; 288.5; 298.1; 305.0; 332.0; 341.4; 388.6; 400.0; 413.5; 413.5; 421.0; 432.2; 475.0; 520.0; 522.9.$
    - $Q_1$ là trung vị của 10 số đầu: $Q_1 = (251.4 + 258.4)/2 = 254.9$.
    - $Q_3$ là trung vị của 10 số cuối: $Q_3 = (413.5 + 421.0)/2 = 417.25$.
    Khoảng tứ phân vị: $ "IQR" = 417.25 - 254.9 = 162.35 $ (không phải $18.27$).\
    c) Đúng. Nhóm $[140; 240)$ có 3 giá trị; nhóm $[240; 340)$ có 7 giá trị; nhóm $[340; 440)$ có 7 giá trị; nhóm $[440; 540)$ có 3 giá trị. Khoảng biến thiên ghép nhóm: $R_g = 540 - 140 = 400$ $m m$.\
    d) Đúng. Cỡ mẫu $n = 20$.
    - Nhóm chứa $Q_1$ (vị trí 5) là nhóm $[240; 340)$: $Q_1 = 240 + (5 - 3)/7 dot 100 = 1880/7$.
    - Nhóm chứa $Q_3$ (vị trí 15) là nhóm $[340; 440)$: $Q_3 = 340 + (15 - 10)/7 dot 100 = 2880/7$.
    Khoảng tứ phân vị ghép nhóm: $ Delta'_Q = 2880/7 - 1880/7 = 1000/7 $.
  ]
)

// ─── CÂU 8 ───
#ds(
  dir: "doc",lines: 2,
  [Kết quả đo chiều cao của 100 cây keo 3 năm tuổi tại một nông trường được cho ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Chiều cao* (m)], [$[8.4; 8.6)$], [$[8.6; 8.8)$], [$[8.8; 9.0)$], [$[9.0; 9.2)$], [$[9.2; 9.4)$],
        [*Số cây*], [5], [12], [25], [44], [14]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm là $1$ m]),
    [Tứ phân vị thứ ba của mẫu số liệu ghép nhóm là $Q_3 = 10.5$],
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm là $Delta_Q = 2.06$],
    True([Trong 100 cây keo trên có 1 cây cao 8.4 m. Thì chiều cao của cây keo này là giá trị ngoại lệ])
  ),
  loigiai: [
    a) Đúng. Khoảng biến thiên là $R = 9.4 - 8.4 = 1$ m.\
    b) Sai. $Q_3$ phải nằm trong khoảng chiều cao của cây từ $8.4$ m đến $9.4$ m, nên không thể là $10.5$.\
    c) Sai. Cỡ mẫu $n = 100$.
    - Nhóm chứa $Q_1$ (vị trí 25) là $[8.8; 9.0)$: $Q_1 = 8.8 + (25 - 17)/25 dot 0.2 = 8.864$ m.
    - Nhóm chứa $Q_3$ (vị trí 75) là $[9.0; 9.2)$: $Q_3 = 9.0 + (75 - 42)/44 dot 0.2 = 9.15$ m.
    Khoảng tứ phân vị: $ "IQR" = Q_3 - Q_1 = 9.15 - 8.864 = 0.286$ m (không phải $2.06$).\
    d) Đúng. Ranh giới dưới của giá trị ngoại lệ:
    $ Q_1 - 1.5 dot "IQR" = 8.864 - 1.5 dot 0.286 = 8.435 " (m)" $
    Vì $8.4 < 8.435$ m nên chiều cao $8.4$ m của cây keo này nhỏ hơn ranh giới dưới, do đó là giá trị ngoại lệ.
  ]
)

// ─── CÂU 9 ───
#ds(
  dir: "doc",lines: 2,
  [Thống kê điểm trung bình môn Toán của một số học sinh lớp 11 được cho ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Khoảng điểm*], [$[6.5; 7)$], [$[7; 7.5)$], [$[7.5; 8)$], [$[8; 8.5)$], [$[8.5; 9)$], [$[9; 9.5)$], [$[9.5; 10)$],
        [*Tần số*], [8], [10], [16], [24], [13], [7], [4]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    [Khoảng biến thiên của mẫu số liệu là $R = 4$],
    True([Số trung bình của mẫu số liệu xấp xỉ bằng $8.12$]),
    [Mốt của mẫu số liệu là $M_o = 6.21$],
    [Khoảng tứ phân vị của mẫu số liệu ghép nhóm là $Delta_Q = 2.05$]
  ),
  loigiai: [
    a) Sai. Khoảng biến thiên là $R = 10 - 6.5 = 3.5$.\
    b) Đúng. Số trung bình cộng:
    $ overline(x) = (8 dot 6.75 + 10 dot 7.25 + 16 dot 7.75 + 24 dot 8.25 + 13 dot 8.75 + 7 dot 9.25 + 4 dot 9.75) / 82 = 666/82 approx 8.12 $\
    c) Sai. Nhóm có tần số lớn nhất là $[8; 8.5)$ (tần số 24). Mốt của mẫu số liệu:
    $ M_o = 8 + (24 - 16)/((24 - 16) + (24 - 13)) dot 0.5 = 8 + 8/19 dot 0.5 approx 8.21 $ (không phải $6.21$).\
    d) Sai. Cỡ mẫu $n = 82$.
    - Nhóm chứa $Q_1$ (vị trí 20.5) là $[7.5; 8)$: $Q_1 = 7.5 + (20.5 - 18)/16 dot 0.5 = 7.578125$.
    - Nhóm chứa $Q_3$ (vị trí 61.5) là $[8.5; 9)$: $Q_3 = 8.5 + (61.5 - 58)/13 dot 0.5 approx 8.6346$.
    Khoảng tứ phân vị: $ "IQR" = Q_3 - Q_1 approx 8.6346 - 7.5781 = 1.0565 approx 1.06$ (không phải $2.05$).
  ]
)

// ─── CÂU 10 ───
#ds(
  dir: "doc",lines: 2,
  [Một công ty cung cấp nước sạch thống kê lượng nước các hộ gia đình trong một khu vực tiêu thụ trong một tháng ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Lượng nước tiêu thụ* ($m^3$)], [$[3; 6)$], [$[6; 9)$], [$[9; 12)$], [$[12; 15)$], [$[15; 18)$],
        [*Số hộ gia đình*], [24], [57], [42], [29], [8]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình của mẫu số liệu ghép nhóm đã cho là $9.375$]),
    True([Mốt của mẫu số liệu là $M_o = 8.0625$]),
    True([Khoảng biến thiên của mẫu số liệu ghép nhóm đã cho là $15$]),
    [Công ty muốn gửi một thông báo khuyến nghị tiết kiệm nước đến $25\%$ các hộ gia đình có lượng nước tiêu thụ cao nhất. Khi đó công ty nên gửi thông báo tiết kiệm nước đến các hộ gia đình có lượng nước tiêu thụ từ $14.79$ $m^3$ nước trở lên]
  ),
  loigiai: [
    a) Đúng. Số trung bình cộng:
    $ overline(x) = (24 dot 4.5 + 57 dot 7.5 + 42 dot 10.5 + 29 dot 13.5 + 8 dot 16.5) / 160 = 1500/160 = 9.375 $\
    b) Đúng. Nhóm có tần số lớn nhất là $[6; 9)$ (tần số 57). Mốt của mẫu số liệu:
    $ M_o = 6 + (57 - 24)/((57 - 24) + (57 - 42)) dot 3 = 6 + 33/48 dot 3 = 8.0625 $\
    c) Đúng. Khoảng biến thiên là $R = 18 - 3 = 15$.\
    d) Sai. Các hộ gia đình có lượng nước tiêu thụ trong nhóm 25% cao nhất tương ứng với phần dữ liệu từ tứ phân vị thứ ba $Q_3$ trở lên.
    - Cỡ mẫu $n = 160$, vị trí tích lũy $3n/4 = 120$.
    - Tần số tích lũy đến nhóm 3 $[9; 12)$ là $24 + 57 + 42 = 123 >= 120$. Nhóm chứa $Q_3$ là nhóm $[9; 12)$.
    $ Q_3 = 9 + (120 - 81)/42 dot 3 = 9 + 39/14 approx 11.79 " (m"^3")" $
    Do đó công ty nên gửi thông báo đến các hộ gia đình tiêu thụ từ $11.79$ $m^3$ trở lên (không phải $14.79$ $m^3$).
  ]
)


#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (10 câu)], count: auto)

// ─── CÂU 1 ───
#tln(
  dir: "doc",lines: 0,
  [Bảng dưới biểu diễn mẫu số liệu ghép nhóm về chiều cao (đơn vị: $c m$) của $36$ học sinh nam lớp 12 ở một trường trung học phổ thông:
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*],
        [$[160; 163)$], [6],
        [$[163; 166)$], [11],
        [$[166; 169)$], [9],
        [$[169; 172)$], [7],
        [$[172; 175)$], [3],
        [*Cộng*], [$n = 36$]
      )
    ]
    Tìm khoảng biến thiên của mẫu số liệu ghép nhóm đó.],
  [$15$],
  loigiai: [
    Nhóm đầu tiên là $[160; 163)$ với đầu mút trái $160$.     Nhóm cuối cùng là $[172; 175)$ với đầu mút phải $175$.     Khoảng biến thiên của mẫu số liệu ghép nhóm là:
    $ R = 175 - 160 = 15 " (cm)" $
    Đáp số: $15$.
  ]
)

// ─── CÂU 2 ───
#tln(
  dir: "doc",lines: 2,
  [Bảng dưới biểu diễn mẫu số liệu ghép nhóm về chiều cao của $42$ mẫu cây ở một vườn thực vật (đơn vị: $c m$).
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Tần số*], [*Tần số tích lũy*],
        [$[40; 45)$], [5], [5],
        [$[45; 50)$], [10], [15],
        [$[50; 55)$], [7], [22],
        [$[55; 60)$], [9], [31],
        [$[60; 65)$], [7], [38],
        [$[65; 70)$], [4], [42],
        [*Cộng*], [$n = 42$], []
      )
    ]
    Tính khoảng tứ phân vị của mẫu số liệu ghép nhóm đó (làm tròn kết quả đến hàng phần mười).],
  [$12.6$],
  loigiai: [
    Cỡ mẫu $n = 42$.     - Tìm $Q_1$: $n/4 = 10.5$. Tích lũy nhóm trước là 5. Nhóm chứa $Q_1$ là $[45; 50)$.
      $ Q_1 = 45 + (10.5 - 5)/10 dot 5 = 47.75 " (cm)" $
    - Tìm $Q_3$: $3n/4 = 31.5$. Tích lũy trước nhóm 5 $[60; 65)$ là 31. Nhóm chứa $Q_3$ là $[60; 65)$.
      $ Q_3 = 60 + (31.5 - 31)/7 dot 5 = 60 + 2.5/7 = 60 + 5/14 approx 60.36 " (cm)" $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 60 + 5/14 - 47.75 = 12.25 + 5/14 = 176.5/14 = 353/28 approx 12.61 " (cm)" $
    Làm tròn kết quả đến hàng phần mười ta được $12.6$.
    Đáp số: $12.6$.
  ]
)

// ─── CÂU 3 ───
#tln(
  dir: "doc",lines: 2,
  [Bảng sau thống kê cân nặng của $50$ quả xoài Thanh Ca được lựa chọn ngẫu nhiên sau khi thu hoạch ở một nông trường:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Cân nặng* ($g$)], [$[250; 290)$], [$[290; 330)$], [$[330; 370)$], [$[370; 410)$], [$[410; 450)$],
        [*Số quả xoài*], [3], [13], [18], [11], [5]
      )
    ]
    Khoảng tứ phân vị của mẫu số liệu ghép nhóm đó bằng $a/b$ với $a/b$ là phân số tối giản và $a, b in ZZ$. Tính giá trị biểu thức $T = a + b$.],
  [$9223$],
  loigiai: [
    Cỡ mẫu $n = 50$.     - Tìm $Q_1$: $n/4 = 12.5$. Nhóm chứa $Q_1$ là $[290; 330)$ (tần số tích lũy là 16).
      $ Q_1 = 290 + (12.5 - 3)/13 dot 40 = 290 + 380/13 = 4150/13 $
    - Tìm $Q_3$: $3n/4 = 37.5$. Nhóm chứa $Q_3$ là $[370; 410)$ (tần số tích lũy trước đó là 34).
      $ Q_3 = 370 + (37.5 - 34)/11 dot 40 = 370 + 140/11 = 4210/11 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 4210/11 - 4150/13 = (4210 dot 13 - 4150 dot 11)/143 = 9080/143 $
    Ta thấy $143 = 11 dot 13$. Số $9080$ không chia hết cho $11$ và $13$ nên phân số $9080/143$ là tối giản.     Do đó $a = 9080, b = 143$.     Giá trị biểu thức:
    $ T = a + b = 9080 + 143 = 9223 $
    Đáp số: $9223$.
  ]
)

// ─── CÂU 4 ───
#tln(
  dir: "doc",lines: 2,
  [Thống kê số lượt đặt bàn trực tuyến mỗi ngày của một nhà hàng trong 92 ngày, ta thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Số lượt đặt bàn*], [$[1; 6)$], [$[6; 11)$], [$[11; 16)$], [$[16; 21)$], [$[21; 26)$],
        [*Số ngày*], [14], [30], [25], [18], [5]
      )
    ]
    Hãy tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm đó.],
  [$8.5$],
  loigiai: [
    Tổng số ngày $n = 92$.     - Tìm $Q_1$: $n/4 = 23$. Nhóm chứa $Q_1$ là $[6; 11)$.
      $ Q_1 = 6 + (23 - 14)/30 dot 5 = 7.5 $
    - Tìm $Q_3$: $3n/4 = 69$. Nhóm chứa $Q_3$ có tần số tích lũy đúng bằng 69 ở nhóm $[11; 16)$, nên $Q_3 = 16$.
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 16 - 7.5 = 8.5 $
    Đáp số: $8.5$.
  ]
)

// ─── CÂU 5 ───
#tln(
  dir: "doc",lines: 2,
  [Thời gian luyện tập trong một ngày (tính theo giờ) của một số vận động viên được ghi lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (giờ)], [$[0; 2)$], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$],
        [*Số vận động viên*], [3], [8], [12], [12], [4]
      )
    ]
    Hãy tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm).],
  [$3.35$],
  loigiai: [
    Tổng số vận động viên $n = 3 + 8 + 12 + 12 + 4 = 39$.     - Tìm $Q_1$: $n/4 = 9.75$. Nhóm chứa $Q_1$ là $[2; 4)$ (tần số tích lũy là 11).
      $ Q_1 = 2 + (9.75 - 3)/8 dot 2 = 2 + 1.6875 = 3.6875 " (giờ)" $
    - Tìm $Q_3$: $3n/4 = 29.25$. Nhóm chứa $Q_3$ là $[6; 8)$ (tần số tích lũy trước đó là 23).
      $ Q_3 = 6 + (29.25 - 23)/12 dot 2 = 6 + 1.04167 = 7.04167 " (giờ)" $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 7.04167 - 3.6875 = 3.35417 approx 3.35 " (giờ)" $
    Đáp số: $3.35$.
  ]
)

// ─── CÂU 6 ───
#tln(
  dir: "doc",lines: 2,
  [Một người thống kê lại thời gian thực hiện các cuộc gọi điện thoại của người đó trong một tuần ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (giây)], [$[0; 60)$], [$[60; 120)$], [$[120; 180)$], [$[180; 240)$], [$[240; 300)$], [$[300; 360)$],
        [*Số cuộc gọi*], [8], [10], [7], [5], [2], [1]
      )
    ]
    Hãy tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm).],
  [$116.36$],
  loigiai: [
    Tổng số cuộc gọi $n = 8 + 10 + 7 + 5 + 2 + 1 = 33$.     - Tìm $Q_1$: $n/4 = 8.25$. Nhóm chứa $Q_1$ là $[60; 120)$ (tần số tích lũy là 18).
      $ Q_1 = 60 + (8.25 - 8)/10 dot 60 = 61.5 " (giây)" $
    - Tìm $Q_3$: $3n/4 = 24.75$. Nhóm chứa $Q_3$ là $[120; 180)$ (tần số tích lũy trước đó là 18).
      $ Q_3 = 120 + (24.75 - 18)/7 dot 60 = 1245/7 approx 177.857 " (giây)" $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 1245/7 - 61.5 = 813/7 approx 116.357 " (giây)" $
    Làm tròn kết quả đến hàng phần trăm ta được $116.36$.
    Đáp số: $116.36$.
  ]
)

// ─── CÂU 7 ───
#tln(
  dir: "doc",lines: 2,
  [Số điểm một cầu thủ bóng rổ ghi được trong $20$ trận đấu được cho ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm số*], [$[5.5; 10.5)$], [$[10.5; 15.5)$], [$[15.5; 20.5)$], [$[20.5; 25.5)$],
        [*Số trận*], [3], [9], [2], [6]
      )
    ]
    Hãy tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm).],
  [$9.72$],
  loigiai: [
    Tổng số trận $n = 20$.     - Tìm $Q_1$: $n/4 = 5$. Nhóm chứa $Q_1$ là $[10.5; 15.5)$ (tần số tích lũy trước đó là 3).
      $ Q_1 = 10.5 + (5 - 3)/9 dot 5 = 10.5 + 10/9 = 209/18 approx 11.611 $
    - Tìm $Q_3$: $3n/4 = 15$. Nhóm chứa $Q_3$ là $[20.5; 25.5)$ (tần số tích lũy trước đó là 14).
      $ Q_3 = 20.5 + (15 - 14)/6 dot 5 = 20.5 + 5/6 = 64/3 approx 21.333 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 64/3 - 209/18 = 175/18 approx 9.722 $
    Làm tròn kết quả đến hàng phần trăm ta được $9.72$.
    Đáp số: $9.72$.
  ]
)

// ─── CÂU 8 ───
#tln(
  dir: "doc",lines: 2,
  [Thời gian sử dụng điện thoại trong một ngày của $30$ sinh viên được ghi lại ở bảng sau (đơn vị: phút):
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (phút)], [$[0; 60)$], [$[60; 120)$], [$[120; 180)$], [$[180; 240)$], [$[240; 300)$],
        [*Số sinh viên*], [2], [7], [7], [10], [4]
      )
    ]
    Hãy tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm).],
  [$111.86$],
  loigiai: [
    Tổng số sinh viên $n = 30$.     - Tìm $Q_1$: $n/4 = 7.5$. Nhóm chứa $Q_1$ là $[60; 120)$ (tần số tích lũy trước đó là 2).
      $ Q_1 = 60 + (7.5 - 2)/7 dot 60 = 60 + 330/7 = 750/7 approx 107.143 " (phút)" $
    - Tìm $Q_3$: $3n/4 = 22.5$. Nhóm chứa $Q_3$ là $[180; 240)$ (tần số tích lũy trước đó là 16).
      $ Q_3 = 180 + (22.5 - 16)/10 dot 60 = 180 + 39 = 219 " (phút)" $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 219 - 750/7 = 783/7 approx 111.857 " (phút)" $
    Làm tròn kết quả đến hàng phần trăm ta được $111.86$.
    Đáp số: $111.86$.
  ]
)

// ─── CÂU 9 ───
#tln(
  dir: "doc",lines: 2,
  [Điểm thi môn Toán (thang điểm 100, điểm được làm tròn đến 1) của $60$ thí sinh được cho ở mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số thí sinh*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số thí sinh*], [12], [10], [6], [3], [1]
      )
    ]
    Tính khoảng tứ phân vị của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần trăm).],
  [$23.67$],
  loigiai: [
    Cỡ mẫu $n = 60$.     - Tìm $Q_1$: $n/4 = 15$.
      Tần số tích lũy đến nhóm 4 $[29.5; 39.5)$ là $1 + 2 + 4 + 6 = 13 < 15$.
      Tần số tích lũy đến nhóm 5 $[39.5; 49.5)$ là $13 + 15 = 28 >= 15$.
      Nhóm chứa $Q_1$ là nhóm $[39.5; 49.5)$.
      $ Q_1 = 39.5 + (15 - 13)/15 dot 10 = 39.5 + 4/3 = 245/6 approx 40.833 $
    - Tìm $Q_3$: $3n/4 = 45$.
      Tần số tích lũy đến nhóm 6 $[49.5; 59.5)$ là $28 + 12 = 40 < 45$.
      Tần số tích lũy đến nhóm 7 $[59.5; 69.5)$ là $40 + 10 = 50 >= 45$.
      Nhóm chứa $Q_3$ là nhóm $[59.5; 69.5)$.
      $ Q_3 = 59.5 + (45 - 40)/10 dot 10 = 64.5 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 64.5 - 245/6 = 142/6 = 71/3 approx 23.667 $
    Làm tròn kết quả đến hàng phần trăm ta được $23.67$.
    Đáp số: $23.67$.
  ]
)

// ─── CÂU 10 ───
#tln(
  dir: "doc",lines: 2,
  [Kết quả điều tra về số giờ làm thêm trong một tuần của $100$ sinh viên được cho ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Số giờ làm thêm*], [$[2; 4)$], [$[4; 6)$], [$[6; 8)$], [$[8; 10)$], [$[10; 12)$],
        [*Số sinh viên*], [12], [20], [37], [21], [10]
      )
    ]
    Tìm khoảng tứ phân vị của mẫu số liệu ghép nhóm đó (làm tròn kết quả đến hàng phần trăm).],
  [$3.27$],
  loigiai: [
    Cỡ mẫu $n = 100$.     - Tìm $Q_1$: $n/4 = 25$. Nhóm chứa $Q_1$ là nhóm $[4; 6)$ (tần số tích lũy của nhóm này là 32).
      $ Q_1 = 4 + (25 - 12)/20 dot 2 = 4 + 1.3 = 5.3 $
    - Tìm $Q_3$: $3n/4 = 75$. Nhóm chứa $Q_3$ là nhóm $[8; 10)$ (tần số tích lũy trước đó là 69).
      $ Q_3 = 8 + (75 - 69)/21 dot 2 = 8 + 12/21 = 8 + 4/7 = 60/7 approx 8.5714 $
    - Khoảng tứ phân vị:
      $ "IQR" = Q_3 - Q_1 = 60/7 - 5.3 = 22.9/7 = 229/70 approx 3.2714 $
    Làm tròn kết quả đến hàng phần trăm ta được $3.27$.
    Đáp số: $3.27$.
  ]
)
