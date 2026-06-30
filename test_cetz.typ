#set page(width: auto, height: auto)
#import "@preview/cetz:0.3.3"
#cetz.canvas({
  import cetz.draw: *
  arc((1,0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: red)
  circle((1,0), radius: 0.1, fill: red)
  content((1, -0.5), [Center (1,0)])
})
