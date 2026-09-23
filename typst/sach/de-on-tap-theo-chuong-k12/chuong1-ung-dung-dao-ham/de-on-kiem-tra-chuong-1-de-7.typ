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
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 7",
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

#tn([Một đầu máy xe lửa chạy bằng than đi từ ga A đến ga B. Chi phí nhiên liệu (than) tỉ lệ thuận với bình phương vận tốc $v$ (km/h). Khi tàu chạy với vận tốc $40$ km/h thì chi phí nhiên liệu là $160$ nghìn đồng/giờ. Ngoài ra, tàu còn phải chịu các chi phí cố định (nhân công, bảo trì...) là $250$ nghìn đồng/giờ. Hỏi tàu cần chạy với vận tốc bằng bao nhiêu để chi phí tổng cộng trên mỗi km đường là nhỏ nhất?],
  (
    [$40$ km/h],
    True([$50$ km/h]),
    [$60$ km/h],
    [$70$ km/h]
  ),
    loigiai: [
    - Chi phí nhiên liệu mỗi giờ là $k v^2$. Tại $v=40$, $k (40^2) = 160 => k = 0.1$. 
    - Tổng chi phí mỗi giờ: $0.1 v^2 + 250$.
    - Chi phí trên mỗi km đường (thời gian đi 1 km là $1/v$ giờ) là: $C(v) = (0.1 v^2 + 250) / v = 0.1 v + 250/v$.
    - Đạo hàm: $C'(v) = 0.1 - 250/v^2 = 0 <=> v^2 = 2500 <=> v = 50$.
    - Vậy chi phí nhỏ nhất khi $v = 50$ km/h.
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

#tn([Một hồ nuôi cá có sức chứa tối đa là 100 con cá. Nếu thả $x$ con cá vào hồ thì khối lượng trung bình của mỗi con cá sau một vụ thu hoạch (kg/con) được ước tính bởi hàm số $m(x) = 4 - 0.02x$ (với $0 < x <= 100$). Hỏi cần thả bao nhiêu con cá để tổng khối lượng cá thu hoạch được là lớn nhất?],
  (
    [50],
    [80],
    True([100]),
    [200]
  ),
    loigiai: [
    - Tổng khối lượng cá thu hoạch: $M(x) = x(4 - 0.02x) = 4x - 0.02x^2$.
    - Đạo hàm: $M'(x) = 4 - 0.04x = 0 <=> x = 100$.
    - Bảng biến thiên cho thấy cực đại đạt được tại $x = 100$.
    - Vậy cần thả 100 con cá. (Chú ý: Giới hạn của hồ chứa tối đa là 100 con nên thu hoạch lớn nhất cũng đạt ngay ở biên sức chứa).
  ]
)

#tn([Một xưởng in ấn cần thiết kế một tờ áp phích quảng cáo hình chữ nhật có diện tích phần in là 384 cm². Các lề trên và dưới mỗi lề rộng 3 cm, lề trái và phải mỗi lề rộng 2 cm. Để diện tích toàn bộ tờ áp phích là nhỏ nhất (giúp tiết kiệm giấy), kích thước chiều cao (cạnh có lề 3cm) và chiều rộng (cạnh có lề 2cm) của phần in ấn lần lượt là bao nhiêu cm?],
  (
    [20 và 18],
    True([24 và 16]),
    [16 và 24],
    [32 và 12],
  ),
    loigiai: [

        
    - Gọi $x$ và $y$ là chiều cao và chiều rộng của phần in ấn ($x, y > 0$).
    - Ta có diện tích phần in: $x y = 384 => y = 384/x$.
    - Chiều cao toàn bộ tờ giấy: $H = x + 6$. Chiều rộng toàn bộ: $W = y + 4$.
    - Diện tích toàn bộ tờ giấy: $S(x) = (x+6)(y+4) = (x+6)(384/x + 4) = 384 + 4x + 2304/x + 24$.
    - $S'(x) = 4 - 2304/x^2 = 0 <=> x^2 = 576 <=> x = 24$.
    - Khi đó $y = 384/24 = 16$.
  ]
)

