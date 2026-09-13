#import "@preview/sang-math:1.0.4": *
#import "@preview/cetz:0.3.4"

// ═══════════════════════════════════════════════════════════
// HÀM VẼ CUNG GÓC CHUẨN XÁC TRONG CETZ
// (Khắc phục việc arc trong CeTZ nhận tọa độ điểm bắt đầu trên đường tròn)
// ═══════════════════════════════════════════════════════════
#let draw_angle_arc(center, a1, a2, radius: 0.8, ..rest) = {
  let sx = center.at(0) + radius * calc.cos(a1)
  let sy = center.at(1) + radius * calc.sin(a1)
  cetz.draw.arc((sx, sy), start: a1, stop: a2, radius: radius, ..rest)
}

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("2563eb") // Royal Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "ÔN TẬP CHƯƠNG 3",
  exam-title: "BÀI 6: TOÁN THỰC TẾ & ĐO ĐẠC HÌNH HỌC (ĐỀ D: TRẮC ĐỊA & CÔNG TRÌNH)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "107",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
  header-border: false,
)

// ═══════════════════════════════════════════════════════════════════
// HÀM RENDER NỘI DUNG ĐỀ THI
// ═══════════════════════════════════════════════════════════════════
#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1: Đo chiều cao bằng giác kế (Hình ngay ở đề bài kèm emoji)
#tn([Một kỹ sư trắc địa đặt giác kế có chiều cao $1.5" m"$ tại điểm $A$ cách chân tòa nhà $40" m"$. Góc nâng đo được từ giác kế lên đỉnh tòa nhà là $45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.08
    
    // Mặt đất
    line((-0.8, 0), (45 * sc, 0), stroke: 0.8pt + luma(100))
    
    // Tòa nhà kèm emoji
    rect((38 * sc, 0), (44 * sc, 41.5 * sc), fill: rgb("f8fafc"), stroke: 1.2pt + rgb("1e293b"))
    content((41 * sc, 20 * sc), text(size: 8pt, weight: "bold")[🏢 Tòa nhà])
    
    // Giác kế tại A
    let pA = (0, 1.5 * sc)
    line((0, 0), pA, stroke: 1.8pt + rgb("2563eb"))
    content((-0.4, 0.75 * sc), text(size: 7.5pt)[$1.5" m"$])
    content((0, 1.5 * sc + 0.3), [👁️])
    
    // Đường nằm ngang tầm mắt
    line(pA, (38 * sc, 1.5 * sc), stroke: (paint: luma(140), dash: "dashed", thickness: 0.6pt))
    content((19 * sc, 0.8 * sc), text(size: 8pt)[$40" m"$])
    
    // Tia ngắm lên đỉnh
    let pD = (38 * sc, 41.5 * sc)
    line(pA, pD, stroke: 1.2pt + rgb("dc2626"))
    
    // Góc nâng 45 độ chuẩn
    draw_angle_arc(pA, 0deg, 45deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.2, 1.5 * sc + 0.35), text(fill: rgb("d97706"), size: 8pt)[$45^circ$])
  })
]
Chiều cao của tòa nhà so với mặt đất bằng:],
    (
        [$40.0" m"$],
        True([$41.5" m"$]),
        [$42.5" m"$],
        [$38.5" m"$]
    ),
    loigiai: [
        Gọi chiều cao giác kế là $h_0 = 1.5" m"$, khoảng cách từ giác kế đến chân tòa nhà là $d = 40" m"$.
        Phần chiều cao tòa nhà phía trên tầm ngắm giác kế là:
        $ h_1 = d dot tan 45^circ = 40 dot 1 = 40" m" $
        Chiều cao thực tế của tòa nhà so với mặt đất:
        $ H = h_1 + h_0 = 40 + 1.5 = 41.5" m" $
    ]
)

// TN 2: Chiều rộng khúc sông vuông góc (Hình ngay ở đề bài kèm emoji)
#tn([Một người đứng ở vị trí $A$ bên bờ sông ngắm thẳng sang một cái cây $C$ ở bờ bên kia sao cho $A C$ vuông góc với bờ sông. Người đó đi dọc theo bờ sông một đoạn $A B = 50" m"$ rồi ngắm lại cây $C$ thì thấy góc $hat(A B C) = 30^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.06
    
    // Sông nước
    rect((-1, 0), (60 * sc, 30 * sc), fill: rgb("eff6ff"), stroke: none)
    line((-1, 0), (60 * sc, 0), stroke: 1pt + rgb("0284c7"))
    line((-1, 30 * sc), (60 * sc, 30 * sc), stroke: 1pt + rgb("0284c7"))
    content((25 * sc, 15 * sc), text(fill: rgb("93c5fd"), size: 8.5pt, weight: "bold")[🌊 Dòng sông])
    
    let pA = (0, 0)
    let pB = (50 * sc, 0)
    let pC = (0, 28.9 * sc)
    
    // Đoạn thẳng
    stroke(1.2pt + rgb("1e293b"))
    line(pA, pB)
    line(pA, pC)
    line(pB, pC)
    
    // Điểm và emoji
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((50 * sc, -0.35), text(weight: "bold")[$B$])
    content((0, 28.9 * sc + 0.45), [🌳])
    content((0.45, 28.9 * sc + 0.2), text(fill: rgb("059669"), weight: "bold")[$C$])
    
    content((25 * sc, -0.35), text(size: 8pt)[$50" m"$])
    content((-0.65, 14.5 * sc), text(fill: rgb("dc2626"), size: 8pt, weight: "bold")[$A C = ?$])
    
    // Góc 30 độ tại B
    draw_angle_arc(pB, 150deg, 180deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((50 * sc - 1.0, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$30^circ$])
  })
]
Chiều rộng $A C$ của khúc sông xấp xỉ bằng:],
    (
        [$25.0" m"$],
        True([$28.9" m"$]),
        [$35.4" m"$],
        [$43.3" m"$]
    ),
    loigiai: [
        Tam giác $A B C$ vuông tại $A$:
        $ A C = A B dot tan 30^circ = 50 dot (sqrt(3)/3) approx 28.87" m" approx 28.9" m" $
    ]
)

