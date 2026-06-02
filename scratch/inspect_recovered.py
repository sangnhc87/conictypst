import os

recovered_path = "/Users/admin/conictypst/scratch/recovered_typst_all.typ"

# Read lines
with open(recovered_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

print(f"Total lines in recovered_typst_all.typ: {len(lines)}")
print("First 50 lines:")
print("-" * 50)
for idx, l in enumerate(lines[:50], 1):
    print(f"{idx}: {l.strip()}")
print("-" * 50)

print("Checking lines 250 to 350 (should contain Chapter 1 start):")
print("-" * 50)
for idx, l in enumerate(lines[250:350], 251):
    print(f"{idx}: {l.strip()}")
print("-" * 50)
