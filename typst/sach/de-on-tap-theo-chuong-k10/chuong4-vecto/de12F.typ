#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

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
  school: "CHUYÊN ĐỀ TOÁN THỰC TẾ",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: MÔ HÌNH HÓA VECTƠ (ĐỀ F: VŨ TRỤ HỌC & NĂNG LƯỢNG - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "121",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một hệ thống pin mặt trời xoay hai trục có công suất đỉnh khi chiếu thẳng góc là $P_0 = 1200" W"$. Vào thời điểm góc giữa chùm tia sáng mặt trời và vectơ pháp tuyến của tấm pin là $theta = 30^circ$, công suất quang điện hấp thụ tức thời bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.5), (3.5, 1.2), fill: rgb("fff1f2"), stroke: 1.5pt + rgb("e11d48"))
    content((2.0, 0.85), [☀️ Pin mặt trời])
    line((2.0, 1.2), (2.0, 2.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.2, 2.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(n)$])
    line((3.2, 2.4), (2.0, 1.2), mark: (end: ">", fill: rgb("059669")), stroke: 1.8pt + rgb("059669"))
    content((3.4, 2.4), text(fill: rgb("059669"), size: 8.5pt)[Tia sáng])
    draw_angle_arc((2.0, 1.2), 60deg, 90deg, radius: 0.6, stroke: 1pt + rgb("e11d48"))
    content((2.3, 1.9), text(fill: rgb("e11d48"), size: 8pt)[$30^circ$])
  })
]],
    (
        True([$600 sqrt(3)" W" approx 1039.23" W"$]),
        [$600" W"$],
        [$1200" W"$],
        [$800" W"$]
    ),
    loigiai: [
        Công suất quang điện hấp thụ tỉ lệ với tích vô hướng của vectơ pháp tuyến đơn vị và vectơ tia sáng:
        $ P = P_0 cos theta = 1200 dot cos 30^circ = 1200 dot (sqrt(3)) / 2 = 600 sqrt(3)" W" approx 1039.23" W" $
    ]
)

// TN 2
#tn([Tại một trang trại điện gió ngoài khơi, luồng gió thổi theo phương ngang với vận tốc $vec(v)_g = (12; 0)" m/s"$. Cánh tuabin quay tròn trong mặt phẳng thẳng đứng làm cho đầu mút cánh quạt chuyển động với vận tốc tức thời $vec(v)_c = (0; -16)" m/s"$. Tốc độ của luồng gió tương đối tác dụng lên đầu mút cánh tuabin bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (2.4, 0), mark: (end: ">", fill: rgb("e11d48")), stroke: 2pt + rgb("e11d48"))
    content((2.5, -0.25), text(fill: rgb("e11d48"), size: 8.5pt)[$vec(v)_g$ ($12" m/s"$)])
    line(pO, (0, -2.4), mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((-0.4, -2.4), text(fill: rgb("059669"), size: 8.5pt)[$vec(v)_c$ ($16" m/s"$)])
    line(pO, (2.4, 2.4), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2.2pt + rgb("1d4ed8"))
    content((2.6, 2.5), text(fill: rgb("1d4ed8"), size: 8.5pt, weight: "bold")[$vec(v)_r$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🌀], anchor: "north-east")
  })
]],
    (
        True([$20" m/s"$]),
        [$28" m/s"$],
        [$16" m/s"$],
        [$14.4" m/s"$]
    ),
    loigiai: [
        Vận tốc tương đối của gió đối với đầu cánh tuabin:
        $ vec(v)_r = vec(v)_g - vec(v)_c = (12 - 0; 0 - (-16)) = (12; 16)" m/s" $
        Tốc độ tương đối:
        $ v_r = |vec(v)_r| = sqrt(12^2 + 16^2) = sqrt(144 + 256) = sqrt(400) = 20" m/s" $
    ]
)

