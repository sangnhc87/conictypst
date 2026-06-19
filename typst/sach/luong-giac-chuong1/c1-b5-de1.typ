#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 05 — Các Bài Toán Tổng Hợp Liên Môn])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // t
    line((0, 0), (0, 2.5), mark: (end: ">")) // alpha
    content((4.3, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 2.3), text(size: 8pt)[$alpha$])
    let pts = range(0, 41).map(i => {
      let t = i / 40 * 365
      let y = 45 + 23.5 * calc.sin(360deg / 365 * (t - 80))
      (t / 100, y / 30)
    })
    line(..pts, stroke: 1pt + orange)
    line((1.71, 0), (1.71, 68.5/30), stroke: (dash: "dashed", paint: red))
    line((0, 68.5/30), (1.71, 68.5/30), stroke: (dash: "dashed", paint: red))
    content((1.71, -0.3), text(size: 8pt)[$171$])
    content((-0.5, 68.5/30), text(size: 8pt)[$68.5°$])
  }),
  [Tại một thành phố, góc tới của tia sáng mặt trời lúc giữa trưa vào ngày thứ $t$ trong năm được xấp xỉ bởi hàm số $alpha(t) = 45° + 23.5° sin((2pi)/365 (t - 80))$, trong đó $1 <= t <= 365$. Góc tới lớn nhất của tia sáng mặt trời trong năm xấp xỉ bằng bao nhiêu và đạt được vào khoảng ngày thứ mấy?],
  ([$45°$ vào ngày 80], [$68.5°$ vào ngày 80], True([$68.5°$ vào ngày 171]), [$21.5°$ vào ngày 263]),
  loigiai: [
    #step[**B1: Phân tích hàm lượng giác** \
      Hàm số $alpha(t) = 45° + 23.5° sin((2pi)/365 (t - 80))$. \
      Để $alpha(t)$ đạt giá trị lớn nhất, phần lượng giác $sin((2pi)/365 (t - 80))$ phải đạt giá trị lớn nhất, tức là bằng 1.]
    #step[**B2: Tính góc tới lớn nhất** \
      Thay giá trị lớn nhất của $sin$ vào phương trình: \
      $alpha_max = 45° + 23.5° dot 1 = 68.5°$.]
    #step[**B3: Xác định thời điểm đạt GTLN** \
      Giải phương trình $sin((2pi)/365 (t - 80)) = 1$: \
      $(2pi)/365 (t - 80) = pi/2 <=> t - 80 = 365/4 <=> t - 80 = 91.25 <=> t = 171.25$. \
      Vậy góc tới lớn nhất đạt được vào khoảng ngày thứ 171 trong năm (Khoảng thời gian Hạ chí, quanh ngày 21/6).]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // t
    line((0, -1.5), (0, 2), mark: (end: ">")) // pop
    content((4.3, -0.3), text(size: 8pt)[$t$])
    // Cáo (Fox) F(t) = 500 + 100 sin(pi t / 6) -> scaled around 0 for drawing
    // Thỏ (Rabbit) R(t) = 2000 + 500 cos(pi t / 6) -> scaled around 0
    let pts_F = range(0, 41).map(i => { let t = i/40 * 12; (t/3, 1 * calc.sin(180deg/6 * t)) })
    let pts_R = range(0, 41).map(i => { let t = i/40 * 12; (t/3, 1.5 * calc.cos(180deg/6 * t)) })
    line(..pts_F, stroke: 1.5pt + red) // Fox
    line(..pts_R, stroke: 1.5pt + blue) // Rabbit
    content((2.5, 1), text(fill: red, size: 8pt)[Cáo])
    content((1.2, 1.6), text(fill: blue, size: 8pt)[Thỏ])
  }),
  [Mô hình Lotka-Volterra (Kẻ săn mồi - Con mồi) thường dẫn đến sự biến thiên tuần hoàn của quần thể. Giả sử số lượng Cáo (kẻ săn mồi) là $F(t) = 500 + 100 sin(pi t / 6)$ và số lượng Thỏ (con mồi) là $R(t) = 2000 + 500 cos(pi t / 6)$, với $t$ tính bằng tháng. Mệnh đề nào sau đây diễn tả đúng mối quan hệ sinh thái này?],
  ([Số lượng Cáo và Thỏ cùng đạt cực đại ở cùng một thời điểm.], [Khi số lượng Cáo đạt cực đại thì số lượng Thỏ đạt cực tiểu.], True([Khi số lượng Cáo đạt cực đại thì số lượng Thỏ bằng mức trung bình và đang giảm.]), [Số lượng Cáo luôn nhiều hơn số lượng Thỏ.]),
  loigiai: [
    #step[**B1: Phân tích số lượng Cáo cực đại** \
      Số lượng Cáo $F(t)$ đạt cực đại khi $sin(pi t / 6) = 1 <=> pi t / 6 = pi/2 <=> t = 3$. \
      Khi đó $F(3) = 500 + 100 = 600$ con.]
    #step[**B2: Xét số lượng Thỏ tại cùng thời điểm** \
      Tại thời điểm $t = 3$, số lượng Thỏ là: \
      $R(3) = 2000 + 500 cos(pi dot 3 / 6) = 2000 + 500 cos(pi/2) = 2000 + 0 = 2000$ con. \
      Mức trung bình của quần thể Thỏ theo mô hình này là $2000$. Vậy khi Cáo cực đại, Thỏ bằng mức trung bình.]
    #step[**B3: Xét xu hướng tăng/giảm của Thỏ** \
      Đạo hàm $R'(t) = -500 (pi/6) sin(pi t / 6)$. \
      Tại $t=3$, $R'(3) = -500(pi/6) sin(pi/2) < 0$. \
      Vậy số lượng Thỏ lúc này đang trên đà giảm (do áp lực săn mồi lớn nhất từ Cáo). Phương án C là đúng.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // x
    line((0, -1.5), (0, 1.5), mark: (end: ">")) // y
    content((4.3, -0.3), text(size: 8pt)[$x$])
    content((-0.4, 1.3), text(size: 8pt)[$y$])
    let pts = range(0, 41).map(i => { let x = i/40 * 4; (x, 1 * calc.cos(360deg*1.5 * x/4)) })
    line(..pts, stroke: 1pt + blue)
    line((1.5, 0), (2.5, 0), mark: (end: ">"), stroke: 1.5pt + red)
    content((2, 0.3), text(size: 8pt)[$v$])
  }),
  [Phương trình của một sóng cơ lan truyền trên mặt nước được cho bởi $y(x, t) = 5 cos(0.2x - 10t)$, trong đó $y, x$ tính bằng cm và $t$ tính bằng giây. Vận tốc truyền sóng trên mặt nước là bao nhiêu? (Gợi ý: Phương trình sóng tổng quát là $y = A cos(k x - omega t)$, vận tốc truyền sóng là $v = omega / k$).],
  ([$2$ cm/s], True([$50$ cm/s]), [$10$ cm/s], [$0.02$ cm/s]),
  loigiai: [
    #step[**B1: Đồng nhất phương trình** \
      So sánh phương trình sóng đã cho $y(x, t) = 5 cos(0.2x - 10t)$ với phương trình tổng quát $y = A cos(k x - omega t)$, ta suy ra được: \
      - Số sóng $k = 0.2$ rad/cm. \
      - Tần số góc $omega = 10$ rad/s.]
    #step[**B2: Tính vận tốc truyền sóng** \
      Áp dụng công thức tính vận tốc truyền sóng $v = omega / k$: \
      $v = 10 / 0.2 = 50$ cm/s.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), stroke: 2pt + blue) // water level
    content((2.25, -0.3), text(fill: blue, size: 8pt)[Mặt nước biển])
    line((0, 0), (0, 3.5), stroke: 2pt) // tower 1
    line((4, 0), (4, 3.5), stroke: 2pt) // tower 2
    let pts = range(0, 41).map(i => { let x = i/10; (x, 2 + 0.75 * calc.sin(180deg*x/4)) })
    line(..pts, stroke: 1.5pt + red) // bridge deck
    line((2, 0), (2, 2.75), stroke: (dash: "dashed", paint: gray))
    content((2.5, 1.5), text(size: 8pt)[$h(x)$])
  }),
  [Độ cao của mặt đường trên một cây cầu treo (so với mực nước biển) được xấp xỉ bởi đường cong $h(x) = 15 sin((pi x)/100) cos((pi x)/100) + 20$ (m), với $x$ là khoảng cách ngang từ đầu cầu ($0 <= x <= 100$). Điểm cao nhất của mặt đường cầu này cách mặt nước biển bao nhiêu mét?],
  ([$20$ m], True([$27.5$ m]), [$35$ m], [$50$ m]),
  loigiai: [
    #step[**B1: Rút gọn hàm số độ cao** \
      Sử dụng công thức nhân đôi $2 sin alpha cos alpha = sin 2alpha$: \
      $15 sin((pi x)/100) cos((pi x)/100) = 7.5 (2 sin((pi x)/100) cos((pi x)/100)) = 7.5 sin((2pi x)/100) = 7.5 sin((pi x)/50)$. \
      Hàm số độ cao trở thành: $h(x) = 7.5 sin((pi x)/50) + 20$.]
    #step[**B2: Tìm giá trị lớn nhất của h(x)** \
      Giá trị lớn nhất của $h(x)$ đạt được khi hàm sin đạt giá trị cực đại bằng 1. \
      $h_max = 7.5 dot 1 + 20 = 27.5$ m.]
    #step[**B3: Kết luận** \
      Điểm cao nhất của mặt đường cầu cách mặt nước biển 27.5 mét. (Xảy ra khi $(pi x)/50 = pi/2 <=> x = 25$ m).]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let pts = range(0, 41).map(i => { let x = i/10; (x, 1.5 + 0.2 * calc.sin(360deg*x/2)) })
    line(..pts, stroke: 1.5pt + blue) // waves
    line((0, 1.5), (4, 1.5), stroke: (dash: "dashed", paint: blue)) // sea surface mean
    line((2, 1.5), (2, -1.5), mark: (end: ">"), stroke: 2pt + yellow) // light
    circle((2, -1.5), radius: 0.2, fill: gray) // diver
    content((2.8, -1.5), text(size: 8pt)[Thợ lặn])
    content((0.5, 2), text(fill: blue, size: 8pt)[Mặt sóng])
  }),
  [Một người thợ lặn dưới đáy biển quan sát thấy cường độ ánh sáng chiếu xuống thay đổi tuần hoàn do sóng mặt biển. Ánh sáng được mô hình bởi $I(t) = I_0 e^{-alpha d} (1 + 0.5 sin((2pi t)/T))$, với $d$ là độ sâu. Khi $t = T/4$, cường độ ánh sáng đạt trạng thái nào?],
  ([Bằng 0], [Bằng mức trung bình], True([Đạt cực đại]), [Đạt cực tiểu]),
  loigiai: [
    #step[**B1: Thay giá trị thời gian vào biểu thức lượng giác** \
      Tại thời điểm $t = T/4$, biểu thức bên trong hàm sin là: \
      $(2pi t) / T = (2pi (T/4)) / T = pi/2$.]
    #step[**B2: Đánh giá giá trị của hàm cường độ** \
      Ta có $sin(pi/2) = 1$. \
      Khi đó cụm trong ngoặc vuông có giá trị: $(1 + 0.5 dot 1) = 1.5$. \
      Vì hàm sin có giá trị lớn nhất là 1, nên biểu thức $(1 + 0.5 sin(...))$ đạt giá trị lớn nhất là 1.5.]
    #step[**B3: Kết luận** \
      Do đó, $I(T/4) = 1.5 I_0 e^{-alpha d}$, đây là cường độ ánh sáng lớn nhất (cực đại).]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), stroke: 2pt) // ground
    line((4, 0), (4, 1), stroke: 2pt) // height
    line((0, 0), (4, 1), stroke: 2pt + red) // ramp
    content((2, 0.8), text(size: 8pt, fill: red)[$L = 10$ m])
    content((4.4, 0.5), text(size: 8pt)[$h = 0.8$])
    arc((rel: (angle: 0deg, radius: 1), to: (0,0)), start: 0deg, stop: 14deg, radius: 1)
    content((1.2, 0.15), text(size: 8pt)[$theta$])
  }),
  [Để xây dựng một đoạn đường dốc cho người đi xe lăn, quy chuẩn xây dựng quốc tế quy định góc nghiêng $theta$ của đoạn đường so với mặt phẳng ngang không được vượt quá một giới hạn sao cho $tan theta <= 1/12$. Một kiến trúc sư thiết kế đường dốc có chiều dài mặt dốc $L = 10$ m để đạt độ cao $h = 0.8$ m. Xét tính đúng sai:],
  (
    True([Tỉ số $sin theta$ của mặt dốc này là $0.08$.]),
    True([Góc nghiêng của mặt dốc thiết kế này thỏa mãn quy chuẩn quốc tế.]),
    True([Nếu giữ nguyên chiều dài mặt dốc $L=10$ m, độ cao tối đa đạt chuẩn cho phép xấp xỉ $0.83$ m.]),
    [Góc nghiêng $theta$ của thiết kế là $8°$.],
  ),
  loigiai: [
    - **a) Đúng:** Theo định nghĩa hàm sin trong tam giác vuông: $sin theta = ("đối") / ("huyền") = h / L = 0.8 / 10 = 0.08$.
    - **b) Đúng:** Từ $sin theta = 0.08$, ta tính được $cos theta = sqrt(1 - sin^2 theta) = sqrt(1 - 0.08^2) approx 0.9968$. \ Suy ra $tan theta = sin theta / cos theta = 0.08 / 0.9968 approx 0.0802$. \ So sánh với quy chuẩn $1/12 approx 0.0833$. Vì $0.0802 < 0.0833$, thiết kế đạt chuẩn.
    - **c) Đúng:** Giới hạn tối đa là $tan theta = 1/12$. Khi đó $sin theta = (tan theta) / sqrt(1 + tan^2 theta) = (1/12) / sqrt(1 + 1/144) = 1 / sqrt(145) approx 0.083$. \ Độ cao tối đa: $h_max = L dot sin theta = 10 dot 0.083 = 0.83$ m.
    - **d) Sai:** Từ $sin theta = 0.08$, sử dụng máy tính bỏ túi ấn `arcsin(0.08)` ta được $theta approx 4.59°$, không phải $8°$.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-5, 0), (5, 0), mark: (end: ">")) // t
    line((0, -0.5), (0, 2.8), mark: (end: ">")) // I
    content((4.8, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 2.6), text(size: 8pt)[$I$])
    let pts = range(0, 41).map(i => { let t = -6 + i/40 * 12; (t*4/6, (50 + 50 * calc.cos(180deg*t/12)) / 40) })
    line(..pts, stroke: 1.5pt + orange)
    line((-5, 75/40), (5, 75/40), stroke: (dash: "dashed", paint: red))
    content((-0.8, 75/40), text(size: 8pt)[$75$])
    content((0.4, 100/40), text(size: 8pt)[$100$])
    line((-4*4/6, 0), (-4*4/6, 75/40), stroke: (dash: "dashed", paint: gray))
    line((4*4/6, 0), (4*4/6, 75/40), stroke: (dash: "dashed", paint: gray))
    content((-4*4/6, -0.3), text(size: 8pt)[$-4$])
    content((4*4/6, -0.3), text(size: 8pt)[$4$])
    content((0.2, -0.3), text(size: 8pt)[$0$])
  }),
  [Cường độ ánh sáng ban ngày được mô hình bằng $I(t) = 50 + 50 cos((pi t)/12)$, với $t$ là số giờ tính từ giữa trưa ($t = 0$ là 12h trưa). Khung năng lượng mặt trời chỉ sinh điện hiệu quả nếu $I(t) >= 75$. Xét tính đúng sai:],
  (
    True([Cường độ ánh sáng đạt cực đại lúc giữa trưa.]),
    [Tấm pin năng lượng bắt đầu sinh điện từ lúc 6h sáng.],
    True([Hệ thống pin mặt trời hoạt động hiệu quả trong $8$ giờ mỗi ngày.]),
    True([Thời điểm ngừng sinh điện hiệu quả trong ngày là 16h00 (4h chiều).]),
  ),
  loigiai: [
    - **a) Đúng:** Tại giữa trưa ($t=0$), hàm cos đạt cực đại $cos 0 = 1$. Khi đó $I(0) = 50 + 50(1) = 100$.
    - **b) Sai:** Điều kiện sinh điện hiệu quả: $I(t) >= 75 <=> 50 + 50 cos((pi t)/12) >= 75 <=> cos((pi t)/12) >= 0.5$. \ Giải phương trình lượng giác cơ bản: $-pi/3 <= (pi t)/12 <= pi/3 <=> -4 <= t <= 4$. \ Với $t=0$ là 12h trưa, $t=-4$ tương ứng với 8h sáng, không phải 6h sáng.
    - **c) Đúng:** Khoảng thời gian sinh điện hiệu quả là từ $t=-4$ đến $t=4$, tổng cộng $4 - (-4) = 8$ giờ.
    - **d) Đúng:** Thời điểm ngừng là $t=4$, tương ứng với 12h trưa + 4 tiếng = 16h00 (4h chiều).
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Chu kỳ bán rã của cảm xúc con người khi gặp một cú sốc có thể được mô phỏng bởi phương trình kết hợp hàm mũ và lượng giác: $E(t) = 100 e^{-0.2 t} |cos((pi t)/2)|$. Tại $t = 1$ (tháng), giá trị của $E(t)$ bằng bao nhiêu?],
  [$0$],
  loigiai: [
    #step[**B1: Thay số vào phương trình** \
      Thay thời gian $t = 1$ tháng vào phương trình $E(t) = 100 e^{-0.2 t} |cos((pi t)/2)|$: \
      $E(1) = 100 e^{-0.2 dot 1} |cos(pi/2)|$.]
    #step[**B2: Tính giá trị lượng giác** \
      Ta biết rằng $cos(pi/2) = 0$.]
    #step[**B3: Kết luận** \
      Vì biểu thức chứa phần tử bằng 0, nên $E(1) = 100 e^{-0.2} dot 0 = 0$. \
      Cảm xúc tại thời điểm 1 tháng đã hạ nhiệt hoàn toàn theo mô hình này.]
  ],
))

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // t
    line((0, -1.2), (0, 1.5), mark: (end: ">")) // v
    content((4.3, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 1.3), text(size: 8pt)[$v$])
    let pts = range(0, 41).map(i => { let t = i/40 * 6; (t*0.6, calc.sin(180deg*t/3)) })
    line(..pts, stroke: 1.5pt + blue)
    content((1, 1.2), text(size: 8pt)[$2$ m/s])
  }),
  [Vận tốc dòng chảy của thủy triều tại một eo biển (đơn vị: m/s) được cho bởi $v(t) = 4 sin((pi t)/6) cos((pi t)/6)$, trong đó chiều dương là chiều nước chảy từ biển vào vịnh. Tìm vận tốc dòng chảy lớn nhất có thể đạt được (m/s).],
  [$2$],
  loigiai: [
    #step[**B1: Rút gọn biểu thức** \
      Sử dụng công thức nhân đôi $2 sin alpha cos alpha = sin 2alpha$: \
      $v(t) = 2 (2 sin((pi t)/6) cos((pi t)/6)) = 2 sin(2 dot (pi t)/6) = 2 sin((pi t)/3)$.]
    #step[**B2: Tìm giá trị cực đại** \
      Biên độ của hàm số này là hệ số đứng trước hàm sin, tức là 2. \
      Vì $-1 <= sin((pi t)/3) <= 1$, vận tốc dòng chảy lớn nhất có thể đạt được là $max v(t) = 2 dot 1 = 2$ (m/s).]
  ],
))
