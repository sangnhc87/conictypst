import json

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get("step_index") in [244, 245]:
                print(f"--- Step {data.get('step_index')} ({data.get('type')}) ---")
                print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
        except Exception as e:
            pass
