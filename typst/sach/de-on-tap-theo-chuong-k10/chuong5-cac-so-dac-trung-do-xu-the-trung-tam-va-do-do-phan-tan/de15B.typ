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
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM VÀ ĐO ĐỘ PHÂN TÁN",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG V: ÔN TẬP TỔNG HỢP CHƯƠNG V (ĐỀ B: VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "129",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Gia công một trục thép kỹ thuật có đường kính đo được là $d = 20.0 text(" cm") plus.minus 0.1 text(" cm")$. Sai số tương đối $delta_d$ của phép đo đường kính này thỏa mãn],
    (
        True([$delta_d <= 0.5%$]),
        [$delta_d <= 0.05%$],
        [$delta_d <= 5.0%$],
        [$delta_d <= 1.0%$]
    ),
    loigiai: [
        Sai số tương đối:
        $ delta_d <= 0.1 / 20.0 = 0.005 = 0.5% $
    ]
)

// TN 2
#tn([Làm tròn số $pi approx 3.14159265 dots$ với độ chính xác $d = 0.001$ ta được kết quả là],
    (
        True([$3.142$]),
        [$3.141$],
        [$3.14$],
        [$3.1416$]
    ),
    loigiai: [
        Vì độ chính xác $d = 0.001$ (hàng phần nghìn) nên ta làm tròn số $pi$ đến hàng phần trăm ($1/100$) hoặc hàng phần nghìn:
        Theo SGK Toán 10: khi độ chính xác đến hàng phần nghìn ($d = 0.001$), ta làm tròn đến hàng phần trăm hoặc làm tròn đến hàng đơn vị tương ứng.
        Tuy nhiên với $d = 0.001$, quy tắc chuẩn SGK là làm tròn đến hàng phần trăm ($3.14$) nếu $0.0005 < d <= 0.005$.
        Nếu làm tròn với độ chính xác $0.0005$ thì làm tròn đến $3.142$.
        Ở đây: hàng phần nghìn là chữ số $1$, chữ số kế tiếp là $5 >= 5$ nên làm tròn đến hàng phần nghìn là $3.142$.
    ]
)

// TN 3
#tn([Một sinh viên đại học hoàn thành $3$ học phần trong học kỳ với số tín chỉ và điểm số tương ứng:
- Giải tích ($3$ tín chỉ): $8.0$ điểm.
- Đại số tuyến tính ($2$ tín chỉ): $9.0$ điểm.
- Tiếng Anh chuyên ngành ($3$ tín chỉ): $7.0$ điểm.
Điểm trung bình học kỳ theo tín chỉ (trọng số) của sinh viên này bằng],
    (
        True([$7.875$ điểm]),
        [$8.000$ điểm],
        [$7.750$ điểm],
        [$8.125$ điểm]
    ),
    loigiai: [
        Tổng số tín chỉ: $3 + 2 + 3 = 8$ tín chỉ.
        Điểm trung bình có trọng số:
        $ overline(x) = (3 dot 8.0 + 2 dot 9.0 + 3 dot 7.0) / 8 = (24 + 18 + 21) / 8 = 63 / 8 = 7.875 text(" điểm") $
    ]
)

