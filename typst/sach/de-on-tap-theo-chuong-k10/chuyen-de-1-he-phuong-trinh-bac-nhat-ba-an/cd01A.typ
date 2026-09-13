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
  department: "TOÁN LỚP 10 - CHUYÊN ĐỀ HỌC TẬP",
  school: "CHUYÊN ĐỀ 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN",
  exam-title: "BÀI 1: HỆ PHƯƠNG TRÌNH BẬC NHẤT BA ẨN (ĐỀ A - CƠ BẢN ĐẾN VẬN DỤNG)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "301",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trong không gian với hệ tọa độ $O x y z$, phương trình tổng quát của một mặt phẳng có dạng $a x + b y + c z = d$ với $a^2 + b^2 + c^2 != 0$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Trục toạ độ 3D
    line((0, 0), (3, 0), stroke: 1pt + rgb("1e40af"), mark: (end: "stealth"))
    content((3.2, 0), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$y$])
    line((0, 0), (0, 2.5), stroke: 1pt + rgb("1e40af"), mark: (end: "stealth"))
    content((0, 2.7), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$z$])
    line((0, 0), (-1.8, -1.2), stroke: 1pt + rgb("1e40af"), mark: (end: "stealth"))
    content((-2.0, -1.3), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$x$])
    content((-0.25, -0.25), text(size: 8pt)[$O$])
    // Mặt phẳng minh hoạ
    line((-0.9, -0.6), (2.0, 0), stroke: 1.2pt + rgb("dc2626"))
    line((2.0, 0), (0, 1.8), stroke: 1.2pt + rgb("dc2626"))
    line((0, 1.8), (-0.9, -0.6), stroke: 1.2pt + rgb("dc2626"))
    content((0.7, 0.8), text(size: 8pt, fill: rgb("dc2626"), weight: "bold")[(P)])
  })
]
Phương trình nào sau đây là phương trình bậc nhất ba ẩn?],
    (
        True([$2x - 3y + 5z = 7$]),
        [$x^2 + y + z = 4$],
        [$x y - 2z = 1$],
        [$2/x + 3y - z = 5$]
    ),
    loigiai: [
        #step([Định nghĩa])
        Phương trình bậc nhất ba ẩn $x, y, z$ là phương trình có dạng tổng quát:
        $ a x + b y + c z = d $
        trong đó $a, b, c, d$ là các hệ số và các biến $x, y, z$ đều có bậc bằng $1$, không chứa tích hay căn bậc hai, phân thức chứa biến.
        - Phương trình $2x - 3y + 5z = 7$ đúng dạng bậc nhất ba ẩn với $a=2, b=-3, c=5, d=7$.
    ]
)

// TN 2
#tn([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 6, 2x - y + z = 3, x + 2y - z = 2) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Minh hoạ giao điểm của 3 mặt phẳng tại điểm duy nhất M0
    circle((0, 0), radius: 1.5, stroke: (dash: "dashed", paint: rgb("94a3b8")))
    line((-2, -0.5), (2, 0.5), stroke: 1.2pt + rgb("1e40af"))
    content((2.3, 0.6), text(size: 7.5pt, fill: rgb("1e40af"))[$(P_1)$])
    line((-1.5, 1.5), (1.5, -1.5), stroke: 1.2pt + rgb("0d9488"))
    content((1.8, -1.6), text(size: 7.5pt, fill: rgb("0d9488"))[$(P_2)$])
    line((-1.8, -1.2), (1.8, 1.2), stroke: 1.2pt + rgb("d97706"))
    content((2.1, 1.3), text(size: 7.5pt, fill: rgb("d97706"))[$(P_3)$])
    circle((0, 0), radius: 3pt, fill: rgb("dc2626"))
    content((0.4, -0.3), text(size: 8pt, weight: "bold", fill: rgb("dc2626"))[$M_0(1; 2; 3)$])
  })
]
Bộ ba số $(x_0; y_0; z_0)$ nào sau đây là nghiệm của hệ phương trình đã cho?],
    (
        True([$(1; 2; 3)$]),
        [$(2; 1; 3)$],
        [$(3; 2; 1)$],
        [$(1; 3; 2)$]
    ),
    loigiai: [
        #step([Thử trực tiếp hoặc giải hệ])
        Thay bộ ba số $(x; y; z) = (1; 2; 3)$ vào từng phương trình của hệ:
        - Phương trình 1: $1 + 2 + 3 = 6$ (Thỏa mãn).
        - Phương trình 2: $2(1) - 2 + 3 = 3$ (Thỏa mãn).
        - Phương trình 3: $1 + 2(2) - 3 = 2$ (Thỏa mãn).
        Vậy $(1; 2; 3)$ là nghiệm của hệ phương trình.
    ]
)

