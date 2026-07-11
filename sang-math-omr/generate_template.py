import json
import numpy as np

with open("bubbles.json", "r") as f:
    bubbles = json.load(f)

# Filter out false positives (y < 100)
bubbles = [b for b in bubbles if b['y'] > 100]

top_bubbles = [b for b in bubbles if b['y'] < 550]
bottom_bubbles = [b for b in bubbles if b['y'] > 550]

def get_columns(bubs):
    xs = sorted(list(set([b['x'] for b in bubs])))
    cols = []
    current_col = []
    for x in xs:
        if not current_col: current_col.append(x)
        elif x - current_col[-1] <= 12: current_col.append(x)
        else:
            cols.append(int(np.mean(current_col)))
            current_col = [x]
    if current_col: cols.append(int(np.mean(current_col)))

    col_bubbles = []
    for i in range(len(cols)):
        cb = [b for b in bubs if abs(b['x'] - cols[i]) <= 12]
        cb.sort(key=lambda b: b['y'])
        col_bubbles.append(cb)
    return col_bubbles

top_cols = get_columns(top_bubbles)
bottom_cols = get_columns(bottom_bubbles)

print(f"Top columns: {len(top_cols)}")
print(f"Bottom columns: {len(bottom_cols)}")

# SBD: 6 cols
sbd = []
for r in range(10):
    row = []
    for c in range(6):
        b = top_cols[c][r]
        row.append([b['x'], b['y']])
    sbd.append(row)

# Mã đề: 3 cols
made = []
for r in range(10):
    row = []
    for c in range(3):
        b = top_cols[c+6][r]
        row.append([b['x'], b['y']])
    made.append(row)

# MCQ: 12 cols, 3 groups of 4 cols
# The columns are top_cols[9..12], top_cols[13..16], top_cols[17..20]
mcq = {}
for group in range(3):
    for r in range(4):
        q_idx = group * 4 + r + 1
        opts = []
        for c in range(4):
            b = top_cols[9 + group * 4 + c][r]
            opts.append([b['x'], b['y']])
        mcq[str(q_idx)] = opts

# TF: 4 columns in top_cols[21..24]
# They represent Q13 (Đ, S), Q14 (Đ, S) for row 1 (the first 4 Ys)
# AND Q15 (Đ, S), Q16 (Đ, S) for row 2 (the next 4 Ys)
tf = {}
# Columns:
# col 21: Q13/15 Đ
# col 22: Q13/15 S
# col 23: Q14/16 Đ
# col 24: Q14/16 S
for q in range(4):
    q_idx = 13 + q
    tf[str(q_idx)] = []
    
    # q=0 (Q13) -> cols 21,22 rows 0..3
    # q=1 (Q14) -> cols 23,24 rows 0..3
    # q=2 (Q15) -> cols 21,22 rows 4..7
    # q=3 (Q16) -> cols 23,24 rows 4..7
    c_D = 21 + (q % 2) * 2
    c_S = c_D + 1
    row_offset = (q // 2) * 4
    for sub in range(4): # a, b, c, d
        r = row_offset + sub
        tf[str(q_idx)].append([
            [top_cols[c_D][r]['x'], top_cols[c_D][r]['y']],
            [top_cols[c_S][r]['x'], top_cols[c_S][r]['y']]
        ])

# TLN: 24 columns in bottom_cols
tln = {}
for q in range(6):
    q_idx = 17 + q
    tln[str(q_idx)] = []
    base_col = q * 4
    for c in range(4):
        cb = bottom_cols[base_col + c]
        col_pts = [[b['x'], b['y']] for b in cb]
        tln[str(q_idx)].append(col_pts)

out = {
    "numQ": 12,
    "numSbd": 6,
    "numMade": 3,
    "scoring": {
        "mcq": { "points": 0.25 },
        "tf": { "points": [0.1, 0.25, 0.5, 1.0] },
        "tln": { "points": 0.5 }
    },
    "warp": {
        "width": 1500,
        "height": 1060,
        "TL": [0, 0],
        "TR": [1500, 0],
        "BR": [1500, 1060],
        "BL": [0, 1060]
    },
    "sbd": sbd,
    "made": made,
    "mcq": mcq,
    "tf": tf,
    "tln": tln
}

with open("template.json", "w") as f:
    json.dump(out, f, indent=2)

print("Template written to template.json")
