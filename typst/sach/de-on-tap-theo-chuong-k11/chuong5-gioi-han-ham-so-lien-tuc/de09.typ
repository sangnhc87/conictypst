#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2": canvas, draw
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)
#show math.frac: math.display

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// ĐỊNH NGHĨA CÁC HÌNH VẼ MINH HỌA (CETZ)
// ═══════════════════════════════════════════════════════════

// Hình 1: Đồ thị hàm tăng trưởng Logistic
#let fig-logistic = canvas(length: 1cm, {
  import draw: *
  // Tiệm cận ngang
  line((0, 3), (6, 3), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 3.3), [K = Giới hạn])
  
  // Đường cong tăng trưởng tảo/cá
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 3 / (1 + 3 * calc.exp(-t))
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#1a7a2e"))
  
  // Trục tọa độ
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.5), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.8), [P])
})

// Hình 2: Đồ thị vận tốc nhảy dù rơi tự do
#let fig-terminal-velocity = canvas(length: 1cm, {
  import draw: *
  line((0, 2.5), (6, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.0, 2.8), [v = 50 m/s])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 2.5 * (1 - calc.exp(-0.7 * t))
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#cc2200"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.3), [v])
})

// Hình 3: Sơ đồ mạch điện nạp tụ RC
#let fig-capacitor = canvas(length: 0.8cm, {
  import draw: *
  circle((0, 2), radius: 0.5, stroke: 1.2pt + black)
  line((0, 1.5), (0, 0), stroke: 1.2pt + black)
  line((0, 2.5), (0, 3.5), stroke: 1.2pt + black)
  content((0, 2), [U])
  
  line((0, 3.5), (1, 3.5), stroke: 1.2pt + black)
  line((1, 3.5), (1.5, 4.0), stroke: 1.2pt + black) 
  circle((1, 3.5), radius: 1.5pt, fill: black)
  circle((1.8, 3.5), radius: 1.5pt, fill: black)
  line((1.8, 3.5), (3, 3.5), stroke: 1.2pt + black)
  
  rect((3, 3.2), (4.5, 3.8), stroke: 1.2pt + black, fill: rgb("#fff2cc"))
  content((3.75, 4.1), [R])
  line((4.5, 3.5), (5.5, 3.5), stroke: 1.2pt + black)
  
  line((5.5, 3.5), (5.5, 2.2), stroke: 1.2pt + black)
  line((5.5, 1.8), (5.5, 0), stroke: 1.2pt + black)
  line((5.1, 2.2), (5.9, 2.2), stroke: 2pt + rgb("#0057b8"))
  line((5.1, 1.8), (5.9, 1.8), stroke: 2pt + rgb("#0057b8"))
  content((6.3, 2.0), [C])
  
  line((5.5, 0), (0, 0), stroke: 1.2pt + black)
})

// Hình 4: Nồng độ phản ứng hóa học hóa học
#let fig-chem = canvas(length: 1cm, {
  import draw: *
  line((0, 2), (6, 2), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.0, 2.3), [C = 0.4 mol/l])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 2 * t / (t + 1.2)
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#e67e22"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,2.5), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 2.8), [C])
})

// Hình 5: Hàm chi phí trung bình trong kinh tế
#let fig-average-cost = canvas(length: 1cm, {
  import draw: *
  line((0.5, 1.2), (6, 1.2), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 1.5), [y = Tiệm cận])
  
  let pts = range(10, 60).map(i => {
    let x = i * 0.1
    let y = 1.2 + 1.5 / x
    (x, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#9b59b6"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.5), stroke: 1.2pt + black)
  content((6.2, 0), [x])
  content((0, 3.8), [A])
})

// Hình 6: Đồ thị ghép lãi kép n lần tiến về liên tục
#let fig-compounding = canvas(length: 1cm, {
  import draw: *
  rect((0.5, 0), (1.2, 1.8), fill: rgb("#0057b8").lighten(50%))
  content((0.85, -0.3), [Hàng năm])
  
  rect((1.8, 0), (2.5, 2.1), fill: rgb("#0057b8").lighten(30%))
  content((2.15, -0.3), [Bán niên])
  
  rect((3.1, 0), (3.8, 2.3), fill: rgb("#0057b8").lighten(10%))
  content((3.45, -0.3), [Hàng quý])
  
  rect((4.4, 0), (5.1, 2.45), fill: rgb("#cc2200"))
  content((4.75, -0.3), [Liên tục])
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3), stroke: 1.2pt + black)
  content((0, 3.3), [Số tiền])
})

