// @nhom Hóa học
// @muc Điện hóa
// @ten Pin điện hóa Zn – Cu
// @mota Hai nửa pin nối bằng cầu muối và vôn kế; chiều electron và cực âm/dương
// @tu pin galvani zn cu cau muoi von ke
#import "/sm-draw.typ": *
#let p-a = "Zn" // Kim loại cực âm (anot)
#let p-b = "Cu" // Kim loại cực dương (catot)
#let p-da = "ZnSO4" // Dung dịch bên cực âm
#let p-db = "CuSO4" // Dung dịch bên cực dương
#sm-canvas({
  import draw: *
  coc((2.0, 0), w: 3.4, h: 3.2, lvl: 0.7, liq: rgb(226, 232, 240, 80%))
  coc((8.0, 0), w: 3.4, h: 3.2, lvl: 0.7, liq: rgb(147, 197, 253, 65%))
  cau-muoi(2.8, 7.2, 3.0, 1.2)
  dien-cuc((1.7, 0.4), h: 3.4, w: 0.45, col: c-gray.lighten(25%))
  dien-cuc((8.3, 0.4), h: 3.4, w: 0.45, col: rgb("#c2773a"))
  day((1.7, 3.8), (1.7, 5.0), (4.5, 5.0), col: ink)
  day((8.3, 3.8), (8.3, 5.0), (5.5, 5.0), col: ink)
  may-do((5.0, 5.0), "V", r: 0.5)
  mt((2.2, 5.5), (3.8, 5.5), col: c-red, txt: [e⁻], at: "south")
  lab((1.7, 4.2), [#p-a (−)], at: "south")
  lab((8.3, 4.2), [#p-b (+)], at: "south")
  lab((2.0, -0.4), [Dung dịch #ch(p-da)], at: "north", size: 9pt)
  lab((8.0, -0.4), [Dung dịch #ch(p-db)], at: "north", size: 9pt)
  lab((5.0, 2.85), [Cầu muối], at: "south", size: 9pt)
  lab((2.0, -1.1), [Anot: #p-a → #p-a#super[2+] + 2e], size: 9pt)
  lab((8.0, -1.1), [Catot: #p-b#super[2+] + 2e → #p-b], size: 9pt)
})
