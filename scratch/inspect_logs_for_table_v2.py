import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/extracted_tables.txt"

matched = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            # We want to search everything in this step
            data_str = json.dumps(data, ensure_ascii=False)
            if "table(" in data_str or "bảng" in data_str.lower():
                matched.append((i, data.get("type"), data.get("source"), data_str))
        except Exception as e:
            pass

print(f"Found {len(matched)} steps matching.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, step_type, source, text in matched:
        out.write(f"=== STEP {idx} | Type: {step_type} | Source: {source} ===\n")
        # Just write the step info, but try to pretty print or extract the table parts
        # If there is a table in there, write it
        out.write(text[:10000] + "\n\n") # limit to 10k chars per step to not make it too huge

print("Extracted matched lines to", out_path)
