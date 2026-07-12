import cv2
import numpy as np

img_tln = cv2.imread('warped_tln-10-ngang-300.png', cv2.IMREAD_GRAYSCALE)
img_combined = cv2.imread('warped_ds20-tln10-ngang-300.png', cv2.IMREAD_GRAYSCALE)

# The first TLN question in tln-10-ngang is around x=100..300, y=400..600
# We know the exact first bubble for TLN is at (181, 490) in tln-10-ngang.
# Let's crop a template from tln-10-ngang around (181, 490)
# say x: 150-250, y: 460-560
template = img_tln[460:560, 150:250]

res = cv2.matchTemplate(img_combined, template, cv2.TM_CCOEFF_NORMED)
_, max_val, _, max_loc = cv2.minMaxLoc(res)

print(f"Max match: {max_val} at {max_loc}")
# The Y shift is max_loc[1] - 460
print(f"Y shift: {max_loc[1] - 460}")

