#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 3 (TẬP 2)",
  exam-title: "CHƯƠNG III. CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM CỦA MẪU SỐ LIỆU GHÉP NHÓM (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cho mẫu số liệu ghép nhóm về thời gian xem tivi trong một tuần (đơn vị: giờ) của 30 học sinh như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (giờ)], $[0; 5)$, $[5; 10)$, $[10; 15)$, $[15; 20)$,
        [Số học sinh], [4], [10], [12], [4]
      )
    ]
    Giá trị đại diện của nhóm $[10; 15)$ là bao nhiêu?],
    (
        [$10$],
        True([$12.5$]),
        [$15$],
        [$12$]
    ),
    loigiai: [
        Giá trị đại diện của nhóm $[a_i; a_(i+1))$ được tính bằng trung bình cộng hai đầu mút của nhóm:
        $ x_i = (a_i + a_(i+1))/(2) $.
        Do đó, giá trị đại diện của nhóm $[10; 15)$ là:
        $ x_3 = (10 + 15)/(2) = 12.5 $.
        Chọn đáp án B.
    ]
)

// TN 2
#tn([Khảo sát tuổi thọ (đơn vị: năm) của 50 bóng đèn do một nhà máy sản xuất thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Tuổi thọ (năm)], $[3; 4)$, $[4; 5)$, $[5; 6)$, $[6; 7)$, $[7; 8)$,
        [Số bóng đèn], [5], [12], [20], [9], [4]
      )
    ]
    Nhóm chứa mốt của mẫu số liệu ghép nhóm trên là nhóm nào?],
    (
        [$[4; 5)$],
        True([$[5; 6)$]),
        [$[6; 7)$],
        [$[3; 4)$]
    ),
    loigiai: [
        Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm có tần số lớn nhất.
        Trong bảng số liệu trên, tần số lớn nhất là $20$, tương ứng với nhóm $[5; 6)$.
        Chọn đáp án B.
    ]
)

// TN 3
#tn([Khảo sát điểm thi môn Toán học kỳ I của 40 học sinh lớp 11A thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Điểm số], $[4; 5.5)$, $[5.5; 7)$, $[7; 8.5)$, $[8.5; 10)$,
        [Số học sinh], [6], [14], [12], [8]
      )
    ]
    Điểm số trung bình $overline(x)$ của 40 học sinh này là bao nhiêu?],
    (
        [$6.85$],
        [$7.00$],
        True([$7.075$]),
        [$7.25$]
    ),
    loigiai: [
        - Tính giá trị đại diện cho các nhóm:
          $x_1 = 4.75$, $x_2 = 6.25$, $x_3 = 7.75$, $x_4 = 9.25$.
        - Điểm số trung bình của mẫu số liệu ghép nhóm là:
          $ overline(x) = (6 dot 4.75 + 14 dot 6.25 + 12 dot 7.75 + 8 dot 9.25)/(40) = (28.5 + 87.5 + 93 + 74)/(40) = (283)/(40) = 7.075 $.
        Chọn đáp án C.
    ]
)

// TN 4
#tn([Khảo sát thời gian di chuyển từ nhà đến trường (đơn vị: phút) của 60 học sinh thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (phút)], $[5; 10)$, $[10; 15)$, $[15; 20)$, $[20; 25)$, $[25; 30)$,
        [Số học sinh], [8], [18], [20], [10], [4]
      )
    ]
    Nhóm chứa trung vị của mẫu số liệu ghép nhóm trên là nhóm nào?],
    (
        [$[10; 15)$],
        True([$[15; 20)$]),
        [$[20; 25)$],
        [$[5; 10)$]
    ),
    loigiai: [
        - Tổng số học sinh $n = 60 ==> (n)/(2) = 30$.
        - Lập bảng tần số tích lũy:
          + Tích lũy nhóm 1: $8 < 30$.
          + Tích lũy nhóm 2: $8 + 18 = 26 < 30$.
          + Tích lũy nhóm 3: $26 + 20 = 46 >= 30$.
        Do đó, nhóm đầu tiên có tần số tích lũy lớn hơn hoặc bằng $30$ là nhóm thứ 3: $[15; 20)$.
        Chọn đáp án B.
    ]
)

