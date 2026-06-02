#import "../sang-exam.typ": *
#import "../template.typ": *
#import "@preview/cetz:0.5.2"
#import "../bbt.typ": *

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("0D1B6E"), rgb("1A237E"), rgb("1565C0"), angle: 135deg),
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
  stroke: (left: 4pt + rgb("1565C0")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("1565C0"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("0D47A1"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Bảng màu ──────────────────────────────────
#let ink-navy = rgb("1A237E")
#let ink-blue = rgb("1565C0")
#let ink-amber = rgb("E65100")
#let ink-green = rgb("2E7D32")
#let ink-red = rgb("B71C1C")
#let ink-gold = rgb("F57F17")
#let ink-teal = rgb("00695C")
#let ink-purple = rgb("6A1B9A")

// ─── Hộp components ─────────────────────────────
#let theory-box(title: none, body) = block(
  fill: rgb("E8EAF6"),
  stroke: (left: 5pt + ink-navy, rest: 0.8pt + rgb("9FA8DA")),
  radius: (right: 8pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[
  #if title != none [#text(fill: ink-navy, weight: "bold", size: 11pt)[#title]#v(0.4em)]
  #body
]
#let formula-box(body) = block(
  fill: rgb("E3F2FD"),
  stroke: (left: 4pt + ink-blue, rest: 0.7pt + rgb("90CAF9")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[#body]
#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + ink-gold, rest: 0.6pt + rgb("FFE082")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: ink-gold, weight: "bold")[#title]#v(0.3em)#body]
#let ans-box(body) = block(
  fill: rgb("F1F8E9"),
  stroke: (left: 4pt + ink-green, rest: 0.6pt + rgb("A5D6A7")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: ink-green, weight: "bold")[✅ Kết Luận]#v(0.3em)#body]
#let warn-box(body) = block(
  fill: rgb("FFEBEE"),
  stroke: (left: 4pt + ink-red, rest: 0.6pt + rgb("EF9A9A")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[#text(fill: ink-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]#v(0.3em)#body]
#let model-box(title: "🏭 Mô Hình", body) = block(
  fill: rgb("E0F2F1"),
  stroke: (left: 4pt + ink-teal, rest: 0.6pt + rgb("80CBC4")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[#text(fill: ink-teal, weight: "bold")[#title]#v(0.4em)#body]
#let purple-box(title: "💜", body) = block(
  fill: rgb("F3E5F5"),
  stroke: (left: 4pt + ink-purple, rest: 0.6pt + rgb("CE93D8")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[#text(fill: ink-purple, weight: "bold")[#title]#v(0.4em)#body]

#let route-box(title: "🧭 Cách Nghĩ Chậm", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + ink-amber, rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 7pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[#text(fill: ink-amber, weight: "bold")[#title]#v(0.4em)#body]

// ─── Wrapper cho TN tự gắn đáp án đúng ──────────────────
#let tn-auto(
  stem,
  correct,
  wrongs: (),
  correct-pos: 1,
  loigiai: none,
  id: none,
  ..args,
) = {
  let opts = ()
  let wi = 0
  for i in range(4) {
    if i + 1 == correct-pos {
      opts.push(True(correct))
    } else {
      opts.push(False(wrongs.at(wi)))
      wi += 1
    }
  }
  tn(
    stem,
    opts,
    loigiai: loigiai,
    id: id,
    ..args.named(),
  )
}


// ══════════════════════════════════════════════════
// TRANG BÌA
// ══════════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("050E4A"), rgb("0D1B6E"), rgb("1A237E"), rgb("1565C0"), angle: 135deg),
    inset: (x: 2cm, y: 1.4cm),
    radius: 14pt,
  )[
    #text(fill: rgb("C5CAE9"), size: 11pt, weight: "bold")[CHUYÊN ĐỀ ỨNG DỤNG ĐẠO HÀM — CỰC TRỊ]
    #v(0.4em)
    #text(fill: white, size: 22pt, weight: "black")[Bài Toán Tối Ưu Hóa Sản Xuất]
    #v(0.25em)
    #text(fill: rgb("BBDEFB"), size: 13pt)[Nhân Lực · Năng Suất · Phế Phẩm · Cực Trị Biên]
    #v(0.9em)
    #line(length: 65%, stroke: 1.2pt + rgb("5C6BC0"))
    #v(0.7em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: center,
      text(fill: rgb("C5CAE9"), size: 9.5pt)[*Cấp độ:* THPTQG],
      text(fill: rgb("C5CAE9"), size: 9.5pt)[*Dạng:* TN · DS · TLN],
      text(fill: rgb("C5CAE9"), size: 9.5pt)[*Phương pháp:* Cách 1+2],
      text(fill: rgb("C5CAE9"), size: 9.5pt)[*Mở rộng:* Đa lĩnh vực],
    )
  ]
]

#v(1.4em)

// ══════════════════════════════════════════════════
// SECTION 0: ĐỀ BÀI VÀ MÔ HÌNH HÓA
// ══════════════════════════════════════════════════
= Đề Bài Gốc và Mô Hình Hóa

== Đề Bài — Nhà Máy Z

#theory-box(title: "📋 Câu 5 — Dạng Thi THPTQG")[
  Theo thống kê tại nhà máy $Z$: tuần làm việc *40 giờ* → *100 tổ công nhân*, mỗi tổ đạt *120 sản phẩm/giờ*. Nếu tăng thêm $2$ giờ/tuần thì *1 tổ nghỉ việc* và *năng suất giảm 5 sp/tổ/giờ*. Số phế phẩm ước tính:
  $
    P(x) = frac(95x^2 + 120x, 4) quad (x "là số giờ làm/tuần")
  $
  Hỏi: áp dụng mấy giờ/tuần để *số sản phẩm thu được lớn nhất*?
]

#v(0.6em)

== Bảng Phân Tích — Lập Hàm Theo Hai Cách

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  [
    #model-box(title: "⚙️ Cách 1 — Đặt x = số giờ/tuần")[
      Khi $x >= 40$, tăng $(x-40)$ giờ so với chuẩn:

      $
        T(x) = 100 - frac(x-40, 2) = 120 - frac(x, 2)
      $
      $
        N(x) = 120 - 5 dot frac(x-40, 2) = 220 - frac(5x, 2)
      $

      Miền: $220 - 5x/2 > 0 => x < 88$

      *Miền xác định:* $x in [40, 88)$

      $
        Q(x) = x dot T(x) dot N(x) - P(x)
      $
    ]
  ],
  [
    #purple-box(title: "🔵 Cách 2 — Đặt n = số lần tăng 2 giờ")[
      $n = 0, 1, 2, dots$ là *số lần tăng thêm 2 giờ*.

      | Đại lượng | Biểu thức |
      |-----------|-----------|
      | Số giờ/tuần | $40 + 2n$ |
      | Số tổ | $100 - n$ |
      | Năng suất (sp/tổ/giờ) | $120 - 5n$ |

      Điều kiện: $n >= 0$, $100-n > 0$, $120-5n > 0$

      *$=> 0 <= n <= 23$ (n nguyên)*

      $
        Q(n) = (40+2n)(100-n)(120-5n) - P(40+2n)
      $
    ]
  ],
)

#note-box(title: "💡 So Sánh Hai Cách")[
  - *Cách 1* (biến $x$): phù hợp khi đề cho $P(x)$ sẵn theo $x$ — tính đạo hàm liên tục.
  - *Cách 2* (biến $n$): trực quan hơn, dễ lập bảng giá trị, phù hợp kiểm tra số học nhanh.
  - Cả hai cho *cùng kết quả* — chọn cách nào tùy sở thích!
]

#route-box(title: "🧭 Cách Đi Từ Đề Gốc Đến Hàm Q")[
  - Đừng bắt đầu bằng đa thức $Q$ ngay. Hãy bắt đầu bằng câu hỏi: *mỗi lần điều chỉnh thì số giờ, số tổ, năng suất thay đổi ra sao?*
  - Viết riêng từng đại lượng thành một dòng: số giờ, số tổ, năng suất, phế phẩm.
  - Chỉ khi các dòng này đã rõ, mới ghép thành *sản phẩm thô* rồi trừ *phế phẩm* để ra $Q$.
  - Cách trình bày này dài hơn một chút nhưng học sinh rất dễ bám, ít lập sai mô hình.
]

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION I: GIẢI THEO CÁCH 1 (Biến x — Gọn Nhẹ)
// ══════════════════════════════════════════════════
= Cách 1 — Giải Theo Biến $x$ (Rút Gọn, Trực Tiếp)

== Lập Hàm và Đạo Hàm

#theory-box(title: "⚡ Khai Triển Nhanh")[
  *Tổng thô:*
  $
    Q_0(x) = x dot (120 - x/2)(220 - 5x/2)
    = x(26400 - 410x + frac(5x^2, 4))
    = frac(5x^3, 4) - 410x^2 + 26400x
  $

  *Trừ phế phẩm* $P(x) = frac(95x^2 + 120x, 4) = frac(95x^2, 4) + 30x$:
  $
    Q(x) = frac(5x^3, 4) - 410x^2 + 26400x - frac(95x^2, 4) - 30x
  $

  #formula-box[
    $
      Q(x) = frac(5, 4)x^3 - frac(1735, 4)x^2 + 26370x, quad x in [40, 88)
    $
  ]

  *Đạo hàm* (nhân $4$ để gọn):
  $
    Q'(x) = frac(15x^2 - 3470x + 105480, 4)
  $

  Giải $Q'(x) = 0 <=> 15x^2 - 3470x + 105480 = 0$ (chia $5$): $3x^2 - 694x + 21096 = 0$

  $
    Delta = 694^2 - 4 dot 3 dot 21096 = 481636 - 253152 = 228484 = 478^2
  $
  $
    x_1 = frac(694 - 478, 6) = 36 quad "(" < 40 ")" , quad
    x_2 = frac(694 + 478, 6) = frac(586, 3) approx 195","3 quad "(" > 88 ")"
  $

  *Cả hai nghiệm đều nằm ngoài miền $[40, 88)$!*
]

