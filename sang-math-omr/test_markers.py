import cv2

img = cv2.imread("sheet_img-1.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

contours, _ = cv2.findContours(thresh, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
for cnt in contours:
    x, y, w, h = cv2.boundingRect(cnt)
    if w > 20 and h > 20 and w < 50 and h < 50:
        print(f"w={w}, h={h}, x={x}, y={y}, area={cv2.contourArea(cnt)}")
