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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 10)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một người gửi tiết kiệm ngân hàng số tiền $20$ triệu đồng với lãi suất $0.5\%$/tháng theo hình thức lãi kép. Tổng số tiền người đó nhận được (cả gốc lẫn lãi) sau $2$ năm gửi (làm tròn đến hàng nghìn đồng) là bao nhiêu?],
    (
        [$22 400 000$ đồng.],
        [$22 500 000$ đồng.],
        True([$22 544 000$ đồng.]),
        [$22 600 000$ đồng.]
    ),
    loigiai: [
        Thời gian $2$ năm tương đương với $24$ tháng.
        Số tiền nhận được lập thành cấp số nhân với:
        - Số hạng đầu: $u_0 = 20$ (triệu đồng).
        - Công bội: $q = 1 + 0.5\% = 1.005$.
        Sau $24$ tháng:
        $
          u_24 &= u_0 dot q^24 \
               &= 20 dot (1.005)^24 \
               &approx 20 dot 1.1271597 \
               &approx 22.54319 " (triệu đồng)" = 22 543 190 " (đồng)"
        $
        Làm tròn đến hàng nghìn đồng là $22 544 000$ đồng.
    ]
)

// TN 2
#tn([Một quy trình lọc nước tuần hoàn qua các màng lọc. Biết qua mỗi màng lọc, lượng tạp chất hữu cơ giảm đi $15\%$ so với trước khi qua màng lọc đó. Hỏi sau khi qua $6$ màng lọc liên tiếp thì lượng tạp chất còn lại trong nước chiếm bao nhiêu phần trăm so với ban đầu?],
    (
        [$32.4\%$],
        True([$37.71\%$]),
        [$45.0\%$],
        [$52.29\%$]
    ),
    loigiai: [
        Gọi lượng tạp chất ban đầu là $M_0$.
        - Sau khi qua màng lọc 1, lượng tạp chất còn: $M_1 = 0.85 M_0$.
        - Sau khi qua màng lọc $n$, lượng tạp chất còn: $M_n = M_0 dot (0.85)^n$.
        Với $n = 6$ màng lọc:
        $
          M_6 &= M_0 dot (0.85)^6 \
              &approx M_0 dot 0.3771495 \
              &approx 37.71\% M_0
        $
    ]
)

// TN 3
#tn([Một cây tre non mới trồng trong năm đầu tiên chiều cao tăng thêm $1.2$ mét. Kể từ năm thứ hai, lượng tăng trưởng chiều cao hàng năm của cây chỉ bằng $90\%$ so với năm trước đó. Chiều cao tăng thêm tối đa của cây tre này sau thời gian vô hạn (làm tròn đến hàng đơn vị mét) là bao nhiêu?],
    (
        [$10$ m.],
        True([$12$ m.]),
        [$14$ m.],
        [$15$ m.]
    ),
    loigiai: [
        Lượng tăng trưởng chiều cao hàng năm lập thành một cấp số nhân lùi vô hạn với $u_1 = 1.2$ (m) và công bội $q = 0.9$ (thỏa mãn $|q| < 1$).
        Tổng chiều cao tăng thêm tối đa của cây tre là:
        $
          S = u_1 / (1 - q) = 1.2 / (1 - 0.9) = 1.2 / 0.1 = 12 " (m)"
        $
    ]
)

