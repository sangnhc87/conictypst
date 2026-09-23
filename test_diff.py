with open("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-1.typ", "r") as f:
    text = f.read()

idx = text.find("#tn")
b1 = text[idx:]
idx2 = b1.find("#tn", 1)
b1 = b1[:idx2]

print("BLOCK 1 IN FILE:")
print(repr(b1))
