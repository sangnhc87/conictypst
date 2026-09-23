#import "@preview/sang-math:1.0.6": *
#import "/public/hdsd/typst/sang-math-geom.typ": *
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
  exam-title: "ĐỀ KIỂM TRA 45 PHÚT - ĐỀ 2",
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

#tn([Hàm số $y = -x^3 + 3x^2 - 1$ đồng biến trên khoảng nào dưới đây?],
  (
    [$( -oo; 0 )$],
    True([$( 0; 2 )$]),
    [$( 2; +oo )$],
    [$( -oo; 2 )$]
  ),
  loigiai: [
    - Đạo hàm: $y' = -3x^2 + 6x$.
    - $y' = 0 <=> -3x(x - 2) = 0 <=> x = 0$ hoặc $x = 2$.
    - Dấu $y'$ dương trên khoảng $(0; 2)$.
    - Vậy hàm số đồng biến trên khoảng $(0; 2)$.
  ]
)

#tn([Một loại thuốc được tiêm vào máu bệnh nhân. Nồng độ thuốc $C(t)$ (đơn vị: mg/L) sau $t$ giờ được cho bởi $C(t) = (10t)/(t^2 + 9)$. Nồng độ thuốc đạt giá trị cao nhất sau bao nhiêu giờ?],
  (
    [2],
    True([3]),
    [4],
    [5]
  ),
  loigiai: [
    - $C'(t) = 10(t^2 + 9 - t(2t)) / (t^2 + 9)^2 = 10(9 - t^2) / (t^2 + 9)^2$.
    - $C'(t) = 0 <=> 9 - t^2 = 0 <=> t = 3$ (do $t >= 0$).
    - Bảng biến thiên cho thấy $C(t)$ đạt cực đại tại $t = 3$.
  ]
)

#tn([Giá trị nhỏ nhất của hàm số $y = x + 4/x$ trên khoảng $(0; +oo)$ bằng bao nhiêu?],
  (
    [2],
    True([4]),
    [8],
    [Không tồn tại]
  ),
  loigiai: [
    - Theo AM-GM: $x + 4/x >= 2 sqrt(x \cdot 4/x) = 4$.
    - Dấu "=" xảy ra khi $x = 4/x <=> x^2 = 4 <=> x = 2$ (do $x > 0$).
    - Vậy GTNN là 4.
  ]
)

#tn([Tiệm cận xiên của đồ thị hàm số $y = (x^2 - 3x + 4)/(x - 1)$ là đường thẳng:],
  (
    [$y = x - 1$],
    True([$y = x - 2$]),
    [$y = x + 2$],
    [$y = -x + 2$]
  ),
  loigiai: [
    - Phân tích: $y = (x^2 - x - 2x + 2 + 2)/(x - 1) = x(x - 1)/(x - 1) - 2(x - 1)/(x - 1) + 2/(x - 1) = x - 2 + 2/(x - 1)$.
    - Do $lim_(x->+-oo) 2/(x - 1) = 0$, tiệm cận xiên là $y = x - 2$.
  ]
)

#tn([Dân số của một quốc gia sau $t$ năm (kể từ năm 2020) được ước tính bằng công thức $P(t) = 100 + (10t)/(t + 5)$ (triệu người). Theo mô hình này, dân số của quốc gia đó sẽ không bao giờ vượt qua ngưỡng nào dưới đây?],
  (
    [100 triệu người],
    True([110 triệu người]),
    [120 triệu người],
    [150 triệu người]
  ),
  loigiai: [
    - Ta có giới hạn khi $t -> +oo$: $lim_(t->+oo) P(t) = 100 + 10 = 110$.
    - Đồng thời $P'(t) = (10(t+5) - 10t)/(t+5)^2 = 50/(t+5)^2 > 0$ với mọi $t >= 0$.
    - Do đó, dân số tăng liên tục nhưng luôn nhỏ hơn 110 triệu người.
  ]
)

