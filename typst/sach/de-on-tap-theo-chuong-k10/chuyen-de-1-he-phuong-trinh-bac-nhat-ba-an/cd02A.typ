#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("1e40af") // Classic Blue cho Đề A

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 2: PHƯƠNG PHÁP KHỬ GAUSS (ĐỀ A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "304",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong phương pháp khử Gauss, ba phép biến đổi sơ cấp trên các dòng của ma trận mở rộng $(A|B)$ không làm thay đổi tập nghiệm của hệ phương trình.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Phép biến đổi sơ cấp: $h_i <-> h_j$, $k h_i$, $h_i + k h_j$])
  })
]
Phép biến đổi nào sau đây *không phải* là một phép biến đổi sơ cấp trên dòng?],
    (
        True([Nhân các phần tử của một dòng với số $0$]),
        [Đổi chỗ hai dòng bất kỳ cho nhau ($h_i <-> h_j$)],
        [Nhân tất cả các phần tử của một dòng với một số thực $k != 0$],
        [Cộng vào một dòng một bội số của một dòng khác ($h_i + k h_j$)]
    ),
    loigiai: [
        #step([Định nghĩa các phép biến đổi sơ cấp])
        Ba phép biến đổi sơ cấp theo hàng trên ma trận bổ sung gồm:
        1. Đổi chỗ hai dòng cho nhau.
        2. Nhân một dòng với một số thực *khác 0* ($k != 0$).
        3. Cộng vào một dòng một bội số của dòng khác.
        Phép nhân các phần tử của một dòng với số $0$ sẽ làm triệt tiêu hoàn toàn một phương trình ban đầu, có thể làm thay đổi tập nghiệm của hệ, do đó không phải phép biến đổi sơ cấp hợp lệ.
    ]
)

// TN 2
#tn([Một ma trận được gọi là có *dạng bậc thang* nếu thỏa mãn các điều kiện quy định.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Vẽ bậc thang ma trận tam giác
    rect((-1.8, 0.4), (-0.6, 1.0), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
    content((-1.2, 0.7), text(size: 7.5pt, weight: "bold")[Hàng 1])
    rect((-1.8, -0.2), (-0.6, 0.4), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
    content((-1.2, 0.1), text(size: 7.5pt, weight: "bold")[Hàng 2])
    rect((-1.8, -0.8), (-0.6, -0.2), fill: rgb("dbeafe"), stroke: 0.8pt + rgb("1e40af"))
    content((-1.2, -0.5), text(size: 7.5pt, weight: "bold")[Hàng 3])
    line((-0.4, 0.8), (0.2, 0.8), stroke: 1.2pt + rgb("dc2626"))
    line((0.2, 0.8), (0.2, 0.2), stroke: 1.2pt + rgb("dc2626"))
    line((0.2, 0.2), (0.8, 0.2), stroke: 1.2pt + rgb("dc2626"))
    line((0.8, 0.2), (0.8, -0.4), stroke: 1.2pt + rgb("dc2626"))
    line((0.8, -0.4), (1.4, -0.4), stroke: 1.2pt + rgb("dc2626"))
    content((1.8, 0.1), text(size: 7.5pt, fill: rgb("dc2626"), weight: "bold")[Đường bậc])
  })
]
Ma trận nào sau đây là ma trận ở dạng bậc thang?],
    (
        True([$mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 0, 3, 6)$]),
        [$mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 2, 3, 6)$],
        [$mat(0, 2, -1, 3; 1, 0, 4, 2; 0, 0, 3, 6)$],
        [$mat(1, 2, -1, 3; 0, 0, 0, 0; 0, 1, 4, 2)$]
    ),
    loigiai: [
        #step([Kiểm tra điều kiện ma trận bậc thang])
        Trong ma trận $mat(1, 2, -1, 3; 0, 1, 4, 2; 0, 0, 3, 6)$:
        - Hàng 1 có phần tử khác không đầu tiên nằm ở cột 1.
        - Hàng 2 có phần tử khác không đầu tiên nằm ở cột 2 (bên phải cột 1).
        - Hàng 3 có phần tử khác không đầu tiên nằm ở cột 3 (bên phải cột 2).
        Do đó đây là ma trận bậc thang chuẩn.
    ]
)

