#import "@preview/cetz:0.5.2": canvas, draw
#import "_config.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ HỆ THỐNG PHONG CÁCH ĐẠI BÁC
// ═══════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (x: 1.5cm, top: 2.2cm, bottom: 2.2cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8.5pt, fill: rgb("#546E7A"), style: "italic")[Tư Duy Đại Bác Diệt Ruồi — Tập 1: Hàm Số]
        ],
        align(right)[
          #text(size: 8.5pt, fill: rgb("#0D47A1"), weight: "bold")[Chương 1: Hàm Số — Ngôn Ngữ Của Sự Thay Đổi]
        ]
      )
      v(3pt)
      line(length: 100%, stroke: 0.5pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let page-num = counter(page).get().first()
    if page-num > 1 {
      text(size: 9pt, fill: rgb("#546E7A"))[Trang #counter(page).display()]
    }
  })
)
#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.9em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: it => context {
  if in-tfrac.get() {
    math.inline(it)
  } else {
    math.display(it)
  }
}

// ─── Bảng màu chủ đạo của bộ sách ──────────────────────────────
#let c-dark-blue = rgb("#0D1B2A")
#let c-royal-blue = rgb("#1B263B")
#let c-indigo = rgb("#415A77")
#let c-gold = rgb("#D4AF37")
#let c-red = rgb("#A01A1A")
#let c-teal = rgb("#005F73")
#let c-green = rgb("#1B4332")
#let c-grey = rgb("#F4F6F7")

// ─── Hộp giao diện nội dung ───────────────────────────────────
#let section-box(title, subtitle, body) = block(
  width: 100%,
  fill: gradient.linear(c-dark-blue, c-royal-blue, angle: 145deg),
  inset: (x: 24pt, y: 22pt),
  radius: 12pt,
  clip: true,
)[
  #align(center)[
    #text(fill: c-gold, size: 10pt, weight: "bold", tracking: 3pt)[TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 1] \
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[#title] \
    #v(0.4em)
    #text(fill: rgb("#E0E1DD"), size: 12pt, style: "italic")[#subtitle]
  ]
]

#let philosophy-box(title: "⚖️ Mở Đầu Triết Học (Why)", body) = block(
  fill: rgb("#F7F9FA"),
  stroke: (left: 4pt + c-indigo),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: c-royal-blue, weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let visual-box(title: "👁️ Trực Giác Hình Học & Khái Niệm", body) = block(
  fill: rgb("#EAF4F4"),
  stroke: (left: 4pt + c-teal),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let structure-box(title: "🔑 Cấu Trúc Cốt Lõi (Core Structure)", body) = block(
  fill: rgb("#FDF5E6"),
  stroke: (left: 4pt + rgb("#B25E00")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#B25E00"), weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let technique-box(title: "⚙️ Phát Triển Kỹ Thuật (Technique)", body) = block(
  fill: rgb("#F3EFF5"),
  stroke: (left: 4pt + rgb("#5E35B1")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#5E35B1"), weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let meta-box(title: "🧠 Siêu Tư Duy (Meta-Thinking)", body) = block(
  fill: rgb("#EBF5FB"),
  stroke: (left: 4pt + rgb("#21618C")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#21618C"), weight: "bold", size: 11pt)[#title]
  #v(0.4em)
  #body
]

#let link-box(body) = block(
  fill: rgb("#FCF3CF"),
  stroke: 0.5pt + rgb("#F4D03F"),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)[
  #text(fill: rgb("#7D6608"), size: 9.5pt, weight: "bold")[🔗 Ý tưởng này còn xuất hiện ở đâu?]
  #v(0.2em)
  #text(size: 9.5pt, style: "italic")[#body]
]

#let explain-box(n, title, body) = block(
  fill: white,
  stroke: 0.6pt + rgb("#CFD8DC"),
  inset: 18pt,
  radius: 8pt,
  width: 100%,
)[
  #text(fill: c-red, weight: "bold", size: 11.5pt)[🔥 Ví dụ minh họa #n: #title]
  #v(0.6em)
  #body
]

// ═══════════════════════════════════════════════
// NỘI DUNG CHƯƠNG 1
// ═══════════════════════════════════════════════

#section-box(
  [Chương 1: Hàm Số — Ngôn Ngữ Của Sự Thay Đổi],
  [Bản chất: Đạo hàm là chiếc kính hiển vi đo lường biến thiên cục bộ thiết lập hành vi toàn cục],
  []
)

#v(1.5em)

#philosophy-box[
  == 1. Sự tiến hóa của tư duy liên tục và cuộc vượt thoát khỏi nghịch lý tĩnh
  
  Hãy bắt đầu bằng một thực tế hiển nhiên nhưng chứa đựng vẻ đẹp sâu xa nhất của vũ trụ: *Thế giới của chúng ta không bao giờ đứng yên.* Gió thổi rì rào qua lá cây, dòng nước cuộn chảy dưới chân cầu, các hành tinh quay quanh mặt trời theo quỹ đạo cong vút, và giá trị cổ phiếu biến động từng giây trên thị trường. Tất cả đều là những dòng chảy biến thiên liên tục.
  Tuy nhiên, bộ não con người, vốn được rèn luyện qua hàng triệu năm tiến hóa để đếm các vật thể rời rạc (như 3 con thú săn được, 5 quả táo nhặt được), lại gặp một rào cản nhận thức khổng lồ khi đối diện với sự liên tục trôi chảy đó. Để chụp lại dòng chảy này bằng ngôn ngữ toán học, nhân loại đã phải trải qua ba cuộc khủng hoảng tư duy lớn kéo dài hơn hai ngàn năm.
  
  *Nghịch lý Zeno — Sự bất lực của toán học tĩnh:*
  Khoảng thế kỷ 5 trước Công nguyên, triết gia Zeno xứ Elea đã đưa ra những nghịch lý kinh điển thách thức thế giới quan thông thường. Nổi tiếng nhất là *Nghịch lý mũi tên đang bay*. Zeno lập luận:
  Tại bất kỳ một "khoảnh khắc tức thời" nào đó của thời gian, mũi tên bắt buộc phải chiếm một không gian bằng đúng kích thước của nó. Nghĩa là, trong khoảnh khắc đó, mũi tên đứng yên tại một vị trí cố định duy nhất trong không gian (vì nếu nó di chuyển trong khoảnh khắc đó, khoảnh khắc đó sẽ có một khoảng thời gian dài hơn 0, tức là nó không còn là tức thời nữa). Nếu mũi tên hoàn toàn đứng yên tại mọi khoảnh khắc đơn lẻ, và thời gian chỉ là tổng hợp của các khoảnh khắc tức thời tĩnh lặng đó, thì làm sao mũi tên có thể bay đi?
  
  Về mặt toán học, Zeno đã chỉ ra điểm sụp đổ của một phép toán cơ bản. Vận tốc trung bình được tính bằng tỷ số:
  $ v = frac(Delta s, Delta t) $
  Khi ta muốn đo vận tốc tức thời tại đúng một điểm (một thời điểm duy nhất), khoảng thời gian $Delta t$ co lại bằng đúng $0$, kéo theo khoảng cách đi được $Delta s$ cũng bằng $0$. Phép chia sụp đổ hoàn toàn thành phép toán vô nghĩa $0/0$. Giải tích ra đời từ nhu cầu khẩn thiết phải giải bài toán $0/0$ này để định nghĩa "vận tốc tức thời".
  
  *Cuộc khủng hoảng Vô cùng bé — Những bóng ma của Newton và Leibniz:*
  Để giải quyết bế tắc, vào thế kỷ 17, Isaac Newton (Anh) và Gottfried Leibniz (Đức) độc lập phát minh ra phép tính vi phân.
  - Newton xuất phát từ nhu cầu vật lý: mô tả chuyển động của các thiên thể trong vũ trụ. Ông coi các đại lượng là các "dòng chảy liên tục" (fluxions).
  - Leibniz tiếp cận dưới góc nhìn hình học: tìm tiếp tuyến của một đường cong bất kỳ. Ông nghĩ ra ký hiệu vi phân $d y / d x$ tuyệt đẹp — mô phỏng tỷ số biến thiên khi khoảng chia co lại vô cùng bé.
  
  Tuy nhiên, họ đã sử dụng một công cụ đầy mơ hồ: các số "vô cùng bé" (đại lượng lớn hơn 0 nhưng nhỏ hơn mọi số thực dương). Triết gia George Berkeley đã công kích dữ dội các nhà giải tích trong cuốn sách *The Analyst (1734)*. Ông lập luận rằng các nhà toán học lúc thì coi $d x$ khác không để chia, lúc lại coi nó bằng không để triệt tiêu nó khỏi phương trình. Ông mỉa mai gọi chúng là:
  > *"Những bóng ma của các đại lượng đã mất" (Ghosts of departed quantities).*
  
  *Sự cứu rỗi của Cauchy và Weierstrass — Định nghĩa giới hạn:*
  Cuộc tranh cãi triết học này chỉ được dập tắt hoàn toàn vào thế kỷ 19 nhờ Augustin-Louis Cauchy và Karl Weierstrass khi họ định nghĩa khái niệm *Giới hạn (Limit)*.
  Ta không tính tốc độ tại điểm có khoảng thời gian bằng đúng 0. Ta tính tốc độ trung bình trên một khoảng thời gian ngắn $h$ (với $h != 0$), rồi quan sát xem tỉ số này tiến sát về con số cố định nào khi cho $h$ tiến sát về 0 ($h arrow.r 0$). Đạo hàm không phải là phép chia tĩnh $0/0$, mà là giới hạn của một quá trình động học.
]

