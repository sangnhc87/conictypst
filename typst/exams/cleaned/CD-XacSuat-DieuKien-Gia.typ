#import "../../sang-exam.typ": *
#import "../../template.typ": *
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════

#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D1B2A"), rgb("1B4F72"), angle: 0deg),
  stroke: none,
  inset: (x: 15pt, y: 10pt),
  radius: 6pt,
  above: 1.8em,
  below: 1.2em,
  text(fill: white, size: 14pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => block(
  above: 1.5em,
  below: 0.8em,
  stroke: (left: 4pt + rgb("C0392B")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("C0392B"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("117A65"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let crime-red = rgb("C0392B")
#let crime-dark = rgb("0D1B2A")
#let crime-gold = rgb("D4AC0D")
#let crime-teal = rgb("117A65")
#let crime-purple = rgb("6C3483")

// ─── Hộp trinh thám ──────────────────────────────────────────
#let detective-box(body) = block(
  fill: gradient.linear(rgb("0D1B2A"), rgb("1A2F4A"), angle: 135deg),
  stroke: 1.5pt + crime-gold,
  radius: 8pt,
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[#text(fill: white)[#body]]

#let clue-box(title: "🔍 Manh Mối", body) = block(
  fill: rgb("FDFEFE"),
  stroke: (left: 4pt + crime-red, rest: 0.5pt + rgb("EAECEE")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: crime-red, weight: "bold")[#title]
  #v(0.3em)
  #body
]

#let verdict-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + crime-gold, rest: 0.5pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 12pt, y: 10pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[⚖️ Phán Quyết]
  #v(0.3em)
  #body
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1B4F72"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 25pt),
  )[
    #text(fill: crime-gold, size: 11pt, weight: "bold", tracking: 3pt)[CHUYÊN ĐỀ XÁC SUẤT NÂNG CAO]
    #v(0.5em)
    #text(fill: white, size: 22pt, weight: "bold")[Phá Án Bayes]
    #v(0.3em)
    #text(fill: rgb("AED6F1"), size: 14pt, style: "italic")[
      Nghệ Thuật Lập Luận Ngược — Từ Bằng Chứng Đến Hung Thủ
    ]
    #v(1em)
    #line(length: 60%, stroke: 0.5pt + crime-gold)
    #v(0.8em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.8em,
      align(center)[
        #text(fill: crime-gold, size: 9pt, weight: "bold")[📖 NỀN TẢNG]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[XS có điều kiện\ Quy tắc nhân · Độc lập]
      ],
      align(center)[
        #text(fill: crime-gold, size: 9pt, weight: "bold")[🔍 LÝ THUYẾT]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[Bayes · Toàn phần\ Naive Bayes]
      ],
      align(center)[
        #text(fill: crime-gold, size: 9pt, weight: "bold")[🎯 BÀI TẬP]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[8 Vụ án trinh thám\ 6 bài tự luyện]
      ],
      align(center)[
        #text(fill: crime-gold, size: 9pt, weight: "bold")[🧠 KỸ THUẬT]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8pt)[Sơ đồ cây\ Bayes tuần tự]
      ],
    )
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// PHẦN 0 — TIỀN ĐỀ: XÁC SUẤT CÓ ĐIỀU KIỆN
// ═══════════════════════════════════════════════
= 0. Tiền Đề — Xác Suất Có Điều Kiện

== Định Nghĩa và Quy Tắc Cơ Bản

#detective-box[
  *📌 Xác suất có điều kiện* của $A$ khi biết $B$ xảy ra ($P(B) > 0$):
  $ P(A|B) = P(A sect B) / P(B) $
  #text(fill: crime-gold)[→ _"Thu hẹp không gian mẫu về thế giới đã biết $B$, rồi đo phần $A$ trong đó."_]

  #v(0.4em)
  *📌 Quy tắc nhân (Multiplication Rule):*
  $ P(A sect B) = P(A) dot P(B|A) = P(B) dot P(A|B) $
  Mở rộng cho chuỗi biến cố:
  $ P(A_1 sect A_2 sect dots.c sect A_n) = P(A_1) dot P(A_2|A_1) dot P(A_3|A_1 sect A_2) dot dots.c $

  #v(0.4em)
  *📌 Hai biến cố độc lập:* $A perp B <==> P(A|B) = P(A) <==> P(A sect B) = P(A) dot P(B)$.

  #v(0.4em)
  *📌 Cảnh báo đỏ — Không được đảo chiều xác suất:*
  $ P(A|B) eq.not P(B|A) quad "nói chung!" $
  Ví dụ: $P("dương tính" | "có bệnh") = 0","99$ nhưng $P("có bệnh" | "dương tính") approx 0","09$ (Vụ 5).
]

#clue-box(title: "📊 Ví Dụ Nhanh — Bảng Tần Số Hai Chiều")[
  Khảo sát 200 học sinh, phân theo giới tính và học lực:
  #align(center)[
    #table(
      columns: (2fr, 1.5fr, 1.5fr, 1fr),
      align: center,
      stroke: 0.5pt + gray,
      fill: (x, y) => if y == 0 or x == 0 { rgb("D6EAF8") } else if y == 3 or x == 3 { crime-gold.lighten(85%) } else {
        white
      },
      table.header([], [Giỏi ($G$)], [Chưa giỏi ($overline(G)$)], [Tổng]),
      [Nam ($M$)], [40], [60], [100],
      [Nữ ($F$)], [50], [50], [100],
      [Tổng], [90], [110], [200],
    )
  ]
  - $P(G) = 90/200 = 0","45$; $quad P(G|M) = 40/100 = 0","40$; $quad P(M|G) = 40/90 approx 0","444$
  - *Không đảo chiều:* "$40\%$ trong số nam là giỏi" $eq.not$ "$40\%$ trong số học sinh giỏi là nam."
  - *Kiểm tra độc lập:* $P(G|M) = 0","40 eq.not 0","45 = P(G)$ → Giới tính và học lực *không độc lập*.
]

#v(0.5em)

// ═══════════════════════════════════════════════
// PHẦN I — LÝ THUYẾT
// ═══════════════════════════════════════════════
= I. Lý Thuyết Nền Tảng — Bộ Vũ Khí Của Thám Tử

== 1. Bốn Công Cụ Cốt Lõi

