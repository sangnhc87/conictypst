#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("e11d48") // Red for Exam 4
#let ma-de = "1004"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 4)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = x/(x - 1)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(1; +oo)$],
    [$(-oo; +oo)$],
    [$(0; 1)$],
    True([Không có khoảng đồng biến])
  ),
  loigiai: [
    + Tập xác định: $D = RR \\ {1}$.
    + Đạo hàm $y' = (1*(-1) - 1*0)/(x-1)^2 = -1/(x-1)^2 < 0$ với mọi $x != 1$.
    + Vậy hàm số nghịch biến trên $(-oo; 1)$ và $(1; +oo)$. Hàm số không có khoảng đồng biến nào.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $0$, $2$, $+oo$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($-oo$, $5$, $1$, $+oo$),
  )
]
Giá trị cực tiểu của hàm số đã cho bằng],
  (
    [$0$],
    [$5$],
    [$2$],
    True([$1$])
  ),
  loigiai: [
    + Dựa vào bảng biến thiên, hàm số đạt cực tiểu tại $x = 2$ và giá trị cực tiểu là $y = 1$.
  ]
)

#tn([Giá trị lớn nhất của hàm số $y = (2x + 1)/(x - 1)$ trên đoạn $[2; 5]$ bằng],
  (
    True([$5$]),
    [$11/4$],
    [$3$],
    [$4$]
  ),
  loigiai: [
    + Hàm số xác định trên đoạn $[2; 5]$.
    + Đạo hàm $y' = (2(-1) - 1(1))/(x-1)^2 = -3/(x-1)^2 < 0 forall x in [2; 5]$.
    + Hàm số nghịch biến trên đoạn $[2; 5]$.
    + Vậy giá trị lớn nhất là $y(2) = (2(2)+1)/(2-1) = 5$.
  ]
)

#tn([Tổng số đường tiệm cận ngang và tiệm cận đứng của đồ thị hàm số $y = (x^2 - 1)/(x^2 - 3x + 2)$ là],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$]
  ),
  loigiai: [
    + Ta có $y = ((x-1)(x+1))/((x-1)(x-2))$.
    + Với $x != 1$, $y = (x+1)/(x-2)$.
    + $lim_(x -> +-oo) y = 1 => y = 1$ là tiệm cận ngang (1 đường).
    + $lim_(x -> 2^+) y = +oo => x = 2$ là tiệm cận đứng (1 đường).
    + Giới hạn tại $x=1$ là hữu hạn nên không có tiệm cận đứng tại $x=1$.
    + Tổng số đường tiệm cận là 2.
  ]
)

#tn([Theo định luật Poiseuille về huyết động học, vận tốc máu chảy trong mạch máu phụ thuộc vào khoảng cách $r$ từ tâm mạch máu theo hàm số $v(r) = r^2 (3 - r)$ (đơn vị: $c m \/ s$), với $0 <= r <= 3$. Vận tốc máu đạt cực đại tại khoảng cách $r$ bằng bao nhiêu?],
  (
    [$r = 0$],
    [$r = 1$],
    True([$r = 2$]),
    [$r = 3$]
  ),
  loigiai: [
    + Đạo hàm $v'(r) = 2r(3-r) + r^2(-1) = 6r - 2r^2 - r^2 = 6r - 3r^2$.
    + $v'(r) = 0 <=> 3r(2 - r) = 0 <=> r = 0$ hoặc $r = 2$.
    + Vận tốc tại $r=0$ là $0$, tại $r=3$ là $0$, tại $r=2$ là $4$.
    + Vậy vận tốc đạt cực đại tại $r = 2$.
  ]
)