// TN 3
#tn([Cho hệ phương trình ba ẩn có dạng tam giác (đã khử Gauss):
$ cases(2x - y + 3z = 8, 3y - z = 4, 2z = 4) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.8), (2, 0.8), fill: rgb("f1f5f9"), stroke: 1pt + rgb("64748b"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[Thuật toán thế lùi:])
    content((0, -0.2), text(size: 8pt)[$z = 2 -> y = 2 -> x = 2$])
  })
]
Tổng các giá trị $x + y + z$ của nghiệm hệ phương trình là],
    (
        True([$6$]),
        [$5$],
        [$7$],
        [$8$]
    ),
    loigiai: [
        #step([Thực hiện phép thế ngược từ dưới lên])
        - Từ phương trình (3): $2z = 4 <=> z = 2$.
        - Thay $z = 2$ vào phương trình (2): $3y - 2 = 4 <=> 3y = 6 <=> y = 2$.
        - Thay $y = 2, z = 2$ vào phương trình (1):
        $ 2x - 2 + 3(2) = 8 <=> 2x + 4 = 8 <=> 2x = 4 <=> x = 2 $
        Tổng các giá trị $x + y + z = 2 + 2 + 2 = 6$.
    ]
)

// TN 4
#tn([Ma trận hệ số mở rộng $(A|B)$ của hệ phương trình bậc nhất ba ẩn
$ cases(x - 2y + 3z = 4, 3x + y - z = 2, -2x + 4y + z = 5) $
được viết dưới dạng nào sau đây?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("eff6ff"), stroke: 1pt + rgb("1e40af"))
    content((0, 0), text(size: 8pt, fill: rgb("1e40af"), weight: "bold")[Ma trận mở rộng cấp 3 hàng 4 cột: $[A | B]$])
  })
]],
    (
        True([$mat(1, -2, 3, 4; 3, 1, -1, 2; -2, 4, 1, 5)$]),
        [$mat(1, -2, 3; 3, 1, -1; -2, 4, 1)$],
        [$mat(4, 1, -2, 3; 2, 3, 1, -1; 5, -2, 4, 1)$],
        [$mat(1, 3, -2, 4; -2, 1, 4, 2; 3, -1, 1, 5)$]
    ),
    loigiai: [
        #step([Xác định các hệ số])
        Ma trận hệ số mở rộng gồm các hệ số của $x, y, z$ ở 3 cột đầu và cột hệ số tự do ở cột thứ tư:
        Hàng 1: $1, -2, 3, 4$; Hàng 2: $3, 1, -1, 2$; Hàng 3: $-2, 4, 1, 5$.
        Vậy $(A|B) = mat(1, -2, 3, 4; 3, 1, -1, 2; -2, 4, 1, 5)$.
    ]
)

// TN 5
#tn([Trong không gian $O x y z$, mỗi phương trình bậc nhất ba ẩn biểu diễn một mặt phẳng. Nếu hệ ba phương trình bậc nhất ba ẩn có *nghiệm duy nhất*, thì vị trí tương đối của ba mặt phẳng biểu diễn ba phương trình đó là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Khối đa diện giao nhau minh hoạ 3 mặt phẳng cắt nhau tại 1 điểm
    line((-1.5, 0), (1.5, 0), stroke: 1pt + rgb("3b82f6"))
    line((0, -1.2), (0, 1.2), stroke: 1pt + rgb("ef4444"))
    line((-1, -0.8), (1, 0.8), stroke: 1pt + rgb("10b981"))
    circle((0, 0), radius: 3pt, fill: rgb("1e293b"))
    content((0.6, -0.3), text(size: 7.5pt, weight: "bold")[Điểm chung duy nhất])
  })
]],
    (
        True([Ba mặt phẳng cắt nhau tại một điểm duy nhất]),
        [Ba mặt phẳng đôi một song song với nhau],
        [Ba mặt phẳng cùng đi qua một đường thẳng chung],
        [Ba mặt phẳng hoàn toàn trùng nhau]
    ),
    loigiai: [
        #step([Ý nghĩa hình học])
        Nghiệm $(x_0; y_0; z_0)$ của hệ là điểm chung của cả ba mặt phẳng. Do đó hệ có nghiệm duy nhất tương đương với ba mặt phẳng cắt nhau tại đúng một điểm duy nhất trong không gian.
    ]
)

// TN 6
#tn([Đồ thị hàm số bậc hai $y = a x^2 + b x + c$ đi qua ba điểm phân biệt $A(0; -1)$, $B(1; 2)$ và $C(2; 7)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Hệ trục toạ độ Oxy
    line((-1, 0), (3, 0), stroke: 0.8pt, mark: (end: "stealth"))
    content((3.2, 0), text(size: 7.5pt)[$x$])
    line((0, -1.5), (0, 3.5), stroke: 0.8pt, mark: (end: "stealth"))
    content((0, 3.7), text(size: 7.5pt)[$y$])
    // Vẽ parabol y = x^2 + 2x - 1 (tỉ lệ thu nhỏ y * 0.35)
    let pts = ()
    for i in range(-5, 15) {
      let t = i * 0.2
      let y_val = (t * t + 2 * t - 1) * 0.35
      pts.push((t, y_val))
    }
    line(..pts, stroke: 1.2pt + rgb("1e40af"))
    circle((0, -0.35), radius: 2pt, fill: rgb("dc2626"))
    content((-0.3, -0.35), text(size: 7.5pt)[$A$])
    circle((1, 0.7), radius: 2pt, fill: rgb("dc2626"))
    content((0.8, 1.0), text(size: 7.5pt)[$B$])
    circle((2, 2.45), radius: 2pt, fill: rgb("dc2626"))
    content((1.8, 2.7), text(size: 7.5pt)[$C$])
  })
]
Hệ ba phương trình bậc nhất ba ẩn xác định các hệ số $a, b, c$ là],
    (
        True([$cases(c = -1, a + b + c = 2, 4a + 2b + c = 7)$]),
        [$cases(c = -1, a + b + c = 1, 2a + b + c = 7)$],
        [$cases(c = 0, a + b = 2, 4a + 2b = 7)$],
        [$cases(a = -1, b = 2, c = 7)$]
    ),
    loigiai: [
        #step([Thay tọa độ các điểm vào phương trình parabol])
        - Điểm $A(0; -1) => a(0)^2 + b(0) + c = -1 <=> c = -1$.
        - Điểm $B(1; 2) => a(1)^2 + b(1) + c = 2 <=> a + b + c = 2$.
        - Điểm $C(2; 7) => a(2)^2 + b(2) + c = 7 <=> 4a + 2b + c = 7$.
        Giải hệ ta tìm được $c = -1$, $a = 1, b = 2$. Parabol là $y = x^2 + 2x - 1$.
    ]
)