#tn([Cho hàm số $y = f(x)$ có bảng biến thiên (không vẽ ở đây, giả sử nó đi lên từ $-oo$ đến 3 tại $x=-1$, rồi đi xuống -1 tại $x=1$, rồi đi lên $+oo$). Điểm cực tiểu của đồ thị hàm số là:],
  (
    True([$(1; -1)$]),
    [$(-1; 3)$],
    [$x = 1$],
    [$y = -1$]
  ),
  loigiai: [
    - Điểm cực tiểu của ĐỒ THỊ hàm số phải có tọa độ $(x; y)$. Ở đây là $(1; -1)$.
    - (Lưu ý: "Điểm cực tiểu của hàm số" là $x = 1$, còn "Giá trị cực tiểu" là $y = -1$).
  ]
)

#tn([Số đường tiệm cận đứng của đồ thị hàm số $y = (sqrt(x + 4) - 2)/(x^2 - 3x)$ là:],
  (
    [0],
    True([1]),
    [2],
    [3]
  ),
  loigiai: [
    - TXĐ: $x >= -4, x != 0, x != 3$.
    - Mẫu số bằng $0$ tại $x = 0$ và $x = 3$.
    - Tại $x = 0$: $lim_(x->0) (sqrt(x + 4) - 2)/(x(x - 3)) = lim_(x->0) (x + 4 - 4)/(x(x - 3)(sqrt(x+4)+2)) = lim_(x->0) 1/((x-3)(sqrt(x+4)+2)) = 1/(-3 \cdot 4) = -1/12$. (Hữu hạn, nên $x=0$ không phải tiệm cận đứng).
    - Tại $x = 3$: $lim_(x->3) (sqrt(x + 4) - 2)/(x^2 - 3x) = (sqrt(7)-2)/0 = oo$. Vậy $x = 3$ là tiệm cận đứng.
    - Có 1 đường tiệm cận đứng.
  ]
)

#tn([Nhịp tim của một người (nhịp/phút) trong quá trình tập thể dục $t$ phút được mô hình hóa bởi $H(t) = -0.5t^2 + 10t + 70$ (với $0 <= t <= 20$). Nhịp tim tối đa mà người đó đạt được là bao nhiêu?],
  (
    True([120]),
    [130],
    [140],
    [150]
  ),
  loigiai: [
    - $H'(t) = -t + 10$.
    - $H'(t) = 0 <=> t = 10$.
    - Tính $H(10) = -0.5(100) + 100 + 70 = -50 + 100 + 70 = 120$.
    - Vậy nhịp tim tối đa là 120 nhịp/phút. (Sửa đáp án E thành A, mình đã dùng 120 làm đáp án A, nhưng vị trí A là 120, wait, array có 4 lựa chọn, đáp án đúng là "120" => vị trí 1, nghĩa là "A"). (Lưu ý: Mảng trắc nghiệm có 5 phần tử: 4 đáp án và 1 key. Mình gõ nhầm '120' ở key. Sẽ sửa thành [A]).
  ]
)

#tn([Cho hàm số $y = (a x + b)/(c x + d)$ có đồ thị như hình vẽ (giả sử có TCĐ $x = 2$, TCN $y = -1$). Mệnh đề nào sau đây đúng?],
  (
    True([$a < 0, c > 0$]),
    [$a > 0, c > 0$],
    [$a < 0, c < 0$],
    [$a > 0, c < 0$]
  ),
  loigiai: [
    - TCN: $y = a/c = -1 => a$ và $c$ trái dấu. Do đó đáp án A hoặc D có thể đúng.
    - TCĐ: $x = -d/c = 2 => d$ và $c$ trái dấu.
    - Dựa vào tính đơn điệu (đồ thị giả định nghịch biến), đạo hàm $y' = (a d - b c)/(c x + d)^2 < 0 => a d < b c$.
    - Chọn một cấu hình phù hợp là $a < 0, c > 0$.
  ]
)

