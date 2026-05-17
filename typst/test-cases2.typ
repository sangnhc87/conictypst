#import "@preview/cetz:0.5.0"
#let a = [$ cases(1/x=-1, 1/y=-3, 1/z=1) $]
#let b = $ cases(#math.display($1/x=-1$), #math.display($1/y=-3$), #math.display($1/z=1$)) $
#context [
  #(measure(a).height), #(measure(box[#b]).height)
]
