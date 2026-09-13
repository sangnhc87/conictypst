#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("d97706") // Amber

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM VÀ ĐO ĐỘ PHÂN TÁN",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG V: ÔN TẬP TỔNG HỢP CHƯƠNG V (ĐỀ C: NÂNG CAO - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "130",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho mẫu số liệu gồm $5$ giá trị: $2; quad 4; quad 6; quad 8; quad x$. Biết rằng số trung bình của mẫu số liệu này bằng $6.0$. Phương sai $s^2$ của mẫu số liệu bằng],
    (
        True([$8.0$]),
        [$4.0$],
        [$2.83$],
        [$10.0$]
    ),
    loigiai: [
        Vì số trung bình bằng $6.0$:
        $ (2 + 4 + 6 + 8 + x) / 5 = 6 <=> 20 + x = 30 <=> x = 10 $
        Mẫu số liệu là: $2; 4; 6; 8; 10$.
        Phương sai:
        $ s^2 = ((2-6)^2 + (4-6)^2 + (6-6)^2 + (8-6)^2 + (10-6)^2) / 5 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8.0 $
    ]
)

// TN 2
#tn([Một nhà nghiên cứu thống kê một mẫu số liệu gồm $n = 10$ quan sát. Sử dụng máy tính cầm tay thu được $sum_(i=1)^(10) x_i = 80$ và $sum_(i=1)^(10) x_i^2 = 720$. Phương sai $s^2$ của mẫu số liệu trên bằng],
    (
        True([$8$]),
        [$64$],
        [$72$],
        [$16$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = 80 / 10 = 8$.
        Áp dụng công thức rút gọn:
        $ s^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 = 720 / 10 - 8^2 = 72 - 64 = 8 $
    ]
)

// TN 3
#tn([Cho $5$ vị trí dân cư trên trục đường thẳng $O x$ có tọa độ lần lượt là $x_1 = 1, x_2 = 3, x_3 = 5, x_4 = 7, x_5 = 9$. Người ta cần xây dựng một trạm y tế tại vị trí $c$ sao cho tổng khoảng cách di chuyển từ các điểm dân cư đến trạm $f(c) = sum_(i=1)^5 |x_i - c|$ đạt giá trị nhỏ nhất. Tọa độ tối ưu của trạm y tế là],
    (
        True([$c = 5$ (trung vị của mẫu số liệu)]),
        [$c = 5$ (vì là số trung bình cộng)],
        [$c = 1$],
        [$c = 9$]
    ),
    loigiai: [
        Theo tính chất toán học của hàm mất mát khoảng cách $L_1$:
        Hàm số $f(c) = sum_(i=1)^n |x_i - c|$ luôn đạt giá trị nhỏ nhất tại trung vị $M_e$ của mẫu số liệu.
        Với $5$ điểm đã sắp xếp $1; 3; 5; 7; 9$, trung vị chính là $M_e = x_3 = 5$.
    ]
)

