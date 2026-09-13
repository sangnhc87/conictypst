#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("e11d48") // Ruby / Rose

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHƯƠNG V: THỐNG KÊ ỨNG DỤNG THỰC TẾ",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ THỐNG KÊ (ĐỀ F: TÀI CHÍNH ĐỊNH LƯỢNG, BẢO HIỂM & CHUỖI CUNG ỨNG - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "133",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Theo dõi tỷ suất sinh lời hàng tháng (%) của một quỹ đầu tư cổ phiếu trong $8$ tháng:
#align(center)[
  $-4%; quad 2%; quad 3%; quad 5%; quad 6%; quad 8%; quad 10%; quad 22%$
]
Để công bố mức sinh lời tiêu biểu của quỹ mà không bị phóng đại bởi một tháng thị trường tăng trưởng nóng đột biến ($22%$), số đặc trưng đo xu thế trung tâm phù hợp nhất là],
    (
        True([Trung vị $M_e = 5.5%$]),
        [Số trung bình $overline(x) = 6.5%$],
        [Khoảng biến thiên $R = 26%$],
        [Mốt $M_o = 22%$]
    ),
    loigiai: [
        Mức sinh lời $22%$ là giá trị đột biến kéo số trung bình lên $6.5%$.
        Với mẫu $8$ tháng đã sắp xếp, trung vị là trung bình cộng của $x_4 = 5%$ và $x_5 = 6%$:
        $ M_e = (5% + 6%) / 2 = 5.5% $
        Trung vị phản ánh chân thực tỷ suất lợi nhuận phổ biến đạt được của quỹ.
    ]
)

// TN 2
#tn([Trong quản trị kho vận (Logistics), số lượng đơn hàng máy tính xách tay bán ra mỗi ngày tại một siêu thị điện máy trong $7$ ngày liên tiếp:
#align(center)[
  $10; quad 12; quad 15; quad 18; quad 20; quad 25; quad 45$ (chiếc)
]
Khoảng biến thiên $R$ của số lượng đơn hàng bán ra trong tuần bằng],
    (
        True([$35$ chiếc]),
        [$33$ chiếc],
        [$25$ chiếc],
        [$20$ chiếc]
    ),
    loigiai: [
        $x_max = 45$, $x_min = 10$.
        $ R = 45 - 10 = 35 text(" chiếc") $
    ]
)

// TN 3
#tn([Một chuyên viên phân tích tài chính tính toán độ biến động (volatility) của giá cổ phiếu qua phương sai của $n = 10$ phiên giao dịch có $sum_(i=1)^(10) x_i = 150$ nghìn đồng và $sum_(i=1)^(10) x_i^2 = 2340$. Phương sai mẫu $s^2$ của giá cổ phiếu bằng],
    (
        True([$9$]),
        [$15$],
        [$24$],
        [$3$]
    ),
    loigiai: [
        Số trung bình: $overline(x) = 150 / 10 = 15$ nghìn đồng.
        Phương sai:
        $ s^2 = 1/n sum_(i=1)^n x_i^2 - (overline(x))^2 = 2340 / 10 - 15^2 = 234 - 225 = 9 $
    ]
)

// TN 4
#tn([Đánh giá hiệu quả đầu tư qua tỷ số Sharpe: $"Sharpe" = (overline(r) - r_f) / s$ với lãi suất phi rủi ro $r_f = 4%$/năm:
- Danh mục $A$: Tỷ suất sinh lời trung bình $overline(r)_A = 16%$/năm, độ lệch chuẩn $s_A = 6%$/năm.
- Danh mục $B$: Tỷ suất sinh lời trung bình $overline(r)_B = 12%$/năm, độ lệch chuẩn $s_B = 5%$/năm.
Tỷ số Sharpe của Danh mục $A$ so với Danh mục $B$ là],
    (
        True([Lớn hơn ($2.0$ so với $1.6$)]),
        [Nhỏ hơn ($1.6$ so với $2.0$)],
        [Bằng nhau ($2.0$)],
        [Bằng nhau ($1.6$)]
    ),
    loigiai: [
        Tỷ số Sharpe danh mục A: $"Sharpe"_A = (16 - 4) / 6 = 12 / 6 = 2.0$.
        Tỷ số Sharpe danh mục B: $"Sharpe"_B = (12 - 4) / 5 = 8 / 5 = 1.6$.
        Vì $2.0 > 1.6$ nên Danh mục A mang lại mức lợi nhuận trên mỗi đơn vị rủi ro cao hơn.
    ]
)

