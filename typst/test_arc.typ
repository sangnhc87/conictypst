#import "@preview/cetz:0.5.2"

// Test: position = (0,0) vs (2,0) for start: 0deg, stop: 90deg, radius: 2
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  circle((0,0), radius: 0.06, fill: black)
  content((0.15, -0.25), text(size: 8pt)[$O$])
  
  // RED: position = (0,0) -- if this is CENTER, arc goes from (2,0) to (0,2)
  arc((0,0), start: 0deg, stop: 90deg, radius: 2,
    stroke: (paint: red, thickness: 2pt))
  content((2.3, 1.0), text(fill: red, size: 8pt)[pos=(0,0)])
  
  // BLUE: position = (2,0) -- if this is START, arc also goes from (2,0) to (0,2)
  arc((2,0), start: 0deg, stop: 90deg, radius: 2,
    stroke: (paint: blue, thickness: 1.5pt, dash: "dashed"))
  content((2.3, 0.5), text(fill: blue, size: 8pt)[pos=(2,0)])
  
  // Mark key points
  circle((2,0), radius: 0.07, fill: green)
  content((2.15, -0.2), text(fill: green, size: 7pt)[(2,0)])
  circle((0,2), radius: 0.07, fill: green)
  
  line((-0.3, 0), (3, 0), mark: (end: "stealth"), stroke: 0.5pt)
  line((0, -0.3), (0, 2.5), mark: (end: "stealth"), stroke: 0.5pt)
})
