import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

mn_code = """
    if M_pt and N_pt:
        code += f\"\"\"
    let M = prj({M_pt[0]}, {M_pt[1]}, {M_pt[2]})
    let N = prj({N_pt[0]}, {N_pt[1]}, {N_pt[2]})
    circle(M, radius: 2pt, fill: rgb("#16a34a"))
    circle(N, radius: 2pt, fill: rgb("#dc2626"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    content(N, [$N$], anchor: "south", padding: 3pt)
    line(M, N, stroke: 1.5pt + rgb("#ea580c"))
    \"\"\"
"""

code = code.replace('    if project_c2:', mn_code + '\    if project_c2:')

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
