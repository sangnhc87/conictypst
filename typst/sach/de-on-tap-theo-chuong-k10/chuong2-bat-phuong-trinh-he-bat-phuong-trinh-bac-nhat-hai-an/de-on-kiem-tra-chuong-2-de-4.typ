#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("2563eb")
#let ma-de = "1004"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG II - TOÁN 10",
  subject: "TOÁN 10",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Cho bất phương trình $x + 2y - 3 > 0$. Khẳng định nào sau đây là đúng?],
  (
    [Điểm $A(0; 1)$ thuộc miền nghiệm.],
    [Điểm $B(-1; 1)$ thuộc miền nghiệm.],
    True([Điểm $C(2; 1)$ thuộc miền nghiệm.]),
    [Điểm $D(1; 0)$ thuộc miền nghiệm.]
  ),
  loigiai: [
    + Thay tọa độ $C(2; 1)$ vào bpt: $2 + 2(1) - 3 = 1 > 0$ (Đúng).
  ]
)

#tn([Hệ bất phương trình nào dưới đây là hệ bất phương trình bậc nhất hai ẩn?],
  (
    [$cases(x^2 + y <= 1, x - y > 0)$],
    True([$cases(3x - y <= 2, x + 5y >= -1)$]),
    [$cases(x - y^2 >= 3, 2x + y < 5)$],
    [$cases(x + y <= 1, x/y > 2)$]
  ),
  loigiai: [
    + Hệ gồm các bpt bậc nhất hai ẩn $a x + b y <= c$. Chỉ đáp án B đúng.
  ]
)

#tn([Tìm tất cả các giá trị của tham số $m$ để điểm $M(1; -2)$ thuộc miền nghiệm của bất phương trình $m x + (m - 1)y > 2$.],
  (
    [$m > 0$.],
    True([$m < 0$.]),
    [$m > 2$.],
    [$m < -2$.]
  ),
  loigiai: [
    + Thay tọa độ $x = 1, y = -2$ vào bất phương trình, ta được:
    + $m(1) + (m - 1)(-2) > 2$
    + $<=> m - 2m + 2 > 2$
    + $<=> -m > 0$
    + $<=> m < 0$.
  ]
)

#tn([Có bao nhiêu điểm nguyên nằm trong miền nghiệm của hệ bất phương trình $cases(x >= 1, y >= 0, x + y <= 4)$?],
  (
    [12.],
    True([10.]),
    [8.],
    [9.]
  ),
  loigiai: [
    - $x=1 => y in {0, 1, 2, 3}$ (4 điểm).
    - $x=2 => y in {0, 1, 2}$ (3 điểm).
    - $x=3 => y in {0, 1}$ (2 điểm).
    - $x=4 => y = 0$ (1 điểm).
    + Tổng số điểm: $4 + 3 + 2 + 1 = 10$.
  ]
)

#tn([Tính diện tích miền đa giác tạo bởi hệ bất phương trình $cases(0 <= x <= 2, 0 <= y <= 3)$.],
  (
    [2.],
    [3.],
    True([8.]),
    [5.]
  ),
  loigiai: [
    + Miền nghiệm là hình chữ nhật có kích thước $2 * 3$. Diện tích $S = 2 * 3 = 6$.
  ]
)

#tn([Tìm tất cả các giá trị của tham số $m$ để cặp $(1; 1)$ không thuộc miền nghiệm của bất phương trình $2m x + (m-3)y > 5$.],
  (
    [$m > 8/3$.],
    True([$m <= 8/3$.]),
    [$m >= 8/3$.],
    [$m < 8/3$.]
  ),
  loigiai: [
    + Cặp $(1; 1)$ không thuộc miền nghiệm khi và chỉ khi nó là nghiệm của bpt ngược lại: $2m(1) + (m-3)(1) <= 5 => 3m - 3 <= 5 => m <= 8/3$.
  ]
)

