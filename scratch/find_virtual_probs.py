import re

path = "/Users/admin/conictypst/scratch/reconstructed_virtual.typ"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# Match #prob( with optional whitespace/newlines and then "number"
# or #tln( with optional whitespace/newlines and then id: "2EX-number"
# We will use re.finditer with a regex

matches = []

for match in re.finditer(r'#prob\(\s*"\s*(\d+)', content):
    # Find line number of this match
    line_num = content[:match.start()].count('\n') + 1
    matches.append((line_num, f"#prob for Bài {match.group(1)}"))

for match in re.finditer(r'#tln\(\s*id:\s*"\s*2EX-(\d+)"', content):
    line_num = content[:match.start()].count('\n') + 1
    matches.append((line_num, f"#tln for Bài {match.group(1)}"))
    
# also check for general #tln( without 2EX-
for match in re.finditer(r'#tln\(\s*id:\s*"\s*([^"]+)"', content):
    line_num = content[:match.start()].count('\n') + 1
    # Check if we already recorded it
    text = f"#tln for {match.group(1)}"
    if not any(m[0] == line_num for m in matches):
        matches.append((line_num, text))

for line_num, desc in sorted(matches):
    print(f"Line {line_num}: {desc}")
