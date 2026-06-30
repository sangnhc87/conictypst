// ══════════════════════════════════════════════════════════════════
//  NỘI DUNG CHUYÊN ĐỀ ĐẠI SỐ TỔ HỢP
//  Tác giả: GV Nguyễn Văn Sang · 0389.821.115
// ══════════════════════════════════════════════════════════════════

// ─── Bảng màu toàn cục ───────────────────────────────────────────
#let c-navy    = rgb("0D2137")
#let c-blue    = rgb("1565C0")
#let c-teal    = rgb("00695C")
#let c-amber   = rgb("BF360C")
#let c-violet  = rgb("4A148C")
#let c-green   = rgb("1B5E20")
#let c-slate   = rgb("37474F")
#let c-gold    = rgb("B7791F")
#let c-crimson = rgb("9B1C1C")
#let c-indigo  = rgb("3730A3")

#import "../math-sym.typ": *
#import "../sang-exam.typ": *
#import "../template.typ": *

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ─── Màu chủ đề nâng cấp ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#import "@preview/cetz:0.5.2"
#let col-violet = rgb("6A1B9A")
#let default-color = rgb("0F172A")
#let col-blue = rgb("1565C0")
#let col-amber = rgb("E65100")
#let col-green = rgb("2E7D32")
#let col-red = rgb("C62828")
#let col-teal = rgb("006064")
#let col-pink = rgb("880E4F")

// ─── Hộp nâng cấp kiểu CD-HamSinh ─────────────────────────────
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

#let cach-box(title: "Hướng giải", color: col-blue, icon: "🔵", body) = block(
  fill: color.lighten(94%),
  stroke: (left: 4pt + color, rest: 0.5pt + color.lighten(70%)),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: color, weight: "bold", size: 10.5pt)[#icon #title]
  #v(0.3em)
  #body
]

#let eg-box(title: "🎯 Ví Dụ Trực Quan", body) = block(
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

#let note-box(title: "📌 Nhận Xét", body) = block(
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

#let cach1-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + col-blue, rest: 0.5pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-blue, weight: "bold", size: 10.5pt)[🔵 Cách 1 — Tổ Hợp Thuần Túy]
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
  #text(fill: col-violet, weight: "bold", size: 10.5pt)[🟣 Cách 2 — Hàm Sinh (Generating Function)]
  #v(0.3em)
  #body
]

#let method-box(body) = block(
  fill: rgb("E0F7FA"),
  stroke: (left: 4pt + col-teal, rest: 0.5pt + rgb("80DEEA")),
  radius: (right: 6pt),
  inset: (x: 13pt, y: 10pt),
  width: 100%,
)[
  #text(fill: col-teal, weight: "bold", size: 10.5pt)[⚙️ Phương Pháp Giải Quyết]
  #v(0.3em)
  #body
]

// ─── Hộp thành phần ────────────────────────────────────────────
#let theory-box(body) = block(
  fill: rgb("EFF6FF"),
  stroke: (left: 4.5pt + c-blue, rest: 0.8pt + rgb("BFDBFE")),
  radius: (right: 8pt), inset: (x: 16pt, y: 14pt), width: 100%,
)[#body]

#let insight-box(title: "💡 Trực Giác Cốt Lõi", body) = block(
  fill: rgb("F0FDF4"),
  stroke: (left: 4pt + c-teal, rest: 0.6pt + rgb("A7F3D0")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-teal, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let warn-box(body) = block(
  fill: rgb("FFF7ED"),
  stroke: (left: 4pt + c-amber, rest: 0.6pt + rgb("FED7AA")),
  radius: (right: 7pt), inset: (x: 14pt, y: 11pt), width: 100%,
)[
  #text(fill: c-amber, weight: "bold")[⚠️ Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

#let key-box(body) = block(
  fill: rgb("F5F3FF"),
  stroke: (left: 4pt + c-violet, rest: 0.6pt + rgb("DDD6FE")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-violet, weight: "bold")[🔑 Công Thức / Nguyên Lý Then Chốt]
  #v(0.3em)
  #body
]

#let example-box(n: "", body) = block(
  fill: rgb("F8FAFC"),
  stroke: (left: 4pt + c-slate, rest: 0.6pt + rgb("E2E8F0")),
  radius: (right: 7pt), inset: (x: 14pt, y: 12pt), width: 100%,
)[
  #text(fill: c-slate, weight: "bold")[📝 Ví Dụ #n]
  #v(0.3em)
  #body
]

#let skill-badge(code, title, color: c-blue) = block(
  fill: color.lighten(95%),
  stroke: (left: 5pt + color, rest: 0.8pt + color.lighten(70%)),
  radius: (right: 8pt), inset: (x: 14pt, y: 10pt), width: 100%,
  above: 1.6em, below: 0.8em,
)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    align: (center + horizon, left + horizon),
    box(fill: color, inset: (x: 7pt, y: 4pt), radius: 5pt)[
      #text(fill: white, weight: "bold", size: 9pt)[#code]
    ],
    text(fill: color, weight: "bold", size: 12pt)[#title],
  )
]

// ─── Đề bài + Lời giải inline ──────────────────────────────────
#let prob(n, de, ans, loigiai: []) = {
  block(
    above: 1.2em, below: 1em,
    stroke: 0.6pt + rgb("E2E8F0"),
    inset: (x: 13pt, y: 10pt),
    radius: 6pt,
    width: 100%,
    fill: white,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,
      align: (top, top),
      box(fill: c-indigo, inset: (x: 6pt, y: 4pt), radius: 4pt)[
        #text(fill: white, weight: "bold", size: 9pt)[Bài #n]
      ],
      de,
    )
    #if ans != [] [
      #v(0.4em)
      #box(fill: rgb("ECFDF5"), stroke: 0.6pt + c-teal, inset: (x: 9pt, y: 5pt), radius: 4pt)[
        #text(fill: c-teal, weight: "bold", size: 9.5pt)[🎯 Đáp số: #ans]
      ]
    ]
    #if loigiai != [] [
      #v(0.4em)
      #block(
        fill: rgb("FFFBEB"),
        stroke: (left: 3pt + c-gold, rest: 0.5pt + rgb("FDE68A")),
        inset: (x: 12pt, y: 10pt),
        radius: (right: 5pt),
        width: 100%,
      )[
        #text(fill: c-gold, weight: "bold", size: 9.5pt)[📖 Hướng dẫn giải]
        #v(0.3em)
        #loigiai
      ]
    ]
  ]
}

// ─── Separator ──────────────────────────────────────────────────
#let section-rule(color: c-blue) = {
  v(0.5em)
  line(length: 100%, stroke: 1.2pt + color)
  v(0.5em)
}

// ══════════════════════════════════════════════════════════════
// PHẦN I: BẢN ĐỒ TƯ DUY TỔNG QUÁT
// ══════════════════════════════════════════════════════════════
= Bản Đồ Tư Duy Hệ Thống

#insight-box(title: "💡 Khung Kiến Thức Đại Số Tổ Hợp THPT")[
  #align(center)[
    #block(
      fill: white, stroke: 0.8pt + rgb("E2E8F0"),
      inset: (x: 12pt, y: 10pt), radius: 8pt, width: 100%,
    )[
      #table(
        columns: (1.5fr, 3fr, 2.5fr, 1.2fr),
        align: (center, left, left, center),
        stroke: 0.5pt + rgb("E2E8F0"),
        inset: (x: 7pt, y: 6pt),
        fill: (x, y) => if y == 0 { c-navy } else if calc.rem(y, 2) == 0 { rgb("F8FAFC") } else { white },
        text(fill: white, weight: "bold", size: 9.5pt)[Chủ Đề],
        text(fill: white, weight: "bold", size: 9.5pt)[Bản Chất & Chiến Lược Cốt Lõi],
        text(fill: white, weight: "bold", size: 9.5pt)[Ứng Dụng Nhận Dạng],
        text(fill: white, weight: "bold", size: 9.5pt)[Trọng Tâm],

        [Chủ đề 1], [Quy trình chọn độc lập hoặc chia trường hợp], [Sơ đồ nhánh, bài toán công việc], [Cơ bản],
        [Chủ đề 2], [Phần bù $Omega - overline(A)$, Nguyên lý bù trừ], [Điều kiện phủ định, giao các tập hợp], [Khá],
        [Chủ đề 3], [Hoán vị ($n!$), Chỉnh hợp ($A_n^k$), Tổ hợp ($C_n^k$)], [Chọn có thứ tự / không thứ tự], [Cơ bản],
        [Chủ đề 4], [Gộp các phần tử cạnh nhau, chèn khoảng trống], [Xếp hàng nam nữ kề/không kề], [Khá],
        [Chủ đề 5], [Hoán vị có phần tử trùng lặp giống nhau], [Sắp xếp ký tự từ, đi đường ngắn nhất], [Khá],
        [Chủ đề 6], [Chia quả giống nhau vào hộp phân biệt], [Nghiệm nguyên dương/không âm], [Khá],
        [Chủ đề 7], [Vách ngăn mở rộng có giới hạn trên], [Nghiệm nguyên có cận, Hàm sinh], [Khó],
        [Chủ đề 8], [Chia tập hợp thành các nhóm không tên], [Phân hoạch, số Stirling 2, Bell], [Khó],
        [Chủ đề 9], [Đếm đối tượng hình học ẩn trong đa giác/lưới], [Đường chéo, giao điểm, hình chữ nhật], [Khá],
        [Chủ đề 10], [Cấu tạo chữ số, tính chất chia hết], [Lập số chia hết cho 3, 4, 5, 9], [Khá],
        [Chủ đề 11], [Thiết lập song ánh tương ứng 1-1], [Đường đi dưới đường chéo, Catalan], [Khó],
        [Chủ đề 12], [Nguyên lý thỏ và chuồng (Pigeonhole)], [Tồn tại tính chất chia hết/hình học], [Khá],
        [Chủ đề 13], [Lập phương trình trạng thái thế hệ trước], [Tô màu vòng, bậc thang, Fibonacci], [Khó],
        [Chủ đề 14], [Khai triển nhị thức, tính tổng hệ số], [Tìm hệ số $x^k$, đạo hàm, tích phân], [Khá],
        [Chủ đề 15], [Đếm kịch bản trò chơi & Quy về xác suất], [Xích Markov đơn giản, xác suất đối kháng], [Khó],
      )
    ]
  ]
]

#pagebreak()

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 1: NGUYÊN LÝ CỘNG, NHÂN VÀ SƠ ĐỒ CÂY
// ══════════════════════════════════════════════════════════════
= 1 — Nguyên Lý Cộng, Nguyên Lý Nhân Và Sơ Đồ Cây

== Lý Thuyết

#theory-box[
  *1. Nguyên lý Cộng (Rule of Sum):*
  Nếu một công việc có thể hoàn thành bằng một trong hai phương án loại trừ nhau: phương án $A$ có $m$ cách, phương án $B$ có $n$ cách. Số cách hoàn thành công việc là $m + n$.
  Tổng quát: Nếu các tập hợp $A_1, A_2, ..., A_k$ đôi một rời nhau thì:
  $ |A_1 union A_2 union ... union A_k| = |A_1| + |A_2| + ... + |A_k| $

  *2. Nguyên lý Nhân (Rule of Product):*
  Nếu một công việc gồm hai giai đoạn liên tiếp: giai đoạn 1 có $m$ cách thực hiện, ứng với mỗi cách đó có $n$ cách thực hiện giai đoạn 2. Số cách hoàn thành công việc là $m dot n$.
  
  *3. Sơ đồ hình cây (Tree Diagram):*
  Là công cụ đồ họa biểu diễn cấu trúc đa cấp của các quyết định liên tiếp. Rất hiệu quả khi số lượng lựa chọn ở giai đoạn sau phụ thuộc vào kết quả của giai đoạn trước.
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Bạn Nam muốn đi từ thành phố A đến thành phố C qua thành phố B. Biết rằng từ A đến B có 3 con đường khác nhau, và từ B đến C có 4 con đường khác nhau. Hỏi Nam có bao nhiêu cách chọn lộ trình đi từ A đến C?
  ],
  [12],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Quy trình đi gồm 2 bước liên tiếp:
  - Bước 1 (Đi từ A đến B): Có 3 cách chọn.
  - Bước 2 (Đi từ B đến C): Có 4 cách chọn.
  Theo nguyên lý nhân, số cách chọn lộ trình là: $3 dot 4 = 12$ cách.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Từ các chữ số $\{1, 2, 3, 4, 5\}$, lập được bao nhiêu số tự nhiên có 3 chữ số đôi một khác nhau?
  ],
  [60],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi số cần lập là $overline(a b c)$ với $a, b, c$ thuộc $\{1, 2, 3, 4, 5\}$ và đôi một khác nhau.
  - Chọn $a$: Có 5 cách chọn từ $\{1, 2, 3, 4, 5\}$.
  - Chọn $b$: Có 4 cách chọn (khác $a$).
  - Chọn $c$: Có 3 cách chọn (khác $a$ và $b$).
  Theo nguyên lý nhân, số các số lập được là: $5 dot 4 dot 3 = 60$ số.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu chuỗi nhị phân độ dài 5 (gồm các chữ số 0 và 1) thỏa mãn điều kiện không có hai chữ số 0 nào đứng cạnh nhau?
  ],
  [13],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Nguyên lý cộng - Chia trường hợp", color: col-blue, icon: "🔵")[
      Gọi $k$ là số chữ số 0 xuất hiện trong chuỗi nhị phân độ dài 5. Do không có hai số 0 đứng kề nhau nên $0 <= k <= 3$.
  - *TH1 ($k=0$):* Không có số 0 nào (toàn 1). Chỉ có 1 chuỗi: $11111$.
  - *TH2 ($k=1$):* Có đúng 1 chữ số 0. Chọn vị trí cho số 0 trong 5 vị trí: $C_5^1 = 5$ chuỗi.
  - *TH3 ($k=2$):* Có đúng 2 chữ số 0. Xếp 3 chữ số 1 trước: `_ 1 _ 1 _ 1 _`. Xuất hiện 4 khoảng trống trống (ở giữa và hai đầu). Để hai chữ số 0 không đứng cạnh nhau, ta chọn 2 khoảng trống từ 4 khoảng trống này để đặt 2 chữ số 0: $C_4^2 = 6$ chuỗi.
  - *TH4 ($k=3$):* Có đúng 3 chữ số 0. Xếp 2 chữ số 1 trước: `_ 1 _ 1 _`. Có 3 khoảng trống. Để đặt 3 chữ số 0 không kề nhau, ta bắt buộc phải chọn cả 3 khoảng trống này: $C_3^3 = 1$ chuỗi (đó là $01010$).
  Tổng số chuỗi thỏa mãn là: $1 + 5 + 6 + 1 = 13$ chuỗi.
    ]

    #cach-box(title: "Cách 2 — Sơ đồ cây trạng thái & Truy hồi", color: col-violet, icon: "🟣")[
      Vẽ sơ đồ cây phát triển chuỗi hợp lệ theo độ dài từ 1 đến 5:
  - Độ dài 1: $\{0, 1\}$ (2 chuỗi)
  - Độ dài 2: $\{01, 10, 11\}$ (3 chuỗi)
  - Độ dài 3:
    - Nhánh từ $01 rightarrow \{010, 011\}$
    - Nhánh từ $10 rightarrow \{101\}$ (vì sau 0 chỉ được đi 1)
    - Nhánh từ $11 rightarrow \{110, 111\}$
    Tổng cộng độ dài 3 có 5 chuỗi.
  - Nhận xét: Gọi $a_n$ là số chuỗi hợp lệ độ dài $n$.
    - Chuỗi kết thúc bằng 1: Có dạng $S_{n-1} 1$ với $S_{n-1}$ là chuỗi hợp lệ độ dài $n-1$ (có $a_{n-1}$ cách).
    - Chuỗi kết thúc bằng 0: Phải có dạng $S_{n-2} 10$ với $S_{n-2}$ là chuỗi hợp lệ độ dài $n-2$ (có $a_{n-2}$ cách).
    Do đó ta có hệ thức truy hồi Fibonacci: $a_n = a_{n-1} + a_{n-2}$.
    Với $a_1 = 2, a_2 = 3$, ta tính được:
    - $a_3 = 2 + 3 = 5$
    - $a_4 = 3 + 5 = 8$
    - $a_5 = 5 + 8 = 13$ chuỗi.
  Cả hai phương pháp đều cho kết quả nhất quán là 13.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 2: NGUYÊN LÝ BÙ TRỪ VÀ ĐẾM NGƯỢC
// ══════════════════════════════════════════════════════════════
= 2 — Nguyên Lý Bù Trừ Và Đếm Ngược

== Lý Thuyết

#theory-box[
  *1. Nguyên lý Đếm ngược (Complementary Counting):*
  Khi đếm trực tiếp một tập hợp các đối tượng thỏa mãn tính chất $P$ gặp nhiều khó khăn do chia quá nhiều trường hợp, ta có thể đếm gián tiếp:
  $ |A| = |Omega| - |overline(A)| $
  Trong đó:
  - $Omega$ là tập vũ trụ (tất cả các khả năng, kể cả không thỏa $P$).
  - $overline(A)$ là tập hợp các khả năng không thỏa mãn tính chất $P$ (phần bù).

  *2. Nguyên lý Bù trừ (Inclusion-Exclusion Principle):*
  - Với hai tập hợp: $|A union B| = |A| + |B| - |A inter B|$
  - Với ba tập hợp:
  $ |A union B union C| = |A| + |B| + |C| - (|A inter B| + |A inter C| + |B inter C|) + |A inter B inter C| $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Có bao nhiêu số tự nhiên có 3 chữ số chứa ít nhất một chữ số chẵn?
  ],
  [775],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Tập vũ trụ $Omega$ là tập hợp tất cả các số tự nhiên có 3 chữ số: từ 100 đến 999 $rightarrow |Omega| = 900$.
  - Phần bù $overline(A)$ là tập hợp các số có 3 chữ số mà tất cả các chữ số của nó đều là số lẻ (lấy từ $\{1, 3, 5, 7, 9\}$):
    - Chữ số thứ nhất có 5 cách chọn.
    - Chữ số thứ hai có 5 cách chọn.
    - Chữ số thứ ba có 5 cách chọn.
    Suy ra $|overline(A)| = 5 dot 5 dot 5 = 125$ số.
  - Số các số thỏa mãn đề bài là: $|A| = 900 - 125 = 775$ số.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Một đội văn nghệ có 15 học sinh nam và 10 học sinh nữ. Hỏi có bao nhiêu cách chọn ra một nhóm gồm 5 học sinh sao cho nhóm được chọn có ít nhất 1 học sinh nam và ít nhất 1 học sinh nữ?
  ],
  [49875],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Tổng số cách chọn 5 học sinh từ 25 học sinh (không phân biệt giới tính) là: $|Omega| = C_(25)^5 = 53130$ cách.
  - Các trường hợp vi phạm điều kiện (không có ít nhất 1 nam và 1 nữ):
    - *Chọn toàn nam:* Chọn 5 học sinh từ 15 nam: $C_(15)^5 = 3003$ cách.
    - *Chọn toàn nữ:* Chọn 5 học sinh từ 10 nữ: $C_(10)^5 = 252$ cách.
  - Số cách chọn thỏa mãn yêu cầu đề bài là:
    $ N = 53130 - (3003 + 252) = 49875 " cách" $
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu số nguyên dương từ 1 đến 500 không chia hết cho bất kỳ số nào trong các số 2, 3 và 5?
  ],
  [134],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Nguyên lý bù trừ trực tiếp", color: col-blue, icon: "🔵")[
      Gọi $Omega = \{1, 2, ..., 500\} rightarrow |Omega| = 500$.
  Gọi $A, B, C$ lần lượt là tập hợp các số thuộc $Omega$ chia hết cho 2, 3, 5.
  - $|A| = floor(500 / 2) = 250$.
  - $|B| = floor(500 / 3) = 166$.
  - $|C| = floor(500 / 5) = 100$.
  - $|A inter B|$ (chia hết cho 6): $floor(500 / 6) = 83$.
  - $|A inter C|$ (chia hết cho 10): $floor(500 / 10) = 50$.
  - $|B inter C|$ (chia hết cho 15): $floor(500 / 15) = 33$.
  - $|A inter B inter C|$ (chia hết cho 30): $floor(500 / 30) = 16$.
  Áp dụng nguyên lý bù trừ, số các số chia hết cho ít nhất một trong ba số 2, 3, 5 là:
  $
    |A union B union C| = (250 + 166 + 100) - (83 + 50 + 33) + 16 \
    = 516 - 166 + 16 = 366
  $
  Số lượng các số thỏa mãn yêu cầu (không chia hết cho số nào) là:
  $ N = |Omega| - |A union B union C| = 500 - 366 = 134 " số" $
    ]

    #cach-box(title: "Cách 2 — Xét lớp thặng dư theo mô-đun 30", color: col-violet, icon: "🟣")[
      Bội chung nhỏ nhất của 2, 3, 5 là $lcm(2, 3, 5) = 30$.
  Xét một chu kỳ gồm 30 số nguyên liên tiếp $\{1, 2, ..., 30\}$. Số lượng số không chia hết cho 2, 3, 5 trong chu kỳ này được tính bằng hàm phi Euler $phi(30)$:
  $ phi(30) = 30 dot (1 - 1/2) dot (1 - 1/3) dot (1 - 1/5) = 30 dot 1/2 dot 2/3 dot 4/5 = 8 " số" $
  Từ 1 đến 500 có số chu kỳ đầy đủ là: $floor(500 / 30) = 16$ chu kỳ (tương ứng từ 1 đến 480).
  - Số lượng số thỏa mãn trong khoảng $[1, 480]$ là: $16 dot 8 = 128$ số.
  - Ta xét thủ công 20 số còn lại trong đoạn $[481, 500]$:
    Các số không chia hết cho 2, 3, 5 trong đoạn này là các số tận cùng bằng 1, 3, 7, 9 và không chia hết cho 3:
    - $481$ (chia hết cho 13, thỏa mãn)
    - $487$ (nguyên tố, thỏa mãn)
    - $491$ (nguyên tố, thỏa mãn)
    - $493$ (chia hết cho 17, thỏa mãn)
    - $497$ (chia hết cho 7, thỏa mãn)
    - $499$ (nguyên tố, thỏa mãn)
    Tổng cộng có thêm 6 số thỏa mãn.
  Kết quả cuối cùng: $128 + 6 = 134$ số.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 3: HOÁN VỊ, CHỈNH HỢP VÀ TỔ HỢP CƠ BẢN
// ══════════════════════════════════════════════════════════════
= 3 — Hoán Vị, Chỉnh Hợp Và Tổ Hợp Cơ Bản

== Lý Thuyết

#theory-box[
  *1. Hoán vị (Permutations):*
  Sắp xếp thứ tự của $n$ phần tử phân biệt. Số lượng cách xếp là:
  $ P_n = n! = n dot (n-1) dot ... dot 1 $

  *2. Chỉnh hợp (Variations / K-permutations):*
  Chọn $k$ phần tử từ $n$ phần tử phân biệt và sắp xếp chúng theo một thứ tự xác định ($0 <= k <= n$):
  $ A_n^k = frac(n!, (n-k)!) $

  *3. Tổ hợp (Combinations):*
  Chọn $k$ phần tử từ $n$ phần tử phân biệt mà không quan tâm đến thứ tự chọn ($0 <= k <= n$):
  $ C_n^k = binom(n, k) = frac(n!, k! dot (n-k)!) $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    [
    Một lớp học có 40 học sinh. 
  a) Có bao nhiêu cách bầu ra một ban cán sự gồm 3 người giữ 3 chức vụ khác nhau: Lớp trưởng
  ],
  [a) 59280; b) 9880],
  loigiai: [

  ]
) Có bao nhiêu cách chọn ra 3 học sinh đi quét sân trường?
  ],
  [],
  loigiai: [
    #ppgiai[
      Xem hướng dẫn giải chi tiết dưới đây để nắm được phương pháp thực hiện.
    ]

    #cach1-box[
      a) Vì 3 học sinh được chọn giữ 3 chức vụ khác nhau nên việc sắp xếp thứ tự là quan trọng. Số cách chọn là một chỉnh hợp chập 3 của 40:
  $ A_(40)^3 = 40 dot 39 dot 38 = 59280 " cách" $
  b) Đi quét sân trường không phân biệt thứ tự/chức vụ giữa 3 người. Số cách chọn là một tổ hợp chập 3 của 40:
  $ C_(40)^3 = frac(40 dot 39 dot 38, 3 dot 2 dot 1) = 9880 " cách" $
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Cho tập hợp $S = \{1, 2, ..., n\}$. Chứng minh bằng lập luận tổ hợp công thức:
  $ C_n^k = C_(n-1)^k + C_(n-1)^(k-1) $
  ],
  [Đpcm],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Vế trái $C_n^k$ là số cách chọn ra một tập con có $k$ phần tử từ tập $S$ gồm $n$ phần tử.
  Ta cố định một phần tử đặc biệt trong tập $S$, giả sử là phần tử $n$. Khi chọn tập con $k$ phần tử, chỉ có hai trường hợp loại trừ nhau:
  - *Trường hợp 1:* Tập con được chọn không chứa phần tử $n$. Điều này tương đương với việc ta chọn cả $k$ phần tử từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^k$.
  - *Trường hợp 2:* Tập con được chọn bắt buộc phải chứa phần tử $n$. Khi đó, ta chỉ cần chọn thêm $k-1$ phần tử nữa từ $n-1$ phần tử còn lại của $S$. Số cách chọn là $C_(n-1)^(k-1)$.
  Theo nguyên lý cộng, tổng số cách chọn là $C_(n-1)^k + C_(n-1)^(k-1)$. Do đó hai vế bằng nhau.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Chọn 4 số từ tập hợp $\{1, 2, ..., 12\}$ sao cho trong 4 số được chọn không có hai số nào là hai số tự nhiên liên tiếp. Hỏi có bao nhiêu cách chọn?
  ],
  [126],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Phương pháp song ánh", color: col-blue, icon: "🔵")[
      Giả sử các số được chọn theo thứ tự tăng dần là $x_1 < x_2 < x_3 < x_4$.
  Điều kiện không có hai số nào liên tiếp có nghĩa là:
  $ x_(i+1) - x_i >= 2 quad (forall i = 1, 2, 3) $
  Ta thực hiện phép đổi biến đặt:
  - $y_1 = x_1$
  - $y_2 = x_2 - 1$
  - $y_3 = x_3 - 2$
  - $y_4 = x_4 - 3$
  Khi đó, từ điều kiện $x_(i+1) - x_i >= 2$, ta có:
  $ y_(i+1) - y_i = (x_(i+1) - i) - (x_i - (i-1)) = x_(i+1) - x_i - 1 >= 2 - 1 = 1 $
  Điều này tương đương với $y_1 < y_2 < y_3 < y_4$.
  Giới hạn của các biến $y_i$: do $1 <= x_1$ và $x_4 <= 12$ nên ta có:
  $ 1 <= y_1 < y_2 < y_3 < y_4 <= 12 - 3 = 9 $
  Như vậy, mỗi cách chọn bộ $\{x_1, x_2, x_3, x_4\}$ không chứa hai số liên tiếp tương ứng song ánh 1-1 với một cách chọn bộ 4 số phân biệt $\{y_1, y_2, y_3, y_4\}$ từ tập $\{1, 2, ..., 9\}$.
  Số cách chọn thỏa mãn yêu cầu là: $C_9^4 = frac(9 dot 8 dot 7 dot 6, 4 dot 3 dot 2 dot 1) = 126$ cách.
    ]

    #cach-box(title: "Cách 2 — Phương pháp vách ngăn", color: col-violet, icon: "🟣")[
      Xem 8 số không được chọn như 8 vách ngăn giống nhau xếp hàng ngang.
  Khi xếp 8 vách ngăn này, ta có 9 khoảng trống tạo ra ở giữa và hai đầu:
  `_ | _ | _ | _ | _ | _ | _ | _ | _`
  Để chọn ra 4 số sao cho không có số nào liên tiếp, ta chỉ cần đặt 4 "ngôi sao" biểu diễn cho 4 số được chọn vào 9 khoảng trống này (mỗi khoảng trống chứa tối đa 1 ngôi sao để đảm bảo chúng không kề nhau).
  Số cách chọn vị trí đặt 4 ngôi sao vào 9 khoảng trống là:
  $ C_9^4 = 126 " cách" $
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 4: PHƯƠNG PHÁP GỘP KHỐI VÀ KHOẢNG TRỐNG
// ══════════════════════════════════════════════════════════════
= 4 — Phương Pháp Gộp Khối Và Khoảng Trống

== Lý Thuyết

#theory-box[
  *1. Phương pháp Gộp khối (Gluing Method):*
  Dùng khi đề bài yêu cầu các phần tử thuộc nhóm $X$ phải đứng cạnh nhau.
  - *Chiến lược:* Gộp toàn bộ các phần tử của nhóm $X$ thành một "siêu phần tử" duy nhất. Sắp xếp siêu phần tử này cùng các phần tử còn lại, sau đó nhân với số cách sắp xếp nội bộ trong khối $X$.

  *2. Phương pháp Khoảng trống (Gap Method):*
  Dùng khi đề bài yêu cầu các phần tử thuộc nhóm $Y$ không được đứng cạnh nhau.
  - *Chiến lược:* Sắp xếp các phần tử tự do còn lại trước. Sau đó, chèn các phần tử của nhóm $Y$ vào các khoảng trống được tạo ra giữa các phần tử tự do (bao gồm cả hai đầu).
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Xếp 4 học sinh nam và 2 học sinh nữ thành một hàng dọc. Có bao nhiêu cách xếp sao cho 2 học sinh nữ luôn đứng cạnh nhau?
  ],
  [240],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Gộp 2 học sinh nữ thành 1 khối duy nhất. Lúc này ta cần sắp xếp 5 đối tượng (khối nữ + 4 học sinh nam): có $5! = 120$ cách xếp.
  - Hoán vị nội bộ 2 học sinh nữ trong khối đó: có $2! = 2$ cách.
  Theo nguyên lý nhân, tổng số cách xếp hàng là: $120 dot 2 = 240$ cách.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Xếp 5 học sinh nam và 3 học sinh nữ thành một hàng ngang sao cho không có hai học sinh nữ nào đứng cạnh nhau.
  ],
  [14400],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Bước 1: Sắp xếp 5 học sinh nam trước, có $5! = 120$ cách xếp.
  - Xếp xong 5 học sinh nam, ta có 6 khoảng trống xen kẽ ở hai đầu và giữa họ:
    `_ Nam _ Nam _ Nam _ Nam _ Nam _`
  - Bước 2: Chọn 3 khoảng trống từ 6 khoảng trống này và xếp 3 học sinh nữ vào đó: có $A_6^3 = 120$ cách.
  Theo nguyên lý nhân, số cách xếp thỏa mãn là: $120 dot 120 = 14400$ cách.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Xếp 3 học sinh lớp A, 2 học sinh lớp B và 2 học sinh lớp C thành một hàng ngang sao cho học sinh cùng lớp luôn đứng cạnh nhau, đồng thời học sinh lớp A và học sinh lớp C không được đứng cạnh nhau.
  ],
  [48],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Xếp trực tiếp khối", color: col-blue, icon: "🔵")[
      Gộp học sinh cùng lớp thành các khối lớn: Khối A (chứa 3 học sinh A), Khối B (chứa 2 học sinh B), Khối C (chứa 2 học sinh C).
  - Hoán vị nội bộ trong mỗi khối:
    - Khối A: $3! = 6$ cách.
    - Khối B: $2! = 2$ cách.
    - Khối C: $2! = 2$ cách.
  - Sắp xếp vị trí của 3 khối (A, B, C) sao cho khối A và khối C không kề nhau. Với 3 khối đứng hàng ngang, chỉ có thể để khối B ở giữa:
    - Dạng 1: `Khối A - Khối B - Khối C`
    - Dạng 2: `Khối C - Khối B - Khối A`
    Vậy có đúng 2 cách xếp khối.
  Tổng số cách xếp thỏa mãn đề bài là:
  $ N = 2 dot (6 dot 2 dot 2) = 48 " cách" $
    ]

    #cach-box(title: "Cách 2 — Đếm ngược - Dùng phần bù", color: col-violet, icon: "🟣")[
      - Tổng số cách xếp 3 khối lớn bất kỳ là: $3! = 6$ cách.
  - Số cách xếp 3 khối lớn sao cho khối A và khối C đứng cạnh nhau:
    Gộp A và C thành một khối siêu cấp {AC}. Khi đó ta hoán vị 2 đối tượng là {AC} và B: có $2! = 2$ cách. Hoán vị nội bộ A và C trong khối siêu cấp là $2! = 2$ cách. Vậy có $2 dot 2 = 4$ cách xếp khối có A kề C.
  - Số cách xếp khối thỏa mãn A không kề C là: $6 - 4 = 2$ cách.
  - Nhân với số hoán vị bên trong các khối A, B, C:
    $ N = 2 dot (3! dot 2! dot 2!) = 2 dot 6 dot 2 dot 2 = 48 " cách" $
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 5: HOÁN VỊ LẶP VÀ BÀI TOÁN SẮP XẾP CHUỖI
// ══════════════════════════════════════════════════════════════
= 5 — Hoán Vị Lặp Và Bài Toán Sắp Xếp Chuỗi

== Lý Thuyết

