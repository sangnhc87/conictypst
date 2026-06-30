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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 07)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một cơ sở nuôi trồng thủy sản nhận thấy lượng sinh khối cá trong ao tăng trưởng sau mỗi tháng. Ở tháng đầu tiên, lượng sinh khối thu được là $5$ tấn. Từ tháng thứ hai trở đi, do cải tiến quy trình chăm sóc, sinh khối thu được tăng thêm $1.5$ tấn so với tháng liền trước đó. Lượng sinh khối cá thu hoạch được ở tháng thứ $12$ là bao nhiêu tấn?],
    (
        [$19.5$ tấn.],
        [$20.0$ tấn.],
        True([$21.5$ tấn.]),
        [$23.0$ tấn.]
    ),
    loigiai: [
        Sinh khối cá thu được ở mỗi tháng lập thành một cấp số cộng với:
        - Số hạng đầu: $u_1 = 5$ (tấn).
        - Công sai: $d = 1.5$ (tấn).
        Sinh khối thu hoạch được ở tháng thứ 12 là số hạng $u_12$:
        $
          u_12 &= u_1 + 11d \
               &= 5 + 11 dot 1.5 \
               &= 5 + 16.5 = 21.5 " (tấn)"
        $
    ]
)

// TN 2
#tn([Khi một tia sáng truyền qua một môi trường hấp thụ ánh sáng, cường độ sáng $I$ của nó giảm dần. Biết rằng cứ sau khi truyền qua một tấm kính lọc màu dày $1$ cm, cường độ sáng của tia sáng giảm đi $15\%$ so với cường độ sáng trước khi đi vào tấm kính. Nếu tia sáng truyền qua $5$ tấm kính lọc màu liên tiếp như vậy thì cường độ sáng còn lại bằng bao nhiêu phần trăm so với cường độ sáng ban đầu?],
    (
        [$25\%$],
        True([$44.37\%$]),
        [$50\%$],
        [$55.63\%$]
    ),
    loigiai: [
        Gọi cường độ sáng ban đầu là $I_0$.
        - Sau khi đi qua tấm kính thứ 1, cường độ sáng còn lại là: $I_1 = I_0 dot (1 - 0.15) = 0.85 I_0$.
        - Sau khi đi qua tấm kính thứ $n$, cường độ sáng còn lại lập thành cấp số nhân:
        $ I_n = I_0 dot (0.85)^n $
        Với $n = 5$ tấm kính:
        $
          I_5 &= I_0 dot (0.85)^5 \
              &approx I_0 dot 0.443705 \
              &approx 44.37\% I_0
        $
    ]
)

// TN 3
#tn([Một quả lắc lò xo dao động trên một mặt phẳng nằm ngang. Do ma sát, sau mỗi chu kỳ dao động, biên độ của con lắc giảm đi $10\%$ so với biên độ của chu kỳ trước đó. Biết biên độ dao động ở chu kỳ thứ nhất là $8$ cm. Biên độ dao động của con lắc ở chu kỳ thứ $6$ là bao nhiêu cm?],
    (
        [$4.0$ cm.],
        True([$4.72$ cm.]),
        [$5.12$ cm.],
        [$5.84$ cm.]
    ),
    loigiai: [
        Biên độ dao động của con lắc qua các chu kỳ lập thành một cấp số nhân $(u_n)$ có:
        - Số hạng đầu: $u_1 = 8$ (cm).
        - Công bội: $q = 1 - 10\% = 0.9$.
        Biên độ ở chu kỳ thứ 6 là số hạng thứ 6:
        $
          u_6 &= u_1 dot q^5 \
              &= 8 dot (0.9)^5 \
              &= 8 dot 0.59049 \
              &approx 4.72 " (cm)"
        $
    ]
)

