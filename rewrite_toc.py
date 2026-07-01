import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

new_toc = """// ── lt-toc: Slide Mục lục có hyperlink đến từng phần ─────────────────────
#let lt-toc(title: "MỤC LỤC BÀI HỌC") = {
  slide(title: none)[
    #[#metadata(none)<#label("lec-toc-main")>]
    #context {
      let s = _lec-style.get()
      let items = _lec-toc.final()
      
      align(center)[
        #block(
          fill: s.accent.lighten(90%),
          stroke: 1.5pt + s.accent,
          inset: (x: 20pt, y: 10pt),
          radius: 8pt,
        )[
          #text(size: s.base * 1.1, fill: s.accent, weight: "bold")[📋 #upper(title)]
        ]
      ]
      v(1.5em)
      
      grid(
        columns: (1fr, 1fr),
        row-gutter: 14pt, column-gutter: 18pt,
        ..items.enumerate().map(((i, item)) => {
          let lbl = item.at("id")
          let ttl = item.at("title")
          let icn = item.at("icon")
          link(label(lbl),
            block(
              width: 100%,
              fill: white,
              stroke: 1pt + s.muted.lighten(60%),
              inset: 0pt,
              radius: 6pt,
            )[
              #grid(
                columns: (auto, 1fr),
                box(
                  fill: s.accent,
                  inset: (x: 12pt, y: 12pt),
                  radius: (top-left: 5pt, bottom-left: 5pt),
                )[
                  #text(fill: white, size: s.base * 0.9, weight: "bold")[#icn]
                ],
                pad(left: 10pt, y: 12pt)[
                  #text(fill: s.fg, size: s.base * 0.85, weight: "bold")[Phần #str(i + 1). #ttl]
                ]
              )
            ]
          )
        })
      )
    }
  ]
}"""

content = re.sub(r'// ── lt-toc: Slide Mục lục có hyperlink đến từng phần ─────────────────────\n#let lt-toc\([\s\S]*?\]\s+\)\s+\}\s+\]\s+\}', new_toc, content)

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

