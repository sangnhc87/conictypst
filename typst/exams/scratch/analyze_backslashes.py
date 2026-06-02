import re

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

for i, line in enumerate(lines, 1):
    # Find all backslashes
    matches = re.finditer(r'\\', line)
    for m in matches:
        start = max(0, m.start() - 15)
        end = min(len(line), m.end() + 20)
        snippet = line[start:end].replace('\n', '\\n')
        print(f"Line {i:4d}: ... {snippet} ...")