// TN 4
#tn([Dân số của một thành phố hiện nay là $2$ triệu người. Tốc độ tăng trưởng dân số bình quân của thành phố là $1.2\%$/năm. Dự báo dân số của thành phố đó sau $10$ năm nữa (làm tròn đến nghìn người) là bao nhiêu?],
    (
        [$2 240 000$ người.],
        [$2 250 000$ người.],
        True([$2 253 000$ người.]),
        [$2 260 000$ người.]
    ),
    loigiai: [
        Dân số thành phố sau $n$ năm lập thành một cấp số nhân có:
        - Số hạng đầu: $u_0 = 2 000 000$ (người).
        - Công bội: $q = 1 + 1.2\% = 1.012$.
        Dân số sau $n = 10$ năm là:
        $
          u_10 &= u_0 dot q^10 \
               &= 2 000 000 dot (1.012)^10 \
               &approx 2 000 000 dot 1.12669 \
               &approx 2 253 384 " (người)"
        $
        Làm tròn đến hàng nghìn người là $2 253 000$ người.
    ]
)

// TN 5
#tn([Một công ty công nghệ có số lượng nhân sự tăng trưởng liên tục. Năm đầu tiên thành lập công ty có $30$ nhân viên. Kể từ năm thứ hai, số lượng nhân sự tăng thêm $15$ người mỗi năm. Tổng số năm công ty hoạt động để quy mô nhân sự đạt mốc $180$ người là bao nhiêu năm?],
    (
        [$9$ năm.],
        [$10$ năm.],
        True([$11$ năm.]),
        [$12$ năm.]
    ),
    loigiai: [
        Quy mô nhân sự hàng năm lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 30$ (nhân viên).
        - Công sai: $d = 15$.
        Ta cần tìm $n$ sao cho $u_n = 180$:
        $
          u_n = u_1 + (n-1)d &<=> 180 = 30 + (n-1)15 \
                             &<=> 150 = 15(n-1) \
                             &<=> n - 1 = 10 <=> n = 11 " (năm)"
        $
    ]
)

// TN 6
#tn([Khi thả một quả bóng từ độ cao $12$ m xuống đất, mỗi lần chạm đất nó lại nảy lên một độ cao bằng $3/5$ độ cao trước đó. Tổng quãng đường quả bóng di chuyển (lên và xuống) kể từ lúc thả cho đến khi nó dừng hẳn bằng bao nhiêu mét?],
    (
        [$24$ m.],
        True([$48$ m.]),
        [$30$ m.],
        [$36$ m.]
    ),
    loigiai: [
        Quả bóng rơi từ độ cao $h = 12$ m với tỉ lệ nảy là $p = 3/5$.
        Áp dụng công thức tổng quãng đường di chuyển của quả bóng nảy lùi vô hạn:
        $
          S &= h dot (1 + p) / (1 - p) \
            &= 12 dot (1 + 3/5) / (1 - 3/5) \
            &= 12 dot (8/5) / (2/5) \
            &= 12 dot 4 = 48 " (m)"
        $
        
        Minh họa hành trình chuyển động nảy của quả bóng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Rơi từ độ cao 12
            line((0.5, 2.5), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 2.5), radius: 0.05, fill: blue)
            
            // Các đường nảy
            bezier((0.5, 0), (2.0, 0), (0.8, 1.5), (1.7, 1.5), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 0.9), (3.0, 0.9), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 0.54), (3.9, 0.54), stroke: blue)
            
            content((0.5, 2.75), [12m])
            content((1.25, 1.7), [7.2m])
            content((2.6, 1.1), [4.32m])
          })
        ]
    ]
)

// TN 7
#tn([Một người gửi tiết kiệm ngân hàng số tiền $100$ triệu đồng vào tài khoản với kỳ hạn 1 năm, lãi suất $6.5\%$/năm theo hình thức lãi kép. Tổng số tiền lãi người đó nhận được sau $3$ năm gửi (làm tròn đến hàng nghìn đồng) là bao nhiêu?],
    (
        [$19 500 000$ đồng.],
        [$20 780 000$ đồng.],
        True([$20 795 000$ đồng.]),
        [$21 200 000$ đồng.]
    ),
    loigiai: [
        Tổng số tiền người đó nhận được cả gốc lẫn lãi sau 3 năm gửi là:
        $
          A_3 &= 100 dot (1 + 0.065)^3 \
              &= 100 dot 1.2079496 \
              &approx 120.79496 " (triệu đồng)"
        $
        Số tiền lãi thu được là:
        $
          I = A_3 - 100 = 20.79496 " (triệu đồng)" = 20 794 960 " (đồng)"
        $
        Làm tròn đến hàng nghìn đồng là $20 795 000$ đồng.
    ]
)