// TN 3
#tn([Một vệ tinh viễn thông địa tĩnh duy trì vị trí đứng yên tương đối so với mặt đất nhờ hợp lực giữa lực hấp dẫn hướng tâm của Trái Đất $vec(F)_(h d)$ và lực quán tính li tâm $vec(F)_(l t)$ triệt tiêu lẫn nhau. Hệ thức vectơ nào sau đây là ĐÚNG?],
    (
        True([$vec(F)_(h d) + vec(F)_(l t) = vec(0)$]),
        [$vec(F)_(h d) = vec(F)_(l t)$],
        [$vec(F)_(h d) dot vec(F)_(l t) = 0$],
        [$vec(F)_(h d) - 2 vec(F)_(l t) = vec(0)$]
    ),
    loigiai: [
        Ở quỹ đạo địa tĩnh cân bằng, hai lực có cùng phương, ngược chiều và cùng độ lớn:
        $vec(F)_(h d) = - vec(F)_(l t) <=> vec(F)_(h d) + vec(F)_(l t) = vec(0)$.
    ]
)

// TN 4
#tn([Một tàu chở hàng viễn dương ứng dụng công nghệ buồm diều (Kite sail) để tiết kiệm nhiên liệu. Buồm diều tạo lực kéo $F = 20" kN"$ nghiêng hợp với hướng chuyển động của tàu một góc $alpha = 30^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    rect((0.5, 0.2), (2.5, 0.8), fill: rgb("fff1f2"), stroke: 1.5pt + rgb("e11d48"))
    content((1.5, 0.5), [🚢 Tàu hàng])
    circle((3.8, 2.5), radius: 3pt, fill: rgb("059669"))
    content((3.8, 2.85), [🪁 Buồm diều])
    line((2.5, 0.5), (3.8, 2.5), stroke: 1.8pt + rgb("dc2626"))
  })
]
Khi tàu đi được quãng đường $s = 1" km"$ ($1000" m"$), công có ích do buồm diều sinh ra bằng],
    (
        True([$10 sqrt(3)" MJ" approx 17.32" MJ"$]),
        [$20" MJ"$],
        [$10" MJ"$],
        [$15" MJ"$]
    ),
    loigiai: [
        Công có ích:
        $ A = F dot s dot cos 30^circ = 20000 dot 1000 dot (sqrt(3)) / 2 = 10000000 sqrt(3)" J" = 10 sqrt(3)" MJ" approx 17.32" MJ" $
    ]
)

// TN 5
#tn([Một trạm vũ trụ quốc tế cần thay đổi vận tốc bằng cách đốt động cơ phản lực tạo xung lực $vec(J) = (1500; 2000)" N" dot "s"$. Biết khối lượng của khoang vũ trụ là $m = 500" kg"$. Độ biến thiên vận tốc $Delta v$ của khoang vũ trụ bằng],
    (
        True([$5" m/s"$]),
        [$7" m/s"$],
        [$3.5" m/s"$],
        [$10" m/s"$]
    ),
    loigiai: [
        Theo định lý biến thiên động lượng:
        $ m Delta vec(v) = vec(J) => Delta vec(v) = (vec(J)) / m = (1500; 2000) / 500 = (3; 4)" m/s" $
        Độ lớn:
        $ Delta v = sqrt(3^2 + 4^2) = 5" m/s" $
    ]
)