// TN 5
#tn([Biểu đồ hộp CeTZ dưới đây mô tả sự phân bố tỷ suất lợi nhuận (%) của hai quỹ đầu tư $P$ và $Q$:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), stroke: 1pt)
    for v in (0, 5, 10, 15, 20, 25, 30) {
      let x = v * 0.2 + 0.5
      line((x, -0.1), (x, 0.1), stroke: 0.8pt)
      content((x, -0.35), text(size: 7.5pt)[#str(v)])
    }
    // Box Quỹ P: Min=4, Q1=8, Q2=12, Q3=16, Max=22 (y=1.5)
    let xMinA = 0.5 + 0.8
    let xQ1A = 0.5 + 1.6
    let xQ2A = 0.5 + 2.4
    let xQ3A = 0.5 + 3.2
    let xMaxA = 0.5 + 4.4
    rect((xQ1A, 1.2), (xQ3A, 1.8), fill: rgb("ffe4e6"), stroke: 1.2pt + rgb("e11d48"))
    line((xQ2A, 1.2), (xQ2A, 1.8), stroke: 1.8pt + rgb("1d4ed8"))
    line((xMinA, 1.5), (xQ1A, 1.5), stroke: 1pt + rgb("e11d48"))
    line((xMinA, 1.3), (xMinA, 1.7), stroke: 1.2pt + rgb("e11d48"))
    line((xQ3A, 1.5), (xMaxA, 1.5), stroke: 1pt + rgb("e11d48"))
    line((xMaxA, 1.3), (xMaxA, 1.7), stroke: 1.2pt + rgb("e11d48"))
    content((0.0, 1.5), text(fill: rgb("e11d48"), size: 8pt, weight: "bold")[Quỹ P])

    // Box Quỹ Q: Min=2, Q1=10, Q2=15, Q3=22, Max=28 (y=0.6)
    let xMinB = 0.5 + 0.4
    let xQ1B = 0.5 + 2.0
    let xQ2B = 0.5 + 3.0
    let xQ3B = 0.5 + 4.4
    let xMaxB = 0.5 + 5.6
    rect((xQ1B, 0.3), (xQ3B, 0.9), fill: rgb("e0e7ff"), stroke: 1.2pt + rgb("4338ca"))
    line((xQ2B, 0.3), (xQ2B, 0.9), stroke: 1.8pt + rgb("1d4ed8"))
    line((xMinB, 0.6), (xQ1B, 0.6), stroke: 1pt + rgb("4338ca"))
    line((xMinB, 0.4), (xMinB, 0.8), stroke: 1.2pt + rgb("4338ca"))
    line((xQ3B, 0.6), (xMaxB, 0.6), stroke: 1pt + rgb("4338ca"))
    line((xMaxB, 0.4), (xMaxB, 0.8), stroke: 1.2pt + rgb("4338ca"))
    content((0.0, 0.6), text(fill: rgb("4338ca"), size: 8pt, weight: "bold")[Quỹ Q])
  })
]
Dựa vào biểu đồ hộp, so sánh khoảng tứ phân vị giữa hai quỹ:],
    (
        True([Khoảng tứ phân vị của Quỹ P là $8%$, nhỏ hơn của Quỹ Q là $12%$]),
        [Khoảng tứ phân vị của Quỹ P là $12%$, lớn hơn của Quỹ Q là $8%$],
        [Hai quỹ có khoảng tứ phân vị hoàn toàn bằng nhau],
        [Khoảng tứ phân vị của Quỹ P là $14%$, của Quỹ Q là $26%$]
    ),
    loigiai: [
        - Quỹ P: $Q_1 = 8%, Q_3 = 16% => Delta_Q(P) = 16% - 8% = 8%$.
        - Quỹ Q: $Q_1 = 10%, Q_3 = 22% => Delta_Q(Q) = 22% - 10% = 12%$.
        Do đó $Delta_Q(P) = 8% < Delta_Q(Q) = 12%$. Quỹ P có mức độ biến động lợi nhuận tập trung và an toàn hơn.
    ]
)

