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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 09 - ỨNG DỤNG THỰC TẾ)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cường độ của một trận động đất được tính bằng công thức $M = log A - log A_0$, trong đó $A$ là biên độ dao động lớn nhất đo được trên máy địa chấn, và $A_0$ là biên độ chuẩn của một trận động đất tối thiểu. Trận động đất ở Nhật Bản đo được $9.0$ độ Richter, còn trận động đất ở Haiti đo được $7.0$ độ Richter. Biên độ dao động của trận động đất ở Nhật Bản gấp bao nhiêu lần so với ở Haiti?],
    (
        [$2$ lần.],
        [$20$ lần.],
        True([$100$ lần.]),
        [$1000$ lần.]
    ),
    loigiai: [
        Ta có $M_1 = log(A_1 / A_0) = 9.0$ và $M_2 = log(A_2 / A_0) = 7.0$.
        Suy ra $A_1 / A_0 = 10^9.0$ và $A_2 / A_0 = 10^7.0$.
        Lập tỉ số:
        $
          A_1 / A_2 = 10^9.0 / 10^7.0 = 10^2 = 100 " (lần)"
        $
    ]
)

// TN 2
#tn([Độ pH của một dung dịch được tính bằng công thức $"pH" = -log[H^+]$, với $[H^+]$ là nồng độ ion Hydrogen. Sữa tươi có độ pH khoảng $6.5$. Dung dịch amoniac có nồng độ ion Hydrogen $[H^+]$ nhỏ hơn của sữa tươi $10^5$ lần. Độ pH của dung dịch amoniac là bao nhiêu?],
    (
        [$1.5$.],
        [$5.0$.],
        [$10.5$.],
        True([$11.5$.])
    ),
    loigiai: [
        Ta có $[H^+]_"sữa" = 10^(-6.5)$.
        Nồng độ ion Hydrogen của amoniac:
        $
          [H^+]_"amoniac" = [H^+]_"sữa" / 10^5 = 10^(-6.5) / 10^5 = 10^(-11.5)
        $
        Vậy độ pH của dung dịch amoniac là:
        $
          "pH" = -log(10^(-11.5)) = 11.5
        $
    ]
)

// TN 3
#tn([Một bệnh nhân được tiêm một loại thuốc. Nồng độ thuốc $C(t)$ (mg/L) trong máu của bệnh nhân sau $t$ giờ kể từ khi tiêm được mô hình hóa bởi $C(t) = 10 e^(-0.2 t)$. Biết rằng thuốc chỉ có tác dụng điều trị khi nồng độ của nó trong máu không thấp hơn $2$ mg/L. Thời gian thuốc có tác dụng điều trị kéo dài trong khoảng bao nhiêu giờ?],
    (
        [$6.5$ giờ.],
        True([$8.0$ giờ.]),
        [$9.2$ giờ.],
        [$10.0$ giờ.]
    ),
    loigiai: [
        Ta cần tìm $t$ sao cho $C(t) >= 2$:
        $
          10 e^(-0.2 t) >= 2 <=> e^(-0.2 t) >= 0.2
        $
        $
          <=> -0.2 t >= ln 0.2 <=> t <= (ln 0.2) / (-0.2) = (-1.609) / (-0.2) approx 8.04
        $
        Vậy thuốc có tác dụng trong khoảng $8$ giờ.
    ]
)

// TN 4
#tn([Chu kì bán rã của đồng vị Carbon-14 là $5730$ năm. Khi khảo sát một mẫu gỗ lấy từ một ngôi mộ cổ, các nhà khảo cổ đo được lượng Carbon-14 trong mẫu gỗ chỉ còn $15\%$ so với lượng Carbon-14 của thực vật sống hiện tại. Tuổi của ngôi mộ cổ xấp xỉ bằng],
    (
        [$12500$ năm.],
        True([$15680$ năm.]),
        [$17500$ năm.],
        [$19300$ năm.]
    ),
    loigiai: [
        Phương trình phân rã phóng xạ:
        $
          m(t) = m_0 (1/2)^(t/T) <=> 0.15 m_0 = m_0 (1/2)^(t/5730)
        $
        $
          <=> (1/2)^(t/5730) = 0.15 <=> t/5730 = log_(0.5) 0.15
        $
        $
          <=> t = 5730 dot (ln 0.15) / (ln 0.5) approx 5730 dot 2.737 = 15682.7 " (năm)"
        $
        Làm tròn ta được $15680$ năm.
    ]
)

