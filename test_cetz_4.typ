#set page(width: auto, height: auto)
#import "@preview/cetz:0.3.3"
#cetz.canvas(length: 1.2cm, {
  import cetz.draw: *
  
  let color-cup = rgb("#334155")
  let color-water-fill = rgb("#f0f9ff")
  let color-water-surf = rgb("#e0f2fe")
  let color-water-line = rgb("#0284c7")
  let color-dim = rgb("#64748b")
  
  merge-path(fill: color-water-fill, stroke: none, close: true, {
    line((-1, 0), (-1.6, 1.8), stroke: none)
    line((-1.6, 1.8), (1.6, 1.8), stroke: none)
    line((1.6, 1.8), (1, 0), stroke: none)
  })
  
  circle((0, 0), radius: (1, 0.25), fill: color-water-fill, stroke: none)
  
  circle((0, 1.8), radius: (1.6, 0.4), fill: color-water-surf, stroke: 0.75pt + color-water-line)
  
  line((0, 0), (0, 3), stroke: (dash: "dashed", paint: color-dim.lighten(30%), thickness: 0.5pt))
  line((0, 3), (2, 3), stroke: (dash: "dashed", paint: color-dim.lighten(30%), thickness: 0.5pt))
  content((1, 3.12), text(size: 8pt, fill: color-cup)[$R = 2$], anchor: "south")
  
  line((0, 0), (1, 0), stroke: (dash: "dashed", paint: color-dim.lighten(30%), thickness: 0.5pt))
  content((0.5, 0.05), text(size: 8pt, fill: color-cup)[$r = 1$], anchor: "south")
  
  arc((1, 0), start: 0deg, stop: 180deg, radius: (1, 0.25), stroke: (dash: "dashed", paint: color-cup, thickness: 0.75pt))
  arc((-1, 0), start: 180deg, stop: 360deg, radius: (1, 0.25), stroke: 1.5pt + color-cup)
  
  line((-1, 0), (-2, 3), stroke: 1.5pt + color-cup)
  line((1, 0), (2, 3), stroke: 1.5pt + color-cup)
  
  circle((0, 3), radius: (2, 0.5), stroke: 1.5pt + color-cup)
  
  line((1.2, 0), (2.5, 0), stroke: 0.5pt + color-dim)
  line((2.2, 3), (2.5, 3), stroke: 0.5pt + color-dim)
})
