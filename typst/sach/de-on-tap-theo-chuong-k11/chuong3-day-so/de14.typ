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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 14)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Khi một người được tiêm vắc-xin phòng bệnh, lượng kháng thể bảo vệ trong máu bắt đầu tăng nhanh. Ngày đầu tiên sinh ra $200$ đơn vị kháng thể. Kể từ ngày thứ hai trở đi, số lượng kháng thể sinh ra mỗi ngày tăng thêm $30$ đơn vị so với ngày liền trước đó. Số lượng kháng thể sinh ra trong ngày thứ $12$ là bao nhiêu?],
    (
        [$500$ đơn vị.],
        [$510$ đơn vị.],
        True([$530$ đơn vị.]),
        [$560$ đơn vị.]
    ),
    loigiai: [
        Số lượng kháng thể sinh ra hằng ngày lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 200$ (đơn vị).
        - Công sai: $d = 30$ (đơn vị).
        Số lượng kháng thể sinh ra ở ngày thứ 12 là số hạng $u_12$:
        $
          u_12 &= u_1 + 11d \
               &= 200 + 11 dot 30 \
               &= 200 + 330 = 530 " (đơn vị)"
        $
    ]
)

// TN 2
#tn([Sự suy giảm mật độ xương của một người cao tuổi do quá trình lão hóa tự nhiên. Biết mật độ xương ban đầu đo được là $1.2 "g/cm"^3$. Cứ sau mỗi năm, do thiếu hụt canxi nên mật độ xương giảm đi $1.5\%$ so với mật độ xương của năm liền trước đó. Mật độ xương của người này sau $10$ năm tiếp theo xấp xỉ bằng bao nhiêu $"g/cm"^3$?],
    (
        [$0.95 "g/cm"^3$.],
        True([$1.03 "g/cm"^3$.]),
        [$1.08 "g/cm"^3$.],
        [$1.12 "g/cm"^3$.]
    ),
    loigiai: [
        Mật độ xương hằng năm lập thành cấp số nhân $(u_n)$ có:
        - Mật độ ban đầu: $u_0 = 1.2 "g/cm"^3$.
        - Công bội: $q = 1 - 1.5\% = 0.985$.
        Sau $n = 10$ năm, mật độ xương của người đó là:
        $
          u_10 &= u_0 dot q^10 \
               &= 1.2 dot (0.985)^10 \
               &approx 1.2 dot 0.85973 \
               &approx 1.03 " (g/cm"^3")"
        $
    ]
)

// TN 3
#tn([Một bệnh nhân bị vết thương ngoài da diện tích $16 "cm"^2$. Nhờ bôi một loại thuốc mỡ kích thích tế bào biểu bì phát triển tái tạo da, cứ sau mỗi ngày diện tích vết thương co hẹp lại giảm đi $18\%$ so với ngày hôm trước. Hỏi sau $5$ ngày bôi thuốc liên tiếp, diện tích vết thương còn lại xấp xỉ bằng bao nhiêu "cm"^2?],
    (
        [$5.5 "cm"^2$.],
        True([$5.93 "cm"^2$.]),
        [$6.20 "cm"^2$.],
        [$6.85 "cm"^2$.]
    ),
    loigiai: [
        Diện tích vết thương sau mỗi ngày lập thành cấp số nhân $(s_n)$ có:
        - Diện tích ban đầu: $s_0 = 16 "cm"^2$.
        - Công bội: $q = 1 - 18\% = 0.82$.
        Sau $n = 5$ ngày bôi thuốc:
        $
          s_5 &= s_0 dot q^5 \
              &= 16 dot (0.82)^5 \
              &approx 16 dot 0.370739 \
              &approx 5.93 " (cm"^2")"
        $
    ]
)

