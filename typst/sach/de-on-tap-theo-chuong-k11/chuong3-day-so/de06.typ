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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 06)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một loài sinh vật được nuôi cấy trong phòng thí nghiệm. Ban đầu có $N_0$ cá thể. Kể từ giờ thứ hai, sau mỗi giờ số lượng cá thể tăng thêm một lượng bằng $20\%$ số lượng cá thể hiện có ở giờ trước đó, cộng thêm một lượng cố định $50$ cá thể di cư từ ngoài vào. Số lượng cá thể $N_n$ sau $n$ giờ được mô hình hóa bởi dãy số truy hồi nào dưới đây?],
    (
        [$N_n = 1.2 N_(n-1)$.],
        [$N_n = N_(n-1) + 50$.],
        True([$N_n = 1.2 N_(n-1) + 50$.]),
        [$N_n = 1.2 N_(n-1) - 50$.]
    ),
    loigiai: [
        Số lượng cá thể ở giờ $n$ bằng số lượng cá thể ở giờ trước đó $N_(n-1)$ cộng thêm lượng tăng trưởng $20\%$ và cộng thêm $50$ cá thể di cư vào:
        $
          N_n &= N_(n-1) + 0.2 N_(n-1) + 50 \
              &= 1.2 N_(n-1) + 50
        $
        Vậy mô hình đúng là $N_n = 1.2 N_(n-1) + 50$.
    ]
)

// TN 2
#tn([Để đào một cái giếng sâu $15$ mét, một đội thợ đưa ra báo giá như sau: Mét đầu tiên giá $100 000$ đồng; kể từ mét thứ hai, giá của mỗi mét tăng thêm $20 000$ đồng so với mét liền trước đó. Chi phí để đào hết chiếc giếng đó bằng bao nhiêu?],
    (
        [$300 000$ đồng.],
        [$2 400 000$ đồng.],
        [$2 700 000$ đồng.],
        True([$3 600 000$ đồng.])
    ),
    loigiai: [
        Chi phí cho từng mét đào giếng lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 100 000$ (đồng).
        - Công sai: $d = 20 000$ (đồng).
        Tổng chi phí để đào giếng sâu $n = 15$ mét là tổng $S_15$:
        $
          S_15 &= 15/2 [2 u_1 + 14 d] \
               &= 15/2 [2 dot 100 000 + 14 dot 20 000] \
               &= 15/2 [200 000 + 280 000] \
               &= 15/2 dot 480 000 = 3 600 000 " (đồng)"
        $
    ]
)

// TN 3
#tn([Một quả bóng bàn được thả rơi từ độ cao $h_0$ mét xuống một mặt sàn phẳng. Sau mỗi lần va chạm với sàn, quả bóng nảy ngược lên độ cao bằng $70\%$ độ cao của lần rơi trước đó. Tìm biểu thức tính độ cao $h_n$ mà bóng đạt được sau lần chạm đất thứ $n$.],
    (
        [$h_n = h_0 dot (0.7)^n$.],
        True([$h_n = h_0 dot (0.7)^n$.]),
        [$h_n = h_0 dot (0.3)^n$.],
        [$h_n = h_0 + n dot 0.7$.]
    ),
    loigiai: [
        - Sau lần chạm đất thứ nhất, độ cao đạt được là: $h_1 = 0.7 h_0$.
        - Sau lần chạm đất thứ hai, độ cao đạt được là: $h_2 = 0.7 h_1 = 0.7^2 h_0$.
        - Tổng quát, sau lần chạm đất thứ $n$, độ cao đạt được lập thành cấp số nhân với số hạng tổng quát:
        $ h_n = h_0 dot (0.7)^n $
    ]
)

