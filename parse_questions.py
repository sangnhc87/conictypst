import os
import re

files = [
    ("Đề 1", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri.typ"),
    ("Đề 2", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-de-2.typ"),
    ("Đề 3", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-de-3.typ"),
    ("Đề 4", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-toan-thuc-te.typ")
]

all_questions = []

for de_name, filepath in files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We need to extract #tn(...), #ds(...), #tln(...)
    # A simple regex might not work well because of nested brackets.
    # We will write a simple bracket matcher.
    
    idx = 0
    while idx < len(content):
        match = re.search(r'#(tn|ds|tln)\s*\(', content[idx:])
        if not match:
            break
        
        start_idx = idx + match.start()
        macro_type = match.group(1)
        
        # Find the matching closing parenthesis
        open_parens = 0
        in_string = False
        escape = False
        end_idx = -1
        
        for i in range(start_idx + len(match.group(0)) - 1, len(content)):
            char = content[i]
            if not in_string:
                if char == '(':
                    open_parens += 1
                elif char == ')':
                    open_parens -= 1
                    if open_parens == 0:
                        end_idx = i
                        break
                elif char == '"':
                    in_string = True
            else:
                if escape:
                    escape = False
                elif char == '\\':
                    escape = True
                elif char == '"':
                    in_string = False
                    
        if end_idx != -1:
            q_content = content[start_idx:end_idx+1]
            # Replace #tn( with #lt-tn(de: "Đề X", 
            q_content = re.sub(rf'^#{macro_type}\s*\(', f'#lt-{macro_type}(de: "{de_name}", ', q_content)
            all_questions.append(q_content)
            idx = end_idx + 1
        else:
            idx += len(match.group(0))

with open('typst/beamer/extracted_questions.typ', 'w', encoding='utf-8') as f:
    for q in all_questions:
        f.write(q + "\n\n")

print(f"Extracted {len(all_questions)} questions.")
