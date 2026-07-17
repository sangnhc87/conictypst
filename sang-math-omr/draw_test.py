import cv2
import json
import numpy as np
import subprocess

t = json.load(open('templates_warped.json'))

subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", "templates/12-4-6ngang.typ", "empty_draw_{p}.png"], check=True)
img = cv2.imread("empty_draw_1.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)
contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

h, w = gray.shape
quadrants = {'tl': [], 'tr': [], 'bl': [], 'br': []}
for cnt in contours:
    x, y, bw, bh = cv2.boundingRect(cnt)
    aspect = bw / float(bh)
    area = cv2.contourArea(cnt)
    if 0.8 < aspect < 1.2 and area > 50:  
        cx, cy = x + bw/2.0, y + bh/2.0
        if cx < w/2 and cy < h/2: quadrants['tl'].append((cx, cy, area))
        elif cx >= w/2 and cy < h/2: quadrants['tr'].append((cx, cy, area))
        elif cx < w/2 and cy >= h/2: quadrants['bl'].append((cx, cy, area))
        elif cx >= w/2 and cy >= h/2: quadrants['br'].append((cx, cy, area))

tl = min(quadrants['tl'], key=lambda p: p[0] + p[1])[:2]
tr = min(quadrants['tr'], key=lambda p: (w - p[0]) + p[1])[:2]
bl = min(quadrants['bl'], key=lambda p: p[0] + (h - p[1]))[:2]
br = min(quadrants['br'], key=lambda p: (w - p[0]) + (h - p[1]))[:2]

H = 1116
pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([[0,0],[1500,0],[1500,H],[0,H]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

warped = cv2.warpPerspective(img, M, (1500, H))

for q, pts in t['12-4-6ngang']['mcq'].items():
    for pt in pts:
        cv2.circle(warped, (int(pt[0]), int(pt[1])), 8, (255, 0, 0), 2)

cv2.imwrite("warped_drawn.png", warped)
print("Done warped_drawn.png")
