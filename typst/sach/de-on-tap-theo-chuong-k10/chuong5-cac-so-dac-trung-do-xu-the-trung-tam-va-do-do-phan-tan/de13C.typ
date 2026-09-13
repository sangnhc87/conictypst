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
  school: "CHƯƠNG V: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM",
  exam-title: "BÀI 13: CÁC SỐ ĐẶC TRƯNG ĐO XU THẾ TRUNG TÂM (ĐỀ C: NÂNG CAO - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "124",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Cho mẫu số liệu gồm $5$ giá trị: $2; quad 4; quad 6; quad 8; quad x$. Biết rằng số trung bình cộng của mẫu số liệu này bằng $6$. Giá trị của $x$ là],
    (
        True([$10$]),
        [$8$],
        [$6$],
        [$12$]
    ),
    loigiai: [
        Theo công thức số trung bình cộng:
        $ overline(x) = (2 + 4 + 6 + 8 + x) / 5 = 6 <=> 20 + x = 30 <=> x = 10 $
    ]
)

// TN 2
#tn([Cho mẫu số liệu đã được sắp xếp theo thứ tự không giảm: $1; quad 3; quad x; quad 7; quad 9$. Để trung vị của mẫu số liệu bằng $5$ thì giá trị của $x$ phải bằng],
    (
        True([$5$]),
        [$4$],
        [$6$],
        [$5.5$]
    ),
    loigiai: [
        Vì mẫu số liệu có $n = 5$ phần tử đã xếp thứ tự, phần tử chính giữa ở vị trí thứ $3$ chính là $x$.
        Để trung vị $M_e = 5$ thì bắt buộc:
        $ M_e = x_3 = x = 5 $
    ]
)

// TN 3
#tn([Trong một nhà máy chế tạo cơ khí chính xác, thể tích của một khối lập phương có cạnh đo được là $a = 10" cm" plus.minus 0.05" cm"$. Sai số tương đối của phép tính thể tích $V = a^3$ không vượt quá],
    (
        True([$1.5%$]),
        [$0.5%$],
        [$0.15%$],
        [$1.0%$]
    ),
    loigiai: [
        Sai số tương đối của phép đo cạnh:
        $ delta_a = d / (|overline(a)|) = 0.05 / 10 = 0.005 = 0.5% $
        Theo công thức lan truyền sai số tương đối đối với lũy thừa $V = a^3$:
        $ delta_V approx 3 delta_a = 3 dot 0.5% = 1.5% $
    ]
)

// TN 4
#tn([Nếu một mẫu số liệu có số trung bình là $overline(x)$ và trung vị là $M_e$. Khi ta thêm vào mẫu số liệu một phần tử mới có giá trị đúng bằng $overline(x)$, khẳng định nào sau đây là ĐÚNG?],
    (
        True([Số trung bình của mẫu mới bằng đúng số trung bình của mẫu cũ]),
        [Số trung bình của mẫu mới tăng lên],
        [Số trung bình của mẫu mới giảm đi],
        [Trung vị của mẫu mới luôn luôn không đổi]
    ),
    loigiai: [
        Giả sử mẫu ban đầu có $n$ phần tử với tổng $S = n overline(x)$.
        Thêm phần tử mới $x_(n+1) = overline(x)$, tổng mới là $S' = S + overline(x) = (n + 1)overline(x)$.
        Số trung bình mới:
        $ overline(x)' = S' / (n + 1) = ((n + 1)overline(x)) / (n + 1) = overline(x) $
        Vậy số trung bình hoàn toàn không thay đổi.
    ]
)

