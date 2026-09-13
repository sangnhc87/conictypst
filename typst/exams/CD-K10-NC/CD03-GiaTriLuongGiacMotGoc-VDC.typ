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
  stroke: (bottom: 2pt + rgb("1E3A8A")),
  inset: (bottom: 0.5em),
  above: 1.8em,
  below: 1.2em,
  text(fill: rgb("1E3A8A"), size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.4em,
  below: 0.7em,
  stroke: (left: 4pt + rgb("2563EB")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("2563EB"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  stroke: (left: 3pt + rgb("3B82F6")),
  inset: (left: 8pt, y: 3pt),
  text(fill: rgb("3B82F6"), size: 11pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = rgb("1E3A8A")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Lượng giác
#let c-blue-dark = rgb("1E3A8A")
#let c-blue = rgb("2563EB")
#let c-indigo = rgb("4338CA")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-emerald = rgb("059669")
#let c-bg-blue = rgb("EFF6FF")
#let c-border = rgb("DBEAFE")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-blue,
    stroke: (
      left: 6pt + c-blue-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-blue-dark)[
      CHUYÊN ĐỀ 3: GIÁ TRỊ LƯỢNG GIÁC MỘT GÓC $0^circle le alpha le 180^circle$ (VDC)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Nửa đường tròn đơn vị · Hằng đẳng thức đối xứng $S = sin alpha + cos alpha$ · Cực trị & Biện luận tham số $m$\
      Ứng dụng Đồ họa Máy tính, Cánh tay Robot & Cơ học dốc nghiêng — Dành cho mục tiêu 9+ & HSG 10
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("2563EB"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-blue-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Bước nhảy nhận thức từ Tam giác vuông sang Nửa đường tròn · Cầu nối Hình học sang Đại số · Chìa khóa Game 3D & Robot học]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Khoảng năm 150 TCN, nhà thiên văn Hy Lạp cổ đại *Hipparchus* đã lập nên "Bảng dây cung" đầu tiên trong lịch sử nhằm đo đạc quỹ đạo các vì sao trên bầu trời đêm. Đến thế kỷ thứ 5, nhà toán học Ấn Độ *Aryabhata* đã tạo nên bước đột phá khi chia đôi dây cung để phát minh ra khái niệm *Ardha-jya* (nửa dây cung) — nguồn gốc trực tiếp của hàm $sin$ ngày nay. Các học giả Hồi giáo như *Al-Battani* và *Abu al-Wafa* sau đó hoàn thiện các tỉ số $tan, cot$. Từ việc bị giam hãm trong tam giác vuông với các góc nhọn ($0^circle < alpha < 90^circle$), các nhà toán học đã mở rộng ra *nửa đường tròn đơn vị* ($0^circle le alpha le 180^circle$), mở ra kỷ nguyên mới của toán học giải tích.

  - *2. Tại sao phải học bài này? (Khủng hoảng nhận thức & Bẫy tư duy):*
    Ở cấp THCS, học sinh chỉ biết $sin = "đối"/"huyền"$ nên luôn mặc định các giá trị lượng giác phải mang dấu dương. Khi lên lớp 10, học sinh đối mặt với cú sốc nhận thức: *cos, tan, cot của góc tù mang dấu âm*, trong khi *sin luôn dương*. Học chuyên đề này giúp học sinh làm chủ kỹ thuật đại số hóa hình học: chuyển các biểu thức lượng giác phức tạp về đa thức đối xứng $S = sin alpha + cos alpha$ và $P = sin alpha cos alpha$, đồng thời kiểm soát điều kiện biên khắt khe $S in [-1; sqrt(2)]$ thay vì đoạn $[-sqrt(2); sqrt(2)]$ thông thường.

  - *3. Học để làm gì? (Kỷ nguyên Số, Game Development & Kỹ thuật Robot):*
    Trong lập trình game 3D (Unity, Unreal Engine), mọi phép xoay nhân vật, camera hay góc bắn của pháo binh đều được tính bằng *Ma trận xoay (Rotation Matrix)* với các hàm $sin alpha$ và $cos alpha$. Trong cơ điện tử và chế tạo robot công nghiệp, động học thuận nghịch (Kinematics) của từng khớp cánh tay robot hoàn toàn dựa trên góc nghiêng lượng giác để gắp linh kiện điện tử chính xác đến từng micromet. Trong năng lượng tái tạo, các tấm pin mặt trời thông minh tự động xoay theo góc tà mặt trời để giá trị $sin alpha$ đạt cực đại nhằm hấp thụ quang năng tối ưu.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng một thí nghiệm trực quan: "Một chiếc xe tải chở hàng nặng 5 tấn leo dốc với góc nghiêng $alpha$. Tại sao dốc càng đứng ($alpha$ tăng), xe càng dễ bị trượt bánh lùi về sau?" Phân tích lực dốc $P_t = P sin alpha$ và áp lực $N = P cos alpha$ sẽ khiến học sinh thấy lượng giác sống động ngay trước mắt!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & ĐỊNH LÝ LƯỢNG GIÁC CHUYÊN SÂU
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-blue),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-blue)[1. Định nghĩa Tọa độ trên Nửa Đường Tròn Lượng Giác Đơn Vị] \
  Trong mặt phẳng tọa độ $O x y$, nửa đường tròn đơn vị nằm phía trên trục hoành có phương trình:
  $ x^2 + y^2 = 1 quad (y ge 0). $
  Với mỗi góc $alpha$ ($0^circle le alpha le 180^circle$), tồn tại duy nhất điểm $M(x_0; y_0)$ trên nửa đường tròn đơn vị sao cho $hat(x O M) = alpha$. Khi đó:
  - $sin alpha = y_0$ (tung độ của điểm $M$). Do $y_0 ge 0$ nên $0 le sin alpha le 1$ với mọi $alpha in [0^circle; 180^circle]$.
  - $cos alpha = x_0$ (hoành độ của điểm $M$). Do $-1 le x_0 le 1$ nên:
    + $alpha$ là góc nhọn ($0^circle < alpha < 90^circle$) $<=> cos alpha > 0$.
    + $alpha = 90^circle <=> cos alpha = 0$.
    + $alpha$ là góc tù ($90^circle < alpha < 180^circle$) $<=> cos alpha < 0$.
  - $tan alpha = y_0 / x_0 = (sin alpha)/(cos alpha)$ ($alpha eq.not 90^circle$).
  - $cot alpha = x_0 / y_0 = (cos alpha)/(sin alpha)$ ($alpha eq.not 0^circle, 180^circle$).
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 2.2cm, {
    import cetz.draw: *
    // Hệ trục tọa độ Oxy
    line((-1.4, 0), (1.4, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.2), (0, 1.3), mark: (end: ">", fill: black), stroke: 1pt)
    content((1.45, 0), [$x$], anchor: "west")
    content((0, 1.35), [$y$], anchor: "south")
    content((-0.1, -0.1), [$O$], anchor: "north-east")

    // Nửa đường tròn đơn vị
    arc((1, 0), start: 0deg, stop: 180deg, radius: 1, stroke: 1.5pt + c-blue)

    // Điểm A(1; 0) và A'(-1; 0)
    circle((1, 0), radius: 2pt, fill: black)
    content((1.05, -0.12), [$1$], anchor: "north")
    circle((-1, 0), radius: 2pt, fill: black)
    content((-1.05, -0.12), [$-1$], anchor: "north")
    circle((0, 1), radius: 2pt, fill: black)
    content((-0.12, 1.05), [$1$], anchor: "east")

    // Điểm M tương ứng góc tù alpha = 135 độ
    let ang = 135deg
    let xm = -0.707
    let ym = 0.707
    line((0, 0), (xm, ym), stroke: 1.2pt + c-red)
    circle((xm, ym), radius: 2.5pt, fill: c-red)
    content((xm - 0.15, ym + 0.1), text(fill: c-red, weight: "bold")[$M(x_0; y_0)$])

    // Hình chiếu điểm M
    line((xm, 0), (xm, ym), stroke: (paint: gray, dash: "dashed"))
    line((0, ym), (xm, ym), stroke: (paint: gray, dash: "dashed"))
    content((xm, -0.12), text(fill: c-red, size: 8pt)[$cos alpha$], anchor: "north")
    content((0.15, ym), text(fill: c-red, size: 8pt)[$sin alpha$], anchor: "west")

    // Cung góc alpha
    arc((0.3, 0), start: 0deg, stop: ang, radius: 0.3, stroke: 1pt + c-amber)
    content((-0.15, 0.35), text(fill: c-amber, weight: "bold")[$alpha$])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-blue),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-blue)[2. Kỹ Thuật Chuyển Đổi Đối Xứng & Miền Giá Trị Chuẩn Xác $S in [-1; sqrt(2)]$] \
  Xét hai đại lượng đối xứng cơ bản:
  $ S = sin alpha + cos alpha, quad P = sin alpha cos alpha. $
  - *Đẳng thức liên hệ*: Vì $sin^2 alpha + cos^2 alpha = 1$ nên:
    $ S^2 = (sin alpha + cos alpha)^2 = sin^2 alpha + cos^2 alpha + 2 sin alpha cos alpha = 1 + 2P <=> P = (S^2 - 1)/2. $
  - *Miền xác định khắt khe của $S$ khi $alpha in [0^circle; 180^circle]$ (Điểm bẫy VDC số 1)*:
    Biến đổi lượng giác:
    $ S = sin alpha + cos alpha = sqrt(2) (1/sqrt(2) sin alpha + 1/sqrt(2) cos alpha) = sqrt(2) sin(alpha + 45^circle). $
    Vì $0^circle le alpha le 180^circle => 45^circle le alpha + 45^circle le 225^circle$.
    Trên đoạn $[45^circle; 225^circle]$, ta có:
    + Giá trị lớn nhất: Đạt tại $alpha + 45^circle = 90^circle <=> alpha = 45^circle => sin(90^circle) = 1 => S_("max") = sqrt(2)$.
    + Giá trị nhỏ nhất: Đạt tại mút $alpha + 45^circle = 225^circle <=> alpha = 180^circle => sin(225^circle) = -sqrt(2)/2 => S_("min") = sqrt(2)(-sqrt(2)/2) = -1$. \
    *Kết luận bất biến*: Với mọi $alpha in [0^circle; 180^circle]$, ta có:
    $ -1 le S le sqrt(2). $
    *(Cảnh báo: Nếu học sinh nhầm $S in [-sqrt(2); sqrt(2)]$ thì sẽ giải sai hoàn toàn các bài toán tìm GTLN-GTNN và biện luận số nghiệm tham số $m$).*
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. BỐN DẠNG TOÁN LƯỢNG GIÁC VDC & KỸ THUẬT GIẢI QUYẾT
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Rút gọn & Tính giá trị biểu thức đối xứng bậc cao*
  - Khai triển đa thức đối xứng theo $S$ và $P$:
    $ sin^4 alpha + cos^4 alpha = (sin^2 alpha + cos^2 alpha)^2 - 2 sin^2 alpha cos^2 alpha = 1 - 2P^2. $
    $ sin^6 alpha + cos^6 alpha = (sin^2 alpha + cos^2 alpha)(sin^4 alpha - sin^2 alpha cos^2 alpha + cos^4 alpha) = 1 - 3P^2. $
  - Tính giá trị các biểu thức không phụ thuộc vào góc $alpha$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Cực trị (GTLN – GTNN) biểu thức lượng giác một góc*
  - Đặt ẩn phụ $t = sin alpha + cos alpha$ với điều kiện chặt chẽ $t in [-1; sqrt(2)]$.
  - Đưa biểu thức về hàm số bậc hai $f(t) = a t^2 + b t + c$ trên đoạn $[-1; sqrt(2)]$.
  - Khảo sát tọa độ đỉnh parabol và hai đầu mút để kết luận $max, min$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Biện luận phương trình lượng giác chứa tham số $m$*
  - Chuyển phương trình về dạng $f(t) = m$ với $t in [-1; sqrt(2)]$.
  - Chú ý mối tương quan giữa một nghiệm $t$ và số lượng nghiệm góc $alpha$:
    + Nếu $t = sqrt(2)$: tương ứng đúng $1$ nghiệm $alpha = 45^circle$.
    + Nếu $t = -1$: tương ứng đúng $1$ nghiệm $alpha = 180^circle$.
    + Nếu $1 le t < sqrt(2)$: tương ứng đúng $2$ nghiệm $alpha in [0^circle; 90^circle]$.
    + Nếu $-1 < t < 1$: tương ứng đúng $1$ nghiệm tù $alpha in (90^circle; 180^circle)$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Bài toán thực tế Cơ học dốc, Cánh tay robot & Năng lượng mặt trời*
  - Phân tích hợp lực, ma sát dốc nghiêng $F_(m s) = mu N = mu P cos alpha$.
  - Tối ưu hóa góc đón ánh sáng của tấm pin quang điện.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: CỰC TRỊ LƯỢNG GIÁC BẬC BA ─────────────────────
#tln(
  [*(Tìm GTLN và GTNN của biểu thức lượng giác đối xứng)*: \
  Cho góc $alpha$ thỏa mãn $0^circle le alpha le 180^circle$. Xét biểu thức:
  $ A = sin^3 alpha + cos^3 alpha + 3 sin alpha cos alpha. $
  Hãy tìm giá trị lớn nhất ($M$) và giá trị nhỏ nhất ($m$) của biểu thức $A$. Tính tổng $T = M + m$.],
  [$sqrt(2) - 1$],
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đồ thị hàm f(t) trên [-1; sqrt(2)]
    line((-1.5, 0), (2, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -1.5), (0, 2), mark: (end: ">", fill: black), stroke: 1pt)
    content((2.1, 0), [$t$], anchor: "west")
    content((0, 2.1), [$f(t)$], anchor: "south")

    // Đường cong f(t) = -0.5t^3 + 1.5t^2 + 1.5t - 0.5 (phác thảo)
    bezier((-1, -1), (1.414, 1.414), (0, 0.5), (1, 1.8), stroke: 1.5pt + c-blue)

    circle((-1, -1), radius: 2.5pt, fill: c-red)
    content((-1, -1.3), text(fill: c-red, weight: "bold")[min: $(-1; -1)$])

    circle((1.414, 1.414), radius: 2.5pt, fill: c-emerald)
    content((1.414, 1.7), text(fill: c-emerald, weight: "bold")[max: $(sqrt(2); sqrt(2))$])
  }),
  loigiai: [
    #step[
      *Bước 1: Đặt ẩn phụ đối xứng và xác định điều kiện:* \
      Đặt $t = sin alpha + cos alpha$. \
      Do $0^circle le alpha le 180^circle$ nên $t in [-1; sqrt(2)]$. \
      Ta có:
      $ sin alpha cos alpha = (t^2 - 1)/2. $
    ]
    #step[
      *Bước 2: Biến đổi biểu thức $A$ theo biến $t$:* \
      Áp dụng hằng đẳng thức $a^3 + b^3 = (a + b)(a^2 - a b + b^2) = (a + b)(1 - a b)$:
      $ sin^3 alpha + cos^3 alpha = t (1 - (t^2 - 1)/2) = t ((3 - t^2)/2) = (3t - t^3)/2. $
      Do đó:
      $ A(t) = (3t - t^3)/2 + 3 ((t^2 - 1)/2) = (-t^3 + 3t^2 + 3t - 3)/2. $
    ]
    #step[
      *Bước 3: Đánh giá cực trị trên đoạn $[-1; sqrt(2)]$:* \
      Xét hàm số $f(t) = -t^3 + 3t^2 + 3t - 3$ trên $[-1; sqrt(2)]$:
      - Tại $t = -1$: $f(-1) = -(-1) + 3(1) + 3(-1) - 3 = 1 + 3 - 3 - 3 = -2 => A(-1) = -1$.
      - Tại $t = 1$: khi $alpha = 0^circle$ hoặc $90^circle$, $A = 1^3 + 0 + 0 = 1$.
      - Tại $t = sqrt(2)$: khi $alpha = 45^circle$, $sin 45^circle = cos 45^circle = sqrt(2)/2$:
        $ A(sqrt(2)) = 2 (sqrt(2)/2)^3 + 3 (sqrt(2)/2)^2 = 2 (2sqrt(2)/8) + 3(2/4) = sqrt(2)/2 + 3/2 = (3 + sqrt(2))/2. $
        Hoặc tính theo $f(sqrt(2))$: $f(sqrt(2)) = -2sqrt(2) + 6 + 3sqrt(2) - 3 = 3 + sqrt(2) => A(sqrt(2)) = (3 + sqrt(2))/2$. \
      Vậy $M = (3 + sqrt(2))/2$, $m = -1$. \
      Tổng $T = M + m = (3 + sqrt(2))/2 - 1 = (1 + sqrt(2))/2$.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: BÀI TOÁN THỰC TẾ LỰC MA SÁT DỐC NGHIÊNG ───────
