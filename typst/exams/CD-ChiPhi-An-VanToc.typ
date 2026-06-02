#import "../sang-exam.typ": *
#import "../template.typ": *
#import "../bbt.typ": bbbt, bbt-opt
#import "@preview/cetz:0.5.2"

// ═══════════════════════════════════════════════
// CẤU HÌNH TRANG
// ═══════════════════════════════════════════════
#set page(paper: "a4", margin: (x: 1.4cm, y: 1.8cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")
#set par(justify: true, leading: 0.8em)
#set list(indent: 1em, body-indent: 0.5em)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: gradient.linear(rgb("1565C0"), rgb("1976D2"), angle: 0deg),
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
  stroke: (left: 4pt + rgb("E67E22")),
  inset: (left: 10pt, y: 4pt),
  text(fill: rgb("E67E22"), size: 12pt, weight: "bold", it.body),
)
#show heading.where(level: 3): it => block(
  above: 1.2em,
  below: 0.5em,
  text(fill: rgb("1E8449"), size: 11pt, weight: "bold", "⬧ " + it.body),
)

#let mode = "loigiai"
#let accent = classic.blue
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
#show math.equation: set text(fill: rgb("#000000"))
#show math.equation.where(block: false): math.display
#show math.frac: math.display

// ─── Màu chủ đề ─────────────────────────────────────────────
#let eco-navy = rgb("1B2A4A")
#let eco-amber = rgb("E67E22")
#let eco-green = rgb("1E8449")
#let eco-red = rgb("C0392B")
#let eco-gold = rgb("B7950B")
#let eco-teal = rgb("148F77")

// ─── Hộp Lý Thuyết (nền sáng xanh) ─────────────────────────────
#let eco-box(body) = block(
  fill: rgb("EEF4FB"),
  stroke: (left: 4pt + rgb("1565C0"), rest: 0.8pt + rgb("AACCE0")),
  radius: (right: 7pt),
  inset: (x: 16pt, y: 14pt),
  width: 100%,
)[#body]

// ─── Hộp Nhận Xét (nền sáng, viền trái cam) ─────────────────
#let note-box(title: "📌 Nhận Xét", body) = block(
  fill: rgb("FFFBF2"),
  stroke: (left: 4pt + eco-amber, rest: 0.6pt + rgb("FAD7A0")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-amber, weight: "bold")[#title]
  #v(0.3em)
  #body
]

// ─── Hộp Kết Luận (vàng nhạt) ────────────────────────────────
#let ans-box(body) = block(
  fill: rgb("FFFDE7"),
  stroke: (left: 4pt + eco-gold, rest: 0.6pt + rgb("F9E79F")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: rgb("7D6608"), weight: "bold")[✅ Kết Luận]
  #v(0.3em)
  #body
]

// ─── Hộp Cảnh Báo (đỏ nhạt) ─────────────────────────────────
#let warn-box(body) = block(
  fill: rgb("FDF0EC"),
  stroke: (left: 4pt + eco-red, rest: 0.6pt + rgb("F5B7B1")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 11pt),
  width: 100%,
)[
  #text(fill: eco-red, weight: "bold")[⚠️ Chú Ý — Bẫy Thường Gặp]
  #v(0.3em)
  #body
]

#let opt-bbt-open(v-mark, c-mark) = align(center)[
  #bbt-opt(
    var: $v$,
    der: $C'(v)$,
    func: $C(v)$,
    x-vals: ($0^+$, v-mark, $+oo$),
    d-signs: ($-$, $0$, $+$),
    v-vals: ($+oo$, c-mark, $+oo$),
    is-min: true,
  )
]

#let opt-bbt-bounded(v-left, v-mark, v-right, left-val, c-mark, right-val) = align(center)[
  #bbt-opt(
    var: $v$,
    der: $C'(v)$,
    func: $C(v)$,
    x-vals: (v-left, v-mark, v-right),
    d-signs: ($-$, $0$, $+$),
    v-vals: (left-val, c-mark, right-val),
    is-min: true,
  )
]

#let opt-bbt-monotone(v-left, v-right, sign, left-val, right-val) = align(center)[
  #bbbt(
    var: $v$,
    der: $C'(v)$,
    func: $C(v)$,
    x-vals: (v-left, v-right),
    d-signs: (sign,),
    v-vals: (left-val, right-val),
  )
]

// ═══════════════════════════════════════════════
// TRANG BÌA
// ═══════════════════════════════════════════════
#align(center)[
  #block(
    width: 100%,
    fill: gradient.linear(rgb("0D1B2A"), rgb("1B3A6B"), rgb("0D1B2A"), angle: 135deg),
    radius: 12pt,
    inset: (x: 20pt, y: 22pt),
  )[
    #text(fill: eco-amber, size: 10pt, weight: "bold", tracking: 3pt)[
      CHUYÊN ĐỀ TỐI ƯU HÓA — TOÁN KINH TẾ VẬN TẢI
    ]
    #v(0.6em)
    #text(fill: white, size: 22pt, weight: "bold")[Chi Phí Ẩn — Vận Tốc Tối Ưu]
    #v(0.4em)
    #text(fill: rgb("AED6F1"), size: 13pt, style: "italic")[
      Nghệ Thuật Cân Bằng Giữa Nhiên Liệu và Thời Gian
    ]
    #v(1em)
    #line(length: 55%, stroke: 0.6pt + eco-amber)
    #v(0.9em)
    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      gutter: 0.6em,
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[📐 MÔ HÌNH]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          $C(v) = a v^2 + b slash v$\
          Cân bằng chi phí ẩn
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[🔍 ĐỌC ĐỀ]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          3 cách cho $a$, $b$\
          Per-km · Per-hr · Tổng
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[🎯 PHƯƠNG PHÁP]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          Đạo hàm · BBT\
          Ràng buộc · Nghịch
        ]
      ],
      align(center)[
        #text(fill: eco-amber, size: 9pt, weight: "bold")[📊 BÀI TẬP]
        #linebreak()
        #text(fill: rgb("BDC3C7"), size: 8.5pt)[
          12 bài · 4 dạng\
          Tăng dần độ khó
        ]
      ],
    )
  ]
]

#v(1.5em)

// ═══════════════════════════════════════════════
// SECTION 0: NỀN TẢNG LÝ THUYẾT
// ═══════════════════════════════════════════════
= Mô Hình Chi Phí Ẩn: Nền Tảng Lý Thuyết

== Bài Toán Cốt Lõi

Một phương tiện di chuyển quãng đường $S$ km với vận tốc $v$ km/h. Chi phí gồm hai thành phần:

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  block(
    fill: rgb("EBF5FB"),
    stroke: (left: 4pt + rgb("2980B9")),
    inset: (x: 12pt, y: 10pt),
    radius: (right: 5pt),
    width: 100%,
  )[
    #text(fill: rgb("1A5276"), weight: "bold")[🔥 Chi Phí Nhiên Liệu $C_1$]
    #v(0.3em)
    Tỉ lệ bình phương vận tốc _trên mỗi km_, suy ra:
    $ C_1(v) = k_1 dot v^2 dot S $
    _Đi nhanh hơn → tốn nhiên liệu hơn nhiều._
  ],
  block(
    fill: rgb("EAFAF1"),
    stroke: (left: 4pt + rgb("27AE60")),
    inset: (x: 12pt, y: 10pt),
    radius: (right: 5pt),
    width: 100%,
  )[
    #text(fill: rgb("1E8449"), weight: "bold")[⏰ Chi Phí Thời Gian $C_2$]
    #v(0.3em)
    Tỉ lệ thời gian hoạt động $t = S slash v$, suy ra:
    $ C_2(v) = k_2 dot frac(S, v) $
    _Đi chậm hơn → mất thời gian → tốn nhân công hơn._
  ],
)

#v(0.5em)

#ans-box[
  *Hàm chi phí tổng:*
  $
    C(v) = underbrace(S k_1 v^2, C_1 "tăng theo" v) + underbrace(frac(S k_2, v), C_2 "giảm theo" v) = a v^2 + frac(b, v)
  $
  trong đó $a = S k_1 > 0$, $b = S k_2 > 0$, $v in (0, v_max]$.
]

#v(0.8em)

== Đồ Thị — Sự Đánh Đổi Ẩn

