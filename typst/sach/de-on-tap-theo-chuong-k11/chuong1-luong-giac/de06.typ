#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.equation.where(block: true): it => math.display(it.body)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 1",
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 06)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Khi nghiên cứu về âm thanh, một nốt nhạc cơ bản có phương trình sóng âm dạng $p(t) = P_0 sin(2pi f t)$. Giá trị cực đại của áp suất $P_0$ thể hiện đặc trưng nào của âm thanh?],
    (
        True([Độ to của âm thanh (âm lượng).]),
        [Độ cao của âm thanh (cao độ).],
        [Chu kì của sóng âm.],
        [Bước sóng của âm thanh.]
    ),
    loigiai: [
        Trong vật lý âm thanh, biên độ dao động $P_0$ (giá trị cực đại của áp suất) quyết định năng lượng của sóng âm, từ đó quyết định độ to (âm lượng) của âm thanh.
    ]
)

// TN 2
#tn([Một vòng quay Mặt Trời (Ferris wheel) có cabin xuất phát từ vị trí thấp nhất. Hàm số $h(t) = 20 - 18 cos(pi/10 t)$ mô phỏng độ cao của cabin theo thời gian $t$ (phút). Bán kính của vòng quay là bao nhiêu?],
    (
        [$20$ m],
        True([$18$ m]),
        [$2$ m],
        [$38$ m]
    ),
    loigiai: [
        Hàm số độ cao có biên độ là $18$. Biên độ này chính là bán kính của vòng quay Mặt Trời (vì khoảng cách từ tâm quay đến cabin là không đổi). Vậy bán kính là $18$ m.
    ]
)

// TN 3
#tn([Điện áp của một mạng điện xoay chiều gia đình ở Việt Nam có tần số $f = 50$ Hz. Chu kì biến thiên của điện áp này là],
    (
        [$50$ s],
        [$20$ s],
        True([$0.02$ s]),
        [$0.05$ s]
    ),
    loigiai: [
        Chu kì được tính bằng công thức $T = 1/f = 1/50 = 0.02$ (giây).
    ]
)

// TN 4
#tn([Góc ngẩng của một vệ tinh viễn thông so với một trạm mặt đất thay đổi và tuân theo một hàm số tuần hoàn. Khoảng thời gian giữa hai lần liên tiếp vệ tinh đạt góc ngẩng lớn nhất chính là],
    (
        [Biên độ của hàm số.],
        True([Chu kì của hàm số.]),
        [Tần số của hàm số.],
        [Pha ban đầu của hàm số.]
    ),
    loigiai: [
        Khoảng thời gian ngắn nhất để một trạng thái dao động (ở đây là góc ngẩng lớn nhất) lặp lại y hệt như cũ được định nghĩa là *chu kì* của hàm số.
    ]
)

// TN 5
#tn([Để tối ưu hóa năng lượng mặt trời, một tấm pin được thiết kế quay tự động theo góc tới của tia sáng $alpha(t) = pi/4 sin((pi t)/12)$, với $t$ là giờ trong ngày. Góc lệch lớn nhất của tấm pin so với phương ngang là],
    (
        [$pi/2$ rad],
        [$pi/3$ rad],
        True([$pi/4$ rad]),
        [$pi/12$ rad]
    ),
    loigiai: [
        Biên độ của hàm số $alpha(t)$ là $pi/4$. Do đó, góc lệch lớn nhất chính là $pi/4$ radian.
    ]
)

// TN 6
#tn([Một chiếc cầu treo bị rung lắc nhẹ do gió với biên độ $A$. Nếu dùng hàm số lượng giác $y = A sin(omega t)$ để mô phỏng li độ của cầu, khi cầu ở trạng thái tĩnh (không rung), giá trị của $y$ là],
    (
        True([$0$]),
        [$A$],
        [$-A$],
        [$1$]
    ),
    loigiai: [
        Trạng thái tĩnh ứng với vị trí cân bằng, tức là li độ $y = 0$.
    ]
)

// TN 7
#tn([Số lượng sản phẩm bán ra của một công ty may mặc đồ mùa đông được mô hình hóa bởi $S(t) = 5000 + 3000 cos((pi)/6 (t - 1))$, $t$ là các tháng trong năm ($t=1,2,...,12$). Tháng nào công ty bán được nhiều sản phẩm nhất?],
    (
        True([Tháng $1$]),
        [Tháng $6$],
        [Tháng $7$],
        [Tháng $12$]
    ),
    loigiai: [
        Sản lượng lớn nhất khi $cos((pi)/6 (t - 1)) = 1 <=> (pi)/6 (t - 1) = k 2pi <=> t - 1 = 12k <=> t = 1 + 12k$.
        Trong năm, với $k=0$, ta có $t = 1$ (tháng 1).
    ]
)

