#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.88em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1A237E"), rgb("283593"), rgb("3F51B5"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("1A237E")),
  inset: (left: 10pt, y: 5pt),
  text(fill: rgb("1A237E"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("E65100"), size: 11pt, weight: "bold", "▸ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu chủ đề ─────────────────────────────────────────
#let c-blue = rgb("1A237E")
#let c-orange = rgb("E65100")
#let c-green = rgb("2E7D32")
#let c-purple = rgb("4A148C")
#let c-slate = rgb("37474F")

// ─── Hộp lý thuyết ───────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("E8EAF6"),
  stroke: (left: 4pt + c-blue, rest: 0.8pt + rgb("C5CAE9")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Sư Phạm", body) = block(
  fill: rgb("E8F5E9"),
  stroke: (left: 4pt + c-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-green, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("FFF8E1"),
  stroke: (left: 4pt + rgb("F57C00"), rest: 0.6pt + rgb("FFE082")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: c-orange, weight: "bold")[🔑 Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FBE9E7"),
  stroke: (left: 4pt + c-orange, rest: 0.6pt + rgb("FFAB91")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: c-orange, weight: "bold")[⚠️ Lỗi Sai Thường Gặp]
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
  #text(fill: c-green, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let qopen(body) = block(
  fill: rgb("EDE7F6"),
  stroke: (left: 3pt + c-purple, rest: 0.5pt + rgb("D1C4E9")),
  radius: (right: 5pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: c-purple, weight: "bold", size: 9.5pt)[❓ Câu Hỏi Gợi Mở]
  #v(0.22em)
  #body
]

#let route-box(title: "🧭 Cách Nghĩ Chậm", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + rgb("EF6C00"), rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let cannon-box(title, body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 5pt + rgb("D84315"), rest: 0.7pt + rgb("FFAB91")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("BF360C"), weight: "bold")[🧨 #title]
  #v(0.35em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(
      rgb("0A192F"),
      rgb("0F3460"),
      rgb("16213E"),
      rgb("1A237E"),
      angle: 150deg,
    ),
    inset: (x: 2.2cm, y: 1.8cm),
    radius: 12pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold")[
      HƯỚNG TỚI HSG & ĐGNL — CHUYÊN ĐỀ TỔ HỢP & TIN HỌC
    ]
    #v(0.6em)
    #text(fill: white, size: 24pt, weight: "black")[Quy Hoạch Động & Đếm Đường Đi]
    #v(0.15em)
    #text(fill: rgb("80DEEA"), size: 15pt, style: "italic")[Dynamic Programming on DAGs]
    #v(0.4em)
    #text(fill: rgb("C5CAE9"), size: 13pt)[
      Khung tư duy thống nhất "State & Transition" để giải quyết mọi bài toán đếm đường đi phức tạp
    ]
    #v(1.2em)
    #line(length: 55%, stroke: 1.1pt + rgb("80DEEA"))
    #v(1em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      row-gutter: 0.3em,
      [#text(fill: rgb("FFF59D"), size: 20pt)[🕸️]],
      [#text(fill: rgb("80DEEA"), size: 20pt)[🔄]],
      [#text(fill: rgb("A5D6A7"), size: 20pt)[🚦]],
      [#text(fill: rgb("FFAB91"), size: 20pt)[🪙]],
      [#text(fill: rgb("F48FB1"), size: 20pt)[📊]],

      [#text(fill: rgb("FFF59D"), size: 8pt, weight: "bold")[Đồ thị\ DAG]],
      [#text(fill: rgb("80DEEA"), size: 8pt, weight: "bold")[Trạng thái\ (State)]],
      [#text(fill: rgb("A5D6A7"), size: 8pt, weight: "bold")[Chuyển đổi\ (Transition)]],
      [#text(fill: rgb("FFAB91"), size: 8pt, weight: "bold")[Chia tiền/\ Fibonacci]],
      [#text(fill: rgb("F48FB1"), size: 8pt, weight: "bold")[Bảng số\ Quy hoạch động]],
    )
    #v(1em)
    #text(fill: rgb("C5CAE9"), size: 9.5pt, style: "italic")[
      "Đừng nhớ hàng trăm công thức rời rạc. Chỉ cần trả lời: Ta đang ở đâu? Ta tới từ những hướng nào? Biên ở đâu?"
    ]
  ]
]

#v(1.2em)

// ═══════════════════════════════════════════════
// TỔNG QUAN: BẢN CHẤT LÀ ĐỒ THỊ DAG
// ═══════════════════════════════════════════════
= Tổng Quan: Đếm Đường Đi Là Quy Hoạch Động Trên DAG

#theory-box[
  #text(fill: c-blue, size: 11pt, weight: "bold")[
    🎯 Bản Chất Cốt Lõi
  ]
  #v(0.5em)
  Hầu hết học sinh học tổ hợp thường bị rối khi gặp các bài toán biến thể: đường đi trên lưới có ô cấm, đi có điều kiện đổi hướng, đi chẵn lẻ bước, toán chia kẹo Euler, leo cầu thang hay đếm dãy ngoặc Catalan. Học sinh thường cố nhớ các công thức rời rạc mà không thấy được sợi chỉ đỏ xuyên suốt:

  #v(0.35em)
  #align(center)[
    #text(fill: c-orange, weight: "bold")[Mọi bài toán đếm cấu trúc tuyến tính/mạng lưới đều là bài toán đếm số đường đi trên Đồ thị có hướng không chu trình (DAG - Directed Acyclic Graph).]
  ]

  #v(0.35em)
  Khi nhìn nhận dưới lăng kính đồ thị:
  - Mỗi cấu hình, mỗi tọa độ, hay mỗi bước phát triển được đại diện bởi một *Đỉnh* (gọi là trạng thái - **State**).
  - Mỗi bước di chuyển hợp lệ từ cấu hình này sang cấu hình khác được đại diện bởi một *Cung có hướng* (gọi là bước chuyển - **Transition**).
  - Do thời gian hay số bước đi luôn tăng lên (không thể quay lui thời gian), đồ thị này hoàn toàn không có chu trình (Acyclic).
  - Số cách đạt đến một trạng thái bằng tổng số cách đạt đến các trạng thái liền trước có cung hướng tới nó.

  #v(0.4em)
  #align(center)[
    #cetz.canvas(length: 1.3cm, {
      import cetz.draw: *

      // Draw Grid with values
      for i in range(3) {
        for j in range(3) {
          rect((i * 1.5, j * 1.5), (i * 1.5 + 1.0, j * 1.5 + 1.0), fill: rgb("E8EAF6"), stroke: 1.1pt + c-blue, radius: 2.5pt)
        }
      }

      // Base cases
      content((0.5, 0.5), text(size: 9pt, weight: "bold")[$f(0,0)=1$])
      content((2.0, 0.5), text(size: 9pt, weight: "bold")[$f(1,0)=1$])
      content((3.5, 0.5), text(size: 9pt, weight: "bold")[$f(2,0)=1$])

      content((0.5, 2.0), text(size: 9pt, weight: "bold")[$f(0,1)=1$])
      content((2.0, 2.0), text(size: 9pt, weight: "bold")[$f(1,1)=2$])
      content((3.5, 2.0), text(size: 9pt, weight: "bold")[$f(2,1)=3$])

      content((0.5, 3.5), text(size: 9pt, weight: "bold")[$f(0,2)=1$])
      content((2.0, 3.5), text(size: 9pt, weight: "bold")[$f(1,2)=3$])
      content((3.5, 3.5), text(size: 9pt, weight: "bold")[$f(2,2)=6$])

      // Draw transition arrows
      line((1.0, 0.5), (1.5, 0.5), mark: (end: "stealth"), stroke: 1pt + c-orange)
      line((2.5, 0.5), (3.0, 0.5), mark: (end: "stealth"), stroke: 1pt + c-orange)

      line((0.5, 1.0), (0.5, 1.5), mark: (end: "stealth"), stroke: 1pt + c-orange)
      line((0.5, 2.5), (0.5, 3.0), mark: (end: "stealth"), stroke: 1pt + c-orange)

      // Internal merges
      line((1.0, 2.0), (1.5, 2.0), mark: (end: "stealth"), stroke: 1.2pt + c-orange)
      line((2.0, 1.0), (2.0, 1.5), mark: (end: "stealth"), stroke: 1.2pt + c-orange)

      line((2.5, 2.0), (3.0, 2.0), mark: (end: "stealth"), stroke: 1.2pt + c-orange)
      line((3.5, 1.0), (3.5, 1.5), mark: (end: "stealth"), stroke: 1.2pt + c-orange)

      line((1.0, 3.5), (1.5, 3.5), mark: (end: "stealth"), stroke: 1.2pt + c-orange)
      line((2.0, 2.5), (2.0, 3.0), mark: (end: "stealth"), stroke: 1.2pt + c-orange)

      line((2.5, 3.5), (3.0, 3.5), mark: (end: "stealth"), stroke: 1.2pt + c-orange)
      line((3.5, 2.5), (3.5, 3.0), mark: (end: "stealth"), stroke: 1.2pt + c-orange)

      content((1.9, -0.4), text(size: 8.5pt, fill: c-orange, weight: "bold")[Sự lan tỏa và hội tụ của các phương án])
    })
  ]
]

#v(0.5em)

#insight-box(title: "💡 Tư duy Lưới vs Tư duy Đồ thị")[
  Trên lưới tọa độ phẳng thông thường, ta di chuyển từ $(0,0)$ đến $(M, N)$ bằng các bước sang phải $(+1, 0)$ hoặc lên trên $(0, +1)$.
  - **Tư duy thông thường:** Nghĩ về số cách chọn các bước đi ngang trong tổng số bước: $C_(M+N)^M$.
  - **Tư duy Đồ thị/DP:** Nhìn nhận mỗi giao lộ $(i, j)$ là một trạng thái $S(i, j)$. Để đến được $(i, j)$, bước cuối cùng chỉ có thể là từ trái sang: $(i-1, j) -> (i, j)$ hoặc từ dưới lên: $(i, j-1) -> (i, j)$. 
  - Điều này lập tức cho ta phương trình tích lũy: $f(i, j) = f(i-1, j) + f(i, j-1)$.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN I: KHUNG TƯ DUY THỐNG NHẤT
// ═══════════════════════════════════════════════
= Phần I — Khung Tư Duy Thống Nhất (4 Bước Cốt Lõi)

Để giải quyết một bài toán đếm hoặc tối ưu đường đi theo phong cách chuyên nghiệp "gặp đâu xử đó", học sinh cần tuân thủ nghiêm ngặt khung tư duy 4 bước sau:

#v(0.4em)

#route-box(title: "🧭 4 Bước Tư Duy Thiết Lập")[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 1.2em,
    row-gutter: 0.8em,
    text(fill: c-orange, weight: "bold", size: 14pt)["1"],
    [
      *Xác định STATE (Trạng thái):* 
      Đặt câu hỏi: *"Muốn biết ta đang ở đâu và có các thông tin gì để quyết định bước tiếp theo, ta cần lưu trữ những tham số nào?"*
      - *Cơ bản:* Chỉ cần tọa độ $(i, j)$.
      - *Nâng cao:* Cần thêm hướng di chuyển hiện tại, số lần đổi hướng còn lại, parity chẵn lẻ của số bước, hay tập hợp các chướng ngại vật đã thu thập.
      - Ký hiệu: $f(i, j, dots)$ đại diện cho số cách đến trạng thái đó.
    ],

    text(fill: c-orange, weight: "bold", size: 14pt)["2"],
    [
      *Xác định TRANSITION (Bước chuyển):*
      Đặt câu hỏi: *"Ngay trước khi đặt chân đến trạng thái hiện tại, ta có thể đứng ở những trạng thái nào?"*
      - Đây chính là phương thức tìm hệ thức truy hồi. Ta thiết lập phương trình biểu diễn trạng thái hiện tại bằng tổng các trạng thái liền trước:
        $ f("state") = sum_("prev") f("prev"). $
    ],

    text(fill: c-orange, weight: "bold", size: 14pt)["3"],
    [
      *Xác định BASE CASES (Điều kiện biên):*
      Đặt câu hỏi: *"Trạng thái khởi đầu nào có giá trị mặc định là 1? Trạng thái nào cấm hoặc không thể đạt tới (gán bằng 0)?"*
      - Thường thì vị trí xuất phát: $f(0, 0, dots) = 1$.
      - Các ô cấm, ô nằm ngoài biên lưới: $f(x, y, dots) = 0$.
    ],

    text(fill: c-orange, weight: "bold", size: 14pt)["4"],
    [
      *Xác định ORDER (Thứ tự tính toán):*
      Đặt câu hỏi: *"Ta phải tính toán các trạng thái theo thứ tự nào để khi tính một trạng thái mới, toàn bộ các trạng thái liền trước nó đã được tính xong?"*
      - Bản chất đây là việc tìm **Thứ tự topo** (Topological Sort) trên DAG.
      - Đối với lưới thông thường, ta duyệt từ trái sang phải, từ dưới lên trên.
    ],
  )
]

