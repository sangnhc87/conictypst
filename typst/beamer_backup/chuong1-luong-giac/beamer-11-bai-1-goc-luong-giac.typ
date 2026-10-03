#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI1
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
  title:       "BÀI 1: GÓC LƯỢNG GIÁC",
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


#slide[ = Bối cảnh lịch sử: Khởi nguồn của Góc Lượng Giác ]
#lt-two-col(ratio: (60%, 40%), [
- Tại sao một vòng tròn lại là $360^degree$? 
- Hơn 4000 năm trước, *người Babylon cổ đại* sử dụng hệ đếm cơ số 60 (lục phân). Họ cho rằng một năm có 360 ngày, và chia bầu trời thành 360 phần bằng nhau để lập bản đồ các vì sao.
- *Hipparchus (190 - 120 TCN)*, nhà thiên văn học Hy Lạp được mệnh danh là "cha đẻ của lượng giác", đã sử dụng các đo đạc này để dự đoán nhật thực và vị trí các vì sao.
- *Tại sao lại cần Radian?* Mặc dù $360^degree$ rất tiện để chia nhỏ, nhưng nó là một con số "nhân tạo". Khái niệm *Radian* ra đời vào thế kỷ 18 để tạo ra một đơn vị tự nhiên, liên kết trực tiếp giữa góc và độ dài cung tròn. Nhờ Radian, các công thức giải tích lượng giác trở nên cực kỳ gọn gàng.
], [
  #align(center)[
    #rect(fill: luma(240), stroke: 1pt, inset: 10pt)[Hình ảnh biểu diễn bảng đất sét Plimpton 322 của Babylon]
  ]
])


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #dn(title: [Định nghĩa góc lượng giác])[
    Trong mặt phẳng, chọn một điểm $O$ và hai tia $O x$, $O y$ xuất phát từ $O$. Một *góc lượng giác* $(O x, O y)$ là một góc được tạo thành bằng cách quay tia $O x$ về tia $O y$ theo một chiều xác định.

    - *Chiều dương*: Ngược chiều kim đồng hồ.
    - *Chiều âm*: Cùng chiều kim đồng hồ.
    - *Tia đầu*: $O x$ (tia xuất phát); *Tia cuối*: $O y$ (tia kết thúc).
    - Hai góc có cùng tia đầu và tia cuối nhưng số đo khác nhau một bội số nguyên của $2pi$ (hay $360°$) thì gọi là *đồng vị*.
  ]
]

#block(breakable: false)[
  #luuy(title: [▲ Sự khác biệt với góc hình học])[
    Trong hình học Euclid, góc chỉ có số đo trong $[0°; 180°]$. Trong lượng giác, góc có thể âm, có thể lớn hơn $360°$, và hai góc *có thể khác nhau* dù cùng tia cuối. Đây là điểm mở rộng quan trọng nhất cần ghi nhớ.
  ]
]



#block(breakable: false)[
  #ghinho(title: [★ Hệ độ và Hệ Radian])[
    - *Hệ độ:* Chia vòng tròn thành $360$ phần đều — $1$ phần = $1°$. Đây là hệ quen thuộc nhưng tạo ra hệ số $pi/180$ khi tính toán.

    - *Hệ Radian:* $1$ radian là góc ở tâm chắn cung bằng bán kính. Một vòng tròn đầy đủ = $2pi$ rad.

    - *Mối liên hệ cốt lõi:*
      $ 180° = pi " rad" quad quad arrow.l.r quad quad alpha° = alpha dot frac(pi, 180) " rad" $

    - *Ưu điểm của radian:* Đạo hàm của $sin x$ là $cos x$ — không có hệ số dư thừa (lý do duy nhất radian tốt hơn cho tính toán).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Quy đổi nhanh các góc đặc biệt])[
    #align(center)[
      #table(
        columns: (auto,) * 7,
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else if col == 0 { c-book.lighten(92%) } else { white },
        [*Độ*], [$0°$], [$30°$], [$45°$], [$60°$], [$90°$], [$180°$],
        [*Radian*], [$0$], [$display(pi/6)$], [$display(pi/4)$], [$display(pi/3)$], [$display(pi/2)$], [$pi$],
      )
    ]

    *Mẹo nhớ sin:* $sin 0°, sin 30°, sin 45°, sin 60°, sin 90°$ lần lượt bằng $sqrt(0)/2, sqrt(1)/2, sqrt(2)/2, sqrt(3)/2, sqrt(4)/2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Công thức độ dài cung và diện tích hình quạt])[
    Cho hình quạt tròn bán kính $R$, góc ở tâm $alpha$ (*radian*):

    $ display(l = R alpha) quad quad display(S = frac(1,2) R^2 alpha = frac(1,2) R l) $

    *Lưu ý bắt buộc:* $alpha$ phải là số đo radian. Nếu đề cho số đo độ thì phải chuyển trước.
  ]
]

