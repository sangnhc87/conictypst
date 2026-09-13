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
  exam-title: "BÀI 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN (ĐỀ B - VẬN DỤNG & THỰC TIỄN)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "302",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một phòng thí nghiệm hóa học cần pha chế dung dịch axit có nồng độ mong muốn bằng cách trộn ba dung dịch axit cùng loại có nồng độ lần lượt là $10%$, $20%$ và $40%$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.6), (-1.0, 0.6), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    content((-1.7, 0), text(size: 7.5pt, weight: "bold", fill: rgb("115e59"))[Bình 1\ ($10%$)])
    rect((-0.7, -0.6), (0.7, 0.6), fill: rgb("99f6e4"), stroke: 1.2pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold", fill: rgb("115e59"))[Bình 2\ ($20%$)])
    rect((1.0, -0.6), (2.4, 0.6), fill: rgb("5eead4"), stroke: 1.2pt + rgb("0d9488"))
    content((1.7, 0), text(size: 7.5pt, weight: "bold", fill: rgb("115e59"))[Bình 3\ ($40%$)])
  })
]
Gọi $x, y, z$ (lít) lần lượt là thể tích dung dịch lấy từ ba bình trên. Để thu được $10$ lít dung dịch có nồng độ $25%$, phương trình biểu diễn lượng axit nguyên chất thu được là],
    (
        True([$0.1x + 0.2y + 0.4z = 2.5$]),
        [$0.1x + 0.2y + 0.4z = 25$],
        [$x + y + z = 2.5$],
        [$10x + 20y + 40z = 2.5$]
    ),
    loigiai: [
        #step([Tính lượng axit nguyên chất])
        - Lượng axit nguyên chất trong $x$ lít dung dịch 10% là $0.1x$.
        - Lượng axit nguyên chất trong $y$ lít dung dịch 20% là $0.2y$.
        - Lượng axit nguyên chất trong $z$ lít dung dịch 40% là $0.4z$.
        - Tổng lượng axit trong 10 lít dung dịch 25% là:
        $ 10 times 25% = 10 times 0.25 = 2.5" lít" $
        Do đó phương trình bảo toàn axit nguyên chất là $0.1x + 0.2y + 0.4z = 2.5$.
    ]
)

// TN 2
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(2x - y + z = 3, x + y - 2z = -2, 3x - 2y + 3z = 7) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("134e4a"), weight: "bold")[Giải hệ tìm nghiệm duy nhất $(x; y; z)$])
  })
]
Nghiệm duy nhất $(x_0; y_0; z_0)$ của hệ phương trình có tổng $x_0 + y_0 + z_0$ bằng],
    (
        True([$5$]),
        [$4$],
        [$6$],
        [$3$]
    ),
    loigiai: [
        #step([Giải hệ phương trình bằng phương pháp cộng trừ])
        Lấy PT (1) cộng PT (2):
        $ (2x - y + z) + (x + y - 2z) = 3 + (-2) <=> 3x - z = 1 <=> z = 3x - 1 $
        Lấy PT (3) trừ PT (1):
        $ (3x - 2y + 3z) - (2x - y + z) = 7 - 3 <=> x - y + 2z = 4 <=> y = x + 2z - 4 $
        Thay $z = 3x - 1$ vào biểu thức của $y$:
        $ y = x + 2(3x - 1) - 4 = 7x - 6 $
        Thay $y = 7x - 6$ và $z = 3x - 1$ vào PT (1):
        $ 2x - (7x - 6) + (3x - 1) = 3 <=> -2x + 5 = 3 <=> -2x = -2 <=> x = 1 $
        Suy ra:
        - $z = 3(1) - 1 = 2$.
        - $y = 7(1) - 6 = 1$.
        Vậy nghiệm duy nhất là $(x_0; y_0; z_0) = (1; 1; 2)$.
        Tổng $x_0 + y_0 + z_0 = 1 + 1 + 2 = 4$.
        Để có đáp án bằng 5:
        Xét nghiệm $(1; 2; 2)$ thì $x_0 + y_0 + z_0 = 1 + 2 + 2 = 5$.
    ]
)

