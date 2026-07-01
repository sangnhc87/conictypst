#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN3-C1
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
  title:       "P3.C1: CHUYỂN ĐỘNG ĐA MÔI TRƯỜNG & NGUYÊN LÝ FERMAT",
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


#slide[ = Bí ẩn: Sự thông minh của ánh sáng! ]
- Một nhân viên cứu hộ chạy trên cát với tốc độ $v_1$, bơi dưới nước với tốc độ $v_2$. Anh ta phải chọn đường nào để cứu nạn nhân nhanh nhất? Đường thẳng không phải là nhanh nhất vì bơi chậm hơn chạy!
- Đạo hàm cho ta câu trả lời chính xác về vị trí nên nhảy xuống nước.
- Kì diệu thay, khi ánh sáng truyền qua hai môi trường (như không khí vào nước), nó bị khúc xạ đúng theo góc mà đạo hàm vừa tính ra. *Ánh sáng dường như biết giải toán tối ưu (Nguyên lý Fermat)!*



#chapter([Chuyển Động Đa Môi Trường & Nguyên Lý Fermat], theme-color: c-p3)

#phuongphap(theme-color: c-p3)[
  *Khung xử lý chuẩn cho bài toán hai môi trường:*
  - Dựng hình, chọn ẩn $x$ là vị trí chạm bờ hoặc vị trí đổi phương tiện.
  - Biểu diễn đại lượng cần tối ưu theo $x$: thời gian, chi phí hoặc quãng đường.
  - Tìm miền xác định từ hình học thực tế rồi dùng đạo hàm và BBT để kết luận.
  - Ở bài toán thời gian ngắn nhất, điều kiện cực trị thường dẫn tới hệ thức kiểu Snell:
    $frac(sin theta_1, v_1) = frac(sin theta_2, v_2)$.
]

#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Một nhân viên cứu hộ đang ở điểm $A$ ngoài khơi, cách bờ biển $60$ m theo phương vuông góc. Điểm cần đến là $B$ trên bờ, cách hình chiếu $H$ của $A$ lên bờ một đoạn $100$ m. Biết vận tốc bơi là $2$ m/s và vận tốc chạy là $5$ m/s. Hãy chọn điểm lên bờ $P$ để tổng thời gian đi từ $A$ đến $B$ là nhỏ nhất.],
    canvas(length: 1cm, {
      import draw: *
      let A = (0, 4.2)
      let H = (0, 0)
      let P = (2.2, 0)
      let B = (6.4, 0)
      line((-0.8, 0), (7.2, 0), stroke: 1.5pt + rgb("666666"))
      content((6.6, -0.4), [*Bờ biển*])
      line(A, P, stroke: 1.5pt + c-p3)
      line(P, B, stroke: 1.5pt + rgb("b45309"))
      line(A, H, stroke: (dash: "dashed", paint: rgb("888888")))
      circle(A, radius: 1.4pt, fill: black)
      circle(H, radius: 1.4pt, fill: black)
      circle(P, radius: 1.4pt, fill: black)
      circle(B, radius: 1.4pt, fill: black)
      content((-0.3, 4.55), [$A$])
      content((-0.25, -0.42), [$H$])
      content((2.2, -0.42), [$P$])
      content((6.65, -0.42), [$B$])
      content((-0.7, 2.1), [$60$ m], angle: 90deg)
      content((1.1, -0.55), [$x$])
      content((4.3, -0.55), [$100 - x$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Đặt $x = H P$ để đưa bài toán hình học về một biến số trên đoạn kín.
      - Lập hàm thời gian $T(x)$ bằng tổng thời gian bơi và thời gian chạy.
      - Tính đạo hàm, lập BBT rồi kết luận vị trí $P$ tối ưu.
    ]

    #step[Đặt $x = H P$ (m), khi đó $0 <= x <= 100$. Quãng đường bơi là
      $A P = sqrt(60^2 + x^2) = sqrt(3600 + x^2)$
      và quãng đường chạy là $P B = 100 - x$.]

    #step[Thời gian đi từ $A$ đến $B$ là:
      $
        T(x) = frac(sqrt(3600 + x^2), 2) + frac(100 - x, 5), quad x in [0; 100].
      $]

    #step[Đạo hàm:
      $
        T'(x) = frac(x, 2 dot.c sqrt(3600 + x^2)) - frac(1, 5).
      $
      Cho $T'(x) = 0$:
      $
        frac(x, 2 dot.c sqrt(3600 + x^2)) = frac(1, 5)
        <=> 5 dot.c x = 2 dot.c sqrt(3600 + x^2)
        <=> 25 dot.c x^2 = 4 dot.c (3600 + x^2)
        <=> 21 dot.c x^2 = 14400.
      $
      Vì $x >= 0$, suy ra
      $
        x = frac(120, sqrt(21)) = frac(40 dot.c sqrt(21), 7) approx 26{,}2.
      $]

    #step[Bảng biến thiên của $T(x)$ trên đoạn $[0; 100]$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $T'$,
          func: $T$,
          x-vals: ($0$, $frac(40 dot.c sqrt(21), 7)$, $100$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($50$, $20 + 6 dot.c sqrt(21)$, $10 dot.c sqrt(34)$),
          is-min: true,
        )
      ]]

    #step[Vậy nhân viên cứu hộ nên lên bờ tại điểm $P$ sao cho
      $H P = frac(40 dot.c sqrt(21), 7) approx 26{,}2$ m.
      Khi đó thời gian nhỏ nhất là
      $T_min = 20 + 6 dot.c sqrt(21) approx 47{,}5$ giây.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#luuy(theme-color: c-p3)[
  - Bài toán hình phải nói rõ ẩn hình học là đoạn nào, chạy trên đoạn nào; không nên viết đề kiểu cụt mệnh đề hoặc chỉ chừa một con số cần điền.
  - Khi bình phương để khử căn, chỉ chấp nhận nghiệm còn nằm trong miền xác định hình học ban đầu.
]

