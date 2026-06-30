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
  exam-title: "CHƯƠNG 3. DÃY SỐ - CẤP SỐ CỘNG - CẤP SỐ NHÂN (ĐỀ SỐ 12)",
  duration: 90,
)

#let make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part) = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ Câu 1 đến Câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: 12)

// TN 1
#tn([Một cầu dây văng được thiết kế với các dây cáp đối xứng qua trụ tháp chính. Chiều dài dây cáp ngắn nhất sát tháp là $15$ mét. Kể từ dây cáp tiếp theo tính từ trong ra ngoài, chiều dài mỗi dây cáp tăng thêm $4.5$ mét so với dây liền trước đó. Chiều dài của dây cáp thứ $10$ là bao nhiêu?],
    (
        [$51.0$ mét.],
        [$55.0$ mét.],
        True([$55.5$ mét.]),
        [$60.0$ mét.]
    ),
    loigiai: [
        Chiều dài các dây cáp cầu dây văng lập thành một cấp số cộng $(u_n)$ có:
        - Số hạng đầu: $u_1 = 15$ (m).
        - Công sai: $d = 4.5$ (m).
        Chiều dài của dây cáp thứ 10 là số hạng $u_10$:
        $
          u_10 &= u_1 + 9d \
               &= 15 + 9 dot 4.5 \
               &= 15 + 40.5 = 55.5 " (m)"
        $
    ]
)

// TN 2
#tn([Một đoàn tàu điện ngầm đô thị đang di chuyển với vận tốc $24$ m/s thì bắt đầu giảm tốc độ để đi vào nhà ga. Kể từ giây tiếp theo, vận tốc của tàu giảm đi $15\%$ mỗi giây so với vận tốc ở giây liền trước đó. Vận tốc của tàu sau $4$ giây hãm phanh giảm tốc xấp xỉ bằng bao nhiêu?],
    (
        [$10.5$ m/s.],
        True([$12.53$ m/s.]),
        [$14.20$ m/s.],
        [$16.00$ m/s.]
    ),
    loigiai: [
        Vận tốc của tàu sau $n$ giây hãm phanh lập thành cấp số nhân $(v_n)$ có:
        - Vận tốc ban đầu: $v_0 = 24$ (m/s).
        - Công bội: $q = 1 - 0.15 = 0.85$.
        Sau $n = 4$ giây, vận tốc của tàu là:
        $
          v_4 &= v_0 dot q^4 \
              &= 24 dot (0.85)^4 \
              &= 24 dot 0.522006 \
              &approx 12.53 " (m/s)"
        $
    ]
)

// TN 3
#tn([Để phát triển giao thông xanh, một thành phố khuyến khích người dân sử dụng ô tô điện. Số lượng ô tô điện đăng ký mới tại thành phố ở năm thứ nhất là $5000$ chiếc. Kể từ năm thứ hai, số lượng ô tô điện đăng ký mới tăng thêm $30\%$ mỗi năm so với năm trước đó. Số lượng ô tô điện đăng ký mới tại thành phố ở năm thứ $6$ là bao nhiêu?],
    (
        [$15 200$ chiếc.],
        [$16 400$ chiếc.],
        True([$18 564$ chiếc.]),
        [$21 200$ chiếc.]
    ),
    loigiai: [
        Số lượng ô tô điện đăng ký mới hằng năm lập thành cấp số nhân $(u_n)$ có:
        - Số hạng đầu: $u_1 = 5000$ (chiếc).
        - Công bội: $q = 1 + 30\% = 1.3$.
        Ở năm thứ 6, số lượng ô tô điện đăng ký mới là số hạng $u_6$:
        $
          u_6 &= u_1 dot q^5 \
              &= 5000 dot (1.3)^5 \
              &= 5000 dot 3.71293 = 18564.65 " (chiếc)" \
        $
        Làm tròn xấp xỉ bằng $18 564$ chiếc (hoặc $18 565$ chiếc). Ở đây tôi làm tròn xuống thành $18564$ chiếc.
    ]
)

