#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.1"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"   // dethi | loigiai | solcolor
#let accent = classic.blue

// Standalone: math đen; beamer: màu toán do sang-beamer-theme tự xử lý
#show math.equation: set text(fill: black)
#show math.equation.where(block: true): it => math.display(it.body)
// Standalone: hàm câu hỏi từ sang-exam (beamer dùng hàm được truyền vào)
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 1",
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "101",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// make-questions — exportable cho Beamer.typ, không cần --input beamer=1
// ═══════════════════════════════════════════════════════════════════
#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

// TN 1
#tn([Số đo radian của góc $120^circ$ là],
    (
        True([$(2pi) / 3$]),
        [$(3pi) / 2$],
        [$(pi) / 3$],
        [$(4pi) / 3$]
    ),
    loigiai: [
        Ta có $120^circ = (120 dot pi) / 180 = (2pi) / 3$.
    ]
)

// TN 2
#tn([Một đường tròn có bán kính $R = 10 "cm"$. Độ dài của cung tròn có số đo $pi/5$ radian là],
    (
        [$5 "cm"$],
        [$2 "cm"$],
        True([$2pi "cm"$]),
        [$5pi "cm"$]
    ),
    loigiai: [
        Độ dài cung là $l = R alpha = 10 dot pi/5 = 2pi " (cm)".$
    ]
)

// TN 3
#tn([Tập xác định của hàm số $y = tan x$ là],
    (
        True([$RR setminus { (pi)/2 + k pi, k in ZZ}$]),
        [$RR setminus { k pi, k in ZZ}$],
        [$RR$],
        [$[-1; 1]$] 
    ),
    loigiai: [
        Hàm số $y = tan x$ xác định khi 
        $
          cos x != 0 <=> x != (pi)/2 + k pi, k in ZZ
        $
.
    ]
)

// TN 4
#tn([Tập giá trị của hàm số $y = 3 sin(2 x) - 1$ là],
    (
        True([$[-4; 2]$]),
        [$[-1; 3]$],
        [$[-3; 3]$],
        [$[-2; 4]$]
    ),
    loigiai: [
        Ta có $-1 <= sin(2 x) <= 1$.

        Suy ra 
        $
          -3 <= 3 sin(2 x) <= 3 <=> -4 <= 3 sin(2 x) - 1 <= 2
        $
.

        Vậy tập giá trị là $[-4; 2]$.
    ]
)

// TN 5
#tn([Cho đồ thị của hàm số $y = sin x$ trên đoạn $[-pi; pi]$ như hình vẽ dưới đây.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((-3.14, 0), (3.14, 0), mark: (end: ">"), name: "x")
    line((0, -1.5), (0, 1.5), mark: (end: ">"), name: "y")
    content((3.3, -0.3), [$x$])
    content((-0.3, 1.3), [$y$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(0, 100) {
      let x = -3.14159 + (i/99) * 6.28318
      pts.push((x, calc.sin(x * 1rad)))
    }
    line(..pts, stroke: 1pt + blue)
    
    // marks
    content((1.57, -0.3), [$pi/2$])
    content((-1.57, -0.3), [$-pi/2$])
    content((3.14, -0.3), [$pi$])
    content((-3.14, -0.3), [$-pi$])
    
    line((1.57, 0), (1.57, 1), stroke: (dash: "dashed"))
    line((-1.57, 0), (-1.57, -1), stroke: (dash: "dashed"))
  })
]
Hàm số đồng biến trên khoảng nào dưới đây?],
    (
        True([$(-pi/2; pi/2)$]),
        [$(0; pi)$],
        [$(-pi; 0)$],
        [$(pi/2; pi)$]
    ),
    loigiai: [
        Quan sát đồ thị từ trái sang phải, ta thấy đồ thị đi lên (hàm số đồng biến) trong khoảng $x in (-pi/2; pi/2)$.
    ]
)

// TN 6
#tn([Chu kì tuần hoàn của hàm số $y = sin(2 x)$ là],
    (
        True([$pi$]),
        [$2pi$],
        [$(pi)/2$],
        [$4pi$]
    ),
    loigiai: [
        Chu kì tuần hoàn của hàm số $y = sin(a x)$ là $T = (2pi) / |a|$. Vậy chu kì của $y = sin(2 x)$ là $T = (2pi) / 2 = pi$.
    ]
)

