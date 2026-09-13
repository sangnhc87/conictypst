#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VI: HÀM SỐ, ĐỒ THỊ VÀ ỨNG DỤNG",
  exam-title: "BÀI 15: HÀM SỐ VÀ ĐỒ THỊ (ĐỀ SỐ 16C - NÂNG CAO & VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "139",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Tập xác định của hàm số $y = sqrt(x + 1) + sqrt(4 - x) / (x - 2)$ là],
    (
        True([$[-1; 4] setminus {2}$]),
        [$[-1; 4]$],
        [$(-1; 4) setminus {2}$],
        [$[-1; 2)$]
    ),
    loigiai: [
        Hàm số xác định khi và chỉ khi:
        $ cases(x + 1 >= 0, 4 - x >= 0, x - 2 != 0) <=> cases(x >= -1, x <= 4, x != 2) <=> cases(-1 <= x <= 4, x != 2) $
        Vậy tập xác định của hàm số là $D = [-1; 4] setminus {2}$.
    ]
)

// TN 2
#tn([Tập xác định của hàm số $y = sqrt((x - 1)^2 (x + 3))$ là],
    (
        True([$[-3; +infinity)$]),
        [$( -infinity; -3]$],
        [$(-3; +infinity)$],
        [$[-3; +infinity) setminus {1}$]
    ),
    loigiai: [
        Hàm số xác định khi biểu thức dưới dấu căn không âm: $(x - 1)^2 (x + 3) >= 0$.
        Vì $(x - 1)^2 >= 0$ với mọi $x in RR$:
        - Nếu $x = 1$ thì $(1 - 1)^2 (1 + 3) = 0 >= 0$ (thỏa mãn).
        - Nếu $x != 1$ thì $(x - 1)^2 > 0$, do đó bất phương trình tương đương $x + 3 >= 0 <=> x >= -3$.
        Kết hợp cả hai trường hợp ta được $x >= -3$. Tập xác định là $D = [-3; +infinity)$.
    ]
)

// TN 3
#tn([Cho hàm số phân nhánh:
$ f(x) = cases(
  x^2 - 1 &text("khi") x >= 0,
  2x - 3 &text("khi") x < 0
) $
Điểm nào sau đây KHÔNG thuộc đồ thị của hàm số đã cho?],
    (
        True([$N(-1; 0)$]),
        [$M(2; 3)$],
        [$P(0; -1)$],
        [$Q(-2; -7)$]
    ),
    loigiai: [
        Kiểm tra tọa độ từng điểm:
        - Với $M(2; 3)$: $x = 2 >= 0 => y = 2^2 - 1 = 3$ (Thuộc).
        - Với $N(-1; 0)$: $x = -1 < 0 => y = 2(-1) - 3 = -5 != 0$ (Không thuộc).
        - Với $P(0; -1)$: $x = 0 >= 0 => y = 0^2 - 1 = -1$ (Thuộc).
        - Với $Q(-2; -7)$: $x = -2 < 0 => y = 2(-2) - 3 = -7$ (Thuộc).
        Vậy điểm không thuộc đồ thị là $N(-1; 0)$.
    ]
)

// TN 4
#tn([Cho hàm số $f(x) = 2x^2 - 4x + 5$. Số nghiệm thực của phương trình $f(x) = f(3)$ là],
    (
        True([$2$]),
        [$1$],
        [$0$],
        [$3$]
    ),
    loigiai: [
        Ta có $f(3) = 2(3)^2 - 4(3) + 5 = 18 - 12 + 5 = 11$.
        Phương trình $f(x) = 11 <=> 2x^2 - 4x + 5 = 11 <=> 2x^2 - 4x - 6 = 0 <=> x^2 - 2x - 3 = 0$.
        Phương trình có hai nghiệm phân biệt $x = -1$ và $x = 3$.
        Vậy phương trình có đúng $2$ nghiệm thực.
    ]
)

// TN 5
#tn([Đồ thị của hàm số $y = a x^2 + b x$ đi qua hai điểm $A(1; 2)$ và $B(-2; 10)$. Giá trị của tổng $a + b$ bằng],
    (
        True([$2$]),
        [$4$],
        [$-2$],
        [$0$]
    ),
    loigiai: [
        Vì đồ thị đi qua $A(1; 2)$ và $B(-2; 10)$ nên:
        $ cases(a(1)^2 + b(1) = 2, a(-2)^2 + b(-2) = 10) <=> cases(a + b = 2, 4a - 2b = 10) $
        Từ phương trình thứ nhất ta có ngay $a + b = 2$.
    ]
)

