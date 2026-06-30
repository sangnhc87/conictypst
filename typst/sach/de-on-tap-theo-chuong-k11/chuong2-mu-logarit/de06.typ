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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 06 - MÔ HÌNH TOÁN HỌC)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Chu kì bán rã của nguyên tố Radium-226 là $1600$ năm. Hàm lượng Radium-226 còn lại $m(t)$ (gam) sau $t$ năm được tính theo công thức $m(t) = m_0 (1/2)^(t/1600)$, với $m_0$ là khối lượng ban đầu. Từ một mẫu ban đầu chứa $20$ gam Radium-226, sau bao lâu thì khối lượng Radium-226 trong mẫu chỉ còn lại $5$ gam?],
    (
        [$2400$ năm.],
        True([$3200$ năm.]),
        [$4000$ năm.],
        [$4800$ năm.]
    ),
    loigiai: [
        Khối lượng còn lại là $5$ gam, ta có phương trình:
        $
          20 (1/2)^(t/1600) = 5 <=> (1/2)^(t/1600) = 5/20 = 1/4 = (1/2)^2
        $
        Suy ra:
        $
          t/1600 = 2 <=> t = 3200 " (năm)"
        $
    ]
)

// TN 2
#tn([Một học viên đang học đánh máy vi tính. Tốc độ đánh máy $N$ (từ/phút) mà học viên đó đạt được sau $t$ tuần luyện tập được một chuyên gia ước lượng bởi hàm số $N(t) = 100(1 - e^(-0.1 t))$. Theo mô hình này, nếu học viên tiếp tục luyện tập vô hạn thời gian, tốc độ đánh máy tối đa người đó có thể tiến tới xấp xỉ là bao nhiêu từ/phút?],
    (
        [$80$ từ/phút.],
        [$90$ từ/phút.],
        True([$100$ từ/phút.]),
        [$110$ từ/phút.]
    ),
    loigiai: [
        Khi $t -> +oo$, ta có $e^(-0.1 t) -> 0$.
        Giới hạn của tốc độ đánh máy:
        $
          lim_(t -> +oo) N(t) = 100(1 - 0) = 100 " (từ/phút)"
        $
    ]
)

// TN 3
#tn([Số lượng một loài bọ cánh cứng trong một khu rừng tăng trưởng theo mô hình hàm số mũ. Biết rằng năm 2020 khu rừng có $20 000$ con bọ và đến năm 2024 số lượng bọ đã tăng lên $30 000$ con. Giả sử tốc độ tăng trưởng là không đổi, ước tính vào năm nào số lượng bọ trong khu rừng sẽ đạt ngưỡng $45 000$ con?],
    (
        [$2026$.],
        [$2027$.],
        True([$2028$.]),
        [$2030$.]
    ),
    loigiai: [
        Giả sử mô hình tăng trưởng là $P(t) = P_0 k^t$, với $t$ là số năm tính từ 2020.
        Ta có $P_0 = 20000$. Tại năm 2024 ($t = 4$):
        $
          P(4) = 20000 k^4 = 30000 <=> k^4 = 1.5 <=> k = root(4, 1.5)
        $
        Cần tìm $t$ sao cho $P(t) = 45000$:
        $
          20000 k^t = 45000 <=> k^t = 2.25 <=> (root(4, 1.5))^t = 1.5^2
        $
        $
          <=> 1.5^(t/4) = 1.5^2 <=> t/4 = 2 <=> t = 8
        $
        Vậy vào năm $2020 + 8 = 2028$.
    ]
)

