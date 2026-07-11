import cv2
import json

def get_anchors(warped_gray):
    _, thresh_w = cv2.threshold(warped_gray, 200, 255, cv2.THRESH_BINARY_INV)
    cnts, _ = cv2.findContours(thresh_w, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    anchors = []
    for c in cnts:
        x, y, bw, bh = cv2.boundingRect(c)
        area = cv2.contourArea(c)
        if area > 80 and area < 500:
            ar = bw / float(bh)
            extent = area / float(bw*bh)
            if extent > 0.8:
                anchors.append((int(x + bw/2), int(y + bh/2)))
    
    # remove duplicates (sometimes multiple contours for same box)
    unique_anchors = []
    for a in anchors:
        found = False
        for u in unique_anchors:
            if abs(a[0]-u[0]) < 10 and abs(a[1]-u[1]) < 10:
                found = True
                break
        if not found:
            unique_anchors.append(a)
            
    return sorted(unique_anchors, key=lambda p: (p[1], p[0])) # sort by y, then x
