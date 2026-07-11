import cv2
import numpy as np

img = cv2.imread("warped_a4.png")
_, thresh_warped = cv2.threshold(img[:,:,0], 100, 255, cv2.THRESH_BINARY_INV)
contours, _ = cv2.findContours(thresh_warped, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

bubbles = []
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    aspect_ratio = float(w)/h
    area = cv2.contourArea(cnt)
    if 200 < area < 2000 and 0.5 < aspect_ratio < 2.0:
        bubbles.append((x+w//2, y+h//2))

unique_bubbles = []
for bx, by in bubbles:
    if not any(abs(bx - ux) < 10 and abs(by - uy) < 10 for ux, uy in unique_bubbles):
        unique_bubbles.append((bx, by))

print(f"Total loose bubbles: {len(unique_bubbles)}")
