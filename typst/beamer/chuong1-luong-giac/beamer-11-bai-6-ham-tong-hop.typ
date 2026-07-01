#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI6
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
  title:       "BÀI 6: HÀM SỐ y = a sin x + b cos x",
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


#slide[ = Khám phá: Sự giao thoa của hai làn sóng ]
- Điều gì xảy ra khi hai sóng gặp nhau?
- Bài toán xét hàm số $y = a sin x + b cos x$ chính là việc tìm kết quả của *sự tổng hợp hai dao động điều hòa* cùng tần số.
- Thay vì xử lý hai thành phần rời rạc, các nhà toán học đã tìm ra phép biến đổi kỳ diệu để gộp chúng lại thành một biên độ duy nhất $R$ và một pha ban đầu $phi$. 
- Đây là cốt lõi của hiện tượng *giao thoa* trong âm học và quang học!


#slide[ = Cơ sở lý thuyết ]





// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức biến đổi cốt lõi])[
    Với $a, b in RR$ không đồng thời bằng 0, ta có:
    $ a sin x + b cos x = R sin(x + phi) $
    trong đó:
    $ R = sqrt(a^2 + b^2) > 0 $
    $ cos phi = display(a / R), quad sin phi = display(b / R) $

    *Cách nhớ:* Đặt $phi$ là góc trong tam giác vuông có cạnh $a$, $b$ và cạnh huyền $R$.
    - Nếu $a > 0, b > 0$: $phi in (0°, 90°)$ (góc I).
    - Nếu $a < 0, b > 0$: $phi in (90°, 180°)$ (góc II).
    - Nếu $a < 0, b < 0$: $phi in (-180°, -90°)$ (góc III).

    *Hệ quả ngay lập tức:*
    $ -R <= a sin x + b cos x <= R $
    $ max = R quad "khi" quad x + phi = pi/2 + k 2 pi $
    $ min = -R quad "khi" quad x + phi = -pi/2 + k 2 pi $
  ]
]

// Minh họa bằng CeTZ — vector quay
#block(breakable: false)[
  #align(center)[
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Hệ trục
      line((-0.5, 0), (4, 0), mark: (end: ">"), stroke: 0.8pt)
      line((0, -0.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
      content((4.1, -0.25), text(size: 9pt)[$a$])
      content((0.25, 3.4), text(size: 9pt)[$b$])
      content((-0.2, -0.2), text(size: 9pt)[$O$])

      // Tam giác vuông biểu diễn (a, b, R)
      let a_val = 2.5
      let b_val = 1.8
      let R = calc.sqrt(a_val * a_val + b_val * b_val)

      line((0, 0), (a_val, 0), stroke: (paint: rgb("#0f766e"), thickness: 2pt))
      line((a_val, 0), (a_val, b_val), stroke: (paint: rgb("#b91c1c"), thickness: 2pt))
      line((0, 0), (a_val, b_val), stroke: (paint: c-book, thickness: 2pt))

      // Nhãn
      content((a_val/2, -0.3), text(size: 9pt, fill: rgb("#0f766e"))[$a$])
      content((a_val + 0.3, b_val/2), text(size: 9pt, fill: rgb("#b91c1c"))[$b$])
      content((a_val/2 - 0.2, b_val/2 + 0.2), text(size: 10pt, weight: "bold", fill: c-book)[$R$])

      // Góc phi
      let phi_angle = calc.atan2(b_val, a_val)
      arc((rel: (angle: 0deg, radius: 0.8), to: (0,0)), start: 0deg, stop: phi_angle, radius: 0.8,
          stroke: 0.5pt + c-book)
      content((0.65, 0.2), text(size: 9pt, fill: c-book)[$phi$])

      // Điểm R
      circle((a_val, b_val), radius: 0.07, fill: c-book)

      // Chú thích
      content((a_val + 0.6, b_val + 0.2), text(size: 9pt)[$R = sqrt(a^2+b^2)$])
    })
  ]
]

