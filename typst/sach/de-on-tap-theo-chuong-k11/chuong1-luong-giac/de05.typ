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
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 05)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Khi một vệ tinh quay quanh Trái Đất, góc định vị của nó thay đổi theo thời gian. Khẳng định nào sau đây diễn tả đúng tính chất tuần hoàn của hàm số lượng giác khi tính vị trí vệ tinh?],
    (
        True([Sau mỗi chu kì $2pi$, vị trí góc của vệ tinh lặp lại trạng thái ban đầu.]),
        [Sau mỗi chu kì $pi$, vị trí góc của vệ tinh lặp lại trạng thái ban đầu.],
        [Hàm số biểu diễn vị trí không có tính tuần hoàn.],
        [Chu kì lặp lại vị trí phụ thuộc vào vận tốc vệ tinh, không cố định.]
    ),
    loigiai: [
        Hàm số $sin x$ và $cos x$ tuần hoàn với chu kì $2pi$. Do đó, khi biểu diễn vị trí góc (tọa độ trên đường tròn), sau một góc $2pi$ vệ tinh sẽ trở lại vị trí ban đầu.
    ]
)

// TN 2
#tn([Độ dài cung tròn mà đầu kim phút của một đồng hồ (có độ dài $15$ cm) vạch ra trong thời gian $20$ phút là],
    (
        [$5pi$ cm],
        True([$10pi$ cm]),
        [$15pi$ cm],
        [$20pi$ cm]
    ),
    loigiai: [
        Trong $60$ phút kim phút quay được một góc $2pi$ rad.
        Trong $20$ phút kim phút quay được một góc:
        $
          alpha = (20)/(60) dot 2pi = (2pi)/3 " rad"
        $
        Độ dài cung tròn là:
        $
          l = R alpha = 15 dot (2pi)/3 = 10pi " (cm)"
        $
    ]
)

// TN 3
#tn([Huyết áp của một người được đo lường bởi hàm số $P(t) = 110 + 30 sin(160pi t)$ (mmHg), trong đó $t$ tính bằng phút. Số nhịp tim của người này (số chu kì dao động của huyết áp trong 1 phút) là],
    (
        [$60$],
        True([$80$]),
        [$100$],
        [$160$]
    ),
    loigiai: [
        Chu kì của hàm số $P(t)$ là:
        $
          T = (2pi)/omega = (2pi)/(160pi) = 1/80 " (phút)"
        $
        Số chu kì (số nhịp tim) trong 1 phút là:
        $
          f = 1/T = 80 " (nhịp/phút)"
        $
    ]
)

// TN 4
#tn([Sự biến đổi của dòng điện xoay chiều được biểu diễn bởi hàm số $i = 4 cos(100pi t + pi/3)$ (A). Giá trị lớn nhất của cường độ dòng điện trong mạch là],
    (
        [$100pi$ A],
        [$2$ A],
        True([$4$ A]),
        [$8$ A]
    ),
    loigiai: [
        Hàm số $i(t) = 4 cos(100pi t + pi/3)$ có biên độ là $4$.
        Do $-1 <= cos(100pi t + pi/3) <= 1$, nên:
        $
          -4 <= i <= 4
        $
        Giá trị lớn nhất của cường độ dòng điện là $4$ A.
    ]
)

// TN 5
#tn([Một tua-bin gió có 3 cánh quạt đối xứng nhau. Quỹ đạo của một điểm ở mũi cánh quạt tạo thành đường tròn lượng giác. Khoảng cách góc giữa hai cánh quạt liền kề là],
    (
        [$90^circ$],
        [$100^circ$],
        True([$120^circ$]),
        [$150^circ$]
    ),
    loigiai: [
        Do 3 cánh quạt đối xứng nhau nên chúng chia đều đường tròn $360^circ$ thành 3 phần bằng nhau.
        Góc giữa hai cánh quạt liền kề là:
        $
          360^circ / 3 = 120^circ
        $
    ]
)

// TN 6
#tn([Một con lắc lò xo dao động với phương trình $x(t) = 5 cos(4pi t - pi/2)$ (cm). Tại thời điểm $t = 0.5$ giây, vật đang ở vị trí nào?],
    (
        True([$0$ cm]),
        [$2.5$ cm],
        [$-5$ cm],
        [$5$ cm]
    ),
    loigiai: [
        Thay $t = 0.5$ vào phương trình dao động:
        $
          x(0.5) = 5 cos(4pi dot 0.5 - pi/2) = 5 cos(2pi - pi/2) = 5 cos(3pi/2) = 0 " (cm)"
        $
    ]
)