// TN 4
#tn([Hệ số biến thiên $C V = s / overline(x) dot 100%$ được dùng để so sánh độ rủi ro tương đối giữa hai danh mục đầu tư:
- Danh mục $X$: Lợi nhuận trung bình $overline(x)_X = 20%$, độ lệch chuẩn $s_X = 4%$.
- Danh mục $Y$: Lợi nhuận trung bình $overline(x)_Y = 10%$, độ lệch chuẩn $s_Y = 3%$.
Nhận định nào sau đây là chuẩn xác?],
    (
        True([Danh mục $Y$ có mức độ rủi ro tương đối cao hơn danh mục $X$ vì $C V_Y = 30% > C V_X = 20%$]),
        [Danh mục $X$ có mức độ rủi ro tương đối cao hơn danh mục $Y$ vì $s_X = 4% > s_Y = 3%$],
        [Hai danh mục có mức độ rủi ro tương đối hoàn toàn ngang nhau],
        [Danh mục $X$ có hệ số biến thiên lớn hơn $25%$]
    ),
    loigiai: [
        Hệ số biến thiên danh mục X: $C V_X = 4 / 20 dot 100% = 20%$.
        Hệ số biến thiên danh mục Y: $C V_Y = 3 / 10 dot 100% = 30%$.
        Vì $C V_Y = 30% > C V_X = 20%$ nên danh mục Y biến động tương đối mạnh hơn và tiềm ẩn rủi ro cao hơn so với mức sinh lời kỳ vọng.
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây mô tả sự phân bố thời gian xử lý yêu cầu (giây) của một hệ thống máy chủ cơ sở dữ liệu:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (0, 20, 40, 60, 80, 100, 120) {
      let x = v * 0.05 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Whiskers & Box: Min = 10 (x=1.0), Q1 = 20 (x=1.5), Q2 = 30 (x=2.0), Q3 = 60 (x=3.5), Max-non-outlier = 90 (x=5.0)
    // Outlier at 120 (x=6.5)
    circle((6.5, 0.8), radius: 2.5pt, fill: rgb("dc2626"))
    content((6.5, 1.15), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[120])

    rect((1.5, 0.4), (3.5, 1.2), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    line((2.0, 0.4), (2.0, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((1.0, 0.8), (1.5, 0.8), stroke: 1pt + rgb("d97706"))
    line((1.0, 0.6), (1.0, 1.0), stroke: 1.2pt + rgb("d97706"))
    line((3.5, 0.8), (5.0, 0.8), stroke: 1pt + rgb("d97706"))
    line((5.0, 0.6), (5.0, 1.0), stroke: 1.2pt + rgb("d97706"))
  })
]
Dựa vào hình dáng biểu đồ hộp (vị trí vạch trung vị $Q_2 = 30$ lệch sát về phía $Q_1 = 20$), nhận xét nào sau đây là đúng về hình dáng phân bố dữ liệu?],
    (
        True([Phân bố dữ liệu bị lệch phải (dương), số trung bình $overline(x)$ thường lớn hơn trung vị $M_e$]),
        [Phân bố dữ liệu hoàn toàn đối xứng, số trung bình bằng đúng trung vị],
        [Phân bố dữ liệu bị lệch trái (âm), số trung bình nhỏ hơn trung vị],
        [Mẫu số liệu không có giá trị bất thường nào]
    ),
    loigiai: [
        Trong biểu đồ hộp: khoảng cách $Q_2 - Q_1 = 30 - 20 = 10$ nhỏ hơn nhiều so với $Q_3 - Q_2 = 60 - 30 = 30$, và râu bên phải kéo dài cùng điểm ngoại lệ $120$.
        Đây là đặc trưng của phân phối lệch phải (Right-skewed), kéo theo số trung bình bị kéo về phía các giá trị lớn nên $overline(x) > M_e$.
    ]
)

// TN 6
#tn([Một doanh nghiệp áp dụng chính sách điều chỉnh lương cho nhân viên theo công thức $y_i = 1.1 x_i + 500$ (nghìn đồng), trong đó $x_i$ là mức lương cũ. Nếu mẫu số liệu lương cũ có phương sai $s_x^2 = 100$, thì phương sai của mẫu số liệu lương mới $s_y^2$ bằng],
    (
        True([$121$]),
        [$110$],
        [$600$],
        [$100$]
    ),
    loigiai: [
        Khi biến đổi tuyến tính $y_i = a x_i + b$ với $a = 1.1$:
        Phương sai mới biến đổi theo công thức:
        $ s_y^2 = a^2 s_x^2 = (1.1)^2 dot 100 = 1.21 dot 100 = 121 $
    ]
)

// TN 7
#tn([Đo cạnh $a$ của một khối lập phương thu được kết quả $a = 10 text(" cm") plus.minus 0.05 text(" cm")$. Đánh giá sai số tương đối $delta_V$ của phép tính thể tích $V = a^3$ bằng],
    (
        True([$delta_V <= 1.5%$]),
        [$delta_V <= 0.5%$],
        [$delta_V <= 0.15%$],
        [$delta_V <= 3.0%$]
    ),
    loigiai: [
        Sai số tương đối của cạnh: $delta_a <= 0.05 / 10 = 0.005 = 0.5%$.
        Vì $V = a^3$ nên sai số tương đối của thể tích xấp xỉ bằng:
        $ delta_V approx 3 delta_a = 3 dot 0.5% = 1.5% $
    ]
)

