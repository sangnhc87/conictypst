#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("059669")
#let ma-de = "1003"
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

#tn([Trong các bất phương trình sau, bất phương trình nào là bất phương trình bậc nhất hai ẩn?],
  (
    [$2x^2 + y < 1$.],
    True([$x - 3y >= 4$.]),
    [$x + y^2 <= 0$.],
    [$1/x + y > 2$.]
  ),
  loigiai: [
    + Bất phương trình bậc nhất hai ẩn có dạng $a x + b y < c$ (hoặc $<=, >, >=$). 
    + Trong các đáp án, chỉ có $x - 3y >= 4$ là thỏa mãn.
  ]
)

#tn([Cặp số $(2; -1)$ thuộc miền nghiệm của bất phương trình nào sau đây?],
  (
    [$x + y > 5$.],
    [$2x - y < 3$.],
    True([$x + 2y <= 0$.]),
    [$3x + y <= 4$.]
  ),
  loigiai: [
    + Thay $x=2, y=-1$ vào $x+2y <= 0$: $2 + 2(-1) = 0 <= 0$ (Đúng).
  ]
)

#tn([Tìm tham số $m$ để hệ bất phương trình $heva(x - y >= 0, x + y <= 2, x >= m)$ có nghiệm.],
  (
    [$m <= 0$.],
    True([$m <= 1$.]),
    [$m >= 1$.],
    [$m <= 2$.]
  ),
  loigiai: [
    + Xét miền nghiệm của $x - y >= 0$ và $x + y <= 2$. 
    + Điểm xa nhất về bên phải của miền giao này là giao điểm của hai đường thẳng $x - y = 0$ và $x + y = 2$.
    + Tọa độ giao điểm là $(1; 1)$. Do đó hoành độ lớn nhất của miền nghiệm là $x = 1$.
    + Để hệ có nghiệm thỏa mãn $x >= m$ thì $m <= 1$.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (3,0), mark: (end: ">"))
      content((3, -0.4), $x$)
      line((0,-2), (0,3), mark: (end: ">"))
      content((-0.4, 3), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (1,1), (2,0), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((1, 1.4), $(1;1)$)
    })]
  ]
)

#tn([Có bao nhiêu điểm $(x; y)$ với tọa độ nguyên nằm trong miền nghiệm của hệ bất phương trình $cases(0 <= x <= 3, 0 <= y <= 3, 2x + y <= 5)$?],
  (
    [8.],
    [9.],
    True([10.]),
    [12.]
  ),
  loigiai: [
    + Với $x=0$, $0 <= y <= 3$, và $y <= 5 => y in {0,1,2,3}$ (4 điểm).
    + Với $x=1$, $0 <= y <= 3$, và $y <= 3 => y in {0,1,2,3}$ (4 điểm).
    + Với $x=2$, $0 <= y <= 3$, và $y <= 1 => y in {0,1}$ (2 điểm).
    + Với $x=3$, $0 <= y <= 3$, và $y <= -1 =>$ vô nghiệm.
    + Tổng cộng có $4 + 4 + 2 = 10$ điểm.
  ]
)

#tn([Tính diện tích $S$ của miền đa giác tạo bởi hệ bất phương trình $cases(x >= 0, y >= 0, 3x + 4y <= 12)$.],
  (
    [12.],
    True([6.]),
    [24.],
    [5.]
  ),
  loigiai: [
    + Miền đa giác là tam giác vuông tại $O(0;0)$ với hai đỉnh trên trục tọa độ là $A(4;0)$ và $B(0;3)$.
    + Diện tích $S = 1/2 \cdot 4 \cdot 3 = 6$.
  ]
)

#tn([Tìm tất cả giá trị của tham số $m$ để điểm $M(2; -1)$ nằm trong miền nghiệm của bất phương trình $m x + (m - 1)y > 3$.],
  (
    [$m < 2$.],
    [$m > 4$.],
    True([$m > 2$.]),
    [$m < 4$.]
  ),
  loigiai: [
    + Thay $x=2, y=-1$ vào ta có: $m(2) + (m-1)(-1) > 3 => 2m - m + 1 > 3 => m > 2$.
  ]
)

