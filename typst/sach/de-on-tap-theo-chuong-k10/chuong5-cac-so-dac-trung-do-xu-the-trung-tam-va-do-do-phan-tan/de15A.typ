#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM VÀ ĐO ĐỘ PHÂN TÁN",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG V: ÔN TẬP TỔNG HỢP CHƯƠNG V (ĐỀ A: CƠ BẢN - VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "128",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Sử dụng máy tính cầm tay tìm giá trị của $sqrt(8) = 2.82842712 dots$. Làm tròn số $sqrt(8)$ với độ chính xác $d = 0.005$ ta được kết quả là],
    (
        True([$2.83$]),
        [$2.82$],
        [$2.828$],
        [$2.8$]
    ),
    loigiai: [
        Vì độ chính xác $d = 0.005$ ở hàng phần nghìn ($1/1000$) nên ta làm tròn số đến hàng phần trăm ($1/100$).
        Chữ số liền sau hàng phần trăm là $8 >= 5$ nên ta cộng thêm $1$ vào chữ số hàng phần trăm:
        $ sqrt(8) approx 2.83 $
    ]
)

// TN 2
#tn([Đo chiều dài của một sân bóng đá tiêu chuẩn thu được kết quả $a = 105 text(" m") plus.minus 0.2 text(" m")$. Đánh giá sai số tương đối $delta_a$ của phép đo này bằng],
    (
        True([$delta_a <= 0.19%$]),
        [$delta_a <= 0.02%$],
        [$delta_a <= 1.9%$],
        [$delta_a <= 0.5%$]
    ),
    loigiai: [
        Sai số tương đối thỏa mãn:
        $ delta_a <= d / (|a|) = 0.2 / 105 approx 0.001905 = 0.19% $
    ]
)

// TN 3
#tn([Điểm kiểm tra giữa kỳ môn Tiếng Anh của $8$ học sinh lần lượt là:
#align(center)[
  $6.0; quad 6.5; quad 7.0; quad 7.5; quad 8.0; quad 8.5; quad 9.0; quad 9.5$
]
Điểm trung bình $overline(x)$ của nhóm học sinh trên bằng],
    (
        True([$7.75$ điểm]),
        [$7.50$ điểm],
        [$8.00$ điểm],
        [$7.85$ điểm]
    ),
    loigiai: [
        Tổng điểm: $6.0 + 6.5 + 7.0 + 7.5 + 8.0 + 8.5 + 9.0 + 9.5 = 62.0$.
        Số trung bình:
        $ overline(x) = 62.0 / 8 = 7.75 text(" điểm") $
    ]
)

// TN 4
#tn([Thời gian tự học ở nhà mỗi ngày (tính bằng phút) của $10$ học sinh ghi nhận như sau:
#align(center)[
  $45; quad 60; quad 60; quad 75; quad 80; quad 90; quad 90; quad 100; quad 120; quad 150$
]
Trung vị $M_e$ của thời gian tự học bằng],
    (
        True([$85$ phút]),
        [$80$ phút],
        [$90$ phút],
        [$87.5$ phút]
    ),
    loigiai: [
        Mẫu có $n = 10$, hai giá trị ở chính giữa tại vị trí thứ $5$ và thứ $6$ là $x_5 = 80$ và $x_6 = 90$.
        Trung vị:
        $ M_e = (80 + 90) / 2 = 85 text(" phút") $
    ]
)

// TN 5
#tn([Khảo sát cỡ giày thể thao của $25$ học sinh nam lớp 10 thu được bảng tần số sau:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Cỡ giày*], [$39$], [$40$], [$41$], [$42$], [$43$],
    [*Tần số*], [$3$], [$6$], [$11$], [$4$], [$1$]
  )
]
Mốt $M_o$ của mẫu số liệu trên bằng],
    (
        True([$41$]),
        [$11$],
        [$40$],
        [$42$]
    ),
    loigiai: [
        Cỡ giày $41$ có tần số xuất hiện lớn nhất ($n = 11$).
        Do đó, mốt của mẫu số liệu là $M_o = 41$.
    ]
)

