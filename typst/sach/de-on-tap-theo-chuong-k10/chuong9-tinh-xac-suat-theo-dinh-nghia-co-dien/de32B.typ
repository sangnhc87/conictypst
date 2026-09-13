#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG IX: TÍNH XÁC SUẤT THEO ĐỊNH NGHĨA CỔ ĐIỂN",
  exam-title: "ÔN TẬP CUỐI CHƯƠNG IX: TÍNH XÁC SUẤT CỔ ĐIỂN (ĐỀ SỐ 32B - THỰC TIỄN & MÔ HÌNH HÓA)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "195",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (Tường lửa an ninh mạng 3 lớp có CeTZ)
#tn([Một hệ thống máy chủ dữ liệu được bảo vệ bởi $3$ lớp tường lửa độc lập $L_1, L_2, L_3$. Xác suất để một cuộc tấn công mạng vượt qua được các lớp tường lửa lần lượt là $0.05$; $0.08$ và $0.10$. Cuộc tấn công chỉ xâm nhập được vào máy chủ nếu vượt qua được cả ba lớp tường lửa liên tiếp. Xác suất để hệ thống an ninh ngăn chặn thành công cuộc tấn công bằng],
    (
        True([$0.9996$]),
        [$0.0004$],
        [$0.7700$],
        [$0.9960$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: cuộc tấn công xâm nhập thành công (tức vượt qua cả 3 lớp tường lửa).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          for i in range(3) {
            rect((i * 1.8, 0), (i * 1.8 + 0.4, 1.2), fill: rgb("ccfbf1"), stroke: 1pt + teal)
            content((i * 1.8 + 0.2, 0.6), text(size: 8pt, [L#str(i + 1)]))
            line((i * 1.8 + 0.4, 0.6), (i * 1.8 + 1.8, 0.6), mark: (end: "stealth"), stroke: 0.8pt + gray)
          }
          rect((5.4, 0), (6.6, 1.2), fill: rgb("e2e8f0"), stroke: 1pt + black)
          content((6.0, 0.6), [Máy chủ])
        })
        ]
        - Xác suất mã độc vượt qua cả 3 lớp tường lửa:
          $ P(overline(A)) = (0.05) times (0.08) times (0.10) = 0.0004 $
        - Xác suất hệ thống tường lửa bảo vệ an toàn máy chủ:
          $ P(A) = 1 - 0.0004 = 0.9996 $
    ]
)

// TN 2 (Lắp ráp xe hơi hai bộ phận độc lập)
#tn([Một dây chuyền sản xuất lắp ráp ô tô gồm hai bộ phận chính được chế tạo độc lập. Xác suất bộ phận 1 đạt tiêu chuẩn chất lượng cao là $0.98$ và của bộ phận 2 là $0.95$. Một chiếc xe xuất xưởng đạt tiêu chuẩn chất lượng cao khi cả hai bộ phận cùng đạt chuẩn. Xác suất để một chiếc xe lắp ráp đạt tiêu chuẩn chất lượng cao bằng],
    (
        True([$0.931$]),
        [$0.965$],
        [$0.069$],
        [$0.930$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng quy tắc nhân xác suất cho hai biến cố độc lập.
        $ P = (0.98) times (0.95) = 0.931 $
    ]
)

// TN 3 (Bốc thăm trúng thưởng du lịch)
#tn([Một công ty có $50$ nhân viên (trong đó có $30$ nữ và $20$ nam). Ban giám đốc bốc thăm ngẫu nhiên $3$ nhân viên để trao chuyến du lịch Châu Âu. Xác suất để trong $3$ người trúng thưởng có đúng $2$ nữ và $1$ nam bằng],
    (
        True([$87 / 196$]),
        [$1 / 2$],
        [$43 / 98$],
        [$29 / 98$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số tổ hợp chập 3 của 50 người. Biến cố thuận lợi là chọn 2 nữ (từ 30 nữ) và 1 nam (từ 20 nam).
        - Không gian mẫu:
          $ |Omega| = C_50^3 = (50 times 49 times 48) / 6 = 19600 $
        - Số kết quả thuận lợi:
          $ |A| = C_30^2 times C_20^1 = ((30 times 29) / 2) times 20 = 435 times 20 = 8700 $
        - Xác suất:
          $ P(A) = 8700 / 19600 = 87 / 196 $
    ]
)

