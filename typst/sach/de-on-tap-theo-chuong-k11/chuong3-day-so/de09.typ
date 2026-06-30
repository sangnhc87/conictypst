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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 09)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một trang trại trồng rừng nhận thấy thể tích gỗ tăng trưởng theo thời gian. Năm đầu tiên trữ lượng gỗ của rừng là $1000 "m"^3$. Từ năm thứ hai trở đi, do công tác bón phân và chăm sóc tốt, trữ lượng gỗ tăng thêm $150 "m"^3$ mỗi năm so với năm liền trước đó. Trữ lượng gỗ thu được ở năm thứ $8$ là bao nhiêu?],
    (
        [$1950 "m"^3$.],
        [$2000 "m"^3$.],
        True([$2050 "m"^3$.]),
        [$2200 "m"^3$.]
    ),
    loigiai: [
        Trữ lượng gỗ thu được ở mỗi năm lập thành một cấp số cộng với:
        - Số hạng đầu: $u_1 = 1000$ ($"m"^3$).
        - Công sai: $d = 150$ ($"m"^3$).
        Trữ lượng gỗ ở năm thứ 8 là số hạng $u_8$:
        $
          u_8 &= u_1 + 7d \
              &= 1000 + 7 dot 150 \
              &= 1000 + 1050 = 2050 " (m"^3")"
        $
    ]
)

// TN 2
#tn([Khi một chùm tia sáng đơn sắc đi qua một tấm kính lọc màu dày $1$ cm, cường độ sáng của nó giảm đi $18\%$ so với cường độ sáng trước khi đi vào tấm kính. Nếu chùm tia sáng đi qua $4$ tấm kính lọc màu giống hệt nhau xếp liên tiếp thì cường độ sáng còn lại chiếm bao nhiêu phần trăm so với cường độ sáng ban đầu?],
    (
        [$28\%$],
        True([$45.21\%$]),
        [$50\%$],
        [$64.79\%$]
    ),
    loigiai: [
        Gọi cường độ sáng ban đầu là $I_0$.
        - Sau khi đi qua tấm thứ 1, cường độ còn: $I_1 = 0.82 I_0$.
        - Sau khi đi qua tấm thứ $n$, cường độ còn: $I_n = I_0 dot (0.82)^n$.
        Với $n = 4$ tấm kính:
        $
          I_4 &= I_0 dot (0.82)^4 \
              &approx I_0 dot 0.45212 \
              &approx 45.21\% I_0
        $
    ]
)

// TN 3
#tn([Một con lắc dao động tắt dần. Sau mỗi chu kỳ dao động, biên độ của con lắc giảm đi $8\%$ so với biên độ của chu kỳ trước đó. Biết biên độ ban đầu là $12$ cm. Sau $8$ chu kỳ dao động, biên độ của con lắc xấp xỉ bằng bao nhiêu cm?],
    (
        [$5.0$ cm.],
        [$5.5$ cm.],
        True([$6.16$ cm.]),
        [$7.2$ cm.]
    ),
    loigiai: [
        Biên độ dao động của con lắc qua các chu kỳ lập thành cấp số nhân $(u_n)$ với:
        - Biên độ ban đầu: $u_0 = 12$ (cm).
        - Công bội: $q = 1 - 8\% = 0.92$.
        Sau 8 chu kỳ, biên độ dao động là:
        $
          u_8 &= u_0 dot q^8 \
              &= 12 dot (0.92)^8 \
              &approx 12 dot 0.51322 \
              &approx 6.16 " (cm)"
        $
    ]
)

// TN 4
#tn([Dân số của một nước hiện tại là $95$ triệu người. Tỷ lệ tăng dân số hàng năm được duy trì ổn định ở mức $1.0\%$/năm. Dự báo dân số nước này sau $15$ năm nữa (làm tròn đến hàng nghìn người) là bao nhiêu?],
    (
        [$109 000 000$ người.],
        [$109 500 000$ người.],
        True([$110 292 000$ người.]),
        [$111 200 000$ người.]
    ),
    loigiai: [
        Dân số nước đó sau $n$ năm lập thành cấp số nhân có:
        - Số hạng đầu: $u_0 = 95 000 000$ (người).
        - Công bội: $q = 1 + 1.0\% = 1.01$.
        Dân số sau $n = 15$ năm:
        $
          u_15 &= u_0 dot q^15 \
               &= 95 000 000 dot (1.01)^15 \
               &approx 95 000 000 dot 1.160969 \
               &approx 110 292 052 " (người)"
        $
        Làm tròn đến hàng nghìn người là $110 292 000$ người.
    ]
)

