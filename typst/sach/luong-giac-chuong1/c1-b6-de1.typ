#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 01 — Hàm Số $y = a sin x + b cos x$])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Tìm R ───
#q-wrap(dir: "doc", tn(
  [Giá trị lớn nhất của hàm số $f(x) = 5 sin x - 12 cos x$ là:],
  ([$12$], [$5$], True([$13$]), [$17$]),
  loigiai: [
    $R = sqrt(5^2 + (-12)^2) = sqrt(25 + 144) = sqrt(169) = 13$.
    Hàm số $f(x) = 13 sin(x + phi)$ với $cos phi = 5/13$, $sin phi = -12/13$.
    $max f(x) = R = 13$.
  ],
))

// ─── TN 2: Điện xoay chiều thực tế ───
#q-wrap(dir: "doc", tn(
  [Trong một mạch điện, hai điện áp thành phần là $u_1 = 3 sin(omega t)$ V và $u_2 = 4 cos(omega t)$ V. Điện áp tổng $u = u_1 + u_2$ có biên độ và pha ban đầu ($phi$ sao cho $u = R sin(omega t + phi)$) lần lượt là:],
  ([$R = 7$; $phi = 0$], [$R = 5$; $phi = 0$], True([$R = 5$; $phi = arctan(4/3) approx 53.1°$]), [$R = 5$; $phi = arctan(3/4) approx 36.9°$]),
  loigiai: [
    $u = 3 sin(omega t) + 4 cos(omega t) = R sin(omega t + phi)$ với:
    $R = sqrt(9 + 16) = 5$ V; $cos phi = 3/5$; $sin phi = 4/5$ nên $phi = arctan(4/3) approx 53.1°$.
  ],
))

// ─── TN 3: Giải phương trình asinx + bcosx = c ───
#q-wrap(dir: "doc", tn(
  [Phương trình $sqrt(3) sin x + cos x = 1$ có nghiệm là:],
  ([$x = pi/6 + k 2pi$], [$x = k pi$], True([$x = k 2pi$ hoặc $x = pi/3 + k 2pi$, $(k in ZZ)$]), [$x = pi/3 + k pi$]),
  loigiai: [
    $R = sqrt(3 + 1) = 2$. Chia hai vế cho $2$:
    $display(sqrt(3)/2) sin x + display(1/2) cos x = display(1/2)$
    $sin(x + pi/6) = display(1/2) = sin(pi/6)$

    $hoac(x + pi/6 = pi/6 + k 2pi, x + pi/6 = pi - pi/6 + k 2pi)
    arrow.l.r hoac(x = k 2pi, x = pi/3 + k 2pi)$ $(k in ZZ)$.
  ],
))

// ─── TN 4: Nhiệt độ trong ngày (mô hình hóa) ───
#q-wrap(dir: "doc", tn(
  [Nhiệt độ (°C) trong một ngày tại một thành phố được mô hình bằng $T(t) = 15 sin(pi t/12 - pi/2) + 25$, trong đó $t$ là số giờ từ nửa đêm ($0 <= t <= 24$). Nhiệt độ cao nhất trong ngày là:],
  ([$25°C$], [$35°C$], True([$40°C$]), [$15°C$]),
  loigiai: [
    $T(t)$ lớn nhất khi $sin(pi t/12 - pi/2) = 1$.
    $max T = 15 dot 1 + 25 = 40°C$.

    Thời điểm: $pi t/12 - pi/2 = pi/2 => t = 12$ giờ trưa.
  ],
))

