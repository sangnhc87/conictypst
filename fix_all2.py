import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    text = text.replace("@preview/sang-math:1.0.6", "@preview/sang-math:1.0.4")
    
    text = text.replace("ad < bc", "a d < b c")
    text = text.replace("4xh", "4x h")
    text = text.replace("integral a(t) dt", "integral a(t) d t")
    
    with open(path, "w") as f:
        f.write(text)
