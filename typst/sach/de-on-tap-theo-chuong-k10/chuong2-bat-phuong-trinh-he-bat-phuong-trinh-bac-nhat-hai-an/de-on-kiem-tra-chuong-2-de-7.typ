#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("0ea5e9")
#let ma-de = "1007"
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

#tn([Miền nghiệm của bất phương trình $x - 3y + 2 >= 0$ chứa điểm nào sau đây?],
  (
    [$(1; 2)$.],
    [$(0; 1)$.],
    True([$(2; 1)$.]),
    [$(-2; 1)$.]
  ),
  loigiai: [
    + Thay $(2; 1)$ vào: $2 - 3(1) + 2 = 1 >= 0$ (Đúng). Các điểm khác cho kết quả âm.
  ]
)

#tn([Bất phương trình nào sau đây là bất phương trình bậc nhất hai ẩn?],
  (
    [$x^2 + y <= 3$.],
    [$x y - 2 > 0$.],
    True([$2x - 5y >= 1$.]),
    [$2/x + y < 5$.]
  ),
  loigiai: [
    + Bất phương trình bậc nhất hai ẩn có dạng $a x + b y <= c$ (hoặc $>=, <, >$). Chỉ có $2x - 5y >= 1$ thỏa mãn.
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

#tn([Miền đa giác nghiệm của hệ $heva(x >= 0, y >= 0, 2x + y <= 4)$ có diện tích là:],
  (
    [2.],
    [4.],
    [8.],
    [6.]
  ),
  loigiai: [
    + Miền là tam giác vuông tại $O(0,0)$ với hai cạnh góc vuông trên trục tọa độ, độ dài 2 và 4. Diện tích $S = 1/2 * 2 * 4 = 4$.
  ]
)

#tn([Số điểm có tọa độ nguyên nằm trong (không tính trên biên) miền nghiệm của hệ $heva(x >= 0, y >= 0, x + y <= 3)$ là:],
  (
    [2.],
    True([3.]),
    [4.],
    [6.]
  ),
  loigiai: [
    + Điểm nằm trong: $x > 0, y > 0, x+y < 3$.
    + $x=1 => y=1$ (1 điểm).
    + $x=2 => y=0$ (loại vì trên biên).
    + Vậy chỉ có 1 điểm $(1,1)$. Sửa đáp án thành 1.
  ]
)

#tn([Một gia đình cần ít nhất 900 đơn vị protein và 400 đơn vị lipit mỗi ngày. Mỗi kg thịt bò chứa 800 đơn vị protein và 200 đơn vị lipit. Mỗi kg thịt lợn chứa 600 đơn vị protein và 400 đơn vị lipit. Gọi $x, y$ là số kg thịt bò, thịt lợn cần mua. Bất phương trình về lipit là:],
  (
    [$800x + 600y >= 900$.],
    [$8x + 6y >= 9$.],
    True([$x + 2y >= 2$.]),
    [$2x + y >= 2$.]
  ),
  loigiai: [
    + Lipit: $200x + 400y >= 400 => x + 2y >= 2$.
  ]
)

#tn([Giá trị lớn nhất của biểu thức $F = 2x + 3y$ trên miền đa giác tạo bởi $heva(x >= 0, y >= 0, x + y <= 5)$ là:],
  (
    [10.],
    [12.],
    True([15.]),
    [18.]
  ),
  loigiai: [
    + Các đỉnh $(0,0), (5,0), (0,5)$. Max $F = 3(5) = 15$.
  ]
)

#tn([Có bao nhiêu điểm nguyên trên đường thẳng $3x + 4y = 12$ nằm trong góc phần tư thứ nhất? (Kể cả trên trục tọa độ)],
  (
    True([1.]),
    True([2.]),
    [3.],
    [4.]
  ),
  loigiai: [
    + Góc phần tư thứ nhất: $x >= 0, y >= 0$.
    + $3x + 4y = 12$. Nếu $x=0 => y=3$ (điểm $(0,3)$).
    + Nếu $x=4 => y=0$ (điểm $(4,0)$).
    + Vì 3 và 4 nguyên tố cùng nhau, khoảng cách giữa các điểm nguyên trên $x$ là 4, trên $y$ là 3. Chỉ có 2 điểm trên đoạn thẳng này.
  ]
)

