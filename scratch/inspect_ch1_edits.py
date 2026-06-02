import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

lines_to_inspect = [316, 322]

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num in lines_to_inspect:
            data = json.loads(line)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                if tc.get("name") == "replace_file_content":
                    args = tc.get("args", {})
                    target = args.get("TargetContent", "")
                    replacement = args.get("ReplacementContent", "")
                    
                    out_p = f"/Users/admin/conictypst/scratch/step_{line_num}_replacement.txt"
                    with open(out_p, "w", encoding="utf-8") as f_out:
                        f_out.write(replacement)
                    print(f"Saved step {line_num} replacement to {out_p}")