#theory-box[
  *1. Định nghĩa Hoán vị lặp:*
  Cho $n$ phần tử, trong đó có $n_1$ phần tử loại 1 giống nhau, $n_2$ phần tử loại 2 giống nhau, ..., $n_k$ phần tử loại $k$ giống nhau (tổng $n_1 + n_2 + ... + n_k = n$).
  Số cách sắp xếp có phân biệt $n$ phần tử này thành một hàng là:
  $ P(n; n_1, n_2, ..., n_k) = frac(n!, n_1! dot n_2! dot ... dot n_k!) $

  *2. Bài toán đường đi ngắn nhất trên lưới:*
  Đường đi từ $(0,0)$ đến $(m,n)$ chỉ bằng các bước sang phải $R(1,0)$ hoặc lên trên $U(0,1)$. Mỗi đường đi là một hoán vị của chuỗi gồm $m$ ký tự $R$ và $n$ ký tự $U$. Tổng số đường đi là:
  $ P(m+n; m, n) = frac((m+n)!, m! dot n!) = C_(m+n)^m $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Có bao nhiêu cách sắp xếp các chữ cái của từ "HỌCTẬP" thành một chuỗi ký tự phân biệt?
  ],
  [720],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Từ "HỌCTẬP" gồm 6 chữ cái phân biệt: H, O, C, T, A, P.
  Số cách sắp xếp là số hoán vị của 6 phần tử:
  $ P_6 = 6! = 720 " cách" $
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Có bao nhiêu cách sắp xếp 5 chữ cái A giống nhau và 3 chữ cái B giống nhau thành một chuỗi ký tự sao cho không có hai chữ B nào đứng cạnh nhau?
  ],
  [20],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Bước 1: Xếp 5 chữ cái A thành hàng ngang. Vì các chữ cái A giống nhau nên chỉ có 1 cách xếp.
  - Bước 2: Tạo ra 6 khoảng trống xung quanh 5 chữ cái A:
    `_ A _ A _ A _ A _ A _`
  - Bước 3: Để không có hai chữ B kề nhau, ta chọn 3 khoảng trống từ 6 khoảng trống này để đặt 3 chữ B vào. Vì các chữ B giống nhau nên mỗi cách chọn khoảng trống chỉ tương ứng với 1 cách đặt.
  Số cách xếp là: $C_6^3 = 20$ cách.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Trên lưới tọa độ phẳng, một robot di chuyển từ điểm $(0,0)$ đến điểm $(4,3)$ chỉ bằng các bước sang phải $(+1, 0)$ hoặc lên trên $(0, +1)$. Hỏi có bao nhiêu con đường đi ngắn nhất mà không đi qua điểm $(2,2)$?
  ],
  [17],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Sử dụng phần bù & Hoán vị lặp", color: col-blue, icon: "🔵")[
      - Bước 1: Tính tổng số con đường đi ngắn nhất từ $(0,0)$ đến $(4,3)$.
    Mỗi đường đi gồm 4 bước sang phải (R) và 3 bước đi lên (U), tổng cộng 7 bước.
    Số đường đi bất kỳ là: $N_(Omega) = C_(7)^4 = frac(7!, 4! dot 3!) = 35$ đường.
  - Bước 2: Tính số con đường đi qua điểm $(2,2)$. Quy trình được chia làm hai giai đoạn liên tiếp:
    - *Giai đoạn 1 (Đi từ $(0,0)$ đến $(2,2)$):* Cần 2 bước R và 2 bước U. Số cách đi là $C_4^2 = 6$.
    - *Giai đoạn 2 (Đi từ $(2,2)$ đến $(4,3)$):* Cần 2 bước R và 1 bước U (do quãng đường cần đi thêm là $4-2=2$ sang phải và $3-2=1$ đi lên). Số cách đi là $C_3^2 = 3$.
    Số đường đi qua $(2,2)$ là: $N_("cấm") = 6 dot 3 = 18$ đường.
  - Số đường đi hợp lệ là: $N = N_(Omega) - N_("cấm") = 35 - 18 = 17$ đường.
    ]

    #cach-box(title: "Cách 2 — Quy hoạch động - Đếm trực tiếp trên lưới", color: col-violet, icon: "🟣")[
      Ta tính số cách đi đến mỗi nút $(i,j)$ bằng hệ thức:
  $ f(i,j) = f(i-1, j) + f(i, j-1) $
  Với điểm cấm $(2,2)$, ta gán cố định $f(2,2) = 0$.
  Lập bảng giá trị:
  - Hàng $j=0$: $f(0,0)=1, f(1,0)=1, f(2,0)=1, f(3,0)=1, f(4,0)=1$.
  - Hàng $j=1$:
    - $f(0,1) = 1$
    - $f(1,1) = f(0,1) + f(1,0) = 1 + 1 = 2$
    - $f(2,1) = f(1,1) + f(2,0) = 2 + 1 = 3$
    - $f(3,1) = f(2,1) + f(3,0) = 3 + 1 = 4$
    - $f(4,1) = f(3,1) + f(4,0) = 4 + 1 = 5$
  - Hàng $j=2$:
    - $f(0,2) = 1$
    - $f(1,2) = 1 + 2 = 3$
    - $f(2,2) = 0$ (điểm cấm)
    - $f(3,2) = f(2,2) + f(3,1) = 0 + 4 = 4$
    - $f(4,2) = f(3,2) + f(4,1) = 4 + 5 = 9$
  - Hàng $j=3$:
    - $f(0,3) = 1$
    - $f(1,3) = 1 + 3 = 4$
    - $f(2,3) = f(1,3) + f(2,2) = 4 + 0 = 4$
    - $f(3,3) = f(2,3) + f(3,2) = 4 + 4 = 8$
    - $f(4,3) = f(3,3) + f(4,2) = 8 + 9 = 17$
  Kết quả tại điểm $(4,3)$ là 17 đường.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 6: PHƯƠNG PHÁP VÁCH NGĂN (STARS & BARS) CƠ BẢN
// ══════════════════════════════════════════════════════════════
= 6 — Phương Pháp Vách Ngăn Cơ Bản

== Lý Thuyết

#theory-box[
  *Bài toán cơ bản:* Tìm số nghiệm nguyên của phương trình:
  $ x_1 + x_2 + ... + x_k = n $

  *1. Trường hợp nghiệm nguyên không âm ($x_i >= 0$):*
  Tương ứng với cách phân phối $n$ vật giống nhau vào $k$ hộp phân biệt (hộp có thể rỗng). Số nghiệm là:
  $ N = C_(n+k-1)^(k-1) = C_(n+k-1)^n $

  *2. Trường hợp nghiệm nguyên dương ($x_i >= 1$):*
  Tương ứng với việc chia $n$ vật giống nhau vào $k$ hộp sao cho hộp nào cũng có ít nhất 1 vật. Số nghiệm là:
  $ N = C_(n-1)^(k-1) $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Có bao nhiêu cách chia 10 chiếc kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được ít nhất 1 chiếc kẹo?
  ],
  [36],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Đây là bài toán chia kẹo Euler cơ bản với $n=10$ vật giống nhau và $k=3$ phần tử phân biệt, điều kiện mỗi phần tử có giá trị $x_i >= 1$.
  Số cách chia kẹo là:
  $ C_(10-1)^(3-1) = C_9^2 = 36 " cách" $
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 15$ thỏa mãn điều kiện $x_1 >= 1, x_2 >= 2, x_3 >= -1, x_4 >= 0$.
  ],
  [560],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Ta thực hiện đổi biến để chuyển các điều kiện ràng buộc về dạng không âm ($>= 0$):
  - Đặt $y_1 = x_1 - 1 >= 0 rightarrow x_1 = y_1 + 1$
  - Đặt $y_2 = x_2 - 2 >= 0 rightarrow x_2 = y_2 + 2$
  - Đặt $y_3 = x_3 + 1 >= 0 rightarrow x_3 = y_3 - 1$
  - Đặt $y_4 = x_4 >= 0 rightarrow x_4 = y_4$
  Thay vào phương trình ban đầu ta được:
  $
    (y_1 + 1) + (y_2 + 2) + (y_3 - 1) + y_4 = 15 \
    leftrightarrow y_1 + y_2 + y_3 + y_4 = 13
  $
  Số cách chọn chính là số nghiệm nguyên không âm của phương trình mới với $n=13$ và $k=4$:
  $ N = C_(13+4-1)^(4-1) = C_(16)^3 = frac(16 dot 15 dot 14, 3 dot 2 dot 1) = 560 " nghiệm" $
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu số tự nhiên có 4 chữ số mà tổng các chữ số của số đó bằng 10?
  ],
  [220],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Phương pháp vách ngăn trực tiếp", color: col-blue, icon: "🔵")[
      Gọi số cần tìm là $overline(a b c d)$ với $a, b, c, d$ là các số tự nhiên thỏa mãn:
  $ a + b + c + d = 10 $
  Với các điều kiện ràng buộc vị trí chữ số:
  - $1 <= a <= 9$ (chữ số hàng nghìn không thể bằng 0).
  - $0 <= b, c, d <= 9$.
  Ta thực hiện đổi biến cho biến $a$: đặt $a' = a - 1 >= 0 rightarrow a = a' + 1$.
  Phương trình trở thành:
  $ (a' + 1) + b + c + d = 10 leftrightarrow a' + b + c + d = 9 $
  Vì tổng mới bằng 9 nên các biến $a', b, c, d$ tự động thỏa mãn giới hạn trên ($<= 9$). Do đó, ta chỉ cần tìm số nghiệm nguyên không âm của phương trình trên.
  Số cách chọn là:
  $ N = C_(9+4-1)^(4-1) = C_(12)^3 = frac(12 dot 11 dot 10, 3 dot 2 dot 1) = 220 " số" $
    ]

    #cach-box(title: "Cách 2 — Sử dụng hàm sinh - Generating Function", color: col-violet, icon: "🟣")[
      Số cách chính là hệ số của số hạng $x^(10)$ trong khai triển hàm sinh đại diện cho việc chọn 4 chữ số:
  - Chữ số đầu $a  in  \{1, 2, ..., 9\}$ đại diện bởi đa thức: $P_a (x) = x + x^2 + ... + x^9$.
  - Ba chữ số sau $b, c, d  in  \{0, 1, ..., 9\}$ đại diện bởi đa thức: $P_{b,c,d}(x) = 1 + x + ... + x^9$.
  Hàm sinh tổng quát là:
  $ f(x) = (x + x^2 + ... + x^9) dot (1 + x + ... + x^9)^3 $
  Ta tìm hệ số của $x^(10)$ trong $f(x)$, tương đương hệ số của $x^9$ trong:
  $ g(x) = (1 + x + ... + x^8) dot (1 + x + ... + x^9)^3 $
  Với các số mũ nhỏ ($<= 9$), đa thức $1+x+...+x^k$ có thể viết xấp xỉ dưới dạng chuỗi lũy thừa vô hạn $(1-x)^(-1)$. Hệ số của $x^9$ trong $g(x)$ chính là hệ số của $x^9$ trong:
  $ (1-x)^(-4) = sum_(k=0)^(infty) C_(k+4-1)^(4-1) x^k $
  Hệ số của $x^9$ tương ứng với $k=9$ là: $C_(9+3)^3 = C_(12)^3 = 220$.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 7: CHIA KẸO EULER MỞ RỘNG (HÀM SINH & HỆ SỐ ĐA THỨC)
// ══════════════════════════════════════════════════════════════
= 7 — Chia Kẹo Euler Mở Rộng — Hàm Sinh

== Lý Thuyết

#theory-box[
  Khi giải bài toán vách ngăn $x_1 + x_2 + ... + x_k = n$ nhưng các biến có *cận trên* ($x_i <= m_i$), phương pháp vách ngăn thông thường không áp dụng trực tiếp được. Ta có hai công cụ mạnh:

  *1. Nguyên lý Bù trừ kết hợp Vách ngăn:*
  Đếm không điều kiện cận trên ($x_i >= a_i$), rồi dùng nguyên lý bù trừ để loại bỏ các trường hợp có ít nhất một biến vi phạm điều kiện cận trên ($x_i >= m_i + 1$).

  *2. Hệ số đa thức (Hàm sinh):*
  Số nghiệm chính là hệ số của $x^n$ trong khai triển tích các đa thức đại diện cho mỗi hộp:
  $ f(x) = prod_(i=1)^k (sum_(j=a_i)^(b_i) x^j) $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Tìm số cách chia 6 viên kẹo giống nhau cho 3 bạn nhỏ sao cho mỗi bạn nhận được không quá 3 viên kẹo.
  ],
  [10],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi số kẹo mỗi bạn nhận là $x_1, x_2, x_3$. Ta có phương trình:
  $ x_1 + x_2 + x_3 = 6 $
  Ràng buộc: $0 <= x_i <= 3$.
  - Số nghiệm không âm không có cận trên là: $C_(6+3-1)^(3-1) = C_8^2 = 28$.
  - Đặt điều kiện vi phạm: $A_i$ là tập nghiệm có $x_i >= 4$.
    - Giả sử $x_1 >= 4$. Đặt $x_1' = x_1 - 4 >= 0 rightarrow x_1' + x_2 + x_3 = 2$.
      Số nghiệm là $C_(2+3-1)^(3-1) = C_4^2 = 6$. Có 3 biến nên có $3 dot 6 = 18$ cách vi phạm.
    - Không thể có đồng thời 2 biến $x_i >= 4$ vì tổng chỉ bằng 6.
  Theo nguyên lý bù trừ, số nghiệm thỏa mãn là: $28 - 18 = 10$.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 = 10$ thỏa mãn điều kiện $0 <= x_i <= 4$ với mọi $i = 1, 2, 3$.
  ],
  [6],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Số nghiệm nguyên không âm không giới hạn trên: $C_(10+3-1)^2 = C_(12)^2 = 66$.
  - Xét các trường hợp vi phạm điều kiện cận trên ($x_i >= 5$):
    - *Trường hợp 1 (Có đúng 1 biến $x_i >= 5$):*
      Giả sử $x_1 >= 5$, đặt $x_1' = x_1 - 5 >= 0 rightarrow x_1' + x_2 + x_3 = 5$.
      Số nghiệm là $C_(5+2)^2 = C_7^2 = 21$.
      Có $C_3^1 = 3$ cách chọn biến vi phạm $rightarrow 3 dot 21 = 63$ cách.
    - *Trường hợp 2 (Có ít nhất 2 biến $x_i >= 5$):*
      Giả sử $x_1 >= 5, x_2 >= 5$. Đặt $x_1'=x_1-5, x_2'=x_2-5 rightarrow x_1'+x_2'+x_3 = 0$.
      Số nghiệm là $C_2^2 = 1$.
      Có $C_3^2 = 3$ cách chọn cặp biến vi phạm $rightarrow 3 dot 1 = 3$ cách.
    - Không thể có cả 3 biến $x_i >= 5$ vì tổng bằng 10.
  Áp dụng công thức bù trừ:
  $ N = 66 - 63 + 3 = 6 " nghiệm" $
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu cách chia 12 quyển sách giống nhau cho 3 học sinh sao cho mỗi học sinh nhận được ít nhất 2 quyển và không quá 5 quyển?
  ],
  [10],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Nguyên lý bù trừ kết hợp vách ngăn", color: col-blue, icon: "🔵")[
      Phương trình đại diện: $x_1 + x_2 + x_3 = 12$ với $2 <= x_i <= 5$.
  Thực hiện đổi biến đưa về biến không âm: đặt $y_i = x_i - 2 rightarrow 0 <= y_i <= 3$.
  Phương trình trở thành:
  $ y_1 + y_2 + y_3 = 12 - 6 = 6 $
  Ta cần tìm số nghiệm nguyên của phương trình trên thỏa mãn $0 <= y_i <= 3$.
  - Số nghiệm không âm tự do: $C_(6+2)^2 = C_8^2 = 28$.
  - Xét các trường hợp vi phạm có biến $y_i >= 4$:
    - Giả sử $y_1 >= 4 rightarrow y_1' + y_2 + y_3 = 2$.
      Số nghiệm là $C_4^2 = 6$. Số cách chọn 1 biến vi phạm: $C_3^1 = 3 rightarrow 3 dot 6 = 18$ cách.
    - Không thể có 2 biến $y_i >= 4$ vì tổng bằng 6.
  Số nghiệm thỏa mãn yêu cầu là: $28 - 18 = 10$ cách.
    ]

    #cach-box(title: "Cách 2 — Phương pháp hàm sinh đại số", color: col-violet, icon: "🟣")[
      Mỗi biến nhận giá trị từ 2 đến 5 tương ứng với đa thức đại diện là $P(x) = x^2 + x^3 + x^4 + x^5$.
  Số cách chọn chính là hệ số của $x^(12)$ trong đa thức tích $f(x) = (x^2 + x^3 + x^4 + x^5)^3$.
  Ta biến đổi đại số rút gọn $f(x)$:
  $
    f(x) = x^6 (1 + x + x^2 + x^3)^3 = x^6 (frac(1 - x^4, 1 - x))^3 \
    = x^6 (1 - x^4)^3 (1 - x)^(-3) \
    = x^6 (1 - 3x^4 + 3x^8 - x^(12)) (1 - x)^(-3)
  $
  Cần tìm hệ số của $x^(12)$ trong $f(x)$, tương đương hệ số của $x^6$ trong:
  $ h(x) = (1 - 3x^4) (1 - x)^(-3) $
  (Bỏ các số mũ $x^k$ với $k > 6$ vì không đóng góp vào hệ số $x^6$).
  Biết rằng $(1-x)^(-3) = sum_(k=0)^(infty) C_(k+2)^2 x^k$.
  - Phần đóng góp từ số hạng 1 trong $(1-3x^4)$ là hệ số của $x^6$ trong $(1-x)^(-3)$, tương ứng $k=6$:
    $ C_(6+2)^2 = C_8^2 = 28 $
  - Phần đóng góp từ số hạng $-3x^4$ là hệ số của $x^2$ trong $(1-x)^(-3)$ nhân với $-3$, tương ứng $k=2$:
    $ -3 dot C_(2+2)^2 = -3 dot C_4^2 = -18 $
  Tổng hệ số là: $28 - 18 = 10$. Kết quả hoàn toàn trùng khớp.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 8: PHÂN HOẠCH TẬP HỢP (SỐ STIRLING LOẠI 2 & SỐ BELL)
// ══════════════════════════════════════════════════════════════
= 8 — Phân Hoạch Tập Hợp

== Lý Thuyết

#theory-box[
  *1. Số Stirling loại 2 (Stirling Numbers of the Second Kind) $S(n,k)$:*
  Là số cách chia một tập hợp gồm $n$ phần tử phân biệt thành $k$ nhóm không rỗng, trong đó *các nhóm không phân biệt* (không có tên gọi).
  $ S(n,k) = frac(1, k!) sum_(j=0)^k (-1)^(k-j) C_k^j j^n $
  Công thức truy hồi: $S(n,k) = k dot S(n-1, k) + S(n-1, k-1)$ với $S(n,1) = S(n,n) = 1$.

  *2. Liên hệ nhóm phân biệt (Toàn ánh - Surjection):*
  Số cách chia $n$ vật phân biệt vào $k$ hộp phân biệt sao cho hộp nào cũng có ít nhất 1 vật là:
  $ T(n,k) = k! dot S(n,k) $

  *3. Số Bell $B(n)$:*
  Là tổng số cách phân hoạch tập hợp có $n$ phần tử thành các nhóm không rỗng (số lượng nhóm tùy ý từ 1 đến $n$).
  $ B(n) = sum_(k=1)^n S(n,k) $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Có 4 học sinh khác nhau. Hỏi có bao nhiêu cách chia 4 học sinh này thành 2 nhóm học tập không phân biệt, mỗi nhóm có ít nhất 1 học sinh?
  ],
  [7],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Số cách chia chính là số Stirling loại 2 chập 2 của 4 phần tử: $S(4,2)$.
  Theo công thức truy hồi hoặc tính trực tiếp:
  $ S(4,2) = frac(1, 2!) [(-1)^0 C_2^2 2^4 + (-1)^1 C_2^1 1^4] = frac(1, 2) [16 - 2] = 7 " cách" $
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Có 5 phần quà khác nhau trao cho 3 học sinh xuất sắc sao cho học sinh nào cũng nhận được ít nhất 1 phần quà. Hỏi có bao nhiêu cách phát quà?
  ],
  [150],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Đây là bài toán chia vật phân biệt vào các hộp phân biệt (học sinh có tên gọi khác nhau) sao cho không có hộp nào rỗng.
  Số cách phát quà là:
  $ T(5,3) = 3! dot S(5,3) $
  Ta tính $S(5,3)$ bằng công thức truy hồi hoặc công thức số hạng:
  $
    S(5,3) = S(4,2) dot 3 + S(4,3) \
    S(4,3) = 3 dot S(3,3) + S(3,2) = 3(1) + 3 = 6 \
    rightarrow S(5,3) = 7 dot 3 + 6 = 25
  $
  Vậy số cách phát quà là: $3! dot 25 = 6 dot 25 = 150$ cách.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có 6 học sinh phân biệt. Hỏi có bao nhiêu cách chia 6 học sinh này thành 3 nhóm không phân biệt sao cho nhóm nào cũng có ít nhất 1 học sinh?
  ],
  [90],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Tính trực tiếp qua số Stirling loại 2", color: col-blue, icon: "🔵")[
      Số cách chia là $S(6,3)$. Ta sử dụng công thức khai triển nhị thức của số Stirling loại 2:
  $
    S(6,3) = frac(1, 3!) [C_3^3 3^6 - C_3^2 2^6 + C_3^1 1^6] \
    = frac(1, 6) [729 - 3 dot 64 + 3 dot 1] \
    = frac(1, 6) [729 - 192 + 3] = frac(540, 6) = 90 " cách"
  $
    ]

    #cach-box(title: "Cách 2 — Phân tích theo cấu trúc cỡ nhóm", color: col-violet, icon: "🟣")[
      Chia 6 học sinh thành 3 nhóm không rỗng, các cấu trúc kích thước nhóm khả dĩ là phân hoạch của số 6 thành tổng của 3 số nguyên dương:
  - *Dạng 1 (4-1-1):* Kích thước các nhóm là 4, 1, 1.
    Chọn 4 học sinh cho nhóm lớn: $C_6^4 = 15$ cách. Hai nhóm nhỏ mỗi nhóm 1 học sinh, do vai trò của hai nhóm kích thước bằng nhau (cỡ 1) không phân biệt nên ta chia cho $2!$:
    $ N_1 = frac(C_6^4 dot C_2^1 dot C_1^1, 2!) = frac(15 dot 2, 2) = 15 " cách" $
  - *Dạng 2 (3-2-1):* Kích thước các nhóm là 3, 2, 1.
    Do kích thước các nhóm đôi một khác nhau nên không sợ trùng lặp thứ tự nhóm. Số cách chọn là:
    $ N_2 = C_6^3 dot C_3^2 dot C_1^1 = 20 dot 3 dot 1 = 60 " cách" $
  - *Dạng 3 (2-2-2):* Kích thước các nhóm là 2, 2, 2.
    Do cả 3 nhóm đều có kích thước bằng nhau (cỡ 2) và không phân biệt nên ta phải chia cho hoán vị của 3 nhóm tức $3!$:
    $ N_3 = frac(C_6^2 dot C_4^2 dot C_2^2, 3!) = frac(15 dot 6 dot 1, 6) = 15 " cách" $
  Tổng số cách chia là: $N = N_1 + N_2 + N_3 = 15 + 60 + 15 = 90$ cách.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 9: ĐẾM TRONG HÌNH HỌC PHẲNG VÀ LƯỚI TỌA ĐỘ
// ══════════════════════════════════════════════════════════════
= 9 — Đếm Trong Hình Học Phẳng Và Lưới

== Lý Thuyết

#theory-box[
  *1. Số đoạn thẳng, đường thẳng từ $n$ điểm:*
  - Số đoạn thẳng tạo bởi $n$ điểm phân biệt: $C_n^2$.
  - Số đường thẳng tạo bởi $n$ điểm phân biệt trong đó không có 3 điểm nào thẳng hàng: $C_n^2$.

  *2. Đa giác và đường chéo:*
  Cho đa giác đều $n$ đỉnh ($n >= 3$):
  - Số tam giác tạo bởi các đỉnh: $C_n^3$.
  - Số đường chéo của đa giác: $C_n^2 - n = frac(n(n-3), 2)$.

  *3. Hình chữ nhật trong lưới:*
  Một lưới tạo bởi $m$ đường thẳng song song nằm ngang cắt $n$ đường thẳng song song thẳng đứng. Số hình chữ nhật tạo thành là:
  $ N = C_m^2 dot C_n^2 $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Tính số đường chéo của một đa giác đều có 10 cạnh.
  ],
  [35],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Đa giác có 10 cạnh ứng với 10 đỉnh.
  Số đoạn thẳng nối giữa 2 đỉnh bất kỳ là: $C_(10)^2 = 45$.
  Trong 45 đoạn thẳng này, có 10 đoạn là cạnh của đa giác.
  Số đường chéo của đa giác là: $45 - 10 = 35$ đường chéo.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Cho hai đường thẳng song song $d_1$ và $d_2$. Trên đường thẳng $d_1$ lấy 5 điểm phân biệt, trên đường thẳng $d_2$ lấy 6 điểm phân biệt. Hỏi có thể tạo ra bao nhiêu tam giác có các đỉnh là các điểm đã cho?
  ],
  [135],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Một tam giác được tạo ra bằng cách chọn 3 điểm không thẳng hàng. Có hai trường hợp chọn điểm từ hai đường thẳng song song:
  - *TH1:* Chọn 2 điểm trên $d_1$ và 1 điểm trên $d_2$:
    $ C_5^2 dot C_6^1 = 10 dot 6 = 60 " tam giác" $
  - *TH2:* Chọn 1 điểm trên $d_1$ và 2 điểm trên $d_2$:
    $ C_5^1 dot C_6^2 = 5 dot 15 = 75 " tam giác" $
  Tổng số tam giác tạo thành là: $60 + 75 = 135$ tam giác.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Cho đa giác đều $2n$ đỉnh nội tiếp trong một đường tròn. Hỏi có bao nhiêu hình chữ nhật có các đỉnh là đỉnh của đa giác đều đó?
  ],
  [$frac(n(n-1), 2)$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Sử dụng đường kính đường tròn ngoại tiếp", color: col-blue, icon: "🔵")[
      Mọi hình chữ nhật nội tiếp trong đường tròn đều có hai đường chéo là hai đường kính của đường tròn đó.
  - Số đỉnh của đa giác đều là $2n$ nên số đường kính nối từ các đỉnh đối diện đi qua tâm đường tròn là $n$ đường kính.
  - Cứ mỗi cách chọn ra 2 đường kính bất kỳ từ $n$ đường kính này sẽ tạo thành 4 đỉnh của một hình chữ nhật duy nhất.
  Số hình chữ nhật tạo thành là:
  $ N = C_n^2 = frac(n(n-1), 2) " hình chữ nhật" $
    ]

    #cach-box(title: "Cách 2 — Sử dụng tính chất đối xứng tâm", color: col-violet, icon: "🟣")[
      Một hình chữ nhật được xác định bởi 4 đỉnh đối xứng nhau từng cặp qua tâm đường tròn.
  - Chọn đỉnh thứ nhất trong $2n$ đỉnh: có $2n$ cách chọn.
  - Chọn đỉnh thứ hai không đối diện qua tâm với đỉnh thứ nhất: có $2n - 2$ cách chọn.
  - Khi đã chọn xong 2 đỉnh này, 2 đỉnh còn lại bắt buộc phải là 2 đỉnh đối diện qua tâm của chúng để tạo thành một hình chữ nhật.
  Vì vai trò của 4 đỉnh trong hình chữ nhật là như nhau (được đếm 4 lần cho mỗi đỉnh bắt đầu) và việc chọn đỉnh thứ nhất rồi đến đỉnh thứ hai tạo ra một sự sắp xếp thứ tự giữa hai đường chéo (chia thêm 2), ta phải chia cho hệ số lặp là $4 dot 2 = 8$.
  Số hình chữ nhật là:
  $ N = frac(2n dot (2n-2), 8) = frac(4n(n-1), 8) = frac(n(n-1), 2) $
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 10: ĐẾM SỐ TỰ NHIÊN CHIA HẾT VÀ CẤU TRÚC CHỮ SỐ
// ══════════════════════════════════════════════════════════════
= 10 — Đếm Số Tự Nhiên Chia Hết

== Lý Thuyết

#theory-box[
  *Dấu hiệu chia hết cơ bản:*
  - Chia hết cho 2: Chữ số tận cùng chẵn $\{0, 2, 4, 6, 8\}$.
  - Chia hết cho 5: Chữ số tận cùng $\{0, 5\}$.
  - Chia hết cho 3: Tổng các chữ số chia hết cho 3.
  - Chia hết cho 9: Tổng các chữ số chia hết cho 9.
  - Chia hết cho 4: Hai chữ số tận cùng tạo thành số chia hết cho 4.

  *Chiến lược xử lý số 0:* Chữ số hàng cao nhất luôn phải khác 0. Khi lập số, hãy đặc biệt lưu ý tách riêng trường hợp có số 0 hoặc ưu tiên xử lý vị trí đầu tiên.
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Lập được bao nhiêu số tự nhiên có 3 chữ số đôi một khác nhau từ tập hợp $\{0, 1, 2, 3, 4, 5\}$ sao cho số đó chia hết cho 5?
  ],
  [36],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi số cần lập là $overline(a b c)$ với $a ne 0$ và $c  in  \{0, 5\}$.
  - *TH1 ($c = 0$):*
    - Chọn $c$: 1 cách.
    - Chọn $a$ từ $\{1, 2, 3, 4, 5\}$: 5 cách.
    - Chọn $b$ từ 4 chữ số còn lại: 4 cách.
    Số lượng số: $1 dot 5 dot 4 = 20$ số.
  - *TH2 ($c = 5$):*
    - Chọn $c$: 1 cách.
    - Chọn $a$ từ $\{1, 2, 3, 4\}$ (khác 0 và 5): 4 cách.
    - Chọn $b$ từ $\{0\}$ và 3 chữ số còn lại: 4 cách.
    Số lượng số: $1 dot 4 dot 4 = 16$ số.
  Tổng số các số lập được là: $20 + 16 = 36$ số.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Từ các chữ số $\{1, 2, 3, 4, 5, 6, 7, 8, 9\}$, lập được bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau sao cho có đúng 3 chữ số lẻ và 2 chữ số chẵn?
  ],
  [7200],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Tập chữ số lẻ là $\{1, 3, 5, 7, 9\}$ (5 chữ số), tập chữ số chẵn là $\{2, 4, 6, 8\}$ (4 chữ số).
  Quy trình lập số gồm 3 giai đoạn liên tiếp:
  - Giai đoạn 1: Chọn ra 3 chữ số lẻ từ 5 chữ số lẻ: có $C_5^3 = 10$ cách.
  - Giai đoạn 2: Chọn ra 2 chữ số chẵn từ 4 chữ số chẵn: có $C_4^2 = 6$ cách.
  - Giai đoạn 3: Hoán vị sắp xếp 5 chữ số đã chọn thành số tự nhiên: có $5! = 120$ cách.
  Theo nguyên lý nhân, số các số lập được là: $10 dot 6 dot 120 = 7200$ số.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Lập được bao nhiêu số tự nhiên có 4 chữ số đôi một khác nhau từ tập hợp $\{0, 1, 2, 3, 4, 5\}$ sao cho số đó chia hết cho 3?
  ],
  [96],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Chia trường hợp theo phần tử bị loại", color: col-blue, icon: "🔵")[
      Tập ban đầu có 6 chữ số $\{0, 1, 2, 3, 4, 5\}$ với tổng bằng 15.
  Để lập số có 4 chữ số chia hết cho 3, ta cần chọn ra 4 chữ số có tổng chia hết cho 3. Điều này tương đương với việc ta loại đi 2 chữ số có tổng chia hết cho 3 (vì $15 equiv 0 mod 3$).
  Các cặp chữ số bị loại có tổng chia hết cho 3 là:
  - *Cặp $\{0, 3\}$:* Tập còn lại $\{1, 2, 4, 5\}$ không chứa số 0. Số cách lập là $4! = 24$.
  - *Cặp $\{1, 2\}$:* Tập còn lại $\{0, 3, 4, 5\}$ chứa số 0. Số cách lập là $3 dot 3! = 18$.
  - *Cặp $\{1, 5\}$:* Tập còn lại $\{0, 2, 3, 4\}$ chứa số 0. Số cách lập là $3 dot 3! = 18$.
  - *Cặp $\{2, 4\}$:* Tập còn lại $\{0, 1, 3, 5\}$ chứa số 0. Số cách lập là $3 dot 3! = 18$.
  - *Cặp $\{4, 5\}$:* Tập còn lại $\{0, 1, 2, 3\}$ chứa số 0. Số cách lập là $3 dot 3! = 18$.
  Tổng số các số lập được là: $24 + 18 dot 4 = 96$ số.
    ]

    #cach-box(title: "Cách 2 — Phân nhóm số dư theo mô-đun 3", color: col-violet, icon: "🟣")[
      Ta phân hoạch tập hợp ban đầu thành 3 nhóm theo số dư khi chia cho 3:
  - Nhóm dư 0: $X_0 = \{0, 3\}$ (2 phần tử).
  - Nhóm dư 1: $X_1 = \{1, 4\}$ (2 phần tử).
  - Nhóm dư 2: $X_2 = \{2, 5\}$ (2 phần tử).
  Để tổng của 4 chữ số chia hết cho 3, ta có các cách kết hợp số lượng phần tử từ mỗi nhóm sau:
  - *Trường hợp 1 (Chọn từ cả 3 nhóm):* Chọn 2 phần tử nhóm $X_0$, 1 phần tử nhóm $X_1$, 1 phần tử nhóm $X_2$ (tổng dư $0 + 0 + 1 + 2 equiv 0 mod 3$).
    - Số cách chọn bộ số: $C_2^2 dot C_2^1 dot C_2^1 = 4$ bộ chữ số.
    - Cả 4 bộ này đều chứa chữ số 0. Số cách xếp mỗi bộ là: $3 dot 3! = 18$ cách.
    - Số lượng số: $4 dot 18 = 72$ số.
  - *Trường hợp 2 (Không chọn nhóm $X_0$):* Chọn 2 phần tử nhóm $X_1$, 2 phần tử nhóm $X_2$ (tổng dư $1 + 1 + 2 + 2 = 6 equiv 0 mod 3$).
    - Số cách chọn bộ số: $C_2^2 dot C_2^2 = 1$ bộ duy nhất là $\{1, 4, 2, 5\}$.
    - Bộ này không chứa chữ số 0. Số cách xếp là: $4! = 24$ số.
  Tổng số các số lập được là: $72 + 24 = 96$ số.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 11: NGUYÊN LÝ SONG ÁNH VÀ ĐÁNH SỐ VỊ TRÍ
// ══════════════════════════════════════════════════════════════
= 11 — Nguyên Lý Song Ánh Và Đánh Số

== Lý Thuyết

#theory-box[
  *1. Nguyên lý Song ánh (Bijective Principle):*
  Nếu thiết lập được một ánh xạ $f: A rightarrow B$ là song ánh (1-1 và bao phủ toàn bộ) giữa hai tập hợp hữu hạn $A$ và $B$, thì $|A| = |B|$.
  - *Ứng dụng:* Thay vì đếm trực tiếp tập hợp phức tạp $A$, ta chuyển sang đếm tập hợp đơn giản $B$ có cấu trúc dễ mô tả hơn.

  *2. Phương pháp Đánh số vị trí:*
  Gán nhãn tọa độ hoặc chỉ số thứ tự từ điển cho các đối tượng. Phân tích các bước chuyển vị trí theo quy luật toán học để đếm số cấu hình hợp lệ.
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Chứng minh rằng số tập hợp con của một tập hợp gồm $n$ phần tử là $2^n$.
  ],
  [Đpcm],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Cho tập $S = \{s_1, s_2, ..., s_n\}$. Mỗi tập con $A subseteq S$ tương ứng song ánh 1-1 với một chuỗi nhị phân $x = (x_1, x_2, ..., x_n)$ độ dài $n$ theo quy tắc:
  - $x_i = 1$ nếu $s_i  in  A$.
  - $x_i = 0$ nếu $s_i  notin  A$.
  Số chuỗi nhị phân độ dài $n$ là $2^n$ (mỗi vị trí có 2 cách chọn 0 hoặc 1). Do đó, số tập con của tập hợp $S$ bằng $2^n$.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Có bao nhiêu tập con của tập hợp $\{1, 2, ..., 10\}$ chứa ít nhất một số lẻ?
  ],
  [992],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Số tập con bất kỳ của tập hợp gồm 10 phần tử là: $2^(10) = 1024$.
  - Tập con không chứa số lẻ nào (tức là chỉ chứa các số chẵn lấy từ $\{2, 4, 6, 8, 10\}$ - có 5 phần tử) là tập con của tập các số chẵn.
    Số tập con chỉ chứa số chẵn là: $2^5 = 32$.
  - Số tập con chứa ít nhất một số lẻ là: $1024 - 32 = 992$ tập con.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu con đường đi ngắn nhất từ $(0,0)$ đến $(n,n)$ trên lưới tọa độ phẳng chỉ đi phải $(+1,0)$ hoặc lên $(0,+1)$ sao cho đường đi không bao giờ vượt qua phía trên đường phân giác $y = x$ (có thể chạm vào đường phân giác)?
  ],
  [$frac(1, n+1) C_(2n)^n$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Nguyên lý phản xạ của André - André's Reflection Method", color: col-blue, icon: "🔵")[
      - Tổng số đường đi ngắn nhất bất kỳ từ $(0,0)$ đến $(n,n)$ là: $C_(2n)^n$.
  - Ta đếm số con đường vi phạm (đi qua phía trên đường $y=x$, tức là chạm vào đường thẳng $y = x + 1$).
    - Giả sử đường đi chạm đường $y = x + 1$ lần đầu tiên tại điểm $P(k, k+1)$.
    - Ta phản xạ phần đường đi từ $(0,0)$ đến $P$ qua đường thẳng $y = x + 1$. Điểm đầu $(0,0)$ qua phép phản xạ biến thành điểm $A'(-1, 1)$.
    - Mỗi con đường vi phạm tương ứng song ánh 1-1 với một con đường đi bất kỳ từ điểm bắt đầu mới $A'(-1, 1)$ đến đích $(n,n)$.
    - Khoảng cách từ $A'(-1, 1)$ đến $(n,n)$ cần đi là: $n - (-1) = n+1$ bước sang phải và $n - 1$ bước đi lên.
    - Số con đường vi phạm là: $C_(2n)^(n-1)$.
  - Số con đường hợp lệ là số Catalan $C_n$:
    $ C_n = C_(2n)^n - C_(2n)^(n-1) = frac(1, n+1) C_(2n)^n $
    ]

    #cach-box(title: "Cách 2 — Lập công thức truy hồi trạng thái", color: col-violet, icon: "🟣")[
      Gọi $f(i,j)$ là số con đường đi từ $(0,0)$ đến $(i,j)$ thỏa mãn điều kiện luôn ở phía dưới đường $y=x$ ($i >= j$).
  - Ta có hệ thức bước đi: $f(i,j) = f(i-1, j) + f(i, j-1)$ với mọi $i >= j$.
  - Biên điều kiện: $f(i, 0) = 1$ với mọi $i$, và $f(i, j) = 0$ nếu $i < j$.
  Bằng phương pháp tính toán hệ số quy hoạch động trên lưới tam giác dưới, ta chứng minh được nghiệm tổng quát tại điểm $(n,n)$ là:
  $ f(n,n) = C_n = frac(1, n+1) C_(2n)^n $
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 12: NGUYÊN LÝ ĐI-RÍCH-LÊ (PIGEONHOLE PRINCIPLE)
// ══════════════════════════════════════════════════════════════
= 12 — Nguyên Lý Đi-rích-lê Trong Tổ Hợp

