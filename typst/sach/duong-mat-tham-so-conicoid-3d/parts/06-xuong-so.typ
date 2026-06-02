#import "@preview/cetz:0.5.2": canvas, draw
#import "../_theme.typ": *

= CHƯƠNG V — XƯỞNG ỨNG DỤNG SỐ VÀ CÔNG NGHỆ HIỆN ĐẠI

Toán học không sinh ra trong các tháp ngà của lý thuyết thuần túy. Những nét vẽ của đường cong tham số, những phép cuộn xoắn của mặt tham số, và các phép tính tích có hướng mà bạn vừa học ở các chương trước chính là "linh hồn" ẩn giấu sau những công nghệ định hình thế giới hiện đại.

Trong chương này, chúng ta sẽ bước vào một "xưởng thực hành kỹ thuật" để tận mắt chứng kiến cách toán học không gian biến thành mã lệnh điều khiển máy in 3D, lập trình robot tự động hóa, điều phối quỹ đạo vệ tinh GPS, và cách bạn tự tay vẽ các mặt cong này bằng code Python.

== 1. Thuật Toán Cắt Lớp 3D (3D Slicing) Trong Công Nghệ In 3D

=== A. Từ mô hình 3D rỗng đến các sợi nhựa 2D xếp chồng
Khi ta tải một file mô hình 3D (thường ở định dạng `.STL`) trên mạng về để chuẩn bị in 3D, mô hình đó thực chất chỉ là một "vỏ lưới" rỗng được dệt nên từ hàng triệu tam giác nhỏ (gọi là lưới đa giác - Polygon Mesh). Máy in 3D (đặc biệt là công nghệ in đùn nhựa FDM) không thể tự nhiên "đúc" ra khối 3D này ngay lập tức. Nó bắt buộc phải làm việc theo nguyên lý cộng dồn: *chia nhỏ vật thể 3D thành hàng trăm lớp cắt phẳng nằm ngang (layers)* có độ dày siêu mỏng (từ 0.1 mm đến 0.2 mm).

Mỗi lớp in thứ $i$ ở cao độ $z = z_i$ thực chất là một đường cong tham số 2D được vẽ ra bởi đầu đùn nhựa nóng chảy di chuyển trên mặt bàn in nằm ngang. Nhiệm vụ của phần mềm cắt lớp (Slicer như Cura, PrusaSlicer) là tính toán giao tuyến của mặt phẳng $z = z_i$ với toàn bộ bề mặt vật thể.

=== B. Toán học đằng sau phép giao cắt lưới tam giác
Lưới tam giác của mô hình chứa thông tin tọa độ của các đỉnh tam giác. Xét một tam giác $T$ có 3 đỉnh trong không gian: $A(x_A, y_A, z_A)$, $B(x_B, y_B, z_B)$, $C(x_C, y_C, z_C)$.
Khi mặt phẳng cắt ngang $z = z_0$ đi qua, phần mềm cần xác định xem mặt phẳng này có cắt qua tam giác $T$ hay không, và nếu cắt thì giao tuyến là đoạn thẳng nào.

#tech-box[
  *Thuật toán nội suy tuyến tính tìm giao điểm:*
  
  1. *Điều kiện cắt:* Mặt phẳng $z = z_0$ cắt qua cạnh $A B$ của tam giác khi và chỉ khi cao độ $z_0$ nằm kẹp giữa cao độ của hai đỉnh $A$ và $B$:
     $ (z_A - z_0) dot (z_B - z_0) <= 0 $
  
  2. *Tìm tọa độ giao điểm $P$ trên cạnh $A B$:*
     Vectơ chỉ phương của cạnh $A B$ là $vec(A B) = (x_B - x_A, y_B - y_A, z_B - z_A)$.
     Phương trình tham số của đường thẳng chứa cạnh $A B$ theo tham số $t in [0, 1]$ là:
     $ cases(
       x(t) = x_A + t(x_B - x_A),
       y(t) = y_A + t(y_B - y_A),
       z(t) = z_A + t(z_B - z_A)
     ) $
     Tại giao điểm $P$, cao độ của $P$ phải bằng $z_0$:
     $ z_A + t(z_B - z_A) = z_0 => t = (z_0 - z_A) / (z_B - z_A) $
     Thế giá trị $t$ tìm được ngược lại vào phương trình tham số, ta được tọa độ của giao điểm $P(x_P, y_P, z_0)$:
     $ x_P = x_A + (z_0 - z_A) / (z_B - z_A) (x_B - x_A) $
     $ y_P = y_A + (z_0 - z_A) / (z_B - z_A) (y_B - y_A) $
]

