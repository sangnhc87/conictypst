import re
import shutil

src_file = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ"
backup_file = "/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ.bak"

# Make a backup
shutil.copyfile(src_file, backup_file)
print(f"Backed up to {backup_file}")

with open(src_file, "r", encoding="utf-8") as f:
    content = f.read()

# Define substitutions
# Order matters: replace \notin before \in, \subseteq before \in, etc.
replacements = [
    (r'\\notin', ' in.not '),
    (r'\\in', ' in '),
    (r'\\subseteq', ' subset.eq '),
    (r'\\cap', ' inter '),
    (r'\\cup', ' union '),
    (r'\\emptyset', ' empty '),
    (r'\\infinity', ' infinity '), # just in case
    (r'\\infty', ' infinity '),
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
]

# Apply \overline{...} -> overline(...) first
content = re.sub(r'\\overline\{([^{}]+)\}', r'overline(\1)', content)

# Apply other replacements
for pattern, replacement in replacements:
    content = re.sub(pattern, replacement, content)

with open(src_file, "w", encoding="utf-8") as f:
    f.write(content)

print("Replacements applied successfully!")
