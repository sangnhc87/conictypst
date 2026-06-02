import re

filepath = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Custom parser to extract tln calls
idx = 0
tln_calls = []
while True:
    pos = content.find("#tln(", idx)
    if pos == -1:
        break
    
    stack = 0
    in_string = False
    escape = False
    end_pos = -1
    for i in range(pos + 4, len(content)):
        char = content[i]
        if in_string:
            if escape:
                escape = False
            elif char == '\\':
                escape = True
            elif char == '"':
                in_string = False
        else:
            if char == '"':
                in_string = True
            elif char == '[':
                stack += 1
            elif char == ']':
                stack -= 1
            elif char == '(':
                stack += 1
            elif char == ')':
                stack -= 1
                if stack == 0:
                    end_pos = i
                    break
    if end_pos != -1:
        tln_calls.append((pos, end_pos))
        idx = end_pos + 1
    else:
        idx = pos + 1

def split_args(arg_str):
    args = []
    current = []
    stack = 0
    in_string = False
    escape = False
    for char in arg_str:
        if in_string:
            if escape:
                escape = False
            elif char == '\\':
                escape = True
            elif char == '"':
                in_string = False
            current.append(char)
        else:
            if char == '"':
                in_string = True
                current.append(char)
            elif char in ('(', '[', '{'):
                stack += 1
                current.append(char)
            elif char in (')', ']', '}'):
                stack -= 1
                current.append(char)
            elif char == ',' and stack == 0:
                args.append("".join(current).strip())
                current = []
            else:
                current.append(char)
    if current:
        args.append("".join(current).strip())
    return args

print(f"Analyzing Q1 to Q15:")
for i, (start, end) in enumerate(tln_calls[:15]):
    inner = content[start+5:end].strip()
    args = split_args(inner)
    named = {}
    positional = []
    for a in args:
        if ":" in a and not a.startswith("[") and not a.startswith('"'):
            k, v = a.split(":", 1)
            named[k.strip()] = v.strip()
        else:
            positional.append(a)
            
    q_text = positional[1] if len(positional) > 1 else ""
    loigiai = named.get("loigiai", "")
    
    # Let's clean up q_text
    if q_text.startswith("[") and q_text.endswith("]"):
        q_text = q_text[1:-1].strip()
        
    # Get last 180 chars of loigiai
    lg_end = loigiai[-180:] if len(loigiai) > 180 else loigiai
    print(f"\nQ{i+1}: {q_text[:80]}...")
    print(f"  LG end: {lg_end.strip().replace(chr(10), ' ')}")
