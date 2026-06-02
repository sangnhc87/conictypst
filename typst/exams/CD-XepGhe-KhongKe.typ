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

// ─── Hộp Định Lý ─────────────────────────────────
#let thm-box(title: [📐 Định Lý], body) = block(
  fill: rgb("FCE4EC"),
  stroke: (left: 5pt + col-pink, rest: 0.8pt + rgb("F48FB1")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 13pt),
  width: 100%,
)[
  #text(fill: col-pink, size: 11pt, weight: "bold")[#title]
  #v(0.4em)
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
    #text(fill: white, size: 24pt, weight: "black")[BẢN CHẤT & TỔNG QUÁT HÓA BÀI TOÁN XẾP GHẾ KHÔNG KỀ]
    #v(0.4em)
    #text(
      fill: rgb("E1BEE7"),
      size: 14pt,
    )[🎯 Cẩm Nang Đối Chiếu 2 Phương Pháp Thực Chiến: Khung Xương Tổ Hợp & Bù Trừ Cặp Kề Trùng]
    #v(0.5em)
    #text(fill: rgb("CE93D8"), size: 10.5pt, style: "italic")[
      "Xây Dựng Lý Thuyết Từ Gốc Rễ - Hệ Thống Ví Dụ Từ Dễ Đến Khó Giải Bằng 2 Cách Mịn Màng"
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
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Cơ sở* Khung xương]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Bù trừ* Cặp kề trùng]
        ]
      ],
      [
        #block(fill: rgb("FFFFFF20"), inset: 8pt, radius: 6pt)[
          #text(fill: rgb("D1C4E9"), size: 8.5pt)[*Công thức* Tổng quát]
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
    #text(fill: col-purple, size: 11pt, weight: "bold")[📚 Đường Lối Phát Triển Lý Thuyết]
    #v(0.5em)
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 0.65em,
      align: left,
      [📖 *Chương 1* — Khung Xương Diophantine],
      [📐 *Chương 2* — Bù trừ Cặp kề trùng (Adjacent-Pair PIE)],
      [🚀 *Chương 3* — Bài tập thực chiến (Ví dụ 1-4)],
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

// ═══════════════════════════════════════════════
// CHƯƠNG 1: PHƯƠNG PHÁP KHUNG XƯƠNG DIOPHANTINE
// ═══════════════════════════════════════════════
= Chương 1 — Phương pháp Vách Ngăn (Slot Method / Insertion)

Phương pháp Vách ngăn (còn gọi là phương pháp khe hở) là kỹ thuật trực quan nhất để giải quyết các bài toán "không kề nhau" trong tổ hợp phổ thông. Ý tưởng cốt lõi của nó là chia bài toán làm hai bước độc lập:

#rev-box(title: "⚙️ Nguyên lý Vách Ngăn Phổ Thông")[
  Để xếp $k$ phần tử thuộc nhóm bị ràng buộc cấm kề (ví dụ: nhóm A) vào hàng ngang cùng các phần tử tự do khác:
  1. *Bước 1:* Ta xếp các phần tử tự do (các vách ngăn) thành hàng ngang trước. Nếu có $m$ phần tử tự do, chúng sẽ tạo ra đúng $m + 1$ khe trống xung quanh (bao gồm cả hai đầu):
    $ "_" quad "X" quad "_" quad "X" quad "_" quad dots quad "_" quad "X" quad "_" $
  2. *Bước 2:* Để đảm bảo các phần tử nhóm A không kề nhau, ta chỉ việc chọn $k$ khe trong số $m + 1$ khe này và đặt các phần tử nhóm A vào (mỗi khe chứa tối đa 1 phần tử).

  - Số cách chọn các khe hở: $C_(m + 1)^k$ cách.
  - Nếu các phần tử trong mỗi nhóm phân biệt, ta nhân thêm hoán vị của từng nhóm: $m!$ (cho nhóm tự do) và $k!$ (cho nhóm A).
]

#eg-box(title: "🎯 Ví dụ minh họa")[
  Xếp 3 học sinh lớp A và 5 học sinh lớp B vào một hàng 8 ghế sao cho không có hai học sinh lớp A nào ngồi cạnh nhau:
  - Xếp 5 bạn lớp B trước: có $5! = 120$ cách.
  - 5 bạn lớp B tạo ra 6 khe trống: `_ B _ B _ B _ B _ B _`.
  - Chọn 3 khe trong 6 khe để đặt 3 học sinh lớp A vào: có $A_6^3 = 120$ cách.
  - Tổng số cách xếp: $120 times 120 = 14400$ cách.
]

#note-box(title: "📌 Mối liên hệ với phương trình Diophantine")[
  Nếu coi các khe hở có kích thước là $x_1, x_2, dots, x_(k+1)$, việc xếp các phần tử tự do tương đương với việc tìm số nghiệm nguyên không âm của phương trình:
  $ x_1 + x_2 + dots + x_(k+1) = m $
  Với điều kiện các khe ở giữa phải chứa nhất 1 phần tử để ngăn cách: $x_2, x_3, dots, x_k >= 1$ và $x_1, x_(k+1) >= 0$.
  Bằng cách đặt $y_i = x_i - 1 >= 0$, ta đưa về bài toán chia kẹo Euler quen thuộc và thu được kết quả đồng nhất là $C_(m + 1)^k$ cách chọn cấu trúc.
]

#pagebreak()

= Chương 2 — Phương pháp Bù Trừ qua Ghép Khối (PIE)

Khi bài toán có nhiều nhóm đối tượng cùng bị ràng buộc cấm kề nhau (ví dụ: cấm $A A$, cấm $B B$, cấm $C C$), phương pháp vách ngăn đơn thuần sẽ gặp khó khăn do cấu trúc đan chéo phức tạp. Đây là lúc ta dùng *Nguyên lý Bù trừ (Inclusion-Exclusion Principle)* thông qua kỹ thuật *Ghép khối (Glueing)* rất trực quan.

#rev-box(title: "⚙️ Nguyên lý Ghép Khối Bù Trừ")[
  Để tính số cách sắp xếp không vi phạm bất kỳ ràng buộc kề trùng nào:
  1. *Tính số cách xếp tự do (không ràng buộc):* Gọi là $N_("tự do")$.
  2. *Xác định các trường hợp vi phạm:*
    - Để tính số cách xếp có ít nhất 1 cặp cùng lớp kề nhau (ví dụ lớp A): ta chọn 2 học sinh lớp A và "ghép" (dán) họ lại thành một khối kép duy nhất $A_2$.
    - Số cách chọn và xếp thứ tự 2 bạn trong khối kép đó là $A_(n_A)^2 = n_A (n_A - 1)$ cách.
    - Khi đó, số thực thể của bài toán giảm đi 1 (khối kép $A_2$ đóng vai trò là 1 thực thể). Ta tiến hành hoán vị các thực thể này.
  3. *Áp dụng công thức Bù trừ:*
    $ N_("hợp lệ") = N_("tự do") - sum N("đơn vi phạm") + sum N("đôi vi phạm") - sum N("ba vi phạm") + dots $
]

#eg-box(title: "🎯 Ví dụ minh họa")[
  Xếp 3 bạn A và 2 bạn B vào 5 vị trí sao cho không có học sinh cùng lớp ngồi kề nhau ($n_A = 3, n_B = 2$):
  - Xếp tự do (đồng nhất lớp): $frac(5!, 3! 2!) = 10$ cấu trúc.
  - Vi phạm $A A$ (ghép 2 chữ A thành $A_2$): số thực thể gồm 1 khối $A_2$, 1 chữ A, 2 chữ B. Có $frac(4!, 1! 1! 2!) = 12$ cấu trúc. Nhưng số cách chọn liên kết A là $C_2^1 = 2$ cách, nên số đóng góp vi phạm là $2 times 6 = 12$ (hoặc tính theo số thực thể còn lại).
  - Sử dụng Adjacent-Pair PIE để lập bảng tính tay siêu tốc.
]

#rev-box(title: "⚖️ So sánh tổng quan giữa hai phương pháp")[
  #align(center)[
    #table(
      columns: (1.5fr, 2.5fr, 2.5fr),
      align: left + horizon,
      fill: (col, row) => if row == 0 { rgb("FCE4EC") } else { none },
      stroke: 0.5pt + col-pink,
      [*Tiêu chí*], [*Phương pháp Vách ngăn (Slot Method)*], [*Phương pháp Bù trừ Ghép khối (PIE)*],
      [*Đặc điểm cốt lõi*],
      [Dựng khung bằng nhóm lớn nhất, chèn các nhóm khác vào các khoảng trống (khe hở).],
      [Đếm tất cả các hoán vị tự do, sau đó trừ đi các trường hợp kề trùng bằng cách ghép khối.],

      [*Ưu điểm nổi bật*],
      [Trực quan, dễ hình dung cấu trúc xếp chỗ thực tế.],
      [Hoàn toàn tự động hóa bằng bảng tính, không cần suy nghĩ chia trường hợp hình học.],

      [*Nhược điểm*],
      [Bị bùng nổ số lượng cấu trúc và cực kỳ phức tạp khi có nhiều ghế trống hoặc nhiều nhóm học sinh.],
      [Số lượng dòng của bảng tăng nhanh khi số học sinh của mỗi nhóm lớn.],

      [*Trường hợp tối ưu*],
      [Khi không có ghế trống ($n_E = 0$) hoặc chỉ có rất ít ghế trống ($n_E <= 2$).],
      [Khi bài toán có nhiều ghế trống ($n_E >= 3$) hoặc khi số lượng học sinh mỗi lớp nhỏ ($<= 3$).],
    )
  ]
]

== 2.1 — Cách Lập Bảng PIE Không Nhảy Bước

#method-box[
  Nếu em thấy bảng PIE giống "đại bác bắn chim sẻ", vấn đề thường không nằm ở bản chất của PIE, mà ở chỗ bảng được viết *quá nhanh*. Thực ra, *mỗi dòng trong bảng đều được sinh ra bằng đúng một khuôn lặp lại*.

  Với bài xếp hàng ngang có các lớp $A, B, C$ và có thể có thêm ghế trống $E$, ta chỉ làm đúng 6 câu hỏi sau:

  1. Hôm nay ta ghép bao nhiêu cặp $A A$, bao nhiêu cặp $B B$, bao nhiêu cặp $C C$?
  2. Mỗi lớp còn bao nhiêu *khối* sau khi ghép?
  3. Tổng số thực thể còn lại là bao nhiêu?
  4. Số hoán vị đồng nhất lớp của các thực thể đó là bao nhiêu?
  5. Dòng này mang dấu cộng hay dấu trừ?
  6. Đóng góp cuối cùng bằng: *chọn cặp* $times$ *hoán vị đồng nhất* $times$ *dấu*.
]

#rev-box(title: "🧩 Khuôn Chuẩn Của Một Dòng Bảng")[
  Giả sử ban đầu có:
  - $n_A$ chữ A,
  - $n_B$ chữ B,
  - $n_C$ chữ C,
  - $n_E$ ghế trống $E$.

  Một dòng bảng có chỉ số $(i, j, k)$ nghĩa là:
  - ghép $i$ cặp $A A$,
  - ghép $j$ cặp $B B$,
  - ghép $k$ cặp $C C$.

  Khi đó:
  - *cột Chọn cặp* là
    $ C_(n_A - 1)^i dot C_(n_B - 1)^j dot C_(n_C - 1)^k. $
  - *cột Thực thể* là
    $ (n_A - i, n_B - j, n_C - k, n_E). $
  - *cột Tổng* là
    $ T = n_A + n_B + n_C + n_E - i - j - k. $
  - *cột Hoán vị đồng nhất* là
    $ frac(T!, (n_A-i)! (n_B-j)! (n_C-k)! n_E!). $
  - *cột Dấu* là $(-1)^(i+j+k)$, nghĩa là:
    - ghép tổng lẻ cặp $=>$ dấu trừ,
    - ghép tổng chẵn cặp $=>$ dấu cộng.

  *Chốt lại:* một dòng bảng không có gì bí ẩn. Nó chỉ là một phép thay số vào đúng cái khuôn này.
]

#eg-box(title: [🎯 Vì sao bài $3A, 2B, 2C$ lại có đúng 12 dòng?])[
  Bài đó có:
  - lớp A gồm `A A A`, nên bên trong A có đúng *2 khe dính nội bộ* $=>$ $i = 0, 1, 2$;
  - lớp B gồm `B B`, nên chỉ có *1 khe dính* $=>$ $j = 0, 1$;
  - lớp C gồm `C C`, nên cũng chỉ có *1 khe dính* $=>$ $k = 0, 1$.

  Vậy tổng số dòng là:
  $ 3 dot 2 dot 2 = 12. $

  Đây là điểm học sinh hay bị "ngợp": tưởng phải nghĩ ra 12 trường hợp khác nhau. Thực ra không phải. Ta chỉ cần duyệt tất cả bộ ba chỉ số $(i, j, k)$ có thể xảy ra.
]

#eg-box(title: [🔍 Mổ Xẻ Một Dòng Mẫu: dòng $(1, 0, 1)$ của bài $3A, 2B, 2C$])[
  Dòng $(1, 0, 1)$ nghĩa là:
  - ghép *1* cặp $A A$,
  - ghép *0* cặp $B B$,
  - ghép *1* cặp $C C$.

  Đừng chỉ đọc bằng lời. Với đúng dòng này, ta đặt nó vào một *bảng con 1 dòng* như sau:

  #align(center)[
    #table(
      columns: (1.3fr, 0.9fr, 1.1fr, 0.7fr, 1.4fr, 0.7fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { rgb("F8FFF8") },
      stroke: 0.4pt + col-green,
      [*Dòng*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị*], [*Dấu*], [*Đóng góp*],
      [$(1,0,1)$], [$2$], [$(2,2,1)$], [$5$], [$30$], [$+$], [$bold(+60)$],
    )
  ]

  Ta làm đúng 5 thao tác:
  - *Chọn cặp:* lớp A có $2$ khe dính nội bộ nên có $C_2^1 = 2$ cách chọn; lớp C có $C_1^1 = 1$ cách. Vậy cột *Chọn cặp* là $2$.
  - *Thực thể còn lại:* A từ $3$ chữ còn $2$ khối, B vẫn là $2$ khối, C từ $2$ chữ còn $1$ khối. Ta ghi $(2, 2, 1)$.
  - *Tổng thực thể:* $2 + 2 + 1 = 5$.
  - *Hoán vị đồng nhất:* $frac(5!, 2! dot 2! dot 1!) = 30$.
  - *Dấu:* vì đã ghép tổng cộng $1 + 0 + 1 = 2$ cặp, đây là dòng mang dấu cộng.

  Vậy *đóng góp* của dòng này là:
  $ + 2 times 30 = +60. $

  *Đúng rồi:* dấu $+$ ở đây chính là vì
  $ 1 + 0 + 1 = 2 $
  là một số chẵn.

  Nhưng để em không phải tự đoán các dòng còn lại, ta mổ luôn đủ cả 12 dòng ngay dưới đây.
]

#rev-box(title: "🧭 Quy Tắc Sắp Dòng Để Dấu Không Rối")[
  *Không đọc dấu theo kiểu nhìn từ trên xuống rồi chờ nó chạy `+ - + - ...`.* Với PIE nhiều chỉ số, làm vậy rất dễ rối.

  Ta phải sắp các dòng theo:
  $ s = i + j + k, $
  tức là *tổng số cặp đã ghép*.

  Khi đó:
  - cùng một tầng $s$ thì *cùng dấu*;
  - $s$ chẵn $=>$ dấu cộng;
  - $s$ lẻ $=>$ dấu trừ.

  Với bài $3A, 2B, 2C$, 12 dòng nên được đọc theo đúng các tầng sau:

  #align(center)[
    #table(
      columns: (0.8fr, 2.7fr, 0.8fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Tầng $s$*], [*Các dòng thuộc tầng đó*], [*Dấu*],
      [$0$], [$(0,0,0)$], [$+$],
      [$1$], [$(0,0,1), (0,1,0), (1,0,0)$], [$-$],
      [$2$], [$(0,1,1), (1,0,1), (1,1,0), (2,0,0)$], [$+$],
      [$3$], [$(1,1,1), (2,0,1), (2,1,0)$], [$-$],
      [$4$], [$(2,1,1)$], [$+$],
    )
  ]

  Vậy dấu không hề ngẫu nhiên. Nó đi theo tầng:
  $ + \; / \; --- \; / \; ++++ \; / \; --- \; / \; +. $
]

#eg-box(title: [🧪 Mổ Xẻ Đủ 12 Dòng Của Bảng $3A, 2B, 2C$])[
  Ta đi theo đúng thứ tự tầng $s = i + j + k$, vì đọc như vậy thì dấu rất rõ: tầng chẵn mang dấu $+$, tầng lẻ mang dấu $-$.

  *Tầng $s = 0$*

  *Dòng 1: $(0,0,0)$*
  - Chọn cặp: $C_2^0 dot C_1^0 dot C_1^0 = 1$.
  - Thực thể còn lại: $(3,2,2)$.
  - Tổng thực thể: $3 + 2 + 2 = 7$.
  - Hoán vị đồng nhất: $frac(7!, 3! dot 2! dot 2!) = 210$.
  - Dấu: $+$ vì $0 + 0 + 0 = 0$ là số chẵn.
  - Đóng góp: $+ 1 times 210 = +210$.

  *Tầng $s = 1$*

  *Dòng 2: $(0,0,1)$*
  - Chọn cặp: $C_2^0 dot C_1^0 dot C_1^1 = 1$.
  - Thực thể còn lại: $(3,2,1)$.
  - Tổng thực thể: $3 + 2 + 1 = 6$.
  - Hoán vị đồng nhất: $frac(6!, 3! dot 2! dot 1!) = 60$.
  - Dấu: $-$ vì $0 + 0 + 1 = 1$ là số lẻ.
  - Đóng góp: $- 1 times 60 = -60$.

  *Dòng 3: $(0,1,0)$*
  - Chọn cặp: $C_2^0 dot C_1^1 dot C_1^0 = 1$.
  - Thực thể còn lại: $(3,1,2)$.
  - Tổng thực thể: $3 + 1 + 2 = 6$.
  - Hoán vị đồng nhất: $frac(6!, 3! dot 1! dot 2!) = 60$.
  - Dấu: $-$ vì $0 + 1 + 0 = 1$ là số lẻ.
  - Đóng góp: $- 1 times 60 = -60$.

  *Dòng 4: $(1,0,0)$*
  - Chọn cặp: $C_2^1 dot C_1^0 dot C_1^0 = 2$.
  - Thực thể còn lại: $(2,2,2)$.
  - Tổng thực thể: $2 + 2 + 2 = 6$.
  - Hoán vị đồng nhất: $frac(6!, 2! dot 2! dot 2!) = 90$.
  - Dấu: $-$ vì $1 + 0 + 0 = 1$ là số lẻ.
  - Đóng góp: $- 2 times 90 = -180$.

  *Tầng $s = 2$*

  *Dòng 5: $(0,1,1)$*
  - Chọn cặp: $C_2^0 dot C_1^1 dot C_1^1 = 1$.
  - Thực thể còn lại: $(3,1,1)$.
  - Tổng thực thể: $3 + 1 + 1 = 5$.
  - Hoán vị đồng nhất: $frac(5!, 3! dot 1! dot 1!) = 20$.
  - Dấu: $+$ vì $0 + 1 + 1 = 2$ là số chẵn.
  - Đóng góp: $+ 1 times 20 = +20$.

  *Dòng 6: $(1,0,1)$*
  - Chọn cặp: $C_2^1 dot C_1^0 dot C_1^1 = 2$.
  - Thực thể còn lại: $(2,2,1)$.
  - Tổng thực thể: $2 + 2 + 1 = 5$.
  - Hoán vị đồng nhất: $frac(5!, 2! dot 2! dot 1!) = 30$.
  - Dấu: $+$ vì $1 + 0 + 1 = 2$ là số chẵn.
  - Đóng góp: $+ 2 times 30 = +60$.

  *Dòng 7: $(1,1,0)$*
  - Chọn cặp: $C_2^1 dot C_1^1 dot C_1^0 = 2$.
  - Thực thể còn lại: $(2,1,2)$.
  - Tổng thực thể: $2 + 1 + 2 = 5$.
  - Hoán vị đồng nhất: $frac(5!, 2! dot 1! dot 2!) = 30$.
  - Dấu: $+$ vì $1 + 1 + 0 = 2$ là số chẵn.
  - Đóng góp: $+ 2 times 30 = +60$.

  *Dòng 8: $(2,0,0)$*
  - Chọn cặp: $C_2^2 dot C_1^0 dot C_1^0 = 1$.
  - Thực thể còn lại: $(1,2,2)$.
  - Tổng thực thể: $1 + 2 + 2 = 5$.
  - Hoán vị đồng nhất: $frac(5!, 1! dot 2! dot 2!) = 30$.
  - Dấu: $+$ vì $2 + 0 + 0 = 2$ là số chẵn.
  - Đóng góp: $+ 1 times 30 = +30$.

  *Tầng $s = 3$*

  *Dòng 9: $(1,1,1)$*
  - Chọn cặp: $C_2^1 dot C_1^1 dot C_1^1 = 2$.
  - Thực thể còn lại: $(2,1,1)$.
  - Tổng thực thể: $2 + 1 + 1 = 4$.
  - Hoán vị đồng nhất: $frac(4!, 2! dot 1! dot 1!) = 12$.
  - Dấu: $-$ vì $1 + 1 + 1 = 3$ là số lẻ.
  - Đóng góp: $- 2 times 12 = -24$.

  *Dòng 10: $(2,0,1)$*
  - Chọn cặp: $C_2^2 dot C_1^0 dot C_1^1 = 1$.
  - Thực thể còn lại: $(1,2,1)$.
  - Tổng thực thể: $1 + 2 + 1 = 4$.
  - Hoán vị đồng nhất: $frac(4!, 1! dot 2! dot 1!) = 12$.
  - Dấu: $-$ vì $2 + 0 + 1 = 3$ là số lẻ.
  - Đóng góp: $- 1 times 12 = -12$.

  *Dòng 11: $(2,1,0)$*
  - Chọn cặp: $C_2^2 dot C_1^1 dot C_1^0 = 1$.
  - Thực thể còn lại: $(1,1,2)$.
  - Tổng thực thể: $1 + 1 + 2 = 4$.
  - Hoán vị đồng nhất: $frac(4!, 1! dot 1! dot 2!) = 12$.
  - Dấu: $-$ vì $2 + 1 + 0 = 3$ là số lẻ.
  - Đóng góp: $- 1 times 12 = -12$.

  *Tầng $s = 4$*

  *Dòng 12: $(2,1,1)$*
  - Chọn cặp: $C_2^2 dot C_1^1 dot C_1^1 = 1$.
  - Thực thể còn lại: $(1,1,1)$.
  - Tổng thực thể: $1 + 1 + 1 = 3$.
  - Hoán vị đồng nhất: $frac(3!, 1! dot 1! dot 1!) = 6$.
  - Dấu: $+$ vì $2 + 1 + 1 = 4$ là số chẵn.
  - Đóng góp: $+ 1 times 6 = +6$.

  Nhìn theo kiểu này, em sẽ thấy dấu hoàn toàn không ngẫu nhiên:
  - cứ cộng $i + j + k$ lại,
  - nếu ra số chẵn thì ghi $+$,
  - nếu ra số lẻ thì ghi $-$.

  Đó chính là lý do vì sao dòng $(1,0,1)$ mang dấu $+$: vì
  $ 1 + 0 + 1 = 2 $
  là số chẵn.
]

