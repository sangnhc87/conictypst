import cv2
import numpy as np
import pytesseract

img = cv2.imread('warped_ds20-tln10-ngang-300.png')
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

data = pytesseract.image_to_data(gray, lang='vie', output_type=pytesseract.Output.DICT)

for i in range(len(data['text'])):
    text = data['text'][i]
    if "PHẦN" in text.upper():
        print(f"Found {text} at y={data['top'][i]}")
