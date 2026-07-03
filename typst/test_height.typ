#import "@preview/cetz:0.5.2"
#let bbbt_old() = cetz.canvas({
  cetz.draw.rect((0,0), (5, 5))
})
#let bbbt_new() = context {
  let __clr = text.fill
  cetz.canvas({
    cetz.draw.rect((0,0), (5, 5), stroke: __clr)
  })
}

#bbbt_old()
Old above

#bbbt_new()
New above