#tn([Một công ty điện thoại bán $x$ chiếc điện thoại mỗi tháng với lợi nhuận thu được (tính bằng triệu đồng) mô hình hóa bởi hàm số $P(x) = -1/3 x^3 + 5x^2 + 24x - 10$ ($x > 0$). Số lượng điện thoại bán ra mỗi tháng để công ty thu được lợi nhuận lớn nhất là:],
  (
    [10],
    True([12]),
    [15],
    [8]
  ),
    loigiai: [
    - Đạo hàm: $P'(x) = -x^2 + 10x + 24$.
    - $P'(x) = 0 <=> -x^2 + 10x + 24 = 0 <=> x = 12$ hoặc $x = -2$ (loại).
    - Với $x = 12$, đạo hàm đổi dấu từ dương sang âm nên $P(x)$ đạt cực đại.
    - Vậy lợi nhuận đạt lớn nhất khi bán 12 chiếc.
  ]
)

#tn([Một vật chuyển động trên đường thẳng. Quãng đường vật đi được $s$ (mét) phụ thuộc vào thời gian $t$ (giây) theo phương trình $s(t) = 1/3 t^3 - 2t^2 + 4t + 1$. Vận tốc của vật đạt giá trị nhỏ nhất tại thời điểm $t$ bằng:],
  (
    [1 s],
    True([2 s]),
    [3 s],
    [4 s]
  ),
    loigiai: [
    - Vận tốc $v(t) = s'(t) = t^2 - 4t + 4$.
    - Để tìm vận tốc nhỏ nhất, ta xét hàm $v(t)$.
    - $v(t) = (t - 2)^2 >= 0$. 
    - Vận tốc đạt giá trị nhỏ nhất bằng 0 khi $t = 2$.
  ]
)

#tn([Nồng độ của một loại hóa chất $C(t)$ (đơn vị: mol/L) sinh ra trong một phản ứng hóa học sau $t$ phút kể từ khi bắt đầu phản ứng được cho bởi công thức $C(t) = (2t)/(t^2 + 9)$ (với $t >= 0$). Nồng độ hóa chất đạt giá trị lớn nhất tại thời điểm nào?],
  (
    [1 phút],
    [2 phút],
    True([3 phút]),
    [4 phút]
  ),
    loigiai: [
    - Đạo hàm: $C'(t) = (2(t^2 + 9) - 2t(2t))/(t^2 + 9)^2 = (18 - 2t^2)/(t^2 + 9)^2$.
    - $C'(t) = 0 <=> 18 - 2t^2 = 0 <=> t = 3$ (vì $t >= 0$).
    - Bảng biến thiên cho thấy cực đại tại $t = 3$. 
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
  [Một người thợ cần làm một bể cá cảnh bằng kính (không có nắp đậy) dạng hình hộp chữ nhật có thể tích là $36 "m"^3$. Chiều dài của bể gấp đôi chiều rộng. Gọi $x$ là chiều rộng và $h$ là chiều cao của bể cá. Người thợ muốn thiết kế sao cho diện tích kính sử dụng làm bể là nhỏ nhất (để tiết kiệm chi phí). Xét tính đúng sai của các mệnh đề sau:
  #align(center)[
    #sm-hop-chu-nhat(
      w: 5cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.A, d.B), ten: "2x", huong: "bac", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.B, d.C), ten: "x", huong: "dong-bac", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.A, d.A1), ten: "h", huong: "tay", bk: 0pt)
      }
    )
  ]],
  (
    [Chiều cao của bể cá được biểu diễn theo $x$ là $h = 36/x^2$.],
    True([Hàm số biểu diễn diện tích kính cần dùng theo $x$ là $S(x) = 2x^2 + 108/x$.]),
    True([Diện tích kính nhỏ nhất có thể đạt được là $54 "m"^2$.]),
    [Kích thước chiều cao của bể khi đó là $h = 4 "m"$.]
  ),
    loigiai: [
    - Chiều dài bể là $2x$, chiều rộng $x$. Thể tích $V = (2x) times x times h = 2x^2 h = 36 => h = 18/x^2$. (Mệnh đề (a) Sai).
    - Diện tích kính (không nắp): $S(x) = S_("đáy") + S_("xq") = 2x^2 + 2(2x+x)h = 2x^2 + 6x(18/x^2) = 2x^2 + 108/x$. (Mệnh đề (b) Đúng).
    - Đạo hàm: $S'(x) = 4x - 108/x^2 = 0 <=> 4x^3 = 108 <=> x^3 = 27 <=> x = 3$.
    - Diện tích nhỏ nhất: $S(3) = 2(3)^2 + 108/3 = 18 + 36 = 54$. (Mệnh đề (c) Đúng).
    - Chiều cao khi đó: $h = 18/3^2 = 2 "m"$. (Mệnh đề (d) Sai).
  ]
)

