import cv2
import json
import numpy as np
import random

with open("template.json", "r") as f:
    template = json.load(f)

def generate_mock(filename, seed):
    random.seed(seed)
    # Load original warped template image (no marks)
    img = cv2.imread("warped.png")
    
    # Generate random answers
    sbd = "".join([str(random.randint(0,9)) for _ in range(6)])
    made = "".join([str(random.randint(0,9)) for _ in range(3)])
    
    def draw_mark(x, y):
        cv2.circle(img, (x, y), 12, (0, 0, 0), -1)

    for r, digit in enumerate(sbd):
        draw_mark(*template["sbd"][int(digit)][r])

    for r, digit in enumerate(made):
        draw_mark(*template["made"][int(digit)][r])

    for q in range(1, 13):
        ans = random.randint(0,3)
        draw_mark(*template["mcq"][str(q)][ans])

    for q in range(1, 5):
        for sub in range(4):
            is_s = random.randint(0,1)
            draw_mark(*template["tf"][str(q)][sub][is_s])

    for q in range(1, 7):
        for col in range(4):
            max_idx = len(template["tln"][str(q)][col]) - 1
            idx = random.randint(0, max_idx)
            draw_mark(*template["tln"][str(q)][col][idx])

    # Add white border so markers are fully enclosed and contour detection works
    bordered = cv2.copyMakeBorder(img, 50, 50, 50, 50, cv2.BORDER_CONSTANT, value=[255,255,255])
    
    # Maybe add slight rotation to make it a realistic "scan"
    (h, w) = bordered.shape[:2]
    center = (w // 2, h // 2)
    angle = random.uniform(-2, 2)
    M = cv2.getRotationMatrix2D(center, angle, 1.0)
    rotated = cv2.warpAffine(bordered, M, (w, h), borderValue=(255,255,255))

    cv2.imwrite(filename, rotated)
    print(f"Generated {filename}")

generate_mock("mock1.png", 1)
generate_mock("mock2.png", 2)
generate_mock("mock3.png", 3)