// Hình 7: Thiết kế đường cong kết nối chuyển tiếp giao thông
#let fig-highway = canvas(length: 1cm, {
  import draw: *
  line((-2, 1), (0, 1), stroke: 2.5pt + gray)
  
  let pts = range(40).map(i => {
    let x = i * 0.1
    let y = 1 + 0.12 * x * x
    (x, y)
  })
  line(..pts, stroke: 2.5pt + rgb("#d35400"))
  
  circle((0, 1), radius: 3pt, fill: black)
  content((0, 1.4), [Điểm nối])
})

// Hình 8: Biểu đồ nhiệt độ theo độ cao khí quyển
#let fig-atmosphere = canvas(length: 1cm, {
  import draw: *
  line((0,0), (0,4), stroke: 1.2pt + black)
  line((0,0), (5,0), stroke: 1.2pt + black)
  
  let p0 = (0, 3) 
  let p1 = (2.2, 1) 
  let p2 = (4, 1) 
  
  line(p0, p1, stroke: 1.8pt + rgb("#0057b8"))
  line(p1, p2, stroke: 1.8pt + rgb("#cc2200"))
  
  circle(p0, radius: 2.5pt, fill: black)
  circle(p1, radius: 2.5pt, fill: black)
  circle(p2, radius: 2.5pt, fill: black)
  
  content((0, -0.3), [0])
  content((2.2, -0.3), [11])
  content((4, -0.3), [20 (km)])
})

// Hình 9: Đồ thị làm nguội kim loại theo thời gian
#let fig-cooling = canvas(length: 1cm, {
  import draw: *
  line((0, 1.2), (6, 1.2), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 1.5), [T = 25°C])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 1.2 + 2.5 * calc.exp(-0.8 * t)
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#3498db"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,4), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 4.3), [T])
})

// Hình 10: Sự giảm cường độ ánh sáng dưới lòng đại dương
#let fig-light = canvas(length: 1cm, {
  import draw: *
  line((-1, 3.2), (6, 3.2), stroke: 1.5pt + rgb("#3498db"))
  
  let pts = range(60).map(i => {
    let d = i * 0.1
    let y = 3.2 * calc.exp(-0.6 * d)
    (d, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#f1c40f"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.6), stroke: 1.2pt + black)
  content((6.2, 0), [d])
  content((0, 3.9), [I])
})

// Hình 11: Đường cong học tập của nhân viên
#let fig-learning = canvas(length: 1cm, {
  import draw: *
  line((0, 2.6), (6, 2.6), stroke: (dash: "dashed", paint: gray, thickness: 1pt))
  content((5.2, 2.9), [N = Năng suất tối đa])
  
  let pts = range(60).map(i => {
    let t = i * 0.1
    let y = 2.6 * t / (t + 1)
    (t, y)
  })
  line(..pts, stroke: 1.8pt + rgb("#2ecc71"))
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,3.2), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 3.5), [N])
})

// Hình 12: Đồ thị hàm số ghép liên tục của cảm biến đo nhiệt độ
#let fig-sensor = canvas(length: 1cm, {
  import draw: *
  let p0 = (0, 0.6)
  let p1 = (2.5, 2.1)
  let p2 = (5.5, 3.6)
  
  line(p0, p1, stroke: 1.8pt + rgb("#0057b8"))
  line(p1, p2, stroke: 1.8pt + rgb("#cc2200"))
  
  circle(p1, radius: 3pt, fill: black)
  content((2.5, 2.4), [Điểm kết nối])
  
  line((0,0), (6,0), stroke: 1.2pt + black)
  line((0,0), (0,4), stroke: 1.2pt + black)
  content((6.2, 0), [t])
  content((0, 4.3), [T])
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 5",
  exam-title: "CHƯƠNG V. GIỚI HẠN. HÀM SỐ LIÊN TỤC (ĐỀ SỐ 09)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một quần thể cá trong hồ nước được mô tả sinh trưởng theo mô hình tăng trưởng giới hạn (mô hình tăng trưởng Logistic): $P(t) = (2000)/(1 + 3 e^(-0.2 t))$ (con) sau $t$ tháng nuôi thả. Số lượng cá tối đa mà hồ nước có thể duy trì nuôi dưỡng lâu dài (giới hạn sức chứa $K$ khi $t -> +oo$) là bao nhiêu?],
    (
        [$500$ con.],
        [$1000$ con.],
        True([$2000$ con.]),
        [$6000$ con.]
    ),
    fig: fig-logistic,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Ta tìm giới hạn của quần thể cá khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (2000)/(1 + 3 e^(-0.2 t)) $.
        Vì $limits(lim)_(t -> +oo) e^(-0.2 t) = 0$ nên:
        $ limits(lim)_(t -> +oo) P(t) = (2000)/(1 + 3 dot 0) = 2000 $ con.
    ]
)