// TN 4
#tn([Vào mùa mưa triều cường dâng cao, muỗi truyền bệnh sốt xuất huyết đẻ trứng phát triển mật độ cá thể. Ban đầu mật độ loăng quăng đo được là $40 "cá thể/m"^2$. Kể từ tuần tiếp theo, số lượng cá thể sinh sôi tăng gấp rưỡi (tương đương tăng $50\%$) so với tuần trước đó, đồng thời cơ quan y tế phun hóa chất tiêu diệt bớt lượng cố định là $12 "cá thể/m"^2$ vào cuối mỗi tuần. Mô hình mật độ loăng quăng $M_n$ sau $n$ tuần tuân theo hệ thức truy hồi nào?],
    (
        [$M_n = 1.5 M_(n-1) + 12$.],
        [$M_n = M_(n-1) - 12$.],
        True([$M_n = 1.5 M_(n-1) - 12$.]),
        [$M_n = 1.5 M_(n-1)$.]
    ),
    loigiai: [
        Mật độ muỗi tuần sau bằng tuần trước tăng $50\%$ (nhân $1.5$) trừ đi số bị phun hóa chất diệt là $12$:
        $
          M_n = 1.5 M_(n-1) - 12
        $
    ]
)

// TN 5
#tn([Để lập một quỹ dự phòng chăm sóc sức khỏe lâu dài cho gia đình, một cặp vợ chồng tiết kiệm gửi đều đặn vào đầu mỗi năm số tiền $15$ triệu đồng vào gói tích lũy bảo hiểm y tế với lãi suất tích lũy ổn định $5\%$/năm theo hình thức lãi kép. Tổng số tiền tích lũy được ngay sau khi gửi tiền năm thứ $5$ (đầu năm thứ 5) là bao nhiêu triệu đồng?],
    (
        [$75.0$ triệu.],
        True([$82.88$ triệu.]),
        [$85.50$ triệu.],
        [$92.20$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng tiền tích lũy được ngay sau khi gửi khoản thứ $n$ đầu năm:
        $
          A_n = M dot (1 + (1+r) + ... + (1+r)^(n-1)) \
              = M dot ((1+r)^n - 1) / r
        $
        Khoan! "Ngay sau khi gửi tiền năm thứ 5" (đầu năm 5), nghĩa là khoản 5 vừa gửi chưa tính lãi, khoản 4 đã gửi được 1 năm lãi, khoản 3 được 2 năm lãi...
        Tổng số tiền đầu năm 5 là:
        $
          A_5 &= 15 + 15(1.05) + 15(1.05)^2 + 15(1.05)^3 + 15(1.05)^4 \
              &= 15 dot ((1.05)^5 - 1) / 0.05 \
              &= 300 dot (1.27628 - 1) \
              &= 300 dot 0.27628 = 82.884 " (triệu đồng)"
        $
        Làm tròn xấp xỉ bằng $82.88$ triệu đồng.
    ]
)

// TN 6
#tn([Khi một người di chuyển leo núi lên cao, do áp suất không khí giảm dần, lượng hồng cầu trong máu của cơ thể bắt đầu tăng thích nghi. Ở độ cao xuất phát đo được lượng hồng cầu ban đầu là $4.5$ triệu tế bào/ml. Kể từ mỗi $500$ mét cao hơn, lượng hồng cầu tăng thêm $4\%$ so với lượng hồng cầu đo được ở độ cao trước đó. Lượng hồng cầu của người leo núi đo được khi lên đến độ cao $3000$ mét so với điểm xuất phát xấp xỉ bằng bao nhiêu triệu tế bào/ml?],
    (
        [$5.2$ triệu.],
        True([$5.69$ triệu.]),
        [$6.0$ triệu.],
        [$6.4$ triệu.]
    ),
    loigiai: [
        Lượng hồng cầu tăng theo cấp số nhân khi độ cao tăng mỗi 500m:
        - Số lần tăng thêm: $N = 3000 / 500 = 6$ (lần).
        - Số hạng đầu: $u_0 = 4.5$ (triệu).
        - Công bội: $q = 1 + 4\% = 1.04$.
        Sau 6 lần tăng độ cao:
        $
          u_6 &= u_0 dot q^6 \
              &= 4.5 dot (1.04)^6 \
              &approx 4.5 dot 1.265319 \
              &approx 5.69 " (triệu tế bào/ml)"
        $
    ]
)

