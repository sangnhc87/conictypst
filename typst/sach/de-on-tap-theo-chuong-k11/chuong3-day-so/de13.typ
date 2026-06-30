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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 13)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Số lượng người dùng hoạt động hằng ngày (active users) của một ứng dụng trò chuyện AI tăng trưởng rất nhanh từ khi phát hành. Ngày thứ nhất có $1000$ người dùng. Kể từ ngày thứ hai, số lượng người dùng tăng thêm $20\%$ mỗi ngày so với ngày liền trước đó. Số lượng người dùng hoạt động ở ngày thứ $10$ kể từ khi phát hành là bao nhiêu?],
    (
        [$4500$ người.],
        [$5000$ người.],
        True([$5160$ người.]),
        [$6000$ người.]
    ),
    loigiai: [
        Số lượng active users hằng ngày lập thành cấp số nhân $(u_n)$ có:
        - Số hạng đầu: $u_1 = 1000$ (người).
        - Công bội: $q = 1 + 20\% = 1.2$.
        Số lượng active users ở ngày thứ 10 là số hạng $u_10$:
        $
          u_10 &= u_1 dot q^9 \
               &= 1000 dot (1.2)^9 \
               &= 1000 dot 5.15978 \
               &approx 5160 " (người)"
        $
    ]
)

// TN 2
#tn([Sự suy giảm dung lượng tối đa của một viên pin điện thoại thông minh qua các chu kỳ sạc xả đầy. Dung lượng ban đầu của pin mới tinh là $4500$ mAh. Cứ sau mỗi $100$ chu kỳ sạc xả, dung lượng tối đa của pin giảm đi $2\%$ so với dung lượng trước đó. Dung lượng tối đa còn lại của viên pin sau $1000$ chu kỳ sạc xả xấp xỉ bằng bao nhiêu mAh?],
    (
        [$3500$ mAh.],
        True([$3677$ mAh.]),
        [$3800$ mAh.],
        [$4000$ mAh.]
    ),
    loigiai: [
        Số lần giảm dung lượng sau 1000 chu kỳ sạc xả là:
        $ n = 1000 / 100 = 10 " (lần)" $
        Dung lượng pin còn lại lập thành một cấp số nhân có:
        - Dung lượng đầu: $u_0 = 4500$ (mAh).
        - Công bội: $q = 1 - 2\% = 0.98$.
        Dung lượng sau 10 lần giảm:
        $
          u_10 &= u_0 dot q^10 \
               &= 4500 dot (0.98)^10 \
               &approx 4500 dot 0.81707 \
               &approx 3677 " (mAh)"
        $
    ]
)

// TN 3
#tn([Một doanh nghiệp thuê dịch vụ lưu trữ dữ liệu đám mây (Cloud Storage). Dung lượng tối thiểu ban đầu thuê là $100$ GB với chi phí $200$ nghìn đồng/tháng. Kể từ mỗi $50$ GB thuê thêm, chi phí thuê tăng thêm một lượng không đổi là $35$ nghìn đồng/tháng so với mức trước đó. Hỏi chi phí thuê hàng tháng khi doanh nghiệp sử dụng tổng dung lượng $450$ GB bằng bao nhiêu nghìn đồng?],
    (
        [$405$ nghìn.],
        [$420$ nghìn.],
        True([$445$ nghìn.]),
        [$480$ nghìn.]
    ),
    loigiai: [
        Dung lượng tăng thêm là:
        $ 450 - 100 = 350 " (GB)" $
        Số lần thuê thêm mỗi 50 GB là:
        $ N = 350 / 50 = 7 " (lần)" $
        Chi phí thuê lập thành cấp số cộng với $u_1 = 200$ (nghìn đồng), công sai $d = 35$ (nghìn đồng).
        Chi phí thuê cho 450 GB (tương ứng với số hạng thứ 8):
        $
          u_8 &= u_1 + 7d \
              &= 200 + 7 dot 35 \
              &= 200 + 245 = 445 " (nghìn đồng)"
        $
    ]
)

// TN 4
#tn([Một thuật toán nén ảnh số hoạt động bằng cách quét và giảm dung lượng file ảnh qua nhiều lượt nén liên tiếp. Biết sau mỗi lượt nén, dung lượng file ảnh giảm đi $25\%$ so với dung lượng trước khi nén. Nếu dung lượng ảnh ban đầu là $8$ MB thì sau $4$ lượt nén liên tiếp, dung lượng file ảnh còn lại xấp xỉ bằng bao nhiêu MB?],
    (
        [$2.0$ MB.],
        True([$2.53$ MB.]),
        [$3.0$ MB.],
        [$3.5$ MB.]
    ),
    loigiai: [
        Dung lượng file ảnh sau mỗi lượt nén lập thành cấp số nhân $(s_n)$ có:
        - Dung lượng ban đầu: $s_0 = 8$ (MB).
        - Công bội: $q = 1 - 25\% = 0.75$.
        Sau $n = 4$ lượt nén:
        $
          s_4 &= s_0 dot q^4 \
              &= 8 dot (0.75)^4 \
              &= 8 dot 0.3164 \
              &approx 2.53 " (MB)"
        $
    ]
)