// TN 7
#tn([Phương trình $cos x = 1$ có mô hình thực tế mô tả một vật dao động đi qua vị trí biên dương. Tập nghiệm của phương trình này là],
    (
        [$x = pi/2 + k pi, k in ZZ$],
        True([$x = k 2pi, k in ZZ$]),
        [$x = pi + k 2pi, k in ZZ$],
        [$x = k pi, k in ZZ$]
    ),
    loigiai: [
        Phương trình $cos x = 1$ có tập nghiệm là:
        $
          x = k 2pi (k in ZZ)
        $
    ]
)

// TN 8
#tn([Thủy triều tại một bãi biển thay đổi độ cao theo hàm số $h(t) = 3 + 2 sin((pi t)/6)$ (mét), với $t$ là thời gian tính bằng giờ ($t>=0$). Độ cao lớn nhất của mực nước biển là],
    (
        [$3$ m],
        True([$5$ m]),
        [$2$ m],
        [$6$ m]
    ),
    loigiai: [
        Do $-1 <= sin((pi t)/6) <= 1$, nên độ cao mực nước biển đạt lớn nhất khi $sin((pi t)/6) = 1$.
        Lúc đó, $h_"max" = 3 + 2(1) = 5$ (m).
    ]
)

// TN 9
#tn([Trong mô hình phân bố dân số $P(t) = 5000 + 2000 cos((pi t)/10)$ của một loài động vật, thời điểm $t$ tính bằng năm. Dân số đạt mức thấp nhất là bao nhiêu cá thể?],
    (
        [$5000$],
        [$2000$],
        True([$3000$]),
        [$7000$]
    ),
    loigiai: [
        Do $-1 <= cos((pi t)/10) <= 1$, dân số đạt mức thấp nhất khi $cos((pi t)/10) = -1$.
        $
          P_"min" = 5000 + 2000(-1) = 3000
        $
    ]
)

// TN 10
#tn([Phương trình $sin(2x - pi/3) = 0$ dùng để tìm các thời điểm dòng điện bằng $0$. Nghiệm của phương trình là],
    (
        [$x = pi/6 + k pi, k in ZZ$],
        True([$x = pi/6 + (k pi)/2, k in ZZ$]),
        [$x = pi/3 + k pi, k in ZZ$],
        [$x = pi/6 + k pi/3, k in ZZ$]
    ),
    loigiai: [
        Ta có:
        $
          sin(2x - pi/3) = 0
        $
        $
          <=> 2x - pi/3 = k pi
        $
        $
          <=> 2x = pi/3 + k pi <=> x = pi/6 + (k pi)/2 (k in ZZ)
        $
    ]
)

// TN 11
#tn([Cường độ ánh sáng tại một vị trí trong ngày được tính bằng $I(t) = 1500 + 500 sin((pi)/12 (t - 6))$ (Lux), với $t$ là số giờ tính từ nửa đêm. Cường độ ánh sáng cao nhất trong ngày đạt được vào lúc mấy giờ?],
    (
        [$6$ giờ],
        True([$12$ giờ]),
        [$15$ giờ],
        [$18$ giờ]
    ),
    loigiai: [
        Cường độ ánh sáng đạt cực đại khi:
        $
          sin((pi)/12 (t - 6)) = 1
        $
        $
          <=> (pi)/12 (t - 6) = pi/2 + k 2pi
        $
        $
          <=> t - 6 = 6 + 24k <=> t = 12 + 24k
        $
        Với $0 <= t <= 24$, ta có $k = 0 => t = 12$. Vậy ánh sáng mạnh nhất lúc $12$ giờ trưa.
    ]
)