#vd([Tính độ dài cung $A B$ của đường tròn bán kính $R = 5$ cm, biết góc ở tâm $A O B = 72°$.])[
  *Chuyển đổi:* $72° = 72 dot display(pi/180) = display(2pi/5)$ (rad).

  *Độ dài cung:* $l = R alpha = 5 dot display(2pi/5) = 2pi approx 6{,}28$ (cm).
]



#block(breakable: false)[
  #dn(title: [Đường tròn lượng giác và bốn hàm lượng giác])[
    Đường tròn lượng giác là đường tròn tâm $O$, bán kính $R = 1$ được dùng để định nghĩa tổng quát bốn hàm lượng giác.

    Với góc $alpha$ (tia đầu $O x$, tia cuối $O M$), điểm $M(x_0, y_0)$ trên đường tròn xác định:
    - $cos alpha = x_0$ (hoành độ của $M$)
    - $sin alpha = y_0$ (tung độ của $M$)
    - $tan alpha = display(y_0/x_0) = display(sin alpha / cos alpha)$ (với $cos alpha != 0$)
    - $cot alpha = display(x_0/y_0) = display(cos alpha / sin alpha)$ (với $sin alpha != 0$)

    *Điều này hoạt động với mọi góc thực:* âm, lớn hơn $360°$, hay bất kỳ số thực nào.
  ]
]

#block(breakable: false)[
  #ghinho(title: [★ Các hằng đẳng thức cơ bản — bắt buộc thuộc lòng])[
    - $sin^2 alpha + cos^2 alpha = 1$ (trực tiếp từ định lý Pythagoras trên đường tròn đơn vị)
    - $display(1 + tan^2 alpha = frac(1, cos^2 alpha))$ (với $cos alpha != 0$)
    - $display(1 + cot^2 alpha = frac(1, sin^2 alpha))$ (với $sin alpha != 0$)
    - $tan alpha dot cot alpha = 1$ (khi cả hai đều xác định)
  ]
]

