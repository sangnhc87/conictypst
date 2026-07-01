#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("E65100"), rgb("EF6C00"), rgb("F57C00"), angle: 135deg),
  stroke: none,
  inset: (x: 15pt, y: 11pt),
  radius: 7pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("E65100")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("E65100"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1565C0"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#let col-violet = rgb("6A1B9A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-teal = rgb("006064")
#let col-pink = rgb("880E4F")
#let col-navy = rgb("1A237E")

// ─── Hộp Định Nghĩa / Lý Thuyết ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + col-amber, rest: 0.8pt + rgb("FFE0B2")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-amber, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

// ─── Hộp Ví Dụ Trực Quan ───────────────────────
#let eg-box(title: "🎯 Bài Toán Phân Tích", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Nhận Xét ───────────────────────────────
#let note-box(title: "📌 Nhận Xét Quan Trọng", body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + col-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Phân Biệt / So Sánh ─────────────────────
#let compare-box(title: "🔍 Phân Tích Kịch Bản", body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Cách 1 / Cách 2 ─────────────────────────
#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Phân Tích Các Bước Độc Lập]
  #v(0.3em)
  #body
]

#let cach2-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[🟣 Tính Toán Xác Suất Theo Sơ Đồ Cây]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("1B0000"), rgb("E65100"), rgb("FF6F00"), rgb("FF8F00"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("FFE0B2"), size: 11pt, weight: "bold", tracking: 2pt)[
      BỘ TÀI LIỆU CHUYÊN SÂU HSG & ĐGNL
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "black")[Sơ Đồ Cây & Xác Suất Trò Chơi]
    #v(0.4em)
    #text(fill: rgb("FFF3E0"), size: 14pt)[🎯 Trực Quan Hóa Xác Suất Có Điều Kiện Từ Khó Đến Siêu Khó]
    #v(0.5em)
    #text(fill: rgb("FFE0B2"), size: 11pt, style: "italic")[
      "Bẻ gãy mọi bài toán phân nhánh kịch bản phức tạp bằng sơ đồ hình học trực quan"
    ]
    #v(1.2em)
    #line(length: 70%, stroke: 1.5pt + rgb("FFE0B2"))
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr),
      align: center,
      gutter: 0.5em,
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("FFF3E0"), size: 9pt)[*Chủ đề* Conditional Probability & Tournament Trees]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("FFF3E0"), size: 9pt)[*Biên soạn* Tổ Toán HSG & ĐGNL]
        ]
      ],
    )
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// MỤC LỤC THU GỌN
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 95%,
    fill: rgb("FFF3E0").lighten(60%),
    stroke: 1pt + rgb("FFE0B2"),
    radius: 8pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(fill: col-amber, size: 11pt, weight: "bold")[📚 Cấu Trúc Chuyên Đề]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [📖 *I. Phương Pháp Sơ Đồ Cây Xác Suất*], [🎾 *II. Bài Toán Gốc: Giải đấu Tennis 4 người*],
      [⚔️ *III. Bài Toán Mới 1: Gladiator Team Duel*], [🔥 *IV. Bài Toán Mới 2: Tam Hùng Thăng Hoa*],
      [🎲 *V. Bài Toán 1: Trò chơi Xúc xắc Sinh tử*], [🏆 *VI. Bài Toán 2: Giải đấu Double Elimination*],
      [👑 *VII. Bài Toán 3: Cờ vua King of the Hill*], [📈 *VIII. Sơ đồ cây & Sức mạnh Động*],
      [💡 *IX. Cẩm Nang Tư Duy Tránh Bẫy*], []
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("E65100"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Đặc Biệt: Sơ Đồ Cây & Xác Suất Trò Chơi],
      [GV Nguyễn Văn Sang · SĐT: 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("FFE0B2"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("E65100"))
    grid(
      columns: (1fr, auto),
      [],
      [Trang #counter(page).display()],
    )
  }
)

// ═══════════════════════════════════════════════
// PHẦN I. PHƯƠNG PHÁP SƠ ĐỒ CÂY
// ═══════════════════════════════════════════════
= I. Phương Pháp Sơ Đồ Cây Xác Suất — Tư Duy Đỉnh Cao Cho Bài Toán Phân Nhánh

Khi giải quyết các bài toán xác suất phức tạp, đặc biệt là các bài toán có nhiều giai đoạn (multi-stage) hoặc các kịch bản phụ thuộc lẫn nhau (conditional probability), học sinh rất dễ rơi vào trạng thái "rối não" và đếm thiếu kịch bản.

*Sơ đồ cây xác suất* chính là công cụ trực quan hóa tối thượng để giải quyết vấn đề này.

== 1. Cấu trúc của một Sơ đồ Cây
- *Nút gốc (Root):* Điểm khởi đầu của thí nghiệm.
- *Nhánh (Branches):* Thể hiện các kịch bản có thể xảy ra. Mỗi nhánh được gán một *xác suất có điều kiện* tương ứng với nhánh đó.
- *Nút lá (Leaves):* Kết quả cuối cùng của một chuỗi hành động/sự kiện liên tiếp.

== 2. Hai Quy Tắc Vàng Khi Tính Toán Trên Sơ Đồ Cây
#rev-box(title: "⚡ Hai Quy Tắc Vàng")[
  1. *Quy tắc Nhân (Dọc theo một nhánh):* Xác suất của một kết quả cuối cùng (nút lá) bằng *tích các xác suất* dọc theo các nhánh dẫn từ gốc đến lá đó.
     $ P(X_1 inter X_2 inter ... inter X_k) = P(X_1) dot.c P(X_2 | X_1) dot.c P(X_3 | X_1 inter X_2)... $
  2. *Quy tắc Cộng (Giữa các lá độc lập):* Nếu một kết quả mong muốn có thể đạt được từ nhiều kịch bản (nhiều nút lá khác nhau), xác suất của biến cố đó bằng *tổng xác suất* của các nút lá đó.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II. BÀI TOÁN GỐC (TENNIS)
// ═══════════════════════════════════════════════
= II. Bài Toán Gốc: Giải đấu Tennis 4 người có kỳ phùng địch thủ

#eg-box(title: "🎯 Ví dụ 2.1 — Bài toán gốc: Giải đấu Tennis 4 người có kỳ phùng địch thủ")[
  Bốn tay vợt Tennis An ($A$), Bình ($B$), Công ($C$) và Duy ($D$) tham gia vào một giải đấu có tổng cộng ba trận đấu. 
  Đầu tiên, hai người chơi được chọn ngẫu nhiên để chơi với nhau; hai người chơi còn lại cũng chơi với nhau. Những người chiến thắng trong hai trận đấu đó sẽ thi đấu với nhau để quyết định nhà vô địch giải đấu. 
  
  An, Bình và Công ngang sức nhau (nghĩa là, khi một trận đấu được chơi giữa hai người trong ba người An, Bình, Công, xác suất mỗi người chơi thắng là $1 / 2$). 
  Khi Duy đấu với An, Bình hoặc Công, xác suất Duy thắng là $0.7$. Xác định xác suất Bình vô địch giải đấu.
]

== 1. Phân Tích Các Kịch Bản Phân Cặp Vòng 1
Có 4 người chơi, số cách phân chia 4 người này thành 2 cặp thi đấu độc lập là:
$ frac(C_4^2, 2!) = 3 "cách." $

Vì việc phân cặp là hoàn toàn ngẫu nhiên, mỗi kịch bản phân cặp (Case) có xác suất xuất hiện là:
$ P("Case 1") = P("Case 2") = P("Case 3") = 1 / 3. $

#compare-box(title: "🔍 Phân tích 3 Kịch Bản")[
  - *Kịch bản 1 (Case 1):* Hộp 1 đấu $A$ vs $B$; Hộp 2 đấu $C$ vs $D$.
  - *Kịch bản 2 (Case 2):* Hộp 1 đấu $A$ vs $C$; Hộp 2 đấu $B$ vs $D$.
  - *Kịch bản 3 (Case 3):* Hộp 1 đấu $A$ vs $D$; Hộp 2 đấu $B$ vs $C$.
]

---

== 2. Tính Toán Xác Suất Bình Vô Địch Theo Từng Kịch Bản

#cach1-box[
  *Phân tích chi tiết xác suất thắng của Bình ($B$):*
  
  - *Tại Kịch bản 1 (Case 1: $A$ vs $B$ và $C$ vs $D$):*
    - Trận 1: $B$ đấu với $A -> P(B " thắng " A) = 1/2$.
    - Trận 2: $C$ đấu với $D$. Người chiến thắng sẽ gặp $B$ ở chung kết.
      - Nếu $C$ thắng $D$ (xác suất $1 - 0.7 = 0.3$): Chung kết là $B$ vs $C$. Xác suất $B$ thắng là $1/2$.
      - Nếu $D$ thắng $C$ (xác suất $0.7$): Chung kết là $B$ vs $D$. Xác suất $B$ thắng là $1 - 0.7 = 0.3$.
    - Xác suất $B$ vô địch trong Case 1 là:
      $ P(B " vô địch" | "Case 1") = P(B " thắng " A) dot.c [ P(C " thắng " D) dot.c P(B " thắng " C) + P(D " thắng " C) dot.c P(B " thắng " D) ] $
      $ P(B " vô địch" | "Case 1") = 1 / 2 dot.c [ 0.3 dot.c 1 / 2 + 0.7 dot.c 0.3 ] = 1 / 2 dot.c [ 0.15 + 0.21 ] = 1 / 2 dot.c 0.36 = 0.18. $

  - *Tại Kịch bản 2 (Case 2: $A$ vs $C$ và $B$ vs $D$):*
    - Trận 1: $A$ vs $C ->$ Người thắng sẽ gặp $B$ ở chung kết (là $A$ hoặc $C$).
    - Trận 2: $B$ vs $D -> B$ bắt buộc phải thắng $D$ để vào chung kết: $P(B " thắng " D) = 0.3$.
    - Tại chung kết, đối thủ của $B$ chắc chắn là $A$ hoặc $C$. Vì $B$ ngang sức với cả $A$ và $C$, xác suất $B$ thắng chung kết luôn là $1/2$ bất kể ai thắng Trận 1.
    - Xác suất $B$ vô địch trong Case 2 là:
      $ P(B " vô địch" | "Case 2") = P(B " thắng " D) dot.c P(B " thắng chung kết") = 0.3 dot.c 1 / 2 = 0.15. $

  - *Tại Kịch bản 3 (Case 3: $A$ vs $D$ và $B$ vs $C$):*
    - Trận 1: $A$ vs $D$. Người thắng gặp $B$ ở chung kết.
      - $A$ thắng $D$ với xác suất $0.3$.
      - $D$ thắng $A$ với xác suất $0.7$.
    - Trận 2: $B$ vs $C -> B$ thắng để vào chung kết với xác suất $1/2$.
    - Chung kết:
      - Nếu đối thủ là $A$: $B$ thắng với xác suất $1/2$.
      - Nếu đối thủ là $D$: $B$ thắng với xác suất $0.3$.
    - Xác suất $B$ vô địch trong Case 3 là:
      $ P(B " vô địch" | "Case 3") = P(B " thắng " C) dot.c [ P(A " thắng " D) dot.c P(B " thắng " A) + P(D " thắng " A) dot.c P(B " thắng " D) ] $
      $ P(B " vô địch" | "Case 3") = 1 / 2 dot.c [ 0.3 dot.c 1 / 2 + 0.7 dot.c 0.3 ] = 0.18. $
]

---

#pagebreak()

== 3. Vẽ Sơ Đồ Cây Xác Suất Cho Bình Vô Địch

