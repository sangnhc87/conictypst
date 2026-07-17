import cv2
import json
import numpy as np
import subprocess

with open('templates.json', 'r') as f:
    t = json.load(f)

def transform_pts(obj, M):
    if isinstance(obj, list):
        if len(obj) == 2 and isinstance(obj[0], (int, float)):
            px, py = obj[0] * 2.0, obj[1] * 2.0
            pt = np.array([[[px, py]]], dtype="float32")
            warped_pt = cv2.perspectiveTransform(pt, M)[0][0]
            return [round(float(warped_pt[0]), 1), round(float(warped_pt[1]), 1)]
        return [transform_pts(x, M) for x in obj]
    elif isinstance(obj, dict):
        return {k: transform_pts(v, M) if k != 'warp' else v for k, v in obj.items()}
    return obj

k = '12-4-6ngang'
v = t[k]
subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", "templates/12-4-6ngang.typ", "empty_fix_{p}.png"], check=True)
img = cv2.imread("empty_fix_1.png")
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
        cx, cy = x + bw/2.0, y + bh/2.0
        if cx < w/2 and cy < h/2: quadrants['tl'].append((cx, cy, area))
        elif cx >= w/2 and cy < h/2: quadrants['tr'].append((cx, cy, area))
        elif cx < w/2 and cy >= h/2: quadrants['bl'].append((cx, cy, area))
        elif cx >= w/2 and cy >= h/2: quadrants['br'].append((cx, cy, area))

tl = min(quadrants['tl'], key=lambda p: p[0] + p[1])[:2]
tr = min(quadrants['tr'], key=lambda p: (w - p[0]) + p[1])[:2]
bl = min(quadrants['bl'], key=lambda p: p[0] + (h - p[1]))[:2]
br = min(quadrants['br'], key=lambda p: (w - p[0]) + (h - p[1]))[:2]

H = v['warp']['height']
pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([[0,0],[1500,0],[1500,H],[0,H]], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

print("Before (from templates.json):", v['sbd'][0][0])
print("Scale to pixel:", v['sbd'][0][0][0] * 2.0, v['sbd'][0][0][1] * 2.0)
v_new = transform_pts(v, M)
print("After M Transform:", v_new['sbd'][0][0])