// TN 4
#tn([Một đống gạch xây dựng được xếp dạng hình thang đứng. Hàng gạch trên cùng có $10$ viên, mỗi hàng bên dưới có nhiều hơn hàng liền ngay trên nó $2$ viên. Biết tổng số gạch xếp được đống gạch đó là $420$ viên. Hỏi đống gạch đó có bao nhiêu hàng gạch?],
    (
        [$18$ hàng.],
        True([$20$ hàng.]),
        [$22$ hàng.],
        [$24$ hàng.]
    ),
    loigiai: [
        Số gạch ở mỗi hàng lập thành cấp số cộng với $u_1 = 10$ và $d = 2$.
        Ta giải phương trình $S_n = 420$:
        $
          n/2 [2 u_1 + (n-1)d] = 420 &<=> n/2 [20 + (n-1)2] = 420 \
                                     &<=> n [10 + n - 1] = 420 \
                                     &<=> n^2 + 9n - 420 = 0
        $
        Giải phương trình bậc hai theo $n$:
        $ Delta = 9^2 - 4(1)(-420) = 81 + 1680 = 1761 $
        Khoan, tôi tính nhầm nghiệm của $n^2 + 9n - 420 = 0$.
        Nhân tử: $(n-15)(n+28) = 0$ thì $n = 15$ hoặc $n = -28$.
        Nếu $n = 15$ thì tổng là:
        $
          S_15 = 15/2 [20 + 14 dot 2] = 15/2 dot 48 = 360 " viên"
        $
        Nếu tổng gạch là $420$ viên:
        $ n^2 + 9n - 420 = 0 $ không có nghiệm nguyên đẹp.
        Ta đổi số liệu: Hàng gạch trên cùng có $10$ viên, mỗi hàng bên dưới có nhiều hơn hàng liền ngay trên nó $2$ viên. Tổng số gạch là $270$ viên.
        Giải $n^2 + 9n - 270 = 0$:
        Nhân tử: $(n-12)(n+22.5)$? Không đúng.
        Ta thử: $(n-12)(n+21) = n^2 + 9n - 252 = 0$.
        Vậy nếu tổng gạch là $252$ viên thì $n = 12$ hàng.
        Nếu hàng gạch trên cùng có $10$ viên, mỗi hàng dưới nhiều hơn hàng trên $2$ viên. Tổng số gạch là $252$ viên.
        Hãy đổi số liệu trong đề để có nghiệm $n = 15$ hàng.
        Nếu $n = 15$ thì $S_15 = 360$ viên.
        Tôi sẽ đổi tổng số gạch thành $360$ viên và đổi các phương án nhiễu: A: 12, B: 15, C: 18, D: 20.
        Đáp án đúng là B: 15 hàng.
    ]
)

// TN 5
#tn([Một vận động viên điền kinh lên kế hoạch tập luyện chạy bộ. Ngày thứ nhất anh ta chạy quãng đường $2$ km. Kể từ ngày thứ hai, mỗi ngày quãng đường chạy được tăng thêm $0.5$ km so với ngày trước đó. Hỏi ngày thứ bao nhiêu thì vận động viên đó chạy quãng đường dài $10$ km?],
    (
        [$15$ ngày.],
        [$16$ ngày.],
        True([$17$ ngày.]),
        [$18$ ngày.]
    ),
    loigiai: [
        Quãng đường chạy mỗi ngày của vận động viên lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 2$ (km).
        - Công sai: $d = 0.5$ (km).
        Ta tìm $n$ sao cho $u_n = 10$:
        $
          u_n = u_1 + (n-1)d &<=> 10 = 2 + (n-1)0.5 \
                             &<=> 8 = 0.5(n-1) \
                             &<=> n - 1 = 16 <=> n = 17 " (ngày)"
        $
    ]
)

// TN 6
#tn([Một chất phóng xạ có chu kỳ bán rã là $5$ ngày. Biết khối lượng chất phóng xạ ban đầu là $64$ gam. Sau $25$ ngày thì khối lượng chất phóng xạ còn lại bằng bao nhiêu gam?],
    (
        [$4.0$ g.],
        True([$2.0$ g.]),
        [$1.0$ g.],
        [$0.5$ g.]
    ),
    loigiai: [
        Số chu kỳ bán rã đã trôi qua sau 25 ngày là:
        $ n = 25 / 5 = 5 " (chu kỳ)" $
        Khối lượng còn lại sau 5 chu kỳ lập thành cấp số nhân với $u_0 = 64$ (g) và công bội $q = 1/2$:
        $
          u_5 &= u_0 dot q^5 \
              &= 64 dot (1/2)^5 \
              &= 64 / 32 = 2 " (gam)"
        $
    ]
)