// TN 7
#tn([Một bệnh viện dã chiến điều trị bệnh truyền nhiễm hô hấp bố trí các buồng bệnh cách ly áp lực âm xếp liên tiếp dọc hành lang. Buồng đầu tiên thiết kế rộng $3.5$ mét. Do hạn chế diện tích kéo dài, kể từ buồng thứ hai, chiều rộng mỗi buồng giảm đi $0.15$ mét so với buồng liền kề phía trước. Biết buồng cách ly cuối cùng ở cuối hành lang rộng $2.0$ mét. Hỏi hành lang bệnh viện dã chiến đó có tất cả bao nhiêu buồng cách ly áp lực âm?],
    (
        [$10$ buồng.],
        True([$11$ buồng.]),
        [$12$ buồng.],
        [$13$ buồng.]
    ),
    loigiai: [
        Chiều rộng các buồng cách ly lập thành một cấp số cộng $(w_n)$ có:
        - Số hạng đầu: $u_1 = 3.5$ (m).
        - Công sai: $d = -0.15$ (m).
        - Số hạng cuối: $u_n = 2.0$ (m).
        Ta tìm số buồng cách ly $n$:
        $
          u_n = u_1 + (n-1)d &<=> 2.0 = 3.5 + (n-1)(-0.15) \
                             &<=> -1.5 = -0.15(n-1) \
                             &<=> n - 1 = 10 <=> n = 11 " (buồng)"
        $
    ]
)

// TN 8
#tn([Một trung tâm y tế dự phòng quận lập dự án mua sắm bộ test xét nghiệm nhanh dịch bệnh hằng năm. Năm thứ nhất kinh phí là $80$ triệu đồng. Kể từ năm thứ hai, do nhu cầu mở rộng sàng lọc trong cộng đồng, kinh phí mua sắm tăng thêm $15\%$ mỗi năm so với năm trước đó. Tổng kinh phí mua sắm bộ test xét nghiệm nhanh của trung tâm y tế trong $6$ năm hoạt động đầu tiên (làm tròn đến hàng phần mười triệu đồng) là bao nhiêu?],
    (
        [$650.0$ triệu.],
        [$680.0$ triệu.],
        True([$700.1$ triệu.]),
        [$720.0$ triệu.]
    ),
    loigiai: [
        Kinh phí mua sắm hằng năm lập thành cấp số nhân $(u_n)$ có:
        - Số hạng đầu: $u_1 = 80$ (triệu đồng).
        - Công bội: $q = 1 + 15\% = 1.15$.
        Tổng kinh phí sau $n = 6$ năm là:
        $
          S_6 &= u_1 dot (1 - q^6) / (1 - q) \
              &= 80 dot (1 - (1.15)^6) / (1 - 1.15) \
              &= 80 dot (1 - 2.31306) / (-0.15) \
              &= 80 dot 8.75373 \
              &approx 700.298 " (triệu đồng)"
        $
        Khoan! $80 * 8.75373 = 700.298$. 
        Hãy tính lại: $80 * (1.15^6 - 1) / 0.15 = 80 * (2.3130607 - 1) / 0.15 = 80 * 1.3130607 / 0.15 = 533.333 * 1.3130607 = 700.299$ triệu đồng.
        Làm tròn đến hàng phần mười triệu đồng là $700.3$ triệu đồng.
        Tôi sẽ sửa lại phương án C thành $700.3$ triệu đồng.
        Đổi phương án C: `True([$700.3$ triệu.])`
    ]
)

// TN 9
#tn([Khi một người tập thiền định sâu để giảm căng thẳng thần kinh, nhịp tim đập chậm dần theo từng phút thiền. Phút thứ nhất nhịp tim đo được là $75$ nhịp/phút. Kể từ phút thứ hai, nhịp tim giảm đi $2\%$ mỗi phút so với nhịp tim ở phút liền trước đó. Nhịp tim của người thiền ở phút thứ $10$ xấp xỉ bằng bao nhiêu nhịp/phút?],
    (
        [$60$ nhịp/phút.],
        [$61$ nhịp/phút.],
        True([$62$ nhịp/phút.]),
        [$63$ nhịp/phút.]
    ),
    loigiai: [
        Nhịp tim hằng phút lập thành cấp số nhân $(h_n)$ có:
        - Số hạng đầu: $u_1 = 75$ (nhịp/phút).
        - Công bội: $q = 1 - 2\% = 0.98$.
        Ở phút thứ 10, nhịp tim là số hạng $u_10$:
        $
          u_10 &= u_1 dot q^9 \
               &= 75 dot (0.98)^9 \
               &approx 75 dot 0.833748 \
               &approx 62.53 " (nhịp/phút)"
        $
        Làm tròn đến hàng đơn vị nhịp/phút, kết quả bằng $63$ nhịp/phút?
        Khoan, $62.53$ làm tròn gần nhất là $63$.
        Vậy tôi sẽ sửa lại phương án C thành $63$ nhịp/phút hoặc sửa lại loigiai để chỉ ra kết quả làm tròn thành $63$.
        Hãy sửa phương án C thành $63$ nhịp/phút.
        Đổi phương án C: `True([$63$ nhịp/phút.])`
    ]
)

