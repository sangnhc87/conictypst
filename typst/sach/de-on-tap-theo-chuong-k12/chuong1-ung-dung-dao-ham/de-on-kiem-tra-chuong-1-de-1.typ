#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)

#let mode = "loigiai"
#let accent = rgb("d97706")
#let ma-de = "1234"
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12",
  school: "CHƯƠNG I: ỨNG DỤNG ĐẠO HÀM",
  exam-title: "ĐỀ KIỂM TRA 45 PHÚT - ĐỀ 1",
  subject: "TOÁN",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#include "12-4-6ngang.typ"

#let make-questions() = [

#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.],
  count: 12,
  reset-counter: true,
)

#tn([Hàm số $y = x^3 - 3x + 2$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$( -oo; -1 )$],
    [$( 1; +oo )$],
    True([$( -1; 1 )$]),
    [$( -oo; +oo )$]
  ),
  loigiai: [
    - Đạo hàm: $y' = 3x^2 - 3$.
    - $y' = 0 <=> x^2 = 1 <=> x = 1$ hoặc $x = -1$.
    - $y' < 0$ khi $x in (-1; 1)$.
    - Vậy hàm số nghịch biến trên khoảng $(-1; 1)$.
  ]
)

#tn([Một cửa sổ có dạng hình chữ nhật được phía trên bởi một nửa hình tròn (cửa sổ Norman). Biết chu vi của cửa sổ là 8 m. Tìm bán kính $R$ (m) của nửa hình tròn để diện tích cửa sổ đón được nhiều ánh sáng nhất.
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (2,3), fill: rgb("e0f7fa"), stroke: 1pt + black)
      arc((2,3), start: 0deg, stop: 180deg, radius: 1, fill: rgb("e0f7fa"), stroke: 1pt + black)
      line((0,3), (2,3), stroke: (dash: "dashed"))
      content((1, -0.3), [$2R$])
      content((-0.3, 1.5), [$h$])
    })
  ]
],
  (
    [$8 / (pi + 2)$],
    True([$8 / (pi + 4)$]),
    [$4 / (pi + 4)$],
    [$4 / (pi + 2)$]
  ),
  loigiai: [
    - Đặt bán kính nửa hình tròn là $R$, chiều cao hình chữ nhật là $h$ ($R > 0, h > 0$).
    - Chiều rộng hình chữ nhật là $2R$.
    - Chu vi cửa sổ gồm nửa chu vi đường tròn, hai cạnh bên $h$ và cạnh đáy $2R$:
      $P = pi R + 2h + 2R = 8 => h = (8 - R(pi + 2)) / 2$.
    - Diện tích cửa sổ: $S = S_"HCN" + S_"Nửa HT" = 2R h + 1/2 pi R^2$.
    - Thay $h$ vào $S$: $S(R) = R(8 - R(pi + 2)) + 1/2 pi R^2 = 8R - R^2 (pi + 2) + 1/2 pi R^2 = 8R - (pi/2 + 2)R^2$.
    - Đạo hàm: $S'(R) = 8 - (pi + 4)R$.
    - $S'(R) = 0 <=> R = 8 / (pi + 4)$.
    - Tại $R = 8 / (pi + 4)$, $S''(R) = -(pi + 4) < 0$ nên $S$ đạt giá trị lớn nhất.
  ]
)

#tn([Giá trị lớn nhất của hàm số $y = -x^4 + 2x^2 + 3$ trên đoạn $[0; 2]$ bằng bao nhiêu?],
  (
    [3],
    True([4]),
    [-5],
    [2]
  ),
  loigiai: [
    - Đạo hàm: $y' = -4x^3 + 4x$.
    - $y' = 0 <=> -4x(x^2 - 1) = 0 <=> x = 0, x = 1, x = -1$.
    - Trên đoạn $[0; 2]$, ta chỉ xét $x = 0$ và $x = 1$.
    - $y(0) = 3$, $y(1) = -1 + 2 + 3 = 4$, $y(2) = -16 + 8 + 3 = -5$.
    - Vậy $max_{[0; 2]} y = 4$.
  ]
)

#tn([Đường tiệm cận ngang của đồ thị hàm số $y = (2x - 1)/(x + 3)$ là đường thẳng có phương trình:],
  (
    [$x = -3$],
    [$y = -3$],
    True([$y = 2$]),
    [$x = 2$]
  ),
  loigiai: [
    - Tập xác định: $D = RR setminus {-3}$.
    - Ta có $lim_(x->+-oo) (2x - 1)/(x + 3) = 2$.
    - Vậy tiệm cận ngang là đường thẳng $y = 2$.
  ]
)