// TN 6
#tn([Hàm số nào sau đây là HÀM SỐ CHẴN trên tập xác định của nó?],
    (
        True([$y = x^4 - 2x^2 + 3$]),
        [$y = x^3 - 3x$],
        [$y = 2x + 1$],
        [$y = x^2 - 2x$]
    ),
    loigiai: [
        Hàm số $f(x) = x^4 - 2x^2 + 3$ có tập xác định $D = RR$ đối xứng qua gốc tọa độ.
        Với mọi $x in RR$, ta có:
        $ f(-x) = (-x)^4 - 2(-x)^2 + 3 = x^4 - 2x^2 + 3 = f(x) $
        Vậy đây là hàm số chẵn.
    ]
)

// TN 7
#tn([Hàm số nào sau đây là HÀM SỐ LẺ trên tập xác định của nó?],
    (
        True([$y = x^3 - 4x$]),
        [$y = x^2 + 2$],
        [$y = |x|$],
        [$y = x^3 + 1$]
    ),
    loigiai: [
        Xét hàm số $f(x) = x^3 - 4x$ có tập xác định $D = RR$.
        Với mọi $x in RR$:
        $ f(-x) = (-x)^3 - 4(-x) = -x^3 + 4x = -(x^3 - 4x) = -f(x) $
        Do đó đây là hàm số lẻ.
    ]
)

// TN 8
#tn([Tập giá trị $T$ của hàm số phân thức $y = (x - 2) / (x + 1)$ là],
    (
        True([$RR setminus {1}$]),
        [$RR setminus {-1}$],
        [$RR setminus {2}$],
        [$RR$]
    ),
    loigiai: [
        Gọi $y_0$ là một giá trị thuộc tập giá trị của hàm số. Khi đó phương trình $(x - 2) / (x + 1) = y_0$ phải có nghiệm $x != -1$.
        $ <=> x - 2 = y_0(x + 1) <=> x - 2 = y_0 x + y_0 <=> (1 - y_0)x = y_0 + 2 $
        Phương trình có nghiệm khi và chỉ khi $1 - y_0 != 0 <=> y_0 != 1$.
        (Khi $y_0 != 1$, nghiệm $x = (y_0 + 2) / (1 - y_0) != -1$ vì $y_0 + 2 != -1 + y_0 <=> 2 != -1$ luôn đúng).
        Vậy tập giá trị là $T = RR setminus {1}$.
    ]
)

// TN 9
#tn([Tìm tất cả các giá trị của tham số $m$ để hàm số $y = (m^2 - 4)x + 2m - 1$ là hàm hằng trên toàn trục số thực $RR$.],
    (
        True([$m = plus.minus 2$]),
        [$m = 2$],
        [$m = -2$],
        [$m != plus.minus 2$]
    ),
    loigiai: [
        Hàm số bậc nhất $y = a x + b$ trở thành hàm hằng khi hệ số của $x$ triệt tiêu ($a = 0$):
        $ m^2 - 4 = 0 <=> m^2 = 4 <=> m = plus.minus 2 $
    ]
)

// TN 10
#tn([Cho đồ thị hàm số $y = f(x)$ xác định trên đoạn $[-3; 3]$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (4, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -3), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.8, -0.3), [$x$])
  content((-0.3, 3.3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Đồ thị chữ W đối xứng
  line(..range(-25, 26).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 4) - 2.5 * calc.pow(x, 2) + 1)
  }), stroke: 1.5pt + rgb("d97706"))
  
  circle((0, 1), radius: 2pt, fill: rgb("d97706"))
  content((0.3, 1), [$1$])
})
]
Khẳng định nào sau đây là ĐÚNG?],
    (
        True([Đồ thị hàm số nhận trục tung $O y$ làm trục đối xứng]),
        [Đồ thị hàm số nhận gốc tọa độ $O$ làm tâm đối xứng],
        [Hàm số luôn đồng biến trên đoạn $[-2; 2]$],
        [Hàm số không có điểm cực trị nào]
    ),
    loigiai: [
        Quan sát đồ thị hình chữ W ta thấy hai nửa đồ thị ở bên trái và bên phải trục tung đối xứng hoàn hảo với nhau qua trục tung $O y$.
        Do đó đồ thị nhận trục tung $O y$ làm trục đối xứng.
    ]
)

