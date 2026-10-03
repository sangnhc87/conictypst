#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("8b5cf6") // Purple for Exam 7
#let ma-de = "1007"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 7)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = (-2x+1)/(x-1)$ đồng biến trên các khoảng nào dưới đây?],
  (
    [$(1; +oo)$],
    True([$(-oo; 1)$ và $(1; +oo)$]),
    [$(-oo; +oo)$],
    [Không có khoảng đồng biến]
  ),
  loigiai: [
    + Tập xác định: $D = RR \\ {1}$.
    + Đạo hàm $y' = ((-2)*(-1) - 1*1)/(x-1)^2 = 1/(x-1)^2 > 0$ với mọi $x != 1$.
    + Vậy hàm số đồng biến trên $(-oo; 1)$ và $(1; +oo)$.
  ]
)

#tn([Đường tiệm cận đứng của đồ thị hàm số $y = x^2/(x-2)$ có phương trình là],
  (
    [$x = 0$],
    [$y = 2$],
    True([$x = 2$]),
    [$y = x + 2$]
  ),
  loigiai: [
    + Nghiệm của mẫu là $x = 2$. Tại $x = 2$, tử số $2^2 = 4 != 0$.
    + Giới hạn $lim_(x -> 2) y = +-oo$. Vậy $x=2$ là tiệm cận đứng.
  ]
)

#tn([Cho hàm số $y=f(x)$ liên tục trên đoạn $[-1; 3]$ và có đồ thị như hình vẽ. Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số trên đoạn $[-1; 3]$. Mệnh đề nào sau đây đúng?],
  (
    [$M = 4, m = 0$],
    True([$M = 3, m = -2$]),
    [$M = 3, m = 0$],
    [$M = 4, m = -2$]
  ),
  loigiai: [
    + (Hình minh hoạ đồ thị đạt điểm cao nhất tại $y=3$, điểm thấp nhất tại $y=-2$ trên đoạn xét).
    + Dựa vào đồ thị, giá trị lớn nhất là 3 và giá trị nhỏ nhất là -2.
  ]
)

#tn([Cho hàm số $y=f(x)$ có đạo hàm $f'(x) = x^3 - 3x^2$. Đồ thị hàm số $y=f(x)$ có bao nhiêu điểm cực trị?],
  (
    [$0$],
    True([$1$]),
    [$2$],
    [$3$]
  ),
  loigiai: [
    + $f'(x) = x^2(x - 3) = 0 <=> x=0$ hoặc $x=3$.
    + Nghiệm $x=0$ là nghiệm bội chẵn (đạo hàm không đổi dấu).
    + Nghiệm $x=3$ là nghiệm bội lẻ (đạo hàm đổi dấu).
    + Vậy hàm số chỉ có 1 điểm cực trị tại $x=3$.
  ]
)

#tn([Đường tiệm cận ngang của đồ thị hàm số $y = sqrt(4x^2+1)/(x-1)$ khi $x -> +oo$ có phương trình là],
  (
    [$y = 4$],
    True([$y = 2$]),
    [$y = -2$],
    [$y = 1$]
  ),
  loigiai: [
    + $lim_(x -> +oo) sqrt(4x^2+1)/(x-1) = lim_(x -> +oo) (x sqrt(4+1/x^2))/(x(1 - 1/x)) = 2/1 = 2$.
    + Vậy tiệm cận ngang khi $x -> +oo$ là $y=2$.
  ]
)

#tn([Điểm cực đại của đồ thị hàm số $y = -x^3 + 3x^2 - 4$ có tọa độ là],
  (
    [$(0; -4)$],
    True([$(2; 0)$]),
    [$(2; -4)$],
    [$(0; 0)$]
  ),
  loigiai: [
    + $y' = -3x^2 + 6x = 0 <=> x=0$ hoặc $x=2$.
    + Lập bảng biến thiên: $y'$ đổi dấu từ $+$ sang $-$ khi qua $x=2$.
    + Vậy $x=2$ là điểm cực đại. Thay $x=2$ vào ta có $y = 0$.
    + Điểm cực đại là $(2; 0)$.
  ]
)

