#import "@preview/sang-math:1.0.4": *


#let mode = "loigiai"
#let accent = rgb("d97706")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12",
  school: "CHƯƠNG I: ỨNG DỤNG ĐẠO HÀM",
  exam-title: "ĐỀ KIỂM TRA 45 PHÚT - ĐỀ 1",
  subject: "TOÁN",
  duration: "45 phút",
)

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

#tn([Một doanh nghiệp sản xuất $x$ sản phẩm mỗi ngày. Hàm tổng chi phí sản xuất (đơn vị: triệu đồng) được mô hình hóa bởi $C(x) = x^3 - 6x^2 + 15x + 10$. Chi phí cận biên là $C'(x)$. Chi phí cận biên đạt giá trị nhỏ nhất khi sản xuất bao nhiêu sản phẩm?],
  (
    True([2]),
    [3],
    [4],
    [5]
  ),
  loigiai: [
    - Chi phí cận biên $C'(x) = 3x^2 - 12x + 15$.
    - Cần tìm $x$ để $C'(x)$ đạt GTNN.
    - Đặt $g(x) = 3x^2 - 12x + 15$. Ta có $g'(x) = 6x - 12 = 0 <=> x = 2$.
    - Bảng biến thiên cho thấy $g(x)$ đạt cực tiểu tại $x = 2$. Vậy sản xuất 2 sản phẩm thì chi phí cận biên nhỏ nhất.
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
  [Cho hàm số $f(x) = |x^3 - 3x^2 + m|$. Xét các phát biểu sau liên quan đến GTLN của $f(x)$ trên đoạn $[0; 3]$:],
  (
    True([Khi $m = 0$, GTLN của hàm số trên đoạn $[0; 3]$ là 4.]),
    [Với mọi $m$, hàm số luôn đạt GTNN tại $x=2$.],
    True([Có đúng hai giá trị nguyên của $m$ để GTLN của hàm số trên đoạn $[0; 3]$ bằng 3.]),
    [Nếu $m > 4$ thì GTNN của hàm số trên đoạn $[0; 3]$ là 0.]
  ),
  loigiai: [
    - Đặt $g(x) = x^3 - 3x^2 + m$. Trên $[0; 3]$, $g'(x) = 3x^2 - 6x = 0 <=> x=0$ hoặc $x=2$.
    - $g(0) = m$, $g(2) = m - 4$, $g(3) = m$.
    - Vậy $g(x) in [m - 4; m]$. $f(x) = |g(x)|$.
    - GTLN của $f(x)$ trên $[0; 3]$ là $max(|m|, |m-4|)$.
    - Khi $m=0$, GTLN là $max(|0|, |-4|) = 4$. Phát biểu a đúng.
    - GTNN của hàm số $f(x) = |g(x)|$ bằng $0$ nếu phương trình $g(x) = 0$ có nghiệm trên đoạn $[0; 3]$, tức là khi $0 in [m-4; m] <=> 0 <= m <= 4$. Khi đó GTNN đạt tại một $x != 2$. Vậy phát biểu b sai.
    - Để $max = 3 <=> max(|m|, |m-4|) = 3$.
      - Nếu $m >= 2$ thì $max = m$. Để $max = 3 => m=3$ (thỏa mãn $m>=2$).
      - Nếu $m < 2$ thì $max = 4 - m$. Để $max = 3 => 4-m=3 => m=1$ (thỏa mãn $m < 2$).
      - Vậy có 2 giá trị là $m=1$ và $m=3$. Phát biểu c đúng.
    - Nếu $m > 4$, $g(x) in [m-4; m]$ với $m-4 > 0$, do đó $f(x) > 0$. GTNN của $f(x)$ bằng $m-4 != 0$. Phát biểu d sai.
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
  [Có bao nhiêu giá trị nguyên của tham số $m$ thuộc đoạn $[-10; 10]$ để hàm số $y = x^3 - 3m x^2 + 3(m^2 - 1)x + 2$ đồng biến trên khoảng $(2; +oo)$?],
  [12],
  loigiai: [
    - $y' = 3x^2 - 6m x + 3(m^2 - 1) = 3(x^2 - 2m x + m^2 - 1)$.
    - $y' = 0 <=> (x - m)^2 - 1 = 0 <=> x = m + 1$ hoặc $x = m - 1$.
    - Hệ số $a > 0$, hàm số đồng biến trên các khoảng $(-oo; m - 1)$ và $(m + 1; +oo)$.
    - Để hàm số đồng biến trên $(2; +oo)$ thì $(2; +oo)$ phải là tập con của $(m + 1; +oo)$.
    - Điều này xảy ra khi $m + 1 <= 2 <=> m <= 1$.
    - $m in [-10; 10]$, nguyên nên $m in {-10, -9, ..., 1}$.
    - Tổng cộng có $1 - (-10) + 1 = 12$ giá trị.
  ]
)

#tln(
  [Nồng độ $C$ (mg/L) của một loại thuốc trong máu của bệnh nhân $t$ giờ sau khi tiêm được tính bởi mô hình $C(t) = (20t)/(t^2 + 4)$. Sau bao lâu kể từ lúc tiêm thì nồng độ thuốc trong máu đạt giá trị lớn nhất? (Tính bằng giờ)],
  [2],
  loigiai: [
    - $C'(t) = 20(t^2 + 4 - t \cdot 2t)/(t^2 + 4)^2 = 20(4 - t^2)/(t^2 + 4)^2$.
    - $C'(t) = 0 <=> 4 - t^2 = 0 <=> t = 2$ (do $t > 0$).
    - Vậy sau 2 giờ thì nồng độ thuốc lớn nhất.
  ]
)

