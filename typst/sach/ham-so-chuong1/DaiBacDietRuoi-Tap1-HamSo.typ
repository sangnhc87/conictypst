#import "@preview/cetz:0.5.2": canvas, draw
#import "_config.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG VÀ HỆ THỐNG PHONG CÁCH ĐẠI BÁC
// ═══════════════════════════════════════════════
#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.2cm),
  header: context {
    let page-num = counter(page).get().first()
    if page-num > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8.5pt, fill: rgb("#546E7A"), style: "italic")[Tư Duy Đại Bác Diệt Ruồi — Toán 12: Hàm Số]
        ],
        align(right)[
          #text(size: 8.5pt, fill: rgb("#0D47A1"), weight: "bold")[Chương 1: Ứng dụng đạo hàm khảo sát hàm số]
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
#show math.frac: math.display

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
#let cover-box(title, subtitle) = block(
  width: 100%,
  fill: gradient.linear(c-dark-blue, c-royal-blue, angle: 145deg),
  inset: (x: 24pt, y: 35pt),
  radius: 12pt,
  clip: true,
)[
  #align(center)[
    #text(fill: c-gold, size: 11pt, weight: "bold", tracking: 4pt)[TƯ DUY ĐẠI BÁC DIỆT RUỒI] \
    #v(0.8em)
    #text(fill: white, size: 24pt, weight: "black")[#title] \
    #v(0.6em)
    #text(fill: rgb("#80DEEA"), size: 14pt, style: "italic")[#subtitle]
    #v(1.2em)
    #line(length: 40%, stroke: 1.2pt + c-gold)
    #v(1em)
    #text(fill: rgb("#C5CAE9"), size: 10pt)[
      PHÁ VỠ LỐI TƯ DUY PHÂN DẠNG VÀ RẬP KHUÔN CỦA TOÁN PHỔ THÔNG 12
    ]
  ]
]

#let chapter-header(n, title) = {
  v(2em)
  block(
    width: 100%,
    fill: gradient.linear(rgb("#1A237E"), rgb("#0D47A1"), angle: 90deg),
    inset: (x: 18pt, y: 12pt),
    radius: 6pt,
  )[
    #text(fill: c-gold, weight: "bold", size: 11pt)[CHƯƠNG #n] \
    #v(0.2em)
    #text(fill: white, weight: "black", size: 16pt)[#title]
  ]
  v(1em)
}

#let philosophy-box(body) = block(
  fill: rgb("#F7F9FA"),
  stroke: (left: 4pt + c-indigo),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: c-royal-blue, weight: "bold", size: 11pt)[⚖️ Mở Đầu Triết Học & Lịch Sử (Why)]
  #v(0.4em)
  #body
]

#let visual-box(body) = block(
  fill: rgb("#EAF4F4"),
  stroke: (left: 4pt + c-teal),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold", size: 11pt)[👁️ Trực Giác Hình Học & Khái Niệm]
  #v(0.4em)
  #body
]

#let structure-box(body) = block(
  fill: rgb("#FDF5E6"),
  stroke: (left: 4pt + rgb("#B25E00")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#B25E00"), weight: "bold", size: 11pt)[🔑 Cấu Trúc Cốt Lõi (Core Structure)]
  #v(0.4em)
  #body
]

#let technique-box(body) = block(
  fill: rgb("#F3EFF5"),
  stroke: (left: 4pt + rgb("#5E35B1")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#5E35B1"), weight: "bold", size: 11pt)[⚙️ Phát Triển Kỹ Thuật (Technique)]
  #v(0.4em)
  #body
]

#let meta-box(body) = block(
  fill: rgb("#EBF5FB"),
  stroke: (left: 4pt + rgb("#21618C")),
  inset: (x: 16pt, y: 14pt),
  radius: (right: 6pt),
  width: 100%,
)[
  #text(fill: rgb("#21618C"), weight: "bold", size: 11pt)[🧠 Siêu Tư Duy (Meta-Thinking)]
  #v(0.4em)
  #body
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
// TRANG BÌA SÁCH TẬP 1
// ═══════════════════════════════════════════════

#cover-box(
  [TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 1: HÀM SỐ],
  [Dùng Đạo Hàm để Đo Biến Thiên Cục Bộ nhằm làm chủ Đồ Thị Toàn Cục]
)

#v(1em)

#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 90%,
  )[
    #text(fill: rgb("#FBC02D").darken(30%), weight: "bold")[Lời tựa gửi các học sinh lớp 12:] \
    #v(0.3em)
    #text(style: "italic", size: 9.5pt)[
      "Các em học sinh thân mến, SGK Toán 12 thường bắt đầu chương Khảo sát hàm số bằng hàng tá các định nghĩa khô khan và phân chia thành hàng chục dạng toán khác nhau để làm trắc nghiệm. Cuốn sách này lật ngược cách tiếp cận đó. Chúng ta sẽ cùng nhau nhìn nhận mọi khái niệm như tính đơn điệu, cực trị, tiệm cận hay tương giao đồ thị thực chất chỉ là những biến thể của một ý tưởng duy nhất: dùng đạo hàm để đo tốc độ thay đổi tức thời (cục bộ) nhằm vẽ nên bức tranh toàn cảnh (toàn cục) của hàm số. Hãy cùng học toán qua lăng kính trực quan sinh động và những câu chuyện lịch sử thú vị phía sau."
    ]
  ]
]

#v(0.8em)

#outline(title: "Mục Lục Tập 1", depth: 2)

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 1: HÀM SỐ & ĐẠO HÀM - NGÔN NGỮ SỰ THAY ĐỔI
// ═══════════════════════════════════════════════
#chapter-header("1", [Hàm Số & Đạo Hàm — Ngôn Ngữ Của Sự Thay Đổi])

#philosophy-box[
  Hãy bắt đầu bằng một thực tế hiển nhiên: *Thế giới của chúng ta không bao giờ đứng yên.* Mọi thứ xung quanh ta — từ quả táo rơi khỏi cành cây, quỹ đạo bay của quả bóng pháo hoa, đến nhiệt độ thay đổi trong ngày — đều liên tục chuyển dịch theo thời gian.
  Nhưng làm thế nào để toán học chụp lại sự trôi chảy liên tục đó bằng các công cụ tĩnh? Đây là một câu hỏi triết học lớn đã thách thức trí tuệ nhân loại suốt hàng ngàn năm.
  
  *Nghịch lý mũi tên của Zeno:* Xét một mũi tên đang bay. Zeno lập luận rằng, tại mỗi thời điểm cực kỳ ngắn (một khoảnh khắc tức thời), mũi tên phải ở một vị trí cố định duy nhất. Nếu nó ở một vị trí cố định, nó không chuyển động tại thời điểm đó. Vì một khoảng thời gian dài chỉ là tổng hợp của các khoảnh khắc tức thời tĩnh lặng đó, mũi tên đáng lẽ ra không bao giờ có thể di chuyển!
  
  Nếu ta cố tính vận tốc tại một khoảnh khắc bằng cách chia quãng đường cho thời gian ($v = Delta s / Delta t$), ta rơi vào ngõ cụt tại khoảnh khắc tức thời ($Delta t = 0$), nơi biểu thức sụp đổ thành dạng vô định $0/0$.
  
  *Những người đặt nền móng:* 
  Để giải quyết bế tắc này, vào thế kỷ 17, hai nhà toán học vĩ đại đã độc lập phát minh ra phép tính vi phân:
  - *Isaac Newton* (Anh): Xuất phát từ nhu cầu vật lý, tính toán quỹ đạo của các hành tinh quanh Mặt Trời. Ông coi các đại lượng là "dòng chảy" liên tục.
  - *Gottfried Leibniz* (Đức): Xuất phát từ nhu cầu hình học tìm tiếp tuyến của đường cong. Ông đã nghĩ ra ký hiệu vi phân $d y / d x$ tuyệt đẹp — mô phỏng tỉ số $Delta y / Delta x$ khi khoảng chia co lại vô cùng nhỏ.
  
  Tuy nhiên, họ đã dùng các khái niệm mơ hồ như "vô cùng bé" (đại lượng lớn hơn 0 nhưng nhỏ hơn mọi số thực dương). Điều này dẫn đến sự phản kháng mạnh mẽ từ nhà triết học và Giám mục *George Berkeley*. Ông đã chế giễu các vô cùng bé là *"bóng ma của các đại lượng đã mất"*.
  
  Mâu thuẫn triết học này chỉ được giải quyết triệt để vào thế kỷ 19 nhờ *Cauchy và Weierstrass* khi họ định nghĩa khái niệm *Giới hạn (Limit)* một cách chặt chẽ. Ta không tính vận tốc tại điểm có độ dài thời gian bằng đúng 0. Thay vào đó, ta tính vận tốc trung bình trên một khoảng thời gian ngắn $h$, rồi quan sát xem tỉ số này hội tụ về con số cố định nào khi cho $h$ tiến sát về $0$ ($h arrow.r 0$). Đạo hàm chính là giới hạn đó.
]

#v(0.8em)

#visual-box[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      *Nguyên lý phóng to đồ thị (Tính trơn phẳng):*
      Hãy vẽ một đường cong mịn $y = f(x)$ trên giấy. Nếu ta dùng một chiếc kính hiển vi siêu việt phóng to đồ thị xung quanh một điểm $P$ lên hàng triệu lần, ta sẽ thấy đường cong dần phẳng ra. Đến một mức độ nào đó, nó trùng khít với đường tiếp tuyến đi qua điểm đó.
      
      Độ dốc (hệ số góc) của tiếp tuyến phẳng này chính là giá trị *Đạo hàm* của hàm số tại điểm đó:
      - Đạo hàm dương ($f'(x) > 0$): Tiếp tuyến dốc lên, đồ thị đi lên.
      - Đạo hàm âm ($f'(x) < 0$): Tiếp tuyến dốc xuống, đồ thị đi xuống.
      - Đạo hàm bằng 0 ($f'(x) = 0$): Tiếp tuyến nằm ngang, trạng thái tĩnh lặng.
    ],
    [
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          line((-1.5, 0), (2.2, 0), mark: (end: ">"), stroke: 0.5pt + gray)
          line((0, -0.8), (0, 2.2), mark: (end: ">"), stroke: 0.5pt + gray)
          
          let pts = ()
          for i in range(21) {
            let x = -1.2 + i * 0.12
            let y = 0.5 * (x + 0.2) * (x + 0.2) + 0.3 * x + 0.5
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-indigo)
          
          let px = 0.5
          let py = 0.5 * (px + 0.2) * (px + 0.2) + 0.3 * px + 0.5
          circle((px, py), radius: 2.2pt, fill: c-red)
          
          circle((px, py), radius: 0.8, stroke: (paint: c-teal, thickness: 1.2pt))
          line((px + 0.5, py - 0.5), (px + 1.2, py - 1.2), stroke: 1.5pt + c-teal)
          
          rect((1.8, -0.9), (3.8, 1.1), fill: rgb("#EAF4F4"), stroke: 1pt + c-teal, radius: 3pt)
          line((2.0, -0.6), (3.6, 0.8), stroke: 1.8pt + c-red)
          circle((2.8, 0.1), radius: 3pt, fill: c-red)
        })
      ]
    ]
  )
  
  *Điểm không khả vi (Điểm gãy):* Tuy nhiên, không phải mọi đường cong đều trơn phẳng. Nếu ta phóng to đồ thị hàm số $y = |x|$ tại gốc tọa độ $x=0$, cho dù phóng to bao nhiêu lần, ta vẫn luôn thấy một góc nhọn $90^degree$ chứ không phẳng ra. Hàm số không có tiếp tuyến duy nhất và không khả vi tại đây.
]

#v(0.8em)

#structure-box[
  *TỪ THAY ĐỔI CỤC BỘ ĐẾN HÀNH VI TOÀN CỤC*
  
  Ý tưởng cốt lõi của đạo hàm rất đơn giản: *Nếu ta biết tiếp tuyến tại mỗi điểm đơn lẻ trên đồ thị đang dốc lên hay dốc xuống (cục bộ), ta hoàn toàn vẽ được toàn bộ hình dáng tăng giảm của hàm số trên một khoảng lớn (toàn cục).*
  
  Đạo hàm chính là chiếc ống kính vĩ mô giúp ta nhìn thấu hành vi của hàm số mà không cần phải tính toán từng điểm một cách mò mẫm.
]

#v(0.8em)

#technique-box[
  *Ý nghĩa hình học của đạo hàm phổ thông:*
  - Giới hạn tỉ số biến thiên:
    $ f'(x_0) = lim_(x -> x_0) frac(f(x) - f(x_0), x - x_0) $
  - Phương trình tiếp tuyến của đồ thị hàm số tại điểm $M(x_0; y_0)$ là:
    $ y = f'(x_0)(x - x_0) + y_0 $
]

#v(0.8em)