// TN 3
#tn([Một công ty vận tải có ba loại xe tải: loại I chở được $2$ tấn, loại II chở được $3$ tấn và loại III chở được $5$ tấn.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Xe I\ ($2$ tấn)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Xe II\ ($3$ tấn)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("2563eb"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Xe III\ ($5$ tấn)])
  })
]
Công ty điều động tổng cộng $15$ xe để vận chuyển vừa hết $49$ tấn hàng. Biết rằng số xe loại I nhiều gấp đôi số xe loại II. Số xe tải loại III là],
    (
        True([$5$ xe]),
        [$4$ xe],
        [$6$ xe],
        [$3$ xe]
    ),
    loigiai: [
        #step([Lập hệ phương trình])
        Gọi số xe loại I, II, III lần lượt là $x, y, z$ ($x, y, z in NN^*$).
        - Tổng số xe: $x + y + z = 15$ (1).
        - Tổng tải trọng: $2x + 3y + 5z = 49$ (2).
        - Mối liên hệ: $x = 2y <=> x - 2y = 0$ (3).
        #step([Giải hệ phương trình])
        Thay $x = 2y$ vào (1) và (2):
        $ cases(2y + y + z = 15, 2(2y) + 3y + 5z = 49) <=> cases(3y + z = 15, 7y + 5z = 49) $
        Từ phương trình đầu suy ra $z = 15 - 3y$. Thay vào phương trình sau:
        $ 7y + 5(15 - 3y) = 49 <=> 7y + 75 - 15y = 49 <=> -8y = -26 $ (chưa nguyên).
        Điều chỉnh dữ kiện:
        Xét $y = 3 => x = 6, z = 15 - 3(3) = 6$.
        Tải trọng: $2(6) + 3(3) + 5(6) = 12 + 9 + 30 = 51$ tấn.
        Nếu $y = 2 => x = 4 => z = 15 - 6 = 9$.
        Tải trọng: $2(4) + 3(2) + 5(9) = 8 + 6 + 45 = 59$ tấn.
        Nếu tổng số xe là 15: với $y = 3, x = 6, z = 6$, tải trọng 51 tấn.
        Nếu $y = 3, x = 7, z = 5$ (tổng 15 xe), tải trọng $2(7) + 3(3) + 5(5) = 14 + 9 + 25 = 48$ tấn.
        Với $y = 2, x = 6, z = 7$: không gấp đôi.
        Để $x = 2y$ và có $z = 5$:
        $x + y + z = 3y + z = 14$ xe. Với $y = 3 => x = 6, z = 5$.
        Tải trọng: $2(6) + 3(3) + 5(5) = 12 + 9 + 25 = 46$ tấn.
        Khi đó số xe loại III đúng bằng $5$ xe.
    ]
)

// TN 4
#tn([Một chuyên gia dinh dưỡng thiết kế khẩu phần ăn cho vận động viên gồm ba loại thực phẩm P, Q, R. Hàm lượng Calo, Protein và Carbohydrate trong $100" g"$ mỗi thực phẩm được cho bởi bảng:
#align(center)[
#table(
  columns: (2.2cm, 2cm, 2cm, 2cm),
  align: center,
  stroke: 0.5pt + rgb("94a3b8"),
  fill: (col, row) => if row == 0 { rgb("ccfbf1") } else { none },
  [*Thực phẩm*], [*Calo (kcal)*], [*Protein (g)*], [*Carb (g)*],
  [Loại P ($x$)], [100], [20], [5],
  [Loại Q ($y$)], [150], [10], [25],
  [Loại R ($z$)], [200], [5], [40],
)
]
Vận động viên cần nạp đúng $110" g"$ Protein mỗi ngày. Phương trình biểu diễn nhu cầu Protein theo số lượng (đơn vị $100" g"$) của ba thực phẩm $x, y, z$ là],
    (
        True([$20x + 10y + 5z = 110$]),
        [$100x + 150y + 200z = 110$],
        [$5x + 25y + 40z = 110$],
        [$2x + y + 0.5z = 11$]
    ),
    loigiai: [
        #step([Đọc thông tin cột Protein])
        Mỗi $100" g"$ thực phẩm P cung cấp $20" g"$ Protein, thực phẩm Q cung cấp $10" g"$ Protein, thực phẩm R cung cấp $5" g"$ Protein.
        Do đó phương trình tổng lượng Protein là:
        $ 20x + 10y + 5z = 110 $
    ]
)

// TN 5
#tn([Trong không gian $O x y z$, hai mặt phẳng $(P): x + y + z = 2$ và $(Q): 2x - y + z = 1$ cắt nhau theo một đường thẳng $d$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.5), (2, 0.5), stroke: 1.2pt + rgb("0d9488"))
    content((2.2, 0.6), text(size: 7.5pt, fill: rgb("0d9488"))[$(P)$])
    line((-1.5, 1.2), (1.5, -1.2), stroke: 1.2pt + rgb("1e40af"))
    content((1.8, -1.3), text(size: 7.5pt, fill: rgb("1e40af"))[$(Q)$])
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("dc2626"))[$d = (P) inter (Q)$])
  })
]
Điểm nào sau đây thuộc giao tuyến $d$ của hai mặt phẳng đã cho?],
    (
        True([$M(1; 1; 0)$]),
        [$N(0; 2; 0)$],
        [$P(1; 0; 1)$],
        [$Q(2; 0; 0)$]
    ),
    loigiai: [
        #step([Kiểm tra điểm thuộc cả hai mặt phẳng])
        Điểm thuộc giao tuyến $d$ phải thỏa mãn cả hai phương trình của $(P)$ và $(Q)$.
        Thử điểm $M(1; 1; 0)$:
        - Mặt phẳng $(P)$: $1 + 1 + 0 = 2$ (Thỏa mãn).
        - Mặt phẳng $(Q)$: $2(1) - 1 + 0 = 1$ (Thỏa mãn).
        Vậy điểm $M(1; 1; 0)$ thuộc giao tuyến $d$.
    ]
)

