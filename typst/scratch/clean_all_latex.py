target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

replacements = {
    r'\subset': ' subset ',
    r'\in': ' in ',
    r'\cap': ' inter ',
    r'\cup': ' union ',
    r'\ge': ' >= ',
    r'\le': ' <= ',
    r'\cdot': ' dot.c ',
    r'\sum': ' sum ',
    r'\prod': ' prod ',
    r'\infty': ' +oo ',
    r'\emptyset': ' nothing ',
    r'\setminus': ' minus ',
    r'\quad': ' ',
    r'\qquad': ' ',
    r'\text': ' ',
}

for old, new in replacements.items():
    content = content.replace(old, new)

# Sửa lỗi 'ightarrow' nếu còn
content = content.replace('ightarrow', ' arrow.r ')
# Sửa dấu gạch chéo trước subset nếu nó bị double escape
content = content.replace(r'\subset', ' subset ')
content = content.replace(r'\in', ' in ')

with open(target_file, 'w') as f:
    f.write(content)

print("LaTeX cleanup finished!")