#detective-box[
  *🔫 Vũ khí 1 — Công thức Xác suất Toàn phần (Xét theo Nguyên nhân):*

  Nếu có $n$ "kịch bản nguyên nhân" $A_1, A_2, dots.c, A_n$ (xung khắc từng đôi, hợp thành toàn bộ không gian mẫu), thì xác suất để "kết quả $E$" xảy ra là:
  $ P(E) = P(A_1)P(E|A_1) + P(A_2)P(E|A_2) + dots.c + P(A_n)P(E|A_n) $
  #text(fill: crime-gold)[→ _Đây là bước tính "Tổng tất cả các nhánh" trên sơ đồ cây._]

  #v(0.5em)
  *🔫 Vũ khí 2 — Định lý Bayes (Lập luận Ngược — Từ Kết quả truy ra Nguyên nhân):*

  Đã biết kết quả $E$ xảy ra. Xác suất để nguyên nhân $A_k$ mới là thủ phạm thực sự là:
  $
    P(A_k | E) = (P(A_k) dot P(E | A_k)) / P(E) = underbrace(P(A_k) dot P(E|A_k), "Tích nhánh" A_k) / underbrace(sum_i P(A_i) dot P(E|A_i), "Tổng tất cả nhánh")
  $
  #text(fill: crime-gold)[→ _Bản chất: Chia "nhánh đang quan tâm" cho "tổng tất cả các nhánh"._]

  #v(0.5em)
  *🔫 Vũ khí 3 — Nguyên lý Nhân xác suất (Naive Bayes — Bằng chứng Độc lập):*

  Nếu các manh mối $M_1, M_2, dots.c, M_k$ xuất hiện độc lập khi đã biết ai là hung thủ:
  $ P(M_1 sect M_2 sect dots.c sect M_k | A_j) = P(M_1|A_j) dot P(M_2|A_j) dot dots.c dot P(M_k|A_j) $
  #text(fill: crime-gold)[→ _Xác suất đồng thời nhiều bằng chứng = Tích các xác suất từng bằng chứng._]

  #v(0.5em)
  *🔫 Vũ khí 4 — Kỹ thuật Sơ đồ Cây Trinh thám:*

  Phân rã bài toán theo hệ thống: Gốc → Nguyên nhân → Kết quả. Tính tích trên mỗi nhánh rồi cộng lại. Bayes chỉ là phép chia một nhánh cho tổng.
]

#v(0.5em)

== 2. Trực Quan Hóa — "Bản Đồ Tình Nghi" bằng Sơ đồ Cây

#clue-box(title: "📐 Cấu trúc Sơ đồ Cây và Cách Đọc")[
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Node gốc
      rect((-3.5, -0.4), (3.5, 0.4), fill: rgb("0D1B2A"), stroke: 2pt + rgb("D4AC0D"), radius: 0.3)
      content((0, 0), text(fill: white, weight: "bold", size: 9pt)["Bằng chứng E" — Kết quả quan sát được])

      // Nhánh trái: A1
      rect((-6.5, -2), (-3.5, -3), fill: rgb("FADBD8"), stroke: 1.5pt + rgb("C0392B"), radius: 0.3)
      content((-5, -2.5), text(fill: rgb("C0392B"), weight: "bold", size: 9pt)[Giả thuyết A₁  |  P(A₁)])

      // Nhánh giữa: A2
      rect((-1.5, -2), (1.5, -3), fill: rgb("FEF9E7"), stroke: 1.5pt + rgb("D4AC0D"), radius: 0.3)
      content((0, -2.5), text(fill: rgb("7D6608"), weight: "bold", size: 9pt)[Giả thuyết A₂  |  P(A₂)])

      // Nhánh phải: An
      rect((3.5, -2), (6.5, -3), fill: rgb("D5F5E3"), stroke: 1.5pt + rgb("117A65"), radius: 0.3)
      content((5, -2.5), text(fill: rgb("117A65"), weight: "bold", size: 9pt)[Giả thuyết Aₙ  |  P(Aₙ)])

      // Đường nối gốc → nhánh
      line((-1.5, -0.4), (-5, -2), mark: (end: ">"), stroke: 1.5pt + rgb("C0392B"))
      line((0, -0.4), (0, -2), mark: (end: ">"), stroke: 1.5pt + rgb("D4AC0D"))
      line((1.5, -0.4), (5, -2), mark: (end: ">"), stroke: 1.5pt + rgb("117A65"))

      // Nhãn xác suất trên nhánh
      content((-3.5, -1.1), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8pt)[P(E|A₁)]))
      content((1.0, -1.1), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8pt)[P(E|A₂)]))
      content((3.5, -1.1), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8pt)[P(E|Aₙ)]))

      // Tích nhánh cuối
      content((-5, -4.0), box(fill: rgb("FADBD8"), stroke: 1pt + rgb("C0392B"), inset: 4pt, radius: 3pt, text(
        size: 8pt,
      )[P(A₁)·P(E|A₁)]))
      content((0, -4.0), box(fill: rgb("FEF9E7"), stroke: 1pt + rgb("D4AC0D"), inset: 4pt, radius: 3pt, text(
        size: 8pt,
      )[P(A₂)·P(E|A₂)]))
      content((5, -4.0), box(fill: rgb("D5F5E3"), stroke: 1pt + rgb("117A65"), inset: 4pt, radius: 3pt, text(
        size: 8pt,
      )[P(Aₙ)·P(E|Aₙ)]))

      line((-5, -3), (-5, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)
      line((0, -3), (0, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)
      line((5, -3), (5, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)

      content((0, -2.5), text(size: 14pt)[…])

      // Công thức Bayes ở cuối
      content((0, -5.2), box(
        fill: rgb("D4AC0D").lighten(80%),
        stroke: 1pt + rgb("D4AC0D"),
        inset: 8pt,
        radius: 5pt,
        width: 12cm,
      )[
        #align(center)[
          #text(weight: "bold", fill: rgb("7D6608"), size: 10pt)[
            Bayes = "Nhánh quan tâm" ÷ "Tổng tất cả nhánh"
          ]
        ]
      ])
    })
  ]
]

#v(0.5em)

// ═══════════════════════════════════════════════
// PHẦN II — BÀI TẬP
// ═══════════════════════════════════════════════
= II. Bộ Vụ Án Trinh Thám — Từ Sơ Cấp đến Nâng Cao

== Vụ 1 — "Biệt Thự Hoa Hồng" (Ba Nghi Phạm · Một Manh Mối)

