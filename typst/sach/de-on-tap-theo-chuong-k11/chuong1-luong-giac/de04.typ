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
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 04)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)
// TN 1
#tn(
    [Khẳng định nào sau đây là đúng?],
    (
        [$sin(-x) = sin x$],
        [$cos(-x) = -cos x$],
        True([$tan(-x) = -tan x$]),
        [$cot(-x) = cot x$]
    ),
    loigiai: [
        Ta có công thức lượng giác cơ bản đối với cung đối nhau:
        $ tan(-x) = -tan x $
    ]
)

// TN 2
#tn(
    [Tập xác định của hàm số $y = tan x$ là],
    (
        [$RR$],
        True([$RR setminus {pi/2 + k pi, k in ZZ}$]),
        [$RR setminus {k pi, k in ZZ}$],
        [$[-1; 1]$]
    ),
    loigiai: [
        Hàm số $y = tan x$ xác định khi và chỉ khi:
        $ cos x != 0 <=> x != pi/2 + k pi, (k in ZZ) $
    ]
)

// TN 3
#tn(
    [Đồ thị hàm số nào dưới đây nhận trục tung làm trục đối xứng?],
    (
        True([$y = cos x$]),
        [$y = sin x$],
        [$y = tan x$],
        [$y = cot x$]
    ),
    loigiai: [
        Hàm số $y = cos x$ là hàm số chẵn vì $cos(-x) = cos x , forall x in RR$. 
        Do đó đồ thị của nó nhận trục tung làm trục đối xứng.
    ]
)

// TN 4
#tn(
    [Nghiệm của phương trình $cos x = 0$ là],
    (
        [$x = k pi$],
        [$x = k 2pi$],
        True([$x = pi/2 + k pi$]),
        [$x = -pi/2 + k 2pi$]
    ),
    loigiai: [
        Ta có phương trình lượng giác cơ bản:
        $ cos x = 0 <=> x = pi/2 + k pi, (k in ZZ) $
    ]
)

// TN 5
#tn(
    [Chu kì tuần hoàn của hàm số $y = cos(2x + pi/3)$ là],
    (
        [$2pi$],
        True([$pi$]),
        [$pi/2$],
        [$4pi$]
    ),
    loigiai: [
        Hàm số $y = cos(a x + b)$ có chu kì tuần hoàn là:
        $ T = (2pi)/|a| $
        Với hàm số đã cho, ta có $a = 2$, suy ra:
        $ T = (2pi)/2 = pi $
    ]
)

// TN 6
#tn(
    [Tất cả các nghiệm của phương trình $sin x = sin(pi/4)$ là],
    (
        [$x = pi/4 + k 2pi$],
        [$x = (3pi)/4 + k 2pi$],
        True([$x = pi/4 + k 2pi$ và $x = (3pi)/4 + k 2pi$]),
        [$x = pi/4 + k pi$]
    ),
    loigiai: [
        Phương trình $sin x = sin alpha$ có công thức nghiệm:
        $ x = alpha + k 2pi  " hoặc "  x = pi - alpha + k 2pi $
        Áp dụng ta được:
        $ x = pi/4 + k 2pi  " hoặc "  x = (3pi)/4 + k 2pi $
    ]
)

// TN 7
#tn(
    [Cho $cos alpha = -3/5$ và $pi/2 < alpha < pi$. Giá trị của $sin alpha$ là],
    (
        [$3/5$],
        True([$4/5$]),
        [$-4/5$],
        [$-3/5$]
    ),
    loigiai: [
        Do $pi/2 < alpha < pi$ nên điểm ngọn cung lượng giác nằm ở góc phần tư thứ hai, suy ra $sin alpha > 0$.
        Từ hệ thức $sin^2 alpha + cos^2 alpha = 1$, ta có:
        $ sin alpha = sqrt{1 - cos^2 alpha} = sqrt{1 - (-3/5)^2} = sqrt(16/25) = 4/5 $
    ]
)