#tn([Một hồ nước đang bị ô nhiễm với nồng độ chất độc $C(t) = (5t)/(t^2 + 1)$ (mg/L), trong đó $t$ là số ngày kể từ lúc phát hiện. Kể từ lúc phát hiện, nồng độ chất độc cao nhất là bao nhiêu?],
  (
    [1 mg/L],
    True([2.5 mg/L]),
    [5 mg/L],
    [0 mg/L]
  ),
  loigiai: [
    - Hàm nồng độ $C(t) = (5t)/(t^2 + 1)$ với $t >= 0$.
    - $C'(t) = (5(t^2 + 1) - 5t(2t)) / (t^2 + 1)^2 = (5 - 5t^2) / (t^2 + 1)^2$.
    - $C'(t) = 0 <=> 1 - t^2 = 0 <=> t = 1$ (do $t >= 0$).
    - Tại $t = 1$, $C(1) = 5/2 = 2.5$ mg/L.
    - Với $t > 1$, $C'(t) < 0$, nồng độ giảm. Vậy cao nhất là 2.5 mg/L.
  ]
)

#tn([Hàm số nào dưới đây không có cực trị?],
  (
    [$y = x^3 - 3x^2$],
    True([$y = (x + 1)/(x - 2)$]),
    [$y = x^4 - 2x^2 + 1$],
    [$y = x^3 - 3x + 1$]
  ),
  loigiai: [
    - Hàm phân thức bậc 1 / bậc 1 có dạng $y = (a x + b)/(c x + d)$ luôn đơn điệu trên từng khoảng xác định, đạo hàm không đổi dấu nên không có cực trị.
  ]
)

#tn([Tiệm cận đứng của đồ thị hàm số $y = (x^2 - 1)/(x^2 - 3x + 2)$ là đường thẳng:],
  (
    [$x = 1$],
    True([$x = 2$]),
    [$x = 1$ và $x = 2$],
    [Không có tiệm cận đứng]
  ),
  loigiai: [
    - $y = ((x - 1)(x + 1))/((x - 1)(x - 2))$.
    - Với $x != 1$, $y = (x + 1)/(x - 2)$.
    - Hàm số chỉ có mẫu số tiến về $0$ tại $x = 2$ mà tử khác $0$. Do đó tiệm cận đứng là $x = 2$.
  ]
)

#tn([Một công ty bán $x$ chiếc điện thoại với giá mỗi chiếc là $p(x) = 20 - 0.01x$ (triệu đồng). Hàm doanh thu là $R(x) = x \cdot p(x)$. Để đạt doanh thu lớn nhất, công ty cần bán bao nhiêu chiếc điện thoại?],
  (
    [500],
    True([1000]),
    [1500],
    [2000]
  ),
  loigiai: [
    - Doanh thu $R(x) = x(20 - 0.01x) = 20x - 0.01x^2$.
    - Đạo hàm $R'(x) = 20 - 0.02x$.
    - $R'(x) = 0 <=> 0.02x = 20 <=> x = 1000$.
    - $R''(x) = -0.02 < 0$, nên $R(x)$ đạt cực đại tại $x = 1000$.
  ]
)

#tn([Đồ thị hàm số $y = (sqrt(x^2 + 1))/(x - 1)$ có bao nhiêu đường tiệm cận (bao gồm cả đứng và ngang)?],
  (
    [1],
    [2],
    True([3]),
    [4]
  ),
  loigiai: [
    - Tiệm cận đứng: $x = 1$.
    - Tiệm cận ngang: $lim_(x->+oo) (sqrt(x^2 + 1))/(x - 1) = 1 => y = 1$.
    - $lim_(x->-oo) (sqrt(x^2 + 1))/(x - 1) = -1 => y = -1$.
    - Vậy đồ thị có 3 đường tiệm cận.
  ]
)