// TN 3: Độ cao mái taluy
#tn([Một mái taluy chống sạt lở của đường cao tốc có chiều dài mặt dốc là $12" m"$ và tạo với phương nằm ngang một góc $30^circ$. Độ cao của đỉnh mái dốc so với chân đường bằng:],
    (
        True([$6" m"$]),
        [$6 sqrt(3)" m"$],
        [$4" m"$],
        [$8" m"$]
    ),
    loigiai: [
        Độ cao đỉnh dốc là cạnh góc vuông đối diện góc $30^circ$:
        $ h = 12 dot sin 30^circ = 12 dot (1/2) = 6" m" $
    ]
)

// TN 4: Chiều dài nhịp cầu qua sông (Hình ngay ở đề bài kèm emoji)
#tn([Để xây dựng một cây cầu bắc qua sông nối hai mố cầu $A$ và $B$, từ điểm quan sát $C$ trên bờ, các kỹ sư đo được $C A = 80" m", C B = 120" m"$ và góc ngắm $hat(A C B) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.02
    
    let pC = (0, 0)
    let pA = (80 * 0.5 * sc, 80 * 0.866 * sc)
    let pB = (120 * sc, 0)
    
    // Tia ngắm CA và CB
    stroke(1.2pt + rgb("0284c7"))
    line(pC, pA)
    line(pC, pB)
    
    // Nhịp cầu AB
    stroke((paint: rgb("dc2626"), dash: "dashed", thickness: 2.2pt))
    line(pA, pB)
    content(((pA.at(0)+pB.at(0))/2, (pA.at(1)+pB.at(1))/2 + 0.4), [🌉])
    
    // Điểm
    circle(pC, radius: 2.5pt, fill: black)
    content((-0.4, 0), text(weight: "bold")[$C$])
    circle(pA, radius: 2.5pt, fill: rgb("dc2626"))
    content((pA.at(0), pA.at(1) + 0.35), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("dc2626"))
    content((pB.at(0) + 0.35, 0), text(weight: "bold")[$B$])
    
    content((pA.at(0)/2 - 0.45, pA.at(1)/2 + 0.2), text(fill: rgb("0284c7"), size: 8pt)[$80" m"$])
    content((60 * sc, -0.35), text(fill: rgb("0284c7"), size: 8pt)[$120" m"$])
    content(((pA.at(0)+pB.at(0))/2 + 0.6, pA.at(1)/2 - 0.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$A B = ?$])
    
    // Góc 60 độ tại C
    draw_angle_arc(pC, 0deg, 60deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 8pt)[$60^circ$])
  })
]
Chiều dài nhịp cầu $A B$ xấp xỉ bằng:],
    (
        [$100.0" m"$],
        True([$105.8" m"$]),
        [$112.5" m"$],
        [$95.2" m"$]
    ),
    loigiai: [
        Áp dụng định lý côsin trong tam giác $A B C$:
        $ A B^2 = C A^2 + C B^2 - 2 C A dot C B cos 60^circ = 80^2 + 120^2 - 2(80)(120)(1/2) $
        $ A B^2 = 6400 + 14400 - 9600 = 11200 => A B = sqrt(11200) = 40 sqrt(7) approx 105.83" m" $
    ]
)

// TN 5: Chân thang dựa tường (Hình ngay ở đề bài kèm emoji)
#tn([Một chiếc thang dài $5" m"$ được dựng tựa vào tường nhà. Để đảm bảo an toàn lao động, thang cần tạo với mặt đất nằm ngang một góc $65^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.6
    
    // Tường và đất
    line((-0.5, 0), (3 * sc, 0), stroke: 1pt + luma(100))
    line((2.11 * sc, 0), (2.11 * sc, 5.2 * sc), stroke: 2.5pt + luma(80))
    content((2.11 * sc + 0.6, 3 * sc), [🧱])
    
    let pGround = (0, 0)
    let pWall = (2.11 * sc, 4.53 * sc)
    
    // Chiếc thang
    stroke(3pt + rgb("b45309"))
    line(pGround, pWall)
    content((1 * sc - 0.2, 2.5 * sc + 0.3), [🪜])
    content((1 * sc - 0.2, 2.5 * sc - 0.1), text(fill: rgb("b45309"), weight: "bold", size: 8pt)[$5" m"$])
    
    // Góc 65 độ
    draw_angle_arc(pGround, 0deg, 65deg, radius: 0.6, stroke: 0.8pt + rgb("d97706"))
    content((0.8, 0.4), text(fill: rgb("d97706"), size: 8pt)[$65^circ$])
    
    // Khoảng cách x
    content((1.05 * sc, -0.35), text(fill: rgb("dc2626"), weight: "bold", size: 8pt)[$x = ?$])
  })
]
Khoảng cách an toàn từ chân thang đến chân tường nhà xấp xỉ bằng:],
    (
        [$4.53" m"$],
        [$1.85" m"$],
        True([$2.11" m"$]),
        [$2.45" m"$]
    ),
    loigiai: [
        Gọi $x$ là khoảng cách từ chân thang đến chân tường:
        $ x = 5 dot cos 65^circ approx 5 dot 0.4226 = 2.113" m" approx 2.11" m" $
    ]
)

// TN 6: Dây cáp néo cột truyền hình
#tn([Một cột ăng-ten phát sóng được giữ thăng bằng nhờ các sợi dây cáp néo nối từ đỉnh cột xuống các cọc néo dưới mặt đất cách chân cột $30" m"$. Biết sợi dây néo tạo với mặt bằng nằm ngang một góc $60^circ$. Chiều dài của mỗi sợi dây néo bằng:],
    (
        [$30 sqrt(3)" m"$],
        [$45" m"$],
        True([$60" m"$]),
        [$30" m"$]
    ),
    loigiai: [
        Gọi $L$ là độ dài dây néo:
        $ L = 30 / (cos 60^circ) = 30 / (1/2) = 60" m" $
    ]
)

// TN 7: Diện tích khu đất tam giác 30, 40, 50
#tn([Một khu đất xây dựng có ranh giới là tam giác $A B C$ với độ dài ba cạnh đo được lần lượt là $30" m", 40" m"$ và $50" m"$. Diện tích của khu đất này bằng:],
    (
        [$1200" m"^2$],
        True([$600" m"^2$]),
        [$800" m"^2$],
        [$750" m"^2$]
    ),
    loigiai: [
        Vì $30^2 + 40^2 = 900 + 1600 = 2500 = 50^2$, tam giác vuông tại góc xen giữa hai cạnh $30" m"$ và $40" m"$.
        Diện tích khu đất: $S = 1/2 dot 30 dot 40 = 600" m"^2$.
    ]
)

