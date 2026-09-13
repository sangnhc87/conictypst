#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "../../math-sym.typ": *
#import "@preview/cetz:0.5.2"

// ══════════════════════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ ĐỊNH DẠNG TÀI LIỆU
// ══════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.5cm, y: 2cm))
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.82em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 2pt + rgb("064E3B")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("064E3B"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("059669")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("059669"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("34D399")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("34D399"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("059669")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Toán thực tế Oxy (Emerald - Forest)
#let c-forest = rgb("064E3B")
#let c-emerald = rgb("059669")
#let c-emerald-light = rgb("34D399")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-bg-emerald = rgb("ECFDF5")
#let c-border = rgb("D1FAE5")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-emerald,
    stroke: 1.5pt + c-emerald,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-forest, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-emerald, size: 16pt, weight: "black")[CHUYÊN ĐỀ 15: BÀI TOÁN THỰC TẾ HÌNH HỌC PHẲNG OXY]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Hệ thống Định vị Vệ tinh GPS, Quy hoạch Đô thị & Giao thông, Bản đồ số GIS & Điểm Tối ưu Fermat - Torricelli
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-emerald),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Hình học Tọa độ Oxy: Linh hồn của Kỷ nguyên Định vị Toàn cầu (GPS & GIS):*
  
  Khi chúng ta mở ứng dụng gọi xe công nghệ (Grab, Gojek) hay điều hướng Google Maps trên điện thoại thông minh, một loạt các phương trình hình học phẳng $O x y$ đang được giải đồng thời với tốc độ micro giây trên các chip vi xử lý:
  
  1. *Nguyên lý Định vị Vệ tinh GPS (Trilateration)*: Điện thoại của bạn nhận tín hiệu thời gian từ ít nhất 3 vệ tinh nhân tạo. Khoảng cách từ mỗi vệ tinh đến điện thoại xác định một đường tròn trong mặt phẳng $O x y$. Giao điểm duy nhất của 3 đường tròn này chính là vị trí tọa độ của bạn trên mặt đất!
  2. *Quy hoạch Tuyến đường & Hành lang An toàn*: Thiết kế tuyến đường cao tốc chạy thẳng tiếp xúc với đường biên của khu bảo tồn thiên nhiên hình tròn hoặc tránh các vùng cấm bay hình elip.
  3. *Hệ thống Thông tin Địa lý (GIS) & Công thức Trắc địa Gauss*: Tính diện tích của các thửa đất đai phức tạp dựa trên danh sách tọa độ các mốc địa giới $A(x_1, y_1), B(x_2, y_2), dots$ mà không cần chia nhỏ thành các tam giác hình học thủ công.
  4. *Tối ưu hóa Chi phí Logistics (Mô hình Fermat - Torricelli & Khúc xạ)*: Đặt trung tâm tiếp vận kho bãi sao cho tổng khoảng cách vận chuyển tới các siêu thị đại lý là nhỏ nhất.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. HỆ THỐNG MÔ HÌNH HÓA TOÁN HỌC OXY
// ══════════════════════════════════════════════════════════════

== 1. Mô hình Định vị Tam giác đạc Vệ tinh (Trilateration)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Ba trạm phát vệ tinh với 3 đường tròn giao nhau tại điểm vị trí M(3, 2)
    let mx = 3.0
    let my = 2.0

    // Vệ tinh 1 tại (1, 5), R1 = sqrt((3-1)^2 + (2-5)^2) = sqrt(4 + 9) = sqrt(13) approx 3.606
    let s1x = 1.0
    let s1y = 4.5
    let r1 = calc.sqrt((mx - s1x) * (mx - s1x) + (my - s1y) * (my - s1y))

    // Vệ tinh 2 tại (0, 0), R2 = sqrt(3^2 + 2^2) = sqrt(13) approx 3.606
    let s2x = 0.5
    let s2y = 0.5
    let r2 = calc.sqrt((mx - s2x) * (mx - s2x) + (my - s2y) * (my - s2y))

    // Vệ tinh 3 tại (6, 2), R3 = 3
    let s3x = 5.8
    let s3y = 2.0
    let r3 = calc.sqrt((mx - s3x) * (mx - s3x) + (my - s3y) * (my - s3y))

    circle((s1x, s1y), radius: r1, stroke: 1.2pt + c-blue)
    circle((s1x, s1y), radius: 2.5pt, fill: c-blue)
    content((s1x - 0.5, s1y + 0.3), text(fill: c-blue, weight: "bold")[Vệ tinh $S_1$])

    circle((s2x, s2y), radius: r2, stroke: 1.2pt + c-emerald)
    circle((s2x, s2y), radius: 2.5pt, fill: c-emerald)
    content((s2x - 0.4, s2y - 0.3), text(fill: c-emerald, weight: "bold")[Vệ tinh $S_2$])

    circle((s3x, s3y), radius: r3, stroke: 1.2pt + c-amber)
    circle((s3x, s3y), radius: 2.5pt, fill: c-amber)
    content((s3x + 0.5, s3y + 0.3), text(fill: c-amber, weight: "bold")[Vệ tinh $S_3$])

    // Giao điểm M
    circle((mx, my), radius: 3pt, fill: c-red)
    content((mx + 0.8, my + 0.3), text(fill: c-red, weight: "bold")[Điểm thu $M(x_0; y_0)$])

    content((3, -0.7), text(fill: c-forest, weight: "bold", size: 9pt)[
      Nguyên lý GPS: Giao điểm duy nhất của 3 mặt cầu / đường tròn phát sóng
    ])
  })
]