// TN 6
#tn([Trong một dự án năng lượng xanh, một trạm biến áp gom điện $M$ được đặt trên bờ kênh thẳng $O x$. Hai trang trại điện mặt trời đặt tại các vị trí $A(2; 3)$ và $B(8; 5)$ (đơn vị: km). Tọa độ điểm $M(x; 0)$ trên trục hoành để tổng chiều dài đường dây truyền tải $M A + M B$ ngắn nhất là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (5.0, 0), stroke: 1.5pt + rgb("0284c7"))
    content((4.8, -0.3), text(fill: rgb("0284c7"), size: 8pt)[Bờ kênh $O x$])
    let pA = (1.0, 1.5)
    let pB = (4.0, 2.5)
    let pM = (2.125, 0)
    line(pA, pM, stroke: 1.2pt + rgb("e11d48"))
    line(pM, pB, stroke: 1.2pt + rgb("e11d48"))
    circle(pA, radius: 2pt, fill: black)
    content(pA, [☀️ $A$], anchor: "south")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [☀️ $B$], anchor: "south")
    circle(pM, radius: 2.5pt, fill: rgb("dc2626"))
    content(pM, [⚡ $M$], anchor: "north")
  })
]],
    (
        True([$M(4.25; 0)$]),
        [$M(5; 0)$],
        [$M(4; 0)$],
        [$M(4.5; 0)$]
    ),
    loigiai: [
        Đây là bài toán cực trị phản xạ Heron: Lấy điểm đối xứng của $A(2; 3)$ qua trục $O x$ là $A'(2; -3)$.
        Độ dài $M A + M B = M A' + M B >= A' B$. Dấu bằng xảy ra khi $M$ là giao điểm của đường thẳng $A' B$ với trục $O x$.
        Vectơ $vec(A' B) = (8 - 2; 5 - (-3)) = (6; 8)$.
        Phương trình tham số của $A' B$: $cases(x = 2 + 6t, y = -3 + 8t)$.
        Giao điểm với $O x$ ($y = 0$): $-3 + 8t = 0 <=> t = 3/8$.
        Suy ra $x = 2 + 6(3/8) = 2 + 18/8 = 2 + 2.25 = 4.25$.
        Vậy trạm biến áp đặt tại $M(4.25; 0)$.
    ]
)

// TN 7
#tn([Một tàu thăm dò đáy biển sâu di chuyển từ độ sâu $200" m"$ đến độ sâu $500" m"$ đồng thời trôi ngang một đoạn $400" m"$. Độ lớn vectơ dịch chuyển không gian của tàu thăm dò bằng],
    (
        True([$500" m"$]),
        [$700" m"$],
        [$600" m"$],
        [$450" m"$]
    ),
    loigiai: [
        Độ dịch chuyển theo phương thẳng đứng: $Delta y = 500 - 200 = 300" m"$.
        Độ dịch chuyển theo phương ngang: $Delta x = 400" m"$.
        Độ lớn vectơ dịch chuyển:
        $ d = sqrt((Delta x)^2 + (Delta y)^2) = sqrt(400^2 + 300^2) = 500" m" $
    ]
)

// TN 8
#tn([Hệ thống cánh quạt tuabin thủy điện đồng trục quay ngược chiều nhau tạo ra hai mô men lực $vec(M)_1$ và $vec(M)_2$ cùng độ lớn $2500" N" dot "m"$ nhưng ngược chiều để triệt tiêu phản lực xoắn lên thân vỏ tuabin. Hợp mô men lực tổng cộng bằng],
    (
        True([$vec(0)$ (độ lớn bằng $0$)]),
        [$5000" N" dot "m"$],
        [$2500" N" dot "m"$],
        [$2500 sqrt(2)" N" dot "m"$]
    ),
    loigiai: [
        Vì hai mô men lực cùng độ lớn nhưng ngược chiều: $vec(M)_1 + vec(M)_2 = vec(0)$.
    ]
)

// TN 9
#tn([Một robot lặn tự hành hình cầu di chuyển ngầm với vận tốc động cơ $vec(v)_1 = (2; 1.5)" m/s"$ trong một dòng hải lưu có vận tốc $vec(v)_2 = (1; 2.5)" m/s"$. Vận tốc thực tế của robot đối với đáy biển là],
    (
        True([$vec(v) = (3; 4)" m/s"$ có tốc độ bằng $5" m/s"$]),
        [$vec(v) = (1; -1)" m/s"$ có tốc độ bằng $sqrt(2)" m/s"$],
        [$vec(v) = (3; 4)" m/s"$ có tốc độ bằng $7" m/s"$],
        [$vec(v) = (2; 3)" m/s"$ có tốc độ bằng $sqrt(13)" m/s"$]
    ),
    loigiai: [
        $vec(v) = vec(v)_1 + vec(v)_2 = (2 + 1; 1.5 + 2.5) = (3; 4)" m/s"$.
        Tốc độ: $v = sqrt(3^2 + 4^2) = 5" m/s"$.
    ]
)

