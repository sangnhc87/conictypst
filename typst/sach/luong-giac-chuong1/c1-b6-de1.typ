#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 06 — Tuyển Tập Toán Thực Tế Ứng Dụng Nâng Cao])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 2), radius: 1.5, stroke: 1.5pt)
    line((0, 2), (0, 0), stroke: 2pt)
    line((-1, 0), (1, 0), stroke: 2pt)
    circle((0, 2), radius: 0.1, fill: black)
    circle((0, 0.5), radius: 0.1, fill: red)
    content((0.4, 0.5), text(size: 8pt)[Cabin])
  }),
  [Một vòng quay mặt trời (Ferris wheel) có bán kính $15$ m, tâm vòng quay nằm ở độ cao $20$ m so với mặt đất. Vòng quay quay đều đặn với tốc độ $1$ vòng mỗi $4$ phút. Nếu tại thời điểm $t = 0$, một người bắt đầu lên cabin từ điểm thấp nhất của vòng quay, thì độ cao $h$ (m) của người đó so với mặt đất sau $t$ phút được cho bởi hàm số nào dưới đây?],
  ([$h(t) = 20 - 15 cos(pi t)$], True([$h(t) = 20 - 15 cos(pi/2 t)$]), [$h(t) = 20 + 15 sin(pi/4 t)$], [$h(t) = 15 - 20 cos(pi/2 t)$]),
  loigiai: [
    #step[**B1: Xác định các thông số của hàm lượng giác** \
      Độ cao trung bình (tâm vòng quay) là $20$ m, biên độ là bán kính $R = 15$ m. \
      Chu kỳ $T = 4$ phút, suy ra tần số góc $omega = (2pi)/T = (2pi)/4 = pi/2$ (rad/phút).]
    #step[**B2: Lập phương trình** \
      Tại $t = 0$, người ở điểm thấp nhất ($h = 20 - 15 = 5$ m). Hàm cos bắt đầu từ biên âm là phù hợp nhất: $h(t) = 20 - 15 cos(omega t)$.]
    #step[**B3: Kết luận** \
      Thay $omega = pi/2$ vào, ta được $h(t) = 20 - 15 cos(pi/2 t)$.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Một piston trong động cơ đốt trong dao động lên xuống. Khoảng cách $y$ (cm) từ mặt piston đến trục khuỷu tại thời điểm $t$ (giây) được cho bởi $y(t) = 8 cos(40pi t) + 15$. Piston thực hiện được bao nhiêu chu kỳ (chu trình) hoàn chỉnh trong $1$ giây?],
  ([$40$], True([$20$]), [$80$], [$10$]),
  loigiai: [
    #step[**B1: Xác định tần số góc** \
      Từ phương trình $y(t) = 8 cos(40pi t) + 15$, ta có $omega = 40pi$ (rad/s).]
    #step[**B2: Tính chu kỳ và tần số** \
      Tần số (số chu kỳ trong $1$ giây) là $f = omega / (2pi)$. \
      $f = (40pi) / (2pi) = 20$ (Hz).]
    #step[**B3: Kết luận** \
      Piston thực hiện được 20 chu kỳ trong 1 giây.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong y sinh học, nhịp sinh học theo chu kỳ thể chất của con người (Physical Biorhythm) được giả định tuân theo hàm số $P(t) = sin((2pi t)/23)$, trong đó $t$ là số ngày tính từ ngày sinh. Nếu một người vừa tròn 230 ngày tuổi ($t = 230$), trạng thái thể chất của họ đang ở giai đoạn nào?],
  ([Cực đại (100%)], [Cực tiểu (-100%)], True([Bằng 0 và chuẩn bị tăng]), [Bằng 0 và chuẩn bị giảm]),
  loigiai: [
    #step[**B1: Tính giá trị của chu kỳ** \
      Tại $t = 230$, thay vào ta có $P(230) = sin((2pi dot 230)/23) = sin(20pi)$.]
    #step[**B2: Đánh giá trạng thái** \
      Vì $20pi$ là một số chẵn lần $pi$, nên $sin(20pi) = 0$. Trạng thái thể chất lúc này bằng 0.]
    #step[**B3: Xét xu hướng tăng giảm** \
      Đạo hàm $P'(t) = (2pi)/23 cos((2pi t)/23)$. Tại $t=230$, $P'(230) = (2pi)/23 cos(20pi) = (2pi)/23 > 0$. \
      Vậy hàm đang có xu hướng tăng. Cụ thể, sau ngày 230 thì chỉ số chuyển sang chu kỳ dương.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Nhiệt độ trung bình ngoài trời $T$ (°C) tại một trạm quan trắc khí tượng trong 1 ngày được mô hình bằng hàm $T(h) = 24 + 6 sin((pi(h - 8))/12)$, với $h$ là số giờ tính từ nửa đêm ($0 <= h < 24$). Nhiệt độ đạt cực đại vào lúc mấy giờ trong ngày?],
  ([8 giờ sáng], [12 giờ trưa], True([14 giờ (2 giờ chiều)]), [16 giờ (4 giờ chiều)]),
  loigiai: [
    #step[**B1: Tìm điều kiện nhiệt độ lớn nhất** \
      Nhiệt độ cực đại khi $sin((pi(h - 8))/12) = 1$.]
    #step[**B2: Giải phương trình lượng giác** \
      $(pi(h - 8))/12 = pi/2 <=> h - 8 = 6 <=> h = 14$.]
    #step[**B3: Kết luận** \
      Nhiệt độ đạt lớn nhất vào lúc 14 giờ (tức 2 giờ chiều).]
  ],
))

