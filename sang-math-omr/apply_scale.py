with open("omr_sheet.typ", "r") as f:
    lines = f.readlines()

new_lines = []
in_scale = False
for i, line in enumerate(lines):
    if line.startswith("#place(top + left"):
        new_lines.append("#align(center + horizon)[\n")
        new_lines.append("  #scale(x: 95%, y: 95%, origin: center)[\n")
        in_scale = True
    
    if in_scale:
        new_lines.append("    " + line)
    else:
        new_lines.append(line)

if in_scale:
    new_lines.append("  ]\n")
    new_lines.append("]\n")

with open("omr_sheet.typ", "w") as f:
    f.writelines(new_lines)
