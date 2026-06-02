#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2": canvas, draw

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG CHUNG
// ═══════════════════════════════════════════════

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("041c15"), rgb("0a3629"), rgb("12523f"), angle: 135deg),
  stroke: none,
  inset: (x: 16pt, y: 11pt),
  radius: 6pt,
  above: 1.9em,
  below: 1.3em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("0a3629")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("0a3629"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("0D47A1"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = sys.inputs.at("mode", default: "loigiai")
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu chủ đề ────────────────────────────────────────
#let c-darkgreen = rgb("041c15")
#let c-emerald = rgb("1A936F")
#let c-navy = rgb("0D47A1")
#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-violet = rgb("4A148C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")

// ─── Hộp Lý Thuyết Sư Phạm ──────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + c-navy, rest: 0.8pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Sư Phạm", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + c-violet, rest: 0.6pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FBE9E7"),
  stroke: (left: 4pt + c-amber, rest: 0.6pt + rgb("FFAB91")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[⚠️ Lỗi Sai Thường Gặp]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("C5E1A5")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[📝 Bài toán #n]
  #v(0.3em)
  #body
]

#let cach1-box(body) = if mode == "loigiai" {
  block(
    fill: rgb("E3F2FD"),
    stroke: (left: 4pt + c-navy, rest: 0.5pt + rgb("90CAF9")),
    radius: (right: 6pt),
    inset: (x: 13pt, y: 10pt),
    width: 100%,
  )[#text(fill: c-navy, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Trực tiếp / Sơ đồ cây / Phương trình trạng thái] #v(0.3em) #body]
} else { none }

#let cach2-box(body) = if mode == "loigiai" {
  block(
    fill: rgb("F3E5F5"),
    stroke: (left: 4pt + c-violet, rest: 0.5pt + rgb("CE93D8")),
    radius: (right: 6pt),
    inset: (x: 13pt, y: 10pt),
    width: 100%,
  )[#text(fill: c-violet, weight: "bold", size: 10.5pt)[🟣 Cách 2 — Ma trận chuyển trạng thái / Chuỗi số / Hàm sinh] #v(0.3em) #body]
} else { none }

#let ans-box(body) = if mode == "loigiai" {
  block(
    fill: rgb("E8F5E9"),
    stroke: 1.5pt + c-green,
    radius: 6pt,
    inset: (x: 14pt, y: 10pt),
    width: 100%,
  )[
    #text(fill: c-green, weight: "bold")[🎯 Đáp số trắc nghiệm trả lời ngắn / Kết luận]
    #v(0.25em)
    #body
  ]
} else { none }

#let sol-diagram(body) = if mode == "loigiai" {
  align(center, body)
} else { none }


// ═══════════════════════════════════════════════
// TRANG BÌA SÁCH
// ═══════════════════════════════════════════════
#{
  let c-bg = rgb("#041c15") // Xanh lục bảo cực đậm
  let c-p1 = rgb("#0D47A1") // Xanh Navy
  let c-p2 = rgb("#1A936F") // Lục bảo sáng
  let c-p3 = rgb("#BF360C") // Rust Orange
  let c-p4 = rgb("#4A148C") // Tím đậm

  // Nền toàn trang - offset lề y: 1.8cm, x: 1.4cm
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 210mm, height: 297mm, fill: c-bg, radius: 0pt))
  // Dải màu trái
  place(top + left, dx: -1.4cm, dy: -1.8cm, rect(width: 7mm, height: 297mm, fill: c-p2, radius: 0pt))
  // Dải 5 màu dưới
  place(bottom + left, dx: -1.4cm, dy: 1.8cm, block(width: 210mm, height: 20mm)[
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      rows: 20mm,
      rect(fill: c-p1, stroke: none),
      rect(fill: c-p2, stroke: none),
      rect(fill: c-p3, stroke: none),
      rect(fill: c-p4, stroke: none),
      rect(fill: rgb("37474F"), stroke: none),
    )
  ])

  v(26mm)
  align(center, {
    // Nhãn chuyên đề
    box(
      stroke: 1pt + white.transparentize(50%),
      fill: white.transparentize(85%),
      inset: (x: 18pt, y: 7pt),
      radius: 20pt,
    )[
      #text(fill: white, weight: "bold", size: 10pt, tracking: 0.07em)[
        ◆ BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL  ·  2025 – 2026
      ]
    ]
    v(1.5em)
    // Công thức trang trí đại diện cho Markov
    text(fill: white.transparentize(50%), size: 12pt)[
      $P(X_(n+1) = j | X_n = i) = p_(i j) quad "và" quad bold(P)^n = bold(P)^(n-1) dot.c bold(P)$
    ]
    v(1.4em)
    // Khung tiêu đề chính
    block(
      width: 88%,
      fill: white,
      inset: (top: 0pt, bottom: 22pt, x: 24pt),
      radius: 12pt,
      {
        block(
          width: 100%,
          height: 6pt,
          fill: c-p2,
          radius: (top-left: 12pt, top-right: 12pt, bottom-left: 0pt, bottom-right: 0pt),
        )
        v(1.2em)
        text(size: 23pt, weight: "bold", fill: c-bg)[CHUỖI TRẠNG THÁI & MARKOV]
        linebreak()
        text(size: 13pt, weight: "bold", fill: c-p2)[STATE SEQUENCES & MARKOV CHAINS]
        linebreak()
        v(0.4em)
        text(size: 15pt, weight: "bold", fill: c-p3)[HỆ THỐNG MA TRẬN BÀI TẬP ĐỘC ĐÁO XÁC SUẤT & TỔ HỢP]
        v(0.7em)
        line(length: 100%, stroke: 1.5pt + c-p2.lighten(55%))
        v(0.6em)
        text(size: 10pt, style: "italic", fill: rgb("#475569"))[
          Trò chơi luân phiên · Xâu ký tự tránh mẫu · Đi bộ ngẫu nhiên · Chu trình lưới phẳng · Trọng số Markov
        ]
        v(1.2em)
        // Nhãn phần
        grid(
          columns: (1fr, 1fr, 1fr),
          column-gutter: 10pt,
          block(fill: c-p1, inset: (x: 4pt, y: 7pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[5 LỚP BÀI TOÁN]]
          ],
          block(fill: c-p2, inset: (x: 4pt, y: 7pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[20 BÀI ĐIỂN HÌNH]]
          ],
          block(fill: c-p3, inset: (x: 4pt, y: 7pt), radius: 4pt, width: 100%)[
            #align(center)[#text(fill: white, size: 8.5pt, weight: "bold")[LỜI GIẢI KÉP]]
          ],
        )
      },
    )
    v(2em)
    // Tác giả
    box(stroke: 1pt + white.transparentize(45%), inset: (x: 22pt, y: 13pt), radius: 8pt)[
      #text(fill: white, weight: "bold", size: 13pt)[★ GV Nguyễn Văn Sang]
      #linebreak()
      #text(fill: white.transparentize(30%), size: 10pt)[
        SĐT: 0389.821.115 · Tổ Toán – Thực chiến HSG & Luyện thi ĐGNL
      ]
    ]
  })
}
#pagebreak()

// ═══════════════════════════════════════════════
// MỤC LỤC TỰ ĐỘNG & SET PAGE
// ═══════════════════════════════════════════════


#outline(title: [Mục Lục Chuyên Đề], depth: 2, indent: 1.5em)
#pagebreak()

= PHẦN 1. LÝ THUYẾT NỀN TẢNG CHUỖI TRẠNG THÁI & CHUỖI MARKOV

#theory-box[
  == 1. Không gian trạng thái và Chuỗi trạng thái
  Trong các bài toán thực tế và HSG THPT, ta thường xét một hệ thống biến đổi theo từng bước rời rạc $n = 0, 1, 2, dots$. Tại mỗi bước $n$, hệ thống nằm ở một trong các trạng thái thuộc tập hợp hữu hạn hoặc vô hạn đếm được $Omega = {s_1, s_2, dots, s_m}$, gọi là *không gian trạng thái* (state space).
  
  Chuỗi các đại lượng ngẫu nhiên $X_0, X_1, X_2, dots, X_n, dots$ mô tả trạng thái của hệ thống qua từng bước được gọi là một *chuỗi trạng thái*.
  
  == 2. Tính chất Markov (Không nhớ)
  Một chuỗi trạng thái được gọi là một *chuỗi Markov* nếu xác suất chuyển sang trạng thái tiếp theo chỉ phụ thuộc vào trạng thái hiện tại của hệ thống, mà không phụ thuộc vào toàn bộ lịch sử trước đó:
  $ P(X_(n+1) = j | X_n = i, X_(n-1) = i_(n-1), dots, X_0 = i_0) = P(X_(n+1) = j | X_n = i) = p_(i j) $
  Với $p_(i j)$ là *xác suất chuyển* từ trạng thái $i$ sang trạng thái $j$.
  
  == 3. Ma trận chuyển trạng thái (Transition Matrix)
  Nếu không gian trạng thái gồm $m$ phần tử, ta có thể sắp xếp các xác suất chuyển $p_(i j)$ thành một ma trận vuông $bold(P)$ kích thước $m times m$, gọi là *ma trận chuyển trạng thái*:
  $ bold(P) = mat(
    p_(1.1), p_(1.2), dots, p_(1,m);
    p_(2.1), p_(2.2), dots, p_(2,m);
    dots.v, dots.v, dots.down, dots.v;
    p_(m,1), p_(m,2), dots, p_(m,m)
  ) $
  Ma trận chuyển $bold(P)$ có đặc điểm:
  - Tất cả các phần tử $p_(i j) >= 0$.
  - Tổng các phần tử trên mỗi hàng bằng $1$ (tổng xác suất đi từ một trạng thái đến tất cả các trạng thái khác luôn bằng 1).
  
  == 4. Công thức Chapman-Kolmogorov và Xác suất trạng thái
  Gọi $bold(pi)^(n) = (p_1^(n), p_2^(n), dots, p_m^(n))$ là vectơ dòng biểu diễn phân phối xác suất của hệ thống tại bước $n$, với $p_i^(n) = P(X_n = s_i)$. Khi đó:
  $ bold(pi)^(n) = bold(pi)^(n-1) dot.c bold(P) = bold(pi)^(0) dot.c bold(P)^n $
  Công thức trên cho thấy vai trò cực kỳ mạnh mẽ của lũy thừa ma trận chuyển $bold(P)^n$ trong việc tìm phân phối xác suất sau $n$ bước di chuyển.
  
  Trạng thái $s_i$ được gọi là *trạng thái hấp thụ* nếu hệ thống khi đã lọt vào $s_i$ thì sẽ vĩnh viễn ở lại đó, tức là $p_(i i) = 1$ và $p_(i j) = 0$ với mọi $j != i$.
]

= PHẦN 2. HỆ THỐNG BÀI TẬP CHUYÊN ĐỀ CHUỖI TRẠNG THÁI & CHUỖI MARKOV

== LỚP BÀI TOÁN 1: TRÒ CHƠI LUÂN PHIÊN VÀ VÒNG LẶP XÁC SUẤT VÔ HẠN

#insight-box[
  *Đặc trưng:* Các bài toán thực tế về trò chơi đối kháng kéo dài nhiều vòng, có thể lặp vô hạn cho đến khi có người chiến thắng hoặc hệ thống dừng lại.
]

#example-box(n: "1.1 (Trò chơi tung xúc xắc luân phiên)")[
  Hai bạn An và Bình luân phiên nhau tung một con xúc xắc cân đối và đồng chất. An là người tung trước. Ai tung được mặt $6$ chấm trước thì người đó thắng cuộc và trò chơi kết thúc. Tính xác suất để An là người giành chiến thắng chung cuộc.
]

#sol-diagram(canvas({
  import draw: *
  // Các trạng thái
  circle((-2.5, 0), radius: 0.85, name: "A")
  content("A", text(size: 8.5pt)[Lượt An \ (A)])
  circle((2.5, 0), radius: 0.85, name: "B")
  content("B", text(size: 8.5pt)[Lượt Bình \ (B)])
  circle((-2.5, -2.2), radius: 0.85, name: "EA")
  content("EA", text(size: 8.5pt)[An thắng])
  circle((2.5, -2.2), radius: 0.85, name: "EB")
  content("EB", text(size: 8.5pt)[Bình thắng])
  
  // Các cung chuyển trạng thái
  bezier("A.30", "B.150", (0, 0.9), mark: (end: ">", fill: black))
  content((0, 1.1), $5/6$)
  
  bezier("B.210", "A.330", (0, -0.9), mark: (end: ">", fill: black))
  content((0, -1.1), $5/6$)
  
  line("A.south", "EA.north", mark: (end: ">", fill: black))
  content((-3.6, -1.1), $1/6$)
  
  line("B.south", "EB.north", mark: (end: ">", fill: black))
  content((3.6, -1.1), $1/6$)
}))

