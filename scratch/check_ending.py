import os
import json

recovered_path = "/Users/admin/conictypst/scratch/reconstructed_views_only.typ"
if os.path.exists(recovered_path):
    with open(recovered_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    print(f"Total lines: {len(lines)}")
    # Print lines that are not empty and are near the end
    print("Checking lines from 1000 to end in reconstructed_views_only.typ:")
    print("-" * 50)
    # Let us check keys from the python execution of parse_views_only.py
    # Since reconstructed_views_only.typ is just written sequentially, let us print its last 100 lines.
    for idx, l in enumerate(lines[-100:], len(lines) - 100 + 1):
        print(f"{idx}: {l.strip()}")
    print("-" * 50)
else:
    print("reconstructed_views_only.typ does not exist")
