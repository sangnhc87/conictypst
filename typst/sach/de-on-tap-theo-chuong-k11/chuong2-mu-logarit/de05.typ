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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 05 - MÔ HÌNH TOÁN HỌC)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Định luật Moore (Moore's Law) nổi tiếng trong ngành công nghiệp bán dẫn phát biểu rằng số lượng bóng bán dẫn trên một vi mạch sẽ tăng gấp đôi sau mỗi chu kì khoảng $2$ năm. Giả sử vào năm $1971$, vi mạch $4004$ của Intel có $2300$ bóng bán dẫn. Theo định luật này, đến năm $1981$ (sau $10$ năm), số lượng bóng bán dẫn trên một vi mạch ước tính khoảng bao nhiêu?],
    (
        [$23000$],
        [$46000$],
        True([$73600$]),
        [$115000$]
    ),
    loigiai: [
        Chu kì tăng gấp đôi là $T = 2$ năm. Số chu kì trong $10$ năm là $n = 10 / 2 = 5$.
        Số lượng bóng bán dẫn sau $5$ chu kì là:
        $
          N = 2300 dot 2^5 = 2300 dot 32 = 73600
        $
    ]
)

// TN 2
#tn([Doanh thu bán hàng của một dòng điện thoại thông minh (tính bằng triệu USD) sau $t$ tháng ra mắt được mô hình hóa bởi hàm số $R(t) = 400(1 - e^(-0.2 t))$. Theo mô hình này, doanh thu của dòng điện thoại đó không bao giờ vượt qua mốc nào sau đây?],
    (
        [$200$ triệu USD.],
        [$300$ triệu USD.],
        True([$400$ triệu USD.]),
        [$500$ triệu USD.]
    ),
    loigiai: [
        Vì $e^(-0.2 t) > 0$ với mọi $t > 0$, nên $1 - e^(-0.2 t) < 1$.
        Do đó:
        $
          R(t) = 400(1 - e^(-0.2 t)) < 400
        $
        Vậy doanh thu không bao giờ vượt qua $400$ triệu USD.
    ]
)

// TN 3
#tn([Độ che phủ rừng của một quốc gia đang bị thu hẹp do khai thác. Các chuyên gia ước tính diện tích rừng $S$ (triệu ha) sau $t$ năm giảm theo quy luật $S(t) = 12 e^(-0.04 t)$. Sau bao nhiêu năm thì diện tích rừng giảm đi một nửa so với ban đầu?],
    (
        [$15$ năm.],
        True([$17.3$ năm.]),
        [$20$ năm.],
        [$25$ năm.]
    ),
    loigiai: [
        Diện tích ban đầu là $S_0 = 12$. Cần tìm $t$ để $S(t) = 6$.
        $
          12 e^(-0.04 t) = 6 <=> e^(-0.04 t) = 0.5 <=> -0.04 t = ln 0.5 = -ln 2
        $
        $
          <=> t = (ln 2) / 0.04 approx 17.33 " (năm)"
        $
    ]
)

// TN 4
#tn([Để tiêu diệt vi sinh vật gây hại, người ta dùng một loại hóa chất đặc trị. Tỉ lệ sống sót của vi sinh vật $P$ sau liều lượng hóa chất $x$ (mg/L) được cho bởi $P(x) = 100 dot 2^(-0.5 x) \%$. Để tiêu diệt $99\%$ lượng vi sinh vật, cần dùng nồng độ hóa chất $x$ xấp xỉ bằng bao nhiêu?],
    (
        [$6.64$ mg/L.],
        [$10.0$ mg/L.],
        True([$13.3$ mg/L.]),
        [$15.2$ mg/L.]
    ),
    loigiai: [
        Tiêu diệt $99\%$ nghĩa là tỉ lệ sống sót $P(x) = 1\%$.
        Giải phương trình:
        $
          100 dot 2^(-0.5 x) = 1 <=> 2^(-0.5 x) = 1/100
        $
        $
          <=> -0.5 x = log_2 (1/100) = -log_2 100 <=> x = 2 log_2 100 approx 2 dot 6.64 = 13.28 " (mg/L)"
        $
    ]
)

