import os
import re
import glob
import json

source_dir = "/Users/admin/stexgv/src/engine/source_data"
output_file = "/Users/admin/conictypst/public/js/typst_bank.js"

if not os.path.exists(os.path.dirname(output_file)):
    os.makedirs(os.path.dirname(output_file))

def parse_latex(content):
    # Trích xuất nội dung trong \begin{ex} ... \end{ex}
    ex_match = re.search(r'\\begin\{ex\}(.*?)\\end\{ex\}', content, re.DOTALL)
    if not ex_match:
        return content
    
    ex_content = ex_match.group(1).strip()
    
    # Lấy lời giải
    loigiai = ""
    loigiai_match = re.search(r'\\loigiai\{(.*?)\}$', ex_content, re.DOTALL)
    if loigiai_match:
        loigiai = loigiai_match.group(1).strip()
        # Loại bỏ \loigiai khỏi ex_content
        ex_content = ex_content[:loigiai_match.start()].strip()
    
    # Nhận diện loại câu hỏi
    if '\\choiceTF' in ex_content:
        # Tách question và choices
        parts = ex_content.split('\\choiceTF')
        question = parts[0].strip()
        choices_str = parts[1].strip()
        
        # Tìm tất cả các cặp {} cho 4 lựa chọn
        # Sử dụng một hàm parse để lấy đúng các khối ngoặc nhọn
        choices = re.findall(r'\{(.*?)\}', choices_str, re.DOTALL)
        
        # Chuyển đổi choice
        typst_choices = []
        for c in choices[:4]:
            if '\\True' in c:
                clean_c = c.replace('\\True', '').strip()
                typst_choices.append(f'True([{clean_c}])')
            else:
                typst_choices.append(f'[{c.strip()}]')
        
        choices_block = ",\n    ".join(typst_choices)
        
        out = f"#ds([{question}],\n  (\n    {choices_block}\n  )"
        if loigiai:
            out += f",\n  loigiai: [\n    {loigiai}\n  ]"
        out += "\n)"
        return out
        
    elif '\\choice' in ex_content:
        parts = ex_content.split('\\choice')
        question = parts[0].strip()
        choices_str = parts[1].strip()
        
        choices = re.findall(r'\{(.*?)\}', choices_str, re.DOTALL)
        
        typst_choices = []
        for c in choices[:4]:
            if '\\True' in c:
                clean_c = c.replace('\\True', '').strip()
                typst_choices.append(f'True([{clean_c}])')
            else:
                typst_choices.append(f'[{c.strip()}]')
        
        choices_block = ", ".join(typst_choices)
        
        out = f"#tn([{question}], ({choices_block})"
        if loigiai:
            out += f", loigiai: [\n  {loigiai}\n]"
        out += ")"
        return out
        
    elif '\\shortans' in ex_content:
        parts = ex_content.split('\\shortans')
        question = parts[0].strip()
        ans_match = re.search(r'\{(.*?)\}', parts[1], re.DOTALL)
        ans = ans_match.group(1).strip() if ans_match else ""
        
        out = f"#tln([{question}], [{ans}], show-boxes: false"
        if loigiai:
            out += f", loigiai: [\n  {loigiai}\n]"
        out += ")"
        return out
        
    else:
        # TL
        question = ex_content.strip()
        out = f"#tl([{question}]"
        if loigiai:
            out += f", loigiai: [\n  {loigiai}\n]"
        out += ")"
        return out

final_data = {}

for js_file in glob.glob(os.path.join(source_dir, "*.js")):
    basename = os.path.basename(js_file).replace('.js', '')
    with open(js_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Tìm tất cả khối { path: ..., content: `...` }
    blocks = re.findall(r'\{\s*path:\s*"(.*?)",\s*content:\s*`(.*?)`\s*\}', content, re.DOTALL)
    
    if not blocks:
        continue
    
    final_data[basename] = []
    for path, tex in blocks:
        try:
            typst_content = parse_latex(tex)
            final_data[basename].append({
                "path": path,
                "content": typst_content
            })
        except Exception as e:
            print(f"Error parsing {path} in {basename}: {e}")

# Save to typst_bank.js
js_out = "const typstBank = " + json.dumps(final_data, ensure_ascii=False, indent=2) + ";\n"
js_out += "if(typeof window !== 'undefined') window.typstBank = typstBank;\n"
with open(output_file, 'w', encoding='utf-8') as f:
    f.write(js_out)

print(f"Successfully converted and wrote to {output_file}")
print(f"Total categories: {len(final_data)}")
