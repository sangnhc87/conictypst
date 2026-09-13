#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1d4ed8") // Royal Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: THỐNG KÊ ỨNG DỤNG THỰC TẾ",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ THỐNG KÊ (ĐỀ D: BIG DATA, KHOA HỌC DỮ LIỆU & AI - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "131",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong tiền xử lý dữ liệu cho mạng nơ-ron nhân tạo (Neural Network), kỹ sư máy học chuẩn hóa đặc trưng tuổi thọ pin (tính bằng giờ) theo phương pháp Min-Max Normalization:
$ x' = (x - x_min) / (x_max - x_min) $
Cho tập dữ liệu gồm $6$ mẫu thử nghiệm pin: $10; 12; 14; 16; 18; 30$ (giờ). Khoảng biến thiên $R = x_max - x_min$ của tập dữ liệu này bằng],
    (
        True([$20$ giờ]),
        [$18$ giờ],
        [$12$ giờ],
        [$16$ giờ]
    ),
    loigiai: [
        Giá trị lớn nhất $x_max = 30$ giờ, nhỏ nhất $x_min = 10$ giờ.
        Khoảng biến thiên làm mẫu số chuẩn hóa:
        $ R = x_max - x_min = 30 - 10 = 20 text(" giờ") $
    ]
)

// TN 2
#tn([Kỹ sư phân tích hiệu năng theo dõi độ trễ phản hồi (latency, tính bằng mili-giây) của một cụm vi dịch vụ (microservice) xử lý $9$ giao dịch trực tuyến:
#align(center)[
  $12; quad 15; quad 16; quad 18; quad 20; quad 22; quad 25; quad 28; quad 120$
]
Để đại diện cho thời gian phản hồi điển hình của hệ thống mà không bị ảnh hưởng bởi giao dịch bị nghẽn mạng ($120" ms"$), số đặc trưng đo xu thế trung tâm phù hợp nhất là],
    (
        True([Trung vị $M_e = 20" ms"$]),
        [Số trung bình $overline(x) = 30.67" ms"$],
        [Khoảng biến thiên $R = 108" ms"$],
        [Mốt $M_o = 120" ms"$]
    ),
    loigiai: [
        Mẫu số liệu có giá trị ngoại lệ $120" ms"$ (bị lag mạng đột biến).
        Số trung bình bị kéo lệch rất lớn ($overline(x) approx 30.67" ms"$).
        Trung vị của mẫu gồm $9$ phần tử là số ở chính giữa $x_5 = 20" ms"$, hoàn toàn không bị ảnh hưởng bởi giá trị đột biến này.
    ]
)

// TN 3
#tn([Trong phân tích dữ liệu lớn, quy tắc Z-score chuẩn hóa $z_i = (x_i - overline(x)) / s$ dùng để phát hiện dị thường khi $|z_i| > 3$.
Một cụm máy chủ AI ghi nhận lượng tiêu thụ RAM trung bình $overline(x) = 64 text(" GB")$ với độ lệch chuẩn $s = 4 text(" GB")$. Giá trị tiêu thụ RAM nào sau đây được thuật toán tự động xếp vào diện dị thường nghiêm trọng ($|z| > 3$)?],
    (
        True([$78 text(" GB")$]),
        [$72 text(" GB")$],
        [$68 text(" GB")$],
        [$58 text(" GB")$]
    ),
    loigiai: [
        Ngưỡng cảnh báo dị thường bên phải:
        $ x > overline(x) + 3s = 64 + 3 dot 4 = 76 text(" GB") $
        Trong các phương án, chỉ có $78 text(" GB") > 76 text(" GB")$ tương ứng với $z = (78 - 64)/4 = 3.5 > 3$.
    ]
)

