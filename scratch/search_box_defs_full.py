import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if "recap-box" in line or "ex-box" in line:
            # We want to see if this contains the Typst definition
            if "#let recap-box" in line or "let recap-box" in line:
                try:
                    data = json.loads(line)
                    # Let's find any string field that contains the definition
                    def search(obj):
                        if isinstance(obj, str) and ("let recap-box" in obj or "let ex-box" in obj):
                            with open(f"/Users/admin/conictypst/scratch/box_def_found_{line_num}.txt", "w", encoding="utf-8") as out_f:
                                out_f.write(obj)
                            print(f"Saved matching text from step {line_num} to scratch/box_def_found_{line_num}.txt")
                        elif isinstance(obj, dict):
                            for v in obj.values():
                                search(v)
                        elif isinstance(obj, list):
                            for item in obj:
                                search(item)
                    search(data)
                except Exception as e:
                    print(f"Error at step {line_num}: {e}")
