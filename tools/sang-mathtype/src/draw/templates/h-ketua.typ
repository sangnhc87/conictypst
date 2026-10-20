// @nhom Hóa học
// @muc Thí nghiệm nhận biết
// @ten Phản ứng tạo kết tủa
// @mota Hai dung dịch trộn với nhau tạo kết tủa (hiện tượng và phương trình)
// @tu ket tua phan ung trao doi
#import "/sm-draw.typ": *
#let p-a = "BaCl2" // Dung dịch thứ nhất
#let p-b = "Na2SO4" // Dung dịch thứ hai
#let p-kt = "BaSO4" // Kết tủa
#let p-ktcol = rgb("#475569") // Màu kết tủa
#sm-canvas({
  import draw: *
  ong-nghiem((0, 0), h: 3.4, w: 0.9, lvl: 0.55, liq: rgb(226, 232, 240, 85%))
  ong-nghiem((1.8, 0), h: 3.4, w: 0.9, lvl: 0.55, liq: rgb(226, 232, 240, 85%))
  lab((0, 3.9), ch(p-a), size: 11pt)
  lab((1.8, 3.9), ch(p-b), size: 11pt)
  lab((0.9, 1.5), [+], size: 16pt)
  mt((2.8, 1.5), (4.4, 1.5), txt: [trộn], at: "south")
  ong-nghiem((5.6, 0), h: 3.4, w: 0.9, lvl: 0.55, liq: rgb(226, 232, 240, 85%), ketua: 22, ktcol: p-ktcol)
  rect((5.15, 0.45), (6.05, 0.9), fill: p-ktcol.transparentize(35%), stroke: none)
  lab((5.6, 3.9), [Hiện tượng], size: 10pt)
  lab((7.0, 0.7), [Kết tủa #ch(p-kt) \ (trắng, không tan)], at: "west", size: 9.5pt)
  line((6.95, 0.7), (6.1, 0.65), stroke: 0.6pt, mark: (end: ">", size: 0.12))
})
