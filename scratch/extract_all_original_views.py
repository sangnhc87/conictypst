import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_dir = "/Users/admin/conictypst/scratch/views"
os.makedirs(out_dir, exist_ok=True)

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            if data.get("type") == "VIEW_FILE":
                data_str = json.dumps(data, ensure_ascii=False)
                if "CD-XepGhe-KhongKe.typ" in data_str:
                    content = data.get("content", "")
                    if content:
                        # Write content to a file named after the step index i
                        filename = f"step_{i}_view.txt"
                        filepath = os.path.join(out_dir, filename)
                        with open(filepath, "w", encoding="utf-8") as out:
                            out.write(content)
                        print(f"Wrote log step {i} to {filepath} (size: {len(content)})")
        except Exception as e:
            pass