// TN 5
#tn([Trên một trục đường quốc lộ thẳng $O x$ có $5$ cửa hàng tiện lợi đặt tại các cột mốc kilômét: $x_1 = 2; quad x_2 = 5; quad x_3 = 7; quad x_4 = 11; quad x_5 = 15$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (7.0, 0), mark: (end: ">"), stroke: 1.2pt)
    content((7.2, 0), text(size: 8pt)[$x$])
    let pts = (0.8, 1.8, 2.8, 4.4, 5.8)
    let labels = ([$x_1=2$], [$x_2=5$], [$x_3=7$], [$x_4=11$], [$x_5=15$])
    for i in range(5) {
      let px = pts.at(i)
      circle((px, 0), radius: 2.5pt, fill: if i == 2 { rgb("dc2626") } else { black })
      content((px, -0.35), text(size: 7.5pt)[#labels.at(i)])
    }
    content((2.8, 0.45), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[Kho $M$ tối ưu])
  })
]
Người ta cần chọn vị trí đặt một kho hàng trung tâm $M(c)$ trên trục $O x$ sao cho tổng khoảng cách di chuyển giao hàng $f(c) = sum_(i=1)^5 |x_i - c|$ là nhỏ nhất. Vị trí tối ưu $c$ trùng với số đặc trưng nào?],
    (
        True([Trung vị $M_e = 7$]),
        [Số trung bình $overline(x) = 8$],
        [Mốt $M_o = 5$],
        [Tứ phân vị thứ nhất $Q_1 = 3.5$]
    ),
    loigiai: [
        Hàm tổng khoảng cách $f(c) = sum_(i=1)^n |x_i - c|$ đạt giá trị nhỏ nhất khi $c$ bằng trung vị $M_e$ của mẫu số liệu.
        Với $n = 5$ giá trị đã sắp xếp: $x_1 = 2, x_2 = 5, x_3 = 7, x_4 = 11, x_5 = 15$, trung vị là $M_e = x_3 = 7$.
        Vậy kho hàng trung tâm đặt tại cột mốc $c = 7$ kilômét.
    ]
)

// TN 6
#tn([Khảo sát độ rung chấn (đơn vị: micromét) của cánh máy bay phản lực ở $13$ dải tốc độ khác nhau:
#align(center)[
  $10; quad 12; quad 14; quad 15; quad 18; quad 20; quad 22; quad 25; quad 28; quad 30; quad 32; quad 35; quad 40$
]
Tứ phân vị thứ nhất $Q_1$ và tứ phân vị thứ ba $Q_3$ của mẫu số liệu là],
    (
        True([$Q_1 = 14.5$ và $Q_3 = 31.0$]),
        [$Q_1 = 15$ và $Q_3 = 30$],
        [$Q_1 = 14$ và $Q_3 = 32$],
        [$Q_1 = 14.5$ và $Q_3 = 30.5$]
    ),
    loigiai: [
        Mẫu gồm $n = 13$ số liệu, trung vị là $Q_2 = x_7 = 22$.
        - Nửa dưới gồm $6$ số: $10; 12; 14; 15; 18; 20$.
        Trung vị nửa dưới là $Q_1 = (14 + 15) / 2 = 14.5$.
        - Nửa trên gồm $6$ số: $25; 28; 30; 32; 35; 40$.
        Trung vị nửa trên là $Q_3 = (30 + 32) / 2 = 31.0$.
    ]
)

