import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for idx, line in enumerate(f):
        try:
            step = json.loads(line)
            step_idx = step.get("step_index")
            if step_idx in [126, 127, 128, 129]:
                # Print keys and previews of values
                print(f"Step {step_idx} (Line {idx}):")
                for k, v in step.items():
                    val_str = str(v)
                    if len(val_str) > 100:
                        val_str = val_str[:100] + "..."
                    print(f"  {k}: {val_str}")
        except Exception:
            pass
