#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-12-UDDH-PHAN1-C1
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
  title:       "P1.C1: TỐI ƯU HÓA HÌNH PHẲNG 2D CƠ BẢN",
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


#slide[ = Gợi mở: Bác nông dân và Bài toán rào vườn ]
- Có một người nông dân có $60 "m"$ hàng rào. Ông ta muốn rào một khu vườn hình chữ nhật để nuôi gà. Làm sao để diện tích lớn nhất?
- Nếu dùng trực giác, chúng ta có thể thử rào $10 times 20$, $15 times 15$, v.v. Nhưng để tìm ra con số *tuyệt đối chính xác*, ta phải dùng toán học!
- Đạo hàm chính là chiếc "đũa thần" giúp ta tìm ra điểm chạm đỉnh của mọi hàm số. Đây là tiền đề cho một ngành khoa học khổng lồ: *Tối ưu hóa*.




#chapter([Tối Ưu Hóa Hình Phẳng 2D Cơ Bản], theme-color: c-p1)

#phuongphap(theme-color: c-p1)[
  *Quy trình "Conan Logic" — 4 bước cho bài toán tối ưu hình phẳng:*

  + *Nhận diện:* Xác định hai đại lượng chính — cái *cố định* (chu vi, diện
    tích vật liệu, ngân sách) và cái cần *tối ưu* (diện tích, chi phí, lợi nhuận).
  + *Rút thế:* Dùng ràng buộc cố định để biểu diễn một ẩn theo ẩn kia,
    đưa hàm mục tiêu về *một biến* duy nhất. Xác định miền xác định $(0; a)$.
  + *Đạo hàm và cực trị:* Giải $f'(x) = 0$, kiểm tra dấu $f'(x)$ hoặc
    dùng $f''(x)$. Đừng quên so sánh với giá trị tại biên nếu đoạn đóng!
  + *Kết luận thực tế:* Trả lời bằng đơn vị của bài toán (m, m², đồng...),
    ghi rõ giá trị tối ưu đạt được.
]

#topic([Bài Toán Rào Mảnh Vườn & Phân Lô], prefix: "Bài", theme-color: c-p1)
#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một nhà vườn có $60$ m hàng rào để quây một mảnh đất hình chữ nhật sát một bức tường thẳng dài (không cần rào phía tường). Hỏi phải bố trí chiều dài, chiều rộng bao nhiêu để diện tích mảnh vườn là lớn nhất?],
    canvas(length: 1cm, {
      import draw: *
      // Vẽ bức tường
      line((0, 0), (0, 4), stroke: 2pt + rgb("555555"))
      for i in range(1, 9) {
        line((0, i * 0.5 - 0.2), (-0.4, i * 0.5 - 0.6), stroke: 0.5pt + rgb("555555"))
      }
      content((-0.8, 2), [*Bức tường*], angle: 90deg)

      // Vẽ hàng rào
      line((0, 3.5), (3, 3.5), (3, 0.5), (0, 0.5), stroke: 1.5pt + blue)

      // Nhãn kích thước
      content((1.5, 3.8), [$x$])
      content((1.5, 0.2), [$x$])
      content((3.8, 2), [$60 - 2x$])
      content((1.5, 2), [*Mảnh vườn*])
    }),
  ),
  loigiai: [
    #ppgiai[
      - *Nhận diện:* Đại lượng cố định là tổng chiều dài hàng rào ($60$ m). Đại lượng cần tối ưu là diện tích $S$.
      - *Rút thế:* Dùng giả thiết chu vi hàng rào để biểu diễn chiều dài theo chiều rộng, đưa hàm diện tích về một biến $x$.
      - *Đạo hàm và cực trị:* Tìm điểm làm đạo hàm bằng $0$ và kết luận dựa trên bảng biến thiên.
    ]

    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Vẽ bức tường
        line((0, 0), (0, 4), stroke: 2pt + rgb("555555"))
        for i in range(1, 9) {
          line((0, i * 0.5 - 0.2), (-0.4, i * 0.5 - 0.6), stroke: 0.5pt + rgb("555555"))
        }
        content((-0.8, 2), [*Bức tường*], angle: 90deg)

        // Vẽ hàng rào
        line((0, 3.5), (3, 3.5), (3, 0.5), (0, 0.5), stroke: 1.5pt + blue)

        // Nhãn kích thước
        content((1.5, 3.8), [$x$])
        content((1.5, 0.2), [$x$])
        content((3.8, 2), [$60 - 2x$])
        content((1.5, 2), [*Mảnh vườn*])
      })
    ]

    #step[*Bước 1: Đặt ẩn và điều kiện.* \
      Gọi $x$ (m) là chiều dài của cạnh hàng rào vuông góc với bức tường ($x > 0$). \
      Vì tổng chiều dài hàng rào là $60$ m gồm $2$ cạnh vuông góc và $1$ cạnh song song với tường, nên chiều dài cạnh song song với tường là $60 - 2x$ (m). \
      Để mảnh vườn tồn tại, các cạnh phải dương:
      $ 60 - 2x > 0 <=> x < 30 $
      Vậy miền xác định là $x in (0 ; 30)$.]

    #step[*Bước 2: Thiết lập hàm mục tiêu.* \
      Diện tích của mảnh vườn hình chữ nhật là hàm số theo $x$:
      $ S(x) = x (60 - 2x) = 60x - 2x^2 $]

    #step[*Bước 3: Đạo hàm và tìm cực trị.* \
      Ta có đạo hàm:
      $ S'(x) = 60 - 4x $
      Cho $S'(x) = 0$:
      $ 60 - 4x = 0 <=> x = 15 "(thỏa mãn)" $
      Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0 ; 30)$:

      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $15$, $30$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $450$, $0$),
          is-min: false,
        )
      ]
    ]
    #step[*Bước 4: Kết luận thực tế.* \
      Dựa vào bảng biến thiên, diện tích lớn nhất đạt được là $S_(max) = 450$ m² tại $x = 15$ m. \
      Khi đó, chiều rộng (vuông góc với tường) là $15$ m, và chiều dài (song song với tường) là $60 - 2 dot.c 15 = 30$ m. \
      Vậy nhà vườn cần bố trí kích thước $15$ m và $30$ m.]
  ],
  theme-color: c-p1,
)
#vd(
  grid(
    columns: (1fr, auto),
    column-gutter: 15pt,
    [Một người chăn nuôi có $100$ m hàng rào để quây một khu đất hình chữ nhật sát một bức tường đá thẳng dài (không cần rào phía tường). Khu đất này được chia thành $4$ ngăn nhỏ riêng biệt có kích thước bằng nhau bởi ba vách ngăn vuông góc với bức tường. Hỏi chiều dài và chiều rộng của toàn bộ khu đất bằng bao nhiêu để tổng diện tích là lớn nhất?],
    canvas(length: 1.3cm, {
      import draw: *
      // Vẽ bức tường (nằm ngang)
      line((0, 2), (5, 2), stroke: 2pt + rgb("555555"))
      for i in range(0, 11) {
        line((i * 0.5, 2), (i * 0.5 + 0.2, 2.4), stroke: 0.5pt + rgb("555555"))
      }
      content((2.5, 2.7), [*Bức tường*])

      // Vẽ hàng rào ngoài và vách ngăn
      line((0, 2), (0, 0), (5, 0), (5, 2), stroke: 1.5pt + blue)
      line((1.25, 0), (1.25, 2), stroke: 1.5pt + blue)
      line((2.5, 0), (2.5, 2), stroke: 1.5pt + blue)
      line((3.75, 0), (3.75, 2), stroke: 1.5pt + blue)

      // Nhãn kích thước
      content((-0.3, 1), [$x$])
      content((2.5, -0.4), [$100 - 5x$])
      content((0.625, 1), [*Ngăn 1*])
      content((1.875, 1), [*Ngăn 2*])
      content((3.125, 1), [*Ngăn 3*])
      content((4.375, 1), [*Ngăn 4*])
    }),
  ),
  loigiai: [
    #ppgiai[
      - *Nhận diện:* Đại lượng cố định là tổng chiều dài hàng rào ($100$ m). Đại lượng cần tối ưu là tổng diện tích $S$.
      - *Rút thế:* Dùng giả thiết tổng chiều dài hàng rào (gồm $1$ cạnh song song tường và $5$ cạnh vuông góc tường) để biểu diễn cạnh song song theo cạnh vuông góc, đưa hàm diện tích về một biến $x$.
      - *Đạo hàm và cực trị:* Tìm điểm làm đạo hàm bằng $0$ và kết luận cực đại dựa trên bảng biến thiên.
    ]

    #align(center)[
      #canvas(length: 1.3cm, {
        import draw: *
        // Vẽ bức tường (nằm ngang)
        line((0, 2), (5, 2), stroke: 2pt + rgb("555555"))
        for i in range(0, 11) {
          line((i * 0.5, 2), (i * 0.5 + 0.2, 2.4), stroke: 0.5pt + rgb("555555"))
        }
        content((2.5, 2.7), [*Bức tường*])

        // Vẽ hàng rào ngoài và vách ngăn
        line((0, 2), (0, 0), (5, 0), (5, 2), stroke: 1.5pt + blue)
        line((1.25, 0), (1.25, 2), stroke: 1.5pt + blue)
        line((2.5, 0), (2.5, 2), stroke: 1.5pt + blue)
        line((3.75, 0), (3.75, 2), stroke: 1.5pt + blue)

        // Nhãn kích thước
        content((-0.3, 1), [$x$])
        content((2.5, -0.4), [$100 - 5x$])
        content((0.625, 1), [*Ngăn 1*])
        content((1.875, 1), [*Ngăn 2*])
        content((3.125, 1), [*Ngăn 3*])
        content((4.375, 1), [*Ngăn 4*])
      })
    ]

    *Bước 1: Đặt ẩn và điều kiện.* \
    Gọi $x$ (m) là chiều rộng của khu đất, tức là chiều dài cạnh hàng rào vuông góc với bức tường ($x > 0$). \
    Tổng chiều dài hàng rào là $100$ m gồm $1$ cạnh chiều dài (song song tường) và $5$ cạnh chiều rộng (vuông góc tường do có $3$ vách ngăn ở giữa). Gọi chiều dài toàn khu đất là $y$ (m), ta có phương trình chu vi:
    $ 5x + y = 100 <=> y = 100 - 5x $
    Để khu đất tồn tại, kích thước phải dương:
    $ 100 - 5x > 0 <=> x < 20 $
    Vậy miền xác định là $x in (0 ; 20)$.

    *Bước 2: Thiết lập hàm mục tiêu.* \
    Tổng diện tích của toàn bộ khu đất là hàm số theo $x$:
    $ S(x) = x (100 - 5x) = 100x - 5x^2 $

    *Bước 3: Đạo hàm và tìm cực trị.* \
    Ta có đạo hàm:
    $ S'(x) = 100 - 10x $
    Cho $S'(x) = 0$:
    $ 100 - 10x = 0 <=> x = 10 "(thỏa mãn)" $
    Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0 ; 20)$:

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $S'$,
        func: $S$,
        x-vals: ($0$, $10$, $20$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $500$, $0$),
        is-min: false,
      )
    ]

    *Bước 4: Kết luận thực tế.* \
    Dựa vào bảng biến thiên, tổng diện tích lớn nhất đạt được là $S_(max) = 500$ m² tại $x = 10$ m. \
    Khi đó, chiều rộng của khu đất là $10$ m, và chiều dài là $y = 100 - 5 dot.c 10 = 50$ m. \
    Vậy người chăn nuôi cần bố trí chiều dài $50$ m và chiều rộng $10$ m để tổng diện tích lớn nhất.
  ],
)

