import json
import numpy as np

with open('bubbles_ds-20-ngang-300.json', 'r') as f:
    bubs = json.load(f)

# Sort by X to find columns
xs = sorted([b['x'] for b in bubs])
cols = []
current_col = []
for x in xs:
    if not current_col: current_col.append(x)
    elif x - current_col[-1] <= 10: current_col.append(x)
    else:
        cols.append(int(np.mean(current_col)))
        current_col = [x]
if current_col: cols.append(int(np.mean(current_col)))

cols = [c for c in cols if 30 < c < 1450] # remove markers

ys = sorted([b['y'] for b in bubs])
rows = []
current_row = []
for y in ys:
    if not current_row: current_row.append(y)
    elif y - current_row[-1] <= 10: current_row.append(y)
    else:
        rows.append(int(np.mean(current_row)))
        current_row = [y]
if current_row: rows.append(int(np.mean(current_row)))
rows = [r for r in rows if 30 < r < 1050] # remove markers

print(f"Detected {len(cols)} columns")
print(f"Detected {len(rows)} rows")

# We expect 250 bubbles.
# Header has 9 cols x 10 rows (SBD + Ma de)
# TF has 10 cols x 16 rows (if we treat each Đ/S bubble as a separate column? No, 2 columns per group * 4 groups = 8 columns in TF!)
# Wait, 20 questions * 8 bubbles = 160 bubbles.
# 160 bubbles / 8 columns = 20 bubbles per column.

# I will just find the actual missing grid intersections.
# Let's map each bubble to its (col_idx, row_idx)
grid = set()
for b in bubs:
    c = min(cols, key=lambda x: abs(x - b['x']))
    r = min(rows, key=lambda y: abs(y - b['y']))
    grid.add((c, r))

missing = 0
added_bubs = []
for c in cols:
    for r in rows:
        # Check if there are other bubbles in this col and row to infer it's a valid intersection
        col_count = sum(1 for (cx, cy) in grid if cx == c)
        row_count = sum(1 for (cx, cy) in grid if cy == r)
        
        # SBD/Ma de rows are top 10 rows
        # TF rows are bottom 20 rows
        if col_count > 5 and row_count > 2:
            if (c, r) not in grid:
                # Is it expected to be a bubble here?
                # We can visually or heuristically check
                missing += 1
                added_bubs.append({'x': c, 'y': r, 'r': 12})
                grid.add((c, r))

print(f"Added {missing} missing bubbles heuristically.")
bubs.extend(added_bubs)

# Clean up marker false positives
bubs = [b for b in bubs if 30 < b['x'] < 1450 and 30 < b['y'] < 1050]
print(f"Total bubbles after clean: {len(bubs)}")
with open('bubbles_ds-20-ngang-300-filled.json', 'w') as f:
    json.dump(bubs, f)
