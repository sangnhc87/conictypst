import json

with open("/Users/admin/conictypst/scratch/extracted_views.json", "r", encoding="utf-8") as f:
    views = json.load(f)

all_lines = {}
for v in views:
    # Check if this view is of the book file (filepath contains "lich-su")
    filepath = v.get("filepath", "")
    if "lich-su" in filepath or filepath == "unknown":
        lines = v.get("lines", {})
        for l_num, text in lines.items():
            l_num = int(l_num)
            # If we already have this line, we keep the one from the step with the highest index (which represents the latest state)
            if l_num not in all_lines or v["step_index"] > all_lines[l_num]["step_index"]:
                all_lines[l_num] = {
                    "text": text,
                    "step_index": v["step_index"]
                }

print(f"Total unique book lines captured: {len(all_lines)}")
if all_lines:
    min_line = min(all_lines.keys())
    max_line = max(all_lines.keys())
    print(f"Line range: {min_line} to {max_line}")
    
    # Let's count missing lines in the range [1, max_line]
    missing = [i for i in range(1, max_line + 1) if i not in all_lines]
    print(f"Total missing lines in [1, {max_line}]: {len(missing)}")
    
    # Save the known lines to a text file for inspection
    with open("/Users/admin/conictypst/scratch/known_lines.txt", "w", encoding="utf-8") as out:
        for i in range(1, max_line + 1):
            if i in all_lines:
                out.write(f"{i}: {all_lines[i]['text']}\n")
            else:
                out.write(f"{i}: // MISSING\n")
    print("Saved known lines to scratch/known_lines.txt")