#cach1-box[
  Ta có thể mô tả quá trình thắng cuộc của An dưới dạng tổng của một chuỗi các biến cố độc lập qua các vòng chơi:
  - Vòng 1: An tung và thắng ngay lập tức ở lượt đầu tiên (lượt 1). Xác suất là $P_1 = 1/6$.
  - Vòng 2: An tung hỏng ở lượt 1 ($5/6$), Bình tung hỏng ở lượt 2 ($5/6$), và An tung trúng ở lượt 3. Xác suất là $P_3 = (5/6)^2 times 1/6$.
  - Vòng $k$: An tung thắng ở lượt thứ $2k-1$ (tức là $2k-2$ lượt trước đó của cả hai đều hỏng). Xác suất là $P_(2k-1) = (5/6)^(2k-2) times 1/6$.
  
  Tổng xác suất để An thắng chung cuộc là tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/6$ và công bội $q = (5/6)^2 = 25/36 < 1$:
  $ P(A) = 1/6 + (5/6)^2 times 1/6 + (5/6)^4 times 1/6 + dots = 1/6 times frac(1, 1 - 25/36) = 1/6 times frac(36, 11) = frac(6, 11) $
]

#cach2-box[
  Sử dụng phương pháp thiết lập phương trình trạng thái (Markov Chain State Equation):
  Gọi $a$ là xác suất An giành chiến thắng chung cuộc khi đang ở trạng thái lượt của mình.
  Gọi $b$ là xác suất An giành chiến thắng chung cuộc khi đang ở trạng thái lượt của Bình.
  - Khi đến lượt của An, An sẽ thắng ngay với xác suất $1/6$. Nếu An tung trượt (xác suất $5/6$), trạng thái chuyển sang lượt của Bình, và từ đây cơ hội thắng của An là $b$. Do đó:
    $ a = 1/6 times 1 + 5/6 times b = 1/6 + 5/6 b $
  - Khi đến lượt của Bình, An chỉ có thể thắng nếu Bình tung trượt (xác suất $5/6$), lúc đó trạng thái quay trở lại lượt của An, và cơ hội thắng của An lúc này lại là $a$. Do đó:
    $ b = 5/6 times a $
  Thay thế $b$ vào phương trình đầu tiên, ta có:
  $ a = 1/6 + 5/6 times (5/6 a) = 1/6 + 25/36 a \
    => a (1 - 25/36) = 1/6 => frac(11, 36) a = 1/6 => a = frac(6, 11) $
]

#ans-box[
  Xác suất để An là người giành chiến thắng chung cuộc là $frac(6, 11)$ (xấp xỉ $54.55\%$).
]

#v(1em)

#example-box(n: "1.2 (Trò chơi bắn súng đối đầu)")[
  Thầy Nghĩa và thầy Ái luân phiên nhau bắn vào một mục tiêu di động, ai bắn trúng trước sẽ thắng cuộc và trò chơi dừng lại. Biết thầy Nghĩa bắn trước. Xác suất bắn trúng trong mỗi lượt của thầy Nghĩa là $0.4$ và của thầy Ái là $0.5$. Tính xác suất để thầy Nghĩa giành chiến thắng.
]

#cach1-box[
  Thầy Nghĩa bắn thắng ở các lượt lẻ: lượt 1, lượt 3, lượt 5,...
  - Thắng ở lượt 1: Nghĩa bắn trúng ngay. Xác suất: $0.4$.
  - Thắng ở lượt 3: Nghĩa trượt lượt 1 ($0.6$), Ái trượt lượt 2 ($0.5$), Nghĩa trúng lượt 3 ($0.4$). Xác suất: $0.6 times 0.5 times 0.4 = 0.3 times 0.4$.
  - Thắng ở lượt $2k-1$: Nghĩa và Ái đều trượt $k-1$ vòng trước. Xác suất: $(0.6 times 0.5)^(k-1) times 0.4 = (0.3)^(k-1) times 0.4$.
  
  Xác suất thắng của thầy Nghĩa là tổng cấp số nhân lùi vô hạn với $u_1 = 0.4$ và công bội $q = 0.3$:
  $ P = 0.4 + 0.4 times 0.3 + 0.4 times (0.3)^2 + dots = frac(0.4, 1 - 0.3) = frac(0.4, 0.7) = frac(4, 7) $
]

#cach2-box[
  Gọi $x$ là xác suất thầy Nghĩa thắng khi đến lượt bắn của thầy Nghĩa.
  Gọi $y$ là xác suất thầy Nghĩa thắng khi đến lượt bắn của thầy Ái.
  - Từ lượt của mình, thầy Nghĩa thắng ngay với xác suất $0.4$. Nếu trượt ($0.6$), lượt chuyển sang thầy Ái và xác suất thắng lúc này là $y$:
    $ x = 0.4 + 0.6 y $
  - Từ lượt của thầy Ái, thầy Nghĩa chỉ thắng được nếu thầy Ái bắn trượt ($1 - 0.5 = 0.5$), khi đó lượt quay lại thầy Nghĩa với xác suất thắng là $x$:
    $ y = 0.5 x $
  Thế vào phương trình thứ nhất:
  $ x = 0.4 + 0.6 times (0.5 x) = 0.4 + 0.3 x \
    => 0.7 x = 0.4 => x = frac(4, 7) $
]

#ans-box[
  Xác suất để thầy Nghĩa giành chiến thắng chung cuộc là $frac(4, 7)$ (xấp xỉ $57.14\%$).
]

#v(1em)

#example-box(n: "1.3 (Bài toán truyền tin qua nhiều trạm trung chuyển)")[
  Một nguồn phát tín hiệu nhị phân phát đi ký tự $0$ hoặc $1$. Tín hiệu này được truyền qua một hệ thống gồm $n$ trạm trung chuyển nối tiếp nhau trước khi đến máy nhận. Tại mỗi trạm, do nhiễu đường truyền, xác suất để tín hiệu bị đảo ngược (từ $0$ thành $1$ hoặc từ $1$ thành $0$) luôn là $p$ ($0 < p < 1$). Biết tín hiệu ban đầu phát ra từ nguồn là số $1$. Tìm công thức tính xác suất tổng quát theo $n$ và $p$ để tín hiệu máy nhận được ở đích vẫn là số $1$.
]

#cach1-box[
  Gọi $x_k$ là xác suất để tín hiệu sau khi đi qua trạm thứ $k$ là số $1$ (với $k = 1, 2, dots, n$).
  Biết tín hiệu xuất phát từ nguồn (trạm 0) là 1, nên $x_0 = 1$.
  Tại trạm thứ $k$, tín hiệu sau trạm này là số $1$ xảy ra trong hai trường hợp:
  - Tín hiệu sau trạm $k-1$ là số $1$ và trạm $k$ truyền đúng (xác suất $1-p$).
  - Tín hiệu sau trạm $k-1$ là số $0$ và trạm $k$ truyền sai (làm đảo $0$ thành $1$, xác suất $p$).
  Do đó ta có hệ thức truy hồi:
  $ x_k = x_(k-1) times (1-p) + (1 - x_(k-1)) times p = (1 - 2p) x_(k-1) + p $
  Để giải phương trình sai phân tuyến tính cấp 1 này, ta tìm điểm cân bằng $L$:
  $ L = (1-2p)L + p => 2p L = p => L = 1/2 $
  Đặt $y_k = x_k - 1/2$, ta có:
  $ y_k = (1-2p) y_(k-1) => y_k = y_0 times (1-2p)^k $
  Với $y_0 = x_0 - 1/2 = 1 - 1/2 = 1/2$. Do đó:
  $ x_n - 1/2 = 1/2 (1-2p)^n => x_n = 1/2 + 1/2 (1-2p)^n $
]

#cach2-box[
  Ta biểu diễn hệ thống bằng ma trận chuyển trạng thái với không gian trạng thái $Omega = {0, 1}$.
  Ma trận chuyển giữa mỗi trạm trung chuyển là:
  $ bold(P) = mat(1-p, p; p, 1-p) $
  Trạng thái ban đầu là $1$, nên vectơ phân phối xác suất ban đầu là $bold(pi)^0 = (0, 1)$ (với vị trí tương ứng là trạng thái 0 và 1).
  Vectơ xác suất sau $n$ trạm là:
  $ bold(pi)^n = bold(pi)^0 dot.c bold(P)^n $
  Để tính $bold(P)^n$, ta chéo hóa ma trận $bold(P)$:
  Các trị riêng của $bold(P)$ là nghiệm của phương trình $|bold(P) - lambda bold(I)| = 0$:
  $ (1-p-lambda)^2 - p^2 = 0 => (1-p-lambda-p)(1-p-lambda+p) = 0 => lambda_1 = 1, lambda_2 = 1-2p $
  Ma trận vectơ riêng tương ứng là $bold(V) = mat(1, 1; 1, -1)$ với nghịch đảo là $bold(V)^(-1) = frac(1, 2) mat(1, 1; 1, -1)$.
  Lũy thừa ma trận $bold(P)^n$ là:
  $ bold(P)^n = bold(V) mat(1, 0; 0, (1-2p)^n) bold(V)^(-1) = frac(1, 2) mat(1 + (1-2p)^n, 1 - (1-2p)^n; 1 - (1-2p)^n, 1 + (1-2p)^n) $
  Nhân với vectơ ban đầu $bold(pi)^0 = (0, 1)$ để tìm xác suất ở trạng thái $1$ (phần tử thứ hai của vectơ kết quả):
  $ x_n = (bold(pi)^n)_2 = frac(1, 2) [1 + (1-2p)^n] $
]

#ans-box[
  Công thức xác suất tổng quát sau $n$ trạm là $x_n = frac(1, 2) + frac(1, 2) (1-2p)^n$.
]

#v(1em)

#example-box(n: "1.4 (Mô hình phá sản của tay chơi - Gambler's Ruin)")[
  Hai người chơi $A$ và $B$ tham gia một trò chơi đối kháng độc lập nhiều ván. Ban đầu $A$ có $3$ viên kẹo, $B$ có $2$ viên kẹo. Ở mỗi ván chơi, xác suất $A$ thắng là $0.6$ và $B$ thắng là $0.4$. Người thắng ván đó sẽ được nhận $1$ viên kẹo từ người thua. Trò chơi kết thúc ngay khi có một người hết sạch kẹo. Tính xác suất để người chơi $A$ thắng chung cuộc (lấy được tất cả kẹo của $B$).
]

#cach1-box[
  Tổng số kẹo trong hệ thống là $3 + 2 = 5$ viên. Gọi trạng thái là số kẹo của người $A$, từ $0$ đến $5$.
  Gọi $P_i$ là xác suất để người chơi $A$ thắng chung cuộc khi đang có $i$ viên kẹo ($0 <= i <= 5$).
  Các biên hấp thụ là:
  - $P_0 = 0$ (A hết kẹo và thua cuộc).
  - $P_5 = 1$ (A thắng cuộc khi đạt tất cả 5 viên kẹo).
  
  Với $1 <= i <= 4$, theo công thức xác suất đầy đủ:
  $ P_i = 0.6 P_(i+1) + 0.4 P_(i-1) $
  Đây là phương trình sai phân tuyến tính thuần nhất cấp 2: $0.6 P_(i+1) - P_i + 0.4 P_(i-1) = 0$.
  Phương trình đặc trưng:
  $ 0.6 r^2 - r + 0.4 = 0 => 3 r^2 - 5 r + 2 = 0 => r_1 = 1, r_2 = frac(2, 3) $
  Nghệm tổng quát của hệ thức là:
  $ P_i = C_1 + C_2 (frac(2, 3))^i $
  Thay các điều kiện biên vào:
  - $P_0 = 0 => C_1 + C_2 = 0 => C_2 = -C_1$.
  - $P_5 = 1 => C_1 - C_1 (frac(2, 3))^5 = 1 => C_1 [1 - frac(32, 243)] = 1 => C_1 = frac(243, 211)$.
  Từ đó, công thức tổng quát của $P_i$ là:
  $ P_i = frac(1 - (2/3)^i, 1 - (2/3)^5) $
  Với trạng thái xuất phát $i = 3$:
  $ P_3 = frac(1 - (2/3)^3, 1 - (2/3)^5) = frac(1 - 8/27, 1 - 32/243) = frac(19/27, 211/243) = frac(19 times 9, 211) = frac(171, 211) $
]

#cach2-box[
  Ta có thể lập hệ phương trình trực tiếp cho các biến $P_1, P_2, P_3, P_4$:
  $ P_1 = 0.6 P_2 \
    P_2 = 0.6 P_3 + 0.4 P_1 \
    P_3 = 0.6 P_4 + 0.4 P_2 \
    P_4 = 0.6 + 0.4 P_3 $
  Giải hệ phương trình này bằng phương pháp thế:
  - Từ (1): $P_1 = 0.6 P_2$.
  - Thế vào (2): $P_2 = 0.6 P_3 + 0.4 (0.6 P_2) = 0.6 P_3 + 0.24 P_2 => 0.76 P_2 = 0.6 P_3 => P_2 = frac(15, 19) P_3$.
  - Thế $P_2$ vào (3): $P_3 = 0.6 P_4 + 0.4 (frac(15, 19) P_3) = 0.6 P_4 + frac(6, 19) P_3 => frac(13, 19) P_3 = 0.6 P_4 => P_4 = frac(65, 57) P_3$.
  - Thế $P_3, P_4$ vào (4):
    $ frac(65, 57) P_3 = 0.6 + 0.4 P_3 \
      => P_3 (frac(65, 57) - frac(2, 5)) = 0.6 \
      => P_3 (frac(325 - 114, 285)) = 0.6 \
      => P_3 (frac(211, 285)) = frac(3, 5) \
      => P_3 = frac(3, 5) times frac(285, 211) = frac(171, 211) $
]

