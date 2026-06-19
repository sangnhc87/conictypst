#import "@preview/cetz:0.5.2": canvas, draw

// ═══════════════════════════════════════════════════════════════════
// TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 1: HÀM SỐ
// CHƯƠNG 1: HÀM SỐ — NGÔN NGỮ CỦA SỰ THAY ĐỔI
// Phiên bản Khai Mở — Mở Khóa Tư Duy Nền Tảng
// ═══════════════════════════════════════════════════════════════════

#set page(
  paper: "a4",
  margin: (x: 1.6cm, top: 2.2cm, bottom: 2.8cm),
  header: context {
    let n = counter(page).get().first()
    if n > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[
          #text(size: 8pt, fill: rgb("#607D8B"), style: "italic")[
            Tư Duy Đại Bác Diệt Ruồi — Tập 1: Hàm Số
          ]
        ],
        align(right)[
          #text(size: 8pt, fill: rgb("#0D47A1"), weight: "bold")[
            Chương 1: Hàm Số — Ngôn Ngữ Của Sự Thay Đổi
          ]
        ],
      )
      v(2pt)
      line(length: 100%, stroke: 0.4pt + rgb("#CFD8DC"))
    }
  },
  footer: align(center, context {
    let n = counter(page).get().first()
    if n > 1 {
      text(size: 9pt, fill: rgb("#607D8B"))[— #counter(page).display() —]
    }
  }),
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "vi")
#set par(justify: true, leading: 0.92em, first-line-indent: 1.2em)
#set list(indent: 1.2em, body-indent: 0.6em)
#set enum(indent: 1.2em, body-indent: 0.6em)
#show math.equation: set text(fill: rgb("#0A0A0A"))
#show math.equation.where(block: false): math.display
#show math.frac: it => context {
  if in-tfrac.get() {
    math.inline(it)
  } else {
    math.display(it)
  }
}
#show heading: it => {
  set par(first-line-indent: 0em)
  it
}

// ─── Bảng màu ─────────────────────────────────────────────────
#let C-DARK = rgb("#0D1B2A")
#let C-NAVY = rgb("#1B263B")
#let C-INDIGO = rgb("#415A77")
#let C-GOLD = rgb("#C9A84C")
#let C-RED = rgb("#8B1A1A")
#let C-TEAL = rgb("#00677A")
#let C-GREEN = rgb("#1B4332")
#let C-AMBER = rgb("#92400E")
#let C-PURPLE = rgb("#4A235A")

// ─── Hộp nội dung ─────────────────────────────────────────────

#let why-box(body) = block(
  fill: rgb("#F4F6F9"),
  stroke: (left: 5pt + C-INDIGO),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-NAVY, weight: "bold", size: 10.5pt)[⚖ TRIẾT HỌC & LỊCH SỬ — Tại Sao Khái Niệm Này Tồn Tại?]
  #v(0.5em)
  #body
]

#let eye-box(body) = block(
  fill: rgb("#EAF6F8"),
  stroke: (left: 5pt + C-TEAL),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-TEAL, weight: "bold", size: 10.5pt)[👁 TRỰC GIÁC HÌNH HỌC — Bức Tranh Ẩn Sau Ký Hiệu]
  #v(0.5em)
  #body
]

#let core-box(body) = block(
  fill: rgb("#FDF6EC"),
  stroke: (left: 5pt + C-AMBER),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-AMBER, weight: "bold", size: 10.5pt)[🔑 CẤU TRÚC CỐT LÕI — Xương Sống Của Tư Duy]
  #v(0.5em)
  #body
]

#let tech-box(body) = block(
  fill: rgb("#F5F0FB"),
  stroke: (left: 5pt + C-PURPLE),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-PURPLE, weight: "bold", size: 10.5pt)[⚙ KỸ THUẬT — Công Cụ Được Rút Ra Từ Trực Giác]
  #v(0.5em)
  #body
]

#let meta-box(body) = block(
  fill: rgb("#EBF3F9"),
  stroke: (left: 5pt + rgb("#1A5276")),
  inset: (x: 18pt, y: 16pt),
  radius: (right: 8pt),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#1A5276"), weight: "bold", size: 10.5pt)[🧠 SIÊU TƯ DUY — Nhìn Lại Từ Trên Cao]
  #v(0.5em)
  #body
]

#let link-box(body) = block(
  fill: rgb("#FFFDE7"),
  stroke: 0.5pt + rgb("#F9A825"),
  inset: (x: 14pt, y: 12pt),
  radius: 5pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#7D5A00"), size: 9.5pt, weight: "bold")[🔗  Ý tưởng này còn xuất hiện ở đâu trong toán học?]
  #v(0.3em)
  #text(size: 9.5pt, style: "italic")[#body]
]

#let vd-box(n, title, body) = block(
  fill: white,
  stroke: 0.6pt + rgb("#B0BEC5"),
  inset: (x: 20pt, y: 16pt),
  radius: 8pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: C-RED, weight: "bold", size: 11pt)[🔥 Ví Dụ Hé Lộ Cấu Trúc #n — #title]
  #v(0.6em)
  #body
]

#let quote-block(body) = block(
  fill: rgb("#FAFAFA"),
  stroke: (left: 3pt + C-GOLD),
  inset: (x: 16pt, y: 12pt),
  radius: (right: 6pt),
  width: 90%,
)[
  #set par(first-line-indent: 0em)
  #text(size: 10pt, style: "italic", fill: rgb("#37474F"))[#body]
]

// ─── Tiêu đề mục trong chương ──────────────────────────────────
#let sec(n, title) = {
  v(1.6em)
  block(
    fill: gradient.linear(C-NAVY, C-INDIGO, angle: 90deg),
    inset: (x: 16pt, y: 10pt),
    radius: 5pt,
    width: 100%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: C-GOLD, weight: "bold", size: 10pt)[§ #n  ]
    #text(fill: white, weight: "black", size: 13pt)[#title]
  ]
  v(0.8em)
}

// ─── Câu hỏi khai mở (callout nhỏ) ────────────────────────────
#let open-q(body) = block(
  fill: rgb("#FFF8E1"),
  stroke: (paint: C-GOLD, thickness: 1pt, dash: "dashed"),
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(fill: rgb("#5D4037"), size: 10pt, style: "italic")[❓ #body]
]

// ════════════════════════════════════════════════════════════════
//  TRANG BÌA CHƯƠNG
// ════════════════════════════════════════════════════════════════

#block(
  width: 100%,
  fill: gradient.linear(C-DARK, C-NAVY, angle: 135deg),
  inset: (x: 28pt, y: 40pt),
  radius: 14pt,
  clip: true,
)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(fill: C-GOLD, size: 10pt, weight: "bold", tracking: 5pt)[
      TƯ DUY ĐẠI BÁC DIỆT RUỒI — TẬP 1
    ]
    #v(1em)
    #text(fill: white, size: 28pt, weight: "black")[
      Chương 1
    ]
    #v(0.5em)
    #text(fill: rgb("#80D8EA"), size: 19pt, weight: "bold")[
      Hàm Số — Ngôn Ngữ Của Sự Thay Đổi
    ]
    #v(1.2em)
    #line(length: 50%, stroke: 1.5pt + C-GOLD)
    #v(1.2em)
    #text(fill: rgb("#CFD8DC"), size: 10pt, style: "italic")[
      "Toán học không phải 500 dạng rời rạc.#linebreak()
      Đó là một hệ thống tư duy thống nhất."
    ]
    #v(1.2em)
    #block(
      fill: rgb("#FFFFFF").transparentize(85%),
      inset: 14pt,
      radius: 8pt,
    )[
      #text(fill: rgb("#E0F7FA"), size: 9.5pt)[
        *Tư tưởng lõi của cả quyển:* Đạo hàm mô tả biến thiên _cục bộ_ — #linebreak()
        và từ đó ta dựng nên toàn bộ bức tranh _toàn cục_ của hàm số.
      ]
    ]
  ]
]

#v(1.8em)

// ─── Lời dẫn ──────────────────────────────────────────────────
#align(center)[
  #block(
    fill: rgb("#FFF9C4"),
    stroke: 0.8pt + rgb("#FBC02D"),
    inset: 12pt,
    radius: 6pt,
    width: 92%,
  )[
    #set par(first-line-indent: 0em)
    #text(fill: rgb("#8D6E00"), weight: "bold")[Lời mở đầu của Tập 1]
    #v(0.4em)
    #text(size: 9.6pt, style: "italic", fill: rgb("#455A64"))[
      Chương này không dạy em các dạng toán. Chương này đặt cho em một chiếc kính
      để từ đó em nhìn _mọi_ bài toán hàm số như những biến thể của cùng một ý tưởng lớn.#linebreak()
      Nếu Tập 2 là ngôn ngữ của khả năng và Tập 3 là ngôn ngữ của sự tích lũy,
      thì Tập 1 là nơi ta học ngôn ngữ nền: ngôn ngữ của sự phụ thuộc và biến thiên.#linebreak()
      Hãy đọc chậm. Hãy hỏi "tại sao". Hãy vẽ hình trong đầu trước khi tính toán.
    ]
  ]
]

#v(1.8em)

// ════════════════════════════════════════════════════════════════
//  §1. MỞ ĐẦU TRIẾT HỌC — VŨ TRỤ ĐẦY BIẾN ĐỔI
// ════════════════════════════════════════════════════════════════

#sec("1", "Câu Hỏi Hai Nghìn Năm: Đo Lường Cái Đang Chảy")

#why-box[
  Hãy tưởng tượng bạn đang đứng bên bờ sông, cố gắng dùng một cái bình đo lượng nước
  đang chảy qua một điểm cụ thể tại *đúng thời điểm này*. Không phải trong một giờ qua.
  Không phải trong một giây qua. Mà tại *khoảnh khắc tức thời* này.

  Bạn sẽ làm thế nào?

  Nếu bạn đo trong một giây, bạn nhận được "lượng nước trung bình trong một giây". Đó không
  phải là vận tốc tức thời — đó là vận tốc *trung bình*. Rút ngắn xuống một phần mười giây.
  Rồi một phần nghìn. Rồi một phần triệu. Bạn đang tiến về phía câu trả lời, nhưng không bao
  giờ thực sự đứng tại điểm bằng-không đó.

  Đây không phải là vấn đề của công nghệ. Đây là vấn đề của *khái niệm*. Và nó đã
  làm điên đảo các nhà tư tưởng lỗi lạc nhất trong suốt hai nghìn năm.

  #v(0.6em)

  *Nghịch lý Zeno — Khi toán học tĩnh gặp thế giới động:*

  Khoảng năm 450 trước Công nguyên, triết gia Zeno xứ Elea đặt ra câu đố:
  Mũi tên đang bay. Tại mỗi khoảnh khắc tức thời $t$, mũi tên chiếm một vị trí
  cố định trong không gian. Tại vị trí cố định, nó không di chuyển. Vậy mà nó
  đang bay. Mâu thuẫn này nằm ở đâu?

  Câu trả lời của Zeno, theo ngôn ngữ toán học hiện đại, thật ra là: *ông đã cố
  tính vận tốc bằng phép tính không thể thực hiện được*. Vận tốc tức thời tại
  thời điểm $t$ yêu cầu ta tính:

  $ v(t) = lim_(Delta t -> 0) frac(Delta s, Delta t) = lim_(Delta t -> 0) frac(0, 0) $

  Khi $Delta t -> 0$, tử số $Delta s$ cũng về 0. Kết quả là dạng vô định $0/0$ — toán học
  thuần túy chưa có công cụ để xử lý điều này. Zeno không sai. Ông chỉ đang sống ở thời
  điểm toán học *chưa phát minh* ra công cụ cần thiết.

  #v(0.6em)

  *Hai thiên tài — Một câu trả lời:*

  Đến thế kỷ 17, hai nhà toán học đã độc lập nhau tìm ra lối thoát. Isaac Newton
  xuất phát từ cơ học — ông cần mô tả quỹ đạo các hành tinh. Leibniz xuất phát từ
  hình học — ông muốn vẽ tiếp tuyến của đường cong. Họ cùng phát minh ra *Giải tích
  vi phân*, nhưng dùng các khái niệm mơ hồ về "số vô cùng bé."

  #quote-block[
    "Newton và Leibniz viết được những bài thơ toán học tuyệt vời, nhưng không ai
    trong số họ có thể giải thích được một cách chặt chẽ tại sao những bài thơ đó
    lại _đúng_." — Paraphrase từ các sử gia toán học.
  ]

  Chỉ đến thế kỷ 19, Cauchy và Weierstrass mới giải quyết được vấn đề bằng khái niệm
  *giới hạn*. Chìa khóa tư duy là: ta không bao giờ *đạt đến* khoảnh khắc $Delta t = 0$.
  Ta quan sát điều gì xảy ra khi $Delta t$ *tiến về* 0. Nếu tỷ số $(Delta s) / (Delta t)$ tiến về
  một con số xác định, con số đó là *vận tốc tức thời*.

  Đạo hàm không phải là phép chia $0/0$. Đó là giới hạn của một quá trình.
]

#link-box[
  Câu hỏi "đo lường cái đang chảy" không chỉ là bài toán vật lý. Trong Kinh tế học,
  "lãi suất tức thời" là đạo hàm của tổng tài sản theo thời gian. Trong Sinh học,
  "tốc độ tăng trưởng tức thời" của dân số là đạo hàm của hàm số dân số. Trong
  Thần kinh học, "cường độ kích thích" tại một nơ-ron là đạo hàm của tín hiệu điện
  theo thời gian. *Đạo hàm là ngôn ngữ phổ quát của tốc độ.*
]

// ════════════════════════════════════════════════════════════════
//  §2. HÀM SỐ — KHÔNG PHẢI CÔNG THỨC, MÀ LÀ MỐI QUAN HỆ
// ════════════════════════════════════════════════════════════════

#sec("2", "Hàm Số Là Gì? — Chiếc Máy Nắm Bắt Phụ Thuộc")

#why-box[
  Trước khi nghiên cứu đạo hàm — công cụ đo biến thiên — ta phải hỏi: *biến thiên
  của cái gì? Trong mối quan hệ như thế nào?*

  Câu trả lời là: *hàm số*. Nhưng không phải "hàm số" theo nghĩa SGK (một công thức
  với $x$). Mà là hàm số theo nghĩa *triết học*: một quy tắc nắm bắt sự phụ thuộc
  giữa hai đại lượng.

  #v(0.5em)

  *Ẩn dụ: Cỗ máy nhân quả:*

  Hãy tưởng tượng một chiếc hộp đen kỳ diệu. Mỗi lần bạn đưa vào một con số đầu vào,
  hộp đen trả ra một con số đầu ra. Nội quy duy nhất: *cùng một đầu vào luôn cho ra
  cùng một đầu ra*. Chiếc hộp đen này chính là *hàm số*. Và thế giới xung quanh chúng
  ta đầy rẫy những chiếc hộp đen như vậy:

  - Diện tích hình tròn là hộp đen nhận vào bán kính $r$, trả ra $pi r^2$.
  - Nhiệt độ nước sôi là hộp đen nhận vào độ cao so mực biển, trả ra một nhiệt độ.
  - Cảm giác đau là hộp đen nhận vào cường độ kích thích, trả ra một trải nghiệm.

  #v(0.5em)

  *Tại sao định nghĩa theo "quy tắc" quan trọng hơn "công thức"?*

  Vì trong toán học nâng cao, ta gặp vô số hàm số không có công thức đại số
  nào mô tả được — chỉ có thể mô tả bằng đồ thị, bằng số liệu, bằng lời. Ví dụ:
  "Hàm số $f$ mà đồ thị của $f'$ được cho như hình" — ở đây, $f$ hoàn toàn
  hợp lệ dù ta không biết công thức.

  Điều quan trọng không phải là *công thức trông như thế nào*, mà là:

  #align(center)[
    #block(
      fill: rgb("#E8EAF6"),
      stroke: 1pt + C-INDIGO,
      inset: 12pt,
      radius: 6pt,
      width: 85%,
    )[
      #set par(first-line-indent: 0em)
      #text(fill: C-NAVY, size: 11pt, weight: "bold")[
        Khi đầu vào thay đổi, đầu ra thay đổi như thế nào?
      ]
      #v(0.3em)
      #text(size: 10pt, fill: rgb("#37474F"))[
        Đây là câu hỏi duy nhất mà hàm số trả lời.
        #linebreak()Và đạo hàm là công cụ trả lời câu hỏi này một cách *tức thời*, *cục bộ*.
      ]
    ]
  ]
]

#v(0.8em)

#eye-box[
  *Đọc hàm số qua ngôn ngữ của đồ thị — Bốn cá tính của hàm số:*

  Đồ thị không phải là một hình ảnh tĩnh. Đó là một *câu chuyện trực quan*: trục $O x$
  là "thời gian" (hoặc đầu vào), trục $O y$ là "địa vị" (hoặc đầu ra). Đọc đồ thị
  từ trái sang phải là đọc câu chuyện diễn biến của hàm số.

  #v(0.6em)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    row-gutter: 14pt,
    [
      #block(fill: rgb("#E3F2FD"), stroke: 1pt + C-INDIGO, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        #text(fill: C-NAVY, weight: "bold")[Hàm tuyến tính: Câu chuyện đều đặn]

        Đường thẳng. Hàm số $y = a x + b$. Đặc điểm: mỗi bước đi trên $O x$ đều mang
        lại cùng một bước tiến trên $O y$. *Tốc độ thay đổi không đổi*. Thế giới phẳng,
        dễ đoán, không có bất ngờ. Đây là hàm số "nhàm chán nhất" — nhưng cũng là
        tấm gương mà ta dùng để hiểu mọi hàm số cong.
      ]
    ],
    [
      #block(fill: rgb("#FFF3E0"), stroke: 1pt + C-AMBER, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        #text(fill: C-AMBER, weight: "bold")[Hàm bậc hai: Câu chuyện tăng tốc]

        Parabol. Hàm số $y = x^2$. Đặc điểm: mỗi bước đi trên $O x$ mang lại một bước
        tiến *ngày càng lớn hơn* trên $O y$. *Tốc độ thay đổi chính nó đang thay đổi.*
        Đây là dấu hiệu đầu tiên cho thấy ta cần một công cụ mới — một công cụ đo
        tốc độ thay đổi *tại từng điểm cụ thể*.
      ]
    ],

    [
      #block(fill: rgb("#E8F5E9"), stroke: 1pt + C-GREEN, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        #text(fill: C-GREEN, weight: "bold")[Hàm mũ: Câu chuyện bùng nổ]

        $y = e^x$ hoặc $y = 2^x$. Đặc điểm: tốc độ tăng *tỷ lệ thuận với giá trị hiện tại*.
        Càng lớn, càng tăng nhanh. Đây là cấu trúc của mọi hiện tượng "lây lan":
        virus, lãi kép, đám cháy, tin đồn. Và bí mật đẹp nhất của hàm số $e^x$ là
        đạo hàm của nó chính là *chính nó*.
      ]
    ],
    [
      #block(fill: rgb("#F3E5F5"), stroke: 1pt + C-PURPLE, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        #text(fill: C-PURPLE, weight: "bold")[Hàm lượng giác: Câu chuyện dao động]

        $y = sin(x)$, $y = cos(x)$. Đặc điểm: câu chuyện *lặp đi lặp lại tuần hoàn*,
        lên rồi xuống, xuống rồi lên. Đây là cấu trúc của mọi hiện tượng dao động:
        sóng âm, sóng ánh sáng, nhịp tim, thủy triều. Đạo hàm của $sin$ là $cos$ —
        hai người bạn đồng hành dịch pha nhau một góc $pi/2$.
      ]
    ],
  )

  #v(0.6em)

  #align(center)[
    #canvas(length: 1cm, {
      import draw: *

      // Panel 1: Tuyến tính
      group({
        translate((-7.5, 0))
        line((-1.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.4pt + gray)
        line((0, -0.3), (0, 2.2), mark: (end: ">"), stroke: 0.4pt + gray)
        line((-1.2, 0.2), (1.2, 1.8), stroke: 1.8pt + C-INDIGO)
        content((0, 2.5), text(size: 7pt, fill: C-INDIGO)[Tuyến tính])
        content((0, -0.6), text(size: 6.5pt, fill: gray)[đều đặn])
      })

      // Panel 2: Bậc hai
      group({
        translate((-2.5, 0))
        line((-1.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.4pt + gray)
        line((0, -0.3), (0, 2.2), mark: (end: ">"), stroke: 0.4pt + gray)
        let pts2 = ()
        for i in range(25) {
          let x = -1.2 + i * 0.1
          let y = x * x * 0.8 + 0.3
          if y <= 2.0 { pts2.push((x, y)) }
        }
        line(..pts2, stroke: 1.8pt + C-AMBER)
        content((0, 2.5), text(size: 7pt, fill: C-AMBER)[Bậc hai])
        content((0, -0.6), text(size: 6.5pt, fill: gray)[tăng tốc])
      })

      // Panel 3: Mũ
      group({
        translate((2.5, 0))
        line((-1.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.4pt + gray)
        line((0, -0.3), (0, 2.2), mark: (end: ">"), stroke: 0.4pt + gray)
        let pts3 = ()
        for i in range(25) {
          let x = -1.2 + i * 0.1
          let y = calc.exp(x * 1.2) * 0.25
          if y <= 2.0 { pts3.push((x, y)) }
        }
        line(..pts3, stroke: 1.8pt + C-GREEN)
        content((0, 2.5), text(size: 7pt, fill: C-GREEN)[Hàm mũ])
        content((0, -0.6), text(size: 6.5pt, fill: gray)[bùng nổ])
      })

      // Panel 4: Sin
      group({
        translate((7.5, 0))
        line((-1.5, 0), (1.5, 0), mark: (end: ">"), stroke: 0.4pt + gray)
        line((0, -1.1), (0, 1.5), mark: (end: ">"), stroke: 0.4pt + gray)
        let pts4 = ()
        for i in range(31) {
          let x = -1.4 + i * 0.09
          let y = calc.sin(x * 2.8)
          pts4.push((x, y))
        }
        line(..pts4, stroke: 1.8pt + C-PURPLE)
        content((0, 1.8), text(size: 7pt, fill: C-PURPLE)[Dao động])
        content((0, -1.4), text(size: 6.5pt, fill: gray)[tuần hoàn])
      })
    })
  ]

  #align(center)[#text(
    size: 9pt,
    fill: rgb("#607D8B"),
    style: "italic",
  )[Hình 1: Bốn "cá tính" cơ bản của hàm số — mỗi loại kể một câu chuyện khác nhau về sự thay đổi]]
]

// ════════════════════════════════════════════════════════════════
//  §3. SỰ RA ĐỜI CỦA ĐẠO HÀM — TỪ NHU CẦU THỰC TẾ
// ════════════════════════════════════════════════════════════════

#sec("3", "Bài Toán Vận Tốc Tức Thời — Nhu Cầu Sinh Ra Khái Niệm")

#why-box[
  Hãy theo dõi một quả táo rơi khỏi cành cây. Newton đã đo và tìm ra:
  nếu $t$ là thời gian kể từ lúc rơi (đo bằng giây), thì khoảng cách rơi $s$ (đo
  bằng mét) tuân theo công thức:

  $ s(t) = 4.9 t^2 $

  Câu hỏi đơn giản nhất: *Quả táo rơi nhanh hay chậm?* Câu trả lời phụ thuộc vào
  *lúc nào* bạn đặt câu hỏi.

  #v(0.5em)

  *Bước 1 — Vận tốc trung bình:* Trong khoảng từ $t = 1$ đến $t = 2$:
  $ v_("tb") = frac(s(2) - s(1), 2 - 1) = frac(4.9 times 4 - 4.9 times 1, 1) = frac(19.6 - 4.9, 1) = 14.7 quad "m/s" $

  *Bước 2 — Thu hẹp khoảng thời gian:* Từ $t = 1$ đến $t = 1 + h$:
  $ v_("tb") = frac(s(1 + h) - s(1), h) = frac(4.9(1+h)^2 - 4.9, h) = frac(4.9(1 + 2h + h^2) - 4.9, h) $
  $ = frac(4.9 times 2h + 4.9 h^2, h) = 9.8 + 4.9h $

  *Bước 3 — Lấy giới hạn:* Khi $h -> 0$:
  $ v(1) = lim_(h -> 0) (9.8 + 4.9h) = 9.8 quad "m/s" $

  Đây là vận tốc *tức thời* tại thời điểm $t = 1$. Không phải vận tốc trung bình.
  Không phải xấp xỉ. Mà là con số *chính xác tuyệt đối* mà quả táo đang chuyển
  động tại đúng giây thứ nhất.

  #v(0.5em)

  *Tổng quát hóa:* Tại mỗi thời điểm $t$, vận tốc tức thời là:
  $ v(t) = s'(t) = lim_(h -> 0) frac(s(t + h) - s(t), h) = lim_(h -> 0) frac(4.9(t+h)^2 - 4.9t^2, h) = 9.8t $

  Và đây là điều kỳ diệu đầu tiên: *đạo hàm của hàm vị trí chính là hàm vận tốc*.
  Rồi đạo hàm của hàm vận tốc sẽ là hàm gia tốc. Một *tháp ý nghĩa* xây lên từ
  một phép toán duy nhất.
]

#open-q[
  Tại sao ta không thể đặt $h = 0$ ngay từ đầu? Rõ ràng ta *muốn* $h = 0$...
]

#v(0.5em)

#core-box[
  *Câu trả lời: Giới hạn không phải là "đặt bằng 0" — đó là nghệ thuật tiếp cận.*

  Khi ta đặt $h = 0$ trực tiếp vào $frac(s(t+h) - s(t), h)$, ta nhận được $0/0$ —
  một biểu thức vô nghĩa. Điều đó không có nghĩa là câu hỏi vô nghĩa. Điều đó
  có nghĩa là ta đang hỏi sai công cụ.

  Phép tính giới hạn không "đặt $h = 0$". Nó hỏi: *Khi $h$ tiến về $0$ nhưng chưa
  bằng $0$, phân số này tiến về đâu?* Nếu nó tiến về một con số cố định $L$, thì
  $L$ là đạo hàm. Đây là một cuộc *tiếp cận vô tận*, không phải một phép *chạm đến*.

  #v(0.5em)

  #align(center)[
    #block(
      fill: rgb("#E8F5E9"),
      stroke: 1pt + C-GREEN,
      inset: 14pt,
      radius: 8pt,
      width: 90%,
    )[
      #set par(first-line-indent: 0em)
      #text(fill: C-GREEN, weight: "bold")[Định nghĩa kỹ thuật của đạo hàm:]
      #v(0.4em)
      $ f'(x) = lim_(h -> 0) frac(f(x + h) - f(x), h) $
      #v(0.3em)
      #text(fill: rgb("#37474F"))[
        (nếu giới hạn này tồn tại và hữu hạn)
      ]
    ]
  ]

  Trong lịch sử, Newton gọi đây là "fluxion" (dòng chảy), Leibniz gọi là $(d y) / (d x)$.
  Ta gọi là $f'(x)$. Ba ký hiệu, một thực thể.
]

// ════════════════════════════════════════════════════════════════
//  §4. NGUYÊN LÝ PHẲNG HÓA — TRỰC GIÁC CỐT LÕI
// ════════════════════════════════════════════════════════════════

#sec("4", "Nguyên Lý Phẳng Hóa — Trực Giác Nền Tảng Của Đạo Hàm")

#eye-box[
  Bây giờ ta sẽ quên đi công thức giới hạn trong một phút. Hãy nhìn vào đạo
  hàm bằng con mắt của một nhà hình học.

  #v(0.6em)

  *Thí nghiệm tư duy: Chiếc kính hiển vi đồ thị:*

  Hãy vẽ một đường cong mịn $y = f(x)$ trên giấy. Chọn một điểm $P$ trên đồ thị.
  Bây giờ lấy kính hiển vi tưởng tượng có độ phóng đại vô hạn và đặt vào điểm $P$:

  #grid(
    columns: (1.5fr, 1fr),
    column-gutter: 16pt,
    align: horizon,
    [
      - *Phóng đại 10 lần:* Bạn thấy một đoạn cong nhỏ.
      - *Phóng đại 100 lần:* Đoạn cong trông ít cong hơn.
      - *Phóng đại 1000 lần:* Gần như thẳng.
      - *Phóng đại $10^6$ lần:* Hoàn toàn thẳng!

      Đường "thẳng" mà bạn thấy khi phóng đại vô hạn này chính là *tiếp tuyến*.
      Và độ dốc (hệ số góc) của tiếp tuyến đó chính là *đạo hàm* $f'(x_0)$.

      #v(0.3em)
      Đây là nguyên lý *tuyến tính hóa cục bộ*: mọi hàm số khả vi, khi nhìn
      ở khoảng cách đủ gần, đều trông như một hàm tuyến tính.
    ],
    [
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *

          line((-1.3, 0), (2.0, 0), mark: (end: ">"), stroke: 0.4pt + gray)
          line((0, -0.5), (0, 2.5), mark: (end: ">"), stroke: 0.4pt + gray)

          let pts = ()
          for i in range(25) {
            let x = -1.0 + i * 0.12
            let y = 0.4 * x * x + 0.5 * x + 0.8
            pts.push((x, y))
          }
          line(..pts, stroke: 2pt + C-INDIGO)
          content((1.7, 2.1), text(size: 7pt, fill: C-INDIGO)[$y = f(x)$])

          // Điểm P
          let px = 0.6
          let py = 0.4 * px * px + 0.5 * px + 0.8
          circle((px, py), radius: 2.5pt, fill: C-RED)
          content((px + 0.2, py + 0.2), text(size: 7.5pt, fill: C-RED)[$P$])

          // Vòng phóng đại
          circle((px, py), radius: 0.7, stroke: (paint: C-TEAL, thickness: 1.2pt, dash: "dashed"))

          // Zoom box
          rect((1.0, 0.0), (2.4, 1.4), fill: rgb("#EAF6F8"), stroke: 1pt + C-TEAL, radius: 3pt)
          // Tiếp tuyến trong hộp zoom
          let slope_p = 0.8 * px + 0.5
          let mid_x_zoom = 1.7
          let mid_y_zoom = 0.7
          line(
            (mid_x_zoom - 0.5, mid_y_zoom - 0.5 * slope_p * 0.4),
            (mid_x_zoom + 0.5, mid_y_zoom + 0.5 * slope_p * 0.4),
            stroke: 2pt + C-RED,
          )
          circle((mid_x_zoom, mid_y_zoom), radius: 2.5pt, fill: C-RED)
          content((1.7, 0.1), text(size: 6.5pt, fill: C-TEAL)[phóng to])

          // Mũi tên chỉ từ vòng tròn vào hộp zoom
          line((px + 0.7, py - 0.1), (1.0, 0.5), stroke: (paint: C-TEAL, thickness: 0.8pt), mark: (end: "stealth"))
        })
      ]
      #align(center)[#text(
        size: 7.5pt,
        fill: rgb("#607D8B"),
        style: "italic",
      )[Phóng to đồ thị cong — thấy tiếp tuyến thẳng]]
    ],
  )

  #v(0.8em)

  *Tại sao điều này quan trọng đến vậy?*

  Bởi vì đường thẳng là hình học đơn giản nhất mà con người có thể hiểu.
  Khi ta biến một bài toán về đường cong thành một bài toán về đường thẳng —
  dù chỉ ở cấp độ cục bộ — ta đã chinh phục được phần lớn độ khó của nó.

  Nguyên lý phẳng hóa cục bộ chính là *tư tưởng xuyên suốt* của toàn bộ giải tích:
  thay thế cái phức tạp (đường cong) bằng cái đơn giản nhất có thể (đường thẳng),
  làm việc ở quy mô nhỏ, rồi tổng hợp lại.

  #v(0.5em)

  *Hệ quả trực tiếp: Ý nghĩa hình học của dấu đạo hàm:*

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#E3F2FD"), inset: 10pt, radius: 6pt, stroke: 1pt + C-INDIGO)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-NAVY)[$f'(x_0) > 0$]]
        #v(0.3em)
        Tiếp tuyến dốc lên. Tại điểm này, hàm số *đang tăng*. Quả táo đang rơi xuống nhanh hơn.
      ]
    ],
    [
      #block(fill: rgb("#FFF3E0"), inset: 10pt, radius: 6pt, stroke: 1pt + C-AMBER)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-AMBER)[$f'(x_0) = 0$]]
        #v(0.3em)
        Tiếp tuyến nằm ngang. Tại điểm này, hàm số *đang dừng thay đổi*. Khoảnh khắc chuyển giao.
      ]
    ],
    [
      #block(fill: rgb("#FCE4EC"), inset: 10pt, radius: 6pt, stroke: 1pt + C-RED)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-RED)[$f'(x_0) < 0$]]
        #v(0.3em)
        Tiếp tuyến dốc xuống. Tại điểm này, hàm số *đang giảm*. Chim đang hạ cánh.
      ]
    ],
  )
]