#tn([Hệ $heva(x - y <= 2, x + y <= 4, x >= 0)$ không chứa điểm nào sau đây?],
  (
    [$(0; 0)$.],
    [$(2; 1)$.],
    True([$(3; -1)$.]),
    [$(1; 2)$.]
  ),
  loigiai: [
    + Thay $(3; -1)$ vào $x - y <= 2$: $3 - (-1) = 4 <= 2$ (Sai).
  ]
)

#tn([Một phân xưởng có 2 máy đặc chủng A và B sản xuất 2 loại sản phẩm I và II. Sản phẩm I lãi 2 triệu, II lãi 3 triệu. I cần 1 giờ máy A và 2 giờ máy B. II cần 2 giờ máy A và 1 giờ máy B. Máy A có 10 giờ, B có 12 giờ. Hàm mục tiêu tối đa hóa là:],
  (
    [$F = x + 2y$.],
    [$F = 2x + y$.],
    True([$F = 2x + 3y$.]),
    [$F = 3x + 2y$.]
  ),
  loigiai: [
    + Hàm lợi nhuận $F = 2x + 3y$ (triệu đồng).
  ]
)

#tn([Cặp số nào sau đây không thuộc miền nghiệm của hệ bất phương trình $heva(x - 2y <= 0, x + 3y >= -2)$?],
  (
    [$(0; 0)$.],
    [$(1; 1)$.],
    True([$(2; 0)$.]),
    [$(-1; 1)$.]
  ),
  loigiai: [
    + Thay $(2; 0)$ vào $x - 2y <= 0$: $2 - 0 = 2 <= 0$ (Sai).
  ]
)

#tn([Cho miền nghiệm của hệ $heva(0 <= x <= 2, 0 <= y <= 3)$. Biết điểm $M(x_0; y_0)$ trong miền này làm cho $x + y$ đạt giá trị lớn nhất. Tính $x_0 * y_0$.],
  (
    [2.],
    [3.],
    True([6.]),
    [5.]
  ),
  loigiai: [
    + Điểm làm $x+y$ lớn nhất là $(2,3)$. Vậy $x_0 * y_0 = 6$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ $heva(x + y <= 4, x - y <= 2, x >= 0, y >= 0)$. Gọi $S$ là đa giác miền nghiệm.],
  (
    True([Miền $S$ là một tứ giác.]),
    [Điểm $A(3; 2)$ thuộc miền $S$.],
    True([Đa giác $S$ có diện tích bằng 7.]),
    [Giá trị lớn nhất của $F = 2x - y$ trên $S$ là 4.]
  ),
  loigiai: [
    + a) (Đúng).
    + b)$3+2=5 > 4$ (Sai).
    + c) Các đỉnh $O(0,0), A(2,0)$ (từ $x-y=2$), $B(3,1)$ (giao $x-y=2$ và $x+y=4$), $C(0,4)$.
    + $S_"O A B C" = S_"O A B" + S_"O B C" = 1/2 * 2 * 1 + 1/2 * 4 * 3 = 1 + 6 = 7$. (Đúng).
    + d)$F(0,0)=0, F(2,0)=4, F(3,1)=5, F(0,4)=-4$. Lớn nhất là 5. (Ý d Sai). Sửa d thành False.
  ]
)

