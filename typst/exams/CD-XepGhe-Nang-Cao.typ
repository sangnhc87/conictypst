#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG & FONTS
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.85em)
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 0.5em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("4A148C"), rgb("6A1B9A"), rgb("880E4F"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("6A1B9A")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("6A1B9A"), size: 12pt, weight: "bold", it.body),
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

// ─── Hộp Lý Thuyết ─────────────────────────────
#let rev-box(title: none, body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 4pt + col-purple, rest: 0.8pt + rgb("CE93D8")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [
    #text(fill: col-purple, size: 11pt, weight: "bold")[#title]
    #v(0.4em)
  ]
  #body
]

// ─── Hộp Ví Dụ Trực Quan ───────────────────────
#let eg-box(title: [🎯 Ví Dụ Trực Quan], body) = block(
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
#let note-box(title: [📌 Nhận Xét], body) = block(
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

// ─── Hộp Kết Luận ───────────────────────────────
#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + col-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-green, weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

// ─── Hộp Cảnh Báo ───────────────────────────────
#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + col-red, rest: 0.6pt + rgb("EF9A9A")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

// ─── Hộp Các Hướng Giải Quyết ────────────────────
#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Phân Tích Cấu Trúc Khung Xương (Tổ Hợp)]
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
  #text(
    fill: col-violet,
    weight: "bold",
    size: 10.5pt,
  )[🟣 Cách 2 — Phương pháp Bù trừ trên Cặp kề trùng (Adjacent-Pair PIE)]
  #v(0.3em)
  #body
]

// ─── Hộp Phương Pháp ─────────────────────────────
#let method-box(body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-teal, weight: "bold")[⚙️ Tư Duy Tổng Quát]
  #v(0.3em)
  #body
]

// ex-box: blue background, blue border, titled
#let ex-box(title: [✏️ Bài Tập Luyện Tập], body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// recap-box: purple/violet background, purple border, untitled
#let recap-box(body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + col-violet, rest: 0.5pt + rgb("CE93D8")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #body
]

// step-box: gray background, gray border, for solution steps
#let step-box(body) = block(
  fill: rgb("F5F5F5"),
  stroke: (left: 4pt + rgb("757575"), rest: 0.5pt + rgb("E0E0E0")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D0030"), rgb("4A148C"), rgb("7B1FA2"), rgb("880E4F"), angle: 135deg),
    inset: (x: 2cm, y: 1.8cm),
    radius: 14pt,
  )[
    #text(fill: rgb("CE93D8"), size: 12pt, weight: "bold", tracking: 2pt)[
      TÀI LIỆU TOÁN CHUYÊN ĐỀ PHỔ THÔNG
    ]
    #v(0.6em)
    #text(fill: white, size: 24pt, weight: "black")[XẾP GHẾ NÂNG CAO — 3 DẠNG ĐẶC BIỆT]
    #v(0.4em)
    #text(
      fill: rgb("E1BEE7"),
      size: 14pt,
    )[🎯 Đối Diện Cùng Lớp · Không Quá k Liên Tiếp · Vòng Tròn Phức Tạp]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10.5pt, style: "italic")[
      "Từ Nguyên Lý Cột Độc Lập đến Cấu Trúc Đợt và Khe Hở Tròn — Giải Đầy Đủ Từng Bước"
    ]
    #v(1.2em)
    #line(length: 70%, stroke: 1.5pt + rgb("CE93D8"))
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: center,
      gutter: 0.5em,
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Dạng 1* Đối Diện]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Dạng 2* Không quá k]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Dạng 3* Vòng Tròn]
        ]
      ],
    )
  ]
]

#v(2.0em)

// ═══════════════════════════════════════════════
// MỤC LỤC THU GỌN
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 95%,
    fill: rgb("F5F0FF"),
    stroke: 1pt + rgb("CE93D8"),
    radius: 8pt,
    inset: (x: 16pt, y: 12pt),
  )[
    #text(fill: col-purple, size: 11pt, weight: "bold")[📚 Lộ Trình Kiến Thức]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [📖 *Chương 1* — 2 Dãy Đối Diện: Cột Độc Lập],
      [📐 *Chương 2* — Không Quá k: Đợt & Sao-Thanh Chắn],
      [🚀 *Chương 3* — Vòng Tròn: Khe Hở Tròn & Chốt Điểm],
    )
  ]
]

#pagebreak()

#set page(
  header: context {
    set text(size: 8.5pt, fill: rgb("6A1B9A"))
    grid(
      columns: (1fr, auto),
      [Chuyên Đề Sắp Xếp Chỗ Ngồi — Bản chất & Tổng quát hóa], [GV Nguyễn Văn Sang · 0389.821.115],
    )
    v(-4pt)
    line(length: 100%, stroke: 0.6pt + rgb("CE93D8"))
  },
  footer: context {
    set text(size: 9pt, fill: rgb("6A1B9A"))
    grid(
      columns: (1fr, auto),
      [], [Trang #counter(page).display()],
    )
  },
)

= Chương 1 — Hai Dãy Đối Diện: Nguyên Lý Cột Độc Lập

Bài toán "hai dãy đối diện" xuất hiện khi ta xếp học sinh vào hai hàng ghế song song nhau — như kiểu ngồi đối mặt trên toa tàu hay trong phòng hội thảo. Ràng buộc thường gặp nhất trong đề thi là: *hai học sinh cùng lớp không được ngồi đối diện nhau* (tức là không ngồi chung một cặp đối diện).

#note-box(title: "📌 Nhận Xét")[
  Điểm mấu chốt: Không có ràng buộc nào về những ghế kế bên nhau trong cùng một hàng. Các học sinh cùng lớp vẫn được ngồi cạnh nhau thoải mái trên cùng một hàng.

  Đây là dạng bài trông có vẻ phức tạp nhưng thực ra có cấu trúc toán học đẹp nhất trong các bài toán xếp ghế, nhờ vào tính chất độc lập của các cột.
]

== 1.1 — Cấu Hình Bài Toán và Bước Đột Phá Then Chốt

#rev-box(title: "🔷 Cấu Hình Ghế và Ràng Buộc")[
  Cho $m$ ghế ở Hàng 1 và $m$ ghế ở Hàng 2 xếp song song đối diện nhau. Ta đánh số các cột ghế từ $1, 2, dots, m$.
  Mỗi cột $c$ ($c = 1, 2, dots, m$) gồm đúng 2 ghế đối diện nhau:
  - Ghế $(1, c)$: thuộc Hàng 1, cột $c$.
  - Ghế $(2, c)$: thuộc Hàng 2, cột $c$.

  *Ràng buộc:* Cặp ghế đối diện $(1, c)$ và $(2, c)$ không được chứa 2 học sinh cùng lớp.
]

#method-box[
  *Tư duy đột phá:* Ràng buộc "không cùng lớp" chỉ áp dụng cho 2 ghế đối diện nhau trong cùng một cột. Các cột không hề ràng buộc hay ảnh hưởng lẫn nhau.

  Do đó, các cột hoàn toàn độc lập. Ta có thể giải bài toán bằng cách chia nhỏ thành các bước:
  1. Quyết định xem những học sinh lớp nào sẽ ngồi chung với nhau ở mỗi cột (Cấu trúc cột).
  2. Xếp các học sinh cụ thể của từng lớp vào các vị trí đã định cho lớp đó (Hoán vị học sinh).
  3. Quyết định xem trong mỗi cột, ai sẽ ngồi Hàng 1, ai ngồi Hàng 2 ($2^m$ cách chọn).
]

#recap-box[
  *Khái niệm cốt lõi: Chưa đánh nhãn (Unlabeled) vs Đã đánh nhãn (Labeled)*

  - *Chưa đánh nhãn (Unlabeled):* Ta tạm thời coi các học sinh trong cùng một lớp là giống hệt nhau (chỉ quan tâm đến "tên lớp" chứ chưa quan tâm "tên người"). Ta đi tìm số cấu trúc cột hợp lệ.
  - *Đã đánh nhãn (Labeled):* Thực tế học sinh là phân biệt. Sau khi đã dựng xong cấu trúc cột lớp, ta xếp từng học sinh cụ thể vào các vị trí của lớp mình bằng phép hoán vị ($n!$).
]

== 1.2 — Trường Hợp Cơ Bản: Hai Lớp Bằng Nhau ($n_A = n_B = m$)

Đây là trường hợp sạch đẹp và thường xuyên xuất hiện nhất trong các đề thi tuyển sinh.

#method-box[
  *⚙️ Bài Toán Nền — 2 Lớp, $n_A = n_B = m$*

  Có $m$ học sinh lớp A ($A_1, A_2, dots, A_m$) and $m$ học sinh lớp B ($B_1, B_2, dots, B_m$), tổng cộng $2m$ học sinh. Xếp tất cả vào 2 hàng ghế đối diện, mỗi hàng có $m$ ghế.

  - *Bước 1 — Bắt buộc phân bổ 1A và 1B vào mỗi cột:* Vì không có 2 học sinh cùng lớp nào được ngồi đối diện nhau, nên mọi cột ghế đều bắt buộc phải chứa đúng 1 học sinh lớp A và 1 học sinh lớp B.
  - *Bước 2 — Ghép cặp học sinh và chọn hàng:*
    - Có $m!$ cách ghép $m$ học sinh lớp A vào $m$ cột ghế khác nhau.
    - Có $m!$ cách ghép $m$ học sinh lớp B vào $m$ cột ghế khác nhau.
    - Tại mỗi cột trong số $m$ cột, ta có 2 cách chọn vị trí (học sinh lớp A ngồi Hàng 1 hay học sinh lớp B ngồi Hàng 1). Do các cột độc lập nên ta có $2^m$ cách chọn cho toàn bộ $m$ cột.
]

#ans-box[
  *📐 Công Thức — 2 Lớp Bằng Nhau*

  Số cách xếp $m$ học sinh lớp A và $m$ học sinh lớp B vào 2 hàng $m$ ghế đối diện sao cho không có 2 học sinh cùng lớp ngồi đối diện là:
  $ N = 2^m times (m!)^2 $
]

#eg-box(title: "🎯 Ví Dụ 1.1 — Quy mô 3 học sinh mỗi lớp (3A và 3B)")[
  Có 3 học sinh lớp A và 3 học sinh lớp B. Xếp vào 2 hàng 3 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.

  *Lời giải chi tiết:*
  Ta có số ghế mỗi hàng là $m = 3$, số học sinh $n_A = n_B = 3$. Áp dụng công thức:
  $ N = 2^3 times (3!)^2 = 8 times 36 = bold(288) " cách." $

  *Giải thích trực quan cách chọn từng cột:*
  - *Cột 1:* Chọn 1 bạn lớp A (3 cách), chọn 1 bạn lớp B (3 cách), chọn ai ngồi Hàng 1 (2 cách) $arrow.r 3 times 3 times 2 = 18$ cách.
  - *Cột 2:* Chọn 1 bạn lớp A từ 2 bạn còn lại (2 cách), chọn 1 bạn lớp B từ 2 bạn còn lại (2 cách), chọn ai ngồi Hàng 1 (2 cách) $arrow.r 2 times 2 times 2 = 8$ cách.
  - *Cột 3:* Chọn bạn lớp A cuối cùng (1 cách), chọn bạn lớp B cuối cùng (1 cách), chọn ai ngồi Hàng 1 (2 cách) $arrow.r 1 times 1 times 2 = 2$ cách.

  Nhân các cột độc lập: $18 times 8 times 2 = bold(288)$ cách. ✓
]

#eg-box(title: "🎯 Ví Dụ 1.2 — Quy mô nhỏ nhất (2A và 2B)")[
  Có 2 học sinh lớp A ($A_1, A_2$) và 2 học sinh lớp B ($B_1, B_2$). Xếp vào 2 hàng 2 ghế đối diện nhau sao cho không có cặp đối diện cùng lớp. Tính số cách xếp và liệt kê cụ thể.

  *Lời giải chi tiết:*
  Áp dụng công thức với $m = 2$:
  $ N = 2^2 times (2!)^2 = 4 times 4 = bold(16) " cách." $

  *Liệt kê toàn bộ 16 cách xếp để thấy rõ bản chất:*
  Mỗi cách xếp được biểu diễn dưới dạng ma trận $2 times 2$ (Hàng 1 ở trên, Hàng 2 ở dưới):
  - *Nhóm 1 — Ghép cặp $(A_1, B_1)$ ở Cột 1 và $(A_2, B_2)$ ở Cột 2 (có 8 cách):*
    $ mat(A_1, A_2; B_1, B_2), mat(A_1, B_2; B_1, A_2), mat(B_1, A_2; A_1, B_2), mat(B_1, B_2; A_1, A_2) $
    $ mat(A_2, A_1; B_2, B_1), mat(A_2, B_1; B_2, A_1), mat(B_2, A_1; A_2, B_1), mat(B_2, B_1; A_2, A_1) $
  - *Nhóm 2 — Ghép cặp $(A_1, B_2)$ ở Cột 1 và $(A_2, B_1)$ ở Cột 2 (có 8 cách):*
    $ mat(A_1, A_2; B_2, B_1), mat(A_1, B_1; B_2, A_2), mat(B_2, A_2; A_1, B_1), mat(B_2, B_1; A_1, A_2) $
    $ mat(A_2, A_1; B_1, B_2), mat(A_2, B_2; B_1, A_1), mat(B_1, A_1; B_2, A_2), mat(B_1, B_2; A_2, A_1) $
]

== 1.3 — Điều Kiện Bắt Buộc: Tại Sao Phải $n_A = n_B$ khi chỉ có 2 lớp?

#warn-box[
  Chú ý bẫy lý thuyết: Nếu đề bài cho 2 lớp có số học sinh lệch nhau (ví dụ: $n_A = 4, n_B = 2$, xếp vào 2 hàng 3 ghế) thì sao?

  *Bản chất:* Ràng buộc bắt buộc mọi cột ghế đối diện phải là $\{A, B\}$. Do đó, tổng số học sinh lớp A phải đúng bằng tổng số cột $m$, và tổng số học sinh lớp B cũng phải đúng bằng $m$.

  *Hệ quả:* Nếu chỉ có 2 lớp và $n_A != n_B$, số cách xếp thỏa mãn điều kiện đề bài chắc chắn bằng $bold(0)$ cách!
]

== 1.4 — Tổng Quát Nhiều Lớp: Nguyên Lý Phân Bổ Kiểu Cột

Khi có từ 3 lớp trở lên, một cột ghế không nhất thiết phải là $\{A, B\}$ nữa. Nó có thể là $\{A, C\}$, $\{B, C\}$, v.v. Nhiệm vụ của chúng ta là phân tích cấu trúc chưa đánh nhãn (Unlabeled) bằng cách tìm các cách ghép nhóm lớp hợp lệ cho mỗi cột.

#rev-box(title: "🔷 Khung Lý Thuyết Tổng Quát cho s Lớp")[
  Giả sử có $s$ lớp $X_1, X_2, dots, X_s$ với số học sinh tương ứng là $n_1, n_2, dots, n_s$ sao cho $sum n_i = 2m$ (đủ $2m$ ghế).
  Ta gọi một kiểu cột $(X_i, X_j)$ (với $i < j$) là cột chứa 1 học sinh lớp $X_i$ và 1 học sinh lớp $X_j$. Gọi $t_({i j})$ là số cột có kiểu $(X_i, X_j)$. Một phương án phân bổ cột hợp lệ phải thỏa mãn:
  $ sum_(j != i) t_({i j}) = n_i quad "với mọi lớp" i $
  Tức là tổng số lượt xuất hiện của lớp $X_i$ trong tất cả các cột phải đúng bằng số học sinh $n_i$ của lớp đó.
]

#method-box[
  Công thức đóng góp của một phương án phân bổ cột ${t_({i j})}$:
  $
    N_t = underbrace(frac(m!, product_(i<j) (t_({i j})!)), M = "Gán kiểu cột vào các vị trí") times underbrace(product_(k=1)^s (n_k!), "Hoán vị học sinh cụ thể") times underbrace(2^m, "Đảo Hàng 1 / Hàng 2")
  $
  Tổng số cách xếp $N$ là tổng của $N_t$ trên tất cả các phương án phân bổ cột hợp lệ.
]

#rev-box(title: "🔑 Quy Trình Biện Luận Nghiệm Cho Hệ Phương Trình Cấu Hình Cột")[
  Khi số lượng lớp lớn (ví dụ $s = 3, 4$), hệ phương trình cấu hình cột có nhiều biến số và thường có nhiều nghiệm nguyên không âm. Để tránh bỏ sót nghiệm, ta áp dụng quy trình biện luận nghiệm có hệ thống sau:

  1. *Bước 1: Liệt kê đầy đủ các biến số.* Các biến số đại diện cho các kiểu cột có thể có (ví dụ: $t_(A B), t_(A C), dots$). Số lượng biến tối đa là $binom(s, 2)$.
  2. *Bước 2: Thiết lập giới hạn trên của từng biến.* Mỗi biến $t_(i j)$ đại diện cho cột chứa lớp $i$ và $j$, do đó ta luôn có giới hạn:
    $ t_(i j) <= min(n_i, n_j) $
  3. *Bước 3: Chọn biến có giới hạn hẹp nhất làm tham số biện luận.*
    - Thông thường, ta chọn lớp có ít học sinh nhất (ví dụ lớp C và D có $n_C = n_D = 1$).
    - Biến $t_(C D)$ khi đó chỉ có thể nhận giá trị từ $0$ đến $min(n_C, n_D)$. Ta chia làm các trường hợp tương ứng với từng giá trị nguyên của $t_(C D)$.
  4. *Bước 4: Thay giá trị vào hệ phương trình để giải các biến còn lại.* Với mỗi giá trị của biến tham số, hệ phương trình ban đầu sẽ giảm số lượng biến và có thể giải một cách dễ dàng, loại bỏ các nghiệm có giá trị âm hoặc không thỏa mãn tổng số cột $m$.
  5. *Bước 5: Tổng hợp các cấu hình nghiệm hợp lệ.* Mỗi bộ nghiệm nguyên không âm thỏa mãn hệ phương trình sẽ là một cấu hình cột hợp lệ.
]

