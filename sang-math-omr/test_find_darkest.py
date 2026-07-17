import cv2
import json
import numpy as np

img = cv2.imread("mock_new_12-4-6ngang.png")
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
warped = cv2.warpPerspective(gray, M, (1500, H))

t = json.load(open("templates_warped.json"))
px, py = map(int, t["12-4-6ngang"]["mcq"]["1"][0])

# Find the location of the filled bubble (darkest area) in the warped image
# We can just threshold and find contours, and look for large blobs
_, w_thresh = cv2.threshold(warped, 200, 255, cv2.THRESH_BINARY_INV)
contours, _ = cv2.findContours(w_thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
best_cnt = None
min_dist = float('inf')
for cnt in contours:
    area = cv2.contourArea(cnt)
    if area > 300: # large filled circle
        x, y, bw, bh = cv2.boundingRect(cnt)
        cx, cy = x + bw/2.0, y + bh/2.0
        dist = np.hypot(cx - px, cy - py)
        if dist < min_dist:
            min_dist = dist
            best_cnt = (cx, cy)

print(f"Target: {px}, {py}")
print(f"Closest large filled blob: {best_cnt}, distance: {min_dist}")

# Also just check what is AT px, py
print(f"Pixel at target in warped: {warped[py, px]}")