// TN 7
#tn([Một cửa hàng văn phòng phẩm bán ba loại vở: Vở $96$ trang (giá $x$ nghìn đồng), vở $120$ trang (giá $y$ nghìn đồng) và vở $200$ trang (giá $z$ nghìn đồng).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (-1.0, 0.6), fill: rgb("e0f2fe"), stroke: 1pt + rgb("0284c7"))
    content((-1.75, 0), text(size: 7.5pt, weight: "bold")[Vở 96 tr\ ($x$)])
    rect((-0.7, -0.6), (0.8, 0.6), fill: rgb("ccfbf1"), stroke: 1pt + rgb("0d9488"))
    content((0.05, 0), text(size: 7.5pt, weight: "bold")[Vở 120 tr\ ($y$)])
    rect((1.1, -0.6), (2.6, 0.6), fill: rgb("fef3c7"), stroke: 1pt + rgb("d97706"))
    content((1.85, 0), text(size: 7.5pt, weight: "bold")[Vở 200 tr\ ($z$)])
  })
]
Biết rằng:
- Bạn An mua $3$ quyển loại $96$ tr, $2$ quyển loại $120$ tr và $1$ quyển loại $200$ tr hết $65$ nghìn đồng.
- Bạn Bình mua $2$ quyển loại $96$ tr, $4$ quyển loại $120$ tr và $2$ quyển loại $200$ tr hết $98$ nghìn đồng.
- Bạn Cúc mua $1$ quyển loại $96$ tr, $1$ quyển loại $120$ tr và $3$ quyển loại $200$ tr hết $77$ nghìn đồng.
Giá tiền một quyển vở loại $96$ trang là],
    (
        True([$9$ nghìn đồng]),
        [$10$ nghìn đồng],
        [$8$ nghìn đồng],
        [$11$ nghìn đồng]
    ),
    loigiai: [
        #step([Thiết lập hệ phương trình])
        Từ giả thiết ta có hệ ba phương trình bậc nhất ba ẩn:
        $ cases(3x + 2y + z = 65, 2x + 4y + 2z = 98, x + y + 3z = 77) $
        Rút gọn phương trình (2) thành $x + 2y + z = 49$.
        Giải hệ bằng phương pháp cộng trừ hoặc máy tính cầm tay:
        Ta có $x = 9, y = 14, z = 18$.
        Vậy giá tiền 1 quyển vở loại 96 trang là $9$ nghìn đồng ($9000$ đồng).
    ]
)

// TN 8
#tn([Cho hệ phương trình bậc nhất ba ẩn sau:
$ cases(x + y + z = 4, 2x - y + z = 4, x + 2y - z = 3) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f3e8ff"), stroke: 1pt + rgb("7c3aed"))
    content((0, 0), text(size: 8pt, fill: rgb("6b21a8"), weight: "bold")[Biểu thức: $T = 2x_0 - y_0 + z_0$])
  })
]
Nghiệm $(x_0; y_0; z_0)$ của hệ thỏa mãn giá trị biểu thức $T = 2x_0 - y_0 + z_0$ bằng],
    (
        True([$4$]),
        [$5$],
        [$3$],
        [$6$]
    ),
    loigiai: [
        #step([Giải hệ phương trình])
        - Lấy PT (1) cộng PT (3): $(x + y + z) + (x + 2y - z) = 4 + 3 <=> 2x + 3y = 7$.
        - Lấy PT (2) cộng PT (3): $(2x - y + z) + (x + 2y - z) = 4 + 3 <=> 3x + y = 7 <=> y = 7 - 3x$.
        Thay vào: $2x + 3(7 - 3x) = 7 <=> 2x + 21 - 9x = 7 <=> -7x = -14 <=> x = 2$.
        Suy ra $y = 7 - 3(2) = 1$.
        Thay $x = 2, y = 1$ vào PT (1): $2 + 1 + z = 4 <=> z = 1$.
        Nghiệm duy nhất là $(x_0; y_0; z_0) = (2; 1; 1)$.
        Giá trị $T = 2(2) - 1 + 1 = 4$.
    ]
)

