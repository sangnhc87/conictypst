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
#let accent = rgb("059669") // Emerald Green

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHUYÊN ĐỀ TOÁN THỰC TẾ",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: MÔ HÌNH HÓA VECTƠ (ĐỀ E: ĐỊNH VỊ KHÔNG LƯU & ROBOT AGV - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "120",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Trên màn hình radar kiểm soát không lưu sân bay (gốc tọa độ $O(0; 0)$ tại đài chỉ huy, đơn vị trên các trục là kilômét), một máy bay chở khách đang ở vị trí $M(30; 40)$ và bay thẳng về phía đài kiểm soát $O$ với tốc độ không đổi $v = 200" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.0, 0), mark: (end: ">"), stroke: 0.8pt)
    content((4.2, 0), text(size: 8pt)[$x$])
    line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.7), text(size: 8pt)[$y$])
    let pO = (0, 0)
    let pM = (3.0, 2.5)
    line(pM, pO, mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((1.8, 1.5), text(fill: rgb("059669"), size: 8.5pt, weight: "bold")[$vec(v)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🗼 $O$], anchor: "north-east")
    circle(pM, radius: 2.5pt, fill: black)
    content(pM, [✈️ $M(30; 40)$], anchor: "south-west")
  })
]
Khoảng cách từ máy bay đến đài kiểm soát và thời gian máy bay bay về đến đài lần lượt là],
    (
        True([$50" km"$ và $15$ phút]),
        [$50" km"$ và $20$ phút],
        [$70" km"$ và $21$ phút],
        [$40" km"$ và $12$ phút]
    ),
    loigiai: [
        Khoảng cách từ máy bay đến đài kiểm soát $O$:
        $ O M = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" km" $
        Thời gian bay:
        $ t = (O M) / v = 50 / 200 = 0.25 text(" giờ") = 15 text(" phút") $
    ]
)

// TN 2
#tn([Hai thiết bị bay không người lái (Drone) $D_1$ và $D_2$ cùng xuất phát từ trạm trung tâm $O(0; 0)$. Drone $D_1$ bay theo hướng vectơ $vec(u)_1 = (3; 4)$, drone $D_2$ bay theo hướng vectơ $vec(u)_2 = (8; 6)$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (1.8, 2.4), mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((1.9, 2.6), text(fill: rgb("059669"), size: 8.5pt)[$D_1 (vec(u)_1)$])
    line(pO, (3.2, 2.4), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((3.4, 2.4), text(fill: rgb("1d4ed8"), size: 8.5pt)[$D_2 (vec(u)_2)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🚁 $O$], anchor: "north-east")
    draw_angle_arc(pO, 37deg, 53deg, radius: 0.8, stroke: 1pt + rgb("dc2626"))
  })
]
Côsin của góc hợp bởi hai hướng bay của hai drone bằng],
    (
        True([$0.96$]),
        [$0.80$],
        [$0.60$],
        [$0.92$]
    ),
    loigiai: [
        Áp dụng công thức tính côsin góc giữa hai vectơ:
        $ cos theta = (vec(u)_1 dot vec(u)_2) / (|vec(u)_1| dot |vec(u)_2|) $
        $ vec(u)_1 dot vec(u)_2 = 3 dot 8 + 4 dot 6 = 24 + 24 = 48 $
        $ |vec(u)_1| = sqrt(3^2 + 4^2) = 5; quad |vec(u)_2| = sqrt(8^2 + 6^2) = 10 $
        $ cos theta = 48 / (5 dot 10) = 48 / 50 = 0.96 $
    ]
)

// TN 3
#tn([Trong một nhà máy thông minh, một robot tự hành AGV di chuyển trên sàn nhà xưởng theo đường thẳng từ vị trí $A(2; 3)$ đến vị trí $B(8; 11)$ (đơn vị: mét). Động cơ điện của robot tác dụng một lực đẩy không đổi $vec(F) = (40; 30)" N"$ cùng phương với độ dời $vec(A B)$. Công cơ học sinh ra trong hành trình này bằng],
    (
        True([$480" J"$]),
        [$240" J"$],
        [$500" J"$],
        [$360" J"$]
    ),
    loigiai: [
        Vectơ dịch chuyển của robot:
        $ vec(d) = vec(A B) = (8 - 2; 11 - 3) = (6; 8)" m" $
        Công cơ học của lực đẩy:
        $ A = vec(F) dot vec(d) = 40 dot 6 + 30 dot 8 = 240 + 240 = 480" J" $
    ]
)