// TN 8
#tn([Một piston trong động cơ đốt trong di chuyển dọc theo xi lanh với li độ $x = 4 cos(60pi t)$ (cm). Quãng đường di chuyển của piston từ vị trí cực tiểu đến cực đại là],
    (
        [$4$ cm],
        True([$8$ cm]),
        [$12$ cm],
        [$16$ cm]
    ),
    loigiai: [
        Piston dao động giữa biên âm ($-4$ cm) và biên dương ($4$ cm).
        Quãng đường từ cực tiểu đến cực đại là khoảng cách giữa 2 biên, bằng $2A = 2 dot 4 = 8$ (cm).
    ]
)

// TN 9
#tn([Trong ngành cơ điện tử, để phân tích dao động của một cánh tay robot, kỹ sư giải phương trình $cos(x - pi/4) = sqrt(2)/2$. Tập nghiệm của phương trình này là],
    (
        True([$x = k 2pi, x = pi/2 + k 2pi, k in ZZ$]),
        [$x = pi/4 + k 2pi, x = 3pi/4 + k 2pi, k in ZZ$],
        [$x = k pi, x = pi/2 + k pi, k in ZZ$],
        [$x = pi/2 + k 2pi, x = -pi/2 + k 2pi, k in ZZ$]
    ),
    loigiai: [
        Ta có $sqrt(2)/2 = cos(pi/4)$. Phương trình trở thành:
        $
          cos(x - pi/4) = cos(pi/4) <=> x - pi/4 = pi/4 + k 2pi " hoặc " x - pi/4 = -pi/4 + k 2pi
        $
        $
          <=> x = pi/2 + k 2pi " hoặc " x = k 2pi, k in ZZ
        $
    ]
)

// TN 10
#tn([Sức tải của một cây cầu vượt biến thiên theo hàm số $F(t) = 150 + 50 cos((pi t)/4)$, $t$ là thời gian. Phương trình $F(t) = 100$ có ý nghĩa thực tế nào sau đây?],
    (
        [Tìm thời điểm sức tải lớn nhất.],
        [Tìm thời điểm sức tải nhỏ nhất.],
        True([Tìm thời điểm sức tải đạt $100$ đơn vị.]),
        [Tìm giá trị trung bình của sức tải.]
    ),
    loigiai: [
        $F(t)$ là sức tải của cầu tại thời điểm $t$. Việc giải $F(t) = 100$ chính là tìm các thời điểm $t$ mà lúc đó sức tải đạt đúng $100$ đơn vị.
    ]
)

// TN 11
#tn([Vị trí của một đầu van bánh xe đạp có phương trình $y = 35 + 35 cos(4pi t)$ (cm). Tâm của bánh xe cách mặt đất một khoảng bao nhiêu?],
    (
        [$70$ cm],
        True([$35$ cm]),
        [$0$ cm],
        [$140$ cm]
    ),
    loigiai: [
        Hàm số $y(t) = 35 + 35 cos(4pi t)$ dao động từ $0$ cm (van tiếp đất) đến $70$ cm (đỉnh).
        Vị trí trung bình là $35$ cm, đây cũng chính là khoảng cách từ tâm trục bánh xe đến mặt đất.
    ]
)

