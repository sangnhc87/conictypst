import os
import re

exams_dir = "/Users/admin/conictypst/typst/exams"
files = [f for f in os.listdir(exams_dir) if f.endswith(".typ")]

results = []

# Patterns to find titles
title_patterns = [
    re.compile(r"Chuyên\s+Đề:\s*([^\n\]#]+)", re.IGNORECASE),
    re.compile(r"Chủ\s+Đề:\s*([^\n\]#]+)", re.IGNORECASE),
    re.compile(r"Title:\s*([^\n\]#]+)", re.IGNORECASE),
    re.compile(r"=\s*I\.\s*Lý\s+thuyết\s+trọng\s+tâm\s*\n", re.IGNORECASE)
]

# Patterns for problems like #tln(, #tn(, #ds(
problem_patterns = [
    re.compile(r"#(tln|tn|ds)\(\s*\[([\s\S]*?)\]\s*,", re.MULTILINE),
    re.compile(r"#(tln|tn|ds)\(\s*([\s\S]*?)\s*,", re.MULTILINE)
]

for filename in sorted(files):
    filepath = os.path.join(exams_dir, filename)
    with open(filepath, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()
    
    # Try to find Title
    title = None
    for pattern in title_patterns:
        m = pattern.search(content)
        if m:
            if m.lastindex:
                title = m.group(1).strip()
            break
    
    if not title:
        # Check first heading
        heading_match = re.search(r"=\s*([^\n]+)", content)
        if heading_match:
            title = heading_match.group(1).strip()
        else:
            title = filename
            
    # Find problems
    problems = []
    # Let's find matches of #tln(, #tn(, #ds(
    # Note: we want the question part
    # A simple way is to search for `#tln(` or `#tn(` or `#ds(` and grab the text up to the first comma, or matching brackets
    pos = 0
    while len(problems) < 2:
        m = re.search(r"#(tln|tn|ds)\(", content[pos:])
        if not m:
            break
        start_idx = pos + m.start()
        # Find the content inside the parentheses. We need to handle nested parentheses/brackets
        bracket_count = 0
        paren_count = 0
        in_string = False
        prob_text = ""
        j = start_idx + len(m.group(0))
        while j < len(content):
            char = content[j]
            if char == '"' and content[j-1] != '\\':
                in_string = not in_string
            if not in_string:
                if char == '(':
                    paren_count += 1
                elif char == ')':
                    if paren_count == 0:
                        break
                    paren_count -= 1
                elif char == '[':
                    bracket_count += 1
                elif char == ']':
                    bracket_count -= 1
            prob_text += char
            j += 1
        
        pos = j
        # Clean up prob_text: it contains the arguments. The first argument is typically the question.
        # Let's extract the first argument, which is often bracketed [question] or similar.
        q_match = re.search(r"^\[([\s\S]*?)\]", prob_text.strip())
        if q_match:
            q = q_match.group(1).strip()
        else:
            # Maybe it starts with string or something else
            q = prob_text.split(',')[0].strip()
            
        if q:
            # Remove line breaks and clean whitespace
            q_clean = re.sub(r"\s+", " ", q)
            # Truncate if too long
            if len(q_clean) > 300:
                q_clean = q_clean[:297] + "..."
            problems.append(q_clean)
        else:
            pos = start_idx + len(m.group(0)) # advance to prevent loop
            
    results.append({
        "file": filename,
        "title": title,
        "problems": problems
    })

import json
print(json.dumps(results, indent=2, ensure_ascii=False))