// TN 4
#tn([Một drone nông nghiệp bay phun thuốc bảo vệ thực vật theo một tuyến bay thẳng từ điểm $A(100; 200)$ đến điểm $B(400; 600)$ (hệ tọa độ cánh đồng công nghệ cao, đơn vị: mét). Chiều dài của tuyến bay $A B$ bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.5, 2.5)
    line(pA, pB, mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    circle(pA, radius: 2pt, fill: black)
    content(pA, [🌾 $A$], anchor: "north-east")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [🌾 $B$], anchor: "south-west")
    content((1.8, 1.7), text(fill: rgb("059669"), size: 8.5pt, weight: "bold")[$500" m"$])
  })
]],
    (
        True([$500" m"$]),
        [$700" m"$],
        [$450" m"$],
        [$600" m"$]
    ),
    loigiai: [
        Chiều dài tuyến bay là khoảng cách giữa hai điểm:
        $ A B = sqrt((400 - 100)^2 + (600 - 200)^2) = sqrt(300^2 + 400^2) = sqrt(90000 + 160000) = sqrt(250000) = 500" m" $
    ]
)

// TN 5
#tn([Trên màn hình radar, hai máy bay trinh sát đang bay với vectơ vận tốc lần lượt là $vec(v)_1 = (500; 0)$ (km/h) theo hướng Đông và $vec(v)_2 = (0; 500)$ (km/h) theo hướng Bắc. Tốc độ tương đối của máy bay thứ nhất so với máy bay thứ hai bằng],
    (
        True([$500 sqrt(2)" km/h" approx 707.1" km/h"$]),
        [$1000" km/h"$],
        [$500" km/h"$],
        [$0" km/h"$]
    ),
    loigiai: [
        Vận tốc tương đối: $vec(v)_(12) = vec(v)_1 - vec(v)_2 = (500; -500)$ (km/h).
        Tốc độ tương đối:
        $ v_(12) = sqrt(500^2 + (-500)^2) = sqrt(250000 + 250000) = 500 sqrt(2)" km/h" approx 707.1" km/h" $
    ]
)

// TN 6
#tn([Một hệ thống AGV tự hành gồm ba robot làm việc tại ba vị trí $A(1; 2), B(5; 4)$ và $C(3; 9)$. Người ta muốn đặt một trạm sạc pin tự động không dây tại vị trí điểm $G(x; y)$ sao cho tổng bình phương khoảng cách từ trạm sạc đến ba vị trí làm việc là nhỏ nhất. Tọa độ của trạm sạc $G$ là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.6)
    let pB = (3.5, 1.2)
    let pC = (2.0, 3.2)
    let pG = (2.0, 1.67)
    line(pA, pB, pC, close: true, stroke: 1.2pt + rgb("059669"))
    circle(pA, radius: 2pt, fill: black)
    content(pA, [🤖 $A$], anchor: "north-east")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [🤖 $B$], anchor: "north-west")
    circle(pC, radius: 2pt, fill: black)
    content(pC, [🤖 $C$], anchor: "south")
    circle(pG, radius: 2.5pt, fill: rgb("dc2626"))
    content(pG, [⚡ $G$], anchor: "north")
  })
]],
    (
        True([$G(3; 5)$]),
        [$G(3; 4)$],
        [$G(4; 5)$],
        [$G(9/2; 15/2)$]
    ),
    loigiai: [
        Tổng bình phương khoảng cách $M A^2 + M B^2 + M C^2$ đạt giá trị nhỏ nhất khi và chỉ khi điểm $M$ trùng với trọng tâm $G$ của tam giác $A B C$.
        Tọa độ trọng tâm $G$:
        $ x_G = (x_A + x_B + x_C) / 3 = (1 + 5 + 3) / 3 = 9 / 3 = 3 $
        $ y_G = (y_A + y_B + y_C) / 3 = (2 + 4 + 9) / 3 = 15 / 3 = 5 $
        Vậy trạm sạc đặt tại $G(3; 5)$.
    ]
)

