import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
        except Exception:
            continue
        
        tcs = data.get("tool_calls", [])
        for tc in tcs:
            if tc.get("name") == "view_file":
                args = tc.get("args", {})
                if "CD-XepGhe-Nang-Cao.typ" in args.get("AbsolutePath", ""):
                    print(f"Line {line_num}: view_file StartLine={args.get('StartLine')} EndLine={args.get('EndLine')}")
