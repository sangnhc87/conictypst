#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập Số 01 — Mô Hình Hóa Góc & Đường Tròn Lượng Giác])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đĩa xích
    circle((0,0), radius: 1, stroke: 1pt + blue, name: "dia")
    circle((0,0), radius: 0.1, fill: blue)
    content((0, -1.2), text(size: 8pt)[$R_1$])
    // Líp
    circle((3,0), radius: 0.4, stroke: 1pt + red, name: "lip")
    circle((3,0), radius: 0.1, fill: red)
    // Bánh xe
    circle((3,0), radius: 1.5, stroke: 1pt + black)
    content((3, -1.7), text(size: 8pt)[$R_3$])
    // Dây xích
    line((0,1), (3,0.4), stroke: 0.5pt)
    line((0,-1), (3,-0.4), stroke: 0.5pt)
  }),
  [Một chiếc xe đạp có đĩa xích (bánh răng trước) bán kính $R_1 = 10$ cm và líp (bánh răng sau) bán kính $R_2 = 4$ cm. Bánh xe sau của xe đạp (cùng trục quay với líp) có bán kính $R_3 = 35$ cm. Nếu người đạp xe đạp đĩa xích quay đều với tốc độ 1 vòng/giây, thì tốc độ di chuyển của chiếc xe đạp trên đường phẳng là bao nhiêu km/h? (Lấy $pi approx 3.1416$, làm tròn đến chữ số thập phân thứ hai).],
  ([$18.52$ km/h], True([$19.79$ km/h]), [$21.34$ km/h], [$25.13$ km/h]),
  loigiai: [
    #step[*B1: Phân tích tốc độ quay của đĩa xích* \
      Đĩa xích quay 1 vòng/giây, tức là chu kỳ $T = 1$ s. \
      Tốc độ góc của đĩa xích: $omega_1 = (2pi)/T = 2pi$ rad/s.]
    #step[*B2: Tính vận tốc dài của dây xích* \
      Dây xích nối đĩa xích và líp, do đó vận tốc dài ở vành đĩa xích chính là vận tốc của dây xích: \
      $v_c = R_1 omega_1 = 10 dot 2pi = 20pi$ cm/s.]
    #step[*B3: Suy ra tốc độ góc của líp và bánh xe sau* \
      Vành của líp cũng chạy với tốc độ dài $v_c = 20pi$ cm/s. \
      Tốc độ góc của líp: $omega_2 = v_c / R_2 = (20pi) / 4 = 5pi$ rad/s. \
      Vì líp và bánh xe sau gắn trên cùng một trục, chúng quay cùng tốc độ góc: $omega_3 = omega_2 = 5pi$ rad/s.]
    #step[*B4: Tính vận tốc di chuyển của xe đạp* \
      Vận tốc của xe đạp bằng vận tốc dài của điểm ngoài cùng trên bánh xe tiếp xúc với mặt đường: \
      $v = R_3 omega_3 = 35 dot 5pi = 175pi$ cm/s.]
    #step[*B5: Chuyển đổi đơn vị sang km/h* \
      Ta có $175pi$ cm/s = $1.75pi$ m/s. \
      Đổi ra km/h: $1.75pi dot 3.6 = 6.3pi approx 19.792$ km/h.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, name: "earth", stroke: 1pt)
    line((0, -1.7), (0, 1.7), stroke: (dash: "dashed", paint: gray))
    line((-1.7, 0), (1.7, 0), stroke: (dash: "dashed", paint: gray))
    // A at 45 deg N
    let a_x = 1.5 * calc.cos(45deg)
    let a_y = 1.5 * calc.sin(45deg)
    line((0,0), (a_x, a_y), stroke: 0.5pt)
    circle((a_x, a_y), radius: 0.05, fill: black)
    content((a_x + 0.2, a_y + 0.2), text(size: 8pt)[$A (45° N)$])
    // B at 30 deg S
    let b_x = 1.5 * calc.cos(-30deg)
    let b_y = 1.5 * calc.sin(-30deg)
    line((0,0), (b_x, b_y), stroke: 0.5pt)
    circle((b_x, b_y), radius: 0.05, fill: black)
    content((b_x + 0.2, b_y - 0.2), text(size: 8pt)[$B (30° S)$])
    arc((rel: (angle: -30deg, radius: 0.5), to: (0,0)), start: -30deg, stop: 45deg, radius: 0.5, stroke: 0.5pt + red)
    content((0.7, 0.2), text(size: 8pt, fill: red)[$alpha$])
  }),
  [Hai thành phố A và B nằm trên cùng một kinh tuyến của Trái Đất. Thành phố A có vĩ độ $45°$ Bắc, thành phố B có vĩ độ $30°$ Nam. Giả sử Trái Đất là một khối cầu hoàn hảo với bán kính $R approx 6371$ km. Chiều dài cung kinh tuyến nối từ A đến B (đường chim bay) xấp xỉ bằng:],
  ([$4168$ km], [$6835$ km], True([$8339$ km]), [$10007$ km]),
  loigiai: [
    #step[*B1: Xác định góc ở tâm chắn cung AB* \
      Do hai thành phố nằm trên cùng kinh tuyến nhưng khác bán cầu (A ở Bắc, B ở Nam), góc ở tâm hợp bởi hai bán kính đi qua A và B là tổng độ lớn hai vĩ độ: \
      $alpha = 45° + 30° = 75°$.]
    #step[*B2: Đổi số đo góc sang radian* \
      Trong hệ tọa độ cung tròn, chiều dài cung phải tính bằng radian. \
      $alpha_"rad" = 75° dot pi/180 = (5pi)/12$ rad.]
    #step[*B3: Áp dụng công thức tính chiều dài cung* \
      Chiều dài cung kinh tuyến nối A và B: \
      $l = R alpha = 6371 dot (5pi)/12 approx 6371 dot 1.309 approx 8339.6$ km.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 0.6, name: "earth", fill: blue.lighten(80%), stroke: blue)
    content((0,0), text(size: 7pt)[Trái Đất])
    circle((0,0), radius: 2, stroke: (dash: "dashed", paint: gray))
    circle((0, 2), radius: 0.1, fill: orange)
    content((0, 2.3), text(size: 8pt)[Vệ tinh])
    line((0,0), (0, 0.6), stroke: 0.5pt)
    content((-0.25, 0.3), text(size: 7pt)[$R_0$])
    line((0, 0.6), (0, 2), stroke: 0.5pt + red)
    content((-0.2, 1.3), text(size: 7pt, fill: red)[$h$])
  }),
  [Một vệ tinh địa tĩnh quay quanh Trái Đất ở độ cao $h = 35786$ km so với mặt đất, nằm ngay trên xích đạo. Bán kính Trái Đất là $R_0 = 6371$ km. Vệ tinh này đứng yên so với mặt đất nên chu kỳ quay của nó đúng bằng chu kỳ tự quay của Trái Đất (coi là 24 giờ). Vận tốc dài của vệ tinh trên quỹ đạo xấp xỉ bằng:],
  ([$1.52$ km/s], True([$3.07$ km/s]), [$4.25$ km/s], [$7.91$ km/s]),
  loigiai: [
    #step[*B1: Xác định bán kính quỹ đạo* \
      Quỹ đạo của vệ tinh là một đường tròn có tâm là tâm Trái Đất. Do đó, bán kính quỹ đạo là: \
      $R = R_0 + h = 6371 + 35786 = 42157$ km.]
    #step[*B2: Tính tốc độ góc của vệ tinh* \
      Chu kỳ quay của vệ tinh là $T = 24$ giờ = $24 dot 3600 = 86400$ giây. \
      Tốc độ góc: $omega = (2pi) / T = (2pi) / 86400 approx 7.272 dot 10^{-5}$ rad/s.]
    #step[*B3: Tính vận tốc dài* \
      Vận tốc dài của vệ tinh trên quỹ đạo: \
      $v = R omega = 42157 dot 7.272 dot 10^{-5} approx 3.066$ km/s. \
      Làm tròn ta được xấp xỉ $3.07$ km/s.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: 1pt)
    for i in range(12) {
      let a = 90deg - i * 30deg
      let x = 1.3 * calc.cos(a)
      let y = 1.3 * calc.sin(a)
      content((x, y), text(size: 6pt)[#(if i == 0 { 12 } else { i })])
    }
    // Minute hand at 15m (3 o'clock)
    line((0,0), (1, 0), stroke: 1.5pt + blue)
    // Hour hand at 3:15
    let h_angle = 0deg - 7.5deg
    let hx = 0.7 * calc.cos(h_angle)
    let hy = 0.7 * calc.sin(h_angle)
    line((0,0), (hx, hy), stroke: 2pt + red)
    arc((rel: (angle: -7.5deg, radius: 0.4), to: (0,0)), start: -7.5deg, stop: 0deg, radius: 0.4, stroke: 0.5pt)
  }),
  [Vào đúng thời điểm 3 giờ 15 phút, góc hợp bởi kim giờ và kim phút trên mặt đồng hồ (tính theo radian) là:],
  (True([$pi/24$]), [$pi/12$], [$pi/6$], [$0$]),
  loigiai: [
    #step[*B1: Xác định vị trí kim phút* \
      Vào lúc 3h15p, kim phút chỉ chính xác số 3. Ta quy ước mốc $0°$ ở số 3, góc tăng ngược chiều kim đồng hồ. \
      Vậy tọa độ góc kim phút là $alpha_m = 0°$.]
    #step[*B2: Tính vận tốc góc của kim giờ* \
      Trong 12 giờ (720 phút), kim giờ quay được 1 vòng tròn ($360°$). \
      Vận tốc góc kim giờ: $v_h = 360° / 720 = 0.5°$/phút.]
    #step[*B3: Xác định vị trí kim giờ* \
      Lúc 3h đúng, kim giờ ở ngay số 3 ($0°$). \
      Từ 3h00 đến 3h15, kim giờ đã dịch chuyển 15 phút xuống phía số 4. \
      Góc dịch chuyển: $0.5° times 15 = 7.5°$.]
    #step[*B4: Đổi sang radian* \
      Góc lệch giữa hai kim là $7.5°$. \
      Đổi ra radian: $7.5° dot pi/180 = pi/24$ rad.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: (dash: "dashed"))
    line((0,0), (0, 1.5), stroke: 2pt)
    line((0,0), (1.3, -0.75), stroke: 2pt)
    line((0,0), (-1.3, -0.75), stroke: 2pt)
    circle((0,0), radius: 0.1, fill: black)
    arc((rel: (angle: 90deg, radius: 1.7), to: (0,0)), start: 90deg, stop: 450deg, radius: 1.7, stroke: (paint: red, thickness: 0.5pt), mark: (end: ">"))
    content((1, 1.5), text(size: 8pt)[$15$ vòng/phút])
  }),
  [Một turbine gió khổng lồ có chiều dài mỗi cánh là 40 m. Cánh quạt quay với tốc độ ổn định 15 vòng/phút. Quãng đường (tính bằng km) mà đầu mũi của một cánh quạt vạch ra trong không gian sau 2 giờ hoạt động liên tục xấp xỉ bằng:],
  ([$226$ km], True([$452$ km]), [$904$ km], [$113$ km]),
  loigiai: [
    #step[*B1: Tính tốc độ góc của cánh quạt* \
      1 vòng tương ứng góc $2pi$ rad. \
      Tốc độ góc: $omega = 15 dot 2pi = 30pi$ rad/phút.]
    #step[*B2: Tổng góc quét trong 2 giờ* \
      2 giờ = $120$ phút. \
      Tổng góc quay được: $alpha = omega t = 30pi dot 120 = 3600pi$ rad.]
    #step[*B3: Tính quãng đường đầu cánh quạt* \
      Áp dụng công thức độ dài cung $l = R alpha$: \
      $l = 40 dot 3600pi = 144000pi$ m.]
    #step[*B4: Đổi ra km* \
      $l approx 144000 dot 3.14159 approx 452389$ m $approx 452.4$ km.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 2), radius: 2, stroke: 1pt)
    line((0, 2), (0, 0), stroke: (dash: "dashed"))
    circle((0, 0), radius: 0.1, fill: red)
    content((0, -0.3), text(size: 8pt)[$A (t=0)$])
    line((-0.5, -0.2), (0.5, -0.2), stroke: 1pt)
    content((0, -0.6), text(size: 6pt)[Mặt đất])
    arc((rel: (angle: -90deg, radius: 2), to: (0, 2)), start: -90deg, stop: 0deg, radius: 2, stroke: (paint: blue, thickness: 1.5pt), mark: (end: ">"))
    circle((2, 2), radius: 0.1, fill: blue)
    content((2.4, 2), text(size: 8pt)[$A (t=30)$])
    content((-0.4, 1), text(size: 8pt)[$20$ m])
  }),
  [Một vòng đu quay (Ferris wheel) có bán kính 20 m, quay đều 1 vòng hết 2 phút. Tại thời điểm $t = 0$, khoang khách A ở vị trí thấp nhất (cách mặt đất 2 m). Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tốc độ góc của vòng quay là $pi$ rad/s.],
    True([Vận tốc dài của khoang A là $approx 1.05$ m/s.]),
    True([Sau 30 giây, khoang A lên đến độ cao 22 m so với mặt đất.]),
    True([Sau 45 giây, khoang A quét được một góc $135°$ ở tâm quay.]),
  ),
  loigiai: [
    - *a) Sai:* Chu kỳ quay $T = 2$ phút = 120 s. \ Tốc độ góc $omega = (2pi)/T = (2pi)/120 = pi/60$ rad/s.
    - *b) Đúng:* Vận tốc dài của khoang $A$: \ $v = R omega = 20 dot pi/60 = pi/3 approx 1.047$ m/s.
    - *c) Đúng:* 30 giây = $T/4$. Khoang quay được $90°$, từ vị trí thấp nhất lên vị trí ngang bằng tâm quay. \ Tâm quay cách mặt đất: $2 + 20 = 22$ m. Vậy độ cao là 22 m.
    - *d) Đúng:* Góc quét được sau 45s là $alpha = omega t = pi/60 dot 45 = (3pi)/4$ rad. \ $(3pi)/4$ tương ứng với $135°$.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 0), radius: 1, stroke: 1.5pt)
    circle((0, 0), radius: 0.1, fill: black)
    line((1, 0), (1, -2), stroke: 1.5pt + red)
    arc((rel: (angle: 90deg, radius: 1.2), to: (0,0)), start: 90deg, stop: 0deg, radius: 1.2, stroke: 0.5pt, mark: (end: ">"))
    content((1.3, -1), text(size: 8pt)[Cáp])
  }),
  [Một sợi cáp được tời (cuốn) qua một trục ròng rọc có đường kính 0.5 m. Ròng rọc quay với gia tốc góc không đổi từ trạng thái nghỉ, sau 10 giây đạt tốc độ 60 vòng/phút. Xét các mệnh đề:],
  (
    [Bán kính ròng rọc là 0.5 m.],
    True([Tốc độ góc đạt được ở giây thứ 10 là $2pi$ rad/s.]),
    True([Độ dài đoạn cáp được cuốn lên sau 10 giây đầu tiên là $2.5pi$ m.]),
    True([Vận tốc dài của sợi cáp ở giây thứ 10 là $pi/2$ m/s.]),
  ),
  loigiai: [
    - *a) Sai:* Đường kính 0.5 m nên bán kính $R = 0.25$ m.
    - *b) Đúng:* $n = 60$ vòng/phút = 1 vòng/giây $=> omega = 2pi$ rad/s.
    - *c) Đúng:* Gia tốc góc $gamma = (Delta omega) / (Delta t) = (2pi)/10 = pi/5$ rad/s². \ Góc quay được trong 10s: $theta = 1/2 gamma t^2 = 1/2 dot pi/5 dot 100 = 10pi$ rad. \ Chiều dài cáp $l = R theta = 0.25 dot 10pi = 2.5pi$ m.
    - *d) Đúng:* $v = R omega = 0.25 dot 2pi = 0.5pi = pi/2$ m/s.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1, stroke: 1.5pt)
    circle((0,0), radius: 0.1, fill: black)
    line((-1.5, -1), (1.5, -1), stroke: 2pt) // road
    line((0,0), (1, 0), stroke: 0.5pt)
    content((0.5, 0.2), text(size: 8pt)[$R$])
    arc((rel: (angle: 90deg, radius: 1.2), to: (0,0)), start: 90deg, stop: 0deg, radius: 1.2, stroke: 0.5pt, mark: (end: ">"))
    content((1.4, 0.8), text(size: 8pt)[$omega$])
  }),
  [Vành của một bánh xe ô tô tải có đường kính 1 m. Trong quá trình xe chạy trên cao tốc với vận tốc 72 km/h, hãy tính số vòng bánh xe quay được trong vòng 1 giây. (Nhập kết quả được làm tròn tới số thập phân thứ hai).],
  [$6.37$],
  loigiai: [
    #step[*B1: Chuyển đổi vận tốc xe* \
      Vận tốc xe $v = 72$ km/h = $(72 times 1000) / 3600 = 20$ m/s. \
      Trong 1 giây, bánh xe di chuyển được quãng đường 20 m.]
    #step[*B2: Tính chu vi bánh xe* \
      Bán kính bánh xe $R = 0.5$ m. \
      Chu vi bánh xe $C = 2pi R = pi$ m. Đây là quãng đường xe đi được khi bánh xe lăn đúng 1 vòng.]
    #step[*B3: Số vòng quay trong 1 giây* \
      Số vòng $N = v / C = 20 / pi approx 6.366$. \
      Làm tròn đến 2 chữ số thập phân: $6.37$ vòng.]
  ],
))

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 0.75, stroke: 1pt + blue)
    circle((3,0), radius: 1.25, stroke: 1pt + red)
    line((0, 0.75), (3, 1.25), stroke: 1pt)
    line((0, -0.75), (3, -1.25), stroke: 1pt)
    content((0, -0.2), text(size: 7pt)[$R_1$])
    content((3, -0.2), text(size: 7pt)[$R_2$])
  }),
  [Trên một dải ruy băng truyền chuyển động giữa hai bu-li (pulley) có bán kính lần lượt là $R_1 = 15$ cm và $R_2 = 25$ cm. Khi bu-li nhỏ quay được 50 vòng thì bu-li lớn quay được bao nhiêu vòng?],
  [$30$],
  loigiai: [
    #step[*B1: Mối quan hệ truyền động* \
      Dải ruy băng truyền động sẽ làm cho quãng đường vành ngoài của hai bu-li dịch chuyển là như nhau. Tức là $l_1 = l_2$.]
    #step[*B2: Liên hệ số vòng quay* \
      Quãng đường đi được bằng số vòng nhân với chu vi: \
      $N_1 dot (2pi R_1) = N_2 dot (2pi R_2) => N_1 R_1 = N_2 R_2$.]
    #step[*B3: Tính số vòng bu-li lớn* \
      $N_2 = N_1 dot (R_1/R_2) = 50 dot (15/25) = 50 dot 0.6 = 30$ vòng.]
  ],
))
