// @nhom Vật lí
// @muc Mạch điện
// @ten Mạch điện mắc nối tiếp
// @mota Nguồn, công tắc, hai điện trở nối tiếp, ampe kế đo dòng, vôn kế đo hiệu điện thế R₂
// @tu mach noi tiep dien tro ampe ke von ke
#import "/sm-draw.typ": *
#let p-r1 = "R_1" // Nhãn điện trở 1
#let p-r2 = "R_2" // Nhãn điện trở 2
#let p-e = "E, r" // Nhãn nguồn
#sm-canvas({
  import draw: *
  sym((0, 0), (0, 3.2), "pin", lbl: eval("$" + p-e + "$", mode: "markup"), side: 1)
  day((0, 3.2), (0.8, 3.2))
  sym((0.8, 3.2), (3.0, 3.2), "ctac-h", lbl: [K], len: 1.3)
  sym((3.0, 3.2), (5.4, 3.2), "R", lbl: eval("$" + p-r1 + "$", mode: "markup"))
  sym((5.4, 3.2), (7.8, 3.2), "R", lbl: eval("$" + p-r2 + "$", mode: "markup"))
  day((7.8, 3.2), (9.2, 3.2), (9.2, 0))
  sym((9.2, 0), (0, 0), "A", side: -1)
  // vôn kế song song với R2
  day((5.4, 3.2), (5.4, 4.7), (6.0, 4.7))
  sym((6.0, 4.7), (7.2, 4.7), "V", len: 1.2)
  day((7.2, 4.7), (7.8, 4.7), (7.8, 3.2))
  nutd((5.4, 3.2), (7.8, 3.2))
})