#explain-box(1, [Tuyến tính hóa tiếp tuyến để tính nhẩm gần đúng], [
  *Bài toán:* Hãy tính gần đúng giá trị của $sqrt(9.06)$ và $(1.02)^5$ mà không dùng máy tính cầm tay.
  
  *Cách giải "Diệt Ruồi" (Học vẹt công thức):* Học sinh cố nhớ công thức vi phân $f(x_0+Delta x) approx f(x_0) + f'(x_0)Delta x$ một cách máy móc, rất dễ nhầm lẫn các kí hiệu $Delta x$ và $d x$.
  
  *Góc nhìn "Đại Bác" (Thay đường cong bằng tiếp tuyến thẳng):* 
  
  - *Ý 1: Tính $sqrt(9.06)$*
    Đặt hàm số $f(x) = sqrt(x)$. Ta chọn điểm mốc "đẹp" gần nhất là $x_0 = 9$ (vì $sqrt(9) = 3$ rất dễ tính) và độ lệch nhỏ $h = 0.06$.
    Tiếp tuyến của đồ thị tại điểm $x_0 = 9$ có hệ số góc là đạo hàm:
    $ f'(x) = 1 / (2sqrt(x)) => f'(9) = 1 / (2sqrt(9)) = 1/6 $
    Tại khoảng cách vô cùng gần mốc $x_0 = 9$, giá trị trên đường cong gần trùng khít với giá trị trên tiếp tuyến:
    $ sqrt(9.06) approx f(9) + f'(9) dot.c h = 3 + 1/6 dot.c 0.06 = 3 + 0.01 = 3.01 $
    *(Giá trị bấm máy tính là $3.0100$ - sai số cực kỳ nhỏ!)*.

  - *Ý 2: Tính $(1.02)^5$*
    Đặt hàm số $f(x) = x^5$, điểm mốc $x_0 = 1$ và độ lệch $h = 0.02$.
    Đạo hàm: $f'(x) = 5x^4 => f'(1) = 5$.
    Tiếp tuyến thẳng xấp xỉ cung cong:
    $ (1.02)^5 approx f(1) + f'(1) dot.c h = 1^5 + 5 dot.c 0.02 = 1.10 $
    *(Giá trị thực tế là $1.10408$ - sai số cực nhỏ $0.004$)*.
])

#v(0.8em)

#explain-box(2, [Chứng minh bất đẳng thức bằng vận tốc tăng trưởng], [
  *Bài toán:* Chứng minh rằng với mọi $x > 0$, ta luôn có:
  1. $sin(x) < x$.
  2. $ln(1 + x) > x - x^2/2$.
  
  *Góc nhìn "Đại Bác":* Xem xét bất đẳng thức như một cuộc đua đường trường. Hai người cùng xuất phát tại một điểm. Nếu người A luôn có vận tốc tức thời lớn hơn người B tại mọi thời điểm tiếp theo, thì người A chắc chắn sẽ chạy xa hơn người B.
  
  - *Ý 1: Chứng minh $sin(x) < x$*
    Xét hàm hiệu: $h(x) = x - sin(x)$.
    - Tại điểm xuất phát $x = 0$: $h(0) = 0 - sin(0) = 0$.
    - Vận tốc tức thời (đạo hàm) của hàm hiệu: $h'(x) = 1 - cos(x)$.
    Vì $cos(x) <= 1$ với mọi $x$, nên $h'(x) >= 0$ với mọi $x$. Hơn nữa, $h'(x) = 0$ chỉ xảy ra tại các điểm cô lập $x = 2k pi$.
    Do đó, hàm hiệu $h(x)$ luôn đi lên (đồng biến) với mọi $x > 0$.
    Vì thế, với mọi $x > 0 => h(x) > h(0) => x - sin(x) > 0 => sin(x) < x$.

  - *Ý 2: Chứng minh $ln(1+x) > x - x^2/2$*
    Xét hàm hiệu: $g(x) = ln(1+x) - (x - x^2/2)$.
    - Tại điểm xuất phát $x = 0$: $g(0) = ln(1) - (0 - 0) = 0$.
    - Vận tốc tức thời:
      $ g'(x) = 1 / (1+x) - (1 - x) = 1 / (1+x) - (1 - x^2) / (1+x) = x^2 / (1+x) $
    Với mọi $x > 0$, rõ ràng ta có $g'(x) > 0$ (vận tốc tức thời luôn dương).
    Vì hàm hiệu luôn đi lên với mọi $x > 0$, ta suy ra: $g(x) > g(0) = 0 => ln(1+x) > x - x^2/2$.
])

#v(0.8em)

#explain-box(10, [Tiếp tuyến song song/vuông góc với đường thẳng cho trước], [
  *Bài toán:* Cho hàm số $y = frac(2x - 1, x + 1)$ có đồ thị là $(C)$. Tìm phương trình tiếp tuyến của đồ thị $(C)$ biết tiếp tuyến đó vuông góc với đường thẳng $d: y = -3x + 4$.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường nhớ máy móc công thức $k_1 dot.c k_2 = -1$ và áp dụng công thức tiếp tuyến $y = f'(x_0)(x - x_0) + y_0$. Tuy nhiên, các em rất dễ quên điều kiện xác định của tiếp điểm ($x_0 != -1$) và tính toán nhầm hệ số góc $f'(x_0)$, dẫn đến kết quả sai lệch mà không tự phát hiện được.

  *Góc nhìn "Đại Bác" (Trực giác xoay góc):* Hệ số góc của một đường thẳng biểu diễn độ dốc của nó. Nếu đường thẳng $d$ dốc xuống với hệ số góc $k_d = -3$, thì đường tiếp tuyến vuông góc với nó phải dốc lên. Góc giữa hai đường là $90^degree$ dẫn đến tích hệ số góc của chúng bằng $-1$.
  Do đó, việc tìm tiếp điểm quy về việc giải phương trình đạo hàm bằng đúng độ dốc vuông góc:
  $ f'(x_0) = -frac(1, k_d) = 1/3 $

  *Lời giải chi tiết:*
  - Tập xác định: $D = RR  backslash  {-1}$.
  - Đạo hàm của hàm số:
    $ y' = frac(2(x+1) - (2x-1) dot.c 1, (x+1)^2) = frac(3, (x+1)^2) $
  - Đường thẳng $d$ có hệ số góc $k_d = -3$. Vì tiếp tuyến $Delta$ vuông góc với $d$, nên hệ số góc $k$ của tiếp tuyến là:
    $ k = -1 / k_d = 1/3 $
  - Gọi $M(x_0; y_0)$ là tiếp điểm của đồ thị $(C)$. Ta giải phương trình tìm hoành độ tiếp điểm $x_0$:
    $ y'(x_0) = 1/3 <=> frac(3, (x_0+1)^2) = 1/3 <=> (x_0+1)^2 = 9 $
    $ <=> hoac(x_0 + 1 = 3, x_0 + 1 = -3) <=> hoac(x_0 = 2, x_0 = -4)  quad " (thỏa mãn điều kiện) " $
    - Với $x_0 = 2 => y_0 = frac(2(2)-1, 2+1) = 1$. Phương trình tiếp tuyến là:
      $ y = 1/3 (x - 2) + 1 <=> y = 1/3 x + 1/3 $
    - Với $x_0 = -4 => y_0 = frac(2(-4)-1, -4+1) = 3$. Phương trình tiếp tuyến là:
      $ y = 1/3 (x + 4) + 3 <=> y = 1/3 x + 13/3 $

  *Bẫy thường gặp:* Hãy cẩn thận khi đề bài cho tiếp tuyến *song song* với đường thẳng $d$. Lúc đó hệ số góc $k = k_d$. Tuy nhiên, sau khi viết xong phương trình tiếp tuyến, em bắt buộc phải đối chiếu xem phương trình tiếp tuyến vừa tìm được có trùng khít với đường thẳng $d$ hay không. Nếu trùng thì phải loại bỏ vì song song không được trùng!
])

#v(0.8em)

#explain-box(11, [Tiếp tuyến đi qua một điểm nằm ngoài đồ thị], [
  *Bài toán:* Cho hàm số $y = -x^3 + 3x^2 - 2$ có đồ thị $(C)$. Viết phương trình tiếp tuyến của đồ thị $(C)$ đi qua điểm $A(2; 2)$.

  *Lối mòn tư duy (Lối giải học vẹt):* Lỗi sai kinh điển của học sinh là thay ngay tọa độ điểm $A(2; 2)$ vào vị trí của tiếp điểm: viết $y = y'(2)(x-2) + y(2)$. Các em cần nhớ rằng $A(2;2)$ chỉ là một điểm thuộc đường tiếp tuyến chứ không phải là tiếp điểm nằm trên đồ thị!

  *Góc nhìn "Đại Bác" (Hệ phương trình tiếp xúc):* Bản chất của tiếp tuyến $Delta$ đi qua $A(2;2)$ là một đường thẳng xoay quanh điểm $A$ với hệ số góc $k$ chưa biết: $y = k(x-2) + 2$.
  Để đường thẳng này tiếp xúc với đồ thị $(C)$ tại tiếp điểm có hoành độ $x_0$, hai đồ thị phải có cùng giá trị và cùng độ dốc tại điểm đó. Điều này tương đương với hệ phương trình tiếp xúc sau:
  $ cases(-x^3 + 3x^2 - 2 = k(x-2) + 2  quad (1), -3x^2 + 6x = k  quad (2)) $
  Bằng cách thế (2) vào (1), ta sẽ tìm được trực tiếp hoành độ các tiếp điểm.

  *Lời giải chi tiết:*
  Thế hệ số góc $k$ từ phương trình (2) vào phương trình (1), ta được:
  $ -x^3 + 3x^2 - 2 = (-3x^2 + 6x)(x-2) + 2 $
  $ <=> -x^3 + 3x^2 - 2 = -3x^3 + 12x^2 - 12x + 2 $
  $ <=> 2x^3 - 9x^2 + 12x - 4 = 0 $
  Nhẩm nghiệm ta thấy $x=2$ là một nghiệm của phương trình. Phân tích nhân tử bằng sơ đồ Horner hoặc chia đa thức:
  $ (x-2)(2x^2 - 5x + 2) = 0 <=> (x-2)^2 (2x - 1) = 0 $
  $ <=> hoac(x = 2, x = 1/2) $
  - Với $x = 2 => k = -3(2)^2 + 6(2) = 0$. Phương trình tiếp tuyến là:
    $ y = 0(x-2) + 2 <=> y = 2 $
  - Với $x = 1/2 => k = -3(1/2)^2 + 6(1/2) = 9/4$. Phương trình tiếp tuyến là:
    $ y = 9/4 (x-2) + 2 <=> y = 9/4 x - 5/2 $

  *Bẫy thường gặp:* Phải phân biệt rõ từ ngữ trong đề bài: tiếp tuyến *tại* điểm $M$ (khi đó $M$ chính là tiếp điểm) và tiếp tuyến *đi qua* hoặc *kẻ từ* điểm $A$ (khi đó $A$ nằm ngoài đồ thị, bắt buộc dùng hệ phương trình tiếp xúc).
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 1:*
  Giải tích phổ thông thực chất là nghệ thuật *phẳng hóa thế giới cong*. Chúng ta thay thế một đường cong cong phức tạp bằng một đường thẳng tiếp tuyến đơn giản tại một khoảng vi mô cực nhỏ. Mọi công thức tính toán sau này đều bắt nguồn từ nguyên lý cơ bản này.
]

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 2: TÍNH ĐƠN ĐIỆU - DÒNG CHẢY CỦA TIẾP TUYẾN
// ═══════════════════════════════════════════════
#chapter-header("2", [Tính Đơn Điệu — Dòng Chảy Của Tiếp Tuyến])

#philosophy-box[
  *Nhu cầu thực tế:* 
  Làm thế nào để dự đoán xu hướng tương lai của một đại lượng (như nhiệt độ, kinh tế) chỉ dựa trên thông tin vận tốc ở hiện tại?
  
  *Người đặt nền móng:*
  Nhà toán học vĩ đại *Joseph-Louis Lagrange* đã chứng minh *Định lý giá trị trung bình* (Mean Value Theorem - MVT).
  
  Hãy tưởng tượng một câu chuyện thực tế ở thời hiện đại: Bạn lái xe trên đường cao tốc có giới hạn tốc độ là 120 km/h. Trạm thu phí A ghi nhận bạn vào lúc 8:00. Trạm thu phí B cách đó 240 km ghi nhận bạn ra lúc 9:30. Thời gian di chuyển của bạn là 1,5 giờ.
  Vận tốc trung bình của bạn là: $240 / 1.5 = 160$ km/h.
  Dù bạn có cãi với cảnh sát giao thông rằng "tôi chưa từng nhìn thấy kim đồng hồ chỉ quá 120 km/h", cảnh sát chỉ cần áp dụng Định lý Lagrange để khẳng định: chắc chắn có ít nhất một khoảnh khắc trên đường đi, kim đồng hồ tốc độ của bạn đã chỉ đúng 160 km/h. Và thế là bạn bị phạt!
  
  Định lý Lagrange chỉ ra rằng: trên một đoạn đường đi liên tục và có đạo hàm, vận tốc tức thời tại một điểm trung gian $c$ nào đó bắt buộc phải bằng đúng vận tốc trung bình trên cả đoạn:
  $ f(x_2) - f(x_1) = f'(c) (x_2 - x_1) $
  Nếu đạo hàm $f'(x) > 0$ trên cả khoảng, thì hiệu số đầu ra $f(x_2) - f(x_1)$ luôn cùng dấu với hiệu số đầu vào $x_2 - x_1$, nghĩa là hàm số đồng biến toàn cục.
]

