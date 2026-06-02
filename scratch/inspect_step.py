import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if line_num == 344:
            data = json.loads(line)
            tcs = data.get("tool_calls", [])
            for tc in tcs:
                if tc.get("name") == "replace_file_content":
                    args = tc.get("args", {})
                    target = args.get("TargetContent", "")
                    replacement = args.get("ReplacementContent", "")
                    
                    with open("/Users/admin/conictypst/scratch/step_344_target.txt", "w", encoding="utf-8") as f_out:
                        f_out.write(target)
                    with open("/Users/admin/conictypst/scratch/step_344_replacement.txt", "w", encoding="utf-8") as f_out:
                        f_out.write(replacement)
                    print("Saved step 344 target and replacement content successfully!")
