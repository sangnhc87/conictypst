#import "@preview/sang-math:1.0.4": *

// ═══════════════════════════════════════════════════════════
// CẤU HÌNH ĐỀ THI
// ═══════════════════════════════════════════════════════════
#let mode = "loigiai"
#let accent = rgb("059669") // Emerald

#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ═══════════════════════════════════════════════════════════
// TIÊU ĐỀ ĐỀ THI
// ═══════════════════════════════════════════════════════════
#show: thpt-school-exam.with(
  department: "TOÁN LỚP 10 - TẬP 2",
  school: "CHƯƠNG VII: PHƯƠNG PHÁP TỌA ĐỘ TRONG MẶT PHẲNG",
  exam-title: "CHUYÊN ĐỀ TOÁN THỰC TẾ 2: HÀNG HẢI, HÀNG KHÔNG, RADAR & VỆ TINH (ĐỀ SỐ 25E - MÃ ĐỀ 171)",
  subject: "TOÁN",
  duration: "50 phút, không kể thời gian phát đề",
  structure: auto,
  code: "171",
  footer-left: [GV Nguyễn Văn Sang],
  accent: accent,
  show-topbar: false,
)

#let make-questions() = [

#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn. Thí sinh trả lời từ câu 1 đến câu 12. Mỗi câu hỏi thí sinh chỉ chọn một phương án.], count: auto)

// TN 1
#tn([Một trạm Radar cảnh giới ven biển đặt tại gốc tọa độ $O(0; 0)$ có bán kính quét tối đa $R = 100 text(" km")$.
Một máy bay lạ đang bay theo đường thẳng $d: 3x + 4y - 600 = 0$ (đơn vị: kilômét).
Khoảng cách ngắn nhất từ máy bay đến trạm Radar bằng],
    (
        True([$120 text(" km")$]),
        [$100 text(" km")$],
        [$150 text(" km")$],
        [$60 text(" km")$]
    ),
    loigiai: [
        Khoảng cách ngắn nhất chính là khoảng cách từ $O(0; 0)$ đến đường thẳng $d$:
        $ d(O, d) = (|3(0) + 4(0) - 600|) / sqrt(3^2 + 4^2) = 600 / 5 = 120 text(" km") $
        Vì $120 > 100$ nên máy bay vẫn bay bên ngoài vùng phủ sóng của trạm radar.
    ]
)

// TN 2
#tn([Trong hệ thống dẫn đường hàng hải LORAN, hai trạm phát sóng vô tuyến đặt tại hai tiêu điểm $F_1(-50; 0)$ và $F_2(50; 0)$ (đơn vị: km).
Một tàu hàng nhận được tín hiệu từ $F_2$ sớm hơn từ $F_1$, tương ứng với hiệu khoảng cách $M F_1 - M F_2 = 60 text(" km")$.
Phương trình Hypebol định vị đường đi của tàu hàng là],
    (
        True([$x^2 / 900 - y^2 / 1600 = 1$ ($x > 0$)]),
        [$x^2 / 1600 - y^2 / 900 = 1$ ($x > 0$)],
        [$x^2 / 3600 - y^2 / 6400 = 1$ ($x > 0$)],
        [$x^2 / 900 + y^2 / 1600 = 1$]
    ),
    loigiai: [
        $2c = 100 => c = 50 text(" km")$.
        $2a = 60 => a = 30 text(" km")$.
        $b^2 = c^2 - a^2 = 50^2 - 30^2 = 2500 - 900 = 1600$.
        Vì $M F_1 > M F_2$ nên tàu ở gần $F_2$ hơn, tương ứng với nhánh dương $x > 0$.
        Phương trình: $x^2 / 900 - y^2 / 1600 = 1$ ($x > 0$).
    ]
)

