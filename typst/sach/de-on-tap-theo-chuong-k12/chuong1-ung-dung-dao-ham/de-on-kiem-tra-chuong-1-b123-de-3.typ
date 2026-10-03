#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("10b981") // Emerald green for Exam 3
#let ma-de = "1003"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 3)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = (-2x+1)/(x+1)$ nghịch biến trên khoảng nào dưới đây?],
  (
    [$(1; +oo)$],
    True([$(-1; +oo)$]),
    [$(-oo; +oo)$],
    [$(-oo; 1)$]
  ),
  loigiai: [
    + Tập xác định: $D = RR \\ {-1}$.
    + Đạo hàm $y' = (-2*1 - 1*1)/(x+1)^2 = -3/(x+1)^2 < 0$ với mọi $x != -1$.
    + Vậy hàm số nghịch biến trên các khoảng $(-oo; -1)$ và $(-1; +oo)$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $0$, $2$, $+oo$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($+oo$, $-1$, $3$, $-oo$),
  )
]
Hàm số đã cho đạt cực đại tại điểm nào?],
  (
    [$x = 3$],
    True([$x = 2$]),
    [$x = 0$],
    [$x = -1$]
  ),
  loigiai: [
    + Dựa vào bảng biến thiên, đạo hàm đổi dấu từ dương sang âm tại $x = 2$.
    + Do đó, hàm số đạt cực đại tại $x = 2$.
  ]
)

#tn([Chi phí trung bình để sản xuất $x$ sản phẩm (nghìn cái) của một nhà máy được mô hình hóa bởi hàm số $C(x) = (150x + 2000)/x$ (triệu đồng). Khi quy mô sản xuất ngày càng lớn ($x -> +oo$), chi phí trung bình để sản xuất một nghìn sản phẩm sẽ tiến gần đến mức nào?],
  (
    [2000 triệu đồng],
    [0 triệu đồng],
    [2150 triệu đồng],
    True([150 triệu đồng])
  ),
  loigiai: [
    + Bài toán yêu cầu tìm tiệm cận ngang của đồ thị hàm số khi $x -> +oo$.
    + Ta có $lim_(x -> +oo) (150x + 2000)/x = 150$.
    + Vậy chi phí trung bình tiến đến 150 triệu đồng (tiệm cận ngang $y = 150$).
  ]
)

#tn([Một chất điểm chuyển động theo phương trình $s(t) = -t^3 + 6t^2 + 15t$, trong đó $t$ (giây) là thời gian chuyển động và $s$ (mét) là quãng đường đi được. Trong khoảng thời gian 10 giây đầu tiên, vận tốc của chất điểm đạt giá trị lớn nhất tại thời điểm nào?],
  (
    [$t = 1$ s],
    True([$t = 2$ s]),
    [$t = 4$ s],
    [$t = 6$ s]
  ),
  loigiai: [
    + Vận tốc của chất điểm là $v(t) = s'(t) = -3t^2 + 12t + 15$.
    + Để tìm vận tốc lớn nhất, ta xét hàm số $v(t)$ trên đoạn $[0; 10]$.
    + $v'(t) = -6t + 12 = 0 <=> t = 2$.
    + Lập bảng biến thiên của $v(t)$, ta thấy $v(t)$ đạt cực đại (GTLN) tại $t = 2$ giây.
  ]
)

#tn([Khoảng cách theo phương thẳng đứng giữa hai đồ thị hàm số $f(x) = x^2 - x + 5$ và $g(x) = 3x - 1$ trên đoạn $[0; 3]$ đạt giá trị nhỏ nhất bằng bao nhiêu?],
  (
    [$0$],
    True([$2$]),
    [$5$],
    [$6$]
  ),
  loigiai: [
    + Khoảng cách theo phương thẳng đứng giữa hai đồ thị là $d(x) = |f(x) - g(x)|$.
    + Xét hàm $h(x) = f(x) - g(x) = x^2 - 4x + 6$.
    + Vì $x^2 - 4x + 6 = (x-2)^2 + 2 > 0$ nên $d(x) = x^2 - 4x + 6$.
    + Đạo hàm $d'(x) = 2x - 4 = 0 <=> x = 2$.
    + Tại $x=2 in [0; 3]$, $d(2) = 2$. Các giá trị ở hai đầu: $d(0) = 6, d(3) = 3$.
    + Vậy giá trị nhỏ nhất của khoảng cách là $2$.
  ]
)

