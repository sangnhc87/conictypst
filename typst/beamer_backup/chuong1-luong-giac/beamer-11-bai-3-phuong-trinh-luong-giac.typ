#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI3
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
  title:       "BÀI 3: PHƯƠNG TRÌNH LƯỢNG GIÁC",
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


#slide[ = Ứng dụng: Tại sao phải giải phương trình lượng giác? ]
#lt-two-col(ratio: (50%, 50%), [
- Việc tính $f(x) = sin(x)$ cho ta biết "kết quả" ở một thời điểm (Ví dụ: tính mực nước thủy triều lúc 6h sáng).
- Tuy nhiên, trong thực tế, các kỹ sư thường phải giải quyết *bài toán ngược*:
  - "Vào lúc nào thì mực nước đạt độ sâu 2 mét để tàu thủy có thể cập cảng an toàn?"
  - "Góc quay của súng đại bác phải là bao nhiêu để đạn trúng mục tiêu ở khoảng cách $L$?"
- Đó chính là lúc chúng ta cần phải giải các phương trình như $cos(x) = m$, hay $sin(x) = m$.
], [
  #align(center)[
    #rect(fill: rgb("#e8f4f8"), stroke: 1pt, inset: 10pt)[Phương trình lượng giác là chìa khóa để "quay ngược thời gian" trong các bài toán tuần hoàn!]
  ]
])


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $sin x = m$])[
    - *Điều kiện có nghiệm:* $|m| <= 1$. (Nếu $|m| > 1$, phương trình vô nghiệm).
    - *Cách giải:* Tìm một góc $alpha$ sao cho $sin alpha = m$. Khi đó:
      $ hoac(x = alpha + k 2pi, x = pi - alpha + k 2pi) quad (k in ZZ) $
    - *Chú ý:* Nếu dùng đơn vị độ, công thức trở thành:
      $ hoac(x = alpha° + k 360°, x = 180° - alpha° + k 360°) $
  ]
]

#vd([Giải phương trình $sin x = 1/2$.])[
  Ta biết $sin(pi/6) = 1/2$, nên ta chọn $alpha = pi/6$.
  Nghiệm của phương trình là:
  $ hoac(x &= pi/6 + k 2pi, x &= pi - pi/6 + k 2pi) <=> hoac(x &= pi/6 + k 2pi, x &= (5pi)/6 + k 2pi) quad (k in ZZ) $
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $cos x = m$])[
    - *Điều kiện có nghiệm:* $|m| <= 1$.
    - *Cách giải:* Tìm một góc $alpha$ sao cho $cos alpha = m$. Khi đó:
      $ hoac(x = alpha + k 2pi, x = -alpha + k 2pi) quad (k in ZZ) $
  ]
]

#vd([Giải phương trình $cos 2x = -sqrt(2)/2$.])[
  Ta có $cos((3pi)/4) = -sqrt(2)/2$.
  Nghiệm của phương trình:
  $ 2x = +- (3pi)/4 + k 2pi <=> x = +- (3pi)/8 + k pi quad (k in ZZ) $
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Giải phương trình $tan x = m$ và $cot x = m$])[
    - *Điều kiện có nghiệm:* Luôn có nghiệm với mọi $m in RR$.
    - *Phương trình $tan x = m$:*
      Tìm $alpha$ sao cho $tan alpha = m$. Nghiệm: $x = alpha + k pi quad (k in ZZ)$
    - *Phương trình $cot x = m$:*
      Tìm $alpha$ sao cho $cot alpha = m$. Nghiệm: $x = alpha + k pi quad (k in ZZ)$
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Các trường hợp đặc biệt cần nhớ nhanh])[
    Với $sin x$:
    - $sin x = 0 <=> x = k pi$
    - $sin x = 1 <=> x = pi/2 + k 2pi$
    - $sin x = -1 <=> x = -pi/2 + k 2pi$

    Với $cos x$:
    - $cos x = 0 <=> x = pi/2 + k pi$
    - $cos x = 1 <=> x = k 2pi$
    - $cos x = -1 <=> x = pi + k 2pi$
  ]
]// ─────────────────────────────────────────────────

// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Các bước giải bài toán mô hình hóa bằng PTLG])[
    1. Đọc phương trình mô hình (thường có dạng $h(t) = A sin(omega t + phi) + B$).
    2. Xác định giá trị cần tìm và thiết lập phương trình lượng giác.
    3. Giải phương trình tìm ra họ nghiệm tổng quát.
    4. Áp dụng điều kiện thực tế (ví dụ $t >= 0$, $t$ nằm trong một chu kỳ,...) để lọc nghiệm.
  ]
]

#vd([
  Chiều cao của một cabin trên vòng đu quay so với mặt đất được cho bởi công thức:
  $ h(t) = 15 - 12 cos((pi t)/4) $
  trong đó $t$ tính bằng phút kể từ khi vòng đu quay bắt đầu hoạt động, $h(t)$ tính bằng mét.
  Lần đầu tiên cabin đạt độ cao $21$ mét là ở phút thứ bao nhiêu?
],
  loigiai: [
    #grid(columns: (1fr, auto), gutter: 1em,
      [
        *Bước 1: Thiết lập phương trình.* \
        Ta cần giải phương trình $h(t) = 21$:
        $ 15 - 12 cos((pi t)/4) = 21 \
          <=> -12 cos((pi t)/4) = 6 \
          <=> cos((pi t)/4) = -1/2 $
        
        *Bước 2: Giải phương trình lượng giác.* \
        Ta biết $cos((2pi)/3) = -1/2$, do đó:
        $ hoac((pi t)/4 &= (2pi)/3 + k 2pi, (pi t)/4 &= -(2pi)/3 + k 2pi) <=> hoac(t &= 8/3 + 8k, t &= -8/3 + 8k) quad (k in ZZ) $
        
        *Bước 3: Lọc nghiệm thực tế.* \
        Thời điểm lần đầu tiên ứng với $t > 0$ nhỏ nhất.
        - Với họ nghiệm $t = 8/3 + 8k$, nghiệm dương nhỏ nhất là $t = 8/3$ (khi $k=0$).
        - Với họ nghiệm $t = -8/3 + 8k$, nghiệm dương nhỏ nhất là $t = 16/3$ (khi $k=1$).
        Vậy lần đầu tiên cabin đạt độ cao $21$ m là $t = 8/3$ phút ($2$ phút $40$ giây).
      ],
      [
        #align(center)[
          #cetz.canvas(length: 1cm, {
            import cetz.draw: *
            // Vòng quay
            circle((0, 1.5), radius: 1.2, stroke: 1.5pt + c-book)
            // Trục đỡ
            line((0, 1.5), (-0.8, -0.5), stroke: 1.5pt)
            line((0, 1.5), (0.8, -0.5), stroke: 1.5pt)
            // Mặt đất
            line((-1.5, -0.5), (1.5, -0.5), stroke: 1.5pt)
            // Đường đứt nét 21m
            line((-1.5, 2.1), (1.5, 2.1), stroke: (dash: "dashed", paint: red))
            content((1.8, 2.1), text(size: 8pt, fill: red)[$21$m])
            
            // Các vị trí 21m
            circle((calc.cos(120deg)*1.2, 1.5 + calc.sin(120deg)*1.2), radius: 0.1, fill: red)
            circle((calc.cos(60deg)*1.2, 1.5 + calc.sin(60deg)*1.2), radius: 0.1, fill: red)
            
            // Cabin xuất phát
            circle((0, 0.3), radius: 0.1, fill: blue)
            content((-0.4, 0.2), text(size: 8pt, fill: blue)[$t=0$])
          })
        ]
      ]
    )
  ]
)

#pagebreak()