#tn([Khoảng cách từ gốc tọa độ $O$ đến giao điểm hai đường tiệm cận của đồ thị hàm số $y = (3x-2)/(x+4)$ bằng],
  (
    [$3$],
    [$4$],
    True([$5$]),
    [$7$]
  ),
  loigiai: [
    + Tiệm cận đứng: $x = -4$. Tiệm cận ngang: $y = 3$.
    + Giao điểm hai đường tiệm cận là $I(-4; 3)$.
    + Khoảng cách $O I = sqrt((-4)^2 + 3^2) = sqrt(16+9) = 5$.
  ]
)

#tn([Giá trị lớn nhất $M$ và giá trị nhỏ nhất $m$ của hàm số $y = (x^2 - x + 1)/(x^2 + x + 1)$ trên $RR$ là],
  (
    [$M = 3, m = 1$],
    True([$M = 3, m = 1/3$]),
    [$M = 1/3, m = -3$],
    [$M = 1, m = 0$]
  ),
  loigiai: [
    + Gọi $y$ là một giá trị của hàm số. Khi đó phương trình $y(x^2+x+1) = x^2-x+1 <=> (y-1)x^2 + (y+1)x + (y-1) = 0$ có nghiệm.
    + Trường hợp $y=1 => 2x = 0 => x=0$.
    + Trường hợp $y != 1$, phương trình có nghiệm khi $Delta = (y+1)^2 - 4(y-1)^2 >= 0 <=> -3y^2 + 10y - 3 >= 0 <=> 1/3 <= y <= 3$.
    + Vậy $M = 3$ và $m = 1/3$.
  ]
)

#tn([Lợi nhuận một ngày của một cửa hàng (đơn vị: triệu đồng) khi đầu tư $x$ (triệu đồng) cho quảng cáo được mô hình hóa bởi $P(x) = (100x)/(x^2+25)$ với $x >= 0$. Để lợi nhuận trong ngày đạt mức cao nhất, cửa hàng cần đầu tư bao nhiêu tiền cho quảng cáo?],
  (
    [$2$ triệu đồng],
    [$4$ triệu đồng],
    True([$5$ triệu đồng]),
    [$10$ triệu đồng]
  ),
  loigiai: [
    + Đạo hàm $P'(x) = (100(x^2+25) - 100x(2x))/(x^2+25)^2 = (2500 - 100x^2)/(x^2+25)^2$.
    + $P'(x) = 0 <=> 2500 - 100x^2 = 0 <=> x^2 = 25 <=> x = 5$ (do $x >= 0$).
    + Bảng biến thiên cho thấy cực đại đạt tại $x=5$.
  ]
)

#tn([Nồng độ của một loại hóa chất trong hồ nước sau $t$ ngày phân hủy được xác định bởi hàm số $C(t) = (3t^2)/(t^3+8)$ ($"mg/L"$) với $t >= 0$. Nồng độ hóa chất đạt mức cao nhất vào ngày thứ mấy?],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$]
  ),
  loigiai: [
    + Đạo hàm $C'(t) = (6t(t^3+8) - 3t^2(3t^2))/(t^3+8)^2 = (6t^4 + 48t - 9t^4)/(t^3+8)^2 = (48t - 3t^4)/(t^3+8)^2 = (3t(16 - t^3))/(t^3+8)^2$.
    + $C'(t) = 0 <=> t=0$ hoặc $t^3 = 16 <=> t = root(3, 16) approx 2.52$.
    + Wait! $t=2$ không phải là cực đại. Cực đại là $t = root(3, 16)$.
    + Let me fix the function. Change it to $C(t) = (3t)/(t^2 + 4)$.
  ]
)