// TN 7
#tn([Một chiếc robot cứu hộ di chuyển trên mặt phẳng tọa độ $O x y$ từ vị trí $A(-2; 1)$ đến vị trí $B(4; 9)$ trong thời gian $10$ giây với vận tốc không đổi. Vectơ vận tốc của robot có tọa độ là],
    (
        True([$vec(v) = (0.6; 0.8)$ (m/s)]),
        [$vec(v) = (6; 8)$ (m/s)],
        [$vec(v) = (0.8; 0.6)$ (m/s)],
        [$vec(v) = (0.2; 1.0)$ (m/s)]
    ),
    loigiai: [
        Độ dời: $vec(d) = vec(A B) = (4 - (-2); 9 - 1) = (6; 8)$ (m).
        Vectơ vận tốc:
        $ vec(v) = (vec(d)) / t = (6; 8) / 10 = (0.6; 0.8) text(" (m/s)") $
    ]
)

// TN 8
#tn([Hai trạm phát tín hiệu định vị vô tuyến mặt đất đặt tại $A(0; 0)$ và $B(8; 0)$ (đơn vị: km). Một phương tiện tự hành $M$ nhận được tín hiệu cho biết khoảng cách từ nó tới hai trạm thỏa mãn $M A = M B$. Tập hợp các vị trí có thể có của phương tiện $M$ là],
    (
        True([Đường thẳng có phương trình $x = 4$ (đường trung trực của đoạn $A B$)]),
        [Đường tròn đường kính $A B$],
        [Đường thẳng có phương trình $y = 4$],
        [Đoạn thẳng nối hai điểm $A$ và $B$]
    ),
    loigiai: [
        $M A = M B <=> M$ thuộc đường trung trực của đoạn thẳng $A B$.
        Đoạn $A B$ nằm trên trục hoành nối từ $(0; 0)$ đến $(8; 0)$, trung điểm là $I(4; 0)$.
        Đường trung trực vuông góc với $A B$ tại $I$ chính là đường thẳng song song với trục tung có phương trình $x = 4$.
    ]
)

// TN 9
#tn([Một drone tuần tra giao thông bay theo quỹ đạo thẳng từ điểm $A(1; 2)$ đến điểm $B(7; 10)$. Trên đường đi, drone bay qua trạm sạc khẩn cấp $K$ sao cho $A K = 1/3 A B$. Tọa độ của trạm sạc $K$ là],
    (
        True([$K(3; 14/3)$]),
        [$K(2; 4)$],
        [$K(3; 5)$],
        [$K(4; 6)$]
    ),
    loigiai: [
        $vec(A K) = 1/3 vec(A B) <=> cases(x_K - x_A = 1/3(x_B - x_A), y_K - y_A = 1/3(y_B - y_A))$.
        $x_K = 1 + 1/3(7 - 1) = 1 + 2 = 3$.
        $y_K = 2 + 1/3(10 - 2) = 2 + 8/3 = 14/3$.
        Vậy $K(3; 14/3)$.
    ]
)

// TN 10
#tn([Một xe tự hành AGV đang di chuyển thẳng từ điểm $O(0; 0)$ đến điểm $B(6; 8)$. Một cảm biến laser phát hiện một vật cản tĩnh tại điểm $C(3; 4)$. Khẳng định nào sau đây là ĐÚNG?],
    (
        True([Vật cản $C$ nằm ngay chính giữa đường đi của robot ($C$ là trung điểm của $O B$)]),
        [Vật cản $C$ nằm lệch sang bên phải đường đi của robot],
        [Vật cản $C$ nằm lệch sang bên trái đường đi của robot],
        [Robot sẽ không va chạm với vật cản nếu tiếp tục đi thẳng]
    ),
    loigiai: [
        $vec(O B) = (6; 8) = 2(3; 4) = 2 vec(O C)$.
        Suy ra $vec(O C) = 1/2 vec(O B)$, ba điểm $O, C, B$ thẳng hàng và $C$ là trung điểm của đoạn thẳng $O B$. Do đó vật cản nằm ngay trên đường đi của xe.
    ]
)