Bằng cách tìm giao điểm trên các cạnh của các tam giác bị cắt, phần mềm nối các điểm giao lại theo thứ tự tuần hoàn để tạo thành một đường cong kín (đường biên thiết diện). Đường cong này được biểu diễn dưới dạng một chuỗi tọa độ rời rạc $M_1, M_2, ..., M_n$.

=== C. Dịch chuyển sang mã G-code của máy in
Sau khi tìm được chuỗi tọa độ $M_i(x_i, y_i, z_0)$, phần mềm sẽ chuyển đổi chuỗi này thành các dòng mã lệnh *G-code* (ngôn ngữ điều khiển số tiêu chuẩn) gửi tới vi điều khiển của máy in:
- `G0 X[x_0] Y[y_0] Z[z_0]` : Di chuyển nhanh đầu phun đến điểm xuất phát (chưa đùn nhựa).
- `G1 X[x_1] Y[y_1] E[e_1] F[tốc_độ]` : Di chuyển đầu phun từ điểm hiện tại đến điểm $(x_1, y_1)$ với tốc độ cho trước, đồng thời động cơ bước đùn nhựa sẽ quay để ép ra một lượng nhựa $e_1$ tỉ lệ với chiều dài đoạn đường đi $d = sqrt((x_1 - x_0)^2 + (y_1 - y_0)^2)$.

#vd-box("Ví dụ thực tế", "Lập trình G-code cho lớp in của quả cầu rỗng")[
  Một quả cầu rỗng bằng nhựa có phương trình bề mặt ngoại quan là: $x^2 + y^2 + z^2 = 25$ (đơn vị: mm). Máy in cần đùn một đường nhựa biên ngoài ở lớp cắt nằm ngang có cao độ $z_0 = 3$ mm.
  1. Xác định phương trình đường cong thiết diện ở lớp in này.
  2. Viết 4 dòng lệnh G-code biểu diễn 4 điểm chia góc $0^degree$, $90^degree$, $180^degree$, $270^degree$ của đường in tròn này (giả sử lượng nhựa đùn lũy kế tăng thêm 1.5 mm sau mỗi góc $90^degree$, tốc độ di chuyển là $1200$ mm/phút).
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:* 
    Thế $z_0 = 3$ vào phương trình quả cầu:
    $ x^2 + y^2 + 3^2 = 25 <=> x^2 + y^2 = 16 $
    Vậy thiết diện thu được ở lớp cắt $z_0 = 3$ là một đường tròn nằm ngang có bán kính $R' = sqrt(16) = 4$ mm.
    Phương trình tham số của đường di chuyển của đầu phun là:
    $ cases(
      x = 4 cos t,
      y = 4 sin t,
      z = 3
    ) quad (t in [0, 2 pi]) $
  - *Câu 2:* 
    Tính tọa độ của đầu phun tại 4 giá trị tham số góc:
    - Góc $0^degree$ ($t = 0$): $M_0(4, 0, 3)$.
    - Góc $90^degree$ ($t = pi/2$): $M_1(0, 4, 3)$.
    - Góc $180^degree$ ($t = pi$): $M_2(-4, 0, 3)$.
    - Góc $270^degree$ ($t = 3 pi / 2$): $M_3(0, -4, 3)$.
    - Góc $360^degree$ quay lại điểm đầu: $M_4(4, 0, 3)$.
    Chuỗi lệnh G-code tương ứng sẽ là:
    ```gcode
    G0 X4.00 Y0.00 Z3.00 ; Di chuyển đến điểm xuất phát M0
    G1 X0.00 Y4.00 E1.50 F1200 ; Vẽ góc 90 độ đến M1, đùn nhựa 1.5mm
    G1 X-4.00 Y0.00 E3.00 ; Vẽ góc 180 độ đến M2, đùn nhựa lũy kế 3.0mm
    G1 X0.00 Y-4.00 E4.50 ; Vẽ góc 270 độ đến M3, đùn nhựa lũy kế 4.5mm
    G1 X4.00 Y0.00 E6.00 ; Quay về M4 khép kín đường tròn, đùn nhựa lũy kế 6.0mm
    ```
]

