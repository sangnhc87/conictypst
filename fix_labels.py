import re

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

# Replace _sol label
sol_pattern = r'  let sol-block = block\([\s\S]*?radius: \(right: 4pt\),\s*\)\[\s*#if should-hl \{ label\("hl-sol-" \+ str\(hl-id\)\) \}'
sol_repl = r'''  let sol-block = [
    #if should-hl { block(breakable: false, spacing: 0pt)[#metadata(hl-id)#label("hl-sol-" + str(hl-id))] }
    #block(
    width: 100%,
    fill: palette.sol-bg,
    stroke: (left: 3pt + a),
    inset: (left: 10pt, right: 8pt, top: 5pt, bottom: 6pt),
    radius: (right: 4pt),
  )['''
content = re.sub(sol_pattern, sol_repl, content)

# Replace mcq, tf, tln labels
q_pattern = r'    #_question-frame\(\s*\[\s*#if _should-hl and mode == "dethi" and _hl-id != none \{\s*metadata\(_hl-id\)\s*label\("hl-q-" \+ str\(_hl-id\)\)\s*\}'
q_repl = r'''    #if _should-hl and mode == "dethi" and _hl-id != none {
      block(breakable: false, spacing: 0pt)[#metadata(_hl-id)#label("hl-q-" + str(_hl-id))]
    }
    #_question-frame(
      ['''
content = re.sub(q_pattern, q_repl, content)

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)