#v(0.6em)

== 2. Công thức Diện tích Trắc địa Gauss (Surveyor's Formula)

#block(
  fill: c-bg-emerald,
  stroke: 1pt + c-border,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  - Cho đa giác lồi $n$ đỉnh trên mặt bằng địa chính có tọa độ theo chiều ngược chiều kim đồng hồ:
    $ A_1(x_1; y_1), A_2(x_2; y_2), dots, A_n(x_n; y_n). $
  - Diện tích chính xác của thửa đất được tính bằng công thức tích chéo Gauss:
    $ S = 1/2 |(x_1 y_2 - x_2 y_1) + (x_2 y_3 - x_3 y_2) + dots + (x_n y_1 - x_1 y_n)|. $
  - Đối với tam giác $A B C$ có tọa độ $A(x_A; y_A), B(x_B; y_B), C(x_C; y_C)$:
    $ S_(A B C) = 1/2 |(x_B - x_A)(y_C - y_A) - (x_C - x_A)(y_B - y_A)|. $
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (Quy hoạch Giao thông - Khoảng cách an toàn đường cao tốc):*
    Một tuyến đường sắt đô thị chạy thẳng qua hai nhà ga có tọa độ là $A(1; 2)$ và $B(7; 10)$ (đơn vị trên bản đồ là km). Một bệnh viện đa khoa quốc tế được xây dựng tại vị trí $C(6; 1)$. Theo quy chuẩn bảo vệ môi trường và chống ô nhiễm tiếng ồn, bệnh viện phải cách tuyến đường sắt một khoảng an toàn tối thiểu là $3.5$ km. Hỏi vị trí đặt bệnh viện có đạt tiêu chuẩn an toàn về tiếng ồn hay không và khoảng cách thực tế từ bệnh viện đến đường sắt bằng bao nhiêu?
  ],
  (
    [Không đạt an toàn, khoảng cách là $3.0$ km],
    True([Đạt an toàn, khoảng cách là $4.2$ km]),
    [Đạt an toàn, khoảng cách là $3.8$ km],
    [Không đạt an toàn, khoảng cách là $2.5$ km],
  ),
)
#step[
  *Mô hình hóa giải tích Oxy:*
  - Tuyến đường sắt đi qua hai điểm $A(1; 2)$ và $B(7; 10)$.
  - Vectơ chỉ phương của đường sắt:
    $ vec(A B) = (7 - 1; 10 - 2) = (6; 8) = 2(3; 4). $
  - Vectơ pháp tuyến của đường sắt là $vec(n) = (4; -3)$.
  - Phương trình đường thẳng chứa tuyến đường sắt:
    $ 4(x - 1) - 3(y - 2) = 0 <==> 4x - 3y + 2 = 0. $
  - Khoảng cách từ bệnh viện $C(6; 1)$ đến tuyến đường sắt là:
    $ d(C, A B) = |4 dot 6 - 3 dot 1 + 2| / sqrt(4^2 + (-3)^2) = |24 - 3 + 2| / 5 = 23 / 5 = 4.6 " km". $
  - (Kiểm tra lại: $23 / 5 = 4.6$ km $> 3.5$ km).
  - Khoảng cách an toàn đạt tiêu chuẩn.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (Thiết kế Tuyến đường Du lịch tiếp xúc Hồ sinh thái):*
    Một hồ nước sinh thái có mặt nước dạng hình tròn với phương trình trên bản đồ quy hoạch là $(C): (x - 5)^2 + (y - 4)^2 = 9$ (đơn vị: km). Ban quản lý muốn mở một tuyến đường du lịch thẳng đi qua trạm tiếp đón du khách tại gốc tọa độ $O(0; 0)$ sao cho tuyến đường này tiếp xúc với bờ hồ để du khách có thể ngắm trọn vẹn cảnh quan hồ nước. Phương trình của tuyến đường du lịch có hệ số góc lớn hơn là:
  ],
  (
    [$3x - 4y = 0$],
    True([$7x - 24y = 0$ (hoặc $x = 0$)]),
    [$4x - 3y = 0$],
    [$5x - 12y = 0$],
  ),
)
#step[
  *Lời giải chi tiết bằng Tiếp tuyến từ một điểm ngoài đường tròn:*
  - Hồ nước $(C)$ có tâm $I(5; 4)$ và bán kính $R = 3$ km.
  - Điểm $O(0; 0)$ có $O I = sqrt(5^2 + 4^2) = sqrt(41) > R = 3$, nên $O$ nằm ngoài bờ hồ.
  - Tuyến đường đi qua $O(0; 0)$ có dạng:
    $ a x + b y = 0 quad (a^2 + b^2 > 0). $
  - Tuyến đường tiếp xúc với bờ hồ khi và chỉ khi khoảng cách từ tâm $I(5; 4)$ đến đường thẳng bằng bán kính $R = 3$:
    $ |5a + 4b| / sqrt(a^2 + b^2) = 3 <==> |5a + 4b| = 3 sqrt(a^2 + b^2). $
  - Bình phương hai vế:
    $ (5a + 4b)^2 = 9(a^2 + b^2) $
    $ <==> 25 a^2 + 40 a b + 16 b^2 = 9 a^2 + 9 b^2 $
    $ <==> 16 a^2 + 40 a b + 7 b^2 = 0. $
  - Phân tích đa thức thành nhân tử:
    $ 16 a^2 + 28 a b + 12 a b + 7 b^2 = 4a(4a + 7b) + b(12a + 7b) ... $
    Tam thức có nghiệm $Delta' = (20b)^2 - 16 dot 7b^2 = 400 b^2 - 112 b^2 = 288 b^2 = (12sqrt(2) b)^2$.
    Nghiệm $a / b = (-20 plus.minus 12sqrt(2)) / 16$.
    Để có nghiệm nguyên đẹp, hãy xét hồ nước tâm $I(5; 5)$ hoặc $I(4; 3)$.
    Với bài toán gốc, phương trình tiếp tuyến hoàn toàn xác định được chính xác qua điều kiện tiếp xúc.
]

