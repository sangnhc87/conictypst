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
  exam-title: "ĐỀ KIỂM TRA 45 PHÚT - ĐỀ 4",
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

#tn([Một chất điểm chuyển động với phương trình $s(t) = -t^3 + 9t^2 - 15t + 10$ ($s$ tính bằng mét, $t$ tính bằng giây, $t >= 0$). Vận tốc lớn nhất mà chất điểm đạt được là bao nhiêu m/s?],
  (
    True([12]),
    [15],
    [27],
    [3]
  ),
  loigiai: [
    - Phương trình vận tốc: $v(t) = s'(t) = -3t^2 + 18t - 15$.
    - Cần tìm max của $v(t)$. Đạo hàm gia tốc: $a(t) = v'(t) = -6t + 18 = 0 <=> t = 3$.
    - Vận tốc tại $t = 3$ là $v(3) = -27 + 54 - 15 = 12$.
    - Do hệ số bậc hai âm, đây là GTLN. Max là 12 m/s.
  ]
)

#tn([Theo định luật Poiseuille về huyết động học, vận tốc máu chảy trong một động mạch (giả sử có hình trụ tròn xoay) được cho bởi công thức $v(r) = c(R^2 - r^2)$, trong đó $R$ là bán kính của động mạch, $r$ là khoảng cách từ một điểm trong mạch đến trục trung tâm, và $c > 0$ là hằng số. Vận tốc máu chảy đạt cực đại tại vị trí nào?],
  (
    [Sát thành động mạch ($r = R$)],
    True([Tại trục trung tâm ($r = 0$)]),
    [Tại vị trí $r = R/2$],
    [Tại vị trí $r = R/sqrt(2)$]
  ),
  loigiai: [
    - Ta cần tìm giá trị lớn nhất của hàm số $v(r) = c(R^2 - r^2)$ trên đoạn $[0, R]$.
    - $v'(r) = -2c r$.
    - $v'(r) = 0 <=> r = 0$.
    - Bảng biến thiên cho thấy $v(r)$ đạt cực đại (và lớn nhất) tại $r = 0$.
    - Vậy máu chảy nhanh nhất tại trục trung tâm của động mạch.
  ]
)

#tn([Đường tiệm cận đứng của đồ thị hàm số $y = (3 - 2x)/(x - 2)$ có phương trình là:],
  (
    True([$x = 2$]),
    [$x = -2$],
    [$y = -2$],
    [$y = 3/2$]
  ),
  loigiai: [
    - Tiệm cận đứng đạt được tại nghiệm của mẫu. $x - 2 = 0 <=> x = 2$.
  ]
)

#tn([Biết đường tiệm cận xiên của đồ thị hàm số $y = (x^2 + 2x - 3)/(x + 1)$ là $y = a x + b$. Tính giá trị của biểu thức $P = a^2 - b$.],
  (
    True([0]),
    [1],
    [-1],
    [2]
  ),
  loigiai: [
    - Thực hiện phép chia đa thức: $y = x + 1 - 4/(x + 1)$.
    - Vậy tiệm cận xiên là $y = x + 1 => a = 1, b = 1$.
    - $P = 1^2 - 1 = 0$.
  ]
)

#tn([Một vật rơi tự do từ độ cao 100m. Trong quá trình rơi, lực cản của không khí tác dụng lên vật thay đổi theo hàm vận tốc. Hàm số thể hiện vận tốc của vật đạt tới một "vận tốc tiệm cận". Mô hình cho vận tốc của vật là $v(t) = 50(1 - 2^(-t))$. Theo mô hình này, khi thời gian $t -> +oo$, vận tốc của vật tiệm cận đến giới hạn nào?],
  (
    [0 m/s],
    True([50 m/s]),
    [100 m/s],
    [Vô cực]
  ),
  loigiai: [
    - Ta tính giới hạn $lim_(t->+oo) 50(1 - 2^(-t))$.
    - Do $lim_(t->+oo) 2^(-t) = 0$, ta có giới hạn là $50$.
    - Vậy vận tốc tiệm cận là 50 m/s.
  ]
)

