#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI4
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
  title:       "BÀI 4: CÁC CÔNG THỨC LƯỢNG GIÁC",
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


#slide[ = Lịch sử: "Prosthaphaeresis" - Máy tính của thế kỷ 16 ]
- Trước thế kỷ 17 (khi Logarit ra đời), các nhà thiên văn học phải đối mặt với một cơn ác mộng: *Nhân các số thập phân cực kỳ dài với nhau* bằng tay.
- Thế kỷ 16, các nhà toán học đã phát minh ra kỹ thuật *Prosthaphaeresis* (tiếng Hy Lạp nghĩa là "Cộng và Trừ").
- Họ sử dụng *công thức biến đổi tích thành tổng*:
  $ cos(A)cos(B) = 1/2 [cos(A+B) + cos(A-B)] $
- Bằng cách tra bảng lượng giác, họ biến bài toán nhân khổng lồ thành một bài toán cộng/trừ đơn giản. Đây chính là tiền thân của máy tính!


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức cộng])[
    $ sin(a + b) &= sin a cos b + cos a sin b \
    sin(a - b) &= sin a cos b - cos a sin b \
    cos(a + b) &= cos a cos b - sin a sin b \
    cos(a - b) &= cos a cos b + sin a sin b $

    *Mẹo nhớ:*
    - "Sin thì sin cos cos sin" (cùng dấu)
    - "Cos thì cos cos sin sin" (ngược dấu)
    
    $ tan(a + b) &= (tan a + tan b) / (1 - tan a tan b) \
    tan(a - b) &= (tan a - tan b) / (1 + tan a tan b) $
  ]
]

#vd([Tính giá trị $sin 75°$.])[
  $sin 75° = sin(45° + 30°) = sin 45° cos 30° + cos 45° sin 30°$
  $ = sqrt(2)/2 dot sqrt(3)/2 + sqrt(2)/2 dot 1/2 = (sqrt(6) + sqrt(2))/4 $
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức nhân đôi và hạ bậc])[
    *Công thức nhân đôi:*
    $ sin 2a &= 2 sin a cos a \
    cos 2a &= cos^2 a - sin^2 a = 2 cos^2 a - 1 = 1 - 2 sin^2 a \
    tan 2a &= (2 tan a) / (1 - tan^2 a) $

    *Công thức hạ bậc (suy ra từ cos 2a):*
    $ cos^2 a = (1 + cos 2a) / 2 \
    sin^2 a = (1 - cos 2a) / 2 $
  ]
]

