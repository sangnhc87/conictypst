#import "../preamble.typ": *
#import "../../../math-sym.typ": *

#show math.frac: math.display

#muc([Đề Luyện Tập Số 03 — Phương Sai & Độ Lệch Chuẩn])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (20 câu)], count: auto)

// ─── CÂU 1 ───
#tn(
  dir: "doc",lines: 0,
  [Số đặc trưng nào không sử dụng thông tin của nhóm số liệu đầu tiên và nhóm số liệu cuối cùng?],
  (
    [Khoảng biến thiên],
    True([Khoảng tứ phân vị]),
    [Phương sai],
    [Độ lệch chuẩn]
  ),
  loigiai: [
    #step[Khoảng biến thiên $R = u_k - u_0$ sử dụng trực tiếp đầu mút của nhóm cuối và nhóm đầu.]
    #step[Phương sai và độ lệch chuẩn tính toán dựa trên số trung bình, tức là dùng tất cả các nhóm (bao gồm nhóm đầu và nhóm cuối).]
    #step[Khoảng tứ phân vị $"IQR" = Q_3 - Q_1$ chỉ sử dụng thông tin của nhóm chứa $Q_1$ và $Q_3$, không phụ thuộc vào nhóm đầu tiên hay nhóm cuối cùng.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)// ─── CÂU 2 ───
#tn(
  dir: "doc",lines: 0,
  [Nếu thay tất cả các tần số trong mẫu số liệu ghép nhóm bằng $4$ thì số đặc trưng nào sau đây không thay đổi?],
  (
    True([Khoảng biến thiên]),
    [Khoảng tứ phân vị],
    [Phương sai],
    [Độ lệch chuẩn]
  ),
  loigiai: [
    #step[Khoảng biến thiên của mẫu số liệu ghép nhóm $R = u_k - u_0$ chỉ phụ thuộc vào đầu mút phải của nhóm cuối cùng và đầu mút trái của nhóm đầu tiên, hoàn toàn không phụ thuộc vào tần số của các nhóm.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)// ─── CÂU 3 ───
#tn(
  dir: "doc",lines: 0,
  [Trong các khẳng định sau, khẳng định nào *sai*?],
  (
    [Phương sai luôn luôn là số không âm],
    [Phương sai là bình phương của độ lệch chuẩn],
    [Phương sai càng lớn thì độ phân tán quanh số trung bình càng lớn],
    True([Phương sai luôn luôn lớn hơn độ lệch chuẩn])
  ),
  loigiai: [
    #step[Khẳng định D sai vì nếu phương sai $S^2 < 1$ thì độ lệch chuẩn $S = sqrt(S^2) > S^2$. Ví dụ, nếu $S^2 = 0.25$ thì $S = 0.5$, khi đó phương sai nhỏ hơn độ lệch chuẩn.]
    #step[Vậy đáp án là D.]
    #resetstep()
  ]
)// ─── CÂU 4 ───
#tn(
  dir: "doc",lines: 0,
  [Doanh thu bán hàng trong $20$ ngày được lựa chọn ngẫu nhiên của một cửa hàng được ghi lại ở bảng sau (đơn vị: triệu đồng):
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[5; 7)$], [$[7; 9)$], [$[9; 11)$], [$[11; 13)$], [$[13; 15)$],
        [*Số ngày*], [2], [7], [7], [3], [1]
      )
    ]
    Số trung bình của mẫu số liệu trên thuộc khoảng nào trong các khoảng dưới đây?],
  (
    [$[7; 9)$],
    True([$[9; 11)$]),
    [$[11; 13)$],
    [$[13; 15)$]
  ),
  loigiai: [
    #step[Ta tính giá trị đại diện (trung điểm) $x_i$ của từng nhóm:]
    #step[Nhóm $[5; 7)$: $x_1 = 6$]
    #step[Nhóm $[7; 9)$: $x_2 = 8$]
    #step[Nhóm $[9; 11)$: $x_3 = 10$]
    #step[Nhóm $[11; 13)$: $x_4 = 12$]
    #step[Nhóm $[13; 15)$: $x_5 = 14$]
    #step[Số trung bình cộng của mẫu số liệu:]
    #step[$ overline(x) = (2 dot 6 + 7 dot 8 + 7 dot 10 + 3 dot 12 + 1 dot 14) / 20 = (12 + 56 + 70 + 36 + 14) / 20 = 188/20 = 9.4 " (triệu đồng)" $]
    #step[Giá trị $9.4$ thuộc khoảng $[9; 11)$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)// ─── CÂU 5 ───
#tn(
  dir: "doc",lines: 0,
  [Một siêu thị thống kê số tiền (đơn vị: chục nghìn đồng) mà $44$ khách hàng mua hàng ở siêu thị đó trong một ngày. Số liệu được ghi lại trong bảng dưới đây.
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Giá trị đại diện*], [*Tần số*],
        [$[40; 45)$], [42.5], [4],
        [$[45; 50)$], [47.5], [14],
        [$[50; 55)$], [52.5], [8],
        [$[55; 60)$], [57.5], [10],
        [$[60; 65)$], [62.5], [6],
        [$[65; 70)$], [67.5], [2],
        [*Cộng*], [], [$n = 44$]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm trên là:],
  (
    [$53.2$],
    True([$46.1$]),
    [$30$],
    [$11$]
  ),
  loigiai: [
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (4 dot 42.5 + 14 dot 47.5 + 8 dot 52.5 + 10 dot 57.5 + 6 dot 62.5 + 2 dot 67.5) / 44 = 2340/44 = 585/11 approx 53.18 $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 4 dot 42.5^2 + 14 dot 47.5^2 + 8 dot 52.5^2 + 10 dot 57.5^2 + 6 dot 62.5^2 + 2 dot 67.5^2 = 126475 $]
    #step[Phương sai:]
    #step[$ S^2 = 126475/44 - (585/11)^2 = 22325/484 approx 46.126 $]
    #step[Làm tròn kết quả đến hàng phần mười ta được $46.1$.]
    #step[Vậy đáp án là B.]
    #resetstep()
  ]
)// ─── CÂU 6 ───
#tn(
  dir: "doc",lines: 0,
  [Một nhà vườn thống kê khối lượng (đơn vị: kg) của $44$ giỏ trái cây được bán ra trong một ngày:
    #align(center)[
      #table(
        columns: (auto, auto),
        align: center + horizon,
        [*Khối lượng*], [*Số giỏ*],
        [$[40; 45)$], [4],
        [$[45; 50)$], [14],
        [$[50; 55)$], [8],
        [$[55; 60)$], [10],
        [$[60; 65)$], [6],
        [$[65; 70)$], [2]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm trên (làm tròn kết quả đến hàng phần mười) là:],
  (
    True([$6.8$]),
    [$7.3$],
    [$3.3$],
    [$46.1$]
  ),
  loigiai: [
    #step[Ta tính được phương sai $S^2 approx 46.126$.]
    #step[Độ lệch chuẩn là:]
    #step[$ S = sqrt(S^2) = sqrt(46.126) approx 6.79 " (kg)" $]
    #step[Làm tròn đến hàng phần mười ta được $6.8$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)// ─── CÂU 7 ───
#tn(
  dir: "doc",lines: 0,
  [Mỗi ngày bác Hương đều đi bộ để rèn luyện sức khoẻ. Quãng đường đi bộ mỗi ngày (đơn vị: km) của bác Hương trong $20$ ngày được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Quãng đường* (km)], [$[2.7; 3.0)$], [$[3.0; 3.3)$], [$[3.3; 3.6)$], [$[3.6; 3.9)$], [$[3.9; 4.2)$],
        [*Số ngày*], [3], [6], [5], [4], [2]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm là:],
  (
    [$3.39$],
    [$11.62$],
    True([$0.1314$]),
    [$0.36$]
  ),
  loigiai: [
    #step[Giá trị đại diện của các nhóm lần lượt là: $2.85; 3.15; 3.45; 3.75; 4.05$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (3 dot 2.85 + 6 dot 3.15 + 5 dot 3.45 + 4 dot 3.75 + 2 dot 4.05) / 20 = 67.8/20 = 3.39 " (km)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 3 dot 2.85^2 + 6 dot 3.15^2 + 5 dot 3.45^2 + 4 dot 3.75^2 + 2 dot 4.05^2 = 232.47 $]
    #step[Phương sai:]
    #step[$ S^2 = 232.47/20 - 3.39^2 = 11.6235 - 11.4921 = 0.1314 $]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)// ─── CÂU 8 ───
#tn(
  dir: "doc",lines: 0,
  [Một người chạy bộ ghi lại cự ly (đơn vị: km) của $20$ buổi tập trong tháng:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Cự ly* (km)], [$[2.7; 3.0)$], [$[3.0; 3.3)$], [$[3.3; 3.6)$], [$[3.6; 3.9)$], [$[3.9; 4.2)$],
        [*Số buổi*], [3], [6], [5], [4], [2]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$3.41$],
    [$11.62$],
    [$0.017$],
    True([$0.36$])
  ),
  loigiai: [
    #step[Ta tính được phương sai $S^2 = 0.1314$.]
    #step[Độ lệch chuẩn là:]
    #step[$ S = sqrt(S^2) = sqrt(0.1314) approx 0.3625 " (km)" $]
    #step[Giá trị này gần nhất với $0.36$.]
    #step[Vậy đáp án là D.]
    #resetstep()
  ]
)// ─── CÂU 9 ───
#tn(
  dir: "doc",lines: 0,
  [Bạn Chi rất thích nhảy hiện đại. Thời gian tập nhảy mỗi ngày trong thời gian gần đây của bạn Chi được thống kê lại ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (phút)], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$], [$[40; 45)$],
        [*Số ngày*], [6], [6], [4], [1], [1]
      )
    ]
    Phương sai của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$31.77$],
    [$32$],
    True([$31.25$]),
    [$31.44$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $22.5; 27.5; 32.5; 37.5; 42.5$.]
    #step[Tổng số ngày $n = 18$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (6 dot 22.5 + 6 dot 27.5 + 4 dot 32.5 + 1 dot 37.5 + 1 dot 42.5) / 18 = 510/18 = 85/3 approx 28.33 " (phút)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 6 dot 22.5^2 + 6 dot 27.5^2 + 4 dot 32.5^2 + 1 dot 37.5^2 + 1 dot 42.5^2 = 15012.5 $]
    #step[Phương sai:]
    #step[$ S^2 = 15012.5/18 - (85/3)^2 = 30025/36 - 7225/9 = 1125/36 = 31.25 $]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)// ─── CÂU 10 ───
