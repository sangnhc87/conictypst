#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

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
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN",
  exam-title: "BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ B: VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "126",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một chuyên gia tài chính theo dõi tỉ suất sinh lời hàng năm của hai mã cổ phiếu $X$ và $Y$ trong $5$ năm gần đây. Cả hai cổ phiếu đều có tỉ suất sinh lời trung bình là $12%$/năm. Độ lệch chuẩn tỉ suất sinh lời của cổ phiếu $X$ là $s_X = 2.5%$ và của cổ phiếu $Y$ là $s_Y = 6.2%$. Kết luận nào sau đây là chuẩn xác nhất trong phân tích đầu tư?],
    (
        True([Đầu tư vào cổ phiếu $X$ ít rủi ro và có tỉ suất sinh lời ổn định hơn cổ phiếu $Y$]),
        [Đầu tư vào cổ phiếu $Y$ ít rủi ro hơn vì độ lệch chuẩn lớn hơn],
        [Mức độ rủi ro của hai cổ phiếu là hoàn toàn tương đương nhau],
        [Cổ phiếu $Y$ luôn mang lại lợi nhuận cao hơn cổ phiếu $X$ trong mọi năm]
    ),
    loigiai: [
        Trong phân tích tài chính, độ lệch chuẩn $s$ phản ánh mức độ biến động (volatility) xung quanh mức sinh lời kỳ vọng, tức là thước đo rủi ro.
        Vì $s_X = 2.5% < s_Y = 6.2%$ nên cổ phiếu $X$ ít biến động hơn, độ rủi ro thấp hơn và lợi nhuận ổn định hơn cổ phiếu $Y$.
    ]
)

// TN 2
#tn([Sản lượng tôm xuất khẩu (tấn/ngày) của một hợp tác xã thủy sản trong $8$ ngày thu hoạch liên tiếp là:
#align(center)[
  $12; quad 14; quad 15; quad 16; quad 18; quad 20; quad 21; quad 26$
]
Khoảng biến thiên $R$ của sản lượng tôm thu hoạch bằng],
    (
        True([$14$ tấn]),
        [$12$ tấn],
        [$15$ tấn],
        [$16$ tấn]
    ),
    loigiai: [
        Sản lượng cao nhất $x_max = 26$ tấn, thấp nhất $x_min = 12$ tấn.
        Khoảng biến thiên:
        $ R = x_max - x_min = 26 - 12 = 14 text(" tấn") $
    ]
)

// TN 3
#tn([Thời gian sạc pin từ $20%$ lên $80%$ (tính bằng phút) của một dòng xe máy điện thông minh được đo trên $9$ xe thử nghiệm:
#align(center)[
  $40; quad 42; quad 43; quad 45; quad 48; quad 50; quad 52; quad 55; quad 62$
]
Khoảng tứ phân vị $Delta_Q$ của thời gian sạc pin bằng],
    (
        True([$11.0$ phút]),
        [$10.5$ phút],
        [$12.0$ phút],
        [$13.5$ phút]
    ),
    loigiai: [
        Mẫu số liệu có $n = 9$, trung vị $Q_2 = x_5 = 48$.
        - Nửa dưới: $40; 42; 43; 45 => Q_1 = (42 + 43)/2 = 42.5$.
        - Nửa trên: $50; 52; 55; 62 => Q_3 = (52 + 55)/2 = 53.5$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 53.5 - 42.5 = 11.0 text(" phút") $
    ]
)

