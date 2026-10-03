#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN1-C3
// Toán 12 — Ứng Dụng Đạo Hàm  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../../giao-an/modules/lecture-beamer.typ": *
#import "../../bbt.typ": *
#import "../../modules/fractals.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#let c-p1 = rgb("#3b82f6") // blue
#let c-p2 = rgb("#8b5cf6") // violet
#let c-p3 = rgb("#ec4899") // pink
#let c-p4 = rgb("#f97316") // orange
#let c-p5 = rgb("#10b981") // emerald

#show: lecture-theme.with(
  title:       "P1.C3: KINH TẾ VI MÔ & GIÁO DỤC TÀI CHÍNH GEN Z",
  subtitle:    "TOÁN 12 — Chuyên đề: Ứng Dụng Đạo Hàm & Thực Tế",
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
#let chapter = exam-part
#let topic = exam-part
#let ppgiai = phuongphap
#let bt-header(color) = none
#let bt(..args) = none
#let resetstep() = none


#slide[ = Kinh tế học: Tối đa hóa lợi nhuận! ]
- Tại sao một quán cà phê không bán với giá $100,000$ VNĐ để lãi nhiều nhất? Vì khi giá quá cao, lượng người mua sẽ giảm mạnh.
- Đạo hàm giúp ta tìm ra điểm cân bằng vàng: Mức giá nào mang lại lợi nhuận $P(x)$ đạt cực đại!
- Học phần này không chỉ là Toán học, nó là những kỹ năng tài chính cơ bản để trở thành một nhà kinh doanh đại tài!



#chapter([Kinh Tế Vi Mô & Giáo Dục Tài Chính Gen Z], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Các hàm kinh tế cơ bản:*
  - *Chi phí:* $C(x)$ — tổng chi phí sản xuất $x$ đơn vị.
  - *Doanh thu:* $R(x) = p(x) dot.c x$ — $p(x)$ là hàm giá (thường nghịch biến).
  - *Lợi nhuận:* $P(x) = R(x) - C(x)$.
  - *Chi phí biên:* $C'(x)$ — chi phí tăng thêm để sản xuất thêm 1 đơn vị.
  - *Doanh thu biên:* $R'(x)$ — doanh thu tăng thêm khi bán thêm 1 đơn vị.
  - *Lợi nhuận tối đa* khi $P'(x) = 0$, tức $R'(x) = C'(x)$.
]