// TN 11
#tn([Một quả cầu thám không khí tượng đo gió ở tầng bình lưu được thả từ điểm $O(0; 0)$. Sau $1$ giờ, gió tầng thấp đẩy quả cầu đi theo vectơ $vec(d)_1 = (20; 15)$ (km), gió tầng cao tiếp tục đẩy quả cầu theo vectơ $vec(d)_2 = (10; 25)$ (km). Vị trí cuối cùng của quả cầu thám không cách điểm thả một khoảng bằng],
    (
        True([$50" km"$]),
        [$70" km"$],
        [$45" km"$],
        [$60" km"$]
    ),
    loigiai: [
        Độ dời tổng hợp: $vec(d) = vec(d)_1 + vec(d)_2 = (20 + 10; 15 + 25) = (30; 40)$ (km).
        Khoảng cách từ điểm thả đến vị trí cuối:
        $ d = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" km" $
    ]
)

// TN 12
#tn([Trong không gian hai chiều của một xưởng cơ khí, một cánh tay robot gia công hàn một đường thẳng từ điểm $A(1; 1)$ đến điểm $B(4; 5)$ (đơn vị: dm). Đầu que hàn chịu lực cản cơ học ngược chiều chuyển động có độ lớn không đổi $F_c = 20" N"$. Công cơ học do cánh tay robot thắng lực cản trên đoạn đường hàn bằng],
    (
        True([$10" J"$]),
        [$100" J"$],
        [$50" J"$],
        [$20" J"$]
    ),
    loigiai: [
        Chiều dài đường hàn:
        $ A B = sqrt((4 - 1)^2 + (5 - 1)^2) = sqrt(3^2 + 4^2) = 5" dm" = 0.5" m" $
        Công cản (độ lớn công cơ học cần cung cấp):
        $ A = F_c dot A B = 20 dot 0.5 = 10" J" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (VDC - Radar không lưu theo dõi nguy cơ va chạm)
#ds([Đài kiểm soát không lưu sân bay đang giám sát đường bay của hai máy bay thương mại $A$ và $B$ trong cùng một mặt bằng bay. Tại thời điểm $t = 0$, máy bay $A$ ở tọa độ $(0; 100)$ và bay về phía Nam (theo hướng trục tung giảm) với tốc độ $400" km/h"$; máy bay $B$ ở tọa độ $(-80; 0)$ và bay về phía Đông (theo hướng trục hoành tăng) với tốc độ $300" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
    content((2.7, 0), text(size: 8pt)[$x$])
    line((0, -1.5), (0, 3.0), mark: (end: ">"), stroke: 0.8pt)
    content((0, 3.2), text(size: 8pt)[$y$])
    let pA = (0, 2.2)
    let pB = (-1.8, 0)
    line(pA, (0, 0.8), mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    content((0.4, 1.5), text(fill: rgb("059669"), size: 8pt)[$vec(v)_A$])
    line(pB, (-0.6, 0), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((-1.2, 0.3), text(fill: rgb("1d4ed8"), size: 8pt)[$vec(v)_B$])
    circle(pA, radius: 2pt, fill: black)
    content(pA, [✈️ $A$], anchor: "west")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [✈️ $B$], anchor: "south")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ vận tốc của hai máy bay lần lượt là $vec(v)_A = (0; -400)$ và $vec(v)_B = (300; 0)$ (km/h).]),
    True([Vectơ vận tốc tương đối của máy bay $B$ đối với máy bay $A$ là $vec(v)_(B A) = (300; 400)$ và có độ lớn bằng $500" km/h"$.]),
    True([Sau thời gian $t = 0.2$ giờ ($12$ phút), khoảng cách giữa hai máy bay bằng đúng $28" km"$.]),
    [Hai máy bay sẽ va chạm trực tiếp với nhau tại giao điểm hai đường bay là gốc tọa độ $O(0; 0)$.]
  ),
  loigiai: [
    #step([Xác định vectơ vận tốc])
    $vec(v)_A = (0; -400)$ và $vec(v)_B = (300; 0)$ (km/h). Mệnh đề a ĐÚNG.

    #step([Vận tốc tương đối])
    $vec(v)_(B A) = vec(v)_B - vec(v)_A = (300; 400)$. Độ lớn: $|vec(v)_(B A)| = sqrt(300^2 + 400^2) = 500" km/h"$. Mệnh đề b ĐÚNG.

    #step([Vị trí sau 0.2 giờ])
    Sau $t = 0.2$ h:
    $x_A = 0, y_A = 100 - 400(0.2) = 20 => A(0; 20)$.
    $x_B = -80 + 300(0.2) = -20, y_B = 0 => B(-20; 0)$.
    Khoảng cách: $A B = sqrt((-20 - 0)^2 + (0 - 20)^2) = sqrt(400 + 400) = 20 sqrt(2) approx 28.28" km"$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra va chạm tại gốc O])
    Máy bay $A$ tới gốc $O$ khi $100 - 400 t = 0 <=> t = 0.25$ giờ ($15$ phút).
    Máy bay $B$ tới gốc $O$ khi $-80 + 300 t = 0 <=> t = 80/300 approx 0.267$ giờ ($16$ phút).
    Hai máy bay đi qua gốc $O$ ở hai thời điểm khác nhau nên không va chạm nhau. Mệnh đề d SAI.
  ]
)