== Lý Thuyết

#theory-box[
  *1. Nguyên lý Đi-rích-lê cơ bản (Pigeonhole Principle):*
  Nếu nhốt $n+1$ con thỏ vào $n$ cái chuồng thì có ít nhất 1 chuồng chứa từ 2 con thỏ trở lên.

  *2. Nguyên lý Đi-rích-lê tổng quát:*
  Nếu nhốt $m$ con thỏ vào $n$ cái chuồng ($m > n$) thì có ít nhất 1 chuồng chứa không ít hơn:
  $ floor(frac(m-1, n)) + 1 $ con thỏ.

  *Chiến lược áp dụng:* Xác định rõ "Thỏ" (đối tượng cần đếm) và "Chuồng" (phân hoạch thuộc tính/trạng thái). Thiết kế chuồng sao cho khi thỏ rơi vào chung chuồng thì tính chất cần chứng minh tự động xảy ra.
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Chứng minh rằng trong một nhóm gồm 13 người, luôn tồn tại ít nhất 2 người có cùng tháng sinh.
  ],
  [Đpcm],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - "Thỏ": 13 người trong nhóm.
  - "Chuồng": 12 tháng sinh trong năm (từ tháng 1 đến tháng 12).
  Vì số thỏ (13) lớn hơn số chuồng (12), theo nguyên lý Đi-rích-lê, có ít nhất 2 người (2 con thỏ) sinh vào cùng một tháng (cùng 1 chuồng).
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Chọn ra 6 số từ tập hợp $\{1, 2, ..., 10\}$. Chứng minh rằng luôn tìm được hai số có tổng bằng 11.
  ],
  [Đpcm],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Ta phân hoạch tập hợp $\{1, 2, ..., 10\}$ thành 5 cặp số có tổng bằng 11 (đóng vai trò là các "chuồng"):
    $ X_1 = \{1, 10\}, X_2 = \{2, 9\}, X_3 = \{3, 8\}, X_4 = \{4, 7\}, X_5 = \{5, 6\} $
  - "Thỏ" là 6 số được chọn.
  - Số thỏ (6) lớn hơn số chuồng (5), theo nguyên lý Đi-rích-lê, có ít nhất 2 số được chọn cùng thuộc vào một cặp số $X_i$.
  Hai số này có tổng đúng bằng 11.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Cho tập hợp $S = \{1, 2, ..., 200\}$. Chọn ra 101 số nguyên từ tập $S$. Chứng minh rằng trong 101 số được chọn luôn tồn tại hai số sao cho số này là bội của số kia.
  ],
  [Đpcm],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Phân tích số học theo lũy thừa của 2", color: col-blue, icon: "🔵")[
      Mỗi số nguyên dương $x  in  S$ đều có thể biểu diễn duy nhất dưới dạng:
  $ x = 2^k dot q $
  Trong đó $k$ là số nguyên không âm ($k >= 0$) và $q$ là số lẻ dương.
  - Vì $x <= 200$ nên phần lẻ $q$ là số lẻ dương nhỏ hơn 200.
  - Trong tập $S = \{1, 2, ..., 200\}$, số lượng số lẻ dương chỉ có đúng 100 số: $\{1, 3, 5, ..., 199\}$. Đây chính là 100 chiếc "chuồng".
  - "Thỏ" là 101 số nguyên được chọn từ $S$.
  - Theo nguyên lý Đi-rích-lê, khi chọn 101 số, có ít nhất 2 số có cùng phần lẻ $q$.
  Gọi hai số đó là $x_1 = 2^(k_1) dot q$ và $x_2 = 2^(k_2) dot q$.
  - Nếu $k_1 < k_2$ thì $x_2$ chia hết cho $x_1$ (tức $x_2$ là bội của $x_1$).
  - Nếu $k_1 > k_2$ thì $x_1$ chia hết cho $x_2$ (tức $x_1$ là bội của $x_2$).
  Chứng minh hoàn tất.
    ]

    #cach-box(title: "Cách 2 — Phân hoạch tập hợp thành chuỗi bội số", color: col-violet, icon: "🟣")[
      Ta chia tập hợp $\{1, 2, ..., 200\}$ thành 100 tập con dạng chuỗi bội số (mỗi tập con đóng vai trò là một "chuồng"):
  $ C_q = \{q, 2q, 4q, 8q, ...\} cap \{1, 2, ..., 200\} $
  Với $q$ chạy qua 100 số lẻ từ 1 đến 199.
  - Ví dụ:
    - $C_1 = \{1, 2, 4, 8, 16, 32, 64, 128\}$
    - $C_3 = \{3, 6, 12, 24, 48, 96, 192\}$
    - ...
  - Rõ ràng, 100 tập con này đôi một rời nhau và phủ hết tập $S$.
  - Khi chọn 101 số từ $S$, theo nguyên lý Đi-rích-lê, có ít nhất 2 số được chọn nằm chung trong một tập con $C_q$.
  Hai số bất kỳ trong cùng một tập con $C_q$ luôn có dạng $2^a q$ và $2^b q$. Số có số mũ lũy thừa của 2 nhỏ hơn sẽ là ước của số còn lại.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 13: HỆ THỨC TRUY HỒI VÀ CÁC DÃY SỐ ĐẶC BIỆT
// ══════════════════════════════════════════════════════════════
= 13 — Hệ Thức Truy Hồi Và Dãy Số Đặc Biệt

== Lý Thuyết

#theory-box[
  *Phương pháp lập Hệ thức truy hồi:*
  Khi đếm cấu hình độ dài $n$, ta liên hệ nó với các cấu hình có độ dài nhỏ hơn như $n-1, n-2$ bằng cách phân tích cấu trúc của phần tử cuối cùng hoặc bước đi cuối cùng.

  *Các dãy số điển hình:*
  - *Fibonacci:* $F_n = F_(n-1) + F_(n-2)$ (Lát gạch $1 times 2$, bậc thang).
  - *Tribonacci:* $T_n = T_(n-1) + T_(n-2) + T_(n-3)$ (Không có 3 phần tử cấm kề nhau).
  - *Catalan:* $C_n = frac(1, n+1) C_(2n)^n$ (Ngoặc hợp lệ, phân hoạch tam giác đa giác).
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Một người muốn leo lên một cầu thang gồm $n$ bậc. Mỗi bước chân người đó có thể bước lên 1 bậc hoặc 2 bậc. Hỏi có bao nhiêu cách để leo hết cầu thang?
  ],
  [8],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi $a_n$ là số cách leo hết cầu thang $n$ bậc.
  Xét bước chân cuối cùng để chạm đỉnh bậc thứ $n$:
  - Nếu bước cuối là bước 1 bậc: trước đó người đó phải ở bậc thứ $n-1$. Có $a_(n-1)$ cách đến đây.
  - Nếu bước cuối là bước 2 bậc: trước đó người đó phải ở bậc thứ $n-2$. Có $a_(n-2)$ cách đến đây.
  Theo nguyên lý cộng, ta có hệ thức: $a_n = a_(n-1) + a_(n-2)$ (với $n >= 3$).
  Khởi tạo:
  - Bậc 1 ($n=1$): Chỉ có 1 cách (bước 1 bậc) $rightarrow a_1 = 1$.
  - Bậc 2 ($n=2$): Có 2 cách (bước 1-1 hoặc bước 2) $rightarrow a_2 = 2$.
  Dãy số thu được là dãy Fibonacci dịch chuyển: $a_3 = 3, a_4 = 5, a_5 = 8$.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Lập được bao nhiêu chuỗi nhị phân độ dài $n$ ($n >= 1$) không chứa chuỗi con "00"?
  ],
  [$F_(n+2)$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi $a_n$ là số chuỗi nhị phân độ dài $n$ thỏa mãn điều kiện.
  Phân tích chữ số tận cùng của chuỗi nhị phân hợp lệ:
  - Nếu chuỗi tận cùng bằng chữ số 1: Phần trước đó dài $n-1$ phải là một chuỗi hợp lệ (không chứa "00"). Có $a_(n-1)$ cách.
  - Nếu chuỗi tận cùng bằng chữ số 0: Do không được chứa "00" nên chữ số kề cuối bắt buộc phải là 1. Phần trước đó dài $n-2$ phải là chuỗi hợp lệ. Có $a_(n-2)$ cách.
  Theo nguyên lý cộng, ta có hệ thức truy hồi:
  $ a_n = a_(n-1) + a_(n-2) quad (n >= 3) $
  Khởi tạo giá trị:
  - $n=1$: $\{0, 1\} rightarrow a_1 = 2$.
  - $n=2$: $\{01, 10, 11\} rightarrow a_2 = 3$.
  Vậy dãy số là: $a_n = F_(n+2)$ với $F$ là số Fibonacci.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Có bao nhiêu cách tô màu các đỉnh của một đa giác đều có $n$ cạnh ($n >= 3$) bằng 3 màu khác nhau sao cho không có hai đỉnh kề nhau nào được tô cùng một màu?
  ],
  [$2^n + 2 (-1)^n$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Lập hệ thức truy hồi tuyến tính", color: col-blue, icon: "🔵")[
      Gọi các đỉnh của đa giác theo thứ tự vòng tròn là $1, 2, ..., n$. Gọi $a_n$ là số cách tô màu hợp lệ đa giác $n$ đỉnh.
  Xét việc "cắt" liên kết kề giữa đỉnh $n-1$ và đỉnh $1$ để quy về đa giác ít đỉnh hơn:
  - Nếu trong cách tô màu hợp lệ của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có màu khác nhau:
    Khi đó, việc tô màu $n-1$ đỉnh này tương đương với cách tô hợp lệ đa giác $n-1$ đỉnh (có $a_(n-1)$ cách). Đỉnh $n$ kề với 2 đỉnh khác màu nhau (đỉnh 1 và đỉnh $n-1$) nên chỉ còn đúng $3 - 2 = 1$ cách chọn màu.
  - Nếu trong cách tô màu của $n-1$ đỉnh đầu tiên, đỉnh $n-1$ và đỉnh 1 có cùng màu:
    Ta có thể chập đỉnh $n-1$ và đỉnh 1 làm một đỉnh duy nhất. Khi đó, cấu hình màu trở thành cách tô màu hợp lệ cho đa giác $n-2$ đỉnh (có $a_(n-2)$ cách). Khi trả lại đỉnh, đỉnh $n$ kề với 2 đỉnh cùng màu nên có $3 - 1 = 2$ cách chọn màu cho đỉnh $n$.
  Ta thu được hệ thức truy hồi:
  $ a_n = a_(n-1) + 2 a_(n-2) quad (n >= 4) $
  Phương trình đặc trưng: $t^2 - t - 2 = 0 rightarrow t_1 = 2, t_2 = -1$.
  Công thức tổng quát của dãy số là: $a_n = A dot 2^n + B dot (-1)^n$.
  Khởi tạo:
  - Với đa giác 3 đỉnh (tam giác): $a_3 = 3 dot 2 dot 1 = 6$ cách.
  - Với đa giác 2 đỉnh (đoạn thẳng tô 2 màu): $a_2 = 3 dot 2 = 6$ cách.
  Thay $n=2, n=3$ vào hệ thức giải tìm $A, B$:
  $
    cases(
      4A + B = 6,
      8A - B = 6
    ) rightarrow A = 1, B = 2
  $
  Vậy số cách tô màu đa giác $n$ đỉnh là: $a_n = 2^n + 2 dot (-1)^n$.
    ]

    #cach-box(title: "Cách 2 — Sử dụng ma trận trạng thái Markov", color: col-violet, icon: "🟣")[
      Ta sử dụng xích Markov đơn giản để đếm chuỗi màu vòng tròn.
  Gọi ma trận chuyển trạng thái giữa các màu (mỗi bước đi sang đỉnh kề phải đổi màu):
  $
    M = pmat(0, 1, 1; 1, 0, 1; 1, 1, 0)
  $
  Số cách tô màu chuỗi vòng tròn độ dài $n$ chính là vết (trace) của ma trận $M^n$:
  $ a_n = Tr(M^n) = lambda_1^n + lambda_2^n + lambda_3^n $
  Trong đó $lambda_i$ là các trị riêng của ma trận $M$.
  Phương trình trị riêng:
  $
    det(lambda I - M) = 0 leftrightarrow det pmat(lambda, -1, -1; -1, lambda, -1; -1, -1, lambda) = 0 \
    leftrightarrow lambda^3 - 3lambda - 2 = 0 leftrightarrow (lambda - 2)(lambda + 1)^2 = 0
  $
  Trị riêng là $lambda_1 = 2, lambda_2 = -1, lambda_3 = -1$.
  Vậy $a_n = 2^n + (-1)^n + (-1)^n = 2^n + 2 dot (-1)^n$.
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 14: NHỊ THỨC NEWTON VÀ CÁC PHÉP TOÁN BIẾN ĐỔI HỆ SỐ
// ══════════════════════════════════════════════════════════════
= 14 — Nhị Thức Newton Và Biến Đổi Hệ Số

== Lý Thuyết

#theory-box[
  *1. Công thức Nhị thức Newton:*
  $ (a + b)^n = sum_(k=0)^n C_n^k a^(n-k) b^k $

  *2. Các phương pháp biến đổi tính tổng hệ số:*
  - *Thay giá trị đặc biệt:* Thay $x=1, x=-1$ để tính tổng các hệ số chẵn/lẻ.
  - *Đạo hàm nhị thức:* Lấy đạo hàm hai vế để xuất hiện nhân tử $k$ trước hệ số $C_n^k$:
    $ d/(d x) (1+x)^n = n(1+x)^(n-1) = sum_(k=1)^n k C_n^k x^(k-1) $
  - *Tích phân nhị thức:* Lấy tích phân hai vế để xuất hiện mẫu số $k+1$ dưới hệ số $C_n^k$:
    $ int_0^x (1+t)^n d t = frac((1+x)^(n+1) - 1, n+1) = sum_(k=0)^n frac(1, k+1) C_n^k x^(k+1) $
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Tìm hệ số của số hạng chứa $x^3$ trong khai triển của nhị thức:
  $ (x - frac(2, x))^7 quad (x ne 0) $
  ],
  [84],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Số hạng tổng quát trong khai triển là:
  $ T_(k+1) = C_7^k x^(7-k) (-frac(2, x))^k = C_7^k (-2)^k x^(7-2k) $
  Số hạng chứa $x^3$ tương ứng với số mũ: $7 - 2k = 3 leftrightarrow 2k = 4 leftrightarrow k = 2$.
  Hệ số của số hạng chứa $x^3$ là:
  $ C_7^2 (-2)^2 = 21 dot 4 = 84 $
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Tính tổng sau theo $n$:
  $ S = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n $
  ],
  [$n 2^(n-1)$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Ta xuất phát từ khai triển nhị thức Newton:
  $ (1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + ... + C_n^n x^n $
  Lấy đạo hàm hai vế theo biến $x$, ta được:
  $ n(1 + x)^(n-1) = C_n^1 + 2 C_n^2 x + 3 C_n^3 x^2 + ... + n C_n^n x^(n-1) $
  Thay $x = 1$ vào cả hai vế của phương trình đạo hàm trên, ta có:
  $ n(1 + 1)^(n-1) = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n $
  Vậy tổng cần tính là: $S = n dot 2^(n-1)$.
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Tính tổng sau theo $n$:
  $ S = C_n^0 + frac(1, 2) C_n^1 + frac(1, 3) C_n^2 + ... + frac(1, n+1) C_n^n $
  ],
  [$frac(2^(n+1) - 1, n+1)$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Sử dụng tích phân", color: col-blue, icon: "🔵")[
      Khai triển nhị thức Newton:
  $ (1 + t)^n = C_n^0 + C_n^1 t + C_n^2 t^2 + ... + C_n^n t^n $
  Lấy tích phân xác định hai vế từ 0 đến 1 theo biến $t$:
  $ int_0^1 (1 + t)^n d t = int_0^1 (C_n^0 + C_n^1 t + C_n^2 t^2 + ... + C_n^n t^n) d t $
  Tính các tích phân:
  - Vế trái:
    $ int_0^1 (1 + t)^n d t = frac((1 + t)^(n+1), n+1) |_0^1 = frac(2^(n+1) - 1, n+1) $
  - Vế phải:
    $
      int_0^1 (sum_(k=0)^n C_n^k t^k) d t = sum_(k=0)^n C_n^k frac(t^(k+1), k+1) |_0^1 \
      = C_n^0 + frac(1, 2) C_n^1 + frac(1, 3) C_n^2 + ... + frac(1, n+1) C_n^n = S
    $
  Vậy tổng cần tìm là: $S = frac(2^(n+1) - 1, n+1)$.
    ]

    #cach-box(title: "Cách 2 — Biến đổi đại số trực tiếp", color: col-violet, icon: "🟣")[
      Ta biến đổi số hạng tổng quát của chuỗi:
  $
    frac(1, k+1) C_n^k = frac(1, k+1) dot frac(n!, k! dot (n-k)!) = frac(n!, (k+1)! dot (n-k)!) \
    = frac(1, n+1) dot frac((n+1)!, (k+1)! dot ((n+1) - (k+1))!) = frac(1, n+1) C_(n+1)^(k+1)
  $
  Thay biểu thức này vào tổng $S$, ta có:
  $
    S = sum_(k=0)^n frac(1, n+1) C_(n+1)^(k+1) = frac(1, n+1) sum_(k=0)^n C_(n+1)^(k+1) \
    = frac(1, n+1) [C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1)]
  $
  Biết rằng tổng các hệ số nhị thức từ 0 đến $n+1$ là $2^(n+1)$:
  $ C_(n+1)^0 + C_(n+1)^1 + ... + C_(n+1)^(n+1) = 2^(n+1) $
  Suy ra $C_(n+1)^1 + C_(n+1)^2 + ... + C_(n+1)^(n+1) = 2^(n+1) - 1$ (do $C_(n+1)^0 = 1$).
  Thế vào công thức của $S$:
  $ S = frac(2^(n+1) - 1, n+1) $
    ]
  ]
)

// ══════════════════════════════════════════════════════════════
// CHỦ ĐỀ 15: ỨNG DỤNG TỔ HỢP TRONG TRÒ CHƠI & XÁC SUẤT
// ══════════════════════════════════════════════════════════════
= 15 — Ứng Dụng Tổ Hợp Và Xác Suất Trò Chơi

== Lý Thuyết

#theory-box[
  *1. Xác suất cổ điển trên không gian mẫu tổ hợp:*
  $ P(A) = frac(|A|, |Omega|) $
  Trong đó $|Omega|$ và $|A|$ được tính bằng các công cụ đếm tổ hợp nâng cao.

  *2. Xích Markov và Mô hình hóa trạng thái:*
  Với các trò chơi nhiều lượt, xác suất thắng/thua ở mỗi lượt thay đổi phụ thuộc vào trạng thái hiện tại. Ta lập hệ thức liên hệ xác suất giữa các trạng thái kế tiếp và giải phương trình đại số.
]

== Bài Tập Minh Họa

#tln(
  tags: ("Dễ",),
  [
    Một người tung một đồng xu cân đối và đồng chất 6 lần liên tiếp. Tính xác suất để số lần xuất hiện mặt ngửa đúng bằng số lần xuất hiện mặt sấp.
  ],
  [$frac(5, 16)$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Mỗi lần tung đồng xu có 2 khả năng (Ngửa hoặc Sấp). Tổng số kịch bản xảy ra khi tung 6 lần là:
    $ |Omega| = 2^6 = 64 " kịch bản" $
  - Để số lần ngửa bằng số sấp, mỗi mặt phải xuất hiện đúng 3 lần. Số cách chọn ra 3 lượt tung xuất hiện mặt ngửa trong 6 lượt tung là:
    $ |A| = C_6^3 = 20 " cách" $
  - Xác suất cần tìm là: $P(A) = frac(20, 64) = frac(5, 16) = 0.3125$.
    ]
  ]
)

#tln(
  tags: ("Trung bình",),
  [
    Hai đấu thủ A và B chơi một giải cờ vua. Xác suất thắng một ván cờ của A là 0.6, của B là 0.4 (không có hòa). Trận đấu sẽ kết thúc khi có một đấu thủ giành chiến thắng trước đúng 3 ván cờ. Tính xác suất để đấu thủ A thắng giải đấu.
  ],
  [0.68256],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Giải đấu kết thúc sau tối thiểu 3 ván và tối đa 5 ván cờ. A thắng giải đấu trong các trường hợp loại trừ nhau sau:
  - *TH1 (A thắng sau đúng 3 ván):* A thắng cả 3 ván đầu tiên. Xác suất là:
    $ P_3 = (0.6)^3 = 0.216 $
  - *TH2 (A thắng sau đúng 4 ván):* A phải thắng ván thứ 4 và thắng đúng 2 ván trong 3 ván đầu tiên. Xác suất là:
    $ P_4 = C_3^2 dot (0.6)^2 dot (0.4) dot 0.6 = 3 dot 0.36 dot 0.4 dot 0.6 = 0.2592 $
  - *TH3 (A thắng sau đúng 5 ván):* A phải thắng ván thứ 5 và thắng đúng 2 ván trong 4 ván đầu tiên. Xác suất là:
    $ P_5 = C_4^2 dot (0.6)^2 dot (0.4)^2 dot 0.6 = 6 dot 0.36 dot 0.16 dot 0.6 = 0.20736 $
  Tổng xác suất đấu thủ A giành chiến thắng chung cuộc là:
  $ P = P_3 + P_4 + P_5 = 0.216 + 0.2592 + 0.20736 = 0.68256 $
    ]
  ]
)

#tln(
  tags: ("Khó",),
  [
    Hai người chơi A và B luân phiên nhau tung một đồng xu cân đối. Người nào tung được mặt ngửa đầu tiên sẽ giành chiến thắng. Biết A là người được quyền tung trước. Tính xác suất để người A thắng cuộc.
  ],
  [$2/3$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1 — Tổng cấp số nhân lùi vô hạn", color: col-blue, icon: "🔵")[
      Xét các lượt tung mà người A có thể giành chiến thắng:
  - A thắng ở lượt tung thứ 1: A tung được mặt ngửa ngay. Xác suất là $1/2$.
  - A thắng ở lượt tung thứ 3: Lượt 1 A tung sấp ($1/2$), lượt 2 B tung sấp ($1/2$), lượt 3 A tung ngửa ($1/2$). Xác suất là $(1/2)^3 = 1/8$.
  - A thắng ở lượt tung thứ 5: A sấp, B sấp, A sấp, B sấp, A ngửa. Xác suất là $(1/2)^5 = 1/32$.
  Tổng quát, A có thể thắng ở lượt thứ $2k+1$ với xác suất $(1/2)^(2k+1)$.
  Xác suất thắng cuộc của A là tổng của cấp số nhân lùi vô hạn:
  $
    P = frac(1, 2) + (frac(1, 2))^3 + (frac(1, 2))^5 + ... \
    = frac(1, 2) sum_(k=0)^(infty) (frac(1, 4))^k
  $
  Áp dụng công thức tổng cấp số nhân lùi vô hạn với số hạng đầu $u_1 = 1/2$ và công vị $q = 1/4$:
  $ P = frac(u_1, 1 - q) = frac(1/2, 1 - 1/4) = frac(1/2, 3/4) = frac(2, 3) $
    ]

    #cach-box(title: "Cách 2 — Phương trình trạng thái có điều kiện - Markov", color: col-violet, icon: "🟣")[
      Gọi $p$ là xác suất người tung trước giành chiến thắng trong trò chơi này từ thời điểm bắt đầu lượt tung của mình.
  Xét lượt tung của người A (đang đóng vai trò người đi trước):
  - A tung được mặt ngửa (xác suất $1/2$): A thắng cuộc ngay lập tức (xác suất thắng là 1).
  - A tung được mặt sấp (xác suất $1/2$): Lượt chơi chuyển sang người B. Lúc này, người B trở thành người đi trước trong lượt tung của mình. Theo định nghĩa, xác suất để B thắng trò chơi kể từ thời điểm này là $p$. Do đó, xác suất để A thắng trò chơi kể từ thời điểm này là $1 - p$.
  Ta lập phương trình tự liên hệ xác suất:
  $
    p = frac(1, 2) dot 1 + frac(1, 2) dot (1 - p) \
    leftrightarrow p = frac(1, 2) + frac(1, 2) - frac(1, 2) p \
    leftrightarrow frac(3, 2) p = 1 leftrightarrow p = frac(2, 3)
  $
  Xác suất thắng cuộc của người A là $2/3$.
    ]
  ]
)

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN II: ĐỀ LUYỆN TỔNG HỢP
// ══════════════════════════════════════════════════════════════
= 16 — Bài Toán Hoán Vị Không Điểm Bất Động (Derangement)

== Khái Niệm Cơ Bản
Bài toán hoán vị không điểm bất động (hay bài toán Derangement, bài toán lộn xộn, bài toán xếp nhầm phong bì) là bài toán đếm số cách sắp xếp $n$ phần tử $1, 2, dots, n$ vào $n$ vị trí tương ứng $1, 2, dots, n$ sao cho *không có phần tử nào nằm đúng vị trí ban đầu của nó*.

Ký hiệu số các hoán vị không điểm bất động của $n$ phần tử là $D_n$ (đôi khi ký hiệu là $!n$, gọi là "giai thừa phụ" - subfactorial).

#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    // 3 Envelopes (Destination 1, 2, 3)
    let env_color = rgb("E3F2FD")
    let env_stroke = 1.2pt + rgb("1565C0")
    for i in range(3) {
      rect((i*2, 0), (i*2 + 1.2, 0.8), fill: env_color, stroke: env_stroke, radius: 2pt)
      content((i*2 + 0.6, 0.4), text(size: 14pt, weight: "bold", fill: rgb("1565C0"))[#str(i+1)])
      content((i*2 + 0.6, -0.4), text(size: 10pt)[Vị trí đúng])
    }
    
    // 3 Letters (Elements 1, 2, 3) going to WRONG envelopes
    // Derangement: 1 -> 2, 2 -> 3, 3 -> 1
    let let_color = rgb("FFF3E0")
    let let_stroke = 1.2pt + rgb("E65100")
    let targets = (1, 2, 0) // 1 goes to 2 (index 1), 2 goes to 3 (index 2), 3 goes to 1 (index 0)
    
    for i in range(3) {
      // Draw letters above
      rect((i*2, 2.5), (i*2 + 1.2, 3.3), fill: let_color, stroke: let_stroke, radius: 2pt)
      content((i*2 + 0.6, 2.9), text(size: 14pt, weight: "bold", fill: rgb("E65100"))[#str(i+1)])
      content((i*2 + 0.6, 3.7), text(size: 10pt)[Thư])
      
      // Draw arrows
      let start_pt = (i*2 + 0.6, 2.4)
      let end_pt = (targets.at(i)*2 + 0.6, 0.9)
      line(start_pt, end_pt, mark: (end: ">"), stroke: 1.5pt + rgb("E65100"))
    }
  })
]


#theory-box[
  *Định nghĩa Hoán vị không điểm bất động:*
  Một hoán vị $sigma$ của tập hợp $S = \{1, 2, dots, n\}$ được gọi là hoán vị không điểm bất động (Derangement) nếu:
  $sigma(i) != i quad forall i = 1, 2, dots, n$
]

== Các Công Thức Quan Trọng

#key-box[
  *1. Công thức truy hồi (Recurrence Relation):*
  $ D_n = (n-1)(D_{n-1} + D_{n-2}) quad "với " n >= 3 $
  Hoặc một dạng tương đương:
  $ D_n = n D_{n-1} + (-1)^n quad "với " n >= 2 $
  (Điều kiện đầu: $D_1 = 0, D_2 = 1$)

  *2. Công thức tổng quát (Dựa trên Nguyên lý Bù trừ):*
  $ D_n = n! ( 1 - frac(1, 1!) + frac(1, 2!) - frac(1, 3!) + dots + frac((-1)^n, n!) ) $
  Khi $n$ khá lớn, ta xấp xỉ được: $D_n approx frac(n!, e)$ (với $e approx 2.718$).
]

#note-box(title: "Cách nhớ nhanh các giá trị đầu tiên")[
  Các giá trị $D_n$ rất hay gặp trong đề thi:
  - $D_1 = 0$
  - $D_2 = 1$
  - $D_3 = 2$
  - $D_4 = 9$
  - $D_5 = 44$
  - $D_6 = 265$
]

== Phân Loại Bài Tập Và Kỹ Thuật Giải

#prob("1", 
  [Có 5 bức thư và 5 phong bì đã ghi sẵn địa chỉ tương ứng. Người phát thư do vội vàng đã bỏ ngẫu nhiên 5 bức thư vào 5 phong bì. Tính số cách bỏ thư sao cho không có bức thư nào nằm đúng phong bì của nó.], 
  [$D_5 = 44$],
  loigiai: [
    Đây là bài toán hoán vị không điểm bất động kinh điển với $n = 5$.
    Áp dụng công thức tổng quát:
    $ D_5 = 5! ( 1 - frac(1, 1!) + frac(1, 2!) - frac(1, 3!) + frac(1, 4!) - frac(1, 5!) ) $
    $ D_5 = 120 ( frac(1, 2) - frac(1, 6) + frac(1, 24) - frac(1, 120) ) = 60 - 20 + 5 - 1 = 44 " cách." $
    Hoặc sử dụng dãy truy hồi: $D_1 = 0, D_2 = 1, D_3 = 2, D_4 = 9, D_5 = 44$.

    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // Draw 5 envelopes and 5 letters
        let env_color = rgb("E3F2FD"); let env_stroke = 1.2pt + rgb("1565C0")
        let let_color = rgb("FFF3E0"); let let_stroke = 1.2pt + rgb("E65100")
        for i in range(5) {
          rect((i*1.8, 0), (i*1.8 + 1.2, 0.7), fill: env_color, stroke: env_stroke, radius: 2pt)
          content((i*1.8 + 0.6, 0.35), text(size: 9pt, weight: "bold", fill: rgb("1565C0"))[PB #str(i+1)])
          
          rect((i*1.8, 2), (i*1.8 + 1.2, 2.7), fill: let_color, stroke: let_stroke, radius: 2pt)
          content((i*1.8 + 0.6, 2.35), text(size: 9pt, weight: "bold", fill: rgb("E65100"))[Thư #str(i+1)])
        }
        
        // Random derangement arrows
        let targets = (2, 4, 1, 0, 3)
        for i in range(5) {
          let start_pt = (i*1.8 + 0.6, 1.9)
          let end_pt = (targets.at(i)*1.8 + 0.6, 0.8)
          line(start_pt, end_pt, mark: (end: ">"), stroke: 1.2pt + rgb("757575"))
        }
      })
    ]

  ]
)

#prob("2",
  [Một nhóm 6 người mang 6 chiếc ô giống hệt nhau về kiểu dáng nhưng có màu sắc khác nhau. Khi ra về, mỗi người lấy ngẫu nhiên 1 chiếc ô. Hỏi có bao nhiêu trường hợp mà có đúng 2 người lấy đúng ô của mình?],
  [$C_6^2 times D_4 = 135$],
  loigiai: [
    #cach-box(title: "Hướng giải")[
      Bài toán yêu cầu có *đúng 2 người* lấy đúng ô, nghĩa là 4 người còn lại *không ai* lấy đúng ô của mình. Ta chia thành 2 bước đếm:
      - *Bước 1:* Chọn 2 người lấy đúng ô của mình.
      - *Bước 2:* Xếp ô cho 4 người còn lại sao cho không ai lấy đúng ô của mình.
    ]
    *Bước 1:* Số cách chọn 2 người lấy đúng ô từ 6 người là: $C_6^2 = 15$ cách.
    *Bước 2:* Với 4 người còn lại, yêu cầu không ai lấy đúng ô của mình chính là bài toán hoán vị không điểm bất động (derangement) cho $n = 4$.
    Ta có $D_4 = 9$ cách.

    *Kết luận:* Áp dụng nguyên lý nhân, số cách thỏa mãn là: $15 times 9 = 135$ cách.

    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        // 2 people correctly matched (green), 4 deranged (red)
        for i in range(6) {
          let p_color = if i < 2 { rgb("E8F5E9") } else { rgb("FFCDD2") }
          let p_stroke = if i < 2 { 1.2pt + rgb("2E7D32") } else { 1.2pt + rgb("C62828") }
          
          circle((i*2, 2.5), radius: 0.45, fill: p_color, stroke: p_stroke)
          content((i*2, 2.5), text(size: 9pt, weight: "bold")[P#str(i+1)])
          
          // Umbrella
          rect((i*2 - 0.5, -0.3), (i*2 + 0.5, 0.5), fill: rgb("F5F5F5"), stroke: 1.2pt + rgb("616161"), radius: 2pt)
          content((i*2, 0.1), text(size: 9pt)[Ô #str(i+1)])
        }
        
        // Correct matches for first 2
        for i in range(2) {
          line((i*2, 2.0), (i*2, 0.6), mark: (end: ">"), stroke: 1.5pt + rgb("2E7D32"))
        }
        
        // Deranged matches for remaining 4
        let targets = (3, 4, 5, 2)
        for i in range(4) {
          let p_idx = i + 2
          let t_idx = targets.at(i)
          line((p_idx*2, 2.0), (t_idx*2, 0.6), mark: (end: ">"), stroke: 1.2pt + rgb("C62828"))
        }
        
        // Add a box around the deranged part
        rect((3.2, -0.7), (10.8, 3.2), stroke: (dash: "dashed", paint: rgb("C62828"), thickness: 1.2pt))
        content((7, -1.2), text(size: 10pt, fill: rgb("C62828"))[Hoán vị không điểm bất động $D_4$])
        
        // Box for chosen 2
        rect((-0.8, -0.7), (2.8, 3.2), stroke: (dash: "dashed", paint: rgb("2E7D32"), thickness: 1.2pt))
        content((1, -1.2), text(size: 10pt, fill: rgb("2E7D32"))[$C_6^2$ (chọn 2 đúng)])
      })
    ]

  ]
)

