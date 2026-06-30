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
  exam-title: "CHƯƠNG 2. MŨ VÀ LOGARIT (ĐỀ SỐ 02)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Áp suất khí quyển $P$ (tính bằng milibar) giảm dần theo độ cao $h$ (tính bằng km) so với mực nước biển theo công thức $P(h) = 1013 e^(-0.12 h)$. Áp suất khí quyển ở độ cao $5$ km xấp xỉ bằng bao nhiêu milibar?],
    (
        [$250$ mb],
        [$345$ mb],
        True([$556$ mb]),
        [$780$ mb]
    ),
    loigiai: [
        Thay $h = 5$ vào công thức, ta có:
        $
          P(5) = 1013 e^(-0.12 dot 5) = 1013 e^(-0.6) approx 1013 dot 0.5488 approx 556 " (milibar)"
        $
    ]
)

// TN 2
#tn([Một bệnh nhân được tiêm $20$ mg một loại thuốc. Lượng thuốc $M(t)$ (mg) còn lại trong máu sau $t$ giờ tiêm tuân theo hàm phân rã $M(t) = 20 (0.75)^t$. Hỏi sau bao lâu thì lượng thuốc trong máu giảm xuống chỉ còn $5$ mg? (Làm tròn đến 1 chữ số thập phân).],
    (
        [$3.0$ giờ],
        [$4.2$ giờ],
        [$2.8$ giờ],
        True([$4.8$ giờ])
    ),
    loigiai: [
        Ta cần giải phương trình:
        $
          20 (0.75)^t = 5 <=> (0.75)^t = 0.25 <=> t = log_0.75 (0.25)
        $
        Bấm máy tính, ta được $t approx 4.818$. Làm tròn, ta được $4.8$ giờ.
    ]
)

// TN 3
#tn([Để diệt khuẩn trong một căn phòng, người ta sử dụng khí ozone. Biết rằng lượng vi khuẩn $N(t)$ sau $t$ phút phun khí ozone được mô hình hóa bởi $N(t) = N_0 dot 10^(-0.05 t)$, với $N_0$ là số lượng vi khuẩn ban đầu. Phải mất ít nhất bao nhiêu phút để tiêu diệt được $99%$ lượng vi khuẩn trong phòng?],
    (
        [$10$ phút],
        [$20$ phút],
        True([$40$ phút]),
        [$50$ phút]
    ),
    loigiai: [
        Tiêu diệt $99%$ nghĩa là số lượng vi khuẩn còn lại bằng $1%$ so với ban đầu. 
        Ta có $N(t) = 0.01 N_0 = 10^(-2) N_0$.
        Theo mô hình:
        $
          N_0 10^(-0.05 t) = 10^(-2) N_0 <=> 10^(-0.05 t) = 10^(-2) <=> -0.05 t = -2 <=> t = 40 " (phút)"
        $
    ]
)

// TN 4
#tn([Cường độ sáng biểu kiến của một ngôi sao được đặc trưng bởi "cấp sao" $m$. Công thức Pogson cho biết hiệu cấp sao của hai ngôi sao tỉ lệ thuận với logarit cơ số $10$ của tỉ số độ sáng (quang thông) của chúng: $m_2 - m_1 = 2.5 log(I_1 / I_2)$. Nếu ngôi sao $A$ sáng gấp $100$ lần ngôi sao $B$, thì hiệu cấp sao $m_B - m_A$ là bao nhiêu?],
    (
        [$2$],
        True([$5$]),
        [$10$],
        [$2.5$]
    ),
    loigiai: [
        Theo đề bài, $I_A / I_B = 100$. Áp dụng công thức Pogson với sao 1 là A, sao 2 là B:
        $
          m_B - m_A = 2.5 log(I_A / I_B) = 2.5 log(100) = 2.5 dot 2 = 5
        $
        Vậy hiệu cấp sao là $5$.
    ]
)