// DS 2 (VDC - Định vị vệ tinh GPS)
#ds([Một máy thu tín hiệu định vị vệ tinh GPS trên mặt đất (coi như phẳng hai chiều $O x y$, đơn vị: km) nhận được tín hiệu từ ba vệ tinh bay quỹ đạo thấp có vị trí tức thời là $S_1(0; 600), S_2(800; 0)$ và $S_3(-800; 0)$. Thời gian truyền tín hiệu cho biết máy thu cách vệ tinh $S_1$ một khoảng $d_1 = 600" km"$, cách $S_2$ và $S_3$ cùng một khoảng $d_2 = d_3 = 1000" km"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pS1 = (0, 2.4)
    let pS2 = (3.2, 0)
    let pS3 = (-3.2, 0)
    line(pS3, pS2, stroke: 1pt + luma(140))
    line(pO, pS1, stroke: (paint: luma(140), dash: "dashed"))
    circle(pS1, radius: 2.5pt, fill: rgb("059669"))
    content(pS1, [🛰️ $S_1$], anchor: "south")
    circle(pS2, radius: 2.5pt, fill: rgb("1d4ed8"))
    content(pS2, [🛰️ $S_2$], anchor: "north")
    circle(pS3, radius: 2.5pt, fill: rgb("1d4ed8"))
    content(pS3, [🛰️ $S_3$], anchor: "north")
    circle(pO, radius: 3pt, fill: rgb("dc2626"))
    content((0, -0.3), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[Máy thu $M$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vị trí của máy thu $M(x; y)$ thỏa mãn hệ phương trình khoảng cách: $x^2 + (y - 600)^2 = 600^2$ và $(x - 800)^2 + y^2 = 1000^2$.]),
    True([Do $M S_2 = M S_3$ nên điểm $M$ phải nằm trên đường trung trực của đoạn thẳng $S_2 S_3$ (trục tung $O y$), suy ra $x = 0$.]),
    True([Tọa độ chính xác của máy thu định vị GPS là gốc tọa độ $M(0; 0)$.]),
    [Khoảng cách giữa hai vệ tinh $S_2$ và $S_3$ bằng $1000" km"$.]
  ),
  loigiai: [
    #step([Thiết lập hệ phương trình định vị])
    $M(x; y)$ cách $S_1(0; 600)$ khoảng $600$: $x^2 + (y - 600)^2 = 600^2$.
    $M(x; y)$ cách $S_2(800; 0)$ khoảng $1000$: $(x - 800)^2 + y^2 = 1000^2$. Mệnh đề a ĐÚNG.

    #step([Tính đối xứng trung trực])
    $S_2(800; 0)$ và $S_3(-800; 0)$ đối xứng qua trục $O y$. Vì $M S_2 = M S_3 = 1000$ nên $M in O y => x = 0$. Mệnh đề b ĐÚNG.

    #step([Giải tìm tọa độ])
    Thay $x = 0$ vào phương trình thứ nhất: $(y - 600)^2 = 600^2 <=> y - 600 = plus.minus 600 <=> y = 0$ hoặc $y = 1200$.
    Với $y = 0$: $800^2 + 0^2 = 640000 < 1000000$, khoan:
    $(0 - 800)^2 + y^2 = 1000^2 <=> 640000 + y^2 = 1000000 <=> y^2 = 360000 <=> y = plus.minus 600$.
    Kết hợp với $(y - 600)^2 = 600^2 <=> y(y - 1200) = 0 => y = 0$ hoặc $y = 1200$.
    Nghiệm chung duy nhất: $y = 0$. Tọa độ máy thu là $M(0; 0)$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách S2 và S3])
    $S_2 S_3 = 800 - (-800) = 1600" km" != 1000" km"$. Mệnh đề d SAI.
  ]
)

