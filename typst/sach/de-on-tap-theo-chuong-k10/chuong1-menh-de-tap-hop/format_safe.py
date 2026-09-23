import re

def safe_format(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    out = []
    i = 0
    while i < len(content):
        idx = content.find('loigiai: [', i)
        if idx == -1:
            out.append(content[i:])
            break
        
        start_bracket = idx + len('loigiai: ')
        out.append(content[i:start_bracket+1])
        
        depth = 1
        j = start_bracket + 1
        while j < len(content) and depth > 0:
            if content[j] == '[':
                depth += 1
            elif content[j] == ']':
                depth -= 1
            j += 1
            
        end_bracket = j - 1
        inner_content = content[start_bracket+1:end_bracket]
        
        lines = inner_content.split('\n')
        new_lines = []
        for line in lines:
            s = line.strip()
            if s and not s.startswith('-') and not s.startswith('#') and not s.startswith('//'):
                # Match uppercase letters (including Vietnamese) or $ or typical words
                if re.match(r'^([A-ZĐÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴ]|\$|Vì|Do|Ta|Từ|Vậy|Nếu|Với|Theo|Các|Số|Mệnh|Tập|Phần|Trong|Để|Phương|Giải|Cấu|Chiều|Hai|Đây|Phản|Gọi|Khoảng|Dựa|Giao|Hợp|Biểu|Ký|Khi|Nên|Hoặc|Hay|Mà|Tuy|Nhưng|Xét|Tại|Cho)', s):
                    indent = len(line) - len(line.lstrip())
                    new_lines.append(' ' * indent + '- ' + s)
                    continue
            new_lines.append(line)
            
        out.append('\n'.join(new_lines))
        out.append(']')
        i = end_bracket + 1
        
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write("".join(out))

safe_format('de01A.typ')
safe_format('de02A.typ')
