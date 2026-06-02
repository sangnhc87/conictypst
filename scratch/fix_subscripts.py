import re

filepath = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

with open(filepath, "r", encoding="utf-8") as f:
    content = f.read()

# Match t_{letters and spaces} and replace with t_(letters and spaces)
pattern = r't_\{([a-zA-Z\s]+)\}'

matches = re.findall(pattern, content)
print(f"Found {len(matches)} matches of LaTeX subscripts: {set(matches)}")

new_content = re.sub(pattern, r't_(\1)', content)

with open(filepath, "w", encoding="utf-8") as f:
    f.write(new_content)

print("Subscript syntax fix completed successfully!")
