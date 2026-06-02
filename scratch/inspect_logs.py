import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for idx, line in enumerate(f):
        if "view_file" in line:
            print(f"Line {idx}: length {len(line)}")
            # print first 200 chars
            print(line[:200])
            print("-" * 50)