#ds([Một công ty du lịch dự định tổ chức một chuyến tham quan với sức chứa tối đa là 80 người. Nếu giá vé là 500 nghìn đồng/người thì sẽ có đúng 80 người đăng ký. Nghiên cứu cho thấy, cứ tăng giá vé thêm 50 nghìn đồng/người thì số lượng khách đăng ký sẽ giảm đi 4 người. Giả sử chi phí tổ chức cố định là 10 triệu đồng và chi phí phát sinh cho mỗi hành khách là 100 nghìn đồng. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Nếu tăng giá vé thêm 100 nghìn đồng, số khách tham gia là 72 người.]),
    True([Doanh thu cao nhất mà công ty có thể đạt được là 45 triệu đồng.]),
    [Để đạt lợi nhuận lớn nhất, công ty nên tăng giá vé thêm 4 lần (tức x = 4).],
    True([Mức giá vé mang lại lợi nhuận lớn nhất là 800 nghìn đồng/người.]),
  ),
    loigiai: [
    - Đặt $x$ là số lần tăng giá 50 nghìn đồng ($x >= 0$).
    - a) Tăng 100 nghìn ($x=2$), số khách là $80 - 4(2) = 72$ người. (Đúng)
    - b) Giá vé: $500 + 50x$. Số khách: $80 - 4x$. Doanh thu $R(x) = (500+50x)(80-4x) = 40000 + 2000x - 200x^2$. Đỉnh parabol tại $x = 5$. $R(5) = 45000$ nghìn đồng = 45 triệu đồng. (Đúng)
    - c) Tổng chi phí $C(x) = 10000 + 100(80-4x) = 18000 - 400x$. Lợi nhuận $P(x) = R(x) - C(x) = 40000 + 2000x - 200x^2 - (18000 - 400x) = -200x^2 + 2400x + 22000$. Đạo hàm $P'(x) = -400x + 2400 = 0 <=> x = 6$. Vậy x=6 mới đúng, x=4 sai. (Sai)
    - d) Tại $x=6$, giá vé là $500 + 50 times 6 = 800$ nghìn đồng. (Đúng)
  ]
)

#ds(
  [Người ta muốn cắt một tấm tôn hình tròn có bán kính $R = 30$ cm thành một hình quạt để gập lại thành một cái phễu hình nón (không đáy). Gọi $x$ là độ dài cung tròn của hình quạt được cắt ra ($0 < x < 60pi$). Xét các phát biểu sau:
  #align(center)[
    #sm-non(
      w: 4cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: "h", huong: "dong", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.S, d.T1), ten: "R", huong: "tay-nam", bk: 0pt)
      }
    )
  ]],
  (
    True([Bán kính đáy của phễu hình nón tạo thành là $r = x/(2pi)$.]),
    True([Thể tích của khối nón tạo thành được tính bởi $V(r) = 1/3 pi r^2 sqrt(900 - r^2)$.]),
    [Thể tích khối nón lớn nhất khi bán kính đáy $r = 15$ cm.],
    True([Để thể tích phễu lớn nhất, góc ở tâm của hình quạt bị cắt đi xấp xỉ $66^circ$.])
  ),
    loigiai: [
    - Chu vi đáy nón chính là cung tròn của quạt: $2pi r = x => r = x/(2pi)$. (a Đúng).
    - Đường sinh của nón chính là $R=30$. Chiều cao nón $h = sqrt(30^2 - r^2) = sqrt(900 - r^2)$.
    - Thể tích: $V(r) = 1/3 pi r^2 sqrt(900 - r^2)$. (b Đúng).
    - Xét hàm $f(r) = r^4 (900 - r^2) = 900r^4 - r^6$. $f'(r) = 3600r^3 - 6r^5 = 0 <=> r^2 = 600 <=> r = 10 sqrt(6) approx 24.5$. (c Sai).
    - Khi đó chu vi đáy là $2pi (10 sqrt(6))$. Cung của phần giữ lại là $x = 2pi (10 sqrt(6))$. Góc ở tâm phần giữ lại: $alpha = x / R = (2pi (10 sqrt(6)))/30 = (2pi sqrt(6))/3$ radian.
    - Góc phần quạt bị cắt đi: $2pi - alpha = 2pi (1 - sqrt(6)/3) approx 1.15$ radian $approx 66^circ$. (d Đúng).
  ]
)