#bt(
  [Một khu đất hình chữ nhật sát một bức tường được chia thành hai ô bằng một hàng rào phụ vuông góc với tường. Người ta có $72$ m hàng rào. Hỏi phải chọn chiều rộng và chiều dài của khu đất như thế nào để tổng diện tích là lớn nhất?],
  loigiai: [
    #ppgiai[
      - Gọi cạnh vuông góc với tường là $x$, cạnh song song với tường là $y$.
      - Dùng điều kiện tổng chiều dài hàng rào để biểu diễn $y$ theo $x$.
      - Khảo sát hàm diện tích bằng đạo hàm và bảng biến thiên.
    ]

    #step[Gọi $x$ (m) là chiều rộng của khu đất, tức là cạnh vuông góc với tường, và $y$ (m) là chiều dài song song với tường. Vì có hai cạnh ngoài và một vách ngăn cùng vuông góc với tường nên ta có:
      $ 3x + y = 72 <=> y = 72 - 3x. $
      Điều kiện hình học là $x > 0$ và $y > 0$, suy ra $0 < x < 24$.]

    #step[Diện tích khu đất là:
      $ S(x) = x y = x(72 - 3x) = 72x - 3x^2. $
      Đây là hàm số cần tối ưu trên khoảng $(0; 24)$.]

    #step[Tính đạo hàm:
      $ S'(x) = 72 - 6x. $
      Cho $S'(x) = 0 <=> x = 12$.]

    #step[Bảng biến thiên của $S(x)$ trên $(0; 24)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $12$, $24$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $432$, $0$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, diện tích lớn nhất khi $x = 12$ m. Khi đó $y = 72 - 3 dot.c 12 = 36$ m và
      $ S_(max) = 12 dot.c 36 = 432 $ m².
      Vậy kích thước tối ưu là chiều rộng $12$ m, chiều dài $36$ m.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#bt(
  [Một sân chơi hình chữ nhật được rào kín bằng $80$ m lưới thép. Bên trong sân có thêm một vách ngăn song song với chiều rộng để chia sân thành hai khu. Hỏi phải chọn kích thước sân như thế nào để diện tích sân lớn nhất?],
  loigiai: [
    #ppgiai[
      - Chọn cạnh xuất hiện ba lần trong tổng chiều dài hàng rào làm biến $x$.
      - Đưa diện tích về hàm một biến rồi khảo sát bằng đạo hàm.
      - Dựa vào BBT để kết luận kích thước tối ưu.
    ]

    #step[Gọi $x$ (m) là chiều rộng của sân, tức là cạnh song song với vách ngăn phụ, và $y$ (m) là chiều dài của sân. Vì hàng rào gồm $3$ đoạn dài $x$ và $2$ đoạn dài $y$, ta có:
      $ 3x + 2y = 80 <=> y = (80 - 3x)/2. $
      Điều kiện: $0 < x < 80/3$.]

    #step[Diện tích sân là:
      $ S(x) = x y = x dot.c (80 - 3x)/2 = 40x - 3x^2/2. $
      Ta cần tìm giá trị lớn nhất của $S(x)$ trên khoảng $(0; 80/3)$.]

    #step[Đạo hàm của $S$ là:
      $ S'(x) = 40 - 3x. $
      Cho $S'(x) = 0 <=> x = 40/3$.]

    #step[Bảng biến thiên:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $40/3$, $80/3$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $800/3$, $0$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, diện tích lớn nhất tại $x = 40/3$ m. Khi đó:
      $ y = (80 - 3 dot.c 40/3)/2 = 20. $
      Vậy sân chơi có diện tích lớn nhất khi chiều rộng bằng $40/3$ m, chiều dài bằng $20$ m.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Cắt Bìa Gấp Hộp Không Nắp], prefix: "Bài", theme-color: c-p1)
#vd(
  id: "2D1H3-6",
  [
    Từ tấm bìa hình vuông cạnh $36$ cm, người ta cắt ở mỗi góc một hình vuông cạnh $x$ (cm) rồi gấp lên thành hộp không nắp. Tìm $x$ để thể tích hộp lớn nhất.

    #v(0.5em)
    #align(center)[
      #grid(
        columns: (auto, auto, auto),
        column-gutter: 1.5cm,
        align: horizon,
        // Hình 1: Bìa 2D trải phẳng
        canvas(length: 1cm, {
          import draw: *

          rect((0, 0), (4, 4), stroke: 1.5pt + blue)

          // Vẽ 4 góc bị cắt (tô màu xám)
          rect((0, 0), (0.8, 0.8), fill: rgb("dddddd"), stroke: 1pt + black)
          rect((3.2, 0), (4, 0.8), fill: rgb("dddddd"), stroke: 1pt + black)
          rect((0, 3.2), (0.8, 4), fill: rgb("dddddd"), stroke: 1pt + black)
          rect((3.2, 3.2), (4, 4), fill: rgb("dddddd"), stroke: 1pt + black)

          // Vẽ các nét đứt gập
          line((0.8, 0.8), (3.2, 0.8), stroke: (dash: "dashed", paint: black))
          line((0.8, 3.2), (3.2, 3.2), stroke: (dash: "dashed", paint: black))
          line((0.8, 0.8), (0.8, 3.2), stroke: (dash: "dashed", paint: black))
          line((3.2, 0.8), (3.2, 3.2), stroke: (dash: "dashed", paint: black))

          // Nhãn kích thước 2D
          content((2, -0.4), [$36$])
          content((0.4, 0.4), [$x$])
          content((3.6, 0.4), [$x$])
          content((2, 2), [*Đáy hộp*])
        }),

        // Mũi tên chỉ quá trình gấp
        [$arrow.r.double.long$],

        // Hình 2: Hộp 3D không nắp
        canvas(length: 1.2cm, {
          import draw: *

          line((0, 0.8), (2.5, 0), (4, 1), (4, 2.5), (1.5, 3.3), (0, 2.3), close: true, stroke: 1.5pt + blue)
          line((0, 2.3), (2.5, 1.5), (4, 2.5), stroke: 1.5pt + blue)
          line((2.5, 0), (2.5, 1.5), stroke: 1.5pt + blue)

          // Các đường khuất
          line((0, 0.8), (1.5, 1.8), (4, 1), stroke: (dash: "dashed", paint: blue, thickness: 1pt))
          line((1.5, 1.8), (1.5, 3.3), stroke: (dash: "dashed", paint: blue, thickness: 1pt))

          // Nhãn kích thước 3D
          content((1.1, 0.1), [$36 - 2 x$])
          content((3.4, 0.2), [$36 - 2 x$])
          content((4.2, 1.8), [$x$])
        }),
      )
    ]
  ],
  loigiai: [
    #ppgiai[
      - *Nhận diện:* Khi cắt $4$ góc và gấp lên, đáy hộp là một hình vuông có cạnh bằng cạnh bìa ban đầu trừ đi $2x$. Chiều cao của hộp chính là $x$.
      - *Hàm mục tiêu:* Thể tích $V = "diện tích đáy" times "chiều cao"$. Thiết lập hàm $V(x)$ theo một biến $x$.
      - *Đạo hàm và cực trị:* Tìm điểm làm đạo hàm bằng $0$ và kết luận GTLN dựa trên bảng biến thiên.
    ]

    #step[Gọi $x$ (cm) là độ dài cạnh hình vuông bị cắt ở các góc ($0 < x < 18$). Khi gấp phần thừa lên, ta được một hình hộp chữ nhật không nắp có đáy là hình vuông cạnh $36 - 2 x$ và chiều cao là $x$.]

    #step[Thể tích của khối hộp là hàm số theo $x$:
      $ V(x) = x (36 - 2 x)^2 $]

    #step[Ta có đạo hàm:
      $
        V'(x) & = (36 - 2 x)^2 + x dot.c 2(36 - 2 x) dot.c (-2) \
              & = (36 - 2 x) [ (36 - 2 x) - 4 x ] = (36 - 2 x)(36 - 6 x)
      $]

    #step[Cho $V'(x) = 0$:
      $ (36 - 2 x)(36 - 6 x) = 0 <=> hoac(x = 18 " (loại)", x = 6 " (thỏa mãn)") $]

    #step[Bảng biến thiên của hàm số $V(x)$ trên khoảng $(0 ; 18)$:]

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $V'$,
        func: $V$,
        x-vals: ($0$, $6$, $18$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $3456$, $0$),
        is-min: false,
      )
    ]

    #step[Từ bảng biến thiên, thể tích hộp đạt giá trị lớn nhất khi $x = 6$ cm. \
      Khi đó, thể tích lớn nhất là $V_(max) = 6 times 24^2 = 3456$ cm³.]
    #resetstep()

  ],
)

