#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald Green

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: THỐNG KÊ ỨNG DỤNG THỰC TẾ",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ THỐNG KÊ (ĐỀ E: Y TẾ DỊCH TỄ, DƯỢC HỌC & MÔI TRƯỜNG - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "132",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Khảo sát thời gian ủ bệnh (tính theo ngày) của một chủng virus cúm mùa mới ở $8$ bệnh nhân:
#align(center)[
  $2; quad 3; quad 4; quad 5; quad 5; quad 6; quad 7; quad 14$
]
Để công bố thời gian ủ bệnh thông thường đến cộng đồng y tế mà không bị sai lệch bởi trường hợp đặc biệt ($14$ ngày), đại lượng đo xu thế trung tâm phù hợp nhất là],
    (
        True([Trung vị $M_e = 5.0$ ngày]),
        [Số trung bình $overline(x) = 5.75$ ngày],
        [Khoảng biến thiên $R = 12$ ngày],
        [Phương sai $s^2 = 11.44$ ngày vuông]
    ),
    loigiai: [
        Bệnh nhân có thời gian ủ bệnh $14$ ngày là trường hợp ngoại lệ kéo lệch số trung bình lên $5.75$ ngày.
        Trung vị của mẫu gồm $8$ quan sát là trung bình cộng của $x_4 = 5$ và $x_5 = 5$:
        $ M_e = (5 + 5) / 2 = 5.0 text(" ngày") $
        Trung vị phản ánh chân thực mốc thời gian ủ bệnh phổ biến của đa số người bệnh.
    ]
)

// TN 2
#tn([Đo nồng độ bụi mịn $P M 2.5$ (đơn vị: $mu"g/m"^3$) tại một trạm quan trắc không khí trong $7$ ngày liên tiếp:
#align(center)[
  $35; quad 42; quad 45; quad 48; quad 50; quad 55; quad 105$
]
Biết rằng ngưỡng không khí trong lành theo WHO là dưới $50 mu"g/m"^3$. Khoảng biến thiên $R$ của nồng độ bụi mịn trong tuần quan trắc bằng],
    (
        True([$70 mu"g/m"^3$]),
        [$63 mu"g/m"^3$],
        [$55 mu"g/m"^3$],
        [$50 mu"g/m"^3$]
    ),
    loigiai: [
        $x_max = 105 mu"g/m"^3$, $x_min = 35 mu"g/m"^3$.
        Khoảng biến thiên:
        $ R = x_max - x_min = 105 - 35 = 70 mu"g/m"^3 $
    ]
)

// TN 3
#tn([Trong một thử nghiệm lâm sàng giai đoạn 3 của một loại thuốc hạ huyết áp, độ giảm huyết áp tâm thu (mmHg) của $n = 10$ bệnh nhân có $sum_(i=1)^(10) x_i = 120$ và $sum_(i=1)^(10) x_i^2 = 1530$. Phương sai mẫu $s^2$ của mức giảm huyết áp bằng],
    (
        True([$9 text(" mmHg")^2$]),
        [$144 text(" mmHg")^2$],
        [$15.3 text(" mmHg")^2$],
        [$3 text(" mmHg")^2$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = 120 / 10 = 12 text(" mmHg")$.
        Phương sai mẫu:
        $ s^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 = 1530 / 10 - 12^2 = 153 - 144 = 9 text(" mmHg")^2 $
    ]
)