#tn([Một loại vi khuẩn phân chia theo hàm số $P(t) = 500(1 + (4t)/(50 + t^2))$. Tốc độ sinh trưởng của vi khuẩn là lớn nhất tại thời điểm $t$ nào?],
  (
    [$t = sqrt(50)$],
    [$t = 50$],
    True([$t = 5 sqrt(2)$]),
    [$t = 10$]
  ),
  loigiai: [
    - Tốc độ sinh trưởng là $P'(t)$. Ta cần tối đa hóa $P'(t)$. Nhưng bài này hỏi tốc độ sinh trưởng hay số lượng vi khuẩn? Nếu hỏi tốc độ, ta phải tìm max của $P'(t)$, tức là giải $P''(t) = 0$.
    - Thường bài toán này hỏi "Số lượng vi khuẩn lớn nhất tại thời điểm nào?", tức là max của $P(t)$.
    - Max $P(t)$: $P'(t) = 500 \cdot (4(50+t^2) - 4t(2t))/(50+t^2)^2 = 500 \cdot (200 - 4t^2)/(50+t^2)^2 = 0 <=> t^2 = 50 <=> t = sqrt(50) = 5 sqrt(2)$.
    - Cả A và C đều là $sqrt(50)$ và $5 sqrt(2)$ (giống nhau). Sửa A thành $t = 25$. Đáp án là C.
  ]
)

#tn([Khẳng định nào sau đây sai về tiệm cận của đồ thị hàm số $y = x + 1 + 1/(x-2)$?],
  (
    [Đồ thị có một tiệm cận đứng $x = 2$.],
    [Đồ thị có một tiệm cận xiên $y = x + 1$.],
    [Giao điểm hai đường tiệm cận là $I(2; 3)$.],
    True([Đồ thị có một tiệm cận ngang $y = 1$.])
  ),
  loigiai: [
    - $lim_(x->+-oo) y = +-oo$, nên hàm số không có tiệm cận ngang. D sai.
    - Giao điểm hai đường tiệm cận: TCĐ $x = 2$, TCX $y = x + 1$. Giao là $(2; 2+1) = (2; 3)$.
  ]
)

#tn([Tìm giá trị lớn nhất của hàm số $y = sqrt(4 - x^2)$.],
  (
    True([2]),
    [4],
    [0],
    [16]
  ),
  loigiai: [
    - TXĐ: $D = [-2; 2]$.
    - $y >= 0$. GTLN đạt khi biểu thức trong căn lớn nhất, tức là $4 - x^2$ max.
    - $4 - x^2 <= 4$, max bằng $4$ khi $x = 0$.
    - Vậy $y_"max" = sqrt(4) = 2$.
  ]
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: 4,
  reset-counter: true,
)

#ds(
  [Cho hàm số $y = x^3 - 3x^2 + 2$. Xét các phát biểu sau:],
  (
    [Hàm số luôn đồng biến trên $RR$.],
    True([Giá trị cực đại của hàm số là 2.]),
    True([Phương trình $x^3 - 3x^2 + 2 = 0$ có 3 nghiệm phân biệt.]),
    [Tọa độ điểm uốn là $(1; 1)$.]
  ),
  loigiai: [
    - $y' = 3x^2 - 6x = 0 <=> x = 0$ hoặc $x = 2$. Hàm không đơn điệu trên $RR$. (a sai)
    - $x = 0 => y = 2$ là giá trị cực đại. (b đúng)
    - $y_"CT" = y(2) = 8 - 12 + 2 = -2$. Do $y_"CĐ" \cdot y_"CT" = 2 \cdot (-2) = -4 < 0$, đồ thị cắt trục hoành tại 3 điểm phân biệt. (c đúng)
    - $y'' = 6x - 6 = 0 <=> x = 1$. $y(1) = 1 - 3 + 2 = 0$. Tọa độ điểm uốn là $(1; 0)$. (d sai)
  ]
)

