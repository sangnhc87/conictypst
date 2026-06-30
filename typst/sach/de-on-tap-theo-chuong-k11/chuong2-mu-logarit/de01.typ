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
#show math.equation.where(block: true): it => math.display(it.body)

#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

#show: thpt-school-exam.with(
  department: "TOÁN LỚP 11",
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 01)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Với $a > 0, a eq 1$ và $x, y > 0$, khẳng định nào sau đây là sai?],
    (
        [$log_a (x y) = log_a x + log_a y$],
        [$log_a (x/y) = log_a x - log_a y$],
        True([$log_a (x + y) = log_a x dot log_a y$]),
        [$log_a (x^alpha) = alpha log_a x$]
    ),
    loigiai: [
        Khẳng định sai là $log_a (x + y) = log_a x dot log_a y$. Công thức logarit không có quy tắc biến đổi tổng thành tích của logarit như vậy.
    ]
)

// TN 2
#tn([Tập xác định của hàm số $y = (x - 2)^(-3)$ là],
    (
        [$(2; +oo)$],
        True([$RR \\ {2}$]),
        [$RR$],
        [$(0; +oo)$]
    ),
    loigiai: [
        Hàm số lũy thừa $y = x^alpha$ với số mũ $alpha$ nguyên âm (ở đây $alpha = -3$) có tập xác định là tập các giá trị của $x$ sao cho cơ số khác $0$.
        Do đó:
        $
          x - 2 eq 0 <=> x eq 2
        $
        Tập xác định $D = RR \\ {2}$.
    ]
)

// TN 3
#tn([Một vi khuẩn E.coli có thời gian phân đôi là 20 phút. Giả sử ban đầu có $10^3$ vi khuẩn. Sau 2 giờ, số lượng vi khuẩn trong quần thể xấp xỉ bao nhiêu? (Giả sử các vi khuẩn phát triển bình thường).],
    (
        [$1.2 dot 10^4$],
        True([$6.4 dot 10^4$]),
        [$3.2 dot 10^4$],
        [$1.28 dot 10^5$]
    ),
    loigiai: [
        Thời gian sinh trưởng là $t = 2$ giờ $= 120$ phút.
        Số lần phân đôi là $n = 120 / 20 = 6$ lần.
        Số lượng vi khuẩn sau 2 giờ là:
        $
          N = 10^3 dot 2^6 = 10^3 dot 64 = 6.4 dot 10^4
        $
    ]
)

// TN 4
#tn([Độ pH của một dung dịch được tính bằng công thức $"pH" = -log[H^+]$, trong đó $[H^+]$ là nồng độ ion hydrogen (mol/L). Một loại nước ép táo có nồng độ $[H^+] = 3.16 dot 10^(-4)$ mol/L. Độ pH của nước ép táo này xấp xỉ bằng bao nhiêu?],
    (
        [$4.0$],
        [$3.0$],
        True([$3.5$]),
        [$4.5$]
    ),
    loigiai: [
        Độ pH của dung dịch được tính bằng:
        $
          "pH" = -log(3.16 dot 10^(-4)) = -(log(3.16) + log(10^(-4))) = -(0.5 - 4) = 3.5
        $
        Vậy độ pH xấp xỉ bằng $3.5$.
    ]
)

// TN 5
#tn([Hàm số nào sau đây nghịch biến trên toàn bộ tập xác định của nó?],
    (
        [$y = 2^x$],
        [$y = e^x$],
        True([$y = (1/3)^x$]),
        [$y = log_3 x$]
    ),
    loigiai: [
        Hàm số mũ $y = a^x$ nghịch biến trên $RR$ khi và chỉ khi $0 < a < 1$. 
        Trong các phương án, chỉ có $y = (1/3)^x$ có cơ số $a = 1/3 in (0; 1)$ nên nó nghịch biến.
    ]
)

// TN 6
#tn([Phương trình $3^(2x-1) = 27$ có nghiệm là],
    (
        [$x = 1$],
        True([$x = 2$]),
        [$x = 3$],
        [$x = 4$]
    ),
    loigiai: [
        Ta có:
        $
          3^(2x-1) = 27 <=> 3^(2x-1) = 3^3 <=> 2x - 1 = 3 <=> 2x = 4 <=> x = 2
        $
    ]
)

