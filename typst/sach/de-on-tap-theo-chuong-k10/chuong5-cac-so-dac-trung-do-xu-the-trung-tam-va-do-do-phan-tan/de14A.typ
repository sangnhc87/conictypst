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
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN",
  exam-title: "BÀI 14: CÁC SỐ ĐẶC TRƯNG ĐO ĐỘ PHÂN TÁN (ĐỀ A: CƠ BẢN - VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "125",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Nhiệt độ cao nhất trong ngày (đơn vị: $""^circ"C"$) trong $7$ ngày liên tiếp tại một thành phố được ghi lại như sau:
#align(center)[
  $22; quad 24; quad 25; quad 26; quad 28; quad 30; quad 35$
]
Khoảng biến thiên $R$ của mẫu số liệu nhiệt độ trên bằng],
    (
        True([$13^circ"C"$]),
        [$10^circ"C"$],
        [$15^circ"C"$],
        [$12^circ"C"$]
    ),
    loigiai: [
        Giá trị lớn nhất $x_max = 35$, giá trị nhỏ nhất $x_min = 22$.
        Khoảng biến thiên:
        $ R = x_max - x_min = 35 - 22 = 13^circ"C" $
    ]
)

// TN 2
#tn([Với cùng mẫu số liệu nhiệt độ trong $7$ ngày ở Câu 1:
#align(center)[
  $22; quad 24; quad 25; quad 26; quad 28; quad 30; quad 35$
]
Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu bằng],
    (
        True([$6^circ"C"$]),
        [$5^circ"C"$],
        [$7^circ"C"$],
        [$8^circ"C"$]
    ),
    loigiai: [
        Mẫu có $n = 7$, trung vị $Q_2 = x_4 = 26$.
        - Nửa dưới: $22; 24; 25 => Q_1 = 24$.
        - Nửa trên: $28; 30; 35 => Q_3 = 30$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 30 - 24 = 6^circ"C" $
    ]
)

// TN 3
#tn([Cho mẫu số liệu $x_1, x_2, dots, x_n$ có số trung bình cộng là $overline(x)$. Công thức tính phương sai $s^2$ của mẫu số liệu là],
    (
        True([$s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2$]),
        [$s^2 = 1/n sum_(i=1)^n (x_i - overline(x))$],
        [$s^2 = sqrt(1/n sum_(i=1)^n (x_i - overline(x))^2)$],
        [$s^2 = 1/(n-1) sum_(i=1)^n (x_i + overline(x))^2$]
    ),
    loigiai: [
        Theo định nghĩa trong SGK Toán 10 KNTT, phương sai của mẫu số liệu là trung bình cộng của các bình phương độ lệch giữa mỗi giá trị với số trung bình:
        $ s^2 = 1/n sum_(i=1)^n (x_i - overline(x))^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 $
    ]
)

// TN 4
#tn([Cho mẫu số liệu gồm $5$ số: $2; quad 4; quad 6; quad 8; quad 10$. Phương sai $s^2$ của mẫu số liệu trên bằng],
    (
        True([$8$]),
        [$4$],
        [$6$],
        [$sqrt(8)$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = (2 + 4 + 6 + 8 + 10) / 5 = 30 / 5 = 6$.
        Phương sai:
        $ s^2 = ((2-6)^2 + (4-6)^2 + (6-6)^2 + (8-6)^2 + (10-6)^2) / 5 = (16 + 4 + 0 + 4 + 16) / 5 = 40 / 5 = 8 $
    ]
)