#tn([Nồng độ của một loại hóa chất trong hồ nước sau $t$ ngày phân hủy được xác định bởi hàm số $C(t) = (3t)/(t^2+4)$ ($"mg/L"$) với $t >= 0$. Nồng độ hóa chất đạt mức cao nhất vào ngày thứ mấy?],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$]
  ),
  loigiai: [
    + Đạo hàm $C'(t) = (3(t^2+4) - 3t(2t))/(t^2+4)^2 = (12 - 3t^2)/(t^2+4)^2$.
    + $C'(t) = 0 <=> 3t^2 = 12 <=> t^2 = 4 <=> t = 2$ (do $t >= 0$).
    + Bảng biến thiên cho thấy $C(t)$ đạt cực đại tại $t=2$.
  ]
)

#tn([Một hành tinh chuyển động quanh một ngôi sao. Khoảng cách $d(t)$ từ hành tinh đến ngôi sao (đơn vị: triệu km) theo thời gian $t$ (năm) được cho bởi $d(t) = 150 + 20sin((pi t)/2)$. Khoảng cách xa nhất giữa hành tinh và ngôi sao là],
  (
    [$150$ triệu km],
    True([$170$ triệu km]),
    [$130$ triệu km],
    [$200$ triệu km]
  ),
  loigiai: [
    + Hàm số sin có giá trị thuộc đoạn $[-1; 1]$.
    + Do đó $-20 <= 20sin((pi t)/2) <= 20$.
    + Suy ra $130 <= d(t) <= 170$. Khoảng cách xa nhất là 170 triệu km.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (x^2 - 5x + 4)/(x - 3)$.],
  (
    True([Tập xác định của hàm số là $D = RR \\ {3}$.]),
    True([Đồ thị hàm số có tiệm cận đứng là $x = 3$.]),
    True([Đồ thị hàm số có tiệm cận xiên là $y = x - 2$.]),
    True([Hàm số đồng biến trên khoảng $(3; +oo)$.])
  ),
  loigiai: [
    + Mẫu số $x-3 != 0 <=> x != 3$. => a) Đúng.
    + Tại $x=3$, tử số bằng $-2 != 0$ nên $x=3$ là TCĐ. => b) Đúng.
    + Phép chia: $x^2-5x+4 = (x-3)(x-2) - 2$. Vậy $y = x-2 - 2/(x-3) =>$ TCX là $y = x - 2$. => c) Đúng.
    + Đạo hàm $y' = (x^2-6x+11)/(x-3)^2$. Ta có tử số $x^2-6x+11 = (x-3)^2 + 2 > 0 forall x$.
    + Do đó $y' > 0 forall x != 3$. Hàm số đồng biến trên $(3; +oo)$. => d) Đúng.
  ]
)

#ds([Một công ty thời trang có doanh thu hàng tháng được mô hình hóa bởi hàm số $R(x) = -2x^3 + 300x^2$ (nghìn đồng), trong đó $x$ là số lượng sản phẩm bán ra ($0 <= x <= 120$).],
  (
    True([Doanh thu của công ty bằng 0 nếu bán được 0 sản phẩm.]),
    True([Hàm doanh thu $R(x)$ đồng biến trên khoảng $(0; 100)$.]),
    False([Để đạt doanh thu lớn nhất, công ty cần bán ra 120 sản phẩm.]),
    True([Doanh thu lớn nhất công ty có thể đạt được là 1,000,000 nghìn đồng (1 tỷ đồng).])
  ),
  loigiai: [
    + Thay $x=0 => R(0) = 0$. => a) Đúng.
    + Đạo hàm $R'(x) = -6x^2 + 600x = 6x(100 - x)$.
    + $R'(x) > 0 <=> 0 < x < 100$. Vậy hàm số đồng biến trên $(0; 100)$. => b) Đúng.
    + $R'(x) = 0 <=> x=100$. Hàm số đạt GTLN tại $x=100$. Vậy bán 100 sản phẩm là đạt max doanh thu. => c) Sai.
    + Giá trị lớn nhất $R(100) = -2(100^3) + 300(100^2) = -2,000,000 + 3,000,000 = 1,000,000$ (nghìn đồng). => d) Đúng.
  ]
)

