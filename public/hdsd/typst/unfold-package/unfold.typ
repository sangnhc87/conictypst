// unfold.typ
// Package gon de ve hinh trai phang va duong di ngan nhat.
// Dung voi Typst + CeTZ.
// Cach dung:
//   #import "unfold.typ": *
//   #cone(r: 1, l: 12, to: 5, display: "both")
//   #cylinder(r: 2, h: 6, display: "both")
//   #prism(n: 6, a: 1, h: 5, faces: 8, display: "both")

#import "@preview/cetz:0.5.2"
#import "tree.typ": *
#import "conic-tangent.typ": *
#import "lp-region.typ": solve-lp, draw-lp-region
#import "integral-region.typ": draw-integral-region

#let _blue = rgb("1A5276")
#let _green = rgb("388E3C")
#let _pink = rgb("E91E63")
#let _gray = rgb("777777")
#let _light_blue = rgb("E3F2FD")
#let _light_green = rgb("E8F5E9")
#let _light_pink = rgb("FCE4EC")
#let _light_orange = rgb("FFF3E0")

#let _pt(o, rad, ang) = (
  o.at(0) + rad * calc.cos(ang),
  o.at(1) + rad * calc.sin(ang),
)

#let _label(body, fill: white, size: 9pt) = box(
  fill: fill,
  inset: 2pt,
  radius: 2pt,
  text(size: size, body),
)

#let _mark(pos, name: none, paint: black, fill_label: white) = {
  import cetz.draw: circle, content
  circle(pos, radius: 0.1, fill: paint)
  if name != none {
    content((pos.at(0) + 0.4, pos.at(1) + 0.3), _label(name, fill: fill_label))
  }
}

// Sử dụng cung tròn Bezier native của CeTZ cho nét siêu mượt
#let _arc_poly(o, radius, start, stop, stroke: 1.5pt + black) = {
  import cetz.draw: arc
  let start_pt = _pt(o, radius, start)
  arc(start_pt, start: start, stop: stop, radius: radius, stroke: stroke)
}

// wrap có thể là số hoặc "auto".
// Nếu có faces và n, tự suy ra wrap = faces / n.
// Còn lại mặc định 1.0 để tránh dùng chuỗi "auto" trong phép tính/range.
#let _wrap(wrap: "auto", faces: none, n: none) = {
  if wrap != "auto" {
    float(wrap)
  } else if faces != none and n != none {
    float(faces) / float(n)
  } else {
    1.0
  }
}

#let _faces(n: 4, wrap: "auto", faces: none) = {
  if faces != none {
    int(faces)
  } else {
    int(n * _wrap(wrap: wrap, faces: faces, n: n))
  }
}

#let _show(solid_body, net_body, display: "net", gap: 1.2cm) = {
  if display == "solid" {
    solid_body
  } else if display == "both" {
    grid(
      columns: (auto, auto),
      gutter: gap,
      align: horizon,
      solid_body, net_body,
    )
  } else {
    net_body
  }
}

#let _draw_ellipse_arc(o, rx, ry, start, stop, stroke: 1.5pt + black, fill: none) = {
  import cetz.draw: arc
  let start_pt = (o.at(0) + rx * calc.cos(start), o.at(1) + ry * calc.sin(start))
  let is_full = calc.abs((stop - start).deg()) >= 359.9
  if fill != none and is_full {
    arc(start_pt, start: start, stop: stop, radius: (rx, ry), stroke: stroke, fill: fill, close: true)
  } else {
    arc(start_pt, start: start, stop: stop, radius: (rx, ry), stroke: stroke)
  }
}