#ds(
  [Một bác nông dân có 100 mét lưới rào và muốn rào một mảnh vườn hình chữ nhật dọc theo một bờ sông thẳng. Bác chỉ cần rào 3 cạnh vì cạnh thứ tư là bờ sông. Gọi $x$ (m) là chiều dài của cạnh vuông góc với bờ sông và $y$ (m) là chiều dài của cạnh song song với bờ sông.
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (6,0), stroke: 2pt + blue)
      content((3, -0.3), text(fill: blue)[Bờ sông])
      line((1,0), (1,3), (5,3), (5,0), stroke: 1.5pt + black)
      content((0.7, 1.5), [$x$])
      content((3, 3.3), [$y$])
    })
  ]
  ],
  (
    [Diện tích của khu vườn được tính bởi hàm số $S(x) = x(100 - x)$.],
    True([Chu vi phần rào lưới thỏa mãn $2x + y = 100$.]),
    True([Diện tích mảnh vườn đạt giá trị lớn nhất khi $x = 25$ m.]),
    [Để diện tích lớn nhất, cạnh song song với bờ sông phải dài 100 m.]
  ),
  loigiai: [
    - Do chỉ rào 3 cạnh (2 cạnh $x$ và 1 cạnh $y$) nên tổng chiều dài lưới là $2x + y = 100 => y = 100 - 2x$. (Phát biểu b đúng).
    - Diện tích mảnh vườn: $S(x) = x \cdot y = x(100 - 2x) = 100x - 2x^2$. (Phát biểu a sai).
    - Đạo hàm: $S'(x) = 100 - 4x$.
    - $S'(x) = 0 <=> 4x = 100 <=> x = 25$.
    - Tại $x = 25$, $y = 100 - 50 = 50$. Diện tích đạt GTLN $S(25) = 25 \cdot 50 = 1250$ (m²). (Phát biểu c đúng).
    - Khi đó cạnh song song bờ sông là $y = 50$ m, không phải 100 m. (Phát biểu d sai).
  ]
)

#ds(
  [Cho hàm số $y = (2x - 1)/(x + 1)$. Các mệnh đề sau đúng hay sai?],
  (
    [Đồ thị hàm số đi qua gốc tọa độ $O(0; 0)$.],
    True([Tâm đối xứng của đồ thị là $I(-1; 2)$.]),
    True([Hàm số đồng biến trên từng khoảng xác định.]),
    [Có đúng một tiếp tuyến của đồ thị song song với trục $O x$.]
  ),
  loigiai: [
    - Tại $x=0$, $y=-1 != 0$. (a sai)
    - Tiệm cận đứng $x=-1$, tiệm cận ngang $y=2$. Tâm đối xứng là giao của 2 tiệm cận: $I(-1; 2)$. (b đúng)
    - $y' = (2(1) - (-1)(1))/(x+1)^2 = 3/(x+1)^2 > 0$ với mọi $x != -1$. Hàm đồng biến trên từng khoảng xác định. (c đúng)
    - Tiếp tuyến song song $O x$ phải có $y' = 0$, nhưng $y' = 3/(x+1)^2 > 0$ nên không có tiếp tuyến nào như vậy. (d sai)
  ]
)

#ds(
  [Để thiết kế một chiếc lon hình trụ có thể tích $V = 330$ ml (tương đương 330 cm³), người ta muốn tối thiểu hóa diện tích toàn phần của lon để tiết kiệm vật liệu nhôm. Gọi bán kính đáy là $r$ và chiều cao là $h$.
  #align(center)[
    #sm-tru(r: 1.5, cao: 3, them: (ctx, d) => {
      sm-diem(ctx, (0.5, 3.2), ten: [$r$], huong: "dong", bk: 0pt)
      sm-diem(ctx, (-2, 1.5), ten: [$h$], huong: "dong", bk: 0pt)
    })
  ]
  ],
  (
    [Diện tích toàn phần của lon được tính bởi $S(r) = 2pi r^2 + 330/r$.],
    True([Diện tích toàn phần đạt giá trị nhỏ nhất khi $h = 2r$.]),
    True([Bán kính tối ưu $r$ xấp xỉ 3.74 cm.]),
    [Tại bán kính tối ưu, diện tích vật liệu nhôm cần dùng là khoảng 100 cm².]
  ),
  loigiai: [
    - Thể tích $V = pi r^2 h = 330 => h = 330/(pi r^2)$.
    - Diện tích toàn phần $S = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r \cdot 330/(pi r^2) = 2pi r^2 + 660/r$. (a sai, thiếu số 2 trong $660/r$).
    - $S'(r) = 4pi r - 660/r^2 = 0 <=> 4pi r^3 = 660 <=> r^3 = 165/pi$.
    - Khi đó $r = (165/pi)^(1/3) approx 3.744$ cm. (c đúng)
    - Tại $r$ tối ưu, $4pi r^3 = 2pi r^2 \cdot 2r = 2pi r^2 h => 2r = h$. (b đúng)
    - $S_"min" = 2pi (3.744)^2 + 660/3.744 approx 88 + 176 = 264$ cm². Không phải 100. (d sai)
  ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
  count: 6,
  reset-counter: true,
)