// TN 12
#tn([Mực nước $h$ tại một con kênh thay đổi theo phương trình $h = 2 sin(x)$. Nếu thay đổi pha ban đầu của dao động, đại lượng nào sau đây thay đổi?],
    (
        [Độ sâu lớn nhất.],
        [Độ sâu nhỏ nhất.],
        [Chu kì dao động của thủy triều.],
        True([Thời điểm mực nước đạt cực đại.])
    ),
    loigiai: [
        Pha ban đầu thay đổi chỉ làm dịch chuyển đồ thị theo trục hoành (thời gian), do đó nó sẽ làm thay đổi *thời điểm* mực nước đạt cực đại, không làm thay đổi các giá trị cực đại, cực tiểu hay chu kì.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds(
    [Doanh thu hàng tháng của một công ty sản xuất kem nhiệt đới (tính bằng triệu VNĐ) biến động theo mô hình $R(t) = 800 + 400 sin((pi t)/6 - pi/2)$, trong đó $t$ là các tháng trong năm ($t = 1, 2, ..., 12$). Các phát biểu sau đúng hay sai?], (
        True([Doanh thu trung bình mỗi tháng của công ty là $800$ triệu VNĐ.]),
        [Doanh thu cao nhất của công ty đạt được vào tháng 12.],
        True([Trong các tháng hè (tháng 6, 7, 8), doanh thu luôn lớn hơn hoặc bằng $1000$ triệu VNĐ.]),
        True([Có đúng $2$ tháng trong năm doanh thu đạt đúng $600$ triệu VNĐ.])
    ), 
    loigiai: [
        - *a)* Đúng. Hệ số tự do trong mô hình dao động điều hòa $R(t)$ là $800$, thể hiện giá trị trung bình của hàm số. Doanh thu trung bình là $800$ triệu VNĐ.
        - *b)* Sai. Doanh thu cao nhất khi:
        $
          sin((pi t)/6 - pi/2) = 1 <=> (pi t)/6 - pi/2 = pi/2 + k 2pi <=> (pi t)/6 = pi + k 2pi <=> t = 6 + 12k
        $
        Với $t in [1; 12]$, ứng với $k=0$ ta có $t=6$. Vậy doanh thu cao nhất vào tháng 6, không phải tháng 12.
        - *c)* Đúng. Xét tháng 6: $R(6) = 800 + 400 sin(pi - pi/2) = 800 + 400 = 1200 > 1000$.
        Tháng 7: $R(7) = 800 + 400 sin((7pi)/6 - pi/2) = 800 + 400 sin((2pi)/3) = 800 + 400 dot (sqrt(3))/2 approx 1146.4 > 1000$.
        Tháng 8: $R(8) = 800 + 400 sin((8pi)/6 - pi/2) = 800 + 400 sin((5pi)/6) = 800 + 400 dot 1/2 = 1000$.
        Vì $R(6) = 1200$, $R(7) = 1146.4$, $R(8) = 1000$, nên doanh thu các tháng này đều $>= 1000$ triệu VNĐ.
        - *d)* Đúng. Giải phương trình $R(t) = 600$:
        $
          800 + 400 sin((pi t)/6 - pi/2) = 600 <=> sin((pi t)/6 - pi/2) = -1/2
        $
        $
          <=> (pi t)/6 - pi/2 = -pi/6 + k 2pi " hoặc " (pi t)/6 - pi/2 = (7pi)/6 + k 2pi
        $
        $
          <=> (pi t)/6 = pi/3 + k 2pi " hoặc " (pi t)/6 = (5pi)/3 + k 2pi
        $
        $
          <=> t = 2 + 12k " hoặc " t = 10 + 12k
        $
        Trong 12 tháng, có đúng $2$ tháng là tháng $2$ và tháng $10$.
    ]
)

// DS 2
#ds(
    [Đồ thị sau biểu diễn mức biến động âm lượng $V$ (decibel) của một chiếc còi báo động theo thời gian $t$ (giây). 
#align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Scale: x = t * 2, y = (V - 60) * 0.1
      grid((0, 0), (8, 6), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
      line((0, 0), (8.5, 0), mark: (end: ">"), stroke: 1.5pt)
      line((0, 0), (0, 6.5), mark: (end: ">"), stroke: 1.5pt)
      content((8.3, -0.4), [$t$ (s)])
      content((-0.8, 6.3), [$V$ (dB)])
      
      for i in (1, 2, 3, 4) {
        let xc = i * 2
        line((xc, -0.1), (xc, 0.1))
        content((xc, -0.4), str(i))
      }
      for i in (70, 90, 110) {
        let yc = (i - 60) * 0.1
        line((-0.1, yc), (0.1, yc))
        content((-0.6, yc), str(i))
      }
      
      let pts = range(0, 401).map(i => {
        let t_val = i / 100
        let v_val = 90 + 20 * calc.sin(360deg * t_val / 2)
        (t_val * 2, (v_val - 60) * 0.1)
      })
      line(..pts, stroke: 1.5pt + red)
    })
]
    Dựa vào đồ thị trên, các phát biểu sau đúng hay sai?], (
        True([Biên độ biến thiên âm lượng là $20$ dB.]),
        True([Chu kì của còi báo động là $2$ giây.]),
        [Phương trình mô phỏng là $V(t) = 90 + 20 cos(pi t)$.],
        True([Âm lượng của còi đạt lớn nhất lần đầu tiên tại $t = 0.5$ giây.])
    ), 
    loigiai: [
        - *a)* Đúng. Đồ thị dao động giữa mức cực tiểu $70$ và cực đại $110$.
        Giá trị trung bình là $(110+70)/2 = 90$. Biên độ $A = 110 - 90 = 20$ dB.
        - *b)* Đúng. Đồ thị đi từ giá trị trung bình (đi lên) tại $t=0$, đạt đỉnh, xuống cực tiểu và lặp lại chu kỳ hoàn chỉnh đầu tiên tại $t=2$. Vậy chu kì $T = 2$ giây.
        - *c)* Sai. Tại $t=0$, đồ thị bắt đầu từ giá trị trung bình $V = 90$ và đi lên. Do đó hàm số phải mang dạng chuẩn của sin (không có pha ban đầu), tức là $V(t) = 90 + 20 sin(pi t)$.
        Nếu dùng cos thì phải là $V(t) = 90 + 20 cos(pi t - pi/2)$.
        - *d)* Đúng. Âm lượng đạt lớn nhất (đỉnh) lần đầu tiên tại $t = 0.5$ giây (khi $V=110$).
    ]
)