// TN 5
#tn([Sự phát triển của một trang mạng xã hội được mô phỏng bởi hàm logistic $S(t) = 100 / (1 + 9 e^(-0.8 t))$ (triệu người dùng), với $t$ là số năm kể từ lúc ra mắt. Theo mô hình này, số lượng người dùng tối đa (khi $t -> +oo$) mà trang mạng này có thể đạt được là bao nhiêu?],
    (
        [$9$ triệu],
        True([$100$ triệu]),
        [$10$ triệu],
        [$110$ triệu]
    ),
    loigiai: [
        Khi $t -> +oo$, ta có $e^(-0.8 t) -> 0$.
        Do đó:
        $
          lim_(t -> +oo) S(t) = 100 / (1 + 9 dot 0) = 100 " (triệu)"
        $
        Số lượng người dùng tối đa là $100$ triệu.
    ]
)

// TN 6
#tn([Trong một nhà máy, mức ồn $L$ đo được tại khu vực sản xuất là $90$ dB. Nếu quản đốc cho bật thêm một hệ thống máy móc có cường độ âm (đo bằng $W/m^2$) đúng bằng hệ thống hiện tại, mức ồn mới sẽ xấp xỉ bao nhiêu? (Biết $log 2 approx 0.3$).],
    (
        [$180$ dB],
        [$90.3$ dB],
        True([$93$ dB]),
        [$100$ dB]
    ),
    loigiai: [
        Mức cường độ âm ban đầu: $L_1 = 10 log(I / I_0) = 90$.
        Khi bật thêm máy, cường độ âm tổng cộng là $2I$. Mức ồn mới là:
        $
          L_2 = 10 log((2I) / I_0) = 10 (log 2 + log(I / I_0)) = 10 log 2 + 10 log(I / I_0)
        $
        $
          = 10 dot 0.3 + 90 = 3 + 90 = 93 " (dB)"
        $
    ]
)

// TN 7
#tn([Bác An đầu tư $500$ triệu đồng vào một chứng chỉ quỹ với lãi suất dự kiến $8%$/năm, tính lãi kép liên tục (công thức $A = P e^(r t)$). Hỏi sau 10 năm, bác An nhận được tổng số tiền xấp xỉ bao nhiêu?],
    (
        [$1079$ triệu đồng],
        True([$1113$ triệu đồng]),
        [$1234$ triệu đồng],
        [$900$ triệu đồng]
    ),
    loigiai: [
        Áp dụng công thức tính lãi kép liên tục với $P = 500, r = 0.08, t = 10$:
        $
          A = 500 e^(0.08 dot 10) = 500 e^(0.8) approx 500 dot 2.22554 = 1112.77 " (triệu đồng)"
        $
        Làm tròn, bác nhận được khoảng $1113$ triệu đồng.
    ]
)

// TN 8
#tn([Phương trình $log_3 (x^2 - 8x) = 2$ có tổng các nghiệm bằng bao nhiêu?],
    (
        True([$8$]),
        [$-8$],
        [$9$],
        [$-9$]
    ),
    loigiai: [
        Điều kiện: $x^2 - 8x > 0 <=> x < 0$ hoặc $x > 8$.
        Phương trình tương đương:
        $
          x^2 - 8x = 3^2 <=> x^2 - 8x - 9 = 0
        $
        Giải ra ta được $x_1 = -1, x_2 = 9$. Cả hai đều thỏa mãn điều kiện.
        Tổng hai nghiệm: $-1 + 9 = 8$. 
        *(Lưu ý: Đây là câu hỏi phương trình bậc 2 duy nhất theo yêu cầu giới hạn của đề).*
    ]
)

// TN 9
#tn([Chu kì bán rã của chất phóng xạ Polonium-210 là $138$ ngày. Ban đầu có $10$ gam Polonium-210. Khối lượng còn lại sau $276$ ngày là],
    (
        [$5$ gam],
        True([$2.5$ gam]),
        [$1.25$ gam],
        [$0$ gam]
    ),
    loigiai: [
        Công thức khối lượng còn lại theo chu kì bán rã $T$:
        $
          m(t) = m_0 (1/2)^(t / T) = 10 (1/2)^(276 / 138) = 10 (1/2)^2 = 10 dot 1/4 = 2.5 " (gam)"
        $
    ]
)