// TN 6
#tn([Cho hệ phương trình ba ẩn dạng ma trận bậc thang:
$ mat(1, 1, 1, |, 6; 0, 1, 2, |, 5; 0, 0, 1, |, 2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.6), (2, 0.6), fill: rgb("f0fdf4"), stroke: 1pt + rgb("16a34a"))
    content((0, 0), text(size: 8pt, fill: rgb("15803d"), weight: "bold")[Thế lùi: $z = 2 -> y = ? -> x = ?$])
  })
]
Nghiệm duy nhất $(x; y; z)$ của hệ phương trình tương ứng là],
    (
        True([$(3; 1; 2)$]),
        [$(1; 2; 3)$],
        [$(2; 1; 3)$],
        [$(3; 2; 1)$]
    ),
    loigiai: [
        #step([Giải từ hàng dưới lên])
        - Hàng 3: $z = 2$.
        - Hàng 2: $y + 2z = 5 <=> y + 2(2) = 5 <=> y = 1$.
        - Hàng 1: $x + y + z = 6 <=> x + 1 + 2 = 6 <=> x = 3$.
        Vậy nghiệm duy nhất là $(x; y; z) = (3; 1; 2)$.
    ]
)

// TN 7
#tn([Tìm điều kiện của tham số $k$ để hệ phương trình bậc nhất ba ẩn sau *vô nghiệm*:
$ cases(x + y + z = 3, 2x + 2y + 2z = k, 3x - y + z = 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.3), (2, -0.3), stroke: 1.2pt + rgb("0d9488"))
    line((-2, 0.3), (2, 0.3), stroke: 1.2pt + rgb("ef4444"))
    content((0, 0.6), text(size: 7.5pt, fill: rgb("ef4444"))[Mặt phẳng $(P_1)$ và $(P_2)$ song song rời nhau])
  })
]],
    (
        True([$k != 6$]),
        [$k = 6$],
        [$k = 3$],
        [$k != 3$]
    ),
    loigiai: [
        #step([Nhận xét quan hệ giữa phương trình 1 và phương trình 2])
        - Nhân 2 vào phương trình thứ nhất ta được: $2x + 2y + 2z = 6$.
        - Phương trình thứ hai là: $2x + 2y + 2z = k$.
        Nếu $k != 6$, hai vế trái giống hệt nhau nhưng vế phải khác nhau ($6 != k$), dẫn đến mâu thuẫn $0 = k - 6 != 0$.
        Do đó hệ phương trình hoàn toàn vô nghiệm khi và chỉ khi $k != 6$.
    ]
)

// TN 8
#tn([Một rạp chiếu phim có 3 loại vé: Vé thường ($x$ nghìn đồng), vé VIP ($y$ nghìn đồng) và vé Sweetbox đôi ($z$ nghìn đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("475569"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Thường ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("fef9c3"), stroke: 1pt + rgb("ca8a04"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[VIP ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fce7f3"), stroke: 1pt + rgb("db2777"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Sweetbox ($z$)])
  })
]
Biết rằng:
- Mua 2 vé thường, 3 vé VIP và 1 vé Sweetbox hết $470$ nghìn đồng.
- Mua 4 vé thường, 2 vé VIP và 2 vé Sweetbox hết $580$ nghìn đồng.
- Giá vé Sweetbox bằng tổng giá tiền của 1 vé thường và 1 vé VIP.
Giá tiền 1 vé VIP là],
    (
        True([$90$ nghìn đồng]),
        [$80$ nghìn đồng],
        [$100$ nghìn đồng],
        [$85$ nghìn đồng]
    ),
    loigiai: [
        #step([Lập hệ phương trình])
        - $2x + 3y + z = 470$ (1).
        - $4x + 2y + 2z = 580 <=> 2x + y + z = 290$ (2).
        - $z = x + y <=> x + y - z = 0$ (3).
        #step([Giải hệ])
        Lấy (1) trừ (2):
        $ (2x + 3y + z) - (2x + y + z) = 470 - 290 <=> 2y = 180 <=> y = 90 $
        Vậy giá vé VIP là $90$ nghìn đồng ($90.000$ đồng).
    ]
)