== Bảng Biến Thiên và Kết Luận

#align(center)[
  #bbbt(
    var: $x$,
    der: $Q'(x)$,
    func: $Q(x)$,
    x-vals: ($40$, $88$),
    d-signs: ($-$,),
    v-vals: ($440800$, $-186560$),
  )
]

#v(0.3em)

*Lưu ý:* BBT được vẽ trên đoạn kéo dài $[40, 88]$ để thể hiện chiều biến thiên; miền hợp lệ thực tế của bài toán vẫn là $[40, 88)$.

*Giải thích dấu:* Vì toàn bộ miền hợp lệ nằm giữa hai nghiệm $36$ và $586/3$, nên $Q'(x) < 0$ trên toàn miền.

$=> Q(x)$ *giảm đơn điệu* trên $[40, 88)$ $=>$ Max tại $x = 40$.

#v(0.4em)

*Tính $Q(40)$:*
$
  Q(40) = 100 times 120 times 40 - frac(95 dot 1600 + 120 dot 40, 4)
  = 480000 - frac(156800, 4) = 480000 - 39200 = 440800
$

#ans-box[
  Nhà máy nên duy trì *tuần làm việc 40 giờ* (giữ nguyên chuẩn).

  Số sản phẩm thu được tối đa: *$Q_max = 440\,800$ sản phẩm/tuần*.
]

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION II: GIẢI THEO CÁCH 2 (Biến n — Bảng Số)
// ══════════════════════════════════════════════════
= Cách 2 — Đặt $n$ = Số Lần Tăng 2 Giờ (Trực Quan, Dễ Kiểm)

== Lập Bảng Đại Lượng

#purple-box(title: "🔵 Bảng Mô Hình Theo n")[
  Đặt $n$ = số lần tăng thêm 2 giờ so với chuẩn 40 giờ ($n = 0, 1, 2, ...$).

  #table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 1.5pt + ink-purple) } else { (bottom: 0.4pt + rgb("CE93D8")) },
    inset: (x: 8pt, y: 7pt),
    align: (left, center, center, center, center),
    fill: (x, y) => if y == 0 { rgb("EDE7F6") } else if x == 0 { rgb("F3E5F5") } else { white },
    table.header(
      text(fill: ink-purple, weight: "bold")[Đại lượng],
      text(fill: ink-purple, weight: "bold")[Công thức],
      text(fill: ink-purple, weight: "bold")[$n = 0$ ($x=40$)],
      text(fill: ink-purple, weight: "bold")[$n = 1$ ($x=42$)],
      text(fill: ink-purple, weight: "bold")[$n = 5$ ($x=50$)],
    ),
    [Số giờ/tuần], [$40 + 2n$], [$40$], [$42$], [$50$],
    [Số tổ], [$100 - n$], [$100$], [$99$], [$95$],
    [Năng suất (sp/tổ/giờ)], [$120 - 5n$], [$120$], [$115$], [$95$],
    [Tổng thô (sp)], [$(40+2n)(100-n)(120-5n)$], [$480\,000$], [$478\,170$], [$451\,250$],
    [Phế phẩm $P$], [$frac(95(40+2n)^2+120(40+2n), 4)$], [$39\,200$], [$43\,155$], [$60\,875$],
    [*Q thu được*], [*Thô − Phế*], [*440\,800*], [*435\,015*], [*390\,375*],
  )
]

#v(0.5em)

== Lập Hàm $Q(n)$ và Giải

