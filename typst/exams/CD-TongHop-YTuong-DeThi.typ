#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1A237E"), rgb("283593"), rgb("3F51B5"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("1A237E")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1A237E"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let col-blue = rgb("1A237E")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-teal = rgb("006064")
#let col-purple = rgb("4A148C")

// ─── Hộp Định Nghĩa / Lý Thuyết ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("E8EAF6"),
  stroke: (left: 4pt + col-blue, rest: 0.8pt + rgb("C5CAE9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-blue, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

// ─── Hộp Ví Dụ Trực Quan ───────────────────────
#let eg-box(title: "🎯 Ví dụ minh họa", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFE0B2")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D47A1"), rgb("1565C0"), rgb("1E88E5"), rgb("42A5F5"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("E3F2FD"), size: 11pt, weight: "bold", tracking: 2pt)[
      BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[Tổng Hợp Ý Tưởng Đề Thi & Ví Dụ Mẫu]
    #v(0.4em)
    #text(fill: rgb("E3F2FD"), size: 14pt)[📚 Hệ thống hóa các chuyên đề toán phân hóa, thực tế và liên môn]
    #v(0.5em)
    #text(fill: rgb("E3F2FD"), size: 11pt, style: "italic")[
      "Giúp học sinh nắm bắt cốt lõi lý thuyết và nhận diện nhanh các dạng bài trong đề thi"
    ]
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// PHẦN NỘI DUNG TỔNG HỢP
// ═══════════════════════════════════════════════

= NHÓM 1: TỔ HỢP, XÁC SUẤT VÀ MÔ HÌNH TRẠNG THÁI (COMBINATORICS & PROBABILITY)

Nhóm này tập trung vào các bài toán đếm nâng cao, phương pháp hàm sinh, xác suất có điều kiện và các mô hình chuỗi trạng thái Markov.

== 1. Sơ đồ cây & Xác suất trò chơi (CD-SoDoCay-XacSuat-TroChoi)
- *Ý tưởng chính:* Trực quan hóa các kịch bản thi đấu nhiều giai đoạn độc lập hoặc phụ thuộc (có momentum, mệt mỏi, hoặc hồi sinh) bằng sơ đồ cây vector.
#eg-box(title: "🎯 Ví dụ mẫu (Đấu sĩ và Quái thú)")[
  Một đấu sĩ lần lượt đấu với 3 quái thú. Xác suất thắng trận 1 là $0.7$. Thắng một trận thì trận sau xác suất thắng giảm $0.1$ do mệt. Thua một trận được dùng quyền hồi sinh duy nhất đấu trận phụ với xác suất thắng luôn là $0.5$.
  - *Mô hình toán:* Phân tích 4 kịch bản thắng chung cuộc trên sơ đồ cây:
    $ P("Thành công") = P(T_1 T_2 T_3) + P(H_1 T_2 T_3) + P(T_1 H_2 T_3) + P(T_1 T_2 H_3) $
    $ P("Thành công") = 0.7 dot.c 0.6 dot.c 0.5 + (0.3 dot.c 0.5) dot.c 0.5 dot.c 0.4 + 0.7 dot.c (0.4 dot.c 0.5) dot.c 0.5 + 0.7 dot.c 0.6 dot.c (0.5 dot.c 0.5) = 41.5%. $
]

== 2. Phân phối vật vào hộp & Hàm sinh (CD-PhanPhoi-4TruongHop / CD-HamSinh-GeneratingFunction)
- *Ý tưởng chính:* Phân loại 4 kịch bản xếp $k$ vật vào $n$ hộp dựa trên tính phân biệt của vật và hộp.
#eg-box(title: "🎯 Ví dụ mẫu (Chia kẹo Euler - Vật giống nhau, Hộp phân biệt)")[
  Có bao nhiêu cách chia 10 cái kẹo giống nhau cho 3 học sinh sao cho ai cũng có ít nhất 1 cái kẹo?
  - *Mô hình toán:* Đây là bài toán chia kẹo Euler (Stars and Bars). Số cách chia là số nghiệm nguyên dương của phương trình $x_1 + x_2 + x_3 = 10$:
    $ C_(10-1)^(3-1) = C_9^2 = 36 "cách." $
]

