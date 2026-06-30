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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 04 - MÔ HÌNH TOÁN HỌC)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Cường độ sáng $I$ của một nguồn sáng khi đi qua một lớp kính bị giảm đi $5\%$. Nếu nguồn sáng đó đi qua liên tiếp $3$ lớp kính như vậy thì cường độ sáng còn lại xấp xỉ bao nhiêu phần trăm so với ban đầu?],
    (
        [$85\%$],
        True([$85.7\%$]),
        [$86\%$],
        [$95\%$]
    ),
    loigiai: [
        Sau khi qua một lớp kính, cường độ sáng còn lại là $100\% - 5\% = 95\% = 0.95$ cường độ ban đầu.
        Sau khi qua $3$ lớp kính, cường độ sáng còn lại là:
        $ I_3 = I_0 dot 0.95^3 approx 0.857375 I_0 approx 85.7\% I_0 $
    ]
)

// TN 2
#tn([Độ sáng biểu kiến (magnitude) của một ngôi sao được đo bằng công thức $m = -2.5 log(I / I_0)$, trong đó $I$ là cường độ sáng của ngôi sao đó, $I_0$ là cường độ sáng chuẩn. Nếu ngôi sao A có cường độ sáng gấp $100$ lần ngôi sao B, thì chênh lệch độ sáng biểu kiến giữa hai ngôi sao là bao nhiêu? (Độ sáng biểu kiến nhỏ hơn tương ứng với ngôi sao sáng hơn).],
    (
        True([$5$]),
        [$2.5$],
        [$100$],
        [$250$]
    ),
    loigiai: [
        Ta có:
        $ m_A = -2.5 log(I_A / I_0) $
        $ m_B = -2.5 log(I_B / I_0) $
        Suy ra:
        $ m_B - m_A = 2.5 log(I_A / I_0) - 2.5 log(I_B / I_0) = 2.5 log(I_A / I_B) $
        Vì $I_A = 100 I_B$ nên $I_A / I_B = 100 = 10^2$.
        Suy ra:
        $ m_B - m_A = 2.5 log(10^2) = 2.5 dot 2 = 5 $
    ]
)

// TN 3
#tn([Một chất phóng xạ có chu kì bán rã là $12$ giờ. Ban đầu có $200$ gam chất này. Hỏi sau đúng $2$ ngày rưỡi ($60$ giờ) lượng chất phóng xạ còn lại là bao nhiêu gam?],
    (
        [$3.125$ gam.],
        True([$6.25$ gam.]),
        [$12.5$ gam.],
        [$25$ gam.]
    ),
    loigiai: [
        Áp dụng công thức phân rã: $m(t) = m_0 (1/2)^(t/T)$.
        Thay $m_0 = 200$, $T = 12$, $t = 60$:
        $ m(60) = 200 (1/2)^(60/12) = 200 (1/2)^5 = 200 / 32 = 6.25 " (gam)" $
    ]
)

// TN 4
#tn([Một doanh nghiệp dự báo doanh thu của mình trong những năm tới sẽ tăng trưởng đều đặn $8\%$/năm. Hỏi sau khoảng bao nhiêu năm thì doanh thu của doanh nghiệp này sẽ tăng gấp đôi so với hiện tại?],
    (
        [$8$ năm.],
        True([$9$ năm.]),
        [$10$ năm.],
        [$12.5$ năm.]
    ),
    loigiai: [
        Gọi $A$ là doanh thu ban đầu. Doanh thu sau $n$ năm là $A(1 + 0.08)^n = A(1.08)^n$.
        Để doanh thu tăng gấp đôi: 
        $ A(1.08)^n = 2 A <=> 1.08^n = 2 $
        $ <=> n = log_1.08 (2) approx 9.006 $
        Vậy sau khoảng $9$ năm.
    ]
)