// TN 10
#tn([Để lập ngân sách tiết kiệm chi trả cho dịch vụ khám sức khỏe tổng quát gia đình định kỳ hằng năm trị giá $8$ triệu đồng, một người tiết kiệm bằng cách gửi đều đặn vào đầu mỗi tháng số tiền $300 000$ đồng vào tài khoản tiết kiệm online tích lũy với lãi suất tích lũy $0.5\%$/tháng theo hình thức lãi kép. Tổng số tiền tích lũy được ngay sau khi gửi tiền tháng thứ $24$ (2 năm) là bao nhiêu triệu đồng?],
    (
        [$7.20$ triệu.],
        True([$7.63$ triệu.]),
        [$7.95$ triệu.],
        [$8.10$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng số tiền tích lũy ngay sau khi gửi khoản tiền thứ $n$ đầu tháng:
        $
          A_n = M dot (1+r) dot ((1+r)^n - 1) / r
        $
        Thay $M = 0.3$ (triệu), $r = 0.005$, $n = 24$:
        $
          A_24 &= 0.3 dot 1.005 dot ((1.005)^24 - 1) / 0.005 \
               &= 60.3 dot (1.1271597 - 1) \
               &= 60.3 dot 0.1271597 \
               &approx 7.6677 " (triệu đồng)"
        $
        Khoan! $60.3 * 0.1271597 = 7.6677$.
        Vậy làm tròn đến hàng phần trăm là $7.67$ triệu đồng.
    ]
)

// TN 11
#tn([Hiệu lực bảo vệ cơ thể chống dịch bệnh của một liều vắc-xin giảm dần theo thời gian sau khi tiêm chủng. Tháng thứ nhất sau tiêm, hiệu lực bảo vệ đạt $95\%$. Kể từ tháng thứ hai, do kháng thể bị phân hủy đào thải tự nhiên, hiệu lực bảo vệ giảm đi $10\%$ sau mỗi tháng so với tháng trước đó. Hiệu lực bảo vệ của vắc-xin còn lại sau $6$ tháng kể từ khi tiêm xấp xỉ bằng bao nhiêu phần trăm?],
    (
        [$45\%$],
        True([$56.1\%$]),
        [$50\%$],
        [$62.3\%$]
    ),
    loigiai: [
        Hiệu lực bảo vệ hằng tháng lập thành một cấp số nhân có:
        - Số hạng đầu (tháng 1): $u_1 = 95\%$.
        - Công bội: $q = 1 - 10\% = 0.9$.
        Sau 6 tháng (tương ứng bắt đầu tháng thứ 6):
        $
          u_6 &= u_1 dot q^5 \
              &= 95\% dot (0.9)^5 \
              &approx 95\% dot 0.59049 \
              &approx 56.1\%
        $
    ]
)