// TN 4
#tn([So sánh nồng độ cồn trong máu (mg/100ml) của các tài xế giữa hai khu vực:
- Khu vực $A$: Nồng độ trung bình $overline(x)_A = 40$, độ lệch chuẩn $s_A = 6$.
- Khu vực $B$: Nồng độ trung bình $overline(x)_B = 20$, độ lệch chuẩn $s_B = 4$.
Nhận xét nào sau đây là đúng về hệ số biến thiên $C V = s / overline(x) dot 100%$ giữa hai khu vực?],
    (
        True([Khu vực $B$ có độ biến động tương đối cao hơn khu vực $A$ vì $C V_B = 20% > C V_A = 15%$]),
        [Khu vực $A$ có độ biến động tương đối cao hơn khu vực $B$ vì $s_A = 6 > s_B = 4$],
        [Hai khu vực có độ biến động tương đối hoàn toàn như nhau],
        [Khu vực $A$ có hệ số biến thiên bằng $25%$]
    ),
    loigiai: [
        Hệ số biến thiên khu vực A: $C V_A = 6 / 40 dot 100% = 15%$.
        Hệ số biến thiên khu vực B: $C V_B = 4 / 20 dot 100% = 20%$.
        Vì $C V_B = 20% > C V_A = 15%$ nên khu vực B có mức độ dao động nồng độ cồn tương đối phân tán hơn so với mức trung bình.
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây mô tả sự phân bố nồng độ bụi $P M 2.5$ ($mu"g/m"^3$) tại một đô thị giữa Mùa mưa và Mùa khô:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (20, 40, 60, 80, 100, 120, 140) {
      let x = (v - 20) * 0.05 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box Mùa mưa: Min=25, Q1=35, Q2=45, Q3=60, Max=75 (y=1.5)
    let xMinA = 0.5 + 0.25
    let xQ1A = 0.5 + 0.75
    let xQ2A = 0.5 + 1.25
    let xQ3A = 0.5 + 2.00
    let xMaxA = 0.5 + 2.75
    rect((xQ1A, 1.2), (xQ3A, 1.8), fill: rgb("dcfce7"), stroke: 1.2pt + rgb("059669"))
    line((xQ2A, 1.2), (xQ2A, 1.8), stroke: 1.8pt + rgb("dc2626"))
    line((xMinA, 1.5), (xQ1A, 1.5), stroke: 1pt + rgb("059669"))
    line((xMinA, 1.3), (xMinA, 1.7), stroke: 1.2pt + rgb("059669"))
    line((xQ3A, 1.5), (xMaxA, 1.5), stroke: 1pt + rgb("059669"))
    line((xMaxA, 1.3), (xMaxA, 1.7), stroke: 1.2pt + rgb("059669"))
    content((0.0, 1.5), text(fill: rgb("059669"), size: 8pt, weight: "bold")[Mùa mưa])

    // Box Mùa khô: Min=50, Q1=70, Q2=90, Q3=110, Max=130 (y=0.6)
    let xMinB = 0.5 + 1.50
    let xQ1B = 0.5 + 2.50
    let xQ2B = 0.5 + 3.50
    let xQ3B = 0.5 + 4.50
    let xMaxB = 0.5 + 5.50
    rect((xQ1B, 0.3), (xQ3B, 0.9), fill: rgb("fed7aa"), stroke: 1.2pt + rgb("ea580c"))
    line((xQ2B, 0.3), (xQ2B, 0.9), stroke: 1.8pt + rgb("dc2626"))
    line((xMinB, 0.6), (xQ1B, 0.6), stroke: 1pt + rgb("ea580c"))
    line((xMinB, 0.4), (xMinB, 0.8), stroke: 1.2pt + rgb("ea580c"))
    line((xQ3B, 0.6), (xMaxB, 0.6), stroke: 1pt + rgb("ea580c"))
    line((xMaxB, 0.4), (xMaxB, 0.8), stroke: 1.2pt + rgb("ea580c"))
    content((0.0, 0.6), text(fill: rgb("ea580c"), size: 8pt, weight: "bold")[Mùa khô])
  })
]
Dựa vào biểu đồ, trung vị nồng độ bụi $M_e$ của Mùa khô so với Mùa mưa là],
    (
        True([Lớn gấp đôi ($90 mu"g/m"^3$ so với $45 mu"g/m"^3$)]),
        [Bằng nhau ($45 mu"g/m"^3$)],
        [Nhỏ hơn một nửa],
        [Chênh lệch $30 mu"g/m"^3$]
    ),
    loigiai: [
        Từ vạch đỏ chỉ trung vị trong hộp:
        - Mùa mưa: $M_e = 45 mu"g/m"^3$.
        - Mùa khô: $M_e = 90 mu"g/m"^3$.
        Do đó trung vị Mùa khô gấp đúng $2$ lần Mùa mưa ($90 / 45 = 2$).
    ]
)