// TN 5
#tn([Trong thống kê, một giá trị $x$ trong mẫu số liệu được gọi là giá trị bất thường (outlier hay giá trị ngoại lệ) nếu nó thỏa mãn điều kiện nào sau đây?],
    (
        True([$x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$]),
        [$x < Q_1 - Delta_Q$ hoặc $x > Q_3 + Delta_Q$],
        [$x < overline(x) - 1.5 s$ hoặc $x > overline(x) + 1.5 s$],
        [$x < Q_2 - 1.5 Delta_Q$ hoặc $x > Q_2 + 1.5 Delta_Q$]
    ),
    loigiai: [
        Theo quy tắc hàng rào Tukey được chuẩn hóa trong SGK Toán 10:
        Một giá trị $x$ được xem là giá trị bất thường nếu nó nằm ngoài khoảng $[Q_1 - 1.5 Delta_Q; Q_3 + 1.5 Delta_Q]$, tức là $x < Q_1 - 1.5 Delta_Q$ hoặc $x > Q_3 + 1.5 Delta_Q$.
    ]
)

// TN 6
#tn([Biểu đồ hộp (Box plot) dưới đây biểu diễn kết quả kiểm tra thời gian giải một bài toán (phút) của học sinh:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6.5, 0), stroke: 1pt)
    for v in (5, 10, 15, 20, 25, 30) {
      let x = (v - 5) * 0.2 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box Q1=10, Q2=15, Q3=20, Min=6, Max=24, Outlier=30
    let xMin = 0.5 + (6 - 5) * 0.2  // 0.7
    let xQ1 = 0.5 + (10 - 5) * 0.2 // 1.5
    let xQ2 = 0.5 + (15 - 5) * 0.2 // 2.5
    let xQ3 = 0.5 + (20 - 5) * 0.2 // 3.5
    let xMax = 0.5 + (24 - 5) * 0.2 // 4.3
    let xOut = 0.5 + (30 - 5) * 0.2 // 5.5
    rect((xQ1, 0.4), (xQ3, 1.2), fill: rgb("dbeafe"), stroke: 1.2pt + rgb("1e40af"))
    line((xQ2, 0.4), (xQ2, 1.2), stroke: 1.8pt + rgb("dc2626"))
    line((xMin, 0.8), (xQ1, 0.8), stroke: 1pt + rgb("1e40af"))
    line((xMin, 0.6), (xMin, 1.0), stroke: 1.2pt + rgb("1e40af"))
    line((xQ3, 0.8), (xMax, 0.8), stroke: 1pt + rgb("1e40af"))
    line((xMax, 0.6), (xMax, 1.0), stroke: 1.2pt + rgb("1e40af"))
    circle((xOut, 0.8), radius: 2.5pt, fill: rgb("dc2626"))
    content((xOut, 1.15), text(fill: rgb("dc2626"), size: 7.5pt, weight: "bold")[Ngoại lệ])
  })
]
Khoảng tứ phân vị $Delta_Q$ và giá trị ngoại lệ của mẫu số liệu là],
    (
        True([$Delta_Q = 10$ phút và giá trị ngoại lệ bằng $30$ phút]),
        [$Delta_Q = 15$ phút và giá trị ngoại lệ bằng $30$ phút],
        [$Delta_Q = 10$ phút và giá trị ngoại lệ bằng $24$ phút],
        [$Delta_Q = 18$ phút và giá trị ngoại lệ bằng $5$ phút]
    ),
    loigiai: [
        Từ biểu đồ hộp:
        - $Q_1 = 10$ phút, $Q_3 = 20$ phút $=> Delta_Q = Q_3 - Q_1 = 20 - 10 = 10$ phút.
        - Điểm đánh dấu riêng biệt bên phải râu trên nằm tại mốc $30$ phút là giá trị ngoại lệ.
    ]
)

// TN 7
#tn([Khảo sát số lỗi chính tả trong một bài luận của $20$ học sinh thu được bảng tần số:
#align(center)[
  #table(
    columns: 6,
    align: center,
    [*Số lỗi*], [$0$], [$1$], [$2$], [$3$], [$5$],
    [*Số học sinh*], [$6$], [$8$], [$3$], [$2$], [$1$]
  )
]
Khoảng biến thiên $R$ của số lỗi chính tả bằng],
    (
        True([$5$ lỗi]),
        [$4$ lỗi],
        [$8$ lỗi],
        [$3$ lỗi]
    ),
    loigiai: [
        Số lỗi nhiều nhất là $x_max = 5$, số lỗi ít nhất là $x_min = 0$.
        Khoảng biến thiên:
        $ R = x_max - x_min = 5 - 0 = 5 text(" lỗi") $
    ]
)

