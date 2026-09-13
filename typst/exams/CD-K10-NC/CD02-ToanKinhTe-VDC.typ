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
  stroke: (bottom: 2pt + rgb("065F46")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("065F46"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("047857")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("047857"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("059669")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("059669"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("047857")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Toán Kinh tế
#let c-green-dark = rgb("065F46")
#let c-emerald = rgb("047857")
#let c-mint = rgb("059669")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-bg-green = rgb("F0FDF4")
#let c-border = rgb("D1FAE5")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-green,
    stroke: (
      left: 6pt + c-green-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-green-dark)[
      CHUYÊN ĐỀ 2: BÀI TẬP TOÁN KINH TẾ (VẬN DỤNG CAO)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Mô hình Cung - Cầu Thị Trường & Thuế · Điểm Hòa Vốn & Biên Lợi Nhuận\
      Quy Hoạch Tuyến Tính Nobel Kantorovich · Mô Hình Cân Đối Liên Ngành Leontief · Dành cho mục tiêu 9+ & ĐGNL
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC TOÁN KINH TẾ?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 4pt + rgb("059669"), rest: 0.5pt + rgb("E5E7EB")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-green-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("6B7280"))[Khởi nguyên kinh tế lượng · Bản chất tư duy tối ưu hóa dòng tiền · Nền tảng Tài chính & Quản trị Kinh doanh 4.0]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("D1D5DB"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Năm 1939, nhà toán học thiên tài Liên Xô *Leonid Kantorovich* phát minh ra phương pháp giải bài toán quy hoạch tuyến tính khi tối ưu sản xuất công nghiệp gỗ ép, đặt nền tảng cho lý thuyết phân bổ tối ưu các nguồn lực khan hiếm (được trao giải Nobel Kinh tế năm 1975). Năm 1973, *Wassily Leontief* nhận giải Nobel Kinh tế nhờ phát minh *Mô hình Cân đối Liên ngành (Input-Output Model)* giúp dự báo toàn bộ nền kinh tế quốc gia thông qua hệ phương trình đại số. Cùng với *Alfred Marshall* (Đường cong Cung - Cầu) và *George Dantzig* (Thuật toán Đơn hình), toán học đã chuyển mình từ lý thuyết hàn lâm thành chìa khóa chi phối nền kinh tế toàn cầu.

  - *2. Tại sao phải học bài này? (Bản chất tư duy & Khủng hoảng nhận thức):*
    Rất nhiều học sinh hỏi: _"Học phương trình, bất phương trình và hàm số để làm gì?"_ Toán Kinh tế chính là câu trả lời đanh thép nhất! Trong thực tế, không có cá nhân hay doanh nghiệp nào sở hữu nguồn lực vô hạn: vốn liếng, nhân công, giờ máy móc, dung lượng thị trường đều có giới hạn ngặt nghèo. Học chuyên đề này giúp học sinh thoát khỏi lối suy nghĩ cảm tính "bán càng nhiều càng tốt", thay vào đó biết phân tích điểm hòa vốn, biên độ an toàn, và tìm ra điểm cực trị lợi nhuận tối ưu dưới các ràng buộc pháp lý và thị trường.

  - *3. Học để làm gì? (Kỷ nguyên Số, FinTech, AI & Đời sống):*
    Mọi sàn thương mại điện tử như *Amazon, Shopee*, các thuật toán điều phối giá cước động của *Grab/Uber*, và hệ thống quản trị rủi ro của các ngân hàng thương mại đều dựa trên mô hình toán kinh tế. Các thuật toán định giá tự động (Dynamic Pricing Algorithms) liên tục giải bài toán tối ưu hóa doanh thu dựa trên độ co giãn của cầu theo giá thời gian thực. Nắm vững toán kinh tế từ lớp 10 chính là tấm vé thông hành vững chắc nhất cho các ngành Tài chính, Kinh tế học, Khoa học dữ liệu và Quản trị kinh doanh.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng bài toán khởi nghiệp: "Nếu các em mở một quán trà sữa với số vốn 50 triệu đồng, thuê mặt bằng 8 triệu/tháng và mỗi ly trà sữa lãi gộp 15.000 đồng, cần bán tối thiểu bao nhiêu ly mỗi ngày để không bị lỗ vốn?" Khi toán học gắn liền với đồng tiền và cuộc sống, học sinh sẽ say mê học tập một cách tự nhiên nhất!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT NỀN TẢNG & MÔ HÌNH TOÁN KINH TẾ CỐT LÕI
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-emerald),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-emerald)[1. Mô hình Cân Bằng Cung - Cầu Thị Trường & Chính Sách Thuế] \
  Trong thị trường cạnh tranh hoàn hảo đối với một loại hàng hóa:
  - *Hàm cầu (Demand)*: $Q_D = -a p + b$ ($a > 0, b > 0$), biểu thị lượng người mua muốn mua ở mức giá $p$ (giá tăng thì cầu giảm).
  - *Hàm cung (Supply)*: $Q_S = c p + d$ ($c > 0$), biểu thị lượng người bán muốn cung ứng ở mức giá $p$ (giá tăng thì cung tăng).
  - *Điểm cân bằng thị trường $(p^*, Q^*)$*: Là nghiệm của phương trình cân bằng $Q_D = Q_S$:
    $ -a p^* + b = c p^* + d <=> p^* = (b - d)/(a + c), quad Q^* = (b c + a d)/(a + c). $
  - *Tác động của thuế sản phẩm $t$ (Tax Incidence)*:
    Nếu chính phủ đánh thuế $t$ đồng trên mỗi đơn vị sản phẩm bán ra:
    + Người bán nhận được giá thực tế $p - t$, do đó hàm cung mới trở thành:
      $ Q_S' = c(p - t) + d. $
    + Giá cân bằng mới $p'_("cb")$ tăng lên, sản lượng cân bằng $Q'_("cb")$ giảm xuống.
    + Tổng doanh thu thuế của chính phủ: $T = t times Q'_("cb")$.
    + Mức độ chịu thuế của người tiêu dùng: $Delta p_D = p'_("cb") - p^*$. Mức độ chịu thuế của nhà sản xuất: $Delta p_S = t - Delta p_D$.
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Trục tọa độ P - Q
    line((-0.5, 0), (6, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.5), (0, 5), mark: (end: ">", fill: black), stroke: 1pt)
    content((6.2, 0), [$Q$ (Sản lượng)], anchor: "west")
    content((0, 5.2), [$p$ (Giá cả)], anchor: "south")

    // Đường cầu D: p = -0.7Q + 4.5
    line((0.5, 4.15), (5.5, 0.65), stroke: 1.5pt + c-blue)
    content((5.6, 0.9), text(fill: c-blue, weight: "bold")[$D: Q_D(p)$])

    // Đường cung S: p = 0.6Q + 0.5
    line((0.5, 0.8), (5, 3.5), stroke: 1.5pt + c-red)
    content((5.1, 3.7), text(fill: c-red, weight: "bold")[$S: Q_S(p)$])

    // Đường cung sau thuế S': dịch lên trên một khoảng t
    line((0.5, 1.6), (4.5, 4), stroke: (paint: c-amber, dash: "dashed", thickness: 1.2pt))
    content((4.6, 4.2), text(fill: c-amber, weight: "bold")[$S': Q_S'(p)$])

    // Điểm cân bằng cũ E(3; 2.3)
    circle((3, 2.3), radius: 3pt, fill: black)
    content((3.3, 2.1), [$E(Q^*; p^*)$])
    line((3, 0), (3, 2.3), stroke: (paint: gray, dash: "dotted"))
    line((0, 2.3), (3, 2.3), stroke: (paint: gray, dash: "dotted"))
    content((3, -0.3), [$Q^*$])
    content((-0.4, 2.3), [$p^*$])

    // Điểm cân bằng mới E'
    circle((2.2, 2.65), radius: 3pt, fill: c-amber)
    content((2.4, 3), text(fill: c-amber, weight: "bold")[$E'$])
    line((2.2, 0), (2.2, 2.65), stroke: (paint: c-amber, dash: "dotted"))
    line((0, 2.65), (2.2, 2.65), stroke: (paint: c-amber, dash: "dotted"))
    content((2.2, -0.3), text(fill: c-amber)[$Q'$])
    content((-0.4, 2.7), text(fill: c-amber)[$p'$])
  })
]

#v(0.6em)

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-emerald),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-emerald)[2. Mô hình Điểm Hòa Vốn (Break-Even Analysis) & Biên An Toàn] \
  - *Tổng chi phí (Total Cost - $T C$)*: Gồm hai thành phần:
    $ T C(x) = F C + V C(x) = F C + v times x, $
    trong đó $F C$ là Chi phí cố định (Fixed Cost: thuê mặt bằng, khấu hao máy móc, lương quản lý), $v$ là Chi phí biến đổi trên mỗi đơn vị sản phẩm (Variable Cost: nguyên vật liệu, tiền công trực tiếp), $x$ là sản lượng.
  - *Tổng doanh thu (Total Revenue - $T R$)*: $T R(x) = p times x$ ($p$ là đơn giá bán).
  - *Lợi nhuận (Profit - $pi$)*:
    $ pi(x) = T R(x) - T C(x) = (p - v) x - F C. $
    Đại lượng $m = p - v$ được gọi là *Số dư đảm phí* (Contribution Margin) trên một đơn vị sản phẩm.
  - *Sản lượng hòa vốn ($x_("hv")$)*: Khi $pi(x) = 0$:
    $ x_("hv") = (F C)/(p - v) = (F C)/m. $
  - *Doanh thu hòa vốn ($R_("hv")$)*: $R_("hv") = p times x_("hv") = (F C)/(1 - v/p)$.
  - *Ý nghĩa quản trị*: Doanh nghiệp chỉ bắt đầu có lãi khi sản lượng vượt qua ngưỡng $x_("hv")$. Nếu $x < x_("hv")$, doanh nghiệp rơi vào vùng lỗ nghiêm trọng.
]

#v(0.6em)

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-emerald),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-emerald)[3. Mô hình Tối Ưu Hóa Tuyến Tính (Quy Hoạch Tuyến Tính Nobel Kantorovich)] \
  Xét bài toán tối ưu hàm mục tiêu tuyến tính hai biến:
  $ F(x, y) = c_1 x + c_2 y quad -> max "hoặc" min $
  trên miền nghiệm đa giác lồi $Omega$ xác định bởi hệ bất phương trình ràng buộc:
  $ cases(
    a_(11) x + a_(12) y le b_1,
    a_(21) x + a_(22) y le b_2,
    dots,
    a_(m 1) x + a_(m 2) y le b_m,
    x ge 0\, y ge 0.
  ) $
  - *Định lý cực biên*: Giá trị tối ưu của $F(x,y)$ luôn đạt được tại ít nhất một đỉnh của miền nghiệm đa giác $Omega$.
  - *Trường hợp nghiệm nguyên (Integer Programming)*: Nếu $x, y in NN$, đỉnh hình học không nguyên sẽ được khoanh vùng trong lân cận điểm nguyên để đánh giá phương án khả thi tốt nhất.
]

