import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line, strict=False)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                func = tc.get("name")
                args = tc.get("args", {})
                cmd = args.get("CommandLine", "")
                if "restore" in cmd or "checkout" in cmd or "cp " in cmd:
                    print(f"Line {line_num}: Tool={func}, CommandLine={cmd}")
                target = args.get("TargetFile", "")
                if "CD-DaiSo-ToHop-content.typ" in target and func == "write_to_file":
                    print(f"Line {line_num}: Tool={func}, Target={target}, Overwrite={args.get('Overwrite')}")
        except Exception as e:
            pass