#v(0.6em)

#key-box[
  *Trọng tâm sư phạm:* Học sinh không cần học thuộc lòng công thức. Chỉ cần luyện tập trả lời nhuần nhuyễn 4 câu hỏi trên. Khi làm chủ được 4 bước này, học sinh đã nắm giữ chìa khóa vạn năng của Quy hoạch động và Đếm tổ hợp rời rạc.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN II: TIẾN TRÌNH DẠY HỌC HIỆU QUẢ
// ═══════════════════════════════════════════════
= Phần II — Tiến Trình Dạy Học Hiệu Quả Cho Học Sinh

Để học sinh thẩm thấu sâu sắc và không bị ngợp, giáo viên nên thiết kế bài giảng đi qua 3 giai đoạn chuyển đổi tư duy:

== Giai đoạn 1: Lan Số Trực Quan (Vẽ bảng số)
Học sinh thực hiện việc cộng dồn trực tiếp các con số trên lưới vẽ nháp. Đây là bước cực kỳ quan trọng để hình thành trực giác về sự "lan tỏa" và "tích lũy" phương án. Giáo viên cần yêu cầu học sinh làm bằng tay trên các lưới nhỏ ($3 times 3$, $4 times 4$) có các ô cấm.

== Giai đoạn 2: Thiết Lập Hệ Thức Truy Hồi
Học sinh chuyển đổi từ các con số cụ thể sang ký hiệu toán học $f(i, j)$ và tự viết ra hệ thức truy hồi. Học sinh phải mô tả được bằng lời: *"Số cách đi đến ô $(i,j)$ bằng số cách đi đến ô bên trái kề nó cộng với số cách đi đến ô bên dưới kề nó"*.

== Giai đoạn 3: Tấn Công Các Ràng Buộc "Biến Dạng"
Khi học sinh đã thành thạo lưới cơ bản, giáo viên giới thiệu các biến thể khó dần để kích thích tư duy mở rộng State. Các biến thể bao gồm:
1. **Lưới có ô cấm (Obstacles):** Cấm đi qua một số ô đặc biệt.
2. **Ràng buộc đổi hướng (Direction Constraints):** Không được đổi hướng liên tiếp, hoặc không được đổi hướng quá $K$ lần.
3. **Parity (Tính chẵn lẻ):** Đếm đường đi có số bước đi ngang là chẵn, hoặc đi dọc là lẻ.
4. **Trọng số (Weighted Paths):** Mỗi bước đi có một giá trị/chi phí, tính tổng chi phí hoặc đếm số đường đi có tổng chi phí bằng $S$.

#v(0.5em)

#warn-box[
  *Sai lầm phổ biến của học sinh:* Khi gặp bài toán có ràng buộc đổi hướng (ví dụ: không được đi thẳng liên tiếp 2 bước), học sinh vẫn cố sử dụng State đơn giản là $f(i, j)$. 
  Tại ô $(i, j)$, học sinh không biết bước trước đó đi ngang hay đi dọc để áp dụng điều kiện cấm. Điều này cho thấy State cũ thiếu thông tin. Phải mở rộng State thành $f(i, j, "hướng")$ để ghi nhớ hướng đi của bước cuối cùng.
]

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN III: NĂM BÀI TOÁN KINH ĐIỂN
// ═══════════════════════════════════════════════
= Phần III — Năm Bài Toán Kinh Điển Giải Bằng Khung Tư Duy

Dưới đây là 5 bài toán điển hình từ dễ đến khó được giải quyết trọn vẹn bằng Khung tư duy thống nhất.

== 3.1 Đường Đi Trên Lưới Có Ô Cấm & Bảng Số Trực Quan

#example-box(n: "1")[
  **Đề bài:** Một robot di chuyển trên lưới tọa độ từ ô $(0,0)$ đến ô $(M, N)$. Tại mỗi bước, robot chỉ được đi sang phải 1 đơn vị hoặc đi lên trên 1 đơn vị. Tuy nhiên, robot không được đi qua các ô thuộc tập hợp các ô cấm $O$. Hãy đếm số cách đi.
]

#v(0.4em)
**Phân tích bằng Khung tư duy:**

1. **State:** 
   Gọi $f(i, j)$ là số cách robot di chuyển từ $(0,0)$ đến ô $(i, j)$ thỏa mãn điều kiện.
2. **Transition:**
   Để đến $(i, j)$, robot chỉ có thể đi từ ô bên trái $(i-1, j)$ hoặc ô bên dưới $(i, j-1)$. Do đó:
   $ f(i, j) = f(i-1, j) + f(i, j-1). $
3. **Base cases:**
   - Điểm xuất phát: $f(0, 0) = 1$.
   - Nếu $(i, j) in O$ (ô cấm): $f(i, j) = 0$.
   - Nếu ngoài biên ($i < 0$ hoặc $j < 0$): $f(i, j) = 0$.
4. **Thứ tự tính:**
   Tính tuần tự theo hàng từ dưới lên trên, trong mỗi hàng tính từ trái sang phải (hoặc ngược lại).

#v(0.5em)