// TN 8
#tn([Một mẫu số liệu gồm $n$ quan sát có khoảng tứ phân vị bằng $0$ ($Delta_Q = 0$). Điều này chứng tỏ],
    (
        True([Ít nhất $50%$ số lượng các quan sát ở phần giữa của mẫu số liệu có giá trị hoàn toàn bằng nhau]),
        [Tất cả các số liệu trong mẫu đều bằng nhau],
        [Phương sai của mẫu số liệu chắc chắn bằng $0$],
        [Khoảng biến thiên của mẫu số liệu chắc chắn bằng $0$]
    ),
    loigiai: [
        $Delta_Q = Q_3 - Q_1 = 0 <=> Q_1 = Q_3$.
        Vì giữa $Q_1$ và $Q_3$ luôn chứa $50%$ dữ liệu ở trung tâm mẫu, nên $Q_1 = Q_3$ suy ra toàn bộ $50%$ dữ liệu này đều nhận cùng một giá trị.
    ]
)

// TN 9
#tn([Cho mẫu số liệu gồm $4$ số: $3; quad 5; quad 7; quad x$ với $x > 7$. Biết khoảng biến thiên của mẫu số liệu bằng $R = 10$. Giá trị của $x$ bằng],
    (
        True([$13$]),
        [$10$],
        [$17$],
        [$12$]
    ),
    loigiai: [
        Vì $x > 7$ nên giá trị lớn nhất là $x_max = x$, giá trị nhỏ nhất là $x_min = 3$.
        $ R = x - 3 = 10 <=> x = 13 $
    ]
)

// TN 10
#tn([Trong kiểm soát chất lượng quy trình công nghiệp Six Sigma, với mẫu dữ liệu tuân theo phân bố chuẩn có số trung bình $overline(x)$ và độ lệch chuẩn $s$, khoảng giá trị $(overline(x) - 2s; overline(x) + 2s)$ sẽ chứa xấp xỉ bao nhiêu phần trăm dữ liệu?],
    (
        True([Khoảng $95%$ dữ liệu]),
        [Khoảng $68%$ dữ liệu],
        [Khoảng $99.7%$ dữ liệu],
        [Khoảng $50%$ dữ liệu]
    ),
    loigiai: [
        Theo quy tắc thực nghiệm phân bố chuẩn (Empirical Rule):
        - Khoảng $(overline(x) - s; overline(x) + s)$ chứa khoảng $68%$ dữ liệu.
        - Khoảng $(overline(x) - 2s; overline(x) + 2s)$ chứa khoảng $95%$ dữ liệu.
        - Khoảng $(overline(x) - 3s; overline(x) + 3s)$ chứa khoảng $99.7%$ dữ liệu.
    ]
)

// TN 11
#tn([Khảo sát điểm thi của $10$ học sinh: $4; 5; 6; 6; 6; 7; 8; 8; 8; 9$. Nhận xét nào sau đây là đúng về mốt của mẫu số liệu?],
    (
        True([Mẫu số liệu có hai mốt là $M_o = 6$ và $M_o = 8$]),
        [Mẫu số liệu chỉ có duy nhất một mốt là $M_o = 7$],
        [Mẫu số liệu không có mốt],
        [Mốt của mẫu số liệu là $M_o = 9$]
    ),
    loigiai: [
        Hai giá trị $6$ và $8$ đều xuất hiện $3$ lần (nhiều nhất trong mẫu).
        Do đó mẫu số liệu là phân bố đa mốt với hai mốt: $M_o = 6$ và $M_o = 8$.
    ]
)

// TN 12
#tn([Một mẫu số liệu có độ lệch chuẩn $s = 5$. Nếu ta nhân tất cả các giá trị của mẫu số liệu với $-2$ thì phương sai của mẫu số liệu mới bằng],
    (
        True([$100$]),
        [$-50$],
        [$50$],
        [$25$]
    ),
    loigiai: [
        Phương sai ban đầu: $s_x^2 = 5^2 = 25$.
        Khi nhân với $-2$: $s_y^2 = (-2)^2 s_x^2 = 4 dot 25 = 100$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Bài toán tối ưu vị trí trạm vận chuyển L1 và L2)