#tn([Một người cần mua hai loại trái cây: Cam và Táo. Giá một kg Cam là 30 nghìn đồng, giá một kg Táo là 40 nghìn đồng. Người đó mang theo 200 nghìn đồng và cần mua ít nhất 2 kg mỗi loại. Gọi $x, y$ là số kg Cam và Táo. Bất phương trình thể hiện số tiền là:],
  (
    [$30x + 40y >= 200$.],
    [$40x + 30y <= 200$.],
    True([$3x + 4y <= 20$.]),
    [$3x + 4y >= 20$.]
  ),
  loigiai: [
    + $30x + 40y <= 200 => 3x + 4y <= 20$.
  ]
)

#tn([Một xí nghiệp sản xuất hai loại sản phẩm $A$ và $B$. Để sản xuất 1 đơn vị $A$ tốn 3 giờ máy I và 2 giờ máy II. Để sản xuất 1 đơn vị $B$ tốn 1 giờ máy I và 4 giờ máy II. Máy I làm việc không quá 150 giờ, máy II làm việc không quá 200 giờ. Gọi $x, y$ là số đơn vị $A, B$. Hệ điều kiện là:],
  (
    [$cases(3x + y <= 200, 2x + 4y <= 150)$],
    [$cases(3x + 2y <= 150, x + 4y <= 200)$],
    True([$cases(3x + y <= 150, 2x + 4y <= 200)$]),
    [$cases(3x + y >= 150, 2x + 4y >= 200)$]
  ),
  loigiai: [
    + Máy I: $3x + 1y <= 150$. Máy II: $2x + 4y <= 200$. (Đúng).
  ]
)

#tn([Cho hệ bất phương trình $cases(x - y <= 1, x + y >= 3, x <= 4)$. Giá trị lớn nhất của $x$ trên miền nghiệm là:],
  (
    [3.],
    True([4.]),
    [1.],
    [5.]
  ),
  loigiai: [
    + Hệ có điều kiện $x <= 4$. Điểm $(4, 3)$ thỏa mãn hệ ($4-3 <= 1$, $4+3 >= 3$, $4 <= 4$). Vậy max $x$ là 4.
  ]
)

#tn([Một đội xe cần chở 150 người đi du lịch. Có hai loại xe: loại 45 chỗ và loại 16 chỗ. Giá thuê xe 45 chỗ là 2 triệu đồng/chiếc, xe 16 chỗ là 1 triệu đồng/chiếc. Do số lượng xe có hạn, chỉ thuê được tối đa 2 xe 45 chỗ và 4 xe 16 chỗ. Gọi $x, y$ là số xe mỗi loại cần thuê. Bất phương trình nào sai?],
  (
    [$0 <= x <= 2$.],
    [$0 <= y <= 4$.],
    True([$45x + 16y <= 150$.]),
    [$45x + 16y >= 150$.]
  ),
  loigiai: [
    + Cần chở 150 người nên sức chứa phải ít nhất bằng 150 $=> 45x + 16y >= 150$. Do đó bpt $45x + 16y <= 150$ là sai.
  ]
)

#tn([Một bác nông dân trồng hai loại hoa: Hồng và Cúc. Mỗi sào Hồng mang lại 5 triệu đồng, mỗi sào Cúc mang lại 3 triệu đồng. Do nhu cầu thị trường, bác dự định trồng diện tích Cúc lớn hơn hoặc bằng diện tích Hồng. Biết tổng diện tích là 8 sào. Hỏi bác nông dân có thể thu lợi nhuận lớn nhất bao nhiêu triệu đồng?],
  (
    [24.],
    [40.],
    True([32.]),
    [30.]
  ),
  loigiai: [
    + Gọi $x, y$ là số sào Hồng và Cúc. $x <= y$ và $x+y <= 8$.
    + Lợi nhuận $F = 5x + 3y$.
    + Giao điểm $y=x$ và $x+y=8 => x=4, y=4$.
    + Tại $(4, 4)$: $F = 5(4) + 3(4) = 32$.
    + Tại $(0, 8)$: $F = 24$.
    + Max lợi nhuận là 32 triệu đồng.
  ]
)