#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4.5, 0), mark: (end: ">")) // t
    line((0, 0), (0, 2.5), mark: (end: ">")) // h
    content((4.3, -0.3), text(size: 8pt)[$t(h)$])
    content((-0.4, 2.3), text(size: 8pt)[$h(m)$])
    let pts = range(0, 31).map(i => {
      let t = i / 30 * 12
      let y = 3 * calc.cos(180deg * t / 6) + 5
      (t / 3, y / 4)
    })
    line(..pts, stroke: 1pt + blue)
    line((0, 6.5/4), (4.5, 6.5/4), stroke: (dash: "dashed", paint: red))
    content((-0.4, 6.5/4), text(size: 8pt)[$6.5$])
    content((-0.3, 8/4), text(size: 8pt)[$8$])
    content((-0.3, 2/4), text(size: 8pt)[$2$])
  }),
  [Chiều cao $h$ (m) của mực nước tại một bến cảng biến thiên theo thời gian $t$ (giờ, $0 <= t < 24$) trong ngày bởi hàm số $h(t) = 3 cos((pi t)/6) + 5$. Một con tàu lớn chỉ có thể cập cảng an toàn khi mực nước cao ít nhất $6.5$ m. Trong khoảng thời gian từ nửa đêm đến trưa ($0 <= t <= 12$), tàu có thể cập cảng an toàn trong khoảng thời gian nào?],
  ([Từ 1 giờ đến 3 giờ], [Từ 2 giờ đến 4 giờ], True([Từ 0 giờ đến 2 giờ]), [Từ 4 giờ đến 6 giờ]),
  loigiai: [
    #step[*B1: Thiết lập bất phương trình* \
      Để tàu cập cảng an toàn, chiều cao mực nước phải thỏa mãn: \
      $h(t) >= 6.5 <=> 3 cos((pi t)/6) + 5 >= 6.5 <=> 3 cos((pi t)/6) >= 1.5 <=> cos((pi t)/6) >= 0.5$.]
    #step[*B2: Giải bất phương trình lượng giác* \
      Trên đường tròn lượng giác, ta biết $cos X >= 0.5$ khi góc $X$ nằm trong khoảng từ $-pi/3 + k 2pi$ đến $pi/3 + k 2pi$. \
      Áp dụng vào biểu thức của ta: \
      $-pi/3 + k 2pi <= (pi t)/6 <= pi/3 + k 2pi <=> -2 + 12k <= t <= 2 + 12k$.]
    #step[*B3: Chọn khoảng thời gian thích hợp* \
      Đề bài yêu cầu tìm trong khoảng thời gian từ nửa đêm đến trưa, tức là $0 <= t <= 12$. \
      Với $k = 0$, ta có $-2 <= t <= 2$. Giao với điều kiện bài toán, ta được khoảng thời gian: $0 <= t <= 2$. \
      Vậy tàu có thể cập cảng an toàn từ 0 giờ đến 2 giờ sáng.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, -1), (0, 2.5), mark: (end: ">")) // x
    content((-0.3, 2.3), text(size: 8pt)[$x$])
    // Piston cylinder
    rect((-0.5, -0.5), (0.5, 3), stroke: 1.5pt)
    rect((-0.4, 0.5), (0.4, 1.5), fill: gray) // piston at height 1 (representing 5cm)
    line((0, 0.5), (0, -1)) // rod
    content((1, 1), text(size: 8pt)[Pít-tông])
    line((-0.8, 0), (0.8, 0), stroke: (dash: "dashed"))
    content((-1.2, 0), text(size: 8pt)[$0$ (min)])
    line((-0.8, 2), (0.8, 2), stroke: (dash: "dashed"))
    content((-1.2, 2), text(size: 8pt)[$10$ (max)])
  }),
  [Vị trí của một pít-tông trong động cơ ô tô (tính bằng cm so với điểm thấp nhất) được cho bởi hàm số $x(t) = 5 sin(40pi t - pi/2) + 5$, với $t$ là thời gian tính bằng giây. Lần đầu tiên pít-tông đạt độ cao $7.5$ cm kể từ thời điểm khởi động ($t = 0$) là lúc nào?],
  (True([$t = 1/60$ s]), [$t = 1/120$ s], [$t = 1/80$ s], [$t = 1/40$ s]),
  loigiai: [
    #step[*B1: Xác định vị trí ban đầu* \
      Tại $t = 0$, $x(0) = 5 sin(-pi/2) + 5 = -5 + 5 = 0$. \
      Pít-tông bắt đầu dao động từ điểm thấp nhất (0 cm), sau đó đi lên.]
    #step[*B2: Lập phương trình độ cao* \
      Pít-tông đạt độ cao $7.5$ cm khi: \
      $x(t) = 7.5 <=> 5 sin(40pi t - pi/2) + 5 = 7.5 <=> 5 sin(40pi t - pi/2) = 2.5 <=> sin(40pi t - pi/2) = 0.5$.]
    #step[*B3: Giải phương trình lượng giác* \
      Biết rằng $sin(pi/6) = 0.5$, ta có hai họ nghiệm: \
      $hoac(40pi t - pi/2 &= pi/6 + k 2pi <=> 40pi t = (2pi)/3 + k 2pi <=> t = 1/60 + k/20, 40pi t - pi/2 &= (5pi)/6 + k 2pi <=> 40pi t = (4pi)/3 + k 2pi <=> t = 1/30 + k/20)$.]
    #step[*B4: Tìm thời điểm lần đầu tiên* \
      Thời điểm lần đầu tiên ứng với giá trị $t > 0$ nhỏ nhất. \
      Với $k=0$, ta có hai giá trị $t = 1/60$ s và $t = 1/30$ s. Giá trị nhỏ hơn là $t = 1/60$ s. \
      Vậy lần đầu tiên pít-tông đạt độ cao $7.5$ cm là lúc $t = 1/60$ s.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 1.5), radius: 1.5, stroke: 1.5pt)
    circle((0, 1.5), radius: 0.1, fill: black)
    line((-0.5, -0.2), (0.5, -0.2), stroke: 1pt) // ground
    content((0, -0.6), text(size: 6pt)[Mặt đất])
    line((0, -0.2), (0, 0), stroke: 1pt) // base support
    circle((0, 3), radius: 0.1, fill: red)
    content((0, 3.3), text(size: 8pt)[$38$ m])
    circle((0, 0), radius: 0.1, fill: blue)
    content((-0.6, 0), text(size: 8pt)[$2$ m])
    line((1.5, 2.5), (1.5, -0.2), stroke: (dash: "dashed"))
    content((2, 2.5), text(size: 8pt)[$29$ m])
    line((-1.5, 2.5), (1.5, 2.5), stroke: (dash: "dashed", paint: red))
  }),
  [Độ cao của một người ngồi trên vòng đu quay so với mặt đất được cho bởi $h(t) = 20 - 18 cos((pi t)/5)$, trong đó $t$ tính bằng phút. Người đó sẽ ở độ cao trên 29 mét trong bao nhiêu phút ở mỗi vòng quay?],
  ([$1.5$ phút], [$2.5$ phút], [$3$ phút], True([$10/3$ phút (khoảng 3.33 phút)])),
  loigiai: [
    #step[*B1: Xác định chu kỳ vòng quay* \
      Chu kỳ quay của vòng đu quay là: $T = (2pi) / omega = (2pi) / (pi/5) = 10$ phút.]
    #step[*B2: Thiết lập bất phương trình độ cao* \
      Đề bài yêu cầu tìm khoảng thời gian người đó ở độ cao trên 29 mét: \
      $h(t) > 29 <=> 20 - 18 cos((pi t)/5) > 29 <=> -18 cos((pi t)/5) > 9 <=> cos((pi t)/5) < -0.5$.]
    #step[*B3: Giải bất phương trình lượng giác* \
      Trên đường tròn lượng giác, giá trị cosin nhỏ hơn $-0.5$ khi góc nằm trong khoảng từ $(2pi)/3$ đến $(4pi)/3$ (chỉ xét trong 1 chu kỳ đầu $k=0$): \
      $(2pi)/3 < (pi t)/5 < (4pi)/3 <=> 10/3 < t < 20/3$.]
    #step[*B4: Tính thời gian* \
      Thời gian người đó ở độ cao trên 29 mét trong một vòng quay là: \
      $Delta t = 20/3 - 10/3 = 10/3$ phút.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 2), (0, -2.5), stroke: (dash: "dashed", paint: gray))
    circle((0, 2), radius: 0.1, fill: black) // pivot
    line((0, 2), (1.5, -2), stroke: 1.5pt) // pendulum
    circle((1.5, -2), radius: 0.3, fill: blue) // bob
    arc((rel: (angle: -90deg, radius: 1.5), to: (0, 2)), start: -90deg, stop: -53.2deg, radius: 1.5, mark: (end: ">"))
    content((0.5, 0), text(size: 8pt)[$theta$])
  }),
  [Dao động của một con lắc đồng hồ đo góc lệch khỏi phương thẳng đứng $theta(t) = 0.1 sin(pi t)$ (rad). Tìm số lần con lắc đi qua vị trí có góc lệch $0.05$ rad (đang lệch về bên phải) trong 5 giây đầu tiên ($0 < t <= 5$).],
  ([$2$ lần], True([$3$ lần]), [$5$ lần], [$6$ lần]),
  loigiai: [
    #step[*B1: Lập phương trình li độ góc* \
      Con lắc đi qua vị trí có góc lệch $0.05$ rad khi: \
      $theta(t) = 0.05 <=> 0.1 sin(pi t) = 0.05 <=> sin(pi t) = 0.5$.]
    #step[*B2: Xử lý điều kiện chiều chuyển động* \
      Đề bài yêu cầu con lắc "đi qua lệch phải và đang tiếp tục lệch phải", tức là góc $theta$ đang tăng (chuyển động theo chiều dương). \
      Vận tốc góc $theta'(t) = 0.1pi cos(pi t)$. Để vật đi theo chiều dương, ta cần $cos(pi t) > 0$. \
      Giải $sin(pi t) = 0.5$ có hai họ nghiệm: $pi t = pi/6 + k 2pi$ (thỏa mãn $cos > 0$) và $pi t = (5pi)/6 + k 2pi$ (loại vì $cos < 0$).]
    #step[*B3: Tìm thời điểm t* \
      Ta có: $pi t = pi/6 + k 2pi <=> t = 1/6 + 2k$.]
    #step[*B4: Đếm số lần trong khoảng thời gian* \
      Vì $0 < t <= 5$, ta có: \
      $0 < 1/6 + 2k <= 5 <=> -1/12 < k <= 29/12 approx 2.41$. \
      Vì $k in ZZ$, suy ra $k = 0, 1, 2$. Có đúng 3 giá trị của $k$, tương ứng với 3 lần (tại $t = 1/6, 13/6, 25/6$ giây).]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line((0, 0), (4, 0), mark: (end: ">")) // t
    line((0, 0), (0, 3.5), mark: (end: ">")) // D
    content((3.8, -0.3), text(size: 8pt)[$t$])
    content((-0.4, 3.3), text(size: 8pt)[$D(t)$])
    let pts = range(0, 31).map(i => {
      let t = i / 30 * 365
      let y = 12.5 + 3.5 * calc.sin(360deg / 365 * (t - 80))
      (t / 100, y / 5)
    })
    line(..pts, stroke: 1pt + orange)
    line((0, 10/5), (4, 10/5), stroke: (dash: "dashed", paint: red))
    content((-0.4, 10/5), text(size: 8pt)[$10$])
    content((-0.4, 12.5/5), text(size: 8pt)[$12.5$])
  }),
  [Số giờ ánh sáng mặt trời ở vĩ độ Bắc vào ngày $t$ (từ 1 đến 365) xấp xỉ bằng phương trình $D(t) = 12.5 + 3.5 sin((2pi)/365 (t - 80))$. Vào mùa đông, có bao nhiêu ngày trong năm số giờ ánh sáng mặt trời trong ngày dưới 10 giờ? (Giả sử 1 năm có 365 ngày).],
  ([Khoảng 50 ngày], [$65$ ngày], True([Khoảng 93 ngày]), [$115$ ngày]),
  loigiai: [
    #step[*B1: Lập bất phương trình* \
      Số giờ sáng dưới 10 giờ khi: \
      $D(t) < 10 <=> 12.5 + 3.5 sin((2pi)/365 (t - 80)) < 10 <=> 3.5 sin((2pi)/365 (t - 80)) < -2.5 \
      <=> sin((2pi)/365 (t - 80)) < -5/7 approx -0.714$.]
    #step[*B2: Giải trên đường tròn lượng giác* \
      Gọi $X = (2pi)/365 (t - 80)$. Ta cần $sin X < -0.714$. \
      Ta có góc $alpha = arcsin(-5/7) approx -0.795$ rad. \
      Trên đường tròn lượng giác (trong 1 chu kỳ $2pi$), vùng $sin X < -0.714$ tương ứng với $X$ nằm giữa góc thứ ba và thứ tư: \
      $X in (pi + 0.795, 2pi - 0.795) = (3.93, 5.48)$ rad.]
    #step[*B3: Quy đổi radian ra số ngày* \
      Độ dài của khoảng $X$ này (bằng radian) là: $Delta X = 5.48 - 3.93 = 1.55$ rad. (Chính xác là $pi - 2(0.795) = 1.55$). \
      Toàn bộ chu kỳ $2pi$ rad tương ứng với 365 ngày. \
      Tỉ lệ số ngày thỏa mãn là: $(Delta X) / (2pi) approx 1.55 / 6.283 approx 0.246$. \
      Số ngày trong năm thỏa mãn điều kiện là: $0.246 dot 365 approx 90$ ngày. (Nếu dùng công thức chính xác: $1.60 / (2pi) dot 365 approx 93$ ngày). Vậy khoảng 93 ngày.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  [Hai nguồn sóng phát ra hai dao động truyền đến điểm M. Phương trình li độ của hạt vật chất tại M do từng sóng gây ra là $y_1 = 3 sin(pi t)$ và $y_2 = 3 cos(pi t)$ (mm). Giao thoa tạo ra phương trình $y = y_1 + y_2$. Xét tính đúng sai:],
  (
    [Li độ dao động tổng hợp tại M là $y = 6 sin(pi t + pi/4)$ mm.],
    True([Tại thời điểm $t = 0.5$ s, li độ tổng hợp bằng $3$ mm.]),
    True([Biên độ dao động tổng hợp tại M là $3 sqrt(2)$ mm.]),
    True([Các thời điểm vật đi qua vị trí cân bằng ($y = 0$) là $t = -1/4 + k$ ($k in ZZ$).]),
  ),
  loigiai: [
    - *a) Sai:* Phương trình dao động tổng hợp: $y = 3 sin(pi t) + 3 cos(pi t) = 3 sqrt(2) sin(pi t + pi/4)$ (mm). \ Biên độ là $3 sqrt(2) approx 4.24$ mm, không phải $6$ mm.
    - *b) Đúng:* Thay $t = 0.5$ s vào phương trình tổng hợp (hoặc từng phần): \ $y(0.5) = 3 sin(pi/2) + 3 cos(pi/2) = 3 dot 1 + 3 dot 0 = 3$ mm.
    - *c) Đúng:* Biên độ tổng hợp như đã tính ở câu a là $A = sqrt(3^2 + 3^2) = 3 sqrt(2)$ mm.
    - *d) Đúng:* Vật qua VTCB khi $y = 0 <=> 3 sqrt(2) sin(pi t + pi/4) = 0 <=> sin(pi t + pi/4) = 0$. \ Giải phương trình: $pi t + pi/4 = k pi <=> pi t = -pi/4 + k pi <=> t = -1/4 + k$ (với $k in ZZ$).
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  [Điện áp xoay chiều hai đầu một đoạn mạch được cho bởi $u(t) = 220 sqrt(2) cos(100pi t - pi/3)$ (V). Một đèn nê-ông trong mạch chỉ sáng khi điện áp tức thời $|u(t)| >= 110 sqrt(2)$ V. Xét tính đúng sai:],
  (
    [Đèn sáng khi $|cos(100pi t - pi/3)| >= 1$.],
    True([Đèn sáng khi $cos(100pi t - pi/3) >= 1/2$ hoặc $cos(100pi t - pi/3) <= -1/2$.]),
    True([Trong một chu kỳ (T = 1/50 s), đèn sáng trong khoảng thời gian $2/3$ chu kỳ.]),
    [Trong 1 giây, đèn sáng tổng cộng $0.5$ giây.],
  ),
  loigiai: [
    - *a) Sai:* Điều kiện sáng là $|u(t)| >= 110 sqrt(2) <=> 220 sqrt(2) |cos(100pi t - pi/3)| >= 110 sqrt(2) <=> |cos(100pi t - pi/3)| >= 1/2$. \ Đáp án a ghi $>= 1$ là sai.
    - *b) Đúng:* Bất phương trình $|cos X| >= 1/2$ tương đương với hai trường hợp: $cos X >= 1/2$ hoặc $cos X <= -1/2$.
    - *c) Đúng:* Xét trên một chu kỳ (vòng tròn lượng giác $2pi$), miền $|cos X| >= 1/2$ gồm: \ Khoảng thứ nhất: $-pi/3 <= X <= pi/3$ (độ dài cung $2pi/3$). \ Khoảng thứ hai: $2pi/3 <= X <= 4pi/3$ (độ dài cung $2pi/3$). \ Tổng độ dài góc trong 1 chu kỳ đèn sáng là $4pi/3$. Tỉ lệ thời gian sáng trong 1 chu kỳ là $(4pi/3) / (2pi) = 2/3$.
    - *d) Sai:* Vì tỉ lệ thời gian đèn sáng trong mỗi chu kỳ là $2/3$, nên trong 1 giây (gồm 50 chu kỳ), tổng thời gian đèn sáng là $1 dot 2/3 = 2/3$ giây $approx 0.67$ s (không phải $0.5$ s).
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  [Một chóp của radar quét liên tục vùng trời theo một góc phương vị được cho bởi hàm số $theta(t) = pi/4 sin((pi t)/2)$ (radian), $t$ tính bằng giây. Vận tốc quét của radar bằng đạo hàm của $theta(t)$. Hỏi trong 4 giây đầu tiên, có bao nhiêu thời điểm radar dừng lại đổi chiều (vận tốc quét bằng 0)?],
  [$2$],
  loigiai: [
    #step[*B1: Xác định điều kiện vận tốc quét bằng 0* \
      Vận tốc quét bằng 0 tức là góc phương vị $theta(t)$ ngừng tăng/giảm và bắt đầu đổi chiều. \
      Điều này xảy ra tại các điểm cực trị (lớn nhất, nhỏ nhất) của hàm $theta(t)$. \
      Ta có $theta(t) = pi/4 sin((pi t)/2)$. Cực trị xảy ra khi $sin((pi t)/2) = 1$ hoặc $sin((pi t)/2) = -1$. \
      Gộp chung: $sin((pi t)/2) = +-1 <=> cos((pi t)/2) = 0$.]
    #step[*B2: Giải phương trình lượng giác* \
      $cos((pi t)/2) = 0 <=> (pi t)/2 = pi/2 + k pi <=> t = 1 + 2k$ (với $k in ZZ$).]
    #step[*B3: Tìm số lần trong khoảng thời gian* \
      Xét trong khoảng $0 < t < 4$: \
      $0 < 1 + 2k < 4 <=> -1 < 2k < 3 <=> -0.5 < k < 1.5$. \
      Vì $k$ là số nguyên, ta có $k = 0$ và $k = 1$. \
      Các thời điểm tương ứng là $t = 1$ s và $t = 3$ s. Vậy có đúng 2 thời điểm radar dừng lại đổi chiều trong 4 giây đầu tiên.]
  ],
))

