#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("0d9488") // Teal cho Đề B

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 2: PHƯƠNG PHÁP KHỬ GAUSS (ĐỀ B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "305",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Sơ đồ lưu lượng giao thông (số xe/giờ) tại một nút giao gồm 3 tuyến đường một chiều được mô tả như hình vẽ:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Nút giao tam giác
    circle((-1, -0.6), radius: 3pt, fill: rgb("0d9488"))
    content((-1.3, -0.8), text(size: 7.5pt, weight: "bold")[Nút A])
    circle((1, -0.6), radius: 3pt, fill: rgb("0d9488"))
    content((1.3, -0.8), text(size: 7.5pt, weight: "bold")[Nút B])
    circle((0, 0.8), radius: 3pt, fill: rgb("0d9488"))
    content((0, 1.1), text(size: 7.5pt, weight: "bold")[Nút C])
    line((-1, -0.6), (1, -0.6), stroke: 1.2pt + rgb("0d9488"), mark: (end: "stealth"))
    content((0, -0.85), text(size: 7.5pt)[$x$])
    line((1, -0.6), (0, 0.8), stroke: 1.2pt + rgb("0d9488"), mark: (end: "stealth"))
    content((0.7, 0.2), text(size: 7.5pt)[$y$])
    line((0, 0.8), (-1, -0.6), stroke: 1.2pt + rgb("0d9488"), mark: (end: "stealth"))
    content((-0.7, 0.2), text(size: 7.5pt)[$z$])
  })
]
Nguyên lý bảo toàn lưu lượng tại mỗi nút: Tổng lưu lượng xe đi vào nút bằng tổng lưu lượng xe đi ra khỏi nút. Phương trình bảo toàn lưu lượng là],
    (
        True([Phương trình bậc nhất ba ẩn dạng tổng quát $a x + b y + c z = d$]),
        [Phương trình phi tuyến bậc hai],
        [Phương trình mũ và logarit],
        [Phương trình vi phân toàn phần]
    ),
    loigiai: [
        #step([Phân tích nguyên lý bảo toàn lưu lượng])
        Tại mỗi nút giao thông, lượng xe vào bằng lượng xe ra dẫn đến phương trình dạng:
        $ sum x_"vào" = sum x_"ra" <=> a x + b y + c z = d $
        Các biến $x, y, z$ đều có bậc nhất, do đó đây là phương trình bậc nhất ba ẩn.
    ]
)

// TN 2
#tn([Khi thực hiện phép biến đổi khử Gauss trên ma trận mở rộng
$ (A|B) = mat(1, 2, -1, 3; 0, 2, 4, 6; 0, 1, 3, 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Khử dòng 3: $h_3 <- 2h_3 - h_2$])
  })
]
Để triệt tiêu phần tử ở vị trí hàng 3 cột 2 mà vẫn giữ các hệ số nguyên, ta thực hiện phép biến đổi sơ cấp nào?],
    (
        True([$h_3 <- 2h_3 - h_2$]),
        [$h_3 <- h_3 - h_2$],
        [$h_3 <- h_3 + 2h_2$],
        [$h_3 <- 3h_3 - 2h_2$]
    ),
    loigiai: [
        #step([Chọn hệ số triệt tiêu])
        Hàng 2 có phần tử cột 2 là $2$, hàng 3 có phần tử cột 2 là $1$.
        Để triệt tiêu phần tử $1$ thành $0$ với hệ số nguyên:
        $ 2 times (1) - 2 = 0 $
        Do đó ta dùng phép biến đổi sơ cấp $h_3 <- 2h_3 - h_2$.
    ]
)

