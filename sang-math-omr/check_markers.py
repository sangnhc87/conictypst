import cv2, numpy as np

img = cv2.imread("empty_1.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 200, 255, cv2.THRESH_BINARY_INV)
contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

h, w = gray.shape
quadrants = {'tl': [], 'tr': [], 'bl': [], 'br': []}

for cnt in contours:
    x, y, bw, bh = cv2.boundingRect(cnt)
    aspect = bw / float(bh)
    area = cv2.contourArea(cnt)
    if 0.8 < aspect < 1.2 and area > 50:  
        cx, cy = x + bw//2, y + bh//2
        if cx < w/2 and cy < h/2:
            quadrants['tl'].append((cx, cy, area))
        elif cx >= w/2 and cy < h/2:
            quadrants['tr'].append((cx, cy, area))
        elif cx < w/2 and cy >= h/2:
            quadrants['bl'].append((cx, cy, area))
        elif cx >= w/2 and cy >= h/2:
            quadrants['br'].append((cx, cy, area))

tl = min(quadrants['tl'], key=lambda p: p[0] + p[1]) if quadrants['tl'] else None
tr = min(quadrants['tr'], key=lambda p: (w - p[0]) + p[1]) if quadrants['tr'] else None
bl = min(quadrants['bl'], key=lambda p: p[0] + (h - p[1])) if quadrants['bl'] else None
br = min(quadrants['br'], key=lambda p: (w - p[0]) + (h - p[1])) if quadrants['br'] else None

print(f"Image dims: {w}x{h}")
print(f"tl: {tl}")
print(f"tr: {tr}")
print(f"bl: {bl}")
print(f"br: {br}")
