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
      #align(center + horizon)[
        #text(size: 0.65em, weight: "bold", fill: rgb("da251d"))[#label]
      ]
    ]
  } else if style == "calligraphy" {
    let calli-font = ("Apple Chancery", "cursive")
    box(width: 1.45em, height: 1.45em, align(center + horizon)[
      #text(font: calli-font, size: 1.4em, weight: "bold", fill: col)[#label]
    ])
  }
}

#option-label("A", blue, style: "vietnam-star")
#option-label("B", blue, style: "vietnam-star")

#option-label("A", blue, style: "calligraphy")
#option-label("B", blue, style: "calligraphy")
