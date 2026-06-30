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
  exam-title: "CHƯƠNG 1. LƯỢNG GIÁC (ĐỀ SỐ 02)",
  duration: 90,
)

// ═══════════════════════════════════════════════════════════
// NỘI DUNG ĐỀ THI
// ═══════════════════════════════════════════════════════════

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part(
  [PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.],
  count: 12,
)

// TN 1
#tn([Bánh xe của một chiếc xe đạp có bán kính $30 " cm"$. Khi xe chạy với vận tốc không đổi, bánh xe quay được $2$ vòng mỗi giây. Số đo góc (tính bằng radian) mà một nan hoa đã quay được trong $5$ giây là],
    (
        [$10pi$],
        [$15pi$],
        True([$20pi$]),
        [$30pi$]
    ),
    loigiai: [
        Bánh xe quay $2$ vòng mỗi giây, do đó vận tốc góc là $omega = 2 dot 2pi = 4pi \ ("rad/s")$.

        Trong $t = 5$ giây, góc quay được là $alpha = omega t = 4pi dot 5 = 20pi$ (rad).
    ]
)

// TN 2
#tn([Một chiếc đu quay vòng tròn có đường kính $40"m"$. Nếu đu quay quay hết một vòng trong $60$ giây, thì tốc độ góc của nó là bao nhiêu rad/giây?],
    (
        [$pi/15$],
        True([$pi/30$]),
        [$pi/60$],
        [$pi/20$]
    ),
    loigiai: [
        Chu kì quay là $T = 60$ (giây). 
        
        Tốc độ góc là $omega = (2pi) / T = (2pi) / 60 = pi/30 \ ("rad/s")$.
    ]
)

// TN 3
#tn([Phương trình $sin x = -1/2$ có các nghiệm là],
    (
        True([$x = -pi/6 + k 2pi$ hoặc $x = (7pi)/6 + k 2pi, k in ZZ$]),
        [$x = pi/6 + k 2pi$ hoặc $x = (5pi)/6 + k 2pi, k in ZZ$],
        [$x = -pi/6 + k pi, k in ZZ$],
        [$x = (7pi)/6 + k pi, k in ZZ$]
    ),
    loigiai: [
        Ta có 
        $
          sin x = -1/2 <=> sin x = sin(-pi/6) <=> x = -pi/6 + k 2pi
        $
 hoặc $x = pi - (-pi/6) + k 2pi = (7pi)/6 + k 2pi, (k in ZZ)$.
    ]
)

// TN 4
#tn([Cường độ của dòng điện xoay chiều chạy qua một dây dẫn được mô hình hóa bởi hàm số $I(t) = 5 cos(100pi t - pi/4)$ (Ampe), với $t$ tính bằng giây. Cường độ dòng điện cực đại trong dây dẫn là],
    (
        True([$5 " A"$]),
        [$100pi " A"$],
        [$10 " A"$],
        [$5/sqrt(2) " A"$]
    ),
    loigiai: [
        Cường độ cực đại là biên độ của hàm số $I(t)$, tức là $I_0 = 5 " A"$.
    ]
)

// TN 5
#tn([Đồ thị của một hàm số biểu diễn sóng biển theo thời gian có hình dạng như hình dưới. 
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Vẽ trục tọa độ
    line((-1, 0), (9, 0), mark: (end: ">"), name: "x")
    line((0, -1), (0, 7), mark: (end: ">"), name: "y")
    content((8.8, -0.4), [$t (h)$])
    content((-0.4, 6.8), [$h (m)$])
    
    // Ticks
    for i in (2, 4, 6, 8) {
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#i])
    }
    for i in (2, 4, 6) {
      line((-0.1, i), (0.1, i))
      content((-0.4, i), [#i])
    }
    content((-0.3, -0.3), [$O$])
    
    // Đồ thị
    let pts = range(0, 81).map(i => {
      let t = i / 10
      (t, 2 * calc.sin(90deg * t) + 4)
    })
    line(..pts, stroke: 1.5pt + blue)
    
    // Nét đứt tới đỉnh
    line((1, 0), (1, 6), stroke: (dash: "dashed", paint: gray))
    line((0, 6), (1, 6), stroke: (dash: "dashed", paint: gray))
  })
]
Chiều cao mực nước lúc cao nhất (đỉnh triều) là],
    (
        [$4 " m"$],
        [$2 " m"$],
        True([$6 " m"$]),
        [$8 " m"$]
    ),
    loigiai: [
        Quan sát trục Oy (chiều cao $h$), đỉnh cao nhất của đồ thị đạt giá trị $6$, do đó mực nước lúc cao nhất là $6 " m"$.
    ]
)