#bt(
  [Từ một tấm bìa hình chữ nhật kích thước $32$ cm và $20$ cm, người ta cắt ở bốn góc bốn hình vuông cạnh $x$ cm rồi gấp lên thành một hộp không nắp. Tìm $x$ để thể tích của hộp lớn nhất.],
  loigiai: [
    #ppgiai[
      - Xác định đáy hộp sau khi cắt là hình chữ nhật kích thước $32 - 2x$ và $20 - 2x$.
      - Lập hàm thể tích theo biến $x$.
      - Dùng đạo hàm và BBT để tìm GTLN.
    ]

    #step[Gọi $x$ (cm) là cạnh hình vuông cắt ở mỗi góc. Khi gấp lên, hộp có chiều cao $x$, đáy là hình chữ nhật kích thước $32 - 2x$ và $20 - 2x$. Do đó:
      $ 0 < x < 10. $]

    #step[Thể tích hộp là:
      $ V(x) = x(32 - 2x)(20 - 2x). $
      Khai triển được:
      $ V(x) = 4x^3 - 104x^2 + 640x. $]

    #step[Tính đạo hàm:
      $ V'(x) = 12x^2 - 208x + 640 = 4(x - 4)(3x - 40). $
      Trong khoảng $(0; 10)$ chỉ có nghiệm $x = 4$ thỏa mãn.]

    #step[Bảng biến thiên của $V(x)$:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $4$, $10$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $1152$, $0$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, thể tích lớn nhất của hộp đạt được khi $x = 4$ cm.
      Khi đó:
      $ V_(max) = 4 dot.c 24 dot.c 12 = 1152 $ cm³.]
    #resetstep()
  ],
  theme-color: c-p1,
)

#topic([Thiết Kế Hình Trong Hình], prefix: "Bài", theme-color: c-p1)
// hcn trong parabol
#vd(
  id: "2D1H3-6",
  [
    #grid(
      columns: (auto, auto, auto),
      column-gutter: 1.125cm,
      align: horizon,
      // Hình 1: Hình chữ nhật nội tiếp Parabol
      [ Cho một parabol $(P): y = 9 - x^2$ và trục hoành $O x$. Một hình chữ nhật được nội tiếp trong hình phẳng giới hạn bởi $(P)$ và trục $O x$ sao cho một cạnh của hình chữ nhật nằm trên trục hoành và hai đỉnh còn lại nằm trên parabol (tham khảo hình vẽ). Tìm diện tích lớn nhất của hình chữ nhật đó.],
      canvas(length: 1cm, {
        import draw: *

        // Trục tọa độ
        line((-4, 0), (4, 0), mark: (end: ">"))
        line((0, -1), (0, 10), mark: (end: ">"))
        content((3.8, -0.6), [$x$])
        content((-0.6, 9.8), [$y$])
        content((-0.5, -0.6), [$O$])

        // Vẽ Parabol
        let pts = ()
        for i in range(-30, 31) {
          let x = i * 0.1
          pts.push((x, 9 - x * x))
        }
        line(..pts, stroke: 1.5pt + blue)

        // Vẽ hình chữ nhật
        let xx = 1.5
        let yy = 9 - xx * xx
        rect((-xx, 0), (xx, yy), stroke: 1pt + red, fill: rgb("ff000033"))

        // Nhãn
        circle((xx, 0), radius: 1.5pt, fill: black)
        content((xx, -0.6), [$x$])
        circle((-xx, 0), radius: 1.5pt, fill: black)
        content((-xx, -0.6), [$-x$])
        content((1.2, 8.5), [$(P)$])
      }),
    )
  ],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa:* Gọi tọa độ đỉnh của hình chữ nhật nằm trên trục $O x$ (phần dương) là $(x; 0)$. Khi đó, các kích thước của hình chữ nhật sẽ được biểu diễn theo $x$.
      - *Thiết lập hàm số:* Tính diện tích $S(x)$ của hình chữ nhật.
      - *Tối ưu hóa:* Sử dụng đạo hàm và bảng biến thiên để tìm giá trị lớn nhất của $S(x)$ trên khoảng xác định.
    ]

    #step[Do tính đối xứng của parabol qua trục tung, ta gọi tọa độ hai đỉnh của hình chữ nhật nằm trên $O x$ là $(x; 0)$ và $(-x; 0)$ với $0 < x < 3$. \
      Khi đó, hai đỉnh phía trên nằm trên parabol $(P): y = 9 - x^2$ sẽ có tọa độ là $(x; 9 - x^2)$ và $(-x; 9 - x^2)$.]

    #step[Kích thước của hình chữ nhật gồm:
      - Chiều rộng nằm trên trục hoành: $2 x$.
      - Chiều cao: $9 - x^2$. \
      Hàm số biểu diễn diện tích hình chữ nhật là:
      $ S(x) = 2 x (9 - x^2) = 18 x - 2 x^3 "với" x in (0; 3) $]

    #step[Tính đạo hàm:
      $ S'(x) = 18 - 6 x^2 $
      Cho $S'(x) = 0 <=> 18 - 6 x^2 = 0 <=> x^2 = 3 <=> hoac(x &= sqrt(3) " (nhận)", x &= -sqrt(3) " (loại)")$]

    #step[Bảng biến thiên của hàm số $S(x)$ trên khoảng $(0; 3)$:]

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $S'$,
        func: $S$,
        x-vals: ($0$, $sqrt(3)$, $3$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $12 sqrt(3)$, $0$),
        is-min: false,
      )
    ]

    #step[Từ bảng biến thiên, ta thấy diện tích đạt giá trị lớn nhất khi $x = sqrt(3)$. \
      Diện tích lớn nhất là:
      $ S_(max) = S(sqrt(3)) = 18 sqrt(3) - 2(sqrt(3))^3 = 12 sqrt(3) $]
    #resetstep()

  ],
)

#bt(
  [Một hình chữ nhật nội tiếp trong nửa đường tròn bán kính $5$ cm sao cho đáy của hình chữ nhật nằm trên đường kính của nửa đường tròn. Tìm kích thước hình chữ nhật để diện tích của nó lớn nhất.],
  loigiai: [
    #ppgiai[
      - Gọi nửa chiều rộng của hình chữ nhật là $x$.
      - Từ phương trình đường tròn suy ra chiều cao theo $x$.
      - Lập hàm diện tích rồi dùng đạo hàm và BBT để tối ưu.
    ]

    #step[Gọi hai đỉnh đáy của hình chữ nhật là $(-x; 0)$ và $(x; 0)$ với $0 < x < 5$. Khi đó hai đỉnh trên nằm trên nửa đường tròn $x^2 + y^2 = 25$, nên chiều cao của hình chữ nhật là:
      $ y = sqrt(25 - x^2). $]

    #step[Diện tích hình chữ nhật là:
      $ S(x) = 2x sqrt(25 - x^2), " với " x in (0; 5). $]

    #step[Tính đạo hàm:
      $ S'(x) = 2 sqrt(25 - x^2) - 2x^2 / sqrt(25 - x^2) = 2(25 - 2x^2) / sqrt(25 - x^2). $
      Cho $S'(x) = 0 <=> 25 - 2x^2 = 0 <=> x = 5 / sqrt(2)$.]

    #step[Bảng biến thiên của $S(x)$:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $5 / sqrt(2)$, $5$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $25$, $0$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, diện tích lớn nhất bằng $25$ cm² khi $x = 5 / sqrt(2)$.
      Do đó chiều rộng của hình chữ nhật là $2x = 5 sqrt(2)$ cm, còn chiều cao là:
      $ y = sqrt(25 - 25/2) = 5 / sqrt(2) $ cm.]
    #resetstep()
  ],
  theme-color: c-p1,
)



#topic([Thiết Kế Cửa Sổ Vòm & Kiến Trúc], prefix: "Bài", theme-color: c-p1)

#vd(
  id: "2D1H3-7",
  [
    Một kiến trúc sư cần thiết kế một cửa sổ kiểu Norman (cửa sổ có dạng một hình chữ nhật phía dưới và một nửa hình tròn phía trên). Biết rằng chu vi của toàn bộ cửa sổ (bỏ qua phần viền gạch nối giữa cung tròn và hình chữ nhật) là $8$ mét. Tìm chiều rộng của cửa sổ để phần diện tích đón ánh sáng là lớn nhất.
  ],
  loigiai: [
    #ppgiai[
      - *Mô hình hóa:* Gọi bán kính của nửa hình tròn là $x$. Khi đó chiều rộng hình chữ nhật là $2x$. Gọi chiều cao hình chữ nhật là $y$.
      - *Thiết lập hàm số:* Từ chu vi $P=8$, biểu diễn $y$ theo $x$. Lập hàm diện tích $S(x)$.
      - *Tối ưu hóa:* Đạo hàm và tìm GTLN của $S(x)$.
    ]

    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Draw Norman window
        line((0, 2), (0, 0), (3, 0), (3, 2), stroke: 1.5pt + blue)
        arc((3, 2), start: 0deg, stop: 180deg, radius: 1.5, stroke: 1.5pt + blue)
        line((0, 2), (3, 2), stroke: (dash: "dashed", paint: rgb("888888")))

        // Labels
        content((1.5, -0.3), [$2x$])
        content((-0.3, 1), [$y$])
        content((3.3, 1), [$y$])

        // Radius
        circle((1.5, 2), radius: 1.5pt, fill: black)
        line((1.5, 2), (1.5 + 1.5 * 0.707, 2 + 1.5 * 0.707), mark: (end: ">"), stroke: 0.8pt)
        content((2.3, 2.3), [$x$])

        // Dimension markers
        line((0, -0.6), (3, -0.6), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((1.5, -0.9), [*Chiều rộng*])
      })
    ]

    #step[Gọi $x$ (m) là bán kính của nửa hình tròn phía trên ($x > 0$). \
      Khi đó, chiều rộng của phần hình chữ nhật là $2x$. \
      Gọi $y$ (m) là chiều cao của phần hình chữ nhật ($y > 0$).]

    #step[Chu vi của cửa sổ gồm $1$ cạnh đáy ($2x$), $2$ cạnh bên ($2y$) và độ dài nửa đường tròn ($pi x$).
      Theo giả thiết, ta có:
      $ 2x + 2y + pi x = 8 <=> 2y = 8 - (2 + pi)x <=> y = 4 - (2 + pi)/2 x $
      Điều kiện $y > 0 <=> 4 - (2 + pi)/2 x > 0 <=> x < 8/(2 + pi)$.]

    #step[Diện tích cửa sổ là tổng diện tích hình chữ nhật và nửa hình tròn:
      $
        S(x) & = 2x dot.c y + 1/2 pi x^2 \
             & = 2x (4 - (2 + pi)/2 x) + 1/2 pi x^2 \
             & = 8x - (2 + pi)x^2 + 1/2 pi x^2 \
             & = 8x - (2 + pi / 2)x^2
      $]

    #step[Ta có đạo hàm:
      $ S'(x) = 8 - 2(2 + pi / 2)x = 8 - (4 + pi)x $
      Cho $S'(x) = 0 <=> x = 8 / (4 + pi)$ (thỏa mãn điều kiện).]

    #step[Bảng biến thiên:]

    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $S'$,
        func: $S$,
        x-vals: ($0$, $8 / (4 + pi)$, $8 / (2 + pi)$),
        d-signs: ($+$, $0$, $-$),
        v-vals: ($0$, $16 / (4 + pi)$, $0$),
        is-min: false,
      )
    ]

    #step[Dựa vào bảng biến thiên, diện tích lớn nhất đạt được khi $x = 8/(4+pi)$. \
      Chiều rộng của cửa sổ khi đó là $2x = 16/(4+pi) approx 2.24$ (m).]
    #resetstep()
  ],
)