// TN 4 (Băng chuyền hành lý có CeTZ)
#tn([Băng chuyền hành lý tại sân bay có $10$ kiện hành lý, trong đó có đúng $2$ kiện chứa hàng dễ vỡ. Nhân viên bốc dỡ ngẫu nhiên đồng thời $4$ kiện hành lý xuống xe đẩy. Xác suất để có ít nhất một kiện hành lý chứa hàng dễ vỡ trong $4$ kiện được lấy ra bằng],
    (
        True([$2 / 3$]),
        [$1 / 3$],
        [$7 / 15$],
        [$8 / 15$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: không có kiện hành lý dễ vỡ nào trong 4 kiện được lấy ra (cả 4 kiện đều là hàng thường).
        #align(center)[
        #cetz.canvas({
          import cetz.draw: *
          rect((0, 0), (6, 0.9), stroke: 1.2pt + gray, fill: rgb("f1f5f9"))
          for i in range(10) {
            let fill_c = if i < 2 { rgb("fee2e2") } else { rgb("ccfbf1") }
            rect((0.2 + i * 0.58, 0.15), (0.68 + i * 0.58, 0.75), fill: fill_c, stroke: 0.8pt + black)
          }
          content((3.0, -0.3), [2 Kiện dễ vỡ (Đỏ) và 8 Kiện thường (Teal)])
        })
        ]
        - Không gian mẫu: $|Omega| = C_10^4 = (10 times 9 times 8 times 7) / 24 = 210$.
        - Số cách chọn 4 kiện hàng thường (từ 8 kiện thường):
          $ |overline(A)| = C_8^4 = (8 times 7 times 6 times 5) / 24 = 70 $
        - Xác suất biến cố đối:
          $ P(overline(A)) = 70 / 210 = 1 / 3 $
        - Xác suất có ít nhất một kiện dễ vỡ:
          $ P(A) = 1 - 1 / 3 = 2 / 3 $
    ]
)

// TN 5 (Bảo hiểm rủi ro tín dụng)
#tn([Một ngân hàng thẩm định $3$ hồ sơ vay vốn hoàn toàn độc lập. Xác suất phát sinh nợ xấu của mỗi hồ sơ lần lượt là $0.02$; $0.03$ và $0.04$. Xác suất để cả ba hồ sơ vay vốn đều không phát sinh nợ xấu xấp xỉ bằng],
    (
        True([$0.9126$]),
        [$0.9000$],
        [$0.0874$],
        [$0.9214$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác suất không nợ xấu của từng hồ sơ lần lượt là $0.98$; $0.97$ và $0.96$. Áp dụng quy tắc nhân cho các biến cố độc lập:
        $ P = (0.98) times (0.97) times (0.96) = 0.912576 approx 0.9126 $
    ]
)

// TN 6 (Đội cấp cứu y tế lưu động)
#tn([Một bệnh viện có $8$ bác sĩ và $12$ điều dưỡng. Giám đốc bệnh viện chọn ngẫu nhiên $4$ nhân viên y tế để thành lập đội cấp cứu lưu động. Xác suất để đội cấp cứu có cả bác sĩ và điều dưỡng bằng],
    (
        True([$856 / 969$]),
        [$113 / 969$],
        [$4 / 5$],
        [$9 / 10$]
    ),
    loigiai: [
        *Phương pháp giải:* Sử dụng phương pháp biến cố đối: đội cấp cứu chỉ toàn bác sĩ hoặc chỉ toàn điều dưỡng.
        - Không gian mẫu: $|Omega| = C_20^4 = (20 times 19 times 18 times 17) / 24 = 4845$.
        - Số cách chọn đội toàn bác sĩ: $C_8^4 = 70$.
        - Số cách chọn đội toàn điều dưỡng: $C_12^4 = 495$.
        - Số cách chọn đội có cả bác sĩ và điều dưỡng:
          $ |A| = 4845 - (70 + 495) = 4845 - 565 = 4280 $
        - Xác suất:
          $ P(A) = 4280 / 4845 = 856 / 969 $
    ]
)