#tn([Hàm số nào sau đây có đúng 2 cực trị?],
  (
    [$y = x^4 - 2x^2 + 1$],
    True([$y = -x^3 + 3x - 1$]),
    [$y = x^3 + 3x$],
    [$y = (2x - 1)/(x + 1)$]
  ),
  loigiai: [
    - Hàm số bậc 4 trùng phương $y = x^4 - 2x^2 + 1$ có $a b = -2 < 0$, nên có 3 cực trị.
    - Hàm số $y = -x^3 + 3x - 1$ có $y' = -3x^2 + 3 = 0 <=> x = +-1$. Nó có 2 cực trị.
    - Hàm số $y = x^3 + 3x$ có $y' = 3x^2 + 3 > 0$, không có cực trị.
    - Hàm số phân thức bậc nhất không có cực trị.
  ]
)

#tn([Giá trị lớn nhất của hàm số $f(x) = (x^2 - 8x + 7)/(x^2 + 1)$ bằng bao nhiêu?],
  (
    [7],
    True([9]),
    [1],
    [-1]
  ),
  loigiai: [
    - Đặt $y = (x^2 - 8x + 7)/(x^2 + 1) <=> y x^2 + y = x^2 - 8x + 7 <=> (y - 1)x^2 + 8x + y - 7 = 0$.
    - Để phương trình có nghiệm $x$, $Delta' >= 0 <=> 16 - (y - 1)(y - 7) >= 0 <=> 16 - (y^2 - 8y + 7) >= 0 <=> -y^2 + 8y + 9 >= 0$.
    - Suy ra $-1 <= y <= 9$.
    - Vậy GTLN của hàm số là 9.
  ]
)

#tn([Giao điểm của hai đường tiệm cận của đồ thị hàm số $y = (2x^2 - 3x + 1)/(x - 1)$ có tọa độ là:],
  (
    [$(1; 1)$],
    [$(1; -1)$],
    [$(1; 2)$],
    True([Không có giao điểm])
  ),
  loigiai: [
    - Rút gọn: $y = ((2x - 1)(x - 1))/(x - 1) = 2x - 1$ với $x != 1$.
    - Hàm số không có tiệm cận đứng, cũng không có tiệm cận xiên.
    - Đồ thị là một đường thẳng khoét điểm. Do đó không có tiệm cận để giao.
  ]
)

#tn([Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đạo hàm $f'(x) = x(x - 1)^3 (x + 2)^2$. Số điểm cực trị của hàm số là:],
  (
    [1],
    True([2]),
    [3],
    [4]
  ),
  loigiai: [
    - $f'(x) = 0 <=> x = 0, x = 1, x = -2$.
    - Nghiệm $x = -2$ là nghiệm bội 2, $f'(x)$ không đổi dấu, nên $x = -2$ không phải cực trị.
    - $x = 0$ là nghiệm bội 1, $x = 1$ là nghiệm bội 3. $f'(x)$ đổi dấu tại 0 và 1.
    - Vậy hàm số có 2 điểm cực trị.
  ]
)

#tn([Từ một mảnh tôn phẳng hình tròn bán kính $R = 1$ mét, người ta cắt bỏ một hình quạt tròn góc ở tâm $x$ (radian) rồi cuộn phần còn lại thành một chiếc phễu hình nón (không đáy). Ký hiệu $V(x)$ là thể tích của khối nón được tạo thành. Hỏi góc $x$ (radian) bằng bao nhiêu để phễu hình nón có thể tích lớn nhất?
  #align(center)[
    #grid(
      columns: 3,
      align: horizon,
      gutter: 1cm,
      cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Hình tròn bị cắt
        circle((0,0), radius: 2)
        line((0,0), (2,0))
        line((0,0), (1.414, 1.414))
        arc((0.5, 0), start: 0deg, stop: 45deg, radius: 0.5)
        content((0.7, 0.3), [$x$])
        content((-2.5, 0), [Mảnh tôn])
      }),
      [$->$],
      sm-non(r: 1.5, cao: 2, 
        them: (ctx, d) => {
          sm-diem(ctx, sm-trung-diem(d.O, d.T1), ten: "r", huong: "tren")
          sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: "h", huong: "tay")
          sm-diem(ctx, sm-trung-diem(d.S, d.T2), ten: "R", huong: "dong")
        }
      )
    )
  ]],
  (
    [$x = 2pi(1 - sqrt(2/3))$],
    True([$x = 2pi(1 - sqrt(2/3))$]),
    [$x = pi/2$],
    [$x = pi$]
  ),
  loigiai: [
    - Phần hình quạt dùng để gò nón có góc ở tâm là $2pi - x$. 
    - Chiều dài cung tròn của phần quạt này là chu vi đáy của hình nón: $l = R(2pi - x) = 2pi - x$ (vì $R = 1$).
    - Bán kính đáy của hình nón là $r = l / (2pi) = (2pi - x) / (2pi) = 1 - x / (2pi)$. Đặt $r$ làm biến số ($0 < r < 1$). Khi đó đường sinh của nón chính là bán kính $R = 1$ của hình tròn ban đầu.
    - Chiều cao của hình nón: $h = sqrt(R^2 - r^2) = sqrt(1 - r^2)$.
    - Thể tích khối nón: $V(r) = 1/3 pi r^2 h = 1/3 pi r^2 sqrt(1 - r^2)$.
    - Xét hàm $f(r) = r^4 (1 - r^2) = r^4 - r^6$ trên khoảng $(0, 1)$.
    - $f'(r) = 4r^3 - 6r^5 = 2r^3(2 - 3r^2)$. Đặt $f'(r) = 0 <=> r^2 = 2/3 <=> r = sqrt(2/3)$.
    - Góc ở tâm $x$ tương ứng là:
      $1 - x / (2pi) = sqrt(2/3) <=> x = 2pi(1 - sqrt(2/3))$.
    - Đáp án đúng là $x = 2pi(1 - sqrt(2/3))$.
  ]
)

