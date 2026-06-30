#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// HÌNH VẼ MINH HỌA (CETZ)
// ═══════════════════════════════════════════════════════════

// Hình 1: Bình chứa thoát nước (Hình nón/hình trụ)
#let fig-container-drain = canvas(length: 1cm, {
  import draw: *
  line((-1.5, 3.0), (-0.3, 0.3), stroke: 1.2pt + black)
  line((1.5, 3.0), (0.3, 0.3), stroke: 1.2pt + black)
  line((-0.3, 0.3), (-0.3, -0.2), stroke: 1.2pt + black)
  line((0.3, 0.3), (0.3, -0.2), stroke: 1.2pt + black)
  
  // Mặt nước
  circle((0, 2.0), radius: (1.0, 0.2), stroke: 1pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(80%))
  
  // Dòng nước chảy ra
  line((0, -0.2), (0, -1.2), stroke: (dash: "dashed", paint: rgb("#0057b8"), thickness: 1.5pt))
})

// Hình 2: Tối ưu hóa lợi nhuận trong kinh tế
#let fig-profit-optimization = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.5), stroke: 1.2pt + black)
  content((4.3, -0.3), [$x$])
  content((-0.4, 3.3), [$y$])
  
  // Doanh thu R(x)
  let ptsR = ()
  for i in range(41) {
    let x = i * 0.1
    let y = 2.8 * (x/4.0)
    ptsR.push((x, y))
  }
  line(..ptsR, stroke: 1.5pt + rgb("#1a7a2e"))
  content((3.5, 2.7), [$R(x)$])
  
  // Chi phí C(x)
  let ptsC = ()
  for i in range(41) {
    let x = i * 0.1
    let y = 0.6 + 0.15 * x * x
    ptsC.push((x, y))
  }
  line(..ptsC, stroke: 1.5pt + rgb("#cc2200"))
  content((3.8, 2.3), [$C(x)$])
})

// Hình 3: Cơ cấu cam cơ khí (Cam & Follower)
#let fig-cam-follower = canvas(length: 1cm, {
  import draw: *
  // Đĩa cam elip xoay
  circle((0, 0), radius: (1.5, 0.9), stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(85%))
  circle((0, 0), radius: 3pt, fill: black)
  
  // Con lăn và thanh truyền
  circle((0, 0.9), radius: 5pt, fill: rgb("#e67e22"), stroke: 1pt + black)
  rect((-0.2, 0.9), (0.2, 3.0), stroke: 1.2pt + black, fill: gray.lighten(80%))
})