#rev-box(title: "🔑 Quy Trình Biện Luận Nghiệm Cho Hệ Phương Trình Cấu Hình Cột")[
  Khi số lượng lớp lớn (ví dụ $s = 3, 4$), hệ phương trình cấu hình cột có nhiều biến số và thường có nhiều nghiệm nguyên không âm. Để tránh bỏ sót nghiệm, ta áp dụng quy trình biện luận nghiệm có hệ thống sau:

  1. *Bước 1: Liệt kê đầy đủ các biến số.* Các biến số đại diện cho các kiểu cột có thể có (ví dụ: $t_(A B), t_(A C), dots$). Số lượng biến tối đa là $binom(s, 2)$.
  2. *Bước 2: Thiết lập giới hạn trên của từng biến.* Mỗi biến $t_(i j)$ đại diện cho cột chứa lớp $i$ và $j$, do đó ta luôn có giới hạn:
    $ t_(i j) <= min(n_i, n_j) $
  3. *Bước 3: Chọn biến có giới hạn hẹp nhất làm tham số biện luận.*
    - Thông thường, ta chọn lớp có ít học sinh nhất (ví dụ lớp C và D có $n_C = n_D = 1$).
    - Biến $t_(C D)$ khi đó chỉ có thể nhận giá trị từ $0$ đến $min(n_C, n_D)$. Ta chia làm các trường hợp tương ứng với từng giá trị nguyên của $t_(C D)$.
  4. *Bước 4: Thay giá trị vào hệ phương trình để giải các biến còn lại.* Với mỗi giá trị của biến tham số, hệ phương trình ban đầu sẽ giảm số lượng biến và có thể giải một cách dễ dàng, loại bỏ các nghiệm có giá trị âm hoặc không thỏa mãn tổng số cột $m$.
  5. *Bước 5: Tổng hợp các cấu hình nghiệm hợp lệ.* Mỗi bộ nghiệm nguyên không âm thỏa mãn hệ phương trình sẽ là một cấu hình cột hợp lệ.
]

*⬧ Dạng 1.4.1 — Lớp lớn nhất chiếm đúng nửa số ghế ($n_(max) = m$)*

Khi có một lớp (giả sử lớp A) có số học sinh bằng đúng số ghế một hàng ($n_A = m$), thì bắt buộc mỗi cột ghế đều phải chứa đúng 1 học sinh lớp A. Tại sao? Vì nếu có cột không chứa học sinh A nào, thì theo nguyên lý Dirichlet, sẽ có cột chứa ít nhất 2 học sinh A, vi phạm ràng buộc đối diện.

#eg-box(title: [🎯 Ví Dụ 1.3 — Quy mô lớn: 4A, 2B, 1C, 1D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 4 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp hợp lệ.

  *Lời giải chi tiết:*
  Ta có $m = 4$. Lớp lớn nhất là lớp A có $n_A = 4 = m$. Do đó, mỗi cột bắt buộc chứa đúng 1 bạn lớp A. Các học sinh không phải lớp A là $\{B, B, C, D\}$ sẽ chia nhau ghép cặp với A ở các cột.
  - Các kiểu cột có thể có: $(A, B)$, $(A, C)$, $(A, D)$.
  - Số lượng các kiểu cột tương ứng: $t_(A B) = 2, t_(A C) = 1, t_(A D) = 1$.
  (Tổng số cột: $2 + 1 + 1 = 4 = m$. Đầy đủ và thỏa mãn).

  Áp dụng công thức tính số cách xếp:
  1. Số cách gán kiểu cột vào 4 vị trí cột: $M = frac(4!, 2! times 1! times 1!) = 12$ cách.
  2. Hoán vị học sinh trong từng lớp: $4!$ (lớp A) $times 2!$ (lớp B) $times 1!$ (C) $times 1!$ (D) $= 24 times 2 times 1 times 1 = 48$ cách.
  3. Chọn hàng cho mỗi cột: $2^4 = 16$ cách.

  Vậy tổng số cách xếp là:
  $ N = 12 times 48 times 16 = bold(9216) " cách." $
]

#eg-box(title: [🎯 Ví Dụ 1.4 — Quy mô nhỏ: 3A, 1B, 1C, 1D ngồi 2 hàng 3 ghế ($m=3$)])[
  Có 3 học sinh lớp A, 1 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 3 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.

  *Lời giải chi tiết:*
  Ta có $m = 3$ và $n_A = 3 = m$. Mỗi cột bắt buộc chứa đúng 1 học sinh A. Các bạn còn lại $\{B, C, D\}$ sẽ ghép cặp với A ở các cột.
  - Các kiểu cột bắt buộc: $t_(A B) = 1, t_(A C) = 1, t_(A D) = 1$.

  Áp dụng công thức:
  1. Số cách gán kiểu cột vào 3 vị trí: $M = frac(3!, 1! times 1! times 1!) = 6$ cách.
  2. Hoán vị học sinh: $3!$ (lớp A) $times 1!$ (B) $times 1!$ (C) $times 1!$ (D) $= 6$ cách.
  3. Chọn hàng: $2^3 = 8$ cách.

  Tổng số cách xếp là:
  $ N = 6 times 6 times 8 = bold(288) " cách." $
]

*⬧ Dạng 1.4.2 — Các lớp bằng nhau và bằng 2 học sinh ($n_A = n_B = n_C = dots = 2$)*

Đây là dạng toán rất thú vị khi tất cả các lớp đều có quy mô nhỏ là 2 học sinh. Ta có thể giải quyết nhanh bằng việc phân tích cấu trúc ghép cột thông qua sơ đồ nối lớp (đồ thị).

#eg-box(title: [🎯 Ví Dụ 1.5 — Quy mô nhỏ: 2A, 2B, 2C ngồi 2 hàng 3 ghế ($m=3$)])[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C. Xếp vào 2 hàng 3 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.

  *Lời giải chi tiết:*
  Ta có $m = 3$ cột. Ta tìm phương án phân bổ kiểu cột thỏa mãn hệ phương trình:
  $
    t_(A B) + t_(A C) = n_A = 2 \
    t_(A B) + t_(B C) = n_B = 2 \
    t_(A C) + t_(B C) = n_C = 2
  $
  Cộng 3 phương trình ta được $2(t_(A B) + t_(A C) + t_(B C)) = 6 arrow.r t_(A B) + t_(A C) + t_(B C) = 3 = m$.
  Giải hệ phương trình ta được duy nhất một phương án phân bổ cột:
  $ t_(A B) = 1, t_(A C) = 1, t_(B C) = 1 $
  Tức là có đúng 1 cột $\{A, B\}$, 1 cột $\{A, C\}$, và 1 cột $\{B, C\}$.

  Áp dụng công thức tính số cách xếp:
  1. Số cách gán kiểu cột vào 3 vị trí: $M = frac(3!, 1! times 1! times 1!) = 6$ cách.
  2. Hoán vị học sinh: $2!$ (lớp A) $times 2!$ (B) $times 2!$ (C) $= 8$ cách.
  3. Chọn hàng cho mỗi cột: $2^3 = 8$ cách.

  Tổng số cách xếp thu được là:
  $ N = 6 times 8 times 8 = bold(384) " cách." $
]

#eg-box(title: [🎯 Ví Dụ 1.6 — Quy mô lớn: 2A, 2B, 2C, 2D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C, 2 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của mỗi lớp là $n_A = n_B = n_C = n_D = 2$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Phương pháp phân tích chu trình đồ thị*
  Mỗi lớp có đúng 2 học sinh nên mỗi lớp phải xuất hiện trong đúng 2 cột khác nhau. Ta phân tích các cấu trúc ghép cột hợp lệ dưới dạng đồ thị (coi các cột là cạnh nối giữa các lớp):
  - *Trường hợp 1: Tạo thành một vòng khép kín duy nhất 4 đỉnh (Single 4-cycle).* Các cột ghép các lớp theo vòng tròn khép kín dạng: A - B - C - D - A.
    1. Số cách lập vòng tròn từ 4 lớp: $frac((4-1)!, 2) = 3$ cách (gồm: A-B-C-D-A, A-B-D-C-A, A-C-B-D-A).
    2. Với mỗi vòng tròn lớp, kiểu cột được xác định độc nhất.
    3. Số cách xếp cho TH1 là:
       $ N_1 = 3 times underbrace(4!, "Gán vào 4 cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 24 times 16 times 16 = bold(18432) " cách." $
  - *Trường hợp 2: Tạo thành 2 vòng nhỏ 2 đỉnh (Hai cặp song song).* 4 lớp chia làm 2 cặp tự ghép với nhau. Ví dụ: cặp $\{A, B\}$ ghép 2 cột và $\{C, D\}$ ghép 2 cột.
    1. Số cách phân 4 lớp thành 2 cặp: $frac(1, 2) binom(4, 2) = 3$ cách.
    2. Với mỗi cách chia, kiểu cột gồm 2 cột kiểu này và 2 cột kiểu kia (ví dụ: 2 cột $\{A, B\}$, 2 cột $\{C, D\}$).
    3. Số cách xếp cho TH2 là:
       $ N_2 = 3 times underbrace(frac(4!, 2! times 2!), "Gán kiểu cột") times underbrace(2! 2! 2! 2!, "Hoán vị học sinh") times underbrace(2^4, "Đảo hàng") = 3 times 6 times 16 times 16 = bold(4608) " cách." $
  
   $arrow.r$  Tổng số cách xếp: $N = N_1 + N_2 = 18432 + 4608 = bold(23040)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \
  t_(A B) + t_(A C) + t_(A D) = n_A = 2 quad &("lượt xuất hiện của A") \
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \
  t_(A D) + t_(B D) + t_(C D) = n_D = 2 quad &("lượt xuất hiện của D")
  $
  Ta biện luận nghiệm nguyên không âm của hệ phương trình dựa trên giới hạn trên của các biến. Vì mỗi lớp chỉ có 2 học sinh, nên số cột chung của hai lớp bất kỳ $t_(i j) <= 2$.
  - *Trường hợp 2.1: Có một biến $t_(i j) = 2$ (cấu hình hai cặp song song)*
    Không mất tính tổng quát, giả sử $t_(A B) = 2$. Khi đó từ các phương trình của A và B, ta có các biến liên quan khác bằng 0: $t_(A C) = t_(A D) = t_(B C) = t_(B D) = 0$. 
    Thay vào phương trình của C và D ta được $t_(C D) = 2$.
    Vậy ta có cấu hình: $ {2 times (A, B), 2 times (C, D)} $.
    Do tính đối xứng, ta có 3 cách chia 4 lớp thành 2 cặp tương tự:
    1. $ {2 times (A, B), 2 times (C, D)} $  $arrow.r$  Số cấu hình cột $M_1 = frac(4!, 2! 2!) = 6$.
    2. $ {2 times (A, C), 2 times (B, D)} $  $arrow.r$  Số cấu hình cột $M_2 = 6$.
    3. $ {2 times (A, D), 2 times (B, C)} $  $arrow.r$  Số cấu hình cột $M_3 = 6$.
    Tổng cộng cho trường hợp này có $6 + 6 + 6 = 18$ cấu hình cột.
  
  - *Trường hợp 2.2: Tất cả các biến $t_(i j) <= 1$ (cấu hình một vòng lớn 4 đỉnh)*
    Hệ phương trình chỉ có các nghiệm mà các biến chỉ nhận giá trị $0$ hoặc $1$. Để tổng số lượt xuất hiện của mỗi lớp bằng 2, mỗi lớp phải ghép với đúng 2 lớp khác. Điều này tương ứng với các cấu hình vòng khép kín.
    Có 3 nghiệm tương ứng với 3 vòng tròn:
    1. Vòng $A-B-C-D-A$  $arrow.r$  Cấu hình $ {1 times (A, B), 1 times (B, C), 1 times (C, D), 1 times (A, D)} $ $ arrow.r $ Số cấu hình cột là $frac(4!, 1! 1! 1! 1!) = 24$.
    2. Vòng $A-B-D-C-A$  $arrow.r$  Cấu hình $ {1 times (A, B), 1 times (B, D), 1 times (C, D), 1 times (A, C)} $ $ arrow.r $ Số cấu hình cột là $24$.
    3. Vòng $A-C-B-D-A$  $arrow.r$  Cấu hình $ {1 times (A, C), 1 times (B, C), 1 times (B, D), 1 times (A, D)} $ $ arrow.r $ Số cấu hình cột là $24$.
    Tổng cộng cho trường hợp này có $24 + 24 + 24 = 72$ cấu hình cột.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.6)")[
    #align(center)[
      #table(
        columns: (2.2fr, 1.2fr, 1.6fr),
        inset: 6pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình lớp]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$2 times (A, B), 2 times (C, D)$ \ (và 2 hoán vị lớp)],
        [$3$],
        [$3 times frac(4!, 2! 2!) = 18$],

        [$1 times (A, B), 1 times (B, C), \ 1 times (C, D), 1 times (A, D)$ \ (và 2 hoán vị vòng)],
        [$3$],
        [$3 times frac(4!, 1! 1! 1! 1!) = 72$]
      )
    ]
    Tổng số cấu hình cột hợp lệ thu được là: $M = 18 + 72 = 90$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 90 times (2! times 2! times 2! times 2!) times 16 = 90 times 16 times 16 = bold(23040) " cách." $
  ]
]

*⬧ Dạng 1.4.3 — Hai lớp lớn bằng nhau và hai lớp đơn lẻ ($n_A = n_B = m - 1, n_C = n_D = 1$)*

Dạng toán này có đặc trưng là hai lớp nhỏ (C và D) mỗi lớp chỉ có đúng 1 học sinh. Do đó, vị trí của C và D sẽ quyết định toàn bộ cấu trúc phân bổ cột.

#eg-box(title: [🎯 Ví Dụ 1.7 — Quy mô nhỏ: 2A, 2B, 1C, 1D ngồi 2 hàng 3 ghế ($m=3$)])[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 3 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 3$ cột. Học sinh của các lớp là $n_A = 2, n_B = 2, n_C = 1, n_D = 1$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Chia trường hợp theo vị trí của C và D (Phương pháp ghép nhóm thủ công)*
  Ta phân tích các phương án dựa vào vị trí của C và D:
  - *Trường hợp 1: C và D ngồi đối diện nhau.* Có 1 cột kiểu $(C, D)$. Hai cột còn lại chứa 2A và 2B  $arrow.r$  bắt buộc phải là 2 cột kiểu $(A, B)$.
    1. Số cách gán kiểu cột vào vị trí: $M_1 = frac(3!, 1! times 2!) = 3$ cách.
    2. Hoán vị học sinh cụ thể: $2!$ (lớp A) $times 2!$ (lớp B) $times 1!$ (lớp C) $times 1!$ (lớp D) $= 4$ cách.
    3. Đảo hàng: $2^3 = 8$ cách.
    4. Đóng góp TH1: $N_1 = 3 times 4 times 8 = bold(96)$ cách.
    
  - *Trường hợp 2: C và D đối diện với học sinh lớp khác.*
    1. *TH2a: C ghép với A, D ghép với B.* Kiểu cột gồm: 1 cột $(A, C)$, 1 cột $(B, D)$. Cột còn lại chứa 1A và 1B còn lại  $arrow.r$  kiểu $(A, B)$.
       Số cách gán kiểu cột: $M_(2a) = frac(3!, 1! times 1! times 1!) = 6$ cách.
       Đóng góp TH2a: $N_(2a) = 6 times 4 times 8 = bold(192)$ cách.
    2. *TH2b: C ghép với B, D ghép với A.* Kiểu cột gồm: 1 cột $(B, C)$, 1 cột $(A, D)$ và 1 cột $(A, B)$.
       Tương tự TH2a, số cách gán kiểu cột: $M_(2b) = 6$ cách.
       Đóng góp TH2b: $N_(2b) = bold(192)$ cách.
       
   $arrow.r$  Tổng số cách xếp là: $N = N_1 + N_(2a) + N_(2b) = 96 + 192 + 192 = bold(480)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 3$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 3 quad &("tổng số cột") \
  t_(A B) + t_(A C) + t_(A D) = n_A = 2 quad &("lượt xuất hiện của A") \
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \
  t_(A C) + t_(B C) + t_(C D) = n_C = 1 quad &("lượt xuất hiện của C") \
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta chọn biến có giới hạn hẹp nhất để biện luận. Vì $n_C = n_D = 1$, ta có $t_(C D) <= 1$.
  - *Trường hợp 2.1: $t_(C D) = 1$*
    Khi đó bắt buộc các cột chứa C hoặc D khác đều bằng 0 ($t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$). 
    Thay vào phương trình của A và B ta được $t_(A B) = 2$.
    Vậy ta có duy nhất cấu hình cột: $ {2 times (A, B), 1 times (C, D)} $.
    + Số cách gán kiểu cột vào 3 vị trí: $M_1 = frac(3!, 2! 1!) = 3$ cách.
  
  - *Trường hợp 2.2: $t_(C D) = 0$*
    Khi đó phương trình của C và D trở thành: $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$.
    Điều này cho ta 4 trường hợp con của cặp $((t_(A C), t_(B C)), (t_(A D), t_(B D)))$:
    1. *Khả năng 1:* $t_(A C) = 1, t_(A D) = 1$  $arrow.r$  $t_(B C) = 0, t_(B D) = 0$. Thay vào phương trình A ta được $t_(A B) + 2 = 2  arrow.r.double  t_(A B) = 0$. Thay vào B ta được $0 + 0 + 0 = 0 
