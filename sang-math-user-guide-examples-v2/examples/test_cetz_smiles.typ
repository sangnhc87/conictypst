#import "@preview/cetz:0.5.2"
#import "@preview/typed-smiles:0.6.0": smiles-cetz

#cetz.canvas({
  import cetz.draw: *
  line((0,0), (6,0))
  smiles-cetz("CC")
})