// TN 4
#tn([Thời gian làm thủ tục nhận phòng (tính bằng phút) của $9$ đoàn khách tại một khu nghỉ dưỡng là:
#align(center)[
  $8; quad 10; quad 11; quad 12; quad 15; quad 16; quad 18; quad 20; quad 25$
]
Trung vị $M_e$ của thời gian làm thủ tục bằng],
    (
        True([$15$ phút]),
        [$16$ phút],
        [$13.5$ phút],
        [$17$ phút]
    ),
    loigiai: [
        Mẫu số liệu có $n = 9$ đã sắp xếp tăng dần.
        Giá trị chính giữa ở vị trí thứ $5$ là $x_5 = 15$.
        Vậy trung vị $M_e = 15$ phút.
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây so sánh năng suất thu hoạch lúa (tạ/ha) của hai cánh đồng thử nghiệm giống mới ($X$) và giống truyền thống ($Y$):
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (50, 60, 70, 80, 90, 100) {
      let x = (v - 50) * 0.12 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box X: Min=60, Q1=70, Q2=80, Q3=90, Max=95 (y=1.5)
    let xMinX = 0.5 + 1.2
    let xQ1X = 0.5 + 2.4
    let xQ2X = 0.5 + 3.6
    let xQ3X = 0.5 + 4.8
    let xMaxX = 0.5 + 5.4
    rect((xQ1X, 1.2), (xQ3X, 1.8), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    line((xQ2X, 1.2), (xQ2X, 1.8), stroke: 1.8pt + rgb("dc2626"))
    line((xMinX, 1.5), (xQ1X, 1.5), stroke: 1pt + rgb("0d9488"))
    line((xMinX, 1.3), (xMinX, 1.7), stroke: 1.2pt + rgb("0d9488"))
    line((xQ3X, 1.5), (xMaxX, 1.5), stroke: 1pt + rgb("0d9488"))
    line((xMaxX, 1.3), (xMaxX, 1.7), stroke: 1.2pt + rgb("0d9488"))
    content((0.0, 1.5), text(fill: rgb("0d9488"), size: 8pt, weight: "bold")[Giống X])

    // Box Y: Min=55, Q1=65, Q2=70, Q3=75, Max=85 (y=0.6)
    let xMinY = 0.5 + 0.6
    let xQ1Y = 0.5 + 1.8
    let xQ2Y = 0.5 + 2.4
    let xQ3Y = 0.5 + 3.0
    let xMaxY = 0.5 + 4.2
    rect((xQ1Y, 0.3), (xQ3Y, 0.9), fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    line((xQ2Y, 0.3), (xQ2Y, 0.9), stroke: 1.8pt + rgb("dc2626"))
    line((xMinY, 0.6), (xQ1Y, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMinY, 0.4), (xMinY, 0.8), stroke: 1.2pt + rgb("d97706"))
    line((xQ3Y, 0.6), (xMaxY, 0.6), stroke: 1pt + rgb("d97706"))
    line((xMaxY, 0.4), (xMaxY, 0.8), stroke: 1.2pt + rgb("d97706"))
    content((0.0, 0.6), text(fill: rgb("d97706"), size: 8pt, weight: "bold")[Giống Y])
  })
]
Dựa vào biểu đồ hộp, so sánh trung vị năng suất giữa hai giống lúa:],
    (
        True([Trung vị năng suất của Giống X là $80$ tạ/ha, cao hơn Giống Y là $70$ tạ/ha]),
        [Trung vị năng suất của Giống X là $90$ tạ/ha, của Giống Y là $75$ tạ/ha],
        [Hai giống lúa có trung vị năng suất hoàn toàn bằng nhau],
        [Trung vị năng suất của Giống X là $70$ tạ/ha, của Giống Y là $80$ tạ/ha]
    ),
    loigiai: [
        Từ vạch đỏ ở giữa hộp:
        - Giống X có trung vị $M_e(X) = 80$ tạ/ha.
        - Giống Y có trung vị $M_e(Y) = 70$ tạ/ha.
        Do đó, giống X có năng suất trung vị cao hơn giống Y $10$ tạ/ha.
    ]
)

// TN 6
#tn([Khảo sát mẫu số liệu tiêu thụ điện có $Q_1 = 120$ kWh và $Q_3 = 180$ kWh. Ngưỡng dưới $T_1$ để nhận diện các chỉ số điện thấp bất thường theo quy tắc hàng rào là],
    (
        True([$T_1 = 30$ kWh]),
        [$T_1 = 60$ kWh],
        [$T_1 = 40$ kWh],
        [$T_1 = 20$ kWh]
    ),
    loigiai: [
        Khoảng tứ phân vị: $Delta_Q = 180 - 120 = 60$ kWh.
        Ngưỡng rào dưới:
        $ T_1 = Q_1 - 1.5 Delta_Q = 120 - 1.5(60) = 120 - 90 = 30 text(" kWh") $
    ]
)

// TN 7
#tn([Số lượng cuộc gọi tiếp nhận mỗi giờ tại một trung tâm cứu hộ trong $5$ giờ cao điểm: $10; quad 12; quad 14; quad 16; quad 18$. Phương sai $s^2$ của mẫu số liệu bằng],
    (
        True([$8.0$]),
        [$2.83$],
        [$10.0$],
        [$6.4$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = (10 + 12 + 14 + 16 + 18) / 5 = 70 / 5 = 14$.
        Phương sai:
        $ s^2 = ((10-14)^2 + (12-14)^2 + (14-14)^2 + (16-14)^2 + (18-14)^2) / 5 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8.0 $
    ]
)