// TN 6
#tn([Chu kì tuần hoàn của hàm số $y = 3 tan(2x - pi/3)$ là],
    (
        [$2pi$],
        [$pi$],
        True([$pi/2$]),
        [$pi/4$]
    ),
    loigiai: [
        Chu kì tuần hoàn của hàm số $y = tan(a x + b)$ là $T = pi / |a|$. 

        Do đó, chu kì của hàm số đã cho là $T = pi / 2$.
    ]
)

// TN 7
#tn([Một con lắc lò xo dao động điều hòa với phương trình li độ $x = A cos(omega t + phi)$. Tại thời điểm $t = 0$, vật đi qua vị trí cân bằng theo chiều dương. Pha ban đầu $phi$ của dao động là],
    (
        [$pi/2$],
        True([$-pi/2$]),
        [$pi$],
        [$0$]
    ),
    loigiai: [
        Tại $t = 0$, 
        $
          x = A cos(phi) = 0 => cos(phi) = 0 => phi = +-pi/2
        $
.

        Vật đi theo chiều dương nên vận tốc 
        $
          v = -A omega sin(phi) > 0 => sin(phi) < 0
        $
. 

        Vậy $phi = -pi/2$.
    ]
)

// TN 8
#tn([Tập xác định của hàm số $y = 1 / (sin x + 1)$ là],
    (
        [$RR setminus {k pi, k in ZZ}$],
        [$RR setminus {pi/2 + k pi, k in ZZ}$],
        True([$RR setminus {-pi/2 + k 2pi, k in ZZ}$]),
        [$RR setminus {pi/2 + k 2pi, k in ZZ}$]
    ),
    loigiai: [
        Hàm số xác định khi mẫu số khác 0, tức là 
        $
          sin x + 1 != 0 <=> sin x != -1 <=> x != -pi/2 + k 2pi (k in ZZ)
        $
.
    ]
)

// TN 9
#tn([Một tấm pin năng lượng mặt trời đạt công suất tối đa $P(t) = 150 + 150 sin((pi)/12 (t - 6))$ (Watt) vào thời điểm $t$ giờ trong ngày ($0 <= t <= 24$). Thời điểm tấm pin đạt công suất lớn nhất trong ngày là lúc],
    (
        [$6$ giờ],
        True([$12$ giờ]),
        [$18$ giờ],
        [$24$ giờ]
    ),
    loigiai: [
        Công suất lớn nhất khi 
        $
          sin((pi)/12 (t - 6)) = 1 <=> (pi)/12 (t - 6) = pi/2 <=> t - 6 = 6 <=> t = 12
        $
. 

        Vậy thời điểm đó là lúc $12$ giờ trưa.
    ]
)

// TN 10
#tn([Số nghiệm của phương trình $cos x = sqrt(3)/2$ trên đoạn $[0; 3pi]$ là],
    (
        [$1$],
        [$2$],
        True([$3$]),
        [$4$]
    ),
    loigiai: [
        Ta có 
        $
          cos x = sqrt(3)/2 <=> x = pi/6 + k 2pi
        $
 hoặc $x = -pi/6 + k 2pi (k in ZZ)$.

        Với họ $x = pi/6 + k 2pi$, trên $[0; 3pi]$ có các nghiệm $x = pi/6 \ (k=0)$, $x = 13pi/6 \ (k=1)$.

        Với họ $x = -pi/6 + k 2pi$, trên $[0; 3pi]$ có nghiệm $x = 11pi/6 \ (k=1)$.

        Tổng cộng có $3$ nghiệm.
    ]
)