#prob("3",
  [Một bài kiểm tra trắc nghiệm có 5 câu hỏi, mỗi câu có 4 đáp án A, B, C, D. Một học sinh chọn bừa một đáp án cho mỗi câu. Có bao nhiêu cách để học sinh đó làm sai tất cả 5 câu hỏi?],
  [$243$],
  loigiai: [
    #warn-box[
      Đừng nhầm lẫn bài toán này với Hoán vị không điểm bất động! Bài toán này các lựa chọn là độc lập và có lặp lại, không phải là hoán vị.
    ]
    Mỗi câu hỏi có 4 đáp án, trong đó có đúng 1 đáp án đúng và 3 đáp án sai.
    Để làm sai câu 1, có 3 cách chọn đáp án.
    Tương tự, để làm sai câu 2, có 3 cách chọn...
    Vì 5 câu hỏi là độc lập nhau, áp dụng nguyên lý nhân, số cách để làm sai cả 5 câu là:
    $ 3 times 3 times 3 times 3 times 3 = 3^5 = 243 " cách." $

    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1.1cm, {
        import cetz.draw: *
        // 5 questions, 4 options each
        for q in range(5) {
          content((q*2.2, 3), text(size: 9pt, weight: "bold")[Câu #str(q+1)])
          let correct_opt = (1, 3, 0, 2, 1).at(q) // Random correct options: B, D, A, C, B
          for opt in range(4) {
            let is_correct = (opt == correct_opt)
            let o_color = if is_correct { rgb("E8F5E9") } else { rgb("FFCDD2") }
            let o_stroke = if is_correct { 1.2pt + rgb("2E7D32") } else { 1.2pt + rgb("C62828") }
            let opt_name = ("A", "B", "C", "D").at(opt)
            
            circle((q*2.2, 1.5 - opt*0.8), radius: 0.25, fill: o_color, stroke: o_stroke)
            content((q*2.2, 1.5 - opt*0.8), text(size: 8pt)[#opt_name])
            
            if is_correct {
              content((q*2.2 + 0.6, 1.5 - opt*0.8), text(size: 7pt, fill: rgb("2E7D32"))[Đúng])
            } else {
              // Mark the 3 wrong choices
              line((q*2.2 - 0.4, 1.5 - opt*0.8), (q*2.2 - 0.7, 1.5 - opt*0.8), mark: (end: ">"), stroke: 1pt + rgb("C62828"))
              content((q*2.2 - 1.0, 1.5 - opt*0.8), text(size: 7pt, fill: rgb("C62828"))[Chọn sai])
            }
          }
          // Dashed box for each question
          rect((q*2.2 - 1.4, -1.3), (q*2.2 + 1.1, 2.0), stroke: (dash: "dashed", paint: rgb("BDBDBD"), thickness: 0.8pt), radius: 2pt)
          content((q*2.2, -1.7), text(size: 8pt, style: "italic")[3 cách sai])
        }
      })
    ]

  ]
)

#prob("4",
  [Tại một bữa tiệc có 4 cặp vợ chồng. Để tăng tính giao lưu, người ta yêu cầu các cặp vợ chồng chia tay nhau và mỗi người sẽ khiêu vũ với một người khác giới không phải vợ/chồng mình. Hỏi có bao nhiêu cách ghép đôi khiêu vũ?],
  [$9$],
  loigiai: [
    Gọi tập các người chồng là $A = \{H_1, H_2, H_3, H_4\}$ và tập các người vợ là $B = \{W_1, W_2, W_3, W_4\}$.
    Một cách ghép đôi khiêu vũ là một song ánh từ tập $A$ sang tập $B$.

    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Bipartite graph: Men (A) and Women (B)
        let c_man = rgb("E3F2FD"); let s_man = 1.2pt + rgb("1565C0")
        let c_wom = rgb("FCE4EC"); let s_wom = 1.2pt + rgb("C2185B")
        
        for i in range(4) {
          // Men nodes (left)
          circle((0, i*1.5), radius: 0.3, fill: c_man, stroke: s_man)
          content((0, i*1.5), text(size: 10pt)[$H_#str(4-i)$])
          
          // Women nodes (right)
          circle((3, i*1.5), radius: 0.3, fill: c_wom, stroke: s_wom)
          content((3, i*1.5), text(size: 10pt)[$W_#str(4-i)$])
        }
        
        // Example derangement pairing: H1-W2, H2-W3, H3-W4, H4-W1
        // Indices in loop: 3->2, 2->1, 1->0, 0->3 (since drawn bottom-up)
        let edges = ((3, 2), (2, 1), (1, 0), (0, 3))
        for e in edges {
          line((0.35, e.at(0)*1.5), (2.65, e.at(1)*1.5), stroke: 1.5pt + rgb("757575"))
        }
        
        // Red crossed dashed line showing forbidden H_i -> W_i
        for i in range(4) {
          line((0.35, i*1.5), (2.65, i*1.5), stroke: (paint: rgb("FFCDD2"), thickness: 1pt, dash: "dashed"))
        }
      })
    ]

    Do không ai khiêu vũ với vợ/chồng mình, nên mỗi người chồng $H_i$ không được ghép với người vợ $W_i$.
    Do đó, bài toán tương đương với việc tìm số hoán vị không điểm bất động của tập 4 phần tử.
    Số cách ghép đôi là: $D_4 = 9$ cách.
  ]
)
#let recognize-box(title, body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + rgb("0D47A1"), rest: 0.6pt + rgb("90CAF9")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("0D47A1"), weight: "bold")[🔍 #title]
  #v(0.3em)
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

= 17 — Bổ Đề Burnside Và Bài Toán Vòng Cổ Đối Xứng

#recognize-box("Đại Bác 8 — Burnside Quét Đối Xứng")[
  *Vỏ bọc hay gặp:* "xâu $n$ hạt thành vòng; hai vòng coi là giống nhau nếu xoay được",
  "thiết kế vòng cườm $n$ màu; không phân biệt các vòng quay bằng nhau",
  "xếp $n$ đồ vật trên bàn tròn; hai cách xếp giống nếu xoay được/lật được".

  *Cú bắn chuẩn:* không đếm trực tiếp số cấu hình nữa, mà lấy *trung bình số cấu hình bất biến* theo từng phép đối xứng.

  *Công thức:*
  $ "Số phân biệt" = frac(1, |G|) sum_(g in G) |X^g| $
  trong đó $|X^g| = k^(c(g))$, $c(g)$ = số chu trình của phép đối xứng $g$.

  *Biến thể phổ thông hay nấp:* vòng hoa, vòng khăn ăn, chuỗi hạt, họa tiết tròn, logo quay, mô hình quanh bàn tròn.

  *Bẫy cuối:* nếu vị trí là cố định thì quay lại Đại Bác 3. Burnside chỉ xuất hiện khi đề thật sự nói "coi như nhau nếu xoay/lật".

  *Phân loại:*
  #table(
    columns: (2fr, 1.5fr, 1.5fr),
    stroke: 0.5pt + rgb("80CBC4"),
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 9pt, y: 7pt),
    align: (left, center, center),
    table.header(
      text(fill: white, weight: "bold")[Điều kiện],
      text(fill: white, weight: "bold")[Nhóm],
      text(fill: white, weight: "bold")[$|G|$],
    ),
    [Giống nếu xoay], [Nhóm xoay $C_n$], [$n$],
    [Giống nếu xoay hoặc lật], [Nhóm dihedral $D_n$], [$2n$],
  )
]

#route-box(title: "🧭 Burnside Nên Làm Theo 3 Bước")[
  - *Bước 1:* Xác định nhóm đối xứng đang dùng: chỉ xoay ($C_n$) hay xoay và lật ($D_n$).
  - *Bước 2:* Với từng phép đối xứng $g$, đếm số cấu hình không đổi dưới $g$ bằng cách đếm số chu trình $c(g)$.
  - *Bước 3:* Cộng tất cả các số đó rồi chia cho $|G|$.

  Mấu chốt không phải là nhớ thuộc lòng ký hiệu, mà là hiểu câu:
  *"Muốn một cấu hình đứng yên sau phép đối xứng $g$, mọi vị trí nằm trong cùng một chu trình phải nhận cùng màu."*
]

#example-box(n: "8 — Vòng 4 Hạt, 2 Màu, Chỉ Xoay")[
  Nhóm $C_4$: $r^0, r^1, r^2, r^3$.
  #table(
    columns: (auto, auto, auto, auto),
    stroke: 0.4pt + c-slate,
    fill: (x, y) => if y == 0 { c-teal } else if calc.odd(y) { rgb("E0F2F1") } else { white },
    inset: (x: 8pt, y: 6pt),
    align: center,
    table.header(
      text(fill: white, weight: "bold")[Phép xoay],
      text(fill: white, weight: "bold")[Chu trình],
      text(fill: white, weight: "bold")[$c(g)$],
      text(fill: white, weight: "bold")[$|X^g| = 2^(c(g))$],
    ),
    [$r^0$], [$(1)(2)(3)(4)$], [$4$], [$16$],
    [$r^1$ ($90°$)], [$(1234)$], [$1$], [$2$],
    [$r^2$ ($180°$)], [$(13)(24)$], [$2$], [$4$],
    [$r^3$ ($270°$)], [$(1432)$], [$1$], [$2$],
  )
  $"Số phân biệt" = display((16+2+4+2)/4 = 24/4 = 6).$
]

#v(0.5em)

#tn(
  [Xâu $5$ hạt cườm gồm $3$ màu thành vòng (không ràng buộc kề).
    Hai vòng coi là giống nhau nếu *xoay* được cái này thành cái kia.
    Số vòng cườm phân biệt là:],
  (
    [$39$],
    [$45$],
    True([$51$]),
    [$57$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm xoay $C_5$ nên có $5$ phép đối xứng.

    - Phép đồng nhất $r^0$ giữ nguyên mọi cấu hình: $|X^{r^0}| = 3^5 = 243$.
    - Mỗi phép xoay khác đồng nhất gom cả $5$ vị trí vào cùng một chu trình,
      nên cấu hình đứng yên chỉ có dạng "cả 5 hạt cùng màu": $|X^{r^j}| = 3$.

    Vì có $4$ phép như vậy, số vòng phân biệt là
    $"Số phân biệt" = (243 + 4 dot 3)/5 = 255/5 = 51.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(5) {
          let a = i * 72deg + 90deg
          circle((calc.cos(a)*r, calc.sin(a)*r), radius: 0.25, fill: white, stroke: 1.5pt + rgb("6A1B9A"))
          let a_next = (i+1) * 72deg + 90deg
          line((calc.cos(a)*r, calc.sin(a)*r), (calc.cos(a_next)*r, calc.sin(a_next)*r), stroke: 1.2pt + c-slate)
        }
        arc((0,0), radius: 0.6, start: 45deg, stop: 315deg, mark: (end: "stealth"), stroke: 1.5pt + c-amber)
        content((0, 0), text(size: 8pt, weight: "bold")[Xoay $C_5$])
      })
    ]
  ],
)

#v(0.5em)

#tn(
  [Xâu $6$ hạt cườm gồm $2$ màu thành vòng. Hai vòng coi là giống nhau nếu
    *xoay hoặc lật* được cái này thành cái kia (nhóm dihedral $D_6$, $|D_6| = 12$).
    Số vòng phân biệt là:],
  (
    [$9$],
    [$10$],
    True([$14$]),
    [$13$],
  ),
  loigiai: [
    Ta dùng Burnside với nhóm $D_6$, nên phải xét $12$ phép đối xứng.

    *Phần xoay:*
    $r^0$: $c=6$ → $64$;
    $r^1,r^5$: $c=1$ → $2$ mỗi cái;
    $r^2,r^4$: $c=2$ → $4$ mỗi cái;
    $r^3$: $c=3$ → $8$.

    *Phần lật:*
    - $3$ trục qua hai đỉnh đối diện: mỗi phép có $4$ chu trình → $2^4=16$ cách cố định.
    - $3$ trục qua trung điểm hai cạnh đối diện: mỗi phép có $3$ chu trình → $2^3=8$ cách cố định.

    Tổng số cấu hình cố định là
    $64+2+4+4+2+8 + 3 dot 16 + 3 dot 8 = 168$.
    Chia cho $|D_6| = 12$, ta được $168/12 = 14$.
    Vậy có $14$ vòng phân biệt.

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.3cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a = i * 60deg + 90deg
          circle((calc.cos(a)*r, calc.sin(a)*r), radius: 0.25, fill: white, stroke: 1.5pt + rgb("0277BD"))
          let a_next = (i+1) * 60deg + 90deg
          line((calc.cos(a)*r, calc.sin(a)*r), (calc.cos(a_next)*r, calc.sin(a_next)*r), stroke: 1.2pt + c-slate)
        }
        
        // Reflection axes
        line((-1.8, 0), (1.8, 0), stroke: (dash: "dashed", paint: rgb("E65100"), thickness: 1pt))
        line((0, -1.8), (0, 1.8), stroke: (dash: "dashed", paint: rgb("E65100"), thickness: 1pt))
        
        arc((0,0), radius: 0.6, start: 45deg, stop: 315deg, mark: (end: "stealth"), stroke: 1.5pt + rgb("0277BD"))
        content((0, 0), text(size: 8pt, weight: "bold")[Xoay & Lật $D_6$])
      })
    ]

  ],
)

#v(0.5em)

#tln(
  id: "CB-BURNSIDE",
  [Một xưởng gia công đá quý ký hợp đồng chế tác dây chuyền kỉ niệm. Khung kẹp vòng khép định sẵn $6$ khuôn chốt dập móng để đính ngọc theo hình lục giác đều. Khách hàng yêu cầu rải $3$ loại đá quý (mã não, hồng ngọc, tử thạch đan) khảm vào mặt chuyền. Lớp lót dưới đáy của khung kẹp là vật liệu trơn phẳng như nhau nên sau khi chốt xong, chiếc vòng lật sấp lật ngửa cởi đeo thoải mái, tức là các cấu hình trùng nhau qua phép xoay hoặc lật khối đều tính là một sản phẩm đồng nhất. Hỏi nghệ nhân vàng có thể trích xuất ra bao nhiêu sản phẩm dây chuyền mang phong cách hoàn toàn khác biệt tung ra hòm tủ? *(Điền số nguyên)*],
  [$92$],
  loigiai: [
    Hiện sinh "xoay và lật tự do" chính thức là phát súng hiệu vẫy gọi Đỉnh Điểm Đại Bác 8: Burnside. Với khung lục giác xoay/lật, ta gọi nhóm đối xứng Dihedral $D_6$ có tổng cộng $|D_6| = 12$ hướng thao tác (6 xoay, 6 lật).
    Đề yêu cầu đính ngọc độc lập, nghĩa là chỉ thả màu vào chứ *không ép buộc 2 hạt kề phải khác loại*. Thế nên $k=3$ giữ vai trò rải tự do chốt khối.

    Đếm hàm lượng bất biến ghim dưới từng phép:
    - *Nhóm $6$ mũi xoay:*
      $r^0$ (đứng im): chu trình $c = 6$, tóm giữ $3^6 = 729$ mẫu.
      $r^1, r^5$ (xoay $1$ viền): gom tất vào chu trình $c = 1$, đóng keo $3^1 dot 2 = 6$ mẫu.
      $r^2, r^4$ (xoay $2$ viền): tách chu trình $c = 2$, đóng keo $3^2 dot 2 = 18$ mẫu.
      $r^3$ (xoay nửa vòng): ngàm vào chu trình $c = 3$, khóa chốt $3^3 = 27$ mẫu.
      *Sum xoay* = $729 + 6 + 18 + 27 = 780$.

    - *Nhóm $6$ mũi lật:*
      3 đòn lật vắt qua $2$ cực đỉnh đối diện: mỗi cái nhặt $4$ chu trình (vì $2$ đầu chốt chặt, $2$ đôi hông đổi nhau), giữ vỏn vẹn $3 dot 3^4 = 3 dot 81 = 243$ mẫu.
      3 đòn lật vắt qua trung điểm $2$ bề cạnh đối xứng: mỗi điểm nhặt $3$ chu trình, ôm bọc $3 dot 3^3 = 3 dot 27 = 81$ mẫu.
      *Sum lật* = $243 + 81 = 324$.

    Dội nổ Burnside trung bình hóa:
    $"Tổng SP" = (780 + 324) / 12 = 1104 / 12 = 92.$

    #v(0.4em)
    #align(center)[
      #cetz.canvas(length: 1.35cm, {
        import cetz.draw: *
        let r = 1.3
        for i in range(6) {
          let a = i * 60deg
          circle((calc.cos(a) * r, calc.sin(a) * r), radius: 0.25, fill: rgb("E1BEE7"), stroke: 1.2pt + c-slate)
        }
        line((-1.8, 0), (1.8, 0), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        line((0, -1.8), (0, 1.8), stroke: (dash: "dashed", paint: c-amber, thickness: 1pt))
        content((2.1, 1.2), text(size: 8.5pt, style: "italic", fill: c-slate)[Trục lật của $D_6$])
      })
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// PHẦN IV
// ═══════════════════════════════════════════════
= Phần IV — Bài Tập Kiểm Tra Tổng Hợp

// BẢNG MÀU CHỦ ĐỀ
#let c-teal = rgb("00695C")
#let c-amber = rgb("BF360C")
#let c-green = rgb("1B5E20")
#let c-slate = rgb("37474F")
#let c-navy = rgb("0D47A1")

#let note-box(title: "Ghi chú", body) = block(
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

#let theory-box(body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + c-teal, rest: 0.8pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

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

= 18 — Đại Bác Vạn Năng: Quy Tắc Quét Cột Từng Bước
_Giải quyết mọi bài toán tô màu lưới khuyết, lưới biến dạng với số màu $k$ bất kỳ và chiều cao cột bất kỳ._

== 1. Tư Duy Tổng Quát: Đại Bác Quét Cột
Bất kỳ lưới dạng ô vuông nào, dù bị khuyết góc, khuyết giữa, thắt eo, hay lắp ghép phức tạp đều có chung một cách giải hệ thống duy nhất: *Quét từ trái sang phải theo từng cột đứng*.

*Tại sao lại quét theo cột?*
Thay vì bối rối chọn màu lộn xộn cho cả lưới, việc quét cột giúp cô lập sự ảnh hưởng. Khi tô một cột mới, ta chỉ cần nhìn vào cột ngay bên trái để né màu, những cột xa hơn đã tô xong sẽ không còn ràng buộc trực tiếp. Phương pháp này giúp chia nhỏ bài toán thành các bước chuyển tiếp đơn giản.

== 2. Bộ 3 Quy Tắc Vạn Năng (Tổng quát cho $k$ màu)

Học sinh chỉ cần nắm vững đúng 3 quy tắc sau để tự suy luận hệ số nhân cho từng cột mà không cần học thuộc lòng từng mô hình:

#theory-box[
  *Quy tắc 1: Cột khởi đầu (Cột 1)*
  - Số cách tô một cột đứng độc lập gồm $h$ ô liên tiếp là:
    $N_("Cột 1") = k(k-1)^(h-1)$
  - _Ví dụ:_ Cột 1 cao 1 ô $=> k$ cách; Cột 1 cao 2 ô $=> k(k-1)$ cách; Cột 1 cao 3 ô $=> k(k-1)^2$ cách.

  *Quy tắc 2: Chuyển tiếp Cột đầy đủ (Tiêu chuẩn)*
  - Khi cột mới cao $h$ ô kề đầy đủ sang cột trước cũng cao $h$ ô:
    - Nếu $h=1$: Nhân thêm hệ số $(k-1)$.
    - Nếu $h=2$: Nhân thêm hệ số chuyển tiếp đầy đủ $H = k^2 - 3k + 3$ (với $k=4 => H=7$).

  *Quy tắc 3: Chuyển tiếp Cột Khuyết / Biến dạng (Tô từng ô)*
  - Ta tô lần lượt từng ô của cột mới từ trên xuống dưới (hoặc dưới lên trên). Số cách chọn màu của mỗi ô chỉ phụ thuộc vào số ô kề sát đã tô màu lân cận nó:
    - *Ô chỉ kề sát với 1 ô đã tô màu* (dù kề ngang hay kề dọc): Luôn có $(k-1)$ cách chọn. _(Hệ quả: Khuyết giảm)_.
    - *Ô kề sát với 2 ô đã tô màu* (mà 2 ô đó kề nhau nên khác màu nhau): Luôn có $(k-2)$ cách chọn.
]

#v(0.5em)
#v(0.5em)
*Bảng Tóm Tắt Bộ Quy Tắc Quét Cột Vạn Năng (Kèm hình minh họa):*
#table(
  columns: (1.3fr, 1.2fr, 1.4fr, 2.3fr, 1.2fr),
  inset: 6pt,
  align: (left, center, left, left, left),
  [*Quy tắc*], [*Minh họa*], [*Đối tượng áp dụng*], [*Công thức tổng quát*], [*Ví dụ ($k=4, h=2$)*],
  
  [*Quy tắc 1: Khởi đầu*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      content((0.5, 1.5), text(size: 6pt, weight: "bold")[Cột 1])
      content((0.5, 0.5), text(size: 6pt)[($h$ ô)])
    })
  ],
  [Cột đầu tiên bên trái cùng của lưới],
  [$N = k(k-1)^(h-1)$],
  [Cột 2 ô $=> 12$ cách],
  
  [*Quy tắc 2: Kề đủ*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((2,0), (3,1), fill: white, stroke: 0.8pt + black)
      rect((2,1), (3,2), fill: white, stroke: 0.8pt + black)
      line((1.1, 1), (1.9, 1), mark: (end: "stealth", size: 0.08), stroke: 0.8pt + c-teal)
      content((1.5, 1.4), text(size: 6.5pt, fill: c-teal)[$H$])
    })
  ],
  [Cột mới kề đầy đủ cột cũ cùng chiều cao $h$],
  [- Với $h=1 => k-1$ \ 
  - Với $h=2 => H = k^2-3k+3$],
  [Cột 2 ô $=> H = 7$ cách],
  
  [*Quy tắc 3: Khuyết / Dị*],
  [
    #cetz.canvas(length: 0.35cm, {
      import cetz.draw: *
      rect((0,0), (1,1), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((0,1), (1,2), fill: rgb("E8F5E9"), stroke: 0.8pt + black)
      rect((2,0), (3,1), fill: white, stroke: 0.8pt + black)
      content((2.5, 0.5), text(size: 7pt, weight: "bold")[?])
      line((1.1, 0.5), (1.9, 0.5), mark: (end: "stealth", size: 0.08), stroke: 0.8pt + red)
    })
  ],
  [Cột khuyết, thắt eo, chiều cao cột thay đổi],
  [Tô từng ô của cột mới: \ 
  - Kề 1 ô đã tô $=> k-1$ \ 
  - Kề 2 ô đã tô $=> k-2$],
  [Khuyết giảm $=> 3$ cách \ 
  Khuyết tăng $=> 9$ cách]
)
#v(0.5em)
== 3. Chứng Minh & Bản Chất Toán Học
Để không học vẹt, hãy cùng khám phá nguồn gốc thực tế của các con số này dưới góc nhìn của học sinh khi tự tay tô màu (với bộ $k=4$ màu: Đỏ, Xanh, Vàng, Tím):

#grid(
  columns: (1fr, 1.2fr),
  gutter: 1cm,
  align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      // Ô đã tô màu (Đỏ)
      rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 1pt + black)
      content((0.5, 0.5), text(size: 8pt)[Đỏ])
      
      // Ô mới cần tô (?)
      rect((1.8, 0), (2.8, 1), fill: white, stroke: 1.2pt + black)
      content((2.3, 0.5), text(size: 9pt, weight: "bold")[?])
      
      // Mũi tên
      line((1.0, 0.5), (1.8, 0.5), mark: (end: "stealth", size: 0.1), stroke: 1pt + red)
      
      content((1.4, 0.8), text(size: 7.5pt, fill: red, weight: "bold")[Né Đỏ])
      content((1.4, -0.4), text(size: 8.5pt, weight: "bold")[$k-1 = 3$ cách])
    })
    #v(0.3em)
    _Né 1 ô đã tô lân cận_
  ],
  align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      // Cột cũ
      rect((0, 1), (1, 2), fill: rgb("FFCDD2"), stroke: 1pt + black)
      content((0.5, 1.5), text(size: 8pt)[Đỏ])
      rect((0, 0), (1, 1), fill: rgb("E3F2FD"), stroke: 1pt + black)
      content((0.5, 0.5), text(size: 8pt)[Xanh])
      
      // Cột mới (TH2)
      rect((1.8, 1), (2.8, 2), fill: rgb("FFF9C4"), stroke: 1.2pt + black)
      content((2.3, 1.5), text(size: 8pt)[Vàng])
      rect((1.8, 0), (2.8, 1), fill: white, stroke: 1.2pt + black)
      content((2.3, 0.5), text(size: 9pt, weight: "bold")[?])
      
      // Mũi tên chéo / ngang chỉ ràng buộc
      line((1.0, 0.5), (1.8, 0.5), stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
      line((2.3, 1.0), (2.3, 0.5), stroke: (dash: "dashed", paint: black, thickness: 0.8pt))
      
      content((1.4, 0.2), text(size: 7.5pt, weight: "bold")[né Xanh])
      content((2.9, 0.75), text(size: 7.5pt, weight: "bold")[né Vàng])
      content((1.9, -0.4), text(size: 8.5pt, weight: "bold")[$k-2 = 2$ cách])
    })
    #v(0.3em)
    _Né 2 ô khác màu (Trường hợp 2 của H)_
  ]
)

#v(0.5em)
#note-box(title: "Giải thích chi tiết từng quy tắc")[
  - *Tại sao ô kề sát 1 ô đã tô lại có $k-1 = 3$ cách?*
    Khi ô mới chỉ chạm cạnh đúng 1 ô đã sơn xong (ví dụ ô đó màu Đỏ). Để tránh trùng màu kề cạnh, ô mới chỉ cần tránh duy nhất màu Đỏ. Vậy ta còn lại $4 - 1 = 3$ màu để tự do chọn lựa (Xanh, Vàng, Tím).
    
  - *Tại sao ô kề sát 2 ô đã tô lại có $k-2 = 2$ cách?*
    Khi ô mới kẹt giữa và chạm cạnh 2 ô đã sơn xong (ví dụ ô bên trái màu Đỏ, ô bên dưới màu Xanh). Vì hai ô kề đó chạm cạnh nhau nên chúng bắt buộc mang 2 màu khác nhau. Do đó, ô mới phải né cả Đỏ và Xanh $=>$ còn $4 - 2 = 2$ màu để chọn (Vàng, Tím).
    
  - *Tại sao chuyển tiếp cột 2 ô lại nhân thêm $H = k^2 - 3k + 3 = 7$ cách?*
    Giả sử cột cũ có ô trên màu Đỏ, ô dưới màu Xanh. Khi tô cột mới (gồm ô trên mới và ô dưới mới), ta chia làm 2 trường hợp:
    - _Trường hợp 1:_ Tô ô trên mới trùng màu ô dưới cũ (tô màu *Xanh* - có 1 cách). Lúc này, ô dưới mới kề ngang ô màu Xanh và kề dọc ô trên mới cũng màu Xanh $=>$ Chỉ cần tránh màu Xanh $=>$ có $k-1 = 3$ cách chọn. Số cách: $1 times 3 = 3$ cách.
    - _Trường hợp 2:_ Tô ô trên mới khác màu ô dưới cũ (né Đỏ của ô trên cũ và né Xanh của ô dưới cũ $=>$ có $k-2 = 2$ cách chọn). Khi đó, ô dưới mới kề với hai ô mang hai màu khác nhau $=>$ phải né cả 2 màu này $=>$ có $k-2 = 2$ cách chọn. Số cách: $2 times 2 = 4$ cách.
    - _Cộng lại:_ Ta có $3 + 4 = 7$ cách chuyển tiếp (với $k$ màu, tổng quát là $(1 times (k-1)) + ((k-2) times (k-2)) = k^2 - 3k + 3$).
]

== 4. Mở Rộng Khi Số Màu Khác 4 ($k != 4$)
Khi số màu $k$ thay đổi, bộ quy tắc vạn năng vẫn không đổi, ta chỉ việc thay giá trị $k$ vào công thức:

*1. Với $k=3$ màu (ví dụ {Đỏ, Xanh, Vàng}):*
- Né 1 ô lân cận: $k-1 = 2$ cách.
- Né 2 ô khác màu lân cận: $k-2 = 1$ cách.
- Hệ số chuyển tiếp cột đầy đủ $H$: $k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.
- _Áp dụng:_ Lưới $2 times 2$ tô bằng 3 màu có số cách tô là:
  $N = N_("Cột 1") times H = [k(k-1)] times 3 = (3 times 2) times 3 = 18$ cách.

*2. Với $k=5$ màu (ví dụ {Đỏ, Xanh, Vàng, Tím, Cam}):*
- Né 1 ô lân cận: $k-1 = 4$ cách.
- Né 2 ô khác màu lân cận: $k-2 = 3$ cách.
- Hệ số chuyển tiếp cột đầy đủ $H$: $k^2 - 3k + 3 = 5^2 - 3(5) + 3 = 13$ cách.
- _Áp dụng:_ Lưới $2 times 2$ tô bằng 5 màu có số cách tô là:
  $N = N_("Cột 1") times H = (5 times 4) times 13 = 260$ cách.

== 5. Mở Rộng Khi Chiều Cao Cột Lớn Hơn 2 ($h > 2$)

Quy tắc quét cột và quy tắc tô từng ô vẫn hoạt động hoàn toàn chính xác cho mọi chiều cao cột. Khi tô một cột mới cao $h$ ô kề sát cột cũ, ta luôn tô lần lượt các ô của cột mới từ trên xuống dưới. Mỗi ô khi tô chỉ cần nhìn về các ô lân cận đã được tô màu trước đó để né màu.

#cannon-box("Bài toán áp dụng nâng cao: Lưới bậc thang 3×3 với k=3 màu", [
  Cho một lưới gồm 6 ô được xếp thành dạng bậc thang như hình dưới đây. Có 3 màu sơn khác nhau ($k=3$). Yêu cầu hai ô chung cạnh phải khác màu. Hỏi có bao nhiêu cách tô màu cho lưới?

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let yellow = rgb("FFF9C4")
      
      // Dòng 1
      rect((0, 0), (1, 1), fill: yellow, stroke: 1.2pt + black)
      rect((1, 0), (2, 1), fill: yellow, stroke: 1.2pt + black)
      rect((2, 0), (3, 1), fill: yellow, stroke: 1.2pt + black)
      
      // Dòng 2
      rect((0, 1), (1, 2), fill: yellow, stroke: 1.2pt + black)
      rect((1, 1), (2, 2), fill: yellow, stroke: 1.2pt + black)
      
      // Dòng 3
      rect((0, 2), (1, 3), fill: yellow, stroke: 1.2pt + black)
      
      content((0.5, 2.5), text(size: 8.5pt)[Cột 1])
      content((1.5, 1.5), text(size: 8.5pt)[Cột 2])
      content((2.5, 0.5), text(size: 8.5pt)[Cột 3])
    })
  ]
  
  #v(0.3em)
  *Lời giải chi tiết bằng cách áp dụng Bộ Quy Tắc Vạn Năng:*

  *Bước 1: Tô Cột 1 (Quy tắc 1 - Cột khởi đầu cao 3 ô)*
  - Số cách tô Cột 1 gồm 3 ô dọc độc lập là:
    $N_("Cột 1") = k(k-1)^2 = 3 times 2^2 = 12$ cách.

  *Bước 2: Tô Cột 2 (Quy tắc 2 - Cột kề đầy đủ cao 2 ô)*
  - Hãy quan sát: Cột 2 gồm 2 ô (Dòng 1 và Dòng 2). Nó nằm kề đầy đủ bên phải của 2 ô thuộc Cột 1 (cụ thể là ô Dòng 1 và Dòng 2 của Cột 1).
  - Ô ở Dòng 3 của Cột 1 là ô khuyết ở trên, hoàn toàn không kề với bất kỳ ô nào của Cột 2, nên ta bỏ qua sự ảnh hưởng của nó.
  - Do đó, bước chuyển tiếp từ Cột 1 sang Cột 2 thực chất là sự chuyển tiếp của một cột cao 2 ô tiêu chuẩn.
  - Áp dụng *Quy tắc 2 (Chuyển tiếp cột đầy đủ cao 2 ô)*: Hệ số nhân thêm cho Cột 2 là:
    $H = k^2 - 3k + 3 = 3^2 - 3(3) + 3 = 3$ cách.
    $=> N_("Cột 2") = 3$ cách.

  *Bước 3: Tô Cột 3 (Quy tắc 3 - Chuyển tiếp khuyết giảm)*
  - Cột 3 chỉ có duy nhất 1 ô ở Dòng 1. Ô này kề ngang với ô Dòng 1 của Cột 2 (phía trên nó khuyết rỗng).
  - Áp dụng *Quy tắc 3 (Khuyết giảm - kề sát đúng 1 ô đã tô)*: Hệ số nhân thêm cho Cột 3 là:
    $k - 1 = 3 - 1 = 2$ cách.
    $=> N_("Cột 3") = 2$ cách.

  *Bước 4: Tổng kết số cách tô cho toàn lưới*
  - Theo quy tắc nhân, tổng số cách tô màu là:
    $N = N_("Cột 1") times N_("Cột 2") times N_("Cột 3") = 12 times 3 times 2 = 72$ cách.
])

== 6. Bảng Tra Nhanh Các Mô Hình Lưới Khuyết ($k=4$)

Dưới đây là bảng tổng hợp công thức quét cột và đáp án cho các mô hình lưới khuyết thông dụng sử dụng bộ $k=4$ màu ($H=7$, $k-1=3$, $k-2=2$):

#table(
  columns: (1.5fr, 1fr, 2fr, 1.2fr),
  inset: 8pt,
  align: (left, center, left, center),
  [*Mô hình lưới*], [*Cấu trúc cột*], [*Phép tính theo Quy tắc Quét Cột*], [*Đáp án ($k=4$)*],
  [*Mô hình A (Khuyết góc)*], [2 $->$ 2 $->$ 1], [Cột 1 ($12$) $times$ Cột 2 ($H=7$) $times$ Cột 3 ($3$)], [*252 cách*],
  [*Mô hình B (Khuyết giữa)*], [2 $->$ 1 $->$ 2], [Cột 1 ($12$) $times$ Cột 2 ($3$) $times$ Cột 3 ($3 times 3 = 9$)], [*324 cách*],
  [*Mô hình D (Bậc thang)*], [1 $->$ 2 $->$ 1], [Cột 1 ($4$) $times$ Cột 2 ($3 times 3 = 9$) $times$ Cột 3 ($3$)], [*108 cách*],
  [*Bài 3.3 (Lưới 11 ô)*], [Ghép Khối], [Khối Trái ($12 times 7 times 7 times 3 = 1764$) $times$ Khối Phải ($7 times 7 = 49$)], [*86.436 cách*],
  [*Bài 3.11 (Lưới 8 ô)*], [3 $times$ 2 + Đuôi], [Khối lõi $3 times 2$ ($588$) $times$ Ô đuôi ($3$)], [*1764 cách*],
  [*Bài 3.12 (Lưới 9 ô thắt eo)*], [Khối-Cầu-Khối], [Khối Trái ($84$) $times$ Cầu ($3$) $times$ Cột 4 ($9$) $times$ Cột 5 ($7$)], [*15.876 cách*],
)

