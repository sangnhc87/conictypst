#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("d97706")
#let ma-de = "1001"
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
    [$x^2 + y > 0$.],
    True([$2x - 3y + 1 <= 0$.]),
    [$x + y^2 >= 2$.],
    [$1/x + y < 5$.]
  ),
  loigiai: [
    + Bất phương trình bậc nhất hai ẩn có dạng $a x + b y + c > 0$ (hoặc $<, >=, <=$).
    + Vậy $2x - 3y + 1 <= 0$ là bất phương trình bậc nhất hai ẩn.
  ]
)

#tn([Cặp số $(1; -1)$ là nghiệm của bất phương trình nào sau đây?],
  (
    [$x + y - 3 > 0$.],
    True([$-x - 3y - 1 > 0$.]),
    [$x + 3y + 1 < 0$.],
    [$-x - y < 0$.]
  ),
  loigiai: [
    + Thay $x=1, y=-1$ vào $-x - 3y - 1$: $-1 - 3(-1) - 1 = 1 > 0$ (đúng).
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

#tn([Trong mặt phẳng tọa độ $O x y$, nửa mặt phẳng bờ là đường thẳng $d: x + 2y = 4$ không chứa gốc tọa độ $O(0;0)$ (không kể bờ $d$) là miền nghiệm của bất phương trình nào sau đây?],
  (
    [$x + 2y >= 4$.],
    True([$x + 2y > 4$.]),
    [$x + 2y < 4$.],
    [$x + 2y <= 4$.]
  ),
  loigiai: [
    + Thay $O(0;0)$ vào $x+2y$ ta được $0 < 4$. Vì không chứa $O$ và không kể bờ nên là $x+2y > 4$.
  ]
)

#tn([Hệ bất phương trình nào sau đây là hệ bất phương trình bậc nhất hai ẩn?],
  (
    [$cases(x^2 + y > 1, x - 2y <= 3)$],
    [$cases(x + y > 1, x y <= 3)$],
    True([$cases(2x + 3y > 1, x - y <= 3)$]),
    [$cases(x + y > 1, 2x - y^2 <= 3)$]
  ),
  loigiai: [
    + Hệ $cases(2x + 3y > 1, x - y <= 3)$ gồm các bất phương trình bậc nhất hai ẩn.
  ]
)

#tn([Cặp số $(0; 1)$ là nghiệm của hệ bất phương trình nào sau đây?],
  (
    [$cases(x + y > 1, 2x - y <= 0)$],
    True([$cases(x - y < 0, 2x + y >= 1)$]),
    [$cases(x + y < 0, 2x - y > 0)$],
    [$cases(x + y > 0, 2x + y < 0)$]
  ),
  loigiai: [
    + Thay $(0; 1)$ vào hệ thứ 2: $0 - 1 < 0$ (đúng) và $2(0) + 1 = 1 >= 1$ (đúng).
  ]
)

#tn([Một xưởng sản xuất hai loại sản phẩm A và B. Gọi $x$ và $y$ lần lượt là số lượng sản phẩm A và B cần sản xuất. Mỗi sản phẩm A cần 2 giờ để làm, mỗi sản phẩm B cần 3 giờ để làm. Xưởng có tối đa 120 giờ làm việc. Bất phương trình thể hiện điều kiện về thời gian làm việc là gì?],
  (
    [$2x + 3y >= 120$.],
    True([$2x + 3y <= 120$.]),
    [$3x + 2y <= 120$.],
    [$2x + 3y < 120$.]
  ),
  loigiai: [
    + Tổng thời gian làm là $2x + 3y$. Vì có tối đa 120 giờ nên $2x + 3y <= 120$.
  ]
)

#tn([Một hộ nông dân dự định trồng đậu và cà trên diện tích 8 ha. Gọi $x$ là diện tích trồng đậu, $y$ là diện tích trồng cà (đơn vị: ha). Hệ bất phương trình mô tả các điều kiện của $x$ và $y$ là:],
  (
    [$cases(x >= 0\, y >= 0, x + y > 8)$],
    True([$cases(x >= 0\, y >= 0, x + y <= 8)$]),
    [$cases(x > 0\, y > 0, x + y <= 8)$],
    [$cases(x <= 0\, y <= 0, x + y <= 8)$]
  ),
  loigiai: [
    + Diện tích không âm nên $x >= 0, y >= 0$. Tổng diện tích tối đa 8 ha nên $x + y <= 8$.
  ]
)

