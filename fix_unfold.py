import re

with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# Remove the injected _solid_prism (the one with base_pts = ())
content = re.sub(r'#let _solid_prism\(\s*faces: 3.*?\n\}\)', '', content, flags=re.DOTALL)

# Remove the original _solid_prism alias
content = re.sub(r'#let _solid_prism\(n: 4.*?_solid_box.*?\)\n', '', content)

# Remove the old prism wrapper and _net_prism if it exists (it doesn't, old prism wrapper starts at 921)
# Old prism wrapper:
old_prism_regex = r'#let prism\(\s*n: 4.*?_show\(_solid_prism.*?gap\)\n\}'
content = re.sub(old_prism_regex, '', content, flags=re.DOTALL)

prism_code = """
/// Hình khối 3D lăng trụ đều
#let _solid_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  fill: none,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: *
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
    sum_x += p[0]
    sum_y += p[1]
  }
  let avg_x = sum_x / faces
  let avg_y = sum_y / faces
  let centered_base = ()
  for p in base_pts {
    centered_base.push((p[0] - avg_x, p[1] - avg_y))
  }
  base_pts = centered_base
  
  let top_pts = ()
  for p in base_pts {
    top_pts.push((p[0], p[1] + h))
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
      let z1 = t1 * h
      let z2 = t2 * h
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
    circle(base_pts.at(0), radius: 0.08, fill: rgb("1976D2"))
    content((base_pts.at(0).at(0), base_pts.at(0).at(1) - 0.3), [$A$])
    let last = calc.rem(int(loops * faces), faces)
    circle(top_pts.at(last), radius: 0.08, fill: rgb("E91E63"))
    content((top_pts.at(last).at(0), top_pts.at(last).at(1) + 0.35), [$A'$])
  }
})

#let _net_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {
  import cetz.draw: *
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
  
  // Draw path
  if path {
    line((0, 0), (w, h), stroke: 1.8pt + path_color)
  }
  
  if labels {
    _mark((0, 0), name: [$A$], paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, h), name: [$A'$], paint: path_color, fill_label: _light_pink)
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
    _solid_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), scale: scale, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), scale: scale, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}
"""

content = content + "\n\n" + prism_code

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)