// TN 12
#tn([Hàm số lượng giác $y = A sin(omega x + phi)$ được gọi là mô hình dao động điều hòa. Đại lượng $omega$ được gọi là gì trong vật lý?],
    (
        [Chu kì],
        [Pha ban đầu],
        [Biên độ],
        True([Tần số góc])
    ),
    loigiai: [
        Theo định nghĩa Vật lý, đại lượng $omega$ (đơn vị rad/s) được gọi là *tần số góc* của dao động.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds(
    [Mô hình nhịp tim của một người trưởng thành trong trạng thái nghỉ ngơi được đo đạc bởi máy điện tâm đồ. Áp suất máu (mmHg) tại các động mạch được mô phỏng xấp xỉ bởi đồ thị hàm số lượng giác dạng $P(t) = A + B cos(omega t)$.
#align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Scale: x = t * 2, y = (P - 70) * 0.1
      grid((0, 0), (8, 6), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
      line((0, 0), (8.5, 0), mark: (end: ">"), stroke: 1.5pt)
      line((0, 0), (0, 6.5), mark: (end: ">"), stroke: 1.5pt)
      content((8.3, -0.4), [$t$ (s)])
      content((-0.8, 6.3), [$P$ (mmHg)])
      
      for i in (1, 2, 3, 4) {
        let xc = i * 2
        line((xc, -0.1), (xc, 0.1))
        content((xc, -0.4), str(i))
      }
      for i in (80, 100, 120) {
        let yc = (i - 70) * 0.1
        line((-0.1, yc), (0.1, yc))
        content((-0.6, yc), str(i))
      }
      
      let pts = range(0, 401).map(i => {
        let t_val = i / 100
        let p_val = 100 + 20 * calc.cos(360deg * t_val / 0.8)
        (t_val * 2, (p_val - 70) * 0.1)
      })
      line(..pts, stroke: 1.5pt + blue)
    })
]    
    Dựa vào đồ thị trên, các phát biểu sau đúng hay sai?], (
        True([Huyết áp tâm thu (áp suất tối đa) là $120$ mmHg.]),
        [Nhịp tim của người này là $60$ nhịp/phút.],
        True([Hàm số mô phỏng đồ thị trên là $P(t) = 100 + 20 cos(2.5pi t)$.]),
        True([Tại thời điểm $t = 1.2$ giây, huyết áp đang ở mức $80$ mmHg.])
    ), 
    loigiai: [
        - *a)* Đúng. Nhìn vào đồ thị, đỉnh cao nhất của đồ thị nằm ở vạch $120$. Do đó huyết áp lớn nhất (tâm thu) là $120$ mmHg.
        - *b)* Sai. Khoảng cách giữa 2 đỉnh liên tiếp trên đồ thị là từ $0$ đến $0.8$ (s). Do đó chu kì $T = 0.8$ giây. Số nhịp tim trong 1 phút là:
        $
          f = 60 / 0.8 = 75 " (nhịp/phút)"
        $
        - *c)* Đúng. Từ đồ thị, huyết áp dao động từ $80$ đến $120$, suy ra giá trị trung bình $A = (120+80)/2 = 100$. Biên độ $B = 120 - 100 = 20$.
        Chu kì $T = 0.8$ nên tần số góc $omega = (2pi)/0.8 = 2.5pi$.
        Tại $t=0$, $P = 120$ (đạt cực đại) nên hàm số là $P(t) = 100 + 20 cos(2.5pi t)$.
        - *d)* Đúng. Thay $t = 1.2$ vào phương trình:
        $
          P(1.2) = 100 + 20 cos(2.5pi dot 1.2) = 100 + 20 cos(3pi) = 100 - 20 = 80 " (mmHg)"
        $
    ]
)

