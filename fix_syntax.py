import re

path = "typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-6.typ"
with open(path, "r") as f:
    text = f.read()

text = text.replace("$HM = x$", '$"HM" = x$')
text = text.replace("quãng đường HM", 'quãng đường "HM"')
text = text.replace("x = \\pm 1", 'x = +- 1')
text = text.replace("x = pm 1", 'x = +- 1')

with open(path, "w") as f:
    f.write(text)