#tn(
  dir: "doc",lines: 0,
  [Dũng là học sinh rất giỏi chơi rubik, bạn có thể giải nhiều loại khối rubik khác nhau. Trong một lần tập luyện giải khối rubik $3 times 3$, bạn Dũng đã tự thống kê lại thời gian giải rubik trong $25$ lần giải liên tiếp ở bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian giải* (giây)], [$[8; 10)$], [$[10; 12)$], [$[12; 14)$], [$[14; 16)$], [$[16; 18)$],
        [*Số lần*], [4], [6], [8], [4], [3]
      )
    ]
    Độ lệch chuẩn của mẫu số liệu ghép nhóm có giá trị gần nhất với giá trị nào dưới đây?],
  (
    [$5.98$],
    [$6$],
    True([$2.44$]),
    [$2.5$]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $9; 11; 13; 15; 17$.]
    #step[Tổng số lần giải $n = 25$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (4 dot 9 + 6 dot 11 + 8 dot 13 + 4 dot 15 + 3 dot 17) / 25 = 317/25 = 12.68 " (giây)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 4 dot 9^2 + 6 dot 11^2 + 8 dot 13^2 + 4 dot 15^2 + 3 dot 17^2 = 4169 $]
    #step[Phương sai:]
    #step[$ S^2 = 4169/25 - 12.68^2 = 166.76 - 160.7824 = 5.9776 $]
    #step[Độ lệch chuẩn:]
    #step[$ S = sqrt(5.9776) approx 2.4449 " (giây)" $]
    #step[Giá trị này gần nhất với $2.44$.]
    #step[Vậy đáp án là C.]
    #resetstep()
  ]
)// ─── CÂU 11 ───
#tn(
  dir: "doc",lines: 0,
  [Để đánh giá chất lượng của một loại pin điện thoại mới, người ta ghi lại thời gian nghe nhạc liên tục của điện thoại được sạc đầy pin cho đến khi hết pin cho kết quả sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Thời gian* (giờ)], [$[5; 5.5)$], [$[5.5; 6)$], [$[6; 6.5)$], [$[6.5; 7)$], [$[7; 7.5)$],
        [*Số chiếc* (tần số)], [2], [8], [15], [10], [5]
      )
    ]
    Tính độ lệch chuẩn của mẫu số liệu ghép nhóm trên (làm tròn đến 4 chữ số thập phân).],
  (
    [$0.4252$],
    [$0.5314$],
    [$0.6214$],
    True([$0.5268$])
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $5.25; 5.75; 6.25; 6.75; 7.25$.]
    #step[Cỡ mẫu $n = 40$.]
    #step[Số trung bình cộng:]
    #step[$ overline(x) = (2 dot 5.25 + 8 dot 5.75 + 15 dot 6.25 + 10 dot 6.75 + 5 dot 7.25) / 40 = 254/40 = 6.35 " (giờ)" $]
    #step[Tính $sum f_i x_i^2$:]
    #step[$ sum f_i x_i^2 = 2 dot 5.25^2 + 8 dot 5.75^2 + 15 dot 6.25^2 + 10 dot 6.75^2 + 5 dot 7.25^2 = 1624 $]
    #step[Phương sai:]
    #step[$ S^2 = 1624/40 - 6.35^2 = 40.6 - 40.3225 = 0.2775 $]
    #step[Độ lệch chuẩn:]
    #step[$ S = sqrt(0.2775) approx 0.52678 " (giờ)" $]
    #step[Làm tròn đến 4 chữ số thập phân ta được $0.5268$.]
    #step[Vậy đáp án là D.]
    #resetstep()
  ]
)// ─── CÂU 12 ───
#tn(
  dir: "doc",lines: 0,
  [Người ta ghi lại tiền lãi (đơn vị: triệu đồng) của một số nhà đầu tư (với số tiền đầu tư như nhau) khi đầu tư vào hai lĩnh vực A, B cho kết quả như sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Tiền lãi*], [$[5; 10)$], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$],
        [*Lĩnh vực A*], [2], [5], [8], [6], [4],
        [*Lĩnh vực B*], [8], [4], [2], [5], [6]
      )
    ]
    Tính độ lệch chuẩn cho các mẫu số liệu về tiền lãi của các nhà đầu tư ở lĩnh vực B.],
  (
    True([$8.039$]),
    [$8.5314$],
    [$8.6214$],
    [$8.5268$]
  ),
  loigiai: [
    #step[Giá trị đại diện của các nhóm lần lượt là: $7.5; 12.5; 17.5; 22.5; 27.5$.]
    #step[Xét lĩnh vực B: Cỡ mẫu $n = 8 + 4 + 2 + 5 + 6 = 25$.]
    #step[Số trung bình cộng của lĩnh vực B:]
    #step[$ overline(x)_B = (8 dot 7.5 + 4 dot 12.5 + 2 dot 17.5 + 5 dot 22.5 + 6 dot 27.5) / 25 = 422.5/25 = 16.9 " (triệu đồng)" $]
    #step[Tính $sum f_i x_i^2$ của lĩnh vực B:]
    #step[$ sum f_i x_i^2 = 8 dot 7.5^2 + 4 dot 12.5^2 + 2 dot 17.5^2 + 5 dot 22.5^2 + 6 dot 27.5^2 = 8756.25 $]
    #step[Phương sai của lĩnh vực B:]
    #step[$ S^2_B = 8756.25/25 - 16.9^2 = 350.25 - 285.61 = 64.64 $]
    #step[Độ lệch chuẩn của lĩnh vực B:]
    #step[$ S_B = sqrt(64.64) approx 8.0399 " (triệu đồng)" $]
    #step[Làm tròn kết quả ta được $8.039$.]
    #step[Vậy đáp án là A.]
    #resetstep()
  ]
)
#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai (4 câu)], count: 4)