// TN 5
#tn([Trong một phòng thí nghiệm sinh học, số lượng của một loài vi khuẩn được nuôi cấy tăng theo mô hình hàm số mũ. Ban đầu có $1000$ vi khuẩn, sau $4$ giờ số lượng vi khuẩn là $3000$. Hỏi sau bao lâu kể từ lúc ban đầu thì số lượng vi khuẩn đạt $27000$?],
    (
        [$8$ giờ.],
        [$10$ giờ.],
        True([$12$ giờ.]),
        [$16$ giờ.]
    ),
    loigiai: [
        Mô hình tăng trưởng: $N(t) = N_0 dot k^t$. Theo bài ra $N_0 = 1000$.
        Sau 4 giờ: 
        $ N(4) = 1000 dot k^4 = 3000 <=> k^4 = 3 <=> k = root(4, 3) $
        Để $N(t) = 27000$:
        $ 1000 dot (root(4, 3))^t = 27000 <=> 3^(t/4) = 27 = 3^3 $
        Suy ra:
        $ t / 4 = 3 <=> t = 12 " (giờ)" $
    ]
)

// TN 6
#tn([Một người uống một lượng rượu, nồng độ cồn trong máu của người đó là $120$ mg/100ml. Nồng độ cồn giảm dần theo thời gian theo công thức $C(t) = 120 e^(-0.15 t)$, trong đó $t$ là số giờ tính từ thời điểm uống. Để nồng độ cồn giảm xuống dưới mức $20$ mg/100ml, người đó cần chờ ít nhất bao nhiêu giờ?],
    (
        [$9$ giờ.],
        [$10$ giờ.],
        [$11$ giờ.],
        True([$12$ giờ.])
    ),
    loigiai: [
        Yêu cầu bài toán: 
        $ C(t) < 20 <=> 120 e^(-0.15 t) < 20 <=> e^(-0.15 t) < 1/6 $
        Lấy logarit tự nhiên hai vế: 
        $ -0.15 t < ln(1/6) <=> -0.15 t < -ln 6 <=> t > (ln 6) / 0.15 approx 11.95 $
        Vậy cần ít nhất khoảng $12$ giờ.
    ]
)

// TN 7
#tn([Người ta ước tính rằng độ pH của một mẫu đất nông nghiệp là $5.4$. Để cải tạo đất sao cho độ pH tăng lên $6.5$, nồng độ ion Hydrogen $[H^+]$ trong đất phải giảm đi bao nhiêu lần? (Nhắc lại: $"pH" = -log[H^+]$).],
    (
        [$1.1$ lần.],
        [$11$ lần.],
        True([$12.6$ lần.]),
        [$15.8$ lần.]
    ),
    loigiai: [
        Độ pH ban đầu $5.4 => [H^+]_1 = 10^(-5.4)$.
        Độ pH lúc sau $6.5 => [H^+]_2 = 10^(-6.5)$.
        Tỉ lệ: 
        $ ([H^+]_1) / ([H^+]_2) = 10^(-5.4) / 10^(-6.5) = 10^1.1 approx 12.589 $
        Vậy nồng độ ion $H^+$ phải giảm đi khoảng $12.6$ lần.
    ]
)

// TN 8
#tn([Sự mất giá của một loại máy móc công nghiệp được tính theo công thức $V = V_0 e^(-k t)$, trong đó $V_0$ là giá mua ban đầu, $V$ là giá trị sau $t$ năm sử dụng. Biết rằng sau $4$ năm sử dụng, giá trị máy móc chỉ còn bằng một nửa giá mua ban đầu. Hỏi sau bao lâu thì giá trị máy móc chỉ còn bằng $10\%$ giá mua ban đầu?],
    (
        [$12.5$ năm.],
        True([$13.3$ năm.]),
        [$15.0$ năm.],
        [$16.6$ năm.]
    ),
    loigiai: [
        Sau 4 năm còn một nửa: 
        $ V_0 e^(-4 k) = 0.5 V_0 <=> e^(-4 k) = 0.5 $
        $ <=> -4 k = ln 0.5 = -ln 2 <=> k = (ln 2) / 4 $
        Cần tìm $t$ để $V = 0.1 V_0$:
        $ e^(-k t) = 0.1 <=> -k t = ln 0.1 = -ln 10 $
        $ <=> t = (ln 10) / k = (4 ln 10) / (ln 2) approx 13.287 $
        Vậy sau khoảng $13.3$ năm.
    ]
)