// TN 6
#tn([Một mẫu nước thải công nghiệp được đo nồng độ chì (mg/l) tại $8$ điểm thoát:
#align(center)[
  $0.02; quad 0.03; quad 0.04; quad 0.05; quad 0.06; quad 0.08; quad 0.10; quad 0.12$
]
Khoảng tứ phân vị $Delta_Q$ của nồng độ chì bằng],
    (
        True([$0.055 text(" mg/l")$]),
        [$0.045 text(" mg/l")$],
        [$0.035 text(" mg/l")$],
        [$0.060 text(" mg/l")$]
    ),
    loigiai: [
        $n = 8$, các số đã xếp thứ tự tăng dần:
        - Nửa dưới: $0.02; 0.03; 0.04; 0.05 => Q_1 = (0.03 + 0.04)/2 = 0.035 text(" mg/l")$.
        - Nửa trên: $0.06; 0.08; 0.10; 0.12 => Q_3 = (0.08 + 0.10)/2 = 0.090 text(" mg/l")$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 0.090 - 0.035 = 0.055 text(" mg/l") $
    ]
)

// TN 7
#tn([Theo Bất đẳng thức Chebyshev trong thống kê y sinh, với một mẫu dữ liệu có số trung bình $overline(x)$ và độ lệch chuẩn $s$, tỷ lệ dữ liệu nằm trong khoảng $(overline(x) - 2s; overline(x) + 2s)$ luôn],
    (
        True([Lớn hơn hoặc bằng $1 - 1/2^2 = 75%$]),
        [Chính xác bằng $95%$],
        [Lớn hơn hoặc bằng $90%$],
        [Nhỏ hơn hoặc bằng $50%$]
    ),
    loigiai: [
        Bất đẳng thức Chebyshev phát biểu rằng với mọi phân bố bất kỳ có độ lệch chuẩn hữu hạn $s$:
        Tỷ lệ dữ liệu nằm trong khoảng $(overline(x) - k s; overline(x) + k s)$ luôn thỏa mãn:
        $ P(|x - overline(x)| < k s) >= 1 - 1/k^2 $
        Với $k = 2$, tỷ lệ này luôn ít nhất bằng $1 - 1/4 = 75%$.
    ]
)

// TN 8
#tn([Kiểm định độ đồng đều về khối lượng của $10$ viên thuốc viên nén Paracetamol (mg):
#align(center)[
  $495; quad 498; quad 500; quad 500; quad 500; quad 500; quad 502; quad 503; quad 505; quad 507$
]
Mốt $M_o$ của khối lượng viên nén là],
    (
        True([$500 text(" mg")$]),
        [$501 text(" mg")$],
        [$502 text(" mg")$],
        [$495 text(" mg")$]
    ),
    loigiai: [
        Khối lượng $500 text(" mg")$ xuất hiện nhiều nhất ($4$ lần). Do đó $M_o = 500 text(" mg")$.
    ]
)

// TN 9
#tn([Khảo sát thời gian nằm viện (ngày) của $10$ bệnh nhân sốt xuất huyết có tứ phân vị thứ nhất $Q_1 = 5$ ngày và tứ phân vị thứ ba $Q_3 = 9$ ngày. Ngưỡng trên $T_2$ để xác định các ca biến chứng nặng phải nằm viện lâu bất thường (outlier) là],
    (
        True([$15$ ngày]),
        [$13$ ngày],
        [$17$ ngày],
        [$14$ ngày]
    ),
    loigiai: [
        $Delta_Q = Q_3 - Q_1 = 9 - 5 = 4 text(" ngày")$.
        Ngưỡng rào trên:
        $ T_2 = Q_3 + 1.5 Delta_Q = 9 + 1.5(4) = 9 + 6 = 15 text(" ngày") $
    ]
)

