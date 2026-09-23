import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for f in files:
    with open(f, "r") as file:
        content = file.read()
    
    content = content.replace('@preview/sang-math:1.0.4', '@preview/sang-math:1.0.6')
    
    with open(f, "w") as file:
        file.write(content)