// TN 8: Khoảng cách giữa hai mốc trắc địa
#tn([Từ vị trí máy đo đạc $O$, kỹ sư ngắm tới hai cọc mốc trắc địa $P$ và $Q$. Biết khoảng cách $O P = 150" m", O Q = 200" m"$ và góc ngắm $hat(P O Q) = 120^circ$. Khoảng cách $P Q$ giữa hai cọc mốc xấp xỉ bằng:],
    (
        [$280.5" m"$],
        [$250.0" m"$],
        True([$304.1" m"$]),
        [$320.6" m"$]
    ),
    loigiai: [
        Theo định lý côsin trong tam giác $O P Q$:
        $ P Q^2 = 150^2 + 200^2 - 2(150)(200) cos 120^circ = 22500 + 40000 - 60000(- 1/2) $
        $ P Q^2 = 62500 + 30000 = 92500 => P Q = sqrt(92500) = 50 sqrt(37) approx 304.14" m" $
    ]
)

// TN 9: Bán kính đường cong khúc cua cao tốc
#tn([Một đoạn đường cong trên cao tốc được thiết kế uốn theo cung tròn ngoại tiếp tam giác tạo bởi ba điểm mốc $A, B, C$. Biết khoảng cách thẳng $A B = 200" m"$ và góc đối diện $hat(A C B) = 30^circ$. Bán kính cong $R$ của đoạn đường này bằng:],
    (
        [$100" m"$],
        True([$200" m"$]),
        [$400" m"$],
        [$200 sqrt(3)" m"$]
    ),
    loigiai: [
        Theo định lý sin:
        $ R = (A B) / (2 sin hat(A C B)) = 200 / (2 sin 30^circ) = 200 / (2 dot 1/2) = 200" m" $
    ]
)

// TN 10: Diện tích mặt cắt dầm bê tông
#tn([Một khối dầm bê tông chịu lực có mặt cắt ngang là hình tam giác với cạnh đáy dài $4" m"$ và chiều cao tương ứng là $1.5" m"$. Diện tích mặt cắt ngang của khối dầm bằng:],
    (
        [$6.0" m"^2$],
        True([$3.0" m"^2$]),
        [$4.5" m"^2$],
        [$2.0" m"^2$]
    ),
    loigiai: [
        Diện tích mặt cắt: $S = 1/2 dot 4 dot 1.5 = 3.0" m"^2$.
    ]
)

// TN 11: Góc dốc đoạn đường đèo
#tn([Một đoạn đường đèo lên núi dài $2" km"$, độ cao của điểm cuối cao hơn điểm đầu là $120" m"$. Góc dốc của đoạn đường so với mặt phẳng ngang xấp xỉ bằng:],
    (
        True([$3.44^circ$]),
        [$4.25^circ$],
        [$6.89^circ$],
        [$1.52^circ$]
    ),
    loigiai: [
        Đổi $2" km" = 2000" m"$. Gọi góc dốc là $alpha$:
        $ sin alpha = 120 / 2000 = 0.06 => alpha approx 3.44^circ $
    ]
)

// TN 12: Chiều dài dây cáp cần trục
#tn([Một cần trục xây dựng có tay cần dài $25" m"$ đang nâng khối vật liệu. Khi tay cần hợp với phương thẳng đứng một góc $40^circ$, khoảng cách theo phương ngang từ chân trục đến vị trí khối vật liệu xấp xỉ bằng:],
    (
        [$19.15" m"$],
        True([$16.07" m"$]),
        [$21.45" m"$],
        [$14.28" m"$]
    ),
    loigiai: [
        Khoảng cách theo phương ngang:
        $ d = 25 dot sin 40^circ approx 25 dot 0.6428 = 16.07" m" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1: Khảo sát tuyến hầm đường bộ xuyên núi (Hình ngay ở đề bài kèm emoji 🏔️)
#ds([Để chuẩn bị thi công tuyến hầm đường bộ xuyên núi nối hai cửa hầm $A$ và $B$, do địa hình hiểm trở không thể kéo dây đo trực tiếp, các kỹ sư đặt một trạm định vị trên đỉnh đồi $C$ có tầm quan sát bao quát cả $A$ và $B$. Thiết bị đo đạc ghi nhận khoảng cách $C A = 600" m", C B = 800" m"$ và góc ngắm $hat(A C B) = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.005
    
    // Ngọn núi kèm icon 🏔️
    fill(rgb("f8fafc"))
    stroke(1.2pt + luma(100))
    bezier((-100 * sc, 0), (1000 * sc, 0), (200 * sc, 800 * sc), (700 * sc, 900 * sc))
    content((550 * sc, 500 * sc), text(size: 20pt)[🏔️])
    
    // Tuyến hầm ngầm AB
    let pA = (50 * sc, 0)
    let pB = (850 * sc, 0)
    let pC = (400 * sc, 600 * sc)
    
    // Tuyến hầm nét đứt đôi
    stroke((paint: rgb("b45309"), dash: "dashed", thickness: 2.5pt))
    line(pA, pB)
    content(((pA.at(0) + pB.at(0))/2, -0.4), text(fill: rgb("b45309"), weight: "bold", size: 8.5pt)[Tuyến hầm $A B = ?$])
    
    // Tia ngắm từ trạm C
    stroke(1.2pt + rgb("2563eb"))
    line(pC, pA)
    line(pC, pB)
    
    // Các điểm mốc
    circle(pC, radius: 3pt, fill: rgb("dc2626"))
    content((pC.at(0), pC.at(1) + 0.45), text(fill: rgb("dc2626"), weight: "bold")[📡 $C$ (Trạm trắc địa)])
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.45, 0), text(weight: "bold")[$A$ (Cửa 1)])
    circle(pB, radius: 2.5pt, fill: black)
    content((pB.at(0) + 0.55, 0), text(weight: "bold")[$B$ (Cửa 2)])
    
    // Nhãn kích thước
    content((150 * sc, 350 * sc), text(fill: rgb("2563eb"), size: 8.5pt)[$C A = 600" m"$])
    content((680 * sc, 350 * sc), text(fill: rgb("2563eb"), size: 8.5pt)[$C B = 800" m"$])
    
    // Góc C chuẩn qua draw_angle_arc
    draw_angle_arc(pC, -125deg, -65deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((pC.at(0), pC.at(1) - 1.1), text(fill: rgb("d97706"), weight: "bold", size: 8pt)[$60^circ$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Tam giác $A B C$ có hai cạnh kề góc $hat(C) = 60^circ$ là $C A = 600" m"$ và $C B = 800" m"$.]),
    True([Chiều dài hầm $A B$ được tính theo định lý côsin: $A B^2 = C A^2 + C B^2 - 2 C A dot C B cos 60^circ$.]),
    True([Chiều dài thực tế của tuyến hầm xuyên núi là $A B = 200 sqrt(13)" m" approx 721.1" m"$.]),
    [Nếu hai mũi khoan đào hầm từ hai đầu $A$ và $B$ đạt tổng tốc độ đào $12" m/ngày"$ thì thời gian đào thông hầm sẽ kéo dài hơn $65$ ngày.]
  ),
  loigiai: [
    #step([Xác định các yếu tố tam giác ABC])
    Tam giác $A B C$ có hai cạnh $C A = 600" m", C B = 800" m"$ và góc kẹp giữa $hat(C) = 60^circ$. Do đó a) Đúng.

    #step([Áp dụng định lý côsin])
    $ A B^2 = C A^2 + C B^2 - 2 C A dot C B cos C $. Do đó b) Đúng.

    #step([Tính chiều dài tuyến hầm AB])
    $ A B^2 = 600^2 + 800^2 - 2(600)(800) cos 60^circ = 360000 + 640000 - 480000 = 520000 $
    $ => A B = sqrt(520000) = sqrt(40000 dot 13) = 200 sqrt(13)" m" approx 721.11" m" approx 721.1" m" $. Do đó c) Đúng.

    #step([Đánh giá tiến độ thi công])
    Thời gian đào thông hầm:
    $ t = (A B) / 12 approx 721.11 / 12 approx 60.09" ngày" < 65" ngày" $.
    Khẳng định thời gian kéo dài hơn 65 ngày là Sai. Do đó d) Sai.
  ]
)