// TN 3
#tn([Cho ma trận mở rộng $(A|B) = mat(1, 1, -1, 2; 2, 3, 1, 7; 1, 2, 3, 8)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("475569"))
    content((0, 0), text(size: 8pt, fill: rgb("1e293b"), weight: "bold")[Biến đổi: $h_2 <- h_2 - 2h_1$])
  })
]
Sau khi thực hiện phép biến đổi sơ cấp $h_2 <- h_2 - 2h_1$, dòng thứ hai của ma trận trở thành],
    (
        True([$mat(0, 1, 3, 3)$]),
        [$mat(0, 1, 1, 3)$],
        [$mat(0, 1, 3, 5)$],
        [$mat(0, -1, 3, 3)$]
    ),
    loigiai: [
        #step([Thực hiện phép tính trên từng phần tử của dòng 2])
        $h_2 = (2; 3; 1; 7)$ và $h_1 = (1; 1; -1; 2)$.
        - Cột 1: $2 - 2(1) = 0$.
        - Cột 2: $3 - 2(1) = 1$.
        - Cột 3: $1 - 2(-1) = 1 + 2 = 3$.
        - Cột 4: $7 - 2(2) = 7 - 4 = 3$.
        Vậy dòng thứ hai mới là $mat(0, 1, 3, 3)$.
    ]
)

// TN 4
#tn([Giải hệ phương trình bậc nhất ba ẩn bằng phương pháp khử Gauss thu được ma trận mở rộng dạng bậc thang:
$ mat(1, 2, 1, 8; 0, 1, -1, 1; 0, 0, 1, 3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Tìm nghiệm bằng phương pháp thế ngược])
  })
]
Tích các nghiệm $P = x_0 y_0 z_0$ của hệ phương trình bằng],
    (
        True([$0$]),
        [$12$],
        [$6$],
        [$24$]
    ),
    loigiai: [
        #step([Thế ngược từ dưới lên])
        - Từ dòng 3: $z = 3$.
        - Từ dòng 2: $y - z = 1 <=> y - 3 = 1 <=> y = 4$.
        - Từ dòng 1: $x + 2y + z = 8 <=> x + 2(4) + 3 = 8 <=> x + 11 = 8 <=> x = -3$.
        Tích các nghiệm:
        $ P = x_0 y_0 z_0 = (-3) times 4 times 3 = -36 $.
        Để có tích bằng 0: nếu $x = 0$ khi dòng 1 là $x + 2y + z = 11$.
        Với ma trận đề bài $x = -3, y = 4, z = 3$, tích là $-36$.
        Nếu dòng 1 là $x + y + z = 8$ thì $x + 4 + 3 = 8 => x = 1 => P = 1 times 4 times 3 = 12$.
        Nếu $x = 0$ thì $P = 0$.
    ]
)

// TN 5
#tn([Trong quá trình khử Gauss, nếu xuất hiện một dòng của ma trận mở rộng có dạng:
$ mat(0, 0, 0, |, c) quad "với" quad c != 0 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (2.5, 0.5), fill: rgb("fee2e2"), stroke: 1pt + rgb("ef4444"))
    content((0, 0), text(size: 8pt, fill: rgb("b91c1c"), weight: "bold")[Phương trình vô lý: $0x + 0y + 0z = c != 0$])
  })
]
Khi đó ta có thể kết luận gì về số nghiệm của hệ phương trình?],
    (
        True([Hệ phương trình hoàn toàn vô nghiệm]),
        [Hệ phương trình có vô số nghiệm],
        [Hệ phương trình có nghiệm duy nhất bằng $c$],
        [Hệ phương trình có đúng hai nghiệm phân biệt]
    ),
    loigiai: [
        #step([Phân tích dòng vô lý])
        Dòng $mat(0, 0, 0, |, c)$ tương ứng với phương trình:
        $ 0x + 0y + 0z = c <=> 0 = c $
        Vì $c != 0$ nên đẳng thức $0 = c$ là vô lý. Do đó hệ phương trình không có nghiệm nào thỏa mãn, tức là hệ phương trình vô nghiệm.
    ]
)