// TN 10
#tn([Một trạm phát điện gió gồm bốn cột tuabin đặt tại bốn đỉnh của hình chữ nhật $A B C D$ có $A B = 6" km", A D = 8" km"$. Trạm quản lý trung tâm đặt tại tâm đối xứng $O$ của hình chữ nhật. Tổng khoảng cách từ trạm quản lý đến bốn cột tuabin bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0, 0)
    let pB = (3.0, 0)
    let pC = (3.0, 2.0)
    let pD = (0, 2.0)
    let pO = (1.5, 1.0)
    line(pA, pB, pC, pD, close: true, stroke: 1.2pt + rgb("e11d48"))
    line(pA, pC, stroke: (paint: luma(140), dash: "dashed"))
    line(pB, pD, stroke: (paint: luma(140), dash: "dashed"))
    circle(pO, radius: 2.5pt, fill: rgb("dc2626"))
    content(pO, [⚡ $O$], anchor: "north")
    content(pA, [🌀 $A$], anchor: "north-east")
    content(pB, [🌀 $B$], anchor: "north-west")
    content(pC, [🌀 $C$], anchor: "south-west")
    content(pD, [🌀 $D$], anchor: "south-east")
  })
]],
    (
        True([$20" km"$]),
        [$10" km"$],
        [$14" km"$],
        [$28" km"$]
    ),
    loigiai: [
        Đường chéo hình chữ nhật: $A C = sqrt(6^2 + 8^2) = 10" km"$.
        Khoảng cách từ tâm $O$ đến mỗi đỉnh: $O A = (A C) / 2 = 10 / 2 = 5" km"$.
        Tổng khoảng cách đến bốn tuabin: $4 dot 5 = 20" km"$.
    ]
)

// TN 11
#tn([Một tàu lượn không gian tái thâm nhập khí quyển có vectơ lực nâng khí động học $vec(L) = (0; 80)" kN"$ hướng lên và vectơ lực cản không khí $vec(D) = (-60; 0)" kN"$ hướng ngược chiều bay. Độ lớn của lực khí động học tổng hợp tác dụng lên tàu bằng],
    (
        True([$100" kN"$]),
        [$140" kN"$],
        [$20" kN"$],
        [$80" kN"$]
    ),
    loigiai: [
        Lực nâng $vec(L)$ và lực cản $vec(D)$ trực giao với nhau:
        $ F = sqrt(L^2 + D^2) = sqrt(80^2 + (-60)^2) = sqrt(6400 + 3600) = sqrt(10000) = 100" kN" $
    ]
)