// DS 2: Đo chiều cao tòa tháp bị chắn tường rào (Hình ngay ở đề bài kèm emoji 🗼)
#ds([Để đo chiều cao một tòa tháp viễn thông $C D$ ($C$ là chân tháp, $D$ là đỉnh tháp) dựng thẳng đứng mà chân tháp bị chắn bởi tường rào kiên cố, kỹ sư đặt máy kinh vĩ tại hai vị trí $A$ và $B$ trên mặt đất nằm ngang cách nhau $A B = 50" m"$ ($A, B, C$ thẳng hàng, $B$ ở giữa $A$ và $C$). Ống ngắm kinh vĩ cao $1.2" m"$ so với mặt đất. Góc nâng đo được từ $A$ lên đỉnh $D$ là $35^circ$, từ $B$ lên đỉnh $D$ là $50^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.05
    
    // Mặt đất
    line((-1, 0), (140 * sc, 0), stroke: 0.8pt + luma(100))
    
    // Trục tháp CD
    let pC = (120 * sc, 0)
    let pD = (120 * sc, (1.2 + 84.9) * sc)
    
    // Tháp cao tầng kèm icon 🗼
    stroke(3pt + rgb("1e293b"))
    line(pC, pD)
    content((pC.at(0) + 1.2, pD.at(1) / 2), text(weight: "bold")[🗼 Tháp $C D$])
    
    // Tường rào chắn
    rect((105 * sc, 0), (110 * sc, 15 * sc), fill: luma(180), stroke: 0.8pt)
    content((107.5 * sc, 8 * sc), [🧱])
    
    // Hai điểm đặt máy A và B
    let pA = (0, 1.2 * sc)
    let pB = (50 * sc, 1.2 * sc)
    
    // Đường nằm ngang tầm ngắm
    stroke((paint: luma(140), dash: "dashed", thickness: 0.6pt))
    line((0, 1.2 * sc), (120 * sc, 1.2 * sc))
    content((25 * sc, 0.4 * sc), text(size: 8pt)[$A B = 50" m"$])
    
    // Chân máy kinh vĩ
    line((0, 0), (0, 1.2 * sc), stroke: 1.5pt + rgb("0284c7"))
    line((50 * sc, 0), (50 * sc, 1.2 * sc), stroke: 1.5pt + rgb("0284c7"))
    content((-0.35, 1.2 * sc + 0.2), [👁️])
    content((50 * sc - 0.35, 1.2 * sc + 0.2), [👁️])
    
    // Tia ngắm AD và BD
    stroke(1pt + rgb("0284c7"))
    line(pA, pD)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pD)
    
    // Góc nâng chuẩn qua draw_angle_arc
    draw_angle_arc(pA, 0deg, 35deg, radius: 0.9, stroke: 0.8pt + rgb("059669"))
    content((1.3, 1.2 * sc + 0.35), text(fill: rgb("059669"), size: 8pt)[$35^circ$])
    draw_angle_arc(pB, 0deg, 50deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((50 * sc + 1.1, 1.2 * sc + 0.45), text(fill: rgb("d97706"), size: 8pt)[$50^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Trong tam giác $A B D$, góc $hat(A D B) = 50^circ - 35^circ = 15^circ$.]),
    True([Khoảng cách từ ống ngắm tại $B$ đến đỉnh tháp $D$ là $B D = (50 dot sin 35^circ) / (sin 15^circ) approx 110.8" m"$.]),
    True([Chiều cao của đỉnh tháp $D$ so với đường nằm ngang tầm ngắm xấp xỉ bằng $84.9" m"$.]),
    True([Chiều cao thực tế của tòa tháp so với mặt đất xấp xỉ bằng $86.1" m"$.])
  ),
  loigiai: [
    #step([Tính góc ADB])
    Trong tam giác $A B D$, góc ngoài tại $B$ bằng $50^circ$, do đó:
    $ hat(A D B) = 50^circ - 35^circ = 15^circ $. Do đó a) Đúng.

    #step([Áp dụng định lý sin tính BD])
    $ (B D) / (sin 35^circ) = (A B) / (sin 15^circ) => B D = (50 dot sin 35^circ) / (sin 15^circ) approx (50 dot 0.57358) / 0.25882 approx 110.81" m" $. Do đó b) Đúng.

    #step([Tính chiều cao phần trên tầm ngắm])
    Gọi $D_0$ là hình chiếu của $D$ lên đường nằm ngang qua $B$:
    $ D D_0 = B D dot sin 50^circ approx 110.81 dot 0.76604 approx 84.88" m" approx 84.9" m" $. Do đó c) Đúng.

    #step([Tính chiều cao tổng thể của tháp])
    Chiều cao so với mặt đất:
    $ H = D D_0 + 1.2 approx 84.88 + 1.2 = 86.08" m" approx 86.1" m" $. Do đó d) Đúng.
  ]
)