// Hình 4: Gương phản xạ Parabol
#let fig-lens-reflection = canvas(length: 1cm, {
  import draw: *
  line((-2.5, 0), (2.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  content((2.3, -0.3), [$x$])
  content((-0.3, 2.8), [$y$])
  
  let pts = ()
  for i in range(41) {
    let x = (i - 20) * 0.1
    let y = 0.4 * x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#0057b8"))
  
  // Tiếp tuyến tại x = 1.5, y = 0.9, k = 1.2
  line((0.3, -0.54), (2.3, 1.86), stroke: 1.2pt + rgb("#cc2200"))
  circle((1.5, 0.9), radius: 3pt, fill: rgb("#cc2200"))
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  subject: "TOÁN - LỚP 11",
  school: "ÔN TẬP CHƯƠNG ĐẠO HÀM",
  exam-title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 03)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Tính đạo hàm của hàm số đa thức $y = x^4 - 4x^2 + 3$.],
    (
        [$y' = 4x^3 - 8$],
        True([$y' = 4x^3 - 8x$]),
        [$y' = x^3 - 8x$],
        [$y' = 4x^3 - 4x$]
    ),
    loigiai: [
        Áp dụng quy tắc đạo hàm hàm đa thức:
        $ y' = (x^4)' - 4(x^2)' + (3)' = 4x^3 - 8x $.
        Chọn đáp án B.
    ]
)

// TN 2
#tn([Phương trình tiếp tuyến của đồ thị hàm số $y = x^3 - 3x$ tại điểm $M(2; 2)$ là:],
    (
        [$y = 9x - 18$],
        True([$y = 9x - 16$]),
        [$y = 9x + 16$],
        [$y = 3x - 4$]
    ),
    loigiai: [
        - Đạo hàm $y' = 3x^2 - 3 ==> y'(2) = 3 dot 2^2 - 3 = 9$.
        - Phương trình tiếp tuyến tại $M(2; 2)$ là:
          $ y = 9(x - 2) + 2 <==> y = 9x - 16 $.
        Chọn đáp án B.
    ]
)

// TN 3
#tn([Thể tích nước còn lại trong một bình chứa hình nón (như hình vẽ minh họa bên dưới) đang xả nước được cho bởi $V(t) = 100 - 4t - t^2$ (lít), với $t$ tính bằng phút ($0 <= t <= 8$). Tốc độ xả nước tức thời tại thời điểm $t = 3$ phút là bao nhiêu lít/phút?],
    (
        [$6" lít/phút"$],
        True([$10" lít/phút"$]),
        [$12" lít/phút"$],
        [$16" lít/phút"$]
    ),
    fig: fig-container-drain,
    fig-width: 22%,
    loigiai: [
        - Tốc độ thay đổi thể tích tức thời là đạo hàm $V'(t) = -4 - 2t$.
        - Tại $t = 3 ==> V'(3) = -4 - 2(3) = -10$ lít/phút.
        - Vậy tốc độ xả nước tức thời là $10$ lít/phút.
        Chọn đáp án B.
    ]
)

// TN 4
#tn([Doanh thu $R(x)$ và chi phí $C(x)$ (đơn vị: triệu đồng) khi sản xuất và bán $x$ sản phẩm được mô hình hóa bởi $R(x) = 120x - 0.5x^2$ và $C(x) = 20x + 300$ (như hình vẽ bên dưới). Lợi nhuận biên $P'(x) = 0$ tại mức sản lượng $x$ bằng bao nhiêu sản phẩm?],
    (
        [$x = 50$],
        True([$x = 100$]),
        [$x = 120$],
        [$x = 150$]
    ),
    fig: fig-profit-optimization,
    fig-width: 28%,
    loigiai: [
        - Hàm lợi nhuận là $P(x) = R(x) - C(x) = (120x - 0.5x^2) - (20x + 300) = -0.5x^2 + 100x - 300$.
        - Lợi nhuận biên là $P'(x) = -x + 100$.
        - Cho $P'(x) = 0 <==> -x + 100 = 0 <==> x = 100$ sản phẩm.
        Chọn đáp án B.
    ]
)

// TN 5
#tn([Tính đạo hàm của hàm số lượng giác $y = tan(2x)$ (với $x neq pi/4 + k pi/2$).],
    (
        [$y' = (1)/(cos^2(2x))$],
        True([$y' = (2)/(cos^2(2x))$]),
        [$y' = (-2)/(cos^2(2x))$],
        [$y' = (2)/(sin^2(2x))$]
    ),
    loigiai: [
        Áp dụng công thức đạo hàm hàm hợp lượng giác $(tan u)' = (u')/(cos^2 u)$:
        $ y' = (2x)'/(cos^2(2x)) = (2)/(cos^2(2x)) $.
        Chọn đáp án B.
    ]
)

// TN 6
#tn([Một vật chuyển động theo phương trình $s(t) = t^3 - 6t^2 + 9t$ (m), $t >= 0$ (giây). Gia tốc tức thời của vật tại thời điểm $t = 4$ giây bằng bao nhiêu $m/s^2$?],
    (
        [$6" m/s"^2$],
        True([$12" m/s"^2$]),
        [$18" m/s"^2$],
        [$24" m/s"^2$]
    ),
    loigiai: [
        - Vận tốc tức thời: $v(t) = s'(t) = 3t^2 - 12t + 9$.
        - Gia tốc tức thời: $a(t) = v'(t) = 6t - 12$.
        - Tại $t = 4 ==> a(4) = 6(4) - 12 = 12" m/s"^2$.
        Chọn đáp án B.
    ]
)

// TN 7
#tn([Tiếp tuyến của đồ thị hàm số $y = (x - 1)/(x + 1)$ vuông góc với đường thẳng $d: y = -2x + 3$ có hệ số góc $k$ bằng:],
    (
        [$k = 2$],
        True([$k = 1/2$]),
        [$k = -1/2$],
        [$k = -2$]
    ),
    loigiai: [
        Vì tiếp tuyến vuông góc với đường thẳng $d$ có hệ số góc $k_d = -2$ nên hệ số góc $k$ của tiếp tuyến thỏa mãn:
        $ k dot (-2) = -1 <==> k = 1/2 $.
        Chọn đáp án B.
    ]
)

// TN 8
#tn([Độ nâng $y$ (mm) của một con lăn trong cơ cấu cam cơ khí xoay đệ quy (như hình vẽ bên dưới) theo thời gian $t$ (giây) là $y(t) = 5 + 3 sin(10t)$. Tốc độ nâng cực đại của con lăn bằng bao nhiêu mm/s?],
    (
        [$15" mm/s"$],
        True([$30" mm/s"$]),
        [$50" mm/s"$],
        [$3" mm/s"$]
    ),
    fig: fig-cam-follower,
    fig-width: 22%,
    loigiai: [
        - Vận tốc nâng tức thời của con lăn là $v(t) = y'(t) = 3 dot 10 cos(10t) = 30 cos(10t)$ (mm/s).
        - Tốc độ nâng cực đại là giá trị lớn nhất của $|v(t)|$, tức là $30" mm/s"$.
        Chọn đáp án B.
    ]
)

// TN 9
#tn([Cho hàm số $f(x) = (2x + 1)/(x - 1)$. Giá trị đạo hàm $f'(0)$ bằng bao nhiêu?],
    (
        [$3$],
        True([$-3$]),
        [$1$],
        [$-1$]
    ),
    loigiai: [
        - Đạo hàm $f'(x) = (2(-1) - 1(1))/((x - 1)^2) = (-3)/((x - 1)^2)$.
        - Thay $x = 0 ==> f'(0) = (-3)/((0 - 1)^2) = -3$.
        Chọn đáp án B.
    ]
)

// TN 10
#tn([Cho đồ thị hàm số $y = x^3 - 3x^2 + 1$. Đồ thị có hai tiếp tuyến cùng song song với đường thẳng $y = 9x + 2$. Tung độ của hai tiếp điểm tương ứng lần lượt là bao nhiêu?],
    (
        [$-1$ và $3$],
        True([$-3$ và $1$]),
        [$1$ và $9$],
        [$-3$ và $9$]
    ),
    loigiai: [
        - Ta có $y' = 3x^2 - 6x$.
        - Tiếp tuyến song song với $y = 9x + 2 ==> 3x^2 - 6x = 9 <==> x^2 - 2x - 3 = 0 <==> x = -1$ hoặc $x = 3$.
        - Tại $x_1 = -1 ==> y_1 = (-1)^3 - 3(-1)^2 + 1 = -3$.
        - Tại $x_2 = 3 ==> y_2 = 3^3 - 3(3^2) + 1 = 1$.
        - Vậy tung độ hai tiếp điểm là $-3$ và $1$.
        Chọn đáp án B.
    ]
)

