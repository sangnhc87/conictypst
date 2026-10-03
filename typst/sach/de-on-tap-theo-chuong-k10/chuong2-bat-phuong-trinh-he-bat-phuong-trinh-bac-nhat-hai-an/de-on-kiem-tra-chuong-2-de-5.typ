#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("e11d48")
#let ma-de = "1005"
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

#tn([Bất phương trình nào sau đây là bất phương trình bậc nhất hai ẩn?],
  (
    [$x^2 - y > 0$.],
    [$x + y^3 <= 2$.],
    True([$3x - 4y >= -5$.]),
    [$1/x + y < 1$.]
  ),
  loigiai: [
    + Chỉ có $3x - 4y >= -5$ có dạng $a x + b y >= c$.
  ]
)

#tn([Cặp số $(1; 2)$ KHÔNG thuộc miền nghiệm của bất phương trình nào sau đây?],
  (
    [$x + y > 2$.],
    True([$2x - y >= 1$.]),
    [$x - 2y < 0$.],
    [$3x + y <= 6$.]
  ),
  loigiai: [
    + Thay $x=1, y=2$ vào $2x - y >= 1$: $2(1) - 2 = 0 >= 1$ (Sai).
  ]
)

#tn([Miền nghiệm của hệ bất phương trình $heva(x >= 0, y >= 0, x + y <= 4)$ là một đa giác. Diện tích của đa giác đó bằng bao nhiêu?],
  (
    [$4$.],
    True([$8$.]),
    [$16$.],
    [$2$.]
  ),
  loigiai: [
    + Miền nghiệm là tam giác vuông $O A B$ với $O(0;0), A(4;0), B(0;4)$.
    + Diện tích tam giác là $S = 1/2 O A \cdot O B = 1/2 \cdot 4 \cdot 4 = 8$.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.4), $x$)
      line((0,-1), (0,5), mark: (end: ">"), name: "y")
      content((-0.4, 5), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (0,4), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((4, -0.4), $A(4;0)$)
      content((-0.4, 4), $B(0;4)$)
    })]
  ]
)

#tn([Một đa giác miền nghiệm được tạo bởi hệ $cases(0 <= x <= 3, 0 <= y <= 4, x + y <= 5)$. Đa giác này có bao nhiêu đỉnh?],
  (
    [3.],
    True([4.]),
    True([5.]),
    [6.]
  ),
  loigiai: [
    + Các đỉnh của đa giác: $(0;0)$, $(3;0)$, $(3;2)$, $(1;4)$, $(0;4)$. Tổng cộng 5 đỉnh.
  ]
)

#tn([Diện tích đa giác tạo bởi hệ bất phương trình $cases(x - y >= 0, x + y <= 4, x >= 0, y >= 0)$ là:],
  (
    [8.],
    True(True([4.])),
    [2.],
    [6.]
  ),
  loigiai: [
    + Hệ được tạo bởi $y <= x$, $y <= 4-x$, $y >= 0$, $x >= 0$.
    + Các đỉnh: $(0;0)$, $(4;0)$, và giao điểm của $y=x$ với $y=4-x => x=2, y=2 => (2;2)$.
    + Miền nghiệm là tam giác với đáy trên trục hoành dài 4, chiều cao là 2.
    + Diện tích $S = 1/2 * 4 * 2 = 4$.
  ]
)

#tn([Tìm $m$ để gốc tọa độ $O(0;0)$ nằm ngoài miền nghiệm của bất phương trình $x - 3y < m^2 - 4$.],
  (
    [$m > 2$.],
    [$m < -2$.],
    True([$-2 <= m <= 2$.]),
    [Với mọi $m$.]
  ),
  loigiai: [
    + $O(0;0)$ nằm ngoài miền nghiệm tức là không là nghiệm của bpt: $0 - 3(0) >= m^2 - 4 => m^2 <= 4 => -2 <= m <= 2$.
  ]
)