Dưới đây là sơ đồ cây trực quan hóa toàn bộ kịch bản thi đấu dẫn đến chiến thắng của Bình ($B$):

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.3, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[Gốc])
    
    // 3 Kịch bản phân cặp
    rect((3, 4), (5.5, 5), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c1")
    content("c1", text(size: 8pt)[*Case 1* \ (A-B, C-D)])
    
    rect((3, 0), (5.5, 1), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c2")
    content("c2", text(size: 8pt)[*Case 2* \ (A-C, B-D)])
    
    rect((3, -4), (5.5, -3), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c3")
    content("c3", text(size: 8pt)[*Case 3* \ (A-D, B-C)])
    
    line("root", "c1.west", mark: (end: "stealth"))
    content((1.5, 2.3), text(size: 8pt)[1/3])
    line("root", "c2.west", mark: (end: "stealth"))
    content((1.5, 0.7), text(size: 8pt)[1/3])
    line("root", "c3.west", mark: (end: "stealth"))
    content((1.5, -1.8), text(size: 8pt)[1/3])
    
    // Phân nhánh Case 1
    rect((8, 5.5), (11, 6.3), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_c")
    content("c1_c", text(size: 7.5pt)[B thắng A, C thắng D \ Chung kết: B vs C])
    
    rect((8, 3.7), (11, 4.5), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_d")
    content("c1_d", text(size: 7.5pt)[B thắng A, D thắng C \ Chung kết: B vs D])
    
    line("c1.east", "c1_c.west", mark: (end: "stealth"))
    content((6.8, 5.2), text(size: 7pt)[$1/2 dot.c 0.3$])
    line("c1.east", "c1_d.west", mark: (end: "stealth"))
    content((6.8, 4.0), text(size: 7pt)[$1/2 dot.c 0.7$])
    
    // Phân nhánh Case 2
    rect((8, 0.1), (11, 0.9), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c2_b")
    content("c2_b", text(size: 7.5pt)[B thắng D \ Chung kết: B vs (A/C)])
    line("c2.east", "c2_b.west", mark: (end: "stealth"))
    content((6.8, 0.8), text(size: 7pt)[0.3])
    
    // Phân nhánh Case 3
    rect((8, -2.3), (11, -1.5), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_a")
    content("c3_a", text(size: 7.5pt)[B thắng C, A thắng D \ Chung kết: B vs A])
    
    rect((8, -4.1), (11, -3.3), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_d")
    content("c3_d", text(size: 7.5pt)[B thắng C, D thắng A \ Chung kết: B vs D])
    
    line("c3.east", "c3_a.west", mark: (end: "stealth"))
    content((6.8, -2.6), text(size: 7pt)[$1/2 dot.c 0.3$])
    line("c3.east", "c3_d.west", mark: (end: "stealth"))
    content((6.8, -3.8), text(size: 7pt)[$1/2 dot.c 0.7$])
    
    // Nút lá chiến thắng (B vô địch)
    circle((14, 5.9), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win1")
    content("win1", text(size: 7pt, fill: col-green, weight: "bold")[B])
    circle((14, 4.1), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win2")
    content("win2", text(size: 7pt, fill: col-green, weight: "bold")[B])
    circle((14, 0.5), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win3")
    content("win3", text(size: 7pt, fill: col-green, weight: "bold")[B])
    circle((14, -1.9), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win4")
    content("win4", text(size: 7pt, fill: col-green, weight: "bold")[B])
    circle((14, -3.7), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win5")
    content("win5", text(size: 7pt, fill: col-green, weight: "bold")[B])
    
    line("c1_c.east", "win1.west", mark: (end: "stealth"))
    content((12.5, 6.2), text(size: 7pt)[0.5])
    line("c1_d.east", "win2.west", mark: (end: "stealth"))
    content((12.5, 4.4), text(size: 7pt)[0.3])
    line("c2_b.east", "win3.west", mark: (end: "stealth"))
    content((12.5, 0.8), text(size: 7pt)[0.5])
    line("c3_a.east", "win4.west", mark: (end: "stealth"))
    content((12.5, -1.6), text(size: 7pt)[0.5])
    line("c3_d.east", "win5.west", mark: (end: "stealth"))
    content((12.5, -3.4), text(size: 7pt)[0.3])
  })
]

#cach2-box[
  *Cộng các lá chiến thắng của Bình:*
  Xác suất tổng thể để Bình ($B$) vô địch là tổng xác suất của 3 kịch bản:
  $ P(B " vô địch") = sum_(i=1)^3 P("Case " i) dot.c P(B " vô địch" | "Case " i) $
  $ P(B " vô địch") = 1 / 3 dot.c 0.18 + 1 / 3 dot.c 0.15 + 1 / 3 dot.c 0.18 = frac(0.18 + 0.15 + 0.18, 3) = frac(0.51, 3) = 0.17 = 17%. $
  
  *Kết luận:* Xác suất để Bình vô địch giải đấu là *17%* (hoặc viết dạng phân số là *$17/100$*).
]

#eg-box(title: "🎯 Ví dụ 2.2 — Phiên bản đối xứng thay đổi trọng số (Đấu thủ kỵ giơ)")[
  Bốn tay vợt cầu lông Hải ($H$), Nam ($N$), Sơn ($S$) và Phong ($P$) tham gia giải đấu loại trực tiếp có thể thức phân cặp tương tự như Ví dụ 2.1 (hai người chơi được chọn ngẫu nhiên đấu với nhau; hai người còn lại đấu với nhau, hai người thắng tranh chức vô địch).
  Biết rằng Hải, Nam và Sơn ngang sức nhau (xác suất thắng khi đối đầu trực tiếp giữa hai người trong ba người này luôn là $1/2$).
  Khi Phong đấu với Hải, Nam hoặc Sơn, do Phong có lối chơi kỵ giơ đặc thù nên:
  - Xác suất Phong thắng Hải là $0.8$.
  - Xác suất Phong thắng Nam là $0.6$.
  - Xác suất Phong thắng Sơn là $0.5$.
  
  Xác định xác suất để tay vợt Nam đoạt chức vô địch giải đấu.
]

#cach1-box[
  *Phân tích các kịch bản phân cặp ở vòng 1:*
  Tương tự Ví dụ 2.1, có 3 kịch bản phân cặp ngẫu nhiên đầu giải với xác suất mỗi kịch bản là $1/3$:
  - *Kịch bản 1 (Case 1):* Hải vs Nam ($H-N$) và Sơn vs Phong ($S-P$).
  - *Kịch bản 2 (Case 2):* Hải vs Sơn ($H-S$) và Nam vs Phong ($N-P$).
  - *Kịch bản 3 (Case 3):* Hải vs Phong ($H-P$) và Nam vs Sơn ($N-S$).
]

#cach2-box[
  *Tính toán xác suất Nam ($N$) vô địch trong từng kịch bản:*
  
  - *Tại Kịch bản 1 (Case 1: $H-N$ và $S-P$):*
    - Trận 1: Nam đấu Hải -> $P(N " thắng " H) = 1/2$.
    - Trận 2: Sơn đấu Phong. Người thắng gặp Nam ở chung kết.
      - Sơn thắng Phong với xác suất $1 - 0.5 = 0.5$. Chung kết: Nam vs Sơn. Nam thắng với xác suất $1/2$.
      - Phong thắng Sơn với xác suất $0.5$. Chung kết: Nam vs Phong. Nam thắng với xác suất $1 - 0.6 = 0.4$.
    - Xác suất Nam vô địch trong Case 1:
      $ P(N | "Case 1") = 1/2 dot.c [ 0.5 dot.c 1/2 + 0.5 dot.c 0.4 ] = 1/2 dot.c [ 0.25 + 0.20 ] = 0.225. $

  - *Tại Kịch bản 2 (Case 2: $H-S$ và $N-P$):*
    - Trận 1: Hải đấu Sơn. Người thắng gặp Nam hoặc Phong ở chung kết.
    - Trận 2: Nam đấu Phong -> Nam bắt buộc phải thắng: $P(N " thắng " P) = 1 - 0.6 = 0.4$.
    - Chung kết: Đối thủ của Nam là Hải hoặc Sơn. Vì Nam ngang sức cả hai người này, xác suất Nam thắng chung kết luôn là $1/2$.
    - Xác suất Nam vô địch trong Case 2:
      $ P(N | "Case 2") = P(N " thắng " P) dot.c 1/2 = 0.4 dot.c 0.5 = 0.20. $

  - *Tại Kịch bản 3 (Case 3: $H-P$ và $N-S$):*
    - Trận 1: Hải đấu Phong. Người thắng gặp Nam ở chung kết.
      - Hải thắng Phong với xác suất $1 - 0.8 = 0.2$.
      - Phong thắng Hải với xác suất $0.8$.
    - Trận 2: Nam đấu Sơn -> Nam thắng để vào chung kết với xác suất $1/2$.
    - Chung kết:
      - Nếu đối thủ là Hải: Nam thắng với xác suất $1/2$.
      - Nếu đối thủ là Phong: Nam thắng với xác suất $1 - 0.6 = 0.4$.
    - Xác suất Nam vô địch trong Case 3:
      $ P(N | "Case 3") = 1/2 dot.c [ 0.2 dot.c 1/2 + 0.8 dot.c 0.4 ] = 1/2 dot.c [ 0.10 + 0.32 ] = 0.21. $

  *Cộng xác suất các kịch bản để tìm kết quả chung cuộc:*
  $ P(N " vô địch") = 1/3 dot.c [ P(N | "Case 1") + P(N | "Case 2") + P(N | "Case 3") ] $
  $ P(N " vô địch") = 1/3 dot.c [ 0.225 + 0.20 + 0.21 ] = 1/3 dot.c 0.635 approx 21.17%. $
  
  *Kết luận:* Xác suất để tay vợt Nam vô địch giải đấu là *21.17%* (hay *$127/600$*).
]

#pagebreak()

= III. Bài Toán Mới: Đấu trường bóng bàn Gladiator (Tổ hợp & Xác suất nâng cao)

#compare-box(title: "🔍 Giới thiệu mô hình Gladiator Duel")[
  Đấu trường Gladiator (hay King of the Hill đồng đội) là thể thức thi đấu đối kháng đồng đội cực kỳ phổ biến. 
  Quy tắc chơi rất đơn giản: Đội thắng giữ bàn, đội thua bị loại người chơi và đưa người tiếp theo vào. Trận đấu tiếp diễn cho đến khi một đội bị loại sạch người chơi.
  Lớp bài toán này có hai khía cạnh cực kỳ hay:
  - *Tổ hợp (Đếm):* Đếm số kịch bản có thể xảy ra của giải đấu.
  - *Xác suất:* Tính toán khả năng vô địch dưới các điều kiện thực tế như *sự mệt mỏi* (fatigue) của người chơi vừa thắng và *sự chuẩn bị chiến thuật* (revenge) của người mới vào.
]

== 1. Phần Đếm Tổ Hợp: Số Cách Diễn Ra Giải Đấu

#eg-box(title: "🎯 Ví dụ 3.1 — Đếm số kịch bản cho giải đấu lớn (N = 7)")[
  Hai đội tuyển $A$ và $B$ tham gia giải bóng bàn. Mỗi đội có $7$ người đã được sắp xếp theo một thứ tự nhất định. 
  Đầu tiên, người thứ nhất của đội $A$ đấu với người thứ nhất của đội $B$, người thua bị loại. Người chiến thắng đấu tiếp với người thứ hai của đội kia, các trận thi đấu tiếp theo diễn ra tương tự. 
  Cuộc thi đấu kết thúc khi tất cả người chơi của $1$ đội đều bị loại và đội còn lại giành chiến thắng. Hỏi có bao nhiêu cách diễn ra cuộc thi đấu?
]

#cach1-box[
  *Phân tích bằng mô hình hóa chuỗi loại trừ:*
  Gọi số thành viên mỗi đội là $N = 7$. Giải đấu kết thúc ngay khi một đội có toàn bộ $N$ người bị loại.
  Mỗi kịch bản diễn ra giải đấu tương ứng với một chuỗi các lần loại trừ. Ta ghi nhận chữ cái của đội có thành viên bị loại:
  - Nếu đội $A$ thua cuộc (bị loại sạch 7 người), và đội $B$ có $k$ người bị loại ($0 \le k \le 6$):
    - Tổng số người bị loại trong giải đấu là $7 + k$.
    - Người cuối cùng bị loại bắt buộc phải là người thứ 7 của đội $A$.
    - Trong $6 + k$ lần loại trước đó, có đúng $6$ lần loại người của đội $A$ và $k$ lần loại người của đội $B$.
    - Số cách sắp xếp chuỗi loại trừ này là số cách chọn $k$ vị trí cho đội $B$ trong $6 + k$ vị trí:
      $ C_(6 + k)^k = frac((6 + k)!, k! dot.c 6!) $
  - Tổng số cách diễn ra giải đấu mà đội $A$ thua cuộc là:
    $ sum_(k=0)^6 C_(6 + k)^k = C_6^0 + C_7^1 + C_8^2 + C_9^3 + C_10^4 + C_11^5 + C_12^6 $
    Áp dụng công thức đồng nhất thức đường chéo (Hockey-stick identity):
    $ sum_(k=0)^6 C_(6 + k)^k = sum_(k=0)^6 C_(6 + k)^6 = C_13^7 = 1716 "cách." $
  - Do vai trò của đội $A$ and $B$ là đối xứng hoàn toàn, số cách diễn ra giải đấu mà đội $B$ thua cuộc cũng là $1716$ cách.
  
  *Kết luận:* Tổng số cách diễn ra giải đấu bóng bàn đồng đội là:
  $ 2 dot.c 1716 = 3432 "cách." $
]

#eg-box(title: "🎯 Ví dụ 3.2 — Đếm số kịch bản cho đội tuyển thu nhỏ (N = 3)")[
  Hai đội tuyển bóng bàn $A$ và $B$ tham gia giải đấu Gladiator. Mỗi đội có $3$ người chơi xếp theo thứ tự. 
  Quy tắc đấu tương tự như Ví dụ 3.1: Người thua bị loại, người thắng giữ bàn đấu tiếp với người tiếp theo của đối phương. Giải đấu kết thúc khi một đội bị loại sạch người chơi.
  Hãy tính số cách diễn ra cuộc thi đấu.
]

#cach1-box[
  *Phân tích tính toán số kịch bản:*
  Đặt $N = 3$. Đội thua cuộc bị loại sạch cả 3 người. Đội thắng cuộc có số người bị loại là $k$ ($0 \le k \le 2$).
  - Nếu đội $A$ thua cuộc (loại sạch 3 người), số người bị loại của đội $B$ là $k$ ($0 \le k \le 2$):
    - Tổng số người bị loại trong cả giải là $3 + k$ người.
    - Trận cuối cùng của giải đấu bắt buộc phải là trận người thứ 3 của đội $A$ bị loại (đội $A$ thua).
    - Trong $2 + k$ trận trước đó, có đúng $2$ trận người của đội $A$ bị loại và $k$ trận người của đội $B$ bị loại.
    - Số cách sắp xếp chuỗi loại người này là:
      $ C_(2 + k)^k = frac((2 + k)!, k! dot.c 2!) $
  - Tổng số cách giải đấu kết thúc mà đội $A$ thua là:
    $ sum_(k=0)^2 C_(2+k)^k = C_2^0 + C_3^1 + C_4^2 = 1 + 3 + 6 = 10 "cách." $
  - Do tính đối xứng, số cách giải đấu kết thúc mà đội $B$ thua cũng là $10$ cách.
  
  *Kết luận:* Tổng số cách diễn ra giải đấu cho hai đội có quy mô $N=3$ là:
  $ 2 dot.c 10 = 20 "cách." $
]

#pagebreak()

== 2. Sơ Đồ Cây Cho Trường Hợp Thu Nhỏ ($N = 2$)
Để trực quan hóa các kịch bản thi đấu trước khi đi vào phần xác suất phức tạp, ta xét trường hợp mỗi đội chỉ có $2$ người ($A_1, A_2$ và $B_1, B_2$). 
Theo công thức trên, số cách thi đấu là $2 dot.c sum_(k=0)^1 C_(1+k)^k = 2(C_1^0 + C_2^1) = 6$ cách. 

Dưới đây là sơ đồ cây biểu diễn đầy đủ 6 kịch bản này kèm theo các trọng số xác suất có điều kiện (với giả thiết về sự mệt mỏi được giới thiệu ở phần tiếp theo):

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[Trận 1
A1-B1])
    
    // Trận 2
    circle((4, 2), radius: 0.35, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "a1_w")
    content("a1_w", text(size: 7.5pt)[Trận 2
A1-B2])
    
    circle((4, -2), radius: 0.35, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "b1_w")
    content("b1_w", text(size: 7.5pt)[Trận 2
A2-B1])
    
    line("root", "a1_w.west", mark: (end: "stealth"))
    content((1.8, 1.3), text(size: 8pt)[$A_1$ thắng
0.5])
    line("root", "b1_w.west", mark: (end: "stealth"))
    content((1.8, -1.3), text(size: 8pt)[$B_1$ thắng
0.5])
    
    // Kết quả từ a1_w (Nhánh trên)
    circle((8, 3.2), radius: 0.3, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w20")
    content("w20", text(size: 7pt, fill: col-green, weight: "bold")[A 2-0])
    
    circle((8, 0.8), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "b2_w_t2")
    content("b2_w_t2", text(size: 7.5pt)[Trận 3
A2-B2])
    
    line("a1_w", "w20.west", mark: (end: "stealth"))
    content((5.8, 2.9), text(size: 7.5pt)[$A_1$ thắng
0.4])
    line("a1_w", "b2_w_t2.west", mark: (end: "stealth"))
    content((5.8, 1.1), text(size: 7.5pt)[$B_2$ thắng
0.6])
    
    // Kết quả từ b2_w_t2
    circle((12, 1.5), radius: 0.3, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w21a")
    content("w21a", text(size: 7pt, fill: col-green, weight: "bold")[A 2-1])
    
    circle((12, 0.1), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "l21a")
    content("l21a", text(size: 7pt, fill: col-red, weight: "bold")[B 2-1])
    
    line("b2_w_t2", "w21a.west", mark: (end: "stealth"))
    content((10.0, 1.4), text(size: 7.5pt)[$A_2$ thắng
0.6])
    line("b2_w_t2", "l21a.west", mark: (end: "stealth"))
    content((10.0, 0.2), text(size: 7.5pt)[$B_2$ thắng
0.4])
    
    // Kết quả từ b1_w (Nhánh dưới)
    circle((8, -3.2), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "l20")
    content("l20", text(size: 7pt, fill: col-red, weight: "bold")[B 2-0])
    
    circle((8, -0.8), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "a2_w_t2")
    content("a2_w_t2", text(size: 7.5pt)[Trận 3
A2-B2])
    
    line("b1_w", "l20.west", mark: (end: "stealth"))
    content((5.8, -2.9), text(size: 7.5pt)[$B_1$ thắng
0.4])
    line("b1_w", "a2_w_t2.west", mark: (end: "stealth"))
    content((5.8, -1.1), text(size: 7.5pt)[$A_2$ thắng
0.6])
    
    // Kết quả từ a2_w_t2
    circle((12, -0.1), radius: 0.3, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w21b")
    content("w21b", text(size: 7pt, fill: col-green, weight: "bold")[A 2-1])
    
    circle((12, -1.5), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "l21b")
    content("l21b", text(size: 7pt, fill: col-red, weight: "bold")[B 2-1])
    
    line("a2_w_t2", "w21b.west", mark: (end: "stealth"))
    content((10.0, -0.2), text(size: 7.5pt)[$A_2$ thắng
0.4])
    line("a2_w_t2", "l21b.west", mark: (end: "stealth"))
    content((10.0, -1.4), text(size: 7.5pt)[$B_2$ thắng
0.6])
  })
]

== 3. Phần Xác Suất Có Điều Kiện Nâng Cao (Yếu tố Mệt Mỏi)
#eg-box(title: "🎯 Ví dụ 3.3 — Giải đấu Gladiator đồng đội (N = 3) với yếu tố mệt mỏi")[
  Hai đội tuyển bóng bàn $A$ và $B$ thi đấu giải Gladiator với số người mỗi đội là $N = 3$. 
  Do thi đấu liên tục, người vừa thắng trận trước sẽ bị giảm thể lực ở trận đấu tiếp theo với người mới vào của đối phương. Cụ thể quy tắc xác suất thắng như sau:
  - Nếu hai đấu thủ đều là người mới vào bàn (chưa đấu trận nào hoặc cả hai cùng đấu trận đầu), xác suất thắng của mỗi người là $0.5$.
  - Nếu một đấu thủ vừa thắng trận trước và giữ bàn (bị mệt), đấu với một đấu thủ fresh vừa vào bàn của đối phương, xác suất người giữ bàn thắng bị giảm xuống còn $0.4$ (và người mới vào thắng với xác suất $0.6$).
  
  Tính xác suất để đội $A$ thắng chung cuộc.
]

#cach2-box[
  *Phân tích các nhánh chiến thắng của đội $A$ từ sơ đồ cây trạng thái:*
  
  Gọi trạng thái thi đấu là $(a, b, X)$ với $a, b$ lần lượt là số người bị loại của đội $A$ và $B$, còn $X in {A, B, nothing}$ là đội của đấu thủ vừa thắng trận trước (đang bị mệt).
  Đội $A$ thắng giải đấu nếu đạt trạng thái $(a, 3, A)$ với $a < 3$. Ta tính xác suất theo các trường hợp số người bị loại của $A$:
  
  - *Trường hợp 1: Đội A thắng 3-0 (Đội A không mất người nào, a = 0):*
    - Trận 1: $(0,0,nothing) -> A_1$ thắng với xác suất $0.5$. Trạng thái trở thành $(0,1,A)$.
    - Trận 2: $A_1$ (mệt) vs $B_2$ -> $A_1$ thắng với xác suất $0.4$. Trạng thái trở thành $(0,2,A)$.
    - Trận 3: $A_1$ (mệt) vs $B_3$ -> $A_1$ thắng với xác suất $0.4$. Trạng thái là $(0,3,A)$ (A thắng chung cuộc 3-0).
    - Xác suất kịch bản này là:
      $ P(A " thắng 3-0") = 0.5 dot.c 0.4 dot.c 0.4 = 0.08. $
      
  - *Trường hợp 2: Đội A thắng 3-1 (Đội A mất đúng 1 người, a = 1):*
    Có đúng 3 nhánh dẫn đến kết quả này:
    - *Nhánh 2.1:* $(0,0,nothing) arrow.r^(0.5) (0,1,A) arrow.r^(0.4) (0,2,A) arrow.r^(0.6) (1,2,B) arrow.r^(0.6) (1,3,A)$. 
      Xác suất: $0.5 dot.c 0.4 dot.c 0.6 dot.c 0.6 = 0.072$.
    - *Nhánh 2.2:* $(0,0,nothing) arrow.r^(0.5) (0,1,A) arrow.r^(0.6) (1,1,B) arrow.r^(0.6) (1,2,A) arrow.r^(0.4) (1,3,A)$. 
      Xác suất: $0.5 dot.c 0.6 dot.c 0.6 dot.c 0.4 = 0.072$.
    - *Nhánh 2.3:* $(0,0,nothing) arrow.r^(0.5) (1,0,B) arrow.r^(0.6) (1,1,A) arrow.r^(0.4) (1,2,A) arrow.r^(0.4) (1,3,A)$. 
      Xác suất: $0.5 dot.c 0.6 dot.c 0.4 dot.c 0.4 = 0.048$.
    - Tổng xác suất thắng 3-1 của $A$ là:
      $ P(A " thắng 3-1") = 0.072 + 0.072 + 0.048 = 0.192. $
      
  - *Trường hợp 3: Đội A thắng 3-2 (Đội A mất đúng 2 người, a = 2):*
    Vì giải đấu là đối xứng hoàn toàn giữa $A$ và $B$ (mọi quy tắc mệt mỏi áp dụng như nhau), xác suất thắng giải của đội $A$ và $B$ phải bằng nhau và bằng $0.5$. Do đó:
    $ P(A " thắng") = P(A " thắng 3-0") + P(A " thắng 3-1") + P(A " thắng 3-2") = 0.5 $
    Từ đây ta suy ra ngay xác suất của trường hợp thắng sát nút 3-2 là:
    $ P(A " thắng 3-2") = 0.5 - 0.08 - 0.192 = 0.228. $
    
  *Kết luận:* Xác suất để đội $A$ thắng chung cuộc là *0.5* (hoặc *50%*). Xác suất các kịch bản tỉ số lần lượt là: *8%* (thắng 3-0), *19.2%* (thắng 3-1), và *22.8%* (thắng 3-2).
]

#eg-box(title: "🎯 Ví dụ 3.4 — Giải đấu Gladiator quy mô thu nhỏ (N = 2) với thể lực thay đổi")[
  Hai đội tuyển $A$ và $B$ tham gia giải bóng bàn Gladiator. Mỗi đội có đúng $2$ người chơi ($A_1, A_2$ và $B_1, B_2$).
  Quy tắc mệt mỏi tương tự Ví dụ 3.3:
  - Trận đấu giữa hai người chơi mới (fresh) hoặc cùng đấu trận đầu có xác suất thắng mỗi bên là $0.5$.
  - Người giữ bàn (vừa thắng trận trước, mệt) đấu với người mới vào của đối phương chỉ có xác suất thắng là $0.4$ (đối thủ thắng là $0.6$).
  
  Hãy tính xác suất để đội $A$ thắng chung cuộc và xác suất cho từng tỷ số thắng ($2-0$ hoặc $2-1$).
]

#cach1-box[
  *Phân tích các nhánh kịch bản trên sơ đồ cây:*
  Gọi trạng thái là $(a, b, X)$ như ở Ví dụ 3.3. Giải đấu kết thúc khi một đội đạt 2 người bị loại.
  
  - *Nhánh 1: Đội A thắng 2-0 (A không bị loại ai, a = 0):*
    - Trận 1: $(0,0,nothing) -> A_1$ thắng $B_1$ với xác suất $0.5$. Trạng thái thành $(0,1,A)$.
    - Trận 2: $A_1$ (mệt) đấu $B_2$ -> $A_1$ thắng với xác suất $0.4$. Trạng thái thành $(0,2,A)$ (A thắng 2-0).
    - Xác suất:
      $ P(A " thắng 2-0") = 0.5 dot.c 0.4 = 0.20 = 20%. $

  - *Nhánh 2: Đội A thắng 2-1 (A bị loại đúng 1 người, a = 1):*
    Có đúng 2 kịch bản dẫn đến kết quả này:
    - *Nhánh 2.1:* $(0,0,nothing) arrow.r^(0.5) (0,1,A)$ ($A_1$ thắng) $arrow.r^(0.6) (1,1,B)$ ($B_2$ thắng $A_1$) $arrow.r^(0.6) (1,2,A)$ ($A_2$ thắng $B_2$).
      - Lưu ý ở trận cuối, $B_2$ vừa thắng $A_1$ nên bị mệt, đấu với $A_2$ mới vào bàn. Do đó xác suất $A_2$ thắng $B_2$ là $0.6$.
      - Xác suất: $0.5 dot.c 0.6 dot.c 0.6 = 0.18$.
    - *Nhánh 2.2:* $(0,0,nothing) arrow.r^(0.5) (1,0,B)$ ($B_1$ thắng $A_1$) $arrow.r^(0.6) (1,1,A)$ ($A_2$ thắng $B_1$) $arrow.r^(0.4) (1,2,A)$ ($A_2$ thắng $B_2$).
      - Ở trận 2, $B_1$ (mệt) vs $A_2$ (fresh) -> $A_2$ thắng với xác suất $0.6$. Trạng thái thành $(1,1,A)$.
      - Ở trận 3, $A_2$ (mệt) vs $B_2$ (fresh) -> $A_2$ thắng với xác suất $0.4$.
      - Xác suất: $0.5 dot.c 0.6 dot.c 0.4 = 0.12$.
      
    - Tổng xác suất A thắng 2-1:
      $ P(A " thắng 2-1") = 0.18 + 0.12 = 0.30 = 30%. $
]

#cach2-box[
  *Kết luận chung cuộc:*
  Xác suất đội $A$ thắng giải đấu bằng tổng xác suất của các trường hợp thắng:
  $ P(A " thắng") = P(A " thắng 2-0") + P(A " thắng 2-1") = 0.20 + 0.30 = 0.50 = 50%. $
  
  Do tính đối xứng hoàn toàn giữa hai đội, xác suất vô địch của mỗi đội là $50\%$. Tuy nhiên, việc chia nhỏ kịch bản cho thấy:
  - Xác suất đội A thắng $2-0$ là $20\%$.
  - Xác suất đội A thắng $2-1$ là $30\%$.
  - Tương tự, xác suất đội B thắng $2-0$ là $20\%$ và thắng $2-1$ là $30\%$.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV. BÀI TOÁN MỚI 2 (TAM HÙNG THĂNG HOA)
// ═══════════════════════════════════════════════
= IV. Bài Toán Mới 2: Giải đấu "Tam Hùng Thăng Hoa" (Trạng thái động & Dynamic Momentum)

