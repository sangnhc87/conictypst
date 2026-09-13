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
#let accent = rgb("1d4ed8") // Royal Blue

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10",
  school: "CHUYÊN ĐỀ TOÁN THỰC TẾ",
  exam-title: "BÀI TẬP CUỐI CHƯƠNG IV: MÔ HÌNH HÓA VECTƠ (ĐỀ D: CƠ HỌC CÔNG TRÌNH & HÀNG HẢI - VD, VDC)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "119",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1 (VD - Cáp treo dầm cầu)
#tn([Một đoạn dầm bê tông đúc sẵn của một cây cầu vượt có trọng lượng $P = 200" kN"$ được giữ cân bằng tĩnh bởi hai nhánh dây cáp cần cẩu đối xứng nhau qua phương thẳng đứng, mỗi nhánh dây cáp hợp với phương thẳng đứng một góc $alpha = 30^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 2.5)
    let pA = (-1.5, 0.5)
    let pB = (1.5, 0.5)
    line(pO, pA, stroke: 1.8pt + rgb("1d4ed8"))
    line(pO, pB, stroke: 1.8pt + rgb("1d4ed8"))
    rect((-2.0, 0), (2.0, 0.5), fill: rgb("eff6ff"), stroke: 1.2pt + luma(100))
    content((0, 0.25), [🌉 Dầm cầu ($200" kN"$)])
    line((0, 0.25), (0, -1.0), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((0.3, -1.0), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(P)$])
    line(pO, (0, 1.2), stroke: (paint: luma(140), dash: "dashed"))
    draw_angle_arc(pO, -90deg, -125deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((-0.3, 1.7), text(fill: rgb("dc2626"), size: 7.5pt)[$30^circ$])
    circle(pO, radius: 2.5pt, fill: black)
    content((0, 2.75), [Móc cẩu $O$])
  })
]
Độ lớn lực căng trong mỗi nhánh dây cáp bằng],
    (
        True([$(200 sqrt(3)) / 3" kN" approx 115.47" kN"$]),
        [$100" kN"$],
        [$200" kN"$],
        [$100 sqrt(3)" kN" approx 173.21" kN"$]
    ),
    loigiai: [
        Gọi lực căng trong hai nhánh cáp là $vec(T)_1$ và $vec(T)_2$. Do tính đối xứng nên $T_1 = T_2 = T$.
        Hợp lực của hai lực căng cáp là $vec(T)_(12) = vec(T)_1 + vec(T)_2$ có phương thẳng đứng hướng lên.
        Để dầm cầu cân bằng tĩnh: $vec(T)_(12) + vec(P) = vec(0) => T_(12) = P = 200" kN"$.
        Theo quy tắc hình thoi:
        $ T_(12) = 2 T cos alpha <=> 2 T cos 30^circ = 200 <=> 2 T dot (sqrt(3)) / 2 = 200 <=> T sqrt(3) = 200 $
        $ => T = 200 / sqrt(3) = (200 sqrt(3)) / 3" kN" approx 115.47" kN" $
    ]
)

// TN 2 (VD - Máy bay cất cánh ngược gió)
#tn([Một máy bay cất cánh từ đường băng với vận tốc máy đối với không khí $vec(v)_m$ có độ lớn $260" km/h"$ hướng theo phương hợp với mặt đất một góc nghiêng $12^circ$. Gió thổi ngược chiều bay theo phương ngang với tốc độ $v_g = 20" km/h"$. Tốc độ bay theo phương ngang của máy bay đối với mặt đất bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + luma(120))
    let pO = (0.5, 0)
    line(pO, (3.5, 1.2), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((2.5, 1.3), text(fill: rgb("1d4ed8"), size: 8.5pt)[$vec(v)_m$])
    line((3.5, 0.4), (2.0, 0.4), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.75, 0.65), text(fill: rgb("0d9488"), size: 8pt)[Gió $vec(v)_g$])
    content(pO, [✈️], anchor: "north")
    draw_angle_arc(pO, 0deg, 22deg, radius: 0.8, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.2), text(fill: rgb("dc2626"), size: 7.5pt)[$12^circ$])
  })
]],
    (
        True([$approx 234.3" km/h"$]),
        [$240.0" km/h"$],
        [$274.3" km/h"$],
        [$254.3" km/h"$]
    ),
    loigiai: [
        Vận tốc thực tế của máy bay đối với mặt đất: $vec(v) = vec(v)_m + vec(v)_g$.
        Chiếu lên trục nằm ngang song song mặt đất theo hướng bay:
        $ v_x = v_m cos 12^circ - v_g = 260 dot cos 12^circ - 20 approx 260 dot 0.9781 - 20 approx 254.32 - 20 = 234.32" km/h" $
    ]
)