#v(1.2em)

#visual-box[
  == 2. Nguyên lý Tuyến tính hóa Cục bộ (Local Linearization)
  
  Để thấu hiểu sâu sắc bản chất của đạo hàm, hãy quên đi các ký hiệu đại số khô khan. Hãy tưởng tượng bạn đang cầm một chiếc kính hiển vi siêu việt có độ phóng đại vô hạn.
  
  *1. Nguyên lý phẳng hóa vi mô:*
  Hãy vẽ một đường cong cong mềm mại bất kỳ trên giấy. Phóng to xung quanh một điểm $P$ trên đồ thị lên hàng triệu lần:
  - Ban đầu, bạn thấy nó hơi cong.
  - Phóng to thêm nữa, nó trông phẳng dần.
  - Phóng to lên vô hạn lần, phần đường cong nằm trong thị kính trông hoàn toàn là một đường thẳng tắp!
  
  Hiện tượng kỳ diệu này được gọi là *sự khả vi (differentiability)*. Mọi đường cong mịn màng, khi nhìn ở góc độ vi mô, thực chất là một đường thẳng. Đường thẳng vi mô đó chính là *Tiếp tuyến (Tangent line)*, và độ dốc (hệ số góc) của nó chính là *Đạo hàm (Derivative)* của hàm số tại điểm đó. Đạo hàm chính là chiếc kính hiển vi cho ta biết độ dốc cục bộ của đường cong tại điểm siêu nhỏ đó.
  
  #v(0.5em)
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-1.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      line((0, -1.0), (0, 2.5), mark: (end: ">"), stroke: 0.5pt + gray)
      
      let pts = ()
      for i in range(21) {
        let x = -1.2 + i * 0.12
        let y = 0.5 * (x + 0.2) * (x + 0.2) + 0.3 * x + 0.5
        pts.push((x, y))
      }
      line(..pts, stroke: 1.5pt + c-indigo)
      content((1.2, 1.8), [$y = f(x)$], fill: white)
      
      let px = 0.5
      let py = 0.5 * (px + 0.2) * (px + 0.2) + 0.3 * px + 0.5
      circle((px, py), radius: 2.2pt, fill: c-red)
      content((px + 0.3, py - 0.2), [$P$])
      
      circle((px, py), radius: 0.8, stroke: (paint: c-teal, thickness: 1.5pt))
      line((px + 0.5, py - 0.5), (px + 1.2, py - 1.2), stroke: 2pt + c-teal)
      
      rect((1.8, -0.9), (3.8, 1.1), fill: rgb("#EAF4F4"), stroke: 1.1pt + c-teal, radius: 4pt)
      line((2.0, -0.6), (3.6, 0.8), stroke: 2pt + c-red)
      circle((2.8, 0.1), radius: 3pt, fill: c-red)
      content((2.8, 0.5), [Tuyến tính hóa])
    })
  ]
  #align(center)[*Hình 1: Nguyên lý Tuyến tính hóa Cục bộ*]

  *2. Trực giác Lockhart: Tại sao đạo hàm diện tích hình tròn lại là chu vi?*
  Hãy áp dụng trực giác tuyến tính hóa này để giải thích một hiện tượng hình học kỳ lạ:
  - Diện tích hình tròn bán kính $r$ là $S = pi r^2$. Đạo hàm của diện tích theo bán kính là:
    $ frac(d S, d r) = 2 pi r  quad text( (chính là Chu vi hình tròn!) $
  - Thể tích hình cầu bán kính $r$ là $V = frac(4, 3) pi r^3$. Đạo hàm của thể tích theo bán kính là:
    $ frac(d V, d r) = 4 pi r^2  quad text( (chính là Diện tích bề mặt hình cầu!) $
  
  *Giải nghĩa bằng trực giác hình học:*
  Khi bán kính hình cầu tăng thêm một lượng cực nhỏ $d r$, thể tích hình cầu tăng thêm một lượng $d V$. Phần thể tích tăng thêm này thực chất là một "lớp vỏ cầu mỏng" bọc bên ngoài quả bóng cũ.
  Vì lớp vỏ này vô cùng mỏng ($d r$ rất nhỏ), ta có thể tưởng tượng việc cắt lớp vỏ này ra và "trải phẳng" nó ra thành một tấm phẳng. Diện tích đáy của tấm phẳng chính là diện tích bề mặt của hình cầu cũ: $4 pi r^2$, và chiều cao (độ dày) của tấm phẳng chính là $d r$.
  Do đó, thể tích của lớp vỏ tăng thêm là:
  $ d V approx 4 pi r^2 dot.c d r $
  Chia cả hai vế cho $d r$ và lấy giới hạn khi $d r arrow.r 0$:
  $ frac(d V, d r) = 4 pi r^2 $
  Độ tăng trưởng của thể tích theo bán kính chính là diện tích bề mặt! Tương tự, với hình tròn diện tích $S = pi r^2$, khi bán kính tăng thêm $d r$, diện tích tăng thêm là một sợi dây mỏng có chiều dài bằng đúng chu vi $2 pi r$ và độ dày $d r$:
  $ d S approx 2 pi r dot.c d r => frac(d S, d r) = 2 pi r $
  Đây là một sự tất yếu hình học tuyệt đẹp khi ta nhìn thế giới qua lăng kính tuyến tính hóa cục bộ.

  *3. Ranh giới của sự không khả vi — Điểm gãy và Quái vật Weierstrass:*
  Tuy nhiên, không phải mọi đường cong đều mịn màng khi phóng to.
  - Xét hàm số $y = |x|$ tại gốc tọa độ $x=0$. Cho dù bạn phóng to góc nhọn này lên hàng tỷ lần dưới kính hiển vi, nó vẫn giữ nguyên một góc nhọn $90^degree$ chứ không bao giờ phẳng ra. Nó không có tiếp tuyến duy nhất, và do đó không khả vi tại đây.
  - Năm 1872, nhà toán học Karl Weierstrass công bố một hàm số liên tục khắp nơi nhưng không khả vi tại bất kỳ điểm nào (hàm Weierstrass):
    $ f(x) = sum_(n=0)^(oo) a^n cos(b^n pi x) $
    Đồ thị của hàm số này giống như một đường bờ biển fractal vô hạn. Càng phóng to, ta lại càng thấy những đỉnh nhọn mới xuất hiện liên tục không bao giờ ngừng. Nó là một cấu trúc cong không bao giờ có thể tuyến tính hóa được!

  #v(0.8em)
  *4. Cát tuyến hội tụ về Tiếp tuyến:*
  Để đo độ dốc tiếp tuyến tại điểm cố định $A(x_0, f(x_0))$, ta lấy một điểm di động $B(x_0 + h, f(x_0 + h))$. Cát tuyến nối $A$ và $B$ biểu thị tốc độ thay đổi trung bình. Khi cho khoảng cách $h$ co dần về 0, điểm $B$ trượt dọc theo đồ thị tiến sát về $A$, cát tuyến quay dần và đạt giới hạn là tiếp tuyến nằm ngang hoặc nghiêng tại điểm $A$.
  
  #v(0.5em)
  #align(center)[
    #canvas(length: 1.1cm, {
      import draw: *
      line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt + gray)
      content((4.5, -0.3), [$x$])
      content((0.3, 3.5), [$y$])
      
      let f(x) = -0.08 * x * x + 0.6 * x + 0.5
      
      let pts = ()
      for i in range(21) {
        let x = 0.2 + i * 0.18
        pts.push((x, f(x)))
      }
      line(..pts, stroke: 1.5pt + c-indigo)
      content((3.8, f(3.8) + 0.35), [$y = f(x)$])
      
      let ax = 1.0
      let ay = f(ax)
      let bx1 = 3.5
      let by1 = f(bx1)
      let bx2 = 2.2
      let by2 = f(bx2)
      
      circle((ax, ay), radius: 2.2pt, fill: c-red)
      content((ax - 0.25, ay + 0.25), [$A$])
      
      circle((bx1, by1), radius: 2.2pt, fill: c-royal-blue)
      content((bx1 + 0.3, by1 + 0.1), [$B_1$])
      line((ax - 0.4, ay - 0.4 * (by1 - ay)/(bx1 - ax)), (bx1 + 0.4, by1 + 0.4 * (by1 - ay)/(bx1 - ax)), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
      
      circle((bx2, by2), radius: 2.2pt, fill: c-teal)
      content((bx2 + 0.25, by2 + 0.25), [$B_2$])
      line((ax - 0.4, ay - 0.4 * (by2 - ay)/(bx2 - ax)), (bx2 + 0.4, by2 + 0.4 * (by2 - ay)/(bx2 - ax)), stroke: (paint: c-teal.lighten(30%), thickness: 0.8pt, dash: "dashed"))
      
      let slope = -0.16 * 1.0 + 0.6
      line((ax - 0.6, ay - 0.6 * slope), (ax + 2.5, ay + 2.5 * slope), stroke: 1.5pt + c-red)
      content((ax + 2.0, ay + 2.0 * slope - 0.35), [Tiếp tuyến tại $A$], fill: white)
      
      arc((ax + 1.2, ay + 1.2 * slope), start: 15deg, stop: 38deg, radius: 1.8, stroke: 1.2pt + c-teal, mark: (end: ">"))
    })
  ]
  #align(center)[*Hình 2: Cát tuyến tiến về tiếp tuyến khi khoảng cách h tiến tới 0*]
]