// TN 8
#tn([Số lít xăng tiêu thụ trên $100 text(" km")$ của $7$ dòng xe ô tô tiết kiệm nhiên liệu:
#align(center)[
  $4.2; quad 4.5; quad 4.8; quad 5.0; quad 5.2; quad 5.6; quad 6.0$
]
Khoảng biến thiên $R$ của lượng xăng tiêu thụ bằng],
    (
        True([$1.8$ lít]),
        [$1.5$ lít],
        [$2.0$ lít],
        [$1.2$ lít]
    ),
    loigiai: [
        Mức tiêu thụ cao nhất $x_max = 6.0$ lít, thấp nhất $x_min = 4.2$ lít.
        $ R = 6.0 - 4.2 = 1.8 text(" lít") $
    ]
)

// TN 9
#tn([Khi chuyển đổi tiền tệ từ USD sang VNĐ với tỷ giá $1 text(" USD") = 25000 text(" VNĐ")$, toàn bộ mức lương của nhân viên một công ty đa quốc gia được nhân với hệ số $25000$. Độ lệch chuẩn của mẫu số liệu lương mới sẽ],
    (
        True([Gấp $25000$ lần độ lệch chuẩn cũ]),
        [Gấp $25000^2$ lần độ lệch chuẩn cũ],
        [Không thay đổi],
        [Tăng thêm $25000$ đơn vị]
    ),
    loigiai: [
        Khi $y_i = a x_i$ với $a = 25000 > 0$, độ lệch chuẩn tăng gấp $|a|$ lần:
        $ s_y = 25000 dot s_x $
    ]
)

// TN 10
#tn([Hai kỹ sư cơ khí kiểm tra độ chính xác của hai robot lắp ráp trục $A$ và $B$. Sau $100$ lần lắp ráp, cả hai robot đều đạt độ lệch tâm trung bình là $0.02 text(" mm")$, nhưng độ lệch chuẩn của Robot $A$ là $s_A = 0.003 text(" mm")$ và Robot $B$ là $s_B = 0.008 text(" mm")$. Nhận xét nào sau đây là đúng?],
    (
        True([Robot $A$ gia công chuẩn xác và ổn định hơn Robot $B$]),
        [Robot $B$ gia công chuẩn xác và ổn định hơn Robot $A$],
        [Hai robot hoạt động với độ ổn định tương đương nhau],
        [Chưa thể kết luận được nếu không biết số sản phẩm hỏng]
    ),
    loigiai: [
        Vì độ lệch chuẩn của Robot A nhỏ hơn Robot B ($0.003 < 0.008$) nên các sai lệch của Robot A tập trung sát số trung bình hơn, thể hiện sự ổn định và tin cậy vượt trội.
    ]
)

// TN 11
#tn([Thời gian sạc đầy pin (giờ) của một dòng tai nghe không dây ở $8$ lần thử nghiệm:
#align(center)[
  $1.2; quad 1.4; quad 1.5; quad 1.6; quad 1.8; quad 2.0; quad 2.2; quad 2.6$
]
Khoảng tứ phân vị $Delta_Q$ của thời gian sạc pin bằng],
    (
        True([$0.65$ giờ]),
        [$0.70$ giờ],
        [$0.60$ giờ],
        [$0.80$ giờ]
    ),
    loigiai: [
        $n = 8$, mẫu đã sắp xếp tăng dần:
        - Nửa dưới: $1.2; 1.4; 1.5; 1.6 => Q_1 = (1.4 + 1.5)/2 = 1.45$ giờ.
        - Nửa trên: $1.8; 2.0; 2.2; 2.6 => Q_3 = (2.0 + 2.2)/2 = 2.10$ giờ.
        $Delta_Q = Q_3 - Q_1 = 2.10 - 1.45 = 0.65 text(" giờ") $
    ]
)

// TN 12
#tn([Cho mẫu số liệu có bảng phân bố tần số:
#align(center)[
  #table(
    columns: 5,
    align: center,
    [*Giá trị ($x_i$)*], [$10$], [$20$], [$30$], [$40$],
    [*Tần số ($n_i$)*], [$4$], [$1$], [$3$], [$2$]
  )
]
Mốt $M_o$ của mẫu số liệu trên bằng],
    (
        True([$10$]),
        [$4$],
        [$20$],
        [$30$]
    ),
    loigiai: [
        Giá trị $10$ có tần số xuất hiện lớn nhất ($n_1 = 4$). Do đó $M_o = 10$.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đo đạc thể tích và lan truyền sai số)