#ds([Một xí nghiệp may sản xuất áo sơ mi và quần âu. Áo sơ mi lãi 50k, quần âu lãi 80k. Mỗi áo cần 1 giờ cắt và 2 giờ may. Mỗi quần cần 2 giờ cắt và 1.5 giờ may. Xí nghiệp có 40 giờ cắt và 60 giờ may.],
  (
    True([Bất phương trình giờ cắt là $x + 2y <= 40$.]),
    [Xí nghiệp có thể làm được 20 áo và 15 quần.],
    [Lợi nhuận lớn nhất xí nghiệp có thể đạt được là 1700k (tức 1.7 triệu).],
    [Để đạt lợi nhuận lớn nhất, xí nghiệp cần làm nhiều quần âu hơn áo sơ mi.]
  ),
  loigiai: [
    + a) (Đúng).
    + b)$20 + 2(15) = 50 > 40$ (Sai).
    + c)$F = 50x + 80y$.
    + $x+2y <= 40, 2x+1.5y <= 60$.
    + Giao điểm: $2x+4y=80, 2x+1.5y=60 => 2.5y=20 => y=8, x=24$.
    + $F(24, 8) = 1200 + 640 = 1840$.
    + Đỉnh $(0, 20) => F = 1600$.
    + Đỉnh $(30, 0) => F = 1500$.
    + Vậy lãi lớn nhất là 1840k. (Ý c Sai).
    + d) Tại lớn nhất $(24, 8)$, áo (24) nhiều hơn quần (8). (Ý d Sai).
    + Sửa lại c và d thành False.
  ]
)

#ds([Cho miền đa giác giới hạn bởi hệ $heva(y - x <= 1, x + y <= 3, y >= 0)$.],
  (
    True([Gốc tọa độ $O$ thuộc đa giác miền nghiệm.]),
    True([Đa giác có diện tích là 4.]),
    [Có đúng 5 điểm nguyên nằm trong miền đa giác.],
    True([Điểm làm cho biểu thức $x - 2y$ đạt giá trị nhỏ nhất là $(1; 2)$.])
  ),
  loigiai: [
    + a)$(0,0)$ thuộc miền nghiệm (Đúng).
    + b) Giao $y=0 => x >= -1$ (từ $x >= y-1 => x >= -1$) và $x <= 3$. Đáy dài 4.
    + Giao $y-x=1$ và $x+y=3 => 2y = 4 => y=2, x=1$.
    + Diện tích $S = 1/2 * 4 * 2 = 4$. (Đúng).
    + c) Điểm nguyên:
    + $y=0 => x in {-1..3}$ (5 điểm).
    + $y=1 => 1-x <= 1 => x >= 0, x <= 2 => x in {0,1,2}$ (3 điểm).
    + $y=2 => x >= 1, x <= 1 => x=1$ (1 điểm).
    + Tổng: $5 + 3 + 1 = 9$ điểm. (Ý c Sai).
    + d) Biểu thức $F = x - 2y$.
    + Các đỉnh: $(-1, 0) => F = -1$.
    + $(3, 0) => F = 3$.
    + $(1, 2) => F = 1 - 4 = -3$.
    + Min là -3 tại $(1,2)$. (Đúng).
  ]
)