#v(0.8em)

#visual-box[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      *Trực giác về cát tuyến và tiếp tuyến:*
      Đường cát tuyến nối hai đầu mút $A(x_1, f(x_1))$ và $B(x_2, f(x_2))$ thể hiện vận tốc trung bình của cả quá trình. 
      Định lý Lagrange khẳng định: trên cung cong $A B$, bắt buộc phải có ít nhất một điểm trung gian $C(c, f(c))$ mà tiếp tuyến tại đó song song hoàn hảo với đường cát tuyến $A B$.
      
      Dấu đạo hàm dương ($f'(x) > 0$) nghĩa là mọi tiếp tuyến đều hướng lên, kéo theo cát tuyến nối hai điểm bất kỳ cũng phải hướng lên (đồng biến).
    ],
    [
      #align(center)[
        #canvas(length: 1.1cm, {
          import draw: *
          line((-0.5, 0), (4.0, 0), stroke: 0.5pt + gray)
          line((0, -0.5), (0, 3.0), stroke: 0.5pt + gray)
          
          let pts = ()
          for i in range(21) {
            let x = 0.5 + i * 0.15
            let y = 0.8 + 1.2 * calc.sin(x * 0.9)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-indigo)
          
          let x1 = 0.8
          let y1 = 0.8 + 1.2 * calc.sin(x1 * 0.9)
          let x2 = 3.2
          let y2 = 0.8 + 1.2 * calc.sin(x2 * 0.9)
          
          circle((x1, y1), radius: 2pt, fill: c-royal-blue)
          circle((x2, y2), radius: 2pt, fill: c-royal-blue)
          line((x1, y1), (x2, y2), stroke: (paint: c-red, thickness: 1pt, dash: "dashed"))
          
          let slope = (y2 - y1) / (x2 - x1)
          let cx = 1.95
          let cy = 0.8 + 1.2 * calc.sin(cx * 0.9)
          circle((cx, cy), radius: 2pt, fill: c-teal)
          line((cx - 0.8, cy - 0.8 * slope), (cx + 0.8, cy + 0.8 * slope), stroke: 1.5pt + c-teal)
        })
      ]
    ]
  )
]

#v(0.8em)

#structure-box[
  *ĐỊNH LÝ VỀ DẤU ĐẠO HÀM VÀ TÍNH ĐƠN ĐIỆU PHỔ THÔNG*
  
  Cho hàm số $f(x)$ có đạo hàm trên khoảng $K$:
  - Nếu $f'(x) > 0$ với mọi $x in K$ thì hàm số đồng biến trên $K$.
  - Nếu $f'(x) < 0$ với mọi $x in K$ thì hàm số nghịch biến trên $K$.
  - Mở rộng: Nếu $f'(x) >= 0$ (hoặc $f'(x) <= 0$) và phương trình $f'(x) = 0$ chỉ xảy ra tại một số hữu hạn điểm rời rạc thì hàm số vẫn đồng biến (hoặc nghịch biến) trên $K$.
]

#v(0.8em)

#technique-box[
  *Quy trình xét tính đơn điệu:*
  1. Tìm tập xác định.
  2. Tính đạo hàm $f'(x)$, tìm các nghiệm của phương trình $f'(x) = 0$ hoặc các điểm đạo hàm không xác định.
  3. Lập bảng xét dấu đạo hàm (hoặc bảng biến thiên).
  4. Đọc khoảng đồng biến, nghịch biến dựa trên dấu của đạo hàm.
]

#v(0.8em)

#explain-box(3, [Tìm tham số m để hàm số đơn điệu trên khoảng], [
  *Bài toán:* Tìm tất cả các giá trị của tham số $m$ để hàm số bậc ba sau đây đồng biến trên khoảng $(2; +oo)$:
  $ y = x^3 - 3m x^2 + 3(m^2-1)x + 2 $
  
  *Cách giải "Diệt Ruồi" (Cô lập m máy móc):* Học sinh thường vội vàng cô lập tham số $m$ sang một vế rồi lập bảng biến thiên cho hàm số phụ chứa căn thức hoặc phân thức phức tạp, dẫn đến tính toán cực kỳ rườm rà và dễ sai sót.
  
  *Góc nhìn "Đại Bác" (Tư duy vị trí nghiệm):* Đánh giá trực tiếp mối liên hệ giữa các nghiệm của đạo hàm và khoảng yêu cầu của đề bài.
  
  Ta tính đạo hàm:
  $ y' = 3x^2 - 6m x + 3(m^2-1) = 3[x^2 - 2m x + (m^2-1)] $
  Nhận xét biểu thức trong ngoặc là một tam thức bậc hai có thể phân tích thành nhân tử rất đẹp:
  $ y' = 3(x - m - 1)(x - m + 1) $
  Phương trình đạo hàm $y' = 0$ luôn có hai nghiệm phân biệt:
  $ x_1 = m - 1  quad "và" quad  x_2 = m + 1 $
  Vì $m - 1 < m + 1$ với mọi $m$, bảng xét dấu đạo hàm cho thấy:
  - Hàm số đồng biến trên các khoảng: $(-oo; m-1)$ và $(m+1; +oo)$.
  - Hàm số nghịch biến trên khoảng: $(m-1; m+1)$.
  
  Để hàm số đồng biến trên khoảng $(2; +oo)$, thì khoảng $(2; +oo)$ bắt buộc phải nằm hoàn toàn bên trong khoảng đồng biến của hàm số.
  Vì khoảng $(2; +oo)$ kéo dài tới $+oo$, nó chỉ có thể là tập con của khoảng đồng biến bên phải:
  $ (2; +oo) subset (m + 1; +oo) $
  Điều này xảy ra khi và chỉ khi biên dưới của khoảng đồng biến nằm bên trái hoặc trùng với biên dưới của khoảng yêu cầu:
  $ m + 1 <= 2 <=> m <= 1 $
  
  *Kết luận:* Các giá trị tham số cần tìm là $m <= 1$.
])

#v(0.8em)

#explain-box(12, [Tính đơn điệu của hàm phân thức bậc nhất chứa tham số], [
  *Bài toán:* Tìm tất cả các giá trị thực của tham số $m$ để hàm số $y = frac(m x - 4, x - m)$ đồng biến trên khoảng $(1; +oo)$.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường nhớ ngay công thức đạo hàm nhanh $a d - b c > 0$ của hàm phân thức bậc nhất để giải:
  $ y' = frac(-m^2 + 4, (x-m)^2) > 0 <=> 4 - m^2 > 0 <=> -2 < m < 2 $
  Và vội vàng kết luận đây là đáp án cuối cùng. Đây là một lỗi sai chí mạng vì học sinh đã quên mất điều kiện xác định của hàm phân thức.

  *Góc nhìn "Đại Bác" (Trực giác về sự đứt gãy):* Đồ thị của hàm số phân thức bậc nhất là một hyperbol gồm hai nhánh tách rời bởi đường tiệm cận đứng $x = m$ (điểm gián đoạn của đồ thị).
  Nếu điểm gián đoạn $x = m$ nằm lọt vào giữa khoảng $(1; +oo)$, đồ thị sẽ bị đứt gãy thành hai nhánh riêng biệt, khiến hàm số không thể đồng biến liên tục trên khoảng này.
  Do đó, để hàm số đồng biến liên tục trên khoảng $(1; +oo)$, ta cần đồng thời hai điều kiện:
  1. Đạo hàm phải luôn dương trên từng khoảng xác định.
  2. Tiệm cận đứng $x = m$ không được phép thuộc khoảng đang xét: $m in.not (1; +oo) <=> m <= 1$.

  *Lời giải chi tiết:*
  - Tập xác định: $D = RR  backslash  {m}$.
  - Đạo hàm của hàm số:
    $ y' = frac(m dot.c (-m) - 1 dot.c (-4), (x-m)^2) = frac(4 - m^2, (x-m)^2) $
  - Để hàm số đồng biến trên khoảng $(1; +oo)$, ta cần:
    $ cases(y' > 0  quad forall x in (1; +oo), m in.not (1; +oo)) <=> cases(4 - m^2 > 0, m <= 1) $
    $ <=> cases(-2 < m < 2, m <= 1) <=> -2 < m <= 1 $

  *Bẫy thường gặp:* Hãy nhớ rằng đối với hàm phân thức bậc nhất / bậc nhất, đạo hàm $y'$ *không bao giờ* được phép bằng 0 (vì khi tử số của đạo hàm bằng 0, hàm số trở thành hàm hằng, đồ thị là một đường thẳng nằm ngang). Do đó ta chỉ xét $y' > 0$ hoặc $y' < 0$, tuyệt đối không lấy dấu bằng "$>=$" như hàm đa thức.
])

#v(0.8em)

#explain-box(13, [Tính đơn điệu của hàm số chứa dấu giá trị tuyệt đối], [
  *Bài toán:* Cho hàm số $f(x) = x^3 - 3x^2 + m$. Tìm tất cả các giá trị của tham số $m$ để hàm số $y = |x^3 - 3x^2 + m|$ đồng biến trên khoảng $(0; 2)$.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường lúng túng tìm cách chia khoảng để phá dấu giá trị tuyệt đối, dẫn đến một hệ bất phương trình chứa tham số vô cùng phức tạp và dễ nhầm lẫn.

  *Góc nhìn "Đại Bác" (Trực giác lật đồ thị):* Đồ thị của hàm số $y = |g(x)|$ được tạo ra bằng cách giữ nguyên phần đồ thị $g(x)$ nằm phía trên trục hoành, và lật ngược phần nằm phía dưới trục hoành lên trên.
  Để một đồ thị sau khi lật ngược vẫn đi lên (đồng biến) trên một khoảng $K$, ta chỉ có hai trường hợp xảy ra:
  - *Trường hợp 1 (Đã lên còn dương):* Hàm số $g(x)$ vốn dĩ nằm trên trục hoành và đang đi lên:
    $ cases(g(x) >= 0  quad forall x in K, g'(x) >= 0  quad forall x in K) $
  - *Trường hợp 2 (Đang xuống mà âm):* Hàm số $g(x)$ nằm dưới trục hoành và đang đi xuống (để khi lật ngược lên trên, đồ thị sẽ chuyển từ đi xuống thành đi lên):
    $ cases(g(x) <= 0  quad forall x in K, g'(x) <= 0  quad forall x in K) $

  *Lời giải chi tiết:*
  Xét hàm số lõi $g(x) = x^3 - 3x^2 + m$ trên khoảng $(0; 2)$.
  Đạo hàm: $g'(x) = 3x^2 - 6x = 3x(x-2)$.
  Nhận xét: Với mọi $x in (0; 2)$, ta luôn có $g'(x) < 0$. Do đó hàm số lõi $g(x)$ luôn nghịch biến trên khoảng $(0; 2)$.
  Vì $g'(x) < 0$ nên ta chỉ có thể rơi vào *Trường hợp 2* (hàm số âm và nghịch biến).
  Ta cần có:
  $ g(x) <= 0  quad forall x in (0; 2) $
  Vì hàm số $g(x)$ nghịch biến (đi xuống) trên đoạn $[0; 2]$, nên giá trị lớn nhất của nó đạt được tại đầu mút bên trái là $x = 0$.
  Để hàm số luôn nhỏ hơn hoặc bằng 0 trên cả khoảng, ta chỉ cần giá trị lớn nhất của nó không vượt quá 0:
  $ max_([0;2]) g(x) = g(0) <= 0 <=> m <= 0 $

  *Kết luận:* Các giá trị tham số cần tìm là $m <= 0$.

  *Bẫy thường gặp:* Khi so sánh giá trị hàm số với 0 ở các đầu mút, học sinh thường lúng túng không biết chọn đầu mút nào. Hãy vẽ phác một mũi tên đi xuống (đại diện cho hàm nghịch biến). Rõ ràng điểm cao nhất của mũi tên nằm ở đầu bên trái (tại $x=0$), do đó ta chỉ cần khóa điểm cao nhất này dưới trục hoành ($g(0) <= 0$).
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 2:*
  Khi giải các bài toán chứa tham số, đừng vội vàng cô lập tham số một cách mù quáng. Hãy luôn phân tích đạo hàm trước. Nếu phương trình đạo hàm có nghiệm đẹp, việc so sánh vị trí tương đối giữa các nghiệm này và khoảng yêu cầu trên trục số luôn là con đường nhanh nhất và an toàn nhất.
]

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 3: CỰC TRỊ & BÀI TOÁN TỐI ƯU HÓA
// ═══════════════════════════════════════════════
#chapter-header("3", [Cực Trị & Bài Toán Tối Ưu Hóa])

#philosophy-box[
  *Nhu cầu thực tế:* 
  Làm sao để thiết kế một hộp chứa đồ có thể tích lớn nhất từ một lượng nguyên liệu tối thiểu?
  
  *Người đặt nền móng:*
  Nhà toán học người Pháp *Pierre de Fermat* chính là người đầu tiên tìm ra phương pháp xác định cực trị (đỉnh dốc và đáy dốc) từ trước khi Newton và Leibniz sinh ra!
  
  Fermat quan sát thấy một hiện tượng kỳ lạ: tại đỉnh của một đường cong trơn, nếu ta dịch chuyển đầu vào đi một lượng cực kỳ nhỏ $E$, thì giá trị đầu ra hầu như không thay đổi ($f(x) approx f(x+E)$). Ông thiết lập phương trình $f(x) = f(x+E)$, rút gọn rồi cho $E = 0$. Phương pháp này chính là tiền thân của việc giải phương trình đạo hàm bằng 0 ($f'(x) = 0$) để tìm điểm dừng cực trị ngày nay.
]

#v(0.8em)

#visual-box[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      *Đặc trưng hình học của cực trị:*
      - *Điểm Cực đại (Đỉnh dốc):* Tiếp tuyến nằm ngang ($f'(x_0) = 0$), đạo hàm đổi dấu từ dương ($+$) sang âm ($-$) khi qua điểm đó.
      - *Điểm Cực tiểu (Đáy dốc):* Tiếp tuyến nằm ngang ($f'(x_0) = 0$), đạo hàm đổi dấu từ âm ($-$) sang dương ($+$) khi qua điểm đó.
      
      *Cực trị tại điểm gãy:* Lưu ý rằng điểm cực trị hoàn toàn có thể xảy ra tại điểm đạo hàm không tồn tại (như đáy của chữ V đồ thị $y = |x|$ tại $x=0$). Chỉ cần hàm số liên tục và đạo hàm đổi dấu khi đi qua điểm đó, điểm đó vẫn là điểm cực trị.
    ],
    [
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          line((-0.5, 0), (4.0, 0), stroke: 0.5pt + gray)
          line((0, -0.5), (0, 3.0), stroke: 0.5pt + gray)
          
          let pts = ()
          for i in range(21) {
            let x = 0.5 + i * 0.15
            let y = 1.5 + 1.1 * calc.sin(x * 1.5 - 1.0)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-indigo)
          
          let ctx = 1.7
          let cty = 1.5 + 1.1 * calc.sin(ctx * 1.5 - 1.0)
          circle((ctx, cty), radius: 2pt, fill: c-green)
          line((ctx - 0.7, cty), (ctx + 0.7, cty), stroke: 1.2pt + c-green)
          content((ctx, cty - 0.4), [Cực tiểu])
          
          let cdx = 3.8
          let cdy = 1.5 + 1.1 * calc.sin(cdx * 1.5 - 1.0)
          circle((cdx, cdy), radius: 2pt, fill: c-red)
        })
      ]
    ]
  )
]

