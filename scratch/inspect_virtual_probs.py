path = "/Users/admin/conictypst/scratch/reconstructed_virtual_v4.typ"
with open(path, "r", encoding="utf-8") as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    if "#prob" in line:
        print(f"Line {idx+1}: {line.strip()}")
        # print next 3 lines
        for j in range(1, 4):
            if idx + j < len(lines):
                print(f"  + {lines[idx+j].strip()}")
