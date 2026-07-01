#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN2-C2
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
  title:       "P2.C2: TỐI ƯU HÓA KHỐI TRÒN XOAY - TRỤ, NÓN, CẦU",
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


#slide[ = Bí mật của lon bò húc ]
- Đã bao giờ bạn tự hỏi tại sao mọi lon nước ngọt (Coca, Pepsi, Redbull) đều có hình trụ tròn xoay với tỉ lệ chiều cao và bán kính gần như nhau?
- Đó không phải là ngẫu nhiên! Tỉ lệ đó chính là nghiệm của bài toán cực trị: $h = 2R$ (đối với lon kín). 
- Chỉ một phép tính đạo hàm đơn giản, ngành công nghiệp nước giải khát đã tiết kiệm hàng nghìn tấn nhôm mỗi năm.



#chapter([Tối Ưu Hóa Khối Tròn Xoay — Trụ, Nón, Cầu], theme-color: c-p2)

#phuongphap(theme-color: c-p2)[
  *Công thức cần nhớ:*
  - *Hình trụ:* $V = pi r^2 h$, $S_("toàn phần") = 2pi r^2 + 2pi r h$.
  - *Hình nón:* $V = 1/3 pi r^2 h$, $S_("xq") = pi r l$ với $l = sqrt(r^2 + h^2)$.
  - *Hình cầu:* $V = 4/3 pi R^3$, $S = 4pi R^2$.
  - *Khối nội tiếp cầu:* Luôn thiết lập hệ thức Pytago từ hình cắt qua trục đối xứng.
]

#vd(
  [_(Bài toán "lon sữa bò")_ Một hộp trụ tròn kín được làm từ cùng một loại vật liệu, có thể tích $V = 250 pi$ cm³. Tìm bán kính $r$ và chiều cao $h$ để diện tích toàn phần nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Dùng điều kiện thể tích để rút $h$ theo $r$.
      - Lập hàm diện tích toàn phần theo một biến $r$.
      - Tính đạo hàm và dùng BBT để tìm GTNN.
    ]

    #step[Từ $pi r^2 h = 250 pi$, suy ra:
      $ h = 250 / r^2, quad r > 0. $]

    #step[Diện tích toàn phần của hình trụ là:
      $ S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 500pi / r. $]

    #step[Đạo hàm:
      $ S'(r) = 4pi r - 500pi / r^2. $
      Cho $S'(r) = 0 <=> 4r^3 = 500 <=> r^3 = 125 <=> r = 5.$]

    #step[Bảng biến thiên của $S(r)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $r$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $150 pi$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy diện tích toàn phần nhỏ nhất khi $r = 5$ cm. Khi đó:
      $ h = 250 / 25 = 10 $ cm.
      Ta thu được tỉ lệ tối ưu $h = 2r$.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#vd(
  [Một hình trụ nội tiếp một khối cầu bán kính $R$. Tìm chiều cao của hình trụ để thể tích của hình trụ lớn nhất.],
  loigiai: [
    #ppgiai[
      - Chọn chiều cao $h$ làm biến.
      - Dùng hệ thức $r^2 + (h/2)^2 = R^2$ để biểu diễn bán kính theo $h$.
      - Lập hàm thể tích và khảo sát bằng đạo hàm, BBT.
    ]

    #step[Gọi $r$ là bán kính đáy và $h$ là chiều cao của hình trụ. Từ mặt cắt qua trục đối xứng của khối cầu, ta có:
      $ r^2 + (h/2)^2 = R^2 <=> r^2 = R^2 - h^2/4. $]

    #step[Thể tích hình trụ là:
      $
        V(h) & = pi r^2 h = pi(R^2 - h^2/4)h \
             & = pi(R^2 h - h^3/4), quad 0 < h < 2R.
      $]

    #step[Đạo hàm:
      $ V'(h) = pi(R^2 - 3h^2/4). $
      Cho $V'(h) = 0 <=> h^2 = 4R^2/3 <=> h = 2R / sqrt(3) = 2R sqrt(3) / 3.$]

    #step[Bảng biến thiên của $V(h)$ trên $(0; 2R)$ là:
      #align(center)[
        #bbt-opt(
          var: $h$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $2R / sqrt(3)$, $2R$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $4 pi R^3 / (3 sqrt(3))$, $0$),
          is-min: false,
        )
      ]]

    #step[Vậy thể tích lớn nhất khi chiều cao hình trụ bằng:
      $ h = 2R / sqrt(3) = 2R sqrt(3) / 3. $]
    #resetstep()
  ],
  theme-color: c-p2,
)

#luuy(theme-color: c-p2)[
  *Mẹo hình học cốt lõi:* Với các khối tròn xoay nội tiếp cầu, mọi thứ thường quy về một tam giác vuông trong mặt phẳng đối xứng. Sau khi có ràng buộc Pytago, bài toán lại trở về dạng một biến quen thuộc.
]

