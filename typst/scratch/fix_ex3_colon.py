target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Replace '#note-box(title: "💡 Giải thích bước dịch chuyển số mũ (Shift Rule)"): ['
# with '#note-box(title: "💡 Giải thích bước dịch chuyển số mũ (Shift Rule)")[ '
content = content.replace(
    '#note-box(title: "💡 Giải thích bước dịch chuyển số mũ (Shift Rule)"): [',
    '#note-box(title: "💡 Giải thích bước dịch chuyển số mũ (Shift Rule)")['
)

with open(target_file, 'w') as f:
    f.write(content)

print("Fix applied successfully!")