// TN 3 (VD - Thuyền vượt sông sang đúng bờ đối diện)
#tn([Một chiếc thuyền muốn di chuyển qua một con sông rộng để cập bến đúng vị trí đối diện trực tiếp ở bờ bên kia. Vận tốc dòng nước chảy xiết có độ lớn $u = 3" m/s"$. Động cơ của thuyền tạo vận tốc đối với nước có độ lớn $v_0 = 5" m/s"$. Mũi thuyền phải hướng chếch ngược dòng một góc $alpha$ so với bờ sông bằng bao nhiêu để thuyền đi theo đường thẳng vuông góc với hai bờ?
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 2.5), (4.5, 2.5), stroke: 1.5pt + rgb("0284c7"))
    line((-0.5, 0), (4.5, 0), stroke: 1.5pt + rgb("0284c7"))
    let pA = (2.0, 0)
    let pB = (2.0, 2.5)
    line(pA, pB, stroke: (paint: rgb("dc2626"), dash: "dashed"))
    line(pA, (0.5, 2.0), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((0.8, 1.3), text(fill: rgb("1d4ed8"), size: 8.5pt)[$vec(v)_0$])
    line((0.5, 2.0), (2.0, 2.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((1.25, 2.25), text(fill: rgb("0d9488"), size: 8pt)[$vec(u)$])
    line(pA, (2.0, 2.0), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.3, 1.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pA, [⛵], anchor: "north")
    draw_angle_arc(pA, 90deg, 127deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((1.6, 0.7), text(fill: rgb("dc2626"), size: 8pt)[$beta$])
  })
]],
    (
        True([$approx 53.13^circ$]),
        [$36.87^circ$],
        [$60.00^circ$],
        [$45.00^circ$]
    ),
    loigiai: [
        Để quỹ đạo chuyển động thực tế $vec(v) = vec(v)_0 + vec(u)$ vuông góc với bờ sông thì thành phần vận tốc ngược dòng của thuyền phải triệt tiêu vận tốc dòng chảy:
        Gọi $beta$ là góc giữa hướng mũi thuyền và phương vuông góc bờ sông:
        $ sin beta = u / v_0 = 3 / 5 = 0.6 => beta approx 36.87^circ $
        Góc $alpha$ hợp bởi mũi thuyền và bờ sông là:
        $ alpha = 90^circ - beta = 90^circ - 36.87^circ = 53.13^circ $
    ]
)

// TN 4 (VD - Xe vượt dốc có ma sát)
#tn([Một chiếc ô tô tải có trọng lượng $P = 50" kN"$ đang leo lên một con dốc nghiêng $alpha = 10^circ$ với tốc độ không đổi. Hệ số ma sát lăn giữa bánh xe và mặt đường là $mu = 0.05$. Lực kéo động cơ tối thiểu theo phương song song mặt dốc bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + luma(120))
    line((0, 0), (4.0, 1.8), stroke: 1.5pt + rgb("1d4ed8"))
    rect((1.6, 0.72), (2.8, 1.35), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1d4ed8"))
    content((2.2, 1.05), [🚚])
    draw_angle_arc((0, 0), 0deg, 24deg, radius: 0.9, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.25), text(fill: rgb("dc2626"), size: 8pt)[$10^circ$])
  })
]],
    (
        True([$approx 11.14" kN"$]),
        [$8.68" kN"$],
        [$2.46" kN"$],
        [$15.20" kN"$]
    ),
    loigiai: [
        Khi xe leo dốc đều, lực kéo động cơ $vec(F)_k$ cân bằng với thành phần trọng lực kéo xuống và lực ma sát:
        $ F_k = P sin alpha + F_(m s) = P sin alpha + mu P cos alpha $
        Thay số:
        $ F_k = 50 dot sin 10^circ + 0.05 dot 50 dot cos 10^circ approx 50(0.1736) + 2.5(0.9848) = 8.68 + 2.46 = 11.14" kN" $
    ]
)

// TN 5 (VD - Trụ giàn khoan neo 3 hướng)
#tn([Một trụ giàn khoan ngoài khơi được neo giữ vững chắc bởi ba sợi cáp thép ngầm dưới đáy biển đồng quy tại $O$. Ba sợi cáp nằm trong mặt phẳng nằm ngang, tạo thành ba góc bằng nhau $120^circ$. Lực căng ở hai sợi cáp lần lượt là $T_1 = 600" kN"$ và $T_2 = 600" kN"$. Để trụ giàn khoan không bị trôi dạt (hợp lực theo phương ngang triệt tiêu), lực căng $T_3$ của sợi cáp thứ ba phải bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, 2.2), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((0.4, 2.2), text(fill: rgb("1d4ed8"), size: 8.5pt)[$vec(T)_1$])
    line(pO, (-1.9, -1.1), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((-2.1, -1.2), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(T)_2$])
    line(pO, (1.9, -1.1), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((2.1, -1.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(T)_3$])
    circle(pO, radius: 3pt, fill: black)
    content((-0.2, 0.3), [🏗️ $O$])
    draw_angle_arc(pO, 90deg, 210deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
    content((-0.6, 0.5), text(fill: rgb("dc2626"), size: 7.5pt)[$120^circ$])
  })
]],
    (
        True([$600" kN"$]),
        [$1200" kN"$],
        [$600 sqrt(3)" kN"$],
        [$300" kN"$]
    ),
    loigiai: [
        Hợp lực của hai lực căng $vec(T)_1$ và $vec(T)_2$ hợp nhau góc $120^circ$:
        $ T_(12)^2 = T_1^2 + T_2^2 + 2 T_1 T_2 cos 120^circ = 600^2 + 600^2 + 2(600^2)(-1/2) = 600^2 => T_(12) = 600" kN" $
        Theo tính chất hình thoi có góc $120^circ$, vectơ hợp lực $vec(T)_(12)$ nằm trên đường phân giác và ngược hướng với $vec(T)_3$.
        Để hệ cân bằng: $vec(T)_(12) + vec(T)_3 = vec(0) => T_3 = T_(12) = 600" kN"$.
    ]
)