// TN 7
#tn([Trong ngành địa chấn học, độ lớn $M$ (độ Richter) của một trận động đất được xác định bằng công thức $M = log(A / A_0)$, trong đó $A$ là biên độ tối đa của sóng địa chấn và $A_0$ là một biên độ chuẩn. Một trận động đất $6$ độ Richter có biên độ tối đa gấp bao nhiêu lần trận động đất $4$ độ Richter?],
    (
        [$1.5$ lần],
        [$20$ lần],
        True([$100$ lần]),
        [$1000$ lần]
    ),
    loigiai: [
        Gọi $A_1$ và $A_2$ lần lượt là biên độ của trận động đất 6 độ và 4 độ Richter.
        Ta có:
        $
          M_1 = log(A_1 / A_0) = 6 <=> A_1 / A_0 = 10^6 <=> A_1 = 10^6 A_0
        $
        $
          M_2 = log(A_2 / A_0) = 4 <=> A_2 / A_0 = 10^4 <=> A_2 = 10^4 A_0
        $
        Tỉ số biên độ:
        $
          A_1 / A_2 = (10^6 A_0)/(10^4 A_0) = 10^2 = 100 " (lần)"
        $
    ]
)

// TN 8
#tn([Anh Minh gửi tiết kiệm ngân hàng $100$ triệu đồng theo thể thức lãi kép với kỳ hạn một năm, lãi suất $6%$/năm. Hỏi sau ít nhất bao nhiêu năm thì anh Minh nhận được số tiền (cả vốn lẫn lãi) lớn hơn $150$ triệu đồng?],
    (
        [$6$ năm],
        True([$7$ năm]),
        [$8$ năm],
        [$9$ năm]
    ),
    loigiai: [
        Số tiền sau $n$ năm anh Minh nhận được là $T = 100(1 + 0.06)^n = 100(1.06)^n$ (triệu đồng).
        Theo bài ra, ta cần:
        $
          100(1.06)^n > 150 <=> (1.06)^n > 1.5 <=> n > log_1.06 (1.5) approx 6.958
        $
        Vì $n$ là số nguyên năm, nên anh Minh phải gửi ít nhất $n = 7$ năm.
    ]
)

// TN 9
#tn([Tập nghiệm của bất phương trình $log_2 (x - 1) < 3$ là],
    (
        [$(1; 8)$],
        True([$(1; 9)$]),
        [$(-oo; 9)$],
        [$(9; +oo)$]
    ),
    loigiai: [
        Điều kiện xác định: $x - 1 > 0 <=> x > 1$.
        Bất phương trình đã cho tương đương với:
        $
          x - 1 < 2^3 <=> x - 1 < 8 <=> x < 9
        $
        Kết hợp điều kiện, ta được tập nghiệm là $S = (1; 9)$.
    ]
)

// TN 10
#tn([Định luật làm nguội của Newton mô tả nhiệt độ $T$ của một vật sau thời gian $t$ (phút) được làm mát trong môi trường có nhiệt độ $T_s$ bằng công thức $T = T_s + (T_0 - T_s) e^(-k t)$, với $T_0$ là nhiệt độ ban đầu, $k$ là hằng số làm mát. Nếu một cốc cafe từ $90^circ C$ giảm xuống $70^circ C$ trong 10 phút ở phòng có nhiệt độ $20^circ C$, hằng số $k$ xấp xỉ bằng bao nhiêu?],
    (
        [$0.012$],
        True([$0.034$]),
        [$0.052$],
        [$0.075$]
    ),
    loigiai: [
        Ta có $T_0 = 90$, $T_s = 20$.
        Sau $t = 10$ phút, $T = 70$. Thay vào công thức:
        $
          70 = 20 + (90 - 20) e^(-10k) <=> 50 = 70 e^(-10k) <=> e^(-10k) = 5/7
        $
        $
          <=> -10k = ln(5/7) <=> k = -1/10 ln(5/7) approx 0.0336 approx 0.034
        $
    ]
)

// TN 11
#tn([Cho biểu thức $P = x^(1/3) dot root(6, x)$ với $x > 0$. Viết biểu thức $P$ dưới dạng lũy thừa của $x$ với số mũ hữu tỉ, ta được],
    (
        True([$P = x^(1/2)$]),
        [$P = x^(2/9)$],
        [$P = x^(1/18)$],
        [$P = x^(5/6)$]
    ),
    loigiai: [
        Ta có $root(6, x) = x^(1/6)$.
        Do đó:
        $
          P = x^(1/3) dot x^(1/6) = x^(1/3 + 1/6) = x^(3/6) = x^(1/2)
        $
    ]
)

