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
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 8",
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

#tn([Một người chèo thuyền xuất phát từ điểm A trên một hòn đảo và muốn đến điểm C trên bờ biển bằng cách chèo thuyền đến điểm M trên bờ biển (đoạn bờ biển thẳng) rồi chạy bộ từ M đến C. Gọi B là hình chiếu của A trên bờ biển. Biết khoảng cách $"AB" = 3$ km, $"BC" = 8$ km. Vận tốc chèo thuyền là 4 km/h, vận tốc chạy bộ là 5 km/h. Vị trí điểm M cách B bao nhiêu km để thời gian đến C là ngắn nhất?],
  (
    [2.5],
    [3],
    True([4]),
    [5],
  ),
    loigiai: [

        
    - Đặt $"BM" = x$ (km) ($0 <= x <= 8$). Khoảng cách $"MC" = 8 - x$.
    - Quãng đường trên biển $"AM" = sqrt("AB"^2 + "BM"^2) = sqrt(x^2 + 9)$.
    - Thời gian đi: $t(x) = (sqrt(x^2+9))/(4) + (8-x)/(5)$.
    - $t'(x) = (x)/(4sqrt(x^2+9)) - (1)/(5) = 0 <=> 5x = 4sqrt(x^2+9) <=> 25x^2 = 16(x^2+9) <=> 9x^2 = 144 <=> x^2 = 16 <=> x = 4$.
    - Lập BBT thấy $t(x)$ đạt Min tại $x = 4$.
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

#tn([Chi phí nhiên liệu của một chiếc xe tải chạy trên cao tốc phụ thuộc vào vận tốc $v$ (km/h) theo hàm $C(v) = 200 + v^2/2$ (nghìn đồng/giờ). Để đi quãng đường 100 km với chi phí nhiên liệu thấp nhất, tài xế nên chạy xe với vận tốc bằng bao nhiêu?],
  (
    [10 km/h],
    True([20 km/h]),
    [30 km/h],
    [40 km/h]
  ),
    loigiai: [
    - Thời gian đi quãng đường 100 km là $t = 100/v$ (giờ).
    - Tổng chi phí: $T(v) = C(v) times t = (200 + v^2/2) times 100/v = 20000/v + 50v$.
    - Đạo hàm: $T'(v) = -20000/v^2 + 50$.
    - $T'(v) = 0 <=> v^2 = 400 <=> v = 20$.
    - Lập bảng biến thiên thấy $T(v)$ đạt Min tại $v = 20$.
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

#ds([Một chiếc hộp không nắp được làm từ một tấm bìa các-tông hình vuông cạnh 12 cm bằng cách cắt bốn hình vuông nhỏ bằng nhau ở bốn góc rồi gập các cạnh lên. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Nếu độ dài cạnh hình vuông bị cắt là $x$ (cm) thì điều kiện của $x$ là $0 < x < 6$.]),
    [Thể tích hộp lớn nhất khi $x = 3$ cm.],
    True([Hàm số tính thể tích hộp là $V(x) = 4x^3 - 48x^2 + 144x$.]),
    True([Thể tích lớn nhất của chiếc hộp là 128 cm³.]),
  ),
    loigiai: [

        
    - a) Đúng. Tấm bìa cạnh 12, cắt 2 đầu x nên $12 - 2x > 0 => 0 < x < 6$.
    - c) Đáy hộp là hình vuông cạnh $12 - 2x$. Thể tích $V(x) = x(12 - 2x)^2 = x(144 - 48x + 4x^2) = 4x^3 - 48x^2 + 144x$. (Đúng)
    - b) $V'(x) = 12x^2 - 96x + 144 = 0 <=> x^2 - 8x + 12 = 0 <=> x = 2$ hoặc $x = 6$ (loại). Vậy thể tích lớn nhất khi $x=2$. Phát biểu cho $x=3$ là Sai.
    - d) Khi $x=2$, $V(2) = 2 times (12 - 4)^2 = 2 times 64 = 128$ cm³. (Đúng)
  ]
)