// DS 3
#ds(
    [Trong hệ thống truyền tải điện, để giảm hao phí, kỹ sư sử dụng hai nguồn điện xoay chiều có cùng biên độ $U_0 = 100$ V, cùng tần số $50$ Hz nhưng lệch pha nhau $pi/3$. Tổng hợp của hai điện áp này là $u(t) = u_1(t) + u_2(t)$. Biết $u_1(t) = 100 cos(100pi t)$ và $u_2(t) = 100 cos(100pi t - pi/3)$. Các phát biểu sau đúng hay sai?], (
        [Hai điện áp này cùng đạt giá trị $0$ tại một thời điểm $t$.],
        True([Điện áp tổng hợp $u(t)$ cũng là một hàm số tuần hoàn.]),
        [Biên độ của điện áp tổng hợp là $200$ V.],
        True([Điện áp tổng hợp đạt cực đại lần đầu tiên tại $t = 1/600$ giây.])
    ), 
    loigiai: [
        - *a)* Sai. Hai điện áp này lệch pha nhau $pi/3$, do đó chúng không thể cùng bằng $0$ tại một thời điểm (khi một cái bằng $0$ thì cái kia khác $0$).
        - *b)* Đúng. Tổng của hai dao động điều hòa cùng tần số luôn là một dao động điều hòa có cùng tần số, do đó nó tuần hoàn.
        - *c)* Sai. Ta có:
        $
          u(t) = 100 cos(100pi t) + 100 cos(100pi t - pi/3)
        $
        Áp dụng công thức $cos a + cos b = 2 cos((a+b)/2) cos((a-b)/2)$:
        $
          u(t) = 2 dot 100 dot cos(pi/6) dot cos(100pi t - pi/6) = 200 dot (sqrt(3))/2 dot cos(100pi t - pi/6) = 100sqrt(3) cos(100pi t - pi/6)
        $
        Biên độ tổng hợp là $100sqrt(3) approx 173.2$ V, không phải $200$ V.
        - *d)* Đúng. Điện áp đạt cực đại khi:
        $
          cos(100pi t - pi/6) = 1 <=> 100pi t - pi/6 = k 2pi <=> 100pi t = pi/6 + k 2pi <=> t = 1/600 + k/50
        $
        Với $t > 0$, lần đầu tiên điện áp đạt cực đại là $t = 1/600$ giây ($k=0$).
    ]
)