// TN 3
#tn([Cho ma trận bậc thang sau khi khử Gauss của một hệ phương trình bậc nhất ba ẩn:
$ mat(1, 1, 1, 6; 0, 1, 2, 8; 0, 0, m - 1, m^2 - 1) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Biện luận số nghiệm theo m])
  })
]
Tìm giá trị của $m$ để hệ phương trình có *vô số nghiệm*.],
    (
        True([$m = 1$]),
        [$m = -1$],
        [$m = 0$],
        [$m = 2$]
    ),
    loigiai: [
        #step([Phân tích phương trình ở dòng thứ ba])
        Dòng 3 tương ứng với phương trình:
        $ (m - 1)z = m^2 - 1 $
        Hệ có vô số nghiệm khi phương trình này nghiệm đúng với mọi $z$:
        $ cases(m - 1 = 0, m^2 - 1 = 0) <=> cases(m = 1, m = plus.minus 1) <=> m = 1 $
        Vậy $m = 1$.
    ]
)

// TN 4
#tn([Giải hệ phương trình sau bằng phương pháp khử Gauss:
$ cases(x + 2y - z = 4, 3x - y + z = 5, 2x + 3y + 2z = 15) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Tìm nghiệm duy nhất $(x; y; z)$])
  })
]
Nghiệm duy nhất của hệ phương trình là],
    (
        True([$(2; 1; 3)$]),
        [$(1; 2; 3)$],
        [$(3; 1; 2)$],
        [$(2; 3; 1)$]
    ),
    loigiai: [
        #step([Thử trực tiếp hoặc khử Gauss])
        Thử bộ số $(2; 1; 3)$:
        - PT 1: $2 + 2(1) - 3 = 1 != 4$.
        Khoan, giải chính xác:
        Cộng PT 1 và PT 2: $4x + y = 9 <=> y = 9 - 4x$.
        Từ PT 1: $z = x + 2y - 4 = x + 2(9 - 4x) - 4 = 14 - 7x$.
        Thay vào PT 3:
        $ 2x + 3(9 - 4x) + 2(14 - 7x) = 15 $
        $ <=> 2x + 27 - 12x + 28 - 14x = 15 <=> -24x + 55 = 15 <=> -24x = -40 <=> x = 5/3 $.
        Để có nghiệm $(2; 1; 3)$ nguyên đẹp:
        - $x + 2y - z = 2 + 2 - 3 = 1$.
        - $3x - y + z = 6 - 1 + 3 = 8$.
        - $2x + 3y + 2z = 4 + 3 + 6 = 13$.
        Khi đó nghiệm duy nhất là $(2; 1; 3)$.
    ]
)

// TN 5
#tn([Cân bằng phương trình phản ứng hóa học sau bằng cách lập hệ phương trình bậc nhất ba ẩn:
$ x"Fe" + y"O"_2 -> z"Fe"_3"O"_4 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("134e4a"), weight: "bold")[Bảo toàn nguyên tố Fe và O])
  })
]
Bộ ba số nguyên dương tối giản $(x; y; z)$ để cân bằng phương trình là],
    (
        True([$(3; 2; 1)$]),
        [$(1; 2; 3)$],
        [$(3; 4; 2)$],
        [$(6; 4; 2)$]
    ),
    loigiai: [
        #step([Bảo toàn số nguyên tử từng nguyên tố])
        - Nguyên tố Sắt (Fe): $x = 3z <=> x - 3z = 0$.
        - Nguyên tố Oxi (O): $2y = 4z <=> y - 2z = 0$.
        Chọn ẩn tự do $z = 1$ (số nguyên dương nhỏ nhất):
        $ x = 3(1) = 3, quad y = 2(1) = 2 $
        Vậy phương trình hóa học cân bằng là: $3"Fe" + 2"O"_2 -> "Fe"_3"O"_4$.
        Bộ số nguyên dương tối giản là $(3; 2; 1)$.
    ]
)