// ─── CÂU 1 ───
#ds(
  dir: "doc",lines: 2,
  [Kết quả $40$ lần nhảy xa của hai vận động viên Dũng và Huy được lần lượt thống kê trong bảng bên dưới (đơn vị: mét):
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Dũng*], [*Huy*],
        [$[6.22; 6.46)$], [3], [2],
        [$[6.46; 6.70)$], [7], [5],
        [$[6.70; 6.94)$], [5], [8],
        [$[6.94; 7.18)$], [20], [19],
        [$[7.18; 7.42)$], [5], [6],
        [*Cộng*], [$n = 40$], [$n = 40$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình cộng của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Dũng (làm tròn kết quả đến hàng phần trăm) là $6.92$ m]),
    [Độ lệch chuẩn của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Dũng (làm tròn kết quả đến hàng phần trăm) là $0.26$ m],
    [Phương sai của mẫu số liệu ghép nhóm biểu diễn kết quả $40$ lần nhảy xa của vận động viên Huy (làm tròn kết quả đến hàng phần trăm) là $0.16$],
    [Kết quả nhảy xa của vận động viên Dũng đồng đều hơn kết quả nhảy xa của vận động viên Huy]
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $6.34; 6.58; 6.82; 7.06; 7.30$.]
    #step[a) Đúng. Số trung bình cộng của Dũng:]
    #step[$ overline(x)_D = (3 dot 6.34 + 7 dot 6.58 + 5 dot 6.82 + 20 dot 7.06 + 5 dot 7.30) / 40 = 276.88/40 = 6.922 " (m)" $]
    #step[Làm tròn đến hàng phần trăm ta được $6.92$ m.]
    #step[b) Sai. Tính phương sai của Dũng:]
    #step[$ sum f_i x_i^2 = 3 dot 6.34^2 + 7 dot 6.58^2 + 5 dot 6.82^2 + 20 dot 7.06^2 + 5 dot 7.30^2 = 1919.5456 $]
    #step[$ S^2_D = 1919.5456/40 - 6.922^2 = 47.98864 - 47.914084 = 0.074556 $]
    #step[$ S_D = sqrt(0.074556) approx 0.273 " (m)" $]
    #step[Làm tròn kết quả đến hàng phần trăm ta được $0.27$ m (không phải $0.26$ m).]
    #step[c) Sai. Tính số trung bình của Huy:]
    #step[$ overline(x)_H = (2 dot 6.34 + 5 dot 6.58 + 8 dot 6.82 + 19 dot 7.06 + 6 dot 7.30) / 40 = 278.08/40 = 6.952 " (m)" $]
    #step[Phương sai của Huy:]
    #step[$ sum f_i x_i^2 = 2 dot 6.34^2 + 5 dot 6.58^2 + 8 dot 6.82^2 + 19 dot 7.06^2 + 6 dot 7.30^2 = 1935.7408 $]
    #step[$ S^2_H = 1935.7408/40 - 6.952^2 = 48.39352 - 48.330304 = 0.063216 $]
    #step[Làm tròn kết quả đến hàng phần trăm ta được $0.06$ (không phải $0.16$).]
    #step[d) Sai. Vì $S^2_D approx 0.075 > S^2_H approx 0.063$, độ phân tán của Dũng lớn hơn Huy nên kết quả nhảy xa của Huy đồng đều hơn của Dũng.]
    #resetstep()
  ]
)// ─── CÂU 2 ───
#ds(
  dir: "doc",lines: 2,
  [Mẫu số liệu ghép nhóm thống kê mức lương của hai công ty A, B (đơn vị: triệu đồng) được thể hiện như bảng dưới đây:
    #align(center)[
      #table(
        columns: (auto, auto, auto),
        align: center + horizon,
        [*Nhóm*], [*Công ty A*], [*Công ty B*],
        [$[10; 15)$], [15], [25],
        [$[15; 20)$], [18], [15],
        [$[20; 25)$], [10], [7],
        [$[25; 30)$], [10], [5],
        [$[30; 35)$], [5], [5],
        [$[35; 40)$], [2], [3],
        [*Cộng*], [$n = 60$], [$n = 60$]
      )
    ]
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Số trung bình cộng của mẫu số liệu ghép nhóm của công ty A là $62/3$]),
    [Độ lệch chuẩn của mẫu số liệu ghép nhóm của công ty A là $5$],
    [Phương sai của mẫu số liệu ghép nhóm của công ty B (làm tròn kết quả đến hàng phần trưng) là $52.91$],
    True([Nhận thấy độ lệch chuẩn của công ty A nhỏ hơn công ty B nên mức lương của công ty A đồng đều hơn])
  ),
  loigiai: [
    #step[Giá trị đại diện các nhóm lần lượt là: $12.5; 17.5; 22.5; 27.5; 32.5; 37.5$.]
    #step[a) Đúng. Số trung bình cộng của công ty A:]
    #step[$ overline(x)_A = (15 dot 12.5 + 18 dot 17.5 + 10 dot 22.5 + 10 dot 27.5 + 5 dot 32.5 + 2 dot 37.5) / 60 = 1240/60 = 62/3 $]
    #step[b) Sai. Tính phương sai và độ lệch chuẩn của công ty A:]
    #step[$ sum f_i x_i^2 = 15 dot 12.5^2 + 18 dot 17.5^2 + 10 dot 22.5^2 + 10 dot 27.5^2 + 5 dot 32.5^2 + 2 dot 37.5^2 = 28575 $]
    #step[$ S^2_A = 28575/60 - (62/3)^2 = 476.25 - 3844/9 = 442.25/9 approx 49.14 $]
    #step[$ S_A = sqrt(442.25/9) approx 7.01 $ (không phải $5$).]
    #step[c) Sai. Tính số trung bình của công ty B:]
    #step[$ overline(x)_B = (25 dot 12.5 + 15 dot 17.5 + 7 dot 22.5 + 5 dot 27.5 + 5 dot 32.5 + 3 dot 37.5) / 60 = 1145/60 = 229/12 $]
    #step[Phương sai của công ty B:]
    #step[$ sum f_i x_i^2 = 25 dot 12.5^2 + 15 dot 17.5^2 + 7 dot 22.5^2 + 5 dot 27.5^2 + 5 dot 32.5^2 + 3 dot 37.5^2 = 25325 $]
    #step[$ S^2_B = 25325/60 - (229/12)^2 = 5065/12 - 52441/144 = 8339/144 approx 57.91 $ (không phải $52.91$).]
    #step[d) Đúng. Độ lệch chuẩn của B: $S_B = sqrt(8339/144) approx 7.61$.]
    #step[Vì $S_A approx 7.01 < S_B approx 7.61$ nên mức lương công ty A đồng đều hơn công ty B.]
    #resetstep()
  ]
)// ─── CÂU 3 ───
#ds(
  dir: "doc",lines: 2,
  [Khảo sát điểm thi môn Toán của 60 thí sinh thu được bảng số liệu ghép nhóm:
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
    Xét tính đúng sai của các khẳng định sau:],
  (
    True([Điểm thi môn Toán trung bình của 60 thí sinh là $51.5$ điểm]),
    True([Phương sai điểm thi môn Toán xấp xỉ bằng $290.75$]),
    True([Độ lệch chuẩn điểm thi môn Toán xấp xỉ bằng $17.05$ điểm]),
    [Nếu thang điểm thi được nhân đôi từ hệ 100 sang hệ 200 điểm thì phương sai điểm thi mới cũng nhân đôi]
  ),
  loigiai: [
    #step[a) Đúng. Số trung bình cộng của mẫu: $overline(x) approx 51.5$ điểm.]
    #step[b) Đúng. Tính phương sai: $S^2 approx 290.75$.]
    #step[c) Đúng. Độ lệch chuẩn $S = sqrt(290.75) approx 17.05$ điểm.]
    #step[d) Sai. Khi nhân tất cả các giá trị số liệu với hằng số $c = 2$ thì phương sai mới bằng $c^2 = 4$ lần phương sai cũ (tức là nhân bốn chứ không phải nhân đôi).]
    #resetstep()
  ]
)// ─── CÂU 4 ───
#ds(
  dir: "doc",lines: 2,
  [Thống kê lượng nước tiêu thụ trong tháng của 160 hộ gia đình:
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
    True([Lượng nước tiêu thụ trung bình của mỗi hộ gia đình là $9.375$ $m^3$]),
    True([Phương sai lượng nước tiêu thụ của mẫu xấp xỉ bằng $11.83$]),
    True([Độ lệch chuẩn lượng nước tiêu thụ của mẫu xấp xỉ bằng $3.44$ $m^3$]),
    True([Số hộ gia đình tiêu thụ nước từ 9 $m^3$ trở lên chiếm $49.375\%$ tổng số hộ gia đình])
  ),
  loigiai: [
    #step[a) Đúng. Số trung bình cộng: $overline(x) = 9.375$ $m^3$.]
    #step[b) Đúng. Tính phương sai: $S^2 approx 11.828$.]
    #step[c) Đúng. Độ lệch chuẩn $S = sqrt(11.828) approx 3.44$ $m^3$.]
    #step[d) Đúng. Số hộ gia đình tiêu thụ từ 9 $m^3$ trở lên là $79$ hộ.]
    #step[Tỷ lệ: $79/160 = 49.375\%$.]
    #resetstep()
  ]
)
#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (6 câu)], count: 6)