// TN 6
#tn([Khảo sát số tiền bồi thường bảo hiểm xe cơ giới (triệu đồng) của $8$ vụ tai nạn:
#align(center)[
  $10; quad 12; quad 15; quad 18; quad 22; quad 25; quad 30; quad 36$
]
Khoảng tứ phân vị $Delta_Q$ của số tiền bồi thường bằng],
    (
        True([$14$ triệu đồng]),
        [$12$ triệu đồng],
        [$16$ triệu đồng],
        [$10$ triệu đồng]
    ),
    loigiai: [
        $n = 8$, các giá trị xếp tăng dần:
        - Nửa dưới: $10; 12; 15; 18 => Q_1 = (12 + 15)/2 = 13.5$ triệu đồng.
        - Nửa trên: $22; 25; 30; 36 => Q_3 = (25 + 30)/2 = 27.5$ triệu đồng.
        Khoảng tứ phân vị:
        $ Delta_Q = Q_3 - Q_1 = 27.5 - 13.5 = 14 text(" triệu đồng") $
    ]
)

// TN 7
#tn([Khi công ty áp dụng chiết khấu giảm giá đồng loạt $10%$ cho toàn bộ các mặt hàng ($y_i = 0.9 x_i$), độ lệch chuẩn giá bán của danh mục sản phẩm mới $s_y$ so với giá cũ $s_x$ sẽ],
    (
        True([Bằng $0.9 s_x$ (giảm $10%$)]),
        [Bằng $0.81 s_x$],
        [Không đổi],
        [Tăng $10%$]
    ),
    loigiai: [
        Khi $y_i = a x_i$ với $a = 0.9$:
        $ s_y = |a| s_x = 0.9 s_x $
        Độ lệch chuẩn giảm đi đúng $10%$.
    ]
)

// TN 8
#tn([Trong quản trị rủi ro thanh khoản ngân hàng, mẫu tiền gửi tiết kiệm có số trung bình $overline(x) = 100$ triệu đồng và độ lệch chuẩn $s = 8$ triệu đồng.
Theo quy tắc $3$-sigma, khoảng giá trị nào sau đây sẽ bao quát xấp xỉ $99.7%$ các khoản tiền gửi nếu phân phối tuân theo phân bố chuẩn?],
    (
        True([$(76; 124)$ triệu đồng]),
        [$(84; 116)$ triệu đồng],
        [$(92; 108)$ triệu đồng],
        [$(68; 132)$ triệu đồng]
    ),
    loigiai: [
        Khoảng $3$-sigma:
        $ (overline(x) - 3s; overline(x) + 3s) = (100 - 3 dot 8; 100 + 3 dot 8) = (76; 124) text(" triệu đồng") $
    ]
)

// TN 9
#tn([Số lượng hợp đồng bảo hiểm nhân thọ ký kết thành công mỗi tuần của một đại lý có $Q_1 = 12$ hợp đồng và $Q_3 = 20$ hợp đồng.
Ngưỡng trên $T_2$ để ban giám đốc khen thưởng tuần làm việc xuất sắc bất thường (outlier) là],
    (
        True([$32$ hợp đồng]),
        [$28$ hợp đồng],
        [$30$ hợp đồng],
        [$35$ hợp đồng]
    ),
    loigiai: [
        $Delta_Q = Q_3 - Q_1 = 20 - 12 = 8 text(" hợp đồng")$.
        Ngưỡng rào trên:
        $ T_2 = Q_3 + 1.5 Delta_Q = 20 + 1.5(8) = 20 + 12 = 32 text(" hợp đồng") $
    ]
)