// TN 4
#tn([Biết rằng sự tăng trưởng dân số của một quốc gia được tính theo công thức lãi kép liên tục $P(t) = P_0 dot e^(r t)$, trong đó $P_0$ là dân số ban đầu, $r$ là tỉ lệ tăng dân số hàng năm, $t$ là số năm. Nếu xét theo từng năm, dân số $P_n$ sau $n$ năm lập thành một dãy số. Hãy cho biết tính chất của dãy số này.],
    (
        [Là một cấp số cộng có công sai $r$.],
        [Là một cấp số nhân có công bội $r$.],
        True([Là một cấp số nhân có công bội $e^r$.]),
        [Không phải cấp số cộng cũng không phải cấp số nhân.]
    ),
    loigiai: [
        Ta có công thức dân số sau $n$ năm:
        $ P_n = P_0 dot (e^r)^n $
        Tỉ số giữa hai năm liên tiếp:
        $
          P_(n+1) / P_n = (P_0 dot e^(r(n+1))) / (P_0 dot e^(r n)) = e^r
        $
        Do tỉ số này là hằng số nên dãy số $(P_n)$ lập thành một cấp số nhân với công bội $q = e^r$.
    ]
)

// TN 5
#tn([Một người bắt đầu đi làm với mức lương khởi điểm là $15$ triệu đồng/tháng. Cứ sau mỗi năm (tức là $12$ tháng), mức lương của người đó lại được tăng thêm $8\%$ so với mức lương của năm trước đó. Tổng số tiền lương người đó nhận được sau $5$ năm làm việc (làm tròn đến triệu đồng) là bao nhiêu?],
    (
        [$900$ triệu đồng.],
        [$987$ triệu đồng.],
        True([1056 triệu đồng.]),
        [$1120$ triệu đồng.]
    ),
    loigiai: [
        Lương mỗi năm của người này lập thành một cấp số nhân $(v_k)$ với:
        - Năm thứ nhất: $v_1 = 12 dot 15 = 180$ (triệu đồng).
        - Công bội: $q = 1 + 8\% = 1.08$.
        Tổng tiền lương sau $n = 5$ năm làm việc là tổng $S_5$:
        $
          S_5 &= v_1 dot (1 - q^5) / (1 - q) \
              &= 180 dot (1 - 1.08^5) / (1 - 1.08) \
              &= 180 dot (1 - 1.469328) / (-0.08) \
              &= 180 dot 5.8666 \
              &approx 1056 " (triệu đồng)"
        $
    ]
)

// TN 6
#tn([Một bức tường được trang trí bằng các viên gạch xếp thành nhiều hàng. Hàng trên cùng có $10$ viên gạch, mỗi hàng bên dưới xếp nhiều hơn hàng liền trên nó $4$ viên gạch. Biết bức tường có tổng cộng $25$ hàng gạch. Hỏi người ta cần dùng tất cả bao nhiêu viên gạch để hoàn thành bức tường?],
    (
        [$1200$ viên.],
        True([$1450$ viên.]),
        [$1500$ viên.],
        [$1625$ viên.]
    ),
    loigiai: [
        Số viên gạch ở mỗi hàng lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 10$.
        - Công sai: $d = 4$.
        Tổng số gạch cần dùng cho $n = 25$ hàng là tổng $S_25$:
        $
          S_25 &= 25/2 [2 u_1 + 24 d] \
               &= 25/2 [2 dot 10 + 24 dot 4] \
               &= 25/2 [20 + 96] \
               &= 25/2 dot 116 = 1450 " (viên)"
        $
    ]
)

// TN 7
#tn([Một chất phóng xạ có chu kỳ bán rã là $8$ ngày. Biết lượng chất phóng xạ ban đầu là $100$ gam. Cứ sau mỗi chu kỳ $8$ ngày, lượng chất này giảm đi một nửa. Lượng chất phóng xạ còn lại sau $40$ ngày bằng bao nhiêu gam?],
    (
        [$12.5$ g.],
        [$6.25$ g.],
        True([$3.125$ g.]),
        [$1.5625$ g.]
    ),
    loigiai: [
        Sau $40$ ngày, số chu kỳ bán rã đã trôi qua là:
        $ n = 40 / 8 = 5 " (chu kỳ)" $
        Lượng chất phóng xạ còn lại sau $5$ chu kỳ lập thành cấp số nhân với $u_1 = 100$ (ban đầu) và công bội $q = 1/2$:
        $
          u_6 &= u_1 dot q^5 \
              &= 100 dot (1/2)^5 \
              &= 100 / 32 = 3.125 " (gam)"
        $
    ]
)

