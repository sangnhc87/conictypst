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
  stroke: (bottom: 2pt + rgb("0F766E")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("0F766E"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("0D9488")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("0D9488"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("14B8A6")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("14B8A6"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("0D9488")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Toán thực tế Hàm bậc hai (Teal - Cyan)
#let c-teal-dark = rgb("0F766E")
#let c-teal = rgb("0D9488")
#let c-teal-light = rgb("14B8A6")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-emerald = rgb("059669")
#let c-bg-teal = rgb("F0FDFA")
#let c-border = rgb("CCFBF1")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-teal,
    stroke: 1.5pt + c-teal,
    radius: 8pt,
    width: 100%,
    inset: (x: 15pt, y: 12pt),
  )[
    #text(fill: c-teal-dark, size: 11pt, weight: "bold")[BỘ GIÁO ÁN VẬN DỤNG CAO TOÁN 10 — CHUYÊN ĐỀ CHUYÊN SÂU] \
    #v(4pt)
    #text(fill: c-teal, size: 16pt, weight: "black")[CHUYÊN ĐỀ 7.1: BÀI TẬP TOÁN THỰC TẾ LIÊN QUAN ĐẾN HÀM SỐ BẬC HAI]\
    #v(3pt)
    #text(fill: rgb("4B5563"), size: 10pt, style: "italic")[
      Mô hình hóa Parabol trong Cổng vòm Kiến trúc, Dây cáp Cầu treo, Quỹ đạo ném xiên & Tối ưu hóa Doanh thu Kinh tế
    ]
  ]
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
// LỜI NÓI ĐẦU & TƯ TƯỞNG SƯ PHẠM
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-teal),
  inset: 12pt,
  radius: (right: 6pt),
  width: 100%,
)[
  *Tư duy Mô hình hóa Toán học (Mathematical Modeling) với Hàm số bậc hai:*
  
  Mô hình hóa toán học là quá trình chuyển đổi một bài toán trong đời sống thực tế thành một bài toán toán học trừu tượng, giải quyết bằng các công cụ toán học chuẩn xác, và sau đó diễn giải kết quả trở lại thực tế. Trong chương trình Toán 10 mới (GDPT 2018), hàm số bậc hai $y = a x^2 + b x + c$ là "ngôi sao trung tâm" của năng lực mô hình hóa:
  
  1. *Nguyên lý Kiến trúc vòm & Cầu treo*: Dây cáp của cầu treo chịu tải trọng phân bố đều theo phương ngang có hình dạng giải tích chính xác là một nhánh Parabol. Các cổng vòm Parabol có khả năng chuyển lực nén dọc theo thân vòm xuống chân móng, triệt tiêu ứng suất uốn nguy hiểm.
  2. *Động học chất điểm & Quỹ đạo đạn đạo (Ballistics)*: Dưới tác dụng duy nhất của gia tốc trọng trường $vec(g)$, một vật thể ném đi với vận tốc ban đầu $v_0$ và góc nghiêng $alpha$ luôn vạch ra quỹ đạo Parabol $y = x tan alpha - (g x^2) / (2 v_0^2 cos^2 alpha)$.
  3. *Quang học hội tụ & Gương Paraboloid*: Tính chất quang học kỳ diệu của Parabol: mọi tia sáng phát ra từ tiêu điểm $F$ sau khi phản xạ trên bề mặt Parabol đều trở thành chùm sáng song song với trục đối xứng (đèn pha ô tô, đèn pin chiếu xa, lò nung năng lượng mặt trời).
  4. *Tối ưu hóa Kinh tế vi mô (Revenue & Profit Maximization)*: Khi giá bán $p$ phụ thuộc tuyến tính vào lượng cầu $q$ ($p = A - B q$), hàm tổng doanh thu $R(q) = p dot q = A q - B q^2$ là một hàm bậc hai có bề lõm quay xuống ($a = -B < 0$), luôn tồn tại một mức sản lượng độc nhất tối đa hóa doanh thu tại đỉnh Parabol.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. PHƯƠNG PHÁP THIẾT LẬP HỆ TRỤC TỌA ĐỘ TỐI ƯU HÓA
// ══════════════════════════════════════════════════════════════

Khi giải một bài toán hình học thực tế liên quan đến Parabol (như cổng vòm, cầu treo, đài phun nước), *việc chọn hệ trục tọa độ $O x y$ quyết định 70% độ phức tạp của bài toán*. Dưới đây là 3 cách đặt trục tọa độ kinh điển:

#v(0.4em)

#table(
  columns: (2.5fr, 3.5fr, 4fr),
  fill: (col, row) => if row == 0 { c-teal } else if calc.even(row) { rgb("F0FDFA") } else { none },
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  inset: 7pt,
  stroke: 0.5pt + rgb("CBD5E0"),
  [#text(fill: white, weight: "bold")[Cách chọn hệ trục $O x y$]],
  [#text(fill: white, weight: "bold")[Dạng phương trình Parabol]],
  [#text(fill: white, weight: "bold")[Ưu điểm & Tình huống áp dụng]],

  [*Cách 1: Gốc $O$ tại Đỉnh Parabol* \ ($O equiv I$)],
  [$y = -a x^2$ \ (hoặc $y = a x^2$)],
  [Phương trình khuyết $b = 0, c = 0$. Cực kỳ ngắn gọn khi bài toán cho biết trước chiều cao và bề rộng đối xứng.],

  [*Cách 2: Gốc $O$ tại Trung điểm đáy cổng* \ (Trục tung $O y$ trùng trục đối xứng)],
  [$y = H - a x^2$ \ với $H$ là chiều cao đỉnh vòm],
  [*Được khuyên dùng nhiều nhất!* Tọa độ đỉnh là $I(0; H)$, hai chân vòm là $(plus.minus L/2; 0)$. Xác định $a = (4 H) / L^2$ ngay lập tức!],

  [*Cách 3: Gốc $O$ tại một chân vòm* \ (Chân trái hoặc chân tháp)],
  [$y = -a x (x - L)$ \ với $L$ là bề rộng nhịp vòm],
  [Phù hợp với bài toán quỹ đạo ném từ mặt đất hoặc khi các mốc đo đạc tính từ một bên mép đường.],
)

#v(0.6em)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    // Mô phỏng Cổng vòm Parabol và xe tải chui lọt
    // Chiều cao H = 6m, bề rộng đáy L = 8m
    // Gốc O tại trung điểm chân vòm: y = 6 - (6/16) x^2 = 6 - 0.375 x^2
    let scale_x = 0.8
    let scale_y = 0.6

    // Trục tọa độ
    line((-5 * scale_x, 0), (5 * scale_x, 0), stroke: 0.8pt + rgb("94A3B8"), mark: (end: "stealth"))
    line((0, -0.5), (0, 7 * scale_y), stroke: 0.8pt + rgb("94A3B8"), mark: (end: "stealth"))
    content((5.2 * scale_x, 0), text(fill: rgb("64748B"), size: 8pt)[$x$ (m)])
    content((0, 7.3 * scale_y), text(fill: rgb("64748B"), size: 8pt)[$y$ (m)])

    // Vẽ vòm Parabol
    let pts = ()
    let i = 0
    while i <= 40 {
      let x = -4 + i * 8 / 40
      let y = 6 - 0.375 * x * x
      pts.push((x * scale_x, y * scale_y))
      i = i + 1
    }
    line(..pts, stroke: 2.2pt + c-teal)

    // Đỉnh I(0, 6)
    circle((0, 6 * scale_y), radius: 2.5pt, fill: c-red)
    content((0, 6.5 * scale_y), text(fill: c-red, weight: "bold")[$I(0; 6)$ (Đỉnh vòm)])

    // Hai chân vòm A(-4, 0) và B(4, 0)
    circle((-4 * scale_x, 0), radius: 2.5pt, fill: c-blue)
    content((-4 * scale_x, -0.35), text(fill: c-blue, weight: "bold")[$A(-4; 0)$])
    circle((4 * scale_x, 0), radius: 2.5pt, fill: c-blue)
    content((4 * scale_x, -0.35), text(fill: c-blue, weight: "bold")[$B(4; 0)$])

    // Khối hộp xe tải hình chữ nhật: bề rộng w = 3m (-1.5 đến 1.5), chiều cao h = 4m
    rect((-1.5 * scale_x, 0), (1.5 * scale_x, 4 * scale_y), fill: rgb("FEF3C7"), stroke: 1.2pt + c-amber)
    content((0, 2 * scale_y), text(fill: c-amber, weight: "bold", size: 8.5pt)[Thùng xe tải \ $w = 3$m, $h = 4$m])

    // Đường dóng bề rộng đáy vòm 8m
    line((-4 * scale_x, -0.7), (4 * scale_x, -0.7), stroke: 0.8pt + c-teal, mark: (both: "stealth"))
    content((0, -0.95), text(fill: c-teal-dark, weight: "bold", size: 8.5pt)[Khoảng cách đáy $L = 8$ m])
  })
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BÀI TẬP MA TRẬN 2025: VẬN DỤNG & VẬN DỤNG CAO
// ══════════════════════════════════════════════════════════════

== PHẦN I: CÂU HỎI TRẮC NGHIỆM NHIỀU PHƯƠNG ÁN

#tn(
  [
    *Câu 1 (Toán Kiến trúc - Xe tải qua cổng vòm Parabol):*
    Một cổng chào của một khu đô thị sinh thái được thiết kế có dạng hình Parabol với chiều cao từ mặt đường lên đến điểm cao nhất của cổng là $H = 8$ m và khoảng cách giữa hai chân cổng là $L = 6$ m. Người ta muốn cho một xe chở hàng dạng khối hộp chữ nhật có chiều rộng $w = 3$ m đi thẳng qua chính giữa cổng. Hỏi chiều cao lớn nhất cho phép của thùng xe hàng bằng bao nhiêu để xe có thể đi lọt qua cổng mà không chạm vào thành vòm?
  ],
  (
    [$5.5$ m],
    True([$6$ m]),
    [$6.25$ m],
    [$5.8$ m],
  ),
)
#step[
  *Mô hình hóa toán học từng bước:*
  - *Bước 1 (Chọn hệ quy chiếu):* Chọn hệ trục tọa độ $O x y$ sao cho:
    - Gốc tọa độ $O$ là trung điểm của đoạn nối hai chân cổng trên mặt đường.
    - Trục hoành $O x$ nằm dọc theo mặt đường nối hai chân cổng.
    - Trục tung $O y$ hướng thẳng đứng lên trên, trùng với trục đối xứng của Parabol.
  - *Bước 2 (Xác định tọa độ các điểm đặc trưng):*
    - Đỉnh của cổng Parabol có tọa độ là $I(0; 8)$.
    - Khoảng cách giữa hai chân cổng là $L = 6$ m, do đó hai chân cổng có tọa độ lần lượt là $A(-3; 0)$ và $B(3; 0)$.
  - *Bước 3 (Thiết lập phương trình Parabol):*
    - Parabol có trục đối xứng là $O y$ nên có dạng phương trình:
      $ y = a x^2 + c. $
    - Đi qua đỉnh $I(0; 8) ==> c = 8$.
    - Đi qua chân cổng $B(3; 0) ==> 0 = a dot 3^2 + 8 <==> 9a = -8 <==> a = -8/9$.
    - Vậy phương trình của đường vòm cổng là:
      $ y = -8/9 x^2 + 8. $
  - *Bước 4 (Giải quyết bài toán thực tế):*
    - Thùng xe tải có bề rộng $w = 3$ m và đi chính giữa cổng, nghĩa là mép xe trải từ hoành độ $x = -1.5$ đến $x = 1.5$.
    - Điểm dễ chạm cổng nhất chính là hai mép trên của thùng xe tại hoành độ $x = plus.minus 1.5 = plus.minus 3/2$.
    - Tung độ của vòm cổng tại $x = 3/2$ là:
      $ y(3/2) = -8/9 dot (3/2)^2 + 8 = -8/9 dot 9/4 + 8 = -2 + 8 = 6 " m". $
  - *Kết luận:* Để thùng xe đi lọt qua cổng mà không chạm thành vòm, chiều cao tối đa của xe phải là $6$ m.
]