// TN 6 (VD - Cực trị lực kéo vật trượt sàn)
#tn([Một kiện hàng khối lượng $m = 40" kg"$ được kéo trượt đều trên sàn nhà nằm ngang bởi một sợi dây xiên góc $alpha$ so với phương ngang. Hệ số ma sát trượt giữa sàn và kiện hàng là $mu = 0.25$ (lấy $g = 10" m/s"^2$). Góc kéo $alpha$ để lực kéo $F$ có độ lớn nhỏ nhất là
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + luma(120))
    rect((0.8, 0), (2.2, 1.0), fill: rgb("eff6ff"), stroke: 1.5pt + rgb("1d4ed8"))
    content((1.5, 0.5), [📦 Kiện hàng])
    line((2.2, 0.5), (3.8, 1.5), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((4.0, 1.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    line((2.2, 0.5), (3.8, 0.5), stroke: (paint: luma(140), dash: "dashed"))
    draw_angle_arc((2.2, 0.5), 0deg, 32deg, radius: 0.6, stroke: 1pt + rgb("dc2626"))
    content((2.9, 0.7), text(fill: rgb("dc2626"), size: 8pt)[$alpha$])
  })
]],
    (
        True([$alpha approx 14.04^circ$ (thỏa mãn $tan alpha = mu$)]),
        [$alpha = 30.00^circ$],
        [$alpha = 45.00^circ$],
        [$alpha = 0^circ$]
    ),
    loigiai: [
        Khi kiện hàng trượt thẳng đều, phương trình cân bằng lực chiếu theo phương thẳng đứng và phương ngang:
        $ cases(N + F sin alpha - P = 0 => N = P - F sin alpha, F cos alpha - F_(m s) = 0 => F cos alpha - mu N = 0) $
        $ F cos alpha - mu (P - F sin alpha) = 0 <=> F(cos alpha + mu sin alpha) = mu P $
        $ => F = (mu m g) / (cos alpha + mu sin alpha) $
        Theo bất đẳng thức Cauchy - Schwarz hoặc biến đổi lượng giác:
        $ cos alpha + mu sin alpha <= sqrt(1 + mu^2) $
        Do đó lực kéo $F$ đạt giá trị nhỏ nhất khi $tan alpha = mu$:
        $ tan alpha = 0.25 => alpha = arctan(0.25) approx 14.04^circ $
    ]
)

// TN 7 (VD - Công suất đầu máy tàu hỏa)
#tn([Một đoàn tàu hỏa có khối lượng $M = 500" tấn"$ chạy thẳng đều trên đường ray nằm ngang với tốc độ $v = 72" km/h"$ ($20" m/s"$). Hệ số cản chuyển động tổng cộng là $k = 0.006$ (lấy $g = 10" m/s"^2$). Công suất tức thời do đầu máy tàu hỏa sản sinh bằng],
    (
        True([$600" kW"$]),
        [$300" kW"$],
        [$1200" kW"$],
        [$720" kW"$]
    ),
    loigiai: [
        Lực cản tác dụng lên đoàn tàu:
        $ F_c = k M g = 0.006 dot (500000" kg") dot (10" m/s"^2) = 30000" N" = 30" kN" $
        Vì tàu chạy thẳng đều nên lực kéo của đầu máy bằng lực cản: $F_k = F_c = 30000" N"$.
        Công suất tức thời:
        $ P = vec(F)_k dot vec(v) = F_k dot v dot cos 0^circ = 30000 dot 20 = 600000" W" = 600" kW" $
    ]
)

// TN 8 (VD - Cẩu trục cảng biển)
#tn([Một chiếc cẩu giàn cảng biển nâng một thùng container $20$ feet có khối lượng $20" tấn"$ lên cao $15" m"$ theo phương thẳng đứng, đồng thời xe con cẩu di chuyển ngang dầm cẩu một đoạn $20" m"$. Độ lớn vectơ dịch chuyển tổng hợp của thùng container bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.5)
    let pB = (3.5, 2.5)
    line(pA, (3.5, 0.5), stroke: (paint: luma(140), dash: "dashed"))
    line((3.5, 0.5), pB, stroke: (paint: luma(140), dash: "dashed"))
    line(pA, pB, mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((1.8, 1.8), text(fill: rgb("1d4ed8"), size: 8.5pt, weight: "bold")[$vec(d)$])
    content(pA, [🚢 $A$], anchor: "north-east")
    content(pB, [📦 $B$], anchor: "south-west")
    draw_angle_arc((3.5, 0.5), 90deg, 180deg, radius: 0.3, stroke: 1pt + rgb("dc2626"))
  })
]],
    (
        True([$25" m"$]),
        [$35" m"$],
        [$28.28" m"$],
        [$20" m"$]
    ),
    loigiai: [
        Hai chuyển động thành phần (nâng thẳng đứng $15" m"$ và dịch chuyển ngang $20" m"$) có phương vuông góc với nhau.
        Độ lớn vectơ dịch chuyển tổng hợp:
        $ d = sqrt(d_x^2 + d_y^2) = sqrt(20^2 + 15^2) = sqrt(400 + 225) = sqrt(625) = 25" m" $
    ]
)