#tn([Có bao nhiêu điểm nguyên nằm trên biên của miền nghiệm $cases(x >= 0, y >= 0, 2x + 3y <= 6)$?],
  (
    [4.],
    [5.],
    [6.],
    True([6.])
  ),
  loigiai: [
    + Biên là 3 đoạn thẳng:
    + Trên $x=0$: $0 <= y <= 2 => (0,0), (0,1), (0,2)$ (3 điểm).
    + Trên $y=0$: $0 <= x <= 3 => (1,0), (2,0), (3,0)$ (3 điểm) (không tính $(0,0)$ lại).
    + Trên $2x+3y=6$: $(0,2), (3,0)$ đã đếm. Thử điểm nguyên khác: $x=1 => y=4/3$ (loại), $x=2 => y=2/3$ (loại).
    + Tổng cộng có $3 + 3 = 6$ điểm.
    
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ bất phương trình $cases(x - 2y >= -4, 2x + y <= 7, y >= 0)$. Gọi $S$ là miền đa giác nghiệm của hệ.],
  (
    True([Miền $S$ là một tam giác giới hạn.]),
    [Điểm $M(1; 3)$ thuộc miền nghiệm $S$.],
    True([Đa giác $S$ có một đỉnh là $(-4; 0)$.]),
    True([Diện tích của miền $S$ là 11.25.])
  ),
  loigiai: [
    + a) Miền giới hạn bởi 3 đường cắt nhau. (Đúng)
    + b) Thử $M(1; 3)$: $1 - 6 = -5 >= -4$ (Sai).
    + c) Giao của $x-2y = -4$ và $y=0 => x = -4 => A(-4; 0)$. (Đúng)
    + d) Giao $2x+y=7$ và $y=0 => B(3.5; 0)$.
    + Giao $x-2y=-4$ và $2x+y=7 => x=2y-4 => 2(2y-4)+y=7 => 5y = 15 => y=3, x=2 => C(2; 3)$.
    + Đáy $A B$ trên trục hoành dài $3.5 - (-4) = 7.5$. Chiều cao là $3$.
    + Diện tích $S = 1/2 * 7.5 * 3 = 11.25$. (Đúng).
  ]
)

#ds([Một xưởng điện tử có 2 dây chuyền lắp ráp A và B. Dây chuyền A sản xuất 100 tivi/ngày và 200 điện thoại/ngày, chi phí vận hành 20 triệu/ngày. Dây chuyền B sản xuất 300 tivi/ngày và 100 điện thoại/ngày, chi phí vận hành 30 triệu/ngày. Công ty cần ít nhất 900 tivi và 800 điện thoại trong tuần này. Gọi $x, y$ là số ngày hoạt động của A và B.],
  (
    True([Hệ điều kiện về số lượng sản phẩm là $cases(100x + 300y >= 900, 200x + 100y >= 800)$.]),
    True([Miền nghiệm của hệ trên mặt phẳng tọa độ (với $x >= 0, y >= 0$) không phải là một đa giác khép kín.]),
    [Để chi phí thấp nhất, dây chuyền A cần hoạt động 4 ngày và B không hoạt động.],
    True([Chi phí vận hành thấp nhất có thể đạt được là 120 triệu đồng.])
  ),
  loigiai: [
    + a) (Đúng).
    + b) (Đúng) vì điều kiện $>=$ tạo ra miền không bị chặn trên.
    + c) Giao điểm của $x+3y=9$ và $2x+y=8 => x=3, y=2$.
    + Các đỉnh: $(0; 8)$, $(9; 0)$, $(3; 2)$.
    + Chi phí $F = 20x + 30y$.
    + $F(0, 8) = 240$.
    + $F(9, 0) = 180$.
    + $F(3, 2) = 20(3) + 30(2) = 60 + 60 = 120$.
    + Vậy dây chuyền A hoạt động 3 ngày, B hoạt động 2 ngày. (Ý c Sai).
    + d) Chi phí thấp nhất là 120 triệu. (Đúng).
  ]
)

