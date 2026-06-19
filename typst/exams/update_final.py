# coding=utf-8
import re

with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'r', encoding='utf-8') as f:
    content = f.read()

pos = content.find('=== Dạng 13: Sự tiếp xúc "trơn" trong thiết kế Trang sức')

new_content = """=== Dạng 13: Sự tiếp xúc "trơn" trong thiết kế Trang sức (Ứng dụng Tích phân)

#tln(
  [Một nghệ nhân chế tác một mặt dây chuyền bằng pha lê. Thiết kế cắt dọc của mặt dây chuyền là một hình phẳng $(H)$ giới hạn bởi trục hoành, đường thẳng $x = 0$, đường thẳng $x = 3$ và một đường cong $(C)$. Biết rằng đường cong $(C)$ được ghép từ hai phần: 
  - Nửa trước (từ $x = 0$ đến $x = 1$) là một cung của đường tròn $x^2 + y^2 = 5$.
  - Nửa sau (từ $x = 1$ đến $x = 3$) là một cung Parabol $(P): y = a x^2 + b x + c$ đi qua điểm $(3; 0)$.
  Để mặt dây chuyền không bị gãy khúc, hai đường cong này được ghép nối "trơn mượt" (tức là tiếp xúc với nhau) tại điểm $M(1; 2)$. Khi quay hình phẳng $(H)$ quanh trục $O x$, ta thu được khối pha lê tròn xoay. Biết thể tích của khối pha lê này là $V$. Tính giá trị của $V/pi$ (làm tròn đến hàng phần mười).],
  [$8","1$],
  loigiai: [
    #step[Trên $[0; 1]$: $y_1 = sqrt(5 - x^2) => y'_1 = (-x)/sqrt(5 - x^2)$. Tại $x = 1: y_1 = 2, y'_1 = -1/2$.]
    #step[Trên $[1; 3]$: Parabol $y_2 = a x^2 + b x + c => y'_2 = 2a x + b$.]
    #step[Tiếp xúc trơn tại $M(1; 2)$ và đi qua $(3; 0)$:
    $ cases(y_2(1) = 2, y'_2(1) = -1/2, y_2(3) = 0) <=> cases(a + b + c = 2, 2a + b = -1/2, 9a + 3b + c = 0) <=> cases(a = -1/4, b = 0, c = 9/4) $]
    #step[Vậy $(P): y_2 = -1/4 x^2 + 9/4$.]
    #step[Tính tích phân thể tích:
    $ V = pi integral_0^1 (5 - x^2) d x + pi integral_1^3 (-1/4 x^2 + 9/4)^2 d x = 14/3 pi + 17/5 pi = 121/15 pi $]
    #step[Tính xấp xỉ: $V/pi = 121/15 approx 8,067 approx 8,1$.]
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
      
      // Các vòng elip cắt ngang - Chuẩn nét đứt / nét liền
      // Tại x = 1 (rx = 0.4, ry = 2)
      arc((1.4, 0), start: 0deg, stop: 180deg, radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((0.6, 0), start: 180deg, stop: 360deg, radius: (0.4, 2), stroke: (paint: gray, thickness: 0.5pt))
      
      // Tại x = 0 (rx = 0.4, ry = 2.236)
      arc((0.4, 0), start: 0deg, stop: 180deg, radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((-0.4, 0), start: 180deg, stop: 360deg, radius: (0.4, 2.236), stroke: (paint: gray, thickness: 0.5pt))
      
      // Tại x = 2 (rx = 0.3, ry = 1.25)
      arc((2.3, 0), start: 0deg, stop: 180deg, radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
      arc((1.7, 0), start: 180deg, stop: 360deg, radius: (0.3, 1.25), stroke: (paint: gray, thickness: 0.5pt))
      
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
    #step[Hàm $(P_1): y_1 = -x^2 + 4x => y'_1 = -2x + 4$. Tại điểm tiếp xúc $x=1$: $y_1(1) = 3, y'_1(1) = 2$.]
    #step[Hàm $(P_2): y_2 = a x^2 + b x + c => y'_2 = 2ax + b$. Điều kiện ghép trơn tại $x=1$ và đáy $(3; 0)$:
    $ cases(y_2(1) = 3, y'_2(1) = 2, y_2(3) = 0) <=> cases(a + b + c = 3, 2a + b = 2, 9a + 3b + c = 0) <=> cases(a = -7/4, b = 11/2, c = -3/4) $]
    #step[Tính giá trị $S = 4(-7/4) + 2(11/2) - 4(-3/4) = -7 + 11 + 3 = 7$.]
  ],
  fig-pos: "center",
  fig-width: 45%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Xoay trục đứng cho giống bình gốm thực tế
      line((0, 1), (0, -4), mark: (end: ">"), stroke: (paint: gray, dash: "dashed"))
      
      // Hàm vẽ 3D các vòng elip chuẩn nét đứt liền
      let draw_ellipse(y_coord, r, color) = {
        let ry = 0.3 * r
        arc((r, -y_coord), start: 0deg, stop: 180deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((-r, -y_coord), start: 180deg, stop: 360deg, radius: (r, ry), stroke: (paint: color, thickness: 0.5pt))
      }
      
      // (P1): x từ 0 đến 1
      let p1_pts = range(0, 11).map(x => { let h = x/10; return (-h*h + 4*h, -h) })
      let p1_pts_neg = range(0, 11).map(x => { let h = x/10; return (-(-h*h + 4*h), -h) })
      
      // (P2): x từ 1 đến 3
      let p2_pts = range(10, 31).map(x => { let h = x/10; return (-1.75 * h*h + 5.5 * h - 0.75, -h) })
      let p2_pts_neg = range(10, 31).map(x => { let h = x/10; return (-(-1.75 * h*h + 5.5 * h - 0.75), -h) })
      
      // Vẽ viền bình gốm
      line(..p1_pts, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p1_pts_neg, stroke: (paint: rgb("8D6E63"), thickness: 2pt))
      line(..p2_pts, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p2_pts_neg, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Vẽ các vòng elip
      draw_ellipse(0.5, 1.75, rgb("D7CCC8"))
      draw_ellipse(1, 3, rgb("8D6E63"))
      draw_ellipse(2, 3.25, rgb("D7CCC8"))
      
      content((3.5, -1), [$M(1; 3)$])
      circle((3, -1), radius: 0.1, fill: black)
      circle((-3, -1), radius: 0.1, fill: black)
    })
  ]
)

=== Dạng 15: Bể cá cảnh Nón cụt tiếp xúc Cầu (Hình học 3D)

#tln(
  [Trong một bể cá thủy tinh có dạng khối nón cụt, người ta đặt một quả cầu trang trí sao cho quả cầu vừa khít với bề mặt bể (tiếp xúc với cả mặt đáy lớn, đáy nhỏ và mặt xung quanh của khối nón cụt). Biết bán kính của quả cầu là $R = 2$ (dm), bán kính đáy nhỏ của nón cụt là $r_1 = 1$ (dm). Tính thể tích của bể cá (khối nón cụt) đó (đơn vị $upright("dm")^3$, làm tròn kết quả đến hàng phần mười).],
  [$88","0$],
  loigiai: [
    #step[Mặt cắt qua trục là hình thang cân ngoại tiếp đường tròn tâm $O$ bán kính $R = 2$. Đáy nhỏ $2 r_1 = 2$, đáy lớn $2 r_2$, chiều cao $h = 2R = 4$.]
    #step[Tứ giác ngoại tiếp đường tròn nên tổng 2 cạnh đối bằng nhau: $2 l = 2r_1 + 2r_2 => l = r_1 + r_2$.]
    #step[Áp dụng Pytago cho tam giác vuông hạ từ đáy nhỏ xuống đáy lớn: 
    $l^2 = h^2 + (r_2 - r_1)^2 => (r_1 + r_2)^2 = 4^2 + (r_2 - r_1)^2 <=> 4r_1 r_2 = 16 <=> r_1 r_2 = 4$.]
    #step[Do $r_1 = 1$ nên $r_2 = 4$. Thể tích khối nón cụt:
    $ V = 1/3 pi h (r_1^2 + r_2^2 + r_1 r_2) = 1/3 pi * 4 (1 + 16 + 4) = 28 pi approx 87,96. $]
    #step[Làm tròn đến hàng phần mười ta được $88,0$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Đáy lớn
      arc((4, -2), start: 0deg, stop: 180deg, radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
      arc((-4, -2), start: 180deg, stop: 360deg, radius: (4, 1.2), stroke: (paint: blue, thickness: 1.5pt))
      // Đáy nhỏ
      arc((1, 2), start: 0deg, stop: 180deg, radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
      arc((-1, 2), start: 180deg, stop: 360deg, radius: (1, 0.3), stroke: (paint: blue, thickness: 1.5pt))
      // Cạnh bên
      line((-1, 2), (-4, -2), stroke: (paint: blue, thickness: 1.5pt))
      line((1, 2), (4, -2), stroke: (paint: blue, thickness: 1.5pt))
      
      // Quả cầu bên trong
      cetz.draw.circle((0, 0), radius: 2, stroke: (paint: rgb("FFB300"), thickness: 1.5pt), fill: rgb("FFB300").lighten(80%))
      // Xích đạo quả cầu
      arc((2, 0), start: 0deg, stop: 180deg, radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 1pt, dash: "dashed"))
      arc((-2, 0), start: 180deg, stop: 360deg, radius: (2, 0.6), stroke: (paint: rgb("FFB300"), thickness: 1pt))
      
      // Trục
      line((0, 2.5), (0, -2.5), stroke: (paint: gray, dash: "dashed"))
      circle((0, 0), radius: 0.1, fill: black)
      content((0.4, 0.3), [$O$])
    })
  ]
)

=== Dạng 16: Sự tiếp xúc góc tường của hai Mặt cầu (Hình học Oxyz)

#tln(
  [Trong một góc căn phòng (tương ứng với gốc tọa độ $O$ và ba bức tường là các mặt phẳng tọa độ $O x y, O y z, O z x$), người ta đặt hai quả bóng hình cầu. Quả bóng nhỏ $(S_1)$ có tâm $I(1; 1; 1)$ và tiếp xúc với cả ba bức tường. Quả bóng lớn $(S_2)$ tâm $J$ cũng tiếp xúc với cả ba bức tường và đồng thời tiếp xúc ngoài với $(S_1)$. Tính bán kính của quả bóng lớn $(S_2)$ (làm tròn kết quả đến 1 chữ số thập phân).],
  [$3","7$],
  loigiai: [
    #step[Mặt cầu $(S_1)$ tâm $I(1; 1; 1)$ tiếp xúc 3 mặt toạ độ nên bán kính $R_1 = 1$.]
    #step[Mặt cầu $(S_2)$ tâm $J$ tiếp xúc 3 mặt toạ độ tại góc phần tám thứ nhất nên $J(R; R; R)$ với bán kính $R > 1$.]
    #step[Khoảng cách hai tâm: $I J = sqrt((R-1)^2 + (R-1)^2 + (R-1)^2) = sqrt(3)(R - 1)$.]
    #step[Hai quả bóng tiếp xúc ngoài: $I J = R_1 + R <=> sqrt(3)(R - 1) = 1 + R <=> R(sqrt(3) - 1) = sqrt(3) + 1$.]
    #step[Suy ra $R = (sqrt(3) + 1)/(sqrt(3) - 1) = 2 + sqrt(3) approx 3,732$. Làm tròn 1 chữ số thập phân là $3,7$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Trục Oxyz 3D isometric
      line((0, 0), (-2, -1.5), mark: (end: ">"), stroke: gray, name: "x")
      line((0, 0), (3, 0), mark: (end: ">"), stroke: gray, name: "y")
      line((0, 0), (0, 3.5), mark: (end: ">"), stroke: gray, name: "z")
      content((-2.2, -1.5), [$x$])
      content((3.2, 0), [$y$])
      content((0, 3.7), [$z$])
      content((-0.2, -0.3), [$O$])
      
      // Bóng nhỏ
      cetz.draw.circle((-0.3, 0.4), radius: 0.4, stroke: rgb("2196F3"), fill: rgb("2196F3").lighten(70%))
      arc((-0.3+0.4, 0.4), start: 0deg, stop: 180deg, radius: (0.4, 0.12), stroke: (paint: rgb("2196F3"), dash: "dashed"))
      arc((-0.3-0.4, 0.4), start: 180deg, stop: 360deg, radius: (0.4, 0.12), stroke: rgb("2196F3"))
      circle((-0.3, 0.4), radius: 0.05, fill: black)
      content((-0.3, 0.7), [$I$])
      
      // Bóng lớn
      cetz.draw.circle((0.7, 1.8), radius: 1.2, stroke: rgb("F44336"), fill: rgb("F44336").lighten(70%))
      arc((0.7+1.2, 1.8), start: 0deg, stop: 180deg, radius: (1.2, 0.36), stroke: (paint: rgb("F44336"), dash: "dashed"))
      arc((0.7-1.2, 1.8), start: 180deg, stop: 360deg, radius: (1.2, 0.36), stroke: rgb("F44336"))
      circle((0.7, 1.8), radius: 0.05, fill: black)
      content((0.7, 2.1), [$J$])
      
      // Đường nối tâm
      line((-0.3, 0.4), (0.7, 1.8), stroke: (paint: black, dash: "dashed"))
    })
  ]
)

=== Dạng 17: Khối Trụ lọt thỏm trong Khối Nón (Max-Min Thể tích)

#tln(
  [Một khối nón thủy tinh có bán kính đáy $R=3$, chiều cao $h=4$. Người ta muốn đặt một khối trụ vào bên trong khối nón đó sao cho đáy dưới của khối trụ nằm khít trên mặt đáy của khối nón, và đường tròn viền của mặt đáy trên khối trụ tiếp xúc với mặt xung quanh của khối nón. Tìm thể tích lớn nhất có thể đạt được của khối trụ này (làm tròn kết quả đến 1 chữ số thập phân).],
  [$16","8$],
  loigiai: [
    #step[Gọi $r$ và $x$ lần lượt là bán kính đáy và chiều cao trụ ($0 < r < 3, 0 < x < 4$).]
    #step[Theo định lý Talet trong tam giác mặt cắt: $x/h = (R - r)/R <=> x/4 = (3 - r)/3 => x = 4/3(3 - r)$.]
    #step[Thể tích khối trụ: $V(r) = pi r^2 x = 4/3 pi (3r^2 - r^3)$.]
    #step[Khảo sát hàm $f(r) = 3r^2 - r^3$: $f'(r) = 6r - 3r^2 = 0 => r = 2$.]
    #step[Thể tích cực đại: $V_max = 4/3 pi (3*4 - 8) = 16/3 pi approx 16,755$. Làm tròn 1 chữ số thập phân là $16,8$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      // Nón
      arc((3, -2), start: 0deg, stop: 180deg, radius: (3, 0.8), stroke: (paint: gray, dash: "dashed"))
      arc((-3, -2), start: 180deg, stop: 360deg, radius: (3, 0.8), stroke: gray)
      line((-3, -2), (0, 3), stroke: gray)
      line((3, -2), (0, 3), stroke: gray)
      
      // Trụ (r=2, h=4/3) -> tọa độ y từ -2 đến -0.667
      // Đáy dưới trụ
      arc((2, -2), start: 0deg, stop: 180deg, radius: (2, 0.533), stroke: (paint: green, dash: "dashed"))
      arc((-2, -2), start: 180deg, stop: 360deg, radius: (2, 0.533), stroke: green)
      
      // Đáy trên trụ
      arc((2, -0.667), start: 0deg, stop: 180deg, radius: (2, 0.533), stroke: (paint: green, dash: "dashed"))
      arc((-2, -0.667), start: 180deg, stop: 360deg, radius: (2, 0.533), stroke: green)
      
      // Cạnh bên trụ
      line((-2, -2), (-2, -0.667), stroke: green)
      line((2, -2), (2, -0.667), stroke: green)
      
      // Trục
      line((0, -2.5), (0, 3.5), stroke: (paint: gray, dash: "dashed"))
    })
  ]
)
"""

if pos != -1:
    content = content[:pos] + new_content
    with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'w', encoding='utf-8') as f:
        f.write(content)
    print("Replaced Dạng 13, 14, 15 and appended 16, 17.")
else:
    print("Dạng 13 not found.")