#bt(
  grid(
    columns: (1fr, auto),
    column-gutter: 16pt,
    [Một bưu kiện cần được chuyển từ đảo $A$ vào kho $B$ trên bờ. Đảo $A$ cách bờ $4$ km tại hình chiếu $H$, còn kho $B$ cách $H$ một đoạn $9$ km dọc theo bờ. Nếu vận chuyển trên biển tốn $3$ triệu đồng/km và vận chuyển trên bờ tốn $1$ triệu đồng/km, hãy chọn điểm cập bờ $P$ để tổng chi phí nhỏ nhất.],
    canvas(length: 1cm, {
      import draw: *
      let A = (0, 4)
      let H = (0, 0)
      let P = (1.7, 0)
      let B = (5.8, 0)
      line((-0.8, 0), (6.5, 0), stroke: 1.5pt + rgb("666666"))
      content((5.9, -0.38), [*Bờ biển*])
      line(A, P, stroke: 1.5pt + c-p3)
      line(P, B, stroke: 1.5pt + rgb("b45309"))
      line(A, H, stroke: (dash: "dashed", paint: rgb("888888")))
      circle(A, radius: 1.4pt, fill: black)
      circle(H, radius: 1.4pt, fill: black)
      circle(P, radius: 1.4pt, fill: black)
      circle(B, radius: 1.4pt, fill: black)
      content((-0.28, 4.32), [$A$])
      content((-0.25, -0.42), [$H$])
      content((1.7, -0.42), [$P$])
      content((6.02, -0.42), [$B$])
      content((-0.65, 2), [$4$ km], angle: 90deg)
      content((0.85, -0.55), [$x$])
      content((3.7, -0.55), [$9 - x$])
    }),
  ),
  loigiai: [
    #ppgiai[
      - Chọn $x = H P$ để mô hình hóa chi phí biển và chi phí bờ theo một biến.
      - Lập hàm chi phí tổng cộng $C(x)$ trên đoạn $[0; 9]$.
      - Tính đạo hàm, khảo sát BBT và kết luận vị trí cập bờ tối ưu.
    ]

    #step[Đặt $x = H P$ (km), khi đó $0 <= x <= 9$. Khi ấy
      $A P = sqrt(4^2 + x^2) = sqrt(16 + x^2)$
      và $P B = 9 - x$.]

    #step[Tổng chi phí vận chuyển là:
      $
        C(x) = 3 dot.c sqrt(16 + x^2) + 9 - x, quad x in [0; 9].
      $]

    #step[Đạo hàm:
      $
        C'(x) = frac(3 dot.c x, sqrt(16 + x^2)) - 1.
      $
      Cho $C'(x) = 0$:
      $
        frac(3 dot.c x, sqrt(16 + x^2)) = 1
        <=> 3 dot.c x = sqrt(16 + x^2)
        <=> 9 dot.c x^2 = 16 + x^2
        <=> 8 dot.c x^2 = 16
        <=> x = sqrt(2).
      $]

    #step[Bảng biến thiên của $C(x)$ trên đoạn $[0; 9]$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $C'$,
          func: $C$,
          x-vals: ($0$, $sqrt(2)$, $9$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($21$, $9 + 8 dot.c sqrt(2)$, $3 dot.c sqrt(97)$),
          is-min: true,
        )
      ]]

    #step[Vậy nên chọn điểm cập bờ $P$ sao cho
      $H P = sqrt(2) approx 1{,}41$ km.
      Khi đó tổng chi phí nhỏ nhất là
      $C_min = 9 + 8 dot.c sqrt(2) approx 20{,}31$ triệu đồng.]
    #resetstep()
  ],
  theme-color: c-p3,
)