// TN 11
#tn([Trong một thiết bị quang học, mặt phản xạ gương có dạng một parabol $y = 0.25 x^2$ (như hình vẽ bên dưới). Tiếp tuyến của mặt gương tại điểm có hoành độ $x_0 = 2$ tạo với trục hoành một góc bằng bao nhiêu độ?],
    (
        [$30^°$],
        True([$45^°$]),
        [$60^°$],
        [$75^°$]
    ),
    fig: fig-lens-reflection,
    fig-width: 30%,
    loigiai: [
        - Đạo hàm $y' = 0.5 x$.
        - Hệ số góc tiếp tuyến tại $x_0 = 2$ là $k = y'(2) = 0.5 dot 2 = 1$.
        - Vì $tan alpha = 1 ==> alpha = 45^°$.
        Chọn đáp án B.
    ]
)

// TN 12
#tn([Cho hàm số $f(x) = x^4 - 6x^2 + 5$. Tập nghiệm của bất phương trình $f''(x) > 0$ là:],
    (
        [$(-1; 1)$],
        True([$(-oo; -1) union (1; +oo)$]),
        [$(-oo; -sqrt(3)) union (sqrt(3); +oo)$],
        [$(-sqrt(3); sqrt(3))$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 4x^3 - 12x$.
        - Đạo hàm cấp hai: $f''(x) = 12x^2 - 12$.
        - Bất phương trình $f''(x) > 0 <==> 12x^2 - 12 > 0 <==> x^2 > 1 <==> x < -1$ hoặc $x > 1$.
        - Tập nghiệm là $(-oo; -1) union (1; +oo)$.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một bình chứa nước hình nón đang xả nước ra ngoài qua một lỗ hở ở đáy (như hình vẽ minh họa bên dưới). Thể tích nước còn lại trong bình sau $t$ phút được mô hình hóa bởi $V(t) = (10 - 0.5t)^2 = 100 - 10t + 0.25t^2$ (lít), với $0 <= t <= 20$. Các phát biểu sau đúng hay sai?],
    (
        True([Ban đầu khi chưa xả nước ($t = 0$), trong bình chứa $100$ lít nước.]),
        True([Tốc độ xả nước tức thời tại thời điểm $t$ là $|V'(t)| = 10 - 0.5t$ (lít/phút).]),
        False([Tại thời điểm $t = 10$ phút, tốc độ xả nước tức thời bằng $10$ lít/phút.]),
        True([Tốc độ xả nước giảm dần theo thời gian và bằng $0$ khi nước trong bình chảy hết ($t = 20$).])
    ),
    fig: fig-container-drain,
    fig-width: 22%,
    loigiai: [
        - *a)* Đúng. Thay $t = 0 ==> V(0) = 100$ lít.
        - *b)* Đúng. Đạo hàm $V'(t) = -10 + 0.5t = -(10 - 0.5t)$. Tốc độ xả nước tức thời là độ lớn $|V'(t)| = 10 - 0.5t$ lít/phút.
        - *c)* Sai. Tại $t = 10 ==> |V'(10)| = 10 - 0.5(10) = 5$ lít/phút (chứ không phải 10 lít/phút).
        - *d)* Đúng. Khi $t = 20 ==> V(20) = 0$ (hết nước) và tốc độ xả $|V'(20)| = 10 - 0.5(20) = 0$ lít/phút.
    ]
)

