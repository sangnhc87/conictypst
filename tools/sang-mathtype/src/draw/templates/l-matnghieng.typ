// @nhom Vật lí
// @muc Cơ học
// @ten Vật trên mặt phẳng nghiêng (các lực)
// @mota Trọng lực P, phản lực N, lực ma sát, phân tích P thành hai thành phần
// @tu mat phang nghieng luc ma sat phan tich luc
#import "/sm-draw.typ": *
#let p-goc = 30deg // Góc nghiêng α
#let p-ma-sat = true // Vẽ lực ma sát
#let p-phan-tich = true // Phân tích trọng lực
#sm-canvas({
  import draw: *
  let a = p-goc
  let L = 9
  let top = (L * calc.cos(a), L * calc.sin(a))
  // mặt phẳng nghiêng
  line((0, 0), (L * calc.cos(a), 0), top, close: true, fill: rgb("#e2e8f0"), stroke: 1.2pt)
  arc((0, 0), start: 0deg, stop: a, radius: 1.8, anchor: "origin")
  lab((2.3, 0.35), [$alpha$], size: 11pt)
  // vật: khối quay theo mặt nghiêng
  let t = 5.5
  let u = (calc.cos(a), calc.sin(a))
  let n = (-calc.sin(a), calc.cos(a))
  let c = (t * u.at(0) + n.at(0) * 0.55, t * u.at(1) + n.at(1) * 0.55)
  group({
    translate(c)
    rotate(a)
    rect((-0.9, -0.55), (0.9, 0.55), fill: c-blue.lighten(78%), stroke: 1.1pt + c-blue)
  })
  circle(c, radius: 0.06, fill: ink, stroke: none)
  luc(c, (c.at(0), c.at(1) - 2.6), $arrow(P)$, at: "north-west", off: (0.05, -0.05))
  luc(c, (c.at(0) + n.at(0) * 2.2, c.at(1) + n.at(1) * 2.2), $arrow(N)$, col: c-green, at: "south-east", off: (0.05, 0.05))
  if p-ma-sat { luc(c, (c.at(0) + u.at(0) * 2.1, c.at(1) + u.at(1) * 2.1), $arrow(F)_(m s)$, col: c-amber, at: "south-west", off: (0.05, 0.05)) }
  if p-phan-tich {
    let pp = (c.at(0), c.at(1) - 2.6)
    let px = (c.at(0) + u.at(0) * (-2.6 * calc.sin(a)) * -1, c.at(1) + u.at(1) * (-2.6 * calc.sin(a)) * -1)
    // P_x = P sinα dọc mặt nghiêng xuống; P_y = P cosα vuông góc mặt nghiêng
    let down = (-u.at(0), -u.at(1))
    let pxe = (c.at(0) + down.at(0) * 2.6 * calc.sin(a), c.at(1) + down.at(1) * 2.6 * calc.sin(a))
    let pye = (c.at(0) - n.at(0) * 2.6 * calc.cos(a), c.at(1) - n.at(1) * 2.6 * calc.cos(a))
    line(c, pxe, stroke: (thickness: 1.1pt, paint: c-purple, dash: "dashed"), mark: (end: ">", fill: c-purple, size: 0.18))
    line(c, pye, stroke: (thickness: 1.1pt, paint: c-purple, dash: "dashed"), mark: (end: ">", fill: c-purple, size: 0.18))
    line(pxe, pp, stroke: (thickness: 0.6pt, paint: c-gray, dash: "dotted"))
    line(pye, pp, stroke: (thickness: 0.6pt, paint: c-gray, dash: "dotted"))
    lab(pxe, text(fill: c-purple)[$P_x$], at: "north-east", size: 10pt)
    lab(pye, text(fill: c-purple)[$P_y$], at: "north-east", size: 10pt)
  }
})