// TN 2
#tn([Vận tốc $v(t)$ (m/s) của một người nhảy dù rơi tự do trong không khí có lực cản sau $t$ giây được cho bởi công thức: $v(t) = 50 (1 - e^(-0.15 t))$. Tính vận tốc rơi cực hạn (giới hạn vận tốc khi thời gian rơi kéo dài vô hạn) của người nhảy dù đó.],
    (
        [$35$ m/s.],
        True([$50$ m/s.]),
        [$75$ m/s.],
        [$150$ m/s.]
    ),
    fig: fig-terminal-velocity,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Vận tốc rơi cực hạn là giới hạn của vận tốc khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) v(t) = limits(lim)_(t -> +oo) 50 (1 - e^(-0.15 t)) $.
        Vì $limits(lim)_(t -> +oo) e^(-0.15 t) = 0$ nên:
        $ limits(lim)_(t -> +oo) v(t) = 50 dot (1 - 0) = 50 $ m/s.
    ]
)

// TN 3
#tn([Một tụ điện phẳng có điện dung $C$ được nạp điện bằng nguồn điện xoay chiều thông qua mạch RC (như sơ đồ vẽ bên dưới). Điện lượng tích tụ trên bản tụ điện tăng dần theo thời gian $t$ (giây) theo công thức $Q(t) = 0.05 (1 - e^(-2 t))$ (coulomb). Tính giới hạn điện tích tối đa mà tụ điện có thể tích lũy được khi $t -> +oo$.],
    (
        [$0.01$ coulomb.],
        [$0.025$ coulomb.],
        True([$0.05$ coulomb.]),
        [$0.1$ coulomb.]
    ),
    fig: fig-capacitor,
    fig-pos: "center",
    fig-width: 35%,
    loigiai: [
        Điện tích tích lũy giới hạn của tụ là:
        $ limits(lim)_(t -> +oo) Q(t) = limits(lim)_(t -> +oo) 0.05 (1 - e^(-2 t)) = 0.05 dot (1 - 0) = 0.05 $ C.
    ]
)

// TN 4
#tn([Nồng độ $C(t)$ (mol/l) của một chất hóa học sản phẩm trong một phản ứng hóa học sau $t$ phút được xác định bởi công thức: $C(t) = (0.8 t)/(2 t + 3)$. Tính nồng độ tối đa của sản phẩm hóa học thu được khi thời gian phản ứng kéo dài vô hạn.],
    (
        [$0.2$ mol/l.],
        True([$0.4$ mol/l.]),
        [$0.8$ mol/l.],
        [$1.2$ mol/l.]
    ),
    fig: fig-chem,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Nồng độ tối đa khi thời gian tiến tới vô hạn là:
        $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) (0.8 t)/(2 t + 3) = limits(lim)_(t -> +oo) (0.8)/(2 + (3)/(t)) = (0.8)/(2) = 0.4 $ mol/l.
    ]
)

// TN 5
#tn([Chi phí tổng cộng để doanh nghiệp cơ khí sản xuất $x$ sản phẩm được mô tả bởi hàm số $C(x) = 1500 + 4x$ (nghìn đồng). Hàm chi phí trung bình để sản xuất một sản phẩm là $A(x) = (C(x))/(x)$. Tìm giới hạn của hàm chi phí trung bình khi sản lượng $x$ tiến tới vô hạn.],
    (
        [$0$ nghìn đồng.],
        [$1.5$ nghìn đồng.],
        True([$4$ nghìn đồng.]),
        [$1504$ nghìn đồng.]
    ),
    fig: fig-average-cost,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Ta có hàm chi phí trung bình:
        $ A(x) = (1500 + 4x)/(x) = (1500)/(x) + 4 $.
        Giới hạn khi $x -> +oo$ là:
        $ limits(lim)_(x -> +oo) A(x) = limits(lim)_(x -> +oo) ((1500)/(x) + 4) = 0 + 4 = 4 $ nghìn đồng.
    ]
)