#v(0.5em)

#tn(
  [
    *Câu 2 (Toán Kỹ thuật - Dây cáp treo võng hình Parabol):*
    Một cây cầu treo có nhịp giữa dài $L = 120$ m được giữ bởi hai tháp cầu thẳng đứng có cùng chiều cao $H = 30$ m so với mặt cầu. Dây cáp chính treo võng xuống tạo thành một đường Parabol có điểm thấp nhất cách mặt cầu là $h_0 = 6$ m. Một thanh cáp đứng treo nối từ dây cáp chính xuống mặt sàn cầu tại vị trí cách một trong hai tháp cầu $30$ m. Chiều dài của thanh cáp treo này bằng bao nhiêu?
  ],
  (
    [$10$ m],
    [$14$ m],
    True([$12$ m]),
    [$13.5$ m],
  ),
)
#step[
  *Mô hình hóa toán học chi tiết:*
  - *Bước 1 (Chọn hệ trục tọa độ):*
    - Chọn gốc tọa độ $O$ trên mặt sàn cầu, ngay dưới điểm thấp nhất của dây cáp (trung điểm của nhịp cầu).
    - Trục hoành $O x$ nằm ngang dọc theo mặt sàn cầu.
    - Trục tung $O y$ hướng thẳng đứng qua điểm thấp nhất của dây cáp.
  - *Bước 2 (Xác định các điểm mốc):*
    - Điểm thấp nhất của dây cáp là đỉnh Parabol: $I(0; 6)$.
    - Nhịp cầu dài $120$ m, do đó hai tháp cầu ở vị trí $x = -60$ và $x = 60$.
    - Đỉnh của hai tháp cầu có tọa độ là $(-60; 30)$ và $(60; 30)$.
  - *Bước 3 (Lập phương trình dây cáp):*
    - Dây cáp có dạng $y = a x^2 + 6$ ($a > 0$).
    - Cáp gắn vào đỉnh tháp tại $(60; 30)$:
      $ 30 = a dot 60^2 + 6 <==> 3600 a = 24 <==> a = 24 / 3600 = 1 / 150. $
    - Phương trình độ cao dây cáp:
      $ y = 1/150 x^2 + 6. $
  - *Bước 4 (Tính độ dài thanh cáp đứng):*
    - Thanh cáp cách tháp cầu $30$ m, do tháp ở vị trí $x = 60$ nên vị trí của thanh cáp là:
      $ x = 60 - 30 = 30 " m". $
    - Chiều cao của thanh cáp chính là tung độ $y$ tại $x = 30$:
      $ y(30) = 1/150 dot 30^2 + 6 = 900 / 150 + 6 = 6 + 6 = 12 " m". $
  - Vậy thanh cáp giằng treo dài đúng $12$ m.
]