// TN 11
#tn([Trong mô hình cung - cầu kinh tế, sự chênh lệch doanh thu theo mùa vụ của một mặt hàng được ước tính bằng $f(x) = 200 + 50 cos((pi x)/6)$, với $x$ là tháng trong năm ($1 <= x <= 12$). Doanh thu đạt mức thấp nhất vào tháng nào?],
    (
        [$3$],
        True([$6$]),
        [$9$],
        [$12$]
    ),
    loigiai: [
        Doanh thu thấp nhất khi 
        $
          cos((pi x)/6) = -1 <=> (pi x)/6 = pi <=> x = 6
        $
. 

        Vậy doanh thu thấp nhất rơi vào tháng $6$.
    ]
)

// TN 12
#tn([Biểu thức rút gọn của $P = sin(x + pi/2) + cos(x + pi)$ là],
    (
        [$2 sin x$],
        [$2 cos x$],
        True([$0$]),
        [$-2 cos x$]
    ),
    loigiai: [
        Sử dụng góc lượng giác liên quan: $sin(x + pi/2) = cos x$ và $cos(x + pi) = -cos x$.

        Do đó, $P = cos x + (-cos x) = 0$.
    ]
)


#exam-part(
  [PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.],
  count: auto,
)

// DS 1
#ds(
    [Mô hình toán học về số lượng cá thể của một loài động vật biến động theo mùa tại một khu bảo tồn được cho bởi hàm số $N(t) = 5000 + 2000 sin((pi t)/6)$, trong đó $N(t)$ là số lượng cá thể ở tháng thứ $t$ trong năm ($1 <= t <= 12, t in ZZ$). 
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Tỉ lệ: Oy: 1 đơn vị = 2000 cá thể. 
    // Ox: 1 đơn vị = 2 tháng.
    // Vẽ trục tọa độ
    line((-0.5, 0), (6.5, 0), mark: (end: ">"), name: "x")
    line((0, -0.5), (0, 4.5), mark: (end: ">"), name: "y")
    content((6.2, -0.4), [Tháng $t$])
    content((-0.5, 4.3), [Cá thể $N$])
    
    // Ticks
    for i in (1, 2, 3, 4, 5, 6) {
      let t_val = i * 2
      line((i, -0.1), (i, 0.1))
      content((i, -0.4), [#t_val])
    }
    for i in (1, 2, 3, 4) {
      let n_val = i * 2000
      line((-0.1, i), (0.1, i))
      content((-0.6, i), [#n_val])
    }
    content((-0.3, -0.3), [$O$])
    
    // Đồ thị
    let pts = range(0, 121).map(i => {
      let t = i / 10
      // x-coord: t/2, y-coord: (5000 + 2000*sin(30deg*t))/2000
      let y = 2.5 + 1.0 * calc.sin(30deg * t)
      (t / 2, y)
    })
    line(..pts, stroke: 1.5pt + green)
  })
]    
    Các phát biểu sau đây đúng hay sai?], (
        True([Số lượng cá thể lớn nhất của loài động vật này trong năm là $7000$ cá thể.]),
        True([Số lượng cá thể đạt giá trị lớn nhất vào tháng 3.]),
        True([Vào tháng 12, số lượng cá thể trở về mức $5000$.]),
        True([Trong khoảng thời gian từ tháng 3 đến tháng 9, số lượng cá thể liên tục giảm.])
    ), 
    loigiai: [
        a) Đúng. Do $-1 <= sin((pi t)/6) <= 1$, nên $N(t) <= 5000 + 2000(1) = 7000$. Số cá thể lớn nhất là $7000$.
        
        b) Đúng. 
        $
          N(t) = 7000 <=> sin((pi t)/6) = 1 <=> (pi t)/6 = pi/2 <=> t = 3
        $