// DS 3: Tuyến cáp treo vượt đồi (Hình ngay ở đề bài kèm emoji 🚡)
#ds([Tuyến cáp treo lên đỉnh núi gồm hai chặng: chặng 1 từ ga xuất phát $A$ đến trụ chuyển tiếp $B$ có chiều dài cáp $A B = 800" m"$ với góc nghiêng $20^circ$ so với phương ngang; chặng 2 từ trụ $B$ đến ga đỉnh $C$ có chiều dài cáp $B C = 1200" m"$ với góc nghiêng dốc hơn là $35^circ$ so với phương ngang.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.003
    
    // Đường nằm ngang cơ sở
    line((0, 0), (2000 * sc, 0), stroke: 0.6pt + luma(160))
    
    let pA = (0, 0)
    let pB = (800 * 0.94 * sc, 800 * 0.342 * sc)
    let pC = (pB.at(0) + 1200 * 0.819 * sc, pB.at(1) + 1200 * 0.574 * sc)
    
    // Dây cáp treo hai nhịp
    stroke(2.2pt + rgb("0284c7"))
    line(pA, pB)
    stroke(2.2pt + rgb("2563eb"))
    line(pB, pC)
    
    // Cabin cáp treo emoji
    content((pB.at(0)/2, pB.at(1)/2 + 0.35), [🚡])
    content(((pB.at(0)+pC.at(0))/2, (pB.at(1)+pC.at(1))/2 + 0.35), [🚡])
    
    // Trụ B thẳng đứng
    stroke(1.2pt + luma(80))
    line((pB.at(0), 0), pB)
    content((pB.at(0), -0.3), text(size: 8pt)[Trụ $B$])
    
    // Trụ C ga đỉnh
    stroke(1.2pt + luma(80))
    line((pC.at(0), 0), pC)
    content((pC.at(0), -0.3), text(size: 8pt)[Ga đỉnh $C$])
    content((pC.at(0) + 0.5, pC.at(1) + 0.2), [🏔️])
    
    // Các điểm
    circle(pA, radius: 2.5pt, fill: black)
    content((pA.at(0) - 0.3, 0), text(weight: "bold")[$A$])
    circle(pB, radius: 2.5pt, fill: rgb("0284c7"))
    content((pB.at(0) - 0.3, pB.at(1) + 0.2), text(weight: "bold")[$B$])
    circle(pC, radius: 2.5pt, fill: rgb("2563eb"))
    content((pC.at(0) + 0.35, pC.at(1)), text(weight: "bold")[$C$])
    
    // Cung góc nghiêng 20 độ và 35 độ
    draw_angle_arc(pA, 0deg, 20deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.1, 0.2), text(fill: rgb("d97706"), size: 7.5pt)[$20^circ$])
    
    line(pB, (pB.at(0) + 300 * sc, pB.at(1)), stroke: (paint: luma(140), dash: "dotted", thickness: 0.6pt))
    draw_angle_arc(pB, 0deg, 35deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((pB.at(0) + 0.9, pB.at(1) + 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$35^circ$])
    
    // Nhãn chiều dài
    content((pB.at(0)/2 - 0.4, pB.at(1)/2 - 0.3), text(fill: rgb("0284c7"), size: 8.5pt)[$800" m"$])
    content(((pB.at(0)+pC.at(0))/2 - 0.4, (pB.at(1)+pC.at(1))/2 - 0.3), text(fill: rgb("2563eb"), size: 8.5pt)[$1200" m"$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ cao của trụ chuyển tiếp $B$ so với ga xuất phát $A$ là $h_1 = 800 dot sin 20^circ approx 273.6" m"$.]),
    True([Chênh lệch độ cao giữa ga đỉnh $C$ và trụ $B$ là $h_2 = 1200 dot sin 35^circ approx 688.3" m"$.]),
    True([Tổng chênh lệch độ cao từ ga xuất phát $A$ lên ga đỉnh $C$ xấp xỉ bằng $961.9" m"$.]),
    [Khoảng cách đường chim bay thẳng từ ga $A$ đến ga $C$ lớn hơn $2000" m"$.]
  ),
  loigiai: [
    #step([Tính chênh lệch độ cao chặng 1])
    $ h_1 = 800 dot sin 20^circ approx 800 dot 0.34202 = 273.62" m" approx 273.6" m" $. Do đó a) Đúng.

    #step([Tính chênh lệch độ cao chặng 2])
    $ h_2 = 1200 dot sin 35^circ approx 1200 dot 0.57358 = 688.29" m" approx 688.3" m" $. Do đó b) Đúng.

    #step([Tính tổng độ cao đỉnh núi so với ga A])
    $ h = h_1 + h_2 approx 273.62 + 688.29 = 961.91" m" approx 961.9" m" $. Do đó c) Đúng.

    #step([Đánh giá khoảng cách đường chim bay])
    Theo bất đẳng thức tam giác: $A C < A B + B C = 800 + 1200 = 2000" m"$.
    Do đó khoảng cách đường chim bay $A C$ không thể lớn hơn $2000" m"$. Khẳng định d) Sai.
  ]
)