// TN 8
#tn([Để tích lũy tiền mua xe, một người gửi đều đặn vào ngân hàng vào đầu mỗi tháng số tiền $3$ triệu đồng với lãi suất $0.6\%$/tháng. Công thức tính tổng số tiền $A_n$ người đó nhận được ngay sau khi gửi tiền tháng thứ $n$ (ngay đầu tháng $n$) là công thức nào dưới đây?],
    (
        [$A_n = 3 dot (1.006^n - 1) / 0.006$.],
        True([$A_n = 3 dot 1.006 dot (1.006^n - 1) / 0.006$.]),
        [$A_n = 3 dot (1.006^(n+1) - 1) / 0.006$.],
        [$A_n = 3 dot (1.006^n - 1) / 1.006$.]
    ),
    loigiai: [
        Số tiền gửi đầu tháng lập thành một cấp số nhân có:
        - Số tiền gửi tháng thứ nhất sau $n$ tháng tích lũy thành: $3 dot 1.006^n$.
        - Số tiền gửi tháng thứ hai sau $n-1$ tháng tích lũy thành: $3 dot 1.006^(n-1)$.
        - Số tiền gửi tháng thứ $n$ (vừa gửi đầu tháng $n$): $3 dot 1.006$.
        Tổng số tiền tích lũy được sau khi gửi khoản thứ $n$ là:
        $
          A_n &= 3 dot 1.006 + 3 dot 1.006^2 + ... + 3 dot 1.006^n \
              &= 3 dot 1.006 dot (1 + 1.006 + ... + 1.006^(n-1)) \
              &= 3 dot 1.006 dot (1.006^n - 1) / (1.006 - 1) \
              &= 3 dot 1.006 dot (1.006^n - 1) / 0.006
        $
    ]
)

// TN 9
#tn([Một bánh xe có răng cưa chuyển động. Vòng ngoài cùng có $60$ răng, vòng thứ hai có $54$ răng, vòng thứ ba có $48$ răng... các vòng răng cưa giảm dần theo cấp số cộng cho đến vòng cuối cùng có $6$ răng. Tổng số răng cưa của bánh xe đó là],
    (
        [$300$.],
        True([$330$.]),
        [$360$.],
        [$400$.]
    ),
    loigiai: [
        Số răng cưa ở các vòng lập thành cấp số cộng với $u_1 = 60$, $d = -6$ và số hạng cuối cùng $u_n = 6$.
        Ta tìm số vòng $n$:
        $
          u_n = u_1 + (n-1)d &<=> 6 = 60 + (n-1)(-6) \
                             &<=> -54 = -6(n-1) \
                             &<=> n - 1 = 9 <=> n = 10
        $
        Tổng số răng cưa của cả bánh xe là:
        $
          S_10 &= 10/2 (u_1 + u_10) \
               &= 5 (60 + 6) = 330 " (răng)"
        $
    ]
)

// TN 10
#tn([Trong một thí nghiệm vật lý, người ta thả một con lắc dao động. Biên độ của dao động sau mỗi chu kỳ giảm $5\%$ so với chu kỳ trước đó. Biết biên độ dao động ban đầu là $10$ cm. Sau $10$ chu kỳ, biên độ của con lắc xấp xỉ bằng bao nhiêu cm?],
    (
        [$5.0$ cm.],
        [$6.3$ cm.],
        True([$6.0$ cm.]),
        [$7.2$ cm.]
    ),
    loigiai: [
        Biên độ dao động của con lắc sau mỗi chu kỳ lập thành một cấp số nhân $(u_n)$ với $u_1 = 10 dot 0.95 = 9.5$ (sau chu kỳ 1) và công bội $q = 0.95$.
        Sau $10$ chu kỳ, biên độ là:
        $
          A_10 &= 10 dot (0.95)^10 \
               &approx 10 dot 0.5987 \
               &approx 6.0 " (cm)"
        $
    ]
)

