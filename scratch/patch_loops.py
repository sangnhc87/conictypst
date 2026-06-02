import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# Replace draw_theory_cetz
theory_new = """def draw_theory_cetz(config_type, scale=0.33):
    prj_def = \"\"\"let prj(x, y, z) = {
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }\"\"\"
    
    if config_type == "1.1":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    let p1 = prj(-5, -5, 0)
    let p2 = prj(5, -5, 0)
    let p3 = prj(5, 5, 0)
    let p4 = prj(-5, 5, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(4 * calc.cos(d * 1deg), 4 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(2.3 * calc.cos(d * 1deg), 2.3 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
  }})\"\"\"
  
    elif config_type == "1.2":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    let p1 = prj(-4, -4, 0)
    let p2 = prj(7, -4, 0)
    let p3 = prj(7, 6, 0)
    let p4 = prj(-4, 6, 0)
    line(p1, p2, p3, p4, close: true, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3 * calc.cos(d * 1deg), 3 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(4 + 2 * calc.cos(d * 1deg), 3 + 2 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(4,3,0), radius: 1pt, fill: black)
    line(prj(0,0,0), prj(4,3,0), stroke: (dash: "dashed", paint: gray, thickness: 0.5pt))
  }})\"\"\"
  
    elif config_type == "2.1":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(5,-5,0), prj(5,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(4 * calc.cos(d * 1deg), 4 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(2.5 * calc.cos(d * 1deg), 2.5 * calc.sin(d * 1deg), 5))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(prj(-5,-5,5), prj(5,-5,5), prj(5,5,5), prj(-5,5,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    line(prj(0,0,0), prj(0,0,5), stroke: (dash: "dashed", paint: gray))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(0,0,5), radius: 1pt, fill: black)
  }})\"\"\"
  
    elif config_type == "2.2":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 2 + 2.5 * calc.sin(d * 1deg), 5))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(prj(-2,-3,5), prj(7,-3,5), prj(7,6,5), prj(-2,6,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    line(prj(0,0,0), prj(3,2,5), stroke: (dash: "dashed", paint: gray))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(3,2,5), radius: 1pt, fill: black)
  }})\"\"\"
"""
code = re.sub(r'def draw_theory_cetz.*?^def ', theory_new + '\ndef ', code, flags=re.MULTILINE|re.DOTALL, count=1)

# Replace draw_circle_sphere_cetz
sphere_new = """def draw_circle_sphere_cetz(J, R, P, I, R_S, M_pt=None, N_pt=None, scale=0.3):
    A, B, C, D = P
    u, v = get_uv(A, B, C)
    
    code = f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    let prj(x, y, z) = {{
      let xp = y - 0.2 * x
      let yp = z - 0.1 * x
      (xp, yp)
    }}
    let get_pt(J, R, u, v, deg) = {{
      let rad = deg * 1deg
      let x = J.at(0) + R * calc.cos(rad) * u.at(0) + R * calc.sin(rad) * v.at(0)
      let y = J.at(1) + R * calc.cos(rad) * u.at(1) + R * calc.sin(rad) * v.at(1)
      let z = J.at(2) + R * calc.cos(rad) * u.at(2) + R * calc.sin(rad) * v.at(2)
      (x, y, z)
    }}
    
    let u = ({u[0]}, {u[1]}, {u[2]})
    let v = ({v[0]}, {v[1]}, {v[2]})
    let J = ({J[0]}, {J[1]}, {J[2]})
    
    let pts = range(0, 365, step: 5).map(d => prj(..get_pt(J, {R}, u, v, d)))
    
    // Draw the sphere
    circle(prj({I[0]}, {I[1]}, {I[2]}), radius: {R_S} * 0.3cm, fill: rgb("e0f2fe30"), stroke: 0.5pt + rgb("#0284c7"))
    circle(prj({I[0]}, {I[1]}, {I[2]}), radius: 1.5pt, fill: rgb("#0284c7"))
    content(prj({I[0]}, {I[1]}, {I[2]}), [$I$], anchor: "north", padding: 3pt)
    
    // Draw the circle
    line(..pts, stroke: 1pt + rgb("#16a34a"))
    circle(prj(..J), radius: 1.5pt, fill: rgb("#16a34a"))
    content(prj(..J), [$J$], anchor: "south", padding: 3pt)
\"\"\"
    
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
    code += "\\n  })"
    return code
"""
code = re.sub(r'def draw_circle_sphere_cetz.*?^def ', sphere_new + '\ndef ', code, flags=re.MULTILINE|re.DOTALL, count=1)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