#theory-box(title: "🔢 Triển Khai Q(n)")[
  $
    Q(n) = (40+2n)(100-n)(120-5n) - P(40+2n)
  $

  Khai triển từng bước:
  $
    (40+2n)(100-n) = 4000 - 40n + 200n - 2n^2 = 4000 + 160n - 2n^2
  $
  $
    (4000 + 160n - 2n^2)(120 - 5n) = 480000 - 20000n + 19200n - 800n^2 - 240n^2 + 10n^3
  $
  $
    = 480000 - 800n + -1040n^2 + 10n^3
  $

  *Tính $P(40+2n)$:* Đặt $x = 40 + 2n$:
  $
    P = frac(95(40+2n)^2 + 120(40+2n), 4)
    = frac(95(1600+160n+4n^2) + 4800+240n, 4)
  $
  $
    = frac(152000 + 15200n + 380n^2 + 4800 + 240n, 4)
    = frac(156800 + 15440n + 380n^2, 4)
    = 39200 + 3860n + 95n^2
  $

  $
    Q(n) = (480000 - 800n - 1040n^2 + 10n^3) - (39200 + 3860n + 95n^2)
  $

  #formula-box[
    $
      Q(n) = 10n^3 - 1135n^2 - 4660n + 440800, quad n in [0, 23]
    $
  ]

  *Đạo hàm* (theo $n$ liên tục):
  $
    Q'(n) = 30n^2 - 2270n - 4660
  $

  Giải $Q'(n) = 0$: $3n^2 - 227n - 466 = 0$

  $
    Delta = 227^2 + 4 dot 3 dot 466 = 51529 + 5592 = 57121 = 239^2
  $
  $
    n_1 = frac(227 - 239, 6) = -2 quad "(< 0, loại)", quad
    n_2 = frac(227 + 239, 6) = frac(466, 6) approx 77","7 quad "(> 23, loại)"
  $
]

#v(0.4em)

#align(center)[
  #bbbt(
    var: $n$,
    der: $Q'(n)$,
    func: $Q(n)$,
    x-vals: ($0$, $23$),
    d-signs: ($-$,),
    v-vals: ($440800$, $-145125$),
  )
]

#v(0.3em)

$Q'(n) < 0$ với mọi $n in [0, 23]$ (cả hai nghiệm nằm ngoài) $=>$ $Q(n)$ giảm $=>$ *Max tại $n = 0$*.

#ans-box[
  $n = 0$ tức là *không tăng giờ*, giữ nguyên 40 giờ/tuần.

  Kết quả trùng khớp Cách 1: *$Q_max = 440\,800$ sp/tuần* ✓

  *Ưu điểm Cách 2:* Bảng số liệu trực quan — ta thấy ngay $Q$ giảm dần theo $n$ mà không cần giải đạo hàm phức tạp. Dùng để kiểm tra nhanh.
]

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION III: LÝ THUYẾT NỀN TẢNG VÀ QUY TRÌNH
// ══════════════════════════════════════════════════
= Lý Thuyết — Quy Trình Chuẩn và Trường Hợp Đặc Biệt

== Quy Trình 4 Bước Rút Gọn

#formula-box[
  #text(fill: ink-blue, weight: "bold", size: 11.5pt)[🔑 Quy Trình Giải Bài Toán Tối Ưu Sản Xuất]
  #v(0.5em)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.7em,
    row-gutter: 0.7em,
    align: (center + top, left + top),
    block(fill: ink-navy, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*1*]],
    [*Lập hàm* — Đặt biến, xác định số tổ, năng suất, phế phẩm; viết $Q =$ Thô $-$ Phế.],

    block(fill: ink-navy, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*2*]],
    [*Tính $Q'$, giải $Q' = 0$* — Tìm nghiệm và so sánh với miền xác định $[a, b]$.],

    block(fill: ink-navy, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*3*]],
    [*Lập BBT* — Xét dấu $Q'$ trên $[a, b]$; xác định hàm tăng/giảm; đọc Max/Min.],

    block(fill: ink-navy, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*4*]],
    [*Tính và kết luận* — $Q(x^*)$ tại điểm tối ưu; kiểm chứng bằng công thức gốc.],
  )
]

#route-box(title: "✍️ Mẫu Lời Giải Dài, Dễ Theo")[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.8em,
    row-gutter: 0.55em,
    block(fill: ink-amber, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*1*]],
    [*Đặt biến bằng lời:* "Gọi $x$ là số lần tăng thêm..." hoặc "Gọi $x$ là số giờ làm việc mỗi tuần".],

    block(fill: ink-amber, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*2*]],
    [*Lập từng đại lượng riêng:* số tổ, năng suất, doanh thu hoặc sản phẩm thô, chi phí/phế phẩm.],

    block(fill: ink-amber, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*3*]],
    [*Ghép thành hàm mục tiêu* rồi ghi rõ miền xác định trước khi đạo hàm.],

    block(fill: ink-amber, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*4*]],
    [*Xét dấu đạo hàm hoặc BBT* và nói thành câu: hàm tăng, hàm giảm, cực đại ở đâu.],

    block(fill: ink-amber, inset: (x: 7pt, y: 5pt), radius: 4pt)[#text(fill: white, weight: "bold")[*5*]],
    [*Kết luận bằng ngôn ngữ thực tế:* nên giữ bao nhiêu giờ, tăng mấy lần, chọn mức giá nào...],
  )
]

#v(0.5em)

== Trường Hợp Đặc Biệt: Nghiệm Ngoài Miền

#warn-box[
  *Bẫy phổ biến:* Khi $Q'(x) = 0$ cho nghiệm nhưng *tất cả đều nằm ngoài $[a,b]$*, nhiều học sinh kết luận sai.

  *Đúng:* Hàm *đơn điệu* trên toàn miền → Max/Min tại biên.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [*Nếu $Q' < 0$ trên $(a,b)$:* $Q$ giảm → Max = $Q(a)$, Min = $Q(b)$],
    [*Nếu $Q' > 0$ trên $(a,b)$:* $Q$ tăng → Max = $Q(b)$, Min = $Q(a)$],
  )

  *Bài Nhà Máy Z:* Nghiệm $x_1=36 < 40$ và $x_2 approx 195 > 88$ → $Q'<0$ trên $[40,88)$ → Max tại $x=40$.
]

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION IV: BÀI TẬP TRẮC NGHIỆM
// ══════════════════════════════════════════════════
= Dạng I — Trắc Nghiệm Nhận Dạng Mô Hình

#note-box(title: "🎯 Cách ra đề nên bám dữ kiện gốc")[
  Đề chuẩn thường *không cho sẵn* ngay đa thức $Q(x)$. Học sinh cần đọc dữ kiện, đặt biến, rồi mới tự lập công thức số tổ, năng suất, sản phẩm thô và phế phẩm.
]

#note-box(title: "⚙️ Auto phương án cho TN")[
  Từ đây có thể dùng `tn-auto`: người soạn chỉ cần khai báo *1 đáp án đúng*, *3 phương án nhiễu* và *vị trí đáp án đúng*.

  Phần *nhiễu* vẫn nên thiết kế thủ công theo các lỗi sai phổ biến của học sinh; không nên auto sinh ngẫu nhiên vì đề sẽ kém chất lượng.
]

#tn-auto(
  id: "1Z-TN1",
  [Nếu nhà máy làm việc $46$ giờ/tuần thì số tổ còn lại và năng suất của mỗi tổ trong một giờ lần lượt là:],
  [$97$ tổ; $105$ sp/tổ/giờ],
  wrongs: (
    [$98$ tổ; $110$ sp/tổ/giờ],
    [$99$ tổ; $110$ sp/tổ/giờ],
    [$97$ tổ; $110$ sp/tổ/giờ],
  ),
  correct-pos: 3,
  loigiai: [
    So với mức chuẩn $40$ giờ/tuần, ta có
    $46 - 40 = 6$ giờ,
    tức là tăng đúng $3$ lần, vì mỗi lần tăng thêm $2$ giờ.

    Khi tăng $3$ lần:
    - số tổ còn lại là $100 - 3 = 97$;
    - năng suất của mỗi tổ còn $120 - 5 dot 3 = 105$ sp/tổ/giờ.

    Vì vậy cặp số đúng phải là *97 tổ; 105 sp/tổ/giờ*.

    #ans-box[Đáp án đúng là *97 tổ; 105 sp/tổ/giờ*.]
  ],
)

