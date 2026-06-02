import re
import shutil

src_file = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"
backup_file = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ.bak"

# Restore from backup
shutil.copyfile(backup_file, src_file)
print(f"Restored from {backup_file}")

with open(src_file, "r", encoding="utf-8") as f:
    content = f.read()

# Apply \overline{...} -> overline(...) first
content = re.sub(r'\\overline\{([^{}]+)\}', r'overline(\1)', content)

# Define substitutions (order corrected: longer prefix or specific commands first)
replacements = [
    (r'\\notin', ' in.not '),
    (r'\\infty', ' infinity '),
    (r'\\infinity', ' infinity '),
    (r'\\in', ' in '),
    (r'\\subseteq', ' subset.eq '),
    (r'\\cap', ' inter '),
    (r'\\cup', ' union '),
    (r'\\emptyset', ' empty '),
    (r'\\int', ' integral '),
    (r'\\ne', ' != '),
    (r'\\leftrightarrow', ' <-> '),
    (r'\\rightarrow', ' -> '),
    (r'\\times', ' times '),
    (r'\\quad', ' quad '),
    (r'\\left\.', ' [ '),
    (r'\\right', ' ] '),
    (r'\\pmod', ' mod '),
    (r'\\equiv', ' equiv '),
    (r'N_\(cấm\)', 'N_("cấm")'),
]

for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content)

with open(src_file, "w", encoding="utf-8") as f:
    f.write(content)

print("Corrected replacements applied successfully!")
