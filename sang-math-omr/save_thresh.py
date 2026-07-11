import cv2
img = cv2.imread("warped_a4.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh_warped = cv2.threshold(gray, 150, 255, cv2.THRESH_BINARY_INV)
cv2.imwrite("thresh_warped_a4.png", thresh_warped)