#bt(
  [Một cửa sổ kiểu Norman có chu vi ngoài bằng $4 + pi$ mét. Hỏi phải chọn bán kính phần nửa đường tròn phía trên bằng bao nhiêu để diện tích cửa sổ lớn nhất? Từ đó suy ra chiều rộng và chiều cao phần hình chữ nhật.],
  loigiai: [
    #ppgiai[
      - Gọi bán kính nửa đường tròn là $x$, chiều cao phần chữ nhật là $y$.
      - Từ chu vi cố định, biểu diễn $y$ theo $x$.
      - Lập hàm diện tích và khảo sát bằng đạo hàm, BBT.
    ]

    #step[Gọi $x$ (m) là bán kính của nửa đường tròn, $y$ (m) là chiều cao phần hình chữ nhật. Khi đó chiều rộng cửa sổ là $2x$.
      Chu vi ngoài của cửa sổ là:
      $ 2y + 2x + pi x = 4 + pi. $
      Suy ra:
      $ y = (4 + pi - (2 + pi)x)/2. $
      Điều kiện $y > 0$ cho ta $0 < x < (4 + pi)/(2 + pi)$.]

    #step[Diện tích cửa sổ là tổng diện tích hình chữ nhật và nửa hình tròn:
      $
        S(x) & = 2x y + 1/2 pi x^2 \
             & = x(4 + pi - (2 + pi)x) + 1/2 pi x^2 \
             & = (4 + pi)x - (2 + pi/2)x^2.
      $]

    #step[Tính đạo hàm:
      $ S'(x) = (4 + pi) - (4 + pi)x = (4 + pi)(1 - x). $
      Cho $S'(x) = 0 <=> x = 1$.]

    #step[Bảng biến thiên của $S(x)$:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $1$, $(4 + pi)/(2 + pi)$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $2 + pi/2$, $pi (4 + pi)^2 / (2(2 + pi)^2)$),
          is-min: false,
        )
      ]]

    #step[Từ bảng biến thiên, diện tích cửa sổ lớn nhất khi $x = 1$ m.
      Khi đó chiều rộng cửa sổ là $2x = 2$ m, còn chiều cao phần hình chữ nhật là:
      $ y = (4 + pi - (2 + pi) dot.c 1)/2 = 1 $ m.]
    #resetstep()
  ],
  theme-color: c-p1,
)


#topic([Bài Toán Tối Ưu Vật Liệu (In Ấn & Poster)], prefix: "Bài", theme-color: c-p1)

#vd(
  id: "2D1H3-8",
  [
    Người ta muốn thiết kế một tấm poster hình chữ nhật có diện tích phần in chữ (phần lõi) là $384$ cm². Lề trên và lề dưới của poster là $3$ cm; lề trái và lề phải là $2$ cm. Tìm các kích thước của tấm poster sao cho nó sử dụng ít giấy nhất (nghĩa là diện tích toàn bộ tấm poster là nhỏ nhất).
  ],
  loigiai: [
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Tấm giấy nền
        rect((0, 0), (6, 8), fill: rgb("f0f0f0"), stroke: 1pt + black)
        // Phần in nội dung
        rect((1, 1.5), (5, 6.5), fill: white, stroke: (dash: "dashed"))
        content((3, 4), [*Phần in chữ* \ $384 "cm"^2$])

        // Ký hiệu lề
        // content((3, 7.25), [$3$])
        // content((3, 0.75), [$3$])
        // content((0.5, 4), [$2$, angle: 90deg])
        // content((5.5, 4), [$2$, angle: 90deg])

        // Mũi tên kích thước lõi
        line((1, 1.2), (5, 1.2), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((3, 0.9), [$x$])

        line((5.3, 1.5), (5.3, 6.5), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((5.6, 4), [$y$])
      })
    ]

    #step[Gọi $x, y$ (cm) lần lượt là chiều rộng và chiều cao của *phần in chữ* ($x, y > 0$). \
      Theo giả thiết, diện tích phần in chữ là $x dot.c y = 384 <=> y = 384/x$.]

    #step[Do lề trên/dưới là $3$ cm và lề trái/phải là $2$ cm, kích thước của *toàn bộ tấm poster* sẽ là:
      - Chiều rộng: $x + 2 + 2 = x + 4$ (cm).
      - Chiều cao: $y + 3 + 3 = y + 6$ (cm).
    ]

    #step[Diện tích toàn bộ tấm poster là:
      $
        S(x) & = (x + 4)(y + 6) = (x + 4)(384/x + 6) \
             & = 384 + 6x + 1536/x + 24 = 6x + 1536/x + 408
      $]

    #step[Đạo hàm:
      $ S'(x) = 6 - 1536/x^2 $
      Cho $S'(x) = 0 <=> 6x^2 = 1536 <=> x^2 = 256 <=> x = 16 " (do " x > 0 ")".$]

    #step[Bảng biến thiên trên $(0; +oo)$:]
    #align(center)[
      #bbt-opt(
        var: $x$,
        der: $S'$,
        func: $S$,
        x-vals: ($0$, $16$, $+oo$),
        d-signs: ($-$, $0$, $+$),
        v-vals: ($+oo$, $600$, $+oo$),
        is-min: true,
      )
    ]

    #step[Vậy diện tích nhỏ nhất đạt được khi $x = 16$. \
      Khi đó, kích thước tổng thể của poster là $x + 4 = 20$ (cm) và $y + 6 = 384/16 + 6 = 30$ (cm). \
      *Kết luận:* Kích thước tối ưu của poster là $20 times 30$ cm.]
    #resetstep()
  ],
)

#bt(
  [Một tấm bìa quảng cáo có phần in chữ hình chữ nhật diện tích $256$ cm². Lề trái và lề phải đều rộng $1$ cm, lề trên và lề dưới đều rộng $4$ cm. Tìm kích thước của cả tấm bìa sao cho diện tích toàn bộ tấm bìa nhỏ nhất.],
  loigiai: [
    #ppgiai[
      - Gọi kích thước phần in chữ là $x$ và $y$.
      - Dùng điều kiện diện tích phần in chữ để biểu diễn $y$ theo $x$.
      - Lập hàm diện tích toàn tấm bìa và khảo sát bằng BBT.
    ]

    #step[Gọi $x, y$ (cm) lần lượt là chiều rộng và chiều cao của phần in chữ. Theo giả thiết:
      $ x y = 256 <=> y = 256/x, " với " x > 0. $]

    #step[Chiều rộng cả tấm bìa là $x + 2$, chiều cao cả tấm bìa là $y + 8$. Vì thế diện tích toàn bộ tấm bìa là:
      $
        S(x) & = (x + 2)(y + 8) = (x + 2)(256/x + 8) \
             & = 8x + 512/x + 272.
      $]

    #step[Tính đạo hàm:
      $ S'(x) = 8 - 512/x^2. $
      Cho $S'(x) = 0 <=> x^2 = 64 <=> x = 8$.]

    #step[Bảng biến thiên của $S(x)$ trên $(0; +oo)$:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $8$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $400$, $+oo$),
          is-min: true,
        )
      ]]

    #step[Vậy diện tích nhỏ nhất của cả tấm bìa là $400$ cm² khi $x = 8$ cm.
      Khi đó $y = 256/8 = 32$ cm, nên kích thước tối ưu của tấm bìa là $10$ cm và $40$ cm.]
    #resetstep()
  ],
  theme-color: c-p1,
)


#topic([Bài Toán Chia Cắt Dây (Lựa Chọn Hình Khối)], prefix: "Bài", theme-color: c-p1)

#vd(
  id: "2D1H3-9",
  [
    Một sợi dây dài $10$ mét được cắt làm hai đoạn. Đoạn thứ nhất được uốn thành một hình vuông, đoạn thứ hai được uốn thành một hình tròn. Hỏi phải cắt sợi dây ở vị trí nào (tức là đoạn thứ nhất dài bao nhiêu) để *tổng diện tích* của hình vuông và hình tròn thu được là *nhỏ nhất*?
  ],
  loigiai: [
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Sợi dây
        line((0, 2), (8, 2), stroke: 2pt + rgb("aaaaaa"))
        line((3, 1.8), (3, 2.2), stroke: 2pt + red)
        content((1.5, 2.4), [$x$])
        content((5.5, 2.4), [$10 - x$])

        // Mũi tên
        line((1.5, 1.7), (1.5, 0.5), mark: (end: ">"))
        line((5.5, 1.7), (5.5, 0.5), mark: (end: ">"))

        // Vẽ Hình vuông
        rect((0.5, -1), (2.5, 1), stroke: 1.5pt + blue)
        content((1.5, -1.3), [Hình vuông])

        // Vẽ Hình tròn
        circle((5.5, 0), radius: 1, stroke: 1.5pt + blue)
        content((5.5, -1.3), [Hình tròn])
      })
    ]

    #ppgiai[
      - Gọi đoạn dây làm hình vuông là $x$, khi đó đoạn còn lại làm hình tròn là $10 - x$.
      - Biểu diễn diện tích hai hình theo $x$ rồi cộng lại thành hàm mục tiêu.
      - Tìm điểm tới hạn và dùng BBT để kết luận GTNN.
    ]

    #step[Gọi $x$ (m) là chiều dài của đoạn dây thứ nhất dùng để uốn thành hình vuông ($0 < x < 10$). \
      Khi đó, chiều dài đoạn dây thứ hai uốn thành hình tròn là $10 - x$ (m).]

    #step[
      *Diện tích hình vuông:* Chu vi hình vuông là $x$, suy ra cạnh hình vuông là $x/4$. \
      $=> S_("vuông") = (x/4)^2 = x^2/16.$ \
      *Diện tích hình tròn:* Chu vi hình tròn là $10 - x$, suy ra bán kính $R = (10 - x)/(2pi)$. \
      $=> S_("tròn") = pi ((10 - x)/(2pi))^2 = (10 - x)^2 / (4pi).$
    ]

    #step[Tổng diện tích hai hình là:
      $ S(x) = x^2/16 + (10 - x)^2 / (4pi) $
      Đạo hàm:
      $ S'(x) = x/8 - 2(10 - x)/(4pi) = x/8 - (10 - x)/(2pi) $]

    #step[Cho $S'(x) = 0$:
      $ => pi x - 4(10 - x) = 0 <=> (pi + 4)x = 40 <=> x = 40/(pi + 4) approx 5.60 "(m)" $]

    #step[Bảng biến thiên của hàm số $S(x)$ trên $(0; 10)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $40/(pi + 4)$, $10$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($25/pi$, $25/(pi + 4)$, $25/4$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, tổng diện tích nhỏ nhất tại $x = 40/(pi + 4) approx 5.60$ m.
      Vậy cần cắt đoạn dây dùng làm hình vuông dài khoảng $5.60$ m.]
    #resetstep()
  ],
)

