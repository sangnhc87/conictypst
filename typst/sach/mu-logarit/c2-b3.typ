#import "_config.typ": *

#lesson([Hàm Số Mũ và Hàm Số Logarit], theme-color: c-book)

#q-label([A. LÝ THUYẾT TRỌNG TÂM], c-book)

#muc([1. Khái niệm và Tính chất])

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

#muc([2. Mối liên hệ và Đồ thị])

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
        let p_exp = range(int(-1.5*20), int(2.4*20)).map(x => (x/20, calc.pow(2, x/20)))
        line(..p_exp, stroke: 1.5pt + blue)
        content((1.2, 4.8), text(fill: blue)[$y = 2^x$])
        
        // y = log_2 x
        let p_log = range(int(0.1*20), int(5.5*20)).map(x => (x/20, calc.log(x/20, base: 2)))
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
        let p_exp = range(int(-1.5*20), int(5.5*20)).map(x => (x/20, calc.pow(0.5, x/20)))
        line(..p_exp, stroke: 1.5pt + blue)
        content((-1, 3.5), text(fill: blue)[$y = (1/2)^x$])
        
        // y = log_{1/2} x
        let p_log = range(int(0.1*20), int(5.5*20)).map(x => (x/20, calc.log(x/20, base: 0.5)))
        line(..p_log, stroke: 1.5pt + red)
        content((3.5, -1), text(fill: red)[$y = log_(1/2) x$])
      })
    ]
  ]
)

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c2-b3-de1.typ"