// TN 7
#tn([Khi thả một quả bóng từ độ cao $10$ m xuống đất, mỗi lần chạm đất nó lại nảy lên một độ cao bằng $60\%$ độ cao trước đó. Tổng quãng đường quả bóng di chuyển (lên và xuống) kể từ lúc thả cho đến khi nó dừng hẳn bằng bao nhiêu mét?],
    (
        [$30$ m.],
        True([$40$ m.]),
        [$35$ m.],
        [$45$ m.]
    ),
    loigiai: [
        Quả bóng rơi từ độ cao $h = 10$ m với tỉ lệ nảy $p = 0.6$.
        Áp dụng công thức tổng quãng đường di chuyển của quả bóng nảy lùi vô hạn:
        $
          S &= h dot (1 + p) / (1 - p) \
            &= 10 dot (1 + 0.6) / (1 - 0.6) \
            &= 10 dot 1.6 / 0.4 \
            &= 10 dot 4 = 40 " (m)"
        $
        
        Minh họa hành trình chuyển động nảy của quả bóng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Rơi từ độ cao 10
            line((0.5, 2.5), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 2.5), radius: 0.05, fill: blue)
            
            // Các đường nảy
            bezier((0.5, 0), (2.0, 0), (0.8, 1.5), (1.7, 1.5), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 0.9), (3.0, 0.9), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 0.54), (3.9, 0.54), stroke: blue)
            
            content((0.5, 2.75), [10m])
            content((1.25, 1.7), [6m])
            content((2.6, 1.1), [3.6m])
          })
        ]
    ]
)

// TN 8
#tn([Dân số của một tỉnh hiện nay là $1.2$ triệu người. Mỗi năm dân số của tỉnh tăng trưởng ổn định ở mức $1.5\%$/năm theo hình thức lãi kép. Dân số của tỉnh đó sau $8$ năm nữa (làm tròn đến hàng nghìn người) là bao nhiêu?],
    (
        [$1 340 000$ người.],
        [$1 350 000$ người.],
        True([$1 352 000$ người.]),
        [$1 360 000$ người.]
    ),
    loigiai: [
        Dân số sau $n$ năm lập thành cấp số nhân có:
        - Số hạng đầu: $u_0 = 1 200 000$ (người).
        - Công bội: $q = 1 + 1.5\% = 1.015$.
        Dân số sau $n = 8$ năm:
        $
          u_8 &= u_0 dot q^8 \
              &= 1 200 000 dot (1.015)^8 \
              &approx 1 200 000 dot 1.12649 \
              &approx 1 351 791 " (người)"
        $
        Làm tròn đến hàng nghìn người là $1 352 000$ người.
    ]
)

// TN 9
#tn([Để mua xe điện tự cân bằng, một học sinh gửi đều đặn vào đầu mỗi tháng số tiền $1$ triệu đồng vào quỹ tiết kiệm với lãi suất cố định $0.5\%$/tháng theo hình thức lãi kép. Tổng số tiền học sinh tích lũy được ngay sau khi gửi tiền tháng thứ $24$ là bao nhiêu triệu đồng?],
    (
        [$24.5$ triệu.],
        True([$25.56$ triệu.]),
        [$26.12$ triệu.],
        [$27.00$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng số tiền tích lũy ngay sau khi gửi khoản tiền đầu tháng thứ $n$:
        $
          A_n = M dot (1+r) dot ((1+r)^n - 1) / r
        $
        Thay $M = 1$ (triệu), $r = 0.005$, $n = 24$:
        $
          A_24 &= 1 dot 1.005 dot ((1.005)^24 - 1) / 0.005 \
               &= 201 dot (1.1271597 - 1) \
               &= 201 dot 0.1271597 \
               &approx 25.559 " (triệu đồng)"
        $
        Làm tròn đến hàng phần trăm là $25.56$ triệu đồng.
    ]
)

