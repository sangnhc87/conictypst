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
  school: "ÔN TẬP CHƯƠNG 2",
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 03 - TOÁN THỰC TẾ)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Năng lượng $E$ (Joule) giải phóng từ một trận động đất có độ lớn $M$ (độ Richter) được tính theo công thức $log E = 11.4 + 1.5 M$. Một trận động đất $7$ độ Richter giải phóng năng lượng gấp bao nhiêu lần so với trận động đất $5$ độ Richter?],
    (
        [$100$ lần.],
        True([$1000$ lần.]),
        [$10^(1.5)$ lần.],
        [$10^5$ lần.]
    ),
    loigiai: [
        Gọi $E_1, E_2$ lần lượt là năng lượng của trận động đất 7 độ và 5 độ Richter.
        Ta có:
        $ log E_1 = 11.4 + 1.5 dot 7 $
        $ log E_2 = 11.4 + 1.5 dot 5 $
        Suy ra:
        $ log E_1 - log E_2 = 1.5(7 - 5) = 3 <=> log(E_1 / E_2) = 3 <=> E_1 / E_2 = 10^3 = 1000 $
    ]
)

// TN 2
#tn([Áp suất khí quyển $P$ (mmHg) giảm theo độ cao $h$ (km) so với mực nước biển theo công thức $P = 760 e^(-0.12 h)$. Ở độ cao $3$ km, áp suất khí quyển xấp xỉ bằng bao nhiêu?],
    (
        [$500$ mmHg.],
        True([$530$ mmHg.]),
        [$550$ mmHg.],
        [$560$ mmHg.]
    ),
    loigiai: [
        Thay $h = 3$ vào công thức, ta có: 
        $ P = 760 e^(-0.12 dot 3) = 760 e^(-0.36) approx 530.2 " (mmHg)" $
    ]
)

// TN 3
#tn([Một người gửi tiết kiệm $50$ triệu đồng theo thể thức lãi kép liên tục với lãi suất $6\%$/năm. Công thức tính số tiền nhận được sau $t$ năm là $A = P e^(r t)$, trong đó $P$ là vốn ban đầu, $r$ là lãi suất. Hỏi sau $10$ năm, người đó nhận được số tiền (cả vốn lẫn lãi) gần nhất với số nào sau đây?],
    (
        [$89$ triệu.],
        True([$91$ triệu.]),
        [$93$ triệu.],
        [$95$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức lãi kép liên tục với $P = 50$, $r = 0.06$, $t = 10$:
        $ A = 50 e^(0.06 dot 10) = 50 e^(0.6) approx 91.1 " (triệu đồng)" $
    ]
)

// TN 4
#tn([Một cốc cà phê có nhiệt độ $100^o C$ được đặt vào phòng có nhiệt độ $20^o C$. Theo định luật làm nguội của Newton, nhiệt độ của cốc cà phê sau $t$ phút là $T(t) = 20 + 80 e^(-0.05 t)$. Sau bao nhiêu phút thì nhiệt độ cốc cà phê giảm xuống còn $50^o C$?],
    (
        [$15.0$ phút.],
        [$17.5$ phút.],
        True([$19.6$ phút.]),
        [$21.5$ phút.]
    ),
    loigiai: [
        Ta giải phương trình: 
        $ 20 + 80 e^(-0.05 t) = 50 <=> 80 e^(-0.05 t) = 30 <=> e^(-0.05 t) = 0.375 $
        Suy ra:
        $ -0.05 t = ln 0.375 <=> t = (ln 0.375) / (-0.05) approx 19.6 " (phút)" $
    ]
)

// TN 5
#tn([Sự hấp thu của một loại thuốc trong cơ thể sau khi uống tuân theo công thức $m(t) = 50 e^(-0.2 t)$ (mg), trong đó $t$ là thời gian tính bằng giờ kể từ lúc uống. Sau $3$ giờ uống thuốc, lượng thuốc còn lại trong cơ thể là bao nhiêu?],
    (
        [$25.0$ mg.],
        True([$27.4$ mg.]),
        [$30.0$ mg.],
        [$32.5$ mg.]
    ),
    loigiai: [
        Thay $t = 3$ vào công thức: 
        $ m(3) = 50 e^(-0.2 dot 3) = 50 e^(-0.6) approx 27.4 " (mg)" $
    ]
)

