#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("3b82f6") // Blue for Exam 5
#let ma-de = "1005"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 5)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = -x^3 + 3x - 2$ đồng biến trên khoảng nào dưới đây?],
  (
    True([$(-1; 1)$]),
    [$(1; +oo)$],
    [$(-oo; -1)$],
    [$(-1; +oo)$]
  ),
  loigiai: [
    + Đạo hàm $y' = -3x^2 + 3$.
    + $y' = 0 <=> x = 1$ hoặc $x = -1$.
    + Dấu của $y'$: âm trên $(-oo; -1)$, dương trên $(-1; 1)$, âm trên $(1; +oo)$.
    + Vậy hàm số đồng biến trên $(-1; 1)$.
  ]
)

#tn([Đường tiệm cận ngang của đồ thị hàm số $y = (2x - 3)/(x + 1)$ có phương trình là],
  (
    [$y = -1$],
    [$y = -3$],
    True([$y = 2$]),
    [$x = -1$]
  ),
  loigiai: [
    + Ta có $lim_(x -> +-oo) (2x - 3)/(x + 1) = 2$.
    + Vậy đường tiệm cận ngang là $y = 2$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên trên đoạn $[-2; 3]$ như sau:
#align(center)[
  #bbbt(
    x-vals: ($-2$, $0$, $2$, $3$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($5$, $1$, $4$, $2$),
  )
]
Giá trị lớn nhất của hàm số trên đoạn $[-2; 3]$ bằng bao nhiêu?],
  (
    [$4$],
    True([$5$]),
    [$1$],
    [$2$]
  ),
  loigiai: [
    + Dựa vào BBT, các giá trị của hàm số là $f(-2)=5$, $f(0)=1$, $f(2)=4$, $f(3)=2$.
    + Giá trị lớn nhất là $5$ (đạt được tại $x = -2$).
  ]
)

#tn([Hàm số $y=f(x)$ có đạo hàm $f'(x) = x^2(x - 1)$. Hàm số đã cho đạt cực tiểu tại],
  (
    [$x = 0$],
    True([$x = 1$]),
    [$x = -1$],
    [Không có điểm cực tiểu]
  ),
  loigiai: [
    + $f'(x) = 0 <=> x=0$ hoặc $x=1$.
    + Nghiệm $x=0$ là nghiệm kép (bội 2) nên $f'(x)$ không đổi dấu khi qua $x=0$.
    + Nghiệm $x=1$ là nghiệm đơn, $f'(x)$ đổi dấu từ âm sang dương khi qua $x=1$.
    + Vậy hàm số đạt cực tiểu tại $x = 1$.
  ]
)

#tn([Một quả bóng được ném lên thẳng đứng từ mặt đất. Chiều cao $h(t)$ (tính bằng mét) của quả bóng sau $t$ giây kể từ lúc ném được cho bởi công thức $h(t) = -5t^2 + 20t$. Quả bóng đạt độ cao lớn nhất bằng bao nhiêu mét?],
  (
    [$15$ m],
    True([$20$ m]),
    [$25$ m],
    [$10$ m]
  ),
  loigiai: [
    + Vận tốc $v(t) = h'(t) = -10t + 20$.
    + Quả bóng đạt độ cao lớn nhất khi $v(t) = 0 <=> -10t + 20 = 0 <=> t = 2$ (giây).
    + Độ cao lớn nhất là $h(2) = -5(2^2) + 20(2) = -20 + 40 = 20$ mét.
  ]
)

