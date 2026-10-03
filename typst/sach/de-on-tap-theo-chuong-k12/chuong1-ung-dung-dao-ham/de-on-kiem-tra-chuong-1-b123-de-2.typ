#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("0ea5e9") // Light blue for Exam 2
#let ma-de = "1002"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 2)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = (x^2 - 3x + 2)/(x - 1)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(1; 3)$],
    True([$(1; +oo)$]),
    [$(-oo; +oo)$],
    [$(0; 2)$]
  ),
  loigiai: [
    + Tập xác định: $D = RR \\ {1}$.
    + Đạo hàm $y' = ((2x-3)(x-1) - (x^2-3x+2))/(x-1)^2 = (x^2-2x+1)/(x-1)^2 = 1 > 0$ với mọi $x != 1$.
    + Vậy hàm số đồng biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-1$, $3$, $+oo$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($-oo$, $4$, $-2$, $+oo$),
  )
]
Hàm số đạt cực tiểu tại điểm nào?],
  (
    [$x = 4$],
    [$x = -1$],
    True([$x = 3$]),
    [$x = -2$]
  ),
  loigiai: [
    + Dựa vào bảng biến thiên, đạo hàm đổi dấu từ âm sang dương tại $x = 3$.
    + Do đó, hàm số đạt cực tiểu tại $x = 3$.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $y = x^3 - 3x^2 + 2$ trên đoạn $[-1; 4]$ bằng],
  (
    [0],
    True([-2]),
    [-4],
    [18]
  ),
  loigiai: [
    + Đạo hàm $y' = 3x^2 - 6x = 0 <=> x=0$ hoặc $x=2$.
    + Cả hai nghiệm đều thuộc đoạn $[-1; 4]$.
    + Tính các giá trị: $y(-1) = -2$, $y(0) = 2$, $y(2) = -2$, $y(4) = 18$.
    + Vậy giá trị nhỏ nhất trên đoạn $[-1; 4]$ là $-2$.
  ]
)

#tn([Tiệm cận đứng của đồ thị hàm số $y = (2x+3)/(x-1)$ là đường thẳng có phương trình],
  (
    [$x = 2$],
    [$y = 1$],
    [$y = 2$],
    True([$x = 1$])
  ),
  loigiai: [
    + Cho mẫu số bằng 0 ta có $x - 1 = 0 <=> x = 1$.
    + Giới hạn $lim_(x -> 1^+) (2x+3)/(x-1) = +oo$ nên $x = 1$ là tiệm cận đứng.
  ]
)

#tn([Trong một đợt bùng phát dịch bệnh, số lượng người nhiễm bệnh mới mỗi ngày được ước tính bằng hàm số $I(t) = (100t)/(t^2 + 9)$, với $t$ là số ngày kể từ khi dịch bắt đầu. Tốc độ lây nhiễm đạt mức cao nhất vào ngày thứ mấy?],
  (
    [Ngày thứ 1],
    [Ngày thứ 2],
    True([Ngày thứ 3]),
    [Ngày thứ 4]
  ),
  loigiai: [
    + Đạo hàm $I'(t) = (100(t^2+9) - 100t(2t))/(t^2+9)^2 = (900 - 100t^2)/(t^2+9)^2$.
    + $I'(t) = 0 <=> t^2 = 9 <=> t = 3$ (do $t >= 0$).
    + Bảng biến thiên cho thấy $I(t)$ đạt cực đại (GTLN) tại $t = 3$.
  ]
)

