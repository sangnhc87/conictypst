
#let template(body) = {
  show heading.where(level: 1): it => {
    v(1.8em)
    set text(fill: rgb("#0F4C81"), size: 1.3em, weight: "bold")
    it
    v(0.4em)
  }
  body
}

#show: template

= Heading 1
Văn bản thường.
