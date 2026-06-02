#import "@preview/cetz:0.5.2"

#cetz.canvas(length: 0.3cm, {
  import cetz.draw: *
  
  circle((0,0), radius: 8, stroke: 1pt + red)
  line((-8, 0), (8, 0), stroke: 2pt + blue)
})
