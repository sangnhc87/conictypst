target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace deprecated 'sect' with 'inter' for set intersection
content = content.replace('sect', 'inter')

with open(target_file, 'w') as f:
    f.write(content)

print("Replacement of sect with inter finished!")