// TN 11
#tn([Một quần thể vi khuẩn ban đầu có $500$ cá thể, cứ sau $30$ phút số lượng vi khuẩn lại nhân đôi. Số lượng vi khuẩn sau $4$ giờ bằng bao nhiêu cá thể?],
    (
        [$8000$ cá thể.],
        [$16 000$ cá thể.],
        True([$128 000$ cá thể.]),
        [$256 000$ cá thể.]
    ),
    loigiai: [
        Thời gian $4$ giờ tương ứng với số lần nhân đôi là:
        $ n = 4 / 0.5 = 8 " (lần)" $
        Số lượng vi khuẩn sau $8$ lần nhân đôi lập thành cấp số nhân với $u_1 = 500$ (ban đầu) và công bội $q = 2$:
        $
          u_9 &= u_1 dot q^8 \
              &= 500 dot 2^8 \
              &= 500 dot 256 = 128 000 " (cá thể)"
        $
    ]
)

// TN 12
#tn([Một chiếc kim khâu dài $5$ cm được treo thẳng đứng. Cứ sau mỗi phút, chiều dài của kim tăng lên $2\%$ do hiện tượng giãn nở nhiệt đều. Chiều dài của kim sau $1$ giờ xấp xỉ bằng bao nhiêu cm?],
    (
        [$11.0$ cm.],
        True([$16.4$ cm.]),
        [$22.3$ cm.],
        [$30.1$ cm.]
    ),
    loigiai: [
        Thời gian $1$ giờ bằng $60$ phút. 
        Chiều dài kim sau $n$ phút lập thành cấp số nhân với $u_0 = 5$ cm và công bội $q = 1.02$.
        Sau $60$ phút:
        $
          L_60 &= 5 dot (1.02)^60 \
               &approx 5 dot 3.281 \
               &approx 16.4 " (cm)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Khảo sát quá trình tăng trưởng của một loại tảo biển. Ban đầu có diện tích phủ bề mặt nước là $100 "m"^2$. Mỗi tuần, diện tích tảo tăng thêm $20\%$ so với tuần trước đó. Các phát biểu sau đúng hay sai?], (
        True([Diện tích tảo biển sau mỗi tuần lập thành một cấp số nhân với công bội $q = 1.2$.]),
        True([Diện tích tảo biển phủ bề mặt sau $3$ tuần là $172.8 "m"^2$.]),
        True([Công thức tính diện tích tảo biển sau $n$ tuần là $S_n = 100 dot (1.2)^n "m"^2$.]),
        True([Cần ít nhất $13$ tuần để diện tích tảo biển phủ kín bề mặt hồ rộng $1000 "m"^2$.])
    ), 
    loigiai: [
        Gọi $u_n$ là diện tích tảo biển sau $n$ tuần, $u_0 = 100$.
        - *a)* Đúng. Diện tích tảo tăng $20\%$ tức là $u_n = 1.2 u_(n-1)$, đây là cấp số nhân có công bội $q = 1.2$.
        - *b)* Đúng. $u_3 = 100 dot (1.2)^3 = 172.8 "m"^2$.
        - *c)* Đúng. Công thức tổng quát là $u_n = 100 dot (1.2)^n$.
        - *d)* Đúng. Cần tìm $n$ sao cho $u_n >= 1000$:
          $
            100 dot (1.2)^n >= 1000 &<=> (1.2)^n >= 10 \
                                    &<=> n >= log_1.2 (10) approx 12.63
          $
          Vì $n$ nguyên dương nên cần ít nhất 13 tuần.
    ]
)

// DS 2
#ds([Một dự án lắp đặt pin năng lượng mặt trời. Hàng đầu tiên lắp đặt $12$ tấm pin. Kể từ hàng thứ hai, mỗi hàng lắp đặt nhiều hơn hàng liền trước nó $3$ tấm pin. Các phát biểu sau đúng hay sai?], (
        True([Số lượng tấm pin ở mỗi hàng lập thành cấp số cộng có công sai $d = 3$.]),
        True([Hàng thứ $10$ lắp đặt được $39$ tấm pin.]),
        True([Để lắp đặt được tổng cộng $210$ tấm pin thì dự án cần thiết kế $10$ hàng pin.]),
        True([Tổng số tấm pin lắp được sau $n$ hàng được tính bởi công thức $S_n = 1.5n^2 + 10.5n$.])
    ), 
    loigiai: [
        Số tấm pin ở hàng thứ $n$ lập thành cấp số cộng với $u_1 = 12, d = 3$.
        - *a)* Đúng.
        - *b)* Đúng. $u_10 = u_1 + 9d = 12 + 9 dot 3 = 39$.
        - *c)* Đúng. Giải phương trình $S_n = 210$:
          $
            n/2 [2(12) + (n-1)3] = 210 &<=> n/2 [3n + 21] = 210 \
                                       &<=> 3n^2 + 21n - 420 = 0 \
                                       &<=> n^2 + 7n - 140 = 0 \
                                       &<=> (n-10)(n+17) = 0 <=> n = 10
          $
        - *d)* Đúng. Công thức tổng quát của $S_n$:
          $
            S_n &= n/2 [24 + 3n - 3] \
                &= n/2 [3n + 21] \
                &= 1.5n^2 + 10.5n
          $
    ]
)