#tn([Giá trị lớn nhất của biểu thức $F(x, y) = x + 2y$ với điều kiện $cases(0 <= x <= 2, 0 <= y <= 3)$ là:],
  (
    [$2$.],
    [$6$.],
    True([$8$.]),
    [$10$.]
  ),
  loigiai: [
    + Biểu thức $F(x,y) = x + 2y$. Vì $x <= 2$ và $y <= 3$ nên $F(x,y) <= 2 + 2(3) = 8$. 
    + Max bằng 8 khi $x=2, y=3$.
  ]
)

#tn([Miền đa giác được tạo bởi hệ $cases(x >= 0, y >= 0, x + y <= 4)$ là một hình gì?],
  (
    [Hình chữ nhật.],
    True([Hình tam giác vuông.]),
    [Hình thang.],
    [Hình tứ giác.]
  ),
  loigiai: [
    + Các đường thẳng $x=0, y=0, x+y=4$ tạo thành tam giác vuông tại gốc tọa độ $O(0,0)$ với các đỉnh $(0,0), (4,0), (0,4)$.
  ]
)

#tn([Điểm nào sau đây không thuộc miền nghiệm của hệ $cases(2x - y <= 3, x + y > 1)$?],
  (
    [$(1; 1)$.],
    [$(0; 2)$.],
    True([$(2; -1)$.]),
    [$(1; 2)$.]
  ),
  loigiai: [
    + Thay $(2; -1)$ vào hệ: $2(2) - (-1) = 5 <= 3$ (sai). Vậy điểm $(2; -1)$ không thuộc miền nghiệm.
  ]
)

#tn([Để làm một chiếc bánh loại I cần 2 kg bột và 1 kg đường. Để làm một chiếc bánh loại II cần 1 kg bột và 2 kg đường. Cửa hàng có sẵn 10 kg bột và 14 kg đường. Gọi $x, y$ là số bánh loại I và loại II cần làm. Ràng buộc về lượng đường là:],
  (
    [$2x + y <= 14$.],
    True([$x + 2y <= 14$.]),
    [$x + 2y <= 10$.],
    [$2x + y <= 10$.]
  ),
  loigiai: [
    + Lượng đường làm bánh loại I là $1*x = x$ (kg), loại II là $2*y = 2y$ (kg).
    + Tổng lượng đường là $x + 2y$. Vì có tối đa 14 kg nên $x + 2y <= 14$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho bất phương trình bậc nhất hai ẩn $2x - 3y > 6$ $(*)$.],
  (
    [Điểm $A(0; 0)$ thuộc miền nghiệm của bất phương trình $(*)$.],
    True([Điểm $B(4; 0)$ thuộc miền nghiệm của bất phương trình $(*)$.]),
    [Đường thẳng $d: 2x - 3y = 6$ nằm trong miền nghiệm của bất phương trình $(*)$.],
    True([Miền nghiệm của bất phương trình $(*)$ là nửa mặt phẳng bờ là đường thẳng $d: 2x - 3y = 6$ chứa điểm $M(5; 1)$.])
  ),
  loigiai: [
    + a) Thay $(0;0)$ vào $2x-3y = 0 < 6$ nên $(0;0)$ không thuộc miền nghiệm. (Sai)
    + b) Thay $(4;0)$ vào $2(4) - 0 = 8 > 6$ (đúng). (Đúng)
    + c) Bất phương trình là dấu ">" không chứa dấu "=" nên miền nghiệm không chứa bờ. (Sai)
    + d) Thay $(5;1)$ vào $2(5) - 3(1) = 7 > 6$ (đúng). (Đúng)
  ]
)

#ds([Cho hệ bất phương trình $cases(x + y <= 4, x - y >= -1, x >= 0)$. Gọi $S$ là miền nghiệm của hệ trên mặt phẳng tọa độ.],
  (
    True([Miền nghiệm $S$ là một đa giác giới hạn.]),
    [Điểm $C(-1; 2)$ thuộc miền nghiệm $S$.],
    True([Biểu thức $F = 2x + y$ đạt giá trị lớn nhất trên $S$ tại điểm có hoành độ $x=4$.]),
    True([Giao điểm của hai đường thẳng $x-y=-1$ và $x+y=4$ là đỉnh của đa giác miền nghiệm.])
  ),
  loigiai: [
    + a) Hệ tạo thành một tứ giác giới hạn ở góc phần tư thứ nhất và thứ tư. (Đúng)
    + b) Do $x >= 0$ nên $(-1; 2)$ không thỏa mãn điều kiện $x >= 0$. (Sai)
    + c) Các đỉnh của đa giác là $(0;1), (1.5; 2.5), (4;0), (0,-1)$ (hoặc điểm tương tự trên biên). 
       + Tại $(4;0)$, $F = 2(4) + 0 = 8$. 
       + Tại $(1.5; 2.5)$, $F = 3 + 2.5 = 5.5$. 
       + Vậy Max $F = 8$ tại $x=4$. (Đúng)
    + d) Giao điểm của $x-y=-1$ và $x+y=4$ là $(1.5; 2.5)$, đây là một đỉnh của đa giác miền nghiệm. (Đúng)
  ]
)