#v(0.8em)

#structure-box[
  *CÂN BẰNG CẬN BIÊN TRONG TỐI ƯU HÓA*
  
  Mọi bài toán tối ưu hóa trong đời sống thực tế đều là sự đấu tranh giữa hai xu hướng đối nghịch:
  - Một xu hướng làm lợi cho đại lượng cần tối ưu.
  - Một xu hướng làm hại cho đại lượng đó.
  
  Điểm tối ưu hoàn hảo (cực trị) là điểm thăng bằng cận biên, nơi tốc độ thay đổi của hai xu hướng triệt tiêu lẫn nhau hoàn toàn (đạo hàm bằng 0).
]

#v(0.8em)

#technique-box[
  *Hai quy tắc tìm cực trị phổ thông:*
  - *Quy tắc 1 (Xét dấu đạo hàm):* Lập bảng xét dấu của $f'(x)$. Điểm dừng nào làm $f'(x)$ đổi dấu thì đó là điểm cực trị.
  - *Quy tắc 2 (Sử dụng đạo hàm cấp hai):* Tại điểm $x_0$ thỏa mãn $f'(x_0) = 0$:
    - Nếu $f''(x_0) < 0$: Đạt cực đại tại $x_0$.
    - Nếu $f''(x_0) > 0$: Đạt cực tiểu tại $x_0$.
]

#v(0.8em)

#explain-box(4, [Thiết kế lon nước ngọt tối ưu nhôm], [
  *Bài toán:* Một nhà máy cần sản xuất các lon nước ngọt hình trụ có thể tích chứa cố định là $V$. Hãy tìm tỉ lệ giữa chiều cao $h$ và bán kính đáy $r$ của lon nước để lượng nhôm cần dùng làm vỏ lon (diện tích toàn phần) là ít nhất.
  
  *Góc nhìn "Đại Bác":* Đạo hàm chính là chiếc cán cân cận biên.
  
  Thể tích lon hình trụ: $V = pi r^2 h => h = frac(V, pi r^2)$.
  Diện tích toàn phần (2 đáy tròn và 1 thân bên):
  $ S(r) = 2 pi r^2 + 2 pi r h = 2 pi r^2 + 2 pi r dot.c frac(V, pi r^2) = 2 pi r^2 + frac(2V, r) $
  Để tìm diện tích tối thiểu, ta khảo sát tốc độ thay đổi của diện tích theo bán kính $r$:
  $ S'(r) = 4 pi r - frac(2V, r^2) $
  Đặt $S'(r) = 0$ để tìm điểm dừng tối ưu:
  $ 4 pi r = frac(2V, r^2) => 4 pi r^3 = 2 V $
  Thế biểu thức thể tích ban đầu $V = pi r^2 h$ vào:
  $ 4 pi r^3 = 2 (pi r^2 h) => 2r = h $
  
  *Kết luận:* Tỉ lệ tối ưu luôn là *chiều cao bằng đúng đường kính đáy* ($h = 2r$). Thiết kế này giúp nhà sản xuất tiết kiệm hàng triệu USD chi phí nguyên liệu vỏ lon mỗi năm.
])

#v(0.8em)

#explain-box(5, [Bài toán gập hộp giấy tối đa thể tích], [
  *Bài toán:* Từ một tấm bìa các-tông hình vuông cạnh $a$, người ta cắt bỏ 4 hình vuông nhỏ cạnh $x$ ở 4 góc rồi gập các mép lên để tạo thành một chiếc hộp không nắp. Tìm $x$ để thể tích hộp đạt giá trị lớn nhất.
  
  *Góc nhìn "Đại Bác":* Xác định điều kiện vật lý của đường cắt: $0 < x < a/2$.
  
  Chiều cao hộp là $x$, đáy hộp là hình vuông cạnh $a - 2x$.
  Thể tích hộp:
  $ V(x) = x(a - 2x)^2 = x(a^2 - 4a x + 4x^2) = 4x^3 - 4a x^2 + a^2 x $
  Tốc độ thay đổi thể tích theo nét cắt $x$:
  $ V'(x) = 12x^2 - 8a x + a^2 $
  Giải phương trình đạo hàm bằng 0:
  $ 12x^2 - 8a x + a^2 = 0 <=> (2x - a)(6x - a) = 0 $
  Phương trình cho ta hai điểm dừng: $x = a/2$ (loại vì cắt hết tấm bìa) và $x = a/6$.
  
  Ta dùng đạo hàm cấp hai để kiểm nghiệm:
  $ V''(x) = 24x - 8a => V''(a/6) = 24(a/6) - 8a = -4a < 0 $
  Vì đạo hàm cấp hai âm (đồ thị cong lõm hướng xuống), điểm dừng $x = a/6$ chắc chắn là điểm cực đại toàn cục.
  
  *Kết luận:* Điểm cắt tối ưu luôn là *bằng đúng $1/6$ độ dài cạnh tấm bìa ban đầu* ($x = a/6$).
])

#v(0.8em)

#explain-box(14, [Cực trị hàm số bậc ba chứa tham số m], [
  *Bài toán:* Cho hàm số $y = x^3 - 3m x^2 + 3(m^2 - 1)x$ có đồ thị là $(C_m)$. Tìm tất cả các giá trị của tham số $m$ để đồ thị có hai điểm cực trị $A$ và $B$ sao cho tam giác $O A B$ vuông tại $O$ (với $O$ là gốc tọa độ).

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường tính đạo hàm, thiết lập điều kiện $Delta' > 0$ để có 2 cực trị. Sau đó, tính tọa độ $A$ và $B$ theo công thức tổng quát chứa căn thức phức tạp của tham số $m$, rồi ép tích vô hướng $arrow(O A) dot.c arrow(O B) = 0$. Việc nhân các biểu thức chứa căn thức này thường là một "cơn ác mộng" đại số rất dễ dẫn đến sai sót.

  *Góc nhìn "Đại Bác" (Trực giác về nghiệm đẹp):* Trước khi dùng các công cụ cồng kềnh, hãy luôn kiểm tra xem đạo hàm của hàm số có thể phân tích thành nhân tử đẹp hay không.
  Đạo hàm:
  $ y' = 3x^2 - 6m x + 3(m^2-1) = 3[x^2 - 2m x + (m^2 - 1)] $
  Nhận xét biệt thức $Delta' = m^2 - (m^2 - 1) = 1 > 0$ là một hằng số dương đẹp đẽ!
  Do đó phương trình đạo hàm bằng 0 luôn có hai nghiệm phân biệt cực kỳ sạch sẽ:
  $ x_1 = m - 1  quad "và" quad  x_2 = m + 1 $
  Nhờ có nghiệm đẹp không chứa căn, ta dễ dàng tính tọa độ các điểm cực trị mà không cần thông qua hệ thức Vi-ét phức tạp.

  *Lời giải chi tiết:*
  - Đạo hàm: $y' = 3(x - m + 1)(x - m - 1)$.
    Vì $Delta' = 1 > 0$ với mọi $m$, nên đồ thị hàm số luôn có hai điểm cực trị với hoành độ tương ứng là $x_A = m - 1$ và $x_B = m + 1$.
  - Tính tung độ của các điểm cực trị:
    Biến đổi hàm số về dạng thuận tiện: $y = x[x^2 - 3m x + 3(m^2-1)]$.
    - Với $x_A = m - 1$:
      $ y_A = (m-1)[(m-1)^2 - 3m(m-1) + 3m^2 - 3] $
      $ y_A = (m-1)(m^2 - 2m + 1 - 3m^2 + 3m + 3m^2 - 3) = (m-1)(m^2 + m - 2) = (m-1)^2 (m+2) $
    - Với $x_B = m + 1$:
      $ y_B = (m+1)[(m+1)^2 - 3m(m+1) + 3m^2 - 3] $
      $ y_B = (m+1)(m^2 + 2m + 1 - 3m^2 - 3m + 3m^2 - 3) = (m+1)(m^2 - m - 2) = (m+1)^2 (m-2) $
  - Tọa độ hai cực trị là $A(m-1; (m-1)^2 (m+2))$ và $B(m+1; (m+1)^2 (m-2))$.
  - Để tam giác $O A B$ vuông tại $O$, ta cần tích vô hướng của hai vectơ chỉ phương bằng 0:
    $ arrow(O A) dot.c arrow(O B) = 0 <=> x_A x_B + y_A y_B = 0 $
    $ <=> (m-1)(m+1) + (m-1)^2 (m+2)(m+1)^2 (m-2) = 0 $
    $ <=> (m^2 - 1) + (m^2 - 1)^2 (m^2 - 4) = 0 $
    $ <=> (m^2 - 1) [1 + (m^2 - 1)(m^2 - 4)] = 0 $
    $ <=> (m^2 - 1)(m^4 - 5m^2 + 5) = 0 $
    $ <=> hoac(m^2 = 1, m^2 = frac(5 +- sqrt(5), 2)) $
    $ <=> m in {-1; 1; +-sqrt(frac(5 + sqrt(5), 2)); +-sqrt(frac(5 - sqrt(5), 2))} $

  *Bẫy thường gặp:* Luôn kiểm tra xem $A$ và $B$ có trùng với gốc tọa độ $O$ hay không (nếu một trong hai điểm trùng với $O$, tam giác $O A B$ không tồn tại). Ở đây, $y_A = 0 <=> m \in \{1; -2\}$ và $y_B = 0 <=> m \in \{-1; 2\}$. Các nghiệm tìm được không làm cho $A$ hoặc $B$ trùng với $O$.
])

#v(0.8em)