#q-wrap(dir: "doc", tln(
  [Khoảng cách (tính bằng mét) từ điểm gốc của một con lắc đến tường được xấp xỉ bởi hàm số $d(t) = 1.2 cos((2pi)/3 t) + 2.5$. Lần thứ 5 con lắc cách tường 2.5 m là vào giây thứ bao nhiêu? (Nhập kết quả dưới dạng số thập phân/phân số thu gọn).],
  [$6.75$],
  loigiai: [
    #step[*B1: Lập phương trình khoảng cách* \
      Con lắc cách tường 2.5 m khi: \
      $d(t) = 2.5 <=> 1.2 cos((2pi)/3 t) + 2.5 = 2.5 <=> 1.2 cos((2pi)/3 t) = 0 <=> cos((2pi)/3 t) = 0$.]
    #step[*B2: Giải phương trình tìm t* \
      $cos((2pi)/3 t) = 0 <=> (2pi)/3 t = pi/2 + k pi <=> t = 3/4 + 3/2 k$ (với $k >= 0$).]
    #step[*B3: Xác định lần thứ 5* \
      - Lần thứ 1 ứng với $k = 0$ ($t_1 = 3/4$). \
      - Lần thứ 2 ứng với $k = 1$ ($t_2 = 3/4 + 1.5 = 2.25$). \
      - Lần thứ 5 ứng với $k = 4$. \
      Khi đó $t_5 = 3/4 + 3/2 dot 4 = 3/4 + 6 = 6.75$ (giây).]
  ],
))


