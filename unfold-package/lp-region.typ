// unfold-package/lp-region.typ
// Tự động tìm và vẽ miền nghiệm quy hoạch tuyến tính

#import "@preview/cetz:0.5.2"

// Hàm tạo chuỗi phương trình
#let _format-line-eq(a, b, c) = {
  let lhs = ""
  if a != 0.0 {
    let a_str = if a == 1.0 { "" } else if a == -1.0 { "-" } else { str(calc.round(a, digits: 2)) }
    lhs += a_str + "x"
  }
  if b != 0.0 {
    let b_str = if b == 1.0 { "" } else if b == -1.0 { "-" } else { str(calc.round(calc.abs(b), digits: 2)) }
    if lhs != "" {
      if b > 0.0 { lhs += " + " + b_str + "y" } else { lhs += " - " + b_str + "y" }
    } else {
      if b < 0.0 { lhs += "-" + b_str + "y" } else { lhs += b_str + "y" }
    }
  }
  return eval("$" + lhs + " = " + str(calc.round(c, digits: 2)) + "$")
}

// Hàm chuẩn hoá bất phương trình về dạng ax + by <= c
#let _normalize-ineqs(ineqs, bounds) = {
  let list = ()
  for eq in ineqs {
    let a = eq.at("a", default: 0)
    let b = eq.at("b", default: 0)
    let c = eq.at("c", default: 0)
    let op = eq.at("op", default: "<=")
    if op == ">=" {
      a = -a
      b = -b
      c = -c
    } else if op == "=" {
      // Equation is not an inequality, but we could handle it. Let's ignore for now.
    }
    list.push((a: float(a), b: float(b), c: float(c)))
  }
  
  // Thêm bounding box
  if bounds != none {
    if "x" in bounds {
      list.push((a: -1.0, b: 0.0, c: -float(bounds.x.at(0)), is-bound: true))
      list.push((a: 1.0, b: 0.0, c: float(bounds.x.at(1)), is-bound: true))
    }
    if "y" in bounds {
      list.push((a: 0.0, b: -1.0, c: -float(bounds.y.at(0)), is-bound: true))
      list.push((a: 0.0, b: 1.0, c: float(bounds.y.at(1)), is-bound: true))
    }
  }
  return list
}

#let _clip-line-to-bounds(a, b, c, bounds) = {
  let x_min = float(bounds.x.at(0))
  let x_max = float(bounds.x.at(1))
  let y_min = float(bounds.y.at(0))
  let y_max = float(bounds.y.at(1))
  let pts = ()
  
  if calc.abs(b) > 1e-5 {
    let y1 = (c - a * x_min) / b
    if y1 >= y_min - 1e-5 and y1 <= y_max + 1e-5 { pts.push((x_min, y1)) }
    let y2 = (c - a * x_max) / b
    if y2 >= y_min - 1e-5 and y2 <= y_max + 1e-5 { pts.push((x_max, y2)) }
  }
  if calc.abs(a) > 1e-5 {
    let x1 = (c - b * y_min) / a
    if x1 >= x_min - 1e-5 and x1 <= x_max + 1e-5 { pts.push((x1, y_min)) }
    let x2 = (c - b * y_max) / a
    if x2 >= x_min - 1e-5 and x2 <= x_max + 1e-5 { pts.push((x2, y_max)) }
  }
  
  // Lọc trùng
  let unique = ()
  for p in pts {
    let dup = false
    for u in unique {
      if calc.abs(p.at(0) - u.at(0)) < 1e-5 and calc.abs(p.at(1) - u.at(1)) < 1e-5 {
        dup = true
      }
    }
    if not dup { unique.push(p) }
  }
  return unique
}

