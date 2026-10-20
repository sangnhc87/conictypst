// @nhom Hóa học
// @muc Điều chế & thu khí
// @ten Điều chế khí hiđro (Zn + HCl)
// @mota Bình cầu có phễu nhỏ giọt, thu khí H₂ bằng cách đẩy nước
// @tu hidro hydro kem axit clohidric
#import "/sm-draw.typ": *
#let p-axit = "HCl" // Dung dịch nhỏ từ phễu
#let p-kim = "Zn" // Chất rắn trong bình
#let p-khi = "H2" // Khí thu được
#sm-canvas({
  import draw: *
  chau((7.2, -1.9), w: 5.4, h: 2.3, hn: 1.5)
  binh-cau((0, 1.1), r: 1.25, neck-h: 1.1, lvl: 0.35, liq: rgb(147, 197, 253, 60%))
  for p in ((-0.3, 0.1), (0.2, 0.0), (0.5, 0.25), (-0.1, 0.35)) { rect(p, (p.at(0) + 0.25, p.at(1) + 0.16), fill: c-gray.lighten(30%), stroke: 0.6pt) }
  bot((0.0, 0.7), (-0.3, 0.9), (0.3, 1.0))
  nut((0, 3.0), w: 0.75, h: 0.5)
  line((0.0, 4.9), (0.0, 1.0), stroke: (thickness: 1.3pt, paint: ink)) // cuống phễu xuống sát dung dịch
  pheu((0, 4.7), r: 0.9, h: 0.9, stem: 0.3)
  rect((-0.25, 4.0), (0.25, 4.2), fill: c-gray.lighten(30%))
  ong((0.2, 3.05), (1.5, 3.05), (5.6, 3.05), (5.6, -1.75), (6.6, -1.75), (6.6, -0.9), w: 1.7pt)
  ong-up((6.6, -1.6), h: 3.4, w: 1.0, wl: 0.35, gas: ch(p-khi))
  bot((6.45, -0.8), (6.7, -0.5))
  lab((0, 6.3), [Dung dịch #ch(p-axit)], at: "south")
  lab((-1.6, 0.4), ch(p-kim), at: "east")
  line((-1.55, 0.4), (-0.5, 0.3), stroke: 0.6pt, mark: (end: ">", size: 0.14))
  lab((8.3, -0.6), [Nước], at: "west")
  lab((8.9, 2.0), [Khí #ch(p-khi)], at: "west")
  line((8.8, 1.9), (7.15, 1.5), stroke: 0.6pt, mark: (end: ">", size: 0.14))
})