// TN 11
#tn([Số lượng vi khuẩn trong một môi trường nuôi cấy sau $t text(" (giờ)")$ được ước tính bởi hàm số:
$ N(t) = 500 + 200 t^2 $
Sau bao nhiêu giờ thì số lượng vi khuẩn trong môi trường nuôi cấy đạt mức $2300$ con?],
    (
        True([$3 text(" giờ")$]),
        [$2 text(" giờ")$],
        [$4 text(" giờ")$],
        [$5 text(" giờ")$]
    ),
    loigiai: [
        Cho $N(t) = 2300$:
        $ 500 + 200 t^2 = 2300 <=> 200 t^2 = 1800 <=> t^2 = 9 <=> t = 3 $ (do $t >= 0$).
        Vậy sau $3$ giờ thì số lượng vi khuẩn đạt $2300$ con.
    ]
)

// TN 12
#tn([Đồ thị của hàm số $y = 2x - 6$ tạo với hai trục tọa độ một tam giác vuông có diện tích bằng],
    (
        True([$9$]),
        [$18$],
        [$6$],
        [$12$]
    ),
    loigiai: [
        - Giao điểm với trục $O x$ ($y = 0$): $2x - 6 = 0 <=> x = 3 => A(3; 0)$.
        - Giao điểm với trục $O y$ ($x = 0$): $y = -6 => B(0; -6)$.
        Tam giác $O A B$ vuông tại $O$ có độ dài hai cạnh góc vuông là $O A = 3$ và $O B = |-6| = 6$.
        Diện tích tam giác là:
        $ S = 1/2 O A cdot O B = 1/2 (3)(6) = 9 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đồ thị hàm số bậc bốn W)
#ds([Cho hàm số $y = f(x) = x^4 - 4x^2 + 3$ xác định trên toàn trục số thực $RR$.
Đồ thị của hàm số có dạng chữ W với các điểm cực trị $A(-sqrt(2); -1)$, $B(0; 3)$, $C(sqrt(2); -1)$ như sau:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-3.5, 0), (3.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2.5), (0, 4.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.3, -0.3), [$x$])
  content((-0.3, 4.2), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Vẽ đồ thị y = x^4 - 4x^2 + 3
  line(..range(-23, 24).map(t => {
    let x = t / 10;
    (x, calc.pow(x, 4) - 4 * calc.pow(x, 2) + 3)
  }), stroke: 1.5pt + rgb("d97706"))
  
  circle((0, 3), radius: 2.5pt, fill: rgb("d97706"))
  circle((-1.414, -1), radius: 2.5pt, fill: rgb("d97706"))
  circle((1.414, -1), radius: 2.5pt, fill: rgb("d97706"))
  content((0.3, 3.2), [$B(0; 3)$])
  content((-1.6, -1.4), [$A$])
  content((1.6, -1.4), [$C$])
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hàm số $f(x)$ là hàm số chẵn và nhận trục tung $O y$ làm trục đối xứng.]),
    True([Hàm số đồng biến trên các khoảng $(-sqrt(2); 0)$ và $(sqrt(2); +infinity)$.]),
    True([Hàm số nghịch biến trên các khoảng $(-infinity; -sqrt(2))$ và $(0; sqrt(2))$.]),
    [Đường thẳng nằm ngang $y = -1$ cắt đồ thị hàm số tại đúng bốn điểm phân biệt.]
  ),
  loigiai: [
    #step([Tính chẵn lẻ])
    $f(-x) = (-x)^4 - 4(-x)^2 + 3 = x^4 - 4x^2 + 3 = f(x)$. Hàm số chẵn nên đồ thị nhận trục $O y$ làm trục đối xứng. Mệnh đề a ĐÚNG.

    #step([Khoảng đồng biến])
    Trên các khoảng $(-sqrt(2); 0)$ và $(sqrt(2); +infinity)$, đồ thị đi lên từ trái sang phải nên hàm số đồng biến. Mệnh đề b ĐÚNG.

    #step([Khoảng nghịch biến])
    Trên các khoảng $(-infinity; -sqrt(2))$ và $(0; sqrt(2))$, đồ thị đi xuống từ trái sang phải nên hàm số nghịch biến. Mệnh đề c ĐÚNG.

    #step([Số giao điểm với đường thẳng y = -1])
    Vì giá trị cực tiểu của hàm số là $y_text("CT") = -1$ (đạt tại hai điểm $x = plus.minus sqrt(2)$), nên đường thẳng $y = -1$ tiếp xúc với đồ thị tại đúng hai điểm cực tiểu $A$ và $C$.
    Do đó đường thẳng $y = -1$ cắt đồ thị tại đúng $2$ điểm chứ không phải $4$ điểm. Mệnh đề d SAI.
  ]
)

