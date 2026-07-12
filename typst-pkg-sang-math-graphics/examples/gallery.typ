// Gallery: Tất cả các hình có trong package
#import "@preview/cetz:0.5.2"
#import "../lib.typ": *

#set page(paper: "a4", margin: 1.5cm)
#set text(font: "New Computer Modern", size: 11pt, lang: "vi")

= Gallery: Sang Math Graphics

== 1. Hình học phẳng

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-parabola(a: 0.4, x-range: (-3, 3), stroke: blue + 1pt)
  draw-ellipse(center: (5, 0), a: 2, b: 1, stroke: red + 1pt)
  draw-hyperbola(a: 0.8, b: 0.8, x-range: (1, 4), stroke: green + 1pt)
})

== 2. Hình nón 3D với anchor

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-cone(name: "N", radius: 2.5, height: 4, center: (0, 0, 0))
  circle("N.top", radius: 0.06, fill: red)
  content("N.top", [$S$], anchor: "south")
  content("N.center", [$O$], anchor: "north")
})

== 3. Đường xoắn ốc trên trụ

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-cylinder(name: "C", radius: 1.8, height: 4, center: (0, 0, 0), stroke: rgb("888"))
  draw-helix(center: (0, 0, 0), radius: 1.8, height: 4, loops: 2, stroke: red + 1.2pt)
})

== 4. Khối chóp cụt

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-truncated-pyramid(base-size: 4, top-size: 2, height: 3, center: (0, 0, 0))
})

== 5. Mặt yên ngựa

#cetz.canvas(length: 1.5cm, {
  import cetz.draw: *
  draw-saddle(x-range: (-2, 2), y-range: (-2, 2), samples: 16, stroke: rgb("1A5276") + 0.6pt)
})

== 6. Đường xoắn ốc trên nón

#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  draw-cone(radius: 3, height: 5, center: (0, 0, 0), stroke: rgb("888"))
  draw-conical-helix(center: (0, 0, 0), base-radius: 3, height: 5, loops: 3, stroke: red + 1.5pt)
})

== 7. Thể tích theo mặt cắt vuông

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  draw-square-cross-section(x => calc.pow(2, x), x-range: (0, 2), samples: 5)
})

== 8. Đường hầm nửa elip

#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-half-elliptical-tunnel(length: 6, h-start: 4, h-end: 1, ratio: 3)
})