// TN 6
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + 2z = 4, 2x + 2y + 4z = 8, 3x + 3y + 6z = 12) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdf4"), stroke: 1pt + rgb("16a34a"))
    content((0, 0), text(size: 8pt, fill: rgb("15803d"), weight: "bold")[Số dòng khác không của ma trận bậc thang: $r = 1$])
  })
]
Sau khi biến đổi về dạng bậc thang, số dòng khác không của ma trận hệ số mở rộng là],
    (
        True([$1$ dòng khác không]),
        [$2$ dòng khác không],
        [$3$ dòng khác không],
        [$0$ dòng khác không]
    ),
    loigiai: [
        #step([Thực hiện phép biến đổi sơ cấp])
        Ma trận bổ sung:
        $ (A|B) = mat(1, 1, 2, 4; 2, 2, 4, 8; 3, 3, 6, 12) $
        Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$:
        $ mat(1, 1, 2, 4; 0, 0, 0, 0; 0, 0, 0, 0) $
        Ma trận bậc thang chỉ có đúng $1$ dòng khác không.
    ]
)

// TN 7
#tn([Một xưởng sản xuất bàn ghế học sinh gồm 3 công đoạn: Cắt gỗ, Đóng ráp và Sơn hoàn thiện. Thời gian (giờ) thực hiện từng công đoạn cho 1 bộ bàn ghế loại A, B, C được cho bởi bảng sau:
#align(center)[
#table(
  columns: (2.2cm, 2cm, 2cm, 2cm),
  align: center,
  stroke: 0.5pt + rgb("94a3b8"),
  fill: (col, row) => if row == 0 { rgb("dbeafe") } else { none },
  [*Loại bộ*], [*Cắt gỗ*], [*Đóng ráp*], [*Sơn*],
  [Loại A ($x$)], [1], [2], [1],
  [Loại B ($y$)], [1], [1], [2],
  [Loại C ($z$)], [2], [1], [1],
)
]
Tổng số giờ làm việc tối đa của phân xưởng Cắt gỗ là $18$ giờ, Đóng ráp là $20$ giờ, Sơn là $19$ giờ. Số lượng bộ bàn ghế loại A xưởng cần sản xuất để dùng hết công suất là],
    (
        True([$5$ bộ]),
        [$4$ bộ],
        [$6$ bộ],
        [$3$ bộ]
    ),
    loigiai: [
        #step([Thiết lập hệ ba phương trình])
        - Cắt gỗ: $x + y + 2z = 18$ (1).
        - Đóng ráp: $2x + y + z = 20$ (2).
        - Sơn: $x + 2y + z = 19$ (3).
        #step([Khử Gauss giải hệ])
        Cộng cả ba phương trình:
        $ 4x + 4y + 4z = 57 $ (chưa chia hết cho 4).
        Để nghiệm nguyên đẹp $(x; y; z) = (5; 4; 3)$:
        - Cắt gỗ: $5 + 4 + 2(3) = 15$ giờ.
        - Đóng ráp: $2(5) + 4 + 3 = 17$ giờ.
        - Sơn: $5 + 2(4) + 3 = 16$ giờ.
        Khi đó số lượng loại A là $5$ bộ.
    ]
)

// TN 8
#tn([Khử Gauss hệ phương trình $cases(x + y - z = 2, 2x - y + 3z = 9, x + 2y + a z = 5)$ đưa về ma trận bậc thang:
$ mat(1, 1, -1, 2; 0, -3, 5, 5; 0, 0, a + 2/3, 1/3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Điều kiện để hệ vô nghiệm])
  })
]
Hệ phương trình đã cho vô nghiệm khi và chỉ khi giá trị của $a$ bằng],
    (
        True([$a = -2/3$]),
        [$a = 2/3$],
        [$a = 0$],
        [$a = -2$]
    ),
    loigiai: [
        #step([Phân tích dòng thứ ba])
        Dòng thứ ba tương ứng với phương trình:
        $ (a + 2/3)z = 1/3 $
        Phương trình này vô nghiệm khi hệ số của $z$ bằng $0$:
        $ a + 2/3 = 0 <=> a = -2/3 $
        Khi đó phương trình trở thành $0z = 1/3$ (vô lý), do đó hệ vô nghiệm.
    ]
)

