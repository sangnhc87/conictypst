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

// Hình 1: Tiếp tuyến vòi phun nước nghệ thuật (Parabol)
#let fig-tangent-parabola = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (5.0, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  content((4.8, -0.3), [$x$])
  content((-0.3, 2.8), [$y$])
  content((-0.3, -0.3), [$O$])
  
  // Parabol y = -0.5 x^2 + 2x
  let pts = ()
  for i in range(41) {
    let x = i * 0.1
    let y = -0.5 * x * x + 2.0 * x
    pts.push((x, y))
  }
  line(..pts, stroke: 1.5pt + rgb("#0057b8"))
  
  // Tiếp tuyến tại x = 1, y = 1.5, k = 1 => y = x + 0.5
  line((-0.2, 0.3), (2.2, 2.7), stroke: 1.2pt + rgb("#cc2200"))
  circle((1.0, 1.5), radius: 3pt, fill: rgb("#cc2200"))
  content((1.0, 1.9), [$M(1; 1.5)$])
})

// Hình 2: Dao động con lắc đơn
#let fig-pendulum-motion = canvas(length: 1cm, {
  import draw: *
  line((-1.5, 2.5), (1.5, 2.5), stroke: 2pt + black)
  line((0, 2.5), (0, -0.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  
  // Dây treo góc 30 deg
  let L = 2.5
  let ang = -30deg
  let px = L * calc.sin(30deg)
  let py = 2.5 - L * calc.cos(30deg)
  
  line((0, 2.5), (px, py), stroke: 1.2pt + rgb("#1a7a2e"))
  circle((px, py), radius: 6pt, fill: rgb("#e67e22"), stroke: 1pt + black)
  
  arc((0, 1.7), start: -90deg, delta: 30deg, radius: 0.8, stroke: 0.8pt + rgb("#cc2200"))
  content((0.3, 1.4), [$theta(t)$])
})

// Hình 3: Động cơ pit-tông xi-lanh
#let fig-piston-engine = canvas(length: 1cm, {
  import draw: *
  rect((-1.2, 0), (1.2, 3.5), stroke: 1.2pt + black, fill: gray.lighten(90%))
  rect((-1.0, 1.5), (1.0, 2.5), stroke: 1.5pt + rgb("#0057b8"), fill: rgb("#0057b8").lighten(80%))
  line((0, 1.5), (0, -0.8), stroke: 2pt + rgb("#cc2200"))
  circle((0, -0.8), radius: 4pt, fill: black)
})

// Hình 4: Định luật làm nguội Newton
#let fig-cooling-curve = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.5), stroke: 1.2pt + black)
  line((-0.5, 1.0), (4.5, 1.0), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  content((4.3, -0.3), [$t$])
  content((-0.4, 3.3), [$T$])
  content((-0.6, 1.0), [$25°$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    let y = 1.0 + 2.2 * calc.exp(-0.8 * t)
    pts.push((t, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#9b59b6"))
})

// Hình 5: Đường cong sạc tụ điện RC
#let fig-circuit-rc = canvas(length: 1cm, {
  import draw: *
  line((-0.5, 0), (4.5, 0), stroke: 1.2pt + black)
  line((0, -0.5), (0, 3.0), stroke: 1.2pt + black)
  line((-0.5, 2.5), (4.5, 2.5), stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
  content((4.3, -0.3), [$t$])
  content((-0.4, 2.8), [$Q$])
  
  let pts = ()
  for i in range(41) {
    let t = i * 0.1
    let y = 2.5 * (1.0 - calc.exp(-1.0 * t))
    pts.push((t, y))
  }
  line(..pts, stroke: 1.8pt + rgb("#e67e22"))
})

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  subject: "TOÁN - LỚP 11",
  school: "ÔN TẬP CHƯƠNG ĐẠO HÀM",
  exam-title: "CHƯƠNG ĐẠO HÀM VÀ TIẾP TUYẾN (ĐỀ SỐ 02)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một vật được ném đứng từ mặt đất lên cao với phương trình chuyển động $s(t) = 20t - 5t^2$, trong đó $t$ tính bằng giây ($t >= 0$), $s$ tính bằng mét. Vật đạt độ cao cực đại tại thời điểm $t$ bằng bao nhiêu giây?],
    (
        [$1" s"$],
        True([$2" s"$]),
        [$3" s"$],
        [$4" s"$]
    ),
    loigiai: [
        - Vận tốc tức thời của vật tại thời điểm $t$ là $v(t) = s'(t) = 20 - 10t$ (m/s).
        - Vật đạt độ cao cực đại khi vận tốc tức thời bằng $0 <==> 20 - 10t = 0 <==> t = 2" s"$.
        Chọn đáp án B.
    ]
)

// TN 2
#tn([Một vòi phun nước nghệ thuật có quỹ đạo đường đi của dòng nước là một parabol $y = -x^2 + 4x$ (như hình vẽ minh họa bên dưới). Hệ số góc $k$ của tiếp tuyến với quỹ đạo dòng nước tại điểm $M(1; 3)$ bằng bao nhiêu?],
    (
        [$k = 1$],
        True([$k = 2$]),
        [$k = 3$],
        [$k = 4$]
    ),
    fig: fig-tangent-parabola,
    fig-width: 30%,
    loigiai: [
        - Đạo hàm hàm số quỹ đạo: $y' = -2x + 4$.
        - Hệ số góc tiếp tuyến tại điểm có hoành độ $x_0 = 1$ là: $k = y'(1) = -2(1) + 4 = 2$.
        Chọn đáp án B.
    ]
)