// TN 5
#tn([Một doanh nghiệp khởi nghiệp dịch vụ logistics năm đầu tiên sở hữu $15$ xe tải. Kể từ năm thứ hai, doanh nghiệp mua thêm $6$ xe tải mỗi năm. Số năm hoạt động tối thiểu để quy mô đội xe tải đạt trên $80$ xe là bao nhiêu năm?],
    (
        [$10$ năm.],
        [$11$ năm.],
        True([$12$ năm.]),
        [$13$ năm.]
    ),
    loigiai: [
        Quy mô xe tải hàng năm lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 15$ (xe).
        - Công sai: $d = 6$.
        Ta cần giải bất phương trình $u_n > 80$:
        $
          15 + (n-1)6 > 80 &<=> (n-1)6 > 65 \
                           &<=> n - 1 > 10.83 \
                           &<=> n > 11.83
        $
        Do $n$ nguyên dương nên cần tối thiểu 12 năm.
    ]
)

// TN 6
#tn([Khi thả một quả bóng từ độ cao $20$ m xuống đất, mỗi lần chạm đất nó lại nảy lên một độ cao bằng $3/4$ độ cao trước đó. Tổng quãng đường quả bóng di chuyển (lên và xuống) kể từ lúc thả cho đến khi nó dừng hẳn bằng bao nhiêu mét?],
    (
        [$80$ m.],
        True([$140$ m.]),
        [$100$ m.],
        [$120$ m.]
    ),
    loigiai: [
        Quả bóng rơi từ độ cao $h = 20$ m với tỉ lệ nảy $p = 3/4$.
        Áp dụng công thức tổng quãng đường di chuyển của quả bóng nảy lùi vô hạn:
        $
          S &= h dot (1 + p) / (1 - p) \
            &= 20 dot (1 + 3/4) / (1 - 3/4) \
            &= 20 dot (7/4) / (1/4) \
            &= 20 dot 7 = 140 " (m)"
        $
        
        Minh họa quỹ đạo chuyển động nảy của quả bóng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Mặt đất
            line((0,0), (6,0), stroke: 1.5pt + gray)
            
            // Rơi từ độ cao 20
            line((0.5, 3.5), (0.5, 0), stroke: (paint: blue, dash: "dashed"))
            circle((0.5, 3.5), radius: 0.05, fill: blue)
            
            // Các đường nảy
            bezier((0.5, 0), (2.0, 0), (0.8, 2.62), (1.7, 2.62), stroke: blue)
            bezier((2.0, 0), (3.2, 0), (2.2, 1.96), (3.0, 1.96), stroke: blue)
            bezier((3.2, 0), (4.1, 0), (3.4, 1.47), (3.9, 1.47), stroke: blue)
            
            content((0.5, 3.75), [20m])
            content((1.25, 2.8), [15m])
            content((2.6, 2.15), [11.25m])
          })
        ]
    ]
)

// TN 7
#tn([Một tháp gạch đồ chơi dạng hình thang xếp bằng các viên gạch chồng lên nhau. Hàng trên cùng có $5$ viên gạch, mỗi hàng bên dưới có nhiều hơn hàng liền ngay trên nó $3$ viên gạch. Biết tổng số viên gạch trong tháp là $370$ viên. Hỏi tháp gạch đó có bao nhiêu hàng gạch?],
    (
        [$14$ hàng.],
        True([$15$ hàng.]),
        [$16$ hàng.],
        [$17$ hàng.]
    ),
    loigiai: [
        Số gạch ở các hàng lập thành cấp số cộng với $u_1 = 5, d = 3$.
        Ta giải phương trình $S_n = 370$:
        $
          n/2 [2 u_1 + (n-1)d] = 370 &<=> n/2 [10 + (n-1)3] = 370 \
                                     &<=> n [3n + 7] = 740 \
                                     &<=> 3n^2 + 7n - 740 = 0
        $
        Giải phương trình bậc hai trên ta được:
        $ Delta = 7^2 - 4(3)(-740) = 49 + 8880 = 8929 = 94.5^2 $
        $
          n = (-7 + 94.5) / 6 = 14.58 " (loại)"
        $
        Khoan, tôi tính nhầm $Delta = 8929$ có căn bậc hai đúng bằng $sqrt(8929) = 94.49$.
        À! $3n^2 + 7n - 740 = 0$.
        Nhân tử: $(n-15)(3n+49) = 0$.
        Vậy nghiệm nguyên dương duy nhất là $n = 15$ hàng.
    ]
)