// TN 8
#tn(
    [Biểu thức rút gọn của $A = cos(pi/2 - x) + sin(pi/2 - x) - cos(pi/2 + x) - sin(pi/2 + x)$ là],
    (
        True([$2 sin x$]),
        [$2 sin x + 2 cos x$],
        [$2 cos x$],
        [$0$]
    ),
    loigiai: [
        Sử dụng các công thức cung phụ nhau và hơn kém $pi/2$:
        - $cos(pi/2 - x) = sin x$
        - $sin(pi/2 - x) = cos x$
        - $cos(pi/2 + x) = -sin x$
        - $sin(pi/2 + x) = cos x$
        
        Thay vào $A$ ta được:
        $ A = sin x + cos x - (-sin x) - cos x $
        $ A = 2 sin x $
    ]
)

// TN 9
#tn(
    [Một sóng âm truyền qua không khí với áp suất tại vị trí đo được mô tả bởi hàm số $P(t) = P_0 cos(2000pi t)$ (đơn vị: Pa), trong đó $t$ là thời gian tính bằng giây. Tần số của sóng âm này là bao nhiêu Hz?],
    (
        [$2000$ Hz],
        True([$1000$ Hz]),
        [$4000pi$ Hz],
        [$1000pi$ Hz]
    ),
    loigiai: [
        Tần số góc của dao động là $omega = 2000pi$ (rad/s).
        Tần số $f$ của sóng âm được tính bằng công thức:
        $ f = omega / (2pi) $
        $ => f = (2000pi) / (2pi) = 1000 " (Hz)" $
    ]
)

// TN 10
#tn(
    [Một vòng quay Mặt Trời (Ferris Wheel) quay đều đặn. Chiều cao $h$ (mét) của một cabin so với mặt đất tại thời điểm $t$ (phút) kể từ lúc bắt đầu quay được cho bởi công thức $h(t) = 30 - 25 cos((pi t)/15)$. Chiều cao lớn nhất của cabin so với mặt đất là],
    (
        [$30$ m],
        [$25$ m],
        True([$55$ m]),
        [$5$ m]
    ),
    loigiai: [
        Ta có hàm cos luôn nhận giá trị trong đoạn $[-1; 1]$, nghĩa là:
        $ -1 <= cos((pi t)/15) <= 1 $
        Nhân cả $3$ vế với $-25$ (đảo chiều bất đẳng thức):
        $ 25 >= -25 cos((pi t)/15) >= -25 $
        Cộng thêm $30$ vào $3$ vế:
        $ 55 >= 30 - 25 cos((pi t)/15) >= 5 $
        $ <=> 55 >= h(t) >= 5 $
        Vậy chiều cao lớn nhất đạt được là $55$ (m).
    ]
)

// TN 11
#tn(
    [
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    grid((0, 0), (6, 3), step: 1, stroke: (dash: "dotted", paint: luma(200)))
    line((0, 0), (6.5, 0), mark: (end: ">"), stroke: 1.5pt, name: "t")
    line((0, 0), (0, 3.5), mark: (end: ">"), stroke: 1.5pt, name: "h")
    content((6.2, -0.3), [$t$ (giờ)])
    content((-0.4, 3.2), [$h$ (m)])
    for i in (2, 4, 6) {
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#calc.round(i*4)])
    }
    for i in (1, 2, 3) {
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#i])
    }
    let pts = range(0, 101).map(i => {
      let t = i / 100 * 6
      let y = 1.5 + 1.0 * calc.cos(30deg * t)
      (t, y)
    })
    line(..pts, stroke: 2pt + blue)
  })
]        
Sự biến thiên mực nước $h$ (mét) tại một cảng biển theo thời gian $t$ (giờ) trong ngày được cho bởi hàm số $h(t) = 1.5 + cos((pi t)/12)$ như hình vẽ. Thời gian khoảng cách giữa hai lần liên tiếp mực nước dâng cao nhất là bao nhiêu giờ?],
    (
        [$12$ giờ],
        True([$24$ giờ]),
        [$6$ giờ],
        [$48$ giờ]
    ),
    loigiai: [
        Khoảng thời gian giữa hai lần mực nước dâng cao nhất chính là chu kì của hàm số $h(t)$.
        Hàm số $h(t)$ có tần số góc $omega = pi/12$.
        Chu kì dao động là:
        $ T = (2pi) / omega = (2pi) / (pi/12) = 24 " (giờ)" $
    ]
)

