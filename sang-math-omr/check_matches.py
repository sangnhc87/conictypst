import cv2, json, numpy as np, os, subprocess

with open('/Users/admin/conictypst/sang-math-omr/old_templates.json') as f:
    t = json.load(f)

mapping = {
    'thptqg-toan': 'thptqg-toan-2025'
}

def extract_all_points(obj):
    points = []
    if isinstance(obj, list):
        if len(obj) == 2 and isinstance(obj[0], (int, float)) and isinstance(obj[1], (int, float)):
            return [obj]
        for x in obj:
            points.extend(extract_all_points(x))
    elif isinstance(obj, dict):
        for v in obj.values():
            points.extend(extract_all_points(v))
    return points

for k, v in t.items():
    if k != 'thptqg-toan': continue
    typ_name = mapping.get(k, k)
    typ_path = f"/Users/admin/conictypst/sang-math-omr/templates/{typ_name}.typ"
    subprocess.run(["typst", "compile", "--ppi", "144", "--root", "/Users/admin/conictypst", typ_path, "empty_{p}.png"], check=True)
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
    tl = min(quadrants['tl'], key=lambda p: p[0] + p[1])[:2] if quadrants['tl'] else None
    tr = min(quadrants['tr'], key=lambda p: (w - p[0]) + p[1])[:2] if quadrants['tr'] else None
    bl = min(quadrants['bl'], key=lambda p: p[0] + (h - p[1]))[:2] if quadrants['bl'] else None
    br = min(quadrants['br'], key=lambda p: (w - p[0]) + (h - p[1]))[:2] if quadrants['br'] else None
    
    old_H = v['warp']['height']
    pts_src = np.array([tl, tr, br, bl], dtype="float32")
    pts_dst = np.array([[0,0],[1500,0],[1500,old_H],[0,old_H]], dtype="float32")
    M = cv2.getPerspectiveTransform(pts_src, pts_dst)
    warped = cv2.warpPerspective(gray, M, (1500, old_H))
    blurred = cv2.GaussianBlur(warped, (5, 5), 0)
    circles = cv2.HoughCircles(blurred, cv2.HOUGH_GRADIENT, 1, 15, param1=50, param2=15, minRadius=6, maxRadius=22)
    circles = circles[0, :]
    new_bubbles = [(c[0], c[1]) for c in circles]
    
    old_points = extract_all_points(v)
    old_points = [p for p in old_points if isinstance(p, list) and len(p) == 2]
    
    old_tl = min(old_points, key=lambda p: p[0] + p[1])
    new_tl = min(new_bubbles, key=lambda p: p[0] + p[1])
    dx = new_tl[0] - old_tl[0]
    dy = new_tl[1] - old_tl[1]
    
    success = 0
    fail = 0
    for op in old_points:
        expected_x = op[0] + dx
        expected_y = op[1] + dy
        nearest = min(new_bubbles, key=lambda p: (p[0]-expected_x)**2 + (p[1]-expected_y)**2)
        dist = ((nearest[0]-expected_x)**2 + (nearest[1]-expected_y)**2)**0.5
        if dist < 20: 
            success += 1
        else:
            fail += 1
    print(f"Match: success={success}, fail={fail}")