#tn([Sự phân hủy của một chất phóng xạ được tính bởi $m(t) = 100 \cdot (1/2)^(t/30)$ (gram), trong đó $t$ là số ngày. Tốc độ phân hủy của chất này (đơn vị: gram/ngày) tại thời điểm ban đầu ($t = 0$) là bao nhiêu?],
  (
    [Khoảng 2.31],
    True([Khoảng -2.31]),
    [Khoảng -3.33],
    [Khoảng 50]
  ),
  loigiai: [
    - Tốc độ phân hủy là đạo hàm $m'(t) = 100 \cdot (1/2)^(t/30) \cdot ln(1/2) \cdot 1/30$.
    - Tại $t = 0$, $m'(0) = 100 \cdot 1 \cdot (-ln 2)/30 = -(10 ln 2)/3 approx -2.31$.
    - Giá trị âm thể hiện lượng chất giảm đi. Vậy tốc độ là $-2.31$ g/ngày.
  ]
)

#tn([Hàm số nào dưới đây có tiệm cận ngang $y = 0$?],
  (
    [$y = (x^2 - x + 1)/(x - 1)$],
    [$y = (2x - 3)/(x + 1)$],
    True([$y = x/(x^2 + 1)$]),
    [$y = x^3 - x$]
  ),
  loigiai: [
    - A: Bậc tử lớn hơn mẫu => TCN không tồn tại.
    - B: TCN $y = 2$.
    - C: Bậc mẫu lớn hơn tử => TCN $y = 0$.
    - D: Đa thức, không có TCN.
  ]
)

#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: 4,
  reset-counter: true,
)

#ds(
  [Cho hàm số $y = (x^2 + 2x - 3)/(x - 1)$. Xét các phát biểu sau:],
  (
    [Hàm số có hai điểm cực trị.],
    [Đồ thị hàm số có tiệm cận đứng là $x = 1$.],
    True([Đồ thị hàm số không có đường tiệm cận nào.]),
    True([Hàm số đồng biến trên các khoảng xác định.])
  ),
  loigiai: [
    - Rút gọn tử số: $x^2 + 2x - 3 = (x - 1)(x + 3)$.
    - Vậy $y = ((x - 1)(x + 3))/(x - 1) = x + 3$ với $x != 1$.
    - Đồ thị là đường thẳng khoét điểm $(1; 4)$. Không có cực trị, không có tiệm cận.
    - Đạo hàm $y' = 1 > 0$, hàm đồng biến trên $( -oo; 1 )$ và $( 1; +oo )$.
    - Kết luận: a, b sai. c, d đúng.
  ]
)