#grid(
  columns: (55%, 45%),
  column-gutter: 1.4em,
  align(horizon)[
    Đường màu *xanh* ($C_1 = a v^2$) tăng đơn điệu: chạy nhanh → nhiều nhiên liệu.

    Đường màu *đỏ* ($C_2 = b slash v$) giảm đơn điệu: chạy nhanh → ít thời gian.

    Đường màu *xanh lá* ($C = C_1 + C_2$) lõm xuống, tạo *điểm cực tiểu* rõ ràng tại $v_0$.

    #note-box(title: "💡 Chi Phí Ẩn Ở Đây")[
      Học sinh thường chỉ thấy một trong hai chi phí. Bài toán "chi phí ẩn" yêu cầu nhìn thấy *cả hai cùng lúc* và tìm điểm cân bằng.
    ]
  ],
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((-0.2, 0), (5.6, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    line((0, -0.2), (0, 4.6), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    content((5.8, 0), text(size: 8pt)[$v$])
    content((0.25, 4.8), text(size: 8pt)[$C$])
    content((-0.2, -0.2), text(size: 8pt)[$O$])

    // a=0.5, b=4 → v₀=∛4≈1.587, Cmin≈3.78
    // scale: x→x*1.6, y→y*0.8

    // C1 = 0.5v², points: v=0..3.3
    let c1 = (
      (0, 0),
      (0.5, 0.1),
      (0.8, 0.256),
      (1.0, 0.4),
      (1.3, 0.676),
      (1.587, 1.008),
      (2.0, 1.6),
      (2.5, 2.5),
      (3.0, 3.6),
      (3.3, 4.356),
    )
    let c1s = c1.map(p => (p.at(0) * 1.6, p.at(1) * 0.8))
    line(..c1s, stroke: rgb("2980B9") + 1.4pt)
    content((3.3 * 1.6 + 0.15, 4.356 * 0.8), text(size: 8pt, fill: rgb("2980B9"))[$C_1$])

    // C2 = 4/v, points: v=0.5..3.3
    let c2 = (
      (0.5, 6.4),
      (0.7, 4.571),
      (0.9, 3.556),
      (1.1, 2.909),
      (1.587, 2.019),
      (2.0, 1.6),
      (2.5, 1.28),
      (3.0, 1.067),
      (3.3, 0.970),
    )
    let c2s = c2.map(p => (p.at(0) * 1.6, p.at(1) * 0.8))
    line(..c2s, stroke: rgb("C0392B") + 1.4pt)
    content((3.3 * 1.6 + 0.15, 0.970 * 0.8), text(size: 8pt, fill: rgb("C0392B"))[$C_2$])

    // C = C1+C2
    let ct = (
      (0.5, 6.5),
      (0.7, 4.979),
      (0.9, 4.112),
      (1.0, 3.78 + 0.22),
      (1.1, 3.585),
      (1.3, 3.472),
      (1.587, 3.027),
      (2.0, 3.2),
      (2.5, 3.78),
      (3.0, 4.667),
      (3.3, 5.326),
    )
    // Recalc: C=0.5v²+4/v
    // v=0.5: 0.125+8=8.125→clip
    // v=0.7: 0.245+5.71=5.955
    // v=0.9: 0.405+4.44=4.845
    // v=1.0: 0.5+4=4.5
    // v=1.2: 0.72+3.33=4.05
    // v=1.587: 1.259+2.521=3.780
    // v=2.0: 2+2=4
    // v=2.5: 3.125+1.6=4.725
    // v=3.0: 4.5+1.333=5.833
    // v=3.3: 5.445+1.212=6.657→clip
    let ctrue = (
      (0.7, 5.955),
      (0.9, 4.845),
      (1.0, 4.5),
      (1.2, 4.05),
      (1.587, 3.780),
      (2.0, 4.0),
      (2.5, 4.725),
      (3.0, 5.833),
    )
    let ctruescaled = ctrue.map(p => (p.at(0) * 1.6, p.at(1) * 0.8))
    line(..ctruescaled, stroke: rgb("1E8449") + 2pt)
    content((0.7 * 1.6 - 0.3, 5.955 * 0.8 + 0.15), text(size: 8pt, fill: rgb("1E8449"))[$C$])

    // Minimum mark at v₀=1.587, C=3.78
    let vx = 1.587 * 1.6
    let cy = 3.780 * 0.8
    line((vx, 0), (vx, cy), stroke: (dash: "dashed", paint: rgb("888888"), thickness: 0.6pt))
    line((0, cy), (vx, cy), stroke: (dash: "dashed", paint: rgb("888888"), thickness: 0.6pt))
    circle((vx, cy), radius: 3pt, fill: rgb("E67E22"), stroke: none)
    content((vx, -0.25), text(size: 8pt, fill: rgb("E67E22"))[$v_0$])
    content((-0.35, cy), text(size: 8pt, fill: rgb("E67E22"))[$C_min$])
  }),
)

#v(0.8em)

== Phương Pháp Chuẩn: Đạo Hàm Và Bảng Biến Thiên

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,

  eco-box[
    #text(fill: eco-amber, size: 11pt, weight: "bold")[Bước 1: Lấy Đạo Hàm]
    #v(0.5em)
    Với
    $
      C(v) = a v^2 + frac(b, v), quad v > 0,
    $
    ta có
    $
      C'(v) = 2 a v - frac(b, v^2) = frac(2 a v^3 - b, v^2).
    $

    Vì $v^2 > 0$ trên miền đang xét, *dấu của $C'(v)$ chỉ còn phụ thuộc vào tử số* $2 a v^3 - b$.

    Giải phương trình $C'(v) = 0$:
    $
      2 a v^3 - b = 0
      quad arrow.double quad
      v_0 = root(3, frac(b, 2a)).
    $
  ],

  eco-box[
    #text(fill: eco-amber, size: 11pt, weight: "bold")[Bước 2: Lập Bảng Biến Thiên]
    #v(0.5em)
    - Nếu $0 < v < v_0$ thì $2 a v^3 - b < 0$, nên $C'(v) < 0$ và hàm *giảm*.

    - Nếu $v > v_0$ thì $2 a v^3 - b > 0$, nên $C'(v) > 0$ và hàm *tăng*.

    #v(0.35em)
    #opt-bbt-open($v_0$, $C_"min"$)
  ],
)

#v(0.6em)

#note-box(title: "📌 Câu kết luận nên nói ra thành lời")[
  Từ bảng biến thiên, $C(v)$ giảm trên $(0, v_0)$ và tăng trên $(v_0, +oo)$, nên hàm số đạt *giá trị nhỏ nhất* tại $v = v_0$.

  Nếu bài có ràng buộc $v in [v_min, v_max]$, ta vẫn làm như trên, rồi *đặt $v_0$ vào đúng đoạn bị chặn* để kết luận điểm nhỏ nhất thực sự.
]

#v(0.6em)

#note-box(title: "🏆 Tỉ Lệ Vàng tại Điểm Cực Tiểu")[
  Tại $v = v_0$, từ điều kiện $2 a v_0^3 = b$ suy ra $frac(b, v_0) = 2 a v_0^2$, tức là:
  $
    C_2(v_0) = 2 C_1(v_0)
  $
  Nói cách khác: tại vận tốc tối ưu, *chi phí thời gian luôn gấp đôi chi phí nhiên liệu*, và:
  $
    C_1(v_0) = frac(C_min, 3), quad C_2(v_0) = frac(2 C_min, 3)
  $
  *2/3 tổng chi phí tối thiểu đến từ chi phí thời gian — đây chính là "chi phí ẩn"!*
]

#v(0.8em)

== Kỹ Thuật Đọc Đề — Tìm $a$ và $b$ Không Nhầm

#eco-box[
  #text(fill: eco-amber, weight: "bold")[Đừng tìm $a$ và $b$ ngay từ dòng đầu tiên]
  #v(0.35em)
  Cách làm dễ hiểu nhất là đi theo đúng ba tầng:

  - Đọc xem đề đang cho chi phí theo *1 km*, *1 giờ* hay *cả chuyến*.
  - Đổi dữ kiện nhiên liệu về dạng *chi phí cho 1 km* rồi mới gắn vào $k_1 v^2$.
  - Đổi dữ kiện thời gian về dạng *chi phí cho 1 giờ* rồi mới gắn vào $k_2 frac(S, v)$.

  Sau cùng mới chốt:
  $
    a = S k_1, quad b = S k_2.
  $
]

#note-box(title: "🧭 Mẹo nhớ trong 5 giây")[
  - $a$ luôn đi với $v^2$, nên $a$ là phần thuộc về *nhiên liệu*.

  - $b$ luôn đi với $1/v$, nên $b$ là phần thuộc về *chi phí thời gian*.

  - Phần tối ưu hóa thường không khó; phần dễ sai nhất là *đổi đơn vị* trước khi lập hàm.
]