// TN 8
#tn([Cho mẫu số liệu điểm kiểm tra môn Toán của $8$ bạn học sinh:
#align(center)[
  $4.0; quad 5.0; quad 6.0; quad 7.0; quad 8.0; quad 8.0; quad 9.0; quad 10.0$
]
Khoảng tứ phân vị $Delta_Q$ của mẫu số liệu bằng],
    (
        True([$3.0$ điểm]),
        [$2.5$ điểm],
        [$3.5$ điểm],
        [$6.0$ điểm]
    ),
    loigiai: [
        Mẫu số liệu có $n = 8$ đã sắp xếp tăng dần:
        - Nửa dưới gồm $4$ số: $4.0; 5.0; 6.0; 7.0 => Q_1 = (5.0 + 6.0) / 2 = 5.5$.
        - Nửa trên gồm $4$ số: $8.0; 8.0; 9.0; 10.0 => Q_3 = (8.0 + 9.0) / 2 = 8.5$.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 8.5 - 5.5 = 3.0 $
    ]
)

// TN 9
#tn([Nếu tất cả các giá trị trong một mẫu số liệu đều được cộng thêm một hằng số $c = 5$, khẳng định nào sau đây là SAI?],
    (
        True([Khoảng biến thiên của mẫu mới tăng thêm $5$ đơn vị]),
        [Khoảng biến thiên của mẫu mới không thay đổi],
        [Khoảng tứ phân vị của mẫu mới không thay đổi],
        [Phương sai và độ lệch chuẩn của mẫu mới không thay đổi]
    ),
    loigiai: [
        Khi cộng cùng một hằng số $c$ vào tất cả các giá trị:
        - Độ phân tán của mẫu số liệu không hề thay đổi.
        - $R' = (x_max + c) - (x_min + c) = x_max - x_min = R$.
        - $Delta_Q' = Delta_Q; s'^2 = s^2; s' = s$.
        Do đó khẳng định "Khoảng biến thiên tăng thêm 5 đơn vị" là SAI.
    ]
)

// TN 10
#tn([Hai xạ thủ bắn súng $A$ và $B$ có cùng điểm số trung bình là $overline(x) = 8.8$ điểm. Độ lệch chuẩn điểm số của xạ thủ $A$ là $s_A = 0.6$ và của xạ thủ $B$ là $s_B = 1.2$. Nhận xét nào sau đây phản ánh chính xác nhất về phong độ thi đấu của hai xạ thủ?],
    (
        True([Xạ thủ $A$ có phong độ bắn ổn định và đồng đều hơn xạ thủ $B$]),
        [Xạ thủ $B$ có phong độ bắn ổn định và đồng đều hơn xạ thủ $A$],
        [Cả hai xạ thủ có mức độ ổn định hoàn toàn ngang nhau],
        [Chưa đủ cơ sở dữ liệu để so sánh mức độ ổn định]
    ),
    loigiai: [
        Độ lệch chuẩn $s$ đặc trưng cho độ phân tán của các số liệu xung quanh giá trị trung bình.
        Độ lệch chuẩn càng nhỏ thì mức độ phân tán càng thấp, phong độ càng ổn định.
        Vì $s_A = 0.6 < s_B = 1.2$ nên xạ thủ $A$ thi đấu ổn định và có phong độ đồng đều hơn xạ thủ $B$.
    ]
)

