# coding=utf-8
import re

with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the fig part of Dạng 19
# We'll use regex to replace everything between `fig: align(center)[` and the end of the Dạng 19 block `)`
pattern_19 = re.compile(r'(=== Dạng 19: Chế tác Nhẫn cưới "Comfort Fit".*?fig: align\(center\)\[)(.*?)(]\n\))', re.DOTALL)
new_fig_19 = """
    #cetz.canvas({
      import cetz.draw: *
      
      let draw_ellipse_x(x_coord, r, color, dashed_back: true) = {
        let rx = 0.3 * r
        if dashed_back {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        } else {
          arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
        }
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 1.5pt))
      }
      
      // Trục trung tâm ngón tay
      line((-5, 0), (5, 0), stroke: (paint: gray, dash: "dashed"), mark: (end: ">"))
      content((4.8, 0.8), [$x$])
      
      // Viền nhẫn ngoài 
      let out_top = range(-20, 21).map(x => { let h = x/10; return (h, 9 + calc.sqrt(4 - h*h)) })
      let out_bot = range(-20, 21).map(x => { let h = x/10; return (h, -(9 + calc.sqrt(4 - h*h))) })
      line(..out_top, stroke: (paint: rgb("FF8F00"), thickness: 2pt))
      line(..out_bot, stroke: (paint: rgb("FF8F00"), thickness: 2pt))
      
      // Lổ nhẫn (cylinder bên trong)
      line((-2, 9), (2, 9), stroke: (paint: rgb("FBC02D"), thickness: 1.5pt))
      line((-2, -9), (2, -9), stroke: (paint: rgb("FBC02D"), thickness: 1.5pt, dash: "dashed"))
      
      // Các elip 3D
      // Mặt cắt bên trái (x = -2)
      draw_ellipse_x(-2, 9, rgb("F57F17"), dashed_back: true)
      // Khúc phình to nhất (x = 0)
      draw_ellipse_x(0, 11, rgb("FFE082"), dashed_back: true)
      // Mặt cắt bên phải (x = 2) - Nét liền toàn bộ để lộ rõ lổ nhẫn
      draw_ellipse_x(2, 9, rgb("F57F17"), dashed_back: false)
      
      content((0, 12.5), [Khối nhẫn Vàng 3D])
    })
  """
if pattern_19.search(content):
    content = pattern_19.sub(r'\1' + new_fig_19 + r'\3', content)
else:
    print("Failed to replace Dạng 19 fig")

