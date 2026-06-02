import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                func_name = tc.get("name")
                args = tc.get("args", {})
                target_file = args.get("TargetFile", "") or args.get("AbsolutePath", "")
                if "CD-DaiSo-ToHop-content.typ" in target_file:
                    if func_name == "write_to_file":
                        print(f"Line {line_num}: write_to_file, Overwrite={args.get('Overwrite')}, len={len(args.get('CodeContent', ''))}")
                    elif func_name == "view_file":
                        print(f"Line {line_num}: view_file, StartLine={args.get('StartLine')}, EndLine={args.get('EndLine')}")
        except Exception as e:
            pass