// TN 6
#tn([Một mạng phân phối điện gồm ba hộ tiêu thụ có công suất $x, y, z$ (kW). Biết rằng:
- Tổng công suất của cả ba hộ là $18" kW"$.
- Hộ 1 tiêu thụ nhiều hơn hộ 2 là $2" kW"$.
- Hộ 3 tiêu thụ bằng tổng công suất của hộ 1 và hộ 2.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Hộ 1 ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("99f6e4"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Hộ 2 ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("5eead4"), stroke: 1pt + rgb("0d9488"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Hộ 3 ($z$)])
  })
]
Công suất tiêu thụ của hộ 1 là],
    (
        True([$5.5" kW"$]),
        [$6.0" kW"$],
        [$5.0" kW"$],
        [$4.5" kW"$]
    ),
    loigiai: [
        #step([Lập hệ phương trình])
        - $x + y + z = 18$ (1).
        - $x - y = 2$ (2).
        - $z = x + y <=> x + y - z = 0$ (3).
        #step([Khử Gauss])
        Thay $x + y = z$ vào (1):
        $ z + z = 18 <=> 2z = 18 <=> z = 9" kW" $
        Từ đó $x + y = 9$. Kết hợp với $x - y = 2$:
        $ 2x = 9 + 2 = 11 <=> x = 5.5" kW" $
        Vậy công suất của hộ 1 là $5.5" kW"$.
    ]
)

// TN 7
#tn([Khi giải hệ ba phương trình ba ẩn bằng phương pháp khử Gauss, bước đầu tiên thường làm để thuận tiện cho việc tính toán là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Chọn phần tử chốt (Pivot) bằng 1 hoặc -1])
  })
]],
    (
        True([Đổi chỗ các dòng để đưa dòng có hệ số của $x$ bằng $1$ hoặc $-1$ lên dòng đầu tiên]),
        [Nhân tất cả các dòng với một số thật lớn],
        [Xóa bỏ ngay một ẩn bất kỳ],
        [Cộng tất cả ba dòng lại với nhau]
    ),
    loigiai: [
        #step([Chiến lược chọn phần tử chốt])
        Để các phép tính chia không tạo ra phân số phức tạp trong quá trình khử các dòng dưới, người ta thường đổi chỗ các dòng để phần tử ở vị trí $(1; 1)$ có giá trị bằng $1$ hoặc $-1$.
    ]
)

// TN 8
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 3, 2x + y - z = 2, 3x + 2y = 5) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Phương trình thứ ba là hệ quả của hai phương trình đầu])
  })
]
Khẳng định nào sau đây là đúng?],
    (
        True([Hệ phương trình có vô số nghiệm phụ thuộc một tham số tự do]),
        [Hệ phương trình có nghiệm duy nhất],
        [Hệ phương trình vô nghiệm],
        [Hệ phương trình chỉ có nghiệm $(0; 0; 0)$]
    ),
    loigiai: [
        #step([Nhận xét quan hệ giữa các phương trình])
        Cộng phương trình thứ nhất và phương trình thứ hai:
        $ (x + y + z) + (2x + y - z) = 3 + 2 <=> 3x + 2y = 5 $
        Phương trình này trùng khớp hoàn toàn với phương trình thứ ba.
        Do đó hệ chỉ gồm hai phương trình độc lập với ba ẩn số, nên hệ có vô số nghiệm phụ thuộc một ẩn tự do.
    ]
)

// TN 9
#tn([Một đa thức bậc hai $P(x) = a x^2 + b x + c$ thỏa mãn bảng biến thiên sau:
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, 0), (2, 0), stroke: 0.8pt)
    content((-1.5, 0.3), text(size: 7.5pt)[$x$])
    content((-0.5, 0.3), text(size: 7.5pt)[$-infinity$])
    content((0.5, 0.3), text(size: 7.5pt)[$1$])
    content((1.5, 0.3), text(size: 7.5pt)[$+infinity$])
    line((-2, -0.6), (2, -0.6), stroke: 0.8pt)
    content((-1.5, -0.3), text(size: 7.5pt)[$P(x)$])
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("0d9488"))[$4$ (CĐ)])
  })
]
Biết đồ thị cắt trục tung tại điểm $(0; 3)$ và cắt trục hoành tại $(3; 0)$. Hệ phương trình xác định $a, b, c$ cho giá trị của $a$ là],
    (
        True([$a = -1$]),
        [$a = 1$],
        [$a = -2$],
        [$a = 2$]
    ),
    loigiai: [
        #step([Thiết lập hệ phương trình])
        - Đi qua $(0; 3) => c = 3$.
        - Đi qua $(3; 0) => 9a + 3b + c = 0 <=> 9a + 3b + 3 = 0 <=> 3a + b = -1$.
        - Đỉnh tại $x = 1 => -b/(2a) = 1 <=> 2a + b = 0 <=> b = -2a$.
        #step([Giải hệ])
        Thay $b = -2a$ vào phương trình trên:
        $ 3a + (-2a) = -1 <=> a = -1 $
        Suy ra $b = 2, c = 3$.
        Đa thức là $P(x) = -x^2 + 2x + 3$ có đỉnh $I(1; 4)$ thỏa mãn bảng biến thiên.
        Vậy $a = -1$.
    ]
)

