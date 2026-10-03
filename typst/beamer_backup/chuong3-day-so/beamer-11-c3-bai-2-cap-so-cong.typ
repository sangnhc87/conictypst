#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI2
// Toán 11 — Kết nối tri thức  ·  GV: Nguyễn Văn Sang
// THPT Nguyễn Hữu Cảnh  ·  Tổ Toán
// ═══════════════════════════════════════════════════════════════════════════

#import "../giao-an/modules/lecture-beamer.typ": *
#import "../bbt.typ": *
#import "../modules/fractals.typ": *
#import "@preview/cetz:0.5.2"

#let hoac(..args) = math.cases(delim: "[", ..args.named(), ..args.pos().map(math.display))
#let heva(..args) = math.cases(delim: "{", ..args.named(), ..args.pos().map(math.display))
#let tfrac(a, b) = {
  show math.frac: f => f
  math.frac(a, b)
}

#let classic = (blue: rgb("#0057b8"), emerald: rgb("#1a7a2e"), crimson: rgb("#cc2200"), ink: black)

#show: lecture-theme.with(
  title:       "BÀI 2: CẤP SỐ CỘNG",
  subtitle:    "TOÁN 11 — Chương III: Dãy số. Cấp số cộng và Cấp số nhân",
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


#slide[ = Lịch sử: Sự tăng trưởng tuyến tính ]
- Câu chuyện nổi tiếng về thần đồng *Carl Friedrich Gauss* lúc 7 tuổi: Thầy giáo yêu cầu cả lớp tính tổng từ $1$ đến $100$. Trong vài giây, Gauss đưa ra đáp án $5050$ bằng cách nhận ra $1+100 = 101, 2+99 = 101,...$
- Phép tính của Gauss chính là công thức tính tổng của một *Cấp số cộng*!
- *Ứng dụng:* Cấp số cộng được dùng để tính toán khấu hao tài sản đều đặn mỗi năm, thiết kế các bậc thang (mỗi bậc cao hơn bậc trước một khoảng không đổi), hay dự đoán sản lượng đều đặn của một nhà máy.


#slide[ = Cơ sở lý thuyết ]




Năm 9 tuổi, thần đồng toán học Carl Friedrich Gauss bị thầy giáo phạt tính tổng các số từ $1$ đến $100$. Trong khi cả lớp hì hục nháp, Gauss chỉ mất vài giây để đưa ra đáp án $5050$. Cậu bé đã nhận ra quy luật: $1+100 = 101, 2+99 = 101...$ Có chính xác $50$ cặp như vậy. Gauss vừa khám phá ra công thức tính tổng của một *Cấp số cộng*.

---



#block(breakable: false)[
  #phuongphap(title: [Định nghĩa & Số hạng tổng quát])[
    Cấp số cộng (CSC) là dãy số thỏa mãn: $u_n = u_(n-1) + d$. 
    - $d$: Công sai. ($d>0$ dãy tăng, $d<0$ dãy giảm).
    - *Công thức "nhảy cóc" (Số hạng tổng quát):*
      $ u_n = u_1 + (n - 1)d $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tính chất nội tại của 3 số liên tiếp])[
    Ba số $a, b, c$ lập thành cấp số cộng khi và chỉ khi:
    $ a + c = 2b <=> b = (a+c)/2 $
    (Số ở giữa luôn là Trung bình cộng của hai số hai bên).
    *Mở rộng:* $u_k = (u_(k-m) + u_(k+m))/2$.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Kỹ thuật "Chèn số hạng"])[
    Làm sao để chèn $k$ số vào giữa hai số $A$ và $B$ để tạo thành một CSC?
    - Ta coi $A = u_1$. Chèn thêm $k$ số nên $B$ sẽ trở thành số hạng thứ $k + 2$.
    - Khi đó $u_(k+2) = B <=> u_1 + (k+1)d = B => d = (B - A)/(k+1)$.
  ]
]



#block(breakable: false)[
  #phuongphap(title: [Công thức tính tổng $S_n$])[
    Tổng của $n$ số hạng đầu tiên $S_n = u_1 + u_2 + ... + u_n$ được tính bằng 2 cách:
    - *Cách 1 (Như Gauss):* Biết đầu và cuối.
      $ S_n = n/2 (u_1 + u_n) $
    - *Cách 2 (Thực dụng):* Chỉ cần biết đầu và công sai.
      $ S_n = n/2 [2u_1 + (n - 1)d] $
  ]
]



