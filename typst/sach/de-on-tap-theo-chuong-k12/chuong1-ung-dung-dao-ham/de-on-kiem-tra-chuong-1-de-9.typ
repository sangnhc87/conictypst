#import "@preview/sang-math:1.0.6": *
#import "../../../../public/hdsd/typst/sang-math-geom.typ": *
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
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 9",
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

#tn([Trong nông nghiệp, năng suất lúa (tấn/ha) phụ thuộc vào lượng phân bón $x$ (kg/ha) theo mô hình $N(x) = -0.001x^2 + 0.4x + 10$. Tuy nhiên, để tối ưu hóa lợi nhuận kinh tế, nông dân phải trừ đi chi phí phân bón. Biết mỗi tấn lúa bán được 6 triệu đồng, mỗi kg phân bón giá 0.02 triệu đồng (20 nghìn đồng). Nông dân nên bón bao nhiêu kg phân bón cho mỗi hecta để lợi nhuận thu được lớn nhất?],
  (
    [150],
    True([198.33]),
    [200],
    [180],
  ),
    loigiai: [
    - Doanh thu: $6 times N(x) = 6(-0.001x^2 + 0.4x + 10) = -0.006x^2 + 2.4x + 60$ (triệu đồng).
    - Chi phí: $0.02x$ (triệu đồng).
    - Lợi nhuận: $L(x) = -0.006x^2 + 2.4x + 60 - 0.02x = -0.006x^2 + 2.38x + 60$.
    - $L'(x) = -0.012x + 2.38 = 0 <=> x = 2.38 / 0.012 = 1190 / 6 = 198.33$ kg.
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

#tn([Mức độ ô nhiễm không khí tại một thành phố tính từ 6 giờ sáng đến 6 giờ chiều (12 giờ) được mô hình hóa bởi hàm số $P(t) = -1/3 t^3 + 4t^2 + 10$ với $t$ là số giờ tính từ mốc 6 giờ sáng ($0 <= t <= 12$). Mức ô nhiễm cao nhất trong ngày đạt được vào lúc mấy giờ?],
  (
    [8 giờ sáng],
    [10 giờ sáng],
    [12 giờ trưa],
    True([14 giờ chiều])
  ),
    loigiai: [
    - Ta cần tìm cực đại của hàm số $P(t)$ trên đoạn $[0; 12]$.
    - Đạo hàm: $P'(t) = -t^2 + 8t$.
    - $P'(t) = 0 <=> -t(t - 8) = 0 <=> t = 0$ hoặc $t = 8$.
    - Bảng biến thiên cho thấy hàm số đạt giá trị lớn nhất tại $t = 8$.
    - Thời điểm đó là 6 giờ sáng + 8 giờ = 14 giờ chiều.
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

#ds([Một bồn chứa hóa chất có hình trụ tròn xoay (được đậy nắp kín) có dung tích không đổi là $V = 16pi$ m³. Để làm mặt xung quanh bồn, vật liệu có giá 200 nghìn đồng/m², còn làm hai mặt đáy (cả nắp) vật liệu có giá 400 nghìn đồng/m². Đặt $R$ (m) là bán kính đáy, $h$ (m) là chiều cao của bồn. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Thể tích $V = pi R^2 h => h = 16 / R^2$.]),
    True([Chi phí vật liệu làm hai mặt đáy là $800pi R^2$ (nghìn đồng).]),
    [Để chi phí thấp nhất, bán kính đáy phải bằng 2 mét.],
    [Chi phí thấp nhất đạt được khi $h = root(3, 4)$ mét.],
  ),
    loigiai: [

        
    - a) Thể tích trụ: $V = pi R^2 h = 16pi => h = 16/R^2$. (Đúng)
    - b) Diện tích hai đáy là $2pi R^2$. Chi phí làm 2 đáy là $400 times 2pi R^2 = 800pi R^2$. (Đúng)
    - c) Diện tích xung quanh là $2pi R h = 2pi R (16/R^2) = 32pi/R$. Chi phí xung quanh là $200 times 32pi/R = 6400pi/R$.
      Tổng chi phí $C(R) = 800pi R^2 + 6400pi/R$.
      Đạo hàm $C'(R) = 1600pi R - 6400pi/R^2 = 0 <=> R^3 = 4 <=> R = root(3, 4) approx 1.587$ m. Phát biểu C sai.
    - d) Khi $R = root(3, 4)$, $h = 16/R^2 = 16/4^{2/3} = 4root(3, 4)$. Phát biểu D sai.
  ]
)