#tn([Một trường học cần thuê xe để chở 250 học sinh đi tham quan. Công ty cho thuê có hai loại xe: xe lớn 45 chỗ giá 2.5 triệu đồng, xe nhỏ 30 chỗ giá 2 triệu đồng. Trường chỉ có thể thuê tối đa 4 xe lớn. Gọi $x, y$ là số xe lớn và nhỏ cần thuê. Bất phương trình nào dưới đây là sai?],
  (
    [$45x + 30y >= 250$.],
    [$x >= 0, y >= 0$.],
    True([$x >= 4$.]),
    [$x <= 4$.]
  ),
  loigiai: [
    + Trường chỉ có thể thuê tối đa 4 xe lớn nên $x <= 4$. Bất phương trình $x >= 4$ là sai.
  ]
)

#tn([Công ty M cần sản xuất ít nhất 300 sản phẩm A và 200 sản phẩm B. Mỗi giờ máy I sản xuất được 10 sản phẩm A và 5 sản phẩm B. Mỗi giờ máy II sản xuất được 5 sản phẩm A và 10 sản phẩm B. Gọi $x, y$ là số giờ hoạt động của máy I và máy II. Hệ điều kiện là:],
  (
    True([$cases(10x + 5y >= 300, 5x + 10y >= 200)$]),
    [$cases(10x + 5y <= 300, 5x + 10y <= 200)$],
    [$cases(5x + 10y >= 300, 10x + 5y >= 200)$],
    [$cases(10x + 5y >= 200, 5x + 10y >= 300)$]
  ),
  loigiai: [
    + Số sản phẩm A: $10x + 5y >= 300$. Số sản phẩm B: $5x + 10y >= 200$.
  ]
)

#tn([Giá trị nhỏ nhất của hàm mục tiêu $F = x - y$ trên miền nghiệm của hệ $cases(x >= 0, y >= 0, x + y <= 4)$ đạt được tại điểm nào?],
  (
    [$(0;0)$.],
    [$(4;0)$.],
    True([$(0;4)$.]),
    [$(2;2)$.]
  ),
  loigiai: [
    + $F(0;0) = 0$, $F(4;0) = 4$, $F(0;4) = -4$, $F(2;2) = 0$. Nhỏ nhất là -4 tại $(0;4)$.
  ]
)

#tn([Có bao nhiêu điểm nguyên $(x; y)$ thỏa mãn $cases(0 <= x <= 2, 0 <= y <= 2, 2x + y > 3)$?],
  (
    [2.],
    [3.],
    True([4.]),
    [5.]
  ),
  loigiai: [
    + Thử các điểm nguyên:
    + $(2;2): 4+2=6>3$ (nhận).
    + $(2;1): 4+1=5>3$ (nhận).
    + $(2;0): 4>3$ (nhận).
    + $(1;2): 2+2=4>3$ (nhận).  is this 4 points?)
    + Let's check $x=1, y=1 => 2+1=3 > 3$ (loại).
    + Vậy có 4 điểm: $(2,0), (2,1), (2,2), (1,2)$. Đáp án là 4.
  ]
)

#tn([Một doanh nghiệp có 2 phương án quảng cáo: trên truyền hình và trên báo chí. Quảng cáo truyền hình tốn 20 triệu/phút và tiếp cận được 100 ngàn người. Quảng cáo trên báo tốn 5 triệu/lần và tiếp cận được 40 ngàn người. Ngân sách quảng cáo không quá 100 triệu, đồng thời quảng cáo báo chí không được vượt quá 10 lần. Gọi $x$ (phút) và $y$ (lần) là số lượng quảng cáo. Bất phương trình ngân sách là:],
  (
    [$20x + 5y >= 100$.],
    True([$4x + y <= 20$.]),
    [$5x + 20y <= 100$.],
    [$x + 4y <= 20$.]
  ),
  loigiai: [
    + Ngân sách: $20x + 5y <= 100 => 4x + y <= 20$.
  ]
)