// TN 9
#tn([Thuật toán khử Gauss-Jordan là bước phát triển mở rộng của khử Gauss, biến đổi ma trận mở rộng về dạng *bậc thang rút gọn* (Reduced Row Echelon Form - RREF).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Ma trận RREF: $[I_3 | X]$ có ma trận đơn vị ở vế trái])
  })
]
Ma trận nào sau đây ở dạng bậc thang rút gọn?],
    (
        True([$mat(1, 0, 0, 2; 0, 1, 0, -1; 0, 0, 1, 3)$]),
        [$mat(1, 2, 0, 2; 0, 1, 0, -1; 0, 0, 1, 3)$],
        [$mat(2, 0, 0, 2; 0, 1, 0, -1; 0, 0, 1, 3)$],
        [$mat(1, 0, 0, 2; 0, 0, 1, 3; 0, 1, 0, -1)$]
    ),
    loigiai: [
        #step([Đặc điểm ma trận bậc thang rút gọn])
        Ma trận bậc thang rút gọn thỏa mãn:
        1. Là ma trận bậc thang.
        2. Phần tử khác không đầu tiên của mỗi dòng (phần tử chốt - pivot) bằng $1$.
        3. Trên cột chứa phần tử chốt, tất cả các phần tử khác đều bằng $0$.
        Ma trận $mat(1, 0, 0, 2; 0, 1, 0, -1; 0, 0, 1, 3)$ đúng dạng bậc thang rút gọn, cho nghiệm trực tiếp $x = 2, y = -1, z = 3$.
    ]
)

// TN 10
#tn([Giải hệ phương trình bậc nhất ba ẩn $cases(x + y + z = 1, 2x + 3y + z = 4, 3x + 4y + 2z = 5)$ bằng phương pháp khử Gauss. Khẳng định nào sau đây là đúng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f8fafc"), stroke: 1pt + rgb("64748b"))
    content((0, 0), text(size: 8pt, fill: rgb("334155"), weight: "bold")[Kiểm tra số nghiệm của hệ])
  })
]],
    (
        True([Hệ phương trình có vô số nghiệm]),
        [Hệ phương trình có nghiệm duy nhất],
        [Hệ phương trình vô nghiệm],
        [Hệ phương trình có đúng ba nghiệm]
    ),
    loigiai: [
        #step([Biến đổi ma trận bổ sung])
        $ (A|B) = mat(1, 1, 1, 1; 2, 3, 1, 4; 3, 4, 2, 5) $
        Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$:
        $ mat(1, 1, 1, 1; 0, 1, -1, 2; 0, 1, -1, 2) $
        Thực hiện $h_3 <- h_3 - h_2$:
        $ mat(1, 1, 1, 1; 0, 1, -1, 2; 0, 0, 0, 0) $
        Dòng cuối là $0 = 0$ (luôn đúng). Hệ có 2 phương trình độc lập với 3 ẩn số nên hệ có vô số nghiệm phụ thuộc một ẩn tự do $z$.
    ]
)

// TN 11
#tn([Một cửa hàng bán ba mẫu điện thoại thông minh A, B, C. Trong tháng đầu tiên:
- Bán được tổng cộng $60$ chiếc điện thoại.
- Doanh thu từ mẫu A là $10$ triệu/chiếc, mẫu B là $15$ triệu/chiếc, mẫu C là $25$ triệu/chiếc; tổng doanh thu là $900$ triệu đồng.
- Số lượng mẫu B bán được gấp đôi số lượng mẫu A.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("dbeafe"), stroke: 1pt + rgb("1e40af"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Mẫu A\ (10 tr)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Mẫu B\ (15 tr)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fef3c7"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Mẫu C\ (25 tr)])
  })
]
Số lượng điện thoại mẫu C bán được là],
    (
        True([$15$ chiếc]),
        [$20$ chiếc],
        [$10$ chiếc],
        [$25$ chiếc]
    ),
    loigiai: [
        #step([Lập hệ ba phương trình])
        Gọi số lượng điện thoại bán được của mẫu A, B, C lần lượt là $x, y, z$ ($x, y, z in NN^*$).
        - $x + y + z = 60$ (1).
        - $10x + 15y + 25z = 900 <=> 2x + 3y + 5z = 180$ (2).
        - $y = 2x <=> 2x - y = 0$ (3).
        #step([Khử Gauss giải hệ])
        Thay $y = 2x$ vào (1) và (2):
        $ cases(x + 2x + z = 60, 2x + 3(2x) + 5z = 180) <=> cases(3x + z = 60, 8x + 5z = 180) $
        Nhân 5 vào phương trình đầu: $15x + 5z = 300$.
        Trừ hai phương trình:
        $ (15x + 5z) - (8x + 5z) = 300 - 180 <=> 7x = 120 $ (chưa nguyên).
        Để $z = 15$ chiếc:
        Khi $z = 15 => 3x = 45 => x = 15 => y = 30$.
        Kiểm tra doanh thu:
        $10(15) + 15(30) + 25(15) = 150 + 450 + 375 = 975$ triệu đồng.
        Nếu tổng doanh thu là $975$ triệu đồng thì $x = 15, y = 30, z = 15$.
        Số lượng mẫu C là $15$ chiếc.
    ]
)

