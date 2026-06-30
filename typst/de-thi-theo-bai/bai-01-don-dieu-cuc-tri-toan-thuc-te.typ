#import "../sang-exam.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let mode = "dethi"
#let accent = classic.blue
#let math-color = rgb("#000000")
#show math.equation: set text(fill: math-color)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "BỘ GIÁO DỤC VÀ ĐÀO TẠO",
  school: "GV Nguyễn Văn Sang",
  exam-title: "BÀI 1: TÍNH ĐƠN ĐIỆU VÀ CỰC TRỊ CỦA HÀM SỐ (ĐỀ 4 - TOÁN THỰC TẾ)",
  subject: "TOÁN - LỚP 12",
  duration: "90 phút",
  structure: auto,
  code: "104",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  header-border: true,
)

#exam-part(
  [Phần I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
)

#tn(
  [Sự phân rã của một chất phóng xạ được mô hình hóa bởi hàm số $m(t) = 100 dot 2^(-t/5)$ trong đó $t$ tính bằng năm và $m(t)$ tính bằng gam. Khẳng định nào sau đây đúng về hàm số $m(t)$?],
  (
    [Hàm số đồng biến trên $[0; +oo)$.],
    True([Hàm số nghịch biến trên $[0; +oo)$.]),
    [Hàm số đạt cực đại tại $t=5$.],
    [Hàm số không đơn điệu trên $[0; +oo)$.],
  ),
  loigiai: [
    #step[Tính đạo hàm]
    Ta có $m'(t) = 100 dot 2^(-t/5) dot ln(2) dot (-1/5) < 0$ với mọi $t >= 0$.
    Do đó, khối lượng chất phóng xạ liên tục giảm theo thời gian. 
    Vậy hàm số nghịch biến trên $[0; +oo)$.
  ]
)

#tn(
  [Một công ty sản xuất một loại sản phẩm. Chi phí trung bình để sản xuất $x$ sản phẩm được cho bởi hàm số $C(x) = (x^2 + 50x + 400)/x$ (đơn vị: nghìn đồng). Chi phí trung bình đạt cực tiểu khi công ty sản xuất bao nhiêu sản phẩm?],
  (
    [$10$],
    True([$20$]),
    [$50$],
    [$400$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm chi phí trung bình]
    Ta có $C(x) = x + 50 + 400/x$.
    Đạo hàm $C'(x) = 1 - 400/x^2$.
    Cho $C'(x) = 0 <=> 1 = 400/x^2 <=> x^2 = 400 <=> x = 20$ (do $x > 0$).
    Qua $x=20$ đạo hàm đổi dấu từ âm sang dương nên chi phí đạt cực tiểu tại $x=20$.
  ]
)

#tn(
  [Một nhà nghiên cứu theo dõi số lượng vi khuẩn trong một mẫu cấy sau $t$ giờ. Số lượng vi khuẩn được ước lượng bằng hàm số $N(t) = 5000 + 200t - 5t^2$ với $0 <= t <= 30$. Hỏi số lượng vi khuẩn bắt đầu suy giảm từ giờ thứ mấy?],
  (
    [$t = 10$],
    [$t = 15$],
    True([$t = 20$]),
    [$t = 25$],
  ),
  loigiai: [
    #step[Khảo sát sự thay đổi số lượng]
    Tính đạo hàm $N'(t) = 200 - 10t$.
    Cho $N'(t) = 0 <=> 10t = 200 <=> t = 20$.
    Khi $t < 20$, $N'(t) > 0$ nên vi khuẩn tăng lên.
    Khi $t > 20$, $N'(t) < 0$ nên vi khuẩn giảm đi.
    Vậy vi khuẩn bắt đầu suy giảm từ giờ thứ 20.
  ]
)

#tn(
  [Hàm số $P(x) = -x^3 + 1200x^2 - 1000$ biểu diễn lợi nhuận (nghìn đồng) của một công ty khi bán $x$ chiếc điện thoại. Lợi nhuận của công ty tăng trong khoảng sản xuất nào?],
  (
    [$(800; +oo)$],
    [$(0; 400)$],
    True([$(0; 800)$]),
    [$(800; 1200)$],
  ),
  loigiai: [
    #step[Xác định khoảng đồng biến]
    Ta có $P'(x) = -3x^2 + 2400x$.
    $P'(x) > 0 <=> -3x(x - 800) > 0 <=> 0 < x < 800$.
    Vậy lợi nhuận tăng khi bán từ 0 đến 800 chiếc điện thoại.
  ]
)