#ds([Một công ty dự định chi tối đa 100 triệu đồng để quảng cáo trên đài phát thanh và truyền hình. Chi phí cho một phút quảng cáo trên đài phát thanh là 2 triệu đồng và trên truyền hình là 10 triệu đồng. Gọi $x$ và $y$ là số phút quảng cáo trên đài phát thanh và truyền hình.],
  (
    True([Hệ bất phương trình mô tả các điều kiện là $cases(x >= 0\, y >= 0, 2x + 10y <= 100)$.]),
    [Nếu công ty chọn quảng cáo 20 phút trên đài phát thanh và 8 phút trên truyền hình thì chi phí nằm trong ngân sách cho phép.],
    True([Điểm $(10; 8)$ là một nghiệm của hệ bất phương trình trên.]),
    True([Nếu công ty bắt buộc phải quảng cáo đúng 5 phút trên truyền hình, thì công ty có thể quảng cáo tối đa 25 phút trên đài phát thanh.])
  ),
  loigiai: [
    + a) Tổng chi phí là $2x + 10y$. Ngân sách tối đa 100 triệu nên $2x + 10y <= 100$, cùng điều kiện $x, y >= 0$. (Đúng)
    + b) Thay $x=20, y=8$: $2(20) + 10(8) = 120 > 100$. (Sai)
    + c) Thay $x=10, y=8$: $2(10) + 10(8) = 100 <= 100$. (Đúng)
    + d) Thay $y=5$ vào $2x + 10(5) <= 100 => 2x <= 50 => x <= 25$. (Đúng)
  ]
)

#ds([Một xưởng may cần may áo và quần. Một cái áo cần 1,5 mét vải và 2 giờ công; một cái quần cần 2 mét vải và 1 giờ công. Xưởng có sẵn 60 mét vải và 50 giờ công. Gọi $x$ là số áo và $y$ là số quần được may. Lợi nhuận của một cái áo là 200 nghìn đồng và một cái quần là 150 nghìn đồng.],
  (
    True([Hệ bất phương trình ràng buộc là $cases(x >= 0\, y >= 0, 1.5x + 2y <= 60, 2x + y <= 50)$.]),
    [Hàm mục tiêu lợi nhuận cần tìm giá trị lớn nhất là $F(x, y) = 150x + 200y$.],
    True([Điểm $(16; 18)$ thuộc miền nghiệm của bài toán.]),
    True([Lợi nhuận lớn nhất có thể đạt được là 5900 nghìn đồng (5,9 triệu đồng).])
  ),
  loigiai: [
    + a) Ràng buộc vải: $1.5x + 2y <= 60$. Ràng buộc giờ công: $2x + y <= 50$. (Đúng)
    + b) Hàm lợi nhuận là $F(x,y) = 200x + 150y$. Đề bài ghi ngược hệ số. (Sai)
    + c) Thay $(16, 18)$ vào: $1.5(16) + 2(18) = 24 + 36 = 60 <= 60$; $2(16) + 18 = 50 <= 50$. (Đúng)
    + d) Các đỉnh của miền nghiệm: $(0; 0)$, $(0; 30)$, $(25; 0)$, giao điểm của 2 đường thẳng là nghiệm của hệ $1.5x + 2y = 60$ và $2x + y = 50$.
       + Giải hệ ta được: $x=16, y=18$.
       + Tính $F(x,y) = 200x + 150y$:
       + $F(0,30) = 4500$
       + $F(25,0) = 5000$
       + $F(16,18) = 200(16) + 150(18) = 3200 + 2700 = 5900$.
       + Vậy lợi nhuận lớn nhất là 5900 nghìn đồng. (Đúng)
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Một nhà nông có 12 ha đất trồng lúa và ngô. Biết rằng để trồng 1 ha lúa cần 10 ngày công, trồng 1 ha ngô cần 5 ngày công. Nhà nông có tối đa 90 ngày công. Biết lợi nhuận khi trồng 1 ha lúa là 20 triệu đồng, 1 ha ngô là 15 triệu đồng. Để đạt được lợi nhuận cao nhất, nhà nông đó cần trồng bao nhiêu ha lúa?],
  [6],
  loigiai: [
    + Gọi $x, y$ lần lượt là số ha lúa và ngô cần trồng ($x >= 0, y >= 0$).
    + Theo đề bài, tổng diện tích trồng là 12 ha nên $x + y <= 12$.
    + Tổng số ngày công cần dùng là $10x + 5y$. Vì có tối đa 90 ngày công nên $10x + 5y <= 90 <=> 2x + y <= 18$.
    + Lợi nhuận thu được là $F(x,y) = 20x + 15y$ (triệu đồng).
    + Bài toán trở thành tìm cực đại của $F(x,y)$ trên miền nghiệm của hệ:
      $heva(x >= 0, y >= 0, x + y <= 12, 2x + y <= 18)$
    + Vẽ miền nghiệm trên mặt phẳng tọa độ $O x y$: miền nghiệm là tứ giác với các đỉnh $(0; 0)$, $(9; 0)$, $(6; 6)$ và $(0; 12)$.
    + Ta tính giá trị của $F$ tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(9; 0) = 20(9) + 15(0) = 180$
      - $F(0; 12) = 20(0) + 15(12) = 180$
      - $F(6; 6) = 20(6) + 15(6) = 210$
    + Vậy lợi nhuận lớn nhất là 210 triệu đồng khi trồng 6 ha lúa và 6 ha ngô.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (10,0), mark: (end: ">"), name: "x")
      content((10, -0.5), $x$)
      line((0,-1), (0,13), mark: (end: ">"), name: "y")
      content((-0.5, 13), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (9,0), (6,6), (0,12), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((9, -0.5), $(9;0)$)
      content((6.5, 6.5), $(6;6)$)
      content((-0.8, 12), $(0;12)$)
    })]
  ]
)

