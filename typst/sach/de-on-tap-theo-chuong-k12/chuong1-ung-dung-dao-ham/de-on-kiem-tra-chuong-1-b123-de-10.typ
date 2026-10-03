#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("10b981") // Emerald for Exam 10
#let ma-de = "1010"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 10)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = (-2x+1)/(x+3)$ đồng biến trên khoảng nào dưới đây?],
  (
    [$(1; +oo)$],
    True([Không có khoảng đồng biến]),
    [$(-oo; -3)$],
    [$(-oo; +oo)$]
  ),
  loigiai: [
    + Tập xác định $D = RR \\ {-3}$.
    + Đạo hàm $y' = (-2*3 - 1*1)/(x+3)^2 = -7/(x+3)^2 < 0 forall x != -3$.
    + Vậy hàm số luôn nghịch biến trên các khoảng xác định, không có khoảng đồng biến.
  ]
)

#tn([Đường tiệm cận ngang của đồ thị hàm số $y = (5x-1)/(x-2)$ có phương trình là],
  (
    [$x = 2$],
    [$y = -1/2$],
    True([$y = 5$]),
    [$x = 5$]
  ),
  loigiai: [
    + Ta có $lim_(x -> +-oo) y = 5$.
    + Vậy tiệm cận ngang là đường thẳng $y = 5$.
  ]
)

#tn([Điểm cực đại của đồ thị hàm số $y = -x^3 + 3x^2 - 4$ có tọa độ là],
  (
    [$(0; -4)$],
    True([$(2; 0)$]),
    [$(2; -4)$],
    [$(-2; 0)$]
  ),
  loigiai: [
    + $y' = -3x^2 + 6x = -3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.
    + Bảng biến thiên: hàm số đạt cực đại tại $x = 2$.
    + Thay $x = 2$ vào hàm số, ta có $y = 0$. Tọa độ điểm cực đại: $(2; 0)$.
  ]
)

#tn([Số giao điểm của đồ thị hàm số $y = (x^2-2x+2)/(x-1)$ với đường tiệm cận xiên của nó là],
  (
    True([$0$]),
    [$1$],
    [$2$],
    [$3$]
  ),
  loigiai: [
    + Thực hiện phép chia: $y = x - 1 + 1/(x-1)$.
    + Tiệm cận xiên là $y = x - 1$.
    + Phương trình hoành độ giao điểm: $x - 1 + 1/(x-1) = x - 1 <=> 1/(x-1) = 0$ (vô nghiệm).
    + Vậy số giao điểm là 0.
  ]
)

#tn([Một doanh nghiệp sản xuất một loại sản phẩm với hàm chi phí trung bình (nghìn đồng/sản phẩm) là $overline(C)(x) = 2x + 50 + 20000/x$ ($x > 0$), trong đó $x$ là số lượng sản phẩm. Sản xuất bao nhiêu sản phẩm để chi phí trung bình là thấp nhất?],
  (
    [$50$],
    True([$100$]),
    [$150$],
    [$200$]
  ),
  loigiai: [
    + Áp dụng BĐT AM-GM: $overline(C)(x) = 2x + 20000/x + 50 >= 2sqrt(2x * 20000/x) + 50 = 2sqrt(40000) + 50 = 400 + 50 = 450$.
    + Dấu "=" xảy ra khi $2x = 20000/x <=> x^2 = 10000 <=> x = 100$.
    + Vậy cần sản xuất 100 sản phẩm.
  ]
)

#tn([Đồ thị hàm số $y = (x^2 - x - 2)/(x^2 - 4)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [$0$],
    True([$1$]),
    [$2$],
    [$3$]
  ),
  loigiai: [
    + Tử số: $x^2 - x - 2 = (x-2)(x+1)$.
    + Mẫu số: $x^2 - 4 = (x-2)(x+2)$.
    + Rút gọn (với $x != 2, x != -2$): $y = (x+1)/(x+2)$.
    + Tại $x=-2$, mẫu bằng 0, tử bằng $-1 != 0$. TCĐ: $x = -2$.
    + Tại $x=2$ là điểm kỳ dị bỏ được. Vậy có đúng 1 tiệm cận đứng.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $y = x^4 - 2x^2 + 3$ trên $RR$ là],
  (
    [$0$],
    True([$2$]),
    [$3$],
    [$4$]
  ),
  loigiai: [
    + $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = +-1$.
    + Hàm số đạt GTNN tại cực tiểu.
    + $y(1) = 1 - 2 + 3 = 2$, $y(-1) = 2$.
    + Vậy GTNN là 2.
  ]
)