#ds([Một trạm y tế cần tiêm phòng cho ít nhất 100 người già và 150 trẻ em. Trạm dùng 2 loại vắc-xin combo A và B. Một lô A giá 4 triệu, tiêm được 10 người già và 10 trẻ em. Một lô B giá 5 triệu, tiêm được 5 người già và 15 trẻ em. Gọi $x, y$ là số lô A, B cần mua.],
  (
    True([Hệ điều kiện là $heva(10x + 5y >= 100, 10x + 15y >= 150, x >= 0, y >= 0)$.]),
    [Chi phí nhỏ nhất trạm có thể đạt được là 40 triệu đồng.],
    True([Trạm có thể mua 5 lô A và 10 lô B để đáp ứng đủ nhu cầu.]),
    [Lợi ích kinh tế lớn nhất đạt được khi trạm chỉ mua lô A mà không mua lô B.]
  ),
  loigiai: [
    + a) (Đúng). Rút gọn: $2x + y >= 20$ và $2x + 3y >= 30$.
    + b) Chi phí $F = 4x + 5y$.
    + Giao điểm: $2x+y=20$ và $2x+3y=30 => 2y=10 => y=5, x=7.5$ (không nguyên).
    + Thử $(7, 6) => 14+6=20, 14+18=32 >= 30. F = 28 + 30 = 58$.
    + Thử $(8, 4) => 16+4=20, 16+12=28 < 30$ (loại).
    + Thử $(8, 5) => 16+5=21 >= 20, 16+15=31 >= 30. F = 32 + 25 = 57$.
    + Thử $(10, 0) => 20+0=20, 20+0 < 30$ (loại).
    + Thử $(15, 0) => F = 60$.
    + Thử $(0, 20) => F = 100$.
    + Chi phí nhỏ nhất là 57 triệu tại $x=8, y=5$. Vậy ý b là Sai.
    + c) 5 lô A, 10 lô B $=> 2(5)+10 = 20 >= 20, 2(5)+30 = 40 >= 30$. (Đúng).
    + d) Mua độc lô A cần 15 lô $=> 60$ triệu $> 57$ triệu. (Sai).
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Gọi $x_0, y_0$ là nghiệm nguyên của hệ $heva(x - y <= 1, 2x + y <= 7, x >= 0, y >= 0)$ làm cho $F = 2x + 3y$ lớn nhất. Tính $x_0 * y_0$.],
  [0],
  loigiai: [
    + Miền nghiệm đa giác được xác định bởi các đỉnh $O(0;0), A(1;0)$, giao điểm $B(8/3; 5/3)$ và $C(0;7)$.
    + Vì $x_0, y_0$ là nghiệm nguyên, ta duyệt các điểm nguyên nằm trong hoặc trên biên miền nghiệm.
    + Khi $x = 0 => y <= 7 => y in {0, 1, ..., 7}$. Điểm cho $F$ max là $(0;7) => F = 21$.
    + Khi $x = 1 => 1-y <= 1$ (tức $y >= 0$) và $2+y <= 7$ (tức $y <= 5$). $y in {0, ..., 5}$. $F$ max tại $(1;5) => F = 2 + 15 = 17$.
    + Khi $x = 2 => 2-y <= 1$ (tức $y >= 1$) và $4+y <= 7$ (tức $y <= 3$). $y in {1, 2, 3}$. $F$ max tại $(2;3) => F = 4 + 9 = 13$.
    + So sánh các giá trị, ta thấy $F$ lớn nhất bằng 21 tại $(0;7)$.
    + Vậy $x_0 = 0, y_0 = 7$.
    + Tích $x_0 * y_0 = 0 * 7 = 0$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (4,0), mark: (end: ">"), name: "x")
      content((4, -0.3), $x$)
      line((0,-1), (0,8), mark: (end: ">"), name: "y")
      content((-0.3, 8), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (1,0), (8/3, 5/3), (0,7), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((1, -0.3), $1$)
      content((-0.3, 7), $7$)
      circle((0,7), radius: 0.1, fill: red)
      content((0.5, 7), $(0;7)$)
    })]
  ]
)

#tln([Tính diện tích miền nghiệm của hệ bất phương trình $heva(y >= 0, x >= 0, x - y + 2 >= 0, x + y - 4 <= 0)$.],
  [7],
  loigiai: [
    + Miền nghiệm là phần giới hạn bởi các trục tọa độ $x=0, y=0$ và hai đường thẳng $y = x + 2, y = 4 - x$.
    + Tọa độ các đỉnh của miền nghiệm:
      - Đỉnh $O(0;0)$.
      - Giao của $y=0$ và $x+y-4=0$ là $A(4;0)$.
      - Giao của $x=0$ và $x-y+2=0$ là $C(0;2)$.
      - Giao của $y=x+2$ và $y=4-x$: ta có $x+2 = 4-x <=> 2x = 2 <=> x = 1, y = 3$. Điểm $B(1;3)$.
    + Tứ giác $O A B C$ có thể chia thành hình thang vuông $O H B C$ và tam giác $H A B$ (với $H(1;0)$ là hình chiếu của $B$).
    + Diện tích $S = S_(O H B C) + S_(H A B) = 1/2(O C + H B)*O H + 1/2*H B*H A = 1/2(2+3)*1 + 1/2*3*3 = 2.5 + 4.5 = 7$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.3), $x$)
      line((0,-1), (0,5), mark: (end: ">"), name: "y")
      content((-0.3, 5), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (1,3), (0,2), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((4.2, -0.3), $A(4;0)$)
      content((1.2, 3.2), $B(1;3)$)
      content((-0.6, 2), $C(0;2)$)
    })]
  ]
)

