import re

path = '/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ'

with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

pattern = re.compile(r'\\[a-zA-Z]+')

for i, line in enumerate(lines):
    matches = pattern.findall(line)
    if matches:
        # ignore lines that are comments or clearly not inside math mode if possible, but let's print all to be safe
        print(f"Line {i+1}: {line.strip()} (matches: {matches})")
