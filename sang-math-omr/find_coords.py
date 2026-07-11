import cv2
import numpy as np
import json

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

# Find the 4 corner-most markers
# Top-Left: min x+y
# Top-Right: max x-y
# Bottom-Left: max y-x
# Bottom-Right: max x+y
if len(markers) >= 4:
    tl = min(markers, key=lambda p: p[0] + p[1])
    tr = max(markers, key=lambda p: p[0] - p[1])
    bl = max(markers, key=lambda p: p[1] - p[0])
    br = max(markers, key=lambda p: p[0] + p[1])
    
    pts_src = np.array([tl, tr, br, bl], dtype="float32")
    
    width = 1500
    height = 1060
    pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
    M = cv2.getPerspectiveTransform(pts_src, pts_dst)
    warped = cv2.warpPerspective(gray, M, (width, height))
    cv2.imwrite("warped.png", warped)
else:
    print(f"Could not find 4 markers, found {len(markers)}")
    exit(1)

# Find bubbles
blurred = cv2.GaussianBlur(warped, (5, 5), 0)
circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=20, minRadius=9, maxRadius=16)

if circles is not None:
    circles = np.round(circles[0, :]).astype("int")
    coords = [{"x": int(c[0]), "y": int(c[1]), "r": int(c[2])} for c in circles]
    with open("bubbles.json", "w") as f:
        json.dump(coords, f)
    print(f"Found {len(circles)} bubbles.")
else:
    print("No bubbles found.")