// TN 5
#tn([Khảo sát khối lượng (đơn vị: gram) của 40 quả cam thu hoạch tại một trang trại thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Khối lượng (g)], $[100; 110)$, $[110; 120)$, $[120; 130)$, $[130; 140)$, $[140; 150)$,
        [Số quả cam], [3], [9], [16], [8], [4]
      )
    ]
    Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng bao nhiêu?],
    (
        [$123.5$],
        True([$125$]),
        [$126.5$],
        [$128$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy các nhóm lượt là $3, 12, 28, 36, 40$. Nhóm chứa trung vị là nhóm $[120; 130)$.
        - Áp dụng công thức tính trung vị:
          $ M_e = r + ( (n/2 - C)/(n_m) ) dot h = 120 + ( (20 - 12)/(16) ) dot 10 = 120 + 5 = 125" g" $.
        Chọn đáp án B.
    ]
)

// TN 6
#tn([Khảo sát chiều cao (đơn vị: cm) của 50 học sinh nam lớp 11 thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Chiều cao (cm)], $[150; 155)$, $[155; 160)$, $[160; 165)$, $[165; 170)$, $[170; 175)$,
        [Số học sinh], [5], [15], [18], [8], [4]
      )
    ]
    Mốt $M_o$ của mẫu số liệu ghép nhóm này xấp xỉ bằng bao nhiêu (làm tròn đến hàng phần trăm)?],
    (
        [$160.83$],
        True([$161.15$]),
        [$162.14$],
        [$162.50$]
    ),
    loigiai: [
        - Nhóm chứa mốt có tần số lớn nhất là $18 ==>$ nhóm $[160; 165)$.
        - Khi đó $a_j = 160$, độ dài nhóm $h = 5$, tần số nhóm mốt $n_j = 18$, tần số nhóm trước $n_(j-1) = 15$, tần số nhóm sau $n_(j+1) = 8$.
        - Áp dụng công thức mốt:
          $ M_o = a_j + (n_j - n_(j-1))/((n_j - n_(j-1)) + (n_j - n_(j+1))) dot h = 160 + (18 - 15)/((18 - 15) + (18 - 8)) dot 5 = 160 + (3)/(13) dot 5 approx 161.15" cm" $.
        Chọn đáp án B.
    ]
)

// TN 7
#tn([Thời gian (đơn vị: phút) để 80 học sinh giải xong một bài toán lập trình được ghi lại ở bảng sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (phút)], $[1; 3)$, $[3; 5)$, $[5; 7)$, $[7; 9)$,
        [Số học sinh], [12], [28], [24], [16]
      )
    ]
    Nhóm chứa tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm là nhóm nào?],
    (
        [$[1; 3)$],
        True([$[3; 5)$]),
        [$[5; 7)$],
        [$[7; 9)$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 80 ==> (n)/(4) = 20$.
        - Lập tần số tích lũy: Nhóm 1 có $12 < 20$. Nhóm 2 có $12 + 28 = 40 >= 20$.
        - Do đó, nhóm đầu tiên có tần số tích lũy không nhỏ hơn $20$ là nhóm thứ 2: $[3; 5)$.
        Chọn đáp án B.
    ]
)

// TN 8
#tn([Thống kê tiền điện (đơn vị: nghìn đồng) tháng 5 của 40 hộ gia đình trong một xóm thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Số tiền (nghìn đồng)], $[200; 400)$, $[400; 600)$, $[600; 800)$, $[800; 1000)$,
        [Số hộ gia đình], [6], [14], [12], [8]
      )
    ]
    Tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm này xấp xỉ bằng bao nhiêu?],
    (
        [$725.0$],
        [$750.0$],
        True([$766.67$]),
        [$783.33$]
    ),
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (3n)/(4) = 30$.
        - Tần số tích lũy các nhóm lượt là $6, 20, 32, 40$. Nhóm chứa $Q_3$ là nhóm $[600; 800)$.
        - Áp dụng công thức tính $Q_3$:
          $ Q_3 = 600 + ( (30 - 20)/(12) ) dot 200 = 600 + (10)/(12) dot 200 = 600 + 166.67 = 766.67" nghìn đồng" $.
        Chọn đáp án C.
    ]
)

