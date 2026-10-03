#import "../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI3
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
  title:       "BÀI 3: CẤP SỐ NHÂN",
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


#slide[ = Sức mạnh khủng khiếp của Lãi Kép ]
- Giai thoại Ấn Độ: Người phát minh ra cờ vua xin phần thưởng là những hạt thóc trên bàn cờ. Ô thứ nhất $1$ hạt, ô thứ hai $2$ hạt, ô thứ ba $4$ hạt... Nhà vua tưởng rất ít, nhưng tổng số thóc lại đủ che phủ toàn bộ Trái Đất! Đó chính là sức mạnh của sự *tăng trưởng bùng nổ* của Cấp số nhân.
- *Albert Einstein* từng nói: "Lãi suất kép là kỳ quan thứ 8 của thế giới. Những ai hiểu được nó sẽ kiếm được nó, ai không hiểu sẽ phải trả giá cho nó."
- Việc lây lan của virus trong đại dịch, phản ứng phân hạch hạt nhân, hay gửi tiết kiệm ngân hàng... tất cả đều là hiện thân của Cấp Số Nhân.


#slide[ = Cơ sở lý thuyết ]




Truyền thuyết kể rằng, một nhà thông thái Ấn Độ đã tặng vua bàn cờ vua. Vua hỏi thưởng gì, ông đáp: "1 hạt thóc vào ô thứ nhất, 2 hạt vào ô hai, 4 hạt vào ô ba, cứ thế gấp đôi đến ô 64". Vua cười nhạo. Nhưng tổng số thóc tính ra là $18,446,744,073,709,551,615$ hạt, tương đương toàn bộ sản lượng lúa mạch của Trái Đất trong 1500 năm!
Sức mạnh khủng khiếp đó chính là *Cấp số nhân*.

---



#block(breakable: false)[
  #phuongphap(title: [Định nghĩa & Số hạng tổng quát])[
    Cấp số nhân (CSN) là dãy số thỏa mãn: $u_n = u_(n-1) dot q$.
    - $q$: Công bội. 
    - *Công thức "nhảy cóc" (Số hạng tổng quát):*
      $ u_n = u_1 dot q^(n - 1) $
    (Sự khác biệt cốt lõi: CSC là "cộng dồn", CSN là "nhân gấp bội").
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Tính chất nội tại của 3 số liên tiếp])[
    Ba số $a, b, c$ lập thành cấp số nhân khi và chỉ khi:
    $ a dot c = b^2 <=> |b| = sqrt(a c) $
    (Số ở giữa luôn là Trung bình nhân của hai số hai bên).
    *Mở rộng:* $u_k^2 = u_(k-m) dot u_(k+m)$.
  ]
]



#block(breakable: false)[
  #phuongphap(title: [Công thức tính tổng $S_n$])[
    Tổng $S_n = u_1 + u_2 + ... + u_n$ được tính bằng:
    $ S_n = u_1 (1 - q^n) / (1 - q) quad (q != 1) $
    *Lưu ý:* Nếu $q=1$, dãy số là hằng số nên $S_n = n dot u_1$.
  ]
]