#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Thiết kế Rạp hát & Sân vận động])[
    Trong các rạp hát, người ta xếp ghế theo dạng hình nón cong. Hàng ghế đầu tiên có $u_1$ ghế. Mỗi hàng tiếp theo đều tăng thêm $d$ ghế.
    Tổng số ghế trong rạp chính là tổng của CSC.
    *Ví dụ:* Hàng 1 có 20 ghế. Hàng sau tăng 2 ghế. Rạp có 30 hàng.
    Sức chứa: $S_(30) = 30/2 [2(20) + 29(2)] = 1470$ người.
  ]
]

#align(center)[
  *Mô hình rạp hát dạng hình thang (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let d = 0.5
    for row in range(0, 5) {
      let y = row * 0.8
      let num_seats = 5 + row * 2
      let start_x = - (num_seats * d) / 2
      for i in range(0, num_seats) {
        rect((start_x + i * d, y), (start_x + i * d + 0.4, y + 0.4), stroke: blue, fill: rgb("bae6fd"), radius: 0.1)
      }
      content((start_x - 1, y + 0.2), text(fill: luma(100))[Hàng #(row+1)])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Kinh tế học - Khấu hao tài sản tuyến tính (Straight-Line Depreciation)])[
    Một công ty mua chiếc máy bay giá 500 tỷ. Kế toán quy định khấu hao đều mỗi năm 20 tỷ trong 25 năm.
    Giá trị máy bay qua các năm tạo thành một Cấp số cộng GIẢM với $d = -20$.
    - $u_1 = 500$ (Năm 0)
    - Giá trị năm thứ $n$: $u_n = 500 - 20(n-1)$.
    Đây là kỹ thuật khấu hao phổ biến nhất trong báo cáo tài chính doanh nghiệp.
  ]
]

#align(center)[
  *Đồ thị khấu hao tài sản tuyến tính (Cấp số cộng giảm)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Grid
    grid((0, 0), (5, 4), stroke: (paint: gray.lighten(60%), dash: "dashed"), step: 1)
    
    // Axes
    line((0, 0), (5.7, 0), mark: (end: ">"))
    content((5.5, -0.4), [$n$ (Năm)])
    line((0, 0), (0, 4.5), mark: (end: ">"))
    content((-0.6, 4.3), [$u_n$ (Tỷ)])
    
    // Depreciation line
    line((0, 4), (5, 0), stroke: 2pt + red)
    
    // Labels on axes
    content((-0.4, 4), [500])
    content((-0.4, 3.2), [400])
    content((-0.4, 2.4), [300])
    content((-0.4, 0), [0])
    
    content((0, -0.3), [0])
    content((1, -0.3), [5])
    content((2, -0.3), [10])
    content((5, -0.3), [25])
    
    // Dashed helper lines
    line((1, 0), (1, 3.2), stroke: (paint: gray, dash: "dotted"))
    line((0, 3.2), (1, 3.2), stroke: (paint: gray, dash: "dotted"))
    circle((1, 3.2), radius: 0.06, fill: red, stroke: none)
    
    line((2, 0), (2, 2.4), stroke: (paint: gray, dash: "dotted"))
    line((0, 2.4), (2, 2.4), stroke: (paint: gray, dash: "dotted"))
    circle((2, 2.4), radius: 0.06, fill: red, stroke: none)
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Kỹ thuật - Chi phí khoan giếng lũy tiến])[
    Kỹ sư khoan một giếng dầu sâu 100m. 
    - Mét đầu tiên chi phí 1000 USD.
    - Càng khoan sâu đất càng cứng, nên từ mét thứ 2, cứ mỗi mét chi phí tăng thêm 200 USD so với mét trước đó.
    Chi phí khoan mét thứ $n$ là một CSC: $u_n = 1000 + (n-1)200$.
    *Tổng chi phí* để khoan 100m chính là tổng CSC: $S_(100) = 100/2 [2(1000) + 99(200)] = 1,090,000$ USD.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 4: Kỹ thuật xây dựng - Xếp chồng ống thép hình thang])[
    Trong các kho bãi, ống thép tròn thường được xếp chồng lên nhau tạo thành hình thang cân để đảm bảo cấu trúc ổn định, không bị lăn đổ.
    Giả sử hàng dưới cùng có $30$ ống, hàng ngay trên có ít hơn hàng dưới $1$ ống, và hàng trên cùng có $15$ ống.
    - Số ống thép ở mỗi hàng lập thành một Cấp số cộng GIẢM với $u_1 = 30, d = -1$.
    - Để tìm số hàng $n$, ta có: $u_n = u_1 + (n-1)d <=> 15 = 30 - (n-1) => n = 16$ hàng.
    - Tổng số ống thép trong kho bãi là:
      $ S_(16) = 16/2 (u_1 + u_(16)) = 8 times (30 + 15) = 360 text(" ống.") $
  ]
]

