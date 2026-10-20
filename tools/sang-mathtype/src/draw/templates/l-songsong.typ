// @nhom Vật lí
// @muc Mạch điện
// @ten Mạch điện mắc song song
// @mota Hai điện trở song song, ampe kế ở mạch chính và ở từng nhánh
// @tu mach song song dien tro nhanh
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  sym((0, 0), (0, 4.2), "pin", lbl: $E, r$, side: 1)
  day((0, 4.2), (0.8, 4.2))
  sym((0.8, 4.2), (2.6, 4.2), "ctac", lbl: [K], len: 1.2)
  day((2.6, 4.2), (3.6, 4.2))
  sym((3.6, 4.2), (7.6, 4.2), "R", lbl: $R_1$)
  day((3.6, 4.2), (3.6, 2.2))
  sym((3.6, 2.2), (7.6, 2.2), "R", lbl: $R_2$)
  day((7.6, 4.2), (7.6, 0))
  day((7.6, 0), (7.6, 0))
  sym((7.6, 0), (0, 0), "A", side: -1)
  nutd((3.6, 4.2), (7.6, 4.2), (7.6, 2.2))
  mt((4.6, 3.7), (6.6, 3.7), txt: $I_1$, at: "north", col: c-red)
  mt((4.6, 1.7), (6.6, 1.7), txt: $I_2$, at: "north", col: c-red)
  mt((2.8, 4.75), (3.4, 4.75), txt: $I$, at: "south", col: c-red)
})
