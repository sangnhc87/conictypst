#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI1
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
  title:       "BÀI 1: LŨY THỪA",
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


#slide[ = Gợi mở: Ký hiệu của quyền lực và sự bùng nổ ]
- Vào thế kỷ 17, nhà toán học và triết học vĩ đại *René Descartes* đã đưa ra một phát kiến tưởng chừng đơn giản nhưng thay đổi hoàn toàn cục diện toán học: thay vì viết $a times a times a$, ông viết $a^3$.
- Sự ra đời của *Lũy thừa* không chỉ giúp tiết kiệm giấy mực. Nó mở ra cánh cửa cho các nhà khoa học khám phá thế giới vĩ mô (khoảng cách giữa các thiên hà) và vi mô (kích thước của nguyên tử).
- Hãy tưởng tượng, nếu bạn gấp đôi một tờ giấy $0.1 "mm"$ liên tục $42$ lần, độ dày của nó sẽ đủ để vươn tới Mặt Trăng ($0.1 "mm" times 2^{42} approx 440,000 "km"$). Lũy thừa chính là ngôn ngữ của *sự bùng nổ*!


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #phuongphap(title: [⚙ Khái niệm và Tính chất])[
    - Cho $a in RR$, $n in NN^*$. Lũy thừa bậc $n$ của $a$ là tích của $n$ thừa số $a$:
      $ a^n = underbrace(a dot a dot ... dot a, n "thừa số") $
    - Với $a != 0$, ta quy ước: 
      $ a^0 = 1, quad a^(-n) = 1/a^n quad (n in NN^*) $
    - *Lưu ý:* $0^0$ và $0^(-n)$ không có nghĩa.
  ]
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Định nghĩa và Tính chất])[
    - Cho $n in NN, n >= 2$. Số $x$ được gọi là căn bậc $n$ của số $a$ nếu $x^n = a$.
    - *Với $n$ lẻ:* Mọi số thực $a$ đều có duy nhất một căn bậc $n$, ký hiệu là $root(n, a)$.
    - *Với $n$ chẵn:*
      - Nếu $a < 0$: Không tồn tại căn bậc $n$ của $a$.
      - Nếu $a = 0$: Có một căn bậc $n$ là $0$.
      - Nếu $a > 0$: Có hai căn bậc $n$ là hai số đối nhau, ký hiệu là $root(n, a)$ (căn số học) và $-root(n, a)$.
    - *Tính chất (với $a, b > 0$):*
      - $root(n, a b) = root(n, a) dot root(n, b)$
      - $root(n, a/b) = (root(n, a)) / (root(n, b))$
      - $root(n, a^m) = (root(n, a))^m$
      - $root(n, root(k, a)) = root(n k, a)$
  ]
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Số mũ hữu tỉ])[
    - Cho $a > 0$ và số hữu tỉ $r = m/n$ trong đó $m in ZZ, n in NN^*, n >= 2$.
    - Lũy thừa của $a$ với số mũ $r$ được định nghĩa là:
      $ a^(m/n) = root(n, a^m) $
    - *Lưu ý:* Cơ số $a$ *bắt buộc phải dương* ($a > 0$). Ví dụ: $(-2)^(1/3)$ là không xác định dù $root(3, -2)$ có nghĩa.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Số mũ thực và Tính chất chung])[
    - Lũy thừa với số mũ thực $alpha in RR$ của $a > 0$ là giới hạn của các lũy thừa với số mũ hữu tỉ tiến dần tới $alpha$.
    - *Các tính chất của lũy thừa (với $a, b > 0; x, y in RR$):*
      1. $a^x dot a^y = a^(x+y)$
      2. $a^x / a^y = a^(x-y)$
      3. $(a^x)^y = a^(x y)$
      4. $(a b)^x = a^x dot b^x$
      5. $(a/b)^x = a^x / b^x$
    - *Tính đồng biến, nghịch biến:*
      - Nếu $a > 1$: $a^x > a^y <=> x > y$ (Cùng chiều).
      - Nếu $0 < a < 1$: $a^x > a^y <=> x < y$ (Ngược chiều).
  ]
]

#pagebreak()






#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 5)

