#let _content-to-str(c) = {
  if type(c) == str {
    c
  } else if type(c) == content and c.has("text") {
    c.text
  } else if type(c) == content and c.has("body") {
    _content-to-str(c.body)
  } else if type(c) == content and c.func() == [].func() {
    c.children.map(_content-to-str).join()
  } else if type(c) == content and c.func() == math.equation {
    _content-to-str(c.body)
  } else {
    ""
  }
}
#panic(_content-to-str([$-14$]))
