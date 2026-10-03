#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI7
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
  title:       "BÀI 7: CASE STUDY - TOÁN HỌC THỰC CHIẾN",
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


#slide[ = Chuyên đề: Case Study Thực tế ]
Trong thực tế, một kỹ sư hay một nhà đầu tư không bao giờ gặp một bài toán có sẵn dạng $log_2 x = 3$. 
Họ gặp những vấn đề ngổn ngang của thực tiễn và phải tự thiết lập mô hình toán học để giải quyết. Hãy cùng trải nghiệm cảm giác của một chuyên gia!


#slide[ = Cơ sở lý thuyết ]







Trong giới đầu tư, "Quy tắc 72" là một công thức nhẩm siêu tốc: *Để biết mất bao lâu tài sản nhân đôi, hãy lấy 72 chia cho lãi suất phần trăm hàng năm.* \
*Ví dụ:* Lãi suất $8%$/năm thì mất $72 / 8 = 9$ năm để nhân đôi tài sản.

#block(breakable: false)[
  #phuongphap(title: [⚙ Chứng minh Toán học bằng Logarit và Chuỗi Taylor])[
    Giả sử bạn có vốn $A$, lãi suất $r > 0$. Số tiền sau $t$ năm là $A(1+r)^t$. \
    Để tài sản nhân đôi, ta cần $A(1+r)^t = 2A <=> (1+r)^t = 2$. \
    Lấy logarit tự nhiên ($ln$) hai vế: 
    $ t ln(1+r) = ln 2 <=> t = (ln 2) / (ln(1+r)) $
    Ta biết $ln 2 approx 0.693$. Với lãi suất $r$ khá nhỏ (ví dụ $5% = 0.05$), theo khai triển chuỗi Taylor bậc nhất, ta có xấp xỉ $ln(1+r) approx r$. \
    Do đó: $t approx 0.693 / r$. \
    Nếu gọi $R = 100r$ là số phần trăm (ví dụ $R=8$ thay vì $r=0.08$), thì:
    $ t approx 69.3 / R $
    Để dễ nhẩm và chia hết cho nhiều số (2, 3, 4, 6, 8, 9...), người ta làm tròn số $69.3$ thành $72$. Đó là lý do Quy tắc 72 ra đời!
  ]
]

#grid(columns: (1fr), gutter: 1em,
  align(center)[
    *Biểu đồ Lãi kép nhân đôi tài sản (Lãi suất 8%/năm)* \
    #cetz.canvas(length: 1cm, {
      import cetz.draw: *
      // Axes
      line((0, 0), (10, 0), mark: (end: ">"), stroke: 0.8pt)
      content((9.8, -0.4), [$t$ (năm)])
      line((0, 0), (0, 3), mark: (end: ">"), stroke: 0.8pt)
      content((-0.5, 2.8), [$A$])
      
      // Bar chart for A*(1.08)^t
      for t in range(0, 10) {
        let val = calc.pow(1.08, t)
        rect((t + 0.2, 0), (t + 0.8, val), fill: color.mix((blue, 60%), (white, 40%)), stroke: none)
        if t == 0 { content((t + 0.5, val + 0.2), text(size: 8pt)[$1.0$]) }
        if t == 9 { content((t + 0.5, val + 0.2), text(size: 8pt, fill: red, weight: "bold")[#str(calc.round(val, digits: 1))]) }
      }
      // Horizontal threshold line
      line((0, 2), (10, 2), stroke: (dash: "dashed", paint: red))
      content((-0.4, 2), text(fill: red)[$2.0$])
    })
  ]
)



Nhiệt độ của một vật đặt trong môi trường thay đổi theo quy luật hàm mũ: $T(t) = T_m + (T_0 - T_m)e^(-k t)$. Sự chênh lệch nhiệt độ giảm theo cấp số nhân (đường cong Exponential Decay).

#align(center)[
  *Đồ thị giảm nhiệt độ của một ly nước sôi $100^o C$ trong phòng $20^o C$* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((0, 0), (8, 0), mark: (end: ">"), stroke: 0.8pt)
    content((7.8, -0.4), [$t$])
    line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 4.8), [$T ("°C")$])
    
    // T_m = 20C -> y=1 line
    line((0, 1), (8, 1), stroke: (dash: "dashed", paint: luma(100)))
    content((-0.5, 1), [$20^o$])
    content((-0.5, 5), [$100^o$])
    
    // Curve T(t) = 20 + 80 * e^(-0.5t). Map to y = 1 + 4*e^(-0.5t)
    let p_decay = range(0, std.int(8*20)).map(t => (t/20, 1 + 4 * calc.pow(calc.e, -0.5 * (t/20))))
    line(..p_decay, stroke: 1.5pt + red)
    
    content((3, 2.5), text(fill: red)[$T(t) = 20 + 80e^(-k t)$])
  })
]



Trong thực tế, vi khuẩn hay virus không thể tăng trưởng theo hàm $y = e^x$ mãi mãi vì không gian và vật chủ là có hạn. Mô hình chính xác nhất là Đường cong Logistic (S-Curve): $N(t) = A / (1 + B e^(-k t))$.