// TN 3
#tn([Một vệ tinh viễn thông bay quanh Trái Đất theo quỹ đạo Elip có tâm Trái Đất nằm tại một tiêu điểm.
Khoảng cách gần Trái Đất nhất (điểm cận địa) là $r_1 = 1000 text(" km")$ và khoảng cách xa nhất (điểm viễn địa) là $r_2 = 9000 text(" km")$.
Độ dài trục lớn của quỹ đạo elip bằng],
    (
        True([$10000 text(" km")$]),
        [$8000 text(" km")$],
        [$5000 text(" km")$],
        [$4000 text(" km")$]
    ),
    loigiai: [
        Ta có $r_1 = a - c$ và $r_2 = a + c$.
        Độ dài trục lớn:
        $ 2a = r_1 + r_2 = 1000 + 9000 = 10000 text(" km") $
    ]
)

// TN 4
#tn([Độ dài bán trục nhỏ $b$ của quỹ đạo Elip vệ tinh nói trên bằng],
    (
        True([$3000 text(" km")$]),
        [$4000 text(" km")$],
        [$5000 text(" km")$],
        [$2500 text(" km")$]
    ),
    loigiai: [
        $a = 10000 / 2 = 5000 text(" km")$.
        $c = a - r_1 = 5000 - 1000 = 4000 text(" km")$.
        Bán trục nhỏ:
        $ b = sqrt(a^2 - c^2) = sqrt(5000^2 - 4000^2) = sqrt(9000000) = 3000 text(" km") $
    ]
)

// TN 5
#tn([Một chảo thu sóng anten Parabol có mặt cắt là Parabol $y^2 = 36x$ (đơn vị: centimét).
Bộ cảm biến thu tín hiệu vệ tinh (LNB) đặt tại đúng tiêu điểm $F$ của Parabol.
Khoảng cách từ đỉnh chảo đến bộ thu sóng LNB bằng],
    (
        True([$9 text(" cm")$]),
        [$18 text(" cm")$],
        [$36 text(" cm")$],
        [$4.5 text(" cm")$]
    ),
    loigiai: [
        $2p = 36 => p = 18 text(" cm")$.
        Tiêu cự $O F = p / 2 = 18 / 2 = 9 text(" cm")$.
    ]
)

// TN 6
#tn([Phễu bay an toàn khi hạ cánh của một sân bay có hai đường biên là hai đường thẳng đối xứng nhau qua trục đường băng $O x$, có phương trình $x - sqrt(3)y = 0$ và $x + sqrt(3)y = 0$.
Góc mở của phễu bay an toàn bằng],
    (
        True([$60^circ$]),
        [$30^circ$],
        [$45^circ$],
        [$90^circ$]
    ),
    loigiai: [
        Đường thẳng $d_1: x - sqrt(3)y = 0 <=> y = 1 / sqrt(3) x$ tạo với trục $O x$ góc $30^circ$.
        Đường thẳng $d_2: x + sqrt(3)y = 0 <=> y = - 1 / sqrt(3) x$ tạo với trục $O x$ góc $-30^circ$.
        Góc mở giữa hai đường biên là $30^circ + 30^circ = 60^circ$.
    ]
)

// TN 7
#tn([Vùng thông báo bay FIR có ranh giới là đường tròn tâm $I(100; 200)$ và bán kính $R = 150 text(" hải lý")$.
Phương trình đường biên của vùng FIR là],
    (
        True([$(x - 100)^2 + (y - 200)^2 = 22500$]),
        [$(x + 100)^2 + (y + 200)^2 = 22500$],
        [$(x - 100)^2 + (y - 200)^2 = 150$],
        [$(x - 200)^2 + (y - 100)^2 = 22500$]
    ),
    loigiai: [
        Phương trình đường tròn: $(x - 100)^2 + (y - 200)^2 = 150^2 = 22500$.
    ]
)

