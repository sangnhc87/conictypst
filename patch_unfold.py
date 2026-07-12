import re

with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# 1. Update scale for cone and frustum
content = re.sub(r'(#let cone\(.*?scale:\s*)0\.45cm', r'\g<1>0.65cm', content, flags=re.DOTALL)
content = re.sub(r'(#let frustum\(.*?scale:\s*)0\.45cm', r'\g<1>0.65cm', content, flags=re.DOTALL)

# 2. Update steps for _solid_cone, _solid_frustum, _solid_cylinder
content = content.replace("let steps = int(loops * 40) + 10", "let steps = int(loops * 300) + 100")

# 3. Add Prism
prism_code = """
/// Vẽ khối lăng trụ đều (Regular Prism)
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
  
  // Calculate circumscribed radius r from side length a
  // For regular polygon, side a = 2 * r * sin(180deg / faces)
  let r = a / (2 * calc.sin(180deg / faces))
  
  let base_pts = ()
  let top_pts = ()
  for i in range(0, faces) {
    let angle = -90deg + i * 360deg / faces
    let x = cx + r * calc.cos(angle)
    let y = cy + r * persp * calc.sin(angle)
    base_pts.push((x, y))
    top_pts.push((x, y + h))
  }
  
  // Draw base
  if fill != none {
    line(..base_pts, close: true, fill: fill, stroke: none)
    line(..top_pts, close: true, fill: fill, stroke: none)
  }
  
  // To draw properly with dashed hidden lines, we need to know which edge is in front
  // Edge i connects vertex i and i+1 (mod faces)
  for i in range(0, faces) {
    let next = calc.rem(i + 1, faces)
    let angle_i = -90deg + i * 360deg / faces
    let angle_next = -90deg + next * 360deg / faces
    // Face is in front if the normal points forward.
    // Approximate by the center angle of the edge
    let mid_angle = -90deg + (i + 0.5) * 360deg / faces
    let is_front = calc.sin(mid_angle) <= 0
    
    let style = if is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    
    // Draw base edge
    line(base_pts.at(i), base_pts.at(next), stroke: style)
    // Top edge is always solid
    line(top_pts.at(i), top_pts.at(next), stroke: 1.5pt + stroke)
    
    // Vertical edge at vertex i
    let vert_is_front = calc.sin(angle_i) <= 0
    let vert_style = if vert_is_front { 1.5pt + stroke } else { (dash: "dashed", paint: rgb("555"), thickness: 1.5pt) }
    line(base_pts.at(i), top_pts.at(i), stroke: vert_style)
  }
  
  // Draw path
  if path and loops > 0 {
    let total_faces = loops * faces
    let pts = ()
    // Path is a straight line in unrolled 2D: from (0,0) to (total_faces * a, h)
    // We intersect it with the vertical edges x = i * a
    for i in range(0, total_faces + 1) {
      let t = i / total_faces
      let z = t * h
      let v = calc.rem(i, faces)
      let angle_v = -90deg + v * 360deg / faces
      let px = cx + r * calc.cos(angle_v)
      let py = cy + z + r * persp * calc.sin(angle_v)
      let is_front = calc.sin(-90deg + (v - 0.5) * 360deg / faces) <= 0
      pts.push((pt: (px, py), is_front: is_front))
    }
    
    // Draw path segments
    for i in range(0, total_faces) {
      let p1 = pts.at(i).pt
      let p2 = pts.at(i+1).pt
      // Face i is between vertex (i mod faces) and (i+1 mod faces)
      let mid_angle = -90deg + (i + 0.5) * 360deg / faces
      let is_front = calc.sin(mid_angle) <= 0
      let style = if is_front { 1.5pt + path_color } else { (dash: "dashed", paint: path_color, thickness: 1.5pt) }
      line(p1, p2, stroke: style)
    }
  }
  
  if labels {
    circle(base_pts.at(0), radius: 0.08, fill: rgb("1976D2"))
    content((base_pts.at(0).at(0), base_pts.at(0).at(1) - 0.3), [$A$])
    let last = calc.rem(loops * faces, faces)
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
  for i in range(0, faces * loops) {
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
  
  if fill != none {
    rect((0, 0), (w, h), fill: rgb("FCE4EC"), stroke: none)
  }
  
  // Draw path
  if path {
    line((0, 0), (w, h), stroke: 1.8pt + path_color)
  }
  
  if labels {
    _mark((0, 0), name: [$A$], paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, h), name: [$A'$], paint: path_color, fill_label: _light_pink)
    content((w / 2, -0.6), _label([Chu vi trải = $#w$]))
    content((-0.6, h / 2), _label([$h = #h$]))
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

if "#let prism" not in content:
    content += "\n" + prism_code

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)