#tn(
  [Sức mua của một mặt hàng phụ thuộc vào giá bán $p$ (nghìn đồng) theo hàm số $D(p) = 5000/(p+10)$. Nhận xét nào sau đây phản ánh đúng tình hình sức mua?],
  (
    [Giá càng tăng thì sức mua càng tăng.],
    [Sức mua đạt cực đại tại $p = 10$.],
    [Sức mua tăng đến khi $p=10$ rồi giảm.],
    True([Giá càng tăng thì sức mua càng giảm.]),
  ),
  loigiai: [
    #step[Khảo sát hàm số]
    Tính đạo hàm $D'(p) = (-5000)/(p+10)^2 < 0$ với mọi $p > 0$.
    Hàm số $D(p)$ luôn nghịch biến, nghĩa là giá $p$ càng tăng thì $D(p)$ càng giảm.
  ]
)

#tn(
  [Độ cao của một vật bị ném thẳng đứng lên trên được cho bởi phương trình $h(t) = -5t^2 + 40t + 2$ (mét), với $t$ là thời gian tính bằng giây. Vật đạt độ cao cực đại tại thời điểm nào?],
  (
    [$t = 2$],
    True([$t = 4$]),
    [$t = 5$],
    [$t = 8$],
  ),
  loigiai: [
    #step[Tìm điểm cực đại]
    Đạo hàm $h'(t) = -10t + 40$.
    Cho $h'(t) = 0 <=> 10t = 40 <=> t = 4$.
    Vì $h''(t) = -10 < 0$ nên $h(t)$ đạt cực đại tại $t=4$.
  ]
)

#tn(
  [Một quả bóng xì hơi làm thể tích của nó giảm theo thời gian bởi hàm số $V(t) = 100 - 10t + 0.2t^2$ (với $0 <= t <= 25$). Trong khoảng thời gian nào thể tích quả bóng giảm?],
  (
    [$(0; 10)$],
    [$(10; 25)$],
    True([$(0; 25)$]),
    [$(0; 20)$],
  ),
  loigiai: [
    #step[Tính vận tốc xì hơi]
    $V'(t) = -10 + 0.4t$.
    Trong khoảng $0 <= t <= 25$, giá trị lớn nhất của $0.4t$ là $0.4 dot 25 = 10$.
    Nên $V'(t) < 0$ với mọi $t in (0; 25)$.
    Khoan, tại $t=25$, $V'(25) = 0$. 
    Do đó hàm số nghịch biến trên toàn bộ khoảng $(0; 25)$.
    Thể tích giảm trong suốt quá trình.
  ]
)

#tn(
  [Nồng độ một loại thuốc trong máu sau khi tiêm $t$ giờ được mô tả bởi $C(t) = (5t)/(t^2 + 1)$. Nồng độ thuốc trong máu tăng trong khoảng thời gian nào?],
  (
    True([$(0; 1)$]),
    [$(1; +oo)$],
    [$(0; 5)$],
    [$(0; 2)$],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm nồng độ]
    $C'(t) = (5(t^2 + 1) - 5t(2t))/(t^2 + 1)^2 = (5t^2 + 5 - 10t^2)/(t^2+1)^2 = (5 - 5t^2)/(t^2+1)^2$.
    Nồng độ thuốc tăng khi $C'(t) > 0 <=> 5 - 5t^2 > 0 <=> t^2 < 1 <=> 0 < t < 1$ (do $t > 0$).
  ]
)

#tn(
  [Tốc độ gió $v(t)$ (km/h) trong một cơn bão sau $t$ giờ kể từ khi bão đổ bộ được cho bởi hàm số $v(t) = -t^3 + 6t^2 + 15t + 20$. Tốc độ gió tăng lên trong khoảng thời gian nào?],
  (
    [$(0; 2)$],
    [$(2; +oo)$],
    True([$(0; 5)$]),
    [$(5; +oo)$],
  ),
  loigiai: [
    #step[Xét khoảng đồng biến]
    Tính gia tốc (sự thay đổi của tốc độ): $v'(t) = -3t^2 + 12t + 15$.
    Tốc độ gió tăng khi $v'(t) > 0 <=> -3t^2 + 12t + 15 > 0 <=> t^2 - 4t - 5 < 0 <=> -1 < t < 5$.
    Do thời gian $t > 0$, nên khoảng thời gian tăng là $(0; 5)$.
  ]
)

