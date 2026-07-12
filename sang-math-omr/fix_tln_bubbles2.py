import json
import numpy as np

with open('bubbles_tln-10-ngang-300.json', 'r') as f:
    bubs = json.load(f)

head_bubs = [b for b in bubs if b['y'] < 300]
tln_bubs = [b for b in bubs if b['y'] > 300]

tln_xs = sorted(list(set([b['x'] for b in tln_bubs])))
cols = []
current = []
for x in tln_xs:
    if not current: current.append(x)
    elif x - current[-1] <= 10: current.append(x)
    else:
        cols.append(int(np.mean(current)))
        current = [x]
if current: cols.append(int(np.mean(current)))

tln_ys = sorted(list(set([b['y'] for b in tln_bubs])))
rows = []
current = []
for y in tln_ys:
    if not current: current.append(y)
    elif y - current[-1] <= 10: current.append(y)
    else:
        rows.append(int(np.mean(current)))
        current = [y]
if current: rows.append(int(np.mean(current)))

valid_ys = []
for y in rows:
    count = sum(1 for b in tln_bubs if abs(b['y'] - y) <= 10)
    if count >= 4:
        valid_ys.append(y)

print(f"TLN columns ({len(cols)}): {cols}")
print(f"Valid TLN rows ({len(valid_ys)}): {valid_ys}")
