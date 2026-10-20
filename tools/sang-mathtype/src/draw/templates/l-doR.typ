// @nhom Vật lí
// @muc Mạch điện
// @ten Mạch đo điện trở bằng ampe kế và vôn kế
// @mota Vôn kế mắc song song với điện trở cần đo, ampe kế mắc nối tiếp (có biến trở điều chỉnh)
// @tu do dien tro volt ampe bien tro
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  sym((0, 0), (0, 3.2), "pin", lbl: $E$, side: 1)
  day((0, 3.2), (0.8, 3.2))
  sym((0.8, 3.2), (2.6, 3.2), "ctac", lbl: [K], len: 1.2)
  sym((2.6, 3.2), (5.0, 3.2), "bt", lbl: [$R_b$], len: 1.5)
  sym((5.0, 3.2), (7.4, 3.2), "R", lbl: [$R_x$])
  day((7.4, 3.2), (8.8, 3.2), (8.8, 0))
  sym((8.8, 0), (0, 0), "A", side: -1)
  day((5.0, 3.2), (5.0, 4.7), (5.6, 4.7))
  sym((5.6, 4.7), (6.8, 4.7), "V", len: 1.2)
  day((6.8, 4.7), (7.4, 4.7), (7.4, 3.2))
  nutd((5.0, 3.2), (7.4, 3.2))
})