// TN 6
#tn([Giá trị của một chiếc ô tô sau $t$ năm sử dụng giảm theo công thức $V(t) = V_0 (1 - 0.12)^t$, trong đó $V_0$ là giá trị ban đầu. Một chiếc xe mua mới với giá $800$ triệu đồng. Hỏi sau $5$ năm, chiếc xe đó còn lại giá trị khoảng bao nhiêu?],
    (
        [$400$ triệu.],
        True([$422$ triệu.]),
        [$450$ triệu.],
        [$480$ triệu.]
    ),
    loigiai: [
        Thay $V_0 = 800$, $t = 5$ vào công thức: 
        $ V(5) = 800 (1 - 0.12)^5 = 800 dot 0.88^5 approx 422.2 " (triệu đồng)" $
    ]
)

// TN 7
#tn([Doanh thu của một công ty (tỉ đồng) sau khi chi $x$ (triệu đồng) cho quảng cáo được mô hình hóa bởi hàm số $R(x) = 10 + 5 log_2 (x + 1)$. Nếu công ty chi $15$ triệu đồng cho quảng cáo thì doanh thu ước tính là bao nhiêu?],
    (
        [$25$ tỉ đồng.],
        True([$30$ tỉ đồng.]),
        [$35$ tỉ đồng.],
        [$40$ tỉ đồng.]
    ),
    loigiai: [
        Thay $x = 15$ vào hàm số: 
        $ R(15) = 10 + 5 log_2 (15 + 1) = 10 + 5 log_2 (16) = 10 + 5 dot 4 = 30 " (tỉ đồng)" $
    ]
)

// TN 8
#tn([Một người gửi $100$ triệu đồng vào ngân hàng với lãi suất $7\%$/năm. Biết rằng nếu không rút tiền ra khỏi ngân hàng thì cứ sau mỗi năm, số tiền lãi sẽ được nhập vào vốn ban đầu (lãi kép). Hỏi sau đúng $5$ năm, người đó nhận được số tiền (cả vốn lẫn lãi) gần nhất với số tiền nào dưới đây?],
    (
        [$135$ triệu đồng.],
        [$138$ triệu đồng.],
        True([$140$ triệu đồng.]),
        [$145$ triệu đồng.]
    ),
    loigiai: [
        Số tiền người đó nhận được sau $5$ năm là:
        $ A = 100(1 + 0.07)^5 = 100 dot 1.07^5 approx 140.255 " (triệu đồng)" $
    ]
)

// TN 9
#tn([Cường độ âm chuẩn là $I_0 = 10^(-12) "W/m"^2$. Mức cường độ âm $L$ (đơn vị dB) của một âm có cường độ $I$ được cho bởi $L = 10 log(I/I_0)$. Tiếng ồn của một động cơ phản lực có cường độ âm $I = 10^2 "W/m"^2$. Mức cường độ âm của động cơ này là],
    (
        [$120$ dB.],
        [$130$ dB.],
        True([$140$ dB.]),
        [$150$ dB.]
    ),
    loigiai: [
        Áp dụng công thức: 
        $ L = 10 log(I/I_0) = 10 log(10^2 / 10^(-12)) = 10 log(10^14) = 10 dot 14 = 140 " (dB)" $
    ]
)

// TN 10
#tn([Để đo độ pH của một dung dịch, người ta dùng công thức $"pH" = -log[H^+]$, trong đó $[H^+]$ là nồng độ ion Hydrogen (mol/L). Một dung dịch có nồng độ ion Hydrogen là $2.5 dot 10^(-4)$ mol/L. Độ pH của dung dịch này xấp xỉ bằng],
    (
        [$3.2$.],
        [$3.4$.],
        True([$3.6$.]),
        [$3.8$.]
    ),
    loigiai: [
        Thay $[H^+] = 2.5 dot 10^(-4)$ vào công thức: 
        $ "pH" = -log(2.5 dot 10^(-4)) approx 3.60 $
    ]
)

// TN 11
#tn([Tốc độ lan truyền của một tin đồn trên mạng xã hội được mô hình hóa bởi hàm số $N(t) = 1000 / (1 + 999 e^(-0.5 t))$, trong đó $N(t)$ là số người biết tin đồn sau $t$ giờ. Sau bao lâu thì có $500$ người biết tin đồn này?],
    (
        [$12.0$ giờ.],
        True([$13.8$ giờ.]),
        [$15.0$ giờ.],
        [$17.5$ giờ.]
    ),
    loigiai: [
        Ta giải phương trình: 
        $ 1000 / (1 + 999 e^(-0.5 t)) = 500 <=> 1 + 999 e^(-0.5 t) = 2 <=> 999 e^(-0.5 t) = 1 $
        Suy ra:
        $ e^(-0.5 t) = 1/999 <=> -0.5 t = ln(1/999) <=> t = (ln(1/999)) / (-0.5) approx 13.8 " (giờ)" $
    ]
)

