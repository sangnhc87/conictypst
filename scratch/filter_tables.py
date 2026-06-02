import re

path = "/Users/admin/conictypst/scratch/all_logs_tables.txt"

with open(path, "r", encoding="utf-8") as f:
    content = f.read()

# Tables are separated by === MATCH AT LINE ... ===
blocks = content.split("=== MATCH AT LINE ")
unique_tables = []

print(f"Total blocks in file: {len(blocks)}")

for b in blocks:
    if not b.strip():
        continue
    # Find table code in block
    # It starts with #table( or table(
    m = re.search(r'#?table\(', b)
    if m:
        start = m.start()
        # Find matching closing paren
        braces = 0
        end = -1
        for i in range(start, len(b)):
            if b[i] == '(':
                braces += 1
            elif b[i] == ')':
                braces -= 1
                if braces == 0:
                    end = i + 1
                    break
        if end != -1:
            table_code = b[start:end].strip()
            # Normalize whitespace to compare
            norm = re.sub(r'\s+', ' ', table_code)
            if norm not in [re.sub(r'\s+', ' ', u) for u in unique_tables]:
                unique_tables.append(table_code)

print(f"Found {len(unique_tables)} unique tables:")
for idx, ut in enumerate(unique_tables):
    print(f"\n--- TABLE {idx} ---")
    lines = ut.splitlines()
    for l in lines[:10]:
        print(l)
    if len(lines) > 10:
        print("...")
