import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

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
                    print(f"Line {line_num}: Tool {name} with args: {list(args.keys())}")
                    if name == "write_to_file":
                        print("  Overwrite:", args.get("Overwrite"))
                        print("  CodeContent length:", len(args.get("CodeContent", "")))
                    elif name == "replace_file_content":
                        print("  StartLine:", args.get("StartLine"))
                        print("  EndLine:", args.get("EndLine"))
                        print("  TargetContent length:", len(args.get("TargetContent", "")))
                        print("  ReplacementContent length:", len(args.get("ReplacementContent", "")))
                    elif name == "multi_replace_file_content":
                        print("  Chunks count:", len(args.get("ReplacementChunks", [])))
