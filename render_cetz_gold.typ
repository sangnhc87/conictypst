#set page(width: auto, height: auto)
#import "@preview/cetz:0.3.3"
#cetz.canvas(length: 1.5cm, {
  import cetz.draw: *
  
  let c-cup = rgb("#1e293b")
  let c-water = rgb("#bae6fd")
  let c-water-surf = rgb("#7dd3fc")
  let c-water-line = rgb("#0284c7")
  let c-dim = rgb("#94a3b8")
  
  // Nước
  merge-path(fill: c-water, stroke: none, {
    line((1,0), (1.6, 1.8))
    arc((1.6, 1.8), start: 0deg, stop: 180deg, radius: (1.6, 0.4))
    line((-1.6, 1.8), (-1, 0))
    arc((-1, 0), start: 180deg, stop: 360deg, radius: (1, 0.25))
  })
  
  // Mặt nước
  circle((0, 1.8), radius: (1.6, 0.4), fill: c-water-surf, stroke: 0.75pt + c-water-line)
  
  // Trục chính
  line((0, 0), (0, 3), stroke: (dash: "dashed", paint: c-dim, thickness: 0.5pt))
  
  // Đáy dưới 
  arc((1, 0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: (dash: "dashed", paint: c-cup, thickness: 1pt))
  arc((-1, 0), start: 180deg, stop: 360deg, radius: (1, 0.25), stroke: 1.5pt + c-cup)
  
  // Thành chậu
  line((-1, 0), (-2, 3), stroke: 1.5pt + c-cup)
  line((1, 0), (2, 3), stroke: 1.5pt + c-cup)
  
  // Miệng chậu
  circle((0, 3), radius: (2, 0.5), stroke: 1.5pt + c-cup)
  
  // Kích thước (Dimensions) bên ngoài để không đè vào hình
  // Chiều cao
  line((2.3, 0), (2.8, 0), stroke: 0.5pt + c-dim)
  line((2.3, 3), (2.8, 3), stroke: 0.5pt + c-dim)
  line((2.55, 0), (2.55, 3), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
  content((2.65, 1.5), text(8pt, fill: c-cup)[$h=3$], anchor: "west")
  
  // Bán kính đáy lớn R=2
  line((0, 3.8), (0, 3.3), stroke: 0.5pt + c-dim)
  line((2, 3.8), (2, 3.3), stroke: 0.5pt + c-dim)
  line((0, 3.55), (2, 3.55), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
  content((1, 3.7), text(8pt, fill: c-cup)[$R=2$], anchor: "south")
  
  // Bán kính đáy nhỏ r=1
  line((0, -0.8), (0, -0.3), stroke: 0.5pt + c-dim)
  line((1, -0.8), (1, -0.3), stroke: 0.5pt + c-dim)
  line((0, -0.55), (1, -0.55), stroke: 0.5pt + c-dim, mark: (start: ">", end: ">", fill: c-dim))
  content((0.5, -0.4), text(8pt, fill: c-cup)[$r=1$], anchor: "south")
  
  // Bán kính mặt nước
  line((0, 1.8), (1.6, 1.8), stroke: (dash: "dashed", paint: c-water-line, thickness: 0.75pt))
  content((0.8, 1.6), text(8pt, fill: c-water-line)[$r(y)$], anchor: "north")
})
