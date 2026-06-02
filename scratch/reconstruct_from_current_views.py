import json
import re
import os

log_path = "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"

reconstructed_lines = {}

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line, strict=False)
            content = data.get("content", "")
            if "CD-DaiSo-ToHop-content.typ" in content and "Showing lines" in content:
                step_idx = data.get("step_index", 9999)
                
                # We only take views before step 257 (which is when the modifications started!)
                if step_idx < 257:
                    for l in content.splitlines():
                        m = re.match(r'^(\d+):\s(.*)', l)
                        if m:
                            l_num = int(m.group(1))
                            l_text = m.group(2)
                            reconstructed_lines[l_num] = l_text
        except Exception as e:
            pass

print(f"Total lines reconstructed: {len(reconstructed_lines)}")
if reconstructed_lines:
    max_line = max(reconstructed_lines.keys())
    print(f"Max line number: {max_line}")
    missing = [i for i in range(1, max_line + 1) if i not in reconstructed_lines]
    print(f"Total missing lines: {len(missing)}")
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
        print("Missing ranges:")
        for r in ranges:
            print(f"  {r[0]} to {r[1]} (count: {r[1]-r[0]+1})")
            
    # Write to file
    out_path = "/Users/admin/conictypst/scratch/reconstructed_original_35.typ"
    with open(out_path, "w", encoding="utf-8") as out_f:
        for i in range(1, max_line + 1):
            if i in reconstructed_lines:
                out_f.write(reconstructed_lines[i] + "\n")
            else:
                out_f.write(f"// MISSING LINE {i}\n")
    print(f"Saved reconstructed original file to {out_path}")
