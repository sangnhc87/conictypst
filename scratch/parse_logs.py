import json
import re
import os

log_files = [
    "/Users/admin/.gemini/antigravity/brain/88157e79-ef93-468a-b494-31e77d76f5ee/.system_generated/logs/transcript.jsonl",
    "/Users/admin/.gemini/antigravity/brain/22448e07-9cd2-464e-881c-4bbb53abe90a/.system_generated/logs/transcript.jsonl"
]

all_mentions = []

for log_path in log_files:
    if not os.path.exists(log_path):
        print(f"File not found: {log_path}")
        continue
    print(f"Processing {log_path}...")
    with open(log_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            try:
                data = json.loads(line)
                # We search for writes or replaces to CD-DaiSo-ToHop-content.typ
                # Or tool calls that might contain the content
                tool_calls = data.get("tool_calls", [])
                for tc in tool_calls:
                    func_name = tc.get("function", {}).get("name")
                    args = tc.get("function", {}).get("arguments", {})
                    
                    if not args:
                        continue
                        
                    # Some tools might have TargetFile or CodeContent or ReplacementContent or similar
                    target_file = args.get("TargetFile", "")
                    if "CD-DaiSo-ToHop-content.typ" in target_file:
                        code_content = args.get("CodeContent")
                        rep_chunks = args.get("ReplacementChunks")
                        rep_content = args.get("ReplacementContent")
                        
                        if code_content:
                            print(f"Found CodeContent at line {line_num} in {os.path.basename(log_path)}, length {len(code_content)}")
                            all_mentions.append(("write", code_content, line_num, log_path))
                        if rep_content:
                            print(f"Found ReplacementContent at line {line_num} in {os.path.basename(log_path)}, length {len(rep_content)}")
                            all_mentions.append(("replace", rep_content, line_num, log_path))
                        if rep_chunks:
                            print(f"Found ReplacementChunks at line {line_num} in {os.path.basename(log_path)}")
                            for idx, chunk in enumerate(rep_chunks):
                                chunk_content = chunk.get("ReplacementContent")
                                if chunk_content:
                                    all_mentions.append((f"chunk_{idx}", chunk_content, line_num, log_path))
                                    
                # Also check tool outputs if they contain viewed files
                # For example, view_file output contains file content.
                if data.get("type") == "VIEW_FILE" or data.get("status") == "DONE":
                    content = data.get("content", "")
                    if "CD-DaiSo-ToHop-content.typ" in content:
                        # Find the actual text output
                        all_mentions.append(("view", content, line_num, log_path))
            except Exception as e:
                # ignore decode errors or missing keys
                pass

print(f"Total mentions gathered: {len(all_mentions)}")

# Let's save them to a file for examination
out_path = "/Users/admin/conictypst/scratch/extracted_mentions.txt"
with open(out_path, "w", encoding="utf-8") as out_f:
    for item_type, content, line_num, log_path in all_mentions:
        out_f.write(f"=== TYPE: {item_type} | LINE: {line_num} | PATH: {log_path} ===\n")
        out_f.write(content[:1000] + "\n... (truncated)\n\n")

print(f"Saved to {out_path}")