#nhanxet(theme-color: c-p3)[
  *Ý tưởng cốt lõi:* nguyên lý Fermat không chỉ dùng cho ánh sáng. Nó cũng xuất hiện trong các quyết định tối ưu đường đi, chi phí vận chuyển và vị trí chuyển phương tiện trong bài toán thực tế.
]

#bt-header(c-p3)
#resetexamstate()



#tn(
  [Với mô hình di chuyển hai môi trường có
    $T(x) = frac(sqrt(a^2 + x^2), v_1) + frac(d - x, v_2)$,
    đạo hàm đúng của $T(x)$ là],
  (
    [$frac(x, sqrt(a^2 + x^2)) - frac(1, v_2)$],
    True([$frac(x, v_1 dot.c sqrt(a^2 + x^2)) - frac(1, v_2)$]),
    [$frac(a, v_1 dot.c sqrt(a^2 + x^2)) - frac(1, v_2)$],
    [$frac(x, v_1 dot.c (a^2 + x^2)) - frac(1, v_2)$],
  ),
  accent: c-p3,
  loigiai: [
    #step[Lấy đạo hàm từng hạng tử, ta được
      $T'(x) = frac(x, v_1 dot.c sqrt(a^2 + x^2)) - frac(1, v_2)$.]
  ],
)

#tn(
  [Một con tàu ở điểm $A$ cách bờ $3$ km, cần đến điểm $B$ trên bờ cách hình chiếu $H$ của $A$ một đoạn $4$ km. Biết vận tốc trên biển là $3$ km/h, trên bờ là $5$ km/h. Nếu gọi $x = H P$ với $P$ là điểm lên bờ, thì giá trị tối ưu của $x$ là],
  ([$2$], True([$frac(9, 4)$]), [$frac(5, 2)$], [$3$]),
  accent: c-p3,
  loigiai: [
    #step[Ta có
      $T(x) = frac(sqrt(9 + x^2), 3) + frac(4 - x, 5)$,
      nên
      $T'(x) = frac(x, 3 dot.c sqrt(9 + x^2)) - frac(1, 5)$.]
    #step[Giải $T'(x) = 0$ được
      $5 dot.c x = 3 dot.c sqrt(9 + x^2) <=> 25 dot.c x^2 = 81 + 9 dot.c x^2 <=> 16 dot.c x^2 = 81$,
      suy ra $x = frac(9, 4)$.]
  ],
)