#v(0.6em)
#link-box[
  Trực giác phóng to vô hạn để thấy sự bằng phẳng là xương sống của *Hình học Vi phân (Differential Geometry)* và *Thuyết tương đối rộng của Einstein*. Không gian vũ trụ bốn chiều của chúng ta bị bẻ cong bởi khối lượng vật chất, nhưng vì kích thước con người quá nhỏ bé, ta nhìn xung quanh vẫn thấy không gian phẳng (Mặt phẳng Euclid). Một đa tạp vi phân (Differential Manifold) thực chất là một cấu trúc cong phức tạp được dán ghép từ vô vàn các mảnh phẳng tiếp diện cục bộ.
]

#pagebreak()

#structure-box[
  == 3. Cầu nối logic giữa Cục bộ và Toàn cục
  
  Toàn bộ Giải tích lớp 12 thực chất chỉ xoay quanh một trục tư duy duy nhất:
  
  #align(center)[
    #text(fill: c-red, weight: "bold", size: 12pt)[BIẾN THIÊN CỤC BỘ (LOCAL CHANGE) $arrow.r$ HÀNH VI TOÀN CỤC (GLOBAL BEHAVIOR)]
  ]

  Làm thế nào để một thông tin vi mô (đại diện bởi đạo hàm — độ dốc tiếp tuyến tại từng điểm lẻ loi) có thể quyết định hình dáng của cả đồ thị trên một khoảng rộng lớn (toàn cục)? Cây cầu toán học chặt chẽ nhất liên kết hai thế giới này chính là *Định lý Giá trị Trung bình (Mean Value Theorem - Định lý Lagrange)*.

  *1. Từ Định lý Rolle đến Định lý Lagrange:*
  - *Định lý Rolle:* Nếu một hàm số liên tục và khả vi $f(x)$ xuất phát và kết thúc ở cùng một độ cao trên đoạn $[a, b]$ ($f(a) = f(b)$), thì trên đường đi của nó, nó bắt buộc phải quay đầu ít nhất một lần để trở lại độ cao ban đầu. Tại điểm quay đầu $c$ đó ($a < c < b$), tiếp tuyến của đồ thị song song hoàn hảo với trục hoành, tức là đạo hàm bằng 0: $f'(c) = 0$.
  - *Định lý Lagrange (Rolle bị xoay nghiêng):* Nếu ta nghiêng hệ tọa độ sao cho điểm đầu $A(a, f(a))$ và điểm cuối $B(b, f(b))$ lệch nhau về độ cao (cát tuyến $A B$ có độ dốc khác 0), thì trên cung cong $A B$ luôn tồn tại ít nhất một điểm trung gian $C(c, f(c))$ mà tiếp tuyến tại đó song song với cát tuyến $A B$.
    $ f'(c) = frac(f(b) - f(a), b - a) $
    Nói cách khác: Vận tốc tức thời tại thời điểm $c$ đúng bằng vận tốc trung bình trên cả chặng đường.

  #v(0.5em)
  #align(center)[
    #canvas(length: 1.1cm, {
      import draw: *
      line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.5pt + gray)
      line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.5pt + gray)
      
      let f(x) = 0.8 + 1.2 * calc.sin(x * 0.8)
      
      let pts = ()
      for i in range(21) {
        let x = 0.4 + i * 0.17
        pts.push((x, f(x)))
      }
      line(..pts, stroke: 1.5pt + c-indigo)
      
      let x1 = 0.8
      let y1 = f(x1)
      let x2 = 3.6
      let y2 = f(x2)
      
      circle((x1, y1), radius: 2pt, fill: c-royal-blue)
      content((x1 - 0.25, y1 + 0.25), [$A$])
      circle((x2, y2), radius: 2pt, fill: c-royal-blue)
      content((x2 + 0.25, y2 + 0.2), [$B$])
      
      line((x1, y1), (x2, y2), stroke: (paint: c-red, thickness: 1pt, dash: "dashed"))
      
      let slope = (y2 - y1) / (x2 - x1)
      let cx = 1.98
      let cy = f(cx)
      circle((cx, cy), radius: 2.2pt, fill: c-teal)
      content((cx, cy + 0.35), [$C(c, f(c))$])
      
      line((cx - 1.0, cy - 1.0 * slope), (cx + 1.0, cy + 1.0 * slope), stroke: 1.5pt + c-teal)
      
      line((x1, 0), (x1, y1), stroke: (paint: gray, thickness: 0.5pt, dash: "dotted"))
      content((x1, -0.3), [$a$])
      line((x2, 0), (x2, y2), stroke: (paint: gray, thickness: 0.5pt, dash: "dotted"))
      content((x2, -0.3), [$b$])
      line((cx, 0), (cx, cy), stroke: (paint: gray, thickness: 0.5pt, dash: "dotted"))
      content((cx, -0.3), [$c$])
    })
  ]
  #align(center)[*Hình 3: Minh họa Định lý Lagrange — Tiếp tuyến song song cát tuyến*]

  *2. Lipschitz Continuity — Bộ phanh giới hạn tốc độ:*
  Một hệ quả tuyệt đẹp của định lý Lagrange là khái niệm liên tục Lipschitz. Nếu một hàm số có đạo hàm bị chặn trên một miền (tức là tốc độ thay đổi tức thời không bao giờ vượt quá một giới hạn trần $L$: $|f'(x)| <= L$), thì sự thay đổi toàn cục của hàm số giữa hai điểm bất kỳ luôn bị khống chế bởi khoảng cách giữa chúng:
  $ |f(x) - f(y)| <= L |x - y| $
  Trong kỹ thuật điều khiển và vật lý, điều này đảm bảo rằng một hệ thống sẽ không bị bùng nổ mất kiểm soát khi đầu vào chỉ dao động nhẹ.
]

#v(0.6em)
#link-box[
  Định lý điểm quay đầu Rolle chính là nguồn gốc của *Định lý điểm cố định Brouwer* trong Tô-pô học. Nó khẳng định: nếu bạn khuấy một tách cà phê một cách liên tục, sau khi chất lỏng đứng yên, luôn có ít nhất một điểm trên bề mặt chất lỏng quay trở lại đúng vị trí ban đầu của nó.
  Ý tưởng đạo hàm bằng 0 tại các điểm cực biên này cũng tương đương với *Định lý quả bóng lông (Hairy Ball Theorem)*: Bạn không thể chải mượt một quả bóng lông mà không tạo ra ít nhất một điểm xoáy (đạo hàm bằng 0 hoặc không xác định). Đây là những hằng số cấu trúc của không gian hình học!
]

#v(1.2em)

