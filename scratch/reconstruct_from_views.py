import json
import re
import os

log_path = "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl"

reconstructed_lines = {}

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        # We only look at messages between line 4800 and 5050 to get the late stage
        if 4800 <= line_num <= 5050:
            try:
                data = json.loads(line)
                content = data.get("content", "")
                if "CD-DaiSo-ToHop-content.typ" in content:
                    # Let's find all lines of the form: <number>: <original_line>
                    # Example: "25:   radius: (right: 8pt), inset: (x: 16pt, y: 14pt), width: 100%,"
                    for l in content.splitlines():
                        m = re.match(r'^(\d+):\s(.*)', l)
                        if m:
                            l_num = int(m.group(1))
                            l_text = m.group(2)
                            reconstructed_lines[l_num] = l_text
            except Exception as e:
                pass

print(f"Total lines reconstructed: {len(reconstructed_lines)}")
if reconstructed_lines:
    max_line = max(reconstructed_lines.keys())
    print(f"Max line number: {max_line}")
    
    # Save the reconstructed file
    out_path = "/Users/admin/conictypst/scratch/reconstructed_from_views.typ"
    with open(out_path, "w", encoding="utf-8") as out_f:
        for i in range(1, max_line + 1):
            if i in reconstructed_lines:
                out_f.write(reconstructed_lines[i] + "\n")
            else:
                out_f.write(f"// MISSING LINE {i}\n")
    print(f"Saved to {out_path}")
