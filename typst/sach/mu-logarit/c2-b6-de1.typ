#import "_config.typ": *
#show: doc-setup
#muc([Đề Luyện Tập — Các Bài Toán Ứng Dụng Thực Tế])

#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Một kỹ sư mới ra trường nhận được mức lương khởi điểm là 15 triệu đồng/tháng. Công ty cam kết mỗi năm sẽ tăng lương thêm 8% so với năm trước đó. Mức lương hàng tháng của kỹ sư này ở năm làm việc thứ 5 là bao nhiêu (làm tròn đến nghìn đồng)?],
  ([$19.440.000$], [$20.995.000$], True([$20.407.000$]), [$22.040.000$]), // 15 * 1.08^4 = 20.407334
  loigiai: [
    #step[**B1: Xác định mô hình** \ Đây là bài toán lãi kép. Mức lương ở năm thứ 1 là $A = 15$. Ở năm thứ $n$, mức lương là $A(1 + r)^(n-1)$.]
    #step[**B2: Tính toán** \ Ở năm thứ 5, số năm được tăng lương là $n - 1 = 4$. \ Mức lương là $15 dot (1.08)^4 approx 20.407$ triệu đồng.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cường độ âm thanh của một cuộc nói chuyện bình thường là $60 d B$, trong khi cường độ âm thanh của một buổi hòa nhạc rock là $110 d B$. Hỏi năng lượng âm thanh từ buổi nhạc rock lớn gấp bao nhiêu lần cuộc nói chuyện?],
  ([$50$ lần], [$500$ lần], [$10.000$ lần], True([$100.000$ lần])),
  loigiai: [
    #step[**B1: Công thức Decibel** \ Độ chênh lệch mức cường độ âm: $L_2 - L_1 = 10 log(I_2 / I_1)$.]
    #step[**B2: Thay số** \ $110 - 60 = 50 => 10 log(I_2 / I_1) = 50 => log(I_2 / I_1) = 5$.]
    #step[**B3: Kết luận** \ $I_2 / I_1 = 10^5 = 100.000$ lần. Dù thính giác chỉ cảm nhận ồn hơn gần gấp đôi, nhưng mức năng lượng thực tế đập vào màng nhĩ lớn gấp 100.000 lần!]
  ]
))