// TN 4
#tn([Một mô hình trí tuệ nhân tạo (LLM) sinh ra các câu trả lời có số lượng từ (tokens) trong $8$ lượt hội thoại:
#align(center)[
  $40; quad 45; quad 50; quad 55; quad 65; quad 70; quad 80; quad 100$
]
Khoảng tứ phân vị $Delta_Q$ của độ dài câu trả lời bằng],
    (
        True([$27.5$ tokens]),
        [$25.0$ tokens],
        [$30.0$ tokens],
        [$22.5$ tokens]
    ),
    loigiai: [
        $n = 8$, các giá trị đã sắp xếp tăng dần:
        - Nửa dưới gồm $4$ số: $40; 45; 50; 55 => Q_1 = (45 + 50)/2 = 47.5$.
        - Nửa trên gồm $4$ số: $65; 70; 80; 100 => Q_3 = (70 + 80)/2 = 75.0$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 75.0 - 47.5 = 27.5 text(" tokens") $
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây mô tả độ trễ phân tán (latency) khi tải một mô hình thị giác máy tính AI (Computer Vision) qua $2$ giao thức truyền dữ liệu gRPC và HTTP/2:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (10, 20, 30, 40, 50, 60, 70) {
      let x = (v - 10) * 0.1 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box gRPC: Min=15, Q1=20, Q2=25, Q3=32, Max=42 (y=1.5)
    let xMinA = 0.5 + 0.5
    let xQ1A = 0.5 + 1.0
    let xQ2A = 0.5 + 1.5
    let xQ3A = 0.5 + 2.2
    let xMaxA = 0.5 + 3.2
    rect((xQ1A, 1.2), (xQ3A, 1.8), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("1d4ed8"))
    line((xQ2A, 1.2), (xQ2A, 1.8), stroke: 1.8pt + rgb("dc2626"))
    line((xMinA, 1.5), (xQ1A, 1.5), stroke: 1pt + rgb("1d4ed8"))
    line((xMinA, 1.3), (xMinA, 1.7), stroke: 1.2pt + rgb("1d4ed8"))
    line((xQ3A, 1.5), (xMaxA, 1.5), stroke: 1pt + rgb("1d4ed8"))
    line((xMaxA, 1.3), (xMaxA, 1.7), stroke: 1.2pt + rgb("1d4ed8"))
    content((0.0, 1.5), text(fill: rgb("1d4ed8"), size: 8pt, weight: "bold")[gRPC])

    // Box HTTP/2: Min=20, Q1=35, Q2=45, Q3=55, Max=65 (y=0.6)
    let xMinB = 0.5 + 1.0
    let xQ1B = 0.5 + 2.5
    let xQ2B = 0.5 + 3.5
    let xQ3B = 0.5 + 4.5
    let xMaxB = 0.5 + 5.5
    rect((xQ1B, 0.3), (xQ3B, 0.9), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    line((xQ2B, 0.3), (xQ2B, 0.9), stroke: 1.8pt + rgb("dc2626"))
    line((xMinB, 0.6), (xQ1B, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMinB, 0.4), (xMinB, 0.8), stroke: 1.2pt + rgb("d97706"))
    line((xQ3B, 0.6), (xMaxB, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMaxB, 0.4), (xMaxB, 0.8), stroke: 1.2pt + rgb("d97706"))
    content((0.0, 0.6), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[HTTP/2])
  })
]
Dựa vào biểu đồ hộp, so sánh khoảng tứ phân vị giữa hai giao thức:],
    (
        True([Khoảng tứ phân vị của gRPC là $12" ms"$, nhỏ hơn của HTTP/2 là $20" ms"$]),
        [Khoảng tứ phân vị của gRPC là $20" ms"$, lớn hơn của HTTP/2 là $12" ms"$],
        [Hai giao thức có khoảng tứ phân vị hoàn toàn bằng nhau],
        [Khoảng tứ phân vị của gRPC là $27" ms"$, của HTTP/2 là $45" ms"$]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - Giao thức gRPC: $Q_1 = 20" ms", Q_3 = 32" ms" => Delta_Q = 32 - 20 = 12" ms"$.
        - Giao thức HTTP/2: $Q_1 = 35" ms", Q_3 = 55" ms" => Delta_Q = 55 - 35 = 20" ms"$.
        Vậy $Delta_Q(text("gRPC")) = 12 < Delta_Q(text("HTTP/2")) = 20" ms"$.
    ]
)

