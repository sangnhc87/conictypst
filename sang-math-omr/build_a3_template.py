import json

with open('a3_bubbles_raw.json', 'r') as f:
    data = json.load(f)

bubbles = data['bubbles']
markers = data['markers']

corner_markers = [m for m in markers if abs(m['x'] - 737) < 5 or abs(m['x'] - 985) < 5]
TL = min(corner_markers, key=lambda m: m['x'] + m['y'])
BR = max(corner_markers, key=lambda m: m['x'] + m['y'])
TR = min(corner_markers, key=lambda m: -m['x'] + m['y'])
BL = min(corner_markers, key=lambda m: m['x'] - m['y'])

for b in bubbles:
    b['nx'] = b['x'] - TL['x']
    b['ny'] = b['y'] - TL['y']

def get_bubbles(min_nx, max_nx, min_ny, max_ny):
    bubs = [b for b in bubbles if min_nx <= b['nx'] <= max_nx and min_ny <= b['ny'] <= max_ny]
    bubs.sort(key=lambda b: (b['ny'], b['nx']))
    return bubs

def group_cols(bubs):
    cols = []
    xs = sorted(list(set([b['nx'] for b in bubs])))
    merged_xs = []
    for x in xs:
        if not merged_xs or abs(x - merged_xs[-1]) > 5:
            merged_xs.append(x)
    
    for mx in merged_xs:
        col = [b for b in bubs if abs(b['nx'] - mx) < 5]
        col.sort(key=lambda b: b['ny'])
        cols.append(col)
    return cols

made_bubs = get_bubbles(170, 250, -10, 220)
made_cols = group_cols(made_bubs)
# made should be an array of columns!
made = []
for c in range(3):
    col_bubs = []
    for r in range(10):
        col_bubs.append([made_cols[c][r]['x'], made_cols[c][r]['y']])
    made.append(col_bubs)

tn_bubs = get_bubbles(10, 100, -10, 220)
tn_cols = group_cols(tn_bubs)
mcq = {}
for q in range(12):
    opts = []
    for c in range(4):
        opts.append([tn_cols[c][q]['x'], tn_cols[c][q]['y']])
    mcq[str(q+1)] = opts

ds_bubs = get_bubbles(105, 170, -10, 220)
ds_cols = group_cols(ds_bubs)
tf = {}
for q in range(2):
    q_idx = q + 1
    tf[str(q_idx)] = {}
    row_offset = q * 4
    for i, sub in enumerate(['a', 'b', 'c', 'd']):
        r = row_offset + i
        tf[str(q_idx)][sub] = [
            [ds_cols[0][r]['x'], ds_cols[0][r]['y']],
            [ds_cols[1][r]['x'], ds_cols[1][r]['y']]
        ]

tln_bubs_1 = get_bubbles(10, 120, 230, 390)
tln_bubs_2 = get_bubbles(120, 240, 230, 390)
tln_bubs_3 = get_bubbles(10, 120, 390, 560)
tln_bubs_4 = get_bubbles(120, 240, 390, 560)

tln = {}
for q, bubs in enumerate([tln_bubs_1, tln_bubs_2, tln_bubs_3, tln_bubs_4]):
    q_idx = q + 1
    cols = group_cols(bubs)
    
    tln[str(q_idx)] = []
    for c in cols:
        tln[str(q_idx)].append([[b['x'], b['y']] for b in c])

out = {
    "numQ": 12,
    "numSbd": 0,
    "numMade": 3,
    "numTf": 2,
    "numTln": 4,
    "warp": {
        "width": 1500,
        "height": 1116,
        "TL": [TL['x'], TL['y']],
        "TR": [TR['x'], TR['y']],
        "BR": [BR['x'], BR['y']],
        "BL": [BL['x'], BL['y']]
    },
    "sbd": [],
    "made": made,
    "mcq": mcq,
    "tf": tf,
    "tln": tln
}

with open("a3_template.json", "w") as f:
    json.dump(out, f, indent=2)

