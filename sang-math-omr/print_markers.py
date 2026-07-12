import cv2
import numpy as np

img = cv2.imread('ds-20-ngang-300.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 0.8 < aspect_ratio < 1.2 and 1000 < area < 20000:
        markers.append((x+w//2, y+h//2, area))

markers = sorted(markers, key=lambda m: m[2], reverse=True)[:4]
print("Markers:", markers)
