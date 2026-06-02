import json
import os
import re

log_path = "/Users/admin/.gemini/antigravity/brain/e11ca529-f9f3-4f16-b3ca-9d8a585a0de3/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/extracted_pie_tables.txt"

tables = []

def extract_tables_from_text(text):
    results = []
    for m in re.finditer(r'#?table\(', text):
        start_idx = m.start()
        brace_count = 0
        end_idx = -1
        for i in range(start_idx, len(text)):
            if text[i] == '(':
                brace_count += 1
            elif text[i] == ')':
                brace_count -= 1
                if brace_count == 0:
                    end_idx = i + 1
                    break
        if end_idx != -1:
            table_code = text[start_idx:end_idx]
            results.append(table_code)
    return results

with open(log_path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        try:
            data = json.loads(line)
            data_str = json.dumps(data, ensure_ascii=False)
            if "table(" in data_str:
                extracted = extract_tables_from_text(data_str)
                for t in extracted:
                    t_clean = t.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\")
                    if t_clean not in tables:
                        tables.append((i, t_clean))
        except Exception as e:
            pass

print(f"Found {len(tables)} tables in e11c.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, table_code in tables:
        out.write(f"=== TABLE FROM STEP {idx} ===\n")
        out.write(table_code + "\n\n")

print("Saved to", out_path)