#align(center)[
  *Mô hình xếp chồng ống thép tròn (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    let r = 0.4 
    let dy = calc.sqrt(3) * r 
    
    for row in range(0, 5) {
      let num_pipes = 6 - row
      let y = row * dy
      let start_x = - (num_pipes - 1) * r
      for i in range(0, num_pipes) {
        let cx = start_x + i * 2 * r
        circle((cx, y), radius: r, stroke: c-book, fill: rgb("e0f2fe"))
        circle((cx, y), radius: r - 0.08, stroke: c-book.lighten(30%), fill: none)
      }
      content((start_x - 1.8, y), text(size: 9pt, fill: luma(120))[Hàng #(row+1)])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 5: Vật lý - Chuyển động thẳng biến đổi đều (Quãng đường đi được theo giây)])[
    Một vật chuyển động thẳng nhanh dần đều không vận tốc đầu với gia tốc $a$ (m/s#super[2]).
    Quãng đường vật đi được trong giây thứ $n$ liên tiếp được tính bởi công thức:
    $ s_n = a/2 (2n - 1) $
    - Xét các quãng đường đi được trong giây thứ 1, thứ 2, thứ 3...:
      $s_1 = a/2, s_2 = 3a/2, s_3 = 5a/2, s_4 = 7a/2...$
    - Dãy số $(s_n)$ lập thành một Cấp số cộng với số hạng đầu $u_1 = a/2$ và công sai $d = a$.
    Đây chính là quy luật số lẻ của Galileo về sự rơi tự do và chuyển động nhanh dần đều.
  ]
]

#align(center)[
  *Quãng đường đi được trong các giây liên tiếp của vật rơi tự do (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw ground/axis
    line((0, 0), (9, 0), mark: (end: ">"))
    content((9.2, -0.3), [$s$])
    
    let pos = (0, 0.8, 3.2, 7.2)
    
    // Draw vertical markers and balls
    for (i, p) in pos.enumerate() {
      circle((p, 0.4), radius: 0.2, fill: c-book, stroke: c-book.darken(20%))
      line((p, 0), (p, -0.15), stroke: 0.5pt + gray)
      content((p, -0.4), text(size: 8pt)[$t = #i text(" s")$])
    }
    
    // Bracket 1
    line((0, 0.8), (0, 0.95), (0.8, 0.95), (0.8, 0.8), stroke: 0.6pt + c-book)
    content((0.4, 1.25), text(size: 9pt, fill: c-book)[$s_1$])
    
    // Bracket 2
    line((0.8, 0.8), (0.8, 0.95), (3.2, 0.95), (3.2, 0.8), stroke: 0.6pt + c-book)
    content((2.0, 1.25), text(size: 9pt, fill: c-book)[$s_2 = 3 s_1$])
    
    // Bracket 3
    line((3.2, 0.8), (3.2, 0.95), (7.2, 0.95), (7.2, 0.8), stroke: 0.6pt + c-book)
    content((5.2, 1.25), text(size: 9pt, fill: c-book)[$s_3 = 5 s_1$])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 6: Khai thác tài nguyên - Sản lượng suy giảm tuyến tính])[
    Một mỏ than bắt đầu khai thác với sản lượng năm đầu tiên là $u_1 = 5$ triệu tấn. Do điều kiện vỉa quặng ngày càng sâu và khó tiếp cận, mỗi năm tiếp theo sản lượng khai thác giảm đi $0.2$ triệu tấn so với năm trước.
    - Dãy sản lượng khai thác hàng năm lập thành một Cấp số cộng với $u_1 = 5$, công sai $d = -0.2$.
    - Sản lượng năm thứ $n$: $u_n = 5 - 0.2(n-1)$.
    - Tổng sản lượng khai thác được sau $10$ năm là:
      $ S_(10) = 10/2 [2 u_1 + 9d] = 5 times [2(5) + 9(-0.2)] = 5 times [10 - 1.8] = 41 text(" triệu tấn.") $
  ]
]

#align(center)[
  *Biểu đồ cột sản lượng giảm dần theo năm (Cấp số cộng)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.4), [$n$ (Năm)])
    line((0, 0), (0, 3.5), mark: (end: ">"))
    content((-0.6, 3.3), [$u_n$ (Triệu)])
    
    for i in range(1, 6) {
      let val = 5 - 0.2 * (i - 1)
      let h = val * 0.5
      let x = i
      rect((x - 0.3, 0), (x + 0.3, h), fill: rgb("bae6fd"), stroke: c-book)
      content((x, -0.3), text(size: 8pt)[#i])
      content((x, h + 0.25), text(size: 7pt, fill: c-book)[#val])
    }
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 7: Quản trị nhân sự - Thang bảng lương lũy tiến (Lương tăng định kỳ)])[
    Anh Nam được tuyển dụng vào một cơ quan Nhà nước với mức lương năm đầu tiên là $u_1 = 120$ triệu đồng. Cơ quan áp dụng chính sách bậc lương: cứ sau mỗi năm làm việc, mức lương năm tiếp theo sẽ được tăng thêm một khoản cố định là $d = 10$ triệu đồng.
    - Mức lương năm thứ $n$ là một Cấp số cộng: $u_n = 120 + (n-1)10$.
    - Tổng số tiền lương anh Nam nhận được sau đúng $15$ năm công tác là:
      $ S_(15) = 15/2 [2 u_1 + 14d] = 15/2 [2(120) + 14(10)] = 15/2 [240 + 140] = 15/2 times 380 = 2850 text(" triệu đồng.") $
  ]
]

#align(center)[
  *Đồ thị thang bảng lương bậc thang theo năm (Cấp số cộng)* \
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.3), [$n$ (Năm)])
    line((0, 0), (0, 3.5), mark: (end: ">"))
    content((-0.6, 3.3), [$u_n$ (Triệu)])
    
    for i in range(1, 6) {
      let y = 1.0 + (i - 1) * 0.5
      line((i - 1, y), (i, y), stroke: 1.5pt + c-book)
      if i > 1 {
        let prev_y = 1.0 + (i - 2) * 0.5
        line((i - 1, prev_y), (i - 1, y), stroke: (paint: c-book, dash: "dashed"))
      }
      circle((i - 1, y), radius: 0.04, fill: c-book, stroke: none)
      circle((i, y), radius: 0.04, fill: c-book, stroke: none)
      content((i - 0.5, y + 0.25), text(size: 8pt)[#(110 + i * 10)])
      content((i - 0.5, -0.25), text(size: 8pt)[Năm #i])
    }
  })
]


#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 7)

#q-wrap(dir: "doc", tn(
  [Cho cấp số cộng $(u_n)$ có $u_1 = -3$ và công sai $d = 1/2$. Khẳng định nào sau đây là đúng?],
  (
    [$u_n = -3 + 1/2 n$],
    True([$u_n = -7/2 + 1/2 n$]),
    [$u_n = -3 - 1/2 n$],
    [$u_n = -5/2 + 1/2 n$]
  ),
  loigiai: [
    #step[*Áp dụng công thức:* \
      Công thức tổng quát: $u_n = u_1 + (n-1)d = -3 + 1/2 (n-1) = -7/2 + 1/2 n$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho một cấp số cộng có $u_4 = -12$ và $u_14 = 18$. Tìm công sai $d$ của cấp số cộng này.],
  (
    True([$d = 3$]),
    [$d = -3$],
    [$d = 3/10$],
    [$d = 1$]
  ),
  loigiai: [
    #step[*Sử dụng tính chất:* \
      Ta có $u_14 = u_4 + 10d => 18 = -12 + 10d => 10d = 30 => d = 3$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tổng của $100$ số nguyên dương lẻ đầu tiên ($1, 3, 5, ..., 199$) bằng bao nhiêu?],
  (
    [$5050$],
    True([$10000$]),
    [$9900$],
    [$19900$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Dãy $1, 3, 5,...$ là CSC có $u_1 = 1, d = 2$. \
    $S_(100) = 100/2 [2(1) + 99(2)] = 50 [2 + 198] = 50 times 200 = 10000$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Ba số $x, 5, 2y$ theo thứ tự lập thành một cấp số cộng; đồng thời ba số $x, 4, 2y$ theo thứ tự lập thành một cấp số nhân. Giá trị của $|x - 2y|$ bằng bao nhiêu?],
  (
    [$2$],
    [$4$],
    True([$6$]),
    [$8$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Lập CSC: $x + 2y = 10$. Lập CSN: $x dot 2y = 16$. \
    $x$ và $2y$ là nghiệm của pt $X^2 - 10X + 16 = 0 <=> X=2$ hoặc $X=8$. \
    Tập nghiệm là ${2, 8}$. Khoảng cách $|x - 2y| = |2 - 8| = 6$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Trong hợp đồng lao động, mức lương năm đầu của anh A là $120$ triệu đồng. Mỗi năm tiếp theo, lương tăng thêm $15$ triệu đồng. Hỏi tổng số tiền lương anh A nhận được sau $10$ năm làm việc là bao nhiêu?],
  (
    [$255$ triệu],
    True([$1875$ triệu]),
    [$1350$ triệu],
    [$2700$ triệu]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Cấp số cộng có $u_1 = 120, d = 15$. Số tiền lương nhận được sau 10 năm chính là $S_10$. \
    $S_(10) = 10/2 [2(120) + 9(15)] = 5 [240 + 135] = 5 times 375 = 1875$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Một chiếc đồng hồ quả lắc đánh chuông theo giờ. Vào lúc 1 giờ đánh 1 tiếng, lúc 2 giờ đánh 2 tiếng, ..., lúc 12 giờ đánh 12 tiếng. Ngoài ra, cứ mỗi nửa giờ (lúc 1h30, 2h30...) đồng hồ lại đánh 1 tiếng chuông. Hỏi trong một ngày đêm (24 giờ), đồng hồ quả lắc đó đánh tổng cộng bao nhiêu tiếng chuông?],
  (
    [156],
    True([180]),
    [204],
    [300]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Trong một chu kỳ 12 giờ (từ lúc sau 12h đến 12h): \
    - Số tiếng chuông đánh vào các giờ đúng là tổng cấp số cộng: $S = 1 + 2 + ... + 12 = (12 times 13)/2 = 78$ tiếng. \
    - Số tiếng chuông đánh vào các nửa giờ (từ 1h30 đến 12h30) gồm 12 lần, mỗi lần 1 tiếng, tổng cộng là 12 tiếng. \
    Tổng cộng chuông đánh trong 12 giờ là: $78 + 12 = 90$ tiếng. \
    Trong một ngày đêm (24 giờ, gồm hai chu kỳ 12 giờ), tổng số tiếng chuông là: $90 times 2 = 180$ tiếng.]
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw stage
    rect((-1.5, -0.6), (1.5, -0.2), fill: rgb("cbd5e1"), stroke: gray)
    content((0, -0.4), text(size: 8pt)[SÂN KHẤU])
    
    // Draw concentric arcs or trapezoidal rows of seating
    for r in (0, 1, 2, 3) {
      let y = 0.3 + r * 0.4
      let w = 1.2 + r * 0.6
      line((-w, y), (w, y), stroke: 1.5pt + c-book)
      content((w + 0.5, y), text(size: 7pt, fill: luma(100))[Hàng #(r+1)])
    }
  }),
  [Một nhà hát có 25 hàng ghế xếp theo dạng hình thang cân mở rộng dần về phía sau như hình vẽ. Hàng đầu tiên có 16 ghế, mỗi hàng sau nhiều hơn hàng ngay trước nó 2 ghế. Hỏi nhà hát có tổng cộng bao nhiêu ghế?],
  (
    [800],
    [900],
    True([1000]),
    [1100]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số ghế ở các hàng lập thành CSC có $u_1 = 16, d = 2$. \
    Tổng số ghế ở 25 hàng là: $S_(25) = 25/2 [2 u_1 + 24d] = 25/2 [2(16) + 24(2)] = 25/2 [32 + 48] = 25 times 40 = 1000$ ghế.]
  ]
))

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: 3)