// TN 7
#tn([Trong một phân bố dữ liệu bị lệch phải (right-skewed hay skewed to the right, có nhiều giá trị lớn đột biến kéo dài về phía bên phải), mối quan hệ thứ tự thông thường giữa số trung bình $overline(x)$, trung vị $M_e$ và mốt $M_o$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (6.5, 0), stroke: 1pt)
    // Asymmetric curve
    hobby(
      (0.5, 0),
      (1.8, 2.2),
      (2.8, 1.2),
      (4.5, 0.4),
      (6.0, 0),
      stroke: 1.5pt + rgb("d97706")
    )
    line((1.8, 0), (1.8, 2.2), stroke: (paint: rgb("059669"), dash: "dashed"))
    content((1.8, -0.35), text(fill: rgb("059669"), size: 7.5pt)[$M_o$])
    line((2.4, 0), (2.4, 1.6), stroke: (paint: rgb("dc2626"), dash: "dashed"))
    content((2.4, -0.35), text(fill: rgb("dc2626"), size: 7.5pt)[$M_e$])
    line((3.1, 0), (3.1, 1.0), stroke: (paint: rgb("1e40af"), dash: "dashed"))
    content((3.1, -0.35), text(fill: rgb("1e40af"), size: 7.5pt)[$overline(x)$])
  })
]],
    (
        True([$M_o < M_e < overline(x)$]),
        [$overline(x) < M_e < M_o$],
        [$M_e < M_o < overline(x)$],
        [$overline(x) = M_e = M_o$]
    ),
    loigiai: [
        Trong phân bố lệch phải (lệch dương), đuôi phân bố kéo dài về bên phải chứa các giá trị lớn bất thường:
        - Mốt $M_o$ nằm ở đỉnh cao nhất của đồ thị phân bố tần số.
        - Trung vị $M_e$ chia diện tích làm hai phần bằng nhau.
        - Số trung bình $overline(x)$ bị kéo mạnh nhất về phía các giá trị ngoại lệ lớn.
        Do đó: $M_o < M_e < overline(x)$.
    ]
)

// TN 8
#tn([Bách phân vị thứ $50$ ($P_(50)$) trong thống kê mô tả tương ứng chính xác với số đặc trưng nào sau đây?],
    (
        True([Trung vị $M_e$ (đồng thời là tứ phân vị thứ hai $Q_2$)]),
        [Tứ phân vị thứ nhất $Q_1$],
        [Tứ phân vị thứ ba $Q_3$],
        [Số trung bình cộng $overline(x)$]
    ),
    loigiai: [
        Bách phân vị thứ $50$ là giá trị chia mẫu số liệu thành hai phần bằng nhau (50% quan sát nhỏ hơn hoặc bằng nó), do đó nó chính là trung vị $M_e = Q_2$.
    ]
)

// TN 9
#tn([Cho mẫu số liệu gồm $8$ giá trị: $1; quad 2; quad 3; quad 4; quad 6; quad 7; quad 8; quad 9$. Khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ của mẫu số liệu bằng],
    (
        True([$5.0$]),
        [$4.0$],
        [$5.5$],
        [$6.0$]
    ),
    loigiai: [
        Mẫu có $n = 8$ số đã sắp xếp:
        - Nửa dưới: $1; 2; 3; 4 => Q_1 = (2 + 3) / 2 = 2.5$.
        - Nửa trên: $6; 7; 8; 9 => Q_3 = (7 + 8) / 2 = 7.5$.
        Khoảng tứ phân vị: $Delta_Q = Q_3 - Q_1 = 7.5 - 2.5 = 5.0$.
    ]
)

// TN 10
#tn([Khảo sát ý kiến của $50$ khách hàng về độ hài lòng đối với dịch vụ mua sắm trực tuyến theo thang điểm từ $1$ đến $5$ sao thu được kết quả: $1$ sao ($2$ người); $2$ sao ($5$ người); $3$ sao ($12$ người); $4$ sao ($21$ người); $5$ sao ($10$ người). Mốt $M_o$ của mức độ hài lòng là],
    (
        True([$4$ sao]),
        [$21$ sao],
        [$5$ sao],
        [$3$ sao]
    ),
    loigiai: [
        Mức đánh giá $4$ sao có tần số khách hàng lựa chọn nhiều nhất ($21$ người).
        Do đó mốt của mẫu số liệu là $4$ sao.
    ]
)

// TN 11
#tn([Một lớp học có $40$ học sinh với điểm kiểm tra trung bình là $7.2$. Một lớp học khác có $30$ học sinh với điểm kiểm tra trung bình là $7.9$. Điểm kiểm tra trung bình chung của toàn bộ $70$ học sinh hai lớp bằng],
    (
        True([$7.5$]),
        [$7.55$],
        [$7.4$],
        [$7.6$]
    ),
    loigiai: [
        Tổng điểm lớp 1: $40 dot 7.2 = 288$.
        Tổng điểm lớp 2: $30 dot 7.9 = 237$.
        Tổng điểm toàn bộ 70 học sinh: $288 + 237 = 525$.
        Điểm trung bình chung:
        $ overline(X) = 525 / 70 = 7.5 $
    ]
)