// DS 2
#ds(
    [Độ sâu của mực nước tại một cảng biển (tính bằng mét) thay đổi theo chu kì thủy triều và được mô phỏng bởi phương trình $h(t) = 14 + 6 sin((pi t)/6 + pi/3)$, trong đó $t$ là thời gian tính bằng giờ ($0 <= t <= 24$). Các phát biểu sau đúng hay sai?], (
        True([Mực nước cao nhất trong ngày là $20$ mét.]),
        True([Mực nước thấp nhất trong ngày xuất hiện lần đầu tiên vào lúc $7$ giờ sáng.]),
        [Một tàu chở hàng nặng yêu cầu mực nước phải từ $17$ mét trở lên để cập cảng. Tàu có thể cập cảng an toàn bắt đầu từ lúc $2$ giờ sáng.],
        True([Tổng thời gian trong một ngày mà tàu nói trên có thể neo đậu an toàn trong cảng là $8$ giờ.])
    ), 
    loigiai: [
        - *a)* Đúng. Do $sin((pi t)/6 + pi/3) <= 1$ nên giá trị lớn nhất của $h(t)$ là:
        $
          h_"max" = 14 + 6(1) = 20 " (m)"
        $
        - *b)* Đúng. Mực nước thấp nhất khi:
        $
          sin((pi t)/6 + pi/3) = -1
        $
        $
          <=> (pi t)/6 + pi/3 = -pi/2 + k 2pi
        $
        $
          <=> (pi t)/6 = - (5pi)/6 + k 2pi <=> t = -5 + 12k
        $
        Với $t >= 0$, thời điểm nhỏ nhất ứng với $k=1$, suy ra $t = 7$. Vậy mực nước thấp nhất lần đầu vào lúc $7$ giờ.
        - *c)* Sai. Để tàu cập cảng, ta cần:
        $
          h(t) >= 17 <=> 14 + 6 sin((pi t)/6 + pi/3) >= 17 <=> sin((pi t)/6 + pi/3) >= 1/2
        $
        $
          <=> pi/6 + k 2pi <= (pi t)/6 + pi/3 <= (5pi)/6 + k 2pi
        $
        $
          <=> -pi/6 + k 2pi <= (pi t)/6 <= pi/2 + k 2pi <=> -1 + 12k <= t <= 3 + 12k
        $
        Với chu kỳ đầu $k=0$, ta có $-1 <= t <= 3$. Trong thực tế $t >= 0$ nên thời gian an toàn là $[0; 3]$.
        Tàu có thể cập cảng an toàn ngay từ $0$ giờ sáng (nửa đêm).
        - *d)* Đúng. Từ bất phương trình trên, các khoảng thời gian an toàn trong đoạn $[0; 24]$ là:
        Khi $k=0$: $t in [0; 3]$ (thời gian $3$ giờ).
        Khi $k=1$: $t in [11; 15]$ (thời gian $4$ giờ).
        Khi $k=2$: $t in [23; 24]$ (vì $t<=24$, thời gian $1$ giờ).
        Tổng thời gian là $3 + 4 + 1 = 8$ giờ.
    ]
)

// DS 3
#ds(
    [Một quả bóng được treo trên một con lắc lò xo và dao động theo phương thẳng đứng. Vị trí của quả bóng so với điểm cân bằng ($x=0$) được xác định bởi phương trình $x(t) = 8 cos(2pi t - pi/4)$ (cm), trong đó chiều dương hướng xuống và $t$ tính bằng giây. Các phát biểu sau đúng hay sai?], (
        True([Quả bóng bắt đầu dao động từ vị trí có li độ $x = 4sqrt(2)$ cm và đang đi xuống.]),
        [Chu kì dao động của quả bóng là $2$ giây.],
        True([Vị trí cao nhất của quả bóng cách vị trí cân bằng $8$ cm.]),
        True([Trong $2.5$ giây đầu tiên, quả bóng đi qua vị trí cân bằng đúng $5$ lần.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t=0$:
        $
          x(0) = 8 cos(-pi/4) = 8 dot sqrt(2)/2 = 4sqrt(2) " (cm)"
        $
        Vận tốc $v(t) = x'(t) = -16pi sin(2pi t - pi/4)$. Tại $t=0$:
        $
          v(0) = -16pi sin(-pi/4) = 8pi sqrt(2) > 0
        $
        Vận tốc dương nên quả bóng đang chuyển động theo chiều dương (đi xuống).
        - *b)* Sai. Chu kì dao động là:
        $
          T = (2pi)/omega = (2pi)/(2pi) = 1 " (giây)"
        $
        - *c)* Đúng. Biên độ $A = 8$ cm nên vị trí cao nhất (biên âm, vì chiều dương hướng xuống) cách vị trí cân bằng $8$ cm.
        - *d)* Đúng. Quả bóng đi qua vị trí cân bằng khi:
        $
          x(t) = 0 <=> cos(2pi t - pi/4) = 0
        $
        $
          <=> 2pi t - pi/4 = pi/2 + k pi <=> 2pi t = (3pi)/4 + k pi <=> t = 3/8 + k/2
        $
        Trong khoảng $t in [0; 2.5]$:
        $
          0 <= 3/8 + k/2 <= 2.5 <=> -0.75 <= k <= 4.25
        $
        Vì $k in ZZ$ nên $k in {0, 1, 2, 3, 4}$. Có đúng $5$ giá trị của $k$, suy ra quả bóng đi qua vị trí cân bằng $5$ lần.
    ]
)