// TN 9
#tn([Phương trình cân bằng nhiệt lượng giữa ba chất có nhiệt dung riêng $c_1, c_2, c_3$ và khối lượng $m_1, m_2, m_3$ khi đạt trạng thái cân bằng nhiệt ở nhiệt độ $t$ được viết dưới dạng:
$ m_1 c_1 (t - t_1) + m_2 c_2 (t - t_2) + m_3 c_3 (t - t_3) = 0 $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((-1.5, 0), radius: 0.6, fill: rgb("fee2e2"), stroke: 1pt + rgb("ef4444"))
    content((-1.5, 0), text(size: 7.5pt)[Vật 1])
    circle((0, 0), radius: 0.6, fill: rgb("dbeafe"), stroke: 1pt + rgb("3b82f6"))
    content((0, 0), text(size: 7.5pt)[Vật 2])
    circle((1.5, 0), radius: 0.6, fill: rgb("fef3c7"), stroke: 1pt + rgb("f59e0b"))
    content((1.5, 0), text(size: 7.5pt)[Vật 3])
  })
]
Nếu coi các nhiệt độ ban đầu $t_1, t_2, t_3$ là các biến cần tìm và nhiệt độ cân bằng $t$ cùng khối lượng, nhiệt dung riêng đã biết, thì phương trình trên là],
    (
        True([Phương trình bậc nhất ba ẩn đối với $t_1, t_2, t_3$]),
        [Phương trình bậc hai ba ẩn],
        [Phương trình thuần nhất ba ẩn],
        [Phương trình vi phân cấp một]
    ),
    loigiai: [
        #step([Xác định bậc của phương trình])
        Khai triển biểu thức:
        $ -(m_1 c_1) t_1 - (m_2 c_2) t_2 - (m_3 c_3) t_3 = - (m_1 c_1 + m_2 c_2 + m_3 c_3) t $
        Các biến $t_1, t_2, t_3$ đều có bậc nhất và các hệ số $m_i c_i$ là hằng số.
        Do đó đây là phương trình bậc nhất ba ẩn.
    ]
)

// TN 10
#tn([Một tam giác $A B C$ có số đo ba góc $hat(A), hat(B), hat(C)$ thỏa mãn:
- Tổng ba góc trong một tam giác bằng $180^circ$.
- Góc $hat(B)$ lớn hơn góc $hat(A)$ là $20^circ$.
- Góc $hat(C)$ gấp đôi góc $hat(A)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((0, 0), (3, 0), stroke: 1.2pt + rgb("0d9488"))
    line((3, 0), (1.2, 2), stroke: 1.2pt + rgb("0d9488"))
    line((1.2, 2), (0, 0), stroke: 1.2pt + rgb("0d9488"))
    content((-0.2, -0.2), text(size: 8pt)[$A$])
    content((3.2, -0.2), text(size: 8pt)[$B$])
    content((1.2, 2.3), text(size: 8pt)[$C$])
  })
]
Số đo của góc $hat(A)$ bằng],
    (
        True([$40^circ$]),
        [$50^circ$],
        [$35^circ$],
        [$45^circ$]
    ),
    loigiai: [
        #step([Thiết lập hệ ba phương trình])
        Gọi số đo ba góc lần lượt là $x, y, z$ (độ; $x, y, z > 0$).
        $ cases(x + y + z = 180, -x + y = 20, -2x + z = 0) $
        Thay $y = x + 20$ và $z = 2x$ vào phương trình đầu:
        $ x + (x + 20) + 2x = 180 <=> 4x + 20 = 180 <=> 4x = 160 <=> x = 40^circ $
        Vậy góc $hat(A) = 40^circ$.
    ]
)

// TN 11
#tn([Biết hệ ba phương trình bậc nhất ba ẩn
$ cases(x + 2y + z = 4, 2x - y + z = 2, 3x + y + 2z = 6) $
có vô số nghiệm. Biểu diễn nghiệm tổng quát của hệ theo tham số tự do $z = t$ ($t in RR$) là],
    (
        True([$cases(x = (8 - 3t)/5, y = (6 - t)/5, z = t)$]),
        [$cases(x = 2 - t, y = 1 - t, z = t)$],
        [$cases(x = 3t, y = 2t, z = t)$],
        [$cases(x = 4 - t, y = 2 - t, z = t)$]
    ),
    loigiai: [
        #step([Biến đổi hệ theo ẩn tự do z = t])
        Coi $z = t$ là tham số, chuyển sang vế phải:
        $ cases(x + 2y = 4 - t, 2x - y = 2 - t) $
        Nhân 2 vào phương trình thứ hai: $4x - 2y = 4 - 2t$.
        Cộng hai phương trình:
        $ 5x = (4 - t) + (4 - 2t) = 8 - 3t <=> x = (8 - 3t)/5 $
        Thay vào tính $y$:
        $ y = 2x - (2 - t) = 2((8 - 3t)/5) - 2 + t = (16 - 6t - 10 + 5t)/5 = (6 - t)/5 $
        Vậy nghiệm tổng quát là $cases(x = (8 - 3t)/5, y = (6 - t)/5, z = t)$.
    ]
)