// TN 12
#tn(
    [Trong một hệ thống cơ học, vận tốc của một vật dao động điều hoà được xác định bởi $v(t) = 50 cos(4pi t + pi/3)$ (cm/s). Gia tốc của vật tại thời điểm $t = 0$ là],
    (
        [$-200pi$ cm/s#super("2")],
        True([$-100pi sqrt(3)$ cm/s#super("2")]),
        [$100pi$ cm/s#super("2")],
        [$0$ cm/s#super("2")]
    ),
    loigiai: [
        Gia tốc $a(t)$ là đạo hàm của vận tốc $v(t)$ theo thời gian $t$:
        $ a(t) = v'(t) = -50 dot 4pi dot sin(4pi t + pi/3) $
        $ <=> a(t) = -200pi sin(4pi t + pi/3) $
        Tại $t = 0$:
        $ a(0) = -200pi sin(pi/3) = -200pi dot (sqrt(3))/2 = -100pi sqrt(3) " (cm/s"^2")" $
    ]
)


#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)
// DS 1
#ds(
    [Cho hàm số $y = f(x) = sin x + cos x$. Các mệnh đề sau đúng hay sai?],
    (
        [Tập xác định của hàm số là $RR$.],
        [Hàm số tuần hoàn với chu kì $T = pi$.],
        [Giá trị lớn nhất của hàm số là $2$.],
        [Phương trình $f(x) = 0$ có nghiệm $x = -pi/4 + k pi$.]
    ),
    loigiai: [
        - *a)* Đúng. Hàm số là tổng của hai hàm số lượng giác cơ bản $sin x$ và $cos x$ nên tập xác định là $RR$.
        - *b)* Sai. Hàm số tuần hoàn với chu kì $T = 2pi$, vì cả $sin x$ và $cos x$ đều có chu kì $2pi$.
        - *c)* Sai. Ta có thể viết lại hàm số dưới dạng:
          $
            y = sqrt{2} (1/sqrt{2} sin x + 1/sqrt{2} cos x)
          $
          $
            <=> y = sqrt{2} sin(x + pi/4)
          $
          Do $-1 <= sin(x + pi/4) <= 1$, nên giá trị lớn nhất của hàm số là $sqrt{2}$, không phải $2$.
        - *d)* Đúng. Yêu cầu giải phương trình:
          $
            f(x) = 0 <=> sqrt{2} sin(x + pi/4) = 0
          $
          $
            <=> x + pi/4 = k pi
          $
          $
            <=> x = -pi/4 + k pi,  (k in ZZ)
          $
    ]
)

