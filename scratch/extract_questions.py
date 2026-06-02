import os
import re
import json

exams_dir = "/Users/admin/conictypst/typst/exams"
files = [f for f in os.listdir(exams_dir) if f.endswith(".typ")]

def find_brackets(text, start_pos):
    # Find the matching brackets [ and ] starting from start_pos
    # Returns the content inside the brackets and the end position
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
    
    # Let's search for #tln, #tn, #ds in the file
    # We search for pattern: #(tln|tn|ds)\(
    problems = []
    pos = 0
    while len(problems) < 2:
        m = re.search(r"#(tln|tn|ds)\(", content[pos:])
        if not m:
            break
        
        start_idx = pos + m.start()
        p_type = m.group(1)
        
        # The first argument should be the question content block [...]
        q_content, next_pos = find_brackets(content, start_idx)
        if q_content is not None:
            # We found the question content!
            # Let's clean it up
            q_clean = q_content.strip()
            
            # Now, let's find the answer.
            # For tln, the second argument is also often a content block [...] or string
            # Let's search for the next content block [...] or choice list
            ans_content = ""
            if p_type == "tln":
                ans_content, _ = find_brackets(content, next_pos)
                if ans_content:
                    ans_content = ans_content.strip()
            elif p_type == "tn":
                # For multiple choice, it's ( [Choice A], [Choice B], ... )
                # Let's just look for the choices list inside (...)
                # Find matching parenthesis starting from next_pos
                first_paren = content.find('(', next_pos)
                if first_paren != -1 and first_paren < next_pos + 50: # must be close
                    # find matching paren
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
                    
                    # Extract choices
                    choices = re.findall(r"\[([\s\S]*?)\]", paren_inner)
                    ans_content = " / ".join([c.strip() for c in choices])
            elif p_type == "ds":
                # True/False choices
                # Similar to tn
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
                    statements = re.findall(r"\[([\s\S]*?)\]", paren_inner)
                    ans_content = " / ".join([s.strip() for s in statements])
            
            problems.append({
                "type": p_type,
                "q": q_clean,
                "ans": ans_content
            })
            pos = next_pos
        else:
            # Skip if we couldn't find bracket
            pos = start_idx + len(m.group(0))
            
    return problems

results = {}
for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    probs = extract_problems(filepath)
    results[filename] = probs

output_path = "/Users/admin/conictypst/scratch/extracted_questions.json"
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(results, f, indent=2, ensure_ascii=False)

print(f"Extracted questions from {len(files)} files. Written to {output_path}")