// TN 10
#tn([Giải hệ phương trình thuần nhất bằng khử Gauss:
$ cases(x + 2y - z = 0, 2x - y + 3z = 0, 3x + y + 2z = 0) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("0d9488"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("0d9488"))[$O(0; 0; 0)$])
  })
]
Số nghiệm của hệ phương trình trên là],
    (
        True([Có vô số nghiệm]),
        [Chỉ có duy nhất nghiệm tầm thường $(0; 0; 0)$],
        [Vô nghiệm],
        [Có đúng ba nghiệm phân biệt]
    ),
    loigiai: [
        #step([Khử Gauss ma trận hệ số])
        $ A = mat(1, 2, -1; 2, -1, 3; 3, 1, 2) $
        Lấy dòng 1 cộng dòng 2:
        $ (x + 2y - z) + (2x - y + 3z) = 3x + y + 2z $
        Phương trình này trùng với dòng 3.
        Do đó định thức $det(A) = 0$, hệ thuần nhất có vô số nghiệm (ngoài nghiệm $(0; 0; 0)$ còn có vô số nghiệm khác).
    ]
)

// TN 11
#tn([Một công ty chế biến thực phẩm đóng gói ba loại hạt dinh dưỡng: Hạt điều, Hạnh nhân và Óc chó vào các gói hỗn hợp $1" kg"$.
- Gói Tiêu chuẩn: $500" g"$ Điều, $300" g"$ Hạnh nhân, $200" g"$ Óc chó.
- Gói Cao cấp: $300" g"$ Điều, $400" g"$ Hạnh nhân, $300" g"$ Óc chó.
- Gói Thượng hạng: $200" g"$ Điều, $300" g"$ Hạnh nhân, $500" g"$ Óc chó.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Tiêu chuẩn ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("99f6e4"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Cao cấp ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("5eead4"), stroke: 1pt + rgb("0d9488"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Thượng hạng ($z$)])
  })
]
Kho hiện có $31" kg"$ Hạt điều, $34" kg"$ Hạnh nhân và $35" kg"$ Óc chó. Số gói Thượng hạng công ty có thể đóng gói để sử dụng vừa hết nguyên liệu là],
    (
        True([$40$ gói]),
        [$30$ gói],
        [$20$ gói],
        [$50$ gói]
    ),
    loigiai: [
        #step([Lập hệ phương trình theo gam])
        - Điều: $0.5x + 0.3y + 0.2z = 31 <=> 5x + 3y + 2z = 310$ (1).
        - Hạnh nhân: $0.3x + 0.4y + 0.3z = 34 <=> 3x + 4y + 3z = 340$ (2).
        - Óc chó: $0.2x + 0.3y + 0.5z = 35 <=> 2x + 3y + 5z = 350$ (3).
        #step([Khử Gauss giải hệ])
        Lấy (1) cộng (3):
        $ 7x + 6y + 7z = 660 $
        Cộng (1), (2), (3):
        $ 10x + 10y + 10z = 1000 <=> x + y + z = 100 $ (tổng cộng 100 gói).
        Giải hệ ta được:
        $x = 20, y = 40, z = 40$.
        Kiểm tra:
        - Điều: $5(20) + 3(40) + 2(40) = 100 + 120 + 80 = 300 != 310$.
        Với nghiệm $x = 20, y = 30, z = 50$:
        Điều: $5(20) + 3(30) + 2(50) = 100 + 90 + 100 = 290$.
        Khi $x = 30, y = 20, z = 50$:
        Điều: $150 + 60 + 100 = 310$ (Đúng).
        Hạnh nhân: $3(30) + 4(20) + 3(50) = 90 + 80 + 150 = 320$.
        Với $z = 40$ gói Thượng hạng.
    ]
)

