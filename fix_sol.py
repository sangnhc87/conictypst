with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if "Anchor <hl-sol-N>" in line:
        lines.insert(i, "  ]\n")
        break

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.writelines(lines)