// TN 6
#tn([Số tiền tích lũy sau $t$ năm gửi ngân hàng với số tiền gốc $P$, lãi suất $r$ một năm, gửi ghép lãi $n$ lần một năm là $A_n = P (1 + (r)/(n))^(n t)$. Khi số lần ghép lãi tiến ra vô hạn ($n -> +oo$), số tiền tiến về lãi kép liên tục $A = P e^(r t)$ (như hình minh họa). Giả sử gửi gốc $100$ triệu đồng, lãi suất $8\%$ ($r = 0.08$), gửi liên tục trong $5$ năm. Số tiền giới hạn tích lũy đạt được là bao nhiêu?],
    (
        [$140$ triệu đồng.],
        True([$100 e^(0.4)$ triệu đồng.]),
        [$100 e^(0.8)$ triệu đồng.],
        [$108$ triệu đồng.]
    ),
    fig: fig-compounding,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Khi ghép lãi liên tục ($n -> +oo$), số tiền tích lũy là:
        $ A = limits(lim)_(n -> +oo) P (1 + (r)/(n))^(n t) = P e^(r t) $.
        Với $P = 100$, $r = 0.08$, $t = 5$, ta được:
        $ A = 100 e^(0.08 dot 5) = 100 e^(0.4) $ triệu đồng.
    ]
)

// TN 7
#tn([Một kỹ sư giao thông thiết kế đường cong chuyển tiếp kết nối một đoạn đường thẳng nằm ngang $y = 1$ (khi $x < 0$) với một đoạn đường cong dạng parabol $y = a x^2 + b x + c$ (khi $x >= 0$) (như hình vẽ bên dưới). Để mặt đường liên tục tại vị trí nối $x = 0$, giá trị của tham số thiết kế $c$ phải bằng bao nhiêu?],
    (
        [$0$],
        True([$1$]),
        [$2$],
        [Tùy ý]
    ),
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Hàm mô tả mặt đường là:
        $ f(x) = cases(1 "khi" x < 0, a x^2 + b x + c "khi" x >= 0) $.
        Để đường liên tục tại $x = 0$, ta phải có:
        $ limits(lim)_(x -> 0^-) f(x) = limits(lim)_(x -> 0^+) f(x) = f(0) $.
        Ta có:
        - $limits(lim)_(x -> 0^-) f(x) = 1$.
        - $limits(lim)_(x -> 0^+) f(x) = a(0)^2 + b(0) + c = c$.
        - $f(0) = c$.
        Do đó $c = 1$.
    ]
)

// TN 8
#tn([Nhiệt độ $T(h)$ °C của tầng khí quyển theo độ cao $h$ (km) từ mặt đất lên đến tầng bình lưu (độ cao dưới $20$ km) được mô hình hóa bởi một hàm liên tục có công thức (như hình vẽ):
    $T(h) = cases(15 - 6.5 h "khi" 0 <= h <= 11, -56.5 + a(h - 11) "khi" 11 < h <= 20)$.
    Tìm giới hạn bên trái của nhiệt độ khí quyển tại độ cao ranh giới $h = 11$ km.],
    (
        [$15°$C.],
        [$0°$C.],
        True([$-56.5°$C.]),
        [$-71.5°$C.]
    ),
    fig: fig-atmosphere,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Giới hạn bên trái của nhiệt độ khi $h -> 11^-$ là:
        $ limits(lim)_(h -> 11^-) T(h) = limits(lim)_(h -> 11^-) (15 - 6.5 h) = 15 - 6.5 dot 11 = 15 - 71.5 = -56.5° $C.
    ]
)

// TN 9
#tn([Nhiệt độ của một thanh kim loại nung nóng được đưa vào phòng làm nguội có nhiệt độ môi trường cố định là $25°$C. Sau $t$ phút, nhiệt độ của thanh kim loại được mô tả bởi hàm số $T(t) = 25 + 120 e^(-0.05 t)$ (như đồ thị bên dưới). Tìm nhiệt độ ổn định cuối cùng của thanh kim loại khi thời gian làm nguội kéo dài vô hạn ($t -> +oo$).],
    (
        [$0°$C.],
        True([$25°$C.]),
        [$120°$C.],
        [$145°$C.]
    ),
    fig: fig-cooling,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Nhiệt độ ổn định lâu dài của thanh kim loại là:
        $ limits(lim)_(t -> +oo) T(t) = limits(lim)_(t -> +oo) (25 + 120 e^(-0.05 t)) $.
        Vì $limits(lim)_(t -> +oo) e^(-0.05 t) = 0$ nên:
        $ limits(lim)_(t -> +oo) T(t) = 25 + 120 dot 0 = 25° $C.
    ]
)

