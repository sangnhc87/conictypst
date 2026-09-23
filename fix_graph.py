import re

path = "typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-6.typ"
with open(path, "r") as f:
    text = f.read()

idx = text.find("#align(center)[")
if idx != -1:
    text = text[:idx] + "]\n)\n"

with open(path, "w") as f:
    f.write(text)