// TN 10
#tn([Khảo sát một hồ nước, người ta thấy độ sâu tối đa ánh sáng xuyên tới để thực vật thủy sinh có thể quang hợp là nơi có cường độ sáng bằng $1%$ cường độ sáng mặt hồ. Giả sử cường độ ánh sáng $I$ tại độ sâu $d$ (mét) là $I(d) = I_0 e^(-0.2 d)$. Thực vật thủy sinh có thể sống ở độ sâu tối đa bao nhiêu mét?],
    (
        [$15$ m],
        [$10$ m],
        True([$23$ m]),
        [$28$ m]
    ),
    loigiai: [
        Ta có phương trình:
        $
          I(d) = 0.01 I_0 <=> I_0 e^(-0.2 d) = 0.01 I_0 <=> e^(-0.2 d) = 0.01 = 10^(-2)
        $
        $
          <=> -0.2 d = ln(10^(-2)) = -2 ln(10) <=> d = (-2 ln 10) / (-0.2) = 10 ln 10 approx 10 dot 2.302 = 23.02 " (m)"
        $
        Độ sâu tối đa là khoảng $23$ m.
    ]
)

// TN 11
#tn([Năng lượng $E$ (tính bằng Erg) giải phóng ra từ một trận động đất có độ Richter là $M$ được xác định theo công thức $log E = 11.4 + 1.5 M$. Trận động đất lịch sử ở Nhật Bản năm 2011 (9.0 độ Richter) tỏa ra năng lượng gấp bao nhiêu lần trận động đất ở Haiti năm 2010 (7.0 độ Richter)?],
    (
        [$2$ lần],
        [$3$ lần],
        True([$1000$ lần]),
        [$10000$ lần]
    ),
    loigiai: [
        Ta có $E = 10^(11.4 + 1.5 M)$.
        Tỉ số năng lượng:
        $
          E_1 / E_2 = (10^(11.4 + 1.5 dot 9.0)) / (10^(11.4 + 1.5 dot 7.0)) = 10^(1.5(9.0 - 7.0)) = 10^(1.5 dot 2) = 10^3 = 1000 " (lần)"
        $
    ]
)

// TN 12
#tn([Một chiếc bánh nướng vừa được lấy ra khỏi lò có nhiệt độ $150degree "C"$ và được đặt vào phòng có nhiệt độ $25degree "C"$. Theo định luật làm nguội của Newton, nhiệt độ của bánh sau $t$ phút là $T(t) = 25 + 125 e^(-k t)$. Nếu sau $15$ phút, nhiệt độ bánh giảm còn $100degree "C"$, nhiệt độ của bánh sau $30$ phút xấp xỉ là bao nhiêu?],
    (
        [$50degree "C"$],
        True([$70degree "C"$]),
        [$65degree "C"$],
        [$75degree "C"$]
    ),
    loigiai: [
        Từ dữ kiện tại $t = 15$, ta có:
        $
          100 = 25 + 125 e^(-15k) <=> 75 = 125 e^(-15k) <=> e^(-15k) = 75 / 125 = 3/5 = 0.6
        $
        Tại $t = 30$, nhiệt độ là:
        $
          T(30) = 25 + 125 e^(-30k) = 25 + 125 (e^(-15k))^2 = 25 + 125 (0.6)^2 = 25 + 125 dot 0.36 = 25 + 45 = 70degree "C"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ Câu 1 đến Câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds(
    [Trong lĩnh vực công nghệ thông tin, định luật Moore nổi tiếng cho rằng "Số lượng transistor trên một vi mạch tích hợp sẽ tăng gấp đôi sau mỗi $2$ năm". Giả sử năm $2000$, một vi mạch tiêu biểu có $3$ triệu transistor. Số lượng transistor $N(t)$ (triệu) sau $t$ năm kể từ năm 2000 được mô hình hóa bởi $N(t) = 3 dot 2^(t/2)$. Các phát biểu sau đúng hay sai?], (
        True([Hàm số $N(t)$ mô phỏng một sự tăng trưởng theo cấp số mũ, với cơ số tăng trưởng hàng năm là $sqrt(2)$.]),
        True([Theo mô hình, năm $2006$, số lượng transistor là $24$ triệu.]),
        [Sau mỗi thập kỉ ($10$ năm), số lượng transistor tăng lên gấp $10$ lần.],
        True([Để số lượng transistor đạt $3$ tỷ ($3000$ triệu), cần chưa tới $20$ năm kể từ năm $2000$.])
    ), 
    loigiai: [
        - *a)* Đúng. Ta có $N(t) = 3 dot (2^(1/2))^t = 3 dot (sqrt(2))^t$. Cơ số hàm mũ là $sqrt(2) > 1$, mô tả tăng trưởng mũ.
        - *b)* Đúng. Năm 2006 ứng với $t = 6$. Số transistor là:
        $
          N(6) = 3 dot 2^(6/2) = 3 dot 2^3 = 3 dot 8 = 24 " (triệu)"
        $
        - *c)* Sai. Sau $10$ năm ($t=10$), số transistor tăng gấp:
        $
          N(t+10) / N(t) = (3 dot 2^((t+10)/2)) / (3 dot 2^(t/2)) = 2^5 = 32 " (lần)"
        $
        Không phải 10 lần.
        - *d)* Đúng. Giải phương trình $N(t) = 3000$:
        $
          3 dot 2^(t/2) = 3000 <=> 2^(t/2) = 1000 <=> t/2 = log_2 (1000) <=> t = 2 log_2 1000
        $
        Vì $2^10 = 1024 > 1000$, nên $log_2 1000 < 10$. Do đó $t = 2 log_2 1000 < 20$. Cần chưa tới 20 năm.
    ]
)

