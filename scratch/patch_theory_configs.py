import re

with open('scratch/generate_deep_2_circles_3D.py', 'r') as f:
    code = f.read()

missing_configs = """
    elif config_type == "3.1":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    line(prj(0,-5,0), prj(0,5,0), prj(0,5,6), prj(0,-5,6), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(0, 2 + 2 * calc.cos(d * 1deg), 3 + 2 * calc.sin(d * 1deg)))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(0,2,3), radius: 1pt, fill: black)
    line(prj(0,0,0), prj(0,2,3), stroke: (dash: "dashed", paint: gray))
  }})\"\"\"
  
    elif config_type == "3.2":
        return f\"\"\"cetz.canvas(length: {scale}cm, {{
    import cetz.draw: *
    {prj_def}
    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))
    line(prj(0,-5,0), prj(0,5,0), prj(0,5,6), prj(0,-5,6), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))
    let pts1 = range(0, 365, step: 5).map(d => prj(3 * calc.cos(d * 1deg), 3 * calc.sin(d * 1deg), 0))
    let pts2 = range(0, 365, step: 5).map(d => prj(0, 3 * calc.cos(d * 1deg), 3 + 3 * calc.sin(d * 1deg)))
    line(..pts1, stroke: 1pt + rgb("#16a34a"))
    line(..pts2, stroke: 1pt + rgb("#dc2626"))
    circle(prj(0,0,0), radius: 1pt, fill: black)
    circle(prj(0,0,3), radius: 1pt, fill: black)
    line(prj(0,0,0), prj(0,0,3), stroke: (dash: "dashed", paint: gray))
  }})\"\"\"
"""

code = code.replace('    elif config_type == "2.2":\n        return f"""cetz.canvas(length: {scale}cm, {\n    import cetz.draw: *\n    {prj_def}\n    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))\n    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))\n    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 2 + 2.5 * calc.sin(d * 1deg), 5))\n    line(..pts1, stroke: 1pt + rgb("#16a34a"))\n    line(prj(-2,-3,5), prj(7,-3,5), prj(7,6,5), prj(-2,6,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))\n    line(..pts2, stroke: 1pt + rgb("#dc2626"))\n    line(prj(0,0,0), prj(3,2,5), stroke: (dash: "dashed", paint: gray))\n    circle(prj(0,0,0), radius: 1pt, fill: black)\n    circle(prj(3,2,5), radius: 1pt, fill: black)\n  })"""', 
'    elif config_type == "2.2":\n        return f"""cetz.canvas(length: {scale}cm, {\n    import cetz.draw: *\n    {prj_def}\n    line(prj(-5,-5,0), prj(6,-5,0), prj(6,5,0), prj(-5,5,0), close: true, fill: rgb("e0f2fe20"), stroke: 0.5pt + rgb("#0284c7"))\n    let pts1 = range(0, 365, step: 5).map(d => prj(3.5 * calc.cos(d * 1deg), 3.5 * calc.sin(d * 1deg), 0))\n    let pts2 = range(0, 365, step: 5).map(d => prj(3 + 2.5 * calc.cos(d * 1deg), 2 + 2.5 * calc.sin(d * 1deg), 5))\n    line(..pts1, stroke: 1pt + rgb("#16a34a"))\n    line(prj(-2,-3,5), prj(7,-3,5), prj(7,6,5), prj(-2,6,5), close: true, fill: rgb("fef08a20"), stroke: 0.5pt + rgb("#ca8a04"))\n    line(..pts2, stroke: 1pt + rgb("#dc2626"))\n    line(prj(0,0,0), prj(3,2,5), stroke: (dash: "dashed", paint: gray))\n    circle(prj(0,0,0), radius: 1pt, fill: black)\n    circle(prj(3,2,5), radius: 1pt, fill: black)\n  })"""' + missing_configs)

with open('scratch/generate_deep_2_circles_3D.py', 'w') as f:
    f.write(code)