#tln(
  [Để mở két sắt cần mật mã 3 chữ số. 
- 682: Một số đúng và đúng vị trí.
- 614: Một số đúng nhưng sai vị trí.
- 206: Hai số đúng nhưng đều sai vị trí.
- 738: Không có số nào đúng.
- 780: Một số đúng nhưng sai vị trí.
Hỏi mật mã két sắt là số nào?],
  [042],
  loigiai: [
    - Từ "738" sai hoàn toàn, loại 7, 3, 8.
    - "682" có 1 đúng và đúng vị trí. Vì 8 sai nên 6 hoặc 2 đúng.
    - "614" có 1 đúng nhưng sai vị trí. Nếu 6 đúng, ở đây 6 đứng đầu (giống 682) nhưng lại bảo sai vị trí => mâu thuẫn. Vậy 6 sai.
    - Suy ra 2 đúng và đứng cuối (từ 682).
    - "206" có 2 đúng, sai vị trí. Vì 6 sai nên 2 và 0 đúng. 0 không đứng giữa, vậy 0 đứng đầu. Mật mã có dạng 0 ? 2.
    - "614" có 1 số đúng sai vị trí. 6 sai, vậy 1 hoặc 4 đúng. "780" có 1 đúng sai vị trí. 7,8 sai, vậy 0 đúng sai vị trí (hợp lý).
    - Từ 614, nếu 1 đúng thì 1 sai vị trí (nghĩa là 1 không đứng giữa). Mà 0 đứng đầu, 2 đứng cuối => 1 hết chỗ. Vậy 4 đúng và 4 phải đứng giữa.
    - Mật mã là 042.
  ]
)

#tln(
  [Có 5 ngôi nhà xếp thành hàng ngang từ trái sang phải, đánh số 1, 2, 3, 4, 5. 
- Nhà màu Đỏ ở liền kề bên trái nhà màu Xanh. 
- Người nuôi Chó ở nhà số 3.
- Nhà người nuôi Mèo nằm ngay bên phải nhà màu Xanh.
- Người ở nhà số 1 không nuôi chim.
Hỏi người nuôi Mèo ở nhà số mấy?],
  [4],
  loigiai: [
    - Nhà màu Đỏ ở bên trái nhà màu Xanh, nên chúng phải là cặp (1,2), (2,3), (3,4) hoặc (4,5).
    - Nhà người nuôi Mèo nằm ngay bên phải nhà màu Xanh. Vậy có bộ 3 liên tiếp: Đỏ - Xanh - Mèo.
    - Do đó, bộ 3 này chỉ có thể là (1,2,3), (2,3,4) hoặc (3,4,5).
    - Biết người nuôi Chó ở nhà số 3. Nếu bộ 3 là (1,2,3) thì nhà số 3 nuôi Mèo (mâu thuẫn với nuôi Chó).
    - Nếu bộ 3 là (3,4,5) thì nhà số 3 màu Đỏ, không ảnh hưởng. Nhưng Mèo ở nhà 5.
    - Nếu bộ 3 là (2,3,4) thì nhà số 3 màu Xanh, Mèo ở nhà 4.
    - Đáp án chọn nhà số 4.
  ]
)
