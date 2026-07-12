#import "@preview/cetz:0.5.2"
#import "../core/colors.typ": sm-blue, sm-gray, sm-purple, sm-orange
#import "../geometry-3d/revolution.typ": draw-cylinder, draw-cone, draw-sphere
#import "../geometry-2d/conics.typ": draw-parabola, draw-ellipse, draw-hyperbola
#import "../geometry-3d/curves-3d.typ": draw-helix

#set page(paper: "a5", margin: 1cm)

= Test cylinder
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-cylinder(name: "C", center: (0, 0), radius: 2, height: 4)
})

= Test cone
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-cone(name: "N", center: (0, 0), radius: 2, height: 4)
})

= Test sphere
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-sphere(name: "S", center: (0, 0), radius: 2)
})

= Test parabola
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-parabola(a: 1, h: 0, k: 0, x-range: (-3.0, 3.0))
})

= Test ellipse
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-ellipse(a: 3, b: 2)
})

= Test ellipse filled
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-ellipse(a: 3, b: 2, fill: rgb("E8F5E9"))
})

= Test helix
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-helix(center: (0, 0), radius: 2, height: 6, loops: 1.5)
})
