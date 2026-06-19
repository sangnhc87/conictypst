#import "@preview/cetz:0.5.2"

#let p1 = (0, 3)     // Top
#let p2 = (-2, -1)   // Back Left
#let p3 = (2, -1)    // Back Right
#let p4 = (0, -2)    // Front Bottom

#let draw-sierpinski-3d(p1, p2, p3, p4, depth, max-depth, c-left, c-right) = {
  if depth >= max-depth {
    import cetz.draw: line
    // We only draw the two front-facing triangles of this tetrahedron
    line(p1, p2, p4, close: true, fill: c-left, stroke: 0.1pt + c-left.darken(10%))
    line(p1, p3, p4, close: true, fill: c-right, stroke: 0.1pt + c-right.darken(10%))
    return
  }

  // Midpoints
  let m12 = ((p1.at(0)+p2.at(0))/2, (p1.at(1)+p2.at(1))/2)
  let m13 = ((p1.at(0)+p3.at(0))/2, (p1.at(1)+p3.at(1))/2)
  let m14 = ((p1.at(0)+p4.at(0))/2, (p1.at(1)+p4.at(1))/2)
  
  let m23 = ((p2.at(0)+p3.at(0))/2, (p2.at(1)+p3.at(1))/2)
  let m24 = ((p2.at(0)+p4.at(0))/2, (p2.at(1)+p4.at(1))/2)
  
  let m34 = ((p3.at(0)+p4.at(0))/2, (p3.at(1)+p4.at(1))/2)

  // Draw back to front
  // 1. Back Left (p2)
  draw-sierpinski-3d(m12, p2, m23, m24, depth + 1, max-depth, c-left, c-right)
  // 2. Back Right (p3)
  draw-sierpinski-3d(m13, m23, p3, m34, depth + 1, max-depth, c-left, c-right)
  // 3. Top (p1)
  draw-sierpinski-3d(p1, m12, m13, m14, depth + 1, max-depth, c-left, c-right)
  // 4. Front (p4)
  draw-sierpinski-3d(m14, m24, m34, p4, depth + 1, max-depth, c-left, c-right)
}

#align(center)[
  #cetz.canvas(length: 2cm, {
    draw-sierpinski-3d(p1, p2, p3, p4, 0, 4, rgb("38bdf8"), rgb("0284c7"))
  })
]
