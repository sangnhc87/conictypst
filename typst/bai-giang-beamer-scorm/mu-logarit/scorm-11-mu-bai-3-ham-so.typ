#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI3
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
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

#show: lecture-theme.with(
  title:       "BÀI 3: HÀM SỐ MŨ VÀ LOGARIT",
  subtitle:    "TOÁN 11 — Chương: Hàm Số Mũ và Hàm Số Logarit",
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


#slide[ = Ứng dụng: Nhịp đập của tự nhiên và vũ trụ ]
#lt-two-col(ratio: (50%, 50%), [
- *Hàm số mũ $a^x$:* Kẻ thù của trực giác con người. Khi đại dịch COVID-19 nổ ra, đường cong lây nhiễm bùng phát theo hàm mũ, khiến hệ thống y tế thế giới quá tải. 
- *Hàm số Logarit $log_a x$:* Thuốc giải cho sự bùng nổ. Khi dữ liệu quá khổng lồ (như năng lượng động đất), hàm Logarit giúp "bóp nhỏ" chúng lại để con người dễ hình dung. 
- Độ Richter đo động đất, cường độ Decibel của âm thanh, và cả thang độ pH trong hóa học... tất cả đều là các *thang đo Logarit*!
], [
  #align(center)[
    #rect(fill: rgb("#e8f4f8"), stroke: 1pt, inset: 10pt)[Mũ tạo ra sự bùng nổ. Logarit làm phẳng dữ liệu!]
  ]
])


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #phuongphap(title: [⚙ Hàm số mũ $y = a^x$ (với $a > 0, a != 1$)])[
    - *Tập xác định:* $D = RR$.
    - *Tập giá trị:* $T = (0; +oo)$. Đồ thị luôn nằm hoàn toàn phía trên trục hoành.
    - *Sự biến thiên:*
      - Nếu $a > 1$: Hàm số luôn đồng biến trên $RR$.
      - Nếu $0 < a < 1$: Hàm số luôn nghịch biến trên $RR$.
    - *Tiệm cận:* Trục hoành ($y=0$) là tiệm cận ngang.
    - *Đồ thị:* Luôn đi qua các điểm $(0; 1)$ và $(1; a)$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Hàm số logarit $y = log_a x$ (với $a > 0, a != 1$)])[
    - *Tập xác định:* $D = (0; +oo)$.
    - *Tập giá trị:* $T = RR$.
    - *Sự biến thiên:*
      - Nếu $a > 1$: Hàm số luôn đồng biến trên $(0; +oo)$.
      - Nếu $0 < a < 1$: Hàm số luôn nghịch biến trên $(0; +oo)$.
    - *Tiệm cận:* Trục tung ($x=0$) là tiệm cận đứng.
    - *Đồ thị:* Luôn đi qua các điểm $(1; 0)$ và $(a; 1)$.
  ]
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Tính đối xứng])[
    Hàm số $y = a^x$ và hàm số $y = log_a x$ là hai hàm ngược của nhau. Do đó, đồ thị của chúng *đối xứng với nhau qua đường phân giác của góc phần tư thứ nhất* (đường thẳng $y = x$).
  ]
]