eq 2$ (loại).
    2. *Khả năng 2:* $t_(B C) = 1, t_(B D) = 1$  $arrow.r$  $t_(A C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) = 2$. Thay vào B ta được $2 + 1 + 1 = 4 
eq 2$ (loại).
    3. *Khả năng 3:* $t_(A C) = 1, t_(B D) = 1$  $arrow.r$  $t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B ta được $1 + 0 + 1 = 2$ (thỏa mãn).
       Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D)} $.
       + Số cách gán $M_2 = frac(3!, 1! 1! 1!) = 6$.
    4. *Khả năng 4:* $t_(B C) = 1, t_(A D) = 1$  $arrow.r$  $t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B ta được $1 + 1 + 0 = 2$ (thỏa mãn).
       Ta thu được cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D)} $.
       + Số cách gán $M_3 = frac(3!, 1! 1! 1!) = 6$.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.7)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(2, 0, 0, 0, 0, 1)$], [$2 times (A, B) \ 1 times (C, D)$], [$frac(3!, 2! 1!) = 3$],
        [$(1, 1, 0, 0, 1, 0)$], [$1 times (A, B) \ 1 times (A, C) \ 1 times (B, D)$], [$frac(3!, 1! 1! 1!) = 6$],
        [$(1, 0, 1, 1, 0, 0)$], [$1 times (A, B) \ 1 times (B, C) \ 1 times (A, D)$], [$frac(3!, 1! 1! 1!) = 6$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 3 + 6 + 6 = 15$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^3 = 8$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^3 = 15 times (2! times 2! times 1! times 1!) times 8 = 15 times 4 times 8 = bold(480) " cách." $
  ]
]

#eg-box(title: [🎯 Ví Dụ 1.8 — Quy mô lớn: 3A, 3B, 1C, 1D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 3 học sinh A, 3 học sinh B, 1 học sinh C, 1 học sinh D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 1, n_D = 1$.
  Dưới đây là 2 cách tiếp cận giải quyết bài toán:

  *🔵 Cách 1: Chia trường hợp theo sự đối diện của C và D (Phương pháp ghép nhóm thủ công)*
  Ta chia làm các trường hợp tương ứng dựa trên sự đối diện của C và D:
  - *Trường hợp 1: C và D ngồi đối diện nhau.* Cột chứa C và D có kiểu $(C, D)$ (1 cột). Để phân bổ hết 3A và 3B vào 3 cột còn lại, bắt buộc cả 3 cột còn lại đều có kiểu $(A, B)$ (3 cột).
    1. Số cách gán kiểu cột vào vị trí: $M_1 = frac(4!, 1! times 3!) = 4$ cách.
    2. Đóng góp số cách xếp của TH1:
       $ N_1 = 4 times (3! times 3! times 1! times 1!) times 2^4 = 4 times 36 times 16 = bold(2304) " cách." $
  - *Trường hợp 2: C ngồi đối diện với một bạn lớp B, D đối diện một bạn lớp A.* Ta có kiểu cột: 1 cột $(B, C)$, 1 cột $(A, D)$. Còn lại 2 học sinh A và 2 học sinh B phân bổ vào 2 cột còn lại  $arrow.r$  bắt buộc có kiểu $(A, B)$ (2 cột).
    1. Số cách gán kiểu cột vào vị trí: $M_2 = frac(4!, 1! times 1! times 2!) = 12$ cách.
    2. Đóng góp số cách xếp của TH2:
       $ N_2 = 12 times (3! times 3! times 1! times 1!) times 2^4 = 12 times 36 times 16 = bold(6912) " cách." $
  - *Trường hợp 3: C ngồi đối diện một bạn lớp A, D đối diện một bạn lớp B.* Do tính đối xứng của A và B, trường hợp này cho kết quả tương tự Trường hợp 2:
    1. Số cách gán kiểu cột: $M_3 = 12$ cách.
    2. Đóng góp: $N_3 = bold(6912)$ cách.
  
   $arrow.r$  Tổng số cách xếp là: $N = N_1 + N_2 + N_3 = 2304 + 6912 + 6912 = bold(16128)$ cách.

  *🟣 Cách 2: Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*
  Ta gọi kiểu cột $(X_i, X_j)$ là cột chứa 1 học sinh lớp $X_i$ và 1 học sinh lớp $X_j$. Gọi $t_(i j)$ là số cột tương ứng.
  Vì không có cặp đối diện nào cùng lớp, các kiểu cột có thể có là các cặp phân biệt chọn từ $\{A, B, C, D\}$:
  $ (A, B), (A, C), (A, D), (B, C), (B, D), (C, D) $
  Để phân bổ hết số học sinh của các lớp vào 4 cột ($m = 4$), ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \
  t_(A C) + t_(B C) + t_(C D) = n_C = 1 quad &("lượt xuất hiện của C") \
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Vì $n_C = n_D = 1$, ta dễ dàng biện luận các cấu trúc nghiệm nguyên không âm của hệ phương trình trên theo giá trị của $t_(C D)$:
  - *Trường hợp 2.1: $t_(C D) = 1$*  $arrow.r$  Bắt buộc các cột chứa C hoặc D khác đều bằng 0 ($t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$). Thay vào ta được $t_(A B) = 3$.
    Ta thu được cấu trúc cột: $ {3 times (A, B), 1 times (C, D)} $ $ arrow.r $ Số cấu hình cột $M_1 = frac(4!, 3! 1!) = 4$.
  - *Trường hợp 2.2: $t_(C D) = 0$*  $arrow.r$  Bắt buộc $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 cấu trúc nghiệm thỏa mãn:
    + Cấu hình $2.2a$: $ {2 times (A, B), 1 times (A, C), 1 times (B, D)} $ (ứng với $t_(A C) = 1, t_(B D) = 1$) $ arrow.r $ Số cấu hình cột $M_2 = frac(4!, 2! 1! 1!) = 12$.
    + Cấu hình $2.2b$: $ {2 times (A, B), 1 times (B, C), 1 times (A, D)} $ (ứng với $t_(B C) = 1, t_(A D) = 1$) $ arrow.r $ Số cấu hình cột $M_3 = frac(4!, 2! 1! 1!) = 12$.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.8)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(3, 0, 0, 0, 0, 1)$], [$3 times (A, B) \ 1 times (C, D)$], [$frac(4!, 3! 1!) = 4$],
        [$(2, 1, 0, 0, 1, 0)$], [$2 times (A, B) \ 1 times (A, C) \ 1 times (B, D)$], [$frac(4!, 2! 1! 1!) = 12$],
        [$(2, 0, 1, 1, 0, 0)$], [$2 times (A, B) \ 1 times (B, C) \ 1 times (A, D)$], [$frac(4!, 2! 1! 1!) = 12$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 4 + 12 + 12 = 28$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 28 times (3! times 3! times 1! times 1!) times 16 = 28 times 36 times 16 = bold(16128) " cách." $
  ]
]

#eg-box(title: [🎯 Ví Dụ 1.9 — Hệ phức tạp hơn: 3A, 2B, 2C, 1D ngồi 2 hàng 4 ghế ($m=4$)])[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 4 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 2, n_C = 2, n_D = 1$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 4$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 4 quad &("tổng số cột") \
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \
  t_(A B) + t_(B C) + t_(B D) = n_B = 2 quad &("lượt xuất hiện của B") \
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta chọn biến có giới hạn hẹp nhất để biện luận. Vì $n_D = 1$, ta có $t_(A D) + t_(B D) + t_(C D) = 1$. Do đó, có đúng một trong ba biến này nhận giá trị bằng 1, hai biến còn lại bằng 0:
  
  - *Trường hợp 1: $t_(C D) = 1$*  $arrow.r$  $t_(A D) = 0, t_(B D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 3     t_(A B) + t_(B C) = 2     t_(A C) + t_(B C) = 1
    $
    Giải hệ con này bằng cách trừ phương trình (3) khỏi (1): $t_(A B) - t_(B C) = 2$.
    Cộng với phương trình (2): $2 t_(A B) = 4 arrow.r.double t_(A B) = 2$, từ đó $t_(B C) = 0$ và $t_(A C) = 1$.
    Bộ nghiệm này thỏa mãn tổng số cột ($2 + 1 + 1 = 4$).
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (C, D)} $.
    + Số cấu hình cột: $M_1 = frac(4!, 2! 1! 1!) = 12$ cách.
    
  - *Trường hợp 2: $t_(B D) = 1$*  $arrow.r$  $t_(A D) = 0, t_(C D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 3     t_(A B) + t_(B C) = 1     t_(A C) + t_(B C) = 2
    $
    Từ (2), vì $t_(A B), t_(B C)$ nguyên không âm nên chỉ có 2 khả năng:
    + *Khả năng 2.1:* $t_(A B) = 1, t_(B C) = 0 arrow.r.double t_(A C) = 2$ (từ 1). Thay vào (3): $2 + 0 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (A, C), 1 times (B, D)} $.
      Số cấu hình cột: $M_2 = frac(4!, 1! 2! 1!) = 12$ cách.
    + *Khả năng 2.2:* $t_(A B) = 0, t_(B C) = 1 arrow.r.double t_(A C) = 3$ (từ 1). Thay vào (3): $3 + 1 = 4 != 2$ (loại).
    
  - *Trường hợp 3: $t_(A D) = 1$*  $arrow.r$  $t_(B D) = 0, t_(C D) = 0$.
    Thay vào hệ phương trình ta được:
    $
    t_(A B) + t_(A C) = 2     t_(A B) + t_(B C) = 2     t_(A C) + t_(B C) = 2
    $
    Giải hệ con đối xứng này ta được nghiệm duy nhất: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D)} $.
    + Số cấu hình cột: $M_3 = frac(4!, 1! 1! 1! 1!) = 24$ cách.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.9)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(2, 1, 0, 0, 0, 1)$], [$2 times (A, B) \ 1 times (A, C) \ 1 times (C, D)$], [$frac(4!, 2! 1! 1!) = 12$],
        [$(1, 2, 0, 0, 1, 0)$], [$1 times (A, B) \ 2 times (A, C) \ 1 times (B, D)$], [$frac(4!, 1! 2! 1!) = 12$],
        [$(1, 1, 1, 1, 0, 0)$], [$1 times (A, B) \ 1 times (A, C) \ 1 times (B, C) \ 1 times (A, D)$], [$frac(4!, 1! 1! 1! 1!) = 24$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 12 + 12 + 24 = 48$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^4 = 48 times (3! times 2! times 2! times 1!) times 16 = 48 times 24 times 16 = bold(18432) " cách." $
  ]
]

#eg-box(title: [🎯 Ví Dụ 1.10 — Lớp quy mô lớn: 4A, 3B, 2C, 1D ngồi 2 hàng 5 ghế ($m=5$)])[
  Có 4 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C, 1 học sinh lớp D. Xếp vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
  
  *Lời giải chi tiết:*
  Ta có $m = 5$ cột. Học sinh của các lớp là $n_A = 4, n_B = 3, n_C = 2, n_D = 1$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 5$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 5 quad &("tổng số cột") \
  t_(A B) + t_(A C) + t_(A D) = n_A = 4 quad &("lượt xuất hiện của A") \
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \
  t_(A D) + t_(B D) + t_(C D) = n_D = 1 quad &("lượt xuất hiện của D")
  $
  Ta nhận xét rằng tổng số cột là 5, trong khi lớp A có số học sinh bằng 4. Do đó, chỉ có đúng $5 - 4 = 1$ cột không chứa học sinh lớp A.
  Nghĩa là: $t_(B C) + t_(B D) + t_(C D) = 1$.
  Vì các biến nguyên không âm, ta biện luận theo 3 trường hợp tương ứng:
  
  - *Trường hợp 1: $t_(C D) = 1$*  $arrow.r$  $t_(B C) = 0, t_(B D) = 0$.
    Từ phương trình của D ($t_(A D) + t_(B D) + t_(C D) = 1$), ta suy ra $t_(A D) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 4     t_(A B) = 3     t_(A C) + 1 = 2 arrow.r.double t_(A C) = 1
    $
    Nghiệm thu được: $t_(A B) = 3, t_(A C) = 1, t_(C D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {3 times (A, B), 1 times (A, C), 1 times (C, D)} $.
    + Số cấu hình cột: $M_1 = frac(5!, 3! 1! 1!) = 20$ cách.
    
  - *Trường hợp 2: $t_(B D) = 1$*  $arrow.r$  $t_(B C) = 0, t_(C D) = 0$.
    Từ phương trình của D, ta suy ra $t_(A D) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 4     t_(A B) + 1 = 3 arrow.r.double t_(A B) = 2     t_(A C) = 2
    $
    Nghiệm thu được: $t_(A B) = 2, t_(A C) = 2, t_(B D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {2 times (A, B), 2 times (A, C), 1 times (B, D)} $.
    + Số cấu hình cột: $M_2 = frac(5!, 2! 2! 1!) = 30$ cách.
    
  - *Trường hợp 3: $t_(B C) = 1$*  $arrow.r$  $t_(B D) = 0, t_(C D) = 0$.
    Từ phương trình của D, ta suy ra $t_(A D) = 1$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) + 1 = 4 arrow.r.double t_(A B) + t_(A C) = 3     t_(A B) + 1 = 3 arrow.r.double t_(A B) = 2     t_(A C) + 1 = 2 arrow.r.double t_(A C) = 1
    $
    Nghiệm thu được: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 1, t_(A D) = 1$ (thỏa mãn).
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D)} $.
    + Số cấu hình cột: $M_3 = frac(5!, 2! 1! 1! 1!) = 60$ cách.

  #rev-box(title: "🧩 Bảng tính số cấu hình cột (Ví dụ 1.10)")[
    #align(center)[
      #table(
        columns: (1.4fr, 2.3fr, 1.8fr),
        inset: 7pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("4A148C") } else { none },
        stroke: 0.5pt + col-violet,
        [#text(fill: white, weight: "bold")[Bộ ẩn $(t_(A B), t_(A C), t_(A D), t_(B C), t_(B D), t_(C D))$]],
        [#text(fill: white, weight: "bold")[Cấu hình loại cột]],
        [#text(fill: white, weight: "bold")[Số cấu hình cột M]],
        
        [$(3, 1, 0, 0, 0, 1)$], [$3 times (A, B) \ 1 times (A, C) \ 1 times (C, D)$], [$frac(5!, 3! 1! 1!) = 20$],
        [$(2, 2, 0, 0, 1, 0)$], [$2 times (A, B) \ 2 times (A, C) \ 1 times (B, D)$], [$frac(5!, 2! 2! 1!) = 30$],
        [$(2, 1, 1, 1, 0, 0)$], [$2 times (A, B) \ 1 times (A, C) \ 1 times (B, C) \ 1 times (A, D)$], [$frac(5!, 2! 1! 1! 1!) = 60$]
      )
    ]
    Tổng số cấu hình cột hợp lệ là: $M = 20 + 30 + 60 = 110$ cấu hình.
    
    Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^5 = 32$):
    $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 110 times (4! times 3! times 2! times 1!) times 32 = 110 times 288 times 32 = bold(1013760) " cách." $
  ]
]

== 1.5 — Bài Tập Luyện Chương 1

#recap-box[
  *Dạng 1 — 2 lớp bằng nhau:* $n_A = n_B = m arrow.r$ Áp dụng trực tiếp $N = 2^m (m!)^2$.
]

#ex-box(title: "✏️ Bài C1")[
  Có 4 học sinh lớp A và 4 học sinh lớp B. Xếp tất cả vào 2 hàng 4 ghế đối diện nhau sao cho không có 2 học sinh cùng lớp ngồi đối diện. Hỏi có bao nhiêu cách?
]
#step-box[
  Ta có $n_A = n_B = m = 4$. Áp dụng công thức trực tiếp:
  $ N = 2^4 times (4!)^2 = 16 times 576 = bold(9216) " cách." $
]

#recap-box[
  *Chú ý điều kiện tồn tại:* Tổng số học sinh phải luôn là số chẵn ($2m$). Nếu tổng số học sinh là số lẻ, bài toán lập tức không có cách xếp thỏa mãn (đáp án bằng 0).
]

