# -*- coding: utf-8 -*-
import sys
import os
import importlib

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
import ch10_tu_hoc
import appendix

# Reload all modules to get fresh updated content
for mod in [header, ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8, ch9, ch_special, ch10_tu_hoc, appendix]:
    importlib.reload(mod)

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
    ch10_tu_hoc.CONTENT,
    appendix.CONTENT,
]

full_text = "\n\n#pagebreak()\n\n".join(modules)

# Đảm bảo các ký hiệu LaTeX không bị sót
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

print(f"Assembly completed successfully -> {output_path}")
