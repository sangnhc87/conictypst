import cv2, json, numpy as np

with open('/Users/admin/conictypst/sang-math-omr/templates.json') as f:
    t = json.load(f)

v = t['thptqg-toan']
old_H = v['warp']['height']

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
tl = min(quadrants['tl'], key=lambda p: p[0] + p[1])[:2]
tr = min(quadrants['tr'], key=lambda p: (w - p[0]) + p[1])[:2]
bl = min(quadrants['bl'], key=lambda p: p[0] + (h - p[1]))[:2]
br = min(quadrants['br'], key=lambda p: (w - p[0]) + (h - p[1]))[:2]

pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([[0,0],[1500,0],[1500,old_H],[0,old_H]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)
warped = cv2.warpPerspective(gray, M, (1500, old_H))

blurred = cv2.GaussianBlur(warped, (5, 5), 0)
circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=15, minRadius=6, maxRadius=22)
circles = circles[0, :]
new_bubbles = [(c[0], c[1]) for c in circles]

print("First 5 in templates.json:")
for i, (q, pts) in enumerate(v['mcq'].items()):
    if i >= 5: break
    print(f"Q{q}: {pts}")

print("\nFirst 5 from HoughCircles:")
print(sorted(new_bubbles, key=lambda p: (p[1], p[0]))[:5])