// DS 4: Cột ăng-ten trên mái dốc (Hình ngay ở đề bài kèm emoji 📡)
#ds([Một cột ăng-ten thu sóng viễn thông $C D$ cao $10" m"$ được lắp đặt thẳng đứng trên một mái nhà dốc nghiêng $15^circ$ so với phương nằm ngang. Để cố định cột chống gió bão, người ta hàn hai dây cáp neo $D A$ và $D B$ từ đỉnh cột xuống hai chốt neo $A$ và $B$ trên mặt dốc mái ($A, C, B$ thẳng hàng theo đường dốc, $A$ ở phía sườn dốc thấp hơn, $B$ ở phía sườn dốc cao hơn). Biết khoảng cách $C A = 8" m"$ và $C B = 6" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.25
    
    // Mái dốc nghiêng 15 độ
    let pA = (-8 * 0.966 * sc, -8 * 0.259 * sc)
    let pC = (0, 0)
    let pB = (6 * 0.966 * sc, 6 * 0.259 * sc)
    
    stroke(2pt + luma(120))
    line(pA, pB)
    content((pB.at(0) + 1.2, pB.at(1) + 0.1), text(size: 8.5pt)[Mái dốc ($15^circ$)])
    
    // Cột ăng-ten CD thẳng đứng kèm icon 📡
    let pD = (0, 10 * sc)
    stroke(2.5pt + rgb("dc2626"))
    line(pC, pD)
    content((0, pD.at(1) + 0.45), [📡])
    content((0.4, 5 * sc), text(fill: rgb("dc2626"), weight: "bold", size: 8.5pt)[Cột $10" m"$])
    
    // Hai dây néo DA và DB
    stroke(1.2pt + rgb("0284c7"))
    line(pD, pA)
    stroke(1.2pt + rgb("059669"))
    line(pD, pB)
    
    // Cung góc DCA = 105 độ và DCB = 75 độ
    draw_angle_arc(pC, 90deg, 195deg, radius: 0.6, stroke: 0.8pt + rgb("0284c7"))
    content((-0.6, 0.6), text(fill: rgb("0284c7"), size: 7.5pt)[$105^circ$])
    
    draw_angle_arc(pC, 15deg, 90deg, radius: 0.5, stroke: 0.8pt + rgb("059669"))
    content((0.5, 0.4), text(fill: rgb("059669"), size: 7.5pt)[$75^circ$])
    
    // Các điểm
    circle(pC, radius: 2.5pt, fill: black)
    content((-0.3, -0.3), text(weight: "bold")[$C$])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pA.at(0) - 0.4, pA.at(1)), text(weight: "bold")[$A$])
    circle(pA, radius: 2.5pt, fill: rgb("0284c7"))
    circle(pB, radius: 2.5pt, fill: rgb("059669"))
    content((pB.at(0) + 0.4, pB.at(1)), text(weight: "bold")[$B$])
  })
]
Xét tính đúng sai của các khẳng định sau:],
  (
    True([Góc giữa cột ăng-ten thẳng đứng và sườn dốc phía dưới là $hat(D C A) = 90^circ + 15^circ = 105^circ$.]),
    True([Góc giữa cột ăng-ten thẳng đứng và sườn dốc phía trên là $hat(D C B) = 90^circ - 15^circ = 75^circ$.]),
    True([Chiều dài dây cáp neo phía dưới xấp xỉ bằng $D A approx 14.3" m"$.]),
    [Dây cáp neo phía trên $D B$ có chiều dài lớn hơn dây cáp neo phía dưới $D A$.]
  ),
  loigiai: [
    #step([Xác định các góc DCA và DCB])
    Vì cột $C D$ thẳng đứng và mái dốc nghiêng $15^circ$ so với phương ngang:
    - Góc phía sườn dốc thấp hơn: $hat(D C A) = 90^circ + 15^circ = 105^circ$. Do đó a) Đúng.
    - Góc phía sườn dốc cao hơn: $hat(D C B) = 90^circ - 15^circ = 75^circ$. Do đó b) Đúng.

    #step([Tính chiều dài dây cáp DA])
    Trong tam giác $D C A$, theo định lý côsin:
    $ D A^2 = C D^2 + C A^2 - 2 C D dot C A cos 105^circ = 10^2 + 8^2 - 2(10)(8) cos 105^circ $
    $ D A^2 = 100 + 64 - 160(- 0.25882) = 164 + 41.41 = 205.41 => D A approx sqrt(205.41) approx 14.33" m" approx 14.3" m" $. Do đó c) Đúng.

    #step([Tính chiều dài dây cáp DB])
    Trong tam giác $D C B$:
    $ D B^2 = C D^2 + C B^2 - 2 C D dot C B cos 75^circ = 10^2 + 6^2 - 2(10)(6) cos 75^circ $
    $ D B^2 = 100 + 36 - 120(0.25882) = 136 - 31.06 = 104.94 => D B approx sqrt(104.94) approx 10.24" m" $.
    Vì $D B approx 10.2" m" < D A approx 14.3" m"$, khẳng định dây $D B$ dài hơn $D A$ là Sai. Do đó d) Sai.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1: Góc dốc mái ngói (Hình ngay ở đề bài kèm emoji 🏠)
#tln([Một vì kèo mái ngói tam giác cân $A B C$ có nhịp đáy $A B = 10" m"$ và hai cạnh mái $C A = C B = 6" m"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.5
    
    let pA = (0, 0)
    let pB = (10 * sc, 0)
    let pH = (5 * sc, 0)
    let pC = (5 * sc, calc.sqrt(36 - 25) * sc)
    
    stroke(1.8pt + rgb("b45309"))
    line(pA, pC)
    line(pC, pB)
    stroke(1pt + luma(100))
    line(pA, pB)
    stroke((paint: rgb("2563eb"), dash: "dashed", thickness: 0.8pt))
    line(pC, pH)
    
    content((5 * sc, pC.at(1) + 0.45), [🏠])
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$A$])
    circle(pB, radius: 2pt, fill: black)
    content((10 * sc, -0.3), text(weight: "bold")[$B$])
    circle(pH, radius: 1.5pt, fill: black)
    content((5 * sc, -0.3), text(weight: "bold")[$H$])
    
    content((2.5 * sc - 0.4, pC.at(1)/2 + 0.2), text(fill: rgb("b45309"), size: 8pt)[$6" m"$])
    content((2.5 * sc, -0.3), text(size: 8pt)[$5" m"$])
    
    draw_angle_arc(pA, 0deg, 34deg, radius: 0.8, stroke: 0.8pt + rgb("d97706"))
    content((1.1, 0.3), text(fill: rgb("d97706"), size: 7.5pt)[$alpha$])
  })
]
Tính góc dốc của mái ngói (góc $hat(C A B)$) làm tròn đến hàng đơn vị theo độ.],
    [34],
    loigiai: [
        #step([Xác định tam giác vuông])
        Gọi $H$ là trung điểm của đáy $A B$. Vì tam giác $A B C$ cân tại $C$ nên $C H perp A B$:
        $ A H = (A B) / 2 = 10 / 2 = 5" m" $
        
        #step([Tính góc dốc])
        Trong tam giác vuông $A H C$:
        $ cos hat(C A B) = (A H) / (C A) = 5 / 6 approx 0.8333 => hat(C A B) approx 33.56^circ $
        Làm tròn đến hàng đơn vị ta được $34^circ$.
    ]
)