#v(0.5em)

#tn(
  [
    *Câu 3 (Toán Kinh tế vi mô - Tối ưu hóa Doanh thu):*
    Một cụm rạp chiếu phim nhận thấy: Khi giá vé là $80.000$ đồng/vé thì mỗi suất chiếu trung bình bán được $200$ vé. Cứ mỗi lần giảm giá vé thêm $5.000$ đồng thì số lượng vé bán ra tăng thêm $25$ vé. Giả định sức chứa của rạp là $400$ chỗ ngồi. Để doanh thu của một suất chiếu đạt giá trị lớn nhất thì rạp chiếu phim nên niêm yết giá vé là bao nhiêu?
  ],
  (
    [$70.000$ đồng],
    True([$60.000$ đồng]),
    [$65.000$ đồng],
    [$55.000$ đồng],
  ),
)
#step[
  *Mô hình hóa hàm số bậc hai:*
  - Gọi $x$ là số lần giảm giá $5.000$ đồng ($x >= 0$).
  - Khi đó:
    - Giá vé mới cho mỗi suất chiếu là: $p(x) = 80.000 - 5.000 x$ (đồng).
    - Số lượng vé bán ra tương ứng là: $q(x) = 200 + 25 x$ (vé).
    - Điều kiện sức chứa rạp: $200 + 25x <= 400 <==> 25x <= 200 <==> x <= 8$.
  - Tổng doanh thu một suất chiếu là tích của giá vé và số lượng vé bán:
    $ R(x) = p(x) dot q(x) = (80.000 - 5.000 x)(200 + 25 x) $
    $ R(x) = 1.000 dot (80 - 5x) dot 25 dot (8 + x) = 25.000 dot (80 - 5x)(8 + x) $
    $ R(x) = 125.000 dot (16 - x)(8 + x) = 125.000 dot (-x^2 + 8x + 128). $
  - Hàm số $f(x) = -x^2 + 8x + 128$ là một tam thức bậc hai có hệ số $a = -1 < 0$.
    - Đỉnh Parabol đạt tại:
      $ x_0 = -b / (2a) = -8 / (2 dot (-1)) = 4. $
    - Giá trị $x_0 = 4$ thỏa mãn điều kiện $0 <= x <= 8$.
  - Vậy doanh thu đạt cực đại khi thực hiện $4$ lần giảm giá.
  - Mức giá vé tối ưu cần niêm yết là:
    $ p(4) = 80.000 - 5.000 dot 4 = 80.000 - 20.000 = 60.000 " đồng". $
  - Doanh thu tối đa khi đó là $R(4) = 125.000 dot (16 - 4)(8 + 4) = 125.000 dot 144 = 18.000.000$ đồng (với số vé bán ra là $200 + 25 dot 4 = 300$ vé).
]

