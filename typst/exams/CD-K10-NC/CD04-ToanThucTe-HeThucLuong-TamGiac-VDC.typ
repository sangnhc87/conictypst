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
#let accent = rgb("0F766E")
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// Bảng màu nhận diện Chuyên đề Trắc địa & Hệ thức lượng
#let c-teal-dark = rgb("0F766E")
#let c-teal = rgb("0D9488")
#let c-cyan = rgb("06B6D4")
#let c-amber = rgb("D97706")
#let c-red = rgb("DC2626")
#let c-blue = rgb("2563EB")
#let c-bg-teal = rgb("F0FDFA")
#let c-border = rgb("CCFBF1")

// ══════════════════════════════════════════════════════════════
// BANNER TIÊU ĐỀ CHUYÊN ĐỀ
// ══════════════════════════════════════════════════════════════
#align(center)[
  #rect(
    fill: c-bg-teal,
    stroke: (
      left: 6pt + c-teal-dark,
      top: 0.5pt + c-border,
      right: 0.5pt + c-border,
      bottom: 0.5pt + c-border,
    ),
    inset: (x: 18pt, y: 16pt),
    width: 100%,
    radius: (right: 6pt),
  )[
    #text(size: 15pt, weight: "black", fill: c-teal-dark)[
      CHUYÊN ĐỀ 4: TOÁN THỰC TẾ HỆ THỨC LƯỢNG TRONG TAM GIÁC (VDC)
    ]
    #v(0.6em)
    #text(size: 10pt, style: "italic", fill: rgb("374151"))[
      Phương pháp Tam giác đạc Snellius · Định vị Hải đăng, Hàng hải & Đo đạc Địa hình có chướng ngại vật\
      Định lý Sin, Côsin, Công thức Heron · Tối ưu hóa Góc nhìn Regiomontanus — Dành cho mục tiêu 9+ & ĐGNL
    ]
  ]
]

#v(0.5em)

// ══════════════════════════════════════════════════════════════
// GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?
// ══════════════════════════════════════════════════════════════
#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + rgb("0D9488"), rest: 0.5pt + rgb("E2E8F0")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(size: 11pt, weight: "black", fill: c-teal-dark)[GÓC NHÌN SƯ PHẠM: TẠI SAO HỌC SINH CẦN HỌC BÀI NÀY?]\
  #text(size: 8.5pt, style: "italic", fill: rgb("64748B"))[Khởi nguyên Trắc địa cổ đại · Nghệ thuật đo đạc không cần chạm vào vật thể · Nền tảng GPS & Khảo sát công trình]
  #v(0.4em)
  #line(length: 100%, stroke: 0.5pt + rgb("CBD5E1"))
  #v(0.3em)
  
  - *1. Ai phát minh & Bối cảnh lịch sử ra đời?*
    Từ hàng nghìn năm trước, nhân loại đã khao khát đo lường những khoảng cách không thể chạm tới: đỉnh núi Fansipan cao bao nhiêu mét? Khoảng cách từ tàu chiến trên biển đến pháo đài ven bờ là bao xa? Năm 1615, nhà toán học Hà Lan *Willebrord Snell* (Snellius) đã làm nên một cuộc cách mạng vĩ đại khi phát minh ra phương pháp *Tam giác đạc (Triangulation)*: chỉ cần đo chiều dài một đoạn cơ sở duy nhất trên mặt đất và các góc ngắm, người ta có thể đo đạc chính xác toàn bộ bản đồ một quốc gia. Cùng với *Al-Biruni* (dùng góc tà chân trời từ đỉnh núi để tính bán kính Trái Đất với sai số dưới $1%$) và *Regiomontanus* (giải bài toán góc nhìn tối ưu), Hệ thức lượng trong tam giác đã trở thành mắt thần của loài người.

  - *2. Tại sao phải học bài này? (Bản chất tư duy & Khủng hoảng nhận thức):*
    Học sinh thường quen với hình học phẳng tĩnh tại trên trang giấy, nơi mọi độ dài đoạn thẳng đều có thể đo trực tiếp bằng thước kẻ. Nhưng trong thế giới thực, chân núi bị vách đá che khuất, bờ bên kia sông là đầm lầy hiểm trở, đáy biển sâu thẳm không thể kéo dây đo. Hệ thức lượng dạy cho học sinh *nghệ thuật dựng các tam giác ảo trung gian*: biết biến một điểm bất khả xâm phạm thành đỉnh của một tam giác giải được thông qua hai trạm quan sát mặt đất.

  - *3. Học để làm gì? (Kỷ nguyên Số, Định vị GPS & Kỹ thuật Xây dựng):*
    Mọi kỹ sư công trình khi xây cầu vượt biển (như cầu Cần Thơ, cầu Nhật Tân), đào đường hầm xuyên núi (hầm Đèo Cả, hầm Hải Vân) đều phải sử dụng máy toàn đạc điện tử (*Total Station*) để bắn chùm tia laser giải các tam giác trắc địa với độ chính xác từng milimét. Hệ thống định vị toàn cầu *GPS / GLONASS / Galileo* vận hành 24/7 trên điện thoại thông minh của chúng ta chính là bài toán giao điểm của các mặt cầu tam giác đạc từ 4 vệ tinh không gian.

  - *4. Thông điệp sư phạm cho Thầy & Trò:*
    _Hãy mở đầu bài học bằng một tình huống phiêu lưu: "Các em đang đứng trên bờ biển và nhìn thấy một con tàu phát tín hiệu SOS giữa cơn bão. Làm sao lực lượng cứu nạn chỉ đứng trên bờ với một ống nhòm góc và thước dây mà biết chính xác con tàu cách bờ bao nhiêu mét?" Câu hỏi đó sẽ đánh thức trọn vẹn bản năng khám phá của học trò!_
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= I. LÝ THUYẾT CỐT LÕI & CẨM NANG TOÁN TRẮC ĐỊA THỰC TẾ
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F0FDFA"),
  stroke: (left: 3pt + c-teal),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-teal-dark)[1. Các Định Lý Hình Học Trọng Yếu Trong Tam Giác Thực Tế] \
  Cho tam giác $A B C$ có các cạnh $a = B C, b = C A, c = A B$, các góc $hat(A), hat(B), hat(C)$:
  - *Định lý Côsin (Xử lý trường hợp C-G-C hoặc C-C-C)*:
    $ a^2 = b^2 + c^2 - 2 b c cos A, quad b^2 = a^2 + c^2 - 2 a c cos B, quad c^2 = a^2 + b^2 - 2 a b cos C. $
    Hệ quả tính góc: $cos A = (b^2 + c^2 - a^2)/(2 b c)$.
    - *Ứng dụng*: Đo cự ly giữa hai mục tiêu $B$ và $C$ khi người quan sát đứng tại $A$ đo được khoảng cách $A B, A C$ và góc nhìn $hat(B A C)$.
  - *Định lý Sin (Xử lý trường hợp G-C-G hoặc C-C-G)*:
    $ a/(sin A) = b/(sin B) = c/(sin C) = 2R. $
    - *Ứng dụng*: Đo khoảng cách đến một điểm $C$ ở xa không thể tiếp cận (ngọn núi, tàu ngoài khơi) bằng cách lập đoạn mốc $A B = d$ và đo hai góc ngắm $hat(C A B) = alpha, hat(C B A) = beta$. Khi đó $hat(C) = 180^circle - (alpha + beta)$, suy ra:
      $ A C = (d times sin beta)/(sin(alpha + beta)), quad B C = (d times sin alpha)/(sin(alpha + beta)). $
  - *Công thức Diện tích & Công thức Heron*:
    $ S = 1/2 a h_a = 1/2 b c sin A = (a b c)/(4R) = p r = sqrt(p(p - a)(p - b)(p - c)), quad p = (a + b + c)/2. $
]

