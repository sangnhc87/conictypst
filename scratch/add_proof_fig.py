import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

proof_diagram_func = r"""
def draw_universal_proof_cetz(scale=0.4):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    // Draw plane P2
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    content(prj(5,4,0), [$(P_2)$], anchor: "south")
    
    // Draw circle C2 on P2
    let pts = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    line(..pts, stroke: 1pt + rgb("#dc2626"))
    content(prj(3.5,0,0), [$(C_2)$], anchor: "west")
    
    // Points
    let J2 = prj(0,0,0)
    let M_prime = prj(-2,3,0)
    let M = prj(-2,3,5)
    
    // Find N on C2 that is collinear with M' and J2
    // Vector M'->J2 is (2, -3, 0), length = sqrt(13) = 3.6
    // J2 is (0,0), radius is 3.5
    // Unit vector is (2/3.6, -3/3.6)
    let u_x = 2 / calc.sqrt(13)
    let u_y = -3 / calc.sqrt(13)
    let N = prj(3.5 * u_x, 3.5 * u_y, 0)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north", padding: 3pt)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "south", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "north-west", padding: 3pt)
    
    // Lines
    line(M, M_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    line(M_prime, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M, J2, stroke: 0.5pt + gray)
  }})\"\"\"
"""

code = code.replace("def draw_theory_cetz", proof_diagram_func + "\ndef draw_theory_cetz")

# Now inject the call to draw_universal_proof_cetz into get_typst_header
proof_injection = """
#align(center)[
  #draw_universal_proof_cetz()
]
"""
# Replace inside get_typst_header where we added the proof
code = code.replace("*Chứng minh Công thức Vạn năng:*", "*Chứng minh Công thức Vạn năng:*" + proof_injection)
# Wait, draw_universal_proof_cetz is python function, not typst function. I need to call it in get_typst_header formatting!
code = code.replace("#draw_universal_proof_cetz()", "{draw_universal_proof_cetz()}")

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