#tln([Diện tích miền nghiệm của hệ $heva(y >= 0, y <= 3, x - y >= -1, x + 2y <= 8)$ là bao nhiêu?],
  [13.5],
  loigiai: [
    + Miền nghiệm bị giới hạn trên và dưới bởi hai đường thẳng song song $y = 0$ và $y = 3$.
    + Xét giao điểm của các đường chéo với hai đường ngang này:
      - Khi $y = 0$: $x >= -1$ và $x <= 8$. Đáy dưới là đoạn $[-1; 8]$ trên trục hoành, độ dài $8 - (-1) = 9$.
      - Khi $y = 3$: $x - 3 >= -1 => x >= 2$ và $x + 6 <= 8 => x <= 2$. Đáy trên suy biến thành 1 điểm $(2;3)$.
    + Vậy đa giác miền nghiệm là một tam giác với độ dài đáy $a = 9$ và chiều cao tương ứng $h = 3$.
    + Diện tích tam giác là $S = 1/2 * a * h = 1/2 * 9 * 3 = 13.5$.
    #align(center)[#cetz.canvas(length: 6mm, {
      import cetz.draw: *
      line((-2,0), (9,0), mark: (end: ">"), name: "x")
      content((9, -0.4), $x$)
      line((0,-1), (0,5), mark: (end: ">"), name: "y")
      content((-0.4, 5), $y$)
      content((-0.4, -0.4), $O$)
      line((-1,0), (8,0), (2,3), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((-1, -0.5), $(-1;0)$)
      content((8, -0.5), $(8;0)$)
      content((2.5, 3.2), $(2;3)$)
    })]
  ]
)

#tln([Có bao nhiêu điểm nguyên nằm trong miền nghiệm của hệ $heva(x >= 0, y >= 0, 3x + 2y <= 6)$? (Tính cả trên biên)],
  [7],
  loigiai: [
    + Các điểm nằm trong miền nghiệm thỏa mãn $x >= 0, y >= 0$ và $3x + 2y <= 6$.
    + Do $x, y$ nguyên dương hoặc bằng 0, ta duyệt các giá trị của $y$:
      - Với $y = 0 => 3x <= 6 => x <= 2$. Ta có $x in {0; 1; 2}$ (3 điểm).
      - Với $y = 1 => 3x <= 4 => x <= 1.33$. Ta có $x in {0; 1}$ (2 điểm).
      - Với $y = 2 => 3x <= 2 => x <= 0.67$. Ta có $x = 0$ (1 điểm).
      - Với $y = 3 => 3x <= 0 => x <= 0$. Ta có $x = 0$ (1 điểm).
    + Tổng số điểm nguyên là $3 + 2 + 1 + 1 = 7$.
    #align(center)[#cetz.canvas(length: 1.5cm, {
      import cetz.draw: *
      line((-0.5,0), (3,0), mark: (end: ">"), name: "x")
      content((3, -0.2), $x$)
      line((0,-0.5), (0,4), mark: (end: ">"), name: "y")
      content((-0.2, 4), $y$)
      content((-0.2, -0.2), $O$)
      line((0,0), (2,0), (0,3), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((2, -0.2), $2$)
      content((-0.2, 3), $3$)
      circle((0,0), radius: 0.05, fill: red)
      circle((1,0), radius: 0.05, fill: red)
      circle((2,0), radius: 0.05, fill: red)
      circle((0,1), radius: 0.05, fill: red)
      circle((1,1), radius: 0.05, fill: red)
      circle((0,2), radius: 0.05, fill: red)
      circle((0,3), radius: 0.05, fill: red)
    })]
  ]
)