// TN 6
#tn([Khi huấn luyện mô hình phân loại dữ liệu, độ đo mất mát Mean Squared Error (MSE) tương ứng với phương sai của phần dư $e_i = y_i - hat(y)_i$. Cho mẫu sai số dự báo gồm $4$ giá trị: $-2; 0; 1; 1$. Giả sử sai số trung bình bằng $0$. Giá trị MSE bằng],
    (
        True([$1.5$]),
        [$2.0$],
        [$1.0$],
        [$0.5$]
    ),
    loigiai: [
        $ "MSE" = 1/n sum_(i=1)^n e_i^2 = ((-2)^2 + 0^2 + 1^2 + 1^2) / 4 = (4 + 0 + 1 + 1) / 4 = 6 / 4 = 1.5 $
    ]
)

// TN 7
#tn([Hệ số biến thiên $C V = s / overline(x) dot 100%$ được dùng để so sánh độ ổn định thông lượng (throughput) giữa hai kênh truyền cáp quang:
- Kênh $A$: Thông lượng trung bình $overline(x)_A = 100 text(" Gbps")$, độ lệch chuẩn $s_A = 5 text(" Gbps")$.
- Kênh $B$: Thông lượng trung bình $overline(x)_B = 20 text(" Gbps")$, độ lệch chuẩn $s_B = 2 text(" Gbps")$.
Kênh truyền nào có độ ổn định thông lượng tương đối tốt hơn?],
    (
        True([Kênh $A$ tốt hơn vì có $C V_A = 5% < C V_B = 10%$]),
        [Kênh $B$ tốt hơn vì có độ lệch chuẩn $s_B = 2 < s_A = 5$],
        [Hai kênh có độ ổn định thông lượng ngang nhau],
        [Chưa đủ thông tin để kết luận]
    ),
    loigiai: [
        Hệ số biến thiên kênh A: $C V_A = 5 / 100 dot 100% = 5%$.
        Hệ số biến thiên kênh B: $C V_B = 2 / 20 dot 100% = 10%$.
        Vì $C V_A = 5% < C V_B = 10%$ nên kênh A có tỷ lệ dao động tương đối thấp hơn, thông lượng ổn định hơn.
    ]
)

// TN 8
#tn([Một thuật toán lọc dữ liệu thời gian thực (real-time stream) tính toán phương sai theo công thức cập nhật Welford dựa trên tổng bình phương: $s^2 = 1/n sum x_i^2 - (overline(x))^2$. Cho mẫu gồm $n = 5$ gói tin có $sum x_i = 50$ và $sum x_i^2 = 580$. Độ lệch chuẩn $s$ của mẫu gói tin bằng],
    (
        True([$4$]),
        [$16$],
        [$8$],
        [$2$]
    ),
    loigiai: [
        $overline(x) = 50 / 5 = 10$.
        Phương sai: $s^2 = 580 / 5 - 10^2 = 116 - 100 = 16$.
        Độ lệch chuẩn: $s = sqrt(16) = 4$.
    ]
)

// TN 9
#tn([Số lượng yêu cầu API (request/giây) gửi đến một cổng điện toán đám mây trong $7$ giây liên tiếp:
#align(center)[
  $1200; quad 1300; quad 1400; quad 1500; quad 1550; quad 1600; quad 2900$
]
Khoảng biến thiên $R$ của lưu lượng truy cập bằng],
    (
        True([$1700$ req/s]),
        [$1600$ req/s],
        [$1400$ req/s],
        [$1500$ req/s]
    ),
    loigiai: [
        $x_max = 2900$, $x_min = 1200$.
        $ R = 2900 - 1200 = 1700 text(" req/s") $
    ]
)

// TN 10
#tn([Trong kho dữ liệu BigQuery, để tối ưu dung lượng lưu trữ, kỹ sư chuyển đổi đơn vị bộ nhớ từ Byte sang Gigabyte theo công thức $y_i = x_i / (10^9)$. Phương sai của mẫu số liệu mới $s_y^2$ sẽ],
    (
        True([Bằng phương sai cũ chia cho $10^18$]),
        [Bằng phương sai cũ chia cho $10^9$],
        [Không đổi],
        [Bằng phương sai cũ nhân với $10^9$]
    ),
    loigiai: [
        Khi $y_i = a x_i$ với $a = 10^(-9)$:
        $ s_y^2 = a^2 s_x^2 = (10^(-9))^2 s_x^2 = 10^(-18) s_x^2 = s_x^2 / (10^18) $
    ]
)