// TN 9
#tn([Bộ ba số nào sau đây *không* thể là nghiệm của phương trình bậc nhất ba ẩn $2x - 3y + z = 5$?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.5, 0), stroke: 1pt + rgb("94a3b8"))
    content((-2.7, 0), text(size: 7.5pt)[Mặt phẳng $(alpha)$])
    circle((-1, 0), radius: 2.5pt, fill: rgb("1e40af"))
    content((-1, 0.35), text(size: 7.5pt)[$M_1 in (alpha)$])
    circle((1, 0), radius: 2.5pt, fill: rgb("1e40af"))
    content((1, 0.35), text(size: 7.5pt)[$M_2 in (alpha)$])
    circle((0, 0.8), radius: 2.5pt, fill: rgb("dc2626"))
    content((0, 1.15), text(size: 7.5pt, fill: rgb("dc2626"))[$N in.not (alpha)$])
  })
]],
    (
        True([$(1; 1; 5)$]),
        [$(2; 0; 1)$],
        [$(0; -1; 2)$],
        [$(3; 1; 2)$]
    ),
    loigiai: [
        #step([Thử giá trị vào vế trái])
        - Với $(1; 1; 5)$: $2(1) - 3(1) + 5 = 2 - 3 + 5 = 4 != 5$. Do đó $(1; 1; 5)$ không là nghiệm.
        - Với $(2; 0; 1)$: $2(2) - 3(0) + 1 = 5$ (nghiệm).
        - Với $(0; -1; 2)$: $2(0) - 3(-1) + 2 = 5$ (nghiệm).
        - Với $(3; 1; 2)$: $2(3) - 3(1) + 2 = 5$ (nghiệm).
    ]
)

// TN 10
#tn([Tìm giá trị của tham số $m$ để bộ ba số $(1; -2; 3)$ là nghiệm của phương trình bậc nhất ba ẩn $m x + 2y - z = -1$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("059669"))
    content((0, 0), text(size: 8pt, fill: rgb("065f46"), weight: "bold")[Thế điểm $M(1; -2; 3)$ tìm tham số $m$])
  })
]],
    (
        True([$m = 6$]),
        [$m = 4$],
        [$m = -6$],
        [$m = 2$]
    ),
    loigiai: [
        #step([Thay nghiệm vào phương trình])
        Thay $x = 1, y = -2, z = 3$ vào phương trình đã cho:
        $ m(1) + 2(-2) - 3 = -1 <=> m - 4 - 3 = -1 <=> m - 7 = -1 <=> m = 6 $
    ]
)

// TN 11
#tn([Một xưởng cơ khí gia công 3 chi tiết máy loại A, B, C bằng 3 máy cắt I, II, III. Thời gian cần thiết (tính bằng giờ) của mỗi máy để gia công 1 chi tiết được cho bởi bảng sau:
#align(center)[
#table(
  columns: (2.5cm, 2cm, 2cm, 2cm),
  align: center,
  stroke: 0.5pt + rgb("94a3b8"),
  fill: (col, row) => if row == 0 { rgb("e2e8f0") } else { none },
  [*Chi tiết*], [*Máy I*], [*Máy II*], [*Máy III*],
  [Loại A ($x$)], [1], [2], [1],
  [Loại B ($y$)], [2], [1], [3],
  [Loại C ($z$)], [3], [2], [1],
)
]
Biết trong một tuần máy I hoạt động tối đa $31$ giờ, máy II hoạt động $32$ giờ, máy III hoạt động $29$ giờ. Phương trình biểu diễn tổng thời gian hoạt động của *Máy II* theo số lượng chi tiết $x, y, z$ sản xuất được là],
    (
        True([$2x + y + 2z = 32$]),
        [$x + 2y + 3z = 31$],
        [$x + 3y + z = 29$],
        [$2x + 2y + z = 32$]
    ),
    loigiai: [
        #step([Đọc thông tin cột Máy II])
        Mỗi chi tiết loại A cần 2 giờ trên máy II, loại B cần 1 giờ trên máy II, loại C cần 2 giờ trên máy II.
        Do đó tổng thời gian máy II hoạt động là:
        $ 2x + 1y + 2z = 32 <=> 2x + y + 2z = 32 $
    ]
)

