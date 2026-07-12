#import "@preview/cetz:0.5.2"
#import "../geometry-3d/revolution.typ": draw-cylinder, draw-cone, draw-sphere
#import "../geometry-2d/conics.typ": draw-parabola, draw-ellipse

#set page(paper: "a5", margin: 1cm)
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  draw-cylinder(name: "C", center: (0, 0), radius: 2, height: 4)
  draw-cone(name: "N", center: (5, 0), radius: 2, height: 4)
  draw-sphere(name: "S", center: (10, 2), radius: 2)
  draw-parabola(a: 1, h: 0, k: 0, x-range: (-2.0, 2.0))
  draw-ellipse(a: 3, b: 2, center: (5.0, 0.0), fill: rgb("E8F5E9"))
})
