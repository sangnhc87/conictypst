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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 08 - TỔNG HỢP TOÁN THỰC TẾ)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Phương trình Tsiolkovsky dùng để tính toán vận tốc của một tên lửa trong không gian: $Delta v = v_e ln(m_0 / m_f)$, trong đó $Delta v$ là sự gia tăng vận tốc, $v_e$ là vận tốc phụt của khí thải, $m_0$ là khối lượng tên lửa lúc bắt đầu (bao gồm nhiên liệu) và $m_f$ là khối lượng tên lửa sau khi dùng hết nhiên liệu. Nếu $v_e = 3.0$ km/s và tên lửa cần đạt $Delta v = 6.9$ km/s, thì tỉ số khối lượng nhiên liệu trên tổng khối lượng ban đầu xấp xỉ bằng bao nhiêu?],
    (
        [$70\%$.],
        [$80\%$.],
        True([$90\%$.]),
        [$95\%$.]
    ),
    loigiai: [
        Ta có phương trình:
        $
          6.9 = 3.0 ln(m_0 / m_f) <=> ln(m_0 / m_f) = 6.9 / 3.0 = 2.3
        $
        Suy ra:
        $
          m_0 / m_f = e^2.3 approx 9.974 <=> m_f / m_0 = 1 / 9.974 approx 0.10026
        $
        Tỉ lệ khối lượng nhiên liệu so với khối lượng ban đầu là:
        $
          (m_0 - m_f) / m_0 = 1 - m_f / m_0 = 1 - 0.10026 = 0.89974 approx 90\%
        $
    ]
)

// TN 2
#tn([Theo độ sâu dưới mặt nước đại dương, lượng ánh sáng xuyên qua giảm dần theo mô hình $I(d) = I_0 e^(-k d)$, trong đó $d$ là độ sâu (mét), $I_0$ là cường độ sáng trên mặt nước và $k$ là hệ số hấp thụ. Giả sử tại vùng biển A có $k = 0.05$. Độ sâu mà tại đó lượng ánh sáng chỉ còn $1\%$ so với bề mặt xấp xỉ bằng],
    (
        [$46$ mét.],
        [$72$ mét.],
        True([$92$ mét.]),
        [$115$ mét.]
    ),
    loigiai: [
        Ta có:
        $
          I(d) = 0.01 I_0 <=> I_0 e^(-0.05 d) = 0.01 I_0 <=> e^(-0.05 d) = 0.01
        $
        $
          <=> -0.05 d = ln(0.01) <=> d = (ln(0.01)) / (-0.05) approx (-4.605) / (-0.05) = 92.1 " (mét)"
        $
        Vậy độ sâu cần tìm là khoảng $92$ mét.
    ]
)

// TN 3
#tn([Dân số của một quốc gia có tốc độ tăng dân số hàng năm không đổi. Năm 2010 dân số là $80$ triệu người. Năm 2020 dân số đạt $92$ triệu người. Ước tính dân số năm 2030 (với cùng tốc độ tăng) sẽ là bao nhiêu?],
    (
        [$100$ triệu người.],
        [$104$ triệu người.],
        True([$105.8$ triệu người.]),
        [$110.2$ triệu người.]
    ),
    loigiai: [
        Chu kì 10 năm. Gọi hệ số tăng sau 10 năm là $k$.
        $
          P(10) = P_0 dot k <=> 92 = 80 k <=> k = 92/80 = 1.15
        $
        Dân số năm 2030 (sau 2 chu kì 10 năm) là:
        $
          P(20) = P_0 dot k^2 = 80 dot (1.15)^2 = 80 dot 1.3225 = 105.8 " (triệu người)"
        $
    ]
)

// TN 4
#tn([Cường độ một trận động đất đo theo thang Richter được tính bởi $M = log(E) - 4.4$, trong đó $E$ là năng lượng giải phóng đo bằng Jun (J). Nếu một trận động đất giải phóng năng lượng $10^12$ J thì độ Richter của trận động đất đó là],
    (
        [$6.6$ độ.],
        [$7.2$ độ.],
        True([$7.6$ độ.]),
        [$8.0$ độ.]
    ),
    loigiai: [
        Thay $E = 10^12$ vào công thức:
        $
          M = log(10^12) - 4.4 = 12 - 4.4 = 7.6 " (độ Richter)"
        $
    ]
)