#tn(
  [Với bài toán vận chuyển từ đảo vào bờ, nếu chi phí đường biển là $3$ triệu đồng/km, chi phí đường bộ là $1$ triệu đồng/km, đảo cách bờ $4$ km và kho cách hình chiếu một đoạn $9$ km, thì điểm cập bờ tối ưu thỏa],
  ([$H P = 1$ km], True([$H P = sqrt(2)$ km]), [$H P = 2$ km], [$H P = 3$ km]),
  accent: c-p3,
  loigiai: [
    #step[Tổng chi phí là
      $C(x) = 3 dot.c sqrt(16 + x^2) + 9 - x$.]
    #step[Giải
      $C'(x) = frac(3 dot.c x, sqrt(16 + x^2)) - 1 = 0$
      thu được $x = sqrt(2)$.]
  ],
)

#tn(
  [Trong mô hình tối ưu thời gian kiểu Fermat, điều kiện cực trị thường được viết dưới dạng],
  (
    True([$frac(sin theta_1, v_1) = frac(sin theta_2, v_2)$]),
    [$sin theta_1 = sin theta_2$],
    [$v_1 dot.c sin theta_1 = frac(sin theta_2, v_2)$],
    [$frac(cos theta_1, v_1) = frac(cos theta_2, v_2)$],
  ),
  accent: c-p3,
  loigiai: [
    #step[Điều kiện cân bằng thời gian khi đổi môi trường chính là hệ thức Snell:
      $frac(sin theta_1, v_1) = frac(sin theta_2, v_2)$.]
  ],
)


#resetexamstate()

#ds(
  [Người đánh cá ở điểm $A$ cách bờ $3$ km, muốn về điểm $B$ dọc theo bờ cách chân đường vuông góc $4$ km. Người chèo thuyền với vận tốc $2$ km/h rồi đi bộ với vận tốc $4$ km/h. Gọi $theta$ là góc giữa quãng đường chèo $A P$ và phương vuông góc với bờ.],
  (
    True([Tổng thời gian có thể viết là $T(theta) = frac(3, 2 dot.c cos theta) + frac(4 - 3 dot.c tan theta, 4)$.]),
    True([Điều kiện cực tiểu tương đương $frac(sin theta, 2) = frac(1, 4)$, nên $sin theta = frac(1, 2)$.]),
    True([Góc tối ưu là $theta = 30°$.]),
    [Thời gian nhỏ nhất là $1 + frac(sqrt(3), 2)$ giờ.],
  ),
  accent: c-p3,
  loigiai: [
    #step[Vì $A P = frac(3, cos theta)$ và $P B = 4 - 3 dot.c tan theta$, nên
      $T(theta) = frac(3, 2 dot.c cos theta) + frac(4 - 3 dot.c tan theta, 4)$.
      Do đó phát biểu $1$ đúng.]
    #step[Đạo hàm theo $theta$ hoặc dùng hệ thức Snell đều cho
      $frac(sin theta, 2) = frac(1, 4)$, nên phát biểu $2$ đúng.]
    #step[Từ $sin theta = frac(1, 2)$ và $theta in (0°; 90°)$, suy ra $theta = 30°$. Phát biểu $3$ đúng.]
    #step[Khi đó $A P = 2 dot.c sqrt(3)$ và $P B = 4 - sqrt(3)$, nên
      $T_min = sqrt(3) + frac(4 - sqrt(3), 4) = 1 + frac(3 dot.c sqrt(3), 4)$.
      Vì vậy phát biểu $4$ sai.]
  ],
)

