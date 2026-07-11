import cv2
import numpy as np

for i in [1, 2]:
    img = cv2.imread(f"sheet_img-{i}.png", cv2.IMREAD_GRAYSCALE)
    _, thresh = cv2.threshold(img, 240, 255, cv2.THRESH_BINARY_INV)
    contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    min_y = img.shape[0]
    max_y = 0
    for cnt in contours:
        x, y, w, h = cv2.boundingRect(cnt)
        if w > 50 and h > 50:
            if y < min_y: min_y = y
            if y + h > max_y: max_y = y + h
    
    print(f"Page {i} content height: {max_y - min_y} pixels out of {img.shape[0]} pixels")