#tl(
  [
    Cho lưới kích thước $4 times 4$ từ ô $(0,0)$ đến ô $(3,3)$. Ô $(1,2)$ và $(2,1)$ là các ô cấm mà robot không được đi vào. Tính số cách robot đi từ $(0,0)$ đến $(3,3)$. Trình bày bằng phương pháp lan số quy hoạch động.
  ],
  loigiai: [
    Chúng ta tiến hành thiết lập bảng quy hoạch động và lan số theo công thức $f(i, j) = f(i-1, j) + f(i, j-1)$ với điều kiện cấm $f(1,2) = f(2,1) = 0$.

    - **Hàng 0 (j = 0):**
      - $f(0, 0) = 1$ (điểm xuất phát)
      - $f(1, 0) = f(0, 0) = 1$
      - $f(2, 0) = f(1, 0) = 1$
      - $f(3, 0) = f(2, 0) = 1$

    - **Hàng 1 (j = 1):**
      - $f(0, 1) = f(0, 0) = 1$
      - $f(1, 1) = f(0, 1) + f(1, 0) = 1 + 1 = 2$
      - $f(2, 1) = 0$ (ô cấm)
      - $f(3, 1) = f(2, 1) + f(3, 0) = 0 + 1 = 1$

    - **Hàng 2 (j = 2):**
      - $f(0, 2) = f(0, 1) = 1$
      - $f(1, 2) = 0$ (ô cấm)
      - $f(2, 2) = f(1, 2) + f(2, 1) = 0 + 0 = 0$
      - $f(3, 2) = f(2, 2) + f(3, 1) = 0 + 1 = 1$

    - **Hàng 3 (j = 3):**
      - $f(0, 3) = f(0, 2) = 1$
      - $f(1, 3) = f(0, 3) + f(1, 2) = 1 + 0 = 1$
      - $f(2, 3) = f(1, 3) + f(2, 2) = 1 + 0 = 1$
      - $f(3, 3) = f(2, 3) + f(3, 2) = 1 + 1 = 2$

    Bảng dưới đây minh họa trực quan sự phân bố của các giá trị trạng thái $f(i, j)$ trên lưới tọa độ thực tế:

    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        stroke: 0.5pt + rgb("#b2dfdb"),
        fill: (x, y) => if y == 0 { rgb("#004D40") } else if x == 0 { rgb("#E0F2F1") } else { white },
        inset: 7pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[Tọa độ y \ x],
          text(fill: white, weight: "bold")[0],
          text(fill: white, weight: "bold")[1],
          text(fill: white, weight: "bold")[2],
          text(fill: white, weight: "bold")[3],
        ),
        [*3*], [1], [1], [1], [**2**],
        [*2*], [1], [0 (Cấm)], [0], [1],
        [*1*], [1], [2], [0 (Cấm)], [1],
        [*0*], [1 (S)], [1], [1], [1],
      )
    ]

    Vậy số cách đi từ $(0,0)$ đến $(3,3)$ thỏa mãn đề bài là **2 cách**.
  ]
)

#pagebreak()

== 3.2 Bài Toán Leo Cầu Thang & Fibonacci Biến Thể

#example-box(n: "2")[
  **Đề bài:** Một người cần leo lên một cầu thang gồm $N$ bậc. Mỗi bước, người đó có thể bước lên $1$ bậc, $2$ bậc hoặc $3$ bậc. Tuy nhiên, để tiết kiệm sức, người này không được thực hiện hai bước nhảy $3$ bậc liên tiếp nhau. Hỏi có bao nhiêu cách leo lên đến bậc thứ $N$?
]

#v(0.4em)
**Phân tích bằng Khung tư duy:**

1. **State:**
   Nếu chỉ dùng $f(n)$ là số cách lên bậc $n$, ta không biết được bước cuối cùng đưa ta lên bậc $n$ là bước nhảy mấy bậc (đặc biệt là có phải bước nhảy 3 bậc hay không).
   Do đó, ta cần mở rộng trạng thái để lưu thông tin này:
   - Gọi $f(n, 0)$ là số cách lên bậc $n$ mà bước cuối cùng **không phải** là bước nhảy 3 bậc (nghĩa là bước cuối cùng dài 1 hoặc 2 bậc).
   - Gọi $f(n, 1)$ là số cách lên bậc $n$ mà bước cuối cùng **chính là** bước nhảy 3 bậc.
   - Tổng số cách lên bậc $n$ sẽ là: $S(n) = f(n, 0) + f(n, 1)$.

2. **Transition:**
   - Để đạt trạng thái $(n, 0)$ (bước cuối dài 1 hoặc 2 bậc):
     - Nếu bước cuối dài 1 bậc, trước đó ta ở bậc $n-1$. Bậc $n-1$ này có thể đạt được bằng bất kỳ cách nào (bước cuối của nó có thể là 1, 2 hoặc 3). Do đó đóng góp: $f(n-1, 0) + f(n-1, 1)$.
     - Nếu bước cuối dài 2 bậc, trước đó ta ở bậc $n-2$. Bậc $n-2$ này cũng đạt được tự do. Đóng góp: $f(n-2, 0) + f(n-2, 1)$.
     - Suy ra:
       $ f(n, 0) = [f(n-1, 0) + f(n-1, 1)] + [f(n-2, 0) + f(n-2, 1)] = S(n-1) + S(n-2). $
   - Để đạt trạng thái $(n, 1)$ (bước cuối dài 3 bậc):
     - Trước đó ta phải ở bậc $n-3$. Tuy nhiên, do cấm hai bước nhảy 3 bậc liên tiếp, bước đưa ta lên bậc $n-3$ **không được phép** là bước nhảy 3 bậc.
     - Suy ra:
       $ f(n, 1) = f(n-3, 0). $

3. **Base cases:**
   - Bậc 0: $f(0, 0) = 1$ (trạng thái xuất phát), $f(0, 1) = 0$.
   - Bậc 1: $f(1, 0) = f(0, 0) + f(0, 1) = 1$, $f(1, 1) = 0$.
   - Bậc 2: $f(2, 0) = S(1) + S(0) = 1 + 1 = 2$, $f(2, 1) = 0$.
   - Các giá trị âm: $f(n, c) = 0$ với $n < 0$.

4. **Thứ tự tính:**
   Tính từ $n = 3$ tăng dần đến $N$.

#v(0.5em)

#tln(
  [
    Tính số cách leo cầu thang $N=5$ bậc thỏa mãn điều kiện không có hai bước nhảy $3$ bậc liên tiếp nhau.
  ],
  [13],
  loigiai: [
    Áp dụng hệ thức truy hồi đã thiết lập:
    - Bậc 0: $f(0,0)=1, f(0,1)=0 => S(0)=1$
    - Bậc 1: $f(1,0)=1, f(1,1)=0 => S(1)=1$
    - Bậc 2: $f(2,0)=S(1)+S(0)=1+1=2, f(2,1)=0 => S(2)=2$

    - Bậc 3:
      - $f(3, 0) = S(2) + S(1) = 2 + 1 = 3$
      - $f(3, 1) = f(0, 0) = 1$
      - $=> S(3) = 3 + 1 = 4$

    - Bậc 4:
      - $f(4, 0) = S(3) + S(2) = 4 + 2 = 6$
      - $f(4, 1) = f(1, 0) = 1$
      - $=> S(4) = 6 + 1 = 7$

    - Bậc 5:
      - $f(5, 0) = S(4) + S(3) = 7 + 4 = 11$
      - $f(5, 1) = f(2, 0) = 2$
      - $=> S(5) = 11 + 2 = 13$

    Wait, hãy kiểm tra lại kỹ:
    - Với bậc 5: $f(5, 1) = f(2, 0) = 2$.
    - Đúng vậy, vì các cách lên bậc 2 mà bước cuối không phải bước 3 là: (1+1) và (2). Cả hai cách này sau khi cộng thêm bước nhảy 3 sẽ thành: (1+1+3) và (2+3), đều hợp lệ và kết thúc bằng bước nhảy 3 bậc.
    - $S(5) = 11 + 2 = 13$.

    Bảng theo dõi trạng thái các bước tính toán qua từng bậc:

    #align(center)[
      #table(
        columns: (1.5fr, 1.5fr, 1.5fr, 1.5fr),
        stroke: 0.5pt + rgb("#b2dfdb"),
        fill: (x, y) => if y == 0 { rgb("#004D40") } else if calc.odd(y) { rgb("#E0F2F1") } else { white },
        inset: 7pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[Bậc n],
          text(fill: white, weight: "bold")[Bước cuối ≠ 3 ($f(n,0)$)],
          text(fill: white, weight: "bold")[Bước cuối = 3 ($f(n,1)$)],
          text(fill: white, weight: "bold")[Tổng số cách ($S(n)$)],
        ),
        [*0*], [1], [0], [**1**],
        [*1*], [1], [0], [**1**],
        [*2*], [2], [0], [**2**],
        [*3*], [3], [1], [**4**],
        [*4*], [6], [1], [**7**],
        [*5*], [11], [2], [**13**],
      )
    ]

    Vậy số cách leo cầu thang 5 bậc là **13 cách**.
  ]
)

#pagebreak()

== 3.3 Bài Toán Đổi Tiền (Coin Change) Tổng Quát