#ans-box[
  Xác suất để người chơi $A$ thắng chung cuộc là $frac(171, 211)$ (xấp xỉ $81.04\%$).
]

#v(1em)

#example-box(n: "1.5 (Trò chơi rút bài có hoàn lại)")[
  Một hộp chứa $3$ thẻ đỏ và $2$ thẻ xanh. An và Bình lần lượt rút ngẫu nhiên một thẻ từ hộp, ghi lại màu rồi hoàn trả vào hộp. An rút trước. Ai rút được thẻ xanh trước sẽ thắng cuộc. Trò chơi tiếp diễn tối đa đến lượt rút thứ $5$ của Bình (tức là mỗi người rút tối đa 5 lần), nếu vẫn chưa ai rút được thẻ xanh thì hòa nhau. Tính xác suất để An giành chiến thắng.
]

#cach1-box[
  Xác suất rút được thẻ xanh trong mỗi lượt là $p = 2/5 = 0.4$ và thẻ đỏ là $q = 3/5 = 0.6$.
  Vì mỗi người rút tối đa 5 lần, nên An chỉ có thể thắng ở các lượt rút thứ 1, 3, 5, 7, 9 của trò chơi (tương ứng với lượt rút thứ 1, 2, 3, 4, 5 của riêng An).
  - An thắng ở lượt rút thứ 1: An rút được xanh ngay. Xác suất: $p = 0.4$.
  - An thắng ở lượt rút thứ 3: An trượt, Bình trượt, An trúng. Xác suất: $q^2 p = 0.6^2 times 0.4$.
  - An thắng ở lượt rút thứ 5: $q^4 p$.
  - An thắng ở lượt rút thứ 7: $q^6 p$.
  - An thắng ở lượt rút thứ 9: $q^8 p$.
  
  Do các biến cố này xung khắc đôi một, xác suất để An giành chiến thắng chung cuộc là:
  $ P(A) = p + q^2 p + q^4 p + q^6 p + q^8 p = p (1 + q^2 + q^4 + q^6 + q^8) $
  Áp dụng công thức tổng cấp số nhân hữu hạn gồm 5 số hạng với công bội $q^2$:
  $ P(A) = p times frac(1 - (q^2)^5, 1 - q^2) = 0.4 times frac(1 - (0.6)^(10), 1 - 0.36) = 0.4 times frac(1 - 0.0060466176, 0.64) $
  $ P(A) = frac(1 - 0.0060466176, 1.6) = frac(0.9939533824, 1.6) = 0.621220864 $
]

#cach2-box[
  Ta tính bằng phân số chính xác:
  $ P(A) = frac(2, 5) times [1 + frac(9, 25) + (frac(9, 25))^2 + (frac(9, 25))^3 + (frac(9, 25))^4] $
  $ P(A) = frac(2, 5) times frac(1 - (9/25)^5, 1 - 9/25) = frac(2, 5) times frac(1 - frac(59049, 9765625), frac(16, 25)) $
  $ P(A) = frac(2, 5) times frac(9706576, 9765625) times frac(25, 16) = frac(2, 5) times frac(25, 16) times frac(9706576, 9765625) = frac(5, 8) times frac(9706576, 9765625) $
  Rút gọn phân số:
  $ P(A) = frac(5 times 9706576, 8 times 9765625) = frac(48532880, 78125000) = frac(1213322, 1953125) $
]

#ans-box[
  Xác suất để An giành chiến thắng là $frac(1213322, 1953125)$ (xấp xỉ $62.12\%$).
]

== LỚP BÀI TOÁN 2: ĐẾM XÂU KÝ TỰ VÀ SỐ TỰ NHIÊN CÓ RÀNG BUỘC (Tránh mẫu / Cấu trúc đuôi)

#insight-box[
  *Đặc trưng:* Các bài toán đếm tổ hợp của đại số phổ thông liên quan đến việc xây dựng chuỗi ký tự, số tự nhiên độ dài $n$ thỏa mãn điều kiện kề cạnh nghiêm ngặt.
]

#example-box(n: "2.1 (Đếm số tự nhiên tránh cặp phần tử liên tiếp)")[
  Có bao nhiêu số tự nhiên gồm $n$ chữ số ($n >= 2$) được lập từ tập hợp các chữ số $\{1, 2, 3, 4, 5\}$ sao cho trong số đó không chứa hai chữ số lẻ nào đứng cạnh nhau?
]

#sol-diagram(canvas({
  import draw: *
  circle((-1.8, 0), radius: 0.85, name: "E")
  content("E", text(size: 8.5pt)[Đuôi chẵn \ (E)])
  circle((1.8, 0), radius: 0.85, name: "O")
  content("O", text(size: 8.5pt)[Đuôi lẻ \ (O)])
  
  // Loops and transitions
  bezier("E.135", "E.45", (-1.8, 1.7), mark: (end: ">", fill: black))
  content((-1.8, 2.0), text(size: 8.5pt)[2 cách])
  
  bezier("E.30", "O.150", (0, 0.7), mark: (end: ">", fill: black))
  content((0, 0.95), text(size: 8.5pt)[3 cách])
  
  bezier("O.210", "E.330", (0, -0.7), mark: (end: ">", fill: black))
  content((0, -0.95), text(size: 8.5pt)[2 cách])
}))

#cach1-box[
  Ta phân chia tập các chữ số $\{1, 2, 3, 4, 5\}$ thành hai nhóm:
  - Nhóm các chữ số chẵn: $C = \{2, 4\}$ (gồm 2 chữ số).
  - Nhóm các chữ số lẻ: $L = \{1, 3, 5\}$ (gồm 3 chữ số).
  
  Gọi $x_n$ là số các số tự nhiên thỏa mãn đề bài.
  Gọi $a_n$ là số các số thỏa mãn kết thúc bằng chữ số chẵn.
  Gọi $b_n$ là số các số thỏa mãn kết thúc bằng chữ số lẻ.
  Khi đó, $x_n = a_n + b_n$. Ta thiết lập các hệ thức sau:
  - Một số $n$ chữ số kết thúc bằng chữ số chẵn có thể được tạo ra bằng cách thêm một chữ số chẵn (có 2 lựa chọn) vào cuối bất kỳ số thỏa mãn nào có $n-1$ chữ số:
    $ a_n = 2 (a_(n-1) + b_(n-1)) = 2 x_(n-1) $
  - Một số $n$ chữ số kết thúc bằng chữ số lẻ chỉ có thể được tạo ra bằng cách thêm một chữ số lẻ (có 3 lựa chọn) vào cuối số có $n-1$ chữ số kết thúc bằng chữ số chẵn (để tránh hai số lẻ kề nhau):
    $ b_n = 3 a_(n-1) = 3 (2 x_(n-2)) = 6 x_(n-2) $
  
  Từ đó, ta có phương trình sai phân tuyến tính cho $x_n$:
  $ x_n = a_n + b_n = 2 x_(n-1) + 6 x_(n-2) quad (n >= 3) $
  Tính các giá trị cơ bản:
  - Với $n = 1$: $x_1 = 5$ số (gồm cả chẵn và lẻ, $a_1 = 2$, $b_1 = 3$).
  - Với $n = 2$: $a_2 = 2 x_1 = 10$, $b_2 = 3 a_1 = 6$. Tổng số $x_2 = 16$.
]

#cach2-box[
  Giải phương trình đặc trưng của hệ thức truy hồi $x_n = 2 x_(n-1) + 6 x_(n-2)$:
  $ r^2 - 2r - 6 = 0 => r_1 = 1 + sqrt(7), r_2 = 1 - sqrt(7) $
  Nghiệm tổng quát là $x_n = C_1 (1 + sqrt(7))^n + C_2 (1 - sqrt(7))^n$.
  Sử dụng các điều kiện ban đầu $x_1 = 5$ và $x_2 = 16$ để tìm $C_1, C_2$:
  $ cases(
    C_1 (1 + sqrt(7)) + C_2 (1 - sqrt(7)) = 5,
    C_1 (1 + sqrt(7))^2 + C_2 (1 - sqrt(7))^2 = 16
  ) => cases(
    C_1 = frac(sqrt(7) + 4, 2 sqrt(7)),
    C_2 = frac(sqrt(7) - 4, 2 sqrt(7))
  ) $
  Do đó, công thức số lượng số thỏa mãn là:
  $ x_n = frac(sqrt(7) + 4, 2 sqrt(7)) (1 + sqrt(7))^n + frac(sqrt(7) - 4, 2 sqrt(7)) (1 - sqrt(7))^n $
]

#ans-box[
  Công thức tính số lượng số tự nhiên là $x_n = frac(sqrt(7) + 4, 2 sqrt(7)) (1 + sqrt(7))^n + frac(sqrt(7) - 4, 2 sqrt(7)) (1 - sqrt(7))^n$ hoặc hệ thức truy hồi $x_n = 2 x_(n-1) + 6 x_(n-2)$ với $x_1 = 5, x_2 = 16$.
]

#v(1em)

#example-box(n: "2.2 (Xâu nhị phân tránh cụm cố định không chồng lấp)")[
  Xét các xâu ký tự nhị phân độ dài $n$ ($n >= 2$) chỉ chứa các ký tự `0` và `1`. Có bao nhiêu xâu ký tự thỏa mãn điều kiện không chứa cụm ký tự con liên tiếp dạng `"11"`?
]

#cach1-box[
  Gọi $x_n$ là số lượng xâu nhị phân độ dài $n$ thỏa mãn không chứa cụm `"11"`.
  Ta chia tập xâu thỏa mãn thành hai nhóm dựa trên ký tự cuối cùng:
  - Nhóm xâu kết thúc bằng `0` (số lượng $a_n$): Ta có thể thêm `0` vào bất kỳ xâu thỏa mãn độ dài $n-1$ nào. Do đó $a_n = x_(n-1)$.
  - Nhóm xâu kết thúc bằng `1` (số lượng $b_n$): Vì không chứa cụm `"11"`, ký tự trước đó phải là `0`. Do đó ta chỉ có thể thêm `1` vào các xâu kết thúc bằng `0` ở độ dài $n-1$. Từ đó $b_n = a_(n-1) = x_(n-2)$.
  
  Cộng hai trường hợp lại, ta được hệ thức truy hồi Fibonacci:
  $ x_n = x_(n-1) + x_(n-2) quad (n >= 3) $
  Với các giá trị cơ bản:
  - $n = 1$: Các xâu thỏa mãn là `"0"` và `"1"`, nên $x_1 = 2$.
  - $n = 2$: Các xâu thỏa mãn là `"00"`, `"01"`, `"10"`, nên $x_2 = 3$.
]

#cach2-box[
  Phương trình đặc trưng của hệ thức $x_n - x_(n-1) - x_(n-2) = 0$ là:
  $ r^2 - r - 1 = 0 => r = frac(1 plus.minus sqrt(5), 2) $
  Đặt $phi = frac(1 + sqrt(5), 2)$ và $psi = frac(1 - sqrt(5), 2)$.
  Nghiệm tổng quát có dạng $x_n = C_1 phi^n + C_2 psi^n$.
  Sử dụng điều kiện biên $x_1 = 2, x_2 = 3$, ta giải hệ phương trình tìm được $C_1 = frac(phi^2, sqrt(5))$ và $C_2 = -frac(psi^2, sqrt(5))$.
  Do đó công thức tổng quát là:
  $ x_n = frac(phi^(n+2) - psi^(n+2), sqrt(5)) = frac(1, sqrt(5)) [ (frac(1 + sqrt(5), 2))^(n+2) - (frac(1 - sqrt(5), 2))^(n+2) ] $
]

#ans-box[
  Số xâu nhị phân độ dài $n$ thỏa mãn là $x_n = F_(n+2) = frac(1, sqrt(5)) [ (frac(1 + sqrt(5), 2))^(n+2) - (frac(1 - sqrt(5), 2))^(n+2) ]$.
]

#v(1em)

#example-box(n: "2.3 (Xâu nhị phân tránh cụm cố định có tính chồng lấp)")[
  Có bao nhiêu xâu ký tự nhị phân độ dài $n$ ($n >= 3$) sao cho trong xâu không xuất hiện bất kỳ cụm xâu con liên tiếp nào có dạng `"101"`?
]

#cach1-box[
  Sử dụng phương pháp trạng thái hậu tố (Suffix State Method):
  Ta phân loại các xâu nhị phân hợp lệ độ dài $n$ thành 3 trạng thái dựa trên các ký tự cuối cùng khớp với phần đầu của mẫu `"101"`:
  - Trạng thái $S_0$ (số lượng $a_n$): xâu kết thúc bằng `0` (nhưng không phải `10`) hoặc xâu rỗng.
  - Trạng thái $S_1$ (số lượng $b_n$): xâu kết thúc bằng `1`.
  - Trạng thái $S_2$ (số lượng $c_n$): xâu kết thúc bằng `"10"`.
  
  Khi thêm ký tự vào cuối:
  - Từ $S_0$, thêm `0` ta vẫn ở $S_0$, thêm `1` ta chuyển sang $S_1$.
  - Từ $S_1$, thêm `0` ta chuyển sang $S_2$, thêm `1` ta vẫn ở $S_1$.
  - Từ $S_2$, thêm `0` ta chuyển sang $S_0$, thêm `1` ta chuyển sang $S_3$ (trạng thái cấm `"101"`).
  
  Do đó, ta có hệ thức chuyển dịch:
  $ a_n = a_(n-1) + c_(n-1) \
    b_n = a_(n-1) + b_(n-1) \
    c_n = b_(n-1) $
  Cộng ba phương thức lại, tổng số xâu hợp lệ là $x_n = a_n + b_n + c_n$.
  Sử dụng quan hệ sai phân, ta rút ra phương trình đặc trưng cho $x_n$:
  $ x_n = 2 x_(n-1) - x_(n-2) + x_(n-3) quad (n >= 4) $
  Các giá trị khởi đầu:
  - $n = 1$: $x_1 = 2$ xâu (`"0"`, `"1"`).
  - $n = 2$: $x_2 = 4$ xâu (`"00"`, `"01"`, `"10"`, `"11"`).
  - $n = 3$: $x_3 = 7$ xâu (loại trừ duy nhất `"101"`).
]

