with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'r') as f:
    content = f.read()

target = '  box-radius: 4pt,\n'
repl = '  box-radius: 4pt,\n  show-hyperlink: false,\n'

content = content.replace(target, repl)

with open('/Users/admin/conictypst/typst-pkg-sang-math/sang-exam.typ', 'w') as f:
    f.write(content)