# Append Dạng 20 & 21
content += """
=== Dạng 20: Mái vòm nhà kính (Mô hình Paraboloid và Bán cầu)

#tln(
  [Một công trình nhà kính sinh thái có dạng khối tròn xoay. Phần mái vòm phía trên là một chỏm cầu bán kính $R=5$ m. Phần thân bên dưới là một mặt Paraboloid (tạo bởi Parabol quay quanh trục đối xứng thẳng đứng). Đáy của nhà kính nằm trên mặt đất là một hình tròn bán kính $r=7$ m. Biết phần mái cầu và phần thân Paraboloid được ghép nối "trơn mượt" với nhau (có tiếp tuyến chung) tại các điểm cách trục đối xứng của nhà kính $3$ m. Tính tổng chiều cao của công trình nhà kính này (đơn vị: mét).],
  [$6$],
  loigiai: [
    #step[Chọn hệ trục tọa độ với $O y$ là trục đối xứng, tâm mặt cầu tại $(0; y_c)$. Phương trình nửa đường tròn mái vòm là $(C): y = y_c + sqrt(25 - x^2)$.]
    #step[Tại điểm ghép $x = 3$, đạo hàm của đường tròn là $y'_C = (-x)/sqrt(25-x^2) = -3/sqrt(25-9) = -3/4$. Tọa độ điểm ghép là $(3; y_c + 4)$.]
    #step[Thân là Parabol $(P): y = a x^2 + c => y'_P = 2a x$. Điều kiện tiếp xúc trơn tại $x = 3$ là $y'_P (3) = y'_C (3) <=> 6a = -3/4 <=> a = -1/8$.]
    #step[Hai đồ thị khớp nhau tại $x = 3 => a(3^2) + c = y_c + 4 <=> -9/8 + c = y_c + 4 <=> c - y_c = 41/8$.]
    #step[Mặt đất có bán kính $x = 7$, tọa độ $y$ tương ứng là $y_"base" = a(7^2) + c = -49/8 + c$. Đỉnh mái vòm tại $x = 0$ có tọa độ $y_"top" = y_c + 5$.]
    #step[Chiều cao công trình: $H = y_"top" - y_"base" = (y_c + 5) - (-49/8 + c) = 5 + 49/8 - (c - y_c) = 89/8 - 41/8 = 48/8 = 6$ (m).]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Mặt đất
      line((-8, -1), (8, -1), stroke: (paint: gray, thickness: 1.5pt))
      
      // Paraboloid
      let p_pts = range(-70, 71).map(x => { let h = x/10; return (h, -0.125 * h * h + 5.125) })
      line(..p_pts, stroke: (paint: green, thickness: 1.5pt))
      
      // Chỏm cầu
      let c_pts = range(-30, 31).map(x => { let h = x/10; return (h, calc.sqrt(25 - h*h)) })
      line(..c_pts, stroke: (paint: blue, thickness: 1.5pt))
      
      // Các nét đứt hiển thị khối 3D
      arc((7, -1), start: 0deg, stop: 180deg, radius: (7, 1.5), stroke: (paint: gray, dash: "dashed"))
      arc((-7, -1), start: 180deg, stop: 360deg, radius: (7, 1.5), stroke: gray)
      
      arc((3, 4), start: 0deg, stop: 180deg, radius: (3, 0.6), stroke: (paint: gray, dash: "dashed"))
      arc((-3, 4), start: 180deg, stop: 360deg, radius: (3, 0.6), stroke: gray)
      
      // Điểm ghép
      circle((3, 4), radius: 0.1, fill: black)
      circle((-3, 4), radius: 0.1, fill: black)
      
      // Trục
      line((0, -1.5), (0, 6), stroke: (paint: gray, dash: "dashed"))
    })
  ]
)

=== Dạng 21: Con quay đồ chơi bằng gỗ (Tích phân ghép trơn trục Ox)

#tln(
  [Một con quay đồ chơi bằng gỗ có hình dạng là một khối tròn xoay được tạo thành khi quay mặt cắt dọc của nó quanh trục $O x$. Nửa trên của mặt cắt (phần thân phình to) là hình phẳng giới hạn bởi trục $O x$ và một cung Parabol $(P): y = a x^2 + b x + c$ (từ $x = 0$ đến $x = 2$). Nửa dưới của mặt cắt (phần mũi nhọn) là giới hạn bởi đoạn thẳng $(d): y = 1/2 x + 2$ (từ $x = -4$ đến $x = 0$). 
  Biết cung Parabol $(P)$ ghép nối "trơn mượt" với đoạn thẳng $(d)$ tại điểm có hoành độ $x = 0$ và cắt trục $O x$ tại $x = 2$. Tính thể tích khối gỗ làm con quay đó (đơn vị: $upright("cm")^3$, làm tròn kết quả đến hàng phần mười).],
  [$33","3$],
  loigiai: [
    #step[Tại điểm ghép $x = 0$: Hàm đoạn thẳng $y_1 = 1/2 x + 2 => y'_1 = 1/2$. Giá trị $y_1(0) = 2, y'_1(0) = 1/2$.]
    #step[Hàm $(P): y_2 = a x^2 + b x + c => y'_2 = 2a x + b$. Điều kiện ghép trơn tại $x = 0$ và cắt $O x$ tại $x = 2$:
    $ cases(y_2(0) = 2, y'_2(0) = 1/2, y_2(2) = 0) <=> cases(c = 2, b = 1/2, 4a + 2b + c = 0) <=> cases(a = -3/4, b = 1/2, c = 2) $]
    #step[Vậy phương trình Parabol là $(P): y_2 = -3/4 x^2 + 1/2 x + 2$. Thể tích con quay gồm 2 phần (khối nón bên trái và khối Paraboloid bên phải):
    $ V = pi integral_(-4)^0 (1/2 x + 2)^2 d x + pi integral_0^2 (-3/4 x^2 + 1/2 x + 2)^2 d x $]
    #step[Tích phân 1 (Khối nón): $V_1 = pi integral_(-4)^0 (1/4 x^2 + 2x + 4) d x = pi (x^3/12 + x^2 + 4x) |_(-4)^0 = 16/3 pi$.]
    #step[Tích phân 2: $V_2 = pi integral_0^2 (9/16 x^4 - 3/4 x^3 - 11/4 x^2 + 2x + 4) d x = pi (9/80 x^5 - 3/16 x^4 - 11/12 x^3 + x^2 + 4x) |_0^2 = 79/15 pi$.]
    #step[Tổng thể tích: $V = 16/3 pi + 79/15 pi = 159/15 pi = 53/5 pi approx 33,3008$. Làm tròn phần mười ta được $33,3$.]
  ],
  fig-pos: "right",
  fig-width: 35%,
  fig: align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Trục toạ độ
      line((-5, 0), (3, 0), mark: (end: ">"), stroke: gray, name: "x")
      line((0, -3), (0, 3), mark: (end: ">"), stroke: gray, name: "y")
      
      // Đường sinh
      // Nón trái
      line((-4, 0), (0, 2), stroke: (paint: rgb("795548"), thickness: 2pt))
      line((-4, 0), (0, -2), stroke: (paint: rgb("795548"), thickness: 2pt))
      
      // Bầu Parabol phải
      let p_pts_top = range(0, 21).map(x => { let h = x/10; return (h, -0.75*h*h + 0.5*h + 2) })
      let p_pts_bot = range(0, 21).map(x => { let h = x/10; return (h, -(-0.75*h*h + 0.5*h + 2)) })
      line(..p_pts_top, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      line(..p_pts_bot, stroke: (paint: rgb("5D4037"), thickness: 2pt))
      
      // Các elip cắt ngang tạo hình khối 3D (xoay quanh trục Ox nên Elip đứng)
      let draw_ellipse_x(x_coord, r, color) = {
        let rx = 0.25 * r
        arc((x_coord, r), start: 90deg, stop: 270deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt, dash: "dashed"))
        arc((x_coord, -r), start: -90deg, stop: 90deg, radius: (rx, r), stroke: (paint: color, thickness: 0.5pt))
      }
      
      draw_ellipse_x(0, 2, rgb("BCAAA4")) // Mép nối lớn nhất
      draw_ellipse_x(1, 1.75, rgb("BCAAA4")) // Tại x=1, r=1.75
      draw_ellipse_x(-2, 1, rgb("BCAAA4")) // Tại x=-2, r=1
      
      // Điểm mút
      circle((-4, 0), radius: 0.05, fill: black)
      circle((2, 0), radius: 0.05, fill: black)
    })
  ]
)
"""

with open('/Users/admin/conictypst/typst/exams/CD-SuTiepXuc.typ', 'w', encoding='utf-8') as f:
    f.write(content)