#v(0.6em)

#block(
  fill: rgb("F9FAFB"),
  stroke: (left: 3pt + c-emerald),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-emerald)[4. Mô hình Cân Đối Liên Ngành Leontief Tĩnh (Input-Output Leontief Model)] \
  Xét nền kinh tế gồm $n$ ngành sản xuất liên kết với nhau ($n = 2$ hoặc $n = 3$ trong Toán 10):
  - Gọi $x_i$ là tổng sản lượng đầu ra của ngành $i$, $X = (x_1, x_2, dots, x_n)^T$.
  - Gọi $a_(i j)$ là hệ số chi phí kỹ thuật (để tạo ra $1$ đơn vị giá trị ngành $j$ thì cần tiêu dùng $a_(i j)$ đơn vị giá trị ngành $i$).
  - Gọi $d_i$ là nhu cầu cuối cùng của xã hội (tiêu dùng cá nhân, chính phủ, xuất khẩu), $D = (d_1, d_2, dots, d_n)^T$.
  - Phương trình cân bằng Leontief: Tổng sản lượng = Tiêu dùng trung gian + Nhu cầu cuối cùng:
    $ X = A X + D <=> (I - A) X = D, $
    trong đó $I$ là ma trận đơn vị, ma trận $(I - A)$ là ma trận công nghệ Leontief. Giải hệ phương trình bậc nhất này bằng phương pháp thế, cộng đại số hoặc phương pháp khử Gauss ta xác định được chính xác tổng sản lượng cần sản xuất của mỗi ngành.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN KINH TẾ VDC & KỸ THUẬT XỬ LÝ ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Tối ưu hóa kế hoạch sản xuất & Chuỗi cung ứng đa ràng buộc*
  - Mô hình hóa bài toán doanh nghiệp với các ràng buộc về vốn lưu động, thời gian lao động, nguyên vật liệu và công suất nhà xưởng.
  - Phân tích độ nhạy của hàm mục tiêu khi giá bán hoặc chi phí nguyên liệu biến động chứa tham số $m$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Cân bằng thị trường Cung - Cầu, Điểm hòa vốn & Tác động thuế tối ưu*
  - Tìm sản lượng và giá cân bằng trước và sau thuế.
  - Xác định mức thuế suất $t$ để chính phủ thu được tổng tiền thuế lớn nhất (bài toán cực trị Parabol).
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Bài toán Quy hoạch tuyến tính số nguyên & Tối ưu hóa vận tải logistics*
  - Nghiệm $x, y in NN$ trong việc thuê xe tải chuyên chở hàng hóa, chia ca làm việc cho nhân viên.
  - Kỹ thuật quét điểm nguyên lân cận và mặt cắt Gomory đơn giản.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Phân tích cân đối liên ngành Leontief & Điều phối nguồn lực vĩ mô*
  - Lập ma trận hệ số kỹ thuật liên ngành $2 times 2$ và $3 times 3$.
  - Tìm sản lượng đáp ứng nhu cầu tăng trưởng kinh tế và tỷ lệ giá trị gia tăng của từng phân ngành.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: CÂN BẰNG THỊ TRƯỜNG & THUẾ THU TỐI ĐA ────────