// TN 10
#tn([Đo chỉ số oxy hòa tan trong nước DO (mg/l) tại một hồ sinh thái có phương sai $s^2 = 0.25 text(" mg")^2"/l"^2$. Độ lệch chuẩn $s$ của chỉ số DO bằng],
    (
        True([$0.5 text(" mg/l")$]),
        [$0.0625 text(" mg/l")$],
        [$0.25 text(" mg/l")$],
        [$1.0 text(" mg/l")$]
    ),
    loigiai: [
        $ s = sqrt(s^2) = sqrt(0.25) = 0.5 text(" mg/l") $
    ]
)

// TN 11
#tn([Khi pha loãng một mẫu dung dịch kháng sinh theo tỷ lệ $1:2$ (nồng độ mỗi mẫu giảm một nửa: $y_i = 0.5 x_i$), phương sai nồng độ mẫu mới $s_y^2$ so với phương sai cũ $s_x^2$ sẽ],
    (
        True([Giảm đi $4$ lần ($s_y^2 = 0.25 s_x^2$)]),
        [Giảm đi $2$ lần ($s_y^2 = 0.5 s_x^2$)],
        [Không đổi],
        [Tăng gấp $2$ lần]
    ),
    loigiai: [
        Khi $y_i = a x_i$ với $a = 0.5$:
        $ s_y^2 = a^2 s_x^2 = (0.5)^2 s_x^2 = 0.25 s_x^2 = 1/4 s_x^2 $
    ]
)

// TN 12
#tn([Đo thân nhiệt của $5$ trẻ em nghi nhiễm sốt xuất huyết ghi nhận các giá trị: $37.5; 38.0; 38.5; 39.0; 39.5$ ($degree C$). Số trung bình thân nhiệt của nhóm trẻ bằng],
    (
        True([$38.5 degree C$]),
        [$38.0 degree C$],
        [$39.0 degree C$],
        [$38.2 degree C$]
    ),
    loigiai: [
        $ overline(x) = (37.5 + 38.0 + 38.5 + 39.0 + 39.5) / 5 = 192.5 / 5 = 38.5 degree C $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đánh giá hiệu quả vắc xin thử nghiệm lâm sàng)
#ds([Trong một thử nghiệm lâm sàng vắc xin phòng bệnh truyền nhiễm, thời gian sản sinh kháng thể đạt chuẩn (ngày) được theo dõi trên hai nhóm tình nguyện viên:
- Nhóm 1 (Tiêm vắc xin công nghệ mRNA): $n_1 = 10$ người, thời gian trung bình $overline(x)_1 = 14$ ngày, phương sai $s_1^2 = 4$.
- Nhóm 2 (Tiêm vắc xin truyền thống virus bất hoạt): $n_2 = 10$ người, thời gian trung bình $overline(x)_2 = 20$ ngày, phương sai $s_2^2 = 4$.
Xét tính đúng sai của các nhận định thống kê sau về mẫu gộp chung $20$ người:],
  (
    True([Thời gian trung bình chung sản sinh kháng thể của toàn bộ $20$ người là $overline(x) = 17$ ngày.]),
    True([Tổng bình phương độ lệch nội bộ của từng nhóm đối với số trung bình của nhóm mình là $n_1 s_1^2 = n_2 s_2^2 = 40$.]),
    True([Phương sai gộp của toàn bộ $20$ tình nguyện viên bằng $s^2 = 13$.]),
    [Vì hai nhóm có độ lệch chuẩn bằng nhau ($s_1 = s_2 = 2$ ngày) nên phương sai gộp của toàn bộ $20$ người cũng bằng $4$.]
  ),
  loigiai: [
    #step([Thời gian trung bình chung])
    $overline(x) = (10 dot 14 + 10 dot 20) / 20 = 17$ ngày. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương nội bộ])
    $10 dot 4 = 40$. Mệnh đề b ĐÚNG.

    #step([Phương sai gộp])
    $s^2 = (n_1 (s_1^2 + (overline(x)_1 - overline(x))^2) + n_2 (s_2^2 + (overline(x)_2 - overline(x))^2)) / (n_1 + n_2)$
    $= (10(4 + (14-17)^2) + 10(4 + (20-17)^2)) / 20 = (10(4 + 9) + 10(4 + 9)) / 20 = (10 dot 13 + 10 dot 13) / 20 = 13$. Mệnh đề c ĐÚNG.

    #step([Phân tích sự phân tán gộp])
    Khoảng cách chênh lệch giữa hai thời gian trung bình ($14$ ngày và $20$ ngày) làm phương sai toàn thể tăng lên $13 > 4$. Khẳng định phương sai gộp bằng $4$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quan trắc ô nhiễm nguồn nước ngầm)