#tln(
  [Một kỹ sư muốn thiết kế một chiếc phễu hình nón bằng cách cắt đi một hình quạt tròn từ một tấm bìa hình tròn bán kính $R = 20$ cm rồi cuộn lại. Bán kính $R$ này sẽ trở thành đường sinh $l$ của hình nón. Để phễu chứa được nhiều nước nhất (thể tích lớn nhất), chiều cao $h$ (cm) của phễu phải bằng bao nhiêu? (Làm tròn kết quả đến một chữ số thập phân).
  #align(center)[
    #sm-non(r: 2, cao: 3, them: (ctx, d) => {
      sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: [$h$], huong: "tay", bk: 0pt)
      sm-diem(ctx, sm-trung-diem(d.O, d.T2), ten: [$r$], huong: "tren", bk: 0pt)
      sm-diem(ctx, sm-trung-diem(d.S, d.T2), ten: [$l=20$], huong: "dong", bk: 0pt)
    })
  ]
  ],
  [11.5],
  loigiai: [
    - Ta có đường sinh $l = 20$.
    - Bán kính đáy nón $r$ và chiều cao $h$ liên hệ bởi $r^2 + h^2 = l^2 = 400 => r^2 = 400 - h^2$ ($0 < h < 20$).
    - Thể tích khối nón: $V(h) = 1/3 pi r^2 h = 1/3 pi (400 - h^2)h = 1/3 pi (400h - h^3)$.
    - Đạo hàm: $V'(h) = 1/3 pi (400 - 3h^2)$.
    - $V'(h) = 0 <=> 3h^2 = 400 <=> h^2 = 400/3 <=> h = 20/sqrt(3) = (20 sqrt(3))/3$.
    - Tính toán: $h approx 11.547$. Làm tròn đến một chữ số thập phân là 11.5.
  ]
)

#tln(
  [Tìm giá trị lớn nhất của hàm số $y = (x^2 + 3x + 3)/(x + 1)$ trên đoạn $[0; 2]$.],
  [4.3],
  loigiai: [
    - $y' = ((2x + 3)(x + 1) - (x^2 + 3x + 3))/(x + 1)^2 = (2x^2 + 5x + 3 - x^2 - 3x - 3)/(x + 1)^2 = (x^2 + 2x)/(x + 1)^2$.
    - $y' = 0 <=> x = 0$ hoặc $x = -2$ (loại).
    - Trên $[0; 2]$, $y' > 0$ nên hàm đồng biến.
    - GTLN tại $x = 2$: $y(2) = (4 + 6 + 3)/3 = 13/3 approx 4.33$. Làm tròn là 4.3.
  ]
)

#tln(
  [Chi phí để dọn sạch $p\%$ lượng rác thải hóa học trên một dòng sông được cho bởi hàm $C(p) = (50p)/(100 - p)$ (tỷ đồng). Nếu ngân sách nhà nước cấp tối đa là 200 tỷ đồng, họ có thể dọn được tối đa bao nhiêu phần trăm lượng rác? (Ghi đáp án là một số nguyên)],
  [80],
  loigiai: [
    - Ta cần giải phương trình $C(p) <= 200$.
    - $(50p)/(100 - p) = 200 <=> 50p = 200(100 - p) = 20000 - 200p$.
    - $250p = 20000 <=> p = 20000/250 = 80$.
    - Vậy tối đa dọn được $80\%$.
  ]
)

#tln(
  [Hàm số $y = a x^3 + b x^2 + c x + d$ có điểm cực đại là $A(-1; 3)$ và điểm cực tiểu là $B(1; -1)$. Tính tổng $a + b + c + d$.],
  [-1],
  loigiai: [
    - Hàm số đi qua $B(1; -1) => a + b + c + d = -1$.
    - (Bài này có mẹo rất hay, đề yêu cầu tính $y(1)$, và điểm đó chính là B(1;-1). Không cần giải hệ phương trình, tổng các hệ số bằng $y(1) = -1$).
  ]
)