Để tiếp tục nâng tầm tư duy chuyên đề, chúng ta sẽ khảo sát một mô hình giải đấu cực kỳ hiện đại và thực tế: *Giải đấu có phong độ thay đổi liên tục*. Trong thể thao chuyên nghiệp, đấu thủ vừa giành chiến thắng thường có đà tâm lý tốt và cảm giác bóng thăng hoa (Momentum). Điều này khiến xác suất thắng của họ ở trận tiếp theo tăng lên đối với người chơi mới từ ghế dự bị.

#eg-box(title: "🎯 Ví dụ 4.1 — Tam Hùng Thăng Hoa chạm 2 điểm với hệ số momentum (+0.1)")[
  Ba đấu thủ cờ vua $A$, $B$ và $C$ tham gia giải đấu thách đấu "Tam Hùng Thăng Hoa" với luật chơi như sau:
  - Ban đầu, cả 3 người đều có 0 điểm.
  - *Trận 1:* $A$ đấu với $B$. Do cả hai đều chưa có điểm hay phong độ ưu thế, xác suất thắng của mỗi bên là $0.5$.
  - Người thắng mỗi trận sẽ giữ bàn đấu (ở lại bàn) để đấu tiếp với người ở ghế dự bị trong trận tiếp theo. Người thua ra ghế dự bị đợi.
  - *Sự thăng hoa phong độ (Dynamic Momentum):* Xác suất người giữ bàn đấu ($W$) thắng đối thủ mới vào bàn ($C_h$) được tính dựa trên hiệu số điểm hiện tại của họ:
    $ P(W " thắng " C_h) = 0.5 + 0.1 dot.c (S_W - S_(C_h)) $
    trong đó $S_W$ là số điểm của người giữ bàn, $S_(C_h)$ là số điểm của người thách đấu vừa vào bàn. Xác suất thắng của người mới vào bàn là phần bù còn lại.
  - Giải đấu kết thúc ngay khi có một đấu thủ tích lũy đủ $S = 2$ điểm. Người đó sẽ giành chức vô địch.

  1. Hãy lập sơ đồ cây xác suất đầy đủ để tính xác suất vô địch của mỗi đấu thủ $A$, $B$ và $C$.
  2. Thiết lập hệ phương trình trạng thái Markov tổng quát cho trường hợp giải đấu yêu cầu chạm $S = 3$ điểm để vô địch.
]

== 1. Vẽ Sơ Đồ Cây Xác Suất Cho Trường Hợp Chạm 2 Điểm ($S = 2$)

Để mô tả chính xác trạng thái của giải đấu, ta ký hiệu trạng thái dưới dạng:
$ (s_A, s_B, s_C; W, L) $
Trong đó:
- $s_A, s_B, s_C$ là số điểm hiện tại của $A$, $B$, $C$.
- $W$ là đấu thủ vừa thắng trận trước (đang giữ bàn).
- $L$ là đấu thủ vừa thua trận trước (đang ra ghế dự bị).
- Đấu thủ còn lại sẽ là người thách đấu từ ghế dự bị bước vào.

Do quy tắc thăng hoa, xác suất thắng ở mỗi trận thay đổi theo từng bước:
- *Trận 1:* $A$ vs $B$ ($s_A = s_B = 0$). Xác suất: $P(A " thắng") = 0.5$, $P(B " thắng") = 0.5$.
  - Nếu $A$ thắng: Trạng thái trở thành $(1,0,0; A, B)$, trận tiếp theo là $A$ vs $C$.
  - Nếu $B$ thắng: Trạng thái trở thành $(0,1,0; B, A)$, trận tiếp theo là $B$ vs $C$.
- *Trận 2 (Nhánh A thắng Trận 1):* Trận đấu diễn ra giữa $A$ (giữ bàn, $s_A = 1$) và $C$ (challenger, $s_C = 0$).
  Hiệu số điểm là $s_A - s_C = 1 - 0 = 1$.
  Xác suất $A$ thắng là: $0.5 + 0.1 dot.c 1 = 0.6$. Nếu $A$ thắng, $A$ đạt 2 điểm và vô địch.
  Xác suất $C$ thắng là: $1 - 0.6 = 0.4$. Trạng thái trở thành $(1,0,1; C, A)$, trận tiếp theo là $C$ vs $B$.
- *Trận 3 (Nhánh C thắng Trận 2):* Trận đấu diễn ra giữa $C$ (giữ bàn, $s_C = 1$) và $B$ (challenger, $s_B = 0$).
  Hiệu số điểm là $s_C - s_B = 1 - 0 = 1$.
  Xác suất $C$ thắng là: $0.5 + 0.1 dot.c 1 = 0.6$. Nếu $C$ thắng, $C$ đạt 2 điểm và vô địch.
  Xác suất $B$ thắng là: $1 - 0.6 = 0.4$. Trạng thái trở thành $(1,1,1; B, C)$, trận tiếp theo là $B$ vs $A$.
- *Trận 4 (Nhánh B thắng Trận 3):* Trận đấu diễn ra giữa $B$ (giữ bàn, $s_B = 1$) và $A$ (challenger, $s_A = 1$).
  Hiệu số điểm là $s_B - s_A = 1 - 1 = 0$.
  Xác suất $B$ thắng là: $0.5 + 0.1 dot.c 0 = 0.5$. Nếu $B$ thắng, $B$ đạt 2 điểm và vô địch.
  Xác suất $A$ thắng là: $1 - 0.5 = 0.5$. Nếu $A$ thắng, $A$ đạt 2 điểm và vô địch.

Dưới đây là sơ đồ cây biểu diễn toàn bộ các kịch bản thi đấu dẫn đến chức vô địch của $A, B$ và $C$ với mốc điểm $S = 2$:

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.45, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 7.5pt, weight: "bold")[*Bắt đầu* \ (0,0,0)])
    
    // Vòng 1
    circle((2.5, 3.5), radius: 0.8, fill: rgb("FFF8E1"), stroke: 1.2pt + col-amber, name: "t1_a")
    content("t1_a", text(size: 7pt)[*(1,0,0; A,B)*])
    
    circle((2.5, -3.5), radius: 0.8, fill: rgb("FFF8E1"), stroke: 1.2pt + col-amber, name: "t1_b")
    content("t1_b", text(size: 7pt)[*(0,1,0; B,A)*])
    
    line("root", "t1_a.west", mark: (end: "stealth"))
    content((1.0, 2.4), text(size: 7.5pt)[$A$ thắng \ 0.5])
    
    line("root", "t1_b.west", mark: (end: "stealth"))
    content((1.0, -2.4), text(size: 7.5pt)[$B$ thắng \ 0.5])
    
    // Nhánh A thắng Trận 1
    circle((6.5, 5.0), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_a_t2")
    content("win_a_t2", text(size: 7pt, fill: col-green, weight: "bold")[*A thắng* \ (2,0,0)])
    
    circle((6.5, 2.0), radius: 0.8, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_c")
    content("t2_c", text(size: 7pt)[*(1,0,1; C,A)*])
    
    line("t1_a", "win_a_t2.west", mark: (end: "stealth"))
    content((4.4, 4.85), text(size: 7pt)[$A$ thắng \ 0.6])
    
    line("t1_a", "t2_c.west", mark: (end: "stealth"))
    content((4.4, 2.15), text(size: 7pt)[$C$ thắng \ 0.4])
    
    // Nhánh C thắng Trận 2
    circle((10.5, 3.2), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_c_t3")
    content("win_c_t3", text(size: 7pt, fill: col-green, weight: "bold")[*C thắng* \ (1,0,2)])
    
    circle((10.5, 0.8), radius: 0.8, fill: rgb("F3E5F5"), stroke: 1.2pt + col-violet, name: "t3_b")
    content("t3_b", text(size: 7pt)[*(1,1,1; B,C)*])
    
    line("t2_c", "win_c_t3.west", mark: (end: "stealth"))
    content((8.4, 3.1), text(size: 7pt)[$C$ thắng \ 0.6])
    
    line("t2_c", "t3_b.west", mark: (end: "stealth"))
    content((8.4, 0.9), text(size: 7pt)[$B$ thắng \ 0.4])
    
    // Trận 4 từ t3_b
    circle((14.5, 1.6), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_b_t4")
    content("win_b_t4", text(size: 7pt, fill: col-green, weight: "bold")[*B thắng* \ (1,2,1)])
    
    circle((14.5, 0.4), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_a_t4")
    content("win_a_t4", text(size: 7pt, fill: col-green, weight: "bold")[*A thắng* \ (2,1,1)])
    
    line("t3_b", "win_b_t4.west", mark: (end: "stealth"))
    content((12.4, 1.7), text(size: 7pt)[$B$ thắng \ 0.5])
    
    line("t3_b", "win_a_t4.west", mark: (end: "stealth"))
    content((12.4, 0.1), text(size: 7pt)[$A$ thắng \ 0.5])
    
    // -------------------------------------------------------------
    // Nhánh B thắng Trận 1 (Đối xứng hoàn toàn)
    circle((6.5, -5.0), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_b_t2")
    content("win_b_t2", text(size: 7pt, fill: col-green, weight: "bold")[*B thắng* \ (0,2,0)])
    
    circle((6.5, -2.0), radius: 0.8, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_d")
    content("t2_d", text(size: 7pt)[*(0,1,1; C,B)*])
    
    line("t1_b", "win_b_t2.west", mark: (end: "stealth"))
    content((4.4, -4.85), text(size: 7pt)[$B$ thắng \ 0.6])
    
    line("t1_b", "t2_d.west", mark: (end: "stealth"))
    content((4.4, -2.15), text(size: 7pt)[$C$ thắng \ 0.4])
    
    // Nhánh C thắng Trận 2 (phía dưới)
    circle((10.5, -3.2), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_c_t3_sym")
    content("win_c_t3_sym", text(size: 7pt, fill: col-green, weight: "bold")[*C thắng* \ (0,1,2)])
    
    circle((10.5, -0.8), radius: 0.8, fill: rgb("F3E5F5"), stroke: 1.2pt + col-violet, name: "t3_a")
    content("t3_a", text(size: 7pt)[*(1,1,1; A,C)*])
    
    line("t2_d", "win_c_t3_sym.west", mark: (end: "stealth"))
    content((8.4, -3.1), text(size: 7pt)[$C$ thắng \ 0.6])
    
    line("t2_d", "t3_a.west", mark: (end: "stealth"))
    content((8.4, -0.9), text(size: 7pt)[$A$ thắng \ 0.4])
    
    // Trận 4 từ t3_a
    circle((14.5, -0.4), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_b_t4_sym")
    content("win_b_t4_sym", text(size: 7pt, fill: col-green, weight: "bold")[*B thắng* \ (1,2,1)])
    
    circle((14.5, -1.6), radius: 0.6, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_a_t4_sym")
    content("win_a_t4_sym", text(size: 7pt, fill: col-green, weight: "bold")[*A thắng* \ (2,1,1)])
    
    line("t3_a", "win_b_t4_sym.west", mark: (end: "stealth"))
    content((12.4, -0.1), text(size: 7pt)[$B$ thắng \ 0.5])
    
    line("t3_a", "win_a_t4_sym.west", mark: (end: "stealth"))
    content((12.4, -1.7), text(size: 7pt)[$A$ thắng \ 0.5])
  })
]

== 2. Tính Toán Chi Tiết Xác Suất Vô Địch Của Mỗi Đấu Thủ ($S = 2$)

#cach1-box[
  *Phân tích theo Quy tắc Nhân và Cộng trên sơ đồ cây:*

  Ta có 8 nhánh rời nhau trên sơ đồ cây dẫn đến kết quả cuối cùng. Do tính chất đối xứng hoàn toàn giữa $A$ và $B$ ở trận 1 và cơ chế tính điểm, ta thấy xác suất vô địch của $A$ và $B$ sẽ bằng nhau.
  
  - *Xác suất đấu thủ A vô địch ($P_A$):*
    Đấu thủ $A$ vô địch ở các nhánh:
    - Nhánh 1 (A thắng thẳng từ đầu): $P_("N1") = 0.5 dot.c 0.6 = 0.30$.
    - Nhánh 4 (A thắng Trận 1, thua Trận 2, nhưng thắng Trận 4): $P_("N4") = 0.5 dot.c 0.4 dot.c 0.4 dot.c 0.5 = 0.04$.
    - Nhánh 8 (B thắng Trận 1, C thắng Trận 2, A thắng Trận 3 và 4): $P_("N8") = 0.5 dot.c 0.4 dot.c 0.4 dot.c 0.5 = 0.04$.
    
    Cộng xác suất các kịch bản này:
    $ P_A = 0.30 + 0.04 + 0.04 = 0.38. $
    Như vậy, xác suất vô địch của $A$ là 38%.

  - *Xác suất đấu thủ B vô địch ($P_B$):*
    Tương tự như $A$ do tính đối xứng:
    - Nhánh 5 (B thắng thẳng từ đầu): $P_("N5") = 0.5 dot.c 0.6 = 0.30$.
    - Nhánh 3 (A thắng Trận 1, C thắng Trận 2, B thắng Trận 3 và 4): $P_("N3") = 0.5 dot.c 0.4 dot.c 0.4 dot.c 0.5 = 0.04$.
    - Nhánh 7 (B thắng Trận 1, thua Trận 2, nhưng thắng Trận 4): $P_("N7") = 0.5 dot.c 0.4 dot.c 0.4 dot.c 0.5 = 0.04$.
    
    Cộng xác suất các kịch bản này:
    $ P_B = 0.30 + 0.04 + 0.04 = 0.38. $
    Như vậy, xác suất vô địch của $B$ cũng là 38%.

  - *Xác suất đấu thủ C vô địch ($P_C$):*
    Đấu thủ $C$ vô địch ở các nhánh:
    - Nhánh 2 (A thắng Trận 1, C thắng Trận 2 và 3): $P_("N2") = 0.5 dot.c 0.4 dot.c 0.6 = 0.12$.
    - Nhánh 6 (B thắng Trận 1, C thắng Trận 2 và 3): $P_("N6") = 0.5 dot.c 0.4 dot.c 0.6 = 0.12$.
    
    Cộng xác suất các kịch bản này:
    $ P_C = 0.12 + 0.12 = 0.24. $
    Như vậy, xác suất vô địch của $C$ là 24%.
]

#note-box(title: "📌 Phân Tích Nhận Xét Chiến Thuật")[
  - *Tổng xác suất:* $P_A + P_B + P_C = 38 \% + 38 \% + 24 \% = 100 \% $.
  - *Sự bất lợi của đấu thủ C:* Mặc dù không phải thi đấu trận đầu tiên (có vẻ giữ sức), đấu thủ $C$ lại có xác suất thắng thấp nhất (chỉ 24% so với 38% của $A$ và $B$). 
  - *Nguyên nhân cốt lõi:* $C$ luôn phải bước vào bàn đấu để gặp một đối thủ vừa thắng trận trước (đang có phong độ thăng hoa với điểm số hiệu số là $1 - 0 = 1$), do đó $C$ bị đẩy vào thế bất lợi ngay từ đầu (chỉ có 40% cơ hội thắng trận ra mắt). Điều này minh họa sâu sắc tác động của yếu tố tâm lý/phong độ trong thi đấu nhiều giai đoạn.
]

#eg-box(title: "🎯 Ví dụ 4.2 — Tam Hùng Thăng Hoa chạm 2 điểm với hệ số momentum cao hơn (+0.15)")[
  Xét một giải đấu Tam Hùng Thăng Hoa tương tự như Ví dụ 4.1, nhưng hệ số thăng hoa phong độ (dynamic momentum) được nâng cao lên $0.15$ (phản ánh giải đấu có tính thăng hoa tâm lý mạnh mẽ hơn):
  $ P(W " thắng " C_h) = 0.5 + 0.15 dot.c (S_W - S_(C_h)) $
  Xác định xác suất vô địch của mỗi kỳ thủ $A, B$ và $C$ khi mốc điểm vô địch vẫn chạm $2$.
]

#cach1-box[
  *Phân tích các thay đổi về xác suất chuyển trên sơ đồ cây:*
  Do hệ số thay đổi thành $0.15$:
  - Trận 1: $A$ vs $B$ ($s_A = s_B = 0$) -> xác suất thắng mỗi bên vẫn là $0.5$.
  - Trận 2: Người thắng Trận 1 (đang có 1 điểm) đấu với $C$ (0 điểm).
    Hiệu số điểm là $1 - 0 = 1$.
    Xác suất người giữ bàn thắng là: $0.5 + 0.15 dot.c 1 = 0.65$. (Nếu thắng thì vô địch luôn).
    Xác suất $C$ thắng là: $1 - 0.65 = 0.35$.
  - Trận 3: Nếu $C$ thắng Trận 2, $C$ (1 điểm) đấu với người thua Trận 1 (0 điểm).
    Hiệu số điểm là $1 - 0 = 1$.
    Xác suất $C$ thắng tiếp là: $0.5 + 0.15 dot.c 1 = 0.65$. (Nếu thắng thì vô địch luôn).
    Xác suất challenger thắng là: $1 - 0.65 = 0.35$.
  - Trận 4: Nếu challenger thắng Trận 3, lúc này cả 3 kỳ thủ đều có 1 điểm.
    Trận đấu diễn ra giữa người giữ bàn (1 điểm) và challenger (1 điểm).
    Hiệu số điểm là $1 - 1 = 0$.
    Xác suất thắng mỗi bên quay về: $0.5 + 0.15 dot.c 0 = 0.5$.
]

#cach2-box[
  *Tính toán cụ thể xác suất vô địch của mỗi người:*
  
  Do đối xứng, ta vẫn có $P_A = P_B$.
  - *Xác suất đấu thủ A vô địch ($P_A$):*
    A vô địch ở các nhánh:
    - Nhánh 1 (A thắng thẳng 2 trận): $0.5 dot.c 0.65 = 0.325$.
    - Nhánh 4 (A thắng Trận 1, thua Trận 2, B thắng Trận 3, A thắng Trận 4): $0.5 dot.c 0.35 dot.c 0.35 dot.c 0.5 = 0.030625$.
    - Nhánh 8 (B thắng Trận 1, C thắng Trận 2, A thắng Trận 3 và 4): $0.5 dot.c 0.35 dot.c 0.35 dot.c 0.5 = 0.030625$.
    
    Cộng xác suất:
    $ P_A = 0.325 + 0.030625 + 0.030625 = 0.38625 = 38.625%. $
    
  - *Xác suất đấu thủ B vô địch ($P_B$):*
    Do tính đối xứng:
    $ P_B = P_A = 38.625%. $
    
  - *Xác suất đấu thủ C vô địch ($P_C$):*
    C vô địch ở các nhánh:
    - Nhánh 2 (A thắng Trận 1, C thắng Trận 2 và 3): $0.5 dot.c 0.35 dot.c 0.65 = 0.11375$.
    - Nhánh 6 (B thắng Trận 1, C thắng Trận 2 và 3): $0.5 dot.c 0.35 dot.c 0.65 = 0.11375$.
    
    Cộng xác suất:
    $ P_C = 0.11375 + 0.11375 = 0.2275 = 22.75%. $
    
  *Nhận xét:*
  Khi tăng hệ số thăng hoa phong độ (momentum) lên $0.15$, xác suất vô địch của $C$ giảm từ $24\%$ xuống còn $22.75\%$, trong khi xác suất của $A$ và $B$ tăng từ $38\%$ lên $38.625\%$. Điều này cho thấy khi yếu tố thăng hoa phong độ càng mạnh, sự bất lợi của đấu thủ vào sau ($C$) càng trở nên nghiêm trọng do đối thủ giữ bàn có ưu thế quá lớn.
]

== 3. Mô Hình Markov Xích Cho Trường Hợp Tổng Quát ($S = 3$)

Khi mốc điểm vô địch nâng lên chạm 3 ($S = 3$), số trận đấu tăng lên rất nhiều và có thể xuất hiện chu kỳ lặp vô hạn (không có điểm dừng cố định trên cây). Khi đó, phương pháp vẽ cây thông thường sẽ bị quá tải. Chúng ta bắt buộc phải sử dụng *Mô hình Xích Markov chuyển trạng thái*.

Ta định nghĩa các trạng thái của giải đấu dưới dạng bộ 5 chỉ số:
$ (s_A, s_B, s_C; W, L) $
Trong đó:
- $s_A, s_B, s_C in {0, 1, 2}$ là số điểm hiện tại của mỗi người chơi.
- $W in {A, B, C}$ là đấu thủ vừa thắng trận trước và đang giữ bàn.
- $L in {A, B, C}$ là đấu thủ vừa thua trận trước và đang ở ghế dự bị.
- Đấu thủ còn lại sẽ là người thách đấu challenger vừa vào bàn.

Gọi $V_A (s_A, s_B, s_C; W, L)$ là xác suất để kỳ thủ $A$ vô địch khi giải đấu bắt đầu tại trạng thái $(s_A, s_B, s_C; W, L)$.

=== Thiết lập hệ phương trình chuyển đổi xác suất (Transition Equations)

Với trạng thái $(s_A, s_B, s_C; A, B)$ (tức $A$ giữ bàn đấu với $C$):
- Xác suất $A$ thắng là: $p_1 = 0.5 + 0.1(s_A - s_C)$.
- Nếu $A$ thắng:
  - Nếu $s_A + 1 = 3$, $A$ vô địch: $V_A (3, s_B, s_C; A, B) = 1$.
  - Nếu $s_A + 1 < 3$, trạng thái trở thành $(s_A + 1, s_B, s_C; A, C)$.
- Nếu $C$ thắng (xác suất $1 - p_1$):
  - Nếu $s_C + 1 = 3$, $C$ vô địch, nên xác suất để $A$ vô địch bằng $0$: $V_A (s_A, s_B, 3; C, A) = 0$.
  - Nếu $s_C + 1 < 3$, trạng thái trở thành $(s_A, s_B, s_C + 1; C, A)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; A, B) = p_1 dot.c V_A (s_A + 1, s_B, s_C; A, C) + (1-p_1) dot.c V_A (s_A, s_B, s_C + 1; C, A) $

Với trạng thái $(s_A, s_B, s_C; A, C)$ (tức $A$ giữ bàn đấu với $B$):
- Xác suất $A$ thắng là: $p_2 = 0.5 + 0.1(s_A - s_B)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; A, C) = p_2 dot.c V_A (s_A + 1, s_B, s_C; A, B) + (1-p_2) dot.c V_A (s_A, s_B + 1, s_C; B, A) $