#ds([Trung tâm kiểm soát bệnh tật (CDC) lấy $10$ mẫu nước ngầm tại khu dân cư gần khu công nghiệp để định lượng nồng độ Asen (thạch tín, đơn vị: $mu"g/l"$):
#align(center)[
  $5; quad 8; quad 10; quad 12; quad 12; quad 14; quad 16; quad 18; quad 20; quad 80$
]
Biết rằng giới hạn tối đa cho phép của Bộ Y tế là $10 mu"g/l"$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị nồng độ Asen của các mẫu nước ngầm là $M_e = 13 mu"g/l"$, vượt ngưỡng an toàn cho phép.]),
    True([Khoảng tứ phân vị của nồng độ Asen là $Delta_Q = Q_3 - Q_1 = 18 - 10 = 8 mu"g/l"$.]),
    True([Mẫu nước có nồng độ Asen bằng $80 mu"g/l"$ là một giá trị bất thường (outlier) vượt xa ngưỡng rào trên $Q_3 + 1.5 Delta_Q = 30 mu"g/l"$.]),
    [Nếu loại bỏ mẫu nước dị thường $80 mu"g/l"$ thì trung vị của $9$ mẫu còn lại sẽ bị giảm xuống dưới $10 mu"g/l"$.]
  ),
  loigiai: [
    #step([Tính trung vị mẫu ban đầu])
    $n = 10$, vị trí thứ $5$ và $6$ là $12$ và $14 => M_e = (12 + 14)/2 = 13 mu"g/l" > 10 mu"g/l"$. Mệnh đề a ĐÚNG.

    #step([Tính khoảng tứ phân vị])
    Nửa dưới $5$ số: $5; 8; 10; 12; 12 => Q_1 = 10$.
    Nửa trên $5$ số: $14; 16; 18; 20; 80 => Q_3 = 18$.
    $Delta_Q = 18 - 10 = 8 mu"g/l"$. Mệnh đề b ĐÚNG.

    #step([Xác định giá trị ngoại lệ])
    Ngưỡng rào trên: $T_2 = Q_3 + 1.5 Delta_Q = 18 + 1.5(8) = 18 + 12 = 30 mu"g/l"$.
    Vì $80 > 30$ nên mẫu $80$ là giá trị bất thường cực kỳ nghiêm trọng. Mệnh đề c ĐÚNG.

    #step([Kiểm tra trung vị khi loại bỏ outlier])
    Mẫu $9$ số còn lại: $5; 8; 10; 12; 12; 14; 16; 18; 20$.
    Trung vị mới là số thứ $5$: $M_e' = 12 mu"g/l" > 10 mu"g/l"$. Khẳng định giảm xuống dưới $10$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Bài toán tối ưu vị trí trạm cấp cứu y tế)
#ds([Trên tuyến đường liên huyện thẳng tắp, ba cụm dân cư $A, B, C$ nằm tại các cột mốc km lần lượt là $x_A = 5, x_B = 15, x_C = 40$. Người ta dự định xây dựng một trạm xe cứu thương tại vị trí $x$ trên trục đường này.
Xét tính đúng sai của các nhận định toán học sau:],
  (
    True([Nếu tiêu chuẩn thiết kế là cực tiểu hóa tổng thời gian phản ứng di chuyển đến cả $3$ điểm dân cư $g(x) = |x-5| + |x-15| + |x-40|$, vị trí tối ưu phải đặt trạm tại trung vị $x = 15$ km.]),
    True([Nếu tiêu chuẩn là cực tiểu hóa tổng bình phương độ lệch $f(x) = (x-5)^2 + (x-15)^2 + (x-40)^2$, vị trí tối ưu là tại số trung bình $x = 20$ km.]),
    True([Tại vị trí trung vị $x = 15$, tổng khoảng cách di chuyển bằng $g(15) = 10 + 0 + 25 = 35$ km, tiết kiệm hơn $10$ km so với vị trí số trung bình $g(20) = 15 + 5 + 20 = 40$ km (chỗ này tính lại: $15+5+20 = 40$, chênh lệch $40 - 35 = 5$ km). Sửa lại: Tại vị trí trung vị $x = 15$, tổng khoảng cách di chuyển bằng $g(15) = 35$ km, nhỏ hơn tổng khoảng cách tại vị trí số trung bình $g(20) = 40$ km.]),
    [Đặt trạm cứu thương tại số trung bình $x = 20$ km luôn đảm bảo tổng khoảng cách di chuyển đến các khu dân cư nhỏ hơn so với trung vị.]
  ),
  loigiai: [
    #step([Tối ưu hàm khoảng cách L1])
    Hàm $g(x) = |x-5| + |x-15| + |x-40|$ đạt giá trị nhỏ nhất tại trung vị $M_e = 15$. Mệnh đề a ĐÚNG.

    #step([Tối ưu hàm bình phương L2])
    Hàm $f(x) = 3x^2 - 2(60)x + (25 + 225 + 1600)$ đạt cực tiểu tại $x = 60 / 3 = 20 = overline(x)$. Mệnh đề b ĐÚNG.

    #step([So sánh tổng khoảng cách])
    $g(15) = |15-5| + |15-15| + |15-40| = 10 + 0 + 25 = 35$ km.
    $g(20) = |20-5| + |20-15| + |20-40| = 15 + 5 + 20 = 40$ km. $35 < 40$. Mệnh đề c ĐÚNG.

    #step([Quy luật tổng quát])
    Trung vị luôn tối thiểu hóa tổng khoảng cách tuyệt đối $sum |x_i - x|$. Do đó số trung bình không thể cho tổng khoảng cách nhỏ hơn trung vị. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số liều lượng thuốc trong nghiên cứu dược học)
