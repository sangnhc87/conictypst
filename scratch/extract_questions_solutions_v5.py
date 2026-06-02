import os
import re
import json

exams_dir = "/Users/admin/conictypst/typst/exams"
files = [f for f in os.listdir(exams_dir) if f.endswith(".typ")]

def find_brackets(text, start_pos):
    first_bracket = text.find('[', start_pos)
    if first_bracket == -1:
        return None, start_pos
    
    count = 1
    i = first_bracket + 1
    content = ""
    in_math = False
    in_string = False
    while i < len(text):
        char = text[i]
        
        if char == '"' and text[i-1] != '\\':
            in_string = not in_string
            
        if not in_string:
            if char == '$' and text[i-1] != '\\':
                in_math = not in_math
                
        if not in_math and not in_string:
            if char == '[':
                count += 1
            elif char == ']':
                count -= 1
                if count == 0:
                    return content, i + 1
        content += char
        i += 1
    return None, start_pos

def find_parentheses(text, start_pos):
    first_paren = text.find('(', start_pos)
    if first_paren == -1:
        return None, start_pos
    
    count = 1
    i = first_paren + 1
    content = ""
    in_math = False
    in_string = False
    while i < len(text):
        char = text[i]
        
        if char == '"' and text[i-1] != '\\':
            in_string = not in_string
            
        if not in_string:
            if char == '$' and text[i-1] != '\\':
                in_math = not in_math
                
        if not in_math and not in_string:
            if char == '(':
                count += 1
            elif char == ')':
                count -= 1
                if count == 0:
                    return content, i + 1
        content += char
        i += 1
    return None, start_pos

def extract_choices(text):
    choices = []
    pos = 0
    while True:
        choice, next_pos = find_brackets(text, pos)
        if choice is None:
            break
        choices.append(choice.strip())
        pos = next_pos
    return choices

def extract_raw_block(text, start_idx, box_type):
    pos = start_idx + len(box_type) + 1
    
    i = pos
    while i < len(text) and text[i].isspace():
        i += 1
    
    has_paren = False
    paren_end = i
    if i < len(text) and text[i] == '(':
        count = 1
        j = i + 1
        in_math = False
        in_string = False
        while j < len(text):
            char = text[j]
            if char == '"' and text[j-1] != '\\':
                in_string = not in_string
            if not in_string:
                if char == '$' and text[j-1] != '\\':
                    in_math = not in_math
            if not in_math and not in_string:
                if char == '(':
                    count += 1
                elif char == ')':
                    count -= 1
                    if count == 0:
                        has_paren = True
                        paren_end = j + 1
                        break
            j += 1
            
    search_start = paren_end if has_paren else pos
    i = search_start
    while i < len(text) and text[i].isspace():
        i += 1
        
    has_bracket = False
    bracket_end = i
    if i < len(text) and text[i] == '[':
        count = 1
        j = i + 1
        in_math = False
        in_string = False
        while j < len(text):
            char = text[j]
            if char == '"' and text[j-1] != '\\':
                in_string = not in_string
            if not in_string:
                if char == '$' and text[j-1] != '\\':
                    in_math = not in_math
            if not in_math and not in_string:
                if char == '[':
                    count += 1
                elif char == ']':
                    count -= 1
                    if count == 0:
                        has_bracket = True
                        bracket_end = j + 1
                        break
            j += 1
            
    end_idx = bracket_end if has_bracket else (paren_end if has_paren else pos)
    raw_text = text[start_idx:end_idx]
    return raw_text, end_idx

def extract_solution_boxes_in_range(text, start_pos, end_pos):
    sol_parts = []
    pos = start_pos
    
    valid_boxes = ['cach1-box', 'cach2-box', 'ans-box', 'loigiai-box', 'loigiai', 
                   'ppgiai', 'step', 'reset-step', 'luuy', 'meo', 'callout', 
                   'theory-box', 'insight-box', 'warn-box', 'key-box', 'compare-box', 'sol-diagram']
    
    pattern = re.compile(r"#(" + "|".join(valid_boxes) + r")\b")
    
    while pos < end_pos:
        m = pattern.search(text, pos, end_pos)
        if not m:
            break
            
        box_type = m.group(1)
        box_start = m.start()
        
        raw_text, next_pos = extract_raw_block(text, box_start, box_type)
        if raw_text:
            sol_parts.append({
                "type": box_type,
                "raw_text": raw_text.strip()
            })
            pos = next_pos
        else:
            pos = box_start + len(box_type) + 1
            
    return sol_parts

def extract_problems_with_solutions(filepath):
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    
    problems = []
    
    q_matches = []
    pos = 0
    while True:
        m = re.search(r"#(tln|tn|ds|example-box|eg-box)\b", content[pos:])
        if not m:
            break
        start_idx = pos + m.start()
        q_type = m.group(1)
        q_matches.append((q_type, start_idx))
        pos = start_idx + len(m.group(0))
        
    for idx, (q_type, start_idx) in enumerate(q_matches):
        if len(problems) >= 2:
            break
            
        q_content, next_pos = find_brackets(content, start_idx)
        if q_content is None:
            continue
            
        next_q_pos = q_matches[idx + 1][1] if idx + 1 < len(q_matches) else len(content)
        
        q_clean = q_content.strip()
        ans_content = ""
        sol_parts = []
        
        if q_type == "tln":
            ans_content, next_ans_pos = find_brackets(content, next_pos)
            if ans_content:
                ans_content = ans_content.strip()
            
            loigiai_idx = content.find('loigiai:', next_ans_pos)
            if loigiai_idx != -1 and loigiai_idx < next_q_pos:
                sol_content, _ = find_brackets(content, loigiai_idx)
                if sol_content:
                    sol_parts.append({
                        "type": "loigiai-box",
                        "raw_text": f"#loigiai-box[\n{sol_content.strip()}\n]"
                    })
        elif q_type in ["tn", "ds"]:
            first_paren = content.find('(', next_pos)
            if first_paren != -1 and first_paren < next_q_pos:
                count = 1
                j = first_paren + 1
                paren_inner = ""
                while j < len(content):
                    if content[j] == '(':
                        count += 1
                    elif content[j] == ')':
                        count -= 1
                        if count == 0:
                            break
                    paren_inner += content[j]
                    j += 1
                
                choices = extract_choices(paren_inner)
                ans_content = " / ".join(choices)
                next_ans_pos = j + 1
                
                loigiai_idx = content.find('loigiai:', next_ans_pos)
                if loigiai_idx != -1 and loigiai_idx < next_q_pos:
                    sol_content, _ = find_brackets(content, loigiai_idx)
                    if sol_content:
                        sol_parts.append({
                            "type": "loigiai-box",
                            "raw_text": f"#loigiai-box[\n{sol_content.strip()}\n]"
                        })
        else:
            title = "Ví dụ"
            paren_content, paren_next = find_parentheses(content, start_idx + len(q_type) + 1)
            if paren_content is not None and paren_next <= next_pos:
                title_match = re.search(r'(title|n):\s*"([^"]+)"', paren_content)
                if title_match:
                    title = title_match.group(2)
            
            q_clean = f"*{title}*: {q_clean}"
            sol_parts = extract_solution_boxes_in_range(content, next_pos, next_q_pos)
            
        problems.append({
            "type": q_type,
            "q": q_clean,
            "ans": ans_content,
            "solutions": sol_parts
        })
        
    return problems

results = {}
for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    probs = extract_problems_with_solutions(filepath)
    results[filename] = probs

output_path = "/Users/admin/conictypst/scratch/extracted_questions_solutions_v5.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"Extracted questions and solutions from {len(files)} files. Written to {output_path}")
