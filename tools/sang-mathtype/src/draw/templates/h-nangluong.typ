// @nhom Hóa học
// @muc Đồ thị & giản đồ
// @ten Giản đồ năng lượng phản ứng
// @mota Năng lượng hoạt hóa, biến thiên enthalpy, ảnh hưởng của xúc tác
// @tu nang luong hoat hoa enthalpy xuc tac gian do
#import "/sm-draw.typ": *
#let p-toa = true // Phản ứng tỏa nhiệt (ΔH < 0)
#let p-xt = true // Vẽ đường có xúc tác
#sm-canvas({
  import draw: *
  line((0, 0), (0, 6), mark: (end: ">"))
  line((0, 0), (9, 0), mark: (end: ">"))
  lab((-0.2, 6), [Năng lượng], at: "east", size: 9.5pt)
  lab((9.1, -0.1), [Tiến trình phản ứng], at: "north-east", size: 9.5pt)
  let y0 = if p-toa { 3.4 } else { 1.4 }
  let y1 = if p-toa { 1.4 } else { 3.4 }
  let ym = calc.max(y0, y1) + 1.9
  let yc = calc.max(y0, y1) + 0.6
  line((0.4, y0), (1.8, y0), stroke: 1.6pt + c-blue)
  bezier((1.8, y0), (3.5, ym), (2.6, y0), (2.8, ym), stroke: 1.6pt + c-blue)
  bezier((3.5, ym), (5.2, y1), (4.2, ym), (4.4, y1), stroke: 1.6pt + c-blue)
  line((5.2, y1), (8.6, y1), stroke: 1.6pt + c-blue)
  if p-xt {
    bezier((1.8, y0), (3.5, yc), (2.6, y0), (2.8, yc), stroke: (thickness: 1.4pt, paint: c-green, dash: "dashed"))
    bezier((3.5, yc), (5.2, y1), (4.2, yc), (4.4, y1), stroke: (thickness: 1.4pt, paint: c-green, dash: "dashed"))
  }
  lab((0.5, y0 - 0.1), [Chất phản ứng], at: "north-west", size: 9.5pt)
  lab((8.6, y1 - 0.1), [Sản phẩm], at: "north-east", size: 9.5pt)
  line((1.8, y0), (3.5, y0), stroke: (thickness: 0.7pt, dash: "dotted"))
  mt((3.5, y0), (3.5, ym - 0.02), col: c-red)
  lab((3.4, (y0 + ym) / 2), [Eₐ], at: "east", col: c-red)
  line((5.2, y0), (7.0, y0), stroke: (thickness: 0.7pt, dash: "dotted"))
  mt((7.0, y0), (7.0, y1), col: c-purple)
  lab((7.1, (y0 + y1) / 2), [Δ H #if p-toa [< 0] else [> 0]], at: "west", col: c-purple)
  if p-xt { lab((5.0, yc + 0.5), [Có xúc tác (Eₐ giảm)], at: "west", size: 9pt, col: c-green) }
})