#explain-box(15, [Đường thẳng đi qua hai điểm cực trị hàm bậc ba], [
  *Bài toán:* Cho hàm số $y = 2x^3 - 3x^2 - 12x + 1$ có đồ thị là $(C)$. Viết phương trình đường thẳng đi qua hai điểm cực trị của đồ thị $(C)$.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường tính đạo hàm, giải phương trình $y' = 0$ để tìm tọa độ cụ thể của hai điểm cực trị $A(2; -19)$ và $B(-1; 8)$. Sau đó, áp dụng công thức viết phương trình đường thẳng đi qua hai điểm để tìm ra $y = -9x - 1$.
  Tuy nhiên, nếu đạo hàm có nghiệm xấu chứa căn thức, việc tính toán tọa độ cực trị và lập phương trình đường thẳng đi qua chúng sẽ trở nên vô cùng phức tạp và dễ tính sai.

  *Góc nhìn "Đại Bác" (Trực giác phép chia dư):* Tại sao ta phải tính tọa độ cực trị trong khi bản chất của chúng là nghiệm của đạo hàm?
  Tại các điểm cực trị, đạo hàm luôn bằng 0 ($y' = 0$).
  Nếu ta thực hiện phép chia đa thức hàm số $y$ cho đạo hàm $y'$, ta sẽ nhận được phần thương $q(x)$ và phần dư bậc nhất $r(x)$ có dạng $A x + B$:
  $ y = q(x) dot.c y' + r(x) $
  Tại tọa độ hai điểm cực trị, vì $y' = 0$ nên giá trị $y$ tương ứng luôn bằng đúng giá trị của phần dư $r(x)$.
  Điều này nghĩa là cả hai điểm cực trị đều nằm trên đường thẳng $y = r(x)$. Đường thẳng này chính là phương trình cần tìm mà không cần biết nghiệm cực trị đẹp hay xấu!

  *Lời giải chi tiết:*
  - Đạo hàm của hàm số: $y' = 6x^2 - 6x - 12$.
  - Thực hiện phép chia đa thức $y$ cho $y'$:
    Ta có:
    $ 2x^3 - 3x^2 - 12x + 1 = (1/3 x - 1/6)(6x^2 - 6x - 12) - 9x - 1 $
  - Như vậy, phần dư của phép chia là $r(x) = -9x - 1$.
  - Vì tại các điểm cực trị, ta luôn có $y' = 0$, nên tọa độ các điểm cực trị thỏa mãn phương trình:
    $ y = -9x - 1 $

  *Kết luận:* Phương trình đường thẳng đi qua hai điểm cực trị của đồ thị hàm số là $y = -9x - 1$.
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 3:*
  Điểm cực trị chính là trạng thái cân bằng hoàn hảo của tự nhiên. Tại điểm cực trị, những biến đổi nhỏ ở đầu vào hầu như không tạo ra thay đổi nào ở đầu ra (tiếp tuyến phẳng, $f'(x) = 0$). Đây là chiếc chìa khóa vạn năng để giải quyết mọi bài toán tối ưu hóa trong đời sống.
]

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 4: ĐƯỜNG TIỆM CẬN — CÁI NHÌN TỪ VÔ CỰC
// ═══════════════════════════════════════════════
#chapter-header("4", [Đường Tiệm Cận — Cái Nhìn Từ Vô Cực])

#philosophy-box[
  *Nhu cầu thực tế & Lịch sử:*
  Khi một quần thể sinh vật phát triển lâu dài trong môi trường có hạn (như đảo hoang, hồ nước), hoặc khi một lượng thuốc được hấp thụ vào máu, số lượng sinh vật hay nồng độ thuốc sẽ tiến dần về đâu theo thời gian?
  
  Nhà toán học *Pierre François Verhulst* đã đề xuất mô hình tăng trưởng Logistic vào năm 1838 để mô tả sự bão hòa dân số khi tài nguyên cạn kiệt. Đồ thị của mô hình này bám sát vào hai đường tiệm cận phẳng đại diện cho ranh giới sinh tồn của hệ thống.
  
  Đường *Tiệm cận (Asymptote)* đóng vai trò như các "đường ray dẫn hướng" của đồ thị. Khi ta phóng tầm mắt ra cực xa (vô cực) hoặc khi tiến gần đến các điểm cấm (mẫu số bằng 0), tiệm cận chính là bộ khung định hình xu hướng vĩ mô dài hạn của cả hệ thống.
]

#v(0.8em)

#visual-box[
  #grid(
    columns: (1.2fr, 1fr),
    column-gutter: 15pt,
    align: horizon,
    [
      *Hai loại ranh giới tiệm cận phổ thông:*
      - *Tiệm cận ngang (Xu hướng vĩ mô dài hạn):* Khi đầu vào $x$ tiến ra xa vô cực ($+oo$ hoặc $-oo$), đồ thị phẳng dần và bám sát đường nằm ngang $y = y_0$.
      - *Tiệm cận đứng (Bức tường ngăn cách đứng):* Khi đầu vào $x$ tiến sát điểm cấm $x_0$ (nơi mẫu số bằng 0), giá trị $y$ bùng nổ vọt lên $+oo$ hoặc rơi xuống $-oo$. Đồ thị không bao giờ vượt qua được đường thẳng $x = x_0$ này.
    ],
    [
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          line((-0.5, 0), (4.0, 0), stroke: 0.5pt + gray)
          line((0, -0.5), (0, 3.0), stroke: 0.5pt + gray)
          
          line((1.2, -0.5), (1.2, 3.0), stroke: (paint: c-red, thickness: 1pt, dash: "dashed"))
          content((1.6, 2.8), [$x = x_0$], fill: white)
          
          line((-0.5, 1.8), (4.0, 1.8), stroke: (paint: c-red, thickness: 1pt, dash: "dashed"))
          content((3.2, 2.1), [$y = y_0$])
          
          let pts = ()
          for i in range(15) {
            let x = 1.4 + i * 0.18
            let y = 1.8 + 0.3 / (x - 1.2)
            pts.push((x, y))
          }
          line(..pts, stroke: 1.5pt + c-indigo)
        })
      ]
    ]
  )
]

#v(0.8em)

#structure-box[
  *BẬC THỐNG TRỊ (TƯ DUY VĨ MÔ)*
  
  Khi tìm tiệm cận ngang ở vô cực ($x arrow.r oo$) của hàm phân thức, học sinh thường chia cả tử và mẫu cho lũy thừa cao nhất một cách máy móc. 
  
  *Trực giác "Đại Bác":* Khi $x$ tiến tới vô cực, số hạng có số mũ cao nhất (bậc thống trị) sẽ phát triển nhanh vượt trội và đè bẹp các số hạng bậc thấp hơn. Ta chỉ cần giữ lại các số hạng bậc cao nhất ở cả tử và mẫu để nhẩm nhanh giới hạn.
]

#v(0.8em)

#technique-box[
  *Quy tắc tìm tiệm cận phổ thông:*
  - Đường thẳng $y = y_0$ là tiệm cận ngang nếu:
    $ lim_(x -> +oo) f(x) = y_0  quad  "hoặc"  quad  lim_(x -> -oo) f(x) = y_0 $
  - Đường thẳng $x = x_0$ là tiệm cận đứng nếu giới hạn của hàm số tiến về vô cực khi $x$ tiến về $x_0$:
    $ lim_(x -> x_0^+) f(x) = +-oo  quad  "hoặc"  quad  lim_(x -> x_0^-) f(x) = +-oo $
]

#v(0.8em)

#explain-box(6, [Phân tích tiệm cận mô hình tăng trưởng sinh học], [
  *Bài toán:* Số lượng cá thể $P$ của một quần thể sinh vật phát triển theo thời gian $t$ (ngày) được mô tả bằng mô hình tăng trưởng Logistic:
  $ P(t) = frac(1000, 1 + 9 e^(-0.2 t)) $
  1. Tìm tiệm cận ngang của đồ thị hàm số khi $t arrow.r +oo$ và nêu ý nghĩa thực tế.
  2. Tìm thời điểm quần thể tăng trưởng nhanh nhất.
  
  *Góc nhìn "Đại Bác":* Đánh giá giới hạn ở quy mô thời gian vô hạn.
  
  - *Ý 1: Tìm tiệm cận ngang*
    Khi $t arrow.r +oo => -0.2 t arrow.r -oo => e^(-0.2 t) arrow.r 0$.
    Mẫu số tiến về: $1 + 9 dot.c 0 = 1$.
    Giới hạn vĩ mô của dân số quần thể:
    $ lim_(t arrow.r +oo) P(t) = frac(1000, 1) = 1000 $
    Đường thẳng $P = 1000$ là tiệm cận ngang của đồ thị hàm số.
    
    *Ý nghĩa sinh học:* Hằng số $K = 1000$ đại diện cho *sức chứa tối đa của môi trường* (Carrying capacity). Đà tăng trưởng của sinh vật sẽ bị bão hòa bởi giới hạn thức ăn, không gian sống và tiệm cận về mức tối đa này.

  - *Ý 2: Thời điểm tăng trưởng nhanh nhất*
    Hàm Logistic có phương trình vi phân tốc độ tăng trưởng là:
    $ P'(t) = 0.2 P(t) (1 - frac(P(t), 1000)) $
    Biểu thức tốc độ tăng trưởng là một parabol hướng xuống theo biến $P$. Tốc độ đạt cực đại tại đỉnh của parabol:
    $ P = frac(1000, 2) = 500 $
    Để tìm thời điểm $t$, ta giải phương trình $P(t) = 500$:
    $ frac(1000, 1 + 9 e^(-0.2 t)) = 500 <=> 1 + 9 e^(-0.2 t) = 2 <=> e^(-0.2 t) = 1/9 $
    $ -0.2 t = ln(1/9) = -ln(9) => t = 5 ln(9) approx 11 " (ngày)" $
    Đây chính là *Điểm uốn* của đồ thị, nơi quần thể chuyển từ giai đoạn tăng tốc sang giai đoạn giảm tốc để bão hòa bám tiệm cận.
])

#v(0.8em)

#explain-box(16, [Đường tiệm cận của hàm số chứa căn thức phức tạp], [
  *Bài toán:* Tìm tất cả các đường tiệm cận ngang và tiệm cận đứng của đồ thị hàm số:
  $ y = frac(sqrt(x^2 + 1) - x, x - 1) $

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường nhẩm nhanh bậc tử bằng bậc mẫu (đều là bậc 1) và chia hệ số cao nhất ở tử cho mẫu để kết luận có tiệm cận ngang duy nhất là $y = frac(1-1, 1) = 0$. Một số học sinh lạm dụng máy tính cầm tay bấm CALC $10^9$ thấy kết quả bằng 0 cũng vội vàng kết luận $y=0$ là tiệm cận ngang duy nhất, từ đó làm sai đáp số.

  *Góc nhìn "Đại Bác" (Trực giác về dấu trị tuyệt đối):* Khi đưa $x^2$ ra ngoài căn thức, ta bắt buộc phải sử dụng trị tuyệt đối:
  $ sqrt(x^2 + 1) = |x| sqrt(1 + frac(1, x^2)) $
  - Khi $x arrow.r +oo$, ta có $|x| = x$. Tử số trở thành $x(sqrt(1+1/x^2) - 1)$. Bậc của tử nhỏ hơn mẫu do phần hiệu số triệt tiêu nhau, giới hạn tiến về 0. Tiệm cận ngang bên phải là $y = 0$.
  - Khi $x arrow.r -oo$, ta có $|x| = -x$. Tử số trở thành $-x sqrt(1+1/x^2) - x = -x (sqrt(1+1/x^2) + 1)$. Bậc của tử lúc này không bị triệt tiêu mà có hệ số thống trị là $-2x$, còn mẫu là $x$. Giới hạn tiến về $-2$. Tiệm cận ngang bên trái là $y = -2$.

  *Lời giải chi tiết:*
  - Tập xác định: $D = RR  backslash  {1}$.
  - *Tìm tiệm cận đứng:*
    Ta tính giới hạn khi $x$ tiến dần về điểm cấm $x = 1$:
    $ lim_(x arrow.r 1^+) y = lim_(x arrow.r 1^+) frac(sqrt(x^2+1)-x, x-1) = frac(sqrt(2)-1, 0^+) = +oo $
    Do đó, đường thẳng $x = 1$ là tiệm cận đứng của đồ thị hàm số.
  - *Tìm tiệm cận ngang:*
    - Khi $x arrow.r +oo$:
      Nhân liên hợp ở tử số để khử dạng vô định:
      $ lim_(x arrow.r +oo) frac(sqrt(x^2+1)-x, x-1) = lim_(x arrow.r +oo) frac((x^2+1) - x^2, (x-1)(sqrt(x^2+1)+x)) = lim_(x arrow.r +oo) frac(1, (x-1)(sqrt(x^2+1)+x)) = 0 $
      Đường thẳng $y = 0$ là tiệm cận ngang bên phải.
    - Khi $x arrow.r -oo$:
      Vì $x < 0$ nên $sqrt(x^2+1) = |x| sqrt(1 + 1/x^2) = -x sqrt(1 + 1/x^2)$.
      Ta chia cả tử và mẫu cho $x$ (lưu ý $x < 0$):
      $ lim_(x arrow.r -oo) frac(-x sqrt(1 + 1/x^2) - x, x - 1) = lim_(x arrow.r -oo) frac(x (-sqrt(1+1/x^2) - 1), x(1 - 1/x)) = lim_(x arrow.r -oo) frac(-sqrt(1+1/x^2) - 1, 1 - 1/x) = frac(-1-1, 1) = -2 $
      Đường thẳng $y = -2$ là tiệm cận ngang bên trái.

  *Kết luận:* Đồ thị hàm số có 3 đường tiệm cận gồm: 1 tiệm cận đứng $x = 1$ và 2 tiệm cận ngang $y = 0, y = -2$.
])

