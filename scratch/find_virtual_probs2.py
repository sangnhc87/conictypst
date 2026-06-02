path = "/Users/admin/conictypst/scratch/reconstructed_virtual.typ"
with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    if "#prob(" in line:
        # Print the next line (strip whitespace)
        print(f"Line {idx+1}: {lines[idx+1].strip()}")
    elif "#tln(" in line:
        print(f"Line {idx+1}: {lines[idx+1].strip()}")