Với trạng thái $(s_A, s_B, s_C; B, A)$ (tức $B$ giữ bàn đấu với $C$):
- Xác suất $B$ thắng là: $q_1 = 0.5 + 0.1(s_B - s_C)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; B, A) = q_1 dot.c V_A (s_A, s_B + 1, s_C; B, C) + (1-q_1) dot.c V_A (s_A, s_B, s_C + 1; C, B) $

Với trạng thái $(s_A, s_B, s_C; B, C)$ (tức $B$ giữ bàn đấu với $A$):
- Xác suất $B$ thắng là: $q_2 = 0.5 + 0.1(s_B - s_A)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; B, C) = q_2 dot.c V_A (s_A, s_B + 1, s_C; B, A) + (1-q_2) dot.c V_A (s_A + 1, s_B, s_C; A, B) $

Với trạng thái $(s_A, s_B, s_C; C, A)$ (tức $C$ giữ bàn đấu với $B$):
- Xác suất $C$ thắng là: $r_1 = 0.5 + 0.1(s_C - s_B)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; C, A) = r_1 dot.c V_A (s_A, s_B, s_C + 1; C, B) + (1-r_1) dot.c V_A (s_A, s_B + 1, s_C; B, C) $

Với trạng thái $(s_A, s_B, s_C; C, B)$ (tức $C$ giữ bàn đấu với $A$):
- Xác suất $C$ thắng là: $r_2 = 0.5 + 0.1(s_C - s_A)$.
- Phương trình đệ quy:
  $ V_A (s_A, s_B, s_C; C, B) = r_2 dot.c V_A (s_A, s_B, s_C + 1; C, A) + (1-r_2) dot.c V_A (s_A + 1, s_B, s_C; A, C) $

=== Các điều kiện biên (Boundary Conditions):
- $V_A (3, s_B, s_C; A, L) = 1$ với mọi $s_B, s_C < 3$ và $L in {B, C}$.
- $V_A (s_A, 3, s_C; B, L) = 0$ với mọi $s_A, s_C < 3$ và $L in {A, C}$ (B vô địch).
- $V_A (s_A, s_B, 3; C, L) = 0$ với mọi $s_A, s_B < 3$ và $L in {A, B}$ (C vô địch).

Từ trạng thái ban đầu, Trận 1 là $A$ vs $B$ (mỗi người thắng với xác suất $0.5$):
- Nếu $A$ thắng, giải đấu chuyển sang trạng thái $(1, 0, 0; A, B)$.
- Nếu $B$ thắng, giải đấu chuyển sang trạng thái $(0, 1, 0; B, A)$.
Do đó, xác suất vô địch chung cuộc của $A$ từ đầu giải đấu được tính bằng:
$ P(A " vô địch") = 0.5 dot.c V_A (1, 0, 0; A, B) + 0.5 dot.c V_A (0, 1, 0; B, A) $

Bằng cách thiết lập toàn bộ hệ phương trình tuyến tính gồm các biến trung gian và giải hệ bằng các công cụ đại số tuyến tính, ta sẽ tìm được giá trị chính xác cho trường hợp $S = 3$.

== 4. Hệ Thống Bài Tập Phát Triển & Đề Thi Minh Họa (High-School Exam Style)

Dưới đây là một số lớp bài toán phát triển được thiết kế theo phong cách đề thi học sinh giỏi (HSG) và đề thi Đánh giá năng lực (ĐGNL) phổ thông, kết hợp các kịch bản nhiều giai đoạn, hiệu số điểm đổi xác suất, và xác suất có điều kiện.

#eg-box(title: "📝 Bài tập 1: Giải đấu \"Song Hùng Tranh Bá\" (Chạm 3, Chuỗi thắng đổi phong độ)")[
  Hai đấu thủ cờ vua $A$ và $B$ thi đấu giải "Song Hùng Tranh Bá". Ban đầu cả hai cùng có $0$ điểm. Trận thứ nhất, xác suất thắng của mỗi bên là $0.5$.
  Từ trận thứ hai trở đi, xác suất thắng của mỗi người thay đổi dựa trên kết quả trận đấu trước đó:
  - Nếu một người vừa thắng trận liền trước, sự hưng phấn giúp xác suất thắng trận tiếp theo của họ tăng lên thành $0.6$.
  - Nếu một người vừa thắng liên tiếp từ 2 trận trở lên trước đó, tinh thần thăng hoa cực độ giúp xác suất thắng trận tiếp theo tăng lên thành $0.7$.
  - Giải đấu kết thúc ngay khi có một đấu thủ tích lũy đủ $3$ điểm.
  
  a) Hãy lập sơ đồ cây xác suất rút gọn biểu diễn toàn bộ kịch bản dẫn đến $A$ vô địch.
  
  b) Tính xác suất để kỳ thủ $A$ vô địch với tỉ số cách biệt tuyệt đối là 3-0.
  
  c) Tính xác suất kỳ thủ $A$ vô địch chung cuộc.
]

#cach1-box[
  *Lời giải chi tiết:*
  
  a) Ký hiệu chuỗi kết quả thắng theo trận đấu. Ví dụ $A A B$ nghĩa là trận 1 $A$ thắng, trận 2 $A$ thắng, trận 3 $B$ thắng.
  Do tính chất đối xứng hoàn toàn, kỳ thủ $A$ thắng chung cuộc với xác suất là $50\%$. Tuy nhiên, việc tính toán cụ thể các kịch bản tỉ số giúp học sinh hiểu rõ cơ cấu xác suất.
  
  Sơ đồ cây rút gọn cho các nhánh $A$ thắng chung cuộc:
  - Nhánh thắng 3-0: $A -> A -> A$.
  - Nhánh thắng 3-1:
    - $A -> A -> B -> A$
    - $A -> B -> A -> A$
    - $B -> A -> A -> A$
  - Nhánh thắng 3-2:
    - Các kịch bản $A$ thắng trận thứ 5 và đạt 3 điểm trước.
    
  b) *Tính xác suất A thắng 3-0 (Kịch bản A A A):*
  - Trận 1: $A$ thắng với xác suất $0.5$.
  - Trận 2: Do $A$ vừa thắng trận trước, xác suất $A$ thắng tiếp là $0.6$.
  - Trận 3: Do $A$ đã thắng liên tiếp 2 trận trước, xác suất $A$ thắng tiếp là $0.7$.
  
  Áp dụng quy tắc nhân xác suất có điều kiện:
  $ P(A " thắng 3-0") = P(A_1) dot.c P(A_2 | A_1) dot.c P(A_3 | A_1 inter A_2) = 0.5 dot.c 0.6 dot.c 0.7 = 0.21. $
  Như vậy, xác suất để $A$ thắng tuyệt đối là 21%.
  
  c) *Tính xác suất A thắng chung cuộc:*
  Do tính chất đối xứng hoàn toàn của trò chơi giữa hai người có cùng điểm xuất phát và cùng quy tắc thay đổi phong độ:
  $ P(A " vô địch") = P(B " vô địch") = 0.5 = 50 \%. $
]

#eg-box(title: "📝 Bài tập 2: Thách thức \"Đấu sĩ và Quái thú\" (Xác suất có điều kiện & Hồi sinh)")[
  Một đấu thủ dũng cảm phải vượt qua lần lượt $3$ cửa ải canh giữ bởi $3$ quái thú $Q_1$, $Q_2$, $Q_3$.
  - Ở trận đầu tiên gặp $Q_1$, xác suất đấu sĩ thắng là $0.7$.
  - Nếu đấu sĩ thắng một trận, do tiêu hao thể lực, xác suất thắng ở trận tiếp theo bị giảm đi $0.1$.
  - Nếu đấu sĩ thua một trận, đấu sĩ được sử dụng một quyền "Hồi sinh" duy nhất để đấu lại với quái thú đó ở trận phụ. Xác suất thắng trận hồi sinh phụ luôn là $0.5$. Nếu thắng trận phụ, đấu sĩ được đi tiếp (nhưng mất quyền hồi sinh cho các trận sau). Nếu thua trận phụ, đấu sĩ bị loại ngay lập tức.
  
  a) Vẽ sơ đồ cây xác suất cho hành trình của đấu sĩ vượt qua cả 3 quái thú.
  
  b) Tính xác suất để đấu sĩ vượt qua cả 3 quái thú thành công.
  
  c) Tính xác suất có điều kiện: Biết rằng đấu sĩ đã chiến thắng giải đấu thành công, tính xác suất đấu sĩ đã phải sử dụng tới quyền hồi sinh của mình.
]

#align(center)[
  #cetz.canvas(length: 0.85cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.45, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 7.5pt, weight: "bold")[*Bắt đầu*])
    
    // Cửa 1
    circle((3, 2.5), radius: 0.65, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "t1_w")
    content("t1_w", text(size: 7pt)[*Thắng Q1* \ (Thường)])
    
    circle((3, -2.5), radius: 0.65, fill: rgb("FFEBEE"), stroke: 1.2pt + col-red, name: "t1_l")
    content("t1_l", text(size: 7pt)[*Thua Q1* \ (Hồi sinh)])
    
    line("root", "t1_w.west", mark: (end: "stealth"))
    content((1.3, 1.9), text(size: 7pt)[0.7])
    
    line("root", "t1_l.west", mark: (end: "stealth"))
    content((1.3, -1.9), text(size: 7pt)[0.3])
    
    // Từ t1_w (Thắng Q1)
    circle((6.5, 3.8), radius: 0.65, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "t2_ww")
    content("t2_ww", text(size: 7pt)[*Thắng Q2* \ (Thường)])
    
    circle((6.5, 1.2), radius: 0.65, fill: rgb("FFEBEE"), stroke: 1.2pt + col-red, name: "t2_wl")
    content("t2_wl", text(size: 7pt)[*Thua Q2* \ (Hồi sinh)])
    
    line("t1_w", "t2_ww.west", mark: (end: "stealth"))
    content((4.6, 3.65), text(size: 7pt)[0.6])
    
    line("t1_w", "t2_wl.west", mark: (end: "stealth"))
    content((4.6, 1.4), text(size: 7pt)[0.4])
    
    // Từ t1_l (Thua Q1) -> Trận Hồi sinh 1
    circle((6.5, -1.5), radius: 0.65, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t1_r_w")
    content("t1_r_w", text(size: 7pt)[*Được Đi* \ (Không HS)])
    
    circle((6.5, -3.5), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t1_r_l")
    content("t1_r_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t1_l", "t1_r_w.west", mark: (end: "stealth"))
    content((4.6, -1.6), text(size: 7pt)[*Thắng*\ 0.5])
    
    line("t1_l", "t1_r_l.west", mark: (end: "stealth"))
    content((4.6, -3.4), text(size: 7pt)[*Thua*\ 0.5])
    
    // Từ t2_ww (Thắng Q2)
    circle((10.5, 5.0), radius: 0.55, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "t3_www")
    content("t3_www", text(size: 7pt, fill: col-green, weight: "bold")[*Thành công* \ (KB 1)])
    
    circle((10.5, 3.2), radius: 0.65, fill: rgb("FFEBEE"), stroke: 1.2pt + col-red, name: "t3_wwl")
    content("t3_wwl", text(size: 7pt)[*Thua Q3* \ (Hồi sinh)])
    
    line("t2_ww", "t3_www.west", mark: (end: "stealth"))
    content((8.3, 4.9), text(size: 7pt)[0.5])
    
    line("t2_ww", "t3_wwl.west", mark: (end: "stealth"))
    content((8.3, 3.0), text(size: 7pt)[0.5])
    
    // Từ t2_wl (Thua Q2) -> Trận Hồi sinh 2
    circle((10.5, 1.8), radius: 0.65, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_r_w")
    content("t2_r_w", text(size: 7pt)[*Được Đi* \ (Không HS)])
    
    circle((10.5, 0.6), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t2_r_l")
    content("t2_r_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t2_wl", "t2_r_w.west", mark: (end: "stealth"))
    content((8.3, 2.0), text(size: 7pt)[*Thắng*\ 0.5])
    
    line("t2_wl", "t2_r_l.west", mark: (end: "stealth"))
    content((8.3, 0.4), text(size: 7pt)[*Thua*\ 0.5])
    
    // Từ t1_r_w (Thắng Q2 sau khi đã mất quyền Hồi sinh)
    circle((10.5, -1.0), radius: 0.65, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "t2_rw_w")
    content("t2_rw_w", text(size: 7pt)[*Thắng Q2* \ (Không HS)])
    
    circle((10.5, -2.2), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t2_rw_l")
    content("t2_rw_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t1_r_w", "t2_rw_w.west", mark: (end: "stealth"))
    content((8.3, -0.75), text(size: 7pt)[0.5])
    
    line("t1_r_w", "t2_rw_l.west", mark: (end: "stealth"))
    content((8.3, -2.35), text(size: 7pt)[0.5])
    
    // Hồi sinh 3 cho t3_wwl
    circle((14.5, 3.8), radius: 0.55, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "t3_r_w")
    content("t3_r_w", text(size: 7pt, fill: col-green, weight: "bold")[*Thành công* \ (KB 4)])
    
    circle((14.5, 2.6), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t3_r_l")
    content("t3_r_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t3_wwl", "t3_r_w.west", mark: (end: "stealth"))
    content((12.3, 4.0), text(size: 7pt)[*Thắng*\ 0.5])
    
    line("t3_wwl", "t3_r_l.west", mark: (end: "stealth"))
    content((12.3, 2.4), text(size: 7pt)[*Thua*\ 0.5])
    
    // Đấu trận 3 của t2_r_w (Không còn quyền Hồi sinh)
    circle((14.5, 1.8), radius: 0.55, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "t3_rw_w")
    content("t3_rw_w", text(size: 7pt, fill: col-green, weight: "bold")[*Thành công* \ (KB 3)])
    
    circle((14.5, 0.8), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t3_rw_l")
    content("t3_rw_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t2_r_w", "t3_rw_w.west", mark: (end: "stealth"))
    content((12.3, 2.3), text(size: 7pt)[*Thắng*\ 0.5])
    
    line("t2_r_w", "t3_rw_l.west", mark: (end: "stealth"))
    content((12.3, 0.85), text(size: 7pt)[*Thua*\ 0.5])
    
    // Đấu trận 3 của t2_rw_w (Không còn quyền Hồi sinh)
    circle((14.5, -0.6), radius: 0.55, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "t3_rww_w")
    content("t3_rww_w", text(size: 7pt, fill: col-green, weight: "bold")[*Thành công* \ (KB 2)])
    
    circle((14.5, -1.6), radius: 0.5, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "t3_rww_l")
    content("t3_rww_l", text(size: 6.5pt, fill: col-red, weight: "bold")[*Bị Loại*])
    
    line("t2_rw_w", "t3_rww_w.west", mark: (end: "stealth"))
    content((12.3, -0.32), text(size: 7pt)[*Thắng*\ 0.4])
    
    line("t2_rw_w", "t3_rww_l.west", mark: (end: "stealth"))
    content((12.3, -1.77), text(size: 7pt)[*Thua*\ 0.6])
  })
]

#cach2-box[
  *Lời giải chi tiết bằng sơ đồ cây:*
  
  Ta mô hình hóa sơ đồ cây với các nút là kết quả các trận đấu. Ký hiệu $T$ là thắng trực tiếp, $H$ là thắng qua trận hồi sinh phụ, $L$ là thua hẳn (bị loại).
  
  Các kịch bản dẫn đến đấu sĩ vượt qua cả 3 quái thú thành công là:
  
  *Kịch bản 1: Thắng trực tiếp cả 3 trận (T1 T2 T3)*
  - Trận 1 ($Q_1$): Thắng với xác suất $0.7$. Thể lực giảm.
  - Trận 2 ($Q_2$): Thắng với xác suất $0.7 - 0.1 = 0.6$. Thể lực tiếp tục giảm.
  - Trận 3 ($Q_3$): Thắng với xác suất $0.6 - 0.1 = 0.5$.
  - Xác suất kịch bản 1:
    $ P("KB1") = 0.7 dot.c 0.6 dot.c 0.5 = 0.21. $
       
  *Kịch bản 2: Sử dụng quyền hồi sinh ở trận 1 (H1 T2 T3)*
  - Trận 1: Thua quái thú $Q_1$ (xác suất $0.3$), sau đó thắng trận hồi sinh phụ (xác suất $0.5$). Đấu sĩ đi tiếp nhưng hết quyền hồi sinh. Do mệt mỏi, xác suất thắng trận 2 giảm còn $0.5$.
  - Trận 2 ($Q_2$): Thắng với xác suất $0.5$ (không được thua vì hết quyền hồi sinh).
  - Trận 3 ($Q_3$): Thắng với xác suất $0.5 - 0.1 = 0.4$.
  - Xác suất kịch bản 2:
    $ P("KB2") = (0.3 dot.c 0.5) dot.c 0.5 dot.c 0.4 = 0.15 dot.c 0.2 = 0.03. $

  *Kịch bản 3: Sử dụng quyền hồi sinh ở trận 2 (T1 H2 T3)*
  - Trận 1 ($Q_1$): Thắng trực tiếp (xác suất $0.7$).
  - Trận 2 ($Q_2$): Thua trực tiếp (xác suất $1 - 0.6 = 0.4$), thắng trận hồi sinh phụ (xác suất $0.5$). Hết quyền hồi sinh.
  - Trận 3 ($Q_3$): Thắng với xác suất $0.5$ (do mệt sau trận phụ).
  - Xác suất kịch bản 3:
    $ P("KB3") = 0.7 dot.c (0.4 dot.c 0.5) dot.c 0.5 = 0.7 dot.c 0.2 dot.c 0.5 = 0.07. $

  *Kịch bản 4: Sử dụng quyền hồi sinh ở trận 3 (T1 T2 H3)*
  - Trận 1 ($Q_1$): Thắng trực tiếp (xác suất $0.7$).
  - Trận 2 ($Q_2$): Thắng trực tiếp (xác suất $0.6$).
  - Trận 3 ($Q_3$): Thua trực tiếp (xác suất $1 - 0.5 = 0.5$), thắng trận hồi sinh phụ (xác suất $0.5$).
  - Xác suất kịch bản 4:
    $ P("KB4") = 0.7 dot.c 0.6 dot.c (0.5 dot.c 0.5) = 0.42 dot.c 0.25 = 0.105. $

  *Trả lời các câu hỏi:*
  - *Câu b: Xác suất thắng chung cuộc ($P_S$):*
    $ P_S = P("KB1") + P("KB2") + P("KB3") + P("KB4") = 0.21 + 0.03 + 0.07 + 0.105 = 0.415. $
    Như vậy, xác suất thắng chung cuộc của đấu sĩ là 41.5%.
  - *Câu c: Xác suất có điều kiện đã dùng quyền hồi sinh:*
    Gọi biến cố $R$ là đấu sĩ đã dùng quyền hồi sinh trong hành trình của mình. Ta có:
    $ P(R | S) = frac(P(R inter S), P_S) $
    Trong đó, các kịch bản dùng hồi sinh dẫn tới chiến thắng là KB2, KB3, KB4:
    $ P(R inter S) = P("KB2") + P("KB3") + P("KB4") = 0.03 + 0.07 + 0.105 = 0.205. $
    Suy ra:
    $ P(R | S) = frac(0.205, 0.415) = frac(41, 83) approx 49.4 \%. $
    
    *Nhận xét:* Mặc dù xác suất thắng trực tiếp không cần hồi sinh khá cao (21%), nhưng nếu biết đấu sĩ đã vượt qua giải đấu thành công thì cơ hội để đấu sĩ đó từng phải hồi sinh lên tới 49.4% (gần một nửa). Đây là một kịch bản xác suất có điều kiện cực kỳ thú vị và thực tế.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN V. BÀI TOÁN 1 (XÚC XẮC SINH TỬ)
// ═══════════════════════════════════════════════
= V. Bài Toán 1: Trò chơi "Xúc xắc sinh tử" (Recursive game states)

Đây là lớp bài toán khó, nơi sơ đồ cây không kết thúc ngay mà có thể *quay vòng trạng thái (trạng thái đệ quy)*.

#eg-box(title: "🎯 Ví dụ 5.1 — Trò chơi xúc xắc sinh tử cơ bản (Quy tắc ưu thế gieo 2 lần)")[
  Hai người chơi $A$ và $B$ luân phiên gieo một con xúc xắc 6 mặt cân đối và đồng chất. Ai gieo được mặt 6 chấm trước sẽ thắng cuộc. 
  Tuy nhiên, nếu người gieo xúc xắc gieo phải mặt *1 chấm*, luật chơi quy định: _lượt chơi tiếp theo đối thủ sẽ được phép gieo liên tiếp 2 lần_. Nếu gieo phải các mặt khác ($2, 3, 4, 5$), lượt chơi chuyển giao bình thường.
  Biết rằng $A$ là người gieo trước. Tính xác suất để $A$ thắng cuộc.
]

== 1. Xây Dựng Các Trạng Thái Trò Chơi
Trò chơi có tính đối xứng giữa hai người chơi, nhưng số lượt gieo liên tiếp thay đổi. Ta định nghĩa các trạng thái từ góc nhìn của *người đang cầm lượt gieo*:
- Gọi $P$ là xác suất thắng của người bắt đầu lượt gieo trong trạng thái *thường* (chỉ được gieo 1 lần).
- Gọi $Q$ là xác suất thắng của người bắt đầu lượt gieo trong trạng thái *ưu thế* (được gieo liên tiếp 2 lần).

Tại bất kỳ thời điểm nào, tổng xác suất thắng của hai người chơi luôn bằng 1. Vì vậy, đối thủ của người đang gieo có xác suất thắng tương ứng là $1 - P$ (ở trạng thái thường) và $1 - Q$ (ở trạng thái ưu thế).

---

== 2. Thiết Lập Hệ Phương Trình Xác Suất Bằng Sơ Đồ Cây

Dưới đây là sơ đồ cây biểu diễn các khả năng xảy ra từ lượt gieo của đấu thủ hiện tại để thiết lập các phương trình đệ quy:

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[A gieo (P)])
    
    // Bước 1
    circle((4, 2), radius: 0.3, fill: col-green.lighten(60%), stroke: 1.2pt + col-green, name: "win_a")
    content("win_a", text(size: 7.5pt, fill: col-green, weight: "bold")[A thắng])
    
    circle((4, 0), radius: 0.35, fill: rgb("F3E5F5"), stroke: 1.2pt + col-violet, name: "q_opp")
    content("q_opp", text(size: 7.5pt)[B gieo (Q)])
    
    circle((4, -2), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "p_opp")
    content("p_opp", text(size: 7.5pt)[B gieo (P)])
    
    line("root", "win_a.west", mark: (end: "stealth"))
    content((1.8, 1.3), text(size: 7.5pt)[Mặt 6
1/6])
    line("root", "q_opp.west", mark: (end: "stealth"))
    content((1.8, 0.2), text(size: 7.5pt)[Mặt 1
1/6])
    line("root", "p_opp.west", mark: (end: "stealth"))
    content((1.8, -1.3), text(size: 7.5pt)[Mặt 2-5
2/3])
    
    // Phân nhánh của q_opp
    circle((8, 0.6), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "b_win_q")
    content("b_win_q", text(size: 7pt, fill: col-red, weight: "bold")[B thắng])
    
    circle((8, -0.6), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "a_turn_q")
    content("a_turn_q", text(size: 7pt)[A gieo])
    
    line("q_opp", "b_win_q.west", mark: (end: "stealth"))
    content((5.8, 0.5), text(size: 7pt)[$Q$])
    line("q_opp", "a_turn_q.west", mark: (end: "stealth"))
    content((5.8, -0.5), text(size: 7pt)[$1-Q$])
    
    // Phân nhánh của p_opp
    circle((8, -1.4), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "b_win_p")
    content("b_win_p", text(size: 7pt, fill: col-red, weight: "bold")[B thắng])
    
    circle((8, -2.6), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "a_turn_p")
    content("a_turn_p", text(size: 7pt)[A gieo])
    
    line("p_opp", "b_win_p.west", mark: (end: "stealth"))
    content((5.8, -1.5), text(size: 7pt)[$P$])
    line("p_opp", "a_turn_p.west", mark: (end: "stealth"))
    content((5.8, -2.5), text(size: 7pt)[$1-P$])
  })
]