// DS 2 (Tìm tham số m để hàm số xác định trên khoảng)
#ds([Cho hàm số $y = f(x) = sqrt(x - m) + 1 / sqrt(2m + 8 - x)$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 1$, tập xác định của hàm số là nửa khoảng $[1; 10)$.]),
    True([Tập xác định của hàm số là một nửa khoảng khác rỗng khi và chỉ khi $m > -8$.]),
    True([Để hàm số xác định trên toàn bộ khoảng $(2; 5)$ thì điều kiện của tham số là $-1.5 <= m <= 2$.]),
    [Có đúng $10$ giá trị nguyên của tham số $m$ để hàm số xác định trên toàn bộ khoảng $(2; 5)$.]
  ),
  loigiai: [
    #step([Điều kiện xác định tổng quát])
    Hàm số xác định khi:
    $ cases(x - m >= 0, 2m + 8 - x > 0) <=> cases(x >= m, x < 2m + 8) $
    Tập xác định là $D = [m; 2m + 8)$.

    #step([Khi m = 1])
    $2m + 8 = 2(1) + 8 = 10$. Tập xác định là $D = [1; 10)$. Mệnh đề a ĐÚNG.

    #step([Tập xác định khác rỗng])
    $D != emptyset <=> m < 2m + 8 <=> m > -8$. Mệnh đề b ĐÚNG.

    #step([Xác định trên khoảng (2; 5)])
    Để hàm số xác định trên $(2; 5)$ thì:
    $ (2; 5) subset [m; 2m + 8) <=> cases(m <= 2, 2m + 8 >= 5) <=> cases(m <= 2, 2m >= -3) <=> -1.5 <= m <= 2 $
    Mệnh đề c ĐÚNG.

    #step([Đếm số giá trị nguyên])
    Các giá trị nguyên của $m in [-1.5; 2]$ là: $m in {-1; 0; 1; 2}$ (chỉ có đúng $4$ giá trị nguyên).
    Khẳng định $10$ giá trị nguyên là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Toán thực tế tối ưu hóa chi phí sản xuất)
#ds([Một xưởng cơ khí nhận hợp đồng gia công các thùng chứa dạng hình hộp chữ nhật không nắp có đáy là hình vuông cạnh $x text(" (m)")$ ($x > 0$) và chiều cao $h text(" (m)")$.
Biết thể tích của mỗi thùng chứa là $V = 4 text(" m")^3$.
Chi phí vật liệu làm đáy thùng là $150$ nghìn đồng/$text("m")^2$, chi phí vật liệu làm bốn mặt bên là $100$ nghìn đồng/$text("m")^2$.
Gọi $C(x)$ (nghìn đồng) là tổng chi phí vật liệu để sản xuất một thùng chứa.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Chiều cao của thùng chứa biểu diễn theo cạnh đáy $x$ là $h = 4 / x^2 text(" (m)")$.]),
    True([Tổng diện tích của bốn mặt xung quanh thùng chứa là $S_text("xq") = 16 / x text(" (m")^2)$.]),
    True([Hàm số biểu thị tổng chi phí vật liệu theo cạnh đáy $x$ là $C(x) = 150 x^2 + 1600 / x text(" (nghìn đồng)")$.]),
    [Chi phí vật liệu nhỏ nhất để làm một chiếc thùng chứa là $1.5$ triệu đồng.]
  ),
  loigiai: [
    #step([Biểu diễn chiều cao theo x])
    Thể tích $V = x^2 h = 4 => h = 4 / x^2 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Diện tích xung quanh])
    $S_text("xq") = 4(x h) = 4 x (4 / x^2) = 16 / x text(" m")^2$. Mệnh đề b ĐÚNG.

    #step([Lập hàm chi phí C(x)])
    Diện tích đáy: $S_text("đáy") = x^2$.
    Tổng chi phí:
    $C(x) = 150 S_text("đáy") + 100 S_text("xq") = 150 x^2 + 100 (16 / x) = 150 x^2 + 1600 / x$ nghìn đồng. Mệnh đề c ĐÚNG.

    #step([Tìm chi phí nhỏ nhất])
    Áp dụng bất đẳng thức Cauchy cho 3 số dương:
    $ C(x) = 150 x^2 + 800 / x + 800 / x >= 3 root(3, 150 x^2 cdot 800 / x cdot 800 / x) = 3 root(3, 150 times 640000) = 3 root(3, 96000000) $
    $ = 3 times (100 root(3, 96)) approx 3 times 457.88 = 1373.66 text(" nghìn đồng") != 1.5 text(" triệu đồng") $.
    Khẳng định $1.5$ triệu đồng là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Xét tính đơn điệu của hàm số chứa tham số)