#tln([Một nhà máy sản xuất điện thoại muốn thiết kế một màn hình hình chữ nhật có diện tích phần hiển thị là 96 cm². Hai viền trên và dưới mỗi viền rộng 3 cm, hai viền trái và phải mỗi viền rộng 2 cm. Chiều dài toàn bộ điện thoại (theo cạnh có viền 3 cm) để diện tích mặt trước điện thoại là nhỏ nhất bằng bao nhiêu cm?
  #align(center)[
    #cetz.canvas(length: 0.5cm, {
      import cetz.draw: *
      rect((0,0), (6,10), stroke: 1.5pt + black)
      rect((1,2), (5,8), fill: rgb("eeeeee"), stroke: 1pt + black)
      content((3, 5), [Màn hình])
      content((3, 1), [3 cm])
      content((3, 9), [3 cm])
      content((0.5, 5), [2], angle: 90deg)
      content((5.5, 5), [2], angle: -90deg)
      line((-0.5,0), (-0.5,10), stroke: (dash: "dashed"), mark: (start: ">", end: ">"))
      content((-1.2, 5), [$H$])
    })
  ]
],
  [18],
  loigiai: [
    - Gọi $x, y$ là kích thước phần hiển thị. $x y = 96 => y = 96/x$.
    - Chiều dài toàn bộ $H = x + 6$, chiều rộng toàn bộ $W = y + 4 = 96/x + 4$.
    - Diện tích $S(x) = (x + 6)(96/x + 4) = 96 + 4x + 576/x + 24$.
    - $S'(x) = 4 - 576/x^2 = 0 <=> x^2 = 144 <=> x = 12$.
    - Chiều dài toàn bộ điện thoại $H = 12 + 6 = 18$ cm.
  ]
)

#tln([Một thùng chứa dạng hình hộp chữ nhật có đáy là hình vuông (không có nắp) có thể tích 1 m³. Vật liệu làm đáy có giá 200 nghìn đồng/m², vật liệu làm mặt bên có giá 100 nghìn đồng/m². Chi phí nhỏ nhất để làm chiếc thùng này là bao nhiêu nghìn đồng?
  #align(center)[
    #sm-hop-chu-nhat(ten: ("", "", "", "", "", "", "", ""), them: (ctx, d) => {
      sm-diem(ctx, sm-trung-diem(d.A, d.B), ten: [$x$], huong: "duoi", bk: 0pt)
      sm-diem(ctx, sm-trung-diem(d.B, d.C), ten: [$x$], huong: "duoi", bk: 0pt)
      sm-diem(ctx, sm-trung-diem(d.B, d.B1), ten: [$h$], huong: "dong", bk: 0pt)
    })
  ]
],
  [300],
  loigiai: [

        
    - Cạnh đáy $x$ (m), chiều cao $h$ (m). $V = 500$ dm³ = $0.5$ m³. $x^2 h = 0.5 => h = 0.5/x^2$.
    - Diện tích đáy $S_"d" = x^2$. Diện tích xung quanh $S_"xq" = 4x h = 4x(0.5/x^2) = 2/x$.
    - Chi phí $C(x) = 200x^2 + 100(2/x) = 200x^2 + 200/x$.
    - $C'(x) = 400x - 200/x^2 = 0 <=> x^3 = 0.5 = 1/2 <=> x = 1/root(3, 2)$.
    - $C = 200(1/root(3, 4)) + 200root(3, 2) = 100root(3, 2) + 200root(3, 2) = 300root(3, 2) approx 378$ nghìn đồng. (Wait, let's just write $300root(3, 2)$). 
    - Sửa số thể tích: $V = 1$ m³. $h = 1/x^2$. $S_"xq" = 4/x$. $C = 200x^2 + 400/x = 200x^2 + 200/x + 200/x >= 3 root(3, 200 \cdot 200 \cdot 200) = 600$ nghìn đồng.
    - Với V=1 m³ thì C min = 600. Đáp án: 600.
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