// TN 12
#tn([Hệ ba phương trình bậc nhất ba ẩn $cases(x + y + z = 0, 2x - y + z = 0, 3x + 2y - z = 0)$ được gọi là hệ phương trình thuần nhất.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((0, 0), radius: 3pt, fill: rgb("1e40af"))
    content((0, 0.4), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[$O(0; 0; 0)$])
    content((0, -0.4), text(size: 7.5pt)[Nghiệm tầm thường luôn tồn tại])
  })
]
Khẳng định nào sau đây là *luôn đúng* đối với hệ phương trình thuần nhất?],
    (
        True([Hệ luôn có ít nhất một nghiệm là $(0; 0; 0)$ (nghiệm tầm thường)]),
        [Hệ luôn luôn vô nghiệm],
        [Hệ không thể có vô số nghiệm],
        [Hệ chỉ có nghiệm khi các hệ số đều bằng $0$]
    ),
    loigiai: [
        #step([Tính chất hệ thuần nhất])
        Khi thay $x = 0, y = 0, z = 0$ vào hệ phương trình thuần nhất, vế trái của mọi phương trình đều bằng $0$, bằng vế phải.
        Do đó bộ ba số $(0; 0; 0)$ luôn luôn là một nghiệm của hệ (gọi là nghiệm tầm thường). Hệ thuần nhất không bao giờ vô nghiệm.
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Câu 13)
#ds([Cho hệ phương trình bậc nhất ba ẩn:
$ (I): cases(x + 2y - z = 3, 2x - y + z = 4, 3x + y + 2z = 9) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.7), (2.5, 0.7), fill: rgb("f8fafc"), stroke: 1pt + rgb("475569"))
    content((0, 0.25), text(size: 8pt, weight: "bold", fill: rgb("1e40af"))[Khảo sát hệ phương trình $(I)$])
    content((0, -0.25), text(size: 7.5pt)[Kiểm tra tính chất nghiệm và nghiệm duy nhất])
  })
]],
  (
    True([Bộ ba số $(2; 1; 1)$ là một nghiệm của phương trình thứ nhất trong hệ.]),
    True([Ma trận mở rộng của hệ $(I)$ có kích thước $3 times 4$.]),
    True([Hệ $(I)$ có nghiệm duy nhất là $(x; y; z) = (2; 1; 1)$.]),
    [Giá trị tổng $x_0^2 + y_0^2 + z_0^2$ của nghiệm duy nhất bằng $9$.]
  ),
  loigiai: [
    #step([Xét ý a])
    Thay $(x; y; z) = (2; 1; 1)$ vào phương trình thứ nhất: $2 + 2(1) - 1 = 3$ (Đúng). Mệnh đề a ĐÚNG.
    #step([Xét ý b])
    Hệ gồm 3 phương trình và 3 ẩn số cùng cột hệ số tự do nên ma trận bổ sung gồm 3 hàng và 4 cột, kích thước $3 times 4$. Mệnh đề b ĐÚNG.
    #step([Xét ý c])
    Kiểm tra $(2; 1; 1)$ với hai phương trình còn lại:
    - PT 2: $2(2) - 1 + 1 = 4$ (Đúng).
    - PT 3: $3(2) + 1 + 2(1) = 9$ (Đúng).
    Do đó $(2; 1; 1)$ là nghiệm duy nhất của hệ. Mệnh đề c ĐÚNG.
    #step([Xét ý d])
    Tổng bình phương các thành phần nghiệm là:
    $ x_0^2 + y_0^2 + z_0^2 = 2^2 + 1^2 + 1^2 = 4 + 1 + 1 = 6 != 9 $
    Do đó mệnh đề d SAI.
  ]
)

// DS 2 (Câu 14)
#ds([Một công ty công nghệ có 3 nhóm kỹ sư: Nhóm AI ($x$ người), nhóm Backend ($y$ người) và nhóm Frontend ($z$ người).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    circle((-1.8, 0), radius: 0.7, fill: rgb("dbeafe"), stroke: 1.2pt + rgb("1e40af"))
    content((-1.8, 0), text(size: 7.5pt, weight: "bold")[AI ($x$)])
    circle((0, 0), radius: 0.7, fill: rgb("ccfbf1"), stroke: 1.2pt + rgb("0d9488"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Backend ($y$)])
    circle((1.8, 0), radius: 0.7, fill: rgb("fef3c7"), stroke: 1.2pt + rgb("d97706"))
    content((1.8, 0), text(size: 7.5pt, weight: "bold")[Frontend ($z$)])
  })
]
Biết rằng:
- Tổng số kỹ sư của cả 3 nhóm là $30$ người.
- Mỗi kỹ sư AI cần trang bị thiết bị $50$ triệu đồng, kỹ sư Backend cần $30$ triệu đồng, kỹ sư Frontend cần $20$ triệu đồng; tổng ngân sách mua thiết bị là $950$ triệu đồng.
- Số lượng kỹ sư Backend và Frontend cộng lại gấp đôi số lượng kỹ sư AI.],
  (
    True([Hệ phương trình mô tả bài toán gồm phương trình tổng số người là $x + y + z = 30$.]),
    True([Phương trình ngân sách thiết bị rút gọn là $5x + 3y + 2z = 95$.]),
    True([Số lượng kỹ sư nhóm AI là $10$ người.]),
    [Số lượng kỹ sư nhóm Frontend nhiều hơn nhóm Backend là $5$ người.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình])
    - Tổng số người: $x + y + z = 30$ (1).
    - Ngân sách: $50x + 30y + 20z = 950 <=> 5x + 3y + 2z = 95$ (2).
    - Mối quan hệ số lượng: $y + z = 2x <=> 2x - y - z = 0$ (3).
    #step([Giải hệ phương trình])
    - Thay $y + z = 2x$ vào (1): $x + 2x = 30 <=> 3x = 30 <=> x = 10$ (nhóm AI có 10 người).
    - Từ đó $y + z = 20$.
    - Thay $x = 10$ vào (2): $5(10) + 3y + 2z = 95 <=> 3y + 2z = 45$.
    - Ta có hệ hai ẩn: $cases(y + z = 20, 3y + 2z = 45) <=> cases(2y + 2z = 40, 3y + 2z = 45) => y = 5, z = 15$.
    - Như vậy: Backend có 5 người, Frontend có 15 người.
    - Frontend nhiều hơn Backend: $15 - 5 = 10$ người (không phải 5 người).
    Vậy a ĐÚNG, b ĐÚNG, c ĐÚNG, d SAI.
  ]
)

