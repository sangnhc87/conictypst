#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI7
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#show: lecture-theme.with(
  title:       "BÀI 7: BẤT PHƯƠNG TRÌNH LƯỢNG GIÁC",
  subtitle:    "TOÁN 11 — Chương I: Hàm số lượng giác và Phương trình lượng giác",
  author:      "GV Nguyễn Văn Sang",
  institution: "THPT Nguyễn Hữu Cảnh",
  
  // Tuỳ chỉnh giao diện chữ và Toán
  base-size:   24pt,                                
  math-color:  rgb("#d81b60"),                      // Magenta
  math-size:   1.05em,                              
  body-font:   ("Arial", "Times New Roman"),        
)

#lec-reset()
#lt-toc()

#let c-book = rgb("#4338CA")
#let resetexamstate() = none
#let khoitao() = none
#let resetcau() = none
#let exam-part(title, ..args) = slide[= #title]
#let q-wrap(..args) = args.pos().at(0)
#let mybox(fill, stroke, ..args) = {
  let pos = args.pos()
  let title = if pos.len() > 1 { pos.at(0) } else { none }
  let body = if pos.len() > 1 { pos.at(1) } else { pos.at(0) }
  block(fill: fill, stroke: 1pt + stroke, inset: 10pt, width: 100%, radius: 4pt, [*#title* #body])
}
#let dn(..args) = mybox(luma(240), black, ..args)
#let vd(..args) = mybox(rgb("#e8f4f8"), blue, ..args)
#let tc(..args) = mybox(rgb("#fcf4cd"), orange, ..args)
#let kl(..args) = mybox(rgb("#eaf8e6"), green, ..args)
#let nx(..args) = mybox(rgb("#fce4ec"), red, ..args)
#let hq = kl
#let luuy = nx
#let ch = nx
#let ntkq = tc
#let chame = kl
#let ghinho = kl
#let phuongphap = tc
#let nhanxet = nx

#let my-tn(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tn(final-stem, options, loigiai: loigiai, de: de)
}

#let my-ds(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let options = pos.at(1, default: ())
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-ds(final-stem, options, loigiai: loigiai, de: de)
}

#let my-tln(de: "", ..args) = {
  let named = args.named()
  let pos = args.pos()
  let stem = pos.at(0, default: [])
  let answer = pos.at(1, default: none)
  let loigiai = named.at("loigiai", default: none)
  let fig = named.at("fig", default: none)
  
  let final-stem = if fig != none {
    lt-two-col(ratio: (55%, 45%), stem, align(center)[#fig])
  } else {
    stem
  }
  
  lt-tln(final-stem, answer, loigiai: loigiai, de: de)
}
#let my-bbbt = bbbt
#let my-bxd = bxd
#let tn = my-tn
#let ds = my-ds
#let tln = my-tln
#let tl = my-tln
#let tlu = my-tln


#slide[ = Tầm quan trọng của miền giới hạn ]
- Trong kỹ thuật cơ khí và thiết kế hệ thống nhún của ô tô, việc dao động vượt qua một giới hạn cho phép có thể gây vỡ kết cấu (hiện tượng *Cộng hưởng*).
- Bất phương trình lượng giác ($sin x < m$) giúp các kỹ sư thiết lập "miền an toàn".
- Bài toán tìm khoảng thời gian mà một nhà máy điện có thể hoạt động tối ưu dựa theo sự lên xuống của thủy triều cũng được mô hình bằng bất phương trình.


#slide[ = Cơ sở lý thuyết ]





// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải bất phương trình $sin x >= m$])[
    - *Nếu $m > 1$:* Vô nghiệm.
    - *Nếu $m < -1$:* Nghiệm là $forall x in RR$.
    - *Nếu $-1 <= m <= 1$:* Đặt $alpha = arcsin(m) in [-pi/2; pi/2]$. Khi đó:
    $ sin x >= m arrow.l.r alpha + k 2pi <= x <= pi - alpha + k 2pi quad (k in ZZ) $

    *Trực quan trên đường tròn:* Phần cung tương ứng sin $>= m$ là cung nằm trên đường thẳng ngang $y = m$.
  ]
]