// TN 5
#tn([Một bệnh nhân được uống $400$ mg thuốc hạ sốt. Mô hình toán học về sự chuyển hóa thuốc trong cơ thể cho thấy khối lượng thuốc $m$ (mg) còn lại trong máu tính từ khi uống tuân theo định luật hàm số mũ, biết chu kì bán thải của thuốc là $4$ giờ. Khối lượng thuốc còn lại trong cơ thể sau $10$ giờ là],
    (
        [$50$ mg.],
        [$62.5$ mg.],
        True([$70.7$ mg.]),
        [$85.5$ mg.]
    ),
    loigiai: [
        Công thức lượng thuốc còn lại:
        $
          m(t) = m_0 (1/2)^(t/T) = 400 (1/2)^(10/4) = 400 (1/2)^(2.5) 
        $
        Bấm máy tính:
        $
          m(10) = 400 dot 0.17677 approx 70.71 " (mg)"
        $
    ]
)

// TN 6
#tn([Khi pha loãng một dung dịch axit có $"pH" = 2$ bằng nước cất với thể tích gấp $10$ lần thể tích ban đầu, thì độ pH của dung dịch mới bằng bao nhiêu? (Giả sử nước cất có pH trung tính và không làm thay đổi số mol ion $H^+$).],
    (
        [$1.0$.],
        [$2.0$.],
        [$2.5$.],
        True([$3.0$.])
    ),
    loigiai: [
        Ta có độ $"pH" = -log[H^+]$. Độ pH ban đầu bằng $2$ nên nồng độ ion $[H^+]_1 = 10^(-2)$ mol/L.
        Khi pha loãng gấp 10 lần thể tích, số mol ion $H^+$ không đổi, nhưng thể tích tăng gấp 10 nên nồng độ ion mới giảm đi 10 lần:
        $
          [H^+]_2 = ([H^+]_1) / 10 = 10^(-2) / 10 = 10^(-3) " (mol/L)"
        $
        Độ pH mới là:
        $
          "pH"_2 = -log(10^(-3)) = 3.0
        $
    ]
)

// TN 7
#tn([Cường độ âm chuẩn là $I_0 = 10^(-12) "W/m"^2$. Một máy hút bụi hoạt động gây ra tiếng ồn với cường độ $I = 10^(-4) "W/m"^2$. Mức cường độ âm của máy hút bụi đó đo bằng decibel (dB) là],
    (
        [$40$ dB.],
        [$60$ dB.],
        True([$80$ dB.]),
        [$100$ dB.]
    ),
    loigiai: [
        Mức cường độ âm (dB) được tính bằng:
        $
          L = 10 log(I / I_0) = 10 log(10^(-4) / 10^(-12)) = 10 log(10^8) = 10 dot 8 = 80 " (dB)"
        $
    ]
)

// TN 8
#tn([Sức mua của đồng tiền thường giảm theo thời gian do lạm phát. Giả sử tỉ lệ lạm phát hàng năm của một quốc gia là $4\%$/năm. Nếu sức mua của một số tiền $M$ hiện nay là $100\%$, thì sau bao nhiêu năm sức mua của nó chỉ còn tương đương $50\%$ giá trị hiện tại?],
    (
        [$15$ năm.],
        True([$17$ năm.]),
        [$20$ năm.],
        [$25$ năm.]
    ),
    loigiai: [
        Sức mua còn lại sau $n$ năm là $V = V_0 (1 - 0.04)^n = V_0 (0.96)^n$.
        Để $V = 0.5 V_0$, ta giải phương trình:
        $
          (0.96)^n = 0.5 <=> n = log_0.96 (0.5) = (ln 0.5) / (ln 0.96) approx 16.98
        $
        Vậy mất khoảng $17$ năm.
    ]
)