== 3. Trạng thái chuyển đổi & Đếm bằng FSM (CD-TrangThai-ToHop-XacSuat / CD-FSM-Dem-To-Hop / CD-ToMau)
- *Ý tưởng chính:* Sử dụng máy trạng thái hữu hạn (FSM) hoặc ma trận chuyển để đếm số chuỗi thỏa mãn điều kiện hoặc tính xác suất hấp thụ.
#eg-box(title: "🎯 Ví dụ mẫu (Đếm chuỗi tránh chuỗi con)")[
  Có bao nhiêu chuỗi nhị phân độ dài 8 không chứa chuỗi con $110$?
  - *Mô hình toán:* Thiết lập các trạng thái tương ứng với phần đuôi của chuỗi hiện tại: $S_0$ (đuôi không phải 1), $S_1$ (đuôi là 1), $S_2$ (đuôi là 11). Thiết lập hệ thức truy hồi cho số chuỗi độ dài $n$ ở mỗi trạng thái để tìm kết quả.
]

== 4. Chuỗi trạng thái Markov & Xác suất đệ quy (CD-ChuoiTrangThai-Markov / CD-XacSuat-DieuKien-Gia)
- *Ý tưởng chính:* Giải quyết các bài toán gieo xúc xắc hoặc trò chơi lặp vô hạn bằng cách lập hệ phương trình tuyến tính dựa trên tính chất Markov.
#eg-box(title: "🎯 Ví dụ mẫu (Trò chơi xúc xắc sinh tử)")[
  Hai người luân phiên gieo xúc xắc, ai gieo được mặt 6 trước thì thắng. Nếu gieo phải mặt 1, đối thủ được gieo liên tiếp 2 lần ở lượt sau. Tính xác suất thắng của người gieo trước.
  - *Mô hình toán:* Đặt $P$ là xác suất thắng từ trạng thái thường, $Q$ là xác suất thắng từ trạng thái được gieo 2 lần. Thiết lập hệ phương trình:
    $ 10P + Q = 6; quad -4P + 7Q = 2 => P = 20/37 approx 54.05%. $
]

#pagebreak()

= NHÓM 2: GIẢI TÍCH, TÍCH PHÂN VÀ TỐI ƯU HÓA THỰC TẾ (CALCULUS & OPTIMIZATION)

Nhóm này ứng dụng đạo hàm, tích phân và cực trị để tối ưu hóa các đại lượng kinh tế, năng suất hoặc các mô hình thay đổi liên tục.

== 1. Tích phân trong kinh tế & Tốc độ thay đổi (CD-Kinh-Te-Tich-Phan / CD-TichPhan-TocDo-DoanhThu)
- *Ý tưởng chính:* Sử dụng tích phân xác định để tính tổng tích lũy của doanh thu, chi phí, hoặc thặng dư tiêu dùng/sản xuất khi biết tốc độ thay đổi liên tục.
#eg-box(title: "🎯 Ví dụ mẫu (Thặng dư tiêu dùng CS)")[
  Cho hàm cầu của một sản phẩm là $p(x) = 100 - 0.2 x^2$. Tìm thặng dư tiêu dùng tại mức giá cân bằng $p_0 = 80$.
  - *Mô hình toán:* Tìm lượng cân bằng $x_0$: $100 - 0.2 x_0^2 = 80 => x_0 = 10$.
    Thặng dư tiêu dùng (Consumer Surplus) được tính bằng công thức:
    $ C S = integral_0^(x_0) [p(x) - p_0] d x = integral_0^(10) (20 - 0.2 x^2) d x = [20x - frac(0.2 x^3, 3)]_0^(10) approx 133.33. $
]

