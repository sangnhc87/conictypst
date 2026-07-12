#import "@preview/cetz:0.5.2"

#set page(paper: "a6", margin: 1cm)

// Test 1: basic line + fill
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  line((0,0), (2,0), (2,2), (0,2), close: true, fill: blue)
})

// Test 2: arc fill
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  arc((0,0), start: 0deg, stop: -180deg, radius: (2, 1), fill: red)
})
