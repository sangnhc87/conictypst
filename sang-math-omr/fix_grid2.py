import cv2
import numpy as np
import json

img = cv2.imread('ds-20-ngang-300.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)

# Find 4 markers
contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 0.8 < aspect_ratio < 1.2 and 1000 < area < 20000:
        markers.append((x+w//2, y+h//2, area))

markers = sorted(markers, key=lambda m: m[2], reverse=True)[:4] # Top 4 biggest (the 4 squares)

if len(markers) >= 4:
    tl = min(markers, key=lambda p: p[0] + p[1])
    tr = max(markers, key=lambda p: p[0] - p[1])
    bl = max(markers, key=lambda p: p[1] - p[0])
    br = max(markers, key=lambda p: p[0] + p[1])
else:
    print("Not enough markers!")
    exit(1)

pts_src = np.array([tl[:2], tr[:2], br[:2], bl[:2]], dtype="float32")
width, height = 3000, 2120
pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)
warped = cv2.warpPerspective(gray, M, (width, height))

blurred = cv2.GaussianBlur(warped, (5, 5), 0)
circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=15, minRadius=14, maxRadius=32)

if circles is not None:
    circles = np.round(circles[0, :]).astype("int")
    # Divide by 2 to map to 1500x1060
    coords = [{"x": int(c[0])//2, "y": int(c[1])//2, "r": int(c[2])//2} for c in circles]
    coords = sorted(coords, key=lambda c: c["y"])
    
    unique_coords = []
    for c in coords:
        if not any(abs(c["x"] - u["x"]) < 5 and abs(c["y"] - u["y"]) < 5 for u in unique_coords):
            unique_coords.append(c)
            
    with open('debug_bubbles.json', 'w') as f:
        json.dump(unique_coords, f)
    print(f"Found {len(unique_coords)} bubbles.")
