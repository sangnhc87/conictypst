import cv2
import numpy as np

img = cv2.imread("/Users/admin/.gemini/antigravity-ide/brain/5e1c6f67-47df-42f8-b394-887a3aabce3f/media__1783727051540.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# print out row sums to find text lines
row_sums = 255 - np.min(gray, axis=1)
for i, s in enumerate(row_sums):
    if s > 0:
        print(f"Row {i} has content")

