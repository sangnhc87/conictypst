import cv2
import numpy as np
import sys
sys.path.append('.')
from omr_grader import get_4_corners, warp_page

img = cv2.imread('templates/12-4-6ngang-1.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
h, w = gray.shape[:2]

_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)
contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
corners = get_4_corners(contours, w, h)
warped = warp_page(gray, corners)

_, thresh_w = cv2.threshold(warped, 200, 255, cv2.THRESH_BINARY_INV)
cnts, _ = cv2.findContours(thresh_w, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

anchors = []
for c in cnts:
    x, y, bw, bh = cv2.boundingRect(c)
    area = cv2.contourArea(c)
    if area > 80 and area < 500:
        ar = bw / float(bh)
        extent = area / float(bw*bh)
        if extent > 0.8:
            anchors.append((x, y, bw, bh))

out_img = cv2.cvtColor(warped, cv2.COLOR_GRAY2BGR)
for (x, y, bw, bh) in anchors:
    cv2.rectangle(out_img, (x, y), (x+bw, y+bh), (0, 0, 255), 2)

cv2.imwrite('debug_anchors.png', out_img)