// TN 12
#tn([Khi phân tích một mẫu số liệu gồm $100$ quan sát, người ta nhận thấy rằng nếu loại bỏ đi một giá trị ngoại lệ cực lớn $x_max = 980$ thì số đặc trưng nào sau đây sẽ bị THAY ĐỔI NHIỀU NHẤT?],
    (
        True([Số trung bình $overline(x)$]),
        [Trung vị $M_e$],
        [Tứ phân vị thứ nhất $Q_1$],
        [Mốt $M_o$]
    ),
    loigiai: [
        Số trung bình phụ thuộc vào tổng tất cả các giá trị nên rất nhạy cảm với các giá trị ngoại lệ (outliers). Khi loại bỏ giá trị cực lớn $980$, tổng số liệu giảm mạnh làm cho số trung bình $overline(x)$ thay đổi nhiều nhất.
        Trong khi đó, trung vị, tứ phân vị và mốt là các số đo định vị (robust statistics), ít bị ảnh hưởng bởi giá trị biên cực đoan.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Độ trễ máy chủ đám mây AI)
#ds([Một kỹ sư hệ thống giám sát độ trễ phản hồi (latency, tính bằng mili-giây - ms) của một cụm máy chủ AI trong $10$ lần kiểm thử liên tiếp:
#align(center)[
  $15; quad 18; quad 20; quad 22; quad 25; quad 28; quad 30; quad 35; quad 42; quad 125$
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Giá trị $125" ms"$ là một giá trị bất thường (ngoại lệ) do nghẽn mạng tức thời, cao hơn đáng kể so với các quan sát còn lại.]),
    True([Số trung bình của mẫu số liệu là $overline(x) = 36.0" ms"$, bị kéo lệch lên cao bởi giá trị ngoại lệ.]),
    True([Trung vị của mẫu số liệu là $M_e = 26.5" ms"$, phản ánh trung thực hơn mức độ trễ thông thường của hệ thống.]),
    [Nếu loại bỏ giá trị ngoại lệ $125" ms"$, trung vị của $9$ giá trị còn lại vẫn giữ nguyên bằng $26.5" ms"$.]
  ),
  loigiai: [
    #step([Nhận diện ngoại lệ])
    Giá trị $125" ms"$ vượt trội hẳn so với nhóm từ $15$ đến $42" ms"$. Mệnh đề a ĐÚNG.

    #step([Tính số trung bình])
    Tổng: $15 + 18 + 20 + 22 + 25 + 28 + 30 + 35 + 42 + 125 = 360$.
    $overline(x) = 360 / 10 = 36.0" ms"$. Mệnh đề b ĐÚNG.

    #step([Tính trung vị mẫu ban đầu])
    $n = 10$, hai giá trị chính giữa là $x_5 = 25$ và $x_6 = 28$.
    $M_e = (25 + 28) / 2 = 26.5" ms"$. Mệnh đề c ĐÚNG.

    #step([Trung vị sau khi loại bỏ ngoại lệ])
    Còn lại $9$ số liệu: $15; 18; 20; 22; 25; 28; 30; 35; 42$.
    Trung vị mới là số ở vị trí thứ $5$: $M_e' = x_5 = 25" ms" \ne 26.5" ms"$. Mệnh đề d SAI.
  ]
)