#ex-box(title: "✏️ Bài C2 — Phân tích sự tồn tại nghiệm")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 3 học sinh lớp C. Xếp tất cả vào 2 hàng ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Hỏi có bao nhiêu cách xếp?
]
#step-box[
  Tổng số học sinh là $3 + 3 + 3 = 9$ học sinh (số lẻ). Do mỗi cột ghế đối diện bắt buộc phải có đúng 2 học sinh, tổng số ghế của cả 2 hàng phải là một số chẵn. Không thể chia đều 9 học sinh vào các cột ghế đối diện mà không để lại ghế trống hoặc thừa người. Do đó, bài toán này không có cách xếp thỏa mãn (đáp án bằng $bold(0)$ cách).
]

#recap-box[
  *Biến thể hàng 1/hàng 2:* Phân tích từng học sinh bị ràng buộc. Dùng quy tắc nhân độc lập theo từng bước ghép.
]

#ex-box(title: "✏️ Bài C3 — Phân Biệt Hai Hàng Ghế")[
  Xét lại Bài C1 (4A, 4B, 2 hàng 4 ghế). Bây giờ thêm điều kiện: 3 học sinh đặc biệt $A_1, B_1, B_2$ *không được ngồi Hàng 1*. Tính lại số cách.
]
#step-box[
  Bây giờ Hàng 1 chỉ có thể chứa $A_2, A_3, A_4$ (3 học sinh A) và không ai trong $B_1, B_2$ (chỉ có $B_3, B_4$ được ở Hàng 1).
  Cột nào được chia $A_i$ (Hàng 1) và $B_j$ (Hàng 2): không phải tất cả cột đều có thể như vậy nữa.

  *Phân tích cụ thể:*
  - $A_1$ phải ở Hàng 2. $B_1, B_2$ phải ở Hàng 2.
  - Trong 4 cột, mỗi cột có 1 A và 1 B, nhưng ai ở Hàng 1 bị hạn chế.
  - Cột chứa $A_1$: A ở Hàng 2  $arrow.r$  B ở Hàng 1. B ở Hàng 1 phải là $B_3$ hoặc $B_4$.
  - Cột chứa $B_1$: B ở Hàng 2  $arrow.r$  A ở Hàng 1. A ở Hàng 1 chỉ được là $A_2, A_3, A_4$.
  - Cột chứa $B_2$: tương tự, A ở Hàng 1 chỉ là $A_2, A_3, A_4$.

  *Phương pháp bước:*
  - *Bước 1:* Ghép $A_1$ vào một cột với một B nào đó. Vì $A_1$ phải Hàng 2, B cùng cột phải Hàng 1, tức B phải là $B_3$ hoặc $B_4$ (vì $B_1, B_2$ không được Hàng 1): *2 cách* chọn B.
  - *Bước 2:* Ghép $B_1$ với một A nào đó. $B_1$ Hàng 2, A cùng cột Hàng 1, A phải là $A_2, A_3, A_4$. Nhưng 1 trong số $A_2, A_3, A_4$ đã đi với cột trên: còn *3 cách* chọn A.
  - *Bước 3:* Ghép $B_2$ tương tự: còn *2 cách*.
  - *Bước 4:* Cột cuối (còn 1 A và 1 B): 1 cách, cả 2 có thể lên Hàng 1 hoặc không (kiểm tra: A còn lại là $A_?$ không cấm Hàng 1, B còn lại là $B_3$ hoặc $B_4$ không cấm Hàng 1). Hàng 1: *2 cách*.
  - *Bước 5:* Gán 4 cột vào 4 vị trí cột (thứ tự từ trái qua phải): $4! = 24$ cách.

  Vậy số cách xếp là:
  $ N = 2 times 3 times 2 times 2 times 24 = bold(576) " cách." $
]

#recap-box[
  *Nhiều lớp — $n_(max) = m$:* Lớp chiếm đúng nửa  $arrow.r$  mỗi cột bắt buộc 1 người lớp đó  $arrow.r$  1 phân bổ duy nhất.
]

#ex-box(title: "✏️ Bài C4 — Nhiều Lớp, Lớp Lớn Chiếm Nửa")[
  Có 4 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D. Xếp tất cả vào 2 hàng 4 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách.
]
#step-box[
  Ta có $n_A = 4 = m$. Lớp A chiếm đúng nửa số ghế, do đó mỗi cột bắt buộc chứa đúng 1 bạn lớp A. Các bạn còn lại $\{B, B, C, D\}$ sẽ ghép cặp với A ở các cột.
  - Các kiểu cột bắt buộc: $t_(A B) = 2, t_(A C) = 1, t_(A D) = 1$.

  Áp dụng công thức:
  1. Số cách gán kiểu cột vào vị trí: $M = frac(4!, 2! times 1! times 1!) = 12$ cách.
  2. Hoán vị học sinh: $4!$ (lớp A) $times 2!$ (B) $times 1!$ (C) $times 1!$ (D) $= 48$ cách.
  3. Chọn hàng cho mỗi cột: $2^4 = 16$ cách.

  Vậy tổng số cách xếp là:
  $ N = 12 times 48 times 16 = bold(9216) " cách." $
]

#recap-box[
  *Nhiều lớp — $n_(max) < m$:* Liệt kê tất cả phân bổ kiểu cột, bắt đầu từ lớp nhỏ nhất. Cộng đóng góp từng phân bổ.
]

#ex-box(title: "✏️ Bài C5 — Nhiều Lớp, Nhiều Phân Bổ")[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C ngồi vào 2 hàng 3 ghế. Không cặp đối diện nào cùng lớp. Tính số cách.
]
#step-box[
  Ta có $n_A = 3 = m = 3$. Lớp A chiếm đúng nửa số ghế, do đó mỗi cột bắt buộc chứa đúng 1 bạn lớp A. Các bạn còn lại $\{B, B, C\}$ sẽ ghép cặp với A ở các cột.
  - Các kiểu cột bắt buộc: $t_(A B) = 2, t_(A C) = 1$.

  Áp dụng công thức:
  1. Số cách gán kiểu cột vào vị trí: $M = frac(3!, 2! times 1!) = 3$ cách.
  2. Hoán vị học sinh: $3!$ (lớp A) $times 2!$ (B) $times 1!$ (C) $= 6 times 2 times 1 = 12$ cách.
  3. Chọn hàng cho mỗi cột: $2^3 = 8$ cách.

  Vậy tổng số cách xếp là:
  $ N = 3 times 12 times 8 = bold(288) " cách." $
]

#ex-box(title: "✏️ Bài C6 — Biện Luận Nghiệm Lưới 4 Cột")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C. Xếp tất cả vào 2 hàng 4 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 4$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C\}$. Để phân bổ hết học sinh vào $m = 4$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(B C) = 4 quad &("tổng số cột") \\
  t_(A B) + t_(A C) = n_A = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) = n_B = 3 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) = n_C = 2 quad &("lượt xuất hiện của C")
  $
  Cộng ba phương trình xuất hiện của từng lớp:
  $ 2(t_(A B) + t_(A C) + t_(B C)) = 3 + 3 + 2 = 8 arrow.r.double t_(A B) + t_(A C) + t_(B C) = 4 $
  Điều này hoàn toàn khớp với phương trình tổng số cột. Giải hệ bằng cách trừ lần lượt phương trình xuất hiện của mỗi lớp khỏi tổng số cột, ta thu được nghiệm duy nhất:
  - $t_(B C) = 4 - 3 = 1$
  - $t_(A C) = 4 - 3 = 1$
  - $t_(A B) = 4 - 2 = 2$
  
  Ta thu được cấu hình cột duy nhất: $ {2 times (A, B), 1 times (A, C), 1 times (B, C)} $.
  + Số cấu hình cột là: $M = frac(4!, 2! 1! 1!) = 12$ cấu hình.
  
  Lúc này mới nhân với hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng của mỗi cột ($2^4 = 16$):
  $ N = M times (n_A! n_B! n_C!) times 2^4 = 12 times (3! times 3! times 2!) times 16 = 12 times 72 times 16 = bold(13824) " cách." $
]

#ex-box(title: "✏️ Bài C7 — Biện Luận Nghiệm Khi Có Ghế Trống E")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C và 1 ghế trống E. Xếp tất cả vào 2 hàng 3 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 3$ cột. Ghế trống E hoạt động như một "lớp đặc biệt" có 1 phần tử.
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ (hoặc ghế trống E) với các cặp $(i, j)$ chọn từ $\{A, B, C, E\}$. Vì $n_E = 1$, không thể có cột trống $\{E, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) = 3 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A E) = n_A = 2 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B E) = n_B = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C E) = n_C = 1 quad &("lượt xuất hiện của C") \\
  t_(A E) + t_(B E) + t_(C E) = n_E = 1 quad &("lượt xuất hiện của E")
  $
  Vì $n_E = 1$, ta biện luận nghiệm nguyên không âm theo giá trị của $t_(C E) <= 1$:
  - *Trường hợp 1: $t_(C E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = t_(A C) = t_(B C) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 2$.
    Nghiệm thu được: $t_(A B) = 2, t_(C E) = 1$ (các biến khác bằng 0), thỏa mãn tổng số cột.
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(3!, 2! 1!) = 3$.
  - *Trường hợp 2: $t_(C E) = 0$* $arrow.r$ $t_(A C) + t_(B C) = 1$ và $t_(A E) + t_(B E) = 1$.
    Biện luận 4 khả năng cho cặp $((t_(A C), t_(B C)), (t_(A E), t_(B E)))$:
    + *Khả năng 2.1:* $t_(A C) = 1, t_(A E) = 1 arrow.r.double t_(B C) = 0, t_(B E) = 0$. Thay vào A ta được $t_(A B) + 2 = 2 arrow.r.double t_(A B) = 0$. Thay vào B ta được $0 != 2$ (loại).
    + *Khả năng 2.2:* $t_(B C) = 1, t_(B E) = 1 arrow.r.double t_(A C) = 0, t_(A E) = 0$. Tương tự, thay vào B ta được $t_(A B) = 0$, thay vào A ta được $0 != 2$ (loại).
    + *Khả năng 2.3:* $t_(A C) = 1, t_(B E) = 1 arrow.r.double t_(B C) = 0, t_(A E) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B: $1 + 0 + 1 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_2 = frac(3!, 1! 1! 1!) = 6$.
    + *Khả năng 2.4:* $t_(B C) = 1, t_(A E) = 1 arrow.r.double t_(A C) = 0, t_(B E) = 0$. Thay vào A ta được $t_(A B) + 1 = 2 arrow.r.double t_(A B) = 1$. Thay vào B: $1 + 1 + 0 = 2$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 6$.
  
  Tổng số cấu hình cột hợp lệ là $M = 3 + 6 + 6 = 15$ cấu hình.
  Lúc này mới nhân hoán vị học sinh (ghế trống E chỉ có 1 cách xếp) và số cách đảo hàng ($2^3 = 8$):
  $ N = M times (n_A! n_B! n_C! n_E!) times 2^3 = 15 times (2! times 2! times 1! times 1!) times 8 = 15 times 4 times 8 = bold(480) " cách." $
]

#ex-box(title: "✏️ Bài C8 — Biện Luận Hệ Quy Mô Lớn: 3A, 3B, 2C, 2D ngồi 2 hàng 5 ghế ($m=5$)")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C, 2 học sinh lớp D. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Học sinh của các lớp là $n_A = 3, n_B = 3, n_C = 2, n_D = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa 1 học sinh lớp $i$ và 1 học sinh lớp $j$ với các cặp $(i, j)$ chọn từ $\{A, B, C, D\}$. Để phân bổ hết học sinh vào $m = 5$ cột, ta có hệ phương trình:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A D) = n_A = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B D) = n_B = 3 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C D) = n_C = 2 quad &("lượt xuất hiện của C") \\
  t_(A D) + t_(B D) + t_(C D) = n_D = 2 quad &("lượt xuất hiện của D")
  $
  Ta biện luận nghiệm nguyên không âm theo giá trị của $t_(C D) <= 2$:
  - *Trường hợp 1: $t_(C D) = 2$* $arrow.r$ $t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 3$.
    Nghiệm thu được: $t_(A B) = 3, t_(C D) = 2$ (thỏa mãn tổng số cột $3 + 2 = 5$).
    Ta thu được cấu hình: $ {3 times (A, B), 2 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 3! 2!) = 10$.
  - *Trường hợp 2: $t_(C D) = 1$* $arrow.r$ $t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$.
    Biện luận 4 khả năng của cặp $((t_(A C), t_(B C)), (t_(A D), t_(B D)))$:
    + *Khả năng 2.1:* $t_(A C) = 1, t_(A D) = 1 arrow.r.double t_(B C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B ta được $1 != 3$ (loại).
    + *Khả năng 2.2:* $t_(B C) = 1, t_(B D) = 1 arrow.r.double t_(A C) = 0, t_(A D) = 0$. Thay vào B ta được $t_(A B) = 1$. Thay vào A ta được $1 != 3$ (loại).
    + *Khả năng 2.3:* $t_(A C) = 1, t_(B D) = 1 arrow.r.double t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) + 1 = 3  arrow.r.double  t_(A B) = 2$. Thay vào B: $2 + 0 + 1 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, D), 1 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_(2a) = frac(5!, 2! 1! 1! 1!) = 60$.
    + *Khả năng 2.4:* $t_(B C) = 1, t_(A D) = 1 arrow.r.double t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) + 1 = 3  arrow.r.double  t_(A B) = 2$. Thay vào B: $2 + 1 + 0 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {2 times (A, B), 1 times (B, C), 1 times (A, D), 1 times (C, D)} $ $arrow.r$ Số cấu hình cột $M_(2b) = 60$.
  - *Trường hợp 3: $t_(C D) = 0$* $arrow.r$ $t_(A C) + t_(B C) = 2$ và $t_(A D) + t_(B D) = 2$.
    Biện luận các khả năng:
    + *Khả năng 3.1:* $t_(A C) = 2, t_(A D) = 2 arrow.r.double t_(B C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = -1$ (loại).
    + *Khả năng 3.2:* $t_(B C) = 2, t_(B D) = 2 arrow.r.double t_(A C) = 0, t_(A D) = 0$. Thay vào B ta được $t_(A B) = -1$ (loại).
    + *Khả năng 3.3:* $t_(A C) = 2, t_(B D) = 2 arrow.r.double t_(B C) = 0, t_(A D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 0 + 2 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (A, C), 2 times (B, D)} $ $arrow.r$ Số cấu hình cột $M_(3a) = frac(5!, 1! 2! 2!) = 30$.
    + *Khả năng 3.4:* $t_(B C) = 2, t_(A D) = 2 arrow.r.double t_(A C) = 0, t_(B D) = 0$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 2 + 0 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 2 times (B, C), 2 times (A, D)} $ $arrow.r$ Số cấu hình cột $M_(3b) = 30$.
    + *Khả năng 3.5:* $t_(A C) = 1, t_(B C) = 1$ và $t_(A D) = 1, t_(B D) = 1$. Thay vào A ta được $t_(A B) = 1$. Thay vào B: $1 + 1 + 1 = 3$ (thỏa mãn).
      Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, D), 1 times (B, D)} $ $arrow.r$ Số cấu hình cột $M_(3c) = frac(5!, 1! 1! 1! 1! 1!) = 120$.
  
  Tổng số cấu hình cột hợp lệ là $M = 10 + 60 + 60 + 30 + 30 + 120 = 310$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 310 times (3! times 3! times 2! times 2!) times 32 = 310 times 144 times 32 = bold(1428480) " cách." $
]

#ex-box(title: "✏️ Bài C9 — Ghế Trống 1: Hai Lớp, Lưới 5 Cột, 2 Ghế Trống (4A, 4B, 2E)")[
  Có 4 học sinh lớp A, 4 học sinh lớp B và 2 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện nhau sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Lớp A có 4 học sinh, B có 4 học sinh, ghế trống E có 2 ghế.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, E\}$. Các kiểu cột có thể có là $(A, B)$, $(A, E)$, $(B, E)$, $(E, E)$. Ta có hệ phương trình bảo toàn:
  $
  t_(A B) + t_(A E) + t_(B E) + t_(E E) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A E) = n_A = 4 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B E) = n_B = 4 quad &("lượt xuất hiện của B") \\
  t_(A E) + t_(B E) + 2 t_(E E) = n_E = 2 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$ (vì $2 t_(E E) <= 2$):
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
    Thay vào phương trình của A và B ta được $t_(A B) = 4$.
    Nghiệm này thỏa mãn tổng số cột ($4 + 0 + 0 + 1 = 5$).
    Ta thu được cấu hình: $ {4 times (A, B), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 4! 1!) = 5$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) = 2$.
    Từ phương trình của A và B ta có $t_(A E) = 4 - t_(A B)$ và $t_(B E) = 4 - t_(A B)  arrow.r.double  t_(A E) = t_(B E)$.
    Vì tổng của chúng bằng 2, ta suy ra $t_(A E) = t_(B E) = 1$.
    Thay lại ta được $t_(A B) = 3$.
    Nghiệm này thỏa mãn tổng số cột ($3 + 1 + 1 + 0 = 5$).
    Ta thu được cấu hình: $ {3 times (A, B), 1 times (A, E), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_2 = frac(5!, 3! 1! 1!) = 20$.
  
  Tổng số cấu hình cột hợp lệ là $M = 5 + 20 = 25$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B!) times 2^5 = 25 times (4! times 4!) times 32 = 25 times 576 times 32 = bold(460800) " cách." $
]