// DS 2
#ds(
    [Cho phương trình lượng giác $cos(2x) - 3cos x + 2 = 0$. Các mệnh đề sau đúng hay sai?],
    (
        True([Phương trình có thể đưa về dạng phương trình bậc hai $2cos^2 x - 3cos x + 1 = 0$.]),
        [Nghiệm của phương trình luôn thỏa mãn $cos x = 1$ hoặc $cos x = -1/2$.],
        True([Trên khoảng $(0; 2pi)$, phương trình có đúng $2$ nghiệm phân biệt.]),
        [Tổng tất cả các nghiệm của phương trình trên đoạn $[0; 2pi]$ bằng $2pi$.]
    ),
    loigiai: [
        - *a)* Đúng. Sử dụng công thức nhân đôi $cos(2x) = 2cos^2 x - 1$, phương trình trở thành:
          $
            2cos^2 x - 1 - 3cos x + 2 = 0
          $
          $
            <=> 2cos^2 x - 3cos x + 1 = 0
          $
        - *b)* Sai. Đặt $t = cos x, t in [-1; 1]$. Phương trình bậc hai trở thành:
          $
            2t^2 - 3t + 1 = 0
          $
          Phương trình này có hai nghiệm là:
          $
            t_1 = 1  " và "  t_2 = 1/2
          $
          Do đó $cos x = 1$ hoặc $cos x = 1/2$, chứ không phải $cos x = -1/2$.
        - *c)* Sai. Với $cos x = 1$, ta được:
          $
            x = k 2pi
          $
          Trong khoảng $(0; 2pi)$, phương trình này không có nghiệm.
          
          Với $cos x = 1/2$, ta được:
          $
            x = pi/3 + k 2pi  " hoặc "  x = -pi/3 + k 2pi
          $
          Trong khoảng $(0; 2pi)$, phương trình có hai nghiệm là $x = pi/3$ và $x = (5pi)/3$.
          Vậy tổng cộng có đúng 2 nghiệm trên khoảng $(0; 2pi)$. Sửa lại, đáp án này là Đúng.
        - *d)* Đúng. Xét trên đoạn $[0; 2pi]$ (tức là lấy thêm hai đầu mút):
          - Nghiệm $x = k 2pi$ cho ta $x = 0$ và $x = 2pi$.
          - Nghiệm $cos x = 1/2$ cho ta $x = pi/3$ và $x = (5pi)/3$.
          Tổng các nghiệm là:
          $
            0 + 2pi + pi/3 + (5pi)/3 = 4pi
          $
          Vậy tổng là $4pi$, không phải $2pi$. Phát biểu sai.
    ]
)

// DS 3
#ds(
    [
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    grid((-0.5, 0), (12.5, 5), step: 1, stroke: (dash: "dotted", paint: luma(200)))
    line((-0.5, 0), (13, 0), mark: (end: ">"), stroke: 1.5pt, name: "t")
    line((0, -0.5), (0, 5.5), mark: (end: ">"), stroke: 1.5pt, name: "T")
    content((12.7, -0.3), [$t$ (tháng)])
    content((-0.6, 5.2), [$T$ ($degree$C)])
    for i in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) {
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#i])
    }
    for i in (1, 2, 3, 4, 5) {
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#calc.round(i*7)])
    }
    let pts = range(0, 121).map(i => {
      let t = i / 10
      let y = (21 + 14 * calc.sin(30deg * (t - 4))) / 7
      (t, y)
    })
    line(..pts, stroke: 2pt + red)
  })
]        
Nhiệt độ trung bình các tháng trong năm tại một thành phố được mô phỏng bởi hàm số $T(t) = 21 + 14 sin((pi)/6 (t - 4))$ ($degree$C), trong đó $t$ là tháng trong năm ($1 <= t <= 12$, với $t=1$ là tháng 1). Các phát biểu sau đúng hay sai?],
    (
        [Nhiệt độ cao nhất trong năm là $35 degree$C.],
        [Tháng 7 là tháng có nhiệt độ trung bình cao nhất.],
        [Nhiệt độ vào tháng 1 là $7 degree$C.],
        [Có đúng 3 tháng trong năm mà nhiệt độ trung bình đạt $28 degree$C.]
    ),
    loigiai: [
        - *a)* Đúng. Giá trị lớn nhất của hàm số $T(t)$ xảy ra khi $sin((pi)/6 (t - 4)) = 1$. Khi đó:
          $
            T_{max} = 21 + 14 dot 1 = 35 , degree C
          $
        - *b)* Đúng. Nhiệt độ đạt mức cao nhất khi:
          $
            sin((pi)/6 (t - 4)) = 1
          $
          $
            <=> (pi)/6 (t - 4) = pi/2 + k 2pi
          $
          $
            <=> t - 4 = 3 + 12k <=> t = 7 + 12k
          $
          Vì $1 <= t <= 12$, nên $k=0$ và $t=7$. Vậy tháng 7 là tháng nóng nhất.
        - *c)* Đúng. Thay $t = 1$ vào phương trình:
          $
            T(1) = 21 + 14 sin((pi)/6 (1 - 4))
          $
          $
            <=> T(1) = 21 + 14 sin(-pi/2) = 21 - 14 = 7 , degree C
          $
        - *d)* Sai. Đặt $T(t) = 28$, ta có phương trình:
          $
            21 + 14 sin((pi)/6 (t - 4)) = 28
          $
          $
            <=> sin((pi)/6 (t - 4)) = 1/2
          $
          $
            <=> (pi)/6 (t - 4) = pi/6 + k 2pi  " hoặc "  (pi)/6 (t - 4) = (5pi)/6 + k 2pi
          $
          $
            <=> t = 5 + 12k  " hoặc "  t = 9 + 12k
          $
          Trên đoạn $[1; 12]$, ta nhận $t = 5$ (Tháng 5) và $t = 9$ (Tháng 9). Chỉ có $2$ tháng đạt nhiệt độ $28 degree$C, không phải $3$.
    ]
)

