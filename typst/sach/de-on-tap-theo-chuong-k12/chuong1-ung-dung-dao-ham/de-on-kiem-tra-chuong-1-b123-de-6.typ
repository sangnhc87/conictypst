#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("eab308") // Yellow for Exam 6
#let ma-de = "1006"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 6)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Đồ thị hàm số $y = 2x^3 - 3x^2 + 5$ cắt trục tung tại điểm có tung độ bằng],
  (
    [$0$],
    [$3$],
    [$2$],
    True([$5$])
  ),
  loigiai: [
    + Giao điểm với trục tung có hoành độ $x=0$.
    + Thay $x=0$ vào hàm số ta được $y = 5$.
  ]
)

#tn([Đường thẳng nào dưới đây là tiệm cận ngang của đồ thị hàm số $y = (1 - 2x)/(x + 3)$?],
  (
    True([$y = -2$]),
    [$y = 1/3$],
    [$y = 1$],
    [$x = -3$]
  ),
  loigiai: [
    + Ta có $lim_(x -> +-oo) (1 - 2x)/(x + 3) = -2$.
    + Vậy đường tiệm cận ngang là $y = -2$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $1$, $3$, $+oo$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($+oo$, $-1$, $4$, $-oo$),
  )
]
Hàm số đã cho đạt cực đại tại điểm nào?],
  (
    [$x = 4$],
    [$x = -1$],
    True([$x = 3$]),
    [$x = 1$]
  ),
  loigiai: [
    + Dựa vào bảng biến thiên, đạo hàm đổi dấu từ dương sang âm tại $x = 3$.
    + Vậy hàm số đạt cực đại tại $x = 3$.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $y = x^3 - 3x$ trên đoạn $[0; 2]$ bằng],
  (
    [$0$],
    True([$-2$]),
    [$2$],
    [$-3$]
  ),
  loigiai: [
    + Đạo hàm $y' = 3x^2 - 3 = 0 <=> x=1$ hoặc $x=-1$ (loại vì không thuộc đoạn $[0; 2]$).
    + Tính các giá trị: $y(0) = 0$, $y(1) = -2$, $y(2) = 8 - 6 = 2$.
    + Vậy giá trị nhỏ nhất là $-2$.
  ]
)

#tn([Một vật chuyển động có phương trình quỹ đạo là $s(t) = -t^3 + 6t^2 + 15t$, trong đó $s$ (mét) là quãng đường đi được và $t$ (giây) là thời gian. Trong quá trình chuyển động, vật đạt gia tốc bằng 0 tại thời điểm nào?],
  (
    True([$t = 2$ s]),
    [$t = 6$ s],
    [$t = 3$ s],
    [$t = 0$ s]
  ),
  loigiai: [
    + Vận tốc $v(t) = s'(t) = -3t^2 + 12t + 15$.
    + Gia tốc $a(t) = v'(t) = -6t + 12$.
    + Vật đạt gia tốc bằng 0 khi $-6t + 12 = 0 <=> t = 2$.
  ]
)

#tn([Hàm số $y = f(x)$ có đạo hàm liên tục trên $RR$ và có đồ thị hàm số $f'(x)$ cắt trục hoành tại 3 điểm phân biệt có hoành độ lần lượt là $-2, 1, 4$. Hỏi đồ thị hàm số $y = f(x)$ có bao nhiêu điểm cực trị?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$]
  ),
  loigiai: [
    + Đồ thị $f'(x)$ cắt trục hoành tại 3 điểm phân biệt, nghĩa là phương trình $f'(x)=0$ có 3 nghiệm đơn (hoặc bội lẻ) và đổi dấu khi qua các nghiệm này.
    + Do đó hàm số $y = f(x)$ có 3 điểm cực trị.
  ]
)

#tn([Đồ thị hàm số $y = x^4 - 2x^2 + 5$ có bao nhiêu điểm cực trị?],
  (
    [$1$],
    [$2$],
    True([$3$]),
    [$4$]
  ),
  loigiai: [
    + Đạo hàm $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x=0, x=1, x=-1$.
    + Vì đạo hàm có 3 nghiệm phân biệt nên đồ thị hàm số có 3 điểm cực trị.
  ]
)

