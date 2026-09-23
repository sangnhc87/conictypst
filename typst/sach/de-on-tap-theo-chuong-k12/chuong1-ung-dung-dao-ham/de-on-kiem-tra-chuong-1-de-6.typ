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
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 6",
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

#tn([Một khách sạn có 50 phòng. Mỗi ngày, nếu giá thuê mỗi phòng là 400 nghìn đồng thì toàn bộ 50 phòng đều có người thuê. Biết rằng cứ mỗi lần tăng giá thêm 20 nghìn đồng/phòng thì sẽ có thêm 1 phòng bị bỏ trống. Khách sạn cần niêm yết giá thuê mỗi phòng là bao nhiêu để doanh thu trong ngày là lớn nhất?],
  (
    [600 nghìn đồng],
    True([700 nghìn đồng]),
    [800 nghìn đồng],
    [900 nghìn đồng]
  ),
    loigiai: [
    - Gọi $x$ là số lần tăng giá thêm 20 nghìn đồng ($x > 0$).
    - Giá thuê mỗi phòng là $400 + 20x$ (nghìn đồng).
    - Số phòng được thuê là $50 - x$ (phòng).
    - Doanh thu: $R(x) = (400 + 20x)(50 - x) = 20000 - 400x + 1000x - 20x^2 = -20x^2 + 600x + 20000$.
    - Đạo hàm: $R'(x) = -40x + 600 = 0 <=> x = 15$.
    - Khi đó giá thuê tối ưu là $400 + 20(15) = 700$ nghìn đồng.
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

#tn([Vận tốc chuyển động của một hạt (m/s) theo thời gian $t$ (giây) được cho bởi công thức $v(t) = t^3 - 6t^2 + 9t + 2$. Hỏi tại thời điểm nào (giây) gia tốc của hạt đạt giá trị nhỏ nhất?],
  (
    [1],
    True([2]),
    [3],
    [0]
  ),
    loigiai: [
    - Gia tốc của hạt là đạo hàm của vận tốc: $a(t) = v'(t) = 3t^2 - 12t + 9$.
    - Để tìm giá trị nhỏ nhất của gia tốc, ta xét hàm số $a(t)$. $a'(t) = 6t - 12 = 0 <=> t = 2$.
    - Tại $t = 2$, đồ thị hàm số $a(t)$ (là một parabol hướng bề lõm lên trên) đạt cực tiểu.
    - Vậy gia tốc nhỏ nhất khi $t = 2$.
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
  [Một công ty du lịch thiết kế một loại lều cắm trại hình chóp tứ giác đều có đáy là hình vuông. Diện tích vải bạt (không tính đáy) để làm lều là $16 "m"^2$. Gọi $x$ là độ dài cạnh đáy, $h$ là đường cao lều. Xét các phát biểu sau:
  #align(center)[
    #sm-chop-sabcd-deu(
      w: 6cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: "h", huong: "dong", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.C, d.D), ten: "x", huong: "nam", bk: 0pt)
      }
    )
  ]],
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

#ds(
  [Một chủ vườn trồng 30 cây táo trên một khu đất. Ước tính mỗi cây táo cho thu hoạch trung bình 500 quả. Khảo sát nông nghiệp cho thấy, nếu trồng thêm 1 cây táo trong khu vườn đó thì năng suất trung bình của mỗi cây sẽ giảm đi 10 quả do bị cạnh tranh dinh dưỡng. Gọi $x$ là số cây táo trồng thêm ($x >= 0$). Xét các phát biểu sau:],
  (
    True([Khi trồng thêm 5 cây, tổng số quả thu hoạch được là 15750 quả.]),
    True([Nếu trồng thêm 10 cây táo, năng suất trung bình của mỗi cây còn 400 quả.]),
    True([Số lượng táo thu hoạch lớn nhất có thể đạt được là 16000 quả.]),
    [Để năng suất tổng cộng lớn nhất, chủ vườn cần trồng thêm 12 cây táo.]
  ),
    loigiai: [
    - Gọi $x$ là số cây trồng thêm. Tổng số cây là $30 + x$.
    - Năng suất mỗi cây là $500 - 10x$.
    - Tổng sản lượng: $S(x) = (30 + x)(500 - 10x) = 15000 + 200x - 10x^2$.
    - (a) Với $x = 5$, $S(5) = (35)(450) = 15750$. Mệnh đề Đúng.
    - $S'(x) = 200 - 20x = 0 <=> x = 10$. Bảng biến thiên cho cực đại tại $x = 10$. 
    - Vậy cần trồng thêm 10 cây để sản lượng lớn nhất (d sai).
    - Với $x = 10$, $S(10) = 40 times 400 = 16000$. (c đúng).
    - Với $x = 10$, năng suất mỗi cây là $500 - 100 = 400$. (b đúng).
  ]
)