#q-wrap(dir: "doc", ds(
  [Xét cấp số cộng $(u_n)$ biết $u_3 + u_(13) = 80$. Xét tính đúng/sai:],
  (
    True([Tổng $u_1 + u_(15) = 80$.]),
    True([Số hạng thứ 8 của dãy là $u_8 = 40$.]),
    True([Tổng của 15 số hạng đầu tiên là $S_(15) = 600$.]),
    [Chắc chắn cấp số cộng này là một dãy số tăng.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Tính chất: $u_3 + u_(13) = u_1 + u_(15) = 2u_1 + 14d$. \
    b) Đúng. $u_3 + u_(13) = 2 u_8 => u_8 = 80/2 = 40$. \
    c) Đúng. $S_(15) = 15/2 (u_1 + u_(15)) = 15/2 times 80 = 600$. \
    d) Sai. Có thể cấp số cộng này giảm hoặc không đổi nếu $d <= 0$.]
  ]
))

#q-wrap(dir: "doc", ds(
  [Một dây chuyền trị giá 3 tỷ đồng. Khấu hao theo đường thẳng (giá trị giảm dần theo cấp số cộng) trong 15 năm, lượng tiền khấu hao mỗi năm là như nhau. Sau 15 năm giá trị máy bằng $0$.],
  (
    True([Mức khấu hao mỗi năm là $200$ triệu đồng.]),
    [Giá trị còn lại là một cấp số cộng có công sai $d = 200$.],
    True([Vào cuối năm thứ 5, giá trị còn lại của máy là $2$ tỷ đồng.]),
    [Tổng số tiền trích khấu hao lũy kế đến hết năm thứ 10 là $1.5$ tỷ đồng.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Mỗi năm giảm $3000 / 15 = 200$ triệu. \
    b) Sai. Giá trị giảm dần nên công sai phải là $d = -200$. \
    c) Đúng. Cuối năm 5 (tương đương đầu năm 6): $u_6 = u_1 + 5d = 3000 - 1000 = 2000$ (tức 2 tỷ). \
    d) Sai. 10 năm trích được $10 times 200 = 2000$ triệu = $2$ tỷ đồng.]
  ]
))

