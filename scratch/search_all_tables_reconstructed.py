import os
import re

files = [
    "/Users/admin/conictypst/scratch/current_views_reconstructed.typ",
    "/Users/admin/conictypst/scratch/reconstructed_original_35.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual_v3.typ",
    "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
]

for path in files:
    if os.path.exists(path):
        with open(path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
            matches = list(re.finditer(r'#?table\(', content))
            print(f"File: {path} has {len(matches)} tables:")
            for m in matches[:10]:
                start = m.start()
                snippet = content[start:start+200]
                print(f"  Pos {start}: {repr(snippet)}")
        print("-" * 50)