// TN 4
#tn([Một xưởng may thống kê số áo hoàn thành mỗi ngày của một thợ may giỏi trong $5$ ngày làm việc: $18; 20; 20; 22; 25$. Phương sai mẫu $s^2$ của số áo hoàn thành bằng],
    (
        True([$5.6$]),
        [$6.0$],
        [$2.37$],
        [$5.2$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = (18 + 20 + 20 + 22 + 25) / 5 = 105 / 5 = 21$.
        Phương sai:
        $ s^2 = ((18-21)^2 + 2(20-21)^2 + (22-21)^2 + (25-21)^2) / 5 = (9 + 2(1) + 1 + 16) / 5 = 28 / 5 = 5.6 $
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây so sánh thời gian phục vụ một khách hàng (tính bằng giây) tại hai quầy thu ngân $A$ và $B$ của một siêu thị:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (30, 40, 50, 60, 70, 80, 90) {
      let x = (v - 30) * 0.1 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box A: Q1=45, Q2=55, Q3=65, Min=35, Max=75 (y=1.5)
    let xMinA = 0.5 + 0.5
    let xQ1A = 0.5 + 1.5
    let xQ2A = 0.5 + 2.5
    let xQ3A = 0.5 + 3.5
    let xMaxA = 0.5 + 4.5
    rect((xQ1A, 1.2), (xQ3A, 1.8), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    line((xQ2A, 1.2), (xQ2A, 1.8), stroke: 1.8pt + rgb("dc2626"))
    line((xMinA, 1.5), (xQ1A, 1.5), stroke: 1pt + rgb("0d9488"))
    line((xMinA, 1.3), (xMinA, 1.7), stroke: 1.2pt + rgb("0d9488"))
    line((xQ3A, 1.5), (xMaxA, 1.5), stroke: 1pt + rgb("0d9488"))
    line((xMaxA, 1.3), (xMaxA, 1.7), stroke: 1.2pt + rgb("0d9488"))
    content((0.0, 1.5), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[Quầy A])

    // Box B: Q1=40, Q2=55, Q3=75, Min=30, Max=85 (y=0.6)
    let xMinB = 0.5 + 0.0
    let xQ1B = 0.5 + 1.0
    let xQ2B = 0.5 + 2.5
    let xQ3B = 0.5 + 4.5
    let xMaxB = 0.5 + 5.5
    rect((xQ1B, 0.3), (xQ3B, 0.9), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    line((xQ2B, 0.3), (xQ2B, 0.9), stroke: 1.8pt + rgb("dc2626"))
    line((xMinB, 0.6), (xQ1B, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMinB, 0.4), (xMinB, 0.8), stroke: 1.2pt + rgb("d97706"))
    line((xQ3B, 0.6), (xMaxB, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMaxB, 0.4), (xMaxB, 0.8), stroke: 1.2pt + rgb("d97706"))
    content((0.0, 0.6), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[Quầy B])
  })
]
Dựa vào biểu đồ hộp, so sánh khoảng tứ phân vị giữa hai quầy thu ngân:],
    (
        True([Khoảng tứ phân vị của Quầy A là $20$ giây, nhỏ hơn của Quầy B là $35$ giây]),
        [Khoảng tứ phân vị của Quầy A là $30$ giây, lớn hơn của Quầy B là $20$ giây],
        [Hai quầy có khoảng tứ phân vị hoàn toàn bằng nhau],
        [Khoảng tứ phân vị của Quầy A là $40$ giây, của Quầy B là $55$ giây]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - Quầy A: $Q_1(A) = 45, Q_3(A) = 65 => Delta_Q(A) = 65 - 45 = 20$ giây.
        - Quầy B: $Q_1(B) = 40, Q_3(B) = 75 => Delta_Q(B) = 75 - 40 = 35$ giây.
        Vậy $Delta_Q(A) = 20 < Delta_Q(B) = 35$ giây.
    ]
)

// TN 6
#tn([Cho mẫu số liệu điểm kiểm tra có tứ phân vị thứ nhất $Q_1 = 16$ và khoảng tứ phân vị $Delta_Q = 6$. Ngưỡng rào dưới $T_1$ để xác định các giá trị bất thường nhỏ hơn ngưỡng này là],
    (
        True([$T_1 = 7$]),
        [$T_1 = 10$],
        [$T_1 = 9$],
        [$T_1 = 8$]
    ),
    loigiai: [
        Công thức tính ngưỡng rào dưới:
        $ T_1 = Q_1 - 1.5 Delta_Q = 16 - 1.5(6) = 16 - 9 = 7 $
    ]
)