#tn([Tìm diện tích hình vuông bé nhất chứa toàn bộ miền nghiệm của hệ $cases(0 <= x <= 3, 0 <= y <= 3, x + y <= 4)$?],
  (
    [4.],
    [16.],
    True([9.]),
    [12.]
  ),
  loigiai: [
    + Miền nghiệm giới hạn bởi $0 <= x <= 3$ và $0 <= y <= 3$. Hình vuông nhỏ nhất chứa miền này chính là hình vuông $0 <= x <= 3, 0 <= y <= 3$ có cạnh bằng 3. Diện tích là 9.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ bất phương trình $cases(2x - y <= 4, x + y <= 5, x >= 0, y >= 0)$. Gọi $S$ là miền đa giác nghiệm của hệ.],
  (
    True([Miền $S$ là một tứ giác.]),
    [Điểm $M(3; 3)$ thuộc miền $S$.],
    [Đa giác $S$ có diện tích bằng 11.5.],
    [Giá trị lớn nhất của $F = 3x + y$ trên miền $S$ là 10.]
  ),
  loigiai: [
    + a) Cắt nhau tạo thành tứ giác với các đỉnh: $O(0,0), A(2,0), B(3,2), C(0,5)$. (Đúng).
    + b)$M(3;3) => 3+3=6 > 5$ (Sai).
    + c) Diện tích = $S_"O A B" + S_"O B C" = 1/2 * 2 * 2 + 1/2 * 5 * 3 = 2 + 7.5 = 9.5$. (Ý c Sai).
    + d) Đỉnh: $(0,0) => 0$, $(2,0) => 6$, $(3,2) => 11$, $(0,5) => 5$. Max $F=11$. (Ý d Sai).
  ]
)

#ds([Một hộ nông dân nuôi heo và gà. Chi phí thức ăn mỗi ngày cho 1 con heo là 20 nghìn đồng, cho 1 con gà là 5 nghìn đồng. Hộ gia đình chỉ có thể chi tối đa 1 triệu đồng/ngày cho thức ăn. Trại có sức chứa tối đa 40 con heo và 150 con gà. Lợi nhuận từ mỗi con heo là 500 nghìn, từ mỗi con gà là 150 nghìn. Gọi $x, y$ là số heo và gà được nuôi.],
  (
    True([Hệ bất phương trình ràng buộc là $cases(0 <= x <= 40, 0 <= y <= 150, 4x + y <= 200)$.]),
    True([Người nông dân có thể nuôi 30 con heo và 80 con gà.]),
    [Lợi nhuận lớn nhất có thể đạt được là 27.5 triệu đồng.],
    [Hộ nông dân sẽ đạt lợi nhuận lớn nhất khi nuôi đủ 40 con heo.]
  ),
  loigiai: [
    + a) Thức ăn: $20x + 5y <= 1000 => 4x + y <= 200$. (Đúng, nhớ đổi `\,;\,` thành `,`).
    + b) Thử $(30, 80)$: $4(30)+80 = 200 <= 200$ (Đúng).
    + c) Lợi nhuận $F = 500x + 150y$ (nghìn đồng).
    + Các đỉnh miền: $(0, 0)$, $(40, 0)$, $(40, 40)$, $(12.5, 150)$ (không nguyên $=> (12, 150)$). Đỉnh nguyên gần giao điểm $y=150$ và $4x+y=200 => 4x = 50 => x=12.5$.
    + Chọn điểm nguyên $(12, 150) => F = 500(12) + 150(150) = 6000 + 22500 = 28500$.
    + Thử điểm $(40, 40) => F = 500(40) + 150(40) = 20000 + 6000 = 26000$.
    + Thử $(13, 148) => 4(13)+148 = 200$. $F = 500(13) + 150(148) = 6500 + 22200 = 28700$.
    + Vậy lợi nhuận lớn nhất là 28.7 triệu. (Ý c Sai).
    + d) Nuôi lớn nhất tại $(13, 148)$, không phải đủ 40 con heo. (Sai).
  ]
)