#link-box[
  Nguyên lý tuyến tính hóa cục bộ là xương sống của *Hình học Vi phân (Differential
  Geometry)* — nhánh toán học nghiên cứu các bề mặt cong trong không gian nhiều
  chiều. Thuyết Tương đối Rộng của Einstein mô tả không-thời gian là một "đa tạp
  (manifold)" bị cong bởi khối lượng. Nhưng tại mọi điểm, nhìn đủ gần, không-thời
  gian vẫn "phẳng" — và đó là Thuyết Tương đối Hẹp của Newton. Vũ trụ cong nhưng
  cục bộ thì phẳng: đây là nguyên lý phẳng hóa trong áo khoác vật lý.
]

// ════════════════════════════════════════════════════════════════
//  §5. CHIẾC CẦU NỐI — TỪ CỤC BỘ ĐẾN TOÀN CỤC
// ════════════════════════════════════════════════════════════════

#sec("5", "Chiếc Cầu Nối — Từ Dốc Cục Bộ Đến Hành Vi Toàn Cục")

#core-box[
  Đây là bước quan trọng nhất mà nhiều học sinh bỏ qua: *đạo hàm là thông tin cục
  bộ, nhưng ta dùng nó để suy ra hành vi toàn cục*. Cách nào?

  #v(0.5em)

  *Ẩn dụ bản đồ địa hình:*

  Tưởng tượng bạn đang leo núi trong sương mù dày đặc. Bạn không thể nhìn thấy
  đỉnh núi hay thung lũng. Bạn chỉ có thể cảm nhận mặt đất *ngay dưới chân* đang
  nghiêng về hướng nào.

  - Nếu đất nghiêng lên ($f' > 0$): bạn đang leo dốc lên — hàm số đang tăng.
  - Nếu đất bằng phẳng ($f' = 0$): bạn đang đứng ở đỉnh hoặc đáy chân núi.
  - Nếu đất nghiêng xuống ($f' < 0$): bạn đang đi xuống — hàm số đang giảm.

  Bằng cách nhớ mình đã leo dốc lên hay đi xuống *trong mỗi khoảnh khắc* trên hành
  trình, bạn có thể tái dựng lại *toàn bộ địa hình* mà không cần nhìn xa.

  #v(0.5em)

  *Định lý Lagrange — Chiếc cầu nối toán học:*

  Nền móng toán học cho ẩn dụ này là *Định lý Giá trị Trung bình (Lagrange)*. Nó
  phát biểu một điều đơn giản nhưng cực kỳ mạnh mẽ:

  #align(center)[
    #block(
      fill: rgb("#E8F5E9"),
      stroke: 1.5pt + C-GREEN,
      inset: 14pt,
      radius: 8pt,
      width: 88%,
    )[
      #set par(first-line-indent: 0em)
      #text(fill: C-GREEN, weight: "bold")[Định lý Giá trị Trung bình (Lagrange):]
      #v(0.4em)
      Nếu hàm số $f$ liên tục trên $[a, b]$ và khả vi trên $(a, b)$, thì tồn tại
      ít nhất một điểm $c in (a, b)$ sao cho:
      $ f'(c) = frac(f(b) - f(a), b - a) $
      #v(0.3em)
      #text(fill: rgb("#37474F"), style: "italic")[
        Vận tốc tức thời tại $c$ bằng vận tốc trung bình trên $[a, b]$.
      ]
    ]
  ]

  #v(0.5em)

  *Ứng dụng tức thì:*
  - Nếu $f'(x) > 0$ với *mọi* $x in (a, b)$, thì với mọi $x_1 < x_2$ trong $(a,b)$:
    $ f(x_2) - f(x_1) = f'(c)(x_2 - x_1) > 0 => f(x_2) > f(x_1) $
    → Hàm số *đồng biến* trên $(a, b)$.
  - Nếu $f'(x_0) = 0$ và đạo hàm đổi dấu khi qua $x_0$ → đây là *điểm cực trị*.

  Hai kết luận "toàn cục" (đồng biến, cực trị) đều được rút ra từ thông tin "cục bộ"
  (dấu đạo hàm tại từng điểm) nhờ chiếc cầu nối Lagrange.
]

#v(0.6em)

#align(center)[
  #canvas(length: 1.1cm, {
    import draw: *
    line((-0.5, 0), (4.5, 0), mark: (end: ">"), stroke: 0.4pt + gray)
    line((0, -0.5), (0, 3.2), mark: (end: ">"), stroke: 0.4pt + gray)
    content((4.5, -0.3), text(size: 7pt)[$x$])
    content((0.25, 3.2), text(size: 7pt)[$y$])

    let f(x) = 0.6 + 1.1 * calc.sin(x * 0.85)
    let pts = ()
    for i in range(30) {
      let x = 0.3 + i * 0.14
      pts.push((x, f(x)))
    }
    line(..pts, stroke: 2pt + C-INDIGO)
    content((4.2, f(4.2) + 0.3), text(size: 7pt, fill: C-INDIGO)[$y = f(x)$])

    let x1 = 0.7
    let y1 = f(x1)
    let x2 = 3.7
    let y2 = f(x2)
    circle((x1, y1), radius: 2pt, fill: C-NAVY)
    content((x1 - 0.2, y1 + 0.3), text(size: 7pt)[$A$])
    circle((x2, y2), radius: 2pt, fill: C-NAVY)
    content((x2 + 0.2, y2 + 0.2), text(size: 7pt)[$B$])
    line((x1, y1), (x2, y2), stroke: (paint: C-RED, thickness: 1pt, dash: "dashed"))

    // Điểm c
    let cx = 2.1
    let cy = f(cx)
    let sl = (y2 - y1) / (x2 - x1)
    circle((cx, cy), radius: 2.2pt, fill: C-TEAL)
    content((cx + 0.2, cy + 0.35), text(size: 7pt, fill: C-TEAL)[$C(c, f(c))$])
    line((cx - 0.9, cy - 0.9 * sl), (cx + 0.9, cy + 0.9 * sl), stroke: 1.6pt + C-TEAL)

    line((x1, 0), (x1, y1), stroke: (paint: gray, thickness: 0.4pt, dash: "dotted"))
    content((x1, -0.25), text(size: 7pt)[$a$])
    line((x2, 0), (x2, y2), stroke: (paint: gray, thickness: 0.4pt, dash: "dotted"))
    content((x2, -0.25), text(size: 7pt)[$b$])
    line((cx, 0), (cx, cy), stroke: (paint: gray, thickness: 0.4pt, dash: "dotted"))
    content((cx, -0.25), text(size: 7pt)[$c$])

    content((2.2, -0.8), text(
      size: 7.5pt,
      fill: C-TEAL,
      style: "italic",
    )[Tiếp tuyến tại $c$ $parallel$ cát tuyến $A B$])
  })
]

#align(center)[#text(
  size: 9pt,
  fill: rgb("#607D8B"),
  style: "italic",
)[Hình 2: Định lý Lagrange — luôn có điểm $c$ mà tiếp tuyến song song với cát tuyến $A B$]]

#link-box[
  Định lý Lagrange (hay Định lý Rolle tổng quát hóa) là tiền thân của *Nguyên lý
  Bất Động Điểm Brouwer* trong Tô-pô học — một trong những kết quả sâu sắc nhất
  của toán học thế kỷ 20. Nó khẳng định: mọi biến đổi liên tục của một miền compact
  (hình cầu đặc) về chính nó đều có ít nhất một điểm bất động. Ứng dụng: chứng minh
  sự tồn tại của cân bằng Nash trong Kinh tế học trò chơi (Game Theory), lĩnh vực
  mang về Giải thưởng Nobel Kinh tế.
]

// ════════════════════════════════════════════════════════════════
//  §6. QUY TẮC ĐẠO HÀM — HÌNH HỌC, KHÔNG PHẢI ĐẠI SỐ
// ════════════════════════════════════════════════════════════════

#sec("6", "Tại Sao Các Quy Tắc Đạo Hàm Trông Như Vậy?")

#tech-box[
  Học sinh thường học các quy tắc đạo hàm như những bài thơ cần thuộc lòng:
  $(x^n)' = n x^(n-1)$, $(f g)' = f' g + f g'$, $(f compose g)' = f'(g) dot.op g'$...
  Nhưng mỗi quy tắc đều có một *câu chuyện hình học* đứng sau nó.

  #v(0.5em)

  *Câu chuyện của $(x^n)' = n x^{n-1}$: Bề mặt của khối siêu lập phương:*

  Tại sao đạo hàm của $x^2$ là $2x$? Hãy tưởng tượng một hình vuông cạnh $x$.
  Diện tích là $x^2$. Khi ta tăng cạnh từ $x$ lên $x + h$:

  $ (x + h)^2 = x^2 + underbrace(2 x h)_("hai dải mỏng") + underbrace(h^2)_("góc nhỏ") $

  Diện tích tăng thêm là $2 x h + h^2$. Khi $h -> 0$, hình vuông góc $h^2$ trở nên
  *vô cùng nhỏ* so với hai dải mỏng $2 x h$ (vì $h^2/h = h -> 0$). Chỉ còn lại:

  $ frac((x+h)^2 - x^2, h) = 2x + h -> 2x $

  Con số $2$ không phải là phép nhân ma thuật. Nó xuất hiện vì hình vuông có
  *2 cạnh* đang mở rộng. Tương tự, hình lập phương có *3 mặt* đang mở rộng
  nên $(x^3)' = 3x^2$. Tổng quát: khối siêu lập phương $n$ chiều có $n$ "mặt
  siêu phẳng" đang mở rộng nên $(x^n)' = n x^{n-1}$.

  #v(0.6em)

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    [
      #align(center)[
        #canvas(length: 1cm, {
          import draw: *
          // Hình vuông cạnh x
          rect((0, 0), (2.2, 2.2), fill: rgb("#BBDEFB"), stroke: 1.2pt + C-INDIGO)
          content((1.1, 1.1), text(size: 9pt, fill: C-NAVY)[$x^2$])
          content((1.1, -0.25), text(size: 8pt)[$x$])
          content((-0.3, 1.1), text(size: 8pt)[$x$])

          // Mở rộng
          rect((0, 2.2), (2.2, 2.6), fill: rgb("#C8E6C9"), stroke: 0.6pt + C-GREEN)
          rect((2.2, 0), (2.6, 2.2), fill: rgb("#C8E6C9"), stroke: 0.6pt + C-GREEN)
          rect((2.2, 2.2), (2.6, 2.6), fill: rgb("#FFE082"), stroke: 0.6pt + C-AMBER)

          content((1.1, 2.4), text(size: 7pt, fill: C-GREEN)[$x h$])
          content((2.4, 1.1), text(size: 7pt, fill: C-GREEN)[$x h$])
          content((2.4, 2.4), text(size: 6.5pt, fill: C-AMBER)[$h^2$])
          content((2.4, -0.25), text(size: 7.5pt)[$h$])
        })
      ]
      #align(center)[#text(size: 8pt, fill: gray, style: "italic")[Tại sao $(x^2)' = 2x$]]
    ],
    [
      #set par(first-line-indent: 0em)
      *Câu chuyện của $(f g)' = f' g + f g'$: Quy tắc tích là diện tích chữ nhật:*

      Hình chữ nhật $f times g$. Khi $f$ tăng thêm $d f$ và $g$ tăng thêm $d g$,
      diện tích tăng thêm là một dải ngang ($d f dot.op g$) cộng một dải dọc ($f dot.op d g$)
      cộng một góc nhỏ ($d f dot.op d g$, bỏ qua khi $d f, d g -> 0$):
      $ d(f g) = g dot.op d f + f dot.op d g + d f dot.op d g approx g dot.op d f + f dot.op d g $
      Chia cho $d x$:
      $ (f g)' = f' g + f g' $
      Không phải phép toán đại số. Là hình học chữ nhật.
    ],
  )

  #v(0.5em)

  *Câu chuyện của quy tắc xích $(f compose g)' = f'(g) dot.op g'$: Bánh răng truyền động:*

  Khi đầu vào $x$ thay đổi $d x$, lõi $u = g(x)$ thay đổi $d u = g'(x) d x$.
  Rồi khi $u$ thay đổi $d u$, đầu ra $y = f(u)$ thay đổi $d y = f'(u) d u$.
  Kết hợp:
  $ d y = f'(u) dot.op g'(x) d x => frac(d y, d x) = f'(g(x)) dot.op g'(x) $

  Hãy tưởng tượng hai cặp bánh răng: bánh ngoài quay $g'$ vòng mỗi khi trục chính quay
  1 vòng, và bánh trong quay $f'$ vòng mỗi khi bánh ngoài quay 1 vòng. Tỷ số truyền
  động tổng hợp là tích số $f' dot.op g'$. Quy tắc xích là định luật nhân tỷ số truyền động.
]

// ════════════════════════════════════════════════════════════════
//  §7. BA VÍ DỤ HÉ LỘ CẤU TRÚC
// ════════════════════════════════════════════════════════════════

#sec("7", "Ba Ví Dụ Hé Lộ Cấu Trúc — Một Ý Tưởng, Ba Bộ Mặt")

#vd-box("1", "Hàm số tự giống chính đạo hàm của mình — $e^x$ và tăng trưởng lãi kép")[
  *Câu hỏi mở:* Có tồn tại một hàm số khả vi nào mà đạo hàm của nó *bằng chính nó*?

  Hãy gọi hàm số đó là $f(x)$. Ta muốn:
  $ f'(x) = f(x) $

  Đây là *phương trình vi phân* đơn giản nhất. Và lời giải của nó tiết lộ một hằng số
  kỳ diệu nhất trong toán học.

  #v(0.4em)

  *Ẩn dụ: Tài khoản ngân hàng lý tưởng:*

  Tưởng tượng một ngân hàng trả lãi *liên tục* (không phải theo năm, mà theo từng
  khoảnh khắc vi mô). Nếu tốc độ sinh lãi (đạo hàm) bằng chính số dư (giá trị hàm),
  thì số dư tăng tỷ lệ với chính nó — càng nhiều tiền, càng sinh nhiều lãi.

  Lấy $f(x) = f(0) dot.op e^x$ với $e approx 2.718...$. Kiểm tra:
  $ f'(x) = f(0) dot.op e^x = f(x) #sym.checkmark $

  Hằng số Euler $e$ không phải là một con số ngẫu nhiên. *Nó là hằng số tự nhiên
  của tốc độ tăng trưởng liên tục.* Bất kỳ quá trình nào phát triển với tốc độ
  tỷ lệ với bản thân mình đều được mô tả bởi hàm số $e^x$.

  #v(0.4em)

  *Gợi mở:* Khai triển Taylor cho $e^x$:
  $ e^x = 1 + x + frac(x^2, 2!) + frac(x^3, 3!) + frac(x^4, 4!) + dots.c $

  Mỗi số hạng là đạo hàm của số hạng tiếp theo. Toàn bộ dãy số này *tự sinh ra chính
  nó khi lấy đạo hàm*. Đây là bằng chứng đẹp nhất về tính tự đồng dạng của $e^x$.

  #link-box[
    Phương trình $f' = f$ là phương trình vi phân đơn giản nhất của sự tăng trưởng
    tự nhiên. Các phương trình vi phân phức tạp hơn mô tả mọi quy luật vật lý: từ
    lan truyền nhiệt ($partial_t u = Delta u$) đến cơ học lượng tử (phương trình
    Schrödinger $i planck partial_t psi = hat(H) psi$) đến Tương đối Rộng (phương trình
    Einstein $G_(mu, nu) = 8pi T_(mu, nu)$). Toàn bộ vũ trụ được viết bằng ngôn ngữ
    của các hàm số và đạo hàm của chúng.
  ]
]

#v(0.8em)

#vd-box("2", "Tháp đạo hàm — Vị trí, vận tốc, gia tốc là một gia đình")[
  Quay lại quả táo rơi. Ta có:

  $ s(t) = 4.9 t^2 quad "m" $

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 10pt,
    [
      #block(fill: rgb("#E8F5E9"), inset: 10pt, radius: 6pt, stroke: 1pt + C-GREEN)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-GREEN)[Vị trí]]
        $ s(t) = 4.9 t^2 $
        Độ lớn: bao xa đã rơi.
        #v(0.2em)
        #text(size: 9pt, style: "italic")[Mỗi giây thứ nhất rơi $4.9$ m, giây thứ hai rơi tổng cộng $19.6$ m...]
      ]
    ],
    [
      #block(fill: rgb("#FFF3E0"), inset: 10pt, radius: 6pt, stroke: 1pt + C-AMBER)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-AMBER)[Vận tốc = $s'$]]
        $ v(t) = 9.8 t $
        Tốc độ thay đổi vị trí.
        #v(0.2em)
        #text(size: 9pt, style: "italic")[Giây thứ nhất: $9.8$ m/s. Giây thứ hai: $19.6$ m/s...]
      ]
    ],
    [
      #block(fill: rgb("#F3E5F5"), inset: 10pt, radius: 6pt, stroke: 1pt + C-PURPLE)[
        #set par(first-line-indent: 0em)
        #align(center)[#text(weight: "bold", fill: C-PURPLE)[Gia tốc = $v'$]]
        $ a(t) = 9.8 $
        Tốc độ thay đổi vận tốc.
        #v(0.2em)
        #text(size: 9pt, style: "italic")[Không đổi! Đây là gia tốc trọng trường $g approx 9.8$ m/s².]
      ]
    ],
  )

  #v(0.5em)

  Đây là một *tháp đạo hàm*: mỗi tầng là đạo hàm của tầng dưới. Và câu chuyện
  vật lý được kể ở cả ba tầng: vị trí nói về *nơi chốn*, vận tốc nói về *xu hướng*,
  gia tốc nói về *động lực*.

  Trong kỹ thuật, người ta còn xây tầng thứ tư: *jerk* (đạo hàm của gia tốc),
  đo mức độ "giật cục" của chuyển động. Xe lửa tốc độ cao được thiết kế để
  jerk nhỏ — hành khách cảm thấy êm dịu dù đang đi 300 km/h.

  #link-box[
    Tháp đạo hàm vị trí–vận tốc–gia tốc là nền tảng của *Cơ học Newton*, và được
    tổng quát hóa thành *Phương trình Euler-Lagrange* trong Cơ học Phân tích,
    rồi thành *Phương trình Hamilton* trong Cơ học Lượng tử. Trong Điều khiển
    Tự động, bộ điều khiển PID (Proportional-Integral-Derivative) điều chỉnh
    hệ thống dựa trên giá trị hiện tại (P), tích lũy sai số (I), và *đạo hàm*
    của sai số (D) để dự đoán xu hướng tương lai.
  ]
]

#v(0.8em)

#vd-box("3", "Tại sao điểm tối ưu nằm ở nơi đạo hàm bằng 0?")[
  *Bài toán thiết kế lon nước ngọt:* Một nhà máy muốn làm lon hình trụ chứa $V = 330$ mL.
  Tìm tỷ lệ $h/r$ để dùng ít nhôm nhất.

  #v(0.4em)

  *Trực giác trước công thức:*

  Hãy nghĩ về nó như một *cuộc đàm phán*. Có hai đối tác:
  - *Đối tác A — Đáy và nắp:* muốn bán kính $r$ nhỏ để tiết kiệm kim loại đáy.
  - *Đối tác B — Thành bên:* muốn bán kính $r$ lớn để giảm chiều cao $h$ (vì $h = V/pi r^2$),
    qua đó tiết kiệm kim loại thành.

  Khi $r$ nhỏ: đối tác A vui, đối tác B buồn (thành lon quá cao, tốn nhiều kim loại thành).
  Khi $r$ lớn: đối tác B vui, đối tác A buồn (đáy/nắp quá to, tốn nhiều kim loại đáy).
  Điểm tối ưu là nơi *hai đối tác cân bằng* — tốc độ tiết kiệm của đối tác A bằng
  tốc độ lãng phí của đối tác B, hay nói cách khác, đạo hàm tổng chi phí bằng 0.

  #v(0.4em)

  *Giải bài toán:*

  Diện tích toàn phần: $S(r) = 2pi r^2 + 2pi r dot.op frac(V, pi r^2) = 2pi r^2 + frac(2V, r)$

  $S'(r) = 4pi r - frac(2V, r^2)$

  Đặt $S'(r) = 0$: $4pi r = frac(2V, r^2) => r^3 = frac(V, 2pi) => V = 2pi r^3$

  Nhưng $V = pi r^2 h$, nên $pi r^2 h = 2pi r^3 => h = 2r$.

  *Kết luận:* Lon tối ưu có *chiều cao bằng đường kính*. Bạn có thể kiểm tra:
  hầu hết các lon nước ngọt thương mại đều gần tỷ lệ này. Đây không phải
  là tình cờ. Đây là toán học tối ưu được kỹ sư áp dụng!

  #link-box[
    Nguyên lý "điểm tối ưu ở nơi đạo hàm bằng 0" được gọi là *Điều kiện cần
    bậc nhất (First-Order Necessary Condition)*. Trong Kinh tế học, doanh nghiệp
    tối đa hóa lợi nhuận khi *doanh thu cận biên* (đạo hàm doanh thu) bằng
    *chi phí cận biên* (đạo hàm chi phí). Trong Machine Learning, thuật toán
    Gradient Descent tìm điểm tối ưu bằng cách đi *ngược chiều gradient*
    (ngược chiều đạo hàm) cho đến khi gradient gần về 0.
  ]
]

// ════════════════════════════════════════════════════════════════
//  §8. SIÊU TƯ DUY
// ════════════════════════════════════════════════════════════════

#sec("8", "Siêu Tư Duy — Nhìn Toàn Chương Từ Trên Cao")

#meta-box[
  Hãy lùi ra xa và nhìn lại toàn bộ chương này từ góc độ của một nhà toán học.
  Ta đã đi qua những gì?

  #v(0.5em)

  *Một ý tưởng — Vô số biểu hiện:*

  Toàn bộ chương hàm số lớp 12 xoay quanh *một câu hỏi duy nhất*:

  #align(center)[
    #block(
      fill: gradient.linear(C-NAVY, C-INDIGO, angle: 90deg),
      inset: 14pt,
      radius: 8pt,
      width: 88%,
    )[
      #set par(first-line-indent: 0em)
      #align(center)[
        #text(fill: white, size: 13pt, weight: "bold")[
          Khi đầu vào thay đổi, đầu ra thay đổi như thế nào — và nhanh chậm ra sao?
        ]
      ]
    ]
  ]

  #v(0.6em)

  Từ câu hỏi đó, *tất cả* các chủ đề trong sách giáo khoa đều tự nhiên xuất hiện:

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 14pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#E3F2FD"), stroke: 0.5pt + C-INDIGO, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Tính đơn điệu* là câu trả lời cho "đầu ra đang tăng hay giảm?".
        → Nhìn vào *dấu* của đạo hàm.
      ]
    ],
    [
      #block(fill: rgb("#FFF3E0"), stroke: 0.5pt + C-AMBER, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Cực trị* là câu trả lời cho "đầu ra đạt đỉnh hay đáy ở đâu?".
        → Tìm nơi đạo hàm *bằng 0 và đổi dấu*.
      ]
    ],

    [
      #block(fill: rgb("#E8F5E9"), stroke: 0.5pt + C-GREEN, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Tiếp tuyến* là câu trả lời cho "xấp xỉ tốt nhất cho hàm số tại điểm này là gì?".
        → Đường thẳng có độ dốc bằng *giá trị đạo hàm*.
      ]
    ],
    [
      #block(fill: rgb("#F3E5F5"), stroke: 0.5pt + C-PURPLE, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Tối ưu hóa* là câu trả lời cho "giá trị tốt nhất đạt được ở đâu?".
        → Tìm điểm *đạo hàm bằng 0* trong miền cho trước.
      ]
    ],

    [
      #block(fill: rgb("#FFEBEE"), stroke: 0.5pt + C-RED, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Tiệm cận* là câu trả lời cho "đầu ra tiến về đâu khi đầu vào ra xa vô cực?".
        → Phân tích *giới hạn* của hàm số ở biên.
      ]
    ],
    [
      #block(fill: rgb("#E8EAF6"), stroke: 0.5pt + C-INDIGO, inset: 10pt, radius: 6pt)[
        #set par(first-line-indent: 0em)
        *Đồ thị* là câu trả lời cho "toàn bộ câu chuyện của hàm số trông như thế nào?".
        → Tổng hợp tất cả thông tin từ đạo hàm.
      ]
    ],
  )

  #v(0.6em)

  *Bài học siêu nhận thức:*

  Khi bạn gặp một bài toán hàm số mới, đừng hỏi "Đây là dạng nào? Dùng công thức gì?".
  Hãy hỏi: *"Biến đổi cục bộ của hàm số tại điểm này như thế nào? Điều đó nói lên gì
  về hành vi toàn cục?"*

  Câu hỏi thứ hai dẫn bạn đến câu trả lời đúng. Câu hỏi thứ nhất chỉ dẫn bạn đến
  *bộ nhớ ngắn hạn* — thứ biến mất ngay sau kỳ thi.

  #v(0.5em)

  *Kết nối với thế giới thực:*

  Trong thế kỷ 21, *Trí tuệ Nhân tạo (AI)* đang thống trị công nghệ. Lõi của
  mọi mô hình AI hiện đại — từ ChatGPT đến AlphaGo — là thuật toán *Backpropagation*
  (lan truyền ngược), bản chất là áp dụng *quy tắc xích* hàng triệu lần để tính
  đạo hàm của hàm mất mát theo từng tham số của mô hình. Sau đó, *Gradient Descent*
  sử dụng đạo hàm để điều chỉnh tham số theo hướng giảm sai số.

  Mỗi khi bạn hỏi ChatGPT một câu, nó sử dụng hàng tỷ phép tính đạo hàm trong
  cái gọi là quá trình "huấn luyện" để đi đến được câu trả lời cho bạn. *Đạo hàm
  không phải là toán học của thế kỷ 17. Đó là công cụ của thế kỷ 21.*
]

// ════════════════════════════════════════════════════════════════
//  §9. BẢN ĐỒ TƯ DUY THỐNG NHẤT
// ════════════════════════════════════════════════════════════════

#sec("9", "Bản Đồ Tư Duy — Toàn Chương Trong Một Bức Tranh")

#align(center)[
  #text(fill: C-NAVY, weight: "black", size: 13pt)[ĐẠO HÀM = KÍNH HIỂN VI ĐO BIẾN THIÊN CỤC BỘ]
]

#v(1em)