#tln(
  id: "BAYES-VU1",
  [
    Trong một vụ mưu sát tại biệt thự, thám tử Conan khoanh vùng $3$ nghi phạm: $A$ (chủ nhà), $B$ (quản gia), $C$ (kẻ thù kinh doanh). Dựa trên động cơ, xác suất tiên nghiệm lần lượt là $P(A) = 30\%$, $P(B) = 20\%$, $P(C) = 50\%$.

    Đội điều tra tìm thấy *một* manh mối: loại thuốc độc sử dụng là Xyanua-X. Phân tích hành vi cho biết:
    - Nghi phạm $A$ sẽ chọn Xyanua-X với xác suất $40\%$.
    - Nghi phạm $B$ sẽ chọn Xyanua-X với xác suất $80\%$.
    - Nghi phạm $C$ sẽ chọn Xyanua-X với xác suất $10\%$.

    Tính xác suất từng nghi phạm là hung thủ thực sự sau khi tìm thấy manh mối Xyanua-X. (Làm tròn đến bốn chữ số thập phân).
  ],
  [
    $P(A|M) approx 0","3636$;
    $P(B|M) approx 0","4848$;
    $P(C|M) approx 0","1515$
  ],
  loigiai: [
    #ppgiai[
      Bài toán Bayes cơ bản với *một* bằng chứng (manh mối). Ta lập sơ đồ cây gốc → nghi phạm → manh mối, tính tích trên mỗi nhánh, rồi chia theo công thức Bayes.
    ]

    *Bước 1: Vẽ sơ đồ cây và tính tích xác suất từng nhánh.*

    Gọi $M$: biến cố "Tìm thấy Xyanua-X tại hiện trường".

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        // Gốc
        rect((-2.5, -0.4), (2.5, 0.4), fill: rgb("0D1B2A"), stroke: 1.5pt + rgb("D4AC0D"), radius: 0.3)
        content((0, 0), text(fill: white, weight: "bold", size: 9pt)[Tìm thấy Xyanua-X — Manh mối M])

        // Ba nghi phạm
        rect((-7.5, -2), (-5, -3), fill: rgb("FADBD8"), stroke: 1.5pt + rgb("C0392B"), radius: 0.3)
        content((-6.25, -2.5), text(fill: rgb("C0392B"), weight: "bold", size: 9pt)[Nghi phạm A  |  0,3])

        rect((-1.2, -2), (1.2, -3), fill: rgb("FEF9E7"), stroke: 1.5pt + rgb("D4AC0D"), radius: 0.3)
        content((0, -2.5), text(fill: rgb("7D6608"), weight: "bold", size: 9pt)[Nghi phạm B  |  0,2])

        rect((5, -2), (7.5, -3), fill: rgb("D5F5E3"), stroke: 1.5pt + rgb("117A65"), radius: 0.3)
        content((6.25, -2.5), text(fill: rgb("117A65"), weight: "bold", size: 9pt)[Nghi phạm C  |  0,5])

        // Đường nối
        line((-1.5, -0.4), (-6.25, -2), mark: (end: ">"), stroke: 1.5pt + rgb("C0392B"))
        line((0, -0.4), (0, -2), mark: (end: ">"), stroke: 1.5pt + rgb("D4AC0D"))
        line((1.5, -0.4), (6.25, -2), mark: (end: ">"), stroke: 1.5pt + rgb("117A65"))

        // Nhãn điều kiện
        content((-4.5, -1.0), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8.5pt)[$P(M|A) = 0","4$]))
        content((0.8, -1.0), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8.5pt)[$P(M|B) = 0","8$]))
        content((4.5, -1.0), box(fill: white, stroke: 0.5pt + gray, inset: 2pt, text(size: 8.5pt)[$P(M|C) = 0","1$]))

        // Tích nhánh cuối
        content((-6.25, -4.2), box(fill: rgb("FADBD8"), stroke: 1pt + rgb("C0392B"), inset: 5pt, radius: 3pt, text(
          size: 9pt,
        )[Nhánh A: #text(weight: "bold")[$0","3 times 0","4 = 0","12$]]))
        content((0, -4.2), box(fill: rgb("FEF9E7"), stroke: 1pt + rgb("D4AC0D"), inset: 5pt, radius: 3pt, text(
          size: 9pt,
        )[Nhánh B: #text(weight: "bold")[$0","2 times 0","8 = 0","16$]]))
        content((6.25, -4.2), box(fill: rgb("D5F5E3"), stroke: 1pt + rgb("117A65"), inset: 5pt, radius: 3pt, text(
          size: 9pt,
        )[Nhánh C: #text(weight: "bold")[$0","5 times 0","1 = 0","05$]]))

        line((-6.25, -3), (-6.25, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)
        line((0, -3), (0, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)
        line((6.25, -3), (6.25, -3.6), mark: (end: ">"), stroke: 0.8pt + gray)
      })
    ]

    *Bước 2: Tính xác suất toàn phần $P(M)$ (Mẫu số chung).*
    $ P(M) = 0","12 + 0","16 + 0","05 = 0","33 $

    *Bước 3: Áp dụng Bayes — "Mỗi nhánh chia cho tổng".*
    $
      P(A|M) & = 0","12 / 0","33 = 12/33 approx bold(0","3636) approx 36","36\% \
      P(B|M) & = 0","16 / 0","33 = 16/33 approx bold(0","4848) approx 48","48\% \
      P(C|M) & = 0","05 / 0","33 = 5/33 approx bold(0","1515) approx 15","15\%
    $

    #verdict-box[
      Sau khi phân tích manh mối Xyanua-X, mức độ tình nghi đã thay đổi hoàn toàn:
      - *Nghi phạm $B$* (quản gia) trở thành nghi can số 1 ($approx 48\%$), dù ban đầu chỉ là $20\%$.
      - *Nghi phạm $C$* dù bị nghi nhất ban đầu ($50\%$) nay giảm mạnh xuống chỉ $approx 15\%$.
      - *Bayes không có định kiến — bằng chứng quyết định tất cả.*
    ]
  ],
)

== Vụ 2 — "Biệt Thự Hoa Hồng" (Ba Nghi Phạm · Hai Manh Mối Độc Lập)

#tln(
  id: "BAYES-VU2",
  [
    *Tiếp tục vụ án tại biệt thự hoa hồng.* Xác suất tiên nghiệm: $P(A)=0","3$, $P(B)=0","2$, $P(C)=0","5$. Đội điều tra tìm được *đồng thời hai manh mối độc lập* (khi biết hung thủ, hai manh mối độc lập có điều kiện):

    - *Manh mối $M_1$:* Loại độc sử dụng là Xyanua-X. $P(M_1|A) = 40\%$, $P(M_1|B) = 80\%$, $P(M_1|C) = 10\%$.
    - *Manh mối $M_2$:* Bức thư tuyệt mệnh giả mạo được để lại. $P(M_2|A) = 70\%$, $P(M_2|B) = 20\%$, $P(M_2|C) = 90\%$.

    Tính xác suất để $C$ thực sự là hung thủ khi hiện trường xuất hiện cả hai manh mối trên. (Làm tròn đến hàng phần trăm).
  ],
  [$P(C|E) approx 0","28$],
  loigiai: [
    #ppgiai[
      - *Bước gộp:* Vì hai manh mối $M_1$ và $M_2$ độc lập có điều kiện, ta gộp thành $E = M_1 sect M_2$.
      - *Nguyên lý Naive Bayes:* $P(E|X) = P(M_1|X) dot P(M_2|X)$ với mọi nghi phạm $X in {A, B, C}$.
    ]

    *Bước 1: Tính xác suất liên kết $P(E|X)$ cho từng nghi phạm.*

    Vì hai manh mối độc lập có điều kiện:
    $
      P(E|A) & = P(M_1|A) dot P(M_2|A) = 0","4 times 0","7 = bold(0","28) \
      P(E|B) & = P(M_1|B) dot P(M_2|B) = 0","8 times 0","2 = bold(0","16) \
      P(E|C) & = P(M_1|C) dot P(M_2|C) = 0","1 times 0","9 = bold(0","09)
    $

    *Bước 2: Tính tích nhánh và xác suất toàn phần.*

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + gray,
        fill: (x, y) => if y == 0 { rgb("0D1B2A") } else if y == 4 { crime-gold.lighten(80%) } else { white },
        table.header(
          text(fill: white, weight: "bold")[Nghi phạm],
          text(fill: white, weight: "bold")[Prior $P(X)$],
          text(fill: white, weight: "bold")[Likelihood $P(E|X)$],
          text(fill: white, weight: "bold")[Tích nhánh $P(X) times P(E|X)$],
        ),
        text(fill: rgb("C0392B"), weight: "bold")[$A$], [$0","3$], [$0","28$], [*$0","084$*],
        text(fill: rgb("D4AC0D"), weight: "bold")[$B$], [$0","2$], [$0","16$], [*$0","032$*],
        text(fill: rgb("117A65"), weight: "bold")[$C$ (quan tâm)], [$0","5$], [$0","09$], [*$0","045$*],
        [*Tổng (mẫu số $P(E)$)*], [], [], [*$0","161$*],
      )
    ]

    *Bước 3: Áp dụng công thức Bayes.*
    $ P(E) = 0","084 + 0","032 + 0","045 = 0","161 $
    $ P(C | E) = 0","045 / 0","161 = 45/161 approx bold(0","2795) approx bold(0","28) $

    #verdict-box[
      Dù $C$ ban đầu bị tình nghi cao nhất ($50\%$), thói quen *không dùng Xyanua* ($P(M_1|C) = 10\%$ — rất thấp!) đã kéo $C$ xuống còn $approx 28\%$.

      *Hai manh mối cùng lúc đảo ngược hoàn toàn bảng tình nghi:* $A$ vươn lên dẫn đầu với $P(A|E) = 0","084/0","161 approx 52\%$, $C$ (ban đầu cao nhất $50\%$) tụt xuống $approx 28\%$, còn $B$ đứng cuối với $approx 20\%$.
    ]
  ],
)