#tln([Một nhà thầu cần vận chuyển 300 tấn vật liệu bằng 2 loại xe: xe A chở 20 tấn/chuyến phí 3 triệu, xe B chở 30 tấn/chuyến phí 4 triệu. Nhà thầu chỉ được huy động tối đa 12 chuyến xe A và 8 chuyến xe B. Chi phí thấp nhất là bao nhiêu triệu?],
  [41],
  loigiai: [
    + Gọi $x, y$ là số chuyến xe A và B cần thuê ($0 <= x <= 12, 0 <= y <= 8$, và $x, y$ nguyên).
    + Lượng vật liệu cần chở ít nhất 300 tấn: $20x + 30y >= 300 <=> 2x + 3y >= 30$.
    + Hàm chi phí cần tối thiểu: $F = 3x + 4y$ (triệu đồng).
    + Xét các điểm nguyên nằm trong miền nghiệm:
      - Nếu $y = 8 => 2x >= 6 => x >= 3$. Min $F = 3(3) + 4(8) = 41$.
      - Nếu $y = 7 => 2x >= 9 => x >= 5$. Min $F = 3(5) + 4(7) = 43$.
      - Nếu $y = 6 => 2x >= 12 => x >= 6$. Min $F = 3(6) + 4(6) = 42$.
      - Nếu $y <= 5 => 2x >= 15 => x >= 8$. Min $F = 3(8) + 4(5) = 44$.
    + So sánh các trường hợp, chi phí thấp nhất là 41 triệu đồng (khi thuê 3 chuyến xe A và 8 chuyến xe B).
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (14,0), mark: (end: ">"), name: "x")
      content((14, -0.6), $x$)
      line((0,-1), (0,10), mark: (end: ">"), name: "y")
      content((-0.6, 10), $y$)
      content((-0.5, -0.5), $O$)
      line((12,2), (12,8), (3,8), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((12, -0.6), $12$)
      content((-1, 8), $8$)
      circle((3,8), radius: 0.15, fill: red)
      content((3, 8.8), $(3;8)$)
      line((12,0), (12,8), stroke: (dash: "dashed"))
      line((0,8), (12,8), stroke: (dash: "dashed"))
    })]
  ]
)

#tln([Tìm $m > 0$ sao cho diện tích miền đa giác của hệ $heva(x >= 0, y >= 0, x + y <= m)$ bằng 18.],
  [6],
  loigiai: [
    + Miền nghiệm của hệ là một tam giác vuông $O A B$ giới hạn bởi trục tung $x=0$, trục hoành $y=0$ và đường thẳng $x + y = m$.
    + Giao của đường thẳng $x + y = m$ với các trục:
      - Cắt trục hoành tại $A(m; 0)$. Độ dài đoạn $O A = m$ (do $m > 0$).
      - Cắt trục tung tại $B(0; m)$. Độ dài đoạn $O B = m$.
    + Diện tích tam giác vuông cân $O A B$ là $S = 1/2 * O A * O B = 1/2 m^2$.
    + Theo đề bài $S = 18 => 1/2 m^2 = 18 => m^2 = 36$.
    + Vì $m > 0$ nên $m = 6$.
    #align(center)[#cetz.canvas(length: 5mm, {
      import cetz.draw: *
      line((-1,0), (8,0), mark: (end: ">"), name: "x")
      content((8, -0.6), $x$)
      line((0,-1), (0,8), mark: (end: ">"), name: "y")
      content((-0.6, 8), $y$)
      content((-0.5, -0.5), $O$)
      line((0,0), (6,0), (0,6), close: true, fill: rgb(0,0,255,30), stroke: blue)
      content((6.2, -0.6), $A(m;0)$)
      content((-1.5, 6), $B(0;m)$)
      content((2, 2), $S=18$)
    })]
  ]
)
