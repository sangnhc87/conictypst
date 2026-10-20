// @nhom Vật lí
// @muc Cơ học
// @ten Đòn bẩy (quy tắc mô-men)
// @mota Thanh có điểm tựa O, hai lực F₁, F₂ và các cánh tay đòn d₁, d₂
// @tu don bay momen luc canh tay don can bang
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  // thanh và điểm tựa
  rect((-4.8, 2.0), (4.8, 2.22), fill: rgb("#b45309").lighten(45%), stroke: 1pt)
  line((-0.5, 0), (0.5, 0), (0, 2.0), close: true, fill: c-gray.lighten(50%))
  circle((0, 2.11), radius: 0.07, fill: ink)
  lab((0.25, 1.75), [$O$], at: "north-west", size: 11pt)
  luc((-3.6, 4.2), (-3.6, 2.25), $arrow(F)_1$, col: c-red, at: "south-east", off: (0.1, 0.35))
  luc((3.0, 4.2), (3.0, 2.25), $arrow(F)_2$, col: c-blue, at: "south-east", off: (0.1, 0.35))
  mt((-3.6, 1.4), (0, 1.4), txt: [$d_1$], at: "north", col: c-gray)
  mt((0, 1.4), (-3.6, 1.4), col: c-gray)
  mt((0, 0.9), (3.0, 0.9), txt: [$d_2$], at: "north", col: c-gray)
  mt((3.0, 0.9), (0, 0.9), col: c-gray)
  lab((0, -0.7), [$F_1 d_1 = F_2 d_2$], size: 11pt)
})
