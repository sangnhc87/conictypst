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
    if 0.8 < aspect_ratio < 1.2 and 1000 < area < 20000:
        markers.append((x+w//2, y+h//2))

tl = min(markers, key=lambda p: p[0] + p[1])
tr = max(markers, key=lambda p: p[0] - p[1])
bl = max(markers, key=lambda p: p[1] - p[0])
br = max(markers, key=lambda p: p[0] + p[1])

pts_src = np.array([tl, tr, br, bl], dtype="float32")
width, height = 1500, 1060
pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

blurred = cv2.GaussianBlur(gray, (5, 5), 0)
circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=20, minRadius=14, maxRadius=32)

if circles is not None:
    circles = np.round(circles[0, :]).astype("int")
    
    # Map the circle centers using M
    warped_bubbles = []
    for c in circles:
        cx, cy, r = c[0], c[1], c[2]
        pt = np.array([[[cx, cy]]], dtype="float32")
        warped_pt = cv2.perspectiveTransform(pt, M)
        wx, wy = int(float(warped_pt[0][0][0]) // 2), int(float(warped_pt[0][0][1]) // 2)
        
        # Check if inside bounds (allow some slack)
        if -50 <= wx <= width//2 + 50 and -50 <= wy <= height//2 + 50:
            warped_bubbles.append({"x": wx, "y": wy, "r": int(r//2)})
    
    warped_bubbles = sorted(warped_bubbles, key=lambda b: b["y"])
    unique_coords = []
    for c in warped_bubbles:
        if not any(abs(c["x"] - u["x"]) < 5 and abs(c["y"] - u["y"]) < 5 for u in unique_coords):
            unique_coords.append(c)
            
    with open(f"bubbles_{name}.json", "w") as f:
        json.dump(unique_coords, f)
    print(f"{name}: Found {len(unique_coords)} bubbles.")