#tn-auto(
  id: "1Z-TN2",
  [Nếu đặt $x$ là số giờ làm việc trong tuần, biểu thức nào dưới đây mô tả đúng số sản phẩm thu được sau khi trừ phế phẩm?],
  [$Q(x)=x(120 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4)$],
  wrongs: (
    [$Q(x)=x(100 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4)$],
    [$Q(x)=x(120 - x/2)(120 - 5x/2) - frac(95x^2 + 120x, 4)$],
    [$Q(x)=(120 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4)$],
  ),
  correct-pos: 1,
  loigiai: [
    Cần mô hình hóa theo đúng thứ tự, không ghép công thức ngay từ đầu.

    - Số tổ còn lại là
      $T(x) = 100 - frac(x-40, 2) = 120 - x/2.$
    - Năng suất của mỗi tổ là
      $N(x) = 120 - 5 frac(x-40, 2) = 220 - 5x/2.$
    - Tổng sản phẩm thô là
      $x dot T(x) dot N(x)$.
    - Sau cùng phải trừ phế phẩm $P(x)$.

    Vì vậy biểu thức đúng của hàm sản phẩm thu được là
    $Q(x)=x(120 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4).$

    #ans-box[
      Biểu thức đúng là $Q(x)=x(120 - x/2)(220 - 5x/2) - frac(95x^2 + 120x, 4)$.
    ]
  ],
)

#tn-auto(
  id: "1Z-TN3",
  [Biết $Q'(x)=0$ cho hai nghiệm $x_1 = 36$ và $x_2 = 586/3$. Kết luận nào đúng về phương án tối ưu của nhà máy $Z$?],
  [Nhà máy nên giữ $40$ giờ/tuần vì $Q'(x) < 0$ trên miền hợp lệ],
  wrongs: (
    [$x = 36$ giờ/tuần là tối ưu vì đó là nghiệm của $Q'(x)=0$],
    [$x = 88$ giờ/tuần là tối ưu vì đó là cận phải của miền],
    [Chưa đủ dữ kiện để kết luận],
  ),
  correct-pos: 2,
  loigiai: [
    Đây là tình huống rất hay gặp: phương trình $Q'(x)=0$ có nghiệm nhưng *nghiệm không thuộc miền thực tế*.

    Cụ thể, hai nghiệm là $36$ và $586/3$, trong khi miền hợp lệ của bài toán chỉ là $[40,88)$.

    Toàn bộ miền này nằm giữa hai nghiệm đó, nên $Q'(x) < 0$ trên $[40,88)$.
    Vì thế $Q(x)$ giảm trên toàn miền và giá trị lớn nhất đạt ở biên trái.

    Do đó nhà máy nên giữ $x = 40$ giờ/tuần.

    #ans-box[Phương án tốt nhất là *giữ 40 giờ/tuần*.]
  ],
)

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION V: TRẮC NGHIỆM ĐÚNG/SAI
// ══════════════════════════════════════════════════
= Dạng II — Trắc Nghiệm Đúng/Sai Từ Đề Gốc

#ds(
  id: "2Z-DS1",
  [Từ dữ kiện của bài Nhà máy $Z$: mức chuẩn $40$ giờ/tuần có $100$ tổ, mỗi tổ làm $120$ sp/giờ; cứ tăng thêm $2$ giờ thì bớt $1$ tổ và năng suất mỗi tổ giảm $5$ sp/giờ; phế phẩm ước tính bởi $P(x)=frac(95x^2+120x, 4)$. Gọi $x$ là số giờ làm việc/tuần. Xét các mệnh đề:],
  (
    True([Nếu $x=44$ thì nhà máy còn $98$ tổ, mỗi tổ đạt $110$ sp/giờ]),
    True([Miền xác định hợp lệ của $x$ là $[40, 88)$]),
    False([Nếu làm $44$ giờ/tuần thì số sản phẩm thu được vẫn lớn hơn $430\,000$]),
    True([Phương án tối ưu là giữ nguyên $40$ giờ/tuần]),
  ),
  loigiai: [
    #ppgiai[
      - Với $x=44$, ta có $n = (44-40)/2 = 2$, nên số tổ là $100-2 = 98$ và năng suất là $120-5 dot 2 = 110$.
      - Điều kiện năng suất dương cho $220 - 5x/2 > 0 => x < 88$; kết hợp $x >= 40$ suy ra miền $[40,88)$.
      - $Q(44)=44 dot 98 dot 110 - frac(95 dot 44^2 + 120 dot 44, 4)=427020 < 430000$.
      - Vì $Q'(x) < 0$ trên miền hợp lệ nên giá trị lớn nhất đạt tại $x=40$.
    ]

    #ans-box[(a) *Đúng* · (b) *Đúng* · (c) *Sai* · (d) *Đúng*]
  ],
)

#v(0.5em)

#ds(
  id: "2Z-DS2",
  [Đặt $n$ là số lần tăng thêm $2$ giờ so với mức chuẩn $40$ giờ/tuần. Khi đó $x = 40 + 2n$ với $0 <= n <= 23$. Xét các mệnh đề:],
  (
    True([Nếu $n=5$ thì tuần làm việc là $50$ giờ, còn $95$ tổ và mỗi tổ đạt $95$ sp/giờ]),
    True([Nếu $n=1$ thì số sản phẩm thu được là $435\,015$, tức giảm $5\,785$ sản phẩm so với mức chuẩn]),
    False([Phương trình $Q'(n)=0$ có nghiệm trong đoạn $[0,23]$]),
    False([Vì tổng giờ làm tăng theo $n$, nên $Q(n)$ chắc chắn tăng theo $n$]),
  ),
  loigiai: [
    #ppgiai[
      - $n=5$ ứng với $x = 40 + 2 dot 5 = 50$; khi đó số tổ là $100-5 = 95$, năng suất là $120-5 dot 5 = 95$.
      - $Q(1)=10 - 1135 - 4660 + 440800 = 435015$, nên giảm $440800 - 435015 = 5785$ sản phẩm.
      - $Q'(n)=30n^2 - 2270n - 4660$ có hai nghiệm $n=-2$ và $n=233/3$, đều không thuộc $[0,23]$.
      - Do $Q'(n) < 0$ trên $[0,23]$, hàm $Q(n)$ giảm, nên không thể kết luận rằng $Q(n)$ tăng theo $n$.
    ]

    #ans-box[(a) *Đúng* · (b) *Đúng* · (c) *Sai* · (d) *Sai*]
  ],
)

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION VI: BIẾN TẤU CHUẨN
// ══════════════════════════════════════════════════
= Dạng III — Nhóm Bài Đặt $x$ = Số Lần Điều Chỉnh

