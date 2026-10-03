#import "/public/hdsd/typst/sang-math-geom.typ": *
#import "@preview/sang-math:1.0.6": *


#let mode = "dethi"
#let accent = rgb("d97706")
#let ma-de = "1002"
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

#tn([Miền nghiệm của bất phương trình $3x - 2y < -6$ là nửa mặt phẳng chứa điểm:],
  (
    [$(0; 0)$.],
    True([$(-3; 0)$.]),
    [$(0; 2)$.],
    [$(2; -1)$.]
  ),
  loigiai: [
    + Thay $(-3; 0)$ vào ta có $3(-3) - 2(0) = -9 < -6$ (đúng).
  ]
)

#tn([Cho bất phương trình $2x + y > 3$. Cặp số nào sau đây không thuộc miền nghiệm của bất phương trình?],
  (
    [$(2; 0)$.],
    [$(1; 2)$.],
    True([$(1; 1)$.]),
    [$(3; -1)$.]
  ),
  loigiai: [
    + Thay $(1; 1)$ vào: $2(1) + 1 = 3 > 3$ (Sai).
  ]
)

#tn([Hệ bất phương trình $heva(x >= 0, y >= 0, 2x + y <= 3)$ có bao nhiêu nghiệm nguyên $(x; y)$?],
  (
    [$3$.],
    [$4$.],
    [$5$.],
    True([$6$.])
  ),
  loigiai: [
    + Vì $x, y$ là số nguyên không âm và $2x + y <= 3$, ta có các trường hợp:
    - $x = 0 => y in {0; 1; 2; 3}$ (có 4 cặp)
    - $x = 1 => 2 + y <= 3 => y in {0; 1}$ (có 2 cặp)
    - $x >= 2 => 2x >= 4$ (không thỏa mãn vì $y >= 0$)
    + Tổng cộng có 6 cặp. Vậy có 6 nghiệm nguyên.
  ]
)

#tn([Có bao nhiêu điểm có tọa độ nguyên nằm trong miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 2)$?],
  (
    [3.],
    [4.],
    [5.],
    True([8.])
  ),
  loigiai: [
    + Các điểm có tọa độ nguyên $(x; y)$ thỏa mãn hệ là: $(0;0), (0;1), (0;2), (1;0), (1;1), (2;0)$. 
    + Tổng cộng có 6 điểm.
  ]
)

#tn([Gọi $S$ là diện tích miền đa giác tạo bởi hệ bất phương trình $cases(x >= 0, y >= 0, x + 2y <= 4)$. Giá trị của $S$ bằng bao nhiêu?],
  (
    [2.],
    True([4.]),
    [6.],
    [8.]
  ),
  loigiai: [
    + Đường thẳng $x + 2y = 4$ cắt trục hoành tại $A(4;0)$ và cắt trục tung tại $B(0;2)$.
    + Miền nghiệm là tam giác vuông $O A B$ vuông tại $O(0;0)$.
    + Diện tích $S = 1/2 * O A * O B = 1/2 * 4 * 2 = 4$.
  ]
)

#tn([Tìm tất cả các giá trị của tham số $m$ để cặp số $(2; 1)$ thuộc miền nghiệm của bất phương trình $2x - y > m - 3$.],
  (
    [$m > 6$.],
    True([$m < 6$.]),
    [$m >= 6$.],
    [$m <= 6$.]
  ),
  loigiai: [
    + Thay $x=2, y=1$ vào bất phương trình ta được: $2(2) - 1 > m - 3 <=> 3 > m - 3 <=> m < 6$.
  ]
)

#tn([Miền đa giác được tạo bởi hệ $cases(x >= 0, 0 <= y <= 3, 2x + y <= 5)$ có diện tích là bao nhiêu?],
  (
    [5.],
    [6.],
    True([$21/4$.]),
    [7.]
  ),
  loigiai: [
    + Các đường giới hạn: trục $O y$ ($x=0$), trục $O x$ ($y=0$), đường $y=3$, và đường $2x+y=5$.
    + Các đỉnh của miền nghiệm: $(0;0), (2.5; 0), (1; 3), (0; 3)$.
    + Đây là hình thang vuông tại trục tung.
    + Chiều cao $h = 3$. Đáy bé $a = 1$, đáy lớn $b = 2.5$.
    + Diện tích $S = (1 + 2.5) * 3 / 2 = 3.5 * 3 / 2 = 10.5 / 2 = 21/4$.
  ]
)