#v(0.8em)

#explain-box(17, [Biện luận số đường tiệm cận chứa tham số], [
  *Bài toán:* Cho hàm số $y = frac(x^2 - 3x + 2, x^2 - m x + m)$ có đồ thị là $(C)$. Tìm tất cả các giá trị của tham số $m$ để đồ thị hàm số có đúng 2 đường tiệm cận (bao gồm cả đứng và ngang).

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh lập luận: vì bậc tử bằng bậc mẫu nên luôn có 1 tiệm cận ngang $y = 1$. Để đồ thị có đúng 2 tiệm cận thì phải có đúng 1 tiệm cận đứng. Muốn mẫu số có đúng 1 nghiệm thì đặt biệt thức $Delta = 0$ để giải ra $m=0$ hoặc $m=4$. Học sinh thường bỏ quên trường hợp mẫu số có 2 nghiệm phân biệt nhưng trong đó có 1 nghiệm trùng với nghiệm của tử số làm triệt tiêu tiệm cận đứng.

  *Góc nhìn "Đại Bác" (Trực giác triệt tiêu nghiệm):*
  Nhận xét bậc tử bằng bậc mẫu nên với mọi $m$ ta luôn có 1 tiệm cận ngang $y = 1$ (vì giới hạn khi $x arrow.r +-oo$ luôn bằng 1).
  Do đó, đồ thị có đúng 2 tiệm cận khi và chỉ khi nó có đúng 1 tiệm cận đứng.
  Đường tiệm cận đứng xuất hiện tại các nghiệm của mẫu số $g(x) = x^2 - m x + m = 0$ mà không bị tử số $f(x) = x^2 - 3x + 2 = (x-1)(x-2)$ triệt tiêu hoàn toàn.
  - Trường hợp A: Mẫu số có nghiệm kép khác $\{1; 2\}$.
  - Trường hợp B: Mẫu số có 2 nghiệm phân biệt, trong đó có đúng 1 nghiệm trùng với nghiệm của tử số (nghiệm trùng này bị khử, nghiệm còn lại đóng vai trò tiệm cận đứng).

  *Lời giải chi tiết:*
  Đặt $f(x) = x^2 - 3x + 2 = (x-1)(x-2)$ và $g(x) = x^2 - m x + m$.
  Biệt thức của mẫu số: $Delta = m^2 - 4m$.
  Để đồ thị có đúng 1 tiệm cận đứng:
  - *Trường hợp 1 (Mẫu số có nghiệm kép):*
    $ Delta = 0 <=> m^2 - 4m = 0 <=> hoac(m = 0, m = 4) $
    - Với $m = 0$: Mẫu số là $g(x) = x^2 = 0 <=> x = 0$ (nghiệm kép khác $\{1;2\}$). Đồ thị có tiệm cận đứng $x = 0$. Thỏa mãn.
    - Với $m = 4$: Mẫu số là $g(x) = x^2 - 4x + 4 = (x-2)^2 = 0 <=> x = 2$ (nghiệm kép trùng với nghiệm $x=2$ của tử).
      Khi đó hàm số là: $y = frac((x-1)(x-2), (x-2)^2) = frac(x-1, x-2)$.
      Giới hạn khi $x arrow.r 2$ vẫn bằng vô cực, nên đồ thị vẫn có tiệm cận đứng $x = 2$. Thỏa mãn.
  - *Trường hợp 2 (Mẫu số có 2 nghiệm phân biệt, có 1 nghiệm trùng với nghiệm của tử):*
    Điều kiện để mẫu số có 2 nghiệm phân biệt là $Delta > 0 <=> m < 0$ hoặc $m > 4$.
    Để có nghiệm trùng với tử số, mẫu số phải nhận $x = 1$ hoặc $x = 2$ làm nghiệm:
    - Nếu $g(1) = 0 <=> 1^2 - m dot.c 1 + m = 0 <=> 1 = 0$ (vô lý). Mẫu không bao giờ nhận $x=1$ làm nghiệm.
    - Nếu $g(2) = 0 <=> 2^2 - m dot.c 2 + m = 0 <=> 4 - m = 0 <=> m = 4$ (trùng với trường hợp nghiệm kép ở trên).
    Vậy không có thêm giá trị $m$ nào ở trường hợp này.

  *Kết luận:* Các giá trị tham số cần tìm là $m = 0$ hoặc $m = 4$.
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 4:*
  Tiệm cận là nghệ thuật bỏ qua các chi tiết vụn vặt ngắn hạn để nhìn thấu xu hướng dài hạn. Khi thời gian tiến ra vô tận, mọi nhiễu động ban đầu đều tắt dần, chỉ còn lại những ranh giới ổn định vĩ mô định hình toàn bộ hệ thống.
]

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 5: KHẢO SÁT & ĐỒ THỊ - BÀN TAY KẺ VẼ
// ═══════════════════════════════════════════════
#chapter-header("5", [Khảo Sát Đồ Thị — Bàn Tay Kẻ Vẽ])

#philosophy-box[
  *Nhu cầu thực tế & Lịch sử:*
  Làm thế nào để vẽ phác họa nhanh chóng hình dạng của một đường cong cong phức tạp mà không cần dùng máy tính vẽ đồ thị? 
  
  Môn Khảo sát hàm số trong chương trình THPT giúp học sinh tổng hợp tất cả các đặc tính giải tích thành một bức tranh hình học hoàn chỉnh. Đặc biệt, đồ thị hàm bậc ba luôn có một tâm đối xứng hoàn hảo chính là *Điểm uốn* (nơi đạo hàm cấp hai bằng 0, đồ thị chuyển từ cong lồi sang cong lõm).
  
  Ứng dụng thực tế lớn nhất của khảo sát đồ thị là biện luận số nghiệm của phương trình chứa tham số. Khi ta tịnh tiến đường thẳng nằm ngang $y = m$ chạy dọc theo trục tung, số giao điểm của đường thẳng này với đồ thị cong chính là số nghiệm thực của phương trình.
]

#v(0.8em)

#structure-box[
  *QUY TRÌNH 3 BƯỚC KHÓA ĐỒ THỊ (3-LOCK SKETCHING)*
  
  Học sinh thường vẽ đồ thị bằng cách lấy thật nhiều điểm rời rạc rồi nối lại. Cách này rất dễ làm méo mó đồ thị và thiếu tính logic. Hãy dùng quy trình 3 bước khóa cấu trúc:
  
  1. *Bước 1: Khóa Biên (Border Lock):* Xác định tập xác định và các giới hạn vô cực để dựng sẵn các bức tường tiệm cận đứng, tiệm cận ngang.
  2. *Bước 2: Khóa Dòng Chảy (Flow Lock):* Tìm các điểm cực trị (đỉnh và đáy dốc) và hướng đi lên/xuống (BBT).
  3. *Bước 3: Khóa Nét Vẽ (Line Lock):* Xác định điểm uốn (tâm đối xứng), các giao điểm với hai trục tọa độ và vẽ đường cong mịn bám sát các mốc đã khóa.
]

#v(0.8em)

#technique-box[
  *Điểm Uốn và Tính Đối Xứng Hàm Bậc Ba:*
  - Điểm uốn $I(x_0; y_0)$ thỏa mãn $f''(x_0) = 0$. Tại điểm uốn, đồ thị chuyển trạng thái từ cong lồi sang cong lõm hoặc ngược lại.
  - Điểm uốn chính là tâm đối xứng hoàn hảo của đồ thị hàm số bậc ba.
  - Sự tương giao đồ thị: Số nghiệm của phương trình $f(x) = m$ chính là số giao điểm của đồ thị $y = f(x)$ và đường thẳng nằm ngang $y = m$.
]

#v(0.8em)

#explain-box(7, [Khảo sát vẽ đồ thị và biện luận số nghiệm phương trình], [
  *Bài toán:*
  1. Khảo sát và phác họa đồ thị của hàm số $y = x^3 - 3x + 1$.
  2. Biện luận theo tham số $m$ số nghiệm thực của phương trình: $x^3 - 3x + 1 = m$.
  
  *Lời giải:*
  
  - *Ý 1: Vẽ đồ thị*
    1. *Khóa Biên:* Tập xác định $D = RR$. Không có tiệm cận. Giới hạn ở vô cực: $lim_(x -> -oo) y = -oo$, $lim_(x -> +oo) y = +oo$.
    2. *Khóa Dòng Chảy:*
       $ y' = 3x^2 - 3 = 3(x-1)(x+1) $
       Giải $y' = 0 <=> x = -1$ hoặc $x = 1$.
       - Điểm cực đại: $"CĐ"(-1; 3)$.
       - Điểm cực tiểu: $"CT"(1; -1)$.
    3. *Khóa Nét Vẽ:*
       - Đạo hàm cấp hai: $y'' = 6x$. Giải $y'' = 0 => x = 0$.
       - Điểm uốn: $I(0; 1)$ (đây cũng chính là giao điểm của đồ thị với trục tung).
       
    #align(center)[
      #canvas(length: 0.9cm, {
        import draw: *
        line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.6pt)
        line((0, -2.0), (0, 4.0), mark: (end: ">"), stroke: 0.6pt)
        content((2.5, -0.3), [$x$])
        content((0.3, 4.0), [$y$])
        
        let pts = ()
        for i in range(41) {
          let x = -2.0 + i * 0.1
          let y = x * x * x - 3 * x + 1
          pts.push((x, y))
        }
        line(..pts, stroke: 1.5pt + c-indigo)
        
        circle((-1, 3), radius: 2pt, fill: c-red)
        content((-1.4, 3.2), [CĐ(-1, 3)])
        circle((1, -1), radius: 2pt, fill: c-green)
        content((1.4, -1.2), [CT(1, -1)])
        circle((0, 1), radius: 2pt, fill: c-royal-blue)
        content((0.4, 1.3), [I(0, 1)])
      })
    ]

  - *Ý 2: Biện luận nghiệm*
    Số nghiệm thực của phương trình $x^3 - 3x + 1 = m$ chính là số giao điểm của đồ thị cong vừa vẽ và đường thẳng nằm ngang $y = m$.
    Khi ta cho đường thẳng $y = m$ dịch chuyển tịnh tiến dọc theo trục tung, ta có các trường hợp:
    - Nếu $m < -1$ hoặc $m > 3$: Đường thẳng cắt đồ thị tại đúng $1$ điểm $=>$ Phương trình có *1 nghiệm thực duy nhất*.
    - Nếu $m = -1$ hoặc $m = 3$: Đường thẳng tiếp xúc tại cực trị và cắt tại 1 điểm khác $=>$ Phương trình có *2 nghiệm thực*.
    - Nếu $-1 < m < 3$: Đường thẳng cắt đồ thị tại $3$ điểm phân biệt $=>$ Phương trình có *3 nghiệm thực phân biệt*.
])

#v(0.8em)