#tn([Cho hàm số $y = a x^3 + b x^2 + c x + d$ có đồ thị đi qua gốc tọa độ, đồng thời đạt cực đại tại $x = 0$ với giá trị cực đại là 0, và đạt cực tiểu tại $x = 2$. Khẳng định nào sau đây là đúng về các hệ số?],
  (
    True([$d = 0, c = 0$]),
    [$b = 0, c = 0$],
    [$a > 0, d = 2$],
    [$a < 0, c = 2$]
  ),
  loigiai: [
    + Đồ thị đi qua gốc tọa độ $(0; 0)$ nên $d = 0$.
    + Đạo hàm $y' = 3a x^2 + 2b x + c$.
    + Hàm số đạt cực trị tại $x = 0 => y'(0) = 0 => c = 0$.
    + Hàm số đạt cực tiểu tại $x = 2 => y'(2) = 0 => 12a + 4b = 0$.
    + Do đó $d=0$ và $c=0$.
  ]
)

#tn([Cho hàm số $f(x)$ có bảng xét dấu đạo hàm như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-2$, $1$, $5$, $+oo$),
    d-signs: ($+$, $0$, $-$, $0$, $+$, $0$, $-$),
    v-vals: ($-oo$, $3$, $-1$, $4$, $-oo$),
  )
]
Hàm số $y = f(x)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(-2; 5)$],
    True([$(1; 5)$]),
    [$(5; +oo)$],
    [$(-oo; 1)$]
  ),
  loigiai: [
    + Dựa vào bảng xét dấu đạo hàm, $f'(x) > 0$ trên các khoảng $(-oo; -2)$ và $(1; 5)$.
    + Vậy hàm số đồng biến trên khoảng $(1; 5)$.
  ]
)

#tn([Giá trị của một loại cổ phiếu trong 10 tháng đầu năm được mô phỏng bởi hàm số $P(t) = -t^3 + 9t^2 + 20$ (nghìn đồng), với $t$ là tháng ($1 <= t <= 10$). Giá cổ phiếu tăng trưởng trong khoảng thời gian nào?],
  (
    [Từ tháng 1 đến tháng 3],
    [Từ tháng 6 đến tháng 10],
    [Từ tháng 0 đến tháng 9],
    True([Từ tháng 1 đến tháng 6])
  ),
  loigiai: [
    + Đạo hàm $P'(t) = -3t^2 + 18t = -3t(t - 6)$.
    + $P'(t) = 0 <=> t=0$ hoặc $t=6$.
    + $P'(t) > 0 <=> 0 < t < 6$. Vì $t >= 1$, nên cổ phiếu tăng trưởng từ tháng 1 đến tháng 6.
  ]
)

#tn([Đồ thị hàm số $y = f(x)$ liên tục trên $RR \\ {2}$ và có bảng biến thiên:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $2$, $+oo$),
    d-signs: ($+$, "||", $-$),
    v-vals: ($3$, $+oo$, "||", $+oo$, $3$),
  )
]
Đồ thị hàm số đã cho có bao nhiêu đường tiệm cận?],
  (
    [1],
    True([2]),
    [3],
    [4]
  ),
  loigiai: [
    + $lim_(x -> -oo) f(x) = 3$ và $lim_(x -> +oo) f(x) = 3 => y = 3$ là tiệm cận ngang.
    + $lim_(x -> 2^+) f(x) = +oo => x = 2$ là tiệm cận đứng.
    + Đồ thị có tổng cộng 2 đường tiệm cận.
  ]
)

#tn([Một bác nông dân dùng $100$ mét lưới thép để rào thành một khu vườn hình chữ nhật. Diện tích lớn nhất của khu vườn mà bác có thể rào được là bao nhiêu?],
  (
    True([$625 m^2$]),
    [$2500 m^2$],
    [$500 m^2$],
    [$100 m^2$]
  ),
  loigiai: [
    + Gọi chiều dài và chiều rộng là $x, y$ (m). Chu vi $2(x+y) = 100 => x+y = 50 => y = 50-x$.
    + Diện tích $S(x) = x(50-x) = -x^2 + 50x$.
    + Đạo hàm $S'(x) = -2x + 50 = 0 <=> x = 25$.
    + Diện tích lớn nhất là $S(25) = 25 * 25 = 625 m^2$.
  ]
)