// TN 9 (VD - Mô men kéo sà lan trên kênh hẹp)
#tn([Một chiếc sà lan chuyển động thẳng đều trên kênh. Máy tời kéo sà lan với lực kéo $F = 5000" N"$ hợp với trục tim kênh một góc $alpha = 45^circ$. Thành phần lực kéo dọc theo kênh làm sà lan tiến tới ($F_x$) và thành phần lực làm sà lan có xu hướng dạt vào bờ ($F_y$) lần lượt bằng],
    (
        True([$F_x = 2500 sqrt(2)" N", F_y = 2500 sqrt(2)" N"$]),
        [$F_x = 5000" N", F_y = 0" N"$],
        [$F_x = 2500" N", F_y = 2500" N"$],
        [$F_x = 4000" N", F_y = 3000" N"$]
    ),
    loigiai: [
        Phân tích vectơ lực $vec(F)$ thành hai thành phần trực giao:
        $ F_x = F cos 45^circ = 5000 dot (sqrt(2))/2 = 2500 sqrt(2)" N" $
        $ F_y = F sin 45^circ = 5000 dot (sqrt(2))/2 = 2500 sqrt(2)" N" $
    ]
)

// TN 10 (VD - Tàu hàng tránh đá ngầm)
#tn([Trong mặt phẳng hải đồ $O x y$ (đơn vị: hải lý), một bãi đá ngầm nguy hiểm có tâm tại $I(5; 6)$ và bán kính $R = 2$ hải lý. Một tàu hàng chạy thẳng từ vị trí $A(1; 3)$ đến vị trí $B(9; 9)$. Khoảng cách ngắn nhất từ tâm bãi đá ngầm $I$ đến đường đi của con tàu bằng
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pA = (0.5, 0.8)
    let pB = (4.0, 3.2)
    line(pA, pB, stroke: 1.5pt + rgb("1d4ed8"))
    let pI = (2.2, 2.5)
    circle(pI, radius: 0.8, stroke: 1.2pt + rgb("dc2626"), fill: rgb("fee2e2"))
    circle(pI, radius: 2pt, fill: rgb("dc2626"))
    content((2.2, 2.75), text(fill: rgb("dc2626"), size: 8pt)[$I$ (Đá ngầm)])
    content(pA, [🚢 $A$], anchor: "north")
    content(pB, [🎯 $B$], anchor: "south")
  })
]],
    (
        True([$0$ (đường đi đi qua đúng tâm bãi đá ngầm)]),
        [$1" hải lý"$],
        [$2" hải lý"$],
        [$0.5" hải lý"$]
    ),
    loigiai: [
        Vectơ $vec(A B) = (9 - 1; 9 - 3) = (8; 6) = 2(4; 3)$.
        Vectơ $vec(A I) = (5 - 1; 6 - 3) = (4; 3)$.
        Nhận thấy $vec(A I) = 1/2 vec(A B)$, do đó ba điểm $A, I, B$ thẳng hàng và $I$ chính là trung điểm của đoạn thẳng $A B$.
        Khoảng cách từ $I$ đến đường đi của tàu bằng $0$.
    ]
)

// TN 11 (VD - Cáp néo cột phát sóng)
#tn([Một cột anten truyền hình cao $30" m"$ được giữ cân bằng bởi ba dây cáp néo từ đỉnh cột $S(0; 0; 30)$ xuống ba cọc neo trên mặt đất cách đều chân cột $O$ một khoảng $40" m"$. Độ dài của mỗi sợi dây cáp néo bằng],
    (
        True([$50" m"$]),
        [$45" m"$],
        [$70" m"$],
        [$35" m"$]
    ),
    loigiai: [
        Mỗi sợi dây cáp néo, cột anten và mặt đất tạo thành một tam giác vuông tại chân cột $O$:
        $ L = sqrt(h^2 + r^2) = sqrt(30^2 + 40^2) = sqrt(900 + 1600) = sqrt(2500) = 50" m" $
    ]
)