// TN 9
#tn([Trong các phát biểu sau đây về số đặc trưng đo xu thế trung tâm của mẫu số liệu ghép nhóm, phát biểu nào đúng?],
    (
        [Mốt là giá trị nằm chính giữa mẫu số liệu đã sắp xếp.],
        [Tứ phân vị thứ hai $Q_2$ luôn luôn bằng số trung bình $overline(x)$.],
        True([Trung vị $M_e$ chia mẫu số liệu thành hai phần, mỗi phần chứa khoảng 50% số giá trị.]),
        [Mốt của mẫu số liệu ghép nhóm là nhóm có tần số nhỏ nhất.]
    ),
    loigiai: [
        - Mốt của mẫu số liệu ghép nhóm là giá trị xuất hiện với mật độ/tần số lớn nhất (không phải nằm giữa).
        - Trung vị $M_e$ chính là tứ phân vị thứ hai $Q_2$, có vai trò chia mẫu số liệu thành 2 phần bằng nhau (mỗi phần khoảng 50% dữ liệu).
        - Trung vị và số trung bình nhìn chung không nhất thiết bằng nhau.
        Chọn đáp án C.
    ]
)

// TN 10
#tn([Người ta phân chia một mẫu số liệu thành 5 nhóm có độ dài bằng nhau từ khoảng $[10; 60)$. Khoảng của nhóm thứ 3 là nhóm nào?],
    (
        [$[20; 30)$],
        True([$[30; 40)$]),
        [$[40; 50)$],
        [$[25; 35)$]
    ),
    loigiai: [
        - Độ dài của mỗi nhóm là: $h = (60 - 10)/(5) = 10$.
        - Danh sách 5 nhóm lần lượt là: $[10; 20), [20; 30), [30; 40), [40; 50), [50; 60)$.
        - Nhóm thứ 3 là $[30; 40)$.
        Chọn đáp án B.
    ]
)

// TN 11
#tn([Bảng tần số tương đối ghép nhóm dưới đây biểu diễn năng suất lúa (đơn vị: tấn/ha) thu hoạch tại một địa phương:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Năng suất (tấn/ha)], $[4; 5)$, $[5; 6)$, $[6; 7)$, $[7; 8)$,
        [Tần số tương đối], [10%], [30%], [40%], [20%]
      )
    ]
    Năng suất lúa trung bình $overline(x)$ của địa phương đó là bao nhiêu?],
    (
        [$6.0$ tấn/ha],
        True([$6.2$ tấn/ha]),
        [$6.5$ tấn/ha],
        [$6.8$ tấn/ha]
    ),
    loigiai: [
        - Giá trị đại diện cho các nhóm lượt là: $4.5; 5.5; 6.5; 7.5$.
        - Số trung bình tính theo tần số tương đối $f_i$:
          $ overline(x) = f_1 x_1 + f_2 x_2 + f_3 x_3 + f_4 x_4 = 0.1 dot 4.5 + 0.3 dot 5.5 + 0.4 dot 6.5 + 0.2 dot 7.5 = 0.45 + 1.65 + 2.60 + 1.50 = 6.2" tấn/ha" $.
        Chọn đáp án B.
    ]
)

// TN 12
#tn([Khảo sát số giờ làm thêm trong một tuần của 20 sinh viên thu được bảng số liệu ghép nhóm sau (chưa hoàn chỉnh):
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Số giờ làm thêm], $[0; 4)$, $[4; 8)$, $[8; 12)$, $[12; 16)$,
        [Số sinh viên], [4], [$x$], [8], [2]
      )
    ]
    Giá trị của $x$ trong bảng tần số ghép nhóm trên là bao nhiêu?],
    (
        [$4$],
        [$5$],
        True([$6$]),
        [$7$]
    ),
    loigiai: [
        - Tổng số sinh viên được khảo sát là $n = 20$.
        - Ta có phương trình tổng tần số:
          $ 4 + x + 8 + 2 = 20 ==> x + 14 = 20 ==> x = 6 $.
        Chọn đáp án C.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Khảo sát thời gian học trực tuyến trong ngày (đơn vị: phút) của 50 học sinh khối 11 thu được mẫu số liệu ghép nhóm như bảng sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian (phút)], $[30; 60)$, $[60; 90)$, $[90; 120)$, $[120; 150)$, $[150; 180)$,
        [Số học sinh], [6], [14], [18], [8], [4]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Giá trị đại diện của nhóm $[90; 120)$ là $105$ phút.]),
        False([Thời gian học trực tuyến trung bình của mẫu số liệu trên bằng $110$ phút.]),
        True([Nhóm chứa trung vị của mẫu số liệu ghép nhóm là nhóm $[90; 120)$.]),
        True([Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng $98.33$ phút (làm tròn đến hàng phần trăm).])
    ),
    loigiai: [
        - *a)* Đúng. Giá trị đại diện của nhóm $[90; 120)$ là $(90 + 120)/2 = 105$ phút.
        - *b)* Sai. Các giá trị đại diện là $45, 75, 105, 135, 165$. Thời gian trung bình:
          $ overline(x) = (6 dot 45 + 14 dot 75 + 18 dot 105 + 8 dot 135 + 4 dot 165)/(50) = (270 + 1050 + 1890 + 1080 + 660)/(50) = (4950)/(50) = 99" phút" != 110" phút" $.
        - *c)* Đúng. $n/2 = 25$. Tần số tích lũy: nhóm 1 là 6, nhóm 2 là 20, nhóm 3 là $38 >= 25 ==>$ nhóm chứa $M_e$ là $[90; 120)$.
        - *d)* Đúng. Trung vị: $M_e = 90 + ((25 - 20)/(18)) dot 30 = 90 + (25)/(3) approx 98.33$ phút.
    ]
)

