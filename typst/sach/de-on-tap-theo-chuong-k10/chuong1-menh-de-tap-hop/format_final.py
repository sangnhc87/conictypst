import re

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.read().split('\n')

    inside = False
    for i in range(len(lines)):
        line = lines[i]
        
        # Check start of loigiai
        if re.search(r'^\s*loigiai:\s*\[\s*$', line):
            inside = True
            continue
            
        if inside:
            # Check end of loigiai
            if re.match(r'^\s*\]\s*$', line):
                inside = False
                continue
            
            s = line.strip()
            # If not empty, and not already a list item or comment or typst block
            if s and not s.startswith('-') and not s.startswith('#') and not s.startswith('//'):
                # Avoid touching tables or cetz or other typst builtins
                if not any(kw in s for kw in ['columns:', 'align:', 'stroke:', 'fill:', 'import', 'cetz', 'line(', 'content(']):
                    indent = len(line) - len(line.lstrip())
                    lines[i] = ' ' * indent + '- ' + s
                    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

process_file('de01A.typ')
process_file('de02A.typ')