// TN 11
#tn([Cho mẫu số liệu về thời gian hoàn thành một công việc (tính bằng phút):
#align(center)[
  $10; quad 12; quad 13; quad 14; quad 15; quad 16; quad 18; quad 45$
]
Giá trị nào trong mẫu số liệu trên được xác định là giá trị bất thường (outlier)?],
    (
        True([$45$]),
        [$10$],
        [$18$],
        [Không có giá trị bất thường]
    ),
    loigiai: [
        Mẫu có $n = 8$:
        - Nửa dưới: $10; 12; 13; 14 => Q_1 = (12 + 13)/2 = 12.5$.
        - Nửa trên: $15; 16; 18; 45 => Q_3 = (16 + 18)/2 = 17.0$.
        $Delta_Q = Q_3 - Q_1 = 17.0 - 12.5 = 4.5$.
        Ngưỡng trên: $Q_3 + 1.5 Delta_Q = 17.0 + 1.5(4.5) = 17.0 + 6.75 = 23.75$.
        Vì $45 > 23.75$ nên $45$ là giá trị bất thường.
    ]
)

// TN 12
#tn([Một mẫu số liệu có phương sai $s^2 = 16$. Độ lệch chuẩn $s$ của mẫu số liệu bằng],
    (
        True([$4$]),
        [$256$],
        [$8$],
        [$2$]
    ),
    loigiai: [
        Độ lệch chuẩn bằng căn bậc hai số học của phương sai:
        $ s = sqrt(s^2) = sqrt(16) = 4 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (So sánh mức độ phân tán điểm số của hai tổ học sinh)
#ds([Kết quả kiểm tra giữa kỳ môn Hóa học của hai tổ học sinh (mỗi tổ gồm $8$ bạn) được ghi nhận:
- Tổ 1: $7.0; quad 7.5; quad 8.0; quad 8.0; quad 8.5; quad 8.5; quad 9.0; quad 9.5$.
- Tổ 2: $5.0; quad 6.0; quad 7.5; quad 8.5; quad 9.0; quad 9.5; quad 10.0; quad 10.5$... khoan (10.5 không hợp lý điểm 10):
- Tổ 2: $5.0; quad 6.5; quad 7.5; quad 8.5; quad 9.0; quad 9.5; quad 10.0; quad 10.0$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Cả hai tổ học sinh đều có điểm kiểm tra trung bình bằng nhau và bằng $overline(x) = 8.25$ điểm.]),
    True([Khoảng biến thiên điểm số của Tổ 1 là $R_1 = 2.5$ điểm, nhỏ hơn khoảng biến thiên của Tổ 2 là $R_2 = 5.0$ điểm.]),
    True([Khoảng tứ phân vị của Tổ 1 là $Delta_Q(1) = 1.0$ điểm, của Tổ 2 là $Delta_Q(2) = 2.75$ điểm.]),
    [Điểm số môn Hóa học của các bạn học sinh Tổ 2 có độ phân tán nhỏ hơn và học đều hơn Tổ 1.]
  ),
  loigiai: [
    #step([Tính điểm trung bình])
    Tổng Tổ 1: $7.0 + 7.5 + 8.0 + 8.0 + 8.5 + 8.5 + 9.0 + 9.5 = 66.0 => overline(x)_1 = 66.0 / 8 = 8.25$.
    Tổng Tổ 2: $5.0 + 6.5 + 7.5 + 8.5 + 9.0 + 9.5 + 10.0 + 10.0 = 66.0 => overline(x)_2 = 66.0 / 8 = 8.25$. Mệnh đề a ĐÚNG.

    #step([Khoảng biến thiên])
    $R_1 = 9.5 - 7.0 = 2.5$ điểm.
    $R_2 = 10.0 - 5.0 = 5.0$ điểm. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    Tổ 1: Nửa dưới: $7.0; 7.5; 8.0; 8.0 => Q_1(1) = 7.75$. Nửa trên: $8.5; 8.5; 9.0; 9.5 => Q_3(1) = 8.75$.
    $Delta_Q(1) = 8.75 - 7.75 = 1.0$ điểm.
    Tổ 2: Nửa dưới: $5.0; 6.5; 7.5; 8.5 => Q_1(2) = (6.5 + 7.5)/2 = 7.0$.
    Nửa trên: $9.0; 9.5; 10.0; 10.0 => Q_3(2) = (9.5 + 10.0)/2 = 9.75$.
    $Delta_Q(2) = 9.75 - 7.0 = 2.75$ điểm. Mệnh đề c ĐÚNG.

    #step([Đánh giá mức độ đồng đều])
    Tổ 1 có khoảng biến thiên và khoảng tứ phân vị nhỏ hơn Tổ 2 nên học sinh Tổ 1 học đều hơn Tổ 2. Khẳng định Tổ 2 học đều hơn Tổ 1 là SAI.
  ]
)