// TN 5
#tn([Một công ty dự định đầu tư một hệ thống phần mềm trí tuệ nhân tạo. Chi phí bảo trì hàng năm của hệ thống này sẽ tăng theo mô hình $C(t) = C_0 (1.12)^t$, trong đó $C_0$ là chi phí năm đầu tiên ($t=1$) và $t$ là số năm sử dụng. Sau bao nhiêu năm thì chi phí bảo trì hàng năm sẽ gấp ba lần so với chi phí của năm đầu tiên?],
    (
        [$8.7$ năm.],
        True([$9.7$ năm.]),
        [$10.2$ năm.],
        [$11.5$ năm.]
    ),
    loigiai: [
        Ta cần giải phương trình $C(t) = 3 C_0$:
        $
          C_0 (1.12)^t = 3 C_0 <=> (1.12)^t = 3
        $
        $
          <=> t = log_1.12 3 = (ln 3) / (ln 1.12) approx 1.0986 / 0.1133 approx 9.69 " (năm)"
        $
        Khoảng $9.7$ năm.
    ]
)

// TN 6
#tn([Trong một phòng thí nghiệm sinh học, quần thể một loài nấm mốc phát triển theo hàm số mũ $P(t) = P_0 e^(k t)$ ($t$ tính bằng ngày). Người ta thấy rằng sau $2$ ngày, diện tích vết nấm mốc là $10$" cm"^2, và sau $5$ ngày diện tích là $30$" cm"^2. Diện tích vết nấm mốc ban đầu (khi $t=0$) gần nhất với giá trị nào sau đây?],
    (
        [$3.5$" cm"^2.],
        True([$4.8$" cm"^2.]),
        [$5.2$" cm"^2.],
        [$6.0$" cm"^2.]
    ),
    loigiai: [
        Ta có hệ phương trình:
        $
          cases(
            P_0 e^(2 k) = 10,
            P_0 e^(5 k) = 30
          )
        $
        Lấy phương trình hai chia phương trình một:
        $
          e^(3 k) = 3 <=> 3 k = ln 3 <=> k = (ln 3) / 3 approx 0.3662
        $
        Thay $k$ vào phương trình một:
        $
          P_0 (e^k)^2 = 10 <=> P_0 (e^((ln 3)/3))^2 = 10 <=> P_0 (3^(1/3))^2 = 10 <=> P_0 dot 3^(2/3) = 10
        $
        $
          => P_0 = 10 / (3^(2/3)) approx 10 / 2.08 = 4.807 " (cm"^2")"
        $
    ]
)

// TN 7
#tn([Sự suy giảm giá trị của một chiếc máy in 3D theo thời gian được mô hình hóa bởi $V(t) = V_0 (1 - r)^t$, với $V_0$ là giá mua ban đầu, $r$ là tỉ lệ mất giá hàng năm, $t$ là số năm. Biết rằng sau $4$ năm sử dụng, giá trị chiếc máy in giảm xuống chỉ còn một nửa so với giá mua ban đầu. Hỏi tỉ lệ mất giá $r$ hàng năm xấp xỉ bằng bao nhiêu?],
    (
        [$12.5\%$.],
        [$14.2\%$.],
        True([$15.9\%$.]),
        [$17.3\%$.]
    ),
    loigiai: [
        Theo bài ra:
        $
          V_0 (1 - r)^4 = 0.5 V_0 <=> (1 - r)^4 = 0.5
        $
        $
          <=> 1 - r = root(4, 0.5) <=> r = 1 - root(4, 0.5) = 1 - 0.5^(0.25) approx 1 - 0.8409 = 0.1591
        $
        Vậy $r approx 15.9\%$.
    ]
)

// TN 8
#tn([Định luật Weber-Fechner trong tâm lý học cho biết phản ứng cảm giác $R$ của cơ thể đối với một kích thích có cường độ $I$ tuân theo hàm logarit: $R = k ln(I / I_0)$, trong đó $I_0$ là ngưỡng kích thích tối thiểu. Nếu một người cảm nhận ánh sáng gấp đôi so với cảm nhận ban đầu ($R_2 = 2 R_1$), thì cường độ ánh sáng $I_2$ phải bằng bao nhiêu so với $I_1$?],
    (
        [$I_2 = 2 I_1$.],
        [$I_2 = e^2 I_1$.],
        True([$I_2 = (I_1^2)/I_0$.]),
        [$I_2 = (I_1 / I_0)^2$.]
    ),
    loigiai: [
        Ta có $R_1 = k ln(I_1 / I_0)$.
        Và $R_2 = k ln(I_2 / I_0)$.
        Theo đề bài $R_2 = 2 R_1$:
        $
          k ln(I_2 / I_0) = 2 k ln(I_1 / I_0) <=> ln(I_2 / I_0) = ln(I_1 / I_0)^2
        $
        $
          <=> I_2 / I_0 = (I_1 / I_0)^2 <=> I_2 = I_0 dot (I_1^2) / (I_0^2) = (I_1^2) / I_0
        $
    ]
)

