// @nhom Vật lí
// @muc Cơ học
// @ten Chuyển động tròn đều
// @mota Vận tốc dài v (tiếp tuyến), gia tốc hướng tâm a, bán kính r, tốc độ góc ω
// @tu chuyen dong tron deu gia toc huong tam toc do goc
#import "/sm-draw.typ": *
#let p-goc = 35deg // Vị trí của chất điểm M trên đường tròn
#sm-canvas({
  import draw: *
  let r = 3
  circle((0, 0), radius: r, stroke: 1.2pt)
  circle((0, 0), radius: 0.06, fill: ink, stroke: none)
  lab((0, -0.1), [$O$], at: "north-east")
  let m = (r * calc.cos(p-goc), r * calc.sin(p-goc))
  line((0, 0), m, stroke: (thickness: 1pt, dash: "dashed", paint: c-gray))
  lab((m.at(0) / 2 - 0.05, m.at(1) / 2 + 0.1), [$r$], at: "south-east", size: 11pt)
  circle(m, radius: 0.12, fill: c-blue, stroke: none)
  lab((m.at(0) + 0.15, m.at(1) + 0.15), [$M$], at: "south-west")
  luc(m, (m.at(0) - 1.9 * calc.sin(p-goc), m.at(1) + 1.9 * calc.cos(p-goc)), $arrow(v)$, col: c-red, at: "south-east")
  luc(m, (m.at(0) - 1.6 * calc.cos(p-goc), m.at(1) - 1.6 * calc.sin(p-goc)), $arrow(a)_(h t)$, col: c-green, at: "north-east", off: (0.05, 0))
  line((0, 0), (r, 0), stroke: 0.8pt)
  arc((0, 0), start: 0deg, stop: p-goc, radius: 1.0, anchor: "origin")
  lab((1.25, 0.4), [$omega t$], size: 10pt, at: "west")
})