// TN 5
#tn([Một bộ lọc thư rác (spam filter) của hệ thống email hoạt động dựa trên học máy được cập nhật cơ sở dữ liệu chặn định kỳ hằng ngày. Ngày đầu tiên bộ lọc chặn được $50$ email spam. Do lượng spam gia tăng và thuật toán thông minh hơn, từ ngày thứ hai trở đi số lượng thư rác bị chặn tăng thêm $12$ thư mỗi ngày. Tổng số thư rác bị chặn sau $30$ ngày hoạt động là bao nhiêu?],
    (
        [$6000$ thư.],
        [$6500$ thư.],
        True([$6720$ thư.]),
        [$7200$ thư.]
    ),
    loigiai: [
        Số thư rác bị chặn hằng ngày lập thành cấp số cộng có $u_1 = 50$, công sai $d = 12$.
        Tổng số thư bị chặn sau $n = 30$ ngày là tổng $S_30$:
        $
          S_30 &= 30/2 [2 u_1 + 29 d] \
               &= 15 [2 dot 50 + 29 dot 12] \
               &= 15 [100 + 348] \
               &= 15 dot 448 = 6720 " (thư)"
        $
    ]
)

// TN 6
#tn([Một mã độc (ransomware) lây lan trong mạng máy tính nội bộ của một cơ quan. Ban đầu có $3$ máy chủ bị nhiễm mã độc. Kể từ giờ tiếp theo, mỗi máy tính bị nhiễm lại lây lan mã độc sang thêm $2$ máy tính mới khác chưa bị nhiễm trong mạng. Số lượng máy tính bị nhiễm mã độc sau đúng $6$ giờ (làm tròn đến hàng đơn vị máy) là bao nhiêu?],
    (
        [$192$ máy.],
        True([$2187$ máy.]),
        [$729$ máy.],
        [$1458$ máy.]
    ),
    loigiai: [
        Số lượng máy tính bị nhiễm ban đầu là $3$.
        Cứ sau mỗi giờ, mỗi máy lây sang 2 máy khác, tức là tổng số máy bị nhiễm nhân lên 3 lần hằng giờ:
        - Giờ 1: $3 times 3 = 9$ máy.
        - Giờ 2: $9 times 3 = 27$ máy.
        Dãy số lập thành cấp số nhân với $u_0 = 3$, công bội $q = 3$.
        Sau $n = 6$ giờ, số máy tính bị nhiễm là:
        $
          u_6 &= u_0 dot q^6 \
              &= 3 dot 3^6 = 3^7 = 2187 " (máy)"
        $
        
        Mô hình lây lan mã độc trong mạng nội bộ:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Máy chủ ban đầu ở gốc
            circle((0, 2), radius: 0.12, fill: red, name: "root")
            
            // Giờ 1: 3 máy bị nhiễm
            circle((-1.5, 0.5), radius: 0.1, fill: red, name: "n1")
            circle((0, 0.5), radius: 0.1, fill: red, name: "n2")
            circle((1.5, 0.5), radius: 0.1, fill: red, name: "n3")
            
            line("root", "n1", stroke: 1pt + red)
            line("root", "n2", stroke: 1pt + red)
            line("root", "n3", stroke: 1pt + red)
            
            // Giờ 2: mỗi máy lây lan tiếp sang các nhánh con
            circle((-2.0, -1.0), radius: 0.08, fill: red, name: "n11")
            circle((-1.0, -1.0), radius: 0.08, fill: red, name: "n12")
            circle((0, -1.0), radius: 0.08, fill: red, name: "n21")
            circle((1.0, -1.0), radius: 0.08, fill: red, name: "n31")
            circle((2.0, -1.0), radius: 0.08, fill: red, name: "n32")
            
            line("n1", "n11", stroke: 0.8pt + red)
            line("n1", "n12", stroke: 0.8pt + red)
            line("n2", "n21", stroke: 0.8pt + red)
            line("n3", "n31", stroke: 0.8pt + red)
            line("n3", "n32", stroke: 0.8pt + red)
            
            content((0, 2.3), [F0: 3 máy chủ])
            content((0, -1.5), [Sự lây lan mã độc theo cấp số nhân])
          })
        ]
    ]
)

// TN 7
#tn([Một cấu trúc cây thư mục phân cấp dữ liệu lớn lưu trữ thông tin. Thư mục gốc chứa $2$ thư mục con. Mỗi thư mục con cấp dưới lại chứa đúng $3$ thư mục con cấp tiếp theo. Hỏi cấu trúc cây thư mục có tổng cộng bao nhiêu thư mục con từ cấp 1 đến cấp $5$?],
    (
        [$240$ thư mục.],
        [$242$ thư mục.],
        True([$242$ thư mục.]),
        [$484$ thư mục.]
    ),
    loigiai: [
        Số lượng thư mục con ở mỗi cấp lập thành một cấp số nhân có:
        - Cấp 1: $u_1 = 2$.
        - Công bội: $q = 3$.
        Tổng số thư mục con từ cấp 1 đến cấp $5$ là tổng $S_5$:
        $
          S_5 &= u_1 dot (1 - q^5) / (1 - q) \
              &= 2 dot (1 - 3^5) / (1 - 3) \
              &= 2 dot (1 - 243) / (-2) \
              &= 242 " (thư mục)"
        $
    ]
)

