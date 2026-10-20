// @nhom Vật lí
// @muc Cơ học
// @ten Con lắc đơn
// @mota Dây treo dài ℓ, góc lệch α, lực căng T và trọng lực P
// @tu con lac don day treo luc cang dao dong
#import "/sm-draw.typ": *
#let p-goc = 30deg // Góc lệch so với phương thẳng đứng
#let p-day = 5 // Chiều dài dây (cm trên hình)
#sm-canvas({
  import draw: *
  let a = p-goc
  let l = p-day
  line((-2, 6), (2, 6), stroke: 2pt)
  for i in range(8) { line((-2 + i * 0.5, 6), (-2.25 + i * 0.5, 6.35), stroke: 0.7pt) }
  let b = (l * calc.sin(a), 6 - l * calc.cos(a))
  line((0, 6), (0, 6 - l - 0.6), stroke: (thickness: 0.8pt, dash: "dashed", paint: c-gray))
  line((0, 6), b, stroke: 1.2pt)
  arc((0, 6), start: -90deg, stop: -90deg + a, radius: 1.4, anchor: "origin")
  lab((0.45, 6 - 1.9), [$alpha$], size: 11pt)
  circle(b, radius: 0.32, fill: c-blue.lighten(60%), stroke: 1pt + c-blue)
  // lực
  let toward = (-calc.sin(a), calc.cos(a))
  luc(b, (b.at(0) + toward.at(0) * 2.0, b.at(1) + toward.at(1) * 2.0), $arrow(T)$, col: c-green, at: "south-west", off: (0.05, 0.05))
  luc(b, (b.at(0), b.at(1) - 2.0), $arrow(P)$, at: "north-west", off: (0.05, -0.05))
  lab((0.0 + (b.at(0)) / 2 + 0.35, (6 + b.at(1)) / 2 + 0.2), [$ell$], size: 11pt)
})