#note-box(title: "📌 Nguyên tắc biên soạn")[
  - Đề gốc nên bắt đầu từ *dữ kiện thực tế*, không đưa ngay đa thức $Q(x)$.
  - Lời giải đi theo đúng chuỗi: *đặt biến → lập các đại lượng → lập hàm mục tiêu → đạo hàm → bảng biến thiên → kết luận*.
  - Ở nhóm bài dưới đây, *ưu tiên đặt $x$ là số lần điều chỉnh* để mô hình hoá ngắn gọn và tự nhiên hơn.
]

#route-box(title: "🧱 Khung Viết Lời Giải Cho Các Bài Biến Tấu")[
  Có thể giữ cùng một nhịp trình bày cho hầu hết các bài dưới đây:

  - *Bước 1:* nêu rõ "mỗi lần điều chỉnh" làm thay đổi đại lượng nào.
  - *Bước 2:* viết các biểu thức mới sau $x$ lần điều chỉnh.
  - *Bước 3:* lập hàm mục tiêu $Q(x)$ hoặc $L(x)$.
  - *Bước 4:* xét đạo hàm trên miền thực tế của bài toán.
  - *Bước 5:* trả lời lại bằng ngôn ngữ bối cảnh, không dừng ở nghiệm số trần trụi.
]

#v(0.5em)

#formula-box[
  *Khung đặt biến nên dùng trong các bài tương tự:*

  - $x =$ số lần tăng hoặc giảm theo một đơn vị chuẩn của đề.
  - Đại lượng mới $=$ đại lượng chuẩn $+$ (mức thay đổi sau mỗi lần) $times x$.
  - Miền xác định: $x >= 0$, $x$ nguyên, và mọi đại lượng thực tế đều phải còn ý nghĩa.
]

== Nhóm 1 — Tối Ưu Ở Biên

=== Bài 1 — 🧵 Xưởng May: Tăng Ca Có Nên Không?

#tln(
  id: "3-TLN-XM",
  [Một xưởng may làm việc theo mức chuẩn *40 giờ/tuần*, có *60 tổ thợ*, mỗi tổ may *70 sản phẩm/giờ*. Mỗi lần tăng ca thêm *2 giờ/tuần* thì có *1 tổ nghỉ việc* và năng suất mỗi tổ giảm *2 sản phẩm/giờ*. Gọi $x$ là số lần tăng thêm $2$ giờ. Số phế phẩm mỗi tuần được ước tính bởi
    $
      P(x) = 294x^2 + 2000x
    $
    (sản phẩm). Hãy tìm $x$ để số sản phẩm thu được lớn nhất.],
  [$x = 0$],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số lần tăng thêm $2$ giờ, $x >= 0$.
      - Số giờ làm mỗi tuần là $40 + 2x$.
      - Số tổ còn lại là $60 - x$.
      - Năng suất mỗi tổ là $70 - 2x$ sản phẩm/giờ.
    ]

    Điều kiện thực tế:
    $
      60 - x > 0, quad 70 - 2x > 0
    $
    nên $0 <= x <= 34$.

    *Hàm số sản phẩm thu được:*
    $
      Q(x) = (40 + 2x)(60 - x)(70 - 2x) - P(x)
    $
    $
      Q(x) = (40 + 2x)(60 - x)(70 - 2x) - (294x^2 + 2000x)
    $
    $
      Q(x) = 4x^3 - 594x^2 - 1200x + 168000
    $

    *Đạo hàm:*
    $
      Q'(x) = 12x^2 - 1188x - 1200 = 12(x - 100)(x + 1)
    $

    Vì $0 <= x <= 34$ nên ta có $x - 100 < 0$ và $x + 1 > 0$, suy ra $Q'(x) < 0$ trên toàn miền.

    #align(center)[
      #bbbt(
        var: $x$,
        der: $Q'(x)$,
        func: $Q(x)$,
        x-vals: ($0$, $34$),
        d-signs: ($-$,),
        v-vals: ($168000$, $-402248$),
      )
    ]

    Vậy $Q(x)$ giảm trên toàn miền nên đạt lớn nhất tại $x = 0$.

    #ans-box[
      Xưởng may nên *không tăng ca*, tức *$x = 0$*.

      Nghĩa là vẫn giữ mức *40 giờ/tuần*.
    ]
  ],
)

#v(0.6em)

=== Bài 2 — 🐟 Nuôi Cá: Tối Ưu Mật Độ Thả

#tln(
  id: "3-TLN-TS",
  [Một hồ nuôi cá có mật độ chuẩn *200 con/m³*. Chủ trại xem xét tăng dần mật độ, mỗi lần tăng thêm *10 con/m³*. Gọi $x$ là số lần tăng như vậy.

    Khi đó mật độ thả là $200 + 10x$ (con/m³). Mỗi lần tăng thêm $10$ con/m³ thì khối lượng trung bình của mỗi con giảm *0,04 kg*. Chi phí xử lý nước và thức ăn dư, quy đổi theo sản lượng bị hao hụt, được ước tính bởi
    $
      C(x) = frac(x^2, 10)
    $
    (kg cá tương đương trên mỗi m³). Biết chủ trại chỉ xem xét tối đa *8 lần tăng*. Hãy tìm $x$ để sản lượng thuần lớn nhất.],
  [$x = 4$],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số lần tăng thêm $10$ con/m³, nên $0 <= x <= 8$.
      - Mật độ thả là $200 + 10x$ con/m³.
      - Mỗi lần tăng thêm $10$ con/m³ thì khối lượng mỗi con giảm $0,04$ kg.
      - Sản lượng thuần = *tổng khối lượng cá thu hoạch* − *chi phí quy đổi do xử lý nước và thức ăn dư*.
    ]

    *Bước 1. Lập khối lượng trung bình của mỗi con.*

    $
      m(x) = 1.2 - 0.04x
    $

    *Bước 2. Lập hàm sản lượng thuần.*

    Tổng khối lượng cá thu hoạch là
    $
      H(x) = (200 + 10x)(1.2 - 0.04x)
      = 240 + 4x - 0.4x^2
    $

    Do đó
    $
      Q(x) = H(x) - C(x) = (240 + 4x - 0.4x^2) - frac(x^2, 10)
    $
    $
      Q(x) = 240 + 4x - frac(x^2, 2)
    $

    *Bước 3. Xét đạo hàm.*

    $
      Q'(x) = 4 - x
    $

    $
      Q'(x) = 0 <=> x = 4
    $

    Trên đoạn $[0,8]$, ta có $Q'(x) > 0$ khi $x < 4$ và $Q'(x) < 0$ khi $x > 4$.

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $Q'(x)$,
        func: $Q(x)$,
        x-vals: ($0$, $4$, $8$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($240$, $248$, $240$),
        is-min: false,
      )
    ]

    Vậy $Q(x)$ đạt lớn nhất tại $x = 4$.

    #ans-box[
      Số lần tăng tối ưu là *$x = 4$*.

      Khi đó mật độ thả tối ưu là *$200 + 10 dot 4 = 240$ con/m³*.

      Sản lượng thuần lớn nhất là *$248$ kg/m³*.
    ]
  ],
)

#v(0.6em)

== Nhóm 2 — Tối Ưu Nội Điểm

=== Bài 3 — 📚 Lớp Ôn Thi: Tối Ưu Sĩ Số