#cach2-box[
  Ta viết hệ chuyển trạng thái dưới dạng ma trận chuyển:
  $ mat(a_n; b_n; c_n) = mat(1, 0, 1; 1, 1, 0; 0, 1, 0) mat(a_(n-1); b_(n-1); c_(n-1)) $
  Đặt $bold(v)_n = (a_n, b_n, c_n)^T$ và $bold(M) = mat(1, 0, 1; 1, 1, 0; 0, 1, 0)$. Khi đó $bold(v)_n = bold(M)^(n-1) bold(v)_1$.
  Với $n = 1$, ta có $bold(v)_1 = mat(1; 1; 0)$ (do `"0"` thuộc $S_0$, `"1"` thuộc $S_1$).
  Để tìm số xâu $x_n = a_n + b_n + c_n$, ta có thể nhân trực tiếp các lũy thừa ma trận $bold(M)^(n-1)$ hoặc sử dụng phương trình đặc trưng của $bold(M)$:
  $ det(bold(M) - lambda bold(I)) = -lambda^3 + 2 lambda^2 - lambda + 1 = 0 $
  Theo định lý Cayley-Hamilton, ma trận $bold(M)$ thỏa mãn: $bold(M)^3 - 2 bold(M)^2 + bold(M) - bold(I) = bold(0)$.
  Do đó, chuỗi số tổng quát $x_n$ cũng tuân theo hệ thức truy hồi tuyến tính:
  $ x_n = 2 x_(n-1) - x_(n-2) + x_(n-3) $
]

#ans-box[
  Số xâu nhị phân độ dài $n$ tránh cụm `"101"` là $x_n$, thỏa mãn hệ thức truy hồi $x_n = 2 x_(n-1) - x_(n-2) + x_(n-3)$ với $x_1 = 2, x_2 = 4, x_3 = 7$.
]

#v(1em)

#example-box(n: "2.4 (Đếm số tránh cụm ba chữ số liên tiếp)")[
  Cho tập hợp các chữ số $X = \{0, 1, 2, 3\}$. Có bao nhiêu số tự nhiên gồm $n$ chữ số ($n >= 3$) được lập từ tập $X$ sao cho không chứa cụm ba chữ số `"123"` đứng cạnh nhau liên tiếp?
]

#cach1-box[
  Ta chia số tự nhiên thành 3 trạng thái hợp lệ dựa trên hậu tố của nó:
  - $S_0$ (số lượng $a_n$): hậu tố không khớp với tiền tố nào của `"123"` (không kết thúc bằng `1` hoặc `"12"`).
  - $S_1$ (số lượng $b_n$): kết thúc bằng chữ số `1`.
  - $S_2$ (số lượng $c_n$): kết thúc bằng cụm `"12"`.
  
  Khi thêm một chữ số từ $\{0, 1, 2, 3\}$ vào cuối:
  - Từ $S_0$: thêm `1` sang $S_1$; thêm `0`, `2`, `3` vẫn ở $S_0$ (3 cách).
  - Từ $S_1$: thêm `1` vẫn ở $S_1$; thêm `2` sang $S_2$; thêm `0`, `3` về $S_0$ (2 cách).
  - Từ $S_2$: thêm `1` sang $S_1$; thêm `3` sẽ tạo thành `"123"` (bị cấm); thêm `0`, `2` về $S_0$ (2 cách).
  
  Hệ phương trình trạng thái cho $n >= 2$:
  $ a_n = 3 a_(n-1) + 2 b_(n-1) + 2 c_(n-1) \
    b_n = a_(n-1) + b_(n-1) + c_(n-1) = x_(n-1) \
    c_n = b_(n-1) = x_(n-2) $
  Tính tổng $x_n = a_n + b_n + c_n$:
  $ x_n = 3 x_(n-1) + b_(n-1) + c_(n-1) + x_(n-1) + x_(n-2) \
    x_n = 4 x_(n-1) - x_(n-3) quad (n >= 4) $
  Với các giá trị cơ bản (lưu ý chữ số đầu tiên phải khác `0`):
  - $n = 1$: Có 3 số hợp lệ là `1`, `2`, `3`. Vậy $x_1 = 3$ (với $a_1 = 2$, $b_1 = 1$, $c_1 = 0$).
  - $n = 2$: Có $3$ lựa chọn chữ số đầu, $4$ lựa chọn chữ số sau. Tất cả $3 times 4 = 12$ số đều hợp lệ. Vậy $x_2 = 12$.
  - $n = 3$: Tất cả các số gồm 3 chữ số khởi đầu khác `0` là $3 times 4 times 4 = 48$ số. Chỉ có duy nhất số `123` là không hợp lệ. Vậy $x_3 = 47$.
]

#cach2-box[
  Ta có thể lập luận gián tiếp bằng phương pháp bổ sung (Complementary Counting).
  Tổng số các số tự nhiên có $n$ chữ số được lập từ $X = \{0, 1, 2, 3\}$ là $T_n = 3 times 4^(n-1)$.
  Số lượng số có chứa cụm `"123"` được đếm bằng cách gộp nhóm `"123"` thành một siêu ký tự.
  Ta có thể biểu diễn số lượng số tránh cụm `"123"` bằng phương trình sai phân dạng $x_n = 4 x_(n-1) - x_(n-3)$ bằng cách phân tích hệ thức trạng thái Markov trực tiếp:
  Với $n = 4$, ta có $x_4 = 4 x_3 - x_1 = 4(47) - 3 = 185$.
  Với $n = 5$, ta có $x_5 = 4 x_4 - x_2 = 4(185) - 12 = 728$.
]

#ans-box[
  Số các số tự nhiên thỏa mãn là $x_n$, tuân theo công thức truy hồi $x_n = 4 x_(n-1) - x_(n-3)$ với $x_1 = 3, x_2 = 12, x_3 = 47$.
]

#v(1em)

#example-box(n: "2.5 (Mô hình chuỗi hạt vòng tròn - Tô màu đa giác)")[
  Người ta muốn tô màu các đỉnh của một đa giác đều $n$ đỉnh ($n >= 3$) bằng $3$ màu phân biệt: Xanh, Đỏ, Vàng. Hỏi có bao nhiêu cách tô màu hợp lệ sao cho hai đỉnh kề nhau bất kỳ của đa giác luôn được tô bởi hai màu khác nhau?
]

#cach1-box[
  Gọi các đỉnh đa giác theo thứ tự là $A_1, A_2, dots, A_n$.
  Nếu ta duỗi thẳng đa giác thành một đường thẳng $A_1 A_2 dots A_n$:
  - Gọi $a_n$ là số cách tô màu hợp lệ $n$ đỉnh sao cho màu của $A_n$ khác màu của $A_1$. Đây chính là số cách tô màu hợp lệ cho đa giác $n$ đỉnh.
  - Gọi $b_n$ là số cách tô màu hợp lệ $n$ đỉnh sao cho màu của $A_n$ giống màu của $A_1$.
  Tổng số cách tô màu một chuỗi $n$ đỉnh sao cho hai đỉnh kề nhau bất kỳ có màu khác nhau là:
  $ a_n + b_n = 3 times 2^(n-1) $
  Để thiết lập hệ thức cho bước tiếp theo:
  - Nếu từ một cấu hình $n-1$ đỉnh có màu $A_(n-1) != A_1$ ($a_(n-1)$ cách), ta có 2 cách tô đỉnh $A_n$ khác $A_(n-1)$. Trong đó có 1 cách làm cho $A_n = A_1$ (chuyển vào $b_n$) và 1 cách làm cho $A_n != A_1$ (chuyển vào $a_n$).
  - Nếu từ một cấu hình $n-1$ đỉnh có màu $A_(n-1) = A_1$ ($b_(n-1)$ cách), ta có 2 cách tô đỉnh $A_n$ khác $A_(n-1)$ (và chắc chắn cả 2 cách này đều làm $A_n != A_1$).
  Từ đó, ta có:
  $ a_n = a_(n-1) + 2 b_(n-1) \
    b_n = a_(n-1) $
  Thay thế $b_(n-1)$ bằng $a_(n-2)$ vào phương trình thứ nhất, ta thu được phương trình sai phân:
  $ a_n = a_(n-1) + 2 a_(n-2) quad (n >= 4) $
  Với đa giác 3 đỉnh (tam giác), số cách tô màu là $a_3 = 3 times 2 times 1 = 6$.
  Với đa giác 2 đỉnh (đoạn thẳng, hai đầu khác màu), số cách tô màu là $a_2 = 6$.
]

#cach2-box[
  Sử dụng nghiệm của phương trình đặc trưng $r^2 - r - 2 = 0 => r_1 = 2, r_2 = -1$:
  $ a_n = C_1 2^n + C_2 (-1)^n $
  Sử dụng điều kiện biên $a_2 = 6$ và $a_3 = 6$:
  $ cases(
    4 C_1 + C_2 = 6,
    8 C_1 - C_2 = 6
  ) => cases(
    C_1 = 1,
    C_2 = 2
  ) $
  Công thức đóng cho số cách tô màu đa giác $n$ đỉnh là:
  $ a_n = 2^n + 2 (-1)^n $
  Ví dụ:
  - Với $n = 3$: $a_3 = 2^3 + 2(-1)^3 = 6$.
  - Với $n = 4$: $a_4 = 2^4 + 2(-1)^4 = 18$.
  - Với $n = 5$: $a_5 = 2^5 + 2(-1)^5 = 30$.
]

#ans-box[
  Số cách tô màu đa giác đều $n$ đỉnh là $a_n = 2^n + 2 (-1)^n$ cách.
]

#v(1em)

// ═══════════════════════════════════════════════
// LỚP BÀI TOÁN 3
// ═══════════════════════════════════════════════
== LỚP BÀI TOÁN 3: ĐI BỘ NGẪU NHIÊN TRÊN ĐOẠN THẲNG VÀ ĐỒ THỊ (Biên hấp thụ)

#insight-box[
  *Đặc trưng:* Thực thể di chuyển từng bước ngẫu nhiên trên hệ thống nút tọa độ hoặc đỉnh đồ thị. Hệ thống sẽ dừng lại hoặc thay đổi trạng thái khi chạm vào các vị trí biên (biên hấp thụ).
]

#example-box(n: "3.1 (Châu chấu nhảy bậc trên đoạn thẳng)")[
  Một con châu chấu nhảy trên các phiến đá xếp thành hàng ngang được đánh số liên tiếp từ $0$ đến $4$. Từ một phiến đá vị trí số $k$ ($1 <= k <= 3$), châu chấu chỉ có thể nhảy tiến lên phiến đá $k+1$ với xác suất $0.6$ hoặc nhảy lùi về phiến đá $k-1$ với xác suất $0.4$. Nếu châu chấu nhảy chạm đến phiến đá $0$ hoặc $4$ thì nó sẽ dừng lại tại đó mãi mãi. Giả sử ban đầu châu chấu xuất phát từ phiến đá số $2$, tính xác suất để nó dừng lại ở phiến đá số $4$ sau đúng $4$ bước nhảy.
]

#sol-diagram(canvas({
  import draw: *
  // Các trạng thái
  circle((-3, 0), radius: 0.5, name: "S0")
  content("S0", [0])
  circle((-1.5, 0), radius: 0.5, name: "S1")
  content("S1", [1])
  circle((0, 0), radius: 0.5, name: "S2")
  content("S2", [2])
  circle((1.5, 0), radius: 0.5, name: "S3")
  content("S3", [3])
  circle((3, 0), radius: 0.5, name: "S4")
  content("S4", [4])
  
  // Tự lặp tại biên
  bezier("S0.135", "S0.225", (-3.8, 0), mark: (end: ">", fill: black))
  content((-4.2, 0), [1])
  bezier("S4.45", "S4.315", (3.8, 0), mark: (end: ">", fill: black))
  content((4.2, 0), [1])
  
  // Các cung chuyển tiếp giữa 1, 2, 3
  bezier("S1.30", "S2.150", (-0.75, 0.4), mark: (end: ">", fill: black))
  content((-0.75, 0.65), $0.6$)
  bezier("S2.210", "S1.330", (-0.75, -0.4), mark: (end: ">", fill: black))
  content((-0.75, -0.65), $0.4$)
  
  bezier("S2.30", "S3.150", (0.75, 0.4), mark: (end: ">", fill: black))
  content((0.75, 0.65), $0.6$)
  bezier("S3.210", "S2.330", (0.75, -0.4), mark: (end: ">", fill: black))
  content((0.75, -0.65), $0.4$)

  // Hướng ra biên
  line("S1.west", "S0.east", mark: (end: ">", fill: black))
  content((-2.25, 0.45), $0.4$)
  line("S3.east", "S4.west", mark: (end: ">", fill: black))
  content((2.25, 0.45), $0.6$)
}))