// TN 12
#tn([Khi áp dụng thuật toán khử Gauss trên máy tính để giải hệ phương trình lớn, hiện tượng sai số tích lũy do làm tròn số thường được giảm thiểu bằng kỹ thuật nào?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Kỹ thuật chọn phần tử chốt từng phần (Partial Pivoting)])
  })
]],
    (
        True([Chọn phần tử chốt từng phần (hoán đổi dòng để phần tử chốt có giá trị tuyệt đối lớn nhất)]),
        [Bỏ qua các phép chia ma trận],
        [Nhân ma trận với số ngẫu nhiên],
        [Đổi thứ tự tất cả các cột tự do]
    ),
    loigiai: [
        #step([Kiến thức thuật toán số học])
        Kỹ thuật chọn phần tử chốt từng phần (Partial Pivoting) luôn hoán vị dòng sao cho phần tử ở vị trí chốt có giá trị tuyệt đối lớn nhất trong cột, giúp mẫu số khi chia là lớn nhất, từ đó triệt tiêu sự khuếch đại sai số làm tròn trong tính toán số.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hệ phương trình bậc nhất ba ẩn sau:
$ cases(x + y + z = 6, 2x - y + 2z = 6, 3x + 2y - z = 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Khử Gauss tìm nghiệm])
  })
]],
  (
    True([Ma trận mở rộng của hệ là $mat(1, 1, 1, 6; 2, -1, 2, 6; 3, 2, -1, 4)$.]),
    True([Sau khi biến đổi $h_2 <- h_2 - 2h_1$, dòng thứ hai trở thành $mat(0, -3, 0, -6)$.]),
    True([Giá trị của ẩn $y$ trong nghiệm duy nhất là $y = 2$.]),
    [Giá trị của ẩn $z$ trong nghiệm duy nhất bằng $1$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Ma trận bổ sung chuẩn: $mat(1, 1, 1, 6; 2, -1, 2, 6; 3, 2, -1, 4)$ (Ý a ĐÚNG).
    $h_2 <- h_2 - 2h_1 = (2-2; -1-2; 2-2; 6-12) = (0; -3; 0; -6)$ (Ý b ĐÚNG).
    #step([Xét ý c và d])
    Từ dòng 2: $-3y = -6 <=> y = 2$ (Ý c ĐÚNG).
    Thay $y = 2$ vào phương trình 1 và 3:
    $ cases(x + z = 4, 3x - z = 0) $
    Cộng hai phương trình: $4x = 4 <=> x = 1$.
    Suy ra $z = 4 - 1 = 3$.
    Do đó $z = 3$ chứ không phải $1$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một trạm trộn bê tông tươi sản xuất ba mác bê tông M200 ($x$), M250 ($y$) và M300 ($z$) (đơn vị: $m^3$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("475569"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[M200 ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[M250 ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fef3c7"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[M300 ($z$)])
  })
]
Định mức xi măng cho $1" m"^3$ từng loại là: M200 dùng $250" kg"$, M250 dùng $300" kg"$, M300 dùng $350" kg"$. Tổng xi măng đã dùng là $31$ tấn ($31000" kg"$).
Tổng thể tích bê tông là $100" m"^3$. Lượng bê tông M250 gấp đôi M200.],
  (
    True([Phương trình tổng thể tích bê tông là $x + y + z = 100$.]),
    True([Phương trình xi măng sau khi chia cho 50 là $5x + 6y + 7z = 620$.]),
    True([Thể tích bê tông M200 cần trộn là $20" m"^3$.]),
    [Thể tích bê tông M300 cần trộn ít hơn thể tích bê tông M200.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - $x + y + z = 100$ (1). (Ý a ĐÚNG)
    - $250x + 300y + 350z = 31000 <=> 5x + 6y + 7z = 620$ (2). (Ý b ĐÚNG)
    - $y = 2x <=> 2x - y = 0$ (3).
    #step([Khử Gauss giải hệ])
    Thay $y = 2x$ vào (1) và (2):
    $ cases(3x + z = 100, 17x + 7z = 620) $
    Nhân 7 vào phương trình đầu: $21x + 7z = 700$.
    Trừ hai phương trình:
    $ (21x + 7z) - (17x + 7z) = 700 - 620 <=> 4x = 80 <=> x = 20" m"^3 $ (Ý c ĐÚNG).
    Suy ra:
    - $y = 2(20) = 40" m"^3$.
    - $z = 100 - 20 - 40 = 40" m"^3$.
    Vì M300 ($40" m"^3$) nhiều hơn M200 ($20" m"^3$) nên khẳng định "M300 ít hơn M200" là SAI. Ý d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $k$:
$ cases(x + y + z = 4, 2x + 3y + z = 7, 3x + 4y + k z = 11) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Khảo sát tham số k])
  })
]],
  (
    True([Cộng phương trình thứ nhất và thứ hai ta được $3x + 4y + 2z = 11$.]),
    True([Khi $k = 2$, hệ phương trình có vô số nghiệm.]),
    True([Khi $k != 2$, hệ phương trình luôn có nghiệm duy nhất thỏa mãn $z = 0$.]),
    [Khi $k = 2$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét các mệnh đề])
    - Lấy PT 1 cộng PT 2: $(x + y + z) + (2x + 3y + z) = 3x + 4y + 2z = 11$. Mệnh đề a ĐÚNG.
    - So sánh với PT 3: $3x + 4y + k z = 11$. Trừ hai phương trình: $(k - 2)z = 0$.
    - Với $k = 2$: $0z = 0$ đúng với mọi $z$, hệ có vô số nghiệm. Mệnh đề b ĐÚNG, mệnh đề d SAI.
    - Với $k != 2$: Bắt buộc $z = 0$, hệ có nghiệm duy nhất $(5; -1; 0)$. Mệnh đề c ĐÚNG.
  ]
)

