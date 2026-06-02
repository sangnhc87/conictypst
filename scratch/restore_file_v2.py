import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
target_path = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

file_lines = {}

with open(log_path, "r", encoding="utf-8") as f:
    for line_idx, line in enumerate(f):
        try:
            step = json.loads(line)
        except Exception as e:
            continue
        
        # Check if the step has tool output
        # Sometimes tool outputs are in step["content"] or step["tool_calls"] or step["response"]
        # Let's search inside the step recursively for strings that look like "1: // ════"
        def scan_obj(obj):
            if isinstance(obj, str):
                # Check if it has many lines of format "num: content"
                if "1: // ════" in obj or "801: " in obj:
                    lines = obj.split("\n")
                    for l in lines:
                        l = l.strip()
                        if not l:
                            continue
                        # Match "num: content" or line numbers
                        parts = l.split(":", 1)
                        if len(parts) == 2:
                            try:
                                num = int(parts[0])
                                content = parts[1]
                                if content.startswith(" "):
                                    content = content[1:]
                                file_lines[num] = content
                            except ValueError:
                                pass
            elif isinstance(obj, dict):
                for k, v in obj.items():
                    scan_obj(v)
            elif isinstance(obj, list):
                for item in obj:
                    scan_obj(item)
        
        scan_obj(step)

print(f"Collected {len(file_lines)} lines.")
missing = []
for i in range(1, 1398):
    if i not in file_lines:
        missing.append(i)

if missing:
    print(f"Warning: Missing lines: {missing[:20]}... total missing: {len(missing)}")
else:
    print("All 1397 lines collected successfully!")

# Write to target if we have all lines
if len(file_lines) >= 1397:
    with open(target_path, "w", encoding="utf-8") as f:
        for i in range(1, 1398):
            content = file_lines[i]
            f.write(content + "\n")
    print("File restored successfully!")
else:
    print("Restore skipped due to missing lines.")