// TN 11
#tn([Một mô hình AI xử lý ngôn ngữ tự nhiên (NLP) phân loại độ dài từ trong câu tiếng Việt. Bảng tần số số ký tự của $20$ từ ngẫu nhiên:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Số ký tự*], [$2$], [$3$], [$4$], [$5$], [$6$],
    [*Số từ*], [$3$], [$8$], [$5$], [$3$], [$1$]
  )
]
Mốt $M_o$ của độ dài từ bằng],
    (
        True([$3$ ký tự]),
        [$8$ ký tự],
        [$4$ ký tự],
        [$5$ ký tự]
    ),
    loigiai: [
        Độ dài $3$ ký tự có tần số xuất hiện cao nhất ($n = 8$). Do đó $M_o = 3$ ký tự.
    ]
)

// TN 12
#tn([Khảo sát thời gian phản hồi của mạng $5G$ tại $10$ vị trí có tứ phân vị thứ nhất $Q_1 = 8" ms"$ và tứ phân vị thứ ba $Q_3 = 14" ms"$. Ngưỡng trên $T_2$ để xác định các trạm phát có độ trễ cao bất thường (outlier) là],
    (
        True([$T_2 = 23" ms"$]),
        [$T_2 = 20" ms"$],
        [$T_2 = 26" ms"$],
        [$T_2 = 17" ms"$]
    ),
    loigiai: [
        $Delta_Q = Q_3 - Q_1 = 14 - 8 = 6" ms"$.
        Ngưỡng rào trên:
        $ T_2 = Q_3 + 1.5 Delta_Q = 14 + 1.5(6) = 14 + 9 = 23" ms" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Phát hiện tấn công mạng DDoS)
#ds([Hệ thống an ninh mạng của một ngân hàng số theo dõi lưu lượng gói tin (nghìn gói/giây) qua cổng tường lửa trong $10$ khoảng thời gian $1$ phút liên tiếp:
#align(center)[
  $10; quad 12; quad 14; quad 15; quad 15; quad 16; quad 18; quad 20; quad 22; quad 95$
]
Kỹ sư hệ thống nghi vấn thời điểm ghi nhận $95$ nghìn gói/giây là một đợt tấn công từ chối dịch vụ (DDoS).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị lưu lượng gói tin bình thường của hệ thống là $M_e = 15.5$ nghìn gói/giây.]),
    True([Tứ phân vị thứ nhất $Q_1 = 14$ và tứ phân vị thứ ba $Q_3 = 20$ (nghìn gói/giây).]),
    True([Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 6$ nghìn gói/giây.]),
    [Lưu lượng $95$ nghìn gói/giây chưa vượt qua ngưỡng rào trên nên chưa thể khẳng định là cuộc tấn công bất thường.]
  ),
  loigiai: [
    #step([Tính trung vị])
    $n = 10$, hai giá trị chính giữa ở vị trí $5$ và $6$ là $15$ và $16 => M_e = (15 + 16)/2 = 15.5$. Mệnh đề a ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $5$ số: $10; 12; 14; 15; 15 => Q_1 = 14$.
    Nửa trên gồm $5$ số: $16; 18; 20; 22; 95 => Q_3 = 20$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 20 - 14 = 6$ nghìn gói/giây. Mệnh đề c ĐÚNG.

    #step([Kiểm tra giá trị bất thường])
    Ngưỡng rào trên cảnh báo bất thường:
    $Q_3 + 1.5 Delta_Q = 20 + 1.5(6) = 20 + 9 = 29$ nghìn gói/giây.
    Vì $95 >> 29$ nên đây chắc chắn là giá trị ngoại lệ cực đoan do một đợt tấn công DDoS gây ra. Mệnh đề d SAI.
  ]
)