// TN 9
#tn([Mực nước biển dâng lên do hiện tượng nóng lên toàn cầu được một nhóm nghiên cứu lập mô hình $h(t) = 5 e^(0.02 t)$ (cm), trong đó $t$ là số năm tính từ năm 2020. Theo mô hình này, vào năm nào mực nước biển sẽ dâng lên thêm $10$ cm so với năm 2020?],
    (
        [$2050$.],
        True([$2054$.]),
        [$2055$.],
        [$2060$.]
    ),
    loigiai: [
        Ta có:
        $ h(t) = 10 <=> 5 e^(0.02 t) = 10 <=> e^(0.02 t) = 2 $
        $ <=> 0.02 t = ln 2 <=> t = (ln 2) / 0.02 approx 34.6 $
        Năm đạt mức $10$ cm là $2020 + 34.6 = 2054.6$. Vậy vào năm 2054.
    ]
)

// TN 10
#tn([Định luật làm nguội của Newton phát biểu rằng tốc độ làm nguội của một vật tỉ lệ thuận với độ chênh lệch nhiệt độ giữa vật và môi trường. Nếu một miếng kim loại nung nóng đến $150^o C$ và đặt trong không khí $30^o C$, nhiệt độ của nó sau $t$ phút là $T = 30 + 120 e^(-k t)$. Nếu sau $10$ phút nhiệt độ của nó là $90^o C$, thì hệ số $k$ xấp xỉ bằng bao nhiêu?],
    (
        [$0.051$.],
        True([$0.069$.]),
        [$0.075$.],
        [$0.082$.]
    ),
    loigiai: [
        Thay $t = 10$, $T = 90$ vào công thức: 
        $ 90 = 30 + 120 e^(-10 k) <=> 60 = 120 e^(-10 k) <=> e^(-10 k) = 0.5 $
        Suy ra:
        $ -10 k = ln 0.5 <=> k = (ln 0.5) / (-10) = (ln 2) / 10 approx 0.0693 $
    ]
)

// TN 11
#tn([Cường độ âm $I$ của một cuộc hội thoại bình thường là khoảng $10^(-6) "W/m"^2$, và của một tiếng hét là $10^(-4) "W/m"^2$. Nếu tính theo thang Decibel ($L = 10 log(I / 10^(-12))$), tiếng hét có mức cường độ âm lớn hơn cuộc hội thoại bình thường bao nhiêu dB?],
    (
        [$10$ dB.],
        True([$20$ dB.]),
        [$100$ dB.],
        [$200$ dB.]
    ),
    loigiai: [
        Mức cường độ âm của cuộc hội thoại: 
        $ L_1 = 10 log(10^(-6) / 10^(-12)) = 10 log(10^6) = 60 " (dB)" $
        Mức cường độ âm của tiếng hét: 
        $ L_2 = 10 log(10^(-4) / 10^(-12)) = 10 log(10^8) = 80 " (dB)" $
        Độ chênh lệch: 
        $ L_2 - L_1 = 80 - 60 = 20 " (dB)" $
    ]
)

