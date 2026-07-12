import json
import numpy as np

with open('bubbles_ds-20-ngang-300.json', 'r') as f:
    bubs = json.load(f)

head_bubs = [b for b in bubs if b['y'] < 450]
tf_bubs = [b for b in bubs if b['y'] > 450]

head_ys = sorted(list(set([b['y'] for b in head_bubs])))
rows = []
current = []
for y in head_ys:
    if not current: current.append(y)
    elif y - current[-1] <= 10: current.append(y)
    else:
        rows.append(int(np.mean(current)))
        current = [y]
if current: rows.append(int(np.mean(current)))

print(f"Header rows ({len(rows)}): {rows}")

tf_ys = sorted(list(set([b['y'] for b in tf_bubs])))
rows2 = []
current = []
for y in tf_ys:
    if not current: current.append(y)
    elif y - current[-1] <= 10: current.append(y)
    else:
        rows2.append(int(np.mean(current)))
        current = [y]
if current: rows2.append(int(np.mean(current)))

print(f"TF rows ({len(rows2)}): {rows2}")