#block(
  fill: rgb("#ECEFF1"),
  inset: 20pt,
  radius: 10pt,
  stroke: 0.8pt + rgb("#B0BEC5"),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #grid(
    columns: (1fr, 20pt, 1fr, 20pt, 1fr),
    align: top,
    [
      #align(center)[
        #block(
          fill: C-NAVY,
          inset: 8pt,
          radius: 6pt,
        )[
          #text(fill: white, weight: "bold", size: 10pt)[ĐẦU VÀO]
          #v(0.2em)
          #text(fill: C-GOLD, size: 9pt)[Quan sát thay đổi]
        ]
      ]
      #v(0.4em)
      - Thế giới thay đổi.
      - Cần ngôn ngữ nắm bắt sự phụ thuộc.
      - *Hàm số* ra đời: $y = f(x)$.
      #v(0.3em)
      - Đồ thị là "câu chuyện" của hàm số.
      - Mỗi loại hàm số kể một kiểu câu chuyện khác nhau.
    ],
    [
      #v(3.5em)
      #align(center)[
        #text(fill: C-AMBER, size: 20pt)[→]
      ]
    ],
    [
      #align(center)[
        #block(
          fill: C-TEAL,
          inset: 8pt,
          radius: 6pt,
        )[
          #text(fill: white, weight: "bold", size: 10pt)[CÔNG CỤ]
          #v(0.2em)
          #text(fill: rgb("#B2EBF2"), size: 9pt)[Đo biến thiên tức thời]
        ]
      ]
      #v(0.4em)
      - *Đạo hàm* $f'(x) = lim_(h -> 0) frac(f(x+h)-f(x), h)$.
      - Hình học: độ dốc của tiếp tuyến.
      - Vật lý: vận tốc tức thời.
      #v(0.3em)
      - *Dấu* $f'$: đang tăng hay giảm.
      - *Nghiệm* $f' = 0$: điểm chuyển giao.
      - *Giá trị* $f'$: tốc độ thay đổi.
    ],
    [
      #v(3.5em)
      #align(center)[
        #text(fill: C-AMBER, size: 20pt)[→]
      ]
    ],
    [
      #align(center)[
        #block(
          fill: C-RED,
          inset: 8pt,
          radius: 6pt,
        )[
          #text(fill: white, weight: "bold", size: 10pt)[ĐẦU RA]
          #v(0.2em)
          #text(fill: rgb("#FFCDD2"), size: 9pt)[Bức tranh toàn cục]
        ]
      ]
      #v(0.4em)
      - *Đơn điệu:* khoảng tăng/giảm.
      - *Cực trị:* đỉnh và đáy cục bộ.
      - *Tiếp tuyến:* xấp xỉ tuyến tính.
      #v(0.3em)
      - *Tối ưu:* điểm tốt nhất trong miền.
      - *Tiệm cận:* hành vi khi $x -> plus.minus oo$.
      - *Đồ thị:* bức tranh hoàn chỉnh.
    ],
  )

  #v(1em)
  #line(length: 100%, stroke: 0.6pt + rgb("#B0BEC5"))
  #v(0.8em)

  #align(center)[
    #text(fill: rgb("#455A64"), size: 9.5pt, style: "italic")[
      *Nguyên lý thống nhất:* Đạo hàm (cục bộ) → Ký hiệu BBT → Hành vi toàn cục
      #linebreak()
      Mọi bài toán trong chương đều là biến thể của một trong ba câu hỏi:
      "Hàm số tăng hay giảm ở đâu?" · "Giá trị nào là lớn nhất/nhỏ nhất?" · "Tiếp tuyến trông như thế nào?"
      #linebreak()
      Từ §10 trở đi, toàn bộ chương chỉ là việc mở rộng bản đồ này thành các lớp sâu hơn: tiểu sử đồ thị, độ cong, xấp xỉ, tối ưu, tiệm cận, mô hình hóa, atlas nguyên mẫu, và tự học bằng câu hỏi.
    ]
  ]
]

#v(1.5em)

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §10. KHẢO SÁT HÀM SỐ — TIỂU SỬ CỦA MỘT ĐƯỜNG CONG
// ════════════════════════════════════════════════════════════════

#sec("10", "Khảo Sát Hàm Số — Tiểu Sử Của Một Đường Cong")

#why-box[
  Trong nhà trường, cụm từ *khảo sát hàm số* thường bị hiểu như một thủ tục: lấy đạo hàm,
  giải phương trình $f'(x) = 0$, lập BBT, rồi vẽ đồ thị. Vì bị dạy như thủ tục nên nó trông
  giống một dây chuyền lắp ráp: đầu vào là công thức, đầu ra là hình vẽ. Nhưng đó là cách nhìn
  rất nghèo.

  Cách nhìn sâu hơn là thế này: *mỗi hàm số là một sinh thể logic*. Nó có nơi được sinh ra
  (miền xác định), có những quãng đời bình lặng hoặc kịch tính (đơn điệu), có những đỉnh cao
  và đáy sâu (cực trị), có những bước ngoặt tinh thần (điểm uốn), và có cả một xu hướng rất xa
  về phía chân trời (giới hạn, tiệm cận).

  Vì thế, khảo sát hàm số không phải là "trang điểm" cho công thức. Nó là *viết tiểu sử* cho
  một quan hệ phụ thuộc. Ta trả lời câu hỏi: đối tượng này sinh ra từ đâu, hành xử ra sao,
  thay đổi với nhịp nào, và cuối cùng đang đi về đâu.
]

#quote-block[
  Khi học sinh thấy một đồ thị chỉ là một nét mực, em sẽ nhanh quên nó. Khi học sinh thấy đồ thị
  là câu chuyện của một quy luật, em bắt đầu có một mối quan hệ thật với toán học.
]

#core-box[
  *Một cuộc khảo sát hoàn chỉnh* về bản chất chỉ đang trả lời bảy câu hỏi lớn:

  - Đối tượng này có nghĩa trên miền nào?
  - Ở đâu nó bằng $0$, dương, âm?
  - Khi $x$ tăng, nó đi lên hay đi xuống?
  - Ở đâu nó đổi từ đi lên sang đi xuống, hoặc ngược lại?
  - Nó cong theo kiểu nào: úp xuống hay ngửa lên?
  - Nó có những điểm "bẻ lái" nội tâm nào?
  - Ở rất xa, nó có xu hướng gì?

  Nếu mọi dòng trong lời giải đều nhằm trả lời một trong bảy câu hỏi này, em đang *hiểu*.
  Nếu em chỉ đang thao tác nhưng không biết mỗi thao tác trả lời câu hỏi nào, em mới chỉ *bắt chước*.
]

#eye-box[
  Hãy tưởng tượng em đang bay trực thăng dọc theo một con đường núi.

  - *Giá trị* $f(x)$ cho biết em đang ở độ cao nào.
  - *Đạo hàm bậc nhất* $f'(x)$ cho biết con đường đang dốc lên hay dốc xuống, và dốc mạnh hay nhẹ.
  - *Đạo hàm bậc hai* nói cho em biết độ dốc ấy đang tăng lên hay giảm xuống; tức là đường đang
    "ôm lên trời" hay "sụp xuống đất".

  Từ góc nhìn này, một bảng biến thiên không phải là một bảng nữa. Nó là *bản đồ hành trình*.
  Mỗi mũi tên đi lên là một đoạn leo dốc. Mỗi mũi tên đi xuống là một đoạn đổ đèo. Mỗi cực trị là
  một đỉnh đèo hoặc thung lũng. Mỗi tiệm cận là đường chân trời mà con đường cứ hướng về nhưng
  không chạm tới.
]

#open-q[
  Nếu em quên hẳn công thức mà chỉ còn nhìn thấy đồ thị, em có còn đặt lại được các câu hỏi đúng không?
  Học sâu là khi *câu hỏi còn sống* ngay cả lúc công thức biến mất.
]

#v(0.8em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  row-gutter: 10pt,
  [
    #block(fill: rgb("#EEF4FF"), inset: 10pt, radius: 6pt, stroke: 1pt + C-INDIGO)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: C-NAVY, weight: "bold")[1. Nơi sinh ra]]
      Miền xác định cho biết *điều kiện để câu chuyện bắt đầu*.
    ]
  ],
  [
    #block(fill: rgb("#F6FBF4"), inset: 10pt, radius: 6pt, stroke: 1pt + C-GREEN)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: C-GREEN, weight: "bold")[2. Nhịp tim]]
      $f'(x)$ cho biết ở mỗi nơi đồ thị đang hưng phấn hay mệt mỏi.
    ]
  ],
  [
    #block(fill: rgb("#FFF6EA"), inset: 10pt, radius: 6pt, stroke: 1pt + C-AMBER)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: C-AMBER, weight: "bold")[3. Tính khí]]
      Độ cong cho biết tâm trạng của độ dốc: đang tăng dần hay chùng xuống.
    ]
  ],

  [
    #block(fill: rgb("#FFF0F0"), inset: 10pt, radius: 6pt, stroke: 1pt + C-RED)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: C-RED, weight: "bold")[4. Bước ngoặt]]
      Cực trị và điểm uốn là nơi câu chuyện đổi chương.
    ]
  ],
  [
    #block(fill: rgb("#F1F5F9"), inset: 10pt, radius: 6pt, stroke: 1pt + rgb("#607D8B"))[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: rgb("#455A64"), weight: "bold")[5. Chân trời]]
      Giới hạn và tiệm cận cho biết về lâu dài nó đang hướng tới điều gì.
    ]
  ],
  [
    #block(fill: rgb("#F7F0FF"), inset: 10pt, radius: 6pt, stroke: 1pt + C-PURPLE)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(fill: C-PURPLE, weight: "bold")[6. Chân dung]]
      Đồ thị cuối cùng là bức chân dung nén của toàn bộ câu chuyện.
    ]
  ],
)

#v(0.9em)

#tech-box[
  *BBT không phải là mẹo thi; BBT là bản chép tắt của tiểu sử.*

  Mỗi cột trong BBT có thể được hiểu như một hàng chữ của một cuốn nhật ký:

  - Dòng $x$: các mốc thời gian hoặc vị trí quan trọng của câu chuyện.
  - Dòng $f'(x)$: nhịp tim nội tại, cho biết xu hướng tăng hay giảm.
  - Dòng $f(x)$: diễn biến thực sự mà mắt thường nhìn thấy.

  Khi một giáo viên chỉ bắt học sinh "vẽ cho đúng mũi tên", học sinh có thể làm đúng mà vẫn mù.
  Khi học sinh hiểu mỗi mũi tên là một lời tuyên bố về sự phụ thuộc, em bắt đầu thấy *cấu trúc*.

  Vì vậy, trước khi vẽ BBT, hãy tập thói quen tự hỏi:

  - Mũi tên này nói lên điều gì về *câu chuyện* của hàm số?
  - Điểm dừng này chỉ là chỗ đạo hàm bằng $0$, hay nó thực sự là một đỉnh hoặc một đáy?
  - Việc đồ thị ôm lên hay ôm xuống có làm thay đổi cách ta đọc cực trị không?
]

#vd-box("4", "Đọc $y = x^3 - 3x$ như đọc tiểu sử của một nhân vật")[
  Đây là một ví dụ rất giàu ý nghĩa vì công thức không quá dài nhưng hành vi rất phong phú.

  Xét hàm số
  $ f(x) = x^3 - 3x $

  *Bước 1. Nơi câu chuyện tồn tại.*

  Đây là đa thức nên miền xác định là toàn bộ $RR$. Nói cách khác, không có "vùng cấm" nào cả.
  Nhân vật này tồn tại ở mọi nơi trên trục số.

  *Bước 2. Hành vi ở rất xa.*

  Vì số hạng bậc cao nhất là $x^3$, nên khi $x$ rất âm thì $f(x)$ rất âm, và khi $x$ rất dương thì
  $f(x)$ rất dương. Câu chuyện bắt đầu ở một vực sâu phía trái và kết thúc ở một bầu trời cao phía phải.

  *Bước 3. Nhịp tim của hàm số.*

  Ta tính:
  $ f'(x) = 3x^2 - 3 = 3(x - 1)(x + 1) $

  Dấu của $f'(x)$ được quyết định bởi hai mốc $x = -1$ và $x = 1$:

  - Khi $x lt -1$, ta có $f'(x) gt 0$: đồ thị đi lên.
  - Khi $-1 lt x lt 1$, ta có $f'(x) lt 0$: đồ thị đi xuống.
  - Khi $x gt 1$, ta có $f'(x) gt 0$: đồ thị lại đi lên.

  Chỉ một hàng dấu của đạo hàm mà đã hé lộ cả ba chương lớn của câu chuyện: leo lên, đi xuống, rồi lại leo lên.

  *Bước 4. Các bước ngoặt.*

  Tại $x = -1$ và $x = 1$, đạo hàm bằng $0$.

  Tính giá trị:
  $ f(-1) = 2 $, $ f(1) = -2 $

  Nên đồ thị đạt một cực đại địa phương tại điểm $(-1, 2)$ và một cực tiểu địa phương tại điểm $(1, -2)$.

  Nói theo ngôn ngữ đời thường: sau khi leo lên tới đỉnh đầu tiên, hàm số mất đà và trượt xuống; rồi sau khi chạm
  một đáy sâu, nó lấy lại sinh lực và tiếp tục đi lên.

  *Bước 5. Tính khí của độ dốc.*

  Đạo hàm của đạo hàm là:
  $ (f')'(x) = 6x $

  Điều này cho biết:

  - Khi $x lt 0$, độ dốc đang *giảm*: đồ thị cong úp xuống.
  - Khi $x gt 0$, độ dốc đang *tăng*: đồ thị cong ngửa lên.

  Tại $x = 0$, độ cong đổi dấu. Đây là một *điểm uốn*.

  Đáng chú ý là tại $x = 0$, bản thân hàm số không đạt cực đại hay cực tiểu. Nó chỉ đổi "tính khí".
  Đó là một bài học lớn: *không phải mọi điểm đặc biệt đều là điểm cao nhất hoặc thấp nhất*.

  *Bước 6. Gom toàn bộ câu chuyện vào một chân dung ngắn.*

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 12pt,
    row-gutter: 10pt,
    [
      #block(fill: rgb("#F8FAFC"), inset: 10pt, radius: 6pt, stroke: 0.8pt + rgb("#CBD5E1"))[
        #set par(first-line-indent: 0em)
        *Miền xác định:* $RR$

        *Giao với trục hoành:* $x = -sqrt(3)$, $x = 0$, $x = sqrt(3)$

        *Xu hướng xa:* trái xuống rất sâu, phải lên rất cao
      ]
    ],
    [
      #block(fill: rgb("#F8FAFC"), inset: 10pt, radius: 6pt, stroke: 0.8pt + rgb("#CBD5E1"))[
        #set par(first-line-indent: 0em)
        *Tăng:* trên hai khoảng ngoài

        *Giảm:* trên khoảng giữa

        *Điểm uốn:* tại gốc tọa độ
      ]
    ],
  )

  Nhìn như vậy, em sẽ thấy "khảo sát" không phải là một danh sách thao tác rời rạc. Nó là *nhiều ống kính cùng chĩa vào một nhân vật*.
]

#v(0.8em)

#vd-box("5", "Tại sao phải khảo sát theo thứ tự ấy?")[
  Nhiều em học thuộc thứ tự: miền xác định, đạo hàm, cực trị, đạo hàm cấp hai, tiệm cận, đồ thị.
  Nhưng thứ tự đó không phải do người ra đề bịa ra. Nó phản ánh một logic nhận thức rất tự nhiên.

  *Trước hết phải biết đối tượng có tồn tại ở đâu.* Không thể kể tiểu sử một người ở những nơi người đó không xuất hiện.

  *Tiếp theo phải biết xu hướng đi lên hay đi xuống.* Đây là xương sống động học của đồ thị. Nếu không biết nó đang leo hay trượt,
  mọi hình vẽ đều chỉ là đoán mò.

  *Sau đó mới hỏi tới các đỉnh, đáy, và độ cong.* Vì những hiện tượng ấy là hệ quả tinh tế hơn của chuyển động nội tại.

  *Cuối cùng mới hỏi về bức tranh hoàn chỉnh.* Đồ thị không phải điểm xuất phát của lý luận; nó là bản tổng kết hình học của các kết luận trước đó.

  Trong toán học nghiêm túc, thứ tự hợp lý thường là: từ điều kiện tồn tại, tới quy luật vi mô, rồi mới tới chân dung vĩ mô.
  Đó cũng chính là cách khoa học vận hành: trước khi vẽ mô hình khí hậu, ta cần phương trình; trước khi dự đoán thị trường, ta cần quy luật biến thiên.
]

#meta-box[
  *Sai lầm phổ biến nhất khi khảo sát hàm số* là xem đạo hàm như một công cụ phụ, chỉ dùng để "kiếm cực trị".

  Sự thật ngược lại: đạo hàm mới là nhân vật chính. Cực trị, đơn điệu, tiếp tuyến, xấp xỉ tuyến tính, phương pháp Newton,
  tối ưu hóa, và cả nhiều mô hình vật lý đều là những cách khác nhau mà đạo hàm hiện hình.

  Nếu chương này chỉ để lại một trực giác, hãy giữ trực giác này: *khảo sát hàm số là nghệ thuật đi từ tín hiệu cục bộ tới hành vi toàn cục.*
]

#link-box[
  Trong Khoa học Dữ liệu, khi người ta "đọc" một hàm mất mát, họ cũng đang làm một cuộc khảo sát hàm số:
  cực tiểu ở đâu, mặt cong ra sao, có bao nhiêu thung lũng, một bước gradient nên dài hay ngắn. Trong Vật lý,
  việc dựng quỹ đạo của một vật dưới lực cũng là dựng "tiểu sử" của một hàm theo thời gian. Cùng một tư duy, rất nhiều bộ áo.
]

#open-q[
  Hãy thử tự kể lại câu chuyện của một hàm bất kỳ mà *không viết công thức*. Nếu em mô tả được bằng ngôn ngữ đời thường
  rằng nó đi lên, chùng xuống, bẻ cong, chạm đáy, rồi hướng ra chân trời, em đã thực sự sở hữu ý tưởng.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §11. ĐẠO HÀM BẬC HAI — ĐỘ CONG VÀ TRIẾT HỌC CỦA SỰ THAY ĐỔI
// ════════════════════════════════════════════════════════════════

#sec("11", "Đạo Hàm Bậc Hai — Độ Cong Và Triết Học Của Sự Thay Đổi")

#why-box[
  Đạo hàm bậc nhất trả lời câu hỏi: *đang thay đổi nhanh đến mức nào?* Nhưng nhiều hiện tượng quan trọng hơn lại nằm ở tầng sâu hơn:
  *mức thay đổi ấy có đang tự thay đổi hay không?*

  Một chiếc xe có thể vẫn đang đi tới, tức là vận tốc dương. Nhưng tài xế cảm thấy chuyện gì đang xảy ra còn phụ thuộc vào việc xe có đang tăng tốc
  hay giảm tốc. Một doanh nghiệp có thể vẫn đang có thêm doanh thu, nhưng nếu phần tăng thêm ngày một nhỏ đi thì toàn bộ câu chuyện kinh tế đã khác.

  Vì vậy, đạo hàm bậc hai xuất hiện khi ta không chỉ muốn biết "đi đâu", mà còn muốn biết *cách mà xu hướng tự biến đổi*.
]

#eye-box[
  Có một cách hình dung rất mạnh: đạo hàm bậc hai không đo trực tiếp độ cao của đường cong, cũng không đo trực tiếp độ dốc của đường cong.
  Nó đo *sự tiến hóa của độ dốc*.

  - Nếu các tiếp tuyến càng về bên phải càng dốc lên hơn, ta nói đồ thị cong ngửa lên.
  - Nếu các tiếp tuyến càng về bên phải càng bớt dốc, thậm chí dốc xuống, ta nói đồ thị cong úp xuống.

  Nói gọn: đạo hàm bậc hai là *kính hiển vi của sự bẻ cong*.
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  [
    #block(fill: rgb("#E8F5E9"), inset: 12pt, radius: 8pt, stroke: 1pt + C-GREEN)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(weight: "bold", fill: C-GREEN)[$f''(x) gt 0$]]
      Các độ dốc đang tăng dần.

      Đồ thị có xu hướng "ôm lên".

      Hình ảnh đời thường: một cái bát, một nụ cười, một chiếc cầu vồng mở ra.
    ]
  ],
  [
    #block(fill: rgb("#FFF3E0"), inset: 12pt, radius: 8pt, stroke: 1pt + C-AMBER)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(weight: "bold", fill: C-AMBER)[$f''(x) lt 0$]]
      Các độ dốc đang giảm dần.

      Đồ thị có xu hướng "sụp xuống".

      Hình ảnh đời thường: một mái vòm, một cái cau mày, một đường ném rồi rơi xuống.
    ]
  ],
)

#v(0.9em)

#core-box[
  Có ba cách phát biểu cùng một ý tưởng về đạo hàm bậc hai:

  - Ngôn ngữ giải tích: $f''(x)$ là đạo hàm của $f'(x)$.
  - Ngôn ngữ hình học: $f''(x)$ cho biết đồ thị đang cong ngửa hay cong úp.
  - Ngôn ngữ động học: $f''(x)$ cho biết xu hướng tăng giảm đang tăng tốc hay chậm lại.

  Ba cách nói này không phải ba sự thật khác nhau. Chúng là *ba bản dịch* của cùng một hiện tượng.
]

#vd-box("6", "Một vật ném lên cao — tại sao gia tốc âm lại quyết định toàn bộ câu chuyện?")[
  Xét độ cao của một vật được ném thẳng đứng lên trên:
  $ s(t) = -5 t^2 + 20 t + 1 $

  Ta có:

  $ s'(t) = -10 t + 20 $

  và

  $ (s')'(t) = -10 $

  Bây giờ hãy đọc ý nghĩa thay vì chỉ nhìn ký hiệu.

  - Ban đầu, $s'(0) = 20$, vật bay lên rất nhanh.
  - Nhưng vì gia tốc luôn bằng $-10$, vận tốc cứ giảm đều.
  - Tới lúc $s'(t) = 0$, vật đạt điểm cao nhất.
  - Sau đó, vận tốc trở thành âm, nghĩa là vật bắt đầu rơi xuống.

  Điều sâu sắc nằm ở đây: *chỉ một thông tin "gia tốc âm không đổi" đã quyết định hình dáng chung của cả chuyển động.*
  Nó bảo ta rằng đường biểu diễn độ cao theo thời gian phải là một parabol úp xuống. Nói cách khác, đạo hàm bậc hai âm đang viết sẵn kịch bản hình học từ đầu.

  Đây là một trong những lần hiếm hoi mà toán học và trải nghiệm cơ thể trùng nhau hoàn toàn. Khi em ném một quả bóng, tay em đang cảm được $s''(t) lt 0$ trước khi đầu óc kịp gọi tên nó.
]

#v(0.8em)

#vd-box("7", "Đọc lại hàm $x^3 - 3x$ dưới ống kính độ cong")[
  Ở phần trước, ta đã khảo sát hàm số
  $ f(x) = x^3 - 3x $

  và biết rằng
  $ f'(x) = 3x^2 - 3 $

  Bây giờ xét thêm
  $ (f')'(x) = 6x $

  Từ đây, bức tranh đổi hẳn chiều sâu.

  - Bên trái gốc tọa độ, $6x lt 0$, nên đồ thị cong úp xuống.
  - Bên phải gốc tọa độ, $6x gt 0$, nên đồ thị cong ngửa lên.

  Nghĩa là cùng một đường cong, nửa trái có tính cách của một mái vòm, còn nửa phải có tính cách của một cái bát.

  Tại $x = 0$, đồ thị không dừng lại. Nó vẫn đi qua gốc với hệ số góc âm. Nhưng cái đã thay đổi là *kiểu bẻ cong*.
  Điểm ấy giống như một đoạn ngoặt trong tâm lý của nhân vật: hành trình vẫn tiếp tục, nhưng logic nội tại của nó đã đổi.

  Đây là lý do điểm uốn rất quan trọng trong khoa học dữ liệu, kinh tế học, sinh học dân số: có những hệ thống chưa đổi chiều tăng giảm, nhưng đã đổi *cơ chế* tăng giảm.
]

#v(0.8em)

#vd-box("8", "Lợi nhuận tăng mà vẫn đáng lo — câu chuyện của hiệu suất giảm dần")[
  Giả sử một công ty có hàm doanh thu
  $ R(x) = 100x - x^2 $

  trong đó $x$ là số đơn vị sản phẩm bán ra.

  Khi đó:

  $ R'(x) = 100 - 2x $

  và

  $ (R')'(x) = -2 $

  Điều này nói rằng:

  - Mỗi khi bán thêm một đơn vị, doanh thu vẫn tăng nếu $x lt 50$.
  - Nhưng mức tăng thêm ấy ngày càng nhỏ hơn vì đạo hàm bậc hai luôn âm.

  Đây là một ý tưởng cực mạnh ngoài đời: *một đại lượng có thể còn đang tăng, nhưng chất lượng của sự tăng đã xấu đi từ trước.*

  Trong đời sống học tập cũng vậy. Một học sinh có thể vẫn tăng điểm từng tháng, nhưng nếu tốc độ tiến bộ giảm dần, giáo viên giỏi phải nhìn ra sớm.
  Đó chính là tư duy đạo hàm bậc hai: không chỉ nhìn mức hiện tại, mà nhìn *động lượng của xu hướng*.
]

#tech-box[
  *Vì sao phép thử đạo hàm bậc hai lại hợp lý?*

  Giả sử $x_0$ là một điểm mà $f'(x_0) = 0$. Tại đó, tiếp tuyến nằm ngang. Ta muốn biết điểm ấy là đỉnh, đáy,
  hay chỉ là một điểm phẳng bình thường.

  Gần $x_0$, ta có thể nghĩ rằng đồ thị được xấp xỉ bởi một biểu thức bậc hai:

  $ f(x) approx f(x_0) + frac(1, 2) f''(x_0) (x - x_0)^2 $

  Vì $(x - x_0)^2$ luôn không âm, nên dấu của $f''(x_0)$ quyết định toàn bộ tình hình:

  - Nếu $f''(x_0) gt 0$, phần hiệu chỉnh là không âm. Điểm $x_0$ giống đáy của một cái bát. Ta có cực tiểu địa phương.
  - Nếu $f''(x_0) lt 0$, phần hiệu chỉnh là không dương. Điểm $x_0$ giống đỉnh của một mái vòm. Ta có cực đại địa phương.

  Đây là một khoảnh khắc tuyệt đẹp: đạo hàm bậc hai nối *hình dạng* với *tối ưu*.
]

#meta-box[
  Đạo hàm bậc hai dạy ta một bài học trí tuệ quan trọng: đừng chỉ hỏi "hiện tại tốt hay xấu".
  Hãy hỏi thêm "xu hướng của hiện tại đang đổi theo hướng nào".

  Người nhìn bằng đạo hàm bậc nhất thấy bề mặt. Người nhìn bằng đạo hàm bậc hai bắt đầu thấy *cơ chế*.

  Trong nhiều ngành, khả năng phát hiện điểm uốn còn quý hơn khả năng phát hiện cực trị. Vì cực trị là lúc mọi thứ đã bộc lộ ra ngoài,
  còn điểm uốn là lúc cấu trúc âm thầm đổi hướng từ bên trong.
]

#link-box[
  Trong Xác suất Thống kê, đạo hàm bậc hai của hàm log-likelihood liên hệ tới độ cong của bề mặt ước lượng và xuất hiện trong Ma trận Fisher.
  Trong Trí tuệ nhân tạo, thông tin Hessian mô tả độ cong của hàm mất mát, quyết định việc tối ưu dễ hay khó. Trong Cơ học, gia tốc là đạo hàm bậc hai của vị trí.
  Một khái niệm, ba thế giới, cùng một linh hồn.
]

#open-q[
  Có những lúc hệ thống vẫn đi lên nhưng đã bắt đầu cong xuống. Nếu chỉ nhìn giá trị và bỏ qua độ cong,
  em sẽ phát hiện sự suy yếu quá muộn. Toán học ở đây không chỉ là tính toán; nó là nghệ thuật nhìn ra điều sắp xảy ra.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §12. TIẾP TUYẾN LÀ TẤT CẢ — XẤP XỈ TUYẾN TÍNH VÀ NEWTON
// ════════════════════════════════════════════════════════════════

#sec("12", "Tiếp Tuyến Là Tất Cả — Xấp Xỉ Tuyến Tính Và Phương Pháp Newton")

#why-box[
  Nếu phải chọn một phát minh làm chiếc cầu nối giữa thế giới cong và thế giới thẳng, đó chính là *tiếp tuyến*.

  Đường cong thì phức tạp. Đường thẳng thì đơn giản. Nhưng tự nhiên lại đầy đường cong: quỹ đạo vật thể, tăng trưởng dân số,
  hàm chi phí, tín hiệu điện, đường phản ứng hóa học. Muốn hiểu những thứ cong đó, trí tuệ con người cần một mẹo rất sâu:
  *nhìn đủ gần để cái cong trở nên gần như thẳng*.

  Mẹo ấy không phải trò lừa. Nó là linh hồn của giải tích. Vì khi phóng đại quanh một điểm, hàm số khả vi để lộ ra một gương mặt tuyến tính.
  Gương mặt ấy chính là tiếp tuyến.
]

#quote-block[
  Một đường cong trở nên hiểu được khi ta biết nó muốn làm gì trong khoảnh khắc kế tiếp. Tiếp tuyến là lời tiên đoán cục bộ ấy.
]

#eye-box[
  Hãy nhớ lại ẩn dụ kính hiển vi ở đầu chương. Khi phóng đại đủ gần quanh một điểm trơn, mọi bờ cong mịn đều trông phẳng dần.

  Chính xác hơn, nếu đứng tại điểm $x_0$, thì hàm số gần đó cư xử gần như đường thẳng
  $ L(x) = f(x_0) + f'(x_0) (x - x_0) $

  Đường thẳng này không chỉ "chạm" vào đồ thị. Có vô số đường thẳng chạm được. Điều đặc biệt là nó *mang cùng tốc độ biến thiên bậc nhất* với đồ thị.
  Nó là bản sao tuyến tính trung thành nhất của hàm số ở gần $x_0$.
]

#core-box[
  Có ba tầng ý nghĩa của tiếp tuyến mà học sinh thường bị bỏ lỡ:

  - *Hình học:* đó là đường thẳng đi qua điểm đang xét và có cùng hệ số góc với đồ thị.
  - *Xấp xỉ:* đó là mô hình đơn giản nhất thay thế hàm số trong một vùng cực nhỏ.
  - *Thuật toán:* đó là công cụ để đoán nghiệm, sửa sai, và tối ưu lặp.

  Một khái niệm mà vừa là hình học, vừa là mô hình, vừa là thuật toán thì không thể là chi tiết phụ. Nó là trung tâm.
]

#vd-box("9", "Tại sao $sqrt(99)$ gần bằng $9.95$ mà không cần máy tính?")[
  Xét hàm số
  $ f(x) = sqrt(x) $

  Ta muốn tính gần đúng $sqrt(99)$.

  Thay vì lao vào căn bậc hai, ta chọn điểm gần đó mà ta đã biết chính xác: $x_0 = 100$.

  Khi ấy:

  $ f(100) = 10 $

  và

  $ f'(x) = frac(1, 2 sqrt(x)) $

  nên

  $ f'(100) = frac(1, 20) $

  Phương trình tiếp tuyến tại $x_0 = 100$ là:

  $ L(x) = 10 + frac(1, 20) (x - 100) $

  Bây giờ thay $x = 99$:

  $ sqrt(99) approx L(99) = 10 + frac(1, 20) (-1) = 9.95 $

  Phép tính này cho ta nhiều hơn một con số gần đúng. Nó dạy một cách nghĩ: *điều khó có thể được thay bằng điều dễ, miễn là ta đứng đủ gần.*

  Toàn bộ giải tích số, vật lý tính toán, kỹ thuật mô phỏng đều vận hành trên tinh thần ấy.
]

#v(0.8em)