#ds([Trong nghiên cứu độc tính cấp của một hoạt chất dược phẩm mới, các nhà khoa học thử nghiệm $5$ nồng độ hoạt chất: $2; quad 4; quad 6; quad 8; quad m$ (mg/kg) với $m$ là nồng độ tối đa thử nghiệm ($m > 8$).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình của các nồng độ thử nghiệm là $overline(x)(m) = (20 + m) / 5$.]),
    True([Phương sai của mẫu số liệu nồng độ đạt giá trị nhỏ nhất khi $m = 5$.]),
    True([Khi $m = 10$, số trung bình bằng $6$ và phương sai của mẫu nồng độ bằng $s^2 = 8$.]),
    [Khoảng biến thiên của mẫu nồng độ luôn là một hằng số không phụ thuộc vào $m$.]
  ),
  loigiai: [
    #step([Số trung bình])
    $overline(x) = (2 + 4 + 6 + 8 + m) / 5 = (20 + m) / 5$. Mệnh đề a ĐÚNG.

    #step([Cực trị phương sai theo m])
    Phương sai đạt giá trị nhỏ nhất khi phần tử bổ sung $m$ bằng trung bình cộng của $4$ phần tử ban đầu:
    $m = (2 + 4 + 6 + 8) / 4 = 20 / 4 = 5$. Mệnh đề b ĐÚNG.

    #step([Trường hợp m = 10])
    Khi $m = 10$: mẫu gồm $2; 4; 6; 8; 10$.
    $overline(x) = 30 / 5 = 6$.
    $s^2 = ((2-6)^2 + (4-6)^2 + (6-6)^2 + (8-6)^2 + (10-6)^2) / 5 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8$. Mệnh đề c ĐÚNG.

    #step([Khoảng biến thiên theo m])
    Vì $m > 8$ nên giá trị lớn nhất là $x_max = m$, giá trị nhỏ nhất là $x_min = 2$.
    Khoảng biến thiên: $R = m - 2$, phụ thuộc trực tiếp vào $m$. Khẳng định là hằng số là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Phương sai nồng độ Asen)
