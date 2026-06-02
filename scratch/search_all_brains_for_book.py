import os
import json

brain_dir = "/Users/admin/.gemini/antigravity/brain"
found_count = 0

for root, dirs, files in os.walk(brain_dir):
    for file in files:
        if file == "transcript.jsonl":
            filepath = os.path.join(root, file)
            found_count += 1
            try:
                with open(filepath, "r", encoding="utf-8") as f:
                    for line_num, line in enumerate(f, 1):
                        if "lich-su-dai-so-to-hop.typ" in line:
                            try:
                                data = json.loads(line)
                                step_idx = data.get("step_index")
                                tcs = data.get("tool_calls", [])
                                for tc in tcs:
                                    func_name = tc.get("name")
                                    args = tc.get("args", {})
                                    if "lich-su-dai-so-to-hop.typ" in str(args.get("TargetFile", "")):
                                        print(f"File {filepath} (Step {step_idx}, Line {line_num}): Tool={func_name}")
                                        if func_name == "write_to_file":
                                            cc = args.get("CodeContent", "")
                                            print(f"  CodeContent length: {len(cc)}")
                                            if len(cc) > 5000:
                                                print(f"  Found large content! First 100 chars: {cc[:100]}")
                            except Exception:
                                pass
            except Exception as e:
                print(f"Error reading {filepath}: {e}")

print(f"Total transcript files searched: {found_count}")