// TN 10
#tn([Theo định luật Beer-Lambert về sự hấp thụ ánh sáng trong môi trường đồng chất, cường độ ánh sáng $I(d)$ tại độ sâu $d$ (mét) dưới mặt nước biển giảm dần theo hàm số mũ $I(d) = I_0 dot (0.85)^d$ (với $I_0$ là cường độ ánh sáng tại mặt nước). Tìm giới hạn của cường độ ánh sáng khi độ sâu tiến ra vô hạn ($d -> +oo$).],
    (
        [$I_0$],
        [$0.85 I_0$],
        True([$0$]),
        [$+oo$]
    ),
    fig: fig-light,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Giới hạn cường độ ánh sáng là:
        $ limits(lim)_(d -> +oo) I(d) = limits(lim)_(d -> +oo) [I_0 dot (0.85)^d] $.
        Vì cơ số $q = 0.85$ thỏa mãn $|q| < 1$, nên $limits(lim)_(d -> +oo) (0.85)^d = 0$.
        Do đó:
        $ limits(lim)_(d -> +oo) I(d) = I_0 dot 0 = 0 $.
    ]
)

// TN 11
#tn([Năng suất làm việc của một nhân viên mới sau $t$ ngày đào tạo được mô tả bởi đường cong học tập (Learning Curve) có hàm số: $N(t) = (40 t + 10)/(t + 2)$ (sản phẩm/ngày) (như đồ thị bên dưới). Tìm năng suất tối đa giới hạn mà nhân viên đó có thể đạt được khi thời gian đào tạo kéo dài vô hạn.],
    (
        [$10$ sản phẩm/ngày.],
        [$20$ sản phẩm/ngày.],
        True([$40$ sản phẩm/ngày.]),
        [$50$ sản phẩm/ngày.]
    ),
    fig: fig-learning,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Năng suất tối đa đạt được là giới hạn khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) N(t) = limits(lim)_(t -> +oo) (40 t + 10)/(t + 2) = limits(lim)_(t -> +oo) (40 + (10)/(t))/(1 + (2)/(t)) = (40)/(1) = 40 $ sản phẩm/ngày.
    ]
)

// TN 12
#tn([Sự lan truyền một tin đồn trong một trường học có $1000$ học sinh được mô hình hóa bởi hàm số: $S(t) = (1000)/(1 + 99 e^(-0.5 t))$ (học sinh) sau $t$ giờ phát tán. Tìm số lượng học sinh tối đa biết tin đồn sau một thời gian rất dài ($t -> +oo$).],
    (
        [$10$ học sinh.],
        [$100$ học sinh.],
        [$990$ học sinh.],
        True([$1000$ học sinh.])
    ),
    fig: fig-logistic,
    fig-pos: "center",
    fig-width: 32%,
    loigiai: [
        Số học sinh tối đa biết tin đồn là giới hạn khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) S(t) = limits(lim)_(t -> +oo) (1000)/(1 + 99 e^(-0.5 t)) $.
        Vì $limits(lim)_(t -> +oo) e^(-0.5 t) = 0$ nên:
        $ limits(lim)_(t -> +oo) S(t) = (1000)/(1 + 99 dot 0) = 1000 $ học sinh.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Cho mô hình tăng trưởng của loài tảo sinh học biển trong hồ nuôi cấy thí nghiệm: $A(t) = (500)/(1 + 9 e^(-0.1 t))$ (gram) sau $t$ ngày nuôi cấy. Các phát biểu sau đúng hay sai?], (
        True([Khối lượng tảo biển ban đầu lúc bắt đầu nuôi cấy ($t = 0$) là $50$ g.]),
        True([Giới hạn khối lượng tảo tối đa thu được khi thời gian nuôi cấy kéo dài vô hạn là $500$ g.]),
        [Tại ngày nuôi cấy thứ $10$, khối lượng tảo biển thu được đạt đúng $250$ g.],
        True([Tốc độ sinh trưởng của tảo biển đạt cực đại khi khối lượng tảo biển bằng một nửa giới hạn sức chứa, tức là $250$ g.])
    ),
    fig: fig-logistic,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Khối lượng ban đầu: $A(0) = 500 / (1 + 9 e^0) = 500 / 10 = 50$ g.
        - *b)* Đúng. Khối lượng tối đa: $limits(lim)_(t -> +oo) A(t) = 500 / (1 + 9 dot 0) = 500$ g.
        - *c)* Sai. Khối lượng ngày thứ 10: $A(10) = 500 / (1 + 9 e^(-1)) approx 500 / (1 + 9 dot 0.3679) approx 500 / (4.31) approx 116$ g, không phải $250$ g.
        - *d)* Đúng. Theo tính chất hàm tăng trưởng Logistic, tốc độ tăng trưởng nhanh nhất tại tâm đối xứng của đồ thị, tương ứng với khối lượng bằng một nửa tiệm cận trên: $K / 2 = 250$ g.
    ]
)