#bt(
  [Một bình nước gồm một phần hình trụ ở dưới, một nửa hình cầu ở trên và đáy phẳng ở dưới. Tổng thể tích của bình là $45 pi$ m³. Tìm bán kính $r$ của bình để diện tích bề mặt ngoài (không tính mặt ghép giữa trụ và nửa cầu) nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Gọi $r$ là bán kính chung, $h$ là chiều cao phần trụ.
      - Dùng ràng buộc thể tích để biểu diễn $h$ theo $r$.
      - Lập hàm diện tích bề mặt theo $r$, rồi dùng đạo hàm và BBT.
    ]

    #step[Thể tích của bình bằng tổng thể tích hình trụ và nửa hình cầu:
      $ pi r^2 h + 2/3 pi r^3 = 45 pi. $
      Suy ra:
      $ h = 45 / r^2 - 2r / 3, quad r > 0. $]

    #step[Diện tích bề mặt ngoài gồm diện tích xung quanh hình trụ, diện tích nửa mặt cầu và diện tích đáy trụ:
      $ S(r) = 2pi r h + 2pi r^2 + pi r^2 = 2pi r h + 3pi r^2. $]

    #step[Thay $h = 45/r^2 - 2r/3$ vào, ta được:
      $
        S(r) & = 2pi r (45 / r^2 - 2r / 3) + 3pi r^2 \
             & = 90pi / r + 5pi r^2 / 3.
      $]

    #step[Đạo hàm:
      $ S'(r) = -90pi / r^2 + 10pi r / 3. $
      Cho $S'(r) = 0 <=> 10r^3 / 3 = 90 <=> r^3 = 27 <=> r = 3.$]

    #step[Bảng biến thiên của $S(r)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $r$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $3$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $45 pi$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy diện tích bề mặt ngoài nhỏ nhất khi bán kính $r = 3$ m. Khi đó chiều cao phần trụ là:
      $ h = 45 / 9 - 2 = 3 $ m.]
    #resetstep()
  ],
  theme-color: c-p2,
)

#bt(
  [Một hình trụ kín có thể tích $54 pi$ cm³. Tìm bán kính đáy để diện tích toàn phần của hình trụ nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Từ thể tích cố định rút $h$ theo $r$.
      - Viết diện tích toàn phần theo một biến.
      - Tính đạo hàm và dùng BBT để tìm GTNN.
    ]

    #step[Từ $pi r^2 h = 54 pi$, suy ra:
      $ h = 54 / r^2. $]
    #step[Diện tích toàn phần là:
      $ S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 108pi / r. $]
    #step[Đạo hàm:
      $ S'(r) = 4pi r - 108pi / r^2 = 0 <=> 4r^3 = 108 <=> r^3 = 27 <=> r = 3. $]
    #step[Vậy bán kính tối ưu là $r = 3$ cm.]
    #resetstep()
  ],
  theme-color: c-p2,
)

// ════════════════════════════════════════════════════════════
#bt-header(c-p2)
#resetexamstate()



#tn(
  [Hình trụ nội tiếp khối cầu bán kính $R = 3$. Thể tích trụ lớn nhất bằng],
  ([$4 pi sqrt(3)$], [$6 pi sqrt(3)$], [$8 pi sqrt(3)$], True([$12 pi sqrt(3)$])),
  accent: c-p2,
  loigiai: [
    #step[Theo công thức tổng quát, trụ nội tiếp cầu có thể tích lớn nhất khi $h = 2R / sqrt(3) = 2 sqrt(3)$.]
    #step[Khi đó $r^2 = R^2 - h^2/4 = 9 - 3 = 6$, nên:
      $ V_(max) = pi r^2 h = 6pi dot.c 2 sqrt(3) = 12 pi sqrt(3). $]
  ],
)

#tn(
  [Nón nội tiếp cầu bán kính $R$. Thể tích nón lớn nhất khi chiều cao $h =$],
  (True([$4R / 3$]), [$2R / 3$], [$R$], [$3R / 2$]),
  accent: c-p2,
  loigiai: [
    #step[Thể tích nón nội tiếp cầu được viết theo $h$ dưới dạng:
      $ V(h) = 1/3 pi h^2 (2R - h). $]
    #step[Đạo hàm $V'(h) = 1/3 pi h (4R - 3h) = 0$, nên nghiệm dương là $h = 4R / 3$.]
  ],
)

#tn(
  [Hình trụ có $2pi r + h = k$ với $k$ không đổi. Thể tích của hình trụ lớn nhất khi bán kính $r =$],
  (True([$k / (3 pi)$]), [$k / (4 pi + 2)$], [$k / (2(pi + 1))$], [$2k / (3(2 pi + 1))$]),
  accent: c-p2,
  loigiai: [
    #step[Từ $2pi r + h = k$, suy ra $h = k - 2pi r$.]
    #step[Thể tích là $V(r) = pi r^2 (k - 2pi r)$. Khi đó:
      $ V'(r) = pi r (2k - 6pi r). $
      Suy ra $r = k / (3pi)$.]
  ],
)