#ds(
  [Một công ty sữa muốn thiết kế các hộp đựng sữa có dạng hình trụ tròn xoay với thể tích là $V = 1$ lít ($1000$ cm³). Để tiết kiệm chi phí nguyên vật liệu, công ty muốn diện tích toàn phần của hộp sữa (bao gồm mặt xung quanh và 2 mặt đáy) là nhỏ nhất. Gọi $R$ và $h$ lần lượt là bán kính đáy và chiều cao của hộp sữa. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Hàm số biểu diễn diện tích toàn phần theo bán kính $R$ là $S(R) = 2pi R^2 + 1000/R$.],
    True([Đạo hàm của hàm diện tích theo $R$ là $S'(R) = 4pi R - 2000/R^2$.]),
    True([Diện tích toàn phần nhỏ nhất khi và chỉ khi chiều cao của hộp bằng đường kính đáy ($h = 2R$).]),
    [Để chi phí nguyên vật liệu ít nhất thì bán kính đáy $R approx 7.14$ cm.]
  ),
    loigiai: [
    - Đổi $V = 1$ lít = $1000 "cm"^3$.
    - $V = pi R^2 h = 1000 => h = 1000 / (pi R^2)$.
    - Diện tích toàn phần: $S(R) = 2pi R^2 + 2pi R h = 2pi R^2 + 2pi R (1000 / (pi R^2)) = 2pi R^2 + 2000 / R$. 
    - Suy ra mệnh đề (a) Sai vì hệ số của phần thân là $2000/R$ chứ không phải $1000/R$.
    - Đạo hàm: $S'(R) = 4pi R - 2000/R^2$. Vậy mệnh đề (b) Đúng.
    - $S'(R) = 0 <=> 4pi R^3 = 2000 <=> R^3 = 500 / pi <=> R = root(3, 500/pi) approx 5.42$ cm.
    - Khi đó $h = 1000 / (pi R^2) = (1000 R) / (pi R^3) = (1000 R) / (pi times 500 / pi) = 2R$. Vậy (c) Đúng.
    - Mệnh đề (d) Sai vì $R approx 5.42$ cm.
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

#tln([Một nhà kính nông nghiệp có dạng hình hộp chữ nhật với tổng chiều dài các cạnh bằng 120m. Để thể tích không gian bên trong lớn nhất, thể tích lớn nhất đó bằng bao nhiêu (mét khối)?
  #align(center)[
    #sm-hop-chu-nhat(
      w: 6cm,
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.A, d.B), ten: "x", huong: "bac", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.B, d.C), ten: "y", huong: "dong-bac", bk: 0pt)
        sm-diem(ctx, sm-trung-diem(d.A, d.A1), ten: "z", huong: "tay", bk: 0pt)
      }
    )
  ]],
  [1000],
    loigiai: [
    Lập phương. $12 a = 120 => a = 10$. Thể tích $10^3 = 1000$.
  ]
)

#tln([Tốc độ truyền tin của một kênh viễn thông phụ thuộc vào băng thông $B$ theo công thức $R(B) = 10 B log_2 (1 + 10/B)$. Để đạt tốc độ truyền tin $R$ lớn nhất có thể, giá trị giới hạn của $R$ khi $B -> oo$ bằng bao nhiêu? (Lấy gần đúng số nguyên dương).],
  [144],
    loigiai: [
    $lim_(B -> oo) 10 B ln(1 + 10/B) / ln 2 = 100 / 0.693 approx 144.26$.
  ]
)

#tln([Một cửa sổ Norman được thiết kế với hình dạng phần dưới là hình chữ nhật và phần trên là nửa hình tròn (như hình vẽ). Chu vi của cửa sổ là 8 mét. Tìm bán kính của phần nửa hình tròn (tính bằng mét) để diện tích phần đón ánh sáng của cửa sổ là lớn nhất. (Làm tròn đến hai chữ số thập phân, lấy $pi approx 3.14$).
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Hình chữ nhật
      rect((-1.5, 0), (1.5, -3), stroke: 1.5pt)
      // Nửa hình tròn
      arc((1.5, 0), start: 0deg, stop: 180deg, radius: 1.5, stroke: 1.5pt)
      // Nét đứt ngăn cách
      line((-1.5, 0), (1.5, 0), stroke: (dash: "dashed", paint: gray))
      content((0, -0.4), $R$)
      content((1.8, -1.5), $y$)
      content((0, -3.4), $2R$)
    })
  ]],
  [1.12],
    loigiai: [
    - Gọi bán kính nửa hình tròn là $R$, chiều cao phần hình chữ nhật là $y$ ($R, y > 0$).
    - Cạnh đáy hình chữ nhật là $2R$.
    - Chu vi cửa sổ gồm nửa chu vi đường tròn, hai cạnh bên hình chữ nhật và cạnh đáy: 
      $P = pi R + 2y + 2R = 8 => 2y = 8 - pi R - 2R$.
    - Diện tích cửa sổ (diện tích đón ánh sáng): 
      $S(R) = 2R y + 1/2 pi R^2 = R(8 - pi R - 2R) + 1/2 pi R^2 = 8R - 2R^2 - 1/2 pi R^2 = 8R - (2 + pi/2)R^2$.
    - Đạo hàm: $S'(R) = 8 - (4 + pi)R$.
    - Đặt $S'(R) = 0 <=> R = 8 / (4 + pi)$.
    - Bảng biến thiên cho thấy $S(R)$ đạt cực đại tại $R = 8 / (4 + pi) approx 8 / 7.14 approx 1.12$ (m).
  ]
)