#vd([Biến đổi $f(x) = 3 sin x + 4 cos x$ về dạng $R sin(x + phi)$. Tìm giá trị lớn nhất và nhỏ nhất của $f(x)$.],
  loigiai: [
    $R = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5$.

    $cos phi = 3/5$; $sin phi = 4/5$ → $phi = arctan(4/3) approx 53.1°$.

    Vậy $f(x) = 5 sin(x + phi)$.

    - $max f(x) = 5$ khi $x + phi = pi/2 + k 2pi$, tức $x = pi/2 - phi + k 2pi$.
    - $min f(x) = -5$ khi $x + phi = -pi/2 + k 2pi$.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #ghinho(title: [★ Đọc đồ thị hàm số $y = R sin(b x + phi) + d$])[
    #grid(columns: (1fr, 1fr), gutter: 1.5em,
      [
        - *Biên độ*: $R = |a|$ (chiều cao nửa sóng)
        - *Chu kỳ*: $T = display(2pi / |b|)$
        - *Tần số*: $f = display(1/T)$
        - *Pha ban đầu*: $-phi/b$ (dịch ngang)
        - *Đường trung bình*: $y = d$
      ],
      [
        #align(center)[
          #cetz.canvas(length: 1cm, {
            import cetz.draw: *
            let pi = 3.14159
            // Trục
            line((-0.5, 0), (7, 0), mark: (end: ">"), stroke: 0.7pt)
            line((0, -2), (0, 2.3), mark: (end: ">"), stroke: 0.7pt)
            // Hàm sin gốc (mờ)
            let pts1 = range(0, 140).map(i => (i/20, calc.sin(i/20)))
            line(..pts1, stroke: (paint: gray.lighten(40%), thickness: 0.6pt))
            // Hàm sin dịch pha (nét đậm)
            let phi = 0.785  // pi/4
            let pts2 = range(0, 140).map(i => (i/20, 1.5 * calc.sin(i/20 + phi)))
            line(..pts2, stroke: (paint: c-book, thickness: 1.5pt))

            // Nhãn
            content((3.14, -0.35), text(size: 7pt)[$pi$])
            content((6.28, -0.35), text(size: 7pt)[$2pi$])
            content((-0.3, 1.5), text(size: 7pt)[$R$])
            content((-0.35, -1.5), text(size: 7pt)[$-R$])
            line((-0.05, 1.5), (0.05, 1.5))
            line((-0.05, -1.5), (0.05, -1.5))
            line((3.14, -0.05), (3.14, 0.05))
            line((6.28, -0.05), (6.28, 0.05))
          })
        ]
      ]
    )
  ]
]

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #nhanxet(title: [◈ Mô hình hóa âm nhạc và điện học])[
    *Sóng âm:* Một nốt nhạc tần số $f$ Hz có phương trình áp suất:
    $ p(t) = A sin(2 pi f t + phi_0) $

    *Điện xoay chiều:* Điện áp lưới điện Việt Nam:
    $ u(t) = 220 sqrt(2) sin(100 pi t) approx 311 sin(314 t) quad text("(V)") $
    Đây là $R sin(t + phi)$ với $R = 220 sqrt(2)$, tần số 50 Hz.

    *Cộng hai nguồn điện cùng tần số:*
    $ u_1 + u_2 = U_1 sin(omega t + phi_1) + U_2 sin(omega t + phi_2) $
    Biến đổi về tổng $sin + cos$ rồi dùng công thức trên để tính biên độ tổng hợp.
  ]
]

#vd([Điện áp tại hai điểm trong mạch điện là $u_1 = 3 sin(omega t)$ và $u_2 = 4 cos(omega t)$ (V). Tính biên độ điện áp tổng $u = u_1 + u_2$.],
  loigiai: [
    $u = 3 sin(omega t) + 4 cos(omega t) = R sin(omega t + phi)$

    $R = sqrt(3^2 + 4^2) = sqrt(25) = 5$ V.

    Biên độ điện áp tổng là $5$ V.

    *Ứng dụng vật lý:* Đây chính là phép cộng véc-tơ biên độ trong giản đồ Fresnel.
  ]
)

// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Các bước giải $a sin x + b cos x = c$])[
    + Tính $R = sqrt(a^2 + b^2)$.
    + *Điều kiện có nghiệm:* $|c| <= R$ (nếu $|c| > R$: vô nghiệm).
    + Biến đổi: $R sin(x + phi) = c => sin(x + phi) = display(c/R)$.
    + Giải phương trình $sin$ cơ bản.
  ]
]

#vd([Giải phương trình $sin x + cos x = 1$.],
  loigiai: [
    $R = sqrt(1 + 1) = sqrt(2)$.

    $sin x + cos x = sqrt(2) sin(x + pi/4) = 1$

    $sin(x + pi/4) = display(1/sqrt(2)) = display(sqrt(2)/2)$

    $hoac(x + pi/4 = pi/4 + k 2pi, x + pi/4 = pi - pi/4 + k 2pi)
    <=> hoac(x = k 2pi, x = pi/2 + k 2pi) quad (k in ZZ)$
  ]
)

#block(breakable: false)[
  #luuy(title: [▲ Dạng thay thế: nhân với hệ số phụ])[
    Ngoài dạng $R sin(x+phi)$, ta cũng có thể biến đổi về $R cos(x - phi')$:
    $ a sin x + b cos x = R cos(x - phi') $
    với $cos phi' = display(b/R)$, $sin phi' = display(a/R)$.

    Dùng dạng nào cũng cho kết quả tương đương — chọn dạng dễ nhớ hơn.
  ]
]

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

// ─── TN 1: Tìm R ───
#q-wrap(dir: "doc", tn(
  [Giá trị lớn nhất của hàm số $f(x) = 5 sin x - 12 cos x$ là:],
  ([$12$], [$5$], True([$13$]), [$17$]),
  loigiai: [
    $R = sqrt(5^2 + (-12)^2) = sqrt(25 + 144) = sqrt(169) = 13$.
    Hàm số $f(x) = 13 sin(x + phi)$ với $cos phi = 5/13$, $sin phi = -12/13$.
    $max f(x) = R = 13$.
  ],
))

// ─── TN 2: Điện xoay chiều thực tế ───
#q-wrap(dir: "doc", tn(
  [Trong một mạch điện, hai điện áp thành phần là $u_1 = 3 sin(omega t)$ V và $u_2 = 4 cos(omega t)$ V. Điện áp tổng $u = u_1 + u_2$ có biên độ và pha ban đầu ($phi$ sao cho $u = R sin(omega t + phi)$) lần lượt là:],
  ([$R = 7$; $phi = 0$], [$R = 5$; $phi = 0$], True([$R = 5$; $phi = arctan(4/3) approx 53.1°$]), [$R = 5$; $phi = arctan(3/4) approx 36.9°$]),
  loigiai: [
    $u = 3 sin(omega t) + 4 cos(omega t) = R sin(omega t + phi)$ với:
    $R = sqrt(9 + 16) = 5$ V; $cos phi = 3/5$; $sin phi = 4/5$ nên $phi = arctan(4/3) approx 53.1°$.
  ],
))

// ─── TN 3: Giải phương trình asinx + bcosx = c ───
#q-wrap(dir: "doc", tn(
  [Phương trình $sqrt(3) sin x + cos x = 1$ có nghiệm là:],
  ([$x = pi/6 + k 2pi$], [$x = k pi$], True([$x = k 2pi$ hoặc $x = pi/3 + k 2pi$, $(k in ZZ)$]), [$x = pi/3 + k pi$]),
  loigiai: [
    $R = sqrt(3 + 1) = 2$. Chia hai vế cho $2$:
    $display(sqrt(3)/2) sin x + display(1/2) cos x = display(1/2)$
    $sin(x + pi/6) = display(1/2) = sin(pi/6)$

    $hoac(x + pi/6 = pi/6 + k 2pi, x + pi/6 = pi - pi/6 + k 2pi)
    arrow.l.r hoac(x = k 2pi, x = pi/3 + k 2pi)$ $(k in ZZ)$.
  ],
))

