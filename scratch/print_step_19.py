import json

log_path = "/Users/admin/.gemini/antigravity/brain/097aae0d-3fd0-4ff0-8665-546bd204d15d/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get("step_index") == 19:
                print("--- Step 19 (write_to_file) ---")
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    if tc.get("name") == "write_to_file":
                        args = tc.get("args", {})
                        print(args.get("CodeContent"))
        except Exception as e:
            pass