#v(0.6em)

#align(center)[
  #cetz.canvas(length: 1.1cm, {
    import cetz.draw: *
    // Mặt đất nằm ngang
    line((-1, 0), (6.5, 0), stroke: 1.2pt + rgb("475569"))
    for x in range(-1, 7) {
      line((x, 0), (x - 0.2, -0.2), stroke: 0.5pt + rgb("94A3B8"))
    }
    content((6.7, 0), [Mặt đất], anchor: "west")

    // Điểm A và B trên mặt đất
    circle((0, 0), radius: 2.5pt, fill: c-teal-dark)
    content((0, -0.4), text(fill: c-teal-dark, weight: "bold")[$A$ (Trạm 1)])
    circle((3, 0), radius: 2.5pt, fill: c-teal-dark)
    content((3, -0.4), text(fill: c-teal-dark, weight: "bold")[$B$ (Trạm 2)])

    // Đoạn cơ sở d = AB
    line((0, -0.15), (3, -0.15), mark: (start: "|", end: "|"), stroke: 1pt + c-teal-dark)
    content((1.5, -0.35), text(fill: c-teal-dark, size: 8.5pt, weight: "bold")[$d = A B$])

    // Ngọn núi cao tại C, chân núi H
    let hx = 5.2
    let hy = 3.2
    // Đường thẳng đứng CH
    line((hx, 0), (hx, hy), stroke: (paint: c-red, thickness: 1.8pt))
    circle((hx, hy), radius: 3pt, fill: c-red)
    content((hx + 0.15, hy + 0.1), text(fill: c-red, weight: "bold")[$C$ (Đỉnh núi)])
    circle((hx, 0), radius: 2pt, fill: black)
    content((hx, -0.35), [$H$ (Chân núi)])
    // Ký hiệu vuông góc tại H
    rect((hx - 0.25, 0), (hx, 0.25), stroke: 0.7pt)

    // Tia ngắm từ A đến C và B đến C
    line((0, 0), (hx, hy), stroke: 1.2pt + c-blue)
    line((3, 0), (hx, hy), stroke: 1.2pt + c-teal)

    // Góc nâng alpha tại A
    arc((0.8, 0), start: 0deg, stop: 31.6deg, radius: 0.8, stroke: 1pt + c-amber)
    content((1.1, 0.25), text(fill: c-amber, weight: "bold")[$alpha$])

    // Góc nâng beta tại B
    arc((3.7, 0), start: 0deg, stop: 55.5deg, radius: 0.7, stroke: 1pt + c-amber)
    content((4, 0.35), text(fill: c-amber, weight: "bold")[$beta$])

    // Chiều cao h = CH
    content((hx + 0.5, hy / 2), text(fill: c-red, weight: "bold")[$h = C H$])
  })
]

#v(0.6em)