#q-wrap(dir: "doc", ds(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw two side rails of the ladder
    line((-0.5, 3), (-0.8, 0), stroke: 2pt + rgb("854d0e")) 
    line((0.5, 3), (0.8, 0), stroke: 2pt + rgb("854d0e")) 
    
    // Draw 6 rungs of the ladder 
    for i in range(0, 6) {
      let t = i / 5
      let y = t * 2.8 + 0.1
      let half_w = (1 - t) * 0.8 + t * 0.5
      line((-half_w, y), (half_w, y), stroke: 1.5pt + rgb("a16207"))
    }
  }),
  [Một cái thang gỗ có 10 bậc. Chiều dài các bậc thang từ dưới lên trên giảm dần đều (lập thành một cấp số cộng). Bậc dưới cùng dài $80$ cm, bậc trên cùng dài $50$ cm. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Chiều dài của các bậc thang lập thành một cấp số cộng giảm với công sai $d = -10/3$ cm.]),
    True([Bậc thang thứ 5 (tính từ dưới lên) có chiều dài là $200/3$ cm.]),
    True([Tổng chiều dài thanh gỗ dùng để làm các bậc thang là $6.5$ mét.]),
    [Bậc thang ở chính giữa (bậc thứ 6 tính từ dưới lên) có chiều dài là $65$ cm.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Ta coi bậc dưới cùng là $u_1 = 80$, bậc trên cùng là $u_(10) = 50$. \
    Ta có: $u_(10) = u_1 + 9d <=> 50 = 80 + 9d => 9d = -30 => d = -10/3$ cm. \
    b) Đúng. Bậc thứ 5 từ dưới lên: $u_5 = u_1 + 4d = 80 + 4(-10/3) = 240/3 - 40/3 = 200/3$ cm. \
    c) Đúng. Tổng chiều dài các bậc thang là: $S_(10) = 10/2 (u_1 + u_(10)) = 5 times (80 + 50) = 650$ cm = $6.5$ m. \
    d) Sai. Bậc thứ 6 tính từ dưới lên là: $u_6 = u_1 + 5d = 80 + 5(-10/3) = 80 - 50/3 = 190/3 approx 63.33$ cm chứ không phải $65$ cm.]
  ]
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 9)

