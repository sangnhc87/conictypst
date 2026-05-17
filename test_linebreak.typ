#let test(layout) = {
  if layout == "4x1" {
    [ #linebreak() ]
  } else if layout == "2x2" {
    [ 2 ]
  } else {
    [ 3 ]
  }
}
#test("4x1")
