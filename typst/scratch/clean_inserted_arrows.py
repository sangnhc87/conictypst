target_file = '/Users/admin/conictypst/typst/exams/CD-HamSinh-GeneratingFunction.typ'

with open(target_file, 'r') as f:
    content = f.read()

# Fix LaTeX-style math spacing, backslashes, and invalid syntax
replacements = {
    r'\rightarrow': ' arrow.r ',
    r'\Big[': ' [ ',
    r'\Big]': ' ] ',
    r'\Big': ' ',
    r'\quad': ' ',
    # Fix corrupted arrow strings due to carriage return (\r) parsing
    r' \rightarrow ': ' arrow.r ',
    r'\r': ' arrow.r ',
    '\\rightarrow': ' arrow.r ',
}

for old, new in replacements.items():
    content = content.replace(old, new)

# Let's perform standard cleanups for arrow.r outside math blocks
content = content.replace('$\\rightarrow$', ' #sym.arrow.r ')
content = content.replace('$\rightarrow$', ' #sym.arrow.r ')
content = content.replace(r' \rightarrow ', ' arrow.r ')

# Fix the specific lines that failed:
# Typst newline symbol is '\' at the end of a line in math, but in our insert it was parsed incorrectly
# Let's clean up any lingering 'ightarrow'
content = content.replace('ightarrow', ' arrow.r ')
content = content.replace(r'\ ', ' ')

with open(target_file, 'w') as f:
    f.write(content)

print("Cleanup script executed successfully!")
