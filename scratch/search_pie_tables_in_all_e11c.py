import re

path = "/Users/admin/conictypst/scratch/all_e11c_tables.txt"

with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# Find all occurrences of table( or #table(
matches = []
for m in re.finditer(r'#?table\(', content):
    start = m.start()
    # extract up to 4000 characters
    sub = content[start:start+4000]
    # find matching brace
    braces = 0
    end = -1
    for i in range(len(sub)):
        if sub[i] == '(':
            braces += 1
        elif sub[i] == ')':
            braces -= 1
            if braces == 0:
                end = i + 1
                break
    if end != -1:
        table_code = sub[:end]
        if any(w in table_code for w in ["đóng góp", "hệ số", "b_A", "b_B"]):
            matches.append(table_code)

print(f"Found {len(matches)} matches.")
for idx, ut in enumerate(matches):
    print(f"\n--- MATCH {idx} ---")
    print(ut)
    print("="*60)