#cach1-box[
  *Phân nhánh từ trạng thái thường ($P$):*
  Người chơi gieo 1 lần, các khả năng xảy ra là:
  - Gieo được mặt 6 (xác suất $1/6$): Thắng ngay lập tức.
  - Gieo được mặt 1 (xác suất $1/6$): Lượt chơi chuyển sang đối thủ nhưng ở trạng thái *ưu thế* (được gieo 2 lần). Xác suất thắng của đối thủ từ lúc này là $Q$. Do đó, xác suất thắng tiếp tục của người chơi hiện tại là:
    $ 1 - Q. $
  - Gieo được mặt khác $\{2, 3, 4, 5\}$ (xác suất $4/6 = 2/3$): Lượt chơi chuyển sang đối thủ ở trạng thái *thường*. Xác suất thắng của đối thủ từ lúc này là $P$. Do đó, xác suất thắng tiếp tục của người chơi hiện tại là:
    $ 1 - P. $
    
  Thiết lập phương trình cho $P$:
  $ P = 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - Q) + 2 / 3 dot.c (1 - P) $
  $ P = 1 / 6 + 1 / 6 - Q / 6 + 2 / 3 - 2P / 3 -> P = 1 - Q / 6 - 2P / 3 -> frac(5, 3)P + frac(1, 6)Q = 1. quad (1) $
]

#cach2-box[
  *Phân nhánh từ trạng thái ưu thế ($Q$):*
  Người chơi được gieo tối đa 2 lần liên tiếp. Ta chia nhỏ:
  - *Lần gieo thứ nhất:*
    - Gieo được mặt 6 (xác suất $1/6$): Thắng ngay lập tức.
    - Gieo được mặt 1 (xác suất $1/6$): Mất lượt gieo thứ hai, lượt chơi chuyển sang đối thủ ở trạng thái *ưu thế*. Xác suất thắng của đối thủ là $Q ->$ xác suất thắng của ta là $1 - Q$.
    - Gieo được mặt khác $\{2,3,4,5\}$ (xác suất $2/3$): Được gieo tiếp lần thứ hai.
  - *Lần gieo thứ hai (nếu xảy ra):*
    - Gieo được mặt 6 (xác suất $1/6$): Thắng ngay lập tức.
    - Gieo được mặt 1 (xác suất $1/6$): Lượt chơi chuyển sang đối thủ ở trạng thái *ưu thế*. Xác suất thắng của đối thủ là $Q ->$ xác suất thắng của ta là $1 - Q$.
    - Gieo được mặt khác (xác suất $2/3$): Lượt chơi chuyển sang đối thủ ở trạng thái *thường*. Xác suất thắng của đối thủ là $P ->$ xác suất thắng của ta là $1 - P$.

  Thiết lập phương trình cho $Q$:
  $ Q = 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - Q) + 2 / 3 dot.c [ 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - Q) + 2 / 3 dot.c (1 - P) ] $
  Ta nhận thấy cụm trong ngoặc vuông chính là biểu thức của $P$! Do đó ta rút gọn cực kỳ nhanh:
  $ Q = 1 / 6 + 1 / 6 - Q / 6 + 2 / 3 P -> Q = 1 / 3 - Q / 6 + 2 / 3 P -> frac(7, 6)Q - 2 / 3 P = 1 / 3. quad (2) $
]

---

#pagebreak()

== 3. Giải Hệ Phương Trình Và Kết Luận
Ta có hệ phương trình tuyến tính hai ẩn $P$ và $Q$:
$ heva(frac(5, 3)P + frac(1, 6)Q = 1, - frac(2, 3)P + frac(7, 6)Q = frac(1, 3)) -> heva(10P + Q = 6, -4P + 7Q = 2) $

Giải hệ phương trình này bằng phương pháp cộng đại số:
Từ phương trình thứ nhất ta có $Q = 6 - 10P$. Thế vào phương trình thứ hai:
$ -4P + 7(6 - 10P) = 2 -> -4P + 42 - 70P = 2 -> -74P = -40 -> P = frac(20, 37). $
$ Q = 6 - 10 dot.c frac(20, 37) = frac(222 - 200, 37) = frac(22, 37). $

*Kết luận:* Vì $A$ là người gieo xúc xắc đầu tiên ở trạng thái thường, xác suất thắng cuộc của $A$ chính là $P$:
$ P(A " thắng") = frac(20, 37) approx 54.05%. $

#v(1em)

#eg-box(title: "🎯 Ví dụ 5.2 — Trò chơi xúc xắc sinh tử nâng cao (Quy tắc ưu thế gieo 3 lần)")[
  Hai người chơi $A$ và $B$ luân phiên gieo một con xúc xắc 6 mặt cân đối và đồng chất. Ai gieo được mặt 6 chấm trước sẽ thắng cuộc.
  Tuy nhiên, nếu người gieo xúc xắc gieo phải mặt *1 chấm*, luật chơi quy định: _lượt chơi tiếp theo đối thủ sẽ được phép gieo liên tiếp tối đa 3 lần_. Nếu gieo phải các mặt khác ($2, 3, 4, 5$), lượt chơi chuyển giao bình thường (gieo tối đa 1 lần).
  Biết rằng $A$ là người gieo trước. Tính xác suất để $A$ thắng cuộc.
]

#cach1-box[
  *Phân tích trạng thái trò chơi đệ quy:*
  Tương tự như Ví dụ 5.1, ta định nghĩa các xác suất thắng cuộc từ góc nhìn của đấu thủ đang cầm lượt gieo:
  - Gọi $P$ là xác suất thắng khi bắt đầu lượt gieo ở trạng thái *thường* (chỉ được gieo tối đa 1 lần).
  - Gọi $Q$ là xác suất thắng khi bắt đầu lượt gieo ở trạng thái *ưu thế 2 lần* (được gieo tối đa 2 lần).
  - Gọi $R$ là xác suất thắng khi bắt đầu lượt gieo ở trạng thái *ưu thế 3 lần* (được gieo tối đa 3 lần).

  Khi một đấu thủ gieo ở trạng thái thường ($P$):
  - Gieo được mặt 6 (xác suất $1/6$): Thắng ngay lập tức (xác suất $1$).
  - Gieo được mặt 1 (xác suất $1/6$): Lượt chơi chuyển sang đối thủ ở trạng thái *ưu thế 3 lần*. Xác suất thắng của đối thủ từ lúc này là $R$, nên xác suất thắng tiếp tục của ta là $1 - R$.
  - Gieo được mặt khác $\{2, 3, 4, 5\}$ (xác suất $2/3$): Lượt chơi chuyển sang đối thủ ở trạng thái *thường*. Xác suất thắng của đối thủ là $P$, nên xác suất thắng tiếp tục của ta là $1 - P$.

  Thiết lập phương trình cho $P$:
  $ P = 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - R) + 2 / 3 dot.c (1 - P) $
  $ P = 1 / 3 - R / 6 + 2 / 3 - 2/3 P => frac(5, 3)P + frac(1, 6)R = 1 => 10 P + R = 6. quad (1) $
]

#cach2-box[
  *Phân tích trạng thái ưu thế 2 lần ($Q$) và ưu thế 3 lần ($R$):*
  
  *1. Xét trạng thái ưu thế 2 lần ($Q$):*
  Người chơi được gieo tối đa 2 lần. Lần gieo thứ nhất nếu không ra 6 và không ra 1 thì được gieo tiếp lần thứ hai (cũng là lần cuối, trở về trạng thái thường 1 lần gieo):
  $ Q = 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - R) + 2 / 3 dot.c P $
  $ Q = 1 / 3 - R / 6 + 2 / 3 P. quad (2) $

  *2. Xét trạng thái ưu thế 3 lần ($R$):*
  Người chơi được gieo tối đa 3 lần. 
  - Lần gieo thứ nhất: 
    - Gieo được mặt 6 (xác suất $1/6$): Thắng ngay.
    - Gieo được mặt 1 (xác suất $1/6$): Bị mất lượt, đối thủ được gieo ưu thế 3 lần. Xác suất đối thủ thắng là $R =>$ xác suất ta thắng là $1 - R$.
    - Gieo được mặt khác $\{2,3,4,5\}$ (xác suất $2/3$): Được gieo tiếp. Vì đã gieo 1 lần, ta còn tối đa 2 lần gieo, tương đương trạng thái ưu thế 2 lần ($Q$).
  
  Do đó, ta có phương trình cho $R$:
  $ R = 1 / 6 dot.c 1 + 1 / 6 dot.c (1 - R) + 2 / 3 dot.c Q $
  $ R = 1 / 3 - R / 6 + 2 / 3 Q => frac(7, 6)R - 2/3 Q = 1 / 3 => 7 R - 4 Q = 2. quad (3) $
]

#cach1-box[
  *Giải hệ phương trình và kết luận:*
  Thay (1) và (2) vào (3) để giải tìm $P$:
  Từ (1) ta có: $R = 6 - 10P$.
  Thế vào (2):
  $ Q = frac(2, 6) - frac(6 - 10P, 6) + frac(4P, 6) = frac(-4 + 14P, 6) = frac(7P - 2, 3). $
  
  Thế $R$ và $Q$ vào (3):
  $ 7 (6 - 10P) - 4 dot.c frac(7P - 2, 3) = 2 $
  $ 42 - 70P - frac(28P - 8, 3) = 2 $
  Nhân cả hai vế cho 3:
  $ 126 - 210P - 28P + 8 = 6 => 134 - 238P = 6 => 238P = 128 => P = frac(64, 119). $
  
  *Kết luận:* Xác suất để người gieo đầu tiên $A$ thắng cuộc là:
  $ P(A " thắng") = frac(64, 119) approx 53.78%. $
]

---

// ═══════════════════════════════════════════════
// PHẦN VI. BÀI TOÁN 2 (DOUBLE ELIMINATION)
// ═══════════════════════════════════════════════
= VI. Bài Toán 2: Giải đấu "Double Elimination" (Nhánh thắng nhánh thua)

Double Elimination là thể thức thi đấu phổ biến trong các giải đấu chuyên nghiệp, đảm bảo một đội chỉ bị loại sau khi *thua đủ 2 trận*. Sơ đồ cây của thể thức này vô cùng lắt léo.

#eg-box(title: "🎯 Ví dụ 6.1 — Giải đấu Double Elimination 3 đội cơ bản")[
  Ba đội bóng $A$, $B$, và $C$ tham gia giải đấu Double Elimination. Sơ đồ giải đấu diễn ra như sau:
  - Trận 1: $A$ đấu với $B$. Đội thua ($L_1$) sẽ xuống nhánh thua để đợi. Đội thắng ($W_1$) đi tiếp vào Trận 2.
  - Trận 2: $W_1$ đấu với $C$. Đội thắng Trận 2 ($W_2$) đi thẳng vào trận Chung kết lớn. Đội thua Trận 2 ($L_2$) xuống nhánh thua.
  - Trận 3 (Chung kết nhánh thua): $L_1$ đấu với $L_2$. Đội thắng ($W_3$) vào trận Chung kết lớn gặp $W_2$. Đội thua bị loại (hạng 3).
  - Chung kết lớn (Grand Finals): $W_2$ đấu với $W_3$. Vì $W_2$ chưa thua trận nào (nhánh thắng), nên $W_3$ (nhánh thua) phải *thắng liên tiếp 2 trận* trước $W_2$ mới vô địch. Còn $W_2$ chỉ cần thắng 1 trận là vô địch.
  
  Biết xác suất thắng giữa các cặp đấu như sau:
  - $A$ thắng $B$ với xác suất $0.6$ (do đó $B$ thắng $A$ là $0.4$).
  - $B$ thắng $C$ với xác suất $0.7$ (do đó $C$ thắng $B$ là $0.3$).
  - $C$ thắng $A$ với xác suất $0.5$ (do đó $A$ thắng $C$ là $0.5$).
  
  Tính xác suất để đội $A$ vô địch giải đấu.
]

== 1. Phân Tích Các Kịch Bản Bằng Sơ Đồ Cây
Ta vẽ sơ đồ cây phân nhánh cho giải đấu. Ta chỉ quan tâm đến các nhánh mà $A$ có cơ hội vô địch:
- *Trận 1: A vs B*
  - Nhánh 1: $A$ thắng $B$ (xác suất $0.6$). $A$ vào Trận 2 gặp $C$.
  - Nhánh 2: $B$ thắng $A$ (xác suất $0.4$). $A$ xuống nhánh thua đợi ở Trận 3.