#ds([Cho hàm số $f(x) = (m - 1)x^3 + 3x$ (với $m$ là tham số thực).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khi $m = 1$, hàm số trở thành $f(x) = 3x$ và đồng biến trên toàn trục số thực $RR$.]),
    True([Với mọi giá trị của tham số $m$, hàm số $f(x)$ luôn là hàm số lẻ trên $RR$.]),
    True([Khi $m = 2$, hàm số trở thành $f(x) = x^3 + 3x$ và luôn đồng biến trên $RR$.]),
    [Khi $m = 0$, hàm số $f(x) = -x^3 + 3x$ luôn nghịch biến trên toàn trục số thực $RR$.]
  ),
  loigiai: [
    #step([Khi m = 1])
    $f(x) = 3x$ có hệ số góc $3 > 0$ nên đồng biến trên $RR$. Mệnh đề a ĐÚNG.

    #step([Tính chẵn lẻ với mọi m])
    Tập xác định $D = RR$. Ta có:
    $f(-x) = (m - 1)(-x)^3 + 3(-x) = -(m - 1)x^3 - 3x = -f(x)$.
    Vậy với mọi $m$, hàm số luôn là hàm số lẻ. Mệnh đề b ĐÚNG.

    #step([Khi m = 2])
    Khi $m = 2$: $f(x) = x^3 + 3x$.
    Lấy $x_1 < x_2$: Vì hàm số $y = x^3$ và $y = 3x$ đều là các hàm số đồng biến trên $RR$, nên tổng của hai hàm số đồng biến là một hàm số luôn đồng biến trên $RR$. Mệnh đề c ĐÚNG.

    #step([Khi m = 0])
    Khi $m = 0$: $f(x) = -x^3 + 3x$.
    Lấy $x_1 = 0$ và $x_2 = 1$: $f(0) = 0$ và $f(1) = -1 + 3 = 2$.
    Ta thấy $x_1 < x_2$ và $f(x_1) < f(x_2)$, do đó hàm số tăng trên khoảng $(0; 1)$, không thể nghịch biến trên toàn $RR$.
    Khẳng định luôn nghịch biến trên $RR$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số giá trị nguyên của tham số m)
#tln([Tìm số giá trị nguyên của tham số $m in [-10; 10]$ để hàm số $y = sqrt(x - 3m + 6)$ xác định với mọi $x in [3; +infinity)$.],
    [14],
    loigiai: [
        #step([Điều kiện xác định của hàm số])
        Hàm số xác định khi $x - 3m + 6 >= 0 <=> x >= 3m - 6$.
        Tập xác định là $D = [3m - 6; +infinity)$.
        
        #step([Điều kiện xác định trên $[3; +infinity)$])
        Để hàm số xác định với mọi $x in [3; +infinity)$ thì:
        $ [3; +infinity) subset [3m - 6; +infinity) <=> 3m - 6 <= 3 <=> 3m <= 9 <=> m <= 3 $
        
        #step([Đếm số giá trị nguyên])
        Kết hợp với $m in [-10; 10]$, ta có $-10 <= m <= 3$.
        Số giá trị nguyên của $m$ là: $3 - (-10) + 1 = 14$ giá trị.
    ]
)