// ─── TN 4: Nhiệt độ trong ngày (mô hình hóa) ───
#q-wrap(dir: "doc", tn(
  [Nhiệt độ (°C) trong một ngày tại một thành phố được mô hình bằng $T(t) = 15 sin(pi t/12 - pi/2) + 25$, trong đó $t$ là số giờ từ nửa đêm ($0 <= t <= 24$). Nhiệt độ cao nhất trong ngày là:],
  ([$25°C$], [$35°C$], True([$40°C$]), [$15°C$]),
  loigiai: [
    $T(t)$ lớn nhất khi $sin(pi t/12 - pi/2) = 1$.
    $max T = 15 dot 1 + 25 = 40°C$.

    Thời điểm: $pi t/12 - pi/2 = pi/2 => t = 12$ giờ trưa.
  ],
))

// ─── TN 5: Chu kỳ và pha ───
#q-wrap(dir: "doc", tn(
  [Hàm số $f(x) = sin x + cos x$ có chu kỳ $T$, biên độ $R$ và pha ban đầu $phi$ lần lượt là:],
  ([$T = pi$; $R = sqrt(2)$; $phi = pi/4$], True([$T = 2pi$; $R = sqrt(2)$; $phi = pi/4$]), [$T = 2pi$; $R = 2$; $phi = pi/4$], [$T = pi$; $R = 2$; $phi = 0$]),
  loigiai: [
    $f(x) = sin x + cos x = sqrt(2) sin(x + pi/4)$. Biên độ $R = sqrt(2)$; chu kỳ $T = 2pi$; pha $phi = pi/4$.
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

// ─── ĐS 1: Mô hình hóa sóng âm ───
#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
    content((5.8, -0.4), text(size: 8pt)[$t$])
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.4, 2.3), text(size: 8pt)[$y$ (Pa)])
    
    // Scale: y max is 10, so divide by 5 for drawing height max 2
    // y1 = 6 sin(t) -> blue
    // y2 = 8 cos(t) -> red
    // y = 10 sin(t + phi) -> purple
    let pts1 = range(0, 50).map(i => { let t = i/10; (t, 6/5 * calc.sin(180deg*t/1.5)) })
    let pts2 = range(0, 50).map(i => { let t = i/10; (t, 8/5 * calc.cos(180deg*t/1.5)) })
    let pts = range(0, 50).map(i => { let t = i/10; (t, (6/5 * calc.sin(180deg*t/1.5) + 8/5 * calc.cos(180deg*t/1.5))) })
    
    line(..pts1, stroke: 1pt + blue, name: "y1")
    line(..pts2, stroke: 1pt + red, name: "y2")
    line(..pts, stroke: 1.5pt + purple, name: "y")
    
    content((1, 1.8), text(size: 7pt, fill: purple)[Tổng hợp])
    content((0.5, 0.8), text(size: 7pt, fill: blue)[$y_1$])
    content((2.5, 1.2), text(size: 7pt, fill: red)[$y_2$])
  }),
  [Một kỹ sư âm thanh phân tích sự giao thoa của hai sóng âm thành phần: $y_1 = 6 sin(440 pi t)$ và $y_2 = 8 cos(440 pi t)$ (đơn vị Pa, giây). Xét các mệnh đề về sóng tổng hợp $y = y_1 + y_2$:],
  (
    True([Biên độ của sóng tổng hợp là $R = 10$ Pa.]),
    True([Sóng tổng hợp có tần số $f = 220$ Hz (giống hai sóng thành phần).]),
    [Pha ban đầu $phi$ thỏa $tan phi = 6/8 = 0.75$.],
    True([Giá trị lớn nhất của áp suất âm thanh $y$ là $10$ Pa và đạt được khi $440 pi t + phi = pi/2 + k 2pi$.]),
  ),
  loigiai: [
    $y = 6 sin(440 pi t) + 8 cos(440 pi t) = R sin(440 pi t + phi)$ với $R = sqrt(36 + 64) = 10$.
    - *a) Đúng.* $R = sqrt(6^2 + 8^2) = 10$ Pa.
    - *b) Đúng.* Tần số $f = display(440 pi / (2pi)) = 220$ Hz.
    - *c) Sai.* $cos phi = 6/10 = 0.6$; $sin phi = 8/10 = 0.8$ nên $tan phi = 8/6 = 4/3$, không phải $3/4$.
    - *d) Đúng.* $max y = R = 10$ Pa khi $440 pi t + phi = pi/2 + k 2pi$.
  ],
))