// DS 3 (Câu 15)
#ds([Trong không gian $O x y z$, cho ba mặt phẳng có phương trình lần lượt là:
$(alpha): x + y + z = 6$; $(beta): 2x - y + z = 3$; $(gamma): x + 2y - z = 2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2, -0.5), (2, 0.5), stroke: 1.2pt + rgb("1e40af"))
    line((-1.5, 1.2), (1.5, -1.2), stroke: 1.2pt + rgb("0d9488"))
    line((-1.5, -1.0), (1.5, 1.0), stroke: 1.2pt + rgb("d97706"))
    circle((0, 0), radius: 2.5pt, fill: rgb("dc2626"))
    content((0.5, -0.3), text(size: 7.5pt, weight: "bold", fill: rgb("dc2626"))[$M(1; 2; 3)$])
  })
]],
  (
    True([Gốc tọa độ $O(0; 0; 0)$ không thuộc bất kỳ mặt phẳng nào trong ba mặt phẳng trên.]),
    True([Tọa độ giao điểm chung duy nhất của ba mặt phẳng là $M(1; 2; 3)$.]),
    True([Khoảng cách từ gốc tọa độ $O$ đến giao điểm $M$ bằng $sqrt(14)$.]),
    [Mặt phẳng $(alpha)$ song song với mặt phẳng $(beta)$.]
  ),
  loigiai: [
    #step([Xét ý a])
    Thay $O(0; 0; 0)$ vào:
    $(alpha): 0 + 0 + 0 = 0 != 6$; $(beta): 0 != 3$; $(gamma): 0 != 2$. Do đó $O$ không thuộc mặt phẳng nào. Ý a ĐÚNG.
    #step([Xét ý b])
    Giải hệ 3 phương trình:
    $ cases(x + y + z = 6, 2x - y + z = 3, x + 2y - z = 2) $
    Được nghiệm duy nhất $x = 1, y = 2, z = 3$. Giao điểm là $M(1; 2; 3)$. Ý b ĐÚNG.
    #step([Xét ý c])
    Khoảng cách $O M = sqrt(1^2 + 2^2 + 3^2) = sqrt(1 + 4 + 9) = sqrt(14)$. Ý c ĐÚNG.
    #step([Xét ý d])
    Vectơ pháp tuyến của $(alpha)$ là $vec(n_1) = (1; 1; 1)$, của $(beta)$ là $vec(n_2) = (2; -1; 1)$. Hai vectơ này không cùng phương nên $(alpha)$ không song song với $(beta)$ (chúng cắt nhau). Ý d SAI.
  ]
)

// DS 4 (Câu 16)
#ds([Cho hệ phương trình bậc nhất ba ẩn chứa tham số $m$:
$ (S): cases(x + y + z = 3, x + 2y + 3z = 6, 2x + 3y + m z = 9) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.6), (2.5, 0.6), fill: rgb("fef2f2"), stroke: 1pt + rgb("ef4444"))
    content((0, 0), text(size: 8pt, fill: rgb("991b1b"), weight: "bold")[Biện luận số nghiệm theo tham số m])
  })
]],
  (
    True([Khi lấy phương trình (1) cộng phương trình (2) ta được $2x + 3y + 4z = 9$.]),
    True([Khi $m = 4$, hệ phương trình $(S)$ có vô số nghiệm.]),
    True([Khi $m != 4$, hệ phương trình $(S)$ luôn có nghiệm duy nhất.]),
    [Khi $m = 4$, hệ phương trình $(S)$ hoàn toàn vô nghiệm.]
  ),
  loigiai: [
    #step([Xét ý a])
    Lấy PT (1) cộng PT (2): $(x + y + z) + (x + 2y + 3z) = 3 + 6 <=> 2x + 3y + 4z = 9$. Mệnh đề a ĐÚNG.
    #step([Xét ý b và c])
    So sánh kết quả trên với PT (3): $2x + 3y + m z = 9$.
    Trừ hai phương trình cho nhau:
    $ (m - 4)z = 0 $
    - Nếu $m = 4$: Phương trình trở thành $0z = 0$ (luôn đúng với mọi $z$).
      Khi đó hệ tương đương với hệ 2 phương trình độc lập 3 ẩn: $cases(x + y + z = 3, x + 2y + 3z = 6)$, có vô số nghiệm phụ thuộc $z$. Do đó với $m = 4$, hệ có vô số nghiệm. Mệnh đề b ĐÚNG.
    - Nếu $m != 4$: Ta suy ra $z = 0$.
      Thay $z = 0$ vào hệ: $cases(x + y = 3, x + 2y = 6) => y = 3, x = 0$.
      Hệ có nghiệm duy nhất $(0; 3; 0)$. Mệnh đề c ĐÚNG.
    #step([Xét ý d])
    Vì với $m = 4$ hệ có vô số nghiệm nên khẳng định "hệ phương trình vô nghiệm" là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17)