Dưới đây là sơ đồ cây mô phỏng chi tiết 5 nhánh thi đấu dẫn đến chiến thắng chung cuộc của đội $A$:

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[Trận 1
A-B])
    
    // Vòng 2
    circle((3, 2), radius: 0.35, fill: rgb("E8F5E9"), stroke: 1.2pt + col-green, name: "t1_a")
    content("t1_a", text(size: 7.5pt)[Trận 2
A-C])
    
    circle((3, -2), radius: 0.35, fill: rgb("F3E5F5"), stroke: 1.2pt + col-violet, name: "t1_b")
    content("t1_b", text(size: 7.5pt)[Trận 2
B-C])
    
    line("root", "t1_a.west", mark: (end: "stealth"))
    content((1.5, 1.2), text(size: 7.5pt)[$A$ thắng
0.6])
    line("root", "t1_b.west", mark: (end: "stealth"))
    content((1.5, -1.2), text(size: 7.5pt)[$B$ thắng
0.4])
    
    // Phân nhánh từ t1_a
    circle((6, 3.2), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_a_w")
    content("t2_a_w", text(size: 7pt)[Trận 3
B-C])
    
    circle((6, 0.8), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_a_l")
    content("t2_a_l", text(size: 7pt)[Trận 3
A-B])
    
    line("t1_a", "t2_a_w.west", mark: (end: "stealth"))
    content((4.5, 2.8), text(size: 7pt)[$A$ thắng
0.5])
    line("t1_a", "t2_a_l.west", mark: (end: "stealth"))
    content((4.5, 1.2), text(size: 7pt)[$C$ thắng
0.5])
    
    // Kết quả từ t2_a_w
    circle((9, 3.8), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "t3_a_b")
    content("t3_a_b", text(size: 6.5pt)[CK: A-B])
    
    circle((9, 2.6), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "t3_a_c")
    content("t3_a_c", text(size: 6.5pt)[CK: A-C])
    
    line("t2_a_w", "t3_a_b.west", mark: (end: "stealth"))
    content((7.5, 3.7), text(size: 7pt)[$B$ thắng
0.7])
    line("t2_a_w", "t3_a_c.west", mark: (end: "stealth"))
    content((7.5, 2.7), text(size: 7pt)[$C$ thắng
0.3])
    
    // Lá chung cuộc của t2_a_w
    circle((12, 3.8), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w111")
    content("w111", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    circle((12, 2.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w112")
    content("w112", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("t3_a_b", "w111.west", mark: (end: "stealth"))
    content((10.5, 4.1), text(size: 7pt)[0.84])
    line("t3_a_c", "w112.west", mark: (end: "stealth"))
    content((10.5, 2.9), text(size: 7pt)[0.75])
    
    // Phân nhánh từ t2_a_l
    circle((9, 0.8), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "t3_a_gf3")
    content("t3_a_gf3", text(size: 6.5pt)[CK: C-A])
    
    line("t2_a_l", "t3_a_gf3.west", mark: (end: "stealth"))
    content((7.5, 1.1), text(size: 7pt)[$A$ thắng
0.6])
    
    circle((12, 0.8), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w121")
    content("w121", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("t3_a_gf3", "w121.west", mark: (end: "stealth"))
    content((10.5, 1.1), text(size: 7pt)[0.25])
    
    // Phân nhánh từ t1_b
    circle((6, -1.0), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_b_w")
    content("t2_b_w", text(size: 7pt)[Trận 3
A-C])
    
    circle((6, -3.0), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t2_b_l")
    content("t2_b_l", text(size: 7pt)[Trận 3
A-B])
    
    line("t1_b", "t2_b_w.west", mark: (end: "stealth"))
    content((4.5, -1.2), text(size: 7pt)[$B$ thắng
0.7])
    line("t1_b", "t2_b_l.west", mark: (end: "stealth"))
    content((4.5, -2.8), text(size: 7pt)[$C$ thắng
0.3])
    
    // Kết quả từ t2_b_w
    circle((9, -1.0), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "t3_b_gf4")
    content("t3_b_gf4", text(size: 6.5pt)[CK: B-A])
    
    line("t2_b_w", "t3_b_gf4.west", mark: (end: "stealth"))
    content((7.5, -0.7), text(size: 7pt)[$A$ thắng
0.5])
    
    circle((12, -1.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w211")
    content("w211", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("t3_b_gf4", "w211.west", mark: (end: "stealth"))
    content((10.5, -0.7), text(size: 7pt)[0.36])
    
    // Kết quả từ t2_b_l
    circle((9, -3.0), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1pt + col-amber, name: "t3_b_gf5")
    content("t3_b_gf5", text(size: 6.5pt)[CK: C-A])
    
    line("t2_b_l", "t3_b_gf5.west", mark: (end: "stealth"))
    content((7.5, -2.7), text(size: 7pt)[$A$ thắng
0.6])
    
    circle((12, -3.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "w221")
    content("w221", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("t3_b_gf5", "w221.west", mark: (end: "stealth"))
    content((10.5, -2.7), text(size: 7pt)[0.25])
  })
]

---

#pagebreak()

== 2. Tính Toán Chi Tiết Các Nhánh Chiến Thắng Của Đội $A$

#cach1-box[
  *Nhánh 1: A thắng B ở Trận 1 (Xác suất 0.6)*
  Lúc này, $A$ gặp $C$ ở Trận 2.
  
  - *Nhánh 1.1: A tiếp tục thắng C ở Trận 2 (Xác suất $P(A " thắng " C) = 0.5$):*
    - $A$ đi thẳng vào Chung kết lớn nhánh thắng ($W_2 = A$).
    - Ở nhánh thua, $C$ (thua Trận 2) đấu với $B$ (thua Trận 1) ở Trận 3.
      - Nếu $B$ thắng $C$ (xác suất $0.7$): Chung kết lớn là $A$ vs $B$. Vì $A$ ở nhánh thắng, xác suất $A$ vô địch là:
        $ P(A " vô địch" | A " gặp " B) = P(A " thắng " B) + P(B " thắng " A) dot.c P(A " thắng " B) = 0.6 + 0.4 dot.c 0.6 = 0.84. $
      - Nếu $C$ thắng $B$ (xác suất $0.3$): Chung kết lớn là $A$ vs $C$. Xác suất $A$ vô địch là:
        $ P(A " vô địch" | A " gặp " C) = P(A " thắng " C) + P(C " thắng " A) dot.c P(A " thắng " C) = 0.5 + 0.5 dot.c 0.5 = 0.75. $
    - Xác suất nhánh 1.1 dẫn tới $A$ vô địch là:
      $ P("Nhánh 1.1") = 0.6 dot.c 0.5 dot.c [ 0.7 dot.c 0.84 + 0.3 dot.c 0.75 ] = 0.3 dot.c [ 0.588 + 0.225 ] = 0.3 dot.c 0.813 = 0.2439. $

  - *Nhánh 1.2: A thua C ở Trận 2 (Xác suất $P(C " thắng " A) = 0.5$):*
    - $A$ xuống nhánh thua gặp $B$ (thua Trận 1) ở Trận 3.
      - $A$ phải thắng $B$ ở Trận 3 (xác suất $0.6$) để vào chung kết lớn gặp $C$ ($W_2 = C$).
      - Ở Chung kết lớn, vì $A$ ở nhánh thua nên $A$ bắt buộc phải thắng $C$ *2 trận liên tiếp*:
        $ P(A " vô địch" | A " gặp " C) = P(A " thắng " C)^2 = 0.5^2 = 0.25. $
    - Xác suất nhánh 1.2 dẫn tới $A$ vô địch là:
      $ P("Nhánh 1.2") = 0.6 dot.c 0.5 dot.c [ 0.6 dot.c 0.25 ] = 0.3 dot.c 0.15 = 0.045. $
]

#cach2-box[
  *Nhánh 2: B thắng A ở Trận 1 (Xác suất 0.4)*
  Lúc này, $A$ xuống nhánh thua đợi ở Trận 3. Trận 2 diễn ra giữa $B$ và $C$.
  
  - *Nhánh 2.1: B thắng C ở Trận 2 (xác suất 0.7):*
    - $B$ vào thẳng chung kết lớn. $C$ xuống gặp $A$ ở Trận 3.
    - $A$ phải thắng $C$ ở Trận 3 (xác suất $0.5$) để vào chung kết lớn gặp $B$.
    - Chung kết lớn $A$ gặp $B$ (nhánh thắng). $A$ phải thắng $B$ liên tiếp 2 trận:
      $ P(A " thắng " B " liên tiếp 2 trận") = 0.6^2 = 0.36. $
    - Xác suất nhánh 2.1 dẫn tới $A$ vô địch là:
      $ P("Nhánh 2.1") = 0.4 dot.c 0.7 dot.c [ 0.5 dot.c 0.36 ] = 0.28 dot.c 0.18 = 0.0504. $

  - *Nhánh 2.2: C thắng B ở Trận 2 (xác suất 0.3):*
    - $C$ vào chung kết lớn. $B$ xuống gặp $A$ ở Trận 3.
    - $A$ phải thắng $B$ ở Trận 3 (xác suất $0.6$) để vào chung kết lớn gặp $C$.
    - Chung kết lớn $A$ gặp $C$ (nhánh thắng). $A$ phải thắng $C$ liên tiếp 2 trận:
      $ P(A " thắng " C " liên tiếp 2 trận") = 0.5^2 = 0.25. $
    - Xác suất nhánh 2.2 dẫn tới $A$ vô địch là:
      $ P("Nhánh 2.2") = 0.4 dot.c 0.3 dot.c [ 0.6 dot.c 0.25 ] = 0.12 dot.c 0.15 = 0.018. $
]

---

== 3. Cộng Các Xác Suất Nhánh
Tổng xác suất để đội $A$ vô địch giải đấu bằng tổng xác suất của 4 nhánh trên:
$ P(A " vô địch") = P("Nhánh 1.1") + P("Nhánh 1.2") + P("Nhánh 2.1") + P("Nhánh 2.2") $
$ P(A " vô địch") = 0.2439 + 0.045 + 0.0504 + 0.018 = 0.3573 = 35.73%. $

*Kết luận:* Xác suất để đội $A$ vô địch giải đấu thể thức Double Elimination là *35.73%*.

#v(1em)

#eg-box(title: "🎯 Ví dụ 6.2 — Giải đấu Double Elimination 3 đội với các tham số xác suất thay đổi")[
  Ba đội bóng $A$, $B$, và $C$ thi đấu theo thể thức Double Elimination tương tự như Ví dụ 6.1 (Trận 1: $A$ vs $B$, Trận 2: $W_1$ vs $C$, Trận 3: $L_1$ vs $L_2$, và trận Chung kết lớn: $W_2$ vs $W_3$, nơi $W_3$ phải thắng liên tiếp 2 trận trước $W_2$ để giành chức vô địch).
  
  Tuy nhiên, xác suất đối đầu giữa các cặp đấu ở giải đấu này có sự thay đổi như sau:
  - $A$ thắng $B$ với xác suất $0.5$ (do đó $B$ thắng $A$ là $0.5$).
  - $B$ thắng $C$ với xác suất $0.6$ (do đó $C$ thắng $B$ là $0.4$).
  - $C$ thắng $A$ với xác suất $0.4$ (do đó $A$ thắng $C$ là $0.6$).
  
  Hãy tính xác suất để đội $A$ giành chức vô địch giải đấu.
]

#cach1-box[
  *Phân tích các nhánh chiến thắng khi A thắng Trận 1 (Xác suất 0.5):*
  Lúc này, $A$ gặp $C$ ở Trận 2.
  
  - *Nhánh 1.1: A thắng C ở Trận 2 (xác suất $P(A " thắng " C) = 0.6$):*
    - $A$ đi thẳng vào Chung kết lớn nhánh thắng ($W_2 = A$).
    - Ở nhánh thua, $C$ (thua Trận 2) đấu với $B$ (thua Trận 1) ở Trận 3.
      - Nếu $B$ thắng $C$ (xác suất $0.6$): Chung kết lớn là $A$ vs $B$. Xác suất $A$ vô địch là:
        $ P(A " vô địch" | A " gặp " B) = P(A " thắng " B) + P(B " thắng " A) dot.c P(A " thắng " B) = 0.5 + 0.5 dot.c 0.5 = 0.75. $
      - Nếu $C$ thắng $B$ (xác suất $0.4$): Chung kết lớn là $A$ vs $C$. Xác suất $A$ vô địch là:
        $ P(A " vô địch" | A " gặp " C) = P(A " thắng " C) + P(C " thắng " A) dot.c P(A " thắng " C) = 0.6 + 0.4 dot.c 0.6 = 0.84. $
    - Xác suất nhánh 1.1 dẫn tới $A$ vô địch là:
      $ P("Nhánh 1.1") = 0.5 dot.c 0.6 dot.c [ 0.6 dot.c 0.75 + 0.4 dot.c 0.84 ] = 0.3 dot.c [ 0.45 + 0.336 ] = 0.3 dot.c 0.786 = 0.2358. $

  - *Nhánh 1.2: A thua C ở Trận 2 (xác suất $P(C " thắng " A) = 0.4$):*
    - $A$ xuống nhánh thua gặp $B$ ở Trận 3.
      - $A$ phải thắng $B$ ở Trận 3 (xác suất $0.5$) để vào chung kết lớn gặp $C$.
      - Ở Chung kết lớn, vì $A$ ở nhánh thua nên $A$ bắt buộc phải thắng $C$ 2 trận liên tiếp:
        $ P(A " vô địch" | A " gặp " C) = P(A " thắng " C)^2 = 0.6^2 = 0.36. $
    - Xác suất nhánh 1.2 dẫn tới $A$ vô địch là:
      $ P("Nhánh 1.2") = 0.5 dot.c 0.4 dot.c [ 0.5 dot.c 0.36 ] = 0.2 dot.c 0.18 = 0.036. $
]

#cach2-box[
  *Phân tích các nhánh chiến thắng khi B thắng Trận 1 (Xác suất 0.5):*
  Lúc này, $A$ xuống nhánh thua đợi ở Trận 3. Trận 2 diễn ra giữa $B$ và $C$.
  
  - *Nhánh 2.1: B thắng C ở Trận 2 (xác suất 0.6):*
    - $B$ vào thẳng chung kết lớn. $C$ xuống gặp $A$ ở Trận 3.
    - $A$ phải thắng $C$ ở Trận 3 (xác suất $0.6$) để vào chung kết lớn gặp $B$.
    - Chung kết lớn $A$ gặp $B$ (nhánh thắng). $A$ phải thắng $B$ liên tiếp 2 trận:
      $ P(A " thắng " B " liên tiếp 2 trận") = 0.5^2 = 0.25. $
    - Xác suất nhánh 2.1 dẫn tới $A$ vô địch là:
      $ P("Nhánh 2.1") = 0.5 dot.c 0.6 dot.c [ 0.6 dot.c 0.25 ] = 0.3 dot.c 0.15 = 0.045. $

  - *Nhánh 2.2: C thắng B ở Trận 2 (xác suất 0.4):*
    - $C$ vào chung kết lớn. $B$ xuống gặp $A$ ở Trận 3.
    - $A$ phải thắng $B$ ở Trận 3 (xác suất $0.5$) để vào chung kết lớn gặp $C$.
    - Chung kết lớn $A$ gặp $C$ (nhánh thắng). $A$ phải thắng $C$ liên tiếp 2 trận:
      $ P(A " thắng " C " liên tiếp 2 trận") = 0.6^2 = 0.36. $
    - Xác suất nhánh 2.2 dẫn tới $A$ vô địch là:
      $ P("Nhánh 2.2") = 0.5 dot.c 0.4 dot.c [ 0.5 dot.c 0.36 ] = 0.2 dot.c 0.18 = 0.036. $
]

#cach1-box[
  *Cộng các xác suất nhánh và kết luận:*
  Tổng xác suất để đội $A$ vô địch giải đấu bằng tổng xác suất của 4 nhánh trên:
  $ P(A " vô địch") = P("Nhánh 1.1") + P("Nhánh 1.2") + P("Nhánh 2.1") + P("Nhánh 2.2") $
  $ P(A " vô địch") = 0.2358 + 0.036 + 0.045 + 0.036 = 0.3528 = 35.28%. $
  
  *Kết luận:* Xác suất để đội $A$ vô địch giải đấu này là *35.28%*.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN VII. BÀI TOÁN 3 (KING OF THE HILL)
// ═══════════════════════════════════════════════
= VII. Bài Toán 3: Cờ vua "King of the Hill" có điều kiện phục hận (Trạng thái phi Markov)

Đây là lớp bài toán siêu khó, nơi xác suất thắng của một đấu thủ *thay đổi phụ thuộc vào lịch sử đấu trước đó* (history-dependent).

#eg-box(title: "🎯 Ví dụ 7.1 — Cờ vua King of the Hill với đà phục hận (+0.1)")[
  Ba kỳ thủ cờ vua $A$, $B$, và $C$ tham gia một giải đấu thách đấu liên tục (King of the Hill). 
  - Trận 1: $A$ đấu với $B$. Người thua phải ra ghế dự bị. Người thắng ở lại bàn đấu để đấu tiếp với $C$ ở Trận 2.
  - Từ Trận 2 trở đi: Người thắng trận trước đấu với người đang ở ghế dự bị. Người thua ra ghế dự bị.
  - Giải đấu kết thúc khi có một kỳ thủ *thắng liên tiếp 2 trận* và người đó sẽ vô địch giải đấu.
  
  Xác suất thắng ban đầu giữa các cặp đấu là ngang nhau ($1/2$ cho mỗi người). Tuy nhiên, giải đấu có cơ chế *"phục hận"*: _Nếu một người ở ghế dự bị quay trở lại bàn đấu, nhờ việc nghiên cứu đối thủ, xác suất thắng của họ trong trận đấu quay lại đó sẽ tăng thêm 0.1_ (đồng nghĩa xác suất thắng của người đang giữ bàn giảm đi 0.1). Lưu ý: Sự tăng thế mạnh này chỉ áp dụng cho đúng trận đấu quay lại đầu tiên của họ.
  Tính xác suất để kỳ thủ $A$ vô địch giải đấu.
]

== 1. Phân Tích Sự Thay Đổi Xác Suất Theo Trạng Thái
Gọi trạng thái thi đấu là cặp kỳ thủ $(X - Y)$ trong đó $X$ là kỳ thủ đang giữ bàn đấu (vừa thắng trận trước) và $Y$ là kỳ thủ từ ghế dự bị bước vào.
- Trận 1: $A$ vs $B$. Vì cả hai đều chưa có ai dự bị phục hận, xác suất thắng là $1/2$ cho mỗi người.
  - Nếu $A$ thắng: Trận 2 là $(A - C)$. Kỳ thủ $C$ từ dự bị vào, có hệ số phục hận $-> P(C " thắng " A) = 0.5 + 0.1 = 0.6$. Do đó $P(A " thắng " C) = 0.4$.
  - Nếu $B$ thắng: Trận 2 là $(B - C)$. Tương tự, $P(C " thắng " B) = 0.6$ và $P(B " thắng " C) = 0.4$.

Nhờ tính đối xứng hoàn toàn giữa $A$ và $B$ ở trận đầu tiên, ta có:
$ P(A " vô địch") = P(B " vô địch"). $
Ta sẽ vẽ sơ đồ cây chi tiết cho nhánh $A$ thắng Trận 1 (xác suất $0.5$) và tính xác suất $A$ vô địch.

---

== 2. Khai Triển Sơ Đồ Cây Nhánh $A$ Thắng Trận 1

Dưới đây là sơ đồ cây biểu diễn chuỗi trận đấu xuất phát từ kịch bản $A$ thắng Trận 1, chỉ ra các nút lá kết thúc và vòng lặp đệ quy quay lại Trận 2:

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Trận 2
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "s_start")
    content("s_start", text(size: 7.5pt)[Trận 2
(A-C)])
    
    // Kết quả Trận 2
    circle((3, 1.5), radius: 0.3, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win_a_t2")
    content("win_a_t2", text(size: 7pt, fill: col-green, weight: "bold")[A vô địch])
    
    circle((3, -1.5), radius: 0.35, fill: rgb("E3F2FD"), stroke: 1.2pt + col-blue, name: "t3")
    content("t3", text(size: 7.5pt)[Trận 3
(C-B)])
    
    line("s_start", "win_a_t2.west", mark: (end: "stealth"))
    content((1.3, 1.0), text(size: 7.5pt)[$A$ thắng
0.4])
    line("s_start", "t3.west", mark: (end: "stealth"))
    content((1.3, -1.0), text(size: 7.5pt)[$C$ thắng
0.6])
    
    // Kết quả Trận 3
    circle((6, -0.5), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "win_c_t3")
    content("win_c_t3", text(size: 7pt, fill: col-red, weight: "bold")[C vô địch])
    
    circle((6, -2.5), radius: 0.35, fill: rgb("F3E5F5"), stroke: 1.2pt + col-violet, name: "t4")
    content("t4", text(size: 7.5pt)[Trận 4
(B-A)])
    
    line("t3", "win_c_t3.west", mark: (end: "stealth"))
    content((4.3, -0.8), text(size: 7.5pt)[$C$ thắng
0.4])
    line("t3", "t4.west", mark: (end: "stealth"))
    content((4.3, -2.2), text(size: 7.5pt)[$B$ thắng
0.6])
    
    // Kết quả Trận 4
    circle((9, -1.5), radius: 0.3, fill: col-red.lighten(80%), stroke: 1pt + col-red, name: "win_b_t4")
    content("win_b_t4", text(size: 7pt, fill: col-red, weight: "bold")[B vô địch])
    
    circle((9, -3.5), radius: 0.35, fill: rgb("FFF8E1"), stroke: 1.2pt + col-amber, name: "loop_node")
    content("loop_node", text(size: 7.5pt)[Quay lại
Trận 2])
    
    line("t4", "win_b_t4.west", mark: (end: "stealth"))
    content((7.3, -1.8), text(size: 7.5pt)[$B$ thắng
0.4])
    line("t4", "loop_node.west", mark: (end: "stealth"))
    content((7.3, -3.2), text(size: 7.5pt)[$A$ thắng
0.6])
    
    // Vẽ đường quay lại (loop back)
    line("loop_node.east", (10.5, -3.5), (10.5, -4.5), (-1.5, -4.5), (-1.5, 0), "s_start.west", mark: (end: "stealth"))
    content((4.5, -4.8), text(size: 7.5pt, fill: col-amber)[Vòng lặp đệ quy (Chu kỳ quay lại Trận 2)])
  })
]

#cach1-box[
  *Lịch sử thi đấu khi A thắng Trận 1 (Ký hiệu kịch bản theo chuỗi người thắng):*
  $A$ đã thắng 1 trận. Trận 2 là $(A - C)$.
  
  - *Nhánh 1: A thắng C ở Trận 2 (Xác suất 0.4).*
    - $A$ đã thắng liên tiếp 2 trận ($A$ thắng $B$, $A$ thắng $C$).
    - $A$ vô địch ngay lập tức!
    - Xác suất nhánh này: $0.5 dot.c 0.4 = 0.2$.

  - *Nhánh 2: C thắng A ở Trận 2 (Xác suất 0.6):*
    - $C$ thắng 1 trận. $A$ ra ghế dự bị. Trận 3 là $(C - B)$ ($B$ vào bàn đấu với tư cách phục hận).
    - Xác suất thắng của $B$ là $0.6$; xác suất thắng của $C$ là $0.4$.
    
    - *Nhánh 2.1: C thắng B ở Trận 3 (Xác suất 0.4).*
      - $C$ thắng liên tiếp 2 trận ($C$ thắng $A$, $C$ thắng $B$).
      - $C$ vô địch! ($A$ không thể vô địch ở nhánh này).
      
    - *Nhánh 2.2: B thắng C ở Trận 3 (Xác suất 0.6).*
      - $B$ thắng 1 trận. $C$ ra ghế dự bị. Trận 4 là $(B - A)$ ($A$ vào bàn đấu với tư cách phục hận).
      - Xác suất thắng của $A$ là $0.6$; xác suất thắng của $B$ là $0.4$.
]

#cach2-box[
  *Phân tích tiếp tục từ Trận 4 $(B - A)$:*
  Ta thấy tại Trận 4, $A$ đang ở thế phục hận gặp $B$.
  
  - *Nhánh 2.2.1: B thắng A ở Trận 4 (Xác suất 0.4).*
    - $B$ thắng liên tiếp 2 trận ($B$ thắng $C$ ở Trận 3, $B$ thắng $A$ ở Trận 4).
    - $B$ vô địch!
    
  - *Nhánh 2.2.2: A thắng B ở Trận 4 (Xác suất 0.6).*
    - $A$ thắng 1 trận. $B$ ra dự bị. Trận 5 là $(A - C)$ ($C$ phục hận).
    - Lúc này, trạng thái giải đấu quay trở về *chính xác trạng thái của Trận 2*: $A$ thắng 1 trận và chuẩn bị đấu với $C$ (phục hận).
    
  Đây là điểm đệ quy vô cùng thú vị! 
  Gọi $x$ là xác suất để $A$ vô địch tính từ thời điểm *$A$ thắng 1 trận và chuẩn bị đấu với $C$ ở thế phục hận*.
  Thiết lập phương trình đệ quy cho $x$:
  $ x = P(A " thắng " C " ở Trận 2") dot.c 1 + P(C " thắng " A) dot.c P(B " thắng " C) dot.c P(A " thắng " B) dot.c x $
  $ x = 0.4 dot.c 1 + 0.6 dot.c 0.6 dot.c 0.6 dot.c x $
  $ x = 0.4 + 0.216 x -> 0.784 x = 0.4 -> x = frac(0.4, 0.784) = frac(50, 98) = frac(25, 49). $
]

---

== 3. Tính Xác Suất Chung Cuộc Cho Kỳ Thủ $A$
Kỳ thủ $A$ có thể vô địch giải đấu thông qua kịch bản: $A$ thắng Trận 1 (xác suất $0.5$) và từ đó vô địch (xác suất là $x$), hoặc $B$ thắng Trận 1 và $A$ lội ngược dòng vô địch từ nhánh dự bị.
Tuy nhiên, do tính đối xứng của Trận 1:
- Nếu $A$ thắng Trận 1: Xác suất $A$ vô địch là $x = 25/49$.
- Nếu $B$ thắng Trận 1: Do vai trò của $A$ và $B$ đối xứng hoàn toàn, xác suất $B$ vô địch sẽ là $x = 25/49$.
Vì giải đấu chắc chắn có người vô địch nên:
$ P(A " vô địch") + P(B " vô địch") + P(C " vô địch") = 1 $

Vì đối xứng nên $P(A " vô địch" | A " thắng Trận 1") = P(B " vô địch" | B " thắng Trận 1") = x = 25/49$.
Nhờ tính chất này, ta có thể tính trực tiếp xác suất $A$ vô địch từ đầu giải đấu:
$ P(A " vô địch") = P(A " thắng Trận 1") dot.c x + P(B " thắng Trận 1") dot.c P(A " vô địch" | B " thắng Trận 1") $

Xét kịch bản $B$ thắng Trận 1 (xác suất $0.5$). Giải đấu ở trạng thái Trận 2 là $(B - C)$.
- Nếu $B$ thắng $C$ (xác suất $0.4$): $B$ vô địch.
- Nếu $C$ thắng $B$ (xác suất $0.6$): $C$ giữ bàn đấu gặp $A$ phục hận. Trận đấu là $(C - A)$.
  - Nếu $C$ thắng $A$ (xác suất $0.4$): $C$ vô địch.
  - Nếu $A$ thắng $C$ (xác suất $0.6$): Trạng thái quay về: $A$ vừa thắng 1 trận gặp $B$ phục hận $(A - B)$.
    - Tại đây, xác suất $A$ vô địch chính là giá trị $x = 25/49$ (do vai trò của các đối thủ xoay vòng).
    
Tính toán xác suất lội ngược dòng của $A$ khi $B$ thắng Trận 1:
$ P(A " vô địch" | B " thắng Trận 1") = 0.6 dot.c 0.6 dot.c x = 0.36 x. $

Thay tất cả vào công thức tổng quát:
$ P(A " vô địch") = 0.5 dot.c x + 0.5 dot.c (0.36 x) = 0.5 dot.c (1.36 x) = 0.68 x $
$ P(A " vô địch") = 0.68 dot.c frac(25, 49) = frac(17, 25) dot.c frac(25, 49) = frac(17, 49) approx 34.69%. $

*Kết luận:* Xác suất để kỳ thủ $A$ vô địch giải đấu King of the Hill có điều kiện phục hận là *$frac(17, 49)$* (khoảng *34.69%*).

#v(1em)

#eg-box(title: "🎯 Ví dụ 7.2 — Cờ vua King of the Hill với đà phục hận cao hơn (+0.2)")[
  Ba kỳ thủ cờ vua $A$, $B$, và $C$ tham gia giải đấu King of the Hill với luật lệ hoàn toàn tương tự Ví dụ 7.1. 
  Tuy nhiên, cơ chế "phục hận" của người từ ghế dự bị quay lại bàn đấu được tăng mạnh hơn: _Xác suất thắng của họ trong trận đấu quay lại đó sẽ tăng thêm 0.2_ (đồng nghĩa xác suất thắng của người đang giữ bàn giảm đi 0.2). Xác suất thắng ban đầu khi chưa có ai phục hận vẫn là $0.5$ mỗi bên.
  Tính xác suất để kỳ thủ $A$ vô địch giải đấu.
]

#cach1-box[
  *Phân tích xác suất theo trạng thái đệ quy:*
  Gọi $x$ là xác suất để kỳ thủ đang giữ bàn đấu và có 1 trận thắng (ví dụ $A$) vô địch giải đấu khi phải đối đầu với đấu thủ dự bị có lợi thế phục hận (ví dụ $C$).
  
  Khi đó:
  - Xác suất $C$ thắng $A$ (có phục hận) là: $0.5 + 0.2 = 0.7$.
  - Xác suất $A$ thắng $C$ (giữ bàn) là: $0.5 - 0.2 = 0.3$.
  
  Ta lập phương trình đệ quy cho $x$ tương tự Ví dụ 7.1:
  $ x = P(A " thắng " C " ở Trận 2") dot.c 1 + P(C " thắng " A) dot.c P(B " thắng " C) dot.c P(A " thắng " B) dot.c x $
  Ở đây:
  - $P(A " thắng " C) = 0.3$.
  - $P(C " thắng " A) = 0.7$.
  - Trận 3: $B$ phục hận gặp $C$ đang giữ bàn $=> P(B " thắng " C) = 0.7$.
  - Trận 4: $A$ phục hận gặp $B$ đang giữ bàn $=> P(A " thắng " B) = 0.7$.
  
  Thay các giá trị vào phương trình:
  $ x = 0.3 + 0.7 dot.c 0.7 dot.c 0.7 dot.c x $
  $ x = 0.3 + 0.343 x => (1 - 0.343)x = 0.3 => 0.657 x = 0.3 $
  $ x = frac(0.3, 0.657) = frac(300, 657) = frac(100, 219) approx 45.66%. $
]