#ds(
  [Lợi nhuận từ việc bán một loại sản phẩm được mô hình hóa bởi hàm số $P(x) = -2x^3 + 300x^2 - 10000$ (nghìn đồng), trong đó $x$ là số lượng sản phẩm sản xuất và bán ra ($x >= 0$). Xét tính đúng sai của các phát biểu sau:],
  (
    True([Đạo hàm của hàm lợi nhuận là $P'(x) = -6x^2 + 600x$.]),
    [Khi sản xuất 50 sản phẩm, lợi nhuận của công ty đạt giá trị lớn nhất.],
    True([Nếu công ty đã sản xuất 100 sản phẩm, việc sản xuất thêm sẽ làm giảm lợi nhuận.]),
    True([Lợi nhuận lớn nhất mà công ty có thể đạt được là $990,000$ nghìn đồng.])
  ),
    loigiai: [
    - a) $P'(x) = -6x^2 + 600x$. (Đúng)
    - b) $P'(x) = 0 <=> -6x(x - 100) = 0 <=> x = 0$ hoặc $x = 100$. Lợi nhuận lớn nhất khi $x = 100$, không phải $x = 50$. (Sai)
    - c) Bảng biến thiên cho thấy $P'(x) < 0$ khi $x > 100$, tức là hàm lợi nhuận giảm khi $x > 100$. Vậy sản xuất thêm sau 100 sản phẩm sẽ làm giảm lợi nhuận. (Đúng)
    - d) Khi $x = 100$, $P(100) = -2(100)^3 + 300(100)^2 - 10000 = -2000000 + 3000000 - 10000 = 990000$ (nghìn đồng). (Đúng)
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

#tln([Một nhà máy điện nằm trên một hòn đảo ở vị trí A cách bờ biển (được xem là đường thẳng) 2 km. Một thị trấn C nằm trên bờ biển cách điểm B (là hình chiếu vuông góc của A trên bờ biển) một khoảng 4 km. Người ta cần nối cáp điện từ A đến C qua một điểm M trên đoạn BC. Biết chi phí lắp cáp dưới nước là 500 triệu đồng/km, chi phí lắp cáp trên bờ là 300 triệu đồng/km. Điểm M cách điểm B bao nhiêu km để tổng chi phí lắp đặt cáp là nhỏ nhất?],
  [1.5],
    loigiai: [
    - Đặt $"BM" = x$ (km) ($0 <= x <= 4$). Khi đó $"MC" = 4 - x$.
    - Chiều dài đoạn cáp dưới nước $"AM" = sqrt("AB"^2 + "BM"^2) = sqrt(x^2 + 4)$.
    - Tổng chi phí: $C(x) = 500 sqrt(x^2 + 4) + 300(4 - x)$ (triệu đồng).
    - Đạo hàm: $C'(x) = 500 x/sqrt(x^2 + 4) - 300$.
    - $C'(x) = 0 <=> 500x = 300sqrt(x^2 + 4) <=> 5x = 3sqrt(x^2 + 4)$.
    - Bình phương 2 vế: $25x^2 = 9(x^2 + 4) <=> 25x^2 = 9x^2 + 36 <=> 16x^2 = 36 <=> x^2 = 36/16 = 9/4$.
    - Vì $x >= 0$ nên $x = 3/2 = 1.5$.
    - Vậy điểm M cách B 1.5 km thì chi phí nhỏ nhất.
  ]
)

#tln([Dân số của một khu đô thị mới được mô hình hóa bởi hàm số $P(t) = (10t + 50)/(t + 1)$ (nghìn người), trong đó $t$ là số năm kể từ khi khu đô thị bắt đầu hoạt động ($t >= 0$). Theo mô hình này, khi thời gian hoạt động đủ lâu (tức là $t -> +oo$), dân số của khu đô thị sẽ ổn định ở mức tối đa là bao nhiêu nghìn người?],
  [10],
    loigiai: [
    - Ta cần tìm giới hạn của hàm số $P(t)$ khi $t -> +oo$.
    - $lim_(t -> +oo) P(t) = lim_(t -> +oo) (10t + 50)/(t + 1) = lim_(t -> +oo) (10 + 50/t)/(1 + 1/t) = 10$.
    - Dân số ổn định ở mức 10 nghìn người.
  ]
)