#let draw-axes() = {
  import cetz.draw: *
  // X axis
  line((-1.5, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
  content((5.3, -0.3), [$x$])
  // Y axis
  line((0, -1.5), (0, 5.5), mark: (end: ">"), stroke: 0.8pt)
  content((0.3, 5.3), [$y$])
  content((-0.2, -0.2), [$O$])
  
  // Ticks
  for i in (1, 2, 3, 4, 5) {
    line((i, -0.05), (i, 0.05))
    content((i, -0.3), text(size: 8pt)[#str(i)])
    line((-0.05, i), (0.05, i))
    content((-0.3, i), text(size: 8pt)[#str(i)])
  }
}

#grid(columns: (1fr, 1fr), gutter: 1em,
  [
    *Trường hợp $a > 1$ (Ví dụ: $a = 2$)* \
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        draw-axes()
        
        // y = x
        line((-1, -1), (5, 5), stroke: (dash: "dashed", paint: gray))
        content((4.5, 5.2), text(fill: gray)[$y = x$])
        
        // y = 2^x
        let p_exp = range(std.int(-1.5*20), std.int(2.4*20)).map(x => (x/20, calc.pow(2, x/20)))
        line(..p_exp, stroke: 1.5pt + blue)
        content((1.2, 4.8), text(fill: blue)[$y = 2^x$])
        
        // y = log_2 x
        let p_log = range(std.int(0.1*20), std.int(5.5*20)).map(x => (x/20, calc.log(x/20, base: 2)))
        line(..p_log, stroke: 1.5pt + red)
        content((4.8, 1.6), text(fill: red)[$y = log_2 x$])
      })
    ]
  ],
  [
    *Trường hợp $0 < a < 1$ (Ví dụ: $a = 1/2$)* \
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        draw-axes()
        
        // y = x
        line((-1, -1), (5, 5), stroke: (dash: "dashed", paint: gray))
        content((4.5, 5.2), text(fill: gray)[$y = x$])
        
        // y = (1/2)^x
        let p_exp = range(std.int(-1.5*20), std.int(5.5*20)).map(x => (x/20, calc.pow(0.5, x/20)))
        line(..p_exp, stroke: 1.5pt + blue)
        content((-1, 3.5), text(fill: blue)[$y = (1/2)^x$])
        
        // y = log_{1/2} x
        let p_log = range(std.int(0.1*20), std.int(5.5*20)).map(x => (x/20, calc.log(x/20, base: 0.5)))
        line(..p_log, stroke: 1.5pt + red)
        content((3.5, -1), text(fill: red)[$y = log_(1/2) x$])
      })
    ]
  ]
)

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = log_2 (x - 3)$ là:],
  (
    [$D = RR \ \{3\}$],
    [$D = (0; +oo)$],
    True([$D = (3; +oo)$]),
    [$D = [3; +oo)$]
  ),
  loigiai: [
    #step[*Lý thuyết:* Hàm số logarit $y = log_a X$ xác định khi biểu thức dưới dấu logarit dương ($X > 0$).]
    #step[*B1: Điều kiện* \ Ở đây ta cần $x - 3 > 0 <=> x > 3$.]
    #step[*B2: Kết luận* \ Tập xác định là $D = (3; +oo)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Hàm số nào dưới đây đồng biến trên khoảng $(0; +oo)$?],
  (
    [$y = (sqrt(2)/2)^x$],
    [$y = log_(0.5) x$],
    True([$y = log_pi x$]),
    [$y = (e/3)^x$]
  ),
  loigiai: [
    #step[*Đánh giá cơ số* \ Hàm số $y = a^x$ hoặc $y = log_a x$ đồng biến khi cơ số $a > 1$ và nghịch biến khi $0 < a < 1$.]
    #step[- A: $a = sqrt(2)/2 approx 0.707 < 1$ (Nghịch biến).]
    #step[- B: $a = 0.5 < 1$ (Nghịch biến).]
    #step[- C: $a = pi approx 3.14 > 1$ (Đồng biến).]
    #step[- D: $a = e/3 approx 2.718/3 < 1$ (Nghịch biến).]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = (x^2 - 4)^(-5)$ là:],
  (
    [$D = (-2; 2)$],
    [$D = (-oo; -2) union (2; +oo)$],
    True([$D = RR \ {-2; 2}$]),
    [$D = RR$]
  ),
  loigiai: [
    #step[*Điều kiện xác định* \ Lũy thừa với số mũ nguyên âm ($n = -5$) đòi hỏi cơ số khác 0.]
    #step[*Giải phương trình* \ $x^2 - 4 != 0 <=> x != 2$ và $x != -2$.]
    #step[*Kết luận* \ Vậy tập xác định là $D = RR \ {-2; 2}$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho hàm số $f(x) = ln x$. Đạo hàm của hàm số tại $x = e$ là:],
  (
    [$e$],
    True([$1/e$]),
    [$1$],
    [$0$]
  ),
  loigiai: [
    #step[*Tính đạo hàm* \ Đạo hàm của hàm số $f(x) = ln x$ là $f'(x) = 1/x$.]
    #step[*Thay giá trị* \ Tại $x = e$, $f'(e) = 1/e$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Đường cong trong hình vẽ là đồ thị của hàm số nào dưới đây? \ _(Biết đồ thị đi qua điểm $(1; 3)$ và tiệm cận ngang $y=0$)_],
  (
    [$y = log_3 x$],
    True([$y = 3^x$]),
    [$y = (1/3)^x$],
    [$y = log_(1/3) x$]
  ),
  loigiai: [
    #step[*Phân tích đồ thị* \ Hàm số có tiệm cận ngang $y = 0$ nên đây là đồ thị hàm số mũ dạng $y = a^x$.]
    #step[*Sử dụng tọa độ điểm* \ Đồ thị đi qua điểm $(1; 3)$, thay vào ta được $a^1 = 3 <=> a = 3$.]
    #step[*Kết luận* \ Vậy đây là đồ thị hàm số $y = 3^x$.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Cho hai hàm số $f(x) = 2^x$ và $g(x) = log_2 x$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của hàm số $f(x)$ là $(0; +oo)$.],
    True([Đồ thị của hai hàm số đối xứng nhau qua đường thẳng $y = x$.]),
    [Đồ thị hàm số $g(x)$ có đường tiệm cận ngang là trục hoành.],
    True([Phương trình $f(x) = g(x)$ vô nghiệm.])
  ),
  loigiai: [
    - *a) Sai:* Hàm số mũ $f(x) = 2^x$ có tập xác định là $RR$. $(0; +oo)$ là tập giá trị.
    - *b) Đúng:* Vì $f(x) = 2^x$ và $g(x) = log_2 x$ là hai hàm ngược của nhau nên đồ thị của chúng luôn đối xứng qua đường phân giác $y = x$.
    - *c) Sai:* Đồ thị hàm logarit $g(x)$ có trục tung ($x=0$) là tiệm cận đứng, không có tiệm cận ngang.
    - *d) Đúng:* Vì đồ thị của hai hàm số nằm hoàn toàn về hai phía của đường thẳng $y=x$ và không có điểm chung nên phương trình $f(x)=g(x)$ vô nghiệm.
  ]
))