. Số cá thể lớn nhất vào tháng $3$.
        
        c) Đúng. Tại $t = 12$, $N(12) = 5000 + 2000 sin(2pi) = 5000 + 0 = 5000$.
        
        d) Đúng. Khi $t in [3; 9]$, góc $(pi t)/6 in [pi/2; (3pi)/2]$, hàm số $sin$ nghịch biến. Do đó $N(t)$ giảm từ $7000$ (tại tháng $3$) xuống $3000$ (tại tháng $9$).
    ]
)

// DS 2
#ds(
    [Doanh thu bán hàng của một chuỗi cửa hàng đồ lạnh (tính bằng triệu đồng) trong tháng thứ $x$ ($1 <= x <= 12, x in ZZ$) được mô phỏng bởi hàm số $R(x) = 400 - 150 cos((pi x)/6)$. Các phát biểu sau đây đúng hay sai?], (
        True([Doanh thu thấp nhất của chuỗi cửa hàng trong năm là $250$ triệu đồng.]),
        True([Chuỗi cửa hàng đạt doanh thu cao nhất vào mùa hè (tháng 6).]),
        True([Doanh thu tăng liên tục trong 6 tháng đầu năm.]),
        True([Có đúng $2$ tháng trong năm doanh thu đạt chính xác $475$ triệu đồng.])
    ), 
    loigiai: [
        a) Đúng. Ta có $-1 <= cos((pi x)/6) <= 1$. Suy ra $R(x) >= 400 - 150(1) = 250$. Doanh thu thấp nhất là $250$ triệu.
        
        b) Đúng. Doanh thu cao nhất khi 
        $
          cos((pi x)/6) = -1 <=> (pi x)/6 = pi <=> x = 6
        $
. Vậy doanh thu cao nhất vào tháng $6$.
        
        c) Đúng. Với $x in [1; 6]$, góc $(pi x)/6 in [pi/6; pi]$, hàm số $cos$ nghịch biến, nên $-150 cos((pi x)/6)$ đồng biến. Vậy $R(x)$ tăng liên tục trong nửa đầu năm.
        
        d) Đúng. 
        $
          R(x) = 475 <=> 400 - 150 cos((pi x)/6) = 475 <=> cos((pi x)/6) = -1/2
        $
. Do $x in {1;...;12}$ nên góc thuộc $[pi/6; 2pi]$. Giải ra ta được $(pi x)/6 = (2pi)/3$ (tức $x = 4$) hoặc $(pi x)/6 = (4pi)/3$ (tức $x = 8$). Vậy có $2$ tháng.
    ]
)

// DS 3
#ds(
    [Một vật nặng treo vào một lò xo nhẹ dao động điều hòa theo phương thẳng đứng. Phương trình li độ của vật là $x = 4 cos(10 t - (2pi)/3) " (cm)"$, với $t$ là thời gian (giây). Trục $O x$ hướng xuống, gốc $O$ tại vị trí cân bằng. Các phát biểu sau đây đúng hay sai?], (
        True([Biên độ dao động của vật là $4 " cm"$.]),
        True([Chu kì dao động của vật là $0,2pi$ giây.]),
        True([Tại thời điểm $t=0$, vật có li độ $x = -2 " cm"$.]),
        [Vật qua vị trí cân bằng lần đầu tiên tại thời điểm $t = pi/15$ giây.]
    ), 
    loigiai: [
        a) Đúng. Biên độ dao động là $A = 4 " cm"$.
        
        b) Đúng. Chu kì $T = (2pi) / omega = (2pi) / 10 = pi/5 = 0,2pi$ (giây).
        
        c) Đúng. Tại $t=0$, li độ $x(0) = 4 cos(-(2pi)/3) = 4 dot (-1/2) = -2 " cm"$.
        
        d) Sai. Vật qua vị trí cân bằng khi 
        $
          x = 0 <=> cos(10 t - (2pi)/3) = 0 <=> 10 t - (2pi)/3 = pi/2 + k pi <=> 10 t = (7pi)/6 + k pi <=> t = (7pi)/60 + k pi/10
        $
