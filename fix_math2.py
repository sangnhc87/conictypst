import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    text = text.replace("ax^3", "a x^3")
    text = text.replace("bx^2", "b x^2")
    text = text.replace("cx + d", "c x + d")
    text = text.replace("O x dương", 'O x "dương"')
    
    with open(path, "w") as f:
        f.write(text)