#block(breakable: false)[
  #phuongphap(title: [Mô hình 1: Tài chính Kế toán (Lãi kép & Gửi góp định kỳ)])[
    *1. Lãi kép (Compound Interest):* Gửi 1 cục tiền $A$ với lãi $r$. Tiền thành Cấp số nhân.
    $ T_n = A(1+r)^n $
    *2. Gửi góp định kỳ (Annuity):* Đầu MỖI THÁNG đều đặn gửi $A$ đồng. Cuối tháng $n$ thu về bao nhiêu?
    Đây là tổng của $n$ cái Cấp số nhân khác nhau:
    $ S_n = A/r (1+r) [(1+r)^n - 1] $
    *(Đây là công thức bắt buộc phải thuộc nếu muốn làm bài điểm 9, 10).*
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      *Đồ thị tăng trưởng lãi kép (CSN)* \ \
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Axes
        line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
        content((5.2, -0.4), [kỳ $n$])
        line((0, 0), (0, 4.2), stroke: 1pt + gray, mark: (end: ">"))
        content((-0.4, 4.0), [$T_n$])
        
        // Bars
        let heights = (0.6, 0.84, 1.18, 1.65, 2.31, 3.23)
        let pts = ()
        for i in range(0, 6) {
          let h = heights.at(i)
          pts.push((i, h))
          rect((i - 0.2, 0), (i + 0.2, h), fill: rgb("bae6fd"), stroke: c-book)
          if i == 0 {
            content((i, h + 0.3), text(size: 7pt)[$A$])
          } else if i == 1 {
            content((i, h + 0.3), text(size: 7pt)[$T_1$])
          } else if i == 2 {
            content((i, h + 0.3), text(size: 7pt)[$T_2$])
          } else if i == 5 {
            content((i, h + 0.3), text(size: 7pt)[$T_n$])
          }
          content((i, -0.3), text(size: 7pt)[#i])
        }
        // Trend line
        line(..pts, stroke: 1.2pt + rgb("dc2626"))
      })
    ],
    [
      *Sơ đồ tích lũy gửi góp về tương lai* \ \
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        
        // Timeline axis
        line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
        content((5.2, -0.4), [Thời gian])
        
        // Ticks
        content((0, 0.3), [0])
        content((1.2, 0.3), [1])
        content((2.4, 0.3), [2])
        content((3.6, 0.3), [...])
        content((4.8, 0.3), [$n-1$])
        content((5.5, 0.3), [$n$])
        
        // Deposits A (downward arrows)
        line((0, 0), (0, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((0, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((1.2, 0), (1.2, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((1.2, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((2.4, 0), (2.4, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((2.4, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        line((4.8, 0), (4.8, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
        content((4.8, -1.1), text(size: 7pt, fill: blue)[$A$])
        
        // Upward arrow S_n at t=n
        line((5.5, 0), (5.5, 2.5), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
        content((5.5, 2.8), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[$S_n$])
        
        // Accumulation curves (forward Bezier curves above axis)
        bezier((0, 0), (5.5, 0.1), (2.75, 1.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((2.0, 1.1), text(size: 7pt, fill: gray)[$A(1+r)^n$])
        
        bezier((1.2, 0), (5.5, 0.3), (3.35, 1.4), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((3.35, 0.8), text(size: 7pt, fill: gray)[$A(1+r)^(n-1)$])
        
        bezier((4.8, 0), (5.5, 0.5), (5.15, 0.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
        content((5.15, 0.4), text(size: 7pt, fill: gray)[$A(1+r)$])
      })
    ]
  )
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 2: Vật lý Hạt nhân - Phân rã Carbon-14])[
    Đồng vị Carbon-14 có chu kỳ bán rã khoảng 5730 năm (cứ sau 5730 năm, lượng $"C14"$ trong hóa thạch giảm đi một nửa).
    Lượng $"C14"$ còn lại theo thời gian $t$ là một Cấp số nhân:
    $ M(t) = M_0 dot (1/2)^(t/5730) $
    Nhờ công thức này, các nhà khảo cổ đo lượng Carbon còn lại để đoán chính xác xương khủng long hay xác ướp Ai Cập sống cách đây bao nhiêu ngàn năm.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3: Hình học Fractal - Bông tuyết Koch])[
    Bắt đầu từ 1 tam giác đều cạnh $a$. Ở mỗi bước, chia mỗi cạnh làm 3 đoạn, xây 1 tam giác đều nhỏ lên đoạn giữa.
    - Chu vi bông tuyết tăng theo CSN công bội $q = 4/3 > 1 =>$ Chu vi tiến tới vô cực!
    - Tuy nhiên, diện tích của bông tuyết thêm vào ở bước thứ $n$ là một CSN với $q = 4/9 < 1 =>$ Diện tích tổng cộng sẽ tiến dần đến một mức cố định!
    *Nghịch lý: Một hình có chu vi dài vô tận nhưng lại có thể nhét vừa trong một mảnh giấy hữu hạn!*
  ]
]

#align(center)[
  *Quy trình dựng Đường cong Koch (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Step 0: Line at y=5.0
    draw-koch-curve(0, 5.0, 6, 5.0, 0, 0, 1.2pt + c-book)
    content((3, 4.6), text(size: 9pt)[Bước 0: 1 đoạn thẳng độ dài $a$])
    
    // Step 1: Line at y=2.5
    draw-koch-curve(0, 2.5, 6, 2.5, 0, 1, 1.2pt + c-book)
    content((3, 2.1), text(size: 9pt)[Bước 1: 4 đoạn thẳng, mỗi đoạn độ dài $a/3$ (Chu vi = $4/3 a$)])
    
    // Step 2: Line at y=0.0
    draw-koch-curve(0, 0.0, 6, 0.0, 0, 2, 1pt + c-book)
    content((3, -0.4), text(size: 9pt)[Bước 2: 16 đoạn thẳng, mỗi đoạn độ dài $a/9$ (Chu vi = $16/9 a$)])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3b: Hình học Fractal - Tam giác Sierpinski & Thảm Sierpinski])[
    Tam giác Sierpinski và Thảm Sierpinski là các cấu trúc phân hình kinh điển khác, được tạo thành bằng cách loại bỏ liên tiếp các phần hình học ở giữa theo tỷ lệ cấp số nhân.
    - *Tam giác Sierpinski*: Mỗi bước loại bỏ $1/4$ diện tích còn lại ở giữa (công bội diện tích chưa tô là $q = 3/4 < 1$).
    - *Thảm Sierpinski*: Một hình vuông chia thành 9 hình vuông nhỏ, loại bỏ ô chính giữa. Ở mỗi bước tiếp theo, diện tích phần còn lại nhân với công bội $q = 8/9 < 1$.
    Cả hai hình này đều có diện tích phần còn lại tiến về $0$ khi số bước thực hiện tiến đến vô cùng!
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    align(center)[
      *Tam giác Sierpinski (Cấp 4)* \
      #cetz.canvas(length: 1.0cm, {
        import cetz.draw: *
        line((0, 0), (4, 0), (2, 3.464), close: true, fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
        draw-sierpinski(0, 0, 4, 0, 2, 3.464, 1, 5, rgb("#f6f8f4"), 0.3pt + c-book)
      })
    ],
    align(center)[
      *Thảm Sierpinski (Cấp 3)* \
      #cetz.canvas(length: 1.0cm, {
        import cetz.draw: *
        rect((0, 0), (4, 4), fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
        draw-sierpinski-carpet(0, 0, 4, 4, 1, 5, rgb("#f6f8f4"), 0.3pt + c-book)
      })
    ]
  )
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 3c: Hình học Fractal Mở rộng (3D & Cây phân nhánh)])[
    Ngoài các dạng cơ bản, hình học Fractal còn ứng dụng vào việc tạo ra các cấu trúc 3D phức tạp hoặc mô phỏng sự phân nhánh của cây xanh trong tự nhiên.
    - *Tứ diện Sierpinski (Tetrix)*: Mở rộng của Tam giác Sierpinski trong không gian 3D. Mỗi bước chia một tứ diện thành 4 tứ diện nhỏ hơn ở các góc. Khối lượng/Thể tích giảm dần về 0 nhưng diện tích bề mặt không đổi!
    - *Cây Pythagoras (Pythagoras Tree)*: Một fractal được xây dựng bằng cách vẽ các hình vuông. Từ một hình vuông gốc, xây dựng một tam giác vuông cân trên cạnh trên, rồi tiếp tục xây dựng các hình vuông trên hai cạnh góc vuông của tam giác đó.
    - *Cây nhị phân (Fractal Canopy)*: Mô phỏng sự phát triển của cành cây bằng cách lặp lại quy tắc rẽ nhánh theo một góc cố định, chiều dài cành giảm dần theo cấp số nhân.
  ]
]

#align(center)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10pt,
    align(center)[
      *Tứ diện Sierpinski 3D* \
      #cetz.canvas(length: 1cm, {
        let p1 = (0, 3)
        let p2 = (-2, -1)
        let p3 = (2, -1)
        let p4 = (0, -2)
        draw-sierpinski-3d(p1, p2, p3, p4, 0, 4, rgb("38bdf8"), rgb("0284c7"))
      })
    ],
    align(center)[
      *Cây Pythagoras* \
      #cetz.canvas(length: 1cm, {
        draw-pythagoras-tree(-0.5, 0, 0.5, 0, 0, 6, rgb("22c55e"))
      })
    ],
    align(center)[
      *Cây Fractal (Canopy)* \
      #cetz.canvas(length: 1cm, {
        draw-fractal-canopy(0, 0, 0, 1.5, 0, 8, 25deg, 0.75, 0.8pt + rgb("84cc16"))
      })
    ]
  )
]


#block(breakable: false)[
  #phuongphap(title: [Mô hình 4: Sinh học - Sự phân đôi tế bào / Vi khuẩn (Binary Fission)])[
    Tế bào vi khuẩn Escherichia coli (E. coli) trong điều kiện lý tưởng cứ sau 20 phút lại phân đôi một lần.
    - Ban đầu có $1$ tế bào ($u_1 = 1$).
    - Sau 20 phút (thế hệ 2) có $2$ tế bào ($u_2 = 2$).
    - Sau 40 phút (thế hệ 3) có $4$ tế bào ($u_3 = 4$).
    Số tế bào ở thế hệ thứ $n$ lập thành một Cấp số nhân với $u_1 = 1$, công bội $q = 2$.
    - Công thức tổng quát: $u_n = 2^(n-1)$.
    - Sau 4 giờ (tương ứng với 12 chu kỳ phân đôi, tức thế hệ thứ 13):
      $ u_(13) = 2^(12) = 4096 text(" tế bào.") $
  ]
]

