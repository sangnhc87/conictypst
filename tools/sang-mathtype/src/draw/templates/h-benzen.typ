// @nhom Hóa học
// @muc Cấu tạo chất
// @ten Vòng benzen và nhóm thế
// @mota Công thức cấu tạo dạng khung: vòng 6 cạnh có vòng tròn, gắn một nhóm thế
// @tu benzen phenol toluen vong thom cong thuc cau tao
#import "/sm-draw.typ": *
#let p-nhom = "OH" // Nhóm thế gắn vào vòng
#let p-tron = true // Vẽ vòng tròn (hệ liên hợp)
#let p-ten = "Phenol" // Tên chất
#sm-canvas({
  import draw: *
  let r = 1.3
  let pts = range(6).map(i => (r * calc.cos(90deg + i * 60deg), r * calc.sin(90deg + i * 60deg)))
  line(..pts, close: true, stroke: 1.2pt)
  if p-tron { circle((0, 0), radius: 0.8, stroke: 1pt, fill: none) }
  line(pts.at(0), (0, r + 0.9), stroke: 1.2pt)
  lab((0, r + 1.15), ch(p-nhom), size: 12pt)
  lab((0, -r - 0.3), [#p-ten], at: "north", size: 10pt)
})