#tln([Cho một hệ thống ròng rọc. Một điểm P chuyển động dọc theo trục Oy với phương trình $y(t) = t^3 - 6t^2 + 9t$. Tại thời điểm nào (giây) hệ thống có gia tốc bằng 0?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ trục Oy
      line((0, -1), (0, 4), mark: (end: ">"))
      content((-0.4, 3.8), [$y$])
      content((-0.3, -0.3), [$O$])
      
      // Vẽ bánh ròng rọc
      circle((2, 3), radius: 0.5, fill: gray.lighten(50%))
      circle((2, 3), radius: 0.1, fill: black)
      
      // Vẽ dây
      line((1.5, 3), (1.5, 1))
      line((2.5, 3), (2.5, -1))
      
      // Vẽ vật P
      content((1.5, 1), box(fill: blue.lighten(50%), inset: 5pt, [$P$]))
      
      // Vẽ đối trọng
      content((2.5, -1), box(fill: red.lighten(50%), inset: 5pt, [$m$]))
    })
  ]],
  [2],
  loigiai: [
    - Vận tốc: $v(t) = y'(t) = 3t^2 - 12t + 9$.
    - Gia tốc: $a(t) = v'(t) = y''(t) = 6t - 12$.
    - Để gia tốc bằng 0 thì $a(t) = 0 <=> 6t - 12 = 0 <=> t = 2$ (giây).
    - Đáp số: 2.
  ]
)

#tln([Một người thợ cần làm một chiếc hộp không có nắp từ một tấm bìa carton hình chữ nhật có kích thước 80 cm x 50 cm. Người thợ cắt bỏ 4 hình vuông bằng nhau ở 4 góc của tấm bìa rồi gấp phần còn lại lên để tạo thành hộp (như hình vẽ). Hãy tính cạnh của các hình vuông bị cắt bỏ (theo cm) sao cho thể tích của chiếc hộp nhận được là lớn nhất?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Vẽ hình chữ nhật ngoài
      rect((0, 0), (8, 5), stroke: 1pt)
      // Vẽ các đường đứt nét bên trong tạo thành nếp gấp
      rect((1.5, 1.5), (6.5, 3.5), stroke: (paint: gray, dash: "dashed"))
      // Vẽ 4 hình vuông bị gạch xéo (cắt đi)
      let cross_square(x, y, w) = {
        rect((x, y), (x+w, y+w), fill: gray.lighten(70%))
        line((x, y), (x+w, y+w))
        line((x, y+w), (x+w, y))
        content((x + w/2, y - 0.3), [$x$])
        content((x - 0.3, y + w/2), [$x$])
      }
      cross_square(0, 0, 1.5)
      cross_square(6.5, 0, 1.5)
      cross_square(0, 3.5, 1.5)
      cross_square(6.5, 3.5, 1.5)
      
      content((4, -0.4), [80 cm])
      content((-0.6, 2.5), [50 cm])
    })
  ]],
  [10],
  loigiai: [
    - Gọi $x$ là cạnh của hình vuông bị cắt đi ($x > 0$, tính bằng cm).
    - Sau khi cắt và gấp, đáy hộp là hình chữ nhật có kích thước là $(80 - 2x)$ và $(50 - 2x)$.
    - Chiều cao của hộp chính là cạnh $x$.
    - Điều kiện để đáy hộp tồn tại: $80 - 2x > 0$ và $50 - 2x > 0 => 0 < x < 25$.
    - Thể tích của hộp là: $V(x) = x(80 - 2x)(50 - 2x) = 4x^3 - 260x^2 + 4000x$.
    - Đạo hàm: $V'(x) = 12x^2 - 520x + 4000$.
    - Đặt $V'(x) = 0 <=> 3x^2 - 130x + 1000 = 0 <=> x = 10$ hoặc $x = 100/3$ (loại vì $100/3 > 25$).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "x",
        der: "V'(x)",
        func: "V(x)",
        x-vals: ($0$, $10$, $25$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $18000$, $0$)
      )
    ]
    - Dựa vào bảng biến thiên, thể tích hộp đạt giá trị lớn nhất khi $x = 10$ (cm).
    - Đáp số: 10.
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