// TN 7 (Mã khóa vali 3 vòng xoay)
#tn([Một chiếc vali có khóa mã số gồm $3$ vòng xoay độc lập, mỗi vòng xoay gồm các chữ số từ $0$ đến $9$. Một người không biết mã số đã thử bấm ngẫu nhiên một bộ mã $3$ chữ số. Xác suất để người đó mở được vali ngay trong lần thử đầu tiên bằng],
    (
        True([$1 / 1000$]),
        [$1 / 720$],
        [$1 / 500$],
        [$1 / 100$]
    ),
    loigiai: [
        *Phương pháp giải:* Mỗi vòng xoay có 10 khả năng. Không gian mẫu có $10^3 = 1000$ mã số khác nhau.
        - Xác suất mở đúng ngay lần đầu:
          $ P = 1 / 1000 = 0.001 $
    ]
)

// TN 8 (Kênh truyền 4 bit có 1 bit lỗi)
#tn([Khi truyền một khung dữ liệu gồm $4$ bit qua kênh truyền cáp quang, xác suất để mỗi bit truyền đi bị lỗi độc lập là $p = 0.02$. Xác suất để trong $4$ bit truyền đi có đúng $1$ bit bị lỗi xấp xỉ bằng],
    (
        True([$0.0753$]),
        [$0.0800$],
        [$0.0200$],
        [$0.0196$]
    ),
    loigiai: [
        *Phương pháp giải:* Áp dụng công thức phân bố nhị thức Bernoulli với $n = 4, k = 1, p = 0.02$:
        $ P(X = 1) = C_4^1 (0.02)^1 (1 - 0.02)^(4 - 1) = 4 times (0.02) times (0.98)^3 $
        Ta có $(0.98)^3 = 0.941192$.
        $ P(X = 1) = 0.08 times 0.941192 = 0.07529536 approx 0.0753 $
    ]
)

// TN 9 (Phòng khách sạn hai người kề nhau)
#tn([Bốn người bạn (trong đó có An và Bình) thuê $4$ phòng đơn kề nhau trên cùng một dãy hành lang khách sạn. Quản lý khách sạn xếp ngẫu nhiên $4$ phòng cho $4$ người. Xác suất để An và Bình được xếp ở hai phòng kề nhau bằng],
    (
        True([$1 / 2$]),
        [$1 / 3$],
        [$2 / 3$],
        [$1 / 4$]
    ),
    loigiai: [
        *Phương pháp giải:* Không gian mẫu là số cách xếp 4 người vào 4 phòng: $4! = 24$. Coi An và Bình là một khối kề nhau.
        - Buộc An và Bình thành 1 khối: có $2! = 2$ cách đổi chỗ.
        - Xếp khối này cùng 2 bạn còn lại (3 phần tử): có $3! = 6$ cách.
        - Số kết quả thuận lợi: $|A| = 2 times 6 = 12$.
        - Xác suất:
          $ P = 12 / 24 = 1 / 2 $
    ]
)

// TN 10 (Thời khóa biểu môn Toán)
#tn([Xếp ngẫu nhiên $5$ tiết học khác nhau (Toán, Ngữ văn, Tiếng Anh, Vật lí, Hóa học) vào $5$ tiết trong một buổi sáng. Xác suất để môn Toán được xếp vào tiết $1$ hoặc tiết $2$ bằng],
    (
        True([$2 / 5$]),
        [$1 / 5$],
        [$3 / 5$],
        [$1 / 2$]
    ),
    loigiai: [
        *Phương pháp giải:* Môn Toán có 2 sự lựa chọn vị trí (tiết 1 hoặc tiết 2) trong tổng số 5 vị trí tiết học của buổi sáng.
        $ P = 2 / 5 $
    ]
)

// TN 11 (Xét nghiệm mẫu gộp âm tính)
#tn([Trong một đợt sàng lọc y tế, người ta thực hiện xét nghiệm gộp mẫu của $5$ người độc lập. Xác suất nhiễm bệnh của mỗi người là $0.01$. Xét nghiệm mẫu gộp cho kết quả âm tính nếu cả $5$ người trong nhóm đều không nhiễm bệnh. Xác suất để xét nghiệm mẫu gộp cho kết quả âm tính xấp xỉ bằng],
    (
        True([$0.9510$]),
        [$0.9900$],
        [$0.9500$],
        [$0.0490$]
    ),
    loigiai: [
        *Phương pháp giải:* Xác suất một người không nhiễm bệnh là $1 - 0.01 = 0.99$. Xác suất cả 5 người độc lập cùng không nhiễm bệnh:
        $ P = (0.99)^5 approx 0.95099 approx 0.9510 $
    ]
)