#tn([Một phân xưởng có thể sử dụng tối đa 100 kg nguyên liệu A và 80 kg nguyên liệu B để sản xuất hai loại sản phẩm I và II. Sản phẩm I cần 2 kg nguyên liệu A và 1 kg nguyên liệu B. Sản phẩm II cần 1 kg nguyên liệu A và 2 kg nguyên liệu B. Gọi $x, y$ lần lượt là số lượng sản phẩm I và II. Hệ bất phương trình mô tả điều kiện bài toán là:],
  (
    [$cases(x + 2y <= 100, 2x + y <= 80)$],
    True([$cases(2x + y <= 100, x + 2y <= 80)$]),
    [$cases(2x + y >= 100, x + 2y >= 80)$],
    [$cases(2x + 2y <= 100, x + y <= 80)$]
  ),
  loigiai: [
    + Tổng nguyên liệu A: $2x + y <= 100$.
    + Tổng nguyên liệu B: $x + 2y <= 80$.
  ]
)

#tn([Để đạt chuẩn dinh dưỡng, một học sinh cần bổ sung ít nhất 60 gram protein và 40 gram chất béo mỗi ngày từ thịt bò và cá. Biết 100g thịt bò chứa 20g protein và 10g chất béo; 100g cá chứa 15g protein và 20g chất béo. Gọi $x, y$ là số trăm gam thịt bò và cá. Bất phương trình nào dưới đây biểu thị điều kiện về lượng protein?],
  (
    [$20x + 10y >= 60$.],
    True([$20x + 15y >= 60$.]),
    [$10x + 20y >= 40$.],
    [$15x + 20y >= 60$.]
  ),
  loigiai: [
    + Lượng protein từ thịt bò là $20x$, từ cá là $15y$. Yêu cầu ít nhất 60g protein nên $20x + 15y >= 60$.
  ]
)

#tn([Một gia đình có 500 nghìn đồng để mua gạo và ngô. Giá 1 kg gạo là 20 nghìn đồng, giá 1 kg ngô là 15 nghìn đồng. Gia đình cần mua ít nhất 10 kg ngô để cho gà ăn. Gọi $x, y$ là số kg gạo và ngô cần mua. Điều kiện nào sau đây là sai?],
  (
    [$20x + 15y <= 500$.],
    [$x >= 0$.],
    [$y >= 10$.],
    True([$x >= 10$.])
  ),
  loigiai: [
    + Gia đình cần mua ít nhất 10 kg ngô tức là $y >= 10$, điều kiện $x >= 10$ (gạo ít nhất 10kg) không có trong đề bài nên sai.
  ]
)

#tn([Cho hai đường thẳng $d_1: x - y = 0$ và $d_2: x + y = 4$. Điểm nào sau đây thuộc miền nghiệm của hệ $cases(x - y >= 0, x + y <= 4, x >= 0)$?],
  (
    [$(1; 2)$.],
    [$(3; 2)$.],
    True([$(2; 1)$.]),
    [$(-1; -2)$.]
  ),
  loigiai: [
    + Thử $(2;1)$: $2-1=1 >= 0$, $2+1=3 <= 4$, $2 >= 0$ (Đúng).
  ]
)

#tn([Giá trị lớn nhất của hàm số $F(x; y) = 4x + 3y$ trên miền nghiệm của hệ $cases(x >= 0, y >= 0, x + y <= 5)$ là:],
  (
    [15.],
    [12.],
    True([20.]),
    [0.]
  ),
  loigiai: [
    + Các đỉnh của miền nghiệm: $(0;0), (5;0), (0;5)$.
    + $F(0;0) = 0$, $F(5;0) = 20$, $F(0;5) = 15$. GTLN là 20.
  ]
)

#tn([Một xe tải chở tối đa 5 tấn hàng. Công ty cần chở xi măng ($x$ tấn) và sắt ($y$ tấn). Khối lượng sắt không được vượt quá khối lượng xi măng. Bất phương trình nào biểu thị khối lượng sắt không vượt quá khối lượng xi măng?],
  (
    [$x + y <= 5$.],
    True([$x - y >= 0$.]),
    [$x - y <= 0$.],
    [$y - x >= 0$.]
  ),
  loigiai: [
    + Sắt không vượt xi măng $=> y <= x => x - y >= 0$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 6, 2x + y <= 8)$. Gọi $S$ là miền đa giác nghiệm của hệ.],
  (
    True([Điểm $(3; 2)$ thuộc miền $S$.]),
    [Điểm $(4; 1)$ thuộc miền $S$.],
    True([Diện tích của đa giác $S$ bằng 14.]),
    [Giá trị nhỏ nhất của biểu thức $F = 5x + 3y$ trên miền $S$ đạt được tại điểm $(2; 4)$.]
  ),
  loigiai: [
    + a)$(3;2): 3+2=5 <= 6$, $2(3)+2=8 <= 8$ (Đúng).
    + b)$(4;1): 4+1=5 <= 6$, $2(4)+1=9 > 8$ (Sai).
    + c) Các đỉnh của miền $S$: $(0;0), (4;0), (2;4), (0;6)$.
    + Diện tích $S = S_1 (0<= x <= 2) + S_2 (2<= x <= 4) = 1/2 \cdot (6+4)\cdot 2 + 1/2 \cdot 4 \cdot 2 = 10 + 4 = 14$. (Đúng).
    + d) Giá trị nhỏ nhất của $F = 5x + 3y$ trên $S$ nằm tại $(0;0)$ với $F = 0$. Tại $(2;4)$ thì $F = 22$. (Sai).
  ]
)