// TN 7
#tn(
    [Đồ thị của một hàm số đi qua gốc toạ độ $O(0;0)$ và đạt cực đại đầu tiên bên phải trục tung tại $x = pi/2$. Hàm số đó là hàm số nào?],
    (
        True([$y = sin x$]),
        [$y = cos x$],
        [$y = tan x$],
        [$y = cot x$]
    ),
    loigiai: [
        Đồ thị đi qua gốc toạ độ $O(0;0)$ và đạt giá trị cực đại đầu tiên phía x dương tại $x = (pi)/2$. Đây là đặc điểm của đồ thị hàm số $y = sin x$.
    ]
)

// TN 8
#tn([Số nghiệm của phương trình $cos x = 1/2$ trên đoạn $[0; 2pi]$ là],
    (
        True([$2$]),
        [$1$],
        [$3$],
        [$4$]
    ),
    loigiai: [
        Phương trình 
        $
          cos x = 1/2 <=> x = (pi)/3 + k 2pi
        $
 hoặc $x = -(pi)/3 + k 2pi , (k in ZZ)$.

        Trên đoạn $[0; 2pi]$, phương trình có $2$ nghiệm là $x = (pi)/3$ và $x = (5pi)/3$.
    ]
)

// TN 9
#tn([Nghiệm của phương trình $sin x = 0$ là],
    (
        True([$x = k pi, k in ZZ$]),
        [$x = (pi)/2 + k pi, k in ZZ$],
        [$x = k 2pi, k in ZZ$],
        [$x = (pi)/2 + k 2pi, k in ZZ$]
    ),
    loigiai: [
        Ta có 
        $
          sin x = 0 <=> x = k pi (k in ZZ)
        $
.
    ]
)

// TN 10
#tn([Nghiệm của phương trình $tan x = 1$ là],
    (
        True([$x = (pi)/4 + k pi, k in ZZ$]),
        [$x = (pi)/4 + k 2pi, k in ZZ$],
        [$x = -(pi)/4 + k pi, k in ZZ$],
        [$x = (pi)/2 + k pi, k in ZZ$]
    ),
    loigiai: [
        Ta có 
        $
          tan x = 1 <=> tan x = tan((pi)/4) <=> x = (pi)/4 + k pi (k in ZZ)
        $
.
    ]
)

// TN 11
#tn([Một bánh xe có $72$ răng. Số đo góc (theo radian) mà bánh xe quay được khi quay $10$ răng là],
    (
        True([$(5pi)/18$]),
        [$(5pi)/36$],
        [$50^circ$],
        [$10pi$]
    ),
    loigiai: [
        Bánh xe quay 1 vòng (72 răng) tương ứng với góc $2pi$ radian.

        Khi quay 10 răng, bánh xe quay được một góc là $(10/72) dot 2pi = (5pi)/18$ radian.
    ]
)

// TN 12
#tn([Chiều cao $h(t)$ của một con lắc lò xo so với mặt đất tại thời điểm $t$ giây được cho bởi phương trình $h(t) = 15 sin(pi t) + 30 ("cm")$. Chiều cao lớn nhất của con lắc so với mặt đất là],
    (
        True([$45 " cm"$]),
        [$30 " cm"$],
        [$15 " cm"$],
        [$60 " cm"$]
    ),
    loigiai: [
        Vì $-1 <= sin(pi t) <= 1$ nên $h(t) <= 15 dot 1 + 30 = 45$.

        Chiều cao lớn nhất là $45 " cm"$, đạt được khi $sin(pi t) = 1$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: auto)

