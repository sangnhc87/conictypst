import re

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "r", encoding="utf-8") as f:
    content = f.read()

old_cetz = r"""#cetz.canvas\(\{
      import cetz.draw: \*
      line\(\(-1,0\), \(5,0\), mark: \(end: ">"\), name: "x"\)
      line\(\(0,-1\), \(0,4\), mark: \(end: ">"\), name: "y"\)
      bezier\(\(0,1\), \(4,3\), \(1,4\), \(3,-1\), stroke: 1\.5pt \+ blue\)
      
      content\(\(1\.3, 3\.2\), text\(fill: red, weight: "bold"\)\[Điểm Cực Đại\]\)
      line\(\(1, 2\.5\), \(2, 2\.5\), stroke: red\) // tangent 
      circle\(\(1\.5, 2\.5\), radius: 0\.05, fill: red\)
      
      content\(\(3\.5, 0\.4\), text\(fill: rgb\("#059669"\), weight: "bold"\)\[Điểm Cực Tiểu\]\)
      line\(\(2\.8, 0\.7\), \(3\.8, 0\.7\), stroke: rgb\("#059669"\)\) // tangent 
      circle\(\(3\.3, 0\.7\), radius: 0\.05, fill: rgb\("#059669"\)\)
    \}\)"""

new_cetz = """#cetz.canvas({
      import cetz.draw: *
      import cetz.plot
      
      plot.plot(size: (5, 4), x-tick-step: none, y-tick-step: none, axis-style: "school-book", {
        plot.add(domain: 0..4.2, x => x*x*x/3 - 2*x*x + 3*x + 1, style: (stroke: 1.5pt + blue))
        
        // Điểm Cực Đại tại x = 1, y = 7/3 = 2.333
        plot.add-anchor("max", (1, 2.333))
        
        // Điểm Cực Tiểu tại x = 3, y = 1
        plot.add-anchor("min", (3, 1))
      })
      
      // Điểm Cực Đại
      content("plot.max", anchor: "bottom", padding: 0.2, text(fill: red, weight: "bold")[Điểm Cực Đại])
      line((rel: (-0.5, 0), to: "plot.max"), (rel: (0.5, 0), to: "plot.max"), stroke: 1.5pt + red)
      circle("plot.max", radius: 0.05, fill: red)
      
      // Điểm Cực Tiểu
      content("plot.min", anchor: "top", padding: 0.2, text(fill: rgb("#059669"), weight: "bold")[Điểm Cực Tiểu])
      line((rel: (-0.5, 0), to: "plot.min"), (rel: (0.5, 0), to: "plot.min"), stroke: 1.5pt + rgb("#059669"))
      circle("plot.min", radius: 0.05, fill: rgb("#059669"))
    })"""

content = re.sub(old_cetz, new_cetz, content)

with open("typst/beamer/beamer-12-bai-1-tinh-on-dieu-cuc-tri.typ", "w", encoding="utf-8") as f:
    f.write(content)
