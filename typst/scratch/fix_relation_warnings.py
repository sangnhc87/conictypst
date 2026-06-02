target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace double asterisks with single asterisks for Typst bold syntax
content = content.replace('**đổi biến (thay thế biến)**', '*đổi biến (thay thế biến)*')
content = content.replace('**\\"máy xay đại số\\" duy nhất**', '*\\"máy xay đại số\\" duy nhất*')

with open(target_file, 'w') as f:
    f.write(content)

print("Warning fixes applied successfully!")
