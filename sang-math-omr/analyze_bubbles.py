import json
import numpy as np

with open("bubbles.json", "r") as f:
    bubbles = json.load(f)

# Sort by x
bubbles.sort(key=lambda b: b['x'])

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
        col_bubbles.append({
            'col_idx': i,
            'x': cols[i],
            'len': len(cb),
            'min_y': cb[0]['y'],
            'max_y': cb[-1]['y']
        })
    return col_bubbles

cols = get_columns(bubbles)
for c in cols:
    print(f"Col {c['col_idx']}: x={c['x']}, count={c['len']}, min_y={c['min_y']}, max_y={c['max_y']}")
