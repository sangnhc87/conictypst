import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    # Insert True definition after imports
    target = '#import "../../../../public/hdsd/typst/sang-math-geom.typ": *\n'
    replacement = target + '#let True(body) = (body: body, correct: true)\n'
    text = text.replace(target, replacement)
    
    with open(path, "w") as f:
        f.write(text)