// TN 12
#tn([Mức cường độ âm $L$ (đơn vị dB) được tính bởi công thức $L = 10 log(I / I_0)$, trong đó $I$ là cường độ âm và $I_0 = 10^(-12) "W/m"^2$ là cường độ âm chuẩn. Tiếng ồn của luồng giao thông mạnh có mức cường độ âm khoảng $85$ dB. Cường độ âm $I$ của luồng giao thông đó là],
    (
        [$3.16 dot 10^(-5) " W/m"^2$],
        True([$3.16 dot 10^(-4) " W/m"^2$]),
        [$3.16 dot 10^(-3) " W/m"^2$],
        [$3.16 dot 10^(-2) " W/m"^2$]
    ),
    loigiai: [
        Ta có phương trình:
        $
          85 = 10 log(I / 10^(-12)) <=> log(I / 10^(-12)) = 8.5 <=> I / 10^(-12) = 10^(8.5)
        $
        $
          <=> I = 10^(8.5) dot 10^(-12) = 10^(-3.5) = 1 / 10^(3.5) = 1 / (1000sqrt(10)) approx 3.16 dot 10^(-4) " (W/m"^2")"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds(
    [Cho các số thực dương $a, b$ với $a eq 1$ và biểu thức $P = log_a (a^3 b^2)$. Xét tính đúng sai của các phát biểu sau:], (
        True([Nếu $b = 1$ thì $P = 3$.]),
        [Nếu $b = a^2$ thì $P = 7$.],
        True([Với mọi giá trị dương của $b$, $P = 3 + 2 log_a b$.]),
        [Nếu $a = 10, b = 100$ thì $P = 5$.]
    ), 
    loigiai: [
        Ta rút gọn biểu thức $P$:
        $
          P = log_a (a^3 b^2) = log_a (a^3) + log_a (b^2) = 3 + 2 log_a b
        $
        - *a)* Đúng. Thay $b = 1 => P = 3 + 2 log_a 1 = 3 + 0 = 3$.
        - *b)* Đúng. Thay $b = a^2 => P = 3 + 2 log_a (a^2) = 3 + 2 dot 2 = 7$.
        - *c)* Đúng. Rút gọn theo quy tắc logarit của một tích.
        - *d)* Sai. Thay $a = 10, b = 100$:
        $
          P = 3 + 2 log_10 (100) = 3 + 2 dot 2 = 7 eq 5
        $
    ]
)

// DS 2
#ds(
    [Biết sự thay đổi giá trị của một chiếc ô tô theo thời gian (năm) được mô phỏng bởi hàm số $V(t) = 800 dot (0.85)^t$ (triệu đồng). Các phát biểu sau đúng hay sai?], (
        True([Giá trị ban đầu của chiếc xe khi mới mua là $800$ triệu đồng.]),
        True([Mỗi năm chiếc xe mất giá $15%$ so với năm trước đó.]),
        [Sau 3 năm, giá trị của chiếc xe còn lại dưới một nửa giá trị ban đầu.],
        True([Để giá trị chiếc xe giảm xuống còn $200$ triệu đồng thì cần thời gian khoảng $8.5$ năm.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại thời điểm mua, $t = 0$: $V(0) = 800 dot (0.85)^0 = 800$ (triệu đồng).
        - *b)* Đúng. Hệ số cơ số $0.85 = 1 - 0.15$, tức là mỗi năm xe giữ lại $85%$ giá trị, tương đương mức khấu hao (mất giá) là $15%$/năm.
        - *c)* Sai. Sau 3 năm, giá trị xe là:
        $
          V(3) = 800 dot (0.85)^3 = 800 dot 0.614125 = 491.3 " (triệu đồng)"
        $
        Giá trị này vẫn lớn hơn một nửa giá ban đầu ($400$ triệu đồng).
        - *d)* Đúng. Giải phương trình $V(t) = 200$:
        $
          800 dot (0.85)^t = 200 <=> (0.85)^t = 0.25 <=> t = log_0.85 (0.25) approx 8.53 " (năm)"
        $
        Thời gian cần khoảng $8.5$ năm.
    ]
)