#v(0.8em)

== PHẦN II: CÂU HỎI ĐÚNG / SAI (4 Ý TOÀN DIỆN)

#ds(
  [
    *Câu 1 (Mô hình hóa Đài phun nước nghệ thuật & Chiếu sáng):*
    Một vòi phun nước nghệ thuật trong công viên có đầu phun đặt ở độ cao $h_0 = 1.2$ m so với mặt hồ nước. Vòi phun nước theo đường Parabol hướng lên cao, đạt độ cao tối đa là $H = 4$ m so với mặt nước tại vị trí cách đầu vòi $2$ m theo phương ngang.
  ],
  (
    True([a) Chọn hệ trục tọa độ $O x y$ có gốc $O$ trên mặt hồ, thẳng đứng dưới đầu vòi phun. Phương trình quỹ đạo tia nước có dạng $y = -0.7 x^2 + 2.8 x + 1.2$.]),
    True([b) Tia nước rơi chạm mặt nước tại vị trí cách chân đầu vòi phun khoảng hơn $4.3$ m theo phương ngang.]),
    False([c) Một người cao $1.8$ m đứng trong hồ nước tại vị trí cách đầu vòi $3.5$ m theo phương ngang sẽ bị tia nước phun trúng đầu.]),
    True([d) Độ cao tia nước tại vị trí cách vòi phun $1$ m là $3.3$ m.]),
  ),
)
#step[
  *Lời giải chi tiết từng mệnh đề:*
  - *Ý a) Đúng:* Chọn hệ trục $O x y$ với $O$ trên mặt nước thẳng đứng dưới đầu vòi:
    - Đầu vòi phun tại $(0; 1.2)$, do đó $c = 1.2$.
    - Đỉnh Parabol tại $(2; 4)$, do đó:
      $ cases(-b / (2a) = 2, 4a + 2b + 1.2 = 4) <==> cases(b = -4a, 4a - 8a = 2.8) <==> cases(-4a = 2.8, b = -4a) <==> cases(a = -0.7, b = 2.8). $
    - Vậy phương trình quỹ đạo là $y = -0.7 x^2 + 2.8 x + 1.2$.
  - *Ý b) Đúng:* Khi tia nước chạm mặt nước thì $y = 0$:
    $ -0.7 x^2 + 2.8 x + 1.2 = 0 <==> 7 x^2 - 28 x - 12 = 0. $
    Nghiệm dương: $x = (14 + sqrt(14^2 - 7 dot (-12))) / 7 = (14 + sqrt(196 + 84)) / 7 = (14 + sqrt(280)) / 7 approx (14 + 16.733) / 7 approx 4.39 " m" > 4.3 " m"$.
  - *Ý c) Sai:* Tại vị trí cách vòi $x = 3.5$ m:
    $ y(3.5) = -0.7 dot (3.5)^2 + 2.8 dot 3.5 + 1.2 = -0.7 dot 12.25 + 9.8 + 1.2 = -8.575 + 11 = 2.425 " m". $
    Độ cao của tia nước tại đây là $2.425$ m, cao hơn chiều cao người đó ($1.8$ m) nên tia nước bay phía trên đầu người đó, không trúng đầu.
  - *Ý d) Đúng:* Tại vị trí $x = 1$ m:
    $ y(1) = -0.7 dot 1^2 + 2.8 dot 1 + 1.2 = -0.7 + 2.8 + 1.2 = 3.3 " m". $
]