#technique-box[
  == 4. Thiết lập định nghĩa kỹ thuật từ nhu cầu tự nhiên
  
  *1. Trò chơi Thách đấu $epsilon-delta$: Nghệ thuật kiểm soát sai số chủ động*
  
  Hầu hết học sinh phổ thông đều xem định nghĩa giới hạn bằng ký hiệu $epsilon$ và $delta$ là một nỗi ám ảnh. Định nghĩa hàn lâm viết rằng: 
  $ lim_(x -> x_0) f(x) = L <=> forall epsilon > 0, exists delta > 0: 0 < |x - x_0| < delta => |f(x) - L| < epsilon $
  Nhưng nếu bóc tách lớp vỏ bọc ký hiệu, bản chất của giới hạn không phải là một phép toán tĩnh, mà là một *trò chơi tương tác thách đấu* nhằm kiểm soát sai số giữa đầu vào và đầu ra. Hãy tưởng tượng trò chơi diễn ra giữa hai nhân vật: *Challenger (Người thách đấu - chọn $epsilon$)* và *Defender (Người đáp trả - tìm $delta$)*.
  
  - *Luật chơi:* 
    1. Challenger chọn một mức sai số cho phép $epsilon > 0$ cực kỳ nhỏ và thách thức: _"Tôi muốn đầu ra $f(x)$ phải nằm sát sạt mục tiêu $L$ với khoảng cách bé hơn $epsilon$ (tức là $|f(x) - L| < epsilon$)."_
    2. Defender phải tìm ra một khoảng cách an toàn $delta > 0$ quanh điểm $x_0$ (tức là $0 < |x - x_0| < delta$) sao cho, chỉ cần Challenger chọn bất kỳ đầu vào $x$ nào trong khoảng này (ngoại trừ chính $x_0$), đầu ra $f(x)$ tương ứng chắc chắn sẽ thỏa mãn yêu cầu của Challenger.
    3. Nếu với *mọi* giá trị $epsilon > 0$ nhỏ bao nhiêu do Challenger đưa ra, Defender *luôn luôn* tìm được chiến thuật $delta > 0$ tương ứng để bảo vệ mục tiêu, thì Defender thắng cuộc. Khi đó, ta khẳng định giới hạn của $f(x)$ khi $x -> x_0$ là $L$.
    
  - *Ví dụ thực tế trò chơi: Chứng minh $lim_(x -> 3) (2x + 1) = 7$*
    - *Lượt 1:* Challenger ra chiêu: _"Tôi muốn đầu ra cách 7 một khoảng nhỏ hơn $epsilon = 0.02$."_ 
      Defender phân tích: Ta cần $|(2x + 1) - 7| < 0.02 <=> |2x - 6| < 0.02 <=> 2|x - 3| < 0.02 <=> |x - 3| < 0.01$. 
      Defender lập tức đáp trả: _"Dễ thôi, tôi chọn khoảng an toàn đầu vào là $delta = 0.01$. Bạn chọn bất cứ $x$ nào lệch khỏi 3 ít hơn 0.01 đi!"_
      Challenger chọn thử $x = 3.008$ (lệch $0.008 < 0.01$). Đầu ra là $f(3.008) = 2(3.008) + 1 = 7.016$, lệch khỏi 7 đúng $0.016 < 0.02$. Challenger tâm phục khẩu phục.
    - *Lượt tổng quát:* Challenger ra chiêu bất kỳ với $epsilon$ bất kỳ.
      Defender nhìn ra quy luật cấu trúc: Chỉ cần chọn khoảng an toàn đầu vào là $delta = epsilon / 2$. Khi đó, với mọi $x$ thỏa mãn $0 < |x - 3| < delta$, ta có:
      $ |f(x) - L| = |(2x + 1) - 7| = 2|x - 3| < 2 delta = 2(epsilon / 2) = epsilon $
      Vì $delta = epsilon / 2$ luôn luôn lớn hơn 0 và tồn tại với mọi $epsilon > 0$, Defender luôn có chiến thuật thắng cuộc. Giới hạn được chứng minh tuyệt đối!
      
  *2. Trực giác hình học của các quy tắc tính đạo hàm*
  
  Chúng ta thường học các quy t�#explain-box(1, [Tuyến tính hóa cục bộ để tính nhẩm siêu tốc và Ý nghĩa hình học của phép vi phân bậc cao], [
  *1. Bài toán:* Không dùng máy tính cầm tay, hãy tính gần đúng giá trị của các biểu thức sau:
  $ A = sqrt(9.06) $
  $ B = (1.02)^5 $

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Sách giáo khoa thông thường sẽ cung cấp công thức xấp xỉ vi phân: $f(x_0 + Delta x) approx f(x_0) + f'(x_0) Delta x$. Học sinh sẽ học thuộc lòng công thức này, tìm cách đặt hàm số thích hợp (chẳng hạn $f(x) = sqrt(x)$), tính đạo hàm rồi ráp số một cách máy móc như một robot mà không hiểu tại sao công thức lại hoạt động, sai số của nó từ đâu ra, và làm sao để kiểm soát nó.

  *3. Góc nhìn "Đại Bác" (Khai triển Taylor và hình học của giai thừa $n!$):*
  Bản chất của xấp xỉ tuyến tính chính là việc thay thế một đường cong phức tạp bằng một tiếp tuyến phẳng tại điểm mốc $x_0$ thuận tiện nhất. Đây thực chất là *Khai triển Taylor bậc nhất*.
  Để tăng độ chính xác và đo lường sai số, ta nâng cấp lên khai triển Taylor bậc hai:
  $ f(x_0 + h) = f(x_0) + f'(x_0) h + frac(f''(x_0), 2!) h^2 + R_2 $
  
  *Giải mã bí ẩn của mẫu số $2!$ (Gia tốc và Diện tích tích lũy):*
  Tại sao trong công thức xấp xỉ bậc hai lại xuất hiện mẫu số $2! = 2$? Đây không phải là một sự sắp đặt ngẫu nhiên của đại số, mà là một quy luật hình học sâu sắc.
  Hãy liên hệ với vật lý chuyển động: Nếu một chiếc xe xuất phát từ trạng thái đứng yên với gia tốc không đổi $a = f''(x_0)$.
  - Vận tốc của xe tăng trưởng tuyến tính theo thời gian $t$: $v(t) = a t$.
  - Quãng đường đi được $s(t)$ chính là diện tích tích lũy dưới đồ thị vận tốc từ $0$ đến $t$. Đồ thị này tạo thành một tam giác vuông có đáy là $t$ và chiều cao là $v(t) = a t$.
  - Diện tích tam giác vuông này là:
    $ s(t) = frac(1, 2) times "đáy" times "chiều cao" = frac(1, 2) t (a t) = frac(a, 2) t^2 = frac(f''(x_0), 2!) t^2 $
  Số chia $2!$ xuất hiện vì ta đang tính diện tích của một hình tam giác (bằng $1/2$ diện tích hình chữ nhật bao quanh)! 
  Ở không gian nhiều chiều hơn, khi tính xấp xỉ bậc $n$, mẫu số $n!$ chính là tỉ lệ thể tích của một hình đơn diện $n$ chiều (n-simplex, giống như hình chóp trong không gian 3 chiều có thể tích bằng $1/3! = 1/6$ khối lập phương bao ngoài) so với khối siêu lập phương tương ứng. Đạo hàm cấp cao tích lũy các lớp thay đổi tạo nên các khối hình học đa chiều này.
  
  Khi $h$ là lượng rất nhỏ ($h << 1$), thì sai số $R_2$ (chứa các bậc cao hơn của $h$) là vô cùng nhỏ, khiến cho phép xấp xỉ tuyến tính và bậc hai có độ chính xác cực kỳ cao.

  *4. Lời giải chi tiết:*
  - *Tính $A = sqrt(9.06)$:*
    Chọn hàm số $f(x) = sqrt(x)$ và mốc đẹp gần nhất là $x_0 = 9$, độ lệch $h = 0.06$.
    - Giá trị tại mốc: $f(9) = 3$.
    - Đạo hàm cấp 1: $f'(x) = frac(1, 2 sqrt(x)) => f'(9) = frac(1, 6) approx 0.1667$.
    - Đạo hàm cấp 2: $f''(x) = -frac(1, 4 x sqrt(x)) => f''(9) = -frac(1, 108) approx -0.0093$.
    - Tuyến tính hóa bậc nhất:
      $ sqrt(9.06) approx f(9) + f'(9) h = 3 + frac(1, 6) dot.c 0.06 = 3.01 $
    - Đánh giá sai số bậc hai (sử dụng gia tốc):
      $ "Sai số" approx |frac(f''(9), 2!) h^2| = |frac(-1/108, 2) dot.c (0.06)^2| = frac(0.0036, 216) = 0.0000167 $
      Phép tuyến tính hóa cho kết quả $3.01$, với sai số tối đa chỉ khoảng $0.0000167$. Điều này đảm bảo kết quả chính xác đến 4 chữ số thập phân! (Bấm máy tính thực tế: $3.009983$).

  - *Tính $B = (1.02)^5$:*
    Chọn $g(x) = x^5$, mốc đẹp $x_0 = 1$, độ lệch $h = 0.02$.
    - Giá trị tại mốc: $g(1) = 1$.
    - Đạo hàm: $g'(x) = 5 x^4 => g'(1) = 5$.
    - Tuyến tính hóa:
      $ (1.02)^5 approx g(1) + g'(1) h = 1 + 5 dot.c 0.02 = 1.10 $
      *(Sai số thực tế cực nhỏ, chỉ là $0.00408$ do bỏ qua phần dư bậc hai $frac(g''(1), 2!) h^2 = 10 h^2 = 0.004$)*.

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Xấp xỉ tuyến tính và khai triển Taylor chính là linh hồn của phương pháp giải số trong khoa học máy tính (như *Phương pháp Newton-Raphson* dùng để tìm nghiệm phương trình phức tạp), và là cách các kỹ sư điều khiển tuyến tính hóa các mô hình robot phi tuyến phức tạp quanh điểm làm việc cân bằng để thiết kế bộ điều khiển lái tự động.
])

#pagebreak()