#vd(
  [Một cửa hàng bán áo thun. Khi giá bán là $p$ (nghìn đồng/chiếc), lượng
    cầu (theo khảo sát) là $x = 100 - 2p$ (chiếc/ngày). Chi phí sản xuất:
    $C(x) = 500 + 20x$ (nghìn đồng). Tìm giá bán tối ưu để *lợi nhuận lớn nhất*.],
  loigiai: [
    #ppgiai[
      - Dùng hàm cầu để biểu diễn giá bán theo sản lượng.
      - Lập hàm doanh thu rồi suy ra hàm lợi nhuận.
      - Khảo sát hàm lợi nhuận bằng đạo hàm và BBT để tìm mức giá tối ưu.
    ]

    #step[Từ hàm cầu $x = 100 - 2p$, suy ra giá bán theo sản lượng là:
      $ p = (100 - x)/2 = 50 - x/2. $
      Điều kiện kinh tế: $0 < x < 100$.]

    #step[Doanh thu là:
      $ R(x) = p dot.c x = (50 - x/2)x = 50x - x^2/2. $
      Chi phí là $C(x) = 500 + 20x$, nên lợi nhuận là:
      $ P(x) = R(x) - C(x) = 30x - x^2/2 - 500. $]

    #step[Đạo hàm:
      $ P'(x) = 30 - x. $
      Cho $P'(x) = 0 <=> x = 30$.]

    #step[Bảng biến thiên của $P(x)$ trên $(0; 100)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $P'$,
          func: $P$,
          x-vals: ($0$, $30$, $100$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-500$, $-50$, $-2500$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, lợi nhuận lớn nhất đạt được khi $x = 30$ (chiếc/ngày). Khi đó:
      $ p = 50 - 30/2 = 35 $ (nghìn đồng/chiếc).]

    #step[Lợi nhuận lớn nhất là:
      $ P(30) = 30 dot.c 30 - 30^2/2 - 500 = -50 $ (nghìn đồng).
      Vậy mức giá tối ưu là $35$ nghìn đồng/chiếc, nhưng doanh nghiệp vẫn lỗ $50$ nghìn đồng mỗi ngày trong mô hình này.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#vd(
  [Một quầy đồ uống định giá mỗi ly là $p$ (nghìn đồng). Theo khảo sát, nếu giá bán là $p$ thì lượng khách mua trung bình mỗi ngày là $x = 240 - 2p$ (ly). Chi phí sản xuất và bán ra là $C(x) = 20x + 600$ (nghìn đồng/ngày). Tìm giá bán để lợi nhuận lớn nhất.],
  loigiai: [
    #ppgiai[
      - Từ hàm cầu suy ra hàm giá theo sản lượng.
      - Lập hàm doanh thu và lợi nhuận.
      - Dùng đạo hàm và BBT để tìm giá bán tối ưu.
    ]

    #step[Từ $x = 240 - 2p$, suy ra:
      $ p = 120 - x/2. $
      Điều kiện kinh tế là $0 < x < 240$.]

    #step[Doanh thu là:
      $ R(x) = p dot.c x = (120 - x/2)x = 120x - x^2/2. $
      Vậy lợi nhuận là:
      $ P(x) = R(x) - C(x) = 100x - x^2/2 - 600. $]

    #step[Đạo hàm:
      $ P'(x) = 100 - x. $
      Cho $P'(x) = 0 <=> x = 100$.]

    #step[Bảng biến thiên của $P(x)$ trên $(0; 240)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $P'$,
          func: $P$,
          x-vals: ($0$, $100$, $240$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-600$, $4400$, $-5400$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, lợi nhuận lớn nhất đạt được khi bán $100$ ly mỗi ngày. Khi đó:
      $ p = 120 - 100/2 = 70 $ (nghìn đồng/ly).]

    #step[Vậy giá bán tối ưu là $70$ nghìn đồng/ly. Lợi nhuận cực đại tương ứng là $4400$ nghìn đồng/ngày.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#nhanxet(theme-color: c-p1)[
  *Ý nghĩa thực tế của chi phí biên:* Một startup sản xuất app. Nếu
  chi phí cận biên $C'(x) = 5000$ đồng/người dùng mà doanh thu biên
  $R'(x) = 3000$ đồng/người dùng — bạn đang *mất tiền với mỗi người
  dùng thêm*. Đây là dấu hiệu mô hình kinh doanh chưa đạt điểm đòn bẩy.
  Bài toán tối ưu hóa không chỉ là Toán — đó là *tư duy chiến lược*.
]