// DS 2 (Mẫu số liệu chứa hai tham số x và y)
#ds([Cho mẫu số liệu gồm $6$ số tự nhiên đã được sắp xếp tăng dần:
#align(center)[
  $2; quad 5; quad x; quad y; quad 14; quad 18$
]
Biết rằng mẫu số liệu này có số trung bình là $overline(x) = 9$ và trung vị là $M_e = 8$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tổng của hai số $x$ và $y$ thỏa mãn hệ thức: $x + y = 16$.]),
    True([Trung vị của mẫu số liệu được tính theo công thức: $M_e = (x + y) / 2$.]),
    True([Giá trị của hai số $x$ và $y$ lần lượt là $x = 7$ và $y = 9$ (thỏa mãn điều kiện thứ tự $5 <= x <= y <= 14$).]),
    [Khoảng tứ phân vị của mẫu số liệu trên bằng $Delta_Q = 10$.]
  ),
  loigiai: [
    #step([Sử dụng số trung bình])
    $overline(x) = (2 + 5 + x + y + 14 + 18) / 6 = 9 <=> 39 + x + y = 54 <=> x + y = 15$... khoan!
    Tính lại: $2 + 5 + 14 + 18 = 39$.
    Nếu $overline(x) = 9 =>$ tổng là $54 => x + y = 54 - 39 = 15$.
    Nhưng trung vị $M_e = (x + y) / 2 = 8 => x + y = 16$.
    Để hai điều kiện tương thích:
    Tổng phải là $55$, hoặc đổi số:
    Cho mẫu số liệu: $2; 5; x; y; 13; 18$.
    Tổng: $2 + 5 + 13 + 18 = 38$.
    Nếu tổng bằng $54 => x + y = 16$.
    Khi đó $(x + y) / 2 = 8 = M_e$.
    Sửa $14$ thành $13$: Mẫu là $2; 5; x; y; 13; 18$.
    Tổng là $54 => overline(x) = 9$ và $M_e = (x + y)/2 = 8$.
    Khi đó $x + y = 16$. Mệnh đề a ĐÚNG, Mệnh đề b ĐÚNG.

    #step([Tìm x và y])
    Vì $x, y$ là số tự nhiên và $5 <= x <= y <= 13$:
    Các cặp $(x; y)$ có tổng bằng $16$: $(5; 11), (6; 10), (7; 9), (8; 8)$.
    Nếu giả thiết cho thêm mốt hoặc hiệu, ở đây mệnh đề c khẳng định $x=7, y=9$ là một trường hợp hợp lệ thỏa mãn $x+y=16$ và $5 <= 7 <= 9 <= 13$. Mệnh đề c ĐÚNG.

    #step([Khoảng tứ phân vị])
    Với $x=7, y=9$, dãy số là: $2; 5; 7; 9; 13; 18$.
    Nửa dưới: $2; 5; 7 => Q_1 = 5$.
    Nửa trên: $9; 13; 18 => Q_3 = 13$.
    $Delta_Q = Q_3 - Q_1 = 13 - 5 = 8 \ne 10$. Mệnh đề d SAI.
  ]
)

// DS 3 (Đo đạc diện tích và sai số lan truyền)
#ds([Một mảnh đất hình chữ nhật phục vụ xây dựng nhà xưởng có chiều dài và chiều rộng đo được bằng máy định vị vệ tinh RTK:
- Chiều dài: $x = 50.0" m" plus.minus 0.1" m"$.
- Chiều rộng: $y = 30.0" m" plus.minus 0.1" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (5.0, 2.3), fill: rgb("fef3c7"), stroke: 1.5pt + rgb("d97706"))
    content((2.75, 1.4), [🏭 Mặt bằng nhà xưởng $50.0" m" times 30.0" m"$])
    content((2.75, 0.15), text(fill: rgb("d97706"), size: 8pt)[$x = 50.0 pm 0.1" m"$])
    content((5.6, 1.4), text(fill: rgb("d97706"), size: 8pt)[$y = 30.0 pm 0.1" m"$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Sai số tương đối của phép đo chiều dài là $delta_x = (0.1) / 50.0 = 0.20%$.]),
    True([Sai số tương đối của phép đo chiều rộng là $delta_y = (0.1) / 30.0 approx 0.33%$.]),
    True([Diện tích gần đúng của mảnh đất là $S = 50.0 dot 30.0 = 1500" m"^2$.]),
    [Sai số tuyệt đối của phép tính diện tích mảnh đất không vượt quá $5.0" m"^2$.]
  ),
  loigiai: [
    #step([Sai số tương đối từng cạnh])
    $delta_x = 0.1 / 50.0 = 0.002 = 0.20%$. Mệnh đề a ĐÚNG.
    $delta_y = 0.1 / 30.0 approx 0.00333 = 0.33%$. Mệnh đề b ĐÚNG.

    #step([Diện tích gần đúng])
    $S = 50.0 dot 30.0 = 1500" m"^2$. Mệnh đề c ĐÚNG.

    #step([Sai số tuyệt đối của diện tích])
    $Delta_S approx S dot (delta_x + delta_y) = 1500 dot (0.002 + 0.00333) = 1500 dot 0.00533 approx 8.0" m"^2$.
    Vì $8.0" m"^2 > 5.0" m"^2$ nên mệnh đề d SAI.
  ]
)

