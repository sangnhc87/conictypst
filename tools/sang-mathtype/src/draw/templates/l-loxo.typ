// @nhom Vật lí
// @muc Cơ học
// @ten Con lắc lò xo nằm ngang
// @mota Vật nối lò xo trên mặt phẳng ngang, trục Ox, vị trí cân bằng và biên ±A
// @tu con lac lo xo dao dong dieu hoa bien do
#import "/sm-draw.typ": *
#sm-canvas({
  import draw: *
  // tường
  line((0, 0.2), (0, 3), stroke: 2pt)
  for i in range(6) { line((0, 0.2 + i * 0.5), (-0.3, 0.4 + i * 0.5), stroke: 0.7pt) }
  // sàn
  line((0, 0.2), (11, 0.2), stroke: 1.5pt)
  for i in range(22) { line((i * 0.5, 0.2), (i * 0.5 - 0.25, -0.1), stroke: 0.6pt) }
  lo-xo((0, 1.1), (4.9, 1.1), n: 9, w: 0.3)
  khoi-vat((5.5, 0.8), w: 1.2, h: 1.2, txt: [$m$])
  // trục và các vị trí
  line((0, 2.9), (11, 2.9), mark: (end: ">"))
  lab((11.1, 2.9), [$x$], at: "west")
  for (x, t) in ((3.5, [$-A$]), (5.5, [$O$]), (7.5, [$+A$])) {
    line((x, 2.8), (x, 3.0), stroke: 0.8pt)
    lab((x, 3.0), t, at: "south", size: 11pt)
    line((x, 1.4), (x, 2.8), stroke: (thickness: 0.6pt, dash: "dashed", paint: c-gray))
  }
  mt((5.5, 1.9), (7.5, 1.9), col: c-purple)
  mt((5.5, 2.15), (3.5, 2.15), col: c-purple)
  lab((6.5, 1.9), [$A$], at: "north", size: 10pt)
  lab((4.5, 2.15), [$A$], at: "south", size: 10pt)
})