#q-wrap(dir: "doc", ds(
  [Cho hàm số $y = ln(x^2 - 2x + m)$. Xét tính đúng sai của các phát biểu sau:],
  (
    True([Khi $m = 2$, hàm số xác định trên toàn trục số $RR$.]),
    [Khi $m = 0$, tập xác định của hàm số là $D = [0; 2]$.],
    True([Để hàm số xác định trên khoảng $(0; 3)$ thì $m > 1$.]), // Let's check: min(x^2-2x) on (0;3). At x=1, min is -1. So m > 1. Wait, x^2-2x+m > 0 for all x in (0;3) => m > -x^2+2x. max(-x^2+2x) on (0,3) is 1 at x=1. So m > 1. Correct.
    [Nếu $m = 1$, đồ thị hàm số có hai đường tiệm cận đứng.] // If m=1, y = ln(x-1)^2. It has one vertical asymptote x=1. False.
  ),
  loigiai: [
    - *a) Đúng:* Với $m = 2$, biểu thức trong logarit là $x^2 - 2x + 2 = (x - 1)^2 + 1 > 0$ với mọi $x in RR$. Do đó tập xác định là $RR$.
    - *b) Sai:* Khi $m = 0$, điều kiện là $x^2 - 2x > 0 <=> x < 0$ hoặc $x > 2$. Tập xác định là $D = (-oo; 0) union (2; +oo)$, không phải đoạn $[0; 2]$.
    - *c) Đúng:* Yêu cầu bài toán tương đương với $x^2 - 2x + m > 0, quad forall x in (0; 3)$. Cô lập $m$: $m > -x^2 + 2x$. Xét hàm $h(x) = -x^2 + 2x$ trên $(0; 3)$. $h(x)$ đạt đỉnh tại $x = 1$, giá trị lớn nhất là $1$. Do đó ta cần $m > 1$.
    - *d) Sai:* Khi $m = 1$, $y = ln(x^2 - 2x + 1) = ln(x - 1)^2$. Điều kiện là $x != 1$. Khi $x -> 1$, $y -> -oo$, do đó chỉ có đúng 1 đường tiệm cận đứng là $x = 1$.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Tìm số giá trị nguyên của tham số $m$ thuộc đoạn $[-5; 5]$ để hàm số $y = log_3 (x^2 + 4x + m)$ có tập xác định là $RR$.],
  [$1$], // Wait. x^2+4x+m > 0 for all x. Delta' = 4 - m < 0 => m > 4. In [-5;5], m=5 => 1 value. Correct.
  loigiai: [
    #step[*B1: Lập điều kiện* \ Hàm số xác định trên $RR$ khi và chỉ khi $x^2 + 4x + m > 0$ với mọi $x in RR$.]
    #step[*B2: Xét dấu tam thức bậc hai* \ Yêu cầu này tương đương với $Delta' < 0 <=> 2^2 - m < 0 <=> 4 - m < 0 <=> m > 4$.]
    #step[*B3: Lọc kết quả* \ Do $m$ nguyên và $m in [-5; 5]$ nên $m = 5$. \ Vậy có đúng $1$ giá trị nguyên thỏa mãn.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Có bao nhiêu điểm trên đồ thị hàm số $y = e^x$ có tọa độ nguyên?],
  [$1$],
  loigiai: [
    #step[*B1: Phân tích tọa độ nguyên* \ Gọi điểm thuộc đồ thị là $M(x; y)$. Vì $M$ có tọa độ nguyên nên $x in ZZ$ và $y in ZZ$.]
    #step[*B2: Đánh giá phương trình* \ Ta có phương trình $y = e^x$. Vì $e$ là số vô tỉ ($e approx 2.718$), $e^x$ chỉ có thể là số nguyên khi số mũ $x = 0$.]
    #step[*B3: Tìm nghiệm* \ Với $x = 0$, ta có $y = e^0 = 1$. Điểm duy nhất là $(0; 1)$. \ Nếu $x >= 1$ thì $e^x$ là số vô tỉ. Nếu $x <= -1$ thì $0 < e^x < 1$, không thể là số nguyên. \ Vậy có duy nhất $1$ điểm.]
  ]
))


