// @nhom Vật lí
// @muc Cơ học
// @ten Ròng rọc (máy Atwood)
// @mota Hai vật m₁ > m₂ nối qua ròng rọc cố định; lực căng dây và trọng lực
// @tu rong roc atwood luc cang day
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  line((-1.5, 6.5), (1.5, 6.5), stroke: 2pt)
  line((0, 6.5), (0, 6.0), stroke: 1.5pt)
  circle((0, 5.5), radius: 0.7, fill: c-gray.lighten(75%), stroke: 1.2pt)
  circle((0, 5.5), radius: 0.07, fill: ink)
  line((-0.7, 5.5), (-0.7, 2.6), stroke: 1pt)
  line((0.7, 5.5), (0.7, 3.6), stroke: 1pt)
  khoi-vat((-0.7, 2.1), w: 1.3, h: 1.0, txt: [$m_1$], col: c-blue)
  khoi-vat((0.7, 3.1), w: 1.0, h: 1.0, txt: [$m_2$], col: c-green)
  luc((-0.7, 4.5), (-0.7, 3.5), $arrow(T)$, col: c-purple, at: "east", off: (-0.12, 0.45))
  luc((0.7, 4.7), (0.7, 3.8), $arrow(T)$, col: c-purple, at: "west", off: (0.12, 0.45))
  luc((-0.7, 1.6), (-0.7, 0.2), $arrow(P)_1$, at: "east", off: (-0.12, 0.3))
  luc((0.7, 2.6), (0.7, 1.7), $arrow(P)_2$, at: "west", off: (0.12, 0.3))
  mt((-2.2, 3.0), (-2.2, 1.6), col: c-gray, txt: [$a$], at: "east")
  mt((2.2, 2.2), (2.2, 3.6), col: c-gray, txt: [$a$], at: "west")
})