// TN 7
#tn([Đo đường kính (milimét) của các chi tiết máy gia công cơ khí chính xác được phân bố trong bảng tần số sau:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Đường kính*], [$19.8$], [$19.9$], [$20.0$], [$20.1$], [$20.2$],
    [*Số chi tiết*], [$2$], [$5$], [$10$], [$2$], [$1$]
  )
]
Khoảng biến thiên $R$ của đường kính các chi tiết máy bằng],
    (
        True([$0.4" mm"$]),
        [$0.3" mm"$],
        [$0.2" mm"$],
        [$0.5" mm"$]
    ),
    loigiai: [
        Chi tiết có đường kính lớn nhất là $20.2" mm"$, nhỏ nhất là $19.8" mm"$.
        Khoảng biến thiên:
        $ R = 20.2 - 19.8 = 0.4" mm" $
    ]
)

// TN 8
#tn([Nếu tất cả các giá trị của một mẫu số liệu đều được nhân với một hằng số $k = 3$, phương sai của mẫu số liệu mới sẽ],
    (
        True([Tăng lên gấp $9$ lần phương sai cũ]),
        [Tăng lên gấp $3$ lần phương sai cũ],
        [Không thay đổi],
        [Tăng lên gấp $6$ lần phương sai cũ]
    ),
    loigiai: [
        Nếu $y_i = k x_i$ thì độ lệch chuẩn tăng $|k|$ lần: $s_y = |k| s_x$.
        Phương sai tăng $k^2$ lần: $s_y^2 = k^2 s_x^2 = 3^2 s_x^2 = 9 s_x^2$.
    ]
)

// TN 9
#tn([Khảo sát số lượng tin nhắn rác mà $8$ thuê bao di động nhận được trong tuần:
#align(center)[
  $1; quad 2; quad 3; quad 4; quad 5; quad 7; quad 9; quad 17$
]
Khoảng tứ phân vị $Delta_Q$ của số tin nhắn rác bằng],
    (
        True([$5.5$ tin]),
        [$5.0$ tin],
        [$6.0$ tin],
        [$4.5$ tin]
    ),
    loigiai: [
        Mẫu số liệu có $n = 8$ đã sắp xếp tăng dần:
        - Nửa dưới: $1; 2; 3; 4 => Q_1 = (2 + 3)/2 = 2.5$.
        - Nửa trên: $5; 7; 9; 17 => Q_3 = (7 + 9)/2 = 8.0$.
        $Delta_Q = Q_3 - Q_1 = 8.0 - 2.5 = 5.5 text(" tin") $
    ]
)

// TN 10
#tn([Trong sản xuất công nghiệp, một dây chuyền đóng gói sữa hộp tự động có khối lượng ghi trên bao bì là $180" g"$. Khối lượng thực tế đóng gói có độ lệch chuẩn $s = 0.5" g"$. Sau khi bảo dưỡng và hiệu chỉnh cảm biến, độ lệch chuẩn giảm xuống còn $s' = 0.2" g"$. Điều này chứng tỏ],
    (
        True([Dây chuyền sau bảo dưỡng đóng gói chuẩn xác, đồng đều và ít chênh lệch khối lượng hơn]),
        [Dây chuyền sau bảo dưỡng đóng gói trung bình nhiều sữa hơn],
        [Dây chuyền sau bảo dưỡng bị giảm năng suất đóng gói],
        [Khối lượng mỗi hộp sữa sau bảo dưỡng đều giảm đi]
    ),
    loigiai: [
        Độ lệch chuẩn $s$ phản ánh mức độ phân tán sai lệch xung quanh khối lượng chuẩn.
        Độ lệch chuẩn giảm từ $0.5" g"$ xuống $0.2" g"$ chứng tỏ các hộp sữa có khối lượng đồng đều, ổn định và sát với khối lượng chuẩn hơn.
    ]
)

