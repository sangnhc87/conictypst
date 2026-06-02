import re

filepath = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Custom parser to extract arguments of `#tln(`
idx = 0
tln_calls = []
while True:
    pos = content.find("#tln(", idx)
    if pos == -1:
        break
    
    # Find matching closing parenthesis
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

print(f"Found {len(tln_calls)} #tln calls.")

# Helper to split top-level arguments by comma
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

for idx, (start, end) in enumerate(tln_calls):
    inner = content[start+5:end].strip()
    args = split_args(inner)
    named = [a for a in args if ":" in a and not a.startswith("[") and not a.startswith('"')]
    positional = [a for a in args if a not in named]
    print(f"Call {idx+1}: Positional count = {len(positional)}, Named = {[n.split(':')[0] for n in named]}")
    if len(positional) > 0:
        print(f"  Pos 1: {positional[0][:40]}")
    if len(positional) > 1:
        print(f"  Pos 2: {positional[1][:40]}")
    if len(positional) > 2:
        print(f"  Pos 3: {positional[2][:40]}")