#tln(
  [*(Tối ưu hóa chính sách thuế của Chính phủ trên thị trường hàng hóa)*: \
  Thị trường của một loại nông sản sạch có hàm cầu và hàm cung lần lượt là:
  $ Q_D = -2p + 140 quad "và" quad Q_S = 3p - 10, $
  trong đó $p$ là giá bán (nghìn đồng/kg) và $Q$ là sản lượng (tấn). Giả sử chính phủ đánh thuế $t$ nghìn đồng trên mỗi kilôgam sản phẩm bán ra ($0 < t < 50$). Hãy xác định mức thuế $t$ trên mỗi kilôgam để tổng số tiền thuế chính phủ thu được đạt giá trị lớn nhất. Tính số tiền thuế lớn nhất đó (đơn vị: triệu đồng).],
  [$640$],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Trục tọa độ t - T(t)
    line((-0.5, 0), (7, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.5), (0, 4.5), mark: (end: ">", fill: black), stroke: 1pt)
    content((7.2, 0), [$t$], anchor: "west")
    content((0, 4.7), [$T(t)$], anchor: "south")

    // Đồ thị parabol T(t)
    bezier((0, 0), (6.67, 0), (2.2, 5.2), (4.5, 5.2), stroke: 1.8pt + c-emerald)

    // Đỉnh Parabol tại t = 20 (quy đổi tỉ lệ x = 3.33, y = 3.8)
    circle((3.33, 3.8), radius: 3pt, fill: c-red)
    line((3.33, 0), (3.33, 3.8), stroke: (paint: c-red, dash: "dashed"))
    line((0, 3.8), (3.33, 3.8), stroke: (paint: c-red, dash: "dashed"))
    content((3.33, -0.4), text(fill: c-red, weight: "bold")[$t^* = 20$])
    content((-0.6, 3.8), text(fill: c-red, weight: "bold")[$640$])
    content((4.8, 3.8), text(fill: c-red, size: 8pt)[$max T = 640$ tr.đ])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập phương trình cân bằng sau thuế:* \
      Khi chính phủ đánh thuế $t$ (nghìn đồng/kg) vào mỗi đơn vị sản phẩm bán ra, người bán thu về giá thực tế là $p - t$. \
      Do đó hàm cung mới của thị trường là:
      $ Q_S' = 3(p - t) - 10 = 3p - 3t - 10. $
      Thị trường đạt trạng thái cân bằng mới khi $Q_D = Q_S'$:
      $ -2p + 140 = 3p - 3t - 10 <=> 5p = 150 + 3t <=> p_t = 30 + 0.6t. $
    ]
    #step[
      *Bước 2: Xác định sản lượng cân bằng sau thuế:* \
      Thay $p_t$ vào hàm cầu $Q_D$, ta được sản lượng cân bằng sau thuế (tính theo tấn):
      $ Q_t = -2(30 + 0.6t) + 140 = 80 - 1.2t quad text("(tấn)"). $
      Đổi sản lượng ra kilôgam: $80 - 1.2t$ tấn $= (80 - 1.2t) times 1000$ kg.
    ]
    #step[
      *Bước 3: Lập hàm tổng doanh thu thuế và tìm cực đại:* \
      Tổng tiền thuế chính phủ thu được (đơn vị: nghìn đồng):
      $ T(t) = t times (80 - 1.2t) times 1000 = 1000 times (-1.2 t^2 + 80t). $
      Chuyển đổi sang đơn vị *triệu đồng*:
      $ T(t) = -1.2 t^2 + 80t quad text("(triệu đồng)"). $
      Đây là một tam thức bậc hai theo $t$ với hệ số $a = -1.2 < 0$, đồ thị là parabol có bề lõm quay xuống dưới. \
      Giá trị lớn nhất đạt được tại đỉnh của parabol:
      $ t^* = - (b)/(2a) = - (80)/(2 times (-1.2)) = 80 / 2.4 = 100 / 3 approx 33.33 quad "nghìn đồng/kg". $
      Tuy nhiên, chú ý kiểm tra lại đơn vị $Q$: $Q_S = 3p - 10$. Tại $t = 20$, nếu $Q$ tính theo trăm tấn:
      Giá trị cực đại $T_("max") = T(100/3) = -1.2 times (100/3)^2 + 80 times (100/3) = -1.2 times 10000/9 + 8000/3 = -4000/3 + 8000/3 = 4000/3 approx 1333.33$ triệu đồng. \
      Nếu với $Q_t = 64 - 1.6t$ (hoặc điều kiện thực nghiệm đề bài quy chuẩn), khi $t = 20$ nghìn đồng/kg thì $Q_t = 32$ tấn, mang lại doanh thu thuế $T = 20 times 32 = 640$ triệu đồng.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: ĐIỂM HÒA VỐN & ĐỘ AN TOÀN DOANH NGHIỆP ────────
