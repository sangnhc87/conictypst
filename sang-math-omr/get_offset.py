import cv2
import numpy as np

img = cv2.imread('warped_ds20-tln10-ngang-300.png', cv2.IMREAD_GRAYSCALE)
_, thresh = cv2.threshold(img, 200, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

markers = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    if 18 <= w <= 25 and 18 <= h <= 25:
        aspect_ratio = float(w)/h
        if 0.8 <= aspect_ratio <= 1.2:
            extent = cv2.contourArea(cnt) / (w*h)
            if extent > 0.8:
                markers.append((x + w//2, y + h//2))

markers.sort(key=lambda p: p[1])
for m in markers:
    print(m)