== 2. Cực trị và tối ưu hóa đa điều kiện (CD-ToiUu-KinhTe-DaDieuKien / CD-NangSuat-NhaMay-ToiUu)
- *Ý tưởng chính:* Tìm giá trị lớn nhất, nhỏ nhất của hàm số nhiều biến dưới các điều kiện ràng buộc kinh tế hoặc sản xuất (sử dụng phương pháp thế hoặc đạo hàm).
#eg-box(title: "🎯 Ví dụ mẫu (Tối ưu hóa sản lượng nhà máy)")[
  Một nhà máy sản xuất hai loại sản phẩm với chi phí kết hợp là $C(x,y) = 2x^2 + x y + y^2$. Tổng sản lượng yêu cầu là $x + y = 100$. Tìm sản lượng mỗi loại để chi phí tối thiểu.
  - *Mô hình toán:* Thế $y = 100 - x$ vào hàm chi phí:
    $ f(x) = 2x^2 + x(100 - x) + (100 - x)^2 = 2x^2 - 100x + 10000. $
    Đạo hàm $f'(x) = 4x - 100 = 0 => x = 25 => y = 75$. Chi phí tối thiểu đạt được khi sản xuất 25 sản phẩm loại 1 và 75 sản phẩm loại 2.
]

== 3. Tối ưu chi phí ẩn & Vận tốc trượt (CD-ChiPhi-An-VanToc / CD-Tang-Giam-LienTuc)
- *Ý tưởng chính:* Thiết lập hàm chi phí phụ thuộc vào vận tốc hoặc thời gian di chuyển trong các môi trường khác nhau để tìm phương án tối ưu nhất.
#eg-box(title: "🎯 Ví dụ mẫu (Thời gian di chuyển ngắn nhất)")[
  Một người cần đi từ điểm $A$ trên bờ biển đến điểm $B$ ngoài đảo. Vận tốc chạy trên cát là $5$ km/h, vận tốc bơi trên biển là $3$ km/h. Tìm vị trí rẽ xuống biển để thời gian đi là ngắn nhất.
  - *Mô hình toán:* Thiết lập hàm thời gian $t(x) = frac(sqrt(a^2 + x^2), 3) + frac(d - x, 5)$ và giải phương trình đạo hàm $t'(x) = 0$ (Định luật Snell khúc xạ ánh sáng).
]

#pagebreak()

= NHÓM 3: HÌNH HỌC KHÔNG GIAN OXYZ VÀ CHUYỂN ĐỘNG (ANALYTICAL SPACE GEOMETRY)

Nhóm này ứng dụng phương pháp tọa độ Oxyz để giải quyết các bài toán chuyển động của vật thể, robot, hoặc tầm quét của cảm biến trong không gian 3 chiều.

== 1. Chuyển động trong Oxyz & Quét cảm biến (CD-Oxyz-ChuyenDong-CamBien / CD-DuongThang-Oxyz)
- *Ý tưởng chính:* Mô hình hóa quỹ đạo chuyển động bằng phương trình tham số trong không gian Oxyz và tính khoảng cách/điểm giao thoa theo thời gian $t$.
#eg-box(title: "🎯 Ví dụ mẫu (Khoảng cách ngắn nhất giữa hai chuyển động)")[
  Một máy bay chiến đấu bay theo đường thẳng $d: x = 1 + 2t, y = 2 - t, z = t$. Một trạm radar quét cảm biến phát hiện vật thể trong bán kính $R = 5$ km quanh điểm $I(1, 1, 2)$. Tìm khoảng thời gian máy bay nằm trong tầm quét của radar.
  - *Mô hình toán:* Khoảng cách từ máy bay đến radar tại thời điểm $t$ là:
    $ d(t) = sqrt((1+2t - 1)^2 + (2-t - 1)^2 + (t - 2)^2) = sqrt(6t^2 - 6t + 5). $
    Máy bay nằm trong tầm quét khi $d(t) <= 5 => 6t^2 - 6t + 5 <= 25 => 6t^2 - 6t - 20 <= 0$. Giải bất phương trình để tìm khoảng thời gian $t$.
]