// TN 8
#tn([Một trực thăng cứu nạn bay theo đường thẳng $d: x - 2y + 10 = 0$.
Một phao cứu sinh của tàu gặp nạn đang trôi tại điểm $M(20; 30)$ (đơn vị: kilômét).
Khoảng cách ngắn nhất từ trực thăng đến phao cứu sinh bằng],
    (
        True([$6 sqrt(5) text(" km")$]),
        [$10 text(" km")$],
        [$15 text(" km")$],
        [$4 sqrt(5) text(" km")$]
    ),
    loigiai: [
        $ d(M, d) = (|20 - 2(30) + 10|) / sqrt(1^2 + (-2)^2) = (|-30|) / sqrt(5) = 30 / sqrt(5) = 6 sqrt(5) text(" km") $
    ]
)

// TN 9
#tn([Hai luồng hàng hải quốc tế giao nhau, có trục luồng thứ nhất là $x + y - 50 = 0$ và trục luồng thứ hai là $2x - y - 10 = 0$ (đơn vị: hải lý).
Tọa độ điểm giao cắt của hai luồng tàu là],
    (
        True([$(20; 30)$]),
        [$(30; 20)$],
        [$(10; 40)$],
        [$(25; 25)$]
    ),
    loigiai: [
        Cộng hai phương trình: $3x - 60 = 0 <=> x = 20$.
        Thay vào phương trình đầu: $20 + y = 50 <=> y = 30$.
        Giao điểm là $(20; 30)$.
    ]
)

// TN 10
#tn([Đường bay của chuyến bay VN1 có vectơ chỉ phương $vec(u_1) = (1; 1)$, đường bay của chuyến bay VN2 có vectơ chỉ phương $vec(u_2) = (1; 0)$.
Góc cắt nhau giữa hai hướng bay bằng],
    (
        True([$45^circ$]),
        [$30^circ$],
        [$60^circ$],
        [$90^circ$]
    ),
    loigiai: [
        $ cos(vec(u_1), vec(u_2)) = (|1(1) + 1(0)|) / (sqrt(1^2 + 1^2) sqrt(1^2 + 0^2)) = 1 / sqrt(2) $
        Góc giữa hai hướng bay bằng $45^circ$.
    ]
)

// TN 11
#tn([Một phao đèn tín hiệu hàng hải phát ánh sáng tròn có phương trình $(C): x^2 + y^2 - 40x - 60y = 0$ (đơn vị: mét).
Tọa độ vị trí đặt phao đèn là],
    (
        True([$I(20; 30)$]),
        [$I(-20; -30)$],
        [$I(40; 60)$],
        [$I(10; 15)$]
    ),
    loigiai: [
        Hệ số: $a = 20, b = 30, c = 0$.
        Tọa độ tâm đặt đèn là $I(20; 30)$.
    ]
)

// TN 12
#tn([Một trạm vũ trụ quốc tế bay trên quỹ đạo tròn đồng quy tâm Trái Đất $O(0; 0)$ có bán kính quỹ đạo $R = 7000 text(" km")$.
Phương trình quỹ đạo của trạm vũ trụ là],
    (
        True([$x^2 + y^2 = 49000000$]),
        [$x^2 + y^2 = 7000$],
        [$(x - 7000)^2 + y^2 = 0$],
        [$x^2 + y^2 = 14000$]
    ),
    loigiai: [
        Quỹ đạo tròn tâm $O(0; 0)$ bán kính $R = 7000 text(" km")$:
        $ x^2 + y^2 = 7000^2 = 49000000 $
    ]
)

#exam-part([PHẦN II. Câu trắc nghiệm đúng sai. Trong mỗi ý a), b), c), d) ở mỗi câu, thí sinh chọn đúng hoặc sai.], count: auto)