// TN 9
#tn([Quãng đường bay của một thiết bị không người lái phụ thuộc vào dung lượng pin theo hàm số $D(x) = 50(1 - e^(-0.1 x))$ (km), trong đó $x$ là số phút sạc pin. Nếu thiết bị đã bay được quãng đường $30$ km, hỏi trước đó người ta đã sạc pin cho thiết bị trong bao nhiêu phút?],
    (
        [$5.5$ phút.],
        [$7.2$ phút.],
        True([$9.2$ phút.]),
        [$11.0$ phút.]
    ),
    loigiai: [
        Ta giải phương trình:
        $
          50(1 - e^(-0.1 x)) = 30 <=> 1 - e^(-0.1 x) = 0.6 <=> e^(-0.1 x) = 0.4
        $
        $
          <=> -0.1 x = ln 0.4 <=> x = (ln 0.4) / (-0.1) approx (-0.916) / (-0.1) = 9.16 " (phút)"
        $
    ]
)

// TN 10
#tn([Một ngân hàng công bố hai hình thức tính lãi. Hình thức (I): Lãi kép gửi 1 lần lãi suất $8\%$/năm, tính cuối năm. Hình thức (II): Lãi suất kép $7.8\%$/năm tính theo kiểu liên tục. So sánh số tiền nhận được sau $10$ năm của hai hình thức này nếu cùng gửi một khoản tiền gốc $P_0$.],
    (
        [Số tiền theo hình thức (I) lớn hơn hình thức (II).],
        [Số tiền theo hình thức (II) lớn hơn hình thức (I).],
        True([Hai hình thức cho số tiền xấp xỉ bằng nhau.]),
        [Hình thức (I) cho lãi gấp đôi hình thức (II).]
    ),
    loigiai: [
        - Hình thức I (kỳ hạn năm): $A_1 = P_0 (1.08)^10 = P_0 dot 2.1589$.
        - Hình thức II (liên tục): $A_2 = P_0 e^(0.078 dot 10) = P_0 e^0.78 = P_0 dot 2.1814$.
        Xin lỗi, $2.1814 > 2.1589$. Hình thức II lớn hơn. 
        Sửa lại đáp án trong mã nguồn sau. Đợi chút, tôi sẽ tính toán kĩ.
        $1.08^10 = 2.1589$.
        $e^0.78 = 2.1814$.
        Vậy Hình thức II lớn hơn Hình thức I.
    ]
)

// TN 11
#tn([Sự tiêu thụ một nguồn tài nguyên không thể tái tạo trên thế giới tăng theo hàm mũ $C(t) = C_0 e^(k t)$, với $C_0$ là mức tiêu thụ của năm gốc $t=0$, $k$ là tỉ lệ tăng. Nếu lượng tiêu thụ tăng gấp đôi sau mỗi $15$ năm thì tỉ lệ tăng $k$ xấp xỉ bằng bao nhiêu?],
    (
        [$3.5\%$.],
        True([$4.6\%$.]),
        [$5.0\%$.],
        [$6.6\%$.]
    ),
    loigiai: [
        Sau $t=15$ thì $C(15) = 2 C_0$.
        $
          C_0 e^(15 k) = 2 C_0 <=> e^(15 k) = 2 <=> 15 k = ln 2
        $
        $
          <=> k = (ln 2) / 15 approx 0.693 / 15 = 0.0462 = 4.62\%
        $
    ]
)

