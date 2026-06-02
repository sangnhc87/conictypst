import json
import re

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
recovered_lines = {}

# We scan each step. When we see a view_file response, we will parse the line numbers.
# We will identify view_file responses by step status = "DONE" and checking if the previous step had a view_file tool call on CD-XepGhe-Nang-Cao.typ.
# A simpler way is to check the step data. In the log format, the tool response is often in a step with type "VIEW_FILE" or a step containing the content of the view.
# Let's inspect the JSON structure. The system response is a step of type "VIEW_FILE" or similar, or it contains the tool output.
# In Gemini agent framework, the tool output is delivered to the model in the next step under a specific structure.
# Let's write a robust parser.
with open(log_path, "r", encoding="utf-8") as f:
    # We will read all lines
    steps = [json.loads(line) for line in f if line.strip()]

for idx, step in enumerate(steps):
    tcs = step.get("tool_calls", [])
    for tc in tcs:
        if tc.get("name") == "view_file":
            args = tc.get("args", {})
            if "CD-XepGhe-Nang-Cao.typ" in args.get("AbsolutePath", ""):
                # The next step should contain the tool output
                # Let's check the next step (and maybe the one after it)
                for next_idx in range(idx + 1, min(idx + 3, len(steps))):
                    next_step = steps[next_idx]
                    # Search for viewed content in the next step
                    content = next_step.get("content", "")
                    if not content:
                        # Try to find inside the step recursively
                        def find_content(obj):
                            if isinstance(obj, str) and ("Showing lines" in obj or "1: //" in obj):
                                return obj
                            elif isinstance(obj, dict):
                                for v in obj.values():
                                    res = find_content(v)
                                    if res: return res
                            elif isinstance(obj, list):
                                for item in obj:
                                    res = find_content(item)
                                    if res: return res
                            return None
                        content = find_content(next_step)
                    
                    if content:
                        # Parse the viewed lines
                        for line in content.split("\n"):
                            m = re.match(r'^\s*(\d+):\s?(.*)', line.strip())
                            if m:
                                num = int(m.group(1))
                                text = m.group(2)
                                recovered_lines[num] = text

print(f"Total unique typst lines recovered from view outputs: {len(recovered_lines)}")
missing = []
for i in range(1, 1323):
    if i not in recovered_lines:
        missing.append(i)
print(f"Missing lines (1-1322): {len(missing)}")
if missing:
    print(f"First few missing lines: {missing[:30]}")

# Write to scratch/reconstructed_views_only.typ
with open("/Users/admin/conictypst/scratch/reconstructed_views_only.typ", "w", encoding="utf-8") as f_out:
    max_line = max(recovered_lines.keys()) if recovered_lines else 0
    for i in range(1, max_line + 1):
        content = recovered_lines.get(i, "")
        f_out.write(content + "\n")
print(f"Saved reconstructed file to scratch/reconstructed_views_only.typ")