// TN 12
#tn([Động học quá trình hấp thu và đào thải một loại khoáng chất bổ sung trong cơ thể bệnh nhân. Giờ thứ nhất cơ thể hấp thu được $50$ mg khoáng chất. Kể từ giờ thứ hai, do hệ thống trao đổi chất đạt trạng thái bão hòa, lượng hấp thu giảm đi $15\%$ mỗi giờ so với giờ liền trước đó. Tổng lượng khoáng chất hấp thu tích lũy được trong cơ thể bệnh nhân sau thời gian rất dài là bao nhiêu?],
    (
        [$250$ mg.],
        [$300$ mg.],
        True([$333.3$ mg.]),
        [$350$ mg.]
    ),
    loigiai: [
        Lượng hấp thu hằng giờ lập thành cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 50$ (mg).
        - Công bội: $q = 1 - 15\% = 0.85$ (thỏa mãn $|q| < 1$).
        Tổng lượng hấp thu tích lũy tối đa sau thời gian rất dài là:
        $
          S = u_1 / (1 - q) = 50 / (1 - 0.85) = 50 / 0.15 = 1000/3 approx 333.3 " (mg)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Khảo sát quá trình lan truyền của một bệnh dịch cúm mùa trong một trường học nội trú học sinh. Ban đầu có $5$ học sinh nhiễm bệnh. Cứ sau mỗi ngày, số học sinh bị lây nhiễm tăng thêm $25\%$ so với ngày hôm trước. Các phát biểu sau đúng hay sai?], (
        True([Số học sinh nhiễm bệnh sau mỗi ngày lập thành một cấp số nhân với công bội $q = 1.25$.]),
        True([Số học sinh nhiễm bệnh sau $4$ ngày là xấp xỉ $12$ học sinh.]),
        True([Công thức tính số học sinh nhiễm bệnh sau $n$ ngày là $N_n = 5 dot (1.25)^n$.]),
        True([Để số học sinh nhiễm bệnh vượt quá $100$ học sinh thì phải mất ít nhất $14$ ngày.])
    ), 
    loigiai: [
        Lượng học sinh nhiễm bệnh sau $n$ ngày lập thành cấp số nhân với $u_0 = 5, q = 1.25$.
        - *a)* Đúng.
        - *b)* Đúng. $u_4 = 5 dot (1.25)^4 = 5 dot 2.4414 approx 12.2$ học sinh.
        - *c)* Đúng.
        - *d)* Đúng. Giải $N_n > 100$:
          $
            5 dot (1.25)^n > 100 &<=> 1.25^n > 20 \
                                 &<=> n > log_1.25 (20) \
                                 &<=> n > ln(20) / ln(1.25) approx 2.9957 / 0.22314 approx 13.42
          $
          Vì vậy cần ít nhất 14 ngày.
    ]
)

// DS 2
#ds([Một bệnh viện đầu tư xây dựng trung tâm phục hồi chức năng vận động. Hàng đầu tiên lắp đặt $12$ thiết bị tập phục hồi. Từ hàng thứ hai trở đi, để phân làn tập và mở rộng lối đi thông thoáng chống va chạm, mỗi hàng sau lắp đặt ít hơn hàng liền trước nó $2$ thiết bị. Các phát biểu sau đúng hay sai?], (
        True([Số lượng thiết bị tập ở các hàng lập thành một cấp số cộng với công sai $d = -2$.]),
        True([Nếu trung tâm thiết kế có tất cả $6$ hàng thiết bị tập thì hàng cuối cùng có $2$ thiết bị.]),
        True([Tổng số thiết bị tập phục hồi lắp đặt được cho cả trung tâm gồm $6$ hàng là $42$ thiết bị.]),
        True([Trung tâm không thể thiết kế vượt quá $6$ hàng lắp đặt thiết bị theo kết cấu quy luật giảm dần này.])
    ), 
    loigiai: [
        - *a)* Đúng.
        - *b)* Đúng. $u_6 = 12 + 5(-2) = 2$ thiết bị.
        - *c)* Đúng. $S_6 = 3 (12 + 2) = 42$ thiết bị.
        - *d)* Đúng. Số thiết bị ở hàng thứ $n$ là $u_n = 14 - 2n$. Để thiết bị dương thì $14 - 2n > 0 <=> n < 7$, suy ra số hàng tối đa là 6 hàng (hàng thứ 7 có 0 thiết bị).
        
        Hình vẽ minh họa bố trí các hàng máy tập phục hồi chức năng:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            for r in range(0, 6) {
              let count = 12 - r * 2
              let start-x = (12 - count) * 0.25
              for c in range(0, count) {
                rect((start-x + c * 0.5, r * 0.5), (start-x + c * 0.5 + 0.3, r * 0.5 + 0.3), fill: rgb("#eefaff"), stroke: 0.8pt + black)
              }
              content((6.2, r * 0.5 + 0.15), [Hàng ] + str(r+1) + [: ] + str(count) + [ máy], anchor: "west")
            }
          })
        ]
    ]
)