// DS 1 (Định vị Hypebol LORAN có CeTZ)
#ds([Trong hệ thống vô tuyến LORAN hàng hải, hai đài phát tín hiệu cố định tại $F_1(-50; 0)$ và $F_2(50; 0)$ (đơn vị: kilômét).
Một tàu hàng trên biển thu nhận tín hiệu đồng bộ và xác định được hiệu khoảng cách $M F_1 - M F_2 = 60 text(" km")$ như hình vẽ:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (4, 0), stroke: 0.8pt, mark: (end: "stealth"))
  line((0, -2.5), (0, 2.5), stroke: 0.8pt, mark: (end: "stealth"))
  content((3.8, -0.3), [$x$])
  content((-0.3, 2.3), [$y$])
  content((-0.25, -0.25), [$O$])
  
  // Hai tiêu điểm F1(-2.5, 0), F2(2.5, 0) (scale 1:20)
  circle((-2.5, 0), radius: 2pt, fill: red)
  content((-2.5, -0.3), [$F_1$])
  circle((2.5, 0), radius: 2pt, fill: red)
  content((2.5, -0.3), [$F_2$])
  
  // Nhánh Hypebol phải x >= a = 1.5
  line((1.5, 0), (1.56, 0.4), (1.75, 0.8), (2.05, 1.2), (2.45, 1.6), (2.92, 2.0), stroke: 1.5pt + rgb("059669"))
  line((1.5, 0), (1.56, -0.4), (1.75, -0.8), (2.05, -1.2), (2.45, -1.6), (2.92, -2.0), stroke: 1.5pt + rgb("059669"))
  
  // Tàu M
  circle((2.05, 1.2), radius: 2.5pt, fill: blue)
  content((2.3, 1.4), [$M$])
  
  // Nối MF1, MF2
  line((-2.5, 0), (2.05, 1.2), stroke: (dash: "dashed", paint: gray))
  line((2.5, 0), (2.05, 1.2), stroke: (dash: "dashed", paint: gray))
})
]
Xét tính đúng sai của các nhận định sau:],
  (
    True([Quỹ đạo di chuyển của tàu hàng là một nhánh của đường Hypebol nằm về phía $x > 0$.]),
    True([Khoảng cách giữa hai trạm phát vô tuyến bằng $F_1 F_2 = 100 text(" km")$.]),
    True([Phương trình chính tắc của đường Hypebol định vị là $x^2 / 900 - y^2 / 1600 = 1$.]),
    [Khi tàu hàng ở vị trí có tung độ $y = 40 text(" km")$, khoảng cách từ tàu đến trục đối xứng $O y$ bằng $30 text(" km")$.]
  ),
  loigiai: [
    #step([Xác định nhánh Hypebol])
    Vì $M F_1 - M F_2 = 60 > 0 => M F_1 > M F_2$, tàu ở gần trạm $F_2(50; 0)$ hơn nên thuộc nhánh $x > 0$. Mệnh đề a ĐÚNG.

    #step([Khoảng cách hai trạm])
    $F_1 F_2 = 50 - (-50) = 100 text(" km")$. Mệnh đề b ĐÚNG.

    #step([Phương trình Hypebol])
    $2a = 60 => a = 30$, $c = 50 => b^2 = 50^2 - 30^2 = 1600$.
    Phương trình: $x^2 / 900 - y^2 / 1600 = 1$. Mệnh đề c ĐÚNG.

    #step([Kiểm tra khi y = 40km])
    Thay $y = 40$:
    $ x^2 / 900 - 40^2 / 1600 = 1 <=> x^2 / 900 - 1 = 1 <=> x^2 = 1800 => x = 30 sqrt(2) approx 42.43 text(" km") $
    Khoảng cách đến $O y$ bằng $30 sqrt(2) text(" km")$ (chứ không phải $30 text(" km")$).
    Khẳng định bằng $30 text(" km")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 2 (Quỹ đạo Elip vệ tinh quanh Trái Đất)
#ds([Một vệ tinh viễn thông chuyển động theo quỹ đạo Elip nhận tâm Trái Đất làm một tiêu điểm $F_1$.
Khoảng cách từ tâm Trái Đất đến điểm cận địa là $r_1 = 1000 text(" km")$, đến điểm viễn địa là $r_2 = 9000 text(" km")$.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Độ dài trục lớn của quỹ đạo elip là $2a = 10000 text(" km")$.]),
    True([Tiêu cự của quỹ đạo elip bằng $2c = 8000 text(" km")$.]),
    True([Độ dài bán trục nhỏ của quỹ đạo elip bằng $b = 3000 text(" km")$.]),
    [Tâm sai của quỹ đạo elip bằng $e = 0.6$.]
  ),
  loigiai: [
    #step([Trục lớn])
    $2a = r_1 + r_2 = 1000 + 9000 = 10000 text(" km")$. Mệnh đề a ĐÚNG.

    #step([Tiêu cự])
    $2c = r_2 - r_1 = 9000 - 1000 = 8000 text(" km")$. Mệnh đề b ĐÚNG.

    #step([Bán trục nhỏ])
    $a = 5000, c = 4000 => b = sqrt(5000^2 - 4000^2) = 3000 text(" km")$. Mệnh đề c ĐÚNG.

    #step([Tâm sai])
    $e = c / a = 4000 / 5000 = 0.8$ (chứ không phải $0.6$).
    Khẳng định tâm sai $e = 0.6$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 3 (Radar cảnh giới quân sự và tàu ngầm nổi)
#ds([Một trạm radar duyên hải tại gốc $O(0; 0)$ có bán kính quét tối đa $R = 100 text(" hải lý")$.
Một tàu ngầm nổi di chuyển theo hải trình thẳng $d: 3x + 4y - 250 = 0$ (đơn vị: hải lý).
Xét tính đúng sai của các nhận định sau:],
  (
    True([Khoảng cách ngắn nhất từ trạm radar đến hải trình của tàu ngầm là $50 text(" hải lý")$.]),
    True([Tàu ngầm đi vào vùng quét phát hiện của trạm radar.]),
    True([Chiều dài hải trình mà tàu ngầm bị radar theo dõi liên tục là $100 sqrt(3) text(" hải lý")$.]),
    [Nếu tàu ngầm chạy với tốc độ $20 text(" hải lý/h")$ thì thời gian di chuyển trong vùng quét của radar là đúng $5 text(" giờ")$.]
  ),
  loigiai: [
    #step([Khoảng cách ngắn nhất])
    $h = d(O, d) = (|-250|) / sqrt(3^2 + 4^2) = 250 / 5 = 50 text(" hải lý")$. Mệnh đề a ĐÚNG.

    #step([Vào vùng quét])
    Vì $h = 50 < R = 100$ nên tàu ngầm cắt qua vùng quét của radar. Mệnh đề b ĐÚNG.

    #step([Chiều dài hải trình trong vùng quét])
    $L = 2 sqrt(R^2 - h^2) = 2 sqrt(100^2 - 50^2) = 2 sqrt(7500) = 100 sqrt(3) text(" hải lý")$. Mệnh đề c ĐÚNG.

    #step([Thời gian di chuyển])
    $t = L / v = (100 sqrt(3)) / 20 = 5 sqrt(3) approx 8.66 text(" giờ")$ (chứ không phải đúng $5 text(" giờ")$).
    Khẳng định thời gian bằng đúng $5 text(" giờ")$ là SAI. Mệnh đề d SAI.
  ]
)

