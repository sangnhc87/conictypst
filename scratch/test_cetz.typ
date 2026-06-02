#import "@preview/cetz:0.1.2"

#let prj(x,y,z) = (y - 0.2*x, z - 0.1*x)
#let p1 = prj(-5, -5, 0)
#type(p1)
#type(p1.at(0))
#type(p1.at(1))