#align(center)[
  *Sơ đồ phân đôi tế bào (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    circle((0, 2), radius: 0.3, fill: rgb("bae6fd"), stroke: c-book)
    content((0, 2), text(size: 8pt, weight: "bold")[$u_1$])
    
    circle((-1.5, 0.5), radius: 0.3, fill: rgb("7dd3fc"), stroke: c-book)
    content((-1.5, 0.5), text(size: 8pt, weight: "bold")[$u_2$])
    circle((1.5, 0.5), radius: 0.3, fill: rgb("7dd3fc"), stroke: c-book)
    content((1.5, 0.5), text(size: 8pt, weight: "bold")[$u_2$])
    
    circle((-2.25, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((-2.25, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((-0.75, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((-0.75, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((0.75, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((0.75, -1), text(size: 8pt, weight: "bold")[$u_3$])
    circle((2.25, -1), radius: 0.3, fill: rgb("38bdf8"), stroke: c-book)
    content((2.25, -1), text(size: 8pt, weight: "bold")[$u_3$])
    
    line((0, 1.7), (-1.5, 0.8), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((0, 1.7), (1.5, 0.8), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    
    line((-1.5, 0.2), (-2.25, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((-1.5, 0.2), (-0.75, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((1.5, 0.2), (0.75, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    line((1.5, 0.2), (2.25, -0.7), stroke: 0.8pt + gray, mark: (end: ">", size: 0.15))
    
    content((-4, 2), text(size: 8pt, fill: luma(100))[Ban đầu ($t=0$)])
    content((-4, 0.5), text(size: 8pt, fill: luma(100))[Sau 20 phút])
    content((-4, -1), text(size: 8pt, fill: luma(100))[Sau 40 phút])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 5: Vật lý - Quả bóng nảy giảm độ cao (Bouncing Ball)])[
    Một quả bóng được thả từ độ cao ban đầu $H$. Mỗi lần chạm đất, nó nảy lên độ cao bằng $q$ lần độ cao trước đó ($0 < q < 1$).
    - Quãng đường di chuyển gồm: rơi lần đầu ($H$), các lần nảy lên và rơi xuống tiếp theo ($2 H q, 2 H q^2, 2 H q^3...$).
    - Tổng quãng đường di chuyển sau $n$ lần chạm đất là:
      $ S_n = H + 2 H q + 2 H q^2 + ... + 2 H q^n $
      $ S_n = H + 2 H q (1 + q + q^2 + ... + q^(n-1)) $
    - Áp dụng công thức tổng Cấp số nhân:
      $ S_n = H + 2 H q (1 - q^n) / (1 - q) $
    *Ví dụ:* Nếu $H = 10$ m và $q = 3/4$, sau 5 lần chạm đất, tổng quãng đường sẽ là $S_5 = 10 + 2(10)(3/4) (1 - (3/4)^5) / (1 - 3/4) \\approx 55.7$ m.
  ]
]

#align(center)[
  *Quỹ đạo nảy giảm độ cao của quả bóng (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    line((-1, 0), (7, 0), stroke: 1.5pt + gray)
    
    line((0, 3), (0, 0), stroke: (paint: c-book, dash: "dashed"), mark: (end: ">", size: 0.15))
    circle((0, 3), radius: 0.15, fill: red, stroke: red)
    content((-0.4, 1.5), text(size: 8pt)[$H$])
    
    bezier((0, 0), (2, 0), (1, 4.5), stroke: 1.2pt + c-book)
    circle((1, 2.25), radius: 0.08, fill: red, stroke: none)
    content((1, 2.5), text(size: 8pt)[$H q$])
    
    bezier((2, 0), (3.5, 0), (2.75, 3.375), stroke: 1.2pt + c-book)
    circle((2.75, 1.6875), radius: 0.08, fill: red, stroke: none)
    content((2.75, 1.9), text(size: 8pt)[$H q^2$])
    
    bezier((3.5, 0), (4.625, 0), (4.06, 2.52), stroke: 1.2pt + c-book)
    bezier((4.625, 0), (5.46, 0), (5.04, 1.88), stroke: 1.2pt + c-book)
    
    content((6.2, 0.3), [...])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Ví dụ bổ sung: Con lắc đơn dao động tắt dần (Cấp số nhân)])[
    Khi một con lắc đơn dao động, do lực cản của không khí và ma sát ở chốt treo, biên độ dao động (chiều dài quãng đường mỗi lần vung từ biên này sang biên kia) giảm dần theo cấp số nhân.
    - Lần vung đầu tiên dài $u_1$ cm.
    - Lần vung thứ hai dài $u_2 = u_1 dot q$ cm ($0 < q < 1$).
    - Tổng quãng đường con lắc di chuyển được sau $n$ lần vung là:
      $ S_n = u_1 (1 - q^n) / (1 - q) $
  ]
]

#align(center)[
  *Quỹ đạo dao động tắt dần của con lắc đơn (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Ceiling
    line((-2, 3), (2, 3), stroke: 1.5pt + gray)
    circle((0, 3), radius: 0.06, fill: black)
    
    // Axis
    line((0, 3), (0, 0), stroke: (paint: gray, dash: "dotted"))
    
    // Swing 1 (left side): length 3, angle 30 degrees
    let x1 = -1.5
    let y1 = 0.402
    line((0, 3), (x1, y1), stroke: 0.8pt + gray)
    circle((x1, y1), radius: 0.2, fill: rgb("bae6fd"), stroke: c-book)
    content((x1 - 0.4, y1 - 0.4), text(size: 8pt)[$u_1$])
    
    // Swing 2 (right side): angle 20 degrees
    let x2 = 1.026
    let y2 = 0.181
    line((0, 3), (x2, y2), stroke: (paint: gray, dash: "dashed"))
    circle((x2, y2), radius: 0.17, fill: rgb("7dd3fc"), stroke: c-book.lighten(20%))
    content((x2 + 0.4, y2 - 0.4), text(size: 8pt)[$u_2$])
    
    // Swing 3 (left side): angle 14 degrees
    let x3 = -0.725
    let y3 = 0.09
    line((0, 3), (x3, y3), stroke: (paint: gray, dash: "dashed"))
    circle((x3, y3), radius: 0.14, fill: rgb("38bdf8"), stroke: c-book.lighten(40%))
    content((x3 - 0.4, y3 - 0.4), text(size: 8pt)[$u_3$])
    
    // Curved arrows for swing paths
    arc((0, 3), start: 240deg, stop: 290deg, radius: 2.8, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
    arc((0, 3), start: 290deg, stop: 256deg, radius: 2.6, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 6: Tài chính ngân hàng - Bài toán mua trả góp và Trục thời gian chiết khấu (Amortization)])[
    *Bản chất cốt lõi: Giá trị thời gian của tiền tệ (Time Value of Money).*
    Lãi suất phát sinh từ trục thời gian: một đồng tiền ở tương lai luôn có giá trị thấp hơn một đồng tiền ở hiện tại. 
    Khi mượn số tiền gốc $V$ tại thời điểm $t=0$, người mua hoàn trả định kỳ số tiền cố định $X$ vào cuối mỗi kỳ tại các thời điểm $t=1, 2, ..., N$. 
    - Để xóa hết nợ, tổng các khoản trả $X$ quy về giá trị hiện tại (Present Value - PV) ở thời điểm $t=0$ phải đúng bằng khoản nợ gốc:
      $ V = X / (1+r) + X / (1+r)^2 + ... + X / (1+r)^N $
    - Vế phải chính là tổng của một cấp số nhân hữu hạn gồm $N$ số hạng, số hạng đầu $u_1 = X / (1+r)$ và công bội $q = 1 / (1+r)$ ($q < 1$):
      $ V = u_1 dot (1 - q^N) / (1 - q) = X / (1+r) dot (1 - (1+r)^(-N)) / (1 - 1 / (1+r)) = X dot (1 - (1+r)^(-N)) / r $
    - Giải phương trình trên theo $X$, ta có công thức tính số tiền phải trả mỗi kỳ:
      $ X = (V dot r dot (1+r)^N) / ((1+r)^N - 1) $
  ]
]

#align(center)[
  *Sơ đồ quy đổi dòng tiền trả góp về hiện tại (Nguồn gốc lãi suất)* \
  #cetz.canvas(length: 1.2cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.8, 0.3), [Thời gian])
    
    // Ticks
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [$N$])
    
    // Upward arrow V at t=0
    line((0, 0), (0, 1.8), stroke: 2pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((0, 2.1), text(size: 9pt, fill: rgb("16a34a"), weight: "bold")[Vốn vay gốc $V$])
    
    // Repayments X at t=1, 2, N
    line((1.2, 0), (1.2, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((1.2, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    line((2.4, 0), (2.4, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((2.4, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    line((4.8, 0), (4.8, -1.2), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.15))
    content((4.8, -1.5), text(fill: rgb("dc2626"))[$X$])
    
    // Curved discounting arrows (Bezier curves going backwards below axis)
    bezier((1.2, -1.2), (0, -0.2), (0.6, -1.0), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((0.8, -0.6), text(size: 8pt, fill: blue)[$"PV"_1 = X/(1+r)$])
    
    bezier((2.4, -1.2), (0, -0.4), (1.2, -1.6), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((1.8, -1.1), text(size: 8pt, fill: blue)[$"PV"_2 = X/(1+r)^2$])
    
    bezier((4.8, -1.2), (0, -0.6), (2.4, -2.4), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.1))
    content((3.5, -1.8), text(size: 8pt, fill: blue)[$"PV"_N = X/(1+r)^N$])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 7: Y học - Liều dùng thuốc tích lũy và Nồng độ bão hòa (Steady State)])[
    Một bệnh nhân uống định kỳ một liều thuốc $D$ mg sau mỗi khoảng thời gian $T$ giờ. Giả sử giữa các lần uống, cơ thể đào thải $p\%$ lượng thuốc đang có (tức là còn lại tỷ lệ $q = 1 - p\%$ với $0 < q < 1$).
    - Lượng thuốc trong cơ thể ngay sau liều thứ $n$ liên tiếp là:
      $ u_n = D + D q + D q^2 + ... + D q^(n-1) = D (1 - q^n) / (1 - q) $
    - Khi điều trị nhiều ngày (ví dụ $n=30$), lượng thuốc trong cơ thể sẽ tiệm cận mức bão hòa (do $q^n approx 0$) và không tăng vô hạn gây ngộ độc:
      $ u_n approx D / (1 - q) = D / p\% $
    *Ví dụ:* Nếu uống $100$ mg mỗi ngày, cơ thể đào thải $40\%$ lượng thuốc ($q = 0.6$), tổng lượng thuốc không vượt quá $100 / (1 - 0.6) = 250$ mg dù uống lâu thế nào.
  ]
]

#align(center)[
  *Đồ thị nồng độ thuốc trong cơ thể tiệm cận giới hạn bão hòa (Cấp số nhân)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (7, 0), mark: (end: ">"))
    content((6.8, -0.4), [$t$ (Ngày)])
    line((0, 0), (0, 4.2), mark: (end: ">"))
    content((-0.6, 4.0), [$C$ (mg)])
    
    // Steady state limit line (y = 2.5 represents 250mg)
    line((0, 2.5), (6.5, 2.5), stroke: (paint: red, dash: "dashed"))
    content((5.8, 2.8), text(fill: red, size: 8pt)[Bão hòa $250$ mg])
    
    // We draw the sawtooth curve.
    let y_val = 0.0
    for i in range(0, 6) {
      let t_start = i
      let t_end = i + 1
      
      // Spike (vertical line)
      let spike_y = y_val + 1.0
      line((t_start, y_val), (t_start, spike_y), stroke: 1.2pt + c-book)
      
      // Decay curve
      let decay_y = spike_y * 0.6
      line((t_start, spike_y), (t_end, decay_y), stroke: 1.2pt + c-book)
      
      y_val = decay_y
      
      // Labels on time axis
      content((t_start, -0.3), text(size: 7pt)[#i])
    }
    
    // Label y-axis points
    content((-0.4, 1.0), [100])
    content((-0.4, 2.5), [250])
  })
]

#block(breakable: false)[
  #phuongphap(title: [Mô hình 8: Công nghệ môi trường - Hệ màng lọc nhiều lớp (Multi-Stage Filtration)])[
    Để xử lý nước thải công nghiệp, người ta dẫn nước qua hệ thống gồm nhiều màng lọc xếp liên tiếp. Mỗi màng lọc loại bỏ được đúng $30\%$ lượng chất độc hại còn lại trong nước.
    - Cường độ chất độc hại còn lại sau tấm lọc thứ $n$ lập thành một Cấp số nhân giảm với công bội $q = 1 - 0.3 = 0.7$.
    - Nếu nồng độ ban đầu là $C_0$, nồng độ sau $n$ lớp lọc là: $C_n = C_0 dot (0.7)^n$.
    - Để nồng độ chất hại giảm xuống dưới $5\%$ so với ban đầu ($C_n < 0.05 C_0$):
      $ 0.7^n < 0.05 => n > log_(0.7)(0.05) approx 8.39 $
    Do đó, hệ thống cần ít nhất $9$ lớp màng lọc để đảm bảo tiêu chuẩn xả thải.
  ]
]

#align(center)[
  *So sánh Tăng trưởng Tuyến tính (CSC) và Bùng nổ (CSN)* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Axes
    line((0, 0), (6, 0), mark: (end: ">"))
    content((5.8, -0.4), [$n$ (Thời gian)])
    line((0, 0), (0, 5), mark: (end: ">"))
    content((-0.5, 4.8), [$u_n$])
    
    // CSC (Linear)
    line((0, 0.5), (5, 2.5), stroke: 1.5pt + blue)
    content((5.5, 2.5), text(fill: blue)[CSC (Tuyến tính)])
    
    // CSN (Exponential)
    let csn-points = ()
    for i in range(0, 50) {
      let x = i * 0.1
      let y = 0.5 * calc.pow(1.6, x)
      csn-points.push((x, y))
    }
    line(..csn-points, stroke: 1.5pt + red)
    content((4, 4.5), text(fill: red)[CSN (Bùng nổ)])
  })
]


#slide[ = Bài tập Luyện tập ]


#resetexamstate()
#exam-part([PHẦN I. Câu trắc nghiệm nhiều phương án lựa chọn], count: 7)

#q-wrap(dir: "doc", tn(
  [Cho cấp số nhân $(u_n)$ có $u_1 = -2$ và công bội $q = 3$. Số hạng tổng quát của dãy số là công thức nào dưới đây?],
  (
    True([$u_n = -2 dot 3^(n-1)$]),
    [$u_n = -2 dot 3^n$],
    [$u_n = 3 dot (-2)^(n-1)$],
    [$u_n = (-6)^(n-1)$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Theo định nghĩa số hạng tổng quát của cấp số nhân: $u_n = u_1 dot q^(n-1)$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Cho cấp số nhân $(u_n)$ có $u_2 = 1/4$ và $u_5 = 16$. Công bội $q$ của cấp số nhân bằng bao nhiêu?],
  (
    True([$4$]),
    [$1/4$],
    [$8$],
    [$-4$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Ta có $u_5 = u_2 dot q^3 => 16 = 1/4 dot q^3 => q^3 = 64 => q = 4$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tính tổng 5 số hạng đầu của cấp số nhân $S_5 = 1 + 1/3 + 1/9 + ...$],
  (
    True([$121/81$]),
    [$121/243$],
    [$3/2$],
    [$1$]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Tổng của 5 số hạng đầu tiên của cấp số nhân với $u_1 = 1$, công bội $q = 1/3$. \
    $S_5 = u_1 (1 - q^5) / (1 - q) = 1 dot (1 - (1/3)^5) / (1 - 1/3) = (242/243) / (2/3) = 121/81$.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Dân số năm 2020 là 2 triệu người. Tốc độ tăng dân số mỗi năm là 1,5%. Dân số năm 2030 (sau 10 năm) ước tính là bao nhiêu?],
  (
    True([$2 dot (1.015)^10$ triệu người]),
    [$2 + 10 dot 1.015$ triệu người],
    [$2 dot (1.15)^10$ triệu người],
    [$2 dot (1.015)^9$ triệu người]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Dân số tạo thành cấp số nhân với $u_0 = 2$ triệu, công bội $q = 1 + 1.5% = 1.015$. \
    Dân số sau 10 năm là $u_10 = 2 dot 1.015^10$.]
  ]
))

#q-wrap(dir: "doc", tn(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (5.5, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.2, -0.3), [năm])
    
    // Ticks & Labels
    for i in range(0, 6) {
      line((i, -0.1), (i, 0.1), stroke: 0.8pt + gray)
      content((i, -0.3), text(size: 8pt)[#i])
    }
    
    // Initial amount at t=0
    line((0, 0), (0, 0.8), stroke: 1.5pt + blue, mark: (end: ">", size: 0.1))
    content((0, 1.1), text(size: 8pt, fill: blue)[100 tr])
    
    // Accumulation curves
    let vis_heights = (0.8, 1.0, 1.25, 1.55, 1.9, 2.3)
    for i in range(0, 5) {
      bezier((i, vis_heights.at(i) - 0.2), (i + 1, vis_heights.at(i + 1) - 0.2), (i + 0.5, vis_heights.at(i) + 0.1), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    }
    
    // Final amount at t=5
    line((5, 0), (5, 2.3), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.12))
    content((5, 2.6), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[134 tr])
  }),
  [Anh Bình gửi tiết kiệm ngân hàng 100 triệu đồng với hình thức lãi kép, kỳ hạn 1 năm, lãi suất 6%/năm. Sau 5 năm, tổng số tiền (cả gốc lẫn lãi) anh nhận được là bao nhiêu? (Làm tròn đến triệu đồng).],
  (
    [130 triệu],
    True([134 triệu]),
    [135 triệu],
    [106 triệu]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Sử dụng công thức lãi kép: $T = A(1+r)^n = 100(1+0.06)^5 approx 133.822$ triệu. Làm tròn thành 134 triệu.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Tế bào nấm men sinh sản bằng cách phân đôi mỗi phút. Ban đầu trong ống nghiệm có chứa $1$ tế bào nấm men. Hỏi sau ít nhất bao nhiêu phút thì số lượng tế bào nấm men trong ống nghiệm vượt quá $1$ triệu tế bào?],
  (
    [10 phút],
    [15 phút],
    True([20 phút]),
    [24 phút]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số tế bào nấm men sau $t$ phút là một cấp số nhân: $u_t = 1 dot 2^t = 2^t$ tế bào. \
    Ta cần tìm $t$ nguyên dương nhỏ nhất sao cho: $2^t > 10^6$. \
    Ta có $2^(19) = 524288 < 10^6$ và $2^(20) = 1048576 > 10^6$. \
    Vậy cần ít nhất 20 phút.]
  ]
))

#q-wrap(dir: "doc", tn(
  [Khi ánh sáng truyền qua một tấm kính dày, cường độ ánh sáng của nó giảm đi $10\%$ so với cường độ ban đầu. Người ta xếp chồng nhiều tấm kính cùng loại như vậy lên nhau. Để cường độ ánh sáng sau khi truyền qua hệ kính giảm đi nhiều hơn một nửa so với cường độ ban đầu, cần ít nhất bao nhiêu tấm kính?],
  (
    [5 tấm],
    [6 tấm],
    True([7 tấm]),
    [8 tấm]
  ),
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Gọi $I_0$ là cường độ ánh sáng ban đầu. Cường độ ánh sáng sau khi đi qua $n$ tấm kính là: \
    $I_n = I_0 dot (1 - 0.10)^n = I_0 dot 0.9^n$. \
    Để cường độ giảm nhiều hơn một nửa, ta cần: $I_n < 0.5 I_0 <=> 0.9^n < 0.5$. \
    Thử các giá trị của $n$: \
    - Với $n = 6$: $0.9^6 approx 0.531 > 0.5$. \
    - Với $n = 7$: $0.9^7 approx 0.478 < 0.5$. \
    Vậy cần ít nhất 7 tấm kính.]
  ]
))

#exam-part([PHẦN II. Câu trắc nghiệm đúng/sai], count: 3)

#q-wrap(dir: "doc", ds(
  [Ba số $x$, $y$, $z$ theo thứ tự lập thành một cấp số nhân. Biết tổng của chúng là 13 và tích của chúng là 27.],
  (
    True([Số $y$ chắc chắn bằng $3$.]),
    True([Tổng $x + z = 10$.]),
    [Có duy nhất một cấp số nhân thỏa mãn bài toán.],
    [Công bội của cấp số nhân đó bắt buộc phải lớn hơn 1.]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Tính chất CSN: $x z = y^2$. Từ giả thiết $x y z = 27 => y^3 = 27 => y = 3$. \
    b) Đúng. Vì $y=3$ nên $x + y + z = 13 => x + z = 10$. \
    c) Sai. Ta có $x+z=10$ và $x z=9$. Nghiệm của pt $X^2 - 10X + 9 = 0$ là 1 và 9. Suy ra có hai CSN: $(1, 3, 9)$ với $q=3$ và $(9, 3, 1)$ với $q=1/3$. \
    d) Sai. Tồn tại bộ $(9, 3, 1)$ có công bội $q=1/3 < 1$.]
  ]
))