// DS 2
#ds([Một doanh nghiệp sản xuất độc quyền một loại thiết bị công nghệ. Tổng doanh thu và tổng chi phí (đơn vị: triệu đồng) khi sản xuất và bán $x$ sản phẩm ($x > 0$) được mô hình hóa lần lượt bởi $R(x) = 200x - x^2$ và $C(x) = x^2 + 40x + 500$ (như đồ thị bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Hàm lợi nhuận của doanh nghiệp là $P(x) = -2x^2 + 160x - 500$ (triệu đồng).]),
        True([Lợi nhuận biên tại mức sản lượng $x$ là $P'(x) = -4x + 160$.]),
        False([Doanh nghiệp đạt lợi nhuận lớn nhất khi sản xuất và bán $x = 80$ sản phẩm.]),
        True([Khi lợi nhuận đạt giá trị lớn nhất, doanh thu biên $R'(x)$ và chi phí biên $C'(x)$ bằng nhau và cùng bằng $120$ triệu đồng/sản phẩm.])
    ),
    fig: fig-profit-optimization,
    fig-width: 28%,
    loigiai: [
        - *a)* Đúng. $P(x) = R(x) - C(x) = (200x - x^2) - (x^2 + 40x + 500) = -2x^2 + 160x - 500$.
        - *b)* Đúng. Đạo hàm $P'(x) = -4x + 160$.
        - *c)* Sai. Lợi nhuận cực đại khi $P'(x) = 0 <==> -4x + 160 = 0 <==> x = 40$ sản phẩm (chứ không phải 80 sản phẩm).
        - *d)* Đúng. Tại $x = 40$, ta có $R'(40) = 200 - 2(40) = 120$ và $C'(40) = 2(40) + 40 = 120$ triệu đồng/sản phẩm.
    ]
)

