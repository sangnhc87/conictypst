import cv2
import numpy as np

img = cv2.imread('test_thptqg.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

mx, my = img.shape[1] / 2, img.shape[0] / 2
mgx, mgy = img.shape[1] * 0.25, img.shape[0] * 0.20
tl, tr, bl, br = None, None, None, None
tlm, trm, blm, brm = 0, 0, 0, 0

for c in contours:
    area = cv2.contourArea(c)
    if area > 100:
        M = cv2.moments(c)
        if M["m00"] != 0:
            cx = int(M["m10"] / M["m00"])
            cy = int(M["m01"] / M["m00"])
            if cx < mgx and cy < mgy:
                if area > tlm: tlm = area; tl = [cx, cy]
            elif cx > img.shape[1] - mgx and cy < mgy:
                if area > trm: trm = area; tr = [cx, cy]
            elif cx < mgx and cy > img.shape[0] - mgy:
                if area > blm: blm = area; bl = [cx, cy]
            elif cx > img.shape[1] - mgx and cy > img.shape[0] - mgy:
                if area > brm: brm = area; br = [cx, cy]

print("Found markers:", tl, tr, br, bl)

pts_src = np.array([tl, tr, br, bl], dtype="float32")
pts_dst = np.array([[96, 102], [904, 102], [904, 1398], [96, 1398]], dtype="float32")

# We want to map from 1000x1500 space back to original image space
M_inv = cv2.getPerspectiveTransform(pts_dst, pts_src)

def draw_bubble(cx, cy):
    pt = np.array([[[cx, cy]]], dtype="float32")
    orig_pt = cv2.perspectiveTransform(pt, M_inv)
    ox, oy = int(orig_pt[0][0][0]), int(orig_pt[0][0][1])
    cv2.circle(img, (ox, oy), 8, (0, 0, 0), -1)

# Let's fill some SBD (e.g. 1 2 3 4)
# SBD cols 0 to 3, row 1, 2, 3, 4
sbd = [
      [[206,249],[229,249],[251,249],[274,249]],
      [[206,271],[229,271],[251,271],[274,271]],
      [[206,294],[229,294],[251,294],[274,294]],
      [[206,317],[229,317],[251,317],[274,317]],
      [[206,340],[229,340],[251,340],[274,340]],
]
draw_bubble(sbd[1][0][0], sbd[1][0][1])
draw_bubble(sbd[2][1][0], sbd[2][1][1])
draw_bubble(sbd[3][2][0], sbd[3][2][1])
draw_bubble(sbd[4][3][0], sbd[4][3][1])

# Fill some MCQ (e.g. q1=A, q2=B)
mcq = {
      "1": [[86,564],[125,564],[165,564],[204,564]],
      "2": [[86,586],[125,586],[165,586],[204,586]]
}
draw_bubble(mcq["1"][0][0], mcq["1"][0][1])
draw_bubble(mcq["2"][1][0], mcq["2"][1][1])

# Fill TF (q13: a=D, b=S)
tf = {
      "13": [[[89,694],[116,694]], [[89,716],[116,716]]]
}
draw_bubble(tf["13"][0][0][0], tf["13"][0][0][1]) # Đ
draw_bubble(tf["13"][1][1][0], tf["13"][1][1][1]) # S

# Fill TLN (q17 = 2.5) -> col 0 = 2, col 1 = ., col 2 = 5
tln_int = [[[80,964],[99,964],[118,964],[137,964]],[[80,981],[99,981],[118,981],[137,981]],[[80,998],[99,998],[118,998],[137,998]]]
tln_dec = [[[148,964],[162,964]],[[148,981],[162,981]],[[148,998],[162,998]],[[148,1015],[162,1015]],[[148,1032],[162,1032]],[[148,1049],[162,1049]]]

draw_bubble(tln_int[2][0][0], tln_int[2][0][1]) # 2
draw_bubble(tln_dec[5][0][0], tln_dec[5][0][1]) # 5

cv2.imwrite('test_thptqg_filled.png', img)
print("Saved test_thptqg_filled.png")
