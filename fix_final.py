import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

for path in files:
    with open(path, "r") as f:
        content = f.read()

    # Remove the broken #sm-ve-hinh, #sm-hop-chu-nhat, #sm-tru blocks
    content = re.sub(r'#align\(center\)\[\s*#sm-(ve-hinh|hop-chu-nhat|tru)[\s\S]*?\]\n', '', content)

    # Fix remaining $AB = 10$ and $AB = 3$
    content = content.replace("$AB = 10$", '$\"AB\" = 10$')
    content = content.replace("$AB = 3$", '$\"AB\" = 3$')

    with open(path, "w") as fw:
        fw.write(content)