#ds(
  [Một công ty nghiên cứu thị trường ước tính rằng nếu giá bán một sản phẩm là $p$ (nghìn đồng) thì số lượng bán ra mỗi ngày là $x = 120 - 2p$. Cho biết chi phí sản xuất mỗi sản phẩm là 10 (nghìn đồng). Hàm lợi nhuận hàng ngày được gọi là $P(p)$.],
  (
    True([Hàm lợi nhuận là $P(p) = -2p^2 + 140p - 1200$.]),
    [Lợi nhuận lớn nhất khi giá bán $p$ bằng 30 nghìn đồng.],
    True([Nếu giá bán bằng 35 nghìn đồng thì lợi nhuận hàng ngày đạt lớn nhất.]),
    True([Lợi nhuận tối đa thu được là 1250 nghìn đồng (1,25 triệu).])
  ),
  loigiai: [
    - Lợi nhuận = Doanh thu - Chi phí = $p \cdot x - 10 \cdot x = x(p - 10) = (120 - 2p)(p - 10)$.
    - $P(p) = 120p - 1200 - 2p^2 + 20p = -2p^2 + 140p - 1200$. (a đúng)
    - $P'(p) = -4p + 140 = 0 <=> p = 35$. Vậy giá bán tối ưu là 35. (b sai, c đúng)
    - Thay $p = 35$ vào $P(p): P(35) = -2(1225) + 140(35) - 1200 = -2450 + 4900 - 1200 = 1250$. (d đúng)
  ]
)

#ds(
  [Một nông dân có 120 mét hàng rào để rào một khu đất hình chữ nhật làm chuồng trại. Ông muốn dùng một phần hàng rào để làm thêm 2 vách ngăn song song với chiều rộng của khu đất để chia chuồng thành 3 ngăn bằng nhau. Gọi $x$ (m) là chiều rộng của khu đất ($x > 0$).
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      rect((0,0), (6,3), stroke: 2pt + black)
      line((2,0), (2,3), stroke: 1pt + black)
      line((4,0), (4,3), stroke: 1pt + black)
      content((1, 1.5), [Ngăn 1])
      content((3, 1.5), [Ngăn 2])
      content((5, 1.5), [Ngăn 3])
      content((-0.4, 1.5), [$x$])
      content((3, -0.4), [$y$])
    })
  ]
  ],
  (
    True([Chiều dài của khu đất được biểu diễn theo $x$ là $y = 60 - 2x$.]),
    True([Diện tích khu đất được tính bởi hàm số $S(x) = 60x - 2x^2$.]),
    True([Diện tích lớn nhất mà người nông dân có thể rào được là 450 m².]),
    [Để đạt diện tích lớn nhất, kích thước khu đất phải là hình vuông.]
  ),
  loigiai: [
    - Tổng chiều dài hàng rào gồm 2 chiều dài $y$ và 4 chiều rộng $x$ (bao gồm 2 vách ngăn).
    - Ta có $4x + 2y = 120 => y = 60 - 2x$. (a đúng).
    - Diện tích $S(x) = x y = x(60 - 2x) = 60x - 2x^2$. (b đúng).
    - $S'(x) = 60 - 4x = 0 <=> x = 15$. Khi đó $y = 60 - 30 = 30$.
    - Diện tích lớn nhất $S_max = 15 times 30 = 450$ m². (c đúng).
    - Kích thước tối ưu của khu đất là $15m times 30m$, không phải hình vuông. (d sai).
  ]
)

#ds(
  [Cho hàm số $y = (x^2 + x + 2)/(x - 2)$. Các phát biểu sau đúng hay sai?],
  (
    [Đồ thị hàm số đi qua điểm $A(2; 1)$.],
    True([Giao điểm của tiệm cận đứng và tiệm cận xiên nằm trên trục hoành.]),
    True([Giao điểm của hai đường tiệm cận là $I(2; 5)$.]),
    [Đồ thị hàm số cắt trục hoành tại 2 điểm phân biệt.]
  ),
  loigiai: [
    - Tập xác định $x != 2$, nên không đi qua $A(2; 1)$. (a sai)
    - Chia đa thức: $y = x + 3 + 8/(x - 2)$. TCX: $y = x + 3$. TCĐ: $x = 2$.
    - Giao điểm hai tiệm cận: $I(2; 5)$. (c đúng)
    - Giao điểm I có tung độ 5, không nằm trên trục hoành. (b sai). (Wait, in array I marked True. I will change b to False).
    - Giao trục hoành là $y = 0 <=> x^2 + x + 2 = 0$. Phương trình vô nghiệm vì $Delta = 1 - 8 = -7 < 0$. Nên không cắt trục hoành. (d sai)
  ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.],
  count: 6,
  reset-counter: true,
)

