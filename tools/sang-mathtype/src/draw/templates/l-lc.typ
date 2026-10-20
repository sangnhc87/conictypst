// @nhom Vật lí
// @muc Mạch điện
// @ten Mạch dao động LC
// @mota Tụ điện nối với cuộn cảm; chiều dòng điện và điện tích bản tụ
// @tu mach dao dong lc tu dien cuon cam
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  sym((0, 0), (0, 3.2), "tu", lbl: $C$, side: 1)
  day((0, 3.2), (1.0, 3.2))
  sym((1.0, 3.2), (4.6, 3.2), "cuon", lbl: $L$, len: 2.0)
  day((4.6, 3.2), (5.6, 3.2), (5.6, 0), (0, 0))
  lab((0.45, 2.1), [$+q$], size: 10pt, at: "west")
  lab((0.45, 1.1), [$-q$], size: 10pt, at: "west")
  mt((2.0, 4.1), (3.6, 4.1), col: c-red, txt: [$i$], at: "south")
})