#tln([Một kỹ sư thiết kế một bể chứa nước không có nắp hình hộp chữ nhật có đáy là hình vuông. Thể tích của bể cần thiết kế là $108 "m"^3$. Hỏi cạnh đáy của bể phải bằng bao nhiêu mét để tổng diện tích vật liệu xây dựng (bao gồm diện tích xung quanh và diện tích đáy) là nhỏ nhất?],
  [6],
    loigiai: [
    - Gọi $x$ (m) là cạnh đáy hình vuông ($x > 0$), $h$ (m) là chiều cao của bể.
    - Thể tích: $V = x^2 h = 108 => h = 108/x^2$.
    - Diện tích vật liệu xây dựng: $S(x) = S_("đáy") + S_("xq") = x^2 + 4x h$.
    - Thay $h = 108/x^2$ vào ta được: $S(x) = x^2 + 4x(108/x^2) = x^2 + 432/x$.
    - Đạo hàm: $S'(x) = 2x - 432/x^2$.
    - $S'(x) = 0 <=> 2x^3 - 432 = 0 <=> x^3 = 216 <=> x = 6$.
    - Vậy cạnh đáy bằng 6 m thì diện tích vật liệu nhỏ nhất.
  ]
)

#tln([Công suất $P$ (đơn vị: kW) của một máy phát điện chạy bằng sức gió được tính theo công thức $P(v) = k v^3 (20 - v)$ với $0 <= v <= 20$, trong đó $v$ là vận tốc gió (m/s) và $k$ là một hằng số dương. Hỏi máy phát điện này đạt công suất lớn nhất khi vận tốc gió là bao nhiêu m/s?],
  [15],
  loigiai: [
    - Hàm số công suất: $P(v) = k (20v^3 - v^4)$.
    - Đạo hàm: $P'(v) = k(60v^2 - 4v^3) = 4k v^2 (15 - v)$.
    - Vì $k > 0$, ta có $P'(v) = 0 <=> v = 0$ hoặc $v = 15$.
    - Lập bảng biến thiên trên đoạn $[0; 20]$, ta thấy $P'(v) > 0$ khi $v in (0; 15)$ và $P'(v) < 0$ khi $v in (15; 20)$.
    - Suy ra hàm số $P(v)$ đạt giá trị lớn nhất tại $v = 15$.
    - Vận tốc gió cần tìm là 15 m/s.
  ]
)

#tln([Một nhà máy muốn thiết kế một bồn chứa hóa chất có dạng hình trụ tròn xoay không có nắp đậy, với thể tích không đổi là $8 pi " m"^3$. Hãy tính bán kính đáy của bồn chứa (tính bằng mét) sao cho diện tích bề mặt (gồm mặt xung quanh và mặt đáy) là nhỏ nhất để tiết kiệm vật liệu nhất.
  #align(center)[
    #sm-tru(
      w: 3cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.O, d.O1), ten: "h", huong: "dong", bk: 0pt)
        sm-diem(ctx, (d.O.at(0) + 1, d.O.at(1)), ten: "R", huong: "nam", bk: 0pt)
      }
    )
  ]],
  [2],
  loigiai: [
    - Gọi $R$ (m) là bán kính đáy, $h$ (m) là chiều cao của bồn chứa ($R > 0, h > 0$).
    - Thể tích khối trụ: $V = pi R^2 h = 8 pi => h = 8/R^2$.
    - Bồn chứa không có nắp nên diện tích toàn phần (diện tích bề mặt vật liệu) là:
      $S = S_("xq") + S_("đáy") = 2pi R h + pi R^2 = 2pi R(8/R^2) + pi R^2 = 16pi/R + pi R^2$.
    - Xét hàm $S(R) = pi R^2 + 16pi/R$ với $R > 0$.
    - Đạo hàm: $S'(R) = 2pi R - 16pi/R^2 = (2pi(R^3 - 8))/R^2$.
    - $S'(R) = 0 <=> R^3 = 8 <=> R = 2$.
    - Vì $S''(R) = 2pi + 32pi/R^3 > 0$ nên $S(R)$ đạt cực tiểu tại $R = 2$.
    - Bán kính đáy để tiết kiệm vật liệu nhất là 2 m.
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