// TN 3
#tn([Chi phí sản xuất $x$ sản phẩm của một công ty được mô hình hóa bởi hàm số $C(x) = 0.01 x^2 + 5x + 100$ (đơn vị: nghìn đồng). Chi phí biên (tức tốc độ thay đổi chi phí $C'(x)$) tại mức sản xuất $x = 100$ sản phẩm là bao nhiêu nghìn đồng/sản phẩm?],
    (
        [$5" nghìn đồng"$],
        [$6" nghìn đồng"$],
        True([$7" nghìn đồng"$]),
        [$8" nghìn đồng"$]
    ),
    loigiai: [
        - Chi phí biên là đạo hàm của hàm chi phí: $C'(x) = 0.02x + 5$.
        - Tại $x = 100$, chi phí biên là $C'(100) = 0.02(100) + 5 = 7$ nghìn đồng/sản phẩm.
        Chọn đáp án C.
    ]
)

// TN 4
#tn([Nồng độ của một chất hóa học tham gia phản ứng theo thời gian $t$ (giây) được cho bởi $C(t) = (4)/(t + 2)$ (mol/lít). Tốc độ giảm nồng độ tức thời của chất đó tại thời điểm $t = 2$ giây bằng bao nhiêu mol/(lít.s)?],
    (
        [$0.15$],
        True([$0.25$]),
        [$0.50$],
        [$1.00$]
    ),
    loigiai: [
        - Tốc độ thay đổi nồng độ tức thời là $C'(t) = (-4)/((t + 2)^2)$.
        - Tại $t = 2 ==> C'(2) = (-4)/((2 + 2)^2) = (-4)/(16) = -0.25$ mol/(lít.s).
        - Vậy tốc độ giảm nồng độ tức thời là $0.25$ mol/(lít.s).
        Chọn đáp án B.
    ]
)

// TN 5
#tn([Cho hàm số $y = x^3 - 3x + 1$. Tiếp tuyến của đồ thị hàm số tại điểm $M(x_0; y_0)$ song song với đường thẳng $y = 9x - 2$. Biết $x_0 > 0$, giá trị của $x_0$ bằng bao nhiêu?],
    (
        [$x_0 = 1$],
        True([$x_0 = 2$]),
        [$x_0 = 3$],
        [$x_0 = 4$]
    ),
    loigiai: [
        - Ta có $y' = 3x^2 - 3$.
        - Tiếp tuyến song song với đường thẳng $y = 9x - 2 ==> y'(x_0) = 9 <==> 3x_0^2 - 3 = 9 <==> 3x_0^2 = 12 <==> x_0^2 = 4$.
        - Vì $x_0 > 0$ nên $x_0 = 2$.
        Chọn đáp án B.
    ]
)

// TN 6
#tn([Cho hàm số $f(x) = sqrt(2x^2 + 1)$. Giá trị của đạo hàm $f'(2)$ bằng bao nhiêu?],
    (
        [$(2)/(3)$],
        True([$(4)/(3)$]),
        [$(2)/(sqrt(9))$],
        [$(8)/(3)$]
    ),
    loigiai: [
        - Đạo hàm hàm hợp căn thức: $f'(x) = ((2x^2 + 1)')/(2 sqrt(2x^2 + 1)) = (4x)/(2 sqrt(2x^2 + 1)) = (2x)/(sqrt(2x^2 + 1))$.
        - Thay $x = 2$: $f'(2) = (2 dot 2)/(sqrt(2 dot 2^2 + 1)) = (4)/(sqrt(9)) = (4)/(3)$.
        Chọn đáp án B.
    ]
)