#example-box(n: "3")[
  **Đề bài:** Cho một tập hợp gồm $C$ loại mệnh giá xu khác nhau: $d_1, d_2, dots, d_C$. Ta cần đổi số tiền có giá trị đúng bằng $S$. Hãy tính số cách phối hợp các đồng xu để có tổng bằng $S$ (không phân biệt thứ tự chọn xu).
]

#v(0.4em)
**Phân tích bằng Khung tư duy:**

1. **State:**
   Nếu chỉ lưu số tiền còn lại $s$, ta sẽ bị lặp cấu hình do đổi thứ tự chọn xu (ví dụ: chọn xu $2$ rồi xu $3$ giống chọn xu $3$ rồi xu $2$).
   Để tránh lặp, ta phải duyệt các đồng xu theo thứ tự cố định.
   - Gọi $f(s, i)$ là số cách tạo ra số tiền $s$ chỉ sử dụng các đồng xu thuộc tập gồm $i$ loại xu đầu tiên: $\{d_1, d_2, dots, d_i\}$.

2. **Transition:**
   Xét việc có sử dụng đồng xu mệnh giá $d_i$ hay không khi đang ở trạng thái $(s, i)$:
   - **Không dùng đồng xu $d_i$:** Toàn bộ số tiền $s$ phải được tạo ra từ $i-1$ loại xu trước đó. Số cách: $f(s, i-1)$.
   - **Có dùng ít nhất một đồng xu $d_i$:** Ta bớt đi một đồng xu $d_i$, số tiền còn lại cần tạo là $s - d_i$, và ta vẫn được phép tiếp tục dùng xu thứ $i$. Số cách: $f(s - d_i, i)$.
   - Hệ thức truy hồi:
     $ f(s, i) = f(s, i-1) + f(s - d_i, i). $

3. **Base cases:**
   - Số tiền bằng 0 luôn có đúng 1 cách (không chọn đồng nào): $f(0, i) = 1$ với mọi $i$.
   - Số tiền âm thì không thể đổi: $f(s, i) = 0$ với mọi $s < 0$.
   - Không sử dụng loại xu nào ($i = 0$): $f(s, 0) = 0$ với mọi $s > 0$.

4. **Thứ tự tính:**
   Quét $i$ từ $1$ đến $C$, với mỗi $i$ quét $s$ từ $1$ đến $S$.

#v(0.5em)

#tl(
  [
    Cho tập xu gồm 3 loại mệnh giá: $\{1, 2, 3\}$. Đếm số cách tạo ra số tiền $S=5$. Trình bày chi tiết bảng Quy hoạch động.
  ],
  loigiai: [
    Ta lập bảng Quy hoạch động với $s$ chạy từ $0$ đến $5$ và $i$ chạy từ $1$ đến $3$.
    Công thức truy hồi: $f(s, i) = f(s, i-1) + f(s - d_i, i)$.

    - **Khởi tạo:**
      - $f(0, i) = 1$ với mọi $i = 1, 2, 3$.
      - $f(s, 0) = 0$ với mọi $s > 0$.

    - **Bước 1: Chỉ dùng xu $\{1\}$ ($d_1 = 1$):**
      - $f(1, 1) = f(1, 0) + f(0, 1) = 0 + 1 = 1$
      - $f(2, 1) = f(2, 0) + f(1, 1) = 0 + 1 = 1$
      - Tương tự: $f(3, 1) = 1, f(4, 1) = 1, f(5, 1) = 1$ (chỉ có duy nhất 1 cách là toàn bộ xu 1).

    - **Bước 2: Dùng xu $\{1, 2\}$ ($d_2 = 2$):**
      - $f(1, 2) = f(1, 1) + f(1-2, 2) = 1 + 0 = 1$
      - $f(2, 2) = f(2, 1) + f(0, 2) = 1 + 1 = 2$  (Cách: 1+1, 2)
      - $f(3, 2) = f(3, 1) + f(1, 2) = 1 + 1 = 2$  (Cách: 1+1+1, 1+2)
      - $f(4, 2) = f(4, 1) + f(2, 2) = 1 + 2 = 3$  (Cách: 1+1+1+1, 1+1+2, 2+2)
      - $f(5, 2) = f(5, 1) + f(3, 2) = 1 + 2 = 3$  (Cách: 1+1+1+1+1, 1+1+1+2, 1+2+2)

    - **Bước 3: Dùng cả ba xu $\{1, 2, 3\}$ ($d_3 = 3$):**
      - $f(1, 3) = f(1, 2) + f(1-3, 3) = 1 + 0 = 1$
      - $f(2, 3) = f(2, 2) + f(2-3, 3) = 2 + 0 = 2$
      - $f(3, 3) = f(3, 2) + f(0, 3) = 2 + 1 = 3$  (Thêm cách: 3)
      - $f(4, 3) = f(4, 2) + f(1, 3) = 3 + 1 = 4$  (Thêm cách: 1+3)
      - $f(5, 3) = f(5, 2) + f(2, 3) = 3 + 2 = 5$  (Thêm cách: 1+1+3, 2+3)

    Bảng Quy hoạch động chi tiết:

    #align(center)[
      #table(
        columns: (1.5fr, 1.5fr, 1.5fr, 1.5fr),
        stroke: 0.5pt + rgb("#bdbdbd"),
        fill: (x, y) => if y == 0 { rgb("#1A237E") } else if x == 0 { rgb("#E8EAF6") } else { white },
        inset: 7pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[Số tiền s \ Loại xu],
          text(fill: white, weight: "bold")[i = 1 ({1})],
          text(fill: white, weight: "bold")[i = 2 ({1, 2})],
          text(fill: white, weight: "bold")[i = 3 ({1, 2, 3})],
        ),
        [*0*], [1], [1], [1],
        [*1*], [1], [1], [1],
        [*2*], [1], [2], [2],
        [*3*], [1], [2], [3],
        [*4*], [1], [3], [4],
        [*5*], [1], [3], [**5**],
      )
    ]

    Vậy số cách đổi số tiền $S=5$ từ tập xu $\{1, 2, 3\}$ là **5 cách**.
  ]
)

#pagebreak()

== 3.4 Đường Đi Catalan & Dãy Ngoặc Hợp Lệ

#example-box(n: "4")[
  **Đề bài:** Đếm số dãy ngoặc hợp lệ gồm $N$ dấu ngoặc mở "(" và $N$ dấu ngoặc đóng ")". 
]

#v(0.4em)
**Phân tích bằng Khung tư duy:**

1. **State:**
   Một dãy ngoặc được xây dựng từng ký tự một từ trái sang phải.
   Để đảm bảo tính hợp lệ của dãy ngoặc, tại mọi thời điểm, số dấu ngoặc đóng đã viết không được vượt quá số dấu ngoặc mở.
   - Gọi $f(o, c)$ là số cách viết dãy gồm $o$ dấu ngoặc mở và $c$ dấu ngoặc đóng thỏa mãn điều kiện hợp lệ ($o >= c$).

2. **Transition:**
   Để viết được trạng thái $(o, c)$, ký tự cuối cùng được thêm vào chỉ có thể là:
   - Thêm dấu ngoặc mở "(": Trước đó ta phải có $o-1$ dấu mở và $c$ dấu đóng. Số cách: $f(o-1, c)$.
   - Thêm dấu ngoặc đóng ")": Trước đó ta phải có $o$ dấu mở và $c-1$ dấu đóng. Số cách: $f(o, c-1)$.
   - Hệ thức truy hồi:
     $ f(o, c) = f(o-1, c) + f(o, c-1). $

3. **Base cases:**
   - Trạng thái bắt đầu: $f(0, 0) = 1$.
   - Điều kiện ràng buộc hợp lệ: Nếu $o < c$, gán $f(o, c) = 0$ (số ngoặc đóng vượt quá ngoặc mở).
   - Nếu ngoài biên ($o < 0$ hoặc $c < 0$): $f(o, c) = 0$.

4. **Thứ tự tính:**
   Quét $o$ từ $0$ đến $N$, với mỗi $o$ quét $c$ từ $0$ đến $o$ (để đảm bảo luôn thỏa mãn $o >= c$).

#v(0.5em)