#ds([Trên tuyến đường thẳng quốc lộ, ba nhà máy $A, B, C$ đặt tại các mốc km tương ứng: $x_A = 10, x_B = 20, x_C = 60$. Một trung tâm kho vận cần chọn vị trí $x$ trên quốc lộ để xây dựng.
Xét tính đúng sai của các nhận định toán học sau:],
  (
    True([Nếu tiêu chí tối ưu là cực tiểu hóa tổng bình phương khoảng cách $f(x) = (x-10)^2 + (x-20)^2 + (x-60)^2$, vị trí tối ưu là tại số trung bình $x = 30$.]),
    True([Nếu tiêu chí tối ưu là cực tiểu hóa tổng khoảng cách di chuyển $g(x) = |x-10| + |x-20| + |x-60|$, vị trí tối ưu là tại trung vị $x = 20$.]),
    True([Tại vị trí $x = 20$, tổng khoảng cách di chuyển bằng $g(20) = 10 + 0 + 40 = 50$ km, nhỏ hơn tổng khoảng cách tại vị trí số trung bình $g(30) = 20 + 10 + 30 = 60$ km.]),
    [Vị trí số trung bình luôn cho tổng khoảng cách di chuyển nhỏ hơn hoặc bằng vị trí trung vị.]
  ),
  loigiai: [
    #step([Tối ưu tổng bình phương khoảng cách (L2)])
    Hàm $f(x) = 3x^2 - 2(90)x + (100 + 400 + 3600) = 3x^2 - 180x + 4100$.
    Đạt cực tiểu tại đỉnh parabol $x = 180 / 6 = 30 = overline(x)$. Mệnh đề a ĐÚNG.

    #step([Tối ưu tổng khoảng cách (L1)])
    Hàm $g(x) = |x-10| + |x-20| + |x-60|$ đạt cực tiểu tại trung vị $M_e = 20$. Mệnh đề b ĐÚNG.

    #step([So sánh tổng khoảng cách])
    $g(20) = |20-10| + |20-20| + |20-60| = 10 + 0 + 40 = 50$ km.
    $g(30) = |30-10| + |30-20| + |30-60| = 20 + 10 + 30 = 60$ km. $50 < 60$. Mệnh đề c ĐÚNG.

    #step([Nhận định tổng quát])
    Theo định lý cơ bản, trung vị luôn tối ưu hóa tổng khoảng cách tuyệt đối $sum |x_i - x|$, còn số trung bình chỉ tối ưu hóa tổng bình phương $sum (x_i - x)^2$. Khẳng định số trung bình luôn cho tổng khoảng cách nhỏ hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Phương sai gộp của hai phân xưởng)
#ds([Hai nhóm công nhân sản xuất linh kiện điện tử:
- Nhóm 1 gồm $n_1 = 10$ người, năng suất trung bình $overline(x)_1 = 40$ chi tiết/ngày, phương sai $s_1^2 = 9$.
- Nhóm 2 gồm $n_2 = 10$ người, năng suất trung bình $overline(x)_2 = 50$ chi tiết/ngày, phương sai $s_2^2 = 9$.
Xét tính đúng sai của các nhận định sau về mẫu số liệu gộp chung $20$ công nhân:],
  (
    True([Năng suất trung bình chung của toàn bộ $20$ công nhân là $overline(x) = (10 dot 40 + 10 dot 50) / 20 = 45$ chi tiết/ngày.]),
    True([Tổng bình phương độ lệch nội bộ của từng nhóm so với số trung bình của nhóm mình đều bằng $n_1 s_1^2 = n_2 s_2^2 = 90$.]),
    True([Phương sai gộp của toàn bộ $20$ công nhân bằng $s^2 = 34$.]),
    [Vì hai nhóm có phương sai bằng nhau ($s_1^2 = s_2^2 = 9$) nên phương sai gộp của cả hai nhóm cũng bằng $9$.]
  ),
  loigiai: [
    #step([Tính số trung bình chung])
    $overline(x) = (10(40) + 10(50)) / 20 = 45$. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương nội bộ])
    Nhóm 1: $10 dot 9 = 90$. Nhóm 2: $10 dot 9 = 90$. Mệnh đề b ĐÚNG.

    #step([Tính phương sai gộp])
    Công thức phương sai gộp:
    $s^2 = (n_1 (s_1^2 + (overline(x)_1 - overline(x))^2) + n_2 (s_2^2 + (overline(x)_2 - overline(x))^2)) / (n_1 + n_2)$
    $= (10(9 + (40-45)^2) + 10(9 + (50-45)^2)) / 20 = (10(9 + 25) + 10(9 + 25)) / 20 = (10(34) + 10(34)) / 20 = 34$. Mệnh đề c ĐÚNG.

    #step([Phân tích sự phân tán gộp])
    Mặc dù mỗi nhóm có độ lệch chuẩn nhỏ ($s = 3$), nhưng sự chênh lệch giữa hai trung bình nhóm ($40$ và $50$) tạo ra sự phân tán lớn trong mẫu gộp, làm tăng phương sai lên $34 > 9$. Khẳng định phương sai gộp bằng $9$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Độ vững của các số đặc trưng trước nhiễu dữ liệu)