#explain-box(2, [Bất đẳng thức là cuộc so tài động học giữa các xe đua], [
  *1. Bài toán:* Chứng minh rằng với mọi $x > 0$, ta luôn có các bất đẳng thức:
  1. $sin x < x$
  2. $ln(1 + x) > x - frac(x^2, 2)$

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Cách giải truyền thống là chuyển vế, đặt hàm số $h(x) = x - sin x$, tính đạo hàm $h'(x) = 1 - cos x$, nhận xét $h'(x) >= 0$ với mọi $x$, lập bảng biến thiên chi tiết và kết luận $h(x) > h(0) = 0$. Phương pháp này biến việc chứng minh bất đẳng thức thành một thuật toán làm việc khô khan, che giấu hoàn toàn bản chất động học đằng sau.

  *3. Góc nhìn "Đại Bác" (Hệ thống thứ bậc động học - Vị trí, Vận tốc, Gia tốc):*
  Hãy tưởng tượng bất đẳng thức dưới dạng một cuộc đua giữa hai chiếc xe xuất phát tại cùng một điểm biên.
  Giả sử hai hàm số $f(x)$ và $g(x)$ là vị trí của hai chiếc xe đua theo thời gian $x$:
  - Nếu hai xe cùng xuất phát tại một vị trí: $f(0) = g(0)$.
  - Nếu vận tốc của xe $f$ luôn lớn hơn vận tốc của xe $g$ trên hành trình ($f'(x) > g'(x)$ với mọi $x > 0$).
  - Thì chắc chắn xe $f$ luôn dẫn trước xe $g$ trên toàn tuyến đường: $f(x) > g(x)$ với mọi $x > 0$.
  
  Hơn thế nữa, quy luật này có tính chất bắc cầu qua các cấp đạo hàm cao hơn (Vị trí $arrow.r$ Vận tốc $arrow.r$ Gia tốc $arrow.r$ Độ giật - Jerk):
  Nếu hai xe xuất phát cùng vị trí và vận tốc ban đầu ($f(0)=g(0)$, $f'(0)=g'(0)$), nhưng xe $f$ có gia tốc luôn lớn hơn xe $g$ ($f''(x) > g''(x)$), thì vận tốc của $f$ sẽ lớn hơn $g$, kéo theo vị trí của $f$ cũng sẽ lớn hơn $g$ toàn cục. Đây là một hệ thống thứ bậc động học vô cùng logic và trực quan!

  *4. Lời giải chi tiết:*
  1. *Chứng minh $sin x < x$ với mọi $x > 0$:*
     Đặt xe đua $f(x) = x$ và xe đua $g(x) = sin x$.
     - Tại vạch xuất phát $x = 0$: Hai xe ở cùng vị trí $f(0) = g(0) = 0$.
     - So sánh vận tốc (đạo hàm bậc nhất): $f'(x) = 1$, còn $g'(x) = cos x$.
     - Vì $cos x <= 1$ với mọi $x > 0$ (và chỉ bằng 1 tại các điểm cô lập), nên vận tốc của xe $f$ luôn vượt trội vận tốc của xe $g$ trên khoảng $(0, +infinity)$.
     - Do chạy nhanh hơn, xe $f$ luôn dẫn trước xe $g$: $x > sin x$ với mọi $x > 0$. (ĐPCM).

  2. *Chứng minh $ln(1 + x) > x - frac(x^2, 2)$ với mọi $x > 0$:*
     Đặt xe đua $f(x) = ln(1 + x)$ và xe đua $g(x) = x - frac(x^2, 2)$.
     - Tại vạch xuất phát $x = 0$: Hai xe ở cùng vị trí $f(0) = g(0) = 0$.
     - So sánh vận tốc: $f'(x) = frac(1, 1+x)$, còn $g'(x) = 1 - x$.
     - Khó thấy ngay tốc độ xe nào lớn hơn? Hãy cho hai vận tốc này đua tiếp vòng hai!
     - Tại vạch xuất phát vòng hai $x = 0$: Hai xe có cùng vận tốc ban đầu $f'(0) = g'(0) = 1$.
     - So sánh gia tốc (đạo hàm bậc hai): $f''(x) = -frac(1, (1+x)^2)$, còn $g''(x) = -1$.
     - Vì với mọi $x > 0$, ta có $1+x > 1 => (1+x)^2 > 1 => frac(1, (1+x)^2) < 1 => -frac(1, (1+x)^2) > -1$.
     - Gia tốc của xe $f$ luôn lớn hơn gia tốc của xe $g$ ($f''(x) > g''(x)$). Do đó, vận tốc xe $f$ sẽ lớn hơn vận tốc xe $g$ ($f'(x) > g'(x)$), dẫn đến vị trí của xe $f$ luôn vượt trước xe $g$ ($f(x) > g(x)$) với mọi $x > 0$. (ĐPCM).

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Tư duy thứ bậc động học này chính là nền tảng của *Độ phức tạp thuật toán (Big-O Notation)* trong Khoa học Máy tính. Nó giúp ta chứng minh một cách tường minh tại sao các thuật toán có độ phức tạp logarit $O(ln n)$ luôn chạy nhanh hơn tuyến tính $O(n)$, và tuyến tính luôn vượt trội hơn đa thức $O(n^2)$ khi kích thước dữ liệu $n$ tiến về vô cực.
])

#pagebreak()

#explain-box(3, [Định luật Snell về khúc xạ ánh sáng từ nguyên lý tối ưu Fermat], [
  *1. Bài toán:* Một tia sáng truyền từ điểm $A$ trong môi trường 1 (với vận tốc ánh sáng là $v_1$) đến điểm $B$ trong môi trường 2 (với vận tốc ánh sáng là $v_2$). Hai môi trường phân cách nhau bởi một đường thẳng nằm ngang. Hãy xác định quỹ đạo truyền sáng để tổng thời gian đi từ $A$ đến $B$ là ngắn nhất.

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Các sách bài tập thường yêu cầu học sinh thiết lập hàm số thời gian $T(x)$ theo biến vị trí $x$, thực hiện tính đạo hàm bằng tay với các căn thức phức tạp, rồi giải phương trình $T'(x) = 0$ bằng các biến đổi đại số cồng kềnh. Học sinh bị cuốn vào các phép tính đại số khô khan và hoàn toàn đánh mất bản chất vật lý trực quan của bài toán.

  *3. Góc nhìn "Đại Bác" (Cán cân thăng bằng cận biên - Người cứu hộ bãi biển):*
  Hãy tưởng tượng bạn là một nhân viên cứu hộ tại điểm $A$ trên bãi cát và cần cứu một người đang đuối nước tại điểm $B$ dưới biển. Bạn chạy trên cát nhanh hơn bơi dưới nước ($v_1 > v_2$).
  - Nếu bạn đi theo đường thẳng nối $A$ và $B$ (quãng đường ngắn nhất), bạn sẽ phải bơi dưới nước một chặng dài. Bạn sẽ mất nhiều thời gian vì tốc độ bơi chậm.
  - Nếu bạn chạy trên cát đến điểm đối diện với $B$ rồi mới bơi thẳng xuống biển, quãng đường bơi là ngắn nhất nhưng tổng quãng đường chạy lại quá dài, cũng không tối ưu.
  - Điểm thăng bằng hoàn hảo (đạo hàm bằng 0) là nơi bạn chấp nhận chạy dài thêm một chút trên cát để đổi lấy việc rút ngắn quãng đường bơi dưới nước. 
  Đạo hàm chính là chiếc cán cân tự động cân bằng tỷ lệ thay đổi thời gian giữa hai môi trường cát và nước. Tại điểm tối ưu, tốc độ thay đổi thời gian chạy trên cát khi dịch chuyển vị trí giao nhau $x$ phải bù trừ hoàn hảo với tốc độ thay đổi thời gian bơi dưới nước.

  #v(0.5em)
  #align(center)[
    #canvas(length: 1cm, {
      import draw: *
      line((-3.5, 0), (3.5, 0), stroke: 1.2pt + black)
      content((2.5, 0.3), [Bãi cát ($v_1$)])
      content((2.5, -0.3), [Dưới biển ($v_2$)])
      
      circle((-2.2, 1.6), radius: 2pt, fill: c-dark-blue)
      content((-2.4, 1.9), [$A$])
      circle((1.8, -2.2), radius: 2pt, fill: c-dark-blue)
      content((2.0, -2.5), [$B$])
      
      circle((0, 0), radius: 2pt, fill: c-red)
      content((0.2, 0.3), [$X(x, 0)$])
      
      line((-2.2, 1.6), (0, 0), stroke: 1.5pt + c-gold, mark: (end: "stealth"))
      line((0, 0), (1.8, -2.2), stroke: 1.5pt + c-gold, mark: (end: "stealth"))
      
      line((0, -2.6), (0, 2.2), stroke: (dash: "dashed", paint: gray))
      
      content((-0.45, 0.95), [$theta_1$])
      content((0.45, -0.95), [$theta_2$])
    })
  ]
  #align(center)[*Hình 4: Quỹ đạo khúc xạ ánh sáng tối ưu thời gian*]

  *4. Lời giải chi tiết:*
  Giả sử đường phân cách cát - biển là trục $O x$. Tọa độ của điểm xuất phát là $A(-a, h_1)$ và điểm đích là $B(b, -h_2)$. Tia sáng cắt đường phân cách tại điểm $X(x, 0)$ với $-a <= x <= b$.
  Tổng thời gian di chuyển $T(x)$ là:
  $ T(x) = frac(sqrt((x + a)^2 + h_1^2), v_1) + frac(sqrt((b - x)^2 + h_2^2), v_2) $
  Toàn bộ thời gian đạt cực tiểu khi và chỉ khi đạo hàm bằng 0, tức $T'(x) = 0$:
  $ T'(x) = frac(1, v_1) dot.c frac(x + a, sqrt((x + a)^2 + h_1^2)) - frac(1, v_2) dot.c frac(b - x, sqrt((b - x)^2 + h_2^2)) = 0 $
  Nhìn vào các tam giác vuông lượng giác tại điểm giao cắt $X$:
  - Góc tới $theta_1$ trên cát thỏa mãn: $sin theta_1 = frac(x + a, A X) = frac(x + a, sqrt((x + a)^2 + h_1^2))$
  - Góc khúc xạ $theta_2$ dưới nước thỏa mãn: $sin theta_2 = frac(b - x, X B) = frac(b - x, sqrt((b - x)^2 + h_2^2))$
  Thay các biểu thức lượng giác này vào phương trình đạo hàm bằng 0, ta lập tức thu được:
  $ T'(x) = frac(sin theta_1, v_1) - frac(sin theta_2, v_2) = 0 => frac(sin theta_1, sin theta_2) = frac(v_1, v_2) $
  Định luật khúc xạ ánh sáng nổi tiếng — *Định luật Snell* — tự động hiện ra từ điều kiện đạo hàm bằng 0 của thời gian!

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Đây chính là biểu hiện cụ thể của *Nguyên lý Fermat về thời gian cực tiểu*, và rộng hơn là *Nguyên lý Tác dụng Tối thiểu (Principle of Least Action)* trong vật lý hiện đại. Thiên nhiên là một nhà toán học tối ưu hóa vĩ đại: tia sáng đi theo đường tốn ít thời gian nhất, dòng điện chạy theo con đường có điện trở nhỏ nhất, và mọi hệ cơ học trong vũ trụ đều tự động rơi vào trạng thái có thế năng tối thiểu (nơi đạo hàm thế năng triệt tiêu).
])