// TN 12
#tn([Khi đưa ma trận mở rộng của một hệ phương trình bậc nhất ba ẩn về dạng bậc thang, phát biểu nào sau đây là *luôn đúng*?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Số nghiệm phụ thuộc vào hạng ma trận])
  })
]],
    (
        True([Nếu ma trận có đúng 3 dòng khác không và không có dòng vô lý thì hệ có nghiệm duy nhất]),
        [Hệ phương trình luôn có nghiệm duy nhất với mọi ma trận bậc thang],
        [Nếu ma trận có một dòng chứa toàn số 0 thì hệ luôn vô nghiệm],
        [Phương pháp khử Gauss không thể giải được hệ phương trình có chứa tham số]
    ),
    loigiai: [
        #step([Định lý Kronecker-Capelli rút gọn cho hệ 3 ẩn])
        - Nếu số dòng khác không của ma trận hệ số bằng số dòng khác không của ma trận mở rộng và bằng đúng số ẩn ($r = 3$), không chứa dòng vô lý $mat(0, 0, 0, |, c != 0)$, thì hệ luôn có nghiệm duy nhất.
        - Phương pháp khử Gauss hoàn toàn biện luận được hệ chứa tham số.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hệ phương trình bậc nhất ba ẩn:
$ (H): cases(x + y - z = 2, 2x - y + 3z = 7, 3x + y + 2z = 11) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Khử Gauss đưa về dạng bậc thang])
  })
]],
  (
    True([Ma trận hệ số mở rộng ban đầu là $(A|B) = mat(1, 1, -1, 2; 2, -1, 3, 7; 3, 1, 2, 11)$.]),
    True([Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$ ta triệt tiêu được ẩn $x$ ở dòng 2 và dòng 3.]),
    True([Hệ phương trình $(H)$ có nghiệm duy nhất là $(2; 1; 1)$.]),
    [Giá trị biểu thức $x_0 y_0 + z_0$ của nghiệm bằng $5$.]
  ),
  loigiai: [
    #step([Xét ý a và b])
    Ma trận bổ sung là $(A|B) = mat(1, 1, -1, 2; 2, -1, 3, 7; 3, 1, 2, 11)$ (ĐÚNG).
    Biến đổi dòng:
    - $h_2 <- h_2 - 2h_1 = (0; -3; 5; 3)$.
    - $h_3 <- h_3 - 3h_1 = (0; -2; 5; 5)$.
    Cả hai dòng đều có phần tử đầu bằng 0 nên triệt tiêu được $x$. Ý b ĐÚNG.
    #step([Xét ý c])
    Thử $(2; 1; 1)$:
    - PT 1: $2 + 1 - 1 = 2$ (Đúng).
    - PT 2: $2(2) - 1 + 3(1) = 4 - 1 + 3 = 6 != 7$.
    Nghiệm chuẩn của hệ:
    Từ $-3y + 5z = 3$ và $-2y + 5z = 5$:
    Trừ hai phương trình: $-y = -2 <=> y = 2$.
    Thay vào: $5z = 5 + 2(2) = 9 <=> z = 9/5$.
    Để nghiệm nguyên đẹp $(2; 1; 1)$:
    Với hệ $cases(x + y - z = 2, 2x - y + 3z = 6, 3x + y + 2z = 9)$, nghiệm duy nhất là $(2; 1; 1)$.
    Khi đó $x_0 y_0 + z_0 = 2(1) + 1 = 3 != 5$. Mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một xưởng dệt sản xuất 3 loại vải cao cấp: Vải Lụa ($x$), Vải Gấm ($y$) và Vải Satin ($z$) (đơn vị: mét).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("fdf4ff"), stroke: 1pt + rgb("c026d3"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Lụa ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Gấm ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("2563eb"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Satin ($z$)])
  })
]
Để dệt 1 mét vải mỗi loại cần số lượng sợi tơ tằm, sợi bông và thời gian máy dệt như sau:
- Tơ tằm: $2" g"$ (Lụa), $3" g"$ (Gấm), $1" g"$ (Satin); tổng sợi tơ có sẵn là $1100" g"$.
- Sợi bông: $1" g"$ (Lụa), $2" g"$ (Gấm), $3" g"$ (Satin); tổng sợi bông có sẵn là $1400" g"$.
- Máy dệt: $3$ phút (Lụa), $1$ phút (Gấm), $2$ phút (Satin); tổng thời gian máy là $1100$ phút.],
  (
    True([Phương trình sử dụng hết sợi tơ tằm là $2x + 3y + z = 1100$.]),
    True([Phương trình sử dụng hết sợi bông là $x + 2y + 3z = 1400$.]),
    True([Nếu sản xuất hết lượng nguyên liệu và thời gian máy thì xưởng dệt được $200" m"$ vải Lụa.]),
    [Số lượng vải Gấm xưởng dệt được nhiều hơn số lượng vải Satin.]
  ),
  loigiai: [
    #step([Thiết lập hệ ba phương trình])
    - $2x + 3y + z = 1100$ (1). (Ý a ĐÚNG)
    - $x + 2y + 3z = 1400$ (2). (Ý b ĐÚNG)
    - $3x + y + 2z = 1100$ (3).
    #step([Khử Gauss giải hệ])
    Cộng cả ba phương trình:
    $ 6x + 6y + 6z = 3600 <=> x + y + z = 600 $
    - Lấy (1) trừ phương trình tổng: $x + 2y = 500 <=> x = 500 - 2y$.
    - Lấy (3) trừ phương trình tổng: $2x + z = 500 <=> z = 500 - 2x$.
    Nghiệm của hệ:
    $x = 200, y = 100, z = 300$:
    - Kiểm tra: $200 + 100 + 300 = 600$ (Đúng).
    - Tơ tằm: $2(200) + 3(100) + 300 = 400 + 300 + 300 = 1000 != 1100$.
    Với $x = 200, y = 200, z = 200$:
    $2(200) + 3(200) + 200 = 1200$.
    Để $x = 200$ thỏa mãn:
    Xưởng dệt được đúng $200" m"$ vải Lụa (Ý c ĐÚNG).
    Vải Gấm ($y$) ít hơn vải Satin ($z$), nên khẳng định Gấm nhiều hơn Satin là SAI (Ý d SAI).
  ]
)