// TN 5
#tn([Một học sinh nướng bánh trong lò ở nhiệt độ $200^circ "C"$. Khi lấy bánh ra, bánh nguội đi trong không khí ở nhiệt độ $25^circ "C"$. Hàm nhiệt độ của bánh sau $t$ phút là $T(t) = 25 + 175 e^(-0.04 t)$ ($""^circ "C"$). Sau khoảng bao nhiêu phút thì chiếc bánh đạt nhiệt độ $40^circ "C"$ để ăn không bị bỏng?],
    (
        [$30$ phút.],
        [$45$ phút.],
        True([$61$ phút.]),
        [$75$ phút.]
    ),
    loigiai: [
        Giải phương trình:
        $
          25 + 175 e^(-0.04 t) = 40 <=> 175 e^(-0.04 t) = 15 <=> e^(-0.04 t) = 15/175 = 3/35
        $
        $
          <=> -0.04 t = ln(3/35) <=> t = (ln(3/35)) / (-0.04) approx 61.46 " (phút)"
        $
        Vậy cần khoảng $61$ phút.
    ]
)

// TN 6
#tn([Một giọt nước mắt có độ pH khoảng $7.4$. Một loại nước giải khát có tính axit với độ pH bằng $3.4$. Tỉ lệ nồng độ ion Hydrogen $[H^+]$ trong nước giải khát đó cao gấp bao nhiêu lần so với trong nước mắt?],
    (
        [$4$ lần.],
        [$40$ lần.],
        [$4000$ lần.],
        True([$10000$ lần.])
    ),
    loigiai: [
        Ta có $"pH" = -log[H^+] => [H^+] = 10^(-"pH")$.
        Nồng độ ion trong nước giải khát: $C_1 = 10^(-3.4)$.
        Nồng độ ion trong nước mắt: $C_2 = 10^(-7.4)$.
        Tỉ lệ:
        $
          C_1 / C_2 = 10^(-3.4) / 10^(-7.4) = 10^(-3.4 + 7.4) = 10^4 = 10000 " (lần)"
        $
    ]
)

// TN 7
#tn([Một bình chứa đầy $10$ lít không khí sạch. Người ta bơm một loại khí độc vào bình với tốc độ $2$ lít/phút và hỗn hợp khí trong bình liên tục được thoát ra ngoài với cùng tốc độ. Nồng độ $C$ (tính bằng phần trăm thể tích) của khí độc trong bình sau $t$ phút là $C(t) = 100(1 - e^(-0.2 t))$. Sau bao lâu thì nồng độ khí độc trong bình đạt $50\%$?],
    (
        [$2.5$ phút.],
        True([$3.5$ phút.]),
        [$5.0$ phút.],
        [$6.9$ phút.]
    ),
    loigiai: [
        Cần giải $C(t) = 50$:
        $
          100(1 - e^(-0.2 t)) = 50 <=> 1 - e^(-0.2 t) = 0.5 <=> e^(-0.2 t) = 0.5
        $
        $
          <=> -0.2 t = ln 0.5 = -ln 2 <=> t = (ln 2) / 0.2 approx 3.465 " (phút)"
        $
        Làm tròn được $3.5$ phút.
    ]
)

// TN 8
#tn([Một máy kéo nông nghiệp mua mới có giá $800$ triệu đồng. Do hao mòn, mỗi năm máy kéo giảm giá trị $15\%$. Để giá trị thanh lý của máy còn $200$ triệu đồng, người nông dân cần sử dụng máy đó trong bao lâu?],
    (
        [$6.5$ năm.],
        True([$8.5$ năm.]),
        [$10.2$ năm.],
        [$12.5$ năm.]
    ),
    loigiai: [
        Công thức khấu hao: $V(t) = 800(1 - 0.15)^t = 800(0.85)^t$.
        Ta giải phương trình:
        $
          800(0.85)^t = 200 <=> (0.85)^t = 200/800 = 0.25
        $
        $
          <=> t = log_0.85 (0.25) = (ln 0.25) / (ln 0.85) approx 8.53 " (năm)"
        $
    ]
)

