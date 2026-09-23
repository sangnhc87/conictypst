import re

with open("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-1.typ", "r") as f:
    text = f.read()

# Let's just find anything in the file that might be a dictionary without a body key.
# Actually, the error happens in options.map(o => ...). This means `o` is a dictionary.
# Let's print out all lines containing `tn(` or `ds(` and the following lines.
print("File read.")