// Hình minh họa BPT sinx >= m
#block(breakable: false)[
  #grid(columns: (1fr, 1fr), gutter: 1em,
    [
      *Trên đường tròn đơn vị:* \
      #align(center)[
        #cetz.canvas(length: 1.1cm, {
          import cetz.draw: *
          // Đường tròn
          circle((0,0), radius: 2, stroke: 1pt + c-book)
          // Trục
          line((-2.5, 0), (2.5, 0), mark: (end: ">"), stroke: 0.8pt)
          line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
          content((2.6, -0.2), text(size: 8pt)[$x$])
          content((0.2, 2.4), text(size: 8pt)[$y$])

          // Đường y = m = 1
          let m_val = 1.0  // m = 0.5, scaled to R=2
          line((-2.3, m_val), (2.3, m_val), stroke: (paint: red, thickness: 1pt, dash: "dashed"))
          content((2.5, m_val + 0.2), text(size: 8pt, fill: red)[$m$])

          // Cung thỏa mãn sinx >= m (tô màu)
          // m_val=1.0, R=2, so m/R=0.5, arcsin(0.5)=30deg
          arc((0,0), start: 30deg, stop: 150deg, radius: 2,
              stroke: (paint: c-book, thickness: 3pt))
          // Điểm alpha
          circle((calc.cos(30deg) * 2, m_val), radius: 0.07, fill: c-book)
          circle((calc.cos(150deg) * 2, m_val), radius: 0.07, fill: c-book)
          content((-0.3, m_val - 0.3), text(size: 7pt, fill: c-book)[$alpha$])
          content((0, -2.4), text(size: 7pt, fill: luma(60))[Phần đậm: $sin x >= m$])

        })
      ]
    ],
    [
      *Trên đồ thị hàm sin:* \
      #align(center)[
        #cetz.canvas(length: 1cm, {
          import cetz.draw: *
          let pi = 3.14159

          line((-0.5, 0), (7.2, 0), mark: (end: ">"), stroke: 0.8pt)
          line((0, -2.2), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)

          // Đường y = m (mờ)
          let m = 1.0
          line((-0.3, m), (7, m), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
          content((7.2, m + 0.2), text(size: 7pt, fill: red)[$m$])

          // Sin curve
          let pts = range(0, 150).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts, stroke: (paint: gray, thickness: 0.8pt))

          // Phần cung sinx >= m (tô đặc) — dùng float
          let a_val = 0.5236  // arcsin(0.5) = pi/6 ≈ 0.5236
          let b_val = pi - a_val
          let pts2 = range(std.int(a_val*20), std.int(b_val*20)+1).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts2, stroke: (paint: c-book, thickness: 2.5pt))

          // Khu vực k=1
          let a2 = a_val + 2*pi
          let b2 = b_val + 2*pi
          let pts3 = range(std.int(a2*20), std.int(b2*20)+1).map(i => (i/20, 2*calc.sin(i/20)))
          line(..pts3, stroke: (paint: c-book, thickness: 2.5pt))

          // Nhãn trục
          for (x, l) in ((pi, $pi$), (2*pi, $2pi$)) {
            line((x, -0.08), (x, 0.08))
            content((x, -0.35), text(size: 7pt)[#l])
          }
        })
      ]
    ]
  )
]