// DS 3 (VDC - Robot AGV tự hành tránh chướng ngại vật)
#ds([Một robot tự hành AGV trong kho logistics thông minh di chuyển trên mặt sàn $O x y$. Robot xuất phát từ điểm $A(0; 2)$, nhận nhiệm vụ vận chuyển một kiện hàng $30" kg"$ tới trạm giao dịch $B(6; 10)$ (đơn vị: mét). Động cơ tạo lực kéo $vec(F) = (15; 20)" N"$ giúp xe di chuyển thẳng đều với tốc độ $v = 2" m/s"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.8)
    let pB = (3.5, 3.2)
    line(pA, pB, mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    circle(pA, radius: 2.5pt, fill: black)
    content(pA, [🤖 $A$], anchor: "north-east")
    circle(pB, radius: 2.5pt, fill: black)
    content(pB, [📦 $B$], anchor: "south-west")
    content((1.8, 2.2), text(fill: rgb("059669"), size: 8.5pt, weight: "bold")[$vec(d)$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Vectơ dịch chuyển của robot là $vec(d) = vec(A B) = (6; 8)$ và quãng đường di chuyển bằng $s = 10" m"$.]),
    True([Vectơ lực kéo $vec(F)$ cùng phương, cùng chiều với vectơ dịch chuyển $vec(d)$ vì $(15; 20) = 2.5(6; 8)$.]),
    True([Công do động cơ robot sinh ra trong toàn bộ quãng đường là $A = 250" J"$.]),
    [Thời gian robot hoàn thành hành trình giao hàng là $10$ giây.]
  ),
  loigiai: [
    #step([Vectơ dịch chuyển và quãng đường])
    $vec(d) = (6 - 0; 10 - 2) = (6; 8)$ (m). Quãng đường: $s = sqrt(6^2 + 8^2) = 10" m"$. Mệnh đề a ĐÚNG.

    #step([Kiểm tra phương chiều lực kéo])
    $(15; 20) = 2.5(6; 8) => vec(F) = 2.5 vec(d)$. Lực kéo cùng phương cùng chiều dịch chuyển. Mệnh đề b ĐÚNG.

    #step([Công của lực kéo])
    $A = vec(F) dot vec(d) = 15(6) + 20(8) = 90 + 160 = 250" J"$. Mệnh đề c ĐÚNG.

    #step([Thời gian hoàn thành])
    $t = s / v = 10 / 2 = 5$ giây $\ne 10$ giây. Mệnh đề d SAI.
  ]
)

