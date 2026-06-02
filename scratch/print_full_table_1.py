import os

scratch_dir = "/Users/admin/conictypst/scratch"
files = [
    "current_views_reconstructed.typ",
    "reconstructed_original_35.typ",
    "reconstructed_virtual.typ",
    "reconstructed_virtual_v3.typ",
    "reconstructed_virtual_v4.typ"
]

target = "columns: (1.5fr, 3fr, 2.5fr, 1.2fr)"

for f in files:
    path = os.path.join(scratch_dir, f)
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8", errors="ignore") as file:
            content = file.read()
            if target in content:
                print(f"Found target in {f}")
                pos = content.find(target)
                # Find the surrounding #table( ... ) block or just print next 1500 chars
                # Let's search backwards to find the #table(
                table_start = content.rfind("table(", 0, pos)
                if table_start == -1:
                    table_start = pos
                print(content[table_start:table_start+3000])
                print("="*60)