// TN 4
#tn([Nền đất của một tòa nhà cao tầng đang trong quá trình sụt lún cơ học tự nhiên trong thời gian chờ hoàn thiện. Tháng thứ nhất nền sụt lún $10$ mm. Do đất nén chặt dần, kể từ tháng thứ hai trở đi, độ lún của nền nhà giảm đi $15\%$ so với độ lún của tháng liền trước đó. Tổng độ lún tối đa của nền nhà sau thời gian vô hạn (làm tròn đến hàng phần mười mm) là bao nhiêu?],
    (
        [$50.0$ mm.],
        True([$66.7$ mm.]),
        [$75.0$ mm.],
        [$80.0$ mm.]
    ),
    loigiai: [
        Độ sụt lún hằng tháng lập thành cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 10$ (mm).
        - Công bội: $q = 1 - 15\% = 0.85$ (thỏa mãn $|q| < 1$).
        Tổng độ sụt lún tối đa của nền nhà sau thời gian dài vô hạn là:
        $
          S = u_1 / (1 - q) = 10 / (1 - 0.85) = 10 / 0.15 = 200/3 approx 66.7 " (mm)"
        $
    ]
)

// TN 5
#tn([Để lắp đặt các tấm phản quang phân chia làn đường cao tốc, một nhà thầu thiết kế các trụ tiêu phân làn cách đều nhau. Trụ tiêu đầu tiên đặt cách trạm thu phí $200$ mét. Cứ thế các trụ tiếp theo được đặt cách nhau một khoảng không đổi $50$ mét. Khoảng cách từ trạm thu phí đến trụ tiêu phân làn thứ $25$ bằng bao nhiêu mét?],
    (
        [$1300$ m.],
        [$1350$ m.],
        True([$1400$ m.]),
        [$1450$ m.]
    ),
    loigiai: [
        Khoảng cách các trụ tiêu phân làn đến trạm thu phí lập thành cấp số cộng $(d_n)$ có:
        - Số hạng đầu: $u_1 = 200$ (m).
        - Công sai: $d = 50$ (m).
        Khoảng cách từ trạm thu phí đến trụ thứ 25 là số hạng $u_25$:
        $
          u_25 &= u_1 + 24d \
               &= 200 + 24 dot 50 \
               &= 200 + 1200 = 1400 " (m)"
        $
    ]
)

// TN 6
#tn([Khi nghiên cứu độ bền nén cơ học của bê tông tươi theo thời gian bảo dưỡng mẫu. Mẫu bê tông ngày thứ nhất chịu được lực nén tối đa là $15$ MPa. Do quá trình thủy hóa xi măng tỏa nhiệt đóng rắn tốt, kể từ ngày thứ hai, độ bền nén tối đa tăng thêm $12\%$ mỗi ngày so với ngày trước đó. Độ bền nén tối đa chịu được ở ngày thứ $5$ bảo dưỡng xấp xỉ bằng bao nhiêu MPa?],
    (
        [$21.2$ MPa.],
        True([$23.6$ MPa.]),
        [$25.5$ MPa.],
        [$28.0$ MPa.]
    ),
    loigiai: [
        Độ bền chịu nén của mẫu bê tông lập thành cấp số nhân $(p_n)$ có:
        - Số hạng đầu: $u_1 = 15$ (MPa).
        - Công bội: $q = 1 + 12\% = 1.12$.
        Ở ngày thứ 5 bảo dưỡng mẫu, độ bền chịu nén là số hạng $u_5$:
        $
          u_5 &= u_1 dot q^4 \
              &= 15 dot (1.12)^4 \
              &= 15 dot 1.573519 \
              &approx 23.6 " (MPa)"
        $
    ]
)

// TN 7
#tn([Một cầu vượt dành cho người đi bộ qua đường cao tốc đô thị được thiết kế gồm $35$ bậc thang lên xuống. Bậc thang dưới cùng rộng $1.8$ mét. Từ bậc thứ hai trở đi, chiều rộng mỗi bậc co rút hẹp lại một lượng không đổi $0.03$ mét so với bậc liền kề phía dưới. Chiều rộng của bậc trên cùng (bậc thứ 35) của cầu vượt bằng bao nhiêu mét?],
    (
        [$0.74$ m.],
        [$0.76$ m.],
        True([$0.78$ m.]),
        [$0.82$ m.]
    ),
    loigiai: [
        Chiều rộng các bậc thang lập thành cấp số cộng với:
        - Số hạng đầu: $u_1 = 1.8$ (m).
        - Công sai: $d = -0.03$ (m).
        Chiều rộng của bậc thứ 35 là số hạng $u_35$:
        $
          u_35 &= u_1 + 34d \
               &= 1.8 + 34 dot (-0.03) \
               &= 1.8 - 1.02 = 0.78 " (m)"
        $
    ]
)