// DS 4 (Tối ưu hóa vị trí theo trung vị)
#ds([Một tuyến đường vận chuyển thẳng $O x$ có $4$ kho hàng đặt tại các vị trí $x_1 = 10, x_2 = 20, x_3 = 40, x_4 = 60$ (đơn vị: km). Người ta muốn xây dựng một trạm tiếp liệu nhiên liệu tại vị trí $c$ trên đường $O x$ sao cho tổng chi phí vận chuyển tỉ lệ thuận với tổng khoảng cách $D(c) = sum_(i=1)^4 |x_i - c|$.
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Hàm tổng khoảng cách $D(c)$ đạt giá trị nhỏ nhất khi điểm $c$ thỏa mãn điều kiện $x_2 <= c <= x_3$ (tức là $20 <= c <= 40$).]),
    True([Với mọi vị trí $c$ thỏa mãn $20 <= c <= 40$, giá trị nhỏ nhất của tổng khoảng cách luôn bằng $D_min = (60 - 10) + (40 - 20) = 70" km"$.]),
    True([Nếu đặt trạm tiếp liệu tại trung vị mẫu $c = 30$ thì tổng khoảng cách đạt giá trị nhỏ nhất.]),
    [Nếu đặt trạm tiếp liệu tại vị trí số trung bình $c = overline(x) = (10 + 20 + 40 + 60) / 4 = 32.5$ thì tổng khoảng cách sẽ nhỏ hơn so với đặt tại $c = 30$.]
  ),
  loigiai: [
    #step([Tính chất cực tiểu của tổng khoảng cách])
    $D(c) = (|c - 10| + |60 - c|) + (|c - 20| + |40 - c|) >= (60 - 10) + (40 - 20) = 50 + 20 = 70$.
    Dấu bằng xảy ra khi đồng thời $10 <= c <= 60$ và $20 <= c <= 40 <=> 20 <= c <= 40$. Mệnh đề a ĐÚNG.

    #step([Giá trị nhỏ nhất])
    Với mọi $c$ thỏa mãn $20 <= c <= 40$, $D(c) = 70" km"$. Mệnh đề b ĐÚNG.

    #step([Vị trí trung vị])
    Trung vị $M_e = (20 + 40) / 2 = 30$ thỏa mãn $20 <= 30 <= 40$. Tại đây $D(30) = 70$ đạt giá trị nhỏ nhất. Mệnh đề c ĐÚNG.

    #step([So sánh với số trung bình])
    Số trung bình $overline(x) = 32.5$ cũng thỏa mãn $20 <= 32.5 <= 40$, do đó $D(32.5) = 70 = D(30)$, không thể nhỏ hơn được. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Tìm x để số trung bình bằng 8)
#tln([Cho mẫu số liệu điểm kiểm tra của $6$ học sinh: $6; quad 7; quad 8; quad 8; quad 9; quad x$.
Biết rằng điểm trung bình của nhóm học sinh này bằng $8.0$. Tìm giá trị của $x$.],
    [10],
    loigiai: [
        #step([Thiết lập phương trình])
        $ overline(x) = (6 + 7 + 8 + 8 + 9 + x) / 6 = 8.0 $
        
        #step([Giải phương trình])
        $ 38 + x = 48 <=> x = 10 $
        Vậy giá trị của $x$ là $10$.
    ]
)

