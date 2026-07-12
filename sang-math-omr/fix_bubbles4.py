import json
import numpy as np

with open('bubbles_ds-20-ngang-300.json', 'r') as f:
    bubs = json.load(f)

# SBD and Ma de are at y < 450
head_bubs = [b for b in bubs if b['y'] < 450]
tf_bubs = [b for b in bubs if b['y'] > 450]

head_xs = sorted(list(set([b['x'] for b in head_bubs])))
cols = []
current_col = []
for x in head_xs:
    if not current_col: current_col.append(x)
    elif x - current_col[-1] <= 10: current_col.append(x)
    else:
        cols.append(int(np.mean(current_col)))
        current_col = [x]
if current_col: cols.append(int(np.mean(current_col)))

print(f"Header columns ({len(cols)}): {cols}")

tf_xs = sorted(list(set([b['x'] for b in tf_bubs])))
cols2 = []
current_col = []
for x in tf_xs:
    if not current_col: current_col.append(x)
    elif x - current_col[-1] <= 10: current_col.append(x)
    else:
        cols2.append(int(np.mean(current_col)))
        current_col = [x]
if current_col: cols2.append(int(np.mean(current_col)))

print(f"TF columns ({len(cols2)}): {cols2}")
