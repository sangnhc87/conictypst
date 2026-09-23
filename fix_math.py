import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    # 1. \max -> max
    text = text.replace(r"\max", "max")
    text = text.replace(r"\min", "min")
    
    # 2. ad -> a d, bc -> b c
    text = text.replace("ad - bc", "a d - b c")
    
    # 3. Ox, Oy
    text = text.replace("Ox", "O x")
    text = text.replace("Oy", "O y")
    
    # 4. SH, SO, MN, AD, BD
    text = text.replace("SH", "S H")
    text = text.replace("SO", "S O")
    text = text.replace("MN", "M N")
    text = text.replace("AD", "A D")
    text = text.replace("BD", "B D")
    
    # 5. cm in math
    text = text.replace("60 cm times 40 cm", '60 "cm" times 40 "cm"')
    text = text.replace("30 cm times 20 cm", '30 "cm" times 20 "cm"')
    
    # Check for other multi-letter math vars, like "lim" wait "lim" is built-in.
    # What about "ln"? It's built-in.
    
    with open(path, "w") as f:
        f.write(text)
