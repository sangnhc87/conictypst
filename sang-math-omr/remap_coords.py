import cv2, json, numpy as np, os, subprocess
from collections import Counter

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
        for k, v in obj.items():
            if k == 'warp': continue
            points.extend(extract_all_points(v))
    return points

def update_points(obj, new_points_dict):
    if isinstance(obj, list):
        if len(obj) == 2 and isinstance(obj[0], (int, float)):
            key = f"{obj[0]}_{obj[1]}"
            if key in new_points_dict:
                return new_points_dict[key]
            return obj
        return [update_points(x, new_points_dict) for x in obj]
    elif isinstance(obj, dict):
        return {k: update_points(v, new_points_dict) for k, v in obj.items()}
    return obj

new_t = {}

for k, v in t.items():
    print(f"Processing {k}...")
    typ_name = mapping.get(k, k)
    typ_path = f"/Users/admin/conictypst/sang-math-omr/templates/{typ_name}.typ"
    
    if not os.path.exists(typ_path):
        new_t[k] = v
        continue
        
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
    
    if circles is None:
        print("No circles found!")
        new_t[k] = v
        continue
        
    circles = circles[0, :]
    new_bubbles = [(c[0], c[1]) for c in circles]
    
    old_points = extract_all_points(v)
    old_points = [p for p in old_points if isinstance(p, list) and len(p) == 2]
    
    if not old_points:
        new_t[k] = v
        continue
        
    # Robust shift detection
    best_dx, best_dy = 0, 0
    max_inliers = -1
    
    # To avoid O(N^2) for 500*500 = 250000, which is fast in C++ but slow in Python,
    # we can just use 10 random old points to vote!
    np.random.seed(42)
    sample_old = [old_points[i] for i in np.random.choice(len(old_points), min(20, len(old_points)), replace=False)]
    
    votes = []
    for op in sample_old:
        for nb in new_bubbles:
            dx = nb[0] - op[0]
            dy = nb[1] - op[1]
            if abs(dx) < 100 and abs(dy) < 500: # reasonable limits
                votes.append((round(dx/5)*5, round(dy/5)*5)) # Bin by 5 pixels
                
    vote_counts = Counter(votes)
    if not vote_counts:
        print("No valid shift found within bounds!")
        new_t[k] = v
        continue
        
    best_bin = vote_counts.most_common(1)[0][0]
    
    # Now refine around best_bin
    best_dx, best_dy = best_bin[0], best_bin[1]
    inliers = 0
    refined_dx, refined_dy = 0, 0
    
    for op in old_points:
        expected_x = op[0] + best_dx
        expected_y = op[1] + best_dy
        nearest = min(new_bubbles, key=lambda p: (p[0]-expected_x)**2 + (p[1]-expected_y)**2)
        dist = ((nearest[0]-expected_x)**2 + (nearest[1]-expected_y)**2)**0.5
        if dist < 25:
            inliers += 1
            refined_dx += (nearest[0] - op[0])
            refined_dy += (nearest[1] - op[1])
            
    if inliers > 0:
        best_dx = refined_dx / inliers
        best_dy = refined_dy / inliers
        
    print(f"Shift for {k}: dx={best_dx:.1f}, dy={best_dy:.1f}, Inliers: {inliers}/{len(old_points)}")
    
    new_points_dict = {}
    success = 0
    for op in old_points:
        expected_x = op[0] + best_dx
        expected_y = op[1] + best_dy
        
        nearest = min(new_bubbles, key=lambda p: (p[0]-expected_x)**2 + (p[1]-expected_y)**2)
        dist = ((nearest[0]-expected_x)**2 + (nearest[1]-expected_y)**2)**0.5
        
        if dist < 20: 
            new_points_dict[f"{op[0]}_{op[1]}"] = [round(float(nearest[0]), 1), round(float(nearest[1]), 1)]
            success += 1
        else:
            new_points_dict[f"{op[0]}_{op[1]}"] = [round(float(expected_x), 1), round(float(expected_y), 1)]
            
    print(f"Matched {success}/{len(old_points)} bubbles perfectly.")
    new_v = update_points(v, new_points_dict)
    new_t[k] = new_v

with open('templates.json', 'w') as f:
    json.dump(new_t, f, indent=2)

print("Done generating templates.json")