#q-wrap(dir: "doc", tln(
  [Cho cấp số cộng $(u_n)$ có công sai $d > 0$. Biết $u_2 u_5 = 54$ và $u_1 + u_6 = 15$. Tính giá trị của $u_4$.],
  [8],
  loigiai: [
    #step[*B1: Sử dụng tính chất đối xứng:* \
      Ta có $u_1 + u_6 = u_2 + u_5 = 15$. Hai số $u_2, u_5$ có tổng bằng 15, tích bằng 54.]
    #step[*B2: Giải phương trình bậc hai:* \
      Giải phương trình $X^2 - 15X + 54 = 0$ được hai nghiệm 6 và 9. \
      Vì công sai $d > 0$ nên $u_2 < u_5$. Vậy $u_2 = 6, u_5 = 9$.]
    #step[*B3: Tìm số hạng cần thiết:* \
      Khoảng cách $u_5 - u_2 = 3d => 3d = 3 => d=1$. \
      Khi đó $u_4 = u_5 - d = 9 - 1 = 8$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Kỹ sư A nhận hợp đồng khoan cái giếng sâu $50$ mét. Bảng báo giá: mét đầu giá $100$ nghìn. Từ mét thứ 2, mỗi mét sâu thêm có giá đắt hơn mét ngay trước đó $20$ nghìn. Tổng chi phí khoan xong giếng là bao nhiêu triệu đồng?],
  [29.5],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Chi phí mỗi mét lập thành CSC với $u_1 = 100, d = 20$. Số mét $n = 50$. \
    Tổng chi phí: $S_(50) = 50/2 [2(100) + 49(20)] = 25 [200 + 980] = 25 times 1180 = 29500$ nghìn. \
    Đổi ra triệu đồng: $29.5$ triệu.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Kim tự tháp gạch: Tầng trên cùng có $1$ viên. Tầng thứ 2 có $4$ viên. Tầng thứ 3 có $7$ viên. Kim tự tháp có tất cả $20$ tầng. Tổng số viên gạch cần dùng là bao nhiêu?],
  [590],
  loigiai: [
    #step[*B1: Xác định dãy số:* \
      Số gạch tạo thành CSC: $1, 4, 7...$ có $u_1 = 1, d = 3$.]
    #step[*B2: Tính tổng 20 tầng:* \
      $S_(20) = 20/2 [2(1) + 19(3)] = 10 [2 + 57] = 590$ viên.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một học sinh đặt kế hoạch tiết kiệm tiền mua xe đạp. Tháng thứ nhất tiết kiệm được $200$ nghìn đồng. Kể từ tháng thứ hai, mỗi tháng tiết kiệm được nhiều hơn tháng ngay trước đó $30$ nghìn đồng. Hỏi sau đúng $2$ năm ($24$ tháng), tổng số tiền học sinh đó tiết kiệm được là bao nhiêu triệu đồng?],
  [13.08],
  loigiai: [
    #step[*B1: Mô hình hóa dòng tiền:* \
      Số tiền tiết kiệm mỗi tháng lập thành CSC có $u_1 = 200$ nghìn đồng, $d = 30$ nghìn đồng. Số tháng tiết kiệm $n = 24$.]
    #step[*B2: Tính tổng tiền tiết kiệm:* \
      Tổng số tiền tích lũy được: $S_(24) = 24/2 [2(200) + 23(30)] = 12 [400 + 690] = 13080$ nghìn đồng. \
      Đổi ra triệu đồng: $13.08$ triệu đồng.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một dàn pin năng lượng mặt trời có các tấm pin được xếp thành hình thang cân. Hàng trên cùng (hàng thứ nhất) có $12$ tấm pin. Mỗi hàng ngay dưới xếp nhiều hơn hàng ngay trên nó $3$ tấm pin. Hàng dưới cùng có $57$ tấm pin. Tính tổng số tấm pin được lắp đặt trên dàn này.],
  [552],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số tấm pin ở mỗi hàng lập thành CSC có $u_1 = 12, d = 3$. \
    Hàng cuối cùng có $u_n = 57$. Ta có: \
    $u_n = u_1 + (n-1)d <=> 57 = 12 + (n-1) times 3 => n = 16$ hàng. \
    Tổng số tấm pin lắp đặt: $S_(16) = 16/2 (u_1 + u_(16)) = 8 times (12 + 57) = 552$ tấm pin.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một vận động viên chạy bộ lên kế hoạch tập luyện chuẩn bị cho một giải chạy Marathon. Ngày đầu tiên anh chạy $5$ km. Kể từ ngày thứ hai, mỗi ngày anh tăng quãng đường chạy thêm $800$ mét so với ngày ngay trước đó. Hỏi sau đúng $30$ ngày tập luyện liên tục, tổng quãng đường vận động viên này đã chạy được là bao nhiêu kilômét?],
  [498],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Quãng đường chạy mỗi ngày lập thành một CSC với $u_1 = 5$ km, công sai $d = 800$ m = $0.8$ km. \
    Tổng quãng đường chạy được sau 30 ngày tập luyện là: \
    $S_(30) = 30/2 [2 u_1 + 29d] = 15 times [2(5) + 29(0.8)] = 15 times [10 + 23.2] = 15 times 33.2 = 498$ km.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một mỏ khai thác than dự kiến bắt đầu khai thác từ năm 2026 với sản lượng $5.2$ triệu tấn. Do điều kiện địa chất khó khăn, kể từ năm thứ hai, sản lượng khai thác dự kiến giảm $0.15$ triệu tấn mỗi năm so với năm trước đó. Tính tổng sản lượng than dự kiến khai thác được của mỏ này sau đúng $12$ năm hoạt động (triệu tấn).],
  [52.5],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Sản lượng than khai thác mỗi năm lập thành một CSC với $u_1 = 5.2$, công sai $d = -0.15$. \
    Tổng sản lượng khai thác sau 12 năm là: \
    $S_(12) = 12/2 [2 u_1 + 11d] = 6 times [2(5.2) + 11(-0.15)] = 6 times [10.4 - 1.65] = 6 times 8.75 = 52.5$ triệu tấn.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Tính tổng của tất cả các số tự nhiên có hai chữ số chia hết cho 3.],
  [1665],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Các số tự nhiên có hai chữ số chia hết cho 3 lập thành một cấp số cộng:
    $12, 15, 18, ..., 99$
    với số hạng đầu $u_1 = 12$, công sai $d = 3$ và số hạng cuối $u_n = 99$. \
    Số lượng các số hạng là:
    $ n = (99 - 12) / 3 + 1 = 30. $
    Tổng của cấp số cộng này là:
    $ S_(30) = 30/2 (u_1 + u_n) = 15 times (12 + 99) = 1665. $]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số cộng $(u_n)$ có tổng $n$ số hạng đầu tiên được tính bằng công thức $S_n = 3n^2 + 5n$ với mọi $n >= 1$. Tìm công sai $d$ của cấp số cộng đó.],
  [6],
  loigiai: [
    #step[*B1: Tìm $u_1$ và $u_2$:* \
      Ta có:
      - Với $n = 1$: $S_1 = u_1 = 3(1)^2 + 5(1) = 8$. \
      - Với $n = 2$: $S_2 = u_1 + u_2 = 3(2)^2 + 5(2) = 22$. \
      Từ đó suy ra số hạng thứ hai: $u_2 = S_2 - u_1 = 22 - 8 = 14$.]
    #step[*B2: Tính công sai:* \
      Công sai của cấp số cộng là: $d = u_2 - u_1 = 14 - 8 = 6$.]
  ]
))



