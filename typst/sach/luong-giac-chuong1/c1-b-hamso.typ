#import "_config.typ": *

#lesson([Hàm Số Lượng Giác và Đồ Thị], theme-color: c-book)

#q-label([A. LÝ THUYẾT], c-book)

#muc([Hàm số $y = sin x$ và $y = cos x$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Tính chất chung])[
    - *Tập xác định:* $D = RR$.
    - *Tập giá trị:* $[-1, 1]$. Tức là $-1 <= sin x <= 1$ và $-1 <= cos x <= 1$.
    - *Chu kỳ tuần hoàn:* $T = 2pi$.
    - *Tính chẵn lẻ:* $y = sin x$ là hàm số lẻ (đồ thị đối xứng qua gốc tọa độ), $y = cos x$ là hàm số chẵn (đồ thị đối xứng qua trục tung).
  ]
]

#let draw-axes() = {
  import cetz.draw: *
  // X axis
  line((-4, 0), (7, 0), mark: (end: ">"), stroke: 0.8pt)
  content((6.8, -0.3), [$x$])
  // Y axis
  line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.8pt)
  content((0.3, 2.3), [$y$])
  content((-0.2, -0.2), [$O$])
  
  // Ticks
  let pi = 3.1416
  for (x, l) in ((-pi, $-pi$), (-pi/2, $-pi/2$), (pi/2, $pi/2$), (pi, $pi$), (3*pi/2, $(3pi)/2$), (2*pi, $2pi$)) {
    line((x, -0.05), (x, 0.05))
    content((x, -0.4), text(size: 8pt)[#l])
  }
  for y in (-1, 1) {
    line((-0.05, y), (0.05, y))
    content((-0.3, y), text(size: 8pt)[#str(y)])
  }
}

#grid(columns: (1fr, 1fr), gutter: 1em,
  [
    *Đồ thị hàm số $y = sin x$* \
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        draw-axes()
        let pts = range(int(-3.5*20), int(6.5*20)).map(x => (x/20, calc.sin(x/20 * 1rad)))
        line(..pts, stroke: 1.5pt + blue)
      })
    ]
  ],
  [
    *Đồ thị hàm số $y = cos x$* \
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        draw-axes()
        let pts = range(int(-3.5*20), int(6.5*20)).map(x => (x/20, calc.cos(x/20 * 1rad)))
        line(..pts, stroke: 1.5pt + red)
      })
    ]
  ]
)

#muc([Hàm số $y = tan x$ và $y = cot x$])

#block(breakable: false)[
  #phuongphap(title: [⚙ Tính chất chung])[
    - *Tập xác định:* 
      - $y = tan x$: $D = RR \ \{pi/2 + k pi, k in ZZ\}$
      - $y = cot x$: $D = RR \ \{k pi, k in ZZ\}$
    - *Tập giá trị:* $RR$.
    - *Chu kỳ tuần hoàn:* $T = pi$.
    - *Tính chẵn lẻ:* Cả hai đều là hàm số lẻ (đồ thị đối xứng qua gốc tọa độ).
  ]
]

#let draw-axes-tan() = {
  import cetz.draw: *
  // X axis
  line((-4, 0), (7, 0), mark: (end: ">"), stroke: 0.8pt)
  content((6.8, -0.3), [$x$])
  // Y axis
  line((0, -3.5), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
  content((0.3, 3.3), [$y$])
  content((-0.2, -0.2), [$O$])
  
  // Ticks
  let pi = 3.1416
  for (x, l) in ((-pi, $-pi$), (-pi/2, $-pi/2$), (pi/2, $pi/2$), (pi, $pi$), (3*pi/2, $(3pi)/2$), (2*pi, $2pi$)) {
    line((x, -0.05), (x, 0.05))
    content((x, -0.4), text(size: 8pt)[#l])
  }
}

#grid(columns: (1fr, 1fr), gutter: 1em,
  [
    *Đồ thị hàm số $y = tan x$* \
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        draw-axes-tan()
        let pi = 3.1416
        // Asymptotes
        line((-pi/2, -3), (-pi/2, 3), stroke: (dash: "dashed", paint: gray))
        line((pi/2, -3), (pi/2, 3), stroke: (dash: "dashed", paint: gray))
        line((3*pi/2, -3), (3*pi/2, 3), stroke: (dash: "dashed", paint: gray))
        
        let p1 = range(int(-1.3*20), int(1.3*20)).map(x => (x/20, calc.tan(x/20 * 1rad)))
        line(..p1, stroke: 1.5pt + blue)
        let p2 = range(int(1.8*20), int(4.4*20)).map(x => (x/20, calc.tan(x/20 * 1rad)))
        line(..p2, stroke: 1.5pt + blue)
        let p3 = range(int(-4.4*20), int(-1.8*20)).map(x => (x/20, calc.tan(x/20 * 1rad)))
        line(..p3, stroke: 1.5pt + blue)
      })
    ]
  ],
  [
    *Đồ thị hàm số $y = cot x$* \
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *
        draw-axes-tan()
        let pi = 3.1416
        // Asymptotes
        line((-pi, -3), (-pi, 3), stroke: (dash: "dashed", paint: gray))
        line((pi, -3), (pi, 3), stroke: (dash: "dashed", paint: gray))
        line((2*pi, -3), (2*pi, 3), stroke: (dash: "dashed", paint: gray))
        
        let p1 = range(int(0.3*20), int(2.8*20)).map(x => (x/20, 1/calc.tan(x/20 * 1rad)))
        line(..p1, stroke: 1.5pt + red)
        let p2 = range(int(3.4*20), int(6.0*20)).map(x => (x/20, 1/calc.tan(x/20 * 1rad)))
        line(..p2, stroke: 1.5pt + red)
        let p3 = range(int(-2.8*20), int(-0.3*20)).map(x => (x/20, 1/calc.tan(x/20 * 1rad)))
        line(..p3, stroke: 1.5pt + red)
      })
    ]
  ]
)

#pagebreak()

#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b-hamso-de1.typ"