#ex-box(title: "✏️ Bài C10 — Ghế Trống 2: Ba Lớp, Lưới 5 Cột, 2 Ghế Trống (3A, 3B, 2C, 2E)")[
  Có 3 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C và 2 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Học sinh các lớp là $n_A = 3, n_B = 3, n_C = 2, n_E = 2$.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp chọn từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A E) = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B E) = 3 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C E) = 2 quad &("lượt xuất hiện của C") \\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = 2 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$:
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = 0$.
    Hệ phương trình rút gọn thành:
    $
    t_(A B) + t_(A C) = 3     t_(A B) + t_(B C) = 3     t_(A C) + t_(B C) = 2
    $
    Giải hệ con này ta được nghiệm: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 1! 1!) = 60$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 2$. Ta biện luận theo giá trị của $t_(C E) <= 2$:
    + *Khả năng 2.1: $t_(C E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
      Khi đó phương trình của C trở thành $t_(A C) + t_(B C) = 0  arrow.r.double  t_(A C) = t_(B C) = 0$.
      Thay vào ta được $t_(A B) = 3$.
      Ta thu được cấu hình: $ {3 times (A, B), 2 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(2a) = frac(5!, 3! 2!) = 10$.
    + *Khả năng 2.2: $t_(C E) = 1$* $arrow.r$ $t_(A E) + t_(B E) = 1$. Do tính đối xứng của A và B, ta có 2 trường hợp con:
      - Nghiệm con $t_(A E) = 1, t_(B E) = 0$: Giải ra $t_(A B) = 2, t_(B C) = 1, t_(A C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (B, C), 1 times (A, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(2b) = 60$.
      - Nghiệm con $t_(A E) = 0, t_(B E) = 1$: Giải ra $t_(A B) = 2, t_(A C) = 1, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(2c) = 60$.
    + *Khả năng 2.3: $t_(C E) = 0$* $arrow.r$ $t_(A E) + t_(B E) = 2$ và $t_(A C) + t_(B C) = 2$.
      - Nghiệm con $t_(A E) = 2, t_(B E) = 0$: Giải ra $t_(A B) = 1, t_(B C) = 2, t_(A C) = 0$.
        Cấu hình: $ {1 times (A, B), 2 times (B, C), 2 times (A, E)} $ $arrow.r$ Số cấu hình cột $M_(2d) = 30$.
      - Nghiệm con $t_(A E) = 0, t_(B E) = 2$: Giải ra $t_(A B) = 1, t_(A C) = 2, t_(B C) = 0$.
        Cấu hình: $ {1 times (A, B), 2 times (A, C), 2 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_(2e) = 30$.
      - Nghiệm con $t_(A E) = 1, t_(B E) = 1$: Giải ra $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_(2f) = 120$.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 10 + 60 + 60 + 30 + 30 + 120 = 370$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 370 times (3! times 3! times 2!) times 32 = 370 times 72 times 32 = bold(852480) " cách." $
]

#ex-box(title: "✏️ Bài C11 — Ghế Trống 3: Ba Lớp, Lưới 5 Cột, 3 Ghế Trống (3A, 2B, 2C, 3E)")[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 3 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 3 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A E) + t_(B C) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A E) = 3 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B E) = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C E) = 2 quad &("lượt xuất hiện của C") \\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = 3 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 1$:
  - *Trường hợp 1: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 1$.
    + *Khả năng 1.1: $t_(C E) = 1$* $arrow.r$ $t_(A E) = t_(B E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 2, t_(A C) = 1, t_(B C) = 0$.
      Cấu hình: $ {2 times (A, B), 1 times (A, C), 1 times (C, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = 60$.
    + *Khả năng 1.2: $t_(A E) = 1$* $arrow.r$ $t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_2 = 120$.
    + *Khả năng 1.3: $t_(B E) = 1$* $arrow.r$ $t_(A E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 1, t_(A C) = 2, t_(B C) = 0$.
      Cấu hình: $ {1 times (A, B), 2 times (A, C), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 30$.
  - *Trường hợp 2: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 3$. Biện luận theo giá trị của $t_(A E) <= 3$:
    + *Khả năng 2.1: $t_(A E) = 3$* $arrow.r$ $t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 2$.
      Cấu hình: $ {2 times (B, C), 3 times (A, E)} $ $arrow.r$ Số cấu hình cột $M_4 = 10$.
    + *Khả năng 2.2: $t_(A E) = 2$* $arrow.r$ $t_(B E) + t_(C E) = 1$.
      - Với $t_(C E) = 1, t_(B E) = 0$: Giải ra $t_(A B) = 1, t_(B C) = 1, t_(A C) = 0$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 2 times (A, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_5 = 60$.
      - Với $t_(C E) = 0, t_(B E) = 1$: Giải ra $t_(A B) = 0, t_(B C) = 1, t_(A C) = 1$.
        Cấu hình: $ {1 times (A, C), 1 times (B, C), 2 times (A, E), 1 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_6 = 60$.
    + *Khả năng 2.3: $t_(A E) = 1$* $arrow.r$ $t_(B E) + t_(C E) = 2$.
      - Với $t_(C E) = 2, t_(B E) = 0$: Giải ra $t_(A B) = 2, t_(A C) = 0, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, B), 1 times (A, E), 2 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_7 = 30$.
      - Với $t_(B E) = 2, t_(C E) = 0$: Giải ra $t_(A B) = 0, t_(A C) = 2, t_(B C) = 0$.
        Cấu hình: $ {2 times (A, C), 1 times (A, E), 2 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_8 = 30$.
      - Với $t_(B E) = 1, t_(C E) = 1$: Giải ra $t_(A B) = 1, t_(A C) = 1, t_(B C) = 0$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (A, E), 1 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_9 = 120$.
    + *Khả năng 2.4: $t_(A E) = 0  arrow.r.double  t_(B E) + t_(C E) = 3$.* Hệ vô nghiệm vì $t_(C E) <= 2, t_(B E) <= 2$ nhưng tổng xuất hiện của C và B quá nhỏ không đủ tạo ra 3 cột đơn lẻ với E.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 120 + 30 + 10 + 60 + 60 + 30 + 30 + 120 = 520$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 520 times (3! times 2! times 2!) times 32 = 520 times 24 times 32 = bold(399360) " cách." $
]

#ex-box(title: "✏️ Bài C12 — Ghế Trống 4: Bốn Lớp, Lưới 5 Cột, 4 Ghế Trống (2A, 2B, 1C, 1D, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 1 học sinh lớp C, 1 học sinh lớp D và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, D, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) + t_(A E) + t_(B E) + t_(C E) + t_(D E) + t_(E E) = 5 \\
  t_(A B) + t_(A C) + t_(A D) + t_(A E) = n_A = 2 \\
  t_(A B) + t_(B C) + t_(B D) + t_(B E) = n_B = 2 \\
  t_(A C) + t_(B C) + t_(C D) + t_(C E) = n_C = 1 \\
  t_(A D) + t_(B D) + t_(C D) + t_(D E) = n_D = 1 \\
  t_(A E) + t_(B E) + t_(C E) + t_(D E) + 2 t_(E E) = n_E = 4
  $
  Cộng phương trình xuất hiện của 4 lớp A, B, C, D:
  $ (t_(A B) + t_(A C) + t_(A D) + t_(A E)) + (t_(A B) + t_(B C) + t_(B D) + t_(B E)) + (t_(A C) + t_(B C) + t_(C D) + t_(C E)) + (t_(A D) + t_(B D) + t_(C D) + t_(D E)) = 2 + 2 + 1 + 1 = 6 $
  $ arrow.r.double 2(t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D)) + (t_(A E) + t_(B E) + t_(C E) + t_(D E)) = 6 $
  Thế $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4 - 2 t_(E E)$ từ phương trình của E vào, ta được:
  $ 2(t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D)) + 4 - 2 t_(E E) = 6 $
  $ arrow.r.double t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 1 + t_(E E) $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = t_(D E) = 0$.
    Hệ con bảo toàn cho A, B, C, D là:
    + $t_(A C) + t_(B C) + t_(C D) = 1$
    + $t_(A D) + t_(B D) + t_(C D) = 1$
    Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1  arrow.r.double $ tất cả các biến chứa C, D khác bằng 0 $ arrow.r.double  t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$. Khi đó từ A và B ta được $t_(A B) = 2$.
      Cấu hình: $ {2 times (A, B), 1 times (C, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 2! 1! 2!) = 30$.
    - Nếu $t_(C D) = 0  arrow.r.double  t_(A C) + t_(B C) = 1$ và $t_(A D) + t_(B D) = 1$. Có 2 nghiệm con thỏa mãn hệ:
      - $t_(A C) = 1, t_(B D) = 1  arrow.r.double  t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_2 = 60$.
      - $t_(B C) = 1, t_(A D) = 1  arrow.r.double  t_(A B) = 1$.
        Cấu hình: $ {1 times (A, B), 1 times (B, C), 1 times (A, D), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_3 = 60$.
    Tổng số cấu hình của Trường hợp 1 là $M_("T1") = 30 + 60 + 60 = 150$.

  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 2$.
    Ta có $t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 2$. Biện luận theo $t_(C D) <= 1$:
    - Nếu $t_(C D) = 1  arrow.r.double  t_(A C) = t_(B C) = t_(A D) = t_(B D) = 0$ và $t_(C E) = t_(D E) = 0  arrow.r.double  t_(A E) + t_(B E) = 2$.
      Theo tính đối xứng $t_(A E) = t_(B E) = 1  arrow.r.double  t_(A B) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (C, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_4 = 120$.
    - Nếu $t_(C D) = 0$: Biện luận theo cặp $(t_(C E), t_(D E))$:
      - Với $t_(C E) = 1, t_(D E) = 1  arrow.r.double  t_(A E) = t_(B E) = 0  arrow.r.double  t_(A B) = 2$.
        Cấu hình: $ {2 times (A, B), 1 times (C, E), 1 times (D, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_5 = 60$.
      - Với $t_(C E) = 1, t_(D E) = 0  arrow.r.double  t_(A E) + t_(B E) = 1$. Giải ra 2 nghiệm con:
        - $t_(A E) = 1  arrow.r.double  t_(A B) = 1, t_(B D) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (A, E), 1 times (B, D), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_6 = 120$.
        - $t_(B E) = 1  arrow.r.double  t_(A B) = 1, t_(A D) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (C, E), 1 times (B, E), 1 times (A, D), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_7 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 1  arrow.r.double  t_(A E) + t_(B E) = 1$. Tương tự:
        - $t_(A E) = 1  arrow.r.double  t_(A B) = 1, t_(B C) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (A, E), 1 times (B, C), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_8 = 120$.
        - $t_(B E) = 1  arrow.r.double  t_(A B) = 1, t_(A C) = 1$.
          Cấu hình: $ {1 times (A, B), 1 times (D, E), 1 times (B, E), 1 times (A, C), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_9 = 120$.
      - Với $t_(C E) = 0, t_(D E) = 0  arrow.r.double  t_(A E) + t_(B E) = 2$:
        - Nếu $t_(A E) = 1, t_(B E) = 1$, ta có 2 nghiệm con:
          - $t_(A C) = 1, t_(B D) = 1  arrow.r.double $ Cấu hình: $ {1 times (A, C), 1 times (B, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(10) = 120$.
          - $t_(B C) = 1, t_(A D) = 1  arrow.r.double $ Cấu hình: $ {1 times (B, C), 1 times (A, D), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(11) = 120$.
        - Nếu $t_(A E) = 2, t_(B E) = 0  arrow.r.double  t_(B C) = 1, t_(B D) = 1$.
          Cấu hình: $ {1 times (B, C), 1 times (B, D), 2 times (A, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(12) = 60$.
        - Nếu $t_(A E) = 0, t_(B E) = 2  arrow.r.double  t_(A C) = 1, t_(A D) = 1$.
          Cấu hình: $ {1 times (A, C), 1 times (A, D), 2 times (B, E), 1 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_(13) = 60$.
    Tổng số cấu hình của Trường hợp 2 là $M_("T2") = 120 + 60 + 120 + 120 + 120 + 120 + 120 + 120 + 60 + 60 = 1020$.

  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) + t_(D E) = 4$.
    Ta có $t_(A B) + t_(A C) + t_(A D) + t_(B C) + t_(B D) + t_(C D) = 1$. Vì tổng này bằng 1 nên có duy nhất một biến bằng 1 và 5 biến còn lại bằng 0:
    - Nếu $t_(C D) = 1  arrow.r.double  t_(A E) = 2, t_(B E) = 2, t_(C E) = 0, t_(D E) = 0$.
      Cấu hình: $ {1 times (C, D), 2 times (A, E), 2 times (B, E)} $ $arrow.r$ Số cấu hình cột $M_(14) = 30$.
    - Nếu $t_(A B) = 1  arrow.r.double  t_(A E) = 1, t_(B E) = 1, t_(C E) = 1, t_(D E) = 1$.
      Cấu hình: $ {1 times (A, B), 1 times (A, E), 1 times (B, E), 1 times (C, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(15) = 120$.
    - Nếu $t_(B D) = 1  arrow.r.double  t_(A E) = 2, t_(B E) = 1, t_(C E) = 1, t_(D E) = 0$.
      Cấu hình: $ {1 times (B, D), 2 times (A, E), 1 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(16) = 60$.
    - Nếu $t_(A C) = 1  arrow.r.double  t_(A E) = 1, t_(B E) = 2, t_(C E) = 0, t_(D E) = 1$.
      Cấu hình: $ {1 times (A, C), 1 times (A, E), 2 times (B, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(17) = 60$.
    - Nếu $t_(B C) = 1  arrow.r.double  t_(A E) = 2, t_(B E) = 1, t_(C E) = 0, t_(D E) = 1$.
      Cấu hình: $ {1 times (B, C), 2 times (A, E), 1 times (B, E), 1 times (D, E)} $ $arrow.r$ Số cấu hình cột $M_(18) = 60$.
    - Nếu $t_(A D) = 1  arrow.r.double  t_(A E) = 1, t_(B E) = 2, t_(C E) = 1, t_(D E) = 0$.
      Cấu hình: $ {1 times (A, D), 1 times (A, E), 2 times (B, E), 1 times (C, E)} $ $arrow.r$ Số cấu hình cột $M_(19) = 60$.
    Tổng số cấu hình của Trường hợp 3 là $M_("T3") = 30 + 120 + 60 + 60 + 60 + 60 = 390$.
  
  Tổng số cấu hình cột hợp lệ là $M = 150 + 1020 + 390 = 1560$ cấu hình.
  Lúc này mới nhân hoán vị học sinh và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C! n_D!) times 2^5 = 1560 times (2! times 2! times 1! times 1!) times 32 = 1560 times 4 times 32 = bold(199680) " cách." $
]

#ex-box(title: "✏️ Bài C13 — Ghế Trống 5: Cực Hạn Biện Luận, 4 Ghế Trống (2A, 2B, 2C, 4E)")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 4 ghế trống E. Xếp tất cả vào 2 hàng 5 ghế đối diện sao cho không có cặp đối diện nào cùng lớp. Tính số cách xếp.
]
#step-box[
  Ta có $m = 5$ cột. Ghế trống E hoạt động như một lớp phụ có 4 phần tử.
  Ta giải bằng *Phương pháp lập cấu hình cột tổng quát (Biện luận hệ phương trình)*:
  
  Ta gọi $t_(i j)$ là số cột chứa các cặp đối diện từ $\{A, B, C, E\}$. Hệ phương trình bảo toàn là:
  $
  t_(A B) + t_(A C) + t_(B C) + t_(A E) + t_(B E) + t_(C E) + t_(E E) = 5 quad &("tổng số cột") \\
  t_(A B) + t_(A C) + t_(A E) = n_A = 2 quad &("lượt xuất hiện của A") \\
  t_(A B) + t_(B C) + t_(B E) = n_B = 2 quad &("lượt xuất hiện của B") \\
  t_(A C) + t_(B C) + t_(C E) = n_C = 2 quad &("lượt xuất hiện của C") \\
  t_(A E) + t_(B E) + t_(C E) + 2 t_(E E) = n_E = 4 quad &("lượt xuất hiện của E")
  $
  Ta biện luận theo giá trị nguyên không âm của $t_(E E) <= 2$ (vì $2 t_(E E) <= 4$):
  - *Trường hợp 1: $t_(E E) = 2$* $arrow.r$ $t_(A E) = t_(B E) = t_(C E) = 0$.
    Hệ con bảo toàn của A, B, C có dạng đối xứng:
    $
    t_(A B) + t_(A C) = 2     t_(A B) + t_(B C) = 2     t_(A C) + t_(B C) = 2
    $
    Giải ra nghiệm duy nhất: $t_(A B) = 1, t_(A C) = 1, t_(B C) = 1$.
    Ta thu được cấu hình: $ {1 times (A, B), 1 times (A, C), 1 times (B, C), 2 times (E, E)} $ $arrow.r$ Số cấu hình cột $M_1 = frac(5!, 1! 1! 1! 2!) = 60$.
  - *Trường hợp 2: $t_(E E) = 1$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 2$. Có 2 khả năng cho các biến chứa E:
    + *Khả năng 2.1: Có một biến bằng 2, hai biến kia bằng 0.* Do tính đối xứng, giả sử $t_(A E) = 2, t_(B E) = t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 2$.
      Cấu hình: $ {2 times (B, C), 2 times (A, E), 1 times (E, E)} $. 
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 2! 2! 1!) = 3 times 30 = 90$ cấu hình.
    + *Khả năng 2.2: Có hai biến bằng 1, một biến bằng 0.* Giả sử $t_(A E) = 1, t_(B E) = 1, t_(C E) = 0$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 1, t_(B C) = 1$.
      Cấu hình: $ {1 times (A, C), 1 times (B, C), 1 times (A, E), 1 times (B, E), 1 times (E, E)} $.
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 1! 1! 1! 1! 1!) = 3 times 120 = 360$ cấu hình.
  - *Trường hợp 3: $t_(E E) = 0$* $arrow.r$ $t_(A E) + t_(B E) + t_(C E) = 4$. Do $t_(i E) <= 2$, chỉ có 2 khả năng cho các biến chứa E:
    + *Khả năng 3.1: Bộ ba $(2, 2, 0)$* $arrow.r$ Giả sử $t_(A E) = 2, t_(B E) = 2, t_(C E) = 0$.
      Giải hệ con cho ta nghiệm vô lý $t_(C D) = 2$ (loại do không có D).
    + *Khả năng 3.2: Bộ ba $(2, 1, 1)$* $arrow.r$ Giả sử $t_(A E) = 2, t_(B E) = 1, t_(C E) = 1$.
      Giải hệ con ta được nghiệm: $t_(A B) = 0, t_(A C) = 0, t_(B C) = 1$.
      Cấu hình: $ {1 times (B, C), 2 times (A, E), 1 times (B, E), 1 times (C, E)} $.
      Có 3 cấu hình đối xứng tương tự với số cấu hình cột: $3 times frac(5!, 1! 2! 1! 1!) = 3 times 60 = 180$ cấu hình.
  
  Tổng số cấu hình cột hợp lệ là $M = 60 + 90 + 360 + 180 = 690$ cấu hình.
  Lúc này mới nhân hoán vị học sinh phân biệt của từng lớp và số cách đảo hàng ($2^5 = 32$):
  $ N = M times (n_A! n_B! n_C!) times 2^5 = 690 times (2! times 2! times 2!) times 32 = 690 times 8 times 32 = bold(176640) " cách." $
]

#pagebreak()

= Chương 2 — Không Quá _k_ Học Sinh Cùng Lớp Liên Tiếp

Đây là dạng bài *tổng quát hóa trực tiếp* của bài toán "không ai cùng lớp ngồi kề nhau" (tương ứng với trường hợp $k = 1$). Thay vì cấm hoàn toàn, đề bài cho phép các bạn cùng lớp ngồi liền nhau, miễn là không vượt quá $k$ người liên tiếp trong cùng một hàng.

Công cụ chính để giải dạng này là *Phương pháp phân tích đợt* (Run-length decomposition) kết hợp với công thức *Sao và Thanh chắn* (Stars & Bars).

== 2.1 — Khái Niệm "Đợt" (Run)

#rev-box(title: "📖 Định Nghĩa Đợt (Nhóm chạy liên tiếp)")[
  Trong một hàng ghế, một *đợt* của lớp A là một đoạn gồm các học sinh lớp A ngồi kề nhau liên tiếp, sao cho đoạn đó *dài nhất có thể* (tức là hai đầu của đoạn đó phải là học sinh lớp khác hoặc là đầu hàng).
]

*Sơ đồ trực quan minh họa các đợt (run):*

#align(center)[
  #block(
    fill: rgb("F5F5F5"),
    stroke: 0.5pt + rgb("CCCCCC"),
    inset: 10pt,
    radius: 5pt,
  )[
    #set text(font: "Courier New", size: 10pt)
    Hàng ghế:  | A | B | B | A | A | A | B | A | \
    Đợt của A: [ A ]       [ A   A   A ]   [ A ]   $arrow.r$  Có 3 đợt của A \
    Đợt của B:     [ B   B ]           [ B ]       $arrow.r$  Có 2 đợt của B
  ]
]

*Ý nghĩa:* Ràng buộc "không quá $k$ học sinh A liên tiếp" thực chất có nghĩa là *mỗi đợt của lớp A chỉ được phép có độ dài từ $1$ đến $k$*.

== 2.2 — Đơn Giản Hóa Toán Học Cho Trường Hợp Phổ Biến $k=2$

Khi đề thi yêu cầu "không quá 2 bạn cùng lớp ngồi kề nhau" ($k=2$), mỗi đợt chỉ có thể có độ dài là 1 hoặc 2. Ta có cách giải thích cực kỳ đơn giản mà không cần dùng công thức tổng quát phức tạp:

#method-box[
  *💡 Công thức chia đợt trực quan khi $k=2$:*

  Giả sử ta cần xếp $n_A$ học sinh lớp A thành $r$ đợt (mỗi đợt dài 1 hoặc 2).
  - Gọi $x$ là số đợt có độ dài 1.
  - Gọi $y$ là số đợt có độ dài 2.

  Ta có hệ phương trình đơn giản sau:
  $
       x + y = r quad & ("tổng số đợt") \
    x + 2y = n_A quad & ("tổng số học sinh A")
  $
  Trừ hai phương trình cho nhau, ta được:
  $ y = n_A - r $
  Đây chính là số đợt có độ dài 2.

  Để xác định xem trong số $r$ đợt này, những đợt nào có độ dài bằng 2, ta chọn ra $y$ đợt từ $r$ đợt. Số cách chọn cấu trúc đợt (Unlabeled) là:
  $ f(n_A, r, 2) = binom(r, y) = binom(r, n_A - r) $
]

== 2.3 — Phương Pháp Giải Quyết Hệ Thống (Quy Trình 5 Bước)

Để giải quyết bài toán xếp $n_A$ học sinh A và $n_B$ học sinh B sao cho lớp A không quá $k$ bạn liên tiếp (chưa xét ràng buộc của B):

#method-box[
  1. *Bước 1 — Xác định số đợt $r$ của lớp A:*
    Mỗi đợt có độ dài tối đa là $k$, nên số đợt tối thiểu là $ceil(n_A / k)$. Số đợt tối đa là $n_A$ (mỗi đợt đúng 1 học sinh).
    $ ceil(n_A / k) <= r <= n_A $
  2. *Bước 2 — Đếm số phân hoạch đợt của A (ký hiệu là $f(n_A, r, k)$):*
    - Nếu $k=2$: $f(n_A, r, 2) = binom(r, n_A - r)$ cách.
    - Nếu $k >= 3$: dùng công thức tổng quát trong hộp tham khảo bên dưới.
  3. *Bước 3 — Tạo vách ngăn và đặt các đợt A vào:*
    Xếp $n_B$ học sinh B trước để tạo ra $n_B + 1$ khe hở (kể cả 2 đầu hàng). Ta chọn ra $r$ khe hở từ $n_B + 1$ khe hở này để đặt $r$ đợt của A vào:
    $ binom(n_B + 1, r) " cách." $
  4. *Bước 4 — Tính số cấu trúc chưa đánh nhãn (Unlabeled):*
    Với mỗi giá trị $r$ hợp lệ:
    $ S = sum_r f(n_A, r, k) times binom(n_B + 1, r) $
  5. *Bước 5 — Nhân hoán vị học sinh phân biệt:*
    $ N = S times n_A! times n_B! $
]

#note-box(title: "ℹ️ Hộp Tham Khảo: Công Thức Tổng Quát Cho Mọi k")[
  Khi $k >= 3$, ta dùng công thức hệ số tổ hợp (dùng nguyên lý bao hàm loại trừ) để tính số cách chia $n_A$ phần tử giống nhau thành $r$ đợt có độ dài từ 1 đến $k$:
  $ f(n_A, r, k) = sum_(j=0)^(\lfloor (n_A - r)/k \rfloor) (-1)^j binom(r, j) binom(n_A - j k - 1, r - 1) $
]

== 2.4 — Cấu Trúc Cặp Ví Dụ Song Hành Cho Dạng Chỉ Ràng Buộc Lớp A ($k=2$)

*🔷 Cặp Ví Dụ Kép 1: Quy mô vừa vs Quy mô nhỏ*

#eg-box(title: [🎯 Ví Dụ 2.1 — Quy mô vừa: 3A, 3B, $k=2$ (Chỉ ràng buộc lớp A)])[
  Xếp 3 học sinh lớp A và 3 học sinh lớp B thành một hàng 6 ghế sao cho không quá 2 học sinh lớp A ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 3, n_B = 3, k = 2$. Số đợt $r$ chạy từ $ceil(3/2) = 2$ đến $3$.

  - *Trường hợp $r = 2$ (2 đợt A):*
    - Số đợt dài 2 là $y = n_A - r = 3 - 2 = 1$ đợt. Số cách phân hoạch đợt A: $f(3, 2, 2) = binom(2, 1) = 2$ cách (gồm: $\{A A\}$ và $\{A\}$).
    - Chọn 2 khe hở từ 4 khe hở của B: $binom(4, 2) = 6$ cách.
    - Số cấu trúc Unlabeled: $2 times 6 = 12$ cách.

  - *Trường hợp $r = 3$ (3 đợt A):*
    - Số đợt dài 2 là $y = 3 - 3 = 0$ đợt. Số cách phân hoạch: $f(3, 3, 2) = binom(3, 0) = 1$ cách (gồm 3 đợt $\{A\}$).
    - Chọn 3 khe hở từ 4 khe hở của B: $binom(4, 3) = 4$ cách.
    - Số cấu trúc Unlabeled: $1 times 4 = 4$ cách.

  - *Tổng số cách xếp:*
    $
      S = 12 + 4 = 16 \
      N = 16 times 3! times 3! = 16 times 6 times 6 = bold(576) " cách."
    $
]

#eg-box(title: [🎯 Ví Dụ 2.2 — Quy mô nhỏ: 4A, 3B, $k=2$ (Chỉ ràng buộc lớp A)])[
  Xếp 4 học sinh lớp A và 3 học sinh lớp B thành một hàng 7 ghế sao cho không quá 2 học sinh lớp A ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 4, n_B = 3, k = 2$. Số đợt $r$ chạy từ $ceil(4/2) = 2$ đến $4$.

  - *Trường hợp $r = 2$ (2 đợt A):*
    - Số đợt dài 2: $y = 4 - 2 = 2$ đợt. Phân hoạch: $f(4, 2, 2) = binom(2, 2) = 1$ cách ( $\{A A\}$ và $\{A A\}$).
    - Chọn khe hở: $binom(4, 2) = 6$ cách.
    - Số cấu trúc: $1 times 6 = 6$.

  - *Trường hợp $r = 3$ (3 đợt A):*
    - Số đợt dài 2: $y = 4 - 3 = 1$ đợt. Phân hoạch: $f(4, 3, 2) = binom(3, 1) = 3$ cách.
    - Chọn khe hở: $binom(4, 3) = 4$ cách.
    - Số cấu trúc: $3 times 4 = 12$.

  - *Trường hợp $r = 4$ (4 đợt A):*
    - Số đợt dài 2: $y = 0$ đợt. Phân hoạch: $f(4, 4, 2) = binom(4, 0) = 1$ cách.
    - Chọn khe hở: $binom(4, 4) = 1$ cách.
    - Số cấu trúc: $1 times 1 = 1$.

  - *Tổng số cách xếp:*
    $
      S = 6 + 12 + 1 = 19 \
      N = 19 times 4! times 3! = 19 times 24 times 6 = bold(2736) " cách."
    $
]

*🔷 Cặp Ví Dụ Kép 2: Quy mô lớn vs Quy mô vừa (Số lượng B nhiều hơn)*

#eg-box(title: [🎯 Ví Dụ 2.3 — Quy mô lớn: 4A, 5B, $k=2$ (Chỉ ràng buộc lớp A)])[
  Xếp 4 học sinh lớp A và 5 học sinh lớp B vào hàng 9 ghế sao cho không quá 2 học sinh lớp A ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 4, n_B = 5, k = 2$. Số đợt $r$ chạy từ 2 đến 4. 5 bạn B tạo ra 6 khe hở.
  - *TH $r = 2$:* $S_2 = f(4, 2, 2) times binom(6, 2) = binom(2, 2) times 15 = 15$ cấu trúc.
  - *TH $r = 3$:* $S_3 = f(4, 3, 2) times binom(6, 3) = binom(3, 1) times 20 = 60$ cấu trúc.
  - *TH $r = 4$:* $S_4 = f(4, 4, 2) times binom(6, 4) = binom(4, 0) times 15 = 15$ cấu trúc.

  Tổng số cấu trúc: $S = 15 + 60 + 15 = 90$ cấu trúc.
  Tổng số cách xếp:
  $ N = 90 times 4! times 5! = 90 times 24 times 120 = bold(259200) " cách." $
]

#eg-box(title: [🎯 Ví Dụ 2.4 — Quy mô vừa: 3A, 4B, $k=2$ (Chỉ ràng buộc lớp A)])[
  Xếp 3 học sinh lớp A và 4 học sinh lớp B vào hàng 7 ghế sao cho không quá 2 học sinh lớp A ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 3, n_B = 4, k = 2$. Số đợt $r$ chạy từ 2 đến 3. 4 bạn B tạo ra 5 khe hở.
  - *TH $r = 2$ (2 đợt A gồm 2+1):* $S_2 = f(3, 2, 2) times binom(5, 2) = binom(2, 1) times 10 = 20$ cấu trúc.
  - *TH $r = 3$ (3 đợt A gồm 1+1+1):* $S_3 = f(3, 3, 2) times binom(5, 3) = binom(3, 0) times 10 = 10$ cấu trúc.

  Tổng số cấu trúc: $S = 20 + 10 = 30$.
  Tổng số cách xếp:
  $ N = 30 times 3! times 4! = 30 times 6 times 24 = bold(4320) " cách." $
]

== 2.5 — Trường Hợp Cả Hai Lớp Đều Bị Ràng Buộc

Khi cả hai lớp A và B đều bị giới hạn số lượng người kề nhau (ví dụ: không quá $k_A$ bạn A kề nhau và không quá $k_B$ bạn B kề nhau), ta không dùng khe hở nữa mà đếm trực tiếp số cấu trúc đợt xen kẽ của cả hai.

#method-box[
  *Nguyên lý xen kẽ đợt:*
  Mọi cấu trúc hợp lệ đều là chuỗi đợt xen kẽ: $X_1 Y_1 X_2 Y_2 dots$
  Do xen kẽ, số đợt $r_A$ and $r_B$ chỉ được phép lệch nhau tối đa 1 đơn vị: $|r_A - r_B| <= 1$.
  - Nếu $r_A = r_B$: có 2 cấu trúc chuỗi (bắt đầu bằng A hoặc bắt đầu bằng B).
  - Nếu $r_A = r_B + 1$: chỉ có 1 cấu trúc chuỗi (bắt đầu và kết thúc bằng A).
  - Nếu $r_B = r_A + 1$: chỉ có 1 cấu trúc chuỗi (bắt đầu và kết thúc bằng B).

  Với mỗi cặp $(r_A, r_B)$ hợp lệ, số cấu trúc Unlabeled là:
  $ S_(r_A, r_B) = f(n_A, r_A, k_A) times f(n_B, r_B, k_B) times ("Số cấu trúc chuỗi") $
]

#eg-box(title: [🎯 Ví Dụ 2.5 — 3A, 4B, cả hai lớp $k=2$])[
  Xếp 3 học sinh lớp A và 4 học sinh lớp B vào hàng 7 ghế sao cho không có quá 2 bạn cùng lớp nào ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 3, k_A = 2$ và $n_B = 4, k_B = 2$.
  - Phân hoạch A: $r_A \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.
  - Phân hoạch B: $r_B \in \{2, 3, 4\}$. Ta có $f(4, 2, 2) = 1$, $f(4, 3, 2) = 3$, $f(4, 4, 2) = 1$.

  Liệt kê các cặp đợt hợp lệ thỏa mãn $|r_A - r_B| <= 1$:
  1. *Cặp $(r_A=2, r_B=2)$:* Số chuỗi = 2 (ABAB hoặc BABA). $S_(2,2) = 2 times 1 times 2 = 4$ cấu trúc.
  2. *Cặp $(r_A=2, r_B=3)$:* Chuỗi B A B A B (1 cách). $S_(2,3) = 2 times 3 times 1 = 6$ cấu trúc.
  3. *Cặp $(r_A=3, r_B=2)$:* Chuỗi A B A B A (1 cách). $S_(3,2) = 1 times 1 times 1 = 1$ cấu trúc.
  4. *Cặp $(r_A=3, r_B=3)$:* Số chuỗi = 2. $S_(3,3) = 1 times 3 times 2 = 6$ cấu trúc.
  5. *Cặp $(r_A=3, r_B=4)$:* Chuỗi B A B A B A B (1 cách). $S_(3,4) = 1 times 1 times 1 = 1$ cấu trúc.

  Tổng số cấu trúc: $S = 4 + 6 + 1 + 6 + 1 = 18$ cấu trúc.
  Tổng số cách xếp:
  $ N = 18 times 3! times 4! = 18 times 6 times 24 = bold(2592) " cách." $
]

#eg-box(title: [🎯 Ví Dụ 2.6 — Bài toán đối xứng: 3A, 3B, cả hai lớp $k=2$])[
  Xếp 3 học sinh lớp A và 3 học sinh lớp B vào hàng 6 ghế sao cho không có quá 2 bạn cùng lớp nào ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 3, k_A = 2$ và $n_B = 3, k_B = 2$.
  - Phân hoạch A: $r_A \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.
  - Phân hoạch B: $r_B \in \{2, 3\}$. Ta có $f(3, 2, 2) = 2$ và $f(3, 3, 2) = 1$.

  Liệt kê các cặp đợt hợp lệ ($|r_A - r_B| <= 1$):
  1. *Cặp $(r_A=2, r_B=2)$:* Số chuỗi = 2. $S_(2,2) = 2 times 2 times 2 = 8$ cấu trúc.
  2. *Cặp $(r_A=2, r_B=3)$:* Chuỗi B A B A B (1 cách). $S_(2,3) = 2 times 1 times 1 = 2$ cấu trúc.
  3. *Cặp $(r_A=3, r_B=2)$:* Chuỗi A B A B A (1 cách). $S_(3,2) = 1 times 2 times 1 = 2$ cấu trúc.
  4. *Cặp $(r_A=3, r_B=3)$:* Số chuỗi = 2. $S_(3,3) = 1 times 1 times 2 = 2$ cấu trúc.

  Tổng số cấu trúc: $S = 8 + 2 + 2 + 2 = 14$ cấu trúc.
  Tổng số cách xếp:
  $ N = 14 times 3! times 3! = 14 times 6 times 6 = bold(504) " cách." $
]

#warn-box[
  *Cảnh báo lỗi kiểm tra điều kiện khả thi:*
  Khi cả hai lớp bị ràng buộc, bắt buộc phải kiểm tra điều kiện tồn tại trước:
  $ n_A <= k_A times (r_B) <= k_A times (n_B + 1) $
  Nếu số học sinh một lớp vượt quá khả năng chứa tối đa của các vách ngăn của lớp kia, số cách xếp sẽ lập tức bằng 0.
]

== 2.6 — Bài Tập Luyện Chương 2

#recap-box[
  *Phân tích đợt k=3:* Dùng công thức tổng quát của $f(n_A, r, 3)$ để tìm số phân hoạch đợt A; số khe hở từ B là $binom(n_B + 1, r)$.
]

#ex-box(title: "✏️ Bài D1")[
  Xếp 5 học sinh A và 4 học sinh B vào hàng 9 ghế. Không được có quá 3 học sinh A ngồi liên tiếp ($k=3$). Tính số cách.
]
#step-box[
  Ta có $n_A = 5, n_B = 4, k = 3$. Số đợt $r$ chạy từ $ceil(5/3) = 2$ đến 5.
  Số khe hở của B là $n_B + 1 = 5$ khe.

  - *Với $r = 2$ (2 đợt A):* Phân hoạch đợt A có độ dài $\le 3$ gồm các cặp: $(3, 2)$ và $(2, 3)$.
    Số cách phân hoạch đợt: $f(5, 2, 3) = 2$ cách.
    Chọn khe hở: $binom(5, 2) = 10$ cách.
    Đóng góp: $2 times 10 = 20$ cấu trúc.
  - *Với $r = 3$ (3 đợt A):* Các phân hoạch là: $(3, 1, 1)$ (3 cách), $(2, 2, 1)$ (3 cách).
    Số cách phân hoạch đợt: $f(5, 3, 3) = 6$ cách.
    Chọn khe hở: $binom(5, 3) = 10$ cách.
    Đóng góp: $6 times 10 = 60$ cấu trúc.
  - *Với $r = 4$ (4 đợt A):* Các phân hoạch: $(2, 1, 1, 1)$ (4 cách).
    Số cách phân hoạch đợt: $f(5, 4, 3) = 4$ cách.
    Chọn khe hở: $binom(5, 4) = 5$ cách.
    Đóng góp: $4 times 5 = 20$ cấu trúc.
  - *Với $r = 5$ (5 đợt A):* Các phân hoạch: $(1, 1, 1, 1, 1)$ (1 cách).
    Số cách phân hoạch đợt: $f(5, 5, 3) = 1$ cách.
    Chọn khe hở: $binom(5, 5) = 1$ cách.
    Đóng góp: $1 times 1 = 1$ cấu trúc.

  Tổng số cấu trúc Unlabeled: $S = 20 + 60 + 20 + 1 = 101$ cấu trúc.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 101 times 5! times 4! = 101 times 120 times 24 = bold(290880) " cách." $
  *(Lưu ý: Đáp số này đã đính chính lỗi tính toán sai của tài liệu cũ).*
]

#recap-box[
  *Phân tích đợt k=2:* Số cách phân hoạch đợt A là $binom(r, n_A - r)$. Số khe hở từ B là $binom(n_B + 1, r)$.
]