// DS 1
#ds(
    [Nhiệt độ trung bình $T$ (tính bằng $circ C$) của một thành phố trong năm được mô hình hóa bởi hàm số 
$ T(t) = 15 sin(pi/6 (t - 3)) + 20 $
trong đó $t$ là tháng trong năm ($1 <= t <= 12$, $t in NN$). Biểu đồ mô phỏng nhiệt độ như hình vẽ dưới đây.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (13, 0), mark: (end: ">"), name: "t")
    line((0, 0), (0, 4), mark: (end: ">"), name: "T")
    content((12.5, -0.3), [$t$])
    content((-0.3, 3.8), [$T$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(10, 120) {
      let t = i / 10
      let T = 15 * calc.sin(3.14159/6 * (t - 3) * 1rad) + 20
      pts.push((t, T/10))
    }
    line(..pts, stroke: 1pt + orange)
    for t in (3, 6, 9, 12) {
      content((t, -0.3), [#t])
      line((t, 0), (t, 0.1), stroke: 1pt)
    }
  })
]
Các mệnh đề sau đúng hay sai?],
    (
        [Nhiệt độ trung bình lớn nhất trong năm là $20^circ C$.],
        True([Nhiệt độ trung bình thấp nhất trong năm là $5^circ C$.]),
        [Tháng nóng nhất trong năm là tháng 5.],
        True([Vào tháng 12, nhiệt độ trung bình của thành phố là $5^circ C$.])
    ),
    loigiai: [
        a) Sai. Ta có $-1 <= sin(pi/6 (t - 3)) <= 1$. Nhiệt độ lớn nhất là $max T = 15(1) + 20 = 35^circ C$.
        
        b) Đúng. Nhiệt độ thấp nhất là $min T = 15(-1) + 20 = 5^circ C$.
        
        c) Sai. Nhiệt độ đạt cực đại khi 
        $
          sin(pi/6 (t - 3)) = 1 <=> pi/6 (t - 3) = pi/2 <=> t - 3 = 3 <=> t = 6
        $
. Tháng nóng nhất là tháng 6.
        
        d) Đúng. Tại $t = 12$, $T(12) = 15 sin(pi/6 (12 - 3)) + 20 = 15 sin(3pi/2) + 20 = 15(-1) + 20 = 5^circ C$.
    ]
)

// DS 2
#ds(
    [Cho phương trình lượng giác $sin(2 x) = 1/2$. Xét tính đúng sai của các mệnh đề sau:],
    (
        [Phương trình có nghiệm là $x = pi/12 + k pi$ và $x = (5pi)/12 + k pi (k in ZZ)$.],
        True([Nghiệm âm lớn nhất của phương trình là $x = -(7pi)/12$.]),
        True([Phương trình có $2$ nghiệm thuộc khoảng $(0; pi)$.]),
        [Tổng các nghiệm của phương trình trên đoạn $[0; 2pi]$ bằng $2pi$.]
    ),
    loigiai: [
        a) đúng. 
        $
          sin(2 x) = 1/2 <=> 2x = pi/6 + k 2pi
        $
 hoặc 
        $
          2x = (5pi)/6 + k 2pi <=> x = pi/12 + k pi
        $
 hoặc $x = (5pi)/12 + k pi (k in ZZ)$.

        b) đúng. 
        Với họ $x = pi/12 + k pi$, nghiệm âm lớn nhất khi $k = -1$ là $x = -11pi/12$.
        Với họ $x = (5pi)/12 + k pi$, nghiệm âm lớn nhất khi $k = -1$ là $x = -7pi/12$.
        So sánh hai nghiệm, ta thấy $-7pi/12 > -11pi/12$.

        c) đúng.
        Trên khoảng $(0; pi)$, họ $x = pi/12 + k pi$ có nghiệm $x = pi/12$ ($k=0$).
        Họ $x = (5pi)/12 + k pi$ có nghiệm $x = (5pi)/12$ ($k=0$).
        Vậy phương trình có 2 nghiệm.

        d) sai.
        Trên đoạn $[0; 2pi]$, các nghiệm là $pi/12$, $(5pi)/12$, $13pi/12$, $17pi/12$.
        Tổng các nghiệm bằng $(36pi)/12 = 3pi$.
    ]
)

// DS 3
#ds(
    [Cho hàm số $y = cos^2 x - 2 cos x + 3$. Xét tính đúng sai của các mệnh đề sau:],
    (
        True([Đặt $t = cos x$, điều kiện của $t$ là $t in [-1; 1]$.]),
        True([Hàm số đạt giá trị nhỏ nhất bằng $2$.]),
        [Hàm số đạt giá trị lớn nhất bằng $5$.],
        True([Đồ thị hàm số nhận trục tung làm trục đối xứng.])
    ),
    loigiai: [
        a) đúng. Do $-1 <= cos x <= 1$ với mọi $x$.

        b) đúng.
        Xét hàm $f(t) = t^2 - 2t + 3$ trên $[-1; 1]$.
        Bảng biến thiên của $f(t)$ cho thấy hàm nghịch biến trên $[-1; 1]$, đạt giá trị nhỏ nhất tại $t = 1$ với $f(1) = 2$.
        Suy ra $min y = 2$ khi $cos x = 1$.

        c) sai. Đạt giá trị lớn nhất tại $t = -1$ với $f(-1) = 6$. Vậy $max y = 6$.

        d) đúng. Do $y(-x) = cos^2(-x) - 2 cos(-x) + 3 = cos^2 x - 2 cos x + 3 = y(x)$ nên hàm số là hàm số chẵn, đồ thị nhận trục tung làm trục đối xứng.
    ]
)