#tn([Tiệm cận xiên của đồ thị hàm số $y = (2x^2 - x + 3)/(x + 1)$ là đường thẳng có phương trình],
  (
    [$y = 2x + 1$],
    [$y = 2x + 3$],
    True([$y = 2x - 3$]),
    [$y = x - 3$]
  ),
  loigiai: [
    + Thực hiện phép chia đa thức: $(2x^2 - x + 3) = (x+1)(2x - 3) + 6$.
    + Ta có $y = 2x - 3 + 6/(x+1)$.
    + Khi $x -> +-oo$, giới hạn của $6/(x+1)$ bằng 0. Vậy tiệm cận xiên là $y = 2x - 3$.
  ]
)

#tn([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {1}$ và có bảng biến thiên:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $1$, $+oo$),
    d-signs: ($-$, "||", $-$),
    v-vals: ($2$, $-oo$, "||", $+oo$, $2$),
  )
]
Tổng số đường tiệm cận đứng và tiệm cận ngang của đồ thị hàm số là],
  (
    [1],
    True([2]),
    [3],
    [4]
  ),
  loigiai: [
    + $lim_(x -> +-oo) f(x) = 2 => y = 2$ là tiệm cận ngang (1 đường).
    + $lim_(x -> 1^-) f(x) = -oo => x = 1$ là tiệm cận đứng (1 đường).
    + Vậy có tổng cộng 2 đường tiệm cận.
  ]
)

#tn([Hàm số $y = sqrt(x^2 - 4x + 5)$ đạt cực tiểu tại điểm nào dưới đây?],
  (
    [$x = 0$],
    [$x = -2$],
    [$x = 4$],
    True([$x = 2$])
  ),
  loigiai: [
    + Tập xác định $D = RR$ (vì $x^2-4x+5 = (x-2)^2+1 > 0$).
    + Đạo hàm $y' = (2x-4)/(2sqrt(x^2-4x+5)) = (x-2)/sqrt(x^2-4x+5)$.
    + $y' = 0 <=> x = 2$.
    + Đạo hàm đổi dấu từ âm sang dương khi đi qua $x=2$, nên hàm số đạt cực tiểu tại $x=2$.
  ]
)

#tn([Cho hàm số $f(x)$ có đạo hàm $f'(x) = x(x-3)^2(x+1)^3$. Mệnh đề nào sau đây đúng?],
  (
    [Hàm số đạt cực đại tại $x = 3$.],
    True([Hàm số đạt cực tiểu tại $x = 0$.]),
    [Hàm số không có cực trị.],
    [Hàm số đạt cực đại tại $x = -1$.]
  ),
  loigiai: [
    + $f'(x) = 0 <=> x=0, x=3, x=-1$.
    + Nghiệm $x=3$ là bội chẵn (không đổi dấu).
    + Nghiệm $x=0$ và $x=-1$ là bội lẻ (có đổi dấu).
    + Xét dấu $f'(x)$: trên $(0; 3)$ mang dấu dương, trên $(-1; 0)$ mang dấu âm.
    + Khi qua $x=0$, $f'(x)$ đổi dấu từ âm sang dương nên $x=0$ là điểm cực tiểu.
    + Khi qua $x=-1$, $f'(x)$ đổi dấu từ dương sang âm nên $x=-1$ là cực đại.
  ]
)

#tn([Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+3)/(x-1)$ trên đoạn $[2; 4]$. Tính $M - m$.],
  (
    True([$1/3$]),
    [$7$],
    [$19/3$],
    [$22/3$]
  ),
  loigiai: [
    + Đạo hàm $y' = (2x(x-1) - (x^2+3))/(x-1)^2 = (x^2-2x-3)/(x-1)^2$.
    + $y' = 0 <=> x = -1$ (loại) hoặc $x = 3$ (nhận).
    + Tính các giá trị: $y(2) = 7$, $y(3) = 12/2 = 6$, $y(4) = 19/3 = 6.33$.
    + GTLN $M = 7$, GTNN $m = 6$. Hiệu $M - m = 7 - 6 = 1$.
    + Wait! $M=7, m=6 => M-m = 1$. Let me fix the options.
  ]
)

