import re

with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Modify genMathStandardTypst signature and usage
old_math_sig = "function genMathStandardTypst({ paper, school, subtitle, hasEssay }) {"
new_math_sig = "function genMathStandardTypst({ paper, school, subtitle, hasEssay, qrCodeStr }) {"
content = content.replace(old_math_sig, new_math_sig)

old_wasm_sig = "function genWasmTypst({ mcq, tf, tln, paper, school, subtitle, hasEssay }) {"
new_wasm_sig = "function genWasmTypst({ mcq, tf, tln, paper, school, subtitle, hasEssay, qrCodeStr }) {"
content = content.replace(old_wasm_sig, new_wasm_sig)

old_math_call = "return genMathStandardTypst({ paper, school, subtitle, hasEssay });"
new_math_call = "return genMathStandardTypst({ paper, school, subtitle, hasEssay, qrCodeStr });"
content = content.replace(old_math_call, new_math_call)

# 2. Inject qrCodeStr into the layout for genMathStandardTypst
old_math_header = """#let empty-box = box(stroke: 0.8pt + black, width: 11pt, height: 11pt)

#align(top + center)[
  #scale(x: 95%, y: 95%, origin: top)[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: -5mm, marker)
      #place(right, dx: 5mm, dy: -5mm, marker)
    ]
    """
new_math_header = """#let empty-box = box(stroke: 0.8pt + black, width: 11pt, height: 11pt)
#let qb = box(width: 1.8pt, height: 1.8pt, fill: black)
#let qw = box(width: 1.8pt, height: 1.8pt, fill: white)

#align(top + center)[
  #scale(x: 95%, y: 95%, origin: top)[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: -5mm, marker)
      #place(right, dx: 5mm, dy: -5mm, marker)
      #place(left, dx: 43mm, dy: 15mm)[
        ${qrCodeStr || ''}
      ]
    ]
    """
content = content.replace(old_math_header, new_math_header)

# Also need to inject into genWasmTypst (which handles a5 and a4 differently)
old_wasm_header = """#let empty-box = box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })

#align(if ${isA5} { center + horizon } else { top + center })[
  #scale(x: if ${isA5} { 88% } else { 95% }, y: if ${isA5} { 88% } else { 95% }, origin: if ${isA5} { center } else { top })[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: -5mm, marker)
      #place(right, dx: 5mm, dy: -5mm, marker)
    ]"""
new_wasm_header = """#let empty-box = box(stroke: 0.8pt + black, width: if ${isA5} { 10pt } else { 11pt }, height: if ${isA5} { 10pt } else { 11pt })
#let qb = box(width: 1.8pt, height: 1.8pt, fill: black)
#let qw = box(width: 1.8pt, height: 1.8pt, fill: white)

#align(if ${isA5} { center + horizon } else { top + center })[
  #scale(x: if ${isA5} { 88% } else { 95% }, y: if ${isA5} { 88% } else { 95% }, origin: if ${isA5} { center } else { top })[
    #block(width: 100%, height: 0pt)[
      #place(left, dx: -5mm, dy: -5mm, marker)
      #place(right, dx: 5mm, dy: -5mm, marker)
      #place(left, dx: if ${isA5} { 35mm } else { 43mm }, dy: 15mm)[
        ${qrCodeStr || ''}
      ]
    ]"""
content = content.replace(old_wasm_header, new_wasm_header)

with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)