#bt(
  [Một công ty sản xuất $x$ sản phẩm/ngày với chi phí
    $C(x) = x^3 - 6x^2 + 15x + 50$ (triệu đồng) và giá bán
    $p(x) = 23 - x^2$ (triệu đồng/sản phẩm). Tìm sản lượng tối ưu và
    lợi nhuận tối đa.],
  loigiai: [
    #ppgiai[
      - Từ giá bán theo sản lượng lập hàm doanh thu.
      - Lập hàm lợi nhuận rồi tìm điểm tới hạn.
      - Dùng BBT để kết luận sản lượng tối ưu và lợi nhuận lớn nhất.
    ]

    #step[Vì giá bán là $p(x) = 23 - x^2$, nên để mô hình có ý nghĩa cần $23 - x^2 > 0 <=> 0 < x < sqrt(23)$.]

    #step[Doanh thu là:
      $ R(x) = x dot.c p(x) = x(23 - x^2) = 23x - x^3. $
      Do đó lợi nhuận là:
      $
        P(x) & = R(x) - C(x) \
             & = 23x - x^3 - (x^3 - 6x^2 + 15x + 50) \
             & = -2x^3 + 6x^2 + 8x - 50.
      $]

    #step[Đạo hàm:
      $ P'(x) = -6x^2 + 12x + 8 = -2(3x^2 - 6x - 4). $
      Giải $P'(x) = 0$ được:
      $ x = 1 +- sqrt(21)/3. $
      Trong miền $0 < x < sqrt(23)$ chỉ nhận nghiệm:
      $ x_0 = 1 + sqrt(21)/3 approx 2.53. $]

    #step[Bảng biến thiên của $P(x)$ trên $(0; sqrt(23))$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $P'$,
          func: $P$,
          x-vals: ($0$, $1 + sqrt(21)/3$, $sqrt(23)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-50$, $-23.75$, $-94.24$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, sản lượng tối ưu là:
      $ x = 1 + sqrt(21)/3 approx 2.53 $ (sản phẩm/ngày).]

    #step[Lợi nhuận lớn nhất khi đó xấp xỉ $-23.75$ triệu đồng. Như vậy trong mô hình này, ngay cả ở mức tối ưu doanh nghiệp vẫn bị lỗ.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Chi phí trung bình để sản xuất $x$ sản phẩm của một xưởng là
    $A(x) = x + 400/x + 50$ (nghìn đồng/sản phẩm), với $x > 0$. Hãy tìm sản lượng để chi phí trung bình nhỏ nhất và xác định giá trị nhỏ nhất đó.],
  loigiai: [
    #ppgiai[
      - Xét trực tiếp hàm chi phí trung bình trên miền $x > 0$.
      - Tính đạo hàm, tìm điểm tới hạn.
      - Dùng BBT để kết luận GTNN.
    ]

    #step[Ta cần tìm giá trị nhỏ nhất của hàm số:
      $ A(x) = x + 400/x + 50, quad x > 0. $]

    #step[Đạo hàm:
      $ A'(x) = 1 - 400/x^2. $
      Cho $A'(x) = 0 <=> x^2 = 400 <=> x = 20$ (do $x > 0$).]

    #step[Bảng biến thiên của $A(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $A'$,
          func: $A$,
          x-vals: ($0$, $20$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $90$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, chi phí trung bình nhỏ nhất đạt được khi $x = 20$ sản phẩm. Giá trị nhỏ nhất là:
      $ A(20) = 20 + 20 + 50 = 90 $ (nghìn đồng/sản phẩm).]
    #resetstep()
  ],
  theme-color: c-p1,
)

// ═══════════════════════════════════════════════════════════════════
// PHẦN 2: VƯỢT CHƯỚNG NGẠI VẬT – KHÔNG GIAN 3D & HÀM PHÂN THỨC
// ═══════════════════════════════════════════════════════════════════


// ════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()



#tn(
  [Hàm lợi nhuận $P(x) = -x^2 + 60x - 500$ (triệu đồng, $x$ = số sản phẩm). Sản lượng tối ưu là],
  ([$x = 20$], [$x = 30$], [$x = 40$], [$x = 50$]),
  correct: (2,),
  accent: c-p1,
  loigiai: [
    #step[Đạo hàm $P'(x) = -2x + 60$.]
    #step[Cho $P'(x) = 0 <=> x = 30$, nên sản lượng tối ưu là $30$.]
  ],
)

#tn(
  [Doanh thu biên $R'(x)$ và chi phí biên $C'(x)$. Lợi nhuận cực đại khi],
  ([$R'(x) < C'(x)$], [$R'(x) = 0$], [$R'(x) = C'(x)$], [$C'(x) = 0$]),
  correct: (3,),
  accent: c-p1,
  loigiai: [
    #step[Nếu $P(x) = R(x) - C(x)$ thì $P'(x) = R'(x) - C'(x)$.]
    #step[Lợi nhuận cực đại tại điểm tới hạn thỏa $P'(x) = 0 <=> R'(x) = C'(x)$.]
  ],
)

#tn(
  [Giá bán $p = 100 - 0{,}5x$ (nghìn đồng/cái), chi phí $C(x) = 20x + 500$. Doanh thu biên $R'(x)$ tại $x = 60$ bằng],
  ([$40$], [$60$], [$70$], [$100$]),
  correct: (1,),
  accent: c-p1,
  loigiai: [
    #step[Doanh thu là $R(x) = x(100 - 0.5x) = 100x - 0.5x^2$.]
    #step[Suy ra $R'(x) = 100 - x$, nên $R'(60) = 40$.]
  ],
)