#align(center)[
  *Đồ thị Logistic (Hình chữ S) - Quá trình đạt miễn dịch cộng đồng* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((0, 0), (8, 0), mark: (end: ">"), stroke: 0.8pt)
    content((7.8, -0.4), [$t$])
    line((0, 0), (0, 5), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 4.8), [$N$])
    
    // Asymptote A (Capacity) -> y=4
    line((0, 4), (8, 4), stroke: (dash: "dashed", paint: red))
    content((-1.5, 4), text(fill: red)[Giới hạn bão hòa])
    
    // Inflection point at y=2
    line((0, 2), (8, 2), stroke: (dash: "dotted", paint: luma(150)))
    
    // Curve N(t) = 4 / (1 + 40 * e^(-1.2t))
    let p_logistic = range(0, std.int(8*20)).map(t => {
      let x = t/20
      let y = 4 / (1 + 40 * calc.pow(calc.e, -1.2 * x))
      (x, y)
    })
    line(..p_logistic, stroke: 1.5pt + blue)
    
    circle((3.07, 2), radius: 0.08, fill: red)
    content((3.5, 1.5), text(size: 9pt)[Điểm uốn (Đỉnh dịch)])
  })
]



Thang đo pH là một ứng dụng cổ điển của Logarit thập phân trong Hóa học. Nồng độ ion $H^+$ trong dung dịch thường rất nhỏ (như $0.0000001 "mol/L"$), do đó người ta dùng logarit âm để chuyển nó thành một số dương dễ đọc:
$ "pH" = -lg ("["H^+"]") $

#align(center)[
  *Trực quan hóa Thang đo pH* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    // Draw the main scale bar
    rect((0, 0), (14, 1), fill: none, stroke: none)
    
    // Create gradient-like effect using discrete blocks
    for i in range(0, 14) {
      let f = i / 14
      // Color shifts from Red (0) -> Green (7) -> Blue (14)
      let c = color.mix((red, 100% - (f*100)*1%), (blue, (f*100)*1%))
      if i < 7 {
        c = color.mix((red, 100% - (i/7)*100%), (green, (i/7)*100%))
      } else {
        c = color.mix((green, 100% - ((i - 7)/7)*100%), (blue, ((i - 7)/7)*100%))
      }
      rect((i, 0), (i+1, 1), fill: c, stroke: white)
      content((i + 0.5, 0.5), text(fill: white, weight: "bold")[#str(i)])
      content((i + 0.5, -0.5), text(size: 8pt)[$10^(-#str(i))$])
    }
    
    content((7, 1.5), text(weight: "bold", fill: green.darken(20%))[TRUNG TÍNH (Nước tinh khiết)])
    content((2, 1.5), text(weight: "bold", fill: red.darken(20%))[ACID (Chanh, Dạ dày)])
    content((12, 1.5), text(weight: "bold", fill: blue.darken(20%))[BASE (Thuốc tẩy, Xà phòng)])
    
    content((7, -1.2), text(size: 10pt, style: "italic")[Nồng độ ion $H^+$ (mol/L)])
  })
]
Mỗi khi pH giảm 1 đơn vị, tính Axit tăng lên *gấp 10 lần*! Một cốc nước chanh (pH = 2) có tính Axit mạnh gấp $100.000$ lần nước tinh khiết (pH = 7).



Khi bạn vay tiền ngân hàng để mua nhà hoặc xe với lãi suất cố định, bạn sẽ trả một khoản tiền $A$ bằng nhau mỗi tháng. Nhưng cơ cấu bên trong khoản tiền $A$ đó thay đổi liên tục theo một hàm mũ.

Giả sử vay $P$ đồng, lãi suất $r$ mỗi tháng, trả trong $n$ tháng. Tiền trả mỗi tháng:
$ A = (P dot r dot (1+r)^n) / ((1+r)^n - 1) $

*Bí mật mà ngân hàng không nhấn mạnh:* Trong những tháng đầu tiên, phần lớn số tiền bạn trả là để *trả lãi*, còn *tiền gốc* được trả rất ít. Càng về những năm cuối, biểu đồ mới đảo ngược!

#align(center)[
  *Giải phẫu cơ cấu dòng tiền Trả Góp Mua Nhà 20 năm* \
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    
    line((0, 0), (10, 0), mark: (end: ">"), stroke: 0.8pt)
    content((9.8, -0.4), [$t$ (Tháng)])
    line((0, 0), (0, 4), mark: (end: ">"), stroke: 0.8pt)
    content((-0.6, 3.8), [$A$])
    
    // Constant monthly payment line
    line((0, 3), (10, 3), stroke: (dash: "dashed"))
    content((-1.5, 3), text(fill: luma(80))[Trả cố định])
    
    // Interest curve (exponential decay from 3 down to 0)
    // Principal curve (exponential growth from 0 up to 3)
    let p_int = range(0, 100).map(t => {
      let x = t/10
      let y = 3 * calc.pow(calc.e, -0.3 * x)
      (x, y)
    })
    
    line(..p_int, stroke: 1.5pt + red)
    
    // Fill areas roughly
    content((2, 2.2), text(fill: red, weight: "bold")[Phần trả Lãi (Interest)])
    content((7, 1.2), text(fill: blue, weight: "bold")[Phần trả Gốc (Principal)])
    
    content((0, -0.4), [0])
    content((5, -0.4), [10 năm])
    content((9, -0.4), [20 năm])
  })
]


