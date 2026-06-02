import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for idx, line in enumerate(f):
        try:
            step = json.loads(line)
            step_idx = step.get("step_index")
            if step_idx in [124, 126, 128]:
                content = step.get("content", "")
                lines = content.split("\n")
                print(f"Step {step_idx} content has {len(lines)} lines. Preview of last 5 lines:")
                for l in lines[-5:]:
                    print(f"  {l}")
        except Exception as e:
            pass