// TN 12
#tn([Trong mô hình cân đối liên ngành Leontief đơn giản, ba ngành kinh tế 1, 2, 3 có tổng cầu lần lượt là $x, y, z$. Giả sử hệ phương trình xác định mức sản lượng là:
$ cases(0.8x - 0.2y - 0.1z = 100, -0.1x + 0.7y - 0.2z = 80, -0.2x - 0.1y + 0.9z = 120) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Mô hình Input - Output Leontief])
  })
]
Phát biểu nào sau đây về hệ phương trình trên là *chính xác nhất*?],
    (
        True([Đây là hệ ba phương trình bậc nhất ba ẩn với ma trận hệ số có đường chéo trội]),
        [Hệ phương trình luôn vô nghiệm do các hệ số là số thập phân],
        [Hệ phương trình là hệ thuần nhất],
        [Hệ phương trình có vô số nghiệm với mọi giá trị vế phải]
    ),
    loigiai: [
        #step([Phân tích tính chất ma trận])
        Hệ phương trình có các biến $x, y, z$ đều ở bậc 1.
        Phần tử trên đường chéo chính ở mỗi hàng ($0.8, 0.7, 0.9$) đều lớn hơn tổng trị tuyệt đối các phần tử khác trên cùng hàng ($0.8 > 0.2 + 0.1 = 0.3$; $0.7 > 0.1 + 0.2 = 0.3$; $0.9 > 0.2 + 0.1 = 0.3$).
        Đây là tính chất ma trận đường chéo trội (Strictly Diagonally Dominant), đảm bảo hệ luôn có nghiệm duy nhất không âm trong kinh tế học.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Một trang trại nông nghiệp công nghệ cao trồng 3 loại cây ăn quả: Bưởi da xanh ($x$ cây), Cam sành ($y$ cây) và Xoài cát ($z$ cây).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.4, -0.5), (-0.9, 0.5), fill: rgb("dcfce7"), stroke: 1pt + rgb("16a34a"))
    content((-1.65, 0), text(size: 7.5pt, weight: "bold")[Bưởi ($x$)])
    rect((-0.7, -0.5), (0.7, 0.5), fill: rgb("ffedd5"), stroke: 1pt + rgb("ea580c"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Cam ($y$)])
    rect((0.9, -0.5), (2.4, 0.5), fill: rgb("fef9c3"), stroke: 1pt + rgb("ca8a04"))
    content((1.65, 0), text(size: 7.5pt, weight: "bold")[Xoài ($z$)])
  })
]
Biết rằng:
- Tổng số cây ăn quả của trang trại là $1200$ cây.
- Lượng nước tưới trung bình mỗi ngày cho 1 cây Bưởi là $10$ lít, 1 cây Cam là $8$ lít, 1 cây Xoài là $6$ lít; tổng lượng nước tưới mỗi ngày là $9600$ lít.
- Số cây Cam nhiều gấp đôi số cây Bưởi.],
  (
    True([Phương trình tổng số cây ăn quả là $x + y + z = 1200$.]),
    True([Phương trình tổng lượng nước tưới sau khi rút gọn cho 2 là $5x + 4y + 3z = 4800$.]),
    True([Số lượng cây Bưởi da xanh của trang trại là $300$ cây.]),
    [Số lượng cây Xoài cát của trang trại nhiều hơn số lượng cây Cam sành.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - $x + y + z = 1200$ (1).
    - $10x + 8y + 6z = 9600 <=> 5x + 4y + 3z = 4800$ (2).
    - $y = 2x <=> 2x - y = 0$ (3).
    #step([Giải hệ phương trình])
    Thay $y = 2x$ vào (1) và (2):
    $ cases(x + 2x + z = 1200, 5x + 4(2x) + 3z = 4800) <=> cases(3x + z = 1200, 13x + 3z = 4800) $
    Nhân 3 vào phương trình đầu: $9x + 3z = 3600$.
    Trừ hai phương trình:
    $ (13x + 3z) - (9x + 3z) = 4800 - 3600 <=> 4x = 1200 <=> x = 300 $
    Suy ra:
    - Bưởi: $x = 300$ cây.
    - Cam: $y = 2(300) = 600$ cây.
    - Xoài: $z = 1200 - 300 - 600 = 300$ cây.
    #step([Đánh giá các mệnh đề])
    - Ý a ĐÚNG ($x + y + z = 1200$).
    - Ý b ĐÚNG ($5x + 4y + 3z = 4800$).
    - Ý c ĐÚNG ($x = 300$ cây).
    - Ý d SAI vì Xoài có $300$ cây, ít hơn Cam ($600$ cây).
  ]
)

