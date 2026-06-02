import re
import math

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

# 1. Update the grid to have 8 items
grid_old = """=== Minh họa trực quan 6 cấu hình hình học mẫu:
#v(0.5em)
#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,"""

grid_new = """=== Minh họa trực quan 8 cấu hình hình học mẫu (Có dùng Hình lập phương làm khung tham chiếu):
#v(0.5em)
#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,"""
code = code.replace(grid_old, grid_new)

# Add f41 and f42 to the grid display
f32_block = """  [
    #block(stroke: 0.4pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold")[Cấu hình 3.2: Đoạn vuông góc chung]
      #v(0.2em)
      #{f32}
    ]
  ]
)"""

f4_blocks = """  [
    #block(stroke: 0.4pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold")[Cấu hình 3.2: Đoạn vuông góc chung]
      #v(0.2em)
      #{f32}
    ]
  ],
  [
    #block(stroke: 0.4pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold")[Cấu hình 4.1: Mặt phẳng nghiêng (Cắt nhau)]
      #v(0.2em)
      #{f41}
    ]
  ],
  [
    #block(stroke: 0.4pt + gray, inset: 6pt, radius: 4pt, width: 100%)[
      #text(size: 8.5pt, weight: "bold")[Cấu hình 4.2: Mặt phẳng nghiêng (Lệch tâm)]
      #v(0.2em)
      #{f42}
    ]
  ]
)"""
code = code.replace(f32_block, f4_blocks)

# Update get_typst_header definition to accept f41, f42
header_def_old = "def get_typst_header(f11, f12, f21, f22, f31, f32):"
header_def_new = "def get_typst_header(f11, f12, f21, f22, f31, f32, f41, f42):"
code = code.replace(header_def_old, header_def_new)

# Update the call to get_typst_header
call_old = """    f31 = draw_theory_cetz("3.1")
    f32 = draw_theory_cetz("3.2")
    
    header = get_typst_header(f11, f12, f21, f22, f31, f32)"""

call_new = """    f31 = draw_theory_cetz("3.1")
    f32 = draw_theory_cetz("3.2")
    f41 = draw_theory_cetz("4.1")
    f42 = draw_theory_cetz("4.2")
    
    header = get_typst_header(f11, f12, f21, f22, f31, f32, f41, f42)"""
code = code.replace(call_old, call_new)

# Now, rewrite draw_theory_cetz to include the new 3.1, 3.2, 4.1, 4.2 using a CUBE!
def rewrite_theory_cetz():
    return r"""
def draw_theory_cetz(config_type, scale=0.33):
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
  
    elif config_type == "3.1": # Vuông góc lệch trục
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(2 + 2 * calc.cos(d * 1deg), 3 + 2 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(4 + 1.5 * calc.cos(d * 1deg), 6, 3 + 1.5 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(2,3,0), radius: 1.5pt, fill: black)
    circle(prj(4,6,3), radius: 1.5pt, fill: black)
    // Projections onto intersection
    line(prj(2,3,0), prj(2,6,0), stroke: (dash: "dashed", paint: gray))
    line(prj(4,6,3), prj(4,6,0), stroke: (dash: "dashed", paint: gray))
  }})\"\"\"
  
    elif config_type == "3.2": # Vuông góc đồng trục
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    // C2 on right (y=6)
    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2 * calc.cos(d * 1deg), 6, 3 + 2 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(3,3,0), radius: 1.5pt, fill: black)
    circle(prj(3,6,3), radius: 1.5pt, fill: black)
    // Common projection
    line(prj(3,3,0), prj(3,6,0), stroke: (dash: "dashed", paint: gray))
    line(prj(3,6,3), prj(3,6,0), stroke: (dash: "dashed", paint: gray))
    circle(prj(3,6,0), radius: 1.5pt, fill: gray)
  }})\"\"\"

    elif config_type == "4.1": # Nghiêng đồng trục (C2 slanted plane)
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // Slanted plane from (6,0,0) to (0,6,6)
    line(prj(6,0,0), prj(6,6,0), prj(0,6,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 3 + 2.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    
    // C2 on slanted plane
    // Center is (3,3,3)
    let r2 = 2.5
    // Parameterization on plane x+z=6
    // x = 3 - r2/sqrt(2) * sin t
    // y = 3 + r2 * cos t
    // z = 3 + r2/sqrt(2) * sin t
    let pts2 = range(0, 365, step: 5).map(d => prj(3 - 1.767 * calc.sin(d * 1deg), 3 + 2.5 * calc.cos(d * 1deg), 3 + 1.767 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(3,3,0), radius: 1.5pt, fill: black)
    circle(prj(3,3,3), radius: 1.5pt, fill: black)
    line(prj(3,3,0), prj(3,3,3), stroke: (dash: "dashed", paint: gray))
  }})\"\"\"

    elif config_type == "4.2": # Nghiêng lệch tâm
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    {cube_def}
    // Slanted plane from (6,0,0) to (0,6,6)
    line(prj(6,0,0), prj(6,6,0), prj(0,6,6), prj(0,0,6), close: true, fill: rgb("ca8a0420"), stroke: 0.5pt + rgb("ca8a04"))
    
    // C1 on bottom (z=0)
    let pts1 = range(0, 365, step: 5).map(d => prj(1.5 + 1.5 * calc.cos(d * 1deg), 3 + 1.5 * calc.sin(d * 1deg), 0))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    
    // C2 on slanted plane
    // Center is (4.5, 4, 1.5)
    let r2 = 1.5
    let pts2 = range(0, 365, step: 5).map(d => prj(4.5 - 1.06 * calc.sin(d * 1deg), 4 + 1.5 * calc.cos(d * 1deg), 1.5 + 1.06 * calc.sin(d * 1deg)))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    
    circle(prj(1.5,3,0), radius: 1.5pt, fill: black)
    circle(prj(4.5,4,1.5), radius: 1.5pt, fill: black)
    // Project J2 onto z=0
    line(prj(4.5,4,1.5), prj(4.5,4,0), stroke: (dash: "dashed", paint: gray))
  }})\"\"\"

    return ""
"""

# Replace the old function
import re
code = re.sub(r'def draw_theory_cetz.*?return ""', rewrite_theory_cetz().strip(), code, flags=re.DOTALL)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