Đối với *nhiên liệu*, đề thường cho theo ba kiểu sau:

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  block(
    fill: white,
    stroke: 1pt + eco-teal,
    inset: (x: 10pt, y: 10pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: eco-teal, weight: "bold", size: 10pt)[Cách 1: Đề cho theo 1 km]
    #v(0.35em)
    *Đề nói:* tại $v = v_*$, chi phí nhiên liệu cho $1$ km là $M$.
    #v(0.25em)
    *Làm ngay:* không cần đổi đơn vị nữa.
    #v(0.25em)
    *Công thức chốt:*
    $
      k_1 v_*^2 = M
      quad arrow.double quad
      k_1 = frac(M, v_*^2)
    $
    rồi suy ra $a = S k_1$.
  ],
  block(
    fill: white,
    stroke: 1pt + eco-amber,
    inset: (x: 10pt, y: 10pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: eco-amber, weight: "bold", size: 10pt)[Cách 2: Đề cho theo 1 giờ]
    #v(0.35em)
    *Đề nói:* tại $v = v_*$, chi phí nhiên liệu cho $1$ giờ là $M$.
    #v(0.25em)
    *Làm ngay:* trong $1$ giờ đi được $v_*$ km, nên chi phí cho $1$ km là $M / v_*$.
    #v(0.25em)
    *Công thức chốt:*
    $
      k_1 v_*^2 = frac(M, v_*)
      quad arrow.double quad
      k_1 = frac(M, v_*^3)
    $
    rồi suy ra $a = S k_1$.
  ],
  block(
    fill: white,
    stroke: 1pt + eco-green,
    inset: (x: 10pt, y: 10pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: eco-green, weight: "bold", size: 10pt)[Cách 3: Đề cho cả chuyến]
    #v(0.35em)
    *Đề nói:* tại $v = v_*$, chi phí nhiên liệu của cả chuyến là $M$.
    #v(0.25em)
    *Làm ngay:* đi thẳng vào hệ số $a$, không cần vòng qua $k_1$.
    #v(0.25em)
    *Công thức chốt:*
    $
      a v_*^2 = M
      quad arrow.double quad
      a = frac(M, v_*^2)
    $
  ],
)

#v(0.55em)

Đối với *chi phí thời gian*, đích cuối luôn là tìm $k_2$ theo đơn vị *nghìn đồng mỗi giờ*:

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.8em,
  block(
    fill: white,
    stroke: 1pt + eco-green,
    inset: (x: 10pt, y: 10pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: eco-green, weight: "bold", size: 10pt)[Nếu đề cho theo 1 giờ]
    #v(0.3em)
    Ví dụ: “chi phí nhân công là $M$ nghìn đồng mỗi giờ”.
    #v(0.25em)
    Khi đó lấy ngay $k_2 = M$, rồi:
    $
      b = S k_2.
    $
  ],
  block(
    fill: white,
    stroke: 1pt + eco-red,
    inset: (x: 10pt, y: 10pt),
    radius: 6pt,
    width: 100%,
  )[
    #text(fill: eco-red, weight: "bold", size: 10pt)[Nếu đề cho theo 1 km tại $v = v_*$]
    #v(0.3em)
    Ví dụ: “tại $v = v_*$, chi phí nhân công cho $1$ km là $M$”.
    #v(0.25em)
    Vì chi phí theo $1$ km là $k_2 / v_*$, ta có:
    $
      frac(k_2, v_*) = M
      quad arrow.double quad
      k_2 = M v_*
    $
    rồi mới suy ra $b = S k_2$.
  ],
)

#warn-box[
  Hai bẫy bị nhầm nhiều nhất là:

  - Nhiên liệu cho *1 giờ* thì phải chia cho vận tốc tham chiếu để đổi ra *1 km*.

  - Nhân công cho *1 km* thì phải nhân ngược với vận tốc tham chiếu để đổi ra *1 giờ*.
]

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION I: DẠNG CHUẨN
// ═══════════════════════════════════════════════
= Dạng I — Ba Cách Đề Hay Cho Để Tìm $a$ Và $b$

== Bài Toán Mẫu: Đề Cho Theo 1 Giờ, Giải Thật Chậm

#tln(
  id: "2D1V1-1",
  [Một công ty du lịch sử dụng ca nô cao tốc để đưa khách tham quan trên một tuyến sông dài *20 km*. Vận tốc tối đa của ca nô là *120 km/h*. Chi phí vận hành của ca nô gồm hai thành phần:
    - *Chi phí nhiên liệu:* Tính trên quãng đường di chuyển và tỉ lệ thuận với bình phương vận tốc. Biết rằng nếu ca nô chạy với vận tốc $10$ km/h thì *chi phí nhiên liệu cho 1 giờ chạy là 60 nghìn đồng*.
    - *Chi phí nhân công và bến bãi:* Tỉ lệ thuận với thời gian ca nô hoạt động. Biết rằng nếu ca nô chạy với vận tốc $10$ km/h thì *chi phí nhân công cho 1 km là 5 nghìn đồng*.

    Biết tổng chi phí vận hành được tính bằng nghìn đồng. Hỏi công ty nên cho ca nô chạy với vận tốc bao nhiêu để tổng chi phí cho một chuyến là nhỏ nhất? Tính tổng chi phí tối thiểu đó (làm tròn đến hàng đơn vị nghìn đồng).],
  [Vận tốc tối ưu khoảng $7.47$ km/h, chi phí tối thiểu khoảng $201$ nghìn đồng],
  loigiai: [
    #ppgiai[
      Bài này khó vì đề cho hai dữ kiện ở hai đơn vị khác nhau: nhiên liệu cho theo *1 giờ*, còn nhân công lại cho theo *1 km*. Muốn dễ hiểu, ta cứ đổi từng dòng về đúng đơn vị trước, rồi mới tìm $a$ và $b$.
    ]

    #note-box(title: "Tách dữ kiện thành 4 dòng ngắn")[
      - Quãng đường: $S = 20$ km.

      - Giới hạn vận tốc: $v <= 120$.

      - Nhiên liệu: tại $v = 10$ km/h, chi phí cho $1$ giờ là $60$ nghìn đồng.

      - Nhân công: tại $v = 10$ km/h, chi phí cho $1$ km là $5$ nghìn đồng.
    ]

    *Bước 1 — Từ dữ kiện nhiên liệu tìm $a$*

    Tại $v = 10$ km/h, trong $1$ giờ ca nô đi được đúng $10$ km. Vì thế:
    $
      "chi phí nhiên liệu cho 1 km" = frac(60, 10) = 6 " nghìn đồng".
    $

    Mô hình nhiên liệu theo $1$ km là $k_1 v^2$, nên tại $v = 10$ ta có:
    $
      k_1 dot 10^2 = 6
      quad arrow.double quad
      k_1 = 0.06.
    $

    Suy ra hệ số của cả chuyến là:
    $
      a = S k_1 = 20 dot 0.06 = 1.2.
    $

    *Bước 2 — Từ dữ kiện nhân công tìm $b$*

    Mô hình chi phí thời gian cho $1$ km là $k_2 / v$.
    Đề cho tại $v = 10$ km/h, chi phí nhân công cho $1$ km là $5$ nghìn đồng, nên:
    $
      frac(k_2, 10) = 5
      quad arrow.double quad
      k_2 = 50.
    $

    Vì quãng đường dài $20$ km nên:
    $
      b = S k_2 = 20 dot 50 = 1000.
    $

    #eco-box[
      Từ hai bước trên, bài toán đã rút gọn thành:
      $
        C(v) = a v^2 + frac(b, v) = 1.2 v^2 + frac(1000, v), quad v in (0, 120].
      $
    ]

    *Bước 3 — Lấy đạo hàm rồi lập bảng biến thiên*

    $
      C'(v) = 2.4 v - frac(1000, v^2).
    $

    Giải phương trình $C'(v) = 0$:
    $
      2.4 v^3 = 1000
      quad arrow.double quad
      v^3 = frac(1250, 3)
      quad arrow.double quad
      v_0 = root(3, frac(1250, 3)) approx 7.47.
    $

    #opt-bbt-open($v_0$, $C_"min"$)

    Vì $7.47 < 120$, vận tốc tối ưu này *nằm trong miền cho phép*.

    *Bước 4 — Tính chi phí tối thiểu*

    Tại $v = v_0$, từ điều kiện cực tiểu suy ra:
    $
      frac(1000, v_0) = 2 dot 1.2 v_0^2 = 2.4 v_0^2.
    $

    Do đó:
    $
      C_min = 1.2 v_0^2 + frac(1000, v_0) = 1.2 v_0^2 + 2.4 v_0^2 = 3.6 v_0^2 approx 200.83.
    $

    #ans-box[
      Vận tốc tối ưu khoảng *$7.47$ km/h*.

      Chi phí tối thiểu khoảng *$200.83$ nghìn đồng*, nên làm tròn được *$201$ nghìn đồng*.

      _Chỗ dễ nhầm nhất của bài này không phải đạo hàm, mà là bước đổi “1 giờ” sang “1 km” ở phần nhiên liệu và đổi “1 km” sang “1 giờ” ở phần nhân công._
    ]
  ],
)