#q-wrap(dir: "doc", ds(
  [Đồng vị Carbon-14 có chu kỳ bán rã là 5730 năm (sau mỗi 5730 năm, khối lượng C-14 giảm đi một nửa). Một mẩu xương hóa thạch hiện tại chứa 2.5 gram C-14. Các nhà khảo cổ xác định lúc sinh vật còn sống, xương có 20 gram C-14.],
  (
    True([Sau 5730 năm kể từ lúc chết, lượng C-14 còn lại 10 gram.]),
    True([Lượng C-14 còn lại sau mỗi chu kỳ bán rã lập thành một cấp số nhân.]),
    True([Sinh vật này đã chết cách đây khoảng 17190 năm.]),
    [Nếu chờ thêm 5730 năm nữa, lượng C-14 sẽ hoàn toàn biến mất (bằng 0).]
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Chu kỳ bán rã chia lượng ban đầu (20g) cho 2. Vậy còn 10g. \
    b) Đúng. Lượng C-14 giảm đi một nửa sau mỗi chu kỳ bán rã, tạo thành một cấp số nhân với công bội $q=1/2$. \
    c) Đúng. Lượng thay đổi: $20 -> 10 -> 5 -> 2.5$. Trải qua 3 chu kỳ. Thời gian: $3 times 5730 = 17190$ năm. \
    d) Sai. Sau 1 chu kỳ nữa còn 1.25g. Về lý thuyết nó tiến về giới hạn 0 chứ không bao giờ biến mất hoàn toàn.]
  ]
))