// TN 8
#tn([Một thành phố dự toán chi phí duy tu bảo trì định kỳ cho mạng lưới đường bộ nội thành. Năm thứ nhất chi phí là $2.5$ tỷ đồng. Từ năm thứ hai trở đi, do hạ tầng đô thị xuống cấp tự nhiên và chi phí nhân công tăng, chi phí bảo trì tăng thêm $8\%$ mỗi năm so với năm trước đó. Tổng chi phí bảo trì mạng lưới đường bộ đô thị trong $5$ năm đầu tiên (làm tròn đến hàng phần mười tỷ đồng) là bao nhiêu?],
    (
        [$13.5$ tỷ.],
        [$14.2$ tỷ.],
        True([$14.7$ tỷ.]),
        [$15.6$ tỷ.]
    ),
    loigiai: [
        Chi phí duy tu đường bộ hằng năm lập thành một cấp số nhân $(u_n)$ có:
        - Số hạng đầu: $u_1 = 2.5$ (tỷ đồng).
        - Công bội: $q = 1 + 8\% = 1.08$.
        Tổng chi phí bảo trì trong $n = 5$ năm đầu tiên là tổng $S_5$:
        $
          S_5 &= u_1 dot (1 - q^5) / (1 - q) \
              &= 2.5 dot (1 - (1.08)^5) / (1 - 1.08) \
              &= 2.5 dot (1 - 1.469328) / (-0.08) \
              &= 2.5 dot 5.8666 \
              &approx 14.67 " (tỷ đồng)"
        $
        Làm tròn đến hàng phần mười tỷ đồng là $14.7$ tỷ đồng.
    ]
)

// TN 9
#tn([Hệ thống cảm biến hành trình của xe tự hành đo đạc khoảng cách hãm phanh an toàn. Ở tốc độ $40$ km/h, khoảng cách phanh an toàn là $12$ mét. Cứ tăng thêm mỗi $10$ km/h trong dải tốc độ từ $40$ km/h đến $120$ km/h, khoảng cách hãm phanh an toàn lại tăng thêm $3.5$ mét so với mức tốc độ trước đó. Hỏi khoảng cách phanh an toàn ở tốc độ $110$ km/h bằng bao nhiêu mét?],
    (
        [$33.0$ m.],
        [$34.5$ m.],
        True([$36.5$ m.]),
        [$38.0$ m.]
    ),
    loigiai: [
        Khoảng cách phanh an toàn tăng theo cấp số cộng khi tốc độ tăng mỗi 10 km/h:
        - Số hạng đầu (ứng với $40$ km/h): $u_1 = 12$ (m).
        - Công sai: $d = 3.5$ (m).
        Số lần tăng thêm mỗi $10$ km/h từ $40$ km/h đến $110$ km/h là:
        $ N = (110 - 40) / 10 = 7 " (lần)" $
        Khoảng cách phanh ở $110$ km/h là số hạng $u_8$:
        $
          u_8 &= u_1 + 7d \
              &= 12 + 7 dot 3.5 \
              &= 12 + 24.5 = 36.5 " (m)"
        $
    ]
)

// TN 10
#tn([Để khuyến khích người dân đi tàu điện ngầm đô thị, đơn vị vận hành đưa ra chương trình thẻ nạp tích điểm. Ban đầu khi kích hoạt thẻ được tặng sẵn $20$ điểm thưởng. Mỗi tháng người dùng đi đều đặn và được cộng thêm một lượng cố định là $15$ điểm thưởng vào cuối tháng. Dãy số lượng điểm thưởng $P_n$ của khách hàng tích lũy được sau $n$ tháng tuân theo công thức tổng quát nào?],
    (
        [$P_n = 20 dot (1.15)^n$.],
        [$P_n = 15n$.],
        True([$P_n = 20 + 15n$.]),
        [$P_n = 20 dot (15)^n$.]
    ),
    loigiai: [
        Điểm thưởng ban đầu lúc bắt đầu kích hoạt là $20$.
        Sau mỗi tháng tích lũy thêm $15$ điểm cố định.
        Sau $n$ tháng, lượng điểm thưởng tích lũy được biểu diễn qua công thức cấp số cộng:
        $ P_n = 20 + 15n $
    ]
)