// TN 11
#tn([Cho mẫu số liệu $5$ số: $10; quad 10; quad 10; quad 10; quad 10$. Phương sai $s^2$ của mẫu số liệu này bằng],
    (
        True([$0$]),
        [$10$],
        [$5$],
        [$1$]
    ),
    loigiai: [
        Mọi giá trị đều bằng nhau và bằng số trung bình $overline(x) = 10$.
        Khoảng cách từ mỗi giá trị tới số trung bình bằng $0$, nên phương sai:
        $ s^2 = 1/5 sum_(i=1)^5 (10 - 10)^2 = 0 $
    ]
)

// TN 12
#tn([Cho mẫu số liệu về thời gian phản xạ (mili-giây) của một game thủ chuyên nghiệp: $150; 155; 160; 165; 170$. Độ lệch chuẩn $s$ của mẫu số liệu này bằng],
    (
        True([$5 sqrt(2)" ms" approx 7.07" ms"$]),
        [$50" ms"$],
        [$10" ms"$],
        [$5" ms"$]
    ),
    loigiai: [
        Số trung bình $overline(x) = 160$.
        Độ lệch so với $160$: $-10; -5; 0; 5; 10$.
        Phương sai:
        $ s^2 = (100 + 25 + 0 + 25 + 100) / 5 = 250 / 5 = 50 $
        Độ lệch chuẩn: $s = sqrt(50) = 5 sqrt(2) approx 7.07" ms"$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đầu tư tài chính so sánh 2 quỹ mở)
#ds([Một nhà đầu tư cá nhân phân tích lịch sử tăng trưởng lợi nhuận (%) trong $6$ tháng gần nhất của hai quỹ đầu tư tài chính:
- Quỹ cổ phiếu Alpha: $6.0; quad 8.0; quad 10.0; quad 12.0; quad 14.0; quad 16.0$.
- Quỹ trái phiếu Beta: $10.0; quad 10.5; quad 11.0; quad 11.0; quad 11.5; quad 12.0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai quỹ đầu tư đều có tỉ suất lợi nhuận trung bình trong $6$ tháng bằng nhau và bằng $11.0%$.]),
    True([Khoảng biến thiên lợi nhuận của Quỹ Alpha là $R_A = 10.0%$, lớn hơn gấp $5$ lần so với Quỹ Beta ($R_B = 2.0%$).]),
    True([Phương sai lợi nhuận của Quỹ Alpha bằng $s_A^2 = 35/3 approx 11.67$, lớn hơn nhiều so với Quỹ Beta ($s_B^2 approx 0.42$).]),
    [Quỹ Alpha có mức độ biến động thấp hơn và rủi ro ít hơn so với Quỹ Beta.]
  ),
  loigiai: [
    #step([Tính lợi nhuận trung bình])
    Tổng Alpha: $6 + 8 + 10 + 12 + 14 + 16 = 66 => overline(x)_A = 66 / 6 = 11.0%$.
    Tổng Beta: $10.0 + 10.5 + 11.0 + 11.0 + 11.5 + 12.0 = 66.0 => overline(x)_B = 66.0 / 6 = 11.0%$. Mệnh đề a ĐÚNG.

    #step([Tính khoảng biến thiên])
    $R_A = 16.0 - 6.0 = 10.0%$.
    $R_B = 12.0 - 10.0 = 2.0%$. $R_A = 5 R_B$. Mệnh đề b ĐÚNG.

    #step([Tính phương sai])
    Alpha: Các độ lệch so với $11$: $-5, -3, -1, 1, 3, 5$.
    $s_A^2 = (25 + 9 + 1 + 1 + 9 + 25) / 6 = 70 / 6 = 35/3 approx 11.67$.
    Beta: Các độ lệch: $-1.0, -0.5, 0, 0, 0.5, 1.0$.
    $s_B^2 = (1.0 + 0.25 + 0 + 0 + 0.25 + 1.0) / 6 = 2.5 / 6 approx 0.417$. Mệnh đề c ĐÚNG.

    #step([Đánh giá mức độ rủi ro])
    Quỹ Alpha có phương sai và khoảng biến thiên lớn hơn nhiều so với Quỹ Beta nên Quỹ Alpha rủi ro và biến động mạnh hơn Quỹ Beta. Mệnh đề d SAI.
  ]
)