// DS 2
#ds(
    [Đồ thị dưới đây mô tả quá trình sạc của một chiếc tụ điện trong mạch RC (điện tử). Hiệu điện thế $U$ (Volt) hai đầu tụ điện thay đổi theo thời gian $t$ (giây) tuân theo hàm số $U(t) = U_0 (1 - e^(-t / tau))$, với $U_0$ là hiệu điện thế cực đại và $tau$ là hằng số thời gian. 
#align(center)[
    #cetz.canvas({
      import cetz.draw: *
      
      // Scale: x = t (0 to 6), y = U/2 (0 to 6 for U=0 to 12)
      grid((0, 0), (6, 6), step: (1, 1), stroke: (dash: "dotted", paint: luma(200)))
      line((0, 0), (6.5, 0), mark: (end: ">"), stroke: 1.5pt)
      line((0, 0), (0, 6.5), mark: (end: ">"), stroke: 1.5pt)
      content((6.3, -0.4), [$t$ (s)])
      content((-0.8, 6.3), [$U$ (V)])
      
      for i in (1, 2, 3, 4, 5, 6) {
        line((i, -0.1), (i, 0.1))
        content((i, -0.4), str(i))
      }
      for i in (2, 4, 6, 8, 10, 12) {
        let yc = i / 2
        line((-0.1, yc), (0.1, yc))
        content((-0.4, yc), str(i))
      }
      
      // Asymptote U = 10
      line((0, 5), (6, 5), stroke: (dash: "dashed", paint: red))
      content((6, 5.3), text(fill: red)[$U=10$])
      
      let pts = range(0, 601).map(i => {
        let t_val = i / 100
        let u_val = 10 * (1 - calc.exp(-t_val)) // tau = 1, U0 = 10
        (t_val, u_val / 2)
      })
      line(..pts, stroke: 1.5pt + blue)
    })
]
    Dựa vào đồ thị trên, các phát biểu sau đúng hay sai?], (
        [Hiệu điện thế cực đại mà tụ điện đạt được khi sạc đầy là $12$ V.],
        True([Tại thời điểm $t = 0$, hiệu điện thế trên tụ bằng $0$ V.]),
        True([Hàm số $U(t)$ là hàm số đồng biến trên khoảng $(0; +oo)$.]),
        True([Từ đồ thị, hằng số thời gian $tau$ xấp xỉ bằng $1$ giây.])
    ), 
    loigiai: [
        - *a)* Sai. Quan sát đồ thị, đường cong tiến dần tới đường tiệm cận ngang đứt nét màu đỏ tại mức $U = 10$ V. Do đó hiệu điện thế cực đại $U_0 = 10$ V.
        - *b)* Đúng. Tại $t = 0$, đồ thị xuất phát từ gốc tọa độ $(0; 0)$. Điều này cũng đúng với công thức $U(0) = 10 (1 - e^0) = 0$.
        - *c)* Đúng. Đồ thị đi lên từ trái sang phải, hiệu điện thế liên tục tăng theo thời gian sạc, tức hàm số đồng biến.
        - *d)* Đúng. Tại $t = 1$, giá trị trên đồ thị là:
        $
          U(1) = 10 (1 - e^(-1 / tau))
        $
        Nhìn trên đồ thị tại $t=1$, $U$ nằm ở khoảng $6.3$ V. Ta tính thử với $tau = 1$: $U(1) = 10 (1 - e^(-1)) = 10 (1 - 0.368) = 6.32$ V. Hoàn toàn khớp với đồ thị, nên hằng số $tau$ xấp xỉ $1$.
    ]
)