// TN 9
#tn([Nhiệt độ $T$ ($""^o C$) của một tách trà đang nguội sau $t$ phút đặt trong phòng có nhiệt độ $25^o C$ là $T(t) = 25 + 75 e^(-0.06 t)$. Tốc độ nguội của tách trà tại thời điểm $t = 10$ phút (tính bằng đạo hàm $T'(10)$) xấp xỉ bằng],
    (
        [$-1.8""^o C$/phút.],
        True([$-2.5""^o C$/phút.]),
        [$-3.0""^o C$/phút.],
        [$-4.5""^o C$/phút.]
    ),
    loigiai: [
        Tính đạo hàm của $T(t)$:
        $
          T'(t) = 75 dot (-0.06) e^(-0.06 t) = -4.5 e^(-0.06 t)
        $
        Tại $t = 10$:
        $
          T'(10) = -4.5 e^(-0.06 dot 10) = -4.5 e^(-0.6) approx -4.5 dot 0.5488 = -2.4696 " ("""^o "C/phút)"
        $
        Vậy tốc độ giảm nhiệt độ là khoảng $2.5""^o C$/phút.
    ]
)

// TN 10
#tn([Mô hình tăng trưởng số lượng một loại động vật hoang dã là $P(t) = P_0 (1.05)^t$, trong đó $t$ tính bằng năm. Tỉ lệ phần trăm động vật tăng thêm sau mỗi khoảng thời gian 10 năm là bao nhiêu?],
    (
        [$50\%$.],
        [$60\%$.],
        True([$62.9\%$.]),
        [$65\%$.]
    ),
    loigiai: [
        Sau $10$ năm, số lượng là:
        $
          P(10) = P_0 (1.05)^10 approx P_0 dot 1.62889
        $
        Vậy số lượng động vật đã bằng $162.9\%$ so với ban đầu, tức là tăng thêm $62.9\%$.
    ]
)

// TN 11
#tn([Một tấm phim lọc sáng cho phép $80\%$ lượng ánh sáng truyền qua. Nếu người ta xếp chồng $n$ tấm phim này lên nhau, lượng ánh sáng truyền qua hệ thống sẽ là $I = I_0 (0.8)^n$. Cần ít nhất bao nhiêu tấm phim xếp chồng lên nhau để cản được hơn $90\%$ ánh sáng?],
    (
        [$8$ tấm.],
        [$9$ tấm.],
        True([$11$ tấm.]),
        [$12$ tấm.]
    ),
    loigiai: [
        Cản được hơn $90\%$ ánh sáng tức là lượng ánh sáng truyền qua còn ít hơn $10\%$.
        $
          I < 0.1 I_0 <=> I_0 (0.8)^n < 0.1 I_0 <=> 0.8^n < 0.1
        $
        $
          <=> n > log_0.8 (0.1) approx 10.32
        $
        Vì $n$ là số nguyên nên cần ít nhất $11$ tấm phim.
    ]
)