== 7. Ví Dụ Áp Dụng Từng Bước (Luyện Tập Thực Chiến)

Với mỗi ví dụ dưới đây, ta sẽ *không tính nhẩm tắt* mà trình bày đầy đủ 4 bước: Nhận dạng lưới → Gọi tên quy tắc → Tính hệ số từng cột → Nhân kết quả. Đây chính là thói quen tư duy đúng đắn giúp không bao giờ bị nhầm lẫn.

#v(0.5em)

#cannon-box("Ví dụ 1 — Mô hình A: Lưới khuyết góc (k = 4 màu)", [
  *Đề bài:* Cho lưới 5 ô hình chữ L như hình. Có 4 màu sơn khác nhau. Hai ô chung cạnh phải khác màu. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá
      rect((0,0),(1,1), fill: g, stroke: 1.3pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      // Cột 2 — xanh dương
      rect((1,0),(2,1), fill: b, stroke: 1.3pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.3pt + black)
      // Cột 3 — cam (chỉ ô trên)
      rect((2,1),(3,2), fill: o, stroke: 1.3pt + black)
      // Ô trống (gạch chéo)
      rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn cột
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 3])
      content((0.5,1.0), text(size: 7.5pt)[2 ô])
      content((1.5,1.0), text(size: 7.5pt)[2 ô])
      content((2.5,1.5), text(size: 7.5pt)[1 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 2 ô):*
  Cột đầu tiên, độc lập hoàn toàn. Ô trên tự do chọn $k=4$ màu; ô dưới kề dọc nên chỉ cần né 1 màu.
  $ N_1 = k(k-1) = 4 times 3 = 12 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 2, chuyển tiếp đầy đủ cao 2 ô):*
  Cột 2 kề toàn bộ sang Cột 1 với cùng chiều cao 2 ô — chuyển tiếp chuẩn, áp dụng hệ số $H$.
  $ N_2 = H = k^2 - 3k + 3 = 16 - 12 + 3 = 7 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết giảm):*
  Cột 3 chỉ còn 1 ô ở hàng trên. Ô này chỉ chạm cạnh ngang với đúng 1 ô của Cột 2. Né 1 màu, tự do chọn phần còn lại.
  $ N_3 = k - 1 = 3 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = N_1 times N_2 times N_3 = 12 times 7 times 3 = bold(252) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 2 — Mô hình B: Lưới khuyết giữa (k = 4 màu)", [
  *Đề bài:* Cho lưới 5 ô dạng "đứt ruột" như hình — Cột giữa bị mất đi 1 ô, lưới bị thắt lại rồi lại nở ra. Có 4 màu sơn. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá (2 ô)
      rect((0,0),(1,1), fill: g, stroke: 1.3pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      // Cột 2 — cam (chỉ ô trên, ô dưới trống)
      rect((1,1),(2,2), fill: o, stroke: 1.3pt + black)
      rect((1,0),(2,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((1,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((2,0),(1,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Cột 3 — xanh dương (2 ô)
      rect((2,0),(3,1), fill: b, stroke: 1.3pt + black)
      rect((2,1),(3,2), fill: b, stroke: 1.3pt + black)
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 3])
      content((0.5,1.0), text(size: 7.5pt)[2 ô])
      content((1.5,1.5), text(size: 7.5pt)[1 ô])
      content((2.5,1.0), text(size: 7.5pt)[2 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 2 ô):*
  $ N_1 = k(k-1) = 4 times 3 = 12 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 3, khuyết giảm):*
  Cột 2 chỉ có 1 ô ở hàng trên, chỉ chạm cạnh ngang đúng 1 ô của Cột 1. Né 1 màu.
  $ N_2 = k - 1 = 3 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết tăng — tô từng ô từ trên xuống):*
  Cột 3 "phình" ra thành 2 ô sau Cột 2 chỉ có 1 ô. Ta tô lần lượt:
  - _Ô trên Cột 3:_ kề ngang Cột 2 (1 ô đã tô) $=>$ né 1 màu $=>$ $k-1 = 3$ cách.
  - _Ô dưới Cột 3:_ chỉ kề dọc ô trên vừa tô (phía trái không có ô nào kề) $=>$ né 1 màu $=>$ $k-1 = 3$ cách.
  $ N_3 = (k-1) times (k-1) = 3 times 3 = 9 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = 12 times 3 times 9 = bold(324) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 3 — Mô hình D: Lưới bậc thang (k = 4 màu)", [
  *Đề bài:* Cho lưới 4 ô xếp dạng bậc thang đi xuống — 1 ô hàng trên, 2 ô cột giữa, 1 ô hàng dưới. Có 4 màu sơn. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Cột 1 — xanh lá (chỉ ô trên)
      rect((0,1),(1,2), fill: g, stroke: 1.3pt + black)
      rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Cột 2 — xanh dương (2 ô)
      rect((1,0),(2,1), fill: b, stroke: 1.3pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.3pt + black)
      // Cột 3 — cam (chỉ ô dưới)
      rect((2,0),(3,1), fill: o, stroke: 1.3pt + black)
      rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Cột 1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Cột 2])
      content((2.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Cột 3])
      content((0.5,1.5), text(size: 7.5pt)[1 ô])
      content((1.5,1.0), text(size: 7.5pt)[2 ô])
      content((2.5,0.5), text(size: 7.5pt)[1 ô])
    })
  ]
  #v(0.4em)

  *Bước 1 — Cột 1 (Quy tắc 1, cao 1 ô):*
  Ô đơn độc, hoàn toàn tự do chọn màu.
  $ N_1 = k = 4 "cách" $

  *Bước 2 — Cột 2 (Quy tắc 3, khuyết tăng — tô từng ô từ trên xuống):*
  Từ 1 ô nở ra 2 ô. Ô trên Cột 2 kề ngang Cột 1; ô dưới Cột 2 chỉ kề dọc ô trên (vì phía trái ô dưới không có ô nào của Cột 1).
  - _Ô trên Cột 2:_ $k - 1 = 3$ cách.
  - _Ô dưới Cột 2:_ $k - 1 = 3$ cách.
  $ N_2 = (k-1)^2 = 3 times 3 = 9 "cách" $

  *Bước 3 — Cột 3 (Quy tắc 3, khuyết giảm):*
  Cột 3 chỉ có 1 ô ở hàng dưới, chỉ kề ngang với ô dưới của Cột 2. Né 1 màu.
  $ N_3 = k - 1 = 3 "cách" $

  *Bước 4 — Kết quả:*
  #align(center)[
    $ N = 4 times 9 times 3 = bold(108) "cách" $
  ]
])

#v(0.8em)

#cannon-box("Ví dụ 4 — Mô hình C: Lưới thắt eo / Cầu nối (k = 4 màu)", [
  *Đề bài:* Cho lưới 9 ô gồm hai khối $2 times 2$ nối với nhau qua 1 ô cầu nối ở hàng trên. Có 4 màu sơn. Hai ô chung cạnh phải khác màu. Tính số cách tô màu.

  #v(0.3em)
  #align(center)[
    #cetz.canvas(length: 0.95cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9")
      let b = rgb("E3F2FD")
      let o = rgb("FFE0B2")
      // Khối Trái (Cột 1 & 2)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
      // Cầu nối (Cột 3, chỉ ô trên)
      rect((2,1),(3,2), fill: o, stroke: 1.5pt + black)
      rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.7pt + rgb("BBBBBB"))
      line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Khối Phải (Cột 4 & 5)
      rect((3,0),(4,1), fill: b, stroke: 1.2pt + black)
      rect((3,1),(4,2), fill: b, stroke: 1.2pt + black)
      rect((4,0),(5,1), fill: b, stroke: 1.2pt + black)
      rect((4,1),(5,2), fill: b, stroke: 1.2pt + black)
      // Nhãn phía trên
      content((0.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[Khối Trái])
      content((2.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[Cầu])
      content((3.5,2.4), text(size: 7pt, weight: "bold", fill: rgb("0D47A1"))[Khối Phải])
      // Nhãn phía dưới
      content((0.5,-0.35), text(size: 7.5pt, fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.35), text(size: 7.5pt, fill: rgb("1B5E20"))[C.2])
      content((2.5,-0.35), text(size: 7.5pt, fill: rgb("BF360C"))[C.3])
      content((3.5,-0.35), text(size: 7.5pt, fill: rgb("0D47A1"))[C.4])
      content((4.5,-0.35), text(size: 7.5pt, fill: rgb("0D47A1"))[C.5])
    })
  ]
  #v(0.4em)

  *Khối Trái — Cột 1 & Cột 2:*

  - _Cột 1 (Quy tắc 1, cao 2 ô):_ $N_1 = k(k-1) = 12$ cách.
  - _Cột 2 (Quy tắc 2, chuyển tiếp đầy đủ):_ $N_2 = H = 7$ cách.
  $ N_"trái" = 12 times 7 = 84 "cách" $

  *Cột 3 — Cầu nối (Quy tắc 3, khuyết giảm):*

  Ô cầu nối chỉ chạm cạnh ngang đúng 1 ô hàng trên của Cột 2. Phía dưới trống.
  $ N_3 = k - 1 = 3 "cách" $

  *Khối Phải — Cột 4 & Cột 5:*

  - _Cột 4 (Quy tắc 3, khuyết tăng):_ Lưới nở ra 2 ô sau cầu nối 1 ô. Tô từng ô từ trên xuống: ô trên kề ngang cầu nối ($k-1=3$), ô dưới chỉ kề dọc ô trên ($k-1=3$).
    $ N_4 = (k-1)^2 = 3 times 3 = 9 "cách" $
  - _Cột 5 (Quy tắc 2, chuyển tiếp đầy đủ):_ Cột 5 kề toàn bộ Cột 4, cao 2 ô.
    $ N_5 = H = 7 "cách" $
  $ N_"phải" = 9 times 7 = 63 "cách" $

  *Kết quả toàn lưới:*
  #align(center)[
    $ N = N_"trái" times N_3 times N_"phải" = 84 times 3 times 63 = bold(15.876) "cách" $
  ]
])

#pagebreak()

== 8. Vườn Ví Dụ Toàn Diện — Đổi k, Đổi Chiều Rộng, Đổi Chiều Cao

Phần này luyện tập bộ quy tắc trên *nhiều tình huống khác nhau*. Mỗi lần đổi một yếu tố (số màu / số cột / chiều cao cột), đáp số thay đổi ra sao? Hãy theo dõi và so sánh!

// ══════════════════════════════════════════════════════════════════
#note-box(title: "🎨 Nhóm I — Cùng Hình Lưới, Đổi Số Màu k")[
  Đây là bài tập tư duy số một: giữ nguyên hình lưới, chỉ tăng/giảm số màu $k$ và xem hệ số nào thay đổi theo.
  Với $k=3$: $H=3$, $k-1=2$, $k-2=1$. Với $k=5$: $H=13$, $k-1=4$, $k-2=3$.
]

#v(0.5em)

#cannon-box("Ví dụ 5 — Lưới khuyết góc, k = 3 màu (Mô hình A nhưng ít màu hơn)", [
  *Đề bài:* Lưới chữ L (2→2→1) giống Ví dụ 1, nhưng chỉ có *3 màu*. Hai ô kề cạnh khác màu. Tính số cách tô.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB")); line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=3$ vào Bộ Quy Tắc:*
    - C.1 (QT1, h=2): $k(k-1) = 3 times 2 = 6$
    - C.2 (QT2, đầy đủ): $H = k^2-3k+3 = 9-9+3 = 3$
    - C.3 (QT3, khuyết giảm): $k-1 = 2$
    #align(center)[$ N = 6 times 3 times 2 = bold(36) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 6 — Lưới khuyết góc, k = 5 màu (Mô hình A nhưng nhiều màu hơn)", [
  *Đề bài:* Cùng lưới chữ L trên, nhưng bây giờ có *5 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,0),(3,1), stroke: 0.6pt + rgb("BBBBBB")); line((3,0),(2,1), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=5$ vào Bộ Quy Tắc:*
    - C.1 (QT1, h=2): $k(k-1) = 5 times 4 = 20$
    - C.2 (QT2, đầy đủ): $H = k^2-3k+3 = 25-15+3 = 13$
    - C.3 (QT3, khuyết giảm): $k-1 = 4$
    #align(center)[$ N = 20 times 13 times 4 = bold(1040) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 7 — Bậc thang, k = 3 màu", [
  *Đề bài:* Lưới bậc thang (1→2→1) giống Ví dụ 3, nhưng chỉ *3 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=3$:*
    - C.1 (QT1, h=1): $k = 3$
    - C.2 (QT3, tăng 1→2): $(k-1)^2 = 2^2 = 4$
    - C.3 (QT3, giảm 2→1): $k-1 = 2$
    #align(center)[$ N = 3 times 4 times 2 = bold(24) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 8 — Bậc thang, k = 5 màu", [
  *Đề bài:* Cùng lưới bậc thang (1→2→1), nhưng *5 màu*.

  #grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
        rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
        line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
        content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
        content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
        content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3])
      })
    ]
  ], [
    *Thay $k=5$:*
    - C.1 (QT1, h=1): $k = 5$
    - C.2 (QT3, tăng 1→2): $(k-1)^2 = 4^2 = 16$
    - C.3 (QT3, giảm 2→1): $k-1 = 4$
    #align(center)[$ N = 5 times 16 times 4 = bold(320) "cách" $]
  ])
])

#v(0.5em)

// ══════════════════════════════════════════════════════════════════
#note-box(title: "📐 Nhóm II — Lưới 4 Cột và 5 Cột (Rộng Hơn)")[
  Khi lưới có nhiều cột hơn, ta chỉ việc *lặp lại* bước chuyển tiếp. Quy tắc không thay đổi — số cột tăng lên thì số lần nhân hệ số tăng theo.
]

#v(0.5em)

#cannon-box("Ví dụ 9 — Lưới 4 cột (2→2→2→1), k = 4 màu", [
  *Đề bài:* Lưới 7 ô: 3 cột đầy đủ 2 ô rồi 1 ô đơn ở cuối. Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2")
      // C1
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      // C2
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      // C4 (1 ô trên)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      rect((3,0),(4,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((3,0),(4,1), stroke: 0.6pt + rgb("BBBBBB")); line((4,0),(3,1), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      for (i, c) in ((0, rgb("1B5E20")), (1, rgb("0D47A1")), (2, rgb("4A148C")), (3, rgb("BF360C"))) {
        content((i + 0.5, -0.35), text(size: 7.5pt, weight: "bold", fill: c)[C.#(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Phân tích từng cột:*
  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 4 times 3 = 12$
  - *C.2 (QT2, đầy đủ):* $N_2 = H = 7$
  - *C.3 (QT2, đầy đủ):* $N_3 = H = 7$ — cũng là cột đầy đủ h=2 kề C.2!
  - *C.4 (QT3, giảm 2→1):* $N_4 = k-1 = 3$

  #align(center)[$ N = 12 times 7 times 7 times 3 = bold(1764) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 10 — Lưới 4 cột (2→2→2→1), k = 3 màu", [
  *Đề bài:* Cùng hình lưới Ví dụ 9 nhưng chỉ *3 màu*. Lưu ý H = 3, không phải 7!

  *Phân tích nhanh:*
  - *C.1 (QT1):* $k(k-1) = 3 times 2 = 6$
  - *C.2 (QT2):* $H = 3^2 - 3(3) + 3 = 3$
  - *C.3 (QT2):* $H = 3$
  - *C.4 (QT3, giảm):* $k-1 = 2$

  #align(center)[$ N = 6 times 3 times 3 times 2 = bold(108) "cách" $]

  #note-box(title: "💡 So sánh thú vị")[ Cùng hình lưới, 3 màu cho *108 cách*, còn 4 màu (VD9) cho *1764 cách*. Chênh lệch gần 16 lần — minh chứng rõ ràng nhất cho sức mạnh của biến số $k$! ]
])

#v(0.6em)

#cannon-box("Ví dụ 11 — Lưới 5 cột (1→2→2→2→1), k = 4 màu", [
  *Đề bài:* Lưới 8 ô dạng thoi — bắt đầu bằng 1 ô, phình ra 3 cột đôi, thu lại 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      // C1 (1 ô trên)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,0),(1,1), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,0),(1,1), stroke: 0.6pt + rgb("BBBBBB")); line((1,0),(0,1), stroke: 0.6pt + rgb("BBBBBB"))
      // C2
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      // C4
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black); rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      // C5 (1 ô dưới)
      rect((4,0),(5,1), fill: r, stroke: 1.2pt + black)
      rect((4,1),(5,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((4,1),(5,2), stroke: 0.6pt + rgb("BBBBBB")); line((5,1),(4,2), stroke: 0.6pt + rgb("BBBBBB"))
      for (i, c) in ((0, rgb("1B5E20")), (1, rgb("0D47A1")), (2, rgb("4A148C")), (3, rgb("BF360C")), (4, rgb("880E4F"))) {
        content((i + 0.5, -0.35), text(size: 7pt, weight: "bold", fill: c)[C.#(i+1)])
      }
    })
  ]
  #v(0.3em)

  *Phân tích từng cột:*
  - *C.1 (QT1, h=1):* $N_1 = k = 4$
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$
  - *C.3 (QT2, đầy đủ):* $N_3 = H = 7$
  - *C.4 (QT2, đầy đủ):* $N_4 = H = 7$
  - *C.5 (QT3, giảm 2→1):* $N_5 = k-1 = 3$

  #align(center)[$ N = 4 times 9 times 7 times 7 times 3 = bold(5292) "cách" $]
])

#v(0.5em)

// ══════════════════════════════════════════════════════════════════
#note-box(title: "🏗️ Nhóm III — Cột Cao 3 Tầng")[
  Khi cột cao đến 3 ô, Quy tắc 1 & 3 mở rộng tự nhiên.
  
  *Quy tắc 1 với h=3:* $N_1 = k(k-1)^2$ (ô đầu: $k$; ô giữa: $k-1$; ô cuối: $k-1$).
  
  *Chuyển tiếp h=2 → h=3 (khuyết tăng lên 3):* Tô từng ô mới từ trên xuống:
  - Hai ô đầu: hệ số tổng = $H$ (tính như chuyển tiếp đầy đủ giữa 2 ô).
  - Ô thứ ba: chỉ kề dọc ô trên (cột cũ không có ô thứ 3) $=> k-1$ cách.
  - *Hệ số tổng: $H times (k-1)$.*
  
  *Chuyển tiếp h=3 → h=2 (khuyết giảm xuống 2):* Ô thứ 3 của cột cũ không kề cột mới, chỉ xét 2 ô đầu $=> H$, giống chuyển tiếp đầy đủ.
]

#v(0.5em)

#cannon-box("Ví dụ 12 — Bậc thang giảm 3→2→1, k = 4 màu", [
  *Đề bài:* Lưới 6 ô dạng bậc thang đi xuống: Cột 1 cao 3 ô, Cột 2 cao 2 ô, Cột 3 cao 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      // C1 — 3 ô (cao nhất)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,2),(1,3), fill: g, stroke: 1.2pt + black)
      // C2 — 2 ô (kề hàng 1 và 2 của C1)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,2),(2,3), stroke: 0.6pt + rgb("BBBBBB")); line((2,2),(1,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C3 — 1 ô (kề hàng 1 của C2)
      rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((2,1),(3,2), stroke: 0.6pt + rgb("BBBBBB")); line((3,1),(2,2), stroke: 0.6pt + rgb("BBBBBB"))
      rect((2,2),(3,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((2,2),(3,3), stroke: 0.6pt + rgb("BBBBBB")); line((3,2),(2,3), stroke: 0.6pt + rgb("BBBBBB"))
      content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1 (3ô)])
      content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2 (2ô)])
      content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3 (1ô)])
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=3):* $N_1 = k(k-1)^2 = 4 times 3^2 = 36$ cách.
  - *C.2 (QT — chuyển tiếp h=3→h=2):*
    C.2 chỉ có 2 ô, kề với đúng 2 ô _dưới_ của C.1. Ô thứ 3 của C.1 (hàng trên cùng) không có ô nào của C.2 kề → bỏ qua. Ta chỉ nhìn vào 2 ô kề nhau của C.1, tức là chuyển tiếp đầy đủ 2 ô: $N_2 = H = 7$ cách.
  - *C.3 (QT3, giảm 2→1):* $N_3 = k-1 = 3$ cách.

  #align(center)[$ N = 36 times 7 times 3 = bold(756) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 13 — Bậc thang tăng 1→2→3, k = 4 màu", [
  *Đề bài:* Lưới 6 ô bậc thang đi lên: Cột 1 cao 1 ô, Cột 2 cao 2 ô, Cột 3 cao 3 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      // C1 — 1 ô dưới
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,1),(1,2), stroke: 0.6pt + rgb("BBBBBB")); line((1,1),(0,2), stroke: 0.6pt + rgb("BBBBBB"))
      rect((0,2),(1,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((0,2),(1,3), stroke: 0.6pt + rgb("BBBBBB")); line((1,2),(0,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C2 — 2 ô
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,2),(2,3), stroke: 0.6pt + rgb("BBBBBB")); line((2,2),(1,3), stroke: 0.6pt + rgb("BBBBBB"))
      // C3 — 3 ô
      rect((2,0),(3,1), fill: o, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: o, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: o, stroke: 1.2pt + black)
      content((0.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("1B5E20"))[C.1 (1ô)])
      content((1.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("0D47A1"))[C.2 (2ô)])
      content((2.5,-0.35), text(size: 7.5pt, weight: "bold", fill: rgb("BF360C"))[C.3 (3ô)])
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=1):* $N_1 = k = 4$ cách.
  - *C.2 (QT3, tăng 1→2):* $(k-1)^2 = 9$ cách.
  - *C.3 (QT — chuyển tiếp h=2→h=3):*
    C.3 có 3 ô. Ta tô từng ô từ dưới lên (hoặc trên xuống đều được):
    - _Ô 1 & ô 2 của C.3_ kề ngang với 2 ô của C.2 → hệ số cho cặp này bằng $H = 7$.
    - _Ô 3 của C.3_: không kề ngang với ô nào (C.2 chỉ cao 2), chỉ kề dọc ô 2 → $k-1 = 3$ cách.
    - $N_3 = H times (k-1) = 7 times 3 = 21$ cách.

  #align(center)[$ N = 4 times 9 times 21 = bold(756) "cách" $]

  #note-box(title: "🔄 Bất ngờ đối xứng")[Bậc thang giảm 3→2→1 (VD12) và bậc thang tăng 1→2→3 (VD13) cùng cho *756 cách*! Đây không phải trùng hợp — lưới có tính đối xứng gương, số cách tô phải bằng nhau.]
])

#v(0.6em)

#cannon-box("Ví dụ 14 — Kim cương 1→2→3→2→1, k = 4 màu", [
  *Đề bài:* Lưới 9 ô hình thoi cân: bắt đầu 1 ô, tăng dần lên 3 ô, rồi giảm về 1 ô. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1 (h=1)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((0,0),(1,1), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((0,0),(1,1), stroke: xs); line((1,0),(0,1), stroke: xs)
      rect((0,2),(1,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((0,2),(1,3), stroke: xs); line((1,2),(0,3), stroke: xs)
      // C2 (h=2)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black); rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,2),(2,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((1,2),(2,3), stroke: xs); line((2,2),(1,3), stroke: xs)
      // C3 (h=3)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: p, stroke: 1.2pt + black)
      // C4 (h=2)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black); rect((3,0),(4,1), fill: o, stroke: 1.2pt + black)
      rect((3,2),(4,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((3,2),(4,3), stroke: xs); line((4,2),(3,3), stroke: xs)
      // C5 (h=1)
      rect((4,1),(5,2), fill: r, stroke: 1.2pt + black)
      rect((4,0),(5,1), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((4,0),(5,1), stroke: xs); line((5,0),(4,1), stroke: xs)
      rect((4,2),(5,3), fill: X, stroke: 0.6pt + rgb("CCCCCC")); line((4,2),(5,3), stroke: xs); line((5,2),(4,3), stroke: xs)
      // Nhãn
      for (i, c, l) in ((0, rgb("1B5E20"), "1ô"), (1, rgb("0D47A1"), "2ô"), (2, rgb("4A148C"), "3ô"), (3, rgb("BF360C"), "2ô"), (4, rgb("880E4F"), "1ô")) {
        content((i + 0.5, -0.4), text(size: 7pt, weight: "bold", fill: c)[C.#(i+1) (#l)])
      }
    })
  ]
  #v(0.4em)

  - *C.1 (QT1, h=1):* $N_1 = k = 4$ cách.
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$ cách.
  - *C.3 (QT: tăng 2→3):* Hai ô đầu kề C.2 cho hệ số $H=7$; ô thứ 3 chỉ kề dọc → $k-1=3$. Vậy $N_3 = H times (k-1) = 7 times 3 = 21$ cách.
  - *C.4 (QT: giảm 3→2):* C.4 có 2 ô, chỉ kề với 2 ô _dưới_ của C.3. Chuyển tiếp đầy đủ: $N_4 = H = 7$ cách.
  - *C.5 (QT3, giảm 2→1):* $N_5 = k-1 = 3$ cách.

  #align(center)[$ N = 4 times 9 times 21 times 7 times 3 = bold(15.876) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 15 — Kim cương 1→2→3→2→1, k = 3 màu", [
  *Đề bài:* Cùng lưới kim cương VD14, nhưng chỉ *3 màu*. Lưu ý $H=3$ và $k-1=2$.

  *Phân tích nhanh (cùng cấu trúc, thay $k=3$):*

  #table(
    columns: (1fr, 1fr, 1.5fr, 1fr),
    inset: 6pt,
    align: (left, center, left, center),
    [*Cột*], [*Chuyển tiếp*], [*Công thức*], [*Hệ số*],
    [C.1 (1ô)], [QT1], [$k = 3$], [*3*],
    [C.2 (2ô)], [Tăng 1→2], [$(k-1)^2 = 2^2$], [*4*],
    [C.3 (3ô)], [Tăng 2→3], [$H times (k-1) = 3 times 2$], [*6*],
    [C.4 (2ô)], [Giảm 3→2], [$H = k^2-3k+3$], [*3*],
    [C.5 (1ô)], [Giảm 2→1], [$k-1 = 2$], [*2*],
  )
  #v(0.3em)
  #align(center)[$ N = 3 times 4 times 6 times 3 times 2 = bold(432) "cách" $]

  #note-box(title: "📊 Bảng so sánh Kim Cương theo k")[
    #table(
      columns: (1fr, 1fr, 1fr, 1fr),
      inset: 5pt,
      align: center,
      [*k màu*], [*H*], [*Hệ số C.3*], [*Tổng N*],
      [$k=3$], [$3$], [$3 times 2 = 6$], [*432*],
      [$k=4$], [$7$], [$7 times 3 = 21$], [*15.876*],
      [$k=5$], [$13$], [$13 times 4 = 52$], [*5 × 16 × 52 × 13 × 4 = 216.320*],
    )
  ]
])

#pagebreak()

== 9. Tình Huống Đặc Biệt — Né 2 Ô Chéo & Ô Cô Lập

#note-box(title: "⚠️ Bổ sung Quy tắc 3: Né 2 ô chéo (chưa biết cùng màu hay khác màu)")[
  Khi một ô mới kề _chéo_ với 2 ô đã tô (ví dụ: ô kề ngang với một ô, đồng thời kề dọc với một ô khác — hai ô đó không chạm nhau), ta _không biết trước_ chúng cùng màu hay khác màu. Cách xử lý:
  
  1. *Tính trên tổng:* Lấy $k$ tổng màu của 2 ô đã tô: nếu cùng màu, ô mới có $k-1$ cách; nếu khác màu, ô mới có $k-2$ cách.
  2. *Đếm theo xác suất:* Trong tất cả cách tô 2 ô kề nhau (kề ngang/dọc), xác suất cùng màu là $1/k$, khác màu là $(k-1)/k$.
  3. *Hệ số kỳ vọng:* $1/k dot (k-1) + (k-1)/k dot (k-2) = ((k-1)^2 + (k-1)(k-2))/k = (k-1)(2k-3)/k$.
]

#v(0.5em)

#cannon-box("Ví dụ 16 — Lưới có ô kề chéo 2 ô đã tô, k = 4 màu", [
  *Đề bài:* Lưới 3 ô dạng chữ "L" ngược: Cột 1 cao 2 ô, Cột 2 chỉ có 1 ô ở _hàng dưới_ (kề chéo với cả 2 ô của Cột 1). Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
      // C1 — 2 ô (hàng 2 và 1)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      // C2 — 1 ô ở hàng dưới (kề ngang C1 hàng 0 VÀ kề chéo C1 hàng 1)
      rect((1,0),(2,1), fill: o, stroke: 1.5pt + black)
      rect((1,1),(2,2), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((1,1),(2,2), stroke: 0.6pt + rgb("BBBBBB")); line((2,1),(1,2), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn
      content((0.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[C.2])
      // Mũi tên chỉ kề chéo
      line((1.0, 0.5), (1.5, 1.0), stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 0.8pt))
      content((1.6, 0.9), text(size: 7pt, fill: rgb("BF360C"), weight: "bold")[chéo])
    })
  ]
  #v(0.3em)

  *Phân tích:*

  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 4 times 3 = 12$ cách.
  - *C.2 (QT — kề chéo với 2 ô đã tô):*
    Ô C.2 kề ngang ô C.1 hàng dưới (gọi màu $A$) và kề chéo ô C.1 hàng trên (gọi màu $B$).
    
    *Trường hợp 1:* Hai ô của C.1 _cùng màu_ ($A = B$): xảy ra ở $1/k = 1/4$ tổng số cách tô C.1. Khi đó ô C.2 chỉ cần né 1 màu $=> k-1 = 3$ cách.
    
    *Trường hợp 2:* Hai ô của C.1 _khác màu_ ($A eq.not B$): xảy ra ở $(k-1)/k = 3/4$. Khi đó ô C.2 phải né cả $A$ và $B$ (2 màu khác nhau) $=> k-2 = 2$ cách.
    
    *Hệ số kỳ vọng cho C.2 (tính trung bình):*
    $ N_2 = frac(1, k) dot (k-1) + frac(k-1, k) dot (k-2) = frac(1, 4) dot 3 + frac(3, 4) dot 2 = 0.75 + 1.5 = 2.25 $
    
    Nhưng _phải tính đúng_ bằng cách liệt kê:
    - Với 2 ô C.1 cùng màu: có $1 times 4 = 4$ cách (chọn 1 màu cho cả 2 ô) $->$ mỗi cách cho $k-1=3$ cách tô C.2 $=> 4 times 3 = 12$.
    - Với 2 ô C.1 khác màu: có $4 times 3 = 12$ cách (ô trên tự do, ô dưới né 1) $->$ mỗi cách cho $k-2=2$ cách tô C.2 $=> 12 times 2 = 24$.
    - Tổng số cách (C.1, C.2): $12 + 24 = 36$.
    - Số cách trung bình cho C.2: $36 / 12 = 3$ cách.
  
  #align(center)[$ N = 12 times 3 = bold(36) "cách" $]

  #note-box(title: "💡 Mẹo nhớ nhanh")[Với k=4, hệ số trung bình cho ô kề chéo 2 ô khác màu _(tính theo công thức)_ là $frac((k-1)(2k-3), k) = frac(3 times 5, 4) = 3.75$... Nhưng khi 2 ô kia _thuộc cùng cột_ (đã kề dọc, chắc chắn khác màu), ta dùng đúng $k-2$ nếu khác màu, $k-1$ nếu cùng màu. _Tính trung bình_ cho ra $frac((k-1)^2 + (k-1)(k-2), k) = 3$ khi $k=4$.]
])

#v(0.6em)

#cannon-box("Ví dụ 17 — Lưới 2 đảo tách rời (ô cô lập), k = 4 màu", [
  *Đề bài:* Lưới 5 ô gồm: Một khối vuông 2×2 (4 ô kề nhau) và 1 ô _cô lập_ tách rời ở xa (không kề cạnh với bất kỳ ô nào). Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
      // Khối 2x2
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
      rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
      // Ô cô lập (cách xa 1 đơn vị)
      rect((4,0.5),(5,1.5), fill: o, stroke: 1.5pt + black)
      // Dấu ... thể hiện khoảng cách
      for x in (2.2, 2.6, 3.0, 3.4) {
        line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
      }
      // Nhãn
      content((1.0, -0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Khối 2x2])
      content((4.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Ô lẻ])
    })
  ]
  #v(0.3em)

  *Phân tích bằng Bộ Quy Tắc:*

  - *Khối 2×2 (áp dụng Quét Cột 4 cột 1 ô? Không — phải dùng 2 cột cao 2 ô):*
    - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 12$ cách.
    - *C.2 (QT2, đầy đủ h=2):* $N_2 = H = 7$ cách.
    $ => N_"khối" = 12 times 7 = 84 $ cách.

  - *Ô cô lập:* Hoàn toàn tự do, không bị ràng buộc với khối 2×2. Chỉ cần chọn 1 trong $k$ màu:
    $ => N_"lẻ" = k = 4 $ cách.

  *Kết quả toàn lưới (Quy tắc nhân vì 2 phần độc lập):*
  #align(center)[
    $ N = N_"khối" times N_"lẻ" = 84 times 4 = bold(336) "cách" $
  ]

  #note-box(title: "🎯 Tư duy quan trọng")[Khi lưới _tách thành nhiều phần độc lập_ (không có ô kề cạnh giữa các phần), ta tính số cách tô _từng phần_ rồi _nhân với nhau_. Phần nào cũng có thể tô màu _trước_, thứ tự không quan trọng — bản chất là tích Cartesian của tập cách tô.]
])

#v(0.6em)

