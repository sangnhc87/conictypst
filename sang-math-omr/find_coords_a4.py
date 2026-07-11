import cv2
import numpy as np
import json

img = cv2.imread("omr_sheet_a4.png")
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
width, height = 1500, 2120
pts_dst = np.array([[0,0],[width,0],[width,height],[0,height]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)
warped = cv2.warpPerspective(gray, M, (width, height))
cv2.imwrite("warped_a4.png", warped)

blurred = cv2.GaussianBlur(warped, (5, 5), 0)
circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=20, minRadius=9, maxRadius=16)

if circles is not None:
    circles = np.round(circles[0, :]).astype("int")
    coords = [{"x": int(c[0]), "y": int(c[1]), "r": int(c[2])} for c in circles]
    coords = sorted(coords, key=lambda c: c["y"])
    
    unique_coords = []
    for c in coords:
        if not any(abs(c["x"] - u["x"]) < 10 and abs(c["y"] - u["y"]) < 10 for u in unique_coords):
            unique_coords.append(c)
            
    with open("bubbles_a4.json", "w") as f:
        json.dump(unique_coords, f)
    print(f"Found {len(unique_coords)} bubbles.")
else:
    print("No bubbles found.")