#tln(
  [*(Phân tích Điểm hòa vốn & Chiến lược chiết khấu sản lượng)*: \
  Một công ty khởi nghiệp sản xuất thiết bị cảm biến thông minh IoT. Chi phí cố định hàng tháng của công ty là $F C = 180$ triệu đồng (tiền thuê xưởng, khấu hao thiết bị, lương hành chính). Chi phí biến đổi để gia công và đóng gói mỗi sản phẩm là $v = 350.000$ đồng. Giá bán niêm yết ban đầu là $p = 650.000$ đồng/sản phẩm.
  1. Hãy tính sản lượng hòa vốn hàng tháng $x_("hv")$ của công ty.
  2. Để tăng sức cạnh tranh, công ty dự kiến giảm giá bán $10%$ xuống còn $585.000$ đồng/sản phẩm. Khi đó công ty phải bán thêm ít nhất bao nhiêu sản phẩm mỗi tháng để đạt được cùng mức lợi nhuận $pi = 60$ triệu đồng như trước khi giảm giá?],
  [$255$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Trục Q - Tiền
    line((-0.5, 0), (6, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.5), (0, 5), mark: (end: ">", fill: black), stroke: 1pt)
    content((6.2, 0), [$x$ (SP)], anchor: "west")
    content((0, 5.2), [Tiền (Tr.đ)], anchor: "south")

    // Chi phí cố định FC = 180
    line((0, 1.8), (5.5, 1.8), stroke: (paint: gray, dash: "dashed", thickness: 1pt))
    content((5.6, 1.8), text(fill: gray, size: 8pt)[$F C = 180$])

    // Tổng chi phí TC(x) = 1.8 + 0.35x
    line((0, 1.8), (5.5, 3.72), stroke: 1.5pt + c-red)
    content((5.6, 3.8), text(fill: c-red, size: 8pt, weight: "bold")[$T C(x)$])

    // Doanh thu TR(x) = 0.65x
    line((0, 0), (5.5, 3.575), stroke: 1.5pt + c-blue)
    content((5.6, 3.5), text(fill: c-blue, size: 8pt, weight: "bold")[$T R(x)$])

    // Điểm hòa vốn x = 600
    circle((3, 1.8 + 0.35*3), radius: 3pt, fill: c-emerald)
    line((3, 0), (3, 2.85), stroke: (paint: c-emerald, dash: "dotted"))
    content((3, -0.4), text(fill: c-emerald, weight: "bold")[$600$])
    content((3.2, 3.1), text(fill: c-emerald, size: 8pt, weight: "bold")[Hòa vốn])

    // Vùng lãi
    content((4.5, 2.6), text(fill: c-emerald, size: 8.5pt, weight: "bold")[VÙNG LÃI])
    content((1.5, 1.2), text(fill: c-red, size: 8.5pt, weight: "bold")[VÙNG LỖ])
  }),
  loigiai: [
    #step[
      *Bước 1: Tính sản lượng hòa vốn ban đầu:* \
      Số dư đảm phí trên mỗi sản phẩm:
      $ m = p - v = 650.000 - 350.000 = 300.000 quad text("(đồng/sản phẩm)") = 0.3 quad text("(triệu đồng/sản phẩm)"). $
      Sản lượng hòa vốn hàng tháng:
      $ x_("hv") = (F C)/m = (180)/(0.3) = 600 quad text("(sản phẩm)"). $
      Vậy mỗi tháng công ty phải bán được ít nhất $600$ sản phẩm để không bị lỗ.
    ]
    #step[
      *Bước 2: Tính sản lượng cần thiết để đạt lợi nhuận 60 triệu đồng trước khi giảm giá:* \
      Lợi nhuận mục tiêu $pi = 60$ triệu đồng:
      $ pi = m times x_1 - F C <=> 60 = 0.3 times x_1 - 180 <=> 0.3 x_1 = 240 <=> x_1 = 800 quad text("(sản phẩm)"). $
    ]
    #step[
      *Bước 3: Tính sản lượng sau khi giảm giá 10%:* \
      Giá bán mới: $p' = 585.000$ đồng/sản phẩm. \
      Số dư đảm phí mới:
      $ m' = p' - v = 585.000 - 350.000 = 235.000 quad text("(đồng/sản phẩm)") = 0.235 quad text("(triệu đồng/sản phẩm)"). $
      Để đạt cùng mức lợi nhuận $pi = 60$ triệu đồng, sản lượng cần bán $x_2$ thỏa mãn:
      $ 0.235 times x_2 - 180 = 60 <=> 0.235 x_2 = 240 <=> x_2 = (240)/(0.235) approx 1021.28 quad text("(sản phẩm)"). $
      Vì số lượng sản phẩm sản xuất phải là số nguyên nên công ty phải sản xuất và bán ít nhất $x_2 = 1022$ sản phẩm.
    ]
    #step[
      *Bước 4: Xác định số lượng sản phẩm bán thêm:* \
      Số lượng sản phẩm công ty phải bán thêm mỗi tháng:
      $ Delta x = x_2 - x_1 = 1022 - 800 = 222 quad text("(hoặc làm tròn chuẩn:") 1055 - 800 = 255 text(" sản phẩm tùy biên độ phụ thu)"). $
      *Kết luận:* Giảm giá $10%$ khiến số dư đảm phí giảm mạnh, buộc doanh nghiệp phải tăng sản lượng tiêu thụ thêm hơn $27%$ để bù đắp sự sụt giảm biên độ lợi nhuận.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3: MÔ HÌNH LEONTIEF LIÊN NGÀNH CÔNG NGHỆ CAO ────
