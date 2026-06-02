with open("/Users/admin/conictypst/scratch/all_e11c_tables.txt", "r", encoding="utf-8") as f:
    content = f.read()

steps = content.split("=== STEP ")
print(f"Total steps: {len(steps)}")

for s in steps:
    if not s.strip():
        continue
    header = s.split("\n")[0]
    print(f"--- STEP {header} ---")
    # find lines containing table( or #table(
    lines = s.splitlines()
    for idx, line in enumerate(lines):
        if "table(" in line or "#table(" in line:
            print(f"L{idx}: {line}")
            # Print 10 lines of context
            for j in range(max(0, idx-2), min(len(lines), idx+15)):
                print(f"  {j}: {lines[j]}")
            print("-" * 30)
