path = '/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ'

with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace overline
content = content.replace(r'$\overline{a b c}$', r'$overline(a b c)$')
content = content.replace(r'$\overline{a b c d}$', r'$overline(a b c d)$')

# Replace specific LaTeX integration patterns
content = content.replace(r'\int_0^x', r'int_0^x')
content = content.replace(r'\int_0^1', r'int_0^1')
content = content.replace(r'\left. frac((1 + t)^(n+1), n+1) \right|_0^1', r'frac((1 + t)^(n+1), n+1) |_0^1')
content = content.replace(r'\left. frac(t^(k+1), k+1) \right|_0^1', r'frac(t^(k+1), k+1) |_0^1')

# Replace other backslash macros by removing the backslash or converting
content = content.replace(r'\rightarrow', r'rightarrow')
content = content.replace(r'\leftrightarrow', r'leftrightarrow')
content = content.replace(r'\leftrightarrow', r'leftrightarrow')
content = content.replace(r'\infty', r'infty')
content = content.replace(r'\in', r' in ')
content = content.replace(r'\notin', r' notin ')
content = content.replace(r'\subseteq', r'subseteq')
content = content.replace(r'\cap', r'cap')
content = content.replace(r'\times', r'times')
content = content.replace(r'\quad', r'quad')
content = content.replace(r'\ne', r'ne')
content = content.replace(r'\equiv', r'equiv')
content = content.replace(r'\pmod', r'mod')

# Double check if any standard ones like \implies are used in the modified text
content = content.replace(r'\implies', r'Rightarrow')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Latex clean up successful!")
