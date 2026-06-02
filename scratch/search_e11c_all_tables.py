import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/all_e11c_tables.txt"

matched = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            data_str = json.dumps(data, ensure_ascii=False)
            if "table(" in data_str or "columns:" in data_str or "bảng" in data_str.lower():
                content = data.get("content", "")
                if not content:
                    # check output or tool_calls
                    content = str(data.get("tool_calls", [])) + "\n" + str(data.get("output", ""))
                matched.append((i, data.get("type"), content))
        except Exception as e:
            pass

print(f"Found {len(matched)} steps in e11c.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, t, content in matched:
        out.write(f"=== STEP {idx} | Type: {t} ===\n")
        out.write(content.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\") + "\n\n")

print("Saved to", out_path)