#tn([Nồng độ vi khuẩn (nghìn con/mL) trong một mẫu nước được mô hình hóa bởi $N(t) = (12t)/(t^2+4)$ sau $t$ giờ ($t >= 0$). Nồng độ vi khuẩn lớn nhất trong khoảng thời gian này là],
  (
    [$1.5$ nghìn con/mL],
    True([$3$ nghìn con/mL]),
    [$4$ nghìn con/mL],
    [$6$ nghìn con/mL]
  ),
  loigiai: [
    + $N'(t) = (12(t^2+4) - 12t(2t))/(t^2+4)^2 = (48 - 12t^2)/(t^2+4)^2$.
    + $N'(t) = 0 <=> 12t^2 = 48 <=> t^2 = 4 <=> t = 2$.
    + Giá trị lớn nhất $N(2) = (12*2)/(2^2+4) = 24/8 = 3$ (nghìn con/mL).
  ]
)

#tn([Cho hàm số $y = (-x+2)/(x-1)$. Khẳng định nào sau đây là sai?],
  (
    [Tập xác định của hàm số là $RR \\ {1}$.],
    [Đồ thị hàm số có tiệm cận đứng là $x = 1$.],
    True([Đồ thị hàm số có tiệm cận ngang là $y = 1$.]),
    [Hàm số nghịch biến trên từng khoảng xác định.]
  ),
  loigiai: [
    + $lim_(x -> +-oo) y = -1 =>$ TCN là $y = -1$, không phải $y = 1$. Vậy c sai.
    + Đạo hàm $y' = (-1*(-1) - 1*2)/(x-1)^2 = (1 - 2)/(x-1)^2 = -1/(x-1)^2 < 0$. Hàm số nghịch biến (Đúng).
  ]
)

#tn([Vận tốc của một hạt di chuyển dọc theo trục được cho bởi $v(t) = -t^3 + 9t^2 + 21t$ (m/s) với $t >= 0$ (s). Gia tốc lớn nhất của hạt là],
  (
    [$15 m/s^2$],
    True([$48 m/s^2$]),
    [$27 m/s^2$],
    [$60 m/s^2$]
  ),
  loigiai: [
    + Gia tốc $a(t) = v'(t) = -3t^2 + 18t + 21$.
    + Để tìm GTLN của gia tốc, ta xét hàm $a(t)$.
    + $a'(t) = -6t + 18 = 0 <=> t = 3$.
    + Gia tốc lớn nhất $a(3) = -3(3^2) + 18(3) + 21 = -27 + 54 + 21 = 48 (m/s^2)$.
  ]
)

#tn([Cho hình chữ nhật có chu vi bằng 24 cm. Diện tích lớn nhất của hình chữ nhật này là bao nhiêu?],
  (
    [$24 "cm"^2$],
    True([$36 "cm"^2$]),
    [$16 "cm"^2$],
    [$48 "cm"^2$]
  ),
  loigiai: [
    + Gọi 2 cạnh của hình chữ nhật là $x$ và $y$ ($x, y > 0$).
    + Ta có $2(x+y) = 24 => x+y = 12 => y = 12-x$.
    + Diện tích $S(x) = x(12-x) = 12x - x^2$.
    + Đạo hàm $S'(x) = 12 - 2x = 0 <=> x=6$.
    + Diện tích lớn nhất là $S(6) = 6 * (12-6) = 36$ ($"cm"^2$).
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (-x^2 + x - 2)/(x - 1)$.],
  (
    True([Tập xác định của hàm số là $RR \\ {1}$.]),
    True([Đồ thị hàm số có đường tiệm cận đứng là $x = 1$.]),
    False([Đồ thị hàm số có đường tiệm cận ngang là $y = -1$.]),
    True([Đồ thị hàm số có đường tiệm cận xiên là $y = -x$.])
  ),
  loigiai: [
    + Mẫu số $x - 1 != 0 <=> x != 1$. => a) Đúng.
    + Tại $x=1$, mẫu bằng 0, tử bằng $-2 != 0$. TCĐ: $x=1$. => b) Đúng.
    + Bậc tử lớn hơn bậc mẫu nên đồ thị KHÔNG có tiệm cận ngang. => c) Sai.
    + Chia đa thức: $(-x^2 + x - 2) / (x - 1) = -x - 2/(x-1)$. Tiệm cận xiên là $y = -x$. => d) Đúng.
  ]
)

