import re

file_path = "/Users/admin/conictypst/typst-pkg-sang-math-graphics/src/3d/geodesic.typ"
with open(file_path, "r") as f:
    content = f.read()

# Add _arc function at the top after imports
if "#let _arc" not in content:
    helper = """
#let _arc(center, start: 0deg, stop: 180deg, radius: 1, ..style) = {
  let (rx, ry) = if type(radius) == "dictionary" or type(radius) == "array" {
    (radius.at(0), radius.at(1))
  } else {
    (radius, radius)
  }
  let sx = center.at(0) + rx * calc.cos(start)
  let sy = center.at(1) + ry * calc.sin(start)
  cetz.draw.arc((sx, sy), start: start, stop: stop, radius: radius, ..style)
}
"""
    content = content.replace('import cetz.draw: line, content, circle, group', 'import cetz.draw: line, content, circle, group' + helper)

# Replace draw.arc or arc with _arc
content = re.sub(r'\barc\(', '_arc(', content)
content = re.sub(r'cetz\.draw\._arc', '_arc', content)
content = re.sub(r'draw\._arc', '_arc', content)
content = re.sub(r'__arc', '_arc', content) # in case of double replace

with open(file_path, "w") as f:
    f.write(content)