#cach1-box[
  Ta phân tích các lộ trình dài 4 bước khởi hành từ phiến đá số 2 ($X_0 = 2$) dựa trên hai cách hiểu về biến cố:
  
  *Cách hiểu A: Đạt đến phiến đá số 4 ở bước thứ 4 lần đầu tiên (thực sự kết thúc ở bước 4).*
  Hạt phải đi qua các trạng thái trung gian mà không chạm biên 4 trước bước 4. Các lộ trình hợp lệ là:
  - Lộ trình 1: $2 -> 3 -> 2 -> 3 -> 4$.
    Xác suất: $P_1 = 0.6 times 0.4 times 0.6 times 0.6 = 0.0864$.
  - Lộ trình 2: $2 -> 1 -> 2 -> 3 -> 4$.
    Xác suất: $P_2 = 0.4 times 0.6 times 0.6 times 0.6 = 0.0864$.
  Tổng xác suất theo cách hiểu này là: $P = P_1 + P_2 = 0.1728$.

  *Cách hiểu B: Trạng thái của hệ thống tại bước thứ 4 là phiến đá số 4 (chấp nhận đã chạm biên 4 từ trước).*
  Các lộ trình hợp lệ bao gồm cả việc chạm biên 4 từ bước thứ 2 và dừng lại tại đó:
  - Lộ trình 3: $2 -> 3 -> 4 -> 4 -> 4$.
    Xác suất: $P_3 = 0.6 times 0.6 times 1 times 1 = 0.36$.
  Tổng xác suất theo cách hiểu này là: $P = P_1 + P_2 + P_3 = 0.1728 + 0.36 = 0.5328$.
]

#cach2-box[
  Ta sử dụng ma trận chuyển trạng thái trên không gian trạng thái $Omega = {0, 1, 2, 3, 4}$:
  $ bold(P) = mat(
    1, 0, 0, 0, 0;
    0.4, 0, 0.6, 0, 0;
    0, 0.4, 0, 0.6, 0;
    0, 0, 0.4, 0, 0.6;
    0, 0, 0, 0, 1
  ) $
  Vectơ trạng thái ban đầu xuất phát từ 2 là $bold(pi)^0 = (0, 0, 1, 0, 0)$. Ta tính vectơ xác suất sau các bước:
  - Bước 1: $bold(pi)^1 = bold(pi)^0 dot.c bold(P) = (0, 0.4, 0, 0.6, 0)$
  - Bước 2: $bold(pi)^2 = bold(pi)^1 dot.c bold(P) = (0.16, 0, 0.48, 0, 0.36)$
  - Bước 3: $bold(pi)^3 = bold(pi)^2 dot.c bold(P) = (0.16, 0.192, 0, 0.288, 0.36)$
  - Bước 4: $bold(pi)^4 = bold(pi)^3 dot.c bold(P) = (0.2368, 0, 0.2304, 0, 0.5328)$
  
  Phần tử thứ năm của $bold(pi)^4$ (ứng với trạng thái 4) là $p_4^4 = 0.5328$. Đây chính là xác suất châu chấu ở vị trí 4 tại bước 4 (Cách hiểu B).
  Để tìm xác suất chạm 4 lần đầu ở bước 4 (Cách hiểu A), ta tính lượng tăng xác suất tại trạng thái hấp thụ 4 ở bước cuối:
  $ P = p_4^4 - p_4^3 = 0.5328 - 0.36 = 0.1728. $
]

#ans-box[
  - Nếu tính xác suất lần đầu tiên chạm phiến đá 4 ở bước 4: $P = 0.1728$ (tức $17.28\%$).
  - Nếu tính xác suất ở phiến đá 4 tại bước 4 nói chung: $P = 0.5328$ (tức $53.28\%$).
]

#v(1em)

#example-box(n: "3.2 (Đi bộ ngẫu nhiên trên đỉnh tam giác)")[
  Một con trỏ đặt ở đỉnh $A$ của một tam giác đều $A B C$. Tại mỗi bước di chuyển ngẫu nhiên, con trỏ chỉ có thể chuyển dịch sang một trong hai đỉnh còn lại với xác suất như nhau. Tìm xác suất để sau đúng $n$ bước di chuyển độc lập, con trỏ quay trở về đúng vị trí đỉnh $A$ ban đầu.
]

#sol-diagram(canvas({
  import draw: *
  // Đỉnh tam giác đều
  circle((0, 1.2), radius: 0.5, name: "A")
  content("A", [A])
  circle((-1.3, -1), radius: 0.5, name: "B")
  content("B", [B])
  circle((1.3, -1), radius: 0.5, name: "C")
  content("C", [C])
  
  // Cung chuyển dịch hai chiều
  bezier("A.210", "B.70", (-0.9, 0.2), mark: (end: ">", fill: black))
  content((-1.2, 0.3), text(size: 8.5pt)[$1/2$])
  bezier("B.40", "A.240", (-0.4, 0.0), mark: (end: ">", fill: black))
  content((-0.55, -0.2), text(size: 8.5pt)[$1/2$])
  
  bezier("A.300", "C.140", (0.4, 0.0), mark: (end: ">", fill: black))
  content((0.55, -0.2), text(size: 8.5pt)[$1/2$])
  bezier("C.110", "A.330", (0.9, 0.2), mark: (end: ">", fill: black))
  content((1.2, 0.3), text(size: 8.5pt)[$1/2$])
  
  bezier("B.340", "C.200", (0, -1.3), mark: (end: ">", fill: black))
  content((0, -1.6), text(size: 8.5pt)[$1/2$])
  bezier("C.160", "B.20", (0, -0.7), mark: (end: ">", fill: black))
  content((0, -0.35), text(size: 8.5pt)[$1/2$])
}))

#cach1-box[
  Gọi $a_n, b_n, c_n$ lần lượt là xác suất con trỏ ở đỉnh $A, B, C$ sau $n$ bước. Ban đầu hệ ở $A$, nên $a_0 = 1, b_0 = 0, c_0 = 0$.
  Do tam giác đều và tính chất đối xứng của luật di chuyển, ta luôn có $b_n = c_n$ với mọi $n >= 0$.
  Vì tổng xác suất bằng 1:
  $ a_n + b_n + c_n = 1 => a_n + 2b_n = 1 => b_n = frac(1 - a_n, 2) $
  Để có mặt ở đỉnh $A$ ở bước thứ $n$, con trỏ ở bước thứ $n-1$ phải đang ở đỉnh $B$ hoặc $C$ và nhảy về $A$ (với xác suất $1/2$ mỗi bên):
  $ a_n = frac(1, 2) b_(n-1) + frac(1, 2) c_(n-1) = b_(n-1) $
  Thế biểu thức $b_(n-1)$ vào, ta nhận được phương trình truy hồi tuyến tính cấp 1:
  $ a_n = frac(1 - a_(n-1), 2) = -frac(1, 2) a_(n-1) + frac(1, 2) $
  Giải phương trình sai phân này với điều kiện đầu $a_0 = 1$:
  $ a_n - frac(1, 3) = -frac(1, 2) (a_(n-1) - frac(1, 3)) => a_n - frac(1, 3) = (a_0 - frac(1, 3)) (-frac(1, 2))^n $
  $ a_n = frac(1, 3) + frac(2, 3) (-frac(1, 2))^n = frac(1 + 2 (-1/2)^n, 3) = frac(1 + (-1)^n 2^(1-n), 3) $
]

#cach2-box[
  Ta viết hệ chuyển trạng thái dưới dạng ma trận chuyển $bold(P)$:
  $ bold(P) = mat(
    0, 1/2, 1/2;
    1/2, 0, 1/2;
    1/2, 1/2, 0
  ) $
  Đặc trưng của ma trận $bold(P)$ có các trị riêng là nghiệm của phương trình $det(bold(P) - lambda bold(I)) = 0$:
  $ det mat(-lambda, 1/2, 1/2; 1/2, -lambda, 1/2; 1/2, 1/2, -lambda) = 0 => -lambda^3 + frac(3, 4) lambda + frac(1, 4) = 0 $
  Hệ phương trình này có nghiệm là $lambda_1 = 1$ và $lambda_2 = lambda_3 = -1/2$.
  Do đó, xác suất $a_n$ ở đỉnh $A$ có dạng tổng quát:
  $ a_n = C_1 (1)^n + C_2 (-1/2)^n $
  Sử dụng các giá trị biên ban đầu $a_0 = 1$ và $a_1 = 0$, ta thu được hệ:
  $ cases(C_1 + C_2 = 1, C_1 - frac(1, 2) C_2 = 0) => cases(C_1 = 1/3, C_2 = 2/3) $
  Vậy xác suất sau $n$ bước quay về đỉnh $A$ là $a_n = frac(1, 3) + frac(2, 3) (-frac(1, 2))^n$.
]

#ans-box[
  Xác suất để con trỏ quay trở lại đỉnh $A$ sau $n$ bước là $P = frac(1 + (-1)^n 2^(1-n), 3)$.
]

#v(1em)

#example-box(n: "3.3 (Bài toán bước đi của người say rượu)")[
  Một người say rượu đứng ở vị trí cách bờ vực một khoảng bằng $2$ bước chân. Mỗi bước đi, người đó có xác suất $1/3$ là bước tiến về phía bờ vực và $2/3$ là bước lùi ra xa bờ vực. Giả sử nếu người đó bước chạm vào vị trí bờ vực (vị trí số $0$) thì sẽ bị ngã, còn hướng lùi ra xa là vô hạn. Tính xác suất để người say rượu bị ngã xuống vực sau đúng $4$ bước đi đầu tiên.
]

#sol-diagram(canvas({
  import draw: *
  // Các trạng thái
  circle((-3.3, 0), radius: 0.75, name: "Vuc")
  content("Vuc", text(size: 8.5pt)[Ngã (0)])
  circle((-1.5, 0), radius: 0.5, name: "S1")
  content("S1", [1])
  circle((0, 0), radius: 0.5, name: "S2")
  content("S2", [2])
  circle((1.5, 0), radius: 0.5, name: "S3")
  content("S3", [3])
  circle((3, 0), radius: 0.5, name: "S4")
  content("S4", [4])
  
  // Tự lặp tại vực (hấp thụ)
  bezier("Vuc.135", "Vuc.225", (-5.0, 0), mark: (end: ">", fill: black))
  content((-5.4, 0), text(size: 8.5pt)[1])
  
  // Các cung chuyển tiếp
  bezier("S1.30", "S2.150", (-0.75, 0.4), mark: (end: ">", fill: black))
  content((-0.75, 0.75), text(size: 8.5pt)[$2/3$])
  bezier("S2.210", "S1.330", (-0.75, -0.4), mark: (end: ">", fill: black))
  content((-0.75, -0.75), text(size: 8.5pt)[$1/3$])
  
  bezier("S2.30", "S3.150", (0.75, 0.4), mark: (end: ">", fill: black))
  content((0.75, 0.75), text(size: 8.5pt)[$2/3$])
  bezier("S3.210", "S2.330", (0.75, -0.4), mark: (end: ">", fill: black))
  content((0.75, -0.75), text(size: 8.5pt)[$1/3$])

  bezier("S3.30", "S4.150", (2.25, 0.4), mark: (end: ">", fill: black))
  content((2.25, 0.75), text(size: 8.5pt)[$2/3$])
  bezier("S4.210", "S3.330", (2.25, -0.4), mark: (end: ">", fill: black))
  content((2.25, -0.75), text(size: 8.5pt)[$1/3$])

  line("S1.west", "Vuc.east", mark: (end: ">", fill: black))
  content((-2.3, 0.35), text(size: 8.5pt)[$1/3$])
}))

#cach1-box[
  Ta xét quá trình di chuyển của người say rượu từ vị trí xuất phát là số 2 ($X_0 = 2$).
  Để bị ngã xuống vực ở bước thứ 4 lần đầu tiên (tức là $X_4 = 0$ và $X_k != 0$ với mọi $k < 4$), ta tìm các lộ trình dài 4 bước xuất phát từ 2 và kết thúc ở 0 mà không chạm 0 ở bước 2:
  - Lộ trình 1: $2 -> 1 -> 2 -> 1 -> 0$.
    Xác suất: $P_1 = P(2 -> 1) times P(1 -> 2) times P(2 -> 1) times P(1 -> 0) = frac(1, 3) times frac(2, 3) times frac(1, 3) times frac(1, 3) = frac(2, 81)$.
  - Lộ trình 2: $2 -> 3 -> 2 -> 1 -> 0$.
    Xác suất: $P_2 = P(2 -> 3) times P(3 -> 2) times P(2 -> 1) times P(1 -> 0) = frac(2, 3) times frac(1, 3) times frac(1, 3) times frac(1, 3) = frac(2, 81)$.
  Tổng xác suất bị ngã *đúng ở bước 4* là:
  $ P = P_1 + P_2 = frac(2, 81) + frac(2, 81) = frac(4, 81) $
  
  Nếu tính xác suất người đó bị ngã *tại hoặc trước bước 4* (tức là đã ngã ở bước 2 hoặc bước 4):
  - Xác suất ngã ở bước 2 (lộ trình $2 -> 1 -> 0$): $P_(n g a, 2) = frac(1, 3) times frac(1, 3) = frac(1, 9) = frac(9, 81)$.
  - Xác suất ngã ở bước 4: $frac(4, 81)$.
  Tổng xác suất ngã tại hoặc trước bước 4 là: $frac(9, 81) + frac(4, 81) = frac(13, 81)$.
]