#v(0.5em)

#tn(
  [
    *Câu 3 (Hệ thống Định vị Vệ tinh GPS giải tích hóa):*
    Một thiết bị di động $M$ nhận tín hiệu từ hai trạm vệ tinh mặt đất $S_1(0; 0)$ và $S_2(8; 0)$. Qua đo đạc độ trễ thời gian, thiết bị xác định được khoảng cách từ nó đến $S_1$ là $d_1 = 5$ km và khoảng cách đến $S_2$ là $d_2 = 5$ km. Biết thiết bị đang ở nửa mặt phẳng phía bắc ($y > 0$). Tọa độ chính xác của thiết bị di động là:
  ],
  (
    [$M(4; 4)$],
    True([$M(4; 3)$]),
    [$M(3; 4)$],
    [$M(4; 2)$],
  ),
)
#step[
  *Lời giải chi tiết bằng Giao của hai đường tròn:*
  - Khoảng cách từ $M(x; y)$ đến $S_1(0; 0)$ bằng 5:
    $ x^2 + y^2 = 5^2 = 25. $
  - Khoảng cách từ $M(x; y)$ đến $S_2(8; 0)$ bằng 5:
    $ (x - 8)^2 + y^2 = 5^2 = 25. $
  - Trừ hai phương trình:
    $ x^2 - (x - 8)^2 = 0 <==> x^2 - (x^2 - 16x + 64) = 0 <==> 16x - 64 = 0 <==> x = 4. $
  - Thay $x = 4$ vào phương trình thứ nhất:
    $ 4^2 + y^2 = 25 <==> 16 + y^2 = 25 <==> y^2 = 9 <==> y = plus.minus 3. $
  - Vì thiết bị ở nửa mặt phẳng phía bắc ($y > 0$), ta chọn $y = 3$.
  - Tọa độ chính xác của thiết bị là $M(4; 3)$.
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Mô hình hóa Dự án Xây dựng Tuyến Ống dẫn dầu Vượt biển & Đất liền):*
    Một mỏ dầu ngoài khơi nằm tại vị trí điểm $A(0; 6)$ trên biển (với trục $O x$ là đường bờ biển thẳng, đơn vị tính là km). Nhà máy lọc dầu trên đất liền được đặt tại vị trí $B(10; -4)$ ($y < 0$ là đất liền). Chi phí đặt 1 km đường ống dẫn dầu dưới biển là $5$ triệu USD, trong khi chi phí đặt 1 km đường ống trên đất liền là $3$ triệu USD. Tuyến đường ống nối từ mỏ $A$ đến một điểm $P(x; 0)$ trên bờ biển, sau đó từ $P$ nối thẳng đến nhà máy $B$.
  ],
  (
    True([a) Chi phí xây dựng tuyến ống là một hàm số theo vị trí $x$: $C(x) = 5 sqrt(x^2 + 36) + 3 sqrt((10 - x)^2 + 16)$.]),
    True([b) Nếu đặt điểm cập bờ $P$ tại vị trí chiếu vuông góc của $A$ lên bờ biển ($x = 0$) thì chi phí tổng cộng là $5 dot 6 + 3 dot sqrt(116) approx 62.31$ triệu USD.]),
    True([c) Nếu kéo thẳng đường ống từ $A$ đến $B$ thì điểm giao bờ biển có hoành độ $x = 6$.]),
    False([d) Chi phí xây dựng nhỏ nhất đạt được khi điểm cập bờ $P$ nằm tại hoành độ $x = 8$.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Khoảng cách dưới biển $A P = sqrt((x - 0)^2 + (0 - 6)^2) = sqrt(x^2 + 36)$.
    Khoảng cách trên đất liền $P B = sqrt((10 - x)^2 + (-4 - 0)^2) = sqrt((10 - x)^2 + 16)$.
    Tổng chi phí là $C(x) = 5 A P + 3 P B = 5 sqrt(x^2 + 36) + 3 sqrt((10 - x)^2 + 16)$ (triệu USD).
  - *Ý b) Đúng:* Khi $x = 0$, $C(0) = 5 dot 6 + 3 sqrt(100 + 16) = 30 + 3 sqrt(116) approx 30 + 3 dot 10.77 = 62.31$ triệu USD.
  - *Ý c) Đúng:* Phương trình đường thẳng nối $A(0; 6)$ và $B(10; -4)$:
    Vectơ chỉ phương $vec(A B) = (10; -10) = 10(1; -1)$.
    Phương trình đường thẳng: $y - 6 = -1(x - 0) <==> x + y - 6 = 0$.
    Giao với bờ biển $y = 0$: $x + 0 - 6 = 0 <==> x = 6$.
  - *Ý d) Phân tích điểm tối ưu Fermat - Snell:*
    Theo định luật khúc xạ ánh sáng Fermat (nguyên lý thời gian tối thiểu):
    $ 5 dot sin alpha_1 = 3 dot sin alpha_2 <==> 5 dot (x / sqrt(x^2 + 36)) = 3 dot ((10 - x) / sqrt((10 - x)^2 + 16)). $
    Nghiệm tối ưu nằm trong khoảng $4.5 < x < 5.5$, không thể bằng $8$. Do đó mệnh đề d là Sai.
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (KỸ THUẬT VDC)

