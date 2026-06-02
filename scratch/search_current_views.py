import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line, strict=False)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                func = tc.get("name")
                args = tc.get("args", {})
                target = args.get("AbsolutePath", "")
                if "CD-DaiSo-ToHop-content.typ" in target and func == "view_file":
                    print(f"Line {line_num}: view_file Start={args.get('StartLine')}, End={args.get('EndLine')}")
            
            # check system/model outputs
            content = data.get("content", "")
            if "CD-DaiSo-ToHop-content.typ" in content and "Showing lines" in content:
                lines = content.splitlines()
                print(f"Line {line_num}: Output containing lines of CD-DaiSo-ToHop-content.typ (len={len(lines)})")
        except Exception as e:
            pass