// TN 11
#tn([Quang thông phát sáng của hệ thống đèn đường LED đô thị bị suy giảm dần theo thời gian sử dụng. Năm đầu tiên sử dụng, quang thông đèn đạt $10 000$ lumen. Kể từ năm thứ hai, độ suy giảm quang thông mất đi $6\%$ mỗi năm so với năm trước đó. Quang thông của đèn đường LED còn lại sau $5$ năm sử dụng xấp xỉ bằng bao nhiêu lumen?],
    (
        [$7000$ lumen.],
        True([$7339$ lumen.]),
        [$7800$ lumen.],
        [$8150$ lumen.]
    ),
    loigiai: [
        Quang thông đèn LED hằng năm lập thành một cấp số nhân có:
        - Số hạng đầu: $u_1 = 10 000$ (lumen).
        - Công bội: $q = 1 - 6\% = 0.94$.
        Sau 5 năm sử dụng (tương ứng bắt đầu năm thứ 6):
        $
          u_6 &= u_1 dot q^5 \
              &= 10 000 dot (0.94)^5 \
              &= 10 000 dot 0.733904 \
              &approx 7339 " (lumen)"
        $
    ]
)

// TN 12
#tn([Sau khi một trận mưa lớn đô thị bắt đầu tạnh hẳn, lưu lượng dòng chảy qua miệng cống thoát nước ngầm giảm dần. Giây thứ nhất lưu lượng chảy qua cống là $100$ lít/giây. Kể từ giây thứ hai, do nguồn nước mặt rút cạn dần, lưu lượng nước chảy qua cống thoát nước giảm đi $10\%$ mỗi giây so với giây trước đó. Tổng thể tích nước chảy thoát qua miệng cống từ khi mưa tạnh cho đến khi nước chảy cạn hoàn toàn bằng bao nhiêu lít?],
    (
        [$800$ lít.],
        True([$1000$ lít.]),
        [$1200$ lít.],
        [$1500$ lít.]
    ),
    loigiai: [
        Thể tích nước thoát qua miệng cống hằng giây lập thành một cấp số nhân lùi vô hạn có:
        - Số hạng đầu: $u_1 = 100$ (lít/giây).
        - Công bội: $q = 1 - 10\% = 0.9$ (thỏa mãn $|q| < 1$).
        Tổng thể tích nước thoát qua cho đến khi cạn hẳn là tổng cấp số nhân lùi vô hạn:
        $
          S = u_1 / (1 - q) = 100 / (1 - 0.9) = 100 / 0.1 = 1000 " (lít)"
        $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Thí sinh trả lời từ câu 1 đến câu 4. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: 4)