#ds([Một xưởng dệt sản xuất hai loại vải A và B. Mỗi cuộn vải A cần 2 giờ dệt và 1 giờ nhuộm. Mỗi cuộn vải B cần 1 giờ dệt và 3 giờ nhuộm. Xưởng có tối đa 100 giờ dệt và 120 giờ nhuộm mỗi tuần. Lợi nhuận mỗi cuộn A là 4 triệu đồng, mỗi cuộn B là 5 triệu đồng. Gọi $x, y$ là số cuộn vải A và B được sản xuất.],
  (
    True([Hệ điều kiện của bài toán là $cases(x >= 0, y >= 0, 2x + y <= 100, x + 3y <= 120)$.]),
    [Xưởng có thể sản xuất được 40 cuộn A và 30 cuộn B trong một tuần.],
    True([Hàm mục tiêu tính lợi nhuận là $F(x,y) = 4x + 5y$ (triệu đồng).]),
    True([Để lợi nhuận cao nhất, xưởng cần sản xuất 36 cuộn vải A.])
  ),
  loigiai: [
    + a) Dệt: $2x+y <= 100$, Nhuộm: $x+3y <= 120$. (Đúng).
    + b) Với $(40, 30)$: $2(40)+30 = 110 > 100$ (quá thời gian dệt). (Sai).
    + c) Hàm lợi nhuận $F = 4x + 5y$. (Đúng).
    + d) Đỉnh của miền: $(0;0), (50;0), (0;40)$ và giao điểm của $2x+y=100$, $x+3y=120 => x=36, y=28$.
    + $F(50;0) = 200$, $F(0;40) = 200$, $F(36;28) = 4(36)+5(28) = 144 + 140 = 284$. Lợi nhuận cao nhất là 284 triệu khi $x=36, y=28$. (Đúng).
  ]
)

#ds([Ông Bình muốn chia thời gian (giờ) trong ngày cho hai việc: đọc sách ($x$) và chơi thể thao ($y$). Ông muốn dành ít nhất 1 giờ cho thể thao và không quá 4 giờ cho đọc sách. Tổng thời gian cho hai việc không quá 6 giờ. Lượng calo tiêu thụ khi đọc sách là 50 calo/giờ, khi chơi thể thao là 300 calo/giờ.],
  (
    [Hệ bất phương trình là $cases(x <= 4, y >= 0, x + y <= 6)$.],
    True([Miền nghiệm của hệ là một hình thang.]),
    True([Ông Bình có thể đốt cháy tối đa 1800 calo từ hai hoạt động này.]),
    [Ông Bình sẽ đốt cháy ít calo nhất khi dành toàn bộ 6 giờ để đọc sách.]
  ),
  loigiai: [
    + a)$y >= 1$, không phải $y >= 0$. (Sai).
    + b) Miền nghiệm được tạo bởi: $0 <= x <= 4$, $y >= 1$, $x+y <= 6$. Đỉnh: $(0,1), (4,1), (4,2), (0,6)$. Đây là hình thang vuông tại trục $O y$. (Đúng).
    + c) Hàm lượng calo $F = 50x + 300y$. 
    + Các đỉnh: $F(0,1) = 300$, $F(4,1) = 500$, $F(4,2) = 800$, $F(0,6) = 1800$. Max là 1800 calo. (Đúng).
    + d) Ít calo nhất là tại $(0,1)$ với 300 calo, tức 0 giờ đọc sách và 1 giờ thể thao. (Sai).
  ]
)