#tn(
  [Dân số của một thành phố trong tương lai được dự đoán theo mô hình $P(t) = 100 + (20t)/(t+5)$ (nghìn người), với $t$ là số năm tính từ hiện tại. Khẳng định nào sau đây đúng?],
  (
    [Dân số giảm theo thời gian.],
    True([Dân số tăng theo thời gian nhưng không vượt quá 120 nghìn người.]),
    [Dân số tăng vô hạn.],
    [Dân số đạt cực đại vào năm thứ 5.],
  ),
  loigiai: [
    #step[Xét đạo hàm và giới hạn]
    $P'(t) = (20(t+5) - 20t)/(t+5)^2 = 100/(t+5)^2 > 0$.
    Hàm số luôn đồng biến trên $[0; +oo)$, nghĩa là dân số liên tục tăng.
    Tuy nhiên khi $t -> +oo$, $P(t) -> 100 + 20 = 120$.
    Nghĩa là dân số có giới hạn tối đa (tiệm cận ngang) là 120 nghìn người.
  ]
)

#tn(
  [Hiệu suất làm việc của một dây chuyền sản xuất sau $t$ giờ làm việc liên tục là $E(t) = -t^3 + 12t^2$ (sản phẩm/giờ). Hiệu suất đạt cực đại tại thời điểm nào?],
  (
    [$t = 4$],
    [$t = 6$],
    True([$t = 8$]),
    [$t = 12$],
  ),
  loigiai: [
    #step[Tính điểm cực đại]
    $E'(t) = -3t^2 + 24t$.
    Cho $E'(t) = 0 <=> 3t(8 - t) = 0 <=> t=0$ hoặc $t=8$.
    Qua $t=8$, $E'(t)$ đổi dấu từ dương sang âm nên $E(t)$ đạt cực đại tại $t=8$.
  ]
)

#tn(
  [Độ giảm huyết áp của một bệnh nhân khi dùng $x$ (mg) một loại thuốc là $G(x) = 1/2 x^2 (30 - x)$. Liều lượng thuốc nào sau đây mang lại điểm cực đại cho đồ thị hàm số?],
  (
    [$x = 10$],
    True([$x = 20$]),
    [$x = 30$],
    [$x = 15$],
  ),
  loigiai: [
    #step[Tính điểm cực đại]
    Ta có $G(x) = 15x^2 - 1/2 x^3$.
    $G'(x) = 30x - 3/2 x^2$.
    Cho $G'(x) = 0 <=> x(30 - 3/2 x) = 0 <=> x=0$ hoặc $x=20$.
    Đạo hàm đổi dấu từ dương sang âm tại $x=20$, nên đạt cực đại tại $x=20$.
  ]
)

#exam-part(
  [Phần II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
)

#ds(
  [Một công ty sản xuất một loại tivi. Hàm doanh thu và hàm chi phí (đơn vị: triệu đồng) khi sản xuất và bán ra $x$ chiếc tivi được tính theo công thức: $R(x) = 20x - 0.01x^2$ và $C(x) = 2x + 100$. Gọi $P(x)$ là hàm lợi nhuận của công ty. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Hàm lợi nhuận là $P(x) = -0.01x^2 + 18x - 100$.]),
    True([Lợi nhuận của công ty tăng khi số tivi sản xuất nhỏ hơn 900 chiếc.]),
    [Công ty đạt lợi nhuận cực đại khi sản xuất 1000 tivi.],
    True([Khi sản xuất quá 900 chiếc tivi, lợi nhuận của công ty bắt đầu giảm.]),
  ),
  loigiai: [
    #step[Thiết lập và khảo sát hàm lợi nhuận]
    Lợi nhuận $P(x) = R(x) - C(x) = 20x - 0.01x^2 - (2x + 100) = -0.01x^2 + 18x - 100$. Mệnh đề a) đúng.
    Tính đạo hàm $P'(x) = -0.02x + 18$.
    $P'(x) = 0 <=> 0.02x = 18 <=> x = 900$.
    Khi $x < 900$, $P'(x) > 0$ nên lợi nhuận tăng. Mệnh đề b) đúng.
    Công ty đạt lợi nhuận cực đại tại $x = 900$, không phải 1000. Mệnh đề c) sai.
    Khi $x > 900$, $P'(x) < 0$ nên lợi nhuận bắt đầu giảm. Mệnh đề d) đúng.
  ]
)

