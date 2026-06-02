import os
import json

edit_dir = "/Users/admin/conictypst/scratch/nang_cao_edits"
files = [f for f in os.listdir(edit_dir) if f.endswith(".json")]
files_sorted = sorted(files, key=lambda x: int(x.split("_")[1]))

for f in files_sorted:
    path = os.path.join(edit_dir, f)
    with open(path, "r", encoding="utf-8") as file:
        data = json.load(file)
    
    line_num = data["line_num"]
    tool = data["tool"]
    start = data["StartLine"]
    end = data["EndLine"]
    target = data["TargetContent"]
    rep = data["ReplacementContent"]
    
    target_len = len(target) if target else 0
    rep_len = len(rep) if rep else 0
    
    print(f"Log line {line_num}: StartLine={start} EndLine={end} TargetLen={target_len} RepLen={rep_len}")
    if target_len > 0:
        print(f"  Target first 50 chars: {repr(target[:50])}")
    if rep_len > 0:
        print(f"  Replacement first 50 chars: {repr(rep[:50])}")
