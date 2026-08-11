#import "@preview/cetz:0.5.2"

// Hàm tìm nghiệm f(x) - g(x) = 0 bằng quét mẫu + bisection
#let _find-roots(f, g, domain, samples: 200, epsilon: 1e-4) = {
  let roots = ()
  let h(x) = f(x) - g(x)
  let (a, b) = (float(domain.at(0)), float(domain.at(1)))
  let step = (b - a) / samples
  
  let prev-val = h(a)
  let prev-x = a
  
  for i in range(1, samples + 1) {
    let curr-x = a + i * step
    let curr-val = h(curr-x)
    
    // Nếu có đổi dấu hoặc chạm trục 0
    if curr-val * prev-val <= 0 {
      let left = prev-x
      let right = curr-x
      let mid = left
      for _ in range(40) {
        mid = (left + right) / 2.0
        if calc.abs(h(mid)) < epsilon {
          break
        }
        if h(mid) * h(left) <= 0 {
          right = mid
        } else {
          left = mid
        }
      }
      
      // Tránh trùng nghiệm
      let dup = false
      for r in roots {
        if calc.abs(r - mid) < 1e-3 { dup = true }
      }
      if not dup { roots.push(mid) }
    }
    
    prev-val = curr-val
    prev-x = curr-x
  }
  return roots
}

// Vẽ miền giữa 2 hàm số
#let draw-integral-region(
  f, ..args, 
  domain: (-5, 5), 
  p-fill: rgb("E3F2FD"), 
  p-stroke: none,
  draw-functions: true,
  f-stroke: (paint: rgb("1565C0"), thickness: 1.5pt),
  g-stroke: (paint: rgb("E91E63"), thickness: 1.5pt),
  f-label: none,
  g-label: none,
  samples: 150,
  fill-domain: "auto",      // "auto" (lấy từ nghiệm đầu tới cuối) hoặc (a, b)
  draw-axes: true,          // Tự động vẽ trục toạ độ
  draw-intersections: true, // Đánh dấu các giao điểm
  x-tick-step: "auto",
  y-tick-step: "auto"
) = {
  import cetz.draw: *
  
  let g = if args.pos().len() > 0 { args.pos().first() } else { none }
  let actual-g = if g == none { x => 0.0 } else { g }
  
  // 1. Xác định nghiệm
  let roots = ()
  if fill-domain == "auto" or draw-intersections {
    roots = _find-roots(f, actual-g, domain)
  }
  
  // 2. Xác định các phân đoạn cần tô màu
  let fill-segments = ()
  if fill-domain == "auto" {
    if roots.len() >= 2 {
      for i in range(roots.len() - 1) {
        fill-segments.push((roots.at(i), roots.at(i+1)))
      }
    } else if roots.len() == 1 {
      // Chỉ cắt 1 điểm, không có miền
    } else {
      fill-segments.push((float(domain.at(0)), float(domain.at(1))))
    }
  } else {
    fill-segments.push((float(fill-domain.at(0)), float(fill-domain.at(1))))
  }
  
  // 3. Tạo đa giác khép kín để fill (Tới theo f, lùi theo g)
  for (idx, seg) in fill-segments.enumerate() {
    let s-start = seg.at(0)
    let s-end = seg.at(1)
    if s-end > s-start + 1e-3 {
      let pts = ()
      let fill-steps = 80
      let step = (s-end - s-start) / fill-steps
      
      for i in range(fill-steps + 1) {
        let x = s-start + i * step
        pts.push((x, f(x)))
      }
      for i in range(fill-steps, -1, step: -1) {
        let x = s-start + i * step
        pts.push((x, actual-g(x)))
      }
      
      let current-fill = if type(p-fill) == array {
        p-fill.at(calc.rem(idx, p-fill.len()))
      } else {
        p-fill
      }
      
      // Fill miền
      line(..pts, close: true, fill: current-fill, stroke: p-stroke)
    }
  }
  
  // 4. Vẽ 2 hàm số
  let y-min = 0.0
  let y-max = 0.0
  let x-min = float(domain.at(0))
  let x-max = float(domain.at(1))
  
  if draw-functions {
    let f-pts = ()
    let g-pts = ()
    let d-step = float(x-max - x-min) / samples
    for i in range(samples + 1) {
      let x = x-min + i * d-step
      let fy = f(x)
      let gy = actual-g(x)
      f-pts.push((x, fy))
      g-pts.push((x, gy))
      
      if i == 0 {
        y-min = calc.min(fy, gy)
        y-max = calc.max(fy, gy)
      } else {
        y-min = calc.min(y-min, fy, gy)
        y-max = calc.max(y-max, fy, gy)
      }
    }
    line(..f-pts, stroke: f-stroke)
    if g != none {
      line(..g-pts, stroke: g-stroke)
    }
  }
  
  // Labels
  if f-label != none {
    content((x-max, f(x-max) + 0.4), f-label)
  }
  if g-label != none {
    content((x-max, actual-g(x-max) - 0.4), g-label)
  }
  
  // 5. Vẽ hệ trục toạ độ
  if draw-axes {
    // Căn chỉnh trục Y
    let actual-y-min = calc.min(y-min, 0.0)
    let actual-y-max = calc.max(y-max, 0.0)
    
    // Trục Ox, Oy
    line((x-min - 0.5, 0), (x-max + 1, 0), mark: (end: ">"))
    line((0, actual-y-min - 0.5), (0, actual-y-max + 1), mark: (end: ">"))
    content((x-max + 1, -0.4), [$x$])
    content((-0.4, actual-y-max + 1), [$y$])
    content((-0.4, -0.4), [$O$])
    
    // Ticks X
    let x-range = x-max - x-min
    let x-step = if x-tick-step == "auto" {
      if x-range > 50 { 10 } else if x-range > 20 { 5 } else if x-range > 10 { 2 } else { 1 }
    } else { x-tick-step }
    
    let x-start-idx = int(calc.round(x-min / x-step))
    let x-end-idx = int(calc.round(x-max / x-step))
    for i in range(x-start-idx, x-end-idx + 1) {
      let cur-x = i * x-step
      if cur-x != 0 {
        line((cur-x, -0.1), (cur-x, 0.1))
        content((cur-x, -0.5), str(cur-x))
      }
    }
    
    // Ticks Y
    let y-range = actual-y-max - actual-y-min
    let y-step = if y-tick-step == "auto" {
      if y-range > 50 { 10 } else if y-range > 20 { 5 } else if y-range > 10 { 2 } else { 1 }
    } else { y-tick-step }
    
    let y-start-idx = int(calc.round(actual-y-min / y-step))
    let y-end-idx = int(calc.round(actual-y-max / y-step))
    for i in range(y-start-idx, y-end-idx + 1) {
      let cur-y = i * y-step
      if cur-y != 0 {
        line((-0.1, cur-y), (0.1, cur-y))
        content((-0.5, cur-y), str(cur-y))
      }
    }
  }
  
  // 6. Đánh dấu các giao điểm
  if draw-intersections {
    for r in roots {
      let pt = (r, f(r))
      circle(pt, radius: 0.08, fill: black, stroke: none)
    }
  }
}
