#import "../../../sang-exam.typ": *
#import "@preview/cetz:0.5.2"
#import "../../../bbt.typ": *
#import "../../../math-sym.typ": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = classic.blue

#show math.equation: set text(fill: black)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 3",
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 15)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một con lắc lò xo dao động tắt dần chậm do lực cản môi trường. Biên độ dao động của chu kỳ đầu tiên là $8.0$ cm. Kể từ chu kỳ thứ hai trở đi, biên độ dao động giảm đi $10\%$ sau mỗi chu kỳ so với chu kỳ liền trước đó. Biên độ dao động của con lắc ở chu kỳ thứ $6$ bằng bao nhiêu xăng-ti-mét?],
    (
        [$4.0$ cm.],
        [$4.3$ cm.],
        True([$4.72$ cm.]),
        [$5.12$ cm.]
    ),
    loigiai: [
        Biên độ dao động qua các chu kỳ lập thành một cấp số nhân $(A_n)$ có:
        - Số hạng đầu: $u_1 = 8.0$ (cm).
        - Công bội: $q = 1 - 10\% = 0.9$.
        Biên độ ở chu kỳ thứ 6 là số hạng $u_6$:
        $
          u_6 &= u_1 dot q^5 \
              &= 8.0 dot (0.9)^5 \
              &= 8.0 dot 0.59049 = 4.72392 approx 4.72 " (cm)"
        $
    ]
)

// TN 2
#tn([Khi một sóng âm truyền xuyên qua các lớp vật liệu tiêu âm đặc biệt, cường độ âm bị giảm đi. Cường độ âm ban đầu khi bắt đầu đi vào lớp vật liệu thứ nhất là $80$ dB. Kể từ lớp tiếp theo, cường độ âm bị giảm đi $8\%$ sau mỗi lớp so với lớp liền trước đó. Cường độ âm còn lại sau khi truyền qua hết lớp vật liệu thứ $5$ xấp xỉ bằng bao nhiêu dB?],
    (
        [$48.0$ dB.],
        [$50.5$ dB.],
        True([$52.7$ dB.]),
        [$55.6$ dB.]
    ),
    loigiai: [
        Cường độ âm sau khi truyền qua các lớp lập thành một cấp số nhân $(I_n)$ có:
        - Số hạng đầu: $u_1 = 80 dot 0.92$ (dB).
        - Công bội: $q = 1 - 8\% = 0.92$.
        Cường độ âm còn lại sau lớp thứ 5 là số hạng $u_5$:
        $
          u_5 &= u_1 dot q^4 \
              &= 80 dot (0.92)^5 \
              &approx 80 dot 0.65908 \
              &approx 52.7 " (dB)"
        $
    ]
)

// TN 3
#tn([Một vật nặng rơi tự do không vận tốc đầu từ độ cao lớn trong không khí khí động học. Giây thứ nhất vật rơi được quãng đường $4.9$ mét. Kể từ giây thứ hai, do lực cản không khí tăng tỉ lệ, quãng đường rơi được mỗi giây sau tăng thêm một lượng không đổi là $9.8$ mét so với giây liền trước đó. Hỏi trong giây thứ $8$, vật nặng rơi được quãng đường bao nhiêu mét?],
    (
        [$68.6$ m.],
        [$70.0$ m.],
        True([$73.5$ m.]),
        [$78.4$ m.]
    ),
    loigiai: [
        Quãng đường rơi được mỗi giây lập thành một cấp số cộng với:
        - Số hạng đầu: $u_1 = 4.9$ (m).
        - Công sai: $d = 9.8$ (m).
        Quãng đường rơi được ở giây thứ 8 là số hạng $u_8$:
        $
          u_8 &= u_1 + 7d \
              &= 4.9 + 7 dot 9.8 \
              &= 4.9 + 68.6 = 73.5 " (m)"
        $
    ]
)