// ─── ĐS 2: Mực nước biển ───
#q-wrap(dir: "doc", lines: 3, ds(
  [Mực nước tại một cảng cá được mô hình bằng $h(t) = 1.5 sin(pi t/6) + 2 cos(pi t/6)$ (m), $t$ tính bằng giờ. Xét các mệnh đề:],
  (
    True([Biên độ dao động mực nước là $R = 2.5$ m.]),
    True([Chu kỳ thủy triều trong mô hình này là $T = 12$ giờ.]),
    [Mực nước cao nhất trong mô hình đạt $2.5$ m so với *đường trung bình* của mô hình.],
    True([Hàm $h(t)$ có thể viết lại là $h(t) = 2.5 sin(pi t/6 + phi)$ với $tan phi = 4/3$.]),
  ),
  loigiai: [
    - *a) Đúng.* $R = sqrt{1.5^2 + 2^2} = sqrt{6.25} = 2.5$ m.
    - *b) Đúng.* $b = pi/6$ nên $T = 2pi / (pi/6) = 12$ giờ.
    - *c) Đúng.* Biên độ $R = 2.5$ m, mực nước dao động từ $-2.5$ đến $+2.5$ m so với đường trung bình.
    - *d) Đúng.* $cos phi = 1.5/2.5 = 3/5$; $sin phi = 2/2.5 = 4/5$ nên $tan phi = 4/3$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

// ─── TLN 1: Biên độ tổng hợp ───
#q-wrap(dir: "doc", tln(
  [Hai dao động cùng tần số: $x_1 = 4 sin(omega t)$ cm và $x_2 = 4 sin(omega t + 2pi/3)$ cm. Biên độ của dao động tổng hợp $x = x_1 + x_2$ bằng bao nhiêu cm?],
  [$4$],
  loigiai: [
    #step[*Dùng công thức tổng thành tích.*
      $x = 4 sin(omega t) + 4 sin(omega t + 2pi/3)$
      $= 2 dot 4 dot cos(pi/3) dot sin(omega t + pi/3)$
      $= 8 dot (1/2) dot sin(omega t + pi/3) = 4 sin(omega t + pi/3)$.]
    #step[*Biên độ tổng hợp.* $R = 4$ cm.]
  ],
))

// ─── TLN 2: Giá trị x để hàm đạt max ───
#q-wrap(dir: "doc", tln(
  [Tìm giá trị nhỏ nhất dương của $x$ để hàm số $f(x) = sqrt(3) sin x + cos x$ đạt giá trị lớn nhất. (Viết kết quả dạng $k pi/6$ với $k$ là số nguyên dương).],
  [$pi/3$],
  loigiai: [
    #step[*Biến đổi.* $R = sqrt(3+1) = 2$; $cos phi = sqrt(3)/2$; $sin phi = 1/2$ nên $phi = pi/6$. \
      $f(x) = 2 sin(x + pi/6)$.]
    #step[*Điều kiện max.* $sin(x + pi/6) = 1 arrow.l.r x + pi/6 = pi/2 + k 2pi$.]
    #step[*Giải.* $x = pi/2 - pi/6 + k 2pi = pi/3 + k 2pi$. \
      Giá trị nhỏ nhất dương: $x = pi/3$ (khi $k=0$).]
  ],
))