#ds([Cho hệ $cases(x + y >= 1, x - y <= 1, x <= 2)$ có miền nghiệm là miền $S$.],
  (
    [Gốc tọa độ $O$ thuộc miền $S$.],
    True([Miền $S$ là một miền không bị chặn.]),
    [Cặp số $(2; 0)$ là một nghiệm của hệ.],
    True([Trong miền $S$, giá trị nhỏ nhất của $x$ là $0$.])
  ),
  loigiai: [
    + a)$O(0,0): 0+0 >= 1$ (Sai).
    + b) Điều kiện $x <= 2$, $y >= 1-x$, $y >= x-1$. 
    + Vì $y$ chỉ bị chặn dưới, không chặn trên nên $y \to +oo$ thoả mãn. Miền không bị chặn (Đúng).
    + c)$(2, 0): 2 >= 1, 2 <= 1$ (Sai). Vậy ý c Sai.
    + d) Nhỏ nhất của $x$: từ $x+y >= 1$ và $x-y <= 1 =>$ cộng lại $2x >= 0 => x >= 0$. Min $x$ là $0$ (ví dụ điểm $x=0, y=1$). (Đúng).
  ]
)

#ds([Một xưởng cơ khí cần chia 100 kg thép để làm bu lông và ốc vít. Làm 1 hộp bu lông cần 2 kg thép và mất 3 giờ. Làm 1 hộp ốc vít cần 1 kg thép và mất 4 giờ. Xưởng có tối đa 120 giờ. Gọi $x, y$ là số hộp bu lông và ốc vít được làm.],
  (
    True([Hệ bất phương trình ràng buộc là $cases(2x + y <= 100, 3x + 4y <= 120, x >= 0, y >= 0)$.]),
    [Xưởng có thể làm được 30 hộp bu lông và 10 hộp ốc vít.],
    True([Nếu lợi nhuận mỗi hộp bu lông là 40 nghìn, ốc vít là 30 nghìn thì lợi nhuận cực đại là 1600 nghìn.]),
    [Để đạt lợi nhuận cực đại, xưởng phải sản xuất cả hai loại.]
  ),
  loigiai: [
    + a) (Đúng).
    + b)$30(3) + 10(4) = 130 > 120$ (Sai).
    + c)$F = 40x + 30y$. Đỉnh: $(0, 30) => 900$; $(50, 0) => 2000$. 
    + Giao điểm $2x+y=100$ và $3x+4y=120 => y=100-2x => 3x+400-8x=120 => 5x=280 => x=56, y=-12$ (loại).
    + Thực ra với $x=50, y=0$ thì thỏa $2(50)+0 <= 100$ và $3(50)+0 = 150 > 120$. 
    + Vậy đỉnh trên trục $O x$ phải tính theo $3x <= 120 => x = 40$. Tại $(40, 0) => F = 1600$.
    + Các đỉnh của miền: $(0, 0)$, $(40, 0)$, $(0, 30)$. Max là 1600. (Đúng).
    + d) Hệ là tam giác với đỉnh $(0,0), (40,0), (0,30)$. Số điểm nguyên trong tam giác (và trên biên): dùng định lý Pick hoặc Pick không áp dụng trực tiếp được nếu đếm nguyên lý. 
    + $x=0 => y in {0..30} => 31$.
    + Tại lợi nhuận cực đại (40, 0), xưởng chỉ sản xuất bu lông. (Sai).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Trong một đợt cứu trợ, một đội xe có hai loại: xe A chở 4 tấn hàng và xe B chở 3 tấn hàng. Đội xe cần chở ít nhất 30 tấn hàng. Chi phí vận hành mỗi xe A là 2 triệu đồng, xe B là 1.2 triệu đồng. Do số lượng tài xế có hạn, tổng số xe sử dụng không quá 10 chiếc. Hỏi chi phí vận hành nhỏ nhất (đơn vị: triệu đồng) là bao nhiêu?],
  [12],
  loigiai: [
    + Gọi $x, y$ lần lượt là số lượng xe loại A và loại B cần thuê ($x >= 0, y >= 0, x, y in ZZ$).
    + Do tổng số xe sử dụng không quá 10 chiếc nên ta có: $x + y <= 10$.
    + Lượng hàng cần chở ít nhất là 30 tấn nên: $4x + 3y >= 30$.
    + Chi phí vận hành là hàm mục tiêu cần đạt giá trị nhỏ nhất: $F(x,y) = 2x + 1.2y$ (triệu đồng).
    + Bài toán trở thành: Tìm $F_(min)$ với điều kiện $x, y >= 0; x+y <= 10; 4x+3y >= 30$.
    + Miền nghiệm của hệ là tam giác giới hạn bởi các điểm $A(0;10), B(10;0)$ và $C(7.5;0)$.
    + Tuy nhiên, $x, y$ phải là số nguyên, ta lập bảng các điểm nguyên thuộc miền nghiệm (thỏa mãn $x+y <= 10$ và $4x+3y >= 30$):
      - Khi $y = 10 => x = 0$ (thoả). Chi phí $F = 12$.
      - Khi $y = 9 => x = 1$ (thoả). Chi phí $F = 2(1) + 1.2(9) = 12.8$.
      - Khi $y = 8 => 4x >= 6 => x >= 2$. Nếu $x = 2 => F = 4 + 9.6 = 13.6$.
      - Khi $y = 7 => 4x >= 9 => x >= 3$. Nếu $x = 3 => F = 6 + 8.4 = 14.4$.
    + Thấy ngay điểm $x=0, y=10$ cho chi phí thấp nhất.
    + Vậy chi phí nhỏ nhất là 12 triệu đồng (khi thuê 10 xe B và 0 xe A).
    #align(center)[#cetz.canvas(length: 4mm, {
      import cetz.draw: *
      line((-1,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.6), $x$)
      line((0,-1), (0,12), mark: (end: ">"), name: "y")
      content((-0.6, 12), $y$)
      content((-0.5, -0.5), $O$)
      line((0,10), (10,0), (7.5,0), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((10.2, -0.8), $(10;0)$)
      content((7.5, -0.8), $(7.5;0)$)
      content((-1.5, 10), $(0;10)$)
      circle((0,10), radius: 0.2, fill: red)
    })]
  ]
)