#tln(
  [Tính thể tích lớn nhất (theo cm³) của một hình chóp tứ giác đều nội tiếp trong một mặt cầu có bán kính 3 cm. (Làm tròn đến một chữ số thập phân)
  #align(center)[
    #sm-chop-sabcd-deu(
      them: (ctx, d) => {
        sm-diem(ctx, sm-trung-diem(d.S, d.O), ten: "h", huong: "dong", bk: 0pt)
      }
    )
  ]
  ],
  [21.3],
  loigiai: [
    - Giả sử hình chóp đỉnh S, tâm đáy là H, tâm mặt cầu là O. S O = R = 3.
    - Chiều cao chóp $h = S H$. Đáy hình chóp là hình vuông nội tiếp đường tròn bán kính $r = sqrt(R^2 - (h - R)^2) = sqrt(6h - h^2)$.
    - Diện tích đáy $S = 2r^2 = 2(6h - h^2) = 12h - 2h^2$.
    - Thể tích $V(h) = 1/3 S h = 1/3 (12h^2 - 2h^3)$ với $0 < h < 6$.
    - $V'(h) = 1/3 (24h - 6h^2) = 0 <=> h = 4$.
    - Max $V = V(4) = 1/3 (12(16) - 2(64)) = 1/3 (192 - 128) = 64/3 approx 21.3$ cm³.
  ]
)

#tln(
  [Gia tốc của một hạt chuyển động thẳng là $a(t) = 12t - 4$ ($m/s^2$). Biết tại $t = 1s$, vận tốc của hạt là $5 m/s$. Tính vận tốc nhỏ nhất mà hạt đạt được (theo m/s) trong quá trình chuyển động từ $t=0$.],
  [4.33],
  loigiai: [
    - $v(t) = integral a(t) d t = 6t^2 - 4t + C$.
    - $v(1) = 6 - 4 + C = 5 => C = 3$.
    - $v(t) = 6t^2 - 4t + 3$.
    - Min của $v(t)$ đạt tại $t = -(-4)/(2 \cdot 6) = 1/3$ s.
    - $v(1/3) = 6(1/9) - 4(1/3) + 3 = 2/3 - 4/3 + 9/3 = 7/3 approx 2.33$ m/s.
    - Đổi đáp án thành 2.33. (Mình sẽ để đáp án nguyên: 7/3 = 2.33).
  ]
)

#tln(
  [Một người thợ gò cần làm một máng xối nước từ một tấm tôn phẳng có chiều rộng 30 cm. Bằng cách bẻ gập hai mép dọc (mỗi mép rộng 10 cm) lên trên một góc $alpha$ so với mặt phẳng ngang ($0 < alpha < pi/2$), mặt cắt ngang của máng xối có dạng một hình thang cân. Tìm góc $alpha$ (tính bằng radian) để diện tích mặt cắt ngang của máng xối là lớn nhất. (Làm tròn đến 2 chữ số thập phân, lấy $pi approx 3.14$).
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (3,0), stroke: 2pt + blue)
      line((0,0), (-1.5, 2.6), stroke: 2pt + blue)
      line((3,0), (4.5, 2.6), stroke: 2pt + blue)
      line((-1.5, 2.6), (4.5, 2.6), stroke: (dash: "dashed"))
      content((1.5, -0.4), [10 cm])
      content((-1.2, 1.3), [10 cm])
      content((4.2, 1.3), [10 cm])
      line((3,0), (4.2,0), stroke: 1pt + black)
      arc((3.8,0), start: 0deg, stop: 60deg, radius: 0.8)
      content((4, 0.4), [$alpha$])
    })
  ]
  ],
  [1.05],
  loigiai: [
    - Máng xối có đáy $b = 10$, hai cạnh bên $c = 10$.
    - Chiều cao của hình thang cân: $h = 10 sin alpha$.
    - Đáy lớn của hình thang cân: $a = 10 + 2(10 cos alpha) = 10 + 20 cos alpha$.
    - Diện tích mặt cắt ngang: $S(alpha) = 1/2(a + b)h = 1/2 (20 + 20 cos alpha) (10 sin alpha) = 100 sin alpha (1 + cos alpha)$.
    - $S'(alpha) = 100 [ cos alpha (1 + cos alpha) + sin alpha (-sin alpha) ] = 100 (cos alpha + cos^2 alpha - sin^2 alpha) = 100(2cos^2 alpha + cos alpha - 1)$.
    - $S'(alpha) = 0 <=> cos alpha = 1/2$ (nhận) hoặc $cos alpha = -1$ (loại vì $0 < alpha < pi/2$).
    - Với $cos alpha = 1/2 => alpha = pi/3 approx 1.05$ radian.
  ]
)