#vd([Cho $sin a = 3/5$ và $pi/2 < a < pi$. Tính $sin 2a$ và $cos 2a$.])[
  Vì $pi/2 < a < pi$ nên $cos a < 0$. Ta tính được $cos a = -4/5$.
  $sin 2a = 2 sin a cos a = 2 (3/5) (-4/5) = -24/25$.
  $cos 2a = 1 - 2 sin^2 a = 1 - 2(9/25) = 7/25$.
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Biến đổi tổng thành tích])[
    $ cos a + cos b &= 2 cos((a+b)/2) cos((a-b)/2) \
    cos a - cos b &= -2 sin((a+b)/2) sin((a-b)/2) \
    sin a + sin b &= 2 sin((a+b)/2) cos((a-b)/2) \
    sin a - sin b &= 2 cos((a+b)/2) sin((a-b)/2) $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Biến đổi tích thành tổng])[
    $ cos a cos b &= 1/2 [cos(a - b) + cos(a + b)] \
    sin a sin b &= 1/2 [cos(a - b) - cos(a + b)] \
    sin a cos b &= 1/2 [sin(a - b) + sin(a + b)] $
  ]
]

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), mark: (end: ">")) // x
    line((0, 0), (0, 2), mark: (end: ">")) // y
    bezier((0, 0), (3, 0), (1.5, 2), stroke: 1.5pt + red)
    line((0, 0), (1, 1), mark: (end: ">"), stroke: 1.5pt + blue)
    content((1, 1.3), text(size: 8pt)[$vec(v)_0$])
    arc((rel: (angle: 0deg, radius: 0.6), to: (0,0)), start: 0deg, stop: 45deg, radius: 0.6)
    content((0.8, 0.25), text(size: 8pt)[$theta$])
    content((3, -0.3), text(size: 8pt)[$R$])
  }),
  [Tầm bay xa $R$ của một viên đạn pháo bắn từ mặt đất với vận tốc ban đầu $v_0$ và góc bắn $theta$ (so với phương ngang) được cho bởi công thức $R = (v_0^2 sin 2theta) / g$, trong đó $g = 10$ m/s² là gia tốc trọng trường. Nếu $v_0 = 50$ m/s, tầm bay xa lớn nhất của viên đạn là bao nhiêu và đạt được khi góc bắn $theta$ bằng bao nhiêu?],
  ([$250$ m tại $theta = 90°$], [$125$ m tại $theta = 45°$], True([$250$ m tại $theta = 45°$]), [$250$ m tại $theta = 30°$]),
  loigiai: [
    #step[*B1: Thay số vào công thức* \
      Công thức tầm bay xa: $R = (v_0^2) / g dot sin 2theta$. \
      Thay $v_0 = 50$ và $g = 10$, ta có: $R = (50^2) / 10 dot sin 2theta = 2500 / 10 sin 2theta = 250 sin 2theta$.]
    #step[*B2: Tìm giá trị lớn nhất* \
      Ta biết rằng hàm $sin$ có giá trị lớn nhất bằng $1$. Do đó: \
      $R_max = 250 dot 1 = 250$ m.]
    #step[*B3: Xác định góc bắn* \
      $R$ đạt lớn nhất khi $sin 2theta = 1 <=> 2theta = 90° <=> theta = 45°$. \
      Vậy tầm bay xa lớn nhất là 250 m, đạt được khi bắn với góc 45 độ.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 1), radius: 0.1, fill: black) // eye
    line((0, 1), (3, 1), stroke: (dash: "dashed")) // eye level
    line((3, 0), (3, 5), stroke: 1.5pt) // wall
    line((3, 2), (3, 5), stroke: 3pt + blue) // screen
    content((3.6, 3.5), text(size: 8pt)[Màn hình])
    line((0, 1), (3, 2), stroke: 0.5pt) // to bottom
    line((0, 1), (3, 5), stroke: 0.5pt) // to top
    content((1.5, 0.7), text(size: 8pt)[$x$])
    arc((rel: (angle: 18.4deg, radius: 1), to: (0,1)), start: 18.4deg, stop: 53.1deg, radius: 1)
    content((1.3, 1.8), text(size: 8pt)[$theta$])
    content((3.3, 1.5), text(size: 8pt)[$1$ m])
    content((3.3, 3.5), text(size: 8pt)[$3$ m]) // 4 - 1 = 3
  }),
  [Tại một rạp chiếu phim, mép dưới của màn hình cách tầm mắt của một người quan sát $1$ mét và mép trên cách tầm mắt $4$ mét (theo phương thẳng đứng). Gọi $x$ là khoảng cách từ mắt người đó đến bức tường treo màn hình. Biết rằng góc nhìn $theta$ từ mắt người đó bao trọn màn hình thỏa mãn $tan theta = (3x)/(x^2 + 4)$. Góc nhìn $theta$ đạt giá trị lớn nhất khi người đó đứng cách màn hình bao nhiêu mét?],
  ([$1.5$ m], True([$2$ m]), [$2.5$ m], [$4$ m]),
  loigiai: [
    #step[*B1: Lập biểu thức $tan theta$ (Giải thích thêm)* \
      Gọi $alpha$ là góc nâng từ tầm mắt đến mép dưới màn hình, $beta$ là góc nâng đến mép trên. \
      Ta có $tan alpha = 1/x$ và $tan beta = 4/x$. \
      Góc nhìn màn hình là $theta = beta - alpha$. \
      Theo công thức cộng: $tan theta = tan(beta - alpha) = (tan beta - tan alpha) / (1 + tan beta tan alpha) = (4/x - 1/x) / (1 + 4/x^2) = (3x)/(x^2 + 4)$.]
    #step[*B2: Tìm giá trị lớn nhất của $tan theta$* \
      Vì $theta$ nhọn, $theta$ đạt max khi $tan theta$ đạt max. \
      Chia cả tử và mẫu cho $x > 0$: $tan theta = 3 / (x + 4/x)$. \
      Để phân thức lớn nhất, mẫu số $x + 4/x$ phải nhỏ nhất.]
    #step[*B3: Áp dụng Bất đẳng thức Cauchy* \
      Áp dụng BĐT Cauchy (AM-GM) cho hai số dương $x$ và $4/x$: \
      $x + 4/x >= 2 sqrt(x dot 4/x) = 2 sqrt(4) = 4$. \
      Dấu "=" xảy ra khi $x = 4/x <=> x^2 = 4 <=> x = 2$ (m). \
      Vậy góc nhìn lớn nhất khi người đó cách màn hình 2 mét.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), mark: (end: ">")) // t
    line((0, -2), (0, 2), mark: (end: ">")) // x
    content((3.8, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 1.8), text(size: 8pt)[$x$])
    // Two base waves and their sum
    let pts1 = range(0, 41).map(i => { let t = i/40; (t*3.5, 0.4 * calc.sin(360deg*t + 30deg)) })
    let pts2 = range(0, 41).map(i => { let t = i/40; (t*3.5, 0.4 * calc.sin(360deg*t + 90deg)) })
    let pts3 = range(0, 41).map(i => { let t = i/40; (t*3.5, 0.4 * calc.sin(360deg*t + 30deg) + 0.4 * calc.sin(360deg*t + 90deg)) })
    line(..pts1, stroke: (dash: "dashed", paint: gray))
    line(..pts2, stroke: (dash: "dashed", paint: gray))
    line(..pts3, stroke: 1.5pt + red)
    content((2.5, 1.3), text(size: 8pt)[Tổng hợp])
  }),
  [Hai con lắc dao động điều hòa cùng phương, cùng tần số được biểu diễn bởi $x_1(t) = 3 sin(2pi t + pi/6)$ và $x_2(t) = 3 sin(2pi t + pi/2)$ (cm). Li độ tổng hợp $x(t) = x_1(t) + x_2(t)$ có thể viết dưới dạng $x(t) = A sin(2pi t + phi)$. Giá trị của biên độ $A$ là:],
  ([$6$ cm], [$3$ cm], True([$3 sqrt(3)$ cm]), [$3 sqrt(2)$ cm]),
  loigiai: [
    #step[*B1: Viết phương trình tổng hợp* \
      Li độ tổng hợp: $x(t) = 3 sin(2pi t + pi/6) + 3 sin(2pi t + pi/2)$.]
    #step[*B2: Sử dụng công thức biến đổi tổng thành tích* \
      Áp dụng công thức: $sin a + sin b = 2 sin((a+b)/2) cos((a-b)/2)$. \
      Ta có: \
      $x(t) = 3 [sin(2pi t + pi/6) + sin(2pi t + pi/2)]$ \
      $= 3 dot 2 sin(( (2pi t + pi/6) + (2pi t + pi/2) ) / 2) cos(( (2pi t + pi/6) - (2pi t + pi/2) ) / 2)$ \
      $= 6 sin(2pi t + pi/3) cos(-pi/6)$.]
    #step[*B3: Tính biên độ* \
      Vì $cos(-pi/6) = cos(pi/6) = sqrt(3)/2$, ta được: \
      $x(t) = 6 dot (sqrt(3)/2) sin(2pi t + pi/3) = 3 sqrt(3) sin(2pi t + pi/3)$. \
      Vậy biên độ của dao động tổng hợp là $A = 3 sqrt(3)$ cm.]
  ],
))