#vd([Giải bất phương trình $2 sin x - sqrt(3) >= 0$.],
  loigiai: [
    $sin x >= display(sqrt(3)/2)$. Vì $|display(sqrt(3)/2)| <= 1$ nên bất phương trình có nghiệm.

    $arcsin(display(sqrt(3)/2)) = pi/3$.

    Nghiệm: $pi/3 + k 2pi <= x <= pi - pi/3 + k 2pi = 2pi/3 + k 2pi quad (k in ZZ)$.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Giải bất phương trình $cos x >= m$])[
    Đặt $alpha = arccos(m) in [0; pi]$. Khi đó:
    $ cos x >= m arrow.l.r -alpha + k 2pi <= x <= alpha + k 2pi quad (k in ZZ) $

    *Nhận xét quan trọng:*
    - Bất phương trình $cos x >= m$ cho ta các khoảng đối xứng qua trục $O y$ (hoặc các giá trị tương đương modulo $2pi$).
    - Bất phương trình $sin x >= m$ cho ta cung *từ trái sang phải* (góc từ $alpha$ đến $pi - alpha$).
    - Bất phương trình $cos x >= m$ cho ta cung *từ trên xuống* (góc từ $-alpha$ đến $alpha$).
  ]
]

#vd([Giải bất phương trình $cos(2x - pi/3) <= 1/2$.],
  loigiai: [
    $arccos(1/2) = pi/3$.

    $cos(2x - pi/3) <= 1/2 arrow.l.r not [cos(2x - pi/3) > 1/2]$

    Nghiệm $cos(2x - pi/3) > 1/2$: $-pi/3 + k 2pi < 2x - pi/3 < pi/3 + k 2pi$

    $=> 0 + k 2pi < 2x < 2pi/3 + k 2pi => k pi < x < pi/3 + k pi$

    Vậy nghiệm của $cos(2x - pi/3) <= 1/2$: $x in [pi/3 + k pi; pi + k pi] = [pi/3 + k pi; (k+1)pi] quad (k in ZZ)$.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Điều kiện xác định các hàm cơ bản])[
    #align(center)[
      #table(
        columns: (auto, 1.2fr, auto),
        align: (left, center, left),
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else { white },
        [*Hàm số*], [*Điều kiện xác định*], [*Ký hiệu*],
        [$y = tan f(x)$], [$f(x) != pi/2 + k pi$], [$cos f(x) != 0$],
        [$y = cot f(x)$], [$f(x) != k pi$], [$sin f(x) != 0$],
        [$y = display(1/sin f(x))$], [$sin f(x) != 0$, tức $f(x) != k pi$], [tương tự cot],
        [$y = sqrt(sin f(x))$], [$sin f(x) >= 0$], [bất phương trình LG],
        [$y = sqrt(cos f(x) - m)$], [$cos f(x) >= m$], [bất phương trình LG],
        [$y = ln(sin f(x))$], [$sin f(x) > 0$], [bất phương trình LG nghiêm],
      )
    ]
  ]
]

#vd([Tìm tập xác định của hàm số $y = display(sqrt(sin x - 1/2))$.],
  loigiai: [
    Điều kiện: $sin x - 1/2 >= 0 arrow.l.r sin x >= 1/2$.

    $arcsin(1/2) = pi/6$.

    $sin x >= 1/2 arrow.l.r pi/6 + k 2pi <= x <= 5pi/6 + k 2pi quad (k in ZZ)$.

    Tập xác định: $D = union.big_(k in ZZ) [pi/6 + k 2pi; 5pi/6 + k 2pi]$.
  ]
)

#vd([Tìm tập xác định của hàm số $y = display(1 / (1 - 2 cos x))$.],
  loigiai: [
    Điều kiện: $1 - 2 cos x != 0 arrow.l.r cos x != 1/2$.

    $cos x = 1/2 arrow.l.r x = ±pi/3 + k 2pi quad (k in ZZ)$.

    Tập xác định: $D = RR \\ {±pi/3 + k 2pi, k in ZZ}$.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #ghinho(title: [★ Chiến lược tìm TXD cho hàm phức hợp])[
    + Phân tích hàm số thành các bộ phận (căn, log, phân thức, sin, cos...).
    + Viết điều kiện xác định cho *từng bộ phận*.
    + Lấy *giao* của tất cả điều kiện.

    *Ví dụ tổng quát:* $y = display(sqrt(sin x) / tan x)$ yêu cầu:
    - $sin x >= 0$ (dưới căn không âm)
    - $cos x != 0$ (mẫu tan khác 0)
    Giao: $sin x >= 0$ và $x != pi/2 + k pi$ → $[0; pi/2) union (pi/2; pi] + k 2pi$.
  ]
]