// TN 4
#tn([Cường độ âm chuẩn là $I_0 = 10^(-12) "W/m"^2$. Một xe cứu thương hụ còi phát ra âm thanh với mức cường độ âm đo được là $110$ dB. Cường độ âm $I$ của tiếng còi xe cứu thương đó tính theo $"W/m"^2$ là],
    (
        [$10^(-2)$.],
        True([$10^(-1)$.]),
        [$1$.],
        [$10$.]
    ),
    loigiai: [
        Công thức mức cường độ âm là $L = 10 log(I / I_0)$ (dB).
        Ta có:
        $
          10 log(I / 10^(-12)) = 110 <=> log(I / 10^(-12)) = 11
        $
        $
          <=> I / 10^(-12) = 10^11 <=> I = 10^11 dot 10^(-12) = 10^(-1) " (W/m"^2")"
        $
    ]
)

// TN 5
#tn([Độ lớn của một trận động đất được đo theo thang Richter bằng công thức $M = log(A / A_0)$, trong đó $A$ là biên độ chấn động lớn nhất và $A_0$ là biên độ chuẩn. Nếu một trận động đất đo được $8.2$ độ Richter, thì biên độ $A$ của nó gấp bao nhiêu lần biên độ $A$ của một trận động đất đo được $6.2$ độ Richter?],
    (
        [$2$ lần.],
        [$20$ lần.],
        True([$100$ lần.]),
        [$1000$ lần.]
    ),
    loigiai: [
        Ta có:
        $
          M_1 = log(A_1 / A_0) = 8.2
        $
        $
          M_2 = log(A_2 / A_0) = 6.2
        $
        Suy ra:
        $
          M_1 - M_2 = log(A_1 / A_0) - log(A_2 / A_0) = log(A_1 / A_2) = 8.2 - 6.2 = 2
        $
        $
          <=> A_1 / A_2 = 10^2 = 100 " (lần)"
        $
    ]
)

// TN 6
#tn([Áp suất không khí $P$ giảm khi độ cao $h$ tăng theo công thức $P = P_0 e^(-0.12 h)$, trong đó $P_0$ là áp suất ở mực nước biển. Để áp suất không khí chỉ còn $25\%$ so với áp suất ở mực nước biển, ta phải lên đến độ cao $h$ (tính bằng km) xấp xỉ bằng bao nhiêu?],
    (
        [$8.5$ km.],
        [$10.2$ km.],
        True([$11.6$ km.]),
        [$12.4$ km.]
    ),
    loigiai: [
        Ta cần giải phương trình:
        $
          P = 0.25 P_0 <=> P_0 e^(-0.12 h) = 0.25 P_0 <=> e^(-0.12 h) = 0.25
        $
        $
          <=> -0.12 h = ln 0.25 = -ln 4 <=> h = (ln 4) / 0.12 approx 11.55 " (km)"
        $
        Làm tròn thành $11.6$ km.
    ]
)

// TN 7
#tn([Một doanh nghiệp đang cân nhắc đầu tư vào một dây chuyền sản xuất tự động. Giá trị thu hồi $V(t)$ của dây chuyền sau $t$ năm giảm dần theo mô hình $V(t) = 1.2 dot 2^(-0.3 t)$ (tỉ đồng). Sau $5$ năm, giá trị thu hồi của dây chuyền còn khoảng bao nhiêu triệu đồng?],
    (
        [$350$ triệu đồng.],
        [$376$ triệu đồng.],
        [$415$ triệu đồng.],
        True([$424$ triệu đồng.])
    ),
    loigiai: [
        Thay $t = 5$ vào công thức:
        $
          V(5) = 1.2 dot 2^(-0.3 dot 5) = 1.2 dot 2^(-1.5) approx 1.2 dot 0.35355 approx 0.42426 " (tỉ đồng)"
        $
        Đổi ra đơn vị triệu đồng:
        $
          0.42426 " tỉ đồng" = 424.26 " triệu đồng"
        $
        Kết quả gần nhất là $424$ triệu đồng.
    ]
)