// TN 10
#tn([Thời gian giao hàng (ngày) của một công ty logistics cho $6$ đơn hàng đường biển: $15; 18; 20; 22; 25; 32$.
Khoảng biến thiên $R$ của thời gian giao hàng bằng],
    (
        True([$17$ ngày]),
        [$15$ ngày],
        [$20$ ngày],
        [$12$ ngày]
    ),
    loigiai: [
        $x_max = 32$, $x_min = 15$.
        $ R = 32 - 15 = 17 text(" ngày") $
    ]
)

// TN 11
#tn([Khảo sát mệnh giá gói bảo hiểm (triệu đồng/năm) mà $20$ khách hàng lựa chọn:
#align(center)[
  #table(
    columns: 5,
    align: center,
    [*Gói bảo hiểm*], [$10$], [$15$], [$20$], [$30$],
    [*Số khách hàng*], [$3$], [$11$], [$4$], [$2$]
  )
]
Mốt $M_o$ của mẫu số liệu trên bằng],
    (
        True([$15$ triệu đồng]),
        [$11$ khách hàng],
        [$20$ triệu đồng],
        [$10$ triệu đồng]
    ),
    loigiai: [
        Mức $15$ triệu đồng có số khách hàng chọn nhiều nhất ($11$ người). Do đó $M_o = 15$ triệu đồng.
    ]
)

// TN 12
#tn([Độ lệch chuẩn lợi nhuận của một dự án bất động sản là $s = 2$ tỷ đồng. Phương sai lợi nhuận của dự án bằng],
    (
        True([$4 text(" tỷ đồng")^2$]),
        [$2 text(" tỷ đồng")^2$],
        [$1.414 text(" tỷ đồng")^2$],
        [$8 text(" tỷ đồng")^2$]
    ),
    loigiai: [
        $ s^2 = 2^2 = 4 text(" tỷ đồng")^2 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Đầu tư danh mục 2 tài sản qua phương sai gộp)
#ds([Một quỹ tài chính phân bổ vốn vào hai chi nhánh kinh doanh độc lập:
- Chi nhánh Miền Bắc gồm $n_1 = 10$ dự án, tỷ suất lợi nhuận trung bình $overline(x)_1 = 15%$, phương sai $s_1^2 = 4$.
- Chi nhánh Miền Nam gồm $n_2 = 10$ dự án, tỷ suất lợi nhuận trung bình $overline(x)_2 = 25%$, phương sai $s_2^2 = 4$.
Xét tính đúng sai của các nhận định tài chính sau về mẫu gộp $20$ dự án của toàn quỹ:],
  (
    True([Tỷ suất lợi nhuận trung bình chung của toàn bộ $20$ dự án là $overline(x) = 20%$.]),
    True([Tổng bình phương sai lệch nội bộ của từng chi nhánh so với mức trung bình của chính mình là $n_1 s_1^2 = n_2 s_2^2 = 40$.]),
    True([Phương sai gộp của toàn bộ $20$ dự án bằng $s^2 = 29$.]),
    [Vì hai chi nhánh đều có độ biến động nội bộ nhỏ ($s_1 = s_2 = 2%$) nên toàn bộ quỹ cũng có phương sai bằng $4$.]
  ),
  loigiai: [
    #step([Lợi nhuận trung bình chung])
    $overline(x) = (10 dot 15% + 10 dot 25%) / 20 = 20%$. Mệnh đề a ĐÚNG.

    #step([Tổng bình phương nội bộ])
    $n_1 s_1^2 = 10 dot 4 = 40$. Mệnh đề b ĐÚNG.

    #step([Phương sai gộp])
    $s^2 = (n_1 (s_1^2 + (overline(x)_1 - overline(x))^2) + n_2 (s_2^2 + (overline(x)_2 - overline(x))^2)) / (n_1 + n_2)$
    $= (10(4 + (15-20)^2) + 10(4 + (25-20)^2)) / 20 = (10(4 + 25) + 10(4 + 25)) / 20 = 29$. Mệnh đề c ĐÚNG.

    #step([Phân tích rủi ro gộp])
    Khoảng cách chênh lệch lợi nhuận giữa hai miền ($15%$ và $25%$) làm gia tăng phương sai gộp lên $29 > 4$. Khẳng định bằng $4$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quản trị kho vận chuỗi cung ứng)