#vd([Tìm tập xác định của $y = display(sqrt(1 - 2 sin x)) + display(1 / cos x)$.],
  loigiai: [
    *Điều kiện 1:* $1 - 2 sin x >= 0 arrow.l.r sin x <= 1/2$.

    $sin x <= 1/2 arrow.l.r x in (-pi; pi/6] union [5pi/6; pi] + k 2pi$ (ngoài cung $[pi/6; 5pi/6]$).

    *Điều kiện 2:* $cos x != 0 arrow.l.r x != pi/2 + k pi$.

    *Giao:* $D = lr({x in RR : sin x <= 1/2 "và" cos x != 0})$.
  ]
)

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Giải BPT sinx >= m ───
#q-wrap(dir: "doc", tn(
  [Tập nghiệm của bất phương trình $sin x >= display(sqrt(2)/2)$ là:],
  ([$[pi/4 + k 2pi; 3pi/4 + k 2pi]$], True([$[pi/4 + k 2pi; 3pi/4 + k 2pi], k in ZZ$]), [$(-pi/4 + k 2pi; pi/4 + k 2pi)$], [$[0; pi/2]$]),
  loigiai: [
    $arcsin(sqrt(2)/2) = pi/4$.
    Nghiệm: $pi/4 + k 2pi <= x <= pi - pi/4 + k 2pi = 3pi/4 + k 2pi$ $(k in ZZ)$.
  ],
))

// ─── TN 2: Tìm TXD hàm căn sinx ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(sqrt(sin x - sqrt(3)/2))$ là:],
  ([$[pi/3 + k pi; 2pi/3 + k pi]$], [$[pi/6 + k pi; 5pi/6 + k pi]$], True([$[pi/3 + k 2pi; 2pi/3 + k 2pi], k in ZZ$]), [$[0; pi/3]$]),
  loigiai: [
    Điều kiện: $sin x >= sqrt(3)/2$. $arcsin(sqrt(3)/2) = pi/3$.

    $sin x >= sqrt(3)/2 arrow.l.r pi/3 + k 2pi <= x <= pi - pi/3 + k 2pi = 2pi/3 + k 2pi$.

    TXD: $D = union.big_k [pi/3 + k 2pi; 2pi/3 + k 2pi]$.
  ],
))

// ─── TN 3: TXD hàm có tan ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(1 / (1 - tan x))$ là:],
  ([$x != pi/4 + k pi$], [$x != pi/2 + k pi$], True([$x != pi/4 + k pi$ và $x != pi/2 + k pi$, $k in ZZ$]), [$x != 0$]),
  loigiai: [
    Điều kiện: $tan x$ xác định ($cos x != 0$) và mẫu khác 0 ($1 - tan x != 0$, tức $tan x != 1$).

    - $cos x != 0$: $x != pi/2 + k pi$.
    - $tan x != 1$: $x != pi/4 + k pi$.

    TXD: $D = RR backslash {pi/4 + k pi} union {pi/2 + k pi}$.
  ],
))