// ─── CÂU 1 ───
#tln(
  dir: "doc",lines: 2,
  [Khảo sát mức lương (đơn vị: triệu đồng) của 60 nhân viên ở công ty A, ta thu được bảng số liệu ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Mức lương*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số nhân viên*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính số trung bình cộng của mức lương công ty A (làm tròn kết quả đến hàng phần trăm).],
  [$20.67$],
  loigiai: [
    #step[Số trung bình cộng của mức lương:]
    #step[$ overline(x) = (15 dot 12.5 + 18 dot 17.5 + 10 dot 22.5 + 10 dot 27.5 + 5 dot 32.5 + 2 dot 37.5) / 60 = 1240/60 = 62/3 approx 20.67 " (triệu đồng)" $]
    #step[Đáp số: $20.67$.]
    #resetstep()
  ]
)// ─── CÂU 2 ───
#tln(
  dir: "doc",lines: 2,
  [Khảo sát doanh thu bán hàng mỗi ngày (đơn vị: triệu đồng) của 60 cửa hàng tiện lợi, ta thu được bảng số liệu:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Doanh thu*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số cửa hàng*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$49.14$],
  loigiai: [
    #step[Phương sai của mẫu số liệu:]
    #step[$ S^2 = 28575/60 - (62/3)^2 = 476.25 - 3844/9 = 442.25/9 approx 49.14 $]
    #step[Đáp số: $49.14$.]
    #resetstep()
  ]
)// ─── CÂU 3 ───
#tln(
  dir: "doc",lines: 2,
  [Thống kê chi phí sinh hoạt (đơn vị: triệu đồng/tháng) của 60 hộ gia đình, ta thu được bảng số liệu sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Chi phí*], [$[10; 15)$], [$[15; 20)$], [$[20; 25)$], [$[25; 30)$], [$[30; 35)$], [$[35; 40)$],
        [*Số hộ*], [15], [18], [10], [10], [5], [2]
      )
    ]
    Hãy tính độ lệch chuẩn của mẫu số liệu trên (triệu đồng, làm tròn kết quả đến hàng phần trăm).],
  [$7.01$],
  loigiai: [
    #step[Từ phương sai đã tính là $442.25/9$, độ lệch chuẩn là:]
    #step[$ S = sqrt(442.25/9) approx 7.01 " (triệu đồng)" $]
    #step[Đáp số: $7.01$.]
    #resetstep()
  ]
)// ─── CÂU 4 ───
#tln(
  dir: "doc",lines: 2,
  [Khảo sát điểm thi môn Tiếng Anh (thang điểm 100) của 60 sinh viên, ta thu được bảng số liệu ghép nhóm:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số sinh viên*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số sinh viên*], [12], [10], [6], [3], [1]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$290.75$],
  loigiai: [
    #step[Tính phương sai của điểm thi:]
    #step[$ S^2 = 290.75 $]
    #step[Đáp số: $290.75$.]
    #resetstep()
  ]
)// ─── CÂU 5 ───
#tln(
  dir: "doc",lines: 2,
  [Một cuộc thi đánh giá năng lực có điểm số từ 0 đến 100. Điểm của 60 ứng viên được ghi lại trong bảng:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Điểm*], [$[0; 9.5)$], [$[9.5; 19.5)$], [$[19.5; 29.5)$], [$[29.5; 39.5)$], [$[39.5; 49.5)$],
        [*Số ứng viên*], [1], [2], [4], [6], [15],
        [*Điểm*], [$[49.5; 59.5)$], [$[59.5; 69.5)$], [$[69.5; 79.5)$], [$[79.5; 89.5)$], [$[89.5; 99.5)$],
        [*Số ứng viên*], [12], [10], [6], [3], [1]
      )
    ]
    Hãy tính độ lệch chuẩn của mẫu số liệu ghép nhóm này (điểm, làm tròn kết quả đến hàng phần trăm).],
  [$17.05$],
  loigiai: [
    #step[Độ lệch chuẩn của mẫu số liệu:]
    #step[$ S = sqrt(290.75) approx 17.05 $]
    #step[Đáp số: $17.05$.]
    #resetstep()
  ]
)// ─── CÂU 6 ───
#tln(
  dir: "doc",lines: 2,
  [Khối lượng hàng hóa (đơn vị: tấn) của 160 chuyến xe tải được ghi nhận lại trong bảng sau:
    #align(center)[
      #table(
        columns: (auto, auto, auto, auto, auto, auto),
        align: center + horizon,
        [*Khối lượng* (tấn)], [$[3; 6)$], [$[6; 9)$], [$[9; 12)$], [$[12; 15)$], [$[15; 18)$],
        [*Số chuyến xe*], [24], [57], [42], [29], [8]
      )
    ]
    Hãy tính phương sai của mẫu số liệu ghép nhóm này (làm tròn kết quả đến hàng phần trăm).],
  [$11.83$],
  loigiai: [
    #step[Phương sai khối lượng hàng hóa:]
    #step[$ S^2 approx 11.828 approx 11.83 $]
    #step[Đáp số: $11.83$.]
    #resetstep()
  ]
)