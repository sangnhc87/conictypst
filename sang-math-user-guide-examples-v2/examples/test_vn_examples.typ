#import "@preview/typsium:0.3.2": ce
#import "@preview/typed-smiles:0.6.0": smiles, reaction, rxn-arrow, mol, arrow, lp, atom
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import "@preview/cetz:0.5.2"

// 1. Sơ đồ khối công nghiệp
#diagram(
  node-stroke: 1pt,
  node-fill: rgb("#e2e8f0"),
  node-corner-radius: 2pt,
  node((0,0), ce("S"), width: 1.5cm, name: <n1>),
  node((1.5,0), ce("SO2"), width: 1.5cm, name: <n2>),
  node((3,0), ce("SO3"), width: 1.5cm, name: <n3>),
  node((4.5,0), ce("H2SO4"), width: 1.5cm, name: <n4>),
  edge(<n1>, <n2>, "->", label: ce("+ O2, t^o")),
  edge(<n2>, <n3>, "->", label: ce("+ O2, V2O5")),
  edge(<n3>, <n4>, "->", label: ce("+ H2O"))
)

// 2. Đồ thị chuẩn độ
#cetz.canvas({
  import cetz.draw: *
  line((0,0), (5,0), name: "x", mark: (end: ">"))
  line((0,0), (0,4), name: "y", mark: (end: ">"))
  content((5.2, -0.2), text(size: 8pt)[V (mL)])
  content((-0.2, 4.2), text(size: 8pt)[pH])
  bezier((0, 0.5), (4, 3.5), (2.5, 0.5), (2.5, 3.5), stroke: 1.5pt + red)
})