#tn(
  [Với hàm chi phí trung bình $A(x) = x + 400/x + 50$, chi phí trung bình nhỏ nhất đạt được khi],
  ([$x = 10$], True([$x = 20$]), [$x = 30$], [$x = 40$]),
  accent: c-p1,
  loigiai: [
    #step[Đạo hàm $A'(x) = 1 - 400/x^2$.]
    #step[Giải $A'(x) = 0 <=> x = 20$ (do $x > 0$).]
  ],
)


#resetexamstate()

#ds(
  [Hàm lợi nhuận $P(x) = R(x) - C(x)$ với $R(x) = 100x - x^2$ và $C(x) = 20x + 400$.],
  (
    [$P'(x) = 80 - 2x$.],
    [Lợi nhuận cực đại tại $x = 40$.],
    [Giá trị cực đại của $P$ là $1200$.],
    [Doanh nghiệp lỗ khi $x > 80$.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Từ $P(x) = 100x - x^2 - 20x - 400 = 80x - x^2 - 400$, suy ra $P'(x) = 80 - 2x$. Phát biểu $1$ đúng.]
    #step[Cho $P'(x) = 0 <=> x = 40$, nên phát biểu $2$ đúng.]
    #step[Tính $P(40) = 80 dot.c 40 - 40^2 - 400 = 1200$, nên phát biểu $3$ đúng.]
    #step[Nếu $x > 80$ thì $P(x) = 80x - x^2 - 400 < 0$, do đó doanh nghiệp lỗ. Phát biểu $4$ đúng.]
  ],
)

#ds(
  [Với hàm chi phí trung bình $A(x) = x + 400/x + 50$, $x > 0$.],
  (
    True([$A'(x) = 1 - 400/x^2$.]),
    True([Chi phí trung bình nhỏ nhất tại $x = 20$.]),
    True([Giá trị nhỏ nhất của chi phí trung bình là $90$.]),
    [Khi $x = 10$ thì chi phí trung bình bằng $80$.],
  ),
  accent: c-p1,
  loigiai: [
    #step[Lấy đạo hàm được $A'(x) = 1 - 400/x^2$, nên phát biểu $1$ đúng.]
    #step[Giải $A'(x) = 0 <=> x = 20$, vì thế phát biểu $2$ đúng.]
    #step[Tính $A(20) = 20 + 20 + 50 = 90$, nên phát biểu $3$ đúng.]
    #step[Tính $A(10) = 10 + 40 + 50 = 100$, không phải $80$, nên phát biểu $4$ sai.]
  ],
)


#resetexamstate()

#tln(
  [Sản phẩm bán với giá $p(x) = 200 - 2x$ (nghìn đồng), chi phí $C(x) = 50x + 300$. Sản lượng $x$ để lợi nhuận cực đại là.],
  [37{,}5],
  accent: c-p1,
  loigiai: [
    #step[Lợi nhuận là $P(x) = x(200 - 2x) - (50x + 300) = -2x^2 + 150x - 300$.]
    #step[Đạo hàm $P'(x) = -4x + 150$. Cho $P'(x) = 0 <=> x = 37.5$.]
  ],
)

#tln([Với dữ liệu trên, lợi nhuận cực đại đạt được là (nghìn đồng).], [2512{,}5], accent: c-p1, loigiai: [
  #step[Thay $x = 37.5$ vào $P(x) = -2x^2 + 150x - 300$.]
  #step[Tính được:
    $ P(37.5) = -2 dot.c (37.5)^2 + 150 dot.c 37.5 - 300 = 2512.5 $.]
])

#tln(
  [Với hàm chi phí trung bình $A(x) = x + 400/x + 50$, giá trị nhỏ nhất của $A(x)$ là.],
  [90],
  accent: c-p1,
  loigiai: [
    #step[Từ $A'(x) = 1 - 400/x^2 = 0$ suy ra $x = 20$.]
    #step[Khi đó $A(20) = 20 + 20 + 50 = 90$.]
  ],
)