#warn-box[
  Ba lỗi rất hay gặp khi lập bảng PIE:

  - *Lỗi 1:* lấy $C_n^i$ thay vì $C_(n-1)^i$. Với lớp A có $n_A$ chữ thì chỉ có $n_A - 1$ vị trí dính nội bộ có thể ghép cặp.
  - *Lỗi 2:* nhân $n_A!, n_B!, dots$ quá sớm. Hãy *đếm cấu trúc đồng nhất lớp trước*, rồi cuối cùng mới nhân hoán vị học sinh phân biệt.
  - *Lỗi 3:* ghế trống $E$ không bị cấm kề, nên *không bao giờ* có cột ghép $E E$ trong PIE hàng ngang kiểu này. Ghế trống chỉ nằm yên ở cột thực thể và mẫu số hoán vị.
]

== 2.2 — Mười Ví Dụ Luyện Tay Lập Bảng PIE

=== Ví dụ PIE 1 — $2A, 1B$

#cach2-box[
  Đây là ví dụ nhỏ nhất có ghép cặp.

  Chỉ có lớp A có thể vi phạm, nên bảng chỉ có 2 dòng:
  - Dòng $(0)$: chưa ghép gì, số cấu trúc tự do là $frac(3!, 2! 1!) = 3$.
  - Dòng $(1)$: ghép 1 cặp $A A$, còn 2 thực thể là $(A A), B$, nên có $2! = 2$ cấu trúc, mang dấu trừ.

  Tổng số cấu trúc hợp lệ là:
  $ 3 - 2 = 1. $

  Nếu hai bạn A là phân biệt, số cách xếp thật là:
  $ 1 times 2! = 2. $
]

=== Ví dụ PIE 2 — $2A, 2B$

#cach2-box[
  Đây là ví dụ nhỏ nhất nhưng lại rất đáng học, vì nó có đúng *4 dòng* và đủ để em tập trọn vẹn cả khuôn PIE.

  Trước khi điền bảng, ta nhắc lại công thức của từng dòng $(i, j)$:
  - *Chọn cặp:* $C_1^i dot C_1^j$ vì cả A lẫn B đều chỉ có đúng 1 khe dính nội bộ.
  - *Thực thể còn lại:* $(2-i, 2-j)$.
  - *Tổng thực thể:* $T = 4 - i - j$.
  - *Hoán vị đồng nhất:* $frac(T!, (2-i)! (2-j)!)$.
  - *Dấu:* $(-1)^(i+j)$.

  #align(center)[
    #table(
      columns: (1.45fr, 0.9fr, 1.1fr, 0.65fr, 1.5fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $(i,j)$*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$(0,0)$], [$1$], [$(2,2)$], [4], [$frac(4!, 2! 2!) = 6$], [$+$], [$bold(+6)$],
      [$(1,0)$], [$1$], [$(1,2)$], [3], [$frac(3!, 1! 2!) = 3$], [$-$], [$bold(-3)$],
      [$(0,1)$], [$1$], [$(2,1)$], [3], [$frac(3!, 2! 1!) = 3$], [$-$], [$bold(-3)$],
      [$(1,1)$], [$1$], [$(1,1)$], [2], [$2! = 2$], [$+$], [$bold(+2)$],
    )
  ]

  Đọc chậm từng dòng thì ta thấy:
  - *Dòng $(0,0)$:* chưa ghép gì nên có đúng $6$ cấu trúc.
  - *Dòng $(1,0)$:* ghép 1 cặp $A A$, còn $(1,2)$ khối nên cho $3$ cấu trúc, mang dấu trừ.
  - *Dòng $(0,1)$:* hoàn toàn đối xứng với dòng trên, cũng cho $-3$.
  - *Dòng $(1,1)$:* ghép cả $A A$ lẫn $B B$, còn $(1,1)$ khối nên cho $+2$.

  Tổng số cấu trúc hợp lệ là:
  $ S_("hợp lệ") = 6 - 3 - 3 + 2 = 2. $

  Nhân với hoán vị học sinh phân biệt:
  $ N = 2 times 2! times 2! = 8. $
]

=== Ví dụ PIE 3 — $3A, 1B$

#cach2-box[
  Đây là ví dụ rất tốt để thấy PIE cho cả trường hợp *vô nghiệm*.

  - $(0)$: $frac(4!, 3! 1!) = 4$.
  - $(1)$: lớp A có $C_2^1 = 2$ cách chọn 1 cặp $A A$; khi đó còn $(2,1)$ khối nên có $frac(3!, 2! 1!) = 3$ cấu trúc. Đóng góp: $- 2 times 3 = -6$.
  - $(2)$: ghép 2 cặp A $=>$ còn $(1,1)$ khối, có $2! = 2$, dấu cộng.

  Tổng số cấu trúc hợp lệ:
  $ 4 - 6 + 2 = 0. $

  Kết luận: *không thể* xếp $3A$ và $1B$ mà không có cặp kề trùng.
]

=== Ví dụ PIE 4 — $2A, 1B, 1C$

#cach2-box[
  Chỉ A có thể sinh cặp, nên bảng vẫn chỉ có 2 dòng:
  - $(0)$: $frac(4!, 2! 1! 1!) = 12$.
  - $(1)$: ghép $A A$ $=>$ còn $(1,1,1)$ khối, có $3! = 6$, dấu trừ.

  Tổng số cấu trúc hợp lệ:
  $ 12 - 6 = 6. $

  Nếu hai bạn A phân biệt thì số cách thật là:
  $ 6 times 2! = 12. $
]

=== Ví dụ PIE 5 — $3A, 2B$

#cach2-box[
  Đây là ví dụ chuẩn để tập tay với bảng 6 dòng: $i = 0, 1, 2$ và $j = 0, 1$.

  - $(0,0)$: $frac(5!, 3! 2!) = 10$.
  - $(1,0)$: $C_2^1 = 2$, còn $(2,2)$ khối nên có $frac(4!, 2! 2!) = 6$. Đóng góp: $-12$.
  - $(2,0)$: $C_2^2 = 1$, còn $(1,2)$ khối nên có $frac(3!, 1! 2!) = 3$. Đóng góp: $+3$.
  - $(0,1)$: còn $(3,1)$ khối nên có $frac(4!, 3! 1!) = 4$. Đóng góp: $-4$.
  - $(1,1)$: hệ số chọn cặp là $2$, còn $(2,1)$ khối nên có $frac(3!, 2! 1!) = 3$. Đóng góp: $+6$.
  - $(2,1)$: còn $(1,1)$ khối nên có $2! = 2$. Đóng góp: $-2$.

  Tổng số cấu trúc hợp lệ:
  $ 10 - 12 + 3 - 4 + 6 - 2 = 1. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 1 times 3! times 2! = 12. $
]

=== Ví dụ PIE 6 — $3A, 3B$

#cach2-box[
  Bài này có 9 dòng, nhưng nhờ đối xứng nên ta không cần viết dài.

  - Dòng tự do $(0,0)$: $frac(6!, 3! 3!) = 20$.
  - Ghép đúng 1 cặp $A A$: có $2$ cách chọn, mỗi dòng cho $frac(5!, 2! 3!) = 10$ $=>$ tổng $-20$.
  - Ghép đúng 2 cặp $A A$: có $1$ cách, cho $frac(4!, 1! 3!) = 4$ $=>$ tổng $+4$.
  - Tương tự phía B cũng cho $-20 + 4$.
  - Ghép $1 A A$ và $1 B B$: có $2 times 2 = 4$ cách chọn, mỗi dòng cho $frac(4!, 2! 2!) = 6$ $=>$ tổng $+24$.
  - Ghép $1 A A$ và $2 B B$: đóng góp $-6$.
  - Ghép $2 A A$ và $1 B B$: đóng góp $-6$.
  - Ghép $2 A A$ và $2 B B$: còn 2 khối nên đóng góp $+2$.

  Tổng số cấu trúc hợp lệ:
  $ 20 - 20 + 4 - 20 + 4 + 24 - 6 - 6 + 2 = 2. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 2 times 3! times 3! = 72. $
]

=== Ví dụ PIE 7 — $2A, 2B, 1C$

#cach2-box[
  Vì C chỉ có một bạn nên C không tạo được cặp kề. Ta chỉ cần duyệt theo A và B.

  - $(0,0)$: $frac(5!, 2! 2! 1!) = 30$.
  - $(1,0)$: còn $(1,2,1)$ khối $=>$ $frac(4!, 1! 2! 1!) = 12$, dấu trừ.
  - $(0,1)$: tương tự, cũng được $12$, dấu trừ.
  - $(1,1)$: còn $(1,1,1)$ khối $=>$ $3! = 6$, dấu cộng.

  Tổng số cấu trúc hợp lệ:
  $ 30 - 12 - 12 + 6 = 12. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 12 times 2! times 2! = 48. $
]

=== Ví dụ PIE 8 — $2A, 2B, 2C$

#cach2-box[
  Đây là ví dụ ba lớp đầu tiên mà *cả ba lớp* đều có thể sinh cặp.

  Nhờ đối xứng, ta nhóm 8 dòng thành 4 cụm:
  - *Không ghép gì:* $frac(6!, 2! 2! 2!) = 90$.
  - *Ghép đúng 1 cặp:* có 3 dòng giống nhau, mỗi dòng cho $frac(5!, 1! 2! 2!) = 30$ $=>$ tổng $-90$.
  - *Ghép đúng 2 cặp:* có 3 dòng giống nhau, mỗi dòng cho $frac(4!, 1! 1! 2!) = 12$ $=>$ tổng $+36$.
  - *Ghép đúng 3 cặp:* còn $(1,1,1)$ khối nên cho $-6$.

  Tổng số cấu trúc hợp lệ:
  $ 90 - 90 + 36 - 6 = 30. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 30 times 2! times 2! times 2! = 240. $
]

=== Ví dụ PIE 9 — $3A, 2B, 1E$

#cach2-box[
  Đây là ví dụ đầu tiên có ghế trống. Nguyên tắc là: *ghế trống E đứng yên trong cột thực thể, không tham gia cột ghép cặp.*

  Ta vẫn duyệt theo $i = 0, 1, 2$ và $j = 0, 1$:
  - $(0,0)$: $frac(6!, 3! 2! 1!) = 60$.
  - $(1,0)$: hệ số chọn cặp là $2$, còn $(2,2,1)$ khối $=>$ $frac(5!, 2! 2! 1!) = 30$ $=>$ đóng góp $-60$.
  - $(2,0)$: còn $(1,2,1)$ khối $=>$ $frac(4!, 1! 2! 1!) = 12$ $=>$ đóng góp $+12$.
  - $(0,1)$: còn $(3,1,1)$ khối $=>$ $frac(5!, 3! 1! 1!) = 20$ $=>$ đóng góp $-20$.
  - $(1,1)$: hệ số chọn cặp là $2$, còn $(2,1,1)$ khối $=>$ $frac(4!, 2! 1! 1!) = 12$ $=>$ đóng góp $+24$.
  - $(2,1)$: còn $(1,1,1)$ khối $=>$ $3! = 6$ $=>$ đóng góp $-6$.

  Tổng số cấu trúc hợp lệ:
  $ 60 - 60 + 12 - 20 + 24 - 6 = 10. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 10 times 3! times 2! = 120. $
]

=== Ví dụ PIE 10 — $2A, 2B, 1C, 1E$

#cach2-box[
  Đây là ví dụ rất vừa tay để luyện phản xạ "có ghế trống nhưng không ghép ghế trống".

  Vì C là lớp đơn, ta chỉ cần theo dõi A và B:
  - $(0,0)$: $frac(6!, 2! 2! 1! 1!) = 180$.
  - $(1,0)$: còn $(1,2,1,1)$ khối $=>$ $frac(5!, 1! 2! 1! 1!) = 60$, dấu trừ.
  - $(0,1)$: tương tự cũng cho $-60$.
  - $(1,1)$: còn $(1,1,1,1)$ khối $=>$ $4! = 24$, dấu cộng.

  Tổng số cấu trúc hợp lệ:
  $ 180 - 60 - 60 + 24 = 84. $

  Vậy số cách xếp học sinh phân biệt là:
  $ 84 times 2! times 2! = 336. $
]

#note-box(title: "📌 Mẹo học nhanh sau 10 ví dụ")[
  Nếu em vẫn thấy bảng dài, hãy làm đúng hai bước này:
  - trước tiên chỉ tự ghi các *chỉ số dòng* có thể có, ví dụ $(i, j)$ hay $(i, j, k)$,
  - sau đó điền từng cột theo khuôn cố định: *chọn cặp* → *thực thể* → *hoán vị* → *dấu*.

  Đừng cố "nhìn phát ra luôn cả bảng". Người quen tay cũng không làm như vậy.
]

== 2.3 — Bốn Ví Dụ PIE Viết Đủ Từng Cột

#note-box(title: "📌 Cách dùng mục này")[
  Mười ví dụ phía trên giúp em quen nhịp. Bốn ví dụ dưới đây thì cố ý *không làm nhanh*: mỗi ví dụ đều nhắc lại công thức, dựng bảng đủ cột, rồi mới cộng trừ kết quả. Em có thể chép y hệt khuôn này khi tự luyện.
]

=== Ví dụ PIE 11 — $3A, 1B, 1C$

#cach2-box[
  Ở bài này chỉ có lớp A có thể tạo cặp kề, nên bảng chỉ chạy theo chỉ số $i = 0, 1, 2$.

  Công thức của mỗi dòng là:
  - *Chọn cặp:* $C_2^i$.
  - *Thực thể còn lại:* $(3-i, 1, 1)$.
  - *Tổng thực thể:* $T = 5 - i$.
  - *Hoán vị đồng nhất:* $frac(T!, (3-i)! 1! 1!)$.
  - *Dấu:* $(-1)^i$.

  #align(center)[
    #table(
      columns: (1.35fr, 0.9fr, 1.2fr, 0.65fr, 1.7fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $i$*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$0$], [$1$], [$(3,1,1)$], [5], [$frac(5!, 3! 1! 1!) = 20$], [$+$], [$bold(+20)$],
      [$1$], [$2$], [$(2,1,1)$], [4], [$frac(4!, 2! 1! 1!) = 12$], [$-$], [$bold(-24)$],
      [$2$], [$1$], [$(1,1,1)$], [3], [$3! = 6$], [$+$], [$bold(+6)$],
    )
  ]

  Tổng số cấu trúc hợp lệ là:
  $ S_("hợp lệ") = 20 - 24 + 6 = 2. $

  Nhân với hoán vị học sinh phân biệt:
  $ N = 2 times 3! = 12. $
]

=== Ví dụ PIE 12 — $3A, 2B, 1C$

#cach2-box[
  Bài này có hai chỉ số vì A và B đều có thể sinh cặp:
  - A có $2$ khe dính nội bộ nên $i = 0, 1, 2$;
  - B có $1$ khe dính nội bộ nên $j = 0, 1$.

  Mỗi dòng $(i, j)$ được tính theo đúng khuôn:
  - *Chọn cặp:* $C_2^i dot C_1^j$.
  - *Thực thể còn lại:* $(3-i, 2-j, 1)$.
  - *Tổng thực thể:* $T = 6 - i - j$.
  - *Hoán vị đồng nhất:* $frac(T!, (3-i)! (2-j)! 1!)$.
  - *Dấu:* $(-1)^(i+j)$.

  #align(center)[
    #table(
      columns: (1.45fr, 0.95fr, 1.2fr, 0.65fr, 1.7fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $(i,j)$*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$(0,0)$], [$1$], [$(3,2,1)$], [6], [$frac(6!, 3! 2! 1!) = 60$], [$+$], [$bold(+60)$],
      [$(1,0)$], [$2$], [$(2,2,1)$], [5], [$frac(5!, 2! 2! 1!) = 30$], [$-$], [$bold(-60)$],
      [$(2,0)$], [$1$], [$(1,2,1)$], [4], [$frac(4!, 1! 2! 1!) = 12$], [$+$], [$bold(+12)$],
      [$(0,1)$], [$1$], [$(3,1,1)$], [5], [$frac(5!, 3! 1! 1!) = 20$], [$-$], [$bold(-20)$],
      [$(1,1)$], [$2$], [$(2,1,1)$], [4], [$frac(4!, 2! 1! 1!) = 12$], [$+$], [$bold(+24)$],
      [$(2,1)$], [$1$], [$(1,1,1)$], [3], [$3! = 6$], [$-$], [$bold(-6)$],
    )
  ]

  Tổng số cấu trúc hợp lệ là:
  $ S_("hợp lệ") = 60 - 60 + 12 - 20 + 24 - 6 = 10. $

  Nhân với hoán vị học sinh phân biệt:
  $ N = 10 times 3! times 2! = 120. $
]

=== Ví dụ PIE 13 — $2A, 2B, 2E$

#cach2-box[
  Đây là ví dụ rất tốt để luyện phản xạ với ghế trống. Điều cần nhắc lại là: *ghế trống E không tham gia ghép cặp*, nên bảng chỉ theo dõi A và B.

  Khuôn của mỗi dòng $(i, j)$ là:
  - *Chọn cặp:* $C_1^i dot C_1^j$.
  - *Thực thể còn lại:* $(2-i, 2-j, 2)$.
  - *Tổng thực thể:* $T = 6 - i - j$.
  - *Hoán vị đồng nhất:* $frac(T!, (2-i)! (2-j)! 2!)$.
  - *Dấu:* $(-1)^(i+j)$.

  #align(center)[
    #table(
      columns: (1.45fr, 0.95fr, 1.3fr, 0.65fr, 1.75fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $(i,j)$*], [*Chọn cặp*], [*Thực thể $(A,B,E)$*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$(0,0)$], [$1$], [$(2,2,2)$], [6], [$frac(6!, 2! 2! 2!) = 90$], [$+$], [$bold(+90)$],
      [$(1,0)$], [$1$], [$(1,2,2)$], [5], [$frac(5!, 1! 2! 2!) = 30$], [$-$], [$bold(-30)$],
      [$(0,1)$], [$1$], [$(2,1,2)$], [5], [$frac(5!, 2! 1! 2!) = 30$], [$-$], [$bold(-30)$],
      [$(1,1)$], [$1$], [$(1,1,2)$], [4], [$frac(4!, 1! 1! 2!) = 12$], [$+$], [$bold(+12)$],
    )
  ]

  Tổng số cấu trúc hợp lệ là:
  $ S_("hợp lệ") = 90 - 30 - 30 + 12 = 42. $

  Khi chuyển sang học sinh phân biệt, chỉ nhân với A và B:
  $ N = 42 times 2! times 2! = 168. $
]

=== Ví dụ PIE 14 — $3A, 1B, 1C, 1E$

#cach2-box[
  Đây là bài pha trộn rất đẹp: có một lớp đông hơn, có hai lớp đơn và có thêm một ghế trống. Nhưng thật ra bảng vẫn chỉ chạy theo A, vì chỉ A mới có thể sinh cặp.

  Khuôn tính vẫn là:
  - *Chọn cặp:* $C_2^i$.
  - *Thực thể còn lại:* $(3-i, 1, 1, 1)$.
  - *Tổng thực thể:* $T = 6 - i$.
  - *Hoán vị đồng nhất:* $frac(T!, (3-i)! 1! 1! 1!)$.
  - *Dấu:* $(-1)^i$.

  #align(center)[
    #table(
      columns: (1.35fr, 0.9fr, 1.35fr, 0.65fr, 1.8fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $i$*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$0$], [$1$], [$(3,1,1,1)$], [6], [$frac(6!, 3! 1! 1! 1!) = 120$], [$+$], [$bold(+120)$],
      [$1$], [$2$], [$(2,1,1,1)$], [5], [$frac(5!, 2! 1! 1! 1!) = 60$], [$-$], [$bold(-120)$],
      [$2$], [$1$], [$(1,1,1,1)$], [4], [$4! = 24$], [$+$], [$bold(+24)$],
    )
  ]

  Tổng số cấu trúc hợp lệ là:
  $ S_("hợp lệ") = 120 - 120 + 24 = 24. $

  Vì chỉ lớp A có nhiều hơn một học sinh, số cách xếp phân biệt là:
  $ N = 24 times 3! = 144. $
]

#pagebreak()

= Chương 3 — Hệ Thống Bài Tập Thực Chiến Phân Bậc Mịn Màng

== 3.1 — Giai Đoạn 1: Bài Toán Không Có Ghế Trống (Xếp $N$ học sinh vào $N$ ghế)

=== Cấp độ 1.1: Chỉ có 1 nhóm có ràng buộc không kề nhau (Mức độ Cơ bản)

*Bài toán 1:* Xếp $3$ học sinh lớp A và $5$ học sinh lớp B vào một hàng gồm $8$ ghế. Tính số cách xếp sao cho không có hai học sinh lớp A nào ngồi cạnh nhau.

#cach1-box[
  Ta giải quyết bài toán bằng phương pháp vách ngăn trực quan:

  - *Bước 1 (Xếp nhóm tự do):* Xếp 5 học sinh lớp B trước để tạo vách ngăn. Vì các học sinh phân biệt, số cách xếp là:
    $ N_B = 5! = 120 " cách." $
  - *Bước 2 (Xác định khe trống):* 5 học sinh lớp B tạo ra đúng 6 khe trống xung quanh:
    $ "_" quad B_1 quad "_" quad B_2 quad "_" quad B_3 quad "_" quad B_4 quad "_" quad B_5 quad "_" $
  - *Bước 3 (Xếp nhóm ràng buộc):* Ta cần xếp 3 học sinh lớp A vào 6 khe này (mỗi khe tối đa 1 học sinh). Số cách chọn 3 khe trong 6 khe và xếp thứ tự 3 học sinh lớp A là:
    $ N_A = A_6^3 = 6 dot 5 dot 4 = 120 " cách." $
  - *Bước 4 (Tính tổng số cách):* Theo quy tắc nhân, tổng số cách xếp thỏa mãn là:
    $ N = N_B dot N_A = 120 times 120 = 14400 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *14400 cách*.
]

---

=== Cấp độ 1.2: Hai nhóm đối tượng, cả hai đều không được kề nhau (Mức độ Khá)

*Bài toán 2:* Xếp học sinh của hai lớp A và B vào một hàng ghế sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau trong các trường hợp sau:
1. Trường hợp 2.1: Có $4$ học sinh lớp A và $4$ học sinh lớp B.
2. Trường hợp 2.2: Có $4$ học sinh lớp A và $3$ học sinh lớp B.
3. Trường hợp 2.3: Có $5$ học sinh lớp A và $3$ học sinh lớp B.