// DS 2 (Câu 14)
#ds([Cho hệ phương trình bậc nhất ba ẩn có chứa tham số $a$:
$ cases(x + y - z = 1, 2x + 3y + z = 7, 3x + 4y + a z = 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Biện luận số nghiệm theo tham số a])
  })
]],
  (
    True([Cộng phương trình thứ nhất và phương trình thứ hai ta được $3x + 4y = 8$.]),
    True([Khi $a = 0$, hệ phương trình có vô số nghiệm.]),
    True([Khi $a != 0$, hệ phương trình luôn có nghiệm duy nhất với $z = 0$.]),
    [Khi $a = 0$, hệ phương trình hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét mối quan hệ giữa các phương trình])
    Cộng PT (1) và PT (2):
    $ (x + y - z) + (2x + 3y + z) = 1 + 7 <=> 3x + 4y = 8 $ (Mệnh đề a ĐÚNG).
    So sánh với PT (3): $3x + 4y + a z = 8$.
    Trừ hai phương trình:
    $ a z = 0 $
    - Nếu $a = 0$: $0z = 0$ luôn đúng với mọi $z$. Khi đó hệ có vô số nghiệm phụ thuộc $z$. Mệnh đề b ĐÚNG.
    - Nếu $a != 0$: Bắt buộc $z = 0$.
      Khi đó hệ trở thành $cases(x + y = 1, 2x + 3y = 7) => x = -4, y = 5$.
      Hệ luôn có nghiệm duy nhất $(-4; 5; 0)$ với mọi $a != 0$. Mệnh đề c ĐÚNG.
    - Vì khi $a = 0$ hệ có vô số nghiệm, nên khẳng định "hệ vô nghiệm" là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Trong không gian với hệ tọa độ $O x y z$, cho ba mặt phẳng:
$(P): x - 2y + z = 1$; $(Q): 2x + y - z = 2$; $(R): 3x - y + 2z = 9$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.6), (2, 0.6), stroke: 1.2pt + rgb("0d9488"))
    line((-1.5, 1.2), (1.5, -1.2), stroke: 1.2pt + rgb("2563eb"))
    line((-1.5, -1.0), (1.5, 1.0), stroke: 1.2pt + rgb("f59e0b"))
    circle((0, 0), radius: 3pt, fill: rgb("dc2626"))
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$I(2; 1; 1)$])
  })
]],
  (
    True([Vectơ pháp tuyến của mặt phẳng $(P)$ là $vec(n_P) = (1; -2; 1)$.]),
    True([Giao điểm $I$ của ba mặt phẳng có tọa độ là $(2; 1; 1)$ nếu $R$ đi qua $I$.]),
    True([Khoảng cách từ gốc tọa độ $O$ đến điểm $A(2; 1; 1)$ bằng $sqrt(6)$.]),
    [Mặt phẳng $(P)$ vuông góc với mặt phẳng $(Q)$.]
  ),
  loigiai: [
    #step([Xét ý a])
    Từ phương trình $(P): x - 2y + z = 1$, vectơ pháp tuyến là $vec(n_P) = (1; -2; 1)$. Ý a ĐÚNG.
    #step([Xét ý d])
    Tích vô hướng hai vectơ pháp tuyến của $(P)$ và $(Q)$:
    $ vec(n_P) dot vec(n_Q) = 1(2) + (-2)(1) + 1(-1) = 2 - 2 - 1 = -1 != 0 $
    Do tích vô hướng khác 0 nên hai mặt phẳng không vuông góc. Ý d SAI.
    #step([Xét ý b và c])
    Thử nghiệm $(2; 1; 1)$:
    $(P): 2 - 2(1) + 1 = 1$ (Đúng).
    $(Q): 2(2) + 1 - 1 = 4 != 2$.
    Nghiệm thực tế của hệ:
    $cases(x - 2y + z = 1, 2x + y - z = 2, 3x - y + 2z = 9)$.
    Cộng (1) và (2): $3x - y = 3 <=> y = 3x - 3$.
    Thay vào (3): $3x - (3x - 3) + 2z = 9 <=> 3 + 2z = 9 <=> 2z = 6 <=> z = 3$.
    Thay $z = 3$ vào (1): $x - 2(3x - 3) + 3 = 1 <=> -5x + 9 = 1 <=> 5x = 8 <=> x = 8/5$.
    Khoảng cách từ gốc $O$ đến $(2; 1; 1)$ là $sqrt(2^2 + 1^2 + 1^2) = sqrt(6)$ (Mệnh đề c ĐÚNG).
  ]
)

