#set page(width: 300pt, height: 100pt, margin: 10pt)

#let option-label(label, style: "circle") = {
  if style == "circle" {
    box(stroke: 1pt, radius: 50%, width: 1.35em, height: 1.35em, align(center + horizon)[#label])
  } else if style == "calligraphy" {
    let calli-font = ("Apple Chancery", "cursive")
    // box shifted up using baseline: -0.1em
    box(width: 1.45em, height: 1.45em, baseline: -0.1em, align(center + horizon)[
      #text(font: calli-font, size: 1.4em, weight: "bold", fill: red)[#label.]
    ])
  } else if style == "calligraphy2" {
    let calli-font = ("Apple Chancery", "cursive")
    // using move on the whole box
    move(dy: -0.15em)[#box(width: 1.45em, height: 1.45em, align(center + horizon)[
      #text(font: calli-font, size: 1.4em, weight: "bold", fill: blue)[#label.]
    ])]
  } else if style == "vietnam-star" {
    move(dy: -0.15em)[#box(width: 1.45em, height: 1.45em, fill: rgb("da251d"), radius: 50%)[
      #place(polygon(fill: rgb("ffce00"), stroke: none, (50%, 5%), (61%, 38%), (95%, 38%), (68%, 59%), (79%, 95%), (50%, 73%), (21%, 95%), (32%, 59%), (5%, 38%), (39%, 38%)))
      #align(center + horizon)[
        #move(dy: 0.05em)[#text(size: 0.65em, weight: "bold", fill: rgb("da251d"))[#label.]]
      ]
    ]]
  }
}

Test text #option-label("A", style: "circle") baseline #option-label("B", style: "calligraphy") test #option-label("C", style: "calligraphy2") test #option-label("D", style: "vietnam-star")
