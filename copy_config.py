import re

with open('typst/sach/day-so-chuong3/_config.typ', 'r', encoding='utf-8') as f:
    c = f.read()

# Thay thế comments
c = c.replace("Dãy số — Chương 3", "Đạo hàm — Chương 5")
c = c.replace("INDIGO", "GREEN")
# Thay thế màu sắc (4338CA -> 15803d)
c = c.replace("#4338CA", "#15803d")
# Thay tên counter
c = c.replace("_day-so-step", "_dao-ham-step")

with open('typst/sach/dao-ham-11/_config.typ', 'w', encoding='utf-8') as f:
    f.write(c)
