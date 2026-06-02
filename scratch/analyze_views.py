import json

with open("/Users/admin/conictypst/scratch/extracted_views.json", "r", encoding="utf-8") as f:
    views = json.load(f)

for v in views:
    # Let's count how many lines were extracted and whether they are truncated
    lines = v.get("lines", {})
    # Check if there is any gap in the keys or if the total line count is less than expected
    start = v.get("start")
    end = v.get("end")
    expected = end - start + 1
    actual = len(lines)
    
    # We can reconstruct the text to check if it has "<truncated"
    is_truncated = False
    for l_num, text in lines.items():
        if "<truncated" in text:
            is_truncated = True
            
    print(f"Step {v['step_index']}: File {v.get('filepath')}")
    print(f"  Range: {start} to {end} (Expected: {expected}, Actual lines: {actual})")
    print(f"  Is Truncated: {is_truncated}")
