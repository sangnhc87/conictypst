with open('templates/ds20-tln10-ngang.typ', 'r') as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if line.strip() in [']', '])']:
        continue
    new_lines.append(line)

new_lines.append('  ]\n]\n\n// ── TỰ LUẬN VIẾT TAY ────────────────────────────────────────\n  ]\n]\n')

with open('templates/ds20-tln10-ngang.typ', 'w') as f:
    f.writelines(new_lines)
