#import "@preview/cetz:0.5.2"

#set page(width: auto, height: auto, margin: 1cm)

#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    
    let R1 = 3.1225
    let R2 = 4.1225
    let c2 = 17.245
    
    // Axis
    line((-5, 0), (5, 0), mark: (end: ">"), stroke: (paint: rgb("C62828")))
    content((5, -0.3), [$x$])
    line((0, -1), (0, 23), mark: (end: ">"), stroke: (paint: rgb("C62828")))
    content((0.3, 23), [$y$])
    content((-0.3, -0.4), [$O$])
    circle((0,0), radius: 0.1, fill: black)

    // Parabola
    let p-pts = range(-46, 47).map(x => (x/10, (x/10)*(x/10)))
    
    // Fill region
    let left-x = -4.092
    let right-x = 4.092
    
    let fill-p-pts = range(int(left-x*10), int(right-x*10) + 1).map(x => (x/10, (x/10)*(x/10)))
    fill-p-pts.insert(0, (left-x, left-x*left-x))
    fill-p-pts.push((right-x, right-x*right-x))
    
    let big-arc-pts = range(int(right-x*10), int(left-x*10) - 1, step: -1).map(x => {
      let x0 = x/10
      (x0, c2 - calc.sqrt(R2*R2 - x0*x0))
    })
    big-arc-pts.insert(0, (right-x, right-x*right-x))
    big-arc-pts.push((left-x, left-x*left-x))
    
    let fill-pts = fill-p-pts + big-arc-pts
    line(..fill-pts, close: true, fill: rgb(173, 216, 230, 150), stroke: none)
    
    // Whiteout the small circle (hole)
    circle((0, 10), radius: R1, fill: white, stroke: none)
    
    // Draw outlines
    line(..p-pts, stroke: (paint: rgb("C62828"), thickness: 1pt))
    circle((0, 10), radius: R1, stroke: (paint: blue, thickness: 1pt))
    circle((0, c2), radius: R2, stroke: (paint: blue, thickness: 1pt))
    
    // Points
    circle((0, 10), radius: 0.1, fill: black)
    content((-0.8, 9.5), [$10$])
    circle((0, c2), radius: 0.1, fill: black)
    circle((right-x, right-x*right-x), radius: 0.1, fill: black)
    
    content((-2.5, 12), [$(P)$])
  })
]
