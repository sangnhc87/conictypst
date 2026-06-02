import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/original_file_content.txt"

matched_steps = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            data_str = json.dumps(data, ensure_ascii=False)
            if "CD-XepGhe-KhongKe.typ" in data_str:
                matched_steps.append((i, data.get("type"), len(data_str)))
        except Exception as e:
            pass

print(f"Found {len(matched_steps)} matching steps:")
for idx, step_type, size in matched_steps:
    print(f"Line {idx} | Type: {step_type} | Size: {size}")