#block(breakable: false)[
  #nhanxet(title: [◈ Dấu theo góc phần tư — Quy tắc "Nhất cả, Nhì sin, Tam tang, Tứ cos"])[
    #align(center)[
      #table(
        columns: (1.2fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        stroke: 0.5pt + luma(180),
        inset: 8pt,
        fill: (col, row) => if row == 0 { c-book.lighten(85%) } else if col == 0 { c-book.lighten(92%) } else { white },
        [*Góc phần tư*], [*sin*], [*cos*], [*tan*], [*cot*],
        [I $(0 < alpha < pi/2)$],   [$+$], [$+$], [$+$], [$+$],
        [II $(pi/2 < alpha < pi)$], [$+$], [$-$], [$-$], [$-$],
        [III $(pi < alpha < 3pi/2)$],[$-$], [$-$], [$+$], [$+$],
        [IV $(3pi/2 < alpha < 2pi)$],[$-$], [$+$], [$-$], [$-$],
      )
    ]
  ]
]

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn (5 câu)], count: 5)

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Đĩa xích
    circle((0,0), radius: 1, stroke: 1pt + blue, name: "dia")
    circle((0,0), radius: 0.1, fill: blue)
    content((0, -1.2), text(size: 8pt)[$R_1$])
    // Líp
    circle((3,0), radius: 0.4, stroke: 1pt + red, name: "lip")
    circle((3,0), radius: 0.1, fill: red)
    // Bánh xe
    circle((3,0), radius: 1.5, stroke: 1pt + black)
    content((3, -1.7), text(size: 8pt)[$R_3$])
    // Dây xích
    line((0,1), (3,0.4), stroke: 0.5pt)
    line((0,-1), (3,-0.4), stroke: 0.5pt)
  }),
  [Một chiếc xe đạp có đĩa xích (bánh răng trước) bán kính $R_1 = 10$ cm và líp (bánh răng sau) bán kính $R_2 = 4$ cm. Bánh xe sau của xe đạp (cùng trục quay với líp) có bán kính $R_3 = 35$ cm. Nếu người đạp xe đạp đĩa xích quay đều với tốc độ 1 vòng/giây, thì tốc độ di chuyển của chiếc xe đạp trên đường phẳng là bao nhiêu km/h? (Lấy $pi approx 3.1416$, làm tròn đến chữ số thập phân thứ hai).],
  ([$18.52$ km/h], True([$19.79$ km/h]), [$21.34$ km/h], [$25.13$ km/h]),
  loigiai: [
    #step[*B1: Phân tích tốc độ quay của đĩa xích* \
      Đĩa xích quay 1 vòng/giây, tức là chu kỳ $T = 1$ s. \
      Tốc độ góc của đĩa xích: $omega_1 = (2pi)/T = 2pi$ rad/s.]
    #step[*B2: Tính vận tốc dài của dây xích* \
      Dây xích nối đĩa xích và líp, do đó vận tốc dài ở vành đĩa xích chính là vận tốc của dây xích: \
      $v_c = R_1 omega_1 = 10 dot 2pi = 20pi$ cm/s.]
    #step[*B3: Suy ra tốc độ góc của líp và bánh xe sau* \
      Vành của líp cũng chạy với tốc độ dài $v_c = 20pi$ cm/s. \
      Tốc độ góc của líp: $omega_2 = v_c / R_2 = (20pi) / 4 = 5pi$ rad/s. \
      Vì líp và bánh xe sau gắn trên cùng một trục, chúng quay cùng tốc độ góc: $omega_3 = omega_2 = 5pi$ rad/s.]
    #step[*B4: Tính vận tốc di chuyển của xe đạp* \
      Vận tốc của xe đạp bằng vận tốc dài của điểm ngoài cùng trên bánh xe tiếp xúc với mặt đường: \
      $v = R_3 omega_3 = 35 dot 5pi = 175pi$ cm/s.]
    #step[*B5: Chuyển đổi đơn vị sang km/h* \
      Ta có $175pi$ cm/s = $1.75pi$ m/s. \
      Đổi ra km/h: $1.75pi dot 3.6 = 6.3pi approx 19.792$ km/h.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, name: "earth", stroke: 1pt)
    line((0, -1.7), (0, 1.7), stroke: (dash: "dashed", paint: gray))
    line((-1.7, 0), (1.7, 0), stroke: (dash: "dashed", paint: gray))
    // A at 45 deg N
    let a_x = 1.5 * calc.cos(45deg)
    let a_y = 1.5 * calc.sin(45deg)
    line((0,0), (a_x, a_y), stroke: 0.5pt)
    circle((a_x, a_y), radius: 0.05, fill: black)
    content((a_x + 0.2, a_y + 0.2), text(size: 8pt)[$A (45° N)$])
    // B at 30 deg S
    let b_x = 1.5 * calc.cos(-30deg)
    let b_y = 1.5 * calc.sin(-30deg)
    line((0,0), (b_x, b_y), stroke: 0.5pt)
    circle((b_x, b_y), radius: 0.05, fill: black)
    content((b_x + 0.2, b_y - 0.2), text(size: 8pt)[$B (30° S)$])
    arc((rel: (angle: -30deg, radius: 0.5), to: (0,0)), start: -30deg, stop: 45deg, radius: 0.5, stroke: 0.5pt + red)
    content((0.7, 0.2), text(size: 8pt, fill: red)[$alpha$])
  }),
  [Hai thành phố A và B nằm trên cùng một kinh tuyến của Trái Đất. Thành phố A có vĩ độ $45°$ Bắc, thành phố B có vĩ độ $30°$ Nam. Giả sử Trái Đất là một khối cầu hoàn hảo với bán kính $R approx 6371$ km. Chiều dài cung kinh tuyến nối từ A đến B (đường chim bay) xấp xỉ bằng:],
  ([$4168$ km], [$6835$ km], True([$8339$ km]), [$10007$ km]),
  loigiai: [
    #step[*B1: Xác định góc ở tâm chắn cung AB* \
      Do hai thành phố nằm trên cùng kinh tuyến nhưng khác bán cầu (A ở Bắc, B ở Nam), góc ở tâm hợp bởi hai bán kính đi qua A và B là tổng độ lớn hai vĩ độ: \
      $alpha = 45° + 30° = 75°$.]
    #step[*B2: Đổi số đo góc sang radian* \
      Trong hệ tọa độ cung tròn, chiều dài cung phải tính bằng radian. \
      $alpha_"rad" = 75° dot pi/180 = (5pi)/12$ rad.]
    #step[*B3: Áp dụng công thức tính chiều dài cung* \
      Chiều dài cung kinh tuyến nối A và B: \
      $l = R alpha = 6371 dot (5pi)/12 approx 6371 dot 1.309 approx 8339.6$ km.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 0.6, name: "earth", fill: blue.lighten(80%), stroke: blue)
    content((0,0), text(size: 7pt)[Trái Đất])
    circle((0,0), radius: 2, stroke: (dash: "dashed", paint: gray))
    circle((0, 2), radius: 0.1, fill: orange)
    content((0, 2.3), text(size: 8pt)[Vệ tinh])
    line((0,0), (0, 0.6), stroke: 0.5pt)
    content((-0.25, 0.3), text(size: 7pt)[$R_0$])
    line((0, 0.6), (0, 2), stroke: 0.5pt + red)
    content((-0.2, 1.3), text(size: 7pt, fill: red)[$h$])
  }),
  [Một vệ tinh địa tĩnh quay quanh Trái Đất ở độ cao $h = 35786$ km so với mặt đất, nằm ngay trên xích đạo. Bán kính Trái Đất là $R_0 = 6371$ km. Vệ tinh này đứng yên so với mặt đất nên chu kỳ quay của nó đúng bằng chu kỳ tự quay của Trái Đất (coi là 24 giờ). Vận tốc dài của vệ tinh trên quỹ đạo xấp xỉ bằng:],
  ([$1.52$ km/s], True([$3.07$ km/s]), [$4.25$ km/s], [$7.91$ km/s]),
  loigiai: [
    #step[*B1: Xác định bán kính quỹ đạo* \
      Quỹ đạo của vệ tinh là một đường tròn có tâm là tâm Trái Đất. Do đó, bán kính quỹ đạo là: \
      $R = R_0 + h = 6371 + 35786 = 42157$ km.]
    #step[*B2: Tính tốc độ góc của vệ tinh* \
      Chu kỳ quay của vệ tinh là $T = 24$ giờ = $24 dot 3600 = 86400$ giây. \
      Tốc độ góc: $omega = (2pi) / T = (2pi) / 86400 approx 7.272 dot 10^{-5}$ rad/s.]
    #step[*B3: Tính vận tốc dài* \
      Vận tốc dài của vệ tinh trên quỹ đạo: \
      $v = R omega = 42157 dot 7.272 dot 10^{-5} approx 3.066$ km/s. \
      Làm tròn ta được xấp xỉ $3.07$ km/s.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: 1pt)
    for i in range(12) {
      let a = 90deg - i * 30deg
      let x = 1.3 * calc.cos(a)
      let y = 1.3 * calc.sin(a)
      content((x, y), text(size: 6pt)[#(if i == 0 { 12 } else { i })])
    }
    // Minute hand at 15m (3 o'clock)
    line((0,0), (1, 0), stroke: 1.5pt + blue)
    // Hour hand at 3:15
    let h_angle = 0deg - 7.5deg
    let hx = 0.7 * calc.cos(h_angle)
    let hy = 0.7 * calc.sin(h_angle)
    line((0,0), (hx, hy), stroke: 2pt + red)
    arc((rel: (angle: -7.5deg, radius: 0.4), to: (0,0)), start: -7.5deg, stop: 0deg, radius: 0.4, stroke: 0.5pt)
  }),
  [Vào đúng thời điểm 3 giờ 15 phút, góc hợp bởi kim giờ và kim phút trên mặt đồng hồ (tính theo radian) là:],
  (True([$pi/24$]), [$pi/12$], [$pi/6$], [$0$]),
  loigiai: [
    #step[*B1: Xác định vị trí kim phút* \
      Vào lúc 3h15p, kim phút chỉ chính xác số 3. Ta quy ước mốc $0°$ ở số 3, góc tăng ngược chiều kim đồng hồ. \
      Vậy tọa độ góc kim phút là $alpha_m = 0°$.]
    #step[*B2: Tính vận tốc góc của kim giờ* \
      Trong 12 giờ (720 phút), kim giờ quay được 1 vòng tròn ($360°$). \
      Vận tốc góc kim giờ: $v_h = 360° / 720 = 0.5°$/phút.]
    #step[*B3: Xác định vị trí kim giờ* \
      Lúc 3h đúng, kim giờ ở ngay số 3 ($0°$). \
      Từ 3h00 đến 3h15, kim giờ đã dịch chuyển 15 phút xuống phía số 4. \
      Góc dịch chuyển: $0.5° times 15 = 7.5°$.]
    #step[*B4: Đổi sang radian* \
      Góc lệch giữa hai kim là $7.5°$. \
      Đổi ra radian: $7.5° dot pi/180 = pi/24$ rad.]
  ],
))

