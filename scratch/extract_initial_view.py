import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

found_tool_call = False
with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
        except Exception:
            continue
        
        if found_tool_call:
            content = data.get("content", "")
            if "Showing lines" in content or "1: //" in content:
                with open("/Users/admin/conictypst/scratch/initial_view.txt", "w", encoding="utf-8") as f_out:
                    f_out.write(content)
                print(f"Saved initial view from line {line_num}!")
                break
            
            found_str = [False]
            def search_obj(obj):
                if isinstance(obj, str) and ("1: //" in obj or "Showing lines" in obj):
                    with open("/Users/admin/conictypst/scratch/initial_view.txt", "w", encoding="utf-8") as f_out:
                        f_out.write(obj)
                    print(f"Saved initial view from line {line_num} (nested string)!")
                    found_str[0] = True
                elif isinstance(obj, dict):
                    for k, v in obj.items():
                        if not found_str[0]:
                            search_obj(v)
                elif isinstance(obj, list):
                    for item in obj:
                        if not found_str[0]:
                            search_obj(item)
            search_obj(data)
            if found_str[0]:
                break
                
        tcs = data.get("tool_calls", [])
        for tc in tcs:
            if tc.get("name") == "view_file":
                args = tc.get("args", {})
                if "CD-XepGhe-Nang-Cao.typ" in args.get("AbsolutePath", ""):
                    print(f"Found view_file tool call at line {line_num}")
                    found_tool_call = True
