import json
import os
import re

log_path = "/Users/admin/.gemini/antigravity/brain/5471d837-a644-42ab-9263-2b18668e714e/.system_generated/logs/transcript.jsonl"
out_path = "/Users/admin/conictypst/scratch/all_extracted_tables.txt"

tables = []

# Regex to find table( or #table(
# We will extract from the word "table(" up to the matching ")"
def extract_tables_from_text(text):
    results = []
    # Find all start indices of table( or #table(
    for m in re.finditer(r'#?table\(', text):
        start_idx = m.start()
        # Find matching closing parenthesis
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
                    # Unescape newlines if any
                    t_clean = t.replace("\\n", "\n").replace('\\"', '"').replace("\\\\", "\\")
                    if t_clean not in tables:
                        tables.append((i, t_clean))
        except Exception as e:
            pass

print(f"Found {len(tables)} unique tables.")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, table_code in tables:
        out.write(f"=== TABLE FROM STEP {idx} ===\n")
        out.write(table_code + "\n\n")

print("Saved to", out_path)
