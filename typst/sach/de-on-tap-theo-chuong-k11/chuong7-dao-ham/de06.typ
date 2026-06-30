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

// Hình 1: Đập xả thủy điện (Lưu lượng nước)
#let fig-dam-discharge = canvas(length: 1cm, {
  import draw: *
  line((-2.0, 2.5), (-0.5, 0.5), stroke: 1.5pt + black)
  line((-0.5, 0.5), (2.0, 0.5), stroke: 1.5pt + black)
  rect((-2.0, 0.5), (-0.5, 2.2), stroke: none, fill: rgb("#0057b8").lighten(80%))
  
  // Dòng nước xả qua cửa
  line((-0.5, 0.5), (1.5, -0.8), stroke: (dash: "dashed", paint: rgb("#0057b8"), thickness: 2pt))
  content((-1.2, 1.4), [Cột nước $h$])
})

// Hình 2: Động học enzym Michaelis-Menten
#let fig-enzyme-kinetics = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  line((-0.5, 2.5), (4.5, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  content((4.3, -0.3), [$S$])
  content((-0.4, 2.8), [$v$])
  content((-0.6, 2.5), [$V_(max)$])
  
  let pts = ()
  for i in range(41) {
    let s = i * 0.1
    let y = (2.5 * s) / (s + 1.0)
    pts.push((s, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#1a7a2e"))
})

// Hình 3: Quỹ đạo quay xe Drift
#let fig-car-drifting = canvas(length: 1cm, {
  import draw: *
  line((-2.5, 0), (2.5, 0), stroke: 1.2pt + black)
  line((0, -2.0), (0, 2.0), stroke: 1.2pt + black)
  content((2.3, -0.3), [$x$])
  content((-0.3, 1.8), [$y$])
  
  let pts = ()
  for i in range(41) {
    let x = (i - 20) * 0.1
    let y = 1.5 * x - 0.2 * x * x * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#cc2200"))
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  subject: "TOÁN - LỚP 11",
  school: "ÔN TẬP CHƯƠNG ĐẠO HÀM",
  exam-title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 06)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Tính đạo hàm của hàm số đa thức $y = x^5 - 5x^3 + 4x$.],
    (
        [$y' = 5x^4 - 15x^2$],
        True([$y' = 5x^4 - 15x^2 + 4$]),
        [$y' = 5x^4 - 5x^2 + 4$],
        [$y' = x^4 - 15x^2 + 4$]
    ),
    loigiai: [
        Áp dụng quy tắc tính đạo hàm đa thức:
        $ y' = (x^5)' - 5(x^3)' + (4x)' = 5x^4 - 15x^2 + 4 $.
        Chọn đáp án B.
    ]
)

// TN 2
#tn([Lưu lượng nước chảy qua cửa xả của một đập thủy điện (như hình vẽ bên dưới) phụ thuộc vào chiều cao cột nước $h$ (mét) theo công thức $Q(h) = 5 h sqrt(h) = 5 h sqrt(h)$ ($"m"^3"/s"$). Tốc độ thay đổi lưu lượng nước $Q'(h)$ khi cột nước đạt chiều cao $h = 4$ m bằng bao nhiêu $"m"^2"/s"$?],
    (
        [$10$],
        True([$15$]),
        [$20$],
        [$30$]
    ),
    fig: fig-dam-discharge,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm theo chiều cao cột nước: $Q'(h) = (15/2) sqrt(h) = 15/2 sqrt(h)$.
        - Thay $h = 4 ==> Q'(4) = (15/2) sqrt(4) = (15/2) dot 2 = 15$ $"m"^2"/s"$.
        Chọn đáp án B.
    ]
)

// TN 3
#tn([Cho hàm số $y = e^(2x) - x$. Phương trình tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x_0 = 0$ là:],
    (
        [$y = x$],
        True([$y = x + 1$]),
        [$y = 2x + 1$],
        [$y = x - 1$]
    ),
    loigiai: [
        - Đạo hàm $y' = 2 e^(2x) - 1 ==> y'(0) = 2 e^0 - 1 = 1$.
        - Tung độ tiếp điểm $y(0) = e^0 - 0 = 1 ==> M(0; 1)$.
        - Phương trình tiếp tuyến là $y = 1(x - 0) + 1 <==> y = x + 1$.
        Chọn đáp án B.
    ]
)

// TN 4
#tn([Suất điện động tự cảm xuất hiện trong một cuộn cảm $L = 0.02$ H khi cường độ dòng điện $I(t) = 5 sin(100 pi t)$ (A) biến thiên theo thời gian $t$ (giây) được cho bởi $e(t) = -L I'(t)$. Độ lớn suất điện động tức thời tại thời điểm $t = 0$ bằng bao nhiêu Volt (lấy $pi approx 3.14$)?],
    (
        [$10.0$],
        True([$31.4$]),
        [$50.0$],
        [$3.14$]
    ),
    loigiai: [
        - Ta có $I'(t) = 500 pi cos(100 pi t) ==> e(t) = -0.02 dot 500 pi cos(100 pi t) = -10 pi cos(100 pi t)$ (V).
        - Tại $t = 0 ==> |e(0)| = |-10 pi| = 10 pi approx 31.4$ V.
        Chọn đáp án B.
    ]
)