// TN 4
#tn([Trong một máy gia tốc hạt ly tâm cơ học, hạt mang điện được gia tốc chuyển động tăng tốc liên tục. Chu kỳ thứ nhất tốc độ hạt đạt $1000$ m/s. Kể từ chu kỳ thứ hai trở đi, tốc độ hạt tăng gấp rưỡi (tương đương tăng $50\%$) so với chu kỳ liền trước đó. Tốc độ hạt đạt được ở chu kỳ thứ $6$ bằng bao nhiêu m/s?],
    (
        [$5000$ m/s.],
        [$6500$ m/s.],
        True([$7593.75$ m/s.]),
        [$8000$ m/s.]
    ),
    loigiai: [
        Tốc độ của hạt qua các chu kỳ lập thành cấp số nhân $(v_n)$ có:
        - Số hạng đầu: $u_1 = 1000$ (m/s).
        - Công bội: $q = 1.5$.
        Tốc độ hạt ở chu kỳ thứ 6 là số hạng $u_6$:
        $
          u_6 &= u_1 dot q^5 \
              &= 1000 dot (1.5)^5 \
              &= 1000 dot 7.59375 = 7593.75 " (m/s)"
        $
    ]
)

// TN 5
#tn([Áp suất khí quyển giảm dần khi độ cao tăng lên so với mực nước biển biển. Ở mực nước biển, áp suất khí quyển đo được tiêu chuẩn là $1013$ hPa. Cứ lên cao thêm mỗi $100$ mét, áp suất khí quyển giảm đi $1.2\%$ so với mức áp suất ở độ cao liền trước đó. Áp suất khí quyển ở độ cao $1200$ mét xấp xỉ bằng bao nhiêu hPa?],
    (
        [$850$ hPa.],
        True([$876$ hPa.]),
        [$900$ hPa.],
        [$920$ hPa.]
    ),
    loigiai: [
        Số lần giảm áp suất khi lên cao 1200m là:
        $ n = 1200 / 100 = 12 " (lần)" $
        Áp suất khí quyển lập thành một cấp số nhân có:
        - Số hạng đầu: $u_0 = 1013$ (hPa).
        - Công bội: $q = 1 - 1.2\% = 0.988$.
        Ở độ cao 1200m (tương ứng sau 12 lần giảm):
        $
          u_12 &= u_0 dot q^12 \
               &= 1013 dot (0.988)^12 \
               &approx 1013 dot 0.86505 \
               &approx 876.3 " (hPa)"
        $
        Làm tròn đến hàng đơn vị hPa là $876$ hPa.
    ]
)

// TN 6
#tn([Một khối kim loại được nung nóng đến nhiệt độ $200 degree "C"$ rồi đưa vào buồng làm lạnh để hạ nhiệt độ. Giờ thứ nhất nhiệt độ khối kim loại giảm xuống còn $160 degree "C"$. Biết kể từ giờ thứ hai trở đi, nhiệt độ khối kim loại giảm đi $20\%$ mỗi giờ so với giờ liền trước đó. Nhiệt độ của khối kim loại sau đúng $5$ giờ làm lạnh xấp xỉ bằng bao nhiêu độ C?],
    (
        [$60 degree "C"$.],
        True([$65.5 degree "C"$.]),
        [$72.0 degree "C"$.],
        [$80.0 degree "C"$.]
    ),
    loigiai: [
        Nhiệt độ của khối kim loại hằng giờ lập thành cấp số nhân $(T_n)$ có:
        - Số hạng đầu (nhiệt độ sau giờ thứ nhất): $u_1 = 160 degree "C"$.
        - Công bội: $q = 1 - 20\% = 0.8$.
        Sau 5 giờ làm lạnh (tương ứng với số hạng thứ 5):
        $
          u_5 &= u_1 dot q^4 \
              &= 160 dot (0.8)^4 \
              &= 160 dot 0.4096 = 65.536 degree "C" \
              &approx 65.5 degree "C"
        $
    ]
)

// TN 7
#tn([Một bánh đà tích năng lượng cơ học quay chậm dần đều do ma sát ổ trục trục. Vòng thứ nhất bánh đà thực hiện mất thời gian $0.5$ giây. Kể từ vòng thứ hai trở đi, thời gian thực hiện mỗi vòng quay tăng thêm $0.04$ giây so với vòng quay liền trước đó. Hỏi sau khi thực hiện xong vòng quay thứ $25$, tổng thời gian bánh đà quay từ lúc bắt đầu là bao nhiêu giây?],
    (
        [$22.5$ giây.],
        [$23.8$ giây.],
        True([$24.5$ giây.]),
        [$26.0$ giây.]
    ),
    loigiai: [
        Thời gian quay mỗi vòng lập thành cấp số cộng với $u_1 = 0.5$ (s) và công sai $d = 0.04$ (s).
        Tổng thời gian quay sau 25 vòng là tổng $S_25$:
        $
          S_25 &= 25/2 [2 u_1 + 24 d] \
               &= 12.5 [2 dot 0.5 + 24 dot 0.04] \
               &= 12.5 [1 + 0.96] \
               &= 12.5 dot 1.96 = 24.5 " (giây)"
        $
    ]
)

