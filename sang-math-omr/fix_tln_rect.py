import re
html = open('index.html', 'r', encoding='utf-8').read()
# Replace `#rect(fill:black,width:8pt,height:8pt)` with `#box(fill:black,width:8pt,height:8pt)`
html = html.replace('#rect(fill:black,width:8pt,height:8pt)', '#box(fill:black,width:8pt,height:8pt)')
# Replace `#rect(width:9pt,height:9pt,stroke:.5pt)[]` with `#box(width:9pt,height:9pt,stroke:.5pt)[]`
html = html.replace('#rect(width:9pt,height:9pt,stroke:.5pt)[]', '#box(width:9pt,height:9pt,stroke:.5pt)[]')
open('index.html', 'w', encoding='utf-8').write(html)