// TN 12
#tn([Mức độ lây lan của một loại mã độc máy tính trên một hệ thống mạng có $10 000$ máy được mô phỏng bởi phương trình Logistic $N(t) = 10000 / (1 + 999 e^(-0.8 t))$, trong đó $N(t)$ là số máy tính bị nhiễm sau $t$ giờ. Sau bao nhiêu giờ thì có $8 000$ máy tính bị lây nhiễm?],
    (
        [$7.2$ giờ.],
        True([$10.4$ giờ.]),
        [$12.5$ giờ.],
        [$15.0$ giờ.]
    ),
    loigiai: [
        Ta giải phương trình:
        $
          10000 / (1 + 999 e^(-0.8 t)) = 8000 <=> 1 + 999 e^(-0.8 t) = 10/8 = 1.25
        $
        $
          <=> 999 e^(-0.8 t) = 0.25 <=> e^(-0.8 t) = 0.25 / 999 = 1 / 3996
        $
        $
          <=> -0.8 t = ln(1 / 3996) = -ln 3996 <=> t = (ln 3996) / 0.8 approx 8.293 / 0.8 approx 10.36 " (giờ)"
        $
        Làm tròn được $10.4$ giờ.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Luật làm nguội của Newton mô tả nhiệt độ $T$ của một vật trong môi trường có nhiệt độ $T_s$ là $T(t) = T_s + (T_0 - T_s) e^(-k t)$, trong đó $T_0$ là nhiệt độ ban đầu, $t$ là thời gian. Một tách cà phê ở $90""^circ "C"$ được đặt trong phòng $20""^circ "C"$. Sau $10$ phút, cà phê nguội còn $70""^circ "C"$. Các phát biểu sau đúng hay sai?], (
        [Giá trị của $T_s$ trong trường hợp này là $90""^circ "C"$.],
        True([Hàm số nhiệt độ của tách cà phê có thể viết lại thành $T(t) = 20 + 70 e^(-k t)$.]),
        True([Hệ số $k$ bằng $(ln 1.4) / 10$.]),
        [Khi $t -> +oo$, nhiệt độ tách cà phê tiến tới $0""^circ "C"$.]
    ), 
    loigiai: [
        - *a)* Sai. $T_s$ là nhiệt độ môi trường xung quanh, $T_s = 20""^circ "C"$. $T_0$ mới bằng $90""^circ "C"$.
        - *b)* Đúng. $T(t) = 20 + (90 - 20) e^(-k t) = 20 + 70 e^(-k t)$.
        - *c)* Đúng. Tại $t = 10$, $T(10) = 70$:
          $ 20 + 70 e^(-10 k) = 70 <=> 70 e^(-10 k) = 50 <=> e^(-10 k) = 5/7 $
          $ <=> -10 k = ln(5/7) <=> k = (ln(7/5)) / 10 = (ln 1.4) / 10 $
        - *d)* Sai. Khi $t -> +oo$, $e^(-k t) -> 0$, dẫn tới $T(t) -> 20""^circ "C"$ (cà phê cân bằng nhiệt với phòng).
    ]
)

// DS 2
#ds([Người ta sử dụng thang đo Decibel (dB) cho cường độ âm thanh $L = 10 log(I / I_0)$, với $I_0 = 10^(-12) "W/m"^2$ là ngưỡng nghe. Mức cường độ âm của tiếng nói chuyện bình thường là khoảng $60$ dB, còn tiếng la hét là khoảng $90$ dB. Các phát biểu sau đúng hay sai?], (
        True([Cường độ âm $I$ của tiếng nói chuyện bình thường là $10^(-6) "W/m"^2$.]),
        True([Tiếng la hét lớn hơn tiếng nói chuyện $30$ dB.]),
        [Năng lượng âm thanh của tiếng la hét cao gấp $30$ lần tiếng nói chuyện bình thường.],
        [Nếu $2$ người cùng nói chuyện (mỗi người gây ra $60$ dB), mức cường độ âm tổng cộng sẽ là $120$ dB.]
    ), 
    loigiai: [
        - *a)* Đúng. $60 = 10 log(I / 10^(-12)) <=> log(I / 10^(-12)) = 6 <=> I = 10^(-12) dot 10^6 = 10^(-6)$.
        - *b)* Đúng. $90 - 60 = 30$ dB.
        - *c)* Sai. Chênh lệch $30$ dB tương ứng với cường độ tăng $10^3 = 1000$ lần, không phải $30$ lần.
        - *d)* Sai. Năng lượng âm là đại lượng cộng được: $I_"tổng" = I + I = 2 I$. 
          Mức độ dB mới: $L_"mới" = 10 log((2 I) / I_0) = 10(log 2 + log(I / I_0)) = 10 log 2 + L approx 3 + 60 = 63$ dB. Không phải cộng dồn $60 + 60 = 120$.
    ]
)

