#import "@preview/cetz:0.5.2"

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((-0.2, 0), (8, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    line((0, -0.2), (0, 6), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    content((8.2, 0), text(size: 10pt)[$t$])
    content((0.2, 6.2), text(size: 10pt)[$N(t)$])
    content((-0.2, -0.2), text(size: 10pt)[$O$])
    
    // Ticks for N(t)
    for i in range(1, 6) {
      line((-0.1, i), (0.1, i), stroke: 0.5pt)
    }
    content((-0.6, 5), text(size: 8pt)[$10000$])
    content((-0.6, 2.5), text(size: 8pt)[$5000$])
    
    let pts = ()
    for i in range(0, 81, step: 2) {
      let t = float(i)
      let y = 10000.0 / (1.0 + 999.0 * calc.exp(-0.2 * t))
      pts.push((t / 10.0, y / 2000.0))
    }
    line(..pts, stroke: (paint: blue, thickness: 1.5pt))
    
    let t_u = 34.53
    let y_u = 5000.0
    circle((t_u / 10.0, y_u / 2000.0), radius: 0.1, fill: red)
    content((t_u / 10.0 + 1.2, y_u / 2000.0 - 0.3), box(fill: white, inset: 2pt)[Điểm uốn])
    
    // Asymptote
    line((0, 5), (7.8, 5), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
  })
]

#v(2em)

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    // Axes
    line((-0.2, 0), (6, 0), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    line((0, -0.2), (0, 5), mark: (end: ">", size: 0.2), stroke: 0.8pt)
    content((6.2, 0), text(size: 10pt)[$x$])
    content((0.2, 5.2), text(size: 10pt)[$R(x)$])
    content((-0.2, -0.2), text(size: 10pt)[$O$])
    
    // Scale x = 1cm for 10 units, y = 1cm for 30 units (150 max)
    let pts = ()
    for i in range(0, 51, step: 2) {
      let x = float(i)
      let y = -0.1 * x * x + 3.0 * x + 100.0
      pts.push((x / 10.0, y / 30.0))
    }
    line(..pts, stroke: (paint: rgb("FF8C00"), thickness: 1.5pt))
    
    // Vertex
    circle((1.5, 122.5 / 30.0), radius: 0.1, fill: red)
    content((1.5, 122.5 / 30.0 + 0.3), text(size: 9pt)[$(15, 122.5)$])
    line((1.5, 0), (1.5, 122.5 / 30.0), stroke: (paint: gray, dash: "dashed"))
    line((0, 122.5 / 30.0), (1.5, 122.5 / 30.0), stroke: (paint: gray, dash: "dashed"))
    content((1.5, -0.3), text(size: 9pt)[$15$])
    content((-0.4, 122.5 / 30.0), text(size: 9pt)[$122.5$])
  })
]