== 2. Thiết Kế Quỹ Đạo Chuyển Động Trơn Cho Cánh Tay Robot Bằng Bézier

=== A. Hiểm họa cơ học mang tên "Lực Giật" (Jerk)
Trong công nghiệp lắp ráp linh kiện bán dẫn hoặc sản xuất ô tô, các cánh tay robot phải di chuyển liên tục từ vị trí này sang vị trí khác. Nếu ta lập trình cho robot di chuyển theo đường thẳng nối hai điểm $A$ và $B$ với vận tốc không đổi, chuyện gì sẽ xảy ra?
Tại thời điểm xuất phát, robot đang đứng yên (vận tốc bằng 0) lập tức nhảy vọt lên vận tốc thiết kế. Điều này yêu cầu một gia tốc gần như vô hạn trong thời gian vô cùng ngắn. Đạo hàm của gia tốc theo thời gian được gọi là *Lực giật (Jerk)*:
$ vec(j)(t) = (d vec(a)) / (d t) = vec(r)'''(t) $

Jerk quá lớn giống như việc bạn đột ngột đạp lút ga hoặc phanh gấp trên xe hơi. Lực giật cơ học này sẽ sinh ra các cú va đập mạnh làm rung lắc cánh tay robot, gây lệch vị trí lắp ráp chính xác, và quan trọng nhất là làm mài mòn, gãy vỡ các bánh răng kim loại trong hộp số động cơ servo vô cùng nhanh chóng.

=== B. Giải pháp êm ái từ đường cong Bézier bậc 3
Để triệt tiêu Jerk ở hai đầu hành trình, các kỹ sư tự động hóa thiết lập quỹ đạo di chuyển của các khớp robot theo đường cong Bézier bậc 3.

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    
    // Các điểm kiểm soát
    let p0 = (0, 0)
    let p1 = (1, 3)
    let p2 = (4, 3)
    let p3 = (5, 0.5)
    
    // Vẽ đa giác kiểm soát
    line(p0, p1, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(p1, p2, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    line(p2, p3, stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
    
    circle(p0, radius: 2.5pt, fill: rgb("#0F172A"))
    circle(p1, radius: 2.5pt, fill: rgb("#64748B"))
    circle(p2, radius: 2.5pt, fill: rgb("#64748B"))
    circle(p3, radius: 2.5pt, fill: rgb("#0F172A"))
    
    content((p0.at(0) - 0.4, p0.at(1)), $P_0$)
    content((p1.at(0) - 0.3, p1.at(1) + 0.3), $P_1$)
    content((p2.at(0) + 0.3, p2.at(1) + 0.3), $P_2$)
    content((p3.at(0) + 0.4, p3.at(1)), $P_3$)
    
    // Vẽ đường cong Bézier bậc 3
    let get-bezier(t) = {
      let x = (1-t)*(1-t)*(1-t)*p0.at(0) + 3*t*(1-t)*(1-t)*p1.at(0) + 3*t*t*(1-t)*p2.at(0) + t*t*t*p3.at(0)
      let y = (1-t)*(1-t)*(1-t)*p0.at(1) + 3*t*(1-t)*(1-t)*p1.at(1) + 3*t*t*(1-t)*p2.at(1) + t*t*t*p3.at(1)
      return (x, y)
    }
    
    let pts = ()
    for i in range(0, 21) {
      pts.push(get-bezier(i * 0.05))
    }
    for i in range(0, 20) {
      line(pts.at(i), pts.at(i+1), stroke: 1.5pt + rgb("#7C3AED"))
    }
    
    // Vẽ vật cản (vùng cảnh báo)
    circle((2.2, 1.0), radius: 0.6, stroke: 1.0pt + rgb("#BE123C"), fill: rgb("#FEE2E2"))
    content((2.2, 1.0), text(size: 7.5pt, fill: rgb("#BE123C"))[Vật cản])
    
    content((2.5, -0.7), text(size: 8.5pt, style: "italic")[Quỹ đạo Bézier bậc 3 giúp robot lách qua vật cản trơn tru])
  })
]

Xét đường cong Bézier bậc 3 với 4 điểm kiểm soát $vec(P)_0$, $vec(P)_1$, $vec(P)_2$, $vec(P)_3$:
$ vec(r)(t) = (1-t)^3 vec(P)_0 + 3t(1-t)^2 vec(P)_1 + 3t^2(1-t) vec(P)_2 + t^3 vec(P)_3 $
Lấy đạo hàm theo thời gian $t$:
- *Độ dời vị trí:* $vec(r)(t)$ là đa thức bậc 3.
- *Vận tốc:* $vec(v)(t) = vec(r)'(t) = 3(1-t)^2(vec(P)_1 - vec(P)_0) + 6t(1-t)(vec(P)_2 - vec(P)_1) + 3t^2(vec(P)_3 - vec(P)_2)$
- *Gia tốc:* $vec(a)(t) = vec(r)''(t) = 6(1-t)(vec(P)_2 - 2vec(P)_1 + vec(P)_0) + 6t(vec(P)_3 - 2vec(P)_2 + vec(P)_1)$
- *Lực giật Jerk:* $vec(j)(t) = vec(r)'''(t) = 6(vec(P)_3 - 3vec(P)_2 + 3vec(P)_1 - vec(P)_0)$

