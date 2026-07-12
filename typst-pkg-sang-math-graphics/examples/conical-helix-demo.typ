// Ví dụ: Đường xoắn ốc trên nón
#import "@preview/cetz:0.5.2"
#import "../lib.typ": draw-cone, draw-conical-helix

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *

  draw-cone(name: "N", radius: 3, height: 5, center: (0, 0, 0), stroke: rgb("888888"))
  draw-conical-helix(name: "H", center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)

  content("H.start", [$A$], anchor: "west")
  content("H.end", [$B$], anchor: "east")
})
