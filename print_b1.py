with open("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-1.typ", "r") as f:
    lines = f.readlines()

blocks = []
current = []
for line in lines:
    if line.startswith("#tn(") or line.startswith("#ds(") or line.startswith("#tln("):
        if current:
            blocks.append("".join(current))
        current = [line]
    else:
        current.append(line)
if current:
    blocks.append("".join(current))

print(repr(blocks[1]))