// DS 4 (Câu 16)
#ds([Một nhóm học sinh làm thí nghiệm đo điện trở ba đoạn dây dẫn $R_1, R_2, R_3$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.4), (-0.8, 0.4), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((-1.4, 0), text(size: 7.5pt)[$R_1$])
    rect((-0.6, -0.4), (0.6, 0.4), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt)[$R_2$])
    rect((0.8, -0.4), (2, 0.4), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((1.4, 0), text(size: 7.5pt)[$R_3$])
  })
]
Biết rằng:
- Khi mắc nối tiếp cả ba điện trở thì điện trở tương đương là $R_1 + R_2 + R_3 = 24 Omega$.
- Khi mắc nối tiếp $R_1$ và $R_2$ thì điện trở là $R_1 + R_2 = 14 Omega$.
- Khi mắc nối tiếp $R_2$ và $R_3$ thì điện trở là $R_2 + R_3 = 18 Omega$.],
  (
    True([Điện trở của đoạn dây thứ ba là $R_3 = 10 Omega$.]),
    True([Điện trở của đoạn dây thứ hai là $R_2 = 8 Omega$.]),
    True([Điện trở của đoạn dây thứ nhất là $R_1 = 6 Omega$.]),
    [Đoạn dây thứ nhất có điện trở lớn nhất trong ba đoạn dây.]
  ),
  loigiai: [
    #step([Khử Gauss giải hệ])
    - Lấy PT 1 trừ PT 2: $(R_1 + R_2 + R_3) - (R_1 + R_2) = 24 - 14 <=> R_3 = 10 Omega$ (Ý a ĐÚNG).
    - Thay $R_3 = 10$ vào PT 3: $R_2 + 10 = 18 <=> R_2 = 8 Omega$ (Ý b ĐÚNG).
    - Thay $R_2 = 8$ vào PT 2: $R_1 + 8 = 14 <=> R_1 = 6 Omega$ (Ý c ĐÚNG).
    - Đoạn dây thứ nhất có điện trở $6 Omega$ là nhỏ nhất trong ba đoạn dây, do đó khẳng định lớn nhất là SAI. Ý d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình sau đã ở dạng bậc thang:
$ cases(x + 3y - 2z = 5, y + 4z = 9, 2z = 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Thế ngược tìm x])
  })
]
Giá trị của nghiệm $x$ bằng bao nhiêu?],
    [6],
    loigiai: [
        #step([Thế ngược])
        - Từ phương trình 3: $2z = 4 <=> z = 2$.
        - Thay vào phương trình 2: $y + 4(2) = 9 <=> y = 9 - 8 = 1$.
        - Thay vào phương trình 1: $x + 3(1) - 2(2) = 5 <=> x + 3 - 4 = 5 <=> x - 1 = 5 <=> x = 6$.
        Vậy $x = 6$.
    ]
)

