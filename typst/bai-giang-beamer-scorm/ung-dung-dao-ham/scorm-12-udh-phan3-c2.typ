#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN3-C2
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
  title:       "P3.C2: TỐI ƯU HÓA MẠNG LƯỚI CƠ SỞ HẠ TẦNG",
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


#slide[ = Cơ sở hạ tầng: Bài toán tỉ phú! ]
- Đặt một trạm phát sóng ở đâu để phủ sóng 3 ngôi làng với chi phí dây cáp ít nhất? Xây đường ống dẫn dầu thế nào để tối thiểu hóa hao phí?
- Những bài toán này quyết định giá trị hàng tỷ USD trong các dự án quy hoạch quốc gia.



#chapter([Tối Ưu Hóa Mạng Lưới Cơ Sở Hạ Tầng], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Hai dạng chuẩn của chương này:*
  - Nếu điểm trung chuyển bị ràng buộc trên một tuyến thẳng, hãy đặt ẩn theo vị trí trên tuyến đó và tối ưu tổng căn thức bằng đạo hàm; có thể kiểm tra nhanh bằng nguyên lý phản xạ.
  - Nếu điểm nối mạng được chọn tự do trong tam giác, nghiệm tối ưu là điểm Fermat khi mọi góc của tam giác nhỏ hơn $120°$.
  - Nếu tam giác có một góc không nhỏ hơn $120°$, điểm tối ưu chính là đỉnh mang góc đó.
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Hai khu dân cư $A$ và $B$ nằm cùng phía của một tuyến đường thẳng $d$. Khoảng cách từ $A$ đến $d$ là $4$ km, từ $B$ đến $d$ là $2$ km, còn hai hình chiếu vuông góc của $A$ và $B$ trên $d$ cách nhau $10$ km. Hãy chọn điểm đặt trạm trung chuyển $P$ trên đường $d$ sao cho tổng chiều dài đường nối $P A + P B$ là nhỏ nhất.],
    canvas(length: 1cm, {
      import draw: *
      let A = (0, 4)
      let H = (0, 0)
      let P = (3.3, 0)
      let K = (5, 0)
      let B = (5, 2)
      line((-0.8, 0), (6.2, 0), stroke: 1.5pt + rgb("666666"))
      content((5.95, -0.38), [$d$])
      line(A, P, stroke: 1.5pt + c-p3)
      line(B, P, stroke: 1.5pt + rgb("b45309"))
      line(A, H, stroke: (dash: "dashed", paint: rgb("888888")))
      line(B, K, stroke: (dash: "dashed", paint: rgb("888888")))
      circle(A, radius: 1.4pt, fill: black)
      circle(B, radius: 1.4pt, fill: black)
      circle(H, radius: 1.4pt, fill: black)
      circle(K, radius: 1.4pt, fill: black)
      circle(P, radius: 1.4pt, fill: black)
      content((-0.25, 4.32), [$A$])
      content((5.15, 2.25), [$B$])
      content((-0.25, -0.42), [$H$])
      content((5.0, -0.42), [$K$])
      content((3.3, -0.42), [$P$])
      content((-0.62, 2), [$4$], angle: 90deg)
      content((5.55, 1), [$2$], angle: 90deg)
      content((2.5, -0.55), [$10$])
      content((1.65, -0.28), [$x$])
      content((4.15, -0.28), [$10 - x$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Đặt $x = H P$ để tổng độ dài cần tối ưu trở thành hàm một biến trên đoạn kín.
      - Tính đạo hàm của tổng chiều dài $L(x)$ và tìm điểm làm đạo hàm bằng $0$.
      - Lập BBT rồi kết luận vị trí của trạm trung chuyển.
    ]

    #step[Đặt $x = H P$ (km), khi đó $0 <= x <= 10$. Ta có
      $P A = sqrt(x^2 + 4^2) = sqrt(x^2 + 16)$
      và
      $P B = sqrt((10 - x)^2 + 2^2) = sqrt((10 - x)^2 + 4)$.]

    #step[Tổng chiều dài cần tối ưu là:
      $
        L(x) = sqrt(x^2 + 16) + sqrt((10 - x)^2 + 4), quad x in [0; 10].
      $]

    #step[Đạo hàm:
      $
        L'(x) = frac(x, sqrt(x^2 + 16)) - frac(10 - x, sqrt((10 - x)^2 + 4)).
      $
      Cho $L'(x) = 0$:
      $
        frac(x, sqrt(x^2 + 16)) = frac(10 - x, sqrt((10 - x)^2 + 4)).
      $
      Bình phương hai vế rồi rút gọn:
      $
        x^2 ((10 - x)^2 + 4) = (10 - x)^2 (x^2 + 16)
        <=> 4 dot.c x^2 = 16 dot.c (10 - x)^2.
      $
      Vì $0 <= x <= 10$, suy ra
      $
        x = 2 dot.c (10 - x) <=> x = frac(20, 3).
      $]

    #step[Bảng biến thiên của $L(x)$ trên đoạn $[0; 10]$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $frac(20, 3)$, $10$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($2 + 2 dot.c sqrt(29)$, $2 dot.c sqrt(34)$, $4 dot.c sqrt(29)$),
          is-min: true,
        )
      ]]

    #step[Vậy trạm trung chuyển nên đặt tại điểm $P$ trên $d$ sao cho
      $H P = frac(20, 3)$ km.
      Khi đó tổng chiều dài đường nối nhỏ nhất là
      $L_min = 2 dot.c sqrt(34) approx 11{,}66$ km.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#bt(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Ba thành phố $A$, $B$, $C$ tạo thành một tam giác đều cạnh $12$ km. Cần chọn một vị trí $T$ để xây trung tâm điều phối sao cho tổng chiều dài các tuyến đường $T A + T B + T C$ là nhỏ nhất. Hãy xác định vị trí của $T$ và tính tổng chiều dài nhỏ nhất đó.],
    canvas(length: 1cm, {
      import draw: *
      let A = (0, 0)
      let B = (6, 0)
      let C = (3, 5.2)
      let T = (3, 1.73)
      line(A, B, C, close: true, stroke: 1.5pt + c-p3)
      line(T, A, stroke: 1pt + rgb("b45309"))
      line(T, B, stroke: 1pt + rgb("b45309"))
      line(T, C, stroke: 1pt + rgb("b45309"))
      circle(A, radius: 1.4pt, fill: black)
      circle(B, radius: 1.4pt, fill: black)
      circle(C, radius: 1.4pt, fill: black)
      circle(T, radius: 1.4pt, fill: black)
      content((-0.18, -0.38), [$A$])
      content((6.1, -0.38), [$B$])
      content((3.0, 5.55), [$C$])
      content((3.16, 1.86), [$T$])
      content((3.0, -0.55), [$12$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Nhận diện tam giác đều nên điểm tối ưu tự do trong tam giác là tâm đối xứng đồng thời là điểm Fermat.
      - Tính khoảng cách từ tâm đó tới mỗi đỉnh.
      - Cộng ba khoảng cách để được tổng nhỏ nhất.
    ]

    #step[Vì tam giác $A B C$ đều nên mọi góc đều nhỏ hơn $120°$. Do đó điểm tối ưu là điểm Fermat của tam giác, đồng thời cũng chính là tâm của tam giác đều.]

    #step[Gọi $T$ là tâm tam giác đều cạnh $12$. Khi đó
      $T A = T B = T C = frac(12, sqrt(3)) = 4 dot.c sqrt(3)$ km.]

    #step[Suy ra tổng chiều dài nhỏ nhất là
      $
        T A + T B + T C = 3 dot.c 4 dot.c sqrt(3) = 12 dot.c sqrt(3)
      $
      km.]

    #step[Vậy trung tâm điều phối nên đặt tại tâm tam giác đều, và tổng chiều dài mạng đường ngắn nhất là
      $12 dot.c sqrt(3)$ km.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#bt(
  [Tam giác $A B C$ có $angle A = 120°$, $A B = 6$ km, $A C = 8$ km. Hãy chọn điểm $T$ trong hoặc trên tam giác sao cho $T A + T B + T C$ nhỏ nhất và tính giá trị nhỏ nhất đó.],
  loigiai: [
    #ppgiai[
      - Dùng định lý Fermat mở rộng: nếu một góc của tam giác không nhỏ hơn $120°$, điểm tối ưu là đỉnh mang góc đó.
      - Thay ngay điểm tối ưu vào tổng khoảng cách để tính giá trị nhỏ nhất.
    ]

    #step[Vì $angle A = 120°$, nên theo định lý Fermat mở rộng, điểm tối ưu chính là đỉnh $A$.]

    #step[Khi đó tổng nhỏ nhất là
      $
        T A + T B + T C = A A + A B + A C = 0 + 6 + 8 = 14
      $
      km.]

    #step[Vậy chọn $T = A$ và giá trị nhỏ nhất bằng $14$ km.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#nhanxet(theme-color: c-p3)[
  *Góc nhìn quy hoạch:* với điểm nối mạng bị ép nằm trên một tuyến thẳng, đạo hàm cho lời giải trực tiếp. Với điểm nối mạng tự do giữa ba điểm, bài toán chuyển sang cấu trúc hình học của điểm Fermat.
]