== Hai Bài Còn Lại — Đề Cho Theo 1 km Và Cả Chuyến

#tln(
  id: "2D1V1-2",
  [Một ca nô du lịch chạy trên tuyến sông dài *50 km*, vận tốc tối đa *90 km/h*. Chi phí gồm:
    - *Nhiên liệu:* Tỉ lệ bình phương vận tốc trên mỗi km. Biết rằng *tại vận tốc 10 km/h, chi phí nhiên liệu cho 1 km là 2 nghìn đồng.*
    - *Nhân công và vận hành:* *40 nghìn đồng mỗi giờ.*

    Tính tổng chi phí vận hành tối thiểu cho một chuyến (nghìn đồng).],
  [300 nghìn đồng],
  loigiai: [
    #ppgiai[
      Dữ liệu cho theo *Cách 1 (per-km)* — không cần quy đổi. Bài này có đáp số *chính xác* đẹp, nên dùng để kiểm tra hiểu bài.
    ]

    *Xác định $a$ và $b$:*

    Nhiên liệu: $k_1 times 10^2 = 2 arrow.double k_1 = 0","02$ K/(km·(km/h)²). Với $S = 50$ km:
    $
      a = S k_1 = 50 times 0","02 = 1
    $

    Nhân công: $k_2 = 40$ K/giờ. $b = k_2 dot S = 40 times 50 = 2000$.

    $
      C(v) = v^2 + frac(2000, v), quad v in (0, 90]
    $

    *Tìm cực tiểu bằng đạo hàm:*
    $
      C'(v) = 2v - frac(2000, v^2) = 0 quad arrow.double quad 2v^3 = 2000 quad arrow.double quad v_0 = root(3, 1000) = 10 "km/h"
    $
    Kiểm tra: $v_0 = 10 < 90$ ✓

    #opt-bbt-open($10$, $300$)

    $
      C_min = C(10) = 10^2 + frac(2000, 10) = 100 + 200 = 300 "K"
    $

    *Kiểm tra tỉ lệ vàng:* $C_1(10) = 100$ K, $C_2(10) = 200$ K = $2 times C_1$ ✓

    #ans-box[
      Tổng chi phí tối thiểu là *300 nghìn đồng* đạt tại $v_0 = 10$ km/h.
    ]
  ],
)

#tln(
  id: "2D1V1-3",
  [Một xe tải chở hàng di chuyển quãng đường *100 km*, vận tốc tối đa *90 km/h*. Chi phí gồm:
    - *Nhiên liệu:* Tỉ lệ bình phương vận tốc trên mỗi km. Biết rằng *nếu xe chạy vận tốc 50 km/h thì chi phí nhiên liệu cho cả chuyến đi (100 km) là 500 nghìn đồng.*
    - *Lái xe và phụ cấp:* *32 nghìn đồng mỗi giờ.*

    Tìm vận tốc $v_0$ (km/h) để tối thiểu hóa chi phí và tính chi phí tối thiểu đó.],
  [$v_0 = 20$ km/h, $C_min = 240$ nghìn đồng],
  loigiai: [
    #ppgiai[
      Dữ liệu cho *chi phí cả chuyến* (Cách 3) — đây là cách cho $a$ trực tiếp nhất!
    ]

    *Xác định $a$:* Dữ kiện cho $C_1(50) = a times 50^2 = 500 arrow.double a = frac(500, 2500) = 0","2$.

    *Xác định $b$:* $k_2 = 32$ K/giờ, $S = 100$ km, $b = 32 times 100 = 3200$.

    $
      C(v) = 0","2 v^2 + frac(3200, v), quad v in (0, 90]
    $

    *Tìm cực tiểu:*
    $
      C'(v) = 0","4 v - frac(3200, v^2) = 0 quad arrow.double quad v^3 = frac(3200, 0","4) = 8000 quad arrow.double quad v_0 = root(3, 8000) = 20 "km/h"
    $

    #opt-bbt-open($20$, $240$)

    $
      C_min = C(20) = 0","2 times 400 + frac(3200, 20) = 80 + 160 = 240 "K"
    $

    *Kiểm tra tỉ lệ vàng:* $C_1 = 80$, $C_2 = 160 = 2 times 80$ ✓

    #ans-box[
      Vận tốc tối ưu *$v_0 = 20$ km/h*, chi phí tối thiểu *240 nghìn đồng*.
    ]
  ],
)

// ─── Bài Tập Trắc Nghiệm — Dạng I ───────────────────────────
== Trắc Nghiệm — Dạng I

#tn(
  id: "1D1V1-TN1",
  [Một công ty du lịch dùng ca nô chạy tuyến sông dài *20 km*, tốc độ tối đa 120 km/h. Chi phí nhiên liệu tỉ lệ bình phương vận tốc; tại $v = 10$ km/h, *chi phí nhiên liệu cho cả chuyến là 120 nghìn đồng*. Chi phí nhân công *50 nghìn đồng mỗi giờ*. Tổng chi phí tối thiểu (nghìn đồng) gần nhất với giá trị nào?],
  ([$198$], [$200$], True([$201$]), [$205$]),
  loigiai: [
    *Xác định $a$:* Nhiên liệu per km $= a v^2$. Cả chuyến $= a v^2 times S = a v^2 times 20$. Tại $v=10$: $a times 100 times 20 = 120 arrow.double a = 0","06$.

    *Xác định $b$:* $k_2 = 50$ K/giờ, $S = 20$ km $arrow.double b = k_2 times S = 50 times 20 = 1000$.

    $
      C(v) = 0","06 v^2 times 20 + frac(1000, v) = 1","2 v^2 + frac(1000, v)
    $

    $
      v_0 = root(3, frac(1000, 2 times 1","2)) = root(3, frac(1000, 2","4)) approx root(3, 416","7) approx 7","47 "km/h"
    $

    $
      C_min = 3 times 1","2 times v_0^2 = 3","6 times (416","7)^(2/3) approx 3","6 times 55","85 approx 201 "K"
    $

    #ans-box[Chi phí tối thiểu *$approx 201$ nghìn đồng*, đạt khi $v approx 7","47$ km/h.]
  ],
)

#tn(
  id: "1D1V1-TN2",
  [Cũng bài toán ca nô 20 km trên ($C(v) = 1","2v^2 + 1000/v$). Vận tốc tối ưu $v_0$ (km/h) gần nhất với giá trị nào?],
  ([$5$], True([$7$]), [$9$], [$12$]),
  loigiai: [
    $
      v_0 = root(3, frac(b, 2a)) = root(3, frac(1000, 2","4)) = root(3, 416","7) approx 7","47 "km/h"
    $
    Vì $7","47$ gần $7$ hơn gần $8$ (khoảng cách $0","47 < 0","53$), đáp án gần nhất là *B. 7*.

    #ans-box[$v_0 approx 7","47$ km/h → gần nhất với *7 km/h*.]
  ],
)

#tn(
  id: "1D1V1-TN3",
  [Vẫn bài ca nô 20 km nhưng vận tốc bị giới hạn *$v_max = 6$ km/h*. Chi phí tối thiểu (nghìn đồng) gần nhất với giá trị nào?],
  ([$200$], [$204$], [$207$], True([$210$])),
  loigiai: [
    $v_0 approx 7","47 > v_max = 6$, nên cực tiểu dịch sang $v = 6$ (Trường hợp 2):
    $
      C_min = C(6) = 1","2 times 36 + frac(1000, 6) = 43","2 + 166","67 approx 209","87 "K"
    $

    #ans-box[Chi phí tối thiểu *$approx 210$ nghìn đồng* (tại $v = 6$ km/h).]
  ],
)

