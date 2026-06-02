import json

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num >= 4980:
            try:
                data = json.loads(line, strict=False)
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    func = tc.get("name")
                    args = tc.get("args", {})
                    print(f"Line {line_num}: Tool={func}")
                    for k, v in args.items():
                        if isinstance(v, str) and len(v) > 200:
                            v = v[:200] + "..."
                        print(f"  {k}: {v}")
                
                content = data.get("content", "")
                if content and ("git" in content or "cp" in content or "checkout" in content or "error" in content or "restored" in content or "backup" in content):
                    print(f"Line {line_num} Output: {content[:300]}")
            except Exception as e:
                pass
