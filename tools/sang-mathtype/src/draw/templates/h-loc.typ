// @nhom Hóa học
// @muc Tách & tinh chế
// @ten Lọc chất rắn khỏi chất lỏng
// @mota Phễu lọc có giấy lọc, đũa thủy tinh dẫn dòng, cốc hứng dịch lọc
// @tu loc pheu loc giay loc dua thuy tinh
#import "/sm-draw.typ": *
#let p-hh = "Hỗn hợp cần lọc" // Chất đổ vào phễu
#sm-canvas({
  import draw: *
  gia-do(-3.0, 6.2, w: 5.6, y0: -2.8, (3.8, (-0.8, 3.8)))
  // cốc hứng
  coc((0, -2.0), w: 2.8, h: 2.4, lvl: 0.35, liq: rgb(147, 197, 253, 50%))
  // phễu + giấy lọc
  line((-1.7, 3.6), (-0.1, 0.8), (-0.1, 0.1), stroke: 1pt)
  line((1.7, 3.6), (0.1, 0.8), (0.1, 0.1), stroke: 1pt)
  line((-1.7, 3.6), (1.7, 3.6), stroke: 1pt)
  line((-1.45, 3.4), (-0.02, 0.9), (1.45, 3.4), stroke: (thickness: 0.7pt, paint: c-gray, dash: "dashed"))
  merge-path(fill: rgb(147, 197, 253, 55%), stroke: none, close: true, { line((-1.2, 3.0), (1.2, 3.0), (0.0, 0.95)) })
  circle((0.5, 1.6), radius: 0.07, fill: c-gray, stroke: none)
  circle((-0.3, 1.9), radius: 0.07, fill: c-gray, stroke: none)
  // đũa thủy tinh
  line((-0.7, 5.4), (-0.8, 3.7), (-0.7, 2.7), stroke: (thickness: 2pt, paint: c-gray.lighten(10%)))
  // giọt dịch lọc
  circle((0.0, -0.15), radius: 0.07, fill: rgb(147, 197, 253), stroke: 0.5pt)
  lab((2.6, 3.4), [Giấy lọc], at: "west", size: 9pt)
  line((2.5, 3.4), (1.2, 3.1), stroke: 0.6pt, mark: (end: ">", size: 0.12))
  lab((2.8, 2.3), [Chất rắn\ (cặn)], at: "west", size: 9pt)
  line((2.7, 2.3), (0.55, 1.65), stroke: 0.6pt, mark: (end: ">", size: 0.12))
  lab((0, 5.6), [Đũa thủy tinh], at: "west", size: 9pt)
  lab((2.2, -1.4), [Dịch lọc], at: "west", size: 9pt)
  lab((0, 6.2), [#p-hh], size: 10pt)
})
