// @nhom Hóa học
// @muc Thí nghiệm nhận biết
// @ten Dãy ống nghiệm màu
// @mota Bốn ống nghiệm trên giá, mỗi ống một dung dịch/hiện tượng; sửa nhãn và màu
// @tu ong nghiem nhan biet mau dung dich gia
#import "/sm-draw.typ": *
#let p-n1 = "Cu^2+" // Nhãn ống 1
#let p-c1 = rgb("#60a5fa") // Màu ống 1
#let p-n2 = "Fe^3+" // Nhãn ống 2
#let p-c2 = rgb("#f59e0b") // Màu ống 2
#let p-n3 = "MnO4^-" // Nhãn ống 3
#let p-c3 = rgb("#a21caf") // Màu ống 3
#let p-n4 = "Cl^-" // Nhãn ống 4
#let p-c4 = rgb("#e2e8f0") // Màu ống 4
#sm-canvas({
  import draw: *
  // giá ống nghiệm
  rect((-0.7, 1.6), (6.3, 1.85), fill: rgb("#b45309").lighten(35%), stroke: 0.8pt)
  line((-0.5, 1.6), (-0.5, 0), stroke: 2pt)
  line((6.1, 1.6), (6.1, 0), stroke: 2pt)
  rect((-0.7, 0), (6.3, 0.2), fill: rgb("#b45309").lighten(35%))
  for (i, (n, c)) in ((p-n1, p-c1), (p-n2, p-c2), (p-n3, p-c3), (p-n4, p-c4)).enumerate() {
    let x = 0.5 + i * 1.65
    ong-nghiem((x, 0.45), h: 3.6, w: 0.9, lvl: 0.55, liq: c.transparentize(25%))
    lab((x, 4.5), ch(n), size: 11pt)
  }
  rect((-0.7, 1.45), (6.3, 1.62), fill: rgb("#b45309").lighten(50%), stroke: 0.6pt)
})