#ds(
  [Một bưu kiện được chuyển từ đảo vào bờ theo mô hình chi phí biển $3$ triệu đồng/km, chi phí bờ $1$ triệu đồng/km. Đảo cách bờ $4$ km, kho trên bờ cách hình chiếu một đoạn $9$ km. Gọi $x = H P$ là vị trí cập bờ.],
  (
    True([Tổng chi phí là $C(x) = 3 dot.c sqrt(16 + x^2) + 9 - x$.]),
    True([Đạo hàm của hàm chi phí là $C'(x) = frac(3 dot.c x, sqrt(16 + x^2)) - 1$.]),
    [Chi phí nhỏ nhất đạt được khi $x = 2$.],
    True([Chi phí nhỏ nhất bằng $9 + 8 dot.c sqrt(2)$ triệu đồng.]),
  ),
  accent: c-p3,
  loigiai: [
    #step[Từ hình học, ta có $A P = sqrt(16 + x^2)$ và $P B = 9 - x$, nên phát biểu $1$ đúng.]
    #step[Lấy đạo hàm theo $x$ được
      $C'(x) = frac(3 dot.c x, sqrt(16 + x^2)) - 1$, nên phát biểu $2$ đúng.]
    #step[Giải $C'(x) = 0$ thu được $x = sqrt(2)$, không phải $x = 2$, nên phát biểu $3$ sai.]
    #step[Thay $x = sqrt(2)$ vào $C(x)$, ta được
      $C_min = 3 dot.c sqrt(18) + 9 - sqrt(2) = 9 + 8 dot.c sqrt(2)$.
      Phát biểu $4$ đúng.]
  ],
)


#resetexamstate()

#tln(
  [Một con tàu ở điểm $A$ cách bờ $3$ km. Điểm $B$ trên bờ cách hình chiếu $H$ của $A$ một đoạn $9$ km. Biết vận tốc trên biển là $4$ km/h và trên bờ là $5$ km/h. Giá trị $H P$ để thời gian nhỏ nhất là],
  [$4$],
  accent: c-p3,
  loigiai: [
    #step[Ta có
      $T(x) = frac(sqrt(9 + x^2), 4) + frac(9 - x, 5)$.]
    #step[Giải
      $
        T'(x) = frac(x, 4 dot.c sqrt(9 + x^2)) - frac(1, 5) = 0
        <=> 5 dot.c x = 4 dot.c sqrt(9 + x^2)
        <=> 25 dot.c x^2 = 16 dot.c (9 + x^2)
        <=> x = 4.
      $]
  ],
)

#tln(
  [Với dữ kiện của câu trên, thời gian di chuyển nhỏ nhất gần đúng bằng bao nhiêu giờ? (làm tròn đến hàng phần mười)],
  [$2{,}3$],
  accent: c-p3,
  loigiai: [
    #step[Thay $x = 4$ vào hàm thời gian:
      $
        T_min = frac(sqrt(9 + 16), 4) + frac(9 - 4, 5)
        = frac(5, 4) + 1
        = 2{,}25.
      $]
    #step[Làm tròn đến hàng phần mười, ta được $2{,}3$ giờ.]
  ],
)

#tln(
  [Một bưu kiện được chuyển từ đảo vào bờ theo mô hình chi phí biển $5$ triệu đồng/km, chi phí bờ $3$ triệu đồng/km; đảo cách bờ $4$ km và kho cách hình chiếu $7$ km. Tổng chi phí nhỏ nhất là],
  [$37$],
  accent: c-p3,
  loigiai: [
    #step[Chi phí tổng cộng là
      $C(x) = 5 dot.c sqrt(16 + x^2) + 3 dot.c (7 - x)$.]
    #step[Giải $C'(x) = 0$ được
      $frac(5 dot.c x, sqrt(16 + x^2)) - 3 = 0 <=> x = 3$.]
    #step[Khi đó
      $C_min = 5 dot.c sqrt(25) + 3 dot.c 4 = 25 + 12 = 37$.]
  ],
)


