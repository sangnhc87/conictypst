import json

log_path = "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line, strict=False)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                args = tc.get("args", {})
                target = args.get("TargetFile", "")
                if "CD-DaiSo-ToHop-content.typ" in target:
                    print(f"Log Line {line_num}: Step {data.get('step_index')}, Tool={tc.get('name')}")
        except Exception as e:
            pass