#insight-box(title: "💡 Bản chất hình học: Nguyên lý Phản xạ (Reflection Principle)")[
  Ta có thể chuyển đổi bài toán đếm dãy ngoặc độ dài $2N$ sang bài toán đếm đường đi trên lưới tọa độ từ $(0,0)$ đến $(N,N)$:
  - Mỗi dấu ngoặc mở "(" tương ứng bước đi sang phải $(+1, 0)$.
  - Mỗi dấu ngoặc đóng ")" tương ứng bước đi lên trên $(0, +1)$.
  - Điều kiện số dấu ngoặc đóng không vượt quá số ngoặc mở ($o >= c$) tương đương với việc đường đi không được phép vượt qua (nằm phía trên) đường chéo $y=x$.
  
  Để tìm số đường đi hợp lệ, ta lấy tổng số đường đi tự do từ $(0,0)$ đến $(N,N)$ là $C_(2N)^N$, trừ đi số đường đi *không hợp lệ* (chạm hoặc vượt qua đường cản $y = x + 1$):
  - Với mỗi đường đi không hợp lệ, xét điểm đầu tiên nó chạm đường $y = x + 1$. Ta phản xạ phần đường đi trước điểm đó qua trục đối xứng $y = x + 1$.
  - Điểm bắt đầu $(0,0)$ phản xạ thành $(-1, 1)$.
  - Có sự tương ứng 1-1 giữa các đường đi không hợp lệ từ $(0,0) -> (N,N)$ và mọi đường đi từ $(-1, 1) -> (N,N)$.
  - Số đường đi từ $(-1, 1) -> (N,N)$ là: $C_(2N)^(N+1) = C_(2N)^(N-1)$.
  
  Từ đó, số cách đi hợp lệ chính là số Catalan thứ $N$:
  $ C_N = C_(2N)^N - C_(2N)^(N-1) = 1/(N+1) C_(2N)^N. $
]

#v(0.5em)

#tl(
  [
    Tính số dãy ngoặc hợp lệ có độ dài bằng 6 (tương ứng với $N=3$ dấu mở và $N=3$ dấu đóng). Hãy trình bày bằng cách thiết lập ma trận tam giác số.
  ],
  loigiai: [
    Ta tính các giá trị $f(o, c)$ với $0 <= c <= o <= 3$:

    - **Hàng o = 0:**
      - $f(0, 0) = 1$

    - **Hàng o = 1:**
      - $f(1, 0) = f(0, 0) + f(1, -1) = 1 + 0 = 1$
      - $f(1, 1) = f(0, 1) + f(1, 0) = 0 + 1 = 1$

    - **Hàng o = 2:**
      - $f(2, 0) = f(1, 0) + f(2, -1) = 1 + 0 = 1$
      - $f(2, 1) = f(1, 1) + f(2, 0) = 1 + 1 = 2$
      - $f(2, 2) = f(1, 2) + f(2, 1) = 0 + 2 = 2$

    - **Hàng o = 3:**
      - $f(3, 0) = f(2, 0) + f(3, -1) = 1 + 0 = 1$
      - $f(3, 1) = f(2, 1) + f(3, 0) = 2 + 1 = 3$
      - $f(3, 2) = f(2, 2) + f(3, 1) = 2 + 3 = 5$
      - $f(3, 3) = f(2, 3) + f(3, 2) = 0 + 5 = 5$

    Kết quả cuối cùng là $f(3, 3) = 5$. Đây chính là số Catalan thứ 3: $C_3 = 1/4 C_6^3 = 5$.
    Các dãy ngoặc cụ thể là:
    1. `((()))`
    2. `(()())`
    3. `(())()`
    4. `()(())`
    5. `()()()`

    Số cách tính được khớp hoàn hảo với lý thuyết Catalan.
  ]
)

#pagebreak()

== 3.5 Đường Đi Trên Lưới Với Ràng Buộc Đổi Hướng

#example-box(n: "5")[
  **Đề bài:** Một robot đi từ $(0,0)$ đến $(M, N)$ trên lưới. Robot chỉ được đi sang phải (R) hoặc đi lên (U). Đếm số đường đi thỏa mãn điều kiện robot **không được đi cùng một hướng liên tiếp quá 2 bước** (nghĩa là không được đi RRR hoặc UUU).
]

#v(0.4em)
**Phân tích bằng Khung tư duy:**

1. **State:**
   Để kiểm tra xem robot có đi quá 2 bước cùng hướng hay không, ta phải nhớ:
   - Bước trước đó robot đi hướng nào?
   - Robot đã đi liên tiếp bao nhiêu bước theo hướng đó?
   Do đó, ta định nghĩa State mở rộng gồm 4 tham số:
   - $f(i, j, "R", 1)$: số cách đến $(i, j)$ mà bước cuối là đi sang phải (R) và đây là bước R liên tiếp đầu tiên.
   - $f(i, j, "R", 2)$: số cách đến $(i, j)$ mà bước cuối là đi sang phải (R) và đây là bước R liên tiếp thứ hai.
   - $f(i, j, "U", 1)$: số cách đến $(i, j)$ mà bước cuối là đi lên (U) và đây là bước U liên tiếp đầu tiên.
   - $f(i, j, "U", 2)$: số cách đến $(i, j)$ mà bước cuối là đi lên (U) và đây là bước U liên tiếp thứ hai.

2. **Transition:**
   - Để đến $(i, j)$ bằng bước đi sang phải R:
     - Nếu là bước R thứ nhất liên tiếp, bước trước đó phải là bước đi lên U (độ dài liên tiếp có thể là 1 hoặc 2):
       $ f(i, j, "R", 1) = f(i-1, j, "U", 1) + f(i-1, j, "U", 2). $
     - Nếu là bước R thứ hai liên tiếp, bước trước đó phải là bước R thứ nhất liên tiếp:
       $ f(i, j, "R", 2) = f(i-1, j, "R", 1). $
   - Để đến $(i, j)$ bằng bước đi lên U:
     - Nếu là bước U thứ nhất liên tiếp, bước trước đó phải là bước đi sang phải R (độ dài liên tiếp có thể là 1 hoặc 2):
       $ f(i, j, "U", 1) = f(i, j-1, "R", 1) + f(i, j-1, "R", 2). $
     - Nếu là bước U thứ hai liên tiếp, bước trước đó phải là bước U thứ nhất liên tiếp:
       $ f(i, j, "U", 2) = f(i, j-1, "U", 1). $

3. **Base cases:**
   - Tại gốc $(0,0)$: Ta coi như robot có thể bắt đầu bằng bất kỳ hướng nào, tuy nhiên để chuẩn mực hơn, ta thiết lập tại bước đi đầu tiên từ $(0,0)$:
     - Đi sang $(1, 0)$ chỉ có 1 cách: $f(1, 0, "R", 1) = 1$. Tất cả các trạng thái khác tại $(1,0)$ bằng 0.
     - Đi sang $(0, 1)$ chỉ có 1 cách: $f(0, 1, "U", 1) = 1$. Tất cả các trạng thái khác tại $(0,1)$ bằng 0.
   - Các ô ngoài biên có giá trị bằng 0.

4. **Thứ tự tính:**
   Tính lần lượt từng ô $(i, j)$ theo thứ tự topo từ trái qua phải, từ dưới lên trên.

#v(0.5em)

#tln(
  [
    Tính số đường đi thỏa mãn điều kiện robot không được đi cùng một hướng liên tiếp quá 2 bước trên lưới kích thước $3 times 3$ (từ $(0,0)$ đến $(2,2)$).
  ],
  [6],
  loigiai: [
    Ta tính giá trị các trạng thái cho từng ô của lưới $3 times 3$ (tức là $i$ chạy từ $0$ đến $2$, $j$ chạy từ $0$ đến $2$):

    - **Tại (0, 0):** Điểm xuất phát.
    - **Tại (1, 0):** $f(1, 0, "R", 1) = 1$. Các cái khác bằng 0.
    - **Tại (0, 1):** $f(0, 1, "U", 1) = 1$. Các cái khác bằng 0.

    - **Tại (2, 0):** 
      - $f(2, 0, "R", 2) = f(1, 0, "R", 1) = 1$. Các cái khác bằng 0.
    - **Tại (0, 2):** 
      - $f(0, 2, "U", 2) = f(0, 1, "U", 1) = 1$. Các cái khác bằng 0.

    - **Tại (1, 1):**
      - $f(1, 1, "R", 1) = f(0, 1, "U", 1) + f(0, 1, "U", 2) = 1 + 0 = 1$
      - $f(1, 1, "U", 1) = f(1, 0, "R", 1) + f(1, 0, "R", 2) = 1 + 0 = 1$
      - $f(1, 1, "R", 2) = 0$, $f(1, 1, "U", 2) = 0$.

    - **Tại (2, 1):**
      - $f(2, 1, "R", 1) = f(1, 1, "U", 1) + f(1, 1, "U", 2) = 1 + 0 = 1$
      - $f(2, 1, "R", 2) = f(1, 1, "R", 1) = 1$
      - $f(2, 1, "U", 1) = f(2, 0, "R", 1) + f(2, 0, "R", 2) = 0 + 1 = 1$
      - $f(2, 1, "U", 2) = f(2, 0, "U", 1) = 0$

    - **Tại (1, 2):**
      - $f(1, 2, "R", 1) = f(0, 2, "U", 1) + f(0, 2, "U", 2) = 0 + 1 = 1$
      - $f(1, 2, "R", 2) = f(0, 2, "R", 1) = 0$
      - $f(1, 2, "U", 1) = f(1, 1, "R", 1) + f(1, 1, "R", 2) = 1 + 0 = 1$
      - $f(1, 2, "U", 2) = f(1, 1, "U", 1) = 1$

    - **Tại (2, 2):**
      - $f(2, 2, "R", 1) = f(1, 2, "U", 1) + f(1, 2, "U", 2) = 1 + 1 = 2$
      - $f(2, 2, "R", 2) = f(1, 2, "R", 1) = 1$
      - $f(2, 2, "U", 1) = f(2, 1, "R", 1) + f(2, 1, "R", 2) = 1 + 1 = 2$
      - $f(2, 2, "U", 2) = f(2, 1, "U", 1) = 1$

    Tổng số cách đi hợp lệ đến $(2, 2)$ là:
    $N = f(2, 2, "R", 1) + f(2, 2, "R", 2) + f(2, 2, "U", 1) + f(2, 2, "U", 2) = 2 + 1 + 2 + 1 = 6$ cách.
    
    Wait, hãy kiểm tra lại kỹ:
    - Robot đi từ $(0,0)$ đến $(2,2)$. Tổng số bước đi luôn là 4 bước (2 bước R, 2 bước U).
    - Mọi hoán vị của $\{R, R, U, U\}$ đều có độ dài chuỗi tối đa của một ký tự là 2, nên tất cả các hoán vị đều thỏa mãn điều kiện (không thể có RRR hay UUU vì chỉ có tối đa 2 bước R và 2 bước U).
    - Tổng số hoán vị của $\{R, R, U, U\}$ là: $C_4^2 = 6$ cách.
    - Phép tính DP của chúng ta ra kết quả là 6.
    - Kết quả hoàn toàn chính xác! 
  ]
)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV: HỆ THỐNG BÀI TẬP VẬN DỤNG CAO
// ═══════════════════════════════════════════════
= Phần IV — Hệ Thống Bài Tập Vận Dụng Cao