// TN 12
#tn([Một ăng-ten chảo thu sóng viễn thông vệ tinh parabol có trục đối xứng hướng về một góc ngẩng $alpha = 60^circ$ so với mặt đất nằm ngang. Chùm sóng từ vệ tinh chiếu vuông góc trực tiếp vào lòng chảo. Góc hợp bởi hướng sóng tới và mặt đất bằng],
    (
        True([$30^circ$]),
        [$60^circ$],
        [$45^circ$],
        [$90^circ$]
    ),
    loigiai: [
        Vì chùm sóng chiếu vuông góc với mặt phẳng miệng chảo ăng-ten nên góc hợp bởi hướng sóng tới và mặt đất là:
        $ 90^circ - 60^circ = 30^circ $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (VDC - Trạm không gian ISS)
#ds([Trạm vũ trụ quốc tế đang bay trên quỹ đạo tròn quanh Trái Đất với tốc độ không đổi $v_0 = 7.6" km/s"$. Để thực hiện động tác tránh một mảnh rác vũ trụ, hệ thống động cơ phản lực phụ trợ được kích hoạt trong $2$ giây tạo lực đẩy vuông góc với hướng bay ban đầu sinh ra gia tốc $a = 0.3" m/s"^2$ ($0.0003" km/s"^2$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (3.2, 0), mark: (end: ">", fill: rgb("e11d48")), stroke: 2pt + rgb("e11d48"))
    content((3.4, -0.25), text(fill: rgb("e11d48"), size: 8.5pt)[$vec(v)_0$ ($7.6" km/s"$)])
    line(pO, (0, 1.8), mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((-0.3, 1.9), text(fill: rgb("059669"), size: 8.5pt)[$Delta vec(v)$])
    circle(pO, radius: 3pt, fill: black)
    content(pO, [🛸 ISS], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ biến thiên vận tốc vuông góc đạt được sau $2$ giây đốt động cơ là $Delta v = a dot t = 0.6" m/s" = 0.0006" km/s"$.]),
    True([Vectơ vận tốc mới của trạm vũ trụ thỏa mãn hệ thức: $vec(v) = vec(v)_0 + Delta vec(v)$.]),
    True([Góc lệch quỹ đạo $phi$ sau khi đốt động cơ thỏa mãn $tan phi = (Delta v) / v_0 approx 7.89 dot 10^(-5)$ rad (rất nhỏ, đảm bảo an toàn kết cấu).]),
    [Tốc độ mới của trạm vũ trụ tăng lên gấp đôi so với tốc độ ban đầu.]
  ),
  loigiai: [
    #step([Độ biến thiên vận tốc])
    $Delta v = a dot t = 0.3 dot 2 = 0.6" m/s" = 0.0006" km/s"$. Mệnh đề a ĐÚNG.

    #step([Vận tốc tổng hợp])
    $vec(v) = vec(v)_0 + Delta vec(v)$. Mệnh đề b ĐÚNG.

    #step([Góc lệch quỹ đạo])
    $tan phi = (0.0006) / 7.6 approx 7.89 dot 10^(-5)$ rad. Mệnh đề c ĐÚNG.

    #step([Tốc độ mới])
    $v = sqrt(7.6^2 + 0.0006^2) approx 7.60000002" km/s"$ hầu như không đổi, không thể tăng gấp đôi. Mệnh đề d SAI.
  ]
)

// DS 2 (VDC - Tuabin gió ngoài khơi khí động học)
#ds([Một cánh quạt tuabin điện gió có chiều dài $R = 50" m"$ quay đều với tốc độ góc $omega = 2" rad/s"$ trong mặt phẳng thẳng đứng. Gió tự nhiên thổi vuông góc với mặt phẳng quay cánh quạt với tốc độ $v_g = 15" m/s"$. Xét điểm $M$ tại đầu mút cánh quạt có tốc độ dài $v_c = omega R = 100" m/s"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (1.5, 0), mark: (end: ">", fill: rgb("e11d48")), stroke: 2pt + rgb("e11d48"))
    content((1.6, -0.25), text(fill: rgb("e11d48"), size: 8pt)[$vec(v)_g$ ($15" m/s"$)])
    line(pO, (0, 3.2), mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((-0.4, 3.2), text(fill: rgb("059669"), size: 8pt)[$vec(v)_c$ ($100" m/s"$)])
    line(pO, (1.5, 3.2), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((1.7, 3.3), text(fill: rgb("1d4ed8"), size: 8.5pt, weight: "bold")[$vec(v)_r$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🌀], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Hai vectơ vận tốc $vec(v)_g$ và $vec(v)_c$ vuông góc với nhau trong không gian.]),
    True([Vectơ vận tốc tương đối của luồng không khí đập vào đầu cánh quạt có độ lớn $v_r = sqrt(15^2 + 100^2) = sqrt(10225) approx 101.12" m/s"$.]),
    True([Góc đập khí động học $beta$ thỏa mãn $tan beta = v_g / v_c = 15 / 100 = 0.15 => beta approx 8.53^circ$.]),
    [Tốc độ tương đối của gió tác dụng lên gốc cánh quạt (gần trục quay $R approx 0$) lớn hơn tốc độ gió tác dụng lên đầu mút cánh quạt.]
  ),
  loigiai: [
    #step([Phương của hai vận tốc])
    Gió thổi vuông góc với mặt phẳng quay nên $vec(v)_g perp vec(v)_c$. Mệnh đề a ĐÚNG.

    #step([Tốc độ tương đối tại đầu mút])
    $v_r = sqrt(15^2 + 100^2) = sqrt(225 + 10000) = sqrt(10225) approx 101.12" m/s"$. Mệnh đề b ĐÚNG.

    #step([Góc đập khí động học])
    $tan beta = 15 / 100 = 0.15 => beta approx 8.53^circ$. Mệnh đề c ĐÚNG.

    #step([So sánh với gốc cánh])
    Tại gốc cánh $v_c approx 0 => v_r approx v_g = 15" m/s" < 101.12" m/s"$. Tốc độ gió ở gốc cánh nhỏ hơn nhiều so với đầu mút. Mệnh đề d SAI.
  ]
)