// TN 8
#tn([Một tháp gạch đồ chơi gồm nhiều tầng xếp chồng lên nhau. Tầng dưới cùng có $50$ viên gạch, cứ lên một tầng thì số viên gạch lại giảm đi $2$ viên so với tầng ngay bên dưới. Biết tầng trên cùng có $2$ viên gạch. Hỏi chiếc tháp đó có tất cả bao nhiêu viên gạch?],
    (
        [$600$ viên.],
        True([$650$ viên.]),
        [$700$ viên.],
        [$750$ viên.]
    ),
    loigiai: [
        Số viên gạch ở mỗi hàng xếp từ dưới lên trên lập thành cấp số cộng với:
        - Số hạng đầu: $u_1 = 50$.
        - Công sai: $d = -2$.
        - Số hạng cuối: $u_n = 2$.
        Ta tìm số tầng $n$:
        $
          u_n = u_1 + (n-1)d &<=> 2 = 50 + (n-1)(-2) \
                             &<=> -48 = -2(n-1) \
                             &<=> n - 1 = 24 <=> n = 25
        $
        Tổng số gạch xếp được tháp là tổng $S_25$:
        $
          S_25 &= 25/2 (u_1 + u_25) \
               &= 25/2 (50 + 2) \
               &= 25/2 dot 52 = 650 " (viên)"
        $
    ]
)

// TN 9
#tn([Giá trị ban đầu của một thiết bị máy móc là $500$ triệu đồng. Do hao mòn tự nhiên, mỗi năm giá trị của thiết bị này giảm $12\%$ so với năm trước đó. Sau ít nhất bao nhiêu năm thì giá trị của thiết bị giảm xuống dưới $200$ triệu đồng?],
    (
        [$6$ năm.],
        [$7$ năm.],
        True([$8$ năm.]),
        [$9$ năm.]
    ),
    loigiai: [
        Giá trị thiết bị sau $n$ năm là $V_n = 500 dot (1 - 0.12)^n = 500 dot (0.88)^n$ (triệu đồng).
        Ta cần giải bất phương trình $V_n < 200$:
        $
          500 dot (0.88)^n < 200 &<=> (0.88)^n < 0.4 \
                                 &<=> n > log_0.88 (0.4) \
                                 &<=> n > ln(0.4) / ln(0.88) approx -0.916 / -0.1278 approx 7.17
        $
        Do $n$ nguyên dương nên sau ít nhất $8$ năm, giá trị thiết bị giảm xuống dưới $200$ triệu đồng.
    ]
)

// TN 10
#tn([Để chuẩn bị tiền cưới, anh Nam lập kế hoạch tiết kiệm gửi tiền đều đặn vào ngân hàng. Đầu mỗi tháng anh gửi $5$ triệu đồng với lãi suất tích lũy $0.5\%$/tháng theo hình thức lãi kép. Tổng số tiền anh tích lũy được ngay sau khi gửi tiền tháng thứ $12$ là bao nhiêu triệu đồng?],
    (
        [$60.5$ triệu.],
        True([$62.0$ triệu.]),
        [$63.5$ triệu.],
        [$65.0$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng số tiền tích lũy sau $n$ tháng gửi tiền đầu tháng:
        $
          A_n = M dot (1+r) dot ((1+r)^n - 1) / r
        $
        Thay $M = 5$ (triệu), $r = 0.005$, $n = 12$:
        $
          A_12 &= 5 dot 1.005 dot ((1.005)^12 - 1) / 0.005 \
               &= 5 dot 1.005 dot (1.061678 - 1) / 0.005 \
               &= 1005 dot 0.061678 \
               &approx 61.99 " (triệu đồng)"
        $
        Làm tròn xấp xỉ bằng $62.0$ triệu đồng.
    ]
)