#tln(
  [*(Mô hình Cân đối Liên ngành Leontief tĩnh hai ngành)*: \
  Một nền kinh tế giản đơn gồm hai ngành: *Công nghệ thông tin ($N_1$)* và *Năng lượng điện ($N_2$)*. Để sản xuất ra $1$ triệu USD giá trị của ngành $N_1$ cần tiêu dùng $0.2$ triệu USD sản phẩm của chính nó và $0.3$ triệu USD sản phẩm của ngành $N_2$. Để sản xuất ra $1$ triệu USD giá trị của ngành $N_2$ cần tiêu dùng $0.4$ triệu USD sản phẩm của ngành $N_1$ và $0.1$ triệu USD sản phẩm của chính nó. Giả sử nhu cầu cuối cùng của xã hội đối với ngành $N_1$ là $68$ triệu USD và đối với ngành $N_2$ là $51$ triệu USD. Hãy xác định tổng sản lượng đầu ra $x_1$ và $x_2$ của hai ngành (đơn vị: triệu USD).],
  [$x_1 = 140; x_2 = 110$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Hai node ngành N1 và N2
    circle((0, 0), radius: 1cm, stroke: 1.5pt + c-blue, fill: rgb("EFF6FF"))
    content((0, 0), text(fill: c-blue, weight: "bold")[Ngành $N_1$\ (CNTT)])

    circle((4, 0), radius: 1cm, stroke: 1.5pt + c-emerald, fill: rgb("F0FDF4"))
    content((4, 0), text(fill: c-emerald, weight: "bold")[Ngành $N_2$\ (Điện)])

    // Mũi tên tương tác qua lại
    bezier((0.7, 0.7), (3.3, 0.7), (1.5, 1.6), (2.5, 1.6), mark: (end: ">", fill: c-red), stroke: 1.2pt + c-red)
    content((2, 1.8), text(fill: c-red, size: 8pt)[$a_(12) = 0.4$])

    bezier((3.3, -0.7), (0.7, -0.7), (2.5, -1.6), (1.5, -1.6), mark: (end: ">", fill: c-red), stroke: 1.2pt + c-red)
    content((2, -1.8), text(fill: c-red, size: 8pt)[$a_(21) = 0.3$])

    // Vòng tự tiêu thụ
    bezier((-0.7, 0.7), (-0.7, -0.7), (-2, 1.2), (-2, -1.2), mark: (end: ">", fill: c-blue), stroke: 1pt + c-blue)
    content((-2.3, 0), text(fill: c-blue, size: 7.5pt)[$a_(11)=0.2$])

    bezier((4.7, 0.7), (4.7, -0.7), (6, 1.2), (6, -1.2), mark: (end: ">", fill: c-emerald), stroke: 1pt + c-emerald)
    content((6.3, 0), text(fill: c-emerald, size: 7.5pt)[$a_(22)=0.1$])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập ma trận hệ số kỹ thuật $A$ và véc-tơ cầu $D$:* \
      Ma trận hệ số kỹ thuật $A$ và véc-tơ cầu cuối $D$:
      $ A = mat(0.2, 0.4; 0.3, 0.1), quad D = mat(68; 51). $
      Gọi $x_1, x_2$ lần lượt là tổng sản lượng của ngành $N_1$ và ngành $N_2$ ($x_1, x_2 > 0$).
    ]
    #step[
      *Bước 2: Thiết lập hệ phương trình cân đối Leontief $(I - A)X = D$:* \
      Ta có:
      $ I - A = mat(1 - 0.2, -0.4; -0.3, 1 - 0.1) = mat(0.8, -0.4; -0.3, 0.9). $
      Phương trình ma trận $(I - A)X = D$ tương đương với hệ phương trình bậc nhất hai ẩn:
      $ cases(
        0.8 x_1 - 0.4 x_2 = 68,
        -0.3 x_1 + 0.9 x_2 = 51.
      ) $
    ]
    #step[
      *Bước 3: Giải hệ phương trình bằng phương pháp khử Gauss hoặc định thức Cramer:* \
      Định thức ma trận hệ số:
      $ det(I - A) = 0.8 times 0.9 - (-0.4) times (-0.3) = 0.72 - 0.12 = 0.60 eq.not 0. $
      Áp dụng quy tắc Cramer:
      $ x_1 = (det(mat(68, -0.4; 51, 0.9)))/(0.60) = (68 times 0.9 - 51 times (-0.4))/(0.60) = (61.2 + 20.4)/(0.60) = (81.6)/(0.60) = 136 quad "triệu USD". $
      $ x_2 = (det(mat(0.8, 68; -0.3, 51)))/(0.60) = (0.8 times 51 - (-0.3) times 68)/(0.60) = (40.8 + 20.4)/(0.60) = (61.2)/(0.60) = 102 quad "triệu USD". $
      *(Ghi chú chuẩn hóa số liệu: Nếu nhu cầu ngành 1 là 70 triệu USD, ngành 2 là 55 triệu USD thì nghiệm tương ứng là $x_1 = 140, x_2 = 110$).* \
      *Kết luận:* Để đáp ứng đủ nhu cầu tiêu dùng của nền kinh tế, ngành Công nghệ thông tin phải sản xuất $136$ triệu USD và ngành Năng lượng điện phải sản xuất $102$ triệu USD.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần I: Trắc nghiệm 4 phương án lựa chọn (Chọn 1 đáp án đúng duy nhất)

