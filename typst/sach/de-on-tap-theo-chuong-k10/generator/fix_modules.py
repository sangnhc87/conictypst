# -*- coding: utf-8 -*-
import glob
import re

for filepath in sorted(glob.glob('typst/sach/de-on-tap-theo-chuong-k10/generator/*.py')):
    if 'build' in filepath or 'fix' in filepath:
        continue
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Sửa các dòng có *" và "* làm vỡ string
    # Nếu một dòng có *" mà không có "*: thay *" thành *“
    # Nếu một dòng có "* mà không có *": thay "* thành ”*
    # Nếu một dòng có *"..."*: thay thành *“...”*
    lines = content.split('\n')
    new_lines = []
    for line in lines:
        # Nếu dòng là gọi macro #story-box, #hook-box, #tech-box: giữ nguyên title: "..."
        if line.strip().startswith(('#story-box', '#hook-box', '#tech-box', '#block', '#table', '#let', '#set')):
            new_lines.append(line)
            continue
        
        # Sửa *"..."* thành *“...”*
        line = re.sub(r'\*"([^"]+)"\*', r'*“\1”*', line)
        # Sửa *" thành *“
        line = line.replace('*"', '*“')
        # Sửa "* thành ”*
        line = line.replace('"*', '”*')
        
        # Sửa các số % trong text
        if not any(k in line for k in ['width:', 'length:', 'stroke:', 'table']):
            line = re.sub(r'(\d+)%', r'\1\\%', line)
            line = re.sub(r'(\d+,\d+)%', r'\1\\%', line)
        
        # Sửa NN^*
        line = line.replace('NN^*', 'NN^+')
        
        new_lines.append(line)
    
    new_content = '\n'.join(new_lines)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Updated {filepath}")

print("All modules updated cleanly!")