// TN 12
#tn([Chu kì bán rã của Carbon-14 là khoảng $5730$ năm. Khối lượng còn lại của nó được tính theo công thức $m = m_0 (1/2)^(t/5730)$, với $m_0$ là khối lượng ban đầu. Một mảnh xương hóa thạch chứa lượng Carbon-14 chỉ còn bằng $12.5\%$ so với lúc sinh vật còn sống. Tuổi của mảnh xương đó là],
    (
        [$11460$ năm.],
        True([$17190$ năm.]),
        [$22920$ năm.],
        [$28650$ năm.]
    ),
    loigiai: [
        Ta có $m / m_0 = 12.5\% = 0.125 = 1/8$.
        Suy ra:
        $ (1/2)^(t/5730) = 1/8 <=> (1/2)^(t/5730) = (1/2)^3 <=> t / 5730 = 3 <=> t = 5730 dot 3 = 17190 " (năm)" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Số người mắc một bệnh truyền nhiễm sau $t$ ngày được lập mô hình bởi $N(t) = 5000 / (1 + 49 e^(-0.2 t))$. Các phát biểu sau đúng hay sai?], (
        True([Số người mắc bệnh lúc ban đầu ($t=0$) là $100$ người.]),
        True([Sau $10$ ngày, có khoảng $834$ người mắc bệnh.]),
        True([Mô hình này dự báo số người mắc bệnh không bao giờ vượt quá $5000$ người.]),
        [Cần ít nhất $25$ ngày để số người mắc bệnh vượt qua mốc $2500$ người.]
    ), 
    loigiai: [
        - *a)* Đúng. Khi $t = 0$:
          $ N(0) = 5000 / (1 + 49 e^0) = 5000 / 50 = 100 $
        - *b)* Đúng. Khi $t = 10$:
          $ N(10) = 5000 / (1 + 49 e^(-2)) approx 5000 / (1 + 49 dot 0.135) approx 834 $
        - *c)* Đúng. Vì $1 + 49 e^(-0.2 t) > 1$ với mọi $t >= 0$, nên:
          $ N(t) = 5000 / (1 + 49 e^(-0.2 t)) < 5000 $
        - *d)* Sai. Để số người vượt $2500$, ta giải:
          $ N(t) > 2500 <=> 5000 / (1 + 49 e^(-0.2 t)) > 2500 <=> 1 + 49 e^(-0.2 t) < 2 $
          $ <=> 49 e^(-0.2 t) < 1 <=> e^(-0.2 t) < 1/49 $
          $ <=> -0.2 t < ln(1/49) <=> t > (ln(1/49)) / (-0.2) approx 19.46 $
          Do đó chỉ cần sang ngày thứ 20. Phát biểu nói "cần ít nhất 25 ngày" là sai.
    ]
)

// DS 2
#ds([Diện tích rừng của một tỉnh tính từ năm 2020 được dự báo theo công thức $S(t) = S_0 e^(r t)$, trong đó $S_0$ là diện tích năm 2020, $r$ là hệ số tăng trưởng hàng năm, $t$ là số năm tính từ 2020. Biết năm 2020 diện tích là $300 000$ ha, năm 2023 diện tích đạt $315 000$ ha. Các phát biểu sau đúng hay sai?], (
        True([Hệ số tăng trưởng $r approx 0.0163$.]),
        True([Theo mô hình, diện tích rừng năm 2030 ước tính khoảng $353 000$ ha.]),
        True([Sau khoảng $42$ năm kể từ 2020 thì diện tích rừng sẽ tăng gấp đôi.]),
        [Cần đến năm 2040 thì diện tích rừng mới vượt mốc $400 000$ ha.]
    ), 
    loigiai: [
        - *a)* Đúng. $t = 3$, $S(3) = 315000$.
          $ 300000 e^(3 r) = 315000 <=> e^(3 r) = 1.05 <=> r = (ln 1.05)/3 approx 0.0163 $
        - *b)* Đúng. Năm 2030 ($t = 10$):
          $ S(10) = 300000 e^(0.0163 dot 10) = 300000 e^(0.163) approx 353000 " (ha)" $
        - *c)* Đúng. $S(t) = 2 S_0$:
          $ e^(0.0163 t) = 2 <=> t = (ln 2)/0.0163 approx 42.5 " (năm)" $
        - *d)* Sai. $S(t) = 400000$:
          $ 300000 e^(0.0163 t) = 400000 <=> e^(0.0163 t) = 4/3 <=> t = (ln(4/3))/0.0163 approx 17.6 " (năm)" $
          Vậy đến khoảng năm $2020 + 17.6 = 2037$ là đã vượt mốc $400 000$ ha.
    ]
)

