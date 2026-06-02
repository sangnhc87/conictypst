import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"
with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

for match in re.finditer(r'ightarrow', content):
    start = max(0, match.start() - 20)
    end = min(len(content), match.end() + 20)
    snippet = content[start:end]
    print(f"Match at {match.start()}: {repr(snippet)}")