// DS 2 (Kiểm soát chất lượng bán dẫn)
#ds([Kỹ sư chất lượng đo nồng độ vi hạt bụi (đơn vị: hạt/$"m"^3$) trong phòng sạch chế tạo chip bán dẫn trong $10$ ca sản xuất liên tiếp:
#align(center)[
  $12; quad 14; quad 15; quad 15; quad 16; quad 18; quad 20; quad 22; quad 24; quad 60$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị của mẫu số liệu nồng độ vi hạt là $M_e = 17" hạt/m"^3$.]),
    True([Tứ phân vị thứ nhất và thứ ba lần lượt là $Q_1 = 15" hạt/m"^3$ và $Q_3 = 22" hạt/m"^3$.]),
    True([Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 7" hạt/m"^3$.]),
    [Giá trị $60" hạt/m"^3$ nằm trong giới hạn kiểm soát cho phép, không bị xem là giá trị bất thường.]
  ),
  loigiai: [
    #step([Tính trung vị])
    $n = 10$, hai giá trị chính giữa ở vị trí $5$ và $6$ là $16$ và $18 => M_e = (16 + 18)/2 = 17" hạt/m"^3$. Mệnh đề a ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $5$ số: $12; 14; 15; 15; 16 => Q_1 = 15" hạt/m"^3$.
    Nửa trên gồm $5$ số: $18; 20; 22; 24; 60 => Q_3 = 22" hạt/m"^3$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 22 - 15 = 7" hạt/m"^3$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra giá trị bất thường])
    Ngưỡng rào trên: $Q_3 + 1.5 Delta_Q = 22 + 1.5(7) = 22 + 10.5 = 32.5" hạt/m"^3$.
    Vì $60 > 32.5$ nên giá trị $60" hạt/m"^3$ chắc chắn là giá trị bất thường do sự cố rò rỉ phòng sạch. Mệnh đề d SAI.
  ]
)

// DS 3 (Biến đổi thang đo nhiệt độ Celsius sang Fahrenheit)
#ds([Một mẫu số liệu nhiệt độ đo bằng độ Celsius ($""^circ"C"$) có khoảng biến thiên $R_C = 15^circ"C"$, khoảng tứ phân vị $Delta_Q(C) = 6^circ"C"$, và độ lệch chuẩn $s_C = 4^circ"C"$. Người ta chuyển đổi toàn bộ mẫu sang thang nhiệt độ Fahrenheit ($""^circ"F"$) theo công thức liên hệ: $F_i = 1.8 C_i + 32$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu theo độ Fahrenheit bằng $R_F = 1.8 R_C = 27^circ"F"$.]),
    True([Khoảng tứ phân vị của mẫu số liệu theo độ Fahrenheit bằng $Delta_Q(F) = 1.8 Delta_Q(C) = 10.8^circ"F"$.]),
    True([Độ lệch chuẩn của mẫu số liệu theo độ Fahrenheit bằng $s_F = 1.8 s_C = 7.2^circ"F"$.]),
    [Phương sai của mẫu số liệu theo độ Fahrenheit bằng $s_F^2 = 1.8 s_C^2 + 32$.]
  ),
  loigiai: [
    #step([Khoảng biến thiên])
    $R_F = F_max - F_min = (1.8 C_max + 32) - (1.8 C_min + 32) = 1.8(C_max - C_min) = 1.8 R_C = 1.8 dot 15 = 27^circ"F"$. Mệnh đề a ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q(F) = Q_3(F) - Q_1(F) = 1.8(Q_3(C) - Q_1(C)) = 1.8 Delta_Q(C) = 1.8 dot 6 = 10.8^circ"F"$. Mệnh đề b ĐÚNG.

    #step([Độ lệch chuẩn])
    $s_F = |1.8| s_C = 1.8 dot 4 = 7.2^circ"F"$. Mệnh đề c ĐÚNG.

    #step([Phương sai])
    Phương sai mới: $s_F^2 = (1.8)^2 s_C^2 = 3.24 s_C^2 = 3.24 dot 16 = 51.84 != 1.8 s_C^2 + 32$. Hằng số cộng $32$ hoàn toàn không làm thay đổi phương sai. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của việc thêm giá trị bằng số trung bình)
