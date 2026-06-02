import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
recovered_lines = {}

# We will scan each step. When we see a view_file response, we will parse the line numbers.
# We will identify view_file responses by the presence of lines starting with "1: //" or "801: //" etc.
with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
        except Exception:
            continue
        
        # Scan everything in data for line pattern: "number: text"
        # We look for lines in content or other fields
        def scan(obj):
            if isinstance(obj, str):
                lines = obj.split("\n")
                for l in lines:
                    m = re.match(r'^(\d+):\s(.*)', l.strip())
                    if m:
                        num = int(m.group(1))
                        text = m.group(2)
                        # Avoid adding lines that have checklists or system prompts (e.g. from the top-level corruption)
                        # We only want lines that are actual Typst code.
                        # Wait, we can just save everything and inspect.
                        recovered_lines[num] = text
            elif isinstance(obj, dict):
                for v in obj.values():
                    scan(v)
            elif isinstance(obj, list):
                for item in obj:
                    scan(item)
                    
        scan(data)

print(f"Total unique lines recovered: {len(recovered_lines)}")
missing = []
for i in range(1, 1323):
    if i not in recovered_lines:
        missing.append(i)
print(f"Missing lines (out of 1-1322): {len(missing)}")
if missing:
    print(f"First few missing: {missing[:30]}")

# Write the recovered lines to a file in order
with open("/Users/admin/conictypst/scratch/recovered_typst_all.typ", "w", encoding="utf-8") as f_out:
    for i in sorted(recovered_lines.keys()):
        f_out.write(recovered_lines[i] + "\n")
print("Saved recovered lines to scratch/recovered_typst_all.typ")