// TN 6
#tn([Nhiệt độ đo được lúc $12$ giờ trưa trong $7$ ngày liên tiếp tại một trạm quan trắc là:
#align(center)[
  $28^circ"C"; quad 29^circ"C"; quad 30^circ"C"; quad 31^circ"C"; quad 32^circ"C"; quad 33^circ"C"; quad 35^circ"C"$
]
Khoảng biến thiên $R$ của nhiệt độ trong tuần là],
    (
        True([$7^circ"C"$]),
        [$6^circ"C"$]),
        [$8^circ"C"$],
        [$5^circ"C"$]
    ),
    loigiai: [
        Nhiệt độ cao nhất $x_max = 35^circ"C"$, thấp nhất $x_min = 28^circ"C"$.
        Khoảng biến thiên:
        $ R = 35 - 28 = 7^circ"C" $
    ]
)

// TN 7
#tn([Biểu đồ hộp (Box plot) CeTZ dưới đây biểu diễn kết quả điểm thi đánh giá năng lực của một nhóm thí sinh:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (40, 50, 60, 70, 80, 90, 100) {
      let x = (v - 40) * 0.1 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box: Q1 = 55 (x = 2.0), Median Q2 = 70 (x = 3.5), Q3 = 85 (x = 5.0)
    // Min = 45 (x = 1.0), Max = 95 (x = 6.0)
    rect((2.0, 0.4), (5.0, 1.2), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("1e40af"))
    line((3.5, 0.4), (3.5, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((1.0, 0.8), (2.0, 0.8), stroke: 1pt + rgb("1e40af"))
    line((1.0, 0.6), (1.0, 1.0), stroke: 1.2pt + rgb("1e40af"))
    line((5.0, 0.8), (6.0, 0.8), stroke: 1pt + rgb("1e40af"))
    line((6.0, 0.6), (6.0, 1.0), stroke: 1.2pt + rgb("1e40af"))
  })
]
Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu biểu diễn trong biểu đồ hộp bằng],
    (
        True([$30$ điểm]),
        [$15$ điểm],
        [$50$ điểm],
        [$35$ điểm]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - Tứ phân vị thứ nhất: $Q_1 = 55$.
        - Tứ phân vị thứ ba: $Q_3 = 85$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 85 - 55 = 30 text(" điểm") $
    ]
)

// TN 8
#tn([Theo quy tắc hàng rào Tukey, một giá trị $x$ trong mẫu số liệu được coi là giá trị bất thường (outlier) nếu],
    (
        True([$x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$]),
        [$x <= Q_1 - Delta_Q$ hoặc $x >= Q_3 + Delta_Q$],
        [$x < overline(x) - 2s$ hoặc $x > overline(x) + 2s$],
        [$x < Q_1 - 3 Delta_Q$ hoặc $x > Q_3 + 3 Delta_Q$]
    ),
    loigiai: [
        Quy tắc chuẩn SGK: Một giá trị $x$ được gọi là giá trị bất thường nếu $x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$.
    ]
)

// TN 9
#tn([Một mẫu số liệu thống kê thời gian chờ xe buýt có phương sai $s^2 = 25 text(" phút")^2$. Độ lệch chuẩn $s$ của mẫu số liệu bằng],
    (
        True([$5$ phút]),
        [$25$ phút],
        [$12.5$ phút],
        [$625$ phút]
    ),
    loigiai: [
        Độ lệch chuẩn là căn bậc hai số học của phương sai:
        $ s = sqrt(s^2) = sqrt(25) = 5 text(" phút") $
    ]
)

// TN 10
#tn([Hai xạ thủ bắn súng $A$ và $B$ mỗi người thực hiện $10$ phát bắn. Kết quả ghi nhận cả hai cùng có số điểm trung bình là $overline(x) = 9.2$ điểm, nhưng độ lệch chuẩn điểm số của xạ thủ $A$ là $s_A = 0.4$ điểm và xạ thủ $B$ là $s_B = 1.1$ điểm. Khẳng định nào sau đây là đúng?],
    (
        True([Xạ thủ $A$ có phong độ bắn ổn định và đồng đều hơn xạ thủ $B$]),
        [Xạ thủ $B$ có phong độ bắn ổn định hơn xạ thủ $A$],
        [Khả năng bắn của hai xạ thủ hoàn toàn tương đương nhau],
        [Xạ thủ $B$ bắn được nhiều điểm $10$ hơn xạ thủ $A$ trong mọi phát bắn]
    ),
    loigiai: [
        Vì cả hai có cùng điểm trung bình nhưng $s_A = 0.4 < s_B = 1.1$ nên điểm số của xạ thủ $A$ ít phân tán hơn, phản ánh phong độ thi đấu ổn định và đều tay hơn xạ thủ $B$.
    ]
)

