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

// ─────────────────────────────────────────────────
#muc([Ứng Dụng Thực Tế của Hàm Số Lượng Giác])
// ─────────────────────────────────────────────────

#block(breakable: false)[
  #phuongphap(title: [⚙ Các mô hình tuần hoàn trong tự nhiên])[
    Nhiều hiện tượng trong tự nhiên có tính lặp lại theo chu kỳ, do đó chúng được mô phỏng rất tốt bởi đồ thị của các hàm số lượng giác (đặc biệt là $sin$ và $cos$):
    - Sự thay đổi nhiệt độ theo mùa trong năm.
    - Sự thay đổi số giờ chiếu sáng của mặt trời.
    - Dao động của con lắc, sóng âm thanh, dòng điện xoay chiều.
    - Hiện tượng thủy triều (mực nước lên xuống).
  ]
]

#vd([
  Sự thay đổi nhiệt độ trung bình tháng của một thành phố được mô hình hóa bởi hàm số:
  $ T(t) = 15 + 10 sin((pi t)/6 - (2pi)/3) $
  trong đó $t$ là tháng trong năm ($1 <= t <= 12$), $T(t)$ là nhiệt độ tính bằng °C.
  Tìm tháng có nhiệt độ trung bình cao nhất và thấp nhất trong năm.
],
  loigiai: [
    #grid(columns: (1fr, auto), gutter: 1em,
      [
        *Bước 1: Phân tích cực trị của hàm số.* \
        Ta biết hàm $\sin$ luôn có giá trị nằm trong đoạn $[-1, 1]$. \
        Do đó: $-1 <= sin((pi t)/6 - (2pi)/3) <= 1$.
        
        *Bước 2: Tìm giá trị lớn nhất (Max).* \
        Nhiệt độ lớn nhất khi $sin((pi t)/6 - (2pi)/3) = 1$. \
        Lúc này, $T_(max) = 15 + 10(1) = 25$°C. \
        Khi đó: $(pi t)/6 - (2pi)/3 = pi/2 + k 2pi <=> (pi t)/6 = (7pi)/6 + k 2pi <=> t = 7 + 12k$. \
        Vì $1 <= t <= 12$ nên $t = 7$. Vậy tháng 7 có nhiệt độ cao nhất.
        
        *Bước 3: Tìm giá trị nhỏ nhất (Min).* \
        Nhiệt độ thấp nhất khi $sin((pi t)/6 - (2pi)/3) = -1$. \
        Lúc này, $T_(min) = 15 + 10(-1) = 5$°C. \
        Khi đó: $(pi t)/6 - (2pi)/3 = -pi/2 + k 2pi <=> (pi t)/6 = pi/6 + k 2pi <=> t = 1 + 12k$. \
        Vì $1 <= t <= 12$ nên $t = 1$. Vậy tháng 1 có nhiệt độ thấp nhất.
      ],
      [
        #align(center)[
          #cetz.canvas(length: 0.6cm, {
            import cetz.draw: *
            line((0, 0), (13, 0), mark: (end: ">"), stroke: 0.8pt)
            content((12.8, -0.5), text(size: 8pt)[$t$ (tháng)])
            line((0, -0.5), (0, 6), mark: (end: ">"), stroke: 0.8pt)
            content((-0.6, 5.8), text(size: 8pt)[$T$ (°C)])
            
            // Vẽ đồ thị
            let pts = range(10, 125).map(i => {
              let t = i / 10
              let T = 15 + 10 * calc.sin(180deg * t / 6 - 120deg)
              (t, T / 5) // Scale down T by 5
            })
            line(..pts, stroke: 1.5pt + red)
            
            // Đánh dấu Max/Min
            line((1, 0), (1, 5/5), stroke: (dash: "dashed", paint: gray))
            circle((1, 5/5), radius: 0.1, fill: blue)
            content((1, -0.5), text(size: 8pt)[$1$])
            
            line((7, 0), (7, 25/5), stroke: (dash: "dashed", paint: gray))
            line((0, 25/5), (7, 25/5), stroke: (dash: "dashed", paint: gray))
            circle((7, 25/5), radius: 0.1, fill: red)
            content((7, -0.5), text(size: 8pt)[$7$])
            content((-0.6, 25/5), text(size: 8pt)[$25$])
            content((-0.6, 5/5), text(size: 8pt)[$5$])
            
            // Đường trung bình
            line((0, 15/5), (12, 15/5), stroke: (dash: "dashed", paint: luma(180)))
            content((-0.6, 15/5), text(size: 8pt)[$15$])
          })
        ]
      ]
    )
  ]
)

#pagebreak()


#q-label([B. BÀI TẬP TỔNG HỢP], c-book)

#include "c1-b-hamso-de1.typ"