#tn(
  id: "1D1V1-TN4",
  [Tại vận tốc tối ưu của bài ca nô 20 km, *chi phí nhiên liệu là 100 nghìn đồng*. Chi phí nhân công tại cùng vận tốc đó là bao nhiêu nghìn đồng?],
  ([$100$], [$150$], True([$200$]), [$300$]),
  loigiai: [
    Theo *tỉ lệ vàng*: tại $v_0$, chi phí nhân công $C_2(v_0) = 2 times C_1(v_0)$.
    $
      C_2(v_0) = 2 times 100 = 200 "K"
    $

    Giải thích: Điều kiện cực tiểu $C'(v_0) = 0 arrow.double 2a v_0^2 = b/v_0$, tức $C_1(v_0) = a v_0^2 times S$ và $C_2(v_0) = b/v_0$ có tỉ lệ $C_2 = 2 C_1$.

    #ans-box[Chi phí nhân công tại $v_0$ là *200 nghìn đồng*.]
  ],
)

#tn(
  id: "1D1V1-TN5",
  [Xe tải chạy 100 km với hàm $C(v) = 0","2v^2 + frac(k, v)$ (nghìn đồng). Biết vận tốc tối ưu là *$v_0 = 20$ km/h*. Giá trị $k$ bằng:],
  ([$1200$], [$2400$], True([$3200$]), [$4000$]),
  loigiai: [
    Từ điều kiện cực tiểu:
    $
      v_0 = root(3, frac(k, 2a)) = root(3, frac(k, 0","4)) = 20
    $
    $
      frac(k, 0","4) = 20^3 = 8000 quad arrow.double quad k = 0","4 times 8000 = 3200
    $

    Kiểm tra: $C'(20) = 0","4 times 20 - 3200/400 = 8 - 8 = 0$ ✓

    #ans-box[$k = 3200$.]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION II: RÀNG BUỘC VẬN TỐC
// ═══════════════════════════════════════════════
= Dạng II — Vận Tốc Bị Ràng Buộc

== Lý Thuyết: Khi Nào Điểm Cực Tiểu Bị Chặn?

#eco-box[
  #text(fill: eco-amber, weight: "bold")[📋 Nguyên Tắc Kiểm Tra Miền]
  #v(0.5em)
  Sau khi tìm $v_0 = root(3, b slash (2a))$, chưa được chốt đáp án ngay. Phải đặt $v_0$ vào *đúng miền đang cho* rồi nhìn dấu của $C'(v)$ trên đoạn đó.

  #v(0.35em)
  Nói ngắn gọn: *đạo hàm cho mốc*, còn *BBT cho kết luận cuối cùng*.

  #v(0.45em)
  Ta có ba tình huống chuẩn:

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    align(center)[
      #text(fill: eco-amber, weight: "bold")[Trường hợp 1]
      #v(0.3em)
      $v_min <= v_0 <= v_max$\
      #v(0.3em)
      → Cực tiểu tại $v_0$\
      $C_min = C(v_0)$
    ],
    align(center)[
      #text(fill: eco-amber, weight: "bold")[Trường hợp 2]
      #v(0.3em)
      $v_0 > v_max$\
      #v(0.3em)
      → $C(v)$ giảm trên $(0, v_max]$\
      $C_min = C(v_max)$
    ],
    align(center)[
      #text(fill: eco-amber, weight: "bold")[Trường hợp 3]
      #v(0.3em)
      $v_0 < v_min$\
      #v(0.3em)
      → $C(v)$ tăng trên $[v_min, v_max]$\
      $C_min = C(v_min)$
    ],
  )
]

#v(0.5em)

#tn(
  id: "2D1V2-1",
  [Một xe tải chạy quãng đường 50 km với hàm chi phí $C(v) = v^2 + frac(2000, v)$ (nghìn đồng), trong đó $v$ là vận tốc (km/h). Do điều kiện đường xá, vận tốc bị giới hạn *$v_max = 8$ km/h*. Chi phí tối thiểu của chuyến đi là bao nhiêu nghìn đồng?],
  ([$300$], [$310$], True([$314$]), [$320$]),
  loigiai: [
    Vận tốc tối ưu không ràng buộc: $v_0 = root(3, frac(2000, 2)) = root(3, 1000) = 10$ km/h.

    Vì $v_0 = 10 > v_max = 8$, nên trên toàn bộ miền $(0, 8]$ ta có $C'(v) < 0$, tức là $C(v)$ luôn giảm.

    #opt-bbt-monotone($0^+$, $8$, $-$, $+oo$, $314$)

    Từ bảng biến thiên, giá trị nhỏ nhất trên miền cho phép đạt tại đầu phải $v = 8$:
    $
      C_min = C(8) = 8^2 + frac(2000, 8) = 64 + 250 = 314 "K"
    $

    #ans-box[Chi phí tối thiểu *314 nghìn đồng*, đạt khi $v = 8$ km/h (vận tốc cực đại cho phép).]
  ],
)

#tln(
  id: "2D1V2-2",
  [Một tàu hàng chở container trên tuyến biển dài *150 km*, chạy với vận tốc $v$ km/h ($4 <= v <= 30$). Chi phí gồm:
    - *Nhiên liệu:* Tại $v = 12$ km/h, *chi phí nhiên liệu cho cả chuyến là 432 nghìn đồng.*
    - *Chi phí vận hành (thuyền viên, bảo hiểm):* *150 nghìn đồng mỗi giờ.*

    Vận tốc tối ưu là bao nhiêu? Tính chi phí tối thiểu tương ứng.],
  [$v_0 approx 15","54$ km/h, $C_min approx 2134$ nghìn đồng],
  loigiai: [
    #ppgiai[
      Đây là bài ràng buộc điển hình: ta vẫn tìm $v_0$ bằng đạo hàm như bình thường, nhưng kết luận cuối phải dựa trên bảng biến thiên trên *đúng đoạn* $[4, 30]$.
    ]

    *Bước 1 — Tìm $a$ và $b$*

    *Xác định $a$ (Cách 3 — per-trip):*
    $
      a times 12^2 = 432 quad arrow.double quad a = frac(432, 144) = 3
    $

    *Xác định $b$:* $k_2 = 150$ K/giờ, $S = 150$ km, $b = 150 times 150 = 22\,500$.

    $
      C(v) = 3v^2 + frac(22\,500, v), quad v in [4, 30]
    $

    *Bước 2 — Lấy đạo hàm*
    $
      v_0 = root(3, frac(b, 2a)) = root(3, frac(22\,500, 6)) = root(3, 3\,750) approx 15","54 "km/h"
    $

    Vì $15.54 in [4, 30]$, điểm dừng này *nằm trong miền cho phép*.

    *Bước 3 — Lập bảng biến thiên trên đoạn $[4, 30]$*

    Ta có:
    - $C(4) = 3 dot 4^2 + frac(22\,500, 4) = 5673$.
    - $C(30) = 3 dot 30^2 + frac(22\,500, 30) = 3450$.

    #opt-bbt-bounded($4$, $v_0$, $30$, $5673$, $2134$, $3450$)

    Từ bảng biến thiên, $C(v)$ giảm từ $4$ đến $v_0$, rồi tăng từ $v_0$ đến $30$. Vì thế cực tiểu của bài toán đạt tại $v = v_0$.

    $
      C_min = C(v_0) = 3 v_0^2 + frac(22\,500, v_0) = 3 v_0^2 + 6 v_0^2 = 9 v_0^2
    $
    (dùng $b/v_0 = 2a v_0^2 = 6v_0^2$)
    $
      C_min = 9 times (3750)^(2/3) approx 9 times 237","2 approx 2134 "K"
    $

    #ans-box[
      $v_0 = root(3, 3750) approx 15","54$ km/h (trong miền $[4, 30]$), chi phí tối thiểu $approx 2134$ nghìn đồng.

      _Bài này minh họa rằng đáp án không phải lúc nào cũng là số nguyên đẹp — học sinh cần làm tròn hợp lý._
    ]
  ],
)