#tln([Cho hệ phương trình bậc nhất ba ẩn dạng bậc thang:
$ cases(x - 2y + z = 1, y + 3z = 7, 4z = 8) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("eff6ff"), stroke: 1pt + rgb("2563eb"))
    content((0, 0), text(size: 8pt, fill: rgb("1d4ed8"), weight: "bold")[Tìm giá trị nghiệm $x$])
  })
]
Giá trị của ẩn $x$ trong nghiệm của hệ phương trình bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Giải từ dưới lên])
        - Từ phương trình thứ ba: $4z = 8 <=> z = 2$.
        - Thay $z = 2$ vào phương trình thứ hai: $y + 3(2) = 7 <=> y = 7 - 6 = 1$.
        - Thay $y = 1, z = 2$ vào phương trình thứ nhất:
        $ x - 2(1) + 2 = 1 <=> x = 1 $
        Vậy giá trị của $x$ bằng $1$.
    ]
)

// TLN 2 (Câu 18)
#tln([Đa thức bậc hai $P(x) = a x^2 + b x + c$ thỏa mãn các điều kiện: đồ thị đi qua gốc tọa độ $O(0; 0)$, đạt giá trị bằng $3$ khi $x = 1$ và đạt giá trị bằng $8$ khi $x = 2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-1, 0), (3, 0), stroke: 0.8pt, mark: (end: "stealth"))
    line((0, -0.5), (0, 3), stroke: 0.8pt, mark: (end: "stealth"))
    circle((0, 0), radius: 2pt, fill: rgb("dc2626"))
    circle((1, 0.9), radius: 2pt, fill: rgb("dc2626"))
    circle((2, 2.4), radius: 2pt, fill: rgb("dc2626"))
  })
]
Giá trị của hệ số $a$ bằng bao nhiêu?],
    [1],
    loigiai: [
        #step([Thiết lập hệ ba phương trình])
        - $P(0) = 0 <=> c = 0$.
        - $P(1) = 3 <=> a(1)^2 + b(1) + c = 3 <=> a + b = 3$.
        - $P(2) = 8 <=> a(2)^2 + b(2) + c = 8 <=> 4a + 2b = 8 <=> 2a + b = 4$.
        #step([Giải hệ])
        Trừ hai phương trình: $(2a + b) - (a + b) = 4 - 3 => a = 1$.
        Suy ra $b = 2, c = 0$.
        Vậy $a = 1$.
    ]
)

// TLN 3 (Câu 19)
#tln([Ba lớp 10A, 10B, 10C của một trường THPT tham gia phong trào quyên góp sách cho thư viện.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2.5, -0.5), (-0.9, 0.5), fill: rgb("e0e7ff"), stroke: 1pt + rgb("4338ca"))
    content((-1.7, 0), text(size: 7.5pt, weight: "bold")[Lớp 10A ($x$)])
    rect((-0.8, -0.5), (0.8, 0.5), fill: rgb("fce7f3"), stroke: 1pt + rgb("be185d"))
    content((0, 0), text(size: 7.5pt, weight: "bold")[Lớp 10B ($y$)])
    rect((0.9, -0.5), (2.5, 0.5), fill: rgb("ecfdf5"), stroke: 1pt + rgb("047857"))
    content((1.7, 0), text(size: 7.5pt, weight: "bold")[Lớp 10C ($z$)])
  })
]
Biết rằng:
- Cả ba lớp quyên góp được tổng cộng $210$ quyển sách.
- Số sách lớp 10A và 10B quyên góp được nhiều hơn lớp 10C là $30$ quyển.
- Số sách lớp 10A quyên góp được bằng $3/4$ số sách lớp 10B.
Hỏi lớp 10C quyên góp được bao nhiêu quyển sách?],
    [90],
    loigiai: [
        #step([Lập hệ phương trình])
        Gọi $x, y, z$ lần lượt là số sách lớp 10A, 10B, 10C quyên góp ($x, y, z in NN^*$).
        - Tổng số sách: $x + y + z = 210$ (1).
        - Hiệu giữa (10A + 10B) và 10C: $(x + y) - z = 30 <=> x + y - z = 30$ (2).
        - Tỉ số giữa 10A và 10B: $x = 3/4 y <=> 4x - 3y = 0$ (3).
        #step([Tính số sách lớp 10C])
        Lấy (1) trừ (2):
        $ (x + y + z) - (x + y - z) = 210 - 30 <=> 2z = 180 <=> z = 90 $
        Vậy lớp 10C quyên góp được $90$ quyển sách.
    ]
)