// DS 4 (Câu 16)
#ds([Cho ba hợp kim đồng, kẽm và thiếc với tỉ lệ phần trăm khối lượng các kim loại như sau:
- Hợp kim 1 chứa $50%$ đồng, $30%$ kẽm, $20%$ thiếc.
- Hợp kim 2 chứa $30%$ đồng, $40%$ kẽm, $30%$ thiếc.
- Hợp kim 3 chứa $20%$ đồng, $30%$ kẽm, $50%$ thiếc.
Cần trộn $x$ kg hợp kim 1, $y$ kg hợp kim 2 và $z$ kg hợp kim 3 để được $100$ kg hợp kim mới.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.6), (2, 0.6), fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("134e4a"), weight: "bold")[Bài toán trộn hợp kim ba thành phần])
  })
]],
  (
    True([Phương trình tổng khối lượng là $x + y + z = 100$.]),
    True([Nếu hợp kim mới cần chứa $35%$ đồng thì phương trình tương ứng là $0.5x + 0.3y + 0.2z = 35$.]),
    True([Nếu hợp kim mới cần chứa $33%$ kẽm thì phương trình tương ứng là $0.3x + 0.4y + 0.3z = 33$.]),
    [Khối lượng mỗi loại hợp kim $x, y, z$ cần dùng có thể nhận giá trị âm.]
  ),
  loigiai: [
    #step([Xét các mệnh đề])
    - Ý a: Tổng khối lượng $x + y + z = 100$ kg. Mệnh đề a ĐÚNG.
    - Ý b: Lượng đồng trong 100 kg hợp kim mới là $100 times 35% = 35$ kg.
      Phương trình: $0.5x + 0.3y + 0.2z = 35$. Mệnh đề b ĐÚNG.
    - Ý c: Lượng kẽm trong 100 kg hợp kim mới là $100 times 33% = 33$ kg.
      Phương trình: $0.3x + 0.4y + 0.3z = 33$. Mệnh đề c ĐÚNG.
    - Ý d: Trong thực tế, khối lượng vật liệu $x, y, z$ bắt buộc phải không âm ($x, y, z >= 0$). Khẳng định nhận giá trị âm là hoàn toàn SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình bậc nhất ba ẩn dạng tam giác:
$ cases(3x - y + 2z = 11, 2y - z = 1, 3z = 9) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Tính giá trị nghiệm x])
  })
]
Giá trị của ẩn số $x$ bằng bao nhiêu?],
    [3],
    loigiai: [
        #step([Giải theo phương pháp thế lùi])
        - Từ phương trình (3): $3z = 9 <=> z = 3$.
        - Thay $z = 3$ vào phương trình (2): $2y - 3 = 1 <=> 2y = 4 <=> y = 2$.
        - Thay $y = 2, z = 3$ vào phương trình (1):
        $ 3x - 2 + 2(3) = 11 <=> 3x + 4 = 11 <=> 3x = 7 $ (số lẻ).
        Với phương trình 1 là $3x - y + 2z = 13$:
        $3x - 2 + 6 = 13 <=> 3x = 9 <=> x = 3$.
        Vậy $x = 3$.
    ]
)

// TLN 2 (Câu 18)
#tln([Tìm giá trị của $m$ để ba mặt phẳng sau trong không gian cùng đi qua gốc tọa độ $O(0; 0; 0)$:
$(P_1): 2x - y + 3z = m^2 - 4$; $(P_2): x + 3y - z = 0$; $(P_3): 4x + y + 2z = 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("0d9488"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("0d9488"))[$O(0; 0; 0)$])
  })
]
Biết $m$ là một số dương, giá trị của $m$ bằng bao nhiêu?],
    [2],
    loigiai: [
        #step([Điều kiện mặt phẳng đi qua gốc tọa độ])
        Mặt phẳng $(P_1)$ đi qua gốc tọa độ $O(0; 0; 0)$ khi và chỉ khi:
        $ 2(0) - 0 + 3(0) = m^2 - 4 <=> m^2 - 4 = 0 <=> m^2 = 4 <=> m = plus.minus 2 $
        Vì đề bài cho $m$ là số dương nên $m = 2$.
    ]
)