#v(0.8em)

== PHẦN III: CÂU HỎI TRẢ LỜI NGẮN (MÔ HÌNH HÓA VDC)

#tln(
  [
    *Câu 1 (Kỹ thuật Chóa đèn ô tô Parabol - Tính chất tiêu điểm):*
    Một chóa đèn pha ô tô có mặt cắt ngang là một đường Parabol. Bóng đèn sợi đốt cần được đặt chính xác tại tiêu điểm $F$ của Parabol để các tia sáng sau khi phản xạ trên chóa đèn sẽ tạo thành một chùm tia song song chiếu xa. Biết đường kính miệng của chóa đèn là $D = 20$ cm và chiều sâu từ đỉnh chóa đến miệng đèn là $h = 10$ cm. Hỏi bóng đèn cần đặt cách đỉnh của chóa đèn bao nhiêu cm?
  ],
  [
    *Đáp số: 2.5*
  ],
)
#step[
  *Lời giải chi tiết bằng Tính chất Hình học Parabol:*
  - Đặt chóa đèn trong hệ trục tọa độ $O x y$ sao cho đỉnh của Parabol trùng với gốc tọa độ $O(0; 0)$ và trục đối xứng trùng với trục hoành $O x$ (hướng sang phải).
  - Khi đó phương trình chính tắc của Parabol là:
    $ y^2 = 2 p x quad ("với " p > 0 " là tham số tiêu"). $
    Tiêu điểm của Parabol có tọa độ là $F(p/2; 0)$, khoảng cách từ đỉnh đến tiêu điểm là $d = p/2$.
  - Miệng chóa đèn có đường kính $D = 20$ cm, nghĩa là bán kính miệng đèn là $R = 10$ cm.
  - Chiều sâu đèn là $h = 10$ cm. Do đó mép miệng đèn là điểm $M$ có hoành độ $x_M = 10$ cm và tung độ $y_M = 10$ cm.
  - Thay tọa độ điểm $M(10; 10)$ vào phương trình Parabol:
    $ 10^2 = 2 p dot 10 <==> 100 = 20 p <==> p = 5 " cm". $
  - Khoảng cách từ đỉnh chóa đèn đến vị trí đặt bóng đèn (tiêu điểm $F$) là:
    $ d = p / 2 = 5 / 2 = 2.5 " cm". $
  - *Đáp số:* $2.5$ cm.
]