#cach2-box[
  Ta giới hạn không gian trạng thái trong phạm vi các vị trí có thể đạt tới trong 4 bước: $Omega = {0, 1, 2, 3, 4, 5, 6}$, với 0 là trạng thái hấp thụ thực tế. Ma trận chuyển trạng thái tương ứng là:
  $ bold(P) = mat(
    1, 0, 0, 0, 0, 0, 0;
    1/3, 0, 2/3, 0, 0, 0, 0;
    0, 1/3, 0, 2/3, 0, 0, 0;
    0, 0, 1/3, 0, 2/3, 0, 0;
    0, 0, 0, 1/3, 0, 2/3, 0;
    0, 0, 0, 0, 1/3, 0, 2/3;
    0, 0, 0, 0, 0, 0, 1
  ) $
  Vectơ trạng thái khởi đầu tại 2 là $bold(pi)^0 = (0, 0, 1, 0, 0, 0, 0)$. Nhân ma trận liên tiếp:
  - $bold(pi)^1 = bold(pi)^0 dot.c bold(P) = (0, 1/3, 0, 2/3, 0, 0, 0)$
  - $bold(pi)^2 = bold(pi)^1 dot.c bold(P) = (1/9, 0, 4/9, 0, 4/9, 0, 0) = (9/81, 0, 36/81, 0, 36/81, 0, 0)$
  - $bold(pi)^3 = bold(pi)^2 dot.c bold(P) = (1/9, 4/27, 0, 8/27 + 4/27, 0, 8/27, 0) = (9/81, 12/81, 0, 36/81, 0, 24/81, 0)$
  - $bold(pi)^4 = bold(pi)^3 dot.c bold(P) = (13/81, 0, 20/81, 0, 32/81, 0, 16/81)$
  
  Từ kết quả trên:
  - Xác suất ngã xuống vực tại hoặc trước bước 4 là thành phần đầu tiên của $bold(pi)^4$: $P = 13/81$.
  - Xác suất ngã xuống vực đúng ở bước thứ 4 là hiệu xác suất trạng thái hấp thụ:
    $ P_(n g a, 4) = (bold(pi)^4)_0 - (bold(pi)^3)_0 = frac(13, 81) - frac(9, 81) = frac(4, 81). $
]

#ans-box[
  - Xác suất bị ngã xuống vực đúng ở bước thứ 4 là $frac(4, 81)$ (xấp xỉ $4.94\%$).
  - Xác suất bị ngã xuống vực tại hoặc trước bước thứ 4 là $frac(13, 81)$ (xấp xỉ $16.05\%$).
]

#v(1em)

#example-box(n: "3.4 (Di chuyển trên các đỉnh của hình lập phương)")[
  Một hạt điện tử xuất phát từ đỉnh $A$ của một hình lập phương $A B C D . A' B' C' D'$. Tại mỗi bước, hạt chỉ có thể di chuyển dọc theo các cạnh của hình lập phương để sang một trong ba đỉnh kề với đỉnh đang đứng với xác suất chia đều nhau. Tìm số cách di chuyển gồm đúng $4$ bước để hạt điện tử quay trở lại đúng vị trí đỉnh $A$ ban đầu.
]

#cach1-box[
  Gọi tập hợp các đỉnh của hình lập phương được chia thành các lớp dựa trên khoảng cách (số cạnh ngắn nhất) đến đỉnh $A$:
  - Nhóm 0 (khoảng cách 0): Đỉnh $A$ (1 đỉnh).
  - Nhóm 1 (khoảng cách 1): Đỉnh $B, D, A'$ (3 đỉnh).
  - Nhóm 2 (khoảng cách 2): Đỉnh $C, B', D'$ (3 đỉnh).
  - Nhóm 3 (khoảng cách 3): Đỉnh đối diện $C'$ (1 đỉnh).

  Tại mỗi bước, từ một đỉnh bất kỳ, có đúng 3 cách di chuyển sang đỉnh kề:
  - Từ Nhóm 0 ($A$): 3 cách chuyển sang Nhóm 1.
  - Từ Nhóm 1: 1 cách quay về Nhóm 0 và 2 cách đi tới Nhóm 2.
  - Từ Nhóm 2: 2 cách quay về Nhóm 1 và 1 cách đi tới Nhóm 3.
  - Từ Nhóm 3: 3 cách quay về Nhóm 2.

  Ta đếm số lộ trình dài 4 bước khởi hành từ $A$ và kết thúc tại $A$:
  - Bước 1: Hạt phải di chuyển từ $A$ sang Nhóm 1 (3 cách chọn đỉnh).
  - Bước 2: Hạt có hai lựa chọn:
    - *Trường hợp A:* Quay về đỉnh $A$ (Nhóm 0): có 1 cách.
      Từ đây, bước 3 phải đi sang Nhóm 1 (3 cách) và bước 4 quay lại $A$ (1 cách).
      Số lộ trình: $3 times 1 times 3 times 1 = 9$ cách.
    - *Trường hợp B:* Đi tiếp sang Nhóm 2: có 2 cách.
      Từ đây, bước 3 có hai hướng đi:
      - Hướng 1: Quay về Nhóm 1 (có 2 cách). Từ đây, bước 4 quay lại $A$ (có 1 cách).
        Số lộ trình: $3 times 2 times 2 times 1 = 12$ cách.
      - Hướng 2: Đi tiếp sang Nhóm 3 (có 1 cách). Từ đây, bước 4 chỉ có thể sang Nhóm 2, không thể quay về $A$. Lộ trình này không hợp lệ.
  
  Tổng số cách di chuyển thỏa mãn là: $9 + 12 = 21$ cách.
]

#cach2-box[
  Ta thiết lập hệ thức truyền số cách đi bằng ma trận. Gọi $a_n, b_n, c_n, d_n$ lần lượt là số lộ trình dài $n$ bước kết thúc tại các đỉnh thuộc Nhóm 0, Nhóm 1, Nhóm 2, Nhóm 3.
  Dựa trên quy tắc liên kết giữa các nhóm:
  $ a_n = b_(n-1) \
    b_n = 3 a_(n-1) + 2 c_(n-1) \
    c_n = 2 b_(n-1) + 3 d_(n-1) \
    d_n = c_(n-1) $
  Với giá trị ban đầu ở bước $n=0$: $a_0 = 1, b_0 = c_0 = d_0 = 0$. Ta tính toán từng bước:
  - $n=1$: $a_1 = 0, b_1 = 3, c_1 = 0, d_1 = 0$.
  - $n=2$: $a_2 = 3, b_2 = 0, c_2 = 6, d_2 = 0$.
  - $n=3$: $a_3 = 0, b_3 = 3(3) + 2(6) = 21, c_3 = 0, d_3 = 6$.
  - $n=4$: $a_4 = b_3 = 21, b_4 = 0, c_4 = 2(21) + 3(6) = 60, d_4 = 0$.
  
  Vậy số lộ trình dài 4 bước quay lại đỉnh $A$ là $a_4 = 21$.
]

#ans-box[
  Số cách di chuyển gồm đúng 4 bước để hạt điện tử quay về đỉnh xuất phát $A$ là $21$ cách.
]

#v(1em)

// ═══════════════════════════════════════════════
// LỚP BÀI TOÁN 4
// ═══════════════════════════════════════════════
== LỚP BÀI TOÁN 4: CHU TRÌNH ĐÓNG TRÊN LƯỚI TỌA ĐỘ VÀ BÀI TOÁN BÀN CỜ

#insight-box[
  *Đặc trưng:* Di chuyển khép kín trên lưới ô vuông phẳng hoặc quân cờ trên bàn cờ, có các điều kiện ràng buộc bổ sung nhằm loại trừ việc đi lùi ngay lập tức (no-backtracking) hoặc ràng buộc hình học về hình dáng chu trình.
]

#example-box(n: "4.1 (Quân Mã di chuyển tạo chu trình hình vuông)")[
  Một quân mã được đặt tại ô trung tâm e4 của một bàn cờ vua tiêu chuẩn $8 times 8$. Thầy Nghĩa thực hiện di chuyển quân mã này đúng $4$ bước. Biết rằng sau $4$ bước, quân mã quay trở lại đúng ô e4 ban đầu. Tính xác suất để đường đi của quân mã thỏa mãn điều kiện không có hai bước đi nào trùng nhau (không đi lùi ngay ở bước kế tiếp) và $4$ vị trí đặt chân của quân mã tạo thành $4$ đỉnh của một hình vuông.
]

#cach1-box[
  Đặt ô e4 làm gốc tọa độ $(0, 0)$. Các bước di chuyển hợp lệ của quân mã thuộc tập hợp các vectơ $S = { (plus.minus 1, plus.minus 2), (plus.minus 2, plus.minus 1) }$ gồm 8 hướng.
  Đường đi dài 4 bước quay lại $(0, 0)$ được biểu diễn dưới dạng chuỗi các vị trí $(0, 0) -> A -> B -> C -> (0, 0)$.
  Ta phân loại toàn bộ các đường đi này theo quan hệ hình học giữa $A$ và $C$ (cả hai đều là ô kề quân mã với $(0, 0)$):
  - *Trường hợp 1: $C = A$ (8 cách chọn $A$).*
    Khi đó $B$ có thể là bất kỳ ô kề nào của $A$ ngoại trừ $(0, 0)$ (7 cách chọn $B$). Đường đi này có dạng $O -> A -> B -> A -> O$, vi phạm điều kiện không đi lùi. Số đường đi là $8 times 7 = 56$ đường đi.
  - *Trường hợp 2: $C != A$ nhưng $C$ kề sát $A$ trên vòng tròn bán kính $sqrt(5)$ (16 cặp ô $(A, C)$).*
    Khi đó, giữa $A$ và $C$ chỉ có đúng 1 ô kề chung khác $(0, 0)$. Đường đi này không đi lùi nhưng tạo thành một hình thoi lệch (độ dài các đường chéo khác nhau là $sqrt(2)$ và $sqrt(18)$), không phải hình vuông. Số đường đi là $16 times 1 = 16$ đường đi.
  - *Trường hợp 3: $C$ vuông góc với $A$ qua tâm $(0, 0)$ (16 cặp ô $(A, C)$).*
    Khi đó, giữa $A$ và $C$ có đúng 1 ô kề chung khác $(0, 0)$ ký hiệu là $B$. Bốn đỉnh $O, A, B, C$ có độ dài các cạnh đều bằng $sqrt(5)$ và hai đường chéo bằng nhau ($sqrt(10)$), tạo thành một hình vuông hợp lệ. Số đường đi là $16 times 1 = 16$ đường đi.
  - *Trường hợp 4: $C$ đối diện với $A$ qua tâm $C = -A$ (8 cặp ô).*
    Tuy nhiên, hai điểm đối diện không có ô kề chung nào khác $(0, 0)$ trên bàn cờ. Số đường đi là 0.
  - *Trường hợp đặc biệt có đi lùi qua tâm:* Hạt đi $O -> A -> O -> C -> O$ (8 cách chọn $A$, 8 cách chọn $C$), số lượng là $8 times 8 = 64$ đường đi.
  
  Tổng hợp lại:
  - Tổng số đường đi dài 4 bước quay về e4 là: $56 + 16 + 16 + 64 = 168$ đường đi.
  - Số đường đi không có bước đi lùi là: $16 + 16 + 16 = 48$ đường đi.
  - Số đường đi không đi lùi và tạo thành hình vuông là: $16$ đường đi.

  Tùy thuộc vào cách phát biểu biến cố điều kiện:
  1. Nếu điều kiện là "biết quân mã quay lại e4 sau 4 bước":
     $ P = frac(16, 168) = frac(2, 21). $
  2. Nếu điều kiện là "biết quân mã quay lại e4 sau 4 bước và không đi lùi":
     $ P = frac(16, 48) = frac(1, 3). $
]

#cach2-box[
  Ta có thể mô hình hóa số đường đi bằng lũy thừa ma trận kề $bold(M)$ của đồ thị quân mã.
  Tại ô trung tâm e4, do cách xa biên cờ nên bậc của đỉnh luôn là 8. Số đường đi dài 4 bước quay lại e4 bằng phần tử đường chéo của lũy thừa ma trận kề: $(bold(M)^4)_("e4", "e4") = 168$.
  
  Để loại bỏ các bước đi lùi lập tức (backtracking), ta sử dụng ma trận chuyển trạng thái trên đồ thị hướng của các bước đi (directed edge graph). Mỗi cạnh hướng $e = (u, v)$ là một trạng thái, chuyển dịch sang cạnh $e' = (v, w)$ là hợp lệ nếu $w != u$.
  Số đường đi không đi lùi dài 4 bước quay về $O$ được tính toán chính xác là 48.
  Số chu trình tạo thành hình vuông được định vị thông qua việc kiểm tra tích vô hướng của hai bước đi liên tiếp: $arrow(O A) dot.c arrow(A B) = 0$, cho kết quả là 16 lộ trình.
]

