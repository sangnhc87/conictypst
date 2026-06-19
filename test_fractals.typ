#import "@preview/cetz:0.5.2"

#let draw-pythagoras-tree(x1, y1, x2, y2, depth, max-depth, fill-color) = {
  import cetz.draw: line
  
  let dx = x2 - x1
  let dy = y2 - y1
  
  let p3x = x2 - dy
  let p3y = y2 + dx
  let p4x = x1 - dy
  let p4y = y1 + dx
  
  line((x1, y1), (x2, y2), (p3x, p3y), (p4x, p4y), close: true, fill: fill-color, stroke: 0.2pt + fill-color.darken(20%))
  
  if depth < max-depth {
    let p5x = p4x + dx/2 - dy/2
    let p5y = p4y + dy/2 + dx/2
    
    draw-pythagoras-tree(p4x, p4y, p5x, p5y, depth + 1, max-depth, fill-color)
    draw-pythagoras-tree(p5x, p5y, p3x, p3y, depth + 1, max-depth, fill-color)
  }
}

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

#align(center)[
  #cetz.canvas(length: 1cm, {
    draw-pythagoras-tree(-1, 0, 1, 0, 0, 8, rgb("22c55e"))
  })
]

#align(center)[
  #cetz.canvas(length: 1cm, {
    draw-fractal-canopy(0, 0, 0, 2, 0, 10, 30deg, 0.75, 1pt + rgb("84cc16"))
  })
]