. Lần đầu tiên tương ứng $k=0$ nên $t = (7pi)/60$ giây. Phát biểu nói $t = pi/15$ (tức $(4pi)/60$) là sai.
    ]
)

// DS 4
#ds(
    [Xét khoảng cách từ Trái Đất đến một tiểu hành tinh được mô phỏng bởi hàm số $d(t) = 150 + 50 sin((pi t)/180) " (triệu km)"$, với $t$ là số ngày tính từ lúc bắt đầu quan sát ($t >= 0$). Các phát biểu sau đây đúng hay sai?], (
        True([Khoảng cách trung bình giữa Trái Đất và tiểu hành tinh là $150$ triệu km.]),
        True([Sau $90$ ngày, khoảng cách đạt giá trị lớn nhất là $200$ triệu km.]),
        True([Chu kì để tiểu hành tinh lặp lại khoảng cách như ban đầu là $360$ ngày.]),
        [Trong $360$ ngày đầu tiên, có đúng $1$ lần khoảng cách là $125$ triệu km.]
    ), 
    loigiai: [
        a) Đúng. Khoảng cách trung bình là $150$ triệu km (giá trị trục đối xứng của đồ thị hình sin).
        
        b) Đúng. Lớn nhất khi 
        $
          sin((pi t)/180) = 1 <=> (pi t)/180 = pi/2 <=> t = 90
        $
 ngày. Max $d = 150 + 50(1) = 200$.
        
        c) Đúng. Chu kì $T = (2pi) / ((pi)/180) = 360$ ngày.
        
        d) Sai. 
        $
          d(t) = 125 <=> 150 + 50 sin((pi t)/180) = 125 <=> sin((pi t)/180) = -1/2
        $
. Trên chu kì $360$ ngày đầu tiên, phương trình này có $2$ nghiệm (một nghiệm góc phần tư III, một nghiệm góc phần tư IV). Do đó có $2$ lần, không phải $1$ lần.
    ]
)

#exam-part(
  [PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.],
  count: 6,
)

// TLN 1
#tln([Một kim phút của đồng hồ dài $15 " cm"$. Tính quãng đường (làm tròn đến hàng phần mười của cm) mà đầu kim phút di chuyển được trong $20$ phút.],
    [31,4],
    loigiai: [
        Trong $60$ phút, kim phút quay được $1$ vòng, tức là một góc $2pi$ radian.
        
        Trong $20$ phút, kim phút quay được một góc là $alpha = (20 / 60) dot 2pi = (2pi)/3$ (radian).
        
        Quãng đường đầu kim phút di chuyển là chiều dài cung tròn: $l = R alpha = 15 dot (2pi)/3 = 10pi approx 31,4 " cm"$.
    ]
)

// TLN 2
#tln([Huyết áp của một người được đo đạc và có thể mô hình hoá bởi hàm số $p(t) = 120 + 20 cos(150pi t)$, trong đó $p(t)$ là huyết áp tính bằng mmHg và $t$ là thời gian tính bằng phút. Biết nhịp tim của người này được tính là số chu kì của hàm số trong một phút. Tính nhịp tim của người đó (nhịp/phút).],
    [75],
    loigiai: [
        Chu kì của hàm số $p(t)$ là $T = (2pi) / 150pi = 1/75$ (phút).
        
        Số chu kì trong một phút, tức là nhịp tim, là $1 / T = 75$ (nhịp/phút).
    ]
)

