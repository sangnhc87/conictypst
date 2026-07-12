import cv2
import numpy as np
import json

img = cv2.imread('warped_ds20-tln10-ngang-300.png', cv2.IMREAD_GRAYSCALE)
_, thresh = cv2.threshold(img, 200, 255, cv2.THRESH_BINARY_INV)

# Find contours
contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

bubbles = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    if 25 <= w <= 40 and 25 <= h <= 40:
        aspect_ratio = float(w)/h
        if 0.8 <= aspect_ratio <= 1.2:
            bubbles.append((x + w//2, y + h//2))

print(f"Found {len(bubbles)} bubbles")