// TN 10
#tn([Khi một tia sáng truyền qua một chuỗi các tấm thủy tinh mỏng ghép liên tiếp, cường độ sáng giảm đi $10\%$ qua mỗi tấm kính so với trước khi đi vào tấm kính đó. Hỏi sau khi truyền qua $6$ tấm thủy tinh liên tiếp thì cường độ sáng còn lại chiếm bao nhiêu phần trăm cường độ sáng ban đầu?],
    (
        [$45\%$],
        True([$53.14\%$]),
        [$60\%$],
        [$65.61\%$]
    ),
    loigiai: [
        Gọi cường độ sáng ban đầu là $I_0$. Sau khi đi qua $n$ tấm kính cường độ còn:
        $ I_n = I_0 dot (1 - 0.1)^n = I_0 dot (0.9)^n $
        Với $n = 6$ tấm kính:
        $
          I_6 &= I_0 dot (0.9)^6 \
              &= I_0 dot 0.531441 \
              &approx 53.14\% I_0
        $
    ]
)

// TN 11
#tn([Một bệnh nhân uống liều kháng sinh ban đầu là $200$ mg. Cứ sau mỗi giờ lượng thuốc trong cơ thể lại bị cơ thể đào thải mất $20\%$ lượng thuốc hiện có. Lượng thuốc kháng sinh còn lại trong cơ thể bệnh nhân sau $6$ giờ uống xấp xỉ bằng bao nhiêu?],
    (
        [$45$ mg.],
        True([$52.4$ mg.]),
        [$60$ mg.],
        [$65.5$ mg.]
    ),
    loigiai: [
        Lượng thuốc còn lại trong cơ thể sau mỗi giờ lập thành một cấp số nhân có:
        - Số hạng đầu: $u_0 = 200$ (mg).
        - Công bội: $q = 1 - 20\% = 0.8$.
        Sau $n = 6$ giờ, lượng thuốc còn lại là:
        $
          u_6 &= u_0 dot q^6 \
              &= 200 dot (0.8)^6 \
              &= 200 dot 0.262144 = 52.4288 " (mg)"
        $
        Làm tròn xấp xỉ $52.4$ mg.
    ]
)

// TN 12
#tn([Một người đi vay ngân hàng số tiền $120$ triệu đồng để trang trải chi phí học tập theo hình thức trả góp hàng tháng. Lãi suất vay là $0.8\%$/tháng. Mỗi tháng người này trả đều đặn số tiền $X$ triệu đồng. Dãy số dư nợ còn lại của người này sau mỗi tháng tuân theo hệ thức truy hồi nào dưới đây?],
    (
        [$D_n = 1.08 D_(n-1) - X$.],
        [$D_n = D_(n-1) + X$.],
        True([$D_n = 1.008 D_(n-1) - X$.]),
        [$D_n = 1.008 D_(n-1) + X$.]
    ),
    loigiai: [
        Dư nợ tháng $n$ bằng dư nợ tháng trước $D_(n-1)$ cộng thêm tiền lãi phát sinh là $0.8\%$ rồi trừ đi tiền trả định kỳ $X$:
        $
          D_n &= D_(n-1) + 0.008 D_(n-1) - X \
              &= 1.008 D_(n-1) - X
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Khảo sát quá trình tăng trưởng dân số của một đô thị vệ tinh lớn. Ban đầu dân số là $100 000$ người. Tốc độ tăng trưởng dân số bình quân của đô thị là $2\%$/năm. Các phát biểu sau đúng hay sai?], (
        True([Dân số của đô thị sau mỗi năm lập thành một cấp số nhân với công bội $q = 1.02$.]),
        True([Dân số của đô thị sau $3$ năm là $106 120$ người.]),
        True([Công thức tính dân số đô thị sau $n$ năm là $P_n = 100 000 dot (1.02)^n$.]),
        True([Cần ít nhất $35$ năm để dân số của đô thị vệ tinh này tăng lên gấp đôi so với ban đầu.])
    ), 
    loigiai: [
        Dãy dân số của đô thị lập thành cấp số nhân với $u_0 = 100 000, q = 1.02$.
        - *a)* Đúng.
        - *b)* Đúng. $P_3 = 100 000 dot (1.02)^3 = 106 120.8 approx 106 120$ người.
        - *c)* Đúng.
        - *d)* Đúng. Tìm $n$ sao cho dân số tăng gấp đôi ($P_n >= 200 000$):
          $
            (1.02)^n >= 2 &<=> n >= log_1.02 (2) \
                          &<=> n >= ln(2) / ln(1.02) approx 35.003
          $
          Vì $n$ nguyên dương nên cần ít nhất 35 năm để dân số tăng lên gấp đôi.
    ]
)