// TLN 4 (Câu 20)
#tln([Cho hệ phương trình bậc nhất ba ẩn:
$ cases(x + y + z = 9, 2x - y + z = 4, x - 2y + 3z = 1) $
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("fff7ed"), stroke: 1pt + rgb("ea580c"))
    content((0, 0), text(size: 8pt, fill: rgb("c2410c"), weight: "bold")[Nghiệm duy nhất $(x_0; y_0; z_0)$])
  })
]
Nếu hệ có nghiệm duy nhất là $(x_0; y_0; z_0)$, hãy tính tích $P = x_0 y_0 z_0$.],
    [24],
    loigiai: [
        #step([Giải hệ phương trình])
        Lấy PT (1) trừ PT (2):
        $ (x + y + z) - (2x - y + z) = 9 - 4 <=> -x + 2y = 5 <=> x = 2y - 5 $
        Thay $x = 2y - 5$ vào PT (3):
        $ (2y - 5) - 2y + 3z = 1 <=> 3z = 6 <=> z = 2 $
        Thay $z = 2$ vào PT (1):
        $ x + y + 2 = 9 <=> x + y = 7 $
        Thay $x = 2y - 5$ vào:
        $ 2y - 5 + y = 7 <=> 3y = 12 <=> y = 4 $
        Suy ra $x = 2(4) - 5 = 3$.
        Vậy nghiệm duy nhất là $(x_0; y_0; z_0) = (3; 4; 2)$.
        Tích $P = x_0 y_0 z_0 = 3 times 4 times 2 = 24$.
    ]
)

// TLN 5 (Câu 21)
#tln([Một nhà đầu tư phân bổ tổng cộng $400$ triệu đồng vào ba kênh: Trái phiếu chính phủ (lãi suất $6%$/năm), Tiền gửi tiết kiệm (lãi suất $7%$/năm) và Quỹ mở cổ phiếu (lãi suất kỳ vọng $12%$/năm).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    // Biểu đồ thanh 3 danh mục
    rect((-2.2, -0.6), (-0.8, 0.6), fill: rgb("dbeafe"), stroke: 1pt + rgb("1e40af"))
    content((-1.5, 0), text(size: 7pt, weight: "bold")[Trái phiếu\ 6%])
    rect((-0.6, -0.6), (0.7, 0.6), fill: rgb("dcfce7"), stroke: 1pt + rgb("15803d"))
    content((0.05, 0), text(size: 7pt, weight: "bold")[Tiết kiệm\ 7%])
    rect((0.9, -0.6), (2.3, 0.6), fill: rgb("fee2e2"), stroke: 1pt + rgb("b91c1c"))
    content((1.6, 0), text(size: 7pt, weight: "bold")[Quỹ mở\ 12%])
  })
]
Biết rằng sau một năm, tổng tiền lãi thu được là $31$ triệu đồng và số tiền đầu tư vào Trái phiếu chính phủ gấp đôi số tiền gửi tiết kiệm. Hỏi số tiền người đó đã đầu tư vào Quỹ mở cổ phiếu là bao nhiêu triệu đồng?],
    [100],
    loigiai: [
        #step([Thiết lập hệ phương trình])
        Gọi số tiền đầu tư vào ba danh mục lần lượt là $x, y, z$ (đơn vị: triệu đồng; $x, y, z > 0$).
        - Tổng vốn đầu tư: $x + y + z = 400$ (1).
        - Tổng tiền lãi một năm:
        $ 0.06 x + 0.07 y + 0.12 z = 31 <=> 6x + 7y + 12z = 3100 $ (2).
        - Trái phiếu gấp đôi tiết kiệm: $x = 2y <=> x - 2y = 0$ (3).
        #step([Giải hệ phương trình])
        Từ (3) có $x = 2y$. Thay vào (1):
        $ 2y + y + z = 400 <=> 3y + z = 400 <=> z = 400 - 3y $
        Thay $x = 2y$ và $z = 400 - 3y$ vào (2):
        $ 6(2y) + 7y + 12(400 - 3y) = 3100 $
        $ <=> 12y + 7y + 4800 - 36y = 3100 $
        $ <=> -17y = -1700 <=> y = 100 $
        Suy ra:
        - $x = 2(100) = 200$ triệu đồng.
        - $z = 400 - 3(100) = 100$ triệu đồng.
        Vậy số tiền đầu tư vào Quỹ mở cổ phiếu là $100$ triệu đồng.
    ]
)

// TLN 6 (Câu 22)
#tln([Tìm giá trị của tham số $m$ để hệ phương trình bậc nhất ba ẩn
$ cases(x + y + z = 3, 2x - y + 3z = 4, x + 2y + m z = 5) $
nhận bộ ba số $(x; y; z) = (1; 1; 1)$ làm nghiệm.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((-2, -0.5), (2, 0.5), fill: rgb("f1f5f9"), stroke: 1pt + rgb("334155"))
    content((0, 0), text(size: 8pt, fill: rgb("0f172a"), weight: "bold")[Thay nghiệm tìm tham số m])
  })
]],
    [2],
    loigiai: [
        #step([Kiểm tra và thay nghiệm vào phương trình chứa m])
        - Thay $(1; 1; 1)$ vào phương trình 1: $1 + 1 + 1 = 3$ (thỏa mãn).
        - Thay $(1; 1; 1)$ vào phương trình 2: $2(1) - 1 + 3(1) = 4$ (thỏa mãn).
        - Để $(1; 1; 1)$ là nghiệm của hệ thì nó phải thỏa mãn phương trình 3:
        $ 1 + 2(1) + m(1) = 5 <=> 3 + m = 5 <=> m = 2 $
        Vậy giá trị của tham số $m$ bằng $2$.
    ]
)

] // end make-questions

#make-questions()