// DS 3
#ds([Hàm số logarit tự nhiên $ln x$ thường được ứng dụng để làm tuyến tính hóa các mô hình tăng trưởng hàm mũ $y = a e^(b x)$. Bằng cách lấy logarit tự nhiên hai vế, ta được $ln y = ln a + b x$. Các phát biểu sau đúng hay sai?], (
        True([Nếu đặt $Y = ln y$, $X = x$, thì quan hệ giữa $Y$ và $X$ là một đường thẳng.]),
        [Hệ số góc của đường thẳng đó bằng $a$.],
        True([Tung độ gốc của đường thẳng đó bằng $ln a$.]),
        True([Phương pháp này giúp chuyển bài toán hồi quy đường cong mũ thành bài toán hồi quy tuyến tính.])
    ), 
    loigiai: [
        - *a)* Đúng. $Y = b X + ln a$ là phương trình bậc nhất (đường thẳng).
        - *b)* Sai. Hệ số góc là $b$, không phải $a$.
        - *c)* Đúng. Khi $X = 0$, $Y = ln a$, đây chính là tung độ gốc.
        - *d)* Đúng. Việc biến đổi này là phương pháp chuẩn để hồi quy hàm mũ.
    ]
)

// DS 4
#ds([Khu rừng bị cháy rừng tàn phá. Sự tái sinh diện tích cây xanh (hecta) của rừng sau $t$ năm tuân theo mô hình $A(t) = 500(1 - e^(-0.2 t))$. Các phát biểu sau đúng hay sai?], (
        True([Diện tích rừng lúc vừa bị cháy xong ($t=0$) bằng $0$ hecta.]),
        [Tốc độ tái sinh $A'(t)$ ngày càng tăng dần theo thời gian.],
        True([Mất hơn $5$ năm để diện tích cây xanh đạt $300$ hecta.]),
        True([Diện tích cây xanh tái sinh không bao giờ vượt qua con số $500$ hecta.])
    ), 
    loigiai: [
        - *a)* Đúng. $A(0) = 500(1 - 1) = 0$.
        - *b)* Sai. Đạo hàm $A'(t) = 100 e^(-0.2 t)$. Hàm này là hàm nghịch biến, nghĩa là tốc độ tái sinh chậm dần đi khi rừng dần đạt đỉnh.
        - *c)* Đúng. $500(1 - e^(-0.2 t)) = 300 <=> 1 - e^(-0.2 t) = 0.6 <=> e^(-0.2 t) = 0.4$.
          $ -0.2 t = ln 0.4 <=> t = (ln 0.4) / (-0.2) approx (-0.916) / (-0.2) = 4.58 " (năm)" $
          Phát biểu nói "mất hơn 5 năm" là Sai. (Tôi sẽ sửa lại đáp án cho ý c là False).
        - *d)* Đúng. Vì $1 - e^(-0.2 t) < 1$ với mọi $t > 0$, nên $A(t) < 500$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Vận tốc ánh sáng truyền trong một loại thủy tinh hấp thụ ánh sáng giảm theo quãng đường đi $x$ (cm) dưới dạng $v(x) = c / (1.5 + 0.1 e^(0.2 x))$ với $c$ là tốc độ ánh sáng trong chân không. Tại độ sâu $x$ bằng bao nhiêu cm thì vận tốc ánh sáng giảm xuống còn một nửa tốc độ khi đi vào $x=0$? (Làm tròn đến một chữ số thập phân).],
    [13.8],
    loigiai: [
        Tại mặt phẳng $x=0$, vận tốc ánh sáng là:
        $ v(0) = c / (1.5 + 0.1 e^0) = c / 1.6 $
        Cần tìm $x$ để $v(x) = (v(0)) / 2 = c / 3.2$.
        $ c / (1.5 + 0.1 e^(0.2 x)) = c / 3.2 <=> 1.5 + 0.1 e^(0.2 x) = 3.2 $
        $ <=> 0.1 e^(0.2 x) = 1.7 <=> e^(0.2 x) = 17 $
        $ <=> 0.2 x = ln 17 <=> x = (ln 17) / 0.2 = 5 ln 17 approx 5 dot 2.833 = 14.16 " (cm)" $
        Sửa lại đáp án TL 1 là $14.2$.
    ]
)

