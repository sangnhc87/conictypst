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

tf_x = [
    [293, 333],
    [521, 560],
    [749, 788],
    [976, 1016],
    [1204, 1243]
]

tf_y_groups = [
    [501, 525, 550, 574],
    [643, 667, 691, 715],
    [785, 809, 833, 857],
    [926, 951, 975, 999]
]

tf_bubbles = []
for q in range(20):
    group_idx = q % 5
    row_idx = q // 5
    
    q_ys = tf_y_groups[row_idx]
    q_xs = tf_x[group_idx]
    
    tf_bubbles.append([
        [q_xs[0], q_ys[0]], [q_xs[1], q_ys[0]],
        [q_xs[0], q_ys[1]], [q_xs[1], q_ys[1]],
        [q_xs[0], q_ys[2]], [q_xs[1], q_ys[2]],
        [q_xs[0], q_ys[3]], [q_xs[1], q_ys[3]],
    ])

out = {
    "numQ": 20,
    "numSbd": 6,
    "numMade": 4,
    "scoring": {
        "mcq": {"points": 0.25},
        "tf": {"points": [0.1, 0.25, 0.5, 1]},
        "tln": {"points": 0.5}
    },
    "warp": {"width": 1500, "height": 1060},
    "bounds": {
        "sbd": sbd_bubbles,
        "made": made_bubbles,
        "tf": tf_bubbles
    }
}
with open('ds-20-ngang_coords.json', 'w') as f:
    json.dump(out, f, indent=2)
print("ds-20-ngang_coords.json generated successfully!")