// TN 11
#tn([Một chiếc ô tô đang chuyển động với vận tốc $20$ m/s thì người lái xe phát hiện chướng ngại vật và hãm phanh. Kể từ giây tiếp theo, vận tốc của xe giảm đi $10\%$ mỗi giây so với giây liền trước đó. Vận tốc của xe sau $5$ giây kể từ lúc bắt đầu hãm phanh xấp xỉ bằng bao nhiêu?],
    (
        [$10.5$ m/s.],
        True([$11.8$ m/s.]),
        [$12.5$ m/s.],
        [$13.2$ m/s.]
    ),
    loigiai: [
        Vận tốc của xe sau $n$ giây hãm phanh lập thành một cấp số nhân có:
        - Vận tốc ban đầu: $v_0 = 20$ m/s.
        - Công bội: $q = 1 - 10\% = 0.9$.
        Vận tốc sau $n = 5$ giây là:
        $
          v_5 &= v_0 dot q^5 \
              &= 20 dot (0.9)^5 \
              &= 20 dot 0.59049 = 11.8098 " (m/s)"
        $
        Vậy vận tốc xe sau 5 giây xấp xỉ $11.8$ m/s.
    ]
)

// TN 12
#tn([Một bệnh nhân cần dùng thuốc kháng sinh liều cao. Ban đầu bệnh nhân được tiêm $100$ mg thuốc. Sau mỗi giờ, lượng thuốc trong máu bệnh nhân bị cơ thể đào thải hết $20\%$ lượng thuốc hiện có. Đồng thời sau mỗi giờ bệnh nhân lại được tiêm thêm $10$ mg thuốc nữa. Mô hình lượng thuốc $M_n$ trong máu bệnh nhân sau $n$ giờ là dãy số nào dưới đây?],
    (
        [$M_n = 0.8 M_(n-1)$.],
        [$M_n = M_(n-1) + 10$.],
        True([$M_n = 0.8 M_(n-1) + 10$.]),
        [$M_n = 0.8 M_(n-1) - 10$.]
    ),
    loigiai: [
        Lượng thuốc trong cơ thể sau mỗi giờ bằng lượng thuốc ở giờ trước đó đào thải mất $20\%$ (tức là còn giữ lại $80\%$) cộng với lượng thuốc tiêm thêm $10$ mg:
        $
          M_n = 0.8 M_(n-1) + 10
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Phương pháp định tuổi bằng Cacbon-14 là một kỹ thuật dùng để xác định tuổi của các cổ vật hữu cơ. Lượng Cacbon-14 còn lại sau mỗi chu kỳ $5730$ năm giảm đi một nửa. Gọi $N_0$ là lượng Cacbon-14 ban đầu của cổ vật. Các phát biểu sau đúng hay sai?], (
        True([Lượng Cacbon-14 còn lại sau $n$ chu kỳ bán rã lập thành cấp số nhân với công bội $q = 0.5$.]),
        True([Sau $3$ chu kỳ bán rã, lượng Cacbon-14 còn lại chiếm $12.5\%$ so với ban đầu.]),
        True([Công thức tính lượng Cacbon-14 còn lại sau $t$ năm là $N(t) = N_0 dot (0.5)^(t/5730)$.]),
        True([Một mẫu xương cổ có lượng Cacbon-14 chỉ còn lại $25\%$ so với ban đầu thì tuổi của mẫu xương này xấp xỉ bằng $11460$ năm.])
    ), 
    loigiai: [
        - *a)* Đúng. Lượng chất sau mỗi chu kỳ giảm một nửa: $N_n = 0.5 N_(n-1)$, đây là cấp số nhân có công bội $q = 0.5$.
        - *b)* Đúng. $0.5^3 = 0.125 = 12.5\%$.
        - *c)* Đúng. Số chu kỳ bán rã sau $t$ năm là $n = t / 5730$, do đó $N(t) = N_0 dot (0.5)^(t/5730)$.
        - *d)* Đúng. Lượng chất còn lại $25\% = (0.5)^2$ tương ứng với $2$ chu kỳ bán rã trôi qua.
          Tuổi mẫu xương cổ là:
          $ t = 2 dot 5730 = 11460 " (năm)" $
    ]
)