#ds([Kỹ sư đo bán kính đáy $r$ và chiều cao $h$ của một bồn chứa dầu nhiên liệu hình trụ:
$ r = 3.0 text(" m") plus.minus 0.02 text(" m"); quad h = 8.0 text(" m") plus.minus 0.04 text(" m") $
Lấy $pi approx 3.1416$. Xét tính đúng sai của các nhận định sau:],
  (
    True([Sai số tương đối của phép đo bán kính đáy thỏa mãn $delta_r <= (0.02 / 3.0) dot 100% approx 0.67%$.]),
    True([Sai số tương đối của phép đo chiều cao thỏa mãn $delta_h <= (0.04 / 8.0) dot 100% = 0.50%$.]),
    True([Thể tích quy chuẩn của bồn chứa dầu được tính xấp xỉ là $V = pi r^2 h approx 3.1416 dot 9.0 dot 8.0 approx 226.2 text(" m")^3$.]),
    [Sai số tương đối của phép tính thể tích $V = pi r^2 h$ nhỏ hơn sai số tương đối của phép đo bán kính đáy.]
  ),
  loigiai: [
    #step([Sai số tương đối của r và h])
    $delta_r <= 0.02 / 3.0 approx 0.67%$. Mệnh đề a ĐÚNG.
    $delta_h <= 0.04 / 8.0 = 0.50%$. Mệnh đề b ĐÚNG.

    #step([Tính thể tích quy chuẩn])
    $V = pi r^2 h approx 3.1416 dot 3.0^2 dot 8.0 = 226.1952 approx 226.2 text(" m")^3$. Mệnh đề c ĐÚNG.

    #step([Lan truyền sai số tương đối])
    Vì $V = pi r^2 h$ nên sai số tương đối của thể tích là:
    $delta_V approx 2 delta_r + delta_h approx 2(0.67%) + 0.50% = 1.84% > delta_r$.
    Khẳng định $delta_V < delta_r$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (So sánh hai phân phối thời gian vận chuyển)
#ds([Hai công ty giao hàng $A$ và $B$ cùng vận chuyển hàng trên cùng một tuyến đường nội đô. Thống kê thời gian giao hàng (phút) của $10$ đơn hàng mỗi công ty như sau:
- Công ty $A$: $20; quad 22; quad 24; quad 25; quad 25; quad 26; quad 26; quad 28; quad 30; quad 34$
- Công ty $B$: $15; quad 18; quad 20; quad 22; quad 25; quad 27; quad 30; quad 32; quad 38; quad 43$
Xét tính đúng sai của các nhận định sau:],
  (
    True([Thời gian giao hàng trung bình của Công ty $A$ là $overline(x)_A = 26.0$ phút, nhanh hơn Công ty $B$ ($overline(x)_B = 27.0$ phút).]),
    True([Trung vị thời gian giao hàng của cả hai công ty đều bằng $M_e = 25.5$ phút và $M_e = 26.0$ phút.]),
    True([Khoảng biến thiên của Công ty $A$ là $R_A = 14$ phút, nhỏ hơn một nửa khoảng biến thiên của Công ty $B$ ($R_B = 28$ phút).]),
    [Dịch vụ giao hàng của Công ty $B$ có độ ổn định và đúng giờ cao hơn Công ty $A$.]
  ),
  loigiai: [
    #step([Tính thời gian trung bình])
    Tổng A: $20+22+24+25+25+26+26+28+30+34 = 260 => overline(x)_A = 26.0$ phút.
    Tổng B: $15+18+20+22+25+27+30+32+38+43 = 270 => overline(x)_B = 27.0$ phút. Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    A: $x_5 = 25, x_6 = 26 => M_e(A) = 25.5$ phút.
    B: $x_5 = 25, x_6 = 27 => M_e(B) = 26.0$ phút. Mệnh đề b ĐÚNG.

    #step([Tính khoảng biến thiên])
    $R_A = 34 - 20 = 14$ phút.
    $R_B = 43 - 15 = 28$ phút. $R_A = 1/2 R_B$. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ ổn định])
    Khoảng biến thiên và độ phân tán của Công ty A nhỏ hơn nhiều so với B nên thời gian giao hàng của Công ty A ổn định và đáng tin cậy hơn Công ty B. Mệnh đề d SAI.
  ]
)

