import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()
    
    if "sm-ve-hinh" in content or "sm-hop-chu-nhat" in content or "sm-tru" in content:
        print(f"Still found broken tags in {path}")
    if "AB = 10" in content or "AB = 3" in content:
        print(f"Still found AB without quotes in {path}")