// TN 8
#tn([Để thử nghiệm quãng đường phanh khẩn cấp của ô tô tự lái ở các dải tốc độ khác nhau. Ở tốc độ $30$ km/h, quãng đường phanh an toàn là $6$ mét. Cứ tăng thêm mỗi $10$ km/h trong dải tốc độ thử nghiệm, quãng đường phanh khẩn cấp lại tăng thêm $2.5$ mét so với mức tốc độ trước đó. Tổng quãng đường phanh tích lũy thử nghiệm đo được ở tất cả $8$ mức tốc độ từ $30$ km/h đến $100$ km/h (mỗi mức cách nhau 10 km/h) bằng bao nhiêu mét?],
    (
        [$110$ m.],
        [$115$ m.],
        True([$118$ m.]),
        [$125$ m.]
    ),
    loigiai: [
        Quãng đường phanh ở các mức tốc độ lập thành cấp số cộng có:
        - Số hạng đầu: $u_1 = 6$ (m).
        - Công sai: $d = 2.5$ (m).
        Số mức tốc độ thử nghiệm là $n = 8$ mức (từ 30 km/h đến 100 km/h).
        Tổng quãng đường phanh tích lũy ở 8 mức này là:
        $
          S_8 &= 8/2 [2 u_1 + 7 d] \
              &= 4 [2 dot 6 + 7 dot 2.5] \
              &= 4 [12 + 17.5] \
              &= 4 dot 29.5 = 118 " (m)"
        $
    ]
)

// TN 9
#tn([Một đường dây tải điện xoay chiều truyền tải năng lượng đi xa đô thị thị. Điện áp ở đầu nguồn cấp điện là $220$ kV. Cứ truyền tải đi xa thêm mỗi km đường dây, do hao tổn trở kháng, điện áp bị sụt giảm đi $1.5\%$ so với điện áp ở km liền trước đó. Hỏi điện áp truyền đến trạm biến áp cuối cách nguồn $15$ km bằng bao nhiêu kV?],
    (
        [$170.5$ kV.],
        True([$175.3$ kV.]),
        [$180.2$ kV.],
        [$185.0$ kV.]
    ),
    loigiai: [
        Điện áp hằng km lập thành cấp số nhân $(U_n)$ với:
        - Số hạng đầu (sau 1 km đầu): $u_1 = 220 dot 0.985$ (kV).
        - Công bội: $q = 1 - 1.5\% = 0.985$.
        Sau 15 km truyền tải (số hạng thứ 15):
        $
          u_15 &= 220 dot (0.985)^15 \
               &approx 220 dot 0.79685 \
               &approx 175.31 " (kV)"
        $
        Làm tròn xấp xỉ bằng $175.3$ kV.
    ]
)

// TN 10
#tn([Một con lắc lò xo tích năng lượng dao động điều hòa được kích thích dao động cơ học. Chu kỳ thứ nhất cơ năng tích lũy đạt $10$ Jun (J). Kể từ chu kỳ thứ hai, do cơ cấu ma sát tự động nạp tích năng lượng phụ trợ, cơ năng tích lũy tăng thêm $8\%$ mỗi chu kỳ so với chu kỳ trước đó. Tổng cơ năng tích lũy được trong hệ sau đúng $8$ chu kỳ dao động đầu tiên (làm tròn đến hàng phần mười J) là bao nhiêu?],
    (
        [$92.5$ J.],
        True([$106.4$ J.]),
        [$110.2$ J.],
        [$115.0$ J.]
    ),
    loigiai: [
        Cơ năng tích lũy hằng chu kỳ lập thành một cấp số nhân có:
        - Số hạng đầu: $u_1 = 10$ (J).
        - Công bội: $q = 1 + 8\% = 1.08$.
        Tổng cơ năng tích lũy sau $n = 8$ chu kỳ là:
        $
          S_8 &= u_1 dot (1 - q^8) / (1 - q) \
              &= 10 dot (1 - (1.08)^8) / (1 - 1.08) \
              &= 10 dot (1 - 1.85093) / (-0.08) \
              &= 10 dot 10.6366 \
              &approx 106.36 " (J)"
        $
        Làm tròn đến hàng phần mười Jun là $106.4$ J.
    ]
)