// DS 4 (VDC - Drone tuần tra bảo vệ rừng)
#ds([Một drone kiểm lâm bảo vệ rừng quốc gia bay tuần tra theo một chu trình tam giác khép kín $O -> A -> B -> O$ với tọa độ các trạm quan sát là $O(0; 0), A(6; 0)$ và $B(6; 8)$ (đơn vị: km).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (3.0, 0)
    let pB = (3.0, 2.4)
    line(pO, pA, pB, close: true, stroke: 1.5pt + rgb("059669"))
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [Trạm $O$], anchor: "north-east")
    circle(pA, radius: 2pt, fill: black)
    content(pA, [Trạm $A$], anchor: "north")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [Trạm $B$], anchor: "south")
    draw_angle_arc(pA, 90deg, 180deg, radius: 0.35, stroke: 1pt + rgb("dc2626"))
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tam giác tuần tra $O A B$ là tam giác vuông tại $A$ vì $vec(A O) dot vec(A B) = 0$.]),
    True([Tổng độ dài hành trình tuần tra khép kín của drone bằng $24" km"$.]),
    True([Diện tích khu vực rừng được bao quanh bởi chu trình bay tuần tra là $S = 24" km"^2$.]),
    [Tổng vectơ dịch chuyển của drone sau khi hoàn thành một chu trình bay khép kín có độ lớn bằng $24" km"$.]
  ),
  loigiai: [
    #step([Kiểm tra góc vuông])
    $vec(A O) = (-6; 0)$ và $vec(A B) = (0; 8) => vec(A O) dot vec(A B) = (-6)(0) + 0(8) = 0$. Tam giác vuông tại $A$. Mệnh đề a ĐÚNG.

    #step([Tổng hành trình])
    $O A = 6" km"$, $A B = 8" km"$, $B O = sqrt(6^2 + 8^2) = 10" km"$.
    Chu vi: $P = 6 + 8 + 10 = 24" km"$. Mệnh đề b ĐÚNG.

    #step([Diện tích rừng tuần tra])
    $S = 1/2 O A dot A B = 1/2 dot 6 dot 8 = 24" km"^2$. Mệnh đề c ĐÚNG.

    #step([Tổng vectơ dịch chuyển])
    Vì bay một chu trình khép kín trở về điểm xuất phát nên vectơ dịch chuyển tổng hợp là vectơ-không:
    $vec(d) = vec(O A) + vec(A B) + vec(B O) = vec(0) => |vec(d)| = 0 != 24" km"$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17 - VDC Radar khoảng cách)
#tln([Trên màn hình radar phòng không, trạm chỉ huy đặt tại gốc $O(0; 0)$. Một máy bay lạ đang bay thẳng từ điểm $A(10; 24)$ đến điểm $B(30; 24)$ (đơn vị: km).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    let pA = (1.2, 2.0)
    let pB = (3.5, 2.0)
    line(pA, pB, mark: (end: ">", fill: rgb("059669")), stroke: 2pt + rgb("059669"))
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [📡 $O$], anchor: "north-east")
    circle(pA, radius: 2pt, fill: black)
    content(pA, [✈️ $A$], anchor: "south")
    circle(pB, radius: 2pt, fill: black)
    content(pB, [🎯 $B$], anchor: "south")
    line(pO, (2.0, 2.0), stroke: (paint: rgb("dc2626"), dash: "dashed"))
    content((1.2, 1.0), text(fill: rgb("dc2626"), size: 8pt)[Khoảng cách gần nhất])
  })
]
Khoảng cách ngắn nhất từ trạm chỉ huy $O$ đến đường bay của máy bay lạ bằng bao nhiêu kilômét?],
    [24],
    loigiai: [
        #step([Nhận diện phương trình đường bay])
        Hai điểm $A(10; 24)$ và $B(30; 24)$ có cùng tung độ $y = 24$.
        Do đó đường bay là đường thẳng song song với trục hoành có phương trình $y = 24$.
        
        #step([Khoảng cách ngắn nhất])
        Khoảng cách ngắn nhất từ gốc $O(0; 0)$ đến đường thẳng $y = 24$ là đoạn vuông góc kẻ từ $O$ đến đường thẳng:
        $ d_min = 24" km" $
    ]
)

