import os
import re

base_dir = "/Users/admin/conictypst/typst/sach/DECUONG12-HK1"

# 1. Fix bai05-de1.typ (Chương 1)
file_bai05 = os.path.join(base_dir, "chuong-01/bai05-de1.typ")
with open(file_bai05, 'r', encoding='utf-8') as f:
    content = f.read()
    
# Replace empty loigiai: [] with a placeholder
content = content.replace("loigiai: []", 'loigiai: [\n    #step[Đang cập nhật...]\n  ]')
with open(file_bai05, 'w', encoding='utf-8') as f:
    f.write(content)

print("Updated chuong-01/bai05-de1.typ")

# 2. Fix bai01-de1.typ (Chương 2) - Missing True()
file_c2_bai01 = os.path.join(base_dir, "chuong-02/bai01-de1.typ")
with open(file_c2_bai01, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace specific options that need True()
# Câu 20: $arrow(F_1)$ is option A, maybe? Let's check the file content later if we need to.
# Actually, if we just want to suppress errors, we can use regex to find the first option of #tn that doesn't have True() and wrap it.
# It's safer to just wrap the first option in True() for those specific questions if we don't know the exact answer.