// TN 7
#tn([Dao động của một con lắc đơn có phương trình li độ góc $theta(t) = 0.1 cos(2 pi t)$ (rad) (như hình vẽ bên dưới). Vận tốc góc tức thời $omega(t) = theta'(t)$ của con lắc tại thời điểm $t = 0.25$ giây bằng bao nhiêu rad/s?],
    (
        [$0.2 pi$],
        True([$-0.2 pi$]),
        [$0.1 pi$],
        [$0$]
    ),
    fig: fig-pendulum-motion,
    fig-width: 25%,
    loigiai: [
        - Vận tốc góc tức thời là đạo hàm của li độ góc theo thời gian:
          $ omega(t) = theta'(t) = -0.1 dot 2 pi sin(2 pi t) = -0.2 pi sin(2 pi t) ". " $
        - Tại $t = 0.25" s" ==> omega(0.25) = -0.2 pi sin(0.5 pi) = -0.2 pi" rad/s"$.
        Chọn đáp án B.
    ]
)

// TN 8
#tn([Một vật chuyển động theo phương trình quãng đường $s(t) = 2t^3 - 6t^2 + 4t$ (mét), với $t >= 0$ (giây). Gia tốc tức thời của vật bằng $0" m/s"^2$ tại thời điểm $t$ bằng bao nhiêu giây?],
    (
        [$0.5" s"$],
        True([$1" s"$]),
        [$1.5" s"$],
        [$2" s"$]
    ),
    loigiai: [
        - Vận tốc tức thời: $v(t) = s'(t) = 6t^2 - 12t + 4$.
        - Gia tốc tức thời: $a(t) = v'(t) = 12t - 12$.
        - Cho $a(t) = 0 <==> 12t - 12 = 0 <==> t = 1" s"$.
        Chọn đáp án B.
    ]
)

// TN 9
#tn([Cho đồ thị hàm số $y = x^2 + 4$. Có hai tiếp tuyến của đồ thị đi qua gốc tọa độ $O(0; 0)$. Hệ số góc dương của tiếp tuyến đó bằng bao nhiêu?],
    (
        [$k = 2$],
        True([$k = 4$]),
        [$k = 6$],
        [$k = 8$]
    ),
    loigiai: [
        - Phương trình đường thẳng đi qua gốc tọa độ $O(0; 0)$ có dạng $y = k x$.
        - Điều kiện tiếp xúc: Hệ phương trình $x^2 + 4 = k x$ và $2x = k$.
        - Thế $k = 2x$ vào phương trình thứ nhất: $x^2 + 4 = 2x^2 <==> x^2 = 4 <==> x = pm 2$.
        - Vì cần tìm hệ số góc dương $k > 0 ==> x = 2 ==> k = 2(2) = 4$.
        Chọn đáp án B.
    ]
)

// TN 10
#tn([Số lượng vi khuẩn trong một môi trường nuôi cấy sau $t$ giờ được mô hình hóa bởi $N(t) = 1000 + (500t)/(t + 1)$ (con). Tốc độ tăng trưởng quần thể vi khuẩn tại thời điểm $t = 3$ giờ là bao nhiêu con/giờ?],
    (
        [$25.00$],
        True([$31.25$]),
        [$45.50$],
        [$50.00$]
    ),
    loigiai: [
        - Tốc độ tăng trưởng vi khuẩn là đạo hàm $N'(t) = (500(t+1) - 500t)/((t+1)^2) = (500)/((t+1)^2)$.
        - Tại $t = 3 ==> N'(3) = (500)/((3+1)^2) = (500)/(16) = 31.25$ con/giờ.
        Chọn đáp án B.
    ]
)

// TN 11
#tn([Cho hàm số $f(x) = x dot cos x$. Giá trị đạo hàm $f'(0)$ bằng bao nhiêu?],
    (
        [$0$],
        True([$1$]),
        [$-1$],
        [$pi$]
    ),
    loigiai: [
        - Đạo hàm tích: $f'(x) = (x)' cos x + x (cos x)' = cos x - x sin x$.
        - Thay $x = 0 ==> f'(0) = cos 0 - 0 dot sin 0 = 1$.
        Chọn đáp án B.
    ]
)

