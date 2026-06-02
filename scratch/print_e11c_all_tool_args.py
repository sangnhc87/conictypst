import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_dir = "/Users/admin/conictypst/scratch"

found_count = 0

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            tool_calls = data.get("tool_calls", [])
            for tc in tool_calls:
                args = tc.get("args", {})
                args_str = json.dumps(args, ensure_ascii=False)
                if "Bảng tính toán đóng góp chi tiết" in args_str:
                    repl = args.get("ReplacementContent", "")
                    if repl:
                        filename = f"pie_table_match_{found_count}.txt"
                        filepath = os.path.join(out_dir, filename)
                        with open(filepath, "w", encoding="utf-8") as out:
                            out.write(repl)
                        print(f"Match {found_count} (step line {i}): wrote {len(repl)} chars to {filepath}")
                        found_count += 1
        except Exception as e:
            pass

print(f"Total matches written: {found_count}")