#bt(
  [Một sợi dây dài $20$ m được cắt thành hai đoạn. Một đoạn uốn thành hình vuông, đoạn còn lại uốn thành hình tròn. Hỏi phải cắt như thế nào để tổng diện tích hai hình thu được là lớn nhất?],
  loigiai: [
    #ppgiai[
      - Gọi đoạn dây làm hình vuông là $x$.
      - Thiết lập hàm tổng diện tích trên đoạn đóng $[0; 20]$.
      - Khảo sát BBT rồi so sánh giá trị tại các biên để kết luận GTLN.
    ]

    #step[Gọi $x$ (m) là chiều dài đoạn dây dùng làm hình vuông. Khi đó đoạn còn lại dài $20 - x$ (m) dùng làm hình tròn. Điều kiện: $0 <= x <= 20$.]

    #step[Diện tích hình vuông là $x^2/16$, diện tích hình tròn là $(20 - x)^2/(4pi)$. Do đó:
      $ S(x) = x^2/16 + (20 - x)^2/(4pi). $]

    #step[Tính đạo hàm:
      $ S'(x) = x/8 - (20 - x)/(2pi). $
      Cho $S'(x) = 0 <=> pi x = 4(20 - x) <=> x = 80/(pi + 4).$]

    #step[Bảng biến thiên của $S(x)$ trên $[0; 20]$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $80/(pi + 4)$, $20$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($100/pi$, $100/(pi + 4)$, $25$),
          is-min: true,
        )
      ]]

    #step[Từ bảng biến thiên, $S(x)$ đạt giá trị nhỏ nhất ở điểm trong là $x = 80/(pi + 4)$. Vì bài toán hỏi GTLN trên đoạn $[0; 20]$, ta so sánh hai đầu mút:
      $ S(0) = 100/pi, quad S(20) = 25. $
      Do $100/pi > 25$, tổng diện tích lớn nhất khi $x = 0$.]

    #step[Vậy không nên dùng đoạn nào để uốn thành hình vuông; toàn bộ sợi dây $20$ m nên được uốn thành hình tròn thì tổng diện tích thu được là lớn nhất.]
    #resetstep()
  ],
  theme-color: c-p1,
)


// ════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()



#tn(
  [
    Một tấm bìa hình vuông cạnh $12$ cm. Cắt bốn góc vuông mỗi góc cạnh $x$ cm rồi gấp thành hộp không nắp. Thể tích hộp lớn nhất đạt được khi $x$ bằng
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Tấm bìa gốc
        rect((0, 0), (4, 4), stroke: 1.5pt + rgb("333"))
        // 4 góc bị cắt
        rect((0, 0), (1, 1), fill: rgb("e5e7eb"), stroke: 1pt + gray)
        rect((3, 0), (4, 1), fill: rgb("e5e7eb"), stroke: 1pt + gray)
        rect((0, 3), (1, 4), fill: rgb("e5e7eb"), stroke: 1pt + gray)
        rect((3, 3), (4, 4), fill: rgb("e5e7eb"), stroke: 1pt + gray)
        // Đường gấp
        line((1, 1), (3, 1), stroke: (dash: "dashed", paint: rgb("888")))
        line((1, 3), (3, 3), stroke: (dash: "dashed", paint: rgb("888")))
        line((1, 1), (1, 3), stroke: (dash: "dashed", paint: rgb("888")))
        line((3, 1), (3, 3), stroke: (dash: "dashed", paint: rgb("888")))
        // Mũi tên và chữ
        content((2, -0.6), [$12$])
        line((0, -0.3), (4, -0.3), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((0.5, 0.5), text(size: 8pt)[$x$])
        content((3.5, 0.5), text(size: 8pt)[$x$])
      })
    ]
  ],
  ([1 cm], True([2 cm]), [3 cm], [4 cm]),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Hình hộp chữ nhật 3D (Minh hoạ lời giải)
        let w = 2.5
        let h = 1.2
        let dx = 0.8
        let dy = 0.5
        line((0, h), (w, h), (w + dx, h + dy), (dx, h + dy), close: true, fill: rgb("e0f2fe"), stroke: 1.5pt + blue)
        line((0, h), (0, 0), (w, 0), (w, h), fill: rgb("bae6fd"), stroke: 1.5pt + blue)
        line((w, 0), (w + dx, dy), (w + dx, h + dy), stroke: 1.5pt + blue)
        // Đường đứt nét bên trong
        line((0, 0), (dx, dy), (w + dx, dy), stroke: (dash: "dashed", paint: blue))
        line((dx, dy), (dx, h + dy), stroke: (dash: "dashed", paint: blue))

        content((w / 2, -0.4), text(fill: blue, size: 9pt)[$12 - 2x$])
        content((w + dx / 2 + 0.3, dy / 2 - 0.2), text(fill: blue, size: 9pt)[$12 - 2x$])
        content((-0.4, h / 2), text(fill: blue, size: 9pt)[$x$])
      })
    ]
    #step[Gọi $x>0$ là độ dài cạnh cắt ở $4$ góc $(0 < x < 6)$. Sau khi gấp lên, đáy hộp là hình vuông cạnh $12 - 2x$, chiều cao hộp là $x$.]
    #step[Thể tích hộp: $V(x) = x(12 - 2x)^2$.]
    #step[Đạo hàm $V'(x) = (12 - 2x)^2 + 2(12 - 2x)(-2)x = (12 - 2x)(12 - 6x)$.
      Cho $V'(x) = 0 <=> hoac(x = 6 " (loại)", x = 2 " (nhận)").$]
    #step[Bảng biến thiên:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $2$, $6$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $128$, $0$),
          is-min: false,
        )
      ]
      Vậy thể tích lớn nhất khi $x = 2$ cm.
    ]
    #resetstep()
  ],
)

#tn(
  [
    Người ta muốn làm một chiếc máng nước đúc từ tấm tôn phẳng có bề rộng $30$ cm. Bằng cách gập hai mép có cùng chiều rộng $x$ lên một góc $90^o$ để tạo mặt cắt ngang là một hình chữ nhật hở nắp. Tìm $x$ để sức chứa của máng nước là lớn nhất (diện tích mặt cắt ngang lớn nhất).
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Trải phẳng
        line((-1, 3), (6, 3), stroke: 1.5pt)
        line((1, 2.8), (1, 3.2), stroke: 1pt + red)
        line((4, 2.8), (4, 3.2), stroke: 1pt + red)
        content((0, 3.5), text(size: 8pt)[$x$])
        content((2.5, 3.5), text(size: 8pt)[$30-2x$])
        content((5, 3.5), text(size: 8pt)[$x$])

        // Mũi tên uốn
        line((2.5, 2.3), (2.5, 1.5), mark: (end: ">"))

        // Mặt cắt chữ U
        line((1.5, 1), (1.5, -0.5), (3.5, -0.5), (3.5, 1), stroke: 2pt + blue)
        content((2.5, -0.9), text(size: 8pt)[$30-2x$])
        content((0.9, 0.25), text(size: 8pt)[$x$])
        content((4.1, 0.25), text(size: 8pt)[$x$])
        // Nước minh họa
        rect((1.5, -0.5), (3.5, 0.5), fill: rgb("00aaff33"), stroke: none)
        line((1.5, 0.5), (3.5, 0.5), stroke: (dash: "dashed", paint: rgb("00aaff")))
      })
    ]
  ],
  ([$x = 5$ cm], True([$x = 7.5$ cm]), [$x = 10$ cm], [$x = 12.5$ cm]),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Kích thước mặt cắt ngang của máng: Chiều rộng là $30 - 2x$, chiều cao là $x$. Điều kiện: $0 < x < 15$.]
    #step[Diện tích mặt cắt ngang là hàm số mục tiêu:
      $ S(x) = x(30 - 2x) = 30x - 2x^2 $]
    #step[Đạo hàm $S'(x) = 30 - 4x$.
      Cho $S'(x) = 0 <=> x = 30/4 = 7.5$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 15)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $7.5$, $15$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $112.5$, $0$),
          is-min: false,
        )
      ]]
    #step[Từ bảng biến thiên, diện tích mặt cắt ngang lớn nhất khi $x = 7.5$ cm.]
    #resetstep()
  ],
)

