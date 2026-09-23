with open("typst/sach/de-on-tap-theo-chuong-k10/chuong6-ham-so-do-thi-va-ung-dung/de19C.typ", "r") as f:
    text = f.read()

idx = text.find("#tn(")
print(text[idx:idx+300])