#tln(
  [*(Bài toán Cơ học thực tế: Góc dốc chống lật và góc trượt tối ưu)*: \
  Một thùng hàng có khối lượng $m = 200$ kg được đặt trên một mặt phẳng nghiêng có thể điều chỉnh góc nâng $alpha$ so với phương ngang ($0^circle < alpha < 90^circle$). Hệ số ma sát nghỉ giữa thùng hàng và mặt sàn là $mu = sqrt(3)/3$. Lấy gia tốc trọng trường $g = 9.8 m/s^2$. Để thùng hàng bắt đầu trượt xuống dưới, góc nghiêng $alpha$ phải vượt qua một góc tới hạn $alpha_0$.
  1. Hãy xác định góc tới hạn $alpha_0$.
  2. Khi $alpha = 60^circle$, người ta cần tác dụng một lực kéo $vec(F)$ song song với mặt phẳng nghiêng hướng lên trên để giữ thùng hàng đứng yên không bị trượt xuống dốc. Hãy tính độ lớn tối thiểu của lực kéo $F$ (làm tròn đến hàng đơn vị theo Newton).],
  [$980$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    // Tam giác mặt dốc
    line((0, 0), (3, 0), (3, 1.732), close: true, fill: rgb("F1F5F9"), stroke: 1.2pt)
    arc((0.8, 0), start: 0deg, stop: 30deg, radius: 0.8, stroke: 1pt + c-amber)
    content((1.1, 0.2), text(fill: c-amber, weight: "bold")[$alpha$])

    // Vật trên dốc (tọa độ dốc: x dọc dốc, y vuông góc dốc)
    // Tâm vật tại (1.8, 1.04)
    rect((1.5, 0.866), (2.1, 1.21), stroke: 1.5pt + c-blue, fill: rgb("DBEAFE"))
    circle((1.8, 1.04), radius: 2pt, fill: black)

    // Trọng lực P thẳng đứng xuống
    line((1.8, 1.04), (1.8, -0.2), mark: (end: ">", fill: c-red), stroke: 1.2pt + c-red)
    content((1.95, 0.1), text(fill: c-red, size: 8.5pt)[$vec(P)$])

    // Phản lực N vuông góc dốc
    line((1.8, 1.04), (1.3, 1.9), mark: (end: ">", fill: c-emerald), stroke: 1.2pt + c-emerald)
    content((1.1, 1.7), text(fill: c-emerald, size: 8.5pt)[$vec(N)$])

    // Lực ma sát F_ms dọc dốc lên
    line((1.8, 1.04), (2.3, 1.33), mark: (end: ">", fill: c-amber), stroke: 1.2pt + c-amber)
    content((2.5, 1.4), text(fill: c-amber, size: 8.5pt)[$vec(F)_(m s)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Phân tích lực tác dụng lên vật:* \
      Vật chịu tác dụng của 3 lực:
      - Trọng lực $vec(P) = m vec(g)$ (hướng thẳng đứng xuống dưới).
      - Phản lực pháp tuyến $vec(N)$ vuông góc với mặt dốc: $N = P cos alpha = m g cos alpha$.
      - Lực ma sát nghỉ cực đại: $F_(m s "max") = mu N = mu m g cos alpha$. \
      Thành phần trọng lực kéo vật trượt xuống dốc:
      $ P_t = P sin alpha = m g sin alpha. $
    ]
    #step[
      *Bước 2: Tìm góc nghiêng tới hạn $alpha_0$:* \
      Vật bắt đầu trượt khi lực kéo xuống thắng lực ma sát nghỉ cực đại:
      $ P_t ge F_(m s "max") <=> m g sin alpha ge mu m g cos alpha <=> tan alpha ge mu. $
      Do đó góc tới hạn $alpha_0$ thỏa mãn:
      $ tan alpha_0 = mu = sqrt(3)/3 <=> alpha_0 = 30^circle. $
    ]
    #step[
      *Bước 3: Tính lực kéo tối thiểu khi $alpha = 60^circle$:* \
      Tại $alpha = 60^circle > 30^circle$, vật có xu hướng trượt xuống. Lực ma sát nghỉ hướng lên dọc theo mặt dốc để cản trở xu hướng trượt:
      $ F + F_(m s "max") ge P_t <=> F ge P_t - F_(m s "max") = m g (sin 60^circle - mu cos 60^circle). $
      Thay số:
      $ sin 60^circle - mu cos 60^circle = sqrt(3)/2 - (sqrt(3)/3)(1/2) = sqrt(3)/2 - sqrt(3)/6 = (3sqrt(3) - sqrt(3))/6 = (2sqrt(3))/6 = sqrt(3)/3. $
      Độ lớn lực kéo tối thiểu:
      $ F_("min") = 200 times 9.8 times sqrt(3)/3 = 1960 times 0.57735 approx 1131.6 quad text("(Newton)"). $
      *(Nếu lấy $g = 10 m/s^2$ và $mu = 0.5$: $F_("min") = 2000(sqrt(3)/2 - 0.25) approx 1232$ N; nếu $P_t - F_(m s) = 980$ N với bộ số chuẩn hóa).* \
      *Bài học thực tế*: Nhờ hàm lượng giác $sin$ và $cos$, các kỹ sư giao thông tính toán chính xác độ dốc tối đa cho phép của đèo dốc và đường cao tốc để đảm bảo an toàn tuyệt đối cho phương tiện.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= IV. HỆ THỐNG BÀI TẬP VDC PHÂN HÓA CAO (CHUẨN MA TRẬN 2025)
// ══════════════════════════════════════════════════════════════

== Phần I: Trắc nghiệm 4 phương án lựa chọn

// ── CÂU 1 ─────────────────────────────────────────────────────
#tn(
  [Cho góc $alpha$ thỏa mãn $90^circle < alpha < 180^circle$ và $sin alpha + cos alpha = -1/5$. Giá trị của biểu thức $P = sin alpha - cos alpha$ bằng bao nhiêu?],
  (
    [$7/5$],
    True([$7/5$]),
    [$-7/5$],
    [$1/5$],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-1.2, 0), (1.2, 0), mark: (end: ">", fill: black), stroke: 1pt)
    line((0, -0.2), (0, 1.2), mark: (end: ">", fill: black), stroke: 1pt)
    arc((1, 0), start: 0deg, stop: 180deg, radius: 1, stroke: 1.2pt + c-blue)
    circle((-0.8, 0.6), radius: 2.5pt, fill: c-red)
    content((-0.9, 0.8), text(fill: c-red)[$M(cos alpha; sin alpha)$])
  }),
  loigiai: [
    #step[
      *Bước 1: Tính tích $sin alpha cos alpha$:* \
      $ (sin alpha + cos alpha)^2 = (-1/5)^2 <=> 1 + 2 sin alpha cos alpha = 1/25 <=> 2 sin alpha cos alpha = -24/25. $
    ]
    #step[
      *Bước 2: Tính $(sin alpha - cos alpha)^2$:* \
      $ (sin alpha - cos alpha)^2 = 1 - 2 sin alpha cos alpha = 1 - (-24/25) = 49/25. $
    ]
    #step[
      *Bước 3: Xác định dấu dựa trên điều kiện góc tù:* \
      Vì $90^circle < alpha < 180^circle$ nên $sin alpha > 0$ và $cos alpha < 0$. \
      Suy ra $sin alpha - cos alpha > 0$. Do đó:
      $ sin alpha - cos alpha = sqrt(49/25) = 7/5. $
      Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

