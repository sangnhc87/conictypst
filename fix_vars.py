import re
import glob
import subprocess

files = glob.glob('typst/giao-an/**/*.typ', recursive=True)

replacements = {
    r'\bcdot\b': 'dot',
    r'\bog\b': 'log',
    r'\bsect\b': 'inter',
    r'\bsetminus\b': 'without',
    r'\bcirc\b': 'degree',
    r'\bABC\b': '"ABC"',
    r'\bOB\b': '"OB"'
}

for f in files:
    if "modules" in f: continue
    
    with open(f, 'r') as file:
        content = file.read()
        
    for k, v in replacements.items():
        content = re.sub(k, v, content)
        
    with open(f, 'w') as file:
        file.write(content)
