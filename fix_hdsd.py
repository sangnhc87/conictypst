import re

with open('typst/hdsd-exam.typ', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('\n\n#include "hdsd-phu-luc.typ"\n', '')

with open('typst/hdsd-phu-luc.typ', 'r', encoding='utf-8') as f:
    appendix = f.read()

# Fix markdown stars ** to *
appendix = appendix.replace('**mọi cấu hình tham số**', '*mọi cấu hình tham số*')

text += '\n\n' + appendix

with open('typst/hdsd-exam.typ', 'w', encoding='utf-8') as f:
    f.write(text)

