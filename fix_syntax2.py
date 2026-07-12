lines_to_fix = [966, 1143, 1327, 1432]

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    lines = f.readlines()

for idx in sorted(lines_to_fix, reverse=True):
    # idx is 1-indexed, so idx-1 is the list index
    i = idx - 1
    if lines[i].strip() == ']' and lines[i+1].strip() == '}':
        lines.insert(i, '    }\n')
    else:
        print(f"WARNING: Line {idx} is not ] ! It is {lines[i].strip()}")

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.writelines(lines)
