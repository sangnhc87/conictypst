import re

def fix_math(match):
    block = match.group(0)
    
    # 1. Replace \overline{...} -> overline(...)
    block = re.sub(r'\\overline\{([^{}]+)\}', r'overline(\1)', block)
    
    # 2. Remove \left and \right
    block = block.replace(r'\left', '')
    block = block.replace(r'\right', '')
    
    # 3. Strip backslashes from common math commands
    commands = [
        'cap', 'times', 'leftrightarrow', 'in', 'quad', 'equiv', 
        'infty', 'ne', 'subseteq', 'notin', 'rightarrow'
    ]
    for cmd in commands:
        block = block.replace('\\' + cmd, cmd)
        
    # 4. Handle \pmod
    block = block.replace(r'\pmod', 'mod')
    
    # 5. Handle \int_ -> int_
    block = block.replace(r'\int_', 'int_')
    
    return block

def main():
    with open('typst/exams/CD-DaiSo-ToHop-content.typ', 'r', encoding='utf-8') as f:
        content = f.read()
        
    # Find all math blocks $ ... $ and replace LaTeX syntax in them
    new_content = re.sub(r'\$[^$]+\$', fix_math, content)
    
    # Let us also make sure math-sym.typ is imported at the top if it is not already
    if '#import "../math-sym.typ": *' not in new_content:
        # Find first line and insert import after c-indigo or near the beginning
        # Actually, let us just put it at the very top or after c-indigo
        lines = new_content.splitlines()
        insert_idx = 0
        for idx, line in enumerate(lines):
            if 'c-indigo' in line:
                insert_idx = idx + 1
                break
        lines.insert(insert_idx, '\n#import "../math-sym.typ": *\n')
        new_content = '\n'.join(lines)
        
    with open('typst/exams/CD-DaiSo-ToHop-content.typ', 'w', encoding='utf-8') as f:
        f.write(new_content)
    print("LaTeX math conversion complete!")

if __name__ == '__main__':
    main()