#q-wrap(dir: "doc", tn(
  [Giao thoa của hai sóng âm có cùng tần số và biên độ nhưng lệch pha nhau một góc $phi$ tạo ra âm thanh tổng hợp có biên độ là $A = 2 A_0 |cos(phi/2)|$. Để âm thanh tổng hợp hoàn toàn triệt tiêu (hiện tượng triệt âm, dùng trong tai nghe chống ồn), độ lệch pha $phi$ phải thỏa mãn điều kiện nào sau đây ($k in ZZ$)?],
  ([$phi = k 2pi$], True([$phi = pi + k 2pi$]), [$phi = pi/2 + k pi$], [$phi = pi/4 + k pi$]),
  loigiai: [
    #step[**B1: Điều kiện triệt âm** \
      Âm thanh triệt tiêu khi biên độ bằng 0, tức là $cos(phi/2) = 0$.]
    #step[**B2: Giải phương trình lượng giác** \
      $phi/2 = pi/2 + k pi <=> phi = pi + k 2pi$.]
    #step[**B3: Kết luận** \
      Hai sóng phải ngược pha nhau (lệch pha một số lẻ lần $pi$).]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  [Tại một vịnh biển, mực nước thủy triều (tính bằng mét) biến thiên theo thời gian $t$ (giờ, $0 <= t <= 24$) trong một ngày được xấp xỉ bởi hàm số $h(t) = 3 + 2 cos((pi t)/6 + pi/3)$. Một con tàu lớn yêu cầu mực nước tối thiểu là 4 mét để có thể cập cảng an toàn. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Mực nước trung bình trong ngày tại vịnh là 3 mét.]),
    [Thời điểm mực nước đạt đỉnh cao nhất là vào lúc 6 giờ sáng.],
    [Mực nước lúc 12 giờ trưa là 2 mét.],
    True([Trong ngày, tàu có thể cập cảng an toàn liên tục trong khoảng thời gian từ 8h sáng đến 12h trưa.]),
  ),
  loigiai: [
    - **a) Đúng:** Hàm số dao động quanh vị trí cân bằng $h = 3$ m, đây cũng là mực nước trung bình.
    - **b) Sai:** Mực nước cực đại khi $cos((pi t)/6 + pi/3) = 1 <=> (pi t)/6 + pi/3 = 0 <=> t = -2$. Chu kỳ là $12$ giờ, nên đỉnh tiếp theo trong ngày là $t = -2 + 12 = 10$ (tức 10 giờ sáng), không phải 6 giờ sáng.
    - **c) Sai:** Thay $t = 12$ vào: $h(12) = 3 + 2 cos(2pi + pi/3) = 3 + 2 cos(pi/3) = 3 + 2(1/2) = 4$ m. (Không phải 2 m).
    - **d) Đúng:** Tàu cập cảng khi $h(t) >= 4 <=> 3 + 2 cos((pi t)/6 + pi/3) >= 4 <=> cos((pi t)/6 + pi/3) >= 1/2$. \ Giải ra ta được $-pi/3 <= (pi t)/6 + pi/3 <= pi/3 + k 2pi <=> -2pi/3 <= (pi t)/6 <= 0 + k 2pi$. \ Tức là khoảng $-4 + 12k <= t <= 12k$. \ Với $k=1$, tàu an toàn từ $8$ đến $12$ giờ trưa. Do đó mệnh đề này đúng.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  [Một vật nặng treo vào một lò xo thực hiện dao động điều hòa quanh vị trí cân bằng. Li độ $x$ (cm) của vật tại thời điểm $t$ (giây) là $x(t) = 4 sin(5t) + 3 cos(5t)$. Kéo vật xuống dưới vị trí cân bằng thì $x < 0$. Xét tính đúng sai:],
  (
    True([Biên độ dao động của vật là 5 cm.]),
    [Vật bắt đầu dao động từ vị trí cân bằng ($t=0$).],
    True([Phương trình dao động có thể được đưa về dạng $x(t) = 5 cos(5t - alpha)$.]),
    True([Gia tốc cực đại của vật là $125$ cm/s² (với công thức $a = -omega^2 x$).]),
  ),
  loigiai: [
    - **a) Đúng:** Dùng hằng đẳng thức $A sin(omega t) + B cos(omega t) = sqrt(A^2+B^2) sin(omega t + phi)$. Biên độ là $sqrt(4^2+3^2) = 5$ cm.
    - **b) Sai:** Tại $t=0$, $x(0) = 4 sin(0) + 3 cos(0) = 3$ cm. Vật không xuất phát từ vị trí cân bằng ($x=0$).
    - **c) Đúng:** Ta có thể viết $x(t) = 5 (3/5 cos(5t) + 4/5 sin(5t)) = 5 cos(5t - alpha)$ với $cos alpha = 3/5$ và $sin alpha = 4/5$.
    - **d) Đúng:** Gia tốc $a_max = omega^2 A_max$. Với $omega = 5$ rad/s và $A = 5$ cm, ta có $a_max = 5^2 dot 5 = 125$ cm/s².
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Quãng đường phanh $S$ (mét) của một chiếc xe đang chạy với vận tốc $v$ (m/s) trên mặt đường nằm nghiêng góc $theta$ được tính xấp xỉ bởi công thức $S = v^2 / (2g(mu + sin theta))$, trong đó $g = 10$ m/s², $mu = 0.5$ là hệ số ma sát. Nếu xe chạy với vận tốc $20$ m/s trên dốc nghiêng $30°$, quãng đường phanh cần thiết là bao nhiêu mét?],
  [$20$],
  loigiai: [
    #step[**B1: Xác định các biến số** \
      Vận tốc $v = 20$ m/s, gia tốc $g = 10$ m/s², góc dốc $theta = 30°$, hệ số ma sát $mu = 0.5$.]
    #step[**B2: Thay số vào công thức** \
      $S = 20^2 / (2 dot 10 dot (0.5 + sin 30°))$.]
    #step[**B3: Tính toán kết quả** \
      Biết $sin 30° = 0.5$. Mẫu số là $20 dot (0.5 + 0.5) = 20 dot 1 = 20$. \
      $S = 400 / 20 = 20$ mét.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Doanh thu bán máy điều hòa không khí của một siêu thị điện máy (đơn vị: tỉ đồng) trong tháng thứ $t$ (với $t=1$ là tháng 1) có thể được xấp xỉ bởi hàm $R(t) = 8 + 5 sin((pi(t - 4))/6)$. Tính tổng doanh thu lớn nhất có thể đạt được trong một tháng (tỉ đồng).],
  [$13$],
  loigiai: [
    #step[**B1: Đánh giá hàm số** \
      Hàm doanh thu $R(t)$ có phần cố định là 8 tỉ, và phần biến động theo mùa là $5 sin((pi(t - 4))/6)$.]
    #step[**B2: Tìm giá trị lớn nhất** \
      Hàm sin có giá trị cực đại bằng 1. Do đó $R_max = 8 + 5(1) = 13$ tỉ đồng.]
    #step[**B3: Kết luận** \
      Doanh thu cao nhất đạt được là 13 tỉ đồng (vào thời điểm $t = 7$, tức tháng 7 mùa hè).]
  ],
))