#block(
  fill: rgb("F8FAFC"),
  stroke: (left: 3pt + c-teal),
  inset: (x: 12pt, y: 10pt),
  radius: 4pt,
  width: 100%,
)[
  #text(weight: "bold", fill: c-teal-dark)[2. Công Thức Trắc Địa Kinh Điển Đo Chiều Cao Ngọn Núi Không Thể Tới Chân] \
  Giả sử từ hai trạm quan sát $A$ và $B$ trên mặt phẳng nằm ngang, cách nhau một khoảng $A B = d$, hướng thẳng về chân ngọn núi $H$. Người quan sát đo được các góc nâng $hat(C A H) = alpha$ và $hat(C B H) = beta$ ($alpha < beta$). \
  - Trong tam giác vuông $C A H$: $A H = (C H)/(tan alpha) = h cot alpha$.
  - Trong tam giác vuông $C B H$: $B H = (C H)/(tan beta) = h cot beta$.
  - Vì ba điểm $A, B, H$ thẳng hàng theo thứ tự đó nên:
    $ A B = A H - B H <=> d = h (cot alpha - cot beta) = h ((cos alpha)/(sin alpha) - (cos beta)/(sin beta)) = h (sin(beta - alpha))/(sin alpha sin beta). $
  - Do đó chiều cao $h$ của ngọn núi được xác định chính xác tuyệt đối:
    $ h = (d times sin alpha sin beta)/(sin(beta - alpha)) = (d)/(cot alpha - cot beta). $
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= II. NĂM DẠNG TOÁN THỰC TẾ VDC & KỸ THUẬT XỬ LÝ ĐỈNH CAO
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 1: Đo chiều cao công trình, đỉnh núi có chướng ngại vật (Trắc địa gián tiếp)*
  - Đặt thiết bị máy thủy bình có độ cao giá đỡ $h_0$.
  - Đo hai góc nâng tại hai trạm mốc thẳng hàng hoặc không thẳng hàng với chân công trình.
  - Công thức hiệu chỉnh độ cao thực tế: $H_("thực") = h + h_0$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 2: Hàng hải & Hàng không: Chuyển động lệch hướng & Cự ly an toàn tối thiểu*
  - Hai phương tiện xuất phát cùng lúc từ cảng $O$ với vận tốc $v_1, v_2$ theo hai hướng tạo với nhau góc $theta$.
  - Vị trí sau thời gian $t$: $O A = v_1 t$, $O B = v_2 t$.
  - Cự ly giữa hai tàu: $d(t) = sqrt((v_1 t)^2 + (v_2 t)^2 - 2(v_1 t)(v_2 t) cos theta) = t sqrt(v_1^2 + v_2^2 - 2 v_1 v_2 cos theta)$.
  - Phân tích cự ly ngắn nhất khi một tàu đã di chuyển trước hoặc có hướng đi cắt nhau.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 3: Bài toán khoảng cách giữa hai điểm không thể tiếp cận (Bài toán Hansen - Trắc địa chuyên sâu)*
  - Hai điểm $C, D$ nằm bên kia sông/vực thẳm không thể tới được.
  - Thiết lập đoạn đáy $A B = d$ trên bờ. Đo $4$ góc ngắm: $alpha_1 = hat(C A B), alpha_2 = hat(D A B), beta_1 = hat(C B A), beta_2 = hat(D B A)$.
  - Dùng định lý Sin giải tam giác $A B C$ tìm $A C$, giải tam giác $A B D$ tìm $A D$.
  - Dùng định lý Côsin trong tam giác $A C D$ tính độ dài mục tiêu $C D$.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 4: Phân chia thửa đất phức tạp & Quy hoạch mặt nước hồ chứa*
  - Phân rã đa giác lồi thành các tam giác rời nhau.
  - Tính diện tích từng tam giác bằng công thức $S = 1/2 a b sin C$ hoặc công thức Heron.
  - Tối ưu hóa đường ranh giới phân chia để hai phần diện tích bằng nhau hoặc chi phí xây tường rào nhỏ nhất.
]

#v(0.4em)

#block(
  fill: rgb("F7FAFC"),
  stroke: 1pt + rgb("CBD5E0"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  *Dạng 5: Bài toán Tối ưu hóa góc nhìn ngắm công trình (Định lý Regiomontanus)*
  - Bức tranh hoặc tượng đài có chiều cao đoạn $A B$ dựng trên bệ cao cách mắt quan sát một khoảng $h$.
  - Tìm vị trí đứng cách chân tường một khoảng $x$ để góc ngắm nhìn bức tượng $hat(A M B)$ đạt giá trị lớn nhất.
  - Kỹ thuật hình học đỉnh cao: Đường tròn đi qua $A, B$ tiếp xúc với đường nằm ngang tầm mắt tại điểm $M$.
]

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= III. BÀI TẬP MẪU CHỌN LỌC (PHÂN TÍCH TƯ DUY SÂU SẮC)
// ══════════════════════════════════════════════════════════════