// DS 3
#ds([Một quả bóng bàn được thả rơi từ độ cao $15$ m. Mỗi lần chạm đất, bóng nảy lên độ cao bằng $2/3$ độ cao của lần rơi trước đó. Các phát biểu sau đúng hay sai?], (
        True([Độ cao của bóng sau lần nảy thứ nhất là $10$ m.]),
        [Tổng quãng đường bóng di chuyển (lên và xuống) sau $3$ lần chạm đất đầu tiên là $47.78$ m.],
        True([Giới hạn tổng quãng đường bóng di chuyển cho đến khi dừng hẳn là $75$ m.]),
        True([Quãng đường di chuyển chỉ đi xuống lập thành một cấp số nhân lùi vô hạn với công bội $2/3$.])
    ), 
    loigiai: [
        - *a)* Đúng. Lần nảy thứ nhất bóng đạt độ cao $15 dot 2/3 = 10$ m.
        - *b)* Sai. Quãng đường sau 3 lần chạm đất (gồm rơi 1, nảy 1 + rơi 2, nảy 2 + rơi 3, nảy 3 + rơi 4):
          - Rơi lần 1: $15$ m.
          - Lần nảy 1 và rơi 2: $2 dot 10 = 20$ m.
          - Lần nảy 2 và rơi 3: $2 dot (10 dot 2/3) = 40/3 approx 13.33$ m.
          Tổng sau 3 lần chạm đất (ngay trước khi chạm đất lần 4):
          $
            S_3 = 15 + 20 + 13.33 = 48.33 " m"
          $
        - *c)* Đúng. Tổng quãng đường di chuyển vô hạn:
          $
            S = 15 dot (1 + 2/3) / (1 - 2/3) = 15 dot (5/3) / (1/3) = 75 " (m)"
          $
        - *d)* Đúng. Quãng đường các lần rơi xuống là $15, 10, 20/3...$ lập thành cấp số nhân lùi vô hạn có công bội $q = 2/3$.
        
        Minh họa quỹ đạo chuyển động nảy của quả bóng bàn:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Đường rơi đầu từ độ cao 15
            line((0.5, 3), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 3), radius: 0.05, fill: blue)
            
            // Các đường nảy
            bezier((0.5, 0), (2.0, 0), (0.8, 2.0), (1.7, 2.0), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 1.33), (3.0, 1.33), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 0.89), (3.9, 0.89), stroke: blue)
            
            content((0.5, 3.25), [15m])
            content((1.25, 2.2), [10m])
            content((2.6, 1.55), [6.7m])
            content((3.65, 1.1), [4.4m])
          })
        ]
    ]
)