// DS 4
#ds(
    [Một con lắc lò xo dao động điều hoà theo phương ngang, li độ $x$ (cm) phụ thuộc thời gian $t$ (giây) theo phương trình $x(t) = 8 cos(2pi t - pi/3)$. Các phát biểu sau đúng hay sai?],
    (
        [Biên độ dao động của con lắc là $8$ cm.],
        [Chu kì dao động của con lắc là $2pi$ giây.],
        [Tại thời điểm ban đầu $t=0$, con lắc đi qua vị trí $x = 4$ cm theo chiều dương.],
        [Trong $1$ giây đầu tiên, con lắc đi qua vị trí cân bằng ($x = 0$) đúng $2$ lần.]
    ),
    loigiai: [
        - *a)* Đúng. Phương trình li độ có dạng $x(t) = A cos(omega t + phi.alt)$, trong đó biên độ là $A = 8$ (cm).
        - *b)* Sai. Tần số góc của dao động là $omega = 2pi$ (rad/s). Chu kì dao động được tính bằng công thức:
          $
            T = (2pi)/omega = (2pi)/(2pi) = 1 " (giây)"
          $
        - *c)* Đúng. Tại $t=0$, ta có:
          $
            x(0) = 8 cos(-pi/3) = 8 dot 1/2 = 4 " (cm)"
          $
          Vận tốc $v(t) = x'(t) = -16pi sin(2pi t - pi/3)$.
          Tại $t=0$, $v(0) = -16pi sin(-pi/3) = 16pi dot (sqrt(3))/2 > 0$. Vật chuyển động theo chiều dương.
        - *d)* Đúng. Vị trí cân bằng ứng với $x(t) = 0$:
          $
            8 cos(2pi t - pi/3) = 0
          $
          $
            <=> 2pi t - pi/3 = pi/2 + k pi
          $
          $
            <=> 2pi t = (5pi)/6 + k pi <=> t = 5/12 + k/2
          $
          Trong $1$ giây đầu tiên ($0 <= t <= 1$):
          $
            0 <= 5/12 + k/2 <= 1
          $
          $
            <=> -5/12 <= k/2 <= 7/12
          $
          $
            <=> -5/6 <= k <= 7/6
          $
          Do $k in ZZ$, ta có $k = 0$ và $k = 1$. Vậy có đúng $2$ lần con lắc qua vị trí cân bằng.
    ]
)