#vd-box("10", "Công thức tiếp tuyến thật ra đang nói điều gì?")[
  Công thức
  $ y = f(x_0) + f'(x_0) (x - x_0) $

  trông có vẻ kỹ thuật, nhưng nếu dịch sang tiếng Việt đời thường, nó nói rằng:

  - Bắt đầu từ giá trị hiện tại $f(x_0)$.
  - Mỗi khi $x$ lệch đi một lượng nhỏ $(x - x_0)$,
  - thì $y$ lệch gần như bằng *độ nhạy hiện tại* nhân với độ lệch đó.

  Nói ngắn gọn hơn:
  $ "thay đổi của đầu ra" approx "độ nhạy hiện tại" dot.op "thay đổi của đầu vào" $

  Đây chính là trái tim của tư duy vi phân. Đạo hàm không chỉ đo dốc; nó đo *độ nhạy*. Tiếp tuyến không chỉ là một đường thẳng; nó là *mô hình phản ứng tức thời*.

  Trong kinh tế, đó là phân tích cận biên. Trong vật lý, đó là gần đúng tuyến tính của một hệ phi tuyến. Trong kỹ thuật, đó là phép tuyến tính hóa quanh điểm làm việc.
]

#v(0.8em)

#tech-box[
  *Dạng vi phân* của ý tưởng trên là:

  $ f(x_0 + h) approx f(x_0) + f'(x_0) h $

  ở đó $h$ là một thay đổi nhỏ.

  Nếu em hiểu công thức này, rất nhiều bài toán bỗng trở nên trong suốt:

  - Sai số của phép đo truyền vào kết quả thế nào?
  - Một biến tăng rất ít thì đầu ra thay đổi bao nhiêu?
  - Có thể thay một hàm khó bằng một biểu thức bậc nhất trong vùng nhỏ không?

  Điều quan trọng là chữ "gần đúng" ở đây không phải sự yếu đuối. Nó là *quyền lực của mô hình*. Trong khoa học, một mô hình đơn giản nhưng đúng trong phạm vi cần thiết thường hữu dụng hơn một công thức chính xác nhưng không thể thao tác.
]

#vd-box("11", "Phương pháp Newton — tìm nghiệm bằng cách liên tục hỏi tiếp tuyến")[
  Giả sử ta muốn giải phương trình
  $ f(x) = 0 $

  nhưng không giải tường minh được. Ý tưởng của Newton cực đẹp:

  - Chọn một điểm đoán ban đầu $x_0$.
  - Thay đường cong bằng tiếp tuyến tại $x_0$.
  - Tìm giao điểm của tiếp tuyến ấy với trục hoành.
  - Dùng giao điểm mới làm dự đoán tiếp theo.

  Nếu tiếp tuyến là bản sao cục bộ tốt của đồ thị, thì nghiệm của tiếp tuyến sẽ là dự đoán tốt hơn cho nghiệm thật.

  Từ phương trình tiếp tuyến tại $x_n$:

  $ y = f(x_n) + f'(x_n) (x - x_n) $

  cho $y = 0$, ta nhận được công thức lặp nổi tiếng:

  $ x_(n+1) = x_n - frac(f(x_n), f'(x_n)) $

  Đây là một công thức nhìn nhỏ bé nhưng chứa cả một triết lý: *muốn chạm vào cái đúng, hãy liên tục dùng mô hình cục bộ tốt nhất để tự sửa mình.*
]

#v(0.8em)

#vd-box("12", "Newton trên phương trình $x^2 - 2 = 0$")[
  Ta biết nghiệm dương là $sqrt(2)$, nhưng giả sử chưa biết.

  Đặt
  $ f(x) = x^2 - 2 $

  thì
  $ f'(x) = 2x $

  Chọn $x_0 = 1.5$. Khi đó:

  $ x_1 = 1.5 - frac(1.5^2 - 2, 2 dot.op 1.5) = 1.416666... $

  Lặp thêm một bước:

  $ x_2 = x_1 - frac(x_1^2 - 2, 2x_1) approx 1.414215... $

  Chỉ sau hai lần, ta đã áp sát $sqrt(2) approx 1.414213...$.

  Ấn tượng ở đây không chỉ là tốc độ hội tụ. Điều đáng nể hơn là cách hội tụ ấy được sinh ra từ một ý tưởng hình học rất mềm: *đường cong được hỏi ý kiến thông qua tiếp tuyến của chính nó.*

  Newton là một trong những ví dụ đẹp nhất cho thấy toán học không phải kho mẹo rời rạc. Một ý tưởng đúng, nếu đủ sâu, sẽ vừa là định lý, vừa là phương pháp tính, vừa là triết lý sửa sai.
]

#meta-box[
  Học sinh thường được dạy tiếp tuyến như một đối tượng "phải viết phương trình". Nhưng bản chất sâu hơn là thế này:

  *Tiếp tuyến là lời nói thật nhất mà một hàm phi tuyến có thể thốt ra khi bị hỏi trong một khoảng cực nhỏ.*

  Khi em hiểu vậy, em sẽ thấy xấp xỉ tuyến tính không phải bài phụ. Nó là cửa vào của mô hình hóa, tính gần đúng, giải số, điều khiển, và rất nhiều nhánh toán ứng dụng.
]

#link-box[
  Trong Vật lý, nhiều hệ phi tuyến được nghiên cứu bằng cách tuyến tính hóa gần trạng thái cân bằng. Trong Điều khiển học,
  người ta phân tích tính ổn định của hệ thống từ mô hình tuyến tính địa phương. Trong Machine Learning, một bước cập nhật gradient cũng là một phản ứng theo thông tin vi phân cục bộ.
  Tiếp tuyến vì thế không chỉ thuộc về hình học; nó là một chiến lược nhận thức phổ quát.
]

#open-q[
  Khi một bài toán quá cong, quá rối, quá thật, câu hỏi thông minh không phải luôn là "giải chính xác thế nào?".
  Nhiều khi câu hỏi đúng là: "gần điểm ta đang đứng, mô hình tuyến tính tốt nhất là gì?".
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §13. BÀI TOÁN CỰC TRỊ — KIẾN TRÚC CỦA SỰ TỐI ƯU
// ════════════════════════════════════════════════════════════════

#sec("13", "Bài Toán Cực Trị — Kiến Trúc Của Sự Tối Ưu")

#why-box[
  Từ lâu trước khi học sinh nghe tới từ "đạo hàm", con người đã bị ám ảnh bởi câu hỏi tối ưu:

  Làm cái cầu nào ít vật liệu nhất mà vẫn bền? Làm cái hộp nào chứa được nhiều nhất? Chia nguồn lực thế nào để hiệu quả cao nhất?
  Đi đường nào ngắn nhất? Đặt giá bao nhiêu để lợi nhuận lớn nhất?

  Đằng sau tất cả những câu hỏi ấy là cùng một cấu trúc: *nhiều lực kéo ngược nhau đang thương lượng*. Bài toán cực trị chính là nghệ thuật đọc cấu trúc thương lượng đó.
]

#eye-box[
  Hãy bỏ ngay hình ảnh sai lầm này: tối ưu là "bấm đạo hàm ra bằng $0$ rồi thế vào".

  Hình ảnh đúng hơn là:

  - Có một đại lượng em muốn làm tốt nhất.
  - Nhưng nó không được tự do; nó bị ràng buộc bởi một điều kiện nào đó.
  - Mỗi khi em cải thiện một phía, em thường làm xấu đi một phía khác.
  - Điểm tối ưu là nơi các xu hướng trái chiều cân bằng mong manh với nhau.

  Đạo hàm bằng $0$ chỉ là dấu vết số học của sự cân bằng ấy.
]

#core-box[
  Hầu hết các bài toán cực trị ở phổ thông đều có chung một bộ xương gồm ba bước:

  - Chọn đúng đại lượng cần tối ưu.
  - Dùng điều kiện ràng buộc để đưa bài toán về *một biến*.
  - Đọc ý nghĩa của điều kiện $f'(x) = 0$ như một trạng thái cân bằng, rồi kiểm tra biên và tính hợp lý.

  Nếu em học thuộc công thức nhưng không nhìn ra "cái gì đang thương lượng với cái gì", em sẽ làm được vài bài quen và lạc lối ngay khi đề đổi ngữ cảnh.
]

#vd-box("13", "Vì sao hình vuông cho diện tích lớn nhất trong các hình chữ nhật có cùng chu vi?")[
  Giả sử một hình chữ nhật có chu vi bằng $40$.

  Gọi một cạnh là $x$, cạnh kia là $20 - x$. Khi đó diện tích là:

  $ A(x) = x (20 - x) = 20x - x^2 $

  Từ đó:

  $ A'(x) = 20 - 2x $

  Đạo hàm bằng $0$ khi $x = 10$.

  Tại đây, hai cạnh bằng nhau. Tức là hình chữ nhật tối ưu chính là hình vuông.

  Nhưng ý nghĩa sâu hơn không nằm ở phép tính. Nó nằm ở sự cân bằng:

  - Nếu một cạnh quá ngắn, diện tích bị bóp nghẹt theo chiều đó.
  - Nếu một cạnh quá dài, cạnh còn lại phải quá ngắn vì chu vi cố định.

  Diện tích lớn nhất xuất hiện khi không còn bên nào "chịu thiệt" hơn bên nào. Hình vuông là hình của *sự cân đối tối ưu*.

  Đó là lý do kết quả này vang xa khỏi chương trình phổ thông: từ các bất đẳng thức hình học tới nguyên lý đẳng hướng trong nhiều hệ vật lý, cân bằng đối xứng thường đi kèm tối ưu.
]

#v(0.8em)

#vd-box("14", "Điểm trên parabol nào gần điểm cố định nhất?")[
  Xét điểm $A(0, 2)$ và parabol $y = x^2$.

  Một điểm bất kỳ trên parabol có dạng $M(x, x^2)$. Bình phương khoảng cách từ $A$ tới $M$ là:

  $ D(x) = x^2 + (x^2 - 2)^2 = x^4 - 3x^2 + 4 $

  Ta tối ưu $D(x)$ thay vì khoảng cách, vì căn bậc hai không làm đổi vị trí cực tiểu.

  Khi đó:

  $ D'(x) = 4x^3 - 6x = 2x (2x^2 - 3) $

  Các điểm tới hạn là:
  $ x = 0 $, $ x = plus.minus sqrt(frac(3, 2)) $

  Điều thú vị ở đây là bài toán hình học đã trở thành bài toán hàm một biến. Toàn bộ khó khăn ban đầu nằm ở việc *chọn tham số hóa đúng*.

  Đây là một bài học rất quan trọng của tối ưu: phép tính đạo hàm thường không phải chỗ sáng tạo nhất. Chỗ sáng tạo nhất là nhìn ra cách mã hóa bài toán thực thành một hàm số đúng.
]

#v(0.8em)

#vd-box("15", "Lợi nhuận lớn nhất khi nào? — nơi hai đạo hàm gặp nhau")[
  Gọi $R(q)$ là doanh thu khi bán $q$ sản phẩm, và $C(q)$ là chi phí tương ứng. Khi đó lợi nhuận là
  $ P(q) = R(q) - C(q) $

  Tối đa hóa $P$ dẫn tới
  $ P'(q) = R'(q) - C'(q) = 0 $

  hay
  $ R'(q) = C'(q) $

  Đây là một công thức kinh tế rất nổi tiếng: *doanh thu cận biên bằng chi phí cận biên*.

  Nếu đọc bằng ngôn ngữ cấu trúc, ta sẽ thấy nó hoàn toàn tự nhiên. Thêm một đơn vị sản phẩm chỉ còn đáng làm khi phần thu thêm đúng bằng phần tốn thêm.
  Trước điểm ấy, làm thêm thì lời. Sau điểm ấy, làm thêm thì phí.

  Như vậy, đạo hàm không còn là biểu tượng xa lạ. Nó trở thành thước đo của câu hỏi rất con người: *thêm một chút nữa có còn đáng không?*
]

#tech-box[
  Có bốn nguyên tắc kỹ thuật mà học sinh giỏi thường nhớ rất chắc khi làm cực trị:

  - *Điều kiện $f'(x) = 0$ chỉ là điều kiện cần*, không phải giấy chứng nhận tối ưu tự động.
  - *Biên của miền* nhiều khi mới là nơi xuất hiện giá trị lớn nhất hoặc nhỏ nhất.
  - Nếu bài toán có ràng buộc, hãy ưu tiên dùng ràng buộc để giảm số biến trước khi đạo hàm.
  - Khi làm xong phép tính, luôn quay lại kiểm tra xem nghiệm có hợp lý về mặt ngữ cảnh không.

  Rất nhiều lời giải sai không vì đạo hàm sai, mà vì người giải quên mất rằng biến số ban đầu là chiều dài, thời gian, số lượng hàng hóa, hay một thể tích phải dương.
]

#meta-box[
  Tối ưu hóa là một trong những nơi đẹp nhất của toán học vì nó ép em trưởng thành về tư duy.

  Em không thể lao vào tính ngay. Em phải tự hỏi:

  - Ta đang thật sự muốn tối ưu cái gì?
  - Điều gì là tự do, điều gì là ràng buộc?
  - Nếu một đại lượng tăng lên, cái giá phải trả nằm ở đâu?

  Đó là các câu hỏi của toán học, nhưng cũng là các câu hỏi của thiết kế, kinh tế, quản trị, và thậm chí cả đời sống cá nhân.
]

#link-box[
  Cực trị trong chương này là cửa ngõ của những vùng đất lớn hơn: tối ưu lồi trong khoa học dữ liệu, nguyên lý tác dụng tối thiểu trong vật lý,
  bài toán biến phân trong hình học, và cả những mô hình ra quyết định trong kinh tế học. Điểm chung luôn là như nhau: có một đại lượng mục tiêu và một thế giới ràng buộc.
]

#open-q[
  Mỗi khi nghe chữ "tối ưu", đừng nghĩ ngay tới công thức. Hãy hỏi trước: đâu là các lực đang kéo ngược nhau, và đâu là dấu hiệu cho thấy chúng đã cân bằng?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §14. TIỆM CẬN — KHI HÀM SỐ BAY VỀ VÔ CỰC
// ════════════════════════════════════════════════════════════════

#sec("14", "Tiệm Cận — Khi Hàm Số Bay Về Vô Cực")

#why-box[
  Có một kiểu hiểu rất non về hàm số: chỉ nhìn những gì xảy ra quanh vài điểm quen thuộc rồi tưởng đã hiểu toàn bộ.
  Nhưng nhiều hàm số chỉ bộc lộ bản chất thật của mình khi ta hỏi: *ở rất xa thì sao?* hoặc *khi tiến sát một bờ vực thì sao?*

  Tiệm cận ra đời từ chính nhu cầu ấy. Nó là ngôn ngữ để nói về *hành vi giới hạn*. Không phải giá trị tại một điểm,
  mà là xu hướng khi tiến mãi, tiến mãi, hoặc tiến sát tới một ranh giới.
]

#eye-box[
  Một tiệm cận không phải là bức tường cấm đồ thị tồn tại mãi mãi. Nó là *đường chân trời hành vi*.

  - Với tiệm cận đứng, đồ thị lao lên hoặc lao xuống vô hạn khi tiến sát một giá trị của $x$.
  - Với tiệm cận ngang, đồ thị dần ổn định quanh một độ cao cố định khi $x$ ra rất xa.
  - Với tiệm cận xiên, đồ thị về lâu dài đi gần một đường thẳng nghiêng.

  Tiệm cận vì thế dạy ta nhìn xa. Nó hỏi không phải "điểm này bằng bao nhiêu", mà là "về lâu dài, quỹ đạo này muốn giống cái gì".
]

#core-box[
  Ý tưởng cốt lõi của tiệm cận có thể nén vào một câu:

  *Một đối tượng phức tạp có thể mang một hình dạng đơn giản khi nhìn ở vô cực.*

  Đó là một tư tưởng lớn của toán học. Không chỉ với hàm số, mà cả trong xác suất, vật lý thống kê, giải tích số, và khoa học dữ liệu.
  Khi hệ đủ lớn hoặc đủ xa, cấu trúc thô trở nên rõ hơn và nhiều chi tiết nhỏ bị trung bình hóa đi.
]

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 10pt,
  [
    #block(fill: rgb("#FFF3E0"), inset: 10pt, radius: 6pt, stroke: 1pt + C-AMBER)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(weight: "bold", fill: C-AMBER)[Tiệm cận đứng]]
      Xảy ra khi $x$ tiến tới một mốc mà hàm số bùng nổ lên $plus.minus oo$.
    ]
  ],
  [
    #block(fill: rgb("#E8F5E9"), inset: 10pt, radius: 6pt, stroke: 1pt + C-GREEN)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(weight: "bold", fill: C-GREEN)[Tiệm cận ngang]]
      Xảy ra khi $f(x)$ tiến gần một hằng số khi $x -> plus.minus oo$.
    ]
  ],
  [
    #block(fill: rgb("#E3F2FD"), inset: 10pt, radius: 6pt, stroke: 1pt + C-INDIGO)[
      #set par(first-line-indent: 0em)
      #align(center)[#text(weight: "bold", fill: C-INDIGO)[Tiệm cận xiên]]
      Xảy ra khi đồ thị ngày càng áp sát một đường thẳng nghiêng $y = a x + b$.
    ]
  ],
)

#v(0.9em)

#vd-box("16", "Một hàm hữu tỉ đơn giản nhưng rất biết kể chuyện")[
  Xét hàm số
  $ f(x) = frac(2x + 1, x - 1) $

  Thay vì nhìn nó như một phân thức, ta tách nó ra:

  $ f(x) = 2 + frac(3, x - 1) $

  Chỉ một phép biến đổi nhỏ mà bức tranh trở nên trong suốt.

  - Vì mẫu số bằng $0$ tại $x = 1$, hàm không xác định ở đó.
  - Khi $x$ tiến rất gần $1$, phân số $frac(3, x - 1)$ có độ lớn rất lớn. Đó là dấu hiệu của tiệm cận đứng $x = 1$.
  - Khi $x$ ra rất xa, phân số $frac(3, x - 1)$ tiến về $0$. Do đó $f(x)$ tiến về $2$. Ta có tiệm cận ngang $y = 2$.

  Đọc theo ngôn ngữ hình học, đồ thị của hàm số này chỉ là đồ thị của $frac(3, x)$ được tịnh tiến sang phải một đơn vị và nâng lên hai đơn vị.
  Nhiều bài toán về tiệm cận bỗng trở nên đơn giản khi ta học cách *lột lớp vỏ công thức để lộ bộ khung hành vi*.
]

#v(0.8em)

#vd-box("17", "Tiệm cận xiên không khó; nó chỉ là một tiệm cận ngang cho phần dư")[
  Xét hàm số
  $ g(x) = frac(x^2 + 1, x - 1) $

  Chia đa thức, ta được:

  $ g(x) = x + 1 + frac(2, x - 1) $

  Từ đây ta thấy ngay:

  - Khi $x$ rất xa, phần $frac(2, x - 1)$ tiến về $0$.
  - Vì vậy, đồ thị của $g$ ngày càng gần đường thẳng $y = x + 1$.

  Đây là một quan sát đáng nhớ: *tiệm cận xiên xuất hiện khi sau khi tách ra, phần còn thừa trở nên rất nhỏ.*

  Nói cách khác, để tìm tiệm cận xiên, ta không tìm một đường thẳng "chạm" đồ thị, mà tìm một đường thẳng sao cho *sai số giữa chúng tan biến ở vô cực*.
]

#v(0.8em)

#vd-box("18", "Tại sao quy tắc L'Hospital lại có lý về mặt trực giác?")[
  Khi gặp các giới hạn kiểu bất định
  $ frac(0, 0) $
  hay
  $ frac(oo, oo) $
  điều gây bối rối không phải là tử hay mẫu quá bé hoặc quá lớn, mà là *ta chưa biết ai thay đổi nhanh hơn ai*.

  Tư tưởng của quy tắc L'Hospital là rất tự nhiên: nếu cả tử và mẫu đều đang cùng đi về $0$, hãy tạm bỏ giá trị của chúng sang một bên và so sánh *tốc độ đi về $0$*.
  Tức là so sánh đạo hàm.

  Điều này thống nhất hoàn hảo với tinh thần toàn chương. Khi giá trị trực tiếp làm ta mù, hãy nhìn sang đạo hàm để đọc hành vi cục bộ. Khi hành vi cục bộ đã rõ, giới hạn toàn cục sẽ sáng ra.

  Quy tắc ấy không phải một mẹo bất ngờ rơi từ trời xuống. Nó là hậu quả của triết lý vi phân: *nhiều khi hiểu sự biến thiên quan trọng hơn hiểu bản thân giá trị.*
]

#tech-box[
  *Một định nghĩa sạch sẽ cho tiệm cận xiên* là:

  Đường thẳng $y = a x + b$ là tiệm cận xiên của $f(x)$ nếu
  $ f(x) - (a x + b) -> 0 $
  khi $x -> plus.minus oo$.

  Định nghĩa này rất mạnh vì nó nói chính xác điều ta đang cảm: khoảng cách thẳng đứng từ đồ thị tới đường thẳng ấy đang tiêu biến.

  Từ đó, kỹ thuật không còn là một công thức mẹo, mà chỉ là cách bóc tách biểu thức sao cho phần dư hiện rõ.
]

#meta-box[
  Tiệm cận dạy một bài học tư duy sâu: *đừng nhầm một xu hướng với một điểm đến.*

  Có những hàm số tiến mãi về một giá trị mà không bao giờ chạm tới. Có những hệ thống xã hội tiến gần một trạng thái cân bằng nhưng luôn dao động quanh nó.
  Có những quá trình học tập ngày càng tốt hơn nhưng cải thiện thêm mỗi ngày trở nên nhỏ dần. Ngôn ngữ của tiệm cận không chỉ nói về đồ thị; nó nói về mọi quá trình mà "cái về sau" có cấu trúc đơn giản hơn "cái lúc này".
]

#link-box[
  Trong Xác suất, định lý giới hạn trung tâm mô tả hành vi tiệm cận của tổng nhiều biến ngẫu nhiên. Trong Phân tích thuật toán,
  ký hiệu $O$, $Theta$, $Omega$ đều là ngôn ngữ tiệm cận để nói về hành vi khi kích thước đầu vào rất lớn. Trong Vật lý, nhiều mô hình chỉ lộ quy luật đơn giản ở thang rất lớn hoặc rất nhỏ.
  Tiệm cận vì thế là chiếc cầu nối giữa tính cụ thể và bức tranh vĩ mô.
]

#open-q[
  Một công thức rối có thể che mắt em ở cự ly gần. Nhưng nếu em lùi đủ xa và hỏi đúng câu hỏi về giới hạn,
  có khi cả đối tượng chỉ còn là một đường thẳng hoặc một hằng số. Học toán sâu là học cách chọn đúng cự ly nhìn.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §15. PHƯƠNG TRÌNH HÀM SỐ — ĐẾM GIAO ĐIỂM LÀ NGHỆ THUẬT
// ════════════════════════════════════════════════════════════════

#sec("15", "Phương Trình Hàm Số — Đếm Giao Điểm Là Nghệ Thuật")

#why-box[
  Nhiều học sinh nghĩ giải phương trình là một chuyện thuần đại số: biến đổi, phân tích nhân tử, đặt ẩn phụ. Những kỹ năng ấy quan trọng, nhưng chưa chạm vào hạt nhân.

  Hạt nhân sâu hơn là thế này: *mỗi phương trình là một câu hỏi về giao điểm*. Giải $f(x) = g(x)$ tức là đi tìm nơi hai câu chuyện cho cùng một giá trị.
  Giải $f(x) = k$ tức là hỏi đường cong cắt đường thẳng ngang bao nhiêu lần.

  Một khi em nhìn phương trình như bài toán giao điểm, toàn bộ đạo hàm, đơn điệu, cực trị, và độ cong bỗng đổ dồn về phục vụ cùng một mục đích: *đếm nghiệm mà không cần giải tường minh*.
]

#eye-box[
  Hãy tưởng tượng em đang kéo một sợi dây ngang $y = m$ lên xuống qua một đồ thị cố định.
  Mỗi lần sợi dây cắt đường cong là một nghiệm của phương trình
  $ f(x) = m $

  Khi kéo dây lên cao hơn, số giao điểm có thể đổi. Nhưng nó chỉ đổi khi dây đi qua các mức đặc biệt như cực đại hoặc cực tiểu.

  Đây là nơi đạo hàm trở thành nghệ thuật đếm. Nó không trực tiếp cho nghiệm, nhưng nó cho biết *những ngưỡng mà tại đó số nghiệm có thể thay đổi*.
]

#core-box[
  Có một nguyên lý rất mạnh:

  *Tính đơn điệu chia đồ thị thành những đoạn mà trên mỗi đoạn, phương trình $f(x) = k$ có nhiều nhất một nghiệm.*

  Vì thế, muốn đếm nghiệm toàn cục, ta chỉ cần:

  - chia đồ thị thành các khoảng đơn điệu,
  - nhìn các giá trị biên của từng khoảng,
  - rồi đếm xem mức $k$ đi qua được bao nhiêu nhánh.

  Đây là cách giải cực kỳ bản chất cho nhiều bài toán tham số.
]

#vd-box("19", "Đếm nghiệm của $x^3 - 3x = m$ mà không giải phương trình bậc ba")[
  Xét hàm số quen thuộc
  $ f(x) = x^3 - 3x $

  Ta đã biết:

  - hàm tăng trên khoảng bên trái,
  - giảm ở giữa,
  - rồi tăng lại bên phải,

  với cực đại địa phương bằng $2$ và cực tiểu địa phương bằng $-2$.

  Bây giờ xét phương trình
  $ x^3 - 3x = m $

  tức là hỏi đường thẳng $y = m$ cắt đồ thị của $f$ bao nhiêu lần.

  Từ hình học, ta đọc ngay:

  - Nếu $-2 lt m lt 2$, đường thẳng cắt đồ thị tại ba điểm phân biệt. Phương trình có ba nghiệm thực.
  - Nếu $m = 2$ hoặc $m = -2$, đường thẳng đi qua đỉnh hoặc đáy. Khi đó có nghiệm kép và tổng cộng hai nghiệm thực phân biệt.
  - Nếu $m gt 2$ hoặc $m lt -2$, đường thẳng chỉ cắt một nhánh. Phương trình có đúng một nghiệm thực.

  Điều đẹp nhất ở đây là ta đếm được cấu trúc nghiệm mà không cần giải công thức Cardano. Đạo hàm đã cho ta một bản đồ mạnh hơn cả lời giải tường minh.
]

#v(0.8em)

#vd-box("20", "Tham số không phải kẻ thù; nó chỉ là một nút trượt")[
  Nhiều bài toán tham số làm học sinh sợ vì ký hiệu $m$ khiến mọi thứ trông mờ mịt. Nhưng về bản chất, tham số thường chỉ là một *nút trượt* đang di chuyển một đồ thị hay một đường thẳng.

  Ví dụ, với phương trình
  $ f(x) = m $
  thì $m$ không làm thay đổi bản thân $f$. Nó chỉ kéo đường ngang $y = m$ lên xuống.

  Với phương trình
  $ f(x + m) = 0 $
  thì tham số đang tịnh tiến đồ thị theo phương ngang.

  Khi hiểu tham số là chuyển động hình học chứ không phải ký hiệu ma thuật, ta thôi bị choáng ngợp và bắt đầu biết nên nhìn cái gì.
]

#v(0.8em)

#vd-box("21", "Một cách đếm nghiệm bằng đạo hàm và giá trị biên")[
  Giả sử $f$ tăng nghiêm ngặt trên một khoảng $I$. Khi đó phương trình
  $ f(x) = k $
  có nhiều nhất một nghiệm trên $I$.

  Đây là một phát biểu đơn giản nhưng cực mạnh. Nó cho phép ta giải nhiều bài toán như sau:

  - Chia trục số thành vài khoảng nhờ các điểm tới hạn.
  - Trên mỗi khoảng, kiểm tra tính đơn điệu bằng dấu của đạo hàm.
  - So sánh $k$ với các giá trị biên hoặc giới hạn đầu mút.

  Mỗi khoảng lúc ấy giống như một hành lang chỉ có thể chứa tối đa một giao điểm. Toàn bộ bài toán đếm nghiệm trở thành bài toán đếm số hành lang mà mức $k$ đi qua.

  Đó là một cách nghĩ trưởng thành: không đi tìm nghiệm bằng sức mạnh đại số thuần túy, mà dựng trước một kiến trúc logic để giới hạn số khả năng.
]

#tech-box[
  Có một mối liên hệ sâu giữa số nghiệm của một hàm và số nghiệm của đạo hàm của nó.

  Nếu một hàm trơn có rất nhiều giao điểm với trục hoành, thì theo tinh thần của định lý Rolle, giữa hai nghiệm liên tiếp của nó phải có một điểm mà đạo hàm bằng $0$.
  Vì vậy, *nhiều nghiệm của $f$ buộc đạo hàm $f'$ cũng phải có nghiệm*.

  Tư tưởng này giải thích tại sao việc khảo sát $f'$ thường cho ta quyền lực đối với phương trình $f(x) = 0$. Ta không nhất thiết giải phương trình, nhưng ta khóa được số lượng và vị trí tương đối của nghiệm.
]

#meta-box[
  Đếm nghiệm là một kỹ năng nhận thức rất đẹp vì nó buộc ta từ bỏ ám ảnh "phải giải ra chính xác".

  Trong toán học hiện đại, rất nhiều câu hỏi quan trọng không đòi giá trị tường minh. Người ta chỉ cần biết:

  - có tồn tại hay không,
  - có bao nhiêu,
  - nằm ở đâu,
  - phụ thuộc vào tham số thế nào.

  Đó là một bước trưởng thành lớn: từ tính toán sang cấu trúc.
]

#link-box[
  Trong Giải tích số, nhiều thuật toán chỉ cần biết một khoảng chứa đúng một nghiệm để bắt đầu tìm gần đúng. Trong Cơ học,
  số nghiệm cân bằng của một hệ phụ thuộc mạnh vào hình dạng của thế năng. Trong Kinh tế học, số giao điểm giữa cung và cầu biểu diễn số trạng thái cân bằng thị trường.
  Mọi nơi đều cùng một câu chuyện: giao điểm là nghiệm của một mối thương lượng.
]

#open-q[
  Khi gặp một phương trình khó, em có thể thử đổi câu hỏi. Đừng hỏi ngay "nghiệm là gì?". Hỏi trước: có bao nhiêu giao điểm, và số đó chỉ có thể thay đổi khi nào?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §16. BIẾN HÌNH ĐỒ THỊ — NGÔN NGỮ CỦA PHÉP BIẾN ĐỔI
// ════════════════════════════════════════════════════════════════

#sec("16", "Biến Hình Đồ Thị — Ngôn Ngữ Của Phép Biến Đổi")