// TN 9
#tn([Khảo sát đo tuổi của một mẫu than gỗ cổ bằng phương pháp đồng vị Carbon-14 ($C_14$). Chu kì bán rã của $C_14$ là $5730$ năm. Hàm lượng $C_14$ đo được trong mẫu than chỉ còn bằng $30\%$ lượng $C_14$ ở thực vật đang sống. Tuổi của mẫu than cổ xấp xỉ bằng bao nhiêu năm?],
    (
        [$7800$ năm.],
        True([$9950$ năm.]),
        [$11000$ năm.],
        [$12500$ năm.]
    ),
    loigiai: [
        Công thức suy rã phân rã: $m(t) = m_0 (1/2)^(t/T)$.
        Với lượng còn lại là $30\% m_0$:
        $
          (1/2)^(t/5730) = 0.3 <=> t/5730 = log_(0.5) (0.3)
        $
        $
          <=> t = 5730 dot (ln 0.3) / (ln 0.5) approx 5730 dot 1.737 = 9952.8 " (năm)"
        $
        Làm tròn, tuổi của mẫu than khoảng $9950$ năm.
    ]
)

// TN 10
#tn([Áp suất không khí $P(h)$ (mmHg) ở độ cao $h$ (km) so với mực nước biển được tính bằng công thức $P(h) = 760 e^(-0.13 h)$. Khi một máy bay bay ở độ cao $10$ km, áp suất không khí bên ngoài máy bay là bao nhiêu mmHg?],
    (
        [$100$ mmHg.],
        [$150$ mmHg.],
        True([$207$ mmHg.]),
        [$250$ mmHg.]
    ),
    loigiai: [
        Tại $h = 10$:
        $
          P(10) = 760 e^(-0.13 dot 10) = 760 e^(-1.3)
        $
        Bấm máy tính:
        $
          P(10) approx 760 dot 0.27253 = 207.12 " (mmHg)"
        $
    ]
)

// TN 11
#tn([Mô hình Logistic của sự lan truyền tin đồn trong một trường học có $2000$ học sinh được cho bởi $N(t) = 2000 / (1 + 19 e^(-0.5 t))$, trong đó $t$ là số ngày. Vào thời điểm nào thì tốc độ lan truyền tin đồn lớn nhất (biết tốc độ lớn nhất xảy ra khi một nửa số học sinh đã biết tin)?],
    (
        [$3.5$ ngày.],
        [$4.8$ ngày.],
        True([$5.9$ ngày.]),
        [$7.2$ ngày.]
    ),
    loigiai: [
        Số người biết tin đồn đạt một nửa là $N = 1000$.
        Giải phương trình:
        $
          2000 / (1 + 19 e^(-0.5 t)) = 1000 <=> 1 + 19 e^(-0.5 t) = 2 <=> 19 e^(-0.5 t) = 1
        $
        $
          <=> e^(-0.5 t) = 1/19 <=> -0.5 t = ln(1/19) = -ln 19
        $
        $
          <=> t = (ln 19) / 0.5 = 2 ln 19 approx 2 dot 2.944 = 5.889 " (ngày)"
        $
        Khoảng $5.9$ ngày.
    ]
)