// TN 11
#tn([Nếu tất cả các giá trị của một mẫu số liệu đều được cộng thêm một số thực $c = 10$, khẳng định nào sau đây là sai?],
    (
        True([Độ lệch chuẩn của mẫu số liệu mới tăng thêm $10$ đơn vị]),
        [Số trung bình của mẫu số liệu mới tăng thêm $10$ đơn vị],
        [Trung vị của mẫu số liệu mới tăng thêm $10$ đơn vị],
        [Khoảng biến thiên của mẫu số liệu mới không đổi]
    ),
    loigiai: [
        Khi tịnh tiến tất cả các giá trị một khoảng $c = 10$, độ phân tán của mẫu số liệu không hề thay đổi: độ lệch chuẩn và khoảng biến thiên giữ nguyên.
        Khẳng định "độ lệch chuẩn tăng thêm $10$" là SAI.
    ]
)

// TN 12
#tn([Cho mẫu số liệu gồm $4$ giá trị: $2; quad 4; quad 6; quad 8$. Phương sai $s^2$ của mẫu số liệu bằng],
    (
        True([$5$]),
        [$4$],
        [$2.24$],
        [$6$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = (2 + 4 + 6 + 8) / 4 = 20 / 4 = 5$.
        Phương sai:
        $ s^2 = ((2-5)^2 + (4-5)^2 + (6-5)^2 + (8-5)^2) / 4 = (9 + 1 + 1 + 9) / 4 = 20 / 4 = 5 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Sai số và đo đạc thực địa)
#ds([Kỹ sư trắc địa đo chiều dài $a$ và chiều rộng $b$ của một khu đất hình chữ nhật thu được kết quả:
$ a = 80 text(" m") plus.minus 0.2 text(" m"); quad b = 50 text(" m") plus.minus 0.1 text(" m") $
Xét tính đúng sai của các nhận định sau:],
  (
    True([Giá trị đúng của chiều dài khu đất thuộc đoạn $[79.8; 80.2]$ (đơn vị: mét).]),
    True([Sai số tương đối của phép đo chiều dài thỏa mãn $delta_a <= 0.25%$.]),
    True([Chu vi quy chuẩn của khu đất được ước lượng là $P = 2(a + b) = 260 text(" m")$ với sai số tuyệt đối không vượt quá $Delta_P <= 0.6 text(" m")$.]),
    [Diện tích khu đất được ước lượng là $S = 4000 text(" m")^2$ với sai số tuyệt đối không vượt quá $Delta_S <= 0.02 text(" m")^2$.]
  ),
  loigiai: [
    #step([Khoảng giá trị đúng])
    $overline(a) in [80 - 0.2; 80 + 0.2] = [79.8; 80.2]$. Mệnh đề a ĐÚNG.

    #step([Sai số tương đối])
    $delta_a <= 0.2 / 80 = 0.0025 = 0.25%$. Mệnh đề b ĐÚNG.

    #step([Sai số của chu vi])
    $P = 2(a + b) = 2(80 + 50) = 260 text(" m")$.
    $Delta_P <= 2(d_a + d_b) = 2(0.2 + 0.1) = 0.6 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Sai số của diện tích])
    $S = a b = 80 dot 50 = 4000 text(" m")^2$.
    Sai số tương đối của tích: $delta_S approx delta_a + delta_b = 0.2/80 + 0.1/50 = 0.0025 + 0.002 = 0.0045$.
    Sai số tuyệt đối: $Delta_S <= S dot delta_S = 4000 dot 0.0045 = 18 text(" m")^2 >> 0.02 text(" m")^2$. Mệnh đề d SAI.
  ]
)

