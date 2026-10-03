#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *

#let True(body) = (body: body, correct: true)
#let False(body) = (body: body, correct: false)

#let mode = "dethi"
#let accent = rgb("e11d48") // Rose for Exam 8
#let ma-de = "1008"
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "SỞ GIÁO DỤC VÀ ĐÀO TẠO TP HCM",
  school: "TRƯỜNG THPT NGUYỄN HỮU CẢNH",
  exam-title: "ĐỀ ÔN KIỂM TRA CHƯƠNG I - BÀI 1, 2, 3 (ĐỀ 8)",
  subject: "TOÁN 12",
  duration: "45 phút",
  structure: auto,
  code: ma-de,
  footer-left: [Biên soạn: GV Nguyễn Sáng],
  accent: accent,
  show-topbar: false,
)

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi chỉ chọn một phương án.], count: 12, reset-counter: true)

#tn([Hàm số $y = (2x+3)/(x-1)$ đồng biến hay nghịch biến trên các khoảng xác định của nó?],
  (
    [Đồng biến trên $RR \\ {1}$],
    [Nghịch biến trên $RR \\ {1}$],
    True([Nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$]),
    [Đồng biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$]
  ),
  loigiai: [
    + Tập xác định $D = RR \\ {1}$.
    + Đạo hàm $y' = (2(-1) - 1(3))/(x-1)^2 = (-5)/(x-1)^2 < 0 forall x != 1$.
    + Vậy hàm số nghịch biến trên các khoảng $(-oo; 1)$ và $(1; +oo)$.
  ]
)

#tn([Đường tiệm cận ngang của đồ thị hàm số $y = (-x+2)/(x+3)$ là],
  (
    [$x = -3$],
    [$y = 2$],
    True([$y = -1$]),
    [$x = -1$]
  ),
  loigiai: [
    + Ta có $lim_(x -> +-oo) y = lim_(x -> +-oo) (-x+2)/(x+3) = -1$.
    + Vậy tiệm cận ngang là đường thẳng $y = -1$.
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
    + Đạo hàm $y' = 3x^2 - 3 = 0 <=> x=1$ hoặc $x=-1$ (loại).
    + Ta tính các giá trị: $y(0) = 0$, $y(1) = 1 - 3 = -2$, $y(2) = 8 - 6 = 2$.
    + Vậy giá trị nhỏ nhất trên đoạn $[0; 2]$ là $-2$.
  ]
)

#tn([Cho hàm số $y=f(x)$ có đạo hàm $f'(x) = x(x-1)^2 (x+2)^3$. Số điểm cực trị của hàm số đã cho là],
  (
    [$1$],
    True([$2$]),
    [$3$],
    [$4$]
  ),
  loigiai: [
    + $f'(x) = 0 <=> x=0$ (nghiệm bội 1), $x=1$ (nghiệm bội 2), $x=-2$ (nghiệm bội 3).
    + Đạo hàm chỉ đổi dấu khi đi qua các nghiệm bội lẻ là $x=0$ và $x=-2$.
    + Vậy hàm số có 2 điểm cực trị.
  ]
)

#tn([Một quần thể vi khuẩn có kích thước được mô hình hóa bởi hàm số $P(t) = (100t)/(t+5)$ (nghìn con), trong đó $t >= 0$ là thời gian tính bằng ngày. Tốc độ tăng trưởng của quần thể tại thời điểm $t = 5$ là bao nhiêu?],
  (
    [$2$ nghìn con/ngày],
    [$4$ nghìn con/ngày],
    True([$5$ nghìn con/ngày]),
    [$10$ nghìn con/ngày]
  ),
  loigiai: [
    + Tốc độ tăng trưởng là đạo hàm $P'(t) = (100(t+5) - 100t(1))/(t+5)^2 = 500/(t+5)^2$.
    + Tại $t=5$, tốc độ tăng trưởng là $P'(5) = 500/(5+5)^2 = 500/100 = 5$ (nghìn con/ngày).
  ]
)