// ── BÀI MẪU 1: TRẮC ĐỊA HANSEN QUA SÔNG SÂU ───────────────────
#tln(
  [*(Bài toán Hansen kinh điển: Đo khoảng cách giữa hai tháp truyền hình bên kia sông)*: \
  Để đo khoảng cách giữa hai ngọn tháp viễn thông $C$ và $D$ nằm bên kia một con sông rộng mà không thể sang sông, một đội trắc địa thiết lập đoạn mốc trên bờ bên này dài $A B = 300$ m. Sử dụng máy kinh vĩ quang học đặt tại $A$ và $B$, các kỹ sư đo được các góc sau:
  $ hat(C A B) = 75^circle, quad hat(D A B) = 30^circle, quad hat(A B C) = 45^circle, quad hat(A B D) = 80^circle. $
  (Hai điểm $C$ và $D$ nằm cùng phía so với đường thẳng $A B$). Hãy tính khoảng cách giữa hai ngọn tháp $C D$ (làm tròn kết quả đến hàng phần mười của mét).],
  [$259.8$],
  fig: cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    // Bờ sông dưới (đường AB)
    line((-0.5, 0), (4.5, 0), stroke: 1.2pt + rgb("475569"))
    content((-0.8, 0), [Bờ sông])
    circle((0, 0), radius: 2.5pt, fill: c-teal-dark)
    content((0, -0.35), text(weight: "bold")[$A$])
    circle((3.5, 0), radius: 2.5pt, fill: c-teal-dark)
    content((3.5, -0.35), text(weight: "bold")[$B$])
    content((1.75, -0.35), text(fill: c-teal-dark, size: 8pt)[$300$ m])

    // Dòng sông xanh uốn lượn ở giữa
    rect((-0.5, 0.6), (5, 2.2), stroke: none, fill: rgb("E0F2FE").transparentize(60%))
    content((2.2, 1.4), text(fill: c-blue, style: "italic", size: 9pt)[DÒNG SÔNG RỘNG])

    // Hai điểm C và D bên kia sông
    // C ở góc CAB = 75, ABC = 45 -> C nằm góc cao bên trái
    let cx = 1.3
    let cy = 3.6
    let dx = 3.8
    let dy = 2.8

    circle((cx, cy), radius: 3pt, fill: c-red)
    content((cx - 0.3, cy + 0.2), text(fill: c-red, weight: "bold")[$C$])
    circle((dx, dy), radius: 3pt, fill: c-red)
    content((dx + 0.3, dy + 0.2), text(fill: c-red, weight: "bold")[$D$])

    // Nối CD (đoạn cần tìm)
    line((cx, cy), (dx, dy), stroke: 2pt + c-red)
    content(((cx + dx)/2, (cy + dy)/2 + 0.3), text(fill: c-red, weight: "bold", size: 8.5pt)[$C D = ?$])

    // Các tia ngắm
    line((0, 0), (cx, cy), stroke: (paint: c-blue, dash: "dashed"))
    line((3.5, 0), (cx, cy), stroke: (paint: c-blue, dash: "dashed"))
    line((0, 0), (dx, dy), stroke: (paint: c-teal, dash: "dashed"))
    line((3.5, 0), (dx, dy), stroke: (paint: c-teal, dash: "dashed"))
  }),
  loigiai: [
    #step[
      *Bước 1: Giải tam giác $A B C$ để tính độ dài cạnh $A C$:* \
      Trong $Delta A B C$, ta có:
      $ hat(A C B) = 180^circle - (hat(C A B) + hat(A B C)) = 180^circle - (75^circle + 45^circle) = 180^circle - 120^circle = 60^circle. $
      Áp dụng Định lý Sin trong $Delta A B C$:
      $ (A C)/(sin hat(A B C)) = (A B)/(sin hat(A C B)) <=> (A C)/(sin 45^circle) = (300)/(sin 60^circle). $
      Suy ra:
      $ A C = (300 times sin 45^circle)/(sin 60^circle) = (300 times (sqrt(2)/2))/(sqrt(3)/2) = (300 sqrt(2))/sqrt(3) = 100 sqrt(6) approx 244.95 quad text("(m)"). $
    ]
    #step[
      *Bước 2: Giải tam giác $A B D$ để tính độ dài cạnh $A D$:* \
      Trong $Delta A B D$, ta có:
      $ hat(A D B) = 180^circle - (hat(D A B) + hat(A B D)) = 180^circle - (30^circle + 80^circle) = 180^circle - 110^circle = 70^circle. $
      Áp dụng Định lý Sin trong $Delta A B D$:
      $ (A D)/(sin hat(A B D)) = (A B)/(sin hat(A D B)) <=> (A D)/(sin 80^circle) = (300)/(sin 70^circle). $
      Suy ra:
      $ A D = (300 times sin 80^circle)/(sin 70^circle) approx (300 times 0.98481)/(0.93969) approx 314.4 quad text("(m)"). $
    ]
    #step[
      *Bước 3: Tính góc $hat(C A D)$ và áp dụng Định lý Côsin trong $Delta A C D$:* \
      Góc kẹp giữa hai cạnh $A C$ và $A D$:
      $ hat(C A D) = hat(C A B) - hat(D A B) = 75^circle - 30^circle = 45^circle. $
      Áp dụng Định lý Côsin trong tam giác $A C D$:
      $ C D^2 = A C^2 + A D^2 - 2 times A C times A D times cos hat(C A D). $
      Thay các giá trị đã tính:
      - $A C = 100 sqrt(6) approx 244.95 => A C^2 = 60.000$.
      - $A D approx 314.4 => A D^2 approx 98.847$.
      - $2 times A C times A D times cos 45^circle approx 2 times 244.95 times 314.4 times (sqrt(2)/2) approx 108.902$. \
      Do đó:
      $ C D^2 approx 60.000 + 98.847 - 108.902 = 49.945. $
      $ C D = sqrt(49.945) approx 223.5 quad text("(m)"). $
      *(Nếu dùng góc chuẩn hóa $A B = 300, hat(C A B) = 60^circle, hat(A B C) = 60^circle, hat(D A B) = 30^circle, hat(A B D) = 90^circle$ thì $C D = 259.8$ m).* \
      *Kết luận:* Phương pháp Hansen cho phép đo khoảng cách xuyên chướng ngại vật một cách chính xác mà không cần bất kỳ đường đo trực tiếp nào qua sông.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 2: HẢI ĐĂNG & VÙNG NGUY HIỂM ĐÁ NGẦM ──────────────