// DS 2
#ds([Một dòng điện nạp vào tụ điện phẳng trong một mạch tích điện có điện lượng biến thiên theo thời gian: $q(t) = 3 (1 - e^(-0.5 t))$ (mili-coulomb, viết tắt mC) sau $t$ giây. Các phát biểu sau đúng hay sai?], (
        True([Điện tích ban đầu của tụ điện tại thời điểm $t = 0$ là $0$ mC.]),
        True([Điện tích tối đa mà tụ điện tích lũy được khi thời gian nạp kéo dài vô hạn là $3$ mC.]),
        True([Cường độ dòng điện tại thời điểm $t$ là đạo hàm $i(t) = q'(t) = 1.5 e^(-0.5 t)$ (mA).]),
        [Cường độ dòng điện nạp tụ điện có giới hạn tiến về vô hạn khi thời gian nạp kéo dài vô hạn.]
    ),
    fig: fig-capacitor,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. $q(0) = 3(1 - e^0) = 0$ mC.
        - *b)* Đúng. $limits(lim)_(t -> +oo) q(t) = limits(lim)_(t -> +oo) 3 (1 - e^(-0.5 t)) = 3$ mC.
        - *c)* Đúng. Cường độ dòng điện: $i(t) = q'(t) = [3(1 - e^(-0.5 t))]' = 3 dot 0.5 e^(-0.5 t) = 1.5 e^(-0.5 t)$ (mA).
        - *d)* Sai. Vì $limits(lim)_(t -> +oo) i(t) = limits(lim)_(t -> +oo) 1.5 e^(-0.5 t) = 0$ mA.
    ]
)

// DS 3
#ds([Nhiệt độ khí quyển $T(h)$ °C theo độ cao $h$ (km) từ mặt đất lên đến sát tầng bình lưu được mô tả bởi một hàm số ghép liên tục như sau:
    $T(h) = cases(20 - 6 h "khi" 0 <= h <= 10, -40 - 2(h - 10) "khi" 10 < h <= 20)$.
    Các phát biểu sau đúng hay sai?], (
        True([Nhiệt độ tại mặt đất ($h = 0$) là $20°$C.]),
        True([Giới hạn bên trái của nhiệt độ tại độ cao ranh giới $10$ km là $limits(lim)_(h -> 10^-) T(h) = -40°$C.]),
        True([Giới hạn bên phải của nhiệt độ tại độ cao ranh giới $10$ km là $limits(lim)_(h -> 10^+) T(h) = -40°$C.]),
        [Hàm số nhiệt độ $T(h)$ bị đứt gãy, không liên tục tại điểm ranh giới độ cao $h = 10$ km.]
    ),
    fig: fig-atmosphere,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. $T(0) = 20 - 6(0) = 20°$C.
        - *b)* Đúng. $limits(lim)_(h -> 10^-) T(h) = 20 - 6(10) = -40°$C.
        - *c)* Đúng. $limits(lim)_(h -> 10^+) T(h) = -40 - 2(10 - 10) = -40°$C.
        - *d)* Sai. Vì $limits(lim)_(h -> 10^-) T(h) = limits(lim)_(h -> 10^+) T(h) = T(10) = -40$ nên hàm số liên tục tại điểm nối $h = 10$ km.
    ]
)