#cannon-box("Ví dụ 18 — Lưới 2 đảo tách rời nhưng có đảo lớn 3×2, k = 4 màu", [
  *Đề bài:* Khối chữ nhật 3 cột × 2 hàng (6 ô) và 1 ô cô lập. Có 4 màu.

  #grid(columns: (1fr, 1.4fr), gutter: 0.6cm, [
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let o = rgb("FFE0B2")
        // Khối 3x2
        rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
        rect((1,0),(2,1), fill: g, stroke: 1.2pt + black)
        rect((2,0),(3,1), fill: g, stroke: 1.2pt + black)
        rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
        rect((1,1),(2,2), fill: g, stroke: 1.2pt + black)
        rect((2,1),(3,2), fill: g, stroke: 1.2pt + black)
        // Ô lẻ (xa)
        rect((5,0.5),(6,1.5), fill: o, stroke: 1.5pt + black)
        for x in (3.3, 3.7, 4.1, 4.5) {
          line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
        }
        content((1.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("1B5E20"))[Khối 3×2])
        content((5.5, -0.4), text(size: 8pt, weight: "bold", fill: rgb("BF360C"))[Ô lẻ])
      })
    ]
  ], [
    *Phân tích:*
    - *Khối 3×2:* Quét cột:
      - C.1: $k(k-1) = 12$
      - C.2: $H = 7$
      - C.3: $H = 7$
      $=> N_"khối" = 12 times 7 times 7 = 588$
    - *Ô lẻ:* $k = 4$ cách.
    - *Tổng:* $N = 588 times 4 = 2352$
    
    #align(center)[
      $ N = 588 times 4 = bold(2352) "cách" $
    ]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 19 — Bậc thang 4 tầng 1→2→3→4, k = 4 màu (Stress-test Bộ Quy Tắc)", [
  *Đề bài:* Lưới 10 ô bậc thang đi lên đến 4 ô mỗi cột. Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.7cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2")
      // C1 (1 ô)
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black)
      // C2 (2 ô)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black)
      rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      // C3 (3 ô)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black)
      rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((2,2),(3,3), fill: p, stroke: 1.2pt + black)
      // C4 (4 ô)
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black)
      rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      rect((3,2),(4,3), fill: o, stroke: 1.2pt + black)
      rect((3,3),(4,4), fill: o, stroke: 1.2pt + black)
      // Nhãn
      content((0.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[C.1])
      content((1.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("0D47A1"))[C.2])
      content((2.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("4A148C"))[C.3])
      content((3.5,-0.3), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[C.4])
    })
  ]
  #v(0.3em)

  *Phân tích từng cột (vẫn dùng Bộ Quy Tắc mở rộng):*

  - *C.1 (QT1, h=1):* $N_1 = k = 4$.
  - *C.2 (QT3, tăng 1→2):* $N_2 = (k-1)^2 = 9$.
  - *C.3 (tăng 2→3):* Tô từng ô từ dưới lên:
    - 2 ô đầu (ô 1, ô 2) kề ngang C.2 -> hệ số cặp = $H = 7$.
    - Ô 3 (trên cùng) chỉ kề dọc ô 2 -> $k-1 = 3$.
    $ N_3 = H times (k-1) = 7 times 3 = 21 $.
  - *C.4 (tăng 3→4):* Tô từ dưới lên:
    - 3 ô đầu kề ngang C.3 -> _tương tự_ hệ số cặp giữa 3 ô đầu = $H = 7$, ô 3 kề dọc ô 2 = $k-1 = 3$. Tổng 3 ô đầu: $7 times 3 = 21$.
    - Ô 4 (trên cùng) chỉ kề dọc ô 3 -> $k-1 = 3$.
    $ N_4 = 21 times (k-1) = 21 times 3 = 63 $.

  *Kết quả:*
  #align(center)[
    $ N = 4 times 9 times 21 times 63 = bold(47.628) "cách" $
  ]

  #note-box(title: "🔁 Quy luật tổng quát")[Với bậc thang tăng $1 -> 2 -> 3 -> ... -> m$ và $k$ màu:
    - Cột $j$ (ở giữa hoặc cuối) có hệ số tăng theo _tích lũy_: $H, H(k-1), H(k-1)^2, ..., H(k-1)^(m-2)$.
    - Tổng: $N = k dot (k-1)^2 dot H^(m-2) times (k-1)^(((m-2)(m-1))/2)$ với công thức tổng quát của bậc thang tăng... Công thức chính xác phụ thuộc cấu trúc, nhưng tư duy _tô từng ô_ luôn đúng.]
])

#v(0.6em)

#cannon-box("Ví dụ 20 — Tổng hợp: Lưới 11 ô 2 đảo (Bài 3.3 chuẩn), k = 4 màu", [
  *Đề bài:* Lưới 11 ô gồm 2 phần tách rời:
  - _Phần A (bên trái):_ Khối 4 cột × 2 hàng (8 ô) kề đầy đủ.
  - _Phần B (bên phải):_ Khối 2 cột × 1 hàng + 1 ô đơn (3 ô) theo mô hình khuyết giảm.
  Có 4 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD")
      let p = rgb("EDE7F6"); let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      // Phần A — 4 cột × 2 hàng
      rect((0,0),(1,1), fill: g, stroke: 1.2pt + black); rect((0,1),(1,2), fill: g, stroke: 1.2pt + black)
      rect((1,0),(2,1), fill: b, stroke: 1.2pt + black); rect((1,1),(2,2), fill: b, stroke: 1.2pt + black)
      rect((2,0),(3,1), fill: p, stroke: 1.2pt + black); rect((2,1),(3,2), fill: p, stroke: 1.2pt + black)
      rect((3,0),(4,1), fill: o, stroke: 1.2pt + black); rect((3,1),(4,2), fill: o, stroke: 1.2pt + black)
      // Khoảng cách
      for x in (4.2, 4.5, 4.8) {
        line((x, 1.0), (x + 0.1, 1.0), stroke: 1.2pt + black)
      }
      // Phần B — 2 cột cao 1 ô + 1 ô lẻ
      rect((5.0, 0.5),(6.0, 1.5), fill: r, stroke: 1.5pt + black)
      rect((5.0, 1.5),(6.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((5.0, 1.5),(6.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((6.0, 1.5),(5.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      rect((6.0, 0.5),(7.0, 1.5), fill: rgb("FFE0B2"), stroke: 1.2pt + black)
      rect((6.0, 1.5),(7.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((6.0, 1.5),(7.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((7.0, 1.5),(6.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      rect((7.0, 0.5),(8.0, 1.5), fill: rgb("B2DFDB"), stroke: 1.2pt + black)
      rect((7.0, 1.5),(8.0, 2.5), fill: rgb("F5F5F5"), stroke: 0.6pt + rgb("CCCCCC"))
      line((7.0, 1.5),(8.0, 2.5), stroke: 0.6pt + rgb("BBBBBB")); line((8.0, 1.5),(7.0, 2.5), stroke: 0.6pt + rgb("BBBBBB"))
      // Nhãn phần
      content((2.0, 2.4), text(size: 7pt, weight: "bold", fill: rgb("1B5E20"))[Phần A — 4 cột đầy đủ])
      content((6.5, 2.4), text(size: 7pt, weight: "bold", fill: rgb("BF360C"))[Phần B — 1 hàng])
    })
  ]
  #v(0.3em)

  *Phân tích tách 2 phần độc lập:*

  *_Phần A (4 cột × 2 hàng = 8 ô):_*
  - C.1 (QT1, h=2): $12$
  - C.2 (QT2): $H = 7$
  - C.3 (QT2): $H = 7$
  - C.4 (QT2): $H = 7$
  $ => N_A = 12 times 7^3 = 12 times 343 = 4.116 $ cách.

  *_Phần B (3 ô theo hàng ngang):_*
  Cả 3 ô cùng hàng (h=1). Quét cột:
  - C.1 (QT1, h=1): $k = 4$
  - C.2 (QT2, h=1): $k-1 = 3$
  - C.3 (QT2, h=1): $k-1 = 3$
  $ => N_B = 4 times 3 times 3 = 36 $ cách.

  *_Kết quả (2 phần độc lập -> nhân):_*
  #align(center)[
    $ N = N_A times N_B = 4.116 times 36 = bold(148.176) "cách" $
  ]

  #note-box(title: "🧠 Bài học rút ra")[Khi gặp lưới phức tạp, _đừng hoảng_:
    1. _Quan sát kỹ_: Lưới có tách thành nhiều phần _rời nhau_ không?
    2. _Chia để trị_: Tính số cách tô _từng phần_ độc lập.
    3. _Quét cột_ trong mỗi phần: Dùng Bộ 3 Quy Tắc Vạn Năng.
    4. _Nhân kết quả_ các phần với nhau.
    
    Bộ Quy Tắc Vạn Năng đã _chinh phục_ mọi mô hình lưới từ đơn giản đến cực phức tạp!]
])

#pagebreak()

== 9. Chiến Dịch 5 Màu — Mọi Chiều Cao Từ 1 Đến 5 Hàng

Với $k=5$ màu: *$k-1=4$, $k-2=3$, $H = k^2-3k+3 = 13$*.
Phần này khám phá điều xảy ra khi cột ngày càng cao — từ 1 ô lên tới 5 ô — và cách Bộ Quy Tắc Vạn Năng vẫn vận hành hoàn hảo mà không cần thêm bất kỳ công thức mới nào.

#v(0.5em)

*Bảng hệ số tham chiếu nhanh ($k = 5$ màu):*

#grid(columns: (1fr, 1fr), gutter: 0.8cm, [
  #table(
    columns: (1.5fr, 1.3fr, 1fr),
    inset: 6pt,
    align: (left, left, center),
    table.header([*Cột khởi đầu (QT1)*], [*Công thức*], [*Hệ số*]),
    [h = 1 ô], [$k$], [*5*],
    [h = 2 ô], [$k(k-1)$], [*20*],
    [h = 3 ô], [$k(k-1)^2$], [*80*],
    [h = 4 ô], [$k(k-1)^3$], [*320*],
    [h = 5 ô], [$k(k-1)^4$], [*1280*],
  )
], [
  #table(
    columns: (1.8fr, 1fr, 1fr),
    inset: 6pt,
    align: (left, left, center),
    table.header([*Chuyển tiếp (QT2/QT3)*], [*Công thức*], [*Hệ số*]),
    [h=1 → h=1], [$k-1$], [*4*],
    [h=2 → h=2 (đầy đủ)], [$H$], [*13*],
    [h=1 → h=n bất kỳ], [$(k-1)^n$], [*4ⁿ*],
    [h≥2 → h=1], [$k-1$], [*4*],
    [h≥3 → h=2], [$H$], [*13*],
    [h=2 → h=n (n≥3)], [$H(k-1)^(n-2)$], [*13·4ⁿ⁻²*],
  )
])

#note-box(title: "📐 Quy luật tổng quát về chuyển tiếp")[
  *Khi cột mới THẤP hơn cột cũ (khuyết giảm):* chỉ có $m$ ô của cột cũ tương tác với $m$ ô của cột mới (tính từ dưới lên). Các ô phía trên của cột cũ bị bỏ qua hoàn toàn. Kết quả: $m=1 → k-1$; $m=2 → H$.

  *Khi cột mới CAO hơn cột cũ (khuyết tăng):* $n$ ô đầu của cột mới tương tác với cột cũ cao $n$ ô, sau đó mỗi ô dư thêm chỉ kề dọc với ô liền trên → nhân thêm $k-1$ cho mỗi ô dư.
]

#v(0.5em)

// ────────────────────────────────────────────
#cannon-box("Ví dụ 16 — Bậc thang giảm 3→2→1, k=5 màu", [
  *Đề bài:* Lưới 6 ô: Cột 1 cao *3 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1: 3 ô
      for i in range(3) { rect((0, i),(1, i+1), fill: g, stroke: 1.2pt+black) }
      // C2: 2 ô + ô trống trên
      for i in range(2) { rect((1, i),(2, i+1), fill: b, stroke: 1.2pt+black) }
      rect((1,2),(2,3), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
      line((1,2),(2,3), stroke: xs); line((2,2),(1,3), stroke: xs)
      // C3: 1 ô + ô trống
      rect((2,0),(3,1), fill: o, stroke: 1.2pt+black)
      for i in range(1,3) {
        rect((2,i),(3,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
      }
      content((0.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1 (h=3)])
      content((1.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2 (h=2)])
      content((2.5,-0.4), text(size: 7.5pt, weight:"bold", fill:rgb("BF360C"))[C.3 (h=1)])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=3):* $N_1 = k(k-1)^2 = 5 times 4^2 = 80$ cách.
  - *C.2 (giảm 3→2, chỉ 2 ô dưới của C.1 tương tác):* $N_2 = H = 13$ cách.
  - *C.3 (giảm 2→1):* $N_3 = k-1 = 4$ cách.
  #align(center)[$ N = 80 times 13 times 4 = bold(4160) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 17 — Bậc thang giảm 4→2→1, k=5 màu", [
  *Đề bài:* Lưới 7 ô: Cột 1 cao *4 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.8cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.6pt + rgb("BBBBBB")
      // C1: 4 ô
      for i in range(4) { rect((0,i),(1,i+1), fill: g, stroke: 1.2pt+black) }
      // C2: 2 ô + 2 ô trống
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.2pt+black) }
      for i in range(2,4) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: 1 ô + 3 ô trống
      rect((2,0),(3,1), fill: o, stroke: 1.2pt+black)
      for i in range(1,4) {
        rect((2,i),(3,i+1), fill: X, stroke: 0.6pt+rgb("CCCCCC"))
        line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
      }
      content((0.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("1B5E20"))[C.1 (h=4)])
      content((1.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("0D47A1"))[C.2 (h=2)])
      content((2.5,-0.4), text(size: 7pt, weight:"bold", fill:rgb("BF360C"))[C.3 (h=1)])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=4):* $N_1 = k(k-1)^3 = 5 times 4^3 = 5 times 64 = 320$ cách.
  - *C.2 (giảm 4→2):* 2 ô dưới của C.1 tương tác với C.2 cao 2 ô. 2 ô trên của C.1 bị bỏ qua. $N_2 = H = 13$ cách.
  - *C.3 (giảm 2→1):* $N_3 = k-1 = 4$ cách.
  #align(center)[$ N = 320 times 13 times 4 = bold(16.640) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 18 — Bậc thang giảm 5→2→1, k=5 màu", [
  *Đề bài:* Lưới 8 ô: Cột 1 cao *5 ô*, Cột 2 cao *2 ô*, Cột 3 cao *1 ô*. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.6cm, [
    #align(center)[
      #cetz.canvas(length: 0.72cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        let X = rgb("F5F5F5"); let xs = 0.55pt + rgb("BBBBBB")
        // C1: 5 ô
        for i in range(5) { rect((0,i),(1,i+1), fill: g, stroke: 1.1pt+black) }
        // C2: 2 ô + 3 trống
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
        for i in range(2,5) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: 1 ô + 4 trống
        rect((2,0),(3,1), fill: o, stroke: 1.1pt+black)
        for i in range(1,5) {
          rect((2,i),(3,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((2,i),(3,i+1), stroke: xs); line((3,i),(2,i+1), stroke: xs)
        }
        content((0.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
        content((1.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
        content((2.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("BF360C"))[C.3])
      })
    ]
  ], [
    - *C.1 (QT1, h=5):*
      $N_1 = k(k-1)^4 = 5 times 4^4 = 5 times 256 = 1280$

    - *C.2 (giảm 5→2):*
      Chỉ 2 ô _dưới_ của C.1 tương tác với C.2 (3 ô trên bỏ qua).
      $N_2 = H = 13$

    - *C.3 (giảm 2→1):*
      $N_3 = k-1 = 4$

    #align(center)[$ N = 1280 times 13 times 4 = bold(66.560) "cách" $]
  ])
])

#v(0.6em)

#note-box(title: "🔍 Nhận xét quy luật bậc thang giảm")[
  Với bậc thang giảm $h -> 2 -> 1$ cùng $k=5$:

  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    inset: 5pt,
    align: center,
    [*h ban đầu*], [*$N_1 = 5 times 4^(h-1)$*], [*$N_2 = H = 13$*], [*Tổng*],
    [h=2], [$20$], [$13 times 4$], [*1.040*],
    [h=3], [$80$], [$13 times 4$], [*4.160*],
    [h=4], [$320$], [$13 times 4$], [*16.640*],
    [h=5], [$1280$], [$13 times 4$], [*66.560*],
  )

  Mỗi lần tăng thêm 1 tầng chiều cao, số cách nhân thêm đúng $k-1=4$ lần — vì ô thêm vào chỉ kề dọc 1 ô bên trong cột, không tạo thêm ràng buộc ngoài.
]

#v(0.5em)

#cannon-box("Ví dụ 19 — Bậc thang tăng 1→2→4, k=5 màu", [
  *Đề bài:* Lưới 7 ô bậc thang đi lên: Cột 1 cao *1 ô*, Cột 2 cao *2 ô*, Cột 3 cao *4 ô*. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.78cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
      let X = rgb("F5F5F5"); let xs = 0.55pt + rgb("BBBBBB")
      // C1: 1 ô dưới, 3 ô trống trên
      rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
      for i in range(1,4) {
        rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
      }
      // C2: 2 ô dưới, 2 ô trống trên
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
      for i in range(2,4) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: 4 ô
      for i in range(4) { rect((2,i),(3,i+1), fill: o, stroke: 1.1pt+black) }
      content((0.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
      content((1.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
      content((2.5,-0.4), text(size: 6.5pt, weight:"bold", fill:rgb("BF360C"))[C.3])
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=1):* $N_1 = k = 5$ cách.
  - *C.2 (tăng 1→2):* $(k-1)^2 = 4^2 = 16$ cách.
  - *C.3 (tăng 2→4 — từ 2 ô phình lên 4 ô):*
    Ta tô C.3 từ dưới lên (hoặc trên xuống):
    - _Ô 1 & ô 2 của C.3_: kề ngang với 2 ô của C.2 → hệ số $H = 13$.
    - _Ô 3 của C.3_: chỉ kề dọc ô 2 (C.2 chỉ cao 2, không có ô hàng 3) → $k-1=4$.
    - _Ô 4 của C.3_: chỉ kề dọc ô 3 → $k-1=4$.
    $ N_3 = H times (k-1)^2 = 13 times 4^2 = 13 times 16 = 208 "cách" $
  #align(center)[$ N = 5 times 16 times 208 = bold(16.640) "cách" $]

  #note-box(title: "🪞 Đối xứng bất ngờ")[Bậc thang *giảm* 4→2→1 (VD17) và bậc thang *tăng* 1→2→4 (VD19) đều cho *16.640 cách*! Đây là tính đối xứng gương — lật ngang hình lưới không thay đổi số cách tô.]
])

#v(0.6em)

#cannon-box("Ví dụ 20 — Bậc thang tăng 1→2→5, k=5 màu", [
  *Đề bài:* Lưới: Cột 1 cao *1 ô*, Cột 2 cao *2 ô*, Cột 3 cao *5 ô*. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.5cm, [
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let o = rgb("FFE0B2")
        let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
        // C1: 1 ô
        rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
        for i in range(1,5) {
          rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
        }
        // C2: 2 ô
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
        for i in range(2,5) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: 5 ô
        for i in range(5) { rect((2,i),(3,i+1), fill: o, stroke: 1.1pt+black) }
        content((0.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("1B5E20"))[C.1])
        content((1.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("0D47A1"))[C.2])
        content((2.5,-0.4), text(size: 6pt, weight:"bold", fill:rgb("BF360C"))[C.3])
      })
    ]
  ], [
    - *C.1 (QT1, h=1):* $N_1 = k = 5$
    - *C.2 (tăng 1→2):* $(k-1)^2 = 16$
    - *C.3 (tăng 2→5):*
      - Ô 1&2: kề C.2 → $H = 13$
      - Ô 3: kề dọc ô 2 → $k-1=4$
      - Ô 4: kề dọc ô 3 → $k-1=4$
      - Ô 5: kề dọc ô 4 → $k-1=4$
      $ N_3 = H times (k-1)^3 = 13 times 64 = 832 $

    #align(center)[$ N = 5 times 16 times 832 = bold(66.560) "cách" $]
  ])

  #note-box(title: "📊 Đối xứng với VD18")[Bậc thang giảm 5→2→1 (VD18 = 66.560) khớp đúng với bậc thang tăng 1→2→5 (VD20 = 66.560). Tính đối xứng là nhất quán!]
])

#v(0.6em)

#cannon-box("Ví dụ 21 — Kim cương 1→2→4→2→1, k=5 màu", [
  *Đề bài:* Lưới 10 ô hình thoi: khởi đầu 1 ô, phình lên 4 ô, thu về 1 ô. Có 5 màu.

  #align(center)[
    #cetz.canvas(length: 0.72cm, {
      import cetz.draw: *
      let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let p = rgb("EDE7F6")
      let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
      let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
      let hmax = 4
      // C1: h=1
      rect((0,0),(1,1), fill: g, stroke: 1.1pt+black)
      for i in range(1,hmax) {
        rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
      }
      // C2: h=2
      for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1.1pt+black) }
      for i in range(2,hmax) {
        rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
      }
      // C3: h=4 (full)
      for i in range(hmax) { rect((2,i),(3,i+1), fill: p, stroke: 1.1pt+black) }
      // C4: h=2
      for i in range(2) { rect((3,i),(4,i+1), fill: o, stroke: 1.1pt+black) }
      for i in range(2,hmax) {
        rect((3,i),(4,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((3,i),(4,i+1), stroke: xs); line((4,i),(3,i+1), stroke: xs)
      }
      // C5: h=1
      rect((4,0),(5,1), fill: r, stroke: 1.1pt+black)
      for i in range(1,hmax) {
        rect((4,i),(5,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
        line((4,i),(5,i+1), stroke: xs); line((5,i),(4,i+1), stroke: xs)
      }
      let labels2 = ("C.1 (1ô)", "C.2 (2ô)", "C.3 (4ô)", "C.4 (2ô)", "C.5 (1ô)")
      let fcolors2 = (rgb("1B5E20"), rgb("0D47A1"), rgb("4A148C"), rgb("BF360C"), rgb("880E4F"))
      for i in range(5) {
        content((i+0.5,-0.4), text(size: 6pt, weight:"bold", fill:fcolors2.at(i))[#labels2.at(i)])
      }
    })
  ]
  #v(0.3em)

  - *C.1 (QT1, h=1):* $N_1 = k = 5$
  - *C.2 (tăng 1→2):* $N_2 = (k-1)^2 = 16$
  - *C.3 (tăng 2→4):* $N_3 = H times (k-1)^2 = 13 times 16 = 208$
  - *C.4 (giảm 4→2):* Chỉ 2 ô dưới của C.3 tương tác. $N_4 = H = 13$
  - *C.5 (giảm 2→1):* $N_5 = k-1 = 4$

  #align(center)[$ N = 5 times 16 times 208 times 13 times 4 = bold(865.280) "cách" $]
])

#v(0.6em)

#cannon-box("Ví dụ 22 — Kim cương lớn 1→2→5→2→1, k=5 màu", [
  *Đề bài:* Lưới 11 ô hình thoi cao nhất: 1→2→5→2→1. Có 5 màu.

  #grid(columns: (1fr, 1.5fr), gutter: 0.5cm, [
    #align(center)[
      #cetz.canvas(length: 0.65cm, {
        import cetz.draw: *
        let g = rgb("E8F5E9"); let b = rgb("E3F2FD"); let p = rgb("EDE7F6")
        let o = rgb("FFE0B2"); let r = rgb("FCE4EC")
        let X = rgb("F5F5F5"); let xs = 0.5pt + rgb("BBBBBB")
        let hmax = 5
        // C1: h=1
        rect((0,0),(1,1), fill: g, stroke: 1pt+black)
        for i in range(1,hmax) {
          rect((0,i),(1,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((0,i),(1,i+1), stroke: xs); line((1,i),(0,i+1), stroke: xs)
        }
        // C2: h=2
        for i in range(2) { rect((1,i),(2,i+1), fill: b, stroke: 1pt+black) }
        for i in range(2,hmax) {
          rect((1,i),(2,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((1,i),(2,i+1), stroke: xs); line((2,i),(1,i+1), stroke: xs)
        }
        // C3: h=5
        for i in range(hmax) { rect((2,i),(3,i+1), fill: p, stroke: 1pt+black) }
        // C4: h=2
        for i in range(2) { rect((3,i),(4,i+1), fill: o, stroke: 1pt+black) }
        for i in range(2,hmax) {
          rect((3,i),(4,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((3,i),(4,i+1), stroke: xs); line((4,i),(3,i+1), stroke: xs)
        }
        // C5: h=1
        rect((4,0),(5,1), fill: r, stroke: 1pt+black)
        for i in range(1,hmax) {
          rect((4,i),(5,i+1), fill: X, stroke: 0.5pt+rgb("CCCCCC"))
          line((4,i),(5,i+1), stroke: xs); line((5,i),(4,i+1), stroke: xs)
        }
        for (i, c) in ((0,rgb("1B5E20")),(1,rgb("0D47A1")),(2,rgb("4A148C")),(3,rgb("BF360C")),(4,rgb("880E4F"))) {
          content((i+0.5,-0.4), text(size: 6pt, weight:"bold", fill:c)[C.#(i+1)])
        }
      })
    ]
  ], [
    - *C.1 (QT1, h=1):* $N_1 = 5$
    - *C.2 (tăng 1→2):* $N_2 = (k-1)^2 = 16$
    - *C.3 (tăng 2→5):*
      $N_3 = H times (k-1)^3 = 13 times 64 = 832$
    - *C.4 (giảm 5→2):*
      2 ô dưới của C.3 tương tác (3 ô trên bỏ qua).
      $N_4 = H = 13$
    - *C.5 (giảm 2→1):* $N_5 = k-1 = 4$

    #align(center)[$ N = 5 times 16 times 832 times 13 times 4 $
    $ = bold(3.461.120) "cách" $]
  ])
])

#v(0.6em)

#cannon-box("Ví dụ 23 — Lưới 5 cột 2 hàng (2×5), k=5 màu", [
  *Đề bài:* Lưới 10 ô hoàn chỉnh dạng 2 hàng × 5 cột. Có 5 màu. Hai ô chung cạnh phải khác màu.

  #align(center)[
    #cetz.canvas(length: 0.85cm, {
      import cetz.draw: *
      let cols = (rgb("E8F5E9"), rgb("E3F2FD"), rgb("EDE7F6"), rgb("FFE0B2"), rgb("FCE4EC"))
      for (ci, c) in cols.enumerate() {
        rect((ci, 0),(ci+1, 1), fill: c, stroke: 1.1pt+black)
        rect((ci, 1),(ci+1, 2), fill: c, stroke: 1.1pt+black)
        content((ci+0.5,-0.35), text(size: 7pt, weight:"bold")[C.#(ci+1)])
      }
    })
  ]
  #v(0.3em)
  - *C.1 (QT1, h=2):* $N_1 = k(k-1) = 5 times 4 = 20$ cách.
  - *C.2 đến C.5 (QT2, chuyển tiếp đầy đủ):* Mỗi cột đều kề đầy đủ cột trước, nhân thêm $H=13$.
  #align(center)[
    $ N = k(k-1) times H^4 = 20 times 13^4 = 20 times 28561 = bold(571.220) "cách" $
  ]
])

#v(0.5em)

*Bảng tổng kết: Kim cương (1→2→h_max→2→1) theo k và h_max*

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 6pt,
  align: center,
  table.header([*Hình thoi*], [*Hệ số C.3*], [*k=3*], [*k=4*], [*k=5*]),
  [1→2→2→2→1], [$H$], [$3$], [$7$], [$13$],
  [1→2→3→2→1], [$H(k-1)$], [$3 times 2$], [$7 times 3$], [$13 times 4$],
  [1→2→4→2→1], [$H(k-1)^2$], [$3 times 4$], [$7 times 9$], [$13 times 16$],
  [1→2→5→2→1], [$H(k-1)^3$], [$3 times 8$], [$7 times 27$], [$13 times 64$],
  [*Tổng N (k=3)*], [], [*432*], [*—*], [*—*],
  [*Tổng N (k=4)*], [], [*—*], [*15.876*], [*—*],
  [*Tổng N (k=5)*], [], [*—*], [*—*], [*3.461.120*],
)

#pagebreak()

== 10. Bên Ngoài Lưới — Tô Màu Đồ Thị Tổng Quát

Cho đến nay, Bộ Quy Tắc Quét Cột chỉ hoạt động với *lưới ô vuông*. Nhưng khi bài toán có hình tròn, có tâm, có các nút nối bằng dây tuỳ ý thì sao? Thay vì mỗi loại đồ thị dùng một công thức riêng biệt khiến việc ghi nhớ gặp khó khăn, ta có thể quy tất cả về *Một Bộ Quy Tắc Thống Nhất Duy Nhất* hoạt động trên mọi loại mô hình.

=== 10.1 — Hệ Quy Tắc Thống Nhất Vạn Năng (Quy Tắc Quét Đỉnh & Co-Xóa)

Mọi cấu trúc đồ thị thực chất đều là một tập hợp các nút (đỉnh) được nối với nhau bởi các sợi dây liên kết (cạnh). Chúng ta có thể tính số cách tô màu bằng cách quét lần lượt từng nút với đúng *3 quy tắc cốt lõi* sau:

#theory-box[
  *Quy tắc 1: Chọn đỉnh khởi đầu (Đỉnh 1)*
  - Ta chọn một đỉnh bất kỳ làm điểm xuất phát (nên ưu tiên chọn đỉnh có liên kết nhiều nhất như đỉnh tâm).
  - Số cách tô màu cho đỉnh đầu tiên này là: $k$ cách.

  *Quy tắc 2: Chuyển tiếp đỉnh (Né màu các đỉnh kề trước đó)*
  - Ta lần lượt chọn đỉnh tiếp theo kề với phần đã tô màu. Tại đỉnh mới $v$:
    - Nếu $v$ chỉ kề với *1 đỉnh đã tô màu* (hoặc kề nhiều đỉnh nhưng các đỉnh đó cùng màu): Nhân thêm $(k-1)$ vào kết quả.
    - Nếu $v$ kề với *2 đỉnh đã tô màu và 2 đỉnh này khác màu nhau*: Nhân thêm $(k-2)$ vào kết quả.

  *Quy tắc 3: Quy tắc phá vòng khép kín (Co - Xóa cạnh)*
  - Khi gặp vòng khép kín (khiến nút cuối cùng kề ngược lại nút đầu tiên), ta chọn một cạnh liên kết $e = (u,v)$ của vòng để "phá" theo công thức:
    $ P(G, k) = P(G backslash e, k) - P(G \/ e, k) $
    - *Xóa cạnh ($G backslash e$):* Cắt đứt liên kết $e$ $->$ biến vòng khép kín thành đường thẳng (dễ dàng áp dụng Quy tắc 2).
    - *Co cạnh ($G \/ e$):* Chập hai đỉnh $u$ và $v$ thành một đỉnh duy nhất (rút gọn số đỉnh để tiếp tục áp dụng Quy tắc 2).
]

#v(0.5em)


// ─────────────────────────────────────
*Bản đồ vũ khí theo hình dạng đồ thị:*

#table(
  columns: (1.8fr, 1fr, 1.4fr, 1.2fr),
  inset: 7pt,
  align: (left, center, left, center),
  table.header([*Loại đồ thị*], [*Ký hiệu*], [*Công thức $P(G,k)$*], [*VD $k=4$*]),
  [Đường thẳng / Cây bất kỳ ($n$ đỉnh)], [$P_n$ / $T_n$], [$k(k-1)^(n-1)$], [$4 dot 3^(n-1)$],
  [Vòng tròn ($n$ đỉnh)], [$C_n$], [$(k-1)^n + (-1)^n (k-1)$], [xem bảng],
  [Sao ($1$ tâm, $n$ cánh)], [$K_(1,n)$], [$k(k-1)^n$], [$4 dot 3^n$],
  [Bánh xe ($1$ tâm + vòng $n$)], [$W_n$], [$k dot [(k-2)^n + (-1)^n (k-2)]$], [xem VD],
  [Đầy đủ ($n$ đỉnh, mọi cặp nối)], [$K_n$], [$k(k-1)(k-2) dots.c (k-n+1)$], [$4 dot 3 dot 2 dot 1$],
  [Bất kỳ (dùng Xoá-Chập)], [$G$], [$P(G backslash e, k) - P(G \/ e, k)$], [xem VD],
)

#v(0.8em)

// ─────────────────────────────────────
=== 10.1 — Đồ Thị Vòng $C_n$ (Hình Tròn)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i + 1) * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.5pt + rgb("00695C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.5pt + rgb("00695C"))
        content(p, text(size: 8pt, weight: "bold")[$v_#(i+1)$])
      }
      content((0,-1.8), text(size: 8pt, fill: rgb("00695C"), weight: "bold")[$C_5$ — vòng 5 đỉnh])
    })
  ]
], [
  Mỗi đỉnh nối với *đúng 2 đỉnh kề*, không có tâm. Công thức:
  $ P(C_n, k) = (k-1)^n + (-1)^n (k-1) $

  *Ví dụ:* $C_5$ với $k=4$ màu:
  $ P(C_5, 4) = 3^5 + (-1)^5 dot 3 = 243 - 3 = 240 $

  *Đây chính là Đại Bác số 3 trong phần I!* Công thức vòng tròn và đa thức màu của $C_n$ là một.
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.2 — Đồ Thị Sao $K_{1,n}$ (Một Tâm, Nhiều Cánh)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      // Tâm
      circle((0,0), radius: 0.28, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("BF360C"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
      // 4 cánh
      let pts = ((0,1.3), (1.3,0), (0,-1.3), (-1.3,0))
      let lbs = ("v₁","v₂","v₃","v₄")
      for (i, p) in pts.enumerate() {
        line((0,0), p, stroke: 1.5pt + rgb("BF360C"))
        circle(p, radius: 0.22, fill: white, stroke: 1.5pt + rgb("BF360C"))
        content(p, text(size: 7.5pt, weight: "bold")[#lbs.at(i)])
      }
      content((0,-2.0), text(size: 8pt, fill: rgb("BF360C"), weight: "bold")[$K_(1,4)$ — sao 4 cánh])
    })
  ]
], [
  Tâm nối với *tất cả* các cánh; các cánh *không nối nhau*.

  *Lý luận:*
  - Tâm chọn tự do: $k$ cách.
  - Mỗi cánh chỉ cần khác tâm (các cánh không kề nhau): $k-1$ cách *mỗi cánh*.

  $ P(K_(1,n), k) = k(k-1)^n $

  *Ví dụ:* $K_(1,4)$ ($4$ cánh) với $k=4$:
  $ P(K_(1,4), 4) = 4 times 3^4 = 4 times 81 = 324 $

  _Chú ý:_ đây chính xác là công thức Súng Lục nhưng ô đầu (tâm) có $k$ cách và $n$ ô kề tâm có $k-1$ cách mỗi cái độc lập.
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.3 — Đồ Thị Bánh Xe $W_n$ (Tâm + Vòng Tròn)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      // Vành
      for i in range(5) {
        let a = i * 72deg + 90deg
        let an = (i + 1) * 72deg + 90deg
        let p = (calc.cos(a)*1.2, calc.sin(a)*1.2)
        let pn = (calc.cos(an)*1.2, calc.sin(an)*1.2)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        // Nan hoa nối về tâm
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1pt))
        circle(p, radius: 0.22, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        content(p, text(size: 7.5pt, weight: "bold")[$v_#(i+1)$])
      }
      // Tâm
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
      content((0,-2.0), text(size: 7.5pt, fill: rgb("0D47A1"), weight: "bold")[$W_5$ — bánh xe 5 vành])
    })
  ]
], [
  Bánh xe = vòng $C_n$ + 1 tâm nối tất cả vành. *Tâm và vành đều ràng buộc nhau.*

  *Lý luận (2 bước):*
  - *Bước 1:* Chọn màu cho tâm: $k$ cách.
  - *Bước 2:* Tô $n$ đỉnh vành tạo thành $C_n$, nhưng mỗi đỉnh vành phải khác tâm. Thực chất là tô $C_n$ với $k-1$ màu còn lại.
  $ P(W_n, k) = k dot P(C_n, k-1) $
  $ = k dot [(k-2)^n + (-1)^n (k-2)] $

  *Ví dụ:* $W_5$ với $k=4$:
  $ P(W_5, 4) = 4 dot [(4-2)^5 + (-1)^5(4-2)] $
  $ = 4 dot [32 - 2] = 4 times 30 = *120* $
])