#tln(
  id: "3-TLN-GD",
  [Một lớp ôn thi có quy mô chuẩn *30 học sinh*. Trung tâm xem xét mở rộng lớp, mỗi lần tăng thêm *3 học sinh*. Gọi $x$ là số lần tăng như vậy.

    Khi đó sĩ số lớp là $30 + 3x$. Mỗi lần tăng thêm $3$ học sinh thì điểm trung bình của cả lớp giảm *0,3 điểm*. Chi phí quản lý phụ trội, quy đổi theo điểm chất lượng của cả lớp, được ước tính bởi
    $
      C(x) = frac(x^2, 10) + 5x
    $
    với đơn vị là *điểm quy đổi*. Biết lớp không vượt quá *60 học sinh*. Gọi *chất lượng đầu ra* là tổng điểm của cả lớp trừ đi chi phí quản lý phụ trội. Hãy tìm $x$ để chất lượng đầu ra lớn nhất.],
  [$x = 5$],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số lần tăng thêm $3$ học sinh, nên $0 <= x <= 10$.
      - Sĩ số lớp là $30 + 3x$.
      - Điểm trung bình giảm tuyến tính theo số lần tăng.
      - Chất lượng đầu ra = *tổng điểm của cả lớp* − *chi phí quản lý phụ trội*.
    ]

    *Bước 1. Lập điểm trung bình theo $x$.*

    Vì cứ tăng thêm $3$ học sinh thì điểm trung bình giảm $0,3$ điểm, nên
    $
      d(x) = 8 - 0.3x
    $

    *Bước 2. Lập hàm chất lượng đầu ra.*

    Tổng điểm của cả lớp là
    $
      S(x) = (30 + 3x)(8 - 0.3x) = 240 + 15x - 0.9x^2
    $

    Do đó
    $
      Q(x) = S(x) - C(x) = (240 + 15x - 0.9x^2) - (frac(x^2, 10) + 5x)
    $

    $
      Q(x) = 240 + 10x - x^2
    $

    *Bước 3. Xét đạo hàm.*

    $
      Q'(x) = 10 - 2x
    $

    $
      Q'(x) = 0 <=> x = 5
    $

    Trên đoạn $[0,10]$, ta có $Q'(x) > 0$ khi $x < 5$ và $Q'(x) < 0$ khi $x > 5$.

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $Q'(x)$,
        func: $Q(x)$,
        x-vals: ($0$, $5$, $10$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($240$, $265$, $240$),
        is-min: false,
      )
    ]

    Vậy $Q(x)$ đạt lớn nhất tại $x = 5$.

    #ans-box[
      Số lần tăng tối ưu là *$x = 5$*.

      Khi đó sĩ số lớp tối ưu là *$30 + 3 dot 5 = 45$ học sinh*.

      Chất lượng đầu ra lớn nhất là *$265$ điểm quy đổi*.
    ]
  ],
)

#pagebreak()

=== Bài 4 — 🍔 Cửa Hàng Ăn Nhanh: Tối Ưu Giá Bán

#tln(
  id: "3-TLN-FASTFOOD",
  [Một cửa hàng ăn nhanh đang bán một suất ăn với giá *50 nghìn đồng* và tiêu thụ được *400 suất/ngày*. Cửa hàng dự định tăng giá, mỗi lần tăng thêm *5 nghìn đồng*. Gọi $x$ là số lần tăng giá như vậy.

    Khi đó giá bán là $50 + 5x$ (nghìn đồng/suất) và lượng tiêu thụ giảm còn $400 - 20x$ (suất/ngày). Chi phí tăng thêm cho truyền thông và dịch vụ chăm sóc khách hàng được ước tính là
    $
      C(x) = 400x
    $
    (nghìn đồng/ngày). Ban quản lý chỉ xét tối đa *10 lần tăng giá*. Hãy tìm $x$ để lợi nhuận mỗi ngày lớn nhất.],
  [$x = 3$],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số lần tăng giá thêm $5$ nghìn đồng, nên $0 <= x <= 10$.
      - Giá bán là $50 + 5x$ (nghìn đồng/suất).
      - Số suất bán được là $400 - 20x$ (suất/ngày).
      - Lợi nhuận = *doanh thu* − *chi phí tăng thêm*.
    ]

    *Bước 1. Lập hàm lợi nhuận.*

    $
      L(x) = (50 + 5x)(400 - 20x) - 400x
    $
    $
      L(x) = 20000 + 1000x - 100x^2 - 400x
    $
    $
      L(x) = 20000 + 600x - 100x^2
    $

    *Bước 2. Xét đạo hàm.*

    $
      L'(x) = 600 - 200x = 200(3 - x)
    $

    $
      L'(x) = 0 <=> x = 3
    $

    Trên đoạn $[0,10]$, ta có $L'(x) > 0$ khi $x < 3$ và $L'(x) < 0$ khi $x > 3$.

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $L'(x)$,
        func: $L(x)$,
        x-vals: ($0$, $3$, $10$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($20000$, $20900$, $16000$),
        is-min: false,
      )
    ]

    Vậy lợi nhuận lớn nhất khi $x = 3$.

    #ans-box[
      Số lần tăng giá tối ưu là *$x = 3$*.

      Khi đó giá bán nên là *$50 + 5 dot 3 = 65$ nghìn đồng/suất*.

      Lợi nhuận tối đa là *$20{,}9$ triệu đồng/ngày*.
    ]
  ],
)

#v(0.6em)


== Nhóm 3 — Các Bài Toán Thực Tế Mới Lạ

#note-box(title: "🌶️ Gia Vị Khó Cho Đề Thi")[
  Các bài toán dưới đây mô phỏng những tình huống kinh tế hiện đại (cho thuê chung cư mini, mở tour du lịch, thời điểm thu hoạch...). Đặc biệt có những bài *nghiệm của đạo hàm là số thập phân*, buộc học sinh phải dùng kỹ năng kẹp số nguyên.
]

=== Bài 5 — 🏢 Bất Động Sản: Tối Ưu Tiền Thuê Chung Cư Mini

