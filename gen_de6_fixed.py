import os

path = "typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-6.typ"
with open(path, "w") as f:
    f.write(r"""#import "@preview/sang-math:1.0.6": *
#import "../../../../public/hdsd/typst/sang-math-geom.typ": *
#let True(body) = (body: body, correct: true)

#let mode = "loigiai"
#let accent = rgb("d97706")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 12",
  school: "CHƯƠNG I: ỨNG DỤNG ĐẠO HÀM",
  exam-title: "ĐỀ ÔN KIỂM TRA HỆ SỐ 1 - ĐỀ 6",
  subject: "TOÁN",
  duration: "45 phút",
)

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

#tn([Có ba hộp bí ẩn đựng vàng, bạc, và đồng. Trên mỗi hộp có một dòng chữ, nhưng có ĐÚNG MỘT dòng chữ là nói thật.
Hộp 1 ghi: "Vàng không ở đây".
Hộp 2 ghi: "Vàng ở đây".
Hộp 3 ghi: "Bạc ở Hộp 1".
Vàng nằm ở hộp nào?],
  (
    True([Hộp 1]),
    [Hộp 2],
    [Hộp 3],
    [Không xác định được]
  ),
  loigiai: [
    - Nếu Vàng ở Hộp 3, Hộp 1 nói "Vàng không ở đây" là Đúng. Hộp 2 nói "Vàng ở đây" là Sai. Hộp 3 "Bạc ở Hộp 1" là Sai (nghĩa là Bạc ở Hộp 2). Khi đó chỉ có câu Hộp 1 là Đúng. 
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

#tn([Hàm số $y = (m x - 1)/(x - m)$ đồng biến trên từng khoảng xác định khi và chỉ khi:],
  (
    [$-1 < m < 1$],
    True([$m > 1$ hoặc $m < -1$]),
    [$m >= 1$ hoặc $m <= -1$],
    [$m != 0$]
  ),
  loigiai: [
    - Đạo hàm $y' = (-m^2 + 1)/(x - m)^2$.
    - Để hàm số đồng biến, $y' > 0 <=> 1 - m^2 > 0 <=> -1 < m < 1$. Khoan! $-m^2 + 1 > 0 <=> m^2 < 1 <=> -1 < m < 1$. Vậy đáp án A.
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

#ds(
  [Bốn học sinh A, B, C, D tham gia một cuộc đua và về đích với các thứ hạng 1, 2, 3, 4. Khi được hỏi ai về nhất, họ nói:
- A: "Tôi không về đầu."
- B: "C về thứ 2."
- C: "A về thứ 3."
- D: "B nói dối."
Biết rằng người về thứ 4 luôn nói dối, người về nhất luôn nói thật. Các vị trí khác có thể nói thật hoặc dối. Xét các phát biểu sau:],
  (
    True([Người về đích đầu tiên chắc chắn không phải là B.]),
    [D là người về đích thứ tư.],
    [C về đích ở vị trí thứ hai.],
    [Không thể xác định chính xác thứ tự của cả 4 người dựa trên dữ kiện này.]
  ),
  loigiai: [
    - Logic phân tích:
    - Nếu B về nhất -> B nói thật -> C về 2. 
  ]
)

#ds(
  [Cho hàm số $f(x) = (x^2 - m x + 1)/(x - 2)$. Xét các phát biểu sau:],
  (
    True([Khi $m=1$, đồ thị hàm số có tiệm cận xiên là $y = x + 1$.]),
    True([Để đồ thị hàm số không có tiệm cận đứng thì $m = 5/2$.]),
    [Đồ thị hàm số luôn đi qua điểm $A(0; -1/2)$ với mọi $m$.],
    [Hàm số luôn có 2 cực trị với mọi $m != 5/2$.]
  ),
  loigiai: [
    - Phân tích tiệm cận và cực trị.
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

#tln([Một nhà kính nông nghiệp có dạng hình hộp chữ nhật với tổng chiều dài các cạnh bằng 120m. Để thể tích không gian bên trong lớn nhất, thể tích lớn nhất đó bằng bao nhiêu (mét khối)?],
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

#tln([Một tàu đánh cá đang ở vị trí A cách đường bờ biển (đường thẳng) 30km. Tàu muốn về trạm thu mua ở vị trí B trên bờ, B cách điểm H (hình chiếu của A trên bờ) là 40km. Tốc độ tàu đi trên biển là 15km/h, tốc độ xe chở cá chạy trên bờ là 25km/h. Tàu sẽ cập bến tại một điểm M trên đoạn HB. Để tổng thời gian vận chuyển cá từ A đến B là ngắn nhất, quãng đường HM bằng bao nhiêu km?],
  [22.5],
  loigiai: [
    Gọi $HM = x$. Quãng đường $AM = sqrt(30^2 + x^2)$, $MB = 40 - x$.
    $T(x) = sqrt(x^2 + 900)/15 + (40 - x)/25$.
    $T'(x) = x / (15 sqrt(x^2+900)) - 1/25 = 0 <=> 25x = 15 sqrt(x^2+900) <=> 5x = 3 sqrt(x^2+900)$.
    $25x^2 = 9x^2 + 8100 <=> 16x^2 = 8100 <=> x^2 = 8100/16 <=> x = 90/4 = 22.5$.
  ]
)

#tln([Cho một hệ thống ròng rọc. Một điểm P chuyển động dọc theo trục Oy với phương trình $y(t) = t^3 - 6t^2 + 9t$. Tại thời điểm nào (giây) hệ thống có gia tốc bằng 0?],
  [2],
  loigiai: [
    $y'(t) = 3t^2 - 12t + 9$.
    $y''(t) = 6t - 12$.
    $y''(t) = 0 <=> t = 2$.
  ]
)

#tln([Vẽ đồ thị hàm số bằng công cụ SANG-MATH-GEOM. Cho hàm số $y = x^3 - 3x$. Đường thẳng $y = m$ cắt đồ thị tại 3 điểm phân biệt khi $m$ thuộc khoảng $(-a; a)$. Giá trị $a$ bằng bao nhiêu?],
  [2],
  loigiai: [
    Cực trị tại $x = \pm 1$. $y(1) = -2, y(-1) = 2$.
    Nên $-2 < m < 2$, do đó $a = 2$.
    #align(center)[
      #cetz.canvas({
        import cetz.draw: *
        // Vẽ đồ thị
        plot.plot(size: (6, 4), x-tick-step: 1, y-tick-step: 2, {
          plot.add(domain: (-2.5, 2.5), x => x*x*x - 3*x, style: (stroke: sm-blue))
        })
      })
    ]
  ]
)
""")