// DS 2 (So sánh thời gian xử lý của 2 thuật toán tìm kiếm AI)
#ds([Một công ty AI so sánh hiệu năng thời gian xử lý câu lệnh truy vấn (mili-giây) của hai thuật toán tìm kiếm ngữ nghĩa:
- Thuật toán A (Vector Search): $30; quad 32; quad 34; quad 35; quad 35; quad 36; quad 36; quad 38; quad 40; quad 44$
- Thuật toán B (Keyword Search): $10; quad 15; quad 20; quad 25; quad 30; quad 35; quad 40; quad 45; quad 55; quad 85$
Xét tính đúng sai của các nhận định sau:],
  (
    True([Thời gian xử lý trung bình của Thuật toán A là $overline(x)_A = 36.0" ms"$, nhanh hơn thời gian trung bình của Thuật toán B ($overline(x)_B = 36.0" ms"$). Khoan, tính lại: Tổng B = $10+15+20+25+30+35+40+45+55+85 = 360 => overline(x)_B = 36.0" ms"$. Cả hai thuật toán có thời gian trung bình bằng nhau và bằng $36.0" ms"$.]),
    True([Khoảng biến thiên của Thuật toán A là $R_A = 14" ms"$, nhỏ hơn nhiều so với Thuật toán B ($R_B = 75" ms"$).]),
    True([Tứ phân vị thứ ba của Thuật toán A là $Q_3(A) = 38" ms"$, trong khi của Thuật toán B là $Q_3(B) = 45" ms"$.]),
    [Thuật toán B có độ ổn định và tính nhất quán cao hơn Thuật toán A vì có những truy vấn cực nhanh chỉ mất $10" ms"$.]
  ),
  loigiai: [
    #step([Tính thời gian trung bình])
    Tổng A: $30+32+34+35+35+36+36+38+40+44 = 360 => overline(x)_A = 360/10 = 36.0" ms"$.
    Tổng B: $10+15+20+25+30+35+40+45+55+85 = 360 => overline(x)_B = 360/10 = 36.0" ms"$. Cả hai đều bằng nhau. Mệnh đề a ĐÚNG.

    #step([Khoảng biến thiên])
    $R_A = 44 - 30 = 14" ms"$.
    $R_B = 85 - 10 = 75" ms"$. Mệnh đề b ĐÚNG.

    #step([Tứ phân vị thứ ba])
    Thuật toán A: nửa trên $36; 36; 38; 40; 44 => Q_3(A) = 38" ms"$.
    Thuật toán B: nửa trên $35; 40; 45; 55; 85 => Q_3(B) = 45" ms"$. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ ổn định])
    Thuật toán A có độ phân tán cực thấp ($R = 14" ms"$) nên thời gian phản hồi rất đồng đều, ổn định. Thuật toán B dao động quá lớn (từ $10$ đến $85" ms"$) nên trải nghiệm người dùng kém ổn định hơn A. Mệnh đề d SAI.
  ]
)

