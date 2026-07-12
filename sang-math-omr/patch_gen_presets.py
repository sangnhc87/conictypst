import re

with open('generate_all_presets.cjs', 'r', encoding='utf-8') as f:
    content = f.read()

calls_old = "fs.writeFileSync('templates/thptqg-toan-2025.typ', buildTypstCode(12, 4, 6, 'a4', 'thptqg-toan-2025'));"
calls_new = calls_old + "\nfs.writeFileSync('templates/ds-20-ngang.typ', buildTypstCode(0, 20, 0, 'a5', 'ds-20-ngang'));\nfs.writeFileSync('templates/tln-10-ngang.typ', buildTypstCode(0, 0, 10, 'a5', 'tln-10-ngang'));"

if 'ds-20-ngang.typ' not in content:
    content = content.replace(calls_old, calls_new)

with open('generate_all_presets.cjs', 'w', encoding='utf-8') as f:
    f.write(content)