#tn(
  [
    Một người muốn làm một bể cá bằng kính hở nắp (không có nắp đậy). Đáy bể là hình chữ nhật có chiều dài gấp đôi chiều rộng. Bể cá có thể tích không đổi là $576$ dm³ (tương đương $576$ lít). Giá thành kính làm đáy là $100.000$ đồng/dm², và giá kính làm vách xung quanh là $50.000$ đồng/dm². Chi phí mua kính thấp nhất tiệm cận với số nào sau đây?
    #align(center)[
      #canvas({
        import draw: *
        // Vẽ 3D Isometric cho bể cá kính
        // Chiều rộng r, chiều dài d=2r, chiều cao h
        let r = 1.2
        let d = 2.4
        let h = 1.5
        let alpha = 30deg // Góc xiên

        // Hàm tính tọa độ 3D thành 2D
        let p3(x, y, z) = (x - y * calc.cos(alpha), z - y * calc.sin(alpha))

        // Tọa độ các đỉnh đáy
        let A = p3(0, d, 0)
        let B = p3(r, d, 0)
        let C = p3(r, 0, 0)
        let D = p3(0, 0, 0)

        // Tọa độ các đỉnh trên
        let A1 = p3(0, d, h)
        let B1 = p3(r, d, h)
        let C1 = p3(r, 0, h)
        let D1 = p3(0, 0, h)

        // Vách chìm (nhìn xuyên qua kính - đứt nét nhẹ hoặc vẽ mảnh)
        line(A, A1, stroke: (dash: "dashed", paint: luma(180)))
        line(A, B, stroke: (dash: "dashed", paint: luma(180)))
        line(A, D, stroke: (dash: "dashed", paint: luma(180)))

        // Tô màu đáy
        fill(rgb("a5f3fc55"))
        line(A, B, C, D, close: true, stroke: 0.5pt + blue)

        // Tô màu và vẽ 3 vách xung quanh (vách trong/vách ngoài xen kẽ)
        // Vách D-C-C1-D1 (trước)
        fill(rgb("bfdbfe44"))
        line(D, C, C1, D1, close: true, stroke: 1pt + blue)
        // Vách C-B-B1-C1 (phải)
        fill(rgb("93c5fd44"))
        line(C, B, B1, C1, close: true, stroke: 1pt + blue)
        // Vách đáy không nắp -> miêu tả khung viền trên
        line(D1, C1, stroke: 1.5pt + blue)
        line(C1, B1, stroke: 1.5pt + blue)
        line(B1, A1, stroke: 1pt + blue)
        line(A1, D1, stroke: 1pt + blue)

        // Các viền nổi
        line(D, D1, stroke: 1pt + blue)
        line(C, C1, stroke: 1pt + blue)
        line(B, B1, stroke: 1pt + blue)
        line(D, C, stroke: 1pt + blue)
        line(C, B, stroke: 1pt + blue)

        // Ghim text
        // Cạnh D-C (chiều rộng)
        content(p3(r / 2, 0, -0.2), text(size: 9pt)[$x$])
        // Cạnh C-B (chiều dài)
        content(p3(r + 0.2, d / 2, -0.2), text(size: 9pt)[$2x$])
        // Cạnh C-C1 (chiều cao)
        content(p3(r + 0.1, 0, h / 2), text(size: 9pt)[$h$])
      })
    ]
  ],
  ([$1.520.000$ đồng], [$1.800.000$ đồng], True([$2.160.000$ đồng]), [$2.450.000$ đồng]),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Gọi kích thước của bể cá là: chiều rộng $x$ (dm), chiều dài $2x$ (dm) và chiều cao $h$ (dm) với $x>0, h>0$.]
    #step[Thể tích của bể cá là $V = x dot.c 2x dot.c h = 2x^2 h$.]
    #step[Theo giả thiết, $V = 576 => 2x^2 h = 576 => h = 288/x^2$.]
    #step[Chi phí làm bể kính gồm hai phần: phần đáy và phần vách xung quanh (không nắp đậy).

      - Diện tích đáy: $S_("đáy") = x dot.c 2x = 2x^2$ (dm²).
      - Diện tích vách xung quanh: $S_("vách") = 2(x h + 2x h) = 6x h$ (dm²).
    ]
    #step[Hàm chi phí vật liệu $C(x)$ (đơn vị: đồng) là:
      $
        C(x) & = 100.000 dot.c S_("đáy") + 50.000 dot.c S_("vách") \
             & = 100.000 dot.c (2x^2) + 50.000 dot.c (6x h) \
             & = 200.000 x^2 + 300.000 x dot.c 288/x^2 \
             & = 200.000 x^2 + 86.400.000/x
      $
    ]
    #step[Tính đạo hàm để tìm giá trị nhỏ nhất:
      $
            C'(x) & = 400.000 x - 86.400.000/x^2 \
        C'(x) = 0 & <=> 400.000 x^3 = 86.400.000 <=> x^3 = 216 => x = 6.
      $

      Lập bảng biến thiên:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $C'(x)$,
          func: $C(x)$,
          x-vals: ($0$, $6$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $2.160.000$, $+oo$),
          is-min: true,
        )
      ]
      Từ bảng biến thiên, hàm số đạt giá trị nhỏ nhất kéo theo chi phí mua kính thấp nhất tại $x=6$.]
    #step[Khi $x = 6$, chi phí thấp nhất là: $ C(6) = 2.160.000 " (đồng)". $
    ]
    #resetstep()

  ],
)

#tn(
  [
    Cho một parabol $(P): y = 4 - x^2$. Nửa bức tranh là một hình chữ nhật nội tiếp trong parabol sao cho cạnh đáy nằm trên trục hoành. Tìm diện tích lớn nhất của bức tranh đó.
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Trục tọa độ
        line((-3, 0), (3, 0), mark: (end: ">"))
        line((0, -0.5), (0, 5), mark: (end: ">"))
        content((2.8, -0.6), [$x$])
        content((-0.6, 4.8), [$y$])

        // Parabol
        let pts = ()
        for i in range(-25, 26) {
          pts.push((i * 0.1, 4 - (i * 0.1) * (i * 0.1)))
        }
        line(..pts, stroke: 1.5pt + red)

        // HCN
        let x = 1.1547
        let y = 4 - x * x
        rect((-x, 0), (x, y), fill: rgb("00ff0033"), stroke: 1pt + black)
        content((0, y / 2), text(weight: "bold")[$S$])
        content((x, -0.5), [$x$])
        content((-x, -0.5), [$-x$])
      })
    ]
  ],
  ([$16/9$], True([$32/(3sqrt(3))$]), [$12/sqrt(3)$], [$10$]),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Gọi tọa độ góc chữ nhật nằm ở nửa trục ngang dương là $(x; 0)$ với $0 < x < 2$. \
      Khi đó đỉnh nằm trên Parabol có tọa độ $(x; 4-x^2)$.]
    #step[Chiều rộng tấm tranh là $2x$, chiều cao là $4-x^2$. \
      Diện tích $S(x) = 2x(4-x^2) = 8x - 2x^3$.]
    #step[Đạo hàm $S'(x) = 8 - 6x^2$. Cho $S'(x) = 0 <=> x^2 = 4/3 <=> x = 2/sqrt(3)$. \
    ]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 2)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $2/sqrt(3)$, $2$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $32/(3sqrt(3))$, $0$),
          is-min: false,
        )
      ]]
    #step[Diện tích max: $S_(max) = S(2/sqrt(3)) = 2(2/sqrt(3))(4 - 4/3) = 4/sqrt(3) dot.c 8/3 = 32/(3sqrt(3))$.]
    #resetstep()

  ],
)


#resetexamstate()

#ds(
  [
    Một lon nước ngọt hình trụ tròn xoay có thể tích cố định là $V = 32 pi$ (cm³). Hãng sản xuất muốn tìm kích thước bán kính đáy $r$ và chiều cao $h$ của lon sao cho tốn ít vật liệu nhất (nghĩa là diện tích toàn phần của hộp nhỏ nhất).
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        // Vẽ hình trụ
        circle((0, 4), radius: (2, 0.6), stroke: 1pt + black, fill: rgb("ccc"))
        arc((-2, 0), start: 180deg, stop: 360deg, radius: (2, 0.6), stroke: 1pt + black)
        arc((2, 0), start: 0deg, stop: 180deg, radius: (2, 0.6), stroke: (dash: "dashed", paint: black))
        line((-2, 4), (-2, 0), stroke: 1pt + black)
        line((2, 4), (2, 0), stroke: 1pt + black)

        // R và H
        circle((0, 4), radius: 1pt, fill: black)
        line((0, 4), (2, 4), stroke: 1pt + black)
        content((1, 4.4), [$r$])
        line((2.5, 0), (2.5, 4), mark: (start: ">", end: ">"), stroke: 0.5pt)
        content((3, 2), [$h$])
      })
    ]
  ],
  (
    True([Chiều cao $h$ được biểu diễn qua $r$ bằng công thức $h = 32 / r^2$.]), // đúng là h = 32/r^2. Câu này là TRUE.
    True([Diện tích toàn phần của lon nước ngọt là $S(r) = 2pi r^2 + 64pi / r$.]),
    True([Hãng cần thiết kế lon có chiều cao gấp đôi bán kính đáy ($h=2r$) để tối ưu.]),
    [Bán kính đáy tạo ra sự tối ưu là $r = 4$ cm.], // r= root(3, 16) ko phai 4.
  ),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Phát biểu 1 là *Đúng*. $V = pi r^2 h = 32 pi => h = 32 / r^2$.]
    #step[Phát biểu 2 là *Đúng*. Diện tích toàn phần (2 đáy + xung quanh):
      $S(r) = 2pi r^2 + 2pi r h = 2pi r^2 + 2pi r(32/r^2) = 2pi r^2 + 64pi / r$.]
    #step[Phát biểu 3 là *Đúng*. Tính đạo hàm $S'(r) = 4pi r - 64pi / r^2$.
      Cho $S'(r) = 0 <=> 4pi r^3 = 64pi <=> r^3 = 16 <=> r = root(3, 16) approx 2.52$.]
    #step[Bảng biến thiên của $S(r)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $r$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $root(3, 16)$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $6 pi root(3, 256)$, $+oo$),
          is-min: true,
        )
      ]]
    #step[Từ bảng biến thiên, diện tích toàn phần nhỏ nhất khi $r = root(3, 16)$. Khi đó:
      $ h = 32 / r^2 = 32 / root(3, 256) = 2 root(3, 16) = 2r. $
      Vì vậy phát biểu 3 là *Đúng*.]
    #step[Phát biểu 4 là *Sai* vì bán kính tối ưu là $r = root(3, 16) approx 2.52$ cm, không phải $4$ cm.]
    #resetstep()

  ],
)