// DS 3 (VDC - Cánh đồng gương năng lượng mặt trời tháp nhiệt CSP)
#ds([Tại nhà máy điện mặt trời tháp nhiệt CSP, một tháp hấp thụ nhiệt trung tâm cao $100" m"$ đặt tại $O(0; 0; 100)$. Hai cụm gương phản xạ heliostat đặt trên mặt đất tại các vị trí $H_1(100; 0; 0)$ và $H_2(0; 100; 0)$ (đơn vị: mét).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pT = (0, 2.5)
    let pH1 = (2.5, 0)
    let pH2 = (-2.0, -0.8)
    line(pO, pT, stroke: 2.5pt + luma(100))
    line(pH1, pT, stroke: 1.5pt + rgb("e11d48"))
    line(pH2, pT, stroke: 1.5pt + rgb("e11d48"))
    circle(pT, radius: 3pt, fill: rgb("dc2626"))
    content(pT, [🔥 Đỉnh tháp], anchor: "south")
    circle(pH1, radius: 2pt, fill: black)
    content(pH1, [🪞 $H_1$], anchor: "north")
    circle(pH2, radius: 2pt, fill: black)
    content(pH2, [🪞 $H_2$], anchor: "north")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách từ mỗi gương $H_1$ và $H_2$ đến đỉnh tháp nhiệt $O$ bằng $100 sqrt(2)" m" approx 141.42" m"$.]),
    True([Góc ngẩng của chùm tia sáng phản xạ từ gương $H_1$ lên đỉnh tháp bằng $45^circ$.]),
    True([Khoảng cách giữa hai cụm gương $H_1$ và $H_2$ trên mặt đất bằng $100 sqrt(2)" m"$.]),
    [Góc hợp bởi hai chùm tia phản xạ từ hai gương tới đỉnh tháp nhiệt bằng $90^circ$.]
  ),
  loigiai: [
    #step([Khoảng cách đến đỉnh tháp])
    Đỉnh tháp $T(0; 0; 100)$, $H_1(100; 0; 0)$:
    $T H_1 = sqrt(100^2 + 0^2 + 100^2) = 100 sqrt(2)" m" approx 141.42" m"$. Tương tự $T H_2 = 100 sqrt(2)" m"$. Mệnh đề a ĐÚNG.

    #step([Góc ngẩng])
    $tan alpha = h / d = 100 / 100 = 1 => alpha = 45^circ$. Mệnh đề b ĐÚNG.

    #step([Khoảng cách giữa hai gương])
    $H_1 H_2 = sqrt(100^2 + 100^2) = 100 sqrt(2)" m"$. Mệnh đề c ĐÚNG.

    #step([Góc hợp bởi hai chùm tia tại đỉnh tháp])
    Tam giác $T H_1 H_2$ có ba cạnh: $T H_1 = 100 sqrt(2), T H_2 = 100 sqrt(2), H_1 H_2 = 100 sqrt(2)$.
    Ba cạnh bằng nhau nên tam giác $T H_1 H_2$ là tam giác đều, góc tại đỉnh tháp bằng $60^circ != 90^circ$. Mệnh đề d SAI.
  ]
)