// DS 3
#ds([Dân số của một quốc gia A được dự báo theo công thức $P(t) = P_0 e^(r t)$, trong đó $P_0$ là dân số ban đầu (tại năm 2020), $r$ là tỉ lệ tăng dân số hàng năm, $t$ là số năm tính từ 2020. Biết năm 2020 dân số là $95$ triệu người, và tỉ lệ tăng là $1.2\%$/năm ($r = 0.012$). Các phát biểu sau đúng hay sai?], (
        True([Dân số năm 2030 (sau 10 năm) được tính bởi công thức $P(10) = 95 e^(0.12)$ (triệu người).]),
        [Dân số năm 2030 dự kiến lớn hơn $110$ triệu người.],
        True([Để dân số đạt mốc $120$ triệu người thì cần $t = (ln(120/95)) / 0.012$ năm.]),
        True([Theo mô hình, dân số sẽ gấp đôi sau khoảng thời gian $t = (ln 2) / 0.012$ năm.])
    ), 
    loigiai: [
        - *a)* Đúng. $t = 10$, thay vào công thức ta có:
          $ P(10) = 95 e^(0.012 dot 10) = 95 e^(0.12) $
        - *b)* Sai. Bấm máy tính:
          $ P(10) = 95 e^(0.12) approx 107.1 " (triệu người)" $
          Nhỏ hơn $110$ triệu người.
        - *c)* Đúng. $P(t) = 120$:
          $ 95 e^(0.012 t) = 120 <=> e^(0.012 t) = 120/95 <=> 0.012 t = ln(120/95) <=> t = (ln(120/95)) / 0.012 $
        - *d)* Đúng. Để dân số gấp đôi, $P(t) = 2 P_0$:
          $ e^(0.012 t) = 2 <=> 0.012 t = ln 2 <=> t = (ln 2) / 0.012 $
    ]
)

// DS 4
#ds([Nồng độ cồn trong máu (BAC) của một người sau khi uống rượu giảm theo quy luật hàm số mũ $C(t) = C_0 e^(-0.15 t)$, trong đó $C_0$ là nồng độ cồn ban đầu lúc vừa uống xong, $t$ tính bằng giờ. Các phát biểu sau đúng hay sai?], (
        [Nồng độ cồn giảm đi đúng $15\%$ mỗi giờ so với nồng độ cồn ban đầu.],
        True([Nếu $C_0 = 100$ mg/100ml, sau 3 giờ nồng độ cồn còn khoảng $63.8$ mg/100ml.]),
        True([Thời gian cần thiết để nồng độ cồn giảm đi một nửa không phụ thuộc vào nồng độ ban đầu.]),
        [Nếu giới hạn cho phép để lái xe là $35$ mg/100ml và $C_0 = 80$ mg/100ml, người đó chỉ cần đợi $4$ giờ là có thể lái xe.]
    ), 
    loigiai: [
        - *a)* Sai. Hàm giảm theo $e^(-0.15 t)$, sau $1$ giờ còn lại:
          $ e^(-0.15) approx 0.86 $ lượng cũ. 
          Tức là giảm đi khoảng $14\%$/giờ, không phải $15\%$.
        - *b)* Đúng. $t = 3$:
          $ C(3) = 100 e^(-0.15 dot 3) = 100 e^(-0.45) approx 63.76 " (mg/100ml)" $
        - *c)* Đúng.
          $ C_0 e^(-0.15 t) = 0.5 C_0 <=> e^(-0.15 t) = 0.5 <=> t = (ln 0.5) / (-0.15) $
          Không phụ thuộc $C_0$.
        - *d)* Sai. Sau $4$ giờ, nồng độ cồn là:
          $ C(4) = 80 e^(-0.15 dot 4) = 80 e^(-0.6) approx 43.9 > 35 $
          Người đó vẫn chưa được phép lái xe.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một vật được làm lạnh từ $80^o C$ xuống môi trường có nhiệt độ $20^o C$. Nhiệt độ $T$ của vật sau $t$ phút tuân theo công thức $T(t) = 20 + 60 e^(-0.1 t)$. Sau bao lâu (tính bằng phút) thì nhiệt độ của vật giảm xuống còn $40^o C$? (Làm tròn kết quả đến một chữ số thập phân).],
    [11.0],
    loigiai: [
        Ta giải phương trình: 
        $ 20 + 60 e^(-0.1 t) = 40 <=> 60 e^(-0.1 t) = 20 <=> e^(-0.1 t) = 1/3 $
        Suy ra:
        $ -0.1 t = ln(1/3) <=> t = (ln(1/3)) / (-0.1) = ln 3 / 0.1 approx 11.0 " (phút)" $
    ]
)

