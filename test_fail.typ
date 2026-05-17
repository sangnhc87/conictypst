#let test(layout) = {
  if layout == "4x1" {
    "1"; [ \ ]; "2"
  } else if layout == "2x2" {
    "3"
  }
}
