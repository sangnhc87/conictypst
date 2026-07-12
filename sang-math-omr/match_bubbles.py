import cv2
import numpy as np

img = cv2.imread('warped_ds20-tln10-ngang-300.png', cv2.IMREAD_GRAYSCALE)

# We know bubbles are circles. Let's find one bubble to use as a template.
# A bubble is roughly 22x22 pixels at 300 ppi. Let's just create a generic bubble template.
# The bubble has radius 4.5pt. At 300ppi, 4.5pt = 4.5 * 300 / 72 = 18.75 pixels. So diameter is ~38 pixels.
# Let's use HoughCircles to find one good bubble!
circles = cv2.HoughCircles(img, cv2.HOUGH_GRADIENT, dp=1.2, minDist=20,
                           param1=50, param2=20, minRadius=15, maxRadius=22)

if circles is not None:
    circles = np.round(circles[0, :]).astype("int")
    # Take the first circle to use as template
    cx, cy, r = circles[0]
    template = img[cy-r-2:cy+r+2, cx-r-2:cx+r+2]
    
    # Template matching
    res = cv2.matchTemplate(img, template, cv2.TM_CCOEFF_NORMED)
    threshold = 0.6
    loc = np.where(res >= threshold)
    
    bubbles = []
    # NMS
    for pt in zip(*loc[::-1]):
        px, py = pt[0] + r + 2, pt[1] + r + 2
        # Check if overlaps with existing
        overlap = False
        for bx, by in bubbles:
            if abs(px - bx) < 15 and abs(py - by) < 15:
                overlap = True
                break
        if not overlap:
            bubbles.append((px, py))
            
    print(f"Matched {len(bubbles)} bubbles")
    
    out = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)
    for bx, by in bubbles:
        cv2.circle(out, (bx, by), 10, (0, 255, 0), 2)
    cv2.imwrite('debug_match.png', out)