// TN 8
#tn([Cô giáo Hạnh dự định mua một căn hộ chung cư. Cô đang có $800$ triệu đồng và quyết định gửi vào ngân hàng với lãi suất $7.5\%$/năm, tính lãi kép liên tục. Hỏi sau đúng $4$ năm gửi, cô Hạnh sẽ có khoảng bao nhiêu tiền?],
    (
        [$1000$ triệu đồng.],
        [$1050$ triệu đồng.],
        True([$1080$ triệu đồng.]),
        [$1100$ triệu đồng.]
    ),
    loigiai: [
        Sử dụng công thức lãi kép liên tục $A = P e^(r t)$ với $P = 800, r = 0.075, t = 4$:
        $
          A = 800 e^(0.075 dot 4) = 800 e^(0.3) approx 800 dot 1.34986 = 1079.89 " (triệu đồng)"
        $
        Kết quả gần nhất là $1080$ triệu đồng.
    ]
)

// TN 9
#tn([Số giờ trong một ngày đêm (ban ngày) ở một thành phố phía Bắc vào ngày thứ $t$ trong năm được một nhà khí tượng mô hình hóa bởi hàm số $H(t) = 12 + 4 sin((2 pi(t - 80))/365)$. Tuy nhiên độ rọi ánh sáng trung bình lại phụ thuộc vào hàm mũ $I(t) = 100 e^(0.01 (H(t) - 12))$. Biết giá trị lớn nhất của $H(t)$ là $16$ giờ. Độ rọi tối đa của ngày dài nhất là bao nhiêu?],
    (
        [$100 e^0.01$.],
        [$100 e^0.02$.],
        True([$100 e^0.04$.]),
        [$100 e^0.08$.]
    ),
    loigiai: [
        Hàm $I(t)$ đạt giá trị tối đa khi số giờ ban ngày $H(t)$ đạt giá trị lớn nhất.
        Theo đề bài, $H(t)_(max) = 16$. 
        Thay vào công thức cường độ sáng:
        $
          I_(max) = 100 e^(0.01(16 - 12)) = 100 e^(0.01 dot 4) = 100 e^(0.04)
        $
    ]
)

// TN 10
#tn([Chỉ số HDI (Chỉ số phát triển con người) của một tỉnh qua các năm được tính xấp xỉ bằng hàm logarit $H(t) = 0.5 + 0.1 ln(t + 1)$, trong đó $t$ là số năm tính từ mốc 2010. Ước tính chỉ số HDI của tỉnh này vào năm 2030 (tương ứng $t = 20$) là khoảng bao nhiêu?],
    (
        [$0.65$.],
        [$0.75$.],
        True([$0.80$.]),
        [$0.85$.]
    ),
    loigiai: [
        Tại năm 2030, $t = 20$. Thay vào công thức:
        $
          H(20) = 0.5 + 0.1 ln(20 + 1) = 0.5 + 0.1 ln(21)
        $
        Bấm máy tính, $ln 21 approx 3.044$.
        $
          H(20) approx 0.5 + 0.1 dot 3.044 = 0.5 + 0.3044 = 0.8044
        $
        Kết quả gần nhất là $0.80$.
    ]
)

// TN 11
#tn([Trong ngành y tế, mô hình Gompertz thường dùng để dự đoán tỉ lệ mắc một căn bệnh. Giả sử số lượng người mắc bệnh trong cộng đồng có dạng $N(t) = 1000 e^(-4 e^(-0.5 t))$, với $t$ là số tháng. Sau bao lâu thì số người mắc bệnh đạt $500$ người?],
    (
        [$2.4$ tháng.],
        [$3.0$ tháng.],
        True([$3.5$ tháng.]),
        [$4.2$ tháng.]
    ),
    loigiai: [
        Ta giải phương trình $N(t) = 500$:
        $
          1000 e^(-4 e^(-0.5 t)) = 500 <=> e^(-4 e^(-0.5 t)) = 0.5
        $
        $
          <=> -4 e^(-0.5 t) = ln 0.5 = -ln 2 <=> e^(-0.5 t) = (ln 2) / 4
        $
        Lấy logarit tự nhiên lần nữa:
        $
          -0.5 t = ln((ln 2) / 4) <=> t = -2 ln((ln 2) / 4) approx -2 ln(0.1733) approx -2 dot (-1.752) approx 3.5 " (tháng)"
        $
    ]
)