// TN 12
#tn([Tiếp tuyến của đồ thị hàm số $y = 1/3 x^3 - x$ tại điểm có hoành độ $x_0 = sqrt(2)$ tạo với trục hoành một góc bằng bao nhiêu độ?],
    (
        [$30°$],
        True([$45°$]),
        [$60°$],
        [$90°$]
    ),
    loigiai: [
        - Ta có đạo hàm $y' = x^2 - 1$.
        - Hệ số góc tiếp tuyến tại $x_0 = sqrt(2)$ là $k = y'(sqrt(2)) = (sqrt(2))^2 - 1 = 1$.
        - Vì $k = tan alpha = 1 ==> alpha = 45°$.
        Chọn đáp án B.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một vòi phun nước nghệ thuật có mô hình quỹ đạo dòng nước trong mặt phẳng tọa độ là parabol $(P): y = -0.5 x^2 + 2x$, trong đó $x, y$ tính bằng mét (như hình vẽ bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Độ cao cực đại của dòng nước đạt được tại $x = 2$ m và bằng $2$ m.]),
        True([Hệ số góc của dòng nước tại điểm xuất phát $x = 0$ là $k = 2$.]),
        False([Tiếp tuyến của dòng nước tại điểm rơi xuống đất ($x = 4$) có hệ số góc bằng $2$.]),
        True([Phương trình tiếp tuyến của dòng nước tại điểm có hoành độ $x = 1$ là $y = x + 0.5$.])
    ),
    fig: fig-tangent-parabola,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Đạo hàm $y' = -x + 2 = 0 <==> x = 2$. Độ cao cực đại $y(2) = -0.5(4) + 4 = 2$ m.
        - *b)* Đúng. Hệ số góc tại điểm xuất phát $x = 0$ là $y'(0) = 2$.
        - *c)* Sai. Điểm rơi xuống đất khi $y = 0 <==> -0.5x^2 + 2x = 0 <==> x = 4$. Hệ số góc tại $x = 4$ là $y'(4) = -4 + 2 = -2$ (chứ không phải 2).
        - *d)* Đúng. Tại $x = 1 ==> y(1) = 1.5$ và $y'(1) = 1$. PTTT là $y = 1(x - 1) + 1.5 <==> y = x + 0.5$.
    ]
)

// DS 2
#ds([Điện lượng $Q$ (tính bằng milli-Coulomb, mC) nạp vào một tụ điện trong mạch RC biến thiên theo thời gian $t$ (giây, $t >= 0$) theo công thức $Q(t) = 10(1 - e^(-2t))$ (như đồ thị bên dưới). Các phát biểu sau đúng hay sai?],
    (
        True([Cường độ dòng điện tức thời trong mạch là $I(t) = Q'(t) = 20 e^(-2t)$ (mA).]),
        True([Tại thời điểm ban đầu $t = 0$, cường độ dòng điện nạp vào tụ đạt giá trị cực đại bằng $20$ mA.]),
        False([Khi thời gian $t -> +oo$, cường độ dòng điện tức thời trong mạch tiến về $10$ mA.]),
        True([Tốc độ giảm của cường độ dòng điện tại thời điểm $t = 0$ bằng $40" mA/s"$.])
    ),
    fig: fig-circuit-rc,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Cường độ dòng điện $I(t) = Q'(t) = 10 dot (-(-2) e^(-2t)) = 20 e^(-2t)$ (mA).
        - *b)* Đúng. Vì $e^(-2t) <= 1$ nên $I(t) <= 20$. Tại $t = 0 ==> I(0) = 20$ mA.
        - *c)* Sai. Khi $t -> +oo$, $e^(-2t) -> 0 ==> I(t) -> 0$ mA (dòng điện tắt dần, không phải 10 mA).
        - *d)* Đúng. Đạo hàm của cường độ dòng điện $I'(t) = -40 e^(-2t) ==> |I'(0)| = 40$ mA/s.
    ]
)

