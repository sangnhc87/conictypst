import re

for i in range(1, 6):
    path = f"typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-kiem-tra-chuong-1-de-{i}.typ"
    with open(path, "r") as f:
        text = f.read()
    
    text = re.sub(r'False\(\[(.*?)\]\)', r'[\1]', text)
    
    with open(path, "w") as f:
        f.write(text)