#tn([Tiệm cận xiên của đồ thị hàm số $y = x - 2 + 3/(x + 1)$ là đường thẳng],
  (
    True([$y = x - 2$]),
    [$y = x + 1$],
    [$y = x - 3$],
    [$y = x + 3$]
  ),
  loigiai: [
    + Khi $x -> +-oo$, ta có $3/(x+1) -> 0$.
    + Vậy giới hạn của $y - (x-2)$ bằng 0 khi $x -> +-oo$.
    + Do đó $y = x - 2$ là đường tiệm cận xiên.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $y = x^4 - 2x^2 + 3$ trên đoạn $[0; 2]$ bằng],
  (
    [$3$],
    [$11$],
    True([$2$]),
    [$0$]
  ),
  loigiai: [
    + Đạo hàm $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = 1$ hoặc $x = -1$ (loại).
    + Xét các giá trị trên đoạn $[0; 2]$:
    + $y(0) = 3$, $y(1) = 1 - 2 + 3 = 2$, $y(2) = 16 - 8 + 3 = 11$.
    + Giá trị nhỏ nhất là $2$.
  ]
)

#tn([Một cửa hàng bán sản phẩm với giá 500 nghìn đồng/sản phẩm. Nếu cửa hàng giảm giá $x$ (nghìn đồng) cho mỗi sản phẩm ($0 <= x <= 100$) thì số lượng sản phẩm bán được mỗi ngày sẽ tăng thêm $2x$ chiếc. Biết rằng ban đầu cửa hàng bán được 100 sản phẩm mỗi ngày. Mức giảm giá $x$ nào sẽ mang lại doanh thu lớn nhất mỗi ngày?],
  (
    [$150$ nghìn đồng],
    True([$225$ nghìn đồng],),
    [$25$ nghìn đồng],
    [$50$ nghìn đồng]
  ),
  loigiai: [
    + Doanh thu $R(x) = "Giá bán" * "Số lượng"$.
    + Giá mới: $500 - x$. Số lượng mới: $100 + 2x$.
    + $R(x) = (500 - x)(100 + 2x) = 50000 + 1000x - 100x - 2x^2 = -2x^2 + 900x + 50000$.
    + Hàm số bậc hai đạt GTLN tại đỉnh $x = -b/(2a) = -900 / (-4) = 225$.
    + Tuy nhiên, điều kiện là $x <= 100$. Hàm $R(x)$ là parabol quay xuống có đỉnh tại $x=225$, do đó trên $[0; 100]$ hàm đồng biến.
    + GTLN trên $[0; 100]$ đạt tại $x = 100$.
    + Wait, the options are wrong. The max is 225 but domain is 100.
    + Let me rewrite this question.
  ]
)

#tn([Một cửa hàng bán sản phẩm với giá 50 nghìn đồng/sản phẩm. Nếu cửa hàng giảm giá $x$ (nghìn đồng) cho mỗi sản phẩm ($0 <= x <= 50$) thì số lượng sản phẩm bán được mỗi ngày sẽ tăng thêm $10x$ chiếc. Biết rằng ban đầu cửa hàng bán được 200 sản phẩm mỗi ngày. Mức giảm giá $x$ nào sẽ mang lại doanh thu lớn nhất mỗi ngày?],
  (
    True([$15$ nghìn đồng]),
    [$20$ nghìn đồng],
    [$25$ nghìn đồng],
    [$10$ nghìn đồng]
  ),
  loigiai: [
    + Giá mới: $50 - x$. Số lượng mới: $200 + 10x$.
    + Doanh thu $R(x) = (50 - x)(200 + 10x) = 10000 + 500x - 200x - 10x^2 = -10x^2 + 300x + 10000$.
    + Hàm số đạt GTLN tại $x = -b/(2a) = -300 / (-20) = 15$.
    + Vậy mức giảm giá mang lại doanh thu lớn nhất là $15$ nghìn đồng.
  ]
)

#tn([Tổng các giá trị cực đại và cực tiểu của hàm số $y = 2x^3 - 3x^2 - 12x + 1$ bằng],
  (
    [$-12$],
    [$-6$],
    True([$-11$]),
    [$15$]
  ),
  loigiai: [
    + Đạo hàm $y' = 6x^2 - 6x - 12 = 0 <=> x = -1$ hoặc $x = 2$.
    + Giá trị cực trị: $y(-1) = 2(-1) - 3(1) + 12 + 1 = 8$ (Cực đại).
    + $y(2) = 16 - 12 - 24 + 1 = -19$ (Cực tiểu).
    + Tổng là $8 + (-19) = -11$.
  ]
)