#tn([Khoảng cách giữa hai điểm cực trị của đồ thị hàm số $y = 2x^3 - 6x$ bằng],
  (
    [$4$],
    [$2sqrt(5)$],
    True([$2sqrt(17)$]),
    [$17$]
  ),
  loigiai: [
    + Đạo hàm $y' = 6x^2 - 6 = 0 <=> x = 1$ hoặc $x = -1$.
    + Các điểm cực trị: $A(1; -4)$ và $B(-1; 4)$.
    + Khoảng cách $A B = sqrt((-1-1)^2 + (4 - (-4))^2) = sqrt(4 + 64) = sqrt(68) = 2sqrt(17)$.
  ]
)

#tn([Đồ thị hàm số $y = (x^2 + x + 2)/(x - 1)$ có đường tiệm cận xiên là],
  (
    [$y = x + 1$],
    True([$y = x + 2$]),
    [$y = x - 1$],
    [$y = 2x + 1$]
  ),
  loigiai: [
    + Ta có $y = (x^2-x + 2x-2 + 4)/(x-1) = x(x-1)/(x-1) + (2(x-1))/(x-1) + 4/(x-1) = x + 2 + 4/(x-1)$.
    + Khi $x -> +- oo$, $4/(x-1) -> 0$. Vậy tiệm cận xiên là $y = x + 2$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (x^2 + 2x + 2)/(x + 1)$.],
  (
    False([Tập xác định của hàm số là $D = RR$.]),
    True([Đường thẳng $x = -1$ là tiệm cận đứng của đồ thị hàm số.]),
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = x + 1$.]),
    False([Hàm số đạt cực tiểu tại $x = -2$.])
  ),
  loigiai: [
    + Mẫu số $x+1 != 0 => D = RR \\ {-1}$. => a) Sai.
    + $lim_(x -> -1^+) y = +oo => x=-1$ là TCĐ. => b) Đúng.
    + Ta có $y = x + 1 + 1/(x+1)$. Suy ra $y = x+1$ là tiệm cận xiên. => c) Đúng.
    + Đạo hàm $y' = (x^2+2x)/(x+1)^2$. $y'=0 <=> x=0, x=-2$.
    + Tại $x=-2$, $y'' = 2/(-1)^3 < 0 => x=-2$ là cực đại. => d) Sai.
  ]
)

#ds([Một nghiên cứu chỉ ra rằng nồng độ của một loại thuốc trong máu (mg/L) sau khi tiêm $t$ giờ được tính bởi công thức $C(t) = 5t e^(-0.5 t)$ với $t >= 0$.],
  (
    True([Ngay tại thời điểm tiêm ($t=0$), nồng độ thuốc trong máu bằng 0.]),
    True([Nồng độ thuốc trong máu tăng liên tục trong 2 giờ đầu tiên.]),
    False([Nồng độ thuốc trong máu đạt mức cao nhất tại thời điểm $t = 5$ giờ.]),
    True([Nồng độ thuốc cao nhất trong máu xấp xỉ $3.68$ mg/L.])
  ),
  loigiai: [
    + $C(0) = 5*0 = 0$. => a) Đúng.
    + Đạo hàm $C'(t) = 5e^(-0.5t) - 2.5t e^(-0.5t) = 5e^(-0.5t)(1 - 0.5t)$.
    + $C'(t) = 0 <=> 1 - 0.5t = 0 <=> t = 2$.
    + Trong khoảng $(0; 2)$, $C'(t) > 0$ nên nồng độ thuốc tăng. => b) Đúng.
    + Nồng độ đạt cực đại tại $t=2$, không phải $t=5$. => c) Sai.
    + GTLN là $C(2) = 10e^(-1) = 10/e approx 3.678$ mg/L. => d) Đúng.
  ]
)

