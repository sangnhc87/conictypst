import re
import glob

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")
for path in files:
    with open(path, "r") as f:
        content = f.read()

    # Fix xy
    content = content.replace("$xy = 96", "$x y = 96")
    content = content.replace("$xy = 384", "$x y = 384")
    content = content.replace("$xy = 150", "$x y = 150")

    # Fix two-letter segments like AM, BM, MC, AB, BC, etc.
    # Be careful not to replace them inside words. They are inside $ $
    content = re.sub(r'\$(.*?)(AM|BM|MC|AB|BC|C_1|S_d|S_{xq})(.*?)\$',
                     lambda m: "$" + m.group(1).replace(m.group(2), f'"{m.group(2)}"') + m.group(2) + m.group(3) + "$",
                     content)

    # Actually, the safest way is to just quote them directly:
    content = content.replace("$BM", '$\"BM\"')
    content = content.replace("BM^2", '\"BM\"^2')
    content = content.replace("BM=", '\"BM\"=')
    content = content.replace("AM =", '\"AM\" =')
    content = content.replace("MC =", '\"MC\" =')
    content = content.replace("AB=", '\"AB\"=')
    content = content.replace("BC =", '\"BC\" =')
    content = content.replace("AB^2", '\"AB\"^2')
    content = content.replace("BM = x", '\"BM\" = x')
    
    with open(path, "w") as fw:
        fw.write(content)