// TN 12
#tn([Biết năng lượng $E$ (J) tỏa ra của một trận động đất phụ thuộc vào độ Richter $M$ theo hệ thức $log E = 11.4 + 1.5 M$. Trận động đất tàn phá Haiti năm 2010 mạnh $7.0$ độ Richter. Hỏi năng lượng tỏa ra từ trận động đất ở Nhật Bản năm 2011 mạnh $9.0$ độ Richter gấp bao nhiêu lần năng lượng trận động đất ở Haiti?],
    (
        [$100$ lần.],
        [$500$ lần.],
        True([$1000$ lần.]),
        [$10000$ lần.]
    ),
    loigiai: [
        Năng lượng của hai trận động đất lần lượt là:
        $
          log E_1 = 11.4 + 1.5 dot 9.0
        $
        $
          log E_2 = 11.4 + 1.5 dot 7.0
        $
        Trừ vế theo vế:
        $
          log E_1 - log E_2 = 1.5(9.0 - 7.0) = 1.5 dot 2 = 3 <=> log(E_1/E_2) = 3
        $
        Suy ra:
        $
          E_1/E_2 = 10^3 = 1000 " (lần)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Khi một viên thuốc được uống vào, nồng độ của thuốc trong máu sau $t$ giờ được đo bằng hàm số $C(t) = 30(e^(-0.1t) - e^(-0.5t))$ (mg/L). Các phát biểu sau đúng hay sai?], (
        True([Lúc vừa uống xong ($t=0$), nồng độ thuốc trong máu bằng $0$.]),
        [Sau $1$ giờ, nồng độ thuốc trong máu là khoảng $14$ mg/L.],
        [Khi $t$ càng lớn, nồng độ thuốc trong máu tiến dần về $30$ mg/L.],
        True([Sau $2$ giờ, nồng độ thuốc cao hơn nồng độ ở thời điểm $1$ giờ.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t = 0$:
          $ C(0) = 30(e^0 - e^0) = 0 $
        - *b)* Sai. Tại $t = 1$:
          $ C(1) = 30(e^(-0.1) - e^(-0.5)) approx 30(0.9048 - 0.6065) = 30 dot 0.2983 approx 8.95 " (mg/L)" $
        - *c)* Sai. Khi $t -> +oo$:
          $ lim_(t->+oo) C(t) = 30(0 - 0) = 0 $
        - *d)* Đúng. Tại $t = 2$:
          $ C(2) = 30(e^(-0.2) - e^(-1.0)) approx 30(0.8187 - 0.3679) = 30 dot 0.4508 approx 13.52 " (mg/L)" $
          Vì $13.52 > 8.95$, nên nồng độ tại giờ thứ 2 cao hơn giờ thứ nhất.
    ]
)

// DS 2
#ds([Sự suy giảm giá trị của một hệ thống máy chủ máy tính được kế toán lập khấu hao theo mô hình $V(t) = 500(0.7)^t$ (triệu đồng), trong đó $t$ là số năm sử dụng. Các phát biểu sau đúng hay sai?], (
        True([Giá trị mua ban đầu của hệ thống máy chủ là $500$ triệu đồng.]),
        [Mỗi năm giá trị máy chủ giảm đi $70\%$.],
        True([Sau $3$ năm sử dụng, giá trị máy chủ còn chưa tới $180$ triệu đồng.]),
        [Phải mất $5$ năm để giá trị máy chủ giảm xuống còn $10\%$ so với giá trị ban đầu.]
    ), 
    loigiai: [
        - *a)* Đúng. Thay $t = 0$, ta có $V(0) = 500$ triệu đồng.
        - *b)* Sai. Ta có $V(t+1) = 0.7 V(t)$, tức là mỗi năm máy chủ giữ lại $70\%$ giá trị cũ, tương đương bị mất đi $30\%$ giá trị.
        - *c)* Đúng. Khi $t = 3$:
          $ V(3) = 500(0.7)^3 = 500 dot 0.343 = 171.5 " (triệu đồng)" $
          $171.5 < 180$, do đó giá trị còn chưa tới $180$ triệu đồng.
        - *d)* Sai. Để máy chủ còn $10\%$ giá trị ban đầu, ta giải:
          $ 500(0.7)^t = 50 <=> (0.7)^t = 0.1 <=> t = log_0.7 (0.1) approx 6.45 " (năm)" $
          Cần hơn $6$ năm chứ không phải $5$ năm.
    ]
)