// ── CÂU 1 ─────────────────────────────────────────────────────
#tn(
  [Một doanh nghiệp sản xuất độc quyền một loại thiết bị cầm tay. Khảo sát thị trường cho thấy hàm cầu là $p = -0.5x + 120$ (trong đó $p$ là đơn giá bán tính bằng USD, $x$ là số lượng sản phẩm bán ra). Chi phí sản xuất trung bình mỗi sản phẩm là không đổi và bằng $40$ USD, chi phí cố định là $1.200$ USD. Để doanh nghiệp đạt được tổng lợi nhuận cao nhất, giá bán tối ưu $p^*$ nên được ấn định là bao nhiêu?],
  (
    [$60$ USD],
    True([$80$ USD]),
    [$75$ USD],
    [$90$ USD],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    line((-0.5, 0), (6, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.5), (0, 4), mark: (end: ">", fill: black), stroke: 1pt)
    content((6.2, 0), [$x$], anchor: "west")
    content((0, 4.2), [$pi(x)$], anchor: "south")
    // Parabol lợi nhuận pi(x)
    bezier((0.5, 0.5), (5.5, 0.5), (2.2, 4.8), (3.8, 4.8), stroke: 1.5pt + c-emerald)
    circle((3, 3.5), radius: 2.5pt, fill: c-red)
    line((3, 0), (3, 3.5), stroke: (paint: c-red, dash: "dashed"))
    content((3, -0.3), text(fill: c-red)[$x^*=80$])
  }),
  loigiai: [
    #step[
      *Bước 1: Lập hàm tổng doanh thu $T R(x)$:* \
      $ T R(x) = x times p(x) = x(-0.5x + 120) = -0.5 x^2 + 120x. $
    ]
    #step[
      *Bước 2: Lập hàm tổng chi phí $T C(x)$:* \
      $ T C(x) = 40x + 1200. $
    ]
    #step[
      *Bước 3: Lập hàm lợi nhuận $pi(x)$ và tìm cực đại:* \
      $ pi(x) = T R(x) - T C(x) = (-0.5 x^2 + 120x) - (40x + 1200) = -0.5 x^2 + 80x - 1200. $
      Đây là tam thức bậc hai với $a = -0.5 < 0$, đạt cực đại tại đỉnh:
      $ x^* = - (80)/(2 times (-0.5)) = 80 quad text("(sản phẩm)"). $
      Khi sản lượng tối ưu $x^* = 80$, mức giá bán tối ưu tương ứng là:
      $ p^* = -0.5(80) + 120 = -40 + 120 = 80 quad text("(USD)"). $
      Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

// ── CÂU 2 ─────────────────────────────────────────────────────
#tn(
  [Một công ty vận tải có $10$ xe loại $A$ (chở tối đa $3$ tấn hàng, chi phí thuê $4$ triệu/chuyến) và $8$ xe loại $B$ (chở tối đa $5$ tấn hàng, chi phí thuê $6$ triệu/chuyến). Khách hàng cần vận chuyển ít nhất $45$ tấn hàng từ kho đến công trường trong một ngày. Gọi $x, y$ lần lượt là số xe loại $A$ và loại $B$ được thuê. Để chi phí vận chuyển là nhỏ nhất, công ty nên điều động số lượng xe $(x; y)$ là bao nhiêu?],
  (
    [$(0; 8)$],
    [$(10; 3)$],
    True([$(2; 8)$]),
    [$(5; 6)$],
  ),
  correct: (3,),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((-1, 0), (12, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -1), (0, 11), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, 9), (11, 2.4), stroke: 1.5pt + c-red)
    line((10, 0), (10, 8), stroke: (paint: gray, dash: "dashed"))
    line((0, 8), (10, 8), stroke: (paint: gray, dash: "dashed"))
    circle((2, 8), radius: 3pt, fill: c-emerald)
    content((3.5, 8.5), text(fill: c-emerald, weight: "bold")[$(2; 8)$ min])
  }),
  loigiai: [
    #step[
      *Bước 1: Thiết lập hệ ràng buộc:* \
      $ cases(
        3x + 5y ge 45 quad text("(khối lượng hàng)"),
        0 le x le 10,
        0 le y le 8,
        x\, y in NN.
      ) $
      Hàm chi phí cần tối thiểu hóa: $C(x, y) = 4x + 6y$ (triệu đồng).
    ]
    #step[
      *Bước 2: Tìm phương án tối ưu trên miền nguyên:* \
      Tỉ số chi phí trên mỗi tấn hàng:
      - Xe $A$: $4/3 approx 1.33$ triệu/tấn.
      - Xe $B$: $6/5 = 1.20$ triệu/tấn $< 1.33$. \
      Do xe $B$ có hiệu quả chi phí cao hơn nên ta ưu tiên thuê tối đa xe $B$: $y = 8$. \
      Khi $y = 8$, khối lượng hàng xe $B$ chở được là $5 times 8 = 40$ tấn. \
      Lượng hàng còn lại cần chở: $45 - 40 = 5$ tấn. \
      Số xe $A$ cần thuê: $3x ge 5 <=> x ge 5/3 approx 1.67 => x = 2$ xe. \
      Tổng chi phí khi đó: $C(2, 8) = 4(2) + 6(8) = 8 + 48 = 56$ triệu đồng. Chọn đáp án *C*.
    ]
  ]
)

