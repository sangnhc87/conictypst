import os

files = [
    "/Users/admin/conictypst/scratch/current_views_reconstructed.typ",
    "/Users/admin/conictypst/scratch/reconstructed_original_35.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual_v3.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
]

target = "Bộ (i, j, k)"
out_path = "/Users/admin/conictypst/scratch/found_pie_table.txt"

found = False

for path in files:
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
            if target in content:
                print(f"Found target in {path}")
                pos = content.find(target)
                # Let's extract from the surrounding table block
                table_start = content.rfind("table(", 0, pos)
                if table_start == -1:
                    table_start = pos - 100
                # find matching brace
                braces = 0
                table_end = -1
                for i in range(table_start, len(content)):
                    if content[i] == '(':
                        braces += 1
                    elif content[i] == ')':
                        braces -= 1
                        if braces == 0:
                            table_end = i + 1
                            break
                if table_end != -1:
                    table_code = content[table_start:table_end]
                    with open(out_path, "w", encoding="utf-8") as out:
                        out.write(table_code)
                    print(f"Extracted table code ({len(table_code)} chars) to {out_path}")
                    found = True
                    break

if not found:
    print("Could not find table in any of the reconstructed files.")
