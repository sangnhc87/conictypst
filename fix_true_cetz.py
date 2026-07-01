import os
import re

files_to_fix = [
    "typst/beamer/beamer-12-bai-2-gtln-gtnn-cua-ham-so.typ",
    "typst/beamer/beamer-12-bai-3-duong-tiem-can.typ",
    "typst/beamer/beamer-12-bai-4-khao-sat-ve-dothi.typ",
    "typst/beamer/beamer-12-bai-5-ung-dung-thuc-tien.typ",
    "typst/beamer/beamer-12-bai-6-tiep-tuyen-tuong-giao.typ",
]

for file in files_to_fix:
    if not os.path.exists(file):
        continue
    
    with open(file, "r", encoding="utf-8") as f:
        content = f.read()
    
    # 1. Update cetz version
    content = content.replace('@preview/cetz:0.3.4', '@preview/cetz:0.5.2')
    
    # 2. Update True(body)
    content = content.replace('#let True(body) = body', '#let True(body) = (true: true, body: body)')
    
    with open(file, "w", encoding="utf-8") as f:
        f.write(content)
        
print("Updated True() macro and cetz version in all files.")