#pagebreak()

#explain-box(4, [Tối ưu hóa thiết kế và Sự cân bằng đối xứng không gian 3D], [
  *1. Bài toán:* 
  1. Một doanh nghiệp cần lắp đặt đường ống nước từ nhà máy phát điện sát bờ sông rộng $500$ m tới một trạm bơm ở bờ sông đối diện. Trạm bơm nằm cách điểm đối diện nhà máy trên bờ kia một khoảng là $2000$ m dọc theo sông. Chi phí lắp đặt ống dưới nước là $5$ triệu đồng/mét và trên cạn là $3$ triệu đồng/mét. Xác định phương án thiết kế để chi phí lắp đặt thấp nhất.
  2. Một người muốn gập một chiếc hộp không nắp từ một tấm bìa hình vuông cạnh $a$ bằng cách cắt bỏ 4 hình vuông nhỏ cạnh $x$ ở 4 góc rồi dựng thành lên. Tìm $x$ để thể tích hộp lớn nhất.

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Thông thường, học sinh sẽ lập các hàm số chi phí $C(x)$ hoặc thể tích $V(x)$ theo biến $x$, tính đạo hàm bằng các công thức đại số, rồi lập bảng biến thiên để kết luận giá trị cực trị. Họ coi các con số kết quả thu được như những kết quả tính toán ngẫu nhiên của các phép toán đại số mà không nhìn thấy sự cân bằng lực lượng và tính đối xứng hình học ngầm ẩn bên trong.

  *3. Góc nhìn "Đại Bác" (Cân bằng cận biên và Đối xứng AM-GM):*
  - **Bài toán đường ống:** Đạo hàm ở đây đóng vai trò như một cán cân kinh tế. Điểm cực trị của chi phí xảy ra khi chi phí tăng thêm khi đi dưới sông (lượng thay đổi cận biên dưới nước) vừa vặn bằng chi phí tiết kiệm được khi đi trên cạn. Điểm $C'(x) = 0$ chính là điểm cân bằng giữa hai xu hướng đối nghịch này.
  - **Bài toán chiếc hộp:** Khi ta tăng kích thước cắt góc $x$, ta làm tăng chiều cao của chiếc hộp (điều này có lợi cho thể tích), nhưng đồng thời lại làm co hẹp diện tích đáy hộp $(a - 2x)^2$ (điều này có hại cho thể tích). Điểm tối ưu $V'(x) = 0$ chính là ranh giới mà tốc độ tăng trưởng do chiều cao mang lại bị triệt tiêu hoàn toàn bởi tốc độ suy giảm của diện tích đáy.
    
    *Ý nghĩa hình học của con số $x = a/6$ (Đối xứng AM-GM):*
    Tại sao kết quả tối ưu của bài toán chiếc hộp luôn là $x = a/6$? Hãy nhìn nó qua lăng kính đối xứng của bất đẳng thức AM-GM (Trung bình cộng - Trung bình nhân).
    Thể tích hộp là $V(x) = x(a - 2x)^2$. Chúng ta cần tối ưu hóa tích của ba nhân tử: $x$, $(a-2x)$, và $(a-2x)$.
    Để áp dụng AM-GM cho tích này khi các số hạng biến thiên, ta cần biến đổi các nhân tử sao cho tổng của chúng là một hằng số. Ta nhân thêm $4$ vào nhân tử thứ nhất:
    $ 4 V(x) = (4x) dot.c (a - 2x) dot.c (a - 2x) $
    Tổng của ba nhân tử này là: $(4x) + (a - 2x) + (a - 2x) = 2a$ (đây là một hằng số cố định!).
    Theo bất đẳng thức AM-GM, tích của ba số dương có tổng không đổi sẽ đạt giá trị lớn nhất khi và chỉ khi ba số đó bằng nhau:
    $ 4x = a - 2x => 6x = a => x = frac(a, 6) $
    Con số $1/6$ không hề ngẫu nhiên! Nó là hằng số đối xứng hình học hoàn hảo của thế giới 3 chiều: Thể tích hộp đạt cực đại khi và chỉ khi phần chu vi tiêu tốn cho chiều cao ($4x$ từ 4 góc cắt) bằng đúng chiều rộng đáy ($a-2x$). Sự cân bằng 1:1 này chính là đỉnh cao của sự tối ưu!

  *4. Lời giải chi tiết:*
  1. *Bài toán đường ống nước:*
     Gọi $x$ (mét) là khoảng cách từ điểm đối diện nhà máy trên bờ bên kia tới vị trí đường ống vượt sông ($0 <= x <= 2000$).
     - Khoảng cách đường ống dưới nước: $L_("nước") = sqrt(x^2 + 500^2)$ (mét).
     - Khoảng cách đường ống trên cạn: $L_("cạn") = 2000 - x$ (mét).
     - Tổng chi phí (triệu đồng) là:
       $ C(x) = 5 sqrt(x^2 + 250000) + 3(2000 - x) $
     - Tìm điểm dừng Fermat bằng cách giải $C'(x) = 0$:
       $ C'(x) = 5 dot.c frac(x, sqrt(x^2 + 250000)) - 3 = 0 $
       $ <=> 5x = 3 sqrt(x^2 + 250000) <=> 25x^2 = 9(x^2 + 250000) $
       $ <=> 16x^2 = 2250000 <=> x = 375 " m" (x >= 0) $
     - Lập bảng biến thiên thấy $C(x)$ đạt cực tiểu tại $x = 375$. Chi phí tối thiểu là $8000$ triệu đồng ($8$ tỷ đồng).

  2. *Bài toán chiếc hộp tối ưu:*
     Hộp dựng lên có đáy là hình vuông cạnh $a-2x$ và chiều cao là $x$ ($0 < x < a/2$). Thể tích là:
     $ V(x) = x (a - 2x)^2 = 4x^3 - 4a x^2 + a^2 x $
     - Lấy đạo hàm theo $x$:
       $ V'(x) = 12x^2 - 8a x + a^2 = (2x - a)(6x - a) $
     - Giải $V'(x) = 0$ trên khoảng $(0, a/2)$, ta được nghiệm duy nhất $x = a/6$.
     - Vì $V(0) = V(a/2) = 0$ and $V(a/6) > 0$, theo định lý Weierstrass, giá trị cực đại bắt buộc đạt được tại điểm dừng duy nhất $x = a/6$.

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Trong Kinh tế học, đây chính là *Nguyên lý phân tích cận biên (Marginal Analysis)*. Doanh nghiệp đạt được lợi nhuận tối đa khi doanh thu cận biên (Marginal Revenue - đạo hàm của doanh thu) bằng đúng chi phí cận biên (Marginal Cost - đạo hàm của chi phí). Khi đó, lợi nhuận cận biên bằng 0, đánh dấu đỉnh cao nhất của đường cong lợi nhuận.
])

#pagebreak()

