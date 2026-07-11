#let mStr = "12"
#align(center)[#grid(columns:(1fr,)*3, row-gutter:2pt, align:center, ..range(3).map(i => [#rect(width:10pt,height:10pt,stroke:.6pt)[#text(8pt)[#if i < mStr.len() { mStr.at(i) }]]]))]

#align(center)[#grid(columns:(1fr,)*3, row-gutter:3pt, align:center, ..range(10).map(r => range(3).map(c => if c < mStr.len() and mStr.at(c) == str(r) { [#circle(radius:4pt,stroke:.4pt,fill:black)[]] } else { [#circle(radius:4pt,stroke:.4pt)[]] } )).flatten())]
