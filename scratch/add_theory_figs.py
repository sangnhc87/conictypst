import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

drawing_funcs = r"""
def draw_method1_cetz(scale=0.3):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    
    // Plane P2 (z=0)
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    content(prj(6,4,0), [$(P_2)$], anchor: "south")
    
    // Circle C2 and C1' on P2
    let pts2 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3.5,0,0), [$(C_2)$], anchor: "west")
    
    let pts1_prime = range(0, 365, step: 5).map(d => prj(-2 + 2 * calc.cos(d * 1deg), -2 + 2 * calc.sin(d * 1deg), 0))
    line(..pts1_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    content(prj(-2, -4, 0), [$(C_1')$], anchor: "north")
    
    // Plane P1 (z=6)
    line(prj(-5,-5,6), prj(6,-5,6), prj(6,5,6), prj(-5,5,6), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    content(prj(6,4,6), [$(P_1)$], anchor: "south")
    
    // Circle C1 on P1
    let pts1 = range(0, 365, step: 5).map(d => prj(-2 + 2 * calc.cos(d * 1deg), -2 + 2 * calc.sin(d * 1deg), 6))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(-2, -4, 6), [$(C_1)$], anchor: "north")
    
    let M = prj(-2, 0, 6)
    let M_prime = prj(-2, 0, 0)
    let N = prj(0, 3.5, 0)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "south", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    line(M, M_prime, stroke: (dash: "dashed", paint: black))
    content(prj(-2, 0, 3), [$h$], anchor: "east")
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
  }})\"\"\"

def draw_method2_cetz(scale=0.3):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    
    // Plane P1 (horizontal)
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    content(prj(6,4,0), [$(P_1)$], anchor: "south")
    
    // Plane P2 (vertical)
    line(prj(0,-5,0), prj(0,5,0), prj(0,5,8), prj(0,-5,8), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    content(prj(0,4,8), [$(P_2)$], anchor: "south")
    
    // Circle C1
    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(3.5,0,0), [$(C_1)$], anchor: "west")
    
    // Circle C2
    let pts2 = range(0, 365, step: 5).map(d => prj(0, 3 * calc.cos(d * 1deg), 4 + 3 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(0,0,7), [$(C_2)$], anchor: "east")
    
    let M = prj(3.5, 0, 0)
    let M_p = prj(0, 0, 0)
    let N = prj(0, 3, 4)
    let J2 = prj(0, 0, 4)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    
    circle(M_p, radius: 1.5pt, fill: black)
    content(M_p, [$M_p$], anchor: "north-east", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "east", padding: 3pt)
    
    line(M, M_p, stroke: (dash: "dashed", paint: black))
    line(M_p, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M_p, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
  }})\"\"\"
"""

code = code.replace("def draw_theory_cetz", drawing_funcs + "\ndef draw_theory_cetz")

# Inject the diagrams into the text
# After "M N = sqrt(M' N^2 + h^2) $" for method 1
# And after "$ M N = sqrt(M M_p^2 + M_p N^2) $" for method 2

injection_m1 = "\n   #align(center)[{draw_method1_cetz()}]\n"
injection_m2 = "\n   #align(center)[{draw_method2_cetz()}]\n"

code = code.replace("$ M N = sqrt(M' N^2 + h^2) $", "$ M N = sqrt(M' N^2 + h^2) $" + injection_m1)
code = code.replace("$ M N = sqrt(M M_p^2 + M_p N^2) $", "$ M N = sqrt(M M_p^2 + M_p N^2) $" + injection_m2)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
