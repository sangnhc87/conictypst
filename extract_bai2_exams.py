import re
import os

files_to_process = [
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de1.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de2.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de3.typ",
    "typst/sach/DECUONG12-HK1/chuong-01/bai02-de4.typ",
]

beamer_file = "typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ"

# Regex for questions
ex_pattern = r'#ex\(\s*\[(.*?)\],\s*(?:\[(.*?)\]\s*,\s*\[(.*?)\]\s*,\s*\[(.*?)\]\s*,\s*\[(.*?)\]|True|False)\s*\)'
tf_pattern = r'#ex\(\s*\[(.*?)\],\s*True\s*\)'
short_pattern = r'#ex\(\s*\[(.*?)\],\s*False\s*\)'

all_questions = []

for file_path in files_to_process:
    if not os.path.exists(file_path):
        continue
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split by #ex
    parts = re.split(r'(?=#ex\()', content)
    for part in parts:
        if part.strip().startswith('#ex('):
            # Try to match the different types
            # Note: We need a better parser since there can be nested brackets.
            # Using a simple bracket matching logic.
            pass

def parse_ex(text):
    if not text.startswith('#ex('):
        return None
    # Find matching closing parenthesis for #ex
    depth = 0
    in_str = False
    idx = 0
    for i in range(len(text)):
        if text[i] == '"' and text[i-1] != '\\':
            in_str = not in_str
        if not in_str:
            if text[i] == '(':
                depth += 1
            elif text[i] == ')':
                depth -= 1
                if depth == 0:
                    idx = i
                    break
    if depth != 0:
        return None
        
    ex_body = text[4:idx]
    
    # Extract arguments which are typically [Question], [A], [B], [C], [D]
    # We will use bracket matching to find the arguments
    args = []
    depth = 0
    start = -1
    for i in range(len(ex_body)):
        if ex_body[i] == '[':
            if depth == 0:
                start = i + 1
            depth += 1
        elif ex_body[i] == ']':
            depth -= 1
            if depth == 0:
                args.append(ex_body[start:i])
    
    # Check if True or False (TF or Short)
    if 'True' in ex_body[start:] if start != -1 else 'True' in ex_body:
        return {'type': 'TF', 'question': args[0]}
    elif 'False' in ex_body[start:] if start != -1 else 'False' in ex_body:
        return {'type': 'Short', 'question': args[0]}
    elif len(args) >= 5:
        return {'type': 'MC', 'question': args[0], 'options': args[1:5]}
    
    return None


questions = []
for file_path in files_to_process:
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    parts = re.split(r'(?=#ex\()', content)
    for part in parts:
        part = part.strip()
        if part.startswith('#ex('):
            parsed = parse_ex(part)
            if parsed:
                questions.append((file_path, parsed))

print(f"Found {len(questions)} questions")

# Generate beamer string
beamer_out = ""
current_file = ""

for file_path, q in questions:
    if file_path != current_file:
        beamer_out += f"\n// From {file_path}\n"
        current_file = file_path
    
    if q['type'] == 'MC':
        beamer_out += f"#lt-tn([\n  {q['question'].strip()}\n], [\n  {q['options'][0].strip()}\n], [\n  {q['options'][1].strip()}\n], [\n  {q['options'][2].strip()}\n], [\n  {q['options'][3].strip()}\n])\n\n"
    elif q['type'] == 'TF':
        beamer_out += f"#lt-ds([\n  {q['question'].strip()}\n])\n\n"
    elif q['type'] == 'Short':
        beamer_out += f"#lt-tln([\n  {q['question'].strip()}\n])\n\n"

with open(beamer_file, 'a', encoding='utf-8') as f:
    f.write(beamer_out)