// DS 3
#ds([Trong một cỗ máy cơ khí, độ nâng $y$ (cm) của con lăn trong cơ cấu cam đĩa (như hình vẽ bên dưới) phụ thuộc vào thời gian $t$ (giây) theo công thức $y(t) = 4 + 2 cos(5t)$. Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc nâng tức thời của con lăn là $v(t) = -10 sin(5t)$ (cm/s).]),
        True([Tốc độ nâng cực đại của con lăn trong quá trình chuyển động bằng $10$ cm/s.]),
        False([Gia tốc tức thời của con lăn tại thời điểm $t = 0$ bằng $0" cm/s"^2$.]),
        True([Khi con lăn ở vị trí cao nhất ($y = 6$ cm), vận tốc nâng tức thời của nó bằng $0$.])
    ),
    fig: fig-cam-follower,
    fig-width: 22%,
    loigiai: [
        - *a)* Đúng. Vận tốc $v(t) = y'(t) = 2 dot (-5 sin 5t) = -10 sin 5t$ cm/s.
        - *b)* Đúng. Tốc độ nâng là $|v(t)| = 10 |sin 5t| <= 10 ==>$ Cực đại bằng 10 cm/s.
        - *c)* Sai. Gia tốc $a(t) = v'(t) = -50 cos 5t$. Tại $t = 0 ==> a(0) = -50" cm/s"^2 neq 0$.
        - *d)* Đúng. Khi con lăn cao nhất $y = 6 <==> 4 + 2 cos 5t = 6 <==> cos 5t = 1 ==> sin 5t = 0 ==> v = 0$.
    ]
)

// DS 4
#ds([Một gương phản xạ trong đèn pha ô tô có mặt cắt là một parabol $(P): y = 0.1 x^2$ (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm $y' = 0.2x$ biểu diễn hệ số góc của tiếp tuyến tại điểm có hoành độ $x$ trên mặt gương.]),
        True([Phương trình tiếp tuyến của mặt gương tại điểm $M(5; 2.5)$ là $y = x - 2.5$.]),
        False([Tiếp tuyến của mặt gương tại điểm $M(5; 2.5)$ tạo với trục hoành $O x$ một góc $60^°$.]),
        True([Tiếp tuyến tại $M(5; 2.5)$ cắt trục hoành tại điểm $A(2.5; 0)$ và cắt trục tung tại $B(0; -2.5)$.])
    ),
    fig: fig-lens-reflection,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. $y' = (0.1 x^2)' = 0.2 x$.
        - *b)* Đúng. Tại $M(5; 2.5)$, $y'(5) = 1$. PTTT là $y = 1(x - 5) + 2.5 <==> y = x - 2.5$.
        - *c)* Sai. Vì hệ số góc tiếp tuyến $k = 1 ==> tan alpha = 1 ==> alpha = 45^°$ (chứ không phải $60^°$).
        - *d)* Đúng. Giao với $O x$ ($y=0 ==> x = 2.5$), giao với $O y$ ($x=0 ==> y = -2.5$).
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#tln([Cho hàm số $f(x) = (2x - 1)/(x + 2)$. Tính giá trị của đạo hàm $f'(1)$ (làm tròn kết quả đến hai chữ số thập phân).],
    [0.56],
    loigiai: [
        - Đạo hàm $f'(x) = (2(2) - (-1)(1))/((x + 2)^2) = (5)/((x + 2)^2)$.
        - Thay $x = 1 ==> f'(1) = (5)/(3^2) = (5)/(9) approx 0.56$.
        Đáp số: $0.56$.
    ]
)

// TLN 2
#tln([Vận tốc của một vật rơi tự do có sức cản không khí biến thiên theo thời gian $t$ (giây) theo công thức $v(t) = 50(1 - e^(-0.2t))$ (m/s). Tính gia tốc của vật tại thời điểm $t = 5$ giây (tính bằng $m/s^2$, làm tròn đến hai chữ số thập phân).],
    [3.68],
    loigiai: [
        - Gia tốc tức thời là đạo hàm của vận tốc: $a(t) = v'(t) = 50 dot (-(-0.2) e^(-0.2t)) = 10 e^(-0.2t)" (m/s"^2")"$.
        - Tại $t = 5 ==> a(5) = 10 e^(-1) = (10)/(e) approx 3.68" m/s"^2$.
        Đáp số: $3.68$.
    ]
)