// DS 3
#ds([Trong một động cơ đốt trong, vị trí của pit-tông di chuyển trong xi-lanh (như hình vẽ bên dưới) theo thời gian $t$ (giây) được cho bởi phương trình $x(t) = 10 cos(100 pi t) + 2 cos(200 pi t)$ (cm). Các phát biểu sau đúng hay sai?],
    (
        True([Vận tốc tức thời của pit-tông là $v(t) = -1000 pi sin(100 pi t) - 400 pi sin(200 pi t)$ (cm/s).]),
        True([Tại các thời điểm $t = k/100$ giây ($k in ZZ$), vận tốc tức thời của pit-tông đều bằng $0$.]),
        False([Gia tốc tức thời của pit-tông tại thời điểm ban đầu $t = 0$ bằng $0" cm/s"^2$.]),
        True([Độ lớn gia tốc tức thời tại $t = 0$ bằng $180000 pi^2" cm/s"^2$.])
    ),
    fig: fig-piston-engine,
    fig-width: 22%,
    loigiai: [
        - *a)* Đúng. Vận tốc $v(t) = x'(t) = -10 dot 100 pi sin(100 pi t) - 2 dot 200 pi sin(200 pi t) = -1000 pi sin(100 pi t) - 400 pi sin(200 pi t)$ (cm/s).
        - *b)* Đúng. Khi $t = k/100 ==> 100 pi t = k pi$ và $200 pi t = 2k pi$. Vì $sin(k pi) = sin(2k pi) = 0 ==> v = 0$.
        - *c)* Sai. Gia tốc $a(t) = v'(t) = -100000 pi^2 cos(100 pi t) - 80000 pi^2 cos(200 pi t)$. Tại $t = 0 ==> a(0) = -180000 pi^2 neq 0$.
        - *d)* Đúng. Độ lớn gia tốc tại $t = 0$ là $|a(0)| = 180000 pi^2" cm/s"^2$.
    ]
)

// DS 4
#ds([Nhiệt độ $T$ (đơn vị: °C) của một tách cà phê nóng sau khi pha được để làm nguội trong phòng có nhiệt độ $25°$C được mô hình hóa theo định luật làm nguội của Newton (như đồ thị bên dưới) bởi hàm số $T(t) = 25 + 70 dot 2^(-0.1 t)$, trong đó $t$ là thời gian tính bằng phút. Các phát biểu sau đúng hay sai?],
    (
        True([Nhiệt độ ban đầu của tách cà phê khi vừa pha xong ($t = 0$) là $95°$C.]),
        True([Khi thời gian $t$ rất lớn, nhiệt độ tách cà phê giảm dần về nhiệt độ môi trường là $25°$C.]),
        False([Tốc độ giảm nhiệt độ tức thời tại thời điểm $t = 10$ phút bằng $7 ln 2$ °C/phút.]),
        True([Tốc độ giảm nhiệt độ tức thời lớn nhất tại thời điểm ban đầu $t = 0$.])
    ),
    fig: fig-cooling-curve,
    fig-width: 30%,
    loigiai: [
        - *a)* Đúng. Thay $t = 0 ==> T(0) = 25 + 70 dot 2^0 = 95°$C.
        - *b)* Đúng. Khi $t -> +oo ==> 2^(-0.1t) -> 0 ==> T(t) -> 25°$C.
        - *c)* Sai. Đạo hàm $T'(t) = 70 dot 2^(-0.1t) dot (-0.1 ln 2) = -7 dot 2^(-0.1t) ln 2$. Tại $t = 10 ==> T'(10) = -7 dot 2^(-1) ln 2 = -3.5 ln 2 ==>$ Tốc độ giảm là $3.5 ln 2$ °C/phút (chứ không phải $7 ln 2$).
        - *d)* Đúng. Vì $|T'(t)| = 7 ln 2 dot 2^(-0.1t)$ giảm dần theo $t$, nên tốc độ giảm lớn nhất khi $t = 0$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6. Điền kết quả là một số nguyên hoặc số thập phân.], count: 6)

// TLN 1
#tln([Cho hàm số $y = (x^2 - x + 1)/(x - 1)$. Tính hệ số góc $k$ của tiếp tuyến của đồ thị hàm số tại điểm có hoành độ $x_0 = 2$.],
    [0],
    loigiai: [
        - Biến đổi hoặc dùng đạo hàm thương: $y = x + (1)/(x - 1) ==> y' = 1 - (1)/((x - 1)^2)$.
        - Tại $x_0 = 2 ==> k = y'(2) = 1 - (1)/((2 - 1)^2) = 1 - 1 = 0$.
        Đáp số: $0$.
    ]
)

