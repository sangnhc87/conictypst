#import "_config.typ": *

#lesson([Bách Khoa Toàn Thư: Toán Thực Tế Hàm Số Mũ - Logarit], theme-color: c-book)

#q-label([GIỚI THIỆU: SỨC MẠNH CỦA ĐẠI BÁC], c-book)

Hàm số mũ và logarit không sinh ra để "làm khó" học sinh trên giấy nháp. Nó là ngôn ngữ của tự nhiên và kinh tế. Bất cứ khi nào tốc độ thay đổi của một đại lượng tỷ lệ thuận với chính lượng đang có (ví dụ: tiền đẻ ra tiền, vi khuẩn sinh ra vi khuẩn, chất phóng xạ phân rã dựa trên khối lượng còn lại), ta CẦN ĐẾN hàm mũ. Và khi cần giải ngược thời gian, ta CẦN ĐẾN logarit.

---

#muc([1. LĨNH VỰC KINH TẾ & TÀI CHÍNH CÁ NHÂN])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Gửi tiết kiệm Lãi kép (Compound Interest)])[
    Gửi số tiền $P$ vào ngân hàng với lãi suất $r$/kỳ hạn. 
    Sau $n$ kỳ hạn, số tiền nhận được (Cả gốc lẫn lãi) là:
    $ A = P (1 + r)^n $
    Nếu lãi suất tính theo năm nhưng gộp lãi (nhập gốc) $k$ lần/năm thì:
    $ A = P (1 + r/k)^(n k) $
    *Ví dụ thực tế:* Tại sao người giàu càng giàu nhanh? Vì đường cong lãi kép bứt tốc theo hàm mũ.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Tiền gửi định kỳ (Annuity) - Bài toán gửi hưu trí])[
    Mỗi tháng bạn trích một khoản tiền $a$ để gửi tiết kiệm với lãi suất $r$/tháng. Sau $n$ tháng, tổng số tiền bạn có là bao nhiêu?
    - Tháng 1 gửi $a$, tiền này sinh lời trong $n$ tháng: $a(1+r)^n$.
    - Tháng 2 gửi $a$, sinh lời trong $n-1$ tháng: $a(1+r)^(n-1)$.
    - ... Tháng cuối cùng gửi $a$, sinh lời 1 tháng: $a(1+r)^1$.
    Tổng tiền là tổng của cấp số nhân với công bội $q = 1+r$:
    $ S_n = a(1+r) + a(1+r)^2 + ... + a(1+r)^n = a(1+r) ((1+r)^n - 1) / r $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Vay trả góp mua nhà/xe (Amortization)])[
    Vay ngân hàng số tiền $P$, lãi suất $r$/tháng. Mỗi tháng bạn phải trả đều đặn số tiền $A$ trong suốt $n$ tháng để xóa nợ.
    Số tiền trả mỗi tháng được tính bằng:
    $ A = (P dot r dot (1+r)^n) / ((1+r)^n - 1) $
    *Bí mật ngân hàng:* Dòng tiền bạn trả mỗi tháng ($A$) là cố định, nhưng phần cấu thành nên nó thay đổi liên tục. Tháng đầu tiên, bạn chủ yếu trả tiền lãi. Phải đến nửa cuối chu kỳ vay, số tiền bạn trả mới thực sự trừ mạnh vào gốc.
  ]
]

#align(center)[
  *Biểu đồ cấu trúc dòng tiền Vay Trả Góp 20 năm* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (10, 0), mark: (end: ">"), stroke: 0.8pt)
    content((9.8, -0.4), [$t$ (Tháng)])
    line((0, 0), (0, 4), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 3.8), [$A$])
    
    line((0, 3), (10, 3), stroke: (dash: "dashed"))
    content((-1.5, 3), text(fill: luma(80))[Trả cố định])
    
    // Interest curve (exponential decay)
    let p_int = range(0, 100).map(t => {
      let x = t/10
      let y = 3 * calc.pow(calc.e, -0.3 * x)
      (x, y)
    })
    line(..p_int, stroke: 1.5pt + red)
    
    content((2, 2.2), text(fill: red, weight: "bold")[Trả Lãi (Interest)])
    content((7, 1.2), text(fill: blue, weight: "bold")[Trả Gốc (Principal)])
    
    content((0, -0.4), [0])
    content((5, -0.4), [10 năm])
    content((9, -0.4), [20 năm])
  })
]