// TN 5
#tn([Hệ số góc của tiếp tuyến của đồ thị hàm số $y = tan x + x$ tại điểm có hoành độ $x_0 = pi/4$ bằng bao nhiêu?],
    (
        [$2$],
        True([$3$]),
        [$4$],
        [$1$]
    ),
    loigiai: [
        - Đạo hàm $y' = 1/(cos^2 x) + 1$.
        - Hệ số góc tiếp tuyến là $k = y'(pi/4) = 1/(cos^2(pi/4)) + 1 = 1/(1/2) + 1 = 3$.
        Chọn đáp án B.
    ]
)

// TN 6
#tn([Theo mô hình động học enzym Michaelis-Menten (như hình vẽ bên dưới), tốc độ phản ứng sinh hóa $v$ ($mu$mol/s) phụ thuộc nồng độ cơ chất $S$ (mM) theo công thức $v(S) = (10 S)/(S + 2)$. Tốc độ gia tăng phản ứng $v'(S)$ tại nồng độ $S = 3$ mM bằng bao nhiêu $mu$mol/(s.mM)?],
    (
        [$0.40$],
        True([$0.80$]),
        [$1.20$],
        [$2.00$]
    ),
    fig: fig-enzyme-kinetics,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $v'(S) = (10(S+2) - 10S)/((S+2)^2) = (20)/((S+2)^2)$.
        - Tại $S = 3 ==> v'(3) = 20/(3+2)^2 = 20/25 = 0.80$ $mu$mol/(s.mM).
        Chọn đáp án B.
    ]
)

// TN 7
#tn([Cho hàm số $f(x) = x^4 - 12x^2 + 5x$. Tập nghiệm của bất phương trình đạo hàm cấp hai $f''(x) < 0$ là:],
    (
        [$(-2; 2)$],
        True([$(-sqrt(2); sqrt(2))$]),
        [$(-oo; -sqrt(2))$],
        [$(sqrt(2); +oo)$]
    ),
    loigiai: [
        - Đạo hàm cấp một: $f'(x) = 4x^3 - 24x + 5$.
        - Đạo hàm cấp hai: $f''(x) = 12x^2 - 24$.
        - Cho $f''(x) < 0 <==> 12x^2 - 24 < 0 <==> x^2 < 2 <==> -sqrt(2) < x < sqrt(2)$.
        Chọn đáp án B.
    ]
)

