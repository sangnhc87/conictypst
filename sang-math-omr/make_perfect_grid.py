import json

warp_width = 1500
warp_height = 1060

sbd_x_start = 117
sbd_dx = 31.2
sbd_y_start = 186
sbd_dy = 23.3

made_x_start = 305
made_dx = 31.2
made_y_start = 186
made_dy = 23.3

sbd_bubbles = []
for r in range(10):
    row = []
    for c in range(6):
        row.append([int(sbd_x_start + c * sbd_dx), int(sbd_y_start + r * sbd_dy)])
    sbd_bubbles.append(row)

made_bubbles = []
for r in range(10):
    row = []
    for c in range(4):
        row.append([int(made_x_start + c * made_dx), int(made_y_start + r * made_dy)])
    made_bubbles.append(row)

# TF Grid: 4 groups of 5 questions. Each question has 4 subquestions (a,b,c,d) with 2 options (Đ, S).
# X positions for (Đ, S) in each group
tf_x = [
    [322, 361],
    [606, 646],
    [891, 930],
    [1176, 1215]
]

# Y positions for the 5 questions
# From our previous script, the Y positions for bubbles are clustered.
# Let's see the raw Y's to find the question offsets.
with open('bubbles_ds-20-ngang-300.json', 'r') as f:
    raw = json.load(f)
tf_bubs = [b for b in raw if b['y'] > 450]
ys = sorted([b['y'] for b in tf_bubs])

# A question has 4 bubbles vertically.
# Let's find the centers of the 5 questions manually by clustering Ys into 20 rows.
y_rows = []
cur = []
for y in ys:
    if not cur: cur.append(y)
    elif y - cur[-1] <= 10: cur.append(y)
    else:
        y_rows.append(int(sum(cur)/len(cur)))
        cur = [y]
if cur: y_rows.append(int(sum(cur)/len(cur)))

# y_rows includes the tracking markers (usually slightly offset or aligned).
# Let's only keep y_rows that have multiple bubbles in that row.
valid_ys = []
for y in y_rows:
    count = sum(1 for b in tf_bubs if abs(b['y'] - y) <= 10)
    if count >= 4: # At least 4 bubbles means it's a bubble row, not tracking marker (which has 0 bubbles, or 4 if coincidental)
        valid_ys.append(y)

print(f"Valid TF bubble rows: {len(valid_ys)}: {valid_ys}")
# If there are exactly 20 valid_ys, we can just use them!
if len(valid_ys) == 20:
    tf_bubbles = []
    # 5 questions, each has 4 rows
    for q in range(20):
        # q goes from 0 to 19
        group_idx = q // 5 # 0..3
        q_in_group = q % 5 # 0..4
        
        # The rows are laid out: Group 1 Q1..5, but wait!
        # The valid_ys are sorted by Y. So valid_ys[0..3] is Q1 for ALL GROUPS!
        # Because the groups are side-by-side!
        # So q_in_group corresponds to valid_ys[q_in_group * 4 : q_in_group * 4 + 4]
        
        q_ys = valid_ys[q_in_group * 4 : q_in_group * 4 + 4]
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
    print("Could not find exactly 20 rows.")