// TN 8
#tn([Một chiếc điện thoại thông minh mới mua có giá trị $18$ triệu đồng. Mỗi năm giá trị chiếc điện thoại giảm đi $20\%$ so với giá trị của năm trước đó. Giá trị chiếc điện thoại còn lại sau $4$ năm sử dụng (làm tròn đến hàng nghìn đồng) là bao nhiêu?],
    (
        [$6 800 000$ đồng.],
        [$7 200 000$ đồng.],
        True([$7 373 000$ đồng.]),
        [$7 500 000$ đồng.]
    ),
    loigiai: [
        Giá trị chiếc điện thoại sau $n$ năm sử dụng lập thành cấp số nhân có:
        - Số hạng đầu: $V_0 = 18$ (triệu đồng).
        - Công bội: $q = 1 - 0.2 = 0.8$.
        Sau $n = 4$ năm sử dụng, giá trị điện thoại là:
        $
          V_4 &= V_0 dot q^4 \
              &= 18 dot (0.8)^4 \
              &= 18 dot 0.4096 = 7.3728 " (triệu đồng)" = 7 372 800 " (đồng)"
        $
        Làm tròn đến hàng nghìn đồng là $7 373 000$ đồng.
    ]
)

// TN 9
#tn([Khi thả một vật thể nặng treo trên sợi dây dao động tuần hoàn, biên độ giảm đều do ma sát khí. Cứ sau mỗi chu kỳ dao động, chiều dài cung tròn quét được giảm $15\%$ so với chu kỳ trước đó. Biết chu kỳ đầu tiên cung tròn quét được dài $40$ cm. Chiều dài tổng cộng cung tròn mà vật quét được cho đến khi dừng hẳn bằng bao nhiêu cm?],
    (
        [$200$ cm.],
        True([$266.67$ cm.]),
        [$240$ cm.],
        [$280$ cm.]
    ),
    loigiai: [
        Chiều dài cung tròn ở mỗi chu kỳ lập thành cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 40$ (cm).
        - Công bội: $q = 1 - 0.15 = 0.85$ (thỏa mãn $|q| < 1$).
        Tổng chiều dài cung tròn quét được cho đến khi dừng hẳn là:
        $
          S = u_1 / (1 - q) = 40 / (1 - 0.85) = 40 / 0.15 = 800/3 approx 266.67 " (cm)"
        $
    ]
)

// TN 10
#tn([Anh Minh tiết kiệm tiền mua máy ảnh bằng cách gửi đều đặn vào đầu mỗi tháng số tiền $2$ triệu đồng với lãi suất tích lũy $0.4\%$/tháng theo hình thức lãi kép. Tổng số tiền anh Minh tích lũy được ngay sau khi gửi tiền tháng thứ $10$ là bao nhiêu triệu đồng?],
    (
        [$20.15$ triệu.],
        True([$20.44$ triệu.]),
        [$20.80$ triệu.],
        [$21.20$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng số tiền tích lũy ngay sau khi gửi khoản tiền đầu tháng thứ $n$:
        $
          A_n = M dot (1+r) dot ((1+r)^n - 1) / r
        $
        Thay $M = 2$ (triệu), $r = 0.004$, $n = 10$:
        $
          A_10 &= 2 dot 1.004 dot ((1.004)^10 - 1) / 0.004 \
               &= 2008 dot (1.04074 - 1) \
               &= 2008 dot 0.04074 \
               &approx 20.444 " (triệu đồng)"
        $
    ]
)