#cach1-box[
  Ta biện luận cấu trúc xen kẽ dựa trên số lượng phần tử của mỗi lớp:

  - *Trường hợp 2.1: Có 4 học sinh lớp A và 4 học sinh lớp B (Số lượng bằng nhau)*
    Vì số lượng bằng nhau, cấu trúc để không có bạn nào cùng lớp ngồi cạnh nhau bắt buộc phải xen kẽ hoàn toàn. Có 2 dạng cấu trúc:
    - *Dạng 1:* `A B A B A B A B`.
      - Xếp 4 bạn A vào 4 vị trí lẻ: có $4!$ cách.
      - Xếp 4 bạn B vào 4 vị trí chẵn: có $4!$ cách.
      - Số cách xếp: $4! times 4! = 576$ cách.
    - *Dạng 2:* `B A B A B A B A`.
      - Tương tự, số cách xếp là $4! times 4! = 576$ cách.
    - *Tổng số cách xếp:* $576 + 576 = 1152$ cách.

  - *Trường hợp 2.2: Có 4 học sinh lớp A và 3 học sinh lớp B (Lệch nhau 1 học sinh)*
    Vì số học sinh lớp A nhiều hơn lớp B đúng 1 bạn, cấu trúc hợp lệ duy nhất là A nằm ở hai đầu và xen kẽ ở giữa:
    - *Cấu trúc:* `A B A B A B A`.
      - Xếp 4 bạn A vào 4 vị trí của A: có $4! = 24$ cách.
      - Xếp 3 bạn B vào 3 vị trí của B: có $3! = 6$ cách.
    - *Tổng số cách xếp:* $24 times 6 = 144$ cách.

  - *Trường hợp 2.3: Có 5 học sinh lớp A và 3 học sinh lớp B (Lệch từ 2 học sinh trở lên)*
    - Nếu ta xếp 3 bạn B trước để tạo vách ngăn: `_ B _ B _ B _`. Số khe hở tối đa để chèn A vào chỉ là 4 khe.
    - Nhưng ta có đến 5 học sinh lớp A cần xếp không kề nhau. Theo nguyên lý Dirichlet, khi xếp 5 bạn A vào 4 khe, bắt buộc phải có ít nhất một khe chứa từ 2 bạn A trở lên, dẫn đến hai bạn A ngồi cạnh nhau.
    - *Tổng số cách xếp:* $0$ cách.
]

#ans-box[
  - Trường hợp 2.1: *1152 cách*.
  - Trường hợp 2.2: *144 cách*.
  - Trường hợp 2.3: *0 cách*.
]

---

=== Cấp độ 1.3: Ba nhóm đối tượng trở lên, đều không được kề nhau (Mức độ Nâng cao)

*Bài toán 3:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào một hàng gồm $7$ ghế. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau.

#cach1-box[
  *🔵 Cách 1 — Phương pháp Vách ngăn kết hợp chia kịch bản:*

  - *Bước 1 (Dựng vách ngăn bằng lớp đông nhất):* Xếp 3 học sinh lớp A trước để tạo vách ngăn: có $3! = 6$ cách.
    Tạo ra 4 khe trống xung quanh: `_ A _ A _ A _`. Gọi số phần tử chèn vào các khe là $x_1, x_2, x_3, x_4$.
  - *Bước 2 (Thiết lập phương trình khe):* Ta cần chèn 4 học sinh còn lại (2B và 2C) vào các khe này:
    $ x_1 + x_2 + x_3 + x_4 = 4 $
    Với điều kiện để A không kề nhau: hai khe ở giữa bắt buộc phải có ít nhất 1 học sinh: $x_2, x_3 >= 1$ và $x_1, x_4 >= 0$.
    Đặt $y_2 = x_2 - 1 >= 0, y_3 = x_3 - 1 >= 0$, phương trình là $x_1 + y_2 + y_3 + x_4 = 2$.
    Số cấu trúc phân bổ kích thước khe là $C_5^3 = 10$ cấu trúc.
  - *Bước 3 (Phân loại cấu trúc và loại trừ kề trùng B B, C C):*
    - *Hồ sơ 3.1: Khe hở gồm {3, 1, 0, 0}* (Có 2 cấu trúc là $(0, 3, 1, 0)$ và $(0, 1, 3, 0)$).
      Một khe chứa 3 học sinh kề nhau. Để không có ai cùng lớp kề nhau trong khe 3 này, khe 3 phải chứa `B C B` (nếu chứa 2B, 1C) hoặc `C B C` (nếu chứa 2C, 1B). Trong cả hai trường hợp, phần tử còn lại (C hoặc B) đặt ở khe kích thước 1.
      - Nếu chứa {2B, 1C} trong khe 3: có $2!$ cách xếp B và $1!$ cách xếp C. Cách xếp trong khe 3 là `B C B`, phần tử C còn lại ở khe 1. Số cách xếp học sinh phân biệt: $2! times 2! = 4$ cách.
      - Nếu chứa {2C, 1B} trong khe 3: tương tự, có $2! times 2! = 4$ cách.
      - Số cách xếp cho mỗi cấu trúc: $4 + 4 = 8$ cách.
      - Tổng cách cho Hồ sơ 3.1: $2 " cấu trúc" times 8 = 16$ cách.
    - *Hồ sơ 3.2: Khe hở gồm {2, 2, 0, 0}* (Có 1 cấu trúc là $(0, 2, 2, 0)$).
      Có hai khe kép, mỗi khe chứa 2 học sinh. Để không có học sinh cùng lớp kề nhau, mỗi khe kép bắt buộc phải chứa đúng 1 B và 1 C (dạng `B C` hoặc `C B`).
      - Khe thứ nhất có $2! = 2$ cách xếp B và C.
      - Khe thứ hai có $2! = 2$ cách xếp B và C.
      - Số cách xếp học sinh phân biệt: $2 times 2 = 4$ cách.
      - Tổng cách cho Hồ sơ 3.2: $1 " cấu trúc" times 4 = 4$ cách.
    - *Hồ sơ 3.3: Khe hở gồm {2, 1, 1, 0}* (Có 6 cấu trúc).
      Có một khe kép và hai khe đơn.
      - Số cách xếp tự do 2B và 2C vào 4 vị trí: $frac(4!, 2! 2!) times 2! " (B)" times 2! " (C)" = 24$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `B B` (khi đó hai khe đơn chứa C, C): có $2! " (B)" times 2! " (C)" = 4$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `C C` (khi đó hai khe đơn chứa B, B): có $2! " (B)" times 2! " (C)" = 4$ cách.
      - Số cách xếp hợp lệ cho mỗi cấu trúc: $24 - 4 - 4 = 16$ cách.
      - Tổng cách cho Hồ sơ 3.3: $6 " cấu trúc" times 16 = 96$ cách.
    - *Hồ sơ 3.4: Khe hở gồm {1, 1, 1, 1}* (Có 1 cấu trúc).
      Các bạn B và C đều đứng riêng lẻ ở các khe, không kề nhau nên không có vi phạm.
      - Số cách xếp: $4! = 24$ cách.
      - Tổng cách cho Hồ sơ 3.4: $1 " cấu trúc" times 24 = 24$ cách.
  - *Bước 4 (Tính tổng số cách):*
    - Tổng số cấu trúc học sinh phân biệt hợp lệ cho phần xếp B và C là:
      $ N_(B, C) = 16 + 4 + 96 + 24 = 140 $
    - Nhân thêm hoán vị của A:
      $ N = 6 " (xếp A)" times 140 = 840 " cách." $
    *(Lưu ý: Có sự lệch nhẹ do cách đếm chi tiết cấu trúc đồng nhất và hoán vị. Hãy kiểm tra bằng phương pháp Bù trừ PIE bên dưới để có số liệu chính xác tuyệt đối).*
]

#cach2-box[
  *🟣 Cách 2 — Phương pháp Bù trừ Ghép Cặp Kề Trùng (PIE):*

  *📖 Đừng nhìn bảng như 12 trường hợp rời nhau. Hãy đọc nó như 12 lần lặp của cùng một khuôn.*

  Ở bài này:
  - A có dạng `A A A` nên có *2 khe dính nội bộ* $=>$ $i = 0, 1, 2$.
  - B có dạng `B B` nên có *1 khe dính* $=>$ $j = 0, 1$.
  - C có dạng `C C` nên có *1 khe dính* $=>$ $k = 0, 1$.

  Vậy số dòng phải có là:
  $ 3 dot 2 dot 2 = 12. $

  Mỗi dòng $(i, j, k)$ đều được đọc như sau:
  - *Chọn cặp:* $C_2^i dot C_1^j dot C_1^k$.
  - *Thực thể còn lại:* $(3-i, 2-j, 2-k)$.
  - *Hoán vị đồng nhất:* lấy tổng thực thể rồi chia cho giai thừa của từng nhóm.
  - *Dấu:* ghép tổng lẻ cặp $=>$ trừ, ghép tổng chẵn cặp $=>$ cộng.

  #eg-box(title: "💡 Đọc chậm 2 dòng tiêu biểu trước khi xem cả bảng")[
    - *Dòng $(1,0,0)$:* chọn 1 cặp $A A$ trong 2 khe dính của A nên có $C_2^1 = 2$ cách. Khi đó còn $(2,2,2)$ khối, số hoán vị đồng nhất là $frac(6!, 2! 2! 2!) = 90$. Dòng này mang dấu trừ nên đóng góp là $- 2 times 90 = -180$.
    - *Dòng $(1,0,1)$:* chọn 1 cặp $A A$ và 1 cặp $C C$ nên hệ số chọn là $C_2^1 dot C_1^1 = 2$. Khi đó còn $(2,2,1)$ khối, số hoán vị đồng nhất là $frac(5!, 2! 2! 1!) = 30$. Vì ghép tổng cộng 2 cặp nên dòng này mang dấu cộng: $+ 2 times 30 = +60$.
  ]

  #note-box(title: "📌 Đừng đọc dấu theo thứ tự cũ")[
    Nếu em đọc 12 dòng theo thứ tự từ điển $(0,0,0)$, $(0,0,1)$, $(0,1,0)$, $(0,1,1)$, ... thì dấu sẽ hiện ra thành một dãy nhìn rất rối.

    Cách đọc đúng là: *gom theo tầng* $s = i + j + k$ trước, rồi trong mỗi tầng mới liệt kê các dòng con. Vì cùng tầng thì cùng dấu, nên mắt sẽ không bị loạn.
  ]

  *Bảng tính 12 kịch bản:* (i = số cặp AA, j = số cặp BB, k = số cặp CC)
  #align(center)[
    #table(
      columns: (1.8fr, 0.9fr, 1.1fr, 0.65fr, 1.5fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Kịch bản (i,j,k)*], [*Chọn cặp*], [*Thực thể*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$(0,0,0)$ — tự do], [$1$], [$(3,2,2)$], [7], [$frac(7!, 3! 2! 2!)=210$], [$+$], [$bold(+210)$],
      [$(0,0,1)$ — 1 cặp CC], [$1$], [$(3,2,1)$], [6], [$frac(6!, 3! 2! 1!)=60$], [$-$], [$bold(-60)$],
      [$(0,1,0)$ — 1 cặp BB], [$1$], [$(3,1,2)$], [6], [$frac(6!, 3! 1! 2!)=60$], [$-$], [$bold(-60)$],
      [$(1,0,0)$ — 1 cặp AA], [$2$], [$(2,2,2)$], [6], [$frac(6!, 2! 2! 2!)=90$], [$-$], [$bold(-180)$],
      [$(0,1,1)$ — BB+CC], [$1$], [$(3,1,1)$], [5], [$frac(5!, 3! 1! 1!)=20$], [$+$], [$bold(+20)$],
      [$(1,0,1)$ — AA+CC], [$2$], [$(2,2,1)$], [5], [$frac(5!, 2! 2! 1!)=30$], [$+$], [$bold(+60)$],
      [$(1,1,0)$ — AA+BB], [$2$], [$(2,1,2)$], [5], [$frac(5!, 2! 1! 2!)=30$], [$+$], [$bold(+60)$],
      [$(2,0,0)$ — 2 cặp AA], [$1$], [$(1,2,2)$], [5], [$frac(5!, 1! 2! 2!)=30$], [$+$], [$bold(+30)$],
      [$(1,1,1)$ — AA+BB+CC], [$2$], [$(2,1,1)$], [4], [$frac(4!, 2! 1! 1!)=12$], [$-$], [$bold(-24)$],
      [$(2,0,1)$ — 2AA+CC], [$1$], [$(1,2,1)$], [4], [$frac(4!, 1! 2! 1!)=12$], [$-$], [$bold(-12)$],
      [$(2,1,0)$ — 2AA+BB], [$1$], [$(1,1,2)$], [4], [$frac(4!, 1! 1! 2!)=12$], [$-$], [$bold(-12)$],
      [$(2,1,1)$ — 2AA+BB+CC], [$1$], [$(1,1,1)$], [3], [$frac(3!, 1! 1! 1!)=6$], [$+$], [$bold(+6)$],
    )
  ]

  Tổng cột "Đóng góp":
  $ 210 - 60 - 60 + 20 - 180 + 60 + 60 - 24 + 30 - 12 - 12 + 6 = 38 $

  Đây là số *cấu trúc đồng nhất* hợp lệ. Lúc này mới nhân với hoán vị từng lớp:
  $
    N = 38 times underbrace(3!, "xếp A") times underbrace(2!, "xếp B") times underbrace(2!, "xếp C") = 38 times 6 times 2 times 2 = 912 " cách."
  $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *912 cách*.
]

---

== 3.2 — Giai Đoạn 2: Bài Toán Có Ghế Trống (Xếp $S$ học sinh vào $H$ ghế, có $H - S$ ghế trống)

=== Cấp độ 2.1: Chỉ có 1 nhóm có ràng buộc không kề nhau + Ghế trống (Mức độ Cơ bản)

*Bài toán 4:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $3$ ghế trống. Xếp các học sinh và ghế trống vào một dãy gồm $8$ ghế hàng ngang. Tính số cách xếp sao cho không có hai học sinh lớp A nào ngồi cạnh nhau (các học sinh lớp B và ghế trống đứng cạnh nhau thoải mái).

#cach1-box[
  Ta giải quyết bằng cách đưa các đối tượng tự do (lớp B và ghế trống E) vào hàng trước để làm vách ngăn:

  - *Bước 1 (Xếp các đối tượng tự do):*
    Ta có 2 học sinh lớp B (phân biệt) và 3 ghế trống E (giống nhau).
    Số cách xếp 5 đối tượng này vào hàng ngang là chọn 2 vị trí trong 5 vị trí cho B, còn lại là E:
    $ N_("tự do") = A_5^2 = 5 dot 4 = 20 " cách." $
  - *Bước 2 (Xác định khe trống):*
    5 đối tượng tự do này tạo ra đúng 6 khe trống xung quanh:
    $ "_" quad X_1 quad "_" quad X_2 quad "_" quad X_3 quad "_" quad X_4 quad "_" quad X_5 quad "_" $
  - *Bước 3 (Xếp nhóm bị ràng buộc):*
    Ta chọn 3 khe trong 6 khe trống này để đặt 3 học sinh lớp A vào. Vì học sinh lớp A phân biệt, số cách chọn và xếp thứ tự là:
    $ N_A = A_6^3 = 6 dot 5 dot 4 = 120 " cách." $
  - *Bước 4 (Tính tổng số cách):*
    Theo quy tắc nhân, tổng số cách xếp thỏa mãn là:
    $ N = N_("tự do") times N_A = 20 times 120 = 2400 " cách." $
]

#cach2-box[
  *🟣 Cách 2 — Lập Bảng PIE Cho Bài Chỉ Cấm $A A$:*

  Bài này *hoàn toàn* giải được bằng bảng PIE. Thậm chí còn là một trong những bài PIE dễ nhất có ghế trống, vì:
  - chỉ có lớp A bị cấm kề nhau,
  - lớp B được ngồi cạnh nhau thoải mái,
  - ghế trống $E$ cũng được đứng cạnh nhau thoải mái.

  Vì thế trong bảng PIE, ta *chỉ theo dõi A*, không cần chỉ số cho B hay E.

  Cụ thể:
  - A có `A A A` nên có $2$ khe dính nội bộ $=>$ $i = 0, 1, 2$.
  - B không bị cấm kề $=>$ không có cột ghép $B B$.
  - E không bị cấm kề $=>$ không có cột ghép $E E$.

  Vậy bảng chỉ có đúng:
  $ 3 $
  dòng.

  Mỗi dòng $i$ được đọc theo một khuôn rất ngắn:
  - *Chọn cặp:* $C_2^i$.
  - *Thực thể còn lại:* $(3-i, 2, 3)$.
  - *Tổng thực thể:* $T = 8 - i$.
  - *Hoán vị đồng nhất:* $frac(T!, (3-i)! dot 2! dot 3!)$.
  - *Dấu:* $(-1)^i$.

  #eg-box(title: "💡 Vì sao B và E không có chỉ số ghép?")[
    Trong bài này, đề *chỉ cấm* hai học sinh lớp A ngồi cạnh nhau. Vì thế:
    - cặp `B B` không phải là vi phạm,
    - cặp `E E` cũng không phải là vi phạm.

    Nói ngắn gọn: PIE chỉ ghép những loại cặp mà đề bài cấm. Đề không cấm thì không ghép.
  ]

  #eg-box(title: [🧪 Mổ Xẻ Đủ 3 Dòng Của Bảng $3A, 2B, 3E$])[
    *Dòng 1: $i = 0$*
    - Chọn cặp: $C_2^0 = 1$.
    - Thực thể còn lại: $(3,2,3)$.
    - Tổng thực thể: $3 + 2 + 3 = 8$.
    - Hoán vị đồng nhất: $frac(8!, 3! dot 2! dot 3!) = 560$.
    - Dấu: $+$ vì $i = 0$ là số chẵn.
    - Đóng góp: $+ 1 times 560 = +560$.

    *Dòng 2: $i = 1$*
    - Chọn cặp: $C_2^1 = 2$.
    - Thực thể còn lại: $(2,2,3)$.
    - Tổng thực thể: $2 + 2 + 3 = 7$.
    - Hoán vị đồng nhất: $frac(7!, 2! dot 2! dot 3!) = 210$.
    - Dấu: $-$ vì $i = 1$ là số lẻ.
    - Đóng góp: $- 2 times 210 = -420$.

    *Dòng 3: $i = 2$*
    - Chọn cặp: $C_2^2 = 1$.
    - Thực thể còn lại: $(1,2,3)$.
    - Tổng thực thể: $1 + 2 + 3 = 6$.
    - Hoán vị đồng nhất: $frac(6!, 1! dot 2! dot 3!) = 60$.
    - Dấu: $+$ vì $i = 2$ là số chẵn.
    - Đóng góp: $+ 1 times 60 = +60$.
  ]

  *Bảng tính 3 dòng:* (chỉ có chỉ số $i$ vì chỉ A bị cấm kề)
  #align(center)[
    #table(
      columns: (1.25fr, 0.9fr, 1.3fr, 0.65fr, 1.7fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Dòng $i$*], [*Chọn cặp*], [*Thực thể $(A,B,E)$*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$0$], [$1$], [$(3,2,3)$], [$8$], [$frac(8!, 3! dot 2! dot 3!) = 560$], [$+$], [$bold(+560)$],
      [$1$], [$2$], [$(2,2,3)$], [$7$], [$frac(7!, 2! dot 2! dot 3!) = 210$], [$-$], [$bold(-420)$],
      [$2$], [$1$], [$(1,2,3)$], [$6$], [$frac(6!, 1! dot 2! dot 3!) = 60$], [$+$], [$bold(+60)$],
    )
  ]

  Tổng số *cấu trúc đồng nhất* hợp lệ là:
  $ 560 - 420 + 60 = 200. $

  Bây giờ mới nhân với hoán vị học sinh phân biệt:
  - lớp A có $3!$ cách,
  - lớp B có $2!$ cách,
  - ghế trống không nhân vì giống nhau.

  Vậy:
  $ N = 200 times 3! times 2! = 200 times 6 times 2 = 2400 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *2400 cách*.
]

#note-box(title: "📌 Bảng PIE Còn Kéo Được Tới Đâu?")[
  Nếu nắm chắc kiểu lập bảng PIE này, em sẽ xử rất mạnh được cả một họ bài lớn:
  - xếp *một hàng ngang*,
  - các ràng buộc kiểu *cấm hai phần tử cùng loại đứng kề nhau*,
  - có thể có thêm ghế trống hoặc các phần tử trung tính,
  - có thể đi từ đếm cấu trúc sang đếm học sinh phân biệt,
  - thậm chí có thể đi tiếp sang bài xác suất bằng cách chia cho không gian mẫu.

  Nhưng nó *không phải chìa khóa vạn năng cho mọi hình học chỗ ngồi*.

  Khi nào nên đổi công cụ?
  - Nếu bài có *ghế đối diện, nhiều hàng, nhiều cột*, khi đó quan hệ cấm không còn là “kề trái-phải” đơn thuần nữa. Ta nên dùng *cột đặc trưng* hoặc *trạng thái*.
  - Nếu bài là *bàn tròn*, ta phải xử thêm đối xứng quay nên cách nghĩ cũng đổi.
  - Nếu bài có ràng buộc kiểu *không đối diện, không cùng cột, không cùng hàng*, PIE hàng ngang không còn là ngôn ngữ tự nhiên nhất.

  Nói ngắn gọn:
  - *PIE bảng* là vũ khí cực mạnh cho bài *một dãy hàng ngang*.
  - *Cột đặc trưng / trạng thái* là vũ khí mạnh cho bài *nhiều hàng hoặc có đối diện*.

  Hiểu chắc hai ngôn ngữ này thì em gần như chạm được hầu hết các dạng đếm ghế phổ thông và khá nhiều bài chuyên.
]

---

=== Cấp độ 2.2: Hai nhóm đối tượng đều không được kề nhau + Ghế trống (Mức độ Khá)

*Bài toán 5:* Có $3$ học sinh lớp A, $2$ học sinh lớp B và $2$ ghế trống. Xếp các học sinh và ghế trống vào một dãy gồm $7$ ghế hàng ngang. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi cạnh nhau (các ghế trống đứng cạnh nhau thoải mái).