== Vụ 3 — "Chuỗi Siêu Thị Ma" (Bất phương trình Bayes — Tìm tỉ lệ phần trăm)

#tln(
  id: "BAYES-VU3",
  [
    Cơ quan điều tra xác định hàng hóa nhiễm độc đến từ $2$ kho: *Kho A* cung cấp $x\%$ tổng hàng, *Kho B* cung cấp phần còn lại. Tỉ lệ hàng bị nhiễm độc từ Kho A là $3\%$, từ Kho B là $12\%$.

    Lấy ngẫu nhiên một sản phẩm bị nhiễm độc. Biết rằng xác suất để sản phẩm này đến từ *Kho A không vượt quá* $1/5$. Tìm giá trị nguyên lớn nhất của $x$.
  ],
  [$x_("max") = 50$],
  loigiai: [
    #ppgiai[
      - Gọi $A, B$ là biến cố sản phẩm từ Kho A và Kho B.
      - Gọi $D$ là biến cố "sản phẩm bị nhiễm độc".
      - Lập bất phương trình Bayes $P(A|D) <= 1/5$, giải tìm giá trị nguyên lớn nhất của $x$.
    ]

    *Bước 1: Xác định thông số.*
    $P(A) = x/100$; $P(B) = (100-x)/100$; $P(D|A) = 0","03$; $P(D|B) = 0","12$.

    *Bước 2: Lập bất phương trình Bayes $P(A|D) <= 1/5$.*
    $
      (P(A) dot P(D|A)) / (P(A) dot P(D|A) + P(B) dot P(D|B)) <= 1/5
    $
    Thay số và nhân tử mẫu với $100$ để khử phân số:
    $
      (0","03x) / (0","03x + 0","12(100-x)) <= 1/5
      <==> (3x) / (3x + 12(100-x)) <= 1/5
      <==> (3x) / (1200 - 9x) <= 1/5
    $

    *Bước 3: Giải bất phương trình.*

    Vì $x in (0; 100)$ nên $1200 - 9x > 0$, ta nhân chéo:
    $
      15x <= 1200 - 9x <==> 24x <= 1200 <==> x <= 50
    $

    *Kiểm tra:* Tại $x = 50$: $P(A|D) = (0","03 times 0","5)/(0","03 times 0","5 + 0","12 times 0","5) = 0","015/0","075 = 1/5$ ✓.

    #verdict-box[
      *Giá trị nguyên lớn nhất của $x$ là $bold(50)$.* Khi Kho A chiếm đúng $50\%$ hàng hóa, xác suất nguồn gốc Kho A chỉ đúng $1/5 = 20\%$ dù chiếm nửa thị phần — vì tỉ lệ nhiễm độc Kho B cao gấp 4 lần, nên hàng nhiễm độc phần lớn đến từ Kho B.
    ]
  ],
)

== Vụ 4 — "Đường Dây Xuyên Biên Giới" (Xác suất Toàn phần — 3 Nguồn)

#tln(
  id: "BAYES-VU4",
  [
    Một đường dây vận chuyển bất hợp pháp phân phối hàng từ $3$ cơ sở bí mật:
    - *Cơ sở Alpha:* Xác suất $0","5$. Hàng từ Alpha chứa hàng cấm với xác suất $0","8$.
    - *Cơ sở Beta:* Xác suất $0","3$. Hàng từ Beta chứa hàng cấm với xác suất $0","6$.
    - *Cơ sở Gamma:* Xác suất $0","2$. Hàng từ Gamma chứa hàng cấm với xác suất $0","4$.

    Hải quan bắt giữ một kiện hàng và xác nhận *có hàng cấm*. Tính xác suất kiện hàng đến từ cơ sở *Gamma*. (Làm tròn đến bốn chữ số thập phân).
  ],
  [$approx 0","1212$],
  loigiai: [
    #ppgiai[
      Gọi $"Al", "Be", "Ga"$ là biến cố hàng đến từ Alpha, Beta, Gamma. Gọi $D$ là biến cố "kiện hàng chứa hàng cấm". Ta cần $P("Ga" | D)$.
    ]

    *Bảng tính tích nhánh:*

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + gray,
        fill: (x, y) => if y == 0 { rgb("1B4F72") } else if y == 4 { crime-gold.lighten(80%) } else { white },
        table.header(
          text(fill: white, weight: "bold")[Cơ sở],
          text(fill: white, weight: "bold")[Prior $P(dot)$],
          text(fill: white, weight: "bold")[Likelihood $P(D | dot)$],
          text(fill: white, weight: "bold")[Tích nhánh],
        ),
        [Alpha], [$0","5$], [$0","8$], [*$0","40$*],
        [Beta], [$0","3$], [$0","6$], [*$0","18$*],
        text(fill: rgb("C0392B"), weight: "bold")[Gamma ⬅],
        [$0","2$],
        [$0","4$],
        text(fill: rgb("C0392B"), weight: "bold")[*$0","08$*],

        [*Tổng $P(D)$*], [], [], [*$0","66$*],
      )
    ]

    *Áp dụng Bayes:*
    $ P("Ga" | D) = 0","08 / 0","66 = 4/33 approx bold(0","1212) $

    #verdict-box[
      Cơ sở Alpha là nguồn khả nghi nhất: $P("Al"|D) = 0","40/0","66 approx 60","6\%$, chiếm hơn nửa số hàng cấm bị bắt giữ — dù tỉ lệ hàng cấm từng chuyến chưa phải cao nhất.
    ]
  ],
)

== Vụ 5 — "Nghịch Lý Xét Nghiệm" (Bayes trong Y khoa — Bẫy Tư Duy Nổi Tiếng)

