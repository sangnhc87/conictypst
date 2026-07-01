import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r", encoding="utf-8") as f:
    content = f.read()

# For lt-tn
pattern_tn = r"""      grid\(
        columns: \(auto, 1fr, auto\),
        align: \(left \+ horizon, left \+ horizon, right \+ horizon\),
        box\(fill: s\.accent, inset: \(x: 10pt, y: 6pt\), radius: 4pt\)\[
          #text\(weight: "bold", fill: white, size: s\.base \* 0\.72\)\[Câu #q-n\]
        \],
        h\(8pt\) \+ text\(size: s\.base \* 0\.85, fill: s\.fg\)\[#stem\],
        if de-tag != none \{ de-tag \} else \{ \[\] \},
      \)"""
repl_tn = """      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: s.accent, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]"""
content = re.sub(pattern_tn, repl_tn, content)

# For lt-ds
pattern_ds = r"""      grid\(
        columns: \(auto, 1fr, auto\),
        align: \(left \+ horizon, left \+ horizon, right \+ horizon\),
        box\(fill: lec-palette\.violet, inset: \(x: 10pt, y: 6pt\), radius: 4pt\)\[
          #text\(weight: "bold", fill: white, size: s\.base \* 0\.72\)\[Câu #q-n — Đúng/Sai\]
        \],
        h\(8pt\) \+ text\(size: s\.base \* 0\.82, fill: s\.fg\)\[#stem\],
        if de-tag != none \{ de-tag \} else \{ \[\] \},
      \)"""
repl_ds = """      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: lec-palette.violet, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n — Đúng/Sai]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]"""
content = re.sub(pattern_ds, repl_ds, content)

# For lt-tln
pattern_tln = r"""      grid\(
        columns: \(auto, 1fr, auto\),
        align: \(left \+ horizon, left \+ horizon, right \+ horizon\),
        box\(fill: lec-palette\.cyan, inset: \(x: 10pt, y: 6pt\), radius: 4pt\)\[
          #text\(weight: "bold", fill: white, size: s\.base \* 0\.72\)\[Câu #q-n — Tự luận ngắn\]
        \],
        h\(8pt\) \+ text\(size: s\.base \* 0\.85, fill: s\.fg\)\[#stem\],
        if de-tag != none \{ de-tag \} else \{ \[\] \},
      \)"""
repl_tln = """      grid(
        columns: (auto, 1fr),
        align: (left + horizon, right + horizon),
        box(fill: lec-palette.cyan, inset: (x: 12pt, y: 8pt), radius: 4pt)[
          #text(weight: "bold", fill: white, size: s.base * 0.85)[Câu #q-n — Tự luận ngắn]
        ],
        if de-tag != none { de-tag } else { [] },
      )
      v(0.6em)
      text(size: s.base * 1.0, fill: s.fg, weight: "medium")[#stem]"""
content = re.sub(pattern_tln, repl_tln, content)

with open("typst/giao-an/modules/lecture-beamer.typ", "w", encoding="utf-8") as f:
    f.write(content)

print("Replaced!")