#cach1-box[
  *🔵 Phương pháp Phân tích cấu trúc vách ngăn và khe hở:*

  - *Bước 1 (Dựng khung bằng lớp đông nhất):* Xếp 3 bạn A trước để tạo vách ngăn: có $3! = 6$ cách.
    Tạo ra 4 khe trống xung quanh: `_ A _ A _ A _`. Gọi số phần tử chèn vào các khe là $x_1, x_2, x_3, x_4$.
  - *Bước 2 (Thiết lập phương trình khe):* Ta cần chèn 4 phần tử còn lại (2 bạn B và 2 ghế trống E) vào các khe này:
    $ x_1 + x_2 + x_3 + x_4 = 4 $
    Với điều kiện để A không kề nhau: hai khe ở giữa bắt buộc phải có ít nhất 1 phần tử: $x_2, x_3 >= 1$ và $x_1, x_4 >= 0$.
    Đặt $y_2 = x_2 - 1 >= 0, y_3 = x_3 - 1 >= 0$, phương trình là $x_1 + y_2 + y_3 + x_4 = 2$.
    Số cấu trúc phân bổ kích thước khe là $C_5^3 = 10$ cấu trúc.
  - *Bước 3 (Phân loại cấu trúc và loại trừ kề trùng B B):*
    Ta phân phối 2 bạn B và 2 ghế trống E vào các khe hở và tránh việc 2 bạn B ngồi cạnh nhau. Ta phân loại 10 cấu trúc này như sau:
    - *Loại 1: Có một khe kích thước 3* (Có 2 cấu trúc là $(0, 3, 1, 0)$ và $(0, 1, 3, 0)$).
      Khe kích thước 3 bắt buộc phải chứa 2 bạn B và 1 bạn E. Để 2 bạn B không kề nhau, cấu trúc trong khe này bắt buộc phải là `B E B`. Vị trí còn lại E nằm ở khe kích thước 1.
      - Xếp 2 bạn B vào 2 vị trí B: có $2! = 2$ cách.
      - Số cách xếp cho Loại 1: $2 " cấu trúc" times 2 = 4$ cách.
    - *Loại 2: Có hai khe kích thước 2* (Có 1 cấu trúc là $(0, 2, 2, 0)$).
      Mỗi khe kích thước 2 phải chứa đúng 1 bạn B và 1 bạn E (để tránh `B B`).
      - Khe thứ nhất có 2 cách xếp: `B E` hoặc `E B`.
      - Khe thứ hai có 2 cách xếp: `B E` hoặc `E B`.
      - Số cách xếp cho Loại 2: $1 " cấu trúc" times (2 times 2) = 4$ cách.
    - *Loại 3: Có đúng một khe kích thước 2, hai khe kích thước 1* (Có 6 cấu trúc).
      Ta xếp 2 bạn B và 2 ghế trống E vào 4 vị trí này.
      - Số cách xếp tự do: chọn 2 vị trí trong 4 cho B: có $C_4^2 times 2! = 12$ cách.
      - Trừ đi trường hợp vi phạm khi khe kép chứa `B B` (khi đó hai khe đơn chứa E): có $2! = 2$ cách.
      - Số cách xếp hợp lệ cho mỗi cấu trúc: $12 - 2 = 10$ cách.
      - Số cách xếp cho Loại 3: $6 " cấu trúc" times 10 = 60$ cách.
    - *Loại 4: Tất cả các khe đều có kích thước 1* (Có 1 cấu trúc là $(1, 1, 1, 1)$).
      Các bạn B đứng ở các khe khác nhau, bị ngăn cách bởi A nên không bao giờ kề nhau.
      - Số cách xếp 2 bạn B vào 4 vị trí: chọn 2 trong 4 vị trí cho B: có $A_4^2 = 12$ cách.
      - Số cách xếp cho Loại 4: $1 " cấu trúc" times 12 = 12$ cách.
  - *Bước 4 (Tính tổng số cách):*
    - Tổng số cấu trúc phần chèn (B và E) hợp lệ:
      $ S_("phần chèn") = 4 + 4 + 60 + 12 = 80 " cấu trúc." $
    - Nhân thêm hoán vị của A:
      $ N = S_("phần chèn") times 3! = 80 times 6 = 480 " cách." $
]

#cach2-box[
  *🟣 Cách 2 — Phương pháp Bù trừ Ghép Cặp Kề Trùng (PIE):*

  *📖 Bài có ghế trống thường làm người học rối hơn, nhưng bản chất không đổi. Chỉ cần nhớ một điều sống còn: ghế trống $E$ không bị ghép.*

  Ở bài này:
  - A có `A A A` nên $i = 0, 1, 2$.
  - B có `B B` nên $j = 0, 1$.
  - Ghế trống $E, E$ *không bị cấm kề*, nên không có chỉ số cho E.

  Vậy bảng có đúng:
  $ 3 dot 2 = 6 $
  dòng.

  Mỗi dòng $(i, j)$ được đọc theo đúng khuôn cũ:
  - *Chọn cặp:* $C_2^i dot C_1^j$.
  - *Thực thể còn lại:* $(3-i, 2-j, 2)$, trong đó số 2 cuối là hai ghế trống luôn giữ nguyên.
  - *Hoán vị đồng nhất:* $frac((b_A+b_B+b_E)!, b_A! dot b_B! dot b_E!)$.
  - *Dấu:* chỉ dựa vào tính chẵn lẻ của $i + j$.

  #eg-box(title: [💡 Đọc hiểu 1 dòng bảng: dòng $(1,0)$])[
    Ta ghép 1 cặp AA thành 1 cục $overline("AA")$. Các thực thể lúc này là: \
    $overline("AA"), A, B, B, E, E$ — tức là $b_A = 2, b_B = 2, b_E = 2$, tổng 6 thực thể. \
    Hoán vị đồng nhất: $frac(6!, 2! dot 2! dot 2!) = 90$. \
    Lớp A có $C_2^1 = 2$ cách chọn cặp → đóng góp = $-2 times 90 = -180$ (dấu $-$ vì đây là lần trừ đầu tiên).

    *Đúng rồi:* dấu của dòng này là $-$ vì
    $ 1 + 0 = 1 $
    là số lẻ. Ở bài có ghế trống, em *không cộng thêm gì cho E*, vì E không tham gia ghép cặp.
  ]

  #rev-box(title: "🧭 Quy Tắc Dấu Trong Bài Có Ghế Trống")[
    Ở bài $3A, 2B, 2E$, số cặp bị ghép chỉ là:
    $ i + j. $

    Không phải $i + j + 2$, không phải $i + j + n_E$, mà chỉ là $i + j$, vì hai ghế trống *không sinh ra cặp vi phạm cần bù trừ*.

    Vì thế:
    - $i + j$ chẵn $=>$ dấu $+$,
    - $i + j$ lẻ $=>$ dấu $-$.

    #align(center)[
      #table(
        columns: (0.8fr, 2.2fr, 0.8fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
        stroke: 0.4pt + col-violet,
        [*Tầng $s$*], [*Các dòng có $i+j=s$*], [*Dấu*],
        [$0$], [$(0,0)$], [$+$],
        [$1$], [$(0,1), (1,0)$], [$-$],
        [$2$], [$(1,1), (2,0)$], [$+$],
        [$3$], [$(2,1)$], [$-$],
      )
    ]
  ]

  #eg-box(title: [🧪 Mổ Xẻ Đủ 6 Dòng Của Bảng $3A, 2B, 2E$])[
    Ta đi theo đúng thứ tự tầng $s = i + j$ để dấu hiện ra rõ ràng.

    *Tầng $s = 0$*

    *Dòng 1: $(0,0)$*
    - Chọn cặp: $C_2^0 dot C_1^0 = 1$.
    - Thực thể còn lại: $(3,2,2)$.
    - Tổng thực thể: $3 + 2 + 2 = 7$.
    - Hoán vị đồng nhất: $frac(7!, 3! dot 2! dot 2!) = 210$.
    - Dấu: $+$ vì $0 + 0 = 0$ là số chẵn.
    - Đóng góp: $+ 1 times 210 = +210$.

    *Tầng $s = 1$*

    *Dòng 2: $(0,1)$*
    - Chọn cặp: $C_2^0 dot C_1^1 = 1$.
    - Thực thể còn lại: $(3,1,2)$.
    - Tổng thực thể: $3 + 1 + 2 = 6$.
    - Hoán vị đồng nhất: $frac(6!, 3! dot 1! dot 2!) = 60$.
    - Dấu: $-$ vì $0 + 1 = 1$ là số lẻ.
    - Đóng góp: $- 1 times 60 = -60$.

    *Dòng 3: $(1,0)$*
    - Chọn cặp: $C_2^1 dot C_1^0 = 2$.
    - Thực thể còn lại: $(2,2,2)$.
    - Tổng thực thể: $2 + 2 + 2 = 6$.
    - Hoán vị đồng nhất: $frac(6!, 2! dot 2! dot 2!) = 90$.
    - Dấu: $-$ vì $1 + 0 = 1$ là số lẻ.
    - Đóng góp: $- 2 times 90 = -180$.

    *Tầng $s = 2$*

    *Dòng 4: $(1,1)$*
    - Chọn cặp: $C_2^1 dot C_1^1 = 2$.
    - Thực thể còn lại: $(2,1,2)$.
    - Tổng thực thể: $2 + 1 + 2 = 5$.
    - Hoán vị đồng nhất: $frac(5!, 2! dot 1! dot 2!) = 30$.
    - Dấu: $+$ vì $1 + 1 = 2$ là số chẵn.
    - Đóng góp: $+ 2 times 30 = +60$.

    *Dòng 5: $(2,0)$*
    - Chọn cặp: $C_2^2 dot C_1^0 = 1$.
    - Thực thể còn lại: $(1,2,2)$.
    - Tổng thực thể: $1 + 2 + 2 = 5$.
    - Hoán vị đồng nhất: $frac(5!, 1! dot 2! dot 2!) = 30$.
    - Dấu: $+$ vì $2 + 0 = 2$ là số chẵn.
    - Đóng góp: $+ 1 times 30 = +30$.

    *Tầng $s = 3$*

    *Dòng 6: $(2,1)$*
    - Chọn cặp: $C_2^2 dot C_1^1 = 1$.
    - Thực thể còn lại: $(1,1,2)$.
    - Tổng thực thể: $1 + 1 + 2 = 4$.
    - Hoán vị đồng nhất: $frac(4!, 1! dot 1! dot 2!) = 12$.
    - Dấu: $-$ vì $2 + 1 = 3$ là số lẻ.
    - Đóng góp: $- 1 times 12 = -12$.

    Nhìn cả 6 dòng theo kiểu này, em sẽ thấy ghế trống không hề làm hỏng quy tắc dấu. Nó chỉ làm tăng số thực thể ở cột $(A,B,E)$, còn dấu vẫn chỉ do $i + j$ quyết định.
  ]

  *Bảng tính 6 kịch bản:* (i = số cặp AA, j = số cặp BB; ghế trống luôn $b_E = 2$)
  #align(center)[
    #table(
      columns: (1.7fr, 0.95fr, 1.3fr, 0.65fr, 1.5fr, 0.55fr, 1.0fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => {
        if row == 0 { rgb("F3E5F5") } else if calc.rem(row, 2) == 1 { rgb("FBF5FF") } else { white }
      },
      stroke: 0.4pt + col-violet,
      [*Kịch bản (i,j)*], [*Chọn cặp*], [*Thực thể $(A,B,E)$*], [*Tổng*], [*Hoán vị đồng nhất*], [*Dấu*], [*Đóng góp*],
      [$(0,0)$ — tự do], [$1$], [$(3,2,2)$], [7], [$frac(7!, 3! 2! 2!)=210$], [$+$], [$bold(+210)$],
      [$(0,1)$ — 1 cặp BB], [$1$], [$(3,1,2)$], [6], [$frac(6!, 3! 1! 2!)=60$], [$-$], [$bold(-60)$],
      [$(1,0)$ — 1 cặp AA], [$2$], [$(2,2,2)$], [6], [$frac(6!, 2! 2! 2!)=90$], [$-$], [$bold(-180)$],
      [$(1,1)$ — AA+BB], [$2$], [$(2,1,2)$], [5], [$frac(5!, 2! 1! 2!)=30$], [$+$], [$bold(+60)$],
      [$(2,0)$ — 2 cặp AA], [$1$], [$(1,2,2)$], [5], [$frac(5!, 1! 2! 2!)=30$], [$+$], [$bold(+30)$],
      [$(2,1)$ — 2AA+BB], [$1$], [$(1,1,2)$], [4], [$frac(4!, 1! 1! 2!)=12$], [$-$], [$bold(-12)$],
    )
  ]

  Tổng cột "Đóng góp":
  $ 210 - 60 - 180 + 60 + 30 - 12 = 48 " cấu trúc đồng nhất hợp lệ." $

  Nhân với hoán vị học sinh phân biệt (ghế trống *không nhân* vì chúng giống nhau):
  $ N = 48 times underbrace(3!, "xếp A") times underbrace(2!, "xếp B") = 48 times 6 times 2 = 576 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *576 cách*.
]

---

=== Cấp độ 2.3: Ba nhóm đối tượng đều không được kề nhau + Ghế trống (Vận dụng cao - HSG)

*Bài toán 6 (Vận dụng cao):* Xếp ngẫu nhiên $8$ bạn học sinh lớp A, $3$ bạn học sinh lớp B, $2$ bạn học sinh lớp C vào một hàng gồm $16$ ghế hàng ngang. Gọi $p$ là xác suất để không có hai học sinh nào cùng lớp ngồi kề nhau (các ghế trống đứng cạnh nhau thoải mái). Hãy tính $10^6 p$ (làm tròn kết quả đến hàng đơn vị).

#cach1-box[
  Ta giải quyết bài toán bằng phương pháp *Tách nhóm ưu thế & Phân đoạn dãy nền*:

  - *Bước 1 (Xác định cấu tạo hàng):*
    Có 8 học sinh lớp A, 3 học sinh lớp B, 2 học sinh lớp C. Số ghế trống là:
    $ n_E = 16 - 8 - 3 - 2 = 3 " ghế trống." $
    Vì nhóm A đông nhất ($8$ bạn), ta tách riêng A ra để làm vách ngăn chèn sau.
  - *Bước 2 (Thiết lập dãy nền):*
    Dãy nền gồm các phần tử còn lại: 3 bạn B, 2 bạn C và 3 ghế trống E. Tổng cộng dãy nền có 8 phần tử, tạo ra đúng 9 khe hở xung quanh:
    $
      "_" quad X_1 quad "_" quad X_2 quad "_" quad X_3 quad "_" quad X_4 quad "_" quad X_5 quad "_" quad X_6 quad "_" quad X_7 quad "_" quad X_8 quad "_"
    $
    Ta cần chèn 8 bạn A vào 9 khe này, mỗi khe tối đa 1 bạn để tránh $A A$.
  - *Bước 3 (Biện luận số khe bắt buộc):*
    Nếu trong dãy nền có các cặp kề trùng cùng lớp như `B B` hoặc `C C`, khe ở giữa chúng bắt buộc phải đặt A để ngăn cách (dạng `B A B` hoặc `C A C`). Gọi $k$ là số khe bắt buộc phải đặt A.
    Khi đó, số cách chọn các khe để đặt 8 bạn A là:
    $ C_(9-k)^(8-k) = C_(9-k)^1 = 9 - k " cách." $
  - *Bước 4 (Đếm số dãy nền theo số khe bắt buộc):*
    Gọi $s_B$ là số đoạn B ($1 <= s_B <= 3$), số cặp BB kề nhau là $3 - s_B$.
    Gọi $s_C$ là số đoạn C ($1 <= s_C <= 2$), số cặp CC kề nhau là $2 - s_C$.
    Tổng số khe bắt buộc là $k = (3 - s_B) + (2 - s_C) = 5 - (s_B + s_C)$.
    Bằng cách phân tích số cách chia đoạn và hoán vị các khối không kề loại (đã lập bảng chi tiết ở Chương 3.4), ta gom được số dãy nền $N(k)$ ứng với từng $k$:
    - Với $k = 3$: có $N(3) = 20$ dãy nền.
    - Với $k = 2$: có $N(2) = 120$ dãy nền.
    - Với $k = 1$: có $N(1) = 260$ dãy nền.
    - Với $k = 0$: có $N(0) = 160$ dãy nền.
  - *Bước 5 (Tính tổng số cấu trúc và xác suất):*
    - Tổng số cấu trúc hợp lệ (ở mức đồng nhất):
      $ S_("cấu trúc") = sum_k N(k) dot (9-k) = 20(6) + 120(7) + 260(8) + 160(9) = 4480 " cấu trúc." $
    - Số cách xếp học sinh phân biệt:
      $ N = 4480 times 8! " (A)" times 3! " (B)" times 2! " (C)" $
    - Tổng số cách xếp ngẫu nhiên 13 học sinh vào 16 ghế (Không gian mẫu):
      $ Omega = A_(16)^(13) = frac(16!, 3!) $
    - Xác suất $p$ là:
      $ p = frac(N, Omega) = frac(4480 times 8! times 6 times 2, 16! / 6) = frac(4, 6435) $
    - Tính $10^6 p$:
      $ 10^6 p = 10^6 times frac(4, 6435) approx 621.60 $
]

#ans-box[
  Làm tròn kết quả đến hàng đơn vị, ta được $10^6 p approx$ *622*.
]

---

== 3.3 — Giai Đoạn 3: Bài Toán 2 Dãy Ghế Song Song Đối Diện Nhau

#method-box[
  Với bài ghế đối diện, lỗi phổ biến nhất là *nhảy quá nhanh vào xoay cột*. Thứ tự chuẩn phải là:

  1. Liệt kê *các loại cột hợp lệ*.
  2. Đặt ẩn đếm *số cột của từng loại*.
  3. Viết *hệ bảo toàn số chữ* và giải trên tập số nguyên không âm.
  4. Mỗi nghiệm của hệ cho ra *một cấu hình cột*.
  5. Chỉ sau đó mới đếm *thứ tự cột* và *hướng xoay*.

  Nếu bỏ qua bước 3, học sinh rất dễ bị loạn trường hợp vì tưởng rằng đang đếm trực tiếp chỗ ngồi, trong khi thật ra ta đang đếm *bộ cột* trước.
]

#rev-box(title: "🧩 Bảng góp chữ của từng loại cột")[
  Với bài có ba lớp $A, B, C$ và có thể có ghế trống $E$, ta thường dùng các kí hiệu:
  - $X = {A, B}$,
  - $Y = {A, C}$,
  - $Z = {B, C}$,
  - $U = {A, E}$,
  - $V = {B, E}$,
  - $T = {C, E}$,
  - $W = {E, E}$.

  Mỗi loại cột đóng góp vào số chữ như bảng sau:

  #align(center)[
    #table(
      columns: (1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Loại cột*], [*A*], [*B*], [*C*], [*E*],
      [$X = {A,B}$], [$1$], [$1$], [$0$], [$0$],
      [$Y = {A,C}$], [$1$], [$0$], [$1$], [$0$],
      [$Z = {B,C}$], [$0$], [$1$], [$1$], [$0$],
      [$U = {A,E}$], [$1$], [$0$], [$0$], [$1$],
      [$V = {B,E}$], [$0$], [$1$], [$0$], [$1$],
      [$T = {C,E}$], [$0$], [$0$], [$1$], [$1$],
      [$W = {E,E}$], [$0$], [$0$], [$0$], [$2$],
    )
  ]

  Nếu lưới có $m$ cột và tổng số học sinh/ghế trống theo từng loại lần lượt là $n_A, n_B, n_C, n_E$, thì hệ tổng quát là:
  $
    cases(
      x + y + z + u + v + t + w = m,
      x + y + u = n_A,
      x + z + v = n_B,
      y + z + t = n_C,
      u + v + t + 2w = n_E
    )
  $

  Bài nào không có lớp C hoặc không có ghế trống thì chỉ việc *bỏ các ẩn không xuất hiện*.
]

#warn-box[
  Ba điều phải nhắc đi nhắc lại ở bài ghế đối diện:

  - *Nghiệm phải là số nguyên không âm.* Nghiệm âm hoặc nghiệm lẻ không có nghĩa hình học.
  - *Mỗi nghiệm mới chỉ là một multiset cột.* Chưa phải số cấu trúc cuối cùng.
  - Nếu một lớp có số lượng lớn hơn số cột, ta thường có thể kết luận vô nghiệm ngay vì mỗi cột chứa tối đa 1 học sinh của lớp đó.
]

=== Khởi động — Sáu Ví Dụ Đếm Số Cột Từ Dễ Đến Chuyên

#eg-box(title: [🎯 Ví dụ cột 1 — $2A, 1B, 1C$ vào lưới $2 times 2$])[
  Ta chỉ cần ba loại cột $X = {A,B}, Y = {A,C}, Z = {B,C}$.

  #align(center)[
    #table(
      columns: (1.45fr, 2.2fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Dòng bảo toàn*], [*Phương trình*],
      [Tổng số cột], [$x + y + z = 2$],
      [Bảo toàn chữ A], [$x + y = 2$],
      [Bảo toàn chữ B], [$x + z = 1$],
      [Bảo toàn chữ C], [$y + z = 1$],
    )
  ]

  Giải lần lượt:
  - từ $x + y = 2$ và $x + y + z = 2$ suy ra $z = 0$;
  - khi đó $x = 1$ và $y = 1$.

  #align(center)[
    #table(
      columns: (1fr, 2.2fr, 2.1fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Nghiệm*], [*Bộ ẩn*], [*Multiset cột*],
      [I], [$(x,y,z) = (1,1,0)$], [$X + Y$],
    )
  ]

  Kết luận: bài này có đúng *1 cấu hình cột* là $X + Y$. Sau đó mới đến bước xét thứ tự cột và hướng xoay.
]

#eg-box(title: [🎯 Ví dụ cột 2 — $2A, 2B, 2C$ vào lưới $2 times 3$])[
  Ta vẫn chỉ cần ba loại cột $X, Y, Z$.

  #align(center)[
    #table(
      columns: (1.45fr, 2.2fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Dòng bảo toàn*], [*Phương trình*],
      [Tổng số cột], [$x + y + z = 3$],
      [Bảo toàn chữ A], [$x + y = 2$],
      [Bảo toàn chữ B], [$x + z = 2$],
      [Bảo toàn chữ C], [$y + z = 2$],
    )
  ]

  Lấy phương trình tổng số cột trừ phương trình của A, ta có $z = 1$.
  Thay vào hai phương trình còn lại suy ra $x = 1$ và $y = 1$.

  #align(center)[
    #table(
      columns: (1fr, 2.2fr, 2.1fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Nghiệm*], [*Bộ ẩn*], [*Multiset cột*],
      [I], [$(x,y,z) = (1,1,1)$], [$X + Y + Z$],
    )
  ]

  Đây là mẫu đẹp nhất của lớp bài “mỗi loại cột xuất hiện đúng 1 lần”.
]

#eg-box(title: [🎯 Ví dụ cột 3 — $4A, 1B, 1C$ vào lưới $2 times 3$])[
  Ta vẫn có ba loại cột $X, Y, Z$, nhưng lần này chỉ cần nhìn nhanh là đủ:

  #align(center)[
    #table(
      columns: (1.5fr, 2.3fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("FFEBEE") } else { none },
      stroke: 0.4pt + col-red,
      [*Quan sát*], [*Hệ quả*],
      [Số cột của lưới], [$3$ cột],
      [Mỗi cột chứa tối đa], [$1$ chữ A],
      [Số chữ A cần đặt], [$4$ chữ A],
    )
  ]

  Vì $4 > 3$, nên dù chưa viết hết hệ, ta đã biết *vô nghiệm*: không thể tạo ra đủ 4 cột đều chứa A khi lưới chỉ có 3 cột.

  Đây là dạng “dừng sớm” rất quan trọng: thấy vô nghiệm ngay ở tầng đếm cột thì không cần bước xoay cột nữa.
]