// DS 2 (Biểu đồ hộp và phân tích giá trị bất thường)
#ds([Một trạm khí tượng quan trắc nhiệt độ cao nhất mỗi ngày ($""^circ"C"$) trong một tháng mùa hè gồm $12$ ngày quan trắc tiêu biểu:
#align(center)[
  $30; quad 32; quad 33; quad 34; quad 35; quad 35; quad 36; quad 37; quad 38; quad 39; quad 40; quad 48$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị của mẫu số liệu nhiệt độ bằng $M_e = 35.5^circ"C"$.]),
    True([Tứ phân vị thứ nhất và thứ ba lần lượt là $Q_1 = 33.5^circ"C"$ và $Q_3 = 38.5^circ"C"$.]),
    True([Khoảng tứ phân vị của mẫu số liệu là $Delta_Q = 5.0^circ"C"$.]),
    [Giá trị $48^circ"C"$ nằm trong khoảng giá trị bình thường, không phải là giá trị bất thường.]
  ),
  loigiai: [
    #step([Tính trung vị])
    $n = 12$, hai số chính giữa là $x_6 = 35$ và $x_7 = 36 => M_e = (35 + 36)/2 = 35.5^circ"C"$. Mệnh đề a ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới gồm $6$ số: $30; 32; 33; 34; 35; 35 => Q_1 = (33 + 34)/2 = 33.5^circ"C"$.
    Nửa trên gồm $6$ số: $36; 37; 38; 39; 40; 48 => Q_3 = (38 + 39)/2 = 38.5^circ"C"$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = Q_3 - Q_1 = 38.5 - 33.5 = 5.0^circ"C"$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra giá trị bất thường])
    Hàng rào trên: $Q_3 + 1.5 Delta_Q = 38.5 + 1.5(5.0) = 38.5 + 7.5 = 46.0^circ"C"$.
    Vì $48^circ"C" > 46.0^circ"C"$ nên $48^circ"C"$ chắc chắn là giá trị bất thường. Mệnh đề d SAI.
  ]
)

// DS 3 (Phương sai và độ lệch chuẩn của số lỗi)
#ds([Kiểm tra ngẫu nhiên $10$ sản phẩm hoàn thiện từ một dây chuyền tự động, số lỗi bề mặt trên mỗi sản phẩm ghi nhận như sau:
#align(center)[
  $0; quad 0; quad 1; quad 1; quad 1; quad 2; quad 2; quad 2; quad 3; quad 8$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Số lỗi trung bình trên một sản phẩm bằng $overline(x) = 2.0$ lỗi.]),
    True([Tổng các bình phương độ lệch $sum_(i=1)^(10) (x_i - overline(x))^2$ bằng $48$.]),
    True([Phương sai của mẫu số liệu bằng $s^2 = 4.8$.]),
    [Độ lệch chuẩn của mẫu số liệu nhỏ hơn $1.5$ lỗi.]
  ),
  loigiai: [
    #step([Tính số trung bình])
    Tổng: $0 + 0 + 1 + 1 + 1 + 2 + 2 + 2 + 3 + 8 = 20$.
    $overline(x) = 20 / 10 = 2.0$ lỗi. Mệnh đề a ĐÚNG.

    #step([Tính tổng bình phương độ lệch])
    $sum_(i=1)^(10) (x_i - 2)^2 = 2(0-2)^2 + 3(1-2)^2 + 3(2-2)^2 + (3-2)^2 + (8-2)^2$
    $= 2(4) + 3(1) + 0 + 1 + 36 = 8 + 3 + 1 + 36 = 48$. Mệnh đề b ĐÚNG.

    #step([Tính phương sai])
    $s^2 = 48 / 10 = 4.8$. Mệnh đề c ĐÚNG.

    #step([Tính độ lệch chuẩn])
    $s = sqrt(4.8) approx 2.19 > 1.5$. Mệnh đề d SAI.
  ]
)