#q-wrap(dir: "doc", ds(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    
    // Step 0: Outer solid triangle
    line((0, 0), (4, 0), (2, 3.464), close: true, fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
  
    // Sierpinski cutouts (tô màu xám, depth 4)
    draw-sierpinski(0, 0, 4, 0, 2, 3.464, 1, 4, rgb("#f6f8f4"), 0.3pt + c-book)   
  }),   
  [Một hình tam giác đều có diện tích bằng $1$. Ở bước thứ nhất, người ta chia tam giác này thành $4$ tam giác đều nhỏ bằng nhau và tô màu xám tam giác ở chính giữa như hình vẽ (bỏ đi tam giác này). Ở bước kế tiếp, lặp lại quy trình trên đối với các tam giác đều chưa bị tô màu còn lại. Gọi $S_n$ là diện tích phần chưa bị tô màu sau bước thứ $n$. Xét tính đúng sai của các khẳng định sau:],
  (
    True([Diện tích phần chưa bị tô màu sau bước thứ nhất là $S_1 = 3/4$.]),
    [Dãy số $(S_n)$ lập thành một cấp số nhân có công bội $q = 1/4$.],
    True([Công thức diện tích phần chưa bị tô màu sau bước thứ $n$ là $S_n = (3/4)^n$.]),
    True([Sau đúng 10 bước thực hiện, diện tích phần đã bị tô màu xám vượt quá $94\%$ diện tích tam giác đều ban đầu.])
  ),
  loigiai: [
    #step[*Kiểm tra từng mệnh đề:* \
      a) Đúng. Sau bước 1, ta bỏ đi 1 tam giác ở giữa nên còn lại 3 tam giác nhỏ. Diện tích chưa tô là $3/4$ diện tích ban đầu. \
    b) Sai. Ở mỗi bước tiếp theo, diện tích chưa tô giảm đi một lượng bằng $1/4$ của chính nó, tức là nhân với công bội $q = 3/4$ chứ không phải $1/4$. \
    c) Đúng. Số hạng đầu $S_1 = 3/4$, công bội $q = 3/4$ nên $S_n = S_1 dot q^(n-1) = (3/4)^n$. \
    d) Đúng. Diện tích phần đã tô màu là $T_n = 1 - S_n = 1 - (3/4)^n$. \
    Với $n=10$, $T_(10) = 1 - (3/4)^(10) = 1 - 0.0563 = 0.9437 = 94.37\% > 94\%$.]
  ]
))