Nhìn vào công thức ta thấy điều kỳ diệu: Lực giật $vec(j)(t)$ lúc này là một hằng số không đổi trên toàn bộ quỹ đạo! Nó không hề bị nhảy vọt đột ngột hay tiến tới vô hạn tại bất kỳ thời điểm nào. Hơn thế nữa:
- Tại thời điểm bắt đầu $t=0$: Gia tốc là $vec(a)(0) = 6(vec(P)_2 - 2vec(P)_1 + vec(P)_0)$. Nếu ta chọn $vec(P)_1$ và $vec(P)_2$ sao cho $vec(P)_2 - 2vec(P)_1 + vec(P)_0 = vec(0)$, gia tốc khởi động sẽ bằng 0 tuyệt đối!
- Vận tốc tại $t=0$ song song với hướng nối $vec(P)_0 vec(P)_1$, vận tốc tại $t=1$ song song với hướng nối $vec(P)_2 vec(P)_3$. Điều này giúp kỹ sư dễ dàng kiểm soát hướng tiếp cận của robot khi gắp linh kiện.

#vd-box("Ví dụ thực tế", "Lập trình khớp xoay robot triệt tiêu gia tốc đầu và cuối")[
  Một cánh tay robot cần di chuyển từ điểm xuất phát $A(0, 0, 0)$ đến điểm đích $B(6, 6, 6)$ bằng đường cong Bézier bậc 3. Kỹ sư muốn thiết kế quỹ đạo sao cho:
  - Gia tốc ban đầu tại $t = 0$ bằng $vec(0)$.
  - Gia tốc kết thúc tại $t = 1$ bằng $vec(0)$.
  1. Xác định tọa độ của hai điểm kiểm soát trung gian $vec(P)_1$ và $vec(P)_2$.
  2. Viết phương trình tham số quỹ đạo $vec(r)(t)$ tương ứng.
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    Gọi 4 điểm kiểm soát là $vec(P)_0 = A(0, 0, 0)$, $vec(P)_1(x_1, y_1, z_1)$, $vec(P)_2(x_2, y_2, z_2)$, và $vec(P)_3 = B(6, 6, 6)$.
    - Điều kiện gia tốc ban đầu bằng 0:
      $ vec(a)(0) = vec(0) <=> 6(vec(P)_2 - 2vec(P)_1 + vec(P)_0) = vec(0) <=> vec(P)_2 - 2vec(P)_1 + vec(0) = vec(0) <=> vec(P)_2 = 2vec(P)_1 $
    - Điều kiện gia tốc kết thúc bằng 0:
      $ vec(a)(1) = vec(0) <=> 6(vec(P)_3 - 2vec(P)_2 + vec(P)_1) = vec(0) <=> vec(P)_3 - 2vec(P)_2 + vec(P)_1 = vec(0) $
      Thế $vec(P)_2 = 2vec(P)_1$ vào phương trình trên:
      $ vec(P)_3 - 2(2vec(P)_1) + vec(P)_1 = vec(0) <=> vec(P)_3 - 3vec(P)_1 = vec(0) <=> vec(P)_1 = 1/3 vec(P)_3 $
      Thế tọa độ của $vec(P)_3 = (6, 6, 6)$ vào:
      $ vec(P)_1 = (2, 2, 2) $
      Từ đó suy ra tọa độ của $vec(P)_2$:
      $ vec(P)_2 = 2vec(P)_1 = (4, 4, 4) $
    Vậy tọa độ hai điểm kiểm soát cần tìm là $vec(P)_1(2, 2, 2)$ và $vec(P)_2(4, 4, 4)$.
  
  - *Câu 2:*
    Thế các điểm kiểm soát vào phương trình Bézier bậc 3:
    $ vec(r)(t) = (1-t)^3 (0, 0, 0) + 3t(1-t)^2 (2, 2, 2) + 3t^2(1-t) (4, 4, 4) + t^3 (6, 6, 6) $
    Tính toán cho từng tọa độ:
    $ x(t) = 6t(1-t)^2 + 12t^2(1-t) + 6t^3 = 6t(1 - 2t + t^2) + 12t^2 - 12t^3 + 6t^3 $
    $ x(t) = 6t - 12t^2 + 6t^3 + 12t^2 - 6t^3 = 6t $
    Tương tự: $y(t) = 6t$ và $z(t) = 6t$.
    - *Nhận xét bất ngờ:* Quỹ đạo thực tế của robot thu được vẫn là một đường thẳng đi từ $(0,0,0)$ đến $(6,6,6)$! Tuy nhiên, quy luật thời gian đã thay đổi: thay vì đi đều, robot sẽ tăng tốc từ từ từ trạng thái đứng yên, đạt vận tốc cực đại ở giữa hành trình ($t=0.5$), sau đó giảm tốc độ êm ái và dừng hẳn tại đích mà không hề có rung lắc cơ học (gia tốc hai đầu bằng 0). Đây chính là vẻ đẹp của việc làm chủ tham số thời gian!
]