// DS 3
#ds(
    [Tỉ lệ phần trăm người nhớ một danh sách từ vựng $t$ tháng sau khi học xong được cho bởi mô hình suy giảm trí nhớ Ebbinghaus: $R(t) = 80 - 20 ln(t + 1)$ (với $0 <= t <= 12$). Các phát biểu sau đúng hay sai?], (
        [Ngay sau khi học xong ($t=0$), người học nhớ được $100%$ lượng từ vựng.],
        True([Mô hình này là một hàm số nghịch biến.]),
        True([Sau $e^2 - 1$ tháng, lượng từ vựng ghi nhớ giảm xuống còn $40%$.]),
        [Tốc độ quên từ vựng diễn ra chậm ở những tháng đầu tiên và nhanh dần về sau.]
    ), 
    loigiai: [
        - *a)* Sai. Tại $t=0$, ta có $R(0) = 80 - 20 ln(1) = 80 - 0 = 80$. Người học chỉ nhớ được $80%$ lượng từ vựng ngay lúc đó.
        - *b)* Đúng. Hàm số $y = ln(t+1)$ đồng biến khi $t > -1$, do đó hàm số $R(t) = 80 - 20 ln(t+1)$ sẽ nghịch biến, phản ánh đúng thực tế trí nhớ giảm dần theo thời gian.
        - *c)* Đúng. Giải phương trình $R(t) = 40$:
        $
          80 - 20 ln(t + 1) = 40 <=> 20 ln(t + 1) = 40 <=> ln(t + 1) = 2 <=> t + 1 = e^2 <=> t = e^2 - 1
        $
        - *d)* Sai. Đồ thị của hàm $-ln(t+1)$ có độ dốc (đạo hàm) âm và độ lớn giảm dần. Tức là ban đầu (khi $t$ nhỏ), đạo hàm có trị tuyệt đối lớn (quên rất nhanh). Càng về sau, trí nhớ giảm từ từ (quên chậm dần).
    ]
)

