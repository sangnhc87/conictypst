import json

warp_width = 1500
warp_height = 1060

sbd_bubbles = []
for r in range(10):
    row = []
    for c in range(6):
        row.append([int(117 + c * 31.2), int(186 + r * 23.3)])
    sbd_bubbles.append(row)

made_bubbles = []
for r in range(10):
    row = []
    for c in range(4):
        row.append([int(305 + c * 31.2), int(186 + r * 23.3)])
    made_bubbles.append(row)

# X positions for (Đ, S) in each of the 5 groups
tf_x = [
    [293, 333],
    [521, 560],
    [749, 788],
    [976, 1016],
    [1204, 1243]
]

# Y positions for the 4 questions (since 20 / 5 = 4 rows of questions)
# Let's find them from the actual bubbles!
with open('bubbles_ds-20-ngang-300.json', 'r') as f:
    raw = json.load(f)
tf_bubs = [b for b in raw if b['y'] > 450]
ys = sorted([b['y'] for b in tf_bubs])

y_rows = []
cur = []
for y in ys:
    if not cur: cur.append(y)
    elif y - cur[-1] <= 10: cur.append(y)
    else:
        y_rows.append(int(sum(cur)/len(cur)))
        cur = [y]
if cur: y_rows.append(int(sum(cur)/len(cur)))

valid_ys = []
for y in y_rows:
    count = sum(1 for b in tf_bubs if abs(b['y'] - y) <= 10)
    if count >= 4:
        valid_ys.append(y)

print(f"Valid TF bubble rows: {len(valid_ys)}: {valid_ys}")
if len(valid_ys) >= 16:
    valid_ys = valid_ys[:16] # Take exactly 16
    tf_bubbles = []
    for q in range(20):
        # 5 groups (columns), 4 rows.
        group_idx = q % 5      # 0..4 (because row-major means Q1 is col 0, Q2 is col 1, ... Q5 is col 4)
        row_idx = q // 5       # 0..3
        
        q_ys = valid_ys[row_idx * 4 : row_idx * 4 + 4]
        q_xs = tf_x[group_idx]
        
        tf_bubbles.append([
            [q_xs[0], q_ys[0]], [q_xs[1], q_ys[0]], # a: Đ, S
            [q_xs[0], q_ys[1]], [q_xs[1], q_ys[1]], # b: Đ, S
            [q_xs[0], q_ys[2]], [q_xs[1], q_ys[2]], # c: Đ, S
            [q_xs[0], q_ys[3]], [q_xs[1], q_ys[3]], # d: Đ, S
        ])
    
    out = {
        "warp": {"width": 1500, "height": 1060},
        "sbd": sbd_bubbles,
        "made": made_bubbles,
        "tf": tf_bubbles
    }
    with open('ds-20-ngang_coords.json', 'w') as f:
        json.dump(out, f, indent=2)
    print("ds-20-ngang_coords.json generated successfully!")
else:
    print("Not enough rows!")
