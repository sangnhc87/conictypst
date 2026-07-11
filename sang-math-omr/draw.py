import cv2
import numpy as np

img = cv2.imread("sheet_img-1.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# find connected components
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)
num_labels, labels, stats, centroids = cv2.connectedComponentsWithStats(thresh, connectivity=8)

for i in range(1, num_labels):
    x, y, w, h, area = stats[i]
    if area > 20 and area < 5000:
        cv2.rectangle(img, (x, y), (x+w, y+h), (0, 0, 255), 1)

cv2.imwrite("debug_components.png", img)