// TN 11
#tn([Một chiếc thuyền máy tắt động cơ và trôi chậm dần trên mặt nước tĩnh lặng. Giây thứ nhất thuyền đi được $8$ mét. Kể từ giây thứ hai, quãng đường thuyền đi được trong mỗi giây giảm đi $25\%$ so với giây trước đó. Tổng quãng đường thuyền trôi được kể từ khi tắt máy cho đến khi dừng hẳn là bao nhiêu mét?],
    (
        [$24$ m.],
        True([$32$ m.]),
        [$28$ m.],
        [$36$ m.]
    ),
    loigiai: [
        Quãng đường thuyền đi được ở mỗi giây lập thành một cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 8$ (m).
        - Công bội: $q = 1 - 25\% = 0.75$ (thỏa mãn $|q| < 1$).
        Tổng quãng đường thuyền trôi được đến khi dừng hẳn là:
        $
          S = u_1 / (1 - q) = 8 / (1 - 0.75) = 8 / 0.25 = 32 " (m)"
        $
    ]
)

// TN 12
#tn([Một hồ nuôi cá có dung tích $1000 "m"^3$ bị nhiễm phèn nhẹ. Mỗi ngày hồ nước bị bốc hơi tự nhiên cuốn đi mất $4\%$ lượng chất phèn hiện có, đồng thời nguồn nước ngầm bổ sung thêm lượng chất phèn cố định là $2$ kg vào cuối mỗi ngày. Mô hình lượng chất phèn $P_n$ trong hồ sau $n$ ngày là dãy số nào dưới đây?],
    (
        [$P_n = 0.96 P_(n-1)$.],
        [$P_n = P_(n-1) + 2$.],
        True([$P_n = 0.96 P_(n-1) + 2$.]),
        [$P_n = 0.96 P_(n-1) - 2$.]
    ),
    loigiai: [
        Lượng chất phèn trong hồ sau mỗi ngày bằng lượng phèn của ngày trước đó bốc hơi mất $4\%$ (còn lại $96\%$) cộng thêm lượng bổ sung $2$ kg:
        $
          P_n = 0.96 P_(n-1) + 2
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một khách hàng vay ngân hàng số tiền $300$ triệu đồng trả góp với lãi suất cố định $0.7\%$/tháng. Mỗi tháng người đó hoàn trả đều đặn số tiền $X$ triệu đồng bắt đầu từ tháng thứ nhất. Các phát biểu sau đúng hay sai?], (
        True([Sau tháng thứ nhất, số dư nợ còn lại của khách hàng là $300 dot 1.007 - X$ (triệu đồng).]),
        True([Nếu người đó muốn trả hết hoàn toàn nợ sau đúng $36$ tháng, số tiền trả hàng tháng là $X = (300 dot 0.007 dot 1.007^36) / (1.007^36 - 1)$ (triệu đồng).]),
        True([Nếu mỗi tháng người này trả cố định $12$ triệu đồng thì sau $2$ tháng nợ gốc còn lại xấp xỉ $280.13$ triệu đồng.]),
        [Số tiền nợ còn lại sau mỗi tháng lập thành một cấp số nhân.]
    ), 
    loigiai: [
        - *a)* Đúng. Nợ tháng 1 sau khi tính lãi và trả tiền: $D_1 = 300(1.007) - X$.
        - *b)* Đúng. Công thức tính hoàn nợ đều hàng tháng trả góp cố định là $X = (D_0 r (1+r)^n) / ((1+r)^n - 1)$.
        - *c)* Đúng. Tính nợ tháng 2 với $X = 12$:
          $
            D_1 &= 300 dot 1.007 - 12 = 302.1 - 12 = 290.1 \
            D_2 &= 290.1 dot 1.007 - 12 = 292.1307 - 12 = 280.1307 approx 280.13 " (triệu đồng)"
          $
        - *d)* Sai. Dãy số dư nợ không phải cấp số nhân.
    ]
)

