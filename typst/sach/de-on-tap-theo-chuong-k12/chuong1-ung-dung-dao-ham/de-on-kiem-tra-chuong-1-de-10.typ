#import "@preview/sang-math:1.0.6": *
// #import "../../../../public/hdsd/typst/sang-math-geom.typ": *
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
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 10",
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

#tn([Cho hàm số $y = x^3 - 3x^2 + 2$. Khẳng định nào sau đây là đúng?],
  (
    [Hàm số đồng biến trên khoảng $(0; 2)$.],
    [Hàm số nghịch biến trên khoảng $( -oo; 0 )$.],
    True([Hàm số nghịch biến trên khoảng $(0; 2)$.]),
    [Hàm số đồng biến trên khoảng $( -2; 0 )$.]
  ),
    loigiai: [
    - Đạo hàm: $y' = 3x^2 - 6x$.
    - $y' = 0 <=> 3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.
    - Bảng xét dấu: $y' < 0$ khi $x in (0; 2)$ và $y' > 0$ khi $x in (-oo; 0) union (2; +oo)$.
    - Vậy hàm số nghịch biến trên khoảng $(0; 2)$.
  ]
)

#tn([Hàm số $y = -x^4 + 2x^2 + 1$ đạt cực tiểu tại điểm nào dưới đây?],
  (
    [$x = -1$],
    [$x = 1$],
    True([$x = 0$]),
    [$x = 2$]
  ),
    loigiai: [
    - Đạo hàm: $y' = -4x^3 + 4x$.
    - $y' = 0 <=> -4x(x^2 - 1) = 0 <=> x = 0, x = 1, x = -1$.
    - Tại $x=0$, hàm số đạt cực tiểu do đạo hàm đổi dấu từ âm sang dương.
  ]
)

#tn([Tiệm cận ngang của đồ thị hàm số $y = (2x - 1)/(x + 1)$ là đường thẳng có phương trình:],
  (
    [$y = -1$],
    True([$y = 2$]),
    [$x = -1$],
    [$x = 2$]
  ),
    loigiai: [
    - $lim_(x -> oo) (2x - 1)/(x + 1) = 2$.
    - Vậy đường tiệm cận ngang là $y = 2$.
  ]
)

#tn([Số ca nhiễm bệnh của một địa phương sau $t$ ngày được dự báo theo hàm số $N(t) = -t^3 + 30t^2$ (người). Số ca nhiễm mới đạt cao nhất vào ngày thứ bao nhiêu?],
  (
    [10],
    True([10]),
    [20],
    [30]
  ),
    loigiai: [
    - Số ca nhiễm mới mỗi ngày là tốc độ thay đổi của $N(t)$, tức là $N'(t) = -3t^2 + 60t$.
    - Xét hàm $f(t) = -3t^2 + 60t$. Đạo hàm $f'(t) = -6t + 60$.
    - $f'(t) = 0 <=> t = 10$.
    - Vậy số ca nhiễm mới đạt đỉnh vào ngày thứ 10.
  ]
)

#tn([Đồ thị hàm số $y = (x^2 - 4x + 3)/(x - 1)$ có bao nhiêu đường tiệm cận đứng?],
  (
    True([0]),
    [1],
    [2],
    [3]
  ),
    loigiai: [
    - Rút gọn hàm số (với $x != 1$): $y = ( (x - 1)(x - 3) ) / (x - 1) = x - 3$.
    - Do đó, đồ thị hàm số không có đường tiệm cận đứng.
  ]
)

#tn([Trong một nhà máy, chi phí sản xuất $x$ sản phẩm là $C(x) = 5000 + 10x + 0.05x^2$ (nghìn đồng). Hàm chi phí trung bình $overline(C)(x) = C(x)/x$. Sản lượng $x$ để chi phí trung bình thấp nhất là:],
  (
    [100],
    [200],
    True([316]),
    [500]
  ),
    loigiai: [
    - $overline(C)(x) = 5000/x + 10 + 0.05x$.
    - Đạo hàm, $overline(C)'(x) = -5000/x^2 + 0.05 = 0 <=> x^2 = 100000 <=> x approx 316$.
  ]
)