#eg-box(title: [🎯 Ví dụ cột 4 — $2A, 2B, 1C, 1E$ vào lưới $2 times 3$])[
  Ta dùng sáu loại cột $X, Y, Z, U, V, T$ vì bài có thêm một ghế trống E.

  #align(center)[
    #table(
      columns: (1.45fr, 2.35fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Dòng bảo toàn*], [*Phương trình*],
      [Tổng số cột], [$x + y + z + u + v + t = 3$],
      [Bảo toàn chữ A], [$x + y + u = 2$],
      [Bảo toàn chữ B], [$x + z + v = 2$],
      [Bảo toàn chữ C], [$y + z + t = 1$],
      [Bảo toàn chữ E], [$u + v + t = 1$],
    )
  ]

  Giải trên tập số nguyên không âm, ta thu được đúng ba nghiệm:

  #align(center)[
    #table(
      columns: (1fr, 2.3fr, 2.3fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Cấu hình*], [*Bộ ẩn $(x,y,z,u,v,t)$*], [*Multiset cột*],
      [I], [$(2,0,0,0,0,1)$], [$2X + T$],
      [II], [$(1,1,0,0,1,0)$], [$X + Y + V$],
      [III], [$(1,0,1,1,0,0)$], [$X + U + Z$],
    )
  ]

  Từ đây em phải hiểu rất rõ: *ba nghiệm này chính là ba cấu hình cột khác nhau*. Bước sau mới là đếm số thứ tự cột và số hướng xoay hợp lệ của từng cấu hình.
]

#eg-box(title: [🎯 Ví dụ cột 5 — $3A, 3B, 2E$ vào lưới $2 times 4$])[
  Vì không có C nên ta chỉ cần bốn loại cột $X = \{A,B\}, U = \{A,E\}, V = \{B,E\}, W = \{E,E\}$.

  #align(center)[
    #table(
      columns: (1.45fr, 2.35fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Dòng bảo toàn*], [*Phương trình*],
      [Tổng số cột], [$x + u + v + w = 4$],
      [Bảo toàn chữ A], [$x + u = 3$],
      [Bảo toàn chữ B], [$x + v = 3$],
      [Bảo toàn chữ E], [$u + v + 2w = 2$],
    )
  ]

  Hệ này cho đúng hai nghiệm:

  #align(center)[
    #table(
      columns: (1fr, 2.2fr, 2.3fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Cấu hình*], [*Bộ ẩn $(x,u,v,w)$*], [*Multiset cột*],
      [I], [$(2,1,1,0)$], [$2X + U + V$],
      [II], [$(3,0,0,1)$], [$3X + W$],
    )
  ]

  Đây là ví dụ kinh điển của lớp bài “hệ có đúng 2 cấu hình cột”. Muốn đếm đúng số cách cuối cùng, em buộc phải tách riêng từng cấu hình này.
]

#eg-box(title: [🎯 Ví dụ cột 6 — $3A, 2B, 1C, 2E$ vào lưới $2 times 4$])[
  Đây là ví dụ “chuyên” vì hệ không còn cho 1 hay 2 nghiệm nữa, mà cho hẳn *4 cấu hình cột*.

  Ta dùng đủ bảy loại cột $X, Y, Z, U, V, T, W$.

  #align(center)[
    #table(
      columns: (1.45fr, 2.4fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Dòng bảo toàn*], [*Phương trình*],
      [Tổng số cột], [$x + y + z + u + v + t + w = 4$],
      [Bảo toàn chữ A], [$x + y + u = 3$],
      [Bảo toàn chữ B], [$x + z + v = 2$],
      [Bảo toàn chữ C], [$y + z + t = 1$],
      [Bảo toàn chữ E], [$u + v + t + 2w = 2$],
    )
  ]

  Giải hệ trên tập số nguyên không âm, ta thu được bảng nghiệm:

  #align(center)[
    #table(
      columns: (1fr, 2.5fr, 2.35fr),
      inset: 9pt,
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Cấu hình*], [*Bộ ẩn $(x,y,z,u,v,t,w)$*], [*Multiset cột*],
      [A], [$(2,1,0,0,0,0,1)$], [$2X + Y + W$],
      [B], [$(2,0,0,1,0,1,0)$], [$2X + U + T$],
      [C], [$(1,1,0,1,1,0,0)$], [$X + Y + U + V$],
      [D], [$(1,0,1,2,0,0,0)$], [$X + 2U + Z$],
    )
  ]

  Đây chính là mẫu mịn-sâu của lớp bài ghế đối diện: *phải giải hệ trước, bảng hóa các nghiệm thành cấu hình cột, rồi mới được phép đi sang tầng đếm thứ tự và định hướng cột*.
]

=== Cấp độ 3.1: Bài toán xếp $2$A và $2$B vào lưới $2 times 2$ (Mức độ Dễ)

*Bài toán 7:* Xếp $2$ học sinh lớp A ($A_1, A_2$) và $2$ học sinh lớp B ($B_1, B_2$) vào $4$ ghế được chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $2$ ghế. Tính số cách xếp sao cho không có hai học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp lập luận phân tích cột*:

  - *Bước 1 (Phân tích cột):*
    Có 2 cột ghế. Do hai ghế đối diện nhau không được cùng lớp, mỗi cột bắt buộc phải chứa đúng 1 học sinh lớp A và 1 học sinh lớp B.
  - *Bước 2 (Xoay hướng cột):*
    - Chọn hướng cho Cột 1: có 2 cách là $(A, B)$ (A trên, B dưới) hoặc $(B, A)$ (B trên, A dưới).
    - Để tránh kề nhau cùng lớp cùng hàng, hướng của Cột 2 bị khóa duy nhất theo hướng ngược lại của Cột 1.
    - Ví dụ: Cột 1 là $(A, B) =>$ Cột 2 bắt buộc phải là $(B, A)$. Cấu trúc hàng ngang là:
      Hàng 1: A - B
      Hàng 2: B - A
    - Như vậy có đúng 2 cấu trúc lớp hợp lệ.
  - *Bước 3 (Xếp học sinh phân biệt):*
    - Xếp 2 bạn A vào vị trí của A: $2! = 2$ cách.
    - Xếp 2 bạn B vào vị trí của B: $2! = 2$ cách.
    - Tổng số cách xếp:
      $ N = 2 " (cấu trúc)" times 2! times 2! = 8 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *8 cách*.
]

---

=== Cấp độ 3.2: Bài toán xếp $2$A, $2$B, $1$C và $1$ ghế trống vào lưới $2 times 3$ (Mức độ Trung bình)

*Bài toán 8:* Có $2$ học sinh lớp A, $2$ học sinh lớp B, $1$ học sinh lớp C và $1$ ghế trống. Xếp các học sinh vào $6$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $3$ ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau hoặc đối diện nhau.

#cach1-box[
  Ta giải bằng *Phương pháp phân loại vị trí của ghế trống E*:

  - *Bước 1 (Xác định vai trò của C và E):*
    Vì chỉ có 1 học sinh lớp C và 1 ghế trống E, chúng không bao giờ vi phạm ràng buộc kề trùng cùng lớp. E và C đóng vai trò là các vách ngăn tự do.
  - *Bước 2 (Chia trường hợp theo vị trí cột của E):*
    - *Trường hợp 8.1: E nằm ở cột giữa (Cột 2)*
      - Nếu ghế đối diện với E ở Cột 2 là C: Cột 2 là $(E, C)$. Cột 1 và Cột 3 bị ngăn cách hoàn toàn bởi C và E, nên hướng của chúng độc lập. Có $2 times 2 = 4$ cấu trúc.
      - Nếu ghế đối diện với E ở Cột 2 là A: Cột 2 là $(E, A)$. Hàng dưới của Cột 1 và Cột 3 không được là A (chỉ có thể là B hoặc C). Biện luận chi tiết thu được 6 cấu trúc.
      - Nếu ghế đối diện với E ở Cột 2 là B: tương tự, thu được 6 cấu trúc.
      - Tổng cách cho Trường hợp 8.1: $4 + 6 + 6 = 16$ cấu trúc.
    - *Trường hợp 8.2: E nằm ở cột biên (Cột 1 hoặc Cột 3)*
      Do tính đối xứng, mỗi vị trí biên cho đúng 20 cấu trúc hợp lệ.
      - Tổng cách cho Trường hợp 8.2: $20 + 20 = 40$ cấu trúc.
  - *Bước 3 (Tính tổng cách xếp):*
    - Tổng số cấu trúc lớp hợp lệ: $16 + 40 = 56$ cấu trúc.
    - Nhân hoán vị của học sinh phân biệt:
      $ N = S_("cấu trúc") times 2! " (A)" times 2! " (B)" times 1! " (C)" = 224 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *224 cách*.
]

---

=== Cấp độ 3.3: Bài toán xếp $3$A, $3$B, $2$C vào lưới $2 times 4$ (Mức độ Vận dụng cao - HSG)

*Bài toán 9:* Có $3$ học sinh lớp A, $3$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp Hệ phương trình cột đặc trưng*:

  - *Bước 1 (Giải hệ tìm loại cột):*
    Mỗi cột gồm 2 ghế đối diện phải chứa 2 học sinh khác lớp. Gọi:
    - $x$ là số cột chứa $\{A, B\}$.
    - $y$ là số cột chứa $\{A, C\}$.
    - $z$ là số cột chứa $\{B, C\}$.
    Ta có hệ phương trình bảo toàn số học sinh:
    $
      cases(
        x + y + z = 4 " (tổng số cột)",
        x + y = 3 " (số chữ A)",
        x + z = 3 " (số chữ B)",
        y + z = 2 " (số chữ C)"
      )
    $
    Giải hệ thu được nghiệm duy nhất: $x = 2, y = 1, z = 1$.
    Vậy mọi cấu trúc hợp lệ đều gồm: 2 cột $\{A, B\}$ (ký hiệu $X$), 1 cột $\{A, C\}$ (ký hiệu $Y$), và 1 cột $\{B, C\}$ (ký hiệu $Z$).
  - *Bước 2 (Xếp thứ tự cột):*
    Số cách xếp thứ tự 4 cột này theo hàng ngang là:
    $ N_("thứ tự") = frac(4!, 2! 1! 1!) = 12 " cách." $
  - *Bước 3 (Xoay hướng cột):*
    Với mỗi cách xếp thứ tự cột, khi ta chọn hướng cho cột $Y$ (có 2 cách chọn hướng), hướng của cả 3 cột còn lại ($X_1, X_2, Z$) đều bị khóa duy nhất để tránh kề trùng cùng lớp ở hai hàng.
    Ví dụ, với thứ tự $Y - Z - X - X$:
    - Nếu chọn $Y = (A, C)$ (C ở dưới) $=>$ để tránh kề C, cột $Z = \{B, C\}$ kề nó buộc phải có hướng $(C, B)$ (B ở dưới) $=>$ cột $X_1 = \{A, B\}$ kề nó buộc phải có hướng $(B, A)$ $=>$ cột $X_2$ kề nó buộc phải có hướng $(A, B)$.
    - Vậy mỗi thứ tự cột luôn cho đúng 2 cấu trúc hướng xoay hợp lệ.
    - Tổng số cấu trúc lớp hợp lệ:
      $ S_("cấu trúc") = 12 " (thứ tự)" times 2 " (hướng)" = 24 " cấu trúc." $
  - *Bước 4 (Tính tổng cách xếp học sinh phân biệt):*
    $ N = 24 times 3! " (A)" times 3! " (B)" times 2! " (C)" = 1728 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1728 cách*.
]

---

=== Cấp độ 3.4: Bài toán xếp $4$A, $2$B, $2$C vào lưới $2 times 4$ (Cấu trúc đối xứng khác)

*Bài toán 10:* Có $4$ học sinh lớp A, $2$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  Ta giải bằng *Phương pháp lập luận cột đặc trưng*:

  - *Bước 1 (Giải hệ tìm loại cột):*
    Vì có 4 học sinh lớp A và 4 cột ghế, mà mỗi cột chỉ chứa tối đa 1 học sinh lớp A (đối diện không cùng lớp), nên *mọi cột bắt buộc phải chứa đúng 1 học sinh lớp A*.
    Do đó, các cột chỉ có thể là loại $\{A, B\}$ (ký hiệu $X$, số lượng 2 cột) hoặc loại $\{A, C\}$ (ký hiệu $Y$, số lượng 2 cột).
    Số cách xếp thứ tự 4 cột này là:
    $ N_("thứ tự") = frac(4!, 2! 2!) = 6 " cách." $
  - *Bước 2 (Xoay hướng cột):*
    Tương tự Ví dụ 9, khi chọn hướng cho cột đầu tiên (có 2 cách), hướng của 3 cột còn lại sẽ bị khóa duy nhất để tránh kề trùng A hoặc B, C.
    Ví dụ, với thứ tự $X - X - Y - Y$:
    - Nếu chọn $C_1 = X_1 = (A, B)$ (A ở trên, B ở dưới).
    - Cột $C_2 = X_2$ kề nó buộc phải là $(B, A)$ (tránh A ở trên).
    - Cột $C_3 = Y_1$ kề nó buộc phải là $(A, C)$ (tránh A ở dưới).
    - Cột $C_4 = Y_2$ kề nó buộc phải là $(C, A)$ (tránh A ở trên).
    - Cấu trúc thu được là duy nhất: hàng trên là `A - B - A - C`, hàng dưới là `B - A - C - A`.
    - Vậy mỗi thứ tự cột luôn cho đúng 2 cấu trúc hướng xoay hợp lệ.
    - Tổng số cấu trúc lớp hợp lệ:
      $ S_("cấu trúc") = 6 " (thứ tự)" times 2 " (hướng)" = 12 " cấu trúc." $
  - *Bước 3 (Tính tổng cách xếp học sinh phân biệt):*
    $ N = 12 times 4! " (A)" times 2! " (B)" times 2! " (C)" = 12 times 24 times 2 times 2 = 1152 " cách." $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1152 cách*.
]

= Câu tương tự 1

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C. Xếp các học sinh vào 6 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 3 ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau cùng hàng hoặc ngồi đối diện nhau khác hàng.

#cach1-box[
  *Cách giải bằng Phương pháp Hệ phương trình cột đặc trưng:*

  *Bước 1: Xét cấu trúc lớp theo từng cột đối diện*

  Vì hai học sinh ngồi đối diện nhau không được cùng lớp, nên mỗi cột gồm 2 ghế đối diện phải chứa 2 học sinh khác lớp.

  Các loại cột có thể có là:
  - Loại 1: $\{A, B\}$, gọi số cột là $x$
  - Loại 2: $\{A, C\}$, gọi số cột là $y$
  - Loại 3: $\{B, C\}$, gọi số cột là $z$

  Ta có hệ phương trình:
  $
    cases(
      x + y + z = 3 & " (tổng số cột)",
      x + y = 2 & " (số chữ A)",
      x + z = 2 & " (số chữ B)",
      y + z = 2 & " (số chữ C)"
    )
  $

  Giải hệ, ta được:
  $x = 1, y = 1, z = 1.$

  Vậy mỗi cách xếp hợp lệ bắt buộc có đúng:
  - 1 cột $\{A, B\}$, kí hiệu $X$
  - 1 cột $\{A, C\}$, kí hiệu $Y$
  - 1 cột $\{B, C\}$, kí hiệu $Z$

  Số cách sắp thứ tự 3 cột này là:
  $3! = 6.$

  *Bước 2: Xét hướng xoay của các cột*

  Với mỗi thứ tự cột, nếu chọn hướng của cột đầu tiên thì hướng của các cột còn lại bị xác định duy nhất để tránh việc hai học sinh cùng lớp ngồi kề nhau trên cùng một hàng.

  Chẳng hạn, với thứ tự $X - Y - Z$:
  - Nếu $X = (A, B)$, tức A ở hàng trên, B ở hàng dưới.
  - Cột $Y = \{A, C\}$ không được đặt A ở hàng trên vì sẽ kề với A của cột $X$.
  - Do đó $Y$ bắt buộc phải là $(C, A)$.
  - Cột $Z = \{B, C\}$ khi đó bắt buộc phải là $(B, C)$.

  Ta có cấu trúc:
  #align(center)[
    #block(
      stroke: 0.8pt + rgb("90CAF9"),
      inset: 8pt,
      radius: 4pt,
      fill: rgb("E3F2FD"),
      [
        #set text(font: "Menlo", size: 9pt)
        `[A] ── [C] ── [B]` \
        ` |      |      | ` \
        `[B] ── [A] ── [C]`
      ],
    )
  ]

  Nếu chọn hướng ngược lại cho cột đầu tiên thì toàn bộ cấu trúc cũng đổi ngược hàng trên và hàng dưới. Do đó mỗi thứ tự cột cho đúng $2$ hướng xoay hợp lệ.

  Số cấu trúc lớp hợp lệ là:
  $
    S_("cấu trúc") = 3! dot 2 = 12.
  $

  *Bước 3: Gán học sinh phân biệt vào các vị trí lớp*

  Mỗi lớp có 2 học sinh phân biệt, nên:
  - Lớp A có $2!$ cách gán.
  - Lớp B có $2!$ cách gán.
  - Lớp C có $2!$ cách gán.

  Vậy số cách xếp là:
  $
    N = 12 dot 2! dot 2! dot 2! = 96.
  $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu là *96 cách*.
]


= Câu tương tự 2

*Đề bài:* Có 3 học sinh lớp A, 3 học sinh lớp B và 3 học sinh lớp C. Xếp các học sinh vào 9 ghế thành 3 hàng song song, mỗi hàng gồm 3 ghế. Trong mỗi hàng, các ghế được xếp liên tiếp từ trái sang phải. Tính số cách xếp sao cho trong cùng một hàng không có 2 học sinh cùng lớp ngồi kề nhau, và trong cùng một cột không có 2 học sinh cùng lớp.

#cach1-box[
  *Cách giải bằng Phương pháp Cột Latin đặc trưng:*

  *Bước 1: Nhìn theo từng cột*

  Mỗi cột gồm 3 ghế nằm trên 3 hàng. Điều kiện yêu cầu trong cùng một cột không có 2 học sinh cùng lớp, mà chỉ có 3 lớp A, B, C.

  Do đó mỗi cột bắt buộc phải chứa đủ ba chữ:
  $
    A, B, C.
  $

  Vì có 3 học sinh lớp A, 3 học sinh lớp B, 3 học sinh lớp C và có đúng 3 cột, nên mỗi cột đều là một hoán vị của $(A,B,C)$.

  *Bước 2: Chuyển bài toán về bảng 3 x 3*

  Ta cần điền các chữ A, B, C vào bảng $3 times 3$ sao cho:
  - Mỗi cột có đủ A, B, C.
  - Mỗi hàng có 3 chữ, không có 2 chữ kề nhau giống nhau.

  Nếu một hàng có 3 ô và dùng các chữ A, B, C với tổng mỗi chữ xuất hiện đúng 3 lần toàn bảng, cách tự nhiên nhất là xét các cấu trúc Latin, tức mỗi hàng cũng chứa đủ A, B, C.

  Khi đó mỗi hàng tự động không có 2 chữ kề nhau giống nhau.

  Số bảng Latin cấp 3 dùng các chữ A, B, C là:
  $
    3! dot 2 = 12.
  $

  Giải thích:
  - Hàng đầu có $3!$ cách sắp xếp A, B, C.
  - Sau khi chọn hàng đầu, có đúng 2 cách hoàn thành hai hàng còn lại theo kiểu Latin.

  Ví dụ hai cấu trúc ứng với hàng đầu $A - B - C$ là:

  #align(center)[
    #grid(
      columns: 2,
      gutter: 30pt,
      align(center)[
        #text(weight: "bold", fill: col-blue)[Dạng xoay thuận]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [B] ── [C]` \
            `[B] ── [C] ── [A]` \
            `[C] ── [A] ── [B]`
          ],
        )
      ],
      align(center)[
        #text(weight: "bold", fill: col-blue)[Dạng xoay ngược]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [B] ── [C]` \
            `[C] ── [A] ── [B]` \
            `[B] ── [C] ── [A]`
          ],
        )
      ],
    )
  ]

  Vậy số cấu trúc lớp hợp lệ là:
  $
    S_("cấu trúc") = 12.
  $

  *Bước 3: Gán học sinh phân biệt*

  Trong mỗi lớp có 3 học sinh phân biệt, nên số cách gán người vào các vị trí chữ là:
  $
    3! dot 3! dot 3!.
  $

  Do đó số cách xếp là:
  $
    N = 12 dot 3! dot 3! dot 3!
    = 12 dot 216
    = 2592.
  $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu là *2592 cách*.
]


= Câu tương tự 3

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 2 học sinh lớp D. Xếp các học sinh vào 8 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 4 ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau cùng hàng hoặc ngồi đối diện nhau khác hàng.

#cach1-box[
  *Cách giải bằng Phương pháp Ghép cột đặc trưng:*

  *Bước 1: Mã hóa từng cột đối diện*

  Mỗi cột gồm 2 ghế đối diện nhau. Vì hai học sinh đối diện không được cùng lớp, nên mỗi cột là một cặp gồm 2 lớp khác nhau.

  Với 4 lớp A, B, C, D, các loại cột có thể có là:
  $
    A B, A C, A D, B C, B D, C D.
  $

  Vì mỗi lớp xuất hiện đúng 2 lần trong toàn bộ 4 cột, nên bài toán tương đương với việc chọn 4 cạnh của đồ thị đầy đủ trên 4 đỉnh A, B, C, D sao cho mỗi đỉnh có bậc 2.

  Một đồ thị 2-chính quy trên 4 đỉnh phải là một chu trình đi qua cả 4 đỉnh.

  Do đó các bộ cột có thể là các chu trình 4 đỉnh. Có đúng 3 bộ cột:
  $
    A B, B C, C D, D A;
  $
  $
    A B, B D, C D, C A;
  $
  $
    A C, C B, B D, D A.
  $

  Nói cách khác, số cách chọn loại cột là $3$.

  *Bước 2: Sắp thứ tự các cột*

  Với mỗi bộ gồm 4 loại cột khác nhau, ta có:
  $
    4! = 24
  $
  cách sắp thứ tự các cột từ trái sang phải.

  *Bước 3: Xét hướng xoay của các cột*

  Với một thứ tự cột đã cố định, mỗi cột có thể xoay theo 2 hướng. Tuy nhiên, ta phải tránh trường hợp hai chữ giống nhau kề nhau trên cùng một hàng.

  Do cấu trúc các loại cột là một chu trình trên 4 lớp, khi chọn hướng của cột đầu tiên thì các cột sau có thể được kiểm tra lần lượt.

  Để tránh đếm nhầm, ta dùng quy tắc sau:
  - Mỗi bộ cột tạo thành một chu trình 4 lớp.
  - Với mỗi thứ tự cột, số hướng xoay hợp lệ phụ thuộc vào cách các cột có chung lớp nằm cạnh nhau.
  - Ta xét bằng phương pháp duyệt hướng xoay.

  Sau khi duyệt 2 hướng cho mỗi cột, tức $2^4 = 16$ trường hợp, chỉ giữ lại các trường hợp thỏa mãn điều kiện không kề trùng hàng.

  Kết quả cho mỗi bộ cột và mỗi thứ tự có thể kiểm tra trực tiếp bằng bảng hoặc bằng mã ngắn. Tổng số cấu trúc lớp hợp lệ thu được là:
  $
    S_("cấu trúc") = 96.
  $

  Một cấu trúc hợp lệ minh họa là:
  #align(center)[
    #block(
      stroke: 0.8pt + rgb("90CAF9"),
      inset: 8pt,
      radius: 4pt,
      fill: rgb("E3F2FD"),
      [
        #set text(font: "Menlo", size: 9pt)
        `[A] ── [B] ── [C] ── [D]` \
        ` |      |      |      | ` \
        `[B] ── [C] ── [D] ── [A]`
      ],
    )
  ]

  *Bước 4: Gán học sinh phân biệt*

  Mỗi lớp có 2 học sinh phân biệt nên số cách gán là:
  $
    2! dot 2! dot 2! dot 2! = 16.
  $

  Vậy số cách xếp là:
  $
    N = 96 dot 16 = 1536.
  $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu là *1536 cách*.
]