// TN 11
#tn([Cường độ ánh sáng truyền qua các lớp kính lọc đặc biệt mỏng chống tia cực tím bị suy giảm theo cấp số. Lớp kính thứ nhất làm giảm cường độ sáng còn lại $90\%$ so với ban đầu. Kể từ lớp thứ hai trở đi, cường độ ánh sáng truyền qua giảm đi $10\%$ sau mỗi lớp kính lọc so với cường độ trước khi truyền qua lớp đó. Để cường độ ánh sáng còn lại nhỏ hơn $40\%$ cường độ ban đầu thì cần xếp tối thiểu bao nhiêu lớp kính lọc?],
    (
        [$7$ lớp.],
        [$8$ lớp.],
        True([$9$ lớp.]),
        [$10$ lớp.]
    ),
    loigiai: [
        Cường độ ánh sáng còn lại sau $n$ lớp kính lọc là:
        $ I_n = I_0 dot (0.9)^n $
        Ta cần tìm $n$ nguyên dương tối thiểu sao cho $I_n < 0.4 I_0$:
        $
          (0.9)^n < 0.4 &<=> n > log_0.9 (0.4) \
                        &<=> n > ln(0.4) / ln(0.9) approx -0.91629 / -0.10536 approx 8.69
        $
        Do đó cần tối thiểu 9 lớp kính lọc.
    ]
)

// TN 12
#tn([Động năng của hạt êlectron chuyển động trong một từ trường biến thiên giảm dần. Giây thứ nhất động năng của hạt là $240$ eV. Kể từ giây thứ hai, do bức xạ hãm điện từ trường lượng tổn hao động năng bị giảm đi $15\%$ mỗi giây so với giây trước đó. Tổng động năng hao phí tỏa ra dạng bức xạ cho đến khi hạt êlectron dừng lại hoàn toàn bằng bao nhiêu eV?],
    (
        [$1200$ eV.],
        [$1400$ eV.],
        True([$1600$ eV.]),
        [$1800$ eV.]
    ),
    loigiai: [
        Động năng hao phí hằng giây lập thành cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 240$ (eV).
        - Công bội: $q = 1 - 15\% = 0.85$ (thỏa mãn $|q| < 1$).
        Tổng động năng tỏa ra là:
        $
          S = u_1 / (1 - q) = 240 / (1 - 0.85) = 240 / 0.15 = 1600 " (eV)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một hệ thống lò xo giảm xóc chịu tải cơ học được lắp xếp chồng lên nhau thành một cột giảm xóc đồng trục đứng. Chiều dài lò xo trên cùng là $30$ cm. Từ lò xo thứ hai trở xuống dưới, để tăng cứng chịu tải trọng lớn của móng, mỗi lò xo sau được nén ngắn hơn lò xo liền ngay trên nó là $1.5$ cm. Các phát biểu sau đúng hay sai?], (
        True([Chiều dài các lò xo trong cột giảm xóc lập thành một cấp số cộng với công sai $d = -1.5$ cm.]),
        True([Chiều dài của lò xo thứ $10$ tính từ trên xuống là $16.5$ cm.]),
        True([Tổng chiều dài của cả cột gồm $10$ lò xo khi ghép chồng xếp là $2.325$ mét.]),
        True([Nếu cột lò xo chỉ chịu tải được đến khi lò xo ngắn nhất có chiều dài tối thiểu $12$ cm thì cột lò xo có thể lắp được tối đa là $13$ lò xo xếp chồng.])
    ), 
    loigiai: [
        Chiều dài lò xo thứ $n$ lập thành cấp số cộng với $u_1 = 30$ (cm), $d = -1.5$ (cm).
        - *a)* Đúng.
        - *b)* Đúng. $u_10 = u_1 + 9d = 30 + 9(-1.5) = 30 - 13.5 = 16.5$ cm.
        - *c)* Đúng. Tổng chiều dài 10 lò xo:
          $
            S_10 &= 10/2 (u_1 + u_10) \
                 &= 5 (30 + 16.5) = 5 dot 46.5 = 232.5 " (cm)" = 2.325 " (mét)"
          $
        - *d)* Đúng. Lò xo thứ $n$ có chiều dài tối thiểu $12$ cm:
          $
            u_n >= 12 &<=> 30 + (n-1)(-1.5) >= 12 \
                      &<=> -1.5(n-1) >= -18 \
                      &<=> n - 1 <= 12 <=> n <= 13
          $
          Do đó có thể lắp ghép tối đa 13 lò xo chồng xếp.
    ]
)