#tln([Biết $m = m_0$ là giá trị lớn nhất để hệ bất phương trình $heva(y >= 0, x + 2y <= 4, x - y >= m)$ có nghiệm. Tìm $m_0$.],
  [4],
  loigiai: [
    + Xét miền nghiệm của $y >= 0, x + 2y <= 4$.
    + Xét hàm $F(x,y) = x - y$. Ta cần tìm giá trị lớn nhất của $F(x,y)$ trên miền nghiệm để hệ có chứa $x - y >= m$.
    + Từ $x + 2y <= 4$, ta có $x <= 4 - 2y$.
    + Mà $y >= 0 => -y <= 0$. Do đó $F(x,y) = x - y <= 4 - 2y - y = 4 - 3y <= 4$.
    + Dấu bằng xảy ra khi $y = 0 => x = 4$. Điểm $(4; 0)$ thuộc miền nghiệm.
    + Vậy giá trị lớn nhất của $x - y$ là $4$. Để hệ có nghiệm thì $m <= 4 => m_0 = 4$.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-2,0), (5,0), mark: (end: ">"))
      content((5, -0.4), $x$)
      line((0,-1), (0,3), mark: (end: ">"))
      content((-0.4, 3), $y$)
      content((-0.3, -0.3), $O$)
      line((-2,0), (4,0), (0,2), (-2,3), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((4.2, -0.4), $(4;0)$)
      content((-0.5, 2), $(0;2)$)
    })]
  ]
)