#ex-box(title: "✏️ Bài D2 — Điền Số")[
  Xếp 3 học sinh A và 5 học sinh B vào hàng 8 ghế. Không quá 2 học sinh A ngồi kề nhau. Tính số cách.
]
#step-box[
  Ta có $n_A = 3, n_B = 5, k = 2$. Số đợt $r$ chạy từ 2 đến 3. 5 bạn B tạo ra 6 khe hở.
  - *Với $r = 2$ (2 đợt A):* $f(3, 2, 2) = binom(2, 1) = 2$ cách. Chọn khe hở: $binom(6, 2) = 15$ cách. Đóng góp: $2 times 15 = 30$ cấu trúc.
  - *Với $r = 3$ (3 đợt A):* $f(3, 3, 2) = binom(3, 0) = 1$ cách. Chọn khe hở: $binom(6, 3) = 20$ cách. Đóng góp: $1 times 20 = 20$ cấu trúc.

  Tổng số cấu trúc: $S = 30 + 20 = 50$.
  Tổng số cách xếp học sinh phân biệt:
  $ N = 50 times 3! times 5! = 50 times 6 times 120 = bold(36000) " cách." $
]

#pagebreak()

= Chương 3 — Vòng Tròn: Sức Mạnh Của Việc Chốt Một Người