== 3. Quỹ Đạo Kepler của Vệ Tinh GPS – Đường Tham Số Giữa Các Vì Sao

Làm thế nào điện thoại của chúng ta trong túi quần có thể định vị chính xác vị trí của mình đến từng mét? Quá trình này dựa trên việc đo thời gian phát tín hiệu của ít nhất 4 vệ tinh GPS đang bay quanh Trái Đất ở độ cao khoảng 20,200 km.
Để tính toán khoảng cách, điện thoại bắt buộc phải biết chính xác tọa độ của vệ tinh trong không gian 3D tại thời điểm phát sóng. Trọng lực của Trái Đất khóa các vệ tinh này vào những *quỹ đạo elip tham số Kepler* tuần hoàn.

=== A. Bước 1: Tính tọa độ phẳng trên mặt phẳng quỹ đạo
Trong hệ tọa độ 2D của riêng mặt phẳng quỹ đạo của vệ tinh (với gốc tọa độ đặt tại tâm Trái Đất - một tiêu điểm của elip), tọa độ của vệ tinh được tham số hóa theo *góc lệch tâm $E$* như sau:
$ cases(
  x_0 = a(cos E - e),
  y_0 = a sqrt(1 - e^2) sin E,
  z_0 = 0
) $
Trong đó $a$ là bán trục lớn của elip quỹ đạo, $e$ là độ lệch tâm (đo độ dẹt của elip). Góc lệch tâm $E(t)$ tại thời điểm $t$ được giải từ phương trình siêu việt Kepler:
$ E - e sin E = M(t) $
với $M(t) = n(t - t_0)$ là góc lệch trung bình tăng tuyến tính theo thời gian.