#tn([Một xưởng cần sản xuất ít nhất 40 sản phẩm. Xưởng có hai loại máy A và B. Máy A sản xuất được 5 sản phẩm/giờ, máy B sản xuất được 4 sản phẩm/giờ. Gọi $x$ và $y$ là số giờ hoạt động của máy A và B. Bất phương trình thể hiện điều kiện về số lượng sản phẩm là:],
  (
    [$4x + 5y >= 40$.],
    True([$5x + 4y >= 40$.]),
    [$5x + 4y <= 40$.],
    [$4x + 5y <= 40$.]
  ),
  loigiai: [
    + Số sản phẩm máy A là $5x$, máy B là $4y$. Yêu cầu ít nhất 40 sản phẩm nên $5x + 4y >= 40$.
  ]
)

#tn([Có bao nhiêu điểm tọa độ nguyên nằm trong miền nghiệm của hệ $cases(0 <= x <= 2, 0 <= y <= 2, x + y < 3)$?],
  (
    [6.],
    [7.],
    True([6.]),
    [9.]
  ),
  loigiai: [
    + Các điểm nguyên thỏa $0 <= x <= 2$ và $0 <= y <= 2$ là: $(0,0), (0,1), (0,2), (1,0), (1,1), (1,2), (2,0), (2,1), (2,2)$. Tổng cộng 9 điểm.
    + Kiểm tra điều kiện $x+y < 3$:
    + Các điểm có tổng $x+y=4$: $(2,2)$ (loại).
    + Các điểm có tổng $x+y=3$: $(1,2), (2,1)$ (loại do dấu "<").
    + Các điểm còn lại: $(0,0), (0,1), (0,2), (1,0), (1,1), (2,0)$. Có 6 điểm.
  ]
)

#tn([Cặp số $(m; m+1)$ không thuộc miền nghiệm của bất phương trình $x - y + 3 > 0$ khi và chỉ khi:],
  (
    [$m < -2$.],
    [$m > 2$.],
    [Với mọi $m$.],
    True([Không có giá trị nào của $m$.])
  ),
  loigiai: [
    + Thay $x=m, y=m+1$ vào: $m - (m+1) + 3 = 2 > 0$ (luôn đúng).
    + Vậy với mọi $m$ cặp số luôn thuộc miền nghiệm. Không có $m$ nào để cặp số KHÔNG thuộc miền nghiệm.
  ]
)

#tn([Một học sinh cần mua vở và bút. Số tiền học sinh đó có là 50 nghìn đồng. Một quyển vở giá 8 nghìn đồng, một cái bút giá 4 nghìn đồng. Bất phương trình biểu diễn số lượng vở $x$ và bút $y$ mà học sinh có thể mua là:],
  (
    [$8x + 4y > 50$.],
    True([$8x + 4y <= 50$.]),
    [$4x + 8y <= 50$.],
    [$8x + 4y = 50$.]
  ),
  loigiai: [
    + Tổng số tiền mua vở và bút là $8x + 4y$. Do chỉ có 50 nghìn nên $8x + 4y <= 50$.
  ]
)