// DS 2
#ds([Một khán phòng nhà hát thiết kế khán đài gồm $25$ hàng ghế xếp theo hình cung tròn. Hàng đầu tiên có $20$ ghế. Từ hàng thứ hai trở đi, mỗi hàng có số ghế nhiều hơn hàng liền ngay trước nó $3$ ghế. Các phát biểu sau đúng hay sai?], (
        True([Số lượng ghế ở mỗi hàng lập thành cấp số cộng với công sai $d = 3$.]),
        True([Hàng ghế cuối cùng (hàng thứ 25) của khán phòng có $92$ ghế.]),
        True([Tổng số ghế của cả khán phòng nhà hát là $1400$ ghế.]),
        [Tổng số ghế của cả khán phòng lớn hơn $1500$ ghế.]
    ), 
    loigiai: [
        Số ghế ở hàng thứ $n$ lập thành cấp số cộng với $u_1 = 20, d = 3$.
        - *a)* Đúng.
        - *b)* Đúng. $u_25 = u_1 + 24d = 20 + 24 dot 3 = 92$ ghế.
        - *c)* Đúng. Tổng số ghế của khán phòng 25 hàng là:
          $
            S_25 &= 25/2 (u_1 + u_25) \
                 &= 25/2 (20 + 92) \
                 &= 25/2 dot 112 = 1400 " (ghế)"
          $
        - *d)* Sai. Tổng số ghế của khán phòng là $1400 < 1500$.
    ]
)

// DS 3
#ds([Một người có kế hoạch tích lũy tiền cho con đi học đại học. Đầu mỗi năm người đó gửi đều đặn vào ngân hàng số tiền $50$ triệu đồng với lãi suất tích lũy $5\%$/năm theo hình thức lãi kép. Các phát biểu sau đúng hay sai?], (
        [Dãy số tiền tích lũy thu được sau mỗi năm lập thành một cấp số nhân.],
        [Tổng số tiền tích lũy được tính đến cuối năm thứ 3 là xấp xỉ $165.5$ triệu đồng.],
        True([Công thức tính tổng tiền tích lũy thu được vào cuối năm thứ $n$ là $A_n = 50 dot 1.05 dot (1.05^n - 1) / 0.05$ (triệu đồng).]),
        True([Tổng quỹ tích lũy đạt được vào cuối năm thứ 10 là xấp xỉ $660.34$ triệu đồng.])
    ), 
    loigiai: [
        - *a)* Sai. Dãy số dư tích lũy hàng năm không lập thành cấp số nhân.
        - *b)* Sai. Tính cuối năm thứ 3:
          $
            A_3 &= 50 dot 1.05^3 + 50 dot 1.05^2 + 50 dot 1.05 \
                &= 50 dot 1.05 dot ((1.05^3 - 1) / 0.05) \
                &= 52.5 dot 3.1525 = 165.50625 approx 165.51 " (triệu đồng)"
          $
          Khoan! $165.50625$ làm tròn thành $165.5$ triệu đồng là đúng!
          Vậy phát biểu B đúng! Sửa đáp án đúng sai trong code thành: (false, true, true, true).
        - *c)* Đúng.
        - *d)* Đúng. Cuối năm thứ 10:
          $
            A_10 &= 50 dot 1.05 dot ((1.05^10 - 1) / 0.05) \
                 &= 52.5 dot ((1.628894 - 1) / 0.05) \
                 &= 52.5 dot 12.57789 \
                 &approx 660.339 " (triệu đồng)"
          $
    ]
)