// DS 3 (Phương sai gộp của 2 cụm máy chủ Cloud)
#ds([Một công ty điện toán đám mây vận hành hai trung tâm dữ liệu độc lập:
- Trung tâm dữ liệu $1$ có $n_1 = 20$ máy chủ GPU, nhiệt độ trung bình $overline(x)_1 = 60^circ"C"$, phương sai nhiệt độ $s_1^2 = 4$.
- Trung tâm dữ liệu $2$ có $n_2 = 20$ máy chủ GPU, nhiệt độ trung bình $overline(x)_2 = 70^circ"C"$, phương sai nhiệt độ $s_2^2 = 4$.
Xét tính đúng sai của các nhận định sau về toàn bộ cụm $40$ máy chủ GPU:],
  (
    True([Nhiệt độ trung bình chung của toàn bộ $40$ máy chủ GPU là $overline(x) = 65^circ"C"$.]),
    True([Tổng bình phương độ lệch nội bộ của từng trung tâm dữ liệu so với nhiệt độ trung bình của chính nó đều bằng $n_1 s_1^2 = n_2 s_2^2 = 80$.]),
    True([Phương sai gộp chung của toàn bộ $40$ máy chủ GPU bằng $s^2 = 29$.]),
    [Vì hai trung tâm có phương sai nhiệt độ bằng nhau ($s_1^2 = s_2^2 = 4$) nên nhiệt độ trên toàn bộ $40$ máy chủ cũng có phương sai bằng $4$.]
  ),
  loigiai: [
    #step([Nhiệt độ trung bình chung])
    $overline(x) = (20 dot 60 + 20 dot 70) / 40 = 65^circ"C"$. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương độ lệch nội bộ])
    $n_1 s_1^2 = 20 dot 4 = 80$.
    $n_2 s_2^2 = 20 dot 4 = 80$. Mệnh đề b ĐÚNG.

    #step([Phương sai gộp])
    $s^2 = (n_1 (s_1^2 + (overline(x)_1 - overline(x))^2) + n_2 (s_2^2 + (overline(x)_2 - overline(x))^2)) / (n_1 + n_2)$
    $= (20(4 + (60-65)^2) + 20(4 + (70-65)^2)) / 40 = (20(4 + 25) + 20(4 + 25)) / 40 = (20 dot 29 + 20 dot 29) / 40 = 29$. Mệnh đề c ĐÚNG.

    #step([Phân tích phương sai gộp])
    Sự chênh lệch nhiệt độ giữa hai trung tâm ($60^circ"C"$ và $70^circ"C"$) làm tăng độ biến thiên của mẫu gộp lên rất nhiều ($s^2 = 29 > 4$). Khẳng định phương sai gộp bằng $4$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tối ưu hóa siêu tham số mô hình AI)
#ds([Một kỹ sư AI tinh chỉnh siêu tham số learning rate cho $5$ mô hình thử nghiệm. Sai số kiểm thử (Loss) đạt được với một tham số $m$ thực tế là:
#align(center)[
  $0.2; quad 0.4; quad 0.6; quad 0.8; quad m$ (với $m > 0$)
]
Xét tính đúng sai của các nhận định toán học sau:],
  (
    True([Số trung bình của Loss là một hàm số bậc nhất theo $m$: $overline(x)(m) = (2.0 + m) / 5$.]),
    True([Tổng bình phương sai số $f(m) = sum_(i=1)^5 (x_i - overline(x))^2$ đạt giá trị nhỏ nhất khi $m = 0.5$.]),
    True([Khi $m = 0.5$, phương sai của mẫu Loss đạt giá trị nhỏ nhất bằng $s_min^2 = 0.04$.]),
    [Giá trị của $m$ càng lớn thì phương sai của mẫu số liệu Loss càng tiến dần về $0$.]
  ),
  loigiai: [
    #step([Số trung bình Loss])
    $overline(x) = (0.2 + 0.4 + 0.6 + 0.8 + m) / 5 = (2.0 + m) / 5 = 0.4 + m/5$. Mệnh đề a ĐÚNG.

    #step([Cực tiểu của tổng bình phương độ lệch])
    Hàm tổng bình phương khoảng cách từ các điểm $x_1, dots, x_k$ và $m$ tới số trung bình luôn đạt giá trị nhỏ nhất khi $m$ bằng trung bình cộng của các điểm còn lại:
    $m = (0.2 + 0.4 + 0.6 + 0.8) / 4 = 2.0 / 4 = 0.5$. Mệnh đề b ĐÚNG.

    #step([Phương sai nhỏ nhất])
    Khi $m = 0.5$: mẫu gồm $0.2; 0.4; 0.5; 0.6; 0.8$.
    $overline(x) = 2.5 / 5 = 0.5$.
    $s_min^2 = ((0.2-0.5)^2 + (0.4-0.5)^2 + (0.5-0.5)^2 + (0.6-0.5)^2 + (0.8-0.5)^2) / 5$
    $= (0.09 + 0.01 + 0 + 0.01 + 0.09) / 5 = 0.20 / 5 = 0.04$. Mệnh đề c ĐÚNG.

    #step([Giới hạn khi m tăng])
    Khi $m -> +oo$, phương sai $s^2(m) -> +oo$ chứ không thể tiến về $0$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tính phương sai từ tổng bình phương)