#ds([Một chuỗi bán lẻ phân tích nhu cầu nhập hàng hàng ngày (thùng hàng) của $10$ siêu thị thành viên:
#align(center)[
  $20; quad 25; quad 28; quad 30; quad 30; quad 32; quad 35; quad 40; quad 45; quad 120$
]
Kỹ sư chuỗi cung ứng nghi vấn đơn hàng $120$ thùng là do một siêu thị nhập dự trữ đột xuất mùa bão.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trung vị nhu cầu nhập hàng bình thường của các siêu thị là $M_e = 31$ thùng hàng.]),
    True([Tứ phân vị thứ nhất $Q_1 = 28$ và tứ phân vị thứ ba $Q_3 = 40$ (thùng hàng).]),
    True([Khoảng tứ phân vị của nhu cầu nhập hàng là $Delta_Q = 12$ thùng hàng.]),
    [Đơn hàng $120$ thùng hàng chưa vượt ngưỡng rào trên nên vẫn được coi là nhu cầu tiêu dùng bình thường.]
  ),
  loigiai: [
    #step([Tính trung vị])
    $n = 10$, vị trí thứ $5$ và $6$ là $30$ và $32 => M_e = (30 + 32)/2 = 31$ thùng. Mệnh đề a ĐÚNG.

    #step([Tính các tứ phân vị])
    Nửa dưới $5$ số: $20; 25; 28; 30; 30 => Q_1 = 28$.
    Nửa trên $5$ số: $32; 35; 40; 45; 120 => Q_3 = 40$. Mệnh đề b ĐÚNG.

    #step([Khoảng tứ phân vị])
    $Delta_Q = 40 - 28 = 12$ thùng. Mệnh đề c ĐÚNG.

    #step([Kiểm tra ngoại lệ])
    Ngưỡng rào trên: $T_2 = Q_3 + 1.5 Delta_Q = 40 + 1.5(12) = 40 + 18 = 58$ thùng.
    Vì $120 > 58$ nên đây là đơn hàng bất thường đột biến, cần tách khỏi quy hoạch dự trữ thông thường. Mệnh đề d SAI.
  ]
)

