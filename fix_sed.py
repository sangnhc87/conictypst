import glob
import re

files = glob.glob("typst/sach/de-on-tap-theo-chuong-k12/chuong1-ung-dung-dao-ham/de-on-kiem-tra-chuong-1-de-*.typ")

for path in files:
    with open(path, "r") as f:
        content = f.read()

    # If it was affected by sed, it will have multiple "[3.2],\n  loigiai: ["
    # We will just replace ALL of them back to "loigiai: ["
    content = content.replace("  [3.2],\n  loigiai: [", "  loigiai: [")
    content = content.replace("[3.2],\n  loigiai: [", "loigiai: [")

    # Now add [3.2] ONLY for the airline problem
    # The airline problem looks like:
    # #tln([Một hãng hàng không quy định giá vé khứ hồi... lớn nhất?],
    #   loigiai: [
    
    # We can do this safely using regex
    pattern = re.compile(r'(#tln\(\[Một hãng hàng không.*?lớn nhất\?\],)\s*loigiai: \[', re.DOTALL)
    
    content = pattern.sub(r'\1\n  [3.2],\n  loigiai: [', content)
    
    with open(path, "w") as fw:
        fw.write(content)
    print(f"Fixed {path}")