#q-wrap(dir: "doc", tn(
  [Trong dòng điện xoay chiều, công suất tiêu thụ của một đoạn mạch là $P = U I cos phi$, trong đó $U$ và $I$ là điện áp và cường độ hiệu dụng, $phi$ là độ lệch pha giữa điện áp và dòng điện. Biết điện áp $u = 200 sqrt(2) cos(100pi t)$ (V) và $i = 2 sqrt(2) cos(100pi t - pi/3)$ (A). Công suất tiêu thụ của đoạn mạch là:],
  ([$400$ W], True([$200$ W]), [$200 sqrt(3)$ W], [$400 sqrt(2)$ W]),
  loigiai: [
    #step[*B1: Xác định các đại lượng từ phương trình* \
      Từ phương trình điện áp $u = 200 sqrt(2) cos(100pi t)$, ta có điện áp hiệu dụng $U = 200$ V. \
      Từ phương trình dòng điện $i = 2 sqrt(2) cos(100pi t - pi/3)$, ta có cường độ hiệu dụng $I = 2$ A.]
    #step[*B2: Tính độ lệch pha* \
      Độ lệch pha giữa điện áp và dòng điện là: \
      $phi = phi_u - phi_i = 0 - (-pi/3) = pi/3$.]
    #step[*B3: Tính công suất tiêu thụ* \
      Áp dụng công thức $P = U I cos phi$: \
      $P = 200 dot 2 dot cos(pi/3) = 400 dot 1/2 = 200$ W.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), stroke: (dash: "dashed", paint: gray)) // flight path
    circle((4, 0), radius: 0.1, fill: black)
    content((4.5, 0), text(size: 8pt)[Máy bay])
    line((4, 0), (0, 2.3), stroke: 1.5pt + red)
    line((4, 0), (0, -2.3), stroke: 1.5pt + red)
    arc((rel: (angle: 150deg, radius: 1), to: (4,0)), start: 150deg, stop: 210deg, radius: 1)
    content((2.5, 0), text(size: 8pt)[$theta$])
  }),
  [Khi một máy bay bay nhanh hơn vận tốc âm thanh, nó tạo ra một sóng xung kích hình nón (sóng Mach). Góc ở đỉnh nón $theta$ (góc Mach) liên hệ với vận tốc máy bay $v$ và vận tốc âm thanh $c$ qua công thức $sin(theta/2) = c / v$. Biết vận tốc âm thanh là $340$ m/s, góc ở đỉnh nón là $60°$. Vận tốc của máy bay là:],
  ([$340$ m/s], True([$680$ m/s]), [$1020$ m/s], [$510$ m/s]),
  loigiai: [
    #step[*B1: Xác định nửa góc ở đỉnh nón* \
      Đề bài cho góc ở đỉnh nón là $theta = 60°$. \
      Do đó, nửa góc ở đỉnh là $theta/2 = 30°$.]
    #step[*B2: Áp dụng công thức sóng Mach* \
      Thay $theta/2 = 30°$ và $c = 340$ m/s vào công thức $sin(theta/2) = c / v$: \
      $sin(30°) = 340 / v <=> 1/2 = 340 / v$.]
    #step[*B3: Tính vận tốc máy bay* \
      $v = 340 / (1/2) = 340 dot 2 = 680$ m/s.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((-1, 0), (3, 0), stroke: 2pt) // floor
    rect((0, 0), (1.5, 1), stroke: 1.5pt) // box
    content((0.75, 0.5), text(size: 8pt)[$W$])
    line((1.5, 0.5), (3, 1.25), mark: (end: ">"), stroke: 1.5pt + blue) // pull
    content((2.5, 1.2), text(size: 8pt)[$F$])
    line((1.5, 0.5), (3, 0.5), stroke: (dash: "dashed", paint: gray))
    arc((rel: (angle: 0deg, radius: 0.8), to: (1.5,0.5)), start: 0deg, stop: 26.5deg, radius: 0.8)
    content((2.5, 0.7), text(size: 8pt)[$theta$])
  }),
  [Lực kéo $F$ cần thiết để di chuyển một chiếc rương nặng trên sàn ngang được xấp xỉ bởi mô hình $F(theta) = (W mu) / (cos theta + mu sin theta)$, trong đó $W$ là trọng lượng rương, $mu$ là hệ số ma sát và $theta$ là góc của dây kéo so với phương ngang. Kéo dây với góc tối ưu sẽ giúp lực kéo cần thiết đạt mức thấp nhất. Biết $mu = 0.5$, xét tính đúng sai:],
  (
    [Lực kéo nhỏ nhất khi mẫu số $cos theta + 0.5 sin theta$ đạt giá trị nhỏ nhất.],
    True([Biểu thức $cos theta + 0.5 sin theta$ có thể viết gọn thành $sqrt(1.25) cos(theta - alpha)$.]),
    True([Lực kéo là nhỏ nhất khi góc kéo $theta$ thỏa mãn $tan theta = 0.5$.]),
    [Giá trị cực đại của mẫu số là $1.5$.],
  ),
  loigiai: [
    - *a) Sai:* Biểu thức lực $F$ có mẫu số là hàm của $theta$. Để $F$ đạt giá trị *nhỏ nhất* thì mẫu số phải đạt giá trị *lớn nhất*.
    - *b) Đúng:* Áp dụng công thức biến đổi biểu thức $a cos theta + b sin theta = sqrt(a^2+b^2) cos(theta - alpha)$ (với $tan alpha = b/a$). Ở đây $a=1, b=0.5 => sqrt(1^2 + 0.5^2) = sqrt(1.25)$. Ta có thể viết mẫu số dưới dạng $sqrt(1.25) cos(theta - alpha)$.
    - *c) Đúng:* Mẫu số lớn nhất khi $cos(theta - alpha) = 1 <=> theta = alpha$. Khi đó $tan theta = tan alpha = b/a = 0.5 / 1 = 0.5$.
    - *d) Sai:* Giá trị cực đại của mẫu số là hệ số đứng trước hàm cos, tức là $sqrt(1.25) approx 1.118$, không phải $1.5$.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // t
    line((0, -2.5), (0, 2.5), mark: (end: ">")) // x
    content((4.3, -0.3), text(size: 8pt)[$t$])
    content((-0.3, 2.3), text(size: 8pt)[$x$])
    let env_pts1 = range(0, 41).map(i => { let t = i/10; (t, 2 * calc.exp(-0.1 * t)) })
    let env_pts2 = range(0, 41).map(i => { let t = i/10; (t, -2 * calc.exp(-0.1 * t)) })
    let wave_pts = range(0, 81).map(i => { let t = i/20; (t, 2 * calc.exp(-0.1 * t) * calc.cos(2*180deg/calc.pi * t - 60deg)) })
    line(..env_pts1, stroke: (dash: "dashed", paint: gray))
    line(..env_pts2, stroke: (dash: "dashed", paint: gray))
    line(..wave_pts, stroke: 1pt + red)
  }),
  [Xét tín hiệu dao động tắt dần mô hình hóa bởi $x(t) = e^{-0.1t} (cos 2t + sqrt(3) sin 2t)$. Xét tính đúng sai:],
  (
    True([Có thể viết lại phần trong ngoặc thành $2 cos(2t - pi/3)$.]),
    [Biên độ của tín hiệu này là hằng số.],
    True([Hàm $x(t)$ có giá trị bằng $0$ khi $2t = pi/3 + pi/2 + k pi$.]),
    True([Biên độ của dao động giảm dần theo hàm mũ $2e^{-0.1t}$.]),
  ),
  loigiai: [
    - *a) Đúng:* Biến đổi biểu thức trong ngoặc: \ $cos 2t + sqrt(3) sin 2t = 2 (1/2 cos 2t + sqrt(3)/2 sin 2t) = 2 (cos(pi/3) cos 2t + sin(pi/3) sin 2t) = 2 cos(2t - pi/3)$.
    - *b) Sai:* Biên độ của dao động là phần hệ số nhân với hàm cos, tức là $A(t) = 2 e^{-0.1t}$. Biên độ này giảm dần theo thời gian, không phải là hằng số.
    - *c) Đúng:* $x(t) = 0$ khi và chỉ khi phần hàm lượng giác bằng 0 (vì $e^{-0.1t} > 0$): \ $cos(2t - pi/3) = 0 <=> 2t - pi/3 = pi/2 + k pi <=> 2t = pi/3 + pi/2 + k pi$.
    - *d) Đúng:* Từ ý a, ta viết được phương trình $x(t) = 2 e^{-0.1t} cos(2t - pi/3)$. Do đó, biên độ giảm dần theo hàm mũ là $2e^{-0.1t}$.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Sức căng của một cây cầu dây văng tại vị trí chịu lực cực đại được xấp xỉ tỉ lệ với hàm $S(x) = sin^4 x + cos^4 x$. Tính giá trị nhỏ nhất của $S(x)$.],
  [$0.5$],
  loigiai: [
    #step[*B1: Hạ bậc và biến đổi biểu thức* \
      Ta có $S(x) = sin^4 x + cos^4 x = (sin^2 x + cos^2 x)^2 - 2 sin^2 x cos^2 x = 1^2 - 2 (sin x cos x)^2$. \
      Vì $sin x cos x = 1/2 sin 2x$, suy ra: \
      $S(x) = 1 - 2(1/2 sin 2x)^2 = 1 - 1/2 sin^2 2x$.]
    #step[*B2: Tìm giá trị nhỏ nhất* \
      Vì $sin^2 2x$ luôn nằm trong đoạn $[0, 1]$, ta suy ra: \
      $-1/2 <= -1/2 sin^2 2x <= 0 \ => 1/2 <= 1 - 1/2 sin^2 2x <= 1$.]
    #step[*B3: Kết luận* \
      Giá trị nhỏ nhất của $S(x)$ là $1/2 = 0.5$ (đạt được khi $sin^2 2x = 1$, tương ứng $x = +-pi/4 + k pi$).]
  ],
))

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    rect((-2, -1.5), (2, 0), fill: rgb(173, 216, 230, 50%), stroke: none) // water/glass
    line((-2, 0), (2, 0), stroke: 1.5pt) // boundary
    line((0, 2), (0, -1.5), stroke: (dash: "dashed")) // normal
    line((-1.5, 1.5), (0, 0), mark: (end: ">"), stroke: 1.5pt + orange) // incident
    line((0, 0), (1.5, 1.5), mark: (end: ">"), stroke: 1.5pt + red) // reflected
    line((0, 0), (0.866, -1.5), mark: (end: ">"), stroke: 1.5pt + blue) // refracted
    arc((rel: (angle: 90deg, radius: 0.8), to: (0,0)), start: 90deg, stop: 135deg, radius: 0.8)
    content((-0.4, 1.2), text(size: 8pt)[$i$])
    arc((rel: (angle: 45deg, radius: 0.8), to: (0,0)), start: 45deg, stop: 90deg, radius: 0.8)
    content((0.4, 1.2), text(size: 8pt)[$i$])
    arc((rel: (angle: 270deg, radius: 0.8), to: (0,0)), start: 270deg, stop: 300deg, radius: 0.8)
    content((0.4, -1), text(size: 8pt)[$r$])
    content((-1.5, -0.5), text(size: 8pt)[Thủy tinh])
    content((-1.5, 0.5), text(size: 8pt)[Không khí])
  }),
  [Một tia sáng đi từ không khí (chiết suất $n_1 = 1$) vào một khối thủy tinh (chiết suất $n_2 = sqrt(3)$). Theo định luật khúc xạ ánh sáng Snell: $sin i = n_2 sin r$. Biết rằng tia phản xạ và tia khúc xạ vuông góc với nhau (tức là $i + r = 90°$). Tính góc tới $i$ bằng độ.],
  [$60$],
  loigiai: [
    #step[*B1: Áp dụng định luật Snell* \
      Thay $n_1 = 1$ và $n_2 = sqrt(3)$ vào định luật Snell: \
      $1 dot sin i = sqrt(3) sin r$.]
    #step[*B2: Sử dụng tính chất tia phản xạ và khúc xạ vuông góc* \
      Theo giả thiết, tia phản xạ và tia khúc xạ hợp với nhau góc $90°$. \
      Ta có $i + r = 90° => r = 90° - i$. \
      Suy ra $sin r = sin(90° - i) = cos i$.]
    #step[*B3: Giải phương trình tìm góc i* \
      Thay vào phương trình ở B1: \
      $sin i = sqrt(3) cos i <=> (sin i) / (cos i) = sqrt(3) <=> tan i = sqrt(3)$. \
      Suy ra $i = 60°$.]
    #step[*(Ghi chú thêm: Hiện tượng này liên quan đến góc Brewster, nơi ánh sáng phản xạ bị phân cực hoàn toàn).*]
  ],
))