#tn([Gọi $M$ và $m$ lần lượt là GTLN và GTNN của hàm số $y = x + 4/x$ trên đoạn $[1; 3]$. Khi đó $M + m$ bằng bao nhiêu?],
  (
    True([9]),
    [13/3],
    [28/3],
    [5]
  ),
  loigiai: [
    - $y' = 1 - 4/x^2 = (x^2 - 4)/x^2$.
    - $y' = 0 <=> x^2 = 4 <=> x = 2$ (do $x in [1; 3]$).
    - Tính các giá trị: $y(1) = 5$, $y(2) = 4$, $y(3) = 3 + 4/3 = 13/3 = 4.33$.
    - GTLN là $M = y(1) = 5$. GTNN là $m = y(2) = 4$.
    - Vậy $M + m = 5 + 4 = 9$.
  ]
)

#tn([Chi phí trung bình để sản xuất $x$ sản phẩm là $overline(C)(x) = (C(x))/x = 0.5x + 20 + 200/x$ (nghìn đồng). Để chi phí trung bình là nhỏ nhất, mức sản lượng $x$ cần đạt là bao nhiêu?],
  (
    [10],
    True([20]),
    [30],
    [40]
  ),
  loigiai: [
    - Áp dụng BĐT AM-GM: $0.5x + 200/x >= 2 sqrt(0.5x \cdot 200/x) = 2 sqrt(100) = 20$.
    - Vậy $overline(C)(x) >= 20 + 20 = 40$.
    - Dấu "=" xảy ra khi $0.5x = 200/x <=> x^2 = 400 <=> x = 20$ (do $x > 0$).
    - Hoặc dùng đạo hàm: $overline(C)'(x) = 0.5 - 200/x^2 = 0 <=> x^2 = 400 <=> x = 20$.
  ]
)

#tn([Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = (x - 1)^2 (x + 2)$. Hàm số có bao nhiêu điểm cực trị?],
  (
    [0],
    True([1]),
    [2],
    [3]
  ),
  loigiai: [
    - $f'(x) = 0 <=> x = 1$ hoặc $x = -2$.
    - Tại $x = 1$, đạo hàm là nghiệm kép nên không đổi dấu.
    - Tại $x = -2$, đạo hàm là nghiệm đơn nên đổi dấu từ âm sang dương.
    - Vậy hàm số chỉ có 1 điểm cực tiểu (1 cực trị).
  ]
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: 4,
  reset-counter: true,
)

#ds(
  [Cho hàm số $y = (-x^2 + 2x - 3)/(x - 1)$. Xét các phát biểu sau:],
  (
    [Hàm số đồng biến trên các khoảng $( -oo; 1 )$ và $( 1; +oo )$.],
    True([Đồ thị hàm số có tiệm cận đứng là $x = 1$.]),
    True([Đồ thị hàm số có tiệm cận xiên là $y = -x + 1$.]),
    [Hàm số có hai điểm cực trị và $y_"CĐ" - y_"CT" = 4$.]
  ),
  loigiai: [
    - Chia đa thức: $y = -x + 1 - 2/(x - 1)$.
    - Đạo hàm: $y' = -1 + 2/(x - 1)^2 = (-(x - 1)^2 + 2)/(x - 1)^2 = (-x^2 + 2x + 1)/(x - 1)^2$.
    - $y' = 0 <=> x = 1 + sqrt(2)$ hoặc $x = 1 - sqrt(2)$.
    - Dấu của $y'$ đổi từ âm sang dương rồi dương sang âm, nên hàm số có cả đồng biến và nghịch biến => Phát biểu a sai.
    - Mẫu bằng $0$ tại $x = 1$ và tử khác $0$ => $x = 1$ là tiệm cận đứng => Phát biểu b đúng.
    - Do $lim_(x->+-oo) (y - (-x + 1)) = lim_(x->+-oo) (-2/(x - 1)) = 0$ nên $y = -x + 1$ là tiệm cận xiên => Phát biểu c đúng.
    - Tại $x = 1 - sqrt(2)$ (cực tiểu), $y_"CT" = - (1 - sqrt(2)) + 1 - 2/(-sqrt(2)) = sqrt(2) + sqrt(2) = 2sqrt(2)$.
    - Tại $x = 1 + sqrt(2)$ (cực đại), $y_"CĐ" = - (1 + sqrt(2)) + 1 - 2/(sqrt(2)) = -sqrt(2) - sqrt(2) = -2sqrt(2)$.
    - $y_"CĐ" - y_"CT" = -2sqrt(2) - 2sqrt(2) = -4sqrt(2) != 4$ => Phát biểu d sai.
  ]
)

