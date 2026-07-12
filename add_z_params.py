with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# 1. Update unfold selector signature to include z_start and z_end
old_unfold_sig = """#let unfold(
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
  labels: true,
  guide: true,
  path: true,
  display: "net",
  gap: 1.2cm,
) = {"""

new_unfold_sig = """#let unfold(
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
  labels: true,
  guide: true,
  path: true,
  display: "net",
  gap: 1.2cm,
) = {"""

content = content.replace(old_unfold_sig, new_unfold_sig)

# 2. Update prism and cube calls in unfold selector
old_prism_call = """  } else if kind == "prism" {
    prism(
      n: n,
      a: a,
      h: h,
      wrap: wrap,
      faces: faces,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )"""

new_prism_call = """  } else if kind == "prism" {
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
    )"""

content = content.replace(old_prism_call, new_prism_call)

old_cube_call = """  } else if kind == "cube" {
    let w = if wrap != "auto" { float(wrap) } else { 3.0 }
    cube(
      a: a,
      wrap: w,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )"""

new_cube_call = """  } else if kind == "cube" {
    let w = if wrap != "auto" { float(wrap) } else { 3.0 }
    cube(
      a: a,
      wrap: w,
      z_start: z_start,
      z_end: z_end,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )"""

content = content.replace(old_cube_call, new_cube_call)

# 3. Update prism wrapper signature and body
old_prism_wrapper = """/// Hình trải phẳng của lăng trụ đều
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
    _solid_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: faces, a: float(a), h: float(h), loops: float(wrap), scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}"""

new_prism_wrapper = """/// Hình trải phẳng của lăng trụ đều
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
}"""

content = content.replace(old_prism_wrapper, new_prism_wrapper)

# 4. Update cube wrapper signature and body
old_cube_wrapper = """/// Hình trải phẳng của hình lập phương (Cube) với đường đi quấn qua các mặt bên
///
/// - a (float): Độ dài cạnh hình lập phương.
/// - wrap (float): Số mặt bên đường đi quấn qua (2, 3, 4, 5, 6...). Mặc định là 3.
#let cube(
  a: 2,
  wrap: 3,
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
  let loops = float(wrap) / 4.0
  _show(
    _solid_prism(faces: 4, a: float(a), h: float(a), loops: loops, scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: 4, a: float(a), h: float(a), loops: loops, scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}"""

new_cube_wrapper = """/// Hình trải phẳng của hình lập phương (Cube) với đường đi quấn qua các mặt bên
///
/// - a (float): Độ dài cạnh hình lập phương.
/// - wrap (float): Số mặt bên đường đi quấn qua (2, 3, 4, 5, 6...). Mặc định là 3.
#let cube(
  a: 2,
  wrap: 3,
  z_start: 0.0,
  z_end: 1.0,
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
  let loops = float(wrap) / 4.0
  _show(
    _solid_prism(faces: 4, a: float(a), h: float(a), loops: loops, z_start: float(z_start), z_end: float(z_end), scale: scale * 1.5, labels: labels, stroke: stroke, fill: fill, path_color: path_color, path: path),
    _net_prism(faces: 4, a: float(a), h: float(a), loops: loops, z_start: float(z_start), z_end: float(z_end), scale: scale * 1.3, labels: labels, stroke: stroke, path_color: path_color, path: path),
    display: display,
    gap: gap,
  )
}"""

content = content.replace(old_cube_wrapper, new_cube_wrapper)

# 5. Update _solid_prism implementation
old_solid_prism_def = """/// Hình khối 3D lăng trụ đều
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
) = cetz.canvas(length: scale, {"""

new_solid_prism_def = """/// Hình khối 3D lăng trụ đều
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
) = cetz.canvas(length: scale, {"""

content = content.replace(old_solid_prism_def, new_solid_prism_def)

# Update path drawing inside _solid_prism
old_solid_path = """  if path and loops > 0 {
    let total_faces = int(loops * faces)
    for i in range(0, total_faces) {
      let t1 = i / total_faces
      let t2 = (i + 1) / total_faces
      let z1 = t1 * h
      let z2 = t2 * h
      let v1 = calc.rem(i, faces)
      let v2 = calc.rem(i + 1, faces)
      let p1 = (base_pts.at(v1).at(0), base_pts.at(v1).at(1) + z1)
      let p2 = (base_pts.at(v2).at(0), base_pts.at(v2).at(1) + z2)"""

new_solid_path = """  if path and loops > 0 {
    let total_faces = int(loops * faces)
    for i in range(0, total_faces) {
      let t1 = i / total_faces
      let t2 = (i + 1) / total_faces
      let z1 = (z_start * (1 - t1) + z_end * t1) * h
      let z2 = (z_start * (1 - t2) + z_end * t2) * h
      let v1 = calc.rem(i, faces)
      let v2 = calc.rem(i + 1, faces)
      let p1 = (base_pts.at(v1).at(0), base_pts.at(v1).at(1) + z1)
      let p2 = (base_pts.at(v2).at(0), base_pts.at(v2).at(1) + z2)"""

content = content.replace(old_solid_path, new_solid_path)

# Update labels drawing inside _solid_prism
old_solid_labels = """  if labels {
    circle(base_pts.at(0), radius: 0.08, fill: rgb("1976D2"))
    content((base_pts.at(0).at(0), base_pts.at(0).at(1) - 0.3), [$A$])
    let last = calc.rem(int(loops * faces), faces)
    circle(top_pts.at(last), radius: 0.08, fill: rgb("E91E63"))
    content((top_pts.at(last).at(0), top_pts.at(last).at(1) + 0.35), [$A'$])
  }"""

new_solid_labels = """  if labels {
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
  }"""

content = content.replace(old_solid_labels, new_solid_labels)

# 6. Update _net_prism implementation
old_net_prism_def = """#let _net_prism(
  faces: 3,
  a: 1.0,
  h: 2.0,
  loops: 1,
  scale: 0.6cm,
  labels: true,
  stroke: black,
  path_color: _pink,
  path: true,
) = cetz.canvas(length: scale, {"""

new_net_prism_def = """#let _net_prism(
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
) = cetz.canvas(length: scale, {"""

content = content.replace(old_net_prism_def, new_net_prism_def)

old_net_path_labels = """  // Draw path
  if path {
    line((0, 0), (w, h), stroke: 1.8pt + path_color)
  }
  
  if labels {
    _mark((0, 0), name: [$A$], paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, h), name: [$A'$], paint: path_color, fill_label: _light_pink)"""

new_net_path_labels = """  let y_start = z_start * h
  let y_end = z_end * h
  
  // Draw path
  if path {
    line((0, y_start), (w, y_end), stroke: 1.8pt + path_color)
  }
  
  if labels {
    let start_name = if z_start == 0.0 { [$A$] } else { [$M$] }
    let end_name = if z_end == 1.0 { [$A'$] } else if z_start == z_end and loops == 1.0 { [$M'$] } else { [$N$] }
    
    _mark((0, y_start), name: start_name, paint: rgb("1976D2"), fill_label: _light_blue)
    _mark((w, y_end), name: end_name, paint: path_color, fill_label: _light_pink)"""

content = content.replace(old_net_path_labels, new_net_path_labels)

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)

