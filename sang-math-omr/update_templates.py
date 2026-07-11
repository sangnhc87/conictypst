import json
import numpy as np

with open("bubbles.json", "r") as f:
    bubbles = json.load(f)
bubbles.sort(key=lambda b: (b['x'], b['y']))

# Generate template object
sbd = []
made = []
mcq = {}
tf = {}
tln = {}

# SBD is in first 6 columns. There are 10 rows.
# Mã đề is in next 3 columns. 10 rows.
# Since we sorted by X then Y, we can just split bubbles.
xs = sorted(list(set([b['x'] for b in bubbles])))
cols = []
current_col = []
for x in xs:
    if not current_col: current_col.append(x)
    elif x - current_col[-1] <= 5: current_col.append(x)
    else:
        cols.append(int(np.mean(current_col)))
        current_col = [x]
if current_col: cols.append(int(np.mean(current_col)))

col_bubbles = []
for i in range(len(cols)):
    cb = [b for b in bubbles if abs(b['x'] - cols[i]) <= 5]
    cb.sort(key=lambda b: b['y'])
    col_bubbles.append(cb)

# 0-5: SBD (10 rows, 6 cols) -> SBD[row][col]
sbd = []
for r in range(10):
    row = []
    for c in range(6):
        b = col_bubbles[c][r]
        row.append([b['x'], b['y']])
    sbd.append(row)

# 6: Tracking marker ?
# 7-9: Mã đề (10 rows, 3 cols)
made = []
for r in range(10):
    row = []
    # wait, col 6 had 1 bubble, col 7 had 10.
    # col 7, 8, 9 are Mã đề!
    for c in range(3):
        b = col_bubbles[c+7][r]
        row.append([b['x'], b['y']])
    made.append(row)

# The mapping from here requires some careful logic. I will output the python script to dump the json first.
