with open("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-1.typ", "r") as f:
    text = f.read()

idx1 = text.find("#tn")
idx2 = text.find("#tn", idx1 + 1)
print(text[idx1:idx2])