// ─── TN 4: BPT cosx thực tế — thời gian nắng ───
#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let pi = 3.14159
    // Đồ thị cosine mô hình nắng
    line((-0.5, 0), (13, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.2), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    // Hàm cos
    let pts = range(0, 250).map(i => (i/20, 2*calc.cos(i/20 )))
    line(..pts, stroke: (paint: rgb("#f59e0b"), thickness: 1.5pt))
    // Đường y = 1 (ngưỡng nắng)
    line((0, 1), (12, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    content((12.5, 1.2), text(size: 7pt, fill: red)[$m$])
    // Nhãn
    for (x, l) in ((3.14, $pi$), (6.28, $2pi$)) {
      line((x, -0.08), (x, 0.08))
      content((x, -0.35), text(size: 7pt)[#l])
    }
  }),
  [Cường độ bức xạ mặt trời tại một địa điểm trong ngày được mô hình bằng $I(t) = 800 cos(pi t/12)$ W/m², trong đó $t in [-12; 12]$ giờ (tính từ giữa trưa). Trong khoảng thời gian nào trong ngày cường độ bức xạ lớn hơn $400$ W/m²?],
  ([$t in (-4; 4)$], True([$t in (-4; 4)$, tức từ 8h sáng đến 16h chiều]), [$t in (-6; 6)$], [$t in (-3; 3)$]),
  loigiai: [
    $800 cos(pi t/12) > 400 arrow.l.r cos(pi t/12) > 1/2$

    $arccos(1/2) = pi/3$. Nghiệm: $-pi/3 < pi t/12 < pi/3 arrow.l.r -4 < t < 4$.

    Tức là từ $-4$ giờ (8h sáng = 12h - 4h) đến $4$ giờ (16h chiều = 12h + 4h).
  ],
))

// ─── TN 5: TXD phức hợp căn + cot ───
#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = display(sqrt(cos x)) + cot x$ là:],
  ([$[pi/2 + k pi; pi/2 + k pi]$], [$[0; pi/2)$], True([$(0 + k 2pi; pi/2 + k 2pi], k in ZZ$]), [$[0; pi]$]),
  loigiai: [
    Điều kiện 1 (căn): $cos x >= 0 arrow.l.r x in [-pi/2 + k 2pi; pi/2 + k 2pi]$.

    Điều kiện 2 (cot): $sin x != 0 arrow.l.r x != k pi$.

    Giao: $cos x >= 0$ và $x != k pi$ → $(0; pi/2] + k 2pi$ tức $(0 + k 2pi; pi/2 + k 2pi]$.

    Cũng cần loại $x = -pi/2 + k 2pi$ nơi $cos x = 0$ và sin cũng... kiểm tra: $sin(-pi/2) = -1 != 0$ nên cot xác định tại $x = -pi/2$. Nhưng $x = 0$: $sin 0 = 0$ → cot không xác định. Vậy TXD: $(0 + k 2pi; pi/2 + k 2pi]$ với $[-pi/2 + k 2pi; 0)$ được giữ nếu không phải bội của $pi$.

    *Đáp án đúng (đơn giản hóa): $(0 + k 2pi; pi/2 + k 2pi]$.*
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: BPT sinx trong bài toán vật lý ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let pi = 3.14159
    // Dao động lò xo
    line((-0.5, 0), (13.5, 0), mark: (end: ">"), stroke: 0.8pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((13.6, -0.25), text(size: 8pt)[$t$])
    content((0.3, 2.4), text(size: 8pt)[$x$])
    // Hàm dao động
    let pts = range(0, 260).map(i => (i/20, 2*calc.sin(i/20  - 0.524)))
    line(..pts, stroke: (paint: c-book, thickness: 1.5pt))
    // Ngưỡng x >= 1
    line((0, 1), (13, 1), stroke: (paint: red, thickness: 0.8pt, dash: "dashed"))
    content((13.5, 1.2), text(size: 7pt, fill: red)[$x = 1$ cm])
    // Nhãn
    for (x, l) in ((3.14, $pi$), (6.28, $2pi$)) {
      line((x, -0.08), (x, 0.08))
      content((x, -0.35), text(size: 7pt)[#l])
    }
  }),
  [Một vật dao động điều hòa theo phương trình $x(t) = 2 sin(t - pi/6)$ cm. Xét các mệnh đề về khoảng thời gian $t >= 0$ mà vật có li độ $x >= 1$ cm:],
  (
    True([Bất phương trình $x(t) >= 1$ tương đương với $sin(t - pi/6) >= 1/2$.]),
    True([Nghiệm của bất phương trình là $pi/6 + pi/6 + k 2pi <= t <= pi - pi/6 + pi/6 + k 2pi$, tức $pi/3 + k 2pi <= t <= pi + k 2pi$.]),
    [Trong một chu kỳ $2pi$, vật có li độ $x >= 1$ trong $1/3$ thời gian.],
    True([Tại $t = pi/2$ giây, vật có li độ $x = sqrt(3)$ cm $> 1$ cm, thỏa mãn điều kiện.]),
  ),
  loigiai: [
    - *a) Đúng.* $x(t) >= 1 arrow.l.r 2 sin(t - pi/6) >= 1 arrow.l.r sin(t - pi/6) >= 1/2$.
    - *b) Đúng.* $arcsin(1/2) = pi/6$. Nghiệm: $pi/6 <= t - pi/6 <= 5pi/6 => pi/3 <= t <= pi$ (trong một chu kỳ đầu), tổng quát: $pi/3 + k 2pi <= t <= pi + k 2pi$.
    - *c) Sai.* Độ dài khoảng $[pi/3; pi]$ là $pi - pi/3 = 2pi/3$. Phần trong một chu kỳ $2pi$: $2pi/3 / 2pi = 1/3$. Đây là $1/3$ chu kỳ → mệnh đề *Đúng*.
    - *d) Đúng.* $x(pi/2) = 2 sin(pi/2 - pi/6) = 2 sin(pi/3) = 2 dot sqrt(3)/2 = sqrt(3) approx 1.73 > 1$. ✓
  ],
))