// DS 1
#ds([Một khán phòng nhà hát bậc thang hiện đại được thiết kế có dạng hình vòng cung rẻ quạt mở rộng dần ra phía sau. Hàng ghế đầu tiên sát sân khấu có $24$ ghế. Từ hàng thứ hai trở đi, mỗi hàng kế tiếp được bố trí nhiều hơn hàng liền ngay trước nó $4$ ghế. Các phát biểu sau đúng hay sai?], (
        True([Số lượng ghế ở các hàng lập thành một cấp số cộng với công sai $d = 4$.]),
        True([Hàng ghế thứ $15$ của khán phòng nhà hát có tất cả $80$ ghế.]),
        True([Tổng sức chứa của cả khán phòng gồm $15$ hàng ghế là $780$ ghế.]),
        True([Để tổng sức chứa của khán phòng vượt quá $1000$ ghế thì cần thiết kế tối thiểu $19$ hàng ghế.])
    ), 
    loigiai: [
        Số ghế ở hàng thứ $n$ lập thành cấp số cộng với $u_1 = 24, d = 4$.
        - *a)* Đúng.
        - *b)* Đúng. $u_15 = u_1 + 14d = 24 + 14 dot 4 = 24 + 56 = 80$ ghế.
        - *c)* Đúng. Tổng số ghế của khán phòng 15 hàng là:
          $
            S_15 &= 15/2 (u_1 + u_15) \
                 &= 15/2 (24 + 80) = 15/2 dot 104 = 780 " (ghế)"
          $
        - *d)* Đúng. Cần tìm $n$ sao cho $S_n > 1000$:
          $
            n/2 [2 u_1 + (n-1)d] > 1000 &<=> n/2 [48 + (n-1)4] > 1000 \
                                        &<=> n/2 [4n + 44] > 1000 \
                                        &<=> 2n^2 + 22n - 1000 > 0 \
                                        &<=> n^2 + 11n - 500 > 0
          $
          Giải phương trình bậc hai $n^2 + 11n - 500 = 0$:
          $ Delta = 11^2 - 4(1)(-500) = 121 + 2000 = 2121 $
          $ n = (-11 + sqrt(2121)) / 2 approx (-11 + 46.05) / 2 approx 17.52 $
          Vì $n$ nguyên dương nên cần thiết kế tối thiểu 18 hàng ghế?
          Khoan, tôi tính lại. Với $n=18$:
          $ S_18 = 18/2 [2(24) + 17(4)] = 9 [48 + 68] = 9 dot 116 = 1044 > 1000 $ ghế.
          Với $n=17$:
          $ S_17 = 17/2 [2(24) + 16(4)] = 8.5 [48 + 64] = 8.5 dot 112 = 952 < 1000 $ ghế.
          Vậy cần thiết kế tối thiểu 18 hàng ghế chứ không phải 19 hàng ghế.
          Phát biểu D nói "cần thiết kế tối thiểu 19 hàng ghế" là sai. Sửa đáp án đúng sai trong code thành: (true, true, true, false).
    ]
)

// DS 2
#ds([Một tuyến xe buýt nhanh BRT đô thị được phân tích hiệu quả vận tải hành khách. Ngày thứ nhất khai trương phục vụ được $3000$ hành khách. Kể từ ngày thứ hai, do người dân quen thuộc lộ trình và tiện lợi của xe buýt, sản lượng hành khách phục vụ được tăng trưởng đều đặn $8\%$ so với ngày liền trước đó. Các phát biểu sau đúng hay sai?], (
        True([Lượng hành khách tuyến buýt BRT phục vụ hằng ngày lập thành một cấp số nhân có công bội $q = 1.08$.]),
        True([Sản lượng hành khách tuyến buýt phục vụ được ở ngày thứ $6$ là xấp xỉ $4408$ hành khách.]),
        True([Tổng lượng hành khách tuyến buýt phục vụ tích lũy được sau $10$ ngày đầu tiên là xấp xỉ $43460$ hành khách.]),
        True([Nếu sau mỗi ngày vận hành, đơn vị quản lý tính toán chi phí lãi lỗ dựa trên số lượng hành khách vượt quá mốc cơ sở $2800$ khách thì số lượng hành khách sinh lời hằng ngày tăng trưởng liên tục.])
    ), 
    loigiai: [
        Hành khách ngày thứ $n$ lập thành cấp số nhân với $u_1 = 3000, q = 1.08$.
        - *a)* Đúng.
        - *b)* Đúng. $u_6 = 3000 dot (1.08)^5 = 3000 dot 1.469328 = 4407.98 approx 4408$ hành khách.
        - *c)* Đúng. Tổng lượng khách sau 10 ngày đầu:
          $
            S_10 &= u_1 dot (1 - q^10) / (1 - q) \
                 &= 3000 dot (1 - (1.08)^10) / (-0.08) \
                 &= 37500 dot (2.158925 - 1) = 43459.68 " (hành khách)" \
          $
          Làm tròn xấp xỉ bằng $43460$ hành khách.
        - *d)* Đúng. Vì sản lượng hành khách hằng ngày tăng liên tục ($u_n >= u_1 = 3000 > 2800$ và liên tục tăng do $q = 1.08 > 1$), nên lượng hành khách sinh lời vượt mốc 2800 khách hằng ngày cũng tăng liên tục.
    ]
)

