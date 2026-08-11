#let my_func(a: 1, ..args) = {
  [a is #a]
}
#let fn = my_func.with(a: 2, b: 3)
#fn()