// DS 2
#ds([Khảo sát thu nhập hằng tháng (đơn vị: triệu đồng) của 40 công nhân tại một xưởng sản xuất thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thu nhập (triệu đồng)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14)$, $[14; 16)$,
        [Số công nhân], [4], [12], [14], [7], [3]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Nhóm chứa mốt của mẫu số liệu ghép nhóm là nhóm $[10; 12)$.]),
        False([Mốt $M_o$ của mẫu số liệu ghép nhóm bằng $10.8$ triệu đồng.]),
        True([Nhóm chứa tứ phân vị thứ nhất $Q_1$ là nhóm $[8; 10)$.]),
        True([Tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm bằng $9$ triệu đồng.])
    ),
    loigiai: [
        - *a)* Đúng. Tần số lớn nhất là 14 thuộc nhóm $[10; 12) ==>$ Nhóm chứa mốt là $[10; 12)$.
        - *b)* Sai. Mốt $M_o = 10 + ((14 - 12)/((14 - 12) + (14 - 7))) dot 2 = 10 + (2)/(9) dot 2 = 10 + 0.44 = 10.44$ triệu đồng (chứ không phải 10.8).
        - *c)* Đúng. $n/4 = 10$. Tần số tích lũy: nhóm 1 có 4, nhóm 2 có $4+12=16 >= 10 ==>$ Nhóm chứa $Q_1$ là $[8; 10)$.
        - *d)* Đúng. $Q_1 = 8 + ((10 - 4)/(12)) dot 2 = 8 + 1 = 9$ triệu đồng.
    ]
)

// DS 3
#ds([Một công ty lâm nghiệp đo chiều cao (đơn vị: mét) của 100 cây bạch đàn trồng được 3 năm và thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Chiều cao (m)], $[6; 8)$, $[8; 10)$, $[10; 12)$, $[12; 14)$, $[14; 16)$,
        [Số cây], [10], [25], [35], [20], [10]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Tỉ lệ số cây có chiều cao từ $10$ m đến dưới $12$ m chiếm $35%$ tổng số cây.]),
        True([Chiều cao trung bình của mẫu số liệu ghép nhóm bằng $10.9$ mét.]),
        False([Tứ phân vị thứ ba $Q_3$ nằm ở nhóm $[14; 16)$.]),
        True([Tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm bằng $12.5$ mét.])
    ),
    loigiai: [
        - *a)* Đúng. Số cây nhóm $[10; 12)$ là 35 cây trên tổng số 100 cây $==> 35%$.
        - *b)* Đúng. Giá trị đại diện $7, 9, 11, 13, 15$. Chiều cao trung bình:
          $ overline(x) = (10 dot 7 + 25 dot 9 + 35 dot 11 + 20 dot 13 + 10 dot 15)/(100) = (70 + 225 + 385 + 260 + 150)/(100) = (1090)/(100) = 10.9" m" $.
        - *c)* Sai. $3n/4 = 75$. Tần số tích lũy: $10, 35, 70 < 75, 90 >= 75 ==>$ nhóm chứa $Q_3$ phải là nhóm $[12; 14)$.
        - *d)* Đúng. $Q_3 = 12 + ((75 - 70)/(20)) dot 2 = 12 + 0.5 = 12.5" m"$.
    ]
)

