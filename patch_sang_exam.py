import re

with open('typst/sang-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Update mcq signature to include opt-style
sig_old = """  opt-fig-cols: 2,
  lines: 0,"""
sig_new = """  opt-fig-cols: 2,
  opt-style: "plain",
  lines: 0,"""
text = text.replace(sig_old, sig_new)

# 2. Update mk_opt logic in mcq
# Search for:
#   let mk_opt(idx, txt, is_correct) = {
#     let lbl = text(weight: "bold")[#labels.at(idx).]
#     if vis-ans and is_correct {
#       text(fill: palette.correct)[#lbl #txt]
#     } else {
#       [#lbl #txt]
#     }
#   }
mk_opt_old = """  let mk_opt(idx, txt, is_correct) = {
    let lbl = text(weight: "bold")[#labels.at(idx).]
    if vis-ans and is_correct {
      text(fill: palette.correct)[#lbl #txt]
    } else {
      [#lbl #txt]
    }
  }"""
mk_opt_new = """  let circles = ("Ⓐ", "Ⓑ", "Ⓒ", "Ⓓ", "Ⓔ", "Ⓕ")
  let mk_opt(idx, txt, is_correct) = {
    let lbl = if opt-style == "circle" {
      text(weight: "bold")[#circles.at(idx)]
    } else {
      text(weight: "bold")[#labels.at(idx).]
    }
    
    let gap = if opt-style == "circle" { h(0.2em) } else { " " }
    
    if vis-ans and is_correct {
      text(fill: palette.correct)[#lbl#gap#txt]
    } else {
      [#lbl#gap#txt]
    }
  }"""
text = text.replace(mk_opt_old, mk_opt_new)

# 3. Update tf signature to include ds-style
tf_sig_old = """  fig-width: 30%,
  lines: 0,"""
tf_sig_new = """  fig-width: 30%,
  ds-style: "table",
  lines: 0,"""
text = text.replace(tf_sig_old, tf_sig_new)

# 4. Update tf table rendering logic
tf_logic_old = """  // Xây dựng bảng
  let rows = statements
    .enumerate()
    .map(((i, s)) => {
      let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
      let txt = if type(s) == dictionary { s.body } else { s }
      let md = if vis-ans and ok { text(fill: palette.correct, weight: "bold")[✓] } else { none }
      let ms = if vis-ans and not ok { text(fill: palette.wrong, weight: "bold")[✓] } else { none }
      let fd = if vis-ans and ok { palette.correct.lighten(80%) } else { white }
      let fs = if vis-ans and not ok { palette.wrong.lighten(85%) } else { white }
      (
        pad(x: 6pt, y: 4pt)[#text(weight: "bold")[#alpha.at(i))] #h(3pt) #txt],
        align(center + horizon)[
          #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fd, align(center + horizon)[#md])
        ],
        align(center + horizon)[
          #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fs, align(center + horizon)[#ms])
        ],
      )
    })
    .flatten()

  let table-content = table(
    columns: (1fr, 3em, 3em),
    stroke: (x, y) => if x > 0 {
      0.6pt + palette.border
    } else {
      0pt
    },
    align: (left, center, center),
    fill: (x, y) => if y == 0 and x > 0 {
      palette.border.lighten(80%)
    } else {
      none
    },
    // Header
    [],
    [#text(weight: "bold")[Đ]],
    [#text(weight: "bold")[S]],
    // Body
    ..rows
  )"""

tf_logic_new = """  // Xây dựng bảng hoặc danh sách
  let table-content = none
  if ds-style == "table" {
    let rows = statements
      .enumerate()
      .map(((i, s)) => {
        let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
        let txt = if type(s) == dictionary { s.body } else { s }
        let md = if vis-ans and ok { text(fill: palette.correct, weight: "bold")[✓] } else { none }
        let ms = if vis-ans and not ok { text(fill: palette.wrong, weight: "bold")[✓] } else { none }
        let fd = if vis-ans and ok { palette.correct.lighten(80%) } else { white }
        let fs = if vis-ans and not ok { palette.wrong.lighten(85%) } else { white }
        (
          pad(x: 6pt, y: 4pt)[#text(weight: "bold")[#alpha.at(i))] #h(3pt) #txt],
          align(center + horizon)[
            #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fd, align(center + horizon)[#md])
          ],
          align(center + horizon)[
            #box(width: 1.8em, height: 1.8em, stroke: 0.6pt + palette.border, fill: fs, align(center + horizon)[#ms])
          ],
        )
      })
      .flatten()

    table-content = table(
      columns: (1fr, 3em, 3em),
      stroke: (x, y) => if x > 0 {
        0.6pt + palette.border
      } else {
        0pt
      },
      align: (left, center, center),
      fill: (x, y) => if y == 0 and x > 0 {
        palette.border.lighten(80%)
      } else {
        none
      },
      // Header
      [],
      [#text(weight: "bold")[Đ]],
      [#text(weight: "bold")[S]],
      // Body
      ..rows
    )
  } else {
    // List style
    let items = statements
      .enumerate()
      .map(((i, s)) => {
        let ok = if type(s) == dictionary { s.at("correct", default: false) } else { false }
        let txt = if type(s) == dictionary { s.body } else { s }
        let md = if vis-ans and ok { text(fill: palette.correct, weight: "bold")[[ĐÚNG]] } else { none }
        let ms = if vis-ans and not ok { text(fill: palette.wrong, weight: "bold")[[SAI]] } else { none }
        
        let marker = text(weight: "bold")[#alpha.at(i))]
        if vis-ans {
           [#marker #txt #h(1fr) #md#ms]
        } else {
           [#marker #txt]
        }
      })
    table-content = box(width: 100%, stack(dir: ttb, spacing: 1em, ..items))
  }"""
text = text.replace(tf_logic_old, tf_logic_new)

with open('typst/sang-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

print("Patched sang-exam.typ")