#explain-box(5, [Khảo sát sự đơn điệu của hàm hợp vận dụng cao (VDC)], [
  *1. Bài toán:* Cho hàm số bậc bốn $y = f(x)$ có bảng xét dấu của đạo hàm $f'(x)$ như sau:
  #align(center)[
    #my-bxd(
      var: $x$,
      func: $f'(x)$,
      x-vals: ($-oo$, $-2$, $1$, $3$, $+oo$),
      f-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$)
    )
  ]
  Hãy xác định các khoảng đồng biến của hàm hợp $g(x) = f(x^2 - 2x)$.

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Hiện nay, để giải các bài toán hàm hợp vận dụng cao (VDC) trong đề thi trắc nghiệm THPT, học sinh thường được dạy các mẹo làm nhanh như "ghép trục", "sơ đồ hình chữ V". Đây là những công cụ cơ học giúp học sinh giải toán nhanh nhưng biến các em thành những cỗ máy bấm nút vô thức. Khi đề bài thay đổi nhẹ cấu trúc hoặc lồng thêm tham số phức tạp, học sinh lập tức bế tắc vì hoàn toàn rỗng trực giác và không hiểu cơ chế vận hành bên dưới.

  *3. Góc nhìn "Đại Bác" (Sự tương tác giữa vận tốc lõi và vận tốc vỏ):*
  Hàm hợp $g(x) = f(u(x))$ thực chất là sự lồng ghép của hai chuyển động kế tiếp: biến đầu vào $x$ làm thay đổi lõi bên trong $u(x)$, rồi lõi $u(x)$ làm thay đổi đầu ra toàn cục thông qua phản ứng của lớp vỏ $f(u)$.
  Theo quy tắc xích (Chain Rule), vận tốc toàn cục $g'(x)$ là tích của hai vận tốc độc lập:
  $ g'(x) = u'(x) dot.c f'(u) $
  Để hàm hợp đồng biến toàn cục ($g'(x) > 0$), hai vận tốc này bắt buộc phải *cùng dấu* với nhau:
  - Hoặc cả hai cùng dương (lõi tăng và vỏ phản ứng tăng theo: $u'(x) > 0$ và $f'(u) > 0$).
  - Hoặc cả hai cùng âm (lõi giảm và vỏ phản ứng nghịch chiều kéo lại thành dương: $u'(x) < 0$ và $f'(u) < 0$).
  Tư duy nhân tử này vô cùng tự nhiên, mạnh mẽ, và không bao giờ bị lung lay trước mọi biến thể phức tạp của đề bài.

  *4. Lời giải chi tiết:*
  Ta có lõi $u(x) = x^2 - 2x$ và vận tốc lõi $u'(x) = 2(x - 1)$.
  Để tìm các điểm dừng của hàm hợp, ta giải phương trình $g'(x) = 0$:
  $ g'(x) = 2(x - 1) f'(x^2 - 2x) = 0 <=> hoac(x = 1, x^2 - 2x = -2, x^2 - 2x = 1, x^2 - 2x = 3) $
  - Phương trình $x^2 - 2x = -2$ (tức là $(x-1)^2 = -1$) vô nghiệm.
  - Phương trình $x^2 - 2x = 1 <=> (x-1)^2 = 2 <=> x = 1 +- sqrt(2)$.
  - Phương trình $x^2 - 2x = 3 <=> x^2 - 2x - 3 = 0 <=> x = -1$ hoặc $x = 3$.
  Ta thiết lập bảng xét dấu cho tích số $g'(x) = 2(x - 1) f'(x^2 - 2x)$ trực tiếp từ sự tương tác dấu của hai thành phần:
  - Xét trên khoảng cực hữu $(3, +infinity)$: ta có $2(x - 1) > 0$. Khi $x > 3$, giá trị lõi $u = x^2 - 2x > 3$, nhìn vào bảng xét dấu gốc của $f'$ ta thấy $f'(u) > 0$ khi $u > 3$. Do đó, tích số mang dấu $(+) dot.c (+) = (+)$.
  - Vì tất cả các nghiệm $-1, 1-sqrt(2), 1, 1+sqrt(2), 3$ đều là các nghiệm đơn (bậc lẻ), nên đi qua mỗi nghiệm, đạo hàm $g'(x)$ đổi dấu đan xen liên tục:
  #align(center)[
    #my-bxd(
      var: $x$,
      func: $g'(x)$,
      x-vals: ($-oo$, $-1$, $1 - sqrt(2)$, $1$, $1 + sqrt(2)$, $3$, $+oo$),
      f-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$, $0$, $-$, $0$, $+$)
    )
  ]
  Vậy hàm hợp đồng biến trên các khoảng cùng dấu dương:
  $ (-1, 1 - sqrt(2)), quad (1, 1 + sqrt(2)), quad "và" quad (3, +oo) $

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Sự tương tác nhân tử đạo hàm này chính là nền tảng của phương pháp tính toán đạo hàm theo hướng (Directional Derivative) và Gradient trong giải tích đa biến, được sử dụng trong lập trình tối ưu hóa chuyển động của xe tự hành: xe phải điều chỉnh vô lăng (vận tốc lõi) tương thích với độ cong của mặt đường (vận tốc vỏ) để xe luôn đi đúng quỹ đạo an toàn.
])c(sqrt((b - x)^2 + h_2^2), v_2) $
  Để thời gian cực tiểu, ta giải phương trình $T'(x) = 0$:
  $ T'(x) = frac(1, v_1) dot.c frac(x + a, sqrt((x + a)^2 + h_1^2)) - frac(1, v_2) dot.c frac(b - x, sqrt((b - x)^2 + h_2^2)) = 0 $
  Nhận xét từ hình học lượng giác tại điểm giao $X$:
  - $sin theta_1 = frac(x + a, A X) = frac(x + a, sqrt((x + a)^2 + h_1^2))$
  - $sin theta_2 = frac(b - x, X B) = frac(b - x, sqrt((b - x)^2 + h_2^2))$
  Thay thế vào phương trình đạo hàm bằng 0, ta lập tức có:
  $ T'(x) = frac(sin theta_1, v_1) - frac(sin theta_2, v_2) = 0 => frac(sin theta_1, sin theta_2) = frac(v_1, v_2) $
  Đây chính là *Định luật Snell*!

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Đây chính là biểu hiện của *Nguyên lý Tác dụng Tối thiểu (Principle of Least Action)* trong vật lý hiện đại. Thiên nhiên luôn vận hành theo cách tiết kiệm nhất: tia sáng đi theo con đường tốn ít thời gian nhất, dòng điện đi theo con đường có điện trở nhỏ nhất, và mọi hệ cơ học đều tự động rơi vào trạng thái có thế năng tối thiểu (đạo hàm của thế năng bằng 0).
])

#pagebreak()

#explain-box(4, [Bài toán tối ưu hóa trong thiết kế và kỹ thuật], [
  *1. Bài toán:* 
  1. Một doanh nghiệp cần lắp đặt đường ống nước từ nhà máy phát điện sát bờ sông rộng $500$ m tới một trạm bơm ở bờ sông đối diện. Trạm bơm nằm cách điểm đối diện nhà máy trên bờ kia một khoảng là $2000$ m dọc theo sông. Chi phí lắp đặt ống dưới nước là $5$ triệu đồng/mét và trên cạn là $3$ triệu đồng/mét. Xác định phương án thiết kế để chi phí lắp đặt thấp nhất.
  2. Một người muốn gập một chiếc hộp không nắp từ một tấm bìa hình vuông cạnh $a$ bằng cách cắt bỏ 4 hình vuông nhỏ cạnh $x$ ở 4 góc rồi dựng thành lên. Tìm $x$ để thể tích hộp lớn nhất.

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Học sinh thường chỉ biết lập hàm số rồi khảo sát, tính đạo hàm bằng tay một cách máy móc, rồi lập bảng biến thiên mà không hiểu cơ chế thăng bằng của hệ thống.

  *3. Góc nhìn "Đại Bác" (Insight bản chất):*
  Đạo hàm đóng vai trò là một *cán cân lực lượng*.
  - Trong bài toán đường ống: Chi phí tăng thêm khi đi dưới sông (lượng thay đổi cận biên) phải bằng chi phí tiết kiệm được khi đi trên cạn. Điểm cực trị $C'(x) = 0$ chính là điểm cân bằng giữa hai xu hướng đối nghịch này.
  - Trong bài toán cái hộp: Khi tăng kích thước cắt góc $x$, ta làm tăng chiều cao của hộp (có lợi cho thể tích), nhưng lại làm co hẹp diện tích đáy $(a-2x)^2$ (có hại cho thể tích). Điểm tối ưu $V'(x) = 0$ là nơi tốc độ tăng trưởng do chiều cao mang lại bị triệt tiêu hoàn toàn bởi tốc độ suy giảm của diện tích đáy.

  *4. Lời giải chi tiết:*
  1. *Bài toán đường ống nước:*
     Gọi $x$ (mét) là khoảng cách từ điểm đối diện nhà máy trên bờ bên kia tới vị trí đường ống vượt sông ($0 <= x <= 2000$).
     - Khoảng cách đường ống dưới nước: $L_("nước") = sqrt(x^2 + 500^2)$ (mét).
     - Khoảng cách đường ống trên cạn: $L_("cạn") = 2000 - x$ (mét).
     - Tổng chi phí (triệu đồng) là:
       $ C(x) = 5 sqrt(x^2 + 250000) + 3(2000 - x) $
     - Tìm điểm dừng Fermat:
       $ C'(x) = 5 dot.c frac(x, sqrt(x^2 + 250000)) - 3 = 0 $
       $ <=> 5x = 3 sqrt(x^2 + 250000) <=> 25x^2 = 9(x^2 + 250000) $
       $ <=> 16x^2 = 2250000 <=> x = 375 " m" (x >= 0) $
     - Lập bảng biến thiên thấy $C(x)$ đạt cực tiểu tại $x = 375$. Chi phí tối thiểu là $8000$ triệu đồng ($8$ tỷ đồng).

  2. *Bài toán chiếc hộp tối ưu:*
     Hộp dựng lên có đáy là hình vuông cạnh $a-2x$ và chiều cao là $x$. Thể tích:
     $ V(x) = x (a - 2x)^2 = 4x^3 - 4a x^2 + a^2 x $
     - Lấy đạo hàm theo $x$:
       $ V'(x) = 12x^2 - 8a x + a^2 = (2x - a)(6x - a) $
     - Giải $V'(x) = 0$ trên khoảng $(0, a/2)$, ta được nghiệm duy nhất $x = a/6$.
     - Vì $V(0) = V(a/2) = 0$ và $V(a/6) > 0$, theo định lý Weierstrass, giá trị cực đại bắt buộc đạt được tại điểm dừng duy nhất $x = a/6$.

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Trong kinh tế học, đây chính là *Nguyên lý phân tích cận biên (Marginal Analysis)*. Doanh nghiệp đạt lợi nhuận tối đa khi doanh thu cận biên (Marginal Revenue - đạo hàm của doanh thu) bằng chi phí cận biên (Marginal Cost - đạo hàm của chi phí). Lợi nhuận biên bằng 0 chính là đỉnh cao nhất của đường cong lợi nhuận.
])

#pagebreak()