#tln(
  id: "BAYES-VU5",
  [
    Một căn bệnh hiếm ảnh hưởng $0","1\%$ dân số. Một xét nghiệm hiện đại có:
    - *Độ nhạy* (Sensitivity): Xác suất dương tính khi có bệnh $= 99\%$.
    - *Độ đặc hiệu* (Specificity): Xác suất âm tính khi không bệnh $= 99\%$.

    Một người *hoàn toàn khỏe mạnh* (không triệu chứng) đi xét nghiệm ngẫu nhiên và nhận được *kết quả dương tính*. Tính xác suất thực sự người này mắc bệnh. (Làm tròn đến bốn chữ số thập phân).
  ],
  [$approx 0","0902 approx 9\%$],
  loigiai: [
    #ppgiai[
      Đây là bài toán "Nghịch lý Bayes" nổi tiếng. Kết quả sẽ ngược với trực giác của đa số mọi người — kể cả nhiều bác sĩ thường trả lời sai bài này!
    ]

    *Bước 1: Phân tích thông số.*
    - $B$: biến cố "Người đó mắc bệnh" $=> P(B) = 0","001$; $P(overline(B)) = 0","999$.
    - $+$: biến cố "Xét nghiệm dương tính".
    - Độ nhạy: $P(+|B) = 0","99$. Độ đặc hiệu: $P(-|overline(B)) = 0","99 => P(+|overline(B)) = 0","01$.

    *Bước 2: Bảng tính tích nhánh.*

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + gray,
        fill: (x, y) => if y == 0 { rgb("1B4F72") } else if y == 3 { crime-gold.lighten(80%) } else { white },
        table.header(
          text(fill: white, weight: "bold")[Tình trạng sức khỏe],
          text(fill: white, weight: "bold")[Prior $P(dot)$],
          text(fill: white, weight: "bold")[$P(+|dot)$ (dương tính)],
          text(fill: white, weight: "bold")[Tích nhánh],
        ),
        text(fill: rgb("C0392B"), weight: "bold")[Mắc bệnh $B$ ⬅],
        [$0","001$],
        [$0","99$],
        text(fill: rgb("C0392B"), weight: "bold")[$0","00099$],

        [Không bệnh $overline(B)$ (dương giả)], [$0","999$], [$0","01$], [*$0","00999$*],
        [*Tổng $P(+)$*], [], [], [*$0","01098$*],
      )
    ]

    *Bước 3: Áp dụng Bayes.*
    $ P(B|+) = 0","00099 / 0","01098 = 99/1098 = 11/122 approx bold(0","0902) $

    #verdict-box[
      *Kết quả gây sốc:* Dù xét nghiệm cực kỳ chính xác ($99\%$), xác suất thực sự mắc bệnh khi dương tính chỉ khoảng $bold(9\%)$!

      *Trực giác hóa:* Trong $1.000.000$ người, chỉ $1.000$ người có bệnh. Xét nghiệm bắt đúng $990$ người bệnh. Nhưng $999.000$ người khỏe mạnh có $1\%$ dương tính giả = $9.990$ người. Tổng dương tính = $10.980$ người, nhưng chỉ $990$ người thật sự có bệnh → Xác suất $= 990/10.980 approx 9\%$.

      *Bài học Bayes:* Khi bệnh rất hiếm (prior thấp), kể cả xét nghiệm rất tốt vẫn tạo ra nhiều dương tính giả hơn dương tính thật. Đây là lý do y học yêu cầu xét nghiệm xác nhận lần 2!
    ]
  ],
)

== Vụ 6 — "Sát Thủ Bí Ẩn" (Nhiều Manh Mối — Bayes Tuần Tự vs Naive Bayes)

#tln(
  id: "BAYES-VU6",
  [
    Một vụ ám sát có $2$ nghi phạm chính: $X$ và $Y$. Ban đầu không có bằng chứng, $P(X) = P(Y) = 0","5$. Đội điều tra tìm thấy $3$ manh mối *độc lập* (khi biết hung thủ):
    - *Manh mối $M_1$:* Lông chó tại hiện trường. $P(M_1|X) = 0","8$; $P(M_1|Y) = 0","2$.
    - *Manh mối $M_2$:* Dấu giày cỡ 44. $P(M_2|X) = 0","3$; $P(M_2|Y) = 0","9$.
    - *Manh mối $M_3$:* Mùi nước hoa đặc trưng. $P(M_3|X) = 0","6$; $P(M_3|Y) = 0","4$.

    (a) Dùng Bayes tuần tự: tính $P(X|M_1)$ sau manh mối 1, sau đó tính $P(X|M_1, M_2, M_3)$ sau cả ba manh mối.

    (b) Dùng Naive Bayes gộp: tính trực tiếp $P(X|M_1, M_2, M_3)$ và so sánh kết quả với (a).
  ],
  [
    (a) $P(X|M_1) = 0","8$; $P(X|M_1,M_2,M_3) = 2/3 approx 0","6667$
    (b) Cho kết quả bằng (a) — Xác nhận tính đúng đắn.
  ],
  loigiai: [
    #ppgiai[
      *Tính chất quan trọng:* Bayes tuần tự và Naive Bayes gộp cho kết quả *giống hệt nhau* khi các bằng chứng độc lập có điều kiện. Đây là cơ sở lý thuyết của thuật toán Naive Bayes trong AI.
    ]

    === (a) Bayes Tuần Tự — Cập Nhật Từng Manh Mối.

    *Vòng 1 — Sau Manh mối $M_1$ (lông chó):*

    Prior: $P(X) = P(Y) = 0","5$.

    Tích nhánh: $0","5 times 0","8 = 0","4$ và $0","5 times 0","2 = 0","1$. Tổng $= 0","5$.
    $ P(X|M_1) = 0","4/0","5 = bold(0","8) quad quad P(Y|M_1) = 0","1/0","5 = 0","2 $

    *Vòng 2 — Sau Manh mối $M_2$ (giày cỡ 44):*

    Prior mới: $P(X) = 0","8$, $P(Y) = 0","2$.

    Tích nhánh: $0","8 times 0","3 = 0","24$ và $0","2 times 0","9 = 0","18$. Tổng $= 0","42$.
    $ P(X|M_1, M_2) = 0","24/0","42 = 4/7 approx 0","5714 $

    *Vòng 3 — Sau Manh mối $M_3$ (nước hoa):*

    Prior mới: $P(X) = 4/7$, $P(Y) = 3/7$.

    Tích nhánh: $4/7 times 0","6 = 12/35$ và $3/7 times 0","4 = 6/35$. Tổng $= 18/35$.
    $ P(X|M_1,M_2,M_3) = (12/35)/(18/35) = 12/18 = bold(2/3 approx 0","6667) $

    === (b) Naive Bayes Gộp — Kết Hợp Toàn Bộ Cùng Lúc.

    Đặt $E = M_1 sect M_2 sect M_3$. Vì độc lập có điều kiện:
    $
      P(E|X) & = 0","8 times 0","3 times 0","6 = bold(0","144) \
      P(E|Y) & = 0","2 times 0","9 times 0","4 = bold(0","072)
    $

    Prior: $P(X) = P(Y) = 0","5$. Tích nhánh: $0","5 times 0","144 = 0","072$ và $0","5 times 0","072 = 0","036$.
    $ P(E) = 0","072 + 0","036 = 0","108 $
    $ P(X|E) = 0","072/0","108 = 72/108 = bold(2/3 approx 0","6667) checkmark $

    #verdict-box[
      *Kết quả hai phương pháp khớp hoàn toàn* ($P(X | E) = 2/3$). Điều này xác nhận: khi bằng chứng độc lập có điều kiện, thứ tự cập nhật không quan trọng, và gộp tất cả cùng lúc cho kết quả chính xác.

      *Hành trình qua 3 manh mối:* $X$ bắt đầu ở $50\%$, tăng lên $80\%$ (lông chó ủng hộ mạnh), giảm xuống $57\%$ (giày cỡ 44 gợi $Y$), rồi tăng lên $67\%$ (nước hoa gợi $X$ nhẹ). *Bayes cân bằng mọi bằng chứng một cách tối ưu.*
    ]
  ],
)