=== B. Bước 2: Nhấc tọa độ 2D lên không gian 3D bằng ma trận xoay
Mặt phẳng quỹ đạo của vệ tinh không trùng với mặt phẳng xích đạo $O x y$ của Trái Đất mà nghiêng một góc $i$, và có các góc định vị kinh tuyến. Để chuyển tọa độ phẳng $(x_0, y_0, 0)$ về hệ tọa độ 3D toàn cầu của Trái Đất (ECEF), bộ vi xử lý thực hiện 3 phép xoay liên tiếp (xoay Euler) thông qua các ma trận xoay 3D:

#tech-box[
  *Các phép xoay tọa độ 3D cơ bản:*
  
  1. *Xoay quanh trục $z$ một góc $theta$:*
     $ R_z(theta) = mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1) $
  
  2. *Xoay quanh trục $x$ một góc $alpha$:*
     $ R_x(alpha) = mat(1, 0, 0; 0, cos alpha, -sin alpha; 0, sin alpha, cos alpha) $
]

Công thức đồng bộ hóa tọa độ 3D toàn cầu là:
$ mat(x; y; z) = R_z (-Omega) dot R_x (-i) dot R_z (-omega) dot mat(x_0; y_0; 0) $
Trong đó:
- $Omega$ là kinh độ của điểm nút lên (góc xoay quanh trục đứng $z$ của Trái Đất).
- $i$ là góc nghiêng của mặt phẳng quỹ đạo so với mặt phẳng xích đạo (xoay quanh trục ngang $x$).
- $omega$ là góc cận điểm quỹ đạo (định vị hướng elip trong mặt phẳng quỹ đạo).

Phép nhân ma trận này thực chất là một tổ hợp tuyến tính các hàm lượng giác giúp biến đổi một đường cong phẳng elip 2D đơn giản thành một đường cong 3D phức tạp quấn quanh Trái Đất, giúp định vị chính xác vị trí của loài người trên hành tinh.

#vd-box("Ví dụ thực tế", "Tính tọa độ 3D của vệ tinh từ phép xoay ma trận nghiêng")[
  Một vệ tinh GPS có bán trục lớn quỹ đạo $a = 26560$ km, độ lệch tâm $e = 0.02$. Tại một thời điểm, góc lệch tâm tính được là $E = 60^degree$. Mặt phẳng quỹ đạo của vệ tinh có góc nghiêng $i = 60^degree$ so với xích đạo, các góc khác tạm thời bằng $0$.
  1. Tính tọa độ 2D phẳng của vệ tinh trong mặt phẳng quỹ đạo của nó.
  2. Tính tọa độ 3D của vệ tinh trong hệ trục toàn cầu Oxyz sau phép xoay nghiêng $i$ quanh trục $x$:
     $ mat(x; y; z) = R_x (-i) dot mat(x_0; y_0; z_0) $
  
  #v(0.4em)
  *Giải chi tiết:*
  
  - *Câu 1:*
    Thế các giá trị vào phương trình tọa độ phẳng Kepler (với $cos 60^degree = 0.5, sin 60^degree = sqrt(3)/2$):
    $ x_0 = 26560 dot (cos 60^degree - 0.02) = 26560 dot (0.5 - 0.02) = 26560 dot 0.48 = 12748.8 " (km)" $
    $ y_0 = 26560 dot sqrt(1 - 0.02^2) sin 60^degree = 26560 dot sqrt(0.9996) dot sqrt(3)/2 approx 26560 dot 0.9998 dot 0.8660 approx 22993.4 " (km)" $
    $ z_0 = 0 $
    Vậy tọa độ phẳng của vệ tinh là $M_0(12748.8, 22993.4, 0)$ km.
  
  - *Câu 2:*
    Áp dụng phép xoay quanh trục $x$ với góc $-i = -60^degree$ (ta có $cos(-60^degree) = 0.5$, $sin(-60^degree) = -sqrt(3)/2$):
    $ mat(x; y; z) = mat(1, 0, 0; 0, cos(-60^degree), -sin(-60^degree); 0, sin(-60^degree), cos(-60^degree)) dot mat(12748.8; 22993.4; 0) $
    $ mat(x; y; z) = mat(1, 0, 0; 0, 0.5, sqrt(3)/2; 0, -sqrt(3)/2, 0.5) dot mat(12748.8; 22993.4; 0) $
    Nhân dòng với cột ma trận:
    $ x = 1 dot 12748.8 + 0 dot 22993.4 + 0 dot 0 = 12748.8 " (km)" $
    $ y = 0.5 dot 22993.4 + (sqrt(3)/2) dot 0 = 11496.7 " (km)" $
    $ z = -sqrt(3)/2 dot 22993.4 + 0.5 dot 0 approx -0.8660 dot 22993.4  approx  -19912.3 " (km)" $
    Tọa độ 3D toàn cầu của vệ tinh GPS là $M(12748.8, 11496.7, -19912.3)$ km.
]