#ds(
  [Một công ty sản xuất máy xay sinh tố. Giả sử tổng chi phí (triệu đồng) để sản xuất $x$ sản phẩm mỗi ngày là $C(x) = 200 + 5x + 0.01x^2$. Gọi $overline(C)(x) = (C(x))/x$ là chi phí trung bình cho mỗi sản phẩm. Các nhận định sau đây đúng hay sai?],
  (
    [Chi phí cố định (khi không sản xuất sản phẩm nào) là 0 triệu đồng.],
    True([Hàm chi phí trung bình đạt cực tiểu tại $x = 141$ (làm tròn đến số nguyên).]),
    True([Khi sản lượng sản xuất tiến tới vô hạn, hàm chi phí trung bình không có tiệm cận ngang.]),
    [Chi phí trung bình nhỏ nhất là khoảng 9 triệu đồng / sản phẩm.]
  ),
  loigiai: [
    - Chi phí cố định $C(0) = 200$. Vậy a sai.
    - Chi phí trung bình $overline(C)(x) = 200/x + 5 + 0.01x$.
    - Áp dụng AM-GM: $200/x + 0.01x >= 2 sqrt(2) approx 2.828$.
    - Dấu "=" khi $200/x = 0.01x <=> x^2 = 20000 <=> x = sqrt(20000) = 100 sqrt(2) approx 141.4$. Làm tròn là $141$. Vậy b đúng.
    - $lim_(x->+oo) (200/x + 5 + 0.01x) = +oo$, nên đồ thị $overline(C)(x)$ không có tiệm cận ngang. Vậy c đúng.
    - Giá trị nhỏ nhất của $overline(C)(x) = 2 sqrt(2) + 5 approx 2.828 + 5 = 7.828$ triệu đồng. Không phải 9. Vậy d sai.
  ]
)

#ds(
  [Một công ty dự định thiết kế một bồn chứa nước hình trụ có nắp đậy với thể tích cố định là $V = 16 pi$ ($"m"^3$). Biết chi phí vật liệu làm đáy và nắp đắt gấp đôi chi phí làm mặt xung quanh (tính trên cùng một đơn vị diện tích). Gọi $r$ và $h$ lần lượt là bán kính đáy và chiều cao của bồn nước. Xét các phát biểu sau:
  #align(center)[
    #sm-tru(r: 1.5, cao: 3, them: (ctx, d) => {
      sm-diem(ctx, (0.5, 3.2), ten: [$r$], huong: "dong", bk: 0pt)
      sm-diem(ctx, (-2, 1.5), ten: [$h$], huong: "dong", bk: 0pt)
    })
  ]
  ],
  (
    True([Chiều cao $h$ tính theo bán kính $r$ là $h = 16 / r^2$.]),
    True([Hàm chi phí vật liệu tổng cộng tỉ lệ thuận với hàm số $f(r) = 2r^2 + 16/r$.]),
    [Để chi phí nguyên vật liệu thấp nhất thì bán kính đáy của bồn nước là $r = 2$ m.],
    [Khi chi phí nguyên vật liệu thấp nhất, tỷ số $h / r$ bằng 2.]
  ),
  loigiai: [
    - Thể tích khối trụ $V = pi r^2 h = 16 pi => h = 16 / r^2$. Vậy phát biểu a đúng.
    - Gọi $c$ là chi phí cho 1 đơn vị diện tích mặt xung quanh. Khi đó chi phí đáy và nắp là $2c$.
    - Tổng chi phí: $C(r) = c \cdot S_"xq" + 2c \cdot (2 S_"đáy") = c \cdot (2 pi r h) + 2c \cdot (2 pi r^2) = 2 pi c (r \cdot 16/r^2 + 2r^2) = 2 pi c (16/r + 2r^2)$.
    - Vậy hàm chi phí tỉ lệ với $g(r) = 2r^2 + 16/r$. (Lưu ý phát biểu b là $f(r)$, như vậy b đúng).
    - Đạo hàm: $g'(r) = 4r - 16/r^2 = (4r^3 - 16)/r^2$.
    - $g'(r) = 0 <=> r^3 = 4 <=> r = root(3, 4) approx 1.587$ m. Phát biểu c sai (vì $r = 2$ không đúng).
    - Khi chi phí thấp nhất thì $r = root(3, 4)$, suy ra $h = 16 / r^2 = 16 / (root(3, 4))^2$. Tỷ số $h/r = (16 / r^2) / r = 16 / r^3 = 16 / 4 = 4 != 2$. Phát biểu d sai.
  ]
)