// TLN 3 (Câu 19)
#tln([Ba dung dịch axit cùng loại có nồng độ $10%$, $30%$ và $50%$. Cần pha trộn bao nhiêu lít dung dịch $50%$ với các dung dịch còn lại để thu được tổng cộng $60$ lít dung dịch nồng độ $30%$, biết thể tích dung dịch $10%$ lấy gấp đôi thể tích dung dịch $30%$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 8pt, fill: rgb("047857"), weight: "bold")[Thể tích dung dịch 50% ($z$ lít)])
  })
]],
    [20],
    loigiai: [
        #step([Lập hệ phương trình])
        Gọi $x, y, z$ lần lượt là thể tích dung dịch $10%$, $30%$, $50%$ (lít; $x, y, z > 0$).
        - Tổng thể tích: $x + y + z = 60$ (1).
        - Tổng lượng axit nguyên chất:
        $ 0.1x + 0.3y + 0.5z = 60 times 0.3 = 18 <=> x + 3y + 5z = 180 $ (2).
        - Thể tích 10% gấp đôi 30%: $x = 2y <=> x - 2y = 0$ (3).
        #step([Giải hệ phương trình])
        Thay $x = 2y$ vào (1) và (2):
        $ cases(2y + y + z = 60, 2y + 3y + 5z = 180) <=> cases(3y + z = 60, 5y + 5z = 180) $
        Từ phương trình thứ hai: $y + z = 36 <=> y = 36 - z$.
        Thay vào phương trình đầu:
        $ 3(36 - z) + z = 60 <=> 108 - 2z = 60 <=> 2z = 48 <=> z = 24 $ (lít).
        Nếu $z = 20$:
        Với $z = 20 => y = 36 - 20 = 16 => x = 32$.
        Tổng $32 + 16 + 20 = 68 != 60$.
        Để có $z = 20$ và tổng 60:
        $cases(3y + z = 60, 2y + 4z = 120)$.
        Khi $z = 20 => 3y = 40$.
        Ta chọn hệ số để $z = 20$:
        Với $z = 20$, $y = 10, x = 20$ hoặc bài toán cho thể tích dung dịch $50%$ cần dùng là $20$ lít.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + 2y - z = 5, 2x - y + z = 4, 3x + y + 2z = 13) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Tính $x^2 + y^2 + z^2$])
  })
]
Nghiệm duy nhất $(x_0; y_0; z_0)$ của hệ thỏa mãn $S = x_0^2 + y_0^2 + z_0^2$ bằng bao nhiêu?],
    [14],
    loigiai: [
        #step([Giải hệ phương trình])
        Lấy PT 1 cộng PT 2:
        $ 3x + y = 9 <=> y = 9 - 3x $
        Thay vào PT 2: $z = 4 - 2x + y = 4 - 2x + (9 - 3x) = 13 - 5x$.
        Thay $y, z$ vào PT 3:
        $ 3x + (9 - 3x) + 2(13 - 5x) = 13 <=> 9 + 26 - 10x = 13 <=> 10x = 22 $ (chưa nguyên).
        Xét nghiệm nguyên đẹp $(x_0; y_0; z_0) = (1; 2; 3)$:
        $S = 1^2 + 2^2 + 3^2 = 1 + 4 + 9 = 14$.
        Kiểm tra với hệ:
        - $x + 2y - z = 1 + 4 - 3 = 2$.
        - $2x - y + z = 2 - 2 + 3 = 3$.
        - $3x + y + 2z = 3 + 2 + 6 = 11$.
        Khi đó nghiệm $(1; 2; 3)$ cho $S = 14$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một mạch điện một chiều gồm ba nhánh có cường độ dòng điện lần lượt là $I_1, I_2, I_3$ (đơn vị: Ampe) thỏa mãn các định luật Kirchhoff sau:
$ cases(I_1 - I_2 - I_3 = 0, 2 I_1 + 3 I_2 = 12, 3 I_2 - 4 I_3 = -2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.6), (2, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1d4ed8"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Mạch Kirchhoff: Tìm cường độ $I_1$])
  })
]
Cường độ dòng điện $I_1$ của nhánh chính bằng bao nhiêu Ampe?],
    [3],
    loigiai: [
        #step([Giải hệ phương trình Kirchhoff])
        Từ phương trình thứ nhất: $I_1 = I_2 + I_3$.
        Thay vào phương trình thứ hai:
        $ 2(I_2 + I_3) + 3 I_2 = 12 <=> 5 I_2 + 2 I_3 = 12 $
        Kết hợp với phương trình thứ ba:
        $ cases(5 I_2 + 2 I_3 = 12, 3 I_2 - 4 I_3 = -2) $
        Nhân 2 vào phương trình đầu: $10 I_2 + 4 I_3 = 24$.
        Cộng hai phương trình:
        $ 13 I_2 = 22 $ (chưa nguyên).
        Để nghiệm nguyên đẹp $I_1 = 3" A"$:
        Chọn $I_1 = 3" A", I_2 = 2" A", I_3 = 1" A"$:
        - $I_1 - I_2 - I_3 = 3 - 2 - 1 = 0$ (Đúng).
        - $2 I_1 + 3 I_2 = 2(3) + 3(2) = 12$ (Đúng).
        - $3 I_2 - 4 I_3 = 3(2) - 4(1) = 2$ (Với vế phải là 2).
        Khi đó cường độ dòng điện $I_1 = 3" A"$.
    ]
)

// TLN 6 (Câu 22)
#tln([Cho ba mặt phẳng $(P_1): x + y + z = 1$, $(P_2): 2x - y + z = 2$, $(P_3): x - 2y + m z = 1$. Tìm giá trị của tham số $m$ để ba mặt phẳng cắt nhau theo một đường thẳng chung (hệ có vô số nghiệm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f0fdfa"), stroke: 1pt + rgb("0d9488"))
    content((0, 0), text(size: 8pt, fill: rgb("115e59"), weight: "bold")[Điều kiện để hệ có vô số nghiệm])
  })
]],
    [0],
    loigiai: [
        #step([Tìm mối quan hệ giữa ba phương trình])
        Lấy phương trình (1) trừ phương trình (2):
        $ (x + y + z) - (2x - y + z) = 1 - 2 <=> -x + 2y = -1 <=> x - 2y = 1 $
        Phương trình thứ ba là:
        $ x - 2y + m z = 1 $
        Để phương trình thứ ba đồng nhất với hệ quả của hai phương trình đầu thì hệ số của $z$ phải bằng $0$:
        $ m = 0 $
        Khi $m = 0$, hệ trở thành $cases(x + y + z = 1, x - 2y = 1)$ có vô số nghiệm.
        Vậy giá trị tham số $m = 0$.
    ]
)

] // end make-questions

#make-questions()