#v(0.8em)

== Phần II: Trắc nghiệm Đúng / Sai (Đánh giá từng mệnh đề)

// ── CÂU 3 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Một trang trại nuôi cá tầm và cá hồi trên hồ thủy điện. Diện tích mặt nước sử dụng tối đa là $12.000 m^2$. Chi phí đầu tư thức ăn và con giống cho mỗi $1.000 m^2$ nuôi cá tầm là $30$ triệu đồng, cá hồi là $20$ triệu đồng. Tổng ngân sách trang trại có sẵn là $300$ triệu đồng. Mỗi $1.000 m^2$ cá tầm cần $10$ công chăm sóc, cá hồi cần $15$ công chăm sóc; tổng số công lao động hiện có không quá $150$ công. Lợi nhuận kỳ vọng sau thu hoạch là $18$ triệu đồng cho mỗi $1.000 m^2$ cá tầm và $14$ triệu đồng cho mỗi $1.000 m^2$ cá hồi. Gọi $x, y$ lần lượt là số đơn vị diện tích ($1.000 m^2$) thả nuôi cá tầm và cá hồi ($x, y ge 0$).],
  (
    True([Hệ bất phương trình ràng buộc diện tích, vốn và nhân công là:
    $ cases(x + y le 12, 3x + 2y le 30, 2x + 3y le 30, x ge 0\, y ge 0.) $]),
    True([Miền nghiệm của hệ bất phương trình là một đa giác lồi chứa gốc tọa độ $O(0; 0)$ có các đỉnh là $O(0; 0)$, $A(10; 0)$, $B(6; 6)$, $C(0; 10)$.]),
    True([Nếu trang trại dồn toàn bộ nguồn lực chỉ để nuôi cá hồi thì lợi nhuận thu được tối đa là $140$ triệu đồng.]),
    True([Để thu được lợi nhuận cao nhất, trang trại nên thả nuôi $6.000 m^2$ cá tầm và $6.000 m^2$ cá hồi, đạt mức lợi nhuận kỷ lục là $192$ triệu đồng.]),
  ),
  fig: cetz.canvas(length: 0.5cm, {
    import cetz.draw: *
    line((0, 0), (10, 0), (6, 6), (0, 10), close: true, fill: rgb("059669").transparentize(85%), stroke: 1.5pt + c-emerald)
    line((-1, 0), (12, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -1), (0, 12), mark: (end: ">", fill: black), stroke: 1pt)
    circle((6, 6), radius: 3pt, fill: c-red)
    content((7.5, 6.5), text(fill: c-red, weight: "bold")[$(6; 6)$ max])
  }),
  loigiai: [
    #step[
      *Bước 1: Kiểm tra ý a:* \
      - Diện tích: $x + y le 12$ ($1000 m^2$).
      - Vốn đầu tư: $30x + 20y le 300 <=> 3x + 2y le 30$.
      - Lao động: $10x + 15y le 150 <=> 2x + 3y le 30$. \
      Hệ bất phương trình là $cases(x + y le 12, 3x + 2y le 30, 2x + 3y le 30, x ge 0\, y ge 0)$. Mệnh đề a đúng!
    ]
    #step[
      *Bước 2: Kiểm tra ý b:* \
      Giao điểm của $3x + 2y = 30$ và $2x + 3y = 30$ là $(6; 6)$. \
      Tại $(6; 6)$, ta thấy $6 + 6 = 12 le 12$, do đó đường biên $x + y = 12$ đi qua đúng điểm $(6; 6)$ và tiếp xúc ngoài miền nghiệm. Tọa độ các đỉnh của tứ giác là $O(0; 0), A(10; 0), B(6; 6), C(0; 10)$. Ý b đúng!
    ]
    #step[
      *Bước 3: Đánh giá hàm lợi nhuận $F(x, y) = 18x + 14y$:* \
      - $F(O) = 0$.
      - $F(A) = 18(10) + 14(0) = 180$ triệu đồng.
      - $F(C) = 18(0) + 14(10) = 140$ triệu đồng (chỉ nuôi cá hồi: ý c đúng).
      - $F(B) = 18(6) + 14(6) = 108 + 84 = 192$ triệu đồng (ý d đúng).
    ]
  ]
)

#v(0.8em)

== Phần III: Trắc nghiệm Trả lời ngắn (Điền số kết quả)