// DS 3
#ds([Chỉ số BMI (Body Mass Index) là một chỉ số dùng để đánh giá độ béo gầy. Một người đang áp dụng chế độ giảm cân theo công thức $W(t) = 85 - 10(1 - e^(-0.2 t))$ (kg), trong đó $t$ là số tháng áp dụng chế độ ăn kiêng. Giả sử chiều cao người đó không đổi là $1.7$ m. Biết công thức tính $"BMI" = W / H^2$. Các phát biểu sau đúng hay sai?], (
        True([Trước khi giảm cân, cân nặng của người đó là $85$ kg.]),
        True([Người này không thể giảm xuống dưới mức $70$ kg bằng chế độ ăn kiêng này.]),
        [Sau $5$ tháng, người đó đã giảm được chính xác $10$ kg.],
        True([Theo mô hình, BMI nhỏ nhất mà người đó có thể đạt được là khoảng $26$.])
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t = 0$:
          $ W(0) = 85 - 10(1 - e^0) = 85 - 0 = 85 " (kg)" $
        - *b)* Đúng. Ta có $e^(-0.2 t) > 0 => 1 - e^(-0.2 t) < 1$. Do đó:
          $ W(t) = 85 - 10(1 - e^(-0.2 t)) > 85 - 10 = 75 " (kg)" $
          Vậy cân nặng của người đó không bao giờ giảm xuống dưới $75$ kg, nên cũng không thể giảm xuống dưới $70$ kg.
        - *c)* Sai. Khối lượng giảm đi sau $5$ tháng là:
          $ Delta W = 10(1 - e^(-0.2 dot 5)) = 10(1 - e^(-1)) approx 10(1 - 0.368) = 6.32 " (kg)" $
        - *d)* Đúng. Trọng lượng nhỏ nhất đạt được (giới hạn khi $t -> +oo$) là $75$ kg. 
          Lúc đó BMI là:
          $ "BMI" = 75 / (1.7)^2 approx 75 / 2.89 approx 25.95 $
          Xấp xỉ $26$.
    ]
)

// DS 4
#ds([Sự thay đổi áp suất không khí trong lốp xe theo thời gian $t$ (tuần) do các van xì chậm được biểu diễn bằng $P(t) = 2.4 e^(-0.03 t)$ (bar). Các phát biểu sau đúng hay sai?], (
        True([Áp suất ban đầu của lốp xe là $2.4$ bar.]),
        True([Sau $10$ tuần, áp suất lốp xe còn khoảng $1.78$ bar.]),
        [Để áp suất lốp xe giảm xuống $2.0$ bar, cần chờ hơn $7$ tuần.],
        [Tốc độ xì hơi của lốp (đạo hàm $P'(t)$) luôn là hằng số.]
    ), 
    loigiai: [
        - *a)* Đúng. Tại $t = 0$:
          $ P(0) = 2.4 e^0 = 2.4 " (bar)" $
        - *b)* Đúng. Tại $t = 10$:
          $ P(10) = 2.4 e^(-0.3) approx 2.4 dot 0.7408 approx 1.778 " (bar)" $
        - *c)* Sai. Giải $P(t) = 2.0$:
          $ 2.4 e^(-0.03 t) = 2.0 <=> e^(-0.03 t) = 2.0/2.4 = 5/6 $
          $ <=> -0.03 t = ln(5/6) <=> t = (ln(5/6)) / (-0.03) approx 6.07 " (tuần)" $
          Cần khoảng $6$ tuần, tức là chưa tới $7$ tuần.
        - *d)* Sai. Đạo hàm $P'(t) = -0.072 e^(-0.03 t)$ không phải là hằng số mà thay đổi phụ thuộc vào $t$.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một chất bảo quản thực phẩm phân hủy theo thời gian với công thức $m(t) = 150 e^(-0.05 t)$ (mg), trong đó $t$ tính bằng ngày. Sau bao nhiêu ngày thì lượng chất bảo quản còn lại bằng một nửa lượng ban đầu? (Làm tròn đến hàng đơn vị).],
    [14],
    loigiai: [
        Lượng chất bảo quản giảm một nửa tức là còn lại $75$ mg (từ $150$ mg).
        Giải phương trình:
        $ 150 e^(-0.05 t) = 75 <=> e^(-0.05 t) = 0.5 $
        $ <=> -0.05 t = ln 0.5 <=> t = (ln 0.5) / (-0.05) approx 13.86 $
        Làm tròn kết quả là $14$ ngày.
    ]
)