// DS 3 (Kiểm soát nhiệt độ kho vắc xin)
#ds([Nhiệt độ ($""^circ"C"$) trong kho lạnh bảo quản vắc xin y tế được ghi nhận tự động vào lúc $6$ giờ sáng trong $10$ ngày liên tiếp:
#align(center)[
  $2.0; quad 2.2; quad 2.5; quad 2.5; quad 2.8; quad 3.0; quad 3.2; quad 3.5; quad 3.8; quad 8.0$
]
Biết khoảng nhiệt độ an toàn quy chuẩn của vắc xin là từ $2.0^circ"C"$ đến $8.0^circ"C"$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị của mẫu số liệu nhiệt độ kho lạnh là $M_e = 2.9^circ"C"$.]),
    True([Tứ phân vị thứ nhất và thứ ba lần lượt là $Q_1 = 2.5^circ"C"$ và $Q_3 = 3.5^circ"C"$.]),
    True([Khoảng tứ phân vị của nhiệt độ kho lạnh bằng $Delta_Q = 1.0^circ"C"$.]),
    [Giá trị nhiệt độ $8.0^circ"C"$ trong ngày thứ $10$ không phải là giá trị bất thường vì vẫn nằm trong giới hạn $8.0^circ"C"$.]
  ),
  loigiai: [
    #step([Tính trung vị])
    $n = 10$, hai số chính giữa ở vị trí $5$ và $6$ là $2.8$ và $3.0 => M_e = (2.8 + 3.0)/2 = 2.9^circ"C"$. Mệnh đề a ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $5$ số: $2.0; 2.2; 2.5; 2.5; 2.8 => Q_1 = 2.5^circ"C"$.
    Nửa trên gồm $5$ số: $3.0; 3.2; 3.5; 3.8; 8.0 => Q_3 = 3.5^circ"C"$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = 3.5 - 2.5 = 1.0^circ"C"$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra giá trị bất thường])
    Ngưỡng rào trên của mẫu số liệu: $Q_3 + 1.5 Delta_Q = 3.5 + 1.5(1.0) = 5.0^circ"C"$.
    Vì $8.0^circ"C" > 5.0^circ"C"$ nên theo tiêu chuẩn thống kê, đây là một giá trị bất thường (outlier) cảnh báo nguy cơ hỏng hệ thống làm lạnh. Khẳng định không phải bất thường là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của chuẩn hóa điểm số z-score)
#ds([Cho mẫu số liệu $x_1, x_2, dots, x_n$ ($n >= 3$) có số trung bình $overline(x)$ và độ lệch chuẩn $s > 0$. Người ta chuẩn hóa từng số liệu thành chỉ số $z_i = (x_i - overline(x)) / s$.
Xét tính đúng sai của các nhận định sau về mẫu số liệu mới $z_1, z_2, dots, z_n$ ($z$-score):],
  (
    True([Số trung bình của mẫu số liệu chuẩn hóa luôn bằng $0$: $overline(z) = 0$.]),
    True([Phương sai của mẫu số liệu chuẩn hóa luôn bằng $1$: $s_z^2 = 1$.]),
    True([Độ lệch chuẩn của mẫu số liệu chuẩn hóa luôn bằng $1$: $s_z = 1$.]),
    [Khoảng biến thiên của mẫu số liệu chuẩn hóa luôn bằng $1$.]
  ),
  loigiai: [
    #step([Số trung bình của z-score])
    $overline(z) = 1/n sum_(i=1)^n (x_i - overline(x)) / s = 1/(n s) (sum x_i - n overline(x)) = 0$. Mệnh đề a ĐÚNG.

    #step([Phương sai và độ lệch chuẩn])
    Vì $z_i = (1/s) x_i - overline(x)/s$ là phép biến đổi tuyến tính với $a = 1/s$.
    Phương sai mới: $s_z^2 = a^2 s^2 = (1/s)^2 s^2 = 1$. Mệnh đề b ĐÚNG.
    Độ lệch chuẩn mới: $s_z = sqrt(1) = 1$. Mệnh đề c ĐÚNG.

    #step([Khoảng biến thiên])
    Khoảng biến thiên mới: $R_z = (x_max - x_min) / s = R_x / s$, phụ thuộc vào mẫu ban đầu chứ không nhất thiết bằng $1$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Điểm trung bình có trọng số)