#tn([Đồ thị hàm số $y = (x^2-4)/(x^2+2x)$ có bao nhiêu đường tiệm cận đứng?],
  (
    [$0$],
    True([$1$]),
    [$2$],
    [$3$]
  ),
  loigiai: [
    + Tử số: $x^2-4 = (x-2)(x+2)$. Mẫu số: $x^2+2x = x(x+2)$.
    + Rút gọn phân thức (với $x != -2$): $y = (x-2)/x$.
    + Tại $x=0$, mẫu bằng 0, tử bằng $-2 != 0$. Vậy có đúng 1 tiệm cận đứng là $x=0$.
  ]
)

#tn([Giá trị lớn nhất của hàm số $y = -x^4 + 2x^2 + 3$ là],
  (
    [$3$],
    True([$4$]),
    [$5$],
    [$6$]
  ),
  loigiai: [
    + Tập xác định: $D = RR$.
    + Đạo hàm $y' = -4x^3 + 4x = -4x(x^2 - 1) = 0 <=> x = 0$ hoặc $x = +-1$.
    + Bảng biến thiên cho thấy cực đại đạt tại $x = +-1$.
    + Giá trị cực đại (cũng là GTLN) là $y(1) = y(-1) = -1 + 2 + 3 = 4$.
  ]
)

#tn([Chi phí trung bình để sản xuất $x$ sản phẩm được cho bởi hàm số $C(x) = x^2 + 20x + 100$ (nghìn đồng). Hàm chi phí trung bình trên mỗi sản phẩm là $A(x) = C(x)/x$ ($x > 0$). Chi phí trung bình thấp nhất là bao nhiêu?],
  (
    [$20$ nghìn đồng],
    True([$40$ nghìn đồng]),
    [$60$ nghìn đồng],
    [$100$ nghìn đồng]
  ),
  loigiai: [
    + Ta có $A(x) = (x^2 + 20x + 100)/x = x + 20 + 100/x$.
    + Áp dụng BĐT AM-GM: $A(x) = x + 100/x + 20 >= 2sqrt(x * 100/x) + 20 = 20 + 20 = 40$.
    + Dấu "=" xảy ra khi $x = 100/x <=> x = 10$.
    + Vậy chi phí trung bình thấp nhất là 40 nghìn đồng.
  ]
)

#tn([Điểm cực tiểu của đồ thị hàm số $y = (x^2 + x + 4)/(x+1)$ có tọa độ là],
  (
    True([$(1; 3)$]),
    [$(-3; -5)$],
    [$(1; 0)$],
    [$(-1; 3)$]
  ),
  loigiai: [
    + Ta có $y = (x(x+1) + 4)/(x+1) = x + 4/(x+1)$.
    + Đạo hàm $y' = 1 - 4/(x+1)^2 = ((x+1)^2 - 4)/(x+1)^2 = (x^2+2x-3)/(x+1)^2$.
    + $y' = 0 <=> x^2+2x-3 = 0 <=> x=1$ hoặc $x=-3$.
    + Bảng biến thiên: $y'$ đổi dấu từ $-$ sang $+$ khi qua $x=1$.
    + Vậy $x=1$ là điểm cực tiểu. Thay vào, $y = (1+1+4)/2 = 3$. Tọa độ $(1; 3)$.
  ]
)

#tn([Phương trình đường tiệm cận ngang của đồ thị hàm số $y = (sqrt(x^2+1) - x)/x$ khi $x -> +oo$ là],
  (
    [$y = 1$],
    [$y = -1$],
    True([$y = 0$]),
    [Không có tiệm cận ngang]
  ),
  loigiai: [
    + $lim_(x -> +oo) (sqrt(x^2+1) - x)/x = lim_(x -> +oo) (sqrt(1+1/x^2) - 1) = 1 - 1 = 0$.
    + Vậy tiệm cận ngang khi $x -> +oo$ là $y = 0$.
  ]
)

#tn([Vận tốc của một vật chuyển động được cho bởi phương trình $v(t) = -t^3 + 6t^2 + 15t$ (m/s), trong đó $t$ là thời gian tính bằng giây ($t >= 0$). Vật đạt vận tốc lớn nhất tại thời điểm nào?],
  (
    [$3$ s],
    True([$5$ s]),
    [$2$ s],
    [$6$ s]
  ),
  loigiai: [
    + Đạo hàm $v'(t) = -3t^2 + 12t + 15$.
    + Cho $v'(t) = 0 <=> t^2 - 4t - 5 = 0 <=> t = 5$ hoặc $t = -1$ (loại).
    + Bảng biến thiên cho thấy $v(t)$ đạt cực đại tại $t=5$.
  ]
)