// DS 4
#ds(
    [Trong kinh tế học, quy luật "Lợi suất giảm dần" đối với chi phí quảng cáo và doanh thu thường được mô hình hóa qua logarit. Doanh thu $D(x)$ (triệu đồng) của một cửa hàng tỉ lệ với chi phí quảng cáo $x$ (triệu đồng, với $x >= 1$) theo hàm số $D(x) = 150 + 400 log_2 x$. Các phát biểu sau đúng hay sai?], (
        True([Nếu không đầu tư quảng cáo ($x=1$), doanh thu của cửa hàng là $150$ triệu đồng.]),
        [Để tăng gấp đôi doanh thu so với khi $x=1$, cửa hàng cần chi $2$ triệu đồng quảng cáo.],
        True([Để doanh thu tăng thêm $400$ triệu đồng, cửa hàng luôn luôn cần tăng gấp đôi ngân sách quảng cáo so với hiện tại.]),
        [Nếu ngân sách quảng cáo tăng từ $4$ triệu lên $8$ triệu, doanh thu tăng thêm nhiều hơn so với khi ngân sách tăng từ $8$ triệu lên $16$ triệu.]
    ), 
    loigiai: [
        - *a)* Đúng. Tại $x = 1$, $D(1) = 150 + 400 log_2 1 = 150$ (triệu đồng).
        - *b)* Sai. Doanh thu gấp đôi so với khi $x=1$ là $2 dot 150 = 300$. Giải:
        $
          150 + 400 log_2 x = 300 <=> 400 log_2 x = 150 <=> log_2 x = 150/400 = 0.375 <=> x = 2^(0.375) approx 1.3 " (triệu đồng)"
        $
        Không cần tới 2 triệu đồng.
        - *c)* Đúng. Xét doanh thu khi tăng ngân sách gấp đôi từ $x$ lên $2x$:
        $
          D(2x) - D(x) = (150 + 400 log_2 (2x)) - (150 + 400 log_2 x) = 400 (log_2 (2x) - log_2 x)
        $
        $
          = 400 log_2 ((2x)/x) = 400 log_2 2 = 400 " (triệu đồng)"
        $
        Việc nhân đôi ngân sách luôn đem lại khoản tăng cố định 400 triệu.
        - *d)* Sai. Tăng từ $4$ lên $8$ là nhân đôi (tăng 400 triệu doanh thu). Tăng từ $8$ lên $16$ cũng là nhân đôi (tăng 400 triệu doanh thu). Hai mức tăng này bằng nhau, không phải "nhiều hơn".
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ Câu 1 đến Câu 6.], count: 6)

// TL 1
#tln(
    [Chỉ số pH của máu người thường được duy trì ở mức cân bằng rất hẹp. Một xét nghiệm cho thấy nồng độ ion $[H^+]$ trong máu một bệnh nhân là $3.98 dot 10^(-8)$ mol/L. Tính pH máu của bệnh nhân này. (Làm tròn đến 1 chữ số thập phân).],
    [7.4],
    loigiai: [
        Sử dụng công thức $"pH" = -log[H^+]$:
        $
          "pH" = -log(3.98 dot 10^(-8)) = -(log(3.98) - 8) = 8 - log(3.98)
        $
        Bấm máy tính, $log(3.98) approx 0.5998$.
        $
          "pH" = 8 - 0.5998 = 7.4002 approx 7.4
        $
    ]
)

// TL 2
#tln(
    [Một ngân hàng đưa ra mức lãi suất ưu đãi là $6.5%$/năm tính theo phương thức lãi kép kì hạn $1$ năm. Chị Tâm định gửi $200$ triệu đồng. Tính số năm ít nhất để chị Tâm rút được tổng cộng cả gốc và lãi là $400$ triệu đồng (số năm phải là số nguyên).],
    [12],
    loigiai: [
        Số tiền đạt được sau $n$ năm là $T = 200 (1 + 0.065)^n = 200 (1.065)^n$.
        Chị Tâm cần $T >= 400$:
        $
          200 (1.065)^n >= 400 <=> (1.065)^n >= 2
        $
        $
          <=> n >= log_1.065 (2) approx 11.0067
        $
        Vì $n$ phải là số nguyên, nên $n$ nhỏ nhất là $12$. Phải gửi ít nhất $12$ năm.
    ]
)

// TL 3
#tln(
    [Trong một hồ nuôi tôm, người ta đo được nồng độ oxy hòa tan $O(t)$ (mg/L) biến đổi theo thời gian $t$ (giờ, tính từ $0$ giờ đêm) tuân theo một hàm kết hợp lượng giác và hàm mũ do sự quang hợp và hô hấp của tảo: $O(t) = 5 + 3 e^(-0.1 t) sin((pi t)/12)$. Tuy nhiên, vào giữa trưa ($t=12$), mức oxy hòa tan đo được thực tế là bao nhiêu mg/L?],
    [5],
    loigiai: [
        Thay $t = 12$ vào phương trình nồng độ oxy:
        $
          O(12) = 5 + 3 e^(-0.1 dot 12) sin((12pi)/12) = 5 + 3 e^(-1.2) sin(pi)
        $
        Vì $sin(pi) = 0$, phần phía sau bằng $0$.
        $
          O(12) = 5 + 0 = 5 " (mg/L)"
        $
    ]
)