// ─── TN 5: Chu kỳ và pha ───
#q-wrap(dir: "doc", tn(
  [Hàm số $f(x) = sin x + cos x$ có chu kỳ $T$, biên độ $R$ và pha ban đầu $phi$ lần lượt là:],
  ([$T = pi$; $R = sqrt(2)$; $phi = pi/4$], True([$T = 2pi$; $R = sqrt(2)$; $phi = pi/4$]), [$T = 2pi$; $R = 2$; $phi = pi/4$], [$T = pi$; $R = 2$; $phi = 0$]),
  loigiai: [
    $f(x) = sin x + cos x = sqrt(2) sin(x + pi/4)$. Biên độ $R = sqrt(2)$; chu kỳ $T = 2pi$; pha $phi = pi/4$.
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: Mô hình hóa sóng âm ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.8, -0.4), text(size: 8pt)[$t$])
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.4, 2.3), text(size: 8pt)[$y$ (Pa)])
    
    // Scale: y max is 10, so divide by 5 for drawing height max 2
    // y1 = 6 sin(t) -> blue
    // y2 = 8 cos(t) -> red
    // y = 10 sin(t + phi) -> purple
    let pts1 = range(0, 50).map(i => { let t = i/10; (t, 6/5 * calc.sin(180deg*t/1.5)) })
    let pts2 = range(0, 50).map(i => { let t = i/10; (t, 8/5 * calc.cos(180deg*t/1.5)) })
    let pts = range(0, 50).map(i => { let t = i/10; (t, (6/5 * calc.sin(180deg*t/1.5) + 8/5 * calc.cos(180deg*t/1.5))) })
    
    line(..pts1, stroke: 1pt + blue, name: "y1")
    line(..pts2, stroke: 1pt + red, name: "y2")
    line(..pts, stroke: 1.5pt + purple, name: "y")
    
    content((1, 1.8), text(size: 7pt, fill: purple)[Tổng hợp])
    content((0.5, 0.8), text(size: 7pt, fill: blue)[$y_1$])
    content((2.5, 1.2), text(size: 7pt, fill: red)[$y_2$])
  }),
  [Một kỹ sư âm thanh phân tích sự giao thoa của hai sóng âm thành phần: $y_1 = 6 sin(440 pi t)$ và $y_2 = 8 cos(440 pi t)$ (đơn vị Pa, giây). Xét các mệnh đề về sóng tổng hợp $y = y_1 + y_2$:],
  (
    True([Biên độ của sóng tổng hợp là $R = 10$ Pa.]),
    True([Sóng tổng hợp có tần số $f = 220$ Hz (giống hai sóng thành phần).]),
    [Pha ban đầu $phi$ thỏa $tan phi = 6/8 = 0.75$.],
    True([Giá trị lớn nhất của áp suất âm thanh $y$ là $10$ Pa và đạt được khi $440 pi t + phi = pi/2 + k 2pi$.]),
  ),
  loigiai: [
    $y = 6 sin(440 pi t) + 8 cos(440 pi t) = R sin(440 pi t + phi)$ với $R = sqrt(36 + 64) = 10$.
    - *a) Đúng.* $R = sqrt(6^2 + 8^2) = 10$ Pa.
    - *b) Đúng.* Tần số $f = display(440 pi / (2pi)) = 220$ Hz.
    - *c) Sai.* $cos phi = 6/10 = 0.6$; $sin phi = 8/10 = 0.8$ nên $tan phi = 8/6 = 4/3$, không phải $3/4$.
    - *d) Đúng.* $max y = R = 10$ Pa khi $440 pi t + phi = pi/2 + k 2pi$.
  ],
))

// ─── ĐS 2: Mực nước biển ───
#q-wrap(dir: "doc", lines: 3, ds(
  [Mực nước tại một cảng cá được mô hình bằng $h(t) = 1.5 sin(pi t/6) + 2 cos(pi t/6)$ (m), $t$ tính bằng giờ. Xét các mệnh đề:],
  (
    True([Biên độ dao động mực nước là $R = 2.5$ m.]),
    True([Chu kỳ thủy triều trong mô hình này là $T = 12$ giờ.]),
    [Mực nước cao nhất trong mô hình đạt $2.5$ m so với *đường trung bình* của mô hình.],
    True([Hàm $h(t)$ có thể viết lại là $h(t) = 2.5 sin(pi t/6 + phi)$ với $tan phi = 4/3$.]),
  ),
  loigiai: [
    - *a) Đúng.* $R = sqrt{1.5^2 + 2^2} = sqrt{6.25} = 2.5$ m.
    - *b) Đúng.* $b = pi/6$ nên $T = 2pi / (pi/6) = 12$ giờ.
    - *c) Đúng.* Biên độ $R = 2.5$ m, mực nước dao động từ $-2.5$ đến $+2.5$ m so với đường trung bình.
    - *d) Đúng.* $cos phi = 1.5/2.5 = 3/5$; $sin phi = 2/2.5 = 4/5$ nên $tan phi = 4/3$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Biên độ tổng hợp ───
#q-wrap(dir: "doc", tln(
  [Hai dao động cùng tần số: $x_1 = 4 sin(omega t)$ cm và $x_2 = 4 sin(omega t + 2pi/3)$ cm. Biên độ của dao động tổng hợp $x = x_1 + x_2$ bằng bao nhiêu cm?],
  [$4$],
  loigiai: [
    #step[*Dùng công thức tổng thành tích.*
      $x = 4 sin(omega t) + 4 sin(omega t + 2pi/3)$
      $= 2 dot 4 dot cos(pi/3) dot sin(omega t + pi/3)$
      $= 8 dot (1/2) dot sin(omega t + pi/3) = 4 sin(omega t + pi/3)$.]
    #step[*Biên độ tổng hợp.* $R = 4$ cm.]
  ],
))

// ─── TLN 2: Giá trị x để hàm đạt max ───
#q-wrap(dir: "doc", tln(
  [Tìm giá trị nhỏ nhất dương của $x$ để hàm số $f(x) = sqrt(3) sin x + cos x$ đạt giá trị lớn nhất. (Viết kết quả dạng $k pi/6$ với $k$ là số nguyên dương).],
  [$pi/3$],
  loigiai: [
    #step[*Biến đổi.* $R = sqrt(3+1) = 2$; $cos phi = sqrt(3)/2$; $sin phi = 1/2$ nên $phi = pi/6$. \
      $f(x) = 2 sin(x + pi/6)$.]
    #step[*Điều kiện max.* $sin(x + pi/6) = 1 arrow.l.r x + pi/6 = pi/2 + k 2pi$.]
    #step[*Giải.* $x = pi/2 - pi/6 + k 2pi = pi/3 + k 2pi$. \
      Giá trị nhỏ nhất dương: $x = pi/3$ (khi $k=0$).]
  ],
))