#tln([Một xí nghiệp sản xuất hai loại sản phẩm là I và II. Sản phẩm I cần 1 giờ máy cắt, 2 giờ máy tiện. Sản phẩm II cần 2 giờ máy cắt, 1 giờ máy tiện. Biết xí nghiệp có tối đa 10 giờ máy cắt và 8 giờ máy tiện. Lợi nhuận mỗi sản phẩm I là 3 triệu, sản phẩm II là 2 triệu. Gọi $M$ là lợi nhuận lớn nhất (triệu đồng) mà xí nghiệp có thể đạt được. Tìm $M$.],
  [14],
  loigiai: [
    + Gọi $x, y$ lần lượt là số lượng sản phẩm I và II được sản xuất ($x >= 0, y >= 0$).
    + Ràng buộc về số giờ máy cắt: $x + 2y <= 10$.
    + Ràng buộc về số giờ máy tiện: $2x + y <= 8$.
    + Hàm mục tiêu lợi nhuận: $F(x,y) = 3x + 2y$ (triệu đồng).
    + Bài toán trở thành tìm giá trị lớn nhất của $F(x,y)$ trên miền nghiệm của hệ:
      $heva(x >= 0, y >= 0, x + 2y <= 10, 2x + y <= 8)$
    + Vẽ miền nghiệm trên mặt phẳng tọa độ $O x y$: miền nghiệm là tứ giác với các đỉnh $(0; 0)$, $(4; 0)$, $(2; 4)$ và $(0; 5)$.
    + Ta tính giá trị của $F$ tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(4; 0) = 12$
      - $F(0; 5) = 10$
      - $F(2; 4) = 3(2) + 2(4) = 14$
    + Vậy lợi nhuận lớn nhất là 14 triệu đồng.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.5), $x$)
      line((0,-1), (0,6), mark: (end: ">"), name: "y")
      content((-0.5, 6), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (2,4), (0,5), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((4, -0.5), $(4;0)$)
      content((2.5, 4.5), $(2;4)$)
      content((-0.8, 5), $(0;5)$)
    })]
  ]
)

#tln([Một nhà máy sản xuất hai loại phân bón A và B. Một tấn phân bón A chứa 20 kg nitơ và 10 kg phốt pho; một tấn phân bón B chứa 10 kg nitơ và 30 kg phốt pho. Một trang trại cần ít nhất 100 kg nitơ và 120 kg phốt pho để bón cho cây trồng. Biết giá mỗi tấn phân A là 3 triệu đồng, phân B là 4 triệu đồng. Hỏi trang trại cần mua tổng cộng bao nhiêu tấn phân bón cả hai loại để chi phí là nhỏ nhất?],
  [6.4],
  loigiai: [
    + Gọi $x, y$ lần lượt là số tấn phân bón A và B cần mua ($x >= 0, y >= 0$).
    + Yêu cầu về lượng nitơ: $20x + 10y >= 100 <=> 2x + y >= 10$.
    + Yêu cầu về lượng phốt pho: $10x + 30y >= 120 <=> x + 3y >= 12$.
    + Hàm chi phí cần tối thiểu: $F(x,y) = 3x + 4y$ (triệu đồng).
    + Bài toán tìm giá trị nhỏ nhất của $F(x,y)$ trên miền nghiệm của hệ:
      $heva(x >= 0, y >= 0, 2x + y >= 10, x + 3y >= 12)$
    + Miền nghiệm là miền đa giác không bị chặn. Các đỉnh của miền là giao điểm của các đường giới hạn: $(12; 0)$, $(0; 10)$ và giao điểm $(18/5; 14/5) = (3.6; 2.8)$.
    + Ta tính giá trị của $F$ tại các đỉnh:
      - $F(12; 0) = 3(12) + 0 = 36$
      - $F(0; 10) = 0 + 4(10) = 40$
      - $F(3.6; 2.8) = 3(3.6) + 4(2.8) = 10.8 + 11.2 = 22$
    + Vậy chi phí thấp nhất là 22 triệu đồng đạt được tại $x = 3.6, y = 2.8$. 
    + Tổng số tấn phân bón cần mua là $3.6 + 2.8 = 6.4$ tấn.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (13,0), mark: (end: ">"), name: "x")
      content((13, -0.5), $x$)
      line((0,-1), (0,11), mark: (end: ">"), name: "y")
      content((-0.5, 11), $y$)
      content((-0.3, -0.3), $O$)
      line((12,0), (13,0), (13,11), (0,11), (0,10), (3.6, 2.8), close: true, fill: rgb(0,0,255,50), stroke: none)
      line((12,0), (3.6, 2.8), (0,10), stroke: blue)
      content((12, -0.5), $(12;0)$)
      content((4.2, 3), $(3.6;2.8)$)
      content((-0.8, 10), $(0;10)$)
    })]
  ]
)