// TN 12
#tn([Một doanh nghiệp tính toán rằng nếu bỏ ra chi phí quảng cáo $x$ triệu đồng/tháng thì lợi nhuận thu được là $P(x) = 50 + 10 ln x$ (triệu đồng), với $x > 0$. Nếu doanh nghiệp muốn lợi nhuận tăng thêm $10$ triệu đồng từ mức lợi nhuận khi $x=10$, họ cần chi bao nhiêu tiền quảng cáo một tháng?],
    (
        [$20.5$ triệu đồng.],
        True([$27.2$ triệu đồng.]),
        [$30.0$ triệu đồng.],
        [$100$ triệu đồng.]
    ),
    loigiai: [
        Khi $x = 10$, lợi nhuận là $P_1 = 50 + 10 ln 10$.
        Cần đạt lợi nhuận mới $P_2 = P_1 + 10 = 60 + 10 ln 10$.
        Ta giải phương trình:
        $
          50 + 10 ln x = 60 + 10 ln 10 <=> 10 ln x = 10 + 10 ln 10 <=> ln x = 1 + ln 10
        $
        $
          <=> x = e^(1 + ln 10) = e dot e^(ln 10) = 10 e
        $
        Bấm máy tính: $10 e approx 10 dot 2.718 = 27.18$ (triệu đồng).
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một loài sinh vật phù du sống trong môi trường nước bị ô nhiễm có mật độ $D(t) = 1000 e^(-0.15 t)$ (con/lít), trong đó $t$ là số giờ. Các phát biểu sau đúng hay sai?], (
        True([Ban đầu ($t=0$), mật độ sinh vật là $1000$ con/lít.]),
        True([Sau $10$ giờ, mật độ giảm hơn một nửa.]),
        True([Mật độ sinh vật giảm theo cấp số nhân với công bội bé hơn 1.]),
        [Tốc độ chết đi của sinh vật (đạo hàm $D'(t)$) luôn không đổi theo thời gian.]
    ), 
    loigiai: [
        - *a)* Đúng. $D(0) = 1000 e^0 = 1000$.
        - *b)* Đúng. $D(10) = 1000 e^(-1.5) approx 1000 dot 0.223 = 223$ (con/lít). $223 < 500$ nên đã giảm hơn một nửa.
        - *c)* Đúng. $D(t) = 1000 (e^(-0.15))^t$. Đây là hàm số mũ với cơ số $q = e^(-0.15) approx 0.86 < 1$, nên nó lập thành cấp số nhân.
        - *d)* Sai. Đạo hàm $D'(t) = -150 e^(-0.15 t)$ là hàm thay đổi theo $t$, không phải hằng số.
    ]
)

// DS 2
#ds([Độ lớn cảm giác âm (Sone) có liên hệ với mức cường độ âm $L$ (Phon hoặc dB ở 1kHz) bằng công thức kinh nghiệm: $S = 2^((L - 40)/10)$. Các phát biểu sau đúng hay sai?], (
        True([Một âm có mức cường độ $40$ dB có độ lớn cảm giác là $1$ Sone.]),
        True([Khi mức cường độ âm $L$ tăng thêm $10$ dB thì độ lớn cảm giác âm $S$ tăng lên gấp đôi.]),
        True([Nếu một máy dập có mức cường độ $80$ dB thì nó gây ra cảm giác âm mạnh gấp $8$ lần máy êm $50$ dB.]),
        [Hàm số $S(L)$ có đồ thị là một đường thẳng đi qua gốc tọa độ.]
    ), 
    loigiai: [
        - *a)* Đúng. $L = 40 => S = 2^((40-40)/10) = 2^0 = 1$.
        - *b)* Đúng. Thay $L$ bằng $L + 10$: $S_"new" = 2^((L+10-40)/10) = 2^((L-40)/10 + 1) = 2 dot 2^((L-40)/10) = 2 S$.
        - *c)* Đúng.
          $ S(80) = 2^((80-40)/10) = 2^4 = 16 $
          $ S(50) = 2^((50-40)/10) = 2^1 = 2 $
          Tỉ số là $16/2 = 8$ lần.
        - *d)* Sai. Hàm $S(L)$ là một hàm số mũ, đồ thị là một đường cong chứ không phải đường thẳng.
    ]
)