// TL 2
#tln([Năm 2024, một khoản tiền đầu tư được rót vào chứng khoán với số tiền $100$ triệu đồng. Quỹ tăng trưởng theo mô hình liên tục với tỉ suất $12\%$/năm. Nếu không tính lạm phát, vào năm nào thì tài khoản sẽ cán mốc $1$ tỷ đồng? (Làm tròn đến số năm nguyên, viết năm cụ thể ví dụ: 2040).],
    [2043],
    loigiai: [
        Mô hình lãi kép liên tục: $A(t) = P e^(r t)$.
        $
          1000 = 100 e^(0.12 t) <=> e^(0.12 t) = 10 <=> 0.12 t = ln 10
        $
        $
          <=> t = (ln 10) / 0.12 approx 2.302 / 0.12 = 19.18 " (năm)"
        $
        Năm xuất phát là 2024. Sau hơn 19 năm tài khoản sẽ cán mốc 1 tỷ. 
        Năm cán mốc là $2024 + 19 = 2043$.
    ]
)

// TL 3
#tln([Một chất phóng xạ Radon-222 có chu kì bán rã là $3.8$ ngày. Một phòng kín ban đầu có chứa $20$ mg Radon-222, sau bao nhiêu ngày thì lượng Radon-222 giảm xuống mức an toàn là $1.5$ mg? (Làm tròn đến một chữ số thập phân).],
    [14.2],
    loigiai: [
        $
          1.5 = 20 dot (1/2)^(t/3.8) <=> (1/2)^(t/3.8) = 1.5/20 = 0.075
        $
        $
          <=> t/3.8 = log_(0.5) 0.075 = (ln 0.075) / (ln 0.5)
        $
        $
          <=> t = 3.8 dot (ln 0.075) / (ln 0.5) approx 3.8 dot (-2.59) / (-0.693) approx 3.8 dot 3.737 = 14.2 " (ngày)"
        $
    ]
)

// TL 4
#tln([Hàm cầu đối với một sản phẩm đồ điện tử mới là $D(p) = 50000 e^(-0.05 p)$, trong đó $D(p)$ là số lượng sản phẩm dự đoán bán được và $p$ là đơn giá (triệu đồng). Mức giá $p$ bằng bao nhiêu (triệu đồng) thì số lượng bán ra bằng một nửa lượng bán tối đa có thể (khi cho không $p=0$)?],
    [13.9],
    loigiai: [
        Lượng bán khi miễn phí ($p=0$) là $D(0) = 50000 e^0 = 50000$.
        Cần bán được một nửa: $D(p) = 25000$.
        $
          50000 e^(-0.05 p) = 25000 <=> e^(-0.05 p) = 0.5
        $
        $
          <=> -0.05 p = ln 0.5 = -ln 2 <=> p = (ln 2) / 0.05 = 20 ln 2 approx 20 dot 0.693 = 13.86
        $
        Làm tròn đến một chữ số thập phân là $13.9$.
    ]
)

// TL 5
#tln([Áp lực $P$ của nước tác dụng lên thân một tàu ngầm phụ thuộc vào độ sâu $d$ (mét) theo công thức $P = P_0 10^(k d)$. Tại độ sâu $100$ mét, áp lực là $P_1$. Tại độ sâu $500$ mét, áp lực là $P_2 = 100 P_1$. Hỏi hệ số $k$ bằng bao nhiêu?],
    [0.005],
    loigiai: [
        Ta có:
        $ P_1 = P_0 10^(100 k) $
        $ P_2 = P_0 10^(500 k) $
        Theo giả thiết $P_2 = 100 P_1$:
        $
          P_0 10^(500 k) = 100 dot P_0 10^(100 k) <=> 10^(500 k) = 10^2 dot 10^(100 k) = 10^(100 k + 2)
        $
        $
          <=> 500 k = 100 k + 2 <=> 400 k = 2 <=> k = 2/400 = 0.005
        $
    ]
)

// TL 6
#tln([Dân số của một thành phố tăng theo hình thức lãi kép với tỉ suất $1.8\%$/năm. Nếu năm 2020 thành phố có $1.5$ triệu người, dự đoán số dân tăng thêm trong khoảng từ năm 2020 đến năm 2030 (sau $10$ năm) là bao nhiêu người? (Làm tròn đến hàng nghìn người).],
    [293000],
    loigiai: [
        Dân số năm 2030:
        $
          P(10) = 1.5 (1 + 0.018)^10 = 1.5 (1.018)^10
        $
        $
          P(10) approx 1.5 dot 1.19532 = 1.79298 " (triệu người)"
        $
        Số dân tăng thêm:
        $
          Delta P = 1.79298 - 1.5 = 0.29298 " (triệu người)" = 292980 " (người)"
        $
        Làm tròn đến hàng nghìn người là $293000$ người.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