// TN 12 (VD - Cân bằng thanh giàn kết cấu)
#tn([Một nút giàn kết cấu chịu tác dụng của ba lực đồng phẳng cân bằng: $vec(F)_1 + vec(F)_2 + vec(F)_3 = vec(0)$. Biết rằng $F_1 = 30" kN", F_2 = 40" kN"$ và $vec(F)_1 perp vec(F)_2$. Độ lớn của lực $vec(F)_3$ bằng],
    (
        True([$50" kN"$]),
        [$70" kN"$],
        [$10" kN"$],
        [$25" kN"$]
    ),
    loigiai: [
        $vec(F)_3 = -(vec(F)_1 + vec(F)_2) => |vec(F)_3| = |vec(F)_1 + vec(F)_2|$.
        Vì $vec(F)_1 perp vec(F)_2$ nên:
        $ F_3 = sqrt(F_1^2 + F_2^2) = sqrt(30^2 + 40^2) = 50" kN" $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (VDC - Cầu treo dây võng & Phân tích lực căng tháp trụ)
#ds([Một cây cầu treo nhịp chính được giữ bởi hai tháp trụ cầu thẳng đứng cao $80" m"$ so với mặt cầu. Dây cáp chủ của cầu võng xuống và chịu tổng tải trọng dầm cầu phân bố đối xứng qua điểm giữa cầu. Tại đỉnh một tháp trụ $T$, dây cáp chính treo nhịp chính chịu lực căng $vec(T)_1$ có độ lớn $T_1 = 5000" kN"$ nghiêng xuống hợp với phương ngang góc $30^circ$; dây cáp néo về mố cầu chịu lực căng $vec(T)_2$ có độ lớn $T_2 = 5000" kN"$ nghiêng xuống hợp với phương ngang góc $45^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pT = (2.0, 2.5)
    line((2.0, 0), pT, stroke: 3pt + luma(100))
    line((-0.5, 0), (4.5, 0), stroke: 1.5pt + rgb("1d4ed8"))
    content((2.0, -0.3), [Mặt cầu])
    line(pT, (0, 1.3), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((0.5, 2.1), text(fill: rgb("1d4ed8"), size: 8pt)[$vec(T)_1$ ($30^circ$)])
    line(pT, (3.8, 0.7), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((3.5, 1.8), text(fill: rgb("0d9488"), size: 8pt)[$vec(T)_2$ ($45^circ$)])
    circle(pT, radius: 2.5pt, fill: rgb("dc2626"))
    content((2.0, 2.8), [Đỉnh tháp $T$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Thành phần lực nằm ngang của dây cáp nhịp chính kéo tháp trụ về phía lòng sông có độ lớn $T_(1 x) = 5000 cos 30^circ = 2500 sqrt(3)" kN" approx 4330.1" kN"$.]),
    True([Thành phần lực nằm ngang của dây cáp néo kéo tháp trụ về phía mố cầu có độ lớn $T_(2 x) = 5000 cos 45^circ = 2500 sqrt(2)" kN" approx 3535.5" kN"$.]),
    True([Tháp trụ chịu một lực uốn ngang tổng hợp hướng về phía lòng sông có độ lớn $Delta F_x = T_(1 x) - T_(2 x) approx 794.6" kN"$.]),
    [Tổng lực nén thẳng đứng truyền xuống móng tháp trụ cầu bằng đúng $5000" kN"$.]
  ),
  loigiai: [
    #step([Thành phần lực ngang])
    $T_(1 x) = 5000 cos 30^circ = 2500 sqrt(3) approx 4330.13" kN"$. Mệnh đề a ĐÚNG.
    $T_(2 x) = 5000 cos 45^circ = 2500 sqrt(2) approx 3535.53" kN"$. Mệnh đề b ĐÚNG.

    #step([Lực ngang uốn tháp])
    Do hai cáp kéo về hai phía đối diện nên lực ngang hợp lực uốn đỉnh tháp là:
    $Delta F_x = T_(1 x) - T_(2 x) approx 4330.13 - 3535.53 = 794.6" kN"$. Mệnh đề c ĐÚNG.

    #step([Tổng lực nén thẳng đứng])
    Hai cáp đều kéo chúc xuống, cùng ép xuống tháp:
    $F_y = T_(1 y) + T_(2 y) = 5000 sin 30^circ + 5000 sin 45^circ = 2500 + 2500 sqrt(2) approx 6035.5" kN" != 5000" kN"$. Mệnh đề d SAI.
  ]
)

// DS 2 (VDC - Hải đội 2 tàu kéo lai dắt siêu tàu container)
#ds([Một siêu tàu container trọng tải $200000" DWT"$ được hai tàu kéo chuyên dụng $K_1$ và $K_2$ lai dắt vào luồng cảng nước sâu theo phương thẳng định hướng. Hai tàu kéo duy trì lực căng cáp bằng nhau $F_1 = F_2 = 400" kN"$. Dây cáp của tàu $K_1$ và $K_2$ hợp với trục tiến của siêu tàu container các góc đối xứng bằng $alpha = 30^circ$ (góc giữa hai dây cáp kéo bằng $60^circ$).
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pM = (0.5, 0)
    rect((-2.5, -0.5), (0.5, 0.5), fill: rgb("f8fafc"), stroke: 1.5pt + rgb("1d4ed8"))
    content((-1.0, 0), [🚢 Siêu tàu])
    line(pM, (3.2, 1.6), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((2.8, 1.8), text(fill: rgb("0d9488"), size: 8.5pt)[Tàu $K_1$ ($vec(F)_1$)])
    line(pM, (3.2, -1.6), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((2.8, -1.8), text(fill: rgb("1d4ed8"), size: 8.5pt)[Tàu $K_2$ ($vec(F)_2$)])
    line(pM, (4.2, 0), mark: (end: ">", fill: rgb("dc2626")), stroke: 2.2pt + rgb("dc2626"))
    content((4.4, 0.3), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    draw_angle_arc(pM, 0deg, 27deg, radius: 0.8, stroke: 1pt + rgb("dc2626"))
    content((1.6, 0.3), text(fill: rgb("dc2626"), size: 7.5pt)[$30^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Các thành phần lực kéo vuông góc với luồng của hai tàu kéo triệt tiêu lẫn nhau: $F_(1 y) + F_(2 y) = 0$.]),
    True([Hợp lực kéo tác dụng lên siêu tàu container hướng dọc theo luồng cảng có độ lớn $F = 400 sqrt(3)" kN" approx 692.8" kN"$.]),
    True([Khi siêu tàu di chuyển được $500" m"$, tổng công của lực kéo thực hiện bằng $A approx 346.4" MJ"$.]),
    [Nếu góc kéo của mỗi tàu tăng lên thành $60^circ$ (góc giữa hai dây cáp bằng $120^circ$), tổng lực kéo tiến dọc theo luồng sẽ tăng lên.]
  ),
  loigiai: [
    #step([Triệt tiêu lực dạt ngang])
    Do tính đối xứng: $F_(1 y) = F_1 sin 30^circ = 200" kN"$ hướng sang trái và $F_(2 y) = -200" kN"$ hướng sang phải, tổng bằng $0$. Mệnh đề a ĐÚNG.

    #step([Lực kéo tiến tổng hợp])
    $F = F_(1 x) + F_(2 x) = 2 F_1 cos 30^circ = 2(400) (sqrt(3))/2 = 400 sqrt(3) approx 692.82" kN"$. Mệnh đề b ĐÚNG.

    #step([Công của lực kéo])
    $A = F dot s = (400000 sqrt(3)) dot 500 = 200000000 sqrt(3)" J" approx 346.41 dot 10^6" J" = 346.41" MJ"$. Mệnh đề c ĐÚNG.

    #step([Ảnh hưởng của góc kéo])
    Khi $alpha = 60^circ$, $F' = 2(400) cos 60^circ = 400" kN" < 692.8" kN"$. Lực kéo tiến giảm đi chứ không tăng. Mệnh đề d SAI.
  ]
)

// DS 3 (VDC - Phân tích lực kéo dốc nghiêng có ma sát)
#ds([Một xe kéo cứu hộ kéo một khối vật liệu nặng $m = 2000" kg"$ lên một mặt dốc bê tông nghiêng góc $alpha = 30^circ$ so với phương ngang. Dây cáp song song với mặt dốc, lực kéo của tời là $F = 15000" N"$. Hệ số ma sát trượt giữa khối vật liệu và mặt dốc là $mu = 0.2$. Lấy gia tốc trọng trường $g = 10" m/s"^2$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + luma(120))
    line((0, 0), (4.0, 2.3), stroke: 1.5pt + rgb("1d4ed8"))
    rect((1.5, 0.86), (2.7, 1.55), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1d4ed8"))
    content((2.1, 1.2), [📦 Vật liệu])
    line((2.7, 1.2), (3.8, 1.83), mark: (end: ">", fill: rgb("dc2626")), stroke: 2pt + rgb("dc2626"))
    content((4.0, 1.8), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    draw_angle_arc((0, 0), 0deg, 30deg, radius: 0.9, stroke: 1pt + rgb("dc2626"))
    content((1.2, 0.35), text(fill: rgb("dc2626"), size: 8pt)[$30^circ$])
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Thành phần trọng lực cản trở chuyển động lên dốc có độ lớn $P_x = m g sin 30^circ = 10000" N"$.]),
    True([Lực ma sát trượt cản trở chuyển động có độ lớn $F_(m s) = mu m g cos 30^circ = 2000 sqrt(3)" N" approx 3464.1" N"$.]),
    True([Hợp lực tác dụng lên khối vật liệu theo phương chuyển động lên dốc là $F_(h l) = 5000 - 2000 sqrt(3) approx 1535.9" N" > 0$ (khối vật liệu chuyển động nhanh dần đều).]),
    [Gia tốc chuyển động của khối vật liệu lớn hơn $2.0" m/s"^2$.]
  ),
  loigiai: [
    #step([Thành phần trọng lực song song dốc])
    $P_x = m g sin 30^circ = 2000 dot 10 dot 1/2 = 10000" N"$. Mệnh đề a ĐÚNG.

    #step([Lực ma sát trượt])
    $N = m g cos 30^circ = 2000 dot 10 dot (sqrt(3))/2 = 10000 sqrt(3)" N"$.
    $F_(m s) = mu N = 0.2 dot 10000 sqrt(3) = 2000 sqrt(3) approx 3464.1" N"$. Mệnh đề b ĐÚNG.

    #step([Hợp lực chuyển động])
    $F_(h l) = F - P_x - F_(m s) = 15000 - 10000 - 2000 sqrt(3) = 5000 - 2000 sqrt(3) approx 1535.9" N" > 0$. Mệnh đề c ĐÚNG.

    #step([Gia tốc])
    $a = F_(h l) / m = (1535.9) / 2000 approx 0.77" m/s"^2 < 2.0" m/s"^2$. Mệnh đề d SAI.
  ]
)