#q-wrap(dir: "doc", tn(
  [Các nhà khảo cổ học phát hiện một khúc xương và đo được tỷ lệ Đồng vị Carbon-14 ($C^(14)$) chỉ còn bằng $15%$ so với lượng $C^(14)$ trong cơ thể sinh vật sống. Biết chu kỳ bán rã của $C^(14)$ là 5730 năm. Sinh vật này đã chết cách đây khoảng bao nhiêu năm?],
  ([$11.460$ năm], True([$15.683$ năm]), [$12.500$ năm], [$18.200$ năm]), // 5730 * log_2(1/0.15) = 5730 * 2.7369 = 15682.8
  loigiai: [
    #step[**B1: Mô hình phân rã** \ Khối lượng còn lại: $m(t) = m_0 dot (1/2)^(t / T)$.]
    #step[**B2: Thiết lập phương trình** \ $m(t)/m_0 = 0.15 <=> (1/2)^(t/5730) = 0.15 <=> 2^(-t/5730) = 0.15$.]
    #step[**B3: Giải phương trình mũ** \ Lấy logarit cơ số 2: $-t/5730 = log_2 (0.15) approx -2.73696$. \ $t approx 5730 dot 2.73696 approx 15683$ năm.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trận động đất tại Nhật Bản năm 2011 có độ lớn 9.0 độ Richter, trong khi trận động đất tại Haiti năm 2010 có độ lớn 7.0 độ Richter. Biên độ địa chấn tối đa của trận động đất ở Nhật Bản gấp bao nhiêu lần trận động đất ở Haiti?],
  ([$2$ lần], [$20$ lần], True([$100$ lần]), [$1000$ lần]),
  loigiai: [
    #step[**Công thức Richter** \ $M = log I - log I_0 <=> I = I_0 10^M$.]
    #step[**So sánh** \ Tỷ số biên độ: $I_N / I_H = (I_0 10^9.0) / (I_0 10^7.0) = 10^(9-7) = 10^2 = 100$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Theo định luật làm lạnh của Newton, nhiệt độ $T$ của một vật sau $t$ phút đặt trong môi trường có nhiệt độ $T_s$ được cho bởi $T(t) = T_s + (T_0 - T_s)e^(-k t)$. Một tách cà phê ở $90^o C$ được đặt trong phòng có nhiệt độ $20^o C$. Sau 10 phút, nhiệt độ tách cà phê còn $70^o C$. Sau bao nhiêu phút kể từ lúc đặt (làm tròn đến phút), tách cà phê có thể uống được ở nhiệt độ $45^o C$?],
  ([$18$ phút], [$25$ phút], [$28$ phút], True([$31$ phút])), // k = -1/10 * ln(50/70) = 0.0336. t = -1/k * ln(25/70) = -1/0.0336 * ln(0.357) = 30.6
  loigiai: [
    #step[**B1: Xác định hằng số $k$** \ Tại $t = 0$, $T_0 = 90$. $T_s = 20$. \ Tại $t = 10$, $T = 70 => 70 = 20 + (90 - 20)e^(-10k) <=> 50 = 70 e^(-10k) <=> e^(-10k) = 5/7$. \ Suy ra $-10k = ln(5/7) => k approx 0.033647$.]
    #step[**B2: Tính thời gian $t$** \ Yêu cầu nhiệt độ đạt $45^o C$: $45 = 20 + 70 e^(-k t) <=> 25 = 70 e^(-k t) <=> e^(-k t) = 5/14$. \ $-k t = ln(5/14) => t = (ln(5/14)) / (-0.033647) approx 30.61$ phút. \ Làm tròn thành $31$ phút.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Một người vay ngân hàng 1 tỷ đồng để mua nhà với lãi suất 9%/năm (0.75%/tháng). Người này chọn phương thức trả góp đều đặn hàng tháng một số tiền $M$ trong vòng 15 năm (180 tháng). Các nhận định sau đây đúng hay sai?],
  (
    [Sau tháng thứ nhất, số tiền người đó còn nợ (trước khi trả $M$) là 1.090.000.000 VNĐ.],
    True([Số tiền trả hàng tháng $M$ xấp xỉ 10.14 triệu đồng.]),
    True([Tổng số tiền lãi mà người đó phải trả cho ngân hàng sau 15 năm lớn hơn 800 triệu đồng.]),
    [Nếu lãi suất giảm xuống còn 6%/năm, số tiền trả hàng tháng sẽ giảm đi đúng một nửa.]
  ),
  loigiai: [
    - **a) Sai:** Lãi suất tính theo tháng là $0.75%$. Sau tháng thứ nhất, tiền nợ là $10^9(1 + 0.0075) = 1.007.500.000$ VNĐ, không phải tính 9% một cục ngay.
    - **b) Đúng:** Công thức vay trả góp: $M = (A dot r dot (1+r)^n) / ((1+r)^n - 1)$. \ Thay $A = 10^9, r = 0.0075, n = 180$, ta được $M = (10^9 dot 0.0075 dot 1.0075^180) / (1.0075^180 - 1) approx 10.142.665$ VNĐ.
    - **c) Đúng:** Tổng tiền trả ngân hàng: $180 dot 10.142.665 approx 1.825.679.700$ VNĐ. Vốn 1 tỷ, vậy tiền lãi là xấp xỉ 825 triệu đồng (> 800 triệu).
    - **d) Sai:** Khi lãi suất còn $0.5%$/tháng ($r=0.005$), $M' approx 8.438.500$ VNĐ. Không phải giảm một nửa.
  ]
))