#ds([Cho cặp số nguyên dương $(x; y)$ thỏa mãn $3x + 2y <= 12$.],
  (
    [Có đúng 5 cặp $(x; y)$ thỏa mãn điều kiện bài toán.],
    [Giá trị lớn nhất của $x + y$ là 6.],
    True([Điểm $(2; 3)$ là một nghiệm của bất phương trình.]),
    True([Nếu $y = 1$, thì có đúng 3 giá trị của $x$ thỏa mãn.])
  ),
  loigiai: [
    + Vì $x, y >= 1$ (nguyên dương):
    + Với $y=1 => 3x <= 10 => x in {1, 2, 3}$. (Ý d Đúng).
    + Với $y=2 => 3x <= 8 => x in {1, 2}$.
    + Với $y=3 => 3x <= 6 => x in {1, 2}$.  $3(2)+2(3) = 12 => x=2$ thoả).
    + Với $y=4 => 3x <= 4 => x = 1$.
    + Với $y=5 => 3x <= 2 =>$ vô nghiệm.
    + Tổng số cặp: $3 + 2 + 2 + 1 = 8$ cặp. Ý a nói 5 cặp là (Sai).
    + Max $x+y$: $(1,4) => 5$, $(2,3) => 5$. GTLN của $x+y$ là 5, không phải 6. (Sai).
    + Điểm $(2;3) => 3(2)+2(3) = 12 <= 12$. (Đúng).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Một công ty vận tải cần chuyển 120 tấn hàng. Họ có hai loại xe: loại A chở được 3 tấn/chuyến, loại B chở được 5 tấn/chuyến. Khí thải mỗi chuyến xe A là 2 đơn vị, xe B là 4 đơn vị. Công ty muốn tổng lượng khí thải không vượt quá 80 đơn vị. Nếu công ty sử dụng $x$ xe A và $y$ xe B, hãy tính số chuyến xe loại A cần dùng để tối thiểu hóa số lượng chuyến xe $F = x + y$, biết rằng $x, y$ là số nguyên không âm và hàng phải được chuyển hết (nghĩa là $3x + 5y >= 120$).],
  [40],
  loigiai: [
    + Hệ điều kiện của bài toán: $x, y >= 0$, $3x + 5y >= 120$ (số tấn hàng), $2x + 4y <= 80 => x + 2y <= 40$ (khí thải).
    + Ta cần tìm giá trị nhỏ nhất của hàm mục tiêu $F = x + y$.
    + Vẽ miền nghiệm của hệ. Ta thấy $3x+5y >= 120$ và $x+2y <= 40$. Từ hai điều kiện này, cộng lại ta có $(3x+5y) - 2(x+2y) >= 120 - 80 => x+y >= 40$.
    + Do $x+y >= 40$ nên $F = x+y >= 40$.
    + Dấu "=" xảy ra khi $x = 40, y = 0$.
    + Thử lại với $x = 40, y = 0$ thỏa mãn toàn bộ hệ điều kiện.
    + Vậy số chuyến xe loại A là 40.
    #align(center)[#cetz.canvas(length: 1.5mm, {
      import cetz.draw: *
      line((-5,0), (50,0), mark: (end: ">"), name: "x")
      content((50, -2), $x$)
      line((0,-5), (0,30), mark: (end: ">"), name: "y")
      content((-2, 30), $y$)
      content((-2, -2), $O$)
      line((40,0), (0,24), stroke: red)
      line((40,0), (0,20), stroke: blue)
      content((40, -2), $40$)
      content((-3, 24), $24$)
      content((-3, 20), $20$)
      content((20, 15), text(fill: red, $3x+5y=120$))
      content((15, 5), text(fill: blue, $x+2y=40$))
      circle((40,0), radius: 0.5, fill: black)
    })]
  ]
)

