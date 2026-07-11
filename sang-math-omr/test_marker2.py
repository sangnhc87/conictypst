import cv2
import numpy as np

img = cv2.imread("empty_sheet.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
candidates = []
for cnt in contours:
    area = cv2.contourArea(cnt)
    if area > 300:
        M = cv2.moments(cnt)
        if M["m00"] != 0:
            cx = int(M["m10"] / M["m00"])
            cy = int(M["m01"] / M["m00"])
            candidates.append({'cx': cx, 'cy': cy, 'area': area})

print(f"Candidates found: {len(candidates)}")
