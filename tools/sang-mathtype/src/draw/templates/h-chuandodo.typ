// @nhom Hóa học
// @muc Thí nghiệm định lượng
// @ten Chuẩn độ axit – bazơ
// @mota Buret đựng dung dịch chuẩn, bình tam giác đựng dung dịch cần chuẩn độ có chất chỉ thị
// @tu chuan do buret erlen phenolphtalein
#import "/sm-draw.typ": *
#let p-chuan = "NaOH 0,1M" // Dung dịch trong buret
#let p-mau = "HCl + phenolphtalein" // Dung dịch trong bình tam giác
#let p-chat = rgb("#f9a8d4") // Màu dung dịch trong bình
#sm-canvas({
  import draw: *
  gia-do(0, 8.4, w: 4.6, (6.0, (2.0, 6.0)))
  buret((2.0, 1.9), h: 5.6, w: 0.55, lvl: 0.75, liq: rgb(147, 197, 253, 60%))
  rect((-0.5, -0.5), (4.9, -0.28), fill: c-gray.lighten(40%))
  rect((0.8, -0.28), (3.6, 0.0), fill: c-gray.lighten(30%))
  erlen((2.0, 0.0), w: 3.0, h: 2.8, lvl: 0.45, liq: p-chat)
  // giọt rơi
  circle((2.0, 1.55), radius: 0.07, fill: rgb(147, 197, 253), stroke: 0.5pt)
  lab((3.9, 6.3), [Buret], at: "west")
  lab((3.7, 7.1), [#p-chuan], at: "west", size: 10pt)
  line((3.4, 6.9), (2.4, 6.0), stroke: 0.6pt, mark: (end: ">", size: 0.14))
  lab((4.4, 1.3), [Bình tam giác], at: "west")
  lab((4.4, 0.55), [#p-mau], at: "west", size: 9pt)
})