#tln(
  id: "2D1V2-3",
  [Trong bài Dạng I Bài 2 ($C(v) = v^2 + 2000/v$, $S = 50$ km, $v_max = 90$ km/h): Hỏi giá trị $v_max$ tối thiểu bằng bao nhiêu để vận tốc tối ưu $v_0 = 10$ km/h *vẫn nằm trong miền cho phép* và nghiệm bài toán không thay đổi?],
  [Chỉ cần $v_max >= 10$ km/h],
  loigiai: [
    Vận tốc tối ưu không ràng buộc là $v_0 = 10$ km/h. Để $v_0$ nằm trong miền $[0, v_max]$, ta cần:
    $
      v_max >= v_0 = 10 "km/h"
    $
    Bất kỳ $v_max >= 10$ km/h đều cho phép ca nô chạy tại $v = 10$ km/h.

    #ans-box[
      Giá trị tối thiểu: $v_max = 10$ km/h. Khi $v_max < 10$ km/h, vận tốc tối ưu bị "cắt" và chi phí tối thiểu tăng lên.
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION III: BÀI TOÁN NGƯỢC — TÌM THAM SỐ
// ═══════════════════════════════════════════════
= Dạng III — Bài Toán Ngược (Tìm Tham Số)

== Nguyên Tắc Chung

Khi biết *kết quả tối ưu* (chi phí tối thiểu, vận tốc tối ưu, hoặc tỉ lệ chi phí), ta có thể truy ngược để tìm các tham số ẩn.

Trong dạng này, ta thường *không cần lập lại BBT từ đầu ở mọi câu*, vì ba công thức dưới đây đã được rút ra từ đạo hàm và bảng biến thiên của dạng chuẩn.

#note-box(title: "🔑 Ba Quan Hệ Ngược Hữu Dụng")[
  Với $C(v) = a v^2 + b/v$, tại điểm cực tiểu $v_0$:

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.8em,
    align(center)[$(1)quad v_0 = root(3, frac(b, 2a))$],
    align(center)[$(2)quad b = 2a v_0^3$],
    align(center)[$(3)quad C_min = 3a v_0^2$],
  )
  Từ bất kỳ hai trong ba, ta tìm được cái còn lại.
]

#tln(
  id: "2D1V3-1",
  [Một ca nô hoạt động trên tuyến sông. Chi phí được mô hình hóa bởi $C(v) = a v^2 + b/v$ (K). Biết rằng:
    - Tại vận tốc tối ưu, *chi phí nhiên liệu là 120 nghìn đồng.*
    - Chi phí nhân công và bến bãi tại vận tốc tối ưu là *bao nhiêu?*
    - Tổng chi phí tối thiểu là bao nhiêu?

    (Không cần biết $a$, $b$, hay $v_0$ cụ thể.)],
  [Chi phí nhân công: 240 K; Tổng tối thiểu: 360 K],
  loigiai: [
    #ppgiai[
      Đây là bài toán "thuần lý" — chỉ dùng Tỉ Lệ Vàng, không cần tính số liệu cụ thể. Đây chính là điểm mạnh của lý thuyết!
    ]

    Tại điểm cực tiểu $v_0$, ta đã chứng minh: $C_2(v_0) = 2 C_1(v_0)$.

    Vì $C_1(v_0) = 120$ K, suy ra:
    $
      C_2(v_0) = 2 times 120 = 240 "K"
    $
    $
      C_min = C_1(v_0) + C_2(v_0) = 120 + 240 = 360 "K"
    $

    #ans-box[
      Chi phí nhân công tại $v_0$ là *240 K*, tổng chi phí tối thiểu là *360 K*. Không cần biết bất kỳ hệ số nào!
    ]
  ],
)

#tln(
  id: "2D1V3-2",
  [Bài toán ca nô Dạng I Bài 2 ($C(v) = a v^2 + 2000/v$) có tổng chi phí tối thiểu là 300 K đạt tại $v_0 = 10$ km/h. *Nếu công ty tăng lương nhân viên lên 50%* (tức $k_2$ tăng 50%), hãy tính lại:
    + Giá trị $b$ mới.
    + Vận tốc tối ưu mới $v_0'$.
    + Chi phí tối thiểu mới $C_min'$.
  ],
  [$b' = 3000$; $v_0' = root(3, 1500) approx 11","45$ km/h; $C_min' approx 393$ K],
  loigiai: [
    #ppgiai[
      Đây là bài toán ngược theo tham số. Không cần khảo sát lại từ đầu; chỉ cần cập nhật $b$, rồi dùng lại công thức tối ưu đã có.
    ]

    *Tham số ban đầu:* $a = 1$, $b = 2000$, $v_0 = 10$, $C_min = 300$.

    *Tăng lương 50%:* $k_2$ tăng 50%, và vì $b = k_2 S$ với $S = 50$ km không đổi:
    $
      b' = 2000 times 1","5 = 3000
    $
    $
      v_0' = root(3, frac(b', 2a)) = root(3, frac(3000, 2)) = root(3, 1500) approx 11","45 "km/h"
    $
    $
      C_min' = C(v_0') = (v_0')^2 + frac(3000, v_0') = (v_0')^2 + 2(v_0')^2 = 3(v_0')^2 = 3 times 1500^(2/3)
    $
    $
      1500^(1/3) approx 11","447, quad 1500^(2/3) approx 131","04, quad C_min' approx 3 times 131","04 = 393","1 "K"
    $

    *Quan sát:* Tăng lương 50% → chi phí tối thiểu tăng khoảng $393/300 - 1 approx 31\%$. Vận tốc tối ưu cũng tăng, vì chi phí thời gian trở nên đắt hơn nên doanh nghiệp có xu hướng chạy nhanh hơn.

    #ans-box[
      $b' = 3000$, $v_0' approx 11","45$ km/h, $C_min' approx 393$ nghìn đồng.
    ]
  ],
)

#tln(
  id: "2D1V3-3",
  [Một phương tiện di chuyển quãng đường $S$ km (chưa biết) với:
    - $k_1 = 0","06$ K/(km·(km/h)²) (hệ số nhiên liệu per km)
    - $k_2 = 50$ K/giờ (chi phí thời gian)
    Biết rằng *chi phí tối thiểu cho chuyến đi là 402 nghìn đồng*. Tìm $S$.],
  [$S = 40$ km],
  loigiai: [
    #ppgiai[
      Đây là dạng “quãng đường ẩn”. Mẹo gọn nhất là đặt cả $a$ và $b$ theo $S$, rồi rút $S$ ra từ công thức của $C_min$.
    ]

    *Xác định $a$ và $b$ theo $S$:* $a = S k_1 = 0","06 S$, $b = k_2 S = 50 S$.

    *Hàm chi phí:* $C(v) = 0","06 S v^2 + frac(50 S, v) = S (0","06 v^2 + frac(50, v))$.

    *Vận tốc tối ưu:*
    $
      v_0 = root(3, frac(50, 2 times 0","06)) = root(3, frac(50, 0","12)) = root(3, frac(1250, 3)) approx 7","47 "km/h"
    $
    (Đúng là vận tốc tối ưu của bài toán ca nô — hợp lý vì cùng tỉ lệ $k_1/k_2$!)

    *Chi phí tối thiểu:*
    $
      C_min = S times 3 root(3, 0","06 times 25^2) = S times 3 root(3, 37","5) approx S times 3 times 3","347 approx S times 10","04
    $

    Từ $C_min = 402$ K:
    $
      S = frac(402, 10","04) approx 40 "km"
    $

    *Kiểm tra:* $C(v) = 40 times (0","06 v^2 + 50/v) = 2","4 v^2 + 2000/v$. Cực tiểu tại $v_0 approx 7","47$:
    $
      C_min = 2","4 times 7","47^2 + 2000/7","47 approx 133","87 + 267","74 approx 401","6 approx 402 "K" checkmark
    $

    #ans-box[Quãng đường $S = 40$ km.]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION IV: DẠNG MỞ RỘNG
// ═══════════════════════════════════════════════
= Dạng IV — Mở Rộng và Nâng Cao

== Bài Toán Đúng/Sai Tổng Hợp