#let _solid_cone(
  r: 1.5,
  h: 4,
  loops: 1,
  to_ratio: 1.0,
  r_l_ratio: none,
  scale: 0.45cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
  path_style: "shortest",
  persp: 0.2666,
) = cetz.canvas(length: scale, {
  import cetz.draw: circle, content, line
  let cx = 0
  let cy = 0
  let ry = r * persp
  let apex = (cx, cy + h)

  // 1. Draw bottom base (dashed back, solid front)
  if fill != none {
    _draw_ellipse_arc((cx, cy), r, ry, 0deg, 360deg, fill: fill, stroke: none)
  }
  _draw_ellipse_arc((cx, cy), r, ry, 0deg, 180deg, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  _draw_ellipse_arc((cx, cy), r, ry, 180deg, 360deg, stroke: 1.5pt + stroke)

  // 2. Draw side lines
  line((cx - r, cy), apex, stroke: 1.5pt + stroke)
  line((cx + r, cy), apex, stroke: 1.5pt + stroke)

  // 3. Draw spiral path (if path is true)
  if path and loops > 0 {
    // Generate points
    let steps = int(loops * 300) + 100
    let pts = ()
    let offset-angle = 180deg

    let r_l_ratio = if r_l_ratio != none { r_l_ratio } else { r / calc.sqrt(r * r + h * h) }
    let L = 1.0
    let theta_total = loops * 2 * calc.pi * r_l_ratio
    let Ax = L
    let Ay = 0.0
    let Bx = L * to_ratio * calc.cos(theta_total)
    let By = L * to_ratio * calc.sin(theta_total)

    let prev_theta = 0deg
    for i in range(0, steps + 1) {
      let t = i / steps
      let px_2d = (1 - t) * Ax + t * Bx
      let py_2d = (1 - t) * Ay + t * By
      let d = 0.0
      let theta_unwrapped = 0deg
      if path_style == "helix" or loops > 1.01 {
        d = (1 - t) * 1.0 + t * to_ratio
        theta_unwrapped = t * loops * 360deg * r_l_ratio
      } else {
        d = calc.sqrt(px_2d * px_2d + py_2d * py_2d)
        let theta = calc.atan2(px_2d, py_2d)
        if i > 0 {
          while theta - prev_theta > 180deg { theta -= 360deg }
          while prev_theta - theta > 180deg { theta += 360deg }
        }
        prev_theta = theta
        theta_unwrapped = theta
      }

      let angle = offset-angle + theta_unwrapped / r_l_ratio
      let curr-r = r * d
      let px = cx + curr-r * calc.cos(angle)
      let py = cy + h * (1 - d) + curr-r * persp * calc.sin(angle)
      pts.push((pt: (px, py), angle: angle))
    }

    // Split and draw
    let cur = ()
    let cur-front = none
    for i in range(0, steps + 1) {
      let item = pts.at(i)
      let angle = item.angle
      let pt = item.pt
      let is-front = calc.sin(angle) <= 0

      if cur-front == none {
        cur = (pt,)
        cur-front = is-front
      } else if is-front == cur-front {
        cur += (pt,)
      } else {
        cur += (pt,)
        if cur.len() >= 2 {
          if cur-front {
            line(..cur, stroke: 1.5pt + path_color)
          } else {
            line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
          }
        }
        cur = (pt,)
        cur-front = is-front
      }
    }
    if cur.len() >= 2 {
      if cur-front {
        line(..cur, stroke: 1.5pt + path_color)
      } else {
        line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
      }
    }
  }

  // 4. Labels & markers
  if labels {
    circle((cx - r, cy), radius: 0.08, fill: rgb("1976D2"))
    content((cx - r - 0.4, cy), [$A$])
    circle(apex, radius: 0.08, fill: rgb("777777"))
    content((cx, cy + h + 0.35), [$S$])

    if to_ratio < 0.99 or loops - calc.round(loops) > 0.01 {
      let end-angle = 180deg + loops * 360deg
      let bx = cx + r * to_ratio * calc.cos(end-angle)
      let by = cy + h * (1 - to_ratio) + r * to_ratio * persp * calc.sin(end-angle)
      circle((bx, by), radius: 0.08, fill: rgb("388E3C"))
      content((bx + if calc.cos(end-angle) > 0 { 0.35 } else { -0.35 }, by), [$B$])
    }
  }
})

#let _solid_frustum(
  r1: 3,
  r2: 1.5,
  h: 4,
  loops: 1,
  r1_l_ratio: none,
  scale: 0.45cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
  path_style: "helix",
  persp: 0.2666,
) = cetz.canvas(length: scale, {
  import cetz.draw: circle, content, line
  let cx = 0
  let cy = 0
  let ry-bot = r1 * persp
  let ry-top = r2 * persp
  let top-center = (cx, cy + h)

  // 1. Draw bottom base (dashed back, solid front)
  if fill != none {
    _draw_ellipse_arc((cx, cy), r1, ry-bot, 0deg, 360deg, fill: fill, stroke: none)
  }
  _draw_ellipse_arc((cx, cy), r1, ry-bot, 0deg, 180deg, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  _draw_ellipse_arc((cx, cy), r1, ry-bot, 180deg, 360deg, stroke: 1.5pt + stroke)

  // 2. Draw top base (always fully solid)
  if fill != none {
    _draw_ellipse_arc((cx, cy + h), r2, ry-top, 0deg, 360deg, fill: fill, stroke: none)
  }
  _draw_ellipse_arc((cx, cy + h), r2, ry-top, 0deg, 360deg, stroke: 1.5pt + stroke)

  // 3. Draw sides
  let left-bot = (cx - r1, cy)
  let right-bot = (cx + r1, cy)
  let left-top = (cx - r2, cy + h)
  let right-top = (cx + r2, cy + h)
  line(left-bot, left-top, stroke: 1.5pt + stroke)
  line(right-bot, right-top, stroke: 1.5pt + stroke)

  // 4. Virtual apex extension (dashed)
  if r1 != r2 {
    let apex-h = h * r1 / (r1 - r2)
    let apex = (cx, cy + apex-h)
    line(left-top, apex, stroke: (dash: "dashed", paint: rgb("999"), thickness: 1.5pt))
    line(right-top, apex, stroke: (dash: "dashed", paint: rgb("999"), thickness: 1.5pt))
    if labels {
      circle(apex, radius: 0.08, fill: rgb("777777"))
      content((cx, cy + apex-h + 0.35), [$S$])
    }
  }

  // 5. Draw spiral path
  if path and loops > 0 {
    let steps = int(loops * 300) + 100
    let pts = ()
    let offset-angle = 180deg

    let r1_l_ratio = if r1_l_ratio != none { r1_l_ratio } else { (r1 - r2) / calc.sqrt((r1 - r2) * (r1 - r2) + h * h) }
    let apex-h = h * r1 / (r1 - r2)
    let L_big = 1.0
    let L_small = L_big * r2 / r1
    let theta_cone = 2 * calc.pi * r1_l_ratio
    let theta_total = loops * theta_cone

    let Ax = L_big
    let Ay = 0.0
    let Bx = L_small * calc.cos(theta_total)
    let By = L_small * calc.sin(theta_total)

    let prev_theta = 0deg
    for i in range(0, steps + 1) {
      let t = i / steps
      let px_2d = (1 - t) * Ax + t * Bx
      let py_2d = (1 - t) * Ay + t * By
      let d = 0.0
      let theta_unwrapped = 0deg
      if path_style == "helix" or loops > 1.01 {
        d = (1 - t) * L_big + t * L_small
        theta_unwrapped = t * loops * 360deg * r1_l_ratio
      } else {
        d = calc.sqrt(px_2d * px_2d + py_2d * py_2d)
        let theta = calc.atan2(px_2d, py_2d)
        if i > 0 {
          while theta - prev_theta > 180deg { theta -= 360deg }
          while prev_theta - theta > 180deg { theta += 360deg }
        }
        prev_theta = theta
        theta_unwrapped = theta
        d = calc.max(d, L_small)
      }

      let angle = offset-angle + theta_unwrapped / r1_l_ratio
      let curr-r = r1 * d
      let px = cx + curr-r * calc.cos(angle)
      let py = cy + apex-h * (1 - d) + curr-r * persp * calc.sin(angle)
      pts.push((pt: (px, py), angle: angle))
    }

    // Split and draw
    let cur = ()
    let cur-front = none
    for i in range(0, steps + 1) {
      let item = pts.at(i)
      let angle = item.angle
      let pt = item.pt
      let is-front = calc.sin(angle) <= 0

      if cur-front == none {
        cur = (pt,)
        cur-front = is-front
      } else if is-front == cur-front {
        cur += (pt,)
      } else {
        cur += (pt,)
        if cur.len() >= 2 {
          if cur-front {
            line(..cur, stroke: 1.5pt + path_color)
          } else {
            line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
          }
        }
        cur = (pt,)
        cur-front = is-front
      }
    }
    if cur.len() >= 2 {
      if cur-front {
        line(..cur, stroke: 1.5pt + path_color)
      } else {
        line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
      }
    }
  }

  // 6. Labels & markers
  if labels {
    circle((cx - r1, cy), radius: 0.08, fill: rgb("1976D2"))
    content((cx - r1 - 0.4, cy), [$A$])

    let end-angle = calc.pi + loops * 2 * calc.pi
    let bx = cx + r2 * calc.cos(end-angle)
    let by = cy + h + r2 * persp * calc.sin(end-angle)
    circle((bx, by), radius: 0.08, fill: rgb("388E3C"))
    content((bx + if calc.cos(end-angle) > 0 { 0.35 } else { -0.35 }, by), [$B$])
  }
})

#let _solid_cylinder(
  r: 1.5,
  h: 4,
  loops: 1,
  scale: 0.45cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
  persp: 0.2666,
) = cetz.canvas(length: scale, {
  import cetz.draw: circle, content, line
  let cx = 0
  let cy = 0
  let ry = r * persp

  // 1. Draw bottom base (dashed back, solid front)
  if fill != none {
    _draw_ellipse_arc((cx, cy), r, ry, 0deg, 360deg, fill: fill, stroke: none)
  }
  _draw_ellipse_arc((cx, cy), r, ry, 0deg, 180deg, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  _draw_ellipse_arc((cx, cy), r, ry, 180deg, 360deg, stroke: 1.5pt + stroke)

  // 2. Draw top base (always fully solid)
  if fill != none {
    _draw_ellipse_arc((cx, cy + h), r, ry, 0deg, 360deg, fill: fill, stroke: none)
  }
  _draw_ellipse_arc((cx, cy + h), r, ry, 0deg, 360deg, stroke: 1.5pt + stroke)

  // 3. Draw sides
  line((cx - r, cy), (cx - r, cy + h), stroke: 1.5pt + stroke)
  line((cx + r, cy), (cx + r, cy + h), stroke: 1.5pt + stroke)

  // 4. Draw spiral path
  if path and loops > 0 {
    let steps = int(loops * 300) + 100
    let pts = ()
    let offset-angle = calc.pi
    let total-angle = loops * 2 * calc.pi
    for i in range(0, steps + 1) {
      let t = i / steps
      let angle = offset-angle + t * total-angle
      let px = cx + r * calc.cos(angle)
      let py = cy + t * h + r * persp * calc.sin(angle)
      pts.push((px, py))
    }

    // Split and draw
    let cur = ()
    let cur-front = none
    for i in range(0, steps + 1) {
      let t = i / steps
      let angle = offset-angle + t * total-angle
      let is-front = calc.sin(angle) <= 0
      let pt = pts.at(i)

      if cur-front == none {
        cur = (pt,)
        cur-front = is-front
      } else if is-front == cur-front {
        cur += (pt,)
      } else {
        cur += (pt,)
        if cur.len() >= 2 {
          if cur-front {
            line(..cur, stroke: 1.5pt + path_color)
          } else {
            line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
          }
        }
        cur = (pt,)
        cur-front = is-front
      }
    }
    if cur.len() >= 2 {
      if cur-front {
        line(..cur, stroke: 1.5pt + path_color)
      } else {
        line(..cur, stroke: (dash: "dashed", paint: path_color, thickness: 1.5pt))
      }
    }
  }

  // 5. Labels & markers
  if labels {
    circle((cx - r, cy), radius: 0.08, fill: rgb("1976D2"))
    content((cx - r - 0.4, cy), [$A$])

    let end-angle = calc.pi + loops * 2 * calc.pi
    let bx = cx + r * calc.cos(end-angle)
    let by = cy + h + r * persp * calc.sin(end-angle)
    circle((bx, by), radius: 0.08, fill: rgb("388E3C"))
    content((bx + if calc.cos(end-angle) > 0 { 0.35 } else { -0.35 }, by), [$B$])
  }
})

#let _solid_box(a: 3, b: 4, c: 5, scale: 0.35cm, labels: true, stroke: black, fill: rgb("F4F9F9")) = cetz.canvas(
  length: scale,
  {
    import cetz.draw: circle, content, line, rect
    let dx = b * 0.35
    let dy = b * 0.25
    rect((0, 0), (a, c), fill: fill, stroke: 1pt + stroke)
    line((0, c), (dx, c + dy), stroke: 1pt + stroke)
    line((a, c), (a + dx, c + dy), stroke: 1pt + stroke)
    line((a, 0), (a + dx, dy), stroke: 1pt + stroke)
    line((dx, c + dy), (a + dx, c + dy), stroke: 1pt + stroke)
    line((a + dx, dy), (a + dx, c + dy), stroke: 1pt + stroke)
  },
)

#let _solid_prism(n: 4, a: 1, h: 3, scale: 0.5cm, labels: true, stroke: black, fill: none) = _solid_box(
  a: n * a / 2,
  b: a,
  c: h,
  scale: scale,
  labels: labels,
  stroke: stroke,
  fill: fill,
)