// DS 4
#ds(
    [Sự thay đổi nhiệt độ ngoài trời trong một ngày mùa hè tại một trạm quan trắc được mô hình hóa bởi $T(t) = 28 + 7 sin((pi)/12 (t - 9))$ (độ C), trong đó $t$ là thời gian tính bằng giờ ($0 <= t <= 24$). Các phát biểu sau đúng hay sai?], (
        True([Nhiệt độ lúc $9$ giờ sáng là $28$ độ C.]),
        True([Nhiệt độ cao nhất trong ngày là $35$ độ C.]),
        True([Nhiệt độ bắt đầu vượt ngưỡng $31.5$ độ C từ $11$ giờ sáng.]),
        [Phương trình $T(t) = 21$ có đúng $2$ nghiệm trong đoạn $[0; 24]$.]
    ), 
    loigiai: [
        - *a)* Đúng. Thay $t = 9$ vào phương trình:
        $
          T(9) = 28 + 7 sin((pi)/12 (9 - 9)) = 28 + 7 sin(0) = 28 " ("degree"C)"
        $
        - *b)* Đúng. Do $sin((pi)/12 (t - 9)) <= 1$ nên $T_"max" = 28 + 7(1) = 35 " ("degree"C)"$.
        - *c)* Đúng. Giải bất phương trình $T(t) > 31.5$:
        $
          28 + 7 sin((pi)/12 (t - 9)) > 31.5
        $
        $
          <=> 7 sin((pi)/12 (t - 9)) > 3.5 <=> sin((pi)/12 (t - 9)) > 1/2
        $
        Dẫn tới khoảng nghiệm trong $1$ chu kì:
        $
          pi/6 < (pi)/12 (t - 9) < (5pi)/6
        $
        $
          <=> 2 < t - 9 < 10 <=> 11 < t < 19
        $
        Vậy nhiệt độ vượt $31.5 degree$C bắt đầu từ $11$ giờ.
        - *d)* Sai. Giải phương trình $T(t) = 21$:
        $
          28 + 7 sin((pi)/12 (t - 9)) = 21 <=> sin((pi)/12 (t - 9)) = -1
        $
        $
          <=> (pi)/12 (t - 9) = -pi/2 + k 2pi <=> t - 9 = -6 + 24k <=> t = 3 + 24k
        $
        Trên đoạn $[0; 24]$, chỉ có $1$ nghiệm là $t = 3$ (khi $k=0$). Phương trình có đúng $1$ nghiệm.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TL 1
#tln(
    [Một guồng nước có bán kính $4$ mét và tâm quay đặt cách mặt nước $1$ mét. Một gàu nước ở mép guồng bắt đầu chuyển động từ vị trí cao nhất. Guồng quay đều với chu kì $20$ giây/vòng. Tính độ cao (tính bằng mét) của gàu nước so với mặt nước tại thời điểm $t = 15$ giây.],
    [1],
    loigiai: [
        Hàm số mô phỏng độ cao của gàu nước có dạng $h(t) = a + b cos(omega t)$.
        Tâm quay cách mặt nước $1$ m, biên độ (bán kính) là $4$ m nên:
        $
          h_"max" = 1 + 4 = 5 " (m)"; quad h_"min" = 1 - 4 = -3 " (m)"
        $
        Tại $t=0$, gàu ở vị trí cao nhất $h(0) = 5$, phương trình là:
        $
          h(t) = 1 + 4 cos(omega t)
        $
        Với chu kì $T = 20$ giây, tần số góc $omega = (2pi)/20 = pi/10$.
        Vậy $h(t) = 1 + 4 cos((pi t)/10)$.
        Tại $t = 15$ giây:
        $
          h(15) = 1 + 4 cos((15pi)/10) = 1 + 4 cos((3pi)/2) = 1 + 4 dot 0 = 1 " (m)"
        $
    ]
)

// TL 2
#tln(
    [Trong dao động điều hòa của một chất điểm, động năng $W_d$ (J) được tính bởi công thức $W_d = 2 cos^2(5pi t)$. Hãy tính thời gian ngắn nhất (tính bằng giây) từ lúc $t=0$ đến khi động năng đạt giá trị cực tiểu.],
    [0.1],
    loigiai: [
        Động năng cực tiểu khi $W_d = 0$, nghĩa là:
        $
          cos(5pi t) = 0
        $
        $
          <=> 5pi t = pi/2 + k pi <=> t = 1/10 + k/5 " (s)"
        $
        Vì $t > 0$, nghiệm nhỏ nhất đạt được khi $k=0$, suy ra $t = 1/10 = 0.1$ (giây).
    ]
)

