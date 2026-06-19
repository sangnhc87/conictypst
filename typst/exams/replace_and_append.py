# coding=utf-8
import re

with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to replace Dạng 13
d13_start_pattern = '=== Dạng 13: Sự tiếp xúc "trơn" trong thiết kế Trang sức'
# We will just replace everything from Dạng 13 to the end of the file.
pos = content.find(d13_start_pattern)

new_tail = """=== Dạng 13: Sự tiếp xúc "trơn" trong thiết kế Trang sức (Ứng dụng Tích phân)

#tln(
  [Một nghệ nhân chế tác một mặt dây chuyền bằng pha lê. Thiết kế cắt dọc của mặt dây chuyền là một hình phẳng $(H)$ giới hạn bởi trục hoành, đường thẳng $x = 0$, đường thẳng $x = 3$ và một đường cong $(C)$. Biết rằng đường cong $(C)$ được ghép từ hai phần: 
  - Nửa trước (từ $x = 0$ đến $x = 1$) là một cung của đường tròn $x^2 + y^2 = 5$.
  - Nửa sau (từ $x = 1$ đến $x = 3$) là một cung Parabol $(P): y = a x^2 + b x + c$ đi qua điểm $(3; 0)$.
  Để mặt dây chuyền không bị gãy khúc, hai đường cong này được ghép nối "trơn mượt" (tức là tiếp xúc với nhau) tại điểm $M(1; 2)$. Khi quay hình phẳng $(H)$ quanh trục $O x$, ta thu được khối pha lê tròn xoay. Biết thể tích của khối pha lê này là $V$. Tính giá trị của $V/pi$ (làm tròn đến hàng phần mười).],
  [$8","1$],
  loigiai: [
    #step[Trên đoạn $[0; 1]$, đường cong là phần nhánh dương của đường tròn: $y_1 = sqrt(5 - x^2)$.]
    #step[Tại $x = 1$, ta có $y_1(1) = 2$. Đạo hàm $y'_1 = (-x)/sqrt(5 - x^2) => y'_1(1) = -1/2$.]
    #step[Trên đoạn $[1; 3]$, đường cong là Parabol $y_2 = a x^2 + b x + c$. Đạo hàm $y'_2 = 2a x + b$.]
    #step[Sự tiếp xúc "trơn" tại $M(1; 2)$ đòi hỏi hàm số liên tục và có cùng hệ số góc tiếp tuyến (đạo hàm bằng nhau):
    $ cases(
      y_2(1) = y_1(1) = 2,
      y'_2(1) = y'_1(1) = -1/2
    ) <=> cases(
      a + b + c = 2 quad (1),
      2a + b = -1/2 quad (2)
    ) $]
    #step[Mặt khác, Parabol đi qua điểm $(3; 0)$ nên: $9a + 3b + c = 0 quad (3)$.]
    #step[Từ (2) ta có $b = -2a - 1/2$. Thay vào (1) được $c = 2 - a - b = a + 5/2$.
    Thay $b, c$ vào (3): $9a + 3(-2a - 1/2) + (a + 5/2) = 0 <=> 4a + 1 = 0 <=> a = -1/4$.
    Suy ra $b = 0$ và $c = 9/4$. Vậy phương trình Parabol là $y_2 = -1/4 x^2 + 9/4$.]
    #step[Thể tích khối pha lê được tính bằng tổng thể tích 2 phần: $V = V_1 + V_2 = pi integral_0^1 y_1^2 d x + pi integral_1^3 y_2^2 d x$.]
    #step[$V_1 = pi integral_0^1 (5 - x^2) d x = pi (5x - x^3/3) |_0^1 = 14/3 pi$.]
    #step[$V_2 = pi integral_1^3 (-1/4 x^2 + 9/4)^2 d x = pi integral_1^3 (1/16 x^4 - 9/8 x^2 + 81/16) d x = pi (x^5/80 - (3x^3)/8 + (81x)/16) |_1^3$.]
    #step[Thay cận: Tại $x=3$ biểu thức bằng $81/10$. Tại $x=1$ biểu thức bằng $47/10$. $=> V_2 = pi (81/10 - 47/10) = 17/5 pi$.]
    #step[Tổng thể tích: $V = 14/3 pi + 17/5 pi = 121/15 pi$. Do đó $V/pi = 121/15 approx 8,067 approx 8,1$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      line((-1, 0), (4, 0), mark: (end: ">"), stroke: rgb("C62828"))
      line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: rgb("C62828"))
      
      // Vẽ nửa trên
      let c_pts_top = range(0, 11).map(x => (x/10, calc.sqrt(5 - (x/10)*(x/10))))
      let p_pts_top = range(10, 31).map(x => (x/10, -0.25 * (x/10)*(x/10) + 2.25))
      line(..c_pts_top, stroke: (paint: blue, thickness: 1.5pt))
      line(..p_pts_top, stroke: (paint: green.darken(20%), thickness: 1.5pt))
      
      // Vẽ nửa dưới (tạo hiệu ứng 3D khối tròn xoay)
      let c_pts_bot = range(0, 11).map(x => (x/10, -calc.sqrt(5 - (x/10)*(x/10))))
      let p_pts_bot = range(10, 31).map(x => (x/10, -(-0.25 * (x/10)*(x/10) + 2.25)))
      line(..c_pts_bot, stroke: (paint: blue.lighten(50%), thickness: 1pt))
      line(..p_pts_bot, stroke: (paint: green.lighten(50%), thickness: 1pt))
      
      // Vẽ các vòng elip (mặt cắt 3D)
      // Tại x = 1 (R = 2)
      cetz.draw.circle((1, 0), radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt))
      // Tại x = 0 (R = sqrt(5) = 2.236)
      cetz.draw.circle((0, 0), radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt))
      // Tại x = 2 (R = -1/4 * 4 + 9/4 = 5/4 = 1.25)
      cetz.draw.circle((2, 0), radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt))
      
      // Điểm nối M(1, 2)
      circle((1, 2), radius: 0.1, fill: black)
      content((1.2, 2.3), [$M$])
      line((1, 0), (1, 2), stroke: (paint: gray, dash: "dashed"))
      content((1.3, -0.4), [$1$])
      content((3, -0.4), [$3$])
      
      // Tiếp tuyến chung
      line((0, 2.5), (3, 1), stroke: (paint: orange, dash: "dotted", thickness: 1pt))
    })
  ]
)

=== Dạng 14: Mô hình 3D Bình gốm (Tiếp xúc 2 Parabol)

#tln(
  [Một nghệ nhân gốm tạo ra một chiếc bình có mặt cắt dọc là hình phẳng giới hạn bởi trục hoành và hai cung Parabol $(P_1), (P_2)$. Phần miệng và thân trên của bình (từ $x=0$ đến $x=1$) là cung của $(P_1): y = -x^2 + 4x$. Phần thân dưới và đáy bình (từ $x=1$ đến $x=3$) là cung của $(P_2): y = a x^2 + b x + c$. 
  Để chiếc bình có đường cong hoàn mỹ, hai cung này được ghép nối "trơn mượt" (tiếp xúc nhau) tại điểm có hoành độ $x=1$. Biết đáy bình nằm tại $x=3$ là một điểm nhọn (tức là $(P_2)$ đi qua điểm $(3; 0)$). Tính giá trị của biểu thức $S = 4a + 2b - 4c$.],
  [$7$],
  loigiai: [
    #step[Tại $x=1$, điểm trên $(P_1)$ là $M(1; 3)$. Đạo hàm $y'_1 = -2x + 4 => y'_1(1) = 2$.]
    #step[Vì $(P_2)$ nối trơn với $(P_1)$ tại $M(1; 3)$ nên đồ thị $(P_2)$ cũng đi qua $M$ và có hệ số góc tiếp tuyến tại đó bằng 2. Ta có hệ điều kiện:
    $ cases(
      y_2(1) = 3,
      y'_2(1) = 2
    ) <=> cases(
      a + b + c = 3 quad (1),
      2a + b = 2 quad (2)
    ) $]
    #step[Ngoài ra $(P_2)$ đi qua $(3; 0)$ nên: $9a + 3b + c = 0 quad (3)$.]
    #step[Từ (2) $=> b = 2 - 2a$. Thế vào (1): $a + (2 - 2a) + c = 3 => c = a + 1$.]
    #step[Thế $b, c$ vào (3): $9a + 3(2 - 2a) + (a + 1) = 0 <=> 4a + 7 = 0 <=> a = -7/4$.]
    #step[Suy ra $b = 2 - 2(-7/4) = 11/2$ và $c = -7/4 + 1 = -3/4$.]
    #step[Tính biểu thức $S = 4(-7/4) + 2(11/2) - 4(-3/4) = -7 + 11 + 3 = 7$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Xoay trục đứng cho giống bình gốm thực tế
      // Tức là x đóng vai trò chiều cao (trục y cũ), y đóng vai trò bán kính (trục x cũ)
      // Chuyển trục: x_draw = y, y_draw = -x
      
      // Trục trung tâm
      line((0, 1), (0, -4), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
      
      // Hàm vẽ 3D các vòng elip
      let draw_ellipse(y_coord, radius, color) = {
        cetz.draw.circle((0, -y_coord), radius: (radius, 0.3 * radius), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // (P1): y_r = -x^2 + 4x (x từ 0 đến 1)
      let p1_pts = range(0, 11).map(x => {
        let h = x/10
        let r = -h*h + 4*h
        return (r, -h)
      })
      let p1_pts_neg = range(0, 11).map(x => {
        let h = x/10
        let r = -h*h + 4*h
        return (-r, -h)
      })
      
      // (P2): y_r = -1.75 x^2 + 5.5 x - 0.75 (x từ 1 đến 3)
      let p2_pts = range(10, 31).map(x => {
        let h = x/10
        let r = -1.75 * h*h + 5.5 * h - 0.75
        return (r, -h)
      })
      let p2_pts_neg = range(10, 31).map(x => {
        let h = x/10
        let r = -1.75 * h*h + 5.5 * h - 0.75
        return (-r, -h)
      })
      
      // Vẽ viền bình gốm
      line(..p1_pts, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p1_pts_neg, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p2_pts, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p2_pts_neg, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Vẽ các vòng elip tạo hiệu ứng khối
      // Miệng bình tại x=0, r=0
      // Vòng tại x=0.5, r = -0.25+2 = 1.75
      draw_ellipse(0.5, 1.75, rgb("D7CCC8"))
      // Vòng tại tiếp điểm x=1, r=3
      draw_ellipse(1, 3, rgb("8D6E63"))
      // Vòng tại x=2, r = -1.75*4 + 11 - 0.75 = -7+11-0.75 = 3.25
      draw_ellipse(2, 3.25, rgb("D7CCC8"))
      
      content((3.5, -1), [$M(1; 3)$])
      circle((3, -1), radius: 0.1, fill: black)
      circle((-3, -1), radius: 0.1, fill: black)
    })
  ]
)

=== Dạng 15: Bể cá cảnh Nón cụt tiếp xúc Cầu (Hình học 3D)

#tln(
  [Trong một bể cá thủy tinh có dạng khối nón cụt, người ta đặt một quả cầu trang trí sao cho quả cầu vừa khít với bề mặt bể (tiếp xúc với cả mặt đáy lớn, đáy nhỏ và mặt xung quanh của khối nón cụt). Biết bán kính của quả cầu là $R = 2$ (dm), bán kính đáy nhỏ của nón cụt là $r_1 = 1$ (dm). Tính thể tích của bể cá (khối nón cụt) đó (đơn vị dm$^3$, làm tròn kết quả đến hàng phần mười).],
  [$88","0$],
  loigiai: [
    #step[Cắt dọc bể cá qua trục, ta được thiết diện là một hình thang cân ngoại tiếp một đường tròn tâm $O$, bán kính $R = 2$. Gọi đáy nhỏ là $A B = 2 r_1 = 2$, đáy lớn là $C D = 2 r_2$, chiều cao hình thang chính là đường kính quả cầu: $h = 2R = 4$.]
    #step[Đường sinh của nón cụt tương ứng với cạnh bên hình thang cân: $l = B C$. Do tứ giác ngoại tiếp đường tròn nên tổng hai cạnh đối bằng nhau:
    $A B + C D = A D + B C <=> 2r_1 + 2r_2 = 2l => l = r_1 + r_2$.]
    #step[Hạ đường cao từ $B$ xuống $C D$ tại $H$, xét tam giác vuông $B H C$ có $B H = h = 4$, $H C = r_2 - r_1$. Theo định lý Pytago:
    $l^2 = B H^2 + H C^2 => (r_1 + r_2)^2 = (2R)^2 + (r_2 - r_1)^2$
    $<=> r_1^2 + 2r_1 r_2 + r_2^2 = 4R^2 + r_2^2 - 2r_1 r_2 + r_1^2 <=> 4r_1 r_2 = 4R^2 <=> r_1 r_2 = R^2$.]
    #step[Với $R = 2$ và $r_1 = 1$, ta có $1 * r_2 = 2^2 = 4 => r_2 = 4$ (dm).]
    #step[Thể tích của khối nón cụt là:
    $V = 1/3 pi h (r_1^2 + r_2^2 + r_1 r_2) = 1/3 pi * 4 * (1^2 + 4^2 + 1*4) = 4/3 pi (1 + 16 + 4) = 28 pi$.]
    #step[Tính giá trị xấp xỉ: $V = 28 * 3,14159... approx 87,964$. Làm tròn đến hàng phần mười ta được $88,0$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Hình nón cụt
      
      // Đáy lớn (elip)
      cetz.draw.circle((0, -2), radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt))
      // Đáy nhỏ (elip)
      cetz.draw.circle((0, 2), radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt))
      // Cạnh bên
      line((-1, 2), (-4, -2), stroke: (paint: blue, thickness: 1.5pt))
      line((1, 2), (4, -2), stroke: (paint: blue, thickness: 1.5pt))
      
      // Quả cầu bên trong (đổ màu 3D)
      cetz.draw.circle((0, 0), radius: 2, stroke: (paint: rgb("FFB300"), thickness: 1.5pt), fill: rgb("FFB300").lighten(80%))
      // Vẽ thêm đường xích đạo của cầu để tạo 3D
      cetz.draw.circle((0, 0), radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 0.5pt))
      
      // Trục
      line((0, 2.5), (0, -2.5), stroke: (paint: gray, dash: "dashed"))
      circle((0, 0), radius: 0.1, fill: black)
      content((0.4, 0.3), [$O$])
    })
  ]
)
"""

if pos != -1:
    content = content[:pos] + new_tail
    with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'w', encoding='utf-8') as f:
        f.write(content)
    print("Replaced Dạng 13 and appended Dạng 14, 15.")
else:
    print("Dạng 13 not found.")
