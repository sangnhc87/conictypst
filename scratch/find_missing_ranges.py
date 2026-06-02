import json

with open("/Users/admin/conictypst/scratch/extracted_views.json", "r", encoding="utf-8") as f:
    views = json.load(f)

all_lines = {}
for v in views:
    filepath = v.get("filepath", "")
    if "lich-su" in filepath or filepath == "unknown":
        lines = v.get("lines", {})
        for l_num, text in lines.items():
            l_num = int(l_num)
            all_lines[l_num] = text

max_line = max(all_lines.keys()) if all_lines else 0
missing = [i for i in range(1, max_line + 1) if i not in all_lines]

if missing:
    ranges = []
    start = missing[0]
    prev = missing[0]
    for m in missing[1:]:
        if m == prev + 1:
            prev = m
        else:
            ranges.append((start, prev))
            start = m
            prev = m
    ranges.append((start, prev))
    print(f"Total lines: {max_line}")
    print(f"Total missing lines: {len(missing)}")
    print("Missing ranges:")
    for r in ranges:
        print(f"  {r[0]} to {r[1]} (count: {r[1]-r[0]+1})")
else:
    print("No missing lines!")