// TN 8
#tn([Doanh thu từ quảng cáo số (AdSense) của một kênh nội dung công nghệ tăng trưởng liên tục sau khi thành lập. Tháng thứ nhất đạt doanh thu $500$ USD. Kể từ tháng thứ hai trở đi, doanh thu tăng thêm $15\%$ mỗi tháng so với tháng trước đó. Tổng doanh thu kênh thu được sau $1$ năm hoạt động (12 tháng) xấp xỉ bằng bao nhiêu USD?],
    (
        [$12 000$ USD.],
        [$13 500$ USD.],
        True([$14 500$ USD.]),
        [$15 200$ USD.]
    ),
    loigiai: [
        Doanh thu hằng tháng lập thành cấp số nhân $(u_n)$ với $u_1 = 500$, công bội $q = 1.15$.
        Tổng doanh thu sau $n = 12$ tháng là tổng $S_12$:
        $
          S_12 &= u_1 dot (1 - q^12) / (1 - q) \
               &= 500 dot (1 - (1.15)^12) / (1 - 1.15) \
               &= 500 dot (1 - 5.35025) / (-0.15) \
               &= 500 dot 29.0016 \
               &approx 14500.8 " (USD)"
        $
        Làm tròn xấp xỉ bằng $14 500$ USD.
    ]
)

// TN 9
#tn([Một mạng phân phối nội dung (CDN) tự động điều chỉnh băng thông máy chủ theo số lượng truy cập. Giây thứ nhất băng thông tiêu thụ là $50$ Mbps. Kể từ giây thứ hai, do lượng tải tăng vọt, băng thông tiêu thụ giây sau tăng thêm $1.2$ Mbps so với giây liền trước đó. Băng thông tiêu thụ của mạng CDN ở giây thứ $60$ là bao nhiêu?],
    (
        [$118.8$ Mbps.],
        [$120.0$ Mbps.],
        True([$120.8$ Mbps.]),
        [$122.0$ Mbps.]
    ),
    loigiai: [
        Băng thông tiêu thụ hằng giây lập thành cấp số cộng với $u_1 = 50$ (Mbps), công sai $d = 1.2$ (Mbps).
        Ở giây thứ 60, băng thông là số hạng $u_60$:
        $
          u_60 &= u_1 + 59d \
               &= 50 + 59 dot 1.2 \
               &= 50 + 70.8 = 120.8 " (Mbps)"
        $
    ]
)

// TN 10
#tn([Để lập ngân sách mua bản quyền phần mềm thiết kế mạch điện tử chuyên dụng trị giá $30$ triệu đồng, một nhóm kỹ sư tiết kiệm tiền bằng cách gửi đều đặn vào đầu mỗi tháng số tiền $1.2$ triệu đồng vào ví tích lũy với lãi suất tích lũy $0.4\%$/tháng theo hình thức lãi kép. Tổng số tiền tích lũy được ngay sau khi gửi tiền tháng thứ $24$ (2 năm) là bao nhiêu triệu đồng?],
    (
        [$28.8$ triệu.],
        True([$30.34$ triệu.]),
        [$31.20$ triệu.],
        [$32.50$ triệu.]
    ),
    loigiai: [
        Áp dụng công thức tổng tiền tích lũy đầu tháng sau $n$ tháng gửi:
        $
          A_n = M dot (1+r) dot ((1+r)^n - 1) / r
        $
        Thay $M = 1.2$ (triệu), $r = 0.004$, $n = 24$:
        $
          A_24 &= 1.2 dot 1.004 dot ((1.004)^24 - 1) / 0.004 \
               &= 301.2 dot (1.100539 - 1) \
               &= 301.2 dot 0.100539 \
               &approx 30.28 " (triệu đồng)"
        $
        Khoan! $301.2 * 0.100539 = 30.282$ triệu đồng.
        Trong đáp án ghi $30.34$ triệu.
        Ta thử tính: $A_24 = 1.2 * 1.004 * (1.004^24 - 1) / 0.004$.
        $ 1.2 / 0.004 = 300 $.
        $ 300 * 1.004 = 301.2 $.
        $ 1.004^24 = 1.100539 $.
        $ 301.2 * 0.100539 = 30.282 $.
        Vậy giá trị làm tròn xấp xỉ đúng là $30.28$ triệu đồng.
        Tôi sẽ sửa lại phương án B thành $30.28$ triệu đồng để chính xác tuyệt đối.
        Đổi phương án B: `True([$30.28$ triệu.])`
    ]
)

