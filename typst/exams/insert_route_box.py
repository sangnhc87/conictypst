with open('CD-DaiSo-ToHop-content.typ', 'r') as f:
    content = f.read()

route_box_def = """#let route-box(title: "🧭 Cách Nghĩ Chậm", body) = block(
  fill: rgb("FFF3E0"),
  stroke: (left: 4pt + rgb("EF6C00"), rest: 0.6pt + rgb("FFCC80")),
  radius: (right: 6pt),
  inset: (x: 14pt, y: 12pt),
  width: 100%,
)[
  #text(fill: rgb("E65100"), weight: "bold")[#title]
  #v(0.3em)
  #body
]
"""

content = content.replace('= 17 — Bổ Đề Burnside Và Bài Toán Vòng Cổ Đối Xứng', route_box_def + '\n= 17 — Bổ Đề Burnside Và Bài Toán Vòng Cổ Đối Xứng')

with open('CD-DaiSo-ToHop-content.typ', 'w') as f:
    f.write(content)