== 2. Quỹ đạo tròn & Cực trị khoảng cách (CD-QuyDaoTron-KhoangCach / CD-min-max-DT-DuongTron)
- *Ý tưởng chính:* Giải quyết cực trị khoảng cách từ một điểm di động trên đường tròn đến một đường thẳng hoặc mặt cầu bằng cách sử dụng vectơ hoặc lượng giác hóa.
#eg-box(title: "🎯 Ví dụ mẫu (Cực trị khoảng cách mặt cầu - đường thẳng)")[
  Trong không gian Oxyz, cho mặt cầu $(S): (x-1)^2 + (y-2)^2 + (z-3)^2 = 9$ và đường thẳng $d: x = t, y = 1+t, z = 2-t$. Tìm khoảng cách ngắn nhất từ một điểm trên mặt cầu đến đường thẳng $d$.
  - *Mô hình toán:* Tìm khoảng cách từ tâm mặt cầu $I(1, 2, 3)$ đến đường thẳng $d$, ký hiệu là $d(I, d)$.
    Khoảng cách ngắn nhất từ mặt cầu đến đường thẳng là:
    $ d_("min") = d(I, d) - R = d(I, d) - 3. $
]

#pagebreak()

= NHÓM 4: HÌNH HỌC CỔ ĐIỂN, THIẾT DIỆN VÀ ĐƯỜNG CONIC (GEOMETRY & CONICS)

Nhóm này nghiên cứu các tính chất hình học phẳng và không gian của đường tròn, parabol, ellipse, hyperbola, thiết diện hình nón và sự tiếp xúc đồ thị.

== 1. Đường Conic đầy đủ & Khối xoay (CD-Conic-DayDu / CD-Conic-KhoiQuay / CD-Parabol)
- *Ý tưởng chính:* Khảo sát các bài toán thực tế và hình học liên quan đến ba đường Conic, tính thể tích vật thể tròn xoay tạo ra khi quay các đường này.
#eg-box(title: "🎯 Ví dụ mẫu (Gương phản xạ hình Parabol)")[
  Một đèn pha có chóa gương hình paraboloid xoay tròn. Mặt cắt dọc của chóa là một parabol có phương trình $y^2 = 4p x$. Bóng đèn được đặt tại tiêu điểm của parabol để tạo luồng sáng song song. Biết chóa đèn có đường kính miệng là 20 cm và chiều sâu là 10 cm. Tìm vị trí đặt bóng đèn.
  - *Mô hình toán:* Điểm trên parabol có tọa độ $(10, 10)$ nằm trên $y^2 = 4p x => 10^2 = 4p dot.c 10 => p = 2.5$.
    Tiêu điểm $F(p, 0) = (2.5, 0)$. Vậy bóng đèn cách đỉnh chóa 2.5 cm.
]

== 2. Thiết diện Parabol của hình nón (CD-Thiet-Dien-Parabol-Hinh-Non)
- *Ý tưởng chính:* Xác định hình phẳng thiết diện cắt bởi mặt phẳng song song với đường sinh của hình nón, tính diện tích thiết diện parabol.
#eg-box(title: "🎯 Ví dụ mẫu (Diện tích thiết diện Parabol)")[
  Cắt một hình nón bằng một mặt phẳng song song với một đường sinh của nó. Thiết diện thu được là một parabol có chiều cao $h$ và độ rộng đáy $w$. Tính diện tích thiết diện này theo $h$ và $w$.
  - *Mô hình toán:* Áp dụng công thức tính diện tích hình phẳng giới hạn bởi parabol:
    $ S = frac(2, 3) dot.c w dot.c h. $
]

== 3. Sự tiếp xúc của hai đường cong (CD-Sự-Tiếp-Xúc-2-Đường-Cong)
- *Ý tưởng chính:* Tìm điều kiện để đồ thị của hai hàm số tiếp xúc nhau tại một điểm (chung tiếp điểm và chung tiếp tuyến).
#eg-box(title: "🎯 Ví dụ mẫu (Hai đường cong tiếp xúc)")[
  Tìm giá trị của tham số $m$ để parabol $(P): y = x^2 + m$ tiếp xúc với đường thẳng $d: y = 2x + 1$.
  - *Mô hình toán:* Hệ điều kiện tiếp xúc tại hoành độ tiếp điểm $x_0$:
    $ heva(x_0^2 + m = 2x_0 + 1, 2x_0 = 2) => x_0 = 1 => 1^2 + m = 2(1) + 1 => m = 2. $
]

#pagebreak()