#explain-box(18, [Tương giao của đồ thị hàm trùng phương], [
  *Bài toán:* Cho hàm số $y = -x^4 + 2x^2 + 1$ có đồ thị là $(C)$. Tìm tất cả các giá trị của tham số $m$ để đường thẳng $d: y = m$ cắt đồ thị $(C)$ tại 4 điểm phân biệt.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường đặt ẩn phụ $t = x^2 >= 0$, đưa về phương trình bậc hai $t^2 - 2t + m - 1 = 0$, rồi áp đặt điều kiện để phương trình bậc hai này có 2 nghiệm dương phân biệt ($Delta > 0, S > 0, P > 0$). Cách giải thuần đại số này rất dài dòng, nhiều công thức bất đẳng thức và cực kỳ dễ tính toán nhầm dấu.

  *Góc nhìn "Đại Bác" (Trực giác đồ thị chữ M):* Hãy phác họa nhanh hình dáng đồ thị trùng phương này. Vì hệ số $a = -1 < 0$ (nhánh ngoài đi xuống) và $b = 2 > 0$ (trái dấu với $a$ nên có 3 cực trị), đồ thị có dạng chữ M đối xứng hoàn hảo qua trục tung.
  Ta có các điểm cực trị:
  - Cực tiểu tại $x = 0 => y_("CT") = 1$
  - Hai cực đại tại $x = +-1 => y_("CĐ") = 2$
  Nhìn vào hình vẽ chữ M, ta thấy đường thẳng nằm ngang $y = m$ cắt đồ thị tại 4 điểm phân biệt khi và chỉ khi nó đi lọt vào giữa khe cực tiểu và cực đại:
  $ y_("CT") < m < y_("CĐ") <=> 1 < m < 2 $

  *Lời giải chi tiết:*
  - Hàm số $y = -x^4 + 2x^2 + 1$.
  - Đạo hàm: $y' = -4x^3 + 4x = -4x(x^2 - 1)$.
    $ y' = 0 <=> hoac(x = 0, x = +-1) $
  - Bảng biến thiên phác thảo:
    - Nhánh đồ thị đi từ $-oo$ đi lên cực đại $y=2$ (tại $x=-1$), đi xuống cực tiểu $y=1$ (tại $x=0$), đi lên cực đại $y=2$ (tại $x=1$), rồi đi xuống $-oo$.
  - Số nghiệm của phương trình $-x^4 + 2x^2 + 1 = m$ chính là số giao điểm của đồ thị $(C)$ và đường thẳng nằm ngang $y = m$.
  - Dựa vào BBT, để đường thẳng cắt đồ thị tại 4 điểm phân biệt thì:
    $ 1 < m < 2 $

  *Bẫy thường gặp:* Hãy chú ý không nhầm lẫn giữa hoành độ cực trị ($x = 0, +-1$) và tung độ cực trị ($y = 1, 2$) khi chặn điều kiện cho tham số $m$. Vì đường thẳng $y=m$ di chuyển theo trục dọc (trục tung), ta bắt buộc phải so sánh với các giá trị tung độ cực trị.
])

#v(0.8em)

#explain-box(19, [Bài toán tiếp xúc của hai đồ thị hàm số], [
  *Bài toán:* Chứng minh rằng đường thẳng $d: y = 6x - 9$ tiếp xúc với đồ thị hàm số $(C): y = x^3 - 3x^2 + 6x - 5$. Xác định tọa độ tiếp điểm tương ứng.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường chỉ giải phương trình hoành độ giao điểm:
  $ x^3 - 3x^2 + 6x - 5 = 6x - 9 <=> x^3 - 3x^2 + 4 = 0 $
  Giải ra nghiệm duy nhất $x=2$ hoặc nghiệm bội rồi kết luận chúng tiếp xúc nhau. Điều này sai về bản chất toán học: Một đường thẳng cắt đồ thị tại một điểm duy nhất hoàn toàn có thể là cắt đứt chứ không phải tiếp xúc (ví dụ đường $y = x$ cắt đồ thị $y = x^3$ tại $x=0$ nhưng không hề tiếp xúc tại đó!).

  *Góc nhìn "Đại Bác" (Trực giác tiếp xúc):* Hai đồ thị $y = f(x)$ và $y = g(x)$ tiếp xúc với nhau tại điểm có hoành độ $x_0$ khi và chỉ khi tại điểm đó, chúng vừa giao nhau, vừa có chung độ dốc tiếp tuyến (chung đạo hàm).
  Điều này dẫn đến hệ phương trình tiếp xúc bắt buộc:
  $ cases(f(x) = g(x)  quad (1), f'(x) = g'(x)  quad (2)) $
  Nếu hệ này có nghiệm, ta kết luận hai đồ thị tiếp xúc nhau.

  *Lời giải chi tiết:*
  - Đặt $f(x) = x^3 - 3x^2 + 6x - 5 => f'(x) = 3x^2 - 6x + 6$.
  - Đặt $g(x) = 6x - 9 => g'(x) = 6$.
  - Thiết lập hệ phương trình tiếp xúc:
    $ cases(x^3 - 3x^2 + 6x - 5 = 6x - 9  quad (1), 3x^2 - 6x + 6 = 6  quad (2)) $
  - Giải phương trình đạo hàm (2):
    $ 3x^2 - 6x = 0 <=> 3x(x-2) = 0 <=> hoac(x = 0, x = 2) $
  - Thế các nghiệm này vào phương trình giá trị (1) để kiểm tra:
    - Với $x = 0$: Thế vào (1) ta được $-5 = -9$ (vô lý). Điểm này đồ thị chỉ có tiếp tuyến song song với $d$ chứ không đi qua.
    - Với $x = 2$: Thế vào (1) ta được $2^3 - 3(2)^2 + 6(2) - 5 = 6(2) - 9 <=> 3 = 3$ (luôn đúng).
  - Vậy hệ phương trình có nghiệm duy nhất $x = 2$.
  - Tung độ tiếp điểm: $y = 6(2) - 9 = 3$.

  *Kết luận:* Đường thẳng $d$ tiếp xúc với đồ thị $(C)$ tại tiếp điểm $M(2; 3)$.
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 5:*
  Đồ thị hàm số không phải là một hình vẽ tĩnh lặng. Hãy tưởng tượng đường thẳng $y = m$ như một lưỡi cắt quét qua đồ thị. Khi $m$ vượt qua các điểm nút cực trị (ngưỡng nhạy cảm), số lượng nghiệm thực sẽ thay đổi đột ngột. Đó chính là bản chất động lực của bài toán tương giao đồ thị.
]

#pagebreak()

// ═══════════════════════════════════════════════
// CHƯƠNG 6: BÀI TOÁN HÀM HỢP VẬN DỤNG CAO
// ═══════════════════════════════════════════════
#chapter-header("6", [Bài Toán Hàm Hợp Vận Dụng Cao])

#philosophy-box[
  *Nhu cầu thực tế & Lịch sử:*
  Hãy tưởng tượng sự xếp chồng của các quá trình phụ thuộc lẫn nhau trong tự nhiên: Nhiệt độ thay đổi theo thời gian trong ngày ($u = u(t)$), lượng tiêu thụ điện của thành phố lại phụ thuộc vào nhiệt độ ($y = f(u)$). Ta muốn biết tốc độ tiêu thụ điện thay đổi thế nào trực tiếp theo thời gian ($g(t) = f(u(t))$).
  
  Toán học giải quyết sự xếp chồng này bằng *Quy tắc xích* (Chain Rule) được đề xuất bởi Leibniz:
  $ g'(x) = u'(x) dot.c f'(u) $
  Đạo hàm hàm hợp thực chất là tích số của hai vận tốc độc lập: vận tốc chuyển động của lõi bên trong ($u'(x)$) và phản ứng của vỏ ngoài ($f'(u)$).
  
  *Phá vỡ phương pháp "Ghép trục":*
  Hiện nay, nhiều học sinh ôn thi THPT Quốc gia thường lạm dụng mẹo "ghép trục" trắc nghiệm. Phương pháp này biến học sinh thành robot vẽ bảng số một cách thụ động, làm mất đi hoàn toàn trực giác vi phân và rất dễ mắc sai lầm trước các bài toán biến thể chứa tham số hoặc các hàm số không khả vi.
  
  Bằng cách phân tích trực tiếp *tương tác dấu tích số* giữa vận tốc lõi $u'(x)$ và vận tốc vỏ $f'(u)$, ta có thể giải quyết mọi bài toán VDC hàm hợp một cách vững chãi, nhanh gọn và tràn đầy trực giác toán học.
]

#v(0.8em)

#visual-box[
  *Trực giác về Thấu Kính Biến Hình:*
  Hàm số lõi $u(x)$ hoạt động như một thấu kính co giãn không gian đầu vào trước khi đưa vào hàm ngoài $f(u)$.
  Khi thấu kính đạt điểm dừng ($u'(x) = 0$), nó đổi chiều co giãn. Do đó, mọi điểm cực trị của hàm số lõi $u(x)$ đều chắc chắn trở thành điểm cực trị của hàm hợp $g(x)$.
]

#v(0.8em)

#structure-box[
  *QUY TẮC TƯƠNG TÁC DẤU ĐẠO HÀM HÀM HỢP*
  
  Đạo hàm hàm hợp $g'(x) = u'(x) dot.c f'(u)$ là tích số của hai thừa số. Xét dấu $g'(x)$ thực chất là so tài dấu giữa hai vận tốc này:
  - $g'(x) > 0$ (đồng biến) khi $u'(x)$ và $f'(u)$ cùng dấu (cùng dương hoặc cùng âm).
  - $g'(x) < 0$ (nghịch biến) khi $u'(x)$ và $f'(u)$ trái dấu.
]

#v(0.8em)

#explain-box(8, [Xét tính đơn điệu hàm hợp từ đồ thị đạo hàm gốc], [
  *Bài toán:* Cho hàm số $y = f(x)$ có đồ thị đạo hàm $y = f'(x)$ cắt trục hoành tại ba điểm $-1, 1, 4$ như hình vẽ dưới đây. Tìm các khoảng đồng biến của hàm hợp $g(x) = f(x^2 - 2)$.
  
  #align(center)[
    #canvas(length: 0.9cm, {
      import draw: *
      line((-2.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.6pt)
      line((0, -2.0), (0, 3.0), mark: (end: ">"), stroke: 0.6pt)
      content((5.5, -0.3), [$x$])
      content((0.3, 3.0), [$y = f'(x)$])
      
      let pts = ()
      for i in range(41) {
        let x = -2.0 + i * 0.18
        let y = -0.1 * (x + 1) * (x - 1) * (x - 4)
        pts.push((x, y))
      }
      line(..pts, stroke: 1.5pt + c-indigo)
      circle((-1, 0), radius: 2pt, fill: c-red)
      content((-1.3, 0.3), [$-1$])
      circle((1, 0), radius: 2pt, fill: c-red)
      content((1.2, -0.3), [$1$])
      circle((4, 0), radius: 2pt, fill: c-red)
      content((4.2, 0.3), [$4$])
    })
  ]
  
  *Lời giải:*
  
  Đạo hàm hàm hợp:
  $ g'(x) = (x^2 - 2)' dot.c f'(x^2 - 2) = 2x dot.c f'(x^2 - 2) $
  Hàm số đồng biến khi và chỉ khi $g'(x) > 0 <=> 2x dot.c f'(x^2 - 2) > 0$.
  Ta chia làm hai trường hợp tương tác dấu:
  
  - *Trường hợp 1: Cả hai thừa số cùng dương*
    $ cases(2x > 0, f'(x^2 - 2) > 0) <=> cases(x > 0, f'(u) > 0 "với" u = x^2 - 2) $
    Nhìn đồ thị đạo hàm gốc $y = f'(x)$ (đóng vai trò là $f'(u)$), ta có $f'(u) > 0$ khi và chỉ khi $u < -1$ hoặc $1 < u < 4$.
    Do đó:
    $ cases(x > 0, cases(delim: "[", x^2 - 2 < -1, 1 < x^2 - 2 < 4)) <=> cases(x > 0, cases(delim: "[", x^2 < 1, 3 < x^2 < 6)) <=> x in (0; 1) union (sqrt(3); sqrt(6)) $
    
  - *Trường hợp 2: Cả hai thừa số cùng âm*
    $ cases(2x < 0, f'(x^2 - 2) < 0) <=> cases(x < 0, f'(u) < 0 "với" u = x^2 - 2) $
    Nhìn đồ thị đạo hàm gốc $y = f'(x)$, ta có $f'(u) < 0$ khi và chỉ khi $-1 < u < 1$ hoặc $u > 4$.
    Do đó:
    $ cases(x < 0, cases(delim: "[", -1 < x^2 - 2 < 1, x^2 - 2 > 4)) <=> cases(x < 0, cases(delim: "[", 1 < x^2 < 3, x^2 > 6)) <=> x in (-sqrt(6); -sqrt(3)) union (-sqrt(3); -1) $
    
  *Kết luận:* Hàm hợp $g(x)$ đồng biến trên các khoảng $(-sqrt(6); -sqrt(3))$, $(-sqrt(3); -1)$, $(0; 1)$ và $(sqrt(3); sqrt(6))$.
])

#v(0.8em)

