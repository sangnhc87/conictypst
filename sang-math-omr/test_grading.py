import cv2, json, numpy as np

def find_markers(gray):
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
    return tl, tr, br, bl

img = cv2.imread("mock_new_12-4-6ngang.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

with open('templates.json') as f:
    t = json.load(f)

tpl = t['12-4-6ngang']
warpW = int(tpl['warp']['width'])
warpH = int(tpl['warp']['height'])
TL = tpl['warp']['TL']
TR = tpl['warp']['TR']
BR = tpl['warp']['BR']
BL = tpl['warp']['BL']

tl, tr, br, bl = find_markers(gray)
print(f"Detected markers: tl={tl}, tr={tr}, br={br}, bl={bl}")

pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([TL, TR, BR, BL], dtype="float32")
M = cv2.getPerspectiveTransform(pts_src, pts_dst)

warped = cv2.warpPerspective(img, M, (warpW, warpH))
gray_warped = cv2.cvtColor(warped, cv2.COLOR_BGR2GRAY)
thresh_warped = cv2.adaptiveThreshold(gray_warped, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, 31, 15)

def read_bubble_col(coords, radius=5):
    counts = []
    for pt in coords:
        if not pt: continue
        cx, cy = pt
        x = max(0, int(cx - radius))
        y = max(0, int(cy - radius))
        w = radius * 2
        h = radius * 2
        
        # print roi slice
        roi = thresh_warped[y:y+h, x:x+w]
        count = cv2.countNonZero(roi)
        counts.append(count)
    return counts

print("\n--- SBD ---")
for col_idx, col in enumerate(tpl['sbd']):
    counts = read_bubble_col(col, radius=5)
    print(f"Col {col_idx+1}: {counts}")
    
print("\n--- Mã Đề ---")
for col_idx, col in enumerate(tpl['made']):
    counts = read_bubble_col(col, radius=5)
    print(f"Col {col_idx+1}: {counts}")