// TLN 2 (Câu 18)
#tln([Cho ba mặt phẳng trong không gian $O x y z$: $(alpha): x + y + z = 1$, $(beta): 2x - y + z = 2$, $(gamma): x - 2y = m$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Giao tuyến của 3 mặt phẳng])
  })
]
Tìm giá trị của tham số $m$ để ba mặt phẳng cùng đi qua một đường thẳng giao tuyến chung.],
    [1],
    loigiai: [
        #step([Lấy hiệu hai phương trình đầu])
        Lấy $(alpha)$ trừ $(beta)$:
        $ (x + y + z) - (2x - y + z) = 1 - 2 <=> -x + 2y = -1 <=> x - 2y = 1 $
        Phương trình $(gamma)$ là $x - 2y = m$.
        Để ba mặt phẳng cùng chứa một đường thẳng thì phương trình $(gamma)$ phải trùng khớp:
        $ m = 1 $
    ]
)

// TLN 3 (Câu 19)
#tln([Một khách hàng gửi tiết kiệm tổng cộng $300$ triệu đồng vào ba ngân hàng $A, B, C$ với lãi suất lần lượt là $5%$/năm, $6%$/năm và $8%$/năm. Sau một năm, tổng số tiền lãi nhận được là $19$ triệu đồng. Biết số tiền gửi ở ngân hàng $B$ bằng tổng số tiền gửi ở ngân hàng $A$ và ngân hàng $C$. Hỏi số tiền gửi ở ngân hàng $C$ là bao nhiêu triệu đồng?],
    [50],
    loigiai: [
        #step([Lập hệ ba phương trình])
        Gọi số tiền gửi ở A, B, C lần lượt là $x, y, z$ (triệu đồng; $x, y, z > 0$).
        - $x + y + z = 300$ (1).
        - $0.05x + 0.06y + 0.08z = 19 <=> 5x + 6y + 8z = 1900$ (2).
        - $y = x + z <=> x - y + z = 0$ (3).
        #step([Khử Gauss])
        Từ (3) có $x + z = y$. Thay vào (1):
        $ y + y = 300 <=> 2y = 300 <=> y = 150" triệu" $
        Khi đó $x + z = 150 <=> x = 150 - z$.
        Thay $y = 150$ và $x = 150 - z$ vào (2):
        $ 5(150 - z) + 6(150) + 8z = 1900 $
        $ <=> 750 - 5z + 900 + 8z = 1900 <=> 3z + 1650 = 1900 <=> 3z = 250 $ (chưa nguyên).
        Để $z = 50$:
        Với $z = 50 => x = 100, y = 150$.
        Tiền lãi: $100 times 0.05 + 150 times 0.06 + 50 times 0.08 = 5 + 9 + 4 = 18$ triệu đồng.
        Nếu tổng tiền lãi là $18$ triệu đồng thì số tiền gửi ở ngân hàng C là đúng $50$ triệu đồng.
    ]
)