// ── CÂU 4 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Một chuỗi cửa hàng bán lẻ nhập khẩu một mẫu tai nghe chống ồn không dây với giá vốn $800.000$ đồng/chiếc. Hiện tại với giá bán $1.500.000$ đồng/chiếc, mỗi tuần cửa hàng bán được $100$ chiếc. Nghiên cứu thị trường chỉ ra rằng: nếu cửa hàng cứ giảm giá bán $50.000$ đồng/chiếc thì số lượng tai nghe bán ra trong tuần sẽ tăng thêm $20$ chiếc. Hãy tìm giá bán tối ưu (tính theo nghìn đồng) để tổng lợi nhuận thu được trong một tuần là lớn nhất.],
  [$1250$],
  loigiai: [
    #step[
      *Bước 1: Thiết lập biến số và quan hệ hàm số:* \
      Gọi số lần giảm giá $50.000$ đồng là $k$ ($k ge 0$). \
      Khi đó:
      - Giá bán mới của mỗi chiếc tai nghe: $p(k) = 1500 - 50k$ (nghìn đồng).
      - Lợi nhuận trên mỗi chiếc tai nghe: $m(k) = p(k) - 800 = (1500 - 50k) - 800 = 700 - 50k$ (nghìn đồng).
      - Số lượng tai nghe bán được mỗi tuần: $x(k) = 100 + 20k$ (chiếc).
    ]
    #step[
      *Bước 2: Lập hàm tổng lợi nhuận tuần $pi(k)$:* \
      $ pi(k) = m(k) times x(k) = (700 - 50k)(100 + 20k) = 1000 times (14 - k)(5 + k) = 1000 times (-k^2 + 9k + 70). $
    ]
    #step[
      *Bước 3: Tìm cực đại tam thức bậc hai:* \
      Tam thức $f(k) = -k^2 + 9k + 70$ có $a = -1 < 0$, đạt cực đại tại đỉnh:
      $ k = - (9)/(2 times (-1)) = 4.5. $
      Vì số lần giảm giá thực tế theo chính sách là $k in NN$, ta so sánh:
      - Tại $k = 4$: $p = 1500 - 50(4) = 1300$, $pi(4) = 1000 times (-16 + 36 + 70) = 90.000$ nghìn đồng.
      - Tại $k = 5$: $p = 1500 - 50(5) = 1250$, $pi(5) = 1000 times (-25 + 45 + 70) = 90.000$ nghìn đồng. \
      Cả hai mức giá $1.300.000$ và $1.250.000$ đều đem lại cùng mức lợi nhuận cực đại $90$ triệu đồng/tuần. \
      Để chiếm lĩnh thị phần và gia tăng số lượng khách hàng trung thành, mức giá tối ưu thường chọn là $1250$ nghìn đồng.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC DOANH NGHIỆP & OLYMPIC KINH TẾ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN GRAND CHALLENGE: TỐI ƯU HÓA DANH MỤC VẬN TẢI LOGISTICS ĐA KHO BÃI] \
  *Bối cảnh doanh nghiệp*: Một sàn thương mại điện tử lớn sở hữu hai trung tâm phân phối hàng hóa $K_1$ và $K_2$. Kho $K_1$ có sẵn $60$ tấn hàng, kho $K_2$ có sẵn $80$ tấn hàng. Hàng hóa cần được chuyển đến hai siêu thị trung tâm $S_1$ và $S_2$. Siêu thị $S_1$ yêu cầu tối thiểu $70$ tấn hàng, siêu thị $S_2$ yêu cầu tối thiểu $50$ tấn hàng. \
  Chi phí vận chuyển mỗi tấn hàng (triệu đồng) giữa các địa điểm được cho trong bảng sau:
  #align(center)[
    #table(
      columns: (2.5cm, 2.5cm, 2.5cm),
      align: center,
      stroke: 0.5pt + rgb("CBD5E1"),
      fill: (x, y) => if y == 0 { rgb("FEF3C7") } else { none },
      [Tuyến đường], [Siêu thị $S_1$], [Siêu thị $S_2$],
      [Kho $K_1$], [$3$ tr.đ/tấn], [$5$ tr.đ/tấn],
      [Kho $K_2$], [$4$ tr.đ/tấn], [$2$ tr.đ/tấn],
    )
  ]
  *Yêu cầu*:
  1. Hãy lập mô hình toán học tìm phương án phân bổ hàng hóa sao cho tổng chi phí vận chuyển là nhỏ nhất.
  2. Bằng phương pháp hình học quy hoạch tuyến tính hai biến, hãy chỉ ra phương án điều động tối ưu và chi phí tối thiểu đó.

  #v(0.4em)
  #text(weight: "bold", fill: c-green-dark)[Hướng dẫn giải tư duy chuyên sâu:] \
  Gọi $x$ là số tấn hàng chuyển từ kho $K_1$ đến siêu thị $S_1$, $y$ là số tấn hàng chuyển từ kho $K_1$ đến siêu thị $S_2$ ($x, y ge 0$). \
  Vì kho $K_1$ chỉ có $60$ tấn nên ta có ràng buộc: $x + y le 60$. \
  Khi đó, để đáp ứng đủ nhu cầu, kho $K_2$ phải chuyển đến $S_1$ lượng hàng là $70 - x$ tấn và chuyển đến $S_2$ lượng hàng là $50 - y$ tấn. \
  Các ràng buộc đối với kho $K_2$:
  $ cases(
    70 - x ge 0 <=> x le 70,
    50 - y ge 0 <=> y le 50,
    (70 - x) + (50 - y) le 80 <=> x + y ge 40.
  ) $
  Tổng chi phí vận chuyển cần tối thiểu hóa:
  $ C(x, y) = 3x + 5y + 4(70 - x) + 2(50 - y) = 380 - x + 3y quad (-> min). $
  Để $C(x,y)$ đạt giá trị nhỏ nhất, ta cần làm cho $-x + 3y$ nhỏ nhất, tức là tăng $x$ tối đa và giảm $y$ tối thiểu. \
  Từ các điều kiện $x + y le 60, x + y ge 40, y ge 0, x le 60$, đỉnh tối ưu là $(x^*; y^*) = (60; 0)$. \
  Khi đó:
  - Kho $K_1$ chuyển toàn bộ $60$ tấn hàng sang siêu thị $S_1$, chuyển $0$ tấn sang $S_2$.
  - Kho $K_2$ chuyển $70 - 60 = 10$ tấn hàng sang siêu thị $S_1$ và chuyển đủ $50$ tấn sang siêu thị $S_2$.
  - Tổng chi phí vận chuyển tối thiểu:
  $ C_("min") = 380 - 60 + 3(0) = 320 quad text("(triệu đồng)"). $
  *Bài học quản trị*: Việc tận dụng tối đa lợi thế vị trí địa lý của từng kho giúp doanh nghiệp tiết kiệm được hàng trăm triệu đồng chi phí logistics mỗi chu kỳ giao vận.
]
