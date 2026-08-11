import re

with open('/Users/admin/conictypst/typst-pkg-sang-math-graphics/src/core/projections.typ', 'r') as f:
    content = f.read()

# Replace the project-isometric math
old_math = '''  // Góc isometric chuẩn
  let alpha = deg-to-rad(35.264)
  let beta = deg-to-rad(45)
  let x2 = x * calc.cos(beta) + z * calc.sin(beta)
  let y2 = y * calc.cos(alpha) - x * calc.sin(beta) * calc.sin(alpha) + z * calc.cos(beta) * calc.sin(alpha)
  (x2, y2)'''

new_math = '''  // Isometric chuẩn với Z hướng thẳng đứng (Up)
  let alpha = deg-to-rad(30)
  let x2 = (y - x) * calc.cos(alpha)
  let y2 = z - (x + y) * calc.sin(alpha)
  (x2, y2)'''

new_content = content.replace(old_math, new_math)

with open('/Users/admin/conictypst/typst-pkg-sang-math-graphics/src/core/projections.typ', 'w') as f:
    f.write(new_content)