// TN 12
#tn([Tỉ lệ phần trăm người dân nhớ một mẩu quảng cáo trên truyền hình sau $t$ ngày được cho bởi hàm số $R(t) = 80 - 15 ln(t+1)$. Sau bao nhiêu ngày thì chỉ còn dưới $20\%$ người dân nhớ mẩu quảng cáo này?],
    (
        [$50$ ngày.],
        True([$53$ ngày.]),
        [$55$ ngày.],
        [$60$ ngày.]
    ),
    loigiai: [
        Cần tìm $t$ sao cho:
        $ R(t) < 20 <=> 80 - 15 ln(t+1) < 20 <=> 15 ln(t+1) > 60 $
        $ <=> ln(t+1) > 4 <=> t + 1 > e^4 $
        Suy ra:
        $ t > e^4 - 1 approx 54.59 - 1 = 53.59 $
        Vậy từ ngày thứ $54$ trở đi, tức là sau $53$ ngày.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Số lượng một loài động vật hoang dã trong khu bảo tồn được mô hình hóa bởi $N(t) = 1200 / (1 + 11 e^(-0.15 t))$, trong đó $t$ là số năm tính từ lúc bắt đầu quan sát. Các phát biểu sau đúng hay sai?], (
        [Ban đầu ($t=0$) khu bảo tồn có $120$ cá thể.],
        True([Sau $10$ năm, số cá thể đạt khoảng $348$ con.]),
        True([Khu bảo tồn không thể chứa quá $1200$ cá thể của loài này.]),
        [Sau đúng $15$ năm, số cá thể đạt chính xác là $1000$ con.]
    ), 
    loigiai: [
        - *a)* Sai. Khi $t=0$:
          $ N(0) = 1200 / (1 + 11 e^0) = 1200 / 12 = 100 $
        - *b)* Đúng. Khi $t=10$:
          $ N(10) = 1200 / (1 + 11 e^(-1.5)) approx 1200 / (1 + 11 dot 0.2231) approx 1200 / 3.454 approx 347.4 $ 
        - *c)* Đúng. Vì $1 + 11 e^(-0.15 t) > 1$ với mọi $t >= 0$ nên $N(t) < 1200$. 
        - *d)* Sai. Để $N(t) = 1000$:
          $ 1200 / (1 + 11 e^(-0.15 t)) = 1000 <=> 1 + 11 e^(-0.15 t) = 1.2 $
          $ <=> 11 e^(-0.15 t) = 0.2 <=> e^(-0.15 t) = 0.2/11 = 1/55 $
          $ <=> -0.15 t = ln(1/55) <=> t = (ln 55)/0.15 approx 26.7 " (năm)" $
    ]
)

// DS 2
#ds([Mức độ lan tỏa của một loại virus máy tính lây nhiễm qua mạng được mô tả bằng hàm số $V(t) = 1000 dot 3^(0.5 t)$, trong đó $V(t)$ là số máy tính bị nhiễm sau $t$ giờ kể từ khi phát hiện con virus đầu tiên. Các phát biểu sau đúng hay sai?], (
        True([Lúc vừa phát hiện (t=0) đã có sẵn $1000$ máy tính bị nhiễm.]),
        True([Sau $2$ giờ, số máy tính bị nhiễm là $3000$ máy.]),
        [Mỗi giờ trôi qua, số lượng máy tính bị nhiễm tăng lên $3$ lần.],
        True([Cần $4$ giờ để số máy tính bị nhiễm đạt $9000$ máy.])
    ), 
    loigiai: [
        - *a)* Đúng. Khi $t = 0$:
          $ V(0) = 1000 dot 3^0 = 1000 $
        - *b)* Đúng. Khi $t = 2$:
          $ V(2) = 1000 dot 3^(0.5 dot 2) = 1000 dot 3^1 = 3000 $
        - *c)* Sai. Sau $1$ giờ:
          $ V(1) = 1000 dot 3^0.5 = 1000 sqrt(3) approx 1732 $
          Số lượng chỉ tăng lên $sqrt(3)$ lần mỗi giờ (khoảng $1.73$ lần).
        - *d)* Đúng. Giải $V(t) = 9000$:
          $ 1000 dot 3^(0.5 t) = 9000 <=> 3^(0.5 t) = 9 = 3^2 <=> 0.5 t = 2 <=> t = 4 $
    ]
)