#let _solid_pyramid(
  n: 4,
  a: 1.0,
  e: 2.0,
  loops: 1.0,
  sm1: none,
  sm2: none,
  scale: 0.55cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  let cx = 0
  let cy = 0

  let base_pts = ()
  let edge_front = ()
  let vert_front = ()

  if n == 3 {
    // Tam giác đều: Cạnh ngang phía sau (nét đứt), đỉnh hướng ra trước
    // Cố tình dời đỉnh trước lệch sang trái (a * 0.3 thay vì 0.5) để đường cao không đè lên cạnh bên!
    let dy = a * 0.6
    base_pts = ((0, 0), (a, 0), (a * 0.3, -dy))
    edge_front = (false, true, true)
    vert_front = (true, true, true)
  } else if n == 4 {
    let dx = a * 0.4
    let dy = a * 0.4
    base_pts = ((0, 0), (a, 0), (a + dx, dy), (dx, dy))
    edge_front = (true, true, false, false)
    vert_front = (true, true, true, false)
  } else if n == 5 {
    let r5 = a / (2 * calc.sin(36deg))
    let p5 = 0.50
    base_pts = (
      (r5 * calc.cos(-54deg), r5 * p5 * calc.sin(-54deg)),
      (r5 * calc.cos(18deg),  r5 * p5 * calc.sin(18deg)),
      (r5 * calc.cos(90deg),  r5 * p5 * calc.sin(90deg)),
      (r5 * calc.cos(162deg), r5 * p5 * calc.sin(162deg)),
      (r5 * calc.cos(234deg), r5 * p5 * calc.sin(234deg)),
    )
    edge_front = (true, false, false, true, true)
    vert_front = (true, true, false, true, true)
  } else if n == 6 {
    base_pts = ((0,0), (a*1.2, -a*0.3), (a*2.4, 0), (a*2.6, a*0.6), (a*1.4, a*0.9), (a*0.2, a*0.6))
    edge_front = (false, false, true, true, true, true)
    vert_front = (true, false, true, true, true, true)
  } else {
    let r = a / (2 * calc.sin(180deg / n))
    let persp_gen = 0.50
    for i in range(0, n) {
      let angle = -90deg + i * 360deg / n
      let x = cx + r * calc.cos(angle)
      let y = cy + r * persp_gen * calc.sin(angle)
      base_pts.push((x, y))
      let mid_angle = -90deg + (i + 0.5) * 360deg / n
      edge_front.push(calc.sin(mid_angle) <= 0)
      vert_front.push(calc.sin(angle) <= 0)
    }
  }

  // Tính trọng tâm và dời tọa độ về gốc
  let sum_x = 0
  let sum_y = 0
  for p in base_pts {
    sum_x += p.at(0)
    sum_y += p.at(1)
  }
  let avg_x = sum_x / n
  let avg_y = sum_y / n
  let centered_base = ()
  for p in base_pts {
    centered_base.push((p.at(0) - avg_x, p.at(1) - avg_y))
  }
  base_pts = centered_base

  let r_base = a / (2 * calc.sin(180deg / n))
  let h = if e > r_base { calc.sqrt(e * e - r_base * r_base) } else { a * 1.5 }
  let S = (0, h)

  if fill != none {
    line(..base_pts, close: true, fill: fill, stroke: none)
  }

  for i in range(0, n) {
    let next = calc.rem(i + 1, n)
    let is_front = edge_front.at(i)
    let style = if is_front {
      1.8pt + stroke
    } else {
      (dash: "dashed", paint: rgb("555555"), thickness: 1.5pt)
    }
    line(base_pts.at(i), base_pts.at(next), stroke: style)
  }
  // Vẽ các đường chéo/trung tuyến đáy và đường cao SO cho chóp đều
  if n == 3 {
    // Vẽ trung tuyến từ đỉnh trước (v_1)
    line(base_pts.at(1), ((base_pts.at(0).at(0) + base_pts.at(2).at(0))/2, (base_pts.at(0).at(1) + base_pts.at(2).at(1))/2), stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    // Vẽ trung tuyến từ đỉnh sau (v_2)
    line(base_pts.at(2), ((base_pts.at(0).at(0) + base_pts.at(1).at(0))/2, (base_pts.at(0).at(1) + base_pts.at(1).at(1))/2), stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    // Vẽ đường cao SO
    line((0,0), S, stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    content((0, -0.25), text(size: 9pt, [$O$]))
  } else if n == 4 {
    // Vẽ 2 đường chéo của đáy
    line(base_pts.at(0), base_pts.at(2), stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    line(base_pts.at(1), base_pts.at(3), stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    // Vẽ đường cao SO
    line((0,0), S, stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    content((0, -0.25), text(size: 9pt, [$O$]))
  } else {
    // Vẽ đường cao SO cho n >= 5
    line((0,0), S, stroke: (dash: "dashed", paint: rgb("555555"), thickness: 1.2pt))
    content((0, -0.25), text(size: 9pt, [$O$]))
  }

  // Vẽ cạnh bên (từ S đến các đỉnh đáy)
  for i in range(0, n) {
    let v_is_front = vert_front.at(i)
    let style = if v_is_front {
      1.8pt + stroke
    } else {
      (dash: "dashed", paint: rgb("555555"), thickness: 1.5pt)
    }
    line(S, base_pts.at(i), stroke: style)
  }

  // Vẽ đường đi (path) trên hình 3D
  if path and loops > 0 {
    let mrad1 = if sm1 != none { float(sm1) } else { e / 2 }
    let mrad2 = if sm2 != none { float(sm2) } else { mrad1 }

    let face_ang = calc.acos((2 * e * e - a * a) / (2 * e * e))
    let total_faces = int(loops * n)
    let total_angle = face_ang * total_faces

    let start_ang = -45deg
    let A_2d = (mrad1 * calc.cos(start_ang), mrad1 * calc.sin(start_ang))
    let B_2d = (mrad2 * calc.cos(start_ang + total_angle), mrad2 * calc.sin(start_ang + total_angle))

    let path_pts = ()
    for i in range(0, total_faces + 1) {
      let ang = start_ang + face_ang * i
      let d = {
        let dx = B_2d.at(0) - A_2d.at(0)
        let dy = B_2d.at(1) - A_2d.at(1)
        let rx = calc.cos(ang)
        let ry = calc.sin(ang)
        let denom = rx * dy - ry * dx
        if calc.abs(denom) < 0.0001 { mrad1 } else { (A_2d.at(0) * dy - A_2d.at(1) * dx) / denom }
      }

      d = calc.min(calc.max(d, 0.0), e)

      let v_idx = calc.rem(i, n)
      let base_pt = base_pts.at(v_idx)
      let px = S.at(0) + (d / e) * (base_pt.at(0) - S.at(0))
      let py = S.at(1) + (d / e) * (base_pt.at(1) - S.at(1))
      path_pts.push((px, py))
    }

    for i in range(0, total_faces) {
      let p1 = path_pts.at(i)
      let p2 = path_pts.at(i + 1)
      let v1 = calc.rem(i, n)
      let next_v = calc.rem(i + 1, n)
      let is_front = edge_front.at(v1)
      let style = if is_front {
        2pt + path_color
      } else {
        (dash: "dashed", paint: path_color, thickness: 1.8pt)
      }
      line(p1, p2, stroke: style)
    }
  }

  // Nhãn
  if labels {
    // S label: offset lên trên từ apex
    content((S.at(0), S.at(1) + 0.38), text(size: 10pt, [$S$]))

    let mrad1 = if sm1 != none { float(sm1) } else { e / 2 }
    let mrad2 = if sm2 != none { float(sm2) } else { mrad1 }

    let start_v = base_pts.at(0)
    let start_pt = (
      S.at(0) + (mrad1 / e) * (start_v.at(0) - S.at(0)),
      S.at(1) + (mrad1 / e) * (start_v.at(1) - S.at(1)),
    )
    circle(start_pt, radius: 0.09, fill: rgb("1976D2"))

    // M label: offset theo hướng từ tâm hình ra ngoài qua M
    let m_cx = start_pt.at(0)
    let m_cy = start_pt.at(1) - h / 2
    let m_clen = calc.sqrt(m_cx * m_cx + m_cy * m_cy)
    let m_ox = if m_clen > 0.01 { m_cx / m_clen } else { -1 }
    let m_oy = if m_clen > 0.01 { m_cy / m_clen } else { 0 }
    content(
      (start_pt.at(0) + m_ox * 0.35, start_pt.at(1) + m_oy * 0.35),
      text(size: 9pt, [$M$])
    )

    let last_idx = calc.rem(int(loops * n), n)
    let is_closed_loop = (mrad1 == mrad2 and last_idx == 0)
    if not is_closed_loop {
      let end_v = base_pts.at(last_idx)
      let end_pt = (
        S.at(0) + (mrad2 / e) * (end_v.at(0) - S.at(0)),
        S.at(1) + (mrad2 / e) * (end_v.at(1) - S.at(1)),
      )
      circle(end_pt, radius: 0.09, fill: rgb("E91E63"))

      // N label: offset theo hướng từ tâm hình ra ngoài qua N
      let n_cx = end_pt.at(0)
      let n_cy = end_pt.at(1) - h / 2
      let n_clen = calc.sqrt(n_cx * n_cx + n_cy * n_cy)
      let n_ox = if n_clen > 0.01 { n_cx / n_clen } else { 1 }
      let n_oy = if n_clen > 0.01 { n_cy / n_clen } else { 0 }
      content(
        (end_pt.at(0) + n_ox * 0.35, end_pt.at(1) + n_oy * 0.35),
        text(size: 9pt, [$N$])
      )
    }
  }
})

/// Vẽ khối nón tròn xoay (Cone) và hình trải phẳng (net) của nó.
///
/// - r (float): Bán kính đáy của nón.
/// - d (float): Đường kính đáy của nón (thay thế cho r).
/// - h (float): Chiều cao của khối nón.
/// - l (float): Độ dài đường sinh của khối nón.
/// - to (float): Độ dài đoạn SB trên đường sinh để vẽ đường đi (mặc định bằng l).
/// - vis_r (float): Bán kính dùng để hiển thị 3D (nếu muốn khác tỉ lệ thực).
/// - vis_h (float): Chiều cao dùng để hiển thị 3D.
/// - wrap (float, string): Số vòng xoắn ốc ("auto" hoặc số thực).
/// - faces (int): Số mặt (dùng cho các hình chóp/lăng trụ, ở đây dùng để tính wrap nếu cần).
/// - start_angle (angle): Góc bắt đầu vẽ hình trải phẳng.
/// - scale (length): Tỉ lệ vẽ hình (scale factor cho canvas).
/// - labels (boolean): Hiển thị các nhãn điểm A, B, S.
/// - guide (boolean): Vẽ thêm các đường gióng, cung góc trợ giúp.
/// - path (boolean): Vẽ đường đi ngắn nhất (đường xoắn ốc).
/// - fill (color): Màu tô cho hình.
/// - stroke (stroke): Nét vẽ cơ bản.
/// - path_color (color): Màu của đường đi xoắn ốc.
/// - display (string): Chế độ hiển thị: "net" (chỉ trải phẳng), "solid" (chỉ khối 3D) hoặc "both".
/// - gap (length): Khoảng cách giữa khối 3D và hình trải phẳng.
#let cone(
  r: none,
  d: none,
  h: none,
  l: none,
  to: none,
  vis_r: none,
  vis_h: none,
  wrap: "auto",
  faces: none,
  start_angle: -55deg,
  scale: 0.55cm,
  labels: true,
  guide: true,
  path: true,
  path_style: "shortest",
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "net",
  gap: 1.2cm,
) = {
  let rr = if r != none { float(r) } else if d != none { float(d) / 2 } else if l != none and h != none {
    calc.sqrt(float(l) * float(l) - float(h) * float(h))
  } else { panic("cone: Yêu cầu cung cấp (r hoặc d) hoặc cung cấp cả (l và h).") }
  let hh = if h != none { float(h) } else if l != none { calc.sqrt(float(l) * float(l) - rr * rr) } else {
    panic("cone: Yêu cầu cung cấp h hoặc l.")
  }
  let ll = if l != none { float(l) } else { calc.sqrt(rr * rr + hh * hh) }
  let ww = _wrap(wrap: wrap, faces: faces, n: 1)
  let end_rad = if to != none { to } else { ll }
  let theta = 360deg * rr / ll
  let total = theta * ww
  let draw_r = if vis_r != none { vis_r } else { rr }
  let draw_h = if vis_h != none { vis_h } else { hh }

  let net_body = cetz.canvas(length: scale * 1.3, {
    import cetz.draw: circle, content, line, rect
    let O = (0, 0)
    let A = _pt(O, ll, start_angle)
    let B = _pt(O, end_rad, start_angle + total)
    line(O, A, stroke: 0.9pt + stroke)

    // Draw loop dividing lines for multiple wraps
    let full_loops = calc.floor(ww)
    for i in range(1, full_loops + 1) {
      if i * theta < total - 0.01deg {
        line(O, _pt(O, ll, start_angle + i * theta), stroke: (dash: "dashed", paint: rgb("999"), thickness: 1.5pt))
      }
    }

    line(O, _pt(O, ll, start_angle + total), stroke: 0.9pt + stroke)
    _arc_poly(O, ll, start_angle, start_angle + total, stroke: 1.1pt + _green)
    if guide {
      _arc_poly(O, 1.0, start_angle, start_angle + total, stroke: (dash: "dashed", paint: path_color))
      let angle_label = if ww == 1 { [$alpha$] } else { [$#ww alpha$] }
      content(_pt(O, 1.8, start_angle + total / 2), _label(angle_label))
    }
    if path { line(A, B, stroke: 1.8pt + path_color) }
    _mark(O, name: if labels { [$S$] } else { none })
    _mark(A, name: if labels { [$A$] } else { none }, paint: rgb("1976D2"), fill_label: _light_blue)
    let end_label = if to == none { [$A'$] } else { [$B'$] }
    _mark(B, name: if labels { end_label } else { none }, paint: path_color, fill_label: _light_pink)
    if labels {
      content(_pt(O, ll * 0.55, start_angle), _label([$l$]))
      content(_pt(O, end_rad * 0.55, start_angle + total + 6deg), _label([$S B = #end_rad$]))
    }
  })

  _show(
    _solid_cone(
      r: draw_r,
      h: draw_h,
      loops: ww,
      to_ratio: end_rad / ll,
      r_l_ratio: draw_r / calc.sqrt(draw_r * draw_r + draw_h * draw_h),
      scale: scale * 1.5,
      labels: labels,
      stroke: stroke,
      fill: fill,
      path_color: path_color,
      path: path,
      path_style: path_style,
    ),
    net_body,
    display: display,
    gap: gap,
  )
}

/// Vẽ khối nón cụt (Truncated Cone / Frustum) và hình trải phẳng của nó.
///
/// - r1 (float): Bán kính đáy lớn.
/// - r2 (float): Bán kính đáy nhỏ.
/// - h (float): Chiều cao của nón cụt.
/// - l (float): Độ dài đường sinh của nón cụt.
/// - vis_r1 (float): Bán kính đáy lớn dùng để hiển thị 3D.
/// - vis_r2 (float): Bán kính đáy nhỏ dùng để hiển thị 3D.
/// - vis_h (float): Chiều cao hiển thị 3D.
/// Các tham số còn lại tương tự như hàm `cone`.
#let frustum(
  r1: none,
  r2: none,
  h: none,
  l: none,
  vis_r1: none,
  vis_r2: none,
  vis_h: none,
  wrap: "auto",
  faces: none,
  start_angle: -45deg,
  scale: 0.65cm,
  labels: true,
  guide: true,
  path: true,
  path_style: "helix",
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "net",
  gap: 1.2cm,
) = {
  if r1 == none or r2 == none { panic("frustum: Bắt buộc cung cấp r1 và r2.") }
  if h == none and l == none { panic("frustum: Bắt buộc cung cấp h hoặc l.") }
  let (r1_f, r2_f) = (float(r1), float(r2))
  let hh = if h != none { float(h) } else { calc.sqrt(float(l) * float(l) - (r1_f - r2_f) * (r1_f - r2_f)) }
  let ll = if l != none { float(l) } else { calc.sqrt((r1_f - r2_f) * (r1_f - r2_f) + hh * hh) }
  // Gán lại cho các tính toán sau
  let r1 = r1_f
  let r2 = r2_f
  let ww = _wrap(wrap: wrap, faces: faces, n: 1)
  let big = ll * r1 / (r1 - r2)
  let small = ll * r2 / (r1 - r2)
  let theta = 360deg * r1 / big
  let total = theta * ww
  let draw_r1 = if vis_r1 != none { vis_r1 } else { r1 }
  let draw_r2 = if vis_r2 != none { vis_r2 } else { r2 }
  let draw_h = if vis_h != none { vis_h } else { hh }

  let net_body = cetz.canvas(length: scale * 1.3, {
    import cetz.draw: circle, content, line, rect
    let O = (0, 0)
    let A = _pt(O, big, start_angle)
    let C = _pt(O, small, start_angle + total)
    line(_pt(O, small, start_angle), _pt(O, big, start_angle), stroke: 0.9pt + stroke)

    // Draw loop dividing lines for frustum
    let full_loops = calc.floor(ww)
    for i in range(1, full_loops + 1) {
      if i * theta < total - 0.01deg {
        let angle = start_angle + i * theta
        line(_pt(O, small, angle), _pt(O, big, angle), stroke: (dash: "dashed", paint: rgb("999"), thickness: 1.5pt))
      }
    }

    line(_pt(O, small, start_angle + total), _pt(O, big, start_angle + total), stroke: 0.9pt + stroke)
    _arc_poly(O, big, start_angle, start_angle + total, stroke: 1.1pt + _green)
    _arc_poly(O, small, start_angle, start_angle + total, stroke: 1.1pt + _green)
    if path { line(A, C, stroke: 1.8pt + path_color) }
    if guide { _arc_poly(O, 0.9, start_angle, start_angle + total, stroke: (dash: "dashed", paint: path_color)) }
    _mark(A, name: if labels { [$A$] } else { none }, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark(C, name: if labels { [$B'$] } else { none }, paint: path_color, fill_label: _light_pink)
    if labels {
      content(_pt(O, (big + small) / 2, start_angle), _label([$l$]))
      let angle_label = if ww == 1 { [$alpha$] } else { [$#ww alpha$] }
      content(_pt(O, big + 0.55, start_angle + total / 2), _label(angle_label))
    }
  })

  _show(
    _solid_frustum(
      r1: draw_r1,
      r2: draw_r2,
      h: draw_h,
      loops: ww,
      r1_l_ratio: (draw_r1 - draw_r2) / calc.sqrt((draw_r1 - draw_r2) * (draw_r1 - draw_r2) + draw_h * draw_h),
      scale: scale * 1.5,
      labels: labels,
      stroke: stroke,
      fill: fill,
      path_color: path_color,
      path: path,
      path_style: path_style,
    ),
    net_body,
    display: display,
    gap: gap,
  )
}

/// Vẽ khối trụ đứng (Cylinder) và hình trải phẳng của nó.
///
/// - r (float): Bán kính đáy.
/// - d (float): Đường kính đáy.
/// - h (float): Chiều cao khối trụ (mặc định 1).
/// - vis_r (float): Bán kính đáy hiển thị 3D.
/// - vis_h (float): Chiều cao hiển thị 3D.
/// - wrap (float, string): Số vòng xoắn ốc ("auto" hoặc số).
/// - advance (float): Tổng độ dài đường ngang trải phẳng.
/// Các tham số còn lại tương tự như hàm `cone`.
#let cylinder(
  r: none,
  d: none,
  h: 1,
  vis_r: none,
  vis_h: none,
  wrap: "auto",
  advance: none,
  scale: 0.75cm,
  labels: true,
  guide: true,
  path: true,
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "net",
  gap: 1.2cm,
) = {
  let rr = if r != none { float(r) } else if d != none { float(d) / 2 } else {
    panic("cylinder: Yêu cầu cung cấp bán kính r hoặc đường kính d.")
  }
  let hh = float(h)
  let ww = if advance != none { float(advance) / (2 * calc.pi * rr) } else { _wrap(wrap: wrap) }
  let w = 2 * calc.pi * rr * ww
  let draw_r = if vis_r != none { vis_r } else { rr }
  let draw_h = if vis_h != none { vis_h } else { hh }
  let h = hh

  let net_body = cetz.canvas(length: scale * 1.3, {
    import cetz.draw: circle, content, line, rect

    let C = 2 * calc.pi * rr
    let full_loops = calc.floor(ww)
    for i in range(0, full_loops) {
      let x1 = i * C
      let x2 = (i + 1) * C
      rect((x1, 0), (x2, h), fill: none, stroke: 1pt + stroke)
      if labels {
        content((x1 + C / 2, -0.45), _label([Vòng #(i + 1)], fill: white))
      }
    }
    if ww > full_loops {
      let x1 = full_loops * C
      let x2 = ww * C
      rect((x1, 0), (x2, h), fill: fill, stroke: 1pt + stroke)
      if labels {
        let frac = ww - full_loops
        content((x1 + frac * C / 2, -0.45), _label([#frac Vòng], fill: white))
      }
    }

    if path { line((0, 0), (w, h), stroke: 1.8pt + path_color) }
    _mark((0, 0), name: if labels { [$A$] } else { none }, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, h), name: if labels { [$B'$] } else { none }, paint: path_color, fill_label: _light_pink)
    if labels {
      _mark((0, h), name: [$B$], paint: rgb("777777"), fill_label: _light_pink)
      _mark((w, 0), name: [$A'$], paint: rgb("777777"), fill_label: _light_blue)
      content((-0.45, h / 2), _label([$h$]))
    }
  })

  _show(
    _solid_cylinder(
      r: draw_r,
      h: draw_h,
      loops: ww,
      scale: scale * 1.5,
      labels: labels,
      stroke: stroke,
      fill: fill,
      path_color: path_color,
      path: path,
    ),
    net_body,
    display: display,
    gap: gap,
  )
}

/// Vẽ khối lăng trụ đứng (Prism) và hình trải phẳng.
///
/// - n (int): Số cạnh của đa giác đáy.
/// - a (float): Độ dài cạnh đáy.
/// - h (float): Chiều cao khối lăng trụ.
/// - wrap (float, string): Số lần lăng trụ được bọc.
/// - faces (int): Số mặt cụ thể muốn trải phẳng (thay vì quấn quanh toàn bộ).
/// Các tham số còn lại tương tự như hàm `cone`.


/// Vẽ khối chóp đều (Pyramid) và hình trải phẳng.
///
/// - n (int): Số cạnh đáy.
/// - a (float): Độ dài cạnh đáy.
/// - e (float): Độ dài cạnh bên.
/// - sm (float): Khoảng cách từ đỉnh S đến một điểm trên mặt bên, dùng cho đường đi.
/// - wrap (float, string): Số vòng xoắn.
/// - faces (int): Tổng số mặt tam giác hiển thị.
/// Các tham số còn lại tương tự như hàm `cone`.
#let pyramid(
  n: 4,
  a: 1,
  e: 2,
  sm: none,
  sm2: none,
  wrap: "auto",
  faces: none,
  start_angle: -45deg,
  scale: 0.9cm,
  labels: true,
  guide: true,
  path: true,
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "net",
  gap: 1.2cm,
) = {
  let (n, a, e) = (int(n), float(a), float(e))
  let mrad1 = if sm != none { float(sm) } else { e / 2 }
  let mrad2 = if sm2 != none { float(sm2) } else { mrad1 }
  let face_angle = calc.acos((2 * e * e - a * a) / (2 * e * e))
  let total_faces = _faces(n: n, wrap: wrap, faces: faces)
  let total_angle = face_angle * total_faces

  let net_body = cetz.canvas(length: scale * 1.3, {
    import cetz.draw: circle, content, line, rect
    let S = (0, 0)
    let first = _pt(S, e, start_angle)
    let last = _pt(S, e, start_angle + total_angle)
    for i in range(0, total_faces + 1) {
      let ang = start_angle + face_angle * i
      line(S, _pt(S, e, ang), stroke: 0.9pt + stroke)
    }
    for i in range(0, total_faces) {
      let P = _pt(S, e, start_angle + face_angle * i)
      let Q = _pt(S, e, start_angle + face_angle * (i + 1))
      line(P, Q, stroke: 1.2pt + _green)
    }
    let M1 = _pt(S, mrad1, start_angle)
    let M2 = _pt(S, mrad2, start_angle + total_angle)
    if path { line(M1, M2, stroke: 1.8pt + path_color) }
    if guide {
      _arc_poly(S, 0.5, start_angle, start_angle + total_angle, stroke: (dash: "dashed", paint: _gray))
      let arc_label_r = e + 0.7
      // Hiển thị nhãn góc đẹp: chỉ dùng ký hiệu, không dùng giá trị số
      let angle_label = if total_faces == 1 { [$alpha$] } else { [#total_faces$alpha$] }
      content(_pt(S, arc_label_r, start_angle + total_angle / 2), _label(angle_label))
    }
    // Label S dời ra xa, vuông góc với cung hướng ra ngoài
    if labels {
      // S đặt ở hướng ngược với giữa cung (phía trong)
      let s_offset_angle = start_angle + total_angle / 2 + 180deg
      let s_label_pt = _pt(S, 0.4, s_offset_angle)
      content(s_label_pt, [$S$])
    }
    _mark(M1, name: if labels { [$M$] } else { none }, paint: path_color, fill_label: _light_pink)
    _mark(M2, name: if labels { if mrad1 == mrad2 and total_faces == n { [$M'$] } else { [$N$] } } else { none }, paint: path_color, fill_label: _light_pink)
    if labels {
      // Offset labels A and A' outward along casing edges
      let a_dir_angle = start_angle - 5deg
      let a_label_pt = _pt(S, e + 0.4, a_dir_angle)
      content(a_label_pt, _label([$A$], fill: none))
      let a2_dir_angle = start_angle + total_angle + 5deg
      let a2_label_pt = _pt(S, e + 0.4, a2_dir_angle)
      content(a2_label_pt, _label([$A'$], fill: _light_blue))
    }
  })

  _show(
    _solid_pyramid(n: n, a: a, e: e, loops: float(total_faces) / n, sm1: mrad1, sm2: mrad2, scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    net_body,
    display: display,
    gap: gap,
  )
}

/// Vẽ khối hộp chữ nhật (Box) cơ bản và đường chéo bề mặt trải phẳng.
///
/// - a (float): Chiều rộng.
/// - b (float): Chiều dài.
/// - c (float): Chiều cao.
/// - mode (string): Cách gộp mặt (hiển thị 1 dạng cơ bản).
/// Các tham số còn lại tương tự như hàm `cone`.
#let box3(
  a: 3,
  b: 4,
  c: 5,
  mode: "ab-c",
  scale: 0.75cm,
  labels: true,
  guide: true,
  path: true,
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "net",
  gap: 1.2cm,
) = {
  let (a, b, c) = (float(a), float(b), float(c))
  let w = a + b
  let net_body = cetz.canvas(length: scale * 1.3, {
    import cetz.draw: circle, content, line, rect
    rect((0, 0), (w, c), fill: fill, stroke: 1pt + stroke)
    if guide { line((a, 0), (a, c), stroke: (dash: "dashed", paint: _gray)) }
    if path { line((0, 0), (w, c), stroke: 1.8pt + path_color) }
    _mark((0, 0), name: if labels { [$A$] } else { none }, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, c), name: if labels { [$B$] } else { none }, paint: path_color, fill_label: _light_pink)
    if labels {
      content((a / 2, -0.45), _label([$a$]))
      content((a + b / 2, -0.45), _label([$b$]))
      content((-0.45, c / 2), _label([$c$]))
    }
  })
  _show(_solid_box(a: a, b: b, c: c, scale: scale * 1.5, labels: labels), net_body, display: display, gap: gap)
}

/// Hàm đa năng để tạo khối hoặc hình trải phẳng dựa theo loại (kind).
///
/// - kind (string): Loại hình, có thể là "cone", "frustum", "cylinder", "prism", "pyramid", "box".
/// - Các tham số còn lại tự động map tương ứng.
#let net(
  kind,
  r: none,
  d: none,
  r1: none,
  r2: none,
  h: none,
  l: none,
  n: 4,
  a: 1,
  b: 1,
  c: 1,
  e: 2,
  sm: none,
  to: none,
  wrap: "auto",
  faces: none,
  advance: none,
  z_start: 0.0,
  z_end: 1.0,
  path_type: "auto",
  labels: true,
  guide: true,
  path: true,
  display: "net",
  gap: 1.2cm,
) = {
  if kind == "cone" {
    cone(
      r: r,
      d: d,
      h: h,
      l: l,
      to: to,
      wrap: wrap,
      faces: faces,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else if kind == "frustum" {
    frustum(
      r1: r1,
      r2: r2,
      h: h,
      l: l,
      wrap: wrap,
      faces: faces,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else if kind == "cylinder" {
    cylinder(
      r: r,
      d: d,
      h: h,
      wrap: wrap,
      advance: advance,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else if kind == "prism" {
    prism(
      faces: if faces != none { faces } else { n },
      a: a,
      h: h,
      wrap: wrap,
      z_start: z_start,
      z_end: z_end,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else if kind == "pyramid" {
    pyramid(
      n: n,
      a: a,
      e: e,
      sm: sm,
      wrap: wrap,
      faces: faces,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else if kind == "box" {
    box3(a: a, b: b, c: c, labels: labels, guide: guide, path: path, display: display, gap: gap)
  } else if kind == "cube" {
    let w = if wrap != "auto" { float(wrap) } else { 3.0 }
    cube(
      a: a,
      wrap: w,
      z_start: z_start,
      z_end: z_end,
      path_type: path_type,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else {
    panic("unfold.net: kind khong hop le. Dung: cone, frustum, cylinder, prism, pyramid, box, cube")
  }
}



/// Hình khối 3D lăng trụ đều
#let _solid_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  let cx = 0
  let cy = 0
  let persp = 0.35
  
  let base_pts = ()
  let edge_front = ()
  let vert_front = ()
  
  if faces == 3 {
    let dy = a * 0.6
    base_pts = ((0, 0), (a, 0), (a * 0.5, -dy))
    edge_front = (false, true, true)
    vert_front = (true, true, true)
  } else if faces == 4 {
    let dx = a * 0.4
    let dy = a * 0.4
    base_pts = ((0, 0), (a, 0), (a + dx, dy), (dx, dy))
    edge_front = (true, true, false, false)
    vert_front = (true, true, true, false)
  } else if faces == 6 {
    base_pts = ((0,0), (a*1.2, -a*0.3), (a*2.4, 0), (a*2.6, a*0.6), (a*1.4, a*0.9), (a*0.2, a*0.6))
    edge_front = (true, true, true, false, false, false)
    vert_front = (true, true, true, true, false, false)
  } else {
    // Fallback
    let r = a / (2 * calc.sin(180deg / faces))
    for i in range(0, faces) {
      let angle = -90deg + i * 360deg / faces
      let x = cx + r * calc.cos(angle)
      let y = cy + r * persp * calc.sin(angle)
      base_pts.push((x, y))
      let mid_angle = -90deg + (i + 0.5) * 360deg / faces
      edge_front.push(calc.sin(mid_angle) <= 0)
      vert_front.push(calc.sin(angle) <= 0)
    }
  }

  let sum_x = 0
  let sum_y = 0
  for p in base_pts {
    sum_x += p.at(0)
    sum_y += p.at(1)
  }
  let avg_x = sum_x / faces
  let avg_y = sum_y / faces
  let centered_base = ()
  for p in base_pts {
    centered_base.push((p.at(0) - avg_x, p.at(1) - avg_y))
  }
  base_pts = centered_base
  
  let top_pts = ()
  for p in base_pts {
    top_pts.push((p.at(0), p.at(1) + h))
  }
  
  if fill != none {
    line(..base_pts, close: true, fill: fill, stroke: none)
    line(..top_pts, close: true, fill: fill, stroke: none)
  }
  
  for i in range(0, faces) {
    let next = calc.rem(i + 1, faces)
    let is_front = edge_front.at(i)
    let style = if is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    
    line(base_pts.at(i), base_pts.at(next), stroke: style)
    line(top_pts.at(i), top_pts.at(next), stroke: 1.5pt + stroke)
    
    let v_is_front = vert_front.at(i)
    let v_style = if v_is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    line(base_pts.at(i), top_pts.at(i), stroke: v_style)
  }
  
  if path and loops > 0 {
    let total_faces = int(loops * faces)
    for i in range(0, total_faces) {
      let t1 = i / total_faces
      let t2 = (i + 1) / total_faces
      let z1 = (z_start * (1 - t1) + z_end * t1) * h
      let z2 = (z_start * (1 - t2) + z_end * t2) * h
      let v1 = calc.rem(i, faces)
      let v2 = calc.rem(i + 1, faces)
      let p1 = (base_pts.at(v1).at(0), base_pts.at(v1).at(1) + z1)
      let p2 = (base_pts.at(v2).at(0), base_pts.at(v2).at(1) + z2)
      
      let is_front = edge_front.at(v1)
      let style = if is_front { 1.5pt + path_color } else { (dash: "dashed", paint: path_color, thickness: 1.5pt) }
      line(p1, p2, stroke: style)
    }
  }
  
  if labels {
    let start_name = if z_start == 0.0 { [$A$] } else { [$M$] }
    let end_name = if z_end == 1.0 { [$A'$] } else if z_start == z_end and loops == 1.0 { [$M$] } else { [$N$] }
    
    let start_pt = (base_pts.at(0).at(0), base_pts.at(0).at(1) + z_start * h)
    circle(start_pt, radius: 0.08, fill: rgb("1976D2"))
    content((start_pt.at(0) - 0.25, start_pt.at(1)), start_name)
    
    let last = calc.rem(int(loops * faces), faces)
    let end_pt = (base_pts.at(last).at(0), base_pts.at(last).at(1) + z_end * h)
    let is_closed_loop = (z_start == z_end and calc.rem(int(loops * faces), faces) == 0)
    if not is_closed_loop {
      circle(end_pt, radius: 0.08, fill: rgb("E91E63"))
      content((end_pt.at(0) + 0.25, end_pt.at(1)), end_name)
    }
  }
})

#let _net_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  let w = a * faces * loops
  let total_faces = int(faces * loops)
  
  // Vẽ các hình chữ nhật từng mặt
  for i in range(0, total_faces) {
    let x1 = i * a
    let x2 = (i + 1) * a
    rect((x1, 0), (x2, h), stroke: 1.5pt + rgb("1A5276"))
    // Vạch chia mặt nét đứt (chỉ giữa các mặt trong 1 vòng, không phải biên vòng)
    if i > 0 and calc.rem(i, faces) != 0 {
      line((x1, 0), (x1, h), stroke: (dash: "dashed", paint: rgb("9DB2BF"), thickness: 1pt))
    }
  }
  
  let y_start = z_start * h
  let y_end = z_end * h
  
  // Vẽ đường đi
  if path {
    line((0, y_start), (w, y_end), stroke: 1.8pt + path_color)
  }
  
  if labels {
    let start_name = if z_start == 0.0 { [$A$] } else { [$M$] }
    let end_name = if z_end == 1.0 { [$A'$] } else if z_start == z_end and loops == 1.0 { [$M'$] } else { [$N$] }
    
    _mark((0, y_start), name: start_name, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, y_end), name: end_name, paint: path_color, fill_label: _light_pink)
    let chuvi = a * faces
    if loops > 1 {
      content((w / 2, -0.6), _label([Chu vi trải = $#loops times #chuvi$]))
    } else {
      content((w / 2, -0.6), _label([Chu vi trải = $#chuvi$]))
    }
    content((-0.6, h / 2), _label([$h$]))
    
    // Nhãn đỉnh trên và dưới cho từng cạnh đứng của mặt 0 và cuối
    // Chỉ dành cho lăng trụ có hình dạng chữ nhật (4 cạnh, 1 vòng = cube)
    if faces == 4 and loops == 1 {
      // Đỉnh dưới: O, D, C, B, O
      let bottom_labels = ([$O$], [$D$], [$C$], [$B$], [$O$])
      let top_labels = ([$O'$], [$D'$], [$C'$], [$B'$], [$O'$])
      for i in range(0, 5) {
        let x = i * a
        content((x, -0.3), bottom_labels.at(i))
        content((x, h + 0.3), top_labels.at(i))
      }
    }
  }
})

/// Hình trải phẳng của lăng trụ đều
#let prism(
  faces: 3,
  a: 2,
  h: 4,
  wrap: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
  display: "both",
  gap: 1.5cm,
) = {
  _show(
    _solid_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), z_start: float(z_start), z_end: float(z_end), scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), z_start: float(z_start), z_end: float(z_end), scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}



/// Hình khối 3D lăng trụ đều
#let _solid_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  let cx = 0
  let cy = 0
  let persp = 0.35
  
  let base_pts = ()
  let edge_front = ()
  let vert_front = ()
  
  if faces == 3 {
    base_pts = ((0, 0), (a*1.2, -a*0.4), (a*2.2, a*0.4))
    edge_front = (true, true, false)
    vert_front = (true, true, true)
  } else if faces == 4 {
    base_pts = ((0,0), (a*1.5, 0), (a*2.2, a*0.6), (a*0.7, a*0.6))
    edge_front = (true, true, false, false)
    vert_front = (true, true, true, false)
  } else if faces == 6 {
    base_pts = ((0,0), (a*1.2, -a*0.3), (a*2.4, 0), (a*2.6, a*0.6), (a*1.4, a*0.9), (a*0.2, a*0.6))
    edge_front = (true, true, true, false, false, false)
    vert_front = (true, true, true, true, false, false)
  } else {
    // Fallback
    let r = a / (2 * calc.sin(180deg / faces))
    for i in range(0, faces) {
      let angle = -90deg + i * 360deg / faces
      let x = cx + r * calc.cos(angle)
      let y = cy + r * persp * calc.sin(angle)
      base_pts.push((x, y))
      let mid_angle = -90deg + (i + 0.5) * 360deg / faces
      edge_front.push(calc.sin(mid_angle) <= 0)
      vert_front.push(calc.sin(angle) <= 0)
    }
  }

  let sum_x = 0
  let sum_y = 0
  for p in base_pts {
    sum_x += p.at(0)
    sum_y += p.at(1)
  }
  let avg_x = sum_x / faces
  let avg_y = sum_y / faces
  let centered_base = ()
  for p in base_pts {
    centered_base.push((p.at(0) - avg_x, p.at(1) - avg_y))
  }
  base_pts = centered_base
  
  let top_pts = ()
  for p in base_pts {
    top_pts.push((p.at(0), p.at(1) + h))
  }
  
  if fill != none {
    line(..base_pts, close: true, fill: fill, stroke: none)
    line(..top_pts, close: true, fill: fill, stroke: none)
  }
  
  for i in range(0, faces) {
    let next = calc.rem(i + 1, faces)
    let is_front = edge_front.at(i)
    let style = if is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    
    line(base_pts.at(i), base_pts.at(next), stroke: style)
    line(top_pts.at(i), top_pts.at(next), stroke: 1.5pt + stroke)
    
    let v_is_front = vert_front.at(i)
    let v_style = if v_is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    line(base_pts.at(i), top_pts.at(i), stroke: v_style)
  }
  
  if path and loops > 0 {
    let total_faces = int(loops * faces)
    for i in range(0, total_faces) {
      let t1 = i / total_faces
      let t2 = (i + 1) / total_faces
      let z1 = (z_start * (1 - t1) + z_end * t1) * h
      let z2 = (z_start * (1 - t2) + z_end * t2) * h
      let v1 = calc.rem(i, faces)
      let v2 = calc.rem(i + 1, faces)
      let p1 = (base_pts.at(v1).at(0), base_pts.at(v1).at(1) + z1)
      let p2 = (base_pts.at(v2).at(0), base_pts.at(v2).at(1) + z2)
      
      let is_front = edge_front.at(v1)
      let style = if is_front { 1.5pt + path_color } else { (dash: "dashed", paint: path_color, thickness: 1.5pt) }
      line(p1, p2, stroke: style)
    }
  }
  
  if labels {
    let start_name = if z_start == 0.0 { [$A$] } else { [$M$] }
    let end_name = if z_end == 1.0 { [$A'$] } else if z_start == z_end and loops == 1.0 { [$M$] } else { [$N$] }
    
    let start_pt = (base_pts.at(0).at(0), base_pts.at(0).at(1) + z_start * h)
    circle(start_pt, radius: 0.08, fill: rgb("1976D2"))
    content((start_pt.at(0) - 0.25, start_pt.at(1)), start_name)
    
    let last = calc.rem(int(loops * faces), faces)
    let end_pt = (base_pts.at(last).at(0), base_pts.at(last).at(1) + z_end * h)
    let is_closed_loop = (z_start == z_end and calc.rem(int(loops * faces), faces) == 0)
    if not is_closed_loop {
      circle(end_pt, radius: 0.08, fill: rgb("E91E63"))
      content((end_pt.at(0) + 0.25, end_pt.at(1)), end_name)
    }
  }
})

#let _net_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  let w = a * faces * loops
  
  // Draw base rectangles
  let total_faces = int(faces * loops)
  for i in range(0, total_faces) {
    let x1 = i * a
    let x2 = (i + 1) * a
    if i > 0 {
      line((x1, 0), (x1, h), stroke: (dash: "dashed", paint: rgb("999")))
    }
    line((x1, 0), (x2, 0), stroke: 1.5pt + rgb("1A5276"))
    line((x1, h), (x2, h), stroke: 1.5pt + rgb("1A5276"))
  }
  line((0, 0), (0, h), stroke: 1.5pt + rgb("1A5276"))
  line((w, 0), (w, h), stroke: 1.5pt + rgb("1A5276"))
  
  let y_start = z_start * h
  let y_end = z_end * h
  
  // Draw path
  if path {
    line((0, y_start), (w, y_end), stroke: 1.8pt + path_color)
  }
  
  if labels {
    let start_name = if z_start == 0.0 { [$A$] } else { [$M$] }
    let end_name = if z_end == 1.0 { [$A'$] } else if z_start == z_end and loops == 1.0 { [$M'$] } else { [$N$] }
    
    _mark((0, y_start), name: start_name, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, y_end), name: end_name, paint: path_color, fill_label: _light_pink)
    let chuvi = a * faces
    if loops > 1 {
      content((w / 2, -0.6), _label([Chu vi trải = $#loops times #chuvi$]))
    } else {
      content((w / 2, -0.6), _label([Chu vi trải = $#chuvi$]))
    }
    content((-0.6, h / 2), _label([$h$]))
  }
})

/// Hình trải phẳng của lăng trụ đều
#let prism(
  faces: 3,
  a: 2,
  h: 4,
  wrap: 1,
  z_start: 0.0,
  z_end: 1.0,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
  display: "both",
  gap: 1.5cm,
) = {
  _show(
    _solid_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), z_start: float(z_start), z_end: float(z_end), scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), z_start: float(z_start), z_end: float(z_end), scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}



/// Hình vẽ 3D của đường đi khép kín trên hình lập phương qua N mặt bên (N = 2, 3, 4, 5, 6)
#let _solid_cube_closed_path(
  a: 2.0,
  wrap: 6,
  z_start: 0.333,
  m_at_bottom: false,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  
  // Thiết lập tọa độ hình lập phương theo chuẩn Cavalier
  let dx = a * 0.4
  let dy = a * 0.4
  let base_pts = ((0,0), (a, 0), (a + dx, dy), (dx, dy))
  let faces = 4
  let h = a
  
  let sum_x = 0
  let sum_y = 0
  for p in base_pts {
    sum_x += p.at(0)
    sum_y += p.at(1)
  }
  let avg_x = sum_x / faces
  let avg_y = sum_y / faces
  let centered_base = ()
  for p in base_pts {
    centered_base.push((p.at(0) - avg_x, p.at(1) - avg_y))
  }
  base_pts = centered_base
  
  let top_pts = ()
  for p in base_pts {
    top_pts.push((p.at(0), p.at(1) + h))
  }
  
  let v0 = base_pts.at(0)
  let v1 = base_pts.at(1)
  let v2 = base_pts.at(2)
  let v3 = base_pts.at(3)
  
  let t0 = top_pts.at(0)
  let t1 = top_pts.at(1)
  let t2 = top_pts.at(2)
  let t3 = top_pts.at(3)
  
  // Vẽ màu tô nền
  if fill != none {
    line(..base_pts, close: true, fill: fill, stroke: none)
    line(..top_pts, close: true, fill: fill, stroke: none)
  }
  
  // Cạnh đáy
  line(v0, v1, stroke: 1.5pt + stroke)
  line(v1, v2, stroke: 1.5pt + stroke)
  line(v2, v3, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  line(v3, v0, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  
  // Cạnh đỉnh
  line(t0, t1, stroke: 1.5pt + stroke)
  line(t1, t2, stroke: 1.5pt + stroke)
  line(t2, t3, stroke: 1.5pt + stroke)
  line(t3, t0, stroke: 1.5pt + stroke)
  
  // Cạnh bên dọc
  line(v0, t0, stroke: 1.5pt + stroke)
  line(v1, t1, stroke: 1.5pt + stroke)
  line(v2, t2, stroke: 1.5pt + stroke)
  line(v3, t3, stroke: (dash: "dashed", paint: rgb("555"), thickness: 1.5pt))
  
  // Vẽ đường đi dựa theo N (wrap)
  if path {
    let pts = ()
    let vis = () // Trạng thái nét đứt/nét liền cho từng phân đoạn
    
    let (c_t0, c_t1, c_t2, c_t3) = (t0, t1, t2, t3)
    let (c_v0, c_v1, c_v2, c_v3) = (v0, v1, v2, v3)
    if m_at_bottom {
      (c_t0, c_t1, c_t2, c_t3) = (v0, v1, v2, v3)
      (c_v0, c_v1, c_v2, c_v3) = (t0, t1, t2, t3)
    }
    
    let P0 = (c_t0.at(0) + z_start * (c_t3.at(0) - c_t0.at(0)), c_t0.at(1) + z_start * (c_t3.at(1) - c_t0.at(1)))
    let P1 = (c_t0.at(0) + z_start * (c_t1.at(0) - c_t0.at(0)), c_t0.at(1) + z_start * (c_t1.at(1) - c_t0.at(1)))
    
    if wrap == 2 {
      pts = (P0, P1, P0)
      vis = (true, true)
    } else if wrap == 3 {
      let P2 = (c_t0.at(0) + (1 - z_start) * (c_v0.at(0) - c_t0.at(0)), c_t0.at(1) + (1 - z_start) * (c_v0.at(1) - c_t0.at(1)))
      pts = (P0, P1, P2, P0)
      vis = (true, true, false)
    } else if wrap == 4 {
      let P2 = (c_v0.at(0) + (1 - z_start) * (c_v1.at(0) - c_v0.at(0)), c_v0.at(1) + (1 - z_start) * (c_v1.at(1) - c_v0.at(1)))
      let P3 = (c_v0.at(0) + (1 - z_start) * (c_v3.at(0) - c_v0.at(0)), c_v0.at(1) + (1 - z_start) * (c_v3.at(1) - c_v0.at(1)))
      pts = (P0, P1, P2, P3, P0)
      vis = (true, true, false, false)
    } else if wrap == 5 {
      let P2 = (c_t1.at(0) + z_start * (c_v1.at(0) - c_t1.at(0)), c_t1.at(1) + z_start * (c_v1.at(1) - c_t1.at(1)))
      let P3 = (c_v1.at(0) + (1 - z_start) * (c_v2.at(0) - c_v1.at(0)), c_v1.at(1) + (1 - z_start) * (c_v2.at(1) - c_v1.at(1)))
      let P4 = (c_v0.at(0) + (1 - z_start) * (c_v3.at(0) - c_v0.at(0)), c_v0.at(1) + (1 - z_start) * (c_v3.at(1) - c_v0.at(1)))
      pts = (P0, P1, P2, P3, P4, P0)
      vis = (true, true, true, false, false)
    } else if wrap == 6 {
      let P2 = (c_t1.at(0) + z_start * (c_v1.at(0) - c_t1.at(0)), c_t1.at(1) + z_start * (c_v1.at(1) - c_t1.at(1)))
      let P3 = (c_v1.at(0) + (1 - z_start) * (c_v2.at(0) - c_v1.at(0)), c_v1.at(1) + (1 - z_start) * (c_v2.at(1) - c_v1.at(1)))
      let P4 = (c_v3.at(0) + (1 - z_start) * (c_v2.at(0) - c_v3.at(0)), c_v3.at(1) + (1 - z_start) * (c_v2.at(1) - c_v3.at(1)))
      let P5 = (c_v3.at(0) + z_start * (c_t3.at(0) - c_v3.at(0)), c_v3.at(1) + z_start * (c_t3.at(1) - c_v3.at(1)))
      pts = (P0, P1, P2, P3, P4, P5, P0)
      vis = (true, true, true, false, false, false)
    }
    
    if pts.len() > 0 {
      for i in range(0, pts.len() - 1) {
        let style = if vis.at(i) { 1.5pt + path_color } else { (dash: "dashed", paint: path_color, thickness: 1.5pt) }
        line(pts.at(i), pts.at(i + 1), stroke: style)
      }
    }
    
    if labels {
      circle(P0, radius: 0.08, fill: rgb("1976D2"))
      content((P0.at(0) - 0.25, P0.at(1) + 0.25), [$M$])
    }
  }
  
  if labels {
    // Nhãn các đỉnh
    content((v0.at(0) - 0.2, v0.at(1) - 0.2), [$O$])
    content((v1.at(0) + 0.25, v1.at(1) - 0.2), [$D$])
    content((v2.at(0) + 0.25, v2.at(1) + 0.1), [$C$])
    content((v3.at(0) - 0.25, v3.at(1) + 0.1), [$B$])
    content((t0.at(0) - 0.25, t0.at(1) + 0.25), [$O'$])
    content((t1.at(0) + 0.25, t1.at(1) + 0.25), [$D'$])
    content((t2.at(0) + 0.25, t2.at(1) + 0.25), [$C'$])
    content((t3.at(0) - 0.25, t3.at(1) + 0.25), [$B'$])
  }
})

/// Hình trải phẳng của đường đi khép kín trên hình lập phương qua N mặt
#let _net_cube_closed_path(
  a: 2.0,
  wrap: 6,
  z_start: 0.333,
  m_at_bottom: false,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: line, circle, rect, content
  
  let faces_count = calc.min(int(wrap), 6)
  
  // Layout bậc thang cho 6 mặt: Top, Front, Right, Bottom, Back, Left
  let xs = (0, 0, 1, 2, 2, 3)
  let ys = (2, 1, 1, 1, 0, 0)
  
  // Vẽ các hình vuông theo layout bậc thang
  for i in range(0, faces_count) {
    let x = xs.at(i) * a
    let y = ys.at(i) * a
    rect((x, y), (x + a, y + a), stroke: 1.5pt + stroke)
  }
  
  // Nhãn các mặt
  if labels {
    let all_face_names = if m_at_bottom {
      (
        [Mặt dưới],
        [Mặt trước],
        [Mặt phải],
        [Mặt trên],
        [Mặt sau],
        [Mặt trái],
      )
    } else {
      (
        [Mặt trên],
        [Mặt trước],
        [Mặt phải],
        [Mặt dưới],
        [Mặt sau],
        [Mặt trái],
      )
    }
    for i in range(0, faces_count) {
      let x = xs.at(i) * a
      let y = ys.at(i) * a
      content(
        (x + a / 2, y + a / 2),
        align(center, text(size: 6.5pt, all_face_names.at(i))),
      )
    }
  }
  
  // Vẽ đường đi ngắn nhất (đường thẳng từ M đến M' trên bản vẽ trải)
  if path {
    let start_x = xs.at(0) * a
    let start_y = ys.at(0) * a + z_start * a
    
    let last_idx = faces_count - 1
    let end_x = xs.at(last_idx) * a + a
    let end_y = ys.at(last_idx) * a + z_start * a
    
    let p_start = (start_x, start_y)
    let p_end = (end_x, end_y)
    
    line(p_start, p_end, stroke: 1.8pt + path_color)
    
    if labels {
      circle(p_start, radius: 0.08, fill: rgb("1976D2"))
      content((p_start.at(0) - 0.3, p_start.at(1)), [$M$])
      circle(p_end, radius: 0.08, fill: rgb("E91E63"))
      content((p_end.at(0) + 0.3, p_end.at(1)), [$M'$])
    }
  }
})

/// Hình trải phẳng của hình lập phương (Cube) với đường đi quấn qua các mặt bên
///
/// - a (float): Độ dài cạnh hình lập phương.
/// - wrap (float): Số mặt bên đường đi quấn qua (2, 3, 4, 5, 6...). Mặc định là 3.
/// - path_type (string): Loại đường đi ("auto", "lateral", "all-faces").
#let cube(
  a: 2,
  wrap: 3,
  path_type: "auto",
  z_start: 0.0,
  z_end: 1.0,
  m_at_bottom: false,
  scale: 0.6cm,
  labels: true,
  guide: true,
  path: true,
  fill: none,
  stroke: black,
  path_color: _pink,
  display: "both",
  gap: 1.5cm,
) = {
  let is_6face = (path_type == "all-faces") or (path_type == "auto" and (wrap == 6 or wrap == 5 or wrap == 4 or wrap == 3 or wrap == 2) and z_start == z_end and z_start > 0.0)
  if is_6face {
    _show(
      _solid_cube_closed_path(a: float(a), wrap: int(wrap), z_start: float(z_start), m_at_bottom: m_at_bottom, scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
      _net_cube_closed_path(a: float(a), wrap: int(wrap), z_start: float(z_start), m_at_bottom: m_at_bottom, scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
      display: display,
      gap: gap,
    )
  } else {
    let loops = float(wrap) / 4.0
    _show(
      _solid_prism(faces: 4, a: float(a), h: float(a), loops: loops, z_start: float(z_start), z_end: float(z_end), scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
      _net_prism(faces: 4, a: float(a), h: float(a), loops: loops, z_start: float(z_start), z_end: float(z_end), scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
      display: display,
      gap: gap,
    )
  }
}