// DS 4
#ds(
    [Một đường hầm xuyên núi có mặt cắt ngang là một nửa hình elip, nhưng để đơn giản cho xe cộ, người ta lắp đặt một khung thép bảo vệ có hình dạng của hàm số lượng giác $y = 5 cos((pi x)/6)$, với $-3 <= x <= 3$ ($x$ tính bằng mét). Trục $"Ox"$ nằm trên mặt đường. Các phát biểu sau đúng hay sai?], (
        True([Chiều cao lớn nhất của khung thép bảo vệ là $5$ m.]),
        True([Bề rộng mặt đường tại chân khung thép là $6$ m.]),
        [Một chiếc xe tải cao $3$ m và rộng $3$ m đi qua chính giữa hầm thì sẽ bị đụng trần hầm.],
        True([Diện tích bề mặt đường nằm dưới khung thép nhưng có chiều cao lớn hơn $2.5$ m rộng đúng $4$ m.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $x = 0$ (chính giữa hầm), chiều cao $y$ đạt cực đại $y = 5 cos(0) = 5$ m.
        - *b)* Đúng. Chân khung thép tiếp đất khi $y = 0$:
        $
          5 cos((pi x)/6) = 0 <=> (pi x)/6 = pi/2 + k pi <=> x = 3 + 6k
        $
        Vì $-3 <= x <= 3$, hai chân của khung nằm tại $x = -3$ và $x = 3$. Bề rộng là $3 - (-3) = 6$ m.
        - *c)* Sai. Xe tải rộng $3$ m đi chính giữa, tức là nó chiếm không gian từ $x = -1.5$ đến $x = 1.5$.
        Tại mép xe ($x = 1.5$), chiều cao của khung thép là:
        $
          y = 5 cos((pi dot 1.5)/6) = 5 cos(pi/4) = (5sqrt(2))/2 approx 3.53 " (m)"
        $
        Chiều cao $3.53$ m $> 3$ m (chiều cao xe tải). Vậy xe tải qua hầm an toàn không bị đụng trần.
        - *d)* Đúng. Để không gian hầm có chiều cao $> 2.5$ m:
        $
          5 cos((pi x)/6) > 2.5 <=> cos((pi x)/6) > 1/2
        $
        Xét trong đoạn $[-3; 3]$ (tức là góc thuộc $[-pi/2; pi/2]$), ta có:
        $
          -pi/3 < (pi x)/6 < pi/3 <=> -2 < x < 2
        $
        Khoảng $x$ từ $-2$ đến $2$ có chiều dài là $2 - (-2) = 4$ m.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TL 1
#tln(
    [Một máy bay đang bay với vận tốc không đổi, góc ngẩng của mũi máy bay so với phương ngang thay đổi nhẹ do gió. Hàm mô phỏng góc ngẩng là $theta(t) = 0.5 sin(2 t - pi/3)$ (độ). Tính tốc độ thay đổi lớn nhất của góc ngẩng theo thời gian (đơn vị độ/giây).],
    [1],
    loigiai: [
        Tốc độ thay đổi của góc ngẩng chính là đạo hàm của hàm số $theta(t)$:
        $
          v(t) = theta'(t) = 0.5 dot 2 cos(2 t - pi/3) = cos(2 t - pi/3)
        $
        Vì $-1 <= cos(2 t - pi/3) <= 1$, tốc độ thay đổi lớn nhất (khi đạo hàm lớn nhất) là $1$ độ/s.
    ]
)

// TL 2
#tln(
    [Một quả lắc Newton có phương trình chuyển động là $s(t) = 12 cos(pi t)$ (cm). Quãng đường vật đi được trong $3.5$ giây đầu tiên là bao nhiêu cm?],
    [84],
    loigiai: [
        Chu kì của quả lắc là $T = (2pi)/pi = 2$ giây.
        Khoảng thời gian $t = 3.5$ giây $= 1.75 T = 1 T + 0.75 T$.
        Trong $1$ chu kì ($T$), vật đi được $4A = 4 dot 12 = 48$ cm.
        Trong $0.75 T = (3T)/4$, vật đi được $3A = 3 dot 12 = 36$ cm (vì vật xuất phát từ biên dương, sau $0.75 T$ vật sẽ từ biên qua vị trí cân bằng, tới biên âm, rồi quay lại vị trí cân bằng).
        Tổng quãng đường là $48 + 36 = 84$ cm.
    ]
)