#tln([Tìm số nghiệm nguyên $(x; y)$ thỏa mãn hệ bất phương trình $heva(x > 0, y > 0, x + y <= 5)$.],
  [10],
  loigiai: [
    + Do $x > 0, y > 0$ và $x, y in ZZ$ nên ta xét $x >= 1, y >= 1$.
    + Miền nghiệm là tam giác giới hạn bởi $x=1, y=1$ và $x+y=5$.
    + Ta có thể đếm trực tiếp các điểm nguyên:
      - Với $x = 1 => 1 + y <= 5 => y in {1, 2, 3, 4}$ (4 điểm)
      - Với $x = 2 => 2 + y <= 5 => y in {1, 2, 3}$ (3 điểm)
      - Với $x = 3 => 3 + y <= 5 => y in {1, 2}$ (2 điểm)
      - Với $x = 4 => 4 + y <= 5 => y = 1$ (1 điểm)
    + Tổng số nghiệm nguyên là: $4 + 3 + 2 + 1 = 10$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-0.5,0), (6,0), mark: (end: ">"), name: "x")
      content((6, -0.3), $x$)
      line((0,-0.5), (0,6), mark: (end: ">"), name: "y")
      content((-0.3, 6), $y$)
      content((-0.3, -0.3), $O$)
      line((1,1), (4,1), (1,4), close: true, fill: rgb(0,0,255,50), stroke: blue)
      for i in range(1, 5) {
        for j in range(1, 6-i) {
          circle((i,j), radius: 0.05, fill: red)
        }
      }
      content((4.2, 0.8), $(4;1)$)
      content((0.6, 4.2), $(1;4)$)
      content((1, -0.3), $1$)
      content((-0.3, 1), $1$)
    })]
  ]
)

#tln([Có bao nhiêu giá trị nguyên dương của tham số $m$ để gốc tọa độ $O(0;0)$ nằm trong miền đa giác tạo bởi hệ $cases(x - 2y <= m, x + y >= m - 4, y <= 2)$?],
  [4],
  loigiai: [
    + Để gốc tọa độ $O(0;0)$ nằm trong miền nghiệm, tọa độ $(0;0)$ phải thỏa mãn đồng thời cả 3 bất phương trình của hệ.
    + Thay $x=0, y=0$ vào hệ, ta được:
      $heva(0 - 0 <= m, 0 + 0 >= m - 4, 0 <= 2) <=> heva(m >= 0, m <= 4, 0 <= 2 " (luôn đúng)")$
    + Từ đó suy ra điều kiện của $m$ là $0 <= m <= 4$.
    + Vì đề bài yêu cầu tìm các giá trị nguyên dương của $m$, nên $m in {1; 2; 3; 4}$.
    + Vậy có 4 giá trị nguyên dương của tham số $m$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-2,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.3), $x$)
      line((0,-2), (0,4), mark: (end: ">"), name: "y")
      content((-0.3, 4), $y$)
      content((-0.3, -0.3), $O$)
      circle((0,0), radius: 0.08, fill: red)
      content((1, 1), [Minh hoạ với $m=2$])
      line((-2, -2), (4, 1), stroke: blue)
      content((4.2, 1), $x-2y=2$)
      line((-2, 0), (2, -4), stroke: red)
      content((2, -4.2), $x+y=-2$)
      line((-2, 2), (5, 2), stroke: green)
      content((5.2, 2), $y=2$)
    })]
  ]
)

#tln([Một nông trại dự định trồng lúa và ngô trên một khu đất rộng 10 ha. Trồng 1 ha lúa cần 3 ngày công và thu lãi 20 triệu đồng. Trồng 1 ha ngô cần 2 ngày công và thu lãi 15 triệu đồng. Nông trại có tối đa 24 ngày công. Hỏi nông trại có thể thu được lợi nhuận lớn nhất là bao nhiêu triệu đồng?],
  [170],
  loigiai: [
    + Gọi $x, y$ lần lượt là số ha lúa và ngô cần trồng ($x >= 0, y >= 0$).
    + Tổng diện tích không vượt quá 10 ha: $x + y <= 10$.
    + Tổng số ngày công không vượt quá 24 ngày: $3x + 2y <= 24$.
    + Hàm mục tiêu lợi nhuận (triệu đồng): $F(x,y) = 20x + 15y$.
    + Vẽ miền nghiệm của hệ $x >= 0, y >= 0, x+y <= 10, 3x+2y <= 24$.
    + Các đỉnh của miền đa giác là: $O(0;0), A(8;0), B(4;6), C(0;10)$.
    + Ta tính lợi nhuận tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(8; 0) = 20(8) = 160$
      - $F(0; 10) = 15(10) = 150$
      - $F(4; 6) = 20(4) + 15(6) = 80 + 90 = 170$
    + Lợi nhuận lớn nhất đạt được là 170 triệu đồng khi trồng 4 ha lúa và 6 ha ngô.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (12,0), mark: (end: ">"), name: "x")
      content((12, -0.6), $x$)
      line((0,-1), (0,13), mark: (end: ">"), name: "y")
      content((-0.6, 13), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (8,0), (4,6), (0,10), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((8, -0.8), $A(8;0)$)
      content((4.8, 6.2), $B(4;6)$)
      content((-1.2, 10), $C(0;10)$)
    })]
  ]
)