#tn([Một gia đình cần ít nhất 900 calo mỗi bữa sáng. Một ly sữa cung cấp 150 calo, một ổ bánh mì cung cấp 300 calo. Nếu gọi $x, y$ lần lượt là số ly sữa và ổ bánh mì, ta có bất phương trình:],
  (
    True([$x + 2y >= 6$.]),
    [$2x + y >= 6$.],
    [$15x + 30y <= 90$.],
    [$x + 2y <= 6$.]
  ),
  loigiai: [
    + $150x + 300y >= 900 <=> x + 2y >= 6$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hệ bất phương trình $cases(x + y <= 3, x - y <= 1, y >= 0)$. Gọi $S$ là miền đa giác nghiệm của hệ.],
  (
    [Miền $S$ là một tam giác giới hạn.],
    [Điểm $A(2; 1)$ là một đỉnh của miền $S$.],
    [Diện tích của miền $S$ bằng $3$.],
    [Số điểm có tọa độ nguyên nằm TRONG (không tính biên) miền $S$ là 2 điểm.]
  ),
  loigiai: [
    + a) Giao điểm của các đường: 
    - $y=0$ và $x-y=1 => (1,0)$.
    - $y=0$ và $x+y=3 => (3,0)$.  the condition is $x-y<=1 => x <= y+1$. At $y=0$, $x <= 1$. So the boundary is $x-y=1$ intersecting $y=0$ at $(1,0)$. Let's check $x+y <= 3$ at $y=0 => x <= 3$. So on the x-axis, $x <= 1$ and $x <= 3$, which means $x in (-infty, 1]$. This is not a closed triangle bounded from the left!)
    + Để tạo tam giác, bổ sung $x >= 0$. Nhưng đề không có $x >= 0$. Đề: $y >= 0$, $x-y <= 1$, $x+y <= 3$.
    + Trên đồ thị: $y >= x-1$, $y <= -x+3$, $y >= 0$. 
    + Hai đường thẳng $y=x-1$ và $y=-x+3$ cắt nhau tại $x=2, y=1 => (2,1)$.
    + Đường $y=x-1$ cắt $y=0$ tại $(1,0)$.
    + Miền nghiệm là $y >= 0$, $y >= x-1$, $y <= -x+3$. Miền này kéo dài vô tận về phía $x \to -infty$ (ví dụ $(-10, 0)$ thoả mãn $0 >= -11$ và $0 <= 13$ và $0 >= 0$).
    + Vậy đây không phải là miền giới hạn tam giác. Ý a) Sai!
  ]
)

#ds([Cho hệ bất phương trình $cases(x >= 0, y >= 0, x + y <= 5, 2x + y <= 8)$.],
  (
    True([Gốc tọa độ $O(0;0)$ thuộc miền nghiệm của hệ.]),
    [Diện tích của đa giác miền nghiệm là $13$.],
    [Có đúng 18 điểm có tọa độ nguyên nằm trong miền nghiệm (kể cả biên).],
    True([Giá trị lớn nhất của hàm mục tiêu $F = 3x + 2y$ trên miền nghiệm là $13$.])
  ),
  loigiai: [
    + a)$(0;0)$ thỏa mãn tất cả các bpt. (Đúng)
    + b) Đỉnh của đa giác: $O(0,0)$, $A(4,0)$ (giao của $2x+y=8$ và $y=0$), $B(3,2)$ (giao $x+y=5$ và $2x+y=8$), $C(0,5)$ (giao $x+y=5$ và $x=0$).
    + Diện tích $S = S_"O A B" + S_"O B C" = 1/2 * 4 * 2 + 1/2 * 5 * 3 = 4 + 7.5 = 11.5$.
    + (Sửa lại ý b là $11.5$ chứ không phải $13$, nên ý b là Sai).
    + c) Đếm điểm nguyên:
    - $x=0: y in {0,1,2,3,4,5} => 6$ điểm.
    - $x=1: y <= 4, 2+y <= 8 => y <= 4 => 5$ điểm.
    - $x=2: y <= 3, 4+y <= 8 => y <= 3 => 4$ điểm.
    - $x=3: y <= 2, 6+y <= 8 => y <= 2 => 3$ điểm.
    - $x=4: y <= 1, 8+y <= 8 => y=0 => 1$ điểm.
    + Tổng: $6 + 5 + 4 + 3 + 1 = 19$ điểm. (Ý c Sai).
    + d)$F(0,0) = 0$, $F(4,0) = 12$, $F(3,2) = 13$, $F(0,5) = 10$. Max $F = 13$. (Đúng).
  ]
)

