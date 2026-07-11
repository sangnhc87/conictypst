import cv2
import json

img = cv2.imread("warped_a4.png")
with open("bubbles_a4.json", "r") as f:
    bubbles = json.load(f)

for x, y in bubbles:
    cv2.circle(img, (x, y), 10, (0, 0, 255), 2)

cv2.imwrite("warped_a4_draw.png", img)