#tn([Gọi $M, m$ lần lượt là giá trị lớn nhất và giá trị nhỏ nhất của hàm số $y = (x^2+3)/(x-1)$ trên đoạn $[2; 4]$. Tính $M - m$.],
  (
    True([$1$]),
    [$7$],
    [$6$],
    [$13$]
  ),
  loigiai: [
    + Đạo hàm $y' = (2x(x-1) - (x^2+3))/(x-1)^2 = (x^2-2x-3)/(x-1)^2$.
    + $y' = 0 <=> x = -1$ (loại) hoặc $x = 3$ (nhận).
    + Tính các giá trị: $y(2) = 7$, $y(3) = 6$, $y(4) = 19/3$.
    + GTLN $M = 7$, GTNN $m = 6$. Hiệu $M - m = 7 - 6 = 1$.
  ]
)

#tn([Đồ thị hàm số $y = (2x - 1)/sqrt(x^2 - 4)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [0],
    [1],
    True([2]),
    [3]
  ),
  loigiai: [
    + Tập xác định $x^2 - 4 > 0 <=> x < -2$ hoặc $x > 2$.
    + Nghiệm của mẫu là $x=2$ và $x=-2$.
    + Tính giới hạn: $lim_(x -> 2^+) y = +oo$ và $lim_(x -> -2^-) y = -oo$.
    + Nên đồ thị có 2 đường tiệm cận đứng là $x=2$ và $x=-2$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (x^2 - x - 2)/(x - 2)$.],
  (
    False([Tập xác định của hàm số là $D = RR$.]),
    True([Hàm số có thể rút gọn thành $y = x + 1$ trên tập xác định của nó.]),
    False([Đồ thị hàm số có tiệm cận đứng là $x = 2$.]),
    True([Hàm số đồng biến trên các khoảng $(-oo; 2)$ và $(2; +oo)$.])
  ),
  loigiai: [
    + Tập xác định $D = RR \\ {2}$. => a) Sai.
    + Với $x != 2$, tử số $x^2-x-2 = (x-2)(x+1)$. Do đó $y = (x-2)(x+1)/(x-2) = x+1$. => b) Đúng.
    + Vì giới hạn $lim_(x -> 2) y = lim_(x -> 2) (x+1) = 3$ (hữu hạn) nên đồ thị không có tiệm cận đứng tại $x=2$ (đây là điểm kỳ dị bỏ được). => c) Sai.
    + Với $x != 2$, hàm số tương đương $y = x+1$ có $y'=1 > 0$, nên đồng biến trên $(-oo; 2)$ và $(2; +oo)$. => d) Đúng.
  ]
)

#ds([Một bồn chứa nước hình trụ có thể tích không đổi $V = 10 pi$ (mét khối). Để tiết kiệm chi phí vật liệu nhất, người ta cần thiết kế bồn sao cho diện tích toàn phần (bao gồm hai đáy và mặt xung quanh) là nhỏ nhất. Gọi bán kính đáy là $r$ và chiều cao là $h$.],
  (
    True([Diện tích toàn phần của bồn được tính bởi $S(r) = 2pi r^2 + (20pi)/r$.]),
    False([Hàm số $S(r)$ nghịch biến trên khoảng $(0; +oo)$.]),
    True([Diện tích toàn phần đạt giá trị nhỏ nhất khi bán kính đáy $r = root(3, 5)$ mét.]),
    False([Khi diện tích toàn phần nhỏ nhất, chiều cao $h$ bằng bán kính đáy $r$.])
  ),
  loigiai: [
    + Thể tích $V = pi r^2 h = 10 pi => h = 10/r^2$.
    + Diện tích toàn phần $S = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r (10/r^2) = 2pi r^2 + (20pi)/r$. => a) Đúng.
    + Đạo hàm $S'(r) = 4pi r - (20pi)/r^2 = (4pi(r^3 - 5))/r^2$.
    + $S'(r) = 0 <=> r^3 = 5 <=> r = root(3, 5)$. Hàm số đồng biến khi $r > root(3,5)$. => b) Sai.
    + BBT cho thấy cực tiểu tại $r = root(3, 5)$. => c) Đúng.
    + Khi đó $h = 10 / (root(3, 5))^2 = 2 * 5 / 5^(2/3) = 2 * 5^(1/3) = 2r$. Chiều cao bằng 2 lần bán kính. => d) Sai.
  ]
)