// TL 2
#tln([Đồng vị phóng xạ Iodine-131 được sử dụng trong y tế có chu kỳ bán rã là $8$ ngày. Ban đầu bệnh viện nhận được một mẫu chứa $50$ gam Iodine-131. Cần ít nhất bao nhiêu ngày để lượng Iodine-131 còn lại trong mẫu nhỏ hơn $5$ gam? (Kết quả làm tròn đến hàng đơn vị).],
    [27],
    loigiai: [
        Công thức khối lượng còn lại là $m(t) = 50 (1/2)^(t/8)$. Để lượng còn lại nhỏ hơn $5$ gam: 
        $ 50 (1/2)^(t/8) < 5 <=> (1/2)^(t/8) < 0.1 $
        $ <=> t/8 > log_(0.5)(0.1) <=> t > 8 dot log_(0.5)(0.1) approx 26.57 $
        Vậy cần ít nhất $27$ ngày.
    ]
)

// TL 3
#tln([Một người gửi $200$ triệu đồng vào ngân hàng với lãi suất $6.5\%$/năm theo hình thức lãi kép, tiền lãi mỗi năm được nhập vào vốn. Hỏi sau ít nhất bao nhiêu năm người đó nhận được số tiền lãi (chỉ tính phần lãi) vượt quá $100$ triệu đồng?],
    [7],
    loigiai: [
        Số tiền cả vốn lẫn lãi sau $n$ năm là $A = 200(1 + 0.065)^n = 200(1.065)^n$.
        Số tiền lãi thu được là $A - 200 = 200(1.065)^n - 200$.
        Để tiền lãi vượt $100$ triệu: 
        $ 200(1.065)^n - 200 > 100 <=> 200(1.065)^n > 300 $
        $ <=> (1.065)^n > 1.5 <=> n > log_1.065 (1.5) approx 6.4 $
        Vậy cần ít nhất $7$ năm.
    ]
)

// TL 4
#tln([Cường độ ánh sáng khi đi qua môi trường nước giảm dần theo công thức $I = I_0 e^(-0.2 x)$, trong đó $I_0$ là cường độ ánh sáng tại mặt nước, $x$ là độ sâu tính bằng mét. Một rạn san hô cần ánh sáng có cường độ tối thiểu bằng $30\%$ cường độ ánh sáng mặt nước để có thể quang hợp. Rạn san hô có thể sống ở độ sâu tối đa là bao nhiêu mét? (Làm tròn đến hàng phần mười).],
    [6.0],
    loigiai: [
        Ta có điều kiện: $I >= 0.3 I_0$.
        $ I_0 e^(-0.2 x) >= 0.3 I_0 <=> e^(-0.2 x) >= 0.3 $
        $ <=> -0.2 x >= ln 0.3 <=> x <= (ln 0.3) / (-0.2) approx 6.019 $
        Vậy rạn san hô có thể sống ở độ sâu tối đa khoảng $6.0$ m.
    ]
)

// TL 5
#tln([Số lượng vi khuẩn trong một quần thể sau $t$ giờ kể từ lúc bắt đầu nuôi cấy được tính bởi công thức $N(t) = 500 e^(0.4 t)$. Hỏi sau ít nhất bao nhiêu giờ thì số lượng vi khuẩn đạt mốc $4000$ con? (Làm tròn đến hàng phần mười).],
    [5.2],
    loigiai: [
        Ta cần giải phương trình:
        $ 500 e^(0.4 t) = 4000 <=> e^(0.4 t) = 8 $
        $ <=> 0.4 t = ln 8 <=> t = (ln 8) / 0.4 approx 5.2 " (giờ)" $
    ]
)

// TL 6
#tln([Carbon-14 phân rã với chu kỳ bán rã là $5730$ năm. Hàm lượng Carbon-14 trong một hóa thạch cổ chỉ còn bằng $25\%$ so với hàm lượng ban đầu khi sinh vật còn sống. Tuổi của hóa thạch đó là bao nhiêu năm?],
    [11460],
    loigiai: [
        Sử dụng công thức $m = m_0 (1/2)^(t/T)$, trong đó $T = 5730$.
        $ m / m_0 = 25\% = 1/4 = (1/2)^2 $
        Suy ra:
        $ (1/2)^(t/5730) = (1/2)^2 <=> t / 5730 = 2 <=> t = 11460 " (năm)" $
    ]
)
]
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