Hệ thống bài tập dưới đây được chọn lọc từ các kỳ thi học sinh giỏi và đánh giá năng lực, giúp học sinh rèn luyện tư duy thực tế và kỹ năng thiết lập mô hình.

#v(0.5em)

#tn(
  [
    Một người đứng ở gốc tọa độ $(0,0)$ muốn đi đến điểm $(4, 3)$. Mỗi bước đi, người đó chỉ được đi sang phải 1 đơn vị hoặc đi lên trên 1 đơn vị. Tuy nhiên, do một sự kiện đặc biệt, người đó không được đi qua hai đoạn thẳng nối từ $(1,1)$ đến $(2,1)$ và đoạn nối từ $(2,1)$ đến $(2,2)$. Số cách đi hợp lệ là:
  ],
  (
    [$18$],
    [$22$],
    True([$20$]),
    [$30$]
  ),
  loigiai: [
    Bài toán này cấm robot đi qua một số *Cạnh* (đoạn nối) chứ không cấm ô (đỉnh).
    Ta áp dụng Quy hoạch động với State là $f(i, j)$ - số cách đến ô $(i, j)$.

    - **Hệ thức transition:**
      $ f(i, j) = f(i-1, j) + f(i, j-1) $
      Tuy nhiên, ta phải áp dụng điều kiện cấm cạnh:
      - Cạnh nối $(1,1) -> (2,1)$ bị cấm: Khi tính $f(2, 1)$, nhánh từ $(1, 1)$ sang ngang bị loại bỏ. Tức là ta chỉ tính nhánh đi lên từ $(2, 0)$:
        $ f(2, 1) = f(2, 0) $ (bỏ đi $f(1, 1)$).
      - Cạnh nối $(2,1) -> (2,2)$ bị cấm: Khi tính $f(2, 2)$, nhánh đi lên từ $(2, 1)$ bị loại bỏ. Tức là ta chỉ tính nhánh đi ngang từ $(1, 2)$:
        $ f(2, 2) = f(1, 2)$ (bỏ đi $f(2, 1)$).

    Ta tiến hành lan số trên bảng Quy hoạch động:
    - **Hàng 0 (j = 0):** $f(0,0)=1, f(1,0)=1, f(2,0)=1, f(3,0)=1, f(4,0)=1$
    - **Hàng 1 (j = 1):**
      - $f(0,1) = 1$
      - $f(1,1) = f(0,1) + f(1,0) = 1 + 1 = 2$
      - $f(2,1) = f(2,0) = 1$ (cấm cạnh từ $(1,1)$)
      - $f(3,1) = f(2,1) + f(3,0) = 1 + 1 = 2$
      - $f(4,1) = f(3,1) + f(4,0) = 2 + 1 = 3$

    - **Hàng 2 (j = 2):**
      - $f(0,2) = 1$
      - $f(1,2) = f(0,2) + f(1,1) = 1 + 2 = 3$
      - $f(2,2) = f(1,2) = 3$ (cấm cạnh từ $(2,1)$)
      - $f(3,2) = f(2,2) + f(3,1) = 3 + 2 = 5$
      - $f(4,2) = f(3,2) + f(4,1) = 5 + 3 = 8$

    - **Hàng 3 (j = 3):**
      - $f(0,3) = 1$
      - $f(1,3) = f(0,3) + f(1,2) = 1 + 3 = 4$
      - $f(2,3) = f(1,3) + f(2,2) = 4 + 3 = 7$
      - $f(3,3) = f(2,3) + f(3,2) = 7 + 5 = 12$
      - $f(4,3) = f(3,3) + f(4,2) = 12 + 8 = 20$
      
    Kiểm chứng toán học bằng tổ hợp và nguyên lý Bao hàm - Loại trừ:
    - Tổng số đường đi tự do từ $(0,0)$ đến $(4,3)$ là $C_7^3 = 35$ cách.
    - Số đường đi đi qua đoạn $(1,1) -> (2,1)$:
      - Đi từ $(0,0)$ đến $(1,1)$ có $C_2^1 = 2$ cách.
      - Đi từ $(2,1)$ đến $(4,3)$ có $C_4^2 = 6$ cách.
      - Số đường đi qua cạnh này: $2 times 6 = 12$ cách.
    - Số đường đi đi qua đoạn $(2,1) -> (2,2)$:
      - Đi từ $(0,0)$ đến $(2,1)$ có $C_3^1 = 3$ cách.
      - Đi từ $(2,2)$ đến $(4,3)$ có $C_3^1 = 3$ cách.
      - Số đường đi qua cạnh này: $3 times 3 = 9$ cách.
    - Số đường đi đi qua CẢ HAI đoạn $(1,1) -> (2,1)$ và $(2,1) -> (2,2)$:
      - Robot đi: $(0,0) -> (1,1) -> (2,1) -> (2,2) -> (4,3)$
      - Số cách đi từ $(0,0)$ đến $(1,1)$ là $C_2^1 = 2$ cách.
      - Số cách đi từ $(2,2)$ đến $(4,3)$ là $C_3^1 = 3$ cách.
      - Số cách đi qua cả hai: $2 times 3 = 6$ cách.
    - Theo nguyên lý bao hàm - loại trừ, số đường đi đi qua ít nhất một trong hai cạnh cấm là:
      $ 12 + 9 - 6 = 15. $
    - Số cách đi hợp lệ là:
      $ 35 - 15 = 20. $

    Vậy số cách đi hợp lệ là **20 cách**.
  ]
)

#v(0.5em)

#tn(
  [
    Một người di chuyển lên một cầu thang gồm $10$ bậc (được đánh số từ 0 đến 10). Mỗi bước đi, người đó chỉ được nhảy lên 1 bậc hoặc 2 bậc. Tuy nhiên, hai bậc số 4 và bậc số 7 bị hỏng nên người đó không được giẫm chân vào. Số cách leo lên đến bậc số 10 là:
  ],
  (
    [$3$],
    True([$6$]),
    [$8$],
    [$12$]
  ),
  loigiai: [
    Đây là bài toán đếm đường đi trên lưới 1D (leo cầu thang) có ô cấm.
    - **State:** Gọi $f(n)$ là số cách leo lên đến bậc $n$.
    - **Transition:** Với mỗi bậc $n$, ta có thể nhảy lên từ bậc $n-1$ hoặc $n-2$. Do đó:
      $ f(n) = f(n-1) + f(n-2). $
    - **Base cases & Cấm:**
      - Xuất phát: $f(0) = 1, f(1) = 1$.
      - Bậc hỏng: $f(4) = 0, f(7) = 0$.
      - Giá trị âm: $f(n) = 0$ với $n < 0$.

    Ta tính giá trị $f(n)$ tuần tự từ bậc 0 đến bậc 10:
    - $f(0) = 1$
    - $f(1) = 1$
    - $f(2) = f(1) + f(0) = 1 + 1 = 2$
    - $f(3) = f(2) + f(1) = 2 + 1 = 3$
    - $f(4) = 0$ (bậc hỏng)
    - $f(5) = f(4) + f(3) = 0 + 3 = 3$
    - $f(6) = f(5) + f(4) = 3 + 0 = 3$
    - $f(7) = 0$ (bậc hỏng)
    - $f(8) = f(7) + f(6) = 0 + 3 = 3$
    - $f(9) = f(8) + f(7) = 3 + 0 = 3$
    - $f(10) = f(9) + f(8) = 3 + 3 = 6$

    Bảng Quy hoạch động leo cầu thang có bậc hỏng:

    #align(center)[
      #table(
        columns: (1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        stroke: 0.5pt + rgb("#bdbdbd"),
        fill: (x, y) => if y == 0 { rgb("#1A237E") } else if x == 5 or x == 8 { rgb("#FFEBEE") } else { white },
        inset: 5pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[Bậc n],
          text(fill: white, weight: "bold")[0],
          text(fill: white, weight: "bold")[1],
          text(fill: white, weight: "bold")[2],
          text(fill: white, weight: "bold")[3],
          text(fill: white, weight: "bold")[4],
          text(fill: white, weight: "bold")[5],
          text(fill: white, weight: "bold")[6],
          text(fill: white, weight: "bold")[7],
          text(fill: white, weight: "bold")[8],
          text(fill: white, weight: "bold")[9],
          text(fill: white, weight: "bold")[10],
        ),
        [*f(n)*], [1], [1], [2], [3], [0], [3], [3], [0], [3], [3], [**6**],
      )
    ]

    Vậy số cách leo lên đến bậc số 10 là **6 cách**.
  ]
)