#explain-box(5, [Khảo sát sự đơn điệu của hàm hợp vận dụng cao (VDC)], [
  *1. Bài toán:* Cho hàm số bậc bốn $y = f(x)$ có bảng xét dấu của đạo hàm $f'(x)$ như sau:
  #align(center)[
    #my-bxd(
      var: $x$,
      func: $f'(x)$,
      x-vals: ($-oo$, $-2$, $1$, $3$, $+oo$),
      f-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$)
    )
  ]
  Hãy xác định các khoảng đồng biến của hàm hợp $g(x) = f(x^2 - 2x)$.

  *2. Cách giải "Diệt Ruồi" (Textbook style):*
  Hiện nay, học sinh Việt Nam thường được dạy các mẹo làm nhanh như "ghép trục", "sơ đồ hình chữ V". Đây là những công cụ cơ học giúp giải toán trắc nghiệm nhanh nhưng biến học sinh thành những robot bấm nút. Khi gặp các bài toán biến thể nhẹ hoặc có tham số phức tạp, học sinh lập tức bế tắc vì hoàn toàn rỗng trực giác.

  *3. Góc nhìn "Đại Bác" (Insight bản chất - Tương tác hai chuyển động):*
  Hàm hợp $g(x) = f(u(x))$ thực chất là sự lồng ghép của hai chuyển động kế tiếp: đầu vào $x$ làm thay đổi lõi bên trong $u(x)$, rồi lõi $u(x)$ làm thay đổi đầu ra toàn cục thông qua phản ứng $f(u)$.
  Theo quy tắc xích, vận tốc toàn cục $g'(x)$ là tích của hai vận tốc độc lập:
  $ g'(x) = u'(x) dot.c f'(u) $
  Để hàm số đồng biến ($g'(x) > 0$), hai vận tốc này bắt buộc phải *cùng dấu* (cùng dương để cùng kéo lên, hoặc cùng âm để tương tác nhân tử đảo chiều thành dương). Tư duy nhân tử này cực kỳ đơn giản, trực quan và không bao giờ bị sai lệch trước mọi biến thể.

  *4. Lời giải chi tiết:*
  Ta có $u(x) = x^2 - 2x => u'(x) = 2(x - 1)$.
  Phương trình đạo hàm bằng 0:
  $ g'(x) = 2(x - 1) f'(x^2 - 2x) = 0 <=> hoac(x = 1, x^2 - 2x = -2, x^2 - 2x = 1, x^2 - 2x = 3) $
  - Bất trình $x^2 - 2x = -2$ vô nghiệm.
  - $x^2 - 2x = 1 <=> x = 1 +- sqrt(2)$.
  - $x^2 - 2x = 3 <=> x = -1$ hoặc $x = 3$.
  Ta lập bảng xét dấu tích số trực tiếp cho $g'(x)$ bằng cách xét sự tương tác của $u'(x) = 2(x - 1)$ và $f'(x^2 - 2x)$:
  - Với $x > 3$: ta có $2(x - 1) > 0$. Đồng thời $u = x^2 - 2x > 3 => f'(u) > 0$ (theo bảng xét dấu gốc). Tích số mang dấu $+$.
  - Khi đi qua các nghiệm đơn $3, 1+sqrt(2), 1, 1-sqrt(2), -1$, đạo hàm $g'(x)$ đổi dấu đan xen liên tục:
  #align(center)[
    #my-bxd(
      var: $x$,
      func: $g'(x)$,
      x-vals: ($-oo$, $-1$, $1 - sqrt(2)$, $1$, $1 + sqrt(2)$, $3$, $+oo$),
      f-signs: ($-$, $0$, $+$, $0$, $-$, $0$, $+$, $0$, $-$, $0$, $+$)
    )
  ]
  Vậy hàm số đồng biến trên các khoảng:
  $ (-1, 1 - sqrt(2)), quad (1, 1 + sqrt(2)), quad "và" quad (3, +oo) $

  *🔗 Ý tưởng này còn xuất hiện ở đâu?*
  Quy tắc xích và sự tương tác dấu này là nền tảng để tính toán đạo hàm trong không gian nhiều chiều (Gradient) trong giải tích đa biến, được sử dụng để tối ưu hóa quỹ đạo bay của tàu vũ trụ khi chịu lực hấp dẫn của nhiều thiên thể cùng lúc.
])

#pagebreak()

#meta-box[
  == 6. Siêu tư duy (Meta-Thinking)
  
  *1. Cách mạng Trí Tuệ Nhân Tạo (AI) — Sự thống trị của Quy tắc xích:*
  Làm thế nào mà các mô hình ngôn ngữ lớn như ChatGPT hay các hệ thống AI nhận diện hình ảnh có thể tự học hỏi từ hàng triệu bức ảnh để nhận diện khuôn mặt? 
  
  Lõi của toàn bộ ngành Học Sâu (Deep Learning) thực chất là phép tính đạo hàm của hàm hợp khổng lồ.
  - Một mạng nơ-ron nhân tạo gồm hàng nghìn lớp (layer) xếp chồng lên nhau. Mỗi lớp là một hàm số $f_i$ nhận đầu vào từ lớp trước và truyền đầu ra cho lớp sau.
  - Khi mô hình AI đoán sai hình ảnh, người ta tính một *Hàm mất mát (Loss function)* đo lường sai số.
  - Để biết cần điều chỉnh các tham số (weights) ở các lớp sâu bên trong như thế nào nhằm giảm sai số, máy tính bắt buộc phải tính đạo hàm của hàm mất mát theo từng tham số đó.
  - Nhờ *Thuật toán lan truyền ngược (Backpropagation)* — thực chất là sự áp dụng quy tắc xích liên tiếp cho hàm hợp hàng nghìn lớp:
    $ frac(partial "Sai số", partial "Tham số") = frac(partial "Sai số", partial y) dot.c frac(partial y, partial u) dot.c frac(partial u, partial "Tham số") $
    AI biết chính xác cần tăng hay giảm nhẹ tham số nào để mô hình hoạt động thông minh hơn. AI thực chất là hàng tỷ phép tính đạo hàm diễn ra mỗi giây!

  *2. Thế giới tự nhiên được viết bằng ngôn ngữ vi phân:*
  Tại sao các nhà vật lý lại có thể mô tả toàn bộ vũ trụ chỉ bằng vài phương trình ngắn gọn? Bởi vì họ không mô tả trạng thái tĩnh, họ mô tả *luật thay đổi cục bộ*.
  - *Phương trình truyền nhiệt:* Tốc độ thay đổi nhiệt độ theo thời gian tại một điểm tỉ lệ thuận với độ cong (đạo hàm cấp hai) của nhiệt độ trong không gian xung quanh điểm đó.
  - *Cơ học lượng tử (Phương trình Schrödinger):* Sự tiến hóa của trạng thái lượng tử của hạt theo thời gian được quyết định bởi năng lượng của hạt đó tại điểm cục bộ.
  Giải các mối quan hệ vi phân cục bộ này (phương trình vi phân) cho ta hàm số toàn cục mô tả hành vi của cả hệ thống trong tương lai.
]

#v(1.2em)

#align(center)[
  #text(fill: c-royal-blue, weight: "black", size: 14pt)[BẢN ĐỒ NHẬN THỨC CHƯƠNG 1]
]

#align(center)[
  #block(
    fill: rgb("#ECEFF1"),
    inset: 16pt,
    radius: 8pt,
    stroke: 0.8pt + rgb("#B0BEC5"),
    width: 100%,
  )[
    #align(left)[
      *1. Sự thay đổi và giới hạn (Quan sát vi mô):*
      - *Nhu cầu:* Đo tốc độ thay đổi tức thời tại một điểm (vượt thoát nghịch lý Zeno).
      - *Công cụ:* Giới hạn ($lim_(h->0)$) đo xu hướng hội tụ của tỷ số trung bình khi khoảng co lại vô hạn.
      - *Định nghĩa $epsilon-delta$:* Trò chơi thách đấu sai số an toàn giữa đầu ra và đầu vào.
      
      *2. Trực giác hình học (Tuyến tính hóa):*
      - *Nguyên lý:* Phóng to đồ thị cong mịn vô hạn lần sẽ thấy nó phẳng ra thành tiếp tuyến.
      - *Khả vi:* Tính mịn màng của đồ thị (ranh giới là các điểm gãy và fractal Weierstrass).
      
      *3. Chiếc cầu nối (Cục bộ $arrow.r$ Toàn cục):*
      - *Định lý Lagrange:* Hiệu số toàn cục $f(b) - f(a) = f'(c)(b - a)$.
      - *Trực giác:* Vận tốc tức thời bằng vận tốc trung bình tại ít nhất một điểm.
      
      *4. Quy tắc hình học:*
      - *Công thức lũy thừa:* Sự nở rộng hình học của khối lập phương $n$-chiều.
      - *Quy tắc tích/thương:* Sự gia tăng diện tích chữ nhật và biến đổi đại số tương đương.
      - *Quy tắc xích:* Tương tác hệ số truyền động bánh răng của hàm hợp.
      
      *5. Thống nhất ứng dụng 12:*
      - *Đơn điệu:* Xu hướng dốc lên ($f' > 0$) hoặc dốc xuống ($f' < 0$) quyết định dòng chảy toàn cục.
      - *Cực trị:* Điểm thăng bằng dừng chuyển động ($f' = 0$ và đổi dấu).
      - *Tối ưu hóa:* Sự cân bằng cận biên của các lực đối nghịch trong kinh tế và kỹ thuật.
    ]
  ]
]
