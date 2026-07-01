import os
import glob
import re

files = glob.glob('/Users/admin/conictypst/typst/giao-an/khoi-*/giao-an-tn-bai01.typ')

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Remove colon
    content = content.replace('#mt-hd: [', '#mt-hd[')
    content = content.replace('#nd-hd: [', '#nd-hd[')
    content = content.replace('#sp-hd: [', '#sp-hd[')
    content = content.replace('#tc-hd: [', '#tc-hd[')
    
    with open(file, 'w', encoding='utf-8') as f:
        f.write(content)
        
print("Fixed macros in 3 files.")