#ds(
  [Nồng độ của một loại thuốc giảm đau trong máu của bệnh nhân (tính bằng mg/L) sau khi tiêm $t$ giờ được tính theo công thức $C(t) = (4t)/(t^2 + 4)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tại thời điểm $t = 1$ giờ, nồng độ thuốc trong máu đang có xu hướng tăng.]),
    True([Nồng độ thuốc đạt giá trị cực đại sau khi tiêm 2 giờ.]),
    True([Hàm số $C(t)$ đồng biến trên khoảng $(0; 2)$.]),
    [Sau 2 giờ kể từ khi tiêm, nồng độ thuốc trong máu vẫn tiếp tục tăng.],
  ),
  loigiai: [
    #step[Tính đạo hàm hàm nồng độ]
    $C'(t) = (4(t^2 + 4) - 4t(2t))/(t^2 + 4)^2 = (4t^2 + 16 - 8t^2)/(t^2 + 4)^2 = (16 - 4t^2)/(t^2 + 4)^2$.
    Tại $t=1$, $C'(1) = (16 - 4)/25 = 12/25 > 0$. Nồng độ đang tăng. Mệnh đề a) đúng.
    $C'(t) = 0 <=> 16 - 4t^2 = 0 <=> t = 2$ (do $t > 0$). Qua $t=2$ đạo hàm đổi từ dương sang âm, nên $C(t)$ đạt cực đại. Mệnh đề b) đúng.
    Trên $(0; 2)$ thì $C'(t) > 0$ nên hàm đồng biến. Mệnh đề c) đúng.
    Sau 2 giờ ($t > 2$), $C'(t) < 0$ nên nồng độ giảm. Mệnh đề d) sai.
  ]
)

#ds(
  [Mức độ phản ứng của cơ thể khi sử dụng một loại thuốc với liều lượng $x$ (mg) được đánh giá bởi hàm số $R(x) = x^2 (15 - x)$, với $0 <= x <= 15$. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Đạo hàm của hàm phản ứng là $R'(x) = 30x - 3x^2$.]),
    [Hàm số nghịch biến trên khoảng $(0; 10)$.],
    True([Mức độ phản ứng của cơ thể đạt cực đại khi dùng liều lượng $10$ mg.]),
    [Khi sử dụng liều lượng $12$ mg, phản ứng của cơ thể đang có xu hướng tăng.],
  ),
  loigiai: [
    #step[Khảo sát hàm mức độ phản ứng]
    Ta có $R(x) = 15x^2 - x^3 => R'(x) = 30x - 3x^2$. Mệnh đề a) đúng.
    $R'(x) = 0 <=> 3x(10 - x) = 0 <=> x=0$ hoặc $x=10$.
    Trên khoảng $(0; 10)$, $R'(x) > 0$ nên hàm số đồng biến. Mệnh đề b) sai.
    Đạo hàm đổi dấu từ dương sang âm tại $x=10$, do đó phản ứng đạt cực đại tại $x=10$. Mệnh đề c) đúng.
    Tại $x=12$, ta có $12 > 10$, nằm trong khoảng nghịch biến nên phản ứng đang giảm. Mệnh đề d) sai.
  ]
)

#ds(
  [Một quả bóng cao su được bơm không khí vào, thể tích của quả bóng $V(t)$ (đơn vị: lít) phụ thuộc vào thời gian $t$ (giây) theo công thức $V(t) = 8t - 0.5 t^2$, với $0 <= t <= 16$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tốc độ thay đổi thể tích là $v(t) = 8 - 0.5t$.],
    True([Thể tích quả bóng liên tục tăng trong 8 giây đầu tiên.]),
    True([Điểm cực đại của đồ thị hàm số thể tích nằm tại $t=8$.]),
    [Thể tích của quả bóng tiếp tục tăng sau giây thứ 8.],
  ),
  loigiai: [
    #step[Tính tốc độ thay đổi thể tích]
    Tốc độ thay đổi thể tích chính là đạo hàm: $V'(t) = 8 - t$. Mệnh đề a) sai (vì $0.5t^2$ đạo hàm là $t$).
    Cho $V'(t) = 0 <=> t = 8$.
    Với $t in (0; 8)$ thì $V'(t) > 0$, quả bóng to lên (tăng thể tích). Mệnh đề b) đúng.
    Tại $t=8$ hàm số đạt cực đại. Mệnh đề c) đúng.
    Với $t > 8$, $V'(t) < 0$ nên quả bóng bắt đầu xẹp đi (thể tích giảm). Mệnh đề d) sai.
  ]
)

#exam-part(
  [Phần III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
)

#tln(
  [Một vật chuyển động với phương trình quãng đường $S(t) = -t^3 + 9t^2 + 24t$, trong đó $t$ tính bằng giây và $S(t)$ tính bằng mét. Vận tốc của vật là đạo hàm của quãng đường. Hỏi tại thời điểm $t$ bằng bao nhiêu giây thì vận tốc của vật đạt điểm cực đại?],
  [$3$],
  loigiai: [
    #step[Tính vận tốc và khảo sát]
    Vận tốc là $v(t) = S'(t) = -3t^2 + 18t + 24$.
    Để tìm vận tốc cực đại, ta xét hàm $v(t)$.
    Đạo hàm của vận tốc (tức gia tốc) là $v'(t) = -6t + 18$.
    $v'(t) = 0 <=> -6t + 18 = 0 <=> t = 3$.
    Bảng biến thiên cho thấy $v(t)$ đạt cực đại tại $t=3$.
  ]
)