#ds(
  [Số lượng tế bào của một quần thể vi khuẩn sau $t$ giờ kể từ lúc bắt đầu nuôi cấy được mô hình hóa bởi hàm số $N(t) = 1000 + (5000t)/(t^2 + 4)$ (tế bào). Các mệnh đề sau đúng hay sai?],
  (
    [Quần thể vi khuẩn luôn tăng trưởng không giới hạn theo thời gian.],
    True([Tốc độ tăng trưởng $N'(t)$ bằng 0 khi $t = 2$.]),
    True([Số lượng vi khuẩn đạt cao nhất là 2250 tế bào.]),
    [Trong dài hạn ($t -> +oo$), số lượng vi khuẩn sẽ dần ổn định ở mức 6000 tế bào.]
  ),
  loigiai: [
    - Ta có $lim_(t->+oo) N(t) = 1000 + 0 = 1000$. Quần thể không tăng vô hạn, và dài hạn sẽ về 1000. Phát biểu a và d sai.
    - Đạo hàm $N'(t) = 5000 \cdot ((t^2 + 4) - t \cdot 2t)/(t^2 + 4)^2 = 5000(4 - t^2)/(t^2 + 4)^2$.
    - $N'(t) = 0 <=> 4 - t^2 = 0 <=> t = 2$ (do $t >= 0$). Phát biểu b đúng.
    - Tại $t = 2$, $N(2) = 1000 + 10000/8 = 1000 + 1250 = 2250$. Quần thể lớn nhất là 2250 tế bào. Phát biểu c đúng.
  ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
  count: 6,
  reset-counter: true,
)

#tln(
  [Một nhà máy sản xuất thùng các-tông mở nắp từ một tấm bìa hình vuông cạnh 12 dm bằng cách cắt đi 4 hình vuông bằng nhau ở 4 góc rồi gấp lên. Thể tích lớn nhất của thùng các-tông thu được là bao nhiêu dm³?],
  [128],
  loigiai: [
    - Cạnh góc vuông bị cắt là $x$ ($0 < x < 6$).
    - Chiều dài và chiều rộng đáy thùng là $12 - 2x$.
    - Thể tích thùng: $V(x) = (12 - 2x)^2 x = 4(6-x)^2 x = 4(36 - 12x + x^2)x = 4x^3 - 48x^2 + 144x$.
    - $V'(x) = 12x^2 - 96x + 144 = 0 <=> x^2 - 8x + 12 = 0 <=> x = 2$ hoặc $x = 6$ (loại).
    - Thể tích cực đại tại $x = 2$: $V(2) = (12 - 4)^2 \cdot 2 = 64 \cdot 2 = 128$.
  ]
)

#tln(
  [Biết đường tiệm cận xiên của đồ thị hàm số $y = (2x^2 - 3x + 5)/(x - 1)$ cắt hai trục tọa độ tạo thành một tam giác vuông. Diện tích của tam giác vuông đó bằng bao nhiêu?],
  [0.25],
  loigiai: [
    - $y = (2x(x - 1) - x + 5)/(x - 1) = 2x - 1 + 4/(x - 1)$.
    - Vậy tiệm cận xiên là đường thẳng $d: y = 2x - 1$.
    - Tìm giao điểm của $d$ với các trục:
      - Giao $O y$: $x = 0 => y = -1$. Điểm $A(0; -1) => O A = 1$.
      - Giao $O x$: $y = 0 => x = 1/2$. Điểm $B(1/2; 0) => O B = 1/2$.
    - Diện tích tam giác vuông $O A B = 1/2 \cdot O A \cdot O B = 1/2 \cdot 1 \cdot 1/2 = 1/4 = 0.25$.
  ]
)