#ds(
  [Nhiệt độ $T$ (độ C) trong một ngày tại một địa phương từ 6 giờ sáng đến 18 giờ tối được mô tả bởi hàm số $T(t) = -0.1t^2 + 1.6t + 25$, với $t$ là số giờ tính từ mốc 6 giờ sáng ($0 <= t <= 12$). Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nhiệt độ tại địa phương lúc 6 giờ sáng là 25 độ C.]),
    True([Tốc độ thay đổi nhiệt độ tại thời điểm $t$ là $T'(t) = -0.2t + 1.6$.]),
    [Nhiệt độ trong ngày đạt mức cao nhất vào lúc 12 giờ trưa.],
    True([Nhiệt độ cao nhất trong ngày là 31.4 độ C.])
  ),
    loigiai: [
    - a) Tại $t=0$ (6 giờ sáng), $T(0) = 25$ độ C. (Đúng)
    - b) Đạo hàm: $T'(t) = -0.2t + 1.6$. (Đúng)
    - c) $T'(t) = 0 <=> -0.2t + 1.6 = 0 <=> t = 8$. Nhiệt độ đạt mức cao nhất sau 8 giờ kể từ 6 giờ sáng, tức là 14 giờ chiều (không phải 12 giờ trưa). (Sai)
    - d) Tại $t=8$, $T(8) = -0.1(64) + 1.6(8) + 25 = -6.4 + 12.8 + 25 = 31.4$ độ C. (Đúng)
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

#tln([Một công ty quảng cáo cần sơn một tấm biển hình chữ nhật có diện tích là $8 "m"^2$. Biển quảng cáo được thiết kế với viền trống ở trên và dưới mỗi viền rộng $0.5$ m, viền trống ở hai bên mỗi viền rộng $1$ m. Phần còn lại ở giữa là khu vực để in nội dung. Hỏi chiều rộng của toàn bộ tấm biển quảng cáo phải bằng bao nhiêu mét để diện tích khu vực in nội dung là lớn nhất?],
  [4],
    loigiai: [
    - Gọi $x$ (m) là chiều rộng của tấm biển, $y$ (m) là chiều cao của tấm biển ($x > 2, y > 1$).
    - Theo đề bài: $x y = 8 => y = 8/x$.
    - Kích thước khu vực in nội dung: chiều rộng là $x - 2$, chiều cao là $y - 1$.
    - Diện tích khu vực in: $S(x) = (x - 2)(y - 1) = (x - 2)(8/x - 1) = 8 - x - 16/x + 2 = 10 - (x + 16/x)$.
    - Để $S(x)$ lớn nhất thì $x + 16/x$ nhỏ nhất.
    - Áp dụng BĐT Cauchy: $x + 16/x >= 2 sqrt(x(16/x)) = 8$.
    - Dấu "=" xảy ra khi $x = 16/x <=> x^2 = 16 <=> x = 4$.
    - Vậy chiều rộng tấm biển bằng 4 m thì diện tích phần in lớn nhất.
  ]
)

#tln([Một lều cắm trại có hình dạng là một lăng trụ đứng tam giác. Hai mặt bên của lều là hai tấm vải hình chữ nhật được ghép lại tạo thành hình chữ V ngược. Mỗi tấm vải có chiều dài 3 m và chiều rộng 2 m. (Chiều dài lều là 3m, độ dài cạnh dốc của tam giác thiết diện là 2m). Thể tích của không gian bên trong lều có thể đạt giá trị lớn nhất bằng bao nhiêu (mét khối)?],
  [6],
    loigiai: [
    - Thiết diện ngang của lều là một tam giác cân có hai cạnh bên bằng 2 m. Gọi $x$ là nửa cạnh đáy của tam giác ($0 < x < 2$).
    - Chiều cao của tam giác là $h = sqrt(4 - x^2)$.
    - Diện tích tam giác đáy: $S(x) = 1/2 (2x) h = x sqrt(4 - x^2)$.
    - Ta có $S^2(x) = x^2 (4 - x^2)$. Áp dụng BĐT Cauchy: $x^2 (4 - x^2) <= ((x^2 + 4 - x^2)/2)^2 = 4$.
    - Do đó $S^2(x) <= 4 => S(x) <= 2$. Dấu "=" xảy ra khi $x^2 = 4 - x^2 <=> x^2 = 2 <=> x = sqrt(2)$.
    - Diện tích đáy lớn nhất là 2 $m^2$.
    - Thể tích lớn nhất của lều là $V = S_{max} times 3 = 2 times 3 = 6 "m"^3$.
  ]
)