#ds(
  [
    Cho một miếng tôn hình chữ nhật có kích thước $50$ cm và $80$ cm. Người ta cắt 4 góc của tấm tôn 4 hình vuông bằng nhau cạnh $x$ để gấp thành một hộp không nắp.
  ],
  (
    [Sau khi gấp, đáy hộp là hình chữ nhật có chu vi là $260 - 4x$.],
    True([Thể tích của hộp được tính bởi $V(x) = 4x^3 - 260x^2 + 4000x$.]),
    True([Phương trình $V'(x) = 0$ có một nghiệm nguyên là $x = 10$.]),
    [Giá trị lớn nhất của $V(x)$ là $15000$ cm³.],
  ),
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Đáy hộp là hình chữ nhật có cạnh $80 - 2x$ và $50 - 2x$.
      Chu vi đáy là $2((80 - 2x) + (50 - 2x)) = 260 - 8x$ => Ý $1$ Sai.]
    #step[Thể tích hộp: $V(x) = x(80-2x)(50-2x) = x(4000 - 260x + 4x^2) = 4x^3 - 260x^2 + 4000x$ với $0 < x < 25$ => Ý $2$ Đúng.]
    #step[Đạo hàm $V'(x) = 12x^2 - 520x + 4000 = 4(3x^2 - 130x + 1000)$.
      Cho $V'(x) = 0 <=> hoac(x = 10 " (nhận)", x = 100/3 " (loại)")$. Vậy có 1 nghiệm nguyên là $x=10$ => Ý $3$ Đúng.]
    #step[Bảng biến thiên của $V(x)$ trên $(0; 25)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $10$, $25$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $18000$, $0$),
          is-min: false,
        )
      ]]
    #step[Từ bảng biến thiên, $V_(max) = V(10) = 18000$ cm³, nên ý $4$ là *Sai*.]
    #resetstep()

  ],
)



#resetexamstate()

#tln(
  [
    Một sợi dây có chiều dài $28$ m được chia làm $2$ phần. Phần thứ nhất uốn thành một hình vuông, phần thứ hai uốn thành một hình tròn. Hỏi chiều dài (m) đoạn uốn thành vuông bằng bao nhiêu (làm tròn đến hàng phần mười) để tổng diện tích hai hình thu được là nhỏ nhất? (Lấy $pi approx 3.14$).
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        rect((0, 0), (1.5, 1.5), stroke: 1.5pt + blue, fill: rgb("0000ff11"))
        circle((4.5, 0.75), radius: 0.8, stroke: 1.5pt + red, fill: rgb("ff000011"))
        content((1.5 / 2, -0.6), [$S_1$])
        content((4.5, -0.6), [$S_2$])
      })
    ]
  ],
  [$15,7$],
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Gọi $x>0$ là chiều dài đoạn tạo hình vuông. Cạnh hình vuông là $x/4$, diện tích $S_1 = (x/4)^2 = x^2/16$.]
    #step[Chiều dài đoạn làm hình tròn là $28-x$. Bán kính $r = (28-x)/(2pi)$, diện tích $S_2 = pi r^2 = (28-x)^2/(4pi)$.]
    #step[Hàm tổng diện tích $S(x) = x^2/16 + (28-x)^2/(4pi)$.
      Đạo hàm $S'(x) = x/8 - (28-x)/(2pi) = 0 <=> pi x = 4(28-x) <=> (pi+4)x = 112 <=> x = 112/(pi+4)$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 28)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $112/(pi + 4)$, $28$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($196/pi$, $196/(pi + 4)$, $49$),
          is-min: true,
        )
      ]]
    #step[Từ bảng biến thiên, tổng diện tích nhỏ nhất khi $x = 112/(pi + 4)$. Với $pi approx 3.14$,
      $ x approx 112 / 7.14 approx 15.686 approx 15.7 $ (m).]
    #resetstep()

  ],
)

#tln(
  [
    Người ta muốn thiết kế một tấm poster hình chữ nhật có diện tích phần in chữ là $200$ cm², lề trên/dưới mỗi lề bao $2$ cm, lề trái/phải mỗi lề bao $1$ cm. Tính diện tích toàn bộ tấm poster nhỏ nhất có thể (cm²).
    #align(center)[
      #canvas(length: 1cm, {
        import draw: *
        rect((0, 0), (4, 6), fill: rgb("eee"))
        rect((0.5, 1), (3.5, 5), fill: white, stroke: (dash: "dashed", paint: rgb("444")))
        content((2, 3), [*In chữ*])
        content((2, 5.5), text(size: 8pt)[$2$])
        content((2, 0.5), text(size: 8pt)[$2$])
        content((0.25, 3), text(size: 8pt)[$1$])
        content((3.75, 3), text(size: 8pt)[$1$])
      })
    ]
  ],
  [$288$],
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]

    #step[Gọi $x, y$ lần lượt là chiều rộng, chiều cao phần in chữ ($x > 0$). Diện tích $x dot.c y = 200 <=> y = 200/x$.]
    #step[Kích thước poster: Rộng $x+2$ (do lề 1+1), Cao $y+4$ (do lề 2+2).]
    #step[Diện tích $S(x) = (x+2)(y+4) = (x+2)(200/x+4) = 200 + 4x + 400/x + 8 = 4x + 400/x + 208$.]
    #step[Đạo hàm $S'(x) = 4 - 400/x^2 = 0 <=> x^2 = 100 <=> x = 10$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $10$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $288$, $+oo$),
          is-min: true,
        )
      ]]
    #step[Khi đó $S_(min) = 4(10) + 400/10 + 208 = 40+40+208 = 288$ cm².]
    #resetstep()
  ],
)

#tln(
  [
    Một khu đất hình chữ nhật được rào dọc theo một con sông (bờ sông không cần rào). Người ta có $100$ mét lưới rào. Kích thước hình chữ nhật (chiều rộng $x$ mét và chiều dài $y$ mét dọc theo con sông) phải tối ưu ra sao để diện tích là lớn nhất, khi đó diện tích lớn nhất bằng bao nhiêu m²?
  ],
  [1250],
  loigiai: [
    #ppgiai[
      - Biểu diễn đại lượng cần tối ưu theo 1 biến số.
      - Khảo sát sự biến thiên của hàm số trên tập xác định.
    ]
    #step[Chiều dài hàng rào là $2x + y = 100 <=> y = 100 - 2x$. Điều kiện $0 < x < 50$.]
    #step[Diện tích khu đất: $S(x) = x y = x(100 - 2x) = -2x^2 + 100x$.]
    #step[Đạo hàm: $S'(x) = -4x + 100$. Cho $S'(x) = 0 <=> x = 25$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 50)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $25$, $50$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $1250$, $0$),
          is-min: false,
        )
      ]]
    #step[Từ bảng biến thiên, $S$ đạt giá trị lớn nhất tại $x = 25$. Khi đó $y = 100 - 50 = 50$.]
    #step[Diện tích lớn nhất: $S_(max) = S(25) = -2(25)^2 + 100(25) = 1250$ (m²).]
  ],
)

#tln(
  [
    Một doanh nghiệp bán một loại sản phẩm. Nếu giá bán là $x$ (nghìn đồng) mỗi sản phẩm, thì số lượng bán được mỗi tháng dự kiến là $p(x) = 1200 - 10x$ (sản phẩm). Biết chi phí sản xuất mỗi sản phẩm là $40$ nghìn đồng. Doanh nghiệp cần định giá bán $x$ là bao nhiêu để đạt lợi nhuận lớn nhất? (đơn vị: nghìn đồng).
  ],
  [80],
  loigiai: [
    #ppgiai[
      - Hàm Lợi nhuận = (Giá bán $-$ Chi phí) $times$ Số lượng.
      - Khảo sát sự biến thiên của hàm số Lợi nhuận.
    ]
    #step[Doanh thu trên mỗi sản phẩm sau khi trừ chi phí (lợi nhuận cốt lõi): $x - 40$.]
    #step[Tổng lợi nhuận mỗi tháng: $L(x) = (x - 40) dot.c (1200 - 10x) = -10x^2 + 1600x - 48000$.]
    #step[Điều kiện để còn bán được hàng là $1200 - 10x > 0 <=> 0 < x < 120$. Đạo hàm:
      $ L'(x) = -20x + 1600. $
      Cho $L'(x) = 0 <=> x = 80$.]
    #step[Bảng biến thiên của $L(x)$ trên $(0; 120)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $L'$,
          func: $L$,
          x-vals: ($0$, $80$, $120$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($-48000$, $16000$, $0$),
          is-min: false,
        )
      ]]
    #step[Vậy giá bán cần thiết để tối ưu hóa lợi nhuận là $80$ nghìn đồng.]
  ],
)


// ════════════════════════════════════════════════════════════
#bt-header(c-p1)
#resetexamstate()



#tn(
  [
    Một mảnh vườn hình chữ nhật sát một bức tường thẳng. Người ta có $80$ m hàng rào để rào ba cạnh còn lại. Hỏi chiều rộng vuông góc với tường phải bằng bao nhiêu để diện tích mảnh vườn lớn nhất?
  ],
  ([10 m], True([20 m]), [30 m], [40 m]),
  loigiai: [
    #ppgiai[
      - Gọi chiều rộng vuông góc với tường là $x$.
      - Dùng điều kiện tổng chiều dài hàng rào để biểu diễn chiều dài theo $x$.
      - Khảo sát hàm diện tích bằng đạo hàm và BBT.
    ]

    #step[Gọi $x$ (m) là chiều rộng vuông góc với tường. Khi đó chiều dài còn lại là $80 - 2x$ (m), với điều kiện $0 < x < 40$.]
    #step[Diện tích mảnh vườn là:
      $ S(x) = x(80 - 2x) = 80x - 2x^2. $]
    #step[Đạo hàm:
      $ S'(x) = 80 - 4x. $
      Cho $S'(x) = 0 <=> x = 20$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 40)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $20$, $40$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $800$, $0$),
          is-min: false,
        )
      ]]
    #step[Từ bảng biến thiên, diện tích lớn nhất khi $x = 20$ m.]
    #resetstep()
  ],
)

#tn(
  [
    Từ một tấm bìa hình chữ nhật kích thước $16$ cm và $10$ cm, người ta cắt ở bốn góc bốn hình vuông cạnh $x$ cm rồi gấp thành một hộp không nắp. Giá trị của $x$ để thể tích hộp lớn nhất là
  ],
  ([1 cm], True([2 cm]), [3 cm], [4 cm]),
  loigiai: [
    #ppgiai[
      - Xác định thể tích hộp theo biến $x$.
      - Tính đạo hàm và tìm điểm tới hạn phù hợp điều kiện hình học.
      - Kết luận bằng BBT.
    ]

    #step[Điều kiện: $0 < x < 5$. Sau khi cắt và gấp lên, hộp có chiều cao $x$, đáy là hình chữ nhật kích thước $16 - 2x$ và $10 - 2x$.]
    #step[Thể tích hộp là:
      $ V(x) = x(16 - 2x)(10 - 2x). $]
    #step[Tính đạo hàm:
      $ V'(x) = 12x^2 - 104x + 160 = 4(3x^2 - 26x + 40) = 4(x - 2)(3x - 20). $
      Trong khoảng $(0; 5)$ chỉ có nghiệm $x = 2$.]
    #step[Bảng biến thiên của $V(x)$ trên $(0; 5)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $2$, $5$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $144$, $0$),
          is-min: false,
        )
      ]]
    #step[Vậy thể tích lớn nhất khi $x = 2$ cm.]
    #resetstep()
  ],
)