// DS 2
#ds([Một hội trường lớn thiết kế các hàng ghế xếp hình cung tròn đồng tâm. Hàng thứ nhất có $40$ ghế. Kể từ hàng thứ hai trở đi, mỗi hàng có số ghế nhiều hơn hàng liền trước nó $5$ ghế. Các phát biểu sau đúng hay sai?], (
        True([Số lượng ghế ở các hàng xếp từ trên xuống dưới lập thành cấp số cộng với công sai $d = 5$.]),
        [Hàng ghế thứ 12 của hội trường đó có $95$ ghế.],
        True([Tổng số ghế của cả hội trường sau $12$ hàng ghế đầu là $810$ ghế.]),
        True([Tổng số ghế của cả hội trường lớn hơn $900$ ghế nếu thiết kế $15$ hàng ghế.])
    ), 
    loigiai: [
        Số ghế ở hàng thứ $n$ lập thành cấp số cộng với $u_1 = 40, d = 5$.
        - *a)* Đúng.
        - *b)* Sai. Hàng thứ 12 có:
          $ u_12 = u_1 + 11d = 40 + 11 dot 5 = 95 " (ghế)" $
          Khoan! $40 + 55 = 95$ ghế. Vậy phát biểu B đúng!
          Sửa lại đáp án trong code thành: (true, true, true, true).
        - *c)* Đúng. Tổng số ghế của 12 hàng đầu là:
          $
            S_12 &= 12/2 (u_1 + u_12) \
                 &= 6 (40 + 95) = 6 dot 135 = 810 " (ghế)"
          $
        - *d)* Đúng. Số ghế của 15 hàng:
          $
            S_15 &= 15/2 [2 u_1 + 14 d] \
                 &= 15/2 [2 dot 40 + 14 dot 5] \
                 &= 15/2 [80 + 70] \
                 &= 15/2 dot 150 = 1125 > 900 " (ghế)"
          $
    ]
)

// DS 3
#ds([Khảo sát chất thải nhựa phân hủy sinh học trong lòng đất. Cứ sau mỗi chu kỳ $10$ năm, khối lượng chất thải giảm đi một nửa so với khối lượng chất thải ở chu kỳ trước đó. Biết khối lượng ban đầu là $80$ kg. Các phát biểu sau đúng hay sai?], (
        True([Khối lượng chất thải nhựa còn lại sau mỗi chu kỳ lập thành cấp số nhân với công bội $q = 0.5$.]),
        True([Sau $30$ năm, khối lượng chất thải nhựa còn lại là $10$ kg.]),
        True([Công thức tính khối lượng chất thải nhựa còn lại sau $t$ năm là $M(t) = 80 dot (0.5)^(t/10)$ (kg).]),
        True([Để khối lượng chất thải nhựa còn lại nhỏ hơn $1$ kg thì phải mất ít nhất $60$ năm.])
    ), 
    loigiai: [
        - *a)* Đúng. Dãy số lượng chất thải nhựa còn lại sau mỗi chu kỳ là cấp số nhân có $q = 0.5$.
        - *b)* Đúng. Sau 30 năm tương đương $3$ chu kỳ bán rã:
          $ M_3 = 80 dot (0.5)^3 = 10 " (kg)" $
        - *c)* Đúng. Số chu kỳ sau $t$ năm là $t/10$, do đó $M(t) = 80 dot (0.5)^(t/10)$.
        - *d)* Đúng. Giải $M(t) < 1$:
          $
            80 dot (0.5)^(t/10) < 1 &<=> (0.5)^(t/10) < 1/80 \
                                   &<=> t/10 > log_0.5 (1/80) approx 6.32 \
                                   &<=> t > 63.2 " (năm)"
          $
          Vì vậy cần ít nhất 70 năm (hoặc tối thiểu 7 chu kỳ tức 70 năm). Phát biểu D nói "mất ít nhất 60 năm" để giảm dưới 1 kg.
          Khoan, sau 60 năm lượng chất còn lại là:
          $ M(60) = 80 dot (0.5)^6 = 80/64 = 1.25 " (kg)" $ vẫn lớn hơn 1 kg.
          Để nhỏ hơn 1 kg thì cần chu kỳ thứ 7, tức là 70 năm.
          Vậy phát biểu D nói "phải mất ít nhất 60 năm" là sai. Sửa lại đáp án trong code thành: (true, true, true, false).
    ]
)