// DS 3
#ds([Một công ty đầu tư $500$ triệu đồng vào một dự án với hi vọng thu lợi nhuận theo mô hình hàm số mũ $A(t) = 500 e^(0.12 t)$, trong đó $A(t)$ là tổng giá trị đầu tư và lợi nhuận sau $t$ năm (đơn vị: triệu đồng). Các phát biểu sau đúng hay sai?], (
        True([Sau $5$ năm, tổng giá trị thu được lớn hơn $900$ triệu đồng.]),
        True([Thời gian để tổng giá trị tăng gấp đôi (đạt $1000$ triệu) là khoảng $5.8$ năm.]),
        True([Tốc độ sinh lời của dự án là $12\%$/năm (theo hình thức lãi kép liên tục).]),
        [Nếu công ty muốn rút ra $1.5$ tỉ đồng thì phải đợi ít nhất $10$ năm.]
    ), 
    loigiai: [
        - *a)* Đúng. $t = 5$:
          $ A(5) = 500 e^(0.12 dot 5) = 500 e^(0.6) approx 500 dot 1.822 = 911 " (triệu đồng)" $
        - *b)* Đúng. Giải $A(t) = 1000$:
          $ 500 e^(0.12 t) = 1000 <=> e^(0.12 t) = 2 <=> t = (ln 2) / 0.12 approx 5.8 " (năm)" $
        - *c)* Đúng. Hệ số trong số mũ là $r = 0.12$, tương ứng với lãi suất liên tục $12\%$/năm.
        - *d)* Sai. $1.5$ tỉ $= 1500$ triệu. Giải $A(t) = 1500$:
          $ 500 e^(0.12 t) = 1500 <=> e^(0.12 t) = 3 <=> t = (ln 3) / 0.12 approx 9.15 " (năm)" $
          Chưa tới $10$ năm đã thu được $1.5$ tỉ.
    ]
)

// DS 4
#ds([Lượng khí CO2 thải ra của một nhà máy giảm dần qua các năm sau khi lắp đặt hệ thống lọc mới. Mô hình lượng khí thải là $E(t) = 5000 (0.8)^t$ (tấn), trong đó $t$ là số năm kể từ khi lắp đặt hệ thống. Các phát biểu sau đúng hay sai?], (
        True([Lượng khí thải giảm đi $20\%$ sau mỗi năm.]),
        True([Sau $3$ năm, lượng khí thải còn lại là $2560$ tấn.]),
        [Phải mất ít nhất $6$ năm để lượng khí thải giảm xuống dưới mức $1000$ tấn.],
        [Theo mô hình này, lượng khí thải sẽ về $0$ sau $15$ năm.]
    ), 
    loigiai: [
        - *a)* Đúng. Ta có tỉ lệ $E(t+1) / E(t) = 0.8$, tức là còn lại $80\%$, tương ứng giảm đi $20\%$ mỗi năm.
        - *b)* Đúng. Khi $t = 3$:
          $ E(3) = 5000 dot (0.8)^3 = 5000 dot 0.512 = 2560 " (tấn)" $
        - *c)* Sai. Giải $E(t) < 1000$:
          $ 5000 (0.8)^t < 1000 <=> 0.8^t < 0.2 <=> t > log_(0.8) (0.2) approx 7.21 $
          Phải đến năm thứ $8$ mới giảm xuống dưới mức $1000$ tấn.
        - *d)* Sai. Hàm số mũ $5000 (0.8)^t > 0$ với mọi $t$, về mặt toán học không bao giờ bằng $0$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Áp suất khí quyển $P$ (mmHg) tại độ cao $h$ (km) so với mực nước biển được tính bằng công thức $P = 760 e^(-0.12 h)$. Cần lên đến độ cao bao nhiêu km để áp suất khí quyển chỉ còn bằng một nửa áp suất tại mực nước biển? (Làm tròn đến hàng phần mười).],
    [5.8],
    loigiai: [
        Áp suất tại mực nước biển ($h = 0$) là $P = 760$. Ta cần giải:
        $ 760 e^(-0.12 h) = 380 <=> e^(-0.12 h) = 0.5 $
        $ <=> -0.12 h = ln 0.5 = -ln 2 <=> h = (ln 2) / 0.12 approx 5.776 $
        Làm tròn được $5.8$ km.
    ]
)