// TLN 3
#tln([Cho đồ thị hàm số $y = x^3 - 3x^2 + 2$. Biết rằng có hai tiếp tuyến của đồ thị đi qua điểm $K(0; 2)$. Tính tổng hệ số góc $k_1 + k_2$ của hai tiếp tuyến đó.],
    [-2.25],
    loigiai: [
        - Đường thẳng qua $K(0; 2)$ có dạng $y = k x + 2$.
        - Điều kiện tiếp xúc: $x^3 - 3x^2 + 2 = k x + 2$ và $3x^2 - 6x = k$.
        - Thế $k$: $x^3 - 3x^2 = (3x^2 - 6x)x <==> x^3 - 3x^2 = 3x^3 - 6x^2 <==> 2x^3 - 3x^2 = 0 <==> x = 0$ hoặc $x = 1.5$.
        - Với $x_1 = 0 ==> k_1 = 3(0)^2 - 6(0) = 0$.
        - Với $x_2 = 1.5 ==> k_2 = 3(1.5)^2 - 6(1.5) = 6.75 - 9 = -2.25$.
        - Tổng hệ số góc $k_1 + k_2 = 0 + (-2.25) = -2.25$.
        Đáp số: $-2.25$.
    ]
)

// TLN 4
#tln([Cho hàm số $y = x^4 - 2x^2 + 3$. Tiếp tuyến của đồ thị hàm số tại các điểm cực tiểu cắt trục tung $O y$ tại điểm có tung độ bằng bao nhiêu?],
    [2],
    loigiai: [
        - Ta có $y' = 4x^3 - 4x = 4x(x^2 - 1) = 0 <==> x = 0$ hoặc $x = pm 1$.
        - Các điểm cực tiểu có hoành độ $x = pm 1$, tung độ $y(pm 1) = 1 - 2 + 3 = 2$.
        - Tại các điểm cực tiểu, tiếp tuyến nằm ngang có hệ số góc $k = 0 ==>$ Phương trình tiếp tuyến là $y = 2$.
        - Tiếp tuyến cắt trục $O y$ tại điểm có tung độ bằng $2$.
        Đáp số: $2$.
    ]
)

// TLN 5
#tln([Một quần thể vi khuẩn nhân đôi phát triển theo công thức $P(t) = 100 dot 2^(0.5t)$, trong đó $t$ tính bằng giờ. Tính tốc độ sinh trưởng tức thời của quần thể vi khuẩn tại thời điểm $t = 4$ giờ (tính bằng con/giờ, làm tròn đến hai chữ số thập phân).],
    [138.63],
    loigiai: [
        - Tốc độ sinh trưởng tức thời là đạo hàm $P'(t) = 100 dot 2^(0.5t) dot 0.5 ln 2 = 50 ln 2 dot 2^(0.5t)$.
        - Tại $t = 4 ==> P'(4) = 50 ln 2 dot 2^2 = 200 ln 2 approx 138.63$ con/giờ.
        Đáp số: $138.63$.
    ]
)

// TLN 6
#tln([Cho parabol $(P): y = x^2$. Tiếp tuyến của $(P)$ tại điểm có hoành độ $x_0 > 0$ cắt hai trục tọa độ $O x, O y$ lần lượt tại hai điểm $A, B$ sao cho diện tích tam giác vuông $O A B$ bằng $16$. Tìm giá trị của $x_0$.],
    [4],
    loigiai: [
        - Đạo hàm $y' = 2x ==>$ Hệ số góc tại $x_0$ là $k = 2x_0$.
        - Tung độ tiếp điểm $y_0 = x_0^2 ==>$ Phương trình tiếp tuyến là $y = 2x_0(x - x_0) + x_0^2 = 2x_0 x - x_0^2$.
        - Giao điểm với $O x$ ($y=0$): $2x_0 x = x_0^2 <==> x = x_0/2 ==> A(x_0/2; 0) ==> O A = x_0/2$.
        - Giao điểm với $O y$ ($x=0$): $y = -x_0^2 ==> B(0; -x_0^2) ==> O B = x_0^2$.
        - Diện tích tam giác $O A B$: $S = 1/2 O A dot O B = 1/2 (x_0/2) (x_0^2) = (x_0^3)/(4) = 16 <==> x_0^3 = 64 <==> x_0 = 4$.
        Đáp số: $4$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