#tln([Biết $m = m_0$ là giá trị lớn nhất để hệ bất phương trình $heva(y >= 0, x + 2y <= 4, x - y >= m)$ có nghiệm. Tìm $m_0$.],
  [4],
  loigiai: [
    + Để hệ có nghiệm, đường thẳng $x - y = m$ phải cắt hoặc tiếp xúc với miền nghiệm của hệ $y >= 0, x + 2y <= 4$.
    + Miền nghiệm của hai bất phương trình đầu là một miền không bị chặn, chứa nửa mặt phẳng nằm dưới đường thẳng $x+2y=4$ và phía trên trục hoành $y=0$.
    + Yêu cầu hệ có nghiệm tương đương với việc tìm giá trị lớn nhất của biểu thức $F(x,y) = x - y$ trên miền nghiệm này.
    + Từ $x + 2y <= 4$, ta rút ra $x <= 4 - 2y$.
    + Do điều kiện $y >= 0$, ta có $-y <= 0$.
    + Khi đó: $F(x,y) = x - y <= (4 - 2y) - y = 4 - 3y$.
    + Vì $y >= 0$ nên $4 - 3y <= 4$. Suy ra max $F(x,y) = 4$.
    + Dấu "=" đạt được khi và chỉ khi $y = 0$ và $x = 4$. Điểm $(4;0)$ hoàn toàn thuộc miền nghiệm ban đầu.
    + Vậy $m_0 = 4$.
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
      line((-2, -1), (3, 4), stroke: red)
      content((2, 3), text(fill: red, $x-y=4$))
    })]
  ]
)