#tln([Biết rằng miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 3)$ có chứa đúng $k$ điểm có tọa độ là số nguyên. Tìm $k$.],
  [10],
  loigiai: [
    + Miền nghiệm của hệ bất phương trình là một tam giác vuông $O A B$ giới hạn bởi trục hoành $y=0$, trục tung $x=0$ và đường thẳng $d: x+y=3$.
    + Các đỉnh của tam giác là $O(0;0), A(3;0), B(0;3)$.
    + Ta đếm trực tiếp các điểm nguyên $(x, y)$ nằm trong và trên biên tam giác:
      - Khi $x = 0 => y in {0, 1, 2, 3}$ (4 điểm: $(0;0), (0;1), (0;2), (0;3)$).
      - Khi $x = 1 => 1 + y <= 3 => y in {0, 1, 2}$ (3 điểm).
      - Khi $x = 2 => 2 + y <= 3 => y in {0, 1}$ (2 điểm).
      - Khi $x = 3 => 3 + y <= 3 => y = 0$ (1 điểm).
    + Tổng số điểm nguyên là: $4 + 3 + 2 + 1 = 10$. Vậy $k = 10$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (4,0), mark: (end: ">"), name: "x")
      content((4, -0.3), $x$)
      line((0,-1), (0,4), mark: (end: ">"), name: "y")
      content((-0.3, 4), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (3,0), (0,3), close: true, fill: rgb(0,0,255,50), stroke: blue)
      for i in range(0, 4) {
        for j in range(0, 4-i) {
          circle((i,j), radius: 0.06, fill: red)
        }
      }
      content((3.3, 0.3), $A(3;0)$)
      content((0.4, 3.2), $B(0;3)$)
    })]
  ]
)

#tln([Một cửa hàng bán hai loại cà phê A và B. Cà phê A cần 100g hạt Arabica và 50g hạt Robusta cho mỗi ly. Cà phê B cần 50g hạt Arabica và 100g hạt Robusta cho mỗi ly. Cửa hàng hiện còn 2kg (2000g) Arabica và 1.6kg (1600g) Robusta. Lợi nhuận mỗi ly A là 20 nghìn, mỗi ly B là 30 nghìn. Cửa hàng có thể đạt lợi nhuận tối đa bao nhiêu nghìn đồng?],
  [560],
  loigiai: [
    + Gọi $x, y$ lần lượt là số ly cà phê A và B cửa hàng bán ($x >= 0, y >= 0, x, y in NN$).
    + Điều kiện về hạt Arabica: $100x + 50y <= 2000 <=> 2x + y <= 40$.
    + Điều kiện về hạt Robusta: $50x + 100y <= 1600 <=> x + 2y <= 32$.
    + Hàm lợi nhuận cần tìm max: $F(x,y) = 20x + 30y$ (nghìn đồng).
    + Vẽ miền nghiệm của hệ: $x >= 0, y >= 0, 2x+y <= 40, x+2y <= 32$.
    + Các đỉnh của đa giác miền nghiệm: $O(0;0), M(20;0), N(16;8), P(0;16)$.
      (Trong đó $N(16;8)$ là giao điểm của hai đường $2x+y=40$ và $x+2y=32$).
    + Tính lợi nhuận tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(20; 0) = 20(20) = 400$
      - $F(0; 16) = 30(16) = 480$
      - $F(16; 8) = 20(16) + 30(8) = 320 + 240 = 560$
    + Lợi nhuận tối đa cửa hàng có thể đạt được là 560 nghìn đồng khi bán 16 ly A và 8 ly B.
    #align(center)[#cetz.canvas(length: 2mm, {
      import cetz.draw: *
      line((-2,0), (25,0), mark: (end: ">"), name: "x")
      content((25, -2), $x$)
      line((0,-2), (0,20), mark: (end: ">"), name: "y")
      content((-2, 20), $y$)
      content((-2, -2), $O$)
      line((0,0), (20,0), (16,8), (0,16), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((20, -2), $M(20;0)$)
      content((18, 9), $N(16;8)$)
      content((-3, 16), $P(0;16)$)
    })]
  ]
)
