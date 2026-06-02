import json

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
            step_idx = data.get("step_index")
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                func_name = tc.get("name")
                args = tc.get("args", {})
                if "lich-su-dai-so-to-hop.typ" in str(args.get("TargetFile", "")):
                    print(f"Step {step_idx} (Line {line_num}): {func_name} on {args.get('TargetFile')}")
                    if func_name == "write_to_file":
                        content = args.get("CodeContent", "")
                        print(f"  CodeContent length: {len(content)}")
                        if len(content) > 100:
                            print(f"  First 100 chars: {content[:100]}")
                            print(f"  Last 100 chars: {content[-100:]}")
        except Exception as e:
            pass