// TN 8
#tn([Một chiếc xe đua đang thực hiện kỹ thuật trượt bánh (drift) theo đường cong $y = x - x^3/27$ (mét) (như hình vẽ bên dưới). Tiếp tuyến với quỹ đạo chuyển động của xe nằm ngang (hệ số góc $k = 0$) tại điểm có hoành độ dương $x$ bằng bao nhiêu?],
    (
        [$x = 1$],
        True([$x = 3$]),
        [$x = 9$],
        [$x = sqrt(3)$]
    ),
    fig: fig-car-drifting,
    fig-width: 25%,
    loigiai: [
        - Đạo hàm $y' = 1 - (3x^2)/27 = 1 - x^2/9$.
        - Tiếp tuyến nằm ngang $<==> y' = 0 <==> 1 - x^2/9 = 0 <==> x^2 = 9 <==> x = pm 3$.
        - Hoành độ dương là $x = 3$.
        Chọn đáp án B.
    ]
)

// TN 9
#tn([Cho chuyển động của một chất điểm có phương trình quãng đường $s(t) = cos(2t) + t^2$ (m), với $t >= 0$ (giây). Gia tốc tức thời của chất điểm tại thời điểm $t = pi/6$ giây bằng bao nhiêu $"m/s"^2$?],
    (
        [$1.0$],
        True([$0.0$]),
        [$2.0$],
        [$-1.0$]
    ),
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = -2 sin(2t) + 2t$.
        - Gia tốc tức thời $a(t) = v'(t) = -4 cos(2t) + 2$.
        - Tại $t = pi/6 ==> a(pi/6) = -4 cos(pi/3) + 2 = -4(0.5) + 2 = 0$ $"m/s"^2$.
        Chọn đáp án B.
    ]
)

// TN 10
#tn([Cho hàm số $y = (x + 2)/(x + 1)$. Có hai tiếp tuyến của đồ thị hàm số đi qua gốc tọa độ $O(0; 0)$. Tích hoành độ $x_1 dot x_2$ của hai tiếp điểm đó bằng bao nhiêu?],
    (
        [$1$],
        True([$2$]),
        [$-2$],
        [$-1$]
    ),
    loigiai: [
        - Đường thẳng qua $O(0; 0)$ có phương trình $y = k x$.
        - Điều kiện tiếp xúc: $(x+2)/(x+1) = k x$ và $(-1)/((x+1)^2) = k$.
        - Thế $k$: $(x+2)/(x+1) = (-x)/((x+1)^2) <==> (x+2)(x+1) = -x <==> x^2 + 3x + 2 = -x <==> x^2 + 4x + 2 = 0$.
        - Theo định lý Vi-ét, tích hai hoành độ tiếp điểm là $x_1 dot x_2 = 2$.
        Chọn đáp án B.
    ]
)

// TN 11
#tn([Nhiệt độ động cơ của một máy nén khí sau khi tắt máy giảm theo thời gian $t$ (giây) theo công thức $T(t) = 100 e^(-0.05 t)$ (°C). Tốc độ giảm nhiệt độ tức thời tại thời điểm $t = 20$ giây bằng bao nhiêu °C/s (lấy $e approx 2.718$)?],
    (
        [$3.68$],
        True([$1.84$]),
        [$5.00$],
        [$2.50$]
    ),
    loigiai: [
        - Đạo hàm $T'(t) = 100 dot (-0.05) e^(-0.05 t) = -5 e^(-0.05 t)$.
        - Tại $t = 20 ==> T'(20) = -5 e^(-1) = -5/e approx -1.84$ °C/s.
        - Tốc độ giảm nhiệt độ tức thời là $1.84$ °C/s.
        Chọn đáp án B.
    ]
)