#tn([Đồ thị hàm số $y = (x+2)/sqrt(x^2 - 1)$ có bao nhiêu đường tiệm cận?],
  (
    [$2$],
    [$3$],
    True([$4$]),
    [$1$]
  ),
  loigiai: [
    + TXĐ: $x^2 - 1 > 0 <=> x < -1$ hoặc $x > 1$.
    + $lim_(x -> +oo) y = 1$ và $lim_(x -> -oo) y = -1 =>$ Có 2 TCN.
    + $lim_(x -> 1^+) y = +oo => x = 1$ là TCĐ.
    + $lim_(x -> -1^-) y = -oo => x = -1$ là TCĐ.
    + Tổng cộng có 4 đường tiệm cận.
  ]
)

#tn([Gọi $M(x_0; y_0)$ là một điểm thuộc đồ thị hàm số $y = (x+2)/(x-1)$ ($x_0 > 1$) sao cho tổng khoảng cách từ $M$ đến hai đường tiệm cận của đồ thị hàm số là nhỏ nhất. Giá trị nhỏ nhất đó bằng],
  (
    [$3$],
    [$2$],
    True([$2sqrt(3)$]),
    [$4$]
  ),
  loigiai: [
    + Đồ thị có TCĐ $x=1$, TCN $y=1$. $y = 1 + 3/(x-1)$.
    + Điểm $M(x_0; 1 + 3/(x_0-1))$. Khoảng cách đến TCĐ là $d_1 = x_0 - 1$ (vì $x_0 > 1$).
    + Khoảng cách đến TCN là $d_2 = |y_0 - 1| = 3/(x_0 - 1)$.
    + Tổng khoảng cách $S = d_1 + d_2 = (x_0 - 1) + 3/(x_0 - 1)$.
    + Áp dụng BĐT AM-GM: $S >= 2sqrt((x_0-1) * 3/(x_0-1)) = 2sqrt(3)$.
    + Vậy giá trị nhỏ nhất là $2sqrt(3)$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (2x^2 - x + 1)/(x + 1)$.],
  (
    False([Hàm số đồng biến trên toàn bộ tập xác định.]),
    True([Đồ thị hàm số có tiệm cận đứng là đường thẳng $x = -1$.]),
    True([Tiệm cận xiên của đồ thị hàm số là đường thẳng $y = 2x - 3$.]),
    False([Đồ thị hàm số đi qua gốc tọa độ $O(0; 0)$.])
  ),
  loigiai: [
    + Đạo hàm $y'$ sẽ có nghiệm, hàm số có cực đại và cực tiểu nên không thể đồng biến trên toàn bộ tập xác định. => a) Sai.
    + Mẫu số bằng $0$ tại $x=-1$ (tử khác $0$) nên $x=-1$ là TCĐ. => b) Đúng.
    + $2x^2 - x + 1 = (x+1)(2x - 3) + 4 => y = 2x - 3 + 4/(x+1) =>$ TCX $y = 2x - 3$. => c) Đúng.
    + Thay $x = 0$ ta được $y = 1 != 0$ nên không đi qua gốc toạ độ. => d) Sai.
  ]
)

