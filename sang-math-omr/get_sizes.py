import cv2
for i in range(1, 4):
    try:
        img = cv2.imread(f"sheet_img-{i}.png")
        print(f"Page {i}: {img.shape}")
    except:
        pass
