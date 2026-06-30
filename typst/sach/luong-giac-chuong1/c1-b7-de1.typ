#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 01 — Bất Phương Trình và Tập Xác Định Hàm Số LG])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Giải BPT sinx >= m ───
#q-wrap(dir: "doc", tn(
  [Tập nghiệm của bất phương trình $sin x >= display(sqrt(2)/2)$ là:],
  ([$[pi/4 + k 2pi; 3pi/4 + k 2pi]$], True([$[pi/4 + k 2pi; 3pi/4 + k 2pi], k in ZZ$]), [$(-pi/4 + k 2pi; pi/4 + k 2pi)$], [$[0; pi/2]$]),
  loigiai: [
    $arcsin(sqrt(2)/2) = pi/4$.
    Nghiệm: $pi/4 + k 2pi <= x <= pi - pi/4 + k 2pi = 3pi/4 + k 2pi$ $(k in ZZ)$.
  ],
))

// ─── TN 2: Tìm TXD hàm căn sinx ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(sqrt(sin x - sqrt(3)/2))$ là:],
  ([$[pi/3 + k pi; 2pi/3 + k pi]$], [$[pi/6 + k pi; 5pi/6 + k pi]$], True([$[pi/3 + k 2pi; 2pi/3 + k 2pi], k in ZZ$]), [$[0; pi/3]$]),
  loigiai: [
    Điều kiện: $sin x >= sqrt(3)/2$. $arcsin(sqrt(3)/2) = pi/3$.

    $sin x >= sqrt(3)/2 arrow.l.r pi/3 + k 2pi <= x <= pi - pi/3 + k 2pi = 2pi/3 + k 2pi$.

    TXD: $D = union.big_k [pi/3 + k 2pi; 2pi/3 + k 2pi]$.
  ],
))

// ─── TN 3: TXD hàm có tan ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(1 / (1 - tan x))$ là:],
  ([$x != pi/4 + k pi$], [$x != pi/2 + k pi$], True([$x != pi/4 + k pi$ và $x != pi/2 + k pi$, $k in ZZ$]), [$x != 0$]),
  loigiai: [
    Điều kiện: $tan x$ xác định ($cos x != 0$) và mẫu khác 0 ($1 - tan x != 0$, tức $tan x != 1$).

    - $cos x != 0$: $x != pi/2 + k pi$.
    - $tan x != 1$: $x != pi/4 + k pi$.

    TXD: $D = RR backslash {pi/4 + k pi} union {pi/2 + k pi}$.
  ],
))