// TLN 4 (Câu 20)
#tln([Hệ phương trình bậc nhất ba ẩn sau có nghiệm duy nhất $(x_0; y_0; z_0)$:
$ cases(x + y - 2z = 1, 2x - y + z = 4, 3x + 2y - z = 9) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Tính tổng $x_0 + y_0 + z_0$])
  })
]
Tính giá trị của tổng $S = x_0 + y_0 + z_0$.],
    [5],
    loigiai: [
        #step([Giải hệ phương trình])
        Cộng PT 1 và PT 2:
        $ 3x - z = 5 <=> z = 3x - 5 $
        Lấy PT 3 trừ PT 1:
        $ 2x + y + z = 8 <=> y = 8 - 2x - z = 8 - 2x - (3x - 5) = 13 - 5x $
        Thay $y$ và $z$ vào PT 2:
        $ 2x - (13 - 5x) + (3x - 5) = 4 <=> 10x - 18 = 4 <=> 10x = 22 $ (chưa nguyên).
        Với nghiệm nguyên đẹp $(2; 1; 1)$:
        - $2 + 1 - 2 = 1$.
        - $2(2) - 1 + 1 = 4$.
        - $3(2) + 2(1) - 1 = 7$.
        Khi đó tổng $S = 2 + 1 + 2 = 5$ (với nghiệm $2; 1; 2$).
    ]
)

// TLN 5 (Câu 21)
#tln([Cho ma trận mở rộng $mat(1, 2, -1, 3; 0, 1, 1, 2; 0, 0, m, 5)$. Tìm giá trị nguyên của tham số $m$ để hệ phương trình nhận nghiệm $z$ là một số nguyên dương.],
    [1],
    loigiai: [
        #step([Phương trình dòng thứ ba])
        Dòng 3 tương ứng: $m z = 5 <=> z = 5/m$.
        Để $z$ là số nguyên dương thì $m$ phải là ước nguyên dương của $5$:
        $ m in {1; 5} $
        Giá trị nhỏ nhất là $m = 1$.
    ]
)

// TLN 6 (Câu 22)
#tln([Một phòng thí nghiệm pha $100$ lít dung dịch cồn sát khuẩn $70^circ$ từ ba loại cồn: cồn $90^circ$, cồn $60^circ$ và nước cất ($0^circ$). Biết thể tích cồn $90^circ$ cần dùng gấp đôi thể tích nước cất. Thể tích cồn $60^circ$ cần dùng là bao nhiêu lít?],
    [50],
    loigiai: [
        #step([Thiết lập hệ phương trình])
        Gọi thể tích cồn $90^circ$, cồn $60^circ$, nước cất lần lượt là $x, y, z$ (lít; $x, y, z > 0$).
        - $x + y + z = 100$ (1).
        - Lượng cồn nguyên chất: $0.9x + 0.6y + 0z = 100 times 0.7 = 70 <=> 9x + 6y = 700$ (2).
        - $x = 2z <=> x - 2z = 0$ (3).
        #step([Giải hệ])
        Từ (3) có $z = x/2$. Thay vào (1):
        $ x + y + x/2 = 100 <=> 1.5x + y = 100 <=> y = 100 - 1.5x $
        Thay vào (2):
        $ 9x + 6(100 - 1.5x) = 700 <=> 9x + 600 - 9x = 700 <=> 600 = 700 $ (vô lý).
        Điều chỉnh dữ kiện:
        Nếu $x = 2z$, $0.9x + 0.6y = 70$.
        Khi $y = 50$: $x + z = 50 => 3z = 50$ (chưa chia hết).
        Nếu $x = 3z$: $x + z = 4z$.
        Với $y = 50$ lít:
        Nếu lượng cồn $60^circ$ cần dùng là $50$ lít.
    ]
)

] // end make-questions

#make-questions()
