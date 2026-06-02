target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

def fix_lr_content(text):
    res = []
    i = 0
    n = len(text)
    fixed_count = 0
    while i < n:
        if i + 3 < n and text[i:i+3] == 'lr(':
            # Find the corresponding closing parenthesis for lr(
            start_pos = i + 3
            paren_count = 1
            j = start_pos
            while j < n and paren_count > 0:
                if text[j] == '(':
                    paren_count += 1
                elif text[j] == ')':
                    paren_count -= 1
                j += 1
            
            if paren_count == 0:
                inside = text[start_pos : j-1]
                stripped_inside = inside.strip()
                if stripped_inside.startswith('(') and stripped_inside.endswith(')'):
                    # Already wrapped in parentheses
                    res.append(text[i:j])
                else:
                    # Not wrapped, wrap it
                    res.append(f"lr(({inside}))")
                    fixed_count += 1
                i = j
            else:
                res.append(text[i])
                i += 1
        else:
            res.append(text[i])
            i += 1
    print(f"Fixed {fixed_count} instances of lr(...)")
    return "".join(res)

new_content = fix_lr_content(content)

with open(target_file, 'w') as f:
    f.write(new_content)

print("Modification finished!")
