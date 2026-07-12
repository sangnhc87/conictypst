import re

with open("unfold-package/unfold.typ", "r") as f:
    content = f.read()

# Add path_style to function signatures
# cone, frustum, cylinder, prism, pyramid, box3, etc.
# We only need to fix cone, frustum, cylinder.
# Actually, only cone and frustum have geodesic issues.
# Cylinder geodesic is a straight line in unrolled space, which is a helix in 3D!
# For a cylinder, geodesic == helix! So cylinder has no issue!
# Let's check _solid_cylinder:
# let curr-h = t * h
# let angle = offset-angle + t * loops * 360deg
# It's already a helix! So cylinder is fine.
# We only need to fix cone and frustum.

# Add path_style: "shortest" to cone and _solid_cone, frustum and _solid_frustum
for func in ["cone", "_solid_cone", "frustum", "_solid_frustum"]:
    content = re.sub(rf'#let {func}\((.*?)(path:\s*true,)(.*?)\)\s*=', rf'#let {func}(\1\2 path_style: "shortest",\3) =', content, flags=re.DOTALL)

# In cone and frustum, pass path_style: path_style to _solid_*
for func in ["cone", "frustum"]:
    content = re.sub(rf'(_solid_{func}\(.*?)(path:\s*path,)(.*?\))', rf'\1\2 path_style: path_style,\3', content, flags=re.DOTALL)

# Now inject the logic in _solid_cone
logic_cone = """
    let prev_theta = 0deg
    for i in range(0, steps + 1) {
      let t = i / steps
      let px_2d = (1 - t) * Ax + t * Bx
      let py_2d = (1 - t) * Ay + t * By
      let d = 0.0
      let theta_unwrapped = 0deg
      if path_style == "helix" {
        d = (1 - t) * 1.0 + t * to_ratio
        theta_unwrapped = t * theta_total
      } else {
        d = calc.sqrt(px_2d * px_2d + py_2d * py_2d)
        let theta = calc.atan2(py_2d, px_2d)
        if i > 0 {
          while theta - prev_theta > 180deg { theta -= 360deg }
          while prev_theta - theta > 180deg { theta += 360deg }
        }
        prev_theta = theta
        theta_unwrapped = theta
      }
"""
content = re.sub(r'    for i in range\(0, steps \+ 1\) \{\s*let t = i / steps\s*let px_2d = \(1 - t\) \* Ax \+ t \* Bx\s*let py_2d = \(1 - t\) \* Ay \+ t \* By\s*let d = calc\.sqrt\(px_2d \* px_2d \+ py_2d \* py_2d\)\s*let theta = calc\.atan2\(py_2d, px_2d\)\s*let theta_unwrapped = if theta < 0deg \{ theta \+ 360deg \} else \{ theta \}', logic_cone, content)

# Now inject the logic in _solid_frustum
logic_frustum = """
    let prev_theta = 0deg
    for i in range(0, steps + 1) {
      let t = i / steps
      let px_2d = (1 - t) * Ax + t * Bx
      let py_2d = (1 - t) * Ay + t * By
      let d = 0.0
      let theta_unwrapped = 0deg
      if path_style == "helix" {
        d = (1 - t) * L_big + t * L_small
        theta_unwrapped = t * theta_total
      } else {
        d = calc.sqrt(px_2d * px_2d + py_2d * py_2d)
        let theta = calc.atan2(py_2d, px_2d)
        if i > 0 {
          while theta - prev_theta > 180deg { theta -= 360deg }
          while prev_theta - theta > 180deg { theta += 360deg }
        }
        prev_theta = theta
        theta_unwrapped = theta
      }
"""
content = re.sub(r'    for i in range\(0, steps \+ 1\) \{\s*let t = i / steps\s*let px_2d = \(1 - t\) \* Ax \+ t \* Bx\s*let py_2d = \(1 - t\) \* Ay \+ t \* By\s*let d = calc\.sqrt\(px_2d \* px_2d \+ py_2d \* py_2d\)\s*let theta = calc\.atan2\(py_2d, px_2d\)\s*let theta_unwrapped = if theta < 0deg \{ theta \+ 360deg \} else \{ theta \}', logic_frustum, content)

with open("unfold-package/unfold.typ", "w") as f:
    f.write(content)

print("Fixed paths.")