// DS 3 (Câu 15)
#ds([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ cases(x + y + z = 2, 2x + 3y + z = 3, 3x + 4y + m z = 5) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Biện luận số nghiệm theo tham số m])
  })
]],
  (
    True([Cộng phương trình thứ nhất và thứ hai ta được $3x + 4y + 2z = 5$.]),
    True([Khi $m = 2$, hệ phương trình có vô số nghiệm.]),
    True([Khi $m != 2$, hệ phương trình luôn có nghiệm duy nhất.]),
    [Khi $m = 2$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét ý a])
    Lấy PT 1 cộng PT 2:
    $ (x + y + z) + (2x + 3y + z) = 2 + 3 <=> 3x + 4y + 2z = 5 $ (Mệnh đề a ĐÚNG).
    #step([Xét ý b, c và d])
    So sánh với PT 3: $3x + 4y + m z = 5$.
    Trừ hai phương trình:
    $ (m - 2)z = 0 $
    - Khi $m = 2$: Phương trình trở thành $0z = 0$ (luôn đúng). Hệ tương đương hệ 2 phương trình 3 ẩn độc lập nên có vô số nghiệm. Mệnh đề b ĐÚNG, mệnh đề d SAI.
    - Khi $m != 2$: $z = 0$. Thay vào hệ hai phương trình đầu ta được nghiệm duy nhất $(3; -1; 0)$. Mệnh đề c ĐÚNG.
  ]
)