// DS 4 (Tác động của phép biến đổi tuyến tính)
#ds([Cho mẫu số liệu $x_1, x_2, dots, x_n$ có khoảng biến thiên $R(x) = 20$, khoảng tứ phân vị $Delta_Q(x) = 8$, phương sai $s_x^2 = 9$ (suy ra độ lệch chuẩn $s_x = 3$). Ta tạo mẫu số liệu mới bằng phép biến đổi $y_i = -2 x_i + 10$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng biến thiên của mẫu số liệu mới bằng $R(y) = |-2| dot R(x) = 40$.]),
    True([Khoảng tứ phân vị của mẫu số liệu mới bằng $Delta_Q(y) = |-2| dot Delta_Q(x) = 16$.]),
    True([Độ lệch chuẩn của mẫu số liệu mới bằng $s_y = |-2| dot s_x = 6$.]),
    [Phương sai của mẫu số liệu mới bằng $s_y^2 = -2 dot s_x^2 = -18$.]
  ),
  loigiai: [
    #step([Khoảng biến thiên])
    $R(y) = y_max - y_min = |-2| (x_max - x_min) = 2 dot 20 = 40$. Mệnh đề a ĐÚNG.

    #step([Khoảng tứ phân vị])
    Vì phép nhân với $-2$ đảo ngược thứ tự các giá trị nên khoảng cách giữa các phân vị bị phóng đại lên $2$ lần: $Delta_Q(y) = |-2| Delta_Q(x) = 2 dot 8 = 16$. Mệnh đề b ĐÚNG.

    #step([Độ lệch chuẩn])
    $s_y = |-2| s_x = 2 dot 3 = 6$. Mệnh đề c ĐÚNG.

    #step([Phương sai])
    Phương sai luôn là một số không âm: $s_y^2 = (-2)^2 s_x^2 = 4 dot 9 = 36 != -18$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Khoảng biến thiên)
#tln([Giá đóng cửa (nghìn đồng/cổ phiếu) của một mã cổ phiếu trong $6$ phiên giao dịch tuần qua là:
#align(center)[
  $42; quad 45; quad 44; quad 48; quad 43; quad 52$
]
Tìm khoảng biến thiên $R$ của giá cổ phiếu trong tuần theo đơn vị nghìn đồng.],
    [10],
    loigiai: [
        #step([Xác định giá trị lớn nhất và nhỏ nhất])
        Giá cao nhất: $x_max = 52$.
        Giá thấp nhất: $x_min = 42$.
        
        #step([Tính khoảng biến thiên])
        $ R = 52 - 42 = 10 text(" nghìn đồng") $
    ]
)

// TLN 2 (Khoảng tứ phân vị)
#tln([Thời gian tự luyện tập thể thao mỗi ngày (phút) của $10$ vận động viên là:
#align(center)[
  $30; quad 35; quad 40; quad 45; quad 50; quad 55; quad 60; quad 65; quad 70; quad 90$
]
Tìm khoảng tứ phân vị $Delta_Q$ của mẫu số liệu trên.],
    [25],
    loigiai: [
        #step([Xác định các tứ phân vị])
        $n = 10$, đã sắp xếp tăng dần:
        - Nửa dưới gồm $5$ số: $30; 35; 40; 45; 50 => Q_1 = 40$.
        - Nửa trên gồm $5$ số: $55; 60; 65; 70; 90 => Q_3 = 65$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 65 - 40 = 25 text(" phút") $
    ]
)