#ds([Cho một mẫu số liệu gồm $n$ phần tử ($n >= 4$) có số trung bình là $overline(x)$ và phương sai là $s^2 > 0$. Ta lập một mẫu số liệu mới bằng cách bổ sung thêm một phần tử mới có giá trị đúng bằng $overline(x)$ (mẫu mới có $n + 1$ phần tử).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình của mẫu số liệu mới không thay đổi so với mẫu số liệu ban đầu.]),
    True([Tổng các bình phương độ lệch của mẫu số liệu mới bằng đúng tổng các bình phương độ lệch của mẫu ban đầu: $sum_(i=1)^(n+1) (x_i - overline(x))^2 = sum_(i=1)^n (x_i - overline(x))^2$.]),
    True([Phương sai của mẫu số liệu mới được tính theo công thức: $s'^2 = n / (n + 1) s^2$.]),
    [Độ lệch chuẩn của mẫu số liệu mới lớn hơn độ lệch chuẩn của mẫu số liệu ban đầu.]
  ),
  loigiai: [
    #step([Số trung bình mới])
    $overline(x)' = (sum_(i=1)^n x_i + overline(x)) / (n + 1) = (n overline(x) + overline(x)) / (n + 1) = overline(x)$. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương độ lệch])
    Phần tử thứ $n + 1$ có độ lệch bằng $x_(n+1) - overline(x)' = overline(x) - overline(x) = 0$.
    Do đó bình phương độ lệch cộng thêm bằng $0$:
    $sum_(i=1)^(n+1) (x_i - overline(x))^2 = sum_(i=1)^n (x_i - overline(x))^2$. Mệnh đề b ĐÚNG.

    #step([Phương sai mới])
    $s'^2 = 1/(n+1) sum_(i=1)^(n+1) (x_i - overline(x))^2 = 1/(n+1) [n dot s^2] = n / (n + 1) s^2$. Mệnh đề c ĐÚNG.

    #step([Độ lệch chuẩn mới])
    Vì $n / (n+1) < 1$ nên $s' = sqrt(n/(n+1)) s < s$.
    Độ lệch chuẩn của mẫu mới nhỏ hơn độ lệch chuẩn của mẫu ban đầu (do dữ liệu tập trung hơn về phía giá trị trung bình). Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Khoảng biến thiên)
#tln([Thời gian xếp hàng chờ thanh toán (tính bằng phút) của $7$ khách hàng tại một quầy tiện ích là:
#align(center)[
  $2; quad 3; quad 4; quad 6; quad 7; quad 9; quad 15$
]
Tìm khoảng biến thiên $R$ của thời gian chờ theo đơn vị phút.],
    [13],
    loigiai: [
        #step([Xác định Min và Max])
        $x_max = 15$, $x_min = 2$.
        
        #step([Tính khoảng biến thiên])
        $ R = 15 - 2 = 13 text(" phút") $
    ]
)