// DS 2 (So sánh hai phân phối điểm học tập)
#ds([Thống kê điểm bài thi đánh giá năng lực Toán của hai lớp 10A và 10B (mỗi lớp có $10$ học sinh đại diện) như sau:
- Lớp 10A: $6.0; quad 6.5; quad 7.0; quad 7.5; quad 8.0; quad 8.0; quad 8.5; quad 9.0; quad 9.5; quad 10.0$
- Lớp 10B: $7.0; quad 7.5; quad 7.5; quad 8.0; quad 8.0; quad 8.0; quad 8.5; quad 8.5; quad 9.0; quad 9.0$
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai lớp 10A và 10B đều có điểm số trung bình bằng nhau và bằng $overline(x) = 8.0$ điểm.]),
    True([Trung vị của cả hai lớp đều bằng $M_e = 8.0$ điểm.]),
    True([Khoảng biến thiên của Lớp 10A là $R_A = 4.0$ điểm, lớn gấp đôi khoảng biến thiên của Lớp 10B ($R_B = 2.0$ điểm).]),
    [Điểm số của học sinh Lớp 10A có độ phân tán nhỏ hơn và đồng đều hơn Lớp 10B.]
  ),
  loigiai: [
    #step([Tính điểm trung bình])
    Tổng 10A: $6.0 + 6.5 + 7.0 + 7.5 + 8.0 + 8.0 + 8.5 + 9.0 + 9.5 + 10.0 = 80.0 => overline(x)_A = 8.0$.
    Tổng 10B: $7.0 + 7.5 + 7.5 + 8.0 + 8.0 + 8.0 + 8.5 + 8.5 + 9.0 + 9.0 = 80.0 => overline(x)_B = 8.0$. Mệnh đề a ĐÚNG.

    #step([Tính trung vị])
    10A: Hai số chính giữa $x_5 = 8.0, x_6 = 8.0 => M_e(A) = 8.0$.
    10B: Hai số chính giữa $x_5 = 8.0, x_6 = 8.0 => M_e(B) = 8.0$. Mệnh đề b ĐÚNG.

    #step([Tính khoảng biến thiên])
    $R_A = 10.0 - 6.0 = 4.0$ điểm.
    $R_B = 9.0 - 7.0 = 2.0$ điểm. $R_A = 2 R_B$. Mệnh đề c ĐÚNG.

    #step([Đánh giá độ phân tán])
    Lớp 10B có khoảng biến thiên hẹp hơn ($2.0 < 4.0$), các số liệu tập trung quanh điểm $8$ hơn nên lớp 10B đồng đều hơn lớp 10A. Mệnh đề d SAI.
  ]
)

// DS 3 (Kiểm tra chất lượng và giá trị ngoại lệ)
#ds([Khối lượng (gam) của $10$ gói kẹo đóng tự động ghi nhận trong một mẻ sản xuất:
#align(center)[
  $95; quad 98; quad 99; quad 100; quad 100; quad 101; quad 101; quad 102; quad 104; quad 120$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tứ phân vị thứ nhất của khối lượng các gói kẹo là $Q_1 = 99" g"$.]),
    True([Tứ phân vị thứ ba của khối lượng các gói kẹo là $Q_3 = 102" g"$.]),
    True([Khoảng tứ phân vị của mẫu số liệu bằng $Delta_Q = 3" g"$.]),
    [Gói kẹo có khối lượng $120" g"$ không phải là giá trị bất thường vì vẫn đóng gói được.]
  ),
  loigiai: [
    #step([Tìm các tứ phân vị])
    $n = 10$, các giá trị đã sắp xếp tăng dần:
    - Nửa dưới gồm $5$ số: $95; 98; 99; 100; 100 => Q_1 = 99" g"$. Mệnh đề a ĐÚNG.
    - Nửa trên gồm $5$ số: $101; 101; 102; 104; 120 => Q_3 = 102" g"$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 102 - 99 = 3" g"$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra giá trị bất thường])
    Ngưỡng trên: $Q_3 + 1.5 Delta_Q = 102 + 1.5(3) = 102 + 4.5 = 106.5" g"$.
    Vì $120 > 106.5" g"$ nên gói kẹo $120" g"$ là giá trị bất thường (outlier) do máy bị kẹt nhả quá nhiều kẹo. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của phép biến đổi tuyến tính)