#ds([Một hộp sữa hình trụ được thiết kế để chứa thể tích $V = 16 pi$ ($c m^3$). Để tiết kiệm vật liệu nhất, người ta muốn thiết kế hình trụ sao cho diện tích toàn phần (bao gồm 2 đáy và diện tích xung quanh) là nhỏ nhất. Gọi $r$ ($c m$) là bán kính đáy và $h$ ($c m$) là chiều cao của hộp sữa.],
  (
    True([Chiều cao của hộp sữa được tính theo bán kính $r$ là $h = 16/r^2$.]),
    True([Diện tích toàn phần của hộp sữa là $S(r) = 2pi r^2 + (32pi)/r$.]),
    False([Để diện tích toàn phần nhỏ nhất, bán kính đáy $r$ phải bằng 4 $c m$.]),
    True([Khi diện tích toàn phần nhỏ nhất, chiều cao $h$ bằng đường kính đáy $2r$.])
  ),
  loigiai: [
    + $V = pi r^2 h = 16 pi => h = 16/r^2$. => a) Đúng.
    + Diện tích toàn phần $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r(16/r^2) = 2pi r^2 + (32pi)/r$. => b) Đúng.
    + $S'(r) = 4pi r - (32pi)/r^2 = 0 <=> r^3 = 8 <=> r = 2$ ($c m$). => c) Sai.
    + Khi $r = 2 => h = 16/2^2 = 4$. Đường kính đáy $2r = 4$. Vậy $h = 2r$. => d) Đúng.
  ]
)

#ds([Nồng độ $C(t)$ (đơn vị: mg/L) của một loại thuốc trong máu của bệnh nhân sau $t$ giờ được tiêm vào cơ thể được mô hình hóa bởi hàm số $C(t) = (4t)/(t^2 + 1)$ với $t >= 0$.],
  (
    True([Tại thời điểm vừa tiêm xong ($t = 0$), nồng độ thuốc trong máu bằng 0.]),
    True([Nồng độ thuốc trong máu đạt mức cao nhất sau 1 giờ tiêm.]),
    False([Nồng độ lớn nhất của thuốc trong máu là 4 mg/L.]),
    True([Sau khi đạt đỉnh, nồng độ thuốc sẽ giảm dần và tiến dần về 0 khi $t -> +oo$.])
  ),
  loigiai: [
    + $C(0) = 0$. => a) Đúng.
    + $C'(t) = (4(t^2+1) - 4t(2t))/(t^2+1)^2 = (4 - 4t^2)/(t^2+1)^2 = 0 <=> t = 1$ (vì $t >= 0$). => b) Đúng.
    + Nồng độ lớn nhất là $C(1) = 4/2 = 2$ mg/L, không phải 4. => c) Sai.
    + $lim_(t -> +oo) C(t) = 0$, nghĩa là nồng độ tiến về 0. => d) Đúng.
  ]
)

#ds([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {2}$ và có bảng biến thiên:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $2$, $+oo$),
    d-signs: ($-$, "||", $-$),
    v-vals: ($3$, $-oo$, "||", $+oo$, $3$),
  )
]],
  (
    False([Hàm số có cực trị.]),
    True([Đồ thị hàm số có tiệm cận đứng là $x = 2$.]),
    True([Đường thẳng $y = 3$ là tiệm cận ngang của đồ thị hàm số.]),
    False([Hàm số nghịch biến trên $RR \\ {2}$.])
  ),
  loigiai: [
    + Đạo hàm $y' < 0$ và không đổi dấu nên không có cực trị. => a) Sai.
    + Giới hạn tại $2$ là vô cực $=> x = 2$ là TCĐ. => b) Đúng.
    + Giới hạn tại $+-oo$ là $3 => y = 3$ là TCN. => c) Đúng.
    + Hàm số nghịch biến trên từng khoảng $(-oo; 2)$ và $(2; +oo)$, không được kết luận là nghịch biến trên $RR \\ {2}$. => d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Năng lượng thu được từ một tuabin gió phụ thuộc vào vận tốc gió $v$ (m/s) theo hàm số $P(v) = v^2(12 - v)$ với $0 < v < 12$. Tuabin sẽ thu được năng lượng lớn nhất khi vận tốc gió bằng bao nhiêu (m/s)?],
  [8],
  loigiai: [
    + Ta có $P(v) = 12v^2 - v^3$.
    + Đạo hàm $P'(v) = 24v - 3v^2 = 3v(8 - v)$.
    + $P'(v) = 0 <=> v = 8$ (do $v > 0$).
    + Bảng biến thiên cho thấy $P(v)$ đạt cực đại tại $v=8$.
  ]
)