#ds([Một doanh nghiệp sản xuất một loại phân bón. Gọi $x$ (tấn) là khối lượng phân bón sản xuất được ($0 <= x <= 200$). Lợi nhuận của doanh nghiệp (đơn vị: triệu đồng) được mô hình hóa bởi $P(x) = -2x^3 + 600x^2$.],
  (
    True([Nếu không sản xuất sản phẩm nào thì lợi nhuận bằng 0.]),
    True([Đạo hàm của hàm lợi nhuận là $P'(x) = -6x^2 + 1200x$.]),
    True([Doanh nghiệp cần sản xuất 200 tấn phân bón để lợi nhuận đạt mức tối đa.]),
    False([Lợi nhuận cao nhất đạt được là $10000$ triệu đồng.])
  ),
  loigiai: [
    + $P(0) = 0$. => a) Đúng.
    + $P'(x) = -6x^2 + 1200x$. => b) Đúng.
    + $P'(x) = 0 <=> x = 0$ hoặc $x = 200$.
    + Lập bảng biến thiên trên $[0; 200]$, ta thấy $P'(x) >= 0 forall x in (0; 200)$, nên hàm số đồng biến, đạt cực đại tại biên $x=200$. => c) Đúng.
    + Lợi nhuận lớn nhất $P(200) = -2(200^3) + 600(200^2) = 200^2(-400 + 600) = 40000 * 200 = 8000000$ (triệu đồng). => d) Sai.
  ]
)

#ds([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {-1}$ và có bảng biến thiên:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $-1$, $0$, $+oo$),
    d-signs: ($-$, "||", $-$, $0$, $+$),
    v-vals: ($-2$, $-oo$, "||", $+oo$, $1$, $+oo$),
  )
]],
  (
    True([Đồ thị hàm số có tiệm cận ngang là $y = -2$.]),
    True([Đồ thị hàm số có tiệm cận đứng là $x = -1$.]),
    True([Hàm số đạt cực tiểu tại $x = 0$.]),
    False([Giá trị nhỏ nhất của hàm số trên $(0; +oo)$ là $-2$.])
  ),
  loigiai: [
    + Khi $x -> -oo$, $y -> -2 => y=-2$ là tiệm cận ngang. => a) Đúng.
    + Tại $x=-1$, $y -> +-oo => x=-1$ là tiệm cận đứng. => b) Đúng.
    + Tại $x=0$, $y'$ đổi dấu từ $-$ sang $+$ nên $x=0$ là điểm cực tiểu. => c) Đúng.
    + Trên $(0; +oo)$, GTNN của hàm số đạt tại cực tiểu, tức là $y=1$. (Không phải $-2$). => d) Sai.
  ]
)

#ds([Nồng độ một loại thuốc trong máu của bệnh nhân (tính bằng mg/L) sau $t$ giờ tiêm được cho bởi hàm số $C(t) = (at)/(t^2 + b)$ với $a, b > 0$. Biết rằng sau 2 giờ thì nồng độ đạt cực đại và bằng 5 mg/L.],
  (
    True([$b = 4$.]),
    True([$a = 20$.]),
    False([Nồng độ thuốc sau 4 giờ lớn hơn sau 3 giờ.]),
    True([Tại thời điểm nồng độ bằng $4$ mg/L (sau khi đã đạt đỉnh), thời gian đã trôi qua là $4$ giờ.])
  ),
  loigiai: [
    + Ta có $C(2) = 5 <=> (2a)/(4+b) = 5 <=> 2a = 20 + 5b$.
    + $C'(t) = (a(t^2+b) - at(2t))/(t^2+b)^2 = (a(b-t^2))/(t^2+b)^2$.
    + Nồng độ đạt cực đại tại $t=2 => C'(2) = 0 <=> b - 4 = 0 <=> b = 4$. => a) Đúng.
    + Thay $b=4$ vào $2a = 20 + 5(4) = 40 => a = 20$. => b) Đúng.
    + Suy ra $C(t) = (20t)/(t^2+4)$. Đạo hàm $C'(t) = (20(4-t^2))/(t^2+4)^2 < 0$ khi $t > 2$.
    + Hàm số nghịch biến khi $t > 2$. Do đó $C(4) < C(3)$. => c) Sai.
    + Giải $C(t) = 4 <=> (20t)/(t^2+4) = 4 <=> 4t^2 - 20t + 16 = 0 <=> t=1$ hoặc $t=4$.
    + Sau khi đã đạt đỉnh ($t > 2$), ta lấy $t=4$. => d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Một vật đang chuyển động dọc theo một đường thẳng. Phương trình chuyển động của vật được mô tả bởi $s(t) = -t^3 + 9t^2 + 21t$, với $s$ tính bằng mét và $t >= 0$ tính bằng giây. Vận tốc của vật đạt lớn nhất là bao nhiêu $m/s$?],
  [48],
  loigiai: [
    + Vận tốc $v(t) = s'(t) = -3t^2 + 18t + 21$.
    + Để tìm vận tốc lớn nhất, ta xét hàm $v(t)$.
    + $v'(t) = -6t + 18 = 0 <=> t = 3$.
    + Vận tốc lớn nhất là $v(3) = -3(3^2) + 18(3) + 21 = -27 + 54 + 21 = 48$ ($m/s$).
  ]
)