// DS 3
#ds([Chất phóng xạ Polonium-210 có chu kì bán rã là $138$ ngày. Ban đầu có $10$ gam Polonium-210. Phương trình khối lượng còn lại là $m(t) = 10 dot 2^(-t/138)$. Các phát biểu sau đúng hay sai?], (
        True([Sau $138$ ngày, khối lượng chất phóng xạ bị phân rã là $5$ gam.]),
        [Sau đúng $276$ ngày, chất phóng xạ sẽ phân rã hết hoàn toàn.],
        True([Khối lượng chất phóng xạ bị mất đi trong $138$ ngày đầu lớn hơn khối lượng mất đi trong $138$ ngày tiếp theo.]),
        True([Thời gian để lượng phóng xạ còn lại $1$ gam là $t = 138 log_2 10$ ngày.])
    ), 
    loigiai: [
        - *a)* Đúng. Sau $138$ ngày, lượng còn lại là $5$ gam, vậy lượng phân rã cũng là $10 - 5 = 5$ gam.
        - *b)* Sai. Sau $276$ ngày ($2$ chu kì), khối lượng còn lại là $10/4 = 2.5$ gam (chưa phân rã hết).
        - *c)* Đúng. Khối lượng mất đi trong chu kì đầu là $5$ gam. Trong chu kì thứ hai, từ $5$ gam giảm còn $2.5$ gam, khối lượng mất đi là $2.5$ gam. Rõ ràng $5 > 2.5$.
        - *d)* Đúng. Giải $10 dot 2^(-t/138) = 1 <=> 2^(-t/138) = 0.1 <=> -t/138 = log_2 0.1 = -log_2 10 => t = 138 log_2 10$.
    ]
)

// DS 4
#ds([Để đánh giá chất lượng học trực tuyến, người ta xây dựng hàm thời gian tập trung $F(t) = 45 / (1 + 0.2 e^(0.1 t))$ (phút), trong đó $t$ là số phút học sinh đã ngồi trước màn hình không nghỉ. Các phát biểu sau đúng hay sai?], (
        [Lúc mới bắt đầu học ($t=0$), độ tập trung là cao nhất và bằng $45$ phút.],
        True([Hàm $F(t)$ là hàm nghịch biến, nghĩa là ngồi càng lâu độ tập trung càng giảm.]),
        True([Sau $60$ phút học không nghỉ, độ tập trung $F(60)$ giảm xuống còn chưa tới $6$ phút.]),
        True([Nghỉ giải lao giúp khởi động lại $t=0$, từ đó tăng mức độ tập trung trở lại.])
    ), 
    loigiai: [
        - *a)* Sai. Tại $t = 0$: $F(0) = 45 / (1 + 0.2 dot 1) = 45 / 1.2 = 37.5$ (phút).
        - *b)* Đúng. Mẫu số $(1 + 0.2 e^(0.1 t))$ là hàm đồng biến vì $e^(0.1 t)$ đồng biến và hệ số dương. Do đó tử số chia mẫu số đồng biến sẽ tạo thành hàm nghịch biến.
        - *c)* Đúng. Tại $t = 60$:
          $ F(60) = 45 / (1 + 0.2 e^6) approx 45 / (1 + 0.2 dot 403.4) = 45 / (1 + 80.68) = 45 / 81.68 approx 0.55 " (phút)" $
          Giảm rất mạnh và còn chưa tới 6 phút.
        - *d)* Đúng. Việc nghỉ giải lao giúp $t$ quay về $0$, làm tăng lại $F(t)$ lên $37.5$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Tốc độ sinh trưởng của một loài vi khuẩn tuân theo công thức $N(t) = N_0 3^(t/2)$, trong đó $t$ đo bằng giờ. Nếu ban đầu có $500$ con vi khuẩn, sau bao nhiêu giờ thì số lượng vi khuẩn đạt $13500$ con?],
    [6],
    loigiai: [
        Ta có phương trình:
        $
          500 dot 3^(t/2) = 13500 <=> 3^(t/2) = 13500/500 = 27
        $
        $
          <=> 3^(t/2) = 3^3 <=> t/2 = 3 <=> t = 6 " (giờ)"
        $
    ]
)

// TL 2
#tln([Một khoản vay mua ô tô $600$ triệu đồng, lãi suất $0.8\%$/tháng, trả góp đều đặn hàng tháng trong $5$ năm ($60$ tháng). Tính số tiền lãi (triệu đồng) sinh ra ngay trong tháng trả góp đầu tiên.],
    [4.8],
    loigiai: [
        Tiền lãi trong tháng trả góp đầu tiên chỉ tính bằng dư nợ gốc ban đầu nhân với lãi suất.
        $
          L_1 = P dot r = 600 dot 0.008 = 4.8 " (triệu đồng)"
        $
    ]
)