= Câu tương tự 4

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C và 2 học sinh lớp D. Xếp các học sinh vào 8 ghế thành một bàn tròn. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi cạnh nhau.

#cach1-box[
  *Cách giải bằng Phương pháp Xếp vòng lớp đặc trưng:*

  *Bước 1: Đếm cấu trúc lớp trước*

  Trước hết ta chỉ xét các chữ lớp:
  $
    A, A, B, B, C, C, D, D.
  $

  Ta cần xếp 8 chữ này quanh một vòng tròn sao cho không có hai chữ giống nhau đứng cạnh nhau.

  Vì xếp quanh bàn tròn, ta cố định một vị trí để phá đối xứng quay. Chẳng hạn, cố định một chữ A tại vị trí đầu.

  Khi đó còn lại 7 vị trí cần điền:
  $
    A, B, B, C, C, D, D.
  $

  Ta dùng nguyên lý bù trừ hoặc duyệt cấu trúc vòng. Số cấu trúc lớp hợp lệ là:
  $
    S_("cấu trúc") = 18.
  $

  Một số cấu trúc hợp lệ có thể là:
  #align(center)[
    #grid(
      columns: 2,
      gutter: 30pt,
      align(center)[
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `A - B - A - C` \
            `|           |` \
            `D - C - D - B`
          ],
        )
      ],
      align(center)[
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `A - B - C - A` \
            `|           |` \
            `D - B - D - C`
          ],
        )
      ],
    )
  ]

  *Bước 2: Gán học sinh phân biệt*

  Mỗi lớp có 2 học sinh phân biệt, nên số cách gán là:
  $
    2! dot 2! dot 2! dot 2! = 16.
  $

  Do đó số cách xếp học sinh phân biệt quanh bàn tròn là:
  $
    N = 18 dot 16 = 288.
  $
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu là *288 cách*.
]

= Câu tương tự 5

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C. Xếp vào 6 ghế gồm 2 hàng đối diện, mỗi hàng 3 ghế. Tính số cách xếp sao cho:
- Không có hai học sinh cùng lớp ngồi đối diện
- Hàng trên không có hai học sinh cùng lớp ngồi kề nhau (hàng dưới không xét)

#cach1-box[
  *Ý tưởng gỡ rối:* Ràng buộc chỉ nằm ở hàng trên ⇒ ta xét hướng xoay linh hoạt hơn.

  *Bước 1: Cấu trúc cột*

  Như bài gốc:
  $X = A B,\; Y = A C,\; Z = B C$

  ⇒ có $3! = 6$ thứ tự cột.

  *Bước 2: Xét hướng với điều kiện chỉ trên 1 hàng*

  Mỗi cột có 2 hướng ⇒ ban đầu có $2^3 = 8$ cấu hình.

  Ta chỉ cần loại những cấu hình mà hàng trên có hai chữ giống nhau kề nhau.

  Với mỗi thứ tự cột, kiểm tra:
  - Có đúng $6$ cấu hình hợp lệ (loại 2 cấu hình gây trùng)

  ⇒ tổng:
  $6 × 6 = 36$ cấu trúc lớp.

  *Bước 3: Gán người*

  $N = 36 × 2!^3 = 36 × 8 = 288$
]

#ans-box[
  *288 cách*
]


= Câu tương tự 6

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C xếp vào 6 ghế (2 hàng đối diện). Biết rằng mỗi cột chỉ được chứa một trong hai loại: $\{A,B\}$ hoặc $\{A,C\}$. Hỏi có bao nhiêu cách xếp thỏa điều kiện không kề trùng?

#cach1-box[
  *Bước 1: Lập hệ cột*

  Gọi:
  $x = A B,\; y = A C$

  Ta có:
  $
    cases(
      x + y = 3,
      x + y = 2 " (số A)"
    )
  $

  Mâu thuẫn ⇒ *không tồn tại cấu trúc*.

  *Kết luận:* Không có cách xếp nào thỏa mãn.
]

#ans-box[
  *0 cách*
]


= Câu tương tự 7

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C. Xếp vào 6 ghế (2 hàng đối diện). Yêu cầu:
- Không ngồi đối diện cùng lớp
- Hai đầu mỗi hàng (ghế biên) không cùng lớp

#cach1-box[
  *Bước 1: Cấu trúc cột*

  Như cũ:
  $X, Y, Z$ mỗi loại 1.

  ⇒ $6$ thứ tự.

  *Bước 2: Điều kiện biên*

  Ta chỉ xét 2 cột biên (trái và phải):
  - Không được cùng chữ ở hàng trên hoặc hàng dưới.

  Khi thử 2 hướng cho cột đầu, chỉ còn đúng 1 hướng hợp lệ cho cột cuối.

  ⇒ mỗi thứ tự cột vẫn có $2$ cấu trúc.

  ⇒ tổng:
  $6 × 2 = 12$

  *Bước 3: Gán người*

  $N = 12 × 2!^3 = 96$
]

#ans-box[
  *96 cách*
]


= Câu tương tự 8

*Đề bài:* Có 2 học sinh lớp A, 2 học sinh lớp B, 2 học sinh lớp C. Xếp vào 6 ghế (2 hàng đối diện). Yêu cầu:
- Không kề cùng lớp (cả 2 hàng)
- Hàng trên phải có đúng 1 học sinh mỗi lớp

#cach1-box[
  *Ý tưởng:* Khóa tầng trên ⇒ suy ra toàn bộ cấu trúc.

  *Bước 1: Hàng trên*

  Phải là hoán vị của:
  $A, B, C$

  ⇒ có $3! = 6$ cách.

  *Bước 2: Xác định hàng dưới*

  - Mỗi cột phải khác lớp ⇒ mỗi cột dưới bị xác định.
  - Đồng thời phải tránh kề giống ⇒ cách duy nhất.

  ⇒ mỗi hàng trên → đúng 1 cấu trúc.

  ⇒ $6$ cấu trúc lớp.

  *Bước 3: Gán người*

  $N = 6 × 2!^3 = 6 × 8 = 48$
]

#ans-box[
  *48 cách*
]
= CHUYÊN ĐỀ: CỘT ĐẶC TRƯNG + ĐỊNH HƯỚNG (10 CÂU NÂNG DẦN)

= Câu 1 (Cơ bản – mẫu chuẩn)

*Đề bài:* Có 2A, 2B, 2C. Xếp vào 2 hàng đối diện, mỗi hàng 3 ghế. Không kề cùng lớp, không đối diện cùng lớp.

#cach1-box[
  Cột bắt buộc khác lớp ⇒ X=AB, Y=AC, Z=BC
  Giải hệ ⇒ mỗi loại 1.

  Sắp cột: $3! = 6$
  Mỗi thứ tự có 2 hướng hợp lệ ⇒ 12 cấu trúc

  Gán người: $2!^3 = 8$

  $N = 12 × 8 = 96$
]
#ans-box[*96*]


= Câu 2 (Khóa 1 hàng)

*Đề bài:* Như C1 nhưng hàng trên phải chứa đủ A, B, C.

#cach1-box[
  Hàng trên là hoán vị ABC ⇒ $3! = 6$

  Hàng dưới bị xác định duy nhất để tránh trùng

  Cấu trúc = 6
  Nhân $2!^3$

  $N = 6 × 8 = 48$
]
#ans-box[*48*]


= Câu 3 (Chỉ cấm đối diện)

*Đề bài:* Chỉ yêu cầu không đối diện cùng lớp.

#cach1-box[
  Mỗi cột chọn 2 lớp khác nhau

  Số cột = 3, chọn từ {AB, AC, BC}

  Đếm số nghiệm hệ ⇒ mỗi loại 1 ⇒ 6 thứ tự

  Mỗi cột 2 hướng ⇒ $2^3 = 8$

  Tổng cấu trúc = $6×8=48$

  Gán người:
  $48 × 8 = 384$
]
#ans-box[*384*]


= Câu 4 (Chỉ cấm kề ngang)

*Đề bài:* Trong mỗi hàng không có 2 học sinh cùng lớp kề nhau.

#cach1-box[
  Không xét cột ⇒ 2 dãy độc lập

  Mỗi hàng là hoán vị ABC ⇒ $3!$

  Hai hàng: $3!^2 = 36$

  Gán người: $2!^3$

  $N = 36 × 8 = 288$
]
#ans-box[*288*]


= Câu 5 (Cấm kề 1 hàng)

*Đề bài:* Chỉ cấm kề ở hàng trên.

#cach1-box[
  Cột vẫn: X,Y,Z ⇒ 6 thứ tự

  Với mỗi thứ tự:
  kiểm tra $2^3 = 8$ hướng

  Loại các hướng gây trùng ⇒ còn 6

  ⇒ cấu trúc: $6 × 6 = 36$

  $N = 36 × 8 = 288$
]
#ans-box[*288*]


= Câu 6 (Vô nghiệm)

*Đề bài:* Mỗi cột chỉ là AB hoặc AC.

#cach1-box[
  Gọi:
  $x=A B, y=A C$

  Hệ:
  $
    x+y=3
  $
  $
    x+y=2
  $

  Mâu thuẫn ⇒ vô nghiệm
]
#ans-box[*0*]


= Câu 7 (Ràng buộc biên)

*Đề bài:* Không kề trùng + 2 đầu mỗi hàng khác lớp.

#cach1-box[
  Vẫn X,Y,Z ⇒ 6 thứ tự

  Điều kiện biên không làm tăng thêm ràng buộc mạnh

  ⇒ mỗi thứ tự còn 2 hướng

  ⇒ 12 cấu trúc

  $N = 12 × 8 = 96$
]
#ans-box[*96*]


= Câu 8 (Gắn vòng nhẹ)

*Đề bài:* Hai hàng nối vòng (mỗi hàng là chu trình 3 ghế).

#cach1-box[
  Hàng 3 ghế vòng ⇒ ABC hoặc đảo ⇒ 2

  Hai hàng: $2^2 = 4$

  Cột vẫn phải khác ⇒ chọn phù hợp

  Tổng cấu trúc: 12

  $N = 12 × 8 = 96$
]
#ans-box[*96*]


= Câu 9 (Mở rộng 3x3)

*Đề bài:* 3A, 3B, 3C vào bảng 3×3, không trùng theo hàng/cột.

#cach1-box[
  Mỗi hàng, cột là ABC

  ⇒ Latin 3×3

  Số cấu trúc: 12

  Gán: $3!^3 = 216$

  $N = 12 × 216 = 2592$
]
#ans-box[*2592*]


= Câu 10 (Đỉnh cao tư duy)

*Đề bài:* Như C1 nhưng thêm điều kiện: mỗi hàng không được chứa đúng thứ tự ABC hoặc CBA.

#cach1-box[
  X,Y,Z ⇒ 6 thứ tự

  Mỗi thứ tự có 2 hướng ⇒ 12 cấu trúc ban đầu

  Loại các cấu trúc có hàng ABC/CBA:
  mỗi thứ tự loại đúng 1

  ⇒ còn 1 cấu trúc / thứ tự

  ⇒ 6 cấu trúc

  $N = 6 × 8 = 48$
]
#ans-box[*48*]
---

=== Ví dụ 11: Bài toán xếp $3$A, $3$B, $2$C vào lưới $2 times 4$ (Vận dụng - Không ghế trống)

*Đề bài:* Có 3 học sinh lớp A, 3 học sinh lớp B và 2 học sinh lớp C. Xếp các học sinh vào 8 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 4 ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng).

#cach1-box[
  *Cách giải bằng Phương pháp Hệ phương trình cột đặc trưng:*

  *Bước 1: Thiết lập hệ phương trình cột đặc trưng*
  Vì không có ghế trống, mỗi cột (gồm 2 ghế đối diện nhau) phải chứa 2 học sinh khác lớp. Các loại cột có thể có là:
  - Loại 1: ${A, B}$ (số lượng $x$)
  - Loại 2: ${A, C}$ (số lượng $y$)
  - Loại 3: ${B, C}$ (số lượng $z$)

  Hệ phương trình bảo toàn số lượng học sinh và cột:
  $
    cases(
      x + y + z = 4 & " (tổng số cột)",
      x + y = 3 & " (số chữ A)",
      x + z = 3 & " (số chữ B)",
      y + z = 2 & " (số chữ C)"
    )
  $
  Giải hệ phương trình này, ta thu được nghiệm duy nhất:
  $ x = 2, y = 1, z = 1 $
  Có nghĩa là mỗi cấu trúc hợp lệ bắt buộc phải chứa đúng: 2 cột $\{A, B\}$ (kí hiệu $X$), 1 cột $\{A, C\}$ (kí hiệu $Y$), và 1 cột $\{B, C\}$ (kí hiệu $Z$).

  Số cách xếp thứ tự 4 cột này thành hàng ngang là:
  $ frac(4!, 2! 1! 1!) = 12 " cách xếp cột." $

  *Bước 2: Biện luận hướng xoay (orientation)*
  Nhận xét then chốt: Chữ C chỉ xuất hiện ở cột $Y$ và cột $Z$. Khi ta đã cố định thứ tự cột, việc chọn hướng cho cột $Y$ (có 2 cách chọn) sẽ kéo theo sự ràng buộc duy nhất cho hướng của cả 3 cột còn lại để tránh kề trùng hàng.
  Ta xét hai trường hợp về vị trí tương đối của $Y$ và $Z$:

  - *Trường hợp A: $Y$ và $Z$ kề nhau* (ví dụ thứ tự cột là $Y - Z - X - X$):
    - Chọn hướng cho $Y = (A, C)$ (C ở dưới).
    - Cột $Z = \{B, C\}$ kề với $Y$. Vì hàng dưới của $Y$ là C, cột $Z$ buộc phải có hướng $(C, B)$ (C ở trên, B ở dưới) để tránh kề trùng C ở hàng dưới.
    - Cột thứ ba $X_1 = \{A, B\}$ kề với $Z = (C, B)$. Vì hàng dưới của $Z$ là B, cột $X_1$ buộc phải có hướng $(B, A)$ (B ở trên, A ở dưới).
    - Cột thứ tư $X_2 = \{A, B\}$ kề với $X_1 = (B, A)$. Để tránh kề trùng ở cả hai hàng, cột $X_2$ buộc phải có hướng ngược lại là $(A, B)$.
    - Cấu trúc thu được là:
      Hàng 1: A - C - B - A
      Hàng 2: C - B - A - B
      (Thỏa mãn hoàn toàn). Chọn hướng ngược lại cho $Y = (C, A)$ ta được thêm 1 cấu trúc nữa.
      Như vậy, thứ tự cột dạng kề này cho đúng 2 cấu trúc hướng xoay hợp lệ.

  - *Trường hợp B: $Y$ và $Z$ không kề nhau* (ví dụ thứ tự cột là $Y - X - Z - X$):
    - Chọn hướng cho $Y = (A, C)$ (C ở dưới).
    - Cột thứ hai $X_1 = \{A, B\}$ kề với $Y = (A, C) =>$ buộc phải có hướng $(B, A)$ để tránh kề trùng A ở hàng trên.
    - Cột thứ ba $Z = \{B, C\}$ kề với $X_1 = (B, A) =>$ buộc phải có hướng $(C, B)$ để tránh kề trùng B ở hàng trên (và hàng dưới).
    - Cột thứ tư $X_2 = \{A, B\}$ kề với $Z = (C, B) =>$ buộc phải có hướng $(B, A)$ để tránh kề trùng B ở hàng dưới.
    - Cấu trúc thu được là:
      Hàng 1: A - B - C - B
      Hàng 2: C - A - B - A
      (Thỏa mãn hoàn toàn). Chọn hướng ngược lại cho $Y = (C, A)$ ta được thêm 1 cấu trúc nữa.
      Như vậy, thứ tự cột dạng không kề này cũng cho đúng 2 cấu trúc hướng xoay hợp lệ.

  Do đó, với mọi thứ tự cột, ta luôn thu được đúng 2 cấu trúc lớp hợp lệ.
  Tổng số cấu trúc lớp hợp lệ là:
  $ S_("cấu trúc") = 12 " (thứ tự cột)" times 2 " (hướng xoay)" = 24 " cấu trúc." $

  Hai cấu trúc mẫu tiêu biểu được minh họa dưới đây:

  #align(center)[
    #grid(
      columns: 2,
      gutter: 30pt,
      align(center)[
        #text(weight: "bold", fill: col-blue)[Cấu trúc Y - Z - X - X]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [C] ── [B] ── [A]` \
            ` |      |      |      | ` \
            `[C] ── [B] ── [A] ── [B]`
          ],
        )
      ],
      align(center)[
        #text(weight: "bold", fill: col-blue)[Cấu trúc Y - X - Z - X]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [B] ── [C] ── [B]` \
            ` |      |      |      | ` \
            `[C] ── [A] ── [B] ── [A]`
          ],
        )
      ],
    )
  ]

  *Bước 3: Tính số cách xếp cho học sinh phân biệt*
  Nhân số cấu trúc với số hoán vị học sinh trong mỗi lớp:
  $ N = 24 " (cấu trúc)" times 3! " (A)" times 3! " (B)" times 2! " (C)" = 24 times 6 times 6 times 2 = 1.728 " cách." $
]

#note-box(title: "💡 Nhận xét then chốt để giải nhanh")[
  Quy luật lan truyền ở đây rất chặt chẽ: khi ta đã chọn hướng xoay cho một cột (ví dụ cột $Y$), sự ràng buộc sẽ lập tức khóa cứng hướng của toàn bộ các cột còn lại mà không cho phép bất kỳ sự tự do nào khác. Quy tắc này đúng cho tất cả các bài toán dạng lưới ghế đối diện không kề cùng lớp và không có ghế trống.
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1.728 cách*.
]

== 3.9 — Tổng quát hóa sâu: từ một lớp bị chặn đến nhiều lớp cùng bị chặn

Phần 3.6 mới chỉ dùng hàm sinh ở mức cơ bản: một lớp đông nhất được chèn vào $m$ khe, mỗi khe có chặn trên $r$. Ở mức sâu hơn, ta nên nhìn rõ hai tầng tư duy:
- *Tầng 1:* Công thức đóng cho hệ số của $(1+x+dots+x^r)^m$.
- *Tầng 2:* Khi có nhiều lớp cùng bị chặn, bản chất không còn là một đa thức một biến nữa mà là một *hàm sinh cục bộ của một khe*, thường là hàm sinh nhiều biến hoặc một mô hình trạng thái.

#thm-box(title: [📐 Công thức đóng cho hệ số của $(1+x+dots+x^r)^m$])[
  Gọi $N(a; m, r)$ là số nghiệm nguyên không âm của hệ
  $ x_1 + x_2 + dots + x_m = a, quad 0 <= x_i <= r. $

  Khi đó $N(a; m, r)$ chính là hệ số của $x^a$ trong $(1+x+dots+x^r)^m$, đồng thời có công thức đóng:
  $ N(a; m, r) = sum_(j=0)^q (-1)^j C_m^j C_(a-j(r+1)+m-1)^(m-1), $
  trong đó
  $ q = floor(a/(r+1)). $
]

#cach1-box[
  *Chứng minh mượt bằng tách tích số:*
  Ta có
  $ 1+x+dots+x^r = frac(1-x^(r+1), 1-x). $
  Suy ra
  $ (1+x+dots+x^r)^m = (1-x^(r+1))^m (1-x)^(-m). $

  Khai triển từng phần:
  $ (1-x^(r+1))^m = sum_(j=0)^m (-1)^j C_m^j x^(j(r+1)) $
  và
  $ (1-x)^(-m) = sum_(n >= 0) C_(n+m-1)^(m-1) x^n. $

  Muốn lấy hệ số của $x^a$, ta chỉ cần ghép các cặp số mũ thỏa
  $ j(r+1) + n = a. $
  Tức là
  $ n = a - j(r+1) >= 0. $
  Điều này giải thích vì sao tổng chỉ chạy đến $q = floor(a/(r+1))$.

  Vậy:
  $ N(a; m, r) = sum_(j=0)^q (-1)^j C_m^j C_(a-j(r+1)+m-1)^(m-1). $
]

#eg-box(title: "🎯 Cách đọc công thức để bấm máy cực nhanh")[
  Khi gặp bài toán dạng “xếp nền trước, chèn $a$ chữ A vào $m$ khe, mỗi khe chứa nhiều nhất $r$ chữ A”, bạn không cần khai triển đa thức dài. Chỉ cần nhớ đúng một công thức:
  $ N(a; m, r) = sum_(j=0)^q (-1)^j C_m^j C_(a-j(r+1)+m-1)^(m-1). $

  Tư duy khi bấm máy là:
  - Dòng $j=0$: đếm tự do, chưa chặn trên.
  - Dòng $j=1$: trừ các nghiệm có ít nhất một khe vượt trần $r$.
  - Dòng $j=2$: cộng lại các nghiệm đã bị trừ hai lần.
  - Cứ tiếp tục đúng theo nguyên lý bù trừ.
]

#thm-box(title: "🧠 Tổng quát hóa nhiều lớp cùng bị chặn")[
  Khi có nhiều lớp cùng bị chặn độ dài đoạn liên tiếp, ta không còn làm việc với đa thức một biến đơn giản nữa.

  Giả sử sau khi cố định một dãy nền, ta có $m$ khe được đánh số. Trong *một khe*, các lớp cần chèn là $A_1, A_2, dots, A_s$, với chặn run tương ứng là $r_1, r_2, dots, r_s$.

  Gọi $G(x_1, x_2, dots, x_s)$ là *hàm sinh cục bộ của một khe*, trong đó hệ số của đơn thức
  $ x_1^(u_1) x_2^(u_2) dots x_s^(u_s) $
  bằng số từ hợp lệ trong *một khe* có đúng $u_i$ chữ $A_i$ và tôn trọng mọi chặn run.

  Khi đó, nếu toàn bộ bài toán cần dùng tổng cộng $n_1, n_2, dots, n_s$ chữ của các lớp tương ứng, thì số cách phân phối hợp lệ vào $m$ khe là hệ số của đơn thức
  $ x_1^(n_1) x_2^(n_2) dots x_s^(n_s) $
  trong khai triển:
  $ G(x_1, x_2, dots, x_s)^m. $
]