#tln([Một người nông dân dự định dùng 60 mét lưới rào để rào một mảnh vườn hình chữ nhật tựa vào một bức tường đá có sẵn (phía tựa vào tường không cần rào lưới). Diện tích lớn nhất của mảnh vườn có thể rào được là bao nhiêu mét vuông?],
  [450],
    loigiai: [
    - Gọi $x$ (m) là chiều rộng (cạnh vuông góc với tường), $y$ (m) là chiều dài (cạnh song song với tường) ($x>0, y>0$).
    - Chiều dài lưới rào là: $2x + y = 60 => y = 60 - 2x$. Điều kiện: $0 < 2x < 60 <=> 0 < x < 30$.
    - Diện tích mảnh vườn: $S(x) = x y = x(60 - 2x) = -2x^2 + 60x$.
    - Đạo hàm: $S'(x) = -4x + 60 = 0 <=> x = 15$.
    - $S(15) = -2(15)^2 + 60(15) = -450 + 900 = 450$.
    - Vì đồ thị $S(x)$ là parabol bề lõm hướng xuống nên $S$ đạt giá trị lớn nhất tại $x=15$. 
    - Diện tích lớn nhất là $450 "m"^2$.
  ]
)

#tln([Doanh thu của một cửa hàng khi bán một loại sản phẩm với giá $x$ (nghìn đồng/sản phẩm) được tính theo mô hình $R(x) = x(200 - x)$, trong đó $(200 - x)$ là số lượng sản phẩm dự kiến bán được. Biết chi phí nhập vào cho mỗi sản phẩm là 40 nghìn đồng. Lợi nhuận lớn nhất cửa hàng thu được từ loại sản phẩm này là bao nhiêu nghìn đồng?],
  [6400],
  loigiai: [
    - Gọi $q = 200 - x$ là số lượng sản phẩm bán ra.
    - Lợi nhuận = Doanh thu - Chi phí = $R(x) - 40q = x(200 - x) - 40(200 - x)$.
    - Hàm lợi nhuận theo giá bán $x$: $P(x) = (x - 40)(200 - x) = -x^2 + 240x - 8000$.
    - Đạo hàm: $P'(x) = -2x + 240 = 0 <=> x = 120$.
    - Hàm số bậc hai có hệ số $a < 0$ nên đạt lớn nhất tại $x = 120$.
    - Lợi nhuận lớn nhất: $P(120) = -120^2 + 240(120) - 8000 = 6400$ (nghìn đồng).
  ]
)

#tln([Một hồ chứa nước bị ô nhiễm với lượng chất độc là 100 kg. Người ta bắt đầu xử lý bằng cách đồng thời bơm nước sạch vào hồ và xả nước từ hồ ra ngoài với cùng tốc độ. Lượng chất độc còn lại trong hồ sau $t$ giờ được mô hình hóa theo công thức $M(t) = 100(1/2)^(t/5)$ (kg). Hỏi tốc độ xả chất độc ra khỏi hồ (tốc độ thay đổi của lượng chất độc) tại thời điểm $t = 5$ giờ là bao nhiêu kg/giờ? (Lấy $ln 2 approx 0.693$, kết quả làm tròn đến 1 chữ số thập phân).],
  [6.9],
  loigiai: [
    - Tốc độ thay đổi lượng chất độc là đạo hàm của hàm $M(t)$.
    - $M'(t) = 100 ((1/2)^(t/5))' = 100 (1/2)^(t/5) ln(1/2) times (1/5) = -20 (1/2)^(t/5) ln 2$.
    - Tại thời điểm $t = 5$, ta có $M'(5) = -20 (1/2)^(5/5) ln 2 = -20 (1/2) (0.693) = -6.93$.
    - Giá trị âm thể hiện lượng chất độc đang giảm đi. Tốc độ xả chất độc ra khỏi hồ là $6.93$ kg/giờ.
    - Làm tròn đến một chữ số thập phân, ta được 6.9.
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
