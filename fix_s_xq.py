import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    # Fix S_{xq} to S_"xq"
    content = content.replace("S_{xq}", 'S_\"xq\"')
    
    with open(path, "w") as fw:
        fw.write(content)