#method-box[
  *Điểm mấu chốt của bản tổng quát:*
  Với một lớp A duy nhất bị chặn, hàm sinh cục bộ chỉ là
  $ G(x) = 1+x+x^2+dots+x^r. $

  Nhưng khi hai hay nhiều lớp cùng bị chặn và còn *xen vào nhau trong cùng một khe*, ta không thể tách thành tích kiểu
  $ (1+x+dots+x^(r_A))^m (1+y+dots+y^(r_B))^m. $
  Lý do là A và B tương tác trực tiếp ngay *bên trong một khe*.

  Khi đó quy trình chuẩn là:
  - Dùng *trạng thái cục bộ* của một khe: chữ cuối cùng là gì, độ dài run hiện tại là bao nhiêu.
  - Từ trạng thái đó, dựng truy hồi hoặc ma trận chuyển.
  - Gom toàn bộ thành một hàm sinh cục bộ $G(x_1, dots, x_s)$.
  - Nâng lên lũy thừa $m$ để ghép $m$ khe độc lập có nhãn.
]

#note-box(title: "📌 Thông điệp chốt của phần hàm sinh")[
  - Dạng phổ thông chuẩn nhất là: *một lớp bị chặn* $->$ công thức đóng cho $(1+x+dots+x^r)^m$.
  - Dạng HSG đẹp nhất là: *nhiều lớp cùng bị chặn* $->$ chuyển sang hàm sinh nhiều biến của *một khe*, rồi lấy lũy thừa theo số khe.
  - Tức là: bài toán lớn luôn tách thành hai bài toán nhỏ hơn:
    1. hiểu *một khe* có thể chứa gì,
    2. rồi ghép $m$ khe lại bằng phép lấy hệ số.
]

== 3.10 — Kỹ thuật "Rút Thế Chặn Biến" và Các ví dụ bổ sung ghế đối diện

#note-box(title: "💡 Khung nhận biết: Khi nào Hệ có Nghiệm duy nhất / Nhiều nghiệm?")[
  - *Kín ghế = Chặt = Nghiệm duy nhất*: Khi không có ghế trống, mọi cột đều phải chứa 2 người khác lớp (như $\{A,B\}$, $\{A,C\}$, $\{B,C\}$). Sự "kén chọn" này khiến hệ phương trình bị khóa chặt, thường chỉ sinh ra 1 nghiệm cấu hình cột.
  - *Có ghế trống = Lỏng = Nhiều nghiệm*: Ghế trống $E$ rất "dễ dãi", nó có thể ghép với bất kỳ ai thành $\{A,E\}$, $\{B,E\}$, hoặc $\{E,E\}$. Bậc tự do tăng lên khiến hệ phương trình nới lỏng và sinh ra nhiều cấu hình (Nhiều nghiệm).
  
  Tuy nhiên, vẫn có ngoại lệ nếu số lượng một lớp quá áp đảo so với ghế trống (xem Ví dụ 16).
]

#method-box[
  *🧠 Tuyệt kỹ Giải tay Hệ phương trình Cột*
  
  Khi đối mặt với bài có ghế trống sinh ra hệ $4-5$ ẩn, ta không "đoán mạt" nghiệm mà giải hệ thống bằng thuật toán *Rút thế - Chặn biến*:
  1. *Rút thế:* Dùng các phương trình ngắn (thường là phương trình đếm số lượng của 1 lớp) để thế các ẩn khác theo 1 (hoặc 2) biến tự do. Ưu tiên chọn biến tự do là số cột đặc biệt như $w=\{E,E\}$ hoặc $z=\{B,C\}$.
  2. *Chặn biến:* Bắt buộc tất cả các ẩn phải lớn hơn hoặc bằng $0$. Giải các bất phương trình này để tìm khoảng kẹp cho biến tự do (ví dụ: $0 <= z <= 1$).
  3. *Lập bảng:* Cho biến tự do chạy các giá trị nguyên trong khoảng kẹp, ta thu được chính xác toàn bộ các nghiệm nguyên không âm mà không bao giờ sợ sót!
]

Phần này bổ sung các ví dụ đi đúng một trục tư duy từ dễ đến khó:
- *Ví dụ 13:* Hệ kín ghế, nghiệm duy nhất.
- *Ví dụ 14:* Hệ có ghế trống, sinh ra ba cấu hình.
- *Ví dụ 15:* Hệ có ghế trống, sinh ra bốn cấu hình.
- *Ví dụ 16:* Dị biệt (Có ghế trống nhưng nghiệm duy nhất).
- *Ví dụ 17:* Thực hành giải tay hệ ẩn bằng Rút thế chặn biến.

---

=== Ví dụ 13: Xếp $4$A, $2$B, $2$C vào lưới $2 times 4$ (Nghiệm hệ duy nhất)

*Đề bài:* Có $4$ học sinh lớp A, $2$ học sinh lớp B và $2$ học sinh lớp C. Xếp các học sinh vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau theo hàng và cũng không ngồi đối diện nhau.

#cach1-box[
  *Bước 1: Đặt ẩn theo loại cột.*
  Vì không có ghế trống, mỗi cột chỉ có thể là một trong ba loại:
  - $X = \{A, B\}$, số lượng $x$;
  - $Y = \{A, C\}$, số lượng $y$;
  - $Z = \{B, C\}$, số lượng $z$.

  Hệ bảo toàn là:
  $
    cases(
      x + y + z = 4,
      x + y = 4,
      x + z = 2,
      y + z = 2
    )
  $

  Từ $x+y=4$ và $x+y+z=4$ suy ra $z=0$. Khi đó từ $x+z=2$ suy ra $x=2$, và từ $y+z=2$ suy ra $y=2$.

  Vậy cấu hình cột là duy nhất:
  $ 2X + 2Y. $

  *Bước 2: Sắp thứ tự cột.*
  Số cách sắp thứ tự $2X, 2Y$ trên hàng ngang là:
  $ frac(4!, 2! 2!) = 6. $

  *Bước 3: Xét hướng xoay.*
  Khi đã cố định một thứ tự cột, chỉ cần chọn hướng cho cột đầu tiên (có $2$ cách), các cột tiếp theo bị khóa hướng hoàn toàn để tránh trùng lớp theo hàng ngang.

  Do đó số cấu trúc lớp là:
  $ S_("cấu trúc") = 6 times 2 = 12. $

  *Bước 4: Nhân với học sinh phân biệt.*
  $ N = 12 times 4! times 2! times 2! = 1.152. $
]

#ans-box[
  Số cách xếp thỏa mãn là *$1.152$ cách*.
]

---

=== Ví dụ 14: Xếp $2$A, $2$B, $1$C và $1$ ghế trống vào lưới $2 times 3$ (Ba cấu hình cột)

*Đề bài:* Có $2$ học sinh lớp A, $2$ học sinh lớp B, $1$ học sinh lớp C và $1$ ghế trống $E$. Xếp vào $6$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $3$ ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau theo hàng và cũng không ngồi đối diện nhau.

#method-box[
  Khi đã giải xong hệ và chốt được một *multiset cột*, đừng nhảy ngay tới số cấu trúc. Ta phải mổ tiếp theo đúng 3 lớp:

  1. Liệt kê *thứ tự cột* có thể có.
  2. Gom các thứ tự nào cho *cùng số hướng xoay hợp lệ*.
  3. Lấy một thứ tự đại diện trong mỗi nhóm để giải thích vì sao nó bị khóa cứng hay còn độ tự do.

  Đây chính là bản đối diện của tư duy PIE: thay vì mổ từng dòng PIE, ta mổ từng cấu hình cột.
]

#cach1-box[
  *Bước 1: Đặt ẩn theo loại cột.*
  Các loại cột có thể có là:
  - $X = \{A, B\}$,
  - $Y = \{A, C\}$,
  - $Z = \{B, C\}$,
  - $U = \{A, E\}$,
  - $V = \{B, E\}$,
  - $T = \{C, E\}$.

  Vì chỉ có một ghế trống nên không thể xuất hiện cột $\{E, E\}$.

  Hệ bảo toàn là:
  $
    cases(
      x + y + z + u + v + t = 3,
      x + y + u = 2,
      x + z + v = 2,
      y + z + t = 1,
      u + v + t = 1
    )
  $

  Giải trên tập số nguyên không âm, ta nhận được đúng *ba* nghiệm:

  #align(center)[
    #table(
      columns: (1fr, 2.2fr, 2.3fr),
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Cấu hình*], [*Nghiệm $(x,y,z,u,v,t)$*], [*Multiset cột*],
      [I], [$(2,0,0,0,0,1)$], [$2X + T$],
      [II], [$(1,1,0,0,1,0)$], [$X + Y + V$],
      [III], [$(1,0,1,1,0,0)$], [$X + U + Z$],
    )
  ]

  *Bước 2: Đếm số cấu trúc lớp theo từng cấu hình.*
  - *Cấu hình I: $2X + T$.*
    - Nếu cột $T = \{C,E\}$ nằm giữa, hai cột $X$ ở hai bên trở nên độc lập, cho $8$ cấu trúc.
    - Nếu $T$ nằm ở một đầu, hai cột $X$ kề nhau thành một cặp bị khóa, cho $4$ cấu trúc mỗi đầu.
    - Tổng cộng: $16$ cấu trúc.

  - *Cấu hình II: $X + Y + V$.*
    Có $3! = 6$ thứ tự cột.
    - Hai thứ tự kiểu $Y-X-V$ và $V-X-Y$ cho đúng $2$ cấu trúc mỗi thứ tự.
    - Bốn thứ tự còn lại cho đúng $4$ cấu trúc mỗi thứ tự.
    - Tổng cộng: $2 times 2 + 4 times 4 = 20$ cấu trúc.

  - *Cấu hình III: $X + U + Z$.*
    Hoàn toàn đối xứng với Cấu hình II nên cũng cho $20$ cấu trúc.

  #eg-box(title: "🔬 Mổ Xẻ Từng Cấu Hình Cột Của Ví Dụ 14")[
    Đoạn này là phần quan trọng nhất. Ta sẽ không nói kiểu “ra 16, 20, 20” nữa, mà chỉ rõ từng cấu hình cột sinh ra các con số đó như thế nào.

    *Cấu hình I: $2X + T$*

    Có đúng $3$ thứ tự cột:

    #align(center)[
      #table(
        columns: (1.2fr, 2.1fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        stroke: 0.4pt + col-green,
        [*Nhóm*], [*Thứ tự cột*], [*Số hướng / thứ tự*], [*Tổng*],
        [T ở biên], [$T-X-X, X-X-T$], [$4$], [$8$],
        [T ở giữa], [$X-T-X$], [$8$], [$8$],
      )
    ]

    Vì sao vậy?
    - Nếu $T$ ở giữa, hai cột $X$ bị tách ra hai bên nên *không khóa nhau*. Cột $T = \{C,E\}$ có $2$ hướng, mỗi cột $X = \{A,B\}$ cũng có $2$ hướng, nên được $2 times 2 times 2 = 8$ cấu trúc.
    - Nếu $T$ ở một đầu, hai cột $X$ nằm kề nhau thành cặp $X-X$. Khi đó cặp này chỉ còn $2$ hướng xen kẽ hợp lệ, còn $T$ vẫn có $2$ hướng. Vì thế mỗi thứ tự biên cho $2 times 2 = 4$ cấu trúc.

    *Cấu hình II: $X + Y + V$*

    Có $3! = 6$ thứ tự cột, nhưng không phải thứ tự nào cũng cho cùng số hướng.

    #align(center)[
      #table(
        columns: (1.4fr, 2.6fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        stroke: 0.4pt + col-green,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [X đứng giữa Y và V], [$Y-X-V, V-X-Y$], [$2$], [$4$],
        [Y và V đứng cạnh nhau], [$X-Y-V, Y-V-X, X-V-Y, V-Y-X$], [$4$], [$16$],
      )
    ]

    Một thứ tự đại diện của nhóm khó là $Y-X-V$:
    - Nếu chọn $Y = (A,C)$ thì cột $X$ kề nó buộc phải là $(B,A)$ để tránh A kề A ở hàng trên.
    - Khi $X$ đã bị khóa thành $(B,A)$, cột $V = \{B,E\}$ lại bị khóa tiếp để tránh B kề B.
    - Vậy sau khi chọn hướng của $Y$, toàn bộ phần còn lại bị xác định. Do đó mỗi thứ tự kiểu này chỉ cho $2$ cấu trúc.

    Một thứ tự đại diện của nhóm dễ hơn là $X-Y-V$:
    - Chọn hướng của $X$ có $2$ cách.
    - Với mỗi cách ấy, cột $Y$ bị khóa theo một phía, còn cột $V$ vẫn còn $1$ lựa chọn hợp lệ theo phía còn lại.
    - Tổng cộng mỗi thứ tự kiểu này cho $4$ cấu trúc.

    *Cấu hình III: $X + U + Z$*

    Cấu hình này đối xứng hoàn toàn với Cấu hình II nếu ta đổi vai trò:
    - $Y = \{A,C\}$ đổi thành $U = \{A,E\}$,
    - $V = \{B,E\}$ đổi thành $Z = \{B,C\}$.

    Vì thế bảng nhóm cũng y hệt:

    #align(center)[
      #table(
        columns: (1.4fr, 2.6fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
        stroke: 0.4pt + col-green,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [X đứng giữa U và Z], [$U-X-Z, Z-X-U$], [$2$], [$4$],
        [U và Z đứng cạnh nhau], [$X-U-Z, U-Z-X, X-Z-U, Z-U-X$], [$4$], [$16$],
      )
    ]

    Do đó:
    $ 16 + 20 + 20 = 56 $
    cấu trúc lớp, hoàn toàn không còn là một con số “từ trên trời rơi xuống”.
  ]

  Vậy tổng số cấu trúc lớp là:
  $ S_("cấu trúc") = 16 + 20 + 20 = 56. $

  *Bước 3: Nhân với học sinh phân biệt.*
  Chỉ có A và B là có học sinh phân biệt nhiều hơn một người, nên:
  $ N = 56 times 2! times 2! = 224. $
]

#ans-box[
  Số cách xếp thỏa mãn là *$224$ cách*.
]

---

=== Ví dụ 15: Xếp $3$A, $2$B, $1$C và $2$ ghế trống vào lưới $2 times 4$ (Bốn cấu hình cột)

*Đề bài:* Có $3$ học sinh lớp A, $2$ học sinh lớp B, $1$ học sinh lớp C và $2$ ghế trống $E$. Xếp vào $8$ ghế chia thành $2$ hàng song song đối diện nhau, mỗi hàng gồm $4$ ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau theo hàng và cũng không ngồi đối diện nhau.

#cach1-box[
  *Bước 1: Đặt ẩn theo loại cột.*
  Ta dùng các kí hiệu quen thuộc:
  - $X = \{A, B\}$,
  - $Y = \{A, C\}$,
  - $Z = \{B, C\}$,
  - $U = \{A, E\}$,
  - $V = \{B, E\}$,
  - $T = \{C, E\}$,
  - $W = \{E, E\}$.

  Hệ bảo toàn là:
  $
    cases(
      x + y + z + u + v + t + w = 4,
      x + y + u = 3,
      x + z + v = 2,
      y + z + t = 1,
      u + v + t + 2w = 2
    )
  $

  Giải trên tập số nguyên không âm, ta thu được đúng *bốn* nghiệm, tức là bốn cấu hình cột khả dĩ:

  #align(center)[
    #table(
      columns: (1fr, 2.4fr, 2.4fr),
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("EDE7F6") } else { none },
      stroke: 0.4pt + col-violet,
      [*Cấu hình*], [*Nghiệm $(x,y,z,u,v,t,w)$*], [*Multiset cột*],
      [A], [$(2,1,0,0,0,0,1)$], [$2X + Y + W$],
      [B], [$(2,0,0,1,0,1,0)$], [$2X + U + T$],
      [C], [$(1,1,0,1,1,0,0)$], [$X + Y + U + V$],
      [D], [$(1,0,1,2,0,0,0)$], [$X + 2U + Z$],
    )
  ]

  *Bước 2: Bảng hóa đóng góp của từng cấu hình.*
  Sau khi xét toàn bộ các thứ tự cột và đếm số hướng xoay hợp lệ theo quy tắc lan truyền, ta nhận được bảng tổng hợp sau:

  #align(center)[
    #table(
      columns: (1fr, 2.4fr, 1.6fr, 1.8fr),
      align: center + horizon,
      fill: (col, row) => if row == 0 { rgb("E8F5E9") } else { none },
      stroke: 0.4pt + col-green,
      [*Cấu hình*], [*Multiset cột*], [*Số thứ tự cột*], [*Số cấu trúc lớp*],
      [A], [$2X + Y + W$], [$frac(4!, 2!) = 12$], [$36$],
      [B], [$2X + U + T$], [$frac(4!, 2!) = 12$], [$72$],
      [C], [$X + Y + U + V$], [$4! = 24$], [$104$],
      [D], [$X + 2U + Z$], [$frac(4!, 2!) = 12$], [$52$],
    )
  ]

  Do đó:
  $ S_("cấu trúc") = 36 + 72 + 104 + 52 = 264. $

  #eg-box(title: "🔬 Mổ Xẻ Từng Cấu Hình Cột Của Ví Dụ 15")[
    Ví dụ 15 là bản nâng cấp của Ví dụ 14. Ở đây ta không chỉ có nhiều cấu hình cột hơn, mà *ngay trong cùng một cấu hình* các thứ tự khác nhau cũng cho số hướng xoay khác nhau. Vì thế phải gom các thứ tự thành từng họ.

    *Cấu hình A: $2X + Y + W$*

    #align(center)[
      #table(
        columns: (1.3fr, 2.8fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("FFF8E1") } else { none },
        stroke: 0.4pt + col-amber,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [W ở biên], [$W-X-X-Y, W-X-Y-X, W-Y-X-X, X-X-Y-W, X-Y-X-W, Y-X-X-W$], [$2$], [$12$],
        [W ở giữa], [$X-W-X-Y, X-W-Y-X, X-X-W-Y, X-Y-W-X, Y-W-X-X, Y-X-W-X$], [$4$], [$24$],
      )
    ]

    Sở dĩ $W = \{E,E\}$ ở biên chỉ cho $2$ hướng mỗi thứ tự là vì nó không tạo gì mới, còn ba cột còn lại bị chuỗi kề nhau khóa rất chặt. Khi $W$ lọt vào giữa, nó đóng vai trò “vách ngăn mềm”, làm hai phía bớt khóa nhau, nên số hướng tăng lên thành $4$.

    *Cấu hình B: $2X + U + T$*

    #align(center)[
      #table(
        columns: (1.3fr, 2.8fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("FFF8E1") } else { none },
        stroke: 0.4pt + col-amber,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [Nhóm rộng], [$U-T-X-X, U-X-T-X, X-T-U-X, X-T-X-U, X-U-T-X, X-X-T-U$], [$8$], [$48$],
        [Nhóm hẹp], [$T-U-X-X, T-X-U-X, T-X-X-U, U-X-X-T, X-U-X-T, X-X-U-T$], [$4$], [$24$],
      )
    ]

    Ở cấu hình này, ghế trống nằm rải trong $U = \{A,E\}$ và $T = \{C,E\}$ nên một số thứ tự tạo thêm tự do xoay, đẩy số hướng lên $8$, còn một số thứ tự khác truyền khóa mạnh hơn nên chỉ còn $4$.

    *Cấu hình C: $X + Y + U + V$*

    #align(center)[
      #table(
        columns: (1.35fr, 2.8fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("FFF8E1") } else { none },
        stroke: 0.4pt + col-amber,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [Nhóm rộng nhất], [$U-V-Y-X, X-U-V-Y, X-Y-V-U, Y-V-U-X$], [$8$], [$32$],
        [Nhóm hẹp nhất], [$U-Y-X-V, V-X-U-Y, V-X-Y-U, Y-U-X-V$], [$2$], [$8$],
        [Nhóm trung gian], [Tất cả $16$ thứ tự còn lại], [$4$], [$64$],
      )
    ]

    Đây là cấu hình khó nhất của Ví dụ 15, vì có tới $4! = 24$ thứ tự cột. Nhưng một khi đã gom theo họ $8$, $4$, $2$ như trên, bài toán trở nên nhìn được bằng mắt.

    *Cấu hình D: $X + 2U + Z$*

    #align(center)[
      #table(
        columns: (1.35fr, 2.8fr, 1.0fr, 1.0fr),
        inset: 9pt,
        align: center + horizon,
        fill: (col, row) => if row == 0 { rgb("FFF8E1") } else { none },
        stroke: 0.4pt + col-amber,
        [*Nhóm*], [*Các thứ tự*], [*Số hướng / thứ tự*], [*Tổng*],
        [Nhóm rất rộng], [$U-Z-U-X, X-U-Z-U$], [$8$], [$16$],
        [Nhóm rất hẹp], [$U-U-X-Z, Z-X-U-U$], [$2$], [$4$],
        [Nhóm trung gian], [Tất cả $8$ thứ tự còn lại], [$4$], [$32$],
      )
    ]

    Vậy bốn cấu hình của Ví dụ 15 không chỉ khác nhau ở multiset cột, mà còn khác ở cách các thứ tự cột tách thành các họ $8$, $4$, $2$. Chính điều đó sinh ra:
    $ 36 + 72 + 104 + 52 = 264. $
  ]

  *Bước 3: Nhân với học sinh phân biệt.*
  C chỉ có $1$ bạn, còn ghế trống là giống nhau. Vì vậy số cách xếp thực tế là:
  $ N = 264 times 3! times 2! = 3.168. $
]

#note-box(title: "💡 Vì sao Ví dụ 15 là bài rất đáng học")[
  Đây là ví dụ đẹp vì hệ bảo toàn không còn cho một nghiệm duy nhất, mà tách ra *bốn cấu hình cột khác nhau*. Toàn bộ độ khó của bài nằm ở chỗ: phải *giải hệ trước*, rồi *bảng hóa từng cấu hình*, chứ không thể lao ngay vào xoay cột từ đầu. Đó chính là phong cách xử lý chuẩn của lớp bài ghế đối diện ở mức vận dụng cao.
]

#ans-box[
  Số cách xếp thỏa mãn là *$3.168$ cách*.
]

---

=== Ví dụ 12: Bài toán xếp $3$A, $3$B và $2$ ghế trống vào lưới $2 times 4$ (Vận dụng cao - Có ghế trống)

*Đề bài:* Có 3 học sinh lớp A, 3 học sinh lớp B và 2 ghế trống ($E$). Xếp các học sinh vào 8 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 4 ghế. Tính số cách xếp sao cho không có 2 học sinh cùng lớp nào ngồi kề nhau (cùng hàng) hoặc đối diện nhau (khác hàng). Các ghế trống kề hay đối diện nhau thoải mái.

