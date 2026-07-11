import cv2
img = cv2.imread("warped_a4.png")
sbd_crop = img[50:350, 50:400]
cv2.imwrite("sbd_crop.png", sbd_crop)