#cannon-box("Ví dụ thực chiến — Bánh xe W₄ với k=4", [
  *Đề bài:* 5 đỉnh: 1 tâm C nối với 4 đỉnh $v_1, v_2, v_3, v_4$ xếp thành vòng tròn. Có 4 màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      for i in range(4) {
        let a = i * 90deg + 45deg
        let an = (i+1) * 90deg + 45deg
        let p = (calc.cos(a)*1.1, calc.sin(a)*1.1)
        let pn = (calc.cos(an)*1.1, calc.sin(an)*1.1)
        line(p, pn, stroke: 1.3pt + rgb("0D47A1"))
        line((0,0), p, stroke: (dash: "dashed", paint: rgb("1B5E20"), thickness: 1.1pt))
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("0D47A1"))
        let lbs = ("v₁","v₂","v₃","v₄")
        content(p, text(size: 7.5pt, weight: "bold")[#lbs.at(i)])
      }
      circle((0,0), radius: 0.28, fill: rgb("FFF9C4"), stroke: 1.5pt + rgb("1B5E20"))
      content((0,0), text(size: 8pt, weight: "bold")[C])
    })
  ]

  - *Bước 1 — Chọn màu tâm C:* $k = 4$ cách.
  - *Bước 2 — Tô vành $C_4$ với $k-1=3$ màu còn lại:*
    $ P(C_4, 3) = (3-1)^4 + (-1)^4(3-1) = 16 + 2 = 18 "cách" $
  - *Kết quả:*
    $ P(W_4, 4) = 4 times 18 = bold(72) "cách" $
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.4 — Đồ Thị Đầy Đủ $K_n$ (Mọi Cặp Đều Nối)

#grid(columns: (1fr, 1.4fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.0cm, {
      import cetz.draw: *
      let pts = ((0,1.2), (1.1,-0.4), (-1.1,-0.4))
      // K3: mọi cặp nối
      for i in range(3) {
        for j in range(i+1, 3) {
          line(pts.at(i), pts.at(j), stroke: 1.3pt + rgb("4A148C"))
        }
      }
      for (i, p) in pts.enumerate() {
        circle(p, radius: 0.25, fill: white, stroke: 1.3pt + rgb("4A148C"))
        content(p, text(size: 8pt, weight: "bold")[$v_#(i+1)$])
      }
      content((0,-1.5), text(size: 8pt, fill: rgb("4A148C"), weight: "bold")[$K_3$ — tam giác])
    })
  ]
], [
  Mỗi cặp đỉnh đều nối trực tiếp. Đây là đồ thị "chặt chẽ nhất" — mọi đỉnh đều ràng buộc lẫn nhau.

  *Lý luận:*
  Đỉnh 1: $k$ cách. Đỉnh 2: phải khác đỉnh 1 → $k-1$. Đỉnh 3: khác cả đỉnh 1 lẫn 2 → $k-2$. Tiếp tục...

  $ P(K_n, k) = k(k-1)(k-2) dots.c (k-n+1) $

  *Điều kiện tô được:* $k >= n$ (cần ít nhất $n$ màu).

  *Ví dụ:* $K_4$ với $k=4$:
  $ P(K_4, 4) = 4 times 3 times 2 times 1 = *24* $
  
  $K_4$ với $k=5$: $5 times 4 times 3 times 2 = *120*$
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.5 — Đồ Thị Bất Kỳ: Thuật Toán Xoá-Chập

Khi đồ thị không thuộc loại nào quen thuộc, ta dùng *Thuật toán Xoá-Chập* — công cụ vạn năng tính $P(G, k)$ cho *bất kỳ* đồ thị nào.

#cannon-box("⚙️ Thuật Toán Xoá-Chập (Deletion-Contraction)", [
  Chọn bất kỳ 1 cạnh $e = (u, v)$ của đồ thị $G$. Khi đó:
  $ P(G, k) = P(G backslash e, k) - P(G \/ e, k) $
  
  Trong đó:
  - $G backslash e$: *Xoá cạnh $e$* — đồ thị sau khi bỏ cạnh nối $u$-$v$ (hai đỉnh vẫn còn, chỉ mất ràng buộc).
  - $G \/ e$: *Chập đỉnh $u$ và $v$ làm 1* — hai đỉnh hợp nhất thành 1 đỉnh mới (ràng buộc chập vào).

  *Tại sao đúng?*
  - $P(G, k)$ = số cách tô thỏa mãn tất cả ràng buộc kể cả $u \ne v$.
  - $P(G backslash e, k)$ = số cách tô bỏ qua ràng buộc $u \ne v$ = đếm CẢ trường hợp $u = v$ lẫn $u \ne v$.
  - $P(G / e, k)$ = số cách tô với $u$ và $v$ bị BẮT BUỘC TRÙNG màu.
  - Hiệu = chỉ còn đúng các cách tô có $u \ne v$. ✓
])

#v(0.5em)

#cannon-box("Ví dụ — Đồ thị hình thoi (4 đỉnh, 5 cạnh)", [
  *Đề bài:* Đồ thị $G$ gồm 4 đỉnh $A, B, C, D$ với 5 cạnh: $A$-$B$, $B$-$C$, $C$-$D$, $D$-$A$, $A$-$C$ (thêm đường chéo). Có $k=3$ màu. Tính số cách tô.

  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      let pA = (-1.0, 0.0); let pB = (0.0, 1.0)
      let pC = (1.0, 0.0); let pD = (0.0, -1.0)
      // Viền ngoài
      for (p, q) in ((pA, pB), (pB, pC), (pC, pD), (pD, pA)) {
        line(p, q, stroke: 1.4pt + rgb("0D47A1"))
      }
      // Đường chéo A-C
      line(pA, pC, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.4pt))
      content((0, 0.2), text(size: 7pt, fill: rgb("BF360C"), style: "italic")[chéo])
      // Đỉnh
      for (p, l) in ((pA,"A"),(pB,"B"),(pC,"C"),(pD,"D")) {
        circle(p, radius: 0.25, fill: white, stroke: 1.4pt + rgb("0D47A1"))
        content(p, text(size: 9pt, weight: "bold")[#l])
      }
      content((0,-1.8), text(size: 8pt, weight: "bold", fill: rgb("0D47A1"))[Đồ thị G])
    })
  ]
  #v(0.3em)

  *Chọn cạnh $A$-$C$ để xoá-chập:*

  - *$G backslash (A$-$C)$:* Bỏ đường chéo → còn lại vòng $C_4$ (A-B-C-D-A).
    $ P(C_4, 3) = (3-1)^4 + (-1)^4(3-1) = 16 + 2 = 18 $

  - *$G \/ (A$-$C)$:* Chập A và C thành đỉnh AC → đồ thị mới có 3 đỉnh {AC, B, D}. AC nối với B (từ cạnh A-B và B-C), AC nối D (từ A-D và C-D), B và D không nối nhau → đây là đường thẳng B-AC-D tức là $P_3$.
    $ P(P_3, 3) = 3 times 2^2 = 12 $

  *Kết quả:*
  $ P(G, 3) = P(G backslash e, 3) - P(G \/ e, 3) = 18 - 12 = bold(6) "cách" $
])

#v(0.5em)

// ─────────────────────────────────────
=== 10.6 — Bản Đồ Và Đồ Thị Đối Ngẫu (Planar Map → Dual Graph)

Khi bài toán cho hình vẽ vùng (bản đồ, các miếng ghép), *không cần ép về lưới*. Thay vào đó, dùng *đồ thị đối ngẫu*:

#grid(columns: (1.2fr, 1fr), gutter: 0.8cm, [
  #align(center)[
    #cetz.canvas(length: 1.1cm, {
      import cetz.draw: *
      // Hình chữ nhật chia 4 vùng
      rect((-1.8,-1.2),(1.8,1.2), stroke: 1.3pt + rgb("37474F"))
      line((0,-1.2),(0,1.2), stroke: 1.3pt + rgb("37474F"))
      line((-1.8,0),(1.8,0), stroke: 1.3pt + rgb("37474F"))
      // Nhãn vùng
      content((-0.9,0.6), text(size: 9pt, weight:"bold")[A])
      content((0.9,0.6), text(size: 9pt, weight:"bold")[B])
      content((-0.9,-0.6), text(size: 9pt, weight:"bold")[C])
      content((0.9,-0.6), text(size: 9pt, weight:"bold")[D])
      // Đồ thị đối ngẫu
      let dA = (-0.9,0.6); let dB = (0.9,0.6)
      let dC = (-0.9,-0.6); let dD = (0.9,-0.6)
      for (p,q) in ((dA,dB),(dB,dD),(dD,dC),(dC,dA),(dA,dD),(dB,dC)) {
        line(p, q, stroke: (dash: "dashed", paint: rgb("BF360C"), thickness: 1.1pt))
      }
      for (p, l) in ((dA,"A"),(dB,"B"),(dC,"C"),(dD,"D")) {
        circle(p, radius: 0.2, fill: rgb("FFF9C4"), stroke: 1.2pt + rgb("BF360C"))
      }
      content((0,-1.8), text(size: 8pt, fill: rgb("BF360C"), weight: "bold")[Đối ngẫu (nét đứt)])
    })
  ]
], [
  *Quy trình:*
  1. Mỗi *vùng* → 1 đỉnh đồ thị đối ngẫu.
  2. Hai vùng có *chung biên* → nối cạnh.
  3. Tính $P(G_"dual", k)$ bằng công thức phù hợp.

  *Ví dụ:* Hình chữ nhật chia 4 ô (2×2) — đồ thị đối ngẫu là $K_4$ (4 đỉnh, mọi cặp nối).

  $P(K_4, 4) = 4 times 3 times 2 times 1 = 24$

  *Điều này giải thích:* Bảng 2×2 có 84 cách tô (bằng Bộ QT Lưới), nhưng nếu xét "4 góc đều khác nhau" thì chỉ còn 24!
])

#v(0.5em)

// ─────────────────────────────────────
*Bảng tóm tắt — Chọn vũ khí nào cho hình dạng nào:*

#table(
  columns: (1.6fr, 1fr, 1.5fr, 1.5fr),
  inset: 7pt,
  align: (left, center, left, left),
  table.header([*Nhận dạng đồ thị*], [*Loại*], [*Vũ khí dùng*], [*Ghi chú*]),
  [Hàng thẳng, nhánh cây, không vòng], [$P_n$/$T_n$], [Súng Lục: $k(k-1)^{n-1}$], [Mọi cây đều dùng được],
  [Khép kín thành vòng], [$C_n$], [Vòng: $(k-1)^n + (-1)^n(k-1)$], [Đại Bác 3],
  [1 tâm + $n$ cánh tự do], [$K_{1,n}$], [Sao: $k(k-1)^n$], [Cánh không nối nhau],
  [1 tâm + vòng $n$ đỉnh], [$W_n$], [Bánh xe: $k dot P(C_n, k-1)$], [2 bước: tâm + vành],
  [Mọi cặp đỉnh đều nối], [$K_n$], [Đầy đủ: $k(k-1) dots.c (k-n+1)$], [Cần $k >= n$ màu],
  [Lưới ô vuông khuyết], [Grid], [Đại Bác Vạn Năng (Quét Cột)], [Chương 1–9 của tài liệu này],
  [Hình vẽ vùng/bản đồ], [Planar], [Đồ thị đối ngẫu → áp công thức], [Vùng = đỉnh],
  [Đồ thị tuỳ ý bất kỳ], [$G$], [Xoá-Chập: $P(G \\ e) - P(G/e)$], [Vạn năng, đệ quy],
)

#v(0.8em)
#pagebreak()

== 11. Tuyển Tập 12 Ví Dụ Thực Chiến Cho 6 Loại Đồ Thị Phi Lưới

Để giúp học sinh làm chủ hoàn toàn các bài toán tô màu đồ thị phi lưới mà không cảm thấy nặng nề lý thuyết, dưới đây là tuyển tập 12 ví dụ thực chiến được giải chi tiết, chia đều cho 6 loại mô hình đồ thị phi lưới phổ biến nhất.

=== 11.1 — Nhóm 1: Đường Thẳng & Đồ Thị Cây ($P_n$ / $T_n$)

*Đặc trưng:* Đồ thị không có vòng khép kín. Công thức chung cho đồ thị cây $n$ đỉnh là: $P(G, k) = k(k-1)^(n-1)$.

#cannon-box("Ví dụ 24 — Chuỗi 6 hạt ngọc xếp hàng thẳng (k=4 màu)", [
  *Đề bài:* Có 6 hạt ngọc được xếp thành một hàng thẳng. Người ta muốn tô màu các hạt ngọc bằng 4 màu sao cho hai hạt cạnh nhau luôn khác màu nhau. Tính số cách tô màu.

  *Giải:*
  Đây là đồ thị đường thẳng $P_6$ gồm 6 đỉnh. Áp dụng công thức đường thẳng với $n=6, k=4$:
  1. Hạt thứ nhất: Có $k = 4$ cách chọn màu.
  2. Mỗi hạt trong 5 hạt tiếp theo chỉ kề với đúng 1 hạt đã tô màu ở trước nó, nên luôn có $k-1 = 3$ cách chọn màu.
  
  $$N = k(k-1)^(n-1) = 4 times 3^5 = 4 times 243 = bold{972} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 25 — Đồ thị cây gia phả phân nhánh 7 nút (k=5 màu)", [
  *Đề bài:* Cho một sơ đồ cây gồm 7 nút (1 nút gốc chia làm 2 nhánh, mỗi nhánh lại chia tiếp làm các nút con). Có 5 màu để tô các nút này sao cho hai nút nối với nhau luôn khác màu nhau. Tính số cách tô.

  *Giải:*
  Vì sơ đồ là đồ thị cây không chứa chu trình ($T_7$), ta áp dụng công thức cho cây với $n=7, k=5$:
  1. Nút gốc: Có $5$ cách chọn màu.
  2. Mỗi nút con trong 6 nút tiếp theo luôn chỉ liên kết trực tiếp với đúng 1 nút cha ở phía trên nó, do đó luôn có $k-1 = 4$ cách chọn màu cho mỗi nút con.
  
  $$N = k(k-1)^(n-1) = 5 times 4^6 = 5 times 4096 = bold{20.480} " cách."$$
])

#v(0.8em)
#pagebreak()

=== 11.2 — Nhóm 2: Đồ Thị Vòng Tròn Khép Kín ($C_n$)

*Đặc trưng:* Các đỉnh nối tiếp khép kín thành vòng tròn. Công thức cho vòng tròn $n$ đỉnh là: $P(C_n, k) = (k-1)^n + (-1)^n(k-1)$.

#cannon-box("Ví dụ 26 — Tô màu ngũ giác đều 5 đỉnh (k=3 màu)", [
  *Đề bài:* Người ta muốn tô màu 5 đỉnh của một ngũ giác đều bằng 3 màu sao cho hai đỉnh kề nhau luôn khác màu nhau. Tính số cách tô.

  *Giải:*
  Đây là đồ thị vòng tròn $C_5$ gồm 5 đỉnh. Áp dụng công thức vòng tròn với $n=5, k=3$:
  $$P(C_5, 3) = (3-1)^5 + (-1)^5 times (3-1)$$
  $$P(C_5, 3) = 2^5 - 2 = 32 - 2 = bold{30} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 27 — Tô màu lục giác đều 6 đỉnh (k=4 màu)", [
  *Đề bài:* Có bao nhiêu cách tô màu các đỉnh của một lục giác đều bằng 4 màu sao cho hai đỉnh chung cạnh luôn khác màu nhau?

  *Giải:*
  Đây là đồ thị vòng tròn $C_6$ gồm 6 đỉnh. Áp dụng công thức vòng tròn với $n=6, k=4$:
  $$P(C_6, 4) = (4-1)^6 + (-1)^6 times (4-1)$$
  $$P(C_6, 4) = 3^6 + 3 = 729 + 3 = bold{732} " cách."$$
])

#v(0.8em)
#pagebreak()

=== 11.3 — Nhóm 3: Đồ Thị Hình Sao ($K_{1,n}$)

*Đặc trưng:* Có 1 nút tâm nối với tất cả các nút cánh; các cánh độc lập không nối với nhau. Công thức: $P(K_{1,n}, k) = k(k-1)^n$.

#cannon-box("Ví dụ 28 — Bông hoa 5 cánh chạm nhị ở tâm (k=4 màu)", [
  *Đề bài:* Một bông hoa đồ họa gồm 1 nhị ở tâm và 5 cánh hoa xung quanh. Biết rằng các cánh hoa không chạm nhau mà chỉ chạm nhị ở tâm. Có 4 màu để tô các phần sao cho hai phần chạm nhau phải khác màu nhau. Tính số cách tô.

  *Giải:*
  Đây là đồ thị hình sao gồm 1 tâm và 5 cánh ($K_{1,5}$). Áp dụng công thức hình sao với $n=5, k=4$:
  1. Tô nhị hoa ở tâm: Có $k = 4$ cách chọn màu.
  2. Mỗi cánh hoa trong 5 cánh hoa xung quanh chỉ kề với duy nhất nhị hoa, nên luôn có $k-1 = 3$ cách chọn màu độc lập.
  
  $$N = k(k-1)^n = 4 times 3^5 = 4 times 243 = bold{972} " cách."$$
])

#v(0.5em)

#cannon-box("Ví dụ 29 — Hệ thống mạng sao 1 trạm chủ và 8 máy vệ tinh (k=5 màu)", [
  *Đề bài:* Một mạng máy tính gồm 1 máy chủ kết nối trực tiếp đến 8 máy vệ tinh xung quanh (các máy vệ tinh không kết nối với nhau). Người ta muốn phân bổ 5 kênh tần số cho các máy sao cho hai máy kết nối trực tiếp phải khác tần số. Tính số cách phân bổ.

  *Giải:*
  Đây là đồ thị hình sao $K_{1,8}$ với $k=5$.
  - Trạm chủ (tâm): Có 5 cách chọn tần số.
  - Mỗi trạm vệ tinh (cánh): Có $5-1=4$ cách chọn tần số (chỉ cần khác trạm chủ).
  Tổng số cách: $5 times 4^8 = 327.680$ cách.
])

#v(0.8em)
#pagebreak()

== 12. Bí Quyết Giải Gọn Lưới Cao Tầng ($3 times N$, $4 times N$) — Sơ Đồ Trạng Thái

Khi chiều cao cột $h >= 3$, bài toán đếm số cách tô màu bỗng trở nên phức tạp hơn rất nhiều. Các em không thể lấy số lượng cột đầu nhân liên tiếp với một "hệ số không đổi" như ở lưới 2 hàng nữa. Tại sao vậy? Hãy cùng xem "Bẫy Tư Duy" dưới đây!

=== 12.1. "Bẫy Tư Duy": Tại sao lưới cao lại nguy hiểm?

Tưởng tượng cột trước có 3 ô (Trên, Giữa, Dưới). Ô Trên và ô Dưới không hề chạm nhau, vì vậy chúng có thể vô tình *CÙNG MÀU*, hoặc *KHÁC MÀU*.
Điều này ảnh hưởng trực tiếp đến Cột tiếp theo:

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Trường hợp Dễ Thở
    rect((0, 2), (1, 3), fill: rgb("FFCDD2"), stroke: 1pt)
    rect((0, 1), (1, 2), fill: rgb("E3F2FD"), stroke: 1pt)
    rect((0, 0), (1, 1), fill: rgb("FFCDD2"), stroke: 1pt)
    content((0.5, 2.5), text(size: 8pt)[Đỏ])
    content((0.5, 1.5), text(size: 8pt)[Xanh])
    content((0.5, 0.5), text(size: 8pt)[Đỏ])
    
    rect((1.2, 0), (2.2, 3), fill: white, stroke: (dash: "dashed"))
    content((1.7, 1.5), text(size: 8pt)[?])
    
    content((1.1, -0.6), text(size: 9pt, weight: "bold", fill: rgb("1B5E20"))[Trường hợp "Dễ Thở"])
    content((1.1, -1.2), text(size: 8pt)[Ô trên và dưới cùng là Đỏ.])
    content((1.1, -1.7), text(size: 8pt)[$=>$ Cột sau chỉ phải né 1 "kẻ thù" Đỏ.])
    
    // Trường hợp Khó Thở
    rect((5, 2), (6, 3), fill: rgb("FFCDD2"), stroke: 1pt)
    rect((5, 1), (6, 2), fill: rgb("E3F2FD"), stroke: 1pt)
    rect((5, 0), (6, 1), fill: rgb("FFF9C4"), stroke: 1pt)
    content((5.5, 2.5), text(size: 8pt)[Đỏ])
    content((5.5, 1.5), text(size: 8pt)[Xanh])
    content((5.5, 0.5), text(size: 8pt)[Vàng])
    
    rect((6.2, 0), (7.2, 3), fill: white, stroke: (dash: "dashed"))
    content((6.7, 1.5), text(size: 8pt)[?])
    
    content((6.1, -0.6), text(size: 9pt, weight: "bold", fill: rgb("B71C1C"))[Trường hợp "Khó Thở"])
    content((6.1, -1.2), text(size: 8pt)[Ô trên và dưới khác màu (Đỏ và Vàng).])
    content((6.1, -1.7), text(size: 8pt)[$=>$ Cột sau phải né tới 2 "kẻ thù" (vừa Đỏ vừa Vàng).])
  })
]

Chính vì Cột sau lúc thì "Dễ Thở", lúc thì "Khó Thở" nên nó sẽ sinh ra số cách chọn màu khác nhau! Ta bắt buộc phải *chẻ đôi* bài toán thành 2 trạng thái.

=== 12.2. Tuyệt Chiêu "Chẻ Đôi Trạng Thái" (Cho lưới $3 times N$)

Thay vì đếm chung chung, ta sẽ chia mọi cột 3 ô thành 2 nhóm:
- *Nhóm A (Dễ Thở):* 2 ô ngoài cùng *GIỐNG NHAU*. 
- *Nhóm B (Khó Thở):* 2 ô ngoài cùng *KHÁC NHAU*.

*Số cách khởi tạo ở cột đầu tiên (Cột 1):*
- Để tạo ra một cột Dễ Thở (A), ta chọn ô Trên ($k$ cách), ô Giữa ($k-1$ cách), và ô Dưới bắt buộc phải giống ô Trên ($1$ cách). Vậy số lượng Cột 1 nhóm A là: $A_1 = k(k-1)$.
- Để tạo ra một cột Khó Thở (B), ta chọn ô Trên ($k$ cách), ô Giữa ($k-1$ cách), và ô Dưới phải khác cả ô Trên và ô Giữa ($k-2$ cách). Vậy số lượng Cột 1 nhóm B là: $B_1 = k(k-1)(k-2)$.

=== 12.3. Sơ Đồ Đẻ Nhánh (Hệ Số Chuyển Tiếp)

Khi xây sang Cột 2, mỗi cột nhóm A của Cột 1 sẽ "đẻ" ra một số lượng cột nhóm A và B mới. Mỗi cột nhóm B cũ cũng vậy. Ta gọi đây là *Sơ Đồ Đẻ Nhánh*:

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((-2, 1), radius: 0.5, fill: rgb("C8E6C9"), stroke: 1.5pt + rgb("2E7D32"))
    content((-2, 1), text(weight: "bold")[A cũ])
    
    circle((-2, -1), radius: 0.5, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("C62828"))
    content((-2, -1), text(weight: "bold")[B cũ])
    
    circle((2, 1), radius: 0.5, fill: rgb("C8E6C9"), stroke: 1.5pt + rgb("2E7D32"))
    content((2, 1), text(weight: "bold")[A mới])
    
    circle((2, -1), radius: 0.5, fill: rgb("FFCDD2"), stroke: 1.5pt + rgb("C62828"))
    content((2, -1), text(weight: "bold")[B mới])
    
    // Mũi tên từ A cũ
    line((-1.5, 1), (1.5, 1), mark: (end: ">"), stroke: 1.2pt)
    content((0, 1.3), text(size: 9pt)[$M_("AA")$])
    
    line((-1.6, 0.7), (1.6, -0.7), mark: (end: ">"), stroke: 1.2pt)
    content((-0.8, -0.2), text(size: 9pt)[$M_("AB")$])
    
    // Mũi tên từ B cũ
    line((-1.6, -0.7), (1.6, 0.7), mark: (end: ">"), stroke: 1.2pt)
    content((0.8, -0.2), text(size: 9pt)[$M_("BA")$])
    
    line((-1.5, -1), (1.5, -1), mark: (end: ">"), stroke: 1.2pt)
    content((0, -1.3), text(size: 9pt)[$M_("BB")$])
  })
]

*Phương trình tính số lượng cột mới:*
$ A_("mới") = M_("AA") times A_("cũ") + M_("BA") times B_("cũ") $
$ B_("mới") = M_("AB") times A_("cũ") + M_("BB") times B_("cũ") $

*Bảng Tra Cứu Thần Chú (Cho phòng thi THPT QG)*
Đề thi thường chỉ ra $k=3, 4$ hoặc $k=5$ màu. Các em chỉ cần thuộc (hoặc ghi ra nháp) bảng hệ số đẻ nhánh sau đây (được nội suy tự động từ công thức) để lắp vào bấm máy tính, KHÔNG CẦN phải chứng minh lại công thức cực nhọc:

#align(center)[
#table(
  columns: (1.5fr, 1.2fr, 1.2fr, 1.2fr, 1.2fr),
  inset: 7pt,
  align: (center + horizon),
  [*Số Màu*], [*Từ $A_("cũ")$ đến A*], [*Từ $B_("cũ")$ đến A*], [*Từ $A_("cũ")$ đến B*], [*Từ $B_("cũ")$ đến B*],
  ..for k in (2,3, 4, 5) {
    let M_AA = calc.pow(k, 2) - 3*k + 3
    let M_BA = calc.pow(k, 2) - 4*k + 5
    let M_AB = (k - 2) * (calc.pow(k, 2) - 4*k + 5)
    let M_BB = calc.pow(k, 3) - 6*calc.pow(k, 2) + 14*k - 13
    (
      [*$k = #k$ màu*],
      [$M_("AA") = #M_AA$],
      [$M_("BA") = #M_BA$],
      [$M_("AB") = #M_AB$],
      [$M_("BB") = #M_BB$],
    )
  }
)
]

#note-box(title: "📖 Dành Cho Học Sinh Lấy Điểm 10 (Nguồn gốc công thức)", [
  Nếu đề thi cho $k=6$ hoặc bắt chứng minh tổng quát bằng chữ, các em hãy dùng 4 công thức đa thức sau để tự bấm ra hệ số:
  - $M_("AA") = k^2 - 3k + 3$
  - $M_("BA") = k^2 - 4k + 5$
  - $M_("AB") = (k-2)(k^2 - 4k + 5)$
  - $M_("BB") = k^3 - 6k^2 + 14k - 13$
])

=== 12.4. Kỹ Thuật Lập Bảng Trạng Thái (Tính Toán Cột Liên Tiếp)

Để giải quyết bài toán đếm số cách tô màu trên lưới một cách có hệ thống và tránh nhầm lẫn, phương pháp hiệu quả nhất là *Lập Bảng Chuyển Trạng Thái*.
Ta xét 2 trạng thái phân loại của một cột (giả sử chiều cao $h=3$):
- *Trạng thái A (Đồng màu):* Ô trên cùng và ô dưới cùng cùng màu.
- *Trạng thái B (Khác màu):* Ô trên cùng và ô dưới cùng khác màu.

Quy trình tính toán gồm việc đếm số cách khởi tạo ở Cột 1, sau đó sử dụng ma trận hệ số để tịnh tiến dần sang các cột tiếp theo.

#note-box(title: "🚨 BẪY TƯ DUY: Tại sao không thể nhân phẳng $36 times X times Y times Z$?", [
  Rất nhiều học sinh thắc mắc: *"Cột 1 có 36 cách tô. Vậy Cột 2 có $X$ cách, Cột 3 có $Y$ cách. Đáp số cứ lấy $36 times X times Y times Z$ là xong, vẽ bảng A/B làm gì cho mệt?"*
  
  Sự thật phũ phàng của lưới 2D là: *Số cách tô Cột 2 không hề cố định, nó biến thiên tùy thuộc vào việc bạn vừa tô Cột 1 như thế nào!*
  - Nếu Cột 1 của bạn thuộc *Trạng thái A (Đồng màu)*, Cột 2 sẽ có $7+10 = 17$ cách tô.
  - Nếu Cột 1 của bạn thuộc *Trạng thái B (Khác màu)*, Cột 2 chỉ có $5+11 = 16$ cách tô!
  
  Vì $17 != 16$, không tồn tại một con số $X$ đại diện chung nào cả! Đó là lý do toán học ép buộc ta phải chia 36 cách của Cột 1 thành hai "phe": 12 cách loại A (để nhân với nhóm hệ số 17) và 24 cách loại B (để nhân với nhóm hệ số 16). Việc kẻ bảng Trạng thái A/B chính là chìa khóa duy nhất để quản lý sự "không đồng đều" này!
])

#v(0.5em)
#cannon-box("Ví dụ 30 — Lưới Nguyên Vẹn", [
  *Đề bài:* Cho lưới $3 times 4$, dùng 4 màu ($k=4$). Các ô chung cạnh khác màu. Tính tổng số cách tô.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(4) {
        rect((i*1.5, 0), (i*1.5 + 1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
        line((i*1.5, 1), (i*1.5 + 1, 1), stroke: 1pt)
        line((i*1.5, 2), (i*1.5 + 1, 2), stroke: 1pt)
        content((i*1.5 + 0.5, -0.5), [Cột #(i+1)])
      }
      for i in range(3) {
        line((i*1.5 + 1, 1.5), (i*1.5 + 1.5, 1.5), mark: (end: ">"))
      }
    })
  ]
  
  *Giải:* 
  - *Bước 1: Khởi tạo Cột 1.* Tổng cộng có $4 times 3 times 3 = 36$ cách tô. Phân loại cấu hình:
    - Trạng thái A: Chọn ô Trên (4 cách), ô Dưới cùng màu (1 cách), ô Giữa né màu đó (3 cách) $=> A_1 = 4 times 1 times 3 = 12$ cách.
    - Trạng thái B: Chọn ô Trên (4 cách), ô Dưới khác màu (3 cách), ô Giữa né 2 màu (2 cách) $=> B_1 = 4 times 3 times 2 = 24$ cách.
  
  - *Bước 2: Lập bảng tịnh tiến trạng thái.* 
    Ma trận hệ số cho lưới nguyên vẹn là: $M_("AA")=7, M_("BA")=5, M_("AB")=10, M_("BB")=11$.
    Công thức truy hồi: $A_n = 7 A_{n-1} + 5 B_{n-1}$ và $B_n = 10 A_{n-1} + 11 B_{n-1}$.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2*], [*Cột 3*], [*Cột 4*],
    [*Trạng thái A (Đồng màu)*], [*12*], [204], [3.348], [29.916],
    [*Trạng thái B (Khác màu)*], [*24*], [384], [6.264], [56.160],
  )
  ]
  _Giải thích ví dụ: $A_2 = 7(12) + 5(24) = 204$._
  
  *Kết quả:* Tổng số cách tô toàn lưới = $A_4 + B_4 = 29.916 + 56.160 = bold{86.076}$ cách.
])

#v(0.5em)
=== 12.5. Phân Tích Lưới Bất Quy Tắc

Đối với các lưới bị khuyết ô, ma trận hệ số tịnh tiến sẽ thay đổi tại chính cột bị khuyết.

#cannon-box("Ví dụ 31 — Lưới Khuyết Lỗ Giữa", [
  *Đề bài:* Lưới $3 times 4$, dùng 4 màu. Ô trung tâm ở Cột 2 bị khoét.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Col 1
      rect((0, 0), (1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
      line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
      // Col 2
      rect((1.5, 2), (2.5, 3), stroke: 1.5pt, fill: rgb("FFEBEE"))
      rect((1.5, 0), (2.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((2, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      // Col 3
      rect((3, 0), (4, 3), stroke: 1.5pt, fill: rgb("E8F5E9"))
      line((3, 1), (4, 1), stroke: 1pt); line((3, 2), (4, 2), stroke: 1pt)
      // Col 4
      rect((4.5, 0), (5.5, 3), stroke: 1.5pt, fill: rgb("FFF8E1"))
      line((4.5, 1), (5.5, 1), stroke: 1pt); line((4.5, 2), (5.5, 2), stroke: 1pt)
      
      content((0.5, -0.5), [Cột 1]); content((2, -0.5), [Cột 2])
      content((3.5, -0.5), [Cột 3]); content((5.5, -0.5), [Cột 4])
      line((1, 1.5), (1.5, 1.5), mark: (end: ">"))
      line((2.5, 1.5), (3, 1.5), mark: (end: ">"))
      line((4, 1.5), (4.5, 1.5), mark: (end: ">"))
    })
  ]
  
  *Giải:* 
  Tại cột 2, do mất đi ô giữa, ô Trên và Dưới không còn ràng buộc nội bộ. Số cách chọn cho ô Trên và Dưới (đều phải né Cột 1) là $3 times 3 = 9$ cách.
  Ma trận hệ số chuyển từ Cột 1 sang Cột 2 thay đổi thành: $M_("AA")=3, M_("BA")=2, M_("AB")=6, M_("BB")=7$.
  Từ Cột 2 sang Cột 3, lưới trở lại nguyên vẹn nên dùng hệ số chuẩn.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1.2fr, 1.2fr, 1.2fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2 (Khuyết)*], [*Cột 3 (Chuẩn)*], [*Cột 4 (Chuẩn)*],
    [*Trạng thái A (Đồng màu)*], [*12*], [84], [1.788], [29.916],
    [*Trạng thái B (Khác màu)*], [*24*], [240], [3.480], [56.160],
  )
  ]
  _Giải thích Cột 2: $A_2 = 3(12) + 2(24) = 84$. $B_2 = 6(12) + 7(24) = 240$._
  
  *Kết quả:* Tổng số cách = $29.916 + 56.160 = bold{86.076}$ cách.
])

