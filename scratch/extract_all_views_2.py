import json
import re
import os

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

views = []

with open(log_path, "r", encoding="utf-8") as f:
    for line in f:
        try:
            data = json.loads(line)
            t_type = data.get("type")
            content = data.get("content", "")
            
            if t_type == "VIEW_FILE" and "Showing lines" in content:
                m = re.search(r'Showing lines (\d+) to (\d+)', content)
                if m:
                    start = int(m.group(1))
                    end = int(m.group(2))
                    
                    # Simpler file path parsing
                    filepath = "unknown"
                    for l in content.splitlines():
                        if "File Path:" in l:
                            # e.g., File Path: `file:///Users/admin/conictypst/typst/book.typ`
                            filepath = l.replace("File Path:", "").strip()
                            filepath = filepath.replace("`", "")
                            filepath = filepath.replace("file://", "")
                            break
                    
                    lines_dict = {}
                    for l in content.splitlines():
                        lm = re.match(r'^(\d+):\s(.*)', l)
                        if lm:
                            l_num = int(lm.group(1))
                            l_text = lm.group(2)
                            lines_dict[l_num] = l_text
                    
                    views.append({
                        "step_index": data.get("step_index"),
                        "filepath": filepath,
                        "start": start,
                        "end": end,
                        "lines": lines_dict
                    })
        except Exception as e:
            pass

print(f"Found {len(views)} view segments in the logs.")
for v in views:
    print(f"Step {v['step_index']}: File={os.path.basename(v['filepath'])}, Lines {v['start']} to {v['end']} (lines found: {len(v['lines'])})")
    
# Save to JSON
with open("/Users/admin/conictypst/scratch/extracted_views.json", "w", encoding="utf-8") as out:
    json.dump(views, out, ensure_ascii=False, indent=2)
