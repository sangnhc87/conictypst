import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
            # We look for view_file tool calls or their outputs
            tool_calls = data.get("tool_calls", [])
            for tc in tool_calls:
                func_name = tc.get("name")
                args = tc.get("args", {})
                target_file = args.get("AbsolutePath", "")
                if "CD-DaiSo-ToHop-content.typ" in target_file and func_name == "view_file":
                    print(f"Line {line_num}: view_file args={args}")
            
            # Also check if it's the response of view_file
            if data.get("type") == "VIEW_FILE" or (data.get("source") == "SYSTEM" and "File Path" in data.get("content", "")):
                content = data.get("content", "")
                if "CD-DaiSo-ToHop-content.typ" in content:
                    lines = content.splitlines()
                    print(f"Line {line_num}: view_file response, output lines={len(lines)}, preview={lines[0][:100] if lines else ''}")
        except Exception as e:
            pass
