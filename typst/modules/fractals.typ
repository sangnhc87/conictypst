#import "@preview/cetz:0.5.2"

// 1. Recursive Sierpinski Triangle (Gasket)
// Draw an equilateral triangle and recursively draw the middle "cutout" triangles (tô màu xám/bỏ đi).
#let draw-sierpinski(x1, y1, x2, y2, x3, y3, depth, max-depth, fill-color, stroke-color) = {
  if depth > max-depth { return }
  
  let mx1 = (x1 + x2) / 2
  let my1 = (y1 + y2) / 2
  let mx2 = (x2 + x3) / 2
  let my2 = (y2 + y3) / 2
  let mx3 = (x3 + x1) / 2
  let my3 = (y3 + y1) / 2
  
  import cetz.draw: line
  line((mx1, my1), (mx2, my2), (mx3, my3), close: true, fill: fill-color, stroke: stroke-color)
  
  draw-sierpinski(x1, y1, mx1, my1, mx3, my3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski(mx1, my1, x2, y2, mx2, my2, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski(mx3, my3, mx2, my2, x3, y3, depth + 1, max-depth, fill-color, stroke-color)
}

// 2. Recursive Sierpinski Carpet
// Divide a rectangle/square into 9 parts, and recursively remove the center one.
#let draw-sierpinski-carpet(x, y, w, h, depth, max-depth, fill-color, stroke-color) = {
  if depth > max-depth { return }
  
  let w3 = w / 3
  let h3 = h / 3
  
  import cetz.draw: rect
  rect((x + w3, y + h3), (x + 2 * w3, y + 2 * h3), fill: fill-color, stroke: stroke-color)
  
  draw-sierpinski-carpet(x, y, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski-carpet(x + w3, y, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski-carpet(x + 2 * w3, y, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  
  draw-sierpinski-carpet(x, y + h3, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski-carpet(x + 2 * w3, y + h3, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  
  draw-sierpinski-carpet(x, y + 2 * h3, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski-carpet(x + w3, y + 2 * h3, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
  draw-sierpinski-carpet(x + 2 * w3, y + 2 * h3, w3, h3, depth + 1, max-depth, fill-color, stroke-color)
}

// 3. Recursive Koch Curve
// Divide segment P1-P2 into 3 parts, build an outward equilateral triangle in the middle, and recurse.
#let draw-koch-curve(x1, y1, x2, y2, depth, max-depth, stroke-color) = {
  import cetz.draw: line
  if depth >= max-depth {
    line((x1, y1), (x2, y2), stroke: stroke-color)
    return
  }
  
  let dx = x2 - x1
  let dy = y2 - y1
  
  let ax = x1 + dx / 3
  let ay = y1 + dy / 3
  let bx = x1 + 2 * dx / 3
  let by = y1 + 2 * dy / 3
  
  let mx = x1 + dx / 2
  let my = y1 + dy / 2
  
  // Left rotation (counter-clockwise) to point upwards/outwards
  let k = calc.sqrt(3) / 6
  let cx = mx - dy * k
  let cy = my + dx * k
  
  draw-koch-curve(x1, y1, ax, ay, depth + 1, max-depth, stroke-color)
  draw-koch-curve(ax, ay, cx, cy, depth + 1, max-depth, stroke-color)
  draw-koch-curve(cx, cy, bx, by, depth + 1, max-depth, stroke-color)
  draw-koch-curve(bx, by, x2, y2, depth + 1, max-depth, stroke-color)
}

// Helper to add outward solid triangles on a segment recursively for Koch Snowflake
#let add-koch-triangles(x1, y1, x2, y2, depth, max-depth, fill-color) = {
  if depth > max-depth { return }
  
  let dx = x2 - x1
  let dy = y2 - y1
  
  let ax = x1 + dx / 3
  let ay = y1 + dy / 3
  let bx = x1 + 2 * dx / 3
  let by = y1 + 2 * dy / 3
  
  let mx = x1 + dx / 2
  let my = y1 + dy / 2
  
  // Left rotation (counter-clockwise) to point upwards/outwards
  let k = calc.sqrt(3) / 6
  let cx = mx - dy * k
  let cy = my + dx * k
  
  import cetz.draw: line
  line((ax, ay), (cx, cy), (bx, by), close: true, fill: fill-color, stroke: none)
  
  add-koch-triangles(x1, y1, ax, ay, depth + 1, max-depth, fill-color)
  add-koch-triangles(ax, ay, cx, cy, depth + 1, max-depth, fill-color)
  add-koch-triangles(cx, cy, bx, by, depth + 1, max-depth, fill-color)
  add-koch-triangles(bx, by, x2, y2, depth + 1, max-depth, fill-color)
}

// 4. Recursive Koch Snowflake
// Draws a solid base triangle, recursively adds outward triangles, then outlines with Koch curves.
// Note: To point outwards, the base triangle vertices (x1,y1) -> (x2,y2) -> (x3,y3) must be oriented clockwise.
#let draw-koch-snowflake(x1, y1, x2, y2, x3, y3, max-depth, fill-color, stroke-color) = {
  import cetz.draw: line
  
  // Draw solid base triangle (stroke: none)
  line((x1, y1), (x2, y2), (x3, y3), close: true, fill: fill-color, stroke: none)
  
  if max-depth > 0 {
    // Add solid triangles recursively (stroke: none)
    add-koch-triangles(x1, y1, x2, y2, 1, max-depth, fill-color)
    add-koch-triangles(x2, y2, x3, y3, 1, max-depth, fill-color)
    add-koch-triangles(x3, y3, x1, y1, 1, max-depth, fill-color)
  }
  
  // Draw the clean outer border using Koch curve lines
  draw-koch-curve(x1, y1, x2, y2, 1, max-depth, stroke-color)
  draw-koch-curve(x2, y2, x3, y3, 1, max-depth, stroke-color)
  draw-koch-curve(x3, y3, x1, y1, 1, max-depth, stroke-color)
}

// 5. Recursive Cantor Set
// Draws a line segment, and at each depth draws the left and right thirds, shifted down vertically.
#let draw-cantor-set(x1, x2, y, dy, depth, max-depth, stroke-style) = {
  import cetz.draw: line
  
  line((x1, y), (x2, y), stroke: stroke-style)
  
  if depth < max-depth {
    let third = (x2 - x1) / 3
    draw-cantor-set(x1, x1 + third, y - dy, dy, depth + 1, max-depth, stroke-style)
    draw-cantor-set(x2 - third, x2, y - dy, dy, depth + 1, max-depth, stroke-style)
  }
}

// 6. Sierpinski Tetrahedron (3D Isometric projection)
// Draws the visible faces of a 3D Sierpinski tetrahedron using 4 base vertices in 2D projection.
#let draw-sierpinski-3d(p1, p2, p3, p4, depth, max-depth, c-left, c-right) = {
  if depth >= max-depth {
    import cetz.draw: line
    // Draw the two front-facing triangles
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

  // Draw back to front to simulate 3D occlusion
  draw-sierpinski-3d(m12, p2, m23, m24, depth + 1, max-depth, c-left, c-right) // Back Left
  draw-sierpinski-3d(m13, m23, p3, m34, depth + 1, max-depth, c-left, c-right) // Back Right
  draw-sierpinski-3d(p1, m12, m13, m14, depth + 1, max-depth, c-left, c-right) // Top
  draw-sierpinski-3d(m14, m24, m34, p4, depth + 1, max-depth, c-left, c-right) // Front Bottom
}

// 7. Pythagoras Tree (Fractal of Squares)
// Recursively draws squares on the top edge of previous squares, forming right triangles.
#let draw-pythagoras-tree(x1, y1, x2, y2, depth, max-depth, fill-color) = {
  import cetz.draw: line
  
  let dx = x2 - x1
  let dy = y2 - y1
  
  let p3x = x2 - dy
  let p3y = y2 + dx
  let p4x = x1 - dy
  let p4y = y1 + dx
  
  line((x1, y1), (x2, y2), (p3x, p3y), (p4x, p4y), close: true, fill: fill-color, stroke: 0.1pt + fill-color.darken(20%))
  
  if depth < max-depth {
    // Vertex of the 45-45-90 right triangle on top
    let p5x = p4x + dx/2 - dy/2
    let p5y = p4y + dy/2 + dx/2
    
    draw-pythagoras-tree(p4x, p4y, p5x, p5y, depth + 1, max-depth, fill-color)
    draw-pythagoras-tree(p5x, p5y, p3x, p3y, depth + 1, max-depth, fill-color)
  }
}

// 8. Fractal Canopy (Binary Tree)
#let draw-fractal-canopy(x1, y1, x2, y2, depth, max-depth, angle-rad, scale, stroke-color) = {
  import cetz.draw: line
  line((x1, y1), (x2, y2), stroke: stroke-color)
  
  if depth < max-depth {
    let dx = x2 - x1
    let dy = y2 - y1
    
    let c = calc.cos(angle-rad)
    let s = calc.sin(angle-rad)
    
    let dx1 = scale * (dx * c - dy * s)
    let dy1 = scale * (dx * s + dy * c)
    
    let dx2 = scale * (dx * c + dy * s)
    let dy2 = scale * (-dx * s + dy * c)
    
    draw-fractal-canopy(x2, y2, x2 + dx1, y2 + dy1, depth + 1, max-depth, angle-rad, scale, stroke-color)
    draw-fractal-canopy(x2, y2, x2 + dx2, y2 + dy2, depth + 1, max-depth, angle-rad, scale, stroke-color)
  }
}