// TN 12
#tn([Vận tốc $v$ (m/s) của một chiếc dù nhảy sau $t$ giây kể từ khi bung dù rơi tự do có thể được lập mô hình bằng $v(t) = 40(1 - e^(-0.2 t))$. Khi $t$ đủ lớn, chiếc dù sẽ đạt đến một vận tốc rơi ổn định (vận tốc cuối). Vận tốc cuối đó là bao nhiêu m/s?],
    (
        [$10$ m/s.],
        [$20$ m/s.],
        True([$40$ m/s.]),
        [$80$ m/s.]
    ),
    loigiai: [
        Khi $t$ đủ lớn, $t -> +oo$, ta có $e^(-0.2 t) -> 0$.
        Vận tốc cuối cùng là giới hạn của $v(t)$:
        $
          lim_(t -> +oo) v(t) = 40(1 - 0) = 40 " (m/s)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Pháp y sử dụng định luật làm nguội của Newton để xác định thời điểm tử vong của nạn nhân. Giả sử nhiệt độ phòng luôn ổn định ở $22^circ C$. Nhiệt độ thi thể nạn nhân tại thời điểm pháp y có mặt (coi là $t = 0$) là $30^circ C$, và $1$ giờ sau đó nhiệt độ giảm còn $28^circ C$. Nhiệt độ cơ thể người bình thường lúc còn sống là $37^circ C$. Các phát biểu sau đúng hay sai?], (
        True([Độ chênh lệch nhiệt độ giữa thi thể (lúc $t=0$) và môi trường là $8^circ C$.]),
        True([Mô hình nhiệt độ của thi thể là $T(t) = 22 + 8(3/4)^t$ ($t$ tính bằng giờ).]),
        True([Nạn nhân đã tử vong khoảng thời gian trên $2$ giờ trước khi pháp y đến.]),
        [Sau một thời gian rất dài (nhiều ngày), nhiệt độ thi thể sẽ giảm xuống $0^circ C$.]
    ), 
    loigiai: [
        - *a)* Đúng. Độ chênh lệch nhiệt độ lúc $t = 0$ là:
          $ 30 - 22 = 8^circ C $
        - *b)* Đúng. Mô hình $T(t) = T_(m t) + (T_0 - T_(m t)) k^t$.
          Ta có $T_0 = 30$, $T_(m t) = 22$, suy ra $T(t) = 22 + 8 k^t$.
          Tại $t = 1$, $T = 28$, suy ra:
          $ 22 + 8 k^1 = 28 <=> 8k = 6 <=> k = 6/8 = 3/4 $
          Vậy $T(t) = 22 + 8(3/4)^t$.
        - *c)* Đúng. Tại thời điểm tử vong $t = t_D$ (với $t_D < 0$), nhiệt độ là $37^circ C$.
          $ 22 + 8(3/4)^(t_D) = 37 <=> 8(3/4)^(t_D) = 15 <=> (3/4)^(t_D) = 15/8 $
          $ <=> t_D = log_(0.75) (15/8) approx -2.18 " (giờ)" $
          Vì $2.18 > 2$, nạn nhân tử vong cách thời điểm $t=0$ hơn 2 giờ trước.
        - *d)* Sai. Nhiệt độ thi thể sẽ cân bằng với nhiệt độ môi trường, tức là tiến về $22^circ C$, chứ không về $0^circ C$.
    ]
)