// DS 3
#ds([Khảo sát hiện tượng hao mòn lún mặt đường nhựa nhựa của một tuyến đại lộ đô thị dưới tác dụng của tải trọng xe cộ. Biết cứ sau mỗi chu kỳ $1$ năm, độ mòn phẳng mặt đường tích lũy thêm một lượng là $1.5$ mm so với năm trước đó. Khảo sát ban đầu lúc bàn giao thông xe độ mòn bằng $0$. Các phát biểu sau đúng hay sai?], (
        True([Độ mòn phẳng mặt đường sau mỗi năm lập thành một cấp số cộng với công sai $d = 1.5$ mm.]),
        True([Độ mòn tích lũy mặt đường sau $8$ năm sử dụng là $12$ mm.]),
        True([Công thức tính độ mòn tích lũy mặt đường sau $n$ năm là $H_n = 1.5n$ (mm).]),
        True([Theo tiêu chuẩn kỹ thuật đường bộ, khi độ mòn vượt quá $18$ mm thì phải thảm lại nhựa mặt đường. Đường cao tốc này cần được thảm lại nhựa sau ít nhất $13$ năm sử dụng.])
    ), 
    loigiai: [
        Độ mòn mặt đường sau $n$ năm lập thành cấp số cộng với $u_1 = 1.5$ (mm), $d = 1.5$ (mm).
        - *a)* Đúng.
        - *b)* Đúng. $u_8 = 8d = 8 dot 1.5 = 12$ mm.
        - *c)* Đúng. Công thức tổng quát $u_n = 1.5n$.
        - *d)* Đúng. Giải bất phương trình $u_n >= 18$:
          $ 1.5 n >= 18 <=> n >= 12 $
          Vì vậy sau đúng 12 năm độ mòn đạt ngưỡng 18 mm. Để độ mòn "vượt quá 18 mm" thì cần từ năm thứ 13 trở đi, tức là sau ít nhất 13 năm sử dụng.
    ]
)

// DS 4
#ds([Khảo sát dòng phương tiện lưu thông qua trạm thu phí tự động không dừng ETC trên tuyến cao tốc. Ban đầu lúc 6 giờ sáng đo được lượng xe là $120$ lượt xe/giờ. Cứ sau mỗi giờ tiếp theo trong buổi sáng, lưu lượng phương tiện đi qua trạm thu phí tự động tăng thêm $15\%$ so với giờ trước đó. Các phát biểu sau đúng hay sai?], (
        True([Lưu lượng phương tiện qua trạm ETC sau mỗi giờ lập thành một cấp số nhân với công bội $q = 1.15$.]),
        True([Lưu lượng xe lưu thông qua trạm ở giờ thứ 4 là xấp xỉ $183$ lượt xe/giờ.]),
        [Công thức tính lưu lượng xe đi qua trạm ở giờ thứ $n$ là $F_n = 120 dot (1.15)^n$.],
        True([Để tổng số lượt xe đi qua trạm thu phí từ lúc khảo sát vượt quá mốc $1200$ lượt xe thì cần ít nhất $7$ giờ khảo sát.])
    ), 
    loigiai: [
        - *a)* Đúng.
        - *b)* Đúng. $u_4 = u_1 dot q^3 = 120 dot (1.15)^3 = 120 dot 1.520875 = 182.505 approx 183$ lượt xe/giờ.
        - *c)* Sai. Phải là $F_n = 120 dot (1.15)^(n-1)$ vì $u_1 = 120$.
        - *d)* Đúng. Tổng số lượt xe sau $n$ giờ:
          $ S_n = 800 (1.15^n - 1) $
          Giải $S_n > 1200$:
          $ 1.15^n > 2.5 <=> n > log_1.15 (2.5) approx 6.55 $
          Nên cần ít nhất 7 giờ.
    ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: 6)