#tn([Để thiết kế một máng dẫn nước bằng cách gấp một tấm tôn phẳng hình chữ nhật có bề ngang 30 cm. Người ta gấp hai mép lên trên tạo thành một mặt cắt ngang hình chữ U cân. Phần đáy máng là $x$ cm, hai cạnh bên gập lên có độ dài bằng nhau. Để lưu lượng nước qua máng là lớn nhất, diện tích mặt cắt ngang phải lớn nhất. Kích thước $x$ phải bằng bao nhiêu cm?
  #align(center)[
    #cetz.canvas(length: 1.5cm, {
      import cetz.draw: *
      // Hình tấm tôn ban đầu
      line((-2, 0), (2, 0), stroke: 1.5pt)
      content((0, -0.3), [30 cm])
      
      // Hình mặt cắt máng chữ U
      line((3, 1), (3, 0), (5, 0), (5, 1), stroke: 2pt + blue)
      content((4, -0.3), [$x$])
      content((2.4, 0.5), [$(30-x)/2$])
      content((5.6, 0.5), [$(30-x)/2$])
      
      // Ký hiệu góc vuông
      line((3.2, 0), (3.2, 0.2), (3, 0.2))
      line((4.8, 0), (4.8, 0.2), (5, 0.2))
      
      content((1, 0.5), [$->$])
    })
  ]],
  (
    [10],
    True([15]),
    [12],
    [20]
  ),
  loigiai: [
    - Bề ngang tấm tôn 30 cm, nên phần đáy là $x$, hai cạnh gập lên mỗi cạnh là $(30 - x)/2$.
    - Giả sử gập lên vuông góc, mặt cắt ngang là hình chữ nhật. Chiều rộng là $x$, chiều cao là $(30 - x)/2$.
    - Diện tích mặt cắt $S(x) = x (30 - x)/2 = 1/2 (30x - x^2)$.
    - $S'(x) = 1/2 (30 - 2x) = 0 <=> x = 15$.
    - Lập BBT, ta thấy $S(x)$ đạt lớn nhất khi $x = 15$ cm.
  ]
)

#tn([Một quả bóng được ném thẳng lên trên với vận tốc ban đầu là $v_0 = 20 "m/s"$. Phương trình chuyển động của quả bóng là $h(t) = 20t - 5t^2$ (m). Bóng đạt độ cao lớn nhất sau bao lâu?],
  (
    [1 s],
    True([2 s]),
    [3 s],
    [4 s]
  ),
    loigiai: [
    - Vận tốc $v(t) = h'(t) = 20 - 10t$.
    - Độ cao cực đại khi $v(t) = 0 <=> t = 2$ (giây).
  ]
)

#tn([Sự phát triển của một loại vi khuẩn trong một môi trường nuôi cấy được mô hình hóa bởi hàm số $N(t) = 1000 + 30t^2 - t^3$, trong đó $N(t)$ là số lượng vi khuẩn sau $t$ giờ ($0 <= t <= 30$). Số lượng vi khuẩn lớn nhất đạt được sau bao nhiêu giờ?],
  (
    [10],
    [15],
    True([20]),
    [30]
  ),
    loigiai: [
    - Ta cần tìm cực đại của $N(t)$ trên đoạn $[0; 30]$.
    - Đạo hàm: $N'(t) = 60t - 3t^2 = 3t(20 - t)$.
    - Cho $N'(t) = 0 <=> t = 0$ hoặc $t = 20$.
    - Vì $N''(t) = 60 - 6t$, tại $t=20$ thì $N''(20) = -60 < 0$ (đạt cực đại).
    - Vậy số lượng vi khuẩn đạt đỉnh tại $t = 20$ giờ.
  ]
)

#tn([Một bức tường rào cần sơn với diện tích được chia làm các ô vuông. Nếu sơn $x$ ô vuông mỗi ngày thì chi phí một ô vuông là $P(x) = x^2 - 10x + 50$ nghìn đồng. Để chi phí mỗi ô vuông là nhỏ nhất thì thợ sơn cần hoàn thành bao nhiêu ô mỗi ngày?],
  (
    True([5]),
    [10],
    [15],
    [20]
  ),
    loigiai: [
    - $P'(x) = 2x - 10$.
    - $P'(x) = 0 <=> x = 5$.
    - Khi đó $P(5) = 25 - 50 + 50 = 25$ nghìn đồng.
  ]
)

