import cv2
import numpy as np
import json
import sys

filename = sys.argv[1]
name = filename.split('.')[0]

img = cv2.imread(filename)
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    # The image is 300 PPI, so markers are 4x larger area (1700-1800)
    if 0.8 < aspect_ratio < 1.2 and 1000 < area < 20000:
        markers.append((x+w//2, y+h//2))

if len(markers) >= 4:
    tl = min(markers, key=lambda p: p[0] + p[1])
    tr = max(markers, key=lambda p: p[0] - p[1])
    bl = max(markers, key=lambda p: p[1] - p[0])
    br = max(markers, key=lambda p: p[0] + p[1])
    
    pts_src = np.array([tl, tr, br, bl], dtype="float32")
    
    width = 3000
    height = 2120
    pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
    M = cv2.getPerspectiveTransform(pts_src, pts_dst)
    warped = cv2.warpPerspective(gray, M, (width, height))
    cv2.imwrite(f"warped_{name}.png", warped)
else:
    print(f"{name}: Could not find 4 markers")
    exit(1)

_, thresh_w = cv2.threshold(warped, 200, 255, cv2.THRESH_BINARY_INV)
contours_w, _ = cv2.findContours(thresh_w, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
bubbles = []
for cnt in contours_w:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    # A bubble at 300 PPI has radius ~ 24px -> w~48px -> area ~ 1800
    # A5 scaled 88% -> w~42px -> area ~ 1380
    if 0.8 < aspect_ratio < 1.2 and 600 < area < 2500:
        # verify it's a circle by checking contour area vs bounding box area
        if area / (w*h) > 0.6: 
            bubbles.append({"x": (x+w//2)//2, "y": (y+h//2)//2, "r": (w//2)//2})

# deduplicate
unique_coords = []
bubbles = sorted(bubbles, key=lambda c: c["y"])
for c in bubbles:
    if not any(abs(c["x"] - u["x"]) < 5 and abs(c["y"] - u["y"]) < 5 for u in unique_coords):
        unique_coords.append(c)

with open(f"bubbles_{name}.json", "w") as f:
    json.dump(unique_coords, f)
print(f"{name}: Found {len(unique_coords)} bubbles.")