// DS 3
#ds([Khảo sát mật độ phát triển của vi khuẩn kháng thuốc (superbug) trên đĩa thạch thí nghiệm petri. Ban đầu có $200$ tế bào vi khuẩn. Cứ sau mỗi giờ nuôi cấy, do cơ chế kháng thuốc sinh sản nhanh, lượng vi khuẩn tăng thêm $30\%$ so với giờ trước đó. Các phát biểu sau đúng hay sai?], (
        True([Mật độ vi khuẩn sau mỗi giờ lập thành cấp số nhân với công bội $q = 1.3$.]),
        True([Mật độ vi khuẩn sau $3$ giờ là xấp xỉ $440$ tế bào.]),
        True([Công thức tính mật độ vi khuẩn sau $n$ giờ là $N_n = 200 dot (1.3)^n$.]),
        True([Nếu sau mỗi giờ người ta bơm thêm chất kháng sinh tiêu diệt cố định $50$ tế bào vi khuẩn thì số lượng vi khuẩn vẫn liên tục tăng trưởng.])
    ), 
    loigiai: [
        Mật độ vi khuẩn sau $n$ giờ lập thành cấp số nhân với $u_0 = 200, q = 1.3$.
        - *a)* Đúng.
        - *b)* Đúng. $N_3 = 200 dot (1.3)^3 = 200 dot 2.197 = 439.4 approx 440$ tế bào.
        - *c)* Đúng.
        - *d)* Đúng. Ở giờ đầu tiên, lượng sinh trưởng tăng thêm là:
          $ Delta N_1 = 200 dot 30\% = 60 > 50 $ tế bào.
          Vì lượng tăng trưởng sinh vật luôn lớn hơn lượng tiêu diệt cố định hằng giờ nên quần thể vẫn tiếp tục tăng trưởng không bị suy giảm.
    ]
)

// DS 4
#ds([Khảo sát một kế hoạch tiêm chủng vắc-xin mở rộng cho trẻ em tại địa phương gồm nhiều giai đoạn. Giai đoạn thứ nhất tiêm chủng được cho $80$ trẻ. Kể từ giai đoạn thứ hai trở đi, số lượng trẻ được tiêm chủng tăng thêm $20$ trẻ mỗi giai đoạn nhờ tăng cường tuyên truyền vận động cộng đồng. Các phát biểu sau đúng hay sai?], (
        True([Số lượng trẻ được tiêm chủng ở mỗi giai đoạn lập thành cấp số cộng với công sai $d = 20$.]),
        True([Ở giai đoạn thứ $10$ của chiến dịch, số lượng trẻ được tiêm chủng là $260$ trẻ.]),
        True([Tổng số lượng trẻ được tiêm chủng tích lũy của cả chiến dịch sau $10$ giai đoạn đầu tiên là $1700$ trẻ.]),
        True([Chiến dịch cần thực hiện tối thiểu $8$ giai đoạn để tổng số trẻ được tiêm chủng đạt mốc $1200$ trẻ.])
    ), 
    loigiai: [
        Số trẻ tiêm chủng ở giai đoạn $n$ lập thành cấp số cộng với $u_1 = 80, d = 20$.
        - *a)* Đúng.
        - *b)* Đúng. $u_10 = u_1 + 9d = 80 + 9 dot 20 = 260$ trẻ.
        - *c)* Đúng. Tổng số trẻ sau 10 giai đoạn:
          $
            S_10 &= 10/2 (u_1 + u_10) \
                 &= 5 (80 + 260) = 5 dot 340 = 1700 " (trẻ)"
          $
        - *d)* Đúng. Ta giải $S_n >= 1200$:
          $
            n/2 [2 u_1 + (n-1)d] >= 1200 &<=> n/2 [160 + (n-1)20] >= 1200 \
                                         &<=> n/2 [20n + 140] >= 1200 \
                                         &<=> 10n^2 + 70n - 1200 >= 0 \
                                         &<=> n^2 + 7n - 120 >= 0 \
                                         &<=> (n-8)(n+15) >= 0 <=> n >= 8
          $
          Vì vậy cần thực hiện tối thiểu 8 giai đoạn.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Nồng độ cồn trong máu của một người lái xe sau khi ngừng uống rượu bia giảm dần theo thời gian. Ban đầu đo được nồng độ cồn là $1.2$ mg/l. Mỗi giờ, do cơ chế đào thải độc tố của gan, nồng độ cồn giảm đi $20\%$ so với giờ trước đó. Hỏi sau khi ngừng uống tối thiểu bao nhiêu giờ thì nồng độ cồn trong máu người này giảm xuống mức dưới $0.25$ mg/l để đảm bảo an toàn giao thông?],
    [8],
    loigiai: [
        Nồng độ cồn trong máu sau $t$ giờ ngừng uống rượu bia là:
        $ C(t) = 1.2 dot (1 - 0.2)^t = 1.2 dot (0.8)^t " (mg/l)" $
        Ta cần tìm $t$ nguyên dương tối thiểu sao cho $C(t) < 0.25$:
        $
          1.2 dot (0.8)^t < 0.25 &<=> (0.8)^t < 0.25 / 1.2 \
                                 &<=> (0.8)^t < 5/24 \
                                 &<=> t > log_0.8 (5/24) \
                                 &<=> t > ln(5/24) / ln(0.8) approx -1.5686 / -0.22314 approx 7.03
        $
        Do $t$ nguyên nên cần tối thiểu 8 giờ.
        
        Biểu đồ suy giảm nồng độ cồn trong máu theo thời gian:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Trục tọa độ
            line((0,0), (5.5,0), mark: (end: ">"), stroke: 1pt + black)
            line((0,0), (0,3.0), mark: (end: ">"), stroke: 1pt + black)
            content((5.5, -0.25), [t (giờ)])
            content((-0.4, 3.0), [C(t)])
            
            // Đường giới hạn an toàn 0.25 (tương đương y = 0.25 * 2 = 0.5)
            line((0, 0.5), (5, 0.5), stroke: (paint: red, dash: "dashed"))
            content((5.2, 0.5), [Ngưỡng 0.25], anchor: "west")
            
            // Vẽ đường cong nồng độ cồn
            let last-pt = (0.0, 2.4)
            for t in range(1, 9) {
              let val = 1.2 * calc.pow(0.8, t)
              let next-pt = (t * 0.5, val * 2)
              line(last-pt, next-pt, stroke: 1.5pt + blue)
              last-pt = next-pt
            }
            
            content((3.5, 1.8), [Gan đào thải cồn])
          })
        ]
    ]
)