#bt-header(c-p3)
#resetexamstate()



#tn(
  [Khi điểm trung chuyển $P$ bị ràng buộc nằm trên một đường thẳng $d$ và cần tối thiểu hóa $P A + P B$, ý tưởng hình học nhanh nhất để kiểm tra nghiệm là],
  (
    [Dùng bất đẳng thức Cauchy],
    True([Phản xạ một điểm qua $d$ để biến gấp khúc thành đoạn thẳng]),
    [Dùng trọng tâm tam giác],
    [Lấy trung điểm của hai hình chiếu lên $d$],
  ),
  accent: c-p3,
  loigiai: [
    #step[Phản xạ một trong hai điểm qua đường thẳng $d$ giúp biến tổng $P A + P B$ thành một đường gấp khúc có độ dài bằng một đoạn thẳng, từ đó nhận ra vị trí tối ưu.]
  ],
)

#tn(
  [Trong ví dụ với $A$ cách $d$ $4$ km, $B$ cách $d$ $2$ km và hai hình chiếu cách nhau $10$ km, giá trị tối ưu của $H P$ là],
  ([$5$], [$6$], True([$frac(20, 3)$]), [$8$]),
  accent: c-p3,
  loigiai: [
    #step[Giải $L'(x) = 0$ cho hàm
      $L(x) = sqrt(x^2 + 16) + sqrt((10 - x)^2 + 4)$
      thu được $x = frac(20, 3)$.]
  ],
)