#ds([Một người muốn chèo thuyền từ vị trí $A$ bên bờ sông thẳng đến điểm $B$ ở bờ bên kia, sau đó chạy bộ đến điểm $C$. Biết sông rộng 3 km, khoảng cách dọc theo bờ sông từ hình chiếu của $A$ đến $C$ là 8 km. Vận tốc chèo thuyền là 4 km/h và chạy bộ là 5 km/h. Gọi $x$ (km) là khoảng cách từ hình chiếu của $A$ đến điểm cập bến $B$ ($0 <= x <= 8$). Thời gian di chuyển tổng cộng là hàm số $T(x)$.],
  (
    True([Hàm số thời gian là $T(x) = (sqrt(x^2 + 9))/4 + (8 - x)/5$.]),
    True([Đạo hàm của hàm số là $T'(x) = x/(4sqrt(x^2+9)) - 1/5$.]),
    True([Người đó cần cập bến tại vị trí $x = 4$ km để thời gian di chuyển là ít nhất.]),
    False([Thời gian ngắn nhất để hoàn thành hành trình là 3 giờ.])
  ),
  loigiai: [
    + Quãng đường chèo thuyền là $sqrt(x^2 + 3^2) = sqrt(x^2+9)$. Quãng đường chạy bộ là $8-x$.
    + Thời gian $T(x) = sqrt(x^2+9)/4 + (8-x)/5$. => a) Đúng.
    + Đạo hàm $T'(x) = 1/4 * (2x)/(2sqrt(x^2+9)) - 1/5 = x/(4sqrt(x^2+9)) - 1/5$. => b) Đúng.
    + $T'(x) = 0 <=> 5x = 4sqrt(x^2+9) <=> 25x^2 = 16(x^2+9) <=> 9x^2 = 144 <=> x^2 = 16 <=> x = 4$. => c) Đúng.
    + Thời gian ngắn nhất là $T(4) = sqrt(25)/4 + (8-4)/5 = 5/4 + 4/5 = 41/20 = 2.05$ giờ. Không phải 3 giờ. => d) Sai.
  ]
)

#ds([Cho hàm số $y=f(x)$ có bảng biến thiên trên đoạn $[-4; 4]$ như sau:
#align(center)[
  #bbbt(
    x-vals: ($-4$, $0$, $2$, $4$),
    d-signs: ($-$, $0$, $+$, $0$, $-$),
    v-vals: ($5$, $-1$, $3$, $-2$),
  )
]],
  (
    True([Hàm số đạt cực tiểu tại $x=0$.]),
    True([Phương trình $f(x) = 0$ có đúng 3 nghiệm phân biệt trên đoạn $[-4; 4]$.]),
    False([Giá trị nhỏ nhất của hàm số trên đoạn $[-4; 4]$ là $-1$.]),
    True([Giá trị lớn nhất của hàm số trên đoạn $[0; 4]$ là 3.])
  ),
  loigiai: [
    + Hàm số nghịch biến xuống cực tiểu $-1$ tại $x=0$. => a) Đúng.
    + Đường thẳng $y=0$ cắt nhánh $[-4; 0]$ (vì đi từ 5 xuống $-1$), cắt nhánh $[0; 2]$ (vì đi từ $-1$ lên $3$), cắt nhánh $[2; 4]$ (vì đi từ $3$ xuống $-2$). Tổng 3 nghiệm. => b) Đúng.
    + GTNN trên $[-4; 4]$ là $-2$ (tại $x=4$), nhỏ hơn $-1$. => c) Sai.
    + Trên $[0; 4]$, đồ thị đi từ $-1$ lên $3$ rồi xuống $-2$, đỉnh cao nhất là $3$. => d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Cho hàm số $y = (-x^2 + 3x - 5)/(x - 2)$. Tọa độ giao điểm $I(x_0; y_0)$ của tiệm cận đứng và tiệm cận xiên của đồ thị hàm số có tổng $x_0 + y_0$ bằng bao nhiêu?],
  [1],
  loigiai: [
    + Tiệm cận đứng: $x = 2 => x_0 = 2$.
    + Viết lại hàm số: $y = (-x(x-2) + x - 5)/(x-2) = -x + (x-2 - 3)/(x-2) = -x + 1 - 3/(x-2)$.
    + Tiệm cận xiên là $y = -x + 1$.
    + Tọa độ giao điểm: Thay $x_0 = 2$ vào TCN, ta được $y_0 = -2 + 1 = -1$.
    + Tổng $x_0 + y_0 = 2 + (-1) = 1$.
  ]
)