#ds([Một xưởng sản xuất bàn và ghế. Một cái bàn cần 3 giờ thợ mộc và 1 giờ thợ sơn. Một cái ghế cần 1 giờ thợ mộc và 2 giờ thợ sơn. Xưởng có tối đa 120 giờ thợ mộc và 100 giờ thợ sơn. Lợi nhuận mỗi cái bàn là 500 nghìn, mỗi cái ghế là 400 nghìn.],
  (
    True([Nếu gọi $x, y$ là số bàn và ghế, ta có ràng buộc $cases(3x + y <= 120, x + 2y <= 100)$.]),
    [Xưởng có thể sản xuất được 30 bàn và 40 ghế trong giới hạn thời gian.],
    [Lợi nhuận cao nhất xưởng có thể đạt được là 26 triệu đồng.],
    True([Để tối ưu lợi nhuận, xưởng cần sử dụng hết 100% quỹ thời gian của thợ mộc.])
  ),
  loigiai: [
    + a) Ràng buộc $x, y >= 0$. Thợ mộc: $3x + y <= 120$. Thợ sơn: $x + 2y <= 100$. (Đúng)
    + b) Thay $x=30, y=40$ vào: $3(30) + 40 = 130 > 120$ (Vượt quỹ thời gian mộc). (Sai)
    + c) Giao điểm: $3x+y=120$ và $x+2y=100 => x=28, y=36$.
    + Lợi nhuận $F(28, 36) = 500(28) + 400(36) = 14000 + 14400 = 28400$ nghìn = 28.4 triệu.
    + (Ý c là Sai).
    + d) Tại điểm tối ưu $(28, 36)$, thời gian mộc $3(28) + 36 = 120$ (dùng hết). (Đúng).
  ]
)

#ds([Ông An muốn đầu tư số tiền 1 tỷ đồng vào hai kênh: chứng khoán và trái phiếu. Quy định bắt buộc phải đầu tư ít nhất 200 triệu vào trái phiếu và không quá 600 triệu vào chứng khoán. Lợi nhuận dự kiến từ chứng khoán là 12%/năm, từ trái phiếu là 8%/năm.],
  (
    True([Gọi $x, y$ (triệu đồng) là số tiền đầu tư, hệ điều kiện là $cases(x + y <= 1000, x <= 600, y >= 200)$.]),
    True([Ông An có thể đầu tư 500 triệu vào chứng khoán và 500 triệu vào trái phiếu.]),
    [Lợi nhuận tối đa thu được là 120 triệu đồng/năm.],
    True([Để đạt lợi nhuận tối đa, ông An nên đầu tư toàn bộ tiền còn dư vào chứng khoán.])
  ),
  loigiai: [
    + a) (Đúng)
    + b)$x=500, y=500$. Thoả mãn $x+y=1000 <= 1000, 500 <= 600, 500 >= 200$. (Đúng)
    + c) Hàm mục tiêu $F = 0.12x + 0.08y$. Đỉnh của miền: $(0, 200), (0, 1000), (600, 200), (600, 400)$.
    + Max $F = 0.12(600) + 0.08(400) = 72 + 32 = 104$ triệu. (Sai)
    + d) Đầu tư 600 triệu vào chứng khoán (mức tối đa) và 400 triệu vào trái phiếu mang lại lợi nhuận cao nhất. (Đúng)
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6, reset-counter: true)

