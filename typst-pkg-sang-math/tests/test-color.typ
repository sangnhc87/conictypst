#import "@preview/cetz:0.5.2"
#import "../core/colors.typ": sm-blue, sm-gray

#set page(paper: "a6", margin: 1cm)

// Test if sm-blue works with stroke
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  // Direct test
  line((0,0), (3,0), stroke: 1.5pt + sm-blue)
  arc((0,0), start: 0deg, stop: -180deg, radius: (2, 0.7),
      stroke: 1.5pt + sm-blue)
})