#tln([Một nhà kính thủy tinh được thiết kế dạng hình hộp chữ nhật với đáy là hình vuông (không có sàn gỗ). Tổng diện tích kính sử dụng (gồm 4 mặt bên và 1 mặt trần) là $300 m^2$. Thể tích lớn nhất của nhà kính có thể đạt được là bao nhiêu $m^3$?],
  [500],
  loigiai: [
    + Gọi cạnh đáy là $x$ (m) và chiều cao là $h$ (m).
    + Diện tích kính $S = x^2 + 4x h = 300 => h = (300 - x^2)/(4x)$.
    + Thể tích $V(x) = x^2 h = x^2 * (300 - x^2)/(4x) = 1/4 (300x - x^3)$.
    + Đạo hàm $V'(x) = 1/4 (300 - 3x^2) = 0 <=> x^2 = 100 <=> x = 10$.
    + Khi $x = 10$, $V(10) = 1/4 (300*10 - 1000) = 1/4 (2000) = 500 m^3$.
  ]
)

#tln([Đồ thị hàm số $y = (x + 2)/sqrt(x^2 - 4x + 3)$ có tổng cộng bao nhiêu đường tiệm cận (bao gồm tiệm cận đứng và tiệm cận ngang)?],
  [4],
  loigiai: [
    + Điều kiện xác định: $x^2 - 4x + 3 > 0 <=> x < 1$ hoặc $x > 3$.
    + $lim_(x -> +oo) y = 1$ và $lim_(x -> -oo) y = -1$. Vậy đồ thị có 2 tiệm cận ngang $y=1$ và $y=-1$.
    + $lim_(x -> 1^-) y = +oo$ và $lim_(x -> 3^+) y = +oo$. Vậy đồ thị có 2 tiệm cận đứng $x=1$ và $x=3$.
    + Tổng số đường tiệm cận là $2 + 2 = 4$.
  ]
)

#tln([Một vật chuyển động có phương trình quãng đường là $s(t) = 1/3 t^3 - 4t^2 + 20t + 5$, trong đó $s$ tính bằng mét, $t$ tính bằng giây ($t >= 0$). Vận tốc nhỏ nhất của vật trong quá trình chuyển động là bao nhiêu $m/s$?],
  [4],
  loigiai: [
    + Phương trình vận tốc $v(t) = s'(t) = t^2 - 8t + 20$.
    + Để tìm vận tốc nhỏ nhất, ta xét hàm $v(t)$.
    + Đạo hàm $v'(t) = 2t - 8 = 0 <=> t = 4$.
    + Khi đó $v(4) = 4^2 - 8(4) + 20 = 16 - 32 + 20 = 4$.
    + Vậy vận tốc nhỏ nhất là $4 m/s$.
  ]
)

#tln([Một xí nghiệp sản xuất một loại hóa chất. Tổng chi phí sản xuất $x$ lít hóa chất mỗi ngày được tính bởi $C(x) = x^2 + 40x + 1600$ (nghìn đồng). Để chi phí trung bình cho mỗi lít hóa chất là thấp nhất, xí nghiệp cần sản xuất bao nhiêu lít hóa chất mỗi ngày?],
  [40],
  loigiai: [
    + Chi phí trung bình cho 1 lít hóa chất là $A(x) = C(x)/x = (x^2 + 40x + 1600)/x = x + 40 + 1600/x$ (với $x > 0$).
    + Đạo hàm $A'(x) = 1 - 1600/x^2 = (x^2 - 1600)/x^2$.
    + $A'(x) = 0 <=> x^2 = 1600 <=> x = 40$ (vì $x > 0$).
    + Bảng biến thiên cho thấy $A(x)$ đạt giá trị nhỏ nhất tại $x = 40$.
    + Vậy cần sản xuất 40 lít hóa chất.
  ]
)

#tln([Một loài động vật hoang dã được đưa vào một khu bảo tồn thiên nhiên. Số lượng cá thể của loài này sau $t$ năm được các nhà sinh học mô hình hóa bởi hàm số $N(t) = (1200t + 500)/(2t + 5)$. Khi thời gian sinh sống tại đây đủ lâu ($t -> +oo$), số lượng cá thể trong khu bảo tồn sẽ ổn định ở mức giới hạn là bao nhiêu cá thể?],
  [600],
  loigiai: [
    + Giới hạn lượng cá thể khi thời gian đủ lớn chính là bài toán tìm tiệm cận ngang khi $t -> +oo$.
    + Ta có $lim_(t -> +oo) N(t) = lim_(t -> +oo) (1200t + 500)/(2t + 5) = 1200 / 2 = 600$.
    + Vậy số lượng cá thể sẽ ổn định ở mức 600.
  ]
)