#muc([2. LĨNH VỰC VẬT LÝ & HÓA HỌC])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 4: Khảo cổ học và Phân rã Carbon-14])[
    Đồng vị phóng xạ bị phân rã theo hàm mũ:
    $ m(t) = m_0 e^(-lambda t) = m_0 (1/2)^(t/T) $
    Trong đó $T$ là chu kỳ bán rã (Half-life). Chu kỳ bán rã của C-14 là khoảng 5730 năm. Khi một sinh vật chết đi, lượng C-14 trong cơ thể nó bắt đầu giảm. Bằng cách đo tỷ lệ C-14 còn lại, các nhà khảo cổ tính ngược được tuổi của hóa thạch xương khủng long hoặc xác ướp Ai Cập.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 5: Định luật làm nguội của Newton])[
    Nhiệt độ của một vật thể nóng đặt trong môi trường mát hơn sẽ giảm theo hàm mũ và tiệm cận dần về nhiệt độ môi trường.
    $ T(t) = T_m + (T_0 - T_m)e^(-k t) $
    - $T_m$: Nhiệt độ môi trường (Room temperature).
    - $T_0$: Nhiệt độ ban đầu của vật (Ly cà phê lúc vừa pha).
    - $k$: Hằng số tốc độ làm nguội phụ thuộc vật liệu.
  ]
]

#align(center)[
  *Đồ thị giảm nhiệt độ của một ly nước sôi $100^"°C"$ trong phòng $20^"°C"$* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (8, 0), mark: (end: ">"), stroke: 0.8pt)
    content((7.8, -0.4), [$t$])
    line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 4.8), [$T ("°C")$])
    
    line((0, 1), (8, 1), stroke: (dash: "dashed", paint: luma(100)))
    content((-0.5, 1), [$20 "°C"$])
    content((-0.5, 5), [$100 "°C"$])
    
    let p_decay = range(0, int(8*20)).map(t => (t/20, 1 + 4 * calc.pow(calc.e, -0.5 * (t/20))))
    line(..p_decay, stroke: 1.5pt + red)
    
    content((3, 2.5), text(fill: red)[$T(t) = 20 + 80e^(-k t)$])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 6: Thang đo pH trong Hóa học])[
    Nồng độ ion $H^+$ trong dung dịch thay đổi cực kỳ lớn, từ $1 "mol/L"$ đến $0.00000000000001 "mol/L"$. Người ta dùng logarit cơ số 10 âm để nén thang đo này lại thành các số dễ đọc từ 0 đến 14.
    $ "pH" = -lg ("["H^+"]") $
    Hệ quả: pH giảm 1 đơn vị, tính axit tăng gấp 10 lần. Nước chanh (pH=2) có tính axit mạnh gấp $100.000$ lần nước tinh khiết (pH=7).
  ]
]

#muc([3. LĨNH VỰC ĐỊA LÝ & MÔI TRƯỜNG])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 7: Động đất & Thang đo Richter])[
    Độ lớn của một trận động đất trên thang Richter được đo bằng logarit cơ số 10 của biên độ sóng địa chấn $A$:
    $ M = lg(A / A_0) $
    Năng lượng tỏa ra $E$ liên hệ với độ Richter qua phương trình Gutenberg-Richter:
    $ lg E = 1.5M + 4.8 <=> E = 10^(1.5M + 4.8) $
    Hệ quả: Động đất 8 độ có biên độ sóng gấp 10 lần động đất 7 độ, nhưng **Năng lượng tàn phá gấp $10^1.5 approx 31.6$ lần**.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 8: Mức cường độ âm thanh Decibel (dB)])[
    Tai người có thể nghe dải năng lượng âm thanh chênh lệch nhau hàng tỷ lần. Do đó, người ta dùng hàm logarit nén lại thành thang Decibel:
    $ L = 10 lg(I / I_0) ("đơn vị: dB") $
    - $I_0 = 10^(-12) "W/m"^2$ (Ngưỡng nghe nhỏ nhất - Tiếng lá rơi).
    - $120 "dB"$: Ngưỡng đau (Động cơ phản lực).
    Âm thanh 100 dB (nhạc Rock) không phải to gấp đôi 50 dB (nói chuyện), mà nó mang năng lượng chênh lệch tới $10^5 = 100.000$ lần.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 9: Áp suất khí quyển theo độ cao])[
    Càng lên cao không khí càng loãng, áp suất khí quyển $P$ giảm theo hàm mũ so với độ cao $h$:
    $ P(h) = P_0 e^(-k h) $
    Trên đỉnh Everest ($h approx 8848 "m"$), áp suất chỉ còn khoảng 1/3 so với mực nước biển, nước sôi ở $70 "°C"$ thay vì $100 "°C"$.
  ]
]

