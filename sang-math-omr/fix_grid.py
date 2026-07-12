import cv2
import numpy as np
import json

img = cv2.imread('ds-20-ngang-300.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)

# Find all bubbles
contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
raw_bubbles = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 0.8 < aspect_ratio < 1.2 and 1000 < area < 2500:
        if area / (w*h) > 0.6: 
            raw_bubbles.append((x+w//2, y+h//2, w//2))

print(f"Raw bubbles found: {len(raw_bubbles)}")

# Find 4 markers
markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 0.8 < aspect_ratio < 1.2 and 2000 < area < 20000:
        # Markers are squares, so area / (w*h) ~ 1.0, not a circle. But let's just use area.
        markers.append((x+w//2, y+h//2))

if len(markers) >= 4:
    tl = min(markers, key=lambda p: p[0] + p[1])
    tr = max(markers, key=lambda p: p[0] - p[1])
    bl = max(markers, key=lambda p: p[1] - p[0])
    br = max(markers, key=lambda p: p[0] + p[1])
else:
    print("Not enough markers!")
    exit(1)

pts_src = np.array([tl, tr, br, bl], dtype="float32")
width, height = 1500, 1060
pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

# Warp all bubbles
warped_bubbles = []
for (cx, cy, r) in raw_bubbles:
    pt = np.array([[[cx, cy]]], dtype="float32")
    warped_pt = cv2.perspectiveTransform(pt, M)
    wx, wy = int(float(warped_pt[0][0][0]) / 2), int(float(warped_pt[0][0][1]) / 2)
    warped_bubbles.append({'x': wx, 'y': wy, 'r': int(r//2)})

# Remove duplicates
unique_coords = []
for c in warped_bubbles:
    if not any(abs(c["x"] - u["x"]) < 5 and abs(c["y"] - u["y"]) < 5 for u in unique_coords):
        unique_coords.append(c)

print(f"Unique warped bubbles: {len(unique_coords)}")
with open('debug_bubbles.json', 'w') as f:
    json.dump(unique_coords, f)