#q-wrap(dir: "doc", tn(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1.5, stroke: (dash: "dashed"))
    line((0,0), (0, 1.5), stroke: 2pt)
    line((0,0), (1.3, -0.75), stroke: 2pt)
    line((0,0), (-1.3, -0.75), stroke: 2pt)
    circle((0,0), radius: 0.1, fill: black)
    arc((rel: (angle: 90deg, radius: 1.7), to: (0,0)), start: 90deg, stop: 450deg, radius: 1.7, stroke: (paint: red, thickness: 0.5pt), mark: (end: ">"))
    content((1, 1.5), text(size: 8pt)[$15$ vòng/phút])
  }),
  [Một turbine gió khổng lồ có chiều dài mỗi cánh là 40 m. Cánh quạt quay với tốc độ ổn định 15 vòng/phút. Quãng đường (tính bằng km) mà đầu mũi của một cánh quạt vạch ra trong không gian sau 2 giờ hoạt động liên tục xấp xỉ bằng:],
  ([$226$ km], True([$452$ km]), [$904$ km], [$113$ km]),
  loigiai: [
    #step[*B1: Tính tốc độ góc của cánh quạt* \
      1 vòng tương ứng góc $2pi$ rad. \
      Tốc độ góc: $omega = 15 dot 2pi = 30pi$ rad/phút.]
    #step[*B2: Tổng góc quét trong 2 giờ* \
      2 giờ = $120$ phút. \
      Tổng góc quay được: $alpha = omega t = 30pi dot 120 = 3600pi$ rad.]
    #step[*B3: Tính quãng đường đầu cánh quạt* \
      Áp dụng công thức độ dài cung $l = R alpha$: \
      $l = 40 dot 3600pi = 144000pi$ m.]
    #step[*B4: Đổi ra km* \
      $l approx 144000 dot 3.14159 approx 452389$ m $approx 452.4$ km.]
  ],
))