#muc([4. LĨNH VỰC SINH HỌC & Y TẾ])

#block(breakable: false)[
  #phuongphap(title: [Mô hình 10: Dược động học - Half-life của Thuốc])[
    Sau khi uống thuốc, nồng độ thuốc trong máu đào thải qua gan/thận theo quy luật phân rã mũ tương tự Carbon-14.
    Chu kỳ bán rã (Half-life) là thời gian để nồng độ thuốc giảm đi một nửa. Ví dụ Paracetamol có half-life khoảng 2-3 giờ. Sau 5 chu kỳ bán rã, thuốc gần như bị đào thải hoàn toàn ($1/2^5 = 3.125%$).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 11: Đường cong Sinh trưởng Logistic])[
    Vi khuẩn không thể nhân lên vô hạn theo hàm mũ $N = 2^t$ vì môi trường cạn kiệt thức ăn. Khởi đầu chúng tăng theo hàm mũ, sau đó chậm lại và tiệm cận về một mức "Sức chứa tối đa của môi trường" (Carrying Capacity).
    Phương trình Logistic (Đường cong chữ S - S-Curve):
    $ N(t) = A / (1 + B e^(-k t)) $
    Mô hình này là chìa khóa để dự đoán sự lây lan của dịch bệnh (như Covid-19) để hệ thống y tế có thời gian chuẩn bị.
  ]
]

#align(center)[
  *Đồ thị Logistic (Hình chữ S) - Giới hạn sinh thái học* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (8, 0), mark: (end: ">"), stroke: 0.8pt)
    content((7.8, -0.4), [$t$])
    line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 4.8), [$N$])
    
    line((0, 4), (8, 4), stroke: (dash: "dashed", paint: red))
    content((-1.5, 4), text(fill: red)[Giới hạn $A$])
    
    let p_logistic = range(0, int(8*20)).map(t => {
      let x = t/20
      let y = 4 / (1 + 40 * calc.pow(calc.e, -1.2 * x))
      (x, y)
    })
    line(..p_logistic, stroke: 1.5pt + blue)
    
    circle((3.07, 2), radius: 0.08, fill: red)
    content((3.5, 1.5), text(size: 9pt)[Điểm uốn (Khủng hoảng)])
  })
]

#muc([5. BÀI TẬP THỰC CHIẾN CHUYÊN SÂU])