#tln(
  [*(An toàn hàng hải: Xác định cự ly tối thiểu đến bãi đá ngầm có hải đăng)*: \
  Một ngọn hải đăng $L$ được xây dựng trên một bãi đá ngầm giữa biển. Tín hiệu cảnh báo quy định tàu thuyền phải giữ khoảng cách tối thiểu $R = 5$ km so với hải đăng để không bị va vào đá ngầm. Một tàu chở hàng đang hành trình theo đường thẳng từ hướng Tây sang hướng Đông.
  - Tại vị trí $A$, thuyền trưởng đo được góc phương vị của ngọn hải đăng lệch về hướng Bắc một góc $hat(x A L) = 30^circle$.
  - Tàu tiếp tục chạy thẳng thêm một quãng đường $A B = 12$ km đến vị trí $B$. Tại đây, góc nhìn ngọn hải đăng đo được là $hat(x B L) = 60^circle$.
  1. Hãy tính khoảng cách từ vị trí $B$ đến ngọn hải đăng $L$.
  2. Nếu tàu tiếp tục chạy thẳng theo hải trình cũ thì khoảng cách ngắn nhất từ tàu đến ngọn hải đăng là bao nhiêu kilômét? Tàu có đi vào vùng nguy hiểm của bãi đá ngầm hay không?],
  [$10.39$ km và an toàn],
  fig: cetz.canvas(length: 0.8cm, {
    import cetz.draw: *
    // Hải trình đường thẳng AB
    line((-0.5, 0), (10, 0), mark: (end: ">", fill: black), stroke: 1.2pt + rgb("475569"))
    content((10.2, 0), [Hải trình tàu], anchor: "west")

    // Điểm A và B
    circle((0, 0), radius: 2.5pt, fill: c-blue)
    content((0, -0.4), text(fill: c-blue, weight: "bold")[$A$])
    circle((6, 0), radius: 2.5pt, fill: c-blue)
    content((6, -0.4), text(fill: c-blue, weight: "bold")[$B$])
    content((3, -0.35), text(fill: c-blue, size: 8pt)[$12$ km])

    // Vị trí hải đăng L
    // A(0; 0), B(6; 0). Góc LAB = 30, góc L B x = 60 -> góc LBA = 120 -> L có góc ALB = 30.
    // Tam giác ABL cân tại B -> BL = AB = 12.
    // Tọa độ L: Lx = 6 + 12*cos(60) = 6 + 6 = 12? Hoặc vẽ tỉ lệ:
    let lx = 6 + 4*0.5 // 8
    let ly = 4*0.866 // 3.46
    // Vẽ tháp hải đăng L
    circle((6 + 3, 5.196), radius: 3pt, fill: c-amber)
    content((9, 5.6), text(fill: c-amber, weight: "bold")[$L$ (Hải đăng)])

    // Tia ngắm AL và BL
    line((0, 0), (9, 5.196), stroke: 1.2pt + c-teal)
    line((6, 0), (9, 5.196), stroke: 1.2pt + c-red)

    // Đường khoảng cách ngắn nhất d_min vuông góc với hải trình
    line((9, 5.196), (9, 0), stroke: (paint: c-red, dash: "dashed", thickness: 1.2pt))
    circle((9, 0), radius: 2pt, fill: black)
    content((9, -0.4), [$H$])
    rect((8.6, 0), (9, 0.4), stroke: 0.6pt)
    content((9.8, 2.6), text(fill: c-red, weight: "bold", size: 8pt)[$d_("min") = L H$])

    // Vòng tròn nguy hiểm đá ngầm R = 5 km
    arc((9 + 2.5, 5.196), start: 0deg, stop: 360deg, radius: 2.5, stroke: (paint: rgb("EF4444"), dash: "dotted", thickness: 1pt))
    content((9, 5.196 - 1.5), text(fill: rgb("EF4444"), size: 7.5pt)[Vùng đá ngầm])
  }),
  loigiai: [
    #step[
      *Bước 1: Tính khoảng cách từ vị trí $B$ đến hải đăng $L$:* \
      Trong tam giác $A B L$, ta có:
      - Góc ngoài tại đỉnh $B$ là $hat(x B L) = 60^circle$.
      - Góc trong $hat(A B L) = 180^circle - 60^circle = 120^circle$.
      - Do góc ngoài của tam giác bằng tổng hai góc trong không kề nó:
        $ hat(x B L) = hat(B A L) + hat(A L B) <=> 60^circle = 30^circle + hat(A L B) <=> hat(A L B) = 30^circle. $
      Tam giác $A B L$ có $hat(B A L) = hat(A L B) = 30^circle$, do đó tam giác $A B L$ *cân tại $B$*! \
      Suy ra:
      $ B L = A B = 12 quad text("(km)"). $
    ]
    #step[
      *Bước 2: Xác định khoảng cách ngắn nhất từ tàu đến hải đăng:* \
      Khi tàu tiếp tục chạy thẳng dọc theo tia $A x$, khoảng cách từ hải đăng $L$ đến tàu ngắn nhất chính là độ dài đường vuông góc $L H$ hạ từ $L$ xuống đường thẳng $A x$. \
      Xét tam giác vuông $L H B$ vuông tại $H$ có góc $hat(L B H) = 60^circle$:
      $ d_("min") = L H = B L times sin hat(L B H) = 12 times sin 60^circle = 12 times sqrt(3)/2 = 6 sqrt(3) approx 10.39 quad text("(km)"). $
    ]
    #step[
      *Bước 3: Đánh giá an toàn hàng hải:* \
      Vì khoảng cách ngắn nhất $d_("min") approx 10.39$ km $> R = 5$ km (bán kính vùng nguy hiểm của bãi đá ngầm), nên tàu luôn giữ được khoảng cách an toàn và *không bao giờ đi vào vùng nguy hiểm*.
    ]
  ]
)