#let solve-lp(ineqs, bounds: (x: (-1, 15), y: (-1, 15)), epsilon: 1e-5) = {
  let eq-list = _normalize-ineqs(ineqs, bounds)
  let n = eq-list.len()
  let vertices = ()
  
  for i in range(n) {
    for j in range(i + 1, n) {
      let eq1 = eq-list.at(i)
      let eq2 = eq-list.at(j)
      let D = eq1.a * eq2.b - eq2.a * eq1.b
      
      if calc.abs(D) > epsilon {
        let x = (eq1.c * eq2.b - eq2.c * eq1.b) / D
        let y = (eq1.a * eq2.c - eq2.a * eq1.c) / D
        
        // Kiểm tra xem (x,y) có thoả mãn tất cả các bpt không
        let valid = true
        for k in range(n) {
          let eqk = eq-list.at(k)
          if eqk.a * x + eqk.b * y > eqk.c + epsilon {
            valid = false
            break
          }
        }
        
        if valid {
          // Lọc trùng
          let is-dup = false
          for v in vertices {
            if calc.abs(v.at(0) - x) < epsilon and calc.abs(v.at(1) - y) < epsilon {
              is-dup = true
              break
            }
          }
          if not is-dup {
            vertices.push((x, y))
          }
        }
      }
    }
  }
  
  if vertices.len() < 3 {
    return vertices
  }
  
  let cx = 0.0
  let cy = 0.0
  for v in vertices {
    cx += v.at(0)
    cy += v.at(1)
  }
  cx = cx / vertices.len()
  cy = cy / vertices.len()
  
  let sorted = vertices.map(v => {
    let dx = v.at(0) - cx
    let dy = v.at(1) - cy
    let angle = calc.atan2(dx, dy)
    (pt: v, ang: angle.deg())
  }).sorted(key: x => x.ang)
  
  return sorted.map(x => x.pt)
}

