import json

log_path = "/Users/admin/.gemini/antigravity/brain/2d6973ac-456d-45f3-82a9-3dc2e9f44f01/.system_generated/logs/transcript.jsonl"

with open(log_path, "r", encoding="utf-8") as f:
    for line_num, line in enumerate(f, 1):
        if "recap-box" in line or "ex-box" in line:
            # We filter out lines that look like they contain python code
            if "def find_let" in line or "search_box_defs_full.py" in line:
                continue
            if "#let recap-box" in line or "let recap-box" in line or "#let ex-box" in line:
                try:
                    data = json.loads(line)
                    def search(obj):
                        if isinstance(obj, str) and ("let recap-box" in obj or "let ex-box" in obj) and "def find_let" not in obj:
                            print(f"Match found in step {line_num}!")
                            print("-" * 50)
                            print(obj[:1000]) # print first 1000 characters
                            print("-" * 50)
                            with open(f"/Users/admin/conictypst/scratch/real_box_def_{line_num}.txt", "w", encoding="utf-8") as out_f:
                                out_f.write(obj)
                        elif isinstance(obj, dict):
                            for v in obj.values():
                                search(v)
                        elif isinstance(obj, list):
                            for item in obj:
                                search(item)
                    search(data)
                except Exception as e:
                    pass