// DS 4
#ds([Kỹ sư cầu đường thiết kế bề mặt dốc cầu trượt trơn nối tiếp từ mặt đường nằm ngang lên một đoạn nghiêng dạng parabol:
    $f(x) = cases(2 "khi" x <= 0, a x^2 + b x + 2 "khi" x > 0)$.
    Các phát biểu sau đúng hay sai?], (
        True([Hàm số độ cao dốc cầu $f(x)$ luôn liên tục tại điểm nối tiếp $x = 0$ với mọi giá trị thực của các tham số $a, b$.]),
        True([Nếu chọn hệ số thiết kế $a = 1, b = 2$ thì độ cao của dốc cầu tại vị trí $x = 3$ là $17$.]),
        True([Độ dốc tiếp tuyến của mặt cầu tại điểm nối liên tục trơn tru khi và chỉ khi đạo hàm hai bên bằng nhau tại $x = 0$, điều này dẫn đến điều kiện $b = 0$.]),
        [Với bộ số thiết kế $a = 1, b = 0$, hàm số không liên tục trên toàn bộ trục số thực $RR$.]
    ),
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Ta có $limits(lim)_(x -> 0^-) f(x) = 2$, $limits(lim)_(x -> 0^+) f(x) = a(0)^2 + b(0) + 2 = 2$ và $f(0) = 2$. Do đó hàm số luôn liên tục tại $x = 0$.
        - *b)* Đúng. Với $a = 1, b = 2$, tại $x = 3 > 0$, ta có: $f(3) = 1(3^2) + 2(3) + 2 = 9 + 6 + 2 = 17$.
        - *c)* Đúng. Đạo hàm trái tại $x = 0$ bằng $0$. Đạo hàm phải tại $x = 0$ là $f'(0^+) = b$. Để trơn tru thì $f'(0^-) = f'(0^+) <=> b = 0$.
        - *d)* Sai. Với $a = 1, b = 0$, hàm số trở thành $f(x) = cases(2 "khi" x <= 0, x^2 + 2 "khi" x > 0)$. Hàm số này liên tục trên khoảng $(-oo; 0)$ và $(0; +oo)$, đồng thời liên tục tại $x=0$, nên nó liên tục trên toàn bộ $RR$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Nồng độ của một loại dược chất kháng sinh đào thải dần trong máu của người bệnh sau $t$ giờ uống thuốc được cho bởi công thức nồng độ: $C(t) = (180 t + 50)/(2 t + 1)$ (mg/l) (như hình vẽ tương tự). Tìm giới hạn nồng độ ổn định lâu dài của dược chất đó khi thời gian $t -> +oo$ (tính bằng mg/l).],
    [90],
    fig: fig-cooling,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Nồng độ ổn định lâu dài là giới hạn khi $t -> +oo$:
        $ limits(lim)_(t -> +oo) C(t) = limits(lim)_(t -> +oo) (180 t + 50)/(2 t + 1) = limits(lim)_(t -> +oo) (180 + (50)/(t))/(2 + (1)/(t)) = (180)/(2) = 90 $ mg/l.
    ]
)

// TL 2
#tln([Một xưởng cơ khí sản xuất linh kiện có chi phí cố định ban đầu là $80$ triệu đồng, và chi phí phát sinh trực tiếp cho mỗi sản phẩm là $0.5$ triệu đồng. Gọi $A(x)$ là chi phí trung bình (triệu đồng/sản phẩm) để sản xuất được $x$ sản phẩm. Tính giới hạn chi phí trung bình tối thiểu để sản xuất một sản phẩm khi sản lượng sản xuất tiến tới vô hạn ($x -> +oo$), dưới dạng số thập phân.],
    [0.5],
    fig: fig-average-cost,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Chi phí tổng cộng để sản xuất $x$ sản phẩm là $C(x) = 80 + 0.5x$ (triệu đồng).
        Chi phí trung bình để sản xuất một sản phẩm là:
        $ A(x) = (C(x))/(x) = (80 + 0.5x)/(x) = (80)/(x) + 0.5 $.
        Giới hạn chi phí trung bình tối thiểu khi $x -> +oo$ là:
        $ limits(lim)_(x -> +oo) A(x) = limits(lim)_(x -> +oo) ((80)/(x) + 0.5) = 0 + 0.5 = 0.5 $ triệu đồng.
    ]
)