= NHÓM 5: MÔ HÌNH HÓA VẬT LÝ VÀ CỰC TRỊ THỰC TẾ (PHYSICAL MODELING)

Nhóm này ứng dụng toán học để mô phỏng các hiện tượng vật lý thực tế như đường bay chim săn mồi, treo vật nặng, vật chắn tầm nhìn hoặc tối ưu hóa góc quan sát.

== 1. Mô hình chim săn mồi & Cánh tay robot (CD-Chim-Săn-Mồi / Cánh-Tay-Robot)
- *Ý tưởng chính:* Thiết lập phương trình chuyển động của vật dựa trên các lực vật lý hoặc hàm số lượng giác để tìm quỹ đạo di chuyển tối ưu.
#eg-box(title: "🎯 Ví dụ mẫu (Đường bay chim săn mồi)")[
  Một con chim ưng bay sà xuống săn mồi trên mặt đất theo quỹ đạo parabol $y = a x^2 + b x + c$. Nó xuất phát từ cành cây cao 10m và bắt được con mồi tại điểm cách gốc cây 20m. Tìm độ cao thấp nhất trong quỹ đạo bay nếu biết chim chạm đất tại đúng điểm bắt mồi.
  - *Mô hình toán:* Đỉnh của parabol nằm tại điểm bắt mồi $(20, 0)$ trên mặt đất. Phương trình quỹ đạo có dạng $y = a(x - 20)^2$.
    Vì xuất phát từ độ cao 10m tại gốc cây ($x=0$): $10 = a(0 - 20)^2 => a = frac(10, 400) = 0.025$.
    Quỹ đạo là $y = 0.025(x - 20)^2$. Độ cao thấp nhất chính là $y = 0$ tại $x = 20$.
]

== 2. Bài toán treo vật nặng & Căng dây (CD-Treo-Vật)
- *Ý tưởng chính:* Áp dụng các điều kiện cân bằng lực vật lý (hợp lực bằng 0) kết hợp lượng giác để tìm góc treo hoặc chiều dài dây tối ưu giảm lực căng dây.
#eg-box(title: "🎯 Ví dụ mẫu (Tối thiểu hóa lực căng dây)")[
  Một bức tranh nặng $P = 10$ N được treo bằng hai sợi dây đối xứng tạo với trần nhà một góc $theta$. Tìm góc $theta$ để lực căng dây $T$ nhỏ nhất.
  - *Mô hình toán:* Điều kiện cân bằng lực theo phương thẳng đứng:
    $ 2 T sin theta = P => T(theta) = frac(P, 2 sin theta). $
    Lực căng $T$ nhỏ nhất khi $sin theta$ lớn nhất $=> theta = 90 degree$ (dây treo thẳng đứng).
]

== 3. Góc nhìn tối ưu & Vật chắn tầm nhìn (CD-Vật-Chắn-Tầm-Nhìn)
- *Ý tưởng chính:* Thiết lập hàm số lượng giác thể hiện góc quan sát của mắt đối với một bức tranh hoặc bảng hiệu quảng cáo bị che khuất một phần, sử dụng đạo hàm để tìm góc nhìn lớn nhất.
#eg-box(title: "🎯 Ví dụ mẫu (Góc nhìn quảng cáo lớn nhất)")[
  Một bảng quảng cáo cao 3m được treo trên tường, mép dưới bảng cách mắt người quan sát 2m. Người đó đứng cách tường một khoảng $x$. Tìm $x$ để góc nhìn từ mắt đến bảng là lớn nhất.
  - *Mô hình toán:* Sử dụng công thức hiệu của hai góc tang:
    $ tan theta(x) = tan(alpha - beta) = frac(frac(5, x) - frac(2, x), 1 + frac(5, x) dot.c frac(2, x)) = frac(3x, x^2 + 10). $
    Để góc nhìn $theta$ lớn nhất, ta cần tìm giá trị lớn nhất của hàm số $g(x) = frac(3x, x^2 + 10)$.
    Theo bất đẳng thức Cauchy: $x^2 + 10 >= 2 sqrt(10) x => g(x) <= frac(3, 2 sqrt(10))$. Dấu bằng xảy ra khi $x = sqrt(10) approx 3.16$ m.
]