#q-wrap(dir: "doc", tn(
  [Rút gọn biểu thức $P = x^(1/3) dot root(6, x)$ với $x > 0$, ta được:],
  ([$P = x^(1/8)$], [$P = x^(2/9)$], True([$P = x^(1/2)$]), [$P = x^2$]),
  loigiai: [
    #step[*B1: Chuyển căn thức về lũy thừa* \ Ta có $root(6, x) = x^(1/6)$.]
    #step[*B2: Áp dụng công thức nhân hai lũy thừa cùng cơ số* \ $P = x^(1/3) dot x^(1/6) = x^(1/3 + 1/6) = x^(3/6) = x^(1/2)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $a$ là số thực dương. Biểu thức $a^(2/3) / a^(1/2)$ bằng:],
  ([$a^(4/3)$], True([$a^(1/6)$]), [$a^(1/3)$], [$a^(7/6)$]),
  loigiai: [
    #step[*B1: Áp dụng công thức chia lũy thừa* \ Ta có $a^m / a^n = a^(m - n)$.]
    #step[*B2: Tính toán* \ $a^(2/3) / a^(1/2) = a^(2/3 - 1/2) = a^(4/6 - 3/6) = a^(1/6)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tập xác định của hàm số $y = (x - 1)^(-3)$ là:],
  (
    [$D = RR$],
    [$D = (1; +oo)$],
    True([$D = RR \ \{1\}$]),
    [$D = [1; +oo)$]
  ),
  loigiai: [
    #step[*Lý thuyết:* Lũy thừa với số mũ nguyên âm xác định khi cơ số khác 0.]
    #step[*B2: Lập điều kiện* \ Cơ số là $(x - 1)$. Do đó điều kiện là $x - 1 != 0 <=> x != 1$.]
    #step[*B3: Kết luận* \ Tập xác định $D = RR \ \{1\}$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho các số thực $a, b > 0$. Khẳng định nào sau đây là sai?],
  (
    [$(a b)^x = a^x b^x$],
    [$(a/b)^y = a^y / b^y$],
    True([$(a^x)^y = a^(x + y)$]),
    [$a^x a^y = a^(x + y)$]
  ),
  loigiai: [
    #step[*Lý thuyết:* Theo tính chất lũy thừa, lũy thừa của một lũy thừa là $(a^x)^y = a^(x y)$.]
    #step[Do đó khẳng định sai là $(a^x)^y = a^(x + y)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho $0 < a < 1$. Khẳng định nào sau đây là đúng?],
  (
    [$a^(sqrt(2)) < a^(sqrt(3))$],
    True([$a^(1/3) < a^(1/4)$]),
    [$a^(-2) > a^(-3)$],
    [$a^pi > a^3$]
  ),
  loigiai: [
    #step[*Lý thuyết:* Khi cơ số $0 < a < 1$, hàm số lũy thừa $y = a^x$ nghịch biến. Do đó, $a^x < a^y <=> x > y$.]
    #step[*Xét các đáp án:*]
    #step[- A sai vì $sqrt(2) < sqrt(3) => a^(sqrt(2)) > a^(sqrt(3))$.]
    #step[- B đúng vì $1/3 > 1/4 => a^(1/3) < a^(1/4)$.]
    #step[- C sai vì $-2 > -3 => a^(-2) < a^(-3)$.]
    #step[- D sai vì $pi > 3 => a^pi < a^3$.]
  ]
))

#resetcau()
#exam-part([PHẦN II. Câu trắc nghiệm đúng sai], count: 2)

#q-wrap(dir: "doc", ds(
  [Cho hai số thực $a, b > 0$ và biểu thức $P = a^(sqrt(2)) dot (1/a)^(sqrt(2) - 1)$. Xét tính đúng sai của các mệnh đề sau:],
  (
    [Tập xác định của biểu thức là $a in RR$.],
    True([Biểu thức được rút gọn thành $P = a$.]),
    [Nếu $a = 2026$ thì $P > 2027$.],
    True([Với $0 < a < 1$ thì $P < 1$.])
  ),
  loigiai: [
    - *a) Sai:* Hàm số lũy thừa với số mũ thực vô tỉ đòi hỏi cơ số phải lớn hơn $0$. Do đó điều kiện là $a > 0$.
    - *b) Đúng:* Ta có $1/a = a^(-1)$. Khi đó $(1/a)^(sqrt(2) - 1) = a^(-(sqrt(2) - 1)) = a^(1 - sqrt(2))$. \ Nhân hai lũy thừa cùng cơ số: $P = a^(sqrt(2)) dot a^(1 - sqrt(2)) = a^(sqrt(2) + 1 - sqrt(2)) = a^1 = a$.
    - *c) Sai:* Khi $a = 2026$, giá trị của $P = 2026$, do đó $P < 2027$.
    - *d) Đúng:* Vì $P = a$ nên với $0 < a < 1$ thì rõ ràng $P < 1$.
  ]
))