// TL 4
#tln(
    [Nhiệt độ sôi của nước (độ C) phụ thuộc vào áp suất khí quyển $P$ (mmHg) theo công thức kinh nghiệm: $T_s = 100 - 28 log(760 / P)$. Trên đỉnh Phan Xi Păng (cao 3143 m), áp suất khí quyển đo được khoảng $535$ mmHg. Nước sẽ sôi ở bao nhiêu độ C tại đó? (Làm tròn đến 1 chữ số thập phân).],
    [95.7],
    loigiai: [
        Thay $P = 535$ vào công thức:
        $
          T_s = 100 - 28 log(760 / 535) = 100 - 28 log(1.4205)
        $
        Bấm máy tính: $log(1.4205) approx 0.1524$.
        $
          T_s = 100 - 28 dot 0.1524 = 100 - 4.267 = 95.733 approx 95.7degree "C"
        $
    ]
)

// TL 5
#tln(
    [Số người tiếp cận được một quảng cáo điện thoại thông minh mới tung ra thị trường (tính bằng ngàn người) được ước lượng bởi $A(t) = 500(1 - e^(-0.2 t))$, với $t$ là số ngày từ khi chạy chiến dịch. Nếu chi phí mỗi ngày chạy quảng cáo là $2$ triệu đồng, công ty phải chi bao nhiêu triệu đồng để chiến dịch đạt được mức $400$ ngàn người tiếp cận? (Làm tròn ngày lên số nguyên lớn hơn gần nhất).],
    [18],
    loigiai: [
        Ta tìm thời gian $t$ để đạt $400$ ngàn người ($A(t) = 400$):
        $
          500(1 - e^(-0.2 t)) = 400 <=> 1 - e^(-0.2 t) = 400 / 500 = 0.8
        $
        $
          <=> e^(-0.2 t) = 0.2 <=> -0.2 t = ln(0.2) <=> t = (ln 0.2) / (-0.2) = (-1.609) / (-0.2) approx 8.047
        $
        Cần khoảng hơn 8 ngày, làm tròn lên thành 9 ngày chạy quảng cáo để đảm bảo đủ $400$ ngàn người tiếp cận.
        Chi phí cho $9$ ngày là $9 dot 2 = 18$ (triệu đồng).
    ]
)

// TL 6
#tln(
    [Một hòn đá được đun nóng đến $400degree "C"$ và ném vào một hồ nước đá có nhiệt độ ổn định là $0degree "C"$. Định luật làm nguội mô tả nhiệt độ hòn đá là $T(t) = 400 e^(-0.5 t)$, với $t$ tính bằng phút. Tốc độ làm nguội của hòn đá (đạo hàm của nhiệt độ theo thời gian) tại thời điểm hòn đá đạt $100degree "C"$ là bao nhiêu $degree "C"$/phút? (Lấy giá trị tuyệt đối của tốc độ).],
    [50],
    loigiai: [
        Trước hết, ta tìm thời điểm hòn đá đạt $100degree "C"$:
        $
          400 e^(-0.5 t) = 100 <=> e^(-0.5 t) = 1/4 <=> e^(-0.5 t) = 0.25
        $
        Tốc độ làm nguội là đạo hàm $T'(t)$:
        $
          T'(t) = 400 dot (-0.5) e^(-0.5 t) = -200 e^(-0.5 t)
        $
        Thay $e^(-0.5 t) = 0.25$ vào $T'(t)$:
        $
          T'(t) = -200 dot 0.25 = -50
        $
        Giá trị tuyệt đối của tốc độ là $50degree "C"$/phút.
        *(Lưu ý: Bài toán không yêu cầu giải ra cụ thể thời gian $t$, chỉ cần sử dụng tính chất của đạo hàm hàm mũ).*
    ]
)
] // end of make-questions

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
