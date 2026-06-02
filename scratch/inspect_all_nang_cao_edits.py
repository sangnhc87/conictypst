import os
import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"
out_dir = "/Users/admin/conictypst/scratch/nang_cao_edits"
os.makedirs(out_dir, exist_ok=True)

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        try:
            data = json.loads(line)
        except Exception:
            continue
        
        tcs = data.get("tool_calls", [])
        for tc in tcs:
            name = tc.get("name")
            args = tc.get("args", {})
            if "CD-XepGhe-Nang-Cao.typ" in args.get("TargetFile", ""):
                if name in ["write_to_file", "replace_file_content", "multi_replace_file_content"]:
                    # Create a summary of this tool call
                    summary = {
                        "line_num": line_num,
                        "tool": name,
                        "StartLine": args.get("StartLine"),
                        "EndLine": args.get("EndLine"),
                        "TargetContent": args.get("TargetContent"),
                        "ReplacementContent": args.get("ReplacementContent"),
                        "ReplacementChunks": args.get("ReplacementChunks")
                    }
                    out_path = os.path.join(out_dir, f"edit_{line_num}_{name}.json")
                    with open(out_path, "w", encoding="utf-8") as out_f:
                        json.dump(summary, out_f, ensure_ascii=False, indent=2)
                    print(f"Saved edit from log line {line_num} to {out_path}")