// DS 2
#ds([Nồng độ một loại thuốc trừ sâu trong đất sau khi phun tản ra theo thời gian được đánh giá bằng hàm $C(t) = 15 t e^(-0.1 t)$ (ppm), trong đó $t$ là số ngày. Các phát biểu sau đúng hay sai?], (
        True([Vào ngày thứ $10$, nồng độ thuốc trong đất xấp xỉ $55.2$ ppm.]),
        [Nồng độ thuốc tại ngày thứ $20$ cao hơn so với ngày thứ $10$.],
        [Theo thời gian đủ dài, nồng độ thuốc trừ sâu sẽ không bị phân hủy hết hoàn toàn mà luôn giữ mức tối thiểu $1$ ppm.],
        True([Tốc độ thay đổi nồng độ thuốc tại ngày đầu tiên ($t = 1$) là dương (nồng độ đang tăng).])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t = 10$:
          $ C(10) = 15 dot 10 e^(-0.1 dot 10) = 150 e^(-1) approx 150 dot 0.3679 approx 55.18 " (ppm)" $
        - *b)* Sai. Tại $t = 20$:
          $ C(20) = 15 dot 20 e^(-0.1 dot 20) = 300 e^(-2) approx 300 dot 0.1353 approx 40.59 " (ppm)" $
          Như vậy ngày 20 nồng độ thấp hơn ngày 10.
        - *c)* Sai. Khi $t -> +oo$, giới hạn $lim_(t -> +oo) 15 t e^(-0.1 t) = 0$, nghĩa là thuốc phân hủy hoàn toàn, tiến về $0$.
        - *d)* Đúng. Đạo hàm $C'(t) = 15(1 dot e^(-0.1 t) + t dot (-0.1) e^(-0.1 t)) = 15 e^(-0.1 t)(1 - 0.1 t)$.
          Tại $t = 1$, $C'(1) = 15 e^(-0.1)(1 - 0.1) = 13.5 e^(-0.1) > 0$. Vậy nồng độ đang tăng.
    ]
)

// DS 3
#ds([Kỹ sư thiết kế một con chip máy tính nhận thấy phần trăm số lượng chip bị hỏng $F(t)$ sau $t$ năm vận hành liên tục tuân theo phân bố Weibull $F(t) = 1 - e^(-0.05 t^2)$. Các phát biểu sau đúng hay sai?], (
        True([Khi vừa xuất xưởng ($t=0$), tỉ lệ chip hỏng là $0\%$.]),
        True([Sau $2$ năm vận hành, khoảng $18.1\%$ số chip bị hỏng.]),
        [Sau $5$ năm, hơn $70\%$ số lượng chip vẫn còn hoạt động tốt.],
        [Cần ít nhất $6$ năm để phân nửa số lượng chip bị hỏng.]
    ), 
    loigiai: [
        - *a)* Đúng. $t=0 => F(0) = 1 - e^0 = 1 - 1 = 0$.
        - *b)* Đúng. Tại $t = 2$:
          $ F(2) = 1 - e^(-0.05 dot 2^2) = 1 - e^(-0.2) approx 1 - 0.8187 = 0.1813 = 18.13\% $
        - *c)* Sai. Tại $t = 5$, tỉ lệ hỏng là:
          $ F(5) = 1 - e^(-0.05 dot 5^2) = 1 - e^(-1.25) approx 1 - 0.2865 = 0.7135 = 71.35\% $
          Tỉ lệ hoạt động tốt là $100\% - 71.35\% = 28.65\%$, nhỏ hơn $70\%$.
        - *d)* Sai. Phân nửa số chip bị hỏng nghĩa là $F(t) = 0.5$:
          $ 1 - e^(-0.05 t^2) = 0.5 <=> e^(-0.05 t^2) = 0.5 $
          $ <=> -0.05 t^2 = -ln 2 <=> t^2 = (ln 2) / 0.05 approx 13.86 <=> t approx sqrt(13.86) approx 3.72 " (năm)" $
          Như vậy chỉ cần khoảng $3.72$ năm, ít hơn $6$ năm rất nhiều.
    ]
)