// DS 4 (VDC - Bão tuyết và Trạm nghiên cứu Nam Cực)
#ds([Một xe trượt tuyết chuyên dụng tại trạm Nam Cực xuất phát từ trạm chính $O(0; 0)$ đi khảo sát khí tượng. Xe chạy chặng 1 theo vectơ $vec(s)_1 = (12; 5)$ (km), sau đó do bão tuyết xe phải đổi hướng chạy tiếp chặng 2 theo vectơ $vec(s)_2 = (8; 15)$ (km).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (1.8, 0.75)
    let pB = (3.0, 3.0)
    line(pO, pA, mark: (end: ">", fill: rgb("e11d48")), stroke: 1.8pt + rgb("e11d48"))
    content((1.0, 0.2), text(fill: rgb("e11d48"), size: 8pt)[$vec(s)_1$])
    line(pA, pB, mark: (end: ">", fill: rgb("059669")), stroke: 1.8pt + rgb("059669"))
    content((2.5, 1.8), text(fill: rgb("059669"), size: 8pt)[$vec(s)_2$])
    line(pO, pB, mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((1.2, 1.8), text(fill: rgb("1d4ed8"), size: 8.5pt, weight: "bold")[$vec(s)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [❄️ Trạm $O$], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Quãng đường xe trượt tuyết di chuyển ở chặng 1 bằng $13" km"$.]),
    True([Quãng đường xe trượt tuyết di chuyển ở chặng 2 bằng $17" km"$.]),
    True([Vectơ độ dời tổng hợp sau hai chặng là $vec(s) = (20; 20)$ (km) và khoảng cách thẳng từ xe về trạm $O$ bằng $20 sqrt(2)" km" approx 28.28" km"$.]),
    [Tổng quãng đường thực tế xe đã đi bằng đúng khoảng cách thẳng từ xe về trạm $O$.]
  ),
  loigiai: [
    #step([Quãng đường chặng 1])
    $s_1 = sqrt(12^2 + 5^2) = 13" km"$. Mệnh đề a ĐÚNG.

    #step([Quãng đường chặng 2])
    $s_2 = sqrt(8^2 + 15^2) = sqrt(64 + 225) = sqrt(289) = 17" km"$. Mệnh đề b ĐÚNG.

    #step([Độ dời tổng hợp])
    $vec(s) = vec(s)_1 + vec(s)_2 = (12 + 8; 5 + 15) = (20; 20)$ (km).
    Khoảng cách thẳng: $d = sqrt(20^2 + 20^2) = 20 sqrt(2)" km" approx 28.28" km"$. Mệnh đề c ĐÚNG.

    #step([So sánh quãng đường và độ dời])
    Tổng quãng đường thực tế: $s_1 + s_2 = 13 + 17 = 30" km" > 28.28" km"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17 - VDC Công suất tuabin gió)
#tln([Một tuabin điện gió có công suất định mức khi đón gió vuông góc là $P_0 = 2000" kW"$. Khi hướng gió tự nhiên lệch một góc $alpha = 60^circ$ so với trục tuabin, công suất hữu ích của tuabin bằng bao nhiêu kilôoát ($"kW"$)?],
    [1000],
    loigiai: [
        #step([Công thức công suất theo góc lệch])
        $ P = P_0 dot cos alpha $
        
        #step([Thay số])
        $ P = 2000 dot cos 60^circ = 2000 dot 1/2 = 1000" kW" $
    ]
)

// TLN 2 (Câu 18 - VDC Vận tốc tương đối gió)
#tln([Gió thổi tới tuabin với vận tốc $vec(v)_g = (15; 0)" m/s"$. Đầu cánh tuabin chuyển động với vận tốc $vec(v)_c = (0; -20)" m/s"$.
Tính độ lớn của vectơ vận tốc tương đối $vec(v)_r = vec(v)_g - vec(v)_c$ theo đơn vị $"m/s"$.],
    [25],
    loigiai: [
        #step([Xác định vectơ vận tốc tương đối])
        $ vec(v)_r = (15 - 0; 0 - (-20)) = (15; 20)" m/s" $
        
        #step([Tính độ lớn])
        $ v_r = sqrt(15^2 + 20^2) = sqrt(225 + 400) = sqrt(625) = 25" m/s" $
    ]
)

