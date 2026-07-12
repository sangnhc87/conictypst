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

# X positions for the 4 bubble columns in each of the 5 groups
tln_x = [
    [181, 202, 223, 244],
    [372, 393, 414, 435],
    [563, 584, 605, 627],
    [754, 775, 797, 818],
    [946, 967, 988, 1009]
]

tln_y_groups = [
    [490, 508, 525, 543, 561, 578, 596, 613, 631, 648, 666, 684],
    [861, 879, 896, 914, 932, 949, 967, 984, 1002, 1019, 1037, 1055]
]

tln = {}
for q in range(10):
    group_idx = q % 5
    row_idx = q // 5
    
    q_ys = tln_y_groups[row_idx]
    q_xs = tln_x[group_idx]
    
    col1 = [[q_xs[0], q_ys[0]]] + [[q_xs[0], q_ys[i]] for i in range(3, 12)]
    col2 = [[q_xs[1], q_ys[1]]] + [[q_xs[1], q_ys[i]] for i in range(2, 12)]
    col3 = [[q_xs[2], q_ys[1]]] + [[q_xs[2], q_ys[i]] for i in range(2, 12)]
    col4 = [[q_xs[3], q_ys[i]] for i in range(2, 12)]
    
    tln[str(q + 1)] = [col1, col2, col3, col4]

coords = {
    "sbd": sbd_bubbles,
    "made": made_bubbles,
    "tln": tln
}

with open('tln-10-ngang_coords.json', 'w') as f:
    json.dump(coords, f, indent=2)

print("Created tln-10-ngang_coords.json successfully!")