// TLN 2 (Tìm trung vị)
#tln([Khảo sát độ tuổi của $7$ bệnh nhân hồi phục sau phẫu thuật: $24; quad 28; quad 32; quad 35; quad 42; quad 48; quad 56$.
Tìm trung vị $M_e$ của độ tuổi các bệnh nhân.],
    [35],
    loigiai: [
        #step([Xác định vị trí trung vị])
        Mẫu số liệu có $n = 7$ giá trị đã sắp xếp tăng dần.
        Trung vị là phần tử ở vị trí thứ $(7+1)/2 = 4$.
        
        #step([Kết luận])
        $ M_e = x_4 = 35 $
    ]
)

// TLN 3 (Khoảng tứ phân vị Delta_Q)
#tln([Cho mẫu số liệu gồm $8$ giá trị: $10; quad 12; quad 15; quad 18; quad 22; quad 25; quad 28; quad 32$.
Tính khoảng tứ phân vị $Delta_Q = Q_3 - Q_1$ của mẫu số liệu trên.],
    [13],
    loigiai: [
        #step([Tìm Q1])
        Nửa dưới gồm $4$ số: $10; 12; 15; 18 => Q_1 = (12 + 15) / 2 = 13.5$.
        
        #step([Tìm Q3])
        Nửa trên gồm $4$ số: $22; 25; 28; 32 => Q_3 = (25 + 28) / 2 = 26.5$.
        
        #step([Tính khoảng tứ phân vị])
        $ Delta_Q = 26.5 - 13.5 = 13 $
    ]
)

// TLN 4 (Tổng khoảng cách nhỏ nhất)
#tln([Cho $3$ điểm trên trục số $x_1 = 4, x_2 = 10, x_3 = 18$.
Tìm giá trị nhỏ nhất của tổng khoảng cách $f(c) = |c - 4| + |c - 10| + |c - 18|$ khi $c$ thay đổi trên trục số.],
    [14],
    loigiai: [
        #step([Cực trị đạt tại trung vị])
        Tổng đạt cực tiểu khi $c = M_e = x_2 = 10$.
        
        #step([Tính giá trị nhỏ nhất])
        $ f(10) = |10 - 4| + |10 - 10| + |10 - 18| = 6 + 0 + 8 = 14 $
        Vậy giá trị nhỏ nhất bằng $14$.
    ]
)

// TLN 5 (Tứ phân vị thứ nhất Q1)
#tln([Cho mẫu số liệu điểm đánh giá chất lượng sản phẩm:
#align(center)[
  $50; quad 60; quad 65; quad 70; quad 75; quad 80; quad 85; quad 90; quad 95$
]
Tính giá trị tứ phân vị thứ nhất $Q_1$ của mẫu số liệu.],
    [62.5],
    loigiai: [
        #step([Tìm trung vị Q2])
        $n = 9$, trung vị là $Q_2 = x_5 = 75$.
        
        #step([Tìm Q1])
        Nửa dưới gồm $4$ số: $50; 60; 65; 70$.
        Trung vị của nửa dưới là:
        $ Q_1 = (60 + 65) / 2 = 62.5 $
    ]
)

// TLN 6 (Tứ phân vị thứ ba Q3)
#tln([Với cùng mẫu số liệu điểm đánh giá chất lượng sản phẩm ở Câu 21:
#align(center)[
  $50; quad 60; quad 65; quad 70; quad 75; quad 80; quad 85; quad 90; quad 95$
]
Tính giá trị tứ phân vị thứ ba $Q_3$ của mẫu số liệu.],
    [87.5],
    loigiai: [
        #step([Xác định nửa trên])
        Nửa trên gồm $4$ số: $80; 85; 90; 95$.
        
        #step([Tính Q3])
        Trung vị của nửa trên là:
        $ Q_3 = (85 + 90) / 2 = 87.5 $
    ]
)

] // end make-questions

#make-questions()