#q-wrap(dir: "doc", ds(
  [Sự lây lan của một loại virus trong khu dân cư được mô phỏng bởi hàm số $N(t) = A / (1 + B e^(-k t))$, trong đó $N(t)$ là số người bị nhiễm sau $t$ ngày. Tại $t=0$, có 10 người nhiễm. Sau 5 ngày, có 50 người nhiễm. Giới hạn chứa bệnh của khu dân cư này là $A = 10.000$ người. Nhận định nào sau đây là đúng?],
  (
    True([Hằng số $B = 999$.]),
    True([Tốc độ lây lan đạt đỉnh điểm khi số người nhiễm bằng một nửa dân số ($5000$ người).]),
    [Sau đúng 15 ngày, số người nhiễm bệnh sẽ vượt quá 5.000 người.],
    True([Mô hình này cho thấy số người nhiễm sẽ không bao giờ vượt qua 10.000 người.])
  ),
  loigiai: [
    - **a) Đúng:** Tại $t=0$, $N(0) = 10000 / (1 + B) = 10 => 1 + B = 1000 => B = 999$.
    - **b) Đúng:** Theo hàm Logistic $N(t)$, đạo hàm $N'(t)$ (tốc độ lây lan) lớn nhất tại điểm uốn của đồ thị, tức là khi $N = A/2 = 5000$.
    - **c) Sai:** Ta tính hằng số $k$: Tại $t=5, N = 50 => 50 = 10000 / (1 + 999 e^(-5k)) => 1 + 999 e^(-5k) = 200 => e^(-5k) = 199/999 approx 0.199$. $k approx 0.3228$. \ Tại $t=15, N(15) = 10000 / (1 + 999 e^(-15 dot 0.3228)) approx 1250 < 5000$.
    - **d) Đúng:** Vì mẫu số $1 + B e^(-k t) > 1$, nên $N(t) < 10000$ với mọi $t$.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Bạn dự định mua một chiếc xe hơi giá 800 triệu đồng sau 5 năm nữa. Để có số tiền này, bạn gửi tiết kiệm một số tiền duy nhất vào ngân hàng ngay từ bây giờ với lãi suất lãi kép 7.5%/năm. Cùng lúc đó, giá xe mỗi năm tăng lạm phát 3%. Do giá trị xe trong tương lai cũng tăng nên bạn cần gửi số tiền ban đầu nhiều hơn. Hỏi hiện tại bạn cần phải đem gửi bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị triệu đồng).],
  [$646$], 
  loigiai: [
    #step[**B1: Tính giá trị tương lai của chiếc xe** \ Do lạm phát 3%/năm, giá xe sau 5 năm sẽ là $P = 800(1 + 0.03)^5 = 800(1.03)^5 approx 927.42$ triệu đồng.]
    #step[**B2: Tính số tiền cần gửi hiện tại** \ Gọi $A$ là số tiền cần gửi với lãi kép 7.5%/năm. Số tiền sau 5 năm: $A(1 + 0.075)^5$. \ Để đủ mua xe, ta cần $A(1.075)^5 = 927.42 => A = 927.42 / 1.075^5 = 800 dot (1.03 / 1.075)^5 approx 646.05$. \ Làm tròn hàng đơn vị là $646$ triệu đồng.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Dân số của một thành phố năm 2020 là 2 triệu người. Tỷ lệ tăng dân số tự nhiên không đổi là 1.5%/năm. Sử dụng mô hình tăng trưởng lũy thừa liên tục $N(t) = N_0 e^(r t)$, vào năm bao nhiêu dân số thành phố này đạt đến con số 3 triệu người? (Ghi năm cụ thể).],
  [$2047$],
  loigiai: [
    #step[**B1: Thiết lập phương trình** \ Ta có $N_0 = 2, N(t) = 3$ và $r = 0.015$. Phương trình là $3 = 2 e^(0.015 t)$.]
    #step[**B2: Giải phương trình** \ $e^(0.015 t) = 1.5 <=> 0.015 t = ln 1.5 <=> t = (ln 1.5) / 0.015 approx 27.03$ năm.]
    #step[**B3: Kết luận thời điểm** \ Cộng vào mốc ban đầu: $2020 + 27.03 = 2047.03$. \ Do đó trong năm $2047$, dân số sẽ đạt đến mốc 3 triệu người.]
  ]
))