// DS 4 (Anten kính thiên văn Parabol)
#ds([Một kính thiên văn vô tuyến chảo Parabol có mặt cắt là Parabol $y^2 = 36x$ ($0 <= x <= 25$, đơn vị: mét).
Bộ cảm biến thu tín hiệu đặt tại tiêu điểm $F$ của gương.
Xét tính đúng sai của các nhận định sau:],
  (
    True([Tham số tiêu của Parabol là $p = 18 text(" m")$.]),
    True([Tiêu điểm $F$ có tọa độ là $F(9; 0)$.]),
    True([Bán kính miệng chảo tại mép ngoài $x = 25 text(" m")$ bằng $30 text(" m")$.]),
    [Khoảng cách từ tiêu điểm $F$ đến đường chuẩn của Parabol bằng $9 text(" m")$.]
  ),
  loigiai: [
    #step([Tham số tiêu])
    $2p = 36 => p = 18 text(" m")$. Mệnh đề a ĐÚNG.

    #step([Tiêu điểm])
    $F(p / 2; 0) = F(9; 0)$. Mệnh đề b ĐÚNG.

    #step([Bán kính miệng chảo])
    Tại $x = 25$: $y = sqrt(36 times 25) = 6 times 5 = 30 text(" m")$. Mệnh đề c ĐÚNG.

    #step([Khoảng cách đến đường chuẩn])
    Khoảng cách từ tiêu điểm $F$ đến đường chuẩn $Delta: x + 9 = 0$ bằng tham số tiêu $p = 18 text(" m")$ (chứ không phải $9 text(" m")$).
    Khẳng định bằng $9 text(" m")$ là SAI. Mệnh đề d SAI.
  ]
)

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn. Thí sinh trả lời từ câu 1 đến câu 6.], count: auto)