#q-wrap(dir: "doc", tn(
  [Một trận động đất mạnh 7.5 độ Richter ở Nhật Bản. Nếu một trận động đất khác có biên độ sóng địa chấn lớn gấp 100 lần, thì độ lớn của nó trên thang Richter là bao nhiêu?],
  ([$8.5$ độ], [$9.0$ độ], [$9.5$ độ], True([$9.5$ độ])),
  loigiai: [
    #step[**B1: Phân tích chênh lệch biên độ** \ Ta có $M_2 - M_1 = lg(A_2 / A_0) - lg(A_1 / A_0) = lg(A_2 / A_1)$.]
    #step[**B2: Thay số** \ Do $A_2 = 100 A_1 => lg(100) = 2$. Vậy $M_2 - M_1 = 2$.]
    #step[**B3: Kết luận** \ $M_2 = 7.5 + 2 = 9.5$ độ Richter.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Để mua một căn hộ 2 tỷ đồng, bạn vay ngân hàng với lãi suất $0.6%$/tháng, trả góp đều đặn hàng tháng trong vòng 10 năm (120 tháng). Hỏi tháng ĐẦU TIÊN, số tiền bạn thực sự TRẢ VÀO GỐC (không tính phần trả lãi) là bao nhiêu? (Làm tròn đến nghìn đồng).],
  ([$11.365.000$], [$22.240.000$], True([$10.244.000$]), [$12.000.000$]),
  loigiai: [
    #step[**B1: Tính số tiền trả cố định hàng tháng** \ $P = 2.000.000.000$, $r = 0.006$, $n = 120$. \ $A = (2.000.000.000 dot 0.006 dot 1.006^120) / (1.006^120 - 1) approx 22.244.000$ VNĐ.]
    #step[**B2: Tính tiền LÃI tháng đầu** \ Lãi tháng đầu tính trên dư nợ gốc 2 tỷ: $I_1 = 2.000.000.000 dot 0.006 = 12.000.000$ VNĐ.]
    #step[**B3: Tính tiền GỐC tháng đầu** \ Số tiền thực sự trừ vào gốc: $A - I_1 = 22.244.000 - 12.000.000 = 10.244.000$ VNĐ. \ *Bạn thấy đó, dù trả tới hơn 22 triệu nhưng gốc chỉ giảm được 10 triệu!*]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một loài bèo tấm thả vào hồ nước. Ban đầu có 1 m² diện tích bèo. Biết rằng sau mỗi ngày, diện tích bèo tăng gấp đôi. Hỏi sau bao nhiêu ngày thì bèo phủ kín mặt hồ có diện tích 1024 m²?],
  ([$9$ ngày], True([$10$ ngày]), [$11$ ngày], [$12$ ngày]),
  loigiai: [
    #step[**B1: Lập công thức** \ Diện tích bèo sau $t$ ngày là $S(t) = S_0 dot 2^t = 1 dot 2^t = 2^t$.]
    #step[**B2: Giải phương trình** \ Ta cần tìm $t$ sao cho $S(t) = 1024 <=> 2^t = 1024$.]
    #step[**B3: Kết luận** \ $t = log_2(1024) = 10$ ngày.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Đồng vị Carbon-14 có chu kỳ bán rã là 5730 năm. Các nhà khảo cổ tìm thấy một mảnh xương cổ chỉ còn chứa $30%$ lượng Carbon-14 so với một khúc xương tươi cùng loại. Tuổi của mảnh xương cổ này xấp xỉ bao nhiêu năm?],
  ([$8500$ năm], True([$9952$ năm]), [$12000$ năm], [$17190$ năm]),
  loigiai: [
    #step[**B1: Lập phương trình phân rã** \ Lượng C-14 còn lại sau thời gian $t$ là $m(t) = m_0 (1/2)^(t/5730)$.]
    #step[**B2: Thay số liệu** \ Đề cho $m(t) = 0.3 m_0$, suy ra: $0.3 = (1/2)^(t/5730)$.]
    #step[**B3: Giải logarit** \ $t/5730 = log_(0.5) (0.3) approx 1.737 => t = 5730 dot 1.737 approx 9952.9$ năm.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một loại pin điện thoại được sạc theo mô hình hàm số $Q(t) = 100(1 - e^(-k t))$, trong đó $Q(t)$ là phần trăm pin sạc được sau thời gian $t$ (phút). Biết rằng sau 30 phút, pin sạc được $50%$. Hỏi mất tổng cộng khoảng bao nhiêu phút (tính từ lúc hết sạch pin) để pin sạc đạt $90%$?],
  ([$60$ phút], [$75$ phút], True([$100$ phút]), [$120$ phút]),
  loigiai: [
    #step[**B1: Tìm hằng số $k$** \ Khi $t = 30$ thì $Q(30) = 50$, ta có: $50 = 100(1 - e^(-30k)) <=> 1 - e^(-30k) = 0.5 <=> e^(-30k) = 0.5$. \ $=> -30k = ln(0.5) => k = -ln(0.5)/30 approx 0.0231$.]
    #step[**B2: Tính thời gian $t$ để $Q(t) = 90$** \ $90 = 100(1 - e^(-0.0231 t)) <=> 0.9 = 1 - e^(-0.0231 t) <=> e^(-0.0231 t) = 0.1$. \ $=> -0.0231 t = ln(0.1) => t = (-ln(0.1)) / 0.0231 approx 99.68$ phút.]
    #step[**B3: Kết luận** \ Cần xấp xỉ 100 phút để sạc đạt $90%$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Áp suất khí quyển $P$ (tính bằng mmHg) giảm theo độ cao $h$ (tính bằng km) so với mực nước biển theo công thức $P = 760 dot e^(-0.12 h)$. Nếu áp suất tại đỉnh núi A đo được là $380$ mmHg, độ cao của đỉnh núi A xấp xỉ bao nhiêu km?],
  (True([$5.78$ km]), [$6.33$ km], [$7.60$ km], [$8.85$ km]),
  loigiai: [
    #step[**B1: Thiết lập phương trình** \ $380 = 760 dot e^(-0.12 h) <=> e^(-0.12 h) = 380/760 = 0.5$.]
    #step[**B2: Lấy logarit tự nhiên (ln)** \ $-0.12 h = ln(0.5) approx -0.693$.]
    #step[**B3: Giải độ cao $h$** \ $h = (-0.693) / (-0.12) approx 5.776$ km.]
  ]
))

