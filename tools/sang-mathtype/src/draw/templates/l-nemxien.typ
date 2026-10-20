// @nhom Vật lí
// @muc Cơ học
// @ten Chuyển động ném xiên
// @mota Quỹ đạo parabol với v₀, góc ném α, độ cao cực đại H và tầm xa L
// @tu nem xien parabol tam bay xa do cao cuc dai
#import "/sm-draw.typ": *
#let p-v0 = 20 // Vận tốc ném v₀ (m/s)
#let p-goc = 50deg // Góc ném α
#sm-canvas({
  import draw: *
  let g = 9.8
  let a = p-goc
  let L = p-v0 * p-v0 * calc.sin(2 * a) / g
  let H = p-v0 * p-v0 * calc.pow(calc.sin(a), 2) / (2 * g)
  let k = 8.0 / calc.max(L, 1)
  truc(L * k + 1.2, H * k + 1.6, lx: [$x$], ly: [$y$])
  duong(x => x * calc.tan(a) - g * x * x / (2 * p-v0 * p-v0 * calc.pow(calc.cos(a), 2)), 0, L, kx: k, ky: k, n: 80)
  // vận tốc ban đầu và thành phần
  luc((0, 0), (1.9 * calc.cos(a), 1.9 * calc.sin(a)), $arrow(v)_0$, col: c-red, at: "south-east")
  line((0, 0), (1.9 * calc.cos(a), 0), stroke: (thickness: 0.8pt, paint: c-gray, dash: "dashed"))
  line((1.9 * calc.cos(a), 0), (1.9 * calc.cos(a), 1.9 * calc.sin(a)), stroke: (thickness: 0.8pt, paint: c-gray, dash: "dashed"))
  arc((0, 0), start: 0deg, stop: a, radius: 1.1, anchor: "origin")
  lab((1.35, 0.35), [$alpha$], size: 10pt)
  // đỉnh
  let xt = L / 2 * k
  circle((xt, H * k), radius: 0.07, fill: ink, stroke: none)
  line((xt, 0), (xt, H * k), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
  line((0, H * k), (xt, H * k), stroke: (thickness: 0.7pt, dash: "dashed", paint: c-gray))
  lab((-0.1, H * k), [$H$], at: "east", size: 11pt)
  luc((xt, H * k), (xt + 1.7, H * k), $arrow(v)_x$, col: c-green, at: "south")
  mt((0, -0.55), (L * k, -0.55), txt: [$L = (v_0^2 sin 2 alpha) / g$], at: "north", col: c-purple)
  lab((xt - 0.15, H * k + 0.15), [Điểm cao nhất], at: "south-east", size: 9pt)
})
