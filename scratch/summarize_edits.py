import os
import json

edit_dir = "/Users/admin/conictypst/scratch/nang_cao_edits"
files = [f for f in os.listdir(edit_dir) if f.endswith(".json")]
files_sorted = sorted(files, key=lambda x: int(x.split("_")[1]))

for f in files_sorted:
    path = os.path.join(edit_dir, f)
    with open(path, "r", encoding="utf-8") as file:
        data = json.load(file)
    rep_len = len(data["ReplacementContent"]) if data["ReplacementContent"] else 0
    print(f"Edit at line {data['line_num']}: tool={data['tool']} StartLine={data['StartLine']} EndLine={data['EndLine']} RepLen={rep_len}")
