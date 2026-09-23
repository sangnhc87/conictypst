import re

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.read().split('\n')

    inside = False
    for i in range(len(lines)):
        line = lines[i]
        
        if re.search(r'^\s*loigiai:\s*\[\s*$', line):
            inside = True
            continue
            
        if inside:
            if re.match(r'^\s*\]\s*$', line):
                inside = False
                continue
            
            s = line.strip()
            if s and not s.startswith('-') and not s.startswith('#') and not s.startswith('//'):
                if re.match(r'^([a-zA-Z0-9\$ĐÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ]|"|\')', s):
                    # Check for dictionary keys (word followed by colon)
                    if not re.match(r'^[a-zA-Z0-9\-]+:', s):
                        if not any(kw in s for kw in ['columns:', 'align:', 'stroke:', 'fill:', 'import ', 'cetz', 'line(', 'content(']):
                            indent = len(line) - len(line.lstrip())
                            lines[i] = ' ' * indent + '- ' + s
                    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

process_file('de02A.typ')