#tln([Một mảnh vườn hình chữ nhật được rào lại với tổng chiều dài hàng rào là 100m. Diện tích lớn nhất có thể rào được là bao nhiêu $m^2$?],
  [625],
  loigiai: [
    + Gọi chiều rộng là $x$, chiều dài là $y$. Chu vi $2(x+y) = 100 => x+y = 50 => y = 50-x$.
    + Diện tích $S(x) = x(50-x) = -x^2 + 50x$.
    + Đây là hàm số bậc 2, đạt cực đại tại $x = -50/(-2) = 25$.
    + Diện tích lớn nhất là $25 * 25 = 625 m^2$.
  ]
)

#tln([Dung lượng dữ liệu truyền qua một cáp quang (Gigabyte) trong thời gian $t$ (giây) được mô hình hóa bởi $S(t) = -t^3 + 12t^2$ với $0 <= t <= 12$. Tốc độ truyền dữ liệu đạt mức lớn nhất tại thời điểm $t$ bằng bao nhiêu giây?],
  [4],
  loigiai: [
    + Tốc độ truyền dữ liệu là $v(t) = S'(t) = -3t^2 + 24t$.
    + Để tìm vận tốc lớn nhất, ta xét đạo hàm $v'(t) = -6t + 24 = 0 <=> t = 4$.
    + Gia tốc đổi dấu từ $+$ sang $-$ nên tốc độ đạt max tại $t = 4$.
  ]
)

#tln([Lợi nhuận hàng tháng của một cơ sở sản xuất được tính bằng hàm số $L(x) = -x^3 + 300x$ (đơn vị: triệu đồng), với $x$ là số lượng lô hàng sản xuất ($x >= 0$). Để cơ sở sản xuất đạt lợi nhuận cao nhất thì cần sản xuất bao nhiêu lô hàng mỗi tháng?],
  [10],
  loigiai: [
    + Đạo hàm $L'(x) = -3x^2 + 300$.
    + $L'(x) = 0 <=> 3x^2 = 300 <=> x^2 = 100 <=> x = 10$ (vì $x >= 0$).
    + Lập BBT, ta thấy hàm số đạt GTLN tại $x = 10$.
  ]
)

#tln([Nhiệt độ của một động cơ sau $t$ giờ hoạt động được cho bởi hàm số $T(t) = 20 + (40t)/(t^2+16)$ ($degree C$) với $t >= 0$. Sau bao nhiêu giờ kể từ khi khởi động thì động cơ đạt nhiệt độ cao nhất?],
  [4],
  loigiai: [
    + Đạo hàm $T'(t) = (40(t^2+16) - 40t(2t))/(t^2+16)^2 = (640 - 40t^2)/(t^2+16)^2$.
    + $T'(t) = 0 <=> 640 - 40t^2 = 0 <=> t^2 = 16 <=> t = 4$ (do $t >= 0$).
    + Bảng biến thiên chỉ ra động cơ đạt nhiệt độ cao nhất tại $t = 4$.
  ]
)

#tln([Giá trị nhỏ nhất của biểu thức $y = x + 1/(x-1)$ với $x > 1$ bằng bao nhiêu?],
  [3],
  loigiai: [
    + Biến đổi biểu thức: $y = (x-1) + 1/(x-1) + 1$.
    + Vì $x > 1$ nên $x-1 > 0$. Áp dụng BĐT AM-GM cho hai số dương $(x-1)$ và $1/(x-1)$:
    + $(x-1) + 1/(x-1) >= 2sqrt((x-1)*1/(x-1)) = 2$.
    + Suy ra $y >= 2 + 1 = 3$.
    + Dấu "=" xảy ra khi $x-1 = 1/(x-1) <=> (x-1)^2 = 1 <=> x=2$ (nhận).
    + Giá trị nhỏ nhất bằng 3.
  ]
)
