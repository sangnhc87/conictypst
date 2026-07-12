// Ví dụ: Đường xoắn ốc quanh hình trụ
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-cylinder, draw-helix

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *

  // Vẽ hình trụ làm nền
  draw-cylinder(name: "C1", radius: 2, height: 5, center: (0, 0, 0), stroke: rgb("888888"))

  // Vẽ đường xoắn ốc
  draw-helix(name: "H1", center: (0, 0, 0), radius: 2, height: 5, loops: 2, stroke: red + 1.5pt)

  // Nhãn điểm đầu/cuối
  content("H1.start", [$A$], anchor: "west")
  content("H1.end", [$B$], anchor: "east")
})