Bài toán xếp ghế vòng tròn (quanh bàn tròn, vòng xe lửa, ...) luôn là dạng khiến học sinh bối rối nhất vì tính chất đối xứng quay (khi xoay tất cả mọi người cùng một góc, trật tự ngồi tương đối không thay đổi và ta coi đó là một cách xếp duy nhất).

Bí quyết để giải quyết triệt để mọi bài toán vòng tròn là *Chốt (cố định) 1 người*. Khi ta cố định 1 người bất kỳ tại một ghế, ta đã phá vỡ hoàn toàn tính đối xứng xoay của vòng tròn. Kể từ giây phút đó, vòng tròn biến thành một hàng thẳng đặc biệt có điểm neo bắt đầu và kết thúc, giúp ta áp dụng được tất cả các phương pháp đã học ở Chương 1 và Chương 2.

== 3.1 — Cơ Sở: Số Cách Xếp Vòng Tròn Không Ràng Buộc

#rev-box(title: "📖 Nguyên Lý Cố Định Triệt Tiêu Đối Xứng Quay")[
  Khi xếp $n$ người phân biệt quanh một bàn tròn đồng nhất (chỉ tính thứ tự tương đối):
  - Tổng số cách xếp là:
    $ (n - 1)! $
  - *Tại sao?* Ta cố định 1 người bất kỳ ngồi vào 1 vị trí để làm mốc. $n - 1$ người còn lại sẽ xếp vào $n - 1$ ghế còn lại theo thứ tự tuyến tính (hàng thẳng), tạo ra $(n-1)!$ cách.
]

#note-box[
  Lưu ý phân biệt:
  - Nếu ghế có đánh số (hoặc bàn tròn có điểm chuẩn như quay mặt ra cửa): tổng cách là $n!$ (giống hàng thẳng).
  - Nếu ghế không đánh số (chỉ tính thứ tự tương đối): tổng cách là $(n-1)!$.
  (Đề thi Việt Nam nếu nói "ngồi quanh bàn tròn" thì mặc định là thứ tự tương đối, tức không đánh số).
]

== 3.2 — Khe Hở Trong Vòng Tròn: Điểm Khác Biệt Quyết Định

Đây là điểm khác biệt cốt lõi giữa hàng thẳng và vòng tròn, và là nơi học sinh rất dễ làm sai công thức:

#rev-box(title: "📐 Quy Tắc Khe Hở Vòng Tròn")[
  - *Hàng thẳng:* $n_B$ học sinh B tạo ra đúng $n_B + 1$ khe hở (kể cả 2 đầu hàng).
  - *Vòng Tròn:* $n_B$ học sinh B tạo ra đúng $n_B$ khe hở (vì hai đầu được nối lại với nhau tạo thành vòng kín).

  *Hệ quả:* Khi dùng phương pháp vách ngăn (Slot Method) trên vòng tròn, ta dùng tổ hợp $binom(n_B, n_A)$ thay vì $binom(n_B + 1, n_A)$.
]

== 3.3 — Slot Method (Vách Ngăn) Cho Vòng Tròn

#method-box[
  *⚙️ Phương Pháp Vách Ngăn Tròn (Không kề nhau)*

  Để xếp $n_A$ học sinh A và $n_B$ học sinh B quanh bàn tròn sao cho không có 2 bạn A nào ngồi kề nhau:
  - Điều kiện tồn tại: $n_A <= n_B$ (phải có đủ vách ngăn B để ngăn cách A).
  - Các bước thực hiện:
    1. Xếp $n_B$ học sinh B quanh bàn tròn trước: có $(n_B - 1)!$ cách.
    2. Chọn $n_A$ khe hở trong số $n_B$ khe hở của B để đặt A vào: có $binom(n_B, n_A)$ cách.
    3. Xếp $n_A$ học sinh A vào các khe đã chọn: có $n_A!$ cách.
]

#ans-box[
  *📐 Công Thức Slot Method Vòng Tròn*
  $ N = (n_B - 1)! times binom(n_B, n_A) times n_A! $
]

*🔷 Cặp Ví Dụ Kép 1: Slot Method Bàn Tròn*

#eg-box(title: "🎯 Ví Dụ 3.1 — 3A và 5B ngồi quanh bàn tròn, không kề nhau")[
  Có 3 học sinh lớp A và 5 học sinh lớp B. Xếp quanh bàn tròn sao cho không có 2 bạn A nào kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 3, n_B = 5$. Kiểm tra điều kiện: $3 <= 5$ (thỏa mãn). Áp dụng công thức trực tiếp:
  $ N = (5 - 1)! times binom(5, 3) times 3! = 24 times 10 times 6 = bold(1440) " cách." $
]

#eg-box(title: "🎯 Ví Dụ 3.2 — 4A và 6B ngồi quanh bàn tròn, không kề nhau")[
  Có 4 học sinh lớp A và 6 học sinh lớp B. Xếp quanh bàn tròn sao cho không có 2 bạn A nào kề nhau.

  *Lời giải chi tiết:*
  Ta có $n_A = 4, n_B = 6$. Kiểm tra điều kiện: $4 <= 6$ (thỏa mãn). Áp dụng công thức trực tiếp:
  $ N = (6 - 1)! times binom(6, 4) times 4! = 120 times 15 times 24 = bold(43200) " cách." $
]

*🔷 Cặp Ví Dụ Kép 2: Xen Kẽ Bắt Buộc ($n_A = n_B$)*

#eg-box(title: "🎯 Ví Dụ 3.3 — 4A và 4B quanh bàn tròn, xen kẽ nhau")[
  Có 4 học sinh lớp A và 4 học sinh lớp B. Xếp quanh bàn tròn sao cho không có 2 bạn cùng lớp ngồi kề nhau.

  *Lời giải chi tiết:*
  Vì $n_A = n_B = 4$ nên để không ai cùng lớp kề nhau, bắt buộc học sinh phải ngồi xen kẽ lớp: `A B A B A B A B`.
  1. Cố định bạn $A_1$ tại một vị trí để làm mốc.
  2. Xếp 3 bạn lớp A còn lại vào 3 ghế dành cho lớp A: có $3! = 6$ cách.
  3. Xếp 4 bạn lớp B vào 4 ghế xen kẽ dành cho lớp B: có $4! = 24$ cách.

  Số cách xếp là:
  $ N = 3! times 4! = 6 times 24 = bold(144) " cách." $
  (Kiểm tra lại bằng công thức Slot Method: $N = (4-1)! times binom(4, 4) times 4! = 6 times 1 times 24 = 144$ cách. ✓)
]

#eg-box(title: "🎯 Ví Dụ 3.4 — 3A và 3B quanh bàn tròn, xen kẽ nhau")[
  Có 3 học sinh lớp A và 3 học sinh lớp B. Xếp quanh bàn tròn sao cho không có 2 bạn cùng lớp ngồi kề nhau.

  *Lời giải chi tiết:*
  Học sinh phải ngồi xen kẽ dạng `A B A B A B`.
  1. Cố định bạn $A_1$ làm mốc.
  2. Xếp 2 bạn lớp A còn lại: có $2! = 2$ cách.
  3. Xếp 3 bạn lớp B vào các ghế xen kẽ: có $3! = 6$ cách.

  Tổng số cách xếp là:
  $ N = 2! times 3! = 2 times 6 = bold(12) " cách." $
  (Kiểm tra lại bằng công thức Slot Method: $N = (3 - 1)! times binom(3, 3) times 3! = 2 times 1 times 6 = 12$ cách. ✓)
]

*🔷 Cặp Ví Dụ Kép 3: PIE Cho 2 Lớp Quanh Bàn Tròn*

Khi xếp các học sinh sao cho không ai cùng lớp kề nhau, nếu chỉ có 2 lớp, điều này tương đương với việc xếp xen kẽ. Tuy nhiên, ta cũng có thể tư duy bằng cách chốt 1 người rồi đếm.

#eg-box(title: "🎯 Ví Dụ 3.5 — Quy mô cực nhỏ: 2A, 2B quanh bàn tròn")[
  Có 2 học sinh lớp A ($A_1, A_2$) và 2 học sinh lớp B ($B_1, B_2$). Xếp quanh bàn tròn sao cho không có 2 bạn cùng lớp ngồi kề nhau.

  *Lời giải chi tiết:*
  1. Cố định bạn $A_1$ tại một vị trí để làm mốc.
  2. Để không có học sinh cùng lớp ngồi kề nhau, học sinh lớp A còn lại ($A_2$) bắt buộc phải ngồi đối diện $A_1$ (không thể kề $A_1$). Có đúng 1 cách xếp $A_2$.
  3. Hai vị trí còn lại ở giữa sẽ dành cho $B_1$ và $B_2$. Số cách xếp hai bạn B là $2! = 2$ cách.

  Tổng số cách xếp là:
  $ N = 1 times 2 = bold(2) " cách." $
]

#eg-box(title: "🎯 Ví Dụ 3.6 — Quy mô vừa: 3A, 3B quanh bàn tròn")[
  Có 3 học sinh lớp A ($A_1, A_2, A_3$) và 3 học sinh lớp B ($B_1, B_2, B_3$). Xếp quanh bàn tròn sao cho không có 2 bạn cùng lớp ngồi kề nhau.

  *Lời giải chi tiết:*
  Vì $n_A = n_B = 3$, bài toán quy về xếp xen kẽ giống Ví dụ 3.4.
  1. Cố định bạn $A_1$ làm mốc.
  2. Xếp 2 bạn lớp A còn lại vào 2 vị trí A còn lại: có $2! = 2$ cách.
  3. Xếp 3 bạn lớp B vào 3 vị trí B xen kẽ: có $3! = 6$ cách.

  Tổng số cách xếp là:
  $ N = 2! times 3! = bold(12) " cách." $
]

*🔷 Cặp Ví Dụ Kép 4: Phân Tích Slot Method Đa Lớp (Nhiều Lớp Quanh Bàn Tròn)*

Khi có từ 3 lớp trở lên, ta có thể dùng phương pháp xếp trước các lớp nhỏ hơn rồi xen kẽ lớp lớn vào để kiểm soát kề nhau một cách trực quan, không cần dùng công thức bao hàm loại trừ (PIE) phức tạp và dễ nhầm lẫn.