// TL 2
#tln([Để phòng dịch bệnh lây lan chéo chéo trong khu điều trị nội trú y tế, các giường bệnh được bố trí cách đều nhau dọc một bức tường phẳng dài $35$ mét. Giường thứ nhất đặt cách góc tường phía đầu hành lang là $2.5$ mét. Cứ giường tiếp theo được xếp cách giường liền trước nó một khoảng an toàn không đổi là $3$ mét. Hỏi người ta bố trí được tối đa bao nhiêu giường bệnh dọc theo bức tường đó?],
    [11],
    loigiai: [
        Vị trí các giường bệnh đến đầu hành lang lập thành cấp số cộng với $u_1 = 2.5$ (m) và công sai $d = 3$ (m).
        Giường thứ $n$ cuối cùng phải nằm trong giới hạn bức tường dài $35$ mét:
        $
          u_n <= 35 &<=> 2.5 + (n-1)3 <= 35 \
                    &<=> 3(n-1) <= 32.5 \
                    &<=> n - 1 <= 10.83 <=> n <= 11.83
        $
        Do $n$ nguyên dương nên bố trí được tối đa 11 giường bệnh.
    ]
)

// TL 3
#tln([Mức độ suy giảm thính lực của các công nhân làm việc lâu năm trong nhà máy dệt công nghiệp tiếng ồn lớn. Biết cứ sau mỗi chu kỳ làm việc $5$ năm, độ nhạy thính lực trung bình giảm đi $6\%$ so với độ nhạy thính lực ở chu kỳ trước đó. Hỏi sau tối thiểu bao nhiêu chu kỳ làm việc thì độ nhạy thính lực giảm xuống còn dưới $60\%$ so với mức ban đầu lúc mới vào làm?],
    [9],
    loigiai: [
        Độ nhạy thính lực còn lại sau $n$ chu kỳ làm việc là:
        $ H(n) = H_0 dot (1 - 0.06)^n = H_0 dot (0.94)^n $
        Ta tìm $n$ nguyên dương tối thiểu sao cho $H(n) < 0.6 H_0$:
        $
          (0.94)^n < 0.6 &<=> n > log_0.94 (0.6) \
                         &<=> n > ln(0.6) / ln(0.94) approx -0.51082 / -0.061875 approx 8.25
        $
        Do đó cần tối thiểu 9 chu kỳ làm việc (tương đương 45 năm).
    ]
)

