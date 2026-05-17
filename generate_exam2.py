import math

content = r"""#import "../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.1"
#import "../bbt.typ": *
#import "../math-sym.typ": *

#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "THPT NGUYỄN HỮU CẢNH",
  school: "ĐỀ THI THỬ LẦN 2 - 12C1",
  exam-title: "THI THỬ TỐT NGHIỆP THPT NĂM 2026 (LẦN 2)",
  subject: "TOÁN",
  duration: "90 phút, không kể thời gian phát đề",
  structure: auto,
  code: "102",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

  // PHẦN I
  #exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

  #tn(
    [Hàm số $y = x^3 - 3x^2 + 2$ đồng biến trên khoảng nào dưới đây?],
    (
      [$(0; 2)$.],
      True([$(-infinity; 0)$ và $(2; +infinity)$.]),
      [$(0; +infinity)$.],
      [$(-infinity; 2)$.],
    ),
    loigiai: [
      Ta có $y' = 3x^2 - 6x$. Cho $y' = 0 <=> x = 0$ hoặc $x = 2$.
      Hàm số đồng biến khi $y' > 0 <=> x < 0$ hoặc $x > 2$.
      Vậy hàm số đồng biến trên khoảng $(-infinity; 0)$ và $(2; +infinity)$.
      Chọn đáp án *B*.
    ],
  )

  #tn(
    [Tập nghiệm của phương trình $3^(2x - 1) = 27$ là],
    (
      [$S = {1}$.],
      True([$S = {2}$.]),
      [$S = {3}$.],
      [$S = {4}$.],
    ),
    loigiai: [
      Ta có: $3^(2x - 1) = 27 <=> 3^(2x - 1) = 3^3 <=> 2x - 1 = 3 <=> 2x = 4 <=> x = 2$.
      Vậy phương trình có nghiệm $x = 2$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Trên không gian $O x y z$, cho mặt phẳng $(alpha): 2x - y + 3z - 1 = 0$. Vectơ nào dưới đây là một vectơ pháp tuyến của mặt phẳng $(alpha)$?],
    (
      True([$arrow(n) = (2; -1; 3)$.]),
      [$arrow(n) = (2; 1; -3)$.],
      [$arrow(n) = (-1; 3; -1)$.],
      [$arrow(n) = (2; -1; -1)$.],
    ),
    loigiai: [
      Mặt phẳng $(alpha): 2x - y + 3z - 1 = 0$ có một vectơ pháp tuyến là $arrow(n) = (2; -1; 3)$. 
      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Trong mặt phẳng tọa độ $O x yz$, cho điểm $M(1; -2; 3)$. Hình chiếu vuông góc của điểm $M$ lên mặt phẳng $(O x y)$ có tọa độ là],
    (
      [$(0; -2; 3)$.],
      True([$(1; -2; 0)$.]),
      [$(1; 0; 3)$.],
      [$(0; 0; 3)$.],
    ),
    loigiai: [
      Hình chiếu vuông góc của điểm $M(x;y;z)$ lên mặt phẳng $(O x y)$ là điểm $M'(x;y;0)$.
      Do đó hình chiếu của $M(1; -2; 3)$ là điểm $(1; -2; 0)$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Họ nguyên hàm của hàm số $f(x) = sin x + cos x$ là],
    (
      True([$-cos x + sin x + C$.]),
      [$cos x - sin x + C$.],
      [$cos x + sin x + C$.],
      [$-cos x - sin x + C$.],
    ),
    loigiai: [
      Ta có $int (sin x + cos x) dif x = int sin x dif x + int cos x dif x = -cos x + sin x + C$.
      Chọn đáp án *A*.
    ],
  )

  #tn(
    [Giá trị của tích phân $I = int_0^1 (2x + 1) dif x$ là],
    (
      [$1$.],
      True([$2$.]),
      [$3$.],
      [$4$.],
    ),
    loigiai: [
      $I = int_0^1 (2x + 1) dif x = (x^2 + x)|_0^1 = (1 + 1) - 0 = 2$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Theo dữ liệu thống kê, thu nhập của 10 công nhân (đơn vị: triệu đồng) là: $7, 8, 8, 9, 10, 10, 11, 12, 13, 20$. Khoảng tứ phân vị ($Delta_Q$) của mẫu số liệu này là],
    (
      [$3$.],
      True([$4$.]),
      [$5$.],
      [$13$.],
    ),
    loigiai: [
      Sắp xếp lại: $7, 8, 8, 9, 10, 10, 11, 12, 13, 20$. 
      Trung vị $Q_2 = (10+10)/2 = 10$.
      Nửa dưới: $7, 8, 8, 9, 10 -> Q_1 = 8$.
      Nửa trên: $10, 11, 12, 13, 20 -> Q_3 = 12$.
      Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1 = 12 - 8 = 4$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Cho hàm số $y = f(x)$ có bảng biến thiên:
    #align(center)[
      #bbt(
        x: ($-infinity$, $-1$, $1$, $+infinity$),
        y_: ($+$, $0$, $-$, $0$, $+$),
        y: ($-infinity$, $+$, $3$, $-$, $-1$, $+$, $+infinity$),
      )
    ]
    Điểm cực tiểu của đồ thị hàm số là],
    (
      [$(-1; 3)$.],
      [$(1; -1)$.],
      True([Điểm $(1; -1)$.]),
      [$x = 1$.],
    ),
    loigiai: [
      Theo bảng biến thiên, hàm số đạt cực tiểu tại $x = 1$, giá trị cực tiểu là $y = -1$.
      Do đó điểm cực tiểu của đồ thị hàm số là $(1; -1)$. Chọn đáp án *C*.
    ],
  )

  #tn(
    [Cho số phức $z = 3 - 4i$. Mô-đun của số phức $z$ là],
    (
      [$3$.],
      [$4$.],
      True([$5$.]),
      [$7$.],
    ),
    loigiai: [
      $|z| = sqrt(3^2 + (-4)^2) = sqrt(9 + 16) = sqrt(25) = 5$. Chọn đáp án *C*.
    ],
  )

  #tn(
    [Khối lăng trụ có diện tích đáy $B = 6$ và chiều cao $h = 4$. Thể tích của khối lăng trụ đó là],
    (
      [$8$.],
      True([$24$.]),
      [$12$.],
      [$36$.],
    ),
    loigiai: [
      Thể tích khối lăng trụ $V = B dot h = 6 dot 4 = 24$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Trong một hộp có 5 viên bi đỏ và 4 viên bi xanh. Lấy ngẫu nhiên đồng thời 2 viên bi. Xác suất để lấy được 2 viên bi khác màu là],
    (
      [$10/36$.],
      True([$5/9$.]),
      [$4/9$.],
      [$5/18$.],
    ),
    loigiai: [
      Tổng số bi là 9. Số cách lấy 2 viên bi là $C_9^2 = 36$.
      Số cách lấy 2 viên bi khác màu là $C_5^1 dot C_4^1 = 5 dot 4 = 20$.
      Xác suất là $P = 20/36 = 5/9$. Chọn đáp án *B*.
    ],
  )

  #tn(
    [Đường tiệm cận đứng của đồ thị hàm số $y = (2x - 1)/(x + 3)$ là đường thẳng có phương trình:],
    (
      True([$x = -3$.]),
      [$x = 2$.],
      [$y = 2$.],
      [$y = -3$.],
    ),
    loigiai: [
      Đồ thị hàm số $y = (a x+b)/(c x+d)$ có đường tiệm cận đứng là $x = -d/c$. Do đó TCĐ là $x = -3$. Chọn đáp án *A*.
    ],
  )

  // PHẦN II
  #resetcau()
  #exam-part([PHẦN II. Câu trắc nghiệm đúng/sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

  #ds(
    [Cho hàm số $y = f(x) = x^3 - 3x^2 + 4$. Xét tính đúng sai của các mệnh đề sau:],
    (
      True([Hàm số đạt cực đại tại $x = 0$.]),
      [Giá trị cực tiểu của hàm số bằng $4$.],
      True([Đồ thị hàm số cắt trục hoành tại điểm có hoành độ $x = -1$.]),
      True([Phương trình $f(x) = m$ có 3 nghiệm phân biệt khi và chỉ khi $0 < m < 4$.]),
    ),
    loigiai: [
      Ta có $f'(x) = 3x^2 - 6x = 3x(x - 2)$. $f'(x) = 0 <=> x = 0$ hoặc $x = 2$.
      Lập BBT, ta thấy hàm số đạt cực đại tại $x = 0, y_(cd) = 4$ và cực tiểu tại $x = 2, y_(ct) = 0$.
      Vậy ý a ĐÚNG, ý b SAI (giá trị cực tiểu bằng 0).
      Với $x = -1$, $f(-1) = -1 - 3 + 4 = 0$, đồ thị cắt trục hoành tại $(-1; 0)$. Ý c ĐÚNG.
      Dựa vào BBT, đường thẳng $y = m$ cắt đồ thị tại 3 điểm phân biệt khi $y_(ct) < m < y_(cd) <=> 0 < m < 4$. Ý d ĐÚNG.
    ]
  )

  #ds(
    [Trong không gian $O x y z$, cho hai đường thẳng $d_1: (x-1)/2 = y/1 = (z+1)/(-1)$ và $d_2: (x+2)/1 = (y-1)/(-2) = z/2$. Xét các mệnh đề sau:],
    (
      True([Vectơ chỉ phương của $d_1$ là $arrow(u_1) = (2; 1; -1)$.]),
      [Hai đường thẳng $d_1$ và $d_2$ song song với nhau.],
      True([Đường thẳng $d_2$ vuông góc với mặt phẳng $(P): x - 2y + 2z - 5 = 0$.]),
      [Khoảng cách giữa hai đường thẳng $d_1$ và $d_2$ bằng $3$.],
    ),
    loigiai: [
      - Từ phương trình $d_1$, ta thấy một VTCP là $arrow(u_1) = (2; 1; -1)$, ý a ĐÚNG.
      - VTCP của $d_2$ là $arrow(u_2) = (1; -2; 2)$. Do $arrow(u_1)$ và $arrow(u_2)$ không cùng phương nên hai đường thẳng không song song, ý b SAI.
      - Mặt phẳng $(P)$ có VTPT $arrow(n) = (1; -2; 2)$. Vì $arrow(u_2) = arrow(n)$ nên $d_2 perp (P)$, ý c ĐÚNG.
      - Lấy $M_1(1; 0; -1) in d_1$, $M_2(-2; 1; 0) in d_2$. Vectơ $arrow(M_1 M_2) = (-3; 1; 1)$. 
        Tích có hướng $[arrow(u_1), arrow(u_2)] = (0; -5; -5)$. 
        Khoảng cách $d = (| [arrow(u_1), arrow(u_2)] dot arrow(M_1 M_2) |) / (| [arrow(u_1), arrow(u_2)] |) = (|-5 - 5|) / (sqrt(0 + 25 + 25)) = 10 / (5sqrt(2)) = sqrt(2)$.
        Khoảng cách bằng $sqrt(2) != 3$, ý d SAI.
    ]
  )

  #ds(
    [Thống kê số điểm của sinh viên trong một kỳ thi được cho trong bảng sau:
    #align(center)[
      #table(
        columns: 6,
        align: center,
        stroke: 0.5pt + black,
        [Điểm], [$[0;2)$], [$[2;4)$], [$[4;6)$], [$[6;8)$], [$[8;10]$],
        [Số viên], [5], [10], [25], [40], [20],
      )
    ]
    Xét tính đúng sai của các mệnh đề:],
    (
      [Kích thước mẫu là $n = 50$.],
      True([Nhóm chứa mốt là nhóm $[6;8)$.]),
      True([Giá trị trung bình của mẫu xấp xỉ $6,2$.]),
      [Trung vị của mẫu thuộc nhóm $[4;6)$.],
    ),
    loigiai: [
      - $n = 5+10+25+40+20 = 100$. Kích thước mẫu là 100. Ý a SAI.
      - Nhóm có tần số lớn nhất là $[6;8)$ (Tần số 40). Đây là nhóm chứa mốt. Ý b ĐÚNG.
      - Lấy giá trị đại diện mặt $x_i$: $1, 3, 5, 7, 9$. Trung bình $x = (5(1) + 10(3) + 25(5) + 40(7) + 20(9))/100 = 620/100 = 6,2$. Ý c ĐÚNG.
      - Vị trí trung vị là $N/2 = 50$. Tần số tích luỹ đến nhóm 3 ($[4;6)$) là $5+10+25=40 < 50$. Nhóm chứa trung vị là $[6;8)$. Ý d SAI.
    ]
  )

  #ds(
    [Một hộp chứa 6 bi trắng và 4 bi đen. Rút ngẫu nhiên lần lượt hai viên bi từ hộp (rút không hoàn lại). Xét các mệnh đề sau:],
    (
      True([Xác suất viên bi thứ nhất trắng là $0,6$.]),
      True([Nếu viên bi thứ nhất trắng thì xác suất viên bi thứ hai đen bằng $4/9$.]),
      True([Xác suất để rút được hai viên bi khác màu là $8/15$.]),
      [Xác suất viên bi thứ hai đen (không cần biết viên thứ nhất) là $0,5$.],
    ),
    loigiai: [
      - Rút 1 viên từ 10 viên (6 trắng, 4 đen) nên xác suất bi thứ nhất trắng là $6/10 = 0,6$. Ý a ĐÚNG.
      - Nếu viên đầu trắng, trong hộp còn 9 bi (5 trắng, 4 đen). Xác suất bốc viên thứ 2 đen là $4/9$. Ý b ĐÚNG.
      - Có 2 trường hợp lấy 2 bi khác màu lần lượt: Trắng-Đen ($6/10 dot 4/9 = 24/90$) và Đen-Trắng ($4/10 dot 6/9 = 24/90$). Tổng bằng $48/90 = 8/15$. Ý c ĐÚNG.
      - Xác suất viên 2 đen = Xác suất (Trắng rồi Đen) + Xác suất (Đen rồi Đen) = $24/90 + 4/10 dot 3/9 = 24/90 + 12/90 = 36/90 = 0,4$. Do $0,4 != 0,5$, ý d SAI.
    ]
  )

  // PHẦN III
  #exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
  #resetcau()

  #tln(
    [Giá trị lớn nhất của hàm số $y = -x^4 + 2x^2 + 3$ trên đoạn $[-1; 2]$ bằng bao nhiêu?],
    [$4$],
    loigiai: [
      Ta có $y' = -4x^3 + 4x = -4x(x^2 - 1)$. $y' = 0 <=> x = 0$; $x = 1$; $x = -1$.
      Tính các giá trị tại điểm tới hạn và mút:
      $f(-1) = -1 + 2 + 3 = 4$; $f(0) = 3$; $f(1) = -1 + 2 + 3 = 4$; $f(2) = -16 + 8 + 3 = -5$.
      Giá trị lớn nhất là 4.
    ]
  )

  #tln(
    [Một bể chứa nước hình hộp chữ nhật có kích thước đáy là $2$ m và $3$ m, chiều cao $1,5$ m. Người ta dùng một vòi bơm nước với công suất $3 m^3 \/ h$. Hỏi sau bao nhiêu giờ thì nước đầy bể?],
    [$3$],
    loigiai: [
      Thể tích bể nước là $V = 2 dot 3 dot 1,5 = 9$ m³.
      Thời gian để nước đầy bể là $t = V / P = 9 / 3 = 3$ giờ.
    ]
  )

  #tln(
    [Cho $log_2 3 = a$ và $log_2 5 = b$. Biết $log_2 45 = x a + y b + c$, tìm giá trị của $S = x + y + c$.],
    [$3$],
    loigiai: [
      $log_2 45 = log_2 (9 dot 5) = log_2 (3^2) + log_2 5 = 2 log_2 3 + log_2 5 = 2a + b$.
      Suy ra $x = 2$, $y = 1$, $c = 0$.
      Tồng $S = 2 + 1 + 0 = 3$.
    ]
  )

  #tln(
    [Thể tích của một khối chóp tứ giác đều có tất cả các cạnh đều bằng $a=3$ là bao nhiêu? (Làm tròn đến 1 chữ số thập phân).],
    [$6,4$],
    loigiai: [
      Thể tích khối chóp tứ giác đều $V = (a^3 sqrt(2)) / 6$. 
      Thay $a=3$, ta được $V = (27 sqrt(2)) / 6 = (9 sqrt(2)) / 2 approx 6,364$.
      Làm tròn 1 chữ số thập phân ta được $6,4$.
    ]
  )

  #tln(
    [Một người gửi tiết kiệm $100$ triệu đồng vào ngân hàng với lãi suất kép $6%$ / năm. Hỏi sau ít nhất bao nhiêu năm người đó có số tiền cả gốc và lãi lớn hơn $200$ triệu đồng?],
    [$12$],
    loigiai: [
      Số tiền nhận được sau $n$ năm là $A = 100 (1 + 0,06)^n$.
      Ta cần $100(1,06)^n > 200 <=> 1,06^n > 2 <=> n > log_1,06 (2) approx 11,89$.
      Vì $n$ nguyên nên $n = 12$.
    ]
  )

  #tln(
    [Trong một giải bóng đá có 12 đội tham gia thi đấu vòng tròn một lượt (mỗi đội đá với một đội khác đúng một trận). Tổng số trận đấu của giải là bao nhiêu?],
    [$66$],
    loigiai: [
      Mỗi trận đấu là sự lựa chọn 2 đội từ 12 đội tham gia. 
      Tổng số trận đấu là $C_12^2 = (12 dot 11) / 2 = 66$.
    ]
  )

] // end make-questions

#if sys.inputs.at("beamer", default: "0") != "1" {
  make-questions()
  het
  pagebreak()
  print-answer-key()
}
"""

with open("typst/De-Cac-So/2026-Tự-Chế-Lần-2.typ", "w", encoding="utf-8") as f:
    f.write(content)