#exam-part([PHẦN III. Câu trắc nghiệm trả lời ngắn], count: 9)

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.7, -0.4), [tháng])
    
    // Ticks & Labels
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [35])
    content((5.8, 0.3), [36])
    
    // Deposits A=10 tr (downward arrows)
    line((0, 0), (0, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((0, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((1.2, 0), (1.2, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((1.2, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((2.4, 0), (2.4, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((2.4, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    line((4.8, 0), (4.8, -0.8), stroke: 1.2pt + blue, mark: (end: ">", size: 0.1))
    content((4.8, -1.1), text(size: 7pt, fill: blue)[10 tr])
    
    // Upward arrow S_36 at t=36
    line((5.8, 0), (5.8, 2.5), stroke: 1.8pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((5.8, 2.8), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[$S_(36)$])
    
    // Accumulation curves
    bezier((0, 0), (5.8, 0.1), (2.9, 1.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((2.0, 1.1), text(size: 7pt, fill: gray)[$10(1+r)^(36)$])
    
    bezier((1.2, 0), (5.8, 0.3), (3.5, 1.4), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((3.5, 0.8), text(size: 7pt, fill: gray)[$10(1+r)^(35)$])
    
    bezier((4.8, 0), (5.8, 0.5), (5.3, 0.8), stroke: (paint: gray, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((5.3, 0.4), text(size: 7pt, fill: gray)[$10(1+r)$])
  }),
  [Anh Cường tiết kiệm mua ô tô bằng hình thức *gửi góp định kỳ*. Vào *đầu mỗi tháng*, gửi vào tài khoản $10$ triệu đồng. Lãi suất tiết kiệm là $0.5%$/tháng. Hỏi sau đúng $36$ tháng, tổng số tiền (cả gốc và lãi) có được là bao nhiêu triệu đồng? (Làm tròn đến chữ số thập phân thứ nhất).],
  [395.3],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Sử dụng công thức tiền gửi góp định kỳ mỗi tháng: \
    $S_n = A/r (1+r) [(1+r)^n - 1]$ \
    $S_(36) = 10/0.005 (1.005) [(1.005)^(36) - 1] = 2000 times 1.005 times [(1.005)^36 - 1] approx 395.328$ triệu đồng. \
    Làm tròn được $395.3$.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Bông tuyết Koch: Bắt đầu từ tam giác đều có diện tích $S_0 = sqrt(3)/4$. Ở mỗi bước, thêm các tam giác nhỏ vào giữa các cạnh của hình hiện tại. Tổng diện tích của Bông tuyết Koch khi $n -> oo$ hội tụ về giá trị bằng $k$ lần diện tích tam giác ban đầu. Tìm $k$ (viết dạng phân số $a/b$, điền $a/b$).],
  [8/5],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Tổng diện tích Bông tuyết Koch được tính bằng: \
    $S_oo = S_0 + 3 S_0/9 + 12 S_0/81 + ... $ \
    Phần diện tích thêm vào ở mỗi bước lập thành một CSN với số hạng đầu là $S_1 = 1/3 S_0$ và công bội $q = 4/9$. \
    $S_oo = S_0 + (1/3 S_0) / (1 - 4/9) = S_0 + (1/3 S_0) / (5/9) = S_0 + 3/5 S_0 = 8/5 S_0$. \
    Vậy $k = 8/5$.]
  ]
))

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 45%,
  fig: cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Step 0: Outer solid square
    rect((0, 0), (4, 4), fill: c-book.lighten(15%), stroke: 0.6pt + c-book)
  
    // Sierpinski carpet cutouts (tô màu xám, depth 3)
    draw-sierpinski-carpet(0, 0, 4, 4, 1, 3, rgb("#f6f8f4"), 0.3pt + c-book)   
  }),   
  [Một hình vuông (Thảm Sierpinski) có cạnh bằng $1$ m. Ở bước thứ nhất, người ta chia hình vuông thành $9$ hình vuông nhỏ bằng nhau và tô màu xám hình vuông ở chính giữa (bỏ đi phần này). Ở các bước tiếp theo, lặp lại quy trình trên đối với các hình vuông chưa bị tô màu còn lại. Hỏi sau ít nhất bao nhiêu bước thì diện tích phần chưa bị tô màu nhỏ hơn $10\%$ diện tích hình vuông ban đầu?],
  [20],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Gọi diện tích phần chưa bị tô màu sau bước $n$ là $S_n$. \
    Ở mỗi bước, diện tích phần chưa bị tô màu bằng $8/9$ diện tích phần chưa bị tô màu ở bước ngay trước đó. \
    Do đó, $(S_n)$ là một cấp số nhân có $S_1 = 8/9$ và công bội $q = 8/9$. \
    Suy ra $S_n = (8/9)^n$. \
    Yêu cầu bài toán: $S_n < 10% = 0.1 <=> (8/9)^n < 0.1 <=> n > log_(8/9)(0.1) approx 19.55$. \
    Vì $n$ là số nguyên dương, nên cần ít nhất $n = 20$ bước.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một quả bóng cao su được thả từ độ cao $10$ m. Mỗi lần chạm đất, quả bóng nảy lên độ cao bằng $3/4$ độ cao trước đó. Tổng chiều dài quãng đường quả bóng di chuyển (từ lúc thả cho đến khi dừng hẳn) bằng bao nhiêu mét?],
  [70],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Quãng đường rơi đầu tiên là 10. Sau đó bóng nảy lên và rơi xuống các đoạn có độ dài là $2 times 10(3/4), 2 times 10(3/4)^2, ...$ \
    Đây là tổng của một CSN khi xét các quá trình nảy lên và rơi xuống riêng biệt. \
    $S = 10 + 2 times (10 times 3/4) / (1 - 3/4) = 10 + 2 times 7.5 / (1/4) = 10 + 2 times 30 = 70$ mét.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một chiến dịch truyền thông quảng bá sản phẩm mới bắt đầu bằng việc gửi email giới thiệu đến $10$ người (ngày thứ 1). Sang ngày thứ hai, mỗi người trong số $10$ người này chuyển tiếp email đó cho $3$ người khác (chưa từng nhận email). Kế tiếp ngày thứ ba, mỗi người nhận được email trong ngày thứ hai lại chuyển tiếp cho $3$ người khác mới hoàn toàn. Cứ như vậy, chiến dịch tiếp diễn theo một cấp số nhân. Hỏi sau đúng $7$ ngày, tổng cộng có bao nhiêu người đã nhận được email giới thiệu sản phẩm này (tính cả 10 người ban đầu)?],
  [10930],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Số người nhận email mới mỗi ngày lập thành CSN có $u_1 = 10$, công bội $q = 3$. \
    Tổng số người nhận được email sau 7 ngày chính là tổng 7 số hạng đầu: \
    $S_7 = u_1 (q^7 - 1) / (q - 1) = 10 times (3^7 - 1) / (3 - 1) = 10 times (2187 - 1) / 2 = 10930$ người.]
  ]
))

#q-wrap(dir: "doc", tln(
  [Một bệnh nhân được tiêm một liều thuốc $120$ mg. Cứ sau mỗi giờ, lượng thuốc trong cơ thể bệnh nhân lại giảm đi $15\%$ so với giờ trước đó (được đào thải qua thận). Hỏi sau đúng $8$ giờ kể từ lúc tiêm, lượng thuốc còn lại trong cơ thể bệnh nhân là bao nhiêu miligam? (Làm tròn kết quả đến hàng đơn vị).],
  [33],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Lượng thuốc ban đầu là $A = 120$ mg. \
    Sau mỗi giờ lượng thuốc còn lại bằng $100% - 15% = 85% = 0.85$ so với giờ trước đó. \
    Lượng thuốc còn lại sau mỗi giờ lập thành CSN có $u_0 = 120, q = 0.85$. \
    Sau 8 giờ, lượng thuốc còn lại là: $u_8 = 120 times 0.85^8 approx 32.699$ mg. \
    Làm tròn đến hàng đơn vị ta được $33$ mg.]
  ]
))

