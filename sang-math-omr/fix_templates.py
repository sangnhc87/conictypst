import cv2
import json
import numpy as np
import os
import subprocess

with open('templates.json', 'r') as f:
    t = json.load(f)

mapping = {
    'thptqg-toan': 'thptqg-toan-2025'
}

def transform_pts(obj, M):
    if isinstance(obj, list):
        if len(obj) == 2 and isinstance(obj[0], (int, float)):
            # It's a point [x, y] in pt space
            px, py = obj[0] * 2.0, obj[1] * 2.0
            pt = np.array([[[px, py]]], dtype="float32")
            warped_pt = cv2.perspectiveTransform(pt, M)[0][0]
            return [round(float(warped_pt[0]), 1), round(float(warped_pt[1]), 1)]
        return [transform_pts(x, M) for x in obj]
    elif isinstance(obj, dict):
        return {k: transform_pts(v, M) if k != 'warp' else v for k, v in obj.items()}
    return obj

new_t = {}
for k, v in t.items():
    print(f"Processing {k}...")
    typ_name = mapping.get(k, k)
    typ_path = f"/Users/admin/conictypst/sang-math-omr/templates/{typ_name}.typ"
    
    if not os.path.exists(typ_path):
        new_t[k] = v
        continue
        
    subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", typ_path, "empty_fix_{p}.png"], check=True)
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
    
    v_new = transform_pts(v, M)
    new_t[k] = v_new
    
    if os.path.exists("empty_fix_1.png"): os.remove("empty_fix_1.png")
    if os.path.exists("empty_fix_2.png"): os.remove("empty_fix_2.png")

with open('templates_warped.json', 'w') as f:
    json.dump(new_t, f)
print("Saved templates_warped.json!")
