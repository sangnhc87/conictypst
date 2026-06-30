with open('CD-DaiSo-ToHop-content.typ', 'r') as f:
    content = f.read()

diagram1 = """
#v(0.5em)
#align(center)[
  #cetz.canvas(length: 1.5cm, {
    import cetz.draw: *
    // 3 Envelopes (Destination 1, 2, 3)
    let env_color = rgb("E3F2FD")
    let env_stroke = 1.2pt + rgb("1565C0")
    for i in range(3) {
      rect((i*2, 0), (i*2 + 1.2, 0.8), fill: env_color, stroke: env_stroke, radius: 2pt)
      content((i*2 + 0.6, 0.4), text(size: 14pt, weight: "bold", fill: rgb("1565C0"))[#str(i+1)])
      content((i*2 + 0.6, -0.4), text(size: 10pt)[Vị trí đúng])
    }
    
    // 3 Letters (Elements 1, 2, 3) going to WRONG envelopes
    // Derangement: 1 -> 2, 2 -> 3, 3 -> 1
    let let_color = rgb("FFF3E0")
    let let_stroke = 1.2pt + rgb("E65100")
    let targets = (1, 2, 0) // 1 goes to 2 (index 1), 2 goes to 3 (index 2), 3 goes to 1 (index 0)
    
    for i in range(3) {
      // Draw letters above
      rect((i*2, 2.5), (i*2 + 1.2, 3.3), fill: let_color, stroke: let_stroke, radius: 2pt)
      content((i*2 + 0.6, 2.9), text(size: 14pt, weight: "bold", fill: rgb("E65100"))[#str(i+1)])
      content((i*2 + 0.6, 3.7), text(size: 10pt)[Thư])
      
      // Draw arrows
      let start_pt = (i*2 + 0.6, 2.4)
      let end_pt = (targets[i]*2 + 0.6, 0.9)
      line(start_pt, end_pt, mark: (end: ">"), stroke: 1.5pt + rgb("E65100"))
    }
  })
]
"""

target1 = r"""Ký hiệu số các hoán vị không điểm bất động của $n$ phần tử là $D_n$ (đôi khi ký hiệu là $!n$, gọi là "giai thừa phụ" - subfactorial)."""

content = content.replace(target1, target1 + "\n" + diagram1)

diagram2 = """
    #v(0.5em)
    #align(center)[
      #cetz.canvas(length: 1.2cm, {
        import cetz.draw: *
        // Bipartite graph: Men (A) and Women (B)
        let c_man = rgb("E3F2FD"); let s_man = 1.2pt + rgb("1565C0")
        let c_wom = rgb("FCE4EC"); let s_wom = 1.2pt + rgb("C2185B")
        
        for i in range(4) {
          // Men nodes (left)
          circle((0, i*1.5), radius: 0.3, fill: c_man, stroke: s_man)
          content((0, i*1.5), text(size: 10pt)[$H_#str(4-i)$])
          
          // Women nodes (right)
          circle((3, i*1.5), radius: 0.3, fill: c_wom, stroke: s_wom)
          content((3, i*1.5), text(size: 10pt)[$W_#str(4-i)$])
        }
        
        // Example derangement pairing: H1-W2, H2-W3, H3-W4, H4-W1
        // Indices in loop: 3->2, 2->1, 1->0, 0->3 (since drawn bottom-up)
        let edges = ((3, 2), (2, 1), (1, 0), (0, 3))
        for e in edges {
          line((0.35, e[0]*1.5), (2.65, e[1]*1.5), stroke: 1.5pt + rgb("757575"))
        }
        
        // Red crossed dashed line showing forbidden H_i -> W_i
        for i in range(4) {
          line((0.35, i*1.5), (2.65, i*1.5), stroke: (paint: rgb("FFCDD2"), thickness: 1pt, dash: "dashed"))
        }
      })
    ]
"""

target2 = r"""Một cách ghép đôi khiêu vũ là một song ánh từ tập $A$ sang tập $B$."""

content = content.replace(target2, target2 + "\n" + diagram2)

with open('CD-DaiSo-ToHop-content.typ', 'w') as f:
    f.write(content)