// DS 4
#ds(
    [Mực nước cao nhất tại một cảng biển là $16 " m"$ và thấp nhất là $10 " m"$. Một hàm số lượng giác dạng $h(t) = A cos(omega t) + B$ được dùng để mô hình hoá chiều cao mực nước (tính bằng mét) theo thời gian $t$ (tính bằng giờ, $0 <= t <= 24$). Biết rằng lúc $t=0$ mực nước đạt cao nhất và chu kì của thuỷ triều là $12$ giờ. Hình vẽ dưới đây mô phỏng sự lên xuống của mực nước.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    line((0, 0), (7, 0), mark: (end: ">"), name: "t")
    line((0, 0), (0, 4.5), mark: (end: ">"), name: "h")
    content((6.8, -0.3), [$t$])
    content((-0.3, 4.3), [$h$])
    content((-0.2, -0.2), [$O$])
    
    let pts = ()
    for i in range(0, 100) {
      let t = (i/99) * 24
      // Map h from [10, 16] to [2.5, 4]
      let h = 3 * calc.cos(3.14159/6 * t * 1rad) + 13
      pts.push((t / 4, h / 4))
    }
    line(..pts, stroke: 1pt + teal)
    
    for t in (6, 12, 18, 24) {
      content((t/4, -0.3), [#t])
      line((t/4, 0), (t/4, 0.1), stroke: 1pt)
    }
  })
]
Xét tính đúng sai của các mệnh đề sau:],
    (
        True([Giá trị của $A$ bằng $3$.]),
        True([Giá trị của $B$ bằng $13$.]),
        [Tần số góc $omega = pi/12$.],
        [Mực nước tại thời điểm $t = 2$ giờ là $11,5 " m"$.]
    ),
    loigiai: [
        a) Đúng, b) Đúng. Ta có $max h = A + B = 16$ và $min h = -A + B = 10$. Giải hệ phương trình ta được $A = 3$, $B = 13$. 
        
        c) Sai. Chu kì $T = 12$ giờ nên $omega = (2pi)/T = (2pi)/12 = pi/6 \ ("rad/h")$.
        
        d) Sai. Phương trình mực nước là $h(t) = 3 cos((pi)/6 t) + 13$. Tại $t = 2$, mực nước là $h(2) = 3 cos((pi)/3) + 13 = 3 (1/2) + 13 = 14,5 " m"$.
    ]
)

#exam-part(
    [
      #set text(fill: rgb("d32f2f"))
      PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 6)

// TLN 1
#tln([Một chiếc quạt giấy có bán kính $25 " cm"$. Khi mở rộng tối đa, góc ở tâm của vành quạt là $140^circ$. Tính chiều dài vành quạt (làm tròn đến hàng phần mười của cm).],
    [61,1],
    loigiai: [
        Đổi $140^circ = 140 dot pi / 180 = (7pi)/9$ (rad).
        Độ dài vành quạt là $l = R alpha = 25 dot (7pi)/9 = (175pi)/9 approx 61,1 " cm"$.
    ]
)

// TLN 2
#tln([Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $3 sin x - m + 2 = 0$ có nghiệm?],
    [7],
    loigiai: [
        Ta có $sin x = (m - 2)/3$.

        Phương trình có nghiệm khi và chỉ khi 
        $
          -1 <= (m - 2)/3 <= 1 <=> -3 <= m - 2 <= 3 <=> -1 <= m <= 5
        $
.

        Vì $m in ZZ$ nên $m in {-1; 0; 1; 2; 3; 4; 5}$.

        Vậy có $7$ giá trị nguyên của $m$.
    ]
)