// DS 4
#ds([Một người vay ngân hàng số tiền $200$ triệu đồng theo hình thức trả góp hàng tháng. Lãi suất vay là $0.8\%$/tháng. Mỗi tháng người này trả đều đặn số tiền $X$ đồng. Các phát biểu sau đúng hay sai?], (
        True([Sau tháng thứ nhất, số dư nợ còn lại là $200 dot 1.008 - X$ (triệu đồng).]),
        True([Nếu $X = 10$ triệu đồng thì sau $2$ tháng nợ gốc còn lại xấp xỉ $183.13$ triệu đồng.]),
        True([Để trả hết hoàn toàn nợ sau đúng $24$ tháng, số tiền trả mỗi tháng phải bằng $X = (200 dot 0.008 dot 1.008^24) / (1.008^24 - 1)$ (triệu đồng).]),
        [Số tiền nợ còn lại sau mỗi tháng lập thành một cấp số cộng.]
    ), 
    loigiai: [
        - *a)* Đúng. Nợ tháng 1 sau khi tính lãi và trả tiền: $D_1 = 200(1.008) - X$.
        - *b)* Đúng. Tính nợ tháng 2 với $X = 10$:
          $
            D_1 &= 200 dot 1.008 - 10 = 191.6 \
            D_2 &= 191.6 dot 1.008 - 10 = 183.1328 - 10 = 183.1328 approx 183.13 " (triệu đồng)"
          $
        - *c)* Đúng. Công thức trả góp chuẩn là $X = (D_0 r (1+r)^n) / ((1+r)^n - 1)$.
        - *d)* Sai. Dãy số dư nợ không phải cấp số cộng vì sự chênh lệch số nợ mỗi tháng phụ thuộc vào số dư nợ của tháng trước đó.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một bể nước dung tích $2000$ lít. Mỗi ngày bể bị bay hơi $5\%$ lượng nước hiện có, đồng thời người ta bơm thêm vào bể một lượng cố định $50$ lít nước vào cuối ngày. Hỏi sau thời gian rất lâu, lượng nước trong bể sẽ ổn định ở mức bao nhiêu lít?],
    [1000],
    loigiai: [
        Gọi $V_n$ là lượng nước trong bể sau $n$ ngày. Ta có hệ thức:
        $ V_n = 0.95 V_(n-1) + 50 $
        Sau thời gian rất lâu ($n -> +oo$), lượng nước trong bể ổn định ở giới hạn $L$:
        $
          L = 0.95 L + 50 &<=> 0.05 L = 50 \
                          &<=> L = 50 / 0.05 = 1000 " (lít)"
        $
    ]
)

// TL 2
#tln([Một nhà kính nông nghiệp dạng vòm có thiết kế khung sắt gồm các thanh xếp song song. Thanh ngắn nhất ở đỉnh vòm dài $2$ mét, và cứ mỗi thanh tiếp theo có chiều dài tăng thêm $0.5$ mét so với thanh ngay phía trên nó. Biết tổng chiều dài các thanh sắt sử dụng là $77$ mét. Hỏi khung vòm có tất cả bao nhiêu thanh sắt?],
    [14],
    loigiai: [
        Chiều dài các thanh sắt lập thành cấp số cộng có $u_1 = 2$ (m) và công sai $d = 0.5$ (m).
        Tổng chiều dài các thanh sắt là $S_n = 77$:
        $
          n/2 [2(2) + (n-1)0.5] = 77 &<=> n/2 [4 + 0.5n - 0.5] = 77 \
                                     &<=> n/2 [0.5n + 3.5] = 77 \
                                     &<=> 0.5n^2 + 3.5n - 154 = 0 \
                                     &<=> n^2 + 7n - 308 = 0 \
                                     &<=> (n-14)(n+22) = 0 <=> n = 14
        $
        Vậy có tất cả 14 thanh sắt.
        
        Sơ đồ cấu trúc khung vòm của nhà kính:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Vòm cầu ngoài
            arc((0deg, 3.0), start: 0deg, stop: 180deg, radius: 3.0, stroke: 1.5pt + black)
            
            // Mặt đất
            line((-3.5, 0), (3.5, 0), stroke: 1pt + gray)
            
            // Các thanh sắt nằm ngang song song
            for y in (2.6, 2.2, 1.8, 1.4, 1.0, 0.6) {
              let r = 3.0
              let x_val = calc.sqrt(r*r - y*y)
              line((-x_val, y), (x_val, y), stroke: 1pt + blue)
            }
            
            content((0, 2.8), [Thanh 1: 2m])
            content((0, 0.3), [Thanh tiếp theo tăng 0.5m], style: "italic")
          })
        ]
    ]
)