// TL 2
#tln([Tốc độ rò rỉ dầu từ một con tàu bị đâm thủng được mô phỏng bởi $v(t) = 500 e^(-0.1 t)$ (lít/giờ). Tại thời điểm nào (tính bằng giờ) thì tốc độ rò rỉ giảm xuống mức $100$ lít/giờ? (Làm tròn kết quả đến một chữ số thập phân).],
    [16.1],
    loigiai: [
        Cần giải phương trình:
        $ 500 e^(-0.1 t) = 100 <=> e^(-0.1 t) = 0.2 $
        $ <=> -0.1 t = ln 0.2 <=> t = (ln 0.2) / (-0.1) approx 16.09 " (giờ)" $
        Làm tròn thành $16.1$ giờ.
    ]
)

// TL 3
#tln([Nồng độ ô nhiễm của một hóa chất trong hồ nước là $C(t) = 120 e^(-0.08 t)$ (ppm), trong đó $t$ tính bằng năm. Ngưỡng an toàn cho phép của hóa chất này đối với sinh vật là $30$ ppm. Nước hồ sẽ trở nên an toàn sau bao nhiêu năm? (Làm tròn đến hàng đơn vị).],
    [17],
    loigiai: [
        Cần tìm $t$ để $C(t) <= 30$:
        $ 120 e^(-0.08 t) <= 30 <=> e^(-0.08 t) <= 0.25 = 1/4 $
        $ <=> -0.08 t <= ln(1/4) <=> -0.08 t <= -ln 4 <=> t >= (ln 4) / 0.08 approx 17.33 $
        Đề yêu cầu làm tròn đến hàng đơn vị nên đáp án là $17$.
    ]
)

// TL 4
#tln([Một khoản tiền gửi tiết kiệm $100$ triệu đồng, lãi suất được gộp liên tục, sau $8$ năm nhận được $150$ triệu đồng. Hỏi lãi suất gộp liên tục của ngân hàng là bao nhiêu phần trăm mỗi năm? (Làm tròn đến một chữ số thập phân).],
    [5.1],
    loigiai: [
        Sử dụng công thức lãi kép liên tục:
        $ A = P e^(r t) <=> 150 = 100 e^(r dot 8) <=> e^(8 r) = 1.5 $
        $ <=> 8 r = ln 1.5 <=> r = (ln 1.5) / 8 approx 0.05068 $
        Lãi suất là $5.068\%$, làm tròn thành $5.1\%$.
    ]
)

// TL 5
#tln([Sự giảm giá trị $V$ của một tài sản sau $t$ năm tuân theo mô hình $V(t) = V_0 (0.85)^t$. Tính thời gian (làm tròn đến hàng phần mười của năm) để giá trị của tài sản chỉ còn lại $25\%$ giá trị ban đầu $V_0$.],
    [8.5],
    loigiai: [
        Ta giải phương trình:
        $ V_0 (0.85)^t = 0.25 V_0 <=> (0.85)^t = 0.25 $
        $ <=> t = log_0.85 (0.25) = (ln 0.25) / (ln 0.85) approx 8.53 " (năm)" $
        Làm tròn kết quả thành $8.5$ năm.
    ]
)

// TL 6
#tln([Độ pH của máu trong cơ thể người khỏe mạnh bình thường là $7.4$. Hỏi nồng độ ion Hydrogen $[H^+]$ trong máu người bình thường có giá trị xấp xỉ bao nhiêu nhân với $10^(-8)$ mol/L? (Nhắc lại: $"pH" = -log[H^+]$, kết quả làm tròn đến một chữ số thập phân).],
    [4.0],
    loigiai: [
        Ta có phương trình:
        $ "pH" = -log[H^+] = 7.4 <=> log[H^+] = -7.4 $
        $ <=> [H^+] = 10^(-7.4) = 10^(0.6 - 8) = 10^0.6 dot 10^(-8) $
        Tính giá trị của $10^0.6 approx 3.981$.
        Làm tròn kết quả là $4.0$. 
        Vậy nồng độ là khoảng $4.0 dot 10^(-8)$ mol/L.
    ]
)
]
#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