#tn(
  [Một hình trụ kín có thể tích $54 pi$ cm³. Diện tích toàn phần nhỏ nhất khi bán kính đáy bằng],
  ([$2$ cm], True([$3$ cm]), [$4$ cm], [$6$ cm]),
  accent: c-p2,
  loigiai: [
    #step[Với $V = 54 pi$, ta có $h = 54 / r^2$ và $S(r) = 2pi r^2 + 108pi / r$.]
    #step[Giải $S'(r) = 0$ được $4r^3 = 108 <=> r = 3$.]
  ],
)


#resetexamstate()

#ds(
  [Hình trụ nội tiếp khối cầu bán kính $R$, gọi bán kính đáy trụ là $r$ và chiều cao là $h$.],
  (
    True([Ta có hệ thức $r^2 + (h/2)^2 = R^2$.]),
    True([Thể tích trụ $V = pi r^2 h$ được biểu diễn theo một biến duy nhất.]),
    True([Trụ có thể tích lớn nhất khi $h = 2R sqrt(3) / 3$.]),
    True([Thể tích cực đại bằng $4 pi R^3 sqrt(3) / 9$.]),
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ tam giác vuông trong mặt cắt qua trục của khối cầu, ta được $r^2 + (h/2)^2 = R^2$, nên phát biểu $1$ đúng.]
    #step[Từ đó suy ra $r^2 = R^2 - h^2/4$, nên thể tích trở thành hàm một biến $h$:
      $ V(h) = pi(R^2 - h^2/4)h. $
      Vì vậy phát biểu $2$ đúng.]
    #step[Giải $V'(h) = 0$ được $h = 2R / sqrt(3) = 2R sqrt(3) / 3$, nên phát biểu $3$ đúng.]
    #step[Thay vào công thức thể tích, ta được:
      $ V_(max) = 4 pi R^3 / (3 sqrt(3)) = 4 pi R^3 sqrt(3) / 9. $
      Do đó phát biểu $4$ đúng.]
  ],
)

#ds(
  [Một hình trụ kín có thể tích $54 pi$ cm³, bán kính đáy $r$, chiều cao $h$.],
  (
    True([Ta có $h = 54 / r^2$.]),
    True([Diện tích toàn phần là $S(r) = 2pi r^2 + 108pi / r$.]),
    [Diện tích toàn phần nhỏ nhất khi $r = 2$.],
    True([Tại vị trí tối ưu thì $h = 2r$.]),
  ),
  accent: c-p2,
  loigiai: [
    #step[Từ thể tích $pi r^2 h = 54 pi$, suy ra $h = 54/r^2$, nên phát biểu $1$ đúng.]
    #step[Suy ra $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 108pi/r$, nên phát biểu $2$ đúng.]
    #step[Giải $S'(r) = 0$ được $r = 3$, không phải $2$, nên phát biểu $3$ sai.]
    #step[Khi $r = 3$ thì $h = 54/9 = 6 = 2r$, nên phát biểu $4$ đúng.]
  ],
)


#resetexamstate()

#tln(
  [Hình nón nội tiếp khối cầu bán kính $R = 6$ cm. Thể tích lớn nhất của hình nón bằng $m pi / 3$ cm³. Tính $m$.],
  [$256$],
  accent: c-p2,
  loigiai: [
    #step[Thể tích nón nội tiếp cầu lớn nhất khi $h = 4R / 3 = 8$.]
    #step[Khi đó:
      $ V_(max) = 32 pi R^3 / 81 = 32 pi dot.c 216 / 81 = 256 pi / 3. $
      Vậy $m = 256$.]
  ],
)

#tln(
  [Hình trụ nội tiếp khối lập phương cạnh $a = 2$ dm. Thể tích trụ lớn nhất (dm³, làm tròn đến $0{,}01$) bằng],
  [$2 pi approx 6{,}28$],
  accent: c-p2,
  loigiai: [
    #step[Hình trụ lớn nhất nội tiếp khối lập phương có bán kính $r = a/2 = 1$ dm và chiều cao $h = a = 2$ dm.]
    #step[Do đó:
      $ V = pi r^2 h = pi dot.c 1^2 dot.c 2 = 2 pi approx 6{,}28 $ dm³.]
  ],
)

#tln(
  [Một hình trụ kín có thể tích $54 pi$ cm³. Diện tích toàn phần nhỏ nhất của hình trụ bằng bao nhiêu cm²?],
  [$54 pi$],
  accent: c-p2,
  loigiai: [
    #step[Từ bài toán tối ưu chuẩn, diện tích nhỏ nhất đạt được khi $r = 3$ cm.]
    #step[Khi đó $h = 54/9 = 6$ cm và:
      $ S_(min) = 2pi dot.c 3^2 + 2pi dot.c 3 dot.c 6 = 18pi + 36pi = 54pi. $]
  ],
)