// TN 12
#tn([Cho hàm số $y = sqrt((x)/(x + 1))$ với $x > 0$. Giá trị đạo hàm $y'(1)$ bằng bao nhiêu?],
    (
        [$(1)/(4)$],
        True([$(sqrt(2))/(8)$]),
        [$(sqrt(2))/(4)$],
        [$(1)/(8)$]
    ),
    loigiai: [
        - Ta có $y = (x/(x+1))^(1/2) ==> y' = 1/2 (x/(x+1))^(-1/2) dot (1)/((x+1)^2) = 1/(2 sqrt(x(x+1))) dot 1/(sqrt(x+1)) = 1/(2 (x+1) sqrt(x(x+1)))$... hoặc tính trực tiếp tại $x=1$:
        - $y(1) = 1/sqrt(2) = sqrt(2)/2$. Đạo hàm hàm hợp $y' = 1/(2 sqrt(1/2)) dot 1/4 = (sqrt(2))/(2) dot 1/4 = (sqrt(2))/(8)$.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Lưu lượng nước xả qua cửa đáy của một đập thủy điện (như hình vẽ bên dưới) phụ thuộc vào chiều cao cột nước $h$ (mét, $h >= 0$) theo công thức $Q(h) = 4 h sqrt(h) = 4 h sqrt(h)$ ($"m"^3"/s"$). Các phát biểu sau đúng hay sai?],
    (
        True([Ban đầu khi chưa có cột nước ($h = 0$), lưu lượng nước chảy qua cửa xả bằng $0$.]),
        True([Tốc độ thay đổi lưu lượng nước theo chiều cao cột nước là $Q'(h) = 6 sqrt(h)$ ($"m"^2"/s"$).]),
        False([Khi cột nước đạt chiều cao $h = 9$ m, tốc độ thay đổi lưu lượng nước bằng $54" m"^2"/s"$.]),
        True([Lưu lượng nước tăng ngày càng nhanh hơn khi độ cao cột nước $h$ tăng lên.])
    ),
    fig: fig-dam-discharge,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. Thay $h = 0 ==> Q(0) = 0$ $"m"^3"/s"$.
        - *b)* Đúng. Đạo hàm $Q'(h) = 4 dot 3/2 sqrt(h) = 6 sqrt(h)$ $"m"^2"/s"$.
        - *c)* Sai. Thay $h = 9 ==> Q'(9) = 6 sqrt(9) = 18$ $"m"^2"/s"$ (chứ không phải 54).
        - *d)* Đúng. Vì $Q''(h) = 3/sqrt(h) > 0$ với mọi $h > 0$ nên lưu lượng nước tăng ngày càng nhanh.
    ]
)

// DS 2
#ds([Trong sinh hóa học, tốc độ phản ứng xúc tác bởi enzym theo mô hình Michaelis-Menten (như đồ thị bên dưới) được cho bởi $v(S) = (12 S)/(S + 4)$ ($mu$mol/s), trong đó $S >= 0$ là nồng độ cơ chất (mM). Các phát biểu sau đúng hay sai?],
    (
        True([Khi nồng độ cơ chất $S -> +oo$, tốc độ phản ứng tiến đến tốc độ cực đại $V_(max) = 12$ $mu$mol/s.]),
        True([Đạo hàm $v'(S) = (48)/((S + 4)^2) > 0$ biểu thị tốc độ phản ứng luôn tăng theo nồng độ cơ chất.]),
        False([Tại nồng độ cơ chất $S = 4$ mM, tốc độ tăng phản ứng $v'(4)$ bằng $6$ $mu$mol/(s.mM).]),
        True([Hằng số Michaelis $K_m = 4$ mM là nồng độ cơ chất để tốc độ phản ứng bằng một nửa tốc độ cực đại.])
    ),
    fig: fig-enzyme-kinetics,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. Khi $S -> +oo ==> lim v(S) = 12$ $mu$mol/s.
        - *b)* Đúng. $v'(S) = (12(S+4) - 12S)/((S+4)^2) = 48/((S+4)^2) > 0$.
        - *c)* Sai. Thay $S = 4 ==> v'(4) = 48/(4+4)^2 = 48/64 = 0.75$ $mu$mol/(s.mM) (chứ không phải 6).
        - *d)* Đúng. Khi $S = 4 ==> v(4) = (12 dot 4)/(4+4) = 6 = 1/2 V_(max)$.
    ]
)