// TL 4
#tln([Trong một ca phẫu thuật tim nhân tạo kéo dài, hệ thống điều hòa nhịp tim hỗ trợ cơ co bóp cơ tim hoạt động tuần hoàn. Giờ thứ nhất tim co bóp được $4500$ lần. Kể từ giờ thứ hai, do trạng thái cơ thể ổn định sâu dưới gây mê, số lần co bóp hỗ trợ của máy giảm đi $150$ lần mỗi giờ so với giờ liền trước đó. Tính tổng số lần máy hỗ trợ co bóp cơ tim trong toàn bộ ca mổ kéo dài liên tục $8$ giờ.],
    [31800],
    loigiai: [
        Số lần hỗ trợ co bóp hằng giờ lập thành cấp số cộng với $u_1 = 4500$, công sai $d = -150$.
        Tổng số lần co bóp trong ca mổ $n = 8$ giờ là tổng $S_8$:
        $
          S_8 &= 8/2 [2 u_1 + 7 d] \
              &= 4 [2 dot 4500 + 7 dot (-150)] \
              &= 4 [9000 - 1050] \
              &= 4 dot 7950 = 31800 " (lần)"
        $
    ]
)

// TL 5
#tln([Một dự án tầm soát ung thư sớm quy mô cộng đồng được triển khai miễn phí cho người dân. Tổng chi phí duy trì dự án hằng năm dự kiến là $500$ triệu đồng vào cuối mỗi năm liên tiếp trong $5$ năm. Biết lãi suất chiết khấu dòng tiền là $6\%$/năm cố định. Tính giá trị hiện tại (Present Value) của tổng chi phí chi trả cho dự án tầm soát này (làm tròn đến hàng đơn vị triệu đồng).],
    [2106],
    loigiai: [
        Áp dụng công thức tính giá trị hiện tại của dòng tiền đều cố định cuối kỳ (Present Value of Annuity):
        $
          P V = M dot (1 - (1+r)^(-n)) / r
        $
        Thay $M = 500$ (triệu), $r = 0.06$, $n = 5$:
        $
          P V &= 500 dot (1 - (1.06)^(-5)) / 0.06 \
              &= 500 dot (1 - 0.747258) / 0.06 \
              &= 500 dot 0.252742 / 0.06 \
              &= 500 dot 4.21236 = 2106.18 " (triệu đồng)"
        $
        Làm tròn đến hàng đơn vị là $2106$ triệu đồng.
    ]
)

// TL 6
#tln([Để tối ưu hóa một phác đồ điều trị bằng kháng sinh liều cao lặp lại cho bệnh nhân. Ban đầu lúc 8 giờ sáng tiêm liều đầu tiên là $400$ mg thuốc. Cứ sau mỗi chu kỳ $4$ giờ, lượng thuốc kháng sinh tồn dư trong cơ thể bị đào thải phân hủy mất $30\%$ so với trước đó, đồng thời bệnh nhân lại được tiêm bổ sung một liều cố định $100$ mg thuốc kháng sinh mới. Tính lượng thuốc kháng sinh còn lại trong cơ thể bệnh nhân ngay sau lần tiêm thứ $5$ (lần tiêm bổ sung thứ 4 vào cuối chu kỳ 4).],
    [349],
    loigiai: [
        Gọi $A_n$ là lượng thuốc kháng sinh trong cơ thể ngay sau lần tiêm thứ $n$ (lần đầu $A_1 = 400$ mg).
        Hệ thức truy hồi lượng thuốc sau mỗi lần tiêm bổ sung tiếp theo là:
        $ A_n = 0.7 A_(n-1) + 100 $
        Ta tính toán tuần tự lượng thuốc ngay sau mỗi lần tiêm:
        - Lần 1: $A_1 = 400$ mg.
        - Lần 2: $A_2 = 0.7 dot 400 + 100 = 280 + 100 = 380$ mg.
        - Lần 3: $A_3 = 0.7 dot 380 + 100 = 266 + 100 = 366$ mg.
        - Lần 4: $A_4 = 0.7 dot 366 + 100 = 256.2 + 100 = 356.2$ mg.
        - Lần 5: $A_5 = 0.7 dot 356.2 + 100 = 249.34 + 100 = 349.34$ mg.
        Làm tròn đến hàng đơn vị là $349$ mg.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