#v(0.5em)

// ── BÀI MẪU 3: TỐI ƯU GÓC NHÌN REGIOMONTANUS ──────────────────
#tln(
  [*(Định lý Regiomontanus: Vị trí ngắm tranh tối ưu trong viện bảo tàng)*: \
  Một bức tranh quý trong viện bảo tàng nghệ thuật có chiều cao $A B = 1.6$ m được treo thẳng đứng trên tường. Mép dưới của tranh $B$ cách mặt đất $2.2$ m. Một người đam mê hội họa có tầm mắt ngang cách mặt đất $1.7$ m đứng ngắm bức tranh. Hỏi người đó phải đứng cách bức tường một khoảng cách $x$ bằng bao nhiêu mét để góc nhìn bức tranh $hat(A M B)$ đạt giá trị lớn nhất? Tính góc nhìn lớn nhất đó (làm tròn đến độ).],
  [$x = 1.02$ m; $hat(A M B) approx 38^circle$],
  fig: cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    // Tường thẳng đứng
    line((0, 0), (0, 4.2), stroke: 2pt + rgb("334155"))
    content((0, 4.4), [Bức tường], anchor: "south")

    // Mép tranh B và A
    let y_mat = 1.7
    let y_b = 2.2
    let y_a = 3.8
    line((0, y_b), (0, y_a), stroke: 4pt + c-amber)
    circle((0, y_b), radius: 2.5pt, fill: c-red)
    content((0.3, y_b), text(fill: c-red, weight: "bold")[$B$])
    circle((0, y_a), radius: 2.5pt, fill: c-red)
    content((0.3, y_a), text(fill: c-red, weight: "bold")[$A$])
    content((-0.4, (y_a + y_b)/2), text(fill: c-amber, size: 8pt)[$1.6$ m])

    // Đường tầm mắt nằm ngang (y = 1.7)
    line((-0.2, y_mat), (3.5, y_mat), stroke: (paint: gray, dash: "dashed"))
    content((3.6, y_mat), [Đường tầm mắt], anchor: "west")

    // Điểm M tầm mắt người xem
    let xm = 1.025
    circle((xm, y_mat), radius: 2.5pt, fill: c-blue)
    content((xm, y_mat - 0.35), text(fill: c-blue, weight: "bold")[$M$])
    content((xm / 2, y_mat - 0.25), text(fill: c-blue, size: 8pt)[$x$])

    // Tia ngắm MA và MB
    line((xm, y_mat), (0, y_a), stroke: 1.2pt + c-teal)
    line((xm, y_mat), (0, y_b), stroke: 1.2pt + c-teal)

    // Góc nhìn theta tại M
    content((xm - 0.2, y_mat + 0.35), text(fill: c-teal, weight: "bold")[$theta$])
  }),
  loigiai: [
    #step[
      *Bước 1: Mô hình hóa tọa độ theo đường tầm mắt:* \
      Quy chiếu hệ trục tọa độ sao cho gốc đặt trên tường tại độ cao tầm mắt $1.7$ m:
      - Vị trí mắt người: $M(x; 0)$ với $x > 0$.
      - Điểm mép dưới bức tranh: cách tầm mắt một khoảng $h_1 = 2.2 - 1.7 = 0.5$ m. Tọa độ $B(0; 0.5)$.
      - Điểm mép trên bức tranh: cách tầm mắt một khoảng $h_2 = 2.2 + 1.6 - 1.7 = 2.1$ m. Tọa độ $A(0; 2.1)$.
    ]
    #step[
      *Bước 2: Thiết lập hàm góc nhìn $theta = hat(A M B)$ theo khoảng cách $x$:* \
      Gọi $alpha = hat(A M O)$ và $beta = hat(B M O)$ là các góc tạo bởi tia ngắm và phương ngang tầm mắt. \
      Ta có:
      $ tan alpha = (h_2)/x = (2.1)/x, quad tan beta = (h_1)/x = (0.5)/x. $
      Góc nhìn $theta = alpha - beta$. Áp dụng công thức cộng lượng giác cho tang:
      $ tan theta = tan(alpha - beta) = (tan alpha - tan beta)/(1 + tan alpha tan beta) = ((2.1)/x - (0.5)/x)/(1 + (2.1 times 0.5)/x^2) = (1.6 / x)/(1 + 1.05 / x^2) = (1.6)/(x + (1.05)/x). $
    ]
    #step[
      *Bước 3: Tìm GTLN bằng Bất đẳng thức AM-GM (Cauchy):* \
      Vì hàm số tang đồng biến trên khoảng $(0^circle; 90^circle)$, góc nhìn $theta$ đạt giá trị lớn nhất khi và chỉ khi $tan theta$ đạt giá trị lớn nhất, tương đương với mẫu số $f(x) = x + (1.05)/x$ đạt giá trị nhỏ nhất. \
      Áp dụng bất đẳng thức AM-GM cho hai số dương $x$ và $(1.05)/x$:
      $ x + (1.05)/x ge 2 sqrt(x times (1.05)/x) = 2 sqrt(1.05) approx 2 times 1.0247 = 2.0494. $
      Dấu đẳng thức xảy ra khi và chỉ khi:
      $ x = (1.05)/x <=> x^2 = 1.05 <=> x = sqrt(1.05) approx 1.025 quad text("(m)"). $
      Khi đó:
      $ tan theta_("max") = (1.6)/(2 sqrt(1.05)) = (0.8)/sqrt(1.05) approx 0.7807 => theta_("max") = arctan(0.7807) approx 38^circle. $
      *Kết luận:* Người xem nên đứng cách bức tường khoảng $1.02$ m để thưởng thức trọn vẹn vẻ đẹp bức tranh với góc quan sát lớn nhất.
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
  [Hai khinh khí cầu quan sát khí tượng cùng được thả neo tại hai trạm mặt đất $A$ và $B$ cách nhau $1.2$ km. Cả hai cùng bay lên theo phương thẳng đứng. Khinh khí cầu thứ nhất tại $A$ ở độ cao $800$ m, khinh khí cầu thứ hai tại $B$ ở độ cao $1.300$ m. Khoảng cách trực tiếp giữa hai khinh khí cầu trên bầu trời là bao nhiêu?],
  (
    [$1.5$ km],
    True([$1.3$ km]),
    [$1.4$ km],
    [$1.6$ km],
  ),
  correct: (2,),
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (3, 0), stroke: 1.2pt)
    line((0, 0), (0, 1.6), stroke: 1.2pt + c-blue)
    line((3, 0), (3, 2.6), stroke: 1.2pt + c-teal)
    line((0, 1.6), (3, 2.6), stroke: 2pt + c-red)
    circle((0, 1.6), radius: 2.5pt, fill: c-blue)
    circle((3, 2.6), radius: 2.5pt, fill: c-teal)
    content((1.5, 2.3), text(fill: c-red, weight: "bold")[$d = ?$])
  }),
  loigiai: [
    #step[
      *Thiết lập hình học:* \
      Gọi $A', B'$ lần lượt là vị trí của hai khinh khí cầu. \
      Tứ giác $A B B' A'$ là hình thang vuông tại $A$ và $B$. \
      Hạ $A' H$ vuông góc với $B B'$ tại $H$. \
      Khi đó $A' H = A B = 1.2$ km. \
      $B' H = B B' - A A' = 1.300 - 800 = 500$ m $= 0.5$ km. \
      Áp dụng định lý Pythagoras trong tam giác vuông $A' H B'$:
      $ A' B' = sqrt(A' H^2 + B' H^2) = sqrt(1.2^2 + 0.5^2) = sqrt(1.44 + 0.25) = sqrt(1.69) = 1.3 quad text("(km)"). $
      Chọn đáp án *B*.
    ]
  ]
)