// TN 12 (Xác suất trùng ngày sinh 2 người)
#tn([Chọn ngẫu nhiên $2$ người độc lập. Giả sử năm sinh có $365$ ngày và khả năng sinh vào các ngày là như nhau. Xác suất để hai người có cùng ngày sinh nhật trong năm bằng],
    (
        True([$1 / 365$]),
        [$1 / 730$],
        [$2 / 365$],
        [$1 / 133225$]
    ),
    loigiai: [
        *Phương pháp giải:* Người thứ nhất sinh vào một ngày bất kỳ trong năm. Xác suất để người thứ hai sinh đúng vào ngày đó là $1 / 365$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phân tích bốc thăm du lịch)
#ds([Một công ty có $50$ nhân viên (gồm $30$ nữ và $20$ nam). Ban giám đốc bốc thăm chọn ngẫu nhiên $3$ người đi du lịch.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số cách chọn $3$ nhân viên bất kỳ từ $50$ người bằng $19600$.]),
    True([Số cách chọn $3$ nhân viên toàn là nữ bằng $4060$.]),
    True([Số cách chọn $3$ nhân viên có đúng $2$ nữ và $1$ nam bằng $8700$.]),
    [Xác suất để trong $3$ người trúng thưởng có ít nhất một nam nhỏ hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Các trường hợp chọn])
    - Không gian mẫu: $C_50^3 = 19600$. Mệnh đề a ĐÚNG.
    - Toàn nữ: $C_30^3 = 4060$. Mệnh đề b ĐÚNG.
    - 2 nữ 1 nam: $C_30^2 times C_20^1 = 435 times 20 = 8700$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Có ít nhất một nam])
    Xác suất toàn nữ: $4060 / 19600 = 29 / 140 approx 0.2071$.
    Xác suất ít nhất 1 nam: $1 - 29 / 140 = 111 / 140 approx 0.7929 > 0.50$.
    Khẳng định nhỏ hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Băng chuyền hành lý)
#ds([Xét $10$ kiện hành lý (trong đó có $2$ kiện hàng dễ vỡ). Lấy ngẫu nhiên $4$ kiện hành lý.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $210$.]),
    True([Số cách lấy $4$ kiện hành lý không có kiện nào dễ vỡ bằng $70$.]),
    True([Xác suất để lấy được ít nhất một kiện hành lý dễ vỡ bằng $2 / 3$.]),
    [Xác suất để lấy được cả hai kiện hành lý dễ vỡ bằng $1 / 5$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đếm hành lý])
    - Không gian mẫu: $C_10^4 = 210$. Mệnh đề a ĐÚNG.
    - Toàn hàng thường: $C_8^4 = 70$. Mệnh đề b ĐÚNG.
    - Ít nhất 1 kiện dễ vỡ: $1 - 70 / 210 = 2 / 3$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Cả 2 kiện dễ vỡ])
    Lấy 2 kiện dễ vỡ và 2 kiện thường: $C_2^2 times C_8^2 = 1 times 28 = 28$.
    Xác suất: $28 / 210 = 2 / 15 != 1 / 5$. Mệnh đề d SAI.
  ]
)

// DS 3 (Đội cấp cứu lưu động)
#ds([Xét bệnh viện có $8$ bác sĩ và $12$ điều dưỡng. Chọn ngẫu nhiên $4$ nhân viên y tế vào đội cấp cứu.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số phần tử của không gian mẫu bằng $4845$.]),
    True([Số cách chọn đội cấp cứu toàn là bác sĩ bằng $70$.]),
    True([Xác suất để đội cấp cứu có cả bác sĩ và điều dưỡng bằng $856 / 969$.]),
    [Xác suất để đội cấp cứu có nhiều bác sĩ hơn điều dưỡng lớn hơn $0.50$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Đội cấp cứu])
    - Không gian mẫu: $C_20^4 = 4845$. Mệnh đề a ĐÚNG.
    - Toàn bác sĩ: $C_8^4 = 70$. Mệnh đề b ĐÚNG.
    - Có cả hai: $(4845 - 565) / 4845 = 856 / 969$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Bác sĩ nhiều hơn điều dưỡng])
    Gồm: 4 bác sĩ ($70$ cách) hoặc 3 bác sĩ 1 điều dưỡng ($C_8^3 times C_12^1 = 56 times 12 = 672$ cách).
    Tổng: $70 + 672 = 742$. Xác suất: $742 / 4845 approx 0.1531 < 0.50$.
    Khẳng định lớn hơn $0.50$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tường lửa 3 lớp)