// DS 3
#ds([Quỹ đạo trượt của một chiếc xe đua trong tình huống drift (như hình vẽ bên dưới) được mô tả trong hệ trục tọa độ bởi đường cong $y = 3x - x^3/9$ (mét) với $-3 <= x <= 3$. Các phát biểu sau đúng hay sai?],
    (
        True([Đạo hàm $y' = 3 - x^2/3$ biểu thị hệ số góc tiếp tuyến hướng chuyển động của xe.]),
        True([Xe chuyển động theo phương ngang (tiếp tuyến nằm ngang) tại các điểm có hoành độ $x = -3$ và $x = 3$.]),
        False([Tại gốc tọa độ $O(0; 0)$, tiếp tuyến với quỹ đạo chuyển động của xe tạo với trục hoành một góc $45°$.]),
        True([Hệ số góc hướng chuyển động của xe tại điểm $x = 3$ bằng $0$.])
    ),
    fig: fig-car-drifting,
    fig-width: 25%,
    loigiai: [
        - *a)* Đúng. $y' = (3x - x^3/9)' = 3 - x^2/3$.
        - *b)* Đúng. Tiếp tuyến nằm ngang $<==> y' = 0 <==> 3 - x^2/3 = 0 <==> x = pm 3$.
        - *c)* Sai. Tại $O(0; 0) ==> y'(0) = 3 ==> tan alpha = 3 ==> alpha approx 71.57°$ (chứ không phải $45°$).
        - *d)* Đúng. Tại $x = 3 ==> y'(3) = 3 - 9/3 = 0$.
    ]
)

// DS 4
#ds([Cường độ dòng điện chạy qua một cuộn cảm $L = 0.1$ H biến thiên theo thời gian $t$ (giây) theo phương trình $I(t) = 4 sin(50 pi t)$ (A). Suất điện động tự cảm xuất hiện trong cuộn cảm là $e(t) = -L I'(t)$. Các phát biểu sau đúng hay sai?],
    (
        True([Tốc độ biến thiên dòng điện là $I'(t) = 200 pi cos(50 pi t)$ (A/s).]),
        True([Biểu thức suất điện động tự cảm là $e(t) = -20 pi cos(50 pi t)$ (V).]),
        False([Biên độ cực đại của suất điện động tự cảm bằng $10 pi$ Volt.]),
        True([Tại các thời điểm dòng điện đạt giá trị cực đại ($I = pm 4$ A), suất điện động tự cảm bằng $0$ Volt.])
    ),
    loigiai: [
        - *a)* Đúng. $I'(t) = 4 dot 50 pi cos(50 pi t) = 200 pi cos(50 pi t)$ A/s.
        - *b)* Đúng. $e(t) = -0.1 dot 200 pi cos(50 pi t) = -20 pi cos(50 pi t)$ V.
        - *c)* Sai. Biên độ cực đại của suất điện động là $20 pi$ V (chứ không phải $10 pi$).
        - *d)* Đúng. Khi $I = pm 4 ==> sin(50 pi t) = pm 1 ==> cos(50 pi t) = 0 ==> e(t) = 0$ V.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#tln([Cho hàm số $f(x) = x^2 e^x$. Tính giá trị đạo hàm $f'(1)$ (lấy $e approx 2.718$, làm tròn đến hai chữ số thập phân).],
    [8.15],
    loigiai: [
        - Đạo hàm tích: $f'(x) = (x^2)' e^x + x^2 (e^x)' = 2x e^x + x^2 e^x = (2x + x^2) e^x$.
        - Thay $x = 1 ==> f'(1) = (2(1) + 1^2) e^1 = 3e approx 3 dot 2.718 = 8.154 approx 8.15$.
        Đáp số: $8.15$.
    ]
)