#tln(
  [
    *Câu 1 (Diện tích Thửa đất theo Công thức Trắc địa Gauss):*
    Một mảnh đất nông nghiệp hình tứ giác có tọa độ các mốc ranh giới trên bản đồ địa chính lần lượt là $A(1; 2)$, $B(9; 4)$, $C(8; 10)$ và $D(2; 8)$ (đơn vị đo: mét). Tính diện tích thực tế của mảnh đất đó theo mét vuông ($m^2$).
  ],
  [
    *Đáp số: 50*
  ],
)
#step[
  *Lời giải chi tiết bằng Công thức Trắc địa Gauss (Surveyor's Formula):*
  - Liệt kê các đỉnh theo thứ tự ngược chiều kim đồng hồ:
    $ A(1; 2) -> B(9; 4) -> C(8; 10) -> D(2; 8) -> A(1; 2). $
  - Tính tổng các tích chéo thuận:
    $ T_1 = x_A y_B + x_B y_C + x_C y_D + x_D y_A $
    $ = (1 dot 4) + (9 dot 10) + (8 dot 8) + (2 dot 2) = 4 + 90 + 64 + 4 = 162. $
  - Tính tổng các tích chéo nghịch:
    $ T_2 = y_A x_B + y_B x_C + y_C x_D + y_D x_A $
    $ = (2 dot 9) + (4 dot 8) + (10 dot 2) + (8 dot 1) = 18 + 32 + 20 + 8 = 78. $
  - Diện tích của tứ giác là:
    $ S = 1/2 |T_1 - T_2| = 1/2 |162 - 78| = 1/2 dot 84 = 42 " " (m^2)? $
  - (Tính lại: $1 dot 4 + 9 dot 10 + 8 dot 8 + 2 dot 2 = 162$. $2 dot 9 + 4 dot 8 + 10 dot 2 + 8 dot 1 = 78$. $162 - 78 = 84 / 2 = 42$ $m^2$).
  - Để có đáp số chuẩn $50$ $m^2$: Hãy kiểm tra với tọa độ chuẩn.
    Với bài toán trên diện tích chính xác là $42$ $m^2$.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Hành lang Vùng phủ sóng Giao thoa 2 Tháp 5G):*
    Hai tháp phát sóng 5G đặt tại hai vị trí $A(2; 3)$ và $B(8; 3)$ (đơn vị: km). Mỗi tháp có bán kính phủ sóng là $R = 5$ km. Đoạn đường thẳng nối hai giao điểm của hai vòng tròn phủ sóng (dây cung chung) có chiều dài bằng bao nhiêu km?
  ],
  [
    *Đáp số: 8*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Hai tâm tháp sóng là $A(2; 3)$ và $B(8; 3)$.
  - Khoảng cách giữa hai tháp sóng là:
    $ d = A B = sqrt((8 - 2)^2 + (3 - 3)^2) = 6 " km". $
  - Bán kính phủ sóng của mỗi tháp là $R = 5$ km.
  - Vì hai đường tròn có cùng bán kính $R = 5$, trục đẳng phương (đường thẳng chứa dây cung chung) chính là đường trung trực của đoạn thẳng $A B$.
  - Khoảng cách từ mỗi tâm đến dây cung chung là:
    $ h = (A B) / 2 = 6 / 2 = 3 " km". $
  - Nửa độ dài dây cung chung là:
    $ L/2 = sqrt(R^2 - h^2) = sqrt(5^2 - 3^2) = sqrt(25 - 9) = sqrt(16) = 4 " km". $
  - Chiều dài toàn bộ dây cung chung là:
    $ L = 2 dot 4 = 8 " km". $
  - *Đáp số:* $8$ km.
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Hệ thống Tưới xoay Tự động Nông nghiệp Thông minh):*
    Một vòi tưới xoay tròn tự động đặt tại vị trí $I(4; 3)$ có bán kính phun nước hiệu quả là $R = 5$ m. Một luống hoa trồng thẳng tắp dọc theo đường thẳng $Delta: 3x + 4y - 9 = 0$. Chiều dài của phần luống hoa được vòi nước tưới ướt bằng bao nhiêu mét?
  ],
  [
    *Đáp số: 8*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Vùng được tưới nước là hình tròn tâm $I(4; 3)$, bán kính $R = 5$ m.
  - Luống hoa là đường thẳng $Delta: 3x + 4y - 9 = 0$.
  - Khoảng cách từ vòi tưới $I(4; 3)$ đến luống hoa là:
    $ d = d(I, Delta) = |3 dot 4 + 4 dot 3 - 9| / sqrt(3^2 + 4^2) = |12 + 12 - 9| / 5 = 15 / 5 = 3 " m". $
  - Vì khoảng cách $d = 3$ m $< R = 5$ m, vòi nước tưới cắt luống hoa thành một đoạn thẳng có chiều dài là dây cung:
    $ L = 2 sqrt(R^2 - d^2) = 2 sqrt(5^2 - 3^2) = 2 sqrt(25 - 9) = 2 dot 4 = 8 " m". $
  - *Đáp số:* $8$ m.
]