// DS 3 (Tối ưu vị trí tổng kho phân phối L1 và L2)
#ds([Ba trung tâm thương mại lớn $A, B, C$ nằm dọc theo tuyến đại lộ tại các mốc km: $x_A = 10, x_B = 30, x_C = 80$. Một tập đoàn bán lẻ cần chọn vị trí km số $x$ để xây dựng tổng kho phân phối.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Nếu mục tiêu là cực tiểu hóa tổng chi phí vận tải tuyến tính $g(x) = |x-10| + |x-30| + |x-80|$, vị trí tối ưu là xây kho tại trung vị $x = 30$ km.]),
    True([Nếu mục tiêu là cực tiểu hóa tổng bình phương khoảng cách $f(x) = (x-10)^2 + (x-30)^2 + (x-80)^2$, vị trí tối ưu là tại số trung bình $x = 40$ km.]),
    True([Tại vị trí trung vị $x = 30$, tổng cự ly vận chuyển bằng $g(30) = 20 + 0 + 50 = 70$ km, ngắn hơn tổng cự ly tại vị trí số trung bình $g(40) = 30 + 10 + 40 = 80$ km.]),
    [Vị trí số trung bình luôn mang lại tổng cự ly vận chuyển ngắn hơn vị trí trung vị.]
  ),
  loigiai: [
    #step([Tối ưu tổng cự ly L1])
    Hàm $g(x) = |x-10| + |x-30| + |x-80|$ đạt giá trị nhỏ nhất tại trung vị $M_e = 30$. Mệnh đề a ĐÚNG.

    #step([Tối ưu tổng bình phương L2])
    Hàm $f(x) = 3x^2 - 2(120)x + (100 + 900 + 6400)$ đạt cực tiểu tại $x = 120 / 3 = 40 = overline(x)$. Mệnh đề b ĐÚNG.

    #step([So sánh tổng khoảng cách])
    $g(30) = 20 + 0 + 50 = 70$ km.
    $g(40) = 30 + 10 + 40 = 80$ km. $70 < 80$. Mệnh đề c ĐÚNG.

    #step([Định lý tối ưu])
    Trung vị luôn tối thiểu hóa tổng khoảng cách tuyệt đối. Khẳng định số trung bình luôn ngắn hơn là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Tham số hạn mức tín dụng)
#ds([Một ngân hàng thẩm định hạn mức tín dụng (triệu đồng) cho $5$ khách hàng doanh nghiệp:
#align(center)[
  $10; quad 20; quad 30; quad 40; quad m$ (với $m$ là hạn mức của khách hàng VIP thứ năm)
]
Xét tính đúng sai của các nhận định toán học sau:],
  (
    True([Hạn mức tín dụng trung bình của nhóm là $overline(x)(m) = (100 + m) / 5$.]),
    True([Tổng bình phương độ lệch của mẫu số liệu đạt giá trị nhỏ nhất khi $m = 25$ triệu đồng.]),
    True([Khi $m = 25$, phương sai của mẫu hạn mức tín dụng đạt giá trị nhỏ nhất bằng $s_min^2 = 100$.]),
    [Giá trị trung vị của hạn mức tín dụng luôn không đổi bằng $30$ triệu đồng với mọi giá trị của $m$.]
  ),
  loigiai: [
    #step([Số trung bình])
    $overline(x) = (10 + 20 + 30 + 40 + m) / 5 = (100 + m) / 5$. Mệnh đề a ĐÚNG.

    #step([Cực trị phương sai theo m])
    Tổng bình phương độ lệch đạt cực tiểu khi phần tử bổ sung $m$ bằng trung bình cộng của $4$ phần tử ban đầu:
    $m = (10 + 20 + 30 + 40) / 4 = 100 / 4 = 25$ triệu đồng. Mệnh đề b ĐÚNG.

    #step([Phương sai nhỏ nhất])
    Khi $m = 25$: mẫu gồm $10; 20; 25; 30; 40$.
    $overline(x) = 125 / 5 = 25$.
    $s^2 = ((10-25)^2 + (20-25)^2 + (25-25)^2 + (30-25)^2 + (40-25)^2) / 5$
    $= (225 + 25 + 0 + 25 + 225) / 5 = 500 / 5 = 100$. Mệnh đề c ĐÚNG.

    #step([Trung vị theo m])
    Nếu $m = 5$, mẫu sắp xếp là $5; 10; 20; 30; 40 => M_e = 20 != 30$.
    Khẳng định trung vị luôn bằng $30$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tính phương sai doanh thu)
#tln([Một chuỗi cửa hàng bán lẻ có $n = 5$ chi nhánh ghi nhận doanh thu hàng tháng có tổng $sum_(i=1)^5 x_i = 50$ tỷ đồng và tổng bình phương doanh thu $sum_(i=1)^5 x_i^2 = 580 (text("tỷ đồng"))^2$.
Tính phương sai $s^2$ của doanh thu các chi nhánh.],
    [16],
    loigiai: [
        #step([Tính doanh thu trung bình])
        $ overline(x) = 50 / 5 = 10 text(" tỷ đồng") $
        
        #step([Tính phương sai])
        $ s^2 = 1/5 sum_(i=1)^5 x_i^2 - (overline(x))^2 = 580 / 5 - 10^2 = 116 - 100 = 16 $
    ]
)