// DS 4 (VDC - Bão biển & Phao định vị hải hành dạt trôi)
#ds([Một phao biển cảnh báo khí tượng tại quần đảo Hoàng Sa bị đứt xích neo trong một cơn bão và trôi dạt tự do trên biển. Phao chịu tác động của hai lực chính: lực đẩy của gió bão $vec(F)_g$ có độ lớn $150" N"$ theo hướng Đông - Bắc (hợp với hướng Đông góc $45^circ$) và lực kéo của dòng hải lưu bề mặt $vec(F)_n$ có độ lớn $200" N"$ theo hướng Đông.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (3.2, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 2pt + rgb("0d9488"))
    content((3.3, -0.25), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(F)_n$ (Đông)])
    line(pO, (2.2, 2.2), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((2.3, 2.4), text(fill: rgb("1d4ed8"), size: 8.5pt)[$vec(F)_g$ (Đông Bắc)])
    line(pO, (5.4, 2.2), mark: (end: ">", fill: rgb("dc2626")), stroke: 2.2pt + rgb("dc2626"))
    content((5.6, 2.2), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(F)$])
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🛟 Phao], anchor: "north-east")
  })
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tích vô hướng của hai vectơ lực bằng: $vec(F)_g dot vec(F)_n = 150 dot 200 dot cos 45^circ = 15000 sqrt(2)" N"^2 approx 21213.2" N"^2$.]),
    True([Độ lớn của hợp lực tác dụng lên phao biển thỏa mãn $F^2 = 150^2 + 200^2 + 30000 sqrt(2) approx 104926.4$.]),
    True([Độ lớn của hợp lực tác động làm phao trôi dạt xấp xỉ $F approx 323.9" N"$.]),
    [Hướng trôi dạt của phao biển lệch về phía Bắc một góc lớn hơn $45^circ$ so với hướng Đông.]
  ),
  loigiai: [
    #step([Tích vô hướng hai lực])
    Góc giữa hướng Đông Bắc và hướng Đông là $45^circ$.
    $vec(F)_g dot vec(F)_n = 150 dot 200 dot cos 45^circ = 30000 dot (sqrt(2))/2 = 15000 sqrt(2) approx 21213.2" N"^2$. Mệnh đề a ĐÚNG.

    #step([Bình phương độ lớn hợp lực])
    $F^2 = F_g^2 + F_n^2 + 2 vec(F)_g dot vec(F)_n = 150^2 + 200^2 + 30000 sqrt(2) = 22500 + 40000 + 42426.4 = 104926.4$. Mệnh đề b ĐÚNG.

    #step([Độ lớn hợp lực])
    $F = sqrt(104926.4) approx 323.9" N"$. Mệnh đề c ĐÚNG.

    #step([Góc lệch hướng trôi])
    $F_x = 200 + 150 cos 45^circ approx 306.07" N"$, $F_y = 150 sin 45^circ approx 106.07" N"$.
    $tan phi = F_y / F_x = 106.07 / 306.07 approx 0.3465 => phi approx 19.1^circ < 45^circ$. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Câu 17 - VDC Cáp treo)
