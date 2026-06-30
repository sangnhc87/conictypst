#set page(width: auto, height: auto)
#import "@preview/cetz:0.3.3"
#cetz.canvas({
  import cetz.draw: *
  
  line((-1, 0), (1, 0), stroke: blue)
  
  // What is the syntax for arc?
  // Let's try drawing an arc through a center, or just passing mode:
  // Usually: arc(center, start: angle, stop: angle) wait, is there an anchor?
  arc((1, 0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: red)
  
  // Let's draw arc with anchor?
  arc((0,0), start: 0deg, stop: 180deg, radius: (1, 0.25), anchor: "center", stroke: green)

})