#tn([Cho đường cong $(C): y = (x^2 + x - 2)/(x - 2)$. Mệnh đề nào sau đây đúng?],
  (
    [$(C)$ không có tiệm cận xiên.],
    True([$(C)$ có tiệm cận xiên là đường thẳng $y = x + 3$.]),
    [$(C)$ có tiệm cận đứng là $x = -2$.],
    [$(C)$ có tiệm cận xiên là $y = x - 3$.]
  ),
    loigiai: [
    - Phép chia đa thức: $x^2 + x - 2 = (x - 2)(x + 3) + 4$.
    - Do đó $y = x + 3 + 4/(x - 2)$. Tiệm cận xiên là $y = x + 3$.
  ]
)

#tn([Tìm giá trị lớn nhất $M$ của hàm số $y = x - sin x$ trên đoạn $[0; pi]$.],
  (
    [$0$],
    [$1$],
    True([$pi$]),
    [$pi/2$]
  ),
    loigiai: [
    - Đạo hàm $y' = 1 - cos x >= 0$ với mọi $x$.
    - Hàm số đồng biến trên $[0; pi]$, nên $M = y(pi) = pi - 0 = pi$.
  ]
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: 4,
  reset-counter: true,
)

#ds(
  [Một công ty du lịch thiết kế một loại lều cắm trại hình chóp tứ giác đều có đáy là hình vuông. Diện tích vải bạt (không tính đáy) để làm lều là $16 "m"^2$. Gọi $x$ là độ dài cạnh đáy, $h$ là đường cao lều. Xét các phát biểu sau:],
  (
    True([Diện tích vải bạt tính bằng công thức $S = x sqrt(4h^2 + x^2)$.]),
    [Thể tích lều đạt giá trị lớn nhất khi $x = 4/3$ (mét).],
    [Để không gian lều là lớn nhất, chiều cao lều $h$ phải bằng $sqrt(2)/3$ (mét).],
    [Bài toán này không tồn tại giá trị lớn nhất vì $x$ có thể lớn tùy ý.]
  ),
    loigiai: [
    - Diện tích vải bạt (4 tam giác cân): Cạnh đáy $x$, trung đoạn $d = sqrt(h^2 + (x/2)^2)$. Diện tích $S = 4 times 1/2 times x times sqrt(h^2 + x^2/4) = x sqrt(4h^2 + x^2)$. Phát biểu a ĐÚNG.
  ]
)

#ds([Một quả bóng được ném lên trên không. Chiều cao của quả bóng (tính bằng mét) sau $t$ giây kể từ khi ném được cho bởi hàm số $h(t) = -5t^2 + 20t + 2$. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Độ cao ban đầu khi ném bóng là 2 mét.]),
    True([Vận tốc của quả bóng tại thời điểm $t=1$ giây là 10 m/s.]),
    [Quả bóng đạt độ cao lớn nhất tại $t=3$ giây.],
    True([Độ cao lớn nhất mà quả bóng đạt được là 22 mét.]),
  ),
    loigiai: [
    - a) Tại $t=0$, $h(0) = 2$. (Đúng)
    - b) Vận tốc $v(t) = h'(t) = -10t + 20$. Tại $t=1$, $v(1) = 10$. (Đúng)
    - c) Bóng đạt đỉnh khi $v(t) = 0 <=> -10t + 20 = 0 <=> t = 2$ giây. Phát biểu cho t=3 là Sai.
    - d) Tại $t=2$, độ cao lớn nhất là $h(2) = -5(4) + 20(2) + 2 = 22$ mét. (Đúng)
  ]
)