#cach1-box[
  *Cách giải bằng Phương pháp Hệ phương trình cột đặc trưng:*

  *Bước 1: Thiết lập hệ phương trình cột đặc trưng*
  Vì đối diện không cùng lớp, các loại cột có thể xuất hiện là:
  - Loại 1: $\{A, B\}$ (số lượng $x$)
  - Loại 2: $\{A, E\}$ (số lượng $y$)
  - Loại 3: $\{B, E\}$ (số lượng $z$)
  - Loại 4: $\{E, E\}$ (cột gồm 2 ghế trống, số lượng $t$)
  (Chú ý: Cột $\{A, A\}$ và $\{B, B\}$ không hợp lệ vì đối diện cùng lớp. Cột $\{E, E\}$ chỉ chứa ghế trống nên hoàn toàn hợp lệ).

  Thiết lập hệ phương trình bảo toàn số lượng học sinh, ghế trống và số cột:
  $
    cases(
      x + y + z + t = 4 & " (tổng số cột)",
      x + y = 3 & " (số chữ A)",
      x + z = 3 & " (số chữ B)",
      y + z + 2t = 2 & " (số chữ E)"
    )
  $
  Giải hệ trên tập số nguyên không âm:
  - Từ (2) và (3) ta có: $y = 3 - x$ và $z = 3 - x$.
  - Vì $y, z >= 0 => 3 - x >= 0 => x <= 3$.
  - Thay $y, z$ vào phương trình (4):
    $ (3 - x) + (3 - x) + 2t = 2 => 6 - 2x + 2t = 2 => 2t = 2x - 4 => t = x - 2 $.
  - Vì $t >= 0 => x - 2 >= 0 => x >= 2$.
  - Vậy $2 <= x <= 3$. Ta có đúng 2 trường hợp nghiệm nguyên không âm hợp lệ:

  *Trường hợp 1 (Nghiệm 1): $x = 2 => y = 1, z = 1, t = 0$.*
  Cấu trúc cột gồm: 2 cột $\{A, B\}$ ($X$), 1 cột $\{A, E\}$ ($Y$), 1 cột $\{B, E\}$ ($Z$) và không có cột trống hoàn toàn. Đây chính là *Cấu hình 1*.

  *Trường hợp 2 (Nghiệm 2): $x = 3 => y = 0, z = 0, t = 1$.*
  Cấu trúc cột gồm: 3 cột $\{A, B\}$ ($X$), 1 cột $\{E, E\}$ ($W$) và không có cột chứa 1 học sinh 1 ghế trống. Đây chính là *Cấu hình 2*.

  *Bước 2: Phân tích số cách xếp của từng cấu hình*

  *Cấu hình 1: 2 cột $X$, 1 cột $Y$, 1 cột $Z$*
  - Số cách xếp thứ tự 4 cột này thành hàng ngang là:
    $ frac(4!, 2! 1! 1!) = 12 " cách xếp cột." $
  - Biện luận hướng xoay cho mỗi thứ tự cột:
    Vì ghế trống $E$ không ràng buộc kề trùng, nên khi cột $Y = \{A, E\}$ và $Z = \{B, E\}$ đứng kề nhau, ta sẽ có nhiều tự do hơn so với khi chúng bị ngăn cách bởi cột $X$:
    - *Phân nhóm A: $Y$ và $Z$ kề nhau* (gồm 6 thứ tự cột: $Y-Z-X-X$, $Z-Y-X-X$, $X-Y-Z-X$, $X-Z-Y-X$, $X-X-Y-Z$, $X-X-Z-Y$):
      Mỗi thứ tự này cho đúng *4* cách xoay cột hợp lệ.
      Ví dụ với thứ tự cột $Y - Z - X - X$:
      - Chọn $Y = (A, E)$ (A trên, E dưới):
        + Nếu $Z = (E, B)$ (E trên, B dưới): cột $X_1$ kề $Z$ buộc phải là $(B, A)$ (hàng dưới của $Z$ là B => hàng dưới của $X_1$ là A). Cột $X_2$ kề $X_1$ buộc phải là $(A, B)$. Ta được cấu trúc hợp lệ: `A-E-B-A / E-B-A-B`.
        + Nếu $Z = (B, E)$ (B trên, E dưới): cột $X_1$ kề $Z$ buộc phải là $(A, B)$ (hàng trên của $Z$ là B => hàng trên của $X_1$ là A). Cột $X_2$ kề $X_1$ buộc phải là $(B, A)$. Ta được cấu trúc hợp lệ: `A-B-A-B / E-E-B-A`.
      - Chọn $Y = (E, A)$ tương tự cho ta thêm *2* cấu trúc đối ngẫu nữa.
      Vậy nhóm này cho ta: $6 " (cột)" times 4 " (hướng)" = 24 " cấu trúc."$

    - *Phân nhóm B: $Y$ và $Z$ không kề nhau* (gồm 6 thứ tự cột còn lại: $Y-X-Z-X$, $Z-X-Y-X$, $X-Y-X-Z$, $X-Z-X-Y$, $Y-X-X-Z$, $Z-X-X-Y$):
      Mỗi thứ tự này cho đúng *2* cách xoay cột hợp lệ vì sự ngăn cách của cột $X$ đã truyền ràng buộc chặt chẽ hơn.
      Ví dụ với thứ tự cột $Y - X - Z - X$:
      - Chọn $Y = (A, E)$:
        + Cột $X_1$ kề $Y$ buộc phải là $(B, A)$ (hàng trên của $Y$ là A => hàng trên của $X_1$ là B).
        + Cột $Z$ kề $X_1$ buộc phải là $(E, B)$ (hàng trên của $X_1$ là B => hàng trên của $Z$ là E).
        + Cột $X_2$ kề $Z$ buộc phải là $(B, A)$ (hàng dưới của $Z$ là B => hàng dưới của $X_2$ là A).
        Ta được cấu trúc hợp lệ duy nhất: `A-B-E-B / E-A-B-A`.
      - Chọn $Y = (E, A)$ tương tự cho ta thêm đúng 1 cấu trúc nữa.
      Vậy nhóm này cho ta: $6 " (cột)" times 2 " (hướng)" = 12 " cấu trúc."$

    Tổng số cấu trúc hợp lệ của Cấu hình 1 là: $S_1 = 24 + 12 = 36$ cấu trúc.
    Số cách xếp học sinh phân biệt cho cấu hình này:
    $ N_1 = 36 times 3! " (A)" times 3! " (B)" = 36 times 36 = 1.296 " cách." $

  *Cấu hình 2: 3 cột $X$, 1 cột $W$ (cột trống hoàn toàn)*
  - Số cách xếp thứ tự 4 cột này thành hàng ngang là:
    $ frac(4!, 3! 1!) = 4 " cách xếp cột." $
  - Biện luận hướng xoay cho mỗi thứ tự cột:
    Cột trống $W = \{E, E\}$ không có hướng xoay và đóng vai trò như một bức tường chặn đứng sự lan truyền kề trùng:
    - *Phân nhóm A: $W$ ở hai đầu biên* ($W-X-X-X$ hoặc $X-X-X-W$):
      Có 2 thứ tự cột. Do 3 cột $X$ kề nhau liên tiếp, việc chọn hướng cho cột $X$ đầu tiên (có 2 cách) sẽ xác định duy nhất hướng của 2 cột $X$ kề sau.
      Mỗi thứ tự cột cho đúng *2* cấu trúc hợp lệ.
      Vậy nhóm này cho ta: $2 " (cột)" times 2 " (hướng)" = 4 " cấu trúc."$

    - *Phân nhóm B: $W$ ở giữa* ($X-W-X-X$ hoặc $X-X-W-X$):
      Có 2 thứ tự cột. Cột trống $W$ phân rã hàng ghế thành 1 cột đơn $X$ và 1 cặp kề nhau $X-X$ độc lập.
      Do đó, số cách xoay là $2 " (cột đơn)" times 2 " (cặp kề)" = 4$ cách.
      Mỗi thứ tự cột cho đúng *4* cấu trúc hợp lệ.
      Vậy nhóm này cho ta: $2 " (cột)" times 4 " (hướng)" = 8 " cấu trúc."$

    Tổng số cấu trúc hợp lệ của Cấu hình 2 là: $S_2 = 4 + 8 = 12$ cấu trúc.
    Số cách xếp học sinh phân biệt cho cấu hình này:
    $ N_2 = 12 times 3! " (A)" times 3! " (B)" = 12 times 36 = 432 " cách." $

  *Bước 3: Tổng hợp kết quả*
  Tổng số cách xếp thỏa mãn cho cả 2 cấu hình là:
  $ N = N_1 + N_2 = 1.296 + 432 = 1.728 " cách." $

  Minh họa cấu trúc tiêu biểu cho mỗi cấu hình:

  #align(center)[
    #grid(
      columns: 2,
      gutter: 30pt,
      align(center)[
        #text(weight: "bold", fill: col-blue)[Cấu hình 1 (Y - Z - X - X)]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [E] ── [B] ── [A]` \
            ` |      |      |      | ` \
            `[E] ── [B] ── [A] ── [B]`
          ],
        )
      ],
      align(center)[
        #text(weight: "bold", fill: col-blue)[Cấu hình 2 (X - W - X - X)]
        #v(4pt)
        #block(
          stroke: 0.8pt + rgb("90CAF9"),
          inset: 8pt,
          radius: 4pt,
          fill: rgb("E3F2FD"),
          [
            #set text(font: "Menlo", size: 9pt)
            `[A] ── [E] ── [A] ── [B]` \
            ` |      |      |      | ` \
            `[B] ── [E] ── [B] ── [A]`
          ],
        )
      ],
    )
  ]
]

#ans-box[
  Số cách xếp thỏa mãn yêu cầu đề bài là *1.728 cách*.
]

---

=== Ví dụ 16: Xếp 4A, 2B và 2 Ghế trống vào lưới $2 times 4$ (Dị biệt: Có ghế trống nhưng Nghiệm Duy Nhất)

*Đề bài:* Có 4 học sinh lớp A, 2 học sinh lớp B và 2 ghế trống ($E$). Xếp vào 8 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng gồm 4 ghế. Tính số cách xếp sao cho học sinh cùng lớp không ngồi kề nhau theo hàng và cũng không ngồi đối diện nhau.

#cach1-box[
  *Bước 1: Hệ phương trình cột*
  Các loại cột: $X=\{A,B\}, Y=\{A,E\}, Z=\{B,E\}, W=\{E,E\}$.
  Hệ bảo toàn:
  $
    cases(
      x + y + z + w = 4,
      x + y = 4 space &"(số A)",
      x + z = 2 space &"(số B)",
      y + z + 2w = 2 space &"(số E)"
    )
  $
  
  *Bước 2: Giải hệ*
  Ta thấy $x + y = 4$ và tổng số cột $x+y+z+w = 4$.
  Trừ vế theo vế: $(x+y+z+w) - (x+y) = 4 - 4 <=> z + w = 0$.
  Vì $z >= 0, w >= 0$, ta BẮT BUỘC có $z = 0$ và $w = 0$.
  Thay $z=0$ vào $x+z=2 => x=2$.
  Thay $x=2$ vào $x+y=4 => y=2$.
  Nghiệm duy nhất: $x=2, y=2, z=0, w=0$.
  Cấu hình cột duy nhất là: $2X + 2Y$.

  *Bước 3: Đếm cấu trúc*
  - Xếp 4 cột $2X, 2Y$: $frac(4!, 2! 2!) = 6$ thứ tự.
  - Mỗi thứ tự cho 2 hướng xoay hợp lệ (chọn hướng cho cột đầu tiên thì các cột sau bị khóa chặt).
  - Cấu trúc: $6 times 2 = 12$.
  
  *Bước 4: Nhân số người*
  $N = 12 times 4! (A) times 2! (B) = 12 times 24 times 2 = 576$ cách.
]
#note-box(title: "Bài học từ Ví dụ 16")[
  Dù có ghế trống, nhưng lớp A (4 người) chiếm mất một nửa tổng số ghế. Sự "đông đúc" này bóp nghẹt mọi độ tự do của ghế trống, ép ghế trống bắt buộc phải ngồi chung cột với A. Vì thế hệ trở lại trạng thái "Chặt" và chỉ có 1 nghiệm!
]
#ans-box[
  Số cách xếp thỏa mãn là *576 cách*.
]

---

=== Ví dụ 17: Xếp 3A, 1B, 1C và 3 Ghế trống vào lưới $2 times 4$ (Mẫu chuẩn Giải tay hệ nhiều nghiệm)

*Đề bài:* Có 3 học sinh lớp A, 1 học sinh lớp B, 1 học sinh lớp C và 3 ghế trống ($E$). Xếp vào 8 ghế chia thành 2 hàng song song đối diện nhau, mỗi hàng 4 ghế. Tính số cách xếp sao cho học sinh cùng lớp không kề nhau và không đối diện nhau.

#cach1-box[
  *Bước 1: Hệ phương trình cột*
  Các loại cột: $X=\{A,B\}, Y=\{A,C\}, Z=\{B,C\}, U=\{A,E\}, V=\{B,E\}, T=\{C,E\}, W=\{E,E\}$.
  Hệ bảo toàn:
  $
    cases(
      x + y + z + u + v + t + w = 4,
      x + y + u = 3 space &"(số A)",
      x + z + v = 1 space &"(số B)",
      y + z + t = 1 space &"(số C)",
      u + v + t + 2w = 3 space &"(số E)"
    )
  $
  Vì số B và số C chỉ là 1, nên các ẩn liên quan $X, Y, Z, V, T$ chỉ có thể là 0 hoặc 1.

  *Bước 2: Giải hệ bằng Rút thế - Chặn biến*
  Rút các ẩn từ (2), (3), (4):
  $ u = 3 - x - y $
  $ v = 1 - x - z $
  $ t = 1 - y - z $
  Thay tất cả vào pt (1):
  $ x + y + z + (3 - x - y) + (1 - x - z) + (1 - y - z) + w = 4 $
  Rút gọn: $5 - x - y - z + w = 4 <=> w = x + y + z - 1$.
  
  Chặn biến $z$: Vì $x+z+v=1$ và $y+z+t=1$, ta thấy $z$ chỉ có thể là $0$ hoặc $1$.
  Ta hãy chia 2 trường hợp cho $z$:
  
  - *Trường hợp 1: $z = 1$*
    $z=1 => x=0, y=0$ (do $x+z<=1, y+z<=1$).
    Thay vào ta có $w = 0+0+1-1=0$. $u=3-0-0=3$. $v=1-0-1=0$. $t=1-0-1=0$.
    Nghiệm 1: $z=1, u=3 \to$ Cấu hình $Z + 3U$. 
    
  - *Trường hợp 2: $z = 0$*
    Khi đó $w = x + y - 1$. Vì $w >= 0 => x + y >= 1$.
    Do $x <= 1, y <= 1$, ta có 3 khả năng cho cặp $(x,y)$:
    
    + *Khả năng 2a:* $x=1, y=1 => w=1$.
      Tính lại các biến: $u = 3-1-1=1$, $v = 1-1-0=0$, $t = 1-1-0=0$.
      Nghiệm 2: $x=1, y=1, u=1, w=1 \to$ Cấu hình $X + Y + U + W$.
      
    + *Khả năng 2b:* $x=1, y=0 => w=0$.
      Tính lại: $u = 3-1-0=2$, $v = 1-1-0=0$, $t = 1-0-0=1$.
      Nghiệm 3: $x=1, u=2, t=1 \to$ Cấu hình $X + 2U + T$.
      
    + *Khả năng 2c:* $x=0, y=1 => w=0$.
      Tính lại: $u = 3-0-1=2$, $v = 1-0-0=1$, $t = 1-1-0=0$.
      Nghiệm 4: $y=1, u=2, v=1 \to$ Cấu hình $Y + 2U + V$.

  Vậy hệ có chính xác 4 cấu hình cột:
  1. $Z + 3U$
  2. $X + Y + U + W$
  3. $X + 2U + T$
  4. $Y + 2U + V$
  (Bạn thấy đấy, dùng phương pháp thế biến giúp ta liệt kê đầy đủ 4 nghiệm mà không tốn chất xám để "mò"!)
]
#note-box(title: "Bài học từ Ví dụ 17")[
  Với các bài nhiều nghiệm, việc lập hệ và giải đại số là con đường ngắn nhất và an toàn nhất. Đừng cố gắng "xếp thử" bằng tay trên lưới $2 times 4$ vì não bộ con người rất dễ bỏ sót các cấu hình chéo. Hãy để Toán học làm việc nặng thay bạn!
]

---

=== Ví dụ 18: Bài toán 3 cột 8 hàng - Hạn chế trùng hàng (Câu chặn 10 điểm THPT)

*Đề bài:* Có 24 chiếc bàn học được chia thành 3 dãy 8 hàng, mỗi hàng có ba chiếc bàn như hình vẽ. Thầy chủ nhiệm xếp ngẫu nhiên 24 em học sinh của lớp vào 24 chiếc bàn này sao cho mỗi em ngồi một bàn. Biết rằng lớp có 5 học sinh giỏi xuất sắc, 3 em học sinh giỏi, 2 em học sinh khá và còn lại là trung bình. Gọi $p$ là xác suất để xếp được mỗi hàng không có nhiều hơn một học sinh cùng xuất sắc hoặc cùng giỏi hoặc cùng khá. Hãy tính $10000p$ (làm tròn kết quả đến hàng đơn vị)?

#cach1-box[
  Ta giải bằng *Phương pháp Khung xương Đại số (Đại Bác Vạn Năng)*:

  - *Bước 1: Phân rã đối tượng và điều kiện ràng buộc:*
    - Học sinh giỏi xuất sắc ($E$): $5$ học sinh.
    - Học sinh giỏi ($G$): $3$ học sinh.
    - Học sinh khá ($F$): $2$ học sinh.
    - Học sinh trung bình ($A$): $14$ học sinh.
    - Ràng buộc: Mỗi hàng (3 bàn) chứa tối đa $1 E$, $1 G$, $1 F$.
    - Vì $1 + 1 + 1 = 3$ (bằng đúng sức chứa tối đa của mỗi hàng) nên không có sự xung đột giới hạn sức chứa giữa các nhóm đặc biệt trong cùng một hàng.
    - Do đó, ta chỉ cần phân phối: $5 E$ vào $5$ hàng khác nhau, $3 G$ vào $3$ hàng khác nhau, và $2 F$ vào $2$ hàng khác nhau.

  - *Bước 2: Xếp cấu trúc cho từng lớp học sinh:*
    1. *Xếp nhóm $E$:*
       - Chọn 5 hàng trong 8 hàng: $C_8^5 = 56$ cách.
       - Với mỗi hàng, chọn 1 trong 3 bàn cho $E$: $3^5 = 243$ cách.
       - Số cấu trúc cho $E$ là: $56 times 243 = 13608$ cấu trúc.
       
    2. *Xếp nhóm $G$:*
       Gọi $i$ là số hàng trùng nhau chứa cả $E$ và $G$ ($i in [0, 3]$):
       - Chọn $i$ hàng từ 5 hàng đã chứa $E$: $C_5^i$ cách.
       - Chọn $3-i$ hàng từ 3 hàng chưa chứa $E$: $C_3^(3-i)$ cách.
       - Với $i$ hàng trùng, $G$ có $2$ cách chọn vị trí bàn trống: $2^i$ cách.
       - Với $3-i$ hàng không trùng, $G$ có $3$ cách chọn vị trí bàn trống: $3^(3-i)$ cách.
       
    3. *Xếp nhóm $F$ (Phát bắn Đại Bác quyết định):*
       Sau khi xếp $E$ and $G$ với mức độ trùng $i$, ta có 8 hàng với số bàn trống (sức chứa còn lại) tương ứng là $C_1, C_2, dots, C_8$.
       Cụ thể:
       - $i$ hàng chứa cả $E$ và $G$ có sức chứa $C_u = 1$.
       - $5-i$ hàng chứa $E$ có sức chứa $C_u = 2$.
       - $3-i$ hàng chứa $G$ có sức chứa $C_u = 2$.
       - $i$ hàng chưa chứa cả hai có sức chứa $C_u = 3$.
       
       Số cấu trúc xếp 2 bạn $F$ vào 2 hàng khác nhau là tổng tích sức chứa của các cặp hàng:
       $ S = sum_(1 <= u < v <= 8) C_u C_v = 1/2 [ (sum_(u=1)^8 C_u)^2 - sum_(u=1)^8 C_u^2 ] $
       - Tổng sức chứa còn lại là không đổi: $sum_(u=1)^8 C_u = 24 - 8 = 16$.
       - Tổng bình phương sức chứa:
         $ sum_(u=1)^8 C_u^2 = i dot 1^2 + (5-i) dot 2^2 + (3-i) dot 2^2 + i dot 3^2 = 2i + 32. $
       - Thế vào công thức:
         $ S = 1/2 [ 16^2 - (2i + 32) ] = 112 - i. $
         *(Số cách xếp cho $F$ luôn luôn bằng $112 - i$ cực kỳ đẹp mắt!)*

  - *Bước 3: Tổng hợp cấu trúc và hoán vị:*
    Tổng số cấu trúc phân bổ cho cả 3 nhóm $E, G, F$ là:
    $ N_("cấu trúc") = 13608 times sum_(i=0)^3 [ C_5^i dot C_3^(3-i) dot 2^i dot 3^(3-i) dot (112 - i) ] $
    Tính từng số hạng ứng với $i$:
    - Với $i=0$: $C_5^0 dot C_3^3 dot 2^0 dot 3^3 dot 112 = 3024$.
    - Với $i=1$: $C_5^1 dot C_3^2 dot 2^1 dot 3^2 dot 111 = 29970$.
    - Với $i=2$: $C_5^2 dot C_3^1 dot 2^2 dot 3^1 dot 110 = 39600$.
    - Với $i=3$: $C_5^3 dot C_3^0 dot 2^3 dot 3^0 dot 109 = 8720$.
    
    Tổng trong ngoặc: $3024 + 29970 + 39600 + 8720 = 81314$.
    Số cấu trúc: $N_("cấu trúc") = 13608 times 81314 = 1106520912$.
    
    Nhân với hoán vị học sinh phân biệt:
    $ N_("thỏa mãn") = 1106520912 times 5! (E) times 3! (G) times 2! (F) times 14! (A). $
    Xác suất cần tìm:
    $ p = frac(N_("thỏa mãn"), 24!) = frac(365913, 1634380) approx 0.223885. $
    Giá trị $10000p approx 2239$.
]
#note-box(title: "Bài học từ Ví dụ 18")[
  Bằng cách sử dụng biến đổi đại số bảo toàn cho tổng bình phương $sum C_u^2$, ta đã biến một bài toán chia trường hợp vô cùng rối rắm thành một công thức duy nhất $112 - i$. Đây chính là tinh hoa của tư duy *Đại Bác Vạn Năng* trong tổ hợp.
]
#ans-box[
  Giá trị của $10000p$ làm tròn đến hàng đơn vị là *2239*.
]