#ds([Cho mẫu số liệu điểm kiểm tra của $9$ học sinh ban đầu:
#align(center)[
  $5; quad 6; quad 7; quad 7; quad 8; quad 8; quad 9; quad 9; quad 10$
]
Một học sinh vắng thi được nhập bổ sung điểm $0$ vào hệ thống (thành mẫu $10$ số liệu gồm thêm điểm $0$ ở đầu).
Xét tính đúng sai của các nhận định sau khi so sánh giữa mẫu mới ($10$ học sinh) và mẫu cũ ($9$ học sinh):],
  (
    True([Số trung bình của mẫu số liệu bị giảm sút đáng kể do giá trị $0$ kéo tụt tổng điểm.]),
    True([Trung vị của mẫu số liệu giảm rất ít, từ $M_e = 8.0$ xuống $M_e' = 7.5$.]),
    True([Khoảng biến thiên của mẫu số liệu bị tăng vọt từ $R = 5$ lên $R' = 10$.]),
    [Độ lệch chuẩn ít bị ảnh hưởng bởi điểm số $0$ bất thường này hơn so với khoảng tứ phân vị.]
  ),
  loigiai: [
    #step([Ảnh hưởng lên số trung bình])
    Mẫu cũ: Tổng $69 / 9 approx 7.67$. Mẫu mới: $69 / 10 = 6.90$. Giảm mạnh. Mệnh đề a ĐÚNG.

    #step([Ảnh hưởng lên trung vị])
    Mẫu cũ: $n = 9$, số thứ $5$ là $8.0$.
    Mẫu mới: $0; 5; 6; 7; 7; 8; 8; 9; 9; 10$, hai số giữa là $7$ và $8 => M_e' = 7.5$. Giảm nhẹ. Mệnh đề b ĐÚNG.

    #step([Ảnh hưởng lên khoảng biến thiên])
    Cũ: $10 - 5 = 5$. Mới: $10 - 0 = 10$. Tăng gấp đôi. Mệnh đề c ĐÚNG.

    #step([Độ nhạy của độ lệch chuẩn])
    Độ lệch chuẩn rất nhạy với các giá trị ngoại lệ (vì tính theo bình phương sai lệch $(0 - 6.9)^2 approx 47.6$). Trái lại, khoảng tứ phân vị chỉ thay đổi ở ranh giới phân vị nên vững hơn nhiều. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số m trong mẫu số liệu)
#ds([Cho mẫu số liệu $1; quad 3; quad 5; quad 7; quad m$ với $m$ là số thực thay đổi.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình của mẫu số liệu là $overline(x)(m) = (16 + m) / 5$.]),
    True([Tổng bình phương độ lệch $f(m) = sum_(i=1)^5 (x_i - overline(x))^2$ đạt giá trị nhỏ nhất khi $m = 4$.]),
    True([Khi $m = 4$, mẫu số liệu có phương sai nhỏ nhất bằng $s_min^2 = 4.0$.]),
    [Giá trị trung vị của mẫu số liệu luôn bằng $5$ với mọi giá trị của $m$.]
  ),
  loigiai: [
    #step([Số trung bình])
    $overline(x) = (1 + 3 + 5 + 7 + m) / 5 = (16 + m) / 5$. Mệnh đề a ĐÚNG.

    #step([Cực trị phương sai theo m])
    Tổng bình phương: $sum x_i^2 - 5(overline(x))^2 = (1 + 9 + 25 + 49 + m^2) - 5((16+m)/5)^2 = (84 + m^2) - (256 + 32m + m^2)/5 = (4m^2)/5 - (32m)/5 + 84 - 51.2 = 4/5 m^2 - 32/5 m + 32.8$.
    Đạt cực tiểu tại $m = -(-32/5) / (2 dot 4/5) = 32 / 8 = 4$. Mệnh đề b ĐÚNG.

    #step([Phương sai nhỏ nhất])
    Khi $m = 4$: $overline(x) = 20 / 5 = 4$.
    Các số: $1, 3, 4, 5, 7$.
    $s^2 = ((1-4)^2 + (3-4)^2 + (4-4)^2 + (5-4)^2 + (7-4)^2) / 5 = (9 + 1 + 0 + 1 + 9) / 5 = 20 / 5 = 4.0$. Mệnh đề c ĐÚNG.

    #step([Trung vị])
    Nếu $m = 0$, mẫu sắp xếp: $0; 1; 3; 5; 7 => M_e = 3 != 5$.
    Do đó trung vị không phải luôn bằng $5$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tính phương sai từ tổng bình phương)
#tln([Một mẫu số liệu gồm $n = 6$ quan sát có tổng các giá trị $sum_(i=1)^6 x_i = 36$ và tổng các bình phương $sum_(i=1)^6 x_i^2 = 276$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [10],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = 36 / 6 = 6 $
        
        #step([Tính phương sai])
        $ s^2 = 1/6 sum_(i=1)^6 x_i^2 - (overline(x))^2 = 276 / 6 - 6^2 = 46 - 36 = 10 $
    ]
)

// TLN 2 (Khoảng tứ phân vị)
#tln([Khảo sát thời gian di chuyển (phút) đến cơ quan của $10$ nhân viên:
#align(center)[
  $15; quad 20; quad 25; quad 30; quad 35; quad 40; quad 45; quad 50; quad 55; quad 70$
]
Tìm khoảng tứ phân vị $Delta_Q$ của mẫu số liệu trên.],
    [25],
    loigiai: [
        #step([Xác định Q1 và Q3])
        $n = 10$, các số đã sắp xếp tăng dần:
        - Nửa dưới gồm $5$ số: $15; 20; 25; 30; 35 => Q_1 = 25$.
        - Nửa trên gồm $5$ số: $40; 45; 50; 55; 70 => Q_3 = 50$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 50 - 25 = 25 text(" phút") $
    ]
)

