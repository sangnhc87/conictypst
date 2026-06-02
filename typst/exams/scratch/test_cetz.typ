#import "@preview/cetz:0.5.2"

#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  
  // Circle of radius 3 at (0,0)
  circle((0,0), radius: 3, stroke: 1pt + red)
  
  // Horizontal line from -3 to 3
  line((-3, 0), (3, 0), stroke: 2pt + blue)
  
  // Vertical line from -3 to 3
  line((0, -3), (0, 3), stroke: 2pt + green)
})