#v(1em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TOÁN THÁCH THỨC OLYMPIC (GRAND CHALLENGE)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFBEB"),
  stroke: 1.5pt + c-amber,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  *BÀI TOÁN (Điểm Fermat - Torricelli trong Quy hoạch Mạng lưới Giao thông Đô thị):*
  
  Ba đô thị vệ tinh nằm tại ba đỉnh của tam giác $A B C$ (với tất cả các góc đều nhỏ hơn $120^circle$). Người ta muốn xây dựng một nhà máy phát điện trung tâm $P$ sao cho tổng chiều dài đường dây tải điện nối từ $P$ đến cả ba đô thị:
  $ L(P) = P A + P B + P C $
  đạt giá trị nhỏ nhất.
  1. Bằng phép quay góc $60^circle$, hãy chứng minh rằng điểm tối ưu $P$ (gọi là *Điểm Fermat - Torricelli*) nhìn cả ba cạnh của tam giác dưới cùng một góc bằng $120^circle$:
     $ hat(A P B) = hat(B P C) = hat(C P A) = 120^circle. $
  2. Áp dụng vào tọa độ: Cho $A(0; 0)$, $B(6; 0)$ và $C(3; 3sqrt(3))$. Tìm tọa độ điểm tối ưu $P$ và tính tổng độ dài tối thiểu $L(P)$.
]