// DS 2
#ds([Một khán đài nhà thi đấu được thiết kế hình vòng cung gồm $20$ hàng ghế. Hàng đầu tiên có $30$ ghế. Từ hàng thứ hai trở đi, mỗi hàng có số ghế nhiều hơn hàng liền trước nó $4$ ghế. Các phát biểu sau đúng hay sai?], (
        True([Số lượng ghế ở mỗi hàng lập thành cấp số cộng với công sai $d = 4$.]),
        [Hàng ghế cuối cùng (hàng thứ 20) có $110$ ghế.],
        True([Khán đài nhà thi đấu đó có tổng sức chứa là $1360$ khách ngồi.]),
        [Tổng số ghế của cả khán đài lớn hơn $1500$ ghế.]
    ), 
    loigiai: [
        Số ghế ở hàng thứ $n$ lập thành cấp số cộng với $u_1 = 30, d = 4$.
        - *a)* Đúng.
        - *b)* Sai. Hàng thứ 20 có:
          $ u_20 = u_1 + 19d = 30 + 19 dot 4 = 106 " (ghế)" $
        - *c)* Đúng. Tổng sức chứa của khán đài 20 hàng ghế là:
          $
            S_20 &= 20/2 [u_1 + u_20] \
                 &= 10 [30 + 106] = 1360 " (ghế)"
          $
        - *d)* Sai. Tổng số ghế bằng $1360 < 1500$.
    ]
)

// DS 3
#ds([Một người có kế hoạch gửi tiền tiết kiệm hàng năm để tích lũy quỹ hưu trí. Đầu mỗi năm người đó gửi đều đặn vào ngân hàng số tiền $20$ triệu đồng với lãi suất ổn định $6\%$/năm theo hình thức lãi kép. Các phát biểu sau đúng hay sai?], (
        [Dãy số tiền tích lũy thu được sau mỗi năm lập thành một cấp số nhân.],
        True([Tổng số tiền tích lũy được tính đến cuối năm thứ 3 là xấp xỉ $67.49$ triệu đồng.]),
        True([Công thức tính tổng tiền tích lũy thu được vào cuối năm thứ $n$ là $A_n = 20 dot 1.06 dot (1.06^n - 1) / 0.06$ (triệu đồng).]),
        True([Tổng quỹ tích lũy đạt được vào cuối năm thứ 10 là xấp xỉ $279.43$ triệu đồng.])
    ), 
    loigiai: [
        - *a)* Sai. Khoản tiền gửi tích lũy có tổng cộng thêm số tiền cố định 20 triệu mỗi năm nên số tiền tích lũy không lập thành một cấp số nhân.
        - *b)* Đúng. Cuối năm thứ 3:
          $
            A_3 &= 20 dot 1.06^3 + 20 dot 1.06^2 + 20 dot 1.06 \
                &= 20 dot 1.06 dot ((1.06^3 - 1) / 0.06) \
                &approx 67.49 " (triệu đồng)"
          $
        - *c)* Đúng.
        - *d)* Đúng. Cuối năm thứ 10:
          $
            A_10 &= 20 dot 1.06 dot ((1.06^10 - 1) / 0.06) \
                 &approx 279.43 " (triệu đồng)"
          $
    ]
)