== Vụ 7 — "Mật Mã ADN" (Bốn Nghi Phạm — Loại Trừ và Tổng Hợp Bằng Chứng)

#tln(
  id: "BAYES-VU7",
  [
    Bốn nghi phạm $A$, $B$, $C$, $D$ ban đầu bị nghi ngang nhau: $P(A) = P(B) = P(C) = P(D) = 1/4$.

    *Bằng chứng 1 — ADN hiện trường:* $C$ và $D$ bị loại hoàn toàn ($P("ADN"|C) = P("ADN"|D) = 0$). Với $A$ và $B$: $P("ADN"|A) = 0","6$, $P("ADN"|B) = 0","8$.

    *Bằng chứng 2 — Dấu vân tay:* Độc lập với ADN khi biết hung thủ. $P("VT"|A) = 0","7$, $P("VT"|B) = 0","3$.

    Tính xác suất nghi phạm $A$ là hung thủ sau cả hai bằng chứng. (Kết quả dưới dạng phân số và thập phân bốn chữ số).
  ],
  [$P(A | "ADN", "VT") = 7/11 approx 0","6364$],
  loigiai: [
    #ppgiai[
      Vì $C$ và $D$ bị loại hoàn toàn ($P(E|C) = P(E|D) = 0$), tích nhánh của họ bằng $0$ và tự động biến mất. Gộp hai bằng chứng bằng Naive Bayes rồi áp dụng Bayes thông thường.
    ]

    *Bước 1: Tính likelihood tổng hợp (Naive Bayes — hai bằng chứng độc lập có điều kiện).*

    Đặt $E = "ADN" sect "VT"$:
    $
      P(E|A) & = 0","6 times 0","7 = bold(0","42) \
      P(E|B) & = 0","8 times 0","3 = bold(0","24) \
      P(E|C) & = 0; quad P(E|D) = 0
    $

    *Bước 2: Bảng tích nhánh và xác suất toàn phần.*

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + gray,
        fill: (x, y) => if y == 0 { rgb("0D1B2A") } else if y == 5 { crime-gold.lighten(80%) } else if y == 3
          or y == 4 { rgb("F2F3F4") } else { white },
        table.header(
          text(fill: white, weight: "bold")[Nghi phạm],
          text(fill: white, weight: "bold")[Prior $P(dot)$],
          text(fill: white, weight: "bold")[Likelihood $P(E|dot)$],
          text(fill: white, weight: "bold")[Tích nhánh],
        ),
        text(fill: rgb("C0392B"), weight: "bold")[$A$ ⬅],
        [$1/4$],
        [$0","42$],
        text(fill: rgb("C0392B"), weight: "bold")[*$0","105$*],

        text(fill: rgb("1B4F72"), weight: "bold")[$B$], [$1/4$], [$0","24$], [*$0","060$*],
        text(fill: gray)[$C$ (loại)], text(fill: gray)[$1/4$], text(fill: gray)[$0$], text(fill: gray)[*$0$*],
        text(fill: gray)[$D$ (loại)], text(fill: gray)[$1/4$], text(fill: gray)[$0$], text(fill: gray)[*$0$*],
        [*Tổng $P(E)$*], [], [], [*$0","165$*],
      )
    ]

    *Bước 3: Áp dụng Bayes.*
    $ P(A|E) = 0","105 / 0","165 = 105/165 = 21/33 = bold(7/11 approx 0","6364) $

    #verdict-box[
      ADN ủng hộ $B$ mạnh hơn ($0","8 > 0","6$), nhưng vân tay ủng hộ $A$ rõ ràng hơn ($0","7 > 0","3$). Tổng hợp hai chiều, $A$ thắng thế với $7/11 approx 64\%$ — *vân tay là bằng chứng quyết định*.

      *Kỹ thuật quan trọng:* Khi $C$ và $D$ bị loại hoàn toàn, không cần xử lý thêm — tích nhánh bằng $0$ nên chúng tự biến mất khỏi mẫu số của Bayes.
    ]
  ],
)

== Vụ 8 — "Trò Chơi Tử Thần" (Nghịch Lý Monty Hall — Bayes Lý Giải)

#tln(
  id: "BAYES-VU8",
  [
    Thám tử bị tên tội phạm bẫy vào một trò chơi sinh tử: $3$ cánh cửa $A$, $B$, $C$. Đúng *một* cửa dẫn đến lối thoát. Thám tử chọn *Cửa A*.

    Tên tội phạm — *biết cửa nào có lối thoát* — mở *Cửa C* và cho thấy Cửa C trống. Hắn hỏi: _"Anh có muốn đổi sang Cửa B không?"_

    Quy tắc: Nếu thám tử đã chọn đúng cửa có lối thoát, tên tội phạm chọn ngẫu nhiên một trong hai cửa còn lại để mở.

    (a) Dùng định lý Bayes, tính $P("Thoát ở" A | "Mở C")$ và $P("Thoát ở" B | "Mở C")$.

    (b) Thám tử nên đổi hay không đổi? Tại sao?
  ],
  [
    (a) $P(T_A | O_C) = 1/3$; $quad P(T_B | O_C) = 2/3$

    (b) *Nên đổi* — xác suất thoát tăng gấp đôi từ $1/3$ lên $2/3$.
  ],
  loigiai: [
    #ppgiai[
      Đây là bài toán *Monty Hall* — một trong những nghịch lý xác suất nổi tiếng nhất thế giới. Hầu hết mọi người (kể cả nhiều nhà toán học) ban đầu trả lời sai: _"50-50, đổi hay không cũng vậy."_ Bayes chứng minh điều đó sai.
    ]

    *Bước 1: Đặt biến cố.*

    - $T_A, T_B, T_C$: lối thoát ở Cửa $A$, $B$, $C$. Prior: $P(T_A) = P(T_B) = P(T_C) = 1/3$.
    - $O_C$: tên tội phạm mở Cửa C.

    *Bước 2: Tính $P(O_C | T_dot)$ cho từng trường hợp.*

    - *Lối thoát ở $A$:* Tên tội phạm có thể mở B hoặc C tùy ý → $P(O_C | T_A) = 1/2$.
    - *Lối thoát ở $B$:* Không thể mở A (thám tử đang chọn) hay B (có chìa). Bắt buộc mở C → $P(O_C | T_B) = 1$.
    - *Lối thoát ở $C$:* Không thể mở C (có chìa). Bắt buộc mở B → $P(O_C | T_C) = 0$.

    *Bước 3: Bảng tích nhánh.*

    #align(center)[
      #table(
        columns: (auto, auto, auto, auto),
        align: center,
        stroke: 0.5pt + gray,
        fill: (x, y) => if y == 0 { rgb("1B4F72") } else if y == 2 { crime-teal.lighten(80%) } else { white },
        table.header(
          text(fill: white, weight: "bold")[Lối thoát ở],
          text(fill: white, weight: "bold")[Prior],
          text(fill: white, weight: "bold")[$P(O_C | T_dot)$],
          text(fill: white, weight: "bold")[Tích nhánh],
        ),
        [$T_A$ (không đổi)], [$1/3$], [$1/2$], [*$1/6$*],
        text(fill: crime-teal, weight: "bold")[$T_B$ (nên đổi) ⬅],
        [$1/3$],
        [$1$],
        text(fill: crime-teal, weight: "bold")[*$1/3$*],

        text(fill: gray)[$T_C$ (đã loại)], text(fill: gray)[$1/3$], text(fill: gray)[$0$], text(fill: gray)[*$0$*],
        [*Tổng $P(O_C)$*], [], [], [*$1/2$*],
      )
    ]

    *Bước 4: Áp dụng Bayes.*
    $
      P(T_A | O_C) = (1/6) / (1/2) = bold(1/3)
      quad quad
      P(T_B | O_C) = (1/3) / (1/2) = bold(2/3)
    $
    Kiểm tra: $1/3 + 2/3 + 0 = 1$ ✓

    #verdict-box[
      *Kết luận: Nhất định nên đổi sang Cửa B!* Xác suất thoát tăng gấp đôi từ $1/3$ lên $2/3$.

      *Trực giác hóa:* Ban đầu, lối thoát ở B hoặc C với xác suất $2/3$. Khi tên tội phạm mở C (và C trống), nó không tiết lộ gì về A — nhưng *toàn bộ $2/3$ xác suất "dồn" sang B*. Cửa A không đổi vì thám tử chọn A trước khi có thông tin.

      *Bài học Bayes:* Kẻ có đầy đủ thông tin tiết lộ thông tin gián tiếp khi hành động. Bayes giúp khai thác triệt để điều đó.
    ]
  ],
)

