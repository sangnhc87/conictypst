target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace '**"bước nhảy"**' with '*"bước nhảy"*'
content = content.replace('**"bước nhảy"**', '*"bước nhảy"*')

with open(target_file, 'w') as f:
    f.write(content)

print("Warning fix for parameter d applied successfully!")
