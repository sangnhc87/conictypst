import re
html = open('index.html', 'r', encoding='utf-8').read()

# Fix TF
html = html.replace('#grid(columns: (1fr, 16pt, 16pt), row-gutter: 6pt, align: horizon,',
                    '#align(center)[#grid(columns: (12pt, 16pt, 16pt), row-gutter: 6pt, align: horizon,')
html = html.replace('      for (let si = 0; si < 4; si++) {\n        colContent += `  [#align(right)[#text(6pt)[${stmts[si]}]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]],\\n`;\n      }\n      colContent += `)`;',
                    '      for (let si = 0; si < 4; si++) {\n        colContent += `  [#align(right)[#text(6pt)[${stmts[si]}]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]],\\n`;\n      }\n      colContent += `)]`;')

# Check MCQ to make sure it's centered if needed, but 1fr is fine for MCQ to spread bubbles.
# However, if bubbles are spread too much it might look ugly. 
# In Canvas, MCQ bubbles are 7px apart: `xs + 14 + oi*7 + 2.5` - so they are tightly packed!
# In Typst, `1fr` will spread them across the whole column width!
# We should probably fix MCQ too!
# Let's fix MCQ to be centered tight bubbles.
html = html.replace('#grid(columns: (18pt, 1fr, 1fr, 1fr, 1fr), row-gutter: 4pt, align: horizon,',
                    '#align(center)[#grid(columns: (18pt, 14pt, 14pt, 14pt, 14pt), row-gutter: 4pt, align: horizon,')
html = html.replace('      for (let qi = 0; qi < perCol; qi++) {\n        const qnum = ci * perCol + qi + 1;\n        if (qnum <= mcq) {\n          colContent += `  [#align(right)[#text(7pt)[${qnum}.]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]],\\n`;\n        }\n      }\n      colContent += `)`;',
                    '      for (let qi = 0; qi < perCol; qi++) {\n        const qnum = ci * perCol + qi + 1;\n        if (qnum <= mcq) {\n          colContent += `  [#align(right)[#text(7pt)[${qnum}.]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]], [#align(center)[#circle(radius:3.5pt,stroke:.4pt)[]]],\\n`;\n        }\n      }\n      colContent += `)]`;')

open('index.html', 'w', encoding='utf-8').write(html)