#ds([Cho hệ bất phương trình $cases(x - y <= 2, x + 2y <= 8, x >= 0, y >= 0)$.],
  (
    [Gốc tọa độ $O$ không thuộc miền nghiệm.],
    True([Điểm $(4; 2)$ là một đỉnh của đa giác miền nghiệm.]),
    [Có đúng 15 điểm có tọa độ là số nguyên nằm trong miền nghiệm.],
    [Giá trị lớn nhất của biểu thức $P = x - 3y$ trên miền nghiệm là 3.]
  ),
  loigiai: [
    + a)$(0,0)$ thuộc miền nghiệm. (Sai).
    + b) Giao của $x-y=2$ và $x+2y=8 => 3y = 6 => y=2, x=4$. Đỉnh là $(4;2)$. (Đúng).
    + c) Đếm điểm nguyên:
    + $x=0 => y in {0..4}$ (5)
    + $x=1 => y in {0..3}$ (4) (do $1-y <= 2 => y >= -1$)
    + $x=2 => y in {0..3}$ (4)
    + $x=3 => y in {0..2}$ (3)
    + $x=4 => y in {0..2}$ (3)
    + Tại $x=3$, $3-y <= 2 => y >= 1$, và $3+2y <= 8 => y <= 2.5 => y in {1, 2}$ (2 điểm).
    + Tại $x=2$, $2-y <= 2 => y >= 0$, và $2+2y <= 8 => y <= 3 => y in {0..3}$ (4 điểm).
    + Tại $x=1$, $1-y <= 2 => y >= -1$, và $1+2y <= 8 => y <= 3.5 => y in {0..3}$ (4 điểm).
    + Tại $x=0$, $y in {0..4}$ (5 điểm).
    + Tổng: $5 + 4 + 4 + 2 + 1 = 16$ điểm. (Sai).
    + d) Giá trị lớn nhất của $P = x - 3y$. Đỉnh $(0,0) => 0$; $(2,0) => 2$; $(4,2) => -2$; $(0,4) => -12$. Max là 2. (Sai).
  ]
)