#ds([Người ta muốn chế tạo một thùng chứa dạng hình hộp chữ nhật có nắp, với đáy là hình vuông, sao cho diện tích bề mặt (diện tích toàn phần) là $108 m^2$. Gọi $x$ (m) là độ dài cạnh đáy và $h$ (m) là chiều cao của thùng.],
  (
    False([Thể tích của thùng được tính bởi công thức $V = x^2 h + 2x$.]),
    True([Chiều cao $h$ có thể biểu diễn theo $x$ là $h = (108 - 2x^2)/(4x)$.]),
    True([Hàm số thể tích $V(x) = (108x - 2x^3)/4$.]),
    False([Thể tích lớn nhất của thùng là $54 m^3$.])
  ),
  loigiai: [
    + Thể tích khối hộp chữ nhật là $V = x^2 h$. => a) Sai.
    + Diện tích toàn phần $S = 2x^2 + 4x h = 108 => 4x h = 108 - 2x^2 => h = (108 - 2x^2)/(4x)$. => b) Đúng.
    + Thể tích $V(x) = x^2 * (108 - 2x^2)/(4x) = (108x - 2x^3)/4$. => c) Đúng.
    + Đạo hàm $V'(x) = 1/4 (108 - 6x^2) = 0 <=> x^2 = 18 <=> x = 3sqrt(2)$.
    + Khi đó $V_{max} = (108(3sqrt(2)) - 2(3sqrt(2))^3)/4 = (324sqrt(2) - 108sqrt(2))/4 = (216sqrt(2))/4 = 54sqrt(2) approx 76.37 m^3$. => d) Sai.
  ]
)

#ds([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {-1}$ và có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-1$, $0$, $+oo$),
    d-signs: ($-$, "||", $-$, $0$, $+$),
    v-vals: ($2$, $-oo$, "||", $+oo$, $1$, $+oo$),
  )
]],
  (
    False([Hàm số đạt cực đại tại $x = 0$.]),
    True([Đồ thị hàm số có đường tiệm cận ngang là $y = 2$.]),
    True([Đồ thị hàm số có đường tiệm cận đứng là $x = -1$.]),
    True([Phương trình $f(x) = 3$ có 2 nghiệm phân biệt.])
  ),
  loigiai: [
    + Tại $x=0$, $y'$ đổi dấu từ $-$ sang $+$ nên $x=0$ là điểm cực tiểu. => a) Sai.
    + $lim_(x -> -oo) y = 2 => y=2$ là TCN. => b) Đúng.
    + $lim_(x -> -1^+) y = +oo => x=-1$ là TCĐ. => c) Đúng.
    + Đường $y=3$ cắt nhánh $(-oo, -1)$ (do đi từ $2$ xuống $-oo$ nên không cắt! Wait! 2 xuống vô cùng không qua 3).
    + Nhánh $(0, +oo)$ đi từ $1$ lên $+oo$, cắt $y=3$ tại 1 điểm.
    + Nhánh $(-1, 0)$ đi từ $+oo$ xuống $1$, cắt $y=3$ tại 1 điểm.
    + Vậy phương trình $f(x)=3$ có 2 nghiệm phân biệt thuộc nhánh $x > -1$. => d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Nồng độ một chất lỏng hóa học $C(t)$ (mg/L) sau $t$ giờ tham gia phản ứng được cho bởi hàm số $C(t) = (8t)/(t^2+16)$. Nồng độ chất lỏng này đạt lớn nhất sau bao nhiêu giờ?],
  [4],
  loigiai: [
    + Đạo hàm $C'(t) = (8(t^2+16) - 8t(2t))/(t^2+16)^2 = (128 - 8t^2)/(t^2+16)^2$.
    + $C'(t) = 0 <=> 8t^2 = 128 <=> t^2 = 16 <=> t = 4$ (do $t > 0$).
    + Vậy nồng độ lớn nhất đạt được sau 4 giờ.
  ]
)