#ds(
  id: "2D1V4-1",
  [Một máy bay vận chuyển hàng hóa trên tuyến bay dài $S = 2000$ km với vận tốc $v$ km/h ($v in [400, 900]$). Chi phí gồm:
    - *Nhiên liệu:* Chi phí cho *1 giờ bay* tỉ lệ thuận $v^2$. Biết tại $v = 500$ km/h, chi phí nhiên liệu *cho 1 giờ* là 2 500 nghìn đồng.
    - *Phi hành đoàn và hạ cánh:* 1 800 nghìn đồng mỗi giờ.

    Gọi $C(v)$ là tổng chi phí cho một chuyến bay (nghìn đồng).],
  (
    False[Hệ số $k_1$ (nhiên liệu per km) thỏa mãn $k_1 = frac(1, 50)$.],
    False[Tổng chi phí: $C(v) = 10 v^2 + 3\,600\,000 slash v$.],
    False[Vận tốc tối ưu không ràng buộc là $root(3, 180\,000) approx 564","5$ km/h.],
    False[Vì $v_0 approx 564","5 in [400, 900]$, chi phí tối thiểu đạt tại $v_0$ và xấp xỉ $4\,800$ nghìn đồng.],
  ),
  loigiai: [
    *Phân tích từng mệnh đề:*

    *(a) SAI* — Tại $v = 500$ km/h, chi phí nhiên liệu cho $1$ giờ là $2500$ K nên chi phí nhiên liệu cho $1$ km là $2500/500 = 5$ K.
    Do đó:
    $
      k_1 dot 500^2 = 5
      quad arrow.double quad
      k_1 = frac(5, 250000) = frac(1, 50000),
    $
    chứ *không phải* $frac(1, 50)$.

    *(b) SAI* — Khi đó
    $
      a = S k_1 = 2000 dot frac(1, 50000) = frac(1, 25) = 0.04,
    $
    và
    $
      b = 1800 dot 2000 = 3\,600\,000.
    $
    Vậy
    $
      C(v) = 0.04 v^2 + frac(3\,600\,000, v),
    $
    không phải $10 v^2 + 3\,600\,000/v$.

    *(c) SAI* — Vận tốc tối ưu không ràng buộc là
    $
      v_0 = root(3, frac(b, 2a)) = root(3, frac(3\,600\,000, 0.08)) = root(3, 45\,000\,000) approx 355 " km/h",
    $
    nên không thể là $564.5$ km/h.

    *(d) SAI* — Vì $v_0 approx 355 < 400$, trên đoạn $[400, 900]$ hàm số tăng ngay từ đầu đoạn.

    #opt-bbt-monotone($400$, $900$, $+$, $15400$, $36400$)

    Do đó chi phí nhỏ nhất trên miền cho phép đạt tại $v = 400$:
    $
      C_min = C(400) = 0.04 dot 400^2 + frac(3\,600\,000, 400) = 6400 + 9000 = 15\,400.
    $

    #ans-box[
      - (a) *SAI* — đúng phải là $k_1 = frac(1, 50000)$.
      - (b) *SAI* — $C(v) = 0","04v^2 + 3\,600\,000 slash v$
      - (c) *SAI* — $v_0 approx 355$ km/h, không phải $564.5$ km/h.
      - (d) *SAI* — Vì $v_0 < v_min$, cực tiểu tại $v = 400$ km/h với $C_min = 15\,400$ K
    ]
  ],
)

== Mô Hình Nâng Cao: Lực Cản Không Khí

#tln(
  id: "2D1V4-2",
  [Với một số loại phương tiện (xe đua, tàu tốc độ cao), chi phí nhiên liệu *cho 1 giờ* tỉ lệ với $v^3$ (do lực cản khí áp). Xét bài toán:

    - Quãng đường $S = 60$ km, $v in (0, 200]$ km/h.
    - Chi phí nhiên liệu *cho 1 giờ* $= alpha v^3$ K, với $alpha = 0","001$.
    - Chi phí nhân công: $k_2 = 90$ K/giờ.

    + Lập hàm chi phí $C(v)$ cho cả chuyến.
    + Tìm vận tốc tối ưu $v_0$ và chi phí tối thiểu.
    + So sánh tỉ lệ $C_1(v_0) : C_2(v_0)$ với mô hình chuẩn ($C = a v^2 + b/v$).
  ],
  [$v_0 approx 35","57$ km/h, $C_min approx 228$ K, tỉ lệ $C_1:C_2 = 1:2$],
  loigiai: [
    #ppgiai[
      Điểm hay của bài này là dữ kiện nhiên liệu ban đầu nhìn khác hẳn mô hình chuẩn, nhưng sau khi nhân với thời gian $S/v$, hàm tổng vẫn quay về dạng quen thuộc $a v^2 + b/v$.
    ]

    *Bước 1 — Lập hàm $C(v)$:*

    Chi phí nhiên liệu *1 giờ* $= alpha v^3 = 0","001 v^3$. Thời gian đi $60$ km: $t = 60/v$.
    $
      C_1(v) = alpha v^3 dot frac(60, v) = 0","001 v^2 dot 60 = 0","06 v^2
    $

    Chi phí nhân công: $C_2(v) = 90 times frac(60, v) = frac(5400, v)$.

    $
      C(v) = 0","06 v^2 + frac(5400, v), quad v in (0, 200]
    $

    *Quan sát thú vị:* Dù mô hình xuất phát từ $alpha v^3$ per giờ (bậc 3), sau khi nhân với thời gian ta vẫn thu được $a v^2 + b/v$ — *cùng dạng hàm!*

    *Bước 2 — Tìm $v_0$:*
    $
      C'(v) = 0","12 v - frac(5400, v^2) = 0 quad arrow.double quad v^3 = frac(5400, 0","12) = 45\,000 quad arrow.double quad v_0 = root(3, 45\,000) approx 35","57 "km/h"
    $
    Chính xác hơn: $root(3, 45000) = root(3, 45) times 10 approx 3","557 times 10 = 35","57 < 200$ ✓.

    #opt-bbt-bounded($0^+$, $v_0$, $200$, $+oo$, $228$, $2427$)

    $
      C_min = 0","06 times (45\,000)^(2/3) + frac(5400, (45\,000)^(1/3)) = 0","06 times 1265","9 + frac(5400, 35","57)
    $
    $
      = 75","95 + 151","82 = 227","8 "K"
    $

    *Bước 3 — Tỉ lệ:*
    $C_1(v_0) = 75","95$ K, $C_2(v_0) = 151","82$ K → $C_1 : C_2 = 1 : 2$.

    Tỉ lệ vẫn là $1:2$ — như mô hình chuẩn! Điều này không ngạc nhiên vì *cấu trúc hàm giống nhau* ($a v^2 + b/v$) nên các kết luận tương tự đều đúng.

    #ans-box[
      $v_0 approx 35","57$ km/h, $C_min approx 228$ K. Tỉ lệ $C_1 : C_2 = 1 : 2$ luôn đúng với mọi hàm dạng $a v^2 + b/v$.
    ]
  ],
)

#tln(
  id: "2D1V4-3",
  [Một công ty logistics chạy xe tải đường dài. Ngoài chi phí nhiên liệu và nhân công, còn có *chi phí cố định* (phí đường, phí cầu,...) là $c = 150$ nghìn đồng cho mỗi chuyến đi. Xét tuyến đường 100 km với:
    $
      C(v) = 0","2 v^2 + frac(3200, v) + 150
    $
    + Chứng minh rằng vận tốc tối ưu vẫn là $v_0 = 20$ km/h.
    + Chi phí tối thiểu mới là bao nhiêu?
    + Nếu muốn giảm $C_min$ xuống 5%, nên điều chỉnh $c$ hay tỉ lệ $k_2$? Lý giải.
  ],
  [$v_0 = 20$ km/h, $C_min' = 390$ K],
  loigiai: [
    #ppgiai[
      Đây là ví dụ rất tốt để nhớ rằng: thêm một hằng số vào hàm số chỉ làm đồ thị tịnh tiến lên trên, còn vị trí điểm cực tiểu theo biến $v$ thì không đổi.
    ]

    *Phần (a):* Hàm $C(v) = 0","2v^2 + 3200/v + 150$. Lấy đạo hàm:
    $
      C'(v) = 0","4v - frac(3200, v^2)
    $
    Đây *giống hệt* đạo hàm của bài toán không có chi phí cố định! Hằng số $c = 150$ không ảnh hưởng đến $C'$, nên:
    $
      C'(v) = 0 quad arrow.double quad v_0 = 20 "km/h" quad checkmark
    $

    #opt-bbt-open($20$, $390$)

    *Phần (b):*
    $
      C_min' = C(20) = 0","2 times 400 + frac(3200, 20) + 150 = 80 + 160 + 150 = 390 "K"
    $

    *Phần (c):* Muốn giảm $C_min'$ xuống 5%: giảm từ 390 K xuống $390 times 0","95 = 370","5$ K → cần giảm 19,5 K.
    - Giảm $c$ từ 150 xuống $150 - 19","5 = 130","5$: *dễ tính và trực tiếp*, nhưng chi phí cố định thường khó đàm phán.
    - Giảm $k_2$ (lương nhân viên): ảnh hưởng đến cả $b$ và $v_0$, tính toán phức tạp hơn.

    #ans-box[
      $v_0 = 20$ km/h không đổi; $C_min' = 390$ K. Giảm chi phí cố định $c$ là cách trực tiếp nhất để hạ $C_min$.
    ]
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION V: TỰ LUYỆN
// ═══════════════════════════════════════════════
= Dạng V — Bài Tự Luyện

