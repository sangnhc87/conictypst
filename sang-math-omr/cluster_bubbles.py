import json
import numpy as np

with open("bubbles.json", "r") as f:
    bubbles = json.load(f)

# Sort by Y to find rows
bubbles.sort(key=lambda b: b['y'])

ys = [b['y'] for b in bubbles]
y_diff = np.diff(ys)
# Find large gaps in Y to segment top block vs bottom block
# Wait, top block has many rows that overlap (SBD, Mã đề, MCQ, TF)
# Bottom block (TLN) is clearly separated by a large gap.
print("Max Y gaps:")
sorted_gaps = sorted([(i, y_diff[i], ys[i], ys[i+1]) for i in range(len(y_diff))], key=lambda x: x[1], reverse=True)
for g in sorted_gaps[:5]:
    print(g)
