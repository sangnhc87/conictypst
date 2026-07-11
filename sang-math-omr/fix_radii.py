import re
html = open('index.html', 'r', encoding='utf-8').read()
html = html.replace('circle(radius:3.5pt', 'circle(radius:5pt')
html = html.replace('circle(radius:2.5pt', 'circle(radius:4pt')
open('index.html', 'w', encoding='utf-8').write(html)