#explain-box(9, [Tìm số điểm cực trị của hàm hợp đa thức], [
  *Bài toán:* Cho hàm số $y = f(x)$ có đạo hàm $f'(x)$ liên tục trên $RR$ và phương trình $f'(x) = 0$ có 3 nghiệm thực phân biệt là $x = -1, x = 1, x = 3$. Hỏi hàm số hợp $g(x) = f(x^3 - 3x)$ có bao nhiêu điểm cực trị?
  
  *Góc nhìn "Đại Bác":* Đếm số nghiệm đơn (hoặc nghiệm bội lẻ) của phương trình $g'(x) = 0$.
  
  Đạo hàm hàm hợp:
  $ g'(x) = (x^3 - 3x)' dot.c f'(x^3 - 3x) = 3(x^2 - 1) f'(x^3 - 3x) $
  Giải phương trình $g'(x) = 0$:
  $ hoac(
    x^2 - 1 = 0,
    f'(x^3 - 3x) = 0
  ) <=> hoac(
    x = 1 " (nghiệm đơn)",
    x = -1 " (nghiệm đơn)",
    x^3 - 3x = -1 " (1)",
    x^3 - 3x = 1 " (2)",
    x^3 - 3x = 3 " (3)"
  ) $
  Số nghiệm của (1), (2), (3) chính là số giao điểm của đồ thị hàm số lõi $u(x) = x^3 - 3x$ với các đường nằm ngang $y = -1, y = 1, y = 3$.
  Khảo sát nhanh hàm số lõi $u(x) = x^3 - 3x$:
  - $u'(x) = 3x^2 - 3 = 0 => x = +- 1$.
  - Giá trị cực đại: $u(-1) = 2$, giá trị cực tiểu: $u(1) = -2$.
  
  Nhìn vào đồ thị tương giao của $u(x)$:
  - Đường $y = -1$ nằm kẹt giữa $[-2; 2] =>$ Phương trình (1) có *3 nghiệm đơn phân biệt*.
  - Đường $y = 1$ nằm kẹt giữa $[-2; 2] =>$ Phương trình (2) có *3 nghiệm đơn phân biệt*.
  - Đường $y = 3$ nằm phía trên cực đại $2 =>$ Phương trình (3) chỉ cắt tại *1 nghiệm đơn*.
  
  Tổng hợp tất cả các nghiệm:
  - Ta có $2$ nghiệm từ phần $u'(x) = 0$ là $x = +- 1$.
  - Ta có $3 + 3 + 1 = 7$ nghiệm từ phương trình $f'(u) = 0$.
  Vì các đường cắt $y = -1, y = 1, y = 3$ đều không đi qua các đỉnh cực trị $y = +- 2$ của hàm lõi $u(x)$, nên $7$ nghiệm này đều là các nghiệm đơn phân biệt và hoàn toàn khác biệt với các nghiệm $x = +- 1$.
  
  Do đó, phương trình $g'(x) = 0$ có tổng cộng $2 + 7 = 9$ nghiệm đơn phân biệt. Khi đi qua mỗi nghiệm này, đạo hàm đều đổi dấu.
  
  *Kết luận:* Hàm hợp $g(x)$ có đúng *9 điểm cực trị*.
])

#v(0.8em)

#explain-box(20, [Cực trị và tính đơn điệu của hàm liên kết dạng tổng], [
  *Bài toán:* Cho hàm số $y = f(x)$ liên tục trên $RR$ và có đồ thị đạo hàm $y = f'(x)$ cắt trục hoành tại ba điểm $-1, 1, 4$ như hình vẽ ở Ví dụ 8. Xét hàm số liên kết $g(x) = f(x) - frac(x^2, 2) + x$. Tìm các khoảng nghịch biến của hàm số $g(x)$.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường lúng túng vì không thể áp dụng phương pháp ghép trục hay bảng biến thiên đơn thuần đối với hàm số dạng tổng $f(x) + h(x)$. Một số em cố vẽ phác hàm số để tìm công thức gần đúng của $f'(x)$ dưới dạng một đa thức bậc 3 rồi thực hiện tính toán đại số phức tạp, điều này vô cùng tốn thời gian và dễ tính sai.

  *Góc nhìn "Đại Bác" (Trực giác tương giao đồ thị đạo hàm):*
  Ta tính đạo hàm hàm liên kết:
  $ g'(x) = f'(x) - x + 1 = f'(x) - (x-1) $
  Để hàm số $g(x)$ nghịch biến trên một khoảng, ta cần có đạo hàm bé hơn hoặc bằng 0:
  $ g'(x) <= 0 <=> f'(x) <= x - 1 $
  Bất phương trình này biểu thị sự so sánh vị trí tương đối giữa đồ thị đạo hàm $y = f'(x)$ và đường thẳng phụ $d: y = x - 1$.
  Hàm số nghịch biến tương ứng với khoảng mà đồ thị $y = f'(x)$ nằm *phía dưới* đường thẳng $d$. Ta chỉ cần vẽ đường thẳng $d$ đi qua các điểm tọa độ đặc biệt để nhìn ra ngay khoảng nghiệm.

  *Lời giải chi tiết:*
  - Ta có $g'(x) = f'(x) - (x-1)$.
  - Để hàm số nghịch biến: $g'(x) <= 0 <=> f'(x) <= x - 1$.
  - Vẽ đường thẳng $d: y = x - 1$ trên cùng hệ trục tọa độ với đồ thị đạo hàm $y = f'(x)$ (ở Ví dụ 8):
    - Khi $x = -1 => y = -2$. Điểm $(-1; -2)$ nằm dưới trục hoành.
    - Khi $x = 1 => y = 0$. Điểm $(1; 0)$ chính là giao điểm của đồ thị $y=f'(x)$ với trục hoành.
    - Khi $x = 4 => y = 3$. Điểm $(4; 3)$ nằm phía trên trục hoành.
  - Vẽ đường thẳng đi qua ba điểm đặc biệt này, ta thấy đường thẳng $d$ cắt đồ thị $y = f'(x)$ tại đúng ba hoành độ giao điểm là $x = -1$, $x = 1$, và $x = 4$.
  - Quan sát phần đồ thị đường cong $y = f'(x)$ nằm bên dưới đường thẳng $d$:
    - Khoảng thứ nhất: từ $-1$ đến $1$.
    - Khoảng thứ hai: từ $4$ tiến ra $+oo$.
  - Do đó:
    $ f'(x) <= x - 1 <=> x in [-1; 1] union [4; +oo) $

  *Kết luận:* Hàm số $g(x)$ nghịch biến trên các khoảng $(-1; 1)$ và $(4; +oo)$.
])

#v(0.8em)

#explain-box(21, [Tìm tham số để hàm hợp có số điểm cực trị cho trước], [
  *Bài toán:* Cho hàm số $y = f(x)$ có đạo hàm $f'(x) = x(x-1)(x-2)$. Tìm tất cả các giá trị nguyên của tham số $m$ để hàm số hợp $g(x) = f(x^2 - 2x + m)$ có đúng 3 điểm cực trị.

  *Lối mòn tư duy (Lối giải học vẹt):* Học sinh thường lạm dụng phương pháp ghép trục. Khi dòng lõi chứa tham số $m$, bảng biến thiên sẽ chứa các mốc cực trị di động như $m, m-1, m-2$. Việc biện luận điều kiện để đồ thị đi qua các mốc này sinh ra đúng 3 cực trị trở nên vô cùng rắc rối và cực kỳ dễ đếm nhầm điều kiện biên.

  *Góc nhìn "Đại Bác" (Tư duy nghiệm đơn và tịnh tiến trục):*
  Đạo hàm hàm hợp:
  $ g'(x) = (x^2 - 2x + m)' dot.c f'(x^2 - 2x + m) = 2(x-1) f'(x^2 - 2x + m) $
  Giải phương trình đạo hàm bằng 0:
  $ g'(x) = 0 <=> hoac(x = 1, f'(x^2 - 2x + m) = 0) $
  Vì phương trình $f'(u) = 0$ có 3 nghiệm đơn phân biệt là $u = 0$, $u = 1$, $u = 2$.
  Do đó, $g'(x) = 0$ tương đương với:
  $ x = 1  quad " (1 nghiệm đơn)" $
  Và các nghiệm của hệ phương trình:
  $ hoac(x^2 - 2x + m = 0, x^2 - 2x + m = 1, x^2 - 2x + m = 2) <=> hoac(x^2 - 2x = -m  quad (1), x^2 - 2x = 1-m  quad (2), x^2 - 2x = 2-m  quad (3)) $
  Khảo sát nhanh hàm số lõi Parabol $u(x) = x^2 - 2x$. Đỉnh cực tiểu của Parabol là $I(1; -1)$.
  Số điểm cực trị của $g(x)$ chính là số nghiệm đơn phân biệt của phương trình $g'(x) = 0$.
  Ta đã có sẵn 1 nghiệm đơn cố định là $x = 1$.
  Ba phương trình (1), (2), (3) đại diện cho giao điểm của Parabol $y = x^2 - 2x$ với ba đường thẳng nằm ngang xếp chồng song song: $2-m > 1-m > -m$.
  Để phương trình có đúng 3 nghiệm đơn, thì ba phương trình (1), (2), (3) bắt buộc phải đóng góp tổng cộng đúng 2 nghiệm đơn phân biệt (các nghiệm này chắc chắn khác 1 vì đỉnh parabol bằng đúng $-1$).
  Điều này chỉ xảy ra khi đường thẳng cao nhất cắt parabol tại 2 điểm, còn 2 đường thấp hơn nằm dưới hẳn hoặc tiếp xúc đỉnh parabol:
  $ cases(2-m > -1, 1-m <= -1) <=> cases(m < 3, m >= 2) <=> 2 <= m < 3 $

  *Lời giải chi tiết:*
  - Giải chi tiết điều kiện tịnh tiến đường thẳng:
    - Parabol $y = x^2 - 2x$ đạt giá trị nhỏ nhất bằng $-1$ tại $x=1$.
    - Đường thẳng $y = a$ cắt parabol tại 2 điểm phân biệt khi $a > -1$, tiếp xúc tại 1 điểm khi $a = -1$, và không cắt khi $a < -1$.
    - Ba đường thẳng $y = 2-m$, $y = 1-m$, $y = -m$ được xếp theo thứ tự giảm dần từ trên xuống dưới.
    - Để có đúng 2 nghiệm đơn phân biệt từ 3 đường thẳng này, đường thẳng cao nhất phải cắt parabol ($2-m > -1$) và đường thẳng thứ hai không được cắt (hoặc chỉ tiếp xúc tại đỉnh, vì tiếp xúc tại đỉnh sinh ra nghiệm $x=1$ trùng với nghiệm đơn ban đầu, không làm tăng số cực trị):
      $ 1-m <= -1 <=> m >= 2 $
      Đồng thời:
      $ 2-m > -1 <=> m < 3 $
    - Kết hợp lại ta được: $2 <= m < 3$.
  - Vì $m$ là số nguyên nên ta tìm được duy nhất giá trị $m = 2$.

  *Kết luận:* Giá trị nguyên cần tìm là $m = 2$.
])


#v(0.8em)

#meta-box[
  *Siêu tư duy của Chương 6:*
  Các bài toán hàm hợp VDC thực chất là một chuỗi liên hoàn các bài toán tương giao đồ thị cơ bản. Hãy luôn bóc tách đạo hàm hàm hợp thành tích số của *vận tốc lõi* và *vận tốc vỏ*. Khi đó, cấu trúc của bài toán sẽ hiện ra rõ ràng và đơn giản, giúp các em giải quyết bài toán bằng thực lực tư duy chứ không bằng mẹo vặt.
]

#pagebreak()

// ═══════════════════════════════════════════════
// TỔNG KẾT BẢN ĐỒ TƯ DUY TOÀN CHƯƠNG HÀM SỐ 12
// ═══════════════════════════════════════════════
#align(center)[
  #text(fill: c-royal-blue, weight: "black", size: 15pt)[BẢN ĐỒ TƯ DUY THỐNG NHẤT — TOÁN 12 HÀM SỐ]
]

#v(1.5em)

#align(center)[
  #block(
    fill: rgb("#ECEFF1"),
    inset: 22pt,
    radius: 10pt,
    stroke: 1pt + rgb("#B0BEC5"),
    width: 100%,
  )[
    #grid(
      columns: (1fr, 1.2fr, 1fr),
      column-gutter: 15pt,
      align: top,
      [
        #align(center)[#text(fill: c-red, weight: "bold")[CỤC BỘ (LOCAL)]]
        #v(0.5em)
        - *Đạo hàm $f'(x)$:* Độ dốc của tiếp tuyến phẳng tại điểm đang xét.
        - *Dấu của đạo hàm:*
          - $f' > 0$: Đang đi lên.
          - $f' < 0$: Đang đi xuống.
        - *Nghiệm $f'(x) = 0$:* Vị trí thăng bằng chuyển giao xu hướng dốc.
      ],
      [
        #align(center)[#text(fill: rgb("#B25E00"), weight: "bold")[CẦU NỐI (BRIDGE)]]
        #v(0.5em)
        - *Bảng biến thiên (BBT):* Bản đồ kết nối tất cả các dấu đạo hàm cục bộ để phác họa hình hài toàn cục.
        - *Đạo hàm hàm hợp:*
          $ g'(x) = u'(x) dot.c f'(u) $
          *Bản chất:* Sự tương tác dấu giữa vận tốc lõi và vận tốc vỏ.
      ],
      [
        #align(center)[#text(fill: c-teal, weight: "bold")[TOÀN CỤC (GLOBAL)]]
        #v(0.5em)
        - *Đồng biến, Nghịch biến:* Khoảng tăng/giảm của đồ thị trên toàn khoảng.
        - *Cực trị:* Điểm cực đại, cực tiểu của đồ thị hàm số.
        - *Tiệm cận:* Xu hướng bám sát dài hạn của hàm số khi tiến ra xa vô cực.
        - *Tối ưu hóa:* Tìm điểm thăng bằng để diện tích, thể tích đạt GTLN/GTNN.
      ]
    )
  ]
]
