import cv2
import numpy as np

img = cv2.imread('warped_ds20-tln10-ngang-300.png', cv2.IMREAD_GRAYSCALE)
edges = cv2.Canny(img, 50, 150)
lines = cv2.HoughLinesP(edges, 1, np.pi/180, 200, minLineLength=300, maxLineGap=10)

y_coords = []
if lines is not None:
    for line in lines:
        x1, y1, x2, y2 = line[0]
        if abs(y1 - y2) < 5:
            y_coords.append(y1)

y_coords.sort()
print(y_coords)