#ds([Bác sĩ khuyên một bệnh nhân nên nạp vào cơ thể ít nhất 300 mg canxi và 150 mg magie mỗi ngày thông qua hai loại thực phẩm chức năng M và N. Mỗi viên M cung cấp 50 mg canxi và 20 mg magie, giá 10 nghìn đồng. Mỗi viên N cung cấp 30 mg canxi và 30 mg magie, giá 8 nghìn đồng.],
  (
    True([Nếu gọi $x, y$ là số viên M, N cần uống, điều kiện về canxi là $5x + 3y >= 30$.]),
    True([Điều kiện về magie là $2x + 3y >= 15$.]),
    True([Người bệnh có thể uống 4 viên M và 4 viên N để đủ khoáng chất.]),
    [Chi phí thấp nhất để bổ sung đủ khoáng chất là 50 nghìn đồng.]
  ),
  loigiai: [
    + a) Canxi: $50x + 30y >= 300 => 5x + 3y >= 30$. (Đúng).
    + b) Magie: $20x + 30y >= 150 => 2x + 3y >= 15$. (Đúng).
    + c) Thử $(4, 4)$: $5(4)+3(4) = 32 >= 30$ và $2(4)+3(4) = 20 >= 15$. (Đúng).
    + d) Giao điểm $5x+3y=30$ và $2x+3y=15 => 3x=15 => x=5, y=5/3$ (y không nguyên).
    + Thực tế phải chọn điểm nguyên. Tại $(5, 2)$: $5(5)+3(2)=31$, $2(5)+3(2)=16$. Chi phí = $10(5)+8(2) = 66$.
    + Tại $(6, 1)$: $5(6)+3 = 33$, $2(6)+3=15$. Chi phí = $60 + 8 = 68$.
    + Tại $(4, 4)$: Chi phí = $40 + 32 = 72$.
    + Tại $(0, 10)$: $F = 80$.
    + Tại $(8, 0)$: $F = 80$.
    + Chi phí thấp nhất là 66 nghìn đồng (không phải 50). (Sai).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Trong mặt phẳng tọa độ $O x y$, biết miền nghiệm của hệ $cases(2x + y <= 8, x + y <= 5, x >= 0, y >= 0)$ là một tứ giác $O A B C$. Tính diện tích của tứ giác này.],
  [11.5],
  loigiai: [
    + Vẽ các đường thẳng $d_1: 2x+y=8$ và $d_2: x+y=5$.
    + Miền nghiệm của hệ là tứ giác $O A B C$ được giới hạn bởi các trục tọa độ và hai đường thẳng trên.
    + Các đỉnh của tứ giác là $O(0;0)$, $A(4;0)$ (giao của $d_1$ và trục hoành), $C(0;5)$ (giao của $d_2$ và trục tung).
    + Đỉnh $B$ là giao điểm của $d_1$ và $d_2$: giải hệ $2x+y=8$ và $x+y=5$, ta được $x=3, y=2 => B(3;2)$.
    + Diện tích tứ giác $O A B C$ có thể tính bằng cách chia thành hai tam giác $S_{O A B} + S_{O B C}$, hoặc tính tổng diện tích hình chữ nhật và tam giác vuông:
    + Hình chiếu của $B(3;2)$ xuống trục hoành là $H(3;0)$. Ta có diện tích tứ giác là tổng diện tích hình thang vuông $O H B C$ và tam giác $H A B$:
      $ S = 1/2 (B H + O C) * O H + 1/2 * B H * H A = 1/2(2 + 5)*3 + 1/2*2*1 = 10.5 + 1 = 11.5 $
    + Vậy diện tích tứ giác là $11.5$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-1), (0,7), mark: (end: ">"), name: "y")
      content((-0.3, 7), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (3,2), (0,5), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((4.2, -0.3), $A(4;0)$)
      content((3.5, 2), $B(3;2)$)
      content((-0.6, 5), $C(0;5)$)
      line((3,2), (3,0), stroke: (dash: "dashed"))
      content((3, -0.3), $H(3;0)$)
    })]
  ]
)

#tln([Biết $m = m_0$ là giá trị lớn nhất để hệ bất phương trình $heva(y >= 0, x + 2y <= 4, x - y >= m)$ có nghiệm. Tìm $m_0$.],
  [4],
  loigiai: [
    + Để hệ có nghiệm, đường thẳng $x - y = m$ phải cắt hoặc tiếp xúc với miền nghiệm của hệ $y >= 0, x + 2y <= 4$.
    + Xét miền đa giác giới hạn bởi $y >= 0$ và $x + 2y <= 4$. Miền này là một nửa mặt phẳng chứa trục hoành $y=0$ và xẻ dài về phía âm của trục hoành (ví dụ điểm $(0;0), (4;0), (-2;3)$ đều thuộc miền).
    + Bài toán trở thành tìm giá trị lớn nhất của $F(x,y) = x - y$ trên miền nghiệm này để $m <= F(x,y)$.
    + Từ $x + 2y <= 4 => x <= 4 - 2y$.
    + Do $y >= 0$ nên $-y <= 0$.
    + Suy ra $F(x,y) = x - y <= (4 - 2y) - y = 4 - 3y$.
    + Vì $y >= 0$ nên $4 - 3y <= 4$. Vậy max $F(x,y) = 4$.
    + Dấu "=" xảy ra khi $y = 0$ và $x = 4$. Điểm $(4;0)$ hoàn toàn thuộc miền nghiệm.
    + Vậy giá trị lớn nhất của $m$ để hệ có nghiệm là $m_0 = 4$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-3,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-1), (0,4), mark: (end: ">"), name: "y")
      content((-0.3, 4), $y$)
      content((-0.3, -0.3), $O$)
      line((4,0), (-2,3), (-3,3.5), (-3,0), close: true, fill: rgb(0,0,255,30), stroke: none)
      line((4,0), (-2,3), stroke: blue)
      content((4, -0.4), $(4;0)$)
      line((-2, -1), (3, 4), stroke: red, name: "m4")
      content((2, 3), text(fill: red, $x-y=4$))
    })]
  ]
)