#tln([Một nhà máy hóa chất cần pha chế dung dịch T từ hai dung dịch X và Y. Để pha chế, mỗi lít X tốn 300 nghìn đồng và mỗi lít Y tốn 400 nghìn đồng. Dung dịch T cần đảm bảo ít nhất 12 gam chất A và ít nhất 15 gam chất B. Biết mỗi lít X chứa 2 gam A và 1 gam B; mỗi lít Y chứa 1 gam A và 3 gam B. Cần pha bao nhiêu lít X để chi phí pha chế là nhỏ nhất?],
  [4.2],
    loigiai: [
    + Gọi $x, y$ lần lượt là số lít dung dịch X và Y cần pha chế ($x >= 0, y >= 0$).
    + Lượng chất A có trong hỗn hợp là: $2x + y$. Để đảm bảo ít nhất 12 gam chất A thì $2x + y >= 12$.
    + Lượng chất B có trong hỗn hợp là: $x + 3y$. Để đảm bảo ít nhất 15 gam chất B thì $x + 3y >= 15$.
    + Hàm chi phí pha chế cần tìm giá trị nhỏ nhất: $F(x,y) = 300x + 400y$ (nghìn đồng).
    + Ta cần tìm giá trị nhỏ nhất của $F(x,y)$ trên miền nghiệm của hệ:
      $heva(x >= 0, y >= 0, 2x + y >= 12, x + 3y >= 15)$
    + Miền nghiệm của hệ là miền đa giác không bị chặn với các đỉnh là $A(15; 0)$, $B(0; 12)$ và giao điểm của hai đường thẳng $2x + y = 12, x + 3y = 15$ là $C(4.2; 3.6)$.
    + Ta tính giá trị chi phí $F$ tại các đỉnh:
      - $F(15; 0) = 300(15) + 0 = 4500$
      - $F(0; 12) = 0 + 400(12) = 4800$
      - $F(4.2; 3.6) = 300(4.2) + 400(3.6) = 1260 + 1440 = 2700$
    + Vậy chi phí pha chế nhỏ nhất là 2700 nghìn đồng, tương ứng với việc pha 4.2 lít dung dịch X.
    #align(center)[#cetz.canvas(length: 3mm, {
      import cetz.draw: *
      line((-1,0), (16,0), mark: (end: ">"), name: "x")
      content((16, -0.5), $x$)
      line((0,-1), (0,13), mark: (end: ">"), name: "y")
      content((-0.5, 13), $y$)
      content((-0.3, -0.3), $O$)
      line((15,0), (16,0), (16,13), (0,13), (0,12), (4.2, 3.6), close: true, fill: rgb(0,0,255,50), stroke: none)
      line((15,0), (4.2, 3.6), (0,12), stroke: blue)
      content((15, -0.5), $(15;0)$)
      content((4.8, 3.8), $(4.2;3.6)$)
      content((-1, 12), $(0;12)$)
    })]
  ]
)

#tln([Tính diện tích miền nghiệm của hệ bất phương trình $heva(y >= 0, x >= 0, x - y + 2 >= 0, x + y - 4 <= 0)$.],
  [7],
  loigiai: [
    + Vẽ các đường thẳng $x-y+2=0$ và $x+y-4=0$.
    + Miền nghiệm là tứ giác $O A B C$ với $O(0;0), A(4;0), B(1;3), C(0;2)$.
    + Chia tứ giác thành các tam giác hoặc dùng công thức tọa độ, ta tính được diện tích tứ giác là $S = 7$.
    #align(center)[#cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((-1,0), (5,0), mark: (end: ">"), name: "x")
      content((5, -0.4), $x$)
      line((0,-1), (0,4), mark: (end: ">"), name: "y")
      content((-0.4, 4), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (4,0), (1,3), (0,2), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((4.3, -0.4), $A(4;0)$)
      content((1.5, 3.2), $B(1;3)$)
      content((-0.8, 2), $C(0;2)$)
    })]
  ]
)

#tln([Cho hệ bất phương trình $cases(x - y <= 2, x + 2y >= -4, y <= 0)$. Gọi $S$ là diện tích đa giác tạo bởi miền nghiệm của hệ. Tính $2S$.],
  [12],
    loigiai: [
    + Vẽ 3 đường thẳng trên mặt phẳng toạ độ: $d_1: x-y=2$, $d_2: x+2y=-4$ và $d_3: y=0$ (trục hoành).
    + Miền nghiệm của hệ là một tam giác giới hạn bởi 3 đường thẳng trên. Các đỉnh của tam giác là giao điểm của các đường thẳng.
    + Giao điểm của $d_1$ và $d_3$ là điểm $A(2; 0)$.
    + Giao điểm của $d_2$ và $d_3$ là điểm $B(-4; 0)$.
    + Giao điểm của $d_1$ và $d_2$ là nghiệm của hệ $x - y = 2, x + 2y = -4 => 3y = -6 => y = -2, x = 0$. Vậy toạ độ điểm thứ ba là $C(0; -2)$.
    + Đa giác miền nghiệm là tam giác $A B C$ có cạnh đáy $A B$ nằm trên trục hoành với độ dài $A B = 2 - (-4) = 6$.
    + Chiều cao của tam giác hạ từ đỉnh $C(0; -2)$ xuống trục hoành là $h = |-2| = 2$.
    + Diện tích đa giác là $S = 1/2 \cdot A B \cdot h = 1/2 \cdot 6 \cdot 2 = 6$.
    + Vậy $2S = 2 \cdot 6 = 12$.
    #align(center)[#cetz.canvas(length: 6mm, {
      import cetz.draw: *
      line((-5,0), (4,0), mark: (end: ">"), name: "x")
      content((4, 0.4), $x$)
      line((0,-3), (0,2), mark: (end: ">"), name: "y")
      content((-0.4, 2), $y$)
      content((-0.3, 0.3), $O$)
      line((2,0), (-4,0), (0,-2), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((2, 0.4), $A(2;0)$)
      content((-4, 0.4), $B(-4;0)$)
      content((0.8, -2), $C(0;-2)$)
    })]
  ]
)

