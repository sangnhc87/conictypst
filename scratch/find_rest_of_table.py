with open("/Users/admin/conictypst/scratch/all_e11c_tables.txt", "r", encoding="utf-8") as f:
    content = f.read()

# Let's search for line numbers like "871:", "872:", "880:" in the file
import re
pattern = re.compile(r'\b(87[1-9]|88[0-9]|89[0-9]|90[0-9]):\s*(.*)')

matches = pattern.findall(content)
print(f"Found {len(matches)} matches for lines 871-909:")
for m in matches[:50]:
    print(f"Line {m[0]}: {m[1]}")
