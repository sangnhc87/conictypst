with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

stack = []
for i, line in enumerate(lines):
    line_num = i + 1
    for char_idx, char in enumerate(line):
        if char == '[':
            stack.append(('[', line_num, char_idx))
        elif char == ']':
            if not stack:
                print(f"Unexpected ']' at line {line_num}:{char_idx}")
            else:
                top, l, c = stack.pop()
                if top != '[':
                    print(f"Mismatched ']' at line {line_num}:{char_idx} matching '{top}' from line {l}:{c}")
        elif char == '(':
            stack.append(('(', line_num, char_idx))
        elif char == ')':
            if not stack:
                print(f"Unexpected ')' at line {line_num}:{char_idx}")
            else:
                top, l, c = stack.pop()
                if top != '(':
                    print(f"Mismatched ')' at line {line_num}:{char_idx} matching '{top}' from line {l}:{c}")

print(f"Finished scanning. Unclosed brackets/parens in stack: {len(stack)}")
for item in stack[-10:]:
    print(f"Unclosed '{item[0]}' at line {item[1]}:{item[2]}")