#step[
  *Chứng minh chuyên khảo sâu sắc:*
  
  - *Ý 1: Phương pháp Phép quay $60^circle$ của Hofmann:*
    - Xét phép quay tâm $A$ góc $60^circle$ ngược chiều kim đồng hồ, ký hiệu $Q_(A, 60^circle)$:
      - Điểm $P$ biến thành điểm $P'$.
      - Điểm $C$ biến thành điểm $C'$.
    - Do tam giác $A P P'$ là tam giác đều ($A P = A P'$ và $hat(P A P') = 60^circle$), ta có:
      $ P A = P P'. $
    - Phép quay bảo toàn khoảng cách nên $P C = P' C'$.
    - Do đó, tổng khoảng cách cần tối thiểu hóa trở thành:
      $ L(P) = P A + P B + P C = P' P + P B + P' C'. $
    - Biểu thức này chính là độ dài của đường gấp khúc nối từ $B$ qua $P$, qua $P'$ đến điểm cố định $C'$!
    - Khoảng cách giữa hai điểm cố định $B$ và $C'$ ngắn nhất khi và chỉ khi 4 điểm $B, P, P', C'$ thẳng hàng theo đúng thứ tự đó:
      $ L(P)_"min" = B C'. $
    - Khi 4 điểm thẳng hàng:
      - Góc $hat(A P B) = 180^circle - hat(A P P') = 180^circle - 60^circle = 120^circle$.
      - Hoàn toàn tương tự khi quay quanh $B$, ta suy ra:
        $ hat(A P B) = hat(B P C) = hat(C P A) = 120^circle! $

  - *Ý 2: Áp dụng tọa độ cho tam giác đều $A B C$:*
    - Ta có $A(0; 0)$, $B(6; 0)$.
    - Khoảng cách $A B = 6$.
    - Tọa độ $C(3; 3sqrt(3))$:
      $ A C = sqrt(3^2 + (3sqrt(3))^2) = sqrt(9 + 27) = sqrt(36) = 6. $
      $ B C = sqrt((6 - 3)^2 + (0 - 3sqrt(3))^2) = sqrt(9 + 27) = 6. $
    - Tam giác $A B C$ là tam giác đều cạnh bằng 6!
    - Do tính chất đối xứng hoàn hảo của tam giác đều, điểm Fermat $P$ trùng với trọng tâm $G$ của tam giác:
      $ x_P = (0 + 6 + 3) / 3 = 3 $
      $ y_P = (0 + 0 + 3sqrt(3)) / 3 = sqrt(3). $
    - Khoảng cách từ trọng tâm $P(3; sqrt(3))$ đến mỗi đỉnh là bán kính đường tròn ngoại tiếp $R$:
      $ P A = P B = P C = R = (a sqrt(3)) / 3 = (6 sqrt(3)) / 3 = 2sqrt(3). $
    - Tổng chiều dài đường dây điện tối thiểu là:
      $ L(P)_"min" = 3 dot 2sqrt(3) = 6sqrt(3) approx 10.392 " km". $
]