#q-wrap(dir: "doc", tln(
  fig-pos: "center",
  fig-width: 40%,
  fig: cetz.canvas(length: 1.0cm, {
    import cetz.draw: *
    
    // Ceiling
    line((-2, 3), (2, 3), stroke: 1.5pt + gray)
    circle((0, 3), radius: 0.06, fill: black)
    line((0, 3), (0, 0), stroke: (paint: gray, dash: "dotted"))
    
    // Swing 1 (left side)
    let x1 = -1.5
    let y1 = 0.402
    line((0, 3), (x1, y1), stroke: 0.8pt + gray)
    circle((x1, y1), radius: 0.2, fill: rgb("bae6fd"), stroke: c-book)
    
    // Swing 2 (right side)
    let x2 = 1.026
    let y2 = 0.181
    line((0, 3), (x2, y2), stroke: (paint: gray, dash: "dashed"))
    circle((x2, y2), radius: 0.17, fill: rgb("7dd3fc"), stroke: c-book.lighten(20%))
    
    // Swing 3 (left side)
    let x3 = -0.725
    let y3 = 0.09
    line((0, 3), (x3, y3), stroke: (paint: gray, dash: "dashed"))
    circle((x3, y3), radius: 0.14, fill: rgb("38bdf8"), stroke: c-book.lighten(40%))
    
    // Curved arrows for swing paths
    arc((0, 3), start: 240deg, stop: 290deg, radius: 2.8, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
    arc((0, 3), start: 290deg, stop: 256deg, radius: 2.6, stroke: (paint: red, dash: "dashed"), mark: (end: ">", size: 0.12))
  }),
  [Một con lắc đơn khi dao động có chiều dài quỹ đạo của lần vung đầu tiên (từ vị trí biên bên này sang biên bên kia) là $20$ cm. Kể từ lần vung thứ hai, do sức cản không khí, chiều dài quỹ đạo của mỗi lần vung chỉ bằng $98\%$ chiều dài quỹ đạo của lần vung ngay trước đó. Tính tổng quãng đường con lắc đã di chuyển được cho đến khi nó dừng hẳn (làm tròn đến hàng đơn vị của cm).],
  [1000],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Chiều dài quỹ đạo các lần vung của con lắc tạo thành một cấp số nhân với $u_1 = 20$ cm và công bội $q = 98\% = 0.98$. \
    Tổng quãng đường con lắc di chuyển được cho đến khi dừng hẳn là: \
    $S = u_1 / (1 - q) = 20 / (1 - 0.98) = 20 / 0.02 = 1000$ cm.]
  ]
))