#ds([Cho đồ thị hàm số $y=f(x)$ liên tục trên $RR$ và có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $1$, $3$, $+oo$),
    d-signs: ($+$, $0$, $-$, $0$, $+$),
    v-vals: ($-oo$, $2$, $-2$, $+oo$),
  )
]],
  (
    True([Hàm số đồng biến trên các khoảng $(-oo; 1)$ và $(3; +oo)$.]),
    True([Giá trị cực tiểu của hàm số bằng $-2$.]),
    False([Đồ thị hàm số có tiệm cận ngang là $y = 2$.]),
    True([Giá trị lớn nhất của hàm số trên khoảng $(-oo; 3]$ là 2.])
  ),
  loigiai: [
    + Dựa vào BBT, $f'(x) > 0$ trên $(-oo; 1)$ và $(3; +oo)$. => a) Đúng.
    + Hàm số đạt cực tiểu tại $x=3$, giá trị cực tiểu là $-2$. => b) Đúng.
    + $lim_(x -> +-oo) f(x) = +-oo$ nên đồ thị không có TCN. => c) Sai.
    + Trên khoảng $(-oo; 3
  ]$, đỉnh cao nhất của đồ thị là tại $x=1$ với $y=2$, nên GTLN trên khoảng này là 2. => d) Đúng.
  ]
)

#ds([Cho hàm số $f(x) = (2x-1)/(x-1)$.],
  (
    True([Đồ thị hàm số có tiệm cận ngang là đường thẳng $y = 2$.]),
    False([Đồ thị hàm số đi qua điểm $A(1; 2)$.]),
    True([Hàm số luôn nghịch biến trên từng khoảng xác định.]),
    False([Giao điểm của hai đường tiệm cận nằm trên trục tung.])
  ),
  loigiai: [
    + $lim_(x -> +-oo) y = 2 => y=2$ là TCN. => a) Đúng.
    + Tại $x=1$ hàm số không xác định nên không đi qua $A(1;2)$. => b) Sai.
    + Đạo hàm $y' = (2(-1) - 1(-1))/(x-1)^2 = -1/(x-1)^2 < 0 forall x != 1$. => c) Đúng.
    + Tiệm cận đứng $x=1$, tiệm cận ngang $y=2$. Giao điểm là $I(1; 2)$. Điểm này có hoành độ $1 != 0$ nên không nằm trên trục tung. => d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Một người uống một lượng rượu, nồng độ cồn trong máu (tính bằng mg/mL) sau $t$ giờ được mô hình hóa bởi hàm số $C(t) = (2t)/(t^2+1)$. Nồng độ cồn trong máu đạt mức cao nhất sau bao nhiêu giờ?],
  [1],
  loigiai: [
    + Đạo hàm $C'(t) = (2(t^2+1) - 2t(2t))/(t^2+1)^2 = (2 - 2t^2)/(t^2+1)^2$.
    + $C'(t) = 0 <=> 2 - 2t^2 = 0 <=> t = 1$ (do $t > 0$).
    + Vậy nồng độ cồn đạt cực đại sau 1 giờ.
  ]
)

#tln([Tốc độ một phản ứng hóa học phụ thuộc vào nồng độ của chất xúc tác $x$ (%) theo hàm số $v(x) = x(12-x)^2$ với $0 <= x <= 12$. Tốc độ phản ứng đạt lớn nhất khi nồng độ chất xúc tác $x$ bằng bao nhiêu?],
  [4],
  loigiai: [
    + $v'(x) = 1 * (12-x)^2 + x * 2(12-x)(-1) = (12-x)(12-x - 2x) = (12-x)(12-3x)$.
    + $v'(x) = 0 <=> x=12$ (loại) hoặc $x=4$.
    + Bảng biến thiên cho thấy cực đại đạt tại $x=4$.
  ]
)