#tln(
  [Một hòn đảo $C$ cách bờ biển thẳng đứng 3 km. Người ta muốn xây dựng một đường dây điện từ một trạm biến áp $A$ trên bờ biển đến hòn đảo $C$. Điểm $B$ trên bờ biển là hình chiếu vuông góc của $C$ lên bờ biển, khoảng cách $A B = 5$ km. Chi phí nối dây điện dưới nước là 50 triệu đồng/km và trên bờ là 30 triệu đồng/km. Người ta chọn một điểm $M$ trên đoạn $A B$ để nối dây từ $A$ đến $M$ (trên bờ) và từ $M$ đến $C$ (dưới nước). Tìm khoảng cách $A M$ (km) để tổng chi phí là nhỏ nhất?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (6,0), stroke: 2pt)
      line((5,0), (5,3), stroke: (dash: "dashed"))
      line((0,0), (3,0), stroke: red + 1.5pt)
      line((3,0), (5,3), stroke: blue + 1.5pt)
      
      content((0, -0.3), [$A$])
      content((5, -0.3), [$B$])
      content((5, 3.3), [$C$])
      content((3, -0.3), [$M$])
      content((1.5, 0.3), [30 tr/km])
      content((3.6, 1.8), [50 tr/km])
      content((5.4, 1.5), [3 km])
    })
  ]],
  [2.75],
  loigiai: [
    - Đặt $B M = x$ (km) với $0 <= x <= 5$. Khi đó $A M = 5 - x$.
    - Chiều dài đoạn cáp dưới nước $M C = sqrt(B M^2 + B C^2) = sqrt(x^2 + 9)$.
    - Tổng chi phí: $T(x) = 30(5 - x) + 50 sqrt(x^2 + 9)$ (triệu đồng).
    - Đạo hàm: $T'(x) = -30 + 50 x / sqrt(x^2 + 9)$.
    - Đặt $T'(x) = 0 <=> 50 x = 30 sqrt(x^2 + 9) <=> 25 x^2 = 9(x^2 + 9) <=> 16 x^2 = 81 <=> x = 9/4 = 2.25$.
    - Do $B M = 2.25$ nên $A M = 5 - 2.25 = 2.75$ (km).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "T'(x)",
        func: "T(x)",
        x-vals: ($0$, $2.25$, $5$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($300$, $270$, $50 sqrt(34)$)
      )
    ]
    - Chi phí nhỏ nhất khi $x = 2.25$, tức là điểm $M$ cách $A$ một khoảng $A M = 2.75$ km.
    - Đáp số: 2.75.
  ]
)

#tln(
  [Một đoạn dây dài 100 cm được cắt thành hai đoạn. Một đoạn được uốn thành hình vuông, đoạn còn lại được uốn thành hình tròn. Phải cắt đoạn dây ở vị trí nào để tổng diện tích của hình vuông và hình tròn thu được là nhỏ nhất? (Hỏi chiều dài của đoạn dây uốn thành hình vuông, làm tròn đến hàng đơn vị cm).
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (6,0), stroke: 2pt)
      content((3, 0.3), [100 cm])
      line((2.5, 0.1), (2.5, -0.1))
      content((1.25, -0.4), [$x$])
      content((4.25, -0.4), [$100 - x$])
      
      rect((0.5, -2.5), (2, -1), stroke: 1.5pt + blue)
      circle((4.5, -1.75), radius: 0.75, stroke: 1.5pt + red)
    })
  ]
  ],
  [56],
  loigiai: [
    - Gọi chiều dài đoạn dây uốn thành hình vuông là $x$ (cm) ($0 < x < 100$).
    - Chiều dài đoạn uốn thành hình tròn là $100 - x$ (cm).
    - Cạnh hình vuông là $a = x/4 => S_"HV" = x^2/16$.
    - Chu vi hình tròn là $2 pi r = 100 - x => r = (100 - x)/(2 pi) => S_"HT" = pi r^2 = (100 - x)^2 / (4 pi)$.
    - Tổng diện tích: $S(x) = x^2/16 + (100 - x)^2 / (4 pi)$.
    - Đạo hàm: $S'(x) = x/8 - (100 - x)/(2 pi)$.
    - Cho $S'(x) = 0 <=> (pi x) / (8 pi) - (4(100 - x)) / (8 pi) = 0 <=> pi x - 400 + 4x = 0 <=> x(pi + 4) = 400 <=> x = 400 / (pi + 4)$.
    - Tính toán: $x approx 400 / (3.1416 + 4) = 400 / 7.1416 approx 56.009$ cm.
    - Chiều dài đoạn dây uốn thành hình vuông là khoảng 56 cm.
  ]
)

