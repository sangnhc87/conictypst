with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# 1. Modify the unfold selector to support kind: "cube"
old_selector_end = """  } else if kind == "box" {
    box3(a: a, b: b, c: c, labels: labels, guide: guide, path: path, display: display, gap: gap)
  } else {
    panic("unfold.net: kind khong hop le. Dung: cone, frustum, cylinder, prism, pyramid, box")
  }"""

new_selector_end = """  } else if kind == "box" {
    box3(a: a, b: b, c: c, labels: labels, guide: guide, path: path, display: display, gap: gap)
  } else if kind == "cube" {
    let w = if wrap != "auto" { float(wrap) } else { 3.0 }
    cube(
      a: a,
      wrap: w,
      labels: labels,
      guide: guide,
      path: path,
      display: display,
      gap: gap,
    )
  } else {
    panic("unfold.net: kind khong hop le. Dung: cone, frustum, cylinder, prism, pyramid, box, cube")
  }"""

content = content.replace(old_selector_end, new_selector_end)

# 2. Append the cube wrapper at the end of unfold.typ
cube_code = """
/// Hình trải phẳng của hình lập phương (Cube) với đường đi quấn qua các mặt bên
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
}
"""

content = content + "\n\n" + cube_code

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)
