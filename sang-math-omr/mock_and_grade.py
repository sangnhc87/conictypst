import cv2
import json
import numpy as np
import random

# Load original warped template image (no marks)
img = cv2.imread("warped.png")
if img is None:
    print("Error: warped.png not found")
    exit(1)

with open("template.json", "r") as f:
    template = json.load(f)

answers = {
    "sbd": "123456",
    "made": "789",
    "mcq": {
        "1": 0, "2": 1, "3": 2, "4": 3,
        "5": 0, "6": 1, "7": 2, "8": 3,
        "9": 0, "10": 1, "11": 2, "12": 3,
    },
    "tf": {
        "13": [0, 1, 0, 1], # Đ, S, Đ, S
        "14": [1, 0, 1, 0], # S, Đ, S, Đ
        "15": [0, 0, 0, 0], # Đ, Đ, Đ, Đ
        "16": [1, 1, 1, 1], # S, S, S, S
    },
    "tln": {
        "17": "-12.3",
        "18": "4.56",
        "19": "-0.78",
        "20": "99.9",
        "21": "-1.0",
        "22": "0"
    }
}

# Draw marks
def draw_mark(x, y):
    cv2.circle(img, (x, y), 12, (0, 0, 0), -1)

for r, digit in enumerate(answers["sbd"]):
    c = int(digit)
    pt = template["sbd"][c][r]
    draw_mark(pt[0], pt[1])

for r, digit in enumerate(answers["made"]):
    c = int(digit)
    pt = template["made"][c][r]
    draw_mark(pt[0], pt[1])

for q, ans in answers["mcq"].items():
    pt = template["mcq"][q][ans]
    draw_mark(pt[0], pt[1])

for q, ans_arr in answers["tf"].items():
    for sub, is_s in enumerate(ans_arr):
        pt = template["tf"][q][sub][is_s] # 0 = Đ, 1 = S
        draw_mark(pt[0], pt[1])

for q, ans_str in answers["tln"].items():
    # TLN has 4 columns: [-, ,, 0-9], [,, 0-9], [,, 0-9], [0-9]
    # To simplify mocking, let's just draw some random bubbles in the 4 columns for TLN
    for col in range(4):
        pt = template["tln"][q][col][random.randint(0, len(template["tln"][q][col])-1)]
        draw_mark(pt[0], pt[1])

cv2.imwrite("mocked_filled.png", img)
print("Mocked image generated as mocked_filled.png")

# Now let's implement the grading algorithm!
# In real life, it would threshold the image and count dark pixels.
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 150, 255, cv2.THRESH_BINARY_INV)

def is_filled(x, y):
    # check 20x20 area around center
    roi = thresh[y-10:y+10, x-10:x+10]
    return np.mean(roi) > 100

print("\n--- GRADING RESULTS ---")

sbd_read = ""
for r in range(6):
    filled = [c for c in range(10) if is_filled(*template["sbd"][c][r])]
    sbd_read += str(filled[0]) if filled else "?"
print(f"SBD read: {sbd_read} | Expected: {answers['sbd']}")

made_read = ""
for r in range(3):
    filled = [c for c in range(10) if is_filled(*template["made"][c][r])]
    made_read += str(filled[0]) if filled else "?"
print(f"Mã đề read: {made_read} | Expected: {answers['made']}")

print("\nMCQ:")
for q in range(1, 13):
    filled = [c for c in range(4) if is_filled(*template["mcq"][str(q)][c])]
    ans = "ABCD"[filled[0]] if filled else "?"
    print(f"Q{q}: {ans} | Expected: {'ABCD'[answers['mcq'][str(q)]]}")

print("\nTF:")
for q in range(13, 17):
    res = []
    for sub in range(4):
        is_d = is_filled(*template["tf"][str(q)][sub][0])
        is_s = is_filled(*template["tf"][str(q)][sub][1])
        if is_d and not is_s: res.append("Đ")
        elif not is_d and is_s: res.append("S")
        else: res.append("?")
    exp = ["S" if x else "Đ" for x in answers['tf'][str(q)]]
    print(f"Q{q}: {res} | Expected: {exp}")