#note-box(title: "📋 Hướng Dẫn")[
  Phần này gồm các bài tự luyện có đáp án kiểm nhanh. Khi tự làm, nên giữ đúng nhịp sau:
  + Xác định dạng (Chuẩn / Ràng buộc / Ngược / Mở rộng).
  + Tìm $a$, $b$ từ dữ kiện.
  + Lấy đạo hàm, tìm $v_0$, rồi tự phác một BBT ngắn trước khi kết luận.
  + Tính $C_min$ trên đúng miền đang xét.
  + Kiểm tra tỉ lệ $C_1 : C_2 = 1 : 2$ tại $v_0$.
]

#tln(
  id: "2D1V5-1",
  [Một ca nô chạy tuyến sông dài *80 km*, $v in (0, 100]$ km/h. Chi phí nhiên liệu *tỉ lệ bình phương vận tốc per km*. Tại $v = 20$ km/h, chi phí *cả chuyến nhiên liệu là 1 600 K*. Chi phí nhân công 80 K/giờ. Tìm $C_min$.],
  [Đáp: $v_0 approx 9","28$ km/h, $C_min approx 1033$ K],
  loigiai: [
    $a dot 20^2 = 1600 arrow.double a = 4$. Ngoài ra $b = 80 dot 80 = 6400$.
    $
      C'(v) = 8v - frac(6400, v^2) = 0
      quad arrow.double quad
      v_0 = root(3, 800) approx 9","28.
    $
    Vì $v_0 < 100$, cực tiểu đạt tại $v_0$ và
    $
      C_min = 3 a v_0^2 approx 3 dot 4 dot 86","1 approx 1033 "K".
    $
  ],
)

#tln(
  id: "2D1V5-2",
  [Cùng bài toán ca nô 20 km từ Dạng I, nhưng *vận tốc tối đa chỉ là 6 km/h* (do quy định vùng sinh thái). Tính tổng chi phí tối thiểu (làm tròn đến nghìn đồng).],
  [Đáp: $C_min approx 210$ K],
  loigiai: [
    $C(v) = 1","2v^2 + 1000/v$. Vận tốc tối ưu không ràng buộc $v_0 approx 7","47 > 6$. Ràng buộc binding, tối thiểu tại $v = 6$: $C(6) = 43","2 + 166","67 = 209","87 approx 210$ K.
  ],
)

#tln(
  id: "2D1V5-3",
  [Xe tải chạy $S$ km với $C(v) = 0","5v^2 + frac(8000, v)$ (K). Biết tổng chi phí tối thiểu là *1 500 K*. Tìm quãng đường $S$ biết $k_1 = 0","005$ và $k_2 = 80$ K/giờ.],
  [Đáp: $S = 250$ km],
  loigiai: [
    $a = 0","005 S$, $b = 80 S$. $v_0 = root(3, 80S / (2 times 0","005 S)) = root(3, 8000) = 20$. $C_min = 3 times 0","005 S times 400 = 6S$. Từ $6S = 1500 arrow.double S = 250$ km.
  ],
)

#tln(
  id: "2D1V5-4",
  [Doanh nghiệp vận tải đang xét hai phương án:
    - *Phương án A:* Ca nô với $C_A(v) = 1","2v^2 + 1000/v$ (K), $v_max = 120$ km/h.
    - *Phương án B:* Thuyền chậm hơn với $C_B(v) = 0","3v^2 + 4000/v$ (K), $v_max = 50$ km/h.
    Hỏi phương án nào có chi phí tối thiểu thấp hơn và chênh lệch bao nhiêu?],
  [Đáp: $C_{A,min} approx 201$ K; $C_{B,min} approx 319$ K. Chọn phương án A, tiết kiệm khoảng $118$ K.],
  loigiai: [
    Phương án A: $v_{A,0} approx 7","47$ km/h, $C_{A,min} approx 201$ K.
    Phương án B: $v_{B,0} = root(3, 4000/0","6) = root(3, 6667) approx 18","85 < 50$ ✓. $C_{B,min} = 3 times 0","3 times (6667)^(2/3) approx 0","9 times 354","0 approx 318","6$ K.

    Vậy phương án A rẻ hơn khoảng $318","6 - 200","8 approx 117","8$ K, tức khoảng *118 K*.
  ],
)

#pagebreak()

// ═══════════════════════════════════════════════
// SECTION VI: BẢNG TỔNG KẾT
// ═══════════════════════════════════════════════
= Bảng Tổng Kết — Công Thức Cốt Lõi

#eco-box[
  #text(fill: eco-amber, size: 12pt, weight: "bold")[📊 Bảng Công Thức Chuyên Đề Chi Phí Ẩn]
  #v(0.8em)
  #table(
    columns: (28%, 36%, 36%),
    stroke: 0.5pt + rgb("4A6FA5"),
    fill: (x, y) => if y == 0 { rgb("0D1B2A") } else if calc.odd(y) { rgb("1A3050") } else { rgb("162840") },
    inset: (x: 10pt, y: 8pt),
    align: (left, center, center),
    [#text(fill: eco-amber, weight: "bold")[Đại Lượng]],
    [#text(fill: eco-amber, weight: "bold")[Công Thức]],
    [#text(fill: eco-amber, weight: "bold")[Ghi Chú]],

    [#text(fill: white)[Hàm chi phí]],
    [#text(fill: white)[$C(v) = a v^2 + b/v$]],
    [#text(fill: rgb("AED6F1"))[$a = S k_1$, $b = S k_2$]],

    [#text(fill: white)[Vận tốc tối ưu]],
    [#text(fill: white)[$v_0 = root(3, b / (2a))$]],
    [#text(fill: rgb("AED6F1"))[Từ $C'(v_0) = 0$]],

    [#text(fill: white)[Chi phí tối thiểu]],
    [#text(fill: white)[$C_min = 3 a v_0^2$]],
    [#text(fill: rgb("AED6F1"))[$= 3 root(3, a (b/2)^2)$]],

    [#text(fill: white)[Tỉ lệ vàng]],
    [#text(fill: white)[$C_1 : C_2 = 1 : 2$]],
    [#text(fill: rgb("AED6F1"))[Luôn đúng tại $v_0$]],

    [#text(fill: white)[Khi $v_0 > v_max$]],
    [#text(fill: white)[$C_min = C(v_max)$]],
    [#text(fill: rgb("AED6F1"))[C giảm trên $(0, v_0)$]],

    [#text(fill: white)[Khi $v_0 < v_min$]],
    [#text(fill: white)[$C_min = C(v_min)$]],
    [#text(fill: rgb("AED6F1"))[C tăng trên $(v_0, +oo)$]],

    [#text(fill: white)[Hằng số cộng thêm]],
    [#text(fill: white)[$C(v) + c$: $v_0$ không đổi]],
    [#text(fill: rgb("AED6F1"))[$c$ không ảnh hưởng $C'$]],
  )
]

#v(1em)

#note-box(title: "🎯 Quy Trình Giải Bài Toán Chi Phí Ẩn")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    [
      *1. Xác định dạng dữ kiện* (per-km / per-hour / per-trip)

      *2. Tìm $k_1$* (hệ số nhiên liệu per km):
      - Per-km: $k_1 = M/v_*^2$
      - Per-hour: $k_1 = M/v_*^3$ ← HAY SAI
      - Per-trip: $a = M/v_*^2$ (đã có $a$ luôn)

      *3. Tính $a = S k_1$, $b = k_2 S$*
    ],
    [
      *4. Tìm $v_0 = root(3, b/(2a))$*

      *5. Kiểm tra miền:*
      - $v_0 in [v_min, v_max]$? → $C_min = C(v_0)$
      - $v_0 > v_max$? → $C_min = C(v_max)$
      - $v_0 < v_min$? → $C_min = C(v_min)$

      *6. Tính $C_min$ và làm tròn đúng chiều*
    ],
  )
]

#v(0.8em)
#align(center)[
  #block(
    fill: rgb("0D1B2A"),
    radius: 8pt,
    inset: (x: 20pt, y: 12pt),
  )[
    #text(fill: eco-amber, size: 10pt, style: "italic")[
      _"Chi phí ẩn không nằm ở chỗ bạn nhìn thấy — nó ẩn trong thứ bạn bỏ qua."_
    ]
    #v(0.2em)
    #text(fill: rgb("7F8C8D"), size: 9pt)[— Nguyên lý tối ưu hóa kinh tế vận tải]
  ]
]