#tn(
  [Nếu mọi góc của tam giác đều nhỏ hơn $120°$, điểm tối ưu để tổng khoảng cách đến ba đỉnh là nhỏ nhất thỏa],
  (
    [Ba góc tạo bởi các đoạn nối đều bằng $90°$],
    True([Ba góc tạo bởi các đoạn nối đôi một đều bằng $120°$]),
    [Điểm tối ưu luôn là trọng tâm],
    [Điểm tối ưu luôn nằm trên cạnh dài nhất],
  ),
  accent: c-p3,
  loigiai: [
    #step[Đó chính là tính chất đặc trưng của điểm Fermat trong tam giác nhọn hoặc tam giác có mọi góc nhỏ hơn $120°$.]
  ],
)

#tn(
  [Nếu tam giác có một góc không nhỏ hơn $120°$, điểm tối ưu để tổng khoảng cách đến ba đỉnh nhỏ nhất là],
  (
    [Trọng tâm],
    [Trung điểm cạnh đối diện],
    True([Đỉnh mang góc đó]),
    [Tâm đường tròn nội tiếp],
  ),
  accent: c-p3,
  loigiai: [
    #step[Đây là trường hợp biên của định lý Fermat mở rộng: điểm tối ưu rơi ngay vào đỉnh có góc không nhỏ hơn $120°$.]
  ],
)


#resetexamstate()

