# -*- coding: utf-8 -*-

with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch6.py', 'r', encoding='utf-8') as f:
    t6 = f.read()

t6 = t6.replace('phòng họp của phương trình?”*', 'phòng họp của phương trình?”')
with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch6.py', 'w', encoding='utf-8') as f:
    f.write(t6)

with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch_special.py', 'r', encoding='utf-8') as f:
    ts = f.read()

ts = ts.replace('đều cùng màu!”*', 'đều cùng màu!”')
with open('typst/sach/de-on-tap-theo-chuong-k10/generator/ch_special.py', 'w', encoding='utf-8') as f:
    f.write(ts)

print("Fixed the 2 trailing asterisks!")