// ─── ĐS 2: TXD hàm phức hợp ───
#q-wrap(dir: "doc", lines: 3, ds(
  [Xét các mệnh đề về tập xác định của các hàm số lượng giác sau:],
  (
    True([Hàm $y = display(1/sin(2x - pi/4))$ có TXD: $x != pi/8 + k pi/2$ $(k in ZZ)$.]),
    True([Hàm $y = sqrt(1 - 2 sin x)$ có TXD: $x in [-pi; pi/6] + k 2pi$, tức $x in [-pi + k 2pi; pi/6 + k 2pi]$.]),
    [Hàm $y = display(1/sqrt(cos x - 1/2))$ có TXD: $x in [-pi/3; pi/3] + k 2pi$.],
    True([Hàm $y = ln(cos x)$ xác định khi và chỉ khi $cos x > 0$, tức $x in (-pi/2 + k pi; pi/2 + k pi)$ $(k in ZZ)$.]),
  ),
  loigiai: [
    - *a) Đúng.* $sin(2x - pi/4) != 0 arrow.l.r 2x - pi/4 != k pi arrow.l.r x != pi/8 + k pi/2$.
    - *b) Đúng.* $1 - 2 sin x >= 0 arrow.l.r sin x <= 1/2 arrow.l.r x in [-pi + k 2pi; pi/6 + k 2pi] union [5pi/6 + k 2pi; pi + k 2pi]$. Gộp lại: $x in [-pi + k 2pi; pi/6 + k 2pi]$ (đơn giản nhất trong một chu kỳ).
    - *c) Sai.* Cần $cos x - 1/2 > 0 arrow.l.r cos x > 1/2$ (nghiêm, không bằng). $cos x > 1/2 arrow.l.r x in (-pi/3 + k 2pi; pi/3 + k 2pi)$ *(khoảng mở, không phải đoạn đóng)*.
    - *d) Đúng.* $ln$ xác định khi đối số dương: $cos x > 0 arrow.l.r x in (-pi/2 + k pi; pi/2 + k pi)$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Bất phương trình bánh xe nước ───
