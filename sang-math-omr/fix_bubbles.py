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

# Filter out markers (x < 30 or x > 1450)
cols = [c for c in cols if 30 < c < 1450]
print(f"Detected {len(cols)} columns: {cols}")

# Same for rows
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

# Filter out markers
rows = [r for r in rows if 30 < r < 1050]
print(f"Detected {len(rows)} rows: {len(rows)}")

# SBD is first 6 columns. Mã đề is next 3 columns.
# TF is the rest.