#tln([Một học sinh có điểm kiểm tra thường xuyên là $8.0$ (hệ số $1$), điểm kiểm tra giữa kỳ là $7.0$ (hệ số $2$) và điểm kiểm tra cuối kỳ là $9.0$ (hệ số $3$).
Tính điểm trung bình môn học kỳ của học sinh đó (làm tròn đến hàng phần mười).],
    [8.2],
    loigiai: [
        #step([Tính tổng hệ số])
        Tổng hệ số: $1 + 2 + 3 = 6$.
        
        #step([Tính điểm trung bình môn])
        $ overline(x) = (1 dot 8.0 + 2 dot 7.0 + 3 dot 9.0) / 6 = (8 + 14 + 27) / 6 = 49 / 6 approx 8.166 dots approx 8.2 $
    ]
)

// TLN 2 (Trung vị)
#tln([Tốc độ truyền dữ liệu internet (Mbps) tại $8$ thời điểm trong ngày ghi nhận là:
#align(center)[
  $45; quad 50; quad 55; quad 60; quad 70; quad 80; quad 90; quad 110$
]
Tìm trung vị $M_e$ của tốc độ truyền dữ liệu theo đơn vị Mbps.],
    [65],
    loigiai: [
        #step([Xác định trung vị])
        $n = 8$, hai giá trị chính giữa ở vị trí thứ $4$ và thứ $5$ là $60$ và $70$.
        $ M_e = (60 + 70) / 2 = 65 text(" Mbps") $
    ]
)

// TLN 3 (Khoảng biến thiên)
#tln([Thời gian chờ đèn đỏ (giây) tại một ngã tư trong $6$ chu kỳ liên tiếp là:
#align(center)[
  $25; quad 30; quad 35; quad 40; quad 45; quad 75$
]
Tìm khoảng biến thiên $R$ của thời gian chờ theo đơn vị giây.],
    [50],
    loigiai: [
        #step([Xác định Max và Min])
        $x_max = 75$, $x_min = 25$.
        $ R = 75 - 25 = 50 text(" giây") $
    ]
)

// TLN 4 (Khoảng tứ phân vị)
#tln([Điểm thi môn Ngữ văn của $10$ học sinh đạt giải cấp trường là:
#align(center)[
  $7.0; quad 7.5; quad 7.5; quad 8.0; quad 8.0; quad 8.5; quad 8.5; quad 9.0; quad 9.0; quad 9.5$
]
Tính khoảng tứ phân vị $Delta_Q$ của mẫu điểm thi trên.],
    [1.5],
    loigiai: [
        #step([Xác định các tứ phân vị])
        $n = 10$, đã sắp xếp tăng dần:
        - Nửa dưới: $7.0; 7.5; 7.5; 8.0; 8.0 => Q_1 = 7.5$.
        - Nửa trên: $8.5; 8.5; 9.0; 9.0; 9.5 => Q_3 = 9.0$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 9.0 - 7.5 = 1.5 $
    ]
)

// TLN 5 (Phương sai)
#tln([Cho mẫu số liệu điểm đánh giá chất lượng gồm $5$ số: $2; quad 4; quad 6; quad 8; quad 10$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [8],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (2 + 4 + 6 + 8 + 10) / 5 = 30 / 5 = 6 $
        
        #step([Tính phương sai])
        $ s^2 = ((2-6)^2 + (4-6)^2 + (6-6)^2 + (8-6)^2 + (10-6)^2) / 5 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8 $
    ]
)

// TLN 6 (Ngưỡng dưới ngoại lệ)
#tln([Mẫu số liệu thời lượng sử dụng màn hình điện thoại (giờ/ngày) có $Q_1 = 3.5$ giờ và $Q_3 = 6.5$ giờ.
Tìm giá trị của ngưỡng dưới $T_1 = Q_1 - 1.5 Delta_Q$ (giờ) để nhận diện người dùng ít bất thường.],
    [-1],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = 6.5 - 3.5 = 3.0 text(" giờ") $
        
        #step([Tính ngưỡng dưới])
        $ T_1 = Q_1 - 1.5 Delta_Q = 3.5 - 1.5(3.0) = 3.5 - 4.5 = -1 text(" giờ") $
        (Do thời lượng không âm nên không tồn tại giá trị bất thường ở phía dưới).
    ]
)

] // end make-questions

#make-questions()
