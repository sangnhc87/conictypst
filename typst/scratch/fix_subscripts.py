target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace N_(bộ) with N_("bộ")
content = content.replace('N_(bộ)', 'N_("bộ")')

with open(target_file, 'w') as f:
    f.write(content)

print("Subscript fix applied successfully!")