#q-wrap(dir: "doc", tln( 
  fig-pos: "center",
  fig-width: 60%,
  fig: cetz.canvas(length: 1.4cm, {
    import cetz.draw: *
    
    // Timeline axis
    line((0, 0), (6, 0), stroke: 1pt + gray, mark: (end: ">"))
    content((5.8, 0.3), [tháng])
    
    // Ticks
    content((0, 0.3), [0])
    content((1.2, 0.3), [1])
    content((2.4, 0.3), [2])
    content((3.6, 0.3), [...])
    content((4.8, 0.3), [12])
    
    // Upward arrow V at t=0
    line((0, 0), (0, 1.8), stroke: 2pt + rgb("16a34a"), mark: (end: ">", size: 0.15))
    content((0, 2.1), text(size: 8pt, fill: rgb("16a34a"), weight: "bold")[Vốn gốc 15 tr])
    
    // Repayments X at t=1, 2, 12
    line((1.2, 0), (1.2, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((1.2, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    line((2.4, 0), (2.4, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((2.4, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    line((4.8, 0), (4.8, -1.0), stroke: 1.5pt + rgb("dc2626"), mark: (end: ">", size: 0.12))
    content((4.8, -1.3), text(size: 8pt, fill: rgb("dc2626"))[$X$])
    
    // Curved discounting arrows (Bezier curves going backwards below axis)
    bezier((1.2, -1.0), (0, -0.2), (0.6, -0.8), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((0.8, -0.5), text(size: 7pt, fill: blue)[$X/(1+r)$])
    
    bezier((2.4, -1.0), (0, -0.4), (1.2, -1.3), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((1.8, -0.9), text(size: 7pt, fill: blue)[$X/(1+r)^2$])
    
    bezier((4.8, -1.0), (0, -0.6), (2.4, -2.0), stroke: (paint: blue, dash: "dashed"), mark: (end: ">", size: 0.08))
    content((3.5, -1.5), text(size: 7pt, fill: blue)[$X/(1+r)^(12)$])
  }),
  [Bạn An mua một chiếc điện thoại trị giá $15$ triệu đồng bằng hình thức trả góp với lãi suất $1.2\%$/tháng. Bạn An thỏa thuận trả đều đặn vào cuối mỗi tháng một số tiền cố định là $X$ nghìn đồng trong vòng đúng $12$ tháng thì hết nợ. Tính số tiền $X$ mà bạn An phải trả mỗi tháng (làm tròn đến hàng đơn vị).],
  [1350],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Áp dụng công thức số tiền trả góp hàng tháng với trị giá món hàng $V = 15000$ (nghìn đồng), số kỳ trả $N = 12$, lãi suất $r = 1.2\% = 0.012$: \
    $X = (V dot r dot (1+r)^N) / ((1+r)^N - 1) = (15000 times 0.012 times (1.012)^(12)) / ((1.012)^(12) - 1) approx 1349.665$ nghìn đồng. \
    Làm tròn đến hàng đơn vị của nghìn đồng ta được $1350$ nghìn đồng (tức là $1,350,000$ đồng/tháng).]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số nhân $(u_n)$ có công bội $q$ thỏa mãn: $u_1 - u_3 = 24$ và $u_2 - u_4 = 12$. Tính tổng 6 số hạng đầu tiên $S_6$ của cấp số nhân đã cho.],
  [63],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Ta có hệ phương trình:
    $ cases(u_1 - u_3 = 24, u_2 - u_4 = 12) <=> cases(u_1 (1 - q^2) = 24, u_1 q (1 - q^2) = 12) $
    Chia vế theo vế hai phương trình, ta được: $q = 12/24 = 1/2$. \
    Thay $q = 1/2$ vào phương trình đầu tiên:
    $ u_1 (1 - 1/4) = 24 <=> 3/4 u_1 = 24 <=> u_1 = 32. $
    Tổng 6 số hạng đầu của cấp số nhân này là:
    $ S_6 = u_1 (1 - q^6) / (1 - q) = 32 (1 - (1/2)^6) / (1 - 1/2) = 64 (1 - 1/64) = 63. $]
  ]
))

#q-wrap(dir: "doc", tln(
  [Cho cấp số nhân $(u_n)$ thỏa mãn: $u_1 + u_2 + u_3 = 14$ và $u_4 + u_5 + u_6 = 112$. Tìm số hạng đầu tiên $u_1$ của cấp số nhân đó.],
  [2],
  loigiai: [
    #step[*Lời giải chi tiết:* \
      Ta có hệ phương trình:
    $ cases(u_1 + u_2 + u_3 = 14, u_4 + u_5 + u_6 = 112) <=> cases(u_1 (1 + q + q^2) = 14, u_1 q^3 (1 + q + q^2) = 112) $
    Chia vế theo vế phương trình thứ hai cho phương trình thứ nhất, ta được:
    $ q^3 = 112/14 = 8 <=> q = 2. $
    Thay $q = 2$ vào phương trình đầu tiên:
    $ u_1 (1 + 2 + 2^2) = 14 <=> 7 u_1 = 14 <=> u_1 = 2. $]
  ]
))