#v(0.5em)
#cannon-box("Ví dụ 32 — Lưới Khuyết Ở Cột Cuối", [
  *Đề bài:* Lưới $3 times 4$, dùng 4 màu. Ô trung tâm ở Cột 4 bị khoét.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      for i in range(3) {
        rect((i*1.5, 0), (i*1.5 + 1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
        line((i*1.5, 1), (i*1.5 + 1, 1), stroke: 1pt)
        line((i*1.5, 2), (i*1.5 + 1, 2), stroke: 1pt)
        content((i*1.5 + 0.5, -0.5), [Cột #(i+1)])
        line((i*1.5 + 1, 1.5), (i*1.5 + 1.5, 1.5), mark: (end: ">"))
      }
      // Col 4 (khuyết giữa)
      rect((4.5, 2), (5.5, 3), stroke: 1.5pt, fill: rgb("FFEBEE"))
      rect((4.5, 0), (5.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((5, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      content((5, -0.5), [Cột 4])
    })
  ]
  
  *Giải:* 
  Vì sự khuyết thiếu xảy ra ở cột tận cùng, ta không cần phân tách trạng thái phân nhánh cho các cột sau. Bảng tính toán được thực hiện như lưới nguyên vẹn đến hết Cột 3.
  
  #align(center)[
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: (center + horizon),
    [*Trạng Thái*], [*Cột 1*], [*Cột 2*], [*Cột 3*],
    [*Trạng thái A (Đồng màu)*], [*12*], [204], [*3.348*],
    [*Trạng thái B (Khác màu)*], [*24*], [384], [*6.264*],
  )
  ]
  Tổng số cách tô từ Cột 1 đến Cột 3 là: $3.348 + 6.264 = 9.612$ cách.
  Tại Cột 4, hai ô Trên và Dưới độc lập, mỗi ô có 3 cách chọn (né Cột 3). Số cách tô riêng Cột 4 là $3 times 3 = 9$.
  
  *Kết quả:* Tổng số cách toàn lưới = $9.612 times 9 = bold{86.508}$ cách.
])

#v(0.5em)
#cannon-box("Ví dụ 33 — Lưới Hình Chữ U", [
  *Đề bài:* Lưới $3 times 3$, dùng 4 màu. Hai ô ở vị trí Trên và Giữa của Cột 2 bị khoét thủng.
  
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Col 1
      rect((0, 0), (1, 3), stroke: 1.5pt, fill: rgb("E3F2FD"))
      line((0, 1), (1, 1), stroke: 1pt); line((0, 2), (1, 2), stroke: 1pt)
      // Col 2 (only bottom)
      rect((1.5, 0), (2.5, 1), stroke: 1.5pt, fill: rgb("FFEBEE"))
      content((2, 1.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      content((2, 2.5), text(fill: red, weight: "bold", size: 1.5em)[$times$])
      // Col 3
      rect((3, 0), (4, 3), stroke: 1.5pt, fill: rgb("E8F5E9"))
      line((3, 1), (4, 1), stroke: 1pt); line((3, 2), (4, 2), stroke: 1pt)
      
      content((0.5, -0.5), [Cột 1]); content((2, -0.5), [Cột 2]); content((3.5, -0.5), [Cột 3])
      line((1, 0.5), (1.5, 0.5), mark: (end: ">"))
      line((2.5, 0.5), (3, 0.5), mark: (end: ">"))
      
      // Khung đứt nét chỉ sự độc lập
      line((2.5, 1.5), (3, 1.5), stroke: (dash: "dashed", paint: gray), mark: (end: ">", paint: gray))
      line((2.5, 2.5), (3, 2.5), stroke: (dash: "dashed", paint: gray), mark: (end: ">", paint: gray))
      content((1.2, 3.5), text(fill: gray, size: 0.9em)[Tự do (Không có ràng buộc ngang)])
      bezier((2.8, 3.5), (2.8, 2.5), (2, 3.5), mark: (end: ">", paint: gray), stroke: gray)
    })
  ]
  
  *Giải:* 
  Lưới hình chữ U minh hoạ sự thoái hóa của ma trận trạng thái:
  - Cột 1 nguyên vẹn: Có $4 times 3 times 3 = 36$ cách tô.
  - Cột 2 chỉ còn ô Dưới: Ràng buộc duy nhất là né ô Dưới của Cột 1 $=>$ Cột 2 có 3 cách tô độc lập. Vì không có ô Trên, khái niệm "Trạng thái A/B" bị triệt tiêu hoàn toàn.
  - Cột 3 nguyên vẹn: Do Cột 2 khuyết hai ô trên, Cột 3 chỉ bị ràng buộc ở vị trí ô Dưới. Số cách tô ô Dưới là 3. Các ô Giữa và Trên của Cột 3 chỉ phải thoả mãn nội bộ (mỗi ô 3 cách). Tổng số cách của Cột 3 là $3 times 3 times 3 = 27$ cách.
  
  *Kết luận:* Tính độc lập giữa các khối được thiết lập. Số cách tô được tính bằng tích đơn giản:
  Tổng số cách = Cột 1 $times$ Cột 2 $times$ Cột 3 = $36 times 3 times 27 = bold{2.916}$ cách.
])

#pagebreak()
= Đề Luyện Tổng Hợp

#align(center)[
  #block(
    fill: rgb("F8FAFC"),
    stroke: 1pt + c-navy,
    radius: 8pt,
    inset: (x: 20pt, y: 15pt),
    width: 100%,
  )[
    #text(fill: c-navy, weight: "bold", size: 12pt)[
      📋 Bảng Phân Loại Đề Thực Chiến 15 Bài Tập Điển Hình
    ]
    #v(0.8em)
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 12pt,
      row-gutter: 8pt,
      align: (center, left, center),
      box(fill: rgb("DCFCE7"), stroke: 1pt + c-teal, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-teal, weight: "bold")[★ Cơ Bản]
      ],
      [Nguyên lý cộng nhân, hoán vị chỉnh hợp cơ bản, vách ngăn đơn giản],
      [Bài 1–5],

      box(fill: rgb("FEF9C3"), stroke: 1pt + c-gold, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-gold, weight: "bold")[★★ Khá]
      ],
      [Gộp khối khoảng trống, hoán vị lặp, đếm hình học, chữ số chia hết],
      [Bài 6–10],

      box(fill: rgb("FEE2E2"), stroke: 1pt + c-crimson, radius: 4pt, inset: (x:6pt, y:3pt))[
        #text(fill: c-crimson, weight: "bold")[★★★ Khó]
      ],
      [Hàm sinh Euler, phân hoạch Stirling, song ánh Catalan, truy hồi bậc cao, Newton],
      [Bài 11–15],
    )
  ]
]

#v(1em)

#tln(
  tags: ("Dễ",),
  [
    Có bao nhiêu số tự nhiên có 5 chữ số đôi một khác nhau được lập từ các chữ số của tập hợp $\{1, 2, 3, 4, 5, 6, 7\}$ sao cho số đó chia hết cho 5?
  ],
  [360],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi số cần lập là $overline(a_1 a_2 a_3 a_4 a_5)$ với các chữ số khác nhau thuộc tập $\{1, ..., 7\}$.
      - Chữ số cuối $a_5$ bắt buộc phải bằng 5 (có đúng 1 cách chọn).
      - Bốn chữ số còn lại $a_1, a_2, a_3, a_4$ được chọn và xếp thứ tự từ tập 6 chữ số còn lại $\{1, 2, 3, 4, 6, 7\}$: có $A_6^4 = 360$ cách.
      Số lượng số thỏa mãn là: $1 dot 360 = 360$ số.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Cố định chữ số cuối $a_5 = 5$ (1 cách chọn).
      - Đối với 4 vị trí còn lại, ta cần chọn và sắp xếp 4 chữ số từ tập hợp 6 chữ số $\{1, 2, 3, 4, 6, 7\}$.
      - Hàm sinh lũy thừa (EGF) cho việc chọn và sắp xếp $k$ chữ số từ tập 6 phần tử là:
        $ G(x) = (1 + x)^6 = sum_(k=0)^6 C_6^k k! frac(x^k, k!) = sum_(k=0)^6 A_6^k frac(x^k, k!) $
      - Số cách chọn và sắp xếp 4 chữ số là hệ số của $frac(x^4, 4!)$ trong $G(x)$, tức là:
        $ 4! [x^4] G(x) = A_6^4 = 360 " cách". $
      - Tổng số cách lập là $360 dot 1 = 360$ số.
    ]
  ]
)

#tln(
  tags: ("Dễ",),
  [
    Tìm số nghiệm nguyên không âm của phương trình $x + y + z + w = 17$ thỏa mãn điều kiện $x >= 1$, $y >= 2$, $z >= 3$, $w >= 0$.
  ],
  [364],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Thực hiện đổi biến đưa về dạng không âm tự do:
      - Đặt $x' = x - 1 >= 0$
      - Đặt $y' = y - 2 >= 0$
      - Đặt $z' = z - 3 >= 0$
      - Đặt $w' = w >= 0$
      Thay vào phương trình ta được:
      $
        (x' + 1) + (y' + 2) + (z' + 3) + w' = 17 \
        rightarrow x' + y' + z' + w' = 11
      $
      Áp dụng công thức vách ngăn cơ bản với $n=11$ và $k=4$:
      $ N = C_(11+4-1)^(4-1) = C_(14)^3 = frac(14 dot 13 dot 12, 3 dot 2 dot 1) = 364 " nghiệm". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Mỗi biến đóng góp một hàm sinh đại diện cho tập giá trị hợp lệ của nó:
        - Với $x >= 1$: $f_x(t) = t + t^2 + t^3 + dots = frac(t, 1-t)$
        - Với $y >= 2$: $f_y(t) = t^2 + t^3 + t^4 + dots = frac(t^2, 1-t)$
        - Với $z >= 3$: $f_z(t) = t^3 + t^4 + t^5 + dots = frac(t^3, 1-t)$
        - Với $w >= 0$: $f_w(t) = 1 + t + t^2 + dots = frac(1, 1-t)$
      - Hàm sinh tổng quát cho phương trình là:
        $ G(t) = f_x(t) f_y(t) f_z(t) f_w(t) = frac(t^6, (1-t)^4) $
      - Số nghiệm nguyên không âm của phương trình là hệ số của $t^(17)$ trong $G(t)$, tức là hệ số của $t^(11)$ trong $(1-t)^(-4)$:
        $ [t^(17)] G(t) = [t^(11)] (1-t)^(-4) = C_(11+4-1)^(11) = C_(14)^3 = 364 " nghiệm". $
    ]
  ]
)

#tln(
  tags: ("Dễ",),
  [
    Từ 12 học sinh ưu tú, người ta muốn chia thành 4 nhóm học tập không tên gọi (không phân biệt), mỗi nhóm gồm đúng 3 học sinh. Hỏi có bao nhiêu cách chia?
  ],
  [15400],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      - Bước 1: Chia 12 học sinh vào 4 nhóm phân biệt (nhóm 1, nhóm 2, nhóm 3, nhóm 4) mỗi nhóm 3 học sinh:
        - Nhóm 1: Chọn 3 học sinh từ 12 học sinh: $C_(12)^3$ cách.
        - Nhóm 2: Chọn 3 học sinh từ 9 học sinh còn lại: $C_9^3$ cách.
        - Nhóm 3: Chọn 3 học sinh từ 6 học sinh còn lại: $C_6^3$ cách.
        - Nhóm 4: Chọn 3 học sinh từ 3 học sinh còn lại: $C_3^3$ cách.
        Số cách chia vào nhóm phân biệt là: $C_(12)^3 dot C_9^3 dot C_6^3 dot C_3^3 = 220 dot 84 dot 20 dot 1 = 369600$.
      - Bước 2: Vì 4 nhóm có vai trò hoàn toàn như nhau và không phân biệt tên gọi, ta phải khử lặp thứ tự bằng cách chia cho hoán vị của 4 nhóm là $4! = 24$.
      Số cách chia nhóm không phân biệt là:
      $ N = frac(369600, 24) = 15400 " cách". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Đây là bài toán phân hoạch tập hợp 12 phần tử phân biệt thành 4 khối có kích thước bằng 3, không phân biệt thứ tự giữa các khối.
      - Hàm sinh lũy thừa (EGF) cho mỗi khối gồm đúng 3 học sinh là $g(x) = frac(x^3, 3!)$.
      - Do 4 khối là giống nhau (không phân biệt tên gọi), ta dùng hàm sinh cấu trúc phân hoạch với $k=4$ khối:
        $ G(x) = frac(1, 4!) [g(x)]^4 = frac(1, 24) (frac(x^3, 3!))^4 = frac(x^(12), 24 dot 6^4) $
      - Số cách chia là hệ số của $frac(x^(12), 12!)$ trong EGF $G(x)$:
        $ 12! [x^(12)] G(x) = 12! dot frac(1, 24 dot 6^4) = 15400 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu cách xếp 4 học sinh nam và 4 học sinh nữ thành một hàng ngang sao cho không có hai học sinh cùng giới tính đứng kề nhau (xen kẽ)?
  ],
  [1152],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Để nam và nữ đứng xen kẽ nhau hoàn toàn trong hàng gồm 8 người, chỉ có hai cấu trúc hàng dọc khả dĩ:
      - *Cấu trúc 1:* `Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ`
        - Sắp xếp vị trí 4 nam vào các vị trí nam: $4! = 24$ cách.
        - Sắp xếp vị trí 4 nữ vào các vị trí nữ: $4! = 24$ cách.
        Số cách xếp là: $24 dot 24 = 576$ cách.
      - *Cấu trúc 2:* `Nữ - Nam - Nữ - Nam - Nữ - Nam - Nữ - Nam`
        - Tương tự như trên, số cách xếp là: $24 dot 24 = 576$ cách.
      Tổng số cách xếp thỏa mãn là: $576 + 576 = 1152$ cách.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Sử dụng hàm sinh lũy thừa hai biến (bivariate EGF) với biến $x$ cho nam và $y$ cho nữ.
      - Mỗi hoán vị của 4 nam đóng góp $4!$ và 4 nữ đóng góp $4!$.
      - Cấu trúc xen kẽ được mô tả bởi đa thức hình thức biểu thị 2 kịch bản sắp xếp: $P(x, y) = (x y)^4 + (y x)^4 = 2 x^4 y^4$.
      - Số cách sắp xếp các học sinh phân biệt vào cấu trúc này là hệ số liên đới của EGF:
        $ N = 4! dot 4! [x^4 y^4] (2 x^4 y^4) = 2 dot 4! dot 4! = 1152 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu số tự nhiên gồm 3 chữ số đôi một khác nhau sao cho tích của 3 chữ số đó là một số chẵn?
  ],
  [588],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Tích của 3 chữ số là số chẵn khi và chỉ khi trong 3 chữ số đó có ít nhất một chữ số chẵn.
      Ta sử dụng phương pháp phần bù:
      - Tổng số các số tự nhiên có 3 chữ số đôi một khác nhau lập từ $\{0, 1, ..., 9\}$:
        - Chọn chữ số hàng trăm $a ne 0$: 9 cách chọn.
        - Chọn chữ số thứ hai $b$ (khác $a$): 9 cách chọn.
        - Chọn chữ số thứ ba $c$ (khác $a, b$): 8 cách chọn.
        Tổng số là: $9 dot 9 dot 8 = 648$ số.
      - Trường hợp vi phạm: Số có 3 chữ số đôi một khác nhau mà tích là số lẻ (tức là cả 3 chữ số đều là số lẻ lấy từ $\{1, 3, 5, 7, 9\}$):
        - Số cách chọn là chỉnh hợp chập 3 của 5 số lẻ: $A_5^3 = 5 dot 4 dot 3 = 60$ số.
      - Số các số thỏa mãn đề bài là:
        $ N = 648 - 60 = 588 " số". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Chia các chữ số thành nhóm Chẵn $E = \{0, 2, 4, 6, 8\}$ (5 chữ số) và nhóm Lẻ $O = \{1, 3, 5, 7, 9\}$ (5 chữ số).
      - Hàm sinh chọn 3 chữ số khác nhau từ 10 chữ số (với $u$ đại diện cho chẵn, $v$ đại diện cho lẻ):
        $ P(u, v) = [z^3] (1 + u z)^5 (1 + v z)^5 = 10 u^3 + 50 u^2 v + 50 u v^2 + 10 v^3 $
      - Mỗi bộ 3 chữ số phân biệt có $3! = 6$ cách sắp xếp thành số tự nhiên.
      - Để loại bỏ số có chữ số 0 đứng đầu, ta xét hàm sinh cho 2 chữ số còn lại khi 0 ở vị trí đầu tiên:
        $ P_0(u, v) = [z^2] (1 + u z)^4 (1 + v z)^5 = 6 u^2 + 20 u v + 10 v^2 $
      - Mỗi bộ chứa 0 (đứng đầu) có $2! = 2$ cách xếp 2 chữ số còn lại.
      - Số lượng số tự nhiên thỏa mãn yêu cầu (chứa ít nhất một chữ số chẵn) là tổng số cách xếp trừ đi số cách xếp các số toàn lẻ:
        $ N = (6 P(1, 1) - 2 P_0(1, 1)) - 6 dot 10 = (6 dot 120 - 2 dot 36) - 60 = 588 " số". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Trong mặt phẳng cho 10 điểm phân biệt, trong đó không có 3 điểm nào thẳng hàng ngoại trừ đúng 4 điểm thẳng hàng với nhau trên một đường thẳng $d$. Hỏi có thể lập được bao nhiêu tam giác nhận các điểm đã cho làm đỉnh?
  ],
  [116],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi tập hợp 10 điểm là $S$. Có 4 điểm thẳng hàng trên đường thẳng $d$, và 6 điểm còn lại không có 3 điểm nào thẳng hàng.
      - Số cách chọn 3 điểm bất kỳ từ 10 điểm là: $C_(10)^3 = 120$.
      - Trường hợp chọn phải 3 điểm cùng nằm trên đường thẳng $d$ (không tạo thành tam giác): chọn 3 điểm từ 4 điểm thẳng hàng này: $C_4^3 = 4$ cách.
      Số tam giác lập được là:
      $ N = 120 - 4 = 116 " tam giác". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Chia 10 điểm thành 2 nhóm: nhóm A (4 điểm thẳng hàng trên $d$) và nhóm B (6 điểm còn lại).
      - Hàm sinh chọn điểm với biến $x$ cho nhóm A và $y$ cho nhóm B là:
        $ G(x, y) = (1 + x)^4 (1 + y)^6 $
      - Trích xuất các số hạng bậc 3 (chọn 3 đỉnh):
        $ G_3(x, y) = 4 x^3 + 36 x^2 y + 60 x y^2 + 20 y^3 $
      - Tam giác được hình thành khi không chọn cả 3 đỉnh thuộc nhóm A (tương ứng loại bỏ số hạng $4 x^3$):
        $ N = 36 + 60 + 20 = 116 " tam giác". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Tính tổng tất cả các hệ số trong khai triển nhị thức Newton của $(3x - 2y)^(10)$.
  ],
  [1],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Khai triển nhị thức Newton của $(3x - 2y)^(10)$ có dạng:
      $ (3x - 2y)^(10) = sum_(k=0)^(10) C_(10)^k (3x)^(10-k) (-2y)^k = sum_(k=0)^(10) C_(10)^k 3^(10-k) (-2)^k x^(10-k) y^k $
      Tổng các hệ số của khai triển này thu được bằng cách thế tất cả các biến số bằng 1, tức là đặt $x = 1$ và $y = 1$.
      Thế vào biểu thức ban đầu ta được:
      $ S = (3 dot 1 - 2 dot 1)^(10) = (3 - 2)^(10) = 1^(10) = 1. $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Xem $(3x - 2y)^(10)$ là hàm sinh hai biến $F(x, y) = sum c_(a,b) x^a y^b$ biểu diễn các hệ số của khai triển.
      - Tổng các hệ số của khai triển chính là giá trị thu được khi đánh giá hàm sinh tại các biến bằng 1:
        $ S = F(1, 1) = (3 dot 1 - 2 dot 1)^(10) = 1. $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu dãy nhị phân độ dài 8 không chứa hai chữ số 0 đứng cạnh nhau và không chứa hai chữ số 1 đứng cạnh nhau (xen kẽ)?
  ],
  [2],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Một dãy nhị phân độ dài 8 xen kẽ hoàn toàn chỉ có thể có hai cấu trúc duy nhất:
      - Cấu trúc 1: $01010101$
      - Cấu trúc 2: $10101010$
      Do đó, chỉ có đúng 2 dãy nhị phân thỏa mãn đề bài.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Dãy xen kẽ bắt đầu bằng 0 chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_0(z) = frac(z, 1-z)$.
      - Dãy xen kẽ bắt đầu bằng 1 cũng chỉ có duy nhất 1 dãy cho mỗi độ dài $n$, với hàm sinh là $F_1(z) = frac(z, 1-z)$.
      - Hàm sinh tổng quát cho các dãy nhị phân xen kẽ là:
        $ G(z) = F_0(z) + F_1(z) = frac(2z, 1-z) = 2z + 2z^2 + 2z^3 + dots $
      - Số lượng dãy xen kẽ độ dài 8 là hệ số của $z^8$ trong $G(z)$:
        $ [z^8] G(z) = 2 " dãy". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Một lưới ô vuông kích thước $5 times 5$ được tạo bởi 6 đường thẳng dọc và 6 đường thẳng ngang. Hỏi có bao nhiêu hình chữ nhật (kể cả hình vuông) xuất hiện trong lưới này?
  ],
  [225],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Một hình chữ nhật được tạo ra bằng cách chọn 2 đường thẳng dọc từ 6 đường dọc và 2 đường thẳng ngang từ 6 đường ngang.
      Số cách chọn là:
      $ N = C_6^2 dot C_6^2 = 15 dot 15 = 225 " hình chữ nhật". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Gọi kích thước lưới ô vuông là $5 times 5$. Trên mỗi chiều có 6 đường thẳng tạo ra các đoạn thẳng độ dài $k$ ($1 <= k <= 5$).
      - Số lượng đoạn thẳng có độ dài $k$ trên một chiều là $6 - k$.
      - Hàm sinh biểu thị sự phân bố các đoạn thẳng theo chiều dài là:
        $ H(t) = sum_(k=1)^5 (6 - k) t^k = 5 t + 4 t^2 + 3 t^3 + 2 t^4 + t^5 $
      - Tổng số hình chữ nhật bằng tích tổng số đoạn thẳng trên hai chiều (ngang và dọc), thu được bằng cách đánh giá hàm sinh tại $t=1$:
        $ N = H(1) dot H(1) = (5 + 4 + 3 + 2 + 1)^2 = 15^2 = 225 " hình chữ nhật". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình",),
  [
    Có bao nhiêu cách phân hoạch tập hợp $S = \{1, 2, 3, 4, 5\}$ thành đúng 2 tập con khác rỗng không phân biệt?
  ],
  [15],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Số cách phân hoạch một tập hợp gồm 5 phần tử thành 2 nhóm không rỗng, không phân biệt là số Stirling loại 2 chập 2 của 5 phần tử: $S(5,2)$.
      Ta tính trực tiếp:
      $ S(5,2) = frac(1, 2!) (2^5 - 2 dot 1^5) = frac(1, 2) (32 - 2) = 15 " cách". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Hàm sinh lũy thừa (EGF) của số Stirling loại hai chập $k=2$ là:
        $ G_2(x) = frac((e^x - 1)^2, 2!) = frac(e^(2x) - 2e^x + 1, 2) $
      - Khai triển Taylor của $G_2(x)$:
        $ G_2(x) = frac(1, 2) (sum_(n=0)^(infty) frac(2^n x^n, n!) - 2 sum_(n=0)^(infty) frac(x^n, n!) + 1) = sum_(n=1)^(infty) frac(2^(n-1) - 1, n!) x^n $
      - Số cách phân hoạch tập 5 phần tử là hệ số của $frac(x^5, 5!)$ trong EGF $G_2(x)$:
        $ N = 5! [x^5] G_2(x) = 2^(5-1) - 1 = 15 " cách". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Lát một hành lang kích thước $1 times 10$ bằng các viên gạch kích thước $1 times 1$ và $1 times 2$. Hỏi có bao nhiêu cách lát khác nhau?
  ],
  [89],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Gọi $a_n$ là số cách lát hành lang kích thước $1 times n$.
      Xét viên gạch cuối cùng được đặt ở vị trí kết thúc:
      - Nếu viên gạch cuối là $1 times 1$: Phần hành lang phía trước dài $1 times (n-1)$ có $a_(n-1)$ cách lát.
      - Nếu viên gạch cuối là $1 times 2$: Phần hành lang phía trước dài $1 times (n-2)$ có $a_(n-2)$ cách lát.
      Ta có hệ thức truy hồi Fibonacci: $a_n = a_(n-1) + a_(n-2)$ với mọi $n >= 3$.
      Khởi tạo giá trị:
      - Hành lang $1 times 1$ ($n=1$): Chỉ có 1 cách dùng gạch $1 times 1 arrow a_1 = 1$.
      - Hành lang $1 times 2$ ($n=2$): Có 2 cách (dùng hai viên $1 times 1$ hoặc một viên $1 times 2$) $arrow a_2 = 2$.
      Tính các số hạng tiếp theo của dãy:
      $
        a_3 = 3, a_4 = 5, a_5 = 8, a_6 = 13, a_7 = 21, a_8 = 34, a_9 = 55, a_(10) = 89
      $
      Vậy có tất cả 89 cách lát hành lang.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Viên gạch $1 times 1$ đóng góp độ dài 1 (đa thức $t$), viên gạch $1 times 2$ đóng góp độ dài 2 (đa thức $t^2$).
      - Hàm sinh cho việc lát hành lang bằng hai loại gạch này là:
        $ G(t) = frac(1, 1 - t - t^2) = sum_(n=0)^(infty) F_(n+1) t^n $
      - Số cách lát hành lang độ dài 10 là hệ số của $t^(10)$ trong $G(t)$, tương ứng với số Fibonacci $F_(11) = 89$ cách.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tìm số đường đi trên lưới tọa độ từ điểm $(0,0)$ đến điểm $(5,5)$ bằng các bước đi sang phải $(+1,0)$ hoặc đi lên trên $(0,+1)$ sao cho đường đi không bao giờ đi lên phía trên đường thẳng $y = x$.
  ],
  [42],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Đây là bài toán tính số đường đi Dyck dưới đường phân giác, kết quả chính là số Catalan thứ 5 ($C_5$):
      $ C_5 = frac(1, 5+1) C_(10)^5 = frac(1, 6) dot 252 = 42 " đường đi". $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Một đường đi Dyck bắt đầu từ $(0,0)$ chạm đường phân giác lần đầu tại điểm $(k+1, k+1)$ với $0 <= k <= n-1$, phân hoạch đường đi thành hai phần độc lập. Từ đó ta có hệ thức Catalan: $C_n = sum_(k=0)^(n-1) C_k C_(n-1-k)$.
      - Hệ thức tự tương tự này tương ứng với phương trình hàm sinh: $C(x) = 1 + x C^2(x)$. Giải phương trình thu được:
        $ C(x) = frac(1 - sqrt(1 - 4x), 2x) = sum_(n=0)^(infty) frac(1, n+1) C_(2n)^n x^n $
      - Số đường đi đến điểm $(5,5)$ là hệ số của $x^5$ trong $C(x)$, tức là số Catalan thứ 5:
        $ C_5 = frac(1, 6) C_(10)^5 = 42 " đường". $
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tính tổng sau theo $n$:
  $ S = (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 $
  ],
  [$C_(2n)^n$],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Sử dụng đồng nhất thức nhị thức Vandermonde hoặc so sánh hệ số đa thức:
      Xét tích hai đa thức khai triển:
      $ (1 + x)^n dot (x + 1)^n = (1 + x)^(2n) $
      - Hệ số của $x^n$ trong vế phải $(1 + x)^(2n)$ là: $C_(2n)^n$.
      - Hệ số của $x^n$ trong vế trái thu được bằng cách nhân chéo các số hạng:
        $ (sum_(i=0)^n C_n^i x^i) dot (sum_(j=0)^n C_n^j x^(n-j)) $
        Số hạng chứa $x^n$ xuất hiện khi chọn $i = j$, hệ số tương ứng là:
        $ sum_(i=0)^n C_n^i dot C_n^i = sum_(i=0)^n (C_n^i)^2 $
      Đồng nhất hệ số hai vế, ta được: $S = C_(2n)^n$.
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Xét hàm sinh $f(x) = (1+x)^n = sum_(k=0)^n C_n^k x^k$ và $g(x) = (1+x^(-1))^n = sum_(j=0)^n C_n^j x^(-j)$.
      - Tích của hai hàm sinh là:
        $ f(x)g(x) = (1+x)^n (1+1/x)^n = frac((1+x)^(2n), x^n) $
      - Hệ số tự do (hệ số của $x^0$) trong tích $f(x)g(x)$ là:
        $ [x^0] f(x)g(x) = [x^0] frac((1+x)^(2n), x^n) = [x^n] (1+x)^(2n) = C_(2n)^n $
      - Mặt khác, nhân trực tiếp hai chuỗi cho ta hệ số tự do khi $k=j$:
        $ [x^0] f(x)g(x) = sum_(k=0)^n C_n^k dot C_n^k = sum_(k=0)^n (C_n^k)^2 $
      - Đồng nhất hai cách tính hệ số tự do ta được: $S = C_(2n)^n$.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Hai người chơi A và B chơi một trò chơi tung đồng xu. Người A thắng nếu tung được mặt ngửa, người B thắng nếu tung được mặt sấp. Biết đồng xu không cân đối, xác suất xuất hiện mặt ngửa là $p = 0.6$ và sấp là $1-p = 0.4$. Trò chơi kết thúc khi có người đạt được 2 lượt thắng. Tính xác suất để người A giành chiến thắng chung cuộc.
  ],
  [0.648],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Trò chơi kết thúc sau tối đa 3 lượt chơi. A giành chiến thắng chung cuộc trong các trường hợp sau:
      - *TH1 (A thắng sau 2 lượt):* A thắng cả 2 lượt đầu. Xác suất là:
        $ P_2 = (0.6)^2 = 0.36 $
      - *TH2 (A thắng sau 3 lượt):* A thắng lượt thứ 3 và thắng đúng 1 trong 2 lượt đầu. Xác suất là:
        $ P_3 = C_2^1 dot (0.6) dot (0.4) dot 0.6 = 2 dot 0.24 dot 0.6 = 0.288 $
      Tổng xác suất A giành chiến thắng chung cuộc là:
      $ P = P_2 + P_3 = 0.36 + 0.288 = 0.648 $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Sử dụng hàm sinh xác suất hai biến với biến $x$ đại diện cho lượt thắng của A, $y$ đại diện cho lượt thắng của B. Mỗi lượt tung đồng xu có hàm sinh xác suất: $f(x, y) = 0.6 x + 0.4 y$.
      - Trò chơi dừng ngay khi số mũ của $x$ hoặc $y$ đạt đến 2. Các nhánh thắng của A tương ứng với việc đạt trạng thái có dạng $x^2 y^k$ ($k < 2$).
      - Sau 2 lượt, hàm sinh xác suất là: $(0.6x + 0.4y)^2 = 0.36 x^2 + 0.48 x y + 0.16 y^2$.
        - Số hạng $0.36 x^2$ đạt đích (A thắng và trò chơi dừng).
        - Số hạng $0.16 y^2$ đạt đích (B thắng và trò chơi dừng).
        - Số hạng $0.48 x y$ chưa kết thúc, tiếp tục đi đến lượt 3.
      - Tại lượt 3, từ trạng thái $0.48 x y$, ta nhân tiếp với $f(x, y)$:
        $ 0.48 x y (0.6x + 0.4y) = 0.288 x^2 y + 0.192 x y^2 $
        - Số hạng $0.288 x^2 y$ tương ứng A thắng chung cuộc ở lượt 3.
      - Tổng xác suất A thắng chung cuộc là: $P = 0.36 + 0.288 = 0.648$.
    ]
  ]
)

#tln(
  tags: ("Dễ", "Trung bình", "Khó",),
  [
    Tìm số nghiệm nguyên của phương trình $x_1 + x_2 + x_3 + x_4 = 10$ thỏa mãn điều kiện $0 <= x_i <= 3$ với mọi $i = 1, 2, 3, 4$.
  ],
  [10],
  loigiai: [
    #ppgiai[
      Bài toán có thể tiếp cận theo nhiều hướng giải khác nhau. Dưới đây là các phương án chi tiết giúp nắm vững phương pháp giải.
    ]

    #cach-box(title: "Cách 1", color: col-blue, icon: "🔵")[
      Sử dụng phương pháp bù trừ (PIE):
      - Tổng số nghiệm nguyên không âm không giới hạn trên: $N_Omega = C_(10+4-1)^(4-1) = C_(13)^3 = 286$.
      - Gọi $P_i$ là điều kiện vi phạm của biến $x_i$, tức là $x_i >= 4$.
      - Số nghiệm vi phạm ít nhất 1 điều kiện (ví dụ $x_1 >= 4$, đặt $x_1' = x_1 - 4 >= 0 Rightarrow x_1' + x_2 + x_3 + x_4 = 6$):
        $ S_1 = C_4^1 dot C_(6+4-1)^(4-1) = 4 dot C_9^3 = 4 dot 84 = 336. $
      - Số nghiệm vi phạm ít nhất 2 điều kiện (ví dụ $x_1, x_2 >= 4$, đặt $x_1' = x_1 - 4, x_2' = x_2 - 4 Rightarrow x_1' + x_2' + x_3 + x_4 = 2$):
        $ S_2 = C_4^2 dot C_(2+4-1)^(4-1) = 6 dot C_5^3 = 6 dot 10 = 60. $
      - Không thể có >= 3 điều kiện vi phạm cùng lúc vì $4 + 4 + 4 = 12 > 10$.
      - Số nghiệm thỏa mãn là:
        $ N = N_Omega - S_1 + S_2 = 286 - 336 + 60 = 10. $
    ]

    #cach-box(title: "Cách 2", color: col-violet, icon: "🟣")[
      - Mỗi biến $x_i$ có điều kiện $0 <= x_i <= 3$, tương ứng với đa thức lựa chọn $1 + t + t^2 + t^3 = frac(1-t^4, 1-t)$.
      - Hàm sinh tổng quát cho số nghiệm của phương trình là:
        $ G(t) = (frac(1 - t^4, 1 - t))^4 = (1 - t^4)^4 (1 - t)^(-4) $
      - Khai triển các nhân tử:
        - $(1 - t^4)^4 = 1 - 4t^4 + 6t^8 - 4t^(12) + t^(16)$
        - $(1 - t)^(-4) = sum_(k=0)^(infty) C_(k+3)^3 t^k$
      - Hệ số của $t^(10)$ trong $G(t)$ tương ứng với số nghiệm của phương trình:
        $ [t^(10)] G(t) = 1 dot C_(10+3)^3 - 4 dot C_(6+3)^3 + 6 dot C_(2+3)^3 = C_(13)^3 - 4 C_9^3 + 6 C_5^3 = 286 - 336 + 60 = 10 " nghiệm". $
    ]
  ]
)

#pagebreak()

// ══════════════════════════════════════════════════════════════
// PHẦN III: BẢNG TỔNG HỢP CÔNG THỨC
// ══════════════════════════════════════════════════════════════
= Bảng Tổng Hợp Công Thức Cốt Lõi

#align(center)[
  #block(width: 100%)[
    #table(
      columns: (1.2fr, 2fr, 1.2fr, 2fr),
      align: (center, left, center, left),
      stroke: 0.6pt + rgb("E2E8F0"),
      inset: (x: 8pt, y: 7pt),
      fill: (x,y) => if y==0 { c-navy } else if calc.rem(y,2)==0 { rgb("F8FAFC") } else { white },

      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],
      text(fill:white,weight:"bold", size:9.5pt)[Tên gọi],
      text(fill:white,weight:"bold", size:9.5pt)[Công thức toán học],

      [Hoán vị], $P_n = n!$, [Tổ hợp], $C_n^k = frac(n!, k!(n-k)!)$,
      [Chỉnh hợp], $A_n^k = frac(n!, (n-k)!)$, [Hoán vị lặp], $frac(n!, n_1!n_2!dots.c n_k!)$,
      [Vách ngăn ($>= 0$)], $C_(n+k-1)^(k-1)$, [Vách ngăn ($>= 1$)], $C_(n-1)^(k-1)$,
      [Stirling loại 2], $S(n,k) = frac(1, k!) sum (-1)^j C_k^j (k-j)^n$, [Số Bell], $B(n) = sum_(k=1)^n S(n,k)$,
      [Số Catalan], $C_n = frac(1, n+1) C_(2n)^n$, [Đa thức sắc vòng], $(k-1)^n + (k-1)(-1)^n$,
      [Dãy Fibonacci], $F_n = F_(n-1)+F_(n-2)$, [Hàm phi Euler], $phi(n) = n prod_(p|n) (1 - 1/p)$,
      [Khai triển], $(a+b)^n = sum C_n^k a^(n-k) b^k$, [Vandermonde], $C_(2n)^n = sum_(k=0)^n (C_n^k)^2$,
    )
  ]
]

#v(1em)
#key-box[
  *Phương châm giải toán Đại số Tổ hợp:*
  - *Xem xét tính phân biệt:* Vật phân biệt hay giống nhau? Hộp/Nhóm phân biệt hay giống nhau?
  - *Xem xét tính thứ tự:* Lựa chọn có quan tâm đến thứ tự sắp xếp hay chỉ lấy ra tập hợp?
  - *Đơn giản hóa mô hình:* Nếu đếm xuôi có quá nhiều điều kiện chặn, hãy lập tức nghĩ đến việc đếm gián tiếp qua phần bù hoặc thiết lập hệ thức truy hồi.
]