// TLN 2 (Khoảng tứ phân vị số ngày tồn kho)
#tln([Thời gian lưu kho (ngày) của $10$ lô hàng thiết bị điện tử là:
#align(center)[
  $12; quad 15; quad 18; quad 20; quad 24; quad 28; quad 30; quad 35; quad 40; quad 52$
]
Tìm khoảng tứ phân vị $Delta_Q$ của thời gian lưu kho theo đơn vị ngày.],
    [17],
    loigiai: [
        #step([Xác định Q1 và Q3])
        $n = 10$, các số đã xếp tăng dần:
        - Nửa dưới gồm $5$ số: $12; 15; 18; 20; 24 => Q_1 = 18$ ngày.
        - Nửa trên gồm $5$ số: $28; 30; 35; 40; 52 => Q_3 = 35$ ngày.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 35 - 18 = 17 text(" ngày") $
    ]
)

// TLN 3 (Khoảng biến thiên giá cổ phiếu)
#tln([Giá đóng cửa của một mã cổ phiếu (nghìn đồng) trong một tuần giao dịch:
#align(center)[
  $24; quad 25; quad 26; quad 28; quad 30; quad 36$
]
Tìm khoảng biến thiên $R$ của giá cổ phiếu theo đơn vị nghìn đồng.],
    [12],
    loigiai: [
        #step([Xác định Max và Min])
        $x_max = 36$, $x_min = 24$.
        $ R = 36 - 24 = 12 text(" nghìn đồng") $
    ]
)

// TLN 4 (Hệ số biến thiên CV)
#tln([Một danh mục đầu tư tài chính có tỷ suất sinh lời trung bình $overline(x) = 15%$/năm và độ lệch chuẩn $s = 3%$/năm.
Tính hệ số biến thiên $C V = s / overline(x) dot 100%$ của danh mục (theo đơn vị %).],
    [20],
    loigiai: [
        #step([Tính hệ số biến thiên])
        $ C V = 3 / 15 dot 100% = 20% $
    ]
)

// TLN 5 (Ngưỡng trên ngoại lệ khiếu nại bồi thường)
#tln([Số lượng hồ sơ khiếu nại bảo hiểm hàng tháng có tứ phân vị thứ nhất $Q_1 = 30$ hồ sơ và tứ phân vị thứ ba $Q_3 = 70$ hồ sơ.
Tính giá trị của ngưỡng trên $T = Q_3 + 1.5 Delta_Q$ để ban thanh tra kích hoạt kiểm toán rủi ro gian lận.],
    [130],
    loigiai: [
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = Q_3 - Q_1 = 70 - 30 = 40 text(" hồ sơ") $
        
        #step([Tính ngưỡng trên])
        $ T = Q_3 + 1.5 Delta_Q = 70 + 1.5(40) = 70 + 60 = 130 text(" hồ sơ") $
    ]
)

// TLN 6 (Độ lệch chuẩn sau biến đổi quy đổi ngoại tệ)
#tln([Biến động giá vàng trong nước có độ lệch chuẩn $s_x = 2$ triệu đồng/lượng.
Khi quy đổi theo đơn vị chỉ vàng và nhân với hệ số điều chỉnh ($y_i = -10 x_i + 50$), tính độ lệch chuẩn $s_y$ của mẫu số liệu mới.],
    [20],
    loigiai: [
        #step([Tính độ lệch chuẩn mới])
        Khi $y_i = a x_i + b$ với $a = -10$:
        $ s_y = |-10| dot s_x = 10 dot 2 = 20 text(" triệu đồng") $
    ]
)

] // end make-questions

#make-questions()
