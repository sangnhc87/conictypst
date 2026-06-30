import re
import os

for filename in ['giao-an-10-bai-2-tap-hop.typ', 'giao-an-10-bai-3-bpt-bac-nhat-2-an.typ']:
    path = f'typst/giao-an/khoi-10/{filename}'
    with open(path, 'r') as f:
        content = f.read()
    
    # Fix stray =]
    content = re.sub(r'=\s*\]', ']', content)
    
    # Fix unreplaced mt-hd, nd-hd, sp-hd, tc-hd due to formatting variants
    content = re.sub(r'-\s*#strong\[?a\)\s*Mục tiêu.*?\]:?', '#mt-hd[', content, flags=re.IGNORECASE)
    content = re.sub(r'-\s*#strong\[?b\)\s*Nội dung.*?\]:?', ']\n#nd-hd[', content, flags=re.IGNORECASE)
    content = re.sub(r'-\s*#strong\[?c\)\s*Sản phẩm.*?\]:?', ']\n#sp-hd[', content, flags=re.IGNORECASE)
    content = re.sub(r'-\s*#strong\[?d\)\s*Tổ chức thực hiện.*?\]:?', ']\n#tc-hd[', content, flags=re.IGNORECASE)
    
    # Fix ending bracket if missing or extra
    content = content.replace('\n]\n\n]', '\n]')
    content = content.replace('\n]\n]', '\n]')
    
    with open(path, 'w') as f:
        f.write(content)
