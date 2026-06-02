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

#import "../../math-sym.typ": *
#import "../../sang-exam.typ": *
#import "../../template.typ": *

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)

// ─── Màu chủ đề nâng cấp ─────────────────────────────────────────────
#let col-purple = rgb("4A148C")
#let col-violet = rgb("6A1B9A")
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