// TLN 3
#tln([Tìm số nghiệm của phương trình $cos(2 x) - sin x = 0$ trên khoảng $(0; 3pi)$.],
    [5],
    loigiai: [
        Phương trình tương đương với 
        $
          1 - 2 sin^2 x - sin x = 0 <=> 2 sin^2 x + sin x - 1 = 0
        $
. Giải ra ta được $sin x = 1/2$ hoặc $sin x = -1$.\
        Trường hợp 1: 
        $
          sin x = 1/2 <=> x = pi/6 + k 2pi
        $
 hoặc $x = (5pi)/6 + k 2pi (k in ZZ)$. Trên khoảng $(0; 3pi)$, ta được các nghiệm $pi/6, (13pi)/6$ và $(5pi)/6, (17pi)/6$.\
        Trường hợp 2: 
        $
          sin x = -1 <=> x = -pi/2 + k 2pi (k in ZZ)
        $
. Trên khoảng $(0; 3pi)$, ta được nghiệm $x = (3pi)/2$.
        Vậy phương trình có tất cả $5$ nghiệm trên khoảng đã cho.
    ]
)

// TLN 4
#tln([Cho hàm số $y = 2 sin^2 x - 4 sin x + m$. Tìm $m$ để giá trị nhỏ nhất của hàm số bằng $3$.],
    [5],
    loigiai: [
        Đặt $t = sin x$, với $t in [-1; 1]$.

        Hàm số trở thành $f(t) = 2t^2 - 4t + m$ trên đoạn $[-1; 1]$.

        Bảng biến thiên của $f(t)$ trên $[-1; 1]$ cho thấy hàm số nghịch biến trên $[-1; 1]$, vì đỉnh của parabol là $t_0 = -(-4)/4 = 1 in [-1; 1]$.

        Vậy giá trị nhỏ nhất đạt được tại $t = 1$, tức là $f(1) = 2(1)^2 - 4(1) + m = m - 2$.

        Theo bài ra, 
        $
          min y = 3 <=> m - 2 = 3 <=> m = 5
        $
.
    ]
)

// TLN 5
#tln([Huyết áp của một người được đo đạc và có thể mô hình hoá bởi hàm số $p(t) = 115 + 25 sin(160pi t)$, trong đó $p(t)$ là huyết áp tính bằng mmHg và $t$ là thời gian tính bằng phút. Biết nhịp tim của người này được tính là số chu kì của hàm số trong một phút. Tính nhịp tim của người đó (nhịp/phút).],
    [80],
    loigiai: [
        Chu kì của hàm số $p(t)$ là $T = (2pi) / 160pi = 1/80$ (phút).

        Số chu kì trong một phút, tức là nhịp tim, là $1 / T = 80$ (nhịp/phút).
    ]
)

// TLN 6
#tln([Một vòng quay Mặt Trời có bán kính $20 " m"$ và quay với tốc độ $2$ vòng mỗi giờ. Điểm thấp nhất của cabin cách mặt đất $5 " m"$. Cabin bắt đầu từ vị trí thấp nhất. Khoảng thời gian ngắn nhất (tính bằng phút) để cabin đạt độ cao $15 " m"$ là bao nhiêu?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // ground
    line((-2, 0), (2, 0), stroke: 2pt)
    content((2.5, 0), [Mặt đất])
    
    // wheel
    circle((0, 2.5), radius: 2, stroke: 1pt + black)
    
    // supports
    line((-1.5, 0), (0, 2.5), stroke: 2pt + gray)
    line((1.5, 0), (0, 2.5), stroke: 2pt + gray)
    
    // cabin at bottom
    content((0, 0.2), [$5$m])
    content((-2.5, 2.5), [$25$m])
    content((0, 4.8), [$45$m])
    
    // center
    circle((0, 2.5), radius: 0.1, fill: black)
    
    // arrow for rotation
    arc((2.3, 2.5), start: 0deg, stop: 60deg, radius: 2.3, mark: (end: ">"))
    content((2, 3.5), [$omega$])
  })
]],
    [5],
    loigiai: [
        Tâm vòng quay cách mặt đất là $20 + 5 = 25 " m"$. 
        
        Chu kì quay là $60/2 = 30$ phút. 
        
        Tần số góc $omega = (2pi)/30 = pi/15 ("rad/phút")$. 
        
        Độ cao cabin được mô hình hoá bởi $h(t) = -20 cos((pi/15) t) + 25$ (do $t=0$ ở vị trí thấp nhất $h=5$). 
        
        Yêu cầu 
        $
          h(t) = 15 <=> -20 cos((pi/15) t) + 25 = 15 <=> cos((pi/15) t) = 1/2
        $
. 
        
        Thời điểm ngắn nhất tương ứng với góc nhỏ nhất dương nên 
        $
          (pi/15) t = pi/3 => t = 5
        $
 phút.
    ]
)

]

#make-questions()
