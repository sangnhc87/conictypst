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
    while i < len(text):
        if text[i] == '[':
            count += 1
        elif text[i] == ']':
            count -= 1
            if count == 0:
                return content, i + 1
        content += text[i]
        i += 1
    return None, start_pos

def find_parentheses(text, start_pos):
    first_paren = text.find('(', start_pos)
    if first_paren == -1:
        return None, start_pos
    
    count = 1
    i = first_paren + 1
    content = ""
    while i < len(text):
        if text[i] == '(':
            count += 1
        elif text[i] == ')':
            count -= 1
            if count == 0:
                return content, i + 1
        content += text[i]
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

def extract_solution_boxes(text, start_pos):
    # Extract any sequential boxes following a question (up to 1500 chars limit to search)
    sol_parts = []
    pos = start_pos
    limit = start_pos + 1500
    while pos < len(text) and pos < limit:
        # Look for the next '#' symbol within a short distance
        # Skip spaces/newlines
        while pos < len(text) and text[pos].isspace():
            pos += 1
        
        if pos >= len(text) or text[pos] != '#':
            break
            
        # Match box types
        m = re.match(r"#([a-zA-Z0-9\-]+)\b", text[pos:])
        if not m:
            break
            
        box_type = m.group(1)
        # We only care about specific box/helper types
        valid_boxes = ['cach1-box', 'cach2-box', 'ans-box', 'loigiai-box', 'loigiai', 
                       'ppgiai', 'step', 'reset-step', 'luuy', 'meo', 'callout', 
                       'theory-box', 'insight-box', 'warn-box', 'key-box', 'compare-box']
        if box_type not in valid_boxes:
            break
            
        box_start = pos
        # Find the bracketed content of this box
        inner, next_pos = find_brackets(text, box_start)
        if inner is not None:
            sol_parts.append({
                "type": box_type,
                "content": inner.strip()
            })
            pos = next_pos
        else:
            # Maybe it takes arguments in parentheses first, e.g., #compare-box(title: "...") [content]
            # Let's find parenthesis first
            paren_content, paren_next = find_parentheses(text, box_start)
            if paren_content is not None:
                # now find the brackets
                inner, next_pos = find_brackets(text, paren_next)
                if inner is not None:
                    # Include the title if available
                    title_match = re.search(r'title:\s*"([^"]+)"', paren_content)
                    title = title_match.group(1) if title_match else ""
                    sol_parts.append({
                        "type": box_type,
                        "title": title,
                        "content": inner.strip()
                    })
                    pos = next_pos
                else:
                    pos = paren_next
            else:
                pos = box_start + len(m.group(0))
    return sol_parts, pos

def extract_problems_with_solutions(filepath):
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    
    problems = []
    
    # 1. Search for standard exam-mode questions #tln(, #tn(, #ds(
    pos = 0
    while len(problems) < 2:
        m = re.search(r"#(tln|tn|ds)\(", content[pos:])
        if not m:
            break
        
        start_idx = pos + m.start()
        p_type = m.group(1)
        
        q_content, next_pos = find_brackets(content, start_idx)
        if q_content is not None:
            q_clean = q_content.strip()
            ans_content = ""
            sol_parts = []
            
            # Find the next argument (which could be choices or answer key)
            if p_type == "tln":
                ans_content, next_ans_pos = find_brackets(content, next_pos)
                if ans_content:
                    ans_content = ans_content.strip()
                
                # Check for loigiai: [ ... ]
                loigiai_idx = content.find('loigiai:', next_ans_pos)
                if loigiai_idx != -1 and loigiai_idx < next_ans_pos + 100:
                    sol_content, _ = find_brackets(content, loigiai_idx)
                    if sol_content:
                        sol_parts.append({
                            "type": "loigiai",
                            "content": sol_content.strip()
                        })
            elif p_type in ["tn", "ds"]:
                first_paren = content.find('(', next_pos)
                if first_paren != -1 and first_paren < next_pos + 50:
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
                    
                    # Check for loigiai: [ ... ]
                    loigiai_idx = content.find('loigiai:', next_ans_pos)
                    if loigiai_idx != -1 and loigiai_idx < next_ans_pos + 100:
                        sol_content, _ = find_brackets(content, loigiai_idx)
                        if sol_content:
                            sol_parts.append({
                                "type": "loigiai",
                                "content": sol_content.strip()
                            })
            
            problems.append({
                "type": p_type,
                "q": q_clean,
                "ans": ans_content,
                "solutions": sol_parts
            })
            pos = next_pos
        else:
            pos = start_idx + len(m.group(0))
            
    # 2. Try custom example boxes if no standard ones
    if len(problems) == 0:
        pos = 0
        while len(problems) < 2:
            m = re.search(r"#example-box\((n:\s*\"([^\"]+)\")?\s*\)", content[pos:])
            if not m:
                m = re.search(r"#example-box\b", content[pos:])
                if not m:
                    break
                start_idx = pos + m.start()
                title = "Ví dụ"
            else:
                start_idx = pos + m.start()
                title = m.group(2) if m.group(2) else "Ví dụ"
            
            q_content, next_pos = find_brackets(content, start_idx)
            if q_content is not None:
                # Find any solutions immediately following
                sol_parts, end_pos = extract_solution_boxes(content, next_pos)
                problems.append({
                    "type": "example-box",
                    "q": f"*{title}*: {q_content.strip()}",
                    "ans": "",
                    "solutions": sol_parts
                })
                pos = max(next_pos, end_pos)
            else:
                pos = start_idx + 12
                
    if len(problems) == 0:
        pos = 0
        while len(problems) < 2:
            m = re.search(r"#eg-box\((title:\s*\"([^\"]+)\")?\s*\)", content[pos:])
            if not m:
                m = re.search(r"#eg-box\b", content[pos:])
                if not m:
                    break
                start_idx = pos + m.start()
                title = "Ví dụ"
            else:
                start_idx = pos + m.start()
                title = m.group(2) if m.group(2) else "Ví dụ"
            
            q_content, next_pos = find_brackets(content, start_idx)
            if q_content is not None:
                sol_parts, end_pos = extract_solution_boxes(content, next_pos)
                problems.append({
                    "type": "eg-box",
                    "q": f"*{title}*: {q_content.strip()}",
                    "ans": "",
                    "solutions": sol_parts
                })
                pos = max(next_pos, end_pos)
            else:
                pos = start_idx + 8
                
    return problems

results = {}
for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    probs = extract_problems_with_solutions(filepath)
    results[filename] = probs

output_path = "/Users/admin/conictypst/scratch/extracted_questions_solutions.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"Extracted questions and solutions from {len(files)} files. Written to {output_path}")