#tln([Một cụm vi xử lý AI gồm $n = 5$ lõi tính toán ghi nhận số lượng tác vụ đã xử lý có $sum_(i=1)^5 x_i = 40$ và $sum_(i=1)^5 x_i^2 = 360$.
Tính phương sai $s^2$ của số lượng tác vụ giữa các lõi.],
    [8],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = 40 / 5 = 8 $
        
        #step([Tính phương sai])
        $ s^2 = 1/5 sum_(i=1)^5 x_i^2 - (overline(x))^2 = 360 / 5 - 8^2 = 72 - 64 = 8 $
    ]
)

// TLN 2 (Khoảng tứ phân vị)
#tln([Thời gian huấn luyện (giờ) của $10$ mô hình học sâu (Deep Learning) trên cùng một tập dữ liệu lớn là:
#align(center)[
  $10; quad 12; quad 15; quad 18; quad 20; quad 22; quad 25; quad 28; quad 32; quad 40$
]
Tìm khoảng tứ phân vị $Delta_Q$ của thời gian huấn luyện theo đơn vị giờ.],
    [13],
    loigiai: [
        #step([Xác định Q1 và Q3])
        $n = 10$, các số đã sắp xếp tăng dần:
        - Nửa dưới gồm $5$ số: $10; 12; 15; 18; 20 => Q_1 = 15$ giờ.
        - Nửa trên gồm $5$ số: $22; 25; 28; 32; 40 => Q_3 = 28$ giờ.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 28 - 15 = 13 text(" giờ") $
    ]
)

// TLN 3 (Khoảng biến thiên)
#tln([Dung lượng bộ nhớ đệm (MB) tiêu tốn trong $6$ phiên chạy thuật toán là:
#align(center)[
  $128; quad 150; quad 180; quad 210; quad 256; quad 512$
]
Tìm khoảng biến thiên $R$ của dung lượng bộ nhớ theo đơn vị MB.],
    [384],
    loigiai: [
        #step([Xác định Max và Min])
        $x_max = 512$, $x_min = 128$.
        $ R = 512 - 128 = 384 text(" MB") $
    ]
)

// TLN 4 (Hệ số biến thiên CV)
#tln([Một hệ thống lưu trữ phân tán có tốc độ đọc dữ liệu trung bình $overline(x) = 200 text(" MB/s")$ và độ lệch chuẩn $s = 15 text(" MB/s")$.
Tính hệ số biến thiên $C V = s / overline(x) dot 100%$ của tốc độ đọc (theo đơn vị %).],
    [7.5],
    loigiai: [
        #step([Tính hệ số biến thiên])
        $ C V = 15 / 200 dot 100% = 7.5% $
    ]
)

// TLN 5 (Ngưỡng trên ngoại lệ)
#tln([Một cuộc khảo sát số lượng kết nối đồng thời vào máy chủ có $Q_1 = 500$ kết nối và $Q_3 = 900$ kết nối.
Tìm giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ để kích hoạt cảnh báo quá tải bất thường.],
    [1500],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 900 - 500 = 400 text(" kết nối") $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 900 + 1.5(400) = 900 + 600 = 1500 text(" kết nối") $
    ]
)

// TLN 6 (Độ lệch chuẩn sau biến đổi)
#tln([Cho mẫu số liệu thời gian phản hồi có độ lệch chuẩn $s_x = 5" ms"$.
Người ta chuyển đổi thang đo sang micro-giây ($mu"s"$) bằng công thức $y_i = 1000 x_i$.
Tính độ lệch chuẩn $s_y$ của mẫu số liệu mới theo đơn vị $mu"s"$.],
    [5000],
    loigiai: [
        #step([Tính độ lệch chuẩn mới])
        Khi $y_i = a x_i$ với $a = 1000$:
        $ s_y = |a| dot s_x = 1000 dot 5 = 5000 mu"s" $
    ]
)

] // end make-questions

#make-questions()