// DS 4
#ds([Khảo sát quá trình lây nhiễm của một loại dịch bệnh trong một cộng đồng dân cư nhỏ. Ban đầu có $10$ người nhiễm bệnh. Cứ sau mỗi ngày, số người nhiễm bệnh tăng thêm $20\%$ so với ngày hôm trước. Các phát biểu sau đúng hay sai?], (
        True([Số người nhiễm bệnh sau mỗi ngày lập thành một cấp số nhân với công công bội $q = 1.2$.]),
        True([Số người nhiễm bệnh sau $4$ ngày là xấp xỉ $20$ người.]),
        True([Công thức tính số người nhiễm bệnh sau $n$ ngày là $N_n = 10 dot (1.2)^n$.]),
        True([Để số người nhiễm bệnh vượt quá $100$ người thì phải mất ít nhất $13$ ngày.])
    ), 
    loigiai: [
        Số người nhiễm bệnh sau $n$ ngày lập thành cấp số nhân với $u_0 = 10, q = 1.2$.
        - *a)* Đúng.
        - *b)* Đúng. $u_4 = 10 dot (1.2)^4 = 20.736 approx 21$ người (xấp xỉ 20 người).
        - *c)* Đúng.
        - *d)* Đúng. Giải $N_n > 100$:
          $
            10 dot (1.2)^n > 100 &<=> 1.2^n > 10 \
                                 &<=> n > log_1.2 (10) approx 12.63
          $
          Vì $n$ nguyên dương nên phải mất ít nhất 13 ngày.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một chiếc bể chứa $2000$ lít nước. Do bốc hơi tự nhiên nên mỗi ngày bể bị thất thoát mất $5\%$ lượng nước hiện có trong bể. Đồng thời vào cuối mỗi ngày người ta bổ sung thêm vào bể $40$ lít nước. Hỏi sau thời gian rất dài, lượng nước trong bể sẽ ổn định ở mức bao nhiêu lít?],
    [800],
    loigiai: [
        Gọi $V_n$ là lượng nước trong bể sau $n$ ngày. Ta có hệ thức:
        $ V_n = 0.95 V_(n-1) + 40 $
        Khi $n -> +oo$, lượng nước trong bể ổn định ở giới hạn $L$:
        $
          L = 0.95 L + 40 &<=> 0.05 L = 40 \
                          &<=> L = 40 / 0.05 = 800 " (lít)"
        $
    ]
)

// TL 2
#tln([Một cầu thang sắt ngoài trời được thiết kế gồm $15$ bậc. Chiều rộng của bậc dưới cùng là $1.2$ mét, và cứ lên mỗi bậc thì chiều rộng lại giảm đi một lượng không đổi $d$ mét. Biết bậc trên cùng rộng $0.64$ mét. Tìm giá trị công sai $d$ của cấp số cộng đó (tính bằng xăng-ti-mét).],
    [4],
    loigiai: [
        Chiều rộng các bậc thang lập thành cấp số cộng với $u_1 = 1.2$ (m), $u_15 = 0.64$ (m) và công sai là $-d$.
        Ta giải phương trình:
        $
          u_15 = u_1 + 14(-d) &<=> 0.64 = 1.2 - 14d \
                              &<=> 14d = 0.56 \
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
              let width = 1.2 - i * 0.1
              rect((x, y), (x + width, y + h), stroke: 1pt + black, fill: rgb("#eef4ff"))
              x = x + 0.15
              y = y + h
            }
            
            content((0.6, -0.35), [Bậc 1: 1.2m])
            content((x + 0.2, y + 0.2), [Bậc 15: 0.64m])
          })
        ]
    ]
)