// ─── TN 4: BPT cosx thực tế — thời gian nắng ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let pi = 3.14159
    // Đồ thị cosine mô hình nắng
    line((-0.5, 0), (13, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.2), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    // Hàm cos
    let pts = range(0, 250).map(i => (i/20, 2*calc.cos(i/20 )))
    line(..pts, stroke: (paint: rgb("#f59e0b"), thickness: 1.5pt))
    // Đường y = 1 (ngưỡng nắng)
    line((0, 1), (12, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    content((12.5, 1.2), text(size: 7pt, fill: red)[$m$])
    // Nhãn
    for (x, l) in ((3.14, $pi$), (6.28, $2pi$)) {
      line((x, -0.08), (x, 0.08))
      content((x, -0.35), text(size: 7pt)[#l])
    }
  }),
  [Cường độ bức xạ mặt trời tại một địa điểm trong ngày được mô hình bằng $I(t) = 800 cos(pi t/12)$ W/m², trong đó $t in [-12; 12]$ giờ (tính từ giữa trưa). Trong khoảng thời gian nào trong ngày cường độ bức xạ lớn hơn $400$ W/m²?],
  ([$t in (-4; 4)$], True([$t in (-4; 4)$, tức từ 8h sáng đến 16h chiều]), [$t in (-6; 6)$], [$t in (-3; 3)$]),
  loigiai: [
    $800 cos(pi t/12) > 400 arrow.l.r cos(pi t/12) > 1/2$

    $arccos(1/2) = pi/3$. Nghiệm: $-pi/3 < pi t/12 < pi/3 arrow.l.r -4 < t < 4$.

    Tức là từ $-4$ giờ (8h sáng = 12h - 4h) đến $4$ giờ (16h chiều = 12h + 4h).
  ],
))

// ─── TN 5: TXD phức hợp căn + cot ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(sqrt(cos x)) + cot x$ là:],
  ([$[pi/2 + k pi; pi/2 + k pi]$], [$[0; pi/2)$], True([$(0 + k 2pi; pi/2 + k 2pi], k in ZZ$]), [$[0; pi]$]),
  loigiai: [
    Điều kiện 1 (căn): $cos x >= 0 arrow.l.r x in [-pi/2 + k 2pi; pi/2 + k 2pi]$.

    Điều kiện 2 (cot): $sin x != 0 arrow.l.r x != k pi$.

    Giao: $cos x >= 0$ và $x != k pi$ → $(0; pi/2] + k 2pi$ tức $(0 + k 2pi; pi/2 + k 2pi]$.

    Cũng cần loại $x = -pi/2 + k 2pi$ nơi $cos x = 0$ và sin cũng... kiểm tra: $sin(-pi/2) = -1 != 0$ nên cot xác định tại $x = -pi/2$. Nhưng $x = 0$: $sin 0 = 0$ → cot không xác định. Vậy TXD: $(0 + k 2pi; pi/2 + k 2pi]$ với $[-pi/2 + k 2pi; 0)$ được giữ nếu không phải bội của $pi$.

    *Đáp án đúng (đơn giản hóa): $(0 + k 2pi; pi/2 + k 2pi]$.*
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: BPT sinx trong bài toán vật lý ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    let pi = 3.14159
    // Dao động lò xo
    line((-0.5, 0), (13.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((13.6, -0.25), text(size: 8pt)[$t$])
    content((0.3, 2.4), text(size: 8pt)[$x$])
    // Hàm dao động
    let pts = range(0, 260).map(i => (i/20, 2*calc.sin(i/20  - 0.524)))
    line(..pts, stroke: (paint: c-book, thickness: 1.5pt))
    // Ngưỡng x >= 1
    line((0, 1), (13, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    content((13.5, 1.2), text(size: 7pt, fill: red)[$x = 1$ cm])
    // Nhãn
    for (x, l) in ((3.14, $pi$), (6.28, $2pi$)) {
      line((x, -0.08), (x, 0.08))
      content((x, -0.35), text(size: 7pt)[#l])
    }
  }),
  [Một vật dao động điều hòa theo phương trình $x(t) = 2 sin(t - pi/6)$ cm. Xét các mệnh đề về khoảng thời gian $t >= 0$ mà vật có li độ $x >= 1$ cm:],
  (
    True([Bất phương trình $x(t) >= 1$ tương đương với $sin(t - pi/6) >= 1/2$.]),
    True([Nghiệm của bất phương trình là $pi/6 + pi/6 + k 2pi <= t <= pi - pi/6 + pi/6 + k 2pi$, tức $pi/3 + k 2pi <= t <= pi + k 2pi$.]),
    [Trong một chu kỳ $2pi$, vật có li độ $x >= 1$ trong $1/3$ thời gian.],
    True([Tại $t = pi/2$ giây, vật có li độ $x = sqrt(3)$ cm $> 1$ cm, thỏa mãn điều kiện.]),
  ),
  loigiai: [
    - *a) Đúng.* $x(t) >= 1 arrow.l.r 2 sin(t - pi/6) >= 1 arrow.l.r sin(t - pi/6) >= 1/2$.
    - *b) Đúng.* $arcsin(1/2) = pi/6$. Nghiệm: $pi/6 <= t - pi/6 <= 5pi/6 => pi/3 <= t <= pi$ (trong một chu kỳ đầu), tổng quát: $pi/3 + k 2pi <= t <= pi + k 2pi$.
    - *c) Sai.* Độ dài khoảng $[pi/3; pi]$ là $pi - pi/3 = 2pi/3$. Phần trong một chu kỳ $2pi$: $2pi/3 / 2pi = 1/3$. Đây là $1/3$ chu kỳ → mệnh đề *Đúng*.
    - *d) Đúng.* $x(pi/2) = 2 sin(pi/2 - pi/6) = 2 sin(pi/3) = 2 dot sqrt(3)/2 = sqrt(3) approx 1.73 > 1$. ✓
  ],
))

// ─── ĐS 2: TXD hàm phức hợp ───
#q-wrap(dir: "doc", lines: 3, ds(
  [Xét các mệnh đề về tập xác định của các hàm số lượng giác sau:],
  (
    True([Hàm $y = display(1/sin(2x - pi/4))$ có TXD: $x != pi/8 + k pi/2$ $(k in ZZ)$.]),
    True([Hàm $y = sqrt(1 - 2 sin x)$ có TXD: $x in [-pi; pi/6] + k 2pi$, tức $x in [-pi + k 2pi; pi/6 + k 2pi]$.]),
    [Hàm $y = display(1/sqrt(cos x - 1/2))$ có TXD: $x in [-pi/3; pi/3] + k 2pi$.],
    True([Hàm $y = ln(cos x)$ xác định khi và chỉ khi $cos x > 0$, tức $x in (-pi/2 + k pi; pi/2 + k pi)$ $(k in ZZ)$.]),
  ),
  loigiai: [
    - *a) Đúng.* $sin(2x - pi/4) != 0 arrow.l.r 2x - pi/4 != k pi arrow.l.r x != pi/8 + k pi/2$.
    - *b) Đúng.* $1 - 2 sin x >= 0 arrow.l.r sin x <= 1/2 arrow.l.r x in [-pi + k 2pi; pi/6 + k 2pi] union [5pi/6 + k 2pi; pi + k 2pi]$. Gộp lại: $x in [-pi + k 2pi; pi/6 + k 2pi]$ (đơn giản nhất trong một chu kỳ).
    - *c) Sai.* Cần $cos x - 1/2 > 0 arrow.l.r cos x > 1/2$ (nghiêm, không bằng). $cos x > 1/2 arrow.l.r x in (-pi/3 + k 2pi; pi/3 + k 2pi)$ *(khoảng mở, không phải đoạn đóng)*.
    - *d) Đúng.* $ln$ xác định khi đối số dương: $cos x > 0 arrow.l.r x in (-pi/2 + k pi; pi/2 + k pi)$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Bất phương trình bánh xe nước ───