#tln([Trong một đợt vận động quyên góp, lớp 10A cần đóng gói hai loại phần quà. Phần quà loại 1 cần 2 kg gạo và 1 hộp sữa; phần quà loại 2 cần 1 kg gạo và 3 hộp sữa. Lớp đã quyên góp được tối đa 20 kg gạo và 30 hộp sữa. Mỗi phần quà loại 1 sẽ mang lại 5 điểm thi đua, loại 2 mang lại 8 điểm thi đua. Điểm thi đua lớn nhất mà lớp 10A có thể đạt được là bao nhiêu?],
  [94],
  loigiai: [
    + Gọi $x, y$ lần lượt là số phần quà loại 1 và loại 2 cần đóng gói ($x, y in NN$).
    + Giới hạn về số kg gạo: $2x + y <= 20$.
    + Giới hạn về số hộp sữa: $x + 3y <= 30$.
    + Hàm mục tiêu điểm thi đua: $F(x,y) = 5x + 8y$.
    + Bài toán tìm giá trị lớn nhất của $F(x,y)$ trên miền:
      $heva(x >= 0, y >= 0, 2x + y <= 20, x + 3y <= 30)$
    + Vẽ miền nghiệm trên mặt phẳng tọa độ $O x y$: miền nghiệm là tứ giác với các đỉnh $(0; 0)$, $(10; 0)$, $(0; 10)$ và giao điểm của hai đường thẳng $2x + y = 20$, $x + 3y = 30$ là $(6; 8)$.
    + Tính điểm $F$ tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(10; 0) = 50$
      - $F(0; 10) = 80$
      - $F(6; 8) = 5(6) + 8(8) = 94$
    + Do điểm $(6; 8)$ có toạ độ nguyên nên ta có thể nhận. Vậy điểm thi đua lớn nhất là 94.
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (11,0), mark: (end: ">"), name: "x")
      content((11, -0.5), $x$)
      line((0,-1), (0,11), mark: (end: ">"), name: "y")
      content((-0.5, 11), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (10,0), (6,8), (0,10), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((10, -0.5), $(10;0)$)
      content((6.5, 8.5), $(6;8)$)
      content((-0.8, 10), $(0;10)$)
    })]
  ]
)

#tln([Một công ty du lịch cần thuê xe chở 140 hành khách. Có hai loại xe: loại xe 40 chỗ cho thuê với giá 4 triệu/chiếc, và loại xe 10 chỗ cho thuê với giá 1,5 triệu/chiếc. Tuy nhiên, công ty xe chỉ có tối đa 4 chiếc xe 40 chỗ và 6 chiếc xe 10 chỗ. Hỏi chi phí thuê xe thấp nhất mà công ty du lịch phải trả là bao nhiêu triệu đồng?],
  [15],
  loigiai: [
    + Gọi $x, y$ lần lượt là số xe 40 chỗ và 10 chỗ cần thuê ($x, y in NN$).
    + Do công ty chỉ có tối đa 4 chiếc xe 40 chỗ và 6 chiếc xe 10 chỗ nên: $0 <= x <= 4$ và $0 <= y <= 6$.
    + Tổng số hành khách chở được là $40x + 10y$. Cần chở 140 khách nên:
      $40x + 10y >= 140 <=> 4x + y >= 14$.
    + Chi phí thuê xe: $F(x,y) = 4x + 1.5y$ (triệu đồng).
    + Bài toán tìm min $F(x,y)$ trên miền đa giác bị giới hạn bởi:
      $heva(0 <= x <= 4, 0 <= y <= 6, 4x + y >= 14)$
    + Giao điểm của $y = 6$ với $4x+y=14$ là $x = 2 => A(2; 6)$.
    + Thật ra miền giới hạn là đa giác có các đỉnh $A(2; 6)$, $B(4; 6)$, $C(4; 0)$ và $D(3.5; 0)$.
    + Tuy nhiên, vì số xe $x,y$ phải là số nguyên nên ta chỉ xét các điểm nguyên $(x; y)$ nằm trong đa giác này: $(2; 6)$, $(3; 2)$, $(3; 3)$, ..., $(4; 0)$.
    + Tính $F(x,y)$ tại một số điểm nguyên:
      - $F(2; 6) = 4(2) + 1.5(6) = 17$
      - $F(3; 2) = 4(3) + 1.5(2) = 15$
      - $F(4; 0) = 16$
    + Vậy chi phí thấp nhất là 15 triệu (tương ứng thuê 3 xe 40 chỗ và 2 xe 10 chỗ).
    #align(center)[#cetz.canvas({
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.5), $x$)
      line((0,-1), (0,7), mark: (end: ">"), name: "y")
      content((-0.5, 7), $y$)
      content((-0.3, -0.3), $O$)
      line((2,6), (4,6), (4,0), (3.5,0), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((1.5, 6), $(2;6)$)
      content((4.2, 6.2), $(4;6)$)
      content((4.4, 0.2), $(4;0)$)
      circle((3,2), radius: 0.05, fill: red)
      content((3, 1.5), text(fill: red, $(3;2)$))
    })]
  ]
)