#v(0.6em)

#tln(
  [
    *Câu 2 (Bài toán Tối ưu hóa Diện tích rào vườn):*
    Một người nông dân muốn rào một khu đất hình chữ nhật giáp với bờ một con sông thẳng để trồng rau sạch. Vì bờ sông đóng vai trò là một cạnh tự nhiên nên ông chỉ cần dùng lưới thép để rào ba cạnh còn lại. Ông có trong tay một cuộn lưới thép dài tổng cộng $120$ m. Hỏi diện tích lớn nhất của khu đất mà ông có thể rào được bằng bao nhiêu mét vuông ($m^2$)?
  ],
  [
    *Đáp số: 1800*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Gọi cạnh khu đất vuông góc với bờ sông là $x$ (m), với $x > 0$.
  - Do có hai cạnh vuông góc với bờ sông nên tổng chiều dài của hai cạnh này là $2x$.
  - Chiều dài của cạnh còn lại song song với bờ sông là:
    $ y = 120 - 2x " (m)". $
  - Điều kiện để tồn tại hình chữ nhật là: $x > 0$ và $120 - 2x > 0 <==> 0 < x < 60$.
  - Diện tích khu đất được rào là:
    $ S(x) = x dot y = x(120 - 2x) = -2 x^2 + 120 x " " (m^2). $
  - Đây là một hàm số bậc hai với hệ số $a = -2 < 0$, đồ thị là Parabol có bề lõm quay xuống.
  - Diện tích $S(x)$ đạt giá trị cực đại tại đỉnh:
    $ x_0 = -b / (2a) = -120 / (2 dot (-2)) = 30 " m". $
  - Giá trị $x_0 = 30$ thỏa mãn $0 < 30 < 60$.
  - Khi đó chiều dài cạnh song song bờ sông là $y = 120 - 2 dot 30 = 60$ m.
  - Diện tích lớn nhất có thể rào được là:
    $ S_"max" = 30 dot 60 = 1800 " " (m^2). $
]