// TLN 2
#tln([Vận tốc của một hạt mang điện chuyển động trong từ trường được cho bởi $v(t) = 6t^2 - t^3$ (m/s), với $t in [0; 4]$ (giây). Tính gia tốc cực đại của hạt mang điện trong khoảng thời gian đó (tính bằng $m/s^2$).],
    [12],
    loigiai: [
        - Gia tốc của hạt là $a(t) = v'(t) = 12t - 3t^2$.
        - Khảo sát $a(t)$ trên $[0; 4]$: $a'(t) = 12 - 6t = 0 <==> t = 2$.
        - Ta có $a(0) = 0$, $a(4) = 0$, $a(2) = 12(2) - 3(4) = 12" m/s"^2$.
        - Gia tốc cực đại là $12" m/s"^2$.
        Đáp số: $12$.
    ]
)

// TLN 3
#tln([Một hình vuông có độ dài cạnh $x$ (cm) đang tăng đều với tốc độ $0.5" cm/s"$. Tính tốc độ tăng diện tích của hình vuông tại thời điểm cạnh hình vuông bằng $10$ cm (tính bằng "cm"^2"/s").],
    [10],
    loigiai: [
        - Diện tích hình vuông là $S = x^2$.
        - Lấy đạo hàm hai vế theo thời gian $t$: $(d S)/(d t) = 2x dot (d x)/(d t)$.
        - Thay $x = 10$ và $(d x)/(d t) = 0.5 ==> (d S)/(d t) = 2 dot 10 dot 0.5 = 10" cm"^2"/s"$.
        Đáp số: $10$.
    ]
)

// TLN 4
#tln([Cho parabol $(P): y = x^2 - 2x + 3$. Biết rằng có hai tiếp tuyến của parabol đi qua điểm $A(1; 0)$. Tính tích hai hệ số góc $k_1 dot k_2$ của hai tiếp tuyến đó.],
    [-8],
    loigiai: [
        - Đường thẳng đi qua $A(1; 0)$ có hệ số góc $k$ có phương trình: $y = k(x - 1)$.
        - Điều kiện tiếp xúc với $(P)$: Hệ $x^2 - 2x + 3 = k(x - 1)$ và $2x - 2 = k$.
        - Thế $k$: $x^2 - 2x + 3 = (2x - 2)(x - 1) <==> x^2 - 2x + 3 = 2x^2 - 4x + 2 <==> x^2 - 2x - 1 = 0$.
        - Hai tiếp điểm có hoành độ $x_1, x_2$ thỏa mãn Định lý Vi-ét: $x_1 + x_2 = 2, x_1 x_2 = -1$.
        - Hai hệ số góc: $k_1 = 2x_1 - 2, k_2 = 2x_2 - 2 ==> k_1 k_2 = 4(x_1 - 1)(x_2 - 1) = 4(x_1 x_2 - (x_1 + x_2) + 1) = 4(-1 - 2 + 1) = -8$.
        Đáp số: $-8$.
    ]
)

// TLN 5
#tln([Chiều cao của một ngọn sóng biển theo thời gian $t$ (giây) được mô hình hóa bởi $h(t) = 3 + 2 sin((pi t)/(4))$ (mét). Tính tốc độ thay đổi chiều cao của sóng tại thời điểm $t = 2$ giây (tính bằng m/s).],
    [0],
    loigiai: [
        - Tốc độ thay đổi chiều cao tức thời là đạo hàm $h'(t) = 2 dot (pi)/(4) cos((pi t)/(4)) = (pi)/(2) cos((pi t)/(4))$.
        - Tại $t = 2 ==> h'(2) = (pi)/(2) cos((pi)/(2)) = (pi)/(2) dot 0 = 0" m/s"$.
        Đáp số: $0$.
    ]
)

// TLN 6
#tln([Cho hàm số $y = (x + 2)/(x - 1)$ có đồ thị $(H)$. Tiếp tuyến của đồ thị $(H)$ tại điểm có hoành độ $x_0 = 2$ cắt đường thẳng $d: y = x + 1$ tại điểm $P(x_P; y_P)$. Tính giá trị của tổng $x_P + y_P$.],
    [5.5],
    loigiai: [
        - Đạo hàm $y' = (-3)/((x - 1)^2) ==> y'(2) = -3$.
        - Tung độ tiếp điểm $y(2) = 4 ==>$ PTTT là $y = -3(x - 2) + 4 <==> y = -3x + 10$.
        - Hoành độ giao điểm $P$ là nghiệm của: $-3x + 10 = x + 1 <==> 4x = 9 <==> x_P = 2.25$.
        - Tung độ giao điểm $y_P = 2.25 + 1 = 3.25$.
        - Tổng $x_P + y_P = 2.25 + 3.25 = 5.5$.
        Đáp số: $5.5$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