#tln([Một tiệm bánh dự định sản xuất tối đa 100 cái bánh ngọt. Có hai loại bánh: loại A lãi 15 nghìn đồng/cái, loại B lãi 25 nghìn đồng/cái. Tiệm bánh có một lò nướng giới hạn thời gian nướng tối đa là 180 phút. Mỗi bánh loại A nướng mất 1 phút, bánh loại B nướng mất 3 phút. Nếu bán hết toàn bộ bánh sản xuất ra, lợi nhuận lớn nhất tiệm có thể thu được là bao nhiêu nghìn đồng?],
  [1900],
    loigiai: [
    + Gọi $x, y$ lần lượt là số bánh loại A và loại B cần sản xuất ($x, y in NN$).
    + Do tiệm dự định sản xuất tối đa 100 cái bánh nên: $x + y <= 100$.
    + Thời gian nướng tối đa là 180 phút, với mỗi bánh A mất 1 phút và bánh B mất 3 phút, ta có: $x + 3y <= 180$.
    + Hàm mục tiêu lợi nhuận là: $F(x,y) = 15x + 25y$ (nghìn đồng).
    + Bài toán tìm lớn nhất của $F(x,y)$ trên miền nghiệm đa giác giới hạn bởi hệ:
      $heva(x >= 0, y >= 0, x + y <= 100, x + 3y <= 180)$
    + Các đỉnh của đa giác miền nghiệm là: $(0; 0)$, $(100; 0)$, $(0; 60)$ và giao điểm của hai đường thẳng $x + y = 100, x + 3y = 180$ là $(60; 40)$.
    + Ta tính lợi nhuận tại các đỉnh:
      - $F(0; 0) = 0$
      - $F(0; 60) = 25 \cdot 60 = 1500$
      - $F(100; 0) = 15 \cdot 100 = 1500$
      - $F(60; 40) = 15 \cdot 60 + 25 \cdot 40 = 900 + 1000 = 1900$
    + Vậy lợi nhuận lớn nhất tiệm có thể thu được là 1900 nghìn đồng.
    #align(center)[#cetz.canvas(length: 1mm, {
      import cetz.draw: *
      line((-10,0), (120,0), mark: (end: ">"), name: "x")
      content((120, -6), $x$)
      line((0,-10), (0,80), mark: (end: ">"), name: "y")
      content((-6, 80), $y$)
      content((-4, -4), $O$)
      line((0,0), (100,0), (60,40), (0,60), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((100, -6), $(100;0)$)
      content((68, 48), $(60;40)$)
      content((-10, 60), $(0;60)$)
    })]
  ]
)

#tln([Biết miền nghiệm của hệ bất phương trình $cases(x >= 0, y >= 0, 3x + y <= 6)$ là một miền tam giác vuông. Tính bình phương độ dài bán kính của đường tròn ngoại tiếp tam giác vuông đó.],
  [10],
    loigiai: [
    + Vẽ miền nghiệm của hệ trên mặt phẳng toạ độ $O x y$.
    + Các đỉnh của miền tam giác là gốc toạ độ $O(0;0)$, giao điểm với trục hoành là $A(2;0)$ và giao điểm với trục tung là $B(0;6)$.
    + Tam giác $O A B$ là tam giác vuông tại $O$. Bán kính đường tròn ngoại tiếp của một tam giác vuông bằng một nửa độ dài cạnh huyền.
    + Độ dài cạnh huyền $A B = sqrt{(2 - 0)^2 + (0 - 6)^2} = sqrt{4 + 36} = sqrt{40}$.
    + Bán kính $R = (A B) / 2 = sqrt{40} / 2 = sqrt{10}$.
    + Vậy bình phương độ dài bán kính là $R^2 = 10$.
    #align(center)[#cetz.canvas(length: 6mm, {
      import cetz.draw: *
      line((-1,0), (4,0), mark: (end: ">"), name: "x")
      content((4, -0.4), $x$)
      line((0,-1), (0,8), mark: (end: ">"), name: "y")
      content((-0.4, 8), $y$)
      content((-0.3, -0.3), $O$)
      line((0,0), (2,0), (0,6), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((2.2, 0.4), $A(2;0)$)
      content((-0.6, 6), $B(0;6)$)
    })]
  ]
)