#why-box[
  Nhiều em học thuộc một danh sách khá vô hồn: cộng ngoài thì tịnh tiến lên xuống, cộng trong thì tịnh tiến trái phải, nhân ngoài thì co dãn đứng,
  nhân trong thì co dãn ngang, dấu trừ ngoài là đối xứng qua trục hoành, dấu trừ trong là đối xứng qua trục tung.

  Nếu chỉ dừng ở mức thuộc lòng, phần này rất dễ rối vì mọi quy tắc đều na ná nhau. Nhưng thật ra tất cả có thể thống nhất chỉ bằng một ý tưởng:
  *em đang tác động vào đầu vào của chiếc máy hàm số hay tác động vào đầu ra của nó?*
]

#eye-box[
  Hãy nhìn hàm số như một chiếc máy.

  - Em bỏ vào một số $x$.
  - Máy xử lý nó theo luật $f$.
  - Máy trả ra một giá trị $f(x)$.

  Vậy thì mọi phép biến hình đều thuộc một trong hai họ lớn:

  - *Tác động vào đầu ra:* thay kết quả sau khi máy đã chạy xong.
  - *Tác động vào đầu vào:* thay thứ được đưa vào máy ngay từ đầu.

  Khi đã thấy hai họ lớn này, tất cả các phép dịch, co, giãn, đối xứng bỗng trở thành một ngữ pháp chung thay vì mười mẹo lẻ.
]

#core-box[
  Đây là bảng tinh thần quan trọng nhất của mục này:

  - $f(x) + b$: giữ nguyên đầu vào, nâng hoặc hạ toàn bộ đầu ra.
  - $c f(x)$: giữ nguyên đầu vào, khuếch đại hoặc nén đầu ra.
  - $f(x - a)$: thay đổi đầu vào sao cho muốn nhận giá trị cũ tại $x_0$, em phải đứng ở vị trí mới $x_0 + a$.
  - $f(c x)$: tăng hoặc giảm "tốc độ quét" theo phương ngang.
  - $-f(x)$: lật mọi đầu ra qua trục hoành.
  - $f(-x)$: lật mọi đầu vào qua trục tung.

  Hai dòng ở đầu là *hành động sau máy*. Bốn dòng sau là *hành động trước máy*. Chính vì thế, các quy tắc bên trong thường tạo cảm giác "ngược chiều" so với trực giác ban đầu của người mới học.
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 10pt,
  [
    #block(fill: rgb("#EEF4FF"), inset: 10pt, radius: 6pt, stroke: 1pt + C-INDIGO)[
      #set par(first-line-indent: 0em)
      *Tác động vào đầu ra*

      $f(x) + b$, $c f(x)$

      Hình dạng ngang giữ nguyên, độ cao thay đổi.
    ]
  ],
  [
    #block(fill: rgb("#FFF6EA"), inset: 10pt, radius: 6pt, stroke: 1pt + C-AMBER)[
      #set par(first-line-indent: 0em)
      *Tác động vào đầu vào*

      $f(x - a)$, $f(c x)$, $f(-x)$

      Đồ thị phản ứng theo phương ngang và thường có cảm giác đảo chiều.
    ]
  ],
)

#v(0.8em)

#vd-box("22", "Từ $y = x^2$ tới $y = -(x - 2)^2 + 3$ — một câu chuyện chứ không chỉ là một công thức")[
  Bắt đầu từ parabol nền
  $ y = x^2 $

  Bây giờ xét hàm
  $ y = -(x - 2)^2 + 3 $

  Ta có thể đọc nó tuần tự như sau:

  - *$(x - 2)$:* dịch đồ thị sang phải $2$ đơn vị.
  - *Dấu trừ phía ngoài:* lật đồ thị qua trục hoành.
  - *$+ 3$ phía ngoài:* nhấc toàn bộ đồ thị lên $3$ đơn vị.

  Nhưng còn một cách đọc đẹp hơn: đỉnh của parabol gốc tại $(0, 0)$ được đưa tới $(2, 3)$, đồng thời cái bát ngửa lên biến thành mái vòm úp xuống.

  Đây không còn là danh sách thao tác. Đây là *sự tiến hóa của một hình dạng gốc*.

  Cách học trưởng thành là thế này: thay vì cố nhớ từng quy tắc riêng, em chọn một đồ thị mẹ và tập nhìn mọi đồ thị con như những biến thể có tổ chức của nó.
]

#v(0.8em)

#vd-box("23", "Vì sao $f(x - a)$ lại dịch sang phải thay vì sang trái?")[
  Đây là chỗ rất nhiều học sinh thấy phản trực giác.

  Hãy hỏi đúng câu hỏi. Giả sử điểm $x_0$ của đồ thị cũ cho ra giá trị $f(x_0)$. Trên đồ thị mới $y = f(x - a)$, khi nào em nhận lại đúng giá trị đó?

  Ta cần
  $ x - a = x_0 $

  tức là
  $ x = x_0 + a $

  Nghĩa là để lấy lại giá trị cũ tại $x_0$, em phải đứng ở vị trí mới nằm *bên phải* $a$ đơn vị. Cho nên toàn đồ thị dịch sang phải.

  Một khi hiểu điều này, em sẽ không cần mẹo nhớ nữa. Em chỉ cần nghĩ bằng logic của đầu vào. Những gì xảy ra *bên trong* hàm số luôn phải được đọc bằng câu hỏi: "để máy nhận cùng một thứ như cũ, ta phải đứng ở đâu bây giờ?".
]

#v(0.8em)

#vd-box("24", "Đối xứng và chẵn lẻ — khi công thức bộc lộ một sự cân đối")[
  Hai khái niệm hàm chẵn và hàm lẻ thật ra là hai mệnh đề về đối xứng.

  - Nếu $f(-x) = f(x)$, đồ thị đối xứng qua trục tung.
  - Nếu $f(-x) = -f(x)$, đồ thị đối xứng qua gốc tọa độ.

  Đây là một ví dụ rất đẹp cho việc *đại số hóa hình học*. Một đẳng thức ký hiệu ngắn ngủi đang nói về một đối xứng hình học toàn cục.

  Những đối xứng như thế giúp giảm công việc suy nghĩ đi một nửa. Nếu em hiểu một nửa đồ thị, nửa còn lại tự lộ ra. Toán học luôn thưởng cho ai nhìn thấy đối xứng.
]

#tech-box[
  Một nguyên tắc thực dụng nhưng rất sâu là:

  *Hãy đọc biến hình từ trong ra ngoài, nhưng hãy hiểu nó bằng câu chuyện đầu vào–đầu ra.*

  Ví dụ với hàm
  $ y = 2 f(-3(x - 1)) + 5 $

  người học dễ hoảng. Nhưng nếu bình tĩnh, ta chỉ đang thấy:

  - đầu vào bị dịch,
  - rồi co ngang và phản xạ,
  - đầu ra bị khuếch đại,
  - rồi nâng lên.

  Việc nắm được ngữ pháp này rất quan trọng, vì trong mô hình hóa, người ta hiếm khi phát minh một hàm hoàn toàn mới. Người ta thường lấy một hàm nền rồi biến hình nó cho phù hợp dữ liệu hay hiện tượng thực tế.
]

#meta-box[
  Phép biến hình đồ thị dạy một bài học rất hiện đại: *hiểu một họ đối tượng bằng cách hiểu cách chúng được sinh ra từ một vài nguyên mẫu đơn giản.*

  Đây không chỉ là tư duy của hàm số. Đó là tư duy của đại số trừu tượng, hình học vi phân, xử lý tín hiệu, đồ họa máy tính, và cả khoa học dữ liệu.
  Nhiều khi điều đáng học nhất không phải một đối tượng cụ thể, mà là *nhóm phép biến đổi* tạo ra cả gia đình đối tượng ấy.
]

#link-box[
  Trong Xử lý ảnh, người ta co giãn, tịnh tiến, quay, phản xạ một ảnh. Trong Tín hiệu học, người ta dịch pha, đổi biên độ, đổi tần số một tín hiệu.
  Trong Hình học, người ta nghiên cứu các đối tượng bất biến dưới những phép biến đổi nào. Hàm số ở chương này chỉ là phiên bản mềm và sớm của cùng một trực giác ấy.
]

#open-q[
  Khi thấy một công thức mới, thử hỏi: đây có thật là một hàm số mới, hay chỉ là một hình dạng quen được tịnh tiến, co giãn, phản xạ, hoặc nâng hạ?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §17. MÔ HÌNH HÓA — KHI TOÁN HỌC CHẠM THỰC TẾ
// ════════════════════════════════════════════════════════════════

#sec("17", "Mô Hình Hóa — Khi Toán Học Chạm Thực Tế")

#why-box[
  Đây là một sự thật cần nói thẳng: hàm số không được sinh ra để có mặt trong đề thi. Hàm số được sinh ra vì con người cần một ngôn ngữ để nén các phụ thuộc của thế giới thành một cấu trúc có thể suy luận.

  Khi một bác sĩ hỏi nồng độ thuốc trong máu thay đổi ra sao theo thời gian, khi một kỹ sư hỏi chiếc cầu võng xuống bao nhiêu dưới tải trọng,
  khi một nhà kinh tế hỏi sản lượng phụ thuộc thế nào vào giá, họ đều đang đặt một câu hỏi hàm số.

  Mô hình hóa là bước chuyển từ thế giới lộn xộn sang thế giới có cấu trúc. Nó không sao chép hiện thực nguyên xi. Nó chọn lọc cái nào đáng giữ để một câu hỏi trở nên giải được.
]

#quote-block[
  Một mô hình tốt không phải bức ảnh chụp mọi chi tiết. Nó là tấm bản đồ giữ lại đúng những điều em cần để không đi lạc.
]

#core-box[
  Mọi bài toán mô hình hóa nghiêm túc đều gồm bốn quyết định:

  - Chọn *biến* nào là quan trọng.
  - Chọn *đại lượng đầu ra* nào cần dự đoán hoặc tối ưu.
  - Chấp nhận bỏ qua những yếu tố nào để mô hình còn thao tác được.
  - Kiểm tra xem kết luận rút ra có còn hợp lý khi quay về thế giới thật hay không.

  Nếu thiếu bước thứ tư, toán học dễ biến thành ảo thuật ký hiệu. Mô hình hóa không kết thúc khi đạo hàm bằng $0$; nó kết thúc khi kết quả quay lại nói được điều gì đó đúng đắn về hiện thực.
]

#eye-box[
  Học sinh thường sợ bài toán thực tế vì tưởng phải hiểu đủ mọi chi tiết của đời sống. Không cần như vậy.
  Điều quan trọng hơn là thấy được *kiến trúc phụ thuộc*.

  - Cái gì đang tăng rồi giảm?
  - Cái gì có một mức tối ưu?
  - Cái gì tiến dần tới một ngưỡng bão hòa?
  - Cái gì có một điểm bẻ lái quan trọng?

  Khi nhìn hiện tượng bằng các hình dạng ấy, em đang bắt đầu trở thành người mô hình hóa.
]

#vd-box("25", "Nồng độ thuốc trong máu — một đường cong không chỉ đi xuống")[
  Nếu chỉ tiêm thuốc trực tiếp vào máu rồi để cơ thể đào thải, một mô hình đơn giản có thể là hàm mũ giảm dần. Nhưng với nhiều loại thuốc uống,
  nồng độ trong máu thường *tăng lên trước rồi mới giảm xuống*: thuốc cần thời gian hấp thu rồi mới bị đào thải.

  Một mô hình sơ cấp nhưng hữu ích là
  $ C(t) = A t e^(-k t) $

  với $A gt 0$, $k gt 0$.

  Hàm này bắt đầu từ $0$, tăng lên, đạt cực đại, rồi giảm dần về $0$.

  Ta tính:
  $ C'(t) = A e^(-k t) (1 - k t) $

  Nên cực đại xuất hiện khi
  $ 1 - k t = 0 $

  tức là
  $ t = frac(1, k) $

  Điều có ý nghĩa y khoa ở đây không chỉ là một con số. Nó trả lời các câu hỏi thực: khi nào thuốc đạt nồng độ cao nhất, lúc nào nên đo đáp ứng, và lịch uống nào tạo hiệu quả tốt nhất.

  Mô hình hóa thành công là khi đạo hàm bắt đầu nói được điều hữu ích ngoài đời.
]

#v(0.8em)

#vd-box("26", "Tăng trưởng logistic — tại sao nhiều quá trình lớn nhanh rồi chậm lại?")[
  Dân số vi khuẩn, lượt người dùng của một ứng dụng, hay số học sinh tiếp thu một kỹ năng mới thường không tăng mãi theo cùng một tốc độ.
  Ban đầu tăng chậm, rồi tăng rất nhanh, sau đó chậm dần khi gần đạt trần.

  Một mô hình kinh điển cho hiện tượng ấy là hàm logistic:
  $ P(t) = frac(K, 1 + c e^(-r t)) $

  Trong đó:

  - $K$ là mức trần dài hạn,
  - $r$ là tốc độ tăng,
  - $c$ quyết định trạng thái ban đầu.

  Đồ thị của logistic có một điểm uốn rất nổi tiếng: trước điểm ấy, tốc độ tăng còn đang gia tốc; sau điểm ấy, hệ vẫn tăng nhưng bắt đầu hụt hơi.

  Đây là một ví dụ tuyệt đẹp cho việc đạo hàm bậc nhất và bậc hai cùng kể chuyện:

  - $P'(t)$ cho biết hệ đang tăng nhanh tới đâu.
  - $P''(t)$ cho biết tốc độ tăng ấy đang được khuếch đại hay đang bị kìm lại.

  Học sinh nào hiểu logistic sẽ hiểu sâu một điều: *rất nhiều hệ trong đời không thất bại vì ngừng tăng; chúng thất bại vì không nhìn ra sớm lúc độ cong đã đổi dấu.*
]

#v(0.8em)

#vd-box("27", "Chi phí trung bình và quy mô sản xuất — đạo hàm như tiếng nói của quyết định")[
  Giả sử một nhà máy có tổng chi phí sản xuất $q$ sản phẩm là $C(q)$. Khi đó chi phí trung bình là
  $ A(q) = frac(C(q), q) $

  Một câu hỏi rất thực tế là: sản xuất ở quy mô nào thì chi phí trung bình nhỏ nhất?

  Đây không còn là bài tập vô thưởng vô phạt. Nó liên quan trực tiếp tới chiến lược sản xuất, mức giá, và năng lực cạnh tranh.

  Khi khảo sát $A(q)$, ta đang hỏi: ở quy mô nào, lợi thế do chia đều chi phí cố định bắt đầu bị lấn át bởi sự phình to của chi phí biến đổi?

  Mỗi cực tiểu trong kinh tế đều là dấu vết của một cuộc đàm phán giữa những lực đối nghịch. Đó là cùng cấu trúc mà ta đã thấy ở bài toán hình học tối ưu.
]

#v(0.8em)

#vd-box("28", "Ánh sáng, con đường ngắn nhất, và tư duy hàm số")[
  Trong vật lý, ánh sáng không luôn đi theo đường ngắn nhất về mặt hình học; nó đi theo đường khiến *thời gian truyền* là tối ưu.
  Đây là tinh thần của nguyên lý Fermat.

  Nếu môi trường truyền có tính chất thay đổi từ nơi này sang nơi khác, thời gian đi của tia sáng trở thành một đại lượng phụ thuộc vào đường đi.
  Khi đó, câu hỏi vật lý được dịch thành một câu hỏi tối ưu hóa.

  Ở mức phổ thông, ta chưa cần toàn bộ giải tích biến phân để hiểu điều này. Chỉ cần nhận ra một thông điệp lớn hơn: *rất nhiều quy luật tự nhiên có thể được phát biểu như việc tối ưu một hàm mục tiêu nào đó.*

  Tức là, hàm số không chỉ mô tả hiện tượng sau khi nó xảy ra. Đôi khi nó chính là nguyên lý tổ chức ẩn đằng sau hiện tượng.
]

#tech-box[
  Có ba tiêu chuẩn giúp đánh giá một mô hình sơ cấp có tốt hay không:

  - *Đúng đơn vị:* các đại lượng phải khớp về ý nghĩa vật lý.
  - *Đúng hình dạng:* đồ thị phải phù hợp với câu chuyện thực tế, ví dụ tăng rồi bão hòa, hoặc tăng rồi giảm.
  - *Đúng phạm vi:* mô hình chỉ được tin trong miền mà giả thiết của nó còn hợp lý.

  Đây là lý do mô hình hóa khó hơn giải bài tập kỹ thuật. Nó buộc em vừa phải biết tính, vừa phải biết nghi ngờ và kiểm tra.
]

#meta-box[
  Trong giáo dục, người ta thường vô tình tách toán ra khỏi thế giới thật để dễ chấm điểm. Nhưng về bản chất, toán học trưởng thành luôn quay về với thực tại.

  Người biết mô hình hóa không hỏi trước "công thức nào dùng được". Họ hỏi:

  - biến nào đóng vai trò nguyên nhân,
  - biến nào là phản ứng,
  - cấu trúc quan hệ thuộc kiểu nào,
  - và mức gần đúng nào là chấp nhận được.

  Đó là một kiểu trưởng thành trí tuệ rất quý: biết bỏ bớt chi tiết để giữ lấy cấu trúc.
]

#link-box[
  Từ dịch bệnh, học máy, tài chính, truyền nhiệt, đến sinh thái học, nơi nào cũng cần mô hình hóa. Chương hàm số ở phổ thông là bài học đầu tiên về kỹ năng ấy.
  Nếu học đúng, đây không phải chỉ là một chương toán. Nó là buổi nhập môn vào cách khoa học biến thế giới thành thứ có thể suy nghĩ được.
]

#open-q[
  Khi đứng trước một hiện tượng thật, em có dám bỏ qua nhiều chi tiết để giữ lấy vài biến cốt lõi không? Mô hình hóa luôn là nghệ thuật đánh đổi giữa sự trung thực và khả năng thao tác.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §18. MƯỜI LĂM BÀI TOÁN HÉ LỘ KIẾN TRÚC ẨN
// ════════════════════════════════════════════════════════════════

#sec("18", "Mười Lăm Bài Toán Hé Lộ Kiến Trúc Ẩn")

#why-box[
  Phần này không phải một danh sách bài tập để luyện tay. Nó là một *phòng trưng bày cấu trúc*.

  Mỗi bài toán dưới đây giống như một ô cửa sổ mở ra một vùng khác của thế giới, nhưng đằng sau các bối cảnh khác nhau ấy,
  em sẽ thấy những ý tưởng quen thuộc lặp lại: hàm số, đạo hàm, độ cong, tối ưu, giới hạn, cân bằng, và biến hình.

  Nếu chương này thành công, em sẽ không còn hỏi "đạo hàm dùng để làm bài nào". Em sẽ bắt đầu hỏi đúng hơn:
  *đây là một bài toán về tốc độ thay đổi, về tối ưu, về độ cong, hay về giao điểm?*
]

#core-box[
  Có bốn mô típ lớn mà mười lăm bài toán sau đây lặp đi lặp lại:

  - *Tối ưu:* hệ tìm một cấu hình tốt nhất dưới ràng buộc.
  - *Cân bằng:* hai lực hoặc hai xu hướng gặp nhau tại một trạng thái ổn định.
  - *Hình dạng:* một phương trình để lộ tính cách hình học của đối tượng.
  - *Tiệm cận:* khi nhìn đủ xa, hành vi phức tạp bỗng đơn giản lại.

  Người học sâu không nhớ rời rạc mười lăm tình huống. Người ấy nhận ra chỉ có vài giai điệu lớn đang chơi lại trong nhiều bản phối khác nhau.
]

#text(fill: C-NAVY, weight: "bold", size: 11pt)[NHÓM A. TỐI ƯU VÀ CÂN BẰNG TRONG TỰ NHIÊN]

#v(0.5em)

#vd-box("29", "Vì sao bọt xà phòng chọn hình làm diện tích nhỏ nhất?")[
  Một màng xà phòng mang năng lượng tỉ lệ với diện tích bề mặt của nó. Vì thế, nếu hệ được tự do ổn định, nó sẽ cố tiến tới cấu hình có diện tích nhỏ nhất trong những cấu hình còn giữ được ràng buộc cho trước.

  Đây là một tuyên bố rất hàm số: có một đại lượng mục tiêu cần tối thiểu hóa, có một miền cấu hình khả dĩ, và hệ tự nhiên "giải" một bài toán tối ưu mà không cần biết giải tích.

  Khi em nhìn một bong bóng xà phòng, em đang nhìn thấy một lời giải hình học cho một bài toán cực trị. Điều này thay đổi hoàn toàn cảm giác về đạo hàm: nó không còn là trò bàn giấy, mà là ngôn ngữ viết nên hình dạng của vật chất.
]

#v(0.6em)

#vd-box("30", "Cổng vòm St. Louis và câu hỏi: phương trình nào đang đội sức nặng?")[
  Người mới học thường nghĩ hình dạng chỉ là chuyện thẩm mỹ. Kỹ sư thì biết hình dạng là cách lực được phân bố.

  Một dây xích treo tự do có một đường cong tự nhiên riêng. Khi lật ngược đường cong đó, ta thu được một dạng vòm chịu nén rất hiệu quả. Điều đáng nhớ không phải là tên công thức cụ thể, mà là ý tưởng: *một phương trình không chỉ vẽ hình; nó nói về cơ chế tải lực*.

  Đó là một bài học lớn của hàm số. Hai đồ thị nhìn hơi giống nhau có thể mang những định luật nội tại rất khác. Học sâu không phải chỉ phân biệt bằng mắt, mà phân biệt bằng câu hỏi: cấu trúc vật lý nào đang sinh ra hình này?
]

#v(0.6em)

#vd-box("31", "Con đường nhanh nhất không nhất thiết là đường ngắn nhất")[
  Bài toán đường cong brachistochrone nổi tiếng hỏi: giữa hai điểm, vật trượt không ma sát theo đường nào để xuống nhanh nhất dưới tác dụng của trọng lực?

  Nếu chỉ theo trực giác hình học sơ cấp, ta dễ nghĩ đường thẳng là lựa chọn hợp lý. Nhưng tự nhiên trả lời khác: đường tối ưu phải đủ dốc ban đầu để vật tăng tốc sớm, rồi đủ thoải về sau để tận dụng vận tốc đã có.

  Đây là một ví dụ tuyệt đẹp cho việc tối ưu không phải luôn là "ngắn nhất" theo nghĩa đơn giản. Nó là sự thương lượng giữa nhiều hiệu ứng. Và đạo hàm chính là thiết bị đo cuộc thương lượng ấy.
]

#v(0.6em)

#vd-box("32", "Tại sao tàu lượn siêu tốc không dùng một vòng tròn hoàn hảo?")[
  Nếu một tàu lượn đi vào một vòng tròn hoàn hảo quá đột ngột, gia tốc pháp tuyến thay đổi mạnh khiến hành khách chịu cảm giác giật rất khó chịu.

  Thiết kế hiện đại vì thế ưu tiên những đường cong có độ cong thay đổi dần dần. Nói theo ngôn ngữ giải tích, không chỉ vị trí và vận tốc phải hợp lý; *độ cong* và sự thay đổi của độ cong cũng quan trọng.

  Đây là bài học của đạo hàm bậc hai và cao hơn: trong kỹ thuật, sự trơn tru không chỉ là đẹp. Nó là an toàn. Một đồ thị tốt đôi khi là một đồ thị mà các đạo hàm của nó cư xử tử tế với cơ thể con người.
]

#v(0.6em)

#vd-box("33", "Thị trường cân bằng ở đâu? — nơi hai đồ thị kể cùng một câu chuyện")[
  Khi đường cung và đường cầu cắt nhau, đó không đơn thuần là giao điểm của hai nét mực. Nó là một trạng thái cân bằng của động lực kinh tế:

  - Giá cao hơn mức đó làm dư hàng.
  - Giá thấp hơn mức đó làm thiếu hàng.

  Bài toán này là một bản sao xã hội học của phương trình $f(x) = g(x)$. Ta không cần luôn tìm công thức đẹp cho nghiệm. Nhiều khi điều quan trọng hơn là biết có một điểm cân bằng, có mấy điểm, và nó ổn định hay không khi bị nhiễu nhẹ.

  Đây là chỗ giao thoa rất đẹp giữa hàm số, giao điểm, và động lực học. Một ý tưởng phổ thông nhỏ đã chạm vào trái tim của kinh tế học hiện đại.
]

#pagebreak(weak: true)

#text(fill: C-NAVY, weight: "bold", size: 11pt)[NHÓM B. HÌNH DẠNG, ĐỘ CONG, VÀ NHỮNG GÌ ĐỒ THỊ THẬT SỰ NÓI]

#v(0.5em)

#vd-box("34", "Vì sao âm thanh trong khán phòng phụ thuộc vào hình dạng tường và trần?")[
  Sóng âm phản xạ theo quy luật hình học. Nếu mặt cong được thiết kế khéo, âm thanh có thể được gom về vùng khán giả mong muốn hoặc được phân tán đều hơn để không tạo điểm vọng khó chịu.

  Nhìn sâu hơn, đây là bài toán về *mối liên hệ giữa hình dạng và hành vi*. Một hàm số cho biên dạng bức tường sẽ quyết định hướng phản xạ của các tia âm, tức là quyết định trải nghiệm nghe.

  Toán học ở đây không chỉ mô tả. Nó can thiệp vào thẩm mỹ, cảm giác, và kiến trúc sống. Đồ thị vì thế không phải tranh vẽ vô tội; nó có hậu quả vật lý thật.
]

#v(0.6em)

#vd-box("35", "Đường chạy điền kinh và bài toán nối trơn")[
  Một đường chạy không thể được ghép từ các đoạn thẳng và các cung tròn theo kiểu tùy tiện. Nếu chỗ nối quá gắt, vận động viên cảm nhận sự đổi hướng khó chịu và hiệu suất bị ảnh hưởng.

  Điều các nhà thiết kế cần không chỉ là tính liên tục của vị trí. Họ còn cần tính liên tục của hướng đi, thậm chí của độ cong trong những bài toán đòi hỏi sự mượt cao.

  Đây là nơi khái niệm hàm khả vi lộ ra ý nghĩa cơ thể. Một đồ thị có đạo hàm "đẹp" không chỉ đẹp trên giấy. Nó là thứ cơ bắp, bánh xe, và dòng chảy đều thích đi theo.
]

#v(0.6em)

#vd-box("36", "Sông uốn lượn vì ngẫu nhiên hay vì tối ưu?")[
  Những khúc quanh hình chữ S của dòng sông vừa mang yếu tố địa chất, vừa mang yếu tố động học của dòng chảy. Nước đi nhanh hơn ở bờ ngoài, bào mòn mạnh hơn, rồi chính sự bào mòn ấy lại thay đổi hình dạng khúc cong tiếp theo.

  Ta chưa cần mô hình chi tiết để thấy một điều: hình dạng của con sông là kết quả của một *phản hồi* giữa vị trí hiện tại và tốc độ thay đổi hiện tại. Đó là ngôn ngữ hàm và đạo hàm.

  Rất nhiều hình dạng trong tự nhiên không phải được "vẽ sẵn". Chúng tự sinh ra từ một quy luật biến thiên lặp đi lặp lại. Học hàm số là học đọc những quy luật sinh hình ấy.
]

#v(0.6em)

#vd-box("37", "Zipf và power law — khi log biến cái cong thành cái thẳng")[
  Trong nhiều dữ liệu thực, tần suất của một hiện tượng giảm theo hạng của nó theo kiểu lũy thừa. Từ số lần xuất hiện của từ ngữ, quy mô thành phố, cho tới mạng lưới liên kết, ta gặp những phân bố mà bề ngoài rất cong và khó đọc.

  Nhưng khi đưa về trục log, nhiều quan hệ lũy thừa lại hiện ra gần như một đường thẳng. Đây là một ví dụ mạnh về phép biến hình đồ thị: thay đổi hệ tọa độ đúng có thể làm lộ cấu trúc ẩn.

  Bài học ở đây rất lớn: đôi khi thế giới không khó hiểu vì nó quá phức tạp, mà vì ta đang nhìn nó trong một hệ quy chiếu không phù hợp.
]

#v(0.6em)

#vd-box("38", "GPS và bề mặt cong của Trái Đất — tại sao tiếp tuyến vẫn cứu được ta?")[
  Trái Đất cong, nhưng nhiều bài toán dẫn đường cục bộ lại được giải gần như trên mặt phẳng. Điều này không phải gian lận. Nó là hệ quả của nguyên lý tuyến tính hóa địa phương.

  Ở quy mô nhỏ, bề mặt cong có thể được thay bằng mặt phẳng tiếp xúc. Tương tự như cách một đồ thị trơn được thay bằng tiếp tuyến quanh một điểm, hình học vi phân cũng bắt đầu bằng ý tưởng: *cái cong, nhìn đủ gần, sẽ tạm thời cư xử như cái thẳng*.

  Đây là một trong những cây cầu đẹp nhất từ giải tích phổ thông tới toán học hiện đại. Tiếp tuyến của chương này là hạt giống của tiếp diện, không gian tiếp xúc, và nhiều cấu trúc sâu hơn về sau.
]

#pagebreak(weak: true)

#text(fill: C-NAVY, weight: "bold", size: 11pt)[NHÓM C. ĐỘNG HỌC, PHẢN HỒI, VÀ HỆ THỐNG SỐNG]

#v(0.5em)

#vd-box("39", "Cáo và thỏ — khi hai hàm số ràng nhau trong một điệu nhảy")[
  Trong mô hình săn mồi–con mồi sơ cấp, số lượng thỏ và số lượng cáo không đổi theo thời gian một cách độc lập. Mỗi đại lượng là tác nhân làm đổi tốc độ của đại lượng kia.

  Đây là lúc ta bước từ hàm một biến sang hệ hàm số, nhưng tinh thần vẫn cũ: phải mô tả *tốc độ thay đổi phụ thuộc vào cái gì*.

  Một ý tưởng rất mạnh xuất hiện ở đây: không phải mọi quy luật đều là công thức cho trực tiếp giá trị, nhiều quy luật lại cho trực tiếp *đạo hàm*. Từ đó, cả hành vi dài hạn của hệ được sinh ra. Đây là cánh cửa dẫn tới phương trình vi phân.
]

#v(0.6em)

