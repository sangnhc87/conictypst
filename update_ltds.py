import os
import re

filepath = "typst/giao-an/modules/lecture-beamer.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# We need to replace the entire `lt-ds` function.
# Let's find the start of #let lt-ds
start_idx = content.find("#let lt-ds(stem, statements, loigiai: none, de: \"\", num: auto) = {")
if start_idx == -1:
    print("Could not find lt-ds!")
    exit(1)

# Find the matching closing brace.
# We will just parse it character by character.
brace_count = 0
end_idx = -1
for i in range(start_idx, len(content)):
    if content[i] == '{':
        brace_count += 1
    elif content[i] == '}':
        brace_count -= 1
        if brace_count == 0:
            end_idx = i
            break

if end_idx == -1:
    print("Could not find end of lt-ds!")
    exit(1)

new_lt_ds = """#let lt-ds(stem, statements, loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let alpha = ("a", "b", "c", "d")
      let de-tag = if de != "" {
        box(fill: lec-palette.pink.lighten(70%), stroke: 0.5pt + lec-palette.pink, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.pink, weight: "bold")[#de]
        ]
      } else { none }

      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: lec-palette.pink, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n — Đúng/Sai]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]
      v(0.4em)
      
      for (i, stmt) in statements.enumerate() {
        let content-val = if type(stmt) == dictionary { stmt.at("body", default: stmt) } else { stmt }
        block(below: 8pt)[
          #grid(
            columns: (auto, 1fr),
            column-gutter: 12pt,
            align: (center + top, left + horizon),
            box(
              width: 26pt, height: 26pt,
              fill: s.card,
              stroke: 1pt + s.accent.lighten(40%),
              radius: 13pt,
            )[
              #align(center + horizon)[
                #text(weight: "bold", fill: s.accent, size: s.base * 0.75)[
                  #alpha.at(i)
                ]
              ]
            ],
            text(size: s.base * 0.85, fill: s.fg)[#content-val],
          )
        ]
      }
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        let alpha = ("a", "b", "c", "d")
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.sol-fill,
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI CHI TIẾT & ĐÁP ÁN]
          #v(0.25em)
          
          #grid(
            columns: (auto, auto, auto, auto),
            column-gutter: 16pt,
            ..statements.enumerate().map(((i, stmt)) => {
              let correct-val = if type(stmt) == dictionary { stmt.at("true", default: false) } else { false }
              let lbl = if correct-val { "Đúng" } else { "Sai" }
              let clr = if correct-val { lec-palette.emerald } else { lec-palette.crimson }
              text(weight: "bold", fill: clr, size: s.base * 0.75)[Mệnh đề #alpha.at(i): #lbl]
            })
          )
          #v(0.5em)
          #line(length: 100%, stroke: 0.5pt + lec-palette.emerald.lighten(60%))
          #v(0.5em)
          #set text(size: s.base * 0.75, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}"""

final_content = content[:start_idx] + new_lt_ds + content[end_idx+1:]
with open(filepath, "w", encoding="utf-8") as f:
    f.write(final_content)

print("Replaced lt-ds.")