#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)
// TL 1
#tln(
    [Điện áp xoay chiều trong một mạch điện được cho bởi phương trình $u(t) = 220 sqrt(2) cos(100pi t - pi/4)$ (V), trong đó $t$ tính bằng giây. Kể từ lúc $t=0$, thời điểm đầu tiên điện áp trong mạch đạt giá trị $220$ V là $t = a/b$ (giây), với $a/b$ là phân số tối giản. Tính $a+b$.],
    [201],
    loigiai: [
        Ta cần giải phương trình $u(t) = 220$:
        $
          220 sqrt(2) cos(100pi t - pi/4) = 220
        $
        $
          <=> cos(100pi t - pi/4) = 1/sqrt(2)
        $
        $
          <=> 100pi t - pi/4 = pi/4 + k 2pi  " hoặc "  100pi t - pi/4 = -pi/4 + k 2pi
        $
        Trường hợp 1:
        $
          100pi t = pi/2 + k 2pi <=> t = 1/200 + k/50
        $
        Nghiệm dương nhỏ nhất là $t_1 = 1/200$ (khi $k=0$).
        
        Trường hợp 2:
        $
          100pi t = k 2pi <=> t = k/50
        $
        Nghiệm dương nhỏ nhất là $t_2 = 1/50 = 4/200$ (khi $k=1$).
        
        So sánh hai giá trị, thời điểm dương đầu tiên là $t = 1/200$.
        Vậy $a = 1, b = 200 => a + b = 201$.
    ]
)

// TL 2
#tln(
    [Một phương trình lượng giác có dạng $2cos^2 x - sqrt(3) cos x = 0$. Tìm số nghiệm của phương trình trên đoạn $[0; 2pi]$.],
    [4],
    loigiai: [
        Phương trình đã cho tương đương với:
        $ cos x (2cos x - sqrt(3)) = 0 $
        Trường hợp 1: $cos x = 0$.
        $ => x = pi/2 + k pi $
        Trên đoạn $[0; 2pi]$, ta có các nghiệm: $x_1 = pi/2$, $x_2 = (3pi)/2$. (Có 2 nghiệm).
        
        Trường hợp 2: $cos x = sqrt(3)/2$.
        $ => x = pi/6 + k 2pi  " hoặc "  x = -pi/6 + k 2pi $
        Trên đoạn $[0; 2pi]$, ta có các nghiệm: $x_3 = pi/6$, $x_4 = 2pi - pi/6 = (11pi)/6$. (Có 2 nghiệm).
        
        Tổng cộng có 4 nghiệm trên đoạn $[0; 2pi]$.
    ]
)
// Sửa đáp án TL 2 thành 4 trong file

// TL 3
#tln(
    [Tìm tổng tất cả các nghiệm của phương trình $tan(x - pi/4) = 1$ trên khoảng $(0; 3pi)$. Tối giản kết quả theo $pi$. Lấy hệ số của $pi$.],
    [9],
    loigiai: [
        Giải phương trình lượng giác cơ bản:
        $ tan(x - pi/4) = 1 $
        $ <=> x - pi/4 = pi/4 + k pi $
        $ <=> x = pi/2 + k pi,  (k in ZZ) $
        Xét trên khoảng $(0; 3pi)$:
        $ 0 < pi/2 + k pi < 3pi $
        Chia cả 3 vế cho $pi$:
        $ 0 < 1/2 + k < 3 <=> -1/2 < k < 5/2 $
        Vì $k$ nguyên nên $k in {0, 1, 2}$.
        Các nghiệm tương ứng là:
        - Với $k=0$, $x_1 = pi/2$. 

        - Với $k=1$, $x_2 = (3pi)/2$.

        - Với $k=2$, $x_3 = (5pi)/2$.
         
        Tổng các nghiệm là:
        $ S = pi/2 + (3pi)/2 + (5pi)/2 = (9pi)/2 $
        Hệ số của $pi$ là $9/2 = 4.5$.
    ]
)