#tln([Có bao nhiêu giá trị nguyên của tham số $m$ thuộc khoảng $(-10; 10)$ để bất phương trình $x - y + m > 0$ có miền nghiệm chứa điểm $A(1; 3)$?],
  [7],
  loigiai: [
    + Để điểm $A(1; 3)$ nằm trong miền nghiệm của bất phương trình $x - y + m > 0$, tọa độ của điểm $A$ phải thỏa mãn bất phương trình đó.
    + Thay $x = 1, y = 3$ vào bất phương trình, ta được:
      $ 1 - 3 + m > 0 <=> m - 2 > 0 <=> m > 2 $
    + Theo đề bài, $m$ là số nguyên và thuộc khoảng $(-10; 10)$, nên $m$ có thể nhận các giá trị:
      $ m in {3; 4; 5; 6; 7; 8; 9} $
    + Đếm số các giá trị trong tập hợp trên, ta có 7 giá trị.
    + Vậy có tất cả 7 giá trị nguyên của tham số $m$.

  ]
)

#tln([Hệ bất phương trình $cases(x - y <= 3, 2x + y <= 12, x >= 0, y >= 0)$ có miền nghiệm là một tứ giác. Gọi $x_0$ và $y_0$ là hoành độ và tung độ của đỉnh có tung độ lớn nhất trong tứ giác. Tính giá trị $x_0^2 + y_0^2$.],
  [144],
  loigiai: [
    + Miền nghiệm của hệ là một tứ giác tạo bởi các đường $x-y=3, 2x+y=12, x=0, y=0$.
    + Lần lượt tìm tọa độ các đỉnh của đa giác miền nghiệm:
      - Giao của $x=0, y=0$ là $O(0;0)$.
      - Giao của $y=0$ và $x-y=3$ là $A(3;0)$.
      - Giao của $x=0$ và $2x+y=12$ là $C(0;12)$.
      - Giao của $x-y=3$ và $2x+y=12$: giải hệ ta được $3x = 15 => x=5, y=2$. Tọa độ $B(5;2)$.
    + Bốn đỉnh của tứ giác là $(0;0), (3;0), (5;2)$ và $(0;12)$.
    + Đỉnh có tung độ lớn nhất trong tứ giác này là $C(0; 12)$ với tung độ $y_0 = 12$ và hoành độ $x_0 = 0$.
    + Yêu cầu bài toán tính $x_0^2 + y_0^2 = 0^2 + 12^2 = 144$.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (7,0), mark: (end: ">"), name: "x")
      content((7, -0.5), $x$)
      line((0,-1), (0,14), mark: (end: ">"), name: "y")
      content((-0.5, 14), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (3,0), (5,2), (0,12), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((3, -0.8), $(3;0)$)
      content((5.8, 2), $(5;2)$)
      content((-1.5, 12), $(0;12)$)
    })]
  ]
)