#vd-box("40", "Đường cong logistic của công nghệ, học tập, và tăng trưởng")[
  Một kỹ năng mới thường được học rất chậm lúc đầu vì mọi thứ đều lạ. Sau đó tốc độ tiến bộ tăng nhanh vì người học đã có nền. Rồi cuối cùng, tiến bộ chậm lại vì tiệm cận với trần hiện tại.

  Đó chính là trực giác của đường cong logistic. Nó không chỉ là công thức trong sách, mà là hình dạng của vô số quá trình hữu cơ: học, lan truyền, thích nghi, tăng trưởng.

  Nếu em bắt đầu nhìn đời bằng các dạng đồ thị như vậy, em sẽ thấy thế giới không còn là hàng nghìn hiện tượng rời rạc. Nó là vài mẫu hình động học lặp lại.
]

#v(0.6em)

#vd-box("41", "Đòn bẩy tài chính và đạo hàm như thước đo độ nhạy")[
  Một doanh nghiệp vay nợ nhiều có thể khuếch đại lợi nhuận khi điều kiện thuận lợi, nhưng cũng khuếch đại tổn thương khi điều kiện xấu đi.

  Đó là một phiên bản kinh tế của khái niệm đạo hàm: *đầu ra nhạy đến đâu trước một thay đổi nhỏ của đầu vào?* Hệ càng nhạy, đạo hàm hiệu dụng càng lớn, và rủi ro của các sai lệch nhỏ càng đáng sợ.

  Tư duy này giúp học sinh thấy đạo hàm không chỉ đo độ dốc trên giấy. Nó đo độ dễ tổn thương, độ mong manh, và mức khuếch đại của một hệ trước nhiễu động.
]

#v(0.6em)

#vd-box("42", "Điểm uốn trong xã hội và sinh học — lúc hệ vẫn tăng nhưng đã đổi cơ chế")[
  Một dịch bệnh có thể vẫn đang tăng số ca mỗi ngày, nhưng tốc độ tăng đã bắt đầu chậm lại. Một doanh nghiệp có thể vẫn tăng doanh thu, nhưng độ cong của tăng trưởng đã chuyển từ ngửa lên sang úp xuống.

  Đây là lý do điểm uốn quan trọng hơn nhiều người tưởng. Nó cho biết không phải chuyện gì *đang xảy ra*, mà chuyện gì *sắp thôi xảy ra theo kiểu cũ*.

  Trong thực tiễn, ai nhìn ra điểm uốn sớm thường là người ra quyết định tốt hơn. Toán học ở đây là năng lực đọc tương lai gần từ độ cong hiện tại.
]

#pagebreak(weak: true)

#text(fill: C-NAVY, weight: "bold", size: 11pt)[NHÓM D. HÌNH HỌC CỔ ĐIỂN, NHƯNG ĐỌC BẰNG MẮT GIẢI TÍCH]

#v(0.5em)

#vd-box("43", "Vì sao hình vuông tối ưu giữa các hình chữ nhật cùng chu vi?")[
  Kết quả này ta đã gặp dưới dạng một bài cực trị một biến. Nhưng đáng giá hơn kết quả là mô típ triết học của nó: *khi tài nguyên tổng cố định, cấu hình đối xứng thường cho hiệu quả cao nhất*.

  Hình vuông là điểm mà hai chiều không còn bất công với nhau. Một chiều không "ăn hiếp" chiều kia. Sự cân bằng đối xứng ấy hiện ra như nghiệm của đạo hàm bằng $0$.

  Đây là một bài học đẹp: đạo hàm không phá hủy hình học cổ điển. Nó cho hình học một ngôn ngữ mới để diễn tả vì sao trực giác đối xứng lại hay đi cùng tối ưu.
]

#v(0.6em)

#vd-box("44", "Bất đẳng thức đẳng chu — chiếc bóng rất dài của một câu hỏi đơn giản")[
  Trong tất cả các hình phẳng có cùng chu vi, hình nào có diện tích lớn nhất? Câu trả lời là hình tròn.

  Đây là phiên bản vĩ đại hơn của câu chuyện hình vuông. Nó nói rằng trong vô vàn hình dạng có thể, đối xứng tròn là cấu hình tối ưu cuối cùng.

  Dù để chứng minh đầy đủ cần công cụ vượt xa chương này, trực giác cốt lõi vẫn rất gần: tối ưu hóa hình học là nơi các ý tưởng về đạo hàm, biến thiên nhỏ, và đối xứng sâu gặp nhau. Một chương về hàm số đang đặt những viên gạch đầu tiên cho cả vùng đất ấy.
]

#v(0.6em)

#vd-box("45", "Khi một công thức đơn giản trở thành tấm bản đồ của cả một lĩnh vực")[
  Điều kỳ lạ của toán học là một ý tưởng có thể xuất hiện ở mức rất sơ cấp rồi nở ra thành cả ngành nghiên cứu.

  Hàm số bắt đầu như một quy tắc gán. Đạo hàm bắt đầu như độ dốc tiếp tuyến. Nhưng từ đó mọc ra tối ưu, phương trình vi phân, mô hình hóa, cơ học, học máy, xác suất liên tục, hình học vi phân.

  Vì thế, mười lăm bài toán của phần này không nhằm làm em "biết thêm mẹo". Chúng nhằm chứng minh một điều quan trọng hơn: *một ý tưởng nền tảng có thể giải phóng rất nhiều vùng tư duy nếu em học nó ở mức bản chất.*
]

#tech-box[
  Cách dùng tốt nhất phần này không phải là cố ghi nhớ đủ cả mười lăm bối cảnh. Hãy thử luyện một thói quen khác:

  - mỗi bài thuộc mô típ nào,
  - đại lượng nào đang được mô hình như một hàm,
  - đạo hàm ở đây mang nghĩa tốc độ, độ nhạy, hay độ cong,
  - cực trị hay điểm uốn đang kể điều gì,
  - và phép biến hình nào có thể làm cấu trúc sáng hơn.

  Nếu làm được vậy, em đang xây một bản đồ tư duy, chứ không tích lũy vụn kiến thức.
]

#meta-box[
  Đây là một trong những chỗ phân biệt rõ người học để thi và người học để hiểu.

  Người học để thi hỏi: bài này dùng công thức nào? Người học để hiểu hỏi: bài này là hiện thân của cấu trúc nào? Một khi cấu trúc được nhìn ra, ví dụ thay đổi mà trí tuệ vẫn đứng vững.

  Toán học bậc cao thực chất không đòi em nhớ nhiều hơn quá mức. Nó đòi em *nén tốt hơn*. Và không gì đáng giá bằng việc nén cả một rừng ví dụ thành vài ý tưởng lớn.
]

#link-box[
  Nếu về sau em học sâu hơn, em sẽ gặp lại bóng dáng của phần này trong mọi nơi: nguyên lý tác dụng tối thiểu, bài toán biến phân, điều khiển tối ưu, mạng nơ-ron, hình học của dữ liệu, và các mô hình tăng trưởng.
  Khi ấy em sẽ nhận ra: hạt giống của rất nhiều ngành đã nằm sẵn trong chương hàm số sơ cấp, chỉ là lúc đầu ta chưa đủ mắt để thấy.
]

#open-q[
  Sau khi đi qua mười lăm ô cửa này, em còn thấy "hàm số" là một chủ đề nhỏ ở phổ thông nữa không, hay nó đã hiện ra như một ngôn ngữ chung mà nhiều ngành khác nhau đều đang nói?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §19. CÁNH CỬA TIẾP THEO — TỪ ĐẠO HÀM ĐẾN TÍCH PHÂN
// ════════════════════════════════════════════════════════════════

#sec("19", "Cánh Cửa Tiếp Theo — Từ Đạo Hàm Đến Tích Phân")

#why-box[
  Nếu đạo hàm trả lời câu hỏi "ngay bây giờ đang thay đổi ra sao?", thì một câu hỏi tự nhiên tiếp theo sẽ là:

  *nếu ta biết tốc độ thay đổi ở mọi nơi, ta có thể dựng lại toàn bộ sự tích lũy không?*

  Đây chính là động cơ sâu của tích phân. Đạo hàm nhìn bằng kính hiển vi vào từng khoảnh khắc. Tích phân gom vô số khoảnh khắc ấy lại để tạo thành một tổng thể.
  Một bên là ngôn ngữ của vi mô. Một bên là ngôn ngữ của tích lũy.
]

#eye-box[
  Hãy tưởng tượng em biết vận tốc của một chiếc xe ở mọi thời điểm, nhưng không biết nó đã đi được bao xa. Muốn biết quãng đường, em không thể chỉ nhìn một thời điểm.
  Em phải *cộng dồn* ảnh hưởng của vô số khoảnh khắc nhỏ.

  Đó chính là linh hồn của tích phân: chia nhỏ, đọc đóng góp của từng mẩu, rồi tích lũy lại.
]

#core-box[
  Có một cặp song sinh ý tưởng mà toàn bộ giải tích được xây trên đó:

  - Đạo hàm: từ *đại lượng tích lũy* suy ra *tốc độ tức thời*.
  - Tích phân: từ *tốc độ tức thời* dựng lại *đại lượng tích lũy*.

  Hai hướng đi ngược chiều nhau, nhưng gặp lại nhau trong một định lý nền tảng nhất của môn học: Định lý cơ bản của Giải tích.
]

#vd-box("46", "Từ vận tốc tới quãng đường — tích lũy là ý tưởng tự nhiên")[
  Nếu một vật chuyển động với vận tốc không đổi $v$, ta biết ngay quãng đường sau thời gian $t$ là $s = v t$. Nhưng nếu vận tốc thay đổi liên tục, công thức ấy không còn dùng trực tiếp được.

  Tuy nhiên, ta vẫn có thể nghĩ rất tự nhiên: chia thời gian thành nhiều khoảng rất nhỏ. Trên mỗi khoảng nhỏ, vận tốc gần như không đổi. Khi đó, quãng đường nhỏ trên mỗi đoạn gần bằng "vận tốc nhân thời gian nhỏ". Cộng tất cả lại, ta được quãng đường toàn phần.

  Đó là tích phân, trước cả khi ký hiệu tích phân xuất hiện.
]

#v(0.8em)

#vd-box("47", "Diện tích dưới đồ thị — tại sao lại là một bài toán cộng dồn?")[
  Khi muốn tính diện tích miền nằm dưới đồ thị $y = f(x)$ trên đoạn từ $a$ tới $b$, ta đang hỏi một câu gần như giống hệt câu hỏi quãng đường.

  Chia đoạn $[a, b]$ thành nhiều mẩu nhỏ. Trên mỗi mẩu, đồ thị gần như là một đoạn thẳng nằm ngang ở độ cao gần $f(x)$. Diện tích nhỏ lúc ấy gần bằng "chiều cao nhân đáy". Cộng vô số mẩu ấy lại, ta nhận được diện tích toàn phần.

  Tích phân vì thế không phải một ký hiệu bí ẩn. Nó là cách viết gọn cho một giới hạn của các phép cộng ngày càng tinh hơn.
]

#v(0.8em)

#vd-box("48", "Định lý cơ bản của Giải tích — chiếc khóa nối hai thế giới")[
  Giả sử ta định nghĩa một hàm tích lũy bằng cách lấy diện tích từ một mốc cố định tới vị trí hiện tại:
  $ F(x) = integral_a^x f(t) dif t $

  Một điều kỳ diệu xảy ra:
  $ F'(x) = f(x) $

  Nghĩa là đạo hàm của hàm tích lũy chính là tốc độ đang được tích lũy.

  Đây là một trong những khoảnh khắc đẹp nhất của toán học. Nó nói rằng phép "cộng dồn vô số thay đổi nhỏ" và phép "đọc tốc độ tức thời" là hai động tác ngược chiều nhưng ăn khớp hoàn hảo.

  Nếu đạo hàm là kính hiển vi, thì tích phân là nghệ thuật ghép vô số ảnh hiển vi thành một bức tranh lớn.
]

#meta-box[
  Một chương mở về hàm số mà không nhắc tới tích phân sẽ giống một bản nhạc dừng lại ngay trước chủ âm cuối. Đạo hàm nói về sự thay đổi; tích phân nói về sự tích lũy của thay đổi.

  Hai ý tưởng ấy cùng nhau tạo nên cách hiện đại để nhìn thế giới liên tục. Từ vật lý, kinh tế, sinh học, tới xác suất liên tục, hầu như nơi nào có quá trình trơn, nơi đó cặp song sinh này đều xuất hiện.
]

#link-box[
  Chương tiếp theo của hành trình không chỉ là học công thức nguyên hàm. Nó là học cách nhìn diện tích như tích lũy, nhìn thể tích như tích lũy, nhìn khối lượng, điện tích, xác suất, và rất nhiều đại lượng khác như kết quả của việc cộng dồn vô số đóng góp vi mô.
]

#open-q[
  Nếu đạo hàm là câu hỏi "mỗi khoảnh khắc đang nói gì", thì tích phân là câu hỏi "toàn bộ lịch sử đã cộng lại thành gì". Hai câu hỏi ấy có thể tách rời được không?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §20. SỔ TAY TỰ VẤN — HAI MƯƠI LĂM CÂU HỎI CỐT LÕI
// ════════════════════════════════════════════════════════════════

#sec("20", "Sổ Tay Tự Vấn — Hai Mươi Lăm Câu Hỏi Cốt Lõi Khi Đọc Một Hàm Số")

#why-box[
  Học sâu không đến từ việc nghe thêm nhiều lời giải mẫu. Nó đến từ việc tự đặt được đúng câu hỏi trước một đối tượng.

  Phần này là một sổ tay đọc hiểu. Khi đứng trước bất kỳ hàm số nào, nếu em đủ kiên nhẫn tự hỏi những câu dưới đây,
  em sẽ dần chuyển từ trạng thái "bị công thức dẫn dắt" sang trạng thái "chủ động chất vấn cấu trúc".
]

#block(
  fill: rgb("#F8FAFC"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + rgb("#CBD5E1"),
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-NAVY)[TẦNG 1. CÂU HỎI VỀ CĂN CƯỚC]
  #v(0.5em)

  *1. Hàm này đang nhận cái gì làm đầu vào?* Nếu không đặt tên rõ biến, ta thường hiểu mơ hồ ý nghĩa của toàn bộ bài toán.

  *2. Đầu ra đang đo cái gì?* Một con số không có tên gọi vật lý hoặc ý nghĩa hình học thì rất khó được hiểu đúng.

  *3. Miền xác định là gì và vì sao?* Nơi hàm không tồn tại thường nói nhiều về bản chất của mô hình hơn cả nơi nó tồn tại.

  *4. Có đơn vị đo nào ẩn sau các đại lượng không?* Rất nhiều sai lầm tư duy đến từ việc trộn đại lượng không đồng chất.

  *5. Hàm này xuất hiện như quy luật thuần túy hay như mô hình gần đúng?* Biết điều này giúp em điều chỉnh mức độ tin cậy khi suy luận.
]

#v(0.8em)

#block(
  fill: rgb("#F6FBF4"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-GREEN,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-GREEN)[TẦNG 2. CÂU HỎI VỀ CHUYỂN ĐỘNG]
  #v(0.5em)

  *6. Khi đầu vào tăng, đầu ra có xu hướng tăng hay giảm?* Đây là xương sống đầu tiên của mọi cuộc khảo sát.

  *7. Sự tăng giảm ấy có đều không, hay lúc mạnh lúc yếu?* Câu hỏi này dẫn thẳng tới đạo hàm bậc nhất.

  *8. Có điểm nào mà xu hướng đổi chiều không?* Đây là câu hỏi về cực trị và về những bước ngoặt của hệ.

  *9. Nếu thay đổi đầu vào một lượng rất nhỏ, đầu ra phản ứng mạnh hay yếu?* Đây là ngôn ngữ của độ nhạy.

  *10. Có thể thay hàm bằng mô hình tuyến tính cục bộ ở đâu?* Câu hỏi này xác định nơi tiếp tuyến thực sự hữu ích.
]

#v(0.8em)

#block(
  fill: rgb("#FFF6EA"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-AMBER,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-AMBER)[TẦNG 3. CÂU HỎI VỀ HÌNH DẠNG]
  #v(0.5em)

  *11. Đồ thị cong ngửa lên hay úp xuống ở đâu?* Đây là câu hỏi của đạo hàm bậc hai.

  *12. Có điểm uốn nào không?* Nơi độ cong đổi dấu thường là nơi cơ chế nội tại của hệ đổi khác.

  *13. Có đối xứng nào giúp giảm công sức tư duy không?* Đối xứng luôn là một hình thức nén thông tin.

  *14. Đồ thị này có thể xem như biến hình của một đồ thị mẹ quen thuộc không?* Đây là câu hỏi giúp em thoát khỏi việc nhìn mọi công thức như mới hoàn toàn.

  *15. Nếu nhìn đủ xa, đồ thị có xu hướng tiến gần một hình đơn giản hơn không?* Đó là ngôn ngữ của tiệm cận và hành vi giới hạn.
]

#v(0.8em)

#block(
  fill: rgb("#F5F0FB"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-PURPLE,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-PURPLE)[TẦNG 4. CÂU HỎI VỀ NGHIỆM VÀ TỐI ƯU]
  #v(0.5em)

  *16. Phương trình $f(x) = 0$ đang thật sự hỏi điều gì về đồ thị?* Nhìn giao điểm trước khi nhìn biến đổi đại số giúp bức tranh sáng hơn.

  *17. Phương trình $f(x) = k$ có bao nhiêu nghiệm tùy theo $k$?* Đây là câu hỏi hạt nhân của bài toán tham số.

  *18. Đại lượng nào đang được tối ưu hóa?* Nếu không xác định đúng mục tiêu, mọi đạo hàm về sau đều trở nên vô nghĩa.

  *19. Điều kiện ràng buộc đang khóa những biến nào với nhau?* Đây là nơi sáng tạo của bài toán cực trị thường bắt đầu.

  *20. Điểm ứng viên tối ưu có hợp lý trong ngữ cảnh không?* Toán học tốt luôn quay lại kiểm tra thực nghĩa của nghiệm.
]

#v(0.8em)

#block(
  fill: rgb("#EBF3F9"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-INDIGO,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-INDIGO)[TẦNG 5. CÂU HỎI VỀ Ý NGHĨA VÀ PHẠM VI]
  #v(0.5em)

  *21. Kết quả giải tích này nói được điều gì ngoài đời?* Nếu không dịch ngược ra ý nghĩa, lời giải vẫn còn dang dở.

  *22. Mô hình này đúng trong khoảng nào và bắt đầu hỏng ở đâu?* Mọi mô hình mạnh đều có biên giới của nó.

  *23. Có cách nhìn khác nào cho cùng hiện tượng: hình học, động học, kinh tế, vật lý?* Nhiều cách nhìn giúp cấu trúc trở nên vững hơn.

  *24. Cái gì là bất biến khi ta biến hình hay thay đổi tham số?* Bất biến là nơi toán học thường cất giấu xương sống của vấn đề.

  *25. Nếu quên công thức, em còn kể được câu chuyện của hàm số bằng lời không?* Đây là bài kiểm tra cuối cùng của hiểu sâu.
]

#meta-box[
  Hai mươi lăm câu hỏi này không nên được học như một danh sách mới phải thuộc lòng. Chúng là một bộ khung để em đối thoại với mọi hàm số về sau.

  Mục tiêu của giáo dục toán không phải lấp đầy đầu óc bằng câu trả lời, mà là trồng vào đó những câu hỏi đủ mạnh để bất kỳ đối tượng mới nào cũng bị soi sáng.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §21. HAI MƯƠI NGỘ NHẬN PHỔ BIẾN VỀ HÀM SỐ VÀ ĐẠO HÀM
// ════════════════════════════════════════════════════════════════

#sec("21", "Hai Mươi Ngộ Nhận Phổ Biến Về Hàm Số Và Đạo Hàm")

#why-box[
  Nhiều khó khăn của học sinh không đến từ việc ý tưởng quá khó, mà đến từ việc trong đầu đã có sẵn một vài hình dung sai nhưng quen thuộc.

  Phần này cố tình viết thẳng vào các ngộ nhận ấy. Mỗi ngộ nhận được sửa không chỉ để tránh mất điểm, mà để giải phóng cách nhìn.
]

#block(
  fill: rgb("#FFF8F8"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-RED,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-RED)[NHÓM 1. NHẦM LẪN VỀ BẢN CHẤT CỦA HÀM SỐ]
  #v(0.5em)

  *Ngộ nhận 1:* Hàm số là một công thức.

  *Chỉnh lại:* Công thức chỉ là một cách viết. Hàm số là quy luật phụ thuộc giữa đầu vào và đầu ra.

  *Ngộ nhận 2:* Chỉ những biểu thức "đẹp" mới là hàm số.

  *Chỉnh lại:* Bảng số liệu, đồ thị, thuật toán, hay mô hình thực nghiệm đều có thể biểu diễn hàm số.

  *Ngộ nhận 3:* Miền xác định là tiểu tiết phụ.

  *Chỉnh lại:* Miền xác định là phần của định nghĩa. Bỏ nó đi là đổi hẳn đối tượng đang nói tới.

  *Ngộ nhận 4:* Hai hàm bằng nhau nếu trông công thức giống nhau.

  *Chỉnh lại:* Hai hàm bằng nhau khi cùng miền xác định và cùng giá trị trên mọi điểm của miền ấy.

  *Ngộ nhận 5:* Đồ thị chỉ là hình minh họa sau khi tính xong.

  *Chỉnh lại:* Đồ thị là một ngôn ngữ suy luận độc lập, nhiều khi cho thấy cấu trúc mà đại số che khuất.
]

#v(0.8em)

#block(
  fill: rgb("#F6FBF4"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-GREEN,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-GREEN)[NHÓM 2. NHẦM LẪN VỀ ĐẠO HÀM BẬC NHẤT]
  #v(0.5em)

  *Ngộ nhận 6:* Đạo hàm chỉ dùng để tìm cực trị.

  *Chỉnh lại:* Đạo hàm là ngôn ngữ của tốc độ, độ nhạy, tiếp tuyến, xấp xỉ, tối ưu, và động lực học.

  *Ngộ nhận 7:* $f'(x_0) = 0$ thì chắc chắn có cực trị.

  *Chỉnh lại:* Điểm ấy có thể chỉ là điểm phẳng. Cần nhìn thêm dấu của đạo hàm hoặc độ cong.

  *Ngộ nhận 8:* Tiếp tuyến chỉ là đường thẳng chạm vào đồ thị.

  *Chỉnh lại:* Điều quan trọng là nó chia sẻ hành vi bậc nhất với đồ thị tại điểm đó.

  *Ngộ nhận 9:* Hàm tăng thì đạo hàm phải dương ở mọi điểm.

  *Chỉnh lại:* Đạo hàm có thể bằng $0$ ở một vài điểm riêng lẻ mà hàm vẫn tăng trên cả khoảng.

  *Ngộ nhận 10:* Newton là một thủ thuật tính gần đúng vô cớ.

  *Chỉnh lại:* Newton là hệ quả trực tiếp của việc thay đường cong bằng tiếp tuyến tốt nhất tại chỗ.
]

#v(0.8em)

#block(
  fill: rgb("#FFF6EA"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-AMBER,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-AMBER)[NHÓM 3. NHẦM LẪN VỀ ĐẠO HÀM BẬC HAI VÀ ĐỘ CONG]
  #v(0.5em)

  *Ngộ nhận 11:* $f'' gt 0$ nghĩa là hàm đang tăng.

  *Chỉnh lại:* $f'' gt 0$ chỉ nói rằng độ dốc đang tăng. Bản thân hàm vẫn có thể đang giảm.

  *Ngộ nhận 12:* Điểm uốn là nơi hàm đổi từ tăng sang giảm.

  *Chỉnh lại:* Điểm uốn là nơi độ cong đổi kiểu; hàm có thể vẫn tiếp tục tăng hoặc tiếp tục giảm.

  *Ngộ nhận 13:* Phép thử đạo hàm bậc hai là một mẹo cần nhớ máy móc.

  *Chỉnh lại:* Nó phản ánh việc gần điểm dừng, đồ thị được xấp xỉ bởi một parabol nhỏ.

  *Ngộ nhận 14:* Độ cong chỉ quan trọng trong hình học.

  *Chỉnh lại:* Độ cong là thông tin cốt lõi trong vật lý, kinh tế, thống kê, tối ưu, và học máy.

  *Ngộ nhận 15:* Chỉ giá trị hiện tại mới quan trọng.

  *Chỉnh lại:* Nhiều quyết định hay phụ thuộc vào việc xu hướng hiện tại đang được tăng tốc hay chậm lại.
]

#v(0.8em)

#block(
  fill: rgb("#F5F0FB"),
  inset: 16pt,
  radius: 8pt,
  stroke: 0.8pt + C-PURPLE,
  width: 100%,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold", fill: C-PURPLE)[NHÓM 4. NHẦM LẪN VỀ TIỆM CẬN, NGHIỆM, VÀ TỐI ƯU]
  #v(0.5em)

  *Ngộ nhận 16:* Tiệm cận là đường mà đồ thị không bao giờ cắt.

  *Chỉnh lại:* Định nghĩa đúng là hành vi tiến gần. Có những tiệm cận mà đồ thị vẫn có thể cắt ở nơi khác.

  *Ngộ nhận 17:* Giải phương trình tức là phải tìm công thức nghiệm.

  *Chỉnh lại:* Nhiều khi chỉ cần biết tồn tại, số lượng, vị trí tương đối, hay sự phụ thuộc theo tham số.

  *Ngộ nhận 18:* Cực trị luôn nằm ở nơi đạo hàm bằng $0$.

  *Chỉnh lại:* Trên miền đóng, biên cũng có thể là nơi tối ưu xuất hiện.

  *Ngộ nhận 19:* Có tham số nghĩa là bài toán hoàn toàn mới.

  *Chỉnh lại:* Tham số thường chỉ đang trượt một mức, tịnh tiến một đồ thị, hoặc đổi một hệ số nhạy.

  *Ngộ nhận 20:* Mô hình càng chi tiết càng tốt.

  *Chỉnh lại:* Mô hình tốt là mô hình giữ được đúng cấu trúc cần thiết cho câu hỏi đang xét.
]

#meta-box[
  Phá ngộ nhận là một phần thiết yếu của học sâu. Không gian trong đầu là hữu hạn. Nếu nó đã đầy những hình dung sai nhưng rất quen, ý tưởng đúng sẽ không có chỗ bén rễ.

  Vì thế, tiến bộ trong toán đôi khi không phải học thêm điều mới, mà là học cách *gỡ bỏ điều cũ đang cản trở việc thấy rõ*.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §22. HAI MƯƠI MỆNH ĐỀ THỐNG NHẤT CỦA CHƯƠNG
// ════════════════════════════════════════════════════════════════

#sec("22", "Hai Mươi Mệnh Đề Thống Nhất Của Chương")

#why-box[
  Khi một chương đủ dài, người học rất dễ bị ngập trong chi tiết. Cách thoát khỏi tình trạng đó không phải là cắt bớt nội dung một cách cơ học,
  mà là *nén* nội dung vào những mệnh đề đủ mạnh.

  Hai mươi mệnh đề sau không thay thế chương này. Chúng là các trục xương sống để em có thể treo toàn bộ chi tiết đã học vào những chiếc móc đủ chắc.
]

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 1. Hàm số là ngôn ngữ của sự phụ thuộc.*

  Khi một đại lượng đổi theo một đại lượng khác, tư duy hàm số đã bắt đầu, cho dù chưa có công thức.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 2. Đồ thị là câu chuyện nén của một quy luật.*

  Mỗi nét cong là một tiểu sử cô đặc: nơi sinh ra, nơi đi lên, nơi rơi xuống, nơi bẻ cong, nơi hướng về chân trời.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 3. Đạo hàm là nhân chứng cục bộ của hành vi toàn cục.*

  Nó không cho toàn bộ bức tranh ngay lập tức, nhưng nó cho ta tín hiệu vi mô đủ mạnh để suy ra bức tranh vĩ mô.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 4. Tiếp tuyến là mô hình trung thực nhất của hàm số ở khoảng rất nhỏ.*

  Mọi xấp xỉ tuyến tính, Newton, và nhiều thuật toán số đều sống nhờ mệnh đề này.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 5. Cực trị là dấu vết của một cuộc thương lượng cân bằng.*

  Phía này muốn tăng, phía kia muốn giảm; nơi tối ưu xuất hiện khi các lực ấy tạm thời triệt tiêu nhau.
]

#v(0.8em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 6. Độ cong cho ta biết tương lai gần của xu hướng hiện tại.*

  Giá trị cho biết hiện tại. Đạo hàm cho biết hướng đi. Đạo hàm bậc hai cho biết hướng đi ấy đang được tăng tốc hay hãm lại.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 7. Điểm uốn thường quý hơn cực trị.*

  Cực trị cho biết điều đã lộ ra. Điểm uốn cho biết cơ chế đã âm thầm đổi hướng.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 8. Đối xứng là một dạng nén tri thức.*

  Thấy đối xứng là hiểu một nửa mà sở hữu được toàn thể.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 9. Biến hình đồ thị là ngữ pháp của họ hàm số.*

  Một hàm mới thường không hoàn toàn mới; nó là một nguyên mẫu cũ được dịch, co, giãn, lật, hoặc tái tham số hóa.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 10. Tham số thường là chuyển động ẩn.*

  Một chữ $m$ không chỉ là ký hiệu thêm vào. Nó thường đang kéo một đường lên xuống, dịch một đồ thị, hoặc đổi cường độ của một hiệu ứng.
]

#pagebreak(weak: true)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 11. Tiệm cận là danh tính ở xa của một đối tượng.*

  Ở rất gần, hàm có thể phức tạp. Ở rất xa, nó có thể lộ ra một gương mặt đơn giản hơn nhiều.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 12. Giải phương trình là đếm giao điểm trong một hệ quy chiếu thích hợp.*

  Người nhìn tốt bằng hình học nhiều khi đi nhanh hơn người chỉ tin vào biến đổi ký hiệu.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 13. Một nghiệm chính xác không luôn đáng giá hơn một cấu trúc nghiệm rõ ràng.*

  Biết có bao nhiêu nghiệm, ở đâu, và đổi ra sao theo tham số thường là thông tin mạnh hơn một biểu thức đóng.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 14. Mô hình tốt không phải mô hình đầy đủ nhất, mà là mô hình giữ đúng cấu trúc cần thiết.*

  Bản đồ không phải ảnh chụp. Chính vì bỏ bớt mà nó trở nên hữu ích.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 15. Đơn vị và ý nghĩa vật lý là hàng rào chống sai lầm rất mạnh.*

  Một lời giải trông đẹp nhưng vô nghĩa về đơn vị thường là một lời giải chưa hiểu vấn đề.
]

