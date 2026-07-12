#import "@preview/cetz:0.5.2"

#set page(paper: "a5", margin: 1cm)

// Test: circle in a group with anchor
Test circle in group:
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  group(name: "G", {
    circle((0, 0), radius: 2, stroke: 1.5pt + blue)
    arc((0, 0), start: 0deg, stop: 180deg,
        radius: (2, 0.7),
        stroke: (dash: "dashed", paint: gray, thickness: 0.8pt))
    arc((0, 0), start: 0deg, stop: -180deg,
        radius: (2, 0.7),
        stroke: 1.5pt + blue)
    anchor("center", (0, 0))
    anchor("top", (0, 2))
    anchor("bottom", (0, -2))
  })
  circle("G.top", radius: 0.2, fill: red)
})
