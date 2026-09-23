import re

def fix(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.read().split('\n')
    for i, line in enumerate(lines):
        if re.match(r'^\s*-\s+(import|columns:|align:|stroke:|fill:|True\(|loigiai: \[|\(|})', line):
            lines[i] = line.replace('- ', '', 1)
        elif line.strip() == '- )' or line.strip() == '- ]' or line.strip() == '- }':
            lines[i] = line.replace('- ', '', 1)
            
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

fix('de03A.typ')
fix('de01A.typ')
fix('de02A.typ')
