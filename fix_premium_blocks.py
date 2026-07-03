import re

content = open("typst/giao-an/modules/lecture-beamer-premium-v2.typ").read()

# Replace _glass-block
new_glass_block = """#let _glass-block(title, title-color, body, text-scale: 0.85em) = context {
  let s = _lec-style.get()
  block(
    width: 100%,
    fill: pm-colors.card.transparentize(20%),
    stroke: 0.5pt + title-color.transparentize(40%),
    radius: 8pt,
    inset: 12pt,
    outset: 0pt,
    breakable: false,
  )[
    #if title != none {
      block(below: 12pt)[
        #text(fill: title-color, weight: "bold", size: 1.1em)[#title]
      ]
    }
    #set text(fill: pm-colors.fg, size: text-scale)
    #body
  ]
}

// Ghi đè các macro để KHÔNG LÀM MẤT SỐ THỨ TỰ và GIỮ SIZE CHỮ CHUẨN
#let lt-definition(title: none, kind: "ĐỊNH NGHĨA", numbered: true, body) = {
  if numbered { _lec-def-cnt.step() }
  context {
    let n = if numbered { " " + _lec-def-cnt.display() } else { "" }
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([📐 #kind#n#ttl], pm-colors.accent, body, text-scale: 0.85em)
  }
}

#let lt-theorem(title: none, kind: "ĐỊNH LÝ", numbered: true, body) = {
  if numbered { _lec-thm-cnt.step() }
  context {
    let n = if numbered { " " + _lec-thm-cnt.display() } else { "" }
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([⚡ #kind#n#ttl], pm-colors.gold, body, text-scale: 0.85em)
  }
}

#let lt-corollary(title: none, body) = lt-theorem(title: title, kind: "HỆ QUẢ", numbered: false, body)

#let lt-rule(title: none, num: "", body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([📌 QUY TẮC #num#ttl], pm-colors.gold, body, text-scale: 0.85em)
}

#let lt-example(title: none, body) = {
  _lec-ex-cnt.step()
  context {
    let n = _lec-ex-cnt.display()
    let ttl = if title != none { " — " + title } else { "" }
    _glass-block([📝 VÍ DỤ #n#ttl], pm-colors.accent, body, text-scale: 0.85em)
  }
}

#let lt-note(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([💡 CHÚ Ý#ttl], pm-colors.wrong, body, text-scale: 0.85em)
}

#let lt-history(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([🔍 GÓC LỊCH SỬ#ttl], pm-colors.correct, body, text-scale: 0.85em)
}

#let lt-solution(title: none, body) = {
  let ttl = if title != none { " — " + title } else { "" }
  _glass-block([✅ LỜI GIẢI#ttl], pm-colors.correct, body, text-scale: 0.75em)
}

#let step(title) = { v(0.3em); text(fill: pm-colors.gold, weight: "bold")[👉 #title]; v(0.2em) }
"""

# Replace the block from _glass-block to lt-solution
content = re.sub(
  r'#let _glass-block.*?#let lt-solution.*?\n',
  new_glass_block,
  content,
  flags=re.DOTALL
)

with open("typst/giao-an/modules/lecture-beamer-premium-v2.typ", "w") as f:
    f.write(content)