// ═══════════════════════════════════════════════
// PHẦN III — TỰ LUYỆN
// ═══════════════════════════════════════════════
= III. Bài Tập Tự Luyện — Rèn Kỹ Năng Phá Án

#tln(
  id: "TL-01",
  [*(Lọc thư rác — Ứng dụng AI)* Hệ thống lọc email phân loại: *Thư rác (S)* chiếm $30\%$, *Thư thường (H)* chiếm $70\%$. Từ khóa "Khuyến mãi" xuất hiện với xác suất $P(K|S) = 0","85$ và $P(K|H) = 0","10$. Một email có từ "Khuyến mãi". Tính xác suất đây là thư rác. (Làm tròn đến bốn chữ số thập phân).],
  [$approx 0","7846$],
  loigiai: [
    Tích nhánh: $0","3 times 0","85 = 0","255$; $0","7 times 0","10 = 0","07$.
    $ P(K) = 0","255 + 0","07 = 0","325 $
    $ P(S|K) = 0","255 / 0","325 = 51/65 approx bold(0","7846) $
  ],
)

#tln(
  id: "TL-02",
  [*(Sản xuất công nghiệp — 3 dây chuyền)* Nhà máy có $3$ dây chuyền: *DC1* sản xuất $50\%$, *DC2* sản xuất $30\%$, *DC3* sản xuất $20\%$ tổng sản phẩm. Tỉ lệ lỗi lần lượt là $1\%$, $2\%$, $3\%$. Lấy ngẫu nhiên một sản phẩm lỗi — tính xác suất đây là sản phẩm của DC3. (Làm tròn đến bốn chữ số thập phân).],
  [$approx 0","3529$],
  loigiai: [
    Tích nhánh: $0","5 times 0","01 = 0","005$; $0","3 times 0","02 = 0","006$; $0","2 times 0","03 = 0","006$.
    $ P(F) = 0","005 + 0","006 + 0","006 = 0","017 $
    $ P("DC"_3|F) = 0","006 / 0","017 = 6/17 approx bold(0","3529) $
  ],
)

#tln(
  id: "TL-03",
  [*(Giả thuyết khoa học — Thiên thạch)* Hai giả thuyết về nguồn gốc thiên thạch. $G_1$ (vành đai tiểu hành tinh): prior $70\%$. $G_2$ (ngoài hệ mặt trời): prior $30\%$. Phân tích hóa học tìm thấy nguyên tố hiếm $X$: $P(X|G_1) = 0","15$, $P(X|G_2) = 0","70$. Tính xác suất thiên thạch đến từ ngoài hệ mặt trời. (Làm tròn đến bốn chữ số thập phân).],
  [$approx 0","6667$],
  loigiai: [
    Tích nhánh: $0","7 times 0","15 = 0","105$; $0","3 times 0","70 = 0","210$.
    $ P(X) = 0","105 + 0","210 = 0","315 $
    $ P(G_2|X) = 0","210 / 0","315 = 2/3 approx bold(0","6667) $
    *Nhận xét:* Dù prior $G_1$ cao gấp đôi ($70\%$ vs $30\%$), bằng chứng mạnh từ nguyên tố $X$ đã đảo ngược hoàn toàn bảng tình nghi — $G_2$ chiếm ưu thế $67\%$ sau phân tích.
  ],
)

#tln(
  id: "TL-04",
  [*(Toán ngược — Tìm $x$)* Hai hộp bi. Hộp I có $x$ bi đỏ và $3$ bi trắng. Hộp II có $5$ bi đỏ và $2$ bi trắng. Gieo xúc xắc cân đối: mặt $1, 2$ chọn Hộp I; mặt $3, 4, 5, 6$ chọn Hộp II. Lấy $1$ bi từ hộp được chọn thì thấy bi đỏ. Biết xác suất bi đỏ này thuộc Hộp I là $7/27$. Tìm $x$.],
  [$x = 3$],
  loigiai: [
    Xác suất chọn hộp: $P(H_1) = 1/3$; $P(H_2) = 2/3$.
    Xác suất bi đỏ từ mỗi hộp: $P(D|H_1) = x/(x+3)$; $P(D|H_2) = 5/7$.

    Áp dụng Bayes $P(H_1|D) = 7/27$:
    $ ((1/3) dot x/(x+3)) / ((1/3) dot x/(x+3) + (2/3) dot 5/7) = 7/27 $

    Triệt tiêu $1/3$ và đặt $y = x/(x+3)$:
    $ y / (y + 10/7) = 7/27 => 27y = 7y + 10 => 20y = 10 => y = 1/2 $

    Thay lại: $x/(x+3) = 1/2 => 2x = x + 3 => x = 3$.
  ],
)

#tln(
  id: "TL-05",
  [*(Bảo hiểm xe hơi — 3 phân khúc khách hàng)* Công ty bảo hiểm phân loại: *Nhóm A* (cẩn thận): $50\%$ khách hàng, tỉ lệ tai nạn $4\%$/năm. *Nhóm B* (bình thường): $30\%$, tỉ lệ tai nạn $10\%$. *Nhóm C* (lái ẩu): $20\%$, tỉ lệ tai nạn $25\%$. Một khách hàng vừa báo cáo tai nạn — tính xác suất người này thuộc *Nhóm C*. (Làm tròn đến bốn chữ số thập phân).],
  [$P(C|T) = 0","5000$],
  loigiai: [
    Tích nhánh: $0","5 times 0","04 = 0","020$; $0","3 times 0","10 = 0","030$; $0","2 times 0","25 = 0","050$.
    $ P(T) = 0","020 + 0","030 + 0","050 = 0","100 $
    $ P(C|T) = 0","050 / 0","100 = bold(1/2 = 0","5000) $
    *Nhận xét:* Dù Nhóm C chỉ chiếm $20\%$ khách hàng, họ đóng góp đúng $50\%$ số tai nạn — do tỉ lệ tai nạn cao gấp $6","25$ lần Nhóm A.
  ],
)

