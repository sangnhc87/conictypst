import re

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    out = []
    i = 0
    while i < len(content):
        idx = content.find('loigiai: [', i)
        if idx == -1:
            out.append(content[i:])
            break
        
        # append everything up to 'loigiai: [\n'
        start_bracket = idx + len('loigiai: ')
        out.append(content[i:start_bracket+1])
        
        # find matching bracket
        depth = 1
        j = start_bracket + 1
        while j < len(content) and depth > 0:
            if content[j] == '[':
                depth += 1
            elif content[j] == ']':
                depth -= 1
            j += 1
            
        end_bracket = j - 1
        
        inner_content = content[start_bracket+1:end_bracket]
        lines = inner_content.split('\n')
        new_lines = []
        for line in lines:
            s = line.strip()
            if s and not s.startswith('-') and not s.startswith('+'):
                # Add '-' with same indentation as original, maybe 2 spaces more than loigiai
                indent = len(line) - len(line.lstrip())
                new_line = ' ' * indent + '- ' + s
                new_lines.append(new_line)
            else:
                new_lines.append(line)
                
        out.append('\n'.join(new_lines))
        out.append(']')
        i = end_bracket + 1
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write("".join(out))

process_file('de01A.typ')
process_file('de02A.typ')
