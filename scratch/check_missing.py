with open("/Users/admin/conictypst/scratch/reconstructed_from_views.typ", "r", encoding="utf-8") as f:
    lines = f.readlines()

missing_ranges = []
current_start = None

for idx, line in enumerate(lines, 1):
    if line.startswith("// MISSING LINE"):
        if current_start is None:
            current_start = idx
    else:
        if current_start is not None:
            missing_ranges.append((current_start, idx - 1))
            current_start = None
            
if current_start is not None:
    missing_ranges.append((current_start, len(lines)))

print(f"Total missing ranges: {len(missing_ranges)}")
for start, end in missing_ranges:
    print(f"Missing from line {start} to {end} (count: {end - start + 1})")
