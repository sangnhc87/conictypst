import re
import math

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Define the new functions
new_funcs = r"""
def draw_method1_cetz(scale=0.35):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    
    cube_def = \"\"\"
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    \"\"\"

    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // P2: bottom face (z=0)
    content(prj(6,4,0), [$(P_2)$], anchor: "south")
    // P1: top face (z=6)
    content(prj(6,4,6), [$(P_1)$], anchor: "south")
    
    // C2 on P2
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3,0.5,0), [$(C_2)$], anchor: "west")
    
    // C1' (projection) on P2
    let pts1_prime = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 0))
    line(..pts1_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    content(prj(1.5, 1, 0), [$(C_1')$], anchor: "north")
    
    // C1 on P1
    let pts1 = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 2.5 + 1.5 * calc.sin(d * 1deg), 6))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(1.5, 1, 6), [$(C_1)$], anchor: "north")
    
    let M = prj(1.5, 4, 6)
    let M_prime = prj(1.5, 4, 0)
    let N = prj(3, 5.5, 0)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "south", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-west", padding: 3pt)
    
    line(M, M_prime, stroke: (dash: "dashed", paint: black))
    content(prj(1.5, 4, 3), [$h$], anchor: "east")
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
  }})\"\"\"

def draw_method2_cetz(scale=0.35):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    
    cube_def = \"\"\"
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    \"\"\"

    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // P1: bottom face
    content(prj(6,4,0), [$(P_1)$], anchor: "south")
    // P2: right face (y=6)
    content(prj(4,6,6), [$(P_2)$], anchor: "south")
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    content(prj(3,0.5,0), [$(C_1)$], anchor: "west")
    
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2 * calc.cos(d * 1deg), 6, 3 + 2 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3,6,5.5), [$(C_2)$], anchor: "east")
    
    let M = prj(1, 4.5, 0)
    // Projection of M(1,4.5,0) onto y=6 is (1,6,0)
    let M_p = prj(1, 6, 0)
    let J2 = prj(3, 6, 3)
    
    // Vector M_p -> J2 is (2, 0, 3). Length sqrt(13) = 3.6
    // R2 = 2. Direction = (2/3.6, 0, 3/3.6) = (0.55, 0, 0.83)
    // N on C2 farthest from M_p? Or closest? Let's pick a visible N
    let N = prj(3 - 2 * 2/3.6, 6, 3 - 2 * 3/3.6) // (1.89, 6, 1.33)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    
    circle(M_p, radius: 1.5pt, fill: black)
    content(M_p, [$M_p$], anchor: "north-west", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-east", padding: 3pt)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "south", padding: 3pt)
    
    line(M, M_p, stroke: (dash: "dashed", paint: black))
    line(M_p, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M_p, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
  }})\"\"\"

def draw_universal_proof_cetz(scale=0.35):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    
    cube_def = \"\"\"
    let v000 = prj(0,0,0); let v600 = prj(6,0,0); let v660 = prj(6,6,0); let v060 = prj(0,6,0)
    let v006 = prj(0,0,6); let v606 = prj(6,0,6); let v666 = prj(6,6,6); let v066 = prj(0,6,6)
    // Hidden edges
    line(v000, v600, stroke: (dash: "dashed", paint: gray))
    line(v000, v060, stroke: (dash: "dashed", paint: gray))
    line(v000, v006, stroke: (dash: "dashed", paint: gray))
    // Solid edges
    line(v600, v660, v060, stroke: 0.5pt + gray)
    line(v006, v606, v666, v066, close: true, stroke: 0.5pt + gray)
    line(v600, v606, stroke: 0.5pt + gray)
    line(v660, v666, stroke: 0.5pt + gray)
    line(v060, v066, stroke: 0.5pt + gray)
    \"\"\"

    return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    
    // Slanted plane y+z=6
    line(prj(0,6,0), prj(6,6,0), prj(6,0,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    content(prj(5,3,3), [$(P_2)$], anchor: "south")
    
    // C2 on slanted plane. Center J2(3,3,3), R2=2.5
    // u = (1,0,0), v = (0, -1/sqrt(2), 1/sqrt(2))
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 - 1.767 * calc.sin(d * 1deg), 3 + 1.767 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    content(prj(3, 3 - 1.767, 3 + 1.767), [$(C_2)$], anchor: "south-east")
    
    // M outside. Let M be on bottom face: (3, 1.5, 0)
    let M = prj(3, 1.5, 0)
    // Projection M' onto y+z=6 is (3, 3.75, 2.25)
    let M_prime = prj(3, 3.75, 2.25)
    let J2 = prj(3, 3, 3)
    
    // M' -> J2 is (0, -0.75, 0.75). Direction is (0, -1/sqrt(2), 1/sqrt(2))
    // N on C2 collinear with M' and J2
    let N = prj(3, 3 - 2.5 * 0.707, 3 + 2.5 * 0.707) // (3, 1.23, 4.76)
    
    circle(J2, radius: 1.5pt, fill: black)
    content(J2, [$J_2$], anchor: "north", padding: 3pt)
    
    circle(M_prime, radius: 1.5pt, fill: black)
    content(M_prime, [$M'$], anchor: "north-west", padding: 3pt)
    
    circle(M, radius: 1.5pt, fill: rgb("#16a34a"))
    content(M, [$M$], anchor: "north", padding: 3pt)
    
    circle(N, radius: 1.5pt, fill: rgb("#dc2626"))
    content(N, [$N$], anchor: "south-east", padding: 3pt)
    
    line(M, M_prime, stroke: (dash: "dashed", paint: rgb("#16a34a")))
    line(M_prime, J2, stroke: (dash: "dashed", paint: gray))
    line(J2, N, stroke: (dash: "dashed", paint: gray))
    line(M_prime, N, stroke: 0.5pt + rgb("#ea580c"))
    line(M, N, stroke: 1.2pt + rgb("#ea580c"))
    line(M, J2, stroke: 0.5pt + gray)
  }})\"\"\"
"""

code = re.sub(r'def draw_method1_cetz.*?\}\)\"\"\"', '', code, flags=re.DOTALL)
code = re.sub(r'def draw_method2_cetz.*?\}\)\"\"\"', '', code, flags=re.DOTALL)
code = re.sub(r'def draw_universal_proof_cetz.*?\}\)\"\"\"', '', code, flags=re.DOTALL)

code = code.replace("def draw_theory_cetz", new_funcs + "\ndef draw_theory_cetz")

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