#v(0.5em)

#tln(
  [
    **Bài toán Số Delannoy:** Trên lưới tọa độ, một người đi từ ô $(0,0)$ đến $(3,3)$. Tại mỗi bước, người này được phép đi theo 3 hướng: sang phải 1 đơn vị $(+1, 0)$, lên trên 1 đơn vị $(0, +1)$, hoặc đi chéo lên trên bên phải 1 đơn vị $(+1, +1)$. Tính số đường đi hợp lệ.
  ],
  [63],
  loigiai: [
    Đây là bài toán đếm đường đi trên lưới có cho phép bước đi chéo (được gọi là số Delannoy $D(M, N)$).
    - **State:** Gọi $f(i, j)$ là số cách đi từ $(0,0)$ đến $(i, j)$.
    - **Transition:** Để đến được $(i, j)$, bước cuối cùng của người đó có thể là:
      - Đi từ bên trái $(i-1, j)$ sang ngang.
      - Đi từ bên dưới $(i, j-1)$ lên trên.
      - Đi từ góc dưới bên trái $(i-1, j-1)$ đi chéo.
      Do đó:
      $ f(i, j) = f(i-1, j) + f(i, j-1) + f(i-1, j-1). $
    - **Base cases:**
      - Khởi đầu: $f(0, 0) = 1$.
      - Ngoài biên: $f(i, j) = 0$ nếu $i < 0$ hoặc $j < 0$.

    Ta lập bảng tính toán các giá trị $f(i, j)$ cho lưới $3 times 3$ (với $i, j$ chạy từ 0 đến 3):

    #align(center)[
      #table(
        columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
        stroke: 0.5pt + rgb("#bdbdbd"),
        fill: (x, y) => if y == 0 { rgb("#1A237E") } else if x == 0 { rgb("#E8EAF6") } else { white },
        inset: 7pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[y \ x],
          text(fill: white, weight: "bold")[0],
          text(fill: white, weight: "bold")[1],
          text(fill: white, weight: "bold")[2],
          text(fill: white, weight: "bold")[3],
        ),
        [*3*], [1], [7], [25], [**63**],
        [*2*], [1], [5], [13], [25],
        [*1*], [1], [3], [5], [7],
        [*0*], [1 (S)], [1], [1], [1],
      )
    ]

    - **Chi tiết tính toán hàng 1:**
      - $f(1, 1) = f(0, 1) + f(1, 0) + f(0, 0) = 1 + 1 + 1 = 3$
      - $f(2, 1) = f(1, 1) + f(2, 0) + f(1, 0) = 3 + 1 + 1 = 5$
      - $f(3, 1) = f(2, 1) + f(3, 0) + f(2, 0) = 5 + 1 + 1 = 7$
    - **Chi tiết tính toán hàng 2:**
      - $f(1, 2) = f(0, 2) + f(1, 1) + f(0, 1) = 1 + 3 + 1 = 5$
      - $f(2, 2) = f(1, 2) + f(2, 1) + f(1, 1) = 5 + 5 + 3 = 13$
      - $f(3, 2) = f(2, 2) + f(3, 1) + f(2, 1) = 13 + 7 + 5 = 25$
    - **Chi tiết tính toán hàng 3:**
      - $f(1, 3) = f(0, 3) + f(1, 2) + f(0, 2) = 1 + 5 + 1 = 7$
      - $f(2, 3) = f(1, 3) + f(2, 2) + f(1, 2) = 7 + 13 + 5 = 25$
      - $f(3, 3) = f(2, 3) + f(3, 2) + f(2, 2) = 25 + 25 + 13 = 63$

    Vậy số đường đi hợp lệ đến $(3,3)$ là **63**.
  ]
)

#v(0.5em)

#tl(
  [
    **Bài toán Lưới có trọng số (Weighted DAG):** Cho lưới kích thước $3 times 3$ gồm các ô từ $(0,0)$ đến $(2,2)$. Mỗi ô có một điểm số thưởng được định nghĩa như sau:
    - Ô $(0,0): 2$, $(1,0): 3$, $(2,0): 1$
    - Ô $(0,1): 4$, $(1,1): 2$, $(2,1): 5$
    - Ô $(0,2): 1$, $(1,2): 3$, $(2,2): 4$
    Robot xuất phát từ $(0,0)$ đi đến $(2,2)$, tại mỗi bước chỉ được đi sang phải $(+1, 0)$ hoặc đi lên $(0, +1)$. Hãy tìm tổng số điểm thưởng lớn nhất robot có thể thu thập được trên đường đi của mình (bao gồm cả điểm của ô xuất phát và ô kết thúc), đồng thời đếm xem có bao nhiêu đường đi đạt được mức điểm cực đại đó.
  ],
  loigiai: [
    Đây là bài toán tìm đường đi dài nhất (tổng trọng số lớn nhất) trên đồ thị DAG và đếm số đường đi tối ưu.
    
    Ta gọi $V(i, j)$ là điểm thưởng tại ô $(i, j)$.
    - **State:** Ta cần lưu hai thông tin tại mỗi ô $(i, j)$:
      - $f(i, j)$: tổng điểm thưởng lớn nhất thu thập được khi đi từ $(0,0)$ đến $(i, j)$.
      - $g(i, j)$: số lượng đường đi từ $(0,0)$ đến $(i, j)$ đạt được mức điểm thưởng $f(i, j)$.

    - **Transition:**
      Để đến $(i, j)$, robot có thể đi từ ô bên trái $(i-1, j)$ hoặc ô bên dưới $(i, j-1)$:
      - Gọi $M = max(f(i-1, j), f(i, j-1))$ là giá trị điểm tối đa có thể đạt được trước khi bước vào ô $(i, j)$.
      - Giá trị điểm lớn nhất tại $(i, j)$ là:
        $ f(i, j) = M + V(i, j). $
      - Số cách đạt được điểm lớn nhất $g(i, j)$ được tính bằng cách cộng dồn các nhánh đạt cực đại:
        - Nếu $f(i-1, j) > f(i, j-1)$, thì toàn bộ đường đi tối ưu phải đi qua ô bên trái: $g(i, j) = g(i-1, j)$.
        - Nếu $f(i-1, j) < f(i, j-1)$, thì toàn bộ đường đi tối ưu phải đi qua ô bên dưới: $g(i, j) = g(i, j-1)$.
        - Nếu $f(i-1, j) == f(i, j-1)$, thì cả hai nhánh đều tối ưu: $g(i, j) = g(i-1, j) + g(i, j-1)$.

    - **Base cases:**
      - Tại gốc $(0,0)$: $f(0, 0) = V(0, 0) = 2$ và $g(0, 0) = 1$.
      - Với các ô nằm ngoài biên lưới: $f(i, j) = -oo, g(i, j) = 0$.

    Ta lập bảng tính toán các giá trị $f(i, j)$ và $g(i, j)$ cho từng ô theo thứ tự topo từ dưới lên trên, từ trái sang phải:

    - **Hàng 0 (j = 0):**
      - Ô $(0, 0)$: $f(0,0) = 2, g(0,0) = 1$.
      - Ô $(1, 0)$: Chỉ đi từ $(0,0)$ sang phải. $f(1,0) = f(0,0) + V(1,0) = 2 + 3 = 5, g(1,0) = g(0,0) = 1$.
      - Ô $(2, 0)$: Chỉ đi từ $(1,0)$ sang phải. $f(2,0) = f(1,0) + V(2,0) = 5 + 1 = 6, g(2,0) = g(1,0) = 1$.

    - **Hàng 1 (j = 1):**
      - Ô $(0, 1)$: Chỉ đi từ $(0,0)$ lên trên. $f(0,1) = f(0,0) + V(0,1) = 2 + 4 = 6, g(0,1) = g(0,0) = 1$.
      - Ô $(1, 1)$: Đến từ $(0,1)$ hoặc $(1,0)$. 
        - $f(0,1) = 6$ và $f(1,0) = 5 => M = max(6, 5) = 6$.
        - Do đó: $f(1,1) = 6 + V(1,1) = 6 + 2 = 8$.
        - Nhánh tối ưu chỉ đi qua $(0,1)$ nên $g(1,1) = g(0,1) = 1$.
      - Ô $(2, 1)$: Đến từ $(1,1)$ hoặc $(2,0)$.
        - $f(1,1) = 8$ và $f(2,0) = 6 => M = max(8, 6) = 8$.
        - Do đó: $f(2,1) = 8 + V(2,1) = 8 + 5 = 13$.
        - Nhánh tối ưu chỉ đi qua $(1,1)$ nên $g(2,1) = g(1,1) = 1$.

    - **Hàng 2 (j = 2):**
      - Ô $(0, 2)$: Chỉ đi từ $(0,1)$ lên trên. $f(0,2) = f(0,1) + V(0,2) = 6 + 1 = 7, g(0,2) = g(0,1) = 1$.
      - Ô $(1, 2)$: Đến từ $(0,2)$ hoặc $(1,1)$.
        - $f(0,2) = 7$ và $f(1,1) = 8 => M = max(7, 8) = 8$.
        - Do đó: $f(1,2) = 8 + V(1,2) = 8 + 3 = 11$.
        - Nhánh tối ưu chỉ đi qua $(1,1)$ nên $g(1,2) = g(1,1) = 1$.
      - Ô $(2, 2)$: Đến từ $(1,2)$ hoặc $(2,1)$.
        - $f(1,2) = 11$ và $f(2,1) = 13 => M = max(11, 13) = 13$.
        - Do đó: $f(2,2) = 13 + V(2,2) = 13 + 4 = 17$.
        - Nhánh tối ưu chỉ đi qua $(2,1)$ nên $g(2,2) = g(2,1) = 1$.

    Bảng kết quả cuối cùng cho cặp $(f(i, j) slash g(i, j))$:

    #align(center)[
      #table(
        columns: (1.5fr, 1.5fr, 1.5fr, 1.5fr),
        stroke: 0.5pt + rgb("#bdbdbd"),
        fill: (x, y) => if y == 0 { rgb("#2E7D32") } else if x == 0 { rgb("#E8F5E9") } else { white },
        inset: 7pt,
        align: center,
        table.header(
          text(fill: white, weight: "bold")[y \ x],
          text(fill: white, weight: "bold")[0],
          text(fill: white, weight: "bold")[1],
          text(fill: white, weight: "bold")[2],
        ),
        [*2*], [7 (1 cách)], [11 (1 cách)], [**17 (1 cách)**],
        [*1*], [6 (1 cách)], [8 (1 cách)], [13 (1 cách)],
        [*0*], [2 (S)], [5 (1 cách)], [6 (1 cách)],
      )
    ]

    Vậy điểm thưởng lớn nhất đạt được là **17 điểm**, và chỉ có duy nhất **1 đường đi** đạt mức điểm tối ưu này.
  ]
)

