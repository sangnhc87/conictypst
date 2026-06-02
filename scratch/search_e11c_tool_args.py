import json
import os

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/untruncated_pie_table.txt"

found = []

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            tool_calls = data.get("tool_calls", [])
            for tc in tool_calls:
                args = tc.get("args", {})
                args_str = json.dumps(args, ensure_ascii=False)
                if "Bảng tính toán đóng góp chi tiết" in args_str:
                    print(f"Found match in tool_call at line {i}, tool: {tc.get('name')}")
                    # Write the arguments of this tool call
                    found.append((i, tc.get("name"), args))
        except Exception as e:
            pass

print(f"Total matches found: {len(found)}")
if found:
    # Let's write the first match to our output file
    line_num, tool_name, args = found[0]
    with open(out_path, "w", encoding="utf-8") as out:
        out.write(f"=== TOOL CALL {tool_name} AT LOG LINE {line_num} ===\n")
        out.write(json.dumps(args, indent=2, ensure_ascii=False))
    print("Saved to", out_path)
else:
    print("No matching tool call arguments found.")