#tn([Công suất điện $P$ (W) của một mạch điện xoay chiều phụ thuộc vào điện trở $R$ ($Omega$) của biến trở theo công thức $P(R) = (100 R)/(R^2 + 16)$. Để công suất của mạch đạt giá trị lớn nhất, ta cần điều chỉnh điện trở $R$ bằng bao nhiêu?],
  (
    [$2 Omega$],
    True([$4 Omega$]),
    [$8 Omega$],
    [$16 Omega$]
  ),
  loigiai: [
    + Đạo hàm $P'(R) = (100(R^2+16) - 100R(2R))/(R^2+16)^2 = (1600 - 100R^2)/(R^2+16)^2$.
    + $P'(R) = 0 <=> 1600 - 100R^2 = 0 <=> R^2 = 16 <=> R = 4$ (vì $R > 0$).
    + Vậy công suất cực đại khi $R = 4 Omega$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có đồ thị như hình bên. Hàm số $y=f(x)$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$(-oo; -1)$],
    True([$(-1; 1)$]),
    [$(1; +oo)$],
    [$(-1; +oo)$]
  ),
  loigiai: [
    + (Hình minh hoạ: Đồ thị hàm số bậc 3 có cực đại tại $x=-1$, cực tiểu tại $x=1$).
    + Dựa vào hướng đi xuống của đồ thị, hàm số nghịch biến trên khoảng $(-1; 1)$.
  ]
)

#tn([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số $y = x^3 - 3x$ bằng],
  (
    [$2$],
    [$4$],
    [$2sqrt(2)$],
    True([$2sqrt(5)$])
  ),
  loigiai: [
    + Đạo hàm $y' = 3x^2 - 3 = 0 <=> x=1$ hoặc $x=-1$.
    + Điểm cực tiểu $A(1; -2)$, điểm cực đại $B(-1; 2)$.
    + Khoảng cách $A B = sqrt((-1-1)^2 + (2 - (-2))^2) = sqrt(4 + 16) = sqrt(20) = 2sqrt(5)$.
  ]
)

#tn([Đường thẳng nào dưới đây là tiệm cận xiên của đồ thị hàm số $y = (x^2 + 2x - 1)/(x - 1)$?],
  (
    True([$y = x + 3$]),
    [$y = x + 2$],
    [$y = x - 1$],
    [$y = 2x + 1$]
  ),
  loigiai: [
    + Thực hiện phép chia đa thức: $x^2+2x-1 = (x-1)(x+3) + 2$.
    + Suy ra $y = x + 3 + 2/(x-1)$.
    + Khi $x -> +-oo$, giới hạn của $2/(x-1)$ là $0$.
    + Vậy tiệm cận xiên là $y = x + 3$.
  ]
)

#tn([Chi phí trung bình để sản xuất $x$ chiếc điện thoại (đơn vị: triệu đồng) là $C(x) = (200x + 5000)/x$. Khi số lượng điện thoại sản xuất càng lớn ($x -> +oo$), chi phí trung bình để sản xuất một chiếc điện thoại tiến tới mức nào?],
  (
    [$5000$ triệu đồng],
    [$0$ triệu đồng],
    True([$200$ triệu đồng],),
    [$5200$ triệu đồng]
  ),
  loigiai: [
    + Tiệm cận ngang của đồ thị hàm số khi $x -> +oo$ là $lim_(x -> +oo) (200x + 5000)/x = 200$.
    + Vậy chi phí tiến đến mức ổn định là 200 triệu đồng.
  ]
)

#tn([Một người thợ cần làm một khung tranh hình chữ nhật có diện tích $36 c m^2$. Chu vi nhỏ nhất của khung tranh bằng bao nhiêu?],
  (
    [$36 c m$],
    True([$24 c m$]),
    [$18 c m$],
    [$12 c m$]
  ),
  loigiai: [
    + Gọi $x, y$ là hai kích thước của khung tranh. $x*y = 36 => y = 36/x$.
    + Chu vi $P = 2(x + y) = 2(x + 36/x)$.
    + Áp dụng BĐT AM-GM hoặc dùng đạo hàm, $x + 36/x >= 2sqrt(36) = 12$.
    + Chu vi nhỏ nhất là $P = 2 * 12 = 24 c m$. Dấu "=" xảy ra khi $x = 6$.
  ]
)