// TLN 2
#tln([Một khối chóp đều có đáy là hình vuông cạnh $a$ tăng đều với tốc độ $0.3" cm/s"$ và chiều cao luôn gấp đôi cạnh đáy ($h = 2a$). Tính tốc độ tăng thể tích của khối chóp tại thời điểm $a = 3$ cm (tính bằng c$"m"^3"/s"$).],
    [5.4],
    loigiai: [
        - Thể tích khối chóp $V = 1/3 a^2 h = 1/3 a^2 (2a) = 2/3 a^3$.
        - Đạo hàm hai vế theo thời gian: $(d V)/(d t) = 2 a^2 (d a)/(d t)$.
        - Thay $a = 3$ và $(d a)/(d t) = 0.3 ==> (d V)/(d t) = 2(3^2) dot 0.3 = 18 dot 0.3 = 5.4" cm"^3"/s"$.
        Đáp số: $5.4$.
    ]
)

// TLN 3
#tln([Cho đồ thị hàm số $y = x^4 - 4x^2 + 1$. Đồ thị hàm số có bao nhiêu đường tiếp tuyến nằm ngang (hệ số góc $k = 0$)?],
    [2],
    loigiai: [
        - Đạo hàm $y' = 4x^3 - 8x = 4x(x^2 - 2) = 0 <==> x = 0$ hoặc $x = pm sqrt(2)$.
        - Tại $x = 0 ==> y = 1 ==>$ Tiếp tuyến nằm ngang thứ nhất là $y = 1$.
        - Tại $x = pm sqrt(2) ==> y = -3 ==>$ Tiếp tuyến nằm ngang thứ hai là $y = -3$.
        - Vậy có đúng 2 đường tiếp tuyến nằm ngang phân biệt.
        Đáp số: $2$.
    ]
)

// TLN 4
#tln([Gia tốc tức thời của chuyển động $s(t) = A sin(omega t)$ tại thời điểm ban đầu $t = 0$ bằng bao nhiêu?],
    [0],
    loigiai: [
        - Vận tốc tức thời $v(t) = s'(t) = A omega cos(omega t)$.
        - Gia tốc tức thời $a(t) = v'(t) = -A omega^2 sin(omega t)$.
        - Tại $t = 0 ==> a(0) = -A omega^2 sin(0) = 0$.
        Đáp số: $0$.
    ]
)

// TLN 5
#tln([Cho parabol $(P): y = x^2 - 4x + 5$. Tìm hoành độ $x_0 > 2$ của tiếp điểm sao cho tiếp tuyến tại $x_0$ tạo với hai trục tọa độ $O x, O y$ một tam giác vuông cân.],
    [2.5],
    loigiai: [
        - Tiếp tuyến tạo với 2 trục tọa độ một tam giác vuông cân $==>$ Hệ số góc $k = pm 1$.
        - Ta có $y' = 2x - 4$.
        - Với $k = 1 ==> 2x - 4 = 1 <==> 2x = 5 <==> x_0 = 2.5 > 2$ (thỏa mãn).
        - With $k = -1 ==> 2x - 4 = -1 <==> 2x = 3 <==> x_0 = 1.5 < 2$ (loại).
        - Vậy $x_0 = 2.5$.
        Đáp số: $2.5$.
    ]
)

// TLN 6
#tln([Cho hàm số $y = (x^2 + x + 2)/(x + 1) = x + (2)/(x + 1)$. Tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x_0 = 1$ cắt đường thẳng $d: y = 2x - 3$ tại điểm $M(x_M; y_M)$. Tính giá trị của tổng $x_M + y_M$.],
    [6],
    loigiai: [
        - Đạo hàm $y' = 1 - (2)/((x+1)^2) ==> y'(1) = 1 - 2/4 = 0.5$.
        - Tung độ tiếp điểm $y(1) = 2 ==>$ PTTT là $y = 0.5(x - 1) + 2 <==> y = 0.5x + 1.5$.
        - Hoành độ giao điểm $M$: $0.5x + 1.5 = 2x - 3 <==> 1.5x = 4.5 <==> x_M = 3$.
        - Tung độ giao điểm $y_M = 2(3) - 3 = 3 ==> x_M + y_M = 3 + 3 = 6$.
        Đáp số: $6$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