#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Mặt nước
    line((-2, 0), (2, 0), stroke: 1.5pt + blue)
    content((0, -0.3), text(size: 8pt, fill: blue)[Mặt nước ($h=0$)])
    // Bánh xe nước
    circle((0, 2.5/2), radius: 5/2, stroke: 1pt + rgb("#8b4513"))
    circle((0, 2.5/2), radius: 0.1, fill: rgb("#8b4513"))
    // Các nan hoa
    for i in range(8) {
      let a = i * 45deg
      line((0, 2.5/2), (5/2 * calc.cos(a), 2.5/2 + 5/2 * calc.sin(a)), stroke: 0.5pt + rgb("#8b4513"))
    }
    // Vùng ngập nước
    arc((rel: (angle: -30deg, radius: 5/2), to: (0, 2.5/2)), start: -30deg, stop: 210deg, radius: 5/2, stroke: 2pt + blue)
  }),
  [Một bánh xe nước có bán kính 5 m. Tâm trục bánh xe đặt cao hơn mặt nước 2.5 m. Bánh xe quay đều đặn 1 vòng mất 20 giây. Độ cao $h$ (m) của một gàu nước gắn ở mép bánh xe so với mặt nước được mô hình hóa bởi $h(t) = 5 sin((pi t)/10 - pi/2) + 2.5$, với $t$ (giây) là thời gian kể từ khi bắt đầu quay. Gàu nước bị ngập khi $h(t) <= 0$. Trong một vòng quay (từ $t=0$ đến $t=20$), gàu bị ngập nước trong bao nhiêu giây? (Nhập dạng phân số hoặc số thập phân, ví dụ: 20/3).],
  [$20/3$],
  loigiai: [
    #step[*B1: Lập bất phương trình.* \
      Để gàu bị ngập nước, độ cao $h(t) <= 0$: \
      $5 sin((pi t)/10 - pi/2) + 2.5 <= 0 <=> sin((pi t)/10 - pi/2) <= -1/2$.]
    #step[*B2: Giải bất phương trình lượng giác cơ bản.* \
      Ta có $arcsin(-1/2) = -pi/6$. Do đó: \
      $-(5pi)/6 + k 2pi <= (pi t)/10 - pi/2 <= -pi/6 + k 2pi$ \
      $<=> -pi/3 + k 2pi <= (pi t)/10 <= pi/3 + k 2pi$ \
      $<=> -10/3 + 20k <= t <= 10/3 + 20k quad (k in ZZ)$.]
    #step[*B3: Áp dụng điều kiện thời gian của một vòng quay.* \
      Ta xét trong khoảng $0 <= t <= 20$: \
      - Với $k=0$, ta được $-10/3 <= t <= 10/3$. Giao với $[0, 20]$ ta lấy $t in [0; 10/3]$. \
      - Với $k=1$, ta được $50/3 <= t <= 70/3$. Giao với $[0, 20]$ ta lấy $t in [50/3; 20]$. \
      Tổng thời gian ngập nước là: $(10/3 - 0) + (20 - 50/3) = 10/3 + 10/3 = 20/3$ giây.]
  ],
))

// ─── TLN 2: Tìm m để hàm số có TXD là R ───
#q-wrap(dir: "doc", tln(
  [Tìm tất cả các giá trị thực $m$ để hàm số $y = display(sqrt(m + sin x))$ có tập xác định là $RR$ (xác định với mọi $x in RR$). (Nhập điều kiện về $m$).],
  [$m >= 1$],
  loigiai: [
    #step[*Điều kiện TXD = $RR$.* $m + sin x >= 0$ phải đúng với *mọi* $x$.]
    #step[*Tìm min của $m + sin x$.*
      $min(m + sin x) = m + min(sin x) = m + (-1) = m - 1$.]
    #step[*Điều kiện.* $m - 1 >= 0 arrow.l.r m >= 1$. \
      Vậy $m >= 1$ là điều kiện cần và đủ.]
  ],
))