#tln(
  id: "3-TLN-BDS",
  [Một tòa chung cư mini có *40 phòng*. Hiện tại nếu giá cho thuê là *4 triệu đồng/phòng/tháng* thì toàn bộ các phòng đều có người thuê. Chủ nhà khảo sát thấy: nếu cứ tăng giá thuê thêm *200 nghìn đồng* thì sẽ có *1 phòng bị bỏ trống*.

    Mỗi phòng đang có người thuê sẽ tốn chi phí bảo dưỡng định kỳ là *400 nghìn đồng/tháng*, còn phòng trống tốn chi phí dọn dẹp cơ bản là *100 nghìn đồng/tháng*. Hỏi chủ nhà nên tăng giá thêm bao nhiêu để thu về lợi nhuận lớn nhất trong tháng?],
  [Tăng $11$ lần (Giá $6{,}2$ triệu)],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số lần tăng giá thêm *0,2 triệu đồng*, $0 <= x <= 40$.
      - Số phòng có người thuê: $40 - x$. Số phòng trống: $x$.
      - Giá thuê mỗi phòng: $4 + 0.2x$ (triệu đồng).
      - Lợi nhuận = *Doanh thu* − *Chi phí bảo dưỡng*.
    ]

    *Bước 1. Lập hàm doanh thu và chi phí:*
    $
      D(x) = (40 - x)(4 + 0.2x) = 160 + 8x - 4x - 0.2x^2 = 160 + 4x - 0.2x^2 " (triệu đồng)"
    $
    Chi phí cho phòng đang thuê và phòng trống:
    $
      C(x) = 0.4(40 - x) + 0.1(x) = 16 - 0.4x + 0.1x = 16 - 0.3x " (triệu đồng)"
    $

    *Bước 2. Lập hàm lợi nhuận:*
    $
      L(x) = D(x) - C(x) = (160 + 4x - 0.2x^2) - (16 - 0.3x) = 144 + 4.3x - 0.2x^2
    $

    *Bước 3. Đạo hàm và kẹp số nguyên:*
    $
      L'(x) = 4.3 - 0.4x = 0 <=> x = 4.3 / 0.4 = 10.75
    $
    Đạo hàm $L'(x) = 0$ cho nghiệm $x = 10.75$, nhưng vì *số phòng trống x phải là số nguyên*, ta cần so sánh lợi nhuận tại hai số nguyên gần nhất là $10$ và $11$:
    - Tại $x = 10$: $L(10) = 144 + 43 - 0.2(100) = 144 + 43 - 20 = 167$ (triệu).
    - Tại $x = 11$: $L(11) = 144 + 4.3(11) - 0.2(121) = 144 + 47.3 - 24.2 = 167.1$ (triệu).

    Thấy rằng $L(11) > L(10)$. Gần đúng với trực giác là $10.75$ nằm gần $11$ hơn.

    #ans-box[
      Chủ nhà nên chọn *$x = 11$* (tăng giá 11 lần).

      Giá thuê tối ưu là $4 + 0.2(11) =$ *$6{,}2$ triệu đồng/phòng*. Lợi nhuận lớn nhất là $167{,}1$ triệu.
    ]
  ],
)

#v(0.6em)

=== Bài 6 — 🏖️ Dịch Vụ: Chiến Lược Kích Cầu Tour Du Lịch

#tln(
  id: "3-TLN-TOUR",
  [Một công ty du lịch dự định tổ chức tour ghép đoàn bằng cano sức chứa *40 người*. Hiện tại đã có *20 người* đăng ký với giá *2 triệu đồng/người*. Để kích cầu, công ty thông báo: kể từ hành khách thứ 21 trở đi, cứ có thêm 1 người đăng ký thì *mọi hành khách trong đoàn* (kể cả 20 người đầu) đều được giảm giá *50 nghìn đồng* (0,05 triệu).

    Chi phí cố định thuê cano là *10 triệu đồng*. Chi phí chuẩn bị suất ăn và bảo hiểm cho mỗi hành khách (bất kể khách cũ hay mới) là *500 nghìn đồng* (0,5 triệu). Hãy tìm tổng số lượng khách tối ưu để công ty đạt lợi nhuận lớn nhất.],
  [25 khách],
  loigiai: [
    #ppgiai[
      - Đặt $x$ là số khách đăng ký *nhiều hơn* 20 người ($0 <= x <= 20$).
      - Tổng số hành khách: $20 + x$.
      - Khi thêm $x$ khách, được giảm $x$ lần, giá vé mỗi người: $2 - 0.05x$ (triệu).
    ]

    *Bước 1. Lập các hàm mục tiêu:*
    $
      "Doanh thu: " D(x) = (20 + x)(2 - 0.05x) = 40 - x + 2x - 0.05x^2 = 40 + x - 0.05x^2
    $
    $
      "Tổng chi phí: " C(x) = 10 + 0.5(20 + x) = 20 + 0.5x
    $
    $
      "Lợi nhuận: " L(x) = D(x) - C(x) = (40 + x - 0.05x^2) - (20 + 0.5x) = 20 + 0.5x - 0.05x^2
    $

    *Bước 2. Xét cực trị:*
    $
      L'(x) = 0.5 - 0.1x = 0 <=> x = 5
    $
    Nghiệm $x=5$ hoàn toàn thỏa mãn giới hạn $x <= 20$. Do $L(x)$ là parabol mở xuống, cực đại nằm tại $x=5$.

    #ans-box[
      Cần tìm thêm $x = 5$ khách. Tổng số khách tối ưu là *$20 + 5 = 25$ khách*.
      (Khi đó giá sẽ giảm còn $1{,}75$ triệu/người, lãi gộp cực đại là $21{,}25$ triệu).
    ]
  ],
)

#v(0.6em)

=== Bài 7 — 🦐 Nông Nghiệp: Thời Điểm Thu Hoạch Đón Giá

#tln(
  id: "3-TLN-THUHOACH",
  [Vào đầu tháng, một trại nuôi cung cấp ước tính *3000 kg* hải sản thương phẩm với giá *40.000 VNĐ/kg*. Chủ trại dự tính nếu ráng nuôi thêm thì mỗi tuần trọng lượng xuất chuồng sẽ *tăng thêm 300 kg*. Nhưng vì nguồn cung trên thị trường nhiều dần nên giá bán sẽ *giảm mất 2.000 VNĐ* trên mỗi kg sau từng tuần.

    Ngược lại, chi phí thức ăn và vận hành trại là *1,2 triệu đồng/tuần*. Cần kéo dài thời gian nuôi bao nhiêu tuần kể từ hiện tại để lợi nhuận thu thêm được tối ưu nhất?],
  [4 tuần],
  loigiai: [
    #ppgiai[
      - Đặt $t$ là số tuần chờ thêm ($t >= 0$).
      - Tổng khối lượng: $M(t) = 3000 + 300t$ (đơn vị: kg).
      - Giá bán: $P(t) = 40 - 2t$ (đơn vị: nghìn đồng/kg).
      - Chi phí nuôi: $C(t) = 1200t$ (đơn vị: nghìn đồng).
    ]

    *Bước 1. Lập hàm doanh thu và lợi tức:*
    $
      D(t) = (3000 + 300t)(40 - 2t) = 120000 - 6000t + 12000t - 600t^2 = 120000 + 6000t - 600t^2
    $
    Lợi nhuận theo quy mô là:
    $
      L(t) = D(t) - C(t) = (120000 + 6000t - 600t^2) - 1200t = 120000 + 4800t - 600t^2
    $

    *Bước 2. Xét cực đại:*
    $
      L'(t) = 4800 - 1200t = 0 <=> t = 4
    $
    Với hàm bậc 2 âm, đỉnh cực đại dễ dàng tìm được tại $t=4$.

    #ans-box[
      Chủ trại nên chờ thêm đúng *$4$ tuần* để tối đa hóa doanh thu trừ chi phí.
    ]
  ],
)

#pagebreak()

== Nhóm 4 — Trắc Nghiệm Thiết Kế Bằng `tn-auto`

#note-box(title: "🧩 Ở nhóm này dùng `tn-auto`")[
  Mục đích là *auto gắn vị trí đáp án đúng* để người soạn tập trung vào việc thiết kế các phương án nhiễu bám sát sai lầm thường gặp.
]

