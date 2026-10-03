#import "../../math-sym.typ": *
// ═══════════════════════════════════════════════════════════════════════════
// BEAMER-11-BÀI5
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
  title:       "BÀI 5: ỨNG DỤNG THỰC TẾ CỦA MŨ VÀ LOGARIT",
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


#slide[ = Khám phá: Toán Học Thực Chiến ]
- Hàm số Mũ và Logarit không phải là những thứ xa vời trên giấy nháp. Chúng điều khiển cuộc sống thực:
  1. *Lãi suất ngân hàng:* Lãi kép và sự tích lũy tài sản.
  2. *Vật lý:* Cường độ âm thanh (Decibel) và thang độ phóng xạ.
  3. *Địa lý:* Đo cường độ địa chấn bằng thang Richter.
- Trong bài học này, chúng ta sẽ áp dụng các công thức giải tích vào những vấn đề sinh tử và tiền bạc của thế giới thực!


#slide[ = Cơ sở lý thuyết ]







#block(breakable: false)[
  #phuongphap(title: [⚙ Bài toán gửi tiền lãi kép cơ bản])[
    - Khách hàng gửi số tiền ban đầu $A$ vào ngân hàng với lãi suất $r$ / kỳ hạn (không rút lãi ra).
    - Số tiền thu được (cả vốn lẫn lãi) sau $n$ kỳ hạn là:
      $ T = A(1 + r)^n $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Gửi tiền định kỳ (Trả góp / Tích lũy)])[
    - Mỗi kỳ hạn gửi đều đặn số tiền $M$ vào ngân hàng, lãi suất $r$ / kỳ hạn.
    - Số tiền thu được sau $n$ kỳ hạn là tổng cấp số nhân:
      $ T = M / r ( (1+r)^n - 1 ) (1+r) $
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Sự lạm phát và Giá trị thực của tiền])[
    - Nếu tỷ lệ lạm phát trung bình là $i$ mỗi năm, sức mua của dòng tiền $A$ sau $n$ năm chỉ còn tương đương với giá trị hiện tại là:
      $ T_(t h u c) = A / (1 + i)^n $
  ]
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Tăng trưởng vi khuẩn / Dân số])[
    - Số lượng quần thể tại thời điểm $t$ là:
      $ N(t) = N_0 dot e^(r t) $
      Trong đó $N_0$ là số lượng ban đầu, $r$ là tỷ lệ tăng trưởng.
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Chu kỳ bán rã (Phóng xạ đồng vị Carbon-14)])[
    - Khối lượng chất phóng xạ còn lại sau thời gian $t$ là:
      $ m(t) = m_0 dot (1/2)^(t/T) = m_0 dot e^(-lambda t) $
      Trong đó $T$ là chu kỳ bán rã, $lambda = (ln 2) / T$ là hằng số phân rã.
    - *Ứng dụng khảo cổ:* Đo lượng $C-14$ còn lại trong hóa thạch xương để suy ra thời gian sinh vật tử vong.
  ]
]



#block(breakable: false)[
  #phuongphap(title: [⚙ Thang độ Richter (Động đất)])[
    - Độ lớn (độ Richter) của động đất: $M = log (I / I_0)$, trong đó $I$ là biên độ địa chấn tối đa.
    - Nếu động đất tăng 1 độ Richter, biên độ dao động sẽ tăng gấp $10$ lần, và năng lượng tỏa ra tăng xấp xỉ $31.6$ lần ($10^(1.5)$).
  ]
]

#block(breakable: false)[
  #phuongphap(title: [⚙ Mức cường độ âm thanh (Decibel - dB)])[
    - Mức cường độ âm thanh: $L = 10 log (I / I_0) (d B)$, trong đó $I_0 = 10^(-12) W \/ m^2$ là ngưỡng nghe.
    - Nhờ dùng thang logarit, tai người cảm nhận âm lượng $100 d B$ (nhạc rock) lớn hơn $50 d B$ (nói chuyện) theo cấp số cộng chứ không phải là tiếng ồn mạnh hơn theo cấp số nhân.
  ]
]

#pagebreak()