// DS 4
#ds([Thời gian (đơn vị: giây) hoàn thành cự ly chạy 800m của 30 vận động viên điền kinh được ghi lại ở bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (giây)], $[120; 130)$, $[130; 140)$, $[140; 150)$, $[150; 160)$,
        [Số vận động viên], [5], [11], [10], [4]
      )
    ]
    Các phát biểu sau đúng hay sai?],
    (
        True([Có 16 vận động viên hoàn thành cự ly chạy dưới 140 giây.]),
        True([Nhóm chứa trung vị $M_e$ và nhóm chứa mốt $M_o$ trùng nhau và là nhóm $[130; 140)$.]),
        False([Trung vị $M_e$ của mẫu số liệu ghép nhóm trên bằng $138.5$ giây.]),
        True([Mốt $M_o$ của mẫu số liệu ghép nhóm trên bằng $138.57$ giây (làm tròn đến hàng phần trăm).])
    ),
    loigiai: [
        - *a)* Đúng. Số VĐV có thời gian dưới 140 giây là $5 + 11 = 16$ VĐV.
        - *b)* Đúng. $n/2 = 15$. Tần số tích lũy: nhóm 1 có 5, nhóm 2 có $16 >= 15 ==>$ nhóm trung vị là $[130; 140)$. Tần số max là 11 $==>$ nhóm mốt cũng là $[130; 140)$.
        - *c)* Sai. Trung vị $M_e = 130 + ((15 - 5)/(11)) dot 10 = 130 + (100)/(11) approx 139.09$ giây (chứ không phải 138.5).
        - *d)* Đúng. Mốt $M_o = 130 + ((11 - 5)/((11 - 5) + (11 - 10))) dot 10 = 130 + (6)/(7) dot 10 approx 138.57$ giây.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#tln([Khảo sát khối lượng (đơn vị: gram) của 50 quả cà chua thu hoạch trong vườn thu được mẫu số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Khối lượng (g)], $[70; 80)$, $[80; 90)$, $[90; 100)$, $[100; 110)$, $[110; 120)$,
        [Số quả cà chua], [6], [12], [18], [10], [4]
      )
    ]
    Tính khối lượng trung bình của 50 quả cà chua này (tính bằng gram).],
    [93.8],
    loigiai: [
        - Giá trị đại diện cho các nhóm là: $75, 85, 95, 105, 115$.
        - Khối lượng trung bình là:
          $ overline(x) = (6 dot 75 + 12 dot 85 + 18 dot 95 + 10 dot 105 + 4 dot 115)/(50) = (450 + 1020 + 1710 + 1050 + 460)/(50) = (4690)/(50) = 93.8" g" $.
        Đáp số: $93.8$.
    ]
)

// TLN 2
#tln([Khảo sát tuổi thọ (đơn vị: tháng) của 40 thiết bị điện tử hoạt động liên tục thu được mẫu số liệu ghép nhóm như sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Tuổi thọ (tháng)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$, $[50; 60)$,
        [Số thiết bị], [4], [8], [16], [8], [4]
      )
    ]
    Tính trung vị $M_e$ của mẫu số liệu ghép nhóm trên (tính bằng tháng).],
    [35],
    loigiai: [
        - Cỡ mẫu $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy các nhóm lượt là $4, 12, 28, 36, 40$. Nhóm chứa trung vị là nhóm $[30; 40)$.
        - Trung vị là:
          $ M_e = 30 + ( (20 - 12)/(16) ) dot 10 = 30 + (8)/(16) dot 10 = 30 + 5 = 35" tháng" $.
        Đáp số: $35$.
    ]
)

// TLN 3
#tln([Khảo sát mức tiền thưởng (đơn vị: triệu đồng) cuối năm của 50 nhân viên trong một công ty thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Mức thưởng (triệu)], $[2; 4)$, $[4; 6)$, $[6; 8)$, $[8; 10)$, $[10; 12)$,
        [Số nhân viên], [5], [15], [20], [7], [3]
      )
    ]
    Tính mốt $M_o$ của mẫu số liệu ghép nhóm trên (tính bằng triệu đồng, làm tròn kết quả đến hai chữ số thập phân).],
    [6.56],
    loigiai: [
        - Nhóm chứa mốt là nhóm có tần số lớn nhất ($20 ==>$ nhóm $[6; 8)$).
        - Khi đó $a_j = 6, h = 2, n_j = 20, n_(j-1) = 15, n_(j+1) = 7$.
        - Mốt của mẫu số liệu ghép nhóm là:
          $ M_o = 6 + (20 - 15)/((20 - 15) + (20 - 7)) dot 2 = 6 + (5)/(18) dot 2 = 6 + (5)/(9) approx 6.56" triệu đồng" $.
        Đáp số: $6.56$.
    ]
)