// TLN 2: Chiều rộng sông ngắm góc
#tln([Hai người quan sát đứng tại hai điểm $A$ và $B$ dọc bờ sông cách nhau $60" m"$, cùng nhìn sang một gốc cây $C$ ở bờ đối diện. Đo được $hat(C A B) = 60^circ$ và $hat(C B A) = 45^circ$. Tính khoảng cách ngắn nhất từ gốc cây $C$ đến bờ sông chứa đoạn $A B$ (làm tròn đến hàng đơn vị theo mét).],
    [38],
    loigiai: [
        #step([Tính góc C trong tam giác ABC])
        $ hat(A C B) = 180^circ - (60^circ + 45^circ) = 75^circ $
        
        #step([Tính cạnh AC theo định lý sin])
        $ (A C) / (sin 45^circ) = (A B) / (sin 75^circ) => A C = (60 dot sin 45^circ) / (sin 75^circ) = (60 dot (sqrt(2)/2)) / ((sqrt(6) + sqrt(2))/4) = 60(sqrt(3) - 1)" m" $
        
        #step([Tính chiều rộng khúc sông])
        Khoảng cách ngắn nhất từ $C$ đến bờ $A B$ là chiều cao $C H$:
        $ C H = A C dot sin 60^circ = 60(sqrt(3) - 1) dot sqrt(3)/2 = 30(3 - sqrt(3)) approx 30(3 - 1.732) = 38.04" m" $
        Làm tròn đến hàng đơn vị ta được $38" m"$.
    ]
)

// TLN 3: Độ dài dây néo tháp đồi
#tln([Một tháp ăng-ten cao $45" m"$ được dựng vuông góc với sườn đồi. Người ta kéo dây néo từ đỉnh tháp xuống một mốc cố định trên mặt đồi cách chân tháp một khoảng bằng $24" m"$. Tính độ dài sợi dây néo (đơn vị: mét).],
    [51],
    loigiai: [
        #step([Áp dụng định lý Pytago])
        Vì tháp dựng vuông góc với sườn đồi nên tam giác tạo bởi tháp, mặt đồi và dây néo là tam giác vuông:
        $ L = sqrt(45^2 + 24^2) = sqrt(2025 + 576) = sqrt(2601) = 51" m" $
        Vậy độ dài sợi dây néo là $51" m"$.
    ]
)

// TLN 4: Bán kính cong cầu vòm
#tln([Một nhịp cầu vòm uốn cong theo cung tròn của một đường tròn tâm $O$. Hai chân mố cầu $A$ và $B$ cách nhau một khoảng thẳng $A B = 120" m"$. Góc ở tâm chắn cung $A B$ là $hat(A O B) = 120^circ$. Tính bán kính cong $R = O A$ của nhịp cầu (làm tròn đến hàng đơn vị theo mét).],
    [69],
    loigiai: [
        #step([Mô hình hóa hình học])
        Tam giác $O A B$ cân tại $O$ với $O A = O B = R$ và $hat(A O B) = 120^circ$.
        
        #step([Tính bán kính R])
        Kẻ đường cao $O H$ xuống $A B$, ta có $A H = (A B) / 2 = 60" m"$ và $hat(A O H) = 60^circ$:
        $ R = (A H) / (sin 60^circ) = 60 / (sqrt(3)/2) = 120 / sqrt(3) = 40 sqrt(3) approx 69.28" m" $
        Làm tròn đến hàng đơn vị ta được $69" m"$.
    ]
)

// TLN 5: Chiều cao ngọn núi đá vôi (Hình ngay ở đề bài kèm emoji 🏔️)
#tln([Để đo chiều cao một ngọn núi đá vôi thẳng đứng, người ta đo góc nâng từ trạm $A$ lên đỉnh núi được $30^circ$. Đi thẳng về phía chân núi một đoạn $100" m"$ đến trạm $B$, góc nâng đo được tăng lên thành $45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let sc = 0.015
    
    // Mặt đất
    line((-1, 0), (280 * sc, 0), stroke: 0.8pt + luma(100))
    
    let pA = (0, 0)
    let pB = (100 * sc, 0)
    let pH = ((100 + 137) * sc, 0)
    let pD = (pH.at(0), 137 * sc)
    
    // Núi đá vôi kèm emoji 🏔️
    fill(rgb("f8fafc"))
    stroke(1.2pt + luma(80))
    line(pH, pD)
    bezier(pD, (pH.at(0) + 40 * sc, 0), (pH.at(0) + 20 * sc, 100 * sc), (pH.at(0) + 35 * sc, 40 * sc))
    line((pH.at(0) + 40 * sc, 0), pH)
    content((pH.at(0) + 1.2, pD.at(1)/2), [🏔️])
    
    // Tia ngắm
    stroke(1.2pt + rgb("0284c7"))
    line(pA, pD)
    stroke(1.2pt + rgb("2563eb"))
    line(pB, pD)
    
    circle(pA, radius: 2pt, fill: black)
    content((0, -0.3), text(weight: "bold")[$A$])
    content((0, 0.3), [👁️])
    circle(pB, radius: 2pt, fill: black)
    content((pB.at(0), -0.3), text(weight: "bold")[$B$])
    content((pB.at(0), 0.3), [👁️])
    circle(pD, radius: 2.5pt, fill: rgb("dc2626"))
    content((pD.at(0), pD.at(1) + 0.35), text(weight: "bold")[$D$ (Đỉnh)])
    
    content((50 * sc, -0.3), text(size: 8pt)[$100" m"$])
    
    draw_angle_arc(pA, 0deg, 30deg, radius: 0.8, stroke: 0.8pt + rgb("059669"))
    content((1.1, 0.25), text(fill: rgb("059669"), size: 7.5pt)[$30^circ$])
    
    draw_angle_arc(pB, 0deg, 45deg, radius: 0.7, stroke: 0.8pt + rgb("d97706"))
    content((pB.at(0) + 0.9, 0.35), text(fill: rgb("d97706"), size: 7.5pt)[$45^circ$])
  })
]
Tính chiều cao của ngọn núi (làm tròn đến hàng đơn vị theo mét).],
    [137],
    loigiai: [
        #step([Lập phương trình chiều cao])
        Gọi chiều cao ngọn núi là $h > 0$.
        Từ trạm $A$, khoảng cách đến chân núi: $d_A = h / (tan 30^circ) = h sqrt(3)$.
        Từ trạm $B$, khoảng cách đến chân núi: $d_B = h / (tan 45^circ) = h$.
        
        #step([Giải tìm h])
        $ d_A - d_B = 100 <=> h(sqrt(3) - 1) = 100 => h = 100 / (sqrt(3) - 1) = 50(sqrt(3) + 1) approx 50(2.73205) = 136.6" m" $
        Làm tròn đến hàng đơn vị ta được $137" m"$.
    ]
)