#resetcau()
#exam-part([PHẦN II. Câu hỏi trắc nghiệm đúng sai (2 câu)], count: 2)

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 2), radius: 2, stroke: 1pt)
    line((0, 2), (0, 0), stroke: (dash: "dashed"))
    circle((0, 0), radius: 0.1, fill: red)
    content((0, -0.3), text(size: 8pt)[$A (t=0)$])
    line((-0.5, -0.2), (0.5, -0.2), stroke: 1pt)
    content((0, -0.6), text(size: 6pt)[Mặt đất])
    arc((rel: (angle: -90deg, radius: 2), to: (0, 2)), start: -90deg, stop: 0deg, radius: 2, stroke: (paint: blue, thickness: 1.5pt), mark: (end: ">"))
    circle((2, 2), radius: 0.1, fill: blue)
    content((2.4, 2), text(size: 8pt)[$A (t=30)$])
    content((-0.4, 1), text(size: 8pt)[$20$ m])
  }),
  [Một vòng đu quay (Ferris wheel) có bán kính 20 m, quay đều 1 vòng hết 2 phút. Tại thời điểm $t = 0$, khoang khách A ở vị trí thấp nhất (cách mặt đất 2 m). Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tốc độ góc của vòng quay là $pi$ rad/s.],
    True([Vận tốc dài của khoang A là $approx 1.05$ m/s.]),
    True([Sau 30 giây, khoang A lên đến độ cao 22 m so với mặt đất.]),
    True([Sau 45 giây, khoang A quét được một góc $135°$ ở tâm quay.]),
  ),
  loigiai: [
    - *a) Sai:* Chu kỳ quay $T = 2$ phút = 120 s. \ Tốc độ góc $omega = (2pi)/T = (2pi)/120 = pi/60$ rad/s.
    - *b) Đúng:* Vận tốc dài của khoang $A$: \ $v = R omega = 20 dot pi/60 = pi/3 approx 1.047$ m/s.
    - *c) Đúng:* 30 giây = $T/4$. Khoang quay được $90°$, từ vị trí thấp nhất lên vị trí ngang bằng tâm quay. \ Tâm quay cách mặt đất: $2 + 20 = 22$ m. Vậy độ cao là 22 m.
    - *d) Đúng:* Góc quét được sau 45s là $alpha = omega t = pi/60 dot 45 = (3pi)/4$ rad. \ $(3pi)/4$ tương ứng với $135°$.
  ],
))

