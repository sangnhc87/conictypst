// @nhom Hóa học
// @muc Tách & tinh chế
// @ten Chưng cất thường
// @mota Bình cầu đun bằng đèn cồn, nhiệt kế, ống sinh hàn có nước chảy ngược dòng, bình hứng
// @tu chung cat sinh han nhiet ke binh cau
#import "/sm-draw.typ": *
#let p-hh = "Hỗn hợp lỏng" // Chất trong bình cầu
#sm-canvas({
  import draw: *
  gia-do(-2.2, 6.0, w: 3.6, y0: -2.2, (3.6, (-0.55, 3.6)))
  binh-cau((0, 1.4), r: 1.3, neck-h: 1.3, lvl: 0.4, liq: rgb(254, 215, 170, 80%))
  den-con((0, -2.2))
  line((-1.3, -0.1), (1.3, -0.1), stroke: 3pt) // lưới amiăng
  line((-1.4, -0.2), (1.4, -0.2), stroke: 0.5pt)
  nut((0, 3.2), w: 0.8, h: 0.5)
  nhiet-ke((0, 1.8), h: 2.8)
  // nhánh dẫn sang sinh hàn: ống nghiêng xuống
  ong((0.25, 3.0), (1.2, 3.0), (2.0, 2.7), w: 1.7pt)
  // ống sinh hàn nghiêng: tâm trục từ (2.0,2.7) đến (7.6,0.9)
  group({
    translate((2.0, 2.7))
    rotate(-17.7deg)
    rect((0.4, -0.45), (5.4, 0.45), fill: rgb(186, 220, 245, 35%))
    rect((0.4, -0.16), (5.4, 0.16), fill: white)
    line((0.1, 0), (5.9, 0), stroke: 2pt)
    day((1.0, 0.45), (1.0, 0.85), col: c-blue, w: 2pt)
    day((4.8, -0.45), (4.8, -0.85), col: c-blue, w: 2pt)
  })
  mt((6.32, -0.15), (6.32, 0.3), col: c-blue, w: 1pt)
  lab((6.32, -0.25), [Nước vào], at: "north", size: 9pt)
  mt((3.21, 3.3), (3.21, 3.8), col: c-blue, w: 1pt)
  lab((3.21, 3.9), [Nước ra], at: "south", size: 9pt)
  // bình hứng
  erlen((8.0, -1.2), w: 2.6, h: 2.6, lvl: 0.2, liq: rgb(254, 215, 170, 80%))
  lab((1.5, 0.5), [#p-hh], at: "west")
  lab((6.4, 3.0), [Ống sinh hàn], at: "south", size: 9pt)
  lab((8.0, -1.5), [Bình hứng], at: "north", size: 9pt)
  lab((1.5, 4.0), [Nhiệt kế], size: 9pt)
})