#tn([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {1}$ và có bảng biến thiên:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $1$, $+oo$),
    d-signs: ($-$, "||", $-$),
    v-vals: ($-1$, $-oo$, "||", $+oo$, $2$),
  )
]
Tổng số đường tiệm cận của đồ thị hàm số đã cho là],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$]
  ),
  loigiai: [
    + $lim_(x -> -oo) y = -1 => y = -1$ là TCN.
    + $lim_(x -> +oo) y = 2 => y = 2$ là TCN.
    + $lim_(x -> 1) y = +-oo => x = 1$ là TCĐ.
    + Tổng cộng có 3 đường tiệm cận.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (x^2 - 2x + 2)/(x - 1)$.],
  (
    False([Tập xác định của hàm số là $D = RR$.]),
    True([Đồ thị hàm số có đúng một đường tiệm cận đứng là $x = 1$.]),
    False([Đồ thị hàm số có một đường tiệm cận ngang.]),
    True([Hàm số đạt cực tiểu tại $x = 2$ và đạt cực đại tại $x = 0$.])
  ),
  loigiai: [
    + Tập xác định $D = RR \\ {1}$. => a) Sai.
    + Tại $x=1$ mẫu số bằng 0, tử số khác 0 nên có TCĐ $x=1$. => b) Đúng.
    + Bậc tử > bậc mẫu nên không có TCN, chỉ có TCX. => c) Sai.
    + Đạo hàm $y' = ((2x-2)(x-1) - (x^2-2x+2))/(x-1)^2 = (x^2-2x)/(x-1)^2$.
    + $y' = 0 <=> x=0$ hoặc $x=2$.
    + Qua $x=0$, $y'$ đổi dấu $+ -> -$ (CĐ). Qua $x=2$, $y'$ đổi dấu $- -> +$ (CT). => d) Đúng.
  ]
)

#ds([Một bể bơi hình hộp chữ nhật không nắp có thể tích $V = 32 m^3$. Tỉ lệ giữa chiều dài và chiều rộng của đáy bể là 2:1. Gọi $x$ (m) là chiều rộng đáy và $h$ (m) là chiều cao của bể bơi ($x > 0$).],
  (
    True([Diện tích đáy bể bơi được tính bởi $S_d = 2x^2$.]),
    True([Chiều cao của bể bơi được tính theo $x$ là $h = 16/x^2$.]),
    False([Diện tích toàn phần (phần lát gạch) của bể bơi là $S(x) = 2x^2 + 48/x$.]),
    False([Để chi phí lát gạch thấp nhất, chiều rộng đáy bể phải là 3 mét.])
  ),
  loigiai: [
    + Chiều dài đáy là $2x$. Diện tích đáy $S_d = x * 2x = 2x^2$. => a) Đúng.
    + Thể tích $V = S_d * h => 32 = 2x^2 * h => h = 32/(2x^2) = 16/x^2$. => b) Đúng.
    + Diện tích xung quanh: $S_(x q) = 2(x*h) + 2(2x*h) = 6 x h = 6x * (16/x^2) = 96/x$.
    + Diện tích lát gạch (diện tích toàn phần không nắp) là $S(x) = 2x^2 + 96/x$. => c) Sai.
    + Đạo hàm $S'(x) = 4x - 96/x^2 = (4x^3 - 96)/x^2$.
    + $S'(x) = 0 <=> x^3 = 24 <=> x = 2root(3, 3) approx 2.88$ (mét). Không phải 3m. => d) Sai.
  ]
)

#ds([Tốc độ của một phản ứng hóa học (đơn vị: mol/L.s) được mô hình hóa bởi hàm số $v(t) = (5t)/(t^2 + 4)$, trong đó $t$ là thời gian tính bằng giây ($t >= 0$).],
  (
    True([Tại thời điểm $t = 0$, tốc độ phản ứng bằng 0.]),
    True([Tốc độ phản ứng đạt giá trị lớn nhất sau 2 giây.]),
    False([Tốc độ phản ứng giảm liên tục trong khoảng thời gian từ $t=0$ đến $t=2$.]),
    False([Tốc độ lớn nhất của phản ứng hóa học là 2.5 mol/L.s.])
  ),
  loigiai: [
    + $v(0) = 0$. => a) Đúng.
    + Đạo hàm $v'(t) = (5(t^2+4) - 5t(2t))/(t^2+4)^2 = (20 - 5t^2)/(t^2+4)^2$.
    + $v'(t) = 0 <=> 5t^2 = 20 <=> t^2 = 4 <=> t = 2$.
    + BBT cho thấy $v(t)$ đạt GTLN tại $t=2$. => b) Đúng.
    + Trong khoảng $(0; 2)$, $v'(t) > 0$ nên tốc độ phản ứng TĂNG liên tục, không phải giảm. => c) Sai.
    + Tốc độ lớn nhất là $v(2) = 10 / 8 = 1.25$ mol/L.s. => d) Sai.
  ]
)