#tln([Có bao nhiêu cặp số nguyên $(x; y)$ thỏa mãn đồng thời các điều kiện $x >= 0, y >= 0$ và $5x + 7y <= 35$?],
  [25],
  loigiai: [
    + Miền nghiệm của hệ $x >= 0, y >= 0, 5x + 7y <= 35$ là một tam giác giới hạn bởi hai trục tọa độ và đường thẳng $5x+7y=35$.
    + Do $x, y in ZZ$ và không âm, ta có thể duyệt qua từng giá trị nguyên của $y$ từ 0 đến lớn nhất có thể ($y <= 35/7 = 5$):
      - Khi $y = 0 => 5x <= 35 => x <= 7 => x in {0, 1, ..., 7}$ (có 8 cặp).
      - Khi $y = 1 => 5x <= 28 => x <= 5.6 => x in {0, 1, ..., 5}$ (có 6 cặp).
      - Khi $y = 2 => 5x <= 21 => x <= 4.2 => x in {0, 1, ..., 4}$ (có 5 cặp).
      - Khi $y = 3 => 5x <= 14 => x <= 2.8 => x in {0, 1, 2}$ (có 3 cặp).
      - Khi $y = 4 => 5x <= 7 => x <= 1.4 => x in {0, 1}$ (có 2 cặp).
      - Khi $y = 5 => 5x <= 0 => x <= 0 => x = 0$ (có 1 cặp).
    + Tổng số cặp số nguyên là: $8 + 6 + 5 + 3 + 2 + 1 = 25$ cặp.
    #align(center)[#cetz.canvas(length: 6mm, {
      import cetz.draw: *
      line((-1,0), (9,0), mark: (end: ">"), name: "x")
      content((9, -0.4), $x$)
      line((0,-1), (0,7), mark: (end: ">"), name: "y")
      content((-0.4, 7), $y$)
      content((-0.4, -0.4), $O$)
      line((0,0), (7,0), (0,5), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((7, -0.5), $7$)
      content((-0.5, 5), $5$)
      for j in range(0, 6) {
        let max_x = calc.floor((35 - 7*j) / 5)
        for i in range(0, max_x + 1) {
          circle((i,j), radius: 0.1, fill: red)
        }
      }
    })]
  ]
)

#tln([Tìm giá trị lớn nhất của biểu thức $T = 3x + 2y$ trên miền nghiệm của hệ $cases(x - y <= 2, x + y <= 4, x >= 0, y >= 0)$.],
  [11],
  loigiai: [
    + Miền nghiệm của hệ tạo thành một đa giác giới hạn bởi $x=0, y=0, x-y=2$ và $x+y=4$.
    + Lần lượt tìm tọa độ các đỉnh của đa giác:
      - Đỉnh $O(0;0)$.
      - Giao của $y=0$ và $x-y=2$ là $A(2;0)$.
      - Giao của $x=0$ và $x+y=4$ là $C(0;4)$.
      - Giao của $x-y=2$ và $x+y=4$: giải hệ ta được $2x = 6 => x=3, y=1$. Tọa độ $B(3;1)$.
    + Các đỉnh của miền nghiệm là $O(0;0), A(2;0), B(3;1), C(0;4)$.
    + Ta tính giá trị của $T = 3x + 2y$ tại từng đỉnh:
      - $T(0;0) = 0$
      - $T(2;0) = 3(2) + 0 = 6$
      - $T(3;1) = 3(3) + 2(1) = 11$
      - $T(0;4) = 0 + 2(4) = 8$
    + Giá trị lớn nhất của $T$ là 11, đạt được tại điểm $B(3;1)$.
    #align(center)[#cetz.canvas(length: 8mm, {
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.3), $x$)
      line((0,-1), (0,6), mark: (end: ">"), name: "y")
      content((-0.3, 6), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (2,0), (3,1), (0,4), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((2, -0.4), $(2;0)$)
      content((3.3, 1), $(3;1)$)
      content((-0.7, 4), $(0;4)$)
    })]
  ]
)