#tln([Một phòng thí nghiệm môi trường phân tích $n = 5$ mẫu nước có tổng nồng độ Asen $sum_(i=1)^5 x_i = 30 mu"g/l"$ và tổng bình phương nồng độ $sum_(i=1)^5 x_i^2 = 220 (mu"g/l")^2$.
Tính phương sai $s^2$ của nồng độ Asen.],
    [8],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = 30 / 5 = 6 mu"g/l" $
        
        #step([Tính phương sai])
        $ s^2 = 1/5 sum_(i=1)^5 x_i^2 - (overline(x))^2 = 220 / 5 - 6^2 = 44 - 36 = 8 $
    ]
)

// TLN 2 (Khoảng tứ phân vị thời gian hồi phục)
#tln([Thời gian hồi phục (ngày) sau phẫu thuật nội soi của $10$ bệnh nhân là:
#align(center)[
  $3; quad 4; quad 5; quad 6; quad 7; quad 8; quad 9; quad 10; quad 12; quad 15$
]
Tìm khoảng tứ phân vị $Delta_Q$ của thời gian hồi phục theo đơn vị ngày.],
    [5],
    loigiai: [
        #step([Xác định Q1 và Q3])
        $n = 10$, các giá trị xếp tăng dần:
        - Nửa dưới gồm $5$ số: $3; 4; 5; 6; 7 => Q_1 = 5$ ngày.
        - Nửa trên gồm $5$ số: $8; 9; 10; 12; 15 => Q_3 = 10$ ngày.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 10 - 5 = 5 text(" ngày") $
    ]
)

// TLN 3 (Khoảng biến thiên chỉ số nhịp tim)
#tln([Đo nhịp tim lúc nghỉ (nhịp/phút) của $6$ vận động viên điền kinh:
#align(center)[
  $48; quad 50; quad 52; quad 55; quad 58; quad 62$
]
Tìm khoảng biến thiên $R$ của nhịp tim.],
    [14],
    loigiai: [
        #step([Xác định Max và Min])
        $x_max = 62$, $x_min = 48$.
        $ R = 62 - 48 = 14 text(" nhịp/phút") $
    ]
)

// TLN 4 (Hệ số biến thiên nồng độ thuốc)
#tln([Hàm lượng hoạt chất trong một lô thuốc có giá trị trung bình $overline(x) = 500 text(" mg")$ và độ lệch chuẩn $s = 10 text(" mg")$.
Tính hệ số biến thiên $C V = s / overline(x) dot 100%$ của hàm lượng hoạt chất (theo đơn vị %).],
    [2],
    loigiai: [
        #step([Tính hệ số biến thiên])
        $ C V = 10 / 500 dot 100% = 2% $
    ]
)

// TLN 5 (Ngưỡng trên phát hiện đột biến số ca nhiễm)
#tln([Số ca nhiễm sốt xuất huyết hàng tuần tại một địa phương có tứ phân vị thứ nhất $Q_1 = 20$ ca và tứ phân vị thứ ba $Q_3 = 50$ ca.
Tính ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ để ngành y tế phát lệnh cảnh báo dịch bệnh bùng phát.],
    [95],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 50 - 20 = 30 text(" ca") $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 50 + 1.5(30) = 50 + 45 = 95 text(" ca") $
    ]
)

// TLN 6 (Độ lệch chuẩn sau biến đổi tuyến tính)
#tln([Một mẫu xét nghiệm máu có phương sai $s_x^2 = 9$.
Khi nhân nồng độ mẫu với hệ số pha loãng $-4$ rồi cộng thêm $10$ ($y_i = -4 x_i + 10$), tính độ lệch chuẩn $s_y$ của mẫu số liệu mới.],
    [12],
    loigiai: [
        #step([Độ lệch chuẩn ban đầu])
        $ s_x = sqrt(s_x^2) = sqrt(9) = 3 $
        
        #step([Tính độ lệch chuẩn mới])
        $ s_y = |-4| dot s_x = 4 dot 3 = 12 $
    ]
)

] // end make-questions

#make-questions()