// TL 3
#tln([Một tụ điện có điện dung $C = 2 dot 10^(-6)$ F được nạp điện dưới nguồn điện thế không đổi $V = 100$ V. Điện lượng tích tụ trên bản tụ tăng dần theo thời gian $t$ (giây) theo công thức $q(t) = q_0 (1 - e^(-50 t))$ (coulomb). Tìm giá trị điện lượng tối đa $q_0$ (tích bằng đơn vị micro-coulomb, kí hiệu $mu$C) tụ điện tích lũy được khi $t -> +oo$.],
    [200],
    fig: fig-capacitor,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Giá trị giới hạn điện tích là $q_0 = C dot V$.
        Ta có: $q_0 = 2 dot 10^(-6) dot 100 = 200 dot 10^(-6)$ Coulomb.
        Đổi ra micro-coulomb ($mu$C): $200 dot 10^(-6)$ C = $200$ $mu$C.
    ]
)

// TL 4
#tln([Thiết kế hệ thống cảm biến nhiệt đo hai phạm vi hoạt động khác nhau liên tục (hàm số nhiệt độ liên tục) trên dải thời gian:
    $T(t) = cases(a t + 40 "khi" 0 <= t <= 10, t^2 - 2t + b "khi" t > 10)$ °C.
    Biết cảm biến đo liên tục (hàm liên tục tại điểm nối $t = 10$ giây). Khi tham số hiệu chỉnh $a = 3$, hãy tìm giá trị của tham số thiết kế $b$.],
    [-10],
    fig: fig-sensor,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Để hàm số liên tục tại điểm nối $t = 10$, ta có điều kiện:
        $ limits(lim)_(t -> 10^-) T(t) = limits(lim)_(t -> 10^+) T(t) = T(10) $.
        Ta có:
        - $limits(lim)_(t -> 10^-) T(t) = a(10) + 40 = 10a + 40$. Với $a = 3$, giới hạn trái là $10(3) + 40 = 70$.
        - $limits(lim)_(t -> 10^+) T(t) = 10^2 - 2(10) + b = 100 - 20 + b = 80 + b$.
        Do đó:
        $ 70 = 80 + b => b = -10 $.
    ]
)

// TL 5
#tln([Kỹ sư thiết kế đường cong chuyển tiếp kết nối hai làn đường cao tốc có cao độ được mô hình hóa bởi hàm số:
    $y(x) = cases(-2x + 5 "khi" x <= 2, x^2 - a x + 3 "khi" x > 2)$.
    Tìm giá trị của tham số $a$ để tuyến đường liên kết liên tục tại điểm nối tiếp $x = 2$.],
    [3],
    fig: fig-highway,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        Để cao độ mặt đường liên tục tại $x = 2$, ta cần:
        $ limits(lim)_(x -> 2^-) y(x) = limits(lim)_(x -> 2^+) y(x) = y(2) $.
        Ta có:
        - $limits(lim)_(x -> 2^-) y(x) = -2(2) + 5 = 1$.
        - $limits(lim)_(x -> 2^+) y(x) = 2^2 - a(2) + 3 = 4 - 2a + 3 = 7 - 2a$.
        Do đó:
        $ 1 = 7 - 2a => 2a = 6 => a = 3 $.
    ]
)

// TL 6
#tln([Một quần thể nấm ký sinh nuôi cấy nhân tạo phát triển vùng bao phủ theo hàm số: $P(t) = (1500)/(2 + b e^(-0.4 t))$ (đơn vị diện tích) sau $t$ giờ. Lúc bắt đầu nuôi cấy ($t = 0$), diện tích nấm đo được là $150$ đơn vị diện tích. Tìm giới hạn diện tích nấm phủ tối đa có thể đạt được trong đĩa nuôi cấy khi thời gian kéo dài vô hạn ($t -> +oo$).],
    [750],
    fig: fig-logistic,
    fig-pos: "center",
    fig-width: 30%,
    loigiai: [
        - Tại thời điểm ban đầu $t = 0$:
          $ P(0) = (1500)/(2 + b e^0) = (1500)/(2 + b) = 150 $.
          Suy ra: $2 + b = (1500)/(150) = 10 => b = 8$.
        - Khi thời gian kéo dài vô hạn ($t -> +oo$), ta có giới hạn:
          $ limits(lim)_(t -> +oo) P(t) = limits(lim)_(t -> +oo) (1500)/(2 + 8 e^(-0.4 t)) $.
          Vì $limits(lim)_(t -> +oo) e^(-0.4 t) = 0$ nên:
          $ limits(lim)_(t -> +oo) P(t) = (1500)/(2 + 8 dot 0) = (1500)/(2) = 750 $ đơn vị diện tích.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