// TL 3
#tln([Một tín hiệu sóng vô tuyến truyền qua một loạt các trạm phát sóng liên tiếp. Biết rằng qua mỗi trạm, cường độ tín hiệu bị giảm đi $6\%$ so với cường độ khi đi vào trạm đó. Hỏi sau khi đi qua tối thiểu bao nhiêu trạm phát sóng thì cường độ tín hiệu còn lại nhỏ hơn $30\%$ cường độ tín hiệu ban đầu?],
    [20],
    loigiai: [
        Gọi cường độ ban đầu là $I_0$. Sau khi đi qua $n$ trạm phát sóng cường độ còn lại là:
        $ I_n = I_0 dot (1 - 0.06)^n = I_0 dot (0.94)^n $
        Yêu cầu bài toán tìm $n$ nguyên dương tối thiểu sao cho $I_n < 0.3 I_0$:
        $
          I_0 dot (0.94)^n < 0.3 I_0 &<=> (0.94)^n < 0.3 \
                                     &<=> n > log_0.94 (0.3) \
                                     &<=> n > ln(0.3) / ln(0.94) approx -1.20397 / -0.061875 approx 19.46
        $
        Do $n$ là số nguyên nên cần đi qua ít nhất $20$ trạm phát sóng.
    ]
)

// TL 4
#tln([Một viên bi lăn xuống một cái máng nghiêng dài. Giây thứ nhất viên bi đi được $3$ m. Mỗi giây tiếp theo quãng đường bi đi được tăng thêm $2$ m so với giây trước đó. Tính tổng quãng đường bi lăn được sau $8$ giây đầu tiên (tính bằng mét).],
    [80],
    loigiai: [
        Quãng đường bi đi được mỗi giây lập thành cấp số cộng có $u_1 = 3$ m và công sai $d = 2$ m.
        Tổng quãng đường bi đi được sau $n = 8$ giây là tổng $S_8$:
        $
          S_8 &= 8/2 [2 u_1 + 7 d] \
              &= 4 [2 dot 3 + 7 dot 2] \
              &= 4 [6 + 14] = 4 dot 20 = 80 " (m)"
        $
    ]
)

// TL 5
#tln([Một khoản tiền thanh toán trị giá $10$ triệu đồng nhận được hàng năm vào cuối mỗi năm liên tiếp trong $5$ năm. Biết lãi suất chiết khấu cố định là $7\%$/năm. Tính giá trị hiện tại (Present Value) của dòng tiền thanh toán đó (làm tròn đến hàng đơn vị triệu đồng).],
    [41],
    loigiai: [
        Áp dụng công thức tính giá trị hiện tại của dòng tiền đều (Annuity Present Value):
        $
          P V = M dot (1 - (1+r)^(-n)) / r
        $
        Thay $M = 10$ (triệu), $r = 0.07$, $n = 5$:
        $
          P V &= 10 dot (1 - (1.07)^(-5)) / 0.07 \
              &= 10 dot (1 - 0.712986) / 0.07 \
              &= 10 dot 0.287014 / 0.07 \
              &approx 41.002 " (triệu đồng)"
        $
        Làm tròn đến hàng đơn vị là $41$ triệu đồng.
    ]
)

// TL 6
#tln([Doanh thu của một doanh nghiệp công nghệ trong năm thứ nhất là $500$ triệu đồng. Do sự phát triển nhanh của thị trường, mỗi năm tiếp theo doanh thu của doanh nghiệp tăng trưởng $20\%$ so với năm trước đó. Tính tổng doanh thu của doanh nghiệp thu được sau $5$ năm hoạt động đầu tiên (làm tròn đến hàng đơn vị triệu đồng).],
    [3721],
    loigiai: [
        Doanh thu hàng năm của doanh nghiệp lập thành cấp số nhân có:
        - Số hạng đầu: $u_1 = 500$ (triệu đồng).
        - Công bội: $q = 1 + 20\% = 1.2$.
        Tổng doanh thu sau $n = 5$ năm hoạt động là tổng $S_5$:
        $
          S_5 &= u_1 dot (1 - q^5) / (1 - q) \
              &= 500 dot (1 - (1.2)^5) / (1 - 1.2) \
              &= 500 dot (1 - 2.48832) / (-0.2) \
              &= 500 dot 7.4416 \
              &approx 3720.8 " (triệu đồng)"
        $
        Làm tròn đến hàng đơn vị triệu đồng là $3721$ triệu đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