#tln([Một công ty hàng không ước tính rằng nếu giá vé máy bay cho một chuyến đi là $p(x) = 120 - 0.5x$ (USD) thì số lượng vé bán được là $x$ vé. Hỏi công ty cần bán ra bao nhiêu vé máy bay để doanh thu từ chuyến bay là lớn nhất?],
  [120],
  loigiai: [
    + Doanh thu: $R(x) = x * p(x) = x(120 - 0.5x) = 120x - 0.5x^2$.
    + Đạo hàm $R'(x) = 120 - x$.
    + Cho $R'(x) = 0 <=> x = 120$.
    + Bảng biến thiên cho thấy cực đại đạt tại $x=120$. Vậy cần bán 120 vé.
  ]
)

#tln([Năng suất thu hoạch một giống lúa mới (tạ/ha) phụ thuộc vào lượng phân bón $x$ (kg/ha) theo phương trình $Y(x) = -x^2 + 40x + 10$. Để năng suất đạt cao nhất, người nông dân cần bón bao nhiêu kg phân bón cho mỗi ha?],
  [20],
  loigiai: [
    + Đạo hàm $Y'(x) = -2x + 40$.
    + Cho $Y'(x) = 0 <=> 2x = 40 <=> x = 20$.
    + Đồ thị hàm số là parabol bề lõm quay xuống nên đạt GTLN tại $x = 20$.
  ]
)

#tln([Chi phí năng lượng (calo/km) của một loài cá khi bơi ngược dòng với vận tốc $v$ (km/h) được cho bởi $E(v) = 100/v + v/4$ ($v > 0$). Con cá cần bơi với vận tốc bao nhiêu km/h để tiêu hao ít năng lượng nhất trên mỗi km?],
  [20],
  loigiai: [
    + Áp dụng BĐT AM-GM cho hai số dương:
    + $E(v) = 100/v + v/4 >= 2sqrt(100/v * v/4) = 2sqrt(25) = 10$.
    + Dấu "=" xảy ra khi $100/v = v/4 <=> v^2 = 400 <=> v = 20$.
    + Vậy vận tốc tối ưu là $20$ km/h.
  ]
)

#tln([Hàm số $y = (x^2 - x - 2)/(x^2 - 4)$ có bao nhiêu đường tiệm cận đứng?],
  [1],
  loigiai: [
    + Phân tích tử: $x^2 - x - 2 = (x-2)(x+1)$.
    + Phân tích mẫu: $x^2 - 4 = (x-2)(x+2)$.
    + Rút gọn (với $x != +-2$): $y = (x+1)/(x+2)$.
    + Nghiệm của mẫu rút gọn là $x = -2$. Tử số tại $x=-2$ bằng $-1 != 0$.
    + Vậy đồ thị có đúng 1 đường tiệm cận đứng là $x = -2$.
  ]
)

#tln([Giá trị nhỏ nhất của hàm số $y = x^4 - 2x^2 + 3$ bằng bao nhiêu?],
  [2],
  loigiai: [
    + Tập xác định $D = RR$.
    + Đạo hàm $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = +-1$.
    + Bảng biến thiên cho thấy hàm số đạt giá trị nhỏ nhất tại $x = +-1$.
    + GTNN: $y(1) = y(-1) = 1 - 2 + 3 = 2$.
  ]
)