#v(0.5em)

#tl(
  [
    **Bài toán Đổi tiền nâng cao:** Một học sinh có 4 loại tiền xu với mệnh giá $\{2, 3, 5, 7\}$ (đồng). Học sinh muốn thanh toán một món đồ có giá trị đúng 12 đồng. Hỏi có bao nhiêu cách chọn các đồng xu sao cho không có mệnh giá nào được sử dụng quá 2 lần? Trình bày lời giải bằng Quy hoạch động với State mở rộng để kiểm soát số lần sử dụng xu.
  ],
  loigiai: [
    Để giải quyết bài toán này, ta có thể xây dựng Quy hoạch động với State tương tự như bài toán đổi tiền cơ bản, nhưng có giới hạn số lần sử dụng mỗi loại xu tối đa là 2 lần.

    - **State:**
      Gọi $f(s, i)$ là số cách tạo ra số tiền $s$ chỉ sử dụng các xu thuộc tập $\{d_1, d_2, dots, d_i\}$, với điều kiện mỗi xu dùng không quá 2 lần.
      
    - **Transition:**
      Với đồng xu thứ $i$ có mệnh giá $d_i$, ta có thể chọn sử dụng nó 0 lần, 1 lần hoặc 2 lần:
      - **Dùng 0 lần:** Số cách là $f(s, i-1)$.
      - **Dùng 1 lần:** Bớt đi 1 đồng $d_i$, số tiền còn lại $s - d_i$ phải được đổi từ $i-1$ loại xu trước đó. Số cách: $f(s - d_i, i-1)$.
      - **Dùng 2 lần:** Bớt đi 2 đồng $d_i$, số tiền còn lại $s - 2 d_i$ phải được đổi từ $i-1$ loại xu trước đó. Số cách: $f(s - 2 d_i, i-1)$.
      - Do đó, hệ thức truy hồi là:
        $ f(s, i) = f(s, i-1) + f(s - d_i, i-1) + f(s - 2 d_i, i-1). $

    Ta thực hiện tính toán với các mệnh giá $d = \{2, 3, 5, 7\}$ và số tiền $S = 12$:
    
    - **Khởi tạo:**
      - $f(0, i) = 1$ với mọi $i$.
      - $f(s, 0) = 0$ với mọi $s > 0$.
      - $f(s, i) = 0$ với mọi $s < 0$.

    - **Bước 1: Chỉ dùng xu $\{2\}$ ($d_1 = 2$):**
      - $f(s, 1) = f(s, 0) + f(s-2, 0) + f(s-4, 0)$.
      - Vì $f(s, 0) = 1$ chỉ khi $s=0$, ta chỉ có cách tạo ra tiền $s \in \{0, 2, 4\}$ với đúng 1 cách:
        - $f(0, 1) = 1$
        - $f(2, 1) = 1$
        - $f(4, 1) = 1$
        - Các giá trị khác bằng 0.

    - **Bước 2: Dùng thêm xu $\{3\}$ ($d_2 = 3$):**
      - $f(s, 2) = f(s, 1) + f(s-3, 1) + f(s-6, 1)$.
      - Tính các giá trị:
        - $f(0, 2) = 1$
        - $f(2, 2) = f(2, 1) = 1$
        - $f(3, 2) = f(3, 1) + f(0, 1) = 0 + 1 = 1$
        - $f(4, 2) = f(4, 1) + f(1, 1) = 1 + 0 = 1$
        - $f(5, 2) = f(5, 1) + f(2, 1) = 0 + 1 = 1$
        - $f(6, 2) = f(6, 1) + f(3, 1) + f(0, 1) = 0 + 0 + 1 = 1$
        - $f(7, 2) = f(7, 1) + f(4, 1) + f(1, 1) = 0 + 1 + 0 = 1$
        - $f(8, 2) = f(8, 1) + f(5, 1) + f(2, 1) = 0 + 0 + 1 = 1$
        - $f(9, 2) = f(9, 1) + f(6, 1) + f(3, 1) = 0$
        - $f(10, 2) = f(10, 1) + f(7, 1) + f(4, 1) = 0 + 0 + 1 = 1$ (Cách: 2+2+3+3)
        - $f(12, 2) = 0$

    - **Bước 3: Dùng thêm xu $\{5\}$ ($d_3 = 5$):**
      - $f(s, 3) = f(s, 2) + f(s-5, 2) + f(s-10, 2)$.
      - Tính các giá trị cần cho bước sau:
        - $f(5, 3) = f(5, 2) + f(0, 2) = 1 + 1 = 2$ (Cách: 2+3, 5)
        - $f(7, 3) = f(7, 2) + f(2, 2) = 1 + 1 = 2$ (Cách: 2+2+3, 2+5)
        - $f(9, 3) = f(9, 2) + f(4, 2) = 0 + 1 = 1$ (Cách: 2+2+5)
        - $f(10, 3) = f(10, 2) + f(5, 2) + f(0, 2) = 1 + 1 + 1 = 3$ (Cách: 2+2+3+3, 2+3+5, 5+5)
        - $f(12, 3) = f(12, 2) + f(7, 2) + f(2, 2) = 0 + 1 + 1 = 2$ (Cách: 2+2+3+5, 2+5+5)

    - **Bước 4: Dùng thêm xu $\{7\}$ ($d_4 = 7$):**
      - Ta cần tìm $f(12, 4) = f(12, 3) + f(5, 3) + f(12-14, 3) = f(12, 3) + f(5, 3)$.
      - Thay số: $f(12, 4) = 2 + 2 = 4$.
      
    Các cách cụ thể là:
    1. $2 + 2 + 3 + 5 = 12$
    2. $2 + 5 + 5 = 12$
    3. $2 + 3 + 7 = 12$
    4. $5 + 7 = 12$

    Vậy có **4 cách** chọn đồng xu thỏa mãn điều kiện đề bài.
  ]
)

#v(0.5em)

#theory-box[
  #text(fill: c-blue, weight: "bold")[🎓 Lời khuyên ôn luyện và tư duy vượt bậc]
  #v(0.5em)
  Khi giải quyết các bài toán tổ hợp và quy hoạch động trong các đề thi tuyển sinh HSG hoặc ĐGNL, đừng bao giờ bắt đầu bằng việc cố gắng ráp các công thức tổ hợp tổ hợp chập hay hoán vị. Hãy luôn vẽ một sơ đồ lưới nhỏ, thực hiện lan số trực tiếp để tìm quy luật, xác định rõ ràng State và Transition của bài toán. Tư duy hệ thống này sẽ giúp bạn giải được cả những bài toán phức tạp nhất một cách tự tin.
]