// DS 4
#ds([Áp suất thẩm thấu $Pi$ (atm) của một dung dịch theo nồng độ mol $C$ (mol/L) được một sinh viên hóa học mô tả bởi $Pi = 24.5 e^(0.1 C)$. Các phát biểu sau đúng hay sai?], (
        True([Khi nồng độ $C = 0$, áp suất thẩm thấu bằng $24.5$ atm.]),
        [Nếu tăng nồng độ $C$ thêm $1$ mol/L thì áp suất thẩm thấu $Pi$ tăng thêm một lượng cố định không đổi.],
        True([Để áp suất thẩm thấu đạt $50$ atm, nồng độ $C$ cần thiết là khoảng $7.1$ mol/L.]),
        True([Tỉ số áp suất thẩm thấu khi nồng độ là $C+10$ so với khi nồng độ là $C$ luôn bằng hằng số $e$.])
    ), 
    loigiai: [
        - *a)* Đúng. Thay $C = 0 => Pi = 24.5 e^0 = 24.5$ atm.
        - *b)* Sai. Hàm $Pi(C)$ là hàm mũ, do đó khi $C$ tăng thêm $1$, áp suất $Pi$ tăng theo cấp số nhân (gấp $e^0.1$ lần) chứ không phải tăng thêm một lượng cố định.
        - *c)* Đúng. Giải $24.5 e^(0.1 C) = 50$:
          $ e^(0.1 C) = 50 / 24.5 <=> 0.1 C = ln(50/24.5) <=> C = 10 ln(50/24.5) approx 7.14 " (mol/L)" $
        - *d)* Đúng. Lập tỉ số:
          $ (Pi(C+10)) / (Pi(C)) = (24.5 e^(0.1(C+10))) / (24.5 e^(0.1 C)) = e^(0.1 C + 1) / e^(0.1 C) = e^1 = e $
          Tỉ số luôn bằng hằng số $e$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Tỉ lệ phần trăm học sinh nhớ bài giảng sau $t$ tuần được một nhà tâm lý học lập mô hình là $R(t) = 85 - 20 ln(t + 1)$ ($\%$). Sau bao nhiêu tuần thì tỉ lệ học sinh nhớ bài giảng giảm xuống còn $45\%$? (Làm tròn kết quả đến hàng đơn vị).],
    [6],
    loigiai: [
        Giải phương trình:
        $
          85 - 20 ln(t + 1) = 45 <=> 20 ln(t + 1) = 40 <=> ln(t + 1) = 2
        $
        $
          <=> t + 1 = e^2 <=> t = e^2 - 1 approx 7.389 - 1 = 6.389
        $
        Làm tròn đến hàng đơn vị ta được $6$ tuần.
    ]
)

// TL 2
#tln([Doanh thu của một bộ phim chiếu rạp trong tuần thứ $x$ kể từ lúc công chiếu được tính bằng $D(x) = 15 dot (0.6)^x$ (tỉ đồng). Tính tổng doanh thu của bộ phim trong 2 tuần đầu tiên ($x=1$ và $x=2$).],
    [14.4],
    loigiai: [
        Doanh thu tuần 1: $D(1) = 15 dot (0.6)^1 = 9$ (tỉ đồng).
        Doanh thu tuần 2: $D(2) = 15 dot (0.6)^2 = 15 dot 0.36 = 5.4$ (tỉ đồng).
        Tổng doanh thu trong 2 tuần đầu:
        $
          9 + 5.4 = 14.4 " (tỉ đồng)"
        $
    ]
)