#ds([Cho hàm số $y=f(x)$ liên tục trên các khoảng $(-oo; -1)$ và $(-1; +oo)$, có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-1$, $2$, $+oo$),
    d-signs: ($+$, "||", $-$, $0$, $+$),
    v-vals: ($2$, $+oo$, "||", $+oo$, $1$, $+oo$),
  )
]],
  (
    True([Hàm số đạt cực tiểu tại $x = 2$.]),
    False([Đồ thị hàm số có hai đường tiệm cận đứng.]),
    True([Đường thẳng $y = 2$ là tiệm cận ngang của đồ thị hàm số.]),
    False([Đồ thị hàm số đi qua điểm $M(0; 0)$.])
  ),
  loigiai: [
    + Hàm số giảm từ $+oo$ xuống $1$ rồi tăng lên, đạt cực tiểu tại $x=2$. => a) Đúng.
    + $lim_(x -> -1) f(x) = +oo$ nên $x=-1$ là tiệm cận đứng duy nhất. => b) Sai.
    + $lim_(x -> -oo) f(x) = 2$ nên $y=2$ là TCN. => c) Đúng.
    + BBT không cho biết tung độ tại $x=0$, nên không thể khẳng định đi qua gốc toạ độ. Dựa vào BBT tại nhánh $x > -1$, giá trị nhỏ nhất là $1$, do đó $f(0) >= 1$. Suy ra không thể đi qua $(0; 0)$. => d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Một quả đạn pháo được bắn lên theo phương thẳng đứng. Độ cao của quả đạn so với mặt đất (tính bằng mét) sau $t$ giây được cho bởi hàm số $h(t) = 100t - 5t^2$. Độ cao lớn nhất mà quả đạn pháo có thể đạt được là bao nhiêu mét?],
  [500],
  loigiai: [
    + Đạo hàm $h'(t) = 100 - 10t = 0 <=> t = 10$.
    + Độ cao lớn nhất là $h(10) = 100(10) - 5(10^2) = 1000 - 500 = 500$ (mét).
  ]
)

#tln([Dân số của một thị trấn sau $t$ năm kể từ hiện tại được dự báo theo hàm số $P(t) = 10 + (50t)/(t^2+100)$ (nghìn người) với $t >= 0$. Hỏi sau bao nhiêu năm nữa thì dân số thị trấn đạt mức cao nhất?],
  [10],
  loigiai: [
    + Đạo hàm $P'(t) = (50(t^2+100) - 50t(2t))/(t^2+100)^2 = (5000 - 50t^2)/(t^2+100)^2$.
    + $P'(t) = 0 <=> 5000 - 50t^2 = 0 <=> t^2 = 100 <=> t = 10$ (do $t >= 0$).
    + Vậy sau 10 năm dân số đạt mức cao nhất.
  ]
)

