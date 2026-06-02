target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace any occurrence of 'ightarrow' with 'arrow.r'
content = content.replace('ightarrow', 'arrow.r')
# Just in case, replace '\rightarrow' with 'arrow.r'
content = content.replace('\\rightarrow', 'arrow.r')

with open(target_file, 'w') as f:
    f.write(content)

print("Fix applied successfully!")
