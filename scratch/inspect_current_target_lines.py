import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"

target_lines = [619, 621, 629]

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num in target_lines:
            print(f"=== LINE {line_num} ===")
            try:
                data = json.loads(line)
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    print(f"Tool: {tc.get('name')}")
                    args = tc.get("args", {})
                    for k, v in args.items():
                        if isinstance(v, str) and len(v) > 200:
                            v = v[:200] + "..."
                        print(f"  {k}: {v}")
            except Exception as e:
                pass
