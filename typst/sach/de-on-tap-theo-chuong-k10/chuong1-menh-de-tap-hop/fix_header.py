import re

header = """#import "@preview/sang-math:1.0.6": *

#let mode = "loigiai"
#let accent = rgb("0f766e")
#let ma-de = "1234"
#let in-qr-dap-an = true
#show math.cases: math.display
#let (tn, ds, tln, tl) = exam-mode(mode: mode, accent: accent)
"""

def fix_header(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Remove old imports
    content = re.sub(r'#import "\.\./\.\./\.\./\.\./main-template\.typ": \*\n', '', content)
    content = re.sub(r'#import "@preview/cetz:0\.3\.1"\n', '', content)
    content = re.sub(r'#import "@preview/sang-math:1\.0\.6": \*\n', '', content)
    
    # Prepend new header
    content = header + '\n' + content.lstrip()
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

fix_header('de-on-kiem-tra-chuong-1-de-4.typ')
fix_header('de-on-kiem-tra-chuong-1-de-5.typ')