// DS 4
#ds([Khảo sát tốc độ lây lan của một loại virus trong một khu vực dân cư. Ban đầu có $50$ người bị nhiễm bệnh. Cứ sau mỗi ngày, số người bị nhiễm tăng thêm $15\%$ so với ngày hôm trước. Các phát biểu sau đúng hay sai?], (
        [Số người nhiễm bệnh sau mỗi ngày lập thành một cấp số cộng.],
        True([Số người nhiễm bệnh sau 5 ngày là xấp xỉ $100$ người.]),
        True([Số người nhiễm bệnh sau $n$ ngày được tính bằng công thức $N_n = 50 dot (1.15)^n$.]),
        [Để số người nhiễm bệnh vượt quá $500$ người thì phải mất ít nhất $17$ ngày.]
    ), 
    loigiai: [
        Số người nhiễm bệnh sau $n$ ngày lập thành cấp số nhân với $u_0 = 50, q = 1.15$.
        - *a)* Sai. Dãy số lập thành cấp số nhân.
        - *b)* Đúng. $u_5 = 50 dot (1.15)^5 approx 50 dot 2.01136 approx 100.57$ người.
        - *c)* Đúng.
        - *d)* Sai. Ta tìm $n$ sao cho $u_n > 500$:
          $
            50 dot (1.15)^n > 500 &<=> 1.15^n > 10 \
                                  &<=> n > log_1.15 (10) approx 16.47
          $
          Do đó cần ít nhất 17 ngày để vượt quá 500 người.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một chiếc bể chứa $1500$ lít nước. Do bị rò rỉ nên mỗi ngày bể bị thất thoát mất $10\%$ lượng nước hiện có. Đồng thời vào cuối mỗi ngày người ta bơm thêm vào bể $100$ lít nước. Hỏi sau thời gian rất dài, lượng nước trong bể sẽ ổn định ở mức bao nhiêu lít?],
    [1000],
    loigiai: [
        Gọi $V_n$ là lượng nước trong bể sau $n$ ngày. Ta có hệ thức truy hồi:
        $ V_n = 0.9 V_(n-1) + 100 $
        Khi thời gian tiến đến vô hạn ($n -> +oo$), lượng nước trong bể tiến đến giới hạn ổn định $L$:
        $
          L = 0.9 L + 100 &<=> 0.1 L = 100 \
                          &<=> L = 1000 " (lít)"
        $
        Vậy sau thời gian rất lâu, lượng nước trong bể ổn định ở mức $1000$ lít.
    ]
)

// TL 2
#tln([Một cầu thang sắt ngoài trời được thiết kế gồm $20$ bậc. Chiều rộng của bậc dưới cùng là $1.5$ mét, và cứ lên mỗi bậc thì chiều rộng lại giảm đi một lượng không đổi $d$ mét. Biết bậc trên cùng rộng $0.74$ mét. Tìm giá trị công sai $d$ của cấp số cộng đó (tính bằng xăng-ti-mét).],
    [4],
    loigiai: [
        Chiều rộng các bậc thang lập thành cấp số cộng với $u_1 = 1.5$ (m), $u_20 = 0.74$ (m) và công sai là $-d$.
        Ta giải phương trình:
        $
          u_20 = u_1 + 19(-d) &<=> 0.74 = 1.5 - 19d \
                              &<=> 19d = 0.76 \
                              &<=> d = 0.04 " (mét)"
        $
        Đổi ra xăng-ti-mét: $0.04$ m bằng $4$ cm.
        
        Hình vẽ thiết kế bậc thang giảm dần chiều rộng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let x = 0.0
            let y = 0.0
            let steps = 6
            let h = 0.2
            
            line((-0.5, 0), (4.5, 0), stroke: 1pt + gray)
            
            for i in range(0, steps) {
              let width = 1.5 - i * 0.15
              rect((x, y), (x + width, y + h), stroke: 1pt + black, fill: rgb("#eef4ff"))
              x = x + 0.18
              y = y + h
            }
            
            content((0.75, -0.35), [Bậc 1: 1.5m])
            content((x + 0.3, y + 0.2), [Bậc 20: 0.74m])
          })
        ]
    ]
)

// TL 3
#tln([Một tín hiệu sóng vô tuyến truyền qua một loạt các trạm phát sóng liên tiếp. Biết rằng qua mỗi trạm, do nhiễu nên cường độ tín hiệu bị giảm đi $8\%$ so với cường độ khi đi vào trạm đó. Hỏi sau khi đi qua tối thiểu bao nhiêu trạm phát sóng thì cường độ tín hiệu còn lại nhỏ hơn một nửa cường độ tín hiệu ban đầu?],
    [9],
    loigiai: [
        Gọi cường độ ban đầu là $I_0$. Sau khi đi qua $n$ trạm phát sóng cường độ còn lại là:
        $ I_n = I_0 dot (1 - 0.08)^n = I_0 dot (0.92)^n $
        Yêu cầu bài toán tìm $n$ nguyên dương tối thiểu sao cho $I_n < 0.5 I_0$:
        $
          I_0 dot (0.92)^n < 0.5 I_0 &<=> (0.92)^n < 0.5 \
                                     &<=> n > log_0.92 (0.5) \
                                     &<=> n > ln(0.5) / ln(0.92) approx -0.69315 / -0.08338 approx 8.31
        $
        Do $n$ là số nguyên nên cần đi qua ít nhất $9$ trạm phát sóng.
    ]
)