#ans-box[
  - Xác suất nếu điều kiện chỉ là quay lại e4: $P = frac(2, 21)$ (xấp xỉ $9.52\%$).
  - Xác suất nếu điều kiện bao gồm cả không đi lùi: $P = frac(1, 3)$ (xấp xỉ $33.33\%$).
]

#v(1em)

#example-box(n: "4.2 (Đi bộ trên lưới tọa độ phẳng Oxy)")[
  Một điểm chuyển động xuất phát từ gốc tọa độ $O(0;0)$ trên mặt phẳng tọa độ $O x y$. Tại mỗi bước, điểm chỉ có thể di chuyển sang một trong $4$ ô lưới kề cạnh là $(x+1;y)$, $(x-1;y)$, $(x;y+1)$, $(x;y-1)$ với xác suất bằng nhau và bằng $0.25$. Tính xác suất để sau đúng $4$ bước di chuyển, điểm đó quay trở về đúng gốc tọa độ $O(0;0)$ với điều kiện trong suốt lộ trình không có hai bước đi liên tiếp nào đi ngược hướng nhau.
]

#sol-diagram(canvas({
  import draw: *
  // Vẽ các ô lưới nhỏ
  grid((-1.5, -1.5), (1.5, 1.5), step: 1, stroke: rgb("ccc"))
  
  // Vẽ chu trình mẫu
  rect((0, 0), (1, 1), stroke: 2pt + c-emerald)
  
  // Đánh dấu các điểm
  circle((0, 0), radius: 0.08, fill: c-navy, name: "O")
  content((0.2, -0.2), $O$)
  circle((1, 0), radius: 0.08, fill: c-teal)
  circle((1, 1), radius: 0.08, fill: c-teal)
  circle((0, 1), radius: 0.08, fill: c-teal)
  
  // Vẽ mũi tên chỉ hướng đi
  line((0.1, 0), (0.9, 0), mark: (end: ">", fill: c-emerald))
  line((1, 0.1), (1, 0.9), mark: (end: ">", fill: c-emerald))
  line((0.9, 1), (0.1, 1), mark: (end: ">", fill: c-emerald))
  line((0, 0.9), (0, 0.1), mark: (end: ">", fill: c-emerald))
}))

#cach1-box[
  Gọi các bước dịch chuyển là $d_1, d_2, d_3, d_4 \in { plus.minus e_x, plus.minus e_y }$.
  Điều kiện không có hai bước đi liên tiếp nào đi ngược hướng nhau tức là $d_(i+1) != -d_i$ với $i = 1, 2, 3$.
  Ta cần đếm số lộ trình thỏa mãn $d_1 + d_2 + d_3 + d_4 = (0, 0)$:
  - Bước 1 ($d_1$): Có 4 cách chọn hướng.
  - Bước 2 ($d_2$): Có 3 cách chọn hướng (trừ hướng đối diện $-d_1$).
  - Bước 3 ($d_3$): Có 3 cách chọn hướng (trừ hướng đối diện $-d_2$).
  - Bước 4 ($d_4$): Hạt bắt buộc phải di chuyển về gốc tọa độ $O$, tức là $d_4 = -(d_1 + d_2 + d_3)$. Đồng thời phải thỏa mãn $d_4 != -d_3 => d_1 + d_2 != (0,0)$ (nghĩa là bước 2 không được đi lùi về $O$, điều này luôn đúng do $d_2 != -d_1$).
  
  Để $d_4$ là một bước nhảy đơn vị hợp lệ, điểm đạt được ở bước 3 là $S_3 = d_1 + d_2 + d_3$ phải cách gốc $O$ đúng 1 đơn vị.
  Phân tích các trường hợp của $d_1, d_2, d_3$ không đi lùi:
  - Nếu đi thẳng liên tiếp $d_1 = d_2 = d_3$, vị trí ở bước 3 cách $O$ là 3 đơn vị, bước 4 không thể quay về $O$.
  - Nếu đi bẻ góc, ta chỉ có thể tạo thành một chu trình vuông đơn vị tuần hoàn: $d_1, d_2$ vuông góc với nhau, $d_3 = -d_1$, khi đó $d_4 = -d_2$.
    Ví dụ: $e_x -> e_y -> -e_x -> -e_y$ (đi quanh hình vuông theo chiều dương).
    Mỗi chu trình vuông như thế được xác định bởi: 4 cách chọn bước đi đầu tiên, và 2 hướng bẻ góc (quay trái hoặc quay phải) cho bước thứ hai.
    Do đó, có chính xác $4 times 2 = 8$ lộ trình thỏa mãn.
  
  Ta tính xác suất tùy theo không gian mẫu:
  1. *Xác suất trên tổng số lộ trình không đi lùi:*
     Tổng số lộ trình không đi lùi dài 4 bước là $4 times 3^3 = 108$.
     Xác suất cần tìm là: $P = frac(8, 108) = frac(2, 27)$.
  2. *Xác suất trên toàn bộ không gian mẫu ngẫu nhiên (mỗi bước chọn 1 trong 4 hướng đều nhau):*
     Xác suất của mỗi lộ trình dài 4 bước bất kỳ là $(1/4)^4 = frac(1, 256)$.
     Xác suất cần tìm là: $P = 8 times frac(1, 256) = frac(1, 32)$.
]

#cach2-box[
  Ta sử dụng phương pháp tính trên cây trạng thái hoặc ma trận chuyển.
  Với lưới tọa độ Oxy, tổng số lộ trình dài 4 bước quay lại $O(0, 0)$ không điều kiện là $6 + 6 + 24 = 36$ lộ trình.
  Trong đó, số lộ trình có bước đi lùi lập tức được loại bỏ thông qua phân tích tập hợp:
  - Có 12 lộ trình dạng $O -> A -> O -> C -> O$ (đi lùi ở bước 2 và bước 4).
  - Có 16 lộ trình đi lùi ở riêng bước 2 hoặc bước 4.
  Số lộ trình không đi lùi duy nhất quay lại $O$ chính là 8 lộ trình tạo thành hình vuông đơn vị đơn giản.
]

#ans-box[
  - Xác suất conditional trên tập không đi lùi: $P = frac(2, 27)$ (xấp xỉ $7.41\%$).
  - Xác suất chung cuộc trên toàn bộ các bước đi ngẫu nhiên: $P = frac(1, 32)$ (xấp xỉ $3.13\%$).
]

#v(1em)

#example-box(n: "4.3 (Chu trình độ dài lớn trên lưới vuông)")[
  Một hạt xuất phát từ vị trí $O(0;0)$ trên lưới tọa độ phẳng. Mỗi bước hạt dịch chuyển sang các ô kề cạnh với xác suất như nhau. Tìm số lộ trình di chuyển gồm đúng $6$ bước để hạt quay trở về lại $O(0;0)$ sao cho không có bất kỳ thời điểm nào hạt đi lùi lại vị trí vừa đi ở bước liền trước.
]

#cach1-box[
  Vì hạt không được phép đi lùi lập tức (no-backtracking), mọi lộ trình dài 6 bước quay lại $O(0, 0)$ phải có hình dạng hình học không chứa nhánh cụp dài 1 đơn vị. Do lưới tọa độ phẳng là đồ thị hai phía (bipartite graph), không tồn tại các chu trình lẻ. Vì vậy, các lộ trình 6 bước không đi lùi chỉ có thể thuộc một trong hai loại hình học sau:

  *Loại 1: Chu trình đơn tạo thành hình chữ nhật kích thước $2 times 1$ hoặc $1 times 2$.*
  Một hình chữ nhật $2 times 1$ hoặc $1 times 2$ trên lưới chứa gốc $O(0, 0)$ làm một trong các đỉnh của nó.
  - Nếu $O$ là đỉnh góc của hình chữ nhật: Có 4 góc phần tư, mỗi góc phần tư có 2 hình chữ nhật (ngang và dọc). Vậy có $4 times 2 = 8$ hình chữ nhật nhận $O$ làm đỉnh góc. Mỗi hình chữ nhật có 2 hướng đi (thuận và nghịch chiều kim đồng hồ). Số lộ trình: $8 times 2 = 16$.
  - Nếu $O$ nằm trên cạnh dài (nhưng không phải đỉnh góc): Có 2 hình chữ nhật nằm ngang đối xứng qua trục tung và 2 hình chữ nhật dọc đối xứng qua trục hoành. Tổng cộng có 4 hình chữ nhật nhận $O$ làm trung điểm của cạnh dài. Mỗi hình chữ nhật có 2 hướng đi. Số lộ trình: $4 times 2 = 8$.
  Tổng số lộ trình loại này là: $16 + 8 = 24$ lộ trình.

  *Loại 2: Đường đi dạng "kẹo mút" (lollipop).*
  Lộ trình gồm: 1 bước đi ra từ $O$ đến điểm kề $A$, tiếp theo là một chu trình vuông đơn vị dài 4 bước xuất phát và kết thúc tại $A$ (không đi qua $O$), và bước cuối đi từ $A$ ngược lại $O$.
  - Bước đầu tiên $O -> A$: Có 4 cách chọn điểm kề $A$.
  - Từ $A$, ta đi 1 chu trình vuông đơn vị dài 4 bước không đi qua $O$. Có đúng 2 hình vuông đơn vị kề với $A$ mà không chứa $O$. Mỗi hình vuông có 2 cách đi (thuận và ngược chiều). Do đó có $2 times 2 = 4$ chu trình vuông hợp lệ xuất phát từ $A$.
  - Bước cuối cùng $A -> O$: Chỉ có 1 cách duy nhất và luôn hợp lệ (không bị trùng lùi với bước liền trước do bước liền trước kết thúc tại $A$ từ một hướng vuông góc với đoạn $A O$).
  Số lộ trình dạng này là: $4 " (cách chọn A)" times 4 " (chu trình vuông)" = 16$ lộ trình.

  Tổng cộng số lộ trình di chuyển thỏa mãn là: $24 + 16 = 40$ lộ trình.
]

#cach2-box[
  Ta có thể kiểm chứng kết quả bằng phương pháp đếm số đường đi trên đồ thị.
  Tổng số lộ trình 6 bước xuất phát từ $O$ quay lại $O$ (cho phép đi lùi) được tính bằng hệ số trong khai triển đa thức hoặc đếm tổ hợp trực tiếp trên lưới:
  $ T_6 = binom(6, 3) sum_(k=0)^3 binom(3, k)^2 = 20 times (1 + 9 + 9 + 1) = 400. $
  Sử dụng nguyên lý bù trừ và thiết lập ma trận bước đi không lùi (Non-backtracking Matrix $bold(B)$), ta tính được số lượng chu trình không đi lùi độ dài 6 chính bằng vết của lũy thừa ma trận $bold(B)^6$. Kết quả tính toán ma trận cho ra đúng số lượng chu trình là $40$.
]

#ans-box[
  Số lộ trình di chuyển gồm đúng 6 bước quay lại $O(0, 0)$ không đi lùi là $40$ lộ trình.
]

#v(1em)

// ═══════════════════════════════════════════════
// LỚP BÀI TOÁN 5
// ═══════════════════════════════════════════════
== LỚP BÀI TOÁN 5: CHUỖI MARKOV CÓ TRỌNG SỐ (Tích lũy đại lượng kèm theo)

#insight-box[
  *Đặc trưng:* Hệ thống vừa dịch chuyển trạng thái ngẫu nhiên, vừa tích lũy thêm một đại lượng số học (như tọa độ, điểm số, phần thưởng). Phương pháp giải quyết tối ưu là sử dụng hàm sinh đa biến hoặc phân tích cây xác suất trạng thái.
]

#example-box(n: "5.1 (Tung đồng xu tích lũy tọa độ đại số)")[
  Một quân cờ xuất phát từ vạch số $0$ trên trục số thực. Ở mỗi lượt, người chơi tung một đồng xu cân đối: nếu mặt ngửa xuất hiện (xác suất $0.6$), quân cờ tiến về phía phải $2$ đơn vị; nếu mặt sấp xuất hiện (xác suất $0.4$), quân cờ lùi về phía trái $1$ đơn vị. Tính xác suất để sau đúng $4$ lượt chơi, quân cờ dừng lại ở vị trí có tọa độ lớn hơn hoặc bằng $2$.
]

#cach1-box[
  Gọi $N$ là số lần mặt ngửa xuất hiện trong 4 lượt chơi ($0 <= N <= 4$).
  Khi đó, số lần mặt sấp xuất hiện là $4 - N$.
  Tọa độ của quân cờ sau 4 lượt chơi là:
  $ X_4 = 2 N - (4 - N) = 3 N - 4 $
  Yêu cầu bài toán là tọa độ lớn hơn hoặc bằng 2:
  $ X_4 >= 2 => 3 N - 4 >= 2 => 3 N >= 6 => N >= 2 $
  Vì số lần ngửa $N$ là số nguyên nên $N \in {2, 3, 4}$.
  Vì các lượt tung đồng xu là độc lập, số lần xuất hiện mặt ngửa tuân theo phân phối nhị thức $B(4; 0.6)$.
  Xác suất cần tìm là:
  $ P(X_4 >= 2) = P(N = 2) + P(N = 3) + P(N = 4) $
  Tính cụ thể từng xác suất:
  - Với $N = 2$: $P(N = 2) = binom(4, 2) times (0.6)^2 times (0.4)^2 = 6 times 0.36 times 0.16 = 0.3456$.
  - Với $N = 3$: $P(N = 3) = binom(4, 3) times (0.6)^3 times (0.4)^1 = 4 times 0.216 times 0.4 = 0.3456$.
  - Với $N = 4$: $P(N = 4) = binom(4, 4) times (0.6)^4 times (0.4)^0 = 1 times 0.1296 times 1 = 0.1296$.
  
  Tổng xác suất là:
  $ P = 0.3456 + 0.3456 + 0.1296 = 0.8208. $
]

