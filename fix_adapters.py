import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

start_idx = content.find("// ══════════════════════════════════════════════════════════════════════════\n// ADAPTER CÂU HỎI")
end_idx = content.find("// ══════════════════════════════════════════════════════════════════════════\n// MACRO: lt-axes")

adapters = """// ══════════════════════════════════════════════════════════════════════════
// ADAPTER CÂU HỎI CHO BEAMER
// ══════════════════════════════════════════════════════════════════════════

#let _lec-q-label = counter("lec-q-idx")

#let lt-tn(stem, options, correct: (), loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let labels = ("A", "B", "C", "D", "E", "F")
      let de-tag = if de != "" {
        box(fill: lec-palette.violet.darken(70%), stroke: 0.5pt + lec-palette.violet, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.violet, weight: "bold")[#de]
        ]
      } else { none }
      let correct-set = if type(correct) == array { correct } else { (correct,) }

      grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, left + horizon, right + horizon),
        box(fill: s.accent, inset: (x: 10pt, y: 6pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.72)[Câu #q-n]
        ],
        h(8pt) + text(size: s.base * 0.85, fill: s.fg)[#stem],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.4em)
      grid(
        columns: (1fr, 1fr),
        row-gutter: 8pt, column-gutter: 10pt,
        ..options.enumerate().map(((i, opt)) => {
          let lbl = labels.at(i)
          let ok = correct-set.contains(i + 1)
          block(
            width: 100%,
            fill: if ok { lec-palette.emerald.darken(78%) } else { s.card },
            stroke: if ok { 1.5pt + lec-palette.emerald } else { 0.8pt + s.accent.lighten(30%) },
            inset: (x: 0pt, y: 0pt),
            radius: 7pt,
          )[
            #grid(columns: (auto, 1fr), column-gutter: 0pt)[
              #box(
                fill: if ok { lec-palette.emerald } else { s.accent },
                inset: (x: 10pt, y: 9pt),
                radius: (top-left: 6pt, bottom-left: 6pt),
              )[
                #text(weight: "bold", fill: white, size: s.base * 0.72)[#lbl.]
              ]
            ][
              #pad(x: 10pt, y: 9pt)[
                #text(size: s.base * 0.78, fill: s.fg)[#opt]
              ]
            ]
          ]
        })
      )
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.emerald.darken(82%),
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI]
          #v(0.25em)
          #set text(size: s.base * 0.75, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

#let lt-ds(stem, statements, loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let alpha = ("a", "b", "c", "d")
      let de-tag = if de != "" {
        box(fill: lec-palette.violet.darken(70%), stroke: 0.5pt + lec-palette.violet, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.violet, weight: "bold")[#de]
        ]
      } else { none }

      grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, left + horizon, right + horizon),
        box(fill: lec-palette.violet, inset: (x: 10pt, y: 6pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.72)[Câu #q-n — Đúng/Sai]
        ],
        h(8pt) + text(size: s.base * 0.82, fill: s.fg)[#stem],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.4em)
      for (i, stmt) in statements.enumerate() {
        let correct-val = if type(stmt) == dictionary { stmt.at("correct", default: false) } else { false }
        let content-val = if type(stmt) == dictionary { stmt.at("body", default: stmt) } else { stmt }
        block(below: 6pt)[
          #grid(
            columns: (auto, 1fr),
            column-gutter: 8pt,
            align: (center + top, left + top),
            box(
              width: 28pt, height: 28pt,
              fill: if correct-val { lec-palette.emerald.darken(70%) } else { s.card },
              stroke: if correct-val { 1.2pt + lec-palette.emerald } else { 0.8pt + s.muted },
              radius: 4pt,
            )[
              #align(center + horizon)[
                #text(weight: "bold", fill: if correct-val { lec-palette.emerald } else { s.muted }, size: 9pt)[
                  #alpha.at(i)
                ]
              ]
            ],
            text(size: s.base * 0.78, fill: s.fg)[#content-val],
          )
        ]
      }
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        v(0.2em)
        block(
          width: 100%,
          fill: lec-palette.emerald.darken(82%),
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ GIẢI THÍCH]
          #v(0.2em)
          #set text(size: s.base * 0.75, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

#let lt-tln(stem, answer, loigiai: none, de: "", num: auto) = {
  _lec-q-label.step()
  slide(title: none)[
    #context {
      let s = _lec-style.get()
      let q-n = if num != auto { num } else { _lec-q-label.display() }
      let de-tag = if de != "" {
        box(fill: lec-palette.cyan.darken(70%), stroke: 0.5pt + lec-palette.cyan, inset: (x: 7pt, y: 3pt), radius: 3pt)[
          #text(size: 7pt, fill: lec-palette.cyan, weight: "bold")[#de]
        ]
      } else { none }

      grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, left + horizon, right + horizon),
        box(fill: lec-palette.cyan, inset: (x: 10pt, y: 6pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.72)[Câu #q-n — Tự luận ngắn]
        ],
        h(8pt) + text(size: s.base * 0.85, fill: s.fg)[#stem],
        if de-tag != none { de-tag } else { [] },
      )
    }
    #pause
    #context {
      let s = _lec-style.get()
      v(0.5em)
      align(center)[
        #block(
          fill: lec-palette.amber.darken(82%),
          stroke: 1.5pt + lec-palette.amber,
          inset: (x: 24pt, y: 12pt),
          radius: 8pt,
        )[
          #text(size: s.base * 0.68, fill: lec-palette.amber, weight: "bold")[🎯 ĐÁP ÁN:]
          #h(8pt)
          #text(size: s.base * 1.1, fill: white, weight: "bold")[#answer]
        ]
      ]
    }
    #if loigiai != none {
      pause
      context {
        let s = _lec-style.get()
        v(0.3em)
        block(
          width: 100%,
          fill: lec-palette.emerald.darken(82%),
          stroke: (left: 3pt + lec-palette.emerald),
          inset: (x: 14pt, y: 9pt),
          radius: (right: 5pt),
        )[
          #text(size: s.base * 0.65, fill: lec-palette.emerald, weight: "bold")[✅ LỜI GIẢI]
          #v(0.25em)
          #set text(size: s.base * 0.72, fill: s.fg)
          #loigiai
        ]
      }
    }
  ]
}

"""

content = content[:start_idx] + adapters + content[end_idx:]

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