#tln([Một nhà máy luyện kim cần chế tạo một hợp kim với yêu cầu:
- Chứa ít nhất 100 tấn đồng.
- Chứa ít nhất 80 tấn kẽm.
Họ có thể mua hai loại quặng với thông tin như sau:
- Quặng loại A: chứa 10% đồng và 20% kẽm, giá 2 triệu đồng/tấn.
- Quặng loại B: chứa 30% đồng và 10% kẽm, giá 3 triệu đồng/tấn.
Hỏi cần mua bao nhiêu tấn quặng loại A để chi phí mua quặng là nhỏ nhất?],
  [280],
  loigiai: [
    + Gọi $x, y$ lần lượt là số tấn quặng loại A và loại B cần mua ($x >= 0, y >= 0$).
    + Lượng đồng nguyên chất thu được phải ít nhất 100 tấn:
      $ 10% x + 30% y >= 100 <=> 0.1x + 0.3y >= 100 <=> x + 3y >= 1000 $
    + Lượng kẽm thu được phải ít nhất 80 tấn:
      $ 20% x + 10% y >= 80 <=> 0.2x + 0.1y >= 80 <=> 2x + y >= 800 $
    + Hàm chi phí cần đạt giá trị nhỏ nhất: $F(x,y) = 2x + 3y$ (triệu đồng).
    + Giải hệ phương trình $x+3y=1000$ và $2x+y=800$, ta tìm được giao điểm của hai đường thẳng là $(280; 240)$.
    + Các đỉnh của miền nghiệm đa giác không bị chặn là: $(0; 800), (280; 240)$ và $(1000; 0)$.
    + Tính chi phí tại các đỉnh:
      - $F(0; 800) = 3(800) = 2400$
      - $F(1000; 0) = 2(1000) = 2000$
      - $F(280; 240) = 2(280) + 3(240) = 560 + 720 = 1280$
    + Chi phí nhỏ nhất là 1280 triệu đồng khi dùng 280 tấn quặng loại A và 240 tấn quặng loại B.
    + Vậy khối lượng quặng loại A cần dùng là 280 tấn.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      // Dùng tỉ lệ 1 đơn vị trên hình = 100 đơn vị thực tế
      line((-0.5,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.5), $x$)
      line((0,-0.5), (0,10), mark: (end: ">"), name: "y")
      content((-0.5, 10), $y$)
      content((-0.4, -0.4), $O$)
      line((10,0), (12,0), (12,10), (0,10), (0,8), (2.8,2.4), close: true, fill: rgb(0,0,255,30), stroke: none)
      line((10,0), (2.8,2.4), (0,8), stroke: blue)
      content((10, -0.6), $(1000;0)$)
      content((3.2, 2.6), $(280;240)$)
      content((-1.5, 8), $(0;800)$)
    })]
  ]
)

#tln([Tính số điểm nguyên nằm bên trong (không tính biên) của tam giác tạo bởi các đường thẳng $x = 0, y = 0$ và $2x + 5y = 10$.],
  [2],
  loigiai: [
    + Tam giác tạo bởi ba đường thẳng $x=0, y=0$ và $2x+5y=10$ là tam giác vuông tại $O(0;0)$.
    + Các đỉnh của tam giác trên trục tọa độ là giao điểm của đường thẳng $2x+5y=10$ với các trục:
      - Giao với trục tung $O y$ ($x=0$): $5y = 10 => y = 2$. Đỉnh $B(0;2)$.
      - Giao với trục hoành $O x$ ($y=0$): $2x = 10 => x = 5$. Đỉnh $A(5;0)$.
    + Yêu cầu bài toán là tìm số điểm nguyên $(x; y)$ nằm CỤC BỘ BÊN TRONG (không tính biên) tam giác.
    + Tức là ta phải tìm các số nguyên $x, y$ thỏa mãn điều kiện nghiêm ngặt: $x > 0, y > 0$ và $2x + 5y < 10$.
    + Do $x, y$ là số nguyên và $x > 0, y > 0$, ta có $x >= 1, y >= 1$.
    + Thử lần lượt các giá trị của $y$:
      - Nếu $y = 1$: $2x + 5(1) < 10 => 2x < 5 => x < 2.5$. Vì $x >= 1$ nên $x in {1; 2}$.
        Ta có 2 điểm: $(1;1)$ và $(2;1)$.
      - Nếu $y = 2$: $2x + 5(2) < 10 => 2x < 0$ (vô lý vì $x >= 1$).
    + Vậy có đúng 2 điểm nguyên nằm bên trong tam giác là $(1;1)$ và $(2;1)$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-1), (0,3), mark: (end: ">"), name: "y")
      content((-0.3, 3), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (5,0), (0,2), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((5.2, -0.3), $A(5;0)$)
      content((-0.6, 2), $B(0;2)$)
      circle((1,1), radius: 0.08, fill: red)
      circle((2,1), radius: 0.08, fill: red)
      content((1, 0.7), $(1;1)$)
      content((2, 0.7), $(2;1)$)
    })]
  ]
)
