#let plain-text(c) = {
  if type(c) == "string" { c }
  else if type(c) == "content" {
    if c.has("text") { c.text }
    else if c.has("body") { plain-text(c.body) }
    else if c.has("children") { c.children.map(plain-text).join("") }
    else { "" }
  } else { "" }
}

#let len = plain-text([Hello *world* $x+1$]).len()
Length: #len