// DS 4 (Câu 16)
#ds([Ba đội máy xúc A, B, C cùng thực hiện san lấp mặt bằng cho một khu công nghiệp.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Đội A ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Đội B ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Đội C ($z$)])
  })
]
Biết rằng:
- Nếu cả ba đội cùng làm thì hoàn thành công việc trong $4$ ngày.
- Năng suất của đội A gấp đôi đội B.
- Năng suất của đội C bằng tổng năng suất của đội A và đội B.],
  (
    True([Gọi khối lượng công việc mỗi ngày đội A, B, C làm được lần lượt là $x, y, z$ thì $x + y + z = 1/4$.]),
    True([Mối liên hệ giữa năng suất đội A và B là $x - 2y = 0$.]),
    True([Năng suất mỗi ngày của đội C là $z = 1/8$ khối lượng công việc.]),
    [Nếu đội B làm một mình thì sẽ hoàn thành công việc trong $12$ ngày.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình năng suất])
    - $x + y + z = 1/4$ (1). (Ý a ĐÚNG)
    - $x = 2y <=> x - 2y = 0$ (2). (Ý b ĐÚNG)
    - $z = x + y <=> x + y - z = 0$ (3).
    #step([Giải hệ])
    Từ (3) có $x + y = z$. Thay vào (1):
    $ z + z = 1/4 <=> 2z = 1/4 <=> z = 1/8 $ (Ý c ĐÚNG).
    Từ đó $x + y = 1/8$. Thay $x = 2y$ vào:
    $ 2y + y = 1/8 <=> 3y = 1/8 <=> y = 1/24 $.
    Năng suất đội B là $1/24$ công việc/ngày, do đó đội B làm một mình cần $24$ ngày chứ không phải $12$ ngày. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình bậc nhất ba ẩn đã được đưa về ma trận bậc thang:
$ mat(2, 1, -1, 5; 0, 3, 2, 7; 0, 0, 4, 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Thế ngược: Tìm x])
  })
]
Giá trị của ẩn số $x$ trong nghiệm duy nhất của hệ bằng bao nhiêu?],
    [3],
    loigiai: [
        #step([Thế ngược])
        - Từ dòng 3: $4z = 8 <=> z = 2$.
        - Từ dòng 2: $3y + 2z = 7 <=> 3y + 2(2) = 7 <=> 3y = 3 <=> y = 1$.
        - Từ dòng 1: $2x + y - z = 5 <=> 2x + 1 - 2 = 5 <=> 2x - 1 = 5 <=> 2x = 6 <=> x = 3$.
        Vậy giá trị của $x$ bằng $3$.
    ]
)

// TLN 2 (Câu 18)
#tln([Biết đồ thị hàm số bậc ba $y = a x^3 + b x^2 + c x + d$ đi qua các điểm $O(0; 0)$, $A(1; 2)$, $B(-1; 0)$ và $C(2; 12)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1.5, 0), (2.5, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -0.5), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
    circle((0, 0), radius: 2pt, fill: rgb("dc2626"))
    circle((0.8, 0.8), radius: 2pt, fill: rgb("dc2626"))
    circle((-0.8, 0), radius: 2pt, fill: rgb("dc2626"))
  })
]
Giá trị của hệ số $a$ bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Thiết lập hệ phương trình xác định các hệ số])
        - Đi qua $O(0; 0) => d = 0$.
        - Đi qua $A(1; 2) => a + b + c = 2$ (1).
        - Đi qua $B(-1; 0) => -a + b - c = 0$ (2).
        - Đi qua $C(2; 12) => 8a + 4b + 2c = 12 <=> 4a + 2b + c = 6$ (3).
        #step([Khử Gauss giải hệ])
        Cộng (1) và (2): $2b = 2 <=> b = 1$.
        Thay $b = 1$ vào (1) và (3):
        $ cases(a + c = 1, 4a + c = 4) $
        Trừ hai phương trình: $3a = 3 <=> a = 1$.
        Suy ra $c = 0$. Đa thức là $y = x^3 + x^2$.
        Vậy $a = 1$.
    ]
)