#let draw-lp-region(
  ineqs, 
  bounds: "auto", 
  p-fill: rgb("E3F2FD"), 
  p-stroke: none,
  draw-vertices: true,
  vertex-radius: 0.08,
  vertex-fill: black,
  format-vertex: none,     // Hàm format: pt => content
  draw-lines: true,        // Tự động vẽ các đường thẳng biên
  draw-axes: true,         // Tự động vẽ trục toạ độ (nếu chứa x>=0, y>=0)
  auto-labels: "name", // "name" (d_1, d_2), "equation" (ax+by=c), hoặc none
  x-tick-step: "auto",
  y-tick-step: "auto",
  line-stroke: (paint: gray, dash: "dashed")
) = {
  import cetz.draw: *
  
  // 1. Tự động tính toán bounds nếu bounds == "auto"
  let computed-bounds = bounds
  if bounds == "auto" {
    let eq-list-no-bounds = _normalize-ineqs(ineqs, none)
    let valid-pts = ()
    let n = eq-list-no-bounds.len()
    for i in range(n) {
      for j in range(i + 1, n) {
        let eq1 = eq-list-no-bounds.at(i)
        let eq2 = eq-list-no-bounds.at(j)
        let det = eq1.a * eq2.b - eq2.a * eq1.b
        if calc.abs(det) > 1e-5 {
          let x = (eq1.c * eq2.b - eq2.c * eq1.b) / det
          let y = (eq1.a * eq2.c - eq2.a * eq1.c) / det
          
          let valid = true
          for eq in eq-list-no-bounds {
            if eq.a * x + eq.b * y > eq.c + 1e-5 {
              valid = false; break
            }
          }
          if valid { valid-pts.push((x, y)) }
        }
      }
    }
    
    if valid-pts.len() > 0 {
      let xs = valid-pts.map(p => p.at(0))
      let ys = valid-pts.map(p => p.at(1))
      let x-max = calc.max(..xs)
      let y-max = calc.max(..ys)
      let x-min = calc.min(..xs)
      let y-min = calc.min(..ys)
      
      let x-pad = calc.max(5.0, (x-max - x-min) * 0.4)
      let y-pad = calc.max(5.0, (y-max - y-min) * 0.4)
      
      computed-bounds = (
        x: (calc.min(-1.0, x-min - 1.0), x-max + x-pad),
        y: (calc.min(-1.0, y-min - 1.0), y-max + y-pad)
      )
    } else {
      computed-bounds = (x: (-1, 10), y: (-1, 10))
    }
  }
  
  let eq-list = _normalize-ineqs(ineqs, computed-bounds)
  let pts = solve-lp(ineqs, bounds: computed-bounds)
  
  if pts.len() >= 3 {
    line(..pts, close: true, fill: p-fill, stroke: p-stroke)
  }
  
  if draw-axes {
    // Vẽ trục Ox, Oy mở rộng tới bounds
    let x-min-val = computed-bounds.x.at(0)
    let x-max-val = computed-bounds.x.at(1)
    let y-min-val = computed-bounds.y.at(0)
    let y-max-val = computed-bounds.y.at(1)
    
    line((x-min-val, 0), (x-max-val + 1, 0), mark: (end: ">"))
    line((0, y-min-val), (0, y-max-val + 1), mark: (end: ">"))
    content((x-max-val + 1, -0.4), [$x$])
    content((-0.4, y-max-val + 1), [$y$])
    content((-0.4, -0.4), [$O$])
    
    // Ticks X
    let x-range = x-max-val - x-min-val
    let x-step = if x-tick-step == "auto" {
      if x-range > 50 { 10 } else if x-range > 20 { 5 } else if x-range > 10 { 2 } else { 1 }
    } else { x-tick-step }
    
    let x-start = int(calc.round(x-min-val / x-step))
    let x-end = int(calc.round(x-max-val / x-step))
    for i in range(x-start, x-end + 1) {
      let cur-x = i * x-step
      if cur-x != 0 {
        line((cur-x, -0.1), (cur-x, 0.1))
        content((cur-x, -0.5), str(cur-x))
      }
    }
    
    // Ticks Y
    let y-range = y-max-val - y-min-val
    let y-step = if y-tick-step == "auto" {
      if y-range > 50 { 10 } else if y-range > 20 { 5 } else if y-range > 10 { 2 } else { 1 }
    } else { y-tick-step }
    
    let y-start = int(calc.round(y-min-val / y-step))
    let y-end = int(calc.round(y-max-val / y-step))
    for i in range(y-start, y-end + 1) {
      let cur-y = i * y-step
      if cur-y != 0 {
        line((-0.1, cur-y), (0.1, cur-y))
        content((-0.5, cur-y), str(cur-y))
      }
    }
  }
  
  if draw-lines {
    let line-idx = 1
    for eq in eq-list {
      if "is-bound" in eq and eq.is-bound { continue }
      // Bỏ qua các đường trùng với trục toạ độ vì đã vẽ ở draw-axes
      if eq.c == 0 and (eq.a == 0 or eq.b == 0) { continue }
      
      let clip-pts = _clip-line-to-bounds(eq.a, eq.b, eq.c, computed-bounds)
      if clip-pts.len() == 2 {
        let style = eq.at("stroke", default: line-stroke)
        line(clip-pts.at(0), clip-pts.at(1), stroke: style)
        
        let label = none
        if "label" in eq { label = eq.label }
        else if auto-labels == "equation" { label = _format-line-eq(eq.a, eq.b, eq.c) }
        else if auto-labels == "name" { 
          label = eval("$d_" + str(line-idx) + "$")
          line-idx += 1
        }
        
        if label != none {
          // Tìm điểm xa gốc toạ độ nhất hoặc có x lớn nhất để đặt label
          let p-end = if clip-pts.at(1).at(0) > clip-pts.at(0).at(0) { clip-pts.at(1) } else { clip-pts.at(0) }
          
          let paint = style.at("paint", default: gray)
          content((p-end.at(0) - 0.2, p-end.at(1) + 0.4), text(paint)[#label])
        }
      }
    }
  }
  
  if draw-vertices {
    let i = 0
    let chars = ("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K")
    for pt in pts {
      circle(pt, radius: vertex-radius, fill: vertex-fill, stroke: none)
      
      // Auto label if format-vertex is true/auto, or use custom function
      if format-vertex == "auto" {
        // Chỉ dán nhãn các điểm không trùng gốc toạ độ
        if calc.abs(pt.at(0)) > 1e-3 or calc.abs(pt.at(1)) > 1e-3 {
          let name = chars.at(calc.rem(i, chars.len()))
          let lx = calc.round(pt.at(0), digits: 1)
          let ly = calc.round(pt.at(1), digits: 1)
          content((pt.at(0) + 0.4, pt.at(1) + 0.3), [#name$(#lx; #ly)$])
          i += 1
        }
      } else if format-vertex != none {
        content((pt.at(0) + 0.4, pt.at(1) + 0.3), format-vertex(pt))
      }
    }
  }
}