#cach2-box[
  *Tính xác suất vô địch chung cuộc từ đầu giải:*
  Do vai trò đối xứng hoàn toàn giữa $A$ và $B$ ở trận đầu tiên:
  - Nếu $A$ thắng Trận 1 (xác suất $0.5$): Xác suất $A$ vô địch là $x$.
  - Nếu $B$ thắng Trận 1 (xác suất $0.5$): Giải đấu ở trạng thái Trận 2 là $(B - C)$ với $C$ phục hận.
    - $B$ thắng $C$ (xác suất $0.3$): $B$ vô địch.
    - $C$ thắng $B$ (xác suất $0.7$): Trận 3 là $(C - A)$ với $A$ phục hận.
      - $C$ thắng $A$ (xác suất $0.3$): $C$ vô địch.
      - $A$ thắng $C$ (xác suất $0.7$): Trận 4 là $(A - B)$ với $B$ phục hận. Từ đây, $A$ đang giữ bàn có 1 trận thắng, xác suất $A$ vô địch quay về đúng bằng $x$.
      
  Do đó, xác suất $A$ vô địch khi $B$ thắng Trận 1 là:
  $ P(A " vô địch" | B " thắng Trận 1") = 0.7 dot.c 0.7 dot.c x = 0.49 x. $
  
  Tổng hợp xác suất vô địch của $A$ từ đầu giải đấu:
  $ P(A " vô địch") = 0.5 dot.c x + 0.5 dot.c (0.49 x) = 0.745 x $
  Thế giá trị $x = 100/219$ vào:
  $ P(A " vô địch") = 0.745 dot.c frac(100, 219) = frac(149, 200) dot.c frac(100, 219) = frac(149, 438) approx 34.02%. $
  
  *Kết luận:* Xác suất để kỳ thủ $A$ giành chức vô địch giải đấu King of the Hill có đà phục hận $+0.2$ là *34.02%* (dạng phân số là *$149/438$*).
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN VIII. MÔ HÌNH SỨC MẠNH ĐỘNG
// ═══════════════════════════════════════════════
= VIII. Chuyên Đề Mới: Mô hình Sức mạnh Động (Bradley-Terry động) trong các Giải đấu

Trong các giải đấu thể thao chuyên nghiệp và trò chơi đối kháng trực tiếp, sức mạnh hay phong độ của một kỳ thủ hoặc một đội tuyển thường không bất biến. Sau khi trải qua một trận thắng, kỳ thủ có thể nhận được sự thăng hoa về mặt tâm lý và đà thi đấu (Momentum), hoặc ngược lại, họ có thể được tăng chỉ số lực nhờ sự chuẩn bị chiến thuật chuyên nghiệp.

Để giải quyết lớp bài toán này, người ta thường kết hợp *Mô hình Bradley-Terry* với phương pháp *Sơ đồ cây xác suất*.

== 1. Mô hình Bradley-Terry và Sự Thăng tiến Sức mạnh Động
- *Mô hình Bradley-Terry:* Xác suất đấu thủ $X$ (có lực $S_X$) thắng đấu thủ $Y$ (có lực $S_Y$) được xác định bởi:
  $ P(X "thắng" Y) = frac(S_X, S_X + S_Y) $
- *Sự thăng tiến sức mạnh động (Dynamic progression):* Sau mỗi vòng đấu (ví dụ vòng Bán kết), đấu thủ chiến thắng sẽ được tăng một lượng sức mạnh cụ thể (ví dụ tăng $k \%$ chỉ số lực hiện có). Khi bước vào vòng đấu tiếp theo (ví dụ vòng Chung kết), xác suất thắng của họ sẽ được tính toán dựa trên chỉ số sức mạnh mới này.

---

== 2. Bài Toán Thực Tế: Giải đấu bốn đội có thăng tiến sức mạnh

#eg-box(title: "🎯 Ví dụ 8.1 — Giải đấu bốn đội loại trực tiếp có thăng tiến sức mạnh sau Bán kết (Tung xúc sắc)")[
  Bốn đội bóng đá $A$, $B$, $C$, $D$ tham gia một giải đấu loại trực tiếp gồm hai vòng đấu: Bán kết và Chung kết.
  
  *Bảng chỉ số sức mạnh ban đầu và tỉ lệ tăng sức mạnh:*
  - *Đội A:* Lực ban đầu = 80. Nếu thắng bán kết, lực tăng thêm 30%.
  - *Đội B:* Lực ban đầu = 90. Nếu thắng bán kết, lực tăng thêm 10%.
  - *Đội C:* Lực ban đầu = 40. Nếu thắng bán kết, lực tăng thêm 40%.
  - *Đội D:* Lực ban đầu = 50. Nếu thắng bán kết, lực tăng thêm 30%.
  
  *Xác suất xếp lịch thi đấu vòng Bán kết (Tung xúc sắc):*
  Ban tổ chức tung một con xúc sắc cân đối 6 mặt để xếp cặp đấu:
  - Nếu mặt gieo được là 1 hoặc 2: *A gặp C* (xác suất $1/3$), cặp còn lại là *B gặp D*.
  - Nếu mặt gieo được là 4, 5 hoặc 6: *A gặp D* (xác suất $1/2$), cặp còn lại là *B gặp C*.
  - Nếu mặt gieo được là 3: *A gặp B* (xác suất $1/6$), cặp còn lại là *C gặp D*.
  
  Tính xác suất để đội $A$ đoạt chức vô địch giải đấu (làm tròn kết quả đến hàng phần trăm).
]

#cach1-box[
  *Lời giải chi tiết:*
  
  *Bước 1: Tính chỉ số lực của các đội khi bước vào Chung kết (nếu thắng bán kết):*
  - *Đội A:* Lực chung kết = $80  times  1.3 = 104$.
  - *Đội B:* Lực chung kết = $90  times  1.1 = 99$.
  - *Đội C:* Lực chung kết = $40  times  1.4 = 56$.
  - *Đội D:* Lực chung kết = $50  times  1.3 = 65$.

  *Bước 2: Vẽ sơ đồ cây quyết định chia kịch bản:*
  Trò chơi phân tách thành 3 kịch bản chính từ nút gốc (Trận Bán kết):
]