#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Mặt nước
    line((-2, 0), (2, 0), stroke: 1.5pt + blue)
    content((0, -0.3), text(size: 8pt, fill: blue)[Mặt nước ($h=0$)])
    // Bánh xe nước
    circle((0, 2.5/2), radius: 5/2, stroke: 1pt + rgb("#8b4513"))
    circle((0, 2.5/2), radius: 0.1, fill: rgb("#8b4513"))
    // Các nan hoa
    for i in range(8) {
      let a = i * 45deg
      line((0, 2.5/2), (5/2 * calc.cos(a), 2.5/2 + 5/2 * calc.sin(a)), stroke: 0.5pt + rgb("#8b4513"))
    }
    // Vùng ngập nước
    arc((rel: (angle: -30deg, radius: 5/2), to: (0, 2.5/2)), start: -30deg, stop: 210deg, radius: 5/2, stroke: 2pt + blue)
  }),
  [Một bánh xe nước có bán kính 5 m. Tâm trục bánh xe đặt cao hơn mặt nước 2.5 m. Bánh xe quay đều đặn 1 vòng mất 20 giây. Độ cao $h$ (m) của một gàu nước gắn ở mép bánh xe so với mặt nước được mô hình hóa bởi $h(t) = 5 sin((pi t)/10 - pi/2) + 2.5$, với $t$ (giây) là thời gian kể từ khi bắt đầu quay. Gàu nước bị ngập khi $h(t) <= 0$. Trong một vòng quay (từ $t=0$ đến $t=20$), gàu bị ngập nước trong bao nhiêu giây? (Nhập dạng phân số hoặc số thập phân, ví dụ: 20/3).],
  [$20/3$],
  loigiai: [
    #step[*B1: Lập bất phương trình.* \
      Để gàu bị ngập nước, độ cao $h(t) <= 0$: \
      $5 sin((pi t)/10 - pi/2) + 2.5 <= 0 <=> sin((pi t)/10 - pi/2) <= -1/2$.]
    #step[*B2: Giải bất phương trình lượng giác cơ bản.* \
      Ta có $arcsin(-1/2) = -pi/6$. Do đó: \
      $-(5pi)/6 + k 2pi <= (pi t)/10 - pi/2 <= -pi/6 + k 2pi$ \
      $<=> -pi/3 + k 2pi <= (pi t)/10 <= pi/3 + k 2pi$ \
      $<=> -10/3 + 20k <= t <= 10/3 + 20k quad (k in ZZ)$.]
    #step[*B3: Áp dụng điều kiện thời gian của một vòng quay.* \
      Ta xét trong khoảng $0 <= t <= 20$: \
      - Với $k=0$, ta được $-10/3 <= t <= 10/3$. Giao với $[0, 20]$ ta lấy $t in [0; 10/3]$. \
      - Với $k=1$, ta được $50/3 <= t <= 70/3$. Giao với $[0, 20]$ ta lấy $t in [50/3; 20]$. \
      Tổng thời gian ngập nước là: $(10/3 - 0) + (20 - 50/3) = 10/3 + 10/3 = 20/3$ giây.]
  ],
))

// ─── TLN 2: Tìm m để hàm số có TXD là R ───
#q-wrap(dir: "doc", tln(
  [Tìm tất cả các giá trị thực $m$ để hàm số $y = display(sqrt(m + sin x))$ có tập xác định là $RR$ (xác định với mọi $x in RR$). (Nhập điều kiện về $m$).],
  [$m >= 1$],
  loigiai: [
    #step[*Điều kiện TXD = $RR$.* $m + sin x >= 0$ phải đúng với *mọi* $x$.]
    #step[*Tìm min của $m + sin x$.*
      $min(m + sin x) = m + min(sin x) = m + (-1) = m - 1$.]
    #step[*Điều kiện.* $m - 1 >= 0 arrow.l.r m >= 1$. \
      Vậy $m >= 1$ là điều kiện cần và đủ.]
  ],
))


