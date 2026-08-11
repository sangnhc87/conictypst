import json
import re

# 1. Update window.TEMPLATES
with open('sang-math-omr/a3_template.json', 'r') as f:
    a3_data = json.load(f)

with open('sang-math-omr/index.html', 'r') as f:
    content = f.read()

# Append a3-cat-phach to window.TEMPLATES if not there
if '"a3-cat-phach"' not in content:
    # Find the end of window.TEMPLATES = { ... };
    idx = content.find('window.TEMPLATES = {')
    if idx != -1:
        brace_count = 0
        in_block = False
        end_idx = -1
        for i in range(idx, len(content)):
            if content[i] == '{':
                brace_count += 1
                in_block = True
            elif content[i] == '}':
                brace_count -= 1
            if in_block and brace_count == 0:
                end_idx = i
                break
        
        if end_idx != -1:
            # We insert before the last brace
            new_str = ', "a3-cat-phach": ' + json.dumps(a3_data, indent=None, separators=(',', ':'))
            content = content[:end_idx] + new_str + content[end_idx:]

# 2. Add to dropdown
if '<option value="a3-cat-phach">A3 - Cắt phách</option>' not in content:
    content = content.replace('<option value="thptqg-toan">THPTQG - Toán 2025</option>', '<option value="thptqg-toan">THPTQG - Toán 2025</option>\n            <option value="a3-cat-phach">A3 - Cắt phách</option>')

# 3. Inject getWasmTypstSource
with open('sang-math-omr/templates/a3-cat-phach-full.typ', 'r') as f:
    typ_code = f.read()

typ_code = typ_code.replace('*SỞ GIÁO DỤC VÀ ĐÀO TẠO ...*\\\n        *TRƯỜNG THPT ...*', '*${school}*')
typ_code = typ_code.replace('*KỲ THI ...*\\\n        *NĂM HỌC 202... - 202...*', '*${subtitle}*')
typ_code = typ_code.replace('\\', '\\\\').replace('`', '\\`').replace('$', '\\$').replace('\\${school}', '${school}').replace('\\${subtitle}', '${subtitle}')

injection = f'''        if (type === 'a3-cat-phach') {{
            return `{typ_code}`;
        }}
'''

target_str = 'function getWasmTypstSource(type, school, subtitle, hasEssay = true) {\n'
idx = content.find(target_str)
if idx != -1 and "type === 'a3-cat-phach'" not in content[idx:idx+200]:
    content = content[:idx+len(target_str)] + injection + content[idx+len(target_str):]

with open('sang-math-omr/index.html', 'w') as f:
    f.write(content)
print("Updated index.html")
