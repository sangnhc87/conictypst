import cv2
import numpy as np
img = cv2.imread('test8.png')
red_pixels = np.sum(np.all(img == [0, 34, 204], axis=-1)) # OpenCV is BGR: #cc2200 -> (0x00, 0x22, 0xcc) -> (0, 34, 204)
black_pixels = np.sum(np.all(img == [0, 0, 0], axis=-1))
print("Red pixels:", red_pixels)
print("Black pixels:", black_pixels)