// TL 3
#tln(
    [Số giờ có ánh sáng mặt trời của một thành phố $A$ ở Bắc Âu trong năm được mô hình hóa bằng hàm số $L(t) = 12 + 8 sin((2pi)/365(t - 80))$, với $t$ là số ngày trong năm ($t=1,2,...,365$). Thành phố này sẽ trải qua hiện tượng "Đêm trắng" (số giờ có ánh sáng mặt trời đạt trên $16$ giờ) trong bao nhiêu ngày liên tiếp?],
    [122],
    loigiai: [
        Ta giải bất phương trình:
        $
          12 + 8 sin((2pi)/365(t - 80)) > 16 <=> 8 sin((2pi)/365(t - 80)) > 4 <=> sin((2pi)/365(t - 80)) > 1/2
        $
        Xét trong $1$ chu kì (năm đầu tiên):
        $
          pi/6 < (2pi)/365(t - 80) < (5pi)/6
        $
        $
          <=> 365/12 < t - 80 < (5 dot 365)/12 <=> 30.4 < t - 80 < 152.1 <=> 110.4 < t < 232.1
        $
        Số ngày nguyên thỏa mãn là từ $t = 111$ đến $t = 232$.
        Số ngày liên tiếp là: $232 - 111 + 1 = 122$ (ngày). 
        Wait, I put 121 in the answer. Let's recalculate. $232 - 111 + 1 = 122$.
    ]
)
// TL 4
#tln(
    [Tổng lượng điện năng một gia đình tiêu thụ (kWh) tính từ đầu tháng được ước tính bởi $E(t) = 15 t - 2 sin(pi t)$, với $t$ là số ngày tính từ đầu tháng. Tính mức tiêu thụ điện thực tế trong đúng ngày thứ $15$ của tháng (tức là lượng điện tính từ đầu ngày $14$ đến đầu ngày $15$).],
    [15],
    loigiai: [
        Mức tiêu thụ trong đúng ngày thứ $15$ là $Delta E = E(15) - E(14)$.
        Ta có:
        $
          E(15) = 15 dot 15 - 2 sin(15pi) = 225 - 0 = 225
        $
        $
          E(14) = 15 dot 14 - 2 sin(14pi) = 210 - 0 = 210
        $
        Lượng điện tiêu thụ: $225 - 210 = 15$ (kWh).
    ]
)

// TL 5
#tln(
    [Đỉnh điểm doanh thu của một trò chơi điện tử xảy ra theo chu kì và tuân theo hàm $R(x) = 200 sin((pi x)/4) + 300$, với $x$ là số năm kể từ khi phát hành. Trong $10$ năm đầu, trò chơi đạt doanh thu từ $400$ triệu USD trở lên trong tổng cộng bao nhiêu năm?],
    [4],
    loigiai: [
        Điều kiện:
        $
          R(x) >= 400 <=> 200 sin((pi x)/4) + 300 >= 400 <=> sin((pi x)/4) >= 1/2
        $
        $
          <=> pi/6 + k 2pi <= (pi x)/4 <= (5pi)/6 + k 2pi <=> 2/3 + 8k <= x <= 10/3 + 8k
        $
        Với $x in [0; 10]$:
        - Nếu $k=0$: $0.67 <= x <= 3.33$. Chiều dài khoảng này là $3.33 - 0.67 = 2.66$ năm. (khoảng $2.66$ năm).
        Wait, the question asks "trong tổng cộng bao nhiêu năm" which could mean the sum of durations. 
        Nếu $k=1$: $8.67 <= x <= 11.33$. Vì bị chặn ở $10$ nên $8.67 <= x <= 10$. Chiều dài là $1.33$ năm.
        Tổng thời gian là $2.66 + 1.33 = 3.99 approx 4$ (năm).
    ]
)

// TL 6
#tln(
    [Hai con lắc đơn dao động trên hai mặt phẳng song song với phương trình li độ góc lần lượt là $alpha_1 = 0.1 cos(pi t)$ và $alpha_2 = 0.1 cos(pi t - pi/2)$. Kể từ thời điểm $t=0$, thời điểm thứ hai hai con lắc này qua nhau (có cùng li độ) là bao nhiêu giây? (Nhập đáp án dưới dạng số thập phân)],
    [1.25],
    loigiai: [
        Hai con lắc qua nhau khi:
        $
          alpha_1 = alpha_2 <=> cos(pi t) = cos(pi t - pi/2)
        $
        $
          <=> pi t = pi t - pi/2 + k 2pi " (vô nghiệm) " "hoặc" pi t = -pi t + pi/2 + k 2pi
        $
        $
          <=> 2pi t = pi/2 + k 2pi <=> t = 1/4 + k
        $
        Với $t > 0$, thời điểm thứ nhất ứng với $k=0$ là $t = 0.25$ s.
        Thời điểm thứ hai ứng với $k=1$ là $t = 1.25$ s.
        Wait, I put $1.75$ in the answer! Let me check the math. $1/4 + 1 = 1.25$. I should change the answer.
    ]
)
] // end of make-questions

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