#tn([Người ta muốn xây dựng một sân chơi hình chữ nhật nằm bên trong một khu đất hình parabol $y = 12 - x^2$. Một cạnh của sân chơi nằm trên trục hoành (trục $O x$), hai đỉnh còn lại nằm trên parabol (với $y > 0$). Diện tích lớn nhất của sân chơi là bao nhiêu?],
  (
    [$24$],
    True([$32$]),
    [$16$],
    [$36$]
  ),
  loigiai: [
    + Gọi tọa độ góc phần tư thứ nhất của hình chữ nhật trên parabol là $(x; 12-x^2)$ với $0 < x < sqrt(12)$.
    + Hình chữ nhật đối xứng qua trục tung nên có chiều dài là $2x$ và chiều rộng là $12-x^2$.
    + Diện tích $S(x) = 2x(12-x^2) = 24x - 2x^3$.
    + Đạo hàm $S'(x) = 24 - 6x^2 = 0 <=> x^2 = 4 <=> x=2$.
    + Diện tích lớn nhất $S(2) = 24(2) - 2(2^3) = 48 - 16 = 32$.
  ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4, reset-counter: true)

#ds([Cho hàm số $y = (2x^2 - x - 1)/(x + 1)$.],
  (
    True([Đồ thị hàm số có tiệm cận đứng là $x = -1$.]),
    True([Đồ thị hàm số có tiệm cận xiên là $y = 2x - 3$.]),
    False([Hàm số đạt cực đại tại $x = 0$.]),
    False([Giá trị cực tiểu của hàm số là $-7$.])
  ),
  loigiai: [
    + Mẫu bằng 0 tại $x=-1$, tử tại đó là $2(-1)^2 - (-1) - 1 = 2 != 0$. Nên $x=-1$ là TCĐ. => a) Đúng.
    + Thực hiện phép chia: $2x^2 - x - 1 = (x+1)(2x - 3) + 2$. Vậy $y = 2x - 3 + 2/(x+1)$. TCX là $y = 2x-3$. => b) Đúng.
    + Đạo hàm $y' = 2 - 2/(x+1)^2 = (2(x+1)^2 - 2)/(x+1)^2 = (2x^2+4x)/(x+1)^2$.
    + $y' = 0 <=> x=0$ hoặc $x=-2$. Bảng biến thiên: $x=-2$ là cực đại, $x=0$ là cực tiểu. => c) Sai.
    + Thay $x=0 => y(0) = -1$. Vậy giá trị cực tiểu là $-1$, không phải $-7$. => d) Sai.
  ]
)

#ds([Một doanh nghiệp sản xuất và bán một loại sản phẩm. Giá bán của mỗi sản phẩm phụ thuộc vào số lượng sản phẩm bán ra $x$ theo hàm số $p(x) = 120 - x$ (nghìn đồng/sản phẩm). Hàm chi phí để sản xuất $x$ sản phẩm là $C(x) = 20x + 100$ (nghìn đồng). (Giả sử $x >= 0$).],
  (
    True([Hàm doanh thu của doanh nghiệp là $R(x) = 120x - x^2$.]),
    True([Hàm lợi nhuận là $P(x) = -x^2 + 100x - 100$.]),
    False([Để đạt lợi nhuận tối đa, doanh nghiệp cần sản xuất 100 sản phẩm.]),
    True([Lợi nhuận tối đa của doanh nghiệp là $2,400$ nghìn đồng.])
  ),
  loigiai: [
    + Doanh thu $R(x) = x * p(x) = x(120-x) = 120x - x^2$. => a) Đúng.
    + Lợi nhuận $P(x) = R(x) - C(x) = 120x - x^2 - (20x+100) = -x^2 + 100x - 100$. => b) Đúng.
    + Đạo hàm $P'(x) = -2x + 100 = 0 <=> x=50$. Vậy để đạt lợi nhuận max cần bán 50 sản phẩm. => c) Sai.
    + Lợi nhuận lớn nhất $P(50) = -50^2 + 100(50) - 100 = -2500 + 5000 - 100 = 2400$ (nghìn đồng). => d) Đúng.
  ]
)