#tn(
  [
    Cho parabol $(P): y = 9 - x^2$. Một hình chữ nhật nội tiếp trong hình phẳng giới hạn bởi $(P)$ và trục hoành, có đáy nằm trên trục hoành. Diện tích lớn nhất của hình chữ nhật bằng
  ],
  ([$9$], [$6 sqrt(3)$], True([$12 sqrt(3)$]), [$18$]),
  loigiai: [
    #ppgiai[
      - Gọi nửa chiều rộng hình chữ nhật là $x$.
      - Biểu diễn chiều cao theo phương trình parabol.
      - Khảo sát hàm diện tích bằng đạo hàm và BBT.
    ]

    #step[Gọi hai đỉnh đáy là $(-x; 0)$ và $(x; 0)$ với $0 < x < 3$. Khi đó chiều cao hình chữ nhật là $9 - x^2$.]
    #step[Diện tích hình chữ nhật là:
      $ S(x) = 2x(9 - x^2) = 18x - 2x^3. $]
    #step[Đạo hàm:
      $ S'(x) = 18 - 6x^2. $
      Cho $S'(x) = 0 <=> x = sqrt(3)$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 3)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $sqrt(3)$, $3$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $12 sqrt(3)$, $0$),
          is-min: false,
        )
      ]]
    #step[Từ bảng biến thiên, diện tích lớn nhất là $12 sqrt(3)$.]
    #resetstep()
  ],
)


#resetexamstate()

#ds(
  [
    Một tấm poster hình chữ nhật có diện tích phần in chữ bằng $384$ cm². Lề trái và lề phải đều rộng $2$ cm, lề trên và lề dưới đều rộng $3$ cm.
  ],
  (
    True([Nếu gọi chiều rộng phần in chữ là $x$ thì diện tích toàn bộ tấm poster là $S(x) = 6x + 1536/x + 408$.]),
    True([Phương trình $S'(x) = 0$ có nghiệm dương duy nhất là $x = 16$.]),
    True([Kích thước tối ưu của cả tấm poster là $20$ cm và $30$ cm.]),
    [Diện tích nhỏ nhất của cả tấm poster là $576$ cm².],
  ),
  loigiai: [
    #ppgiai[
      - Biểu diễn diện tích toàn phần theo một biến $x$.
      - Tính đạo hàm để tìm điểm tối ưu.
      - Dùng BBT để kiểm tra GTNN và đối chiếu từng phát biểu.
    ]

    #step[Đặt chiều rộng, chiều cao phần in chữ lần lượt là $x, y$ thì $x dot.c y = 384 <=> y = 384/x$.]
    #step[Kích thước poster là $x + 4$ và $y + 6$, do đó:
      $
        S(x) & = (x + 4)(y + 6) = (x + 4)(384/x + 6) \
             & = 6x + 1536/x + 408.
      $
      Vì vậy phát biểu $1$ là *Đúng*.]
    #step[Đạo hàm:
      $ S'(x) = 6 - 1536/x^2. $
      Cho $S'(x) = 0 <=> x^2 = 256 <=> x = 16$.
      Do đó phát biểu $2$ là *Đúng*.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $16$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $600$, $+oo$),
          is-min: true,
        )
      ]]
    #step[Từ bảng biến thiên, diện tích nhỏ nhất là $600$ cm². Khi đó $y = 384/16 = 24$, nên kích thước tối ưu là $20$ cm và $30$ cm. Vì vậy phát biểu $3$ *Đúng* và phát biểu $4$ *Sai*.]
    #resetstep()
  ],
)

#ds(
  [
    Một sợi dây dài $10$ m được cắt thành hai đoạn. Đoạn thứ nhất uốn thành hình vuông, đoạn thứ hai uốn thành hình tròn. Gọi $x$ (m) là độ dài đoạn dùng uốn hình vuông.
  ],
  (
    True([Tổng diện tích hai hình là $S(x) = x^2/16 + (10 - x)^2/(4pi)$ với $0 < x < 10$.]),
    True([Phương trình $S'(x) = 0$ có nghiệm $x = 40/(pi + 4)$.]),
    [Giá trị $x = 40/(pi + 4)$ làm tổng diện tích lớn nhất.],
    True(
      [Nếu dùng toàn bộ sợi dây để uốn thành hình tròn thì diện tích nhận được lớn hơn khi dùng toàn bộ sợi dây để uốn thành hình vuông.],
    ),
  ),
  loigiai: [
    #ppgiai[
      - Thiết lập công thức diện tích của hình vuông và hình tròn theo $x$.
      - Xét đạo hàm của tổng diện tích.
      - Dựa vào BBT để xác định bản chất cực trị và kiểm tra các phát biểu.
    ]

    #step[Hình vuông có cạnh $x/4$ nên diện tích là $x^2/16$. Hình tròn có chu vi $10 - x$ nên diện tích là $(10 - x)^2/(4pi)$. Vì vậy phát biểu $1$ là *Đúng*.]
    #step[Đạo hàm:
      $ S'(x) = x/8 - (10 - x)/(2pi). $
      Cho $S'(x) = 0 <=> pi x = 4(10 - x) <=> x = 40/(pi + 4)$.
      Vậy phát biểu $2$ là *Đúng*.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 10)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $40/(pi + 4)$, $10$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($25/pi$, $25/(pi + 4)$, $25/4$),
          is-min: true,
        )
      ]]
    #step[Từ bảng biến thiên, $x = 40/(pi + 4)$ cho tổng diện tích *nhỏ nhất*, nên phát biểu $3$ là *Sai*. Ngoài ra:
      $ S(0) = 25/pi > 25/4 = S(10). $
      Do đó phát biểu $4$ là *Đúng*.]
    #resetstep()
  ],
)


#resetexamstate()

#tln(
  [
    Từ tấm bìa hình vuông cạnh $24$ cm, người ta cắt ở bốn góc bốn hình vuông cạnh $x$ cm rồi gấp thành hộp không nắp. Thể tích lớn nhất của hộp bằng bao nhiêu cm³?
  ],
  [$1024$],
  loigiai: [
    #ppgiai[
      - Lập hàm thể tích theo biến $x$.
      - Tìm nghiệm của phương trình đạo hàm bằng $0$.
      - Dùng BBT để suy ra GTLN.
    ]

    #step[Điều kiện: $0 < x < 12$. Khi đó hộp có chiều cao $x$ và đáy là hình vuông cạnh $24 - 2x$.]
    #step[Thể tích hộp là:
      $ V(x) = x(24 - 2x)^2. $]
    #step[Đạo hàm:
      $ V'(x) = (24 - 2x)(24 - 6x). $
      Cho $V'(x) = 0 <=> hoac(x = 12 " (loại)", x = 4 " (nhận)").$]
    #step[Bảng biến thiên của $V(x)$ trên $(0; 12)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $V'$,
          func: $V$,
          x-vals: ($0$, $4$, $12$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $1024$, $0$),
          is-min: false,
        )
      ]]
    #step[Vậy thể tích lớn nhất là $1024$ cm³.]
    #resetstep()
  ],
)

#tln(
  [
    Một tấm poster hình chữ nhật có diện tích phần in chữ bằng $288$ cm². Lề trái và lề phải đều rộng $1$ cm, lề trên và lề dưới đều rộng $2$ cm. Hỏi diện tích nhỏ nhất của cả tấm poster là bao nhiêu cm²?
  ],
  [$392$],
  loigiai: [
    #ppgiai[
      - Đặt chiều rộng phần in chữ là $x$ và rút $y$ theo $x$.
      - Lập hàm diện tích toàn tấm poster.
      - Dùng đạo hàm và BBT để tìm GTNN.
    ]

    #step[Gọi kích thước phần in chữ là $x, y$ (cm). Khi đó $x dot.c y = 288 <=> y = 288/x$, với $x > 0$.]
    #step[Kích thước toàn tấm poster là $x + 2$ và $y + 4$, nên:
      $
        S(x) & = (x + 2)(y + 4) = (x + 2)(288/x + 4) \
             & = 4x + 576/x + 296.
      $]
    #step[Đạo hàm:
      $ S'(x) = 4 - 576/x^2. $
      Cho $S'(x) = 0 <=> x^2 = 144 <=> x = 12$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; +oo)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $12$, $+oo$),
          d-signs: ($-$, $0$, $+$),
          v-vals: ($+oo$, $392$, $+oo$),
          is-min: true,
        )
      ]]
    #step[Vậy diện tích nhỏ nhất của cả tấm poster là $392$ cm².]
    #resetstep()
  ],
)

#tln(
  [
    Một mảnh đất hình chữ nhật sát bờ sông, không cần rào cạnh sát sông. Người ta có $120$ m hàng rào để rào ba cạnh còn lại. Diện tích lớn nhất của mảnh đất là bao nhiêu m²?
  ],
  [$1800$],
  loigiai: [
    #ppgiai[
      - Gọi chiều rộng vuông góc với sông là $x$.
      - Lập hàm diện tích theo một biến.
      - Khảo sát bằng đạo hàm và BBT để lấy GTLN.
    ]

    #step[Gọi $x$ (m) là chiều rộng vuông góc với bờ sông. Khi đó chiều dài là $120 - 2x$ (m), với $0 < x < 60$.]
    #step[Diện tích mảnh đất là:
      $ S(x) = x(120 - 2x) = 120x - 2x^2. $]
    #step[Đạo hàm:
      $ S'(x) = 120 - 4x. $
      Cho $S'(x) = 0 <=> x = 30$.]
    #step[Bảng biến thiên của $S(x)$ trên $(0; 60)$ là:
      #align(center)[
        #bbt-opt(
          var: $x$,
          der: $S'$,
          func: $S$,
          x-vals: ($0$, $30$, $60$),
          d-signs: ($+$, $0$, $-$),
          v-vals: ($0$, $1800$, $0$),
          is-min: false,
        )
      ]]
    #step[Vậy diện tích lớn nhất của mảnh đất là $1800$ m².]
    #resetstep()
  ],
)