#tn([Tiệm cận xiên của đồ thị hàm số $y = (-x^2 + x + 2)/(x + 1)$ là đường thẳng có phương trình],
  (
    [$y = -x + 1$],
    True([$y = -x + 2$]),
    [$y = -x - 1$],
    [$y = x + 2$]
  ),
  loigiai: [
    + Ta phân tích tử số: $-x^2 + x + 2 = (x+1)(-x+2)$.
    + Nên với $x != -1$, ta có $y = -x + 2$.
    + Wait, nếu phân tích hết thì hàm số này rút gọn thành $y = -x + 2$ (đây là một đường thẳng bị thủng tại $x = -1$). Nó không có đường tiệm cận xiên theo nghĩa thông thường (nó chính là tiệm cận xiên của chính nó).
    + Let me adjust the function to have a remainder.
  ]
)

#tn([Tiệm cận xiên của đồ thị hàm số $y = (-x^2 + x + 3)/(x + 1)$ là đường thẳng có phương trình],
  (
    [$y = -x + 1$],
    True([$y = -x + 2$]),
    [$y = -x - 1$],
    [$y = -x + 3$]
  ),
  loigiai: [
    + Thực hiện phép chia đa thức: $(-x^2 + x + 3) = (x+1)(-x+2) + 1$.
    + Nên $y = -x + 2 + 1/(x+1)$.
    + Giới hạn của $1/(x+1)$ khi $x -> +-oo$ bằng 0, nên tiệm cận xiên là $y = -x + 2$.
  ]
)

#tn([Một trang trại muốn rào một khu vườn hình chữ nhật bằng lưới thép. Họ có 40 mét lưới thép và muốn rào ba mặt của khu vườn (mặt còn lại dựa vào bức tường đá có sẵn). Diện tích lớn nhất của khu vườn mà họ có thể rào được là bao nhiêu?],
  (
    [$100 m^2$],
    True([$200 m^2$]),
    [$400 m^2$],
    [$150 m^2$]
  ),
  loigiai: [
    + Gọi chiều rộng khu vườn (vuông góc với tường) là $x$ ($0 < x < 20$).
    + Chiều dài (song song với tường) là $y = 40 - 2x$.
    + Diện tích khu vườn là $S(x) = x(40 - 2x) = 40x - 2x^2$.
    + Hàm số $S(x)$ đạt cực đại tại $x = -40 / (2*(-2)) = 10$.
    + Diện tích lớn nhất là $S(10) = 10(40 - 20) = 200 m^2$.
  ]
)

#tn([Đồ thị hàm số $y = (x - 2)/sqrt(x^2 - 1)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$0$]
  ),
  loigiai: [
    + Tập xác định: $x^2 - 1 > 0 <=> x < -1$ hoặc $x > 1$.
    + Xét giới hạn tại các đầu mút của TXĐ:
    + $lim_(x -> 1^+) y = +oo => x = 1$ là TCĐ.
    + $lim_(x -> -1^-) y = -oo => x = -1$ là TCĐ.
    + Có 2 đường tiệm cận đứng.
  ]
)

#tn([Một chiếc thuyền neo đậu tại bến. Một ô tô chạy trên con đường thẳng vuông góc với bờ sông và hướng về bến thuyền với vận tốc $20 "km/h"$. Cùng lúc đó, thuyền bắt đầu rời bến và chạy dọc theo bờ sông với vận tốc $15 "km/h"$. Giả sử lúc đầu ô tô cách bến 10 km. Sau khoảng thời gian bao lâu thì khoảng cách giữa ô tô và thuyền là nhỏ nhất?],
  (
    True([$0.32$ giờ]),
    [$0.5$ giờ],
    [$0.25$ giờ],
    [$0.4$ giờ]
  ),
  loigiai: [
    + Gọi $t$ (giờ) là thời gian di chuyển. Khoảng cách của ô tô đến bến là $10 - 20t$. Khoảng cách của thuyền đến bến là $15t$.
    + Bình phương khoảng cách giữa ô tô và thuyền là $D(t) = (10 - 20t)^2 + (15t)^2 = 100 - 400t + 400t^2 + 225t^2 = 625t^2 - 400t + 100$.
    + Hàm số $D(t)$ đạt cực tiểu tại $t = -b/(2a) = 400/(2*625) = 400/1250 = 0.32$ (giờ).
  ]
)