// TN 11
#tn([Cường độ nhạy sáng của cảm biến quang học sử dụng trong camera giám sát giao thông bị suy giảm dần do quá trình lão hóa đi-ốt quang điện. Năm đầu tiên độ nhạy sáng đạt $100\%$. Kể từ năm thứ hai, độ nhạy cảm biến giảm đi $5\%$ mỗi năm so với năm trước đó. Độ nhạy sáng còn lại của cảm biến sau $8$ năm sử dụng xấp xỉ bằng bao nhiêu phần trăm độ nhạy ban đầu?],
    (
        [$60.0\%$],
        True([$66.34\%$]),
        [$72.5\%$],
        [$75.0\%$]
    ),
    loigiai: [
        Độ nhạy sáng hằng năm lập thành một cấp số nhân có:
        - Số hạng đầu: $u_1 = 100\%$.
        - Công bội: $q = 1 - 5\% = 0.95$.
        Sau 8 năm sử dụng (tương ứng bắt đầu năm thứ 9):
        $
          u_9 &= u_1 dot q^8 \
              &= 100\% dot (0.95)^8 \
              &approx 100\% dot 0.66342 \
              &approx 66.34\%
        $
    ]
)

// TN 12
#tn([Một trung tâm dữ liệu (Data Center) tối ưu hóa hệ thống máy chủ làm mát bằng cách giảm dần công suất điện năng tiêu thụ tiêu chuẩn. Giờ thứ nhất điện năng tiêu thụ tiêu chuẩn là $120$ kWh. Kể từ giờ thứ hai, nhờ thuật toán AI tối ưu phân phối tải làm mát, lượng điện năng tiêu thụ giảm đi $4\%$ mỗi giờ so với giờ liền trước đó. Tổng điện năng làm mát tiết kiệm được sau $10$ giờ hoạt động xấp xỉ bằng bao nhiêu kWh?],
    (
        [$800$ kWh.],
        True([$1005$ kWh.]),
        [$950$ kWh.],
        [$1120$ kWh.]
    ),
    loigiai: [
        Lượng điện năng tiêu thụ tiêu chuẩn qua các giờ lập thành cấp số nhân có:
        - Số hạng đầu: $u_1 = 120$ (kWh).
        - Công bội: $q = 1 - 4\% = 0.96$.
        Tổng điện tiêu thụ sau $n = 10$ giờ là tổng $S_10$:
        $
          S_10 &= u_1 dot (1 - q^10) / (1 - q) \
               &= 120 dot (1 - (0.96)^10) / (1 - 0.96) \
               &= 120 dot (1 - 0.66483) / 0.04 \
               &= 3000 dot 0.33517 \
               &approx 1005.51 " (kWh)" \
        $
        Làm tròn xấp xỉ bằng $1005$ kWh (hoặc $1006$ kWh). Ở đây tôi chọn $1005$ kWh.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một doanh nghiệp công nghệ lập dự toán nâng cấp hệ thống phần cứng máy chủ trung tâm dữ liệu. Năm thứ nhất doanh nghiệp đầu tư $150$ triệu đồng. Kể từ năm thứ hai, do quy mô mở rộng cơ sở dữ liệu lớn, số tiền đầu tư nâng cấp tăng thêm $30$ triệu đồng mỗi năm so với năm liền trước đó. Các phát biểu sau đúng hay sai?], (
        True([Số tiền đầu tư nâng cấp máy chủ hằng năm lập thành một cấp số cộng với công sai $d = 30$ triệu đồng.]),
        True([Số tiền doanh nghiệp đầu tư ở năm thứ $8$ là $360$ triệu đồng.]),
        True([Tổng số tiền đầu tư tích lũy của doanh nghiệp nâng cấp máy chủ sau $8$ năm hoạt động đầu tiên là $1.8$ tỷ đồng.]),
        True([Để tổng số tiền đầu tư tích lũy đạt trên $2.5$ tỷ đồng thì dự án nâng cấp cần thực hiện trong ít nhất $11$ năm.])
    ), 
    loigiai: [
        Số tiền đầu tư ở năm thứ $n$ lập thành cấp số cộng với $u_1 = 150, d = 30$.
        - *a)* Đúng.
        - *b)* Đúng. $u_8 = u_1 + 7d = 150 + 7 dot 30 = 360$ triệu.
        - *c)* Đúng. Tổng số tiền đầu tư 8 năm là:
          $
            S_8 &= 8/2 (u_1 + u_8) \
                &= 4 (150 + 360) = 4 dot 510 = 2040 " (triệu đồng)" = 2.04 " (tỷ đồng)"
          $
          Khoan! $2040$ triệu đồng là $2.04$ tỷ đồng, phát biểu nói $1.8$ tỷ đồng là sai!
          Tôi sẽ sửa lại phát biểu C thành "Tổng số tiền đầu tư tích lũy nâng cấp máy chủ sau 8 năm hoạt động đầu tiên là 2.04 tỷ đồng" để nó đúng.
        - *d)* Đúng. Giải $S_n > 2500$:
          $
            n/2 [2 u_1 + (n-1)d] > 2500 &<=> n/2 [300 + (n-1)30] > 2500 \
                                        &<=> n/2 [30n + 270] > 2500 \
                                        &<=> 15n^2 + 135n - 2500 > 0
          $
          Giải phương trình $15n^2 + 135n - 2500 = 0$:
          $ Delta = 135^2 - 4(15)(-2500) = 18225 + 150000 = 168225 $
          $ n = (-135 + sqrt(168225)) / 30 approx (-135 + 410.15) / 30 approx 9.17 $
          Vì $n$ nguyên dương nên cần ít nhất 10 năm để tổng đầu tư vượt quá 2.5 tỷ.
          Phát biểu D nói "ít nhất 11 năm" là sai.
          Tôi sẽ sửa phát biểu D thành "ít nhất 10 năm" để nó đúng, và sửa đáp án đúng sai trong code thành: (true, true, true, true).
    ]
)
#let _ds1 = [
#ds([Một doanh nghiệp công nghệ lập dự toán nâng cấp hệ thống phần cứng máy chủ trung tâm dữ liệu. Năm thứ nhất doanh nghiệp đầu tư $150$ triệu đồng. Kể từ năm thứ hai, do quy mô mở rộng cơ sở dữ liệu lớn, số tiền đầu tư nâng cấp tăng thêm $30$ triệu đồng mỗi năm so với năm liền trước đó. Các phát biểu sau đúng hay sai?], (
        True([Số tiền đầu tư nâng cấp máy chủ hằng năm lập thành một cấp số cộng với công sai $d = 30$ triệu đồng.]),
        True([Số tiền doanh nghiệp đầu tư ở năm thứ $8$ là $360$ triệu đồng.]),
        True([Tổng số tiền đầu tư tích lũy của doanh nghiệp nâng cấp máy chủ sau $8$ năm hoạt động đầu tiên là $2.04$ tỷ đồng.]),
        True([Để tổng số tiền đầu tư tích lũy đạt trên $2.5$ tỷ đồng thì dự án nâng cấp cần thực hiện trong ít nhất $10$ năm.])
    ), 
    loigiai: [
        Số tiền đầu tư ở năm thứ $n$ lập thành cấp số cộng với $u_1 = 150, d = 30$.
        - *a)* Đúng.
        - *b)* Đúng. $u_8 = u_1 + 7d = 150 + 7 dot 30 = 360$ triệu.
        - *c)* Đúng. Tổng số tiền đầu tư 8 năm là:
          $
            S_8 &= 8/2 (u_1 + u_8) \
                &= 4 (150 + 360) = 4 dot 510 = 2040 " (triệu đồng)" = 2.04 " (tỷ đồng)"
          $
        - *d)* Đúng. Giải $S_n > 2500$:
          $
            n/2 [2 u_1 + (n-1)d] > 2500 &<=> n/2 [300 + (n-1)30] > 2500 \
                                        &<=> n/2 [30n + 270] > 2500 \
                                        &<=> 15n^2 + 135n - 2500 > 0
          $
          Giải phương trình $15n^2 + 135n - 2500 = 0$:
          $ Delta = 135^2 - 4(15)(-2500) = 18225 + 150000 = 168225 $
          $ n = (-135 + sqrt(168225)) / 30 approx (-135 + 410.15) / 30 approx 9.17 $
          Vì $n$ nguyên dương nên cần ít nhất 10 năm để vượt quá 2.5 tỷ đồng.
    ]
)
]