// TL 2
#tln([Một sinh viên vay ngân hàng $100$ triệu đồng để trang trải học phí, với lãi suất $9\%$/năm (tính lãi kép liên tục). Sau khi ra trường $4$ năm, sinh viên đó mới bắt đầu đi làm và trả nợ một lần cho ngân hàng (cả gốc lẫn lãi). Số tiền người đó phải trả là bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị).],
    [143],
    loigiai: [
        Áp dụng công thức lãi kép liên tục: 
        $ A = 100 e^(0.09 dot 4) = 100 e^(0.36) approx 143.33 $
        Làm tròn thành $143$ triệu đồng.
    ]
)

// TL 3
#tln([Chỉ số chất lượng không khí (AQI) ở một thành phố vào một ngày được mô phỏng bằng hàm số $A(t) = 30 + 15 ln(t + 2)$, trong đó $t$ là số giờ kể từ 6h sáng. Vào lúc mấy giờ trong ngày hôm đó thì AQI đạt mức $75$? (Kết quả tính theo định dạng 24 giờ).],
    [24],
    loigiai: [
        Giải phương trình: 
        $ 30 + 15 ln(t + 2) = 75 <=> 15 ln(t + 2) = 45 $
        $ <=> ln(t + 2) = 3 <=> t + 2 = e^3 <=> t = e^3 - 2 approx 20.08 - 2 = 18.08 " (giờ)" $
        Số giờ kể từ 6h sáng là $18.08$ giờ. 
        Vậy thời điểm đó là $6 + 18.08 = 24.08$, xấp xỉ $24$ giờ (tức là 12 giờ đêm).
    ]
)

// TL 4
#tln([Nhiệt độ của một thanh sắt nóng chảy sau $t$ phút được lấy ra khỏi lò là $T(t) = 25 + 975 e^(-0.04 t)$ (độ C). Sau bao nhiêu phút thì nhiệt độ của thanh sắt giảm xuống còn $100^o C$? (Làm tròn đến hàng đơn vị).],
    [64],
    loigiai: [
        Giải phương trình: 
        $ 25 + 975 e^(-0.04 t) = 100 <=> 975 e^(-0.04 t) = 75 $
        $ <=> e^(-0.04 t) = 75/975 = 1/13 $
        Suy ra:
        $ -0.04 t = ln(1/13) = -ln 13 <=> t = (ln 13) / 0.04 approx 63.87 $
        Làm tròn thành $64$ phút.
    ]
)

// TL 5
#tln([Tần số $f$ (Hz) của một nốt nhạc trong âm nhạc phương Tây phụ thuộc vào số cung (semitone) $n$ kể từ nốt La chuẩn (A4 có $f_0 = 440$ Hz) theo công thức $f = 440 dot 2^(n/12)$. Tính tần số của nốt Đô cao (C5), biết nó cách nốt A4 chuẩn là $n = 3$ cung. (Làm tròn đến hàng phần mười).],
    [523.3],
    loigiai: [
        Thay $n = 3$ vào công thức: 
        $ f = 440 dot 2^(3/12) = 440 dot 2^(1/4) = 440 root(4, 2) approx 440 dot 1.1892 approx 523.25 $
        Làm tròn thành $523.3$ Hz.
    ]
)

// TL 6
#tln([Độ pH của dạ dày người bình thường dao động từ $1.5$ đến $3.5$. Giả sử mẫu dịch vị của một bệnh nhân có độ pH là $1.2$. Nồng độ ion Hydrogen $[H^+]$ trong dạ dày người này là $a dot 10^(-2)$ (mol/L). Tính giá trị của $a$ (làm tròn đến một chữ số thập phân).],
    [6.3],
    loigiai: [
        Ta có:
        $ "pH" = -log[H^+] = 1.2 <=> log[H^+] = -1.2 <=> [H^+] = 10^(-1.2) $
        Phân tích:
        $ 10^(-1.2) = 10^(-1.2 + 2) dot 10^(-2) = 10^0.8 dot 10^(-2) $
        Suy ra $a = 10^0.8 approx 6.309$.
        Làm tròn thành $6.3$.
    ]
)
]
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