#tln([Một khối cấu kiện dầm cầu nặng $P = 120" kN"$ được giữ cân bằng tĩnh bởi hai nhánh dây cáp cần cẩu cùng có lực căng bằng nhau $T = 120" kN"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 2.2)
    let pA = (-1.8, 0.5)
    let pB = (1.8, 0.5)
    line(pO, pA, stroke: 1.8pt + rgb("1d4ed8"))
    line(pO, pB, stroke: 1.8pt + rgb("1d4ed8"))
    rect((-2.2, 0), (2.2, 0.5), fill: rgb("eff6ff"), stroke: 1.2pt + luma(100))
    content((0, 0.25), [Dầm cầu ($120" kN"$)])
    circle(pO, radius: 2.5pt, fill: black)
    content((0, 2.5), [Móc cẩu $O$])
    draw_angle_arc(pO, -135deg, -45deg, radius: 0.5, stroke: 1pt + rgb("dc2626"))
  })
]
Tính góc hợp bởi hai nhánh dây cáp treo theo đơn vị độ.],
    [120],
    loigiai: [
        #step([Điều kiện cân bằng lực])
        Hai lực căng $vec(T)_1$ và $vec(T)_2$ có độ lớn $T_1 = T_2 = 120" kN"$.
        Hợp lực $T_(12) = P = 120" kN"$.
        
        #step([Tính góc giữa hai dây cáp])
        $ T_(12)^2 = T_1^2 + T_2^2 + 2 T_1 T_2 cos theta $
        $ 120^2 = 120^2 + 120^2 + 2(120^2) cos theta <=> 1 = 2 + 2 cos theta <=> cos theta = -1/2 $
        $ => theta = 120^circ $
        Vậy góc tạo bởi hai nhánh dây cáp bằng $120^circ$.
    ]
)

// TLN 2 (Câu 18 - VDC Công kéo máy tời sà lan)
#tln([Một chiếc sà lan chở hàng được máy tời kéo đi thẳng đều một quãng đường dài $s = 200" m"$ trên kênh hẹp. Lực căng dây cáp kéo là $F = 8000" N"$ và góc hợp bởi dây cáp với hướng chuyển động của sà lan là $alpha = 60^circ$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    line((-0.5, 1.2), (4.5, 1.2), stroke: 1.5pt + rgb("0284c7"))
    line((-0.5, -1.2), (4.5, -1.2), stroke: 1.5pt + rgb("0284c7"))
    rect((0.5, -0.4), (2.0, 0.4), fill: rgb("eff6ff"), stroke: 1.2pt + rgb("1d4ed8"))
    content((1.25, 0), [🚢 Sà lan])
    circle((3.5, 1.2), radius: 2.5pt, fill: rgb("d97706"))
    content((3.5, 1.5), [⚙️ Máy tời])
    line((2.0, 0), (3.5, 1.2), stroke: 1.8pt + rgb("dc2626"))
  })
]
Tính công có ích của lực kéo máy tời sinh ra theo đơn vị kilôjun ($"kJ"$).],
    [800],
    loigiai: [
        #step([Công thức tính công cơ học])
        $ A = F dot s dot cos alpha $
        
        #step([Thay số tính toán])
        $ A = 8000 dot 200 dot cos 60^circ = 1600000 dot 1/2 = 800000" J" $
        Đổi ra kilôjun: $800000" J" = 800" kJ"$.
    ]
)