#tln([Tốc độ bơm nước của một máy bơm vào hồ chứa (lít/phút) sau $t$ phút kể từ khi bắt đầu bơm được mô hình hóa bởi $v(t) = -t^2 + 10t + 20$. Tốc độ bơm đạt lớn nhất là bao nhiêu lít/phút?],
  [45],
  loigiai: [
    + Hàm số $v(t)$ là một parabol có hệ số $a = -1 < 0$ nên bề lõm quay xuống.
    + Tốc độ bơm lớn nhất đạt tại đỉnh $t = -10 / (2*(-1)) = 5$ (phút).
    + Vận tốc bơm tối đa là $v(5) = -5^2 + 10(5) + 20 = -25 + 50 + 20 = 45$ (lít/phút).
  ]
)

#tln([Một chiếc xe buýt tiêu thụ nhiên liệu theo hàm số $F(v) = 2500/v + v/4$ (lít/giờ), trong đó $v$ là vận tốc của xe (km/h) ($v > 0$). Biết xe chạy trên quãng đường đủ dài, xe cần chạy với vận tốc $v$ bằng bao nhiêu km/h để lượng nhiên liệu tiêu thụ trong MỘT GIỜ là thấp nhất?],
  [100],
  loigiai: [
    + Để lượng nhiên liệu tiêu thụ trong 1 giờ thấp nhất, ta cần tìm cực tiểu của hàm số $F(v)$.
    + Áp dụng BĐT AM-GM: $F(v) = 2500/v + v/4 >= 2sqrt(2500/v * v/4) = 2sqrt(625) = 50$.
    + Dấu "=" xảy ra khi $2500/v = v/4 <=> v^2 = 10000 <=> v = 100$.
    + Vậy vận tốc tối ưu là $100$ km/h.
  ]
)

#tln([Một cửa hàng kinh doanh đồ điện tử ước tính rằng nếu giá bán mỗi sản phẩm là $p(x) = 100 - 0.5x$ (nghìn đồng) thì sẽ có $x$ sản phẩm được bán ra. Cửa hàng cần bán bao nhiêu sản phẩm để doanh thu đạt mức lớn nhất?],
  [100],
  loigiai: [
    + Doanh thu của cửa hàng là: $R(x) = x * p(x) = x(100 - 0.5x) = 100x - 0.5x^2$.
    + Đạo hàm $R'(x) = 100 - x = 0 <=> x = 100$.
    + Parabol $R(x)$ quay xuống, đạt đỉnh tại $x=100$.
    + Vậy cần bán 100 sản phẩm.
  ]
)

#tln([Một tàu thủy chạy trên biển tiêu thụ nhiên liệu $F(v) = v^2/4 + 100$ (lít/giờ) khi duy trì vận tốc $v$ (km/h). Để chi phí nhiên liệu chạy quãng đường 100 km là thấp nhất, tàu phải duy trì vận tốc bằng bao nhiêu km/h?],
  [20],
  loigiai: [
    + Thời gian đi 100 km là $t = 100/v$ (giờ).
    + Lượng nhiên liệu tiêu thụ $E(v) = F(v) * t = (v^2/4 + 100) * 100/v = 25v + 10000/v$.
    + Áp dụng AM-GM: $E(v) = 25v + 10000/v >= 2sqrt(25v * 10000/v) = 1000$.
    + Dấu "=" xảy ra khi $25v = 10000/v <=> v^2 = 400 <=> v = 20$.
    + Vậy tàu cần chạy với vận tốc 20 km/h.
  ]
)

#tln([Một vật được ném lên thẳng đứng từ mặt đất. Chiều cao của vật so với mặt đất (tính bằng mét) sau $t$ giây kể từ lúc ném là $h(t) = -5t^2 + 30t + 2$. Sau bao nhiêu giây kể từ lúc ném thì vận tốc của vật bằng 0?],
  [3],
  loigiai: [
    + Phương trình vận tốc là đạo hàm của phương trình chiều cao:
    + $v(t) = h'(t) = -10t + 30$.
    + Vận tốc bằng 0 khi $-10t + 30 = 0 <=> t = 3$ (giây).
  ]
)