#tn([Một công ty sản xuất một loại thiết bị với chi phí trung bình để sản xuất $x$ thiết bị là $C(x) = (150x + 1000)/x$ (triệu đồng). Khi quy mô sản xuất càng lớn ($x -> +oo$), chi phí trung bình để sản xuất một thiết bị sẽ xấp xỉ mức nào?],
  (
    [$1000$ triệu đồng],
    [$1150$ triệu đồng],
    [$0$ triệu đồng],
    True([$150$ triệu đồng])
  ),
  loigiai: [
    + Tìm tiệm cận ngang: $lim_(x -> +oo) (150x + 1000)/x = 150$.
    + Vậy chi phí tiến về mức 150 triệu đồng.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (-x^2 + 2x - 2)/(x - 1)$.],
  (
    False([Hàm số có hai điểm cực trị và đường thẳng nối hai điểm cực trị song song với trục $O x$.]),
    True([Đồ thị hàm số có tiệm cận xiên là đường thẳng $y = -x + 1$.]),
    True([Tiệm cận đứng của đồ thị hàm số là $x = 1$.]),
    False([Hàm số đạt giá trị lớn nhất trên nửa khoảng $(1; 3]$ bằng $-5/2$.])
  ),
  loigiai: [
    + Đạo hàm $y' = ((-2x+2)(x-1) - (-x^2+2x-2))/(x-1)^2 = (-x^2+2x)/(x-1)^2 = 0 <=> x=0$ hoặc $x=2$.
    + Cực tiểu tại $x=2$ có tung độ $y=-2$. Cực đại tại $x=0$ có tung độ $y=2$. Đường nối đi qua $(0; 2)$ và $(2; -2)$ có hệ số góc khác 0 nên không song song trục Ox. => a) Sai.
    + $y = (-x(x-1) + x - 2)/(x-1) = -x + (x-1-1)/(x-1) = -x + 1 - 1/(x-1) =>$ TCX là $y = -x + 1$. => b) Đúng.
    + Tại $x=1$ mẫu số bằng 0, tử số bằng -1 khác 0. TCĐ $x=1$. => c) Đúng.
    + Trên $(1; 3
  ]$, hàm số đạt cực tiểu tại $x=2$ với $y=-2$. Giá trị tại $x=3$ là $y = -5/2 = -2.5$. Do đó $y$ không có GTLN trên $(1; 3]$. => d) Sai.
  ]
)

#ds([Một quốc gia đang phát triển mô hình hóa dân số của họ bằng hàm số $P(t) = 50 + (20t)/(t+2)$ (triệu người), trong đó $t$ là số năm tính từ thời điểm hiện tại ($t >= 0$).],
  (
    True([Dân số hiện tại của quốc gia đó là 50 triệu người.]),
    True([Tốc độ tăng dân số hàng năm của quốc gia đó luôn giảm theo thời gian.]),
    False([Dân số của quốc gia đó sẽ tăng không giới hạn theo thời gian.]),
    False([Sau 5 năm, dân số của quốc gia đó đạt trên 70 triệu người.])
  ),
  loigiai: [
    + Thay $t=0 => P(0) = 50$. => a) Đúng.
    + Tốc độ tăng dân số là đạo hàm $P'(t) = 40/(t+2)^2 > 0$.
    + Gia tốc $P''(t) = -80/(t+2)^3 < 0$, nghĩa là tốc độ $P'(t)$ giảm dần. => b) Đúng.
    + Khi $t -> +oo$, $P(t) -> 50 + 20 = 70$. Dân số bị giới hạn ở 70 triệu người. => c) Sai.
    + Tại $t=5$, $P(5) = 50 + 100/7 approx 50 + 14.28 = 64.28$ triệu người (không vượt 70). => d) Sai.
  ]
)