#tln([Một sinh viên dự định dành không quá 10 giờ mỗi tuần để làm thêm 2 công việc: gia sư và phục vụ quán cafe. Lương gia sư là 100 nghìn/giờ, phục vụ là 50 nghìn/giờ. Do yêu cầu công việc, sinh viên phải làm phục vụ ít nhất 3 giờ. Hãy tính số tiền lớn nhất (đơn vị: trăm nghìn đồng) sinh viên có thể kiếm được trong tuần.],
  [8.5],
  loigiai: [
    + Gọi $x, y$ lần lượt là số giờ sinh viên đó làm gia sư và phục vụ quán cafe ($x, y >= 0$).
    + Do tổng số giờ làm không quá 10 giờ nên: $x + y <= 10$.
    + Yêu cầu công việc phục vụ phải làm ít nhất 3 giờ nên: $y >= 3$.
    + Hàm thu nhập (đơn vị: trăm nghìn đồng): $F(x,y) = 1*x + 0.5*y = x + 0.5y$.
    + Miền nghiệm của hệ là một tam giác được giới hạn bởi các đường $x=0, y=3$ và $x+y=10$.
    + Các đỉnh của miền nghiệm là giao điểm của các đường trên:
      - Giao của $x=0$ và $y=3$ là $A(0;3)$.
      - Giao của $x=0$ và $x+y=10$ là $B(0;10)$.
      - Giao của $y=3$ và $x+y=10$ là $C(7;3)$.
    + Tính thu nhập $F(x,y)$ tại các đỉnh:
      - $F(0; 3) = 0.5(3) = 1.5$ (trăm nghìn).
      - $F(0; 10) = 0.5(10) = 5$ (trăm nghìn).
      - $F(7; 3) = 1(7) + 0.5(3) = 8.5$ (trăm nghìn).
    + Số tiền lớn nhất sinh viên có thể kiếm được là 8.5 trăm nghìn đồng (850 nghìn đồng).
    #align(center)[#cetz.canvas(length: 4mm, {
      import cetz.draw: *
      line((-1,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.6), $x$)
      line((0,-1), (0,12), mark: (end: ">"), name: "y")
      content((-0.6, 12), $y$)
      content((-0.5, -0.5), $O$)
      line((0,3), (7,3), (0,10), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((-1.5, 3), $(0;3)$)
      content((7, 2.2), $(7;3)$)
      content((-1.5, 10), $(0;10)$)
    })]
  ]
)

#tln([Biết miền đa giác tạo bởi hệ $cases(x >= 0, y >= 0, x <= 4, y <= x + 2)$ là một hình thang vuông. Diện tích hình thang này là bao nhiêu?],
  [16],
  loigiai: [
    + Ta vẽ lần lượt các đường thẳng $x=0$ (trục tung), $y=0$ (trục hoành), $x=4$ (đường thẳng song song trục tung) và $y=x+2$.
    + Miền nghiệm của hệ là phần giao của các nửa mặt phẳng tương ứng, tạo thành một tứ giác $O A B C$.
    + Tìm tọa độ các đỉnh:
      - $O(0;0)$ là gốc tọa độ.
      - $A(4;0)$ là giao điểm của $y=0$ và $x=4$.
      - $B(4;6)$ là giao điểm của $x=4$ và đường $y=x+2$ ($y=4+2=6$).
      - $C(0;2)$ là giao điểm của đường $y=x+2$ với trục tung $x=0$.
    + Tứ giác $O A B C$ có cạnh $O A$ nằm trên trục hoành (vuông góc với trục tung), nên đây là một hình thang vuông tại $O$ và $A$.
    + Hai đáy của hình thang là $O C = 2$ và $A B = 6$.
    + Chiều cao của hình thang là $O A = 4$.
    + Diện tích hình thang là: $S = 1/2(O C + A B) * O A = 1/2(2 + 6) * 4 = 16$.
    #align(center)[#cetz.canvas(length: 6mm, {
      import cetz.draw: *
      line((-1,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-1), (0,8), mark: (end: ">"), name: "y")
      content((-0.3, 8), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (4,6), (0,2), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((4.2, -0.4), $A(4;0)$)
      content((4.2, 6), $B(4;6)$)
      content((-0.6, 2), $C(0;2)$)
    })]
  ]
)