// TLN 3 (Câu 19 - VDC Trạm biến áp tối ưu Heron)
#tln([Hai trang trại điện gió đặt tại $A(1; 2)$ và $B(7; 6)$ (đơn vị: km). Một trạm đấu nối $M(x; 0)$ được đặt trên trục đường cái $O x$ sao cho tổng chiều dài đường dây $M A + M B$ ngắn nhất.
Tính hoành độ $x$ của trạm đấu nối $M$.],
    [2.5],
    loigiai: [
        #step([Lấy điểm đối xứng qua trục hoành])
        Lấy điểm $A'(1; -2)$ đối xứng với $A$ qua $O x$.
        Đường thẳng $A' B$ đi qua $A'(1; -2)$ và $B(7; 6)$ có vectơ chỉ phương:
        $ vec(A' B) = (7 - 1; 6 - (-2)) = (6; 8) = 2(3; 4) $
        
        #step([Tìm giao điểm với trục Ox])
        Phương trình $A' B$: $cases(x = 1 + 3t, y = -2 + 4t)$.
        Cho $y = 0 <=> -2 + 4t = 0 <=> t = 0.5$.
        $x = 1 + 3(0.5) = 1 + 1.5 = 2.5$.
        Vậy $x = 2.5$.
    ]
)

// TLN 4 (Câu 20 - VDC Xung vận tốc vệ tinh)
#tln([Một vệ tinh nhân tạo khối lượng $m = 200" kg"$ nhận được một xung lực đẩy $vec(J) = (800; 600)" N" dot "s"$ từ động cơ phản lực.
Tính độ lớn của độ biến thiên vận tốc $|Delta vec(v)|$ của vệ tinh theo đơn vị $"m/s"$.],
    [5],
    loigiai: [
        #step([Tính vectơ biến thiên vận tốc])
        $ Delta vec(v) = (vec(J)) / m = (800; 600) / 200 = (4; 3)" m/s" $
        
        #step([Tính độ lớn])
        $ |Delta vec(v)| = sqrt(4^2 + 3^2) = 5" m/s" $
    ]
)

// TLN 5 (Câu 21 - VDC Công buồm diều)
#tln([Một cánh buồm diều kéo tàu hàng với lực kéo $F = 10000" N"$ hợp với hướng di chuyển góc $alpha = 0^circ$. Tàu chạy được quãng đường $s = 500" m"$.
Tính công do lực kéo buồm diều sinh ra theo đơn vị mêgajun ($"MJ"$).],
    [5],
    loigiai: [
        #step([Tính công cơ học])
        $ A = F dot s dot cos 0^circ = 10000 dot 500 dot 1 = 5000000" J" $
        Đổi ra mêgajun ($"MJ"$):
        $ 5000000" J" = 5" MJ" $
    ]
)

// TLN 6 (Câu 22 - VDC Góc nghiêng tấm pin mặt trời)
#tln([Tại một địa phương có tia nắng mặt trời buổi trưa chiếu nghiêng một góc $60^circ$ so với mặt đất nằm ngang. Người ta cần lắp đặt tấm pin mặt trời nghiêng một góc $beta$ so với mặt đất ($0^circ < beta < 90^circ$) sao cho tia sáng mặt trời chiếu thẳng góc với bề mặt tấm pin.
Tính góc nghiêng $beta$ của tấm pin mặt trời theo đơn vị độ.],
    [30],
    loigiai: [
        #step([Phân tích góc hình học])
        Mặt phẳng tấm pin và tia sáng vuông góc với nhau ($90^circ$).
        Tia sáng hợp với mặt đất góc $60^circ$.
        
        #step([Tính góc nghiêng của tấm pin])
        Góc nghiêng của tấm pin so với mặt đất là:
        $ beta = 90^circ - 60^circ = 30^circ $
        Vậy góc nghiêng cần lắp là $30^circ$.
    ]
)

] // end make-questions

#make-questions()