// TL 4
#tln([Một chiếc lò xo dài $20$ cm khi treo quả cân $100$ g. Cứ treo thêm mỗi quả cân $50$ g thì lò xo lại giãn dài thêm $3$ cm. Nếu treo tổng cộng một vật nặng $450$ g thì chiều dài của lò xo lúc đó bằng bao nhiêu cm? (Giả sử lò xo luôn trong giới hạn đàn hồi).],
    [41],
    loigiai: [
        - Khối lượng ban đầu của quả cân là $100$ g tương ứng chiều dài $l_1 = 20$ cm.
        - Khối lượng cần treo thêm là:
          $ 450 - 100 = 350 " (g)" $
        - Số lượng quả cân $50$ g cần treo thêm là:
          $ N = 350 / 50 = 7 " (lần)" $
        - Chiều dài lò xo tăng thêm qua 7 lần treo thêm quả cân là:
          $ Delta l = 7 dot 3 = 21 " (cm)" $
        - Chiều dài của lò xo lúc này là:
          $ L = l_1 + Delta l = 20 + 21 = 41 " (cm)" $
    ]
)

// TL 5
#tln([Một khoản vay trị giá $500$ triệu đồng được hoàn trả bằng các kỳ khoản hàng năm cố định trong $10$ năm với lãi suất cố định $8\%$/năm. Khoản tiền kỳ khoản hàng năm mà người đi vay phải trả vào cuối mỗi năm (làm tròn đến triệu đồng) bằng bao nhiêu?],
    [75],
    loigiai: [
        Áp dụng công thức trả nợ đều hàng năm (kỳ khoản cố định):
        $
          X = (D_0 dot r dot (1+r)^n) / ((1+r)^n - 1)
        $
        Thay $D_0 = 500$ (triệu), $r = 0.08$, $n = 10$:
        $
          X &= (500 dot 0.08 dot (1.08)^10) / ((1.08)^10 - 1) \
            &= (40 dot 2.158925) / (2.158925 - 1) \
            &= 86.357 / 1.158925 \
            &approx 74.51 " (triệu đồng)"
        $
        Làm tròn đến hàng đơn vị triệu đồng là $75$ triệu đồng.
    ]
)

// TL 6
#tln([Một doanh nghiệp đầu tư ban đầu $1$ tỷ đồng để phát triển sản xuất. Mỗi năm sau, doanh nghiệp đầu tư thêm $100$ triệu đồng so với năm trước đó. Đồng thời, lợi nhuận ròng thu về hàng năm tăng trưởng theo cấp số nhân với công bội $q = 1.15$. Biết năm đầu tiên doanh nghiệp thu về lợi nhuận $200$ triệu đồng. Hỏi sau $5$ năm hoạt động, tổng số lợi nhuận ròng doanh nghiệp thu về vượt quá tổng số tiền đã đầu tư thêm bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị)],
    [348],
    loigiai: [
        - Tổng số tiền đầu tư thêm sau 5 năm (năm 2 thêm 100, năm 3 thêm 200, năm 4 thêm 300, năm 5 thêm 400):
          $ T_d = 100 + 200 + 300 + 400 = 1000 " (triệu đồng)" $
        - Tổng số lợi nhuận ròng thu về sau 5 năm lập thành một cấp số nhân có $v_1 = 200$, $q = 1.15$:
          $
            T_l &= v_1 dot (1 - q^5) / (1 - q) \
                &= 200 dot (1 - 1.15^5) / (1 - 1.15) \
                &approx 200 dot 6.74238 \
                &approx 1348.48 " (triệu đồng)"
          $
        - Lợi nhuận ròng vượt quá tổng đầu tư thêm:
          $ Delta = T_l - T_d = 1348.48 - 1000 = 348.48 " (triệu đồng)" $
        Làm tròn đến hàng đơn vị là $348$ triệu đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