#ds([Xét hệ thống tường lửa $3$ lớp độc lập có xác suất lọt mã độc lần lượt là $p_1 = 0.05$; $p_2 = 0.08$; $p_3 = 0.10$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Xác suất mã độc vượt qua cả ba lớp tường lửa bằng $0.0004$.]),
    True([Xác suất hệ thống tường lửa ngăn chặn thành công mã độc bằng $0.9996$.]),
    True([Xác suất mã độc bị chặn lại ngay ở lớp tường lửa thứ nhất bằng $0.95$.]),
    [Xác suất mã độc vượt qua được lớp 1 nhưng bị chặn lại ở lớp 2 bằng $0.05$.]
  ),
  loigiai: [
    #step([Xét ý a, b, c: Tường lửa])
    - Vượt qua cả 3 lớp: $(0.05)(0.08)(0.10) = 0.0004$. Mệnh đề a ĐÚNG.
    - Ngăn chặn thành công: $1 - 0.0004 = 0.9996$. Mệnh đề b ĐÚNG.
    - Chặn ngay lớp 1: $1 - 0.05 = 0.95$. Mệnh đề c ĐÚNG.

    #step([Xét ý d: Qua lớp 1 và bị chặn ở lớp 2])
    Xác suất: $0.05 times (1 - 0.08) = 0.05 times 0.92 = 0.046 != 0.05$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1
#tln([Hệ thống $3$ lớp tường lửa độc lập có xác suất lọt mã độc là $0.05$; $0.08$; $0.10$. Tính xác suất hệ thống ngăn chặn thành công mã độc.],
    [0.9996],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - (0.05)(0.08)(0.10) = 0.9996 $
    ]
)

// TLN 2
#tln([Lấy $4$ kiện hành lý từ $10$ kiện (có $2$ kiện dễ vỡ). Tính xác suất lấy được ít nhất một kiện dễ vỡ (dưới dạng phân số tối giản).],
    [2/3],
    loigiai: [
        #step([Biến cố đối])
        $ 1 - C_8^4 / C_10^4 = 1 - 70 / 210 = 2 / 3 $
    ]
)

// TLN 3
#tln([Một công ty có $30$ nữ và $20$ nam. Bốc thăm chọn $3$ người. Tính xác suất chọn được đúng $2$ nữ và $1$ nam (dưới dạng phân số tối giản).],
    [87/196],
    loigiai: [
        #step([Tính xác suất])
        $ (C_30^2 times C_20^1) / C_50^3 = 8700 / 19600 = 87 / 196 $
    ]
)

// TLN 4
#tln([Bốn người thuê $4$ phòng kề nhau trên một dãy hành lang. Tính xác suất để An và Bình ở hai phòng kề nhau (dưới dạng phân số tối giản).],
    [1/2],
    loigiai: [
        #step([Tính xác suất])
        $ 12 / 24 = 1 / 2 $
    ]
)

// TLN 5
#tln([Xếp ngẫu nhiên $5$ tiết học khác nhau vào $5$ tiết buổi sáng. Tính xác suất môn Toán rơi vào tiết $1$ hoặc tiết $2$ (dưới dạng phân số tối giản).],
    [2/5],
    loigiai: [
        #step([Tính xác suất])
        $ 2 / 5 $
    ]
)

// TLN 6
#tln([Một khóa vali có $3$ vòng xoay chữ số. Tính xác suất bấm trúng mã ngay trong lần thử đầu tiên.],
    [0.001],
    loigiai: [
        #step([Tính xác suất])
        $ 1 / 1000 = 0.001 $
    ]
)

] // end make-questions

#make-questions()