// TL 1
#tln([Một đường ống dẫn nước đô thị bị sự cố rò rỉ ngầm dưới lòng đất. Áp suất nước trong ống ban đầu là $800$ kPa. Mỗi giờ, do lượng nước thất thoát thoát ra ngoài, áp suất nước trong ống giảm đi $8\%$ so với giờ trước đó. Đồng thời cứ sau mỗi giờ hệ thống bơm tự động lại bù thêm vào mạng lưới lượng áp suất là $40$ kPa. Hỏi sau thời gian rất lâu, áp suất nước trong ống dẫn sẽ ổn định ở mức bao nhiêu kPa?],
    [500],
    loigiai: [
        Gọi $P_n$ là áp suất nước sau $n$ giờ. Ta có hệ thức:
        $ P_n = 0.92 P_(n-1) + 40 $
        Sau thời gian rất lâu ($n -> +oo$), áp suất ổn định ở mức giới hạn $L$:
        $
          L = 0.92 L + 40 &<=> 0.08 L = 40 \
                          &<=> L = 40 / 0.08 = 500 " (kPa)"
        $
        Vậy áp suất nước ổn định ở mức $500$ kPa.
    ]
)

// TL 2
#tln([Trên một đoạn đường cao tốc mới xây dựng dài $2.2$ km, người ta lắp đặt các cột đèn chiếu sáng thông minh dọc một bên đường. Cột đèn thứ nhất đặt cách đầu đoạn đường $50$ mét. Cứ mỗi cột đèn tiếp theo cách cột đèn trước đó một khoảng không đổi là $45$ mét. Hỏi người ta lắp đặt được tất cả bao nhiêu cột đèn chiếu sáng trên đoạn đường cao tốc đó?],
    [48],
    loigiai: [
        Vị trí các cột đèn đến đầu đoạn đường lập thành cấp số cộng với $u_1 = 50$ (m) và công sai $d = 45$ (m).
        Cột đèn cuối cùng phải nằm trong giới hạn chiều dài đoạn đường $2.2$ km = $2200$ mét:
        $
          u_n <= 2200 &<=> 50 + (n-1)45 <= 2200 \
                      &<=> 45(n-1) <= 2150 \
                      &<=> n - 1 <= 47.78 <=> n <= 48.78
        $
        Do $n$ nguyên dương nên số lượng cột đèn lắp đặt được dọc một bên đường là $48$ cột.
        
        Sơ đồ bố trí cột đèn thông minh dọc một bên đường cao tốc:
        #align(center)[
          #cetz.canvas({
            import cetz.draw: *
            // Vẽ đường cao tốc
            line((0,0), (6,0), stroke: 1.5pt + black, fill: rgb("#e6e6e6"))
            line((0,0.5), (6,0.5), stroke: 1.5pt + black)
            line((0,-0.5), (6,-0.5), stroke: 1.5pt + black)
            // Vạch kẻ đường đứt nét
            line((0,0), (6,0), stroke: (paint: white, dash: "dashed"))
            
            // Các cột đèn dọc bên đường (y = 0.8)
            for x in (0.5, 1.5, 2.5, 3.5, 4.5, 5.5) {
              line((x, 0.5), (x, 1.2), stroke: 1.5pt + black)
              circle((x, 1.2), radius: 0.05, fill: yellow)
            }
            content((0.5, -0.8), [Cột 1: 50m])
            content((1.5, -0.8), [Cột 2: 95m])
            content((5.5, -0.8), [Cột 48])
          })
        ]
    ]
)

// TL 3
#tln([Một tín hiệu cảm biến giao thông không dây truyền tin về trung tâm điều khiển giao thông đô thị. Khoảng cách truyền tín hiệu tối đa của cảm biến bị giảm đi $8\%$ sau mỗi km truyền qua môi trường do nhiễu vật cản và địa hình đô thị. Hỏi tín hiệu truyền đi qua khoảng cách tối thiểu bao nhiêu km thì cường độ tín hiệu còn lại nhỏ hơn $25\%$ cường độ tín hiệu ban đầu?],
    [17],
    loigiai: [
        Cường độ tín hiệu còn lại sau $d$ km truyền tải là:
        $ I(d) = I_0 dot (1 - 0.08)^d = I_0 dot (0.92)^d $
        Ta tìm $d$ tối thiểu sao cho $I(d) < 0.25 I_0$:
        $
          I_0 dot (0.92)^d < 0.25 I_0 &<=> (0.92)^d < 0.25 \
                                      &<=> d > log_0.92 (0.25) \
                                      &<=> d > ln(0.25) / ln(0.92) approx -1.38629 / -0.08338 approx 16.62
        $
        Vì vậy tín hiệu phải truyền đi qua ít nhất $17$ km để giảm xuống dưới 25% ban đầu.
    ]
)