#tn-auto(
  id: "3-TN-AUTO-1",
  [Ở bài Xưởng may, nếu $x = 4$ thì số giờ làm việc, số tổ còn lại và năng suất mỗi tổ lần lượt là:],
  [$48$ giờ; $56$ tổ; $62$ sp/tổ/giờ],
  wrongs: (
    [$44$ giờ; $56$ tổ; $66$ sp/tổ/giờ],
    [$48$ giờ; $54$ tổ; $62$ sp/tổ/giờ],
    [$48$ giờ; $56$ tổ; $66$ sp/tổ/giờ],
  ),
  correct-pos: 2,
  loigiai: [
    Vì $x=4$ nghĩa là tăng thêm $4$ lần, mỗi lần $2$ giờ, nên tổng giờ là $40 + 2 dot 4 = 48$.

    Số tổ còn lại là $60 - 4 = 56$.

    Năng suất mỗi tổ là $70 - 2 dot 4 = 62$ sp/tổ/giờ.

    #ans-box[Đáp án đúng: *48 giờ; 56 tổ; 62 sp/tổ/giờ*.]
  ],
)

#tn-auto(
  id: "3-TN-AUTO-2",
  [Ở bài Nuôi cá, biểu thức rút gọn đúng của hàm sản lượng thuần là:],
  [$Q(x) = 240 + 4x - frac(x^2, 2)$],
  wrongs: (
    [$Q(x) = 240 + 10x - frac(x^2, 2)$],
    [$Q(x) = 240 + 4x - 2x^2$],
    [$Q(x) = 240 + 4x - frac(x^2, 10)$],
  ),
  correct-pos: 1,
  loigiai: [
    Trước hết tách rõ hai phần của bài toán:
    - $H(x)$ là tổng khối lượng cá thu hoạch;
    - $C(x)$ là phần hao hụt quy đổi phải trừ đi.

    Ta có
    $
      H(x) = (200 + 10x)(1.2 - 0.04x) = 240 + 4x - 0.4x^2
    $
    và
    $
      C(x) = frac(x^2, 10) = 0.1x^2
    $

    Vì thế sản lượng thuần là
    $
      Q(x) = H(x) - C(x) = 240 + 4x - 0.5x^2 = 240 + 4x - frac(x^2, 2)
    $

    Vậy biểu thức rút gọn đúng là $Q(x) = 240 + 4x - frac(x^2, 2)$.

    #ans-box[Biểu thức đúng là *$Q(x) = 240 + 4x - frac(x^2, 2)$*.]
  ],
)

#tn-auto(
  id: "3-TN-AUTO-3",
  [Ở bài Cửa hàng ăn nhanh, nếu $x = 3$ thì phát biểu nào sau đây đúng?],
  [Giá bán là $65$ nghìn đồng/suất và số suất bán được là $340$ suất/ngày],
  wrongs: (
    [Giá bán là $60$ nghìn đồng/suất và số suất bán được là $340$ suất/ngày],
    [Giá bán là $65$ nghìn đồng/suất và số suất bán được là $320$ suất/ngày],
    [Giá bán là $70$ nghìn đồng/suất và số suất bán được là $340$ suất/ngày],
  ),
  correct-pos: 4,
  loigiai: [
    Ở đây $x=3$ nghĩa là tăng giá $3$ lần, mỗi lần $5$ nghìn đồng.

    Vì vậy:
    - giá bán mới là $50 + 5 dot 3 = 65$ nghìn đồng/suất;
    - lượng tiêu thụ còn $400 - 20 dot 3 = 340$ suất/ngày.

    Do đó phát biểu đúng là: *giá $65$ nghìn đồng/suất và bán được $340$ suất/ngày*.

    #ans-box[Đáp án đúng là *giá $65$ nghìn đồng/suất và bán được $340$ suất/ngày*.]
  ],
)

#pagebreak()

// ══════════════════════════════════════════════════
// SECTION VII: TỔNG KẾT
// ══════════════════════════════════════════════════
= Tổng Kết — Chốt Mẫu Trình Bày

#theory-box(title: "📋 Các nhóm bài nên ưu tiên")[
  #table(
    columns: (1.15fr, 1.3fr, 1.25fr, 1fr),
    stroke: (x, y) => if y == 0 { (bottom: 1.2pt + ink-navy) } else { (bottom: 0.3pt + rgb("9FA8DA")) },
    inset: (x: 8pt, y: 7pt),
    fill: (x, y) => if y == 0 { rgb("E8EAF6") } else if calc.odd(y) { rgb("FAFAFA") } else { white },
    table.header(
      text(fill: ink-navy, weight: "bold")[Bài toán],
      text(fill: ink-navy, weight: "bold")[Biến nên đặt],
      text(fill: ink-navy, weight: "bold")[Dấu hiệu chính],
      text(fill: ink-navy, weight: "bold")[Kết quả],
    ),
    [Nhà máy Z], [$x$ = số giờ/tuần], [Nghiệm $Q'(x)=0$ nằm ngoài miền], [Giữ $40$ giờ/tuần],
    [Xưởng may], [$x$ = số lần tăng $2$ giờ], [$Q'(x) < 0$ trên toàn miền], [Max tại $x=0$],
    [Nuôi cá], [$x$ = số lần tăng $10$ con/m³], [Nghiệm $Q'(x)=0$ nằm trong miền], [Max tại $x=4$],
    [Lớp ôn thi], [$x$ = số lần tăng $3$ học sinh], [Nghiệm $Q'(x)=0$ nằm trong miền], [Max tại $x=5$],
    [Cửa hàng ăn nhanh], [$x$ = số lần tăng $5$ nghìn đồng], [Nghiệm $Q'(x)=0$ nằm trong miền], [Max tại $x=3$],
    [Chung cư mini], [$x$ = số lần tăng mức giá], [Nghiệm ra số lẻ, chọn kẹp nguyên], [Gần đỉnh Parabol],
    [Khuyến mãi Tour], [$x$ = khách thêm (hiệu ứng nhóm)], [Hàm giá ảnh hưởng lên tổng số], [Max nội điểm],
  )
]

#v(0.8em)

#note-box(title: "🧭 Cách viết đề cho đúng chuẩn")[
  - Đề gốc nên mở bằng *bối cảnh và dữ kiện*, không mở thẳng bằng $Q(x)=...$.
  - Với các bài biến tấu tương tự, nên ưu tiên đặt *$x$ là số lần điều chỉnh* để tránh biểu thức rườm rà.
  - Sau khi mô hình hoá xong mới rút gọn thành hàm mục tiêu để đạo hàm.
  - Với câu trắc nghiệm, có thể dùng `tn-auto`; nhưng *nhiễu* vẫn phải soạn thủ công theo lỗi sai thật của học sinh.
]

#warn-box[
  *Bẫy 1:* Quên đổi cụm “tăng thêm 2 giờ” thành số lần tăng hoặc biểu thức $frac(x-40, 2)$.

  *Bẫy 2:* Khi đặt $x$ là số lần điều chỉnh, phải nhớ *$x$ nguyên không âm* và vẫn phải xét các điều kiện thực tế.

  *Bẫy 3:* Thấy nghiệm của $Q'(x)=0$ là chọn ngay, dù nghiệm đó nằm ngoài miền.
]
