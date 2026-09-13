# -*- coding: utf-8 -*-
import sys
import os
import re

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

import header
import ch1
import ch2
import ch3
import ch4
import ch5
import ch6
import ch7
import ch8
import ch9
import ch_special
import appendix

modules = [
    header.CONTENT,
    ch1.CONTENT,
    ch2.CONTENT,
    ch3.CONTENT,
    ch4.CONTENT,
    ch5.CONTENT,
    ch6.CONTENT,
    ch7.CONTENT,
    ch8.CONTENT,
    ch9.CONTENT,
    ch_special.CONTENT,
    appendix.CONTENT,
]

full_text = "\n".join(modules)

# 1. Khắc phục dấu ngoặc kép trong văn bản:
# Biến các dấu *" và "* thành *“ và ”*
full_text = full_text.replace('*"', '*“')
full_text = full_text.replace('"*', '”*')

# Trong các hook-box hoặc text, các dấu " lẻ loi biến thành “ hoặc ”
# Ta dùng hàm thay thế luân phiên " thành “ và ”
def replace_quotes(text):
    # Không thay thế trong các dòng định nghĩa tham số như title: "...", stroke: "...", rgb("...")
    lines = text.split('\n')
    new_lines = []
    in_code_param = re.compile(r'^\s*(#let|#set|title:|author:|stroke:|fill:|rotate:|columns:).*".*"')
    for line in lines:
        if in_code_param.match(line) or 'rgb("' in line or 'font: "' in line or 'paper: "' in line or 'lang: "' in line:
            new_lines.append(line)
        else:
            # Thay thế các cặp dấu " trong dòng này thành “...”
            parts = line.split('"')
            if len(parts) > 1:
                # Nếu số lượng phần tử lẻ (tức số dấu " chẵn), ghép lại luân phiên
                res = []
                for idx, p in enumerate(parts):
                    res.append(p)
                    if idx < len(parts) - 1:
                        res.append('“' if idx % 2 == 0 else '”')
                new_lines.append(''.join(res))
            else:
                new_lines.append(line)
    return '\n'.join(new_lines)

full_text = replace_quotes(full_text)

# 2. Xử lý dấu %:
# Trong Typst:
# - Trong code: width: 100%, line(length: 100%) -> giữ nguyên 100%
# - Trong văn bản: 100% -> $100%$ hoặc 100\\%
def fix_percentages(text):
    lines = text.split('\n')
    new_lines = []
    for line in lines:
        # Nếu dòng chứa width: 100% hoặc length: 100% -> giữ nguyên
        if 'width:' in line or 'length:' in line or 'stroke:' in line:
            new_lines.append(line)
            continue
        
        # Trong các dòng khác, tìm các số đi kèm % như 100%, 50%, 0.1% mà chưa có \
        # thay bằng $...%$ hoặc \%
        # Ta thay (\d+)% thành \1\%
        line = re.sub(r'(\d+)%', r'\1\\%', line)
        line = re.sub(r'(\d+,\d+)%', r'\1\\%', line)
        new_lines.append(line)
    return '\n'.join(new_lines)

full_text = fix_percentages(full_text)

# 3. Sửa lỗi NN^* thành NN^+ hoặc NN
full_text = full_text.replace('NN^*', 'NN^+')

# 4. Sửa các ký hiệu LaTeX còn sót
full_text = full_text.replace(r'\approx', 'approx')
full_text = full_text.replace(r'\le', '<=')
full_text = full_text.replace(r'\ge', '>=')
full_text = full_text.replace(r'\ne', '!=')
full_text = full_text.replace(r'\times', 'times')
full_text = full_text.replace(r'\cdot', 'dot')
full_text = full_text.replace(r'\in', 'in')
full_text = full_text.replace(r'\notin', 'in.not')
full_text = full_text.replace(r'\subset', 'subset')
full_text = full_text.replace(r'\pm', 'plus.minus')
full_text = full_text.replace(r'\circ', 'degree')

output_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "TOAN-10-KHAI-MO-TRI-THUC-TAI-SAO-HOC-BAI-NAY.typ"))

with open(output_path, 'w', encoding='utf-8') as f:
    f.write(full_text)

print(f"Fixed build written to {output_path}")