// TL 4
#tln(
    [Giá trị lớn nhất của hàm số $y = 3sin(2x - pi/6) + 4cos(2x - pi/6) + 5$ là bao nhiêu?],
    [10],
    loigiai: [
        Hàm số có dạng $y = a sin X + b cos X + c$ với $X = 2x - pi/6$, $a = 3$, $b = 4$, $c = 5$.
        
        Ta sử dụng bất đẳng thức Bunhiacopxki hoặc biến đổi thành hàm sin:
        $ a sin X + b cos X = sqrt{a^2 + b^2} sin(X + alpha) $
        Áp dụng vào biểu thức:
        $ 3sin X + 4cos X = sqrt{3^2 + 4^2} sin(X + alpha) = 5 sin(X + alpha) $
        Vì $-1 <= sin(X + alpha) <= 1$, nên:
        $ -5 <= 3sin X + 4cos X <= 5 $
        Cộng thêm 5 vào các vế:
        $ 0 <= y <= 10 $
        Vậy giá trị lớn nhất của hàm số là $10$.
    ]
)

// TL 5
#tln(
    [Một thiết bị phát sóng âm thuỷ âm phát ra sóng lan truyền dưới mặt nước. Áp suất sóng tại điểm quan trắc biến thiên theo phương trình $P(t) = 150 cos(20pi t + pi/4)$ (kPa). Kể từ lúc $t=0$, thời điểm đầu tiên áp suất sóng đạt giá trị cực đại là bao nhiêu giây? (Kết quả viết dưới dạng thập phân).],
    [0.0875],
    loigiai: [
        Áp suất $P(t)$ đạt giá trị cực đại khi $cos(20pi t + pi/4) = 1$.
        $ <=> 20pi t + pi/4 = k 2pi $
        $ <=> 20pi t = -pi/4 + k 2pi $
        $ <=> t = -1/80 + k/10,  (k in ZZ) $
        Để tìm thời điểm đầu tiên sau $t=0$, ta xét $t > 0$:
        $ -1/80 + k/10 > 0 <=> k/10 > 1/80 <=> k > 1/8 $
        Giá trị nguyên nhỏ nhất của $k$ thỏa mãn là $k=1$.
        Thay $k=1$ vào $t$:
        $ t = -1/80 + 1/10 = -1/80 + 8/80 = 7/80 " (giây)" $
        Đổi ra số thập phân: $7/80 = 0.0875$.
    ]
)

// TL 6
#tln(
    [Khoảng cách từ tâm một guồng nước đến mặt nước là $2$ mét. Guồng nước có bán kính $3$ mét và quay đều với vận tốc $1$ vòng mỗi phút. Lấy gốc toạ độ là hình chiếu vuông góc của tâm guồng lên mặt nước. Phương trình chiều cao $h(t)$ của một gàu nước so với mặt nước theo thời gian $t$ (phút) có dạng $h(t) = a cos(2pi t + phi.alt) + b$, với gàu xuất phát từ điểm thấp nhất. Tính giá trị $a + b$.],
    [5],
    loigiai: [
        - Tâm guồng nước cách mặt nước $b = 2$ m, nên vị trí trung bình của gàu là $2$ m.
        - Bán kính guồng nước là $a = 3$ m, đây là biên độ dao động.
        
        Vì gàu đi từ điểm thấp nhất, tương ứng với $h(t)$ nhỏ nhất tại $t=0$:
        $ h(0) = a cos(phi.alt) + b = -a + b = -3 + 2 = -1 " (m)" $
        Điều này có nghĩa là gàu đang ngập dưới mặt nước 1 mét.
        Vị trí thấp nhất tương ứng với $cos(phi.alt) = -1$, suy ra $phi.alt = pi$.
        
        Hàm số mô hình hoá chiều cao là:
        $ h(t) = 3 cos(2pi t + pi) + 2 $
        
        Tuy nhiên bài chỉ yêu cầu tính $a + b$:
        $ a + b = 3 + 2 = 5 $
    ]
)

]



#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