#v(0.8em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 16. Tích phân là đạo hàm nhìn ngược chiều.*

  Đạo hàm hỏi tốc độ của cái đang tích lũy; tích phân hỏi cái được tạo ra khi vô số tốc độ nhỏ được cộng dồn.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 17. Một câu hỏi đúng thường mạnh hơn một kỹ thuật nhanh.*

  Kỹ thuật tốt giải được một dạng. Câu hỏi tốt soi sáng cả một họ vấn đề.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 18. Phản ví dụ là thuốc giải cho ảo tưởng hiểu.*

  Mỗi khi em tin một mệnh đề quá nhanh, hãy thử tìm một đồ thị phá nó. Sự chính xác trong toán học được rèn bằng những cú va chạm như vậy.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 19. Cùng một ý tưởng lớn thường tái sinh trong nhiều bộ môn.*

  Tốc độ thay đổi trong vật lý, chi phí cận biên trong kinh tế, gradient trong học máy, độ nhạy trong kỹ thuật: đó là cùng một linh hồn.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Mệnh đề 20. Toán học là nghệ thuật nhìn ra cấu trúc ổn định dưới vô số bối cảnh thay đổi.*

  Nếu sau cả chương, em mang theo được mệnh đề này, thì chương đã hoàn thành nhiệm vụ sâu nhất của nó.
]

#meta-box[
  Hai mươi mệnh đề này có thể xem như bản nhạc nền của cả chương. Mọi ví dụ, định nghĩa, kỹ thuật, và mô hình đều là những biến tấu trên bản nhạc ấy.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §23. MƯỜI ĐỐI THOẠI TỰ HỌC VỚI MỘT ĐỒ THỊ
// ════════════════════════════════════════════════════════════════

#sec("23", "Mười Đối Thoại Tự Học Với Một Đồ Thị")

#why-box[
  Nhiều học sinh không thiếu công thức; các em thiếu một kiểu đối thoại đúng với ý tưởng. Phần này viết như những cuộc nói chuyện ngắn,
  để mô phỏng cách một trực giác chín dần chứ không rơi xuống ngay tức khắc.
]

#vd-box("49", "Đối thoại 1 — Hàm số có nhất thiết phải là công thức không?")[
  *Học sinh:* Nếu không có công thức thì làm sao gọi là hàm số được?

  *Người hướng dẫn:* Em có cần công thức để biết nhiệt độ trong ngày phụ thuộc vào thời gian không?

  *Học sinh:* Không, chỉ cần biết mỗi thời điểm có một nhiệt độ.

  *Người hướng dẫn:* Đúng. Công thức chỉ là một cách viết gọn. Hàm số có trước công thức. Nó sinh ra từ mối phụ thuộc.

  *Học sinh:* Vậy bản chất là sự gán có quy luật, chứ không phải vẻ đẹp đại số.

  *Người hướng dẫn:* Chính xác. Và đó là lý do hàm số sống được trong khoa học thực nghiệm chứ không chỉ trong sách giáo khoa.
]

#v(0.8em)

#vd-box("50", "Đối thoại 2 — Vì sao đạo hàm lại là ý tưởng lớn đến thế?")[
  *Học sinh:* Em thấy đạo hàm chỉ là một phép tính hơi rắc rối để tìm cực trị.

  *Người hướng dẫn:* Nếu vậy thì tại sao vận tốc là đạo hàm của quãng đường, gia tốc là đạo hàm của vận tốc, và độ nhạy của chi phí lại cũng được đo bằng đạo hàm?

  *Học sinh:* Có lẽ vì chúng đều liên quan đến sự thay đổi.

  *Người hướng dẫn:* Không chỉ thay đổi, mà là *thay đổi ngay lúc này*. Đó là thứ không bảng giá trị nào nói trực tiếp cho em.

  *Học sinh:* Vậy đạo hàm là ngôn ngữ của khoảnh khắc.
]

#v(0.8em)

#vd-box("51", "Đối thoại 3 — Tại sao $f'(x_0) = 0$ chưa đủ?")[
  *Học sinh:* Em cứ thấy đạo hàm bằng $0$ thì kết luận cực trị cho nhanh.

  *Người hướng dẫn:* Hãy nghĩ tới điểm uốn nằm ngang. Ở đó tiếp tuyến cũng nằm ngang, nhưng đồ thị có thể vẫn đi lên rồi lại tiếp tục đi lên.

  *Học sinh:* Vậy đạo hàm bằng $0$ chỉ nói vận tốc bằng $0$ tại khoảnh khắc ấy, chứ chưa nói hệ sẽ quay đầu.

  *Người hướng dẫn:* Đúng. Muốn biết có quay đầu không, em phải nhìn xung quanh điểm ấy hoặc nhìn độ cong.
]

#v(0.8em)

#vd-box("52", "Đối thoại 4 — Vì sao $f(x - a)$ lại dịch sang phải?")[
  *Học sinh:* Chỗ này em luôn nhớ nhầm. Trong có dấu trừ mà lại sang phải.

  *Người hướng dẫn:* Thử hỏi thế này: để máy nhận đúng đầu vào cũ $x_0$, em phải đứng ở đâu trên trục mới?

  *Học sinh:* Em cần $x - a = x_0$, tức là $x = x_0 + a$.

  *Người hướng dẫn:* Nghĩa là giá trị cũ xuất hiện ở vị trí mới nằm bên phải.

  *Học sinh:* À, vậy không cần học vẹt nữa. Chỉ cần hiểu đây là câu chuyện của đầu vào.
]

#v(0.8em)

#vd-box("53", "Đối thoại 5 — Tiếp tuyến là đường chạm hay là lời tiên đoán?")[
  *Học sinh:* Trong đầu em, tiếp tuyến chỉ là đường chạm vào đồ thị tại một điểm.

  *Người hướng dẫn:* Nếu chỉ cần chạm thì có thể có nhiều đường như vậy ở những đồ thị kỳ dị. Điều làm tiếp tuyến thật sự đặc biệt là nó dự đoán tốt nhất chuyện gì xảy ra ngay lân cận.

  *Học sinh:* Nên nó vừa là hình học vừa là mô hình gần đúng.

  *Người hướng dẫn:* Đúng. Và đó là lý do Newton, tuyến tính hóa, và nhiều phép tính gần đúng đều bám vào nó.
]

#v(0.8em)

#vd-box("54", "Đối thoại 6 — Điểm uốn có quan trọng hơn cực trị không?")[
  *Học sinh:* Em thấy cực đại, cực tiểu mới nổi bật. Điểm uốn có vẻ phụ.

  *Người hướng dẫn:* Nếu em quản lý một hệ thống đang tăng trưởng, em muốn biết lúc nó đạt đỉnh hay muốn biết sớm khi đà tăng đã bắt đầu yếu đi?

  *Học sinh:* Chắc chắn là muốn biết sớm.

  *Người hướng dẫn:* Đó chính là sức mạnh của điểm uốn. Nó cho em tín hiệu trước khi sự thay đổi lớn lộ hẳn ra bề mặt.
]

#v(0.8em)

#vd-box("55", "Đối thoại 7 — Tiệm cận có phải đường cấm?")[
  *Học sinh:* Em hay nghĩ đồ thị không bao giờ được chạm hay cắt tiệm cận.

  *Người hướng dẫn:* Em đang nhầm định nghĩa với một hình ảnh quen. Với tiệm cận ngang chẳng hạn, điều đúng là ở rất xa đồ thị tiến gần đường ấy, chứ không có nghĩa ở nơi khác nó không thể cắt.

  *Học sinh:* Vậy tiệm cận là phát biểu về hành vi khi đi ra xa, không phải lệnh cấm tuyệt đối trên toàn mặt phẳng.

  *Người hướng dẫn:* Chính xác.
]

#v(0.8em)

#vd-box("56", "Đối thoại 8 — Vì sao tối ưu không phải chỉ là đặt đạo hàm bằng $0$?")[
  *Học sinh:* Em cứ thấy bài cực trị là tìm đạo hàm, giải $f' = 0$, thế là xong.

  *Người hướng dẫn:* Nếu em không biết đang tối ưu cái gì, biến nào còn tự do, và ràng buộc nào đang khóa hệ lại, em sẽ đạo hàm một biểu thức chẳng nói gì về vấn đề thật.

  *Học sinh:* Vậy công việc khó nhất nhiều khi là dựng đúng hàm mục tiêu.

  *Người hướng dẫn:* Đúng. Đạo hàm là phần gọn. Cấu trúc hóa bài toán mới là phần trí tuệ nhất.
]

#v(0.8em)

#vd-box("57", "Đối thoại 9 — Giải được công thức nghiệm có phải là hiểu xong không?")[
  *Học sinh:* Nếu em giải ra nghiệm chính xác, như vậy là hiểu bài rồi chứ?

  *Người hướng dẫn:* Chưa chắc. Em có biết vì sao nghiệm tồn tại, có bao nhiêu nghiệm, và nếu thay tham số thì cấu trúc nghiệm đổi thế nào không?

  *Học sinh:* Không hẳn.

  *Người hướng dẫn:* Vậy em mới có đáp án, chưa có cấu trúc. Toán học trưởng thành ưu tiên cấu trúc.
]

#v(0.8em)

#vd-box("58", "Đối thoại 10 — Học hàm số để làm gì nếu không đi thi?")[
  *Học sinh:* Nếu bỏ chuyện thi cử sang một bên, em học tất cả những thứ này để làm gì?

  *Người hướng dẫn:* Để có một ngôn ngữ đọc thế giới khi thế giới đang thay đổi.

  *Học sinh:* Nghĩa là nhìn tốc độ, độ nhạy, điểm bẻ lái, tối ưu, và xu hướng dài hạn của một hệ?

  *Người hướng dẫn:* Đúng. Và đó là một khả năng trí tuệ có ích rất lâu sau khi em quên hầu hết kỹ thuật chi tiết.
]

#meta-box[
  Nếu đọc kỹ, mười đối thoại này không đưa thêm quá nhiều công thức mới. Chúng làm một việc khác: sắp xếp lại nội tâm của người học để các công thức đã có bắt đầu đứng đúng chỗ.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §24. ATLAS CÁC NGUYÊN MẪU ĐỒ THỊ
// ════════════════════════════════════════════════════════════════

#sec("24", "Atlas Các Nguyên Mẫu Đồ Thị — Những Gương Mặt Cần Nhận Ra")

#why-box[
  Một cách học rất mạnh trong toán học là không xem mỗi bài mới như một vật hoàn toàn xa lạ. Thay vào đó, ta xây một "atlas" những gương mặt cơ bản, rồi học cách nhận ra phiên bản biến hình của chúng trong các ngữ cảnh mới.

  Phần này không nhằm liệt kê công thức. Nó nhằm tạo ra *bộ nhớ hình thái học* cho trực giác.
]

#vd-box("59", "Hàm hằng — khuôn mặt của sự bất biến")[
  Đây là nguyên mẫu đơn giản nhất: đầu vào thay đổi nhưng đầu ra giữ nguyên.

  *Điều cần nhớ:* đạo hàm bằng $0$ ở khắp nơi không phải luôn gắn với cực trị; nó cũng có thể nói về một sự phẳng tuyệt đối.

  *Nơi xuất hiện:* ngưỡng ổn định, trạng thái cân bằng lý tưởng, các đoạn bão hòa hoàn toàn trong mô hình gần đúng.
]

#v(0.6em)

#vd-box("60", "Hàm bậc nhất — khuôn mặt của tốc độ không đổi")[
  Đường thẳng là đồ thị của một quy luật có độ nhạy không đổi. Mỗi bước tăng của đầu vào tạo ra cùng một mức tăng hoặc giảm ở đầu ra.

  *Điều cần nhớ:* nếu mọi thứ trông gần như tuyến tính trong một miền nhỏ, đó là dấu hiệu rằng tiếp tuyến đang làm việc tốt.

  *Nơi xuất hiện:* chuyển động đều, tỷ lệ giá cố định, xấp xỉ cục bộ của hầu hết các hàm trơn.
]

#v(0.6em)

#vd-box("61", "Parabol — khuôn mặt của gia tốc không đổi")[
  Parabol xuất hiện khi đạo hàm bậc hai giữ nguyên dấu và độ lớn đơn giản. Nó là hình dạng của rất nhiều quá trình có "lực kéo đều" như vật ném trong mô hình sơ cấp.

  *Điều cần nhớ:* đỉnh parabol là nơi câu chuyện đổi chiều, còn độ cong cho biết nó mở lên hay úp xuống.

  *Nơi xuất hiện:* quỹ đạo sơ cấp, tối ưu bậc hai, xấp xỉ gần cực trị.
]

#v(0.6em)

#vd-box("62", "Hàm bậc ba — khuôn mặt của hai chế độ cong trong cùng một thân thể")[
  Cubic là nguyên mẫu đầu tiên cho thấy cực trị và điểm uốn có thể cùng tồn tại trong một đồ thị đơn giản.

  *Điều cần nhớ:* nó dạy rằng một hệ có thể có nhiều chương trong tiểu sử của mình: tăng, giảm, rồi tăng lại; cong úp rồi cong ngửa.

  *Nơi xuất hiện:* mô hình chuyển pha nhẹ, bài toán tham số ba nghiệm, hình dạng S sơ khai.
]

#v(0.6em)

#vd-box("63", "Giá trị tuyệt đối — khuôn mặt của một vết gấp")[
  Hàm trị tuyệt đối đẹp ở chỗ nó liên tục nhưng không trơn tại đỉnh. Nó là lời nhắc rằng "vẽ được" không đồng nghĩa với "có tiếp tuyến".

  *Điều cần nhớ:* đây là mẫu chuẩn để học sự khác nhau giữa liên tục và khả vi.

  *Nơi xuất hiện:* khoảng cách, sai số tuyệt đối, chi phí đối xứng quanh một mức chuẩn.
]

#v(0.6em)

#vd-box("64", "Hàm nghịch đảo — khuôn mặt của một bờ vực")[
  Đồ thị kiểu $frac(1, x)$ là nguyên mẫu của tiệm cận đứng và ngang cùng xuất hiện. Nó giúp học sinh lần đầu cảm được một đồ thị có hai nhánh như hai thế giới tách biệt.

  *Điều cần nhớ:* gần $0$ thì hành vi bùng nổ, ở xa thì đồ thị lặng dần về $0$.

  *Nơi xuất hiện:* cường độ theo khoảng cách, tỷ lệ nghịch, nhiều định luật suy giảm sơ cấp.
]

#pagebreak(weak: true)

#vd-box("65", "Căn bậc hai — khuôn mặt của sự mở dần ra từ một ngưỡng")[
  Hàm căn bậc hai không tồn tại với đầu vào âm trong mô hình thực. Nó xuất hiện như một quá trình chỉ có nghĩa sau khi vượt qua một ngưỡng khởi động.

  *Điều cần nhớ:* miền xác định ở đây không phải kỹ thuật phụ, mà là bản chất của hiện tượng.

  *Nơi xuất hiện:* độ dài, chuẩn Euclid, nhiều bài toán hình học và vật lý.
]

#v(0.6em)

#vd-box("66", "Hàm mũ — khuôn mặt của tăng trưởng tự khuếch đại")[
  Khi tốc độ tăng tỉ lệ với chính lượng đang có, hàm mũ xuất hiện. Nó là gương mặt của lãi kép, tăng trưởng quần thể sơ cấp, và phân rã phóng xạ nếu đổi dấu.

  *Điều cần nhớ:* điểm kỳ diệu không nằm ở việc nó tăng nhanh, mà ở việc đạo hàm của nó lặp lại hình dạng của chính nó.

  *Nơi xuất hiện:* sinh học, tài chính, truyền nhiệt, xử lý tín hiệu.
]

#v(0.6em)

#vd-box("67", "Logarithm — khuôn mặt của sự chậm dần có cấu trúc")[
  Logarithm tăng mãi nhưng ngày càng chậm. Nó là đối cực mềm của hàm mũ.

  *Điều cần nhớ:* nhiều quá trình con người cảm nhận theo thang log hơn là thang tuyến tính, như cường độ âm thanh hay độ sáng.

  *Nơi xuất hiện:* thông tin, độ đo pH, thang Richter, phân tích độ lớn bậc tăng trưởng.
]

#v(0.6em)

#vd-box("68", "Sinusoid — khuôn mặt của tính chu kỳ")[
  Khi một hiện tượng lặp lại với nhịp đều, họ hàm sin–cos là nguyên mẫu tự nhiên. Đồ thị của nó dạy ta rằng thay đổi không phải lúc nào cũng hướng tới một đích; có những hệ sống bằng nhịp lặp.

  *Điều cần nhớ:* đạo hàm của hàm tuần hoàn vẫn còn là hàm tuần hoàn, nhưng lệch pha. Điều này rất giàu ý nghĩa vật lý.

  *Nơi xuất hiện:* sóng, dao động, mùa vụ, tín hiệu điện.
]

#v(0.6em)

#vd-box("69", "Logistic — khuôn mặt của tăng trưởng có trần")[
  Đây là hình chữ S của các hệ ban đầu tăng chậm, rồi tăng mạnh, rồi bị chặn lại bởi giới hạn tài nguyên hoặc dung lượng.

  *Điều cần nhớ:* điểm uốn của logistic thường mang ý nghĩa quản trị rất lớn vì nó đánh dấu lúc hệ vẫn tăng nhưng không còn tăng theo cùng cơ chế cũ.

  *Nơi xuất hiện:* dân số, lan truyền công nghệ, học tập, dịch tễ học.
]

#v(0.6em)

#vd-box("70", "Hàm hữu tỉ bậc cao hơn — khuôn mặt của phần chính và phần dư")[
  Khi tử và mẫu là đa thức, hành vi ở gần các nghiệm của mẫu và hành vi ở vô cực thường được tách ra rất đẹp.

  *Điều cần nhớ:* phép chia đa thức không chỉ là kỹ thuật biến đổi; nó lột ra phần thô của đồ thị và để lại phần sai số nhỏ ở xa.

  *Nơi xuất hiện:* mô hình truyền tín hiệu, các đáp ứng tần số, nhiều biểu thức gần đúng hữu ích.
]

#pagebreak(weak: true)

#vd-box("71", "Hàm từng phần — khuôn mặt của một thế giới có luật đổi theo vùng")[
  Nhiều hiện tượng không obey một quy luật duy nhất trên toàn miền. Chúng đổi chế độ khi vượt ngưỡng. Hàm từng phần vì thế rất thật, không hề "xấu" như nhiều học sinh tưởng.

  *Điều cần nhớ:* chỗ nối là nơi cần chất vấn về liên tục, về khả vi, và về ý nghĩa mô hình.

  *Nơi xuất hiện:* thuế lũy tiến, cước phí, điều khiển bật–tắt, ngưỡng phản ứng.
]

#v(0.6em)

#vd-box("72", "Hàm bão hòa — khuôn mặt của lợi ích giảm dần")[
  Có những hệ tăng nhanh lúc đầu rồi dần phẳng ra quanh một trần mềm, nhưng không nhất thiết có dạng logistic đối xứng. Đây là nguyên mẫu của đáp ứng bão hòa.

  *Điều cần nhớ:* tiệm cận ngang ở đây không chỉ là kỹ thuật giới hạn; nó nói rằng hệ có trần hiệu quả.

  *Nơi xuất hiện:* độ hấp thụ, hiệu quả đầu tư, đáp ứng sinh học, trải nghiệm người dùng.
]

#v(0.6em)

#vd-box("73", "Đường chuông — khuôn mặt của phân bố và tập trung")[
  Dù chưa đi sâu xác suất, học sinh vẫn nên gặp hình dạng "đỉnh ở giữa, mỏng dần ra hai phía" này như một nguyên mẫu trực giác. Nó mô tả sự tập trung quanh trung tâm và xác suất hoặc cường độ nhỏ dần khi đi xa khỏi mức điển hình.

  *Điều cần nhớ:* không phải mọi đồ thị đều kể chuyện tăng giảm đơn điệu. Có những đồ thị kể chuyện phân bố tập trung.

  *Nơi xuất hiện:* sai số đo, nhiễu, thống kê, học máy.
]

#v(0.6em)

#vd-box("74", "Dao động tắt dần — khuôn mặt của nhịp điệu có ma sát")[
  Một hệ dao động nhưng biên độ nhỏ dần theo thời gian là nơi hàm mũ và hàm tuần hoàn gặp nhau trong cùng một đồ thị.

  *Điều cần nhớ:* nhiều hiện tượng thực không thuộc một nguyên mẫu thuần. Chúng là tổ hợp có cấu trúc của vài nguyên mẫu cơ bản.

  *Nơi xuất hiện:* lò xo có ma sát, tín hiệu tắt dần, mạch điện dao động suy hao.
]

#meta-box[
  Atlas này không nhằm thay thế việc tính toán. Nó cho em một kho hình dạng gốc để khi gặp một công thức mới, em có thể tự hỏi: mình đang nhìn họ hàng của nguyên mẫu nào?
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §25. PHÒNG TẬP TỰ HỌC — HAI MƯƠI LỜI MỜI SUY NGHĨ
// ════════════════════════════════════════════════════════════════

#sec("25", "Phòng Tập Tự Học — Hai Mươi Lời Mời Suy Nghĩ Để Sở Hữu Ý Tưởng")

#why-box[
  Hiểu sâu không hoàn tất khi em đọc xong một chương. Nó hoàn tất khi em có thể *tự tái tạo* chương ấy bằng ngôn ngữ của mình.

  Hai mươi lời mời dưới đây không phải bài tập tính toán. Chúng là những đề bài viết, đề bài nói, đề bài hình dung, để buộc trực giác thành hình trong đầu em.
]

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *1.* Hãy giải thích cho một bạn chưa học giải tích: vì sao đạo hàm không phải là một thủ thuật mà là một nhu cầu sinh ra từ việc đo cái đang thay đổi.

  *2.* Hãy kể lại câu chuyện của hàm $x^3 - 3x$ hoàn toàn bằng lời, không dùng bảng biến thiên.

  *3.* Hãy viết một đoạn ngắn phân biệt thật rõ ba tầng: giá trị của hàm, đạo hàm bậc nhất, đạo hàm bậc hai.

  *4.* Hãy giải thích tại sao tiếp tuyến là "mô hình cục bộ tốt nhất" chứ không chỉ là đường chạm.

  *5.* Hãy nêu một ví dụ đời thật mà điểm uốn quan trọng hơn cực trị.
]

#v(0.8em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *6.* Hãy tự tạo một hiện tượng mà đầu ra ban đầu tăng nhanh, rồi chậm dần, và mô tả nó bằng ngôn ngữ độ cong.

  *7.* Hãy giải thích cho chính mình vì sao $f(x - a)$ dịch sang phải mà không dựa vào mẹo nhớ.

  *8.* Hãy chọn một hàm quen thuộc và chỉ ra nó là biến hình của một nguyên mẫu nào trong atlas ở trên.

  *9.* Hãy viết về khác biệt giữa việc "biết công thức nghiệm" và "biết cấu trúc nghiệm" của một phương trình.

  *10.* Hãy mô tả một bài toán tối ưu như một cuộc thương lượng giữa hai lực đối nghịch.
]

#v(0.8em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *11.* Hãy tìm một mô hình ngoài đời mà miền xác định quan trọng hơn bản thân công thức.

  *12.* Hãy giải thích tại sao tiệm cận là câu chuyện về hành vi ở xa chứ không phải một lệnh cấm hình học tuyệt đối.

  *13.* Hãy nêu một hiện tượng có thể nhìn dưới hai ống kính khác nhau: hình học và động học.

  *14.* Hãy chọn một hàm tăng nhưng có nơi đạo hàm bằng $0$, rồi dùng nó để phá một ngộ nhận phổ biến.

  *15.* Hãy viết một đoạn ngắn: vì sao trong khoa học, mô hình đơn giản đúng phạm vi có thể quý hơn mô hình quá chi tiết nhưng không thao tác được.
]

#v(0.8em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *16.* Hãy tự hỏi: nếu quên mọi công thức đạo hàm, em còn giữ lại được ý tưởng nào không thể mất?

  *17.* Hãy giải thích mối liên hệ giữa quãng đường và vận tốc mà không viết ký hiệu tích phân.

  *18.* Hãy tưởng tượng em phải dạy lại chương này trong mười phút. Em sẽ chọn ba ý tưởng nào làm xương sống?

  *19.* Hãy mô tả một ví dụ mà việc đổi hệ quy chiếu hoặc đổi thang đo làm cấu trúc sáng lên hẳn.

  *20.* Hãy viết một đoạn kết cho chính mình: sau chương này, chữ "hàm số" còn có nghĩa gì ngoài "công thức y theo x"?
]

#meta-box[
  Nếu em thực sự viết ra, nói ra, hoặc vẽ ra những lời mời suy nghĩ này, chương học sẽ đổi hẳn trạng thái. Nó không còn là cái em đã đọc. Nó trở thành cái em đã tiêu hóa.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §26. MƯỜI SÁU PHÂN BIỆT LÀM NÊN NGƯỜI HIỂU SÂU
// ════════════════════════════════════════════════════════════════

#sec("26", "Mười Sáu Phân Biệt Làm Nên Người Hiểu Sâu")

#why-box[
  Nhiều khi khác biệt giữa người học máy móc và người học sâu không nằm ở số lượng bài đã giải, mà nằm ở vài phân biệt khái niệm rất tinh nhưng rất quyết định.

  Nếu các cặp đối lập sau được nhìn thật rõ, rất nhiều nhầm lẫn trong chương hàm số sẽ tự tan đi.
]

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *1. Giá trị và quan hệ.* Một con số riêng lẻ nói ít. Một quy luật phụ thuộc mới là thứ toán học muốn nắm.
]

#v(0.5em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *2. Giá trị hiện tại và tốc độ thay đổi.* Biết đang ở đâu khác hẳn với biết đang di chuyển theo hướng nào.
]

#v(0.5em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *3. Cục bộ và toàn cục.* Đạo hàm là dữ liệu cục bộ; đồ thị là chân dung toàn cục. Giải tích mạnh ở chỗ nối được hai tầng ấy.
]

#v(0.5em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *4. Chính xác và gần đúng.* Một gần đúng đúng tinh thần và đúng phạm vi thường mạnh hơn một biểu thức chính xác nhưng bất động.
]

#v(0.5em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *5. Công thức và mô hình.* Công thức là hình thức biểu đạt; mô hình là quyết định lựa chọn cái gì đáng giữ từ hiện thực.
]

#v(0.5em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *6. Hình ảnh và định nghĩa.* Hình ảnh trực giác mở cửa, nhưng định nghĩa giữ cho ta không lạc đường.
]

#v(0.5em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *7. Điều kiện cần và điều kiện đủ.* $f'(x_0) = 0$ là lời mời điều tra, không phải phán quyết cuối cùng.
]

#v(0.5em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *8. Tăng và cong ngửa.* Một hàm có thể đang giảm nhưng cong ngửa lên. Tốc độ và độ cong là hai câu chuyện khác nhau.
]

#pagebreak(weak: true)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *9. Đối xứng và trùng hợp.* Thấy một hình giống nhau ở hai phía chưa đủ; phải biết quy luật nào bảo toàn sự giống nhau ấy.
]

#v(0.5em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *10. Biến và tham số.* Biến là thứ đang chạy trong câu chuyện; tham số là thứ làm bối cảnh của câu chuyện thay đổi.
]

#v(0.5em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *11. Nội điểm và biên.* Nhiều bài cực trị thất bại vì người học quên rằng tối ưu toàn cục có thể nằm ở rìa miền.
]

#v(0.5em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *12. Tồn tại và tính được.* Có những lúc biết chắc có nghiệm còn quan trọng hơn biết viết nghiệm ấy ra thành công thức.
]

#v(0.5em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *13. Gần đây và rất xa.* Hành vi quanh một điểm không thay thế được hành vi ở vô cực; tiếp tuyến và tiệm cận là hai loại ánh sáng khác nhau.
]

#v(0.5em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *14. Công thức đóng và quy trình lặp.* Nghiệm có thể được tiếp cận bằng thuật toán ngay cả khi không có biểu thức đẹp.
]

#v(0.5em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *15. Dữ kiện và câu hỏi.* Cùng một dữ kiện nhưng một câu hỏi nghèo sẽ tạo lời giải nghèo. Tư duy bắt đầu từ phẩm chất của câu hỏi.
]

#v(0.5em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *16. Làm được và sở hữu được.* Giải được một bài chưa chắc là sở hữu ý tưởng. Sở hữu ý tưởng là có thể nhận ra nó trong bối cảnh khác và nói lại bằng lời của mình.
]

#meta-box[
  Đôi khi toàn bộ bước trưởng thành của một học sinh trong giải tích chỉ là làm rõ dần những phân biệt này. Một khi chúng sáng lên, rất nhiều phần khác tự sắp hàng.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §27. MƯỜI HAI LỜI DẶN GỬI NGƯỜI HỌC HÀM SỐ LẦN ĐẦU
// ════════════════════════════════════════════════════════════════

#sec("27", "Mười Hai Lời Dặn Gửi Người Học Hàm Số Lần Đầu")

#why-box[
  Kết thúc một chương dài, điều đáng giữ lại không chỉ là tri thức mà còn là *thái độ* học. Mười hai lời dặn sau đây được viết như những điểm tựa để em không biến việc học hàm số thành một cuộc chạy đua công thức.
]

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 1.* Trước khi tính, hãy gọi tên đại lượng. Một bài toán không có tên cho đầu vào và đầu ra thường đã mất phương hướng từ đầu.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 2.* Đừng vội coi đồ thị là hình minh họa. Nhiều khi chính hình mới là nơi ý tưởng nói rõ nhất.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 16pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 3.* Mỗi khi thấy đạo hàm, hãy hỏi ngay: ở đây nó là tốc độ, độ nhạy, hay một dấu hiệu hình học?
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 4.* Đừng đặt niềm tin mù quáng vào $f' = 0$. Hãy xem điều gì đang diễn ra quanh điểm ấy.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 5.* Khi một quy tắc trông phản trực giác, như $f(x - a)$ dịch sang phải, đừng học thuộc. Hãy quay lại logic đầu vào–đầu ra.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 6.* Tập kể một đồ thị như kể chuyện một nhân vật. Nó sinh ra ở đâu, đi lên ở đâu, vấp ngã ở đâu, bẻ lái ở đâu, hướng về đâu?
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 7.* Khi giải phương trình, hãy nhìn giao điểm trước khi nhìn phép biến đổi đại số.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 8.* Khi tối ưu hóa, hãy tìm các lực đang kéo ngược nhau. Đạo hàm chỉ ghi lại khoảnh khắc chúng cân bằng.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 9.* Tôn trọng biên của mô hình. Một kết luận đúng trong một miền có thể trở nên vô nghĩa ngoài miền ấy.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 10.* Đừng ngại gần đúng. Gần đúng trung thực là cách mà khoa học và kỹ thuật sống được trong thế giới thật.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 11.* Luôn thử nói lại ý tưởng bằng ngôn ngữ thường. Nếu không diễn giải được bằng lời, có thể em vẫn đang cầm ký hiệu mà chưa nắm ý nghĩa.
]

