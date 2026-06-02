#import "@preview/cetz:0.5.2"

#let prj(x, y, z) = {
  let alpha = -30 * 0.0174532925
  let beta = 20 * 0.0174532925
  let xp = x * calc.cos(alpha) - y * calc.sin(alpha)
  let yp = x * calc.sin(alpha) + y * calc.cos(alpha)
  let ypp = yp * calc.sin(beta) + z * calc.cos(beta)
  (xp, ypp)
}

#let ve-hinh-3d(R: 3) = {
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    let O = prj(0, 0, 0)
    
    // Circle
    circle(O, radius: R, stroke: 1pt + red)
    
    // Ellipse points
    let pts = ()
    for deg in range(0, 361, step: 10) {
      let rad = deg * 0.0174532925
      pts.push(prj(R * calc.cos(rad), R * calc.sin(rad), 0))
    }
    line(..pts, stroke: 1pt + blue)
  })
}

#ve-hinh-3d(R: 3)