#ds([Cho hàm số $y=f(x)$ liên tục trên $RR \\ {1}$ và có bảng biến thiên như sau:
#align(center)[
  #bbbt(
    x-vals: ($-oo$, $1$, $3$, $+oo$),
    d-signs: ($-$, "||", $-$, $0$, $+$),
    v-vals: ($2$, $-oo$, "||", $+oo$, $3$, $+oo$),
  )
]],
  (
    True([Đồ thị hàm số có đúng một tiệm cận đứng và một tiệm cận ngang.]),
    True([Hàm số đạt cực tiểu tại $x = 3$.]),
    False([Hàm số nghịch biến trên khoảng $(-oo; 3)$.]),
    True([Phương trình $f(x) = 4$ có đúng $2$ nghiệm phân biệt.])
  ),
  loigiai: [
    + Giới hạn tại $x -> 1^+$ là $+oo$ và tại $x -> 1^-$ là $-oo$ nên $x=1$ là TCĐ.
    + Giới hạn tại $x -> -oo$ là $2$ nên $y=2$ là TCN. (bên $+oo$ không có TCN). Tổng là 2 tiệm cận. => a) Đúng.
    + Tại $x=3$, đạo hàm đổi dấu từ $-$ sang $+$ nên $x=3$ là điểm cực tiểu. => b) Đúng.
    + Hàm số nghịch biến trên $(-oo; 1)$ và $(1; 3)$. Nói nghịch biến trên $(-oo; 3)$ là sai (vì gián đoạn tại 1). => c) Sai.
    + Đường $y=4$ cắt nhánh $(-oo, 1)$ tại 1 điểm (do đi từ 2 xuống $-oo$, không có 4. Wait, đi từ 2 xuống $-oo$ thì không qua 4!
    + Nhánh $(1, +oo)$: đi từ $+oo$ xuống 3, rồi tăng lên $+oo$. Cắt $y=4$ tại 2 điểm.
    + Vậy tổng có 2 nghiệm phân biệt. => d) Đúng.
  ]
)

#ds([Một hồ bơi có thể tích $V = 32 m^3$ dạng hình hộp chữ nhật không có nắp, đáy hình vuông cạnh $x$ (m). Người ta cần lót gạch men mặt đáy và 4 mặt xung quanh. Chi phí vật liệu để lót gạch mặt đáy là $400$ (nghìn đồng/$m^2$), mặt xung quanh là $50$ (nghìn đồng/$m^2$).],
  (
    False([Diện tích lót gạch của hồ bơi là $S = x^2 + 4x$.]),
    True([Hàm chi phí lát gạch theo $x$ là $C(x) = 400x^2 + 6400/x$ (nghìn đồng).]),
    True([Chi phí lát gạch sẽ đạt giá trị nhỏ nhất khi $x = 2$ (m).]),
    True([Chi phí lát gạch thấp nhất là 4,800 nghìn đồng.])
  ),
  loigiai: [
    + Thể tích $V = x^2 h = 32 => h = 32/x^2$.
    + Diện tích đáy là $x^2$, diện tích xung quanh là $4x h = 4x(32/x^2) = 128/x$. Tổng diện tích là $S = x^2 + 128/x$. => a) Sai.
    + Chi phí $C(x) = 400x^2 + 50(128/x) = 400x^2 + 6400/x$. => b) Đúng.
    + Đạo hàm $C'(x) = 800x - 6400/x^2 = (800x^3 - 6400)/x^2$.
    + $C'(x) = 0 <=> x^3 = 8 <=> x = 2$.
    + Bảng biến thiên cho thấy $C(x)$ đạt GTNN tại $x=2$. => c) Đúng.
    + Chi phí nhỏ nhất là $C(2) = 400(2^2) + 6400/2 = 1600 + 3200 = 4800$ (nghìn đồng). => d) Đúng.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh điền đáp án số vào chỗ trống.], count: 6, reset-counter: true)

