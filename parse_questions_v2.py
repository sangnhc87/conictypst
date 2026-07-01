import re

files = [
    ("Đề 1", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri.typ"),
    ("Đề 2", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-de-2.typ"),
    ("Đề 3", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-de-3.typ"),
    ("Đề 4", "typst/de-thi-theo-bai/bai-01-don-dieu-cuc-tri-toan-thuc-te.typ")
]

all_content = []

for de_name, filepath in files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Remove #exam-part(...) blocks
    # A simple regex works because exam-part usually has a single [...] argument with no nested parens
    content = re.sub(r'#exam-part\([\s\S]*?\)\n*', '', content)
    
    # Replace the macro calls
    content = content.replace('#tn(', f'#lt-tn(de: "{de_name}", ')
    content = content.replace('#ds(', f'#lt-ds(de: "{de_name}", ')
    content = content.replace('#tln(', f'#lt-tln(de: "{de_name}", ')
    
    # Also some files might use #tn( \n instead of #tn(
    content = re.sub(r'#tn\s*\(', f'#lt-tn(de: "{de_name}", ', content)
    content = re.sub(r'#ds\s*\(', f'#lt-ds(de: "{de_name}", ', content)
    content = re.sub(r'#tln\s*\(', f'#lt-tln(de: "{de_name}", ', content)
    
    # Remove any imports from the exam file (e.g. #import "../sang-exam.typ": *)
    content = re.sub(r'#import\s+.*?\n', '', content)
    
    all_content.append(content)

with open('typst/beamer/extracted_questions_v2.typ', 'w', encoding='utf-8') as f:
    f.write("\n".join(all_content))

print("Extraction v2 complete.")