#ds(
  [Sự thay đổi nhiệt độ ngoài trời $T$ (độ C) trong một ngày mùa hè tại một thành phố được mô hình hóa bởi hàm số lượng giác $T(t) = 22 + 6 sin(pi/12 (t - 8))$, trong đó $t$ là thời gian tính bằng giờ trong ngày ($0 <= t <= 24$). Xét các khẳng định sau:],
  (
    [Nhiệt độ lúc 8 giờ sáng là cao nhất trong ngày.],
    True([Nhiệt độ cao nhất trong ngày là $28^circ C$.]),
    True([Nhiệt độ đạt mức thấp nhất vào lúc 2 giờ sáng (t = 2).]),
    [Biên độ dao động nhiệt độ trong ngày (hiệu số giữa nhiệt độ cao nhất và thấp nhất) là $6^circ C$.]
  ),
    loigiai: [
    - Đạo hàm: $T'(t) = 6 (pi/12) cos(pi/12 (t - 8)) = pi/2 cos(pi/12 (t - 8))$.
    - $T'(t) = 0 <=> cos(pi/12 (t - 8)) = 0 <=> pi/12 (t - 8) = pi/2 + k pi <=> t - 8 = 6 + 12k <=> t = 14 + 12k$.
    - Vì $0 <= t <= 24$ nên $t = 2$ (cực tiểu) và $t = 14$ (cực đại).
    - Tại $t=14$ (14 giờ chiều), $T(14) = 22 + 6(1) = 28^circ C$. (Mệnh đề (a) Sai, (b) Đúng).
    - Tại $t=2$ (2 giờ sáng), $T(2) = 22 + 6(-1) = 16^circ C$. (Mệnh đề (c) Đúng).
    - Biên độ: $28 - 16 = 12^circ C$. (Mệnh đề (d) Sai).
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

#tln([Một nhà máy muốn sản xuất những lon nước ngọt hình trụ có thể tích $330 "cm"^3$. Để chi phí sản xuất là thấp nhất, nhà máy cần tối thiểu hóa diện tích nhôm dùng để làm vỏ lon (bao gồm mặt xung quanh và hai đáy). Hỏi bán kính đáy của vỏ lon (tính bằng cm) phải xấp xỉ bằng bao nhiêu? (Làm tròn đến một chữ số thập phân, lấy $pi approx 3.14$).
  #align(center)[
    #sm-tru(
      w: 3cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.O, d.O1), ten: "h", huong: "dong", bk: 0pt)
        sm-diem(ctx, (d.O.at(0) + 1, d.O.at(1)), ten: "R", huong: "nam", bk: 0pt)
      }
    )
  ]],
  [3.7],
    loigiai: [
    - Thể tích lon: $V = pi R^2 h = 330 => h = 330 / (pi R^2)$.
    - Diện tích toàn phần: $S = 2pi R^2 + 2pi R h = 2pi R^2 + 2pi R (330 / (pi R^2)) = 2pi R^2 + 660/R$.
    - Đạo hàm: $S'(R) = 4pi R - 660/R^2 = 0 <=> 4pi R^3 = 660 <=> R^3 = 165/pi$.
    - Suy ra $R = root(3, 165/pi) approx root(3, 165/3.14) approx root(3, 52.5) approx 3.74$.
    - Bán kính xấp xỉ 3.7 cm.
  ]
)

#tln([Số lượng vi khuẩn trong một đĩa nuôi cấy sau $t$ giờ được mô hình hóa bởi hàm số $N(t) = (50t + 100)/(t + 2)$ (đơn vị: nghìn con). Khi thời gian trôi đi đủ lâu (nghĩa là $t -> +oo$), số lượng vi khuẩn trong đĩa sẽ ổn định ở mức tối đa là bao nhiêu nghìn con?],
  [50],
    loigiai: [
    - Ta cần tìm giới hạn của hàm số $N(t)$ khi $t -> +oo$.
    - $lim_(t -> +oo) N(t) = lim_(t -> +oo) (50t + 100)/(t + 2) = 50$.
    - Vậy số lượng vi khuẩn ổn định ở mức 50 nghìn con.
  ]
)

