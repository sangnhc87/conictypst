import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"

if os.path.exists(log_path):
    print("Reading current log file...")
    with open(log_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            if line_num > 600:
                break
            try:
                data = json.loads(line)
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    func_name = tc.get("name")
                    args = tc.get("args", {})
                    # If it uses a shell command or file editing tool
                    if func_name in ["run_command", "write_to_file", "replace_file_content", "multi_replace_file_content"]:
                        print(f"Line {line_num}: Tool={func_name}")
                        for k, v in args.items():
                            if isinstance(v, str) and len(v) > 150:
                                v = v[:150] + "..."
                            print(f"  {k}: {v}")
            except Exception as e:
                pass
