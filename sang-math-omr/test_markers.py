import cv2
import json
import numpy as np
import subprocess

subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", "templates/12-4-6ngang.typ", "empty_1246_{p}.png"], check=True)

img = cv2.imread("empty_1246_1.png")
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

print("W, H:", w, h)
print("TL:", tl)
print("TR:", tr)
print("BL:", bl)
print("BR:", br)

# Calculate M and check SBD
H = 1116
pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([[0,0],[1500,0],[1500,H],[0,H]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

# SBD 0_0 in pt space was 61.24, 60.28
# In 144 PPI image, it is 122.48, 120.56
px, py = 61.24 * 2.0, 60.28 * 2.0
pt = np.array([[[px, py]]], dtype="float32")
warped_pt = cv2.perspectiveTransform(pt, M)[0][0]
print("warped SBD 0_0:", warped_pt)
