import re

with open("typst/giao-an/modules/lecture-beamer.typ", "r") as f:
    content = f.read()

# Extract lt-tn
match = re.search(r'(#let lt-tn\(stem, options.*?^})\n', content, re.MULTILINE | re.DOTALL)
if match:
    lt_tn_code = match.group(1)
    
    # Fix the correct answer background
    lt_tn_code = lt_tn_code.replace(
        'fill: if ok { lec-palette.emerald.lighten(85%) } else { s.card }',
        'fill: if ok { pm-colors.correct.transparentize(80%) } else { s.card.transparentize(50%) }'
    )
    # Fix the solution box background
    lt_tn_code = lt_tn_code.replace(
        'fill: lec-palette.sol-fill',
        'fill: pm-colors.correct.transparentize(85%)'
    )
    # Fix the solution box stroke
    lt_tn_code = lt_tn_code.replace(
        'stroke: (left: 3pt + lec-palette.emerald)',
        'stroke: (left: 3pt + pm-colors.correct)'
    )
    # Fix correct answer label background
    lt_tn_code = lt_tn_code.replace(
        'fill: if ok { lec-palette.emerald } else { s.accent }',
        'fill: if ok { pm-colors.correct } else { s.accent }'
    )
    # Fix correct answer border
    lt_tn_code = lt_tn_code.replace(
        'stroke: if ok { 1.5pt + lec-palette.emerald } else { 0.8pt + s.accent.lighten(30%) }',
        'stroke: if ok { 1.5pt + pm-colors.correct } else { 0.5pt + s.accent.transparentize(50%) }'
    )
    # Give the option card a glassmorphic border for the dark theme
    lt_tn_code = lt_tn_code.replace(
        'radius: 7pt',
        'radius: 7pt'
    )
    
    with open("typst/giao-an/modules/lecture-beamer-premium-v2.typ", "a") as out_f:
        out_f.write("\n// Ghi đè lt-tn cho Premium\n")
        out_f.write(lt_tn_code)
        out_f.write("\n")
else:
    print("Could not find lt-tn!")
