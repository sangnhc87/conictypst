import re

with open('CD-min-2-DuongTron-ChuyenSau.typ', 'r') as f:
    lines = f.readlines()

in_math = False
math_start_line = -1
math_start_col = -1

for line_idx, line in enumerate(lines):
    line_num = line_idx + 1
    # Find all $ characters on the line
    cols = [m.start() for m in re.finditer(r'\$', line)]
    for col in cols:
        in_math = not in_math
        if in_math:
            math_start_line = line_num
            math_start_col = col
        else:
            math_start_line = -1
            math_start_col = -1

if in_math:
    print(f"Unmatched $ starts at line {math_start_line}, column {math_start_col}")
else:
    print("All $ are balanced line-by-line (or overall).")