// DS 2
#ds([Khảo sát hiện tượng giãn nở nhiệt cơ học của các thanh kim loại ghép nối tiếp nhau dọc hành lang kết cấu nhà xưởng. Ở nhiệt độ phòng $25 degree "C"$, thanh thứ nhất dài $2.0$ mét. Cứ thanh tiếp theo dài hơn thanh liền trước nó là $0.3$ mét. Khi nhiệt độ môi trường tăng lên thêm $1 degree "C"$, mỗi thanh bị giãn nở dài ra thêm một lượng không đổi là $0.15$ mm. Các phát biểu sau đúng hay sai?], (
        True([Độ dài các thanh kim loại ở nhiệt độ phòng lập thành một cấp số cộng với công sai $d = 0.3$ m.]),
        True([Thanh kim loại thứ $12$ ở nhiệt độ phòng dài $5.3$ mét.]),
        [Khi nhiệt độ tăng thêm $10 degree "C"$, tổng độ dài tăng thêm của một chuỗi gồm $8$ thanh ghép nối tiếp bằng $1.2$ mm.],
        True([Biết tổng độ dài chuỗi gồm $10$ thanh kim loại nối tiếp ở nhiệt độ phòng là $33.5$ mét.])
    ), 
    loigiai: [
        Độ dài thanh kim loại thứ $n$ ở nhiệt độ phòng lập thành cấp số cộng với $u_1 = 2.0$ m, $d = 0.3$ m.
        - *a)* Đúng.
        - *b)* Đúng. $u_12 = u_1 + 11d = 2.0 + 11 dot 0.3 = 5.3$ m.
        - *c)* Sai. Khi nhiệt độ tăng $10 degree "C"$, mỗi thanh giãn nở thêm:
          $ 10 dot 0.15 = 1.5 " (mm)" $
          Tổng độ dài tăng thêm của chuỗi 8 thanh là:
          $ Delta L = 8 dot 1.5 = 12 " (mm)" $
          Phát biểu C nói $1.2$ mm là sai.
        - *d)* Đúng. Tổng độ dài chuỗi 10 thanh ở nhiệt độ phòng là:
          $
            S_10 &= 10/2 [2 u_1 + 9 d] \
                 &= 5 [2 dot 2.0 + 9 dot 0.3] \
                 &= 5 [4.0 + 2.7] = 5 dot 6.7 = 33.5 " (mét)"
          $
    ]
)

// DS 3
#ds([Khảo sát quá trình phản xạ khuếch tán ánh sáng qua hệ nhiều tấm gương thủy tinh xếp song song chồng khít. Tia sáng truyền thẳng chiếu qua hệ gương. Biết sau mỗi lần phản xạ gương, cường độ bức xạ còn truyền qua giảm đi $12\%$ so với cường độ trước đó. Các phát biểu sau đúng hay sai?], (
        True([Cường độ bức xạ truyền qua lập thành cấp số nhân với công bội $q = 0.88$.]),
        True([Sau $3$ lần phản xạ gương liên tiếp, cường độ ánh sáng còn lại xấp xỉ $68\%$ cường độ sáng ban đầu.]),
        True([Công thức tính cường độ bức xạ còn lại sau $n$ lần phản xạ gương là $I_n = I_0 dot (0.88)^n$.]),
        True([Để cường độ ánh sáng còn lại nhỏ hơn $10\%$ cường độ ban đầu thì tia sáng cần thực hiện phản xạ tối thiểu $19$ lần gương.])
    ), 
    loigiai: [
        Cường độ ánh sáng còn lại sau $n$ lần phản xạ lập thành cấp số nhân với số hạng đầu $I_0$, công bội $q = 0.88$.
        - *a)* Đúng.
        - *b)* Đúng. $I_3 = I_0 dot (0.88)^3 = 0.681472 I_0 approx 68\% I_0$.
        - *c)* Đúng.
        - *d)* Đúng. Giải $I_n < 0.1 I_0$:
          $
            (0.88)^n < 0.1 &<=> n > log_0.88 (0.1) \
                           &<=> n > ln(0.1) / ln(0.88) approx -2.30258 / -0.12783 approx 18.01
          $
          Nên số nguyên $n$ tối thiểu là 19.
    ]
)