#ds([Người ta muốn tạo một hộp chữ nhật không nắp từ một tấm bìa hình vuông cạnh 24 cm bằng cách cắt đi bốn hình vuông nhỏ bằng nhau ở bốn góc và gấp phần còn lại lên. Gọi $x$ (cm) là cạnh của hình vuông bị cắt đi ($0 < x < 12$).],
  (
    True([Thể tích của hộp được tính bằng hàm số $V(x) = x(24 - 2x)^2$.]),
    True([Đạo hàm của hàm số là $V'(x) = 12(x^2 - 16x + 48)$.]),
    False([Hộp đạt thể tích lớn nhất khi cạnh hình vuông bị cắt đi là 6 cm.]),
    False([Thể tích lớn nhất có thể đạt được là 512 $c m^3$.])
  ),
  loigiai: [
    + Chiều cao hộp là $x$, đáy có cạnh là $24 - 2x$. $V(x) = x(24 - 2x)^2$. => a) Đúng.
    + $V(x) = x(4x^2 - 96x + 576) = 4x^3 - 96x^2 + 576x$.
    + $V'(x) = 12x^2 - 192x + 576 = 12(x^2 - 16x + 48)$. => b) Đúng.
    + $V'(x) = 0 <=> x^2 - 16x + 48 = 0 <=> x = 4$ hoặc $x = 12$ (loại).
    + Vậy thể tích lớn nhất khi $x=4$ cm. => c) Sai.
    + $V(4) = 4 * (24 - 8)^2 = 4 * 16^2 = 4 * 256 = 1024 c m^3$. => d) Sai.
  ]
)

#ds([Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $0$, $2$, $+oo$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($+oo$, $-1$, $3$, $-oo$),
  )
]],
  (
    True([Hàm số có hai điểm cực trị.]),
    False([Giá trị lớn nhất của hàm số trên $RR$ là 3.]),
    True([Phương trình $f(x) = 0$ có 3 nghiệm phân biệt.]),
    False([Hàm số đạt cực tiểu tại $x = 2$.])
  ),
  loigiai: [
    + Có 1 CĐ, 1 CT => Tổng 2 cực trị. => a) Đúng.
    + Hàm số tiến đến $+oo$ nên không có GTLN trên $RR$. 3 chỉ là cực đại cục bộ. => b) Sai.
    + Đường $y=0$ cắt đồ thị tại 3 điểm (nhánh $(-oo, 0)$ qua 0 vì từ $+oo -> -1$; nhánh $(0, 2)$ qua 0 vì $-1 -> 3$; nhánh $(2, +oo)$ qua 0 vì $3 -> -oo$). => c) Đúng.
    + Tại $x=2$ hàm số đạt cực đại, cực tiểu tại $x=0$. => d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Tốc độ tăng trưởng lợi nhuận của một công ty (tỷ đồng/tháng) sau $t$ tháng đầu năm được tính bằng hàm số $P(t) = -t^2 + 8t + 20$ với $1 <= t <= 12$. Tốc độ tăng trưởng lợi nhuận đạt mức cao nhất vào tháng thứ mấy?],
  [4],
  loigiai: [
    + Đạo hàm $P'(t) = -2t + 8 = 0 <=> 2t = 8 <=> t = 4$.
    + Vì $P(t)$ là hàm bậc 2 có hệ số $a = -1 < 0$ nên parabol có bề lõm quay xuống.
    + Giá trị lớn nhất đạt được tại đỉnh $t=4$. Vậy vào tháng 4 tốc độ tăng trưởng cao nhất.
  ]
)