#tln(
  [Trong phòng thí nghiệm, số lượng vi khuẩn trong một mẫu nuôi cấy sau $t$ giờ được mô hình hóa bởi hàm số $N(t) = -t^3 + 30t^2 + 1000$. Số lượng vi khuẩn đạt cực đại sau bao nhiêu giờ?],
  [$20$],
  loigiai: [
    #step[Tính đạo hàm để tìm cực đại]
    $N'(t) = -3t^2 + 60t$.
    Cho $N'(t) = 0 <=> 3t(-t + 20) = 0 <=> t = 0$ hoặc $t = 20$.
    Lập bảng biến thiên, ta thấy $N'(t)$ dương khi $0 < t < 20$ và âm khi $t > 20$.
    Nên số lượng vi khuẩn tăng và đạt cực đại tại $t=20$ giờ.
  ]
)

#tln(
  [Hàm lợi nhuận $P(x)$ của một công ty khi bán $x$ sản phẩm là $P(x) = -1/3 x^3 + 1200x^2$. Công ty cần bán ra bao nhiêu sản phẩm để điểm trên đồ thị hàm lợi nhuận đạt cực đại?],
  [$2400$],
  loigiai: [
    #step[Khảo sát hàm lợi nhuận]
    Đạo hàm $P'(x) = -x^2 + 2400x$.
    $P'(x) = 0 <=> x(-x + 2400) = 0 <=> x = 0$ hoặc $x = 2400$.
    Qua $x=2400$, đạo hàm $P'(x)$ đổi dấu từ dương sang âm nên $P(x)$ đạt cực đại.
    Công ty cần bán ra 2400 sản phẩm.
  ]
)

#tln(
  [Sự tăng trưởng của một loại cây được mô phỏng bởi hàm chiều cao $h(t) = -0.1 t^3 + 1.2 t^2 + 5t$ ($t$ tính bằng tuần). Tốc độ tăng trưởng của cây là $v(t) = h'(t)$. Tốc độ tăng trưởng này đạt cực đại vào tuần thứ mấy?],
  [$4$],
  loigiai: [
    #step[Tính hàm tốc độ và cực đại]
    Tốc độ tăng trưởng $v(t) = h'(t) = -0.3 t^2 + 2.4 t + 5$.
    Để tìm cực đại của tốc độ, ta tính đạo hàm $v'(t) = -0.6 t + 2.4$.
    Cho $v'(t) = 0 <=> -0.6 t + 2.4 = 0 <=> t = 4$.
    Vì $v''(t) = -0.6 < 0$ nên tốc độ đạt cực đại vào tuần thứ 4.
  ]
)

#tln(
  [Một công ty sản xuất máy tính. Hàm chi phí trung bình để sản xuất một máy tính là $overline(C)(x) = 2x + (5000)/x$ (đơn vị: trăm nghìn đồng), với $x$ là số máy tính được sản xuất. Công ty cần sản xuất bao nhiêu máy tính để chi phí trung bình là điểm cực tiểu của hàm số?],
  [$50$],
  loigiai: [
    #step[Tính đạo hàm hàm chi phí]
    $overline(C)'(x) = 2 - 5000/x^2$.
    Cho $overline(C)'(x) = 0 <=> 2 = 5000/x^2 <=> x^2 = 2500$.
    Vì $x > 0$ nên $x = 50$.
    Qua $x=50$, đạo hàm đổi từ âm sang dương nên chi phí trung bình đạt cực tiểu tại $x=50$.
  ]
)

#tln(
  [Một loại thuốc được tiêm vào máu của bệnh nhân. Nồng độ thuốc $C(t) = t/(t^2 + 9)$ (mg/L) sau $t$ giờ. Hỏi nồng độ thuốc đạt cực đại sau bao nhiêu giờ?],
  [$3$],
  loigiai: [
    #step[Tính cực đại hàm nồng độ]
    $C'(t) = (1 dot (t^2 + 9) - t dot 2t)/(t^2 + 9)^2 = (9 - t^2)/(t^2 + 9)^2$.
    $C'(t) = 0 <=> 9 - t^2 = 0 <=> t = 3$ (do $t > 0$).
    Qua $t=3$, $C'(t)$ đổi từ dương sang âm, nên nồng độ đạt cực đại sau 3 giờ.
  ]
)