#tln(
  id: "TL-06",
  [*(Đồng xu gian — Xác thực nguồn gốc)* Một hộp có $4$ đồng xu: $3$ đồng thường (một mặt Sấp, một mặt Ngửa) và $1$ đồng xu gian (cả hai mặt đều là Ngửa). Chọn ngẫu nhiên $1$ đồng xu, tung và thấy mặt *Ngửa*. Tính xác suất đồng xu được chọn là *đồng xu gian*. (Kết quả dưới dạng phân số chính xác và thập phân bốn chữ số).],
  [$P("Gian" | "Ngửa") = 2/5 = 0","4000$],
  loigiai: [
    Gọi $"Th"$ = chọn đồng thường, $G$ = chọn đồng gian, $N$ = tung ra Ngửa.
    $P("Th") = 3/4$; $P(G) = 1/4$; $P(N|"Th") = 1/2$; $P(N|G) = 1$.
    Tích nhánh: $3/4 times 1/2 = 3/8$; $quad 1/4 times 1 = 2/8$.
    $ P(N) = 3/8 + 2/8 = 5/8 $
    $ P(G|N) = (2/8) / (5/8) = 2/5 = bold(0","4000) $
    *Nhận xét:* Dù đồng xu gian chỉ chiếm $25\%$ ban đầu, sau khi quan sát mặt Ngửa khả năng đó tăng lên $40\%$ — bằng chứng Ngửa "hé lộ" sự hiện diện của đồng xu gian.
  ],
)

// ═══════════════════════════════════════════════
// PHẦN IV — KỸ THUẬT VÀ TỔNG KẾT
// ═══════════════════════════════════════════════
= IV. Kỹ Thuật Giải Nhanh & Tổng Kết

#detective-box[
  *🎯 Quy Trình 4 Bước Giải Mọi Bài Bayes:*

  #text(fill: crime-gold, weight: "bold")[Bước 1 — Xây sơ đồ cây:] Xác định các "nguyên nhân" (giả thuyết/hung thủ) và biến cố "kết quả" (bằng chứng).

  #text(fill: crime-gold, weight: "bold")[Bước 2 — Điền xác suất:] Xác suất tiên nghiệm ở tầng 1. Xác suất điều kiện ở tầng 2.

  #text(fill: crime-gold, weight: "bold")[Bước 3 — Tính tích nhánh:] Nhân xác suất tiên nghiệm với xác suất điều kiện. Cộng tất cả tích lại = $P("bằng chứng")$.

  #text(fill: crime-gold, weight: "bold")[Bước 4 — Chia lấy kết quả:]
  $ P("nguyên nhân"|"bằng chứng") = "Tích nhánh quan tâm" / "Tổng tất cả tích nhánh" $

  #v(0.8em)

  *🧠 Nguyên lý Naive Bayes — Khi có nhiều bằng chứng độc lập:*

  Gộp tất cả $M_1, M_2, dots.c, M_k$ thành $E$, áp dụng:
  $ P(E|A_j) = P(M_1|A_j) dot P(M_2|A_j) dot dots.c dot P(M_k|A_j) $
  Rồi dùng Bayes thông thường với $E$. Kết quả *hoàn toàn giống* Bayes tuần tự.

  #v(0.8em)

  *⚡ Thủ Thuật So Sánh Nhanh:*

  Để so sánh $P(A_1|E)$ vs $P(A_2|E)$ *mà không cần số cụ thể*, ta chỉ cần so sánh:
  $ P(A_1) dot P(E|A_1) quad "vs" quad P(A_2) dot P(E|A_2) $
  (Vì cả hai chia cùng mẫu số $P(E)$, nhánh nào lớn hơn → xác suất cao hơn.)
]

#v(0.5em)

#clue-box(title: "⚖️ Ba Bẫy Tư Duy Phổ Biến Khi Giải Bài Bayes")[
  *Bẫy 1 — Bỏ qua Prior (Base Rate Neglect):*

  "Xét nghiệm đúng $99\%$ → Dương tính thì mắc bệnh $99\%$?" ❌ Sai! Phải nhân với prior $P(B)$ trước. Nếu bệnh chỉ gặp ở $0","1\%$ dân số, xác suất thực tế có thể chỉ là $9\%$.

  #v(0.3em)
  *Bẫy 2 — Đảo ngược Xác suất:*

  Nhầm $P(B|A)$ với $P(A|B)$. "Hung thủ để lại dấu vân tay xác suất $60\%$" ≠ "Tìm dấu vân tay thì người đó là hung thủ với $60\%$". Phải dùng Bayes để lật ngược chiều.

  #v(0.3em)
  *Bẫy 3 — Quên điều kiện độc lập:*

  "Hai manh mối độc lập" ≠ "Hai manh mối độc lập *có điều kiện* khi biết hung thủ". Đề bài phải nói rõ "khi biết ai là hung thủ, hai manh mối độc lập nhau" thì mới được nhân hai xác suất. Thiếu điều kiện này → *không được dùng Naive Bayes*.
]

#v(0.5em)

#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1A2F4A"), angle: 135deg),
    stroke: 1.5pt + crime-gold,
    radius: 8pt,
    inset: (x: 16pt, y: 14pt),
  )[
    #text(fill: crime-gold, size: 12pt, weight: "bold")[📋 Bảng Tổng Kết — Nhận Diện Dạng Bài]
    #v(0.6em)
    #table(
      columns: (2.5fr, 3fr, 2fr),
      align: (left, left, center),
      stroke: 0.5pt + crime-gold.lighten(50%),
      fill: (x, y) => if y == 0 { crime-gold.lighten(10%).darken(40%) } else if calc.odd(y) { rgb("0D1B2A") } else {
        rgb("1A2F4A")
      },
      table.header(
        text(fill: crime-gold, weight: "bold")[Dạng bài],
        text(fill: crime-gold, weight: "bold")[Nhận dạng],
        text(fill: crime-gold, weight: "bold")[Công thức],
      ),
      text(fill: white)[XS có điều kiện],
      text(fill: rgb("AED6F1"))["Biết $B$ đã xảy ra, tính $P(A)$"],
      text(fill: crime-gold)[$P(A|B) = P(A sect B)/P(B)$],

      text(fill: white)[XS toàn phần],
      text(fill: rgb("AED6F1"))[Có nhiều nguyên nhân, tính XS kết quả],
      text(fill: crime-gold)[$sum P(A_i) dot P(E|A_i)$],

      text(fill: white)[Bayes cơ bản],
      text(fill: rgb("AED6F1"))["Đã biết kết quả, truy nguyên nhân"],
      text(fill: crime-gold)[$P(A_k|E) = "nhánh k" / "tổng"$],

      text(fill: white)[Naive Bayes],
      text(fill: rgb("AED6F1"))[Nhiều bằng chứng độc lập có điều kiện],
      text(fill: crime-gold)[$P(E|A) = product P(M_i|A)$],

      text(fill: white)[Bayes tuần tự],
      text(fill: rgb("AED6F1"))[Cập nhật posterior dùng làm prior mới],
      text(fill: crime-gold)[Lặp Bayes từng bước],

      text(fill: white)[Bất phương trình],
      text(fill: rgb("AED6F1"))["Tìm $x$ để $P(A|E) <= k$"],
      text(fill: crime-gold)[Giải BPT sau khi lập Bayes],
    )
  ]
]