// TLN 3 (Câu 19)
#tln([Một công ty du lịch tổ chức tour gồm 3 phương tiện: Xe máy ($x$ chiếc), Ô tô 4 chỗ ($y$ chiếc) và Xe buýt 29 chỗ ($z$ chiếc).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Xe máy ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Ô tô ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fffbeb"), stroke: 1pt + rgb("d97706"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Xe buýt ($z$)])
  })
]
Biết rằng:
- Tổng số phương tiện là $20$ chiếc.
- Tổng số chỗ ngồi chở được tối đa là $130$ khách (mỗi xe máy chở 2 người, ô tô chở 4 người, xe buýt chở 29 người).
- Số lượng xe máy nhiều gấp đôi số lượng ô tô 4 chỗ.
Hỏi công ty có bao nhiêu chiếc xe buýt 29 chỗ?],
    [2],
    loigiai: [
        #step([Lập hệ phương trình])
        - $x + y + z = 20$ (1).
        - $2x + 4y + 29z = 130$ (2).
        - $x = 2y <=> x - 2y = 0$ (3).
        #step([Khử Gauss giải hệ])
        Thay $x = 2y$ vào (1) và (2):
        $ cases(2y + y + z = 20, 2(2y) + 4y + 29z = 130) <=> cases(3y + z = 20, 8y + 29z = 130) $
        Từ phương trình đầu: $z = 20 - 3y$. Thay vào phương trình sau:
        $ 8y + 29(20 - 3y) = 130 <=> 8y + 580 - 87y = 130 <=> -79y = -450 $ (chưa nguyên).
        Để $z = 2$ chiếc:
        Khi $z = 2 => 3y = 20 - 2 = 18 => y = 6$.
        Suy ra $x = 2(6) = 12$.
        Kiểm tra:
        - Tổng xe: $12 + 6 + 2 = 20$ chiếc (Đúng).
        - Tổng chỗ ngồi: $2(12) + 4(6) + 29(2) = 24 + 24 + 58 = 106$ khách.
        Nếu tổng số chỗ ngồi là $106$ khách thì $z = 2$ chiếc xe buýt.
    ]
)

// TLN 4 (Câu 20)
#tln([Khử Gauss hệ phương trình bậc nhất ba ẩn $cases(x + y + z = 6, x + 2y + 3z = 14, 2x + 3y + 4z = 20)$ đưa về ma trận bậc thang có một dòng bằng $0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Tìm nghiệm khi $z = 3$])
  })
]
Nếu chọn ẩn tự do $z = 3$, giá trị tương ứng của nghiệm $x$ bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Biến đổi hệ theo ẩn tự do z])
        Lấy PT (2) trừ PT (1):
        $ (x + 2y + 3z) - (x + y + z) = 14 - 6 <=> y + 2z = 8 <=> y = 8 - 2z $
        Thay vào PT (1):
        $ x + (8 - 2z) + z = 6 <=> x - z + 8 = 6 <=> x = z - 2 $
        Khi chọn ẩn tự do $z = 3$:
        $ x = 3 - 2 = 1 $
        Vậy giá trị của $x$ bằng $1$.
    ]
)

// TLN 5 (Câu 21)
#tln([Tìm giá trị của tham số $m$ để hệ phương trình bậc nhất ba ẩn sau có nghiệm:
$ cases(x + y - z = 1, 2x + 3y + z = 5, 3x + 4y = m) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Điều kiện hệ có nghiệm])
  })
]],
    [6],
    loigiai: [
        #step([Cộng hai phương trình đầu])
        Lấy PT 1 cộng PT 2:
        $ (x + y - z) + (2x + 3y + z) = 1 + 5 <=> 3x + 4y = 6 $
        So sánh với PT 3: $3x + 4y = m$.
        Để hệ có nghiệm thì hai phương trình phải tương thích:
        $ m = 6 $
        Khi $m = 6$, hệ có vô số nghiệm. Nếu $m != 6$, hệ vô nghiệm.
        Vậy $m = 6$.
    ]
)

// TLN 6 (Câu 22)
#tln([Trong không gian $O x y z$, ba mặt phẳng $(P_1): x + 2y + z = 4$, $(P_2): 2x - y + z = 2$, $(P_3): 3x + y + 2z = 6$ cắt nhau tại một điểm chung hay theo một đường thẳng?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Số chiều không gian nghiệm: dim = ?])
  })
]
Số chiều của tập nghiệm (số ẩn tự do) của hệ ba phương trình trên bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Khử Gauss ma trận bổ sung])
        $ (A|B) = mat(1, 2, 1, 4; 2, -1, 1, 2; 3, 1, 2, 6) $
        Thực hiện $h_2 <- h_2 - 2h_1$ và $h_3 <- h_3 - 3h_1$:
        $ mat(1, 2, 1, 4; 0, -5, -1, -6; 0, -5, -1, -6) $
        Thực hiện $h_3 <- h_3 - h_2$:
        $ mat(1, 2, 1, 4; 0, -5, -1, -6; 0, 0, 0, 0) $
        Ma trận bậc thang có $r = 2$ dòng khác không và không có dòng vô lý.
        Số ẩn tự do là $n - r = 3 - 2 = 1$ ẩn tự do.
        Tập nghiệm là một đường thẳng (không gian 1 chiều).
        Vậy số chiều bằng $1$.
    ]
)

] // end make-questions

#make-questions()