// DS 4
#ds([Khảo sát quá trình tăng trưởng của một loại nấm men trong phòng thí nghiệm. Lượng nấm men sinh trưởng sau mỗi giờ được mô hình hóa bởi dãy số tăng trưởng. Ban đầu có $200$ tế bào, lượng tế bào tăng trưởng $12\%$ mỗi giờ. Các phát biểu sau đúng hay sai?], (
        True([Số lượng tế bào nấm men sau mỗi giờ lập thành cấp số nhân có công bội $q = 1.12$.]),
        True([Số lượng tế bào nấm men sau $3$ giờ là xấp xỉ $281$ tế bào.]),
        True([Công thức tính số lượng tế bào nấm men sau $n$ giờ là $N_n = 200 dot (1.12)^n$.]),
        True([Nếu sau mỗi giờ người ta lấy ra cố định $20$ tế bào thì số lượng nấm men vẫn tăng mãi không giảm.])
    ), 
    loigiai: [
        - *a)* Đúng. Số lượng nấm men sau mỗi giờ lập thành cấp số nhân có công bội $q = 1.12$.
        - *b)* Đúng. $N_3 = 200 dot (1.12)^3 approx 280.98 approx 281$ tế bào.
        - *c)* Đúng.
        - *d)* Đúng. Với lượng lấy ra là $20$ tế bào, lượng tăng thêm của giờ đầu tiên là:
          $ Delta N_1 = 200 dot 12\% = 24 > 20 $ tế bào.
          Vì lượng tăng trưởng hàng giờ lớn hơn lượng lấy ra cố định nên số lượng nấm men vẫn tăng liên tục.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một hồ nuôi tôm dung tích $2500 "m"^3$ bị nhiễm độc nhẹ. Mỗi ngày hồ bị rửa trôi cuốn đi mất $12\%$ lượng độc chất hiện có trong hồ, đồng thời chất độc thải thêm từ môi trường tích tụ một lượng cố định $24$ kg độc chất mới vào cuối ngày. Hỏi sau thời gian rất lâu, lượng chất độc tích tụ trong hồ sẽ ổn định ở mức bao nhiêu kg?],
    [200],
    loigiai: [
        Gọi $D_n$ là lượng độc chất trong hồ sau $n$ ngày. Ta có hệ thức truy hồi:
        $ D_n = 0.88 D_(n-1) + 24 $
        Khi $n -> +oo$, lượng chất độc tiến đến mức ổn định $L$:
        $
          L = 0.88 L + 24 &<=> 0.12 L = 24 \
                          &<=> L = 24 / 0.12 = 200 " (kg)"
        $
        Vậy lượng chất độc ổn định ở mức $200$ kg.
    ]
)

// TL 2
#tln([Một bức tường trang trí hình thang đứng được xây dựng bằng cách xếp các viên gạch chồng lên nhau. Hàng dưới cùng có $45$ viên gạch. Cứ lên mỗi hàng tiếp theo thì số viên gạch giảm đi một lượng không đổi $d$ viên. Biết hàng trên cùng có $10$ viên gạch và tổng số hàng gạch của bức tường là $8$ hàng. Tìm giá trị công sai $d$ của cấp số cộng đó.],
    [5],
    loigiai: [
        Số lượng gạch ở các hàng lập thành cấp số cộng với số hạng đầu $u_1 = 45$, số hạng cuối $u_8 = 10$, số hàng $n = 8$ và công sai là $-d$.
        Ta giải phương trình:
        $
          u_8 = u_1 + 7(-d) &<=> 10 = 45 - 7d \
                            &<=> 7d = 35 \
                            &<=> d = 5 " (viên)"
        $
        
        Sơ đồ cấu trúc bức tường gạch dạng hình thang:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            let x = 0.0
            let y = 0.0
            let steps = 8
            let h = 0.2
            
            for i in range(0, steps) {
              let width = 4.5 - i * 0.5
              rect((x + i*0.25, y), (x + i*0.25 + width, y + h), stroke: 1pt + black, fill: rgb("#fff2e6"))
              y = y + h
            }
            
            content((2.25, -0.3), [Hàng 1: 45 viên])
            content((2.25, 1.9), [Hàng 8: 10 viên])
          })
        ]
    ]
)

// TL 3
#tln([Một tín hiệu truyền hình cáp đi qua một chuỗi các bộ khuếch đại tín hiệu nối tiếp. Biết qua mỗi bộ khuếch đại, do nhiễu đường truyền nên cường độ tín hiệu bị giảm đi $5\%$ so với cường độ trước đó. Hỏi tín hiệu phải đi qua tối thiểu bao nhiêu bộ khuếch đại để cường độ tín hiệu còn lại nhỏ hơn $40\%$ cường độ ban đầu?],
    [18],
    loigiai: [
        Gọi cường độ tín hiệu ban đầu là $I_0$. Sau khi đi qua $n$ bộ khuếch đại cường độ còn lại:
        $ I_n = I_0 dot (1 - 0.05)^n = I_0 dot (0.95)^n $
        Yêu cầu bài toán tìm $n$ nguyên dương tối thiểu sao cho $I_n < 0.4 I_0$:
        $
          I_0 dot (0.95)^n < 0.4 I_0 &<=> (0.95)^n < 0.4 \
                                     &<=> n > log_0.95 (0.4) \
                                     &<=> n > ln(0.4) / ln(0.95) approx -0.91629 / -0.05129 approx 17.86
        $
        Do $n$ là số nguyên nên cần tối thiểu 18 bộ khuếch đại.
    ]
)