// TLN 3 (Phương sai)
#tln([Cho mẫu số liệu điểm đánh giá năng lực gồm $4$ giá trị: $4; quad 6; quad 8; quad 10$.
Tính phương sai $s^2$ của mẫu số liệu trên.],
    [5],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (4 + 6 + 8 + 10) / 4 = 28 / 4 = 7 $
        
        #step([Tính phương sai])
        $ s^2 = ((4-7)^2 + (6-7)^2 + (8-7)^2 + (10-7)^2) / 4 = (9 + 1 + 1 + 9) / 4 = 20 / 4 = 5 $
    ]
)

// TLN 4 (Độ lệch chuẩn)
#tln([Cho mẫu số liệu gồm $4$ giá trị: $1; quad 3; quad 5; quad 7$.
Tính độ lệch chuẩn $s$ của mẫu số liệu trên (làm tròn kết quả đến hàng phần mười, biết $sqrt(5) approx 2.236$).],
    [2.2],
    loigiai: [
        #step([Tính số trung bình])
        $ overline(x) = (1 + 3 + 5 + 7) / 4 = 16 / 4 = 4 $
        
        #step([Tính phương sai])
        $ s^2 = ((1-4)^2 + (3-4)^2 + (5-4)^2 + (7-4)^2) / 4 = (9 + 1 + 1 + 9) / 4 = 20 / 4 = 5 $
        
        #step([Tính độ lệch chuẩn])
        $ s = sqrt(5) approx 2.236 approx 2.2 $
    ]
)

// TLN 5 (Ngưỡng trên giá trị ngoại lệ)
#tln([Một mẫu số liệu có tứ phân vị thứ nhất $Q_1 = 20$ và tứ phân vị thứ ba $Q_3 = 32$.
Tìm giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ để xác định các giá trị bất thường lớn hơn ngưỡng này.],
    [50],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 32 - 20 = 12 $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 32 + 1.5 dot 12 = 32 + 18 = 50 $
    ]
)

// TLN 6 (Số lượng giá trị bất thường)
#tln([Xét mẫu số liệu gồm $9$ giá trị đã sắp xếp:
#align(center)[
  $-5; quad 15; quad 18; quad 20; quad 22; quad 25; quad 28; quad 30; quad 65$
]
Hỏi mẫu số liệu trên có tất cả bao nhiêu giá trị bất thường (outlier)?],
    [2],
    loigiai: [
        #step([Tìm các tứ phân vị])
        $n = 9$, trung vị $Q_2 = x_5 = 22$.
        - Nửa dưới: $-5; 15; 18; 20 => Q_1 = (15 + 18)/2 = 16.5$.
        - Nửa trên: $25; 28; 30; 65 => Q_3 = (28 + 30)/2 = 29.0$.
        $Delta_Q = Q_3 - Q_1 = 29.0 - 16.5 = 12.5$.
        
        #step([Tính các ngưỡng rào])
        - Ngưỡng dưới: $Q_1 - 1.5 Delta_Q = 16.5 - 1.5(12.5) = 16.5 - 18.75 = -2.25$.
        - Ngưỡng trên: $Q_3 + 1.5 Delta_Q = 29.0 + 1.5(12.5) = 29.0 + 18.75 = 47.75$.
        
        #step([Đếm số giá trị bất thường])
        - Giá trị $-5 < -2.25$ (là giá trị bất thường).
        - Giá trị $65 > 47.75$ (là giá trị bất thường).
        Vậy mẫu số liệu có tất cả $2$ giá trị bất thường.
    ]
)

] // end make-questions

#make-questions()