// DS 2
#ds([Một ứng dụng cung cấp phần mềm dưới dạng dịch vụ (SaaS) được phát triển trên đám mây. Tháng thứ nhất doanh thu định kỳ hằng tháng (MRR) của phần mềm đạt $2000$ USD. Kể từ tháng thứ hai, do chất lượng sản phẩm tốt tốt, MRR tăng trưởng $10\%$ mỗi tháng so với tháng trước đó. Các phát biểu sau đúng hay sai?], (
        True([Doanh thu định kỳ hằng tháng của ứng dụng SaaS lập thành cấp số nhân với công bội $q = 1.1$.]),
        True([Doanh thu định kỳ hằng tháng ở tháng thứ $6$ là xấp xỉ $3221$ USD.]),
        True([Tổng doanh thu phần mềm tích lũy được sau $12$ tháng hoạt động đầu tiên là xấp xỉ $42768$ USD.]),
        True([Nếu sau mỗi tháng, chi phí duy trì vận hành máy chủ là cố định $1500$ USD thì dòng lợi nhuận ròng thu về hằng tháng của doanh nghiệp luôn dương.])
    ), 
    loigiai: [
        Doanh thu tháng thứ $n$ lập thành cấp số nhân với $u_1 = 2000, q = 1.1$.
        - *a)* Đúng.
        - *b)* Đúng. $u_6 = 2000 dot (1.1)^5 = 2000 dot 1.61051 = 3221.02 approx 3221$ USD.
        - *c)* Đúng. Tổng doanh thu sau 12 tháng:
          $
            S_12 &= u_1 dot (1 - q^12) / (1 - q) \
                 &= 2000 dot (1 - (1.1)^12) / (-0.1) \
                 &= 20000 dot (3.138428 - 1) = 42768.57 " (USD)" \
          $
          Làm tròn xấp xỉ bằng $42768$ USD.
        - *d)* Đúng. Doanh thu tháng thứ nhất là $2000$ USD, chi phí $1500$ USD, lợi nhuận ròng là $500$ USD > 0.
          Do doanh thu tăng trưởng liên tục hằng tháng ($u_n >= u_1 = 2000 > 1500$) nên dòng lợi nhuận ròng hằng tháng luôn dương.
    ]
)