// DS 3
#ds(
    [Carbon-14 là đồng vị phóng xạ có chu kì bán rã là $5730$ năm. Khối lượng còn lại của nó được tính theo công thức $m(t) = m_0 e^(-lambda t)$, trong đó $lambda = (ln 2) / 5730$. Một mảnh xương hóa thạch chứa lượng Carbon-14 chỉ còn bằng $30%$ so với lúc sinh vật còn sống. Các phát biểu sau đúng hay sai?], (
        [Đại lượng $lambda$ là một số dương phụ thuộc vào khối lượng ban đầu $m_0$.],
        True([Hàm số $m(t)$ là một hàm số mũ nghịch biến theo thời gian $t$.]),
        True([Tuổi của mảnh xương hóa thạch này được tính bởi $t = -5730 / (ln 2) dot ln(0.3)$.]),
        True([Mảnh xương hóa thạch này có tuổi thọ khoảng $10000$ năm.])
    ), 
    loigiai: [
        - *a)* Sai. Đại lượng $lambda = (ln 2) / 5730$ là hằng số phân rã, nó chỉ phụ thuộc vào bản chất của đồng vị phóng xạ (ở đây là Carbon-14), hoàn toàn không phụ thuộc vào khối lượng ban đầu $m_0$.
        - *b)* Đúng. Hàm số $m(t) = m_0 (e^(-lambda))^t = m_0 a^t$ với cơ số $a = e^(-lambda) < 1$. Do đó hàm số luôn nghịch biến (khối lượng chất phóng xạ giảm dần theo thời gian).
        - *c)* Đúng. Lượng Carbon-14 còn lại là $m(t) = 0.3 m_0$. Ta có:
        $
          0.3 m_0 = m_0 e^(-lambda t) <=> e^(-lambda t) = 0.3 <=> -lambda t = ln 0.3 <=> t = -(ln 0.3)/lambda
        $
        Thay $lambda = (ln 2) / 5730$ ta được $t = (-5730) / (ln 2) dot ln(0.3)$.
        - *d)* Đúng. Bấm máy tính tính giá trị $t$:
        $
          t = (-5730) / (ln 2) dot ln(0.3) approx 9952.8 " (năm)"
        $
        Tuổi thọ làm tròn khoảng $10000$ năm là một ước lượng hợp lý trong khảo cổ.
    ]
)

// DS 4
#ds(
    [Đồ thị hai hàm số $y = a^x$ và $y = log_b x$ được biểu diễn trên cùng một hệ trục tọa độ và cùng đi qua điểm $A(2; 4)$. Các phát biểu sau đúng hay sai?], (
        True([Cơ số $a = 2$.]),
        [Cơ số $b = sqrt(2)$.],
        True([Đồ thị hàm số $y = a^x$ luôn nằm phía trên trục hoành.]),
        [Hàm số $y = log_b x$ nghịch biến trên khoảng $(0; +oo)$.]
    ), 
    loigiai: [
        Hai đồ thị cùng đi qua $A(2; 4)$, tức là:
        $
          cases(
            a^2 = 4,
            log_b 2 = 4
          )
        $
        - *a)* Đúng. Vì $a > 0$ nên $a^2 = 4 => a = 2$.
        - *b)* Sai. $log_b 2 = 4 <=> b^4 = 2 <=> b = root(4, 2) eq sqrt(2)$.
        - *c)* Đúng. Đồ thị hàm số mũ $y = a^x$ có tập giá trị là $(0; +oo)$, do đó luôn nằm phía trên trục hoành.
        - *d)* Sai. Vì $b = root(4, 2) > 1$, hàm số $y = log_b x$ đồng biến trên khoảng $(0; +oo)$, không phải nghịch biến.
    ]
)
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TL 1
#tln(
    [Giải phương trình $log_2 (x - 3) + log_2 (x - 1) = 3$. Tập nghiệm của phương trình có phần tử lớn nhất bằng bao nhiêu?],
    [5],
    loigiai: [
        Điều kiện xác định:
        $
          cases(
            x - 3 > 0,
            x - 1 > 0
          ) <=> x > 3
        $
        Phương trình tương đương:
        $
          log_2 ((x-3)(x-1)) = 3 <=> (x-3)(x-1) = 2^3 = 8
        $
        $
          <=> x^2 - 4x + 3 - 8 = 0 <=> x^2 - 4x - 5 = 0
        $
        $
          <=> cases(
            x = -1 " (loại)",
            x = 5 " (thỏa mãn)"
          )
        $
        Vậy nghiệm duy nhất và cũng là nghiệm lớn nhất của phương trình là $x = 5$.
    ]
)

// TL 2
#tln(
    [Một nhóm nghiên cứu y tế đang theo dõi sự lan truyền của một biến chủng virus trong cộng đồng. Số lượng người nhiễm $N(t)$ sau $t$ tuần được mô hình hóa bởi $N(t) = N_0 dot e^(0.45 t)$, trong đó $N_0$ là số người nhiễm ban đầu. Nếu lúc đầu có $20$ người nhiễm bệnh, hỏi sau bao nhiêu tuần thì số người nhiễm đạt tới $1000$ người? (Làm tròn kết quả đến 1 chữ số thập phân).],
    [8.7],
    loigiai: [
        Ta có phương trình:
        $
          20 e^(0.45 t) = 1000 <=> e^(0.45 t) = 1000 / 20 = 50
        $
        $
          <=> 0.45 t = ln 50 <=> t = (ln 50) / 0.45 approx 8.693
        $
        Làm tròn đến 1 chữ số thập phân, ta được $t approx 8.7$ tuần.
    ]
)