// TLN 3 (Tìm m để số trung bình bằng một số)
#tln([Cho mẫu số liệu gồm $4$ số: $2; quad 5; quad 8; quad x$.
Biết rằng phương sai của mẫu số liệu đạt giá trị nhỏ nhất khi $x$ bằng số trung bình cộng của $3$ số còn lại. Tìm giá trị của $x$.],
    [5],
    loigiai: [
        #step([Giá trị tối ưu của x])
        Tổng bình phương độ lệch của mẫu $x_1, x_2, dots, x_(n-1), x$ đạt giá trị nhỏ nhất khi phần tử bổ sung $x$ đúng bằng trung bình cộng của các phần tử ban đầu:
        $ x = (2 + 5 + 8) / 3 = 15 / 3 = 5 $
    ]
)

// TLN 4 (Hệ số biến thiên CV)
#tln([Một mẫu số liệu thống kê doanh số bán hàng có số trung bình $overline(x) = 80$ triệu đồng và độ lệch chuẩn $s = 6$ triệu đồng.
Tính hệ số biến thiên $C V = s / overline(x) dot 100%$ của doanh số (theo đơn vị %).],
    [7.5],
    loigiai: [
        #step([Tính hệ số biến thiên])
        $ C V = 6 / 80 dot 100% = 7.5% $
        Hệ số biến thiên bằng $7.5%$.
    ]
)

// TLN 5 (Ngưỡng trên ngoại lệ)
#tln([Một mẫu số liệu đo đạc có tứ phân vị thứ nhất $Q_1 = 40$ và tứ phân vị thứ ba $Q_3 = 60$.
Tìm giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ để phát hiện các giá trị bất thường lớn hơn ngưỡng này.],
    [90],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 60 - 40 = 20 $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 60 + 1.5(20) = 60 + 30 = 90 $
    ]
)

// TLN 6 (Độ lệch chuẩn sau biến đổi tuyến tính)
#tln([Cho mẫu số liệu $x_1, x_2, dots, x_n$ có phương sai $s_x^2 = 16$.
Ta lập mẫu số liệu mới bằng công thức $y_i = -3 x_i + 15$.
Tính độ lệch chuẩn $s_y$ của mẫu số liệu mới.],
    [12],
    loigiai: [
        #step([Độ lệch chuẩn ban đầu])
        $ s_x = sqrt(s_x^2) = sqrt(16) = 4 $
        
        #step([Tính độ lệch chuẩn mới])
        $ s_y = |-3| dot s_x = 3 dot 4 = 12 $
    ]
)

] // end make-questions

#make-questions()