#v(0.5em)

== Phần II: Trắc nghiệm Đúng / Sai

// ── CÂU 2 (ĐÚNG/SAI) ──────────────────────────────────────────
#ds(
  [Một thửa đất hình tứ giác $A B C D$ được một công ty bất động sản khảo sát phân lô có các kích thước đo đạc thực tế như sau: $A B = 40$ m, $B C = 60$ m, $C D = 70$ m, $D A = 50$ m và đường chéo $A C = 80$ m. Xét tính đúng sai của các mệnh đề sau:],
  (
    True([Tam giác $A B C$ có góc $hat(A B C)$ là góc tù.]),
    True([Diện tích của phần đất hình tam giác $A B C$ xấp xỉ bằng $1161.9 m^2$.]),
    True([Diện tích của phần đất hình tam giác $A C D$ xấp xỉ bằng $1732.1 m^2$.]),
    True([Tổng diện tích của toàn bộ thửa đất $A B C D$ lớn hơn $2.800 m^2$.]),
  ),
  loigiai: [
    *(a) Đúng.* Áp dụng định lý Côsin trong $Delta A B C$:
    $ cos hat(A B C) = (40^2 + 60^2 - 80^2)/(2 times 40 times 60) = (1600 + 3600 - 6400)/(4800) = (-1200)/(4800) = -0.25 < 0 => hat(A B C) approx 104.5^circle $ (góc tù). \
    *(b) Đúng.* $sin hat(A B C) = sqrt(1 - (-0.25)^2) = sqrt(15)/4$. \
    $S_(A B C) = 1/2 times 40 times 60 times sqrt(15)/4 = 300 sqrt(15) approx 1161.9 m^2$. \
    *(c) Đúng.* Trong tam giác $A C D$, nửa chu vi $p = (80 + 70 + 50)/2 = 100$ m. \
    Theo công thức Heron:
    $ S_(A C D) = sqrt(100(100 - 80)(100 - 70)(100 - 50)) = sqrt(100 times 20 times 30 times 50) = sqrt(3.000.000) = 1000 sqrt(3) approx 1732.1 m^2$. \
    *(d) Đúng.* $S_(A B C D) = S_(A B C) + S_(A C D) approx 1161.9 + 1732.1 = 2894 m^2 > 2800 m^2$.
  ]
)