// TL 3
#tln([Độ sáng tuyệt đối của các vì sao (magnitude) tuân theo luật logarit. Độ chênh lệch cường độ sáng $I_1/I_2$ giữa hai ngôi sao có độ sáng magnitude $m_1, m_2$ là $m_2 - m_1 = 2.5 log(I_1 / I_2)$. Sao Sirius có magnitude $m_1 = -1.46$ và Sao Polaris có magnitude $m_2 = 1.97$. Ánh sáng từ sao Sirius gấp bao nhiêu lần sao Polaris? (Làm tròn đến hàng đơn vị).],
    [24],
    loigiai: [
        Ta có:
        $
          1.97 - (-1.46) = 2.5 log(I_1 / I_2) <=> 3.43 = 2.5 log(I_1 / I_2)
        $
        $
          <=> log(I_1 / I_2) = 3.43 / 2.5 = 1.372
        $
        $
          <=> I_1 / I_2 = 10^1.372 approx 23.55
        $
        Làm tròn đến hàng đơn vị, kết quả là $24$ lần.
    ]
)

// TL 4
#tln([Lượng pin còn lại của một chiếc điện thoại smartphone giảm theo hàm số $P(t) = 100 e^(-0.05 t)$ ($\%$), trong đó $t$ là số giờ sử dụng liên tục (ví dụ xem video). Khi pin giảm xuống dưới mức $15\%$, điện thoại sẽ báo pin yếu. Hỏi sau bao nhiêu giờ xem video liên tục thì điện thoại báo pin yếu? (Làm tròn đến một chữ số thập phân).],
    [37.9],
    loigiai: [
        Giải phương trình:
        $
          100 e^(-0.05 t) = 15 <=> e^(-0.05 t) = 0.15
        $
        $
          <=> -0.05 t = ln 0.15 <=> t = (ln 0.15) / (-0.05) approx (-1.897) / (-0.05) = 37.94
        $
        Làm tròn đến một chữ số thập phân là $37.9$ giờ.
    ]
)

// TL 5
#tln([Một chất làm lạnh được sử dụng trong công nghiệp bay hơi theo mô hình $V(t) = 500(0.9)^t$ (lít), với $t$ là số tuần. Tính tốc độ bay hơi của chất đó (đạo hàm $V'(t)$) ở tuần thứ $10$. (Lấy trị tuyệt đối, làm tròn đến một chữ số thập phân).],
    [18.4],
    loigiai: [
        Tính đạo hàm của hàm số mũ cơ số $a = 0.9$:
        $
          V'(t) = 500 dot (0.9)^t dot ln(0.9)
        $
        Tại $t = 10$:
        $
          V'(10) = 500 dot (0.9)^10 dot ln(0.9) approx 500 dot 0.348678 dot (-0.10536) approx -18.368
        $
        Lấy trị tuyệt đối và làm tròn đến một chữ số thập phân ta được $18.4$ (lít/tuần).
    ]
)

// TL 6
#tln([Mức năng suất làm việc của một nhân viên mới theo số tháng kinh nghiệm $x$ được mô hình hóa bởi hàm số $W(x) = 100 - A e^(-k x)$ ($\%$). Khi vừa vào làm ($x=0$), năng suất đạt $40\%$. Sau $3$ tháng, năng suất đạt $70\%$. Dự đoán sau $6$ tháng, năng suất của nhân viên đó sẽ đạt bao nhiêu phần trăm?],
    [85],
    loigiai: [
        Từ điều kiện $W(0) = 40$:
        $
          100 - A e^0 = 40 <=> 100 - A = 40 <=> A = 60
        $
        Hàm số trở thành $W(x) = 100 - 60 e^(-k x)$.
        Tại $x = 3$, $W(3) = 70$:
        $
          100 - 60 e^(-3 k) = 70 <=> 60 e^(-3 k) = 30 <=> e^(-3 k) = 0.5
        $
        Cần tính $W(6)$:
        $
          W(6) = 100 - 60 e^(-6 k) = 100 - 60 (e^(-3 k))^2
        $
        Thay $e^(-3 k) = 0.5$ vào:
        $
          W(6) = 100 - 60 dot (0.5)^2 = 100 - 60 dot 0.25 = 100 - 15 = 85
        $
        Vậy năng suất đạt $85\%$.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