#tln([Một công ty sản xuất một loại sản phẩm. Khi mức giá bán là $p(x) = 100 - 2x$ (nghìn đồng) mỗi sản phẩm, thì công ty sẽ bán được $x$ sản phẩm. Biết rằng tổng chi phí sản xuất $x$ sản phẩm là $C(x) = 10x + 20$ (nghìn đồng). Để công ty đạt lợi nhuận cao nhất, họ cần bán ra bao nhiêu sản phẩm?],
  [22.5],
  loigiai: [
    + Doanh thu: $R(x) = p(x) * x = (100-2x)x = 100x - 2x^2$.
    + Lợi nhuận: $P(x) = R(x) - C(x) = 100x - 2x^2 - (10x + 20) = -2x^2 + 90x - 20$.
    + Đạo hàm $P'(x) = -4x + 90 = 0 <=> x = 22.5$.
    + Vậy cần bán 22.5 sản phẩm (ví dụ lô hàng nghìn đơn vị) để lợi nhuận tối đa.
  ]
)

#tln([Một nhà xưởng sản xuất có lợi nhuận hàng ngày (triệu đồng) được mô hình hóa bởi hàm số $P(x) = 1000 + 400x - x^2$, trong đó $x$ là số lượng công nhân làm việc. Để lợi nhuận trong ngày đạt mức lớn nhất, nhà xưởng cần huy động bao nhiêu công nhân?],
  [200],
  loigiai: [
    + Đạo hàm $P'(x) = 400 - 2x$.
    + $P'(x) = 0 <=> 2x = 400 <=> x = 200$.
    + Parabol bề lõm quay xuống nên đạt cực đại tại đỉnh $x = 200$.
  ]
)

#tln([Một người chèo thuyền từ vị trí $A$ trên bờ sông thẳng rộng 3 km, muốn đến vị trí $B$ nằm trên bờ đối diện. Bờ đối diện coi như một đường thẳng song song với bờ bên này. Hình chiếu vuông góc của $A$ lên bờ đối diện là $C$, biết khoảng cách từ $C$ đến $B$ là 8 km. Vận tốc chèo thuyền là 4 km/h và vận tốc chạy bộ trên bờ là 5 km/h. Người đó chọn cập bờ tại điểm $D$ nằm giữa $C$ và $B$ sao cho thời gian di chuyển từ $A$ đến $B$ (gồm chèo thuyền đoạn $A D$ và chạy bộ đoạn $D B$) là ngắn nhất. Khoảng cách $C D$ bằng bao nhiêu km?],
  [4],
  loigiai: [
    + Gọi $x$ (km) là khoảng cách $C D$ ($0 <= x <= 8$). Khi đó $A D = sqrt(x^2 + 3^2) = sqrt(x^2+9)$ và $D B = 8 - x$.
    + Tổng thời gian di chuyển: $t(x) = sqrt(x^2+9)/4 + (8-x)/5$.
    + Đạo hàm $t'(x) = x/(4sqrt(x^2+9)) - 1/5$.
    + $t'(x) = 0 <=> 5x = 4sqrt(x^2+9) <=> 25x^2 = 16(x^2+9) <=> 9x^2 = 144 <=> x^2 = 16$.
    + Vì $x > 0$ nên $x = 4$. Lập BBT thấy $t(x)$ đạt GTNN tại $x=4$.
    + Vậy khoảng cách $C D$ là 4 km.
  ]
)

#tln([Từ một tấm bìa hình vuông có cạnh $30$ cm, một người thợ cắt bỏ ở bốn góc bốn hình vuông bằng nhau có cạnh $x$ (cm), rồi gập các mép lại để tạo thành một chiếc hộp không nắp. Thể tích lớn nhất của chiếc hộp này là bao nhiêu $c m^3$?],
  [2000],
  loigiai: [
    + Thể tích hộp là $V(x) = x(30 - 2x)^2$ với $0 < x < 15$.
    + Đạo hàm $V'(x) = (30-2x)^2 + x * 2(30-2x)(-2) = (30-2x)(30 - 2x - 4x) = (30-2x)(30-6x)$.
    + $V'(x) = 0 <=> x = 5$ (nhận) hoặc $x = 15$ (loại).
    + Thể tích lớn nhất đạt tại $x = 5$, khi đó $V(5) = 5 * (30 - 10)^2 = 5 * 400 = 2000$.
  ]
)