// DS 4
#ds([Khảo sát quá trình phân rã phóng xạ tự nhiên của một mẫu chất phóng xạ Urani đồng vị. Biết cứ sau mỗi chu kỳ bán rã $100$ năm, khối lượng chất phóng xạ còn lại giảm đi một nửa ($50\%$) so với ban đầu. Ban đầu khối lượng mẫu chất phóng xạ là $800$ gam. Các phát biểu sau đúng hay sai?], (
        True([Khối lượng chất phóng xạ còn lại sau các chu kỳ bán rã lập thành một cấp số nhân có công bội $q = 0.5$.]),
        True([Khối lượng Urani còn lại sau $3$ chu kỳ bán rã (300 năm) là $100$ gam.]),
        True([Công thức tính khối lượng chất phóng xạ còn lại sau $t$ năm là $m(t) = 800 dot (0.5)^(t/100)$ (gam).]),
        True([Để khối lượng chất phóng xạ phân rã hết trên $95\%$ lượng ban đầu (tức là còn lại dưới $5\%$) thì cần thời gian tối thiểu là $500$ năm.])
    ), 
    loigiai: [
        Khối lượng phóng xạ sau $n$ chu kỳ bán rã lập thành cấp số nhân với $u_0 = 800, q = 0.5$.
        - *a)* Đúng.
        - *b)* Đúng. $u_3 = 800 dot (0.5)^3 = 100$ gam.
        - *c)* Đúng. Với $t$ năm tương đương $n = t/100$ chu kỳ, công thức tổng quát là $m(t) = 800 dot (0.5)^(t/100)$.
        - *d)* Đúng. Còn lại dưới $5\%$:
          $
            m(t) < 800 dot 0.05 &<=> (0.5)^n < 0.05 \
                                &<=> n > log_0.5 (0.05) \
                                &<=> n > ln(0.05) / ln(0.5) approx -2.9957 / -0.69315 approx 4.32
          $
          Do đó cần tối thiểu 5 chu kỳ bán rã, tương đương với thời gian tối thiểu là $500$ năm.
        
        Biểu đồ phân rã phóng xạ của Urani theo thời gian:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Hệ trục
            line((0,0), (5.5,0), mark: (end: ">"), stroke: 1pt + black)
            line((0,0), (0,3.0), mark: (end: ">"), stroke: 1pt + black)
            content((5.5, -0.25), [t (năm)])
            content((-0.4, 3.0), [m(t)])
            
            // Vẽ các điểm chu kỳ bán rã (y = m/800 * 2.4)
            // 0 năm: 800g (0, 2.4)
            circle((0, 2.4), radius: 0.05, fill: red)
            content((0, 2.4), [800g], anchor: "west")
            
            // 1 chu kỳ (100 năm): 400g (1.2, 1.2)
            circle((1.2, 1.2), radius: 0.05, fill: red)
            content((1.2, 1.2), [400g (100n)], anchor: "west")
            
            // 2 chu kỳ (200 năm): 200g (2.4, 0.6)
            circle((2.4, 0.6), radius: 0.05, fill: red)
            content((2.4, 0.6), [200g (200n)], anchor: "west")
            
            // Vẽ đường cong phân rã bằng line ghép đoạn
            let last-pt = (0.0, 2.4)
            for i in range(1, 25) {
              let t = i * 0.2
              let val = 2.4 * calc.pow(0.5, t)
              let next-pt = (t * 1.2, val)
              line(last-pt, next-pt, stroke: 1.2pt + blue)
              last-pt = next-pt
            }
          })
        ]
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một pittông thủy lực chống rung cơ học chuyển động tịnh tiến dao động tắt dần. Hành trình chuyển động đầu tiên dài $80$ mm. Cứ mỗi hành trình tiếp theo, chiều dài hành trình giảm đi $15\%$ so với hành trình liền trước đó. Hỏi sau tối thiểu bao nhiêu hành trình thì chiều dài hành trình của pittông thủy lực nhỏ hơn $20$ mm?],
    [10],
    loigiai: [
        Chiều dài hành trình hằng chu kỳ lập thành một cấp số nhân có:
        - Số hạng đầu: $u_1 = 80$ (mm).
        - Công bội: $q = 1 - 0.15 = 0.85$.
        Ta tìm số hành trình $n$ tối thiểu sao cho $u_n < 20$:
        $
          80 dot (0.85)^(n-1) < 20 &<=> (0.85)^(n-1) < 0.25 \
                                   &<=> n-1 > log_0.85 (0.25) \
                                   &<=> n-1 > ln(0.25) / ln(0.85) approx -1.38629 / -0.16252 approx 8.53 \
                                   &<=> n > 9.53
        $
        Do $n$ nguyên dương nên số hành trình tối thiểu là 10 hành trình.
    ]
)

