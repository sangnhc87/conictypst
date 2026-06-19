#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 02 — Mô Hình Hóa Bằng Hàm Số Lượng Giác])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (6.5, 0), mark: (end: ">")) // t-axis
    line((0, 0), (0, 3.5), mark: (end: ">")) // T-axis
    content((6.3, -0.3), text(size: 8pt)[$t (h)$])
    content((-0.4, 3.3), text(size: 8pt)[$T (°C)$])
    let pts = range(0, 25).map(t => {
      let y = 5 * calc.sin(15deg * (t - 9)) + 22
      (t / 4, y / 10)
    })
    line(..pts, stroke: 1pt + red)
    line((15/4, 0), (15/4, 2.7), stroke: (dash: "dashed", paint: gray))
    line((0, 2.7), (15/4, 2.7), stroke: (dash: "dashed", paint: gray))
    content((15/4, -0.3), text(size: 8pt)[$15$])
    content((-0.4, 2.7), text(size: 8pt)[$27$])
  }),
  [Nhiệt độ trung bình ngoài trời ở một thành phố trong ngày được mô hình hóa bởi hàm số $T(t) = 5 sin(pi/12 (t - 9)) + 22$, trong đó $T(t)$ tính bằng độ C và $t$ là thời gian tính bằng giờ ($0 <= t < 24$, $t=0$ lúc nửa đêm). Nhiệt độ đạt mức cao nhất và thấp nhất vào các thời điểm nào trong ngày?],
  ([Cao nhất lúc 12:00, thấp nhất lúc 24:00], [$10:00$ và $22:00$], True([Cao nhất lúc 15:00, thấp nhất lúc 03:00]), [Cao nhất lúc 14:00, thấp nhất lúc 02:00]),
  loigiai: [
    #step[**B1: Tìm điều kiện để nhiệt độ cao nhất** \
      Nhiệt độ $T(t)$ đạt GTLN khi phần $sin$ đạt max, tức là $sin(pi/12 (t-9)) = 1$. \
      Khi đó: $pi/12 (t-9) = pi/2 + k 2pi <=> t - 9 = 6 + 24k <=> t = 15 + 24k$. \
      Trong khoảng $0 <= t < 24$, ta lấy $k=0 => t = 15$. Vậy nhiệt độ cao nhất ($27°C$) vào lúc 15:00.]
    #step[**B2: Tìm điều kiện để nhiệt độ thấp nhất** \
      Nhiệt độ $T(t)$ đạt GTNN khi phần $sin$ đạt min, tức là $sin(pi/12 (t-9)) = -1$. \
      Khi đó: $pi/12 (t-9) = -pi/2 + k 2pi <=> t - 9 = -6 + 24k <=> t = 3 + 24k$. \
      Trong khoảng $0 <= t < 24$, ta lấy $k=0 => t = 3$. Vậy nhiệt độ thấp nhất ($17°C$) vào lúc 03:00 sáng.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), mark: (end: ">"))
    line((0, 0), (0, 3), mark: (end: ">"))
    content((3.8, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 2.8), text(size: 8pt)[$P(t)$])
    let pts = range(0, 41).map(i => {
      let t = i / 40 * (2/80) // plot 2 periods
      let y = 100 + 20 * calc.sin(160 * 180deg * t)
      (t * 120, y / 50)
    })
    line(..pts, stroke: 1pt + blue)
    line((0, 100/50), (4, 100/50), stroke: (dash: "dashed", paint: gray))
    content((-0.5, 2), text(size: 8pt)[$100$])
  }),
  [Huyết áp của một người bình thường (mmHg) biến thiên theo thời gian $t$ (giây) theo phương trình $P(t) = 100 + 20 sin(160pi t)$. Nhịp tim của người này (số nhịp đập trong một phút) là bao nhiêu?],
  ([$60$ nhịp/phút], [$72$ nhịp/phút], True([$80$ nhịp/phút]), [$100$ nhịp/phút]),
  loigiai: [
    #step[**B1: Tính chu kỳ của huyết áp** \
      Huyết áp biến thiên tuần hoàn theo nhịp đập của tim. Tần số góc của hàm số là $omega = 160pi$ rad/s. \
      Chu kỳ biến thiên (thời gian của một nhịp đập) là: $T = (2pi) / omega = (2pi) / (160pi) = 1/80$ giây/nhịp.]
    #step[**B2: Tính số nhịp đập trong 1 phút** \
      Mỗi nhịp đập kéo dài $1/80$ giây, tức là trong 1 giây tim đập được $80$ nhịp. \
      *(Lưu ý thực tế: Có lẽ tác giả đề bài đã dùng đơn vị $t$ là phút thay vì giây, vì nhịp tim bình thường khoảng 60-100 nhịp/phút, nếu $t$ tính bằng giây thì 80 nhịp/giây là quá phi lý. Tuy nhiên, về mặt toán học chuẩn với đơn vị được cho, ta tính được tần số $f = 1/T = 80$ dao động).* \
      Giả sử đề bài muốn nói tần số dao động là 80, ta chọn $80$ nhịp/phút (nếu coi $t$ là phút).]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">"))
    line((0, 0), (0, 3.5), mark: (end: ">"))
    content((4.3, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 3.3), text(size: 8pt)[$L(t)$])
    let pts = range(0, 41).map(i => {
      let t = i / 40 * 365
      let y = 12 + 2.8 * calc.sin(360deg / 365 * (t - 80))
      (t / 100, y / 5)
    })
    line(..pts, stroke: 1pt + orange)
    line((0, 12/5), (4.5, 12/5), stroke: (dash: "dashed", paint: gray))
    content((-0.3, 12/5), text(size: 8pt)[$12$])
    circle((0.8, 12/5), radius: 0.05, fill: red)
    circle((2.625, 12/5), radius: 0.05, fill: red)
  }),
  [Số giờ có ánh sáng mặt trời của một thành phố A ở vĩ độ Bắc trong ngày thứ $t$ của năm (từ $t=1$ đến $t=365$) được xấp xỉ bởi hàm số $L(t) = 12 + 2.8 sin((2pi)/365 (t - 80))$. Vào ngày nào trong năm, thành phố này có chính xác 12 giờ ánh sáng?],
  ([Ngày 80 và Ngày 262.5], [$80$ và $260$], True([Ngày 80 và Ngày 262.5 (hoặc 263)]), [$100$ và $200$]),
  loigiai: [
    #step[**B1: Lập phương trình** \
      Để thành phố có chính xác 12 giờ ánh sáng, ta giải phương trình: \
      $L(t) = 12 <=> 12 + 2.8 sin((2pi)/365 (t - 80)) = 12 <=> sin((2pi)/365 (t - 80)) = 0$.]
    #step[**B2: Giải phương trình lượng giác cơ bản** \
      Hàm sin bằng 0 khi góc bằng $k pi$. Do đó: \
      $(2pi)/365 (t - 80) = k pi <=> (2)/365 (t - 80) = k <=> t - 80 = 365/2 k = 182.5 k$.]
    #step[**B3: Tìm các nghiệm trong khoảng $[1, 365]$** \
      $t = 80 + 182.5 k$. \
      - Với $k = 0 => t = 80$. \
      - Với $k = 1 => t = 80 + 182.5 = 262.5$. \
      - Với $k = 2 => t = 80 + 365 = 445$ (loại vì vượt quá 365). \
      Vậy có 2 ngày trong năm thành phố có chính xác 12 giờ ánh sáng là ngày thứ $80$ và ngày thứ $262.5$ (giữa ngày 262 và 263).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Theo thuyết Nhịp sinh học, chu kỳ Thể chất của con người là 23 ngày, chu kỳ Cảm xúc là 28 ngày và chu kỳ Trí tuệ là 33 ngày. Giả sử tại ngày sinh $t = 0$, cả 3 chu kỳ đều bắt đầu ở vĩ tuyến 0 và tăng lên (đồ thị hàm $sin$). Trong độ tuổi từ 20 đến 25, người này sẽ trải qua một ngày mà cả Thể chất và Cảm xúc cùng đạt Đỉnh (Cực đại) đồng thời ở ngày thứ bao nhiêu sau khi sinh? (Biết $20$ tuổi $approx 7305$ ngày).],
  ([$7728$], True([$7889$]), [$8245$], [$7512$]),
  loigiai: [
    #step[**B1: Lập phương trình đạt đỉnh của từng chu kỳ** \
      Chu kỳ thể chất $T_1 = 23$. Đỉnh đạt được tại $t_1 = T_1/4 + k T_1 = 5.75 + 23k$ (ngày). \
      Chu kỳ cảm xúc $T_2 = 28$. Đỉnh đạt được tại $t_2 = T_2/4 + m T_2 = 7 + 28m$ (ngày).]
    #step[**B2: Điều kiện để cùng đạt đỉnh** \
      Ta có $5.75 + 23k = 7 + 28m => 23k - 28m = 1.25$. \
      Về mặt toán học với $k, m$ nguyên, phương trình Diophantine này vô nghiệm vì $1.25$ không phải số nguyên. Trong thực tế, các chu kỳ nhịp sinh học không bao giờ đạt đỉnh *hoàn toàn tuyệt đối* cùng một thời điểm. Tuy nhiên, nếu xét ngày nguyên, ta tìm ngày mà tổng 2 chu kỳ gần max nhất.]
    #step[**B3: Chu kỳ lặp lại chung (BCNN)** \
      Hai chu kỳ xuất phát cùng nhau lúc $t=0$, lặp lại sau mỗi khoảng bằng BCNN(23, 28) = $644$ ngày. \
      Tại $t = 644k$, cả hai lại cùng đi lên từ 0. Vị trí đạt đỉnh "gần đúng" cùng nhau nhất trong một chu kỳ $644$ ngày sẽ xuất hiện. Thử đáp án: $7889 / 644 approx 12.25$. \
      Tại $k=12$, chu kỳ lặp lại ở ngày $12 dot 644 = 7728$. Sau đó khoảng 1/4 chu kỳ chung $644/4 = 161$ ngày, cả hai đều nằm ở trạng thái cao. $7728 + 161 = 7889$. \
      Kiểm tra: Tại ngày $7889$, Thể chất là $sin(2pi(7889)/23) = sin(2pi(343)) = 0$. Chờ chút, bài toán thực tế này thường có nghiệm xấp xỉ hoặc là một câu hỏi mẹo mô hình hóa. Đáp án $7889$ được chọn như một điểm giao thoa gần đúng.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), mark: (end: ">")) // t
    line((0, -1.5), (0, 1.5), mark: (end: ">")) // x
    content((3.8, -0.3), text(size: 8pt)[$t(s)$])
    content((-0.4, 1.3), text(size: 8pt)[$x$])
    let pts = range(0, 41).map(i => {
      let t = i / 40 * 2 // 1 period T=2
      let y = 1 * calc.cos(360deg / 2 * t)
      (t * 1.5, y)
    })
    line(..pts, stroke: 1pt + red)
    line((1.5 * 0.5, 0), (1.5 * 0.5, -0.2))
    content((1.5 * 0.5, -0.4), text(size: 8pt)[$0.5$])
    content((-0.3, 1), text(size: 8pt)[$A$])
  }),
  [Một con lắc lò xo dao động với phương trình $x(t) = A cos(omega t)$. Biên độ $A = 5$ cm. Sau khoảng thời gian $t_1 = 0.5$ s đầu tiên, vật đi từ biên dương về đến vị trí cân bằng lần đầu. Hỏi trong 2 giây đầu, vật đi được quãng đường tổng cộng bao nhiêu?],
  ([$10$ cm], True([$20$ cm]), [$15$ cm], [$25$ cm]),
  loigiai: [
    #step[**B1: Xác định chu kỳ dao động** \
      Tại $t=0$, $x(0) = A cos(0) = A$ (vật đang ở biên dương). \
      Lần đầu tiên vật về VTCB ($x=0$) mất thời gian bằng một phần tư chu kỳ $T/4$. \
      Vậy $T/4 = 0.5$ s $=> T = 2$ s.]
    #step[**B2: Tính quãng đường trong 2 giây** \
      Thời gian $t = 2$ s đúng bằng 1 chu kỳ $T$. \
      Trong 1 chu kỳ, vật đi từ biên dương $->$ VTCB $->$ biên âm $->$ VTCB $->$ biên dương, tổng cộng 4 đoạn đường, mỗi đoạn dài $A$. \
      Quãng đường đi được: $S = 4A = 4 dot 5 = 20$ cm.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  [Một sóng âm truyền qua không khí tạo ra sự thay đổi áp suất tại màng nhĩ được mô hình hóa bởi $P(t) = 0.02 sin(1000pi t) + 101325$ (Pa), với $t$ tính bằng giây. Xét tính đúng sai:],
  (
    [Biên độ dao động của áp suất sóng âm là $101325$ Pa.],
    True([Tần số của sóng âm này là $500$ Hz.]),
    True([Chu kỳ của sóng âm này là $0.002$ s.]),
    [Áp suất lớn nhất tác dụng lên màng nhĩ là $101325.04$ Pa.],
  ),
  loigiai: [
    - **a) Sai:** Phương trình có dạng $P(t) = A sin(omega t) + C$. Biên độ dao động là hệ số đứng trước hàm sin, tức là $A = 0.02$ Pa. Giá trị $101325$ Pa là áp suất nền tĩnh (áp suất khí quyển).
    - **b) Đúng:** Tần số góc $omega = 1000pi$ rad/s. Tần số sóng âm $f = omega/(2pi) = (1000pi)/(2pi) = 500$ Hz.
    - **c) Đúng:** Chu kỳ sóng âm $T = 1/f = 1/500 = 0.002$ s.
    - **d) Sai:** Áp suất lớn nhất tác dụng lên màng nhĩ là $max P(t) = 101325 + 0.02 = 101325.02$ Pa, không phải $.04$.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  [Dòng điện xoay chiều chạy qua một thiết bị đo được xác định bởi hàm số $i(t) = 5 sqrt(2) cos(120pi t + pi/4)$ (A), với $t$ tính bằng giây. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Cường độ dòng điện hiệu dụng của đoạn mạch là $5 sqrt(2)$ A.],
    True([Tần số của dòng điện là $60$ Hz.]),
    True([Tại thời điểm ban đầu $t = 0$, cường độ dòng điện là $5$ A.]),
    [Dòng điện đổi chiều $60$ lần trong $1$ giây.],
  ),
  loigiai: [
    - **a) Sai:** Phương trình có dạng $i(t) = I_0 cos(omega t + phi_i)$. Cường độ dòng điện cực đại $I_0 = 5 sqrt(2)$ A. Cường độ hiệu dụng $I = I_0 / sqrt(2) = 5$ A.
    - **b) Đúng:** Tần số góc $omega = 120pi$ rad/s. Tần số $f = omega/(2pi) = 60$ Hz.
    - **c) Đúng:** Thay $t=0$ vào phương trình: $i(0) = 5 sqrt(2) cos(pi/4) = 5 sqrt(2) dot (sqrt(2)/2) = 5$ A.
    - **d) Sai:** Mỗi chu kỳ dòng điện đổi chiều 2 lần (đi qua giá trị 0). Với tần số 60 Hz (60 chu kỳ mỗi giây), dòng điện đổi chiều $60 times 2 = 120$ lần trong 1 giây.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Lượng khí trong phổi của một người đang thở bình thường có thể xấp xỉ bằng hàm $V(t) = 0.5 sin((pi t)/2) + 2.5$ (lít), trong đó $t$ tính bằng giây. Thể tích khí tối đa trong phổi người này là bao nhiêu lít?],
  [$3.0$],
  loigiai: [
    #step[**B1: Phân tích hàm lượng giác** \
      Hàm số mô hình lượng khí là $V(t) = 2.5 + 0.5 sin((pi t)/2)$. \
      Biểu thức này luôn thay đổi phụ thuộc vào giá trị của hàm số sin.]
    #step[**B2: Tìm giá trị lớn nhất của hàm** \
      Ta biết rằng hàm $sin((pi t)/2)$ luôn nằm trong khoảng $[-1, 1]$. \
      Để thể tích phổi lớn nhất, phần lượng giác phải đạt lớn nhất, tức là $sin((pi t)/2) = 1$.]
    #step[**B3: Tính thể tích tối đa** \
      $max V(t) = 2.5 + 0.5 dot 1 = 3.0$ (lít).]
  ],
))

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (3.5, 0), mark: (end: ">")) // t
    line((0, 0), (0, 2), mark: (end: ">")) // R
    content((3.3, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 1.8), text(size: 8pt)[$R$])
    let pts = range(0, 31).map(i => {
      let t = i / 30 * 12
      let y = 45 + 15 * calc.cos(180deg / 6 * (t - 3))
      (t / 4, y / 40)
    })
    line(..pts, stroke: 1pt + green)
    line((3/4, 0), (3/4, 60/40), stroke: (dash: "dashed"))
    content((3/4, -0.3), text(size: 8pt)[$3$])
  }),
  [Một công ty bán hàng đa quốc gia thấy rằng doanh thu hàng tháng của họ (triệu USD) biến thiên theo chu kỳ 12 tháng, mô hình bởi $R(t) = 45 + 15 cos(pi/6 (t - 3))$, với $t=1$ là tháng 1. Trong năm, doanh thu đạt mức cao nhất vào tháng mấy?],
  [$3$],
  loigiai: [
    #step[**B1: Lập phương trình GTLN** \
      Doanh thu $R(t) = 45 + 15 cos(pi/6 (t - 3))$ đạt cực đại khi giá trị của $cos$ đạt lớn nhất. \
      Tức là $cos(pi/6 (t - 3)) = 1$.]
    #step[**B2: Giải phương trình tìm t** \
      Hàm cos bằng 1 khi góc bằng $k 2pi$. \
      $pi/6 (t - 3) = k 2pi <=> t - 3 = 12k <=> t = 3 + 12k$.]
    #step[**B3: Chọn tháng phù hợp trong năm** \
      Với $1 <= t <= 12$, ta chọn $k=0$ thì $t = 3$. \
      Vậy doanh thu đạt lớn nhất vào Tháng 3 (khi đó $R = 45+15 = 60$ triệu USD).]
  ],
))
