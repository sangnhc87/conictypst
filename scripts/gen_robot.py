import os

CONTENT = """#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

#set page(paper: "a4", margin: (x: 1.6cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show: stexgv-doc.with(
  doc-type: "book",
  title: "CHUYÊN ĐỀ TRỌNG ĐIỂM: DỰ ĐOÁN XU HƯỚNG ĐỀ THI 2026 - TOÁN THỰC TẾ CÁNH TAY ROBOT",
  author: "GV Nguyễn Văn Sang",
  theme-color: classic.blue,
)

#show heading.where(level: 1): it => block(
  width: 100%,
  stroke: (bottom: 1.5pt + rgb("1A5276")),
  inset: (bottom: 0.45em),
  above: 1.4em,
  below: 1.1em,
  text(fill: rgb("1A5276"), size: 15pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.2em,
  below: 0.7em,
  text(fill: rgb("8E2C4F"), size: 12pt, weight: "bold", it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

#align(center)[
  #rect(
    fill: rgb("F4F9F9"),
    stroke: (left: 4pt + rgb("1A5276")),
    inset: (x: 15pt, y: 15pt),
    width: 95%,
    radius: (right: 5pt),
  )[
    #text(size: 16pt, weight: "bold", fill: rgb("1A5276"))[
      DỰ ĐOÁN XU HƯỚNG ĐỀ THI 2026: TOÁN THỰC TẾ & MÔ HÌNH CÁNH TAY ROBOT
    ]
    #v(0.3em)
    #text(size: 10.5pt, style: "italic", fill: rgb("555555"))[
      Tích hợp kiến thức Hệ Thức Lượng, Tối Ưu Hóa (Đạo hàm), và Hình Học Không Gian (Oxyz) qua lăng kính Vật Lý - Cơ Khí.
    ]
  ]
]

= Xu Hướng Đề Thi 2026: Tại Sao Lại Là Cánh Tay Robot?

#lythuyet[
  Đề thi THPT Quốc Gia từ năm 2025 bắt đầu chuyển mình mạnh mẽ sang định hướng đánh giá năng lực STEM và khả năng áp dụng Toán học vào đời sống. Đến năm 2026, dự đoán **Bài Toán Mô Hình Hóa Cơ Khí (Đặc biệt là Cánh Tay Robot)** sẽ trở thành "cú đấm thép" phân loại học sinh ở các mốc 8+, 9+.

  *Tại sao mô hình này lại được người ra đề ưa chuộng?*
  - **Tích hợp đa tư duy:** Một bài toán tay robot phẳng kiểm tra cùng lúc Định lý Cosin, Sin, Bất đẳng thức tam giác và Cực trị hàm số.
  - **Chống bấm máy (Casio):** Học sinh không thể dùng thủ thuật Casio nếu không tự mình mô hình hóa được đại lượng cần tối ưu (thường là góc, cạnh, khoảng cách tới mặt sàn).
  - **Khả năng mở rộng linh hoạt:** Từ không gian 2D (robot phẳng) có thể dễ dàng đẩy lên 3D (Oxyz, tọa độ hóa, mặt cầu, góc nhị diện, quỹ đạo giao tuyến không gian).
]

= Khung Đọc Hình Và Ý Tưởng Giải Chuyên Sâu

#lythuyet[
  *Mô hình cốt lõi:* Các thanh $A B, B C, C D$ có độ dài cố định, hai đầu $A, D$ neo xuống sàn (hoặc một đầu neo, một đầu chạy trên ray), các khớp giữa được phép quay tự do.

  *Hai quy tắc "vàng" đọc vị đề ngay từ hình vẽ:*
  1. **Nhắm vào đích đến:** Nếu đề hỏi khoảng cách của khớp $X$ tới sàn, ta bắt buộc phải xét tam giác chứa $X$ và chân đế trên sàn. Ví dụ: Hỏi $B$ thì xét $A B D$; hỏi $C$ thì xét $A C D$.
  2. **Giải phẫu điểm nghẽn:** Sàn nhà chính là đường thẳng chứa $A D$. Khoảng cách từ khớp tới sàn chính là chiều cao tam giác hạ xuống cạnh $A D$. Cạnh biến thiên trong tam giác này chính là điểm nghẽn của bài toán, và nó luôn bị khống chế bởi Bất đẳng thức tam giác ở cụm khâu còn lại.
]

#align(center)[
  #table(
    columns: (1.2fr, 1.6fr, 2.5fr),
    inset: (x: 8pt, y: 8pt),
    stroke: 0.5pt + palette.border,
    fill: (c, r) => if r == 0 { palette.accent } else if calc.odd(r) { rgb("F8FBFF") } else { white },
    table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Mục tiêu tối ưu]],
    table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Tam giác khóa mục tiêu]],
    table.cell(fill: palette.accent)[#text(fill: white, weight: "bold")[Tư duy gỡ nút thắt (Tìm cạnh điều khiển)]],

    [$B$ (Độ cao khớp 1)], [$A B D$], [Sử dụng tam giác $B C D$ để ép dải giá trị của đường chéo $B D$],
    [$C$ (Độ cao khớp 2)], [$A C D$], [Sử dụng tam giác $A B C$ để ép dải giá trị của đường chéo $A C$],
    [$M$ (Đầu gắp Oxyz)], [Tam giác không gian / Mặt cắt], [Chiếu quỹ đạo xuống mặt phẳng, dùng giao tuyến cầu - phẳng],
  )
]

#ppgiai(title: [Note Idea Giải: Tinh Hoa Tư Duy 2026])[
  Thay vì học thuộc lòng, học sinh hướng đến điểm 9+ cần ghi nhớ lưu đồ giải mã sau:
  - **Bước 1 (Định hình):** Chốt đúng tam giác chứa độ cao cần tìm.
  - **Bước 2 (Chuyển ngữ Toán học):** Viết khoảng cách tới sàn dưới dạng $h = c \\sin \\alpha$ hoặc công thức diện tích $h = (2S)/(A D)$.
  - **Bước 3 (Nhận diện biến số):** Nhìn ra cạnh nào đang biến thiên (co giãn) theo các tư thế.
  - **Bước 4 (Khống chế biên):** Dùng bất đẳng thức tam giác ở cụm khâu lân cận để tìm $[min, max]$ của cạnh biến thiên.
  - **Bước 5 (Đòn chốt):** Áp dụng định lý Cosin hoặc Đạo hàm để chứng minh độ cao đạt cực trị khi cạnh biên đạt min/max. (Dấu bằng thường xảy ra khi các khâu duỗi thẳng hoặc gập gãy).
]

#luuy[
  **Bẫy sai lầm chết người:** Hình minh họa trong đề thi 2026 thường cố tình vẽ lệch đi, hoặc chỉ mang tính mô tả *cấu trúc liên kết*. Tuyệt đối không nhìn hình đoán kết quả cực trị. Dấu bằng của bất đẳng thức tam giác mới là "quan tòa" quyết định cấu hình cực trị!
]

= Đại Bác Vạn Năng — Khung Tổng Quát Cho Mọi Dạng

#lythuyet[
  *Khung phân tích bài toán robot:* Trước hết phải định vị “điểm thao tác”, “mặt phẳng tham chiếu”. Sau đó tìm đại lượng trung gian thực sự chi phối hệ thống: cạnh biến thiên, góc quay, bán kính quỹ đạo hay thiết diện vuông góc với giao tuyến.

  *Ba lối mòn dẫn đến đáp án:*
  - **Lối 1 (Đại số hóa Hình học):** Lượng giác và định lý cosin. Vũ khí sắc bén nhất khi cần tối ưu độ cao, góc nâng.
  - **Lối 2 (Công thức siêu tốc):** Diện tích và công thức Heron. Hợp với bài cho nhiều số đo thẳng.
  - **Lối 3 (Không gian hóa):** Quỹ đạo và phép chiếu. Vũ khí hạng nặng trị các dạng bài Oxyz, mặt cầu, elip, mặt phẳng nghiêng.
]

= Các Bài Toán Trọng Điểm - Mức Độ 7-8+

== Bài 1 — Khoảng Hở An Toàn Của Khớp Cảm Biến

#tln(
  [Trong một robot hàn khung xe ô tô tự động, ba khâu cứng $A B, B C, C D$ được nối bản lề tại $B$ và $C$. Hai đầu $A, D$ neo chặt trên sàn xưởng thẳng nằm ngang. Biết $A B = C D = 5$ m, $B C = 3$ m và $A D = 6$ m. Cơ cấu chuyển động trong một mặt phẳng vuông góc với sàn. Hỏi trong mọi tư thế chuyển động hợp lệ, khoảng cách từ khớp cảm biến $C$ tới mặt sàn đạt giá trị *nhỏ nhất* là bao nhiêu centimet?],
  [156],
  fig: align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let a = (0, 0)
      let d = (6, 0)
      let b = (1.5, 4.77)
      let c = (4.5, 4.77)

      // Vẽ lưới nền cho chuyên nghiệp
      grid((-1,-1), (7, 6), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
      
      line((-1.2, 0), (7.2, 0), stroke: 1.5pt + black) // Sàn cứng
      
      // Vẽ bóng của sàn
      rect((-1.2, 0), (7.2, -0.3), fill: pattern(size: (5pt, 5pt))[
        #line((0,0), (5pt,5pt), stroke: 0.5pt + gray)
      ], stroke: none)

      line(a, b, stroke: (paint: rgb("1F618D"), thickness: 2.5pt))
      line(b, c, stroke: (paint: rgb("C0392B"), thickness: 2.5pt))
      line(c, d, stroke: (paint: rgb("1F618D"), thickness: 2.5pt))

      // Vẽ khớp nối xịn hơn
      for pt in (a, b, c, d) {
        circle(pt, radius: 4pt, fill: white, stroke: 1.2pt + black)
        circle(pt, radius: 1.5pt, fill: black)
      }

      content(a, $A$, anchor: "north", padding: 8pt)
      content(b, $B$, anchor: "south-east", padding: 8pt)
      content(c, $C$, anchor: "south-west", padding: 8pt)
      content(d, $D$, anchor: "north", padding: 8pt)

      content((0.8, 2.4), [$5$ m], anchor: "east", padding: 3pt)
      content((3, 5.1), [$3$ m], anchor: "south", padding: 3pt)
      content((5.2, 2.4), [$5$ m], anchor: "west", padding: 3pt)
      content((3, -0.8), [$A D = 6$ m])
      content((6.5, -0.6), [*Sàn xưởng*])
    })
  ],
  fig-pos: "center",
  fig-width: 58%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Giải Phẫu Tư Duy Dự Đoán])[
      - **Dấu hiệu nhận biết:** Yêu cầu tìm khoảng cách nhỏ nhất của $C$ xuống đáy $A D$. Đây là bài toán cực trị đường cao tam giác.
      - **Chìa khóa:** Mở khóa qua tam giác $A C D$. Tuy nhiên, cạnh $A C$ lại lơ lửng, nó bị quản lý bởi "tay đòn" bên trái là $A B C$. Ta phải dùng Bất đẳng thức tam giác ở $A B C$ để ép $A C$ về min.
    ]

    #step[Thiết lập hàm mục tiêu]
    Gọi $h_C$ là khoảng cách từ khớp $C$ tới sàn nhà. Vì sàn nhà nằm trên đường thẳng $A D$, nên xét tam giác $A C D$, kẻ đường cao từ $C$ xuống $A D$, ta có
    $ h_C = C D \\sin \\alpha = 5 \\sin \\alpha, $
    với $\\alpha = \\angle C D A$.
    Để $h_C$ đạt Min, ta cần $\\sin \\alpha$ đạt Min.

    #step[Truy tìm biên độ dao động của $A C$]
    Xét "tay đòn" bên trái $A B C$, theo bất đẳng thức tam giác:
    $ |A B - B C| \\le A C \\le A B + B C. $
    Thay số vào ta chặn được $A C$:
    $
      |5 - 3| \\le A C \\le 5 + 3
      \\implies 2 \\le A C \\le 8.
    $

    #step[Liên kết đa thức bằng Định lý Cosin]
    Trong tam giác đích $A C D$, định lý Cosin cho:
    $ A C^2 = A D^2 + C D^2 - 2 A D \\cdot C D \\cos \\alpha. $
    Suy ra:
    $ \\cos \\alpha = \\frac{A D^2 + C D^2 - A C^2}{2 A D \\cdot C D} = \\frac{6^2 + 5^2 - A C^2}{2 \\cdot 6 \\cdot 5} = \\frac{61 - A C^2}{60}. $

    Đỉnh cao phân tích: Khi $A C$ chạy trong khoảng $[2, 8]$, $A C$ càng nhỏ thì $A C^2$ càng nhỏ $\\implies \\cos \\alpha$ càng lớn.
    Vì $\\alpha \\in (0, \\pi)$, $\\cos \\alpha$ lớn nhất $\\implies \\sin \\alpha$ nhỏ nhất (do $\\sin \\alpha = \\sqrt{1 - \\cos^2 \\alpha}$).
    Vậy $h_C$ Min khi $A C$ Min $\\implies A C = 2$.

    #step[Tính toán chốt hạ]
    Khi $A C = 2$:
    $ \\cos \\alpha = \\frac{61 - 2^2}{60} = \\frac{57}{60} = \\frac{19}{20}. $
    Suy ra:
    $ \\sin \\alpha = \\sqrt{1 - \\left(\\frac{19}{20}\\right)^2} = \\frac{\\sqrt{39}}{20}. $

    Vậy độ cao nhỏ nhất:
    $ h_C = 5 \\cdot \\frac{\\sqrt{39}}{20} = \\frac{\\sqrt{39}}{4} \\text{ (m)}. $
    Đổi ra centimet: $ h_C = 25 \\sqrt{39} \\approx 156.1 $ cm. 
    
    #nhanxet[
      Về mặt vật lý cơ khí, $A C = 2$ tức là $A, B, C$ thẳng hàng (khâu bị gập sát lại). Sự ăn khớp giữa Toán học và trực giác vật lý làm bài toán trở nên hoàn mỹ. Học sinh vững kiến thức sẽ không bao giờ sợ các bẫy số học.
    ]
  ],
)

== Bài 2 — Nâng Khớp Gắp Hàng Lên Cao Nhất

#tln(
  [Một robot gắp hàng trên băng chuyền tự động hóa gồm ba khâu cứng $A B, B C, C D$. Chân $A$ và $D$ bắt chặt vào đế, cách nhau $A D = 6$ m. Các thông số thanh: $A B = 5$ m, $B C = 2$ m, $C D = 3$ m. Yêu cầu lập trình viên tính toán độ cao tối đa (tính bằng cm) mà khớp $B$ có thể vươn tới để tránh va chạm với trần xưởng.],
  [400],
  fig: align(center)[
    #cetz.canvas(length: 0.95cm, {
      import cetz.draw: *
      let a = (0, 0)
      let d = (6, 0)
      let b = (3, 4)
      let c = (5, 4)

      grid((-1,-1), (7, 5), step: 1, stroke: (paint: gray.lighten(80%), thickness: 0.5pt))
      line((-1.2, 0), (7.2, 0), stroke: 1.5pt + black)
      rect((-1.2, 0), (7.2, -0.3), fill: pattern(size: (5pt, 5pt))[
        #line((0,0), (5pt,5pt), stroke: 0.5pt + gray)
      ], stroke: none)

      line(a, b, stroke: (paint: rgb("1F618D"), thickness: 2.5pt))
      line(b, c, stroke: (paint: rgb("C0392B"), thickness: 2.5pt))
      line(c, d, stroke: (paint: rgb("1F618D"), thickness: 2.5pt))

      for pt in (a, b, c, d) {
        circle(pt, radius: 4pt, fill: white, stroke: 1.2pt + black)
        circle(pt, radius: 1.5pt, fill: black)
      }

      content(a, $A$, anchor: "north", padding: 8pt)
      content(b, $B$, anchor: "south", padding: 8pt)
      content(c, $C$, anchor: "south-west", padding: 8pt)
      content(d, $D$, anchor: "north", padding: 8pt)

      content((1.5, 2.1), [$5$ m], anchor: "east", padding: 3pt)
      content((4, 4.35), [$2$ m], anchor: "south", padding: 3pt)
      content((5.5, 2.1), [$3$ m], anchor: "west", padding: 3pt)
      content((3, -0.8), [$A D = 6$ m])
    })
  ],
  fig-pos: "center",
  fig-width: 58%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Tương phản hình học])[
      Khác với bài 1, bài này yêu cầu tối ưu khớp $B$. Theo "Quy tắc vàng", ta lập tức chốt mục tiêu ở tam giác $A B D$. Cạnh cần khống chế lúc này chuyển sang nhánh phải: đoạn chéo $B D$.
    ]

    #step[Biểu diễn độ cao]
    Gọi $h_B$ là khoảng cách từ $B$ đến sàn, $\\alpha = \\angle B A D$.
    $ h_B = A B \\sin \\alpha = 5 \\sin \\alpha. $
    Mục tiêu: Maximize $\\sin \\alpha$.

    #step[Khóa cạnh biến thiên]
    Nhìn sang "tay đòn phải" tam giác $B C D$, ta có:
    $ |C D - B C| \\le B D \\le C D + B C \\implies |3 - 2| \\le B D \\le 3 + 2 \\implies 1 \\le B D \\le 5. $

    #step[Phá khóa bằng Cosin]
    Trong tam giác $A B D$:
    $ \\cos \\alpha = \\frac{A B^2 + A D^2 - B D^2}{2 A B \\cdot A D} = \\frac{25 + 36 - B D^2}{60} = \\frac{61 - B D^2}{60}. $
    Để $\\sin \\alpha$ lớn nhất, $\\cos \\alpha$ phải nhỏ nhất, tương đương $B D^2$ phải lớn nhất $\\implies B D = 5$.

    #step[Kết luận]
    Với $B D = 5$:
    $ \\cos \\alpha = \\frac{61 - 25}{60} = \\frac{36}{60} = \\frac{3}{5}. $
    Pitago kinh điển $3-4-5$ cho ngay $\\sin \\alpha = \\frac{4}{5}$.
    Vậy $h_B = 5 \\cdot \\frac{4}{5} = 4$ mét $= 400$ cm.

    #luuy[
      Bộ số Pitago được thiết kế khéo léo để học sinh giải gọn gàng trong phòng thi. Nếu cấu hình biến đổi thành $B D = A B$, tam giác sẽ cân, học sinh rèn luyện tư duy nhận diện nhanh các cấu trúc đặc biệt sẽ có lợi thế vượt trội về mặt thời gian.
    ]
  ],
)

= Câu Chốt 10 Điểm - Dự Đoán 2026: Tối Ưu Đa Biến & Không Gian Oxyz

#lythuyet[
  **Cảnh báo mức độ VDC 9+:** Trong đề thi 2026, câu phân loại thủ khoa thường đẩy bài toán vật lý vào không gian hệ tọa độ Oxyz hoặc đưa hệ về một hàm số phức tạp phải khảo sát bằng Đạo hàm. Kỹ thuật ở đây yêu cầu học sinh phải có tầm nhìn siêu việt: Gộp các ràng buộc không gian về quỹ đạo đường tròn/elip, sau đó dùng bất đẳng thức Minowski hoặc đánh giá vector.
]

== Bài VDC 1 — Cánh Tay Robot Phun Sơn Trong Không Gian Oxyz

#tln(
  [Trong hệ tọa độ $Oxyz$, một cánh tay robot phun sơn có khớp neo trung tâm cố định tại $A(1;1;1)$. Cánh tay nối từ $A$ đến vòi phun $M$ có chiều dài không đổi $A M = 2\\sqrt{3}$ m. Dưới sự điều khiển của hệ thống CNC, vòi phun $M$ bắt buộc phải di chuyển trượt trên bề mặt thao tác là một mặt phẳng $(P): x+y+z=6$. Để hoàn thành một chi tiết, vòi phun vẽ thành một vòng tròn khép kín trọn vẹn giới hạn của hệ thống. Tính độ dài tổng cộng (m) quỹ đạo vòi phun $M$ đã vạch ra.],
  [$6\\pi$],
  fig: align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let o = (0, 0)
      let x = (4.8, 0)
      let y = (-1.8, -1.6)
      let z = (0, 4.8)
      let a = (1.2, 1.2)
      let h = (2.8, 2.4)
      let m = (4.1, 2.4)

      // Axes
      line(o, x, mark: (end: "stealth", fill: black), stroke: 1pt)
      line(o, y, mark: (end: "stealth", fill: black), stroke: 1pt)
      line(o, z, mark: (end: "stealth", fill: black), stroke: 1pt)

      // Plane
      line(
        (1.4, 1.2),
        (4.9, 1.7),
        (4.1, 3.6),
        (0.6, 3.1),
        close: true,
        fill: rgb("EAF4FB").transparentize(20%),
        stroke: 1pt + rgb("7FB3D5"),
      )
      
      // Orbit circle
      circle(h, radius: 1.35, stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      
      // Robot Arm
      line(a, h, stroke: (paint: red, thickness: 1pt, dash: "dashed"))
      line(a, m, stroke: (paint: rgb("C0392B"), thickness: 2pt))
      line(h, m, stroke: (paint: rgb("1F618D"), thickness: 1pt, dash: "dashed"))

      circle(o, radius: 2.5pt, fill: black)
      circle(a, radius: 3pt, fill: white, stroke: 1pt+black)
      circle(h, radius: 2.5pt, fill: red)
      circle(m, radius: 3pt, fill: rgb("C0392B"))

      content(o, $O$, anchor: "south-west", padding: 4pt)
      content(x, $x$, anchor: "south", padding: 3pt)
      content(y, $y$, anchor: "north-east", padding: 3pt)
      content(z, $z$, anchor: "west", padding: 3pt)
      content(a, $A$, anchor: "west", padding: 4pt)
      content(h, $H$, anchor: "south", padding: 4pt)
      content(m, $M$, anchor: "east", padding: 4pt)
      content((4.45, 3.45), [$(P): x+y+z=6$], anchor: "south-west", padding: 2pt)
      content((1.8, 1.9), [$d=\\sqrt{3}$], anchor: "south", padding: 3pt)
    })
  ],
  fig-pos: "center",
  fig-width: 56%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Giải Phẫu Quỹ Đạo Không Gian])[
      - **Dịch mã đề bài:** $A M$ cố định $\\implies$ $M$ di chuyển trên **Mặt cầu tâm $A$**.
      - $M$ chạy trên $(P)$ $\\implies$ M nằm trên **Mặt phẳng $(P)$**.
      - **Điểm quy tụ:** Tập hợp điểm $M$ chính là giao tuyến của mặt cầu và mặt phẳng. Nếu khoảng cách từ tâm $A$ đến $(P)$ nhỏ hơn bán kính cầu, quỹ đạo là một đường tròn. Kiến thức lớp 12 Nón-Trụ-Cầu được ứng dụng tuyệt đẹp vào đây.
    ]

    #step[Kiểm tra điều kiện cắt]
    Mặt cầu $(S)$ có tâm $A(1;1;1)$ và bán kính $R = A M = 2\\sqrt{3}$.
    Khoảng cách từ tâm $A$ đến mặt phẳng $(P)$ là:
    $ h = d(A, (P)) = \\frac{|1 \\cdot 1 + 1 \\cdot 1 + 1 \\cdot 1 - 6|}{\\sqrt{1^2 + 1^2 + 1^2}} = \\frac{3}{\\sqrt{3}} = \\sqrt{3}. $
    Vì $h = \\sqrt{3} < R = 2\\sqrt{3}$, mặt phẳng cắt mặt cầu theo giao tuyến là đường tròn $(C)$. Quỹ đạo robot là một đường tròn hoàn hảo.

    #step[Tính thông số đường tròn quỹ đạo]
    Gọi $r$ là bán kính đường tròn giao tuyến, ta có hệ thức Pitago cho khối nón/cầu cắt:
    $ R^2 = h^2 + r^2 \\implies r = \\sqrt{R^2 - h^2} = \\sqrt{12 - 3} = \\sqrt{9} = 3 \\text{ (m)}. $

    #step[Độ dài quỹ đạo]
    Chu vi của đường tròn quỹ đạo chính là quãng đường phun sơn:
    $ L = 2\\pi r = 2\\pi(3) = 6\\pi \\text{ (m)}. $
    
    #nhanxet[
      Bài toán chỉ gồm 3 phép tính, nhưng học sinh sẽ "khóc thét" nếu không nhận ra quỹ đạo tròn là giao tuyến của Cầu và Phẳng. Các bài toán thực tế 2026 sẽ không hỏi "Cho mặt cầu (S) và (P), tìm giao tuyến", mà sẽ giấu nó vào cánh tay robot, cần cẩu, hoặc radar.
    ]
  ],
)

== Bài VDC 2 — Robot Đầu Gắp Mềm Đa Biên (Quỹ Đạo Elip)

#tln(
  [Tại trung tâm lắp ráp, một robot đầu gắp mềm được neo bằng hệ thống dây cáp cường lực tại 2 điểm $A(-3;0;2)$ và $B(3;0;2)$ trong không gian Oxyz. Đầu gắp $M$ của robot luôn di chuyển mượt mà trên mặt bàn lắp ráp có phương trình $z=2$. Cơ cấu dây cáp nội bộ được thiết kế đặc biệt sao cho tổng chiều dài cáp căng từ 2 chốt đến đầu gắp luôn là $M A + M B = 10$ m. Tính diện tích lớn nhất khu vực an toàn mà đầu gắp có thể làm việc (diện tích quỹ đạo bao khép kín).],
  [$20\\pi$],
  fig: align(center)[
    #cetz.canvas(length: 0.82cm, {
      import cetz.draw: *
      let o = (0, 0)
      let x = (5.6, 0)
      let y = (-2.0, -1.7)
      let z = (0, 4.7)
      let a = (0.9, 1.6)
      let b = (5.1, 1.6)
      let m = (4.0, 2.45)
      let ell = ((1.3, 1.6), (1.9, 2.35), (3.0, 2.8), (4.2, 2.45), (4.7, 1.6), (4.2, 0.75), (3.0, 0.35), (1.9, 0.8))

      line(o, x, mark: (end: "stealth", fill: black), stroke: 1pt)
      line(o, y, mark: (end: "stealth", fill: black), stroke: 1pt)
      line(o, z, mark: (end: "stealth", fill: black), stroke: 1pt)

      line(
        (0.4, 0.4),
        (5.4, 0.95),
        (4.8, 2.9),
        (-0.2, 2.35),
        close: true,
        fill: rgb("F5FBFF").transparentize(10%),
        stroke: 1pt + rgb("7FB3D5"),
      )
      
      // Smooth the ellipse using bezier or just curved lines
      catmull(..ell, close: true, stroke: (paint: rgb("1F618D"), thickness: 1.5pt))
      
      line(a, b, stroke: (paint: rgb("C0392B"), thickness: 1pt, dash: "dashed"))
      line(a, m, stroke: (paint: rgb("E67E22"), thickness: 1.2pt))
      line(b, m, stroke: (paint: rgb("E67E22"), thickness: 1.2pt))

      circle(o, radius: 2.5pt, fill: black)
      circle(a, radius: 3pt, fill: rgb("C0392B"))
      circle(b, radius: 3pt, fill: rgb("C0392B"))
      circle(m, radius: 3pt, fill: rgb("1F618D"))

      content(o, $O$, anchor: "south-west", padding: 4pt)
      content(x, $x$, anchor: "south", padding: 3pt)
      content(y, $y$, anchor: "north-east", padding: 3pt)
      content(z, $z$, anchor: "west", padding: 3pt)
      content(a, $A$, anchor: "west", padding: 4pt)
      content(b, $B$, anchor: "east", padding: 4pt)
      content(m, $M$, anchor: "south", padding: 4pt)
      content((4.5, 2.95), [$z = 2$], anchor: "south-west", padding: 2pt)
      content((2.95, 3.1), [*Quỹ đạo Elip*], anchor: "south", padding: 2pt)
    })
  ],
  fig-pos: "center",
  fig-width: 56%,
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Ánh Xạ Elip Từ Oxyz Trở Về Mặt Phẳng])[
      Đây là bài toán đánh lừa tâm lý cực mạnh! Nhìn Oxyz nhưng thực chất là Oxy phẳng.
      - $z=2$ là mặt phẳng song song trục $Oxy$. $A$ và $B$ đều có cao độ $z=2$, nghĩa là dây cáp chuyển động 100% trong mặt phẳng phẳng.
      - Định nghĩa chuẩn: Tập hợp điểm $M$ thỏa mãn $M A + M B = 2a > A B$ trong một mặt phẳng chính là đường Elip. Đề thi 2026 chắc chắn sẽ đem Elip quay trở lại dưới hình hài thực tế!
    ]

    #step[Định vị tiêu cự và trục lớn]
    Trong mặt phẳng $z=2$, khoảng cách giữa hai mỏ neo $A(-3;0;2)$ và $B(3;0;2)$ là:
    $ A B = \\sqrt{(3 - (-3))^2 + 0 + 0} = 6. $
    Khoảng cách hai tiêu điểm là $2c = 6 \\implies c = 3$.

    Độ dài đoạn dây cáp không đổi là trục lớn $2a$:
    $ M A + M B = 10 \\implies 2a = 10 \\implies a = 5. $

    #step[Tính bán trục nhỏ và diện tích]
    Mối quan hệ thần thánh của Elip: $a^2 = b^2 + c^2$
    $ b^2 = a^2 - c^2 = 5^2 - 3^2 = 25 - 9 = 16 \\implies b = 4. $
    
    Diện tích vùng làm việc khép kín của Elip:
    $ S = \\pi a b = \\pi \\cdot 5 \\cdot 4 = 20\\pi \\text{ (m}^2\\text{)}. $

    #meo[
      Dấu hiệu ăn điểm 10: Nếu bài Oxyz cho tập hợp tổng khoảng cách $MA+MB=k$, hãy ngay lập tức kiểm tra xem A, B và mặt phẳng thao tác có đồng phẳng không. Nếu có, nó là Elip. Nếu không, nó là mặt Ellipsoid tròn xoay (chương trình đại học không thi). Đề thi THPT luôn bóp về mặt phẳng!
    ]
  ],
)

= Bài Luyện Thêm Đỉnh Cao Tốc Độ

#lythuyet[
  Luyện tập tốc độ 1 phút / bài với tư duy Đại Bác Vạn Năng.
]

#tln(
  [Một robot dỡ hàng có $A B = 10$ m, $B C = 2$ m, $C D = 4$ m, $A D = 8$ m. Hỏi diện tích lớn nhất của tam giác $A B D$ bằng bao nhiêu mét vuông khi robot đổi tư thế?],
  [24],
  fig: align(center)[
    #cetz.canvas(length: 0.82cm, {
      import cetz.draw: *
      let a = (0, 0)
      let d = (7, 0)
      let b = (2.25, 4.9)
      let c = (4.6, 4.1)

      line((-1, 0), (8, 0), stroke: 1.5pt)
      line(a, b, stroke: 1.5pt + blue)
      line(b, c, stroke: 1.5pt + red)
      line(c, d, stroke: 1.5pt + blue)

      for pt in (a, b, c, d) { circle(pt, radius: 2.5pt, fill: black) }

      content((-0.1, 0.35), $A$)
      content((2.2, 5.25), $B$)
      content((4.7, 4.45), $C$)
      content((7.0, 0.35), $D$)
      content((0.95, 2.55), [$10$])
      content((3.45, 4.8), [$2$])
      content((5.85, 2.2), [$4$])
    })
  ],
  fig-pos: "center",
  fig-width: 58%,
  loigiai: [
    #step[Biến đổi mục tiêu]
    $S_{A B D} = \\frac{1}{2} A D \\cdot h_B$. Vì $A D = 8$ cố định, $S_{A B D}$ max khi $h_B$ max. (Quay về bài toán tối ưu khớp B).
    
    #step[Ép biên biến số $B D$]
    Từ cụm $B C D$: $ |4-2| \\le B D \\le 4+2 \\implies 2 \\le B D \\le 6 $.
    
    #step[Đánh giá định lý cosin]
    $\\cos \\angle B A D = \\frac{10^2 + 8^2 - B D^2}{2 \\cdot 10 \\cdot 8}$. $h_B$ Max $\\implies \\sin A$ Max $\\implies \\cos A$ Min $\\implies B D$ Max $= 6$.
    Khi đó $\\cos A = \\frac{164 - 36}{160} = \\frac{128}{160} = \\frac{4}{5} \\implies \\sin A = \\frac{3}{5}$.
    Vậy $h_B = 10 \\cdot \\frac{3}{5} = 6$.
    $S_{max} = \\frac{1}{2} \\cdot 8 \\cdot 6 = 24$.
  ],
)

#tln(
  [Khớp cố định $A(4;0;5)$. Đầu gắp $M$ dài 3m nằm hoàn toàn trong mặt rãnh trượt $x=4$. Tính khoảng cách ngắn nhất từ M đến gốc $O$.],
  [$2\\sqrt{5}$],
  loigiai: [
    #ppgiai(title: [Note Idea Giải: Tách Hình Chiếu Phẳng])[
      Khoảng cách ngắn nhất từ 1 điểm đến 1 quỹ đạo vòng tròn trên 1 mặt phẳng khác: Chiếu vuông góc điểm đó lên mặt phẳng, sau đó giải quyết ngay trên mặt phẳng 2D.
    ]
    - Hình chiếu $O(0;0;0)$ lên $x=4$ là $H(4;0;0)$. Có $OH = 4$.
    - Trong mặt phẳng $x=4$: $M$ thuộc đường tròn tâm $A(4;0;5)$, bán kính $R=3$.
    - Tâm $A$ cách $H$ một khoảng $AH = \\sqrt{(4-4)^2 + 0 + (5-0)^2} = 5$.
    - Khoảng cách ngắn nhất từ H đến quỹ đạo đường tròn: $HM_{min} = AH - R = 5 - 3 = 2$.
    - Chốt hạ không gian: $OM_{min} = \\sqrt{OH^2 + HM_{min}^2} = \\sqrt{4^2 + 2^2} = \\sqrt{20} = 2\\sqrt{5}$.
  ]
)

= Lời Kết

#lythuyet[
  Các chuyên đề vận dụng cao (VDC) trong tương lai sẽ không còn đánh đố bằng biến đổi đại số cồng kềnh, mà tập trung vào **Khả năng tư duy mô hình hóa (Mathematical Modeling)**. 
  "Toán học không chỉ nằm trên mặt giấy, toán học vận hành cả cỗ máy ngoài đời thực". Nắm vững bộ tư duy **Khung Đại Bác Vạn Năng**, các em hoàn toàn có thể tự tin chinh phục những câu 9+ khó nhằn nhất trong kỳ thi THPT Quốc Gia sắp tới.
]
"""

with open('/Users/admin/conictypst/typst/exams/Cánh-Tay-Robot.typ', 'w') as f:
    f.write(CONTENT)