#tln([Tàu A đang ở vị trí cách cảng O 40 hải lý về phía Bắc và di chuyển thẳng về phía cảng O với vận tốc 20 hải lý/giờ. Cùng lúc đó, tàu B xuất phát từ cảng O và di chuyển về phía Đông với vận tốc 15 hải lý/giờ. Khoảng cách ngắn nhất giữa hai tàu trong quá trình di chuyển là bao nhiêu hải lý?],
  [24],
    loigiai: [
    - Đặt hệ trục tọa độ với gốc O, trục Oy hướng Bắc, Ox hướng Đông.
    - Tại thời điểm $t$ (giờ), tọa độ tàu A là $A(0, 40 - 20t)$.
    - Tọa độ tàu B là $B(15t, 0)$.
    - Bình phương khoảng cách giữa hai tàu: 
      $d^2(t) = (15t)^2 + (40 - 20t)^2 = 225t^2 + 1600 - 1600t + 400t^2 = 625t^2 - 1600t + 1600$.
    - Xét hàm $f(t) = 625t^2 - 1600t + 1600$. 
    - Đạo hàm: $f'(t) = 1250t - 1600 = 0 <=> t = 1600/1250 = 1.28$.
    - Khoảng cách đạt cực tiểu khi $t = 1.28$.
    - Giá trị cực tiểu: $d^2(1.28) = 625(1.28)^2 - 1600(1.28) + 1600 = 576$.
    - Khoảng cách ngắn nhất là $sqrt(576) = 24$ (hải lý).
  ]
)

#tln([Một con lắc lò xo dao động điều hòa theo phương ngang. Phương trình chuyển động của vật nặng là $x(t) = 4 cos(2 pi t + pi/3)$ (cm). Tốc độ của vật nặng tại thời điểm vật đi qua vị trí cân bằng lần đầu tiên là bao nhiêu (tính bằng cm/s)? (Lấy $pi approx 3.14$, làm tròn đến số nguyên gần nhất).],
  [25],
  loigiai: [
    - Vận tốc: $v(t) = x'(t) = -8 pi sin(2 pi t + pi/3)$.
    - Vật qua vị trí cân bằng lần đầu tiên khi $x(t) = 0 <=> cos(2 pi t + pi/3) = 0 <=> 2 pi t + pi/3 = pi/2 + k pi$.
    - Lần đầu tiên nên $2 pi t + pi/3 = pi/2 => 2 pi t = pi/6 => t = 1/12$ (s).
    - Thay $t = 1/12$ vào $v(t)$: 
      $v(1/12) = -8 pi sin(2 pi (1/12) + pi/3) = -8 pi sin(pi/6 + pi/3) = -8 pi sin(pi/2) = -8 pi$.
    - Độ lớn vận tốc (tốc độ) là $8 pi approx 8 times 3.14 = 25.12$ cm/s.
    - Làm tròn đến số nguyên gần nhất là 25.
  ]
)

#tln([Một kỹ sư thiết kế một máng dẫn nước bằng tôn có mặt cắt ngang là một hình chữ nhật. Máng được làm từ một tấm tôn phẳng có bề rộng 60 cm bằng cách uốn lên hai mép hai bên (mỗi mép uốn có chiều cao $x$ cm) để tạo thành hai thành của máng. Hỏi phải uốn mép tôn với chiều cao $x$ bằng bao nhiêu cm để máng chứa được nhiều nước nhất (tức là diện tích mặt cắt ngang lớn nhất)?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0, 2), (0, 0), (5, 0), (5, 2), stroke: 1.5pt)
      content((-0.4, 1), [$x$])
      content((5.4, 1), [$x$])
      content((2.5, -0.4), [$60 - 2x$])
      // Vẽ mực nước
      line((0, 1.5), (5, 1.5), stroke: (paint: blue, dash: "dashed"))
      content((2.5, 0.7), text(blue)[Mặt cắt ngang])
    })
  ]],
  [15],
  loigiai: [
    - Bề rộng mặt đáy của máng là $60 - 2x$ (cm). Điều kiện: $0 < 2x < 60 <=> 0 < x < 30$.
    - Diện tích mặt cắt ngang của máng: $S(x) = x(60 - 2x) = 60x - 2x^2$.
    - Đạo hàm: $S'(x) = 60 - 4x = 0 <=> x = 15$.
    - Vì $S(x)$ là hàm bậc hai có hệ số $a < 0$ nên đạt giá trị lớn nhất tại $x = 15$.
    - Vậy phải uốn mép tôn cao 15 cm.
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