// TL 3
#tln([Một vùng biển bị ô nhiễm hóa chất. Sự tự làm sạch của môi trường nước theo thời gian $t$ (năm) tuân theo mô hình $C(t) = 40 e^(-0.25 t)$ (mg/L). Cơ quan chức năng quy định nước an toàn để đánh bắt thủy sản khi nồng độ hóa chất dưới $5$ mg/L. Cần ít nhất bao nhiêu năm để khu vực này được phép đánh bắt thủy sản trở lại? (Kết quả làm tròn đến chữ số thập phân thứ nhất).],
    [8.3],
    loigiai: [
        Giải phương trình:
        $
          40 e^(-0.25 t) = 5 <=> e^(-0.25 t) = 5/40 = 1/8
        $
        $
          <=> -0.25 t = ln(1/8) = -ln 8 <=> t = (ln 8) / 0.25 approx 8.317
        $
        Làm tròn đến chữ số thập phân thứ nhất là $8.3$ năm.
    ]
)

// TL 4
#tln([Lực căng $T$ của một sợi dây cáp thép bị ăn mòn do thời tiết giảm theo hàm số $T(x) = 5000 - 150 ln(2x + 1)$ (Newton), trong đó $x$ là số năm sử dụng. Lực căng tối thiểu để đảm bảo an toàn là $4000$ Newton. Dây cáp sẽ không còn đảm bảo an toàn sau tối đa bao nhiêu năm sử dụng? (Làm tròn đến hàng đơn vị).],
    [392],
    loigiai: [
        Cần giải:
        $
          T(x) = 4000 <=> 5000 - 150 ln(2x + 1) = 4000 <=> 150 ln(2x + 1) = 1000
        $
        $
          <=> ln(2x + 1) = 1000/150 = 20/3
        $
        $
          <=> 2x + 1 = e^(20/3) <=> 2x = e^(20/3) - 1 <=> x = (e^(20/3) - 1) / 2
        $
        Bấm máy tính: $e^(20/3) approx 785.77$. Suy ra $x approx (785.77 - 1) / 2 = 392.38$.
        Làm tròn đến hàng đơn vị là $392$ năm.
    ]
)

// TL 5
#tln([Chỉ số IQ trung bình của một cộng đồng sau chương trình giáo dục đặc biệt tăng theo quy luật $I(t) = 90 + 10 ln(0.5 t + 1)$, trong đó $t$ là số năm thực hiện chương trình. Sau bao nhiêu năm thì chỉ số IQ trung bình của cộng đồng đạt mốc $105$? (Làm tròn đến một chữ số thập phân).],
    [7.0],
    loigiai: [
        Giải phương trình:
        $
          90 + 10 ln(0.5 t + 1) = 105 <=> 10 ln(0.5 t + 1) = 15 <=> ln(0.5 t + 1) = 1.5
        $
        $
          <=> 0.5 t + 1 = e^1.5 <=> 0.5 t = e^1.5 - 1 <=> t = (e^1.5 - 1) / 0.5 = 2(e^1.5 - 1)
        $
        Bấm máy tính: $e^1.5 approx 4.4817$. 
        $t = 2(4.4817 - 1) = 2 dot 3.4817 = 6.9634$.
        Làm tròn đến một chữ số thập phân là $7.0$ năm.
    ]
)

// TL 6
#tln([Doanh số bán ra (chiếc) của một hãng công nghệ đối với một sản phẩm mới ra mắt được mô hình hóa bởi $S(t) = 5000 (1 - e^(-0.4 t))$, với $t$ là số tháng kể từ lúc ra mắt. Tổng doanh số bán ra trong $3$ tháng đầu tiên (tại $t=3$) là bao nhiêu chiếc? (Làm tròn đến hàng đơn vị).],
    [3494],
    loigiai: [
        Thay $t = 3$ vào công thức:
        $
          S(3) = 5000 (1 - e^(-0.4 dot 3)) = 5000 (1 - e^(-1.2))
        $
        Bấm máy tính: $e^(-1.2) approx 0.30119$.
        $
          S(3) approx 5000 (1 - 0.30119) = 5000 dot 0.69881 = 3494.05 " (chiếc)"
        $
        Làm tròn đến hàng đơn vị, doanh số bán ra là $3494$ chiếc.
    ]
)
]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
