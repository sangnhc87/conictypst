import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
recovered_lines = {}

# We scan each step. We look for lines matching: <tool_num>: <typst_num>: <content>
with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
        except Exception:
            continue
        
        def scan(obj):
            if isinstance(obj, str):
                lines = obj.split("\n")
                for l in lines:
                    # Match pattern: optional spaces, numbers, colon, optional spaces, numbers, colon, space, content
                    m = re.match(r'^\s*\d+:\s*(\d+):\s?(.*)', l.strip())
                    if m:
                        num = int(m.group(1))
                        text = m.group(2)
                        recovered_lines[num] = text
            elif isinstance(obj, dict):
                for v in obj.values():
                    scan(v)
            elif isinstance(obj, list):
                for item in obj:
                    scan(item)
                    
        scan(data)

print(f"Total unique typst lines recovered: {len(recovered_lines)}")
missing = []
# Typst file had at least 1322 lines
for i in range(1, 1323):
    if i not in recovered_lines:
        missing.append(i)
print(f"Missing lines (1-1322): {len(missing)}")
if missing:
    print(f"First few missing lines: {missing[:30]}")

# Write to scratch/reconstructed_v2.typ
with open("/Users/admin/conictypst/scratch/reconstructed_v2.typ", "w", encoding="utf-8") as f_out:
    max_line = max(recovered_lines.keys()) if recovered_lines else 0
    for i in range(1, max_line + 1):
        content = recovered_lines.get(i, "")
        f_out.write(content + "\n")
print(f"Saved reconstructed file of length {max_line} to scratch/reconstructed_v2.typ")
