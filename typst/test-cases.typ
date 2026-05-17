#let heva(..args) = math.cases(delim: "{", ..args.pos().map(math.display))
#let a = [$ heva(1/x=-1, 1/y=-3, 1/z=1) $]
#context [
  #(measure(a).height)
]
