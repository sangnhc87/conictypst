import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
target_path = "/Users/admin/conictypst/typst/exams/CD-XepGhe-Nang-Cao.typ"

# We will collect lines by line number to ensure they are complete and in order.
file_lines = {}

with open(log_path, "r", encoding="utf-8") as f:
    for line in f:
        try:
            step = json.loads(line)
        except Exception:
            continue
        
        # Look for model tool calls or system responses of view_file
        # Let's inspect all steps. If it's a step with view_file outputs, let's extract.
        if "tool_calls" in step:
            # Check if this was a view_file call for our target file
            for tc in step["tool_calls"]:
                if tc.get("name") == "view_file":
                    args = tc.get("args", {})
                    if "CD-XepGhe-Nang-Cao.typ" in args.get("AbsolutePath", ""):
                        # Find the output of this tool call
                        # In jsonl, the output is in the next steps or under response
                        pass
        
        # More simply, let's just scan all string content in the step for lines matching `<num>: <content>`
        # especially inside "content" or "response"
        content_str = json.dumps(step, ensure_ascii=False)
        # Search for lines like: "1: // ════"
        # Since JSON encodes newlines as \n, we split by \n or look at raw content
        for m in re.finditer(r'(\\n|")(\d+): (.*?)((\\n)|")', content_str):
            line_num = int(m.group(2))
            line_content = m.group(3)
            # JSON escape cleanup if any
            # e.g., if there are escaped double quotes \" -> "
            line_content = line_content.replace('\\"', '"').replace('\\\\', '\\')
            if line_num <= 1397:
                file_lines[line_num] = line_content

print(f"Collected {len(file_lines)} lines.")
# Check if any lines are missing
missing = []
for i in range(1, 1398):
    if i not in file_lines:
        missing.append(i)

if missing:
    print(f"Warning: Missing lines: {missing[:20]}... total missing: {len(missing)}")

# Write to target
with open(target_path, "w", encoding="utf-8") as f:
    for i in range(1, 1398):
        content = file_lines.get(i, "")
        f.write(content + "\n")

print("File restored successfully!")