// TLN 3 (Câu 19 - VDC Tốc độ bay ngược gió ngang)
#tln([Một trực thăng bay về hướng Bắc với tốc độ máy $v_1 = 160" km/h"$. Gió thổi mạnh theo hướng Tây sang Đông với tốc độ $v_2 = 120" km/h"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, 2.4), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 2pt + rgb("1d4ed8"))
    content((-0.4, 2.5), text(fill: rgb("1d4ed8"), size: 8.5pt)[$vec(v)_1$ (Bắc)])
    line(pO, (2.0, 0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    content((2.0, -0.25), text(fill: rgb("0d9488"), size: 8.5pt)[$vec(v)_2$ (Đông)])
    line(pO, (2.0, 2.4), mark: (end: ">", fill: rgb("dc2626")), stroke: 2.2pt + rgb("dc2626"))
    content((2.3, 2.5), text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[$vec(v)$])
    content(pO, [🚁], anchor: "north-east")
  })
]
Tính tốc độ thực tế của trực thăng đối với mặt đất theo đơn vị $"km/h"$.],
    [200],
    loigiai: [
        #step([Phân tích vectơ vận tốc vuông góc])
        Vận tốc thực tế là tổng vectơ: $vec(v) = vec(v)_1 + vec(v)_2$.
        Vì hướng Bắc vuông góc với hướng Đông nên:
        
        #step([Tính tốc độ thực tế])
        $ v = sqrt(v_1^2 + v_2^2) = sqrt(160^2 + 120^2) = sqrt(25600 + 14400) = sqrt(40000) = 200" km/h" $
    ]
)

// TLN 4 (Câu 20 - VDC Góc kéo tối ưu)
#tln([Một khối kim loại nặng được kéo trượt đều trên sàn bê tông có hệ số ma sát trượt $mu = 1 / sqrt(3) approx 0.577$. Để lực kéo dây cáp cần dùng là nhỏ nhất thì góc nghiêng $alpha$ của dây kéo so với mặt sàn phải bằng bao nhiêu độ?],
    [30],
    loigiai: [
        #step([Điều kiện lực kéo đạt cực tiểu])
        Theo khảo sát cơ học, lực kéo để vật trượt đều trên mặt sàn có ma sát là:
        $ F(alpha) = (mu m g) / (cos alpha + mu sin alpha) $
        Lực $F(alpha)$ đạt giá trị nhỏ nhất khi mẫu số đạt cực đại, điều này tương đương:
        $ tan alpha = mu $
        
        #step([Tìm góc alpha])
        $ tan alpha = 1 / sqrt(3) => alpha = 30^circ $
        Vậy góc kéo tối ưu là $30^circ$.
    ]
)

// TLN 5 (Câu 21 - VDC Cáp néo tháp phát sóng đối xứng)
#tln([Một tháp phát thanh truyền hình được giữ bởi hệ ba dây cáp néo đối xứng dưới mặt đất tạo thành ba góc $120^circ$ đồng quy tại chân tháp. Lực căng trong hai sợi dây cáp là $T_1 = 50" kN"$ và $T_2 = 50" kN"$.
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: 0.8pt)
    let pO = (0, 0)
    line(pO, (0, 2.0), mark: (end: ">", fill: rgb("1d4ed8")), stroke: 1.8pt + rgb("1d4ed8"))
    line(pO, (-1.7, -1.0), mark: (end: ">", fill: rgb("0d9488")), stroke: 1.8pt + rgb("0d9488"))
    line(pO, (1.7, -1.0), mark: (end: ">", fill: rgb("dc2626")), stroke: 1.8pt + rgb("dc2626"))
    circle(pO, radius: 2.5pt, fill: black)
    content(pO, [🗼], anchor: "north-east")
  })
]
Tính lực căng $T_3$ của sợi dây cáp thứ ba (đơn vị: $"kN"$) để hệ thống cáp néo hoàn toàn cân bằng không làm nghiêng cột tháp.],
    [50],
    loigiai: [
        #step([Tính hợp lực hai cáp])
        $T_(12) = sqrt(T_1^2 + T_2^2 + 2 T_1 T_2 cos 120^circ) = sqrt(50^2 + 50^2 + 2(50^2)(-1/2)) = 50" kN"$.
        
        #step([Điều kiện cân bằng])
        Để cân bằng, dây cáp thứ ba phải có lực căng cân bằng với hợp lực của hai dây cáp kia:
        $ T_3 = T_(12) = 50" kN" $
    ]
)

// TLN 6 (Câu 22 - VDC Ca nô xuôi dòng rồi ngược dòng)
#tln([Một chiếc ca nô tuần tra chạy trên một con sông có dòng chảy ổn định $u = 4" km/h"$. Tốc độ máy của ca nô đối với nước đứng yên là $v_0 = 20" km/h"$. Ca nô chạy xuôi dòng từ trạm kiểm soát $A$ đến trạm $B$ cách nhau $48" km"$ rồi ngay lập tức quay đầu chạy ngược dòng trở về trạm $A$. Tổng thời gian cả đi lẫn về của ca nô là bao nhiêu giờ?],
    [5],
    loigiai: [
        #step([Tính tốc độ khi xuôi dòng và ngược dòng])
        Tốc độ xuôi dòng: $v_1 = v_0 + u = 20 + 4 = 24" km/h"$.
        Tốc độ ngược dòng: $v_2 = v_0 - u = 20 - 4 = 16" km/h"$.
        
        #step([Tính thời gian])
        Thời gian xuôi dòng: $t_1 = 48 / 24 = 2$ giờ.
        Thời gian ngược dòng: $t_2 = 48 / 16 = 3$ giờ.
        Tổng thời gian cả đi lẫn về: $t = t_1 + t_2 = 2 + 3 = 5$ giờ.
    ]
)

] // end make-questions

#make-questions()