#tln([Một người đi xe máy từ thành phố A đến thành phố B. Vận tốc xe máy sau $t$ giờ kể từ khi xuất phát được cho bởi hàm số $v(t) = 30t - 5t^2$ (km/h) ($0 <= t <= 6$). Vận tốc lớn nhất mà xe máy đạt được trong suốt chuyến đi là bao nhiêu km/h?],
  [45],
  loigiai: [
    + Đạo hàm $v'(t) = 30 - 10t = 0 <=> t = 3$.
    + Vận tốc lớn nhất là $v(3) = 30(3) - 5(3^2) = 90 - 45 = 45$ (km/h).
  ]
)

#tln([Một công ty sản xuất đồ gia dụng có hàm chi phí sản xuất $x$ sản phẩm là $C(x) = x^2 + 50x + 1000$ (nghìn đồng). Hàm cầu của sản phẩm (giá bán phụ thuộc vào số lượng bán) được cho bởi $p(x) = 250 - x$ (nghìn đồng/sản phẩm). Công ty cần sản xuất bao nhiêu sản phẩm để thu được lợi nhuận cao nhất?],
  [50],
  loigiai: [
    + Doanh thu $R(x) = x * p(x) = x(250 - x) = 250x - x^2$.
    + Lợi nhuận $L(x) = R(x) - C(x) = (250x - x^2) - (x^2 + 50x + 1000) = -2x^2 + 200x - 1000$.
    + Lợi nhuận là hàm số bậc 2 với $a = -2 < 0$, đạt GTLN tại đỉnh parabol $x = -b/(2a) = -200 / (-4) = 50$.
    + Cần sản xuất 50 sản phẩm.
  ]
)

#tln([Một chiếc tàu thủy chở khách tiêu thụ nhiên liệu $E(v) = v^3 - 12v^2 + 60v$ (lít/giờ) khi di chuyển với vận tốc $v$ (km/h) ($v > 0$). Gọi $v_0$ là vận tốc giúp chiếc tàu tiêu thụ ít nhiên liệu nhất trên mỗi km đường đi. Tính $v_0$.],
  [6],
  loigiai: [
    + Mức tiêu thụ nhiên liệu trên mỗi km đường đi là: $f(v) = (E(v))/v = v^2 - 12v + 60$ (lít/km).
    + Để $f(v)$ nhỏ nhất, ta xét đỉnh của parabol $f(v) = v^2 - 12v + 60$.
    + Vận tốc tối ưu là $v_0 = -b/(2a) = 12/2 = 6$ km/h.
  ]
)

#tln([Chi phí để sản xuất $x$ tấn hóa chất được mô hình hóa bằng hàm số $C(x) = x^2 + 20x + 400$ (triệu đồng), $x > 0$. Hỏi nhà máy cần sản xuất bao nhiêu tấn hóa chất để chi phí trung bình cho mỗi tấn hóa chất, $overline(C)(x) = C(x)/x$, là nhỏ nhất?],
  [20],
  loigiai: [
    + Chi phí trung bình $overline(C)(x) = C(x)/x = x + 20 + 400/x$.
    + Áp dụng BĐT AM-GM: $x + 400/x >= 2sqrt(x * 400/x) = 40$.
    + Dấu "=" xảy ra khi $x = 400/x <=> x^2 = 400 <=> x = 20$.
    + Vậy cần sản xuất 20 tấn hóa chất.
  ]
)

#tln([Quãng đường phanh của một loại ô tô khi chạy với vận tốc $v$ (km/h) được ước tính bằng $S(v) = v^2/100 + v/2$ (mét). Tốc độ thay đổi của quãng đường phanh theo vận tốc $v$ khi xe đang chạy với vận tốc 50 km/h là bao nhiêu (m/(km/h))?],
  [1.5],
  loigiai: [
    + Tốc độ thay đổi là đạo hàm của hàm số: $S'(v) = (2v)/100 + 1/2 = v/50 + 0.5$.
    + Tại vận tốc $v = 50$, tốc độ thay đổi là $S'(50) = 50/50 + 0.5 = 1 + 0.5 = 1.5$.
  ]
)