#ds(
  [Xét bài toán đặt trạm trung chuyển $P$ trên đường thẳng $d$ với
    $L(x) = sqrt(x^2 + 16) + sqrt((10 - x)^2 + 4)$,
    trong đó $x = H P$ và $0 <= x <= 10$.],
  (
    True([Đạo hàm là $L'(x) = frac(x, sqrt(x^2 + 16)) - frac(10 - x, sqrt((10 - x)^2 + 4))$.]),
    [Phương trình $L'(x) = 0$ cho nghiệm $x = 5$.],
    True([Điểm cực tiểu đạt tại $x = frac(20, 3)$.]),
    True([Giá trị nhỏ nhất của tổng chiều dài là $2 dot.c sqrt(34)$.]),
  ),
  accent: c-p3,
  loigiai: [
    #step[Lấy đạo hàm của $L(x)$ đúng như phát biểu $1$, nên phát biểu $1$ đúng.]
    #step[Giải $L'(x) = 0$ thu được $x = frac(20, 3)$ chứ không phải $5$, nên phát biểu $2$ sai.]
    #step[Vì $L'(x)$ đổi dấu từ âm sang dương tại $x = frac(20, 3)$, nên phát biểu $3$ đúng.]
    #step[Thay $x = frac(20, 3)$ vào $L(x)$ được $L_min = 2 dot.c sqrt(34)$, nên phát biểu $4$ đúng.]
  ],
)

#ds(
  [Xét bài toán chọn điểm $T$ để tổng $T A + T B + T C$ nhỏ nhất trong tam giác $A B C$.],
  (
    True([Nếu mọi góc của tam giác nhỏ hơn $120°$ thì điểm tối ưu là điểm Fermat.]),
    True([Trong tam giác đều, điểm tối ưu trùng với tâm tam giác.]),
    [Trong mọi tam giác, điểm tối ưu luôn nằm trong tam giác.],
    True([Nếu $angle A >= 120°$ thì chọn $T = A$ là tối ưu.]),
  ),
  accent: c-p3,
  loigiai: [
    #step[Phát biểu $1$ đúng theo định lý Fermat.]
    #step[Trong tam giác đều, mọi tâm trùng nhau và cũng là điểm Fermat, nên phát biểu $2$ đúng.]
    #step[Nếu có một góc không nhỏ hơn $120°$, điểm tối ưu rơi vào đỉnh đó chứ không còn nằm trong nội thất tam giác, nên phát biểu $3$ sai.]
    #step[Phát biểu $4$ đúng theo định lý Fermat mở rộng.]
  ],
)


#resetexamstate()

#tln(
  [Trong bài toán đặt trạm trung chuyển trên đường thẳng $d$, biết $A$ cách $d$ $4$ km, $B$ cách $d$ $2$ km và hai hình chiếu cách nhau $9$ km. Giá trị $H P$ tối ưu là],
  [$6$],
  accent: c-p3,
  loigiai: [
    #step[Giải phương trình $L'(x) = 0$ của hàm
      $L(x) = sqrt(x^2 + 16) + sqrt((9 - x)^2 + 4)$,
      ta được
      $4 dot.c x^2 = 16 dot.c (9 - x)^2$, suy ra $x = 6$.]
  ],
)

#tln(
  [Ba thành phố tạo thành tam giác đều cạnh $6 dot.c sqrt(3)$ km. Nếu đặt trung tâm điều phối ở vị trí tối ưu thì tổng chiều dài nhỏ nhất của ba tuyến đường nối tới các đỉnh là],
  [$18$],
  accent: c-p3,
  loigiai: [
    #step[Trong tam giác đều cạnh $6 dot.c sqrt(3)$, điểm tối ưu là tâm tam giác và khoảng cách từ tâm tới mỗi đỉnh là
      $frac(6 dot.c sqrt(3), sqrt(3)) = 6$.]
    #step[Vì vậy tổng nhỏ nhất là $3 dot.c 6 = 18$.]
  ],
)

#tln(
  [Tam giác $A B C$ có $angle A = 120°$, $A B = 6$ km, $A C = 8$ km. Giá trị nhỏ nhất của $T A + T B + T C$ bằng bao nhiêu?],
  [$14$],
  accent: c-p3,
  loigiai: [
    #step[Vì $angle A = 120°$, điểm tối ưu là $T = A$.]
    #step[Khi đó tổng nhỏ nhất bằng $A B + A C = 6 + 8 = 14$.]
  ],
)


