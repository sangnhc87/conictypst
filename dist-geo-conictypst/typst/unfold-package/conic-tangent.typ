// unfold-package/conic-tangent.typ
// Module Khảo Sát Sự Tiếp Xúc Conic & Đường Tròn

#import "@preview/cetz:0.5.2"

// Giải hệ phương trình Parabol y = a*x^2 và Đường tròn tâm (0, c), bán kính R
#let solve-parabola-tangent(a, R: "auto", y: "auto") = {
  let rc = 1 / (2 * a)
  if y == "auto" and R != "auto" {
    if R <= rc {
      return (R: R, x: 0, y: R, pos: "vertex")
    } else {
      return (R: R, x: 0, y: a * R * R + 1 / (4 * a), pos: "sides")
    }
  } else if R == "auto" and y != "auto" {
    if y <= rc {
      return (R: y, x: 0, y: y, pos: "vertex")
    } else {
      let val = 4 * y / a - 1 / (a * a)
      if val < 0 { val = 0 }
      return (R: calc.sqrt(val) / 2, x: 0, y: y, pos: "sides")
    }
  }
  return (R: R, x: 0, y: y, pos: "given")
}

// Giải hệ Elip x^2/a^2 + y^2/b^2 = 1 và đường tròn trên trục y
#let solve-ellipse-tangent(a, b, R: "auto", y: "auto") = {
  let rc = a * a / b
  let k2 = (b * b) / (a * a) - 1
  
  if y == "auto" and R != "auto" {
    if R <= rc {
      return (R: R, x: 0, y: -b + R, pos: "vertex")
    } else {
      let val = k2 * (a * a - R * R)
      if val < 0 { val = 0 }
      return (R: R, x: 0, y: -calc.sqrt(val), pos: "sides")
    }
  } else if R == "auto" and y != "auto" {
    return (R: 0, x: 0, y: y, pos: "unknown")
  }
  return (R: R, x: 0, y: y, pos: "given")
}

// Giải hệ Hypebol x^2/a^2 - y^2/b^2 = 1 và đường tròn trên trục y
#let solve-hyperbola-tangent(a, b, R: "auto", y: "auto") = {
  let k2 = (b * b) / (a * a) + 1
  if y == "auto" and R != "auto" {
    if R <= a {
      return (R: R, x: 0, y: 0, pos: "pass")
    } else {
      let val = k2 * (R * R - a * a)
      if val < 0 { val = 0 }
      return (R: R, x: 0, y: calc.sqrt(val), pos: "sides") // Bị kẹt ở nhánh dương
    }
  }
  return (R: R, x: 0, y: y, pos: "given")
}

#let _get-paint(strk) = {
  if type(strk) == dictionary { strk.at("paint", default: rgb("1565C0")) }
  else if type(strk) == color { strk }
  else if type(strk) == gradient { strk }
  else { rgb("1565C0") }
}

#let _draw-axes(ranges, show-grid: true, show-ticks: true, show-labels: true) = {
  import cetz.draw: *
  let (xr, yr) = ranges
  
  if show-grid {
    for x in range(int(calc.floor(xr.at(0))), int(calc.ceil(xr.at(1))) + 1) {
      if x != 0 {
        line((x, yr.at(0)), (x, yr.at(1)), stroke: (paint: luma(240), thickness: 0.5pt))
      }
    }
    for y in range(int(calc.floor(yr.at(0))), int(calc.ceil(yr.at(1))) + 1) {
      if y != 0 {
        line((xr.at(0), y), (xr.at(1), y), stroke: (paint: luma(240), thickness: 0.5pt))
      }
    }
  }
  
  line((xr.at(0), 0), (xr.at(1), 0), mark: (end: ">"), stroke: teal)
  line((0, yr.at(0)), (0, yr.at(1)), mark: (end: ">"), stroke: teal)
  
  if show-ticks {
    for x in range(int(calc.floor(xr.at(0))), int(calc.ceil(xr.at(1))) + 1) {
      if x != 0 { line((x, -0.1), (x, 0.1), stroke: teal) }
    }
    for y in range(int(calc.floor(yr.at(0))), int(calc.ceil(yr.at(1))) + 1) {
      if y != 0 { line((-0.1, y), (0.1, y), stroke: teal) }
    }
  }
  
  if show-labels {
    content((xr.at(1) - 0.3, -0.4), text(fill: teal, size: 9pt)[$x$])
    content((-0.4, yr.at(1) - 0.3), text(fill: teal, size: 9pt)[$y$])
    content((-0.3, -0.3), text(fill: teal, size: 9pt)[$O$])
  }
}

#let _draw-circles(c-list, solver, mode: "2d") = {
  import cetz.draw: *
  for c-info in c-list {
    let R = c-info.at("R", default: "auto")
    let x = c-info.at("x", default: "auto")
    let y = c-info.at("y", default: "auto")
    
    if x == "auto" or x == 0 {
      if y == "auto" or R == "auto" {
        let res = solver(R: R, y: y)
        R = res.R; x = res.x; y = res.y
      } else {
        x = 0
      }
    }
    
    let strk = c-info.at("stroke", default: blue)
    let fll = none
    if mode == "3d" {
      // 3D Sphere effect
      fll = gradient.radial(white, strk.darken(20%), center: (30%, 30%), radius: 70%)
      strk = none
    } else {
      fll = c-info.at("fill", default: strk.lighten(80%))
    }
    
    circle((x, y), radius: R, stroke: strk, fill: fll)
    
    if mode == "2d" and c-info.at("dot", default: true) {
      circle((x, y), radius: 0.1, fill: black)
    }
    
    if "name" in c-info {
      content((x + R/2, y + R/2), c-info.name)
    }
  }
}