#ds([Cho mẫu số liệu $x_1, x_2, dots, x_n$ có số trung bình $overline(x) = 20$, trung vị $M_e = 18$, độ lệch chuẩn $s_x = 4$ và khoảng biến thiên $R_x = 12$. Ta lập mẫu số liệu mới bằng phép biến đổi $y_i = 3 x_i + 5$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số trung bình của mẫu số liệu mới là $overline(y) = 3 overline(x) + 5 = 65$.]),
    True([Trung vị của mẫu số liệu mới là $M_e(y) = 3 M_e(x) + 5 = 59$.]),
    True([Khoảng biến thiên của mẫu số liệu mới là $R_y = 3 R_x = 36$.]),
    [Độ lệch chuẩn của mẫu số liệu mới là $s_y = 3 s_x + 5 = 17$.]
  ),
  loigiai: [
    #step([Số trung bình và trung vị mới])
    Khi $y_i = a x_i + b$ với $a = 3 > 0$:
    $overline(y) = 3(20) + 5 = 65$. Mệnh đề a ĐÚNG.
    $M_e(y) = 3(18) + 5 = 59$. Mệnh đề b ĐÚNG.

    #step([Khoảng biến thiên mới])
    $R_y = |a| R_x = 3 dot 12 = 36$. Mệnh đề c ĐÚNG.

    #step([Độ lệch chuẩn mới])
    Hằng số cộng $+5$ không làm thay đổi độ phân tán:
    $s_y = |a| s_x = 3 dot 4 = 12 != 17$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Số trung bình)
#tln([Cho mẫu số liệu điểm kiểm tra thường xuyên của một nhóm học sinh:
#align(center)[
  $5; quad 7; quad 8; quad 8; quad 10; quad 10$
]
Tính số trung bình cộng $overline(x)$ của mẫu số liệu (làm tròn đến hàng phần mười nếu cần).],
    [8],
    loigiai: [
        #step([Tính tổng và trung bình])
        Tổng: $5 + 7 + 8 + 8 + 10 + 10 = 48$.
        $ overline(x) = 48 / 6 = 8 $
    ]
)

// TLN 2 (Trung vị)
#tln([Thời gian gọi điện thoại tư vấn (phút) của một nhân viên trong $7$ cuộc gọi liên tiếp là:
#align(center)[
  $3; quad 4; quad 6; quad 8; quad 9; quad 12; quad 15$
]
Tìm trung vị $M_e$ của thời gian các cuộc gọi (tính bằng phút).],
    [8],
    loigiai: [
        #step([Xác định trung vị])
        $n = 7$, số chính giữa ở vị trí thứ $4$ là $x_4 = 8$.
        Vậy trung vị $M_e = 8$ phút.
    ]
)

// TLN 3 (Khoảng biến thiên)
#tln([Sản lượng cam thu hoạch (tạ/ngày) trong $6$ ngày của một nông trường là:
#align(center)[
  $15; quad 18; quad 20; quad 22; quad 25; quad 31$
]
Tính khoảng biến thiên $R$ của sản lượng thu hoạch theo đơn vị tạ.],
    [16],
    loigiai: [
        #step([Xác định Max và Min])
        $x_max = 31$, $x_min = 15$.
        $ R = 31 - 15 = 16 text(" tạ") $
    ]
)

// TLN 4 (Khoảng tứ phân vị)
#tln([Số lượng sách đọc được trong năm của $8$ thành viên một câu lạc bộ là:
#align(center)[
  $6; quad 8; quad 10; quad 12; quad 14; quad 18; quad 22; quad 30$
]
Tính khoảng tứ phân vị $Delta_Q$ của mẫu số liệu trên.],
    [11],
    loigiai: [
        #step([Xác định các tứ phân vị])
        $n = 8$, đã sắp xếp tăng dần:
        - Nửa dưới: $6; 8; 10; 12 => Q_1 = (8 + 10)/2 = 9$.
        - Nửa trên: $14; 18; 22; 30 => Q_3 = (18 + 22)/2 = 20$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 20 - 9 = 11 $
    ]
)

// TLN 5 (Phương sai)
#tln([Cho mẫu số liệu gồm $4$ giá trị: $1; quad 3; quad 5; quad 7$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [5],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (1 + 3 + 5 + 7) / 4 = 16 / 4 = 4 $
        
        #step([Tính phương sai])
        $ s^2 = ((1-4)^2 + (3-4)^2 + (5-4)^2 + (7-4)^2) / 4 = (9 + 1 + 1 + 9) / 4 = 20 / 4 = 5 $
    ]
)

// TLN 6 (Ngưỡng trên ngoại lệ)
#tln([Một mẫu số liệu thống kê thu nhập có tứ phân vị thứ nhất $Q_1 = 15$ triệu đồng và tứ phân vị thứ ba $Q_3 = 25$ triệu đồng.
Tìm giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ (triệu đồng) để xác định mức thu nhập cao bất thường.],
    [40],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 25 - 15 = 10 text(" triệu đồng") $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 25 + 1.5(10) = 25 + 15 = 40 text(" triệu đồng") $
    ]
)

] // end make-questions

#make-questions()
