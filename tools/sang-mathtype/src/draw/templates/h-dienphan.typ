// @nhom Hóa học
// @muc Điện hóa
// @ten Điện phân nước
// @mota Hai ống thu khí úp trên hai điện cực: H₂ (cực âm) gấp đôi O₂ (cực dương)
// @tu dien phan nuoc hidro oxi catot anot
#import "/sm-draw.typ": *
#let p-dd = "H₂SO₄ loãng" // Dung dịch điện phân
#sm-canvas({
  import draw: *
  coc((3.2, 0), w: 6.4, h: 4.6, lvl: 0.66, liq: rgb(147, 197, 253, 55%))
  // hai ống thu khí úp: H2 (mực nước thấp hơn: nhiều khí) và O2
  ong-up((1.9, 0.9), h: 3.2, w: 1.1, wl: 0.15, gas: ch("H2"))
  ong-up((4.5, 0.9), h: 3.2, w: 1.1, wl: 0.58, gas: ch("O2"))
  dien-cuc((1.9, 0.2), h: 1.6, col: c-gray)
  dien-cuc((4.5, 0.2), h: 1.6, col: c-gray)
  // dây và nguồn một chiều: cực âm nối với catot (bên trái), cực dương nối với anot (bên phải)
  day((1.9, 1.8), (1.9, 5.6), (2.9, 5.6), col: c-blue)
  day((3.6, 5.6), (4.5, 5.6), (4.5, 1.8), col: c-red)
  line((2.9, 5.3), (2.9, 5.9), stroke: 1.6pt)
  line((3.6, 5.1), (3.6, 6.1), stroke: 1.6pt)
  line((2.9, 5.6), (3.6, 5.6))
  lab((2.55, 6.1), [−], size: 12pt)
  lab((3.95, 6.1), [+], size: 12pt)
  lab((1.9, -0.45), [Catot (−)], at: "north", size: 9pt)
  lab((4.5, -0.45), [Anot (+)], at: "north", size: 9pt)
  lab((3.2, -1.1), [Dung dịch #p-dd], size: 10pt)
  lab((6.8, 3.2), [2#ch("H2") : 1#ch("O2")], at: "west")
})