// --------------------------------------------------------
// CÁC HÀM XUẤT (EXPORTS)
// --------------------------------------------------------

#let draw-tangent-parabola(
  a: 1,
  domain: (-5, 5),
  circles: (),
  show-axes: true,
  axes-range: ((-5, 5), (-1, 10)),
  curve-stroke: (paint: teal, thickness: 1pt),
  samples: 100,
  mode: "2d", // "2d" or "3d"
  fill-region: none
) = {
  import cetz.draw: *
  if show-axes { _draw-axes(axes-range) }
  
  let p-pts = range(0, samples + 1).map(i => {
    let t = domain.at(0) + (domain.at(1) - domain.at(0)) * i / samples
    (t, a * t * t)
  })
  
  let c-paint = _get-paint(curve-stroke)
  let actual-fill = fill-region
  if mode == "3d" and fill-region == none {
    actual-fill = rgb("E3F2FD").transparentize(20%) // Pale blue
    curve-stroke = (paint: rgb("1565C0"), thickness: 1.2pt) // Dark blue
    c-paint = rgb("1565C0")
  }
  
  if mode == "3d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-parabola-tangent(a, R: R, y: y), mode: "3d")
  }
  
  line(..p-pts, stroke: curve-stroke, fill: actual-fill)
  
  if mode == "3d" {
    let x_max = calc.max(calc.abs(domain.at(0)), calc.abs(domain.at(1)))
    let y_max = a * x_max * x_max
    circle((0, y_max), radius: (x_max, x_max * 0.15), fill: rgb("BBDEFB").transparentize(10%), stroke: curve-stroke)
  }
  
  if mode == "2d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-parabola-tangent(a, R: R, y: y), mode: "2d")
  }
}

#let draw-tangent-ellipse(
  a: 4, b: 2,
  circles: (),
  show-axes: true,
  axes-range: ((-5, 5), (-4, 4)),
  curve-stroke: (paint: teal, thickness: 1pt),
  samples: 180,
  mode: "2d",
  fill-region: none
) = {
  import cetz.draw: *
  if show-axes { _draw-axes(axes-range) }
  
  let c-paint = _get-paint(curve-stroke)
  let actual-fill = fill-region
  if mode == "3d" and fill-region == none {
    actual-fill = rgb("E3F2FD").transparentize(20%)
    curve-stroke = (paint: rgb("1565C0"), thickness: 1.2pt)
    c-paint = rgb("1565C0")
  }
  
  if mode == "3d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-ellipse-tangent(a, b, R: R, y: y), mode: "3d")
  }
  
  let e-pts = range(0, samples + 1).map(i => {
    let t = -180 + 360 * i / samples
    let rad = t * 3.14159 / 180
    (a * calc.cos(rad), b * calc.sin(rad))
  })
  line(..e-pts, stroke: curve-stroke, close: true, fill: actual-fill)
  
  if mode == "3d" {
    // Equator dash to enhance 3D sphere look
    circle((0, 0), radius: (a, a * 0.15), stroke: (paint: rgb("1565C0"), thickness: 0.8pt, dash: "dashed"))
  }
  
  if mode == "2d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-ellipse-tangent(a, b, R: R, y: y), mode: "2d")
  }
}

#let draw-tangent-hyperbola(
  a: 3, b: 4,
  domain: (-3, 3), // y range
  circles: (),
  show-axes: true,
  axes-range: ((-6, 6), (-4, 4)),
  curve-stroke: (paint: teal, thickness: 1pt),
  samples: 100,
  mode: "2d",
  fill-region: none
) = {
  import cetz.draw: *
  if show-axes { _draw-axes(axes-range) }
  
  let c-paint = _get-paint(curve-stroke)
  let actual-fill = fill-region
  if mode == "3d" and fill-region == none {
    actual-fill = rgb("E3F2FD").transparentize(20%)
    curve-stroke = (paint: rgb("1565C0"), thickness: 1.2pt)
    c-paint = rgb("1565C0")
  }
  
  if mode == "3d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-hyperbola-tangent(a, b, R: R, y: y), mode: "3d")
  }
  
  let h1-pts = range(0, samples + 1).map(i => {
    let y0 = domain.at(0) + (domain.at(1) - domain.at(0)) * i / samples
    (a * calc.sqrt(1 + y0 * y0 / (b * b)), y0)
  })
  let h2-pts = h1-pts.map(pt => (-pt.at(0), pt.at(1)))
  
  if actual-fill != none {
    let full-pts = h1-pts + h2-pts.rev()
    line(..full-pts, stroke: none, fill: actual-fill, close: true)
  }
  
  line(..h1-pts, stroke: curve-stroke)
  line(..h2-pts, stroke: curve-stroke)
  
  if mode == "3d" {
    let y_top = domain.at(1)
    let y_bot = domain.at(0)
    let x_top = a * calc.sqrt(1 + y_top * y_top / (b * b))
    let x_bot = a * calc.sqrt(1 + y_bot * y_bot / (b * b))
    
    circle((0, y_top), radius: (x_top, calc.abs(x_top) * 0.15), fill: rgb("BBDEFB").transparentize(10%), stroke: curve-stroke)
    circle((0, y_bot), radius: (x_bot, calc.abs(x_bot) * 0.15), fill: rgb("BBDEFB").transparentize(10%), stroke: curve-stroke)
  }
  
  if mode == "2d" {
    _draw-circles(circles, (R: "auto", y: "auto") => solve-hyperbola-tangent(a, b, R: R, y: y), mode: "2d")
  }
}