#v(0.6em)

#tln(
  [
    *Câu 3 (Thiết kế máng xối tôn tối đa lưu lượng thoát nước):*
    Một người thợ gò hàn muốn làm một chiếc máng xối dẫn nước mưa có tiết diện ngang là hình chữ nhật hở miệng trên bằng cách gập cong hai bên mép của một tấm tôn phẳng dài có bề rộng $W = 40$ cm lên vuông góc một góc $90^circle$. Hỏi người thợ phải gấp mỗi bên mép lên một đoạn bằng bao nhiêu xentimét để máng xối có thể thoát được lượng nước mưa lớn nhất (diện tích mặt cắt ngang lớn nhất)?
  ],
  [
    *Đáp số: 10*
  ],
)
#step[
  *Lời giải chi tiết:*
  - Gọi chiều cao mép tôn được gập lên ở mỗi bên là $x$ (cm).
  - Vì gập ở cả hai bên mép nên tổng chiều rộng của hai thành máng là $2x$.
  - Chiều rộng của đáy máng xối nằm ngang là:
    $ b = 40 - 2x " (cm)". $
  - Điều kiện: $x > 0$ và $40 - 2x > 0 <==> 0 < x < 20$.
  - Tiết diện ngang của dòng nước chảy là một hình chữ nhật có kích thước $x$ và $40 - 2x$.
  - Lưu lượng nước thoát tỉ lệ thuận với diện tích mặt cắt ngang:
    $ S(x) = x(40 - 2x) = -2 x^2 + 40 x " " (c m^2). $
  - Hàm số đạt giá trị lớn nhất tại hoành độ đỉnh:
    $ x_0 = -b / (2a) = -40 / (2 dot (-2)) = 10 " cm". $
  - Khi đó đáy máng rộng $b = 40 - 20 = 20$ cm, diện tích mặt cắt ngang lớn nhất là $S_"max" = 10 dot 20 = 200 " " c m^2$.
  - *Đáp số:* $10$ cm.
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
  *BÀI TOÁN (Parabol An toàn của Torricelli & Đường bao hình Đạn đạo):*
  
  Từ một khẩu pháo đặt tại gốc tọa độ $O(0; 0)$ trên mặt đất phẳng, người ta bắn một quả đạn với tốc độ ban đầu cố định $v_0$ dưới góc bắn $alpha in (0; pi/2)$ tùy ý trong mặt phẳng thẳng đứng $O x y$. Bỏ qua sức cản của không khí và lấy gia tốc trọng trường là $g$.
  1. Lập phương trình quỹ đạo $y = f(x, alpha)$ của quả đạn.
  2. Xem phương trình quỹ đạo là một phương trình bậc hai đối với $t = tan alpha$. Tìm điều kiện của tọa độ mục tiêu $(X; Y)$ để có thể bắn trúng bằng ít nhất một góc bắn $alpha$.
  3. Chứng minh rằng tập hợp tất cả các điểm trong không gian mà đạn có thể vươn tới được bao bọc bởi một mặt Parabol có phương trình $Y = v_0^2 / (2g) - (g X^2) / (2 v_0^2)$. Đường cong này được gọi là *Parabol an toàn của Torricelli (Parabola of Safety)*.
]