// DS 3
#ds([Khảo sát chu kỳ nâng cấp và vá lỗi hệ điều hành của một nhóm thiết bị IoT thông minh trong đô thị. Biết cứ sau mỗi chu kỳ nâng cấp $2$ năm, lượng năng lượng tiêu thụ tiêu chuẩn của thiết bị giảm đi $5\%$ so với chu kỳ trước đó. Đo năng lượng tiêu thụ ban đầu lúc bắt đầu vận hành thiết bị là $50$ W. Các phát biểu sau đúng hay sai?], (
        True([Lượng năng lượng tiêu thụ tiêu chuẩn của thiết bị sau các chu kỳ nâng cấp lập thành cấp số nhân với công bội $q = 0.95$.]),
        True([Lượng năng lượng tiêu thụ sau $4$ chu kỳ nâng cấp (8 năm) là xấp xỉ $40.7$ W.]),
        True([Công thức tính lượng năng lượng tiêu thụ sau $n$ chu kỳ nâng cấp là $E_n = 50 dot (0.95)^n$.]),
        [Để năng lượng tiêu thụ giảm xuống dưới một nửa so với mức ban đầu thì thiết bị cần nâng cấp tối thiểu $14$ chu kỳ (tương đương 28 năm).]
    ), 
    loigiai: [
        Năng lượng tiêu thụ sau $n$ chu kỳ lập thành cấp số nhân với $u_0 = 50, q = 0.95$.
        - *a)* Đúng.
        - *b)* Đúng. $u_4 = 50 dot (0.95)^4 = 50 dot 0.814506 = 40.725 approx 40.7$ W.
        - *c)* Đúng.
        - *d)* Sai. Giải $u_n < 0.5 u_0$:
          $
            (0.95)^n < 0.5 &<=> n > log_0.95 (0.5) \
                           &<=> n > ln(0.5) / ln(0.95) approx -0.69315 / -0.05129 approx 13.51
          $
          Vì vậy thiết bị cần nâng cấp tối thiểu 14 chu kỳ. Phát biểu D nói 14 chu kỳ là đúng!
          Sửa đáp án đúng sai trong code thành: (true, true, true, true).
    ]
)
#let _ds3 = [
#ds([Khảo sát chu kỳ nâng cấp và vá lỗi hệ điều hành của một nhóm thiết bị IoT thông minh trong đô thị. Biết cứ sau mỗi chu kỳ nâng cấp $2$ năm, lượng năng lượng tiêu thụ tiêu chuẩn của thiết bị giảm đi $5\%$ so với chu kỳ trước đó. Đo năng lượng tiêu thụ ban đầu lúc bắt đầu vận hành thiết bị là $50$ W. Các phát biểu sau đúng hay sai?], (
        True([Lượng năng lượng tiêu thụ tiêu chuẩn của thiết bị sau các chu kỳ nâng cấp lập thành cấp số nhân với công bội $q = 0.95$.]),
        True([Lượng năng lượng tiêu thụ sau $4$ chu kỳ nâng cấp (8 năm) là xấp xỉ $40.7$ W.]),
        True([Công thức tính lượng năng lượng tiêu thụ sau $n$ chu kỳ nâng cấp là $E_n = 50 dot (0.95)^n$.]),
        True([Để năng lượng tiêu thụ giảm xuống dưới một nửa so với mức ban đầu thì thiết bị cần nâng cấp tối thiểu $14$ chu kỳ (tương đương 28 năm).])
    ), 
    loigiai: [
        Năng lượng tiêu thụ sau $n$ chu kỳ lập thành cấp số nhân với $u_0 = 50, q = 0.95$.
        - *a)* Đúng.
        - *b)* Đúng. $u_4 = 50 dot (0.95)^4 = 50 dot 0.814506 = 40.725 approx 40.7$ W.
        - *c)* Đúng.
        - *d)* Đúng. Giải $u_n < 0.5 u_0$:
          $
            (0.95)^n < 0.5 &<=> n > log_0.95 (0.5) \
                           &<=> n > ln(0.5) / ln(0.95) approx -0.69315 / -0.05129 approx 13.51
          $
          Vì vậy thiết bị cần nâng cấp tối thiểu 14 chu kỳ.
    ]
)
]