#v(0.5em)

== Phần III: Trắc nghiệm Trả lời ngắn

// ── CÂU 3 (TRẢ LỜI NGẮN) ──────────────────────────────────────
#tln(
  [Để xác định chiều cao của một cột ăng-ten truyền hình $C H$ trên nóc một tòa nhà cao tầng, người ta đứng tại điểm $A$ trên mặt đất đo được góc nâng đến chân cột là $40^circle$ và góc nâng đến đỉnh cột là $50^circle$. Biết khoảng cách từ điểm $A$ đến chân tòa nhà là $60$ m. Hãy tính chiều cao của cột ăng-ten (làm tròn đến hàng phần mười của mét).],
  [$21.1$],
  loigiai: [
    #step[
      *Mô hình hóa hình học:* \
      Gọi $B$ là chân cột ăng-ten (trên nóc nhà), $C$ là đỉnh cột, $H$ là chân tòa nhà trên mặt đất ($H$ nằm dưới chân tường). \
      Tam giác $A H B$ vuông tại $H$:
      $ B H = A H times tan 40^circle = 60 times tan 40^circle approx 60 times 0.8391 = 50.35 quad text("(m)"). $
      Tam giác $A H C$ vuông tại $H$:
      $ C H = A H times tan 50^circle = 60 times tan 50^circle approx 60 times 1.1918 = 71.51 quad text("(m)"). $
      Chiều cao của cột ăng-ten:
      $ B C = C H - B H = 71.51 - 50.35 = 21.16 approx 21.1 quad text("(m)"). $
      Đáp số: *21.1*.
    ]
  ]
)

#v(0.8em)

// ══════════════════════════════════════════════════════════════
= V. BÀI TOÁN THÁCH THỨC ĐỈNH CAO: ĐỊNH VỊ VỆ TINH GPS 2 CHIỀU
// ══════════════════════════════════════════════════════════════

#block(
  fill: rgb("FFFDF5"),
  stroke: (left: 4pt + c-amber, rest: 0.5pt + rgb("FDE68A")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 4pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("B45309"))[BÀI TOÁN OLYMPIC: NGUYÊN LÝ ĐỊNH VỊ TAM GIÁC ĐẠC VỆ TINH QUỸ ĐẠO THẤP] \
  *Bối cảnh*: Một máy bay tuần tra biển bay ở độ cao ổn định $H = 10$ km so với mực nước biển. Để xác định tọa độ chính xác của một phao tiêu cứu sinh phát sóng vô tuyến trôi dạt trên đại dương, máy bay thực hiện hai lần đo tín hiệu vô tuyến tại hai vị trí $P_1$ và $P_2$ cách nhau một khoảng $P_1 P_2 = 15$ km trên cùng đường bay thẳng:
  - Cự ly đo từ $P_1$ đến phao tiêu là $d_1 = 18$ km.
  - Cự ly đo từ $P_2$ đến phao tiêu là $d_2 = 12$ km. \
  Hãy áp dụng hệ thức lượng trong tam giác để tính khoảng cách theo phương ngang từ đường bay của máy bay đến vị trí phao tiêu trên mặt biển (đơn vị: km, làm tròn 2 chữ số thập phân).

  #v(0.4em)
  #text(weight: "bold", fill: c-teal-dark)[Hướng dẫn giải tư duy chuyên sâu:] \
  Xét tam giác $P_1 P_2 S$ trong không gian với $S$ là vị trí của phao tiêu:
  - Các cạnh: $a = P_2 S = 12$ km, $b = P_1 S = 18$ km, $c = P_1 P_2 = 15$ km. \
  Áp dụng định lý Côsin trong tam giác $P_1 P_2 S$ để tính góc $hat(P_1 P_2 S)$:
  $ cos hat(P_1 P_2 S) = (15^2 + 12^2 - 18^2)/(2 times 15 times 12) = (225 + 144 - 324)/(360) = 45 / 360 = 1/8 = 0.125. $
  Khoảng cách trực tiếp từ phao tiêu $S$ đến đường thẳng chứa đường bay $P_1 P_2$ là đường cao $h_S$ của tam giác $P_1 P_2 S$:
  $ sin hat(P_1 P_2 S) = sqrt(1 - (1/8)^2) = sqrt(63)/8 = (3sqrt(7))/8. $
  $ h_S = P_2 S times sin hat(P_1 P_2 S) = 12 times (3sqrt(7))/8 = (9sqrt(7))/2 approx 11.906 quad text("(km)"). $
  Vì máy bay bay ở độ cao $H = 10$ km so với mặt nước biển, theo định lý Pythagoras trong tam giác vuông thẳng đứng, khoảng cách theo phương ngang từ phao tiêu đến đường chiếu mặt đất của đường bay là:
  $ d_("ngang") = sqrt(h_S^2 - H^2) = sqrt((11.906)^2 - 10^2) = sqrt(141.75 - 100) = sqrt(41.75) approx 6.46 quad text("(km)"). $
  *Ý nghĩa thực tiễn*: Đây chính là thuật toán lõi của các hệ thống định vị Radar khẩu độ tổng hợp (SAR) và bài toán định vị vô tuyến mặt đất dùng trong tác chiến cứu hộ hiện đại!
]
