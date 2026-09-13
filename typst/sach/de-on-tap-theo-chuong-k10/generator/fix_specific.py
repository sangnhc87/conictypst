# -*- coding: utf-8 -*-

# 1. Fix ch6.py
with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch6.py', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('$arrow 1 = -1 "! Một điều', '$arrow 1 = -1$! Một điều')
text = text.replace('nhưng khi áp dụng vào đời thực sẽ sụp đổ hoàn toàn!"', 'nhưng khi áp dụng vào đời thực sẽ sụp đổ hoàn toàn!”')

with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch6.py', 'w', encoding='utf-8') as f:
    f.write(text)

# 2. Fix ch_special.py
with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch_special.py', 'r', encoding='utf-8') as f:
    text2 = f.read()

text2 = text2.replace('${H_1, H_2, ..., H_k, H_(k+1)}$', '`{H_1, H_2, ..., H_k, H_(k+1)}`')
text2 = text2.replace('${H_1, ..., H_k}$', '`{H_1, ..., H_k}`')
text2 = text2.replace('${H_2, ..., H_(k+1)}$', '`{H_2, ..., H_(k+1)}`')
text2 = text2.replace('${H_2, ..., H_k}$', '`{H_2, ..., H_k}`')
text2 = text2.replace('${H_1, H_2}$', '`{H_1, H_2}`')
text2 = text2.replace('${H_1}$', '`{H_1}`')
text2 = text2.replace('${H_2}$', '`{H_2}`')

with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch_special.py', 'w', encoding='utf-8') as f:
    f.write(text2)

print("Fixed ch6 and ch_special specific issues!")
