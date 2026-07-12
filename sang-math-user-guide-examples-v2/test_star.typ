#set page(width: 200pt, height: 100pt, margin: 10pt)

#let option-label(label, col, style: "vietnam-star") = {
  if style == "vietnam-star" {
    box(width: 1.45em, height: 1.45em, fill: rgb("da251d"), radius: 50%)[
      #place(
        polygon(
          fill: rgb("ffce00"),
          stroke: none,
          (50%, 5%), (61%, 38%), (95%, 38%), (68%, 59%), (79%, 95%), (50%, 73%), (21%, 95%), (32%, 59%), (5%, 38%), (39%, 38%)
        )
      )
      #place(center + horizon)[
        #text(size: 0.7em, weight: "bold", fill: rgb("da251d"))[#label]
      ]
    ]
  } else if style == "calligraphy" {
    let calli-font = ("Dancing Script", "Pacifico", "Apple Chancery", "Brush Script MT", "cursive")
    box(width: 1.35em, height: 1.35em)[
      #place(center + horizon)[
        #text(font: calli-font, size: 1.25em, weight: "bold", fill: col)[#label.]
      ]
    ]
  }
}

#option-label("A", blue, style: "vietnam-star")
#option-label("B", blue, style: "vietnam-star")
#option-label("C", blue, style: "vietnam-star")
#option-label("D", blue, style: "vietnam-star")

#option-label("A", blue, style: "calligraphy")
#option-label("B", blue, style: "calligraphy")
#option-label("C", blue, style: "calligraphy")
#option-label("D", blue, style: "calligraphy")