// TLN 2 (Nghiệm của phương trình phân nhánh)
#tln([Cho hàm số:
$ f(x) = cases(
  2x^2 - 3x + 1 &text("khi") x >= 1,
  4x + 1 &text("khi") x < 1
) $
Tìm nghiệm dương của phương trình $f(x) = 6$.],
    [2.5],
    loigiai: [
        #step([Trường hợp 1: x >= 1])
        $2x^2 - 3x + 1 = 6 <=> 2x^2 - 3x - 5 = 0 <=> (2x - 5)(x + 1) = 0 <=> cases(x = 5/2 = 2.5, x = -1)$.
        Vì $x >= 1$ nên ta nhận nghiệm $x = 2.5$.
        
        #step([Trường hợp 2: x < 1])
        $4x + 1 = 6 <=> 4x = 5 <=> x = 5/4 = 1.25$ (loại vì không thỏa mãn $x < 1$).
        
        #step([Kết luận])
        Nghiệm dương duy nhất của phương trình là $x = 2.5$.
    ]
)

// TLN 3 (Đồ thị song song và đi qua điểm)
#tln([Trong mặt phẳng tọa độ $O x y$, đồ thị của hàm số bậc nhất $y = a x + b$ đi qua điểm $M(2; 7)$ và song song với đường thẳng $y = 3x - 1$.
Tính giá trị biểu thức $P = a + b$.],
    [4],
    loigiai: [
        #step([Điều kiện song song])
        Đường thẳng $y = a x + b$ song song với $y = 3x - 1$ nên:
        $ a = 3 text(" và ") b != -1 $
        
        #step([Tìm hệ số b])
        Đường thẳng đi qua $M(2; 7)$ nên:
        $ 7 = 3(2) + b <=> 7 = 6 + b <=> b = 1 $
        (Thỏa mãn $b != -1$, đường thẳng không bị trùng).
        
        #step([Tính giá trị biểu thức P])
        $ P = a + b = 3 + 1 = 4 $
    ]
)

// TLN 4 (Giá trị nhỏ nhất theo Cauchy)
#tln([Tìm giá trị nhỏ nhất của hàm số $f(x) = x + 4 / x$ trên khoảng $(0; +infinity)$.],
    [4],
    loigiai: [
        #step([Áp dụng bất đẳng thức Cauchy])
        Với mọi $x > 0$, ta có $x > 0$ và $4/x > 0$. Áp dụng bất đẳng thức Cauchy cho hai số dương:
        $ f(x) = x + 4 / x >= 2 sqrt(x cdot 4 / x) = 2 sqrt(4) = 4 $
        
        #step([Đẳng thức xảy ra])
        Đẳng thức xảy ra khi $x = 4/x <=> x^2 = 4 <=> x = 2$ (thỏa mãn $x > 0$).
        Vậy giá trị nhỏ nhất của hàm số là $4$.
    ]
)

// TLN 5 (Thời gian chạm đất của vật thể)
#tln([Một quả bóng được ném thẳng đứng lên cao từ mặt đất. Độ cao $h(t) text(" (m)")$ của quả bóng so với mặt đất sau $t text(" (giây)")$ được xác định bởi hàm số:
$ h(t) = 20t - 5t^2 $
Hỏi sau bao nhiêu giây kể từ thời điểm ném thì quả bóng rơi trở lại chạm đất?],
    [4],
    loigiai: [
        #step([Điều kiện chạm đất])
        Quả bóng rơi trở lại chạm đất khi độ cao $h(t) = 0$:
        $ 20t - 5t^2 = 0 <=> 5t(4 - t) = 0 <=> cases(t = 0, t = 4) $
        
        #step([Kết luận thời gian])
        Thời điểm $t = 0$ là lúc bắt đầu ném bóng.
        Thời điểm quả bóng rơi chạm đất là sau $t = 4 text(" giây")$.
    ]
)

// TLN 6 (Số giao điểm của parabol và đường thẳng)
#tln([Tính số giao điểm của parabol $y = x^2 - 3x + 2$ và đường thẳng $y = x - 2$ trên mặt phẳng tọa độ $O x y$.],
    [1],
    loigiai: [
        #step([Phương trình hoành độ giao điểm])
        Xét phương trình:
        $ x^2 - 3x + 2 = x - 2 <=> x^2 - 4x + 4 = 0 <=> (x - 2)^2 = 0 <=> x = 2 $
        
        #step([Kết luận số giao điểm])
        Phương trình có nghiệm kép $x = 2$, suy ra đường thẳng tiếp xúc với parabol tại đúng $1$ điểm duy nhất $M(2; 0)$.
        Vậy số giao điểm là $1$.
    ]
)

] // end make-questions

#make-questions()