== 4. Xưởng Thực Hành Số: Vẽ Đường và Mặt Cong 3D Bằng Code Python

Để giúp các bạn học sinh có thể trực quan hóa những phương trình toán học khô khan này, đây là đoạn mã nguồn Python hoàn chỉnh sử dụng thư viện đồ họa quốc tế *Matplotlib*. Các bạn chỉ cần cài đặt thư viện (`pip install matplotlib numpy`) và chạy script này để tự tay xoay, zoom và chiêm ngưỡng các mặt cong 3D kỳ vĩ như mặt bánh Donut hay dải Möbius một phía.

#workshop-box("Lập trình vẽ mặt Torus (Bánh Donut) 3D", [
  ```python
  import numpy as np
  import matplotlib.pyplot as plt
  from mpl_toolkits.mplot3d import Axes3D

  # Bước 1: Thiết lập lưới tham số u, v
  u = np.linspace(0, 2 * np.pi, 100)
  v = np.linspace(0, 2 * np.pi, 100)
  u, v = np.meshgrid(u, v)

  # Bước 2: Định nghĩa các hằng số bán kính
  R = 4.0  # Bán kính vòng ngoài
  r = 1.5  # Bán kính ruột bánh

  # Bước 3: Áp dụng phương trình tham số mặt Torus
  x = (R + r * np.cos(u)) * np.cos(v)
  y = (R + r * np.cos(u)) * np.sin(v)
  z = r * np.sin(u)

  # Bước 4: Khởi tạo đồ thị 3D và vẽ bề mặt
  fig = plt.figure(figsize=(8, 6))
  ax = fig.add_subplot(111, projection='3d')
  
  # Vẽ mặt cong với dải màu sắc sinh động (colormap 'viridis')
  surf = ax.plot_surface(x, y, z, cmap='viridis', edgecolor='none', alpha=0.9)

  # Thiết lập tiêu đề và nhãn các trục
  ax.set_title("Mo hinh 3D mat Torus (Donut) tu Phuong trinh tham so")
  ax.set_xlabel("Truc X")
  ax.set_ylabel("Truc Y")
  ax.set_zlabel("Truc Z")

  # Giữ tỉ lệ các trục đều nhau để không bị méo hình
  ax.set_aspect('equal')
  plt.colorbar(surf, ax=ax, shrink=0.5, aspect=5)
  plt.show()
  ```
])

#open-q[
  Dựa trên đoạn mã vẽ mặt Torus ở trên, hãy sửa lại phần công thức tọa độ `x, y, z` ở Bước 3 để vẽ mặt cong *Möbius strip* một phía với các khoảng chạy tham số tương ứng $u in [0, 2 pi]$ và $v in [-1, 1]$. Hãy quan sát trực quan sự kỳ lạ của biên dải Möbius trên đồ thị 3D của bạn.
]