// TLN 2 (Câu 18 - VDC Tốc độ tương đối)
#tln([Hai tàu hải cảnh $P$ và $Q$ tuần tra vùng biển. Tàu $P$ di chuyển với vận tốc $vec(v)_P = (12; 16)$ (hải lý/giờ), tàu $Q$ di chuyển với vận tốc $vec(v)_Q = (20; 10)$ (hải lý/giờ).
Tính bình phương độ lớn của vectơ vận tốc tương đối $|vec(v)_P - vec(v)_Q|^2$ giữa hai tàu.],
    [100],
    loigiai: [
        #step([Xác định vectơ vận tốc tương đối])
        $vec(v)_(P Q) = vec(v)_P - vec(v)_Q = (12 - 20; 16 - 10) = (-8; 6)$ (hải lý/giờ).
        
        #step([Tính bình phương độ lớn])
        $ |vec(v)_(P Q)|^2 = (-8)^2 + 6^2 = 64 + 36 = 100 $
        Vậy bình phương độ lớn bằng $100$.
    ]
)

// TLN 3 (Câu 19 - VDC Công AGV đẩy hàng)
#tln([Một robot đẩy hàng AGV tác dụng một lực đẩy $vec(F) = (60; 80)" N"$ đẩy xe hàng di chuyển một vectơ dịch chuyển $vec(d) = (4; 3)" m"$.
Tính công cơ học do robot thực hiện theo đơn vị Jun ($"J"$).],
    [480],
    loigiai: [
        #step([Tính công cơ học theo tích vô hướng])
        $ A = vec(F) dot vec(d) = F_x d_x + F_y d_y $
        
        #step([Thay số])
        $ A = 60 dot 4 + 80 dot 3 = 240 + 240 = 480" J" $
    ]
)

// TLN 4 (Câu 20 - VDC Thời gian bay về đài chỉ huy)
#tln([Một chiếc trực thăng cứu hộ đang ở vị trí $C(15; 20)$ (đơn vị: km) bay thẳng về bệnh viện trung tâm ở gốc $O(0; 0)$ với tốc độ không đổi $v = 100" km/h"$.
Hỏi sau bao nhiêu phút thì trực thăng hạ cánh tại bệnh viện?],
    [15],
    loigiai: [
        #step([Tính khoảng cách OC])
        $ O C = sqrt(15^2 + 20^2) = sqrt(225 + 400) = sqrt(625) = 25" km" $
        
        #step([Tính thời gian bay])
        $ t = (O C) / v = 25 / 100 = 0.25 text(" giờ") $
        Đổi ra phút: $0.25 dot 60 = 15$ phút.
    ]
)

// TLN 5 (Câu 21 - VDC Hoành độ trạm sạc trung tâm)
#tln([Ba robot AGV hoạt động tại ba vị trí có tọa độ là $A(2; 1), B(6; 5)$ và $C(10; 6)$. Trạm sạc trung tâm được đặt tại trọng tâm $G$ của tam giác $A B C$.
Tìm hoành độ $x_G$ của trạm sạc trung tâm.],
    [6],
    loigiai: [
        #step([Áp dụng công thức tọa độ trọng tâm])
        $ x_G = (x_A + x_B + x_C) / 3 $
        
        #step([Thay số])
        $ x_G = (2 + 6 + 10) / 3 = 18 / 3 = 6 $
        Vậy hoành độ của trạm sạc là $x_G = 6$.
    ]
)

// TLN 6 (Câu 22 - VDC Chiều dài hành trình Drone)
#tln([Một thiết bị drone khảo sát địa hình bay theo tuyến đường thẳng từ mốc trắc địa $A(50; 80)$ đến mốc $B(350; 480)$ (đơn vị: mét).
Tính chiều dài tuyến bay khảo sát $A B$ theo đơn vị mét.],
    [500],
    loigiai: [
        #step([Tính khoảng cách AB])
        $ A B = sqrt((350 - 50)^2 + (480 - 80)^2) = sqrt(300^2 + 400^2) $
        
        #step([Khai căn])
        $ A B = sqrt(90000 + 160000) = sqrt(250000) = 500" m" $
        Vậy chiều dài tuyến bay là $500" m"$.
    ]
)

] // end make-questions

#make-questions()