// TL 3
#tln([Để đo độ sâu của một cái hang, người ta thả rơi tự do một viên đá từ miệng hang và đo thời gian từ lúc thả đến lúc nghe thấy tiếng đá chạm đáy. Biết thời gian này là $4.5$ giây. Tốc độ âm thanh trong không khí là $340$ m/s, gia tốc trọng trường là $g = 9.8" m/s"^2$. Tính độ sâu của hang (làm tròn đến hàng đơn vị mét).],
    [89],
    loigiai: [
        Gọi độ sâu của hang là $h$ (m).
        - Thời gian viên đá rơi tự do chạm đáy là $t_1$:
          $ t_1 = sqrt((2h)/g) = sqrt((2h)/9.8) = sqrt(h/4.9) $
        - Thời gian âm thanh truyền từ đáy hang lên miệng hang là $t_2$:
          $ t_2 = h / 340 $
        - Tổng thời gian thu được là:
          $ t_1 + t_2 = 4.5 <=> sqrt(h/4.9) + h/340 = 4.5 $
        Đặt $x = sqrt(h) > 0$, ta được phương trình:
        $ x^2 / 340 + x / sqrt(4.9) - 4.5 = 0 $
        Giải phương trình bậc hai trên, ta thu được nghiệm $x approx 9.42$.
        Suy ra độ sâu của hang là:
        $ h = x^2 approx 88.7 " (m)" $
        Làm tròn đến hàng đơn vị mét, kết quả là $89$ m.
    ]
)

// TL 4
#tln([Một chuỗi cửa hàng trà sữa ngày đầu tiên bán được $500$ ly. Kể từ ngày thứ hai, mỗi ngày doanh số bán được tăng thêm $5\%$ so với ngày liền trước đó. Tính tổng số ly trà sữa chuỗi cửa hàng bán được sau $10$ ngày đầu tiên (làm tròn đến hàng đơn vị ly).],
    [6289],
    loigiai: [
        Doanh số bán được hàng ngày lập thành một cấp số nhân có:
        - Số hạng đầu: $u_1 = 500$.
        - Công bội: $q = 1.05$.
        Tổng số ly bán được sau $n = 10$ ngày là tổng $S_10$:
        $
          S_10 &= u_1 dot (1 - q^10) / (1 - q) \
               &= 500 dot (1 - 1.05^10) / (1 - 1.05) \
               &= 500 dot (1 - 1.62889) / (-0.05) \
               &= 500 dot 12.57789 \
               &approx 6289 " (ly)"
        $
    ]
)

// TL 5
#tln([Một loài vi khuẩn sinh sản bằng cách phân đôi. Ban đầu có $100$ tế bào vi khuẩn. Cứ sau mỗi giờ, mỗi tế bào vi khuẩn phân chia thành hai tế bào mới. Hỏi sau đúng $12$ giờ, số lượng vi khuẩn tăng thêm bao nhiêu tế bào so với ban đầu?],
    [409500],
    loigiai: [
        Số lượng vi khuẩn sau $n$ giờ lập thành cấp số nhân với $u_0 = 100$, công bội $q = 2$.
        Số lượng vi khuẩn sau 12 giờ là:
        $ u_12 = 100 dot 2^12 = 100 dot 4096 = 409 600 " (tế bào)" $
        Số tế bào vi khuẩn tăng thêm so với ban đầu là:
        $ Delta u = u_12 - u_0 = 409 600 - 100 = 409 500 " (tế bào)" $
    ]
)

// TL 6
#tln([Để chuẩn bị cho kỳ thi, một học sinh lên kế hoạch làm bài tập tự luyện trong $30$ ngày. Ngày đầu tiên học sinh làm $5$ bài tập. Mỗi ngày tiếp theo, số bài tập làm được tăng thêm $2$ bài so với ngày trước đó. Hỏi tổng số bài tập học sinh đó đã làm trong cả quá trình $30$ ngày là bao nhiêu bài?],
    [1020],
    loigiai: [
        Số bài tập làm được mỗi ngày lập thành cấp số cộng với $u_1 = 5$ và công sai $d = 2$.
        Tổng số bài tập làm được sau $n = 30$ ngày là:
        $
          S_30 &= 30/2 [2 u_1 + 29 d] \
               &= 15 [2 dot 5 + 29 dot 2] \
               &= 15 [10 + 58] \
               &= 15 dot 68 = 1020 " (bài)"
        $
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