// TLN 4
#tln([Khảo sát thời gian chờ xe buýt (đơn vị: phút) của 60 hành khách tại một trạm xe buýt thu được bảng tần số ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Thời gian chờ (phút)], $[0; 5)$, $[5; 10)$, $[10; 15)$, $[15; 20)$, $[20; 25)$,
        [Số hành khách], [8], [20], [18], [10], [4]
      )
    ]
    Tính tứ phân vị thứ nhất $Q_1$ của mẫu số liệu ghép nhóm này (tính bằng phút, làm tròn đến hai chữ số thập phân).],
    [6.75],
    loigiai: [
        - Cỡ mẫu $n = 60 ==> (n)/(4) = 15$.
        - Tần số tích lũy nhóm 1 là 8, nhóm 2 là $28 >= 15 ==>$ Nhóm chứa $Q_1$ là nhóm $[5; 10)$.
        - Áp dụng công thức tính $Q_1$:
          $ Q_1 = 5 + ( (15 - 8)/(20) ) dot 5 = 5 + (7)/(20) dot 5 = 5 + 1.75 = 6.75" phút" $.
        Đáp số: $6.75$.
    ]
)

// TLN 5
#tln([Khảo sát doanh thu hằng ngày (đơn vị: triệu đồng) của 80 cửa hàng bán lẻ trong một hệ thống thu được bảng số liệu ghép nhóm sau:
    #align(center)[
      #table(
        columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center + horizon,
        [Doanh thu (triệu)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$, $[50; 60)$,
        [Số cửa hàng], [10], [20], [25], [17], [8]
      )
    ]
    Tính tứ phân vị thứ ba $Q_3$ của mẫu số liệu ghép nhóm trên (tính bằng triệu đồng, làm tròn đến hai chữ số thập phân).],
    [42.94],
    loigiai: [
        - Cỡ mẫu $n = 80 ==> (3n)/(4) = 60$.
        - Tần số tích lũy các nhóm lượt là $10, 30, 55, 72, 80$. Nhóm đầu tiên có tần số tích lũy không nhỏ hơn $60$ là nhóm thứ 4: $[40; 50)$.
        - Áp dụng công thức tính $Q_3$:
          $ Q_3 = 40 + ( (60 - 55)/(17) ) dot 10 = 40 + (50)/(17) approx 42.94" triệu đồng" $.
        Đáp số: $42.94$.
    ]
)

// TLN 6
#tln([Cho bảng mẫu số liệu ghép nhóm về thời gian hoàn thành một sản phẩm (đơn vị: phút) của 40 công nhân thuộc Tổ sản xuất B:
    #align(center)[
      #table(
        columns: (2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        align: center + horizon,
        [Thời gian (phút)], $[10; 20)$, $[20; 30)$, $[30; 40)$, $[40; 50)$,
        [Số công nhân Tổ B], [8], [20], [8], [4]
      )
    ]
    Biết rằng trung vị thời gian hoàn thành sản phẩm của Tổ sản xuất A là $M_("eA") = 24.5$ phút. Trung vị thời gian hoàn thành sản phẩm của Tổ B lớn hơn trung vị thời gian của Tổ A bao nhiêu phút?],
    [1.5],
    loigiai: [
        - Cỡ mẫu Tổ B là $n = 40 ==> (n)/(2) = 20$.
        - Tần số tích lũy Tổ B: nhóm 1 có 8, nhóm 2 có $8 + 20 = 28 >= 20 ==>$ Nhóm chứa trung vị của Tổ B là $[20; 30)$.
        - Trung vị của Tổ B là:
          $ M_("eB") = 20 + ( (20 - 8)/(20) ) dot 10 = 20 + 6 = 26" phút" $.
        - Độ chênh lệch trung vị giữa Tổ B và Tổ A là:
          $ Delta M_e = M_("eB") - M_("eA") = 26 - 24.5 = 1.5" phút" $.
        Đáp số: $1.5$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