#ds(
  [Mực nước thủy triều $h(t)$ (mét) tại một cảng biển từ 0 giờ đến 8 giờ ($0 <= t <= 8$) được mô phỏng bằng hàm số $h(t) = -1/3 t^3 + 4t^2 - 12t + 20$. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Mực nước tại cảng biển lúc 0 giờ là 20 mét.]),
    True([Mực nước rút xuống thấp nhất vào lúc 2 giờ.]),
    True([Mực nước cao nhất trong khoảng thời gian từ 0 đến 8 giờ là 20 mét.]),
    True([Tốc độ dâng của mực nước đạt giá trị lớn nhất vào lúc 4 giờ.])
  ),
    loigiai: [
    - a) Tại $t=0$, $h(0) = 20$ (Đúng).
    - b) Đạo hàm: $h'(t) = -t^2 + 8t - 12 = -(t-2)(t-6)$. Cho $h'(t) = 0 <=> t = 2$ hoặc $t = 6$. Từ BBT, mực nước giảm từ $t=0$ đến $t=2$ nên thấp nhất lúc 2 giờ. (Đúng)
    - c) $h(0) = 20$, $h(2) = 28/3 approx 9.33$, $h(6) = 20$, $h(8) = 28/3 approx 9.33$. Giá trị lớn nhất là 20. (Đúng)
    - d) Tốc độ dâng là $v(t) = h'(t) = -t^2 + 8t - 12$. Vận tốc đạt cực đại khi $v'(t) = -2t + 8 = 0 <=> t = 4$. (Đúng)
  ]
)

#ds(
  [Một lượng thuốc được tiêm vào máu bệnh nhân. Nồng độ thuốc (mg/L) sau $t$ giờ là $C(t) = (10t)/(t^2 + 4)$. Xét các phát biểu sau:],
  (
    [Nồng độ thuốc cao nhất sau 4 giờ.],
    True([Nồng độ thuốc đạt mức tối đa là 2.5 mg/L.]),
    True([Sau một thời gian rất dài ($t -> +oo$), nồng độ thuốc trong máu tiến về 0.]),
    [Tốc độ giảm nồng độ thuốc lớn nhất xảy ra vào giờ thứ 2.]
  ),
    loigiai: [
    - $C'(t) = (10(t^2+4) - 10t(2t))/(t^2+4)^2 = (40 - 10t^2)/(t^2+4)^2$.
    - $C'(t) = 0 <=> t = 2$. Vậy max ở $t=2$, $C(2) = 20/8 = 2.5$.
  ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
  count: 6,
  reset-counter: true,
)

#tln([Tìm tiệm cận xiên của đồ thị hàm số $y = (x^2 + 2x - 3)/(x + 1)$. Đường tiệm cận xiên đi qua điểm $A(0; y_0)$. Giá trị $y_0$ bằng bao nhiêu?],
  [1],
    loigiai: [
    $x^2 + 2x - 3 = (x+1)(x+1) - 4$. Tiệm cận xiên $y = x + 1$. Tại $x=0$, $y=1$.
  ]
)

#tln([Một ngọn hải đăng nằm ở vị trí A cách bờ biển (đường thẳng) 4 km. Trên bờ biển có một trạm phát điện B cách điểm H (hình chiếu của A trên bờ biển) 10 km. Người ta muốn kéo cáp điện từ B đến một điểm M trên đoạn thẳng HB rồi từ M kéo cáp ngầm dưới biển đến A. Biết chi phí kéo cáp trên bờ là 3000 USD/km và dưới biển là 5000 USD/km. Hỏi khoảng cách HM bằng bao nhiêu km để tổng chi phí kéo cáp là thấp nhất?],
  [3],
    loigiai: [
    - Gọi khoảng cách HM là $x$ (km), $0 <= x <= 10$. Quãng đường kéo cáp dưới biển là $"AM" = sqrt(x^2 + 16)$. Quãng đường trên bờ là $"MB" = 10 - x$.
    - Tổng chi phí (đơn vị 1000 USD): $C(x) = 5 sqrt(x^2 + 16) + 3(10 - x)$.
    - Đạo hàm: $C'(x) = (5x)/sqrt(x^2 + 16) - 3$.
    - Cho $C'(x) = 0 <=> 5x = 3 sqrt(x^2 + 16) <=> 25x^2 = 9(x^2 + 16) <=> 16x^2 = 144 <=> x = 3$.
    - Vậy để chi phí thấp nhất thì khoảng cách HM bằng 3 km.
  ]
)