#q-wrap(dir: "doc", ds(
  [Xét tính đúng sai của các mệnh đề sau về căn bậc $n$ và lũy thừa:],
  (
    [Với mọi số thực $x$, ta có $root(2, x^2) = x$.],
    [Biểu thức $(-8)^(1/3)$ bằng $-2$.],
    True([Nếu $x > 0$ thì $root(4, x^2) = x^(1/2)$.]),
    True([Phương trình $x^3 = -27$ có duy nhất một nghiệm thực là $x = -3$.])
  ),
  loigiai: [
    - *a) Sai:* Theo định nghĩa căn bậc hai số học, $root(2, x^2) = |x|$. Chẳng hạn với $x = -2$ thì $root(2, (-2)^2) = 2 != -2$.
    - *b) Sai:* Lũy thừa với số mũ hữu tỉ $1/3$ yêu cầu cơ số dương (quy ước trong SGK). Do cơ số là $-8 < 0$ nên biểu thức $(-8)^(1/3)$ không xác định, mặc dù $root(3, -8) = -2$ là có nghĩa.
    - *c) Đúng:* Khi $x > 0$, ta có $root(4, x^2) = (x^2)^(1/4) = x^(2/4) = x^(1/2) = sqrt(x)$.
    - *d) Đúng:* Phương trình bậc lẻ $x^n = a$ (với $n$ lẻ) luôn có một nghiệm thực duy nhất là $root(n, a)$. Ở đây $x = root(3, -27) = -3$.
  ]
))

#resetcau()
#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 2)

#q-wrap(dir: "doc", tln(
  [Cho biểu thức $P = (root(3, a dot sqrt(a)) / a^(1/6))^6$ với $a > 0$. Hỏi biểu thức này có giá trị không đổi bằng $a^k$ với $k$ bằng bao nhiêu?],
  [$2$],
  loigiai: [
    #step[*B1: Rút gọn tử số* \ Ta có $a dot sqrt(a) = a^1 dot a^(1/2) = a^(3/2)$. \ Suy ra $root(3, a dot sqrt(a)) = (a^(3/2))^(1/3) = a^(1/2)$.]
    #step[*B2: Rút gọn biểu thức trong ngoặc* \ $a^(1/2) / a^(1/6) = a^(1/2 - 1/6) = a^(3/6 - 1/6) = a^(2/6) = a^(1/3)$.]
    #step[*B3: Nâng lũy thừa* \ Cuối cùng $P = (a^(1/3))^6 = a^(6/3) = a^2$. \ Vậy $k = 2$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một khoản tiền $A$ được gửi vào ngân hàng với lãi suất kép $8%$/năm. Sau đúng 3 năm, người đó nhận được số tiền gấp $k$ lần số tiền ban đầu. Giá trị của $k$ (làm tròn đến chữ số thập phân thứ hai) là bao nhiêu?],
  [$1.26$],
  loigiai: [
    #step[*B1: Công thức lãi kép* \ Số tiền thu được sau $n$ năm là $T = A(1 + r)^n$.]
    #step[*B2: Thay số* \ Với $r = 8% = 0.08$ và $n = 3$, ta có $T = A(1 + 0.08)^3 = A(1.08)^3$.]
    #step[*B3: Tính tỷ lệ* \ Tỷ lệ $k = T/A = (1.08)^3 approx 1.259712$. Làm tròn đến chữ số thập phân thứ hai là $1.26$.]
  ]
))