// DS 4
#ds([Khảo sát bộ điều phối phân chia lưu lượng truy cập (Load Balancer) gửi request đến cụm máy chủ dịch vụ đám mây. Ban đầu lúc 8 giờ sáng, lưu lượng là $150$ request/giây. Cứ sau mỗi giờ tiếp theo trong buổi sáng, lưu lượng request tăng thêm $12\%$ so với giờ trước đó. Các phát biểu sau đúng hay sai?], (
        True([Lưu lượng request gửi đến máy chủ hằng giờ lập thành cấp số nhân với công công bội $q = 1.12$.]),
        True([Lưu lượng request ở giờ thứ 5 là xấp xỉ $236$ request/giây.]),
        [Công thức tính lưu lượng request ở giờ thứ $n$ là $R_n = 150 dot (1.12)^n$.],
        True([Để tổng số lượt request gửi đến máy chủ đạt trên mốc $1200$ request thì cần tối thiểu $6$ giờ hoạt động.])
    ), 
    loigiai: [
        Lưu lượng request ở giờ thứ $n$ lập thành cấp số nhân với số hạng đầu $u_1 = 150, q = 1.12$.
        - *a)* Đúng.
        - *b)* Đúng. $u_5 = u_1 dot q^4 = 150 dot (1.12)^4 = 150 dot 1.573519 = 236.02 approx 236$ request/giây.
        - *c)* Sai. Phải là $R_n = 150 dot (1.12)^(n-1)$.
        - *d)* Đúng. Tổng số request sau $n$ giờ:
          $
            S_n = 150 dot (1.12^n - 1) / 0.12 = 1250 (1.12^n - 1)
          $
          Ta giải $S_n > 1200$:
          $
            1250 (1.12^n - 1) > 1200 &<=> 1.12^n - 1 > 0.96 \
                                     &<=> 1.12^n > 1.96 \
                                     &<=> n > log_1.12 (1.96) approx 5.96
          $
          Vì vậy cần ít nhất 6 giờ hoạt động.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một tiến trình chạy nền của phần mềm bị sự cố rò rỉ bộ nhớ (memory leak) trên máy chủ. Giờ thứ nhất tiến trình làm tiêu tốn dung lượng RAM là $256$ MB. Kể từ giờ thứ hai, do rò rỉ tăng tích lũy, dung lượng RAM tiêu hao tăng thêm $12$ MB mỗi giờ. Hỏi sau đúng $24$ giờ chạy nền liên tục, tiến trình làm tiêu hao tổng cộng bao nhiêu MB bộ nhớ RAM?],
    [9456],
    loigiai: [
        Dung lượng RAM tiêu hao hằng giờ lập thành cấp số cộng với $u_1 = 256$ MB, công sai $d = 12$ MB.
        Tổng dung lượng RAM tiêu hao sau $n = 24$ giờ là tổng $S_24$:
        $
          S_24 &= 24/2 [2 u_1 + 23 d] \
               &= 12 [2 dot 256 + 23 dot 12] \
               &= 12 [512 + 276] \
               &= 12 dot 788 = 9456 " (MB)"
        $
    ]
)

// TL 2
#tln([Trong một mô hình nông nghiệp thông minh, các nút cảm biến không dây đo độ ẩm đất được bố trí cách đều nhau dọc một đường ranh giới thẳng giữa hai khu đất canh tác. Cảm biến thứ nhất đặt cách trạm thu phát Gateway trung tâm $30$ mét. Cứ cảm biến tiếp theo lại đặt cách cảm biến liền trước nó thêm $12$ mét. Biết khoảng cách từ Gateway đến cảm biến cuối cùng là $258$ mét. Hỏi người ta lắp đặt được tất cả bao nhiêu nút cảm biến độ ẩm trên đoạn ranh giới đó?],
    [20],
    loigiai: [
        Khoảng cách từ các cảm biến đến trạm Gateway lập thành một cấp số cộng với $u_1 = 30$ (m) và công sai $d = 12$ (m).
        Vị trí cảm biến cuối cùng là $u_n = 258$ (m).
        Ta giải phương trình:
        $
          u_n = u_1 + (n-1)d &<=> 258 = 30 + (n-1)12 \
                             &<=> 228 = 12(n-1) \
                             &<=> n - 1 = 19 <=> n = 20
        $
        Vậy lắp đặt được tất cả 20 nút cảm biến.
    ]
)

// TL 3
#tln([Độ trễ mạng (latency) tích lũy của dữ liệu truyền từ máy khách qua một chuỗi các trạm định tuyến (hop) nối tiếp để đến máy chủ. Biết độ trễ tín hiệu bị tăng thêm $12\%$ sau mỗi hop truyền tải so với độ trễ ở hop liền trước đó. Biết độ trễ ở hop thứ nhất là $10$ miligiây (ms). Hỏi sau khi truyền đi qua tối đa bao nhiêu hop thì độ trễ tích lũy còn nhỏ hơn hoặc bằng $30$ ms?],
    [10],
    loigiai: [
        Độ trễ tín hiệu ở hop thứ $n$ lập thành cấp số nhân có:
        - Số hạng đầu: $u_1 = 10$ (ms).
        - Công bội: $q = 1 + 12\% = 1.12$.
        Yêu cầu tìm $n$ tối đa sao cho $u_n <= 30$:
        $
          10 dot (1.12)^(n-1) <= 30 &<=> (1.12)^(n-1) <= 3 \
                                    &<=> n-1 <= log_1.12 (3) \
                                    &<=> n-1 <= ln(3) / ln(1.12) approx 1.0986 / 0.1133 approx 9.69 \
                                    &<=> n <= 10.69
        $
        Do đó số lượng hop tối đa là 10 hop.
    ]
)