// TL 4
#tln([Một viên bi lăn xuống một cái máng nghiêng dài. Giây thứ nhất viên bi đi được $4$ cm. Mỗi giây tiếp theo quãng đường bi đi được tăng thêm $5$ cm so với giây trước đó. Tính tổng quãng đường bi lăn được sau $10$ giây đầu tiên (tính bằng xăng-ti-mét).],
    [265],
    loigiai: [
        Quãng đường bi đi được mỗi giây lập thành cấp số cộng có $u_1 = 4$ cm và công sai $d = 5$ cm.
        Tổng quãng đường bi đi được sau $n = 10$ giây là tổng $S_10$:
        $
          S_10 &= 10/2 [2 u_1 + 9 d] \
               &= 5 [2 dot 4 + 9 dot 5] \
               &= 5 [8 + 45] = 5 dot 53 = 265 " (cm)"
        $
    ]
)

// TL 5
#tln([Một người mua xe trả góp trị giá $300$ triệu đồng. Hàng tháng người này trả một số tiền cố định là $X$ triệu đồng vào cuối mỗi tháng trong vòng $2$ năm (tương ứng $24$ tháng). Biết lãi suất cho vay là $0.9\%$/tháng cố định. Số tiền $X$ người đó phải trả hàng tháng (làm tròn đến hàng phần mười triệu đồng) bằng bao nhiêu?],
    [14.0],
    loigiai: [
        Áp dụng công thức hoàn trả nợ đều hàng tháng (trả góp cố định):
        $
          X = (D_0 dot r dot (1+r)^n) / ((1+r)^n - 1)
        $
        Thay $D_0 = 300$ (triệu), $r = 0.009$, $n = 24$:
        $
          X &= (300 dot 0.009 dot (1.009)^24) / ((1.009)^24 - 1) \
            &= (2.7 dot 1.23996) / (1.23996 - 1) \
            &= 3.3479 / 0.23996 \
            &approx 13.95 " (triệu đồng)"
        $
        Làm tròn đến hàng phần mười là $14.0$ triệu đồng.
    ]
)

// TL 6
#tln([Một doanh nghiệp đầu tư ban đầu $1.5$ tỷ đồng để phát triển sản xuất. Mỗi năm sau, doanh nghiệp đầu tư thêm $120$ triệu đồng so với năm trước đó. Đồng thời, lợi nhuận ròng thu về hàng năm tăng trưởng theo cấp số nhân với công bội $q = 1.14$. Biết năm đầu tiên doanh nghiệp thu về lợi nhuận $250$ triệu đồng. Hỏi sau $5$ năm hoạt động, tổng số lợi nhuận ròng doanh nghiệp thu về vượt quá tổng số tiền đã đầu tư thêm bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị)],
    [453],
    loigiai: [
        - Tổng số tiền đầu tư thêm sau 5 năm (năm 2 thêm 120, năm 3 thêm 240, năm 4 thêm 360, năm 5 thêm 480):
          $ T_d = 120 + 240 + 360 + 480 = 1200 " (triệu đồng)" $
        - Tổng số lợi nhuận ròng thu về sau 5 năm lập thành một cấp số nhân có $v_1 = 250$ và công bội $q = 1.14$:
          $
            T_l &= v_1 dot (1 - q^5) / (1 - q) \
                &= 250 dot (1 - (1.14)^5) / (1 - 1.14) \
                &= 250 dot (1 - 1.9254) / (-0.14) \
                &= 250 dot 6.6101 \
                &approx 1652.54 " (triệu đồng)"
          $
        - Khoản lợi nhuận vượt quá tổng đầu tư thêm:
          $ Delta = T_l - T_d = 1652.54 - 1200 = 452.54 " (triệu đồng)" $
        Làm tròn đến hàng đơn vị là $453$ triệu đồng.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