#tln([Một trạm phát điện nằm ở vị trí $A$ trên bờ biển thẳng. Một hòn đảo cách bờ biển một khoảng $D C = 3$ km, với $D$ là hình chiếu vuông góc của đảo lên bờ biển. Khoảng cách từ $A$ đến $D$ là 4 km. Người ta muốn kéo một đường cáp điện từ $A$ đến điểm $M$ trên bờ biển, rồi từ $M$ kéo cáp ngầm dưới biển đến đảo $C$. Chi phí kéo cáp dọc theo bờ biển là 300 triệu đồng/km, chi phí kéo cáp ngầm dưới nước là 500 triệu đồng/km. Gọi $x$ (km) là khoảng cách từ $D$ đến $M$ ($0 <= x <= 4$). Để chi phí là nhỏ nhất, khoảng cách $x$ phải bằng bao nhiêu km? (Viết đáp án dưới dạng số thập phân)],
  [2.25],
  loigiai: [
    + Khoảng cách trên bờ $A M = 4 - x$. Khoảng cách dưới nước $M C = sqrt(x^2 + 3^2) = sqrt(x^2 + 9)$.
    + Tổng chi phí $C(x) = 300(4 - x) + 500sqrt(x^2 + 9)$ (triệu đồng).
    + Đạo hàm $C'(x) = -300 + 500*x/sqrt(x^2 + 9)$.
    + $C'(x) = 0 <=> 500x = 300sqrt(x^2 + 9) <=> 5x = 3sqrt(x^2 + 9) <=> 25x^2 = 9(x^2 + 9) <=> 16x^2 = 81 <=> x = 9/4 = 2.25$.
    + Bảng biến thiên cho thấy cực tiểu tại $x = 2.25$ km.
  ]
)

#tln([Một chủ vườn cam có 40 cây cam, trung bình mỗi cây cho thu hoạch 500 quả. Người đó dự định trồng thêm một số cây cam. Các chuyên gia nông nghiệp khuyến cáo rằng, cứ trồng thêm 1 cây thì do đất chật và thiếu ánh sáng, năng suất trung bình của mỗi cây trong vườn sẽ giảm đi 10 quả. Hỏi chủ vườn cần trồng thêm bao nhiêu cây cam để tổng số quả thu được là lớn nhất?],
  [5],
  loigiai: [
    + Gọi $x$ là số cây trồng thêm ($x >= 0, x in NN$).
    + Tổng số cây là $40 + x$.
    + Năng suất mỗi cây là $500 - 10x$.
    + Tổng số quả là $f(x) = (40 + x)(500 - 10x) = 20000 - 400x + 500x - 10x^2 = -10x^2 + 100x + 20000$.
    + Đây là parabol bề lõm quay xuống, đạt đỉnh (GTLN) tại $x = -100 / (2*(-10)) = 5$.
    + Vậy trồng thêm 5 cây thì năng suất lớn nhất.
  ]
)

#tln([Chi phí để sản xuất $x$ máy điều hòa không khí của một công ty được ước tính bởi hàm số $C(x) = 2x^2 + 108000/x$ (triệu đồng) với $x > 0$. Chi phí sản xuất sẽ đạt giá trị nhỏ nhất khi công ty sản xuất bao nhiêu máy điều hòa?],
  [30],
  loigiai: [
    + Đạo hàm $C'(x) = 4x - 108000/x^2 = (4x^3 - 108000)/x^2$.
    + $C'(x) = 0 <=> x^3 = 27000 <=> x = 30$.
    + Bảng biến thiên cho thấy cực tiểu tại $x = 30$.
  ]
)

#tln([Một chiếc ô tô di chuyển với vận tốc $v$ (km/h) thì mức tiêu thụ nhiên liệu trong một giờ được mô hình hóa bởi hàm số $F(v) = v^2/400 + 4$ (lít/giờ) với $v > 0$. Ô tô cần chạy một quãng đường dài 100 km. Để tiêu hao ít nhiên liệu nhất cho toàn bộ chuyến đi này, tài xế cần chạy xe với vận tốc bao nhiêu km/h?],
  [40],
  loigiai: [
    + Thời gian đi hết quãng đường 100 km là $t = 100/v$ (giờ).
    + Tổng lượng nhiên liệu tiêu thụ cho chuyến đi là:
    + $E(v) = F(v) * t = (v^2/400 + 4) * 100/v = v/4 + 400/v$ (lít).
    + Áp dụng BĐT AM-GM cho 2 số dương: $E(v) = v/4 + 400/v >= 2sqrt((v/4) * (400/v)) = 2sqrt(100) = 20$.
    + Dấu "=" xảy ra khi $v/4 = 400/v <=> v^2 = 1600 <=> v = 40$.
    + Vậy vận tốc tối ưu là 40 km/h.
  ]
)