#q-wrap(dir: "doc", lines: 3, ds(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0, 0), radius: 1, stroke: 1.5pt)
    circle((0, 0), radius: 0.1, fill: black)
    line((1, 0), (1, -2), stroke: 1.5pt + red)
    arc((rel: (angle: 90deg, radius: 1.2), to: (0,0)), start: 90deg, stop: 0deg, radius: 1.2, stroke: 0.5pt, mark: (end: ">"))
    content((1.3, -1), text(size: 8pt)[Cáp])
  }),
  [Một sợi cáp được tời (cuốn) qua một trục ròng rọc có đường kính 0.5 m. Ròng rọc quay với gia tốc góc không đổi từ trạng thái nghỉ, sau 10 giây đạt tốc độ 60 vòng/phút. Xét các mệnh đề:],
  (
    [Bán kính ròng rọc là 0.5 m.],
    True([Tốc độ góc đạt được ở giây thứ 10 là $2pi$ rad/s.]),
    True([Độ dài đoạn cáp được cuốn lên sau 10 giây đầu tiên là $2.5pi$ m.]),
    True([Vận tốc dài của sợi cáp ở giây thứ 10 là $pi/2$ m/s.]),
  ),
  loigiai: [
    - *a) Sai:* Đường kính 0.5 m nên bán kính $R = 0.25$ m.
    - *b) Đúng:* $n = 60$ vòng/phút = 1 vòng/giây $=> omega = 2pi$ rad/s.
    - *c) Đúng:* Gia tốc góc $gamma = (Delta omega) / (Delta t) = (2pi)/10 = pi/5$ rad/s². \ Góc quay được trong 10s: $theta = 1/2 gamma t^2 = 1/2 dot pi/5 dot 100 = 10pi$ rad. \ Chiều dài cáp $l = R theta = 0.25 dot 10pi = 2.5pi$ m.
    - *d) Đúng:* $v = R omega = 0.25 dot 2pi = 0.5pi = pi/2$ m/s.
  ],
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn (2 câu)], count: 2)

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 1, stroke: 1.5pt)
    circle((0,0), radius: 0.1, fill: black)
    line((-1.5, -1), (1.5, -1), stroke: 2pt) // road
    line((0,0), (1, 0), stroke: 0.5pt)
    content((0.5, 0.2), text(size: 8pt)[$R$])
    arc((rel: (angle: 90deg, radius: 1.2), to: (0,0)), start: 90deg, stop: 0deg, radius: 1.2, stroke: 0.5pt, mark: (end: ">"))
    content((1.4, 0.8), text(size: 8pt)[$omega$])
  }),
  [Vành của một bánh xe ô tô tải có đường kính 1 m. Trong quá trình xe chạy trên cao tốc với vận tốc 72 km/h, hãy tính số vòng bánh xe quay được trong vòng 1 giây. (Nhập kết quả được làm tròn tới số thập phân thứ hai).],
  [$6.37$],
  loigiai: [
    #step[*B1: Chuyển đổi vận tốc xe* \
      Vận tốc xe $v = 72$ km/h = $(72 times 1000) / 3600 = 20$ m/s. \
      Trong 1 giây, bánh xe di chuyển được quãng đường 20 m.]
    #step[*B2: Tính chu vi bánh xe* \
      Bán kính bánh xe $R = 0.5$ m. \
      Chu vi bánh xe $C = 2pi R = pi$ m. Đây là quãng đường xe đi được khi bánh xe lăn đúng 1 vòng.]
    #step[*B3: Số vòng quay trong 1 giây* \
      Số vòng $N = v / C = 20 / pi approx 6.366$. \
      Làm tròn đến 2 chữ số thập phân: $6.37$ vòng.]
  ],
))

