import json
import os

log_files = [
    "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl",
    "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"
]

for log_path in log_files:
    if not os.path.exists(log_path):
        continue
    print(f"=== {log_path} ===")
    with open(log_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            try:
                data = json.loads(line)
                # print any step that writes or modifies CD-DaiSo-ToHop-content.typ
                tcs = data.get("tool_calls", [])
                for tc in tcs:
                    func_name = tc.get("name") # Wait, in JSONL it might be "name" or function -> name.
                    # Let's print the tool call keys
                    args = tc.get("args", {})
                    target_file = args.get("TargetFile", "")
                    if "CD-DaiSo-ToHop-content.typ" in target_file:
                        print(f"Line {line_num}: Tool={func_name}, keys={list(args.keys())}")
            except Exception as e:
                pass
