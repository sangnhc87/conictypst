import cv2
import numpy as np
import json
import random

# 1. Get M_inv from empty_sheet.png
img = cv2.imread("empty_sheet.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 0.8 < aspect_ratio < 1.2 and 500 < area < 6000:
        markers.append((x+w//2, y+h//2))

tl = min(markers, key=lambda p: p[0] + p[1])
tr = max(markers, key=lambda p: p[0] - p[1])
bl = max(markers, key=lambda p: p[1] - p[0])
br = max(markers, key=lambda p: p[0] + p[1])

pts_src = np.array([tl, tr, br, bl], dtype="float32")
width, height = 1500, 1060
pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")

# We want M_inv: from warped (dst) back to unwarped (src)
M_inv = cv2.getPerspectiveTransform(pts_dst, pts_src)

# 2. Load template coordinates
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
        "13": [0, 1, 0, 1],
        "14": [1, 0, 1, 0],
        "15": [0, 0, 0, 0],
        "16": [1, 1, 1, 1],
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

def draw_bubble_on_unwarped(wx, wy):
    pt = np.array([[[wx, wy]]], dtype="float32")
    orig_pt = cv2.perspectiveTransform(pt, M_inv)
    ox, oy = int(orig_pt[0][0][0]), int(orig_pt[0][0][1])
    cv2.circle(img, (ox, oy), 8, (0, 0, 0), -1)

# Draw SBD
for r, digit in enumerate(answers["sbd"]):
    c = int(digit)
    pt = template["sbd"][c][r]
    draw_bubble_on_unwarped(pt[0], pt[1])

# Draw Mã đề
for r, digit in enumerate(answers["made"]):
    c = int(digit)
    pt = template["made"][c][r]
    draw_bubble_on_unwarped(pt[0], pt[1])

# Draw MCQ
for q, ans in answers["mcq"].items():
    pt = template["mcq"][q][ans]
    draw_bubble_on_unwarped(pt[0], pt[1])

# Draw TF
for q, ans_arr in answers["tf"].items():
    for sub, is_s in enumerate(ans_arr):
        pt = template["tf"][q][sub][is_s]
        draw_bubble_on_unwarped(pt[0], pt[1])

# Draw TLN randomly for columns
for q, ans_str in answers["tln"].items():
    for col in range(4):
        pt = template["tln"][q][col][random.randint(0, len(template["tln"][q][col])-1)]
        draw_bubble_on_unwarped(pt[0], pt[1])

cv2.imwrite("mocked_filled_unwarped.png", img)
print("Saved mocked_filled_unwarped.png")