#eg-box(title: "🎯 Ví Dụ 3.7 — Quy mô nhỏ: 2A, 2B, 2C quanh bàn tròn")[
  Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C. Xếp quanh bàn tròn sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta xếp 2 học sinh lớp B ($B_1, B_2$) và 2 học sinh lớp C ($C_1, C_2$) quanh bàn tròn trước.
  Tổng số cách xếp 4 học sinh này quanh bàn tròn là $(4 - 1)! = 6$ cách.
  Ta phân tích cấu trúc của 4 học sinh này:

  - *Trường hợp 1 — B và C ngồi xen kẽ dạng `B C B C`:*
    Có đúng 2 cách xếp (chốt $B_1$, $B_2$ ngồi đối diện, $C_1, C_2$ ngồi 2 bên).
    Khi đó, ta có 4 khe hở giữa các bạn B, C. Để xếp 2 học sinh lớp A vào mà không kề nhau, ta chọn 2 khe hở trong 4 khe hở này (mỗi khe hở chỉ chứa tối đa 1 học sinh A).
    Số cách chọn và xếp A là: $binom(4, 2) times 2! = 6 times 2 = 12$ cách.
    Đóng góp của TH1 là: $2 times 12 = 24$ cách.

  - *Trường hợp 2 — B và C không ngồi xen kẽ (có 1 cặp B-B kề nhau và 1 cặp C-C kề nhau):*
    Có $6 - 2 = 4$ cách xếp.
    Trong mỗi cách xếp, ta có đúng 1 cặp B-B và 1 cặp C-C kề nhau. Để ngăn cách chúng, ta bắt buộc phải xếp đúng 1 học sinh lớp A vào khe giữa B-B, và đúng 1 học sinh lớp A vào khe giữa C-C.
    Số cách xếp 2 học sinh lớp A vào 2 vị trí này là $2! = 2$ cách.
    Đóng góp của TH2 là: $4 times 2 = 8$ cách.

  - *Tổng số cách xếp:*
    $ N = 24 + 8 = bold(32) " cách." $
]

#eg-box(title: "🎯 Ví Dụ 3.8 — Quy mô lớn: 3A, 2B, 2C quanh bàn tròn")[
  Có 3 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C. Xếp quanh bàn tròn sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau.

  *Lời giải chi tiết:*
  Ta xếp 2 học sinh lớp B ($B_1, B_2$) và 2 học sinh lớp C ($C_1, C_2$) quanh bàn tròn trước.
  Có 6 cách xếp 4 học sinh này quanh bàn tròn.

  - *Trường hợp 1 — B và C ngồi xen kẽ dạng `B C B C`:*
    Có đúng 2 cách xếp. Ta thu được 4 khe hở.
    Ta cần xếp 3 học sinh lớp A vào 4 khe hở này sao cho không có 2 bạn A nào kề nhau (tức mỗi khe hở chứa tối đa 1 bạn A).
    Chọn 3 khe hở trong 4 khe hở và xếp 3 học sinh A: $binom(4, 3) times 3! = 4 times 6 = 24$ cách.
    Đóng góp của TH1: $2 times 24 = 48$ cách.

  - *Trường hợp 2 — B và C không ngồi xen kẽ (có 1 cặp B-B kề nhau và 1 cặp C-C kề nhau):*
    Có 4 cách xếp B, C.
    Để phá vỡ các cặp kề này, ta bắt buộc phải xếp ít nhất 1 bạn A vào khe giữa B-B, và ít nhất 1 bạn A vào khe giữa C-C.
    Bạn A thứ ba sẽ xếp vào 1 trong 2 khe hở còn lại.
    Do đó, ta có đúng 2 cách chọn 3 khe hở cho A (phải chứa khe B-B và khe C-C).
    Số cách xếp 3 học sinh A vào 3 khe hở đã chọn là $3! = 6$ cách.
    Đóng góp của TH2: $4 times 2 times 6 = 48$ cách.

  - *Tổng số cách xếp:*
    $ N = 48 + 48 = bold(96) " cách." $
    *(Lưu ý: Đáp số này đã đính chính lỗi tính toán sai của tài liệu cũ).*
]

== 3.7 — Điều Kiện Tồn Tại: Khi Nào Bài Toán Vòng Tròn Có Nghiệm?

#rev-box(title: "⚙️ Điều Kiện Cần Đủ Cho Bài Toán Không Kề Cùng Lớp")[
  Bài toán xếp $n$ học sinh thuộc $s$ lớp khác nhau (lớp $i$ có $n_i$ học sinh, $sum n_i = n$) ngồi quanh bàn tròn sao cho không có 2 học sinh cùng lớp nào kề nhau có nghiệm khi và chỉ khi:
  $ max_i \{n_i\} <= floor(n / 2) $
  *Quy tắc dễ nhớ:* Không được phép có bất kỳ lớp nào chiếm đa số tuyệt đối (vượt quá nửa tổng số ghế).
]

#note-box[
  *Tại sao?* Trong vòng tròn $n$ chỗ, mỗi người có 2 người ngồi hai bên. Nếu một lớp có số học sinh vượt quá $floor(n/2)$, ta sẽ không thể có đủ học sinh của các lớp khác để xếp vào xen kẽ làm "vách ngăn" ngăn cách toàn bộ học sinh lớp này.
]

#warn-box[
  *⚠️ Chú Ý — Bẫy Thường Gặp*

  Cẩn thận 3 bẫy phổ biến khi làm bài vòng tròn:
  1. *Dùng $n_B + 1$ khe hở:* Chỉ có hàng thẳng mới có $n_B + 1$ khe hở. Vòng tròn được khép kín nên chỉ có đúng $n_B$ khe hở.
  2. *Quên hoán vị học sinh:* Sau khi tính được số cấu trúc chưa đánh nhãn (Unlabeled), bắt buộc phải nhân thêm các hoán vị học sinh của mỗi lớp ($n_A! times n_B! times dots$).
  3. *Điều kiện biên:* Luôn kiểm tra điều kiện tồn tại nghiệm $max_i \{n_i\} <= floor(n/2)$ trước khi tính toán.
]

== 3.8 — Bài Tập Luyện Chương 3

#recap-box[
  *Slot Method vòng tròn (2 lớp, $n_A <= n_B$):*
  $ N = (n_B - 1)! times binom(n_B, n_A) times n_A! $
]

#ex-box(title: "✏️ Bài E1 — Slot Method")[
  Có 4 học sinh A và 6 học sinh B ngồi quanh bàn tròn 10 ghế. Không có 2 học sinh A nào ngồi kề nhau. Tính số cách.
]
#step-box[
  Ta có $n_A = 4, n_B = 6$. Kiểm tra điều kiện: $4 <= 6$ (thỏa mãn).
  Áp dụng công thức trực tiếp:
  $ N = (6 - 1)! times binom(6, 4) times 4! = 120 times 15 times 24 = bold(43200) " cách." $
]

#recap-box[
  *Vòng tròn xen kẽ ($n_A = n_B = m$):*
  $ N = (m - 1)! times m! $
]

#ex-box(title: "✏️ Bài E2 — Xen Kẽ Bắt Buộc")[
  Có 5 học sinh A và 5 học sinh B ngồi quanh bàn tròn 10 ghế. Không ai cùng lớp ngồi kề nhau. Tính số cách.
]
#step-box[
  Với $n_A = n_B = 5$, học sinh bắt buộc phải ngồi xen kẽ nhau.
  Chốt 1 bạn lớp A làm mốc.
  - Xếp 4 bạn lớp A còn lại: có $4! = 24$ cách.
  - Xếp 5 bạn lớp B vào 5 ghế xen kẽ: có $5! = 120$ cách.

  Tổng số cách xếp là:
  $ N = 4! times 5! = 24 times 120 = bold(2880) " cách." $
]

#recap-box[
  *Sử dụng phương pháp Slot Method đa lớp:* Xếp các lớp nhỏ trước, sau đó phân tích các trường hợp xen kẽ của chúng để xếp lớp lớn vào các khe hở.
]

#ex-box(title: "✏️ Bài E3 — Nhiều Lớp Quanh Bàn Tròn")[
  Có 4 học sinh A, 2 học sinh B, 2 học sinh C ngồi quanh bàn tròn 8 ghế. Không ai cùng lớp kề nhau. Tính số cách.
]
#step-box[
  Kiểm tra điều kiện tồn tại: $n_A = 4 <= floor(8/2) = 4$ (thỏa mãn).
  Ta xếp 2 học sinh B ($B_1, B_2$) và 2 học sinh C ($C_1, C_2$) quanh bàn tròn trước.
  Có 6 cách xếp 4 học sinh này quanh bàn tròn.

  - *Trường hợp 1 — B và C ngồi xen kẽ dạng `B C B C`:*
    Có đúng 2 cách xếp. Ta thu được 4 khe hở.
    Ta cần xếp 4 học sinh lớp A vào 4 khe hở này sao cho không có 2 bạn A nào kề nhau (tức mỗi khe hở chứa đúng 1 bạn A).
    Số cách xếp 4 học sinh A là $4! = 24$ cách.
    Đóng góp: $2 times 24 = 48$ cách.

  - *Trường hợp 2 — B và C không ngồi xen kẽ (có 1 cặp B-B và 1 cặp C-C):*
    Có 4 cách xếp B, C.
    Để ngăn cách các cặp kề này, ta bắt buộc phải xếp ít nhất 1 bạn A vào khe giữa B-B, và ít nhất 1 bạn A vào khe giữa C-C.
    Ta còn 2 bạn A nữa và 2 khe hở còn lại. Vậy mỗi khe hở trong số 4 khe hở đều chứa đúng 1 bạn A!
    Số cách xếp 4 học sinh A vào 4 khe hở là $4! = 24$ cách.
    Đóng góp: $4 times 24 = 96$ cách.

  - *Tổng số cách xếp là:*
    $ N = 48 + 96 = bold(144) " cách." $
]

#recap-box[
  *Kiểm tra điều kiện tồn tại:* $max_i \{n_i\} <= floor(n/2)$. Nếu vi phạm điều kiện này, đáp số lập tức bằng 0.
]

#ex-box(title: "✏️ Bài E4 — Nhận Biết Điều Kiện Không Tồn Tại")[
  Có 5 học sinh lớp A và 3 học sinh lớp B. Có thể xếp tất cả ngồi quanh bàn tròn 8 ghế sao cho không ai cùng lớp kề nhau không? Giải thích.
]
#step-box[
  Kiểm tra điều kiện tồn tại: $max\{n_A, n_B\} = 5$.
  Nhưng $floor(n/2) = floor(8/2) = 4$.
  Vì $5 > 4$ nên điều kiện tồn tại không thỏa mãn.

  *Giải thích trực quan:* Để 5 học sinh lớp A không kề nhau, ta cần có ít nhất 5 học sinh lớp khác ngồi xen kẽ ở giữa chúng để làm vách ngăn. Tuy nhiên, ta chỉ có 3 học sinh lớp B. Do đó, chắc chắn sẽ có ít nhất 2 học sinh lớp A phải ngồi kề nhau.
  Vậy số cách xếp thỏa mãn là $bold(0)$ cách.
]

#pagebreak()

= Tổng Kết — Bản Đồ Ba Dạng Và Mẹo Nhận Dạng Nhanh

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("F5F0FF"), rgb("E8F5E9"), angle: 90deg),
    stroke: 1pt + col-violet,
    radius: 10pt,
    inset: (x: 16pt, y: 14pt),
  )[
    #text(fill: col-purple, size: 12pt, weight: "bold")[🗺️ Bản Đồ Nhận Dạng 3 Dạng Xếp Ghế Nâng Cao]
    #v(0.8em)
    #table(
      columns: (1.3fr, 1.7fr, 1.8fr, 2.2fr),
      inset: 10pt,
      align: left + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("4A148C") } else if row == 1 { rgb("F3E5F5") } else if row == 2 { rgb("E8F5E9") } else if (
          row == 3
        ) { rgb("E0F7FA") } else { none }
      },
      stroke: 0.5pt + col-violet,
      [#text(fill: white, weight: "bold")[Dạng]],
      [#text(fill: white, weight: "bold")[Nhận Dạng Đề Bài]],
      [#text(fill: white, weight: "bold")[Công Cụ Chính]],
      [#text(fill: white, weight: "bold")[Công Thức Ghi Nhớ]],

      [*1 — Hai Dãy Đối Diện*],
      [Hai hàng song song đối mặt; cấm cùng lớp ngồi đối diện (cùng cột)],
      [Nguyên lý cột độc lập: đếm từng cột rồi nhân],
      [$N = 2^m (m!)^2$ khi $n_A = n_B = m$],

      [*2 — Không Quá k*],
      [Hàng thẳng; giới hạn số người cùng lớp liên tiếp $<= k$],
      [Phân tích đợt + Sao & Thanh Chắn; $k=1$  $arrow.r$  Slot Method],
      [$f(n_A, r, 2) = binom(r, n_A - r)$ và $binom(n_B+1, r)$],

      [*3 — Vòng Tròn*],
      [Bàn tròn; cấm cùng lớp ngồi kề; kiểm tra $max n_i <= floor(n/2)$],
      [Chốt 1 người (Slot Method vòng tròn / Phân tích đa lớp)],
      [$N = (n_B-1)! times binom(n_B, n_A) times n_A!$],
    )
  ]
]

#v(1.0em)

#rev-box(title: "🏁 Quy Trình Giải Mọi Bài Xếp Ghế Nâng Cao")[
  Khi nhận một bài toán xếp ghế, hãy hỏi 4 câu theo thứ tự:
  1. *Câu 1 — Cấu hình ghế là gì?*
    - "2 dãy song song"  $arrow.r$  Chương 1 (Đối diện).
    - "Một hàng thẳng"  $arrow.r$  Chương 2 (hoặc Slot/PIE thông thường nếu $k=1$).
    - "Vòng tròn / bàn tròn"  $arrow.r$  Chương 3.
  2. *Câu 2 — Ràng buộc là ràng buộc "kề" hay "đối diện"?*
    - "Đối diện"  $arrow.r$  Chương 1.
    - "Kề (hàng thẳng)"  $arrow.r$  Chương 2.
    - "Kề (vòng tròn)"  $arrow.r$  Chương 3.
  3. *Câu 3 — Ràng buộc có giới hạn số người liên tiếp ($k > 1$) không?*
    - $k = 1$  $arrow.r$  Slot Method / PIE cũ.
    - $k >= 2$  $arrow.r$  Phân tích đợt (Chương 2).
  4. *Câu 4 — Điều kiện tồn tại có thỏa mãn không?*
    - Chương 1: $n_A = n_B = m$ (nếu chỉ có 2 lớp).
    - Chương 3: $max n_i <= floor(n/2)$.
    *Nếu không thỏa mãn, đáp số ngay lập tức bằng 0.*
]

#note-box(title: "📌 Dự Đoán Xu Hướng Đề Thi")[
  Dựa trên phân tích đề thi THPT Quốc gia và đề thi thử những năm gần đây:
  - *Dạng 1 (Đối Diện):* Hay gặp ở mức độ Vận dụng - Vận dụng cao. Thường kết hợp với bài toán chia 2 nhóm để học sinh dễ nhầm lẫn.
  - *Dạng 2 (Không Quá k):* Phổ biến nhất ở mức $k = 2$, thường đặt $n_A = 3$ hoặc $4$ để học sinh có thể lập bảng phân hoạch đợt bằng tay nhanh chóng.
  - *Dạng 3 (Vòng Tròn):* Kinh điển, rất dễ xuất hiện trong các câu phân loại điểm 9-10. Xu hướng gần đây là kết hợp thêm điều kiện thứ tự tương đối của một số bạn đặc biệt.
]

#align(center)[
  #block(
    width: 95%,
    fill: rgb("1A237E"),
    stroke: 1pt + rgb("3F51B5"),
    radius: 10pt,
    inset: (x: 16pt, y: 14pt),
  )[
    #text(fill: rgb("90CAF9"), size: 12pt, weight: "bold")[📋 Bảng Đáp Số Bài Tập Thực Chiến]
    #v(0.8em)
    #table(
      columns: (1.2fr, 2.0fr, 1.2fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("1A237E") } else if calc.rem(row, 2) == 1 { rgb("0D1B4B") } else { rgb("0F244A") }
      },
      stroke: 0.5pt + rgb("3F51B5"),
      [#text(fill: rgb("90CAF9"), weight: "bold")[Bài]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Nội Dung]],
      [#text(fill: rgb("90CAF9"), weight: "bold")[Đáp Số]],

      [C1], [4A, 4B, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C2], [3A, 3B, 3C, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[0]],
      [C3], [4A, 4B, hạn chế Hàng 1], [#text(fill: rgb("FFD54F"), weight: "bold")[576]],
      [C4], [4A, 2B, 1C, 1D, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[9216]],
      [C5], [3A, 2B, 1C, 2 dãy đối diện], [#text(fill: rgb("FFD54F"), weight: "bold")[288]],
      [D1], [5A, 4B, không quá $k=3$ A], [#text(fill: rgb("FFD54F"), weight: "bold")[290880]],
      [D2], [3A, 5B, không quá $k=2$ A], [#text(fill: rgb("FFD54F"), weight: "bold")[36000]],
      [E1], [4A, 6B, vòng tròn, không kề A-A], [#text(fill: rgb("FFD54F"), weight: "bold")[43200]],
      [E2], [5A, 5B, vòng tròn, xen kẽ], [#text(fill: rgb("FFD54F"), weight: "bold")[2880]],
      [E3], [4A, 2B, 2C, vòng tròn], [#text(fill: rgb("FFD54F"), weight: "bold")[144]],
      [E4], [5A, 3B, vòng tròn kiểm tra], [#text(fill: rgb("FFD54F"), weight: "bold")[0]],
    )
  ]
]