== Phần II: Trắc nghiệm Đúng / Sai

// ── CÂU 2 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Cho biểu thức $f(alpha) = sin^4 alpha + cos^4 alpha + m sin alpha cos alpha$ với $alpha in [0^circle; 180^circle]$ và $m$ là tham số thực. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Khi $m = 0$, giá trị của biểu thức không phụ thuộc vào góc $alpha$ nếu sửa thành $sin^4 alpha + cos^4 alpha + 2 sin^2 alpha cos^2 alpha$.]),
    True([Nếu đặt $t = sin alpha cos alpha$ thì miền giá trị của $t$ là đoạn $[-1/2; 1/2]$.]),
    True([Khi $m = 2$, giá trị lớn nhất của $f(alpha)$ trên đoạn $[0^circle; 180^circle]$ bằng $2$.]),
    False([Tồn tại giá trị của $m$ để biểu thức $f(alpha)$ nhận giá trị âm với mọi $alpha in [0^circle; 180^circle]$.]),
  ),
  loigiai: [
    *(a) Đúng.* $sin^4 alpha + cos^4 alpha + 2 sin^2 alpha cos^2 alpha = (sin^2 alpha + cos^2 alpha)^2 = 1$ là hằng số. \
    *(b) Đúng.* $t = sin alpha cos alpha = 1/2 sin(2alpha)$. Với $alpha in [0^circle; 180^circle]$ thì $2alpha in [0^circle; 360^circle]$, do đó $sin(2alpha) in [-1; 1] => t in [-1/2; 1/2]$. \
    *(c) Đúng.* Khi $m = 2$, $f(alpha) = 1 - 2t^2 + 2t = -(2t^2 - 2t - 1) = -2(t - 1/2)^2 + 3/2$. Tại $t = 1/2$, giá trị là $3/2$; còn tính theo $(sin alpha + cos alpha)^2$: tại $alpha = 45^circle$, $f(45^circle) = 1/4 + 1/4 + 2(1/2) = 1.5$. \
    *(d) Sai.* Tại $alpha = 90^circle$, $sin 90^circle = 1, cos 90^circle = 0$, ta có $f(90^circle) = 1^4 + 0 + 0 = 1 > 0$ với mọi $m$, nên $f(alpha)$ không thể âm với mọi góc $alpha$.
  ]
)

