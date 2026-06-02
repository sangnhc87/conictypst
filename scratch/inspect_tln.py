import re

filepath = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Let's find all occurrences of #tln(
idx = 0
tln_calls = []
while True:
    pos = content.find("#tln(", idx)
    if pos == -1:
        break
    # Find the matching closing parenthesis for this call
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

print(f"Total #tln calls found: {len(tln_calls)}")
for i, (start, end) in enumerate(tln_calls[:5]):
    print(f"\n--- Call {i+1} ---")
    print(content[start:start+250] + "...")