// TLN 6: Vận dụng cao - Tối ưu hóa góc nhìn tháp canh rừng (Hình ngay ở đề bài kèm emoji 🌲)
#tln([Một chòi quan sát cháy rừng có thân tháp $A B$ cao $32" m"$ đặt thẳng đứng trên sườn đồi. Đội kiểm lâm đặt trạm trực dã chiến tại điểm $M$ sao cho đường gióng ngang tầm mắt cắt trục thẳng đứng của tháp tại điểm $O$ nằm dưới chân tháp $B$, với $O B = 4" m"$ (chân tháp cách tầm mắt $4" m"$) và đỉnh tháp $A$ cách tầm mắt $O A = 36" m"$.
#align(center)[
    #cetz.canvas({
        import cetz.draw: *
        set-style(stroke: 0.8pt)
        let sc = 0.12
        
        // Trục tháp thẳng đứng
        line((16 * sc, -4 * sc), (16 * sc, 42 * sc), stroke: 2.2pt + luma(100))
        content((16 * sc + 1.8, 38 * sc), text(weight: "bold")[Tháp canh 🌲])
        
        // Đường gióng ngang tầm mắt
        line((0, 0), (16 * sc, 0), stroke: (paint: luma(120), dash: "dashed", thickness: 0.8pt))
        content((8 * sc, -0.6), text(size: 8.5pt)[$x = O M$])
        
        let pM = (0, 0)
        let pO = (16 * sc, 0)
        let pB = (16 * sc, 4 * sc)
        let pA = (16 * sc, 36 * sc)
        
        // Thân tháp AB tô màu cam đỏ nổi bật
        line(pB, pA, stroke: 5pt + rgb("ea580c"))
        content((16 * sc + 2.5, 20 * sc), text(fill: rgb("ea580c"), weight: "bold")[Tháp ($32" m"$)])
        
        // Tia nhìn
        line(pM, pB, stroke: 1pt + rgb("0284c7"))
        line(pM, pA, stroke: 1.2pt + rgb("2563eb"))
        
        // Các điểm
        circle(pM, radius: 2.5pt, fill: black)
        content((-0.8, 0), text(weight: "bold")[👁️ $M$])
        circle(pO, radius: 2pt, fill: black)
        content((16 * sc + 0.35, -0.3), text(weight: "bold")[$O$])
        circle(pB, radius: 2.5pt, fill: rgb("ea580c"))
        content((16 * sc + 0.4, 4 * sc), text(weight: "bold")[$B (4" m")$])
        circle(pA, radius: 2.5pt, fill: rgb("ea580c"))
        content((16 * sc + 0.4, 36 * sc), text(weight: "bold")[$A (36" m")$])
        
        // Cung góc alpha chuẩn qua draw_angle_arc
        draw_angle_arc(pM, 14deg, 62deg, radius: 1.4, stroke: 1pt + rgb("dc2626"))
        content((1.2, 1.1), text(fill: rgb("dc2626"), weight: "bold")[$alpha$])
    })
]
Hỏi đội kiểm lâm cần đặt trạm trực cách trục tháp một khoảng cách $x = O M$ bằng bao nhiêu mét để góc quan sát toàn bộ thân tháp $hat(A M B)$ đạt giá trị lớn nhất?],
    [12],
    loigiai: [
        #step([Mô hình hóa hình học và biểu diễn góc nhìn])
        Gọi khoảng cách từ trạm trực đến trục tháp là $x = O M > 0$.
        Tam giác $M O A$ vuông tại $O$ có $tan hat(A M O) = (O A) / x = 36 / x$.
        Tam giác $M O B$ vuông tại $O$ có $tan hat(B M O) = (O B) / x = 4 / x$.
        
        Góc nhìn bao quát toàn bộ thân tháp là $alpha = hat(A M B) = hat(A M O) - hat(B M O)$.

        #step([Biến đổi lượng giác])
        $ tan alpha = tan(hat(A M O) - hat(B M O)) = (tan hat(A M O) - tan hat(B M O)) / (1 + tan hat(A M O) dot tan hat(B M O)) $
        $ tan alpha = (36/x - 4/x) / (1 + (36/x)(4/x)) = (32/x) / (1 + 144 / x^2) = 32 / (x + 144 / x) $
        
        #step([Áp dụng bất đẳng thức Cauchy tìm giá trị lớn nhất])
        Vì $x > 0$, áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $144 / x$:
        $ x + 144 / x >= 2 sqrt(x dot 144 / x) = 2 sqrt(144) = 2 dot 12 = 24 $
        Suy ra:
        $ tan alpha <= 32 / 24 = 4 / 3 $
        Góc $alpha$ đạt giá trị lớn nhất khi và chỉ khi:
        $ x = 144 / x <=> x^2 = 144 <=> x = sqrt(144) = 12" m" quad (text("do ") x > 0) $
        Vậy trạm trực cần đặt cách tháp $12" m"$.
    ]
)

] // end make-questions

// Gọi hàm render để hiển thị
#make-questions()