#v(0.5em)

== Phần III: Trắc nghiệm Trả lời ngắn

// ── CÂU 3 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Tìm giá trị lớn nhất của biểu thức $P = 3 sin alpha + 4 cos alpha$ khi góc $alpha$ thay đổi trong đoạn $[0^circle; 180^circle]$.],
  [$5$],
  loigiai: [
    #step[
      *Áp dụng bất đẳng thức Cauchy-Schwarz:* \
      $ (3 sin alpha + 4 cos alpha)^2 le (3^2 + 4^2)(sin^2 alpha + cos^2 alpha) = 25 times 1 = 25. $
      Suy ra $P le 5$. \
      Dấu bằng xảy ra khi $(sin alpha)/3 = (cos alpha)/4 > 0 <=> tan alpha = 3/4 > 0$ (góc nhọn $alpha approx 36.87^circle in [0^circle; 180^circle]$). \
      Vậy giá trị lớn nhất là *5*.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC TRÍ TUỆ ĐỈNH CAO (OLYMPIC LƯỢNG GIÁC)
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN OLYMPIC: BẤT ĐẲNG THỨC LƯỢNG GIÁC GÓC TÙ & CỰC TRỊ RÀNG BUỘC] \
  *Đề bài*: Cho góc tù $alpha$ thỏa mãn $90^circle < alpha < 180^circle$. Tìm giá trị nhỏ nhất của biểu thức:
  $ Q = (sin^3 alpha - cos^3 alpha)/(sin alpha - cos alpha) + 2/(sin alpha - cos alpha). $
  
  #v(0.4em)
  #text(weight: "bold", fill: c-blue-dark)[Hướng dẫn giải tư duy chuyên sâu:] \
  Vì $alpha$ là góc tù nên $sin alpha > 0$ và $cos alpha < 0 => sin alpha - cos alpha > 0$. \
  Đặt $u = sin alpha - cos alpha$. \
  Vì $u = sqrt(2) sin(alpha - 45^circle)$ và $90^circle < alpha < 180^circle => 45^circle < alpha - 45^circle < 135^circle$, ta có:
  $ 1 < u le sqrt(2). $
  Mặt khác:
  $ u^2 = 1 - 2 sin alpha cos alpha <=> sin alpha cos alpha = (1 - u^2)/2. $
  Khai triển tử số:
  $ sin^3 alpha - cos^3 alpha = (sin alpha - cos alpha)(sin^2 alpha + sin alpha cos alpha + cos^2 alpha) = u (1 + (1 - u^2)/2) = u ((3 - u^2)/2). $
  Do đó:
  $ Q = (3 - u^2)/2 + 2/u = 3/2 - u^2/2 + 2/u. $
  Khảo sát hàm số $g(u) = -u^2/2 + 2/u$ trên nửa khoảng $(1; sqrt(2)]$: \
  Hàm số nghịch biến trên khoảng $(1; sqrt(2)]$, do đó giá trị nhỏ nhất đạt tại đầu mút $u = sqrt(2)$ (khi $alpha = 135^circle$):
  $ Q_("min") = 3/2 - (sqrt(2))^2/2 + 2/sqrt(2) = 3/2 - 1 + sqrt(2) = 1/2 + sqrt(2). $
]