#tln([Một công ty dự định sản xuất các hộp chữ nhật không nắp từ một tấm tôn hình vuông cạnh 60 cm bằng cách cắt bốn hình vuông nhỏ bằng nhau ở bốn góc rồi gập lên. Để thể tích của hộp lớn nhất thì cạnh của hình vuông bị cắt đi phải bằng bao nhiêu cm?],
  [10],
  loigiai: [
    - Gọi $x$ là cạnh hình vuông bị cắt, điều kiện $0 < x < 30$.
    - Cạnh đáy hộp là $60 - 2x$, chiều cao là $x$.
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        line((0,0), (6,0), (6,6), (0,6), (0,0), stroke: 1pt + black)
        line((0,0), (1.5,0), (1.5,1.5), (0,1.5), (0,0), fill: rgb("ffcccc"), stroke: none)
        line((6,0), (4.5,0), (4.5,1.5), (6,1.5), (6,0), fill: rgb("ffcccc"), stroke: none)
        line((6,6), (4.5,6), (4.5,4.5), (6,4.5), (6,6), fill: rgb("ffcccc"), stroke: none)
        line((0,6), (1.5,6), (1.5,4.5), (0,4.5), (0,6), fill: rgb("ffcccc"), stroke: none)
        line((1.5,1.5), (4.5,1.5), stroke: (dash: "dashed"))
        line((1.5,4.5), (4.5,4.5), stroke: (dash: "dashed"))
        line((1.5,1.5), (1.5,4.5), stroke: (dash: "dashed"))
        line((4.5,1.5), (4.5,4.5), stroke: (dash: "dashed"))
        content((3, -0.4), $60 - 2x$)
        content((0.75, 0.75), $x$)
      })
    ]
    - Thể tích khối hộp: $V(x) = x(60 - 2x)^2 = x(3600 - 240x + 4x^2) = 4x^3 - 240x^2 + 3600x$.
    - Đạo hàm: $V'(x) = 12x^2 - 480x + 3600$.
    - Cho $V'(x) = 0 <=> 12(x^2 - 40x + 300) = 0 <=> x = 10$ hoặc $x = 30$ (loại vì $x < 30$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "V'(x)",
        func: "V(x)",
        x-vals: ($0$, $10$, $30$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $16000$, $0$)
      )
    ]
    - Dựa vào BBT, thể tích hộp lớn nhất khi $x = 10$.
  ]

)

#tln([Chi phí nhiên liệu cho một chuyến tàu chạy trên biển tỷ lệ thuận với bình phương vận tốc của nó. Biết rằng khi tàu chạy với vận tốc 10 km/h thì chi phí là 400 nghìn đồng/giờ. Ngoài ra, các chi phí cố định (nhân công, bảo dưỡng, ...) là 1600 nghìn đồng/giờ. Tàu cần đi quãng đường 100 km. Vận tốc (km/h) để tổng chi phí chuyến đi thấp nhất là bao nhiêu?],
  [20],
  loigiai: [
    - Gọi vận tốc của tàu là $v > 0$ (km/h).
    - Chi phí nhiên liệu trong 1 giờ là $c = k v^2$. Tại $v=10$, $c=400 => 400 = k(10) => k=4$. Vậy $c = 4v^2$.
    - Tổng chi phí trong 1 giờ (gồm nhiên liệu và cố định): $C_1 = 4v^2 + 1600$.
    - Thời gian đi hết 100 km là $t = 100 / v$ (giờ).
    - Tổng chi phí cho cả chuyến đi: $C(v) = C_1 times t = (4v^2 + 1600) times 100 / v = 400v + 160000 / v$.
    - Đạo hàm: $C'(v) = 400 - 160000 / v^2$.
    - Cho $C'(v) = 0 <=> 400 = 160000 / v^2 <=> v^2 = 400 <=> v = 20$ (do $v > 0$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "v",
        der: "C'(v)",
        func: "C(v)",
        x-vals: ($0$, $20$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $16000$, $+oo$)
      )
    ]
    - Dựa vào bảng biến thiên, chi phí thấp nhất khi tàu chạy với vận tốc 20 km/h.
  ]

)
]
#make-questions()

#if in-qr-dap-an [
  #pagebreak()
  #align(center)[
    #text(weight: "bold", size: 15pt, fill: accent)[QR ĐÁP ÁN OMR - BẢN GIÁO VIÊN]
    #v(0.5em)
    #text(size: 10pt)[Mã đề #ma-de. Mở Sang Math OMR, chọn “Quét QR trực tiếp” để nạp key và chấm bài.]
    #v(1em)
    #sang-omr-qr(
      ma-de: ma-de, 
      show-info: true, 
      pts: (mcq: 0.25, tf: 0.1, tf-full: 0.5, sh: 0.5)
    )
  ]
]

#print-answer-key()