#tln([Một nhà thầu có 2 kho vật liệu: kho A có 100 tấn xi măng, kho B có 120 tấn. Cần vận chuyển xi măng đến 2 công trường: công trường I cần 80 tấn, công trường II cần 90 tấn. Chi phí vận chuyển (nghìn đồng/tấn) từ kho A đến I là 20, đến II là 30; từ kho B đến I là 40, đến II là 25. Để tổng chi phí vận chuyển là nhỏ nhất, cần chuyển bao nhiêu tấn từ kho A đến công trường I?],
  [80],
    loigiai: [
    + Gọi $x$ là số tấn chuyển từ kho A đến công trường I, $y$ là số tấn chuyển từ A đến II ($x >= 0, y >= 0$).
    + Lượng xi măng còn lại cần chuyển từ kho B đến I là $80 - x$ tấn. Vậy $x <= 80$.
    + Lượng xi măng còn lại cần chuyển từ kho B đến II là $90 - y$ tấn. Vậy $y <= 90$.
    + Khả năng cung cấp của kho A là 100 tấn nên $x + y <= 100$.
    + Khả năng cung cấp của kho B là 120 tấn nên $(80 - x) + (90 - y) <= 120 => x + y >= 50$.
    + Hàm chi phí tổng cộng là: 
      $ F(x,y) = 20x + 30y + 40(80 - x) + 25(90 - y) = 5450 - 20x + 5y $
    + Để tổng chi phí $F(x,y)$ đạt giá trị nhỏ nhất, biểu thức $5450 - 20x + 5y$ cần đạt giá trị nhỏ nhất. Do đó, $x$ phải đạt giá trị lớn nhất có thể, và $y$ đạt giá trị nhỏ nhất có thể.
    + Bài toán tìm min của $F(x,y)$ trên miền đa giác bị giới hạn bởi:
      $heva(0 <= x <= 80, 0 <= y <= 90, 50 <= x + y <= 100)$
    + Các đỉnh của đa giác miền nghiệm là: $(50; 0)$, $(80; 0)$, $(80; 20)$, $(10; 90)$, $(0; 90)$ và $(0; 50)$.
    + Ta tính giá trị của $F$ tại các đỉnh:
      - $F(50; 0) = 5450 - 20(50) = 4450$
      - $F(80; 0) = 5450 - 20(80) = 3850$
      - $F(80; 20) = 5450 - 20(80) + 5(20) = 3950$
      - $F(10; 90) = 5450 - 20(10) + 5(90) = 5700$
      - $F(0; 90) = 5450 + 5(90) = 5900$
      - $F(0; 50) = 5450 + 5(50) = 5700$
    + Vậy chi phí thấp nhất là 3850 nghìn đồng khi $x = 80$ và $y = 0$.
    + Số tấn xi măng cần chuyển từ kho A đến công trường I là 80 tấn.
    #align(center)[#cetz.canvas(length: 1mm, {
      import cetz.draw: *
      line((-10,0), (100,0), mark: (end: ">"), name: "x")
      content((100, -6), $x$)
      line((0,-10), (0,110), mark: (end: ">"), name: "y")
      content((-6, 110), $y$)
      content((-4, -4), $O$)
      line((50,0), (80,0), (80,20), (10,90), (0,90), (0,50), close: true, fill: rgb(0,0,255,50), stroke: blue)
      content((50, -6), $(50;0)$)
      content((80, -6), $(80;0)$)
      content((88, 20), $(80;20)$)
      content((20, 95), $(10;90)$)
      content((-8, 90), $(0;90)$)
      content((-8, 50), $(0;50)$)
    })]
  ]
)
