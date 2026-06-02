import json
import glob
import os

brain_dir = "/Users/admin/.gemini/antigravity/brain"
log_paths = glob.glob(os.path.join(brain_dir, "*/.system_generated/logs/transcript.jsonl"))

for path in log_paths:
    print(f"Checking {path}...")
    try:
        with open(path, "r", encoding="utf-8") as f:
            for line_num, line in enumerate(f, 1):
                if "CD-DaiSo-ToHop-content.typ" in line:
                    data = json.loads(line)
                    tcs = data.get("tool_calls", [])
                    for tc in tcs:
                        args = tc.get("args", {})
                        target = args.get("TargetFile", "")
                        if "CD-DaiSo-ToHop-content.typ" in target:
                            func = tc.get("name")
                            # If it's a write or replacement, let's print details
                            code_len = len(args.get("CodeContent", ""))
                            rep_len = len(args.get("ReplacementContent", ""))
                            chunks = args.get("ReplacementChunks", "")
                            chunks_count = len(chunks) if isinstance(chunks, list) else (len(json.loads(chunks)) if isinstance(chunks, str) and chunks.strip().startswith("[") else 0)
                            if code_len > 0 or rep_len > 0 or chunks_count > 0:
                                print(f"  Line {line_num}: Tool={func}, CodeContent len={code_len}, RepContent len={rep_len}, Chunks count={chunks_count}")
    except Exception as e:
        print(f"  Error reading: {e}")
