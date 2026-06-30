#import "@preview/cetz:0.5.2"

#cetz.canvas({
  import cetz.draw: *
  line((-3, 0), (3, 0), mark: (end: ">"))
  line((0, -3), (0, 3), mark: (end: ">"))
  
  let pts = range(-20, 21).map(x => {
    let nx = x / 10
    let ny = nx * nx * nx - 3 * nx
    (nx, ny)
  })
  line(..pts, stroke: blue)
})
