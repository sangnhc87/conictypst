// @nhom Hóa học
// @muc Điều chế & thu khí
// @ten Điều chế khí clo (MnO₂ + HCl đặc)
// @mota Bình cầu đun nóng, phễu nhỏ giọt HCl đặc, hai bình rửa khí, thu Cl₂ bằng cách đẩy không khí
// @tu clo cl2 mno2 hcl dac rua khi
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  gia-do(-1.9, 5.8, w: 3.8, y0: -2.2, (4.2, (-0.55, 3.2)))
  binh-cau((0, 1.4), r: 1.2, neck-h: 1.0, lvl: 0.3, liq: rgb(120, 113, 108, 60%))
  den-con((0, -2.1))
  line((-1.3, -0.15), (1.3, -0.15), stroke: 3pt)
  nut((0, 3.0), w: 0.75, h: 0.5)
  line((0.0, 4.7), (0.0, 1.0), stroke: (thickness: 1.3pt, paint: ink))
  pheu((0, 4.5), r: 0.85, h: 0.85, stem: 0.3)
  rect((-0.25, 3.8), (0.25, 4.0), fill: c-gray.lighten(30%))
  lab((0, 6.0), [dd HCl đặc], at: "south")
  lab((1.4, 0.4), [#ch("MnO2") (rắn)], at: "west")
  // bình rửa 1 (NaCl), 2 (H2SO4)
  binh-rua((4.6, -0.6), liq: rgb(147, 197, 253, 55%), lbl: [dd NaCl bão hòa])
  binh-rua((8.0, -0.6), liq: rgb(254, 240, 138, 60%), lbl: [#ch("H2SO4") đặc])
  ong((0.2, 3.0), (1.4, 3.0), (4.46, 3.0), (4.46, -0.15), w: 1.6pt)
  ong((4.74, 2.2), (4.74, 3.0), (7.86, 3.0), (7.86, -0.15), w: 1.6pt)
  // lọ thu khí (đẩy không khí, ống dẫn dài)
  lo-khi((11.7, -0.6), w: 1.9, h: 3.8, gas: ch("Cl2"), gcol: rgb(190, 242, 100, 45%), cover: true)
  ong((8.14, 2.2), (8.14, 3.0), (11.4, 3.0), (11.4, -0.4), w: 1.6pt)
  lab((11.7, 4.1), [Bông tẩm NaOH], at: "south", size: 9pt)
  lab((11.7, -0.9), [Khí #ch("Cl2")], at: "north", size: 9pt)
})