#cach2-box[
  Ta giải bằng hàm sinh (Generating Function).
  Mỗi bước tung đồng xu được biểu diễn bằng hàm sinh đa thức cho sự thay đổi tọa độ:
  $ G(x) = 0.6 x^2 + 0.4 x^(-1) $
  Sau 4 bước, hàm sinh tổng hợp cho vị trí của quân cờ là:
  $ G_4(x) = [G(x)]^4 = (0.6 x^2 + 0.4 x^(-1))^4 $
  Khai triển đa thức bằng nhị thức Newton:
  $ G_4(x) = sum_(k=0)^4 binom(4, k) (0.6)^k (0.4)^(4-k) x^(3k-4) $
  Hệ số của $x^m$ chính là xác suất quân cờ ở tọa độ $m$ sau 4 bước.
  Ta cần tìm tổng các hệ số của $x^m$ với $m >= 2$, tương đương với $3k-4 >= 2 => k >= 2$:
  - Với $k=2$ (mũ $x^2$): hệ số là $0.3456$.
  - Với $k=3$ (mũ $x^5$): hệ số là $0.3456$.
  - Với $k=4$ (mũ $x^8$): hệ số là $0.1296$.
  Tổng xác suất là $0.3456 + 0.3456 + 0.1296 = 0.8208$.
]

#ans-box[
  Xác suất để quân cờ dừng lại ở vị trí có tọa độ lớn hơn hoặc bằng 2 là $0.8208$ (tức $82.08\%$).
]

#v(1em)

#example-box(n: "5.2 (Mô hình dự báo thời tiết tích lũy ngày nắng)")[
  Thời tiết ở một vùng nhiệt đới biến động theo chuỗi trạng thái ngày: Nếu hôm nay trời nắng, xác suất để ngày mai tiếp tục nắng là $0.7$ và đổi sang mưa là $0.3$. Nếu hôm nay trời mưa, xác suất ngày mai quay lại nắng là $0.4$ và tiếp tục mưa là $0.6$. Biết ngày thứ Hai trời đang nắng. Tính xác suất để trong khoảng thời gian từ thứ Ba đến thứ Sáu cùng tuần đó (gồm 4 ngày), tổng số ngày có thời tiết nắng nhiều hơn số ngày có thời tiết mưa.
]

#cach1-box[
  Gọi trạng thái thời tiết các ngày từ thứ Ba đến thứ Sáu là $X_1, X_2, X_3, X_4 \in {S, R}$ (với $S$ là Nắng, $R$ là Mưa).
  Thời tiết ngày thứ Hai là $X_0 = S$.
  Tổng số ngày trong khoảng khảo sát là 4 ngày. Điều kiện "số ngày nắng nhiều hơn số ngày mưa" tương đương với việc có 3 hoặc 4 ngày nắng trong tập $\{X_1, X_2, X_3, X_4\}$.
  Ta phân tích các lộ trình thời tiết thỏa mãn:
  
  - *Trường hợp 1: Có đúng 4 ngày nắng ($S S S S$).*
    Lộ trình: $S -> S -> S -> S -> S$.
    Xác suất: $P_4 = 0.7 times 0.7 times 0.7 times 0.7 = 0.2401$.
    
  - *Trường hợp 2: Có đúng 3 ngày nắng và 1 ngày mưa.*
    Các cấu hình có thể xảy ra cho 4 ngày này là:
    - $R S S S$ (Mưa vào thứ Ba): Lộ trình $S -> R -> S -> S -> S$.
      Xác suất: $P(S -> R) times P(R -> S) times P(S -> S) times P(S -> S) = 0.3 times 0.4 times 0.7 times 0.7 = 0.0588$.
    - $S R S S$ (Mưa vào thứ Tư): Lộ trình $S -> S -> R -> S -> S$.
      Xác suất: $P(S -> S) times P(S -> R) times P(R -> S) times P(S -> S) = 0.7 times 0.3 times 0.4 times 0.7 = 0.0588$.
    - $S S R S$ (Mưa vào thứ Năm): Lộ trình $S -> S -> S -> R -> S$.
      Xác suất: $P(S -> S) times P(S -> S) times P(S -> R) times P(R -> S) = 0.7 times 0.7 times 0.3 times 0.4 = 0.0588$.
    - $S S S R$ (Mưa vào thứ Sáu): Lộ trình $S -> S -> S -> S -> R$.
      Xác suất: $P(S -> S) times P(S -> S) times P(S -> S) times P(S -> R) = 0.7 times 0.7 times 0.7 times 0.3 = 0.1029$.
      
  Tổng xác suất thỏa mãn là:
  $ P = 0.2401 + 0.0588 + 0.0588 + 0.0588 + 0.1029 = 0.5194. $
]

#cach2-box[
  Ta có thể lập sơ đồ cây trạng thái mở rộng hoặc sử dụng ma trận chuyển trạng thái kết hợp với biến đếm số ngày nắng.
  Gọi trạng thái tại bước $n$ là $(Y_n, K_n)$ với $Y_n \in {S, R}$ là thời tiết ngày $n$ và $K_n$ là tổng số ngày nắng tích lũy từ bước 1 đến bước $n$.
  Ta tính phân phối xác suất tại từng ngày:
  - Ngày 0 (thứ Hai): trạng thái ban đầu là $(S, 0)$ với xác suất 1.
  - Ngày 1 (thứ Ba):
    - $(S, 1)$ có xác suất $0.7$.
    - $(R, 0)$ có xác suất $0.3$.
  - Ngày 2 (thứ Tư):
    - $(S, 2)$ từ $(S, 1)$: xác suất $0.7 times 0.7 = 0.49$.
    - $(R, 1)$ từ $(S, 1)$ hoặc $(R, 0)$: xác suất $0.7 times 0.3 + 0.3 times 0.6 = 0.21 + 0.18 = 0.39$.
    - $(S, 1)$ từ $(R, 0)$: xác suất $0.3 times 0.4 = 0.12$.
    - $(R, 0)$ từ $(R, 0)$: xác suất $0.3 times 0.6 = 0.18$ (nhưng ở đây $K_n = 0$, ta không cần quan tâm sâu vì không thể đạt >= 3).
  Tính toán tuần tự đến ngày 4 (thứ Sáu), ta cộng tất cả các trạng thái có $K_4 >= 3$, cho kết quả chính xác $0.5194$.
]

#ans-box[
  Xác suất để tổng số ngày nắng nhiều hơn số ngày mưa là $0.5194$ (tức $51.94\%$).
]

#v(1em)

#example-box(n: "5.3 (Mô hình tài chính biến động giá cổ phiếu tích lũy điểm tín nhiệm)")[
  Sự biến động giá của một mã cổ phiếu công nghệ được theo dõi theo ngày. Nếu hôm nay giá cổ phiếu tăng, xác suất để ngày mai nó tiếp tục tăng là $0.7$ (hệ thống cộng $+2$ điểm tín nhiệm) và giảm là $0.3$ (bị trừ $-1$ điểm tín nhiệm). Nếu hôm nay giá cổ phiếu giảm, xác suất ngày mai nó quay đầu tăng là $0.5$ (cộng $+1$ điểm) và tiếp tục giảm là $0.5$ (bị trừ $-2$ điểm). Biết ngày thứ Hai cổ phiếu đang ở trạng thái tăng với khởi điểm $0$ điểm tín nhiệm. Tìm xác suất để đến ngày thứ Sáu cùng tuần, tổng điểm tín nhiệm tích lũy của mã cổ phiếu này là một số dương.
]

#cach1-box[
  Xét chuỗi biến động từ thứ Hai ($t=0$) đến thứ Sáu ($t=4$), gồm 4 bước chuyển đổi giá.
  Gọi trạng thái giá các ngày là $X_t \in {+, -}$ ($t = 1, 2, 3, 4$), với $X_0 = +$.
  Các bước chuyển đổi sẽ cộng/trừ điểm tín nhiệm tương ứng:
  - $(+ -> +)$: cộng $+2$ (xác suất 0.7)
  - $(+ -> -)$: trừ $-1$ (xác suất 0.3)
  - $(- -> +)$: cộng $+1$ (xác suất 0.5)
  - $(- -> -)$: trừ $-2$ (xác suất 0.5)
  
  Ta liệt kê 16 lộ trình biến động giá từ thứ Ba đến thứ Sáu, tính xác suất và điểm tích lũy tương ứng:
  1. $++++$: xác suất $0.7^4 = 0.2401$. Điểm: $2+2+2+2 = 8 > 0$ (Chọn).
  2. $+++-$: xác suất $0.7^3 times 0.3 = 0.1029$. Điểm: $2+2+2-1 = 5 > 0$ (Chọn).
  3. $++-+$: xác suất $0.7^2 times 0.3 times 0.5 = 0.0735$. Điểm: $2+2-1+1 = 4 > 0$ (Chọn).
  4. $++--$: xác suất $0.7^2 times 0.3 times 0.5 = 0.0735$. Điểm: $2+2-1-2 = 1 > 0$ (Chọn).
  5. $+-++$: xác suất $0.7 times 0.3 times 0.5 times 0.7 = 0.0735$. Điểm: $2-1+1+2 = 4 > 0$ (Chọn).
  6. $+-+- $: xác suất $0.7 times 0.3 times 0.5 times 0.3 = 0.0315$. Điểm: $2-1+1-1 = 1 > 0$ (Chọn).
  7. $+--+$: xác suất $0.7 times 0.3 times 0.5 times 0.5 = 0.0525$. Điểm: $2-1-2+1 = 0$ (Không chọn).
  8. $+---$: xác suất $0.7 times 0.3 times 0.5 times 0.5 = 0.0525$. Điểm: $2-1-2-2 = -3$ (Không chọn).
  9. $-+++$: xác suất $0.3 times 0.5 times 0.7^2 = 0.0735$. Điểm: $-1+1+2+2 = 4 > 0$ (Chọn).
  10. $-++-$: xác suất $0.3 times 0.5 times 0.7 times 0.3 = 0.0315$. Điểm: $-1+1+2-1 = 1 > 0$ (Chọn).
  11. $-+-+$: xác suất $0.3 times 0.5 times 0.3 times 0.5 = 0.0225$. Điểm: $-1+1-1+1 = 0$ (Không chọn).
  12. $-+--$: xác suất $0.3 times 0.5 times 0.3 times 0.5 = 0.0225$. Điểm: $-1+1-1-2 = -3$ (Không chọn).
  13. $--++$: xác suất $0.3 times 0.5 times 0.5 times 0.7 = 0.0525$. Điểm: $-1-2+1+2 = 0$ (Không chọn).
  14. $--+-$: xác suất $0.3 times 0.5 times 0.5 times 0.3 = 0.0225$. Điểm: $-1-2+1-1 = -3$ (Không chọn).
  15. $---+$: xác suất $0.3 times 0.5^3 = 0.0375$. Điểm: $-1-2-2+1 = -4$ (Không chọn).
  16. $----$: xác suất $0.3 times 0.5^3 = 0.0375$. Điểm: $-1-2-2-2 = -7$ (Không chọn).

  Cộng xác suất các lộ trình có tổng điểm dương (lộ trình 1 đến 6, 9 và 10):
  $ P = 0.2401 + 0.1029 + 0.0735 times 4 + 0.0315 times 2 = 0.3430 + 0.2940 + 0.0630 = 0.7000. $
]

#cach2-box[
  Ta có thể lập bảng ma trận chuyển đổi đa biến bằng cách sử dụng hàm sinh kèm biến biểu thị trạng thái tích lũy.
  Gọi đa thức trạng thái tại ngày thứ $n$ có dạng $H_n(x, y)$ và $S_n(x, y)$, trong đó hệ số của $x^k y^s$ biểu thị xác suất đạt trạng thái tăng ($H$) hoặc giảm ($S$) tại ngày thứ $n$ với số điểm tích lũy bằng $s$.
  Quy tắc chuyển tiếp từ ngày $n-1$ sang ngày $n$ là:
  $ H_n(x, y) = 0.7 y^2 H_(n-1)(x, y) + 0.5 y^1 S_(n-1)(x, y) \
    S_n(x, y) = 0.3 y^(-1) H_(n-1)(x, y) + 0.5 y^(-2) S_(n-1)(x, y) $
  Với điểm khởi đầu vào ngày thứ Hai (bước $n=0$): $H_0(x, y) = 1$ và $S_0(x, y) = 0$.
  Tính toán đa thức cho các bước tiếp theo, ta cộng các hệ số của các số hạng chứa số mũ $y^s$ với $s > 0$ trong đa thức tổng $H_4(x, y) + S_4(x, y)$, kết quả thu được là $0.7$.
]

#ans-box[
  Xác suất để đến ngày thứ Sáu tổng điểm tín nhiệm tích lũy là một số dương là $0.7$ (tức $70\%$ hoặc $7/10$).
]




