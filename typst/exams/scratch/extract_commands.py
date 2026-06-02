import re

with open("/Users/admin/conictypst/typst/exams/CD-DaiSo-ToHop-content.typ", "r", encoding="utf-8") as f:
    content = f.read()

# Find all backslash followed by alphabetic characters
matches = re.findall(r'\\[a-zA-Z]+', content)
unique_commands = set(matches)
print("Unique commands found:", sorted(list(unique_commands)))