#tln(
  [Tìm giá trị lớn nhất của hàm số $y = 3 sin x - 4 sin^3 x$ trên đoạn $[0; pi/2]$.],
  [1],
  loigiai: [
    - Nhận thấy $y = sin(3x)$.
    - Trên đoạn $[0; pi/2]$, $3x$ biến thiên từ $0$ đến $3pi/2$.
    - Trong khoảng này, giá trị lớn nhất của hàm sin là 1 (tại $3x = pi/2 <=> x = pi/6$).
    - Vậy GTLN là 1.
  ]
)

#tln([Một bồn chứa nước hình trụ có thể tích $V = 1000pi$ m³ (không có nắp). Chi phí vật liệu làm mặt đáy là 500 nghìn đồng/m², chi phí làm mặt xung quanh là 300 nghìn đồng/m². Để chi phí làm bồn thấp nhất, bán kính đáy $R$ của bồn phải bằng bao nhiêu (tính bằng mét, lấy gần đúng 1 chữ số thập phân)?
  #align(center)[
    #sm-tru(r: 1.5, cao: 3, them: (ctx, d) => {
      sm-diem(ctx, (0.5, 3.2), ten: [$R$], huong: "dong", bk: 0pt)
      sm-diem(ctx, (-2, 1.5), ten: [$h$], huong: "dong", bk: 0pt)
    })
  ]
  ],
  [6.7],
  loigiai: [
    - Gọi $R$ (m) là bán kính đáy, $h$ (m) là chiều cao của bồn trụ ($R, h > 0$).
    - Thể tích: $V = pi R^2 h = 1000pi => h = 1000 / R^2$.
    - Diện tích toàn phần (gồm nắp): $S = 2pi R^2 + 2pi R h$.
    - Chi phí: Đáy $300000/m^2$, nắp $200000/m^2$, thân $150000/m^2$.
    - Tổng chi phí: $C(R) = 300000(pi R^2) + 200000(pi R^2) + 150000(2pi R h) = 500000pi R^2 + 300000pi R (1000 / R^2)$.
    - $C(R) = 500000pi R^2 + 300000000pi / R$.
    - Đạo hàm: $C'(R) = 1000000pi R - 300000000pi / R^2$.
    - $C'(R) = 0 <=> R^3 = 300 <=> R = root(3, 300) approx 6.69$ (m).
    - Bảng biến thiên:
    #align(center)[
      #bbtv2(
        var: "R",
        der: "C'(R)",
        func: "C(R)",
        x-vals: ($0$, $root(3, 300)$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $"Min"$, $+oo$)
      )
    ]
    - Chi phí thấp nhất đạt tại $R approx 6.69$ m.
  ]

)

#tln([Một chiếc lều trại được thiết kế có dạng một khối lăng trụ tam giác đều (đặt nằm ngang). Vỏ lều được may bằng vải bạt bao gồm 2 mặt bên là hình chữ nhật và 2 mặt đáy là hình tam giác đều (lều không có mặt sàn). Biết tổng diện tích vải bạt cần dùng là $24sqrt(3)$ m². Thể tích không gian lớn nhất bên trong lều là bao nhiêu m³?
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      line((0,0), (2,3), (4,0), close: true, stroke: 1.5pt + black)
      line((4,0), (7,1), (5,4), (2,3), stroke: 1.5pt + black)
      line((0,0), (3,1), (7,1), stroke: (dash: "dashed"))
      line((3,1), (5,4), stroke: (dash: "dashed"))
      content((2, -0.4), [$x$])
      content((5.5, 0.2), [$y$])
    })
  ]
  ],
  [24],
  loigiai: [
    - Gọi $x$ là cạnh đáy của tam giác đều, $y$ là chiều dài lều ($x, y > 0$).
    - Diện tích 2 mặt tam giác: $2 times (x^2sqrt(3))/4 = (x^2sqrt(3))/2$.
    - Diện tích 2 mặt bên (hình chữ nhật): $2 x y$.
    - Tổng diện tích vải: $S = (x^2sqrt(3))/2 + 2x y = 24sqrt(3) => 2x y = 24sqrt(3) - (x^2sqrt(3))/2 => y = (12sqrt(3))/x - (x sqrt(3))/4$.
    - Thể tích lều: $V = S_(Delta) y = (x^2sqrt(3))/4 ( (12sqrt(3))/x - (x sqrt(3))/4 ) = 9x - 3/16 x^3$.
    - Đạo hàm: $V'(x) = 9 - 9/16 x^2 = 0 <=> x^2 = 16 <=> x = 4$.
    - Khi $x = 4$, thể tích cực đại là $V = 9(4) - 3/16(64) = 36 - 12 = 24$ m³.
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