// TL 2
#tln([Trong một ống nghiệm khí động học nằm ngang thẳng, người ta lắp đặt các cảm biến áp suất thông minh để thu thập dữ liệu luồng khí thẳng. Cảm biến thứ nhất đặt cách đầu ống là $40$ cm. Cứ mỗi cảm biến tiếp theo cách cảm biến liền trước nó một khoảng cố định là $15$ cm. Biết người ta lắp đặt được cảm biến cuối cùng cách đầu ống là $385$ cm. Hỏi người ta lắp đặt tất cả bao nhiêu cảm biến áp suất dọc theo ống nghiệm đó?],
    [24],
    loigiai: [
        Vị trí các cảm biến so với đầu ống lập thành một cấp số cộng với $u_1 = 40$ (cm) và công sai $d = 15$ (cm).
        Vị trí cảm biến cuối cùng là $u_n = 385$ (cm).
        Ta giải phương trình tìm $n$:
        $
          u_n = u_1 + (n-1)d &<=> 385 = 40 + (n-1)15 \
                             &<=> 345 = 15(n-1) \
                             &<=> n - 1 = 23 <=> n = 24
        $
        Vậy lắp đặt được tất cả 24 cảm biến.
    ]
)

// TL 3
#tln([Độ giảm cường độ chùm tia bức xạ hạt nhân khi truyền qua các lớp chì chắn hạt beta y tế. Biết cứ truyền qua mỗi tấm chì chắn dày $1$ cm, cường độ bức xạ còn lại giảm đi $18\%$ so với trước đó. Hỏi chùm bức xạ truyền qua chiều dày chì chắn tối thiểu bao nhiêu xăng-ti-mét thì cường độ bức xạ còn lại nhỏ hơn $15\%$ cường độ ban đầu?],
    [10],
    loigiai: [
        Cường độ bức xạ còn lại sau $d$ cm chì chắn là:
        $ I(d) = I_0 dot (1 - 0.18)^d = I_0 dot (0.82)^d $
        Ta tìm $d$ nguyên dương tối thiểu sao cho $I(d) < 0.15 I_0$:
        $
          (0.82)^d < 0.15 &<=> d > log_0.82 (0.15) \
                          &<=> d > ln(0.15) / ln(0.82) approx -1.89712 / -0.19845 approx 9.56
        $
        Do đó chiều dày chì chắn tối thiểu phải là $10$ cm.
    ]
)