#align(center)[
  #cetz.canvas(length: 0.9cm, {
    import cetz.draw: *
    
    // Gốc
    circle((0, 0), radius: 0.35, fill: rgb("FFE0B2"), stroke: 1.5pt + col-amber, name: "root")
    content("root", text(size: 8pt, weight: "bold")[Gốc])
    
    // 3 Kịch bản vòng bán kết
    rect((3.2, 4), (5.7, 4.8), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c1")
    content("c1", text(size: 7.5pt)[*Case 1* \\ (A-C, B-D)])
    
    rect((3.2, 0), (5.7, 0.8), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c2")
    content("c2", text(size: 7.5pt)[*Case 2* \\ (A-D, B-C)])
    
    rect((3.2, -4), (5.7, -3.2), fill: rgb("E8F5E9"), stroke: 1pt + col-green, radius: 2pt, name: "c3")
    content("c3", text(size: 7.5pt)[*Case 3* \\ (A-B, C-D)])
    
    line("root", "c1.west", mark: (end: "stealth"))
    content((1.7, 2.3), text(size: 8pt)[1/3])
    line("root", "c2.west", mark: (end: "stealth"))
    content((1.7, 0.6), text(size: 8pt)[1/2])
    line("root", "c3.west", mark: (end: "stealth"))
    content((1.7, -1.8), text(size: 8pt)[1/6])
    
    // Case 1
    rect((8, 5.2), (11.2, 6.0), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_b")
    content("c1_b", text(size: 7pt)[A thắng C, B thắng D \\ Chung kết: A vs B])
    
    rect((8, 3.6), (11.2, 4.4), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c1_d")
    content("c1_d", text(size: 7pt)[A thắng C, D thắng B \\ Chung kết: A vs D])
    
    line("c1.east", "c1_b.west", mark: (end: "stealth"))
    content((6.8, 5.0), text(size: 7pt)[$2/3 dot.c 9/14$])
    line("c1.east", "c1_d.west", mark: (end: "stealth"))
    content((6.8, 3.8), text(size: 7pt)[$2/3 dot.c 5/14$])
    
    // Case 2
    rect((8, 1.2), (11.2, 2.0), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c2_b")
    content("c2_b", text(size: 7pt)[A thắng D, B thắng C \\ Chung kết: A vs B])
    
    rect((8, -0.4), (11.2, 0.4), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c2_c")
    content("c2_c", text(size: 7pt)[A thắng D, C thắng B \\ Chung kết: A vs C])
    
    line("c2.east", "c2_b.west", mark: (end: "stealth"))
    content((6.8, 1.4), text(size: 7pt)[$8/13 dot.c 9/13$])
    line("c2.east", "c2_c.west", mark: (end: "stealth"))
    content((6.8, 0.2), text(size: 7pt)[$8/13 dot.c 4/13$])
    
    // Case 3
    rect((8, -2.4), (11.2, -1.6), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_c")
    content("c3_c", text(size: 7pt)[A thắng B, C thắng D \\ Chung kết: A vs C])
    
    rect((8, -4.0), (11.2, -3.2), fill: rgb("E3F2FD"), stroke: 1pt + col-blue, radius: 2pt, name: "c3_d")
    content("c3_d", text(size: 7pt)[A thắng B, D thắng C \\ Chung kết: A vs D])
    
    line("c3.east", "c3_c.west", mark: (end: "stealth"))
    content((6.8, -2.2), text(size: 7pt)[$8/17 dot.c 4/9$])
    line("c3.east", "c3_d.west", mark: (end: "stealth"))
    content((6.8, -3.4), text(size: 7pt)[$8/17 dot.c 5/9$])
    
    // Nút lá A vô địch
    circle((14, 5.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win1")
    content("win1", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 4.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win2")
    content("win2", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 1.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win3")
    content("win3", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, 0.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win4")
    content("win4", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, -2.0), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win5")
    content("win5", text(size: 7pt, fill: col-green, weight: "bold")[A])
    circle((14, -3.6), radius: 0.25, fill: col-green.lighten(60%), stroke: 1pt + col-green, name: "win6")
    content("win6", text(size: 7pt, fill: col-green, weight: "bold")[A])
    
    line("c1_b.east", "win1.west", mark: (end: "stealth"))
    content((12.6, 5.9), text(size: 7pt)[$104/203$])
    line("c1_d.east", "win2.west", mark: (end: "stealth"))
    content((12.6, 4.3), text(size: 7pt)[$8/13$])
    line("c2_b.east", "win3.west", mark: (end: "stealth"))
    content((12.6, 1.9), text(size: 7pt)[$104/203$])
    line("c2_c.east", "win4.west", mark: (end: "stealth"))
    content((12.6, 0.3), text(size: 7pt)[$13/20$])
    line("c3_c.east", "win5.west", mark: (end: "stealth"))
    content((12.6, -1.7), text(size: 7pt)[$13/20$])
    line("c3_d.east", "win6.west", mark: (end: "stealth"))
    content((12.6, -3.3), text(size: 7pt)[$8/13$])
  })
]

#cach1-box[
  *Bước 3: Tính toán xác suất vô địch của A tại từng kịch bản nhánh lớn:*

  - - *Tại Kịch bản 1 (A-C và B-D):*
      - Xác suất A thắng bán kết C: $P(A_1) = frac(80, 80 + 40) = frac(2, 3)$.
      - Xác suất B thắng bán kết D: $P(B_1) = frac(90, 90 + 50) = frac(9, 14)$.
      - Xác suất D thắng bán kết B: $P(D_1) = frac(5, 14)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp B (lực 99): Xác suất A thắng là $frac(104, 104 + 99) = frac(104, 203)$.
        - Gặp D (lực 65): Xác suất A thắng là $frac(104, 104 + 65) = frac(8, 13)$.
      - Xác suất A vô địch ở Nhánh 1:
        $ P_("vô địch 1") = 1/3 dot.c 2/3 dot.c [ 9/14 dot.c 104/203 + 5/14 dot.c 8/13 ] $
        $ P_("vô địch 1") = 2/9 dot.c [ frac(936, 2842) + frac(40, 182) ] = 2/9 dot.c [ frac(468, 1421) + frac(20, 91) ] approx 0.12203. $

  - - *Tại Kịch bản 2 (A-D và B-C):*
      - Xác suất A thắng bán kết D: $P(A_2) = frac(80, 80 + 50) = frac(8, 13)$.
      - Xác suất B thắng bán kết C: $P(B_2) = frac(90, 90 + 40) = frac(9, 13)$.
      - Xác suất C thắng bán kết B: $P(C_2) = frac(4, 13)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp B (lực 99): Xác suất A thắng là $frac(104, 203)$.
        - Gặp C (lực 56): Xác suất A thắng là $frac(104, 104 + 56) = frac(13, 20)$.
      - Xác suất A vô địch ở Nhánh 2:
        $ P_("vô địch 2") = 1/2 dot.c 8/13 dot.c [ 9/13 dot.c 104/203 + 4/13 dot.c 13/20 ] $
        $ P_("vô địch 2") = 4/13 dot.c [ frac(936, 2639) + frac(1, 5) ] approx 4/13 dot.c [ 0.35468 + 0.20000 ] approx 0.17067. $

  - - *Tại Kịch bản 3 (A-B và C-D):*
      - Xác suất A thắng bán kết B: $P(A_3) = frac(80, 80 + 90) = frac(8, 17)$.
      - Xác suất C thắng bán kết D: $P(C_3) = frac(40, 40 + 50) = frac(4, 9)$.
      - Xác suất D thắng bán kết C: $P(D_3) = frac(5, 9)$.
      - Chung kết (A đã tăng lực thành 104):
        - Gặp C (lực 56): Xác suất A thắng là $frac(13, 20)$.
        - Gặp D (lực 65): Xác suất A thắng là $frac(8, 13)$.
      - Xác suất A vô địch ở Nhánh 3:
        $ P_("vô địch 3") = 1/6 dot.c 8/17 dot.c [ 4/9 dot.c 13/20 + 5/9 dot.c 8/13 ] $
        $ P_("vô địch 3") = 4/51 dot.c [ frac(13, 45) + frac(40, 117) ] approx 4/51 dot.c [ 0.28889 + 0.34188 ] approx 0.04947. $

  *Bước 4: Kết luận:*
  Xác suất tổng thể để đội A đoạt chức vô địch giải đấu bằng tổng xác suất của cả 3 nhánh trên sơ đồ cây:
  $ P(A "vô địch") = P_("vô địch 1") + P_("vô địch 2") + P_("vô địch 3") $
  $ P(A "vô địch") approx 0.12203 + 0.17067 + 0.04947 = 0.34217. $
  
  Làm tròn đến hàng phần trăm theo yêu cầu đề bài:
  $ P(A "vô địch") approx bold(0.34) " hay " bold(34%). $
]

---

#pagebreak()

== 3. Bài toán leo tháp Tam hùng (Đỉnh Cao Vọng Cảnh)

Để rèn luyện tư duy cho học sinh ở mức độ khó hơn, ta xét một cấu trúc giải đấu động khác: thể thức leo tháp kết hợp sự thăng hoa và kiệt quệ về thể lực.

#eg-box(title: "🎯 Ví dụ 8.2 — Giải đấu leo tháp Tam hùng thăng hoa (+20%) và kiệt quệ (-10%)")[
  Ba kỳ thủ cờ vua $A$, $B$, $C$ tham gia giải đấu leo tháp "Đỉnh Cao Vọng Cảnh".
  - *Chỉ số sức mạnh ban đầu:* $S_A = 80$, $S_B = 70$, $S_C = 60$.
  - *Trận 1:* Một cặp đấu được chọn ngẫu nhiên bằng bốc thăm trong 3 kỳ thủ để đấu với nhau. Kỳ thủ còn lại đợi ở lượt sau. Vì trận 1 là trận ra mắt của cả hai, xác suất thắng của mỗi kỳ thủ được tính theo mô hình Bradley-Terry ban đầu.
  - *Luật thay đổi sức mạnh:*
    - Người thắng trận sẽ được *tăng 20%* chỉ số sức mạnh hiện tại (động lực thăng hoa) và đi tiếp vào Trận 2.
    - Người thua trận bị *giảm 10%* sức mạnh hiện tại (kiệt quệ) và ra ghế dự bị.
  - *Trận 2 (Chung kết):* Kỳ thủ thắng trận 1 đấu với kỳ thủ dự bị còn lại. Người thắng trận 2 sẽ vô địch giải đấu.
  
  Xác định xác suất để kỳ thủ $A$ vô địch giải đấu khi việc xếp cặp trận 1 là hoàn toàn ngẫu nhiên.
]

#cach1-box[
  *Lời giải chi tiết:*
  
  *Bước 1: Phân tích các kịch bản phân cặp Trận 1:*
  Có 3 cách phân cặp Trận 1, mỗi cách có xác suất xuất hiện là $1/3$:
  - - *Case 1:* $A$ đấu với $B$ (Trận 1). $C$ đợi.
  - - *Case 2:* $A$ đấu với $C$ (Trận 1). $B$ đợi.
  - - *Case 3:* $B$ đấu với $C$ (Trận 1). $A$ đợi.

  *Bước 2: Tính toán sức mạnh thăng tiến sau trận 1:*
  - Nếu $A$ thắng: $S_A' = 80  times  1.2 = 96$.
  - Nếu $B$ thắng: $S_B' = 70  times  1.2 = 84$.
  - Nếu $C$ thắng: $S_C' = 60  times  1.2 = 72$.
  - Sức mạnh của người đợi vẫn giữ nguyên: $S_A = 80, S_B = 70, S_C = 60$.

  *Bước 3: Tính xác suất A vô địch trong từng Case:*
  
  - - *Tại Case 1 (A đấu B, C đợi - Xác suất $1/3$):*
      - Trận 1: $A$ vs $B$. Xác suất $A$ thắng là: $P(A_1) = frac(80, 80 + 70) = frac(8, 15)$.
      - Trận 2 (Chung kết): Nếu $A$ thắng ở Trận 1, $A$ gặp $C$ (lực 60). Lực mới của $A$ là $96$.
        Xác suất $A$ thắng chung kết là: $P(A_2) = frac(96, 96 + 60) = frac(96, 156) = frac(8, 13)$.
      - Xác suất $A$ vô địch trong Case 1 là:
        $ P_("vô địch" | "Case 1") = P(A_1) dot.c P(A_2) = frac(8, 15) dot.c frac(8, 13) = frac(64, 195) approx 0.32821. $

  - - *Tại Case 2 (A đấu C, B đợi - Xác suất $1/3$):*
      - Trận 1: $A$ vs $C$. Xác suất $A$ thắng là: $P(A_1) = frac(80, 80 + 60) = frac(8, 14) = frac(4, 7)$.
      - Trận 2 (Chung kết): Nếu $A$ thắng ở Trận 1, $A$ gặp $B$ (lực 70). Lực mới của $A$ là $96$.
        Xác suất $A$ thắng chung kết là: $P(A_2) = frac(96, 96 + 70) = frac(96, 166) = frac(48, 83)$.
      - Xác suất $A$ vô địch trong Case 2 là:
        $ P_("vô địch" | "Case 2") = frac(4, 7) dot.c frac(48, 83) = frac(192, 581) approx 0.33046. $

  - - *Tại Case 3 (B đấu C, A đợi - Xác suất $1/3$):*
      - Trận 1: $B$ vs $C$.
        - $B$ thắng với xác suất: $frac(70, 70 + 60) = frac(7, 13)$.
        - $C$ thắng với xác suất: $frac(60, 70 + 60) = frac(6, 13)$.
      - Trận 2 (Chung kết): $A$ đợi vào đấu với người thắng:
        - Nếu $B$ thắng: Chung kết là $A$ (lực 80) đấu với $B$ (lực mới 84).
          Xác suất $A$ thắng là: $frac(80, 80 + 84) = frac(80, 164) = frac(20, 41)$.
        - Nếu $C$ thắng: Chung kết là $A$ (lực 80) đấu với $C$ (lực mới 72).
          Xác suất $A$ thắng là: $frac(80, 80 + 72) = frac(80, 152) = frac(10, 19)$.
      - Xác suất $A$ vô địch trong Case 3 là:
        $ P_("vô địch" | "Case 3") = frac(7, 13) dot.c frac(20, 41) + frac(6, 13) dot.c frac(10, 19) = frac(140, 533) + frac(60, 247) approx 0.26266 + 0.24291 = 0.50557. $

  *Bước 4: Tính xác suất vô địch chung cuộc của A:*
  $ P(A "vô địch") = 1/3 dot.c [ P_("vô địch" | "Case 1") + P_("vô địch" | "Case 2") + P_("vô địch" | "Case 3") ] $
  $ P(A "vô địch") approx 1/3 dot.c [ 0.32821 + 0.33046 + 0.50557 ] = 1/3 dot.c 1.16424 = 0.38808. $
  
  *Kết luận:* Xác suất để kỳ thủ $A$ vô địch giải đấu leo tháp là khoảng *38.81%*.
]

#eg-box(title: "🎯 Ví dụ 8.3 — Giải đấu bốn đội với thể thức leo tháp bậc thang (Stepladder Tournament)")[
  Bốn kỳ thủ $A, B, C, D$ có chỉ số lực ban đầu lần lượt là $S_A = 90$, $S_B = 80$, $S_C = 70$, $S_D = 60$. Họ thi đấu theo thể thức leo tháp bậc thang (Stepladder) như sau:
  - *Vòng 1:* Kỳ thủ hạt giống thấp nhất $D$ đấu với $C$. Xác suất thắng tính theo mô hình Bradley-Terry ban đầu.
  - *Vòng 2:* Người thắng ở Vòng 1 sẽ gặp kỳ thủ $B$.
  - *Vòng 3 (Chung kết):* Người thắng ở Vòng 2 sẽ gặp kỳ thủ hạt giống số 1 $A$. Người thắng Vòng 3 sẽ giành chức vô địch.
  - *Luật thay đổi sức mạnh động:*
    - Kỳ thủ thắng mỗi trận sẽ được tăng $10\%$ lực hiện có cho trận đấu tiếp theo (momentum).
    - Kỳ thủ đợi sẵn ($B$ ở Vòng 2, $A$ ở Vòng 3) giữ nguyên sức mạnh ban đầu của họ.
  
  Tính xác suất để kỳ thủ $C$ vô địch giải đấu.
]

#cach1-box[
  *Phân tích các bước đấu trên sơ đồ cây phân nhánh:*
  
  - *Vòng 1: C đấu với D (lực $S_C = 70$, $S_D = 60$):*
    - Xác suất $C$ thắng: $P(C_1) = frac(70, 70 + 60) = frac(7, 13)$.
    - Xác suất $D$ thắng: $P(D_1) = frac(60, 70 + 60) = frac(6, 13)$.
    
    *Trường hợp $C$ thắng ở Vòng 1:*
    - Chỉ số lực mới của $C$ sau Vòng 1 (tăng 10%): $S_C' = 70  times  1.1 = 77$.
    
  - *Vòng 2: Người thắng Vòng 1 đấu với B (lực $S_B = 80$):*
    - *Kịch bản 1: C thắng Vòng 1, đấu với B:*
      - Lực của $C$ là $77$, lực của $B$ là $80$.
      - Xác suất $C$ thắng: $P(C_2 | C_1) = frac(77, 77 + 80) = frac(77, 157)$.
      - Lực mới của $C$ sau khi thắng tiếp (tăng 10%): $S_C'' = 77  times  1.1 = 84.7$.
    - *Kịch bản 2: D thắng Vòng 1, đấu với B:*
      - Lực của $D$ sau Vòng 1: $S_D' = 60  times  1.1 = 66$.
      - Lực của $B$ là $80$.
      - Xác suất $D$ thắng: $P(D_2 | D_1) = frac(66, 66 + 80) = frac(66, 146) = frac(33, 73)$.
      - Lực mới của $D$ sau khi thắng tiếp: $S_D'' = 66  times  1.1 = 72.6$.
      
  - *Vòng 3 (Chung kết): Người thắng Vòng 2 đấu với A (lực $S_A = 90$):*
    - Nếu $C$ lọt vào chung kết (phải thắng cả Vòng 1 và Vòng 2):
      - Lực của $C$ lúc này là $84.7$, lực của $A$ là $90$.
      - Xác suất $C$ thắng $A$ ở chung kết: $P(C_3 | C_2 " và " C_1) = frac(84.7, 84.7 + 90) = frac(84.7, 174.7) = frac(847, 1747)$.
]

#cach2-box[
  *Tính xác suất để C vô địch:*
  Kỳ thủ $C$ vô địch khi và chỉ khi $C$ thắng Vòng 1, thắng Vòng 2, và thắng Vòng 3.
  Áp dụng quy tắc nhân dọc theo nhánh cây của $C$:
  $ P(C " vô địch") = P(C_1) dot.c P(C_2 | C_1) dot.c P(C_3 | C_2 " và " C_1) $
  $ P(C " vô địch") = frac(7, 13) dot.c frac(77, 157) dot.c frac(84.7, 174.7) $
  $ P(C " vô địch") = frac(7, 13) dot.c frac(77, 157) dot.c frac(847, 1747) $
  
  Tính toán giá trị thập phân từng bước:
  - $P(C_1) = frac(7, 13) approx 0.53846$.
  - $P(C_2 | C_1) = frac(77, 157) approx 0.49045$.
  - $P(C_3 | C_2 " và " C_1) = frac(847, 1747) approx 0.48483$.
  
  Nhân các kết quả:
  $ P(C " vô địch") approx 0.53846  times  0.49045  times  0.48483 approx 0.12804. $
  
  *Kết luận:* Xác suất để kỳ thủ $C$ giành chức vô địch giải đấu leo tháp bậc thang là khoảng *12.80%*.
]

#v(1em)

#eg-box(title: "🎯 Ví dụ 8.4 — Giải đấu leo tháp bậc thang với chỉ số mới (Xác suất hạt giống thấp nhất vô địch)")[
  Bốn kỳ thủ $A, B, C, D$ có chỉ số lực ban đầu lần lượt là $S_A = 100$, $S_B = 85$, $S_C = 75$, $S_D = 65$. Họ thi đấu theo thể thức leo tháp bậc thang (Stepladder) hoàn toàn tương tự như Ví dụ 8.3:
  - *Vòng 1:* Kỳ thủ $D$ đấu với $C$.
  - *Vòng 2:* Người thắng ở Vòng 1 gặp $B$.
  - *Vòng 3 (Chung kết):* Người thắng ở Vòng 2 gặp $A$ để tranh chức vô địch.
  - *Luật thay đổi sức mạnh động:* Kỳ thủ thắng mỗi trận sẽ được tăng $15\%$ lực hiện có cho trận đấu tiếp theo. Kỳ thủ đợi sẵn ($B$ ở Vòng 2, $A$ ở Vòng 3) giữ nguyên lực ban đầu.
  
  Tính xác suất để kỳ thủ hạt giống thấp nhất $D$ vô địch giải đấu.
]

#cach1-box[
  *Phân tích các bước đấu của kỳ thủ D trên sơ đồ cây:*
  
  - *Vòng 1: C đấu với D (lực $S_C = 75$, $S_D = 65$):*
    - Xác suất $D$ thắng: 
      $ P(D_1) = frac(65, 75 + 65) = frac(65, 140) = frac(13, 28) approx 0.46429. $
    - Nếu $D$ thắng, lực mới của $D$ được tăng $15\%$:
      $ S_D' = 65  times  1.15 = 74.75. $
      
  - *Vòng 2: D gặp B (lực $S_B = 85$):*
    - Xác suất $D$ thắng:
      $ P(D_2 | D_1) = frac(74.75, 74.75 + 85) = frac(74.75, 159.75) = frac(299, 639) approx 0.46792. $
    - Nếu $D$ thắng tiếp, lực mới của $D$ được tăng $15\%$:
      $ S_D'' = 74.75  times  1.15 = 85.9625. $
      
  - *Vòng 3: D gặp A (lực $S_A = 100$):*
    - Xác suất $D$ thắng ở chung kết để vô địch:
      $ P(D_3 | D_2 " và " D_1) = frac(85.9625, 85.9625 + 100) = frac(85.9625, 185.9625) = frac(6877, 14877) approx 0.46225. $
]

#cach2-box[
  *Tính toán xác suất chung cuộc:*
  Kỳ thủ $D$ vô địch khi và chỉ khi thắng cả 3 trận liên tục. 
  Áp dụng quy tắc nhân dọc theo nhánh cây của $D$:
  $ P(D " vô địch") = P(D_1) dot.c P(D_2 | D_1) dot.c P(D_3 | D_2 " và " D_1) $
  $ P(D " vô địch") = frac(13, 28) dot.c frac(299, 639) dot.c frac(6877, 14877) $
  
  Nhân các kết quả thập phân:
  $ P(D " vô địch") approx 0.46429  times  0.46792  times  0.46225 approx 0.10042. $
  
  *Kết luận:* Xác suất để kỳ thủ hạt giống thấp nhất $D$ lội ngược dòng leo tháp vô địch là khoảng *10.04%* (dạng phân số tối giản là *$2675153 / 26600076$*).
]

---

#pagebreak()

== 4. Bài tập tự luyện nâng cao

#eg-box(title: "✏️ Bài C14 — Lưới bán kết thăng tiến song hành")[
  Bốn đấu thủ $A$, $B$, $C$, $D$ có lực ban đầu lần lượt là $90$, $80$, $70$, $60$. Họ thi đấu vòng bán kết loại trực tiếp với cách phân cặp ngẫu nhiên (mỗi cách phân cặp có xác suất $1/3$).
  Sau trận bán kết, kỳ thủ chiến thắng được tăng thêm $20\%$ lực, còn kỳ thủ thua trận bị giảm $20\%$ lực (và rời giải đấu).
  Tính xác suất để kỳ thủ $B$ vô địch giải đấu.
]

#eg-box(title: "✏️ Bài C15 — Leo tháp ba kỳ thủ có đà phục hận")[
  Ba kỳ thủ $A$, $B$, $C$ có lực ban đầu lần lượt là $100$, $80$, $60$. Trận 1 bốc thăm ngẫu nhiên chọn hai người đấu với nhau.
  - Người thắng trận 1 được cộng $10$ điểm lực và đi tiếp vào trận chung kết.
  - Người thua trận 1 được bốc thăm quyền "phục sinh": với xác suất $0.4$, họ được hồi sinh lực lượng để đấu trận chung kết với người thắng trận 1 (lúc này sức mạnh họ giảm đi $10$ điểm do mệt mỏi). Với xác suất $0.6$, họ bị loại hẳn và nhường vị trí chung kết cho người thứ 3 đợi từ đầu.
  Tính xác suất để kỳ thủ $C$ vô địch giải đấu.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IX. CẨM NANG TƯ DUY
// ═══════════════════════════════════════════════
= IX. Cẩm Nang Tư Duy Quyết Định Tránh Bẫy

Sơ đồ cây xác suất rất mạnh, nhưng học sinh rất dễ làm sai nếu mắc phải các lỗi tư duy hệ thống dưới đây:

#note-box(title: "🚨 Lỗi 1: Nhầm lẫn giữa Xác suất Đồng thời và Xác suất Có điều kiện")[
  - *Hậu quả:* Gán sai giá trị xác suất cho các nhánh của cây.
  - *Quy tắc khắc ghi:* Các nhánh xuất phát từ một nút *luôn luôn biểu diễn xác suất có điều kiện* (giả sử sự kiện ở nút trước đó đã xảy ra). Tổng xác suất của các nhánh đi ra từ cùng một nút luôn phải bằng 1.
]

#note-box(title: "🚨 Lỗi 2: Bỏ sót các nhánh trạng thái quay vòng (Đệ quy)")[
  - *Hậu quả:* Coi giải đấu là hữu hạn và cố tình bỏ qua các nhánh có thể lặp lại trạng thái, dẫn đến tính toán thiếu kịch bản.
  - *Quy tắc khắc ghi:* Khi gặp kịch bản lặp lại, hãy *đặt ẩn số $x$* cho xác suất tại nút đó, sau đó thiết lập phương trình toán học $x = f(x)$ để giải quyết một cách triệt để.
]

#note-box(title: "🚨 Lỗi 3: Quên tính trọng số phân phối của nút gốc")[
  - *Hậu quả:* Chỉ tính xác suất vô địch trong một nhánh phân cặp của vòng 1 mà quên nhân với xác suất xuất hiện kịch bản phân cặp đó ở gốc.
  - *Quy tắc khắc ghi:* Luôn xuất phát từ một nút Gốc duy nhất có tổng xác suất bằng 1, phân chia đều cho các kịch bản khởi đầu.
]