// TLN 2 (Khoảng tứ phân vị)
#tln([Lượng điện năng tiêu thụ (kWh) trong một tháng của $8$ hộ gia đình trong một khu chung cư là:
#align(center)[
  $120; quad 140; quad 160; quad 180; quad 200; quad 220; quad 260; quad 300$
]
Tính khoảng tứ phân vị $Delta_Q$ của mẫu số liệu trên theo đơn vị kWh.],
    [90],
    loigiai: [
        #step([Xác định các tứ phân vị])
        $n = 8$, đã sắp xếp tăng dần:
        - Nửa dưới: $120; 140; 160; 180 => Q_1 = (140 + 160)/2 = 150$.
        - Nửa trên: $200; 220; 260; 300 => Q_3 = (220 + 260)/2 = 240$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 240 - 150 = 90 text(" kWh") $
    ]
)

// TLN 3 (Phương sai)
#tln([Cho mẫu số liệu khảo sát số giờ tự học trong ngày của $5$ học sinh: $1; quad 2; quad 3; quad 4; quad 5$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [2],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (1 + 2 + 3 + 4 + 5) / 5 = 15 / 5 = 3 $
        
        #step([Tính phương sai])
        $ s^2 = ((1-3)^2 + (2-3)^2 + (3-3)^2 + (4-3)^2 + (5-3)^2) / 5 = (4 + 1 + 0 + 1 + 4) / 5 = 10 / 5 = 2 $
    ]
)

// TLN 4 (Độ lệch chuẩn)
#tln([Cho mẫu số liệu điểm kiểm tra gồm $5$ giá trị: $5; quad 7; quad 8; quad 9; quad 11$.
Tính độ lệch chuẩn $s$ của mẫu số liệu (làm tròn đến hàng phần mười, biết $sqrt(4) = 2$).],
    [2],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (5 + 7 + 8 + 9 + 11) / 5 = 40 / 5 = 8 $
        
        #step([Tính phương sai])
        $ s^2 = ((5-8)^2 + (7-8)^2 + (8-8)^2 + (9-8)^2 + (11-8)^2) / 5 = (9 + 1 + 0 + 1 + 9) / 5 = 20 / 5 = 4 $
        
        #step([Tính độ lệch chuẩn])
        $ s = sqrt(4) = 2 $
    ]
)

// TLN 5 (Ngưỡng dưới giá trị ngoại lệ)
#tln([Một mẫu số liệu thống kê mức chi tiêu có tứ phân vị thứ nhất $Q_1 = 35$ triệu đồng và tứ phân vị thứ ba $Q_3 = 45$ triệu đồng.
Tìm giá trị của ngưỡng dưới $T_1 = Q_1 - 1.5 Delta_Q$ (triệu đồng) để nhận diện các khoản chi tiêu thấp bất thường.],
    [20],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 45 - 35 = 10 text(" triệu đồng") $
        
        #step([Tính ngưỡng dưới])
        $ T_1 = Q_1 - 1.5 Delta_Q = 35 - 1.5(10) = 35 - 15 = 20 text(" triệu đồng") $
    ]
)

// TLN 6 (Độ lệch chuẩn sau phép biến đổi)
#tln([Cho mẫu số liệu $x_1, x_2, dots, x_n$ có độ lệch chuẩn $s_x = 4$.
Ta biến đổi mỗi giá trị theo công thức $y_i = 2.5 x_i - 12$.
Tìm độ lệch chuẩn $s_y$ của mẫu số liệu mới.],
    [10],
    loigiai: [
        #step([Công thức biến đổi độ lệch chuẩn])
        Khi biến đổi tuyến tính $y_i = a x_i + b$, độ lệch chuẩn của mẫu mới bằng:
        $ s_y = |a| dot s_x $
        
        #step([Tính toán])
        $ s_y = |2.5| dot 4 = 10 $
    ]
)

] // end make-questions

#make-questions()
