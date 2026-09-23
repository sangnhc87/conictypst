#import "@preview/sang-math:1.0.6": *
#import "@preview/cetz:0.2.2"

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((0,0), (6,6))
    line((1.5,1.5), (4.5,1.5), stroke: (dash: "dashed"))
    content((3, -0.5), [60 - 2x])
  })
]