#tln([Một công ty sản xuất thùng chứa dạng hình trụ tròn xoay có nắp đậy với thể tích cố định là $16pi$ $m^3$. Gọi $x$ (m) là bán kính đáy của thùng. Để chi phí sản xuất thùng là thấp nhất (nghĩa là diện tích toàn phần nhỏ nhất), thì bán kính $x$ phải bằng bao nhiêu mét?],
  [2],
    loigiai: [
    - Thể tích thùng $V = pi x^2 h = 16pi => h = 16/x^2$.
    - Diện tích toàn phần (bao gồm 2 đáy và mặt xung quanh): $S = 2pi x^2 + 2pi x h = 2pi (x^2 + 16/x)$.
    - Hàm số $f(x) = x^2 + 16/x$ với $x > 0$. 
    - Đạo hàm $f'(x) = 2x - 16/x^2$. 
    - $f'(x) = 0 <=> 2x^3 = 16 <=> x = 2$.
    - Lập bảng biến thiên, ta thấy $f(x)$ đạt cực tiểu tại $x = 2$.
    - Bán kính đáy cần tìm là 2 m.
  ]
)

#tln([Một cửa hàng bán lẻ mua một sản phẩm với giá nhập là 40 nghìn đồng. Theo khảo sát thị trường, nếu bán với giá $x$ nghìn đồng, mỗi ngày cửa hàng sẽ bán được $120 - x$ sản phẩm ($40 < x < 120$). Cửa hàng nên bán với giá bao nhiêu nghìn đồng để lợi nhuận mỗi ngày là lớn nhất?],
  [80],
    loigiai: [
    - Lợi nhuận mỗi sản phẩm là $x - 40$ nghìn đồng.
    - Số lượng bán ra là $120 - x$.
    - Lợi nhuận tổng: $P(x) = (x - 40)(120 - x) = -x^2 + 160x - 4800$.
    - Đạo hàm: $P'(x) = -2x + 160 = 0 <=> x = 80$.
    - Vậy để lợi nhuận lớn nhất, cửa hàng cần bán với giá 80 nghìn đồng.
  ]
)

#tln([Một quần thể vi khuẩn được cấy vào một môi trường dinh dưỡng. Số lượng vi khuẩn $N(t)$ sau $t$ giờ được ước tính theo công thức $N(t) = (1000t)/(t^2 + 1) + 200$. Số lượng vi khuẩn cao nhất mà quần thể có thể đạt tới là bao nhiêu?],
  [700],
  loigiai: [
    - Ta cần tìm giá trị lớn nhất của hàm số $N(t)$ với $t > 0$.
    - Đạo hàm: $N'(t) = (1000(t^2 + 1) - 1000t(2t))/(t^2 + 1)^2 = (1000(1 - t^2))/(t^2 + 1)^2$.
    - Cho $N'(t) = 0 <=> 1 - t^2 = 0 <=> t = 1$.
    - Lập bảng biến thiên, ta thấy $N(t)$ đạt lớn nhất tại $t = 1$.
    - Số lượng lớn nhất: $N(1) = 1000/2 + 200 = 700$ (vi khuẩn).
  ]
)

#tln([Biết rằng nồng độ cồn trong máu người (mg/mL) sau khi uống rượu $t$ giờ (với $t > 0$) được tính bằng công thức $C(t) = 0.5 t e^(-t/3)$. Sau bao lâu kể từ khi uống thì nồng độ cồn trong máu đạt mức cao nhất (giờ)?],
  [3],
  loigiai: [
    - Sử dụng quy tắc đạo hàm của tích số: $(u v)' = u'v + u v'$.
    - Đạo hàm: $C'(t) = 0.5 [1 times e^(-t/3) + t times (-1/3) e^(-t/3)] = 0.5 e^(-t/3) (1 - t/3)$.
    - Cho $C'(t) = 0 <=> 1 - t/3 = 0 <=> t = 3$.
    - Lập bảng xét dấu, ta thấy $C'(t) > 0$ khi $t < 3$ và $C'(t) < 0$ khi $t > 3$. Do đó nồng độ đạt cực đại tại $t=3$.
    - Vậy sau 3 giờ thì nồng độ cồn trong máu cao nhất.
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