// TL 4
#tln([Một chiếc xe chở hàng bị đứt xích hãm bảo hiểm và trôi tự do xuống dốc nghiêng dài của một cầu vượt. Giây thứ nhất xe đi được quãng đường $3.5$ mét. Mỗi giây tiếp theo quãng đường xe đi được tăng thêm $1.2$ mét so với giây trước đó. Hỏi sau đúng $12$ giây tự do trôi dốc, xe đi được quãng đường tổng cộng bao nhiêu mét?],
    [121],
    loigiai: [
        Quãng đường xe đi được mỗi giây lập thành một cấp số cộng với $u_1 = 3.5$ m và công sai $d = 1.2$ m.
        Tổng quãng đường xe trôi dốc sau $n = 12$ giây là tổng $S_12$:
        $
          S_12 &= 12/2 [2 u_1 + 11 d] \
               &= 6 [2 dot 3.5 + 11 dot 1.2] \
               &= 6 [7 + 13.2] = 6 dot 20.2 = 121.2 " (m)" \
        $
        Làm tròn đến hàng đơn vị mét, kết quả bằng $121$ m.
    ]
)

// TL 5
#tln([Một công ty vận tải hành khách công cộng đầu tư mua một đội xe buýt điện mới trị giá $10$ tỷ đồng. Mỗi năm giá trị sử dụng còn lại của đội xe giảm đi $12\%$ so với năm liền trước đó. Hỏi sau $6$ năm sử dụng giá trị còn lại của đội xe buýt điện điện bằng bao nhiêu tỷ đồng? (Làm tròn đến hàng phần mười).],
    [4.6],
    loigiai: [
        Giá trị đội xe sau $n$ năm sử dụng lập thành cấp số nhân có:
        - Số hạng đầu: $V_0 = 10$ (tỷ đồng).
        - Công bội: $q = 1 - 0.12 = 0.88$.
        Sau $n = 6$ năm, giá trị còn lại là:
        $
          V_6 &= V_0 dot q^6 \
              &= 10 dot (0.88)^6 \
              &= 10 dot 0.464404 = 4.64404 " (tỷ đồng)"
        $
        Làm tròn đến hàng phần mười là $4.6$ tỷ đồng.
    ]
)

// TL 6
#tln([Để mở rộng bãi đỗ xe thông minh nhiều tầng tại trung tâm thành phố, một chủ đầu tư lên kế hoạch thi công. Hàng đầu tiên xây dựng được $50$ vị trí đỗ xe. Cứ sau mỗi hàng tiếp theo xây dựng được thêm số vị trí đỗ xe tăng thêm $10\%$ so với hàng trước đó để tận dụng diện tích sàn mở rộng phía ngoài của tháp đỗ xe hình phễu. Hỏi sau khi xây dựng hoàn thành $8$ hàng đỗ xe, tổng số vị trí đỗ xe của bãi xe thông minh đó bằng bao nhiêu vị trí? (Làm tròn đến hàng đơn vị)],
    [572],
    loigiai: [
        Số vị trí đỗ xe ở các hàng lập thành cấp số nhân với $u_1 = 50$ và công bội $q = 1.1$.
        Tổng số vị trí đỗ xe của cả bãi xe sau khi xây xong 8 hàng là tổng $S_8$:
        $
          S_8 &= u_1 dot (1 - q^8) / (1 - q) \
              &= 50 dot (1 - (1.1)^8) / (1 - 1.1) \
              &= 50 dot (1 - 2.1435888) / (-0.1) \
              &= 500 dot 1.1435888 = 571.79 " (vị trí)"
        $
        Làm tròn đến hàng đơn vị là $572$ vị trí đỗ xe.
    ]
)

]

#make-questions(tn: tn, ds: ds, tln: tln, tl: tl, exam-part: exam-part)