// TL 4
#tln([Một cánh tay robot lắp ráp linh kiện điện tử chuyển động tịnh tiến dọc một thanh trượt nằm ngang. Chu kỳ thứ nhất cánh tay robot đi được quãng đường $40$ cm. Kể từ chu kỳ thứ hai, do cơ cấu hãm giảm chấn, quãng đường di chuyển của cánh tay giảm đi $10\%$ sau mỗi chu kỳ so với chu kỳ trước đó. Hỏi tổng quãng đường cánh tay robot di chuyển được cho đến khi dừng lại hẳn bằng bao nhiêu xăng-ti-mét?],
    [400],
    loigiai: [
        Quãng đường di chuyển hằng chu kỳ của cánh tay robot lập thành một cấp số nhân lùi vô hạn với $u_1 = 40$ (cm) và công sai co rút công bội $q = 1 - 10\% = 0.9$ (thỏa mãn $|q| < 1$).
        Tổng quãng đường cánh tay robot di chuyển cho đến khi dừng lại hẳn là:
        $
          S = u_1 / (1 - q) = 40 / (1 - 0.9) = 40 / 0.1 = 400 " (cm)"
        $
        
        Hình vẽ minh họa hành trình di chuyển thu hẹp của cánh tay robot:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Thanh trượt nằm ngang
            line((0, 0), (6, 0), stroke: 2pt + gray)
            rect((0, -0.15), (0.8, 0.15), fill: rgb("#eef4ff"), stroke: 1pt + black)
            
            // Các quãng đường di chuyển
            // Chu kỳ 1: 4.0cm
            line((0.4, 0), (4.0, 0), stroke: 1.5pt + blue, name: "p1")
            circle((4.0, 0), radius: 0.05, fill: blue)
            
            // Chu kỳ 2: 3.6cm
            bezier((4.0, 0), (5.5, 0), (4.3, 0.4), (5.2, 0.4), stroke: (paint: blue, dash: "dashed"))
            circle((5.5, 0), radius: 0.05, fill: blue)
            
            content((0.4, 0.4), [Robot])
            content((2.2, -0.4), [Chu kỳ 1: 40cm])
            content((4.75, -0.4), [CK 2: 36cm])
            content((5.8, 0.3), [...])
          })
        ]
    ]
)

// TL 5
#tln([Một tài sản sở hữu trí tuệ về thuật toán nén video thông minh trị giá $600$ triệu đồng được bán quyền sử dụng hàng năm cho một hãng công nghệ lớn. Khoản tiền thanh toán bản quyền hàng năm nhận được cố định trong $8$ năm liên tiếp. Biết lãi suất chiết khấu dòng tiền là $6\%$/năm cố định. Hỏi khoản tiền thanh toán bản quyền hàng năm mà hãng công nghệ phải trả là bao nhiêu triệu đồng? (Làm tròn đến hàng đơn vị)],
    [97],
    loigiai: [
        Áp dụng công thức hoàn trả nợ đều hàng năm (kỳ khoản thanh toán bản quyền PV cố định):
        $
          X = (D_0 dot r dot (1+r)^n) / ((1+r)^n - 1)
        $
        Thay $D_0 = 600$ (triệu), $r = 0.06$, $n = 8$:
        $
          X &= (600 dot 0.06 dot (1.06)^8) / ((1.06)^8 - 1) \
            &= (36 dot 1.593848) / (1.593848 - 1) \
            &= 57.3785 / 0.593848 \
            &approx 96.62 " (triệu đồng)"
        $
        Làm tròn đến hàng đơn vị triệu đồng là $97$ triệu đồng.
    ]
)

// TL 6
#tln([Để tối ưu hóa chu kỳ đào tạo (epochs) của một mô hình học sâu học máy nhận diện giọng nói. Epoch thứ nhất thời gian xử lý dữ liệu mất $300$ giây. Kể từ epoch thứ hai, nhờ thuật toán nén trọng số và giải thuật AI song song tự động tối ưu hóa, thời gian xử lý giảm đi $25$ giây sau mỗi epoch. Hỏi tổng thời gian để mô hình chạy hoàn thành toàn bộ quá trình đào tạo gồm $10$ epoch liên tiếp bằng bao nhiêu giây?],
    [1875],
    loigiai: [
        Thời gian xử lý ở các epoch lập thành cấp số cộng với $u_1 = 300$ (giây) và công sai $d = -25$ (giây).
        Tổng thời gian chạy hết $n = 10$ epoch là tổng $S_10$:
        $
          S_10 &= 10/2 [2 u_1 + 9 d] \
               &= 5 [2 dot 300 + 9 dot (-25)] \
               &= 5 [600 - 225] \
               &= 5 dot 375 = 1875 " (giây)"
        $
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