// TLN 1 (Bán trục ảo b Hypebol LORAN)
#tln([Trong bài toán hệ thống LORAN định vị có $a = 30 text(" km")$ và $c = 50 text(" km")$, bán trục ảo $b$ của Hypebol bằng bao nhiêu kilômét?],
    [40],
    loigiai: [
        #step([Tính b])
        $ b = sqrt(c^2 - a^2) = sqrt(50^2 - 30^2) = 40 text(" km") $
    ]
)

// TLN 2 (Bán trục nhỏ b quỹ đạo vệ tinh)
#tln([Trong bài toán quỹ đạo vệ tinh Elip có $r_1 = 1000 text(" km")$ và $r_2 = 9000 text(" km")$, độ dài bán trục nhỏ $b$ của quỹ đạo bằng bao nhiêu kilômét?],
    [3000],
    loigiai: [
        #step([Tính b])
        $a = 5000 text(" km"), c = 4000 text(" km")$.
        $ b = sqrt(5000^2 - 4000^2) = 3000 text(" km") $
    ]
)

// TLN 3 (Khoảng cách ngắn nhất từ radar đến tàu ngầm)
#tln([Trong bài toán radar cảnh giới biển $R = 100 text(" hải lý")$ và hải trình $3x + 4y - 250 = 0$, khoảng cách ngắn nhất từ trạm radar đến tàu ngầm bằng bao nhiêu hải lý?],
    [50],
    loigiai: [
        #step([Tính khoảng cách d(O, d)])
        $ h = (|-250|) / 5 = 50 text(" hải lý") $
    ]
)

// TLN 4 (Khoảng cách từ đỉnh chảo đến bộ thu LNB)
#tln([Trong bài toán kính thiên văn Parabol $y^2 = 36x$, khoảng cách từ đỉnh chảo đến bộ cảm biến thu sóng LNB bằng bao nhiêu mét?],
    [9],
    loigiai: [
        #step([Tính tiêu cự OF])
        $ 2p = 36 => p = 18 $
        $ O F = p / 2 = 9 text(" m") $
    ]
)

// TLN 5 (Đường kính miệng chảo kính thiên văn)
#tln([Trong bài toán chảo kính thiên văn Parabol $y^2 = 36x$ với độ sâu $x = 25 text(" m")$, đường kính của miệng chảo bằng bao nhiêu mét?],
    [60],
    loigiai: [
        #step([Tính bán kính và đường kính])
        Bán kính $R = sqrt(36 times 25) = 30 text(" m")$.
        Đường kính miệng chảo: $2R = 2(30) = 60 text(" m")$.
    ]
)

// TLN 6 (Tổng hoành độ và tung độ điểm giao luồng tàu)
#tln([Hai luồng tàu cắt nhau tại điểm có tọa độ $(x_0; y_0)$ thỏa mãn $x + y = 50$ và $2x - y = 10$. Tổng $x_0 + y_0$ bằng bao nhiêu?],
    [50],
    loigiai: [
        #step([Xác định tổng x0 + y0])
        Từ phương trình đầu tiên $x + y = 50$, suy ra trực tiếp tổng $x_0 + y_0 = 50$.
    ]
)

] // end make-questions

#make-questions()