// TL 4
#tln([Một con lắc vật lý dao động tắt dần quanh trục nằm ngang cố định. Hành trình đi từ biên này sang biên kia lần thứ nhất dài $25$ cm. Do ma sát cơ học trục quay quay, mỗi hành trình tiếp theo độ dài quãng đường đi được giảm đi $8\%$ so với hành trình liền trước đó. Tính tổng quãng đường chuyển động của con lắc vật lý cho đến khi nó dừng lại hẳn (làm tròn đến hàng đơn vị cm).],
    [313],
    loigiai: [
        Độ dài hành trình hằng chu kỳ lập thành một cấp số nhân lùi vô hạn với $u_1 = 25$ (cm) và công bội $q = 1 - 0.8 = 0.92$ (thỏa mãn $|q| < 1$).
        Tổng quãng đường con lắc vật lý đi được cho đến khi dừng lại hẳn là:
        $
          S = u_1 / (1 - q) = 25 / (1 - 0.92) = 25 / 0.08 = 312.5 " (cm)"
        $
        Làm tròn đến hàng đơn vị là $313$ cm.
        
        Sơ đồ minh họa con lắc dao động tắt dần quanh trục quay:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Trục chính
            line((0, 2.5), (0, 0), stroke: 1pt + gray)
            circle((0, 2.5), radius: 0.06, fill: black)
            
            // Cung dao động thứ nhất
            arc((rel: (-45deg, 2.2), to: (0, 2.5)), start: -45deg, stop: 35deg, radius: 2.2, stroke: 1.2pt + blue)
            
            // Cung dao động thứ hai
            arc((rel: (35deg, 2.0), to: (0, 2.5)), start: 35deg, stop: -28deg, radius: 2.0, stroke: (paint: blue, dash: "dashed"))
            
            // Cung thứ ba
            arc((rel: (-28deg, 1.8), to: (0, 2.5)), start: -28deg, stop: 22deg, radius: 1.8, stroke: (paint: blue, dash: "dotted"))
            
            content((0, -0.4), [Biên độ giảm dần do ma sát])
          })
        ]
    ]
)

// TL 5
#tln([Một tua-bin gió phát điện được nâng cao thêm độ cao lắp đặt để thu nhận luồng gió ổn định. Công suất điện năng phát ra ở độ cao mốc ban đầu là $1.5$ MW. Cứ lên cao thêm mỗi $50$ mét lắp đặt, công suất phát điện thu hoạch tăng thêm $5\%$ so với công suất ở độ cao mốc trước đó. Hỏi ở độ cao thiết kế lớn hơn mốc ban đầu là $300$ mét, công suất tua-bin gió phát điện đạt được bằng bao nhiêu MW? (Làm tròn đến hàng phần trăm)],
    [2.01],
    loigiai: [
        Số lần nâng độ cao tua-bin là:
        $ N = 300 / 50 = 6 " (lần)" $
        Công suất phát điện tăng theo cấp số nhân có:
        - Số hạng đầu: $u_0 = 1.5$ (MW).
        - Công bội: $q = 1 + 5\% = 1.05$.
        Công suất phát ra ở độ cao tăng thêm 300m là:
        $
          u_6 &= u_0 dot q^6 \
              &= 1.5 dot (1.05)^6 \
              &approx 1.5 dot 1.340096 \
              &approx 2.01014 " (MW)"
        $
        Làm tròn đến hàng phần trăm là $2.01$ MW.
    ]
)

// TL 6
#tln([Để tối ưu hóa chu kỳ cộng hưởng cơ học của một động cơ xoay công nghiệp chịu tải biến đổi. Ở chu kỳ dao động thứ nhất, thiết bị đo được thời gian phản hồi hệ thống cộng hưởng là $420$ ms. Kể từ chu kỳ thứ hai trở đi, nhờ thuật toán điều khiển PID tự động điều chỉnh cơ cấu hãm điện lực, thời gian phản hồi này giảm đi một lượng không đổi là $18$ ms mỗi chu kỳ. Hỏi tổng thời gian phản hồi tích lũy của động cơ sau $15$ chu kỳ hoạt động đầu tiên bằng bao nhiêu ms?],
    [4410],
    loigiai: [
        Thời gian phản hồi hằng chu kỳ lập thành một cấp số cộng với $u_1 = 420$ ms, công sai $d = -18$ ms.
        Tổng thời gian phản hồi tích lũy sau $n = 15$ chu kỳ đầu tiên là tổng $S_15$:
        $
          S_15 &= 15/2 [2 u_1 + 14 d] \
               &= 7.5 [2 dot 420 + 14 dot (-18)] \
               &= 7.5 [840 - 252] \
               &= 7.5 dot 588 = 4410 " (ms)"
        $
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