// TL 3
#tln(
    [Phương trình li độ góc của một con lắc đồng hồ là $alpha(t) = 0.1 cos(pi t)$ (rad). Thời điểm $t$ tính bằng giây. Trong $10$ giây đầu tiên, con lắc đi qua vị trí cân bằng ($alpha = 0$) bao nhiêu lần?],
    [10],
    loigiai: [
        Ta giải phương trình $alpha(t) = 0$:
        $
          0.1 cos(pi t) = 0 <=> cos(pi t) = 0
        $
        $
          <=> pi t = pi/2 + k pi <=> t = 1/2 + k
        $
        Xét trong đoạn $0 <= t <= 10$:
        $
          0 <= 1/2 + k <= 10 <=> -0.5 <= k <= 9.5
        $
        Vì $k in ZZ$, ta có $k in {0, 1, 2, ..., 9}$. 
        Có tổng cộng $10$ giá trị của $k$, tương ứng với $10$ lần qua vị trí cân bằng.
    ]
)

// TL 4
#tln(
    [Công suất tiêu thụ của một đoạn mạch xoay chiều biến thiên theo phương trình $P(t) = 200 + 200 cos(100pi t - pi/4)$ (W). Kể từ lúc $t=0$, thời điểm lần thứ hai mạch điện đạt công suất cực đại là $a/b$ (giây), với $a/b$ là phân số tối giản. Tính $a - b$.],
    [-391],
    loigiai: [
        Mạch điện đạt công suất cực đại khi $cos(100pi t - pi/4) = 1$.
        $
          <=> 100pi t - pi/4 = k 2pi
        $
        $
          <=> 100pi t = pi/4 + k 2pi <=> t = 1/400 + k/50
        $
        Vì $t > 0$, thời điểm lần thứ nhất ứng với $k=0$ là $t_1 = 1/400$.
        Thời điểm lần thứ hai ứng với $k=1$ là:
        $
          t_2 = 1/400 + 1/50 = 9/400
        $
        Vậy $a = 9$, $b = 400 => a - b = 9 - 400 = -391$.
    ]
)

// TL 5
#tln(
    [Dân số của một thành phố trong giai đoạn 10 năm được ước tính bằng mô hình $S(t) = 20 + 2 sin((pi t)/5)$ (triệu người), trong đó $t$ là số năm tính từ 2020 ($0 <= t <= 10$). Theo mô hình này, vào năm nào dân số thành phố đạt mức cao nhất (đầu tiên)?],
    [2022],
    loigiai: [
        Dân số đạt mức cao nhất khi:
        $
          sin((pi t)/5) = 1
        $
        $
          <=> (pi t)/5 = pi/2 + k 2pi <=> t/5 = 1/2 + 2k <=> t = 2.5 + 10k
        $
        Trong giai đoạn $[0; 10]$, ứng với $k=0$ ta có $t = 2.5$.
        Năm đạt mức cao nhất là $2020 + 2.5 = 2022.5$. Do đó dân số đạt đỉnh vào năm 2022.
    ]
)

// TL 6
#tln(
    [Một ống sáo phát ra sóng âm với áp suất không khí biến thiên theo hàm số $p(t) = 0.5 sin(440pi t) + 0.5 cos(440pi t)$ (Pa), $t$ tính bằng giây. Biên độ dao động của sóng âm này có thể viết dưới dạng $a sqrt(b) / c$ (với $a, b, c$ là các số tự nhiên và phân số tối giản). Tính $a + b + c$.],
    [5],
    loigiai: [
        Ta biến đổi hàm số áp suất:
        $
          p(t) = 0.5 sin(440pi t) + 0.5 cos(440pi t) = sqrt(0.5^2 + 0.5^2) sin(440pi t + alpha)
        $
        Tính biên độ:
        $
          A = sqrt(0.25 + 0.25) = sqrt(0.5) = sqrt(1/2) = sqrt(2)/2
        $
        Vậy biên độ là $1 sqrt(2) / 2$. Suy ra $a = 1, b = 2, c = 2$.
        $
          => a + b + c = 1 + 2 + 2 = 5
        $
    ]
)

] // end of make-questions

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
