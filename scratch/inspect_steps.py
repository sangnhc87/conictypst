import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for idx, line in enumerate(f):
        try:
            step = json.loads(line)
            step_idx = step.get("step_index")
            if step_idx is not None and 120 <= step_idx <= 135:
                print(f"Line {idx}: step_index {step_idx}, source {step.get('source')}, type {step.get('type')}, length {len(line)}")
        except Exception:
            pass
