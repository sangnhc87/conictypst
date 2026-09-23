import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    content = content.replace("4xh", "4x h")
    content = content.replace("\approx", "approx")
    content = content.replace("S_d", 'S_"d"')
    
    with open(path, "w") as fw:
        fw.write(content)