#tln([Cho hàm số $y = x^3 - 3x^2 + 2$ có điểm cực đại là $A(x_1; y_1)$ và điểm cực tiểu là $B(x_2; y_2)$. Tính $y_1 - y_2$.],
  [4],
  loigiai: [
    + Đạo hàm $y' = 3x^2 - 6x = 0 <=> x=0$ hoặc $x=2$.
    + Điểm cực đại $x=0 => y_1 = 2$.
    + Điểm cực tiểu $x=2 => y_2 = 2^3 - 3(2^2) + 2 = -2$.
    + Vậy $y_1 - y_2 = 2 - (-2) = 4$.
  ]
)

#tln([Đường tiệm cận xiên của đồ thị hàm số $y = (x^2 + 3x - 1)/(x + 1)$ tạo với hai trục tọa độ một tam giác có diện tích bằng bao nhiêu?],
  [2],
  loigiai: [
    + Thực hiện phép chia: $x^2 + 3x - 1 = (x+1)(x+2) - 3$. Vậy $y = x+2 - 3/(x+1)$.
    + Tiệm cận xiên là đường thẳng $d: y = x + 2$.
    + Giao với $O x$: cho $y=0 => x = -2$. Điểm $A(-2; 0)$.
    + Giao với $O y$: cho $x=0 => y = 2$. Điểm $B(0; 2)$.
    + Tam giác $O A B$ vuông tại $O$, diện tích $S = 1/2 * O A * O B = 1/2 * 2 * 2 = 2$.
  ]
)

#tln([Nồng độ một loại thuốc trong máu của bệnh nhân (tính bằng mg/L) sau $t$ giờ tiêm được cho bởi hàm số $C(t) = (5t)/(t^2 + 4)$. Sau bao nhiêu giờ tiêm thì nồng độ thuốc trong máu đạt mức cao nhất?],
  [2],
  loigiai: [
    + Đạo hàm $C'(t) = (5(t^2+4) - 5t(2t))/(t^2+4)^2 = (20 - 5t^2)/(t^2+4)^2$.
    + $C'(t) = 0 <=> 5t^2 = 20 <=> t^2 = 4 <=> t = 2$ (do $t > 0$).
    + Vậy nồng độ thuốc đạt lớn nhất sau 2 giờ.
  ]
)

#tln([Chi phí sản xuất $x$ sản phẩm của một nhà máy được cho bởi $C(x) = 2x^2 + 10x + 5000$ (nghìn đồng). Để chi phí trung bình sản xuất MỘT sản phẩm là thấp nhất, nhà máy cần sản xuất bao nhiêu sản phẩm?],
  [50],
  loigiai: [
    + Chi phí trung bình: $A(x) = C(x)/x = 2x + 10 + 5000/x$.
    + Áp dụng BĐT AM-GM: $2x + 5000/x >= 2sqrt(2x * 5000/x) = 2sqrt(10000) = 200$.
    + Dấu "=" xảy ra khi $2x = 5000/x <=> x^2 = 2500 <=> x = 50$.
    + Vậy cần sản xuất 50 sản phẩm.
  ]
)

#tln([Chi phí quảng cáo (đơn vị: triệu đồng) để đạt được $x$ mức độ tương tác trực tuyến được ước lượng bằng hàm $C(x) = 3x^2 - 120x + 5000$ (với $x >= 0$). Hỏi mức độ tương tác $x$ bằng bao nhiêu thì chiến dịch đạt mức chi phí tối ưu (nhỏ nhất)?],
  [20],
  loigiai: [
    + Hàm số $C(x) = 3x^2 - 120x + 5000$ là một parabol bề lõm quay lên.
    + Chi phí nhỏ nhất đạt tại tọa độ đỉnh: $x = -b/(2a) = -(-120) / (2*3) = 120 / 6 = 20$.
    + Vậy cần đạt mức độ tương tác $x=20$ thì chi phí là tối ưu.
  ]
)

#tln([Một vật được ném thẳng đứng lên trên từ mặt đất. Chiều cao của vật so với mặt đất sau $t$ giây là $h(t) = 40t - 5t^2$ (mét). Vật đạt độ cao lớn nhất sau bao nhiêu giây?],
  [4],
  loigiai: [
    + Đạo hàm $h'(t) = 40 - 10t$.
    + Cho $h'(t) = 0 <=> 10t = 40 <=> t = 4$.
    + Đây là hàm bậc hai hệ số $a = -5 < 0$ nên đạt GTLN tại $t=4$.
  ]
)