#q-wrap(dir: "doc", tln(
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    circle((0,0), radius: 0.75, stroke: 1pt + blue)
    circle((3,0), radius: 1.25, stroke: 1pt + red)
    line((0, 0.75), (3, 1.25), stroke: 1pt)
    line((0, -0.75), (3, -1.25), stroke: 1pt)
    content((0, -0.2), text(size: 7pt)[$R_1$])
    content((3, -0.2), text(size: 7pt)[$R_2$])
  }),
  [Trên một dải ruy băng truyền chuyển động giữa hai bu-li (pulley) có bán kính lần lượt là $R_1 = 15$ cm và $R_2 = 25$ cm. Khi bu-li nhỏ quay được 50 vòng thì bu-li lớn quay được bao nhiêu vòng?],
  [$30$],
  loigiai: [
    #step[*B1: Mối quan hệ truyền động* \
      Dải ruy băng truyền động sẽ làm cho quãng đường vành ngoài của hai bu-li dịch chuyển là như nhau. Tức là $l_1 = l_2$.]
    #step[*B2: Liên hệ số vòng quay* \
      Quãng đường đi được bằng số vòng nhân với chu vi: \
      $N_1 dot (2pi R_1) = N_2 dot (2pi R_2) => N_1 R_1 = N_2 R_2$.]
    #step[*B3: Tính số vòng bu-li lớn* \
      $N_2 = N_1 dot (R_1/R_2) = 50 dot (15/25) = 50 dot 0.6 = 30$ vòng.]
  ],
))