// TLN 3
#tln([Mực nước cao nhất tại một cảng biển được mô phỏng bởi $h(t) = 2 cos((pi t)/6) + 12$ (mét), với $t$ là thời gian tính bằng giờ sau nửa đêm ($0 <= t <= 24$). Tổng số giờ trong một ngày đêm mà mực nước cao hơn $13$ mét là bao nhiêu?],
    [8],
    loigiai: [
        Yêu cầu bài toán: 
        $
          h(t) > 13 <=> 2 cos((pi t)/6) + 12 > 13 <=> cos((pi t)/6) > 1/2
        $
.
        
        Do $t in [0; 24]$ nên $(pi t)/6 in [0; 4pi]$.
        
        Bất phương trình $cos X > 1/2$ có nghiệm trên chu kì $[0; 2pi]$ là $X in [0; pi/3)$ hoặc $X in ((5pi)/3; 2pi]$.
        
        Vậy $(pi t)/6 in [0; pi/3)$ suy ra $t in [0; 2)$.
        Và $(pi t)/6 in ((5pi)/3; (7pi)/3)$ suy ra $t in (10; 14)$.
        Và $(pi t)/6 in ((11pi)/3; 4pi]$ suy ra $t in (22; 24]$.
        
        Tổng thời gian là: $2 + (14 - 10) + (24 - 22) = 2 + 4 + 2 = 8$ (giờ).
    ]
)

// TLN 4
#tln([Một vòng quay Mặt Trời có đường kính $60 " m"$ và điểm thấp nhất của cabin cách mặt đất $2 " m"$. Nó quay với tốc độ không đổi và mất $20$ phút để đi hết một vòng. Giả sử tại thời điểm $t = 0$, cabin đang ở vị trí thấp nhất. Khoảng thời gian ngắn nhất (tính bằng phút) để cabin đạt độ cao $47 " m"$ so với mặt đất là bao nhiêu?],
    [6,7],
    loigiai: [
        Bán kính vòng quay là $R = 30 " m"$. Tâm vòng quay cách mặt đất là $30 + 2 = 32 " m"$.
        
        Tần số góc $omega = (2pi) / 20 = pi/10 \ ("rad/phút")$.
        
        Độ cao cabin tại thời điểm $t$ là $h(t) = -30 cos((pi t)/10) + 32$.
        
        Ta cần 
        $
          h(t) = 47 <=> -30 cos((pi t)/10) + 32 = 47 <=> cos((pi t)/10) = -15/30 = -1/2
        $
.
        
        Nghiệm dương nhỏ nhất là 
        $
          (pi t)/10 = (2pi)/3 => t = 20/3 approx 6,7
        $
 (phút).
    ]
)

// TLN 5
#tln([Có bao nhiêu giá trị nguyên của tham số $m$ để phương trình $5 cos x - m = 0$ có nghiệm?],
    [11],
    loigiai: [
        Phương trình tương đương $cos x = m / 5$.
        
        Để phương trình có nghiệm thì 
        $
          -1 <= m / 5 <= 1 <=> -5 <= m <= 5
        $
.
        
        Vì $m in ZZ$ nên $m in {-5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5}$.
        
        Vậy có $11$ giá trị nguyên của tham số $m$.
    ]
)

// TLN 6
#tln([Biết tập nghiệm của phương trình $cos(2x) - sin x = 0$ trên đoạn $[0; pi]$ là tập $S$. Tính tổng các phần tử của tập hợp $S$ (làm tròn đến $2$ chữ số thập phân, lấy $pi approx 3.14$).],
    [3,14],
    loigiai: [
        Phương trình tương đương: 
        $
          1 - 2 sin^2 x - sin x = 0 <=> 2 sin^2 x + sin x - 1 = 0 <=> sin x = 1/2
        $
 hoặc $sin x = -1$.
        
        Trường hợp 1: 
        $
          sin x = 1/2 <=> x = pi/6 + k 2pi
        $
 hoặc $x = (5pi)/6 + k 2pi$. 
        Trên $[0; pi]$, có các nghiệm $x_1 = pi/6$, $x_2 = (5pi)/6$.
        
        Trường hợp 2: 
        $
          sin x = -1 <=> x = -pi/2 + k 2pi
        $
. Không có nghiệm nào thuộc đoạn $[0; pi]$.
        
        Tập $S = {pi/6; (5pi)/6}$. 
        
        Tổng các phần tử là $pi/6 + (5pi)/6 = pi approx 3,14$.
    ]
)


]

#make-questions()
