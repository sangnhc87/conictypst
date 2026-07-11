import cv2

img = cv2.imread("sheet_img-1.png")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

h, w = thresh.shape
print(f"Top-Left: {thresh[0:50, 0:50].sum() // 255} pixels")
print(f"Top-Right: {thresh[0:50, w-50:w].sum() // 255} pixels")
print(f"Bottom-Left: {thresh[h-50:h, 0:50].sum() // 255} pixels")
print(f"Bottom-Right: {thresh[h-50:h, w-50:w].sum() // 255} pixels")

# Find bounding rect of all white pixels in Top-Left 100x100
pts = cv2.findNonZero(thresh[0:100, 0:100])
if pts is not None:
    x, y, w, h = cv2.boundingRect(pts)
    print(f"Top-Left marker rect: x={x}, y={y}, w={w}, h={h}")
