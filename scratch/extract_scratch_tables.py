import os
import re

scratch_dir = "/Users/admin/conictypst/scratch"
files = [
    "current_views_reconstructed.typ",
    "reconstructed_original_35.typ",
    "reconstructed_virtual.typ",
    "reconstructed_virtual_v3.typ",
    "reconstructed_virtual_v4.typ"
]

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

for f in files:
    path = os.path.join(scratch_dir, f)
    if os.path.exists(path):
        try:
            with open(path, "r", encoding="utf-8", errors="ignore") as file:
                content = file.read()
                extracted = extract_tables_from_text(content)
                for t in extracted:
                    if t not in tables:
                        tables.append(t)
        except Exception as e:
            pass

print(f"Found {len(tables)} unique tables in scratch files.")
out_path = os.path.join(scratch_dir, "scratch_extracted_tables.txt")
with open(out_path, "w", encoding="utf-8") as out:
    for idx, table_code in enumerate(tables):
        out.write(f"=== TABLE {idx} ===\n")
        out.write(table_code + "\n\n")

print("Saved to", out_path)