// TL 3
#tln(
    [Biết rằng $log_2 3 = a$ và $log_2 5 = b$. Khi đó giá trị của $log_12 90$ được biểu diễn dưới dạng $M / N$, trong đó $M, N$ là các biểu thức chứa $a$ và $b$. Giá trị của $log_12 90$ khi thay $a = 1.58, b = 2.32$ xấp xỉ bằng bao nhiêu? (Làm tròn đến 2 chữ số thập phân).],
    [1.81],
    loigiai: [
        Sử dụng công thức đổi cơ số về cơ số $2$:
        $
          log_12 90 = (log_2 90) / (log_2 12) = (log_2 (2 dot 3^2 dot 5)) / (log_2 (2^2 dot 3))
        $
        $
          = (log_2 2 + 2 log_2 3 + log_2 5) / (2 log_2 2 + log_2 3) = (1 + 2a + b) / (2 + a)
        $
        Thay $a = 1.58, b = 2.32$:
        $
          log_12 90 = (1 + 2(1.58) + 2.32) / (2 + 1.58) = (1 + 3.16 + 2.32) / 3.58 = 6.48 / 3.58 approx 1.81
        $
    ]
)

// TL 4
#tln(
    [Ánh sáng khi truyền qua môi trường nước biển bị hấp thụ một phần và cường độ ánh sáng $I$ giảm theo độ sâu $d$ (mét) tuân theo định luật Beer-Lambert: $I(d) = I_0 e^(-k d)$. Trong đó $I_0$ là cường độ ánh sáng tại mặt nước, $k$ là hệ số hấp thụ. Biết rằng ở một vùng biển, hệ số hấp thụ $k = 0.15$ /m. Hỏi ở độ sâu bao nhiêu mét thì cường độ ánh sáng chỉ còn lại $10%$ so với mặt nước? (Làm tròn đến hàng đơn vị).],
    [15],
    loigiai: [
        Ta có $I(d) = 0.1 I_0$. Suy ra:
        $
          0.1 I_0 = I_0 e^(-0.15 d) <=> e^(-0.15 d) = 0.1
        $
        $
          <=> -0.15 d = ln 0.1 <=> d = (ln 0.1) / (-0.15)
        $
        Bấm máy tính: $d = (-2.3025) / (-0.15) approx 15.35$ (m).
        Làm tròn đến hàng đơn vị, ta được $15$ m.
    ]
)

// TL 5
#tln(
    [Một loài thực vật được di thực đến một khu bảo tồn thiên nhiên. Tốc độ sinh sản của loài này phụ thuộc vào diện tích đất trống và được mô hình hóa bởi hàm logistic: $P(t) = 5000 / (1 + 49 e^(-0.2 t))$, với $t$ tính bằng năm và $P(t)$ là số lượng cá thể. Số lượng cá thể ban đầu khi mới được đưa vào khu bảo tồn ($t = 0$) là bao nhiêu?],
    [100],
    loigiai: [
        Thay $t = 0$ vào phương trình hàm số $P(t)$:
        $
          P(0) = 5000 / (1 + 49 e^0) = 5000 / (1 + 49 dot 1) = 5000 / 50 = 100 " (cá thể)"
        $
        Vậy số lượng cá thể ban đầu là $100$.
    ]
)

// TL 6
#tln(
    [Biết $x_1, x_2$ là hai nghiệm của phương trình $9^x - 12 dot 3^x + 27 = 0$. Tính tổng $x_1 + x_2$.],
    [3],
    loigiai: [
        Đặt $t = 3^x$, điều kiện $t > 0$. Phương trình trở thành:
        $
          t^2 - 12t + 27 = 0 <=> cases(
            t = 3,
            t = 9
          ) " (thỏa mãn)"
        $
        Với $t = 3 <=> 3^x = 3 <=> x = 1$.
        Với $t = 9 <=> 3^x = 3^2 <=> x = 2$.
        Hai nghiệm của phương trình là $x_1 = 1, x_2 = 2$.
        Vậy tổng $x_1 + x_2 = 1 + 2 = 3$.
        *(Cách khác: Theo Vi-ét $t_1 t_2 = 27 <=> 3^(x_1) dot 3^(x_2) = 27 <=> 3^(x_1 + x_2) = 3^3 <=> x_1 + x_2 = 3$)*.
    ]
)
] // end of make-questions

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