#step[
  *Khảo sát chuyên sâu bằng Phương pháp Tam thức bậc hai & Bao hình:*
  
  - *Ý 1: Phương trình quỹ đạo đạn đạo:*
    Phương trình chuyển động theo hai trục:
    $ cases(x(t) = (v_0 cos alpha) t, y(t) = (v_0 sin alpha) t - 1/2 g t^2) $
    Rút $t = x / (v_0 cos alpha)$ thay vào phương trình $y$:
    $ y = v_0 sin alpha dot x / (v_0 cos alpha) - 1/2 g (x / (v_0 cos alpha))^2 $
    $ y = x tan alpha - (g x^2) / (2 v_0^2 cos^2 alpha). $
    Sử dụng hệ thức lượng giác cơ bản $1 / (cos^2 alpha) = 1 + tan^2 alpha$:
    $ y = x tan alpha - (g x^2) / (2 v_0^2) (1 + tan^2 alpha). $

  - *Ý 2: Đưa về tam thức bậc hai theo biến $t = tan alpha$:*
    Đặt $t = tan alpha$ ($t > 0$). Với một mục tiêu cố định $(X; Y)$, phương trình trở thành:
    $ Y = X t - (g X^2) / (2 v_0^2) (1 + t^2) $
    $ <==> (g X^2) / (2 v_0^2) t^2 - X t + (Y + (g X^2) / (2 v_0^2)) = 0. $
    Đây chính là một tam thức bậc hai theo ẩn $t$!
    Để khẩu pháo có thể bắn trúng mục tiêu $(X; Y)$, phương trình trên bắt buộc phải có nghiệm thực $t$, nghĩa là biệt thức $Delta >= 0$:
    $ Delta = (-X)^2 - 4 dot (g X^2) / (2 v_0^2) dot (Y + (g X^2) / (2 v_0^2)) >= 0 $
    $ <==> X^2 - (2 g X^2) / (v_0^2) Y - (g^2 X^4) / (v_0^4) >= 0. $
    Vì $X != 0$ (mục tiêu không nằm ngay trên đỉnh nòng súng), ta chia cả hai vế cho $X^2 > 0$:
    $ 1 - (2 g) / (v_0^2) Y - (g^2 X^2) / (v_0^4) >= 0 $
    $ <==> (2 g) / (v_0^2) Y <= 1 - (g^2 X^2) / (v_0^4) $
    $ <==> Y <= v_0^2 / (2 g) - (g X^2) / (2 v_0^2). $

  - *Ý 3: Ý nghĩa hình học & Ứng dụng quân sự của Parabol an toàn:*
    - Đường biên giới hạn phân chia giữa vùng "bị hỏa lực đe dọa" và vùng "an toàn tuyệt đối" chính là đường Parabol:
      $ Y = v_0^2 / (2g) - (g X^2) / (2 v_0^2). $
    - Đỉnh của Parabol an toàn này nằm tại hoành độ $X = 0$ với độ cao cực đại là $Y_"max" = v_0^2 / (2g)$ (tương ứng phát bắn thẳng đứng $alpha = 90^circle$).
    - Giao điểm với mặt đất ($Y = 0$) tại cự ly:
      $ X_"max" = v_0^2 / g $
      (tương ứng góc bắn tối ưu $alpha = 45^circle$ đạt tầm xa cực đại).
    - Bất kỳ mục tiêu nào nằm phía trên đường cong Parabol này đều hoàn toàn bất khả xâm phạm đối với khẩu pháo, dù pháo thủ có chỉnh góc bắn $alpha$ bằng bao nhiêu đi chăng nữa!
]
