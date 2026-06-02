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

def extract_problems(filepath):
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
            
            if p_type == "tln":
                ans_content, _ = find_brackets(content, next_pos)
                if ans_content:
                    ans_content = ans_content.strip()
            elif p_type == "tn" or p_type == "ds":
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
                    choices = re.findall(r"\[([\s\S]*?)\]", paren_inner)
                    ans_content = " / ".join([c.strip() for c in choices])
            
            problems.append({
                "type": p_type,
                "q": q_clean,
                "ans": ans_content
            })
            pos = next_pos
        else:
            pos = start_idx + len(m.group(0))
            
    # 2. If no standard questions found, try custom boxes (like #example-box, #eg-box)
    if len(problems) == 0:
        # Search for #example-box
        pos = 0
        while len(problems) < 2:
            m = re.search(r"#example-box\((n:\s*\"([^\"]+)\")?\s*\)", content[pos:])
            if not m:
                # Try without parentheses
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
                problems.append({
                    "type": "example-box",
                    "q": f"*{title}*: {q_content.strip()}",
                    "ans": ""
                })
                pos = next_pos
            else:
                pos = start_idx + 12
                
    if len(problems) == 0:
        # Search for #eg-box
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
                problems.append({
                    "type": "eg-box",
                    "q": f"*{title}*: {q_content.strip()}",
                    "ans": ""
                })
                pos = next_pos
            else:
                pos = start_idx + 8
                
    return problems

results = {}
for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    probs = extract_problems(filepath)
    results[filename] = probs

output_path = "/Users/admin/conictypst/scratch/extracted_questions_v2.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"Extracted questions from {len(files)} files. Written to {output_path}")

zero_p = [k for k, v in results.items() if len(v) == 0]
print('Files with 0 problems extracted:', len(zero_p))
for fn in zero_p:
    print('-', fn)