#v(0.6em)

#block(fill: rgb("#F5F0FB"), inset: 16pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *Lời dặn 12.* Giữ sự kinh ngạc. Nếu mọi thứ chỉ còn là mẹo, chương này coi như đã chết. Nó sống khi em còn thấy kỳ lạ rằng một vài ý tưởng đơn giản lại đọc được nhiều phần của thế giới đến thế.
]

#meta-box[
  Đây không phải những câu khuyên đạo đức chung chung. Chúng là các điều kiện làm việc của một trí óc muốn học toán theo cách có sức sống lâu dài.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §28. MƯỜI HAI TIỂU LUẬN ĐỌC CHẬM
// ════════════════════════════════════════════════════════════════

#sec("28", "Mười Hai Tiểu Luận Đọc Chậm Về Hàm Số Và Sự Thay Đổi")

#why-box[
  Có những ý tưởng không nên chỉ học bằng cách lướt qua. Chúng cần được ngồi lại cùng, được đọc chậm, được để cho thấm dần.

  Mười hai tiểu luận ngắn dưới đây không nhằm thêm kỹ thuật mới. Chúng nhằm làm dày thêm phần "nội tâm" của chương: tại sao những khái niệm này đáng học, đáng yêu, và đáng mang theo lâu dài.
]

#vd-box("75", "Tiểu luận 1 — Cơn nghiện công thức là gì và vì sao nó nguy hiểm?")[
  Một trong những thói quen phá hỏng việc học toán nhanh nhất là cơn nghiện công thức. Nó khiến người học tưởng rằng nếu trong tay có đủ nhiều biểu thức, bài toán nào cũng sẽ tự mở. Nhưng công thức không biết đặt câu hỏi, không biết chọn cái gì quan trọng, và cũng không biết lúc nào mình đang bị dùng sai.

  Trong chương hàm số, cơn nghiện ấy biểu hiện rất rõ. Học sinh muốn thuộc ngay đạo hàm của mọi hàm, quy trình khảo sát, các bước viết tiếp tuyến, điều kiện cực trị, công thức tiệm cận. Nhưng nếu những công thức ấy không bám vào một bản đồ khái niệm, chúng chỉ là những chiếc móc treo không có tường.

  Điều nguy hiểm hơn là cơn nghiện công thức tạo ảo giác hiểu. Em làm được một số dạng, nên tưởng mình đã nắm ý tưởng. Rồi khi đề đổi hình thức, mọi thứ sụp xuống. Thứ còn đứng vững sau sự thay hình ấy không phải là công thức. Thứ đứng vững là *cấu trúc*.
]

#v(0.8em)

#vd-box("76", "Tiểu luận 2 — Đồ thị là văn học của khoa học")[
  Một công thức thường nói bằng giọng nén. Nó kiệm lời, chính xác, lạnh. Đồ thị thì khác. Đồ thị kể chuyện. Nó có tiết tấu, có chỗ leo thang, có chỗ lặng đi, có những khúc ngoặt, những khoảng căng thẳng, những đường chân trời xa.

  Có thể vì thế mà nhiều học sinh nhìn đồ thị lần đầu không xem nó như một đối tượng lý luận thật sự. Các em nghĩ đó chỉ là hình minh họa sau cùng. Nhưng thực ra, đồ thị là nơi nhiều ý tưởng sâu nói chuyện với mắt một cách trực tiếp hơn ký hiệu rất nhiều.

  Nếu công thức là văn phạm, thì đồ thị là văn chương. Nó không thay thế nhau. Chúng cần nhau. Khoa học trưởng thành khi vừa nói được chính xác, vừa nhìn được tổng thể. Chương hàm số là một trong những nơi hiếm hoi ở phổ thông mà hai năng lực ấy có thể lớn lên cùng nhau.
]

#v(0.8em)

#vd-box("77", "Tiểu luận 3 — Phát minh lớn nhất của giải tích không phải công thức, mà là một góc nhìn")[
  Khi nhắc tới Newton hay Leibniz, người ta dễ nghĩ về những ký hiệu thần kỳ. Nhưng điều vĩ đại nhất họ trao cho toán học không phải chỉ là ký hiệu. Đó là một cách nhìn: muốn hiểu cái liên tục, hãy nhìn nó ở thang cực nhỏ; muốn hiểu cái lớn, hãy biết ghép cái nhỏ lại có tổ chức.

  Đạo hàm và tích phân là hai mặt của góc nhìn ấy. Một bên soi vào vi mô, một bên lắp vi mô thành vĩ mô. Toàn bộ khoa học hiện đại dựa rất sâu vào thói quen trí tuệ này.

  Khi học sinh hiểu điều đó, giải tích thôi không còn là tập hợp mẹo biến đổi. Nó trở thành bài học đầu tiên về việc *quy mô nhìn* quyết định cách hiểu thế giới.
]

#v(0.8em)

#vd-box("78", "Tiểu luận 4 — Gần đúng không phải sự yếu đuối của toán học")[
  Có một thành kiến phổ biến rằng toán học chỉ thật sự đẹp khi cho ra đáp án đúng tuyệt đối. Vì vậy, nhiều em cảm thấy phép xấp xỉ là thứ hạng hai, thứ phải dùng khi bất lực. Đây là một hiểu lầm rất sâu.

  Gần đúng là cách mà toán học đi vào thế giới thật. Kỹ sư, nhà vật lý, nhà sinh học, nhà kinh tế hiếm khi sống với nghiệm đóng hoàn hảo. Họ sống với mô hình đủ đúng trong miền họ quan tâm. Điều làm nên phẩm giá của một phép gần đúng không phải nó tuyệt đối chính xác, mà là nó biết rõ mình đúng ở đâu và sai thế nào.

  Tiếp tuyến, Newton, tuyến tính hóa, và cả tích phân số đều là những minh chứng rằng "không hoàn hảo" không đồng nghĩa với "thấp kém". Trong nhiều bối cảnh, gần đúng có kiểm soát chính là hình thức trưởng thành nhất của hiểu biết.
]

#v(0.8em)

#vd-box("79", "Tiểu luận 5 — Vì sao đối xứng luôn làm ta thông minh hơn?")[
  Mỗi đối xứng là một lần thế giới tiết lộ rằng nó có thể được mô tả ngắn hơn ta tưởng. Đối xứng qua trục tung của hàm chẵn, đối xứng qua gốc của hàm lẻ, đối xứng của hình vuông trong bài toán cực trị, hay đối xứng tròn trong bất đẳng thức đẳng chu, tất cả đều là những lời mời nén thông tin.

  Học sinh giỏi thường không phải người tính nhanh nhất. Họ thường là người nhìn ra sớm nhất điều gì không cần tính vì một đối xứng nào đó đã làm hộ phần việc ấy.

  Đây là một bài học lớn vượt ra ngoài chương. Trong toán học bậc cao, tìm đối xứng gần như là một bản năng nghề nghiệp. Và chương hàm số là nơi bản năng ấy có thể được luyện rất sớm.
]

#pagebreak(weak: true)

#vd-box("80", "Tiểu luận 6 — Điểm uốn: nơi tương lai đổi hướng trước khi hiện tại kịp nhận ra")[
  Trong đời sống, nhiều hệ thống thất bại không phải vì người ta không biết chúng đã xuống dốc. Chúng thất bại vì người ta nhận ra quá muộn rằng đà tăng tốt đẹp ngày xưa đã đổi chất từ trước. Đó chính là trực giác của điểm uốn.

  Cực trị thường rất dễ thấy khi đã tới. Điểm uốn tinh tế hơn. Nó đòi người học nhìn vào độ cong, tức là nhìn vào sự thay đổi của sự thay đổi. Đây là tầng tư duy mà học sinh ít được dẫn vào, dù nó là một trong những năng lực dự báo quan trọng nhất.

  Một khi hiểu điểm uốn, em bắt đầu thấy vì sao giải tích không chỉ nói về hình, mà nói về cách ta phát hiện sự đổi cơ chế sớm hơn bề mặt của sự vật.
]

#v(0.8em)

#vd-box("81", "Tiểu luận 7 — Hàm số là chiếc máy, nhưng cũng là chiếc gương")[
  Ẩn dụ "chiếc máy" rất mạnh: em đưa đầu vào, máy trả đầu ra. Nó giúp ta hiểu biến hình, tham số, đầu vào–đầu ra. Nhưng nếu dừng ở đó, ta còn thiếu một nửa vẻ đẹp.

  Hàm số cũng là chiếc gương. Nó phản chiếu cách ta đặt câu hỏi về thế giới. Một người nhìn vận tốc thấy đạo hàm. Một người nhìn chi phí thấy đạo hàm. Một người nhìn độ nhạy trong một mô hình AI cũng thấy đạo hàm. Không phải vì thế giới nào cũng giống nhau bề mặt, mà vì trí tuệ đã học được một khuôn nhìn chung.

  Nói như vậy để thấy: học hàm số cũng là học một kiểu chú ý. Và kiểu chú ý ấy dần dần trở thành một phần của con người em.
]

#v(0.8em)

#vd-box("82", "Tiểu luận 8 — Giới hạn là nghệ thuật nói về cái không bao giờ chạm tới")[
  Con người rất quen với việc hỏi một đại lượng bằng bao nhiêu. Giới hạn buộc ta quen với một loại câu hỏi tinh tế hơn: nó *hướng về đâu*.

  Điều này tưởng nhỏ, nhưng là một đổi thay triết học rất lớn. Ta không còn buộc ý nghĩa vào một điểm đến tuyệt đối. Ta học cách mô tả xu hướng, tiệm cận, và hành vi tiềm cận. Ta chấp nhận rằng có những điều chỉ nên nói bằng từ "gần", nhưng cái "gần" ấy lại có thể được định nghĩa nghiêm ngặt đến mức không thể nhập nhằng.

  Đó là một trong những chiến thắng đẹp nhất của toán học: biến trực giác mơ hồ về sự tiến gần thành một ngôn ngữ chính xác và mạnh mẽ.
]

#v(0.8em)

#vd-box("83", "Tiểu luận 9 — Biến số không phải chữ cái; chúng là nhân vật")[
  Học sinh thường thấy $x$, $t$, $q$, $P$ như những ký hiệu thay thế cho số. Nhưng trong một bài toán sống, chúng là nhân vật có vai. $t$ thường là thời gian. $q$ có thể là sản lượng. $x$ có khi là vị trí. $P$ có thể là dân số hay giá trị đầu ra.

  Khi đọc biến như nhân vật, em sẽ đọc được logic của bài toán: ai tác động lên ai, ai tự do, ai bị ràng buộc, ai chỉ là tham số bối cảnh. Đây là bước rất nhỏ nhưng rất quyết định để toán học trở nên có hồn.

  Một bài toán không có nhân vật thì không có câu chuyện. Và một câu chuyện không có câu chuyện thì học sinh chỉ còn nhìn thấy bầy chữ cái vô danh.
]

#v(0.8em)

#vd-box("84", "Tiểu luận 10 — Phản ví dụ là một người thầy không biết xu nịnh")[
  Có những lúc một học sinh tưởng mình hiểu rất chắc, cho tới khi một đồ thị đơn giản phá nát niềm tin ấy. Chẳng hạn, tin rằng đạo hàm bằng $0$ luôn cho cực trị, hoặc tin rằng hàm tăng thì đạo hàm phải dương ở mọi điểm.

  Phản ví dụ đáng quý vì nó không vuốt ve. Nó chỉ ra chính xác chỗ mệnh đề của ta quá rộng, quá mơ hồ, hoặc thiếu điều kiện. Nhờ phản ví dụ, phát biểu được mài sắc hơn.

  Trong nghĩa này, phản ví dụ không phải kẻ phá bĩnh. Nó là thiết bị tinh chỉnh tư duy. Một người học sâu không chỉ thích các định lý đúng. Họ còn biết yêu các phản ví dụ vì chúng cứu mình khỏi sự tự tin rẻ tiền.
]

#pagebreak(weak: true)

#vd-box("85", "Tiểu luận 11 — Toán học nén thế giới như thế nào?")[
  Một mô hình logistic nén cả câu chuyện tăng trưởng chậm–nhanh–chậm vào một công thức. Một parabol nén cả chuyển động gia tốc đều. Một đạo hàm nén cả một ý niệm rất dài về độ nhạy tức thời. Đó là điều toán học làm giỏi hơn bất cứ ngôn ngữ nào khác: *nén mà không đánh mất cấu trúc*.

  Nhưng nén tốt đòi hỏi hiểu sâu. Nếu chỉ chép lại ký hiệu mà không cảm được cái nó đang nén, ta sẽ thấy công thức như mật mã. Nếu cảm được, ta sẽ thấy trong một hàng chữ nhỏ có thể đang gấp cả một thế giới rất lớn.

  Có lẽ đó là một lý do khiến toán học đẹp. Nó cho con người trải nghiệm rất hiếm: giữ được rất nhiều ý nghĩa trong một hình thức cực kỳ tiết kiệm.
]

#v(0.8em)

#vd-box("86", "Tiểu luận 12 — Hiểu sâu là lúc em có thể nói lại bằng tiếng Việt của chính mình")[
  Dấu hiệu cuối cùng của việc học thật không phải là làm xong bao nhiêu dạng, mà là một điều đơn giản hơn nhiều: em có thể nói lại ý tưởng bằng ngôn ngữ của mình mà không phản bội nội dung không?

  Nếu em có thể giải thích cho một người khác rằng đạo hàm là cách đo sự đổi thay tức thời, rằng điểm uốn là lúc cơ chế tăng trưởng đổi chất, rằng tiệm cận là chân trời hành vi, rằng tối ưu là một cuộc thương lượng, thì chương này đã trở thành của em.

  Khi ấy, toán học thôi không còn là thứ nằm trong sách. Nó trở thành một phần trong cách em nhìn thế giới. Và đó mới là ý nghĩa sâu nhất của một chương mở.
]

#meta-box[
  Những tiểu luận này không kết thúc chương bằng cách đóng lại. Chúng chỉ làm một việc: nới rộng thêm khoảng vang của những ý tưởng vừa học, để sau khi em rời trang sách, chúng còn tiếp tục làm việc bên trong đầu em.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §29. TỪ ĐIỂN TRỰC GIÁC — HAI MƯƠI KHÁI NIỆM PHẢI NÓI ĐƯỢC BẰNG LỜI
// ════════════════════════════════════════════════════════════════

#sec("29", "Từ Điển Trực Giác — Hai Mươi Khái Niệm Phải Nói Được Bằng Lời")

#why-box[
  Một chương được học sâu khi người học không chỉ nhận ra ký hiệu, mà có thể *nói bằng lời* điều mỗi khái niệm đang làm. Phần từ điển này không định nghĩa theo kiểu từ điển khô. Nó tìm cách giữ lại linh hồn của từng từ khóa.
]

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *1. Hàm số.* Một lời hứa rằng mỗi đầu vào được gắn với đúng một đầu ra. Nhưng sâu hơn, nó là ngôn ngữ để nói về phụ thuộc.
]

#v(0.45em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *2. Miền xác định.* Không gian mà trong đó câu chuyện có nghĩa. Nó không phải hàng rào kỹ thuật thêm vào sau, mà là một phần của bản sắc đối tượng.
]

#v(0.45em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *3. Đồ thị.* Bản chân dung nén của toàn bộ quy luật. Nhìn vào đó, ta thấy những gì công thức đôi khi giấu đi.
]

#v(0.45em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *4. Tính đơn điệu.* Câu trả lời cho việc hệ đang leo lên hay đi xuống khi đầu vào tăng. Đây là xương sống đầu tiên của mọi tiểu sử hàm số.
]

#v(0.45em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *5. Đạo hàm.* Thước đo của sự thay đổi tức thời. Nó là vận tốc trong cơ học, độ nhạy trong mô hình, và hệ số góc trong hình học.
]

#v(0.45em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *6. Tiếp tuyến.* Đường thẳng không chỉ chạm, mà còn chia sẻ hướng đi cục bộ tốt nhất với đồ thị. Nó là bản sao bậc nhất của hàm số.
]

#v(0.45em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *7. Liên tục.* Sự liền mạch của đồ thị, nơi ta không cần nhấc bút vì những cú rơi thẳng đứng vô cớ. Nhưng liên tục vẫn chưa đảm bảo có tiếp tuyến.
]

#v(0.45em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *8. Khả vi.* Mức mượt cao hơn liên tục. Nó cho phép ta tin rằng quanh điểm đang xét, đồ thị có một hướng đi xác định đủ rõ để tuyến tính hóa.
]

#pagebreak(weak: true)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *9. Giới hạn.* Cách nói nghiêm ngặt về một xu hướng. Nó cho phép toán học mô tả cái đang tiến về đâu, ngay cả khi chưa bao giờ chạm tới.
]

#v(0.45em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *10. Tiệm cận.* Gương mặt của đồ thị khi nhìn từ rất xa hoặc rất gần một bờ vực. Nó là bản sắc hành vi, không chỉ là một đường phụ trên hình.
]

#v(0.45em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *11. Cực trị.* Nơi một đại lượng tạm đạt mức tốt nhất hoặc xấu nhất cục bộ. Hình học của nó là đỉnh và đáy; triết học của nó là cân bằng.
]

#v(0.45em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *12. Điểm uốn.* Nơi hệ đổi tính khí mà chưa chắc đổi chiều. Nó là lúc độ cong thay giọng nói của mình.
]

#v(0.45em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *13. Độ cong.* Thông tin về việc độ dốc đang tăng hay giảm. Đây là nơi hiện tại bắt đầu lộ chút gì đó về tương lai gần.
]

#v(0.45em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *14. Tham số.* Một nút điều chỉnh bối cảnh. Nó không chỉ thêm ký hiệu; nó làm di chuyển hoặc biến dạng cả một họ hiện tượng.
]

#v(0.45em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *15. Biến hình đồ thị.* Ngữ pháp giúp ta thấy nhiều hàm mới chỉ là phiên bản đổi dáng của vài nguyên mẫu quen thuộc.
]

#v(0.45em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *16. Mô hình.* Sự chọn lọc có ý thức những yếu tố cần giữ để một hiện tượng trở nên suy luận được. Nó không phải ảnh chụp của thực tại.
]

#v(0.45em)

#block(fill: rgb("#F5F0FB"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-PURPLE, width: 100%)[
  #set par(first-line-indent: 0em)
  *17. Tối ưu hóa.* Nghệ thuật tìm cấu hình tốt nhất dưới ràng buộc. Dấu vết giải tích của nó thường nằm ở đạo hàm, nhưng linh hồn của nó nằm ở sự thương lượng giữa các lực đối nghịch.
]

#v(0.45em)

#block(fill: rgb("#EBF3F9"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-INDIGO, width: 100%)[
  #set par(first-line-indent: 0em)
  *18. Xấp xỉ.* Cách nói "đủ đúng" mà vẫn trung thực. Nó là cây cầu đưa toán học từ lý tưởng sang thao tác.
]

#v(0.45em)

#block(fill: rgb("#EBF3F9"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-INDIGO, width: 100%)[
  #set par(first-line-indent: 0em)
  *19. Tích lũy.* Ý tưởng gom vô số đóng góp nhỏ thành một đại lượng lớn. Đây là linh hồn của tích phân và của rất nhiều mô hình liên tục.
]

#v(0.45em)

#block(fill: rgb("#EBF3F9"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-INDIGO, width: 100%)[
  #set par(first-line-indent: 0em)
  *20. Cấu trúc.* Thứ còn sống sót khi ví dụ, bối cảnh, hay ký hiệu thay quần áo. Học toán sâu là học nhìn ra cấu trúc này.
]

#meta-box[
  Nếu hai mươi mục từ này thật sự trở thành lời nói tự nhiên của em, thì chương này không còn là một tập tài liệu dài. Nó đã trở thành một ngôn ngữ bên trong.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §30. MƯỜI THÍ NGHIỆM TƯỞNG TƯỢNG
// ════════════════════════════════════════════════════════════════

#sec("30", "Mười Thí Nghiệm Tưởng Tượng Để Tự Kiểm Tra Trực Giác")

#why-box[
  Một ý tưởng chỉ thật sự sống khi em có thể vận hành nó trong đầu mà chưa cần bút. Mười thí nghiệm tưởng tượng dưới đây được viết để em luyện khả năng ấy.
]

#vd-box("87", "Thí nghiệm 1 — Phóng to một điểm trên đồ thị")[
  Hãy tưởng tượng em có một kính hiển vi thần kỳ. Em đặt nó lên một điểm trơn của đồ thị và phóng lớn mãi.

  Câu hỏi không phải là em nhìn thấy đường gì, mà là: *đường cong ấy có đang trở nên khó phân biệt với một đường thẳng không?*

  Nếu có, em đang trực tiếp cảm ý nghĩa của khả vi và của tiếp tuyến. Nếu không, có thể ở đó tồn tại một góc nhọn, một vết gấp, hay một dạng hành vi không trơn.
]

#v(0.7em)

#vd-box("88", "Thí nghiệm 2 — Kéo một đường ngang lên xuống")[
  Hãy giữ nguyên đồ thị của một hàm số và kéo đường $y = m$ từ rất thấp lên rất cao.

  Mỗi lần số giao điểm đổi, hãy tự hỏi: điều gì vừa xảy ra? Thường em sẽ thấy nó gắn với một cực trị hoặc một đoạn đồ thị vừa rơi ra khỏi tầm của đường ngang.

  Đây là cách nhanh nhất để hiểu bài toán tham số dưới lăng kính hình học.
]

#v(0.7em)

#vd-box("89", "Thí nghiệm 3 — Thay đầu vào một lượng rất nhỏ")[
  Chọn một điểm $x_0$ và tưởng tượng đầu vào tăng thêm một lượng rất nhỏ $h$. Không cần tính, chỉ tự hỏi: đầu ra sẽ phản ứng gần như thế nào?

  Nếu trong đầu em lập tức hiện ra "gần bằng đạo hàm tại điểm đó nhân với $h$", thì tư duy vi phân đã bắt đầu bén rễ.
]

#v(0.7em)

#vd-box("90", "Thí nghiệm 4 — Đảo dấu mọi đầu ra")[
  Hãy tưởng tượng lấy một đồ thị bất kỳ rồi thay mọi giá trị $y$ thành $-y$. Điều gì đổi? Điều gì giữ?

  Em sẽ thấy cực đại đổi thành cực tiểu, phần trên lật xuống dưới, nhưng cấu trúc theo phương ngang vẫn còn. Đây là cách rất tốt để cảm trực giác của phép phản xạ qua trục hoành.
]

#v(0.7em)

#vd-box("91", "Thí nghiệm 5 — Đẩy mắt nhìn ra vô cực")[
  Chọn một hàm số có công thức rối. Bây giờ đừng nhìn gần. Hãy lùi thật xa và chỉ hỏi: ở rất xa bên trái, rất xa bên phải, nó muốn giống cái gì?

  Nếu em học được thói quen này, tiệm cận thôi không còn là một mục phụ trong sách. Nó trở thành một phản xạ trí tuệ: *mọi đối tượng đều có một bộ mặt gần và một bộ mặt xa*.
]

#pagebreak(weak: true)

#vd-box("92", "Thí nghiệm 6 — So sánh hai hàm chỉ bằng tốc độ thay đổi")[
  Giả sử em không biết chính xác hai hàm $f$ và $g$, nhưng biết rằng ở một vùng nào đó $f'(x)$ luôn lớn hơn $g'(x)$.

  Điều này cho em quyền đoán gì về cách khoảng cách giữa hai đồ thị sẽ biến thiên? Bài tập tưởng tượng này giúp nối đạo hàm với hành vi tương đối của hai hệ.
]

#v(0.7em)

#vd-box("93", "Thí nghiệm 7 — Tái dựng đồ thị chỉ từ dấu của đạo hàm")[
  Hãy xóa hẳn công thức gốc. Chỉ giữ lại một hàng thông tin: ở đâu đạo hàm dương, ở đâu âm, ở đâu bằng $0$.

  Từ đó, em thử hình dung xem đồ thị buộc phải có những đoạn đi lên, đi xuống, và những chỗ dừng nào. Bài tập này dạy rằng đôi khi cấu trúc mạnh hơn chi tiết.
]

#v(0.7em)

#vd-box("94", "Thí nghiệm 8 — Tái dựng trực giác từ đạo hàm bậc hai")[
  Bây giờ làm thêm một lớp nữa: chỉ giữ lại dấu của đạo hàm bậc hai. Em sẽ không biết chính xác đồ thị cao thấp ra sao, nhưng sẽ biết ở đâu nó ôm lên, ở đâu nó úp xuống.

  Một khi làm được điều này trong đầu, em sẽ bắt đầu thấy độ cong như một thứ hữu hình chứ không chỉ là một cột dấu phụ trong bài khảo sát.
]

#v(0.7em)

#vd-box("95", "Thí nghiệm 9 — Thay thế cái cong bằng cái thẳng")[
  Trước một bài toán khó, hãy tự hỏi: nếu ta đứng đủ gần một điểm, có thể thay toàn bộ hàm phức tạp bằng một đường thẳng không? Và nếu làm thế, ta mất gì, được gì?

  Đây chính là tư duy nền của xấp xỉ tuyến tính. Nó không chỉ cho số gần đúng; nó dạy một thái độ: đừng cố nuốt cả con voi khi một lát cắt cục bộ đã đủ để hành động.
]

#v(0.7em)

#vd-box("96", "Thí nghiệm 10 — Đi ngược từ tốc độ về tích lũy")[
  Cuối cùng, hãy tưởng tượng em không biết đồ thị gốc của một đại lượng, chỉ biết tốc độ thay đổi của nó ở mọi nơi. Em có thể hình dung cách "ghép" những tốc độ nhỏ ấy thành một đại lượng lớn hơn không?

  Nếu câu trả lời là có, em đã chạm vào tinh thần của tích phân trước cả khi học kỹ thuật nguyên hàm. Và đó là một kết thúc rất đẹp cho chương mở này: từ thay đổi cục bộ, trí óc quay về được với bức tranh tích lũy toàn cục.
]

#meta-box[
  Mười thí nghiệm tưởng tượng này có thể được lặp lại nhiều lần trong suốt hành trình học giải tích. Mỗi lần quay lại, em sẽ thấy mình nhìn cùng một ý tưởng bằng đôi mắt sâu hơn một chút.
]

#pagebreak(weak: true)

// ════════════════════════════════════════════════════════════════
//  §31. SÁU CÂU HỎI PHẢI CÒN Ở LẠI
// ════════════════════════════════════════════════════════════════

#sec("31", "Sáu Câu Hỏi Phải Còn Ở Lại Sau Chương Này")

#why-box[
  Một chương học thành công không khép lại bằng việc mọi thứ đã xong, mà bằng việc vài câu hỏi đủ mạnh còn ở lại trong đầu người học.
]

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *1. Khi một đại lượng thay đổi, ta nên nhìn giá trị của nó, tốc độ thay đổi của nó, hay sự thay đổi của tốc độ ấy?* Câu hỏi này mở ra cả ba tầng của giải tích.
]

#v(0.6em)

#block(fill: rgb("#F8FAFC"), inset: 14pt, radius: 8pt, stroke: 0.8pt + rgb("#CBD5E1"), width: 100%)[
  #set par(first-line-indent: 0em)
  *2. Nếu chỉ được giữ lại một bản đồ, em sẽ giữ công thức, đồ thị, hay câu chuyện bằng lời?* Câu trả lời tốt nhất thường là biết nối cả ba.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *3. Điều gì xảy ra khi ta nhìn một hiện tượng ở cự ly cực gần, và điều gì xảy ra khi ta nhìn nó từ rất xa?* Đây là cặp mắt của tiếp tuyến và tiệm cận.
]

#v(0.6em)

#block(fill: rgb("#F6FBF4"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-GREEN, width: 100%)[
  #set par(first-line-indent: 0em)
  *4. Một bài toán đang đòi em tính toán, hay đang đòi em nhìn ra cấu trúc?* Biết phân biệt điều này giúp em không lạc vào đống kỹ thuật không cần thiết.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *5. Khi một quy luật phức tạp xuất hiện, có thể nó chỉ là biến hình của nguyên mẫu nào em đã biết không?* Đây là câu hỏi của ngữ pháp hàm số.
]

#v(0.6em)

#block(fill: rgb("#FFF6EA"), inset: 14pt, radius: 8pt, stroke: 0.8pt + C-AMBER, width: 100%)[
  #set par(first-line-indent: 0em)
  *6. Nếu quên gần hết kỹ thuật, em còn giữ lại được những câu hỏi nào đủ mạnh để tự học tiếp?* Đây mới là thước đo thật của một chương khai mở.
]

#meta-box[
  Nếu sáu câu hỏi này còn ở lại, chương này chưa kết thúc. Nó mới chỉ đổi chỗ sống: từ trên giấy sang trong đầu người đọc.
]

// ─── Lời kết ──────────────────────────────────────────────────
#align(center)[
  #block(
    fill: gradient.linear(C-DARK, C-NAVY, angle: 120deg),
    inset: (x: 24pt, y: 20pt),
    radius: 10pt,
    width: 95%,
  )[
    #set par(first-line-indent: 0em)
    #align(center)[
      #text(fill: C-GOLD, weight: "bold", size: 11pt)[LỜI KẾT CHƯƠNG 1]
      #v(0.8em)
      #text(fill: rgb("#CFD8DC"), size: 10pt, style: "italic")[
        "Hàm số không phải là một đống công thức cần nhớ.#linebreak()
        Đó là ngôn ngữ mà thiên nhiên dùng để viết các quy luật của mình.#linebreak()
        Đạo hàm không phải là một phép tính khó.#linebreak()
        Đó là chiếc kính để ta đọc ngôn ngữ đó — từng chữ một, từng khoảnh khắc một."
      ]
      #v(0.8em)
      #text(fill: rgb("#80DEEA"), size: 9.5pt)[
        Chương tiếp theo: *Tính Đơn Điệu — Dòng Chảy Của Đạo Hàm*
      ]
    ]
  ]
]
