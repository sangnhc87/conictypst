#set page(width: auto, height: auto)
#import "@preview/cetz:0.3.3"
#cetz.canvas({
  import cetz.draw: *
  arc((1,0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: red)
  line((0,0), (2,0), stroke: blue)
})
